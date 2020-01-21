Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C03143BE4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 12:17:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itrTP-0001wG-8R; Tue, 21 Jan 2020 11:13:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PT5E=3K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itrTN-0001w9-17
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 11:13:29 +0000
X-Inumbo-ID: 072c4840-3c3f-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 072c4840-3c3f-11ea-8e9a-bc764e2007e4;
 Tue, 21 Jan 2020 11:13:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 37874B485;
 Tue, 21 Jan 2020 11:13:18 +0000 (UTC)
To: Wei Xu <xuwei5@hisilicon.com>
References: <5E26738C.1060605@hisilicon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f067440e-7df6-b40e-ed98-6b14c5c5f53d@suse.com>
Date: Tue, 21 Jan 2020 12:13:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5E26738C.1060605@hisilicon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] ns16550: Add ACPI support for ARM only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAwNDo0NCwgV2VpIFh1IHdyb3RlOgo+IC0tLSBhL3hlbi9kcml2ZXJzL2No
YXIvbnMxNjU1MC5jCj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBAQCAtMTYy
MCw2ICsxNjIwLDY2IEBAIERUX0RFVklDRV9TVEFSVChuczE2NTUwLCAiTlMxNjU1MCBVQVJUIiwg
REVWSUNFX1NFUklBTCkKPiAgIERUX0RFVklDRV9FTkQKPiAgIAo+ICAgI2VuZGlmIC8qIEhBU19E
RVZJQ0VfVFJFRSAqLwo+ICsjaWYgZGVmaW5lZChDT05GSUdfQUNQSSkgJiYgZGVmaW5lZChDT05G
SUdfQVJNKQoKQmxhbmsgbGluZSBhYm92ZSBoZXJlIHBsZWFzZS4KCj4gKyNpbmNsdWRlIDx4ZW4v
YWNwaS5oPgo+ICsKPiArc3RhdGljIGludCBfX2luaXQgbnMxNjU1MF9hY3BpX3VhcnRfaW5pdChj
b25zdCB2b2lkICpkYXRhKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgYWNwaV90YWJsZV9zcGNyICpzcGNy
Owo+ICsgICAgYWNwaV9zdGF0dXMgc3RhdHVzOwo+ICsKPiArICAgIC8qIFNhbWUgYXMgdGhlIERU
IHBhcnQuCgpDb21tZW50IHN0eWxlIChhZ2FpbiBiZWxvdykuIEFsc28gdGhlcmUgc2hvdWxkbid0
IGJlIGEgYmxhbmsgbGluZQp1bnRpbCBhZnRlciBfYWxsXyBkZWNsYXJhdGlvbnMuCgo+ICsgICAg
ICogT25seSBzdXBwb3J0IG9uZSBVQVJUIG9uIEFSTSB3aGljaCBoYXBwZW4gdG8gYmUgbnMxNjU1
MF9jb21bMF0uCj4gKyAgICAgKi8KPiArICAgIHN0cnVjdCBuczE2NTUwICp1YXJ0ID0gJm5zMTY1
NTBfY29tWzBdOwo+ICsKPiArICAgIHN0YXR1cyA9IGFjcGlfZ2V0X3RhYmxlKEFDUElfU0lHX1NQ
Q1IsIDAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAoc3RydWN0IGFjcGlfdGFibGVf
aGVhZGVyICoqKSZzcGNyKTsKClBsZWFzZSBhdm9pZCBjYXN0cyBsaWtlIHRoaXMuIFVzZSBtb3Jl
IHR5cGUtc2FmZSBjb25zdHJ1Y3RzIGxpa2UKY29udGFpbmVyX29mKCkgaW5zdGVhZC4KCj4gKyAg
ICBpZiAoIEFDUElfRkFJTFVSRShzdGF0dXMpICkKPiArICAgIHsKPiArICAgICAgICBwcmludGso
Im5zMTY1NTA6IEZhaWxlZCB0byBnZXQgU1BDUiB0YWJsZVxuIik7CgpJcyBzdWNoIGEgbWVzc2Fn
ZSB3YXJyYW50ZWQ/IEkuZS4gd291bGRuJ3QgaXQgdHJpZ2dlciBvbiBhbGwKc3lzdGVtcyBub3Qg
aGF2aW5nIHRoZSB0YWJsZSwgd2hpY2ggaXMgaGFyZGx5IHdoYXQgeW91L3dlIHdhbnQ/Cgo+ICsg
ICAgICAgIHJldHVybiAtRUlOVkFMOwoKQWxzbywgaXMgaXQgcmVhbGx5IGFuIGVycm9yIGlmIHRo
ZXJlJ3Mgbm8gc3VjaCB0YWJsZT8KCj4gKyAgICB9Cj4gKwo+ICsgICAgbnMxNjU1MF9pbml0X2Nv
bW1vbih1YXJ0KTsKPiArCj4gKyAgICAvKiBUaGUgYmF1ZCByYXRlIGlzIHByZS1jb25maWd1cmVk
IGJ5IHRoZSBmaXJtd2FyZS4KPiArICAgICAqIEFuZCBjdXJyZW50bHkgdGhlIEFDUEkgcGFydCBp
cyBvbmx5IHRhcmdldGluZyBBUk0gc28gc29tZSBmaWVsZHMKPiArICAgICAqIGxpa2UgUENJLCBm
bG93IGNvbnRyb2wgYW5kIHNvIG9uIHdlIGRvIG5vdCBjYXJlIHlldCBhcmUgaWdub3JlZC4KPiAr
ICAgICAqLwoKSSdtIG5vIGNvbnZpbmNlZCB0aG91Z2ggeW91IGNhbiBpZ25vcmUgc29tZSBvdGhl
ciBmaWVsZHMuIEluCnBhcnRpY3VsYXIgb24gdjEgSSByZWNhbGwgcG9pbnRpbmcgb3V0IHRoYXQg
dGhlIEdBUyBzdHJ1Y3R1cmUKaGFzIG1vcmUgZmllbGRzIHlvdSBzaG91bGQgbG9vayBhdC4gKE92
ZXJhbGwgSSdtIG5vdCBoYXBweQp3aXRoICJhbmQgc28gb24iIGhlcmUgLSBwbGVhc2UgbGlzdCBh
bGwgZmllbGRzIHlvdSBtZWFuIHRvCmlnbm9yZSBzbyB0aGF0IHJldmlld2VycyBhcyB3ZWxsIGFz
IGZ1dHVyZSByZWFkZXJzIGNhbiBqdWRnZQp3aGV0aGVyIHRoaXMgaXMgYXBwcm9wcmlhdGUuKQoK
PiArICAgIHVhcnQtPmJhdWQgPSBCQVVEX0FVVE87Cj4gKyAgICB1YXJ0LT5kYXRhX2JpdHMgPSA4
Owo+ICsgICAgdWFydC0+cGFyaXR5ID0gc3Bjci0+cGFyaXR5Owo+ICsgICAgdWFydC0+c3RvcF9i
aXRzID0gc3Bjci0+c3RvcF9iaXRzOwo+ICsgICAgdWFydC0+aW9fYmFzZSA9IHNwY3ItPnNlcmlh
bF9wb3J0LmFkZHJlc3M7Cj4gKyAgICB1YXJ0LT5pb19zaXplID0gODsKPiArICAgIHVhcnQtPnJl
Z19zaGlmdCA9IHNwY3ItPnNlcmlhbF9wb3J0LmJpdF9vZmZzZXQ7Cj4gKyAgICB1YXJ0LT5yZWdf
d2lkdGggPSAxOwo+ICsKPiArICAgIC8qIFRoZSB0cmlnZ2VyL3BvbGFyaXR5IGluZm9ybWF0aW9u
IGlzIG5vdCBhdmFpbGFibGUgaW4gc3Bjci4gKi8KPiArICAgIGlycV9zZXRfdHlwZShzcGNyLT5p
bnRlcnJ1cHQsIElSUV9UWVBFX0xFVkVMX0hJR0gpOwo+ICsgICAgdWFydC0+aXJxID0gc3Bjci0+
aW50ZXJydXB0Owo+ICsKPiArICAgIHVhcnQtPnZ1YXJ0LmJhc2VfYWRkciA9IHVhcnQtPmlvX2Jh
c2U7Cj4gKyAgICB1YXJ0LT52dWFydC5zaXplID0gdWFydC0+aW9fc2l6ZTsKPiArICAgIHVhcnQt
PnZ1YXJ0LmRhdGFfb2ZmID0gVUFSVF9USFIgPDwgdWFydC0+cmVnX3NoaWZ0Owo+ICsgICAgdWFy
dC0+dnVhcnQuc3RhdHVzX29mZiA9IFVBUlRfTFNSIDw8IHVhcnQtPnJlZ19zaGlmdDsKPiArICAg
IHVhcnQtPnZ1YXJ0LnN0YXR1cyA9IFVBUlRfTFNSX1RIUkUgfCBVQVJUX0xTUl9URU1UOwo+ICsK
PiArICAgIC8qICBSZWdpc3RlciB3aXRoIGdlbmVyaWMgc2VyaWFsIGRyaXZlci4gKi8KClN0cmF5
IGRvdWJsZSBibGFua3MgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgY29tbWVudC4KCj4gKyAgICBz
ZXJpYWxfcmVnaXN0ZXJfdWFydCh1YXJ0IC0gbnMxNjU1MF9jb20sICZuczE2NTUwX2RyaXZlciwg
dWFydCk7CgpJIGd1ZXNzIGl0J3MgZmluZSB0aGlzIHdheSwgYnV0IHdpdGggInVhcnQgPSAmbnMx
NjU1MF9jb21bMF0iIGFib3ZlCnRoZSBjb25zdHJ1Y3QgbG9va3MgbW9yZSBjb21wbGljYXRlZCB0
aGFuIGl0IG5lZWRzIHRvIGxvb2suCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
