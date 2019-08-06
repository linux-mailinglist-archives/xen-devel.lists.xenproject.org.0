Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2084835FF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 17:58:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv1mw-0000ts-5S; Tue, 06 Aug 2019 15:54:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hv1mu-0000tn-BT
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 15:54:12 +0000
X-Inumbo-ID: 6e298b77-b862-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6e298b77-b862-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 15:54:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3813AAE82;
 Tue,  6 Aug 2019 15:54:10 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-5-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b604bbcc-4476-9a3d-26fc-84303661c235@suse.com>
Date: Tue, 6 Aug 2019 17:54:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730134419.2739-5-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] make
 passthrough/pci.c:deassign_device() static
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNTo0NCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoaXMgZnVuY3Rpb24g
aXMgb25seSBldmVyIGNhbGxlZCBmcm9tIHdpdGhpbiB0aGUgc2FtZSBzb3VyY2UgbW9kdWxlIGFu
ZAo+IHJlYWxseSBoYXMgbm8gYnVzaW5lc3MgYmVpbmcgZGVjbGFyZWQgeGVuL2lvbW11LmguIFRo
aXMgcGF0Y2ggcmVsb2NhdGVzCj4gdGhlIGZ1bmN0aW9uIGFoZWFkIG9mIHRoZSBmaXJzdCBjYWxs
ZWQgYW5kIG1ha2VzIGl0IHN0YXRpYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkJ1dCBvZiBjb3Vyc2UgaXQgd291bGQgaGF2ZSBiZWVuIG5pY2UgaWYgc29t
ZSBtaW5pbWFsIGFuZCBvYnZpb3VzCnN0eWxlIGNvcnJlY3Rpb25zIHdlcmUgZG9uZSBhdCB0aGUg
c2FtZSB0aW1lOgoKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gQEAgLTg4OSw2ICs4ODksNTIgQEAgc3Rh
dGljIGludCBwY2lfY2xlYW5fZHBjaV9pcnFzKHN0cnVjdCBkb21haW4gKmQpCj4gICAgICAgcmV0
dXJuIDA7Cj4gICB9Cj4gICAKPiArLyogY2FsbGVyIHNob3VsZCBob2xkIHRoZSBwY2lkZXZzX2xv
Y2sgKi8KPiArc3RhdGljIGludCBkZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2
IHNlZywgdTggYnVzLCB1OCBkZXZmbikKCnVpbnQ8Tj5fdAoKPiArewo+ICsgICAgY29uc3Qgc3Ry
dWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7Cj4gKyAgICBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiA9IE5VTEw7CgpzdHJheSBpbml0aWFsaXplcgoKPiArICAgIGludCByZXQgPSAwOwo+
ICsKPiArICAgIGlmICggIWlzX2lvbW11X2VuYWJsZWQoZCkgKQo+ICsgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+ICsKPiArICAgIEFTU0VSVChwY2lkZXZzX2xvY2tlZCgpKTsKPiArICAgIHBkZXYg
PSBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGQsIHNlZywgYnVzLCBkZXZmbik7Cj4gKyAgICBpZiAo
ICFwZGV2ICkKPiArICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiArCj4gKyAgICB3aGlsZSAoIHBk
ZXYtPnBoYW50b21fc3RyaWRlICkKPiArICAgIHsKPiArICAgICAgICBkZXZmbiArPSBwZGV2LT5w
aGFudG9tX3N0cmlkZTsKPiArICAgICAgICBpZiAoIFBDSV9TTE9UKGRldmZuKSAhPSBQQ0lfU0xP
VChwZGV2LT5kZXZmbikgKQo+ICsgICAgICAgICAgICBicmVhazsKPiArICAgICAgICByZXQgPSBo
ZC0+cGxhdGZvcm1fb3BzLT5yZWFzc2lnbl9kZXZpY2UoZCwgaGFyZHdhcmVfZG9tYWluLCBkZXZm
biwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNp
X3RvX2RldihwZGV2KSk7Cj4gKyAgICAgICAgaWYgKCAhcmV0ICkKPiArICAgICAgICAgICAgY29u
dGludWU7Cj4gKwo+ICsgICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgImQlZDogZGVhc3NpZ24g
JTA0eDolMDJ4OiUwMnguJXUgZmFpbGVkICglZClcbiIsCj4gKyAgICAgICAgICAgICAgIGQtPmRv
bWFpbl9pZCwgc2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4pLCByZXQp
OwoKKGxlc3MgIm1pbmltYWwiKSB1c2UgJXBkIChhbHNvIG9uY2UgbW9yZSBiZWxvdykKCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
