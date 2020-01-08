Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708B134304
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:59:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAsN-0005fa-2z; Wed, 08 Jan 2020 12:55:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipAsM-0005fV-86
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:55:54 +0000
X-Inumbo-ID: 2ea24f74-3216-11ea-a455-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ea24f74-3216-11ea-a455-bc764e2007e4;
 Wed, 08 Jan 2020 12:55:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 978AFADEE;
 Wed,  8 Jan 2020 12:55:43 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200108123140.77999-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67719229-8c88-92dd-139a-8aef8cc5f544@suse.com>
Date: Wed, 8 Jan 2020 13:55:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108123140.77999-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] nvmx: implement support for MSR bitmaps
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxMzozMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXgu
Ywo+IEBAIC0xMjgsNiArMTI4LDE2IEBAIGludCBudm14X3ZjcHVfaW5pdGlhbGlzZShzdHJ1Y3Qg
dmNwdSAqdikKPiAgICAgICAgICB1bm1hcF9kb21haW5fcGFnZSh2dyk7Cj4gICAgICB9Cj4gIAo+
ICsgICAgaWYgKCBjcHVfaGFzX3ZteF9tc3JfYml0bWFwICkKPiArICAgIHsKPiArICAgICAgICBu
dm14LT5tc3JfbWVyZ2VkID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEwsIDApOwoKRGVzcGl0ZSB0
aGlzIG1hdGNoaW5nIG90aGVyIGNvZGUgaW4gdGhlIHNhbWUgZmlsZSwgaXQncyBub3QgcmVhbGx5
CndoYXQgeW91IHdhbnQsIEkgdGhpbmsuIEluc3RlYWQgcGxlYXNlIGNvbnNpZGVyIHVzaW5nCgog
ICAgICAgIG52bXgtPm1zcl9tZXJnZWQgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVNRl9ub19v
d25lcik7Cgp0byBob25vciBkJ3MgTlVNQSBwcm9wZXJ0aWVzLgoKPiBAQCAtMTgyLDYgKzE5Miwx
MSBAQCB2b2lkIG52bXhfdmNwdV9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAgICAgIGZy
ZWVfZG9taGVhcF9wYWdlKHYtPmFyY2guaHZtLnZteC52bXdyaXRlX2JpdG1hcCk7Cj4gICAgICAg
ICAgdi0+YXJjaC5odm0udm14LnZtd3JpdGVfYml0bWFwID0gTlVMTDsKPiAgICAgIH0KPiArICAg
IGlmICggbnZteC0+bXNyX21lcmdlZCApCj4gKyAgICB7Cj4gKyAgICAgICAgZnJlZV9kb21oZWFw
X3BhZ2UobnZteC0+bXNyX21lcmdlZCk7Cj4gKyAgICAgICAgbnZteC0+bXNyX21lcmdlZCA9IE5V
TEw7CgpIbW0sIEknbSBwdXp6bGVkIHRoYXQgd2UgaGF2ZSBGUkVFX1hFTkhFQVBfUEFHRSgpLCBi
dXQgbm8KRlJFRV9ET01IRUFQX1BBR0UoKS4KCj4gQEAgLTU0OCw2ICs1NjMsNTAgQEAgdW5zaWdu
ZWQgbG9uZyAqX3NoYWRvd19pb19iaXRtYXAoc3RydWN0IHZjcHUgKnYpCj4gICAgICByZXR1cm4g
bmVzdGVkaHZtX3ZjcHVfaW9tYXBfZ2V0KHBvcnQ4MCwgcG9ydEVEKTsKPiAgfQo+ICAKPiArc3Rh
dGljIHZvaWQgdXBkYXRlX21zcmJpdG1hcChzdHJ1Y3QgdmNwdSAqdikKPiArewo+ICsgICAgc3Ry
dWN0IG5lc3RlZHZteCAqbnZteCA9ICZ2Y3B1XzJfbnZteCh2KTsKPiArICAgIHN0cnVjdCB2bXhf
bXNyX2JpdG1hcCAqbXNyX2JpdG1hcDsKPiArICAgIHVuc2lnbmVkIGludCBtc3I7Cj4gKwo+ICsg
ICAgQVNTRVJUKF9fbjJfZXhlY19jb250cm9sKHYpICYgQ1BVX0JBU0VEX0FDVElWQVRFX01TUl9C
SVRNQVApOwo+ICsKPiArICAgIGlmICggIW52bXgtPm1zcmJpdG1hcCApCj4gKyAgICAgICAgcmV0
dXJuOwo+ICsKPiArICAgIG1zcl9iaXRtYXAgPSBfX21hcF9kb21haW5fcGFnZShudm14LT5tc3Jf
bWVyZ2VkKTsKPiArCj4gKyAgICBiaXRtYXBfb3IobXNyX2JpdG1hcC0+cmVhZF9sb3csIG52bXgt
Pm1zcmJpdG1hcC0+cmVhZF9sb3csCj4gKyAgICAgICAgICAgICAgdi0+YXJjaC5odm0udm14Lm1z
cl9iaXRtYXAtPnJlYWRfbG93LAo+ICsgICAgICAgICAgICAgIHNpemVvZihtc3JfYml0bWFwLT5y
ZWFkX2xvdykgKiA4KTsKPiArICAgIGJpdG1hcF9vcihtc3JfYml0bWFwLT5yZWFkX2hpZ2gsIG52
bXgtPm1zcmJpdG1hcC0+cmVhZF9oaWdoLAo+ICsgICAgICAgICAgICAgIHYtPmFyY2guaHZtLnZt
eC5tc3JfYml0bWFwLT5yZWFkX2hpZ2gsCj4gKyAgICAgICAgICAgICAgc2l6ZW9mKG1zcl9iaXRt
YXAtPnJlYWRfaGlnaCkgKiA4KTsKPiArICAgIGJpdG1hcF9vcihtc3JfYml0bWFwLT53cml0ZV9s
b3csIG52bXgtPm1zcmJpdG1hcC0+d3JpdGVfbG93LAo+ICsgICAgICAgICAgICAgIHYtPmFyY2gu
aHZtLnZteC5tc3JfYml0bWFwLT53cml0ZV9sb3csCj4gKyAgICAgICAgICAgICAgc2l6ZW9mKG1z
cl9iaXRtYXAtPndyaXRlX2xvdykgKiA4KTsKPiArICAgIGJpdG1hcF9vcihtc3JfYml0bWFwLT53
cml0ZV9oaWdoLCBudm14LT5tc3JiaXRtYXAtPndyaXRlX2hpZ2gsCj4gKyAgICAgICAgICAgICAg
di0+YXJjaC5odm0udm14Lm1zcl9iaXRtYXAtPndyaXRlX2hpZ2gsCj4gKyAgICAgICAgICAgICAg
c2l6ZW9mKG1zcl9iaXRtYXAtPndyaXRlX2hpZ2gpICogOCk7Cj4gKwo+ICsgICAgLyoKPiArICAg
ICAqIE5lc3RlZCBWTVggZG9lc24ndCBzdXBwb3J0IGFueSB4MkFQSUMgaGFyZHdhcmUgdmlydHVh
bGl6YXRpb24sIHNvCj4gKyAgICAgKiBtYWtlIHN1cmUgYWxsIHRoZSB4MkFQSUMgTVNScyBhcmUg
dHJhcHBlZC4KPiArICAgICAqLwo+ICsgICAgQVNTRVJUKCEoX19uMl9zZWNvbmRhcnlfZXhlY19j
b250cm9sKHYpICYKPiArICAgICAgICAgICAgIChTRUNPTkRBUllfRVhFQ19WSVJUVUFMSVpFX1gy
QVBJQ19NT0RFIHwKPiArICAgICAgICAgICAgICBTRUNPTkRBUllfRVhFQ19WSVJUVUFMX0lOVFJf
REVMSVZFUlkpKSApOwo+ICsgICAgZm9yICggbXNyID0gTVNSX1gyQVBJQ19GSVJTVDsgbXNyIDw9
IE1TUl9YMkFQSUNfRklSU1QgKyAweGZmOyBtc3IrKyApCj4gKyAgICB7Cj4gKyAgICAgICAgc2V0
X2JpdChtc3IsIG1zcl9iaXRtYXAtPnJlYWRfbG93KTsKPiArICAgICAgICBzZXRfYml0KG1zciwg
bXNyX2JpdG1hcC0+d3JpdGVfbG93KTsKClN1cmVseSBfX3NldF9iaXQoKSB3aWxsIHN1ZmZpY2Us
IGlmIGFsbCB0aGUgYml0bWFwX29yKCkgYWJvdmUgYXJlCmZpbmU/IE9mIGNvdXJzZSB1bHRpbWF0
ZWx5IHdlIHdpbGwgd2FudCB0byBoYXZlIHNvbWV0aGluZyBsaWtlCmJpdG1hcF9maWxsX3Jhbmdl
KCkgZm9yIHB1cnBvc2VzIGxpa2UgdGhpcyBvbmUuCgo+IEBAIC01NTgsMTAgKzYxNywxNSBAQCB2
b2lkIG52bXhfdXBkYXRlX2V4ZWNfY29udHJvbChzdHJ1Y3QgdmNwdSAqdiwgdTMyIGhvc3RfY250
cmwpCj4gICAgICBzaGFkb3dfY250cmwgPSBfX24yX2V4ZWNfY29udHJvbCh2KTsKPiAgICAgIHBp
b19jbnRybCAmPSBzaGFkb3dfY250cmw7Cj4gICAgICAvKiBFbmZvcmNlIHRoZSByZW1vdmVkIGZl
YXR1cmVzICovCj4gLSAgICBzaGFkb3dfY250cmwgJj0gfihDUFVfQkFTRURfQUNUSVZBVEVfTVNS
X0JJVE1BUAo+IC0gICAgICAgICAgICAgICAgICAgICAgfCBDUFVfQkFTRURfQUNUSVZBVEVfSU9f
QklUTUFQCj4gKyAgICBzaGFkb3dfY250cmwgJj0gfihDUFVfQkFTRURfQUNUSVZBVEVfSU9fQklU
TUFQCj4gICAgICAgICAgICAgICAgICAgICAgICB8IENQVV9CQVNFRF9VTkNPTkRfSU9fRVhJVElO
Ryk7Cj4gLSAgICBzaGFkb3dfY250cmwgfD0gaG9zdF9jbnRybDsKPiArICAgIC8qCj4gKyAgICAg
KiBEbyBOT1QgZW5mb3JjZSB0aGUgTVNSIGJpdG1hcCBjdXJyZW50bHkgdXNlZCBieSBMMSwgYXMg
Y2VydGFpbiBoYXJkd2FyZQo+ICsgICAgICogdmlydHVhbGl6YXRpb24gZmVhdHVyZXMgcmVxdWly
ZSBzcGVjaWZpYyBNU1IgYml0bWFwIHNldHRpbmdzLCBidXQgd2l0aG91dAo+ICsgICAgICogdXNp
bmcgc3VjaCBmZWF0dXJlcyB0aGUgYml0bWFwIGNvdWxkIGJlIGxlYWtpbmcgdGhyb3VnaCB1bndh
bnRlZCBNU1IKPiArICAgICAqIGFjY2Vzc2VzLgoKUGVyaGFwcyAiLi4uLCBidXQgd2l0aG91dCB0
aGUgZ3Vlc3QgYWxzbyB1c2luZyB0aGVzZSBzYW1lIGZlYXR1cmVzCi4uLiI/IEFuZCB0aGVuIC0g
d2h5IHdvdWxkIGEgc2ltaWxhciBhcmd1bWVudCBub3QgYXBwbHkgdG8gdGhlIEkvTwpiaXRtYXAg
YXMgd2VsbD8KCj4gQEAgLTU4NCw2ICs2NDgsOSBAQCB2b2lkIG52bXhfdXBkYXRlX2V4ZWNfY29u
dHJvbChzdHJ1Y3QgdmNwdSAqdiwgdTMyIGhvc3RfY250cmwpCj4gICAgICAgICAgX192bXdyaXRl
KElPX0JJVE1BUF9CLCB2aXJ0X3RvX21hZGRyKGJpdG1hcCkgKyBQQUdFX1NJWkUpOwo+ICAgICAg
fQo+ICAKPiArICAgIGlmICggc2hhZG93X2NudHJsICYgQ1BVX0JBU0VEX0FDVElWQVRFX01TUl9C
SVRNQVAgKQo+ICsgICAgICAgIHVwZGF0ZV9tc3JiaXRtYXAodik7CgpJbiB0aGUgZnVuY3Rpb24g
eW91IGFzc2VydCB0aGUgYml0IHRvIGJlIHNldCBpbiB0aGUgdlZNQ1MsIGJ1dCAuLi4KCj4gICAg
ICAvKiBUT0RPOiBjaGFuZ2UgTDAgaW50ciB3aW5kb3cgdG8gTVRGIG9yIE5NSSB3aW5kb3cgKi8K
PiAgICAgIF9fdm13cml0ZShDUFVfQkFTRURfVk1fRVhFQ19DT05UUk9MLCBzaGFkb3dfY250cmwp
OwoKLi4uIGl0IGdldHMgd3JpdHRlbiBvbmx5IGhlcmUuCgo+IEBAIC0xMzUxLDYgKzE0MTgsOSBA
QCBzdGF0aWMgdm9pZCB2aXJ0dWFsX3ZtZXhpdChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykK
PiAgICAgIHZteF91cGRhdGVfc2Vjb25kYXJ5X2V4ZWNfY29udHJvbCh2KTsKPiAgICAgIHZteF91
cGRhdGVfZXhjZXB0aW9uX2JpdG1hcCh2KTsKPiAgCj4gKyAgICBpZiAoIHYtPmFyY2guaHZtLnZt
eC5leGVjX2NvbnRyb2wgJiBDUFVfQkFTRURfQUNUSVZBVEVfTVNSX0JJVE1BUCApCj4gKyAgICAg
ICAgX192bXdyaXRlKE1TUl9CSVRNQVAsIHZpcnRfdG9fbWFkZHIodi0+YXJjaC5odm0udm14Lm1z
cl9iaXRtYXApKTsKPiArCj4gICAgICBsb2FkX3Z2bWNzX2hvc3Rfc3RhdGUodik7CgpXb3VsZG4n
dCB0aGUgYWRkaXRpb24gYmV0dGVyIG1vdmUgaW50byB0aGlzIGZ1bmN0aW9uPwoKPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdnZteC5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9odm0vdm14L3Z2bXguaAo+IEBAIC0zNyw3ICszNyw4IEBAIHN0cnVjdCBuZXN0ZWR2bXgg
ewo+ICAgICAgICovCj4gICAgICBwYWRkcl90ICAgIHZteG9uX3JlZ2lvbl9wYTsKPiAgICAgIHZv
aWQgICAgICAgKmlvYml0bWFwWzJdOwkJLyogbWFwICh2YSkgb2YgTDEgZ3Vlc3QgSS9PIGJpdG1h
cCAqLwo+IC0gICAgdm9pZCAgICAgICAqbXNyYml0bWFwOwkJLyogbWFwICh2YSkgb2YgTDEgZ3Vl
c3QgTVNSIGJpdG1hcCAqLwo+ICsgICAgc3RydWN0IHZteF9tc3JfYml0bWFwICptc3JiaXRtYXA7
CS8qIG1hcCAodmEpIG9mIEwxIGd1ZXN0IE1TUiBiaXRtYXAgKi8KPiArICAgIHN0cnVjdCBwYWdl
X2luZm8gKm1zcl9tZXJnZWQ7ICAgICAgIC8qIG1lcmdlZCBMMSBhbmQgTDEgZ3Vlc3QgTVNSIGJp
dG1hcCAqLwoKRWl0aGVyIHlvdSBjb252ZXJ0IHRoZSB0YWIgdG8gc3BhY2VzIGF0IGxlYXN0IG9u
IHRoZSBsaW5lIHlvdQpjaGFuZ2UsIG9yIHlvdSB1c2UgYSB0YWIgKG9yIHR3bykgYXMgd2VsbCBv
biB0aGUgbGluZSB5b3UgYWRkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
