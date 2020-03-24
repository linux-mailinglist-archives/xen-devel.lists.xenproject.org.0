Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8E3190A83
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 11:19:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGgcI-0001SI-8J; Tue, 24 Mar 2020 10:17:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8ME=5J=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jGgcH-0001SD-0X
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 10:17:01 +0000
X-Inumbo-ID: 98068d9e-6db8-11ea-b34e-bc764e2007e4
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98068d9e-6db8-11ea-b34e-bc764e2007e4;
 Tue, 24 Mar 2020 10:16:58 +0000 (UTC)
IronPort-SDR: fVbF5/1/LG06lue83jGkbNwvDE2cTFh/9cJLTJdXv/GE2aDq+nOa+rj6TXjiZ17wIkAkBzNruZ
 sLuExEqhEXkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 03:16:57 -0700
IronPort-SDR: psZ8DdNBeBmB1REW/d7ZuNKbZ4s/P0tW2Iv3QCBFJGWDB2NbGcjbhICfOHIWIg0Og7UVYs6JeD
 viEdpWBzadMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="447831657"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2020 03:16:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 24 Mar 2020 03:16:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Mar 2020 03:16:56 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Mar 2020 03:16:56 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.137]) with mapi id 14.03.0439.000;
 Tue, 24 Mar 2020 18:16:53 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 3/3] x86/nvmx: update exit bitmap on vmexit
Thread-Index: AQHV/urpfF5j4vGzhUi/L3UBZDzwCKhXRtFA//+6/YCAAImY0A==
Date: Tue, 24 Mar 2020 10:16:52 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E6084@SHSMSX104.ccr.corp.intel.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-4-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5B94@SHSMSX104.ccr.corp.intel.com>
 <20200324095915.GG24458@Air-de-Roger.citrite.net>
In-Reply-To: <20200324095915.GG24458@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/3] x86/nvmx: update exit bitmap on vmexit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
VHVlc2RheSwgTWFyY2ggMjQsIDIwMjAgNTo1OSBQTQ0KPiANCj4gT24gVHVlLCBNYXIgMjQsIDIw
MjAgYXQgMDY6MjI6NDNBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4gPiBGcm9tOiBS
b2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+ID4gU2VudDogU2F0dXJk
YXksIE1hcmNoIDIxLCAyMDIwIDM6MDggQU0NCj4gPiA+DQo+ID4gPiBDdXJyZW50IGNvZGUgaW4g
bnZteF91cGRhdGVfYXBpY3Ygc2V0IHRoZSBndWVzdCBpbnRlcnJ1cHQgc3RhdHVzIGZpZWxkDQo+
ID4gPiBidXQgZG9lc24ndCB1cGRhdGUgdGhlIGV4aXQgYml0bWFwLCB3aGljaCBjYW4gY2F1c2Ug
aXNzdWVzIG9mIGxvc3QNCj4gPiA+IGludGVycnVwdHMgb24gdGhlIEwxIGh5cGVydmlzb3IgaWYg
dm14X2ludHJfYXNzaXN0IGdldHMNCj4gPiA+IHNob3J0LWNpcmN1aXRlZCBieSBudm14X2ludHJf
aW50ZXJjZXB0IHJldHVybmluZyB0cnVlLg0KPiA+DQo+ID4gQWJvdmUgaXMgbm90IGFjY3VyYXRl
LiBDdXJyZW50bHkgWGVuIGRpZG4ndCBjaG9vc2UgdG8gdXBkYXRlIHRoZSBFT0kNCj4gPiBleGl0
IGJpdG1hcCBldmVyeSB0aW1lIHdoZW4gdGhlcmUgaXMgYSBjaGFuZ2UuIEluc3RlYWQsIGl0IGNo
b3NlIHRvDQo+ID4gYmF0Y2ggdGhlIHVwZGF0ZSBiZWZvcmUgcmVzdW1pbmcgdG8gdGhlIGd1ZXN0
LiBzb3J0IG9mIG9wdGltaXphdGlvbi4NCj4gPiBTbyBpdCBpcyBub3QgcmVsYXRlZCB0byB3aGV0
aGVyIFNWSSBpcyBjaGFuZ2VkLiBXZSBzaG91bGQgYWx3YXlzIGRvIHRoZQ0KPiA+IGJpdG1hcCB1
cGRhdGUgaW4gbnZteF91cGRhdGVfYXBpY3YsIHJlZ2FyZGxlc3Mgb2YgdGhlIHNldHRpbmcgb2YN
Cj4gPiBBY2stb24tZXhpdCAuLi4NCj4gDQo+IEJ1dCBpZiBBY2sgb24gZXhpdCBpcyBub3Qgc2V0
IHRoZSBHVUVTVF9JTlRSX1NUQVRVUyB3b24ndCBiZSBjaGFuZ2VkDQo+IGJ5IG52bXhfaW50cl9p
bnRlcmNlcHQsIGFuZCBoZW5jZSB0aGVyZSdzIG5vIG5lZWQgdG8gdXBkYXRlIHRoZSBFT0kNCj4g
ZXhpdCBtYXA/DQo+IA0KPiBJZiBPVE9IIHRoZSBHVUVTVF9JTlRSX1NUQVRVUyBmaWVsZCBpcyBj
aGFuZ2VkIGJ5IHZteF9pbnRyX2Fzc2lzdCB0aGUNCj4gYml0bWFwIHdpbGwgYWxyZWFkeSBiZSB1
cGRhdGVkIHRoZXJlLg0KPiANCg0KSWYgeW91IGFncmVlIHdpdGggbXkgY29tbWVudCBpbiBwYXRj
aCAyLzMgYWJvdXQgc2V0dGluZyBSVkkgZm9yIA0KYWNrLW9uLWV4aXQ9MCwgdGhlbiBFT0kgYml0
bWFwIHVwZGF0ZSBzaG91bGQgYmUgZG9uZSB0aGVyZSB0b28uDQoNClRoYW5rcw0KS2V2aW4NCg==

