Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767C932761E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 03:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91220.172312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGYSJ-0005FH-EC; Mon, 01 Mar 2021 02:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91220.172312; Mon, 01 Mar 2021 02:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGYSJ-0005Es-AN; Mon, 01 Mar 2021 02:38:43 +0000
Received: by outflank-mailman (input) for mailman id 91220;
 Mon, 01 Mar 2021 02:38:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k8He=H7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lGYSH-0005En-Rv
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 02:38:41 +0000
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c1cfa0c-d708-4ff7-86f0-753e4c2e3cfb;
 Mon, 01 Mar 2021 02:38:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 18:38:38 -0800
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2021 18:38:07 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Feb 2021 18:34:27 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Feb 2021 18:34:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 28 Feb 2021 18:34:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 28 Feb 2021 18:34:24 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1472.namprd11.prod.outlook.com (2603:10b6:301:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 1 Mar
 2021 02:34:21 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 02:34:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 5c1cfa0c-d708-4ff7-86f0-753e4c2e3cfb
IronPort-SDR: N4kQXeF5K/u1yNqfUQQ/383h/x/VI4hz4ZxpStc9zqyPb5bPD5SAQJ0aWXVRd4+YpWAnLaiUH9
 hl75kzPs0rCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="173468144"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="173468144"
IronPort-SDR: VEhzljH7TWYK1jEcpGZu+XxEi8iga09sw8SALvGseImlMXRbNaXF3vdiWWlPv7lAWiUyBtprD1
 VykHwaiuBsyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="435250398"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApLB/zSplgY28r3v7eGOx1hQoPAv18UYopGKrnRXPSsuqxwHOCyFVlKCRAxEgQE/EIUS7kp1nKkiS86EROZ7KKCsFe3Ag/3ae5yJXyt02Jd1hkdecnmUq7akDwsSlm6XPDVQL4WK4BPFa3pXrT8tK9Buuj7mnopTAFOr9njO0lW9gLCMCMm4Pb5PwwYKVCj6ECVIhsoNdh8GCeFFrvVnIXk+Z+0uKSJ9ViaJiGvqDpda7AEINbO3eFitMK+XX4f88+FxO02pcb8cQ8O8/uCh4EFult8mphDAE5/3etT+f+kS/1sW7UcWBwcXaXmhStcVTWevHvnaBT00VfKXwy+zPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0eQSDURXlKeu3XnQMoLBl/z4GiC3XaNCrR0btMof6U=;
 b=awipn2vX7nbKoTTrQgDc282kivZiBOjK7UhPbIhvuZA/9D2zGJpMGdeHViZOQJyX/hT+rUY2eMhRLcUcAP5C3Yo+neMXsnNMw1grkoIqkpuci9HFDgxdHVZYSDZ+r0odTSNhgKwzwy8f6wRXuBuqAN8jQ4IxcaUT8bs2FQI5GLF4Xdu+n/46Dk7hBm1XMDcrwmqEmdto3ZO5dVEJeKiYxuZViE3sZL2e1rXbSK4lyVP2ib582cmovbZzMvdnvuCeqycCmKH/wjEDpZfDcbhof5Ljgh5vuwJbb0GZWIUmURMWrKPxctWOL9PKs+lSDIvf/j+IWFjmAOTT1X8YzhYtUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0eQSDURXlKeu3XnQMoLBl/z4GiC3XaNCrR0btMof6U=;
 b=lWEDK+MckT/LnRVIPr1PR6/npeVus+J+cyv7ZLi76lMjZwh1hVz1/rx2DvKKGkjVOIbsHr17zazAa1phUAAp9fHNWXRm7HFdqmX/sCjFNRXz5il90+7ZErQVo+8OfTJ2i2B8ZKNUOXX61JDeXZZy+2pmDdLwlcWUnxD36Ln0Xmk=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH v3 2/2] VMX: use a single, global APIC access page
Thread-Topic: [PATCH v3 2/2] VMX: use a single, global APIC access page
Thread-Index: AQHXCQmBRdBcMCCJUUaaKANK6r4GfapucSbw
Date: Mon, 1 Mar 2021 02:34:20 +0000
Message-ID: <MWHPR11MB1886992F8E3886EC64A54B8D8C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <774a0bf2-d2a4-7dba-bf15-fec8b0ec8c5f@suse.com>
In-Reply-To: <774a0bf2-d2a4-7dba-bf15-fec8b0ec8c5f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 549fac52-e672-4cc6-7437-08d8dc5a8519
x-ms-traffictypediagnostic: MWHPR11MB1472:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1472B11A8D7A585EFC7C1EE58C9A9@MWHPR11MB1472.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LZAZDKZP/qHjHEJG5K2A8zf+MDdJRk0kLb4HCTVACPi40pXD3MryaHqcz8RZjvRnGbTgOl18XKcynFRHqDExVr899E15orGKTS8PO5emGhAqHLMblbpW7hE/T8mvIRoHcOqoRE2154vfzQJWWdYKmTcpAaTUS+irC6ZpD2hNyoh4ULc4dPJw5bp496PJQRBA0eARWzLQ8feazz5gK8vqBOp7hLztpdYmL021JOq808t0ZfZQMKuztoYY82XfRPBvKDNBO6/cTaCBCJWjPBJbHLBgSfWAKDrdH2Jhb++SkT9PR7doj2JusQ5vzUEWf66jbLxdLUBg4+KKTn7yQBN/5YXWOld8oZR2GyoaZ+aY2bDAwi5eXQBm8ostgdyq6C7/55qptftvwVEM94ZTyij3SGRBPyiY6vugWli+dH9RCZ7qsVF5K+oimNlPHrAacwiA+Y2C02NsWev40CL3/8D/Z/28tkykcQ2oq8swaBxH6wBRtNBWqQrNzjHRsTmHQAFbMkb6Qq15nn43HM0fxC5/gg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(396003)(136003)(39860400002)(4326008)(8936002)(107886003)(2906002)(478600001)(86362001)(8676002)(9686003)(52536014)(55016002)(5660300002)(316002)(64756008)(66446008)(33656002)(110136005)(76116006)(66556008)(66946007)(66476007)(83380400001)(26005)(71200400001)(7696005)(186003)(54906003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?S01teTJjekhhL09pQ3VXZXBQV0ZBM2FQZXA3eDlZU3diWHBkMkF1a1ViRDFj?=
 =?utf-8?B?bDZ4UENBSi9iU1d0UTRrOFZQOXY5bmd1UllzZGFKZkE3bGprc1gycVlOb3JS?=
 =?utf-8?B?ZHFTS1hDeXowYWc2UUVQVUhMWHZHVmw3dzRUSjNsZzR4cUF4QndVUDJlRzh1?=
 =?utf-8?B?Slg3RVV6U0NhSXNwMXJUMFJKK2FVV3lFV0Y5Z3ZMSVFhNi8vRFJLOGVDVTN2?=
 =?utf-8?B?cGVyT2NxNy9sVDNZN2ZqVnJEbjJxbHRkdjd3Vm02UjhNeFBpaXlwbjhTMGFI?=
 =?utf-8?B?Q0F6dGdsQUNZUkwxUlA2Z1JUTi84UmVPMEVXWWZpS1poRnI3OGhrcEtpZ01h?=
 =?utf-8?B?bEc2ZHdqUFNkdVViVTRTQUUxK1VzZjYwdFMzQ2RncnZ1T29NYytqK3hLWlpE?=
 =?utf-8?B?TElWQ0lETW1mUjFhellPdGhCOUt5UXFtWDJoVStlK0dSSkFxWWxrWXNSU2dv?=
 =?utf-8?B?cjFUc0h2bkNZeC9VRDRLRzZ3UzdiRjNYZ0dNVGtyM1FxNkNGMjJwSFl0L2J0?=
 =?utf-8?B?NXFYT0dpTjczOEJVb2N5ZU9UUDZxVHdWRGN5Wi9YekxzakZETUVwK2twYVE2?=
 =?utf-8?B?TWtMSVozbFdxK1NGTWhLNysvQ2tCRGxXR0EyZEQxb3RMODU5N2YzaXN4YW5P?=
 =?utf-8?B?R3BFQXYrUVNnL0x3bnkwWXRDOHhQRlJud2tvQnpVbVU1WkZRMkJTckpsZ08z?=
 =?utf-8?B?N1Nob1crZDNUZUFneFRHM3FiUnpGT2xpcU8rdGM3cVlBdU9NMWJ5OXBOVHNr?=
 =?utf-8?B?UFlGbGJxelNNSW85em93Y1p5U0V3ZHRSbkpMV0NGRHQzT29sUDR3SVVOdkU0?=
 =?utf-8?B?MFRkOUV1MHowSlNaNUpsRGxzdzBJRjRoRTlNUFFXaVpzUm0rNHZTTFlxZU9v?=
 =?utf-8?B?MzhBVkdCMEtHZzJ0MFpwZ1ZWTXFQRXphdjNqZmFwTEJMb1FCVkVCZzBjMjEy?=
 =?utf-8?B?RzIxc2NTUi8xeHJ3a3cwYWsvZWRoZmxiY25CN3lScHp2aGhKUnJRSVJDcGti?=
 =?utf-8?B?elVaWkR2Y1JHZmdXaWYvZVlYWDdkN0lBaUE0MFFKd2kvOUFtd3lrNzFJdzQr?=
 =?utf-8?B?cWJiMGRqaDRFaTl6alRDd1hyT3dPdEx3SVRiYjZ4c0J6S0lyYzNkenp5Rk1M?=
 =?utf-8?B?RXZWWVptNTFGalhVQ2tLcWNOTzZBZTdzRW9Xc1RCclBQRHRuVEVCcU9zVzc1?=
 =?utf-8?B?T1Yyd2hpMmpRRURyNjUrM2pVMzNPdStRczZsYW42RU1CZ3RxY283Q3AwS3Nv?=
 =?utf-8?B?VStvNElNZGpCTS9zQVRwTnRPVmtHdFg1L0Q0MnhEVWFZU2NXbzlZakRvWFJK?=
 =?utf-8?B?V0F2NFhIUVc3OUo1K2pJSjRYZGNxbTlZQkFtWmdNSG1MWTV5eHl2RmpBdEg0?=
 =?utf-8?B?dzY2eXFvWGUxR1J3cUpGY2JQVkc3OEM3WkJmRlpYcUdpWUlnTmZwOU9FZTdT?=
 =?utf-8?B?T01qcmt4YlVDYUhFT3czTG9IWWFMNjc1Qy83U3cvb2pWRXROTFRuR1E0Vkx2?=
 =?utf-8?B?UFRrTXIvOGF3aXdkangxSlZWTVhhWml0RG4xZTlqaW5HWXZzMGd0M2p6alRr?=
 =?utf-8?B?Z1hJNjR1V05KTTE5MzdrUWZ6dkcycUhzTHRYM0ZzV1g3OHJ6WFNXbkc5enBS?=
 =?utf-8?B?aHlicnJRczgxNlIzc0tSeWhrVzkyZFhoWmJDYUZLWEVxL2hXVm0wUk5zK1BD?=
 =?utf-8?B?NHJZZlQ1c2gveGdLdWp0aXRiVHo2TW42NnpYQ3JOdDB3aDVXYUpNTG0rNXdy?=
 =?utf-8?Q?DRLX2hmgLmtq0T/NYB3IIzPqCtO2jao8LNjKolZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549fac52-e672-4cc6-7437-08d8dc5a8519
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 02:34:20.9890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4tjwTagNKU22rOtOk//Sn6IOKWjmjacDhMIk9oWHA1GDRuHeK2Cp4xFeP6Ad7w+u6iNdc6vwkfwKxWJ/JXsZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1472
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
RmVicnVhcnkgMjIsIDIwMjEgNjo1NyBQTQ0KPiANCj4gVGhlIGFkZHJlc3Mgb2YgdGhpcyBwYWdl
IGlzIHVzZWQgYnkgdGhlIENQVSBvbmx5IHRvIHJlY29nbml6ZSB3aGVuIHRvDQo+IGFjY2VzcyB0
aGUgdmlydHVhbCBBUElDIHBhZ2UgaW5zdGVhZC4gTm8gYWNjZXNzZXMgd291bGQgZXZlciBnbyB0
byB0aGlzDQo+IHBhZ2UuIEl0IG9ubHkgbmVlZHMgdG8gYmUgcHJlc2VudCBpbiB0aGUgKENQVSkg
cGFnZSB0YWJsZXMgc28gdGhhdA0KPiBhZGRyZXNzIHRyYW5zbGF0aW9uIHdpbGwgcHJvZHVjZSBp
dHMgYWRkcmVzcyBhcyByZXN1bHQgZm9yIHJlc3BlY3RpdmUNCj4gYWNjZXNzZXMuDQo+IA0KPiBC
eSBtYWtpbmcgdGhpcyBwYWdlIGdsb2JhbCwgd2UgYWxzbyBlbGltaW5hdGUgdGhlIG5lZWQgdG8g
cmVmY291bnQgaXQsDQo+IG9yIHRvIGFzc2lnbiBpdCB0byBhbnkgZG9tYWluIGluIHRoZSBmaXJz
dCBwbGFjZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K
DQo+IC0tLQ0KPiB2MzogU3BsaXQgcDJtIGluc2VydGlvbiBjaGFuZ2UgdG8gYSBzZXBhcmF0ZSBw
YXRjaC4NCj4gdjI6IEF2b2lkIGluc2VydGlvbiB3aGVuICFoYXNfdmxhcGljKCkuIFNwbGl0IG9m
ZiBjaGFuZ2UgdG8NCj4gICAgIHAybV9nZXRfaW9tbXVfZmxhZ3MoKS4NCj4gLS0tDQo+IEkgZGlk
IGZ1cnRoZXIgY29uc2lkZXIgbm90IGFsbG9jYXRpbmcgYW55IHJlYWwgcGFnZSBhdCBhbGwsIGJ1
dCBqdXN0DQo+IHVzaW5nIHRoZSBhZGRyZXNzIG9mIHNvbWUgdW5wb3B1bGF0ZWQgc3BhY2UgKHdo
aWNoIHdvdWxkIHJlcXVpcmUNCj4gYW5ub3VuY2luZyB0aGlzIHBhZ2UgYXMgcmVzZXJ2ZWQgdG8g
RG9tMCwgc28gaXQgd291bGRuJ3QgcHV0IGFueSBQQ0kNCj4gTU1JTyBCQVJzIHRoZXJlKS4gQnV0
IEkgdGhvdWdodCB0aGlzIHdvdWxkIGJlIHRvbyBjb250cm92ZXJzaWFsLCBiZWNhdXNlDQo+IG9m
IHRoZSBwb3NzaWJsZSByaXNrcyBhc3NvY2lhdGVkIHdpdGggdGhpcy4NCj4gDQo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Zt
eC5jDQo+IEBAIC02Niw4ICs2Niw3IEBAIGJvb2xlYW5fcGFyYW0oImZvcmNlLWVwdCIsIG9wdF9m
b3JjZV9lcHQNCj4gIHN0YXRpYyB2b2lkIHZteF9jdHh0X3N3aXRjaF9mcm9tKHN0cnVjdCB2Y3B1
ICp2KTsNCj4gIHN0YXRpYyB2b2lkIHZteF9jdHh0X3N3aXRjaF90byhzdHJ1Y3QgdmNwdSAqdik7
DQo+IA0KPiAtc3RhdGljIGludCAgdm14X2FsbG9jX3ZsYXBpY19tYXBwaW5nKHN0cnVjdCBkb21h
aW4gKmQpOw0KPiAtc3RhdGljIHZvaWQgdm14X2ZyZWVfdmxhcGljX21hcHBpbmcoc3RydWN0IGRv
bWFpbiAqZCk7DQo+ICtzdGF0aWMgaW50IGFsbG9jX3ZsYXBpY19tYXBwaW5nKHZvaWQpOw0KPiAg
c3RhdGljIHZvaWQgdm14X2luc3RhbGxfdmxhcGljX21hcHBpbmcoc3RydWN0IHZjcHUgKnYpOw0K
PiAgc3RhdGljIHZvaWQgdm14X3VwZGF0ZV9ndWVzdF9jcihzdHJ1Y3QgdmNwdSAqdiwgdW5zaWdu
ZWQgaW50IGNyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgZmxhZ3MpOw0KPiBAQCAtNzgsNiArNzcsOCBAQCBzdGF0aWMgaW50IHZteF9tc3JfcmVhZF9p
bnRlcmNlcHQodW5zaWduDQo+ICBzdGF0aWMgaW50IHZteF9tc3Jfd3JpdGVfaW50ZXJjZXB0KHVu
c2lnbmVkIGludCBtc3IsIHVpbnQ2NF90IG1zcl9jb250ZW50KTsNCj4gIHN0YXRpYyB2b2lkIHZt
eF9pbnZscGcoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgbGluZWFyKTsNCj4gDQo+ICtz
dGF0aWMgbWZuX3QgX19yZWFkX21vc3RseSBhcGljX2FjY2Vzc19tZm47DQo+ICsNCj4gIC8qIFZh
bHVlcyBmb3IgZG9tYWluJ3MgLT5hcmNoLmh2bV9kb21haW4ucGlfb3BzLmZsYWdzLiAqLw0KPiAg
I2RlZmluZSBQSV9DU1dfRlJPTSAoMXUgPDwgMCkNCj4gICNkZWZpbmUgUElfQ1NXX1RPICAgKDF1
IDw8IDEpDQo+IEBAIC00MDEsNyArNDAyLDYgQEAgc3RhdGljIGludCB2bXhfZG9tYWluX2luaXRp
YWxpc2Uoc3RydWN0DQo+ICAgICAgICAgIC50byAgID0gdm14X2N0eHRfc3dpdGNoX3RvLA0KPiAg
ICAgICAgICAudGFpbCA9IHZteF9kb19yZXN1bWUsDQo+ICAgICAgfTsNCj4gLSAgICBpbnQgcmM7
DQo+IA0KPiAgICAgIGQtPmFyY2guY3R4dF9zd2l0Y2ggPSAmY3N3Ow0KPiANCj4gQEAgLTQxMSwy
OCArNDExLDE0IEBAIHN0YXRpYyBpbnQgdm14X2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdA0KPiAg
ICAgICAqLw0KPiAgICAgIGQtPmFyY2guaHZtLnZteC5leGVjX3NwID0gaXNfaGFyZHdhcmVfZG9t
YWluKGQpIHx8IG9wdF9lcHRfZXhlY19zcDsNCj4gDQo+IC0gICAgaWYgKCAhaGFzX3ZsYXBpYyhk
KSApDQo+IC0gICAgICAgIHJldHVybiAwOw0KPiAtDQo+IC0gICAgaWYgKCAocmMgPSB2bXhfYWxs
b2NfdmxhcGljX21hcHBpbmcoZCkpICE9IDAgKQ0KPiAtICAgICAgICByZXR1cm4gcmM7DQo+IC0N
Cj4gICAgICByZXR1cm4gMDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCB2bXhfZG9tYWluX3Jl
bGlucXVpc2hfcmVzb3VyY2VzKHN0cnVjdCBkb21haW4gKmQpDQo+IC17DQo+IC0gICAgaWYgKCAh
aGFzX3ZsYXBpYyhkKSApDQo+IC0gICAgICAgIHJldHVybjsNCj4gLQ0KPiAtICAgIHZteF9mcmVl
X3ZsYXBpY19tYXBwaW5nKGQpOw0KPiAtfQ0KPiAtDQo+ICBzdGF0aWMgdm9pZCBkb21haW5fY3Jl
YXRpb25fZmluaXNoZWQoc3RydWN0IGRvbWFpbiAqZCkNCj4gIHsNCj4gLSAgICBpZiAoIGhhc192
bGFwaWMoZCkgJiYgIW1mbl9lcShkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuLA0KPiBf
bWZuKDApKSAmJg0KPiArICAgIGlmICggaGFzX3ZsYXBpYyhkKSAmJiAhbWZuX2VxKGFwaWNfYWNj
ZXNzX21mbiwgX21mbigwKSkgJiYNCj4gICAgICAgICAgIHNldF9tbWlvX3AybV9lbnRyeShkLCBn
YWRkcl90b19nZm4oQVBJQ19ERUZBVUxUX1BIWVNfQkFTRSksDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZC0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21mbiwgUEFHRV9PUkRFUl80
SykgKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFwaWNfYWNjZXNzX21mbiwgUEFH
RV9PUkRFUl80SykgKQ0KPiAgICAgICAgICBkb21haW5fY3Jhc2goZCk7DQo+ICB9DQo+IA0KPiBA
QCAtMjQxNSw3ICsyNDAxLDYgQEAgc3RhdGljIHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgX19p
bml0ZA0KPiAgICAgIC5jcHVfdXBfcHJlcGFyZSAgICAgICA9IHZteF9jcHVfdXBfcHJlcGFyZSwN
Cj4gICAgICAuY3B1X2RlYWQgICAgICAgICAgICAgPSB2bXhfY3B1X2RlYWQsDQo+ICAgICAgLmRv
bWFpbl9pbml0aWFsaXNlICAgID0gdm14X2RvbWFpbl9pbml0aWFsaXNlLA0KPiAtICAgIC5kb21h
aW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMgPSB2bXhfZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2Vz
LA0KPiAgICAgIC5kb21haW5fY3JlYXRpb25fZmluaXNoZWQgPSBkb21haW5fY3JlYXRpb25fZmlu
aXNoZWQsDQo+ICAgICAgLnZjcHVfaW5pdGlhbGlzZSAgICAgID0gdm14X3ZjcHVfaW5pdGlhbGlz
ZSwNCj4gICAgICAudmNwdV9kZXN0cm95ICAgICAgICAgPSB2bXhfdmNwdV9kZXN0cm95LA0KPiBA
QCAtMjY2Miw3ICsyNjQ3LDcgQEAgY29uc3Qgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSAqIF9f
aW5pdA0KPiAgew0KPiAgICAgIHNldF9pbl9jcjQoWDg2X0NSNF9WTVhFKTsNCj4gDQo+IC0gICAg
aWYgKCB2bXhfdm1jc19pbml0KCkgKQ0KPiArICAgIGlmICggdm14X3ZtY3NfaW5pdCgpIHx8IGFs
bG9jX3ZsYXBpY19tYXBwaW5nKCkgKQ0KPiAgICAgIHsNCj4gICAgICAgICAgcHJpbnRrKCJWTVg6
IGZhaWxlZCB0byBpbml0aWFsaXNlLlxuIik7DQo+ICAgICAgICAgIHJldHVybiBOVUxMOw0KPiBA
QCAtMzIxNyw3ICszMjAyLDcgQEAgZ3BfZmF1bHQ6DQo+ICAgICAgcmV0dXJuIFg4NkVNVUxfRVhD
RVBUSU9OOw0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgdm14X2FsbG9jX3ZsYXBpY19tYXBwaW5n
KHN0cnVjdCBkb21haW4gKmQpDQo+ICtzdGF0aWMgaW50IF9faW5pdCBhbGxvY192bGFwaWNfbWFw
cGluZyh2b2lkKQ0KPiAgew0KPiAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOw0KPiAgICAgIG1m
bl90IG1mbjsNCj4gQEAgLTMyMjUsNTIgKzMyMTAsMjggQEAgc3RhdGljIGludCB2bXhfYWxsb2Nf
dmxhcGljX21hcHBpbmcoc3RydQ0KPiAgICAgIGlmICggIWNwdV9oYXNfdm14X3ZpcnR1YWxpemVf
YXBpY19hY2Nlc3NlcyApDQo+ICAgICAgICAgIHJldHVybiAwOw0KPiANCj4gLSAgICBwZyA9IGFs
bG9jX2RvbWhlYXBfcGFnZShkLCBNRU1GX25vX3JlZmNvdW50KTsNCj4gKyAgICBwZyA9IGFsbG9j
X2RvbWhlYXBfcGFnZShOVUxMLCAwKTsNCj4gICAgICBpZiAoICFwZyApDQo+ICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOw0KPiANCj4gLSAgICBpZiAoICFnZXRfcGFnZV9hbmRfdHlwZShwZywgZCwg
UEdUX3dyaXRhYmxlX3BhZ2UpICkNCj4gLSAgICB7DQo+IC0gICAgICAgIC8qDQo+IC0gICAgICAg
ICAqIFRoZSBkb21haW4gY2FuJ3QgcG9zc2libHkga25vdyBhYm91dCB0aGlzIHBhZ2UgeWV0LCBz
byBmYWlsdXJlDQo+IC0gICAgICAgICAqIGhlcmUgaXMgYSBjbGVhciBpbmRpY2F0aW9uIG9mIHNv
bWV0aGluZyBmaXNoeSBnb2luZyBvbi4NCj4gLSAgICAgICAgICovDQo+IC0gICAgICAgIGRvbWFp
bl9jcmFzaChkKTsNCj4gLSAgICAgICAgcmV0dXJuIC1FTk9EQVRBOw0KPiAtICAgIH0NCj4gLQ0K
PiAgICAgIG1mbiA9IHBhZ2VfdG9fbWZuKHBnKTsNCj4gICAgICBjbGVhcl9kb21haW5fcGFnZSht
Zm4pOw0KPiAtICAgIGQtPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4gPSBtZm47DQo+ICsg
ICAgYXBpY19hY2Nlc3NfbWZuID0gbWZuOw0KPiANCj4gICAgICByZXR1cm4gMDsNCj4gIH0NCj4g
DQo+IC1zdGF0aWMgdm9pZCB2bXhfZnJlZV92bGFwaWNfbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpk
KQ0KPiAtew0KPiAtICAgIG1mbl90IG1mbiA9IGQtPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19t
Zm47DQo+IC0NCj4gLSAgICBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuID0gX21mbigw
KTsNCj4gLSAgICBpZiAoICFtZm5fZXEobWZuLCBfbWZuKDApKSApDQo+IC0gICAgew0KPiAtICAg
ICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZyA9IG1mbl90b19wYWdlKG1mbik7DQo+IC0NCj4gLSAg
ICAgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKHBnKTsNCj4gLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5
cGUocGcpOw0KPiAtICAgIH0NCj4gLX0NCj4gLQ0KPiAgc3RhdGljIHZvaWQgdm14X2luc3RhbGxf
dmxhcGljX21hcHBpbmcoc3RydWN0IHZjcHUgKnYpDQo+ICB7DQo+ICAgICAgcGFkZHJfdCB2aXJ0
X3BhZ2VfbWEsIGFwaWNfcGFnZV9tYTsNCj4gDQo+IC0gICAgaWYgKCBtZm5fZXEodi0+ZG9tYWlu
LT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuLCBfbWZuKDApKSApDQo+ICsgICAgaWYgKCAh
aGFzX3ZsYXBpYyh2LT5kb21haW4pIHx8IG1mbl9lcShhcGljX2FjY2Vzc19tZm4sIF9tZm4oMCkp
ICkNCj4gICAgICAgICAgcmV0dXJuOw0KPiANCj4gICAgICBBU1NFUlQoY3B1X2hhc192bXhfdmly
dHVhbGl6ZV9hcGljX2FjY2Vzc2VzKTsNCj4gDQo+ICAgICAgdmlydF9wYWdlX21hID0gcGFnZV90
b19tYWRkcih2Y3B1X3ZsYXBpYyh2KS0+cmVnc19wYWdlKTsNCj4gLSAgICBhcGljX3BhZ2VfbWEg
PSBtZm5fdG9fbWFkZHIodi0+ZG9tYWluLQ0KPiA+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21m
bik7DQo+ICsgICAgYXBpY19wYWdlX21hID0gbWZuX3RvX21hZGRyKGFwaWNfYWNjZXNzX21mbik7
DQo+IA0KPiAgICAgIHZteF92bWNzX2VudGVyKHYpOw0KPiAgICAgIF9fdm13cml0ZShWSVJUVUFM
X0FQSUNfUEFHRV9BRERSLCB2aXJ0X3BhZ2VfbWEpOw0KPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS92bXgvdm1jcy5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92
bWNzLmgNCj4gQEAgLTU4LDcgKzU4LDYgQEAgc3RydWN0IGVwdF9kYXRhIHsNCj4gICNkZWZpbmUg
X1ZNWF9ET01BSU5fUE1MX0VOQUJMRUQgICAgMA0KPiAgI2RlZmluZSBWTVhfRE9NQUlOX1BNTF9F
TkFCTEVEICAgICAoMXVsIDw8DQo+IF9WTVhfRE9NQUlOX1BNTF9FTkFCTEVEKQ0KPiAgc3RydWN0
IHZteF9kb21haW4gew0KPiAtICAgIG1mbl90IGFwaWNfYWNjZXNzX21mbjsNCj4gICAgICAvKiBW
TVhfRE9NQUlOXyogKi8NCj4gICAgICB1bnNpZ25lZCBpbnQgc3RhdHVzOw0KPiANCg0K

