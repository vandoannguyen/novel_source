package com.example.init_app.pageview_utils.page;

import android.app.Activity;
import android.app.Dialog;
import android.os.Bundle;
import android.view.Gravity;
import android.view.Window;
import android.view.WindowManager;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.SeekBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.init_app.R;
import com.example.init_app.utils.BrightnessUtils;

import java.util.Arrays;

public class ReadSettingDialog extends Dialog {
    private static final String TAG = "ReadSettingDialog";
    private static final int DEFAULT_TEXT_SIZE = 16;

    //    @BindView(R.id.read_setting_iv_brightness_minus)
    ImageView mIvBrightnessMinus;
    //    @BindView(R.id.read_setting_sb_brightness)
    SeekBar mSbBrightness;
    //    @BindView(R.id.read_setting_iv_brightness_plus)
    ImageView mIvBrightnessPlus;
    //    @BindView(R.id.read_setting_cb_brightness_auto)
    CheckBox mCbBrightnessAuto;
    //    @BindView(R.id.read_setting_tv_font_minus)
    TextView mTvFontMinus;
    //    @BindView(R.id.read_setting_tv_font)
    TextView mTvFont;
    //    @BindView(R.id.read_setting_tv_font_plus)
    TextView mTvFontPlus;
    //    @BindView(R.id.read_setting_cb_font_default)
    CheckBox mCbFontDefault;
    //    @BindView(R.id.read_setting_rg_page_mode)
    RadioGroup mRgPageMode;

    //    @BindView(R.id.read_setting_rb_simulation)
    RadioButton mRbSimulation;
    //    @BindView(R.id.read_setting_rb_cover)
    RadioButton mRbCover;
    //    @BindView(R.id.read_setting_rb_slide)
    RadioButton mRbSlide;
    //    @BindView(R.id.read_setting_rb_scroll)
    RadioButton mRbScroll;
    //    @BindView(R.id.read_setting_rb_none)
    RadioButton mRbNone;
    //    @BindView(R.id.read_setting_rv_bg)
    RecyclerView mRvBg;
    //    @BindView(R.id.read_setting_tv_more)
    TextView mTvMore;
    /************************************/
    private PageStyleAdapter mPageStyleAdapter;
    private ReadSettingManager mSettingManager;
    private PageLoader mPageLoader;
    private Activity mActivity;

    private PageMode mPageMode;
    private PageStyle mPageStyle;

    private int mBrightness;
    private int mTextSize;

    private boolean isBrightnessAuto;
    private boolean isTextDefault;


    public ReadSettingDialog(@NonNull Activity activity, PageLoader mPageLoader) {
        super(activity, R.style.ReadSettingDialog);
        mActivity = activity;
        this.mPageLoader = mPageLoader;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_read_setting);
        initView();
        setUpWindow();
        initData();
        initWidget();
        initClick();
    }

    private void initView() {
        mIvBrightnessMinus = findViewById(R.id.read_setting_iv_brightness_minus);
        mSbBrightness = findViewById(R.id.read_setting_sb_brightness);
        mIvBrightnessMinus = findViewById(R.id.read_setting_iv_brightness_minus);
        mIvBrightnessPlus = findViewById(R.id.read_setting_iv_brightness_plus);
        mCbBrightnessAuto = findViewById(R.id.read_setting_cb_brightness_auto);
        mTvFontMinus = findViewById(R.id.read_setting_tv_font_minus);
        mTvFont = findViewById(R.id.read_setting_tv_font);
        mTvFontPlus = findViewById(R.id.read_setting_tv_font_plus);
        mCbFontDefault = findViewById(R.id.read_setting_cb_font_default);
        mRgPageMode = findViewById(R.id.read_setting_rg_page_mode);
        mRbSimulation = findViewById(R.id.read_setting_rb_simulation);
        mRbCover = findViewById(R.id.read_setting_rb_cover);
        mRbSlide = findViewById(R.id.read_setting_rb_slide);
        mRbScroll = findViewById(R.id.read_setting_rb_scroll);
        mRbNone = findViewById(R.id.read_setting_rb_none);
        mRvBg = findViewById(R.id.read_setting_rv_bg);
        mTvMore = findViewById(R.id.read_setting_tv_more);
    }

    //??????Dialog???????????????
    private void setUpWindow() {
        Window window = getWindow();
        WindowManager.LayoutParams lp = window.getAttributes();
        lp.width = WindowManager.LayoutParams.MATCH_PARENT;
        lp.height = WindowManager.LayoutParams.WRAP_CONTENT;
        lp.gravity = Gravity.BOTTOM;
        window.setAttributes(lp);
    }

    private void initData() {
        mSettingManager = ReadSettingManager.getInstance(getContext());

        isBrightnessAuto = mSettingManager.isBrightnessAuto();
        mBrightness = mSettingManager.getBrightness();
        mTextSize = mSettingManager.getTextSize();
        isTextDefault = mSettingManager.isDefaultTextSize();
        mPageMode = mSettingManager.getPageMode();
        mPageStyle = mSettingManager.getPageStyle();
    }

    private void initWidget() {
        mSbBrightness.setProgress(mBrightness);
        mTvFont.setText(mTextSize + "");
        mCbBrightnessAuto.setChecked(isBrightnessAuto);
        mCbFontDefault.setChecked(isTextDefault);
        initPageMode();
        //RecyclerView
        setUpAdapter();
    }

    private void setUpAdapter() {
        Integer[] drawables = {
                R.color.nb_read_bg_1
                , R.color.nb_read_bg_2
                , R.color.nb_read_bg_3
                , R.color.nb_read_bg_4
                , R.color.nb_read_bg_5};

        mPageStyleAdapter = new PageStyleAdapter(Arrays.asList(drawables));
        mRvBg.setLayoutManager(new GridLayoutManager(getContext(), 5));
        mRvBg.setAdapter(mPageStyleAdapter);
//        mPageStyleAdapter.refreshItems(Arrays.asList(drawables));

        mPageStyleAdapter.setPageStyleChecked(mPageStyle);

    }

    private void initPageMode() {
        switch (mPageMode) {
            case SIMULATION:
                mRbSimulation.setChecked(true);
                break;
            case COVER:
                mRbCover.setChecked(true);
                break;
            case SLIDE:
                mRbSlide.setChecked(true);
                break;
            case NONE:
                mRbNone.setChecked(true);
                break;
            case SCROLL:
                mRbScroll.setChecked(true);
                break;
        }
    }

    private void initClick() {
        //????????????
        mIvBrightnessMinus.setOnClickListener(
                (v) -> {
                    if (mCbBrightnessAuto.isChecked()) {
                        mCbBrightnessAuto.setChecked(false);
                    }
                    int progress = mSbBrightness.getProgress() - 1;
                    if (progress < 0) return;
                    mSbBrightness.setProgress(progress);
                    BrightnessUtils.setBrightness(mActivity, progress);
                }
        );
        mIvBrightnessPlus.setOnClickListener(
                (v) -> {
                    if (mCbBrightnessAuto.isChecked()) {
                        mCbBrightnessAuto.setChecked(false);
                    }
                    int progress = mSbBrightness.getProgress() + 1;
                    if (progress > mSbBrightness.getMax()) return;
                    mSbBrightness.setProgress(progress);
                    BrightnessUtils.setBrightness(mActivity, progress);
                    //????????????
                    ReadSettingManager.getInstance(getContext()).setBrightness(progress);
                }
        );

        mSbBrightness.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {

            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                int progress = seekBar.getProgress();
                if (mCbBrightnessAuto.isChecked()) {
                    mCbBrightnessAuto.setChecked(false);
                }
                //???????????? Activity ?????????
                BrightnessUtils.setBrightness(mActivity, progress);
                //????????????????????????
                ReadSettingManager.getInstance(getContext()).setBrightness(progress);
            }
        });

        mCbBrightnessAuto.setOnCheckedChangeListener(
                (buttonView, isChecked) -> {
                    if (isChecked) {
                        //?????????????????????
                        BrightnessUtils.setBrightness(mActivity, BrightnessUtils.getScreenBrightness(mActivity));
                    } else {
                        //????????????????????????
                        BrightnessUtils.setBrightness(mActivity, mSbBrightness.getProgress());
                    }
                    ReadSettingManager.getInstance(getContext()).setAutoBrightness(isChecked);
                }
        );

        //??????????????????
        mTvFontMinus.setOnClickListener(
                (v) -> {
                    if (mCbFontDefault.isChecked()) {
                        mCbFontDefault.setChecked(false);
                    }
                    int fontSize = Integer.valueOf(mTvFont.getText().toString()) - 1;
                    if (fontSize < 0) return;
                    mTvFont.setText(fontSize + "");
                    mPageLoader.setTextSize(fontSize);
                }
        );

        mTvFontPlus.setOnClickListener(
                (v) -> {
                    if (mCbFontDefault.isChecked()) {
                        mCbFontDefault.setChecked(false);
                    }
                    int fontSize = Integer.valueOf(mTvFont.getText().toString()) + 1;
                    mTvFont.setText(fontSize + "");
                    mPageLoader.setTextSize(fontSize);
                }
        );

        mCbFontDefault.setOnCheckedChangeListener(
                (buttonView, isChecked) -> {
                    if (isChecked) {
                        int fontSize = ScreenUtils.dpToPx(DEFAULT_TEXT_SIZE);
                        mTvFont.setText(fontSize + "");
                        mPageLoader.setTextSize(fontSize);
                    }
                }
        );

        //Page Mode ??????
        mRgPageMode.setOnCheckedChangeListener(
                (group, checkedId) -> {
                    PageMode pageMode;
                    switch (checkedId) {
                        case R.id.read_setting_rb_simulation:
                            pageMode = PageMode.SIMULATION;
                            break;
                        case R.id.read_setting_rb_cover:
                            pageMode = PageMode.COVER;
                            break;
                        case R.id.read_setting_rb_slide:
                            pageMode = PageMode.SLIDE;
                            break;
                        case R.id.read_setting_rb_scroll:
                            pageMode = PageMode.SCROLL;
                            break;
                        case R.id.read_setting_rb_none:
                            pageMode = PageMode.NONE;
                            break;
                        default:
                            pageMode = PageMode.SIMULATION;
                            break;
                    }
                    mPageLoader.setPageMode(pageMode);
                }
        );

        //?????????????????????
        mPageStyleAdapter.setOnItemClick(
                (pos) -> mPageLoader.setPageStyle(PageStyle.values()[pos])
        );

        //????????????
        mTvMore.setOnClickListener(
                (v) -> {
//                    Intent intent = new Intent(getContext(), MoreSettingActivity.class);
//                    mActivity.startActivityForResult(intent, ReadActivity.REQUEST_MORE_SETTING);
                    //??????????????????
                    dismiss();
                }
        );
    }

    public boolean isBrightFollowSystem() {
        if (mCbBrightnessAuto == null) {
            return false;
        }
        return mCbBrightnessAuto.isChecked();
    }
}
