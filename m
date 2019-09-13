Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1975B1890
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 09:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8fWP-00042r-Jl; Fri, 13 Sep 2019 06:57:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=59Ls=XI=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i8fWN-00042m-CY
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 06:57:31 +0000
X-Inumbo-ID: bf3b9470-d5f3-11e9-978d-bc764e2007e4
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf3b9470-d5f3-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 06:57:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 23:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,500,1559545200"; d="scan'208";a="210270645"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2019 23:57:24 -0700
Date: Fri, 13 Sep 2019 15:01:28 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190913070128.GB14305@gao-cwp>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-13-git-send-email-chao.gao@intel.com>
 <bce83dad-22f8-7fa1-9801-80a0fce8fd60@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bce83dad-22f8-7fa1-9801-80a0fce8fd60@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v10 12/16] x86/microcode: Synchronize late
 microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDU6MzI6MjJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAxMi4wOS4yMDE5IDA5OjIyLCBDaGFvIEdhbyB3cm90ZToKPj4gQEAgLTI2NCwzOCAr
MzM2LDE1OCBAQCBzdGF0aWMgaW50IG1pY3JvY29kZV91cGRhdGVfY3B1KGNvbnN0IHN0cnVjdCBt
aWNyb2NvZGVfcGF0Y2ggKnBhdGNoKQo+PiAgICAgIHJldHVybiBlcnI7Cj4+ICB9Cj4+ICAKPj4g
LXN0YXRpYyBsb25nIGRvX21pY3JvY29kZV91cGRhdGUodm9pZCAqcGF0Y2gpCj4+ICtzdGF0aWMg
Ym9vbCB3YWl0X2Zvcl9zdGF0ZSh1bnNpZ25lZCBpbnQgc3RhdGUpCj4+ICt7Cj4+ICsgICAgd2hp
bGUgKCBsb2FkaW5nX3N0YXRlICE9IHN0YXRlICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIGlmICgg
c3RhdGUgIT0gTE9BRElOR19FWElUICYmIGxvYWRpbmdfc3RhdGUgPT0gTE9BRElOR19FWElUICkK
Pj4gKyAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPgo+VGhpcyBpcyBhdCBsZWFzdCBzb21ld2hh
dCBjb25mdXNpbmc6IFRoZXJlJ3Mgbm8gaW5kaWNhdGlvbiBoZXJlCj50aGF0ICJsb2FkaW5nX3N0
YXRlIiBtYXkgY2hhbmdlIGJlaGluZCB0aGUgZnVuY3Rpb24ncyBiYWNrLiBTbwo+aW4gZ2VuZXJh
bCBvbmUgY291bGQgYmUgKGFuZCBJIGluaXRpYWxseSB3YXMpIHRlbXB0ZWQgdG8gc3VnZ2VzdAo+
ZHJvcHBpbmcgdGhlIGFwcGFyZW50bHkgcmVkdW5kYW50IGxlZnQgc2lkZSBvZiB0aGUgJiYuIEJ1
dCB0aGF0Cj53b3VsZCBlbmQgdXAgd3JvbmcgaWYgdGhlIGNvbXBpbGVyIHRyYW5zbGF0ZXMgdGhl
IGFib3ZlIHRvIHR3bwo+c2VwYXJhdGUgcmVhZHMgb2YgImxvYWRpbmdfc3RhdGUiLiBUaGVyZWZv
cmUgSSdkIGxpa2UgdG8gc3VnZ2VzdAo+Cj5zdGF0aWMgYm9vbCB3YWl0X2Zvcl9zdGF0ZSh0eXBl
b2YobG9hZGluZ19zdGF0ZSkgc3RhdGUpCj57Cj4gICAgdHlwZW9mKGxvYWRpbmdfc3RhdGUpIGN1
cl9zdGF0ZTsKPgo+ICAgIHdoaWxlICggKGN1cl9zdGF0ZSA9IEFDQ0VTU19PTkNFKGxvYWRpbmdf
c3RhdGUpKSAhPSBzdGF0ZSApCj4gICAgewo+ICAgICAgICBpZiAoIGN1cl9zdGF0ZSA9PSBMT0FE
SU5HX0VYSVQgKQo+ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgICBjcHVfcmVsYXgo
KTsKPiAgICB9Cj4KPiAgICByZXR1cm4gdHJ1ZTsKPn0KPgo+b3Igc29tZXRoaW5nIHN1YnN0YW50
aWFsbHkgc2ltaWxhciAoaWYsIGUuZy4sIHlvdSBkaXNsaWtlIHRoZQo+dXNlIG9mIHR5cGVvZigp
IGhlcmUpLgoKVGhlIGNvZGUgc25pcHBldCBhYm92ZSBpcyB0ZXJyaWZpYy4gV2lsbCB0YWtlIGl0
LgoKPgo+PiArc3RhdGljIGludCBzZWNvbmRhcnlfdGhyZWFkX2ZuKHZvaWQpCj4+ICt7Cj4+ICsg
ICAgdW5zaWduZWQgaW50IHByaW1hcnkgPSBjcHVtYXNrX2ZpcnN0KHRoaXNfY3B1KGNwdV9zaWJs
aW5nX21hc2spKTsKPj4gKwo+PiArICAgIGlmICggIXdhaXRfZm9yX3N0YXRlKExPQURJTkdfQ0FM
TElOKSApCj4+ICsgICAgICAgIHJldHVybiAtRUJVU1k7Cj4+ICsKPj4gKyAgICBjcHVtYXNrX3Nl
dF9jcHUoc21wX3Byb2Nlc3Nvcl9pZCgpLCAmY3B1X2NhbGxpbl9tYXApOwo+PiArCj4+ICsgICAg
aWYgKCAhd2FpdF9mb3Jfc3RhdGUoTE9BRElOR19FWElUKSApCj4+ICsgICAgICAgIHJldHVybiAt
RUJVU1k7Cj4KPlRoaXMgcmV0dXJuIGxvb2tzIHRvIGJlIHVucmVhY2hhYmxlLCBkb2Vzbid0IGl0
PwoKWWVzLiBJIHdpbGwgdXNlIGEgdmFyaWFibGUgdG8gaG9sZCBpdHMgcmV0dXJuIHZhbHVlIGFu
ZCBhc3NlcnQgdGhlCnJldHVybiB2YWx1ZSBpcyBhbHdheXMgdHJ1ZS4KCk90aGVyIGNvbW1lbnRz
IGFyZSByZWFzb25hYmxlIGFuZCBJIHdpbGwgZm9sbG93IHlvdXIgc3VnZ2VzdGlvbi4KClRoYW5r
cwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
