Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DF1B1831
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 08:23:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8ewa-0001JW-He; Fri, 13 Sep 2019 06:20:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8ewY-0001JR-OQ
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 06:20:30 +0000
X-Inumbo-ID: 950ca4be-d5ee-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 950ca4be-d5ee-11e9-a337-bc764e2007e4;
 Fri, 13 Sep 2019 06:20:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0BCEABBE;
 Fri, 13 Sep 2019 06:20:28 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190912185556.22173-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <edfb5e08-0040-6d52-6684-ea2e0e4f0fd4@suse.com>
Date: Fri, 13 Sep 2019 08:20:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912185556.22173-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0.5/8] libx86: Proactively initialise
 error pointers
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAyMDo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIHJlc3VsdHMg
aW4gYmV0dGVyIGJlaGF2aW91ciBmb3IgdGhlIGNhbGxlci4KPiAKPiBTdWdnZXN0ZWQtYnk6IEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkJ1dCBJJ20gY3VyaW91czoKCj4gLS0tIGEvdG9vbHMvdGVzdHMv
Y3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYwo+ICsrKyBiL3Rvb2xzL3Rlc3RzL2NwdS1wb2xp
Y3kvdGVzdC1jcHUtcG9saWN5LmMKPiBAQCAtMjgzLDcgKzI4Myw3IEBAIHN0YXRpYyB2b2lkIHRl
c3RfY3B1aWRfZGVzZXJpYWxpc2VfZmFpbHVyZSh2b2lkKQo+ICAgICAgZm9yICggc2l6ZV90IGkg
PSAwOyBpIDwgQVJSQVlfU0laRSh0ZXN0cyk7ICsraSApCj4gICAgICB7Cj4gICAgICAgICAgY29u
c3Qgc3RydWN0IHRlc3QgKnQgPSAmdGVzdHNbaV07Cj4gLSAgICAgICAgdWludDMyX3QgZXJyX2xl
YWYgPSB+MHUsIGVycl9zdWJsZWFmID0gfjB1Owo+ICsgICAgICAgIHVpbnQzMl90IGVycl9sZWFm
LCBlcnJfc3VibGVhZjsKPiAgICAgICAgICBpbnQgcmM7Cj4gIAo+ICAgICAgICAgIC8qIE5vIHdy
aXRlcyBzaG91bGQgb2NjdXIuICBVc2UgTlVMTCB0byBjYXRjaCBlcnJvcnMuICovCj4gQEAgLTMz
Niw3ICszMzYsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X21zcl9kZXNlcmlhbGlzZV9mYWlsdXJlKHZv
aWQpCj4gICAgICBmb3IgKCBzaXplX3QgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHRlc3RzKTsgKytp
ICkKPiAgICAgIHsKPiAgICAgICAgICBjb25zdCBzdHJ1Y3QgdGVzdCAqdCA9ICZ0ZXN0c1tpXTsK
PiAtICAgICAgICB1aW50MzJfdCBlcnJfbXNyID0gfjB1Owo+ICsgICAgICAgIHVpbnQzMl90IGVy
cl9tc3I7CgpBbnkgcmVhc29uIGZvciB0aGUgKGJlbmlnbikgc3dpdGNoIGZyb20gfjB1IC4uLgoK
PiAtLS0gYS94ZW4vbGliL3g4Ni9jcHVpZC5jCj4gKysrIGIveGVuL2xpYi94ODYvY3B1aWQuYwo+
IEBAIC0zODEsNiArMzgxLDExIEBAIGludCB4ODZfY3B1aWRfY29weV9mcm9tX2J1ZmZlcihzdHJ1
Y3QgY3B1aWRfcG9saWN5ICpwLAo+ICAgICAgdW5zaWduZWQgaW50IGk7Cj4gICAgICB4ZW5fY3B1
aWRfbGVhZl90IGRhdGE7Cj4gIAo+ICsgICAgaWYgKCBlcnJfbGVhZiApCj4gKyAgICAgICAgKmVy
cl9sZWFmID0gLTE7Cj4gKyAgICBpZiAoIGVycl9zdWJsZWFmICkKPiArICAgICAgICAqZXJyX3N1
YmxlYWYgPSAtMTsKPiArCj4gICAgICAvKgo+ICAgICAgICogQSB3ZWxsIGZvcm1lZCBjYWxsZXIg
aXMgZXhwZWN0ZWQgdG8gcGFzcyBhbiBhcnJheSB3aXRoIGxlYXZlcyBpbiBvcmRlciwKPiAgICAg
ICAqIGFuZCB3aXRob3V0IGFueSByZXBldGl0aW9ucy4gIEhvd2V2ZXIsIGR1ZSB0byBwZXItdmVu
ZG9yIGRpZmZlcmVuY2VzLAo+IC0tLSBhL3hlbi9saWIveDg2L21zci5jCj4gKysrIGIveGVuL2xp
Yi94ODYvbXNyLmMKPiBAQCAtNTUsNiArNTUsOSBAQCBpbnQgeDg2X21zcl9jb3B5X2Zyb21fYnVm
ZmVyKHN0cnVjdCBtc3JfcG9saWN5ICpwLAo+ICAgICAgeGVuX21zcl9lbnRyeV90IGRhdGE7Cj4g
ICAgICBpbnQgcmM7Cj4gIAo+ICsgICAgaWYgKCBlcnJfbXNyICkKPiArICAgICAgICAqZXJyX21z
ciA9IC0xOwoKLi4uIHRvIC0xPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
