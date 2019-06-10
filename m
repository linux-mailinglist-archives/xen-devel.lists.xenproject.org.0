Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880D3AFAF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 09:30:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haEiH-0007me-Az; Mon, 10 Jun 2019 07:27:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RipH=UJ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1haEiF-0007mZ-TV
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 07:27:27 +0000
X-Inumbo-ID: 2ef41744-8b51-11e9-a084-c3bdb0258bcc
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ef41744-8b51-11e9-a084-c3bdb0258bcc;
 Mon, 10 Jun 2019 07:27:21 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 00:27:20 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2019 00:27:18 -0700
Date: Mon, 10 Jun 2019 15:31:32 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190610073132.GC10195@gao-cwp>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-6-git-send-email-chao.gao@intel.com>
 <5CF68E5E02000078002352C5@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF68E5E02000078002352C5@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v7 05/10] microcode: remove pointless 'cpu'
 parameter
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

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDk6Mjk6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMjcuMDUuMTkgYXQgMTA6MzEsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jCj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9taWNyb2NvZGVfYW1kLmMKPj4gQEAgLTc4LDggKzc4LDkgQEAgc3RydWN0IG1wYmhkciB7
Cj4+ICBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKG1pY3JvY29kZV91cGRhdGVfbG9jayk7Cj4+ICAK
Pj4gIC8qIFNlZSBjb21tZW50IGluIHN0YXJ0X3VwZGF0ZSgpIGZvciBjYXNlcyB3aGVuIHRoaXMg
cm91dGluZSBmYWlscyAqLwo+PiAtc3RhdGljIGludCBjb2xsZWN0X2NwdV9pbmZvKHVuc2lnbmVk
IGludCBjcHUsIHN0cnVjdCBjcHVfc2lnbmF0dXJlICpjc2lnKQo+PiArc3RhdGljIGludCBjb2xs
ZWN0X2NwdV9pbmZvKHN0cnVjdCBjcHVfc2lnbmF0dXJlICpjc2lnKQo+PiAgewo+PiArICAgIHVu
c2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+ICAgICAgc3RydWN0IGNwdWlu
Zm9feDg2ICpjID0gJmNwdV9kYXRhW2NwdV07Cj4KPkkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBj
bGVhciBpZiB5b3UgdXNlZCBjdXJyZW50X2NwdV9kYXRhIGhlcmUuCj5UaGUgb25seSBvdGhlciB1
c2Ugb2YgImNwdSIgaXMgaW4gYSBwcl9kZWJ1ZygpLCB3aGljaCBieSBkZWZhdWx0Cj5leHBhbmRz
IHRvIG5vdGhpbmcgYW55d2F5LCBhbmQgaGVuY2UgaXMgY2hlYXAgdG8gY2hhbmdlIHRvCj51c2Ug
c21wX3Byb2Nlc3Nvcl9pZCgpIGluc3RlYWQuCgpXaWxsIGRvLgoKPgo+PiBAQCAtNDM1LDE0ICs0
MjksMTQgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBmaW5hbF9sZXZlbHNbXSA9IHsKPj4g
ICAgICAweDAxMDAwMGFmCj4+ICB9Owo+PiAgCj4+IC1zdGF0aWMgYm9vbF90IGNoZWNrX2ZpbmFs
X3BhdGNoX2xldmVscyh1bnNpZ25lZCBpbnQgY3B1KQo+PiArc3RhdGljIGJvb2wgY2hlY2tfZmlu
YWxfcGF0Y2hfbGV2ZWxzKHZvaWQpCj4+ICB7Cj4+ICAgICAgLyoKPj4gICAgICAgKiBDaGVjayB0
aGUgY3VycmVudCBwYXRjaCBsZXZlbHMgb24gdGhlIGNwdS4gSWYgdGhleSBhcmUgZXF1YWwgdG8K
Pj4gICAgICAgKiBhbnkgb2YgdGhlICdmaW5hbF9sZXZlbHMnLCB0aGVuIHdlIHNob3VsZCBub3Qg
dXBkYXRlIHRoZSBtaWNyb2NvZGUKPj4gICAgICAgKiBwYXRjaCBvbiB0aGUgY3B1IGFzIHN5c3Rl
bSB3aWxsIGhhbmcgb3RoZXJ3aXNlLgo+PiAgICAgICAqLwo+PiAtICAgIGNvbnN0IHN0cnVjdCBj
cHVfc2lnbmF0dXJlICpzaWcgPSAmcGVyX2NwdShjcHVfc2lnLCBjcHUpOwo+PiArICAgIGNvbnN0
IHN0cnVjdCBjcHVfc2lnbmF0dXJlICpzaWcgPSAmdGhpc19jcHUoY3B1X3NpZyk7Cj4+ICAgICAg
dW5zaWduZWQgaW50IGk7Cj4KPkkgZG9uJ3Qgc2VlIGFueSBkZXBlbmRlbmN5IG9mIHRoaXMgZnVu
Y3Rpb24gdXBvbiBydW5uaW5nIG9uCj50aGUgc3ViamVjdCBDUFUuCgpPay4gSSB3aWxsIGRyb3Ag
dGhpcyBjaGFuZ2UuCgo+Cj4+IEBAIC0yNzksMTIgKzI3OCwxMyBAQCBzdGF0aWMgZW51bSBtaWNy
b2NvZGVfbWF0Y2hfcmVzdWx0IGNvbXBhcmVfcGF0Y2goCj4+ICAgKiByZXR1cm4gMSAtIGZvdW5k
IHVwZGF0ZQo+PiAgICogcmV0dXJuIDwgMCAtIGVycm9yCj4+ICAgKi8KPj4gLXN0YXRpYyBpbnQg
Z2V0X21hdGNoaW5nX21pY3JvY29kZShjb25zdCB2b2lkICptYywgdW5zaWduZWQgaW50IGNwdSkK
Pj4gK3N0YXRpYyBpbnQgZ2V0X21hdGNoaW5nX21pY3JvY29kZShjb25zdCB2b2lkICptYykKPj4g
IHsKPj4gICAgICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9pbnRlbCAqbWNfaGVhZGVy
ID0gbWM7Cj4+ICAgICAgdW5zaWduZWQgbG9uZyB0b3RhbF9zaXplID0gZ2V0X3RvdGFsc2l6ZSht
Y19oZWFkZXIpOwo+PiAgICAgIHZvaWQgKm5ld19tYyA9IHhtYWxsb2NfYnl0ZXModG90YWxfc2l6
ZSk7Cj4+ICAgICAgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbmV3X3BhdGNoID0geG1hbGxvYyhz
dHJ1Y3QgbWljcm9jb2RlX3BhdGNoKTsKPj4gKyAgICB1bnNpZ25lZCBpbnQgX19tYXliZV91bnVz
ZWQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+Cj5UaGUgX19tYXliZV91bnVzZWQgaXMgZm9y
IHRoZSBzb2xlIHVzZSBpbiBwcl9kZWJ1ZygpPyBQbGVhc2UKPmluc3RlYWQgdXNlIHNtcF9wcm9j
ZXNzb3JfaWQoKSB0aGVyZSwgaWYgc28uCgpXaWxsIGRvLgoKVGhhbmtzCkNoYW8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
