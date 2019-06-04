Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62E34BF4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 17:18:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYB8K-0001vn-Mc; Tue, 04 Jun 2019 15:13:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYB8I-0001vi-Nm
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 15:13:50 +0000
X-Inumbo-ID: 5afb60f3-86db-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5afb60f3-86db-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 15:13:49 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 09:13:48 -0600
Message-Id: <5CF68AAA02000078002352B1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 09:13:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-5-git-send-email-chao.gao@intel.com>
In-Reply-To: <1558945891-3015-5-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 04/10] microcode: remove struct
 ucode_cpu_info
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDEwOjMxLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBX
ZSBjYW4gcmVtb3ZlIHRoZSBwZXItY3B1IGNhY2hlIGZpZWxkIGluIHN0cnVjdCB1Y29kZV9jcHVf
aW5mbyBzaW5jZQo+IGl0IGhhcyBiZWVuIHJlcGxhY2VkIGJ5IGEgZ2xvYmFsIGNhY2hlLiBJdCB3
b3VsZCBsZWFkcyB0byBvbmx5IG9uZSBmaWVsZAo+IHJlbWFpbmluZyBpbiB1Y29kZV9jcHVfaW5m
by4gVGhlbiwgdGhpcyBzdHJ1Y3QgaXMgcmVtb3ZlZCBhbmQgdGhlCj4gcmVtYWluaW5nIGZpZWxk
IChjcHUgc2lnbmF0dXJlKSBpcyBzdG9yZWQgaW4gcGVyLWNwdSBhcmVhLgo+IAo+IEFsc28gcmVt
b3ZlICdtaWNyb2NvZGVfcmVzdW1lX21hdGNoJyBmcm9tIG1pY3JvY29kZV9vcHMgYmVjYXVzZSB0
aGUKPiBjaGVjayBpcyBkb25lIGluIGZpbmRfcGF0Y2goKS4gVGhlIGNwdSBzdGF0dXMgbm90aWZp
ZXIgaXMgYWxzbwo+IHJlbW92ZWQuIEl0IHdhcyB1c2VkIHRvIGZyZWUgdGhlICJtYyIgZmllbGQg
dG8gYXZvaWQgbWVtb3J5IGxlYWsuCgpUaGVyZSdzIG5vIGZpbmRfcGF0Y2goKSBmdW5jdGlvbiBh
bnltb3JlIGFmYWljcy4gQW5kIEkgYWxzbyB0aGluayB0aGlzCnNob3VsZCBiZSBhIHNlcGFyYXRl
IHBhdGNoLiBUaGUgYWJvdmUgaXNuJ3QgZW5vdWdoIGltbyB0byBqdXN0aWZ5IC4uLgoKPiAgaW50
IG1pY3JvY29kZV9yZXN1bWVfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gIHsKPiAgICAgIGludCBl
cnI7Cj4gLSAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJfY3B1KHVjb2RlX2Nw
dV9pbmZvLCBjcHUpOwo+IC0gICAgc3RydWN0IGNwdV9zaWduYXR1cmUgbnNpZzsKPiAtICAgIHVu
c2lnbmVkIGludCBjcHUyOwo+ICsgICAgc3RydWN0IGNwdV9zaWduYXR1cmUgKnNpZyA9ICZwZXJf
Y3B1KGNwdV9zaWcsIGNwdSk7Cj4gIAo+ICAgICAgaWYgKCAhbWljcm9jb2RlX29wcyApCj4gICAg
ICAgICAgcmV0dXJuIDA7Cj4gIAo+ICAgICAgc3Bpbl9sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOwo+
ICAKPiAtICAgIGVyciA9IG1pY3JvY29kZV9vcHMtPmNvbGxlY3RfY3B1X2luZm8oY3B1LCAmdWNp
LT5jcHVfc2lnKTsKPiAtICAgIGlmICggZXJyICkKPiAtICAgIHsKPiAtICAgICAgICBfX21pY3Jv
Y29kZV9maW5pX2NwdShjcHUpOwo+IC0gICAgICAgIHNwaW5fdW5sb2NrKCZtaWNyb2NvZGVfbXV0
ZXgpOwo+IC0gICAgICAgIHJldHVybiBlcnI7Cj4gLSAgICB9Cj4gLQo+IC0gICAgaWYgKCB1Y2kt
Pm1jLm1jX3ZhbGlkICkKPiAtICAgIHsKPiAtICAgICAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5t
aWNyb2NvZGVfcmVzdW1lX21hdGNoKGNwdSwgdWNpLT5tYy5tY192YWxpZCk7Cj4gLSAgICAgICAg
aWYgKCBlcnIgPj0gMCApCj4gLSAgICAgICAgewo+IC0gICAgICAgICAgICBpZiAoIGVyciApCj4g
LSAgICAgICAgICAgICAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5hcHBseV9taWNyb2NvZGUoY3B1
KTsKPiAtICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1pY3JvY29kZV9tdXRleCk7Cj4gLSAgICAg
ICAgICAgIHJldHVybiBlcnI7Cj4gLSAgICAgICAgfQo+IC0gICAgfQo+IC0KPiAtICAgIG5zaWcg
PSB1Y2ktPmNwdV9zaWc7Cj4gLSAgICBfX21pY3JvY29kZV9maW5pX2NwdShjcHUpOwo+IC0gICAg
dWNpLT5jcHVfc2lnID0gbnNpZzsKPiAtCj4gLSAgICBlcnIgPSAtRUlPOwo+IC0gICAgZm9yX2Vh
Y2hfb25saW5lX2NwdSAoIGNwdTIgKQo+IC0gICAgewo+IC0gICAgICAgIHVjaSA9ICZwZXJfY3B1
KHVjb2RlX2NwdV9pbmZvLCBjcHUyKTsKPiAtICAgICAgICBpZiAoIHVjaS0+bWMubWNfdmFsaWQg
JiYKPiAtICAgICAgICAgICAgIG1pY3JvY29kZV9vcHMtPm1pY3JvY29kZV9yZXN1bWVfbWF0Y2go
Y3B1LCB1Y2ktPm1jLm1jX3ZhbGlkKSA+IDAgKQo+IC0gICAgICAgIHsKPiAtICAgICAgICAgICAg
ZXJyID0gbWljcm9jb2RlX29wcy0+YXBwbHlfbWljcm9jb2RlKGNwdSk7Cj4gLSAgICAgICAgICAg
IGJyZWFrOwo+IC0gICAgICAgIH0KPiAtICAgIH0KCi4uLiBpbiBwYXJ0aWN1bGFyIHRoZSByZW1v
dmFsIG9mIHRoaXMgbG9vcCwgdGhlIG1vcmUgdGhhdCBib3RoIHRoZQpsb29wIGFuZCB0aGUgY29k
ZSBhaGVhZCBvZiBpdCBhbHNvIGNhbGwgLT5hcHBseV9taWNyb2NvZGUoKS4KCj4gQEAgLTI4MSw3
ICsyODEsNiBAQCBzdGF0aWMgZW51bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0IGNvbXBhcmVfcGF0
Y2goCj4gICAqLwo+ICBzdGF0aWMgaW50IGdldF9tYXRjaGluZ19taWNyb2NvZGUoY29uc3Qgdm9p
ZCAqbWMsIHVuc2lnbmVkIGludCBjcHUpCj4gIHsKPiAtICAgIHN0cnVjdCB1Y29kZV9jcHVfaW5m
byAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdSk7CgpOb3RlIGhvdyB0aGlzIHdh
cyB1c2luZyAiY3B1Ii4KCj4gQEAgLTMwOCwxNyArMzA3LDcgQEAgc3RhdGljIGludCBnZXRfbWF0
Y2hpbmdfbWljcm9jb2RlKGNvbnN0IHZvaWQgKm1jLCB1bnNpZ25lZCBpbnQgY3B1KQo+ICAKPiAg
ICAgIHByX2RlYnVnKCJtaWNyb2NvZGU6IENQVSVkIGZvdW5kIGEgbWF0Y2hpbmcgbWljcm9jb2Rl
IHVwZGF0ZSB3aXRoIgo+ICAgICAgICAgICAgICAgIiB2ZXJzaW9uICUjeCAoY3VycmVudD0lI3gp
XG4iLAo+IC0gICAgICAgICAgICAgY3B1LCBtY19oZWFkZXItPnJldiwgdWNpLT5jcHVfc2lnLnJl
dik7Cj4gLSAgICBuZXdfbWMgPSB4bWFsbG9jX2J5dGVzKHRvdGFsX3NpemUpOwo+IC0gICAgaWYg
KCBuZXdfbWMgPT0gTlVMTCApCj4gLSAgICB7Cj4gLSAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJt
aWNyb2NvZGU6IGVycm9yISBDYW4gbm90IGFsbG9jYXRlIG1lbW9yeVxuIik7Cj4gLSAgICAgICAg
cmV0dXJuIC1FTk9NRU07Cj4gLSAgICB9Cj4gLQo+IC0gICAgbWVtY3B5KG5ld19tYywgbWMsIHRv
dGFsX3NpemUpOwo+IC0gICAgeGZyZWUodWNpLT5tYy5tY19pbnRlbCk7Cj4gLSAgICB1Y2ktPm1j
Lm1jX2ludGVsID0gbmV3X21jOwo+ICsgICAgICAgICAgICAgY3B1LCBtY19oZWFkZXItPnJldiwg
dGhpc19jcHUoY3B1X3NpZykucmV2KTsKCldoeSAidGhpc19jcHUoKSIgaGVyZT8KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
