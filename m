Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E968514058B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 09:36:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isN4H-0000Lr-0Z; Fri, 17 Jan 2020 08:33:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isN4F-0000Lm-DV
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 08:33:23 +0000
X-Inumbo-ID: 03c15fd1-3904-11ea-887d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03c15fd1-3904-11ea-887d-12813bfff9fa;
 Fri, 17 Jan 2020 08:33:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 54E51AD27;
 Fri, 17 Jan 2020 08:33:18 +0000 (UTC)
To: Wei Xu <xuwei5@hisilicon.com>
References: <1579232458-26803-1-git-send-email-xuwei5@hisilicon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <539d5900-1cc6-a490-7319-5357c6aa1219@suse.com>
Date: Fri, 17 Jan 2020 09:33:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1579232458-26803-1-git-send-email-xuwei5@hisilicon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ns16550: Add ACPI support
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
Cc: sstabellini@kernel.org, julien@xen.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, linuxarm@huawei.com,
 shameerali.kolothum.thodi@huawei.com, prime.zeng@hisilicon.com,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAwNDo0MCwgV2VpIFh1IHdyb3RlOgo+IC0tLSBhL3hlbi9kcml2ZXJzL2No
YXIvbnMxNjU1MC5jCj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBAQCAtMTYy
MCw2ICsxNjIwLDYxIEBAIERUX0RFVklDRV9TVEFSVChuczE2NTUwLCAiTlMxNjU1MCBVQVJUIiwg
REVWSUNFX1NFUklBTCkKPiAgRFRfREVWSUNFX0VORAo+ICAKPiAgI2VuZGlmIC8qIEhBU19ERVZJ
Q0VfVFJFRSAqLwo+ICsKPiArI2lmZGVmIENPTkZJR19BQ1BJCj4gKyNpbmNsdWRlIDx4ZW4vYWNw
aS5oPgo+ICsKPiArc3RhdGljIGludCBfX2luaXQgbnMxNjU1MF9hY3BpX3VhcnRfaW5pdChjb25z
dCB2b2lkICpkYXRhKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgYWNwaV90YWJsZV9zcGNyICpzcGNyID0g
TlVMTDsKClRoZSBpbml0aWFsaXplciBpc24ndCBzdHJpY3RseSBuZWVkZWQsIGlzIGl0PwoKPiAr
ICAgIGFjcGlfc3RhdHVzIHN0YXR1czsKPiArICAgIHN0cnVjdCBuczE2NTUwICp1YXJ0Owo+ICsK
PiArICAgIHN0YXR1cyA9IGFjcGlfZ2V0X3RhYmxlKEFDUElfU0lHX1NQQ1IsIDAsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICoqKSZzcGNy
KTsKPiArCj4gKyAgICBpZiAoIEFDUElfRkFJTFVSRShzdGF0dXMpICkKPiArICAgIHsKPiArICAg
ICAgICBwcmludGsoIm5zMTY1NTA6IEZhaWxlZCB0byBnZXQgU1BDUiB0YWJsZVxuIik7Cj4gKyAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICB9Cj4gKwo+ICsgICAgdWFydCA9ICZuczE2NTUw
X2NvbVswXTsKCllvdSB3YW50IHRvIGp1c3RpZnkgdGhlIGNob2ljZSBvZiB3aGF0IChvbiB4ODYg
YXQgbGVhc3Q9IHdlJ2QgY2FsbApjb20xIGluIHRoZSBwYXRjaCBkZXNjcmlwdGlvbi4gQWxzbyB0
aGlzIGNvdWxkIGJlIHRoZSBpbml0aWFsaXplcgpvZiB0aGUgdmFyaWFibGUuCgo+ICsgICAgbnMx
NjU1MF9pbml0X2NvbW1vbih1YXJ0KTsKPiArCj4gKyAgICB1YXJ0LT5iYXVkICAgICAgPSBCQVVE
X0FVVE87CgpUaGVyZSdzIGEgYmF1ZF9yYXRlIGZpZWxkIGluIHRoZSBzdHJ1Y3R1cmUuIElmIHRo
ZXJlJ3MgYSByZWFzb24KdG8gaWdub3JlIGl0LCBwbGVhc2UgYWRkIGEgY29tbWVudC4KClRoZXJl
J3MgYWxzbyBhbiBpbnRlcmZhY2VfdHlwZSBmaWVsZCAtIGNhbiB5b3UgcmVhbGx5IGlnbm9yZSBp
dD8KCj4gKyAgICB1YXJ0LT5kYXRhX2JpdHMgPSA4Owo+ICsgICAgdWFydC0+cGFyaXR5ICAgID0g
c3Bjci0+cGFyaXR5Owo+ICsgICAgdWFydC0+c3RvcF9iaXRzID0gc3Bjci0+c3RvcF9iaXRzOwoK
VGhlcmUncyBhbHNvIGEgZmxvd19jb250cm9sIGZpZWxkLCB3aGljaCBJIHRoaW5rIG5lZWRzIGNo
ZWNraW5nCnRoYXQgaXQgbWF0Y2hlcyBuczE2NTUwX3NldHVwX3ByZWlycSgpIGNvbW1lbnQ6Cgog
ICAgLyogTm8gZmxvdyBjdHJsOiBEVFIgYW5kIFJUUyBhcmUgYm90aCB3ZWRnZWQgaGlnaCB0byBr
ZWVwIHJlbW90ZSBoYXBweS4gKi8KClNpbWlsYXJseSBhbnkgb3RoZXIgZmllbGRzIHlvdSBkb24n
dCBldmFsdWF0ZSBhdCBhbGwgYW5kIHdoaWNoCmFyZW4ndCBleHBsYWluZWQgYnkgdGhlIHNwZWMg
YXMgcG9zc2libGUgdG8gYmUgaWdub3JlZCAoYW5kIHRoZQpzaXR1YXRpb24gbWF0Y2hpbmcgdGhl
IHVzZSBjYXNlLCBsaWtlIHlvdSBub3QgY2FyaW5nIGFib3V0IFBDSQphc3BlY3RzIGhlcmUpIG5l
ZWQgcmVhc29uaW5nIGFib3V0IGluIHRoZSBkZXNjcmlwdGlvbiBvciBhIGNvZGUKY29tbWVudC4K
Cj4gKyAgICB1YXJ0LT5pb19iYXNlID0gc3Bjci0+c2VyaWFsX3BvcnQuYWRkcmVzczsKClRoZSBm
aWVsZCAob3IgcGVyaGFwcyB0aGUgd2hvbGUgc3Bjci0+c2VyaWFsX3BvcnQpIGJlaW5nIHplcm8g
bG9va3MKdG8gaGF2ZSBzcGVjaWFsIG1lYW5pbmcuCgo+ICsgICAgdWFydC0+aW9fc2l6ZSA9IDg7
Cj4gKyAgICB1YXJ0LT5yZWdfc2hpZnQgPSBzcGNyLT5zZXJpYWxfcG9ydC5iaXRfb2Zmc2V0OwoK
c3Bjci0+c2VyaWFsX3BvcnQgaGFzIG90aGVyIGZpZWxkcyB3aGljaCBJIGRvbid0IHRoaW5rIHlv
dSBzaG91bGQKaWdub3JlLgoKPiArICAgIHVhcnQtPnJlZ193aWR0aCA9IDE7CgpQbGVhc2UgdXNl
IGNvbnNpc3RlbnQgcGxhY2VtZW50IG9mID0gOiBFaXRoZXIgYWxsIG9mIHRoZW0gYXJlCmFsaWdu
ZWQsIG9yIGFsbCBvZiB0aGVtIGFyZSBwcmVjZWRlZCBieSBhIHNpbmdsZSBzcGFjZSBvbmx5LgoK
PiArICAgIC8qIHRyaWdnZXIvcG9sYXJpdHkgaW5mb3JtYXRpb24gaXMgbm90IGF2YWlsYWJsZSBp
biBzcGNyICovCj4gKyAgICBpcnFfc2V0X3R5cGUoc3Bjci0+aW50ZXJydXB0LCBJUlFfVFlQRV9M
RVZFTF9ISUdIKTsKPiArICAgIHVhcnQtPmlycSA9IHNwY3ItPmludGVycnVwdDsKPiArCj4gKyAg
ICB1YXJ0LT52dWFydC5iYXNlX2FkZHIgPSB1YXJ0LT5pb19iYXNlOwo+ICsgICAgdWFydC0+dnVh
cnQuc2l6ZSA9IHVhcnQtPmlvX3NpemU7Cj4gKyAgICB1YXJ0LT52dWFydC5kYXRhX29mZiA9IFVB
UlRfVEhSIDw8IHVhcnQtPnJlZ19zaGlmdDsKPiArICAgIHVhcnQtPnZ1YXJ0LnN0YXR1c19vZmYg
PSBVQVJUX0xTUiA8PCB1YXJ0LT5yZWdfc2hpZnQ7Cj4gKyAgICB1YXJ0LT52dWFydC5zdGF0dXMg
PSBVQVJUX0xTUl9USFJFIHwgVUFSVF9MU1JfVEVNVDsKClN0eWxlLXdpc2UgdGhpcyBibG9jayBz
aG91bGQgdGhlbiBtYXRjaCB3aGF0ZXZlciB0aGUgb3RoZXIKYmxvY2sgYWJvdmUgbG9va3MuCgo+
ICsgICAgLyogIFJlZ2lzdGVyIHdpdGggZ2VuZXJpYyBzZXJpYWwgZHJpdmVyLiAqLwo+ICsgICAg
c2VyaWFsX3JlZ2lzdGVyX3VhcnQodWFydCAtIG5zMTY1NTBfY29tLCAmbnMxNjU1MF9kcml2ZXIs
IHVhcnQpOwo+ICsKPiArICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtBQ1BJX0RFVklDRV9TVEFS
VChhbnMxNjU1MCwgIk5TMTY1NTAgVUFSVCIsIERFVklDRV9TRVJJQUwpCj4gKyAgICAuY2xhc3Nf
dHlwZSA9IEFDUElfREJHMl8xNjU1MF9DT01QQVRJQkxFLAo+ICsgICAgLmluaXQgPSBuczE2NTUw
X2FjcGlfdWFydF9pbml0LAo+ICtBQ1BJX0RFVklDRV9FTkQKCkkgZG9uJ3QgZXhwZWN0IHRoaXMg
dG8gYnVpbGQgb24geDg2LgoKRmluYWxseSwgcGxlYXNlIGZvbGxvdyBwYXRjaCBzdWJtaXNzaW9u
IGd1aWRlbGluZXM6IFBhdGNoZXMgb3VnaHQgdG8KYmUgc2VudCBfdG9fIHRoZSBsaXN0IGFuZCBt
YWludGFpbmVycyBiZSBfY2NfLWVkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
