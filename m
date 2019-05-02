Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A064119E6
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:16:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBXj-0002kM-Sw; Thu, 02 May 2019 13:14:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3XpE=TC=citrix.com=prvs=01897380a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hMBXi-0002kH-LS
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:14:30 +0000
X-Inumbo-ID: 342710d8-6cdc-11e9-bceb-eb7b50d97404
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 342710d8-6cdc-11e9-bceb-eb7b50d97404;
 Thu, 02 May 2019 13:14:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89570368"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] VT-d: suppress individual flushes during
 hwdom setup
Thread-Index: AQHVAOKnOYOJdIgIh0CQFnG6HS/pfqZXzyRA
Date: Thu, 2 May 2019 13:12:23 +0000
Message-ID: <8305316c7a2848418c030b048dff498a@AMSPEX02CL03.citrite.net>
References: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAE256020000780022B35B@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] VT-d: suppress individual flushes during
 hwdom setup
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIEphbiBC
ZXVsaWNoDQo+IFNlbnQ6IDAyIE1heSAyMDE5IDEzOjI4DQo+IFRvOiB4ZW4tZGV2ZWwgPHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0hdIFZULWQ6IHN1cHByZXNz
IGluZGl2aWR1YWwgZmx1c2hlcyBkdXJpbmcgaHdkb20gc2V0dXANCj4gDQo+IFRoZXJlJ3MgYW4g
aW52b2NhdGlvbiBvZiBpb21tdV9mbHVzaF9hbGwoKSBpbW1lZGlhdGVseSBhZnRlcndhcmRzLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAN
Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gQEAgLTEzMTAsOCArMTMxMCwxMSBA
QCBzdGF0aWMgdm9pZCBfX2h3ZG9tX2luaXQgaW50ZWxfaW9tbXVfaHdkDQo+IA0KPiAgICAgIHNl
dHVwX2h3ZG9tX3BjaV9kZXZpY2VzKGQsIHNldHVwX2h3ZG9tX2RldmljZSk7DQo+ICAgICAgc2V0
dXBfaHdkb21fcm1ycihkKTsNCj4gKw0KPiAgICAgIC8qIE1ha2Ugc3VyZSB3b3JrYXJvdW5kcyBh
cmUgYXBwbGllZCBiZWZvcmUgZW5hYmxpbmcgdGhlIElPTU1VKHMpLiAqLw0KPiArICAgIHRoaXNf
Y3B1KGlvbW11X2RvbnRfZmx1c2hfaW90bGIpID0gdHJ1ZTsNCj4gICAgICBhcmNoX2lvbW11X2h3
ZG9tX2luaXQoZCk7DQo+ICsgICAgdGhpc19jcHUoaW9tbXVfZG9udF9mbHVzaF9pb3RsYikgPSBm
YWxzZTsNCg0KVGhlcmUgc2hvdWxkIGJlIG5vIG5lZWQgZm9yIHRoaXMuIGFyY2hfaW9tbXVfaHdk
b21faW5pdCgpIGlzIHVzaW5nIGlvbW11X21hcCgpLCB3aGljaCBubyBsb25nZXIgZG9lcyBpbXBs
aWNpdCBmbHVzaGluZy4NCg0KICBQYXVsDQoNCj4gDQo+ICAgICAgaWYgKCBpb21tdV9mbHVzaF9h
bGwoKSApDQo+ICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyBWVERQUkVGSVgNCj4gDQo+
IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
