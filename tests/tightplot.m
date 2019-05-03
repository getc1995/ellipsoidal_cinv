function tightplot(filename)
    addpath('../altmany-export_fig')
    set(gcf,'color','w');
    export_fig([filename,'.pdf'], '-pdf');
end