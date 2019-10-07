Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F867CE1D2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 14:35:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHSBX-000273-PI; Mon, 07 Oct 2019 12:32:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHSBW-00026x-6G
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 12:32:18 +0000
X-Inumbo-ID: 7f3c7e52-e8fe-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f3c7e52-e8fe-11e9-80e3-bc764e2007e4;
 Mon, 07 Oct 2019 12:32:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3A25B18A;
 Mon,  7 Oct 2019 12:32:15 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-9-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7c14836-feab-15e2-7bf7-0bd7f661544d@suse.com>
Date: Mon, 7 Oct 2019 14:32:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930133238.49868-9-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 08/10] vpci: register as an internal
 ioreq server
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxNTozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1
aWxkLmMKPiBAQCAtMjksNiArMjksNyBAQAo+ICAKPiAgI2luY2x1ZGUgPGFzbS9iemltYWdlLmg+
Cj4gICNpbmNsdWRlIDxhc20vZG9tMF9idWlsZC5oPgo+ICsjaW5jbHVkZSA8YXNtL2h2bS9pb3Jl
cS5oPgo+ICAjaW5jbHVkZSA8YXNtL2h2bS9zdXBwb3J0Lmg+Cj4gICNpbmNsdWRlIDxhc20vaW9f
YXBpYy5oPgo+ICAjaW5jbHVkZSA8YXNtL3AybS5oPgoKVGhpcyBpcyB0aGUgb25seSBjaGFuZ2Ug
dG8gdGhpcyBmaWxlLCBhbmQgdGhlcmUncyBubyBhZGRpdGlvbiB0bwphc20vaHZtL2lvcmVxLmgg
LSBob3cgY29tZSB0aGlzICNpbmNsdWRlIGlzIG5lZWRlZD8KCj4gLS0tIGEveGVuL2RyaXZlcnMv
dnBjaS92cGNpLmMKPiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwo+IEBAIC0yMCw2ICsy
MCw4IEBACj4gICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KPiAgI2luY2x1ZGUgPHhlbi92cGNpLmg+
Cj4gIAo+ICsjaW5jbHVkZSA8YXNtL2h2bS9pb3JlcS5oPgoKVGhpcyBvZiBjb3Vyc2UgbWVhbnMg
YSBzdGVwIGF3YXkgZnJvbSB0aGUgY29kZSBoZXJlIGJlaW5nIGdlbmVyaWMKZW5vdWdoIHN1Y2gg
dGhhdCBBcm0gY291bGQgZXZlbnR1YWxseSB1c2UgaXQuIEluZGVwZW5kZW50IG9mIHRoaXMKYXNw
ZWN0IHBlcmhhcHMgdGhlICNpbmNsdWRlIHdvdWxkIGJldHRlciBtb3ZlIC4uLgoKPiBAQCAtNDc4
LDYgKzQ4MCw2MSBAQCB2b2lkIHZwY2lfd3JpdGUocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBp
bnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwKPiAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNp
LT5sb2NrKTsKPiAgfQo+ICAKPiArI2lmZGVmIF9fWEVOX18KCi4uLiBoZXJlPwoKPiArc3RhdGlj
IGludCBpb3JlcV9oYW5kbGVyKGlvcmVxX3QgKnJlcSwgdm9pZCAqZGF0YSkKPiArewo+ICsgICAg
cGNpX3NiZGZfdCBzYmRmOwo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBOQjogY2VydGFpbiByZXF1
ZXN0cyBvZiB0eXBlIGRpZmZlcmVudCB0aGFuIFBDSSBhcmUgYnJvYWRjYXN0ZWQgdG8gYWxsCj4g
KyAgICAgKiByZWdpc3RlcmVkIGlvcmVxIHNlcnZlcnMsIGlnbm9yZWQgdGhvc2UuCj4gKyAgICAg
Ki8KPiArICAgIGlmICggcmVxLT50eXBlICE9IElPUkVRX1RZUEVfUENJX0NPTkZJRyB8fCByZXEt
PmRhdGFfaXNfcHRyICkKPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7CgpJ
IHVuZGVyc3RhbmQgdGhlIGxlZnQgc2lkZSBvZiB0aGUgfHwgLCBidXQgd2h5IHRoZSByaWdodCBz
aWRlPyBUaGVyZQpzaG91bGRuJ3QgYmUgYW55IElPUkVRX1RZUEVfUENJX0NPTkZJRyByZXF1ZXN0
cyB3aXRoIGRhdGFfaXNfcHRyIHNldCwKc2hvdWxkIHRoZXJlPyBJIGFsc28gZGlkbid0IHRoaW5r
IHJlcXVlc3RzIHdpdGggZGF0YV9pc19wdHIgc2V0IHdvdWxkCmdldCBicm9hZGNhc3Q/Cgo+ICtp
bnQgdnBjaV9yZWdpc3Rlcl9pb3JlcShzdHJ1Y3QgZG9tYWluICpkKQo+ICt7Cj4gKyAgICBpb3Nl
cnZpZF90IGlkOwo+ICsgICAgaW50IHJjOwo+ICsKPiArICAgIGlmICggIWhhc192cGNpKGQpICkK
PiArICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICByYyA9IGh2bV9jcmVhdGVfaW9yZXFfc2Vy
dmVyKGQsIEhWTV9JT1JFUVNSVl9CVUZJT1JFUV9PRkYsICZpZCwgdHJ1ZSk7Cj4gKyAgICBpZiAo
IHJjICkKPiArICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgcmMgPSBodm1fc2V0X2lvcmVx
X2hhbmRsZXIoZCwgaWQsIGlvcmVxX2hhbmRsZXIsIE5VTEwpOwo+ICsgICAgaWYgKCByYyApCj4g
KyAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiArICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQp
ICkKPiArICAgIHsKPiArICAgICAgICAvKiBIYW5kbGUgYWxsIGRldmljZXMgaW4gdnBjaS4gKi8K
PiArICAgICAgICByYyA9IGh2bV9tYXBfaW9fcmFuZ2VfdG9faW9yZXFfc2VydmVyKGQsIGlkLCBY
RU5fRE1PUF9JT19SQU5HRV9QQ0ksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAwLCB+KHVpbnQ2NF90KTApOwo+ICsgICAgICAgIGlmICggcmMgKQo+ICsg
ICAgICAgICAgICByZXR1cm4gcmM7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmMgPSBodm1fc2V0X2lv
cmVxX3NlcnZlcl9zdGF0ZShkLCBpZCwgdHJ1ZSk7Cj4gKyAgICBpZiAoIHJjICkKPiArICAgICAg
ICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgcmV0dXJuIHJjOwoKVGhpcyBsYXN0IHNlcXVlbmNlIG9m
IHN0YXRlbWVudHMgbG9va3MgYSBsaXR0bGUgb2RkIC0gaXMgdGhpcyBpbgphbnRpY2lwYXRpb24g
b2YgZnVydGhlciBhZGRpdGlvbnMgdG8gdGhlIGZ1bmN0aW9uPwoKRnVydGhlcm1vcmUgdGhlIG9u
bHkgY2FsbGVyIGV4cGVjdHMgdGhlIGZ1bmN0aW9uIHRvIGNsZWFuIHVwIGFmdGVyCml0c2VsZiAo
aS5lLiBwYXJ0aWFsbHkgY29tcGxldGVkIHNldHVwIGJlIHVuZG9uZSksIHdoaWNoIGRvZXNuJ3QK
bG9vayB0byBiZSB0aGUgY2FzZSBoZXJlLiBJIGNhbid0IHNlZW0gdG8gYmUgYWJsZSB0byBjb252
aW5jZQpteXNlbGYgdGhhdCBhbGwgb2YgdGhpcyBnZXRzIGNsZWFuZWQgdXAuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
