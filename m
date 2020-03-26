Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D51193CE3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 11:20:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHPaR-0004Pz-Ji; Thu, 26 Mar 2020 10:18:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hxw6=5L=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1jHPaQ-0004Pr-4w
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 10:18:06 +0000
X-Inumbo-ID: fde11b1e-6f4a-11ea-bec1-bc764e2007e4
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fde11b1e-6f4a-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 10:17:28 +0000 (UTC)
Received: from MK-FE.hygon.cn ([172.23.18.61])
 by spam2.hygon.cn with ESMTP id 02QAGHGS018283;
 Thu, 26 Mar 2020 18:16:17 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex02.Hygon.cn ([172.23.18.12])
 by MK-FE.hygon.cn with ESMTP id 02QAGMvL015115;
 Thu, 26 Mar 2020 18:16:22 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex02.Hygon.cn
 (172.23.18.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Thu, 26 Mar
 2020 18:16:00 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Thu, 26 Mar 2020 18:16:00 +0800
From: Wen Pu <puwen@hygon.cn>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2] SVM: Add union intstat_t for offset 68h in vmcb struct
Thread-Index: AQHWAchKa19WBqZbrUeUW98N9K32Y6hYl0AAgABRxwCAAAtGgIABMRyA
Date: Thu, 26 Mar 2020 10:16:00 +0000
Message-ID: <37e6a72d-2bd8-a296-3182-f1f3f159d03e@hygon.cn>
References: <20200324103726.3406-1-puwen@hygon.cn>
 <20200325103054.GA28601@Air-de-Roger>
 <772e041d-a91a-e67c-1243-530065b2f628@hygon.cn>
 <e4c2dafa-2b03-e6d0-4511-872cb70e8e68@citrix.com>
In-Reply-To: <e4c2dafa-2b03-e6d0-4511-872cb70e8e68@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D93CB7D1B8ED2A4397E1B6F5F6CD5BC3@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam2.hygon.cn 02QAGHGS018283
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAyMC8zLzI2IDA6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI1LzAzLzIwMjAg
MTU6MjMsIFB1IFdlbiB3cm90ZToNCj4+IE9uIDIwMjAvMy8yNSAxODozMCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToNCj4+PiBPbiBUdWUsIE1hciAyNCwgMjAyMCBhdCAwNjozNzoyNlBNICswODAw
LCBQdSBXZW4gd3JvdGU6DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2
bS9zdm0vdm1jYi5oDQo+Pj4+IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaA0K
Pj4+PiBpbmRleCBiOWUzODlkNDgxLi5kOGEzMjg1NzUyIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9zdm0vdm1jYi5oDQo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvaHZtL3N2bS92bWNiLmgNCj4+Pj4gQEAgLTMxNiw2ICszMTYsMTcgQEAgdHlwZWRlZiB1
bmlvbg0KPj4+PiAgwqDCoMKgwqDCoCB1aW50NjRfdCByYXc7DQo+Pj4+ICDCoCB9IGludGluZm9f
dDsNCj4+Pj4gIMKgICt0eXBlZGVmIHVuaW9uDQo+Pj4+ICt7DQo+Pj4+ICvCoMKgwqAgc3RydWN0
DQo+Pj4+ICvCoMKgwqAgew0KPj4+PiArwqDCoMKgwqDCoMKgwqAgdTY0IGludHJfc2hhZG93OsKg
wqDCoCAxOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgdTY0IGd1ZXN0X2ludHJfbWFzazoxOw0KPj4+
PiArwqDCoMKgwqDCoMKgwqAgdTY0IHJlc3ZkOsKgwqDCoMKgwqDCoMKgwqDCoCA2MjsNCj4+Pg0K
Pj4+IENvdWxkIHlvdSBhbHNvIHVzZSB1aW50NjRfdCBmb3IgdGhlIGZpZWxkcywgbGlrZSB5b3Ug
ZG8gYmVsb3cgZm9yDQo+Pj4gcmF3Pw0KPj4NCj4+IE9rLCB0aGFua3MuIE1heWJlIGJvb2wgZm9y
IGludHJfc2hhZG93IGFuZCBndWVzdF9pbnRyX21hc2sgaXMgYmV0dGVyPw0KPiANCj4gQm9vbCB3
b3VsZCBiZSBiZXR0ZXIgaWYgeW91J3JlIHdpbGxpbmcgdG8gY2hhbmdlIHRoZW0uDQo+IA0KPiBU
aGVyZSBpcyBhIHN1YnRsZSB0cnVuY2F0aW9uIGJ1ZyB3aXRoIGNhbiBvY2N1ciwgZS5nLg0KPiAN
Cj4gZm9vLT5pbnRyX3NoYWRvdyA9IGJhciAmIE1BU0s7DQo+IA0KPiB0dXJucyB0byAwIGlmIE1B
U0sgaXNuJ3QgdGhlIGJvdHRvbSBiaXQsIGFuZCBpbnRyX3NoYWRvdyBpcyBub3QgYm9vbC4NCj4g
DQo+IFRoZSB0cmFkaXRpb25hbCB3YXkgdG8gZml4IHRoaXMgaXMgd2l0aCAhIShiYXIgJiBNQVNL
KSwgYnV0IGJvb2xzIGFyZQ0KPiBzYWZlciBiZWNhdXNlIHlvdSBjYW4ndCBnZXQgaXQgd3Jvbmcg
YWNjaWRlbnRhbGx5Lg0KPiANCj4gSXRzIGFsc28gZmluZSB0byBkcm9wIHRoZSByZXN2ZCBlbnRp
cmVseS7CoCBObyBuZWVkIGZvciB0aGUgZmllbGQuDQoNClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0
aW9uLiBJJ20gZmluZSB0byB1c2UgYm9vbCBmb3IgaW50cl9zaGFkb3cgYW5kDQpkcm9wIHRoZSBy
ZXN2ZCBmaWVsZC4NCg0KLS0gDQpSZWdhcmRzLA0KUHUgV2Vu

