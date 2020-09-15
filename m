Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A354269C17
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 04:49:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI11q-00084Z-IB; Tue, 15 Sep 2020 02:49:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8yY=CY=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1kI11p-00084S-3z
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 02:49:09 +0000
X-Inumbo-ID: 887ea266-6cd6-470d-b87b-115baeb99054
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 887ea266-6cd6-470d-b87b-115baeb99054;
 Tue, 15 Sep 2020 02:49:07 +0000 (UTC)
IronPort-SDR: smVzeVty7+l0xDySK+0XrcaGGq3eyyw2hJAYSZ6LOWZ5KREuMzyDK++1Okl1uurQBzmELuXK4J
 Mz9XxrZ1NL7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="177257324"
X-IronPort-AV: E=Sophos;i="5.76,428,1592895600"; d="scan'208";a="177257324"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 19:49:06 -0700
IronPort-SDR: /gvkvPtS0LalJyPsSsQQum0XbfxvgKvcZyJJgP0FqA/4oYAewI9z61wVkVAWXKYNwYiMA7FCJ+
 YUlhLf06Qhrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,428,1592895600"; d="scan'208";a="343332188"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2020 19:49:06 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Sep 2020 19:49:05 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 14 Sep 2020 19:49:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 FMSMSX102.amr.corp.intel.com (10.18.124.200) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 14 Sep 2020 19:49:04 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.54) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 14 Sep 2020 19:48:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoPfdAKEoAKchctMvyPKDrsGXYnHuaGE/QtNQ+KrcRGvCNXUOWlCnAXOT+3jE6Ve6aCvJ2qdrJ2fHIC5iprhAz4cj+g25YluXQWE8PF6nfX4cKy7yJd+mMCfFJ2TLwTblo3jiv0VXqbuF4Lt385IuTxUYhZCWr5cieydvGzm0UhbcHIcc87SBdf7APUWlkqgc7tnlnvheLyXs1xtNHrcUzZ7F35cJWwoFP5P3Akv/AKuAZ34gaRMB3nj4RwDYrXJMB4kZ5Yn/kx87NhhuTrUYLas9plwagXNuXeVevVvNZZbfnclE1zqs/B27NkIgNiJVQVAfAJmv1bKDz2MYxXdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af4MwQxOKQFqd3vJ2FreeIVgHU3WO79a5tT8UH+mDis=;
 b=YOb+myERVkzq29r8lgOCu69KaZnkC6nyVt720mCxwKipUN8rCaftvi/bfFUSuA2xgcAyPTcA8Hw4DurzyAw/MtyHTu4rmEr4nGeRQ/vvisiV/U+QwMY64+wt0quFnfBzls8NOssXrzAgEs8dK/TeBovmBltIsG1MogLEDE1QZsWl3e2s2t5EUEApz0NikNzacKdV48P2DGtXFlhC9EbFDpn6/E+fBA/yhYDMvDGn7FEv6yeYN+O4UOqIruL4ygyf3P0g218W0wzd8B5DmRY5zlY+LD9UAf4MHrq8EIVZmuk17udZ4e9oKC7XKNSiygqDIxyl6MDHBpHWyV9oY5oYUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af4MwQxOKQFqd3vJ2FreeIVgHU3WO79a5tT8UH+mDis=;
 b=TYv+qb2SZzMHsufR/Ou+9GDzNre/apXW3/p6G1mrA2K7f+tgK1PaTy4/Pp62QHI3VaVouVWXeKFq8qbkK12DJcbUFSk3bEUKFDZ9uD2JlOmOwNto9vl2EJqY6X8n3EfIxtUZjjHHGYLzvmtZj27FckMcL/H2u5JXkqh47OshF9c=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR11MB1728.namprd11.prod.outlook.com (2603:10b6:300:2b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 02:48:56 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::6dfe:feb8:25f1:ac9c%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 02:48:56 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v4 2/5] x86/pv: allow reading FEATURE_CONTROL MSR
Thread-Topic: [PATCH v4 2/5] x86/pv: allow reading FEATURE_CONTROL MSR
Thread-Index: AQHWhQI6PgNgtPlHxUa6q1fKXIwAlalpC0vQ
Date: Tue, 15 Sep 2020 02:48:55 +0000
Message-ID: <MWHPR11MB1645110688DDE2B77E2A9E888C200@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20200907103143.58845-1-roger.pau@citrix.com>
 <20200907103143.58845-3-roger.pau@citrix.com>
In-Reply-To: <20200907103143.58845-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c36754a3-8f0e-44a5-3d08-08d85921e39c
x-ms-traffictypediagnostic: MWHPR11MB1728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB172820B3C53EB709BC9301648C200@MWHPR11MB1728.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Nx1VVlnv+bvELkiq0+F93H+4OOixjs5jiDWqS/y9ZreREDp8jrkZd1KGUFygRaumHIZ6cD7RwyXvC4+dFMrvx/uxF2FV7VojyWeYfWXPfNfhmv4YB5q4cwRiAd2VuOoUO4CC1cH5DmzodFOZPNh7KBveLxyJE7cVytwPm4rc2suMVgE2CyUVGv+3IzkVmop25tACBbzE6AokTPUVzIYgt4GqgOLKEL+ab31UKBisrTB7E6O7/X5CerwyTDMSu9REY0Lf3/iyTrPGcUBm2l49GEvuHkJKw7XfIXJer2Z2/Ev/KG1BobT6FgrreEfbDP0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(86362001)(76116006)(8936002)(55016002)(9686003)(6506007)(7696005)(26005)(33656002)(52536014)(4326008)(186003)(110136005)(54906003)(2906002)(66556008)(66476007)(8676002)(64756008)(66446008)(66946007)(478600001)(316002)(83380400001)(71200400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZTlUjvvlpRRPy9qHda9wUsk3E0PRPgkI039k4D2Y2YSz2vDmjZ6UUFTxm7vRftsQaD7NK6j1X/DnKI1+Qnp2mjHsVe6sW72/zw9s9RdqyUvZMclkQ21hrtsBULCeOvTqzi6a4mHoPZYAaV3ILhF7rI8f2UkHDMvAlep6zAcTex+crUg0ez4HE6npa7nmtHgCT9SYfgtbM+VuT55eFM+NO5bkpKM1XluPCqEFDeg8urLcS07iCswVqwpGtoebu0I2+b+amh5FFbt5tupoJjNApToFp32nMe9rzWXaGyUD1c2GjObXdDbM0a27tWqPsms4MZNtrQS/3rVRsblqdHr4DUgY0BqBJT2LpRgyUPyQaz5e+R0ZOV6fnyKahVtEpHl6NSsBP1bmPPwnbxwMQR7PLfe4gkcgfDYVcEdYQP0jx6Q4iPxQEYVAbKUjrwgj19e3mtNG7odlj3o9iwhN70Gez0gZvaJiu39EvkNuW3+FghWH2Xd0YuGK3riC1H/BnrScFwJIV5oXiGnvcXc/JPMkDX+g+vCtlNVOkq3fdWJV3R0bOjS4frlvS9GhfYDKwQOUxXnFNqyDV1J0m9isGCvyiPdy8uK7j3W+Mo0aoAORdiogeZ92Ng7lSxJxu8+wHBhOz465OuRuY4fKpEXwmZuATg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36754a3-8f0e-44a5-3d08-08d85921e39c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 02:48:55.8396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pUjG6+0adNF8SDyv7+g7rNPF/FPu7r1qXyliECGFmD0g1H64q34sG0GHc260Ro4N4aS5y5knJBwq04TxsIX84w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1728
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

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBN
b25kYXksIFNlcHRlbWJlciA3LCAyMDIwIDY6MzIgUE0NCj4gDQo+IExpbnV4IFBWIGd1ZXN0cyB3
aWxsIGF0dGVtcHQgdG8gcmVhZCB0aGUgRkVBVFVSRV9DT05UUk9MIE1TUiwgc28gbW92ZQ0KPiB0
aGUgaGFuZGxpbmcgZG9uZSBpbiBWTVggY29kZSBpbnRvIGd1ZXN0X3JkbXNyIGFzIGl0IGNhbiBi
ZSBzaGFyZWQNCj4gYmV0d2VlbiBQViBhbmQgSFZNIGd1ZXN0cyB0aGF0IHdheS4NCj4gDQo+IE5v
dGUgdGhhdCB0aGVyZSdzIGEgc2xpZ2h0IGJlaGF2aW9yIGNoYW5nZSBhbmQgYXR0ZW1wdGluZyB0
byByZWFkIHRoZQ0KPiBNU1Igd2hlbiBubyBmZWF0dXJlcyBhcmUgYXZhaWxhYmxlIHdpbGwgcmVz
dWx0IGluIGEgZmF1bHQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYzOg0KPiAgLSBPbmx5IGFs
bG93IHJlYWRpbmcgdGhlIE1TUiB3aGVuIHRoZXJlIGFyZSBiaXRzIGF2YWlsYWJsZSAoZGlmZmVy
ZW50DQo+ICAgIHRoYW4gYml0IDApLg0KPiANCj4gQ2hhbmdlcyBmcm9tIHYxOg0KPiAgLSBNb3Zl
IHRoZSBWTVggaW1wbGVtZW50YXRpb24gaW50byBndWVzdF9yZG1zci4NCj4gLS0tDQo+ICB4ZW4v
YXJjaC94ODYvaHZtL3ZteC92bXguYyB8ICA4ICstLS0tLS0tDQo+ICB4ZW4vYXJjaC94ODYvbXNy
LmMgICAgICAgICB8IDEyICsrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3ZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gaW5kZXggYzRi
NDBiZjNjYi4uNzA5ZWExNDlkMSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgv
dm14LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gQEAgLTI5ODAsMTMg
KzI5ODAsNyBAQCBzdGF0aWMgaW50IHZteF9tc3JfcmVhZF9pbnRlcmNlcHQodW5zaWduZWQgaW50
DQo+IG1zciwgdWludDY0X3QgKm1zcl9jb250ZW50KQ0KPiAgICAgIGNhc2UgTVNSX0lBMzJfREVC
VUdDVExNU1I6DQo+ICAgICAgICAgIF9fdm1yZWFkKEdVRVNUX0lBMzJfREVCVUdDVEwsIG1zcl9j
b250ZW50KTsNCj4gICAgICAgICAgYnJlYWs7DQo+IC0gICAgY2FzZSBNU1JfSUEzMl9GRUFUVVJF
X0NPTlRST0w6DQo+IC0gICAgICAgICptc3JfY29udGVudCA9IElBMzJfRkVBVFVSRV9DT05UUk9M
X0xPQ0s7DQo+IC0gICAgICAgIGlmICggdm1jZV9oYXNfbG1jZShjdXJyKSApDQo+IC0gICAgICAg
ICAgICAqbXNyX2NvbnRlbnQgfD0gSUEzMl9GRUFUVVJFX0NPTlRST0xfTE1DRV9PTjsNCj4gLSAg
ICAgICAgaWYgKCBuZXN0ZWRodm1fZW5hYmxlZChjdXJyLT5kb21haW4pICkNCj4gLSAgICAgICAg
ICAgICptc3JfY29udGVudCB8PQ0KPiBJQTMyX0ZFQVRVUkVfQ09OVFJPTF9FTkFCTEVfVk1YT05f
T1VUU0lERV9TTVg7DQo+IC0gICAgICAgIGJyZWFrOw0KPiArDQo+ICAgICAgY2FzZSBNU1JfSUEz
Ml9WTVhfQkFTSUMuLi5NU1JfSUEzMl9WTVhfVk1GVU5DOg0KPiAgICAgICAgICBpZiAoICFudm14
X21zcl9yZWFkX2ludGVyY2VwdChtc3IsIG1zcl9jb250ZW50KSApDQo+ICAgICAgICAgICAgICBn
b3RvIGdwX2ZhdWx0Ow0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21zci5jIGIveGVuL2Fy
Y2gveDg2L21zci5jDQo+IGluZGV4IDc0YmY3ZDk1ODkuLjc5ZmJiOWU5NDAgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9tc3IuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbXNyLmMNCj4gQEAg
LTI1LDYgKzI1LDcgQEANCj4gICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4NCj4gDQo+ICAjaW5jbHVk
ZSA8YXNtL2RlYnVncmVnLmg+DQo+ICsjaW5jbHVkZSA8YXNtL2h2bS9uZXN0ZWRodm0uaD4NCj4g
ICNpbmNsdWRlIDxhc20vaHZtL3ZpcmlkaWFuLmg+DQo+ICAjaW5jbHVkZSA8YXNtL21zci5oPg0K
PiAgI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiBAQCAtMTk3LDYgKzE5OCwxNyBAQCBpbnQgZ3Vl
c3RfcmRtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwNCj4gdWludDY0X3QgKnZhbCkN
Cj4gICAgICAgICAgLyogTm90IG9mZmVyZWQgdG8gZ3Vlc3RzLiAqLw0KPiAgICAgICAgICBnb3Rv
IGdwX2ZhdWx0Ow0KPiANCj4gKyAgICBjYXNlIE1TUl9JQTMyX0ZFQVRVUkVfQ09OVFJPTDoNCj4g
KyAgICAgICAgaWYgKCAhY3AtPmJhc2ljLnZteCAmJiAhdm1jZV9oYXNfbG1jZSh2KSApDQo+ICsg
ICAgICAgICAgICBnb3RvIGdwX2ZhdWx0Ow0KPiArDQo+ICsgICAgICAgICp2YWwgPSBJQTMyX0ZF
QVRVUkVfQ09OVFJPTF9MT0NLOw0KPiArICAgICAgICBpZiAoIHZtY2VfaGFzX2xtY2UodikgKQ0K
PiArICAgICAgICAgICAgKnZhbCB8PSBJQTMyX0ZFQVRVUkVfQ09OVFJPTF9MTUNFX09OOw0KPiAr
ICAgICAgICBpZiAoIGNwLT5iYXNpYy52bXggKQ0KPiArICAgICAgICAgICAgKnZhbCB8PSBJQTMy
X0ZFQVRVUkVfQ09OVFJPTF9FTkFCTEVfVk1YT05fT1VUU0lERV9TTVg7DQo+ICsgICAgICAgIGJy
ZWFrOw0KPiArDQo+ICAgICAgY2FzZSBNU1JfSUEzMl9QTEFURk9STV9JRDoNCj4gICAgICAgICAg
aWYgKCAhKGNwLT54ODZfdmVuZG9yICYgWDg2X1ZFTkRPUl9JTlRFTCkgfHwNCj4gICAgICAgICAg
ICAgICAhKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmIFg4Nl9WRU5ET1JfSU5URUwpICkNCj4g
LS0NCj4gMi4yOC4wDQoNCg==

