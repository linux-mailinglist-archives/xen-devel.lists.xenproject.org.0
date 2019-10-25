Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E4E45C0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 10:31:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNuxR-0003of-Rq; Fri, 25 Oct 2019 08:28:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNuxQ-0003oa-Gd
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 08:28:28 +0000
X-Inumbo-ID: 6a3e0c76-f701-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a3e0c76-f701-11e9-bbab-bc764e2007e4;
 Fri, 25 Oct 2019 08:28:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B00E9B185;
 Fri, 25 Oct 2019 08:28:25 +0000 (UTC)
To: Steven Haigh <netwiz@crc.id.au>
References: <1571918276.2606.0@crc.id.au>
 <CACCGGhBUx6AHfF2wJkQ3=M2OVDuLgR+Q4WBLCJE3Rb7-r3fRRQ@mail.gmail.com>
 <0dcf51532bdcde284d42c90780f57c97@crc.id.au>
 <82cb0edff0fb69d470a8374f5595e052@crc.id.au>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8fdbc94b-a333-a4ba-146e-e1b853655a79@suse.com>
Date: Fri, 25 Oct 2019 10:28:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <82cb0edff0fb69d470a8374f5595e052@crc.id.au>
Content-Language: en-US
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: Paul Durrant <pdurrant@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMjAxOSAwOTowMCwgU3RldmVuIEhhaWdoIHdyb3RlOgo+IEZ1cnRoZXIgdG8gbXkg
bGFzdCwgSSBkb3dubG9hZGVkIHRoZSBsYXRlc3QgV2luZG93cyBTZXJ2ZXIgMjAxNiBJU08gZnJv
bSAKPiBNaWNyb3NvZnQuCj4gCj4gRmlsZW5hbWU6IFdpbmRvd3NfU2VydmVyXzIwMTZfRGF0YWNl
bnRlcl9FVkFMX2VuLXVzXzE0MzkzX3JlZnJlc2guSVNPCj4gCj4gSGF2ZSBhdHRhY2hlZCBhcyBt
dWNoIG9mIHRoZSBsb2cgYXMgSSBjb3VsZCBnZXQgYXR0ZW1wdGluZyB0byBib290IGZyb20gCj4g
dGhlIElTTyBhbmQgaGF2aW5nIGEgYmxhbmsgTFYgYXMgdGhlIGluc3RhbGwgdGFyZ2V0Lgo+IAo+
IFRoZSBXaW5kb3dzIGVycm9yIG1lc3NhZ2UgKHNob3duIHZpYSBWTkMpIGlzIEhBTCBNRU1PUlkg
QUxMT0NBVElPTi4KCkhtbSwgdGhhdCdzIGFzIGlmIHRoZXJlIHdhcyBzdGlsbCAoYWdhaW4/KSBh
biBpc3N1ZSB3aXRoIENQVUlECmhhbmRsaW5nIC0gaWlyYyB0aGUgc2FtZSB3YXMgb2JzZXJ2YWJs
ZSBvbiBtYXhpbXVtLXNpemUgUm9tZQpzeXN0ZW1zIHByaW9yIHRvIGRmMjlkMDNmMWQgKGFuZCBp
dHMgZml4dXApLiBCZWxvdyB0aGUgZGVidWdnaW5nCnBhdGNoIEkgZGlkIHVzZSBhdCB0aGUgdGlt
ZSwgbWF5YmUgaXQgdHVybnMgb3V0IGhlbHBmdWwgaGVyZSB0b28KKGFuZCBwZXJoYXBzIHlvdSdk
IHJlYWxseSBvbmx5IG5lZWQgdGhlIGZpcnN0IGh1bmssIEkgaGFkIHB1dCBpbgp0aGUgb3RoZXIg
b25lIGp1c3QgaW4gY2FzZSBhbnl3YXkpLgoKSG93ZXZlciB0aGlzIGxvb2tzIHRvIGJlIGRpZmZl
cmVudCBmcm9tIHlvdXIgZWFybGllciByZXBvcnQsCndoZXJlIHlvdSBzYWlkIHlvdSd2ZSBnb3Qg
c29tZQoKKFhFTikgZDF2MCBWSVJJRElBTiBDUkFTSDogYWMgMCBhMGEwIGZmZmZmODA2NWMwNmJm
ODggYmY4CgpTbyBJIHdvbmRlciB3aGV0aGVyIHRoZXJlJ3MgYSBuZXcgaXNzdWUgbWFza2luZyB0
aGUgb2xkIG9uZS4KCkphbgoKLS0tIHVuc3RhYmxlLm9yaWcveGVuL2FyY2gveDg2L2h2bS9odm0u
YworKysgdW5zdGFibGUveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMzM3Miw2ICszMzcyLDkg
QEAgaW50IGh2bV92bWV4aXRfY3B1aWQoc3RydWN0IGNwdV91c2VyX3JlZwogICAgIH0KIAogICAg
IGd1ZXN0X2NwdWlkKGN1cnIsIGxlYWYsIHN1YmxlYWYsICZyZXMpOworaWYocmVncy0+YXggJiYg
KHJlZ3MtPmVheCA+PiAxNikgIT0gMHg0MDAwICYmIChsb25nKXJlZ3MtPnJpcCA8IDApIHsvL3Rl
bXAKKyBwcmludGsoIiVwdlslMDhseF06ICUwOHg6JTA4eD0lMDh4OiUwOHg6JTA4eDolMDh4XG4i
LCBjdXJyLCByZWdzLT5yaXAsIGxlYWYsIHN1YmxlYWYsIHJlcy5hLCByZXMuYiwgcmVzLmMsIHJl
cy5kKTsKK30KICAgICBIVk1UUkFDRV82RChDUFVJRCwgbGVhZiwgc3VibGVhZiwgcmVzLmEsIHJl
cy5iLCByZXMuYywgcmVzLmQpOwogCiAgICAgcmVncy0+cmF4ID0gcmVzLmE7Ci0tLSB1bnN0YWJs
ZS5vcmlnL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCisrKyB1bnN0YWJsZS94ZW4vYXJjaC94
ODYvaHZtL3N2bS9zdm0uYwpAQCAtMjIyMyw3ICsyMjIzLDEzIEBAIHN0YXRpYyB2b2lkIHN2bV9k
b19tc3JfYWNjZXNzKHN0cnVjdCBjcHUKIAogICAgICAgICByYyA9IGh2bV9tc3JfcmVhZF9pbnRl
cmNlcHQocmVncy0+ZWN4LCAmbXNyX2NvbnRlbnQpOwogICAgICAgICBpZiAoIHJjID09IFg4NkVN
VUxfT0tBWSApCit7Ly90ZW1wCiAgICAgICAgICAgICBtc3Jfc3BsaXQocmVncywgbXNyX2NvbnRl
bnQpOworIGlmKHJlZ3MtPmVjeCA9PSAweGMwMDExMDBjIHx8IHJlZ3MtPmVjeCA9PSAweGMwMDEx
MDA1KQorICBwcmludGsoIiVwdlslMDhseF06ICUwOHggLT4gJTA4eDolMDh4XG4iLCBjdXJyLCBy
ZWdzLT5yaXAsIHJlZ3MtPmVjeCwgcmVncy0+ZWR4LCByZWdzLT5lYXgpOworfSBlbHNlIGlmKHJl
Z3MtPmVjeCA9PSAweGMwMDExMDBjIHx8IHJlZ3MtPmVjeCA9PSAweGMwMDExMDA1KSB7CisgcHJp
bnRrKCIlcHZbJTA4bHhdOiAlMDh4IC0+ICNHUFxuIiwgY3VyciwgcmVncy0+cmlwLCByZWdzLT5l
Y3gpOworfQogICAgIH0KICAgICBlbHNlCiAgICAgICAgIHJjID0gaHZtX21zcl93cml0ZV9pbnRl
cmNlcHQocmVncy0+ZWN4LCBtc3JfZm9sZChyZWdzKSwgdHJ1ZSk7CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
