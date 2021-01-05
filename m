Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B82EAF61
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 16:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62059.109632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwobn-0001nb-5Q; Tue, 05 Jan 2021 15:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62059.109632; Tue, 05 Jan 2021 15:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwobn-0001nE-23; Tue, 05 Jan 2021 15:50:55 +0000
Received: by outflank-mailman (input) for mailman id 62059;
 Tue, 05 Jan 2021 15:50:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1U5=GI=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kwobl-0001n9-OM
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 15:50:53 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8cd0cb6-5e95-427e-a292-b7d454bb8095;
 Tue, 05 Jan 2021 15:50:51 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 07:50:42 -0800
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 05 Jan 2021 07:50:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 5 Jan 2021 07:50:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 5 Jan 2021 07:50:41 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 5 Jan 2021 07:50:41 -0800
Received: from BN6PR11MB0049.namprd11.prod.outlook.com (2603:10b6:405:67::13)
 by BN7PR11MB2851.namprd11.prod.outlook.com (2603:10b6:406:ac::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Tue, 5 Jan
 2021 15:50:39 +0000
Received: from BN6PR11MB0049.namprd11.prod.outlook.com
 ([fe80::3d81:1113:32ba:b726]) by BN6PR11MB0049.namprd11.prod.outlook.com
 ([fe80::3d81:1113:32ba:b726%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 15:50:39 +0000
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
X-Inumbo-ID: d8cd0cb6-5e95-427e-a292-b7d454bb8095
IronPort-SDR: 00T6EoS4afsH+UScbzcE4T1No0OVTLCa7/j31SpN7EPlRYgvFf8dF2Tl2jEkTjtFIvWj3m39Sk
 gBZnP1wuapXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="195659418"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="195659418"
IronPort-SDR: Y5lChyTdqN1aXRYuomfMKe8q+sgeGHM2VVnq1n4V6/lr2q5miaENjj1of9xklt8ND6FwLM+yUg
 Uv6NKTa09mcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="496821546"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUvuOH/hpX0rjTsNSyIKGi/C7CCA2OVYUotcOa03qwlLpPxEkMB/I0uEJZt67zzy1l2fTnPMWadRBYeMErM5xiA1npukoQjv9BMehs5nJQmdLmQKTxdLKeCDv5Y/Lww9f2qY5s1KbCDS6C0y6MULNkKgwUuJI7dhz4HDiEDzABQjHU2gbly1ucT0BsZRUsNdCtXSrdc3InUj42aztD1/A1bmDB/61+A++53jZex9PIjyuR97R4lVXHLFtnAOXAUWXSzfEA4mkNzRiCbCbl4Wa8QtcMug6e25qCWMQh/l33YYPipxoOol5p4pCnmYTDcb2a61mpu25fuAycyGQ6EB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIwDntTtRN6RqhPBFGPwgTmZTmSzrA6PrRjWPnDCrWk=;
 b=nFx8IOTDkzp6/kQrt5XqNRY0u/idt7RSEl6x/unpenkUHlqWnDsV87Dj+rzSfy9DC+X+8KqheKNkStmqCxsrfEEdcCUORtP++zHKzc/kphN75lRBTn8TOAsr93haTgeEQDDr+BWm0cudqiBAwXWaD7bbMzJhAQ5dyiZBPLN0k+1RSbIyGEB7EMlnYApVMmLOeIxcUCfWvAXoWv0JzmDRHjkLPmkmCWX5oJ0kGa6U/ONTYeYccJMgSOQJH04T57pMGxbYQDNuPyKkRFYS/k1IkIM2D/Ukar8pl2EX+L/oqUFU+mHgUMR3/1bvnwY6y1HuIjj9yv8xkVddMSu0PwCqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIwDntTtRN6RqhPBFGPwgTmZTmSzrA6PrRjWPnDCrWk=;
 b=a6FlVc0oT1S5MDQuZeDoRCjjFSVk6xS6O7ruXrFyweOEsph+Or6gVvEG1nOj0wll0jSp/j5WrpGf6tMxdSJIYlkOGTPB3dDWovp3466f/rTJFp4Pvo5IKaubnWHR06WKYmRrGKmLi892HMaaDXzE0ATxrwIsACfuh6VNDCEI/18=
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH 1/2] x86/mem_sharing: copy cpuid during vm forking
Thread-Topic: [PATCH 1/2] x86/mem_sharing: copy cpuid during vm forking
Thread-Index: AQHW4sD0GmLIB85B4UqCGafOB8ldQKoY35iAgABOlwA=
Date: Tue, 5 Jan 2021 15:50:39 +0000
Message-ID: <BN6PR11MB0049D21959B95836B4997594FBD10@BN6PR11MB0049.namprd11.prod.outlook.com>
References: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
 <7cfa7763-e905-58a0-d4c6-2cca0a54b1ad@citrix.com>
In-Reply-To: <7cfa7763-e905-58a0-d4c6-2cca0a54b1ad@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.119.195.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b360c8a3-64a5-4536-6abb-08d8b191a66a
x-ms-traffictypediagnostic: BN7PR11MB2851:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB285180E9A262DA5FCC51BC70FBD10@BN7PR11MB2851.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 73ZRWn82IHDiIoBOiAn7ZyI3/UZaxwp+kKs9IEO7i/DYmK4Xdk2c7zkoyQepHdx5VEi0b6IZLyvXim4tppMWnAI2tPznQQMjlc+MYEdDEwQUoDa399ZK+FuXAgG+AcFGRvI+BgZrKsQ/hPWTB6HiajR4tp08VBDG609N+XuulnleXLZdry//26Y56CiG9QbTuhjrwRRAGGy2IZJy1wJkrZTh2SHaNp1JjHcK18G4xmCp0ese0VRlKqbO5t2tp26CUV8YARq+b76wVusVcvC9KP8eYFzURTJBmkplpFLVKZedcc3w6VmZW6B9x2f3z7wJj/SwrDsFgJ940N6uMso8/tGg33szT5p+7bpu6e0Yw+Yx41O0edikioYeN9qlGUx88AJq2hwsONGDAW+K89GS4w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0049.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(66556008)(64756008)(478600001)(8676002)(66476007)(53546011)(83380400001)(316002)(186003)(52536014)(5660300002)(71200400001)(66446008)(4326008)(6506007)(33656002)(76116006)(7696005)(9686003)(26005)(55016002)(86362001)(8936002)(2906002)(54906003)(66946007)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SG9UVFdnVVdoM1E5Z0NCYmwybzd4MUFVdzc3dnJPL3JINkF3ZDRFR0V3R3Z6?=
 =?utf-8?B?NnVwU2N2aENqZmpUa3doREhFS2ZJYTBraW0rYXM0ZXBQT3A4RnpZSTh2bCtV?=
 =?utf-8?B?V3ZEYlVLQnA2cG9LL200T1draEREd0hiM0MwMERZc2NNSlBTMTJHODBDZ0Zh?=
 =?utf-8?B?eStBeVdJc09zRjgvZXlMajlwaHJFZkozNzRPdFlDS1FXbEk5WWthRTVCTTNB?=
 =?utf-8?B?bmh2RHFwT0ZQdU8yeEpsejFrK1VpNDFMbE55bjlpakRtRnZRU05mSjFBWGlM?=
 =?utf-8?B?aEt0TThOa0o4eFlCV2o4WXNOQnZzMGNCV2FjSHpWRUV0eFRLV09uSTU0T3dU?=
 =?utf-8?B?Ri9NTXNtckxWR21xcWtqdUNCbVBtNUsrcjM4UHFFWldwRXlwTlFzaDBydEx2?=
 =?utf-8?B?ZCtvUm1HbFhreWNaelBjRkQ5eWNnYWN4ODVnVElKSEF5cHBnL3lsb21DMUw3?=
 =?utf-8?B?a3AwNkxMQkF6eW1QTFh5c1R0SkUxZGQrckg0M1FScDRuWG1hQ3BmM1JGRE5S?=
 =?utf-8?B?QkRLM2tvOTBNRGZCV2hPdERHV2wrd0NKaDB4SVd5WVBJZ3dTSHlCcndlek8x?=
 =?utf-8?B?WlNQTjNrd1ZpQ2o4TzFZNXZ6L0dKTU5VZmZYdzhJblFSbE5IeWpldDFmWi9S?=
 =?utf-8?B?TTVvbW1MRk9CNWVVZFdiTk8wTWpnSm5yeXBSazl5MDN6OTBaZ1JjcjV6bHJL?=
 =?utf-8?B?U3d5d3NwOXR1TDJBUkZTOVRkSW5mV0tsTGhPR1hsdHJwcExQMit3Y2dCZFZu?=
 =?utf-8?B?b3BYNXBOK3F5NlNvRllrSVFKNzhESm8xMTNHb1JoMmVMcWNaZ3Y4ZlhKTEM0?=
 =?utf-8?B?ZEd0U0MvVHJWTnJJWGIzZXB3eGMxMmlEeEw1dHlxMDVhLzZnQW5ibmgxdnpC?=
 =?utf-8?B?dXB6djZxMVVhb1NVODJNVDVLQkhxcURYTHZqOFFrOXBGQlVOMFNCdWlnSlhm?=
 =?utf-8?B?TzN4M0Zld24vM1hpWFNvaVlDdW02L3FxbzdPWnJWZWZaMVV5bVJLT3FOWFNp?=
 =?utf-8?B?ZzByNDkwanFyeTRZcVFPNW40UlVaS1kyMm9UVXh2YmRucmtiRXhzazNRNU1n?=
 =?utf-8?B?K09hYXBuMVJEM2NDNzBXRWV1NnlBYXR5dVd0RksySUo0WlNzMDE4bTZYOUJF?=
 =?utf-8?B?NXdiU01UcXN0OGhNcWFYbGJOL2hSbW5HUU1kTjc3OVhBYmk1SnNEZjlkeno0?=
 =?utf-8?B?M1JhWTRleXlJa05WTEp0SXFXb2FrM2JieURVYzRrcnAvQUhESFV5WFN1SGNH?=
 =?utf-8?B?eTFSS1ZTLzJRU0F1bEtpZm53bndNKytmZzVZbFlUSnR3QmVjL2xyNEVCZTZv?=
 =?utf-8?Q?9Ru7LuYP6R+hU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b360c8a3-64a5-4536-6abb-08d8b191a66a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 15:50:39.2352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FG7vOV5yT6gugt9gd2apKUwTsXkplCheODuFucb+QhRhj5Q0jt4efJRiLZA37VU1+xWqDyYvEgtseJL3hDboKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2851
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSA1LCAy
MDIxIDY6MDUgQU0NCj4gVG86IExlbmd5ZWwsIFRhbWFzIDx0YW1hcy5sZW5neWVsQGludGVsLmNv
bT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFRhbWFzIEsgTGVu
Z3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IEphbiBCZXVsaWNoDQo+IDxqYmV1bGljaEBzdXNl
LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IFJvZ2VyDQo+
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIHg4Ni9tZW1fc2hhcmluZzogY29weSBjcHVpZCBk
dXJpbmcgdm0gZm9ya2luZw0KPiANCj4gT24gMDQvMDEvMjAyMSAxNzo0MSwgVGFtYXMgSyBMZW5n
eWVsIHdyb3RlOg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVu
Z3llbEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmlu
Zy5jIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jDQo+ID4gYi94ZW4vYXJj
aC94ODYvbW0vbWVtX3NoYXJpbmcuYyBpbmRleCBjNDI4ZmQxNmNlLi40YTAyYzdkNmYyDQo+IDEw
MDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jDQo+ID4gKysrIGIv
eGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMNCj4gPiBAQCAtMTc2NCw2ICsxNzY0LDcgQEAg
c3RhdGljIGludCBmb3JrKHN0cnVjdCBkb21haW4gKmNkLCBzdHJ1Y3QgZG9tYWluDQo+ID4gKmQp
DQo+ID4NCj4gPiAgICAgICAgICBkb21haW5fcGF1c2UoZCk7DQo+ID4gICAgICAgICAgY2QtPm1h
eF9wYWdlcyA9IGQtPm1heF9wYWdlczsNCj4gPiArICAgICAgICBtZW1jcHkoY2QtPmFyY2guY3B1
aWQsIGQtPmFyY2guY3B1aWQsDQo+ID4gKyBzaXplb2YoKmQtPmFyY2guY3B1aWQpKTsNCj4gPiAg
ICAgICAgICBjZC0+cGFyZW50ID0gZDsNCj4gPiAgICAgIH0NCj4gPg0KPiANCj4gWW91IG5lZWQg
dG8gZXh0ZW5kIHRoaXMgdG8gZC0+YXJjaC5tc3IgYW5kIHYtPmFyY2gubXNycyBvciBzb21lb25l
IGlzDQo+IGdvaW5nIHRvIGhhdmUgYSB2ZXJ5IHN1YnRsZSBidWcgdG8gZGVidWcgaW4gdGhlIGZ1
dHVyZS4NCg0KSSBuZWVkIG1vcmUgaW5mb3JtYXRpb24gd2h5IHYtPmFyY2gubXNycyB3b3VsZCBu
ZWVkIHRvIGJlIGNvcGllZCBtYW51YWxseS4gSWYgaXQncyBzYXZlZC9yZWxvYWRlZCBieSBodm1f
c2F2ZS9odm1fbG9hZCB0aGVuIHdlIGFyZSBhbHJlYWR5IGNvdmVyZWQuIElmIG5vdCwgdGhlbiB3
aHkgd291bGQgd2UgbmVlZCB0byBkbyB0aGF0IGZvciBmb3JrcyBidXQgbm90IGZvciBkb21haW4g
c2F2ZS9yZXN0b3JlPw0KDQpUYW1hcw0K

