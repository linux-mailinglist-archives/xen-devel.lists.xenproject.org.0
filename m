Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F27274A33
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 22:37:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKp1I-00060U-Be; Tue, 22 Sep 2020 20:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TWT=C7=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kKp1G-00060P-4B
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 20:36:10 +0000
X-Inumbo-ID: 18b57f00-24fc-4c6a-928e-3c398dee06cf
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18b57f00-24fc-4c6a-928e-3c398dee06cf;
 Tue, 22 Sep 2020 20:36:06 +0000 (UTC)
IronPort-SDR: ko960nfxeG6ftuNI5C+EppNICdttOEwfpVq7rhcZ8I5EivcJln46J4G6pT3Fdz9Mn7B4fJGtHe
 UL7ZtDaLix0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="245540364"
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="245540364"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 13:36:04 -0700
IronPort-SDR: J6IALuIGG1SbzJPyFpwBOXIvgQ5BaoWg8iKP6jYf+zngE1c3MMBVe4dvQwmE0905OubSNqYt/c
 9xQtKeCKbbyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="486113666"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 22 Sep 2020 13:36:04 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Sep 2020 13:36:04 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Sep 2020 13:36:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 22 Sep 2020 13:36:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 22 Sep 2020 13:36:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ku3y+dY0NSXC+bO47xdvNpp/fjtyiO4A7REj/Gj3ElqF88PDPdngNhskiMXp1xOx1uQJc4q4vHcHPRtFbmITUiBxT+wWQP6u8Odp14wsC8FqhtoDqpN6tyUMgxrYVt5/Z/Lw/t62uiREvAAZ6GSXnNhsX19E3N2elX6MaQaHVQM4dJsWvMsCkD5ISBuYi6a8/DYZmIa5VTaU3NTHLLzwJXmpL/8ds3tR3d2gzsSBvmgM/H0Xx/sTP7J/ZBK8IxzwLVNPdLjVXNho4S80PJBGoF8G+EQt5FbcnmoGLwpw2Mz2kK6nIgQlqH7x3MW7ajwhhpyoZcKoZARh40E2y9fa4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG6KSoNa9sdFpbG6KKueSP5i0QdsSOqs/ZRvs1BM+kc=;
 b=WX320QF9PXjPQcW5x26OwwhaUNlmB3GaKvNXoe+8yQhshaq4X1E2WMD/LhNONBYf4zneS+wN298HYgq6Bcszl0mkZTUCBIb2nQn3XRRFb05E4Z8gY91KOIHXGzEnLWWJZUMU+4joqFYJKDZhqtZAoL3/NhX5pYW5mYEMxkBbPAdzVjUQkqvQochKQCNAR/hmKfZ5NCY/ZE4KiZzbr5nCdtG/iP7bD5PXrEyTZn1AFK5ER3K3VW+oV8gKkvy4JDiq51dIlnBXpeiQXCzMvXs6bw3VaI2n+TNYXsApsJ6qulpms7mWc6AfUDW87zHkVJOV74+oIzh6c0DrMX0u6sz2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG6KSoNa9sdFpbG6KKueSP5i0QdsSOqs/ZRvs1BM+kc=;
 b=Pf+DABHgu7IvFZzUNkR4wU2c5xCPNspifrWv2aUiYfkzMxfgReBq5PdwMfy1KQqSH3ADNClYARNnLi++Y1V0+wQazpMFzT8EcoZKV6oZdvj1S1Mi5qQchC4HEOKHBKJqunJ5M2gbi5oEmyd108VgO4ncIrHt5Ois+dr8OcCi9OM=
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by CY4PR11MB1686.namprd11.prod.outlook.com (2603:10b6:903:30::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 20:35:59 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::d8a4:c8e2:c60f:60fa%7]) with mapi id 15.20.3326.030; Tue, 22 Sep 2020
 20:35:58 +0000
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
 Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
 <wl@xen.org>
Subject: RE: [PATCH v4 4/4] xen/mm: Provide dummy M2P-related helpers when
 !CONFIG_HAVE_M2P
Thread-Topic: [PATCH v4 4/4] xen/mm: Provide dummy M2P-related helpers when
 !CONFIG_HAVE_M2P
Thread-Index: AQHWkEGpuNLDgmCAl02PgO4dghBJ9al0TQsAgACx4YCAAAWXgIAAGbNw
Date: Tue, 22 Sep 2020 20:35:51 +0000
Message-ID: <CY4PR11MB00568952734F3643EDEB45B0FB3B0@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-5-julien@xen.org>
 <26387b5d-97f7-3c6a-ad40-94b144a3b0ae@suse.com>
 <e0a73d9b-5c68-9b57-dfe4-34e91b0972bd@xen.org>
 <3778eaa1-c1cc-d458-407f-e5ca3ca028ab@citrix.com>
In-Reply-To: <3778eaa1-c1cc-d458-407f-e5ca3ca028ab@citrix.com>
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
x-ms-office365-filtering-correlation-id: 41a568e0-4d00-4120-c1de-08d85f371ca7
x-ms-traffictypediagnostic: CY4PR11MB1686:
x-microsoft-antispam-prvs: <CY4PR11MB168641C192B8B42BC3E5371DFB3B0@CY4PR11MB1686.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hf7Tl036RHi1LLBFi6sKdcCvcp7KQp7io6o42vaQaUHCWbuNiXc5k4khpodkJV9xPcunBtsLkGkmLYuqNYPkyIanjIqH59E0nI9cU825jCZzuykJKLUQyQHu8kmIHIVQRnsJXuhXaWAecsnxE941U3Ca38h1DFZfyDZJbErHk28xLDfUZaP08Yo9S5umSZsl1yvAtgDleJJHoZxVodfz8oL65nBFa2Nj+6vYUyIxuilB04GB0kHc4y6WWZDpmzuoDRjvkg4Q7LwXNMkmfpwDasGBszEgYFCbalIsiPjsrL01XJJqa2ca+g4CRf1LGQWN7MIqql8tiWJeo72UMHtxDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(2906002)(5660300002)(53546011)(26005)(54906003)(478600001)(86362001)(52536014)(6506007)(186003)(7696005)(6666004)(4326008)(66476007)(64756008)(66556008)(71200400001)(76116006)(66946007)(66446008)(8676002)(8936002)(7416002)(83380400001)(110136005)(9686003)(316002)(55016002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: huqvT1/VkwW5m5jg7uxZ9BSVTBmXhcm1GmWDJTDNPGIZv+Ei49cKS3bUV+M5rfMipO7iJVscphBCay6dbjbLj+yMpil+vGhj98K1238VEBhMzPsmwvR9ZccDXmLbW0wwAK1Mv+T1p+GHu2TlPyH5VqzNpBXRE0AQ5wxRwsAXuwG5skPZUTiK8O9EC5NvLcymcPQbQaFhsfbQmiMTdviBvBmqf0MQLxSvIJyOOauvIX0dXxhP4GqWtxMFHlVdnM4UT6u2TWoJiU4nNsG0C1hbzVZouvvEQ4zcvL92OueR+pP4Ie77iRBzKlRsnMHLWxCAc2dPAe35+2NFDYnVqTNemV+5jqOXsyzunA4pQZGcZBAmrBJGLGOBFHF/jiYW0xkVOF6l1FLTwlhiWBEiUbvvhaSHH9QF34eebPChxKkCNAyyG0eKHibdlghIYZu9JSuIKe23H6YRV/Emf1Qh/lzfKxCwyCcY8AspUcUr2sCHbkL7R1fa/DuPdxHzRTbMDBjsPpKz9bScer6hBz3nSgQ1uUFvAp/QD0f1KMyIBgvBLAucBYI2nR3ftzgMwprh3rKHIU5QQmsMhkQLVuEcCnEb2mqcg/0czRXKnaaB2exLGtZ20Fjdp7pDwGc2WnPRKRlz70lzGbXM9Nb2lNbTSXBH/g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a568e0-4d00-4120-c1de-08d85f371ca7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 20:35:56.6540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Qv3zSzJhvTTRV9LFM/G/lsm88/SLbLNfJu54HnJJcfvcPiH5y4Q1EBM1xDMCLg/BPsmUhENR6lH5GO5CLBOTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1686
X-OriginatorOrg: intel.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDIy
LCAyMDIwIDM6MDAgUE0NCj4gVG86IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ow0KPiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBWb2xvZHlteXIgQmFiY2h1aw0K
PiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8aXdqQHhlbnByb2plY3Qub3JnPjsgV2Vp
IExpdQ0KPiA8d2xAeGVuLm9yZz47IExlbmd5ZWwsIFRhbWFzIDx0YW1hcy5sZW5neWVsQGludGVs
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA0LzRdIHhlbi9tbTogUHJvdmlkZSBkdW1t
eSBNMlAtcmVsYXRlZCBoZWxwZXJzDQo+IHdoZW4gIUNPTkZJR19IQVZFX00yUA0KPiANCj4gT24g
MjIvMDkvMjAyMCAxOTozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+IEhpIEphbiwNCj4gPg0K
PiA+IE9uIDIyLzA5LzIwMjAgMDk6MDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+PiBPbiAyMS4w
OS4yMDIwIDIwOjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4+PiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vbW0uaA0KPiA+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgNCj4gPj4+IEBAIC02
ODUsNCArNjg1LDE3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwdXRfcGFnZV9hbGxvY19yZWYoc3Ry
dWN0DQo+ID4+PiBwYWdlX2luZm8gKnBhZ2UpDQo+ID4+PiDCoMKgwqDCoMKgIH0NCj4gPj4+IMKg
IH0NCj4gPj4+IMKgICsvKg0KPiA+Pj4gKyAqIER1bW15IGltcGxlbWVudGF0aW9uIG9mIE0yUC1y
ZWxhdGVkIGhlbHBlcnMgZm9yIGNvbW1vbiBjb2RlDQo+IHdoZW4NCj4gPj4+ICsgKiB0aGUgYXJj
aGl0ZWN0dXJlIGRvZXNuJ3QgaGF2ZSBhbiBNMlAuDQo+ID4+PiArICovDQo+ID4+PiArI2lmbmRl
ZiBDT05GSUdfSEFTX00yUA0KPiA+Pj4gKw0KPiA+Pj4gKyNkZWZpbmUgSU5WQUxJRF9NMlBfRU5U
UlnCoMKgwqDCoMKgwqDCoCAofjBVTCkgI2RlZmluZSBTSEFSRURfTTJQKF9lKQ0KPiA+Pj4gK2Zh
bHNlDQo+ID4+PiArDQo+ID4+PiArc3RhdGljIGlubGluZSB2b2lkIHNldF9ncGZuX2Zyb21fbWZu
KHVuc2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZA0KPiA+Pj4gbG9uZyBwZm4pIHt9DQo+ID4+DQo+
ID4+IFdoaWxlIEkgdGhpbmsgdGhpcyB3b3VsZCBiZXR0ZXIgQlVHKCkgb3IgYXQgbGVhc3QNCj4g
Pj4gQVNTRVJUX1VOUkVBQ0hBQkxFKCksIEkgcmVhbGl6ZSBpdHMgdXNlIGluIHBhZ2VfYWxsb2Mu
YyBwcmV2ZW50cw0KPiA+PiB0aGlzLiBIb3dldmVyLCBpZiB0aGlzIHdhcyBhIG1hY3JvLCBJIHRo
aW5rIHRoZSBuZWVkIGZvciBoYXZpbmcNCj4gPj4gSU5WQUxJRF9QMk1fRU5UUlkgd291bGQgdmFu
aXNoLCBhcyBsb25nIGFzIHRoZSBzdHViIG1hY3JvIGRpZG4ndA0KPiBldmFsdWF0ZSBpdHMgMm5k
IGFyZ3VtZW50Lg0KPiA+IFRoaXMgaXMgbm90IHZlcnkgZnV0dXJlIHByb29mLi4uIFRoZSBjb3N0
IG9mIGRlZmluaW5nDQo+ID4gSU5WQUxJRF9NMlBfRU5UUlkgaXMgdmVyeSBtaW5pbWFsIGNvbXBh
cmUgdG8gdGhlIGRhbWFnZSB0aGF0IG1heQ0KPiA+IHJlc3VsdCBmcm9tIHRoaXMgY2hvaWNlLg0K
PiA+DQo+ID4+IEknbSBmZWVsaW5nIHNvbWV3aGF0IHVuZWFzeSB3aXRoIHRoZSBTSEFSRURfTTJQ
KCkgZGVmaW5pdGlvbjogVGhpcw0KPiA+PiB3b3VsZCBzZWVtIHRvIGJldHRlciBiZSB0aWVkIHRv
IENPTkZJR19NRU1fU0hBUklORyByYXRoZXIgdGhhbiBNMlANCj4gPj4gZXhpc3RlbmNlLg0KPiA+
DQo+ID4gSSBjYW4gc2VlIHByb3MgYW5kIGNvbnMgaW4gYm90aCBzb2x1dGlvbi4gVG8gbWUgaXQg
Y29udGFpbnMgdGhlIHdvcmQNCj4gPiAiTTJQIiBzbyBpdCBtYWtlcyBzZW5zZSB0byBiZSBwcm90
ZWN0ZWQgYnkgSEFTX00yUC4NCj4gPg0KPiA+IElmIHNvbWVvbmUgZWxzZSB0aGluayB0aGF0IGl0
IHNob3VsZCBiZSBwcm90ZWN0ZWQgYnkNCj4gPiBDT05GSUdfTUVNX1NIQVJJTkcsIHRoZW4gSSB3
aWxsIGRvIHRoZSBjaGFuZ2UuDQo+ID4NCj4gPiBJIGhhdmUgYWRkZWQgVGFtYXMgdG8gZ2l2ZSBo
aW0gYW4gb3Bwb3J0dW5pdHkgdG8gc2hhcmUgaGlzIHZpZXcuDQo+IA0KPiBUaGlzIGlzIGNsZWFy
bHkgZ3VhcmRlZCBieSBIQVNfTTJQIGZpcnN0IGZpcnN0IGFuZCBmb3JlbW9zdC4NCj4gDQo+IEhv
d2V2ZXIsIHRoZSB3b3JrIHRvIGFjdHVhbGx5IGxldCBNRU1fU0hBUklORyBiZSB0dXJuZWQgb2Zm
IGluIHRoaXMgcmVnYXJkIGlzDQo+IHJhdGhlciBsYXJnZXIsIGFuZCBub3QgYXBwcm9wcmlhdGUg
dG8gZGVsYXkgdGhpcyBzZXJpZXMgd2l0aC4NCg0KSSBkb24ndCBzZWUgYW55IGlzc3VlIHdpdGgg
bWFraW5nIENPTkZJR19NRU1fU0hBUklORyBhbHNvIGRlcGVuZCBvbiBDT05GSUdfSEFTX00yUCwg
c28gSU1ITyBpdCB3b3VsZCBiZSBlbm91Z2ggdG8gcHV0IGJvdGggYmVoaW5kIHRoYXQuDQoNClRh
bWFzDQo=

