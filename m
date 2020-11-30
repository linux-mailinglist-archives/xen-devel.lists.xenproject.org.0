Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E982C7CFA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 03:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40619.73517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjZEv-00054W-Oe; Mon, 30 Nov 2020 02:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40619.73517; Mon, 30 Nov 2020 02:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjZEv-000547-LE; Mon, 30 Nov 2020 02:48:33 +0000
Received: by outflank-mailman (input) for mailman id 40619;
 Mon, 30 Nov 2020 02:48:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+J0=FE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kjZEt-000542-GK
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 02:48:31 +0000
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2f62de9-9077-45b0-bb87-83db74b4f6ca;
 Mon, 30 Nov 2020 02:48:28 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2020 18:48:27 -0800
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2020 18:48:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 18:48:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 18:48:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 29 Nov 2020 18:48:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 29 Nov 2020 18:48:20 -0800
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 02:48:19 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::31c9:44c6:7323:61ac%7]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 02:48:19 +0000
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
X-Inumbo-ID: e2f62de9-9077-45b0-bb87-83db74b4f6ca
IronPort-SDR: Ul+B/BCCOIltWytTIzMplUYu/sAT8jGd1QGlyltEkEj8RD5EPCxXHpQGD64QOqrWNS11FxkEZx
 thnRbACRoumw==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="160345539"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="160345539"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
IronPort-SDR: 9XTw6KOFLyjkmdYJ9SJRy4Zh/ztqsfp193sHe345yWgPJWLmGc7DDl/PRSe19BBYFOAUQ5yy4L
 eQtwIYyhfVHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="538428521"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ai+4F7U8mio+/ht1sGh1ZKVHqFRm01YGT7bQoxKg0Zq9tcGXgwW/iGnW6wYjyaw/rGlplc6YsI5QnR2mTnKtao45PUnZtK9YaTSQWkgR1cDWTjNzbgOJXVaB33cngYH/byXfMOIZrd+HXdWmfkvx4Y1P/Wd/ZFI4mZsV13VrCO//F59aiLR8wwJAvt5YQfeBdExR4LQEU6kVtgG1qAT8Ww6gC95dtWBS9aeccqUvjMcz6MOeO+Xk8Okql/GRir3Xp7upiK3HjdfkWQyABKMtGtM/SjSC4jMjK1H3VAX+tVSUEP0k7ftdR6mg35Va3dJvetucqaoYUx1vdvOsHyQA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3sqJ4zOMuW/7klBLWT2EcsUv5E5sUH3HBV6NHvBMI4=;
 b=WP2csqRx0kvlyURRn0dA6qxEn2OMyxL8p8363UAiyVjIy0kMIsEdfVmyPjYqSAWYg2bNG18QKdUtqHkRGKKEK0tZZUCaZsrfKgY8KnXUngFm2hwGUDyXV1oK980wk9h6oyUL9rD4AcB5gb7fy4Q9jifZdwwQPXwstmJAYy2cyj/B2guGWs1flBBL1JpeFJ3h1HOJzyfz4rvr4ECjWgR+0W+C9SChmWZKCyrHMGbSQiSdyMDGcIgwSrU2TCgeBXTOet/bMXgFxcKgCKia2xzxztw2twhppG6RaOWPHQaAZqWaGT66h8IQBo1CGTUMCj+14XuSki0P9hdaAscaksOBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3sqJ4zOMuW/7klBLWT2EcsUv5E5sUH3HBV6NHvBMI4=;
 b=Nre+7jbqfn4OBoSbTkVKCHJ4sDb26gE7teyCjCwOQ4Zhi9csqn+SHSB6dyCSS5NpERMCERUr5j47m1G67hsD+j4YIjMK8FAOveErDswW4OAbs38nye2quEPvAtZms31mJUFuvvfYU60hkH2jbu/FygJUj/iCTyEnIfo/m8UH5Iw=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, "Nakajima, Jun"
	<jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v3 13/13] x86: replace open-coded occurrences of
 sizeof_field()...
Thread-Topic: [PATCH v3 13/13] x86: replace open-coded occurrences of
 sizeof_field()...
Thread-Index: AQHWwphVvkgPQ2EqeUezHV5G5mGBFKngASIQ
Date: Mon, 30 Nov 2020 02:48:19 +0000
Message-ID: <MWHPR11MB1645B36F8461F16F6A6151898CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20201124190744.11343-1-paul@xen.org>
 <20201124190744.11343-14-paul@xen.org>
In-Reply-To: <20201124190744.11343-14-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c3a826d-91cf-4f43-794a-08d894da652b
x-ms-traffictypediagnostic: CO1PR11MB5028:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB50288A60F8F9D49D3B569D1A8CF50@CO1PR11MB5028.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:669;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g85pYz290st+7L/msBM9U9DlhBCje8PPWNqk+NTvWSbEEWoe+ha1PhfEg4F5/XwJzmg5sqa6wuhIbbpuHYx3+PZdS6Dx4ZfIcal4jNoqsgEtqAM/V9T/dOjK08HJUyNierQEnJWoWOekwRv29cnYntYiOCSlb9XvW+jTKpiewDYQgbQUClvOFT+A7BmSfN/Axs2i4UJsrRXr7JIgABSKGPRdQDB1Y8hCUAeSCO+A6S4LwAOHwpAVawd6ABn7HsWv8h/4eN3YfPX4oHQZw4gWG5Dz5wg4dw3lLVHPBbB14GQg34JDP7nAUqvyhVljQnc5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1645.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(71200400001)(9686003)(52536014)(6506007)(4326008)(7696005)(86362001)(8936002)(5660300002)(54906003)(316002)(76116006)(64756008)(186003)(26005)(8676002)(2906002)(66446008)(33656002)(110136005)(66476007)(478600001)(66556008)(55016002)(66946007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WG5xWVZEc3ZhbEVTOUM1ckhSMVdKMFlCZFVqT1hERlVDcnUxT083R0poZ2xQ?=
 =?utf-8?B?ei83SXdOcFZCN29JZ1NiVHpBUFp3d2FVTkNodU10QTFnenF1dXgyeDdlNWsy?=
 =?utf-8?B?WWtmbXIzeWV3MUVMbFVHS3I3NWJYNHJETTR1cTdqaDgvT0ZrSkRJRjlaeGpM?=
 =?utf-8?B?R1Z6WEIxR0Y4Sy8xVGZPTE44eE5zcWhGWEJoTSs5eTV1aHVrUDE4WFBlOTFa?=
 =?utf-8?B?Mk9VM2wyc2M2Q3Q2Z3RJdlhQa2VxYzh3N0F6THpNdmV1a0pvSUJReFlxVlBp?=
 =?utf-8?B?WDk1Z1hoMzRFOURiaG1xbmZrSlh3NUl2MU9PQ21sc2hua1ZJNWlJaTN3RHY5?=
 =?utf-8?B?eGdaNkVuVVgrWWp5RzkvZ3BUSEFRT25YTTViSDVqeWtwZGpYTGhOQUZlZy9r?=
 =?utf-8?B?TUphRUxnaGkyZk9uUjF2TnUwSnk1dFhnSDVubDBoamdxM01hL0RTTm9rRTQw?=
 =?utf-8?B?YzJoUlN0cW9Hb011OU16bjlZUE0yT0VLRWkyNU9HZStlaFp5MEFocXBqMloz?=
 =?utf-8?B?Zjc4cmFIRUVNMXNsdzRMWmQxS0txK29veXNqQmJtWmhaazkwbkIyYXFpclJH?=
 =?utf-8?B?SzM4U295Um1qcFBvN1hRVWcvME1sYU1pZlNKOXY2SS9rYjdFQXM3bFdxaHJW?=
 =?utf-8?B?TGxRZTFpY2c3OUI3MU9rWDFobGFkdXE0aDlqZzNpSWFDT0Y3NFRHU0hEOWln?=
 =?utf-8?B?dUJud2xYYXNybW9tNW1ZZnRBajFTUWYwZm1RL0tnYms3aDJKMHBLMWNzbVRY?=
 =?utf-8?B?NFFHSThYOWZtWjJhMFNJM0xuNm1GT2prWmlxNWVZa1YyMFNITWQ4cmJRYXFF?=
 =?utf-8?B?bGp3bW9JNHpNYUVmR1JnbkowMVFLOGV1NzQ4RnJXaEdPL1lxNFlaMUU3dUJC?=
 =?utf-8?B?WHgrQUhGQWNNOHlPRHY4UDFvY1Y5K0NKNWVrYzhhZGEyYlZGUWl0Zkh6Qy9m?=
 =?utf-8?B?aHM5K1ZvMHFUYUxXMVdTUHhCZWtmQ0dPaUJ4SXdocFFBYkFRSVg5ZEhLMnBk?=
 =?utf-8?B?NFhWTVNQdTlsQzJlNFlpNEJSWEJJanFuLzZ0MlJXM2hEQTY3YXB0QTVEMFhS?=
 =?utf-8?B?ekI1WDRmdlNid01QTmhhZ2NZdm9DS2dCSk9hRmN6cG9GSVhhU1hVYmlDdXVQ?=
 =?utf-8?B?TUd6T2pqQ01GcmFMQnFveGhGc3oyQ1dicUNicTcyYkdCZUJxY281UzFHNytw?=
 =?utf-8?B?QlI5ZnQ5Uk9TZHFZOSsybVBqVEpURk1QeC9mSFBjZFdseTVZUDJwMkRTYWVj?=
 =?utf-8?B?RFg3aWtHM1N3RW1NTEo0UmFLN21ZQnZodDVCVzI5WjdZUUVtV2xsZHkwb29U?=
 =?utf-8?Q?CaIwdcSJO9d7c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3a826d-91cf-4f43-794a-08d894da652b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 02:48:19.3324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53wmVr29NeGQLRP2u3PJDtVau76NaYAxCouqejuhqJ012PlzaK9RSzEvUR5AIAgCEafUum3DB93x9k0mEb6KZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-OriginatorOrg: intel.com

PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBO
b3ZlbWJlciAyNSwgMjAyMCAzOjA4IEFNDQo+IA0KPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+DQo+IA0KPiAuLi4gd2l0aCBtYWNybyBldmFsdWF0aW9ucywgbm93IHRo
YXQgaXQgaXMgYXZhaWxhYmxlLg0KPiANCj4gQSByZWNlbnQgcGF0Y2ggaW1wb3J0ZWQgdGhlIHNp
emVvZl9maWVsZCgpIG1hY3JvIGZyb20gTGludXguIFRoaXMgcGF0Y2gNCj4gbWFrZXMNCj4gdXNl
IG9mIGl0IGluIHBsYWNlcyB3aGVyZSB0aGUgY29uc3RydWN0IGlzIGN1cnJlbnRseSBvcGVuLWNv
ZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoN
Cj4gLS0tDQo+IENjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+DQo+IENj
OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gQ2M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvY3B1
L3ZwbXVfaW50ZWwuYyB8ICA0ICsrLS0NCj4gIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAg
IHwgMTYgKysrKysrKystLS0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1
L3ZwbXVfaW50ZWwuYw0KPiBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9pbnRlbC5jDQo+IGluZGV4
IDc1YWExMWM2YWRlYy4uNmU5N2NlNzkwMDM3IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYv
Y3B1L3ZwbXVfaW50ZWwuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50ZWwuYw0K
PiBAQCAtOTAsOCArOTAsOCBAQCBzdGF0aWMgdWludDY0X3QgX19yZWFkX21vc3RseSBnbG9iYWxf
b3ZmX2N0cmxfbWFzaywNCj4gZ2xvYmFsX2N0cmxfbWFzazsNCj4gIHN0YXRpYyB1bnNpZ25lZCBp
bnQgX19yZWFkX21vc3RseSByZWdzX3N6Ow0KPiAgLyogT2Zmc2V0IGludG8gY29udGV4dCBvZiB0
aGUgYmVnaW5uaW5nIG9mIFBNVSByZWdpc3RlciBibG9jayAqLw0KPiAgc3RhdGljIGNvbnN0IHVu
c2lnbmVkIGludCByZWdzX29mZiA9DQo+IC0gICAgICAgIHNpemVvZigoKHN0cnVjdCB4ZW5fcG11
X2ludGVsX2N0eHQgKikwKS0+Zml4ZWRfY291bnRlcnMpICsNCj4gLSAgICAgICAgc2l6ZW9mKCgo
c3RydWN0IHhlbl9wbXVfaW50ZWxfY3R4dCAqKTApLT5hcmNoX2NvdW50ZXJzKTsNCj4gKyAgICBz
aXplb2ZfZmllbGQoc3RydWN0IHhlbl9wbXVfaW50ZWxfY3R4dCwgZml4ZWRfY291bnRlcnMpICsN
Cj4gKyAgICBzaXplb2ZfZmllbGQoc3RydWN0IHhlbl9wbXVfaW50ZWxfY3R4dCwgYXJjaF9jb3Vu
dGVycyk7DQo+IA0KPiAgLyoNCj4gICAqIFFVSVJLIHRvIHdvcmthcm91bmQgYW4gaXNzdWUgb24g
dmFyaW91cyBmYW1pbHkgNiBjcHVzLg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVw
LmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPiBpbmRleCA0NGMwNGUyNzM1MzcuLjMwZDZmMzc1
YTNhZiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMNCj4gKysrIGIveGVuL2Fy
Y2gveDg2L3NldHVwLmMNCj4gQEAgLTE2MTcsMTkgKzE2MTcsMTkgQEAgdm9pZCBfX2luaXQgbm9y
ZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZw0KPiBtYmlfcCkNCj4gICAgICB0b3RhbF9w
YWdlcyA9IG5yX3BhZ2VzOw0KPiANCj4gICAgICAvKiBTYW5pdHkgY2hlY2sgZm9yIHVud2FudGVk
IGJsb2F0IG9mIGNlcnRhaW4gaHlwZXJjYWxsIHN0cnVjdHVyZXMuICovDQo+IC0gICAgQlVJTERf
QlVHX09OKHNpemVvZigoKHN0cnVjdCB4ZW5fcGxhdGZvcm1fb3AgKikwKS0+dSkgIT0NCj4gLSAg
ICAgICAgICAgICAgICAgc2l6ZW9mKCgoc3RydWN0IHhlbl9wbGF0Zm9ybV9vcCAqKTApLT51LnBh
ZCkpOw0KPiAtICAgIEJVSUxEX0JVR19PTihzaXplb2YoKChzdHJ1Y3QgeGVuX2RvbWN0bCAqKTAp
LT51KSAhPQ0KPiAtICAgICAgICAgICAgICAgICBzaXplb2YoKChzdHJ1Y3QgeGVuX2RvbWN0bCAq
KTApLT51LnBhZCkpOw0KPiAtICAgIEJVSUxEX0JVR19PTihzaXplb2YoKChzdHJ1Y3QgeGVuX3N5
c2N0bCAqKTApLT51KSAhPQ0KPiAtICAgICAgICAgICAgICAgICBzaXplb2YoKChzdHJ1Y3QgeGVu
X3N5c2N0bCAqKTApLT51LnBhZCkpOw0KPiArICAgIEJVSUxEX0JVR19PTihzaXplb2ZfZmllbGQo
c3RydWN0IHhlbl9wbGF0Zm9ybV9vcCwgdSkgIT0NCj4gKyAgICAgICAgICAgICAgICAgc2l6ZW9m
X2ZpZWxkKHN0cnVjdCB4ZW5fcGxhdGZvcm1fb3AsIHUucGFkKSk7DQo+ICsgICAgQlVJTERfQlVH
X09OKHNpemVvZl9maWVsZChzdHJ1Y3QgeGVuX2RvbWN0bCwgdSkgIT0NCj4gKyAgICAgICAgICAg
ICAgICAgc2l6ZW9mX2ZpZWxkKHN0cnVjdCB4ZW5fZG9tY3RsLCB1LnBhZCkpOw0KPiArICAgIEJV
SUxEX0JVR19PTihzaXplb2ZfZmllbGQoc3RydWN0IHhlbl9zeXNjdGwsIHUpICE9DQo+ICsgICAg
ICAgICAgICAgICAgIHNpemVvZl9maWVsZChzdHJ1Y3QgeGVuX3N5c2N0bCwgdS5wYWQpKTsNCj4g
DQo+ICAgICAgQlVJTERfQlVHX09OKHNpemVvZihzdGFydF9pbmZvX3QpID4gUEFHRV9TSVpFKTsN
Cj4gICAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKHNoYXJlZF9pbmZvX3QpID4gUEFHRV9TSVpFKTsN
Cj4gICAgICBCVUlMRF9CVUdfT04oc2l6ZW9mKHN0cnVjdCB2Y3B1X2luZm8pICE9IDY0KTsNCj4g
DQo+IC0gICAgQlVJTERfQlVHX09OKHNpemVvZigoKHN0cnVjdCBjb21wYXRfcGxhdGZvcm1fb3Ag
KikwKS0+dSkgIT0NCj4gLSAgICAgICAgICAgICAgICAgc2l6ZW9mKCgoc3RydWN0IGNvbXBhdF9w
bGF0Zm9ybV9vcCAqKTApLT51LnBhZCkpOw0KPiArICAgIEJVSUxEX0JVR19PTihzaXplb2ZfZmll
bGQoc3RydWN0IGNvbXBhdF9wbGF0Zm9ybV9vcCwgdSkgIT0NCj4gKyAgICAgICAgICAgICAgICAg
c2l6ZW9mX2ZpZWxkKHN0cnVjdCBjb21wYXRfcGxhdGZvcm1fb3AsIHUucGFkKSk7DQo+ICAgICAg
QlVJTERfQlVHX09OKHNpemVvZihzdGFydF9pbmZvX2NvbXBhdF90KSA+IFBBR0VfU0laRSk7DQo+
ICAgICAgQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgY29tcGF0X3ZjcHVfaW5mbykgIT0gNjQp
Ow0KPiANCj4gLS0NCj4gMi4yMC4xDQoNCg==

