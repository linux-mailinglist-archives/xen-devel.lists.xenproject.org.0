Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE5E4E6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 16:40:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7PM-0001fE-7K; Mon, 29 Apr 2019 14:37:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL7PK-0001f9-CO
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 14:37:26 +0000
X-Inumbo-ID: 4da4bf7f-6a8c-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4da4bf7f-6a8c-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 14:37:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84651473"
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Pawel Wieczorkiewicz
 <wipawel@amazon.de>
References: <20190416122241.28342-1-wipawel@amazon.de>
 <20190425045104.GD11831@char.us.oracle.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <0e9742a5-a6d9-551d-6dec-9d9917a006d7@citrix.com>
Date: Mon, 29 Apr 2019 15:37:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190425045104.GD11831@char.us.oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part3 1/3]
 create-diff-object: Do not create empty .livepatch.funcs section
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
Cc: mpohlack@amazon.de, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8yNS8xOSA1OjUxIEFNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsgd3JvdGU6Cj4gT24gVHVl
LCBBcHIgMTYsIDIwMTkgYXQgMTI6MjI6MzlQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtpZXdpY3og
d3JvdGU6Cj4+IFdoZW4gdGhlcmUgaXMgbm8gY2hhbmdlZCBmdW5jdGlvbiBpbiB0aGUgZ2VuZXJh
dGVkIHBheWxvYWQsIGRvIG5vdAo+PiBjcmVhdGUgYW4gZW1wdHkgLmxpdmVwYXRjaC5mdW5jcyBz
ZWN0aW9uLiBIeXBlcnZpc29yIGNvZGUgY29uc2lkZXJzCj4+IHN1Y2ggcGF5bG9hZHMgYXMgYnJv
a2VuIGFuZCByZWplY3RzIHRvIGxvYWQgdGhlbS4KPj4KPj4gU3VjaCBwYXlsb2FkcyB3aXRob3V0
IGFueSBjaGFuZ2VkIGZ1bmN0aW9ucyBtYXkgYXBwZWFyIHdoZW4gb25seQo+PiBob29rcyBhcmUg
c3BlY2lmaWVkLgo+IAo+IFJvc3MsIEkgYW0gZ29pbmcgdG8gcHVzaCB0aGlzIGluIG5leHQgd2Vl
ayB1bmxlc3MgeW91IGhhdmUgb3RoZXIgdGhvdWdodHM/Cj4gClJldmlld2VkLWJ5OiBSb3NzIExh
Z2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KClRoaXMgY29kZSBjaGFuZ2UgbG9v
a3MgT0sgdG8gbWUuIEhvd2V2ZXI6CgoxKSBJIHRoaW5rIHRoYXQgdGhlIGh5cGVydmlzb3Igc2hv
dWxkIHRyZWF0IGFuIGVtcHR5IC5saXZlcGF0Y2guZnVuY3MgCnNlY3Rpb24gdGhlIHNhbWUgYXMg
aXQgdHJlYXRzIGEgbm9uLXByZXNlbnQgLmxpdmVwYXRjaC5mdW5jcyBzZWN0aW9uIAooaS5lLiBp
dCBhbGxvd3MgaXQpIHdoaWNoIHdvdWxkIG1ha2UgdGhpcyBjaGFuZ2UgdW5uZWNlc3NhcnkuCgoy
KSBVbmxlc3MgSSdtIGJlaW5nIHN0dXBpZCwgSSBkb24ndCBzZWUgaG93IHRoaXMgY2hhbmdlIHdv
dWxkIHdvcmsgCmFueXdheS4gU3VyZWx5IHRoaXMgY29kZSBhdCB0aGUgc3RhcnQgb2YgcHJlcGFy
ZV9wYXlsb2FkKCkgd291bGQgZmFpbCBpZiAKdGhlIHNlY3Rpb24gd2VyZSBtaXNzaW5nPwoKICAg
ICBzZWMgPSBsaXZlcGF0Y2hfZWxmX3NlY19ieV9uYW1lKGVsZiwgRUxGX0xJVkVQQVRDSF9GVU5D
KTsKICAgICBBU1NFUlQoc2VjKTsKICAgICBpZiAoICFzZWN0aW9uX29rKGVsZiwgc2VjLCBzaXpl
b2YoKnBheWxvYWQtPmZ1bmNzKSkgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKClJlZ2FyZHMs
Ci0tIApSb3NzIExhZ2Vyd2FsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
