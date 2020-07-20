Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AA0225C8C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 12:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxStF-0000W2-H1; Mon, 20 Jul 2020 10:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvUF=A7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jxStE-0000Vu-0p
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 10:19:20 +0000
X-Inumbo-ID: 7842e66d-ca72-11ea-8487-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7842e66d-ca72-11ea-8487-bc764e2007e4;
 Mon, 20 Jul 2020 10:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595240359;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=g1USrYgf6iLGRJ6Y6JipbkWFUsP6pUvHuvebTM15GUc=;
 b=X8+9YoonqynbTyWJ2BhWdTHmCnAb0yGMXXtzomFTsSM/dMUd7R7zUaNQ
 iQ5A2cKLe4tpiv9/HzN6r0RbOmD4axhVc739+3Fohf5flvSCj8wcdPuVs
 xnJdP4/7E4R/eFxkiGuDiesidsue3wPqT6rUpCGn8sAOOsCZMKbrRlIz+ 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tA6PgaaShCYl/opkuLCMopA0zOujg7/WOsTNlI5gz8CDya78f96EjEooevZOkIZ50w+WYPFsvw
 dCaJzcrfb4Xwu+XskMndHoSfF/E3GXd3cJMbVF2S4l4q+nbnQXzFEkRzrAVLQNErQ2jGCHg1Li
 NpbAvc01eJu/ZrFeY2mMnDnJG9ar7ZKHboag2zt6dw3ftDzZ3NqZRMhCL4pyd/0FQgJ54oyBie
 vV+sGm+tTqwvC2mXHG60dLzG33d3D34RYkcWf0K3GGFcoh+VVL+kXjlB1rua2YfX+MU3z/6JVS
 jiU=
X-SBRS: 2.7
X-MesageID: 22739368
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="22739368"
From: George Dunlap <George.Dunlap@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2] docs: specify stability of hypfs path documentation
Thread-Topic: [PATCH v2] docs: specify stability of hypfs path documentation
Thread-Index: AQHWWR59fvtpmEuro06JsoMrFTmX86kFdV+AgAMhtYCAAUgfAIAABYeAgAAO0gCAAALcAIAALlYAgAAD6oCABgIDAA==
Date: Mon, 20 Jul 2020 10:19:14 +0000
Message-ID: <041963E3-304B-4F1D-BCA0-387057DFC7FE@citrix.com>
References: <20200713140338.16172-1-jgross@suse.com>
 <8a96b1b9-cbcb-557a-5b82-661bbe40fe25@suse.com>
 <68F727A8-29B8-4846-8BE9-BD4F6E0DC60D@citrix.com>
 <9f5e86cc-4f64-982b-d84b-1de6b2739a2b@suse.com>
 <4c681c7c-be69-7e1a-4cd9-c9e05fe85372@suse.com>
 <2567da9b-be43-3f0d-e213-562b5454f4b7@suse.com>
 <757f5f78-6ec9-c740-18bf-a01105d552d7@suse.com>
 <A8D7C0A3-BA48-40F2-B290-C73BC1CDEBD1@citrix.com>
 <fd8902f6-0172-2f1f-aae8-fec096d4bff5@suse.com>
In-Reply-To: <fd8902f6-0172-2f1f-aae8-fec096d4bff5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFD6D947570B684886038B11B1833383@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDE2LCAyMDIwLCBhdCAzOjM0IFBNLCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTYuMDcuMjAgMTY6MjAsIEdlb3JnZSBEdW5sYXAg
d3JvdGU6DQo+Pj4gT24gSnVsIDE2LCAyMDIwLCBhdCAxMjozNCBQTSwgSsO8cmdlbiBHcm/DnyA8
amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAxNi4wNy4yMCAxMzoyNCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDE2LjA3LjIwMjAgMTI6MzEsIErDvHJnZW4gR3Jvw58g
d3JvdGU6DQo+Pj4+PiBPbiAxNi4wNy4yMCAxMjoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+
Pj4gT24gMTUuMDcuMjAyMCAxNjozNywgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+Pj4+Pj4gSVQg
c291bmRzIGxpa2UgeW914oCZcmUgc2F5aW5nOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gMS4gUGF0aHMg
bGlzdGVkIHdpdGhvdXQgY29uZGl0aW9ucyB3aWxsIGFsd2F5cyBiZSBhdmFpbGFibGUNCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IDIuIFBhdGhzIGxpc3RlZCB3aXRoIGNvbmRpdGlvbnMgbWF5IGJlIGV4dGVu
ZGVkOiBpLmUuLCBhIG5vZGUgY3VycmVudGx5IGxpc3RlZCBhcyBQViBtaWdodCBhbHNvIGJlY29t
ZSBhdmFpbGFibGUgZm9yIEhWTSBndWVzdHMNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IDMuIFBhdGhzIGxp
c3RlZCB3aXRoIGNvbmRpdGlvbnMgbWlnaHQgaGF2ZSB0aG9zZSBjb25kaXRpb25zIHJlZHVjZWQs
IGJ1dCB3aWxsIG5ldmVyIGVudGlyZWx5IGRpc2FwcGVhci4gIFNvIHNvbWV0aGluZyBjdXJyZW50
bHkgbGlzdGVkIGFzIFBWIG1pZ2h0IGJlIHJlZHVjZWQgdG8gQ09ORklHX0hBU19GT08sIGJ1dCB3
b27igJl0IGJlIGNvbXBsZXRlbHkgcmVtb3ZlZC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IElzIHRoYXQg
d2hhdCB5b3UgbWVhbnQ/DQo+Pj4+Pj4gDQo+Pj4+Pj4gSSBzZWUgSsO8cmdlbiByZXBsaWVkICJ5
ZXMiIHRvIHRoaXMsIGJ1dCBJJ20gbm90IHN1cmUgYWJvdXQgMS4NCj4+Pj4+PiBhYm92ZTogSSB0
aGluayBpdCdzIHF1aXRlIHJlYXNvbmFibGUgdG8gZXhwZWN0IHRoYXQgcGF0aHMgd2l0aG91dA0K
Pj4+Pj4+IGNvbmRpdGlvbiBtYXkgZ2FpbiBhIGNvbmRpdGlvbi4gSnVzdCBsaWtlIHBhdGhzIG5v
dyBoYXZpbmcgYQ0KPj4+Pj4+IGNvbmRpdGlvbiBhbmQgKHBlcmhhcHMgdGVtcG9yYXJpbHkpIGxv
c2luZyBpdCBzaG91bGRuJ3QgYWxsIG9mDQo+Pj4+Pj4gdGhlIHN1ZGRlbiBiZWNvbWUgImFsd2F5
cyBhdmFpbGFibGUiIHdoZW4gdGhleSB3ZXJlbid0IG1lYW50IHRvDQo+Pj4+Pj4gYmUuDQo+Pj4+
Pj4gDQo+Pj4+Pj4gQXMgZmFyIGEgMy4gZ29lcywgSSdtIGFsc28gdW5zdXJlIGluIGhvdyBmYXIg
dGhpcyBpcyBhbnkgYmV0dGVyDQo+Pj4+Pj4gc3RhYmlsaXR5IHdpc2UgKGZyb20gYSBjb25zdW1l
ciBwb3YpIHRoYW4gYWxsb3dpbmcgcGF0aHMgdG8NCj4+Pj4+PiBlbnRpcmVseSBkaXNhcHBlYXIu
DQo+Pj4+PiANCj4+Pj4+IFRoZSBpZGVhIGlzIHRoYXQgYW55IHVzZXIgdG9vbCB1c2luZyBoeXBm
cyBjYW4gcmVseSBvbiBwYXRocyB1bmRlciAxIHRvDQo+Pj4+PiBleGlzdCwgd2hpbGUgdGhlIG9u
ZXMgdW5kZXIgMyBtaWdodCBub3QgYmUgdGhlcmUgZHVlIHRvIHRoZSBoeXBlcnZpc29yDQo+Pj4+
PiBjb25maWcgb3IgdGhlIHVzZWQgc3lzdGVtLg0KPj4+Pj4gDQo+Pj4+PiBBIHBhdGggbm90IGJl
aW5nIGFsbG93ZWQgdG8gZW50aXJlbHkgZGlzYXBwZWFyIGVuc3VyZXMgdGhhdCBpdCByZW1haW5z
DQo+Pj4+PiBpbiB0aGUgZG9jdW1lbnRhdGlvbiwgc28gdGhlIHNhbWUgcGF0aCBjYW4ndCBiZSBy
ZXVzZWQgZm9yIHNvbWV0aGluZw0KPj4+Pj4gZGlmZmVyZW50IGluIGZ1dHVyZS4NCj4+Pj4gQW5k
IHRoZW4gaG93IGRvIHlvdSBkZWFsIHdpdGggYSBjb25kaXRpb24gZ2V0dGluZyBkcm9wcGVkLCBh
bmQNCj4+Pj4gbGF0ZXIgd2FudGluZyB0byBnZXQgcmUtYWRkZWQ/IERvIHdlIG5lZWQgYSBwbGFj
ZWhvbGRlciBjb25kaXRpb24NCj4+Pj4gbGlrZSBbQUxXQVlTXSBvciBbVFJVRV0/DQo+Pj4gDQo+
Pj4gRHJvcHBpbmcgYSBjb25kaXRpb24gaGFzIHRvIGJlIGNvbnNpZGVyZWQgdmVyeSBjYXJlZnVs
bHksIHNhbWUgYXMNCj4+PiBpbnRyb2R1Y2luZyBhIG5ldyBwYXRoIHdpdGhvdXQgYW55IGNvbmRp
dGlvbi4NCj4+PiANCj4+PiBJbiB3b3JzdCBjYXNlIHlvdSBjYW4gc3RpbGwgZ28gd2l0aCBbQ09O
RklHX0hZUEZTXS4NCj4+IENvdWxkbuKAmXQgd2UganVzdCBoYXZlIGEgc2VjdGlvbiBvZiB0aGUg
ZG9jdW1lbnQgZm9yIGRlYWQgcGF0aHMgdGhhdCBhcmVu4oCZdCBhbGxvd2VkIHRvIGJlIHVzZWQ/
DQo+PiBBbHRlcm5hdGVseSwgd2UgY291bGQgaGF2ZSBhIHRhZyBmb3IgZW50cmllcyB3ZSBkb27i
gJl0IHdhbnQgdXNlZCBhbnltb3JlOyBbREVBRF0gb3IgW09CU09MRVRFXSBtYXliZT8gW0RFRlVO
Q1RdPyBbUkVNT1ZFRF0/DQo+PiBTbyBJIHRoaW5rIEnigJlkIHdyaXRlIGEgc2VwYXJhdGUgc2Vj
dGlvbiwgbGlrZSB0aGlzOg0KPj4gfn4NCj4+ICMgU3RhYmlsaXR5DQo+PiBQYXRoICpwcmVzZW5j
ZSogaXMgbm90IHN0YWJsZSwgYnV0IHBhdGggKm1lYW5pbmcqIGlzIGFsd2F5cyBzdGFibGU6IGlm
IGEgdG9vbCB5b3Ugd3JpdGUgZmluZHMgYSBwYXRoIHByZXNlbnQsIGl0IGNhbiByZWx5IG9uIGJl
aGF2aW9yIGluIGZ1dHVyZSB2ZXJzaW9ucyBvZiB0aGUgaHlwZXJ2aXNvcnMsIGFuZCBpbiBkaWZm
ZXJlbnQgY29uZmlndXJhdGlvbnMuICBTcGVjaWZpY2FsbHk6DQo+PiAxLiBDb25kaXRpb25zIHVu
ZGVyIHdoaWNoIHBhdGhzIGFyZSB1c2VkIG1heSBiZSBleHRlbmRlZCwgcmVzdHJpY3RlZCwgb3Ig
cmVtb3ZlZC4gIEZvciBleGFtcGxlLCBhIHBhdGggdGhhdOKAmXMgYWx3YXlzIGF2YWlsYWJsZSBv
bmx5IG9uIEFSTSBzeXN0ZW1zIG1heSBiZWNvbWUgYXZhaWxhYmxlIG9uIHg4Njsgb3IgYSBwYXRo
IGF2YWlsYWJsZSBvbiBib3RoIHN5c3RlbXMgbWF5IGJlIHJlc3RyaWN0ZWQgdG8gb25seSBhcHBl
YXJpbmcgb24gQVJNIHN5c3RlbXMuICBQYXRocyBtYXkgYWxzbyBkaXNhcHBlYXIgZW50aXJlbHku
DQo+PiAyLiBIb3dldmVyLCB0aGUgbWVhbmluZyBvZiBhIHBhdGggd2lsbCBuZXZlciBjaGFuZ2Uu
ICBJZiBhIHBhdGggaXMgcHJlc2VudCwgaXQgd2lsbCBhbHdheXMgaGF2ZSBleGFjdGx5IHRoZSBt
ZWFuaW5nIHRoYXQgaXQgYWx3YXlzIGhhZC4gIEluIG9yZGVyIHRvIG1haW50YWluIHRoaXMsIHJl
bW92ZWQgcGF0aHMgc2hvdWxkIGJlIHJldGFpbmVkIHdpdGggdGhlIHRhZyBbUkVNT1ZFRF0uICBU
aGUgcGF0aCBtYXkgYmUgcmVzdG9yZWQgKm9ubHkqIGlmIHRoZSByZXN0b3JlZCB2ZXJzaW9uIG9m
IHRoZSBwYXRoIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgcHJldmlvdXMgZnVuY3Rpb25hbGl0eS4N
Cj4+IH5+fg0KPj4gVGhvdWdodHM/DQo+IA0KPiBXb3VsZCB3b3JrIGZvciBtZSwgdG9vLg0KDQpT
byB3aG9zZSBjb3VydCBpcyB0aGUgYmFsbCBpbiBub3c/ICBBcmUgeW91IGdvaW5nIHRvIHNlbmQg
YW5vdGhlciBwYXRjaCwgb3Igd291bGQgeW91IHByZWZlciBJIGRvIGl0Pw0KDQogLUdlb3JnZQ==

