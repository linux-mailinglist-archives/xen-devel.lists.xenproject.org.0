Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A6115289F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:46:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHDG-0000Ho-Le; Wed, 05 Feb 2020 09:43:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izHDE-0000He-KQ
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:43:12 +0000
X-Inumbo-ID: ec28c7a8-47fb-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec28c7a8-47fb-11ea-ad98-bc764e2007e4;
 Wed, 05 Feb 2020 09:43:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0B8BBAF4E;
 Wed,  5 Feb 2020 09:43:11 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
Message-ID: <056a856a-147e-612b-d476-50be80406581@suse.com>
Date: Wed, 5 Feb 2020 10:43:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/3] AMD/IOMMU: replace a few literal numbers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50cm9kdWNlIElPTU1VX1BERV9ORVhUX0xFVkVMX3tNSU4sTUFYfSB0byByZXBsYWNlIGxpdGVy
YWwgMSwgNiwgYW5kIDcKaW5zdGFuY2VzLiBXaGlsZSBkb2luZyBzbyByZXBsYWNlIHR3byB1c2Vz
IG9mIG1lbXNldCgpIGJ5IGluaXRpYWxpemVycy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tClRCRDogV2Ugc2hvdWxkIHJlYWxseSBob25vciB0aGUg
aGF0cyBmaWVsZCBvZiB1bmlvbgogICAgIGFtZF9pb21tdV9leHRfZmVhdHVyZXMsIGJ1dCB0aGUg
c3BlY2lmaWNhdGlvbiAob3IgYXQgbGVhc3QgdGhlCiAgICAgcGFydHMgSSBkaWQgbG9vayBhdCBp
biB0aGUgY291cnNlIG9mIHB1dHRpbmcgdG9nZXRoZXIgdGhpcyBwYXRjaCkKICAgICBpcyB1bmNs
ZWFyIGFib3V0IHRoZSBtYXhpbXVtIHZhbGlkIHZhbHVlIGluIGNhc2UgRUZSU3VwIGlzIGNsZWFy
LgoKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYwpAQCAtMTg3LDcgKzE4Nyw4IEBA
IHN0YXRpYyBpbnQgaW9tbXVfcGRlX2Zyb21fZGZuKHN0cnVjdCBkb20KICAgICB0YWJsZSA9IGhk
LT5hcmNoLnJvb3RfdGFibGU7CiAgICAgbGV2ZWwgPSBoZC0+YXJjaC5wYWdpbmdfbW9kZTsKIAot
ICAgIEJVR19PTiggdGFibGUgPT0gTlVMTCB8fCBsZXZlbCA8IDEgfHwgbGV2ZWwgPiA2ICk7Cisg
ICAgQlVHX09OKCF0YWJsZSB8fCBsZXZlbCA8IElPTU1VX1BERV9ORVhUX0xFVkVMX01JTiB8fAor
ICAgICAgICAgICBsZXZlbCA+IElPTU1VX1BERV9ORVhUX0xFVkVMX01BWCk7CiAKICAgICAvKgog
ICAgICAqIEEgZnJhbWUgbnVtYmVyIHBhc3Qgd2hhdCB0aGUgY3VycmVudCBwYWdlIHRhYmxlcyBj
YW4gcmVwcmVzZW50IGNhbid0CkBAIC0xOTgsNyArMTk5LDcgQEAgc3RhdGljIGludCBpb21tdV9w
ZGVfZnJvbV9kZm4oc3RydWN0IGRvbQogCiAgICAgbmV4dF90YWJsZV9tZm4gPSBtZm5feChwYWdl
X3RvX21mbih0YWJsZSkpOwogCi0gICAgd2hpbGUgKCBsZXZlbCA+IDEgKQorICAgIHdoaWxlICgg
bGV2ZWwgPiBJT01NVV9QREVfTkVYVF9MRVZFTF9NSU4gKQogICAgIHsKICAgICAgICAgdW5zaWdu
ZWQgaW50IG5leHRfbGV2ZWwgPSBsZXZlbCAtIDE7CiAgICAgICAgIHB0X21mbltsZXZlbF0gPSBu
ZXh0X3RhYmxlX21mbjsKQEAgLTI3NCw3ICsyNzUsNyBAQCBzdGF0aWMgaW50IGlvbW11X3BkZV9m
cm9tX2RmbihzdHJ1Y3QgZG9tCiAgICAgICAgIGxldmVsLS07CiAgICAgfQogCi0gICAgLyogbWZu
IG9mIGxldmVsIDEgcGFnZSB0YWJsZSAqLworICAgIC8qIG1mbiBvZiBJT01NVV9QREVfTkVYVF9M
RVZFTF9NSU4gcGFnZSB0YWJsZSAqLwogICAgIHB0X21mbltsZXZlbF0gPSBuZXh0X3RhYmxlX21m
bjsKICAgICByZXR1cm4gMDsKIH0KQEAgLTI4NCw5ICsyODUsNyBAQCBpbnQgYW1kX2lvbW11X21h
cF9wYWdlKHN0cnVjdCBkb21haW4gKmQsCiB7CiAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQg
PSBkb21faW9tbXUoZCk7CiAgICAgaW50IHJjOwotICAgIHVuc2lnbmVkIGxvbmcgcHRfbWZuWzdd
OwotCi0gICAgbWVtc2V0KHB0X21mbiwgMCwgc2l6ZW9mKHB0X21mbikpOworICAgIHVuc2lnbmVk
IGxvbmcgcHRfbWZuW0lPTU1VX1BERV9ORVhUX0xFVkVMX01BWCArIDFdID0ge307CiAKICAgICBz
cGluX2xvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7CiAKQEAgLTMwMCw3ICsyOTksOCBAQCBp
bnQgYW1kX2lvbW11X21hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgIHJldHVybiBy
YzsKICAgICB9CiAKLSAgICBpZiAoIGlvbW11X3BkZV9mcm9tX2RmbihkLCBkZm5feChkZm4pLCBw
dF9tZm4sIHRydWUpIHx8IChwdF9tZm5bMV0gPT0gMCkgKQorICAgIGlmICggaW9tbXVfcGRlX2Zy
b21fZGZuKGQsIGRmbl94KGRmbiksIHB0X21mbiwgdHJ1ZSkgfHwKKyAgICAgICAgICFwdF9tZm5b
SU9NTVVfUERFX05FWFRfTEVWRUxfTUlOXSApCiAgICAgewogICAgICAgICBzcGluX3VubG9jaygm
aGQtPmFyY2gubWFwcGluZ19sb2NrKTsKICAgICAgICAgQU1EX0lPTU1VX0RFQlVHKCJJbnZhbGlk
IElPIHBhZ2V0YWJsZSBlbnRyeSBkZm4gPSAlIlBSSV9kZm4iXG4iLApAQCAtMzEwLDkgKzMxMCwx
MSBAQCBpbnQgYW1kX2lvbW11X21hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgfQogCiAg
ICAgLyogSW5zdGFsbCA0ayBtYXBwaW5nICovCi0gICAgKmZsdXNoX2ZsYWdzIHw9IHNldF9pb21t
dV9wdGVfcHJlc2VudChwdF9tZm5bMV0sIGRmbl94KGRmbiksIG1mbl94KG1mbiksCi0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxLCAoZmxhZ3MgJiBJT01NVUZfd3Jp
dGFibGUpLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGZsYWdz
ICYgSU9NTVVGX3JlYWRhYmxlKSk7CisgICAgKmZsdXNoX2ZsYWdzIHw9IHNldF9pb21tdV9wdGVf
cHJlc2VudChwdF9tZm5bSU9NTVVfUERFX05FWFRfTEVWRUxfTUlOXSwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRmbl94KGRmbiksIG1mbl94KG1mbiksCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9QREVfTkVYVF9MRVZF
TF9NSU4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyAm
IElPTU1VRl93cml0YWJsZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZsYWdzICYgSU9NTVVGX3JlYWRhYmxlKTsKIAogICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJj
aC5tYXBwaW5nX2xvY2spOwogCkBAIC0zMjIsMTEgKzMyNCw5IEBAIGludCBhbWRfaW9tbXVfbWFw
X3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwKIGludCBhbWRfaW9tbXVfdW5tYXBfcGFnZShzdHJ1Y3Qg
ZG9tYWluICpkLCBkZm5fdCBkZm4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50ICpmbHVzaF9mbGFncykKIHsKLSAgICB1bnNpZ25lZCBsb25nIHB0X21mbls3XTsKKyAgICB1
bnNpZ25lZCBsb25nIHB0X21mbltJT01NVV9QREVfTkVYVF9MRVZFTF9NQVggKyAxXSA9IHt9Owog
ICAgIHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGQpOwogCi0gICAgbWVtc2V0
KHB0X21mbiwgMCwgc2l6ZW9mKHB0X21mbikpOwotCiAgICAgc3Bpbl9sb2NrKCZoZC0+YXJjaC5t
YXBwaW5nX2xvY2spOwogCiAgICAgaWYgKCAhaGQtPmFyY2gucm9vdF90YWJsZSApCkBAIC0zNDQs
MTAgKzM0NCwxMiBAQCBpbnQgYW1kX2lvbW11X3VubWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqCiAg
ICAgICAgIHJldHVybiAtRUZBVUxUOwogICAgIH0KIAotICAgIGlmICggcHRfbWZuWzFdICkKKyAg
ICBpZiAoIHB0X21mbltJT01NVV9QREVfTkVYVF9MRVZFTF9NSU5dICkKICAgICB7CiAgICAgICAg
IC8qIE1hcmsgUFRFIGFzICdwYWdlIG5vdCBwcmVzZW50Jy4gKi8KLSAgICAgICAgKmZsdXNoX2Zs
YWdzIHw9IGNsZWFyX2lvbW11X3B0ZV9wcmVzZW50KHB0X21mblsxXSwgZGZuX3goZGZuKSk7Cisg
ICAgICAgICpmbHVzaF9mbGFncyB8PQorICAgICAgICAgICAgY2xlYXJfaW9tbXVfcHRlX3ByZXNl
bnQocHRfbWZuW0lPTU1VX1BERV9ORVhUX0xFVkVMX01JTl0sCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkZm5feChkZm4pKTsKICAgICB9CiAKICAgICBzcGluX3VubG9jaygm
aGQtPmFyY2gubWFwcGluZ19sb2NrKTsKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L3BjaV9hbWRfaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2Ft
ZF9pb21tdS5jCkBAIC0yMzMsMTQgKzIzMywxNCBAQCBzdGF0aWMgaW50IF9fbXVzdF9jaGVjayBh
bGxvY2F0ZV9kb21haW5fCiAKIGludCBhbWRfaW9tbXVfZ2V0X3BhZ2luZ19tb2RlKHVuc2lnbmVk
IGxvbmcgZW50cmllcykKIHsKLSAgICBpbnQgbGV2ZWwgPSAxOworICAgIGludCBsZXZlbCA9IElP
TU1VX1BERV9ORVhUX0xFVkVMX01JTjsKIAogICAgIEJVR19PTiggIWVudHJpZXMgKTsKIAogICAg
IHdoaWxlICggZW50cmllcyA+IFBURV9QRVJfVEFCTEVfU0laRSApCiAgICAgewogICAgICAgICBl
bnRyaWVzID0gUFRFX1BFUl9UQUJMRV9BTElHTihlbnRyaWVzKSA+PiBQVEVfUEVSX1RBQkxFX1NI
SUZUOwotICAgICAgICBpZiAoICsrbGV2ZWwgPiA2ICkKKyAgICAgICAgaWYgKCArK2xldmVsID4g
SU9NTVVfUERFX05FWFRfTEVWRUxfTUFYICkKICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwog
ICAgIH0KIAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRlZnMu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LWRlZnMuaApAQCAt
NDY1LDYgKzQ2NSw5IEBAIHVuaW9uIGFtZF9pb21tdV94MmFwaWNfY29udHJvbCB7CiAjZGVmaW5l
IElPTU1VX1BBR0VfVEFCTEVfVTMyX1BFUl9FTlRSWQkoSU9NTVVfUEFHRV9UQUJMRV9FTlRSWV9T
SVpFIC8gNCkKICNkZWZpbmUgSU9NTVVfUEFHRV9UQUJMRV9BTElHTk1FTlQJNDA5NgogCisjZGVm
aW5lIElPTU1VX1BERV9ORVhUX0xFVkVMX01JTgkxCisjZGVmaW5lIElPTU1VX1BERV9ORVhUX0xF
VkVMX01BWAk2CisKIHN0cnVjdCBhbWRfaW9tbXVfcHRlIHsKICAgICB1aW50NjRfdCBwcjoxOwog
ICAgIHVpbnQ2NF90IGlnbm9yZWQwOjQ7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
