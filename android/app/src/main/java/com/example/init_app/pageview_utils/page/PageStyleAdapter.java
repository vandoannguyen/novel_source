package com.example.init_app.pageview_utils.page;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.init_app.R;

import java.util.List;

//public class PageStyleAdapter extends BaseListAdapter<Drawable> {
public class PageStyleAdapter extends RecyclerView.Adapter<PageStyleAdapter.PageStyleHolder> {
    private int currentChecked;
    private int position;
    private List<Integer> backgrounds;
    private OnItemClick onItemClick;

    public void setOnItemClick(OnItemClick onItemClick) {
        this.onItemClick = onItemClick;
    }

    public PageStyleAdapter(List<Integer> backgrounds) {
        this.backgrounds = backgrounds;
    }
//    @Override
//    protected IViewHolder<Drawable> createViewHolder(int viewType) {
//        return new PageStyleHolder();
//    }

//    @Override
//    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
//        this.holder = holder;
//        this.position = position;
//        super.onBindViewHolder(holder, position);
//        IViewHolder iHolder = ((BaseViewHolder) holder).holder;
//        PageStyleHolder pageStyleHolder = (PageStyleHolder) iHolder;
//        if (currentChecked == position) {
//            pageStyleHolder.setChecked();
//        }
//    }

    public void setPageStyleChecked(PageStyle pageStyle) {
        currentChecked = pageStyle.ordinal();
    }

    @NonNull
    @Override
    public PageStyleHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_read_bg, parent, false);
        return new PageStyleHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull PageStyleHolder holder, int position) {
//        IViewHolder iHolder = ((BaseViewHolder) holder).holder;
//        PageStyleHolder pageStyleHolder = (PageStyleHolder) iHolder;
        if (currentChecked == position) {
            holder.mIvChecked.setVisibility(View.VISIBLE);
        } else {
            holder.mIvChecked.setVisibility(View.GONE);
        }
        holder.mReadBg.setBackgroundResource(backgrounds.get(position));
        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                currentChecked = position;
                notifyDataSetChanged();
                if (onItemClick != null) onItemClick.onClick(position);
            }
        });
    }

    @Override
    public int getItemCount() {
        return backgrounds.size();
    }

    public class PageStyleHolder extends RecyclerView.ViewHolder {
        private View mReadBg;
        private ImageView mIvChecked;

        public PageStyleHolder(@NonNull View itemView) {
            super(itemView);
            mReadBg = itemView.findViewById(R.id.read_bg_view);
            mIvChecked = itemView.findViewById(R.id.read_bg_iv_checked);

        }
    }

    public interface OnItemClick {
        void onClick(int rescouce);
    }
}
