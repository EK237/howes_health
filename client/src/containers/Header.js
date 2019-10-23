import React from 'react'
import { connect } from 'react-redux'
import * as actions from '../redux/actions'

import '../style/Header.css'

const Header = ({ currentUser, log_out, selectedPatient, deselect_patient, displayWidgetMenu, openWidgetMenu, closeWidgetMenu }) => {

    const handleLogoutClick = () => {
        log_out()
        localStorage.removeItem('token')
        deselect_patient()
    }

    const handleWidgetMenuClick = () => {
        displayWidgetMenu ? closeWidgetMenu() : openWidgetMenu()
    }

    const handleDiaryViewClick = () => {
        deselect_patient()
        closeWidgetMenu()
    }

    const currentPatientElement =  selectedPatient ? <span>{`Current Patient: ${selectedPatient.patient_details.name}`}</span> : null

    return (
        <div className='Header'>
            <div className='account-links'>
            {currentUser 
            ? <img className='signout-icon' src="https://howes-health.s3.eu-west-2.amazonaws.com/logout.png" alt="Logout Icon" onClick={handleLogoutClick} />
            : <img className='signup-in-icon' src="https://howes-health.s3.eu-west-2.amazonaws.com/user.png" alt="Login and Signup Icon" />
            }
            </div>
            <div className='nav-container' >
                <div className='nav-links' >
                    <p onClick={handleDiaryViewClick} >Diary View</p>
                    <hr width="1" size="35" className='link-divider'></hr>
                    <p >Patient View</p>
                    {currentPatientElement}
                </div>
                <hr width="2" size="50" className='nav-divider'></hr>
                <div className='widget-menu-container'>
                    {<img className='widget-menu-icon' src="https://howes-health.s3.eu-west-2.amazonaws.com/menu-square-button-dark.png" alt="Widget Menu Icon" onClick={selectedPatient && handleWidgetMenuClick} />}
                </div>
            </div>
        </div>
    ) 
}


const mapStateToProps = state => ({
    currentUser: state.currentUser,
    selectedPatient: state.patients.find(patient => patient.id === state.selectedPatient)
})


export default connect(mapStateToProps, actions)(Header)