Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FBD327607
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 03:13:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91213.172287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGY3I-00034Q-4h; Mon, 01 Mar 2021 02:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91213.172287; Mon, 01 Mar 2021 02:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGY3H-000344-US; Mon, 01 Mar 2021 02:12:51 +0000
Received: by outflank-mailman (input) for mailman id 91213;
 Mon, 01 Mar 2021 02:12:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k8He=H7=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1lGY3G-00033w-FB
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 02:12:50 +0000
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28bb75c4-3929-4aca-bafd-fdb8cfab03a9;
 Mon, 01 Mar 2021 02:12:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 18:12:44 -0800
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2021 18:12:18 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Feb 2021 18:08:50 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Feb 2021 18:08:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 28 Feb 2021 18:08:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 28 Feb 2021 18:08:49 -0800
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2270.namprd11.prod.outlook.com (2603:10b6:301:54::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 02:08:48 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::f1b4:bace:1e44:4a46%6]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 02:08:48 +0000
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
X-Inumbo-ID: 28bb75c4-3929-4aca-bafd-fdb8cfab03a9
IronPort-SDR: KF4fSGHsjIZw2VW2jNx/Wvi/w8rz3iAAxL9mM0dvIpTNdIoq8nTweaNJmz9p3IpivpHqOLU7a1
 NisTRZVP6KdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="173465183"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="173465183"
IronPort-SDR: xXo7xspist5dqf5Csg5euK3q349+HgTTe/1TtahnOfd2nNu+08IxQq51oNkfn5LubYtCqd+eQK
 +HHCkF/Dz4lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
   d="scan'208";a="435243854"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFdwTK38ywkuOJHoiv+ykYs2Sojq71nAD96WWCydlnMX9rylWje1aH1AYYhQcjwqOJvdRYzrSmPSX/w/nmdHj5QTYwGuGMazf3nU8S4JjgG7poJeSUXR/01BEQenIXuavlTEWlrOiqjnL81shz6upFj6b37Xp4HmAo/AiuqAJJEmi3O1B21MHqzd4Hx1M6S0GZPq/OwovYDV7NCp/U9pDwWdH9/EHmAJe2WRF3r4Xzjht0MQvpTDlrN9JA04R3WnHzWl4zdyZ1wEb5SEdxHKeP9wLMQ552wrLafpL7XXFBEZ7+4SMHHE15J5kGuuGThuKl7+6QzrD8EvNyREW6HBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SM6fWWQYALeaONjtsblI/MM+unLUBrW10cVDx5gLMoM=;
 b=G60hVbfgkMhk5a5ZaVLs9t1L+B4cMO3oLdNUmwp+ERlGJ98NCBjTfrA5g3oDmw02uu3UhGnUQ5DRYPszolEgrDQZCLU02gDBdSv3Zmz5s1VeJQmAiaxFZwlkNqEQVzDmTbtWcqCEQ3FW2aZIlS0bjnJm4F2Taaxi/JdSJ63K7SmfSeRnTT8BjxuC/ZhQp6Y97glOhaEqgIjgMnJSZu33lECN3qmkJayb20kIUSKyE7L6+jmciw4fkWWM+48iADmrzd/6P1gTrlRsEOXUymFt36Lx7bpEhFbHtW8g/GwYMSMF14y8/IZYrMU/FOzuz0uDlH+CHjUCvvuy8Y3F/vSxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SM6fWWQYALeaONjtsblI/MM+unLUBrW10cVDx5gLMoM=;
 b=opwWfw067tzSYDQmQ58BNuqXeJveE1Q9+w0A1J/3w0IZX/AQtR5p52Cot/g6v7aAGr7Vw5MC3d8dYlmYALUAaT5JPvQhwh+GQazDR/LxKFd0l4FA7gkIsZBZgMvSP3lxyndV/fDN6wFR3awyizTxvpWDp2rUZEMAwuPWVAUWTSs=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>
CC: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] VMX: use a single, global APIC access page
Thread-Topic: [PATCH] VMX: use a single, global APIC access page
Thread-Index: AQHW/8yZa97+qDgbIE6iwG3wuPN9papRnNEAgAABAgCAHOIDYA==
Date: Mon, 1 Mar 2021 02:08:48 +0000
Message-ID: <MWHPR11MB188606CC12AA465ABB647CDA8C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <3c7a4cff-3f11-22e1-ed46-e76f62cc08f4@citrix.com>
 <e86499f9-8849-1d52-06b0-5cce224f4319@suse.com>
In-Reply-To: <e86499f9-8849-1d52-06b0-5cce224f4319@suse.com>
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
x-ms-office365-filtering-correlation-id: 9eb57eeb-79ed-4227-21b1-08d8dc56f3bc
x-ms-traffictypediagnostic: MWHPR1101MB2270:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB2270BC23B35FF76F04E90BD28C9A9@MWHPR1101MB2270.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r7ivZ8AL4jqZTV9tW/MgtFMAH9Twv2uVDiv+p6DGegAqaCyABehLAARw4Z1Fzwg2efl6HTDfihLC9eBaoJHzxgGIJTKucoGXhKeYk0Q3gNcrbcs+g/OVnk+L3RPPOyO30Xq852wB7Wl01vC223eV14UcKC0TUS4ci2ey83Xu2kLm3kcQvkkK7bfiqAuMP9VBEXeqGEzArLZVaYVIpQsOAxdVkNBOHZX4xOtQOoJLZhVgBm3yGq3Nzei6fJ++wnT1sX9J1U31kHsu9ITM5vV6vKXLsjoaFfsSsHoVKTON1DUVv1VkfO2Us4WVCjh8nKHOZpKCC/R4ynEbWm9VRRsrHy8Q9FLlJDIPoHqujz0+dBb+t3fs2dVRH6l47Hka0WfI+gHOiceSXoIk1uzsjmOKyeR4OMXL/jiMtjwWfEmsgqADoID7Lgtjwtp1EdnlgGGzQVpoCvy2DyZDPLA5N32QYvcZhhuLsJaTohqHOs/nBbIZ4BE6eacwd/q3uknYSHKlLRtXykKKEzYNnDu0R9FaGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1886.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(8676002)(76116006)(66476007)(66446008)(2906002)(5660300002)(4744005)(9686003)(26005)(64756008)(86362001)(66556008)(186003)(71200400001)(55016002)(8936002)(66946007)(52536014)(478600001)(110136005)(53546011)(54906003)(33656002)(316002)(7696005)(4326008)(83380400001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?U1dlaVpWcEVZdXYyaVJNUUNJTDAyaHhkSVBqcVM0K2t3Tkc4VTlHQzFyVGhl?=
 =?utf-8?B?MmppZ2trNzJ5emVTSTgvUzhXNnFEcERrSXNPRHd3ejlsdEtZTHVmRWd2ZTFM?=
 =?utf-8?B?aER5aTdkcFU2SU11YTZUcG4xOE1MaWR1Z3dSaWR0azNUMmpkT3lwSGladC9I?=
 =?utf-8?B?U01oZDhJVEZjL0hFeENtVWg5SEgyQTY0a2xrdzlEVUxROXZ6eVZ0UzlwbTNI?=
 =?utf-8?B?QUxrZ213MzgvNTQwdzZpQk5icG1aaDE5a3MyNEtCSXpUeUQzYmZSN1RwTWFF?=
 =?utf-8?B?WXFKU3FFbXoyZTJNaU5vTm9nL2grQ3hRK2ZIME1pSXl2eWVURVZCbGZlUEFY?=
 =?utf-8?B?d2JBc0taWHVJNDV4VnVLU01aZ0hGNU9SNXdEWjF2aC9kMk1GMFJLWmxIS2Jk?=
 =?utf-8?B?ZlB3U3luRzVzQ0h3YTNadlE4Y1F4cy9paTFrMGpSMnFHK2Q5RkpodlVYbDgv?=
 =?utf-8?B?b2lDOVhmS1hiUnZDSC9ndVZlOGNMSnJDWllJSnBLNVNvS0Q5VGtVcE1EMkov?=
 =?utf-8?B?aG1rZEJ2MXVaU1pQRzE0UUxoU3d1RTlMbkVuZzQ4WjdvK1hyV05kQU92MUMv?=
 =?utf-8?B?U1J4c2VxTWtIMTJiNWFFcjlmV1B5TXNzK1YrS2ZXaFUzWGVLVE5aZTR2QjR0?=
 =?utf-8?B?aFNabUQ1N0U5a0JYTFg1NmFvSU50MlJyemJTdHBuSFRQc3Vld01XaDdRaXYw?=
 =?utf-8?B?RVIzQWJ4SEtJSVdSdE15b3hOUXFtYVpHQmM3bVpkVm1MeFNDb2x6M0U0RStw?=
 =?utf-8?B?bHFKZityY0lEN2prUkwzaDVuZ0J4Si9SNFY0V1EwQ0dQdUw0KzJ2ZHY2bG5l?=
 =?utf-8?B?NTJZd1U3NnBxWFQ2aVJpd2wrdVhwSnc1Zno3bzIxZDVVTWE3N29YazhsalY2?=
 =?utf-8?B?RllBYWVyRkM1d20xY1NieEJKRllZWXp3ajVkaXpCK2R0RFY5ZlhEeG16TnZk?=
 =?utf-8?B?ZE9DSlNLdFNjcnZZRXNubjdJYWcwdXFncWZidDJRTlpGcU91UnQvL0hIMHhH?=
 =?utf-8?B?eUVHQkltcEY0SEZMZ0E3QXlybURmOFNLWnp6WXpGMVM5eHpTcUhvSXBQbkQw?=
 =?utf-8?B?UVlDZUhjZnV0WTBid2NyK1pCVVRyRW9tL3hkKzdtWTF5MUJSR2NYWFhrY0d2?=
 =?utf-8?B?QjRuWXNudmxxQU52VXUxaXZXZFBBbk4yZWV0ZE83RnBlQTRvb0M3VS9BRU51?=
 =?utf-8?B?SzF5UnMxWDJ2S2x5ZGR2YlF1N3F4YVRjNGE4a1p6VEdzMENPUE5ETTh3MGRm?=
 =?utf-8?B?eWFKVldYL0lwTnJTdnpHT20za05xL2Z1Z3hRdU94N0YwWVpIYmFMbXpYRmEw?=
 =?utf-8?B?cjVVTWs0WHUwUnJnQjV4amJsNDI0eEtrTUxGZ1M4eXhwUnl0SVVtT0g5eEF0?=
 =?utf-8?B?M0ZNTVhVM1NmQzhVbjM2THJLa3FNZGJJTk03V2RZWllSUnZ6UURGUFRBMkZC?=
 =?utf-8?B?Z3IvUm5ObkZKZTZ0MFkyQVV0STF4Y0pYV0s5Si80cFRSY085dExQNDlER1Bs?=
 =?utf-8?B?V2ZSME93eFdTNkpkR25BUTdOWTREYnJmWkNIVytyMW9vSTBKTDZqMWxVb0Y4?=
 =?utf-8?B?RzdoZm5RbmxSVjRseGI3LzRyNHFYbjFlSFIxTzIvN1VvbUkzTTlZbHJ2Y05L?=
 =?utf-8?B?bkJyTEMyWmgxc3ZGU295SEtGUmFIa2FPL0orRmpSemprd2xjREpzbHNxWmFZ?=
 =?utf-8?B?L1VDSUhMNWVneGpjaURGTlpLaU1rTzFmYVV3N2VhREh1Q2tGL2hrbGJsQjdu?=
 =?utf-8?Q?1wsLHAzPloj4eRXfRm4CNcU2hJoiDGt+q8pizN0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb57eeb-79ed-4227-21b1-08d8dc56f3bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 02:08:48.5926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1ZvAnw///Vyo40W4ITG7PpGamjUHJMcm8XL6xDnafvhAxPOKa1D6OuCHTcia1amKSWczBUjhO5INy9eXHwAtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2270
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBGZWJydWFyeSAxMSwgMjAyMSAxOjA0IEFNDQo+IA0KPiBPbiAxMC4wMi4yMDIxIDE4OjAwLCBB
bmRyZXcgQ29vcGVyIHdyb3RlOg0KPiA+IE9uIDEwLzAyLzIwMjEgMTY6NDgsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPiA+PiBUaGUgYWRkcmVzcyBvZiB0aGlzIHBhZ2UgaXMgdXNlZCBieSB0aGUgQ1BV
IG9ubHkgdG8gcmVjb2duaXplIHdoZW4gdG8NCj4gPj4gaW5zdGVhZCBhY2Nlc3MgdGhlIHZpcnR1
YWwgQVBJQyBwYWdlIGluc3RlYWQuIE5vIGFjY2Vzc2VzIHdvdWxkIGV2ZXIgZ28NCj4gPj4gdG8g
dGhpcyBwYWdlLiBJdCBvbmx5IG5lZWRzIHRvIGJlIHByZXNlbnQgaW4gdGhlIChDUFUpIHBhZ2Ug
dGFibGVzIHNvDQo+ID4+IHRoYXQgYWRkcmVzcyB0cmFuc2xhdGlvbiB3aWxsIHByb2R1Y2UgaXRz
IGFkZHJlc3MgYXMgcmVzdWx0IGZvcg0KPiA+PiByZXNwZWN0aXZlIGFjY2Vzc2VzLg0KPiA+Pg0K
PiA+PiBCeSBtYWtpbmcgdGhpcyBwYWdlIGdsb2JhbCwgd2UgYWxzbyBlbGltaW5hdGUgdGhlIG5l
ZWQgdG8gcmVmY291bnQgaXQsDQo+ID4+IG9yIHRvIGFzc2lnbiBpdCB0byBhbnkgZG9tYWluIGlu
IHRoZSBmaXJzdCBwbGFjZS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+DQo+ID4gSG93IGNlcnRhaW4gYXJlIHlvdSBhYm91dCB0
aGlzPw0KPiANCj4gVGhlIGRvY3VtZW50YXRpb24gKEknbSBpbmNsaW5lZCB0byBzYXk6IHVuZXhw
ZWN0ZWRseSkgaXMgdmVyeQ0KPiBjbGVhciBhYm91dCB0aGlzOyBJIGRvbid0IHRoaW5rIGl0IGhh
ZCBiZWVuIHRoaXMgY2xlYXIgYmFjayBhdA0KPiB0aGUgdGltZS4gSSdtIGhvcGluZyBmb3IgS2V2
aW4gdG8gc2hvdXQgaWYgaGUncyBhd2FyZSBvZiBpc3N1ZXMNCj4gaGVyZS4NCj4gDQoNCk5vLCBJ
IGRpZG4ndCBzZWUgYW4gaXNzdWUgaGVyZS4NCg0KVGhhbmtzDQpLZXZpbg0K

