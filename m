Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD23193CE9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 11:21:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHPag-0004Rr-TN; Thu, 26 Mar 2020 10:18:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hxw6=5L=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1jHPaf-0004Re-3b
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 10:18:21 +0000
X-Inumbo-ID: 05a76d62-6f4b-11ea-92cf-bc764e2007e4
Received: from spam1.hygon.cn (unknown [110.188.70.11])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05a76d62-6f4b-11ea-92cf-bc764e2007e4;
 Thu, 26 Mar 2020 10:17:41 +0000 (UTC)
Received: from MK-FE.hygon.cn ([172.23.18.61])
 by spam1.hygon.cn with ESMTP id 02QAGv7J097721;
 Thu, 26 Mar 2020 18:16:57 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-FE.hygon.cn with ESMTP id 02QAH1fh015134;
 Thu, 26 Mar 2020 18:17:01 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Thu, 26 Mar
 2020 18:16:39 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Thu, 26 Mar 2020 18:16:39 +0800
From: Wen Pu <puwen@hygon.cn>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] SVM: Add union intstat_t for offset 68h in vmcb struct
Thread-Index: AQHWAchKa19WBqZbrUeUW98N9K32Y6hXJeSAgAHC3YCAAAlbAIABM32A
Date: Thu, 26 Mar 2020 10:16:39 +0000
Message-ID: <932de6b1-7316-40f7-62ab-a93d173590e7@hygon.cn>
References: <20200324103726.3406-1-puwen@hygon.cn>
 <f82b6a33-6af6-8c9d-2876-b518167eb832@citrix.com>
 <ee018b0a-6b92-4e87-1d22-c8839393f800@hygon.cn>
 <b0200562-dea5-2ba0-a7b2-2663a199c640@citrix.com>
In-Reply-To: <b0200562-dea5-2ba0-a7b2-2663a199c640@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D600EBBD799234FB1073DDCC6A66707@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam1.hygon.cn 02QAGv7J097721
X-DNSRBL: 
Subject: Re: [Xen-devel] [PATCH v2] SVM: Add union intstat_t for offset 68h
 in vmcb struct
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAyMC8zLzI1IDIzOjU2LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiBPbiAyNS8wMy8yMDIw
IDE1OjIyLCBQdSBXZW4gd3JvdGU6DQo+PiBPbiAyMDIwLzMvMjQgMjA6MjgsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+Pj4gSG1tIC0gdGhpcyBmaWVsZCBkb2Vzbid0IGFwcGVhciB0byBiZSBwYXJ0
IG9mIEFWSUMsIHdoaWNoIG1ha2VzIG1lDQo+Pj4gd29uZGVyIHdoYXQgd2UncmUgZG9pbmcgd2l0
aG91dCBpdC4NCj4+Pg0KPj4+IEl0IGFwcGVhcnMgdG8gYmUgYSBzaGFkb3cgY29weSBvZiBFRkxB
R1MuSUYgd2hpY2ggaXMgb25seSB3cml0dGVuIG9uDQo+Pj4gdm1leGl0LCBhbmQgbmV2ZXIgY29u
c3VtZWQsIGJ1dCB0aGlzIGlzIGJhc2VkIG9uIEFwcGVuZGl4IEIgd2hpY2ggaXMgdGhlDQo+Pj4g
b25seSByZWZlcmVuY2UgSSBjYW4gZmluZCB0byB0aGUgZmllbGQgYXQgYWxsLsKgIE5laXRoZXIg
dGhlDQo+Pj4gVk1SVU4vI1ZNRVhJVCBkZXNjcmlwdGlvbnMgZGlzY3VzcyBpdCBhdCBhbGwuDQo+
Pj4NCj4+PiBHaXZlbiBpdHMgcG9zaXRpb24gbmV4dCB0byB0aGUgKGFtYmlndW91cykgSU5URVJS
VVBUX1NIQURPVywgaXQganVzdA0KPj4+IG1pZ2h0IGFjdHVhbGx5IGRpc3Rpbmd1aXNoIHRoZSBT
VEkgc2hhZG93IGZyb20gdGhlIE1vdlNTIHNoYWRvdywgYnV0IGl0DQo+Pj4gY291bGQgb25seSBk
byB0aGF0IGJ5IG5vdCBiZWhhdmluZyBhcyBkZXNjcmliZWQsIGFuZCBiZWluZyBhc3ltbWV0cmlj
DQo+Pj4gd2l0aCBFRkxBR1MuwqAgSSBkb24ndCBoYXZlIHRpbWUgdG8gaW52ZXN0aWdhdGUgdGhp
cyByaWdodCBub3cuDQo+Pj4NCj4+PiBXZSBuZWVkIHRoZSBmaWVsZCBkZXNjcmliZWQgaW4gWGVu
IHRvIHNldCBpdCBhcHByb3ByaWF0ZWx5IGZvciB2aXJ0dWFsDQo+Pj4gdm1leGl0LCBidXQgSSB0
aGluayB0aGF0IGlzIHRoZSBleHRlbnQgb2Ygd2hhdCB3ZSBuZWVkIHRvIGRvLg0KPj4gV2UgZW5j
b3VudGVyZWQgcHJvYmxlbSB3aGlsZSBydW5uaW5nIHhlbiB3aXRoIG5ldyBmaXJtd2FyZSB3aGlj
aA0KPj4gaW1wbGVtZW50IHRoZSBiaXRbMV0gb2YgdGhlIFZNQ0Igb2Zmc2V0IDY4aDogdGhlIERv
bVUgc3RvcHBlZCB3aGVuDQo+PiBydW5uaW5nIHNlYWJpb3MuIFdlIGRlYnVnZ2VkIHRoZSBzZWFi
aW9zIGNvZGUgYW5kIGZvdW5kIHRoYXQgdGhlDQo+PiBzZWFiaW9zIGh1bmcgYWZ0ZXIgY2FsbDE2
X2ludDEwKCkuDQo+Pg0KPj4gVGhlbiB3ZSBkZWJ1Z2dlZCB0aGUgeGVuIGNvZGUsIGFuZCBmb3Vu
ZCB0aGUgY2F1c2UgYXQgdGhpcyBwbGFjZSBpbg0KPj4gc3ZtX2dldF9pbnRlcnJ1cHRfc2hhZG93
KCk6DQo+PiAgICAgIGlmICggdm1jYi0+aW50ZXJydXB0X3NoYWRvdyApDQo+PiAgICAgICAgICAg
aW50cl9zaGFkb3cgfD0gSFZNX0lOVFJfU0hBRE9XX01PVl9TUyB8IEhWTV9JTlRSX1NIQURPV19T
VEk7DQo+PiB0aGUgY29uZGl0aW9uYWwgaXMgdHJ1ZSBpZiBiaXRbMV0gaXMgMSBldmVuIHRob3Vn
aCBiaXRbMF0gaXMgemVyby4NCj4+IElmIGp1c3Qgb25seSB1c2UgYml0WzBdIGluIHRoZSBjb25k
aXRpb25hbCwgdGhlIHByb2JsZW0gaXMgc29sdmVkLCBEb21VDQo+PiB3aWxsIHJ1biBzdWNjZXNz
ZnVsbHkuDQo+IA0KPiBPaCAtIG5vdyB5b3UgcG9pbnQgdGhpcyBvdXQsIHRoZSBpc3N1ZSBpcyBv
YnZpb3VzLg0KPiANCj4gVGhlIGFib3ZlIGNvbnRlbnQgd291bGQgbWFrZSBhIGZhciBtb3JlIGlu
Zm9ybWF0aXZlIGNvbW1pdCBtZXNzYWdlLsKgSG93DQo+IGFib3V0IGV4dGVuZGluZyB0aGUgbWlk
ZGxlIHBhcmFncmFwaCB3aXRoOg0KPiANCj4gIi4uLnBhcnQgb2YgaW50ZXJydXB0X3NoYWRvdywg
Y2F1c2luZyBzdm1fZ2V0X2ludGVycnVwdF9zaGFkb3coKSB0bw0KPiBtaXN0YWtlIHRoZSBndWVz
dCBoYXZpbmcgaW50ZXJydXB0cyBlbmFibGVkIGFzIGJlaW5nIGluIGFuIGludGVycnVwdA0KPiBz
aGFkb3cuwqAgVGhpcyBoYXMgYmVlbiBvYnNlcnZlZCB0byBjYXVzZSBTZWFCSU9TIHRvIGhhbmcg
b24gYm9vdC4iDQo+IA0KPiBvciB3b3JkcyB0byB0aGF0IGVmZmVjdC7CoCBUaGUgIml0IGRlZmlu
aXRlbHkgYnJlYWtzIGEgZ3Vlc3QiIGlzIHRoZSBtb3N0DQo+IGltcG9ydGFudCBwaWVjZSBvZiBp
bmZvcm1hdGlvbiBoZXJlLg0KDQpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLCB3aWxsIGFkZCBp
dCB0byB0aGUgcGF0Y2ggZGVzY3JpcHRpb24uDQoNCj4gRG8geW91IGhhcHBlbiB0byBrbm93IGNh
bGwxNl9pbnQxMCgpIHdhcyBkb2luZywgZXhhY3RseT/CoCBXZSd2ZQ0KPiBwcmVzdW1hYmx5IHRy
YXBwZWQgZm9yIGVtdWxhdGlvbiB0byBiZSB1c2luZyBzdm1fZ2V0X2ludGVycnVwdF9zaGFkb3co
KQ0KPiBpbiB0aGUgZmlyc3QgcGxhY2UuDQoNCmNhbGwxNl9pbnQxMCgpIGlzIHVzZWQgdG8gc2V0
IFZHQSBtb2RlIGFuZCB3ZSBzZWUgbm8gdHJhcCBvcGVyYXRpb24gaW4gbG9nLg0KV2Ugc3VzcGVj
dGVkIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZyBpbiB0aGUgaW50ZXJydXB0IGhhbmRsaW5nIHBy
b2Nlc3MsDQphZnRlciB3ZSBjaGFuZ2VkIHRvIHVzZSBpbnRlcnJ1cHRfc2hhZG93IGJpdCwgd2Ug
Zm91bmQgdGhlIHByb2JsZW0gaXMgc29sdmVkLg0KDQotLSANClJlZ2FyZHMsDQpQdSBXZW4=

