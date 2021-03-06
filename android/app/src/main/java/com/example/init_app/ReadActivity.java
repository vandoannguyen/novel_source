package com.example.init_app;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import androidx.core.content.ContextCompat;

import com.example.init_app.pageview_utils.page.PageLoader;
import com.example.init_app.pageview_utils.page.PageView;
import com.example.init_app.pageview_utils.page.ReadSettingDialog;
import com.example.init_app.pageview_utils.page.ReadSettingManager;
import com.example.init_app.pageview_utils.page.TxtChapter;
import com.example.init_app.utils.BrightnessUtils;
import com.example.init_app.utils.StringUtils;
import com.example.init_app.utils.SystemBarUtils;

import java.util.List;

import static android.view.View.GONE;
import static android.view.View.LAYER_TYPE_SOFTWARE;
import static android.view.View.VISIBLE;

public class ReadActivity extends Activity {
    private static final String TAG = "ReadActivity";
    static final String ONEADX_KEY = "gmBUYwLTV2VDu5Y8Dg5S9WpuaNDZvRaZ";

    PageView mPvPage;
    SeekBar mSbChapterProgress;
    LinearLayout mLlBottomMenu;
    RelativeLayout mAblTopMenu;
    TextView mTvSetting;
    TextView mTvNightMode;
    TextView mTvLitsChap;
    ImageView mImageBack;


    PageLoader mPageLoader;
    private Animation mTopInAnim;
    private Animation mTopOutAnim;
    private Animation mBottomInAnim;
    private Animation mBottomOutAnim;
    private String title = "";
    private String content = "";
    private boolean isFullScreen = false;
    private ReadSettingDialog mSettingDialog;
    private boolean isNightMode = false;
    private String userToken = "";
    private String novelId = "";
    private int page = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getActionBar().hide();
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_read);
        title = getIntent().getStringExtra("title");
        content = getIntent().getStringExtra("content");
        page = 1;
        init();
    }

    private void init() {
        initView();
    }

    private void initView() {
        Log.e(TAG, "initView: 1" + "sssldkfjlsdfjlsdjflskdjflksdjf");

        mPvPage = findViewById(R.id.read_pv_page);
        mSbChapterProgress = findViewById(R.id.read_sb_chapter_progress);
        mLlBottomMenu = findViewById(R.id.read_ll_bottom_menu);
        mAblTopMenu = findViewById(R.id.read_abl_top_menu);
        mTvSetting = findViewById(R.id.read_tv_setting);
        mTvNightMode = findViewById(R.id.read_tv_night_mode);
        mImageBack = findViewById(R.id.imgBack);
        mTvLitsChap = findViewById(R.id.read_tv_category);
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.JELLY_BEAN_MR2
                && Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
            mPvPage.setLayerType(LAYER_TYPE_SOFTWARE, null);
        }
        mPageLoader = mPvPage.getPageLoader(title, content);
//        mPageLoader.setMargin(30, 30);
        mSettingDialog = new ReadSettingDialog(this, mPageLoader);
        //????????????
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(Intent.ACTION_BATTERY_CHANGED);
        intentFilter.addAction(Intent.ACTION_TIME_TICK);
        registerReceiver(mReceiver, intentFilter);
        //????????????Activity???Brightness
        if (ReadSettingManager.getInstance(this).isBrightnessAuto()) {
//            BrightnessUtils.setDefaultBrightness(this);
            BrightnessUtils.setBrightness(this, BrightnessUtils.getScreenBrightness(this));
//              Log.e(TAG, "initView: 2" + "sssldkfjlsdfjlsdjflskdjflksdjf");
        } else {
            BrightnessUtils.setBrightness(this, ReadSettingManager.getInstance(this).getBrightness(BrightnessUtils.getScreenBrightness(this)));
//            Log.e(TAG, "initView: 3" + "sssldkfjlsdfjlsdjflskdjflksdjf");
        }
        initClick();
        mPageLoader.refreshChapterList();
//
//        Disposable disposable = BookRepository.getInstance()
//                .getBookChaptersInRx(mBookId)
//                .compose(RxUtils::toSimpleSingle)
//                .subscribe(
//                        (bookChapterBeen, throwable) -> {
//                            // ?????? CollBook
////                                mPageLoader.getCollBook().setBookChapters(bookChapterBeen);
//                            // ??????????????????
//                            mPageLoader.refreshChapterList();
//                            // ?????????????????????????????????????????????????????????????????????
//                            if (mCollBook.isUpdate() && !mCollBook.isLocal()) {
//                                mPresenter.loadCategory(mBookId);
//                            }
//                            LogUtils.e(throwable);
//                        }
//                );
//        addDisposable(disposable);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(mReceiver);
    }

    private void initClick() {
        mImageBack.setOnClickListener((v) -> {
            onBackPressed();
        });
        mTvSetting.setOnClickListener((v) -> {
            mSettingDialog.show();
        });
        mTvNightMode.setOnClickListener((v) -> {
            if (isNightMode) {
                isNightMode = false;
            } else {
                isNightMode = true;
            }
            mPageLoader.setNightMode(isNightMode);
            toggleNightMode();
        });
        mPageLoader.setOnPageChangeListener(
                new PageLoader.OnPageChangeListener() {

                    @Override
                    public void onChapterChange(int pos) {
//                        mCategoryAdapter.setChapter(pos);
                    }

                    @Override
                    public void requestChapters(List<TxtChapter> requestChapters) {
//                        mPresenter.loadChapter(mBookId, requestChapters);
//                        mHandler.sendEmptyMessage(WHAT_CATEGORY);
//                        //????????????
//                        mTvPageTip.setVisibility(GONE);
                    }

                    @Override
                    public void onCategoryFinish(List<TxtChapter> chapters) {
                        for (TxtChapter chapter : chapters) {
                            chapter.setTitle(chapter.getTitle());
                        }
//                        mCategoryAdapter.refreshItems(chapters);
                    }

                    @Override
                    public void onPageCountChange(int count) {
                        mSbChapterProgress.setMax(Math.max(0, count - 1));
                        mSbChapterProgress.setProgress(0);
                        // ????????????????????????????????????????????????
                        if (mPageLoader.getPageStatus() == PageLoader.STATUS_LOADING
                                || mPageLoader.getPageStatus() == PageLoader.STATUS_ERROR) {
                            mSbChapterProgress.setEnabled(false);
                        } else {
                            mSbChapterProgress.setEnabled(true);
                        }
                    }

                    @Override
                    public void onPageChange(int pos) {
                        mSbChapterProgress.post(
                                () -> mSbChapterProgress.setProgress(pos)
                        );
                    }
                }
        );

        mSbChapterProgress.setOnSeekBarChangeListener(
                new SeekBar.OnSeekBarChangeListener() {
                    @Override
                    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                        if (mLlBottomMenu.getVisibility() == VISIBLE) {
                            //????????????
//                            mTvPageTip.setText((progress + 1) + "/" + (mSbChapterProgress.getMax() + 1));
//                            mTvPageTip.setVisibility(VISIBLE);
                        }
                    }

                    @Override
                    public void onStartTrackingTouch(SeekBar seekBar) {
                    }

                    @Override
                    public void onStopTrackingTouch(SeekBar seekBar) {
                        //????????????
                        int pagePos = mSbChapterProgress.getProgress();
                        if (pagePos != mPageLoader.getPagePos()) {
                            mPageLoader.skipToPage(pagePos);
                        }
                        //????????????
//                        mTvPageTip.setVisibility(GONE);
                    }
                }
        );

        mPvPage.setTouchListener(new PageView.TouchListener() {
            @Override
            public boolean onTouch() {
                return !hideReadMenu();
            }

            @Override
            public void center() {
                toggleMenu(true);
            }

            @Override
            public void prePage() {
            }

            @Override
            public void nextPage() {
            }

            @Override
            public void cancel() {
            }
        });
    }

    private void toggleNightMode() {
        if (isNightMode) {
            mTvNightMode.setText(StringUtils.getString(R.string.nb_mode_morning));
            Drawable drawable = ContextCompat.getDrawable(this, R.drawable.ic_read_menu_morning);
            mTvNightMode.setCompoundDrawablesWithIntrinsicBounds(null, drawable, null, null);
        } else {
            mTvNightMode.setText(StringUtils.getString(R.string.nb_mode_night));
            Drawable drawable = ContextCompat.getDrawable(this, R.drawable.ic_read_menu_night);
            mTvNightMode.setCompoundDrawablesWithIntrinsicBounds(null, drawable, null, null);
        }
    }

    private void toggleMenu(boolean hideStatusBar) {
        initMenuAnim();

        if (mAblTopMenu.getVisibility() == View.VISIBLE) {
            //??????
            mAblTopMenu.startAnimation(mTopOutAnim);
            mLlBottomMenu.startAnimation(mBottomOutAnim);
            mAblTopMenu.setVisibility(GONE);
            mLlBottomMenu.setVisibility(GONE);
//            mTvPageTip.setVisibility(GONE);

            if (hideStatusBar) {
//                hideSystemBar();
            }
        } else {
            mAblTopMenu.setVisibility(View.VISIBLE);
            mLlBottomMenu.setVisibility(View.VISIBLE);
            mAblTopMenu.startAnimation(mTopInAnim);
            mLlBottomMenu.startAnimation(mBottomInAnim);

//            showSystemBar();
        }
    }

    private void initMenuAnim() {
        if (mTopInAnim != null) return;

        mTopInAnim = AnimationUtils.loadAnimation(this, R.anim.slide_top_in);
        mTopOutAnim = AnimationUtils.loadAnimation(this, R.anim.slide_top_out);
        mBottomInAnim = AnimationUtils.loadAnimation(this, R.anim.slide_bottom_in);
        mBottomOutAnim = AnimationUtils.loadAnimation(this, R.anim.slide_bottom_out);
        //?????????????????????
        mTopOutAnim.setDuration(200);
        mBottomOutAnim.setDuration(200);
    }

    /**
     * ?????????????????????????????????
     *
     * @return ??????????????????
     */
    private boolean hideReadMenu() {
        hideSystemBar();
//        if (mAblTopMenu.getVisibility() == VISIBLE) {
//            toggleMenu(true);
//            return true;
//        } else if (mSettingDialog.isShowing()) {
//            mSettingDialog.dismiss();
//            return true;
//        }
        return false;
    }

    private void showSystemBar() {
        //??????
        SystemBarUtils.showUnStableStatusBar(this);
        if (isFullScreen) {
            SystemBarUtils.showUnStableNavBar(this);
        }
    }

    private void hideSystemBar() {
        //??????
        SystemBarUtils.hideStableStatusBar(this);
        if (isFullScreen) {
            SystemBarUtils.hideStableNavBar(this);
        }
    }

    private BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals(Intent.ACTION_BATTERY_CHANGED)) {
                int level = intent.getIntExtra("level", 0);
                mPageLoader.updateBattery(level);
            }
            // ?????????????????????
            else if (intent.getAction().equals(Intent.ACTION_TIME_TICK)) {
                mPageLoader.updateTime();
            }
        }
    };
}