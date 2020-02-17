Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44816145D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 15:16:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3h9y-00005O-Ff; Mon, 17 Feb 2020 14:14:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j3h9x-00005J-E7
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 14:14:05 +0000
X-Inumbo-ID: c0185000-518f-11ea-bff9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0185000-518f-11ea-bff9-12813bfff9fa;
 Mon, 17 Feb 2020 14:14:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 15371B32F;
 Mon, 17 Feb 2020 14:14:02 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200130130649.14538-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e20d6574-0e76-acf8-8b33-fb5a4fce7908@suse.com>
Date: Mon, 17 Feb 2020 15:14:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130130649.14538-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxNDowNywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQEAg
LTQ4MTQsNiArNDgxNSwzMCBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPiAgICAgICAgICBi
cmVhazsKPiAgICAgIH0KPiAgCj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfdmlzaWJpbGl0
eToKPiArICAgIHsKPiArICAgICAgICB1aW50MTZfdCBhbHRwMm1faWR4ID0gYS51LnNldF92aXNp
YmlsaXR5LmFsdHAybV9pZHg7Cj4gKwo+ICsgICAgICAgIGlmICggYS51LnNldF92aXNpYmlsaXR5
LnBhZCB8fCBhLnUuc2V0X3Zpc2liaWxpdHkucGFkMiApCj4gKyAgICAgICAgICAgIHJjID0gLUVJ
TlZBTDsKPiArICAgICAgICBlbHNlCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBpZiAoICFh
bHRwMm1fYWN0aXZlKGQpIHx8ICFoYXBfZW5hYmxlZChkKSApCgpEb2Vzbid0IGFsdHAybV9hY3Rp
dmUoKSBpbXBseSBoYXBfZW5hYmxlZCgpPyBBdCB0aGUgdmVyeSBsZWFzdAp0aGVyZSdzIG5vIG90
aGVyIHVzZSBvZiBoYXBfZW5hYmxlZCgpIGluIGRvX2FsdHAybV9vcCgpLgoKPiArICAgICAgICAg
ICAgewo+ICsgICAgICAgICAgICAgICAgcmMgPSAtRU9QTk9UU1VQUDsKPiArICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICBpZiAoIGEudS5z
ZXRfdmlzaWJpbGl0eS52aXNpYmxlICkKPiArICAgICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJt
X3dvcmtpbmdfZXB0cFthbHRwMm1faWR4XSA9Cj4gKyAgICAgICAgICAgICAgICBkLT5hcmNoLmFs
dHAybV9lcHRwW2FsdHAybV9pZHhdOwo+ICsgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAg
ICAgICBkLT5hcmNoLmFsdHAybV93b3JraW5nX2VwdHBbYWx0cDJtX2lkeF0gPQo+ICsgICAgICAg
ICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pOwo+ICsgICAgICAgIH0KPiArICAgICAgICBicmVh
azsKCkFsc28gdGhlIGNvZGUgaGVyZSBsZW5kcyBpdHNlbGYgdG8gcmVkdWN0aW9uIG9mIGluZGVu
dGF0aW9uCmRlcHRoOgoKICAgIGNhc2UgSFZNT1BfYWx0cDJtX3NldF92aXNpYmlsaXR5OgogICAg
ewogICAgICAgIHVpbnQxNl90IGFsdHAybV9pZHggPSBhLnUuc2V0X3Zpc2liaWxpdHkuYWx0cDJt
X2lkeDsKCiAgICAgICAgaWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkucGFkIHx8IGEudS5zZXRfdmlz
aWJpbGl0eS5wYWQyICkKICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwogICAgICAgIGVsc2UgaWYg
KCAhYWx0cDJtX2FjdGl2ZShkKSB8fCAhaGFwX2VuYWJsZWQoZCkgKQogICAgICAgICAgICAgICAg
cmMgPSAtRU9QTk9UU1VQUDsKICAgICAgICBlbHNlIGlmICggYS51LnNldF92aXNpYmlsaXR5LnZp
c2libGUgKQogICAgICAgICAgICBkLT5hcmNoLmFsdHAybV93b3JraW5nX2VwdHBbYWx0cDJtX2lk
eF0gPQogICAgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthbHRwMm1faWR4XTsKICAg
ICAgICBlbHNlCiAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX3dvcmtpbmdfZXB0cFthbHRwMm1f
aWR4XSA9CiAgICAgICAgICAgICAgICBtZm5feChJTlZBTElEX01GTik7CgogICAgICAgIGJyZWFr
OwogICAgfQoKCkFsc28gbm90ZSB0aGUgYWx0ZXJlZCBpbmRlbnRhdGlvbiBvZiB0aGUgYXNzaWdu
bWVudHMuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMKPiArKysgYi94ZW4vYXJj
aC94ODYvbW0vaGFwL2hhcC5jCj4gQEAgLTQ4OCw4ICs0ODgsMTcgQEAgaW50IGhhcF9lbmFibGUo
c3RydWN0IGRvbWFpbiAqZCwgdTMyIG1vZGUpCj4gICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICAg
ICAgICAgIH0KPiAgCj4gKyAgICAgICAgaWYgKCAoZC0+YXJjaC5hbHRwMm1fd29ya2luZ19lcHRw
ID0gYWxsb2NfeGVuaGVhcF9wYWdlKCkpID09IE5VTEwgKQo+ICsgICAgICAgIHsKPiArICAgICAg
ICAgICAgcnYgPSAtRU5PTUVNOwo+ICsgICAgICAgICAgICBnb3RvIG91dDsKPiArICAgICAgICB9
CgpJc24ndCB0aGVyZSBhIHByZS1leGlzdGluZyBlcnJvciBoYW5kbGluZyBpc3N1ZSBoZXJlIHdo
aWNoIHlvdQp3aWRlbiwgaW4gdGhhdCBsYXRlciBlbmNvdW50ZXJlZCBlcnJvcnMgZG9uJ3QgY2F1
c2UgY2xlYW4gdXAKb2Ygd2hhdCBoYWQgYWxyZWFkeSBzdWNjZWVkZWQgYmVmb3JlPwoKPiBAQCAt
MjY1MSw2ICsyNjUyLDggQEAgaW50IHAybV9kZXN0cm95X2FsdHAybV9ieV9pZChzdHJ1Y3QgZG9t
YWluICpkLCB1bnNpZ25lZCBpbnQgaWR4KQo+ICAgICAgICAgICAgICBwMm1fcmVzZXRfYWx0cDJt
KGQsIGlkeCwgQUxUUDJNX0RFQUNUSVZBVEUpOwo+ICAgICAgICAgICAgICBkLT5hcmNoLmFsdHAy
bV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhpZHgsIE1BWF9FUFRQKV0gPQo+ICAgICAgICAgICAg
ICBtZm5feChJTlZBTElEX01GTik7Cj4gKyAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX3dvcmtp
bmdfZXB0cFthcnJheV9pbmRleF9ub3NwZWMoaWR4LCBNQVhfRVBUUCldID0KPiArICAgICAgICAg
ICAgbWZuX3goSU5WQUxJRF9NRk4pOwoKTGlrZSBhYm92ZSwgYW5kIGlycmVzcGVjdGl2ZSBvZiB5
b3UgY2xvbmluZyBleGlzdGluZyBjb2RlIC0KaW5kZW50YXRpb24gb2YgdGhlIDJuZCBsaW5lIGlz
IHdyb25nIGhlcmUuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgKPiAr
KysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oCj4gQEAgLTMxNyw2ICszMTcsMTMg
QEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX2dldF92Y3B1X3AybV9pZHggewo+ICAgICAgdWludDE2
X3QgYWx0cDJtX2lkeDsKPiAgfTsKPiAgCj4gK3N0cnVjdCB4ZW5faHZtX2FsdHAybV9zZXRfdmlz
aWJpbGl0eSB7Cj4gKyAgICB1aW50MTZfdCBhbHRwMm1faWR4Owo+ICsgICAgdWludDhfdCB2aXNp
YmxlOwo+ICsgICAgdWludDhfdCBwYWQ7Cj4gKyAgICB1aW50MzJfdCBwYWQyOwo+ICt9OwoKV2hh
dCBpcyBwYWQyIGdvb2QvaW50ZW5kZWQgZm9yPyAzMi1iaXQgcGFkZGluZyBmaWVsZHMgaW4gc29t
ZQpvdGhlciBzdHJ1Y3R1cmVzIGFyZSBuZWVkZWQgYmVjYXVzZSBvbmUgb3IgbW9yZSB1aW50NjRf
dApmaWVsZHMgZm9sbG93LCBidXQgdGhpcyBpc24ndCB0aGUgY2FzZSBoZXJlLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
