/**
 * Created by Vlad K. on 03.11.2021.
 */

public interface ITeamFactory {
    IDeveloper getDeveloper();
    ITester getTester();
    IProjectManager getProjectManager();
}