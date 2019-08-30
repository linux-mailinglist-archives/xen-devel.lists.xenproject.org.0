Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8792AA2D4E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 05:29:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3XYM-0006nX-2v; Fri, 30 Aug 2019 03:26:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D47i=W2=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i3XYK-0006nS-HK
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 03:26:20 +0000
X-Inumbo-ID: ecd1b58c-cad5-11e9-b95f-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecd1b58c-cad5-11e9-b95f-bc764e2007e4;
 Fri, 30 Aug 2019 03:26:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 20:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; d="scan'208";a="188748153"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2019 20:26:13 -0700
Date: Fri, 30 Aug 2019 11:30:18 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190830033018.GB31905@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-14-git-send-email-chao.gao@intel.com>
 <2441e448-5fe1-bdbc-f0b6-720401fd0bf0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2441e448-5fe1-bdbc-f0b6-720401fd0bf0@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v9 13/15] x86/microcode: Synchronize late
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
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDI6MDY6MzlQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAxOS4wOC4yMDE5IDAzOjI1LCBDaGFvIEdhbyB3cm90ZToKPj4gKwo+PiArc3RhdGlj
IGludCBtYXN0ZXJfdGhyZWFkX2ZuKGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNo
KQo+PiArewo+PiArICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+
ICsgICAgaW50IHJldCA9IDA7Cj4+ICsKPj4gKyAgICB3aGlsZSAoIGxvYWRpbmdfc3RhdGUgIT0g
TE9BRElOR19DQUxMSU4gKQo+PiArICAgICAgICBjcHVfcmVsYXgoKTsKPj4gKwo+PiArICAgIGNw
dW1hc2tfc2V0X2NwdShjcHUsICZjcHVfY2FsbGluX21hcCk7Cj4+ICsKPj4gKyAgICB3aGlsZSAo
IGxvYWRpbmdfc3RhdGUgIT0gTE9BRElOR19FTlRFUiApCj4+ICsgICAgICAgIGNwdV9yZWxheCgp
Owo+PiArCj4+ICsgICAgLyoKPj4gKyAgICAgKiBJZiBhbiBlcnJvciBoYXBwZW5lZCwgY29udHJv
bCB0aHJlYWQgd291bGQgc2V0ICdsb2FkaW5nX3N0YXRlJwo+PiArICAgICAqIHRvIExPQURJTkdf
RVhJVC4gRG9uJ3QgcGVyZm9ybSB1Y29kZSBsb2FkaW5nIGZvciB0aGlzIGNhc2UKPj4gKyAgICAg
Ki8KPj4gKyAgICBpZiAoIGxvYWRpbmdfc3RhdGUgPT0gTE9BRElOR19FWElUICkKPj4gKyAgICAg
ICAgcmV0dXJuIHJldDsKPgo+RXZlbiBpZiB0aGUgcHJvZHVjZXIgdHJhbnNpdGlvbnMgdGhpcyB0
aHJvdWdoIEVOVEVSIHRvIEVYSVQsIHRoZQo+b2JzZXJ2ZXIgaGVyZSBtYXkgbmV2ZXIgZ2V0IHRv
IHNlZSB0aGUgRU5URVIgc3RhdGUsIGFuZCBoZW5jZQo+bmV2ZXIgZXhpdCB0aGUgbG9vcCBhYm92
ZS4gWW91IHdhbnQgZWl0aGVyIDwgRU5URVIgb3IgPT0gQ0FMTElOLgoKWWVzLiBJIGZpbmQgc3Rv
cG1hY2hpbmVfYWN0aW9uKCkgaXMgYSBnb29kIGV4YW1wbGUgdG8gaW1wbGVtZW50CmEgc3RhdGUg
bWFjaGluZS4gSSB3aWxsIGZvbGxvdyBpdC4KCj4KPj4gKyAgICByZXQgPSBtaWNyb2NvZGVfb3Bz
LT5hcHBseV9taWNyb2NvZGUocGF0Y2gpOwo+PiArICAgIGlmICggIXJldCApCj4+ICsgICAgICAg
IGF0b21pY19pbmMoJmNwdV91cGRhdGVkKTsKPj4gKyAgICBhdG9taWNfaW5jKCZjcHVfb3V0KTsK
Pj4gKwo+PiArICAgIHdoaWxlICggbG9hZGluZ19zdGF0ZSAhPSBMT0FESU5HX0VYSVQgKQo+PiAr
ICAgICAgICBjcHVfcmVsYXgoKTsKPj4gKwo+PiArICAgIHJldHVybiByZXQ7Cj4+ICt9Cj4KPkFz
IGEgY29zbWV0aWMgcmVtYXJrLCBJIGRvbid0IHRoaW5rICJtYXN0ZXIiIGFuZCAic2xhdmUiIGFy
ZQo+c3VpdGFibGUgdGVybXMgaGVyZS4gInByaW1hcnkiIGFuZCAic2Vjb25kYXJ5IiB3b3VsZCBp
bW8gY29tZQo+Y2xvc2VyIHRvIHdoYXQgdGhlIHRocmVhZHMnIHJlbGF0aW9uc2hpcCBpcy4KCldp
bGwgZG8uCgo+PiArCj4+ICsgICAgLyoKPj4gKyAgICAgKiBXZSBpbnRlbmQgdG8gZGlzYWJsZSBp
bnRlcnJ1cHQgZm9yIGxvbmcgdGltZSwgd2hpY2ggbWF5IGxlYWQgdG8KPj4gKyAgICAgKiB3YXRj
aGRvZyB0aW1lb3V0Lgo+PiArICAgICAqLwo+PiArICAgIHdhdGNoZG9nX2Rpc2FibGUoKTsKPj4g
KyAgICAvKgo+PiArICAgICAqIExhdGUgbG9hZGluZyBkYW5jZS4gV2h5IHRoZSBoZWF2eS1oYW5k
ZWQgc3RvcF9tYWNoaW5lIGVmZm9ydD8KPj4gKyAgICAgKgo+PiArICAgICAqIC0gSFQgc2libGlu
Z3MgbXVzdCBiZSBpZGxlIGFuZCBub3QgZXhlY3V0ZSBvdGhlciBjb2RlIHdoaWxlIHRoZSBvdGhl
cgo+PiArICAgICAqICAgc2libGluZyBpcyBsb2FkaW5nIG1pY3JvY29kZSBpbiBvcmRlciB0byBh
dm9pZCBhbnkgbmVnYXRpdmUKPj4gKyAgICAgKiAgIGludGVyYWN0aW9ucyBjYXVzZSBieSB0aGUg
bG9hZGluZy4KPj4gKyAgICAgKgo+PiArICAgICAqIC0gSW4gYWRkaXRpb24sIG1pY3JvY29kZSB1
cGRhdGUgb24gdGhlIGNvcmVzIG11c3QgYmUgc2VyaWFsaXplZCB1bnRpbAo+PiArICAgICAqICAg
dGhpcyByZXF1aXJlbWVudCBjYW4gYmUgcmVsYXhlZCBpbiB0aGUgZnV0dXJlLiBSaWdodCBub3cs
IHRoaXMgaXMKPj4gKyAgICAgKiAgIGNvbnNlcnZhdGl2ZSBhbmQgZ29vZC4KPj4gKyAgICAgKi8K
Pj4gKyAgICByZXQgPSBzdG9wX21hY2hpbmVfcnVuKGRvX21pY3JvY29kZV91cGRhdGUsIHBhdGNo
LCBOUl9DUFVTKTsKPj4gKyAgICB3YXRjaGRvZ19lbmFibGUoKTsKPgo+Q29uc2lkZXJpbmcgdGhh
dCBzdG9wX21hY2hpbmVfcnVuKCkgZG9lc24ndCBpdHNlbGYgZGlzYWJsZSB0aGUgd2F0Y2hkb2cs
Cj5kaWQgeW91IGNvbnNpZGVyIGhhdmluZyB0aGUgY29udHJvbCB0aHJlYWQgZGlzYWJsZS9lbmFi
bGUgdGhlIHdhdGNoZG9nLAo+dGh1cyBzaG9ydGVuaW5nIHRoZSBwZXJpb2Qgd2hlcmUgaXQncyBu
b3QgYWN0aXZlPwoKR29vZCBpZGVhLiBJdCBoZWxwcyB0byBrZWVwIHRoZSBjb2RlIGhlcmUgY2xl
YW4uIEkgdGhpbmsgbWF5YmUKbWljcm9jb2RlX25taV9jYWxsYmFjayBjYW4gYmUgcmVnaXN0ZXJl
ZCBieSBjb250cm9sIHRocmVhZCBhcyB3ZWxsLgoKVGhhbmtzCkNoYW8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
