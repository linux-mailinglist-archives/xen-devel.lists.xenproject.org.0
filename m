Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E150812B7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 09:06:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huWza-0007aB-Bx; Mon, 05 Aug 2019 07:01:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ABr=WB=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1huWzY-0007a6-ON
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 07:01:12 +0000
X-Inumbo-ID: cd8aa1dd-b74e-11e9-8980-bc764e045a96
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cd8aa1dd-b74e-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 07:01:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 00:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="373614849"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga006.fm.intel.com with ESMTP; 05 Aug 2019 00:01:07 -0700
Date: Mon, 5 Aug 2019 15:05:15 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190805070515.GC19492@gao-cwp>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-11-git-send-email-chao.gao@intel.com>
 <eca23e12-aa79-69bb-9659-fb3a69c65272@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eca23e12-aa79-69bb-9659-fb3a69c65272@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v8 10/16] microcode/amd: call
 svm_host_osvw_init() in common code
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDM6MjE6NTVQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwMS4wOC4yMDE5IDEyOjIyLCBDaGFvIEdhbyB3cm90ZToKPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21pY3JvY29kZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+PiBA
QCAtMjc3LDYgKzI3Nyw5IEBAIHN0YXRpYyBsb25nIGRvX21pY3JvY29kZV91cGRhdGUodm9pZCAq
X2luZm8pCj4+ICAgICAgIGlmICggZXJyb3IgKQo+PiAgICAgICAgICAgaW5mby0+ZXJyb3IgPSBl
cnJvcjsKPj4gICAKPj4gKyAgICBpZiAoIG1pY3JvY29kZV9vcHMtPmVuZF91cGRhdGUgKQo+PiAr
ICAgICAgICBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRlKCk7Cj4+ICsKPj4gICAgICAgaW5mby0+
Y3B1ID0gY3B1bWFza19uZXh0KGluZm8tPmNwdSwgJmNwdV9vbmxpbmVfbWFwKTsKPj4gICAgICAg
aWYgKCBpbmZvLT5jcHUgPCBucl9jcHVfaWRzICkKPj4gICAgICAgICAgIHJldHVybiBjb250aW51
ZV9oeXBlcmNhbGxfb25fY3B1KGluZm8tPmNwdSwgZG9fbWljcm9jb2RlX3VwZGF0ZSwgaW5mbyk7
Cj4KPlRoaXMgYmVpbmcgdGhlIG9ubHkgY2hhbmdlIGluIHRoaXMgZmlsZSAtIGRvbid0IHlvdSBh
bHNvIG5lZWQgdG8KPmFsdGVyIHRoZSBlYXJseSB1Y29kZSBsb2FkaW5nIHBhdGg/CgpZZXMuIEkg
c2hvdWxkIGhhdmUuCgo+Cj4+IEBAIC02MzEsMTEgKzYyMiwxOSBAQCBzdGF0aWMgaW50IHN0YXJ0
X3VwZGF0ZSh2b2lkKQo+PiAgICAgICByZXR1cm4gMDsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMg
dm9pZCBlbmRfdXBkYXRlKHZvaWQpCj4+ICt7Cj4+ICsjaWYgQ09ORklHX0hWTQo+PiArICAgIHN2
bV9ob3N0X29zdndfaW5pdCgpOwo+PiArI2VuZGlmCj4+ICt9Cj4KPkluc3RlYWQgb2YgbGVhdmlu
ZyBhbiBlbXB0eSBmdW5jdGlvbiBpbiB0aGUgIUhWTSBjYXNlLCAuLi4KPgo+PiAgIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbWljcm9jb2RlX29wcyBtaWNyb2NvZGVfYW1kX29wcyA9IHsKPj4gICAgICAg
LmNwdV9yZXF1ZXN0X21pY3JvY29kZSAgICAgICAgICAgID0gY3B1X3JlcXVlc3RfbWljcm9jb2Rl
LAo+PiAgICAgICAuY29sbGVjdF9jcHVfaW5mbyAgICAgICAgICAgICAgICAgPSBjb2xsZWN0X2Nw
dV9pbmZvLAo+PiAgICAgICAuYXBwbHlfbWljcm9jb2RlICAgICAgICAgICAgICAgICAgPSBhcHBs
eV9taWNyb2NvZGUsCj4+ICAgICAgIC5zdGFydF91cGRhdGUgICAgICAgICAgICAgICAgICAgICA9
IHN0YXJ0X3VwZGF0ZSwKPj4gKyAgICAuZW5kX3VwZGF0ZSAgICAgICAgICAgICAgICAgICAgICAg
PSBlbmRfdXBkYXRlLAo+Cj4uLi4gY291bGQgeW91IHBsZWFzZSBsZWF2ZSB0aGlzIHBvaW50ZXIg
dW5pbml0aWFsaXplZCAoaS5lLgo+TlVMTCkgaW4gdGhhdCBjYXNlPwoKV2lsbCBkby4KClRoYW5r
cwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
