const trackablesModel = require('../model/trackables');

const trackablesService = {
  addTrackable(trackable) {
    return trackablesModel.addTrackable(trackable);
  },

  getTrackables(userId) {
    return trackablesModel.getTrackables(userId);
  },

  getBooleanTrackables(userId) {
    return trackablesModel.getBooleanTrackables(userId);
  },

  getQuantitativeTrackables(userId) {
    return trackablesModel.getQuantitativeTrackables(userId);
  },

  getTrackableById(id) {
    return trackablesModel.getTrackableById(id);
  },

  deleteTrackable(id) {
    return trackablesModel.deleteTrackable(id);
  },
};

module.exports = trackablesService;
