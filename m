Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31F51A99B3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 11:57:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOen3-0007q0-5b; Wed, 15 Apr 2020 09:57:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3U8g=57=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jOen2-0007pv-D0
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 09:57:04 +0000
X-Inumbo-ID: 72a86b50-7eff-11ea-8a21-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72a86b50-7eff-11ea-8a21-12813bfff9fa;
 Wed, 15 Apr 2020 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586944620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GdPR/arZr8Yzve/UG6JJly3WpRtRMcwrxgJ+PQF8Sjo=;
 b=CX+dMn8+xYJSFVMZ+KeqSJxOuKtJGP8VQzEIK+A0/UxGwAkIwC8klkPu
 Y0bHBellpi2t2YjFobo3cliFDHOrGbyg1bM9ZlnJ4fyfaeSA8+Wt0T4xo
 Ex/ukwPwrt9S1+pZR6ccMYSZi2mCDqU2NoF3iypIzlv0ERXRlWBI+3/7G Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JMFgYvDzPrWt+dw5QZvF9ifddYhLlPFC1ye3BpagcaFcNieJ+ZhiMvfXZiVGT3MzAlGJblfM2w
 LtwG8SFCthFoZbQ9miNx2p7pZEIrRgJWtzdIe7kOSXvGfeuhW9ZCwGb2IGOig/LRIwT/qtJOW5
 unzukODMahu6f/9QaZbh7CPa6CgINSSUn3NASMOVOQbIRpF284n/ZBUXWKTTcaCyTl8h/S6hOq
 om7/2wmS7sBLaxt+KlW2BWWt58EaRbSxbTsklncEIOjnTxjI3qLdVMEbja7udNAAIOJNlYSCbc
 ew4=
X-SBRS: 2.7
X-MesageID: 15716472
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="15716472"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
Thread-Topic: [PATCH v2] Introduce a description of a new optional tag for
 Backports
Thread-Index: AQHWD1gOS2WGOdcsW0SaziyGliZeaKh4Iv2AgACXkACAAOHggIAAOB+AgAABooCAAAH+gA==
Date: Wed, 15 Apr 2020 09:56:55 +0000
Message-ID: <10D98CF7-E38E-44C3-AF24-C93088F6682D@citrix.com>
References: <20200410164942.9747-1-sstabellini@kernel.org>
 <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
 <alpine.DEB.2.21.2004140953450.4953@sstabellini-ThinkPad-T480s>
 <707a1448-be1d-0aa8-6b11-a33eb247304f@suse.com>
 <04881FC6-A816-44AB-8F25-54E5A265707E@citrix.com>
 <49c732e6-d30d-0892-0bd7-65c082da0429@xen.org>
In-Reply-To: <49c732e6-d30d-0892-0bd7-65c082da0429@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <3409587D46A0D24D95847CE7E7001D7E@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDE1LCAyMDIwLCBhdCAxMDo0OSBBTSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE1LzA0LzIwMjAgMTA6NDMsIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6DQo+Pj4gT24gQXByIDE1LCAyMDIwLCBhdCA3OjIzIEFNLCBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDE0LjA0LjIwMjAg
MTg6NTQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4gT24gVHVlLCAxNCBBcHIgMjAy
MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxMC4wNC4yMDIwIDE4OjQ5LCBTdGVmYW5v
IFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+IA0KPj4gW3NuaXBdDQo+Pj4+Pj4gKyAgICBCYWNrcG9y
dDogYWxsDQo+Pj4+Pj4gKw0KPj4+Pj4+ICtJdCBtYXJrcyBhIGNvbW1pdCBmb3IgYmVpbmcgYSBj
YW5kaWRhdGUgZm9yIGJhY2twb3J0cyB0byBhbGwgcmVsZXZhbnQNCj4+Pj4+PiArdHJlZXMuDQo+
Pj4+PiANCj4+Pj4+IEknbSB1bmNvbnZpbmNlZCBvZiB0aGUgdXRpbGl0eSBvZiB0aGlzIGZvcm0g
LSB3aGF0ICJhbGwiIHJlc29sdmVzIHRvDQo+Pj4+PiBjaGFuZ2VzIG92ZXIgdGltZS4gVGhlcmUn
cyBhbG1vc3QgYWx3YXlzIGEgZmlyc3QgdmVyc2lvbiB3aGVyZSBhDQo+Pj4+PiBwYXJ0aWN1bGFy
IGlzc3VlIHdhcyBpbnRyb2R1Y2VkLiBJZiB3ZSB3YW50IHRoaXMgdG8gYmUgZ2VuZXJhbGx5DQo+
Pj4+PiB1c2VmdWwsIGltbyB3ZSBzaG91bGRuJ3QgbGltaXQgdGhlIHNjb3BlIG9mIHRoZSB0YWcg
dG8gdGhlIHVwc3RyZWFtDQo+Pj4+PiBtYWludGFpbmVkIHN0YWJsZSB0cmVlcy4NCj4+Pj4gDQo+
Pj4+IFRoZSByZWFzb24gd2h5IEkgc3VnZ2VzdGVkIGFsc28gdG8gaGF2ZSBhICJ3aWxkY2FyZCIg
dmVyc2lvbiBvZiB0aGlzDQo+Pj4+IHRhZywgaXMgdGhhdCB0aGUgcGVyc29uIGFkZGluZyB0aGUg
dGFnIChjb3VsZCBiZSB0aGUgY29udHJpYnV0b3IgdHJ5aW5nDQo+Pj4+IHRvIGJlIGhlbHBmdWwp
IG1pZ2h0IG5vdCBrbm93IGV4YWN0bHkgdG8gd2hpY2ggc3RhYmxlIHRyZWVzIHRoZSBwYXRjaA0K
Pj4+PiBzaG91bGQgYmUgYmFja3BvcnRlZCB0by4NCj4+Pj4gDQo+Pj4+IFdyaXRpbmcgdGhpcyBz
ZW50ZW5jZSwgSSByZWFsaXplIHRoYXQgSSByZWFsbHkgbWVhbnQgImFueSIgcmF0aGVyIHRoYW4N
Cj4+Pj4gImFsbCIuIFdvdWxkIHlvdSBwcmVmZXIgaWYgSSB1c2VkICJhbnkiPyBPciB3ZSBjb3Vs
ZCBldmVuIHN1Z2dlc3QgdG8gbGVhdmUNCj4+Pj4gaXQgYmxhY2sgbGlrZSB0aGlzOg0KPj4+PiAN
Cj4+Pj4gIEJhY2twb3J0Og0KPj4+PiANCj4+Pj4gQnV0IGl0IGxvb2tzIGEgYml0IHdlaXJkLg0K
Pj4+IA0KPj4+IEluZGVlZC4gSW5zdGVhZCBvZiAiYWxsIiBvciAiYW55IiwgaG93IGFib3V0ICJ5
ZXMiLCAidW5zcGVjaWZpZWQiLCBvcg0KPj4+ICJ1bmtub3duIj8gTmV2ZXJ0aGVsZXNzLCBJIHN0
aWxsIHRoaW5rIHBlb3BsZSBhc2tpbmcgZm9yIGEgYmFja3BvcnQNCj4+PiBzaG91bGQgYmUgbnVk
Z2VkIHRvd2FyZHMgZGV0ZXJtaW5pbmcgdGhlIGFwcGxpY2FibGUgcmFuZ2U7IHRoZW0gbm90DQo+
Pj4gZG9pbmcgc28gZWZmZWN0aXZlbHkgcHVzaGVzIHRoZSBidXJkZW4gdG8gdGhlIGdlbmVyYWwg
bWFpbnRhaW5lcnMgb3INCj4+PiB0aGUgc3RhYmxlIHRyZWUgb25lcywgYm90aCBvZiB3aGljaCBz
Y2FsZXMgbGVzcyB3ZWxsLiBPbWl0dGluZyB0aGUNCj4+PiB0YWcgaWYgdGhleSBkb24ndCB3YW50
IHRvIGludmVzdCB0aGUgdGltZSB3b3VsZCB0byBtZSB0aGVuIHNlZW0gdG8NCj4+PiBiZSB0aGUg
Y2xlYW5lc3QgYWx0ZXJuYXRpdmUuIEFsYmVpdCBJJ20gc3VyZSB2aWV3cyBoZXJlIHdpbGwgdmFy
eS4NCj4+IEZXSVcgYXNraW5nIHBlb3BsZSBhZGRpbmcgdGhlIHRhZyB0byBkbyB0aGUgd29yayBv
ZiBmaWd1cmluZyBvdXQgd2hpY2ggdmVyc2lvbnMgdG8gYmFja3BvcnQgdG8gbWFrZXMgc2Vuc2Ug
dG8gbWUuDQo+IA0KPiBJZiB5b3UgYXNrIHRoZSBjb250cmlidXRvciB0byBkbyB0aGUgd29yayB0
aGVuIHlvdSBuZWVkIHRvIGdpdmUgZ3VpZGFuY2Ugb24gdGhlICJvbGRlciIgdmVyc2lvbiB5b3Ug
Y2FuIHNwZWNpZnkgaW4gQmFja3BvcnQuDQo+IA0KPiBGb3IgaW5zdGFuY2UsIGxldCBzYXkgdGhl
IGJ1ZyB3YXMgaW50cm9kdWNlZCBpbiBYZW4gNC4yLiBBcmUgd2UgYWxsb3dpbmcgdGhlIHVzZXIg
dG8gc3BlY2lmeSBCYWNrcG9ydDogNC4yKyBvciBzaG91bGQgaXQgYmUgNC4xMSs/DQo+IA0KPiBJ
IHdvdWxkIGZhdm9yIHRoZSBmb3JtZXIgYXMgdGhpcyBoZWxwcyBmb3IgZG93bnN0cmVhbSB1c2Vy
IHdoaWNoIGhhdmVuJ3QgeWV0IG1vdmVkIHRvIHRoZSBzdXBwb3J0ZWQgc3RhYmxlIHRyZWUuDQoN
CkkgYWdyZWUgdGhhdCBzcGVjaWZ5aW5nIHRoZSBvbGRlc3QgcmV2aXNpb24gcG9zc2libGUgd291
bGQgYmUgaGVscGZ1bC4NCg0KSG93ZXZlciwgSSBkb27igJl0IHRoaW5rIGZpbmRpbmcgdGhlIGFi
c29sdXRlIG9sZGVzdCByZXZpc2lvbiBzaG91bGQgYmUgKnJlcXVpcmVkKiDigJQgaW1hZ2luZSBh
IGJ1ZyB0aGF0IHdhcyBpbnRyb2R1Y2VkIGJldHdlZW4gMy4yIGFuZCAzLjMuICBJdOKAmXMgYWxz
byBwZXJmZWN0bHkgZmluZSBpZiB5b3UgZ28gYWxsIHRoZSB3YXkgYmFjayB0byA0LjIgYW5kIHN0
b3AgYmVjYXVzZSB5b3UgZ2V0IGJvcmVkLCBub3QgYmVjYXVzZSB5b3UgZm91bmQgb3V0IHRoYXQg
NC4xIGRpZG7igJl0IG5lZWQgaXQuDQoNCk9uIHRoZSBvdGhlciBoYW5kLCBjb250cmlidXRvcnMg
c2hvdWxkIGJlIGV4cGVjdGVkIHRvIGZpbmQgb3V0IGlmIGl0IG5lZWRzIHRvIGJlIGJhY2twb3J0
ZWQgKmF0IGxlYXN0KiB0byBmdWxseS1zdXBwb3J0ZWQgcmVsZWFzZXMuDQoNCkkgdGhpbmsgd2hh
dGV2ZXIgdGV4dCB3ZSBjb21lIHVwIHdpdGggc2hvdWxkIHByb2JhYmx5IHNheSB0aGF0IGNvbnRy
aWJ1dG9ycyBhcmUg4oCcZXhwZWN0ZWTigJ0gKG9yIOKAnHJlcXVpcmVk4oCdKSB0byBzcGVjaWZ5
IHdoaWNoIGN1cnJlbnRseS1zdXBwb3J0ZWQgcmVsZWFzZXMgbmVlZCB0aGUgYmFja3BvcnQ7ICBi
dXQg4oCcZW5jb3VyYWdlZOKAnSB0byBzcGVjaWZ5IGEgcmVsZWFzZSBhcyBmYXIgYmFjayBhcyBw
b3NzaWJsZS4NCg0KIC1HZW9yZ2U=

