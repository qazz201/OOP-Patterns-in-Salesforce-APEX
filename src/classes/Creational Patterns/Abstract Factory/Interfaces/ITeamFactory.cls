/**
 * Created by Vlad K. on 03.11.2021.
 * @description The abstract factory knows about all types (abstract) of team members
 */

public interface ITeamFactory {
    IDeveloper getDeveloper();
    ITester getTester();
    IProjectManager getProjectManager();
}