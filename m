Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450D7222531
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 16:21:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw4kW-0002nM-4p; Thu, 16 Jul 2020 14:20:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AXgs=A3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jw4kU-0002nH-Ll
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 14:20:34 +0000
X-Inumbo-ID: 8256c458-c76f-11ea-94be-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8256c458-c76f-11ea-94be-12813bfff9fa;
 Thu, 16 Jul 2020 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594909234;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mI+n4MWWbp6/xnt7yQROW1Mv+5F30+fTKHNKqAe+xuY=;
 b=HpmbW+I3nfCV7tmDlb4s1PgOvK6UupQ/2/3Q5U7DkiakrEJoxuWv50ay
 qvM7Tuhq+3CXB3/TPv+5AX5O4hG4PB9wqY7qRkQHz4X+OWL6pygVeq0Gt
 5kpUPCKsLrtWyEhaLjgLREIdgnwlHh7jTRQNkqL2xpfEasaNs06pQpryY U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SXJJF0O1jF8+i76+bT9n60MxMkBvi3U/stUfieunfvW1GusEiy5DWWoFc0eFlu0gCtzUHrn7jc
 ycv1TwOaakKxCnqa34L6Uohft09XhQxr4yL9DCxpHn8SZazJ5VCAJX3AYCjbulxiuVpsfh9NaX
 ZY88kOyLujxxKkdeV1fywZCDGFQR7IAXLQuVYCwQLGDBz1jd1PtgGmrjS+KXSGHkAWkU5QWiJ+
 uRI/p86XImVxasZw8b1ZhKu1/rcT3HlbOyu7M2r/H3M347exBNm2BGdtmG+hR7BDhlt8dujqm0
 dCQ=
X-SBRS: 2.7
X-MesageID: 22532812
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,359,1589256000"; d="scan'208";a="22532812"
From: George Dunlap <George.Dunlap@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2] docs: specify stability of hypfs path documentation
Thread-Topic: [PATCH v2] docs: specify stability of hypfs path documentation
Thread-Index: AQHWWR59fvtpmEuro06JsoMrFTmX86kFdV+AgAMhtYCAAUgfAIAABYeAgAAO0gCAAALcAIAALlYA
Date: Thu, 16 Jul 2020 14:20:28 +0000
Message-ID: <A8D7C0A3-BA48-40F2-B290-C73BC1CDEBD1@citrix.com>
References: <20200713140338.16172-1-jgross@suse.com>
 <8a96b1b9-cbcb-557a-5b82-661bbe40fe25@suse.com>
 <68F727A8-29B8-4846-8BE9-BD4F6E0DC60D@citrix.com>
 <9f5e86cc-4f64-982b-d84b-1de6b2739a2b@suse.com>
 <4c681c7c-be69-7e1a-4cd9-c9e05fe85372@suse.com>
 <2567da9b-be43-3f0d-e213-562b5454f4b7@suse.com>
 <757f5f78-6ec9-c740-18bf-a01105d552d7@suse.com>
In-Reply-To: <757f5f78-6ec9-c740-18bf-a01105d552d7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B28F961F9ACD34392C5C594BE9E3004@citrix.com>
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

DQoNCj4gT24gSnVsIDE2LCAyMDIwLCBhdCAxMjozNCBQTSwgSsO8cmdlbiBHcm/DnyA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE2LjA3LjIwIDEzOjI0LCBKYW4gQmV1bGljaCB3
cm90ZToNCj4+IE9uIDE2LjA3LjIwMjAgMTI6MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4g
T24gMTYuMDcuMjAgMTI6MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxNS4wNy4yMDIw
IDE2OjM3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+Pj4gSVQgc291bmRzIGxpa2UgeW914oCZ
cmUgc2F5aW5nOg0KPj4+Pj4gDQo+Pj4+PiAxLiBQYXRocyBsaXN0ZWQgd2l0aG91dCBjb25kaXRp
b25zIHdpbGwgYWx3YXlzIGJlIGF2YWlsYWJsZQ0KPj4+Pj4gDQo+Pj4+PiAyLiBQYXRocyBsaXN0
ZWQgd2l0aCBjb25kaXRpb25zIG1heSBiZSBleHRlbmRlZDogaS5lLiwgYSBub2RlIGN1cnJlbnRs
eSBsaXN0ZWQgYXMgUFYgbWlnaHQgYWxzbyBiZWNvbWUgYXZhaWxhYmxlIGZvciBIVk0gZ3Vlc3Rz
DQo+Pj4+PiANCj4+Pj4+IDMuIFBhdGhzIGxpc3RlZCB3aXRoIGNvbmRpdGlvbnMgbWlnaHQgaGF2
ZSB0aG9zZSBjb25kaXRpb25zIHJlZHVjZWQsIGJ1dCB3aWxsIG5ldmVyIGVudGlyZWx5IGRpc2Fw
cGVhci4gIFNvIHNvbWV0aGluZyBjdXJyZW50bHkgbGlzdGVkIGFzIFBWIG1pZ2h0IGJlIHJlZHVj
ZWQgdG8gQ09ORklHX0hBU19GT08sIGJ1dCB3b27igJl0IGJlIGNvbXBsZXRlbHkgcmVtb3ZlZC4N
Cj4+Pj4+IA0KPj4+Pj4gSXMgdGhhdCB3aGF0IHlvdSBtZWFudD8NCj4+Pj4gDQo+Pj4+IEkgc2Vl
IErDvHJnZW4gcmVwbGllZCAieWVzIiB0byB0aGlzLCBidXQgSSdtIG5vdCBzdXJlIGFib3V0IDEu
DQo+Pj4+IGFib3ZlOiBJIHRoaW5rIGl0J3MgcXVpdGUgcmVhc29uYWJsZSB0byBleHBlY3QgdGhh
dCBwYXRocyB3aXRob3V0DQo+Pj4+IGNvbmRpdGlvbiBtYXkgZ2FpbiBhIGNvbmRpdGlvbi4gSnVz
dCBsaWtlIHBhdGhzIG5vdyBoYXZpbmcgYQ0KPj4+PiBjb25kaXRpb24gYW5kIChwZXJoYXBzIHRl
bXBvcmFyaWx5KSBsb3NpbmcgaXQgc2hvdWxkbid0IGFsbCBvZg0KPj4+PiB0aGUgc3VkZGVuIGJl
Y29tZSAiYWx3YXlzIGF2YWlsYWJsZSIgd2hlbiB0aGV5IHdlcmVuJ3QgbWVhbnQgdG8NCj4+Pj4g
YmUuDQo+Pj4+IA0KPj4+PiBBcyBmYXIgYSAzLiBnb2VzLCBJJ20gYWxzbyB1bnN1cmUgaW4gaG93
IGZhciB0aGlzIGlzIGFueSBiZXR0ZXINCj4+Pj4gc3RhYmlsaXR5IHdpc2UgKGZyb20gYSBjb25z
dW1lciBwb3YpIHRoYW4gYWxsb3dpbmcgcGF0aHMgdG8NCj4+Pj4gZW50aXJlbHkgZGlzYXBwZWFy
Lg0KPj4+IA0KPj4+IFRoZSBpZGVhIGlzIHRoYXQgYW55IHVzZXIgdG9vbCB1c2luZyBoeXBmcyBj
YW4gcmVseSBvbiBwYXRocyB1bmRlciAxIHRvDQo+Pj4gZXhpc3QsIHdoaWxlIHRoZSBvbmVzIHVu
ZGVyIDMgbWlnaHQgbm90IGJlIHRoZXJlIGR1ZSB0byB0aGUgaHlwZXJ2aXNvcg0KPj4+IGNvbmZp
ZyBvciB0aGUgdXNlZCBzeXN0ZW0uDQo+Pj4gDQo+Pj4gQSBwYXRoIG5vdCBiZWluZyBhbGxvd2Vk
IHRvIGVudGlyZWx5IGRpc2FwcGVhciBlbnN1cmVzIHRoYXQgaXQgcmVtYWlucw0KPj4+IGluIHRo
ZSBkb2N1bWVudGF0aW9uLCBzbyB0aGUgc2FtZSBwYXRoIGNhbid0IGJlIHJldXNlZCBmb3Igc29t
ZXRoaW5nDQo+Pj4gZGlmZmVyZW50IGluIGZ1dHVyZS4NCj4+IEFuZCB0aGVuIGhvdyBkbyB5b3Ug
ZGVhbCB3aXRoIGEgY29uZGl0aW9uIGdldHRpbmcgZHJvcHBlZCwgYW5kDQo+PiBsYXRlciB3YW50
aW5nIHRvIGdldCByZS1hZGRlZD8gRG8gd2UgbmVlZCBhIHBsYWNlaG9sZGVyIGNvbmRpdGlvbg0K
Pj4gbGlrZSBbQUxXQVlTXSBvciBbVFJVRV0/DQo+IA0KPiBEcm9wcGluZyBhIGNvbmRpdGlvbiBo
YXMgdG8gYmUgY29uc2lkZXJlZCB2ZXJ5IGNhcmVmdWxseSwgc2FtZSBhcw0KPiBpbnRyb2R1Y2lu
ZyBhIG5ldyBwYXRoIHdpdGhvdXQgYW55IGNvbmRpdGlvbi4NCj4gDQo+IEluIHdvcnN0IGNhc2Ug
eW91IGNhbiBzdGlsbCBnbyB3aXRoIFtDT05GSUdfSFlQRlNdLg0KDQpDb3VsZG7igJl0IHdlIGp1
c3QgaGF2ZSBhIHNlY3Rpb24gb2YgdGhlIGRvY3VtZW50IGZvciBkZWFkIHBhdGhzIHRoYXQgYXJl
buKAmXQgYWxsb3dlZCB0byBiZSB1c2VkPw0KDQpBbHRlcm5hdGVseSwgd2UgY291bGQgaGF2ZSBh
IHRhZyBmb3IgZW50cmllcyB3ZSBkb27igJl0IHdhbnQgdXNlZCBhbnltb3JlOyBbREVBRF0gb3Ig
W09CU09MRVRFXSBtYXliZT8gW0RFRlVOQ1RdPyBbUkVNT1ZFRF0/DQoNClNvIEkgdGhpbmsgSeKA
mWQgd3JpdGUgYSBzZXBhcmF0ZSBzZWN0aW9uLCBsaWtlIHRoaXM6DQoNCn5+DQojIFN0YWJpbGl0
eQ0KDQpQYXRoICpwcmVzZW5jZSogaXMgbm90IHN0YWJsZSwgYnV0IHBhdGggKm1lYW5pbmcqIGlz
IGFsd2F5cyBzdGFibGU6IGlmIGEgdG9vbCB5b3Ugd3JpdGUgZmluZHMgYSBwYXRoIHByZXNlbnQs
IGl0IGNhbiByZWx5IG9uIGJlaGF2aW9yIGluIGZ1dHVyZSB2ZXJzaW9ucyBvZiB0aGUgaHlwZXJ2
aXNvcnMsIGFuZCBpbiBkaWZmZXJlbnQgY29uZmlndXJhdGlvbnMuICBTcGVjaWZpY2FsbHk6DQoN
CjEuIENvbmRpdGlvbnMgdW5kZXIgd2hpY2ggcGF0aHMgYXJlIHVzZWQgbWF5IGJlIGV4dGVuZGVk
LCByZXN0cmljdGVkLCBvciByZW1vdmVkLiAgRm9yIGV4YW1wbGUsIGEgcGF0aCB0aGF04oCZcyBh
bHdheXMgYXZhaWxhYmxlIG9ubHkgb24gQVJNIHN5c3RlbXMgbWF5IGJlY29tZSBhdmFpbGFibGUg
b24geDg2OyBvciBhIHBhdGggYXZhaWxhYmxlIG9uIGJvdGggc3lzdGVtcyBtYXkgYmUgcmVzdHJp
Y3RlZCB0byBvbmx5IGFwcGVhcmluZyBvbiBBUk0gc3lzdGVtcy4gIFBhdGhzIG1heSBhbHNvIGRp
c2FwcGVhciBlbnRpcmVseS4NCg0KMi4gSG93ZXZlciwgdGhlIG1lYW5pbmcgb2YgYSBwYXRoIHdp
bGwgbmV2ZXIgY2hhbmdlLiAgSWYgYSBwYXRoIGlzIHByZXNlbnQsIGl0IHdpbGwgYWx3YXlzIGhh
dmUgZXhhY3RseSB0aGUgbWVhbmluZyB0aGF0IGl0IGFsd2F5cyBoYWQuICBJbiBvcmRlciB0byBt
YWludGFpbiB0aGlzLCByZW1vdmVkIHBhdGhzIHNob3VsZCBiZSByZXRhaW5lZCB3aXRoIHRoZSB0
YWcgW1JFTU9WRURdLiAgVGhlIHBhdGggbWF5IGJlIHJlc3RvcmVkICpvbmx5KiBpZiB0aGUgcmVz
dG9yZWQgdmVyc2lvbiBvZiB0aGUgcGF0aCBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHByZXZpb3Vz
IGZ1bmN0aW9uYWxpdHkuDQp+fn4NCg0KVGhvdWdodHM/DQoNCiAtR2Vvcmdl

