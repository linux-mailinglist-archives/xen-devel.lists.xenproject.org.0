Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C093AF6A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 09:18:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haEWI-0006vB-UO; Mon, 10 Jun 2019 07:15:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RipH=UJ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1haEWH-0006v6-Dv
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 07:15:05 +0000
X-Inumbo-ID: 7711dcd2-8b4f-11e9-8980-bc764e045a96
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7711dcd2-8b4f-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 07:15:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 00:15:02 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga002.jf.intel.com with ESMTP; 10 Jun 2019 00:15:00 -0700
Date: Mon, 10 Jun 2019 15:19:13 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190610071913.GB10195@gao-cwp>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-5-git-send-email-chao.gao@intel.com>
 <5CF68AAA02000078002352B1@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF68AAA02000078002352B1@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDk6MTM6NDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMjcuMDUuMTkgYXQgMTA6MzEsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+PiBXZSBjYW4gcmVtb3ZlIHRoZSBwZXItY3B1IGNhY2hlIGZpZWxkIGluIHN0cnVjdCB1Y29k
ZV9jcHVfaW5mbyBzaW5jZQo+PiBpdCBoYXMgYmVlbiByZXBsYWNlZCBieSBhIGdsb2JhbCBjYWNo
ZS4gSXQgd291bGQgbGVhZHMgdG8gb25seSBvbmUgZmllbGQKPj4gcmVtYWluaW5nIGluIHVjb2Rl
X2NwdV9pbmZvLiBUaGVuLCB0aGlzIHN0cnVjdCBpcyByZW1vdmVkIGFuZCB0aGUKPj4gcmVtYWlu
aW5nIGZpZWxkIChjcHUgc2lnbmF0dXJlKSBpcyBzdG9yZWQgaW4gcGVyLWNwdSBhcmVhLgo+PiAK
Pj4gQWxzbyByZW1vdmUgJ21pY3JvY29kZV9yZXN1bWVfbWF0Y2gnIGZyb20gbWljcm9jb2RlX29w
cyBiZWNhdXNlIHRoZQo+PiBjaGVjayBpcyBkb25lIGluIGZpbmRfcGF0Y2goKS4gVGhlIGNwdSBz
dGF0dXMgbm90aWZpZXIgaXMgYWxzbwo+PiByZW1vdmVkLiBJdCB3YXMgdXNlZCB0byBmcmVlIHRo
ZSAibWMiIGZpZWxkIHRvIGF2b2lkIG1lbW9yeSBsZWFrLgo+Cj5UaGVyZSdzIG5vIGZpbmRfcGF0
Y2goKSBmdW5jdGlvbiBhbnltb3JlIGFmYWljcy4gQW5kIEkgYWxzbyB0aGluayB0aGlzCj5zaG91
bGQgYmUgYSBzZXBhcmF0ZSBwYXRjaC4gVGhlIGFib3ZlIGlzbid0IGVub3VnaCBpbW8gdG8ganVz
dGlmeSAuLi4KPgo+PiAgaW50IG1pY3JvY29kZV9yZXN1bWVfY3B1KHVuc2lnbmVkIGludCBjcHUp
Cj4+ICB7Cj4+ICAgICAgaW50IGVycjsKPj4gLSAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVj
aSA9ICZwZXJfY3B1KHVjb2RlX2NwdV9pbmZvLCBjcHUpOwo+PiAtICAgIHN0cnVjdCBjcHVfc2ln
bmF0dXJlIG5zaWc7Cj4+IC0gICAgdW5zaWduZWQgaW50IGNwdTI7Cj4+ICsgICAgc3RydWN0IGNw
dV9zaWduYXR1cmUgKnNpZyA9ICZwZXJfY3B1KGNwdV9zaWcsIGNwdSk7Cj4+ICAKPj4gICAgICBp
ZiAoICFtaWNyb2NvZGVfb3BzICkKPj4gICAgICAgICAgcmV0dXJuIDA7Cj4+ICAKPj4gICAgICBz
cGluX2xvY2soJm1pY3JvY29kZV9tdXRleCk7Cj4+ICAKPj4gLSAgICBlcnIgPSBtaWNyb2NvZGVf
b3BzLT5jb2xsZWN0X2NwdV9pbmZvKGNwdSwgJnVjaS0+Y3B1X3NpZyk7Cj4+IC0gICAgaWYgKCBl
cnIgKQo+PiAtICAgIHsKPj4gLSAgICAgICAgX19taWNyb2NvZGVfZmluaV9jcHUoY3B1KTsKPj4g
LSAgICAgICAgc3Bpbl91bmxvY2soJm1pY3JvY29kZV9tdXRleCk7Cj4+IC0gICAgICAgIHJldHVy
biBlcnI7Cj4+IC0gICAgfQo+PiAtCj4+IC0gICAgaWYgKCB1Y2ktPm1jLm1jX3ZhbGlkICkKPj4g
LSAgICB7Cj4+IC0gICAgICAgIGVyciA9IG1pY3JvY29kZV9vcHMtPm1pY3JvY29kZV9yZXN1bWVf
bWF0Y2goY3B1LCB1Y2ktPm1jLm1jX3ZhbGlkKTsKPj4gLSAgICAgICAgaWYgKCBlcnIgPj0gMCAp
Cj4+IC0gICAgICAgIHsKPj4gLSAgICAgICAgICAgIGlmICggZXJyICkKPj4gLSAgICAgICAgICAg
ICAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5hcHBseV9taWNyb2NvZGUoY3B1KTsKPj4gLSAgICAg
ICAgICAgIHNwaW5fdW5sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOwo+PiAtICAgICAgICAgICAgcmV0
dXJuIGVycjsKPj4gLSAgICAgICAgfQo+PiAtICAgIH0KPj4gLQo+PiAtICAgIG5zaWcgPSB1Y2kt
PmNwdV9zaWc7Cj4+IC0gICAgX19taWNyb2NvZGVfZmluaV9jcHUoY3B1KTsKPj4gLSAgICB1Y2kt
PmNwdV9zaWcgPSBuc2lnOwo+PiAtCj4+IC0gICAgZXJyID0gLUVJTzsKPj4gLSAgICBmb3JfZWFj
aF9vbmxpbmVfY3B1ICggY3B1MiApCj4+IC0gICAgewo+PiAtICAgICAgICB1Y2kgPSAmcGVyX2Nw
dSh1Y29kZV9jcHVfaW5mbywgY3B1Mik7Cj4+IC0gICAgICAgIGlmICggdWNpLT5tYy5tY192YWxp
ZCAmJgo+PiAtICAgICAgICAgICAgIG1pY3JvY29kZV9vcHMtPm1pY3JvY29kZV9yZXN1bWVfbWF0
Y2goY3B1LCB1Y2ktPm1jLm1jX3ZhbGlkKSA+IDAgKQo+PiAtICAgICAgICB7Cj4+IC0gICAgICAg
ICAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5hcHBseV9taWNyb2NvZGUoY3B1KTsKPj4gLSAgICAg
ICAgICAgIGJyZWFrOwo+PiAtICAgICAgICB9Cj4+IC0gICAgfQo+Cj4uLi4gaW4gcGFydGljdWxh
ciB0aGUgcmVtb3ZhbCBvZiB0aGlzIGxvb3AsIHRoZSBtb3JlIHRoYXQgYm90aCB0aGUKPmxvb3Ag
YW5kIHRoZSBjb2RlIGFoZWFkIG9mIGl0IGFsc28gY2FsbCAtPmFwcGx5X21pY3JvY29kZSgpLgoK
T2suIFdpbGwgc3BsaXQgaXQgb3V0IGZyb20gdGhpcyBwYXRjaCBhbmQgcmVmaW5lIHRoZSBwYXRj
aCBkZXNjcmlwdGlvbi4KCkJhc2ljYWxseSwgdGhpcyBmdW5jdGlvbiB0cmllcyBiZXN0IHRvIGZp
bmQgYSBzdWl0YWJsZSBwYXRjaCBmcm9tIHRoZQpwZXItY3B1IGNhY2hlIGFuZCBsb2FkcyBpdC4g
Q3VycmVudGx5LCB0aGUgcGVyLWNwdSBjYWNoZSBpcyByZXBsYWNlZCBieQp0aGUgZ2xvYmFsIGNh
Y2hlLCBhbmQgLT5hcHBseV9taWNyb2NvZGUoKSBsb2FkcyB0aGUgZ2xvYmFsIGNhY2hlIHJhdGhl
cgp0aGVuIHRoZSBwZXItY3B1IGNhY2hlLiBIZW5jZSwgYSBzaW1wbGUgaW52b2NhdGlvbiBvZiAt
PmFwcGx5X21pY3JvY29kZSgpCmlzIGVub3VnaCB0byBhcHBseSB0aGUgZ2xvYmFsIGNhY2hlIGR1
cmluZyBDUFUgaG90cGx1ZyBvciByZXN1bWluZyBmcm9tCmhpYmVybmF0aW9uLgoKPgo+PiBAQCAt
MjgxLDcgKzI4MSw2IEBAIHN0YXRpYyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgY29tcGFy
ZV9wYXRjaCgKPj4gICAqLwo+PiAgc3RhdGljIGludCBnZXRfbWF0Y2hpbmdfbWljcm9jb2RlKGNv
bnN0IHZvaWQgKm1jLCB1bnNpZ25lZCBpbnQgY3B1KQo+PiAgewo+PiAtICAgIHN0cnVjdCB1Y29k
ZV9jcHVfaW5mbyAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdSk7Cj4KPk5vdGUg
aG93IHRoaXMgd2FzIHVzaW5nICJjcHUiLgo+Cj4+IEBAIC0zMDgsMTcgKzMwNyw3IEBAIHN0YXRp
YyBpbnQgZ2V0X21hdGNoaW5nX21pY3JvY29kZShjb25zdCB2b2lkICptYywgdW5zaWduZWQgaW50
IGNwdSkKPj4gIAo+PiAgICAgIHByX2RlYnVnKCJtaWNyb2NvZGU6IENQVSVkIGZvdW5kIGEgbWF0
Y2hpbmcgbWljcm9jb2RlIHVwZGF0ZSB3aXRoIgo+PiAgICAgICAgICAgICAgICIgdmVyc2lvbiAl
I3ggKGN1cnJlbnQ9JSN4KVxuIiwKPj4gLSAgICAgICAgICAgICBjcHUsIG1jX2hlYWRlci0+cmV2
LCB1Y2ktPmNwdV9zaWcucmV2KTsKPj4gLSAgICBuZXdfbWMgPSB4bWFsbG9jX2J5dGVzKHRvdGFs
X3NpemUpOwo+PiAtICAgIGlmICggbmV3X21jID09IE5VTEwgKQo+PiAtICAgIHsKPj4gLSAgICAg
ICAgcHJpbnRrKEtFUk5fRVJSICJtaWNyb2NvZGU6IGVycm9yISBDYW4gbm90IGFsbG9jYXRlIG1l
bW9yeVxuIik7Cj4+IC0gICAgICAgIHJldHVybiAtRU5PTUVNOwo+PiAtICAgIH0KPj4gLQo+PiAt
ICAgIG1lbWNweShuZXdfbWMsIG1jLCB0b3RhbF9zaXplKTsKPj4gLSAgICB4ZnJlZSh1Y2ktPm1j
Lm1jX2ludGVsKTsKPj4gLSAgICB1Y2ktPm1jLm1jX2ludGVsID0gbmV3X21jOwo+PiArICAgICAg
ICAgICAgIGNwdSwgbWNfaGVhZGVyLT5yZXYsIHRoaXNfY3B1KGNwdV9zaWcpLnJldik7Cj4KPldo
eSAidGhpc19jcHUoKSIgaGVyZT8KCkl0IHNob3VsZCBiZSBhIHBhcnQgb2YgbmV4dCBwYXRjaC4K
ClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
