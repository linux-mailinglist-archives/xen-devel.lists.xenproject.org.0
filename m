Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4FB49F7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 11:00:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA9Ig-00062g-KM; Tue, 17 Sep 2019 08:57:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yLhv=XM=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iA9If-00062b-Sb
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 08:57:29 +0000
X-Inumbo-ID: 2c505400-d929-11e9-9604-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c505400-d929-11e9-9604-12813bfff9fa;
 Tue, 17 Sep 2019 08:57:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 01:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,515,1559545200"; d="scan'208";a="386481839"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga005.fm.intel.com with ESMTP; 17 Sep 2019 01:57:25 -0700
Date: Tue, 17 Sep 2019 17:01:28 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190917090128.GB10190@gao-cwp>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-16-git-send-email-chao.gao@intel.com>
 <f5d22eed-42c0-5d99-7adc-a46ac52a9639@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5d22eed-42c0-5d99-7adc-a46ac52a9639@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v10 15/16] microcode: disable late loading
 if CPUs are affected by BDF90
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6MjI6NTlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAxMi4wOS4yMDE5IDA5OjIyLCBDaGFvIEdhbyB3cm90ZToKPj4gQEAgLTI4Myw2ICsy
ODQsMjcgQEAgc3RhdGljIGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCBjb21wYXJlX3BhdGNo
KAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDogT0xEX1VDT0RFOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgYm9vbCBpc19ibGFj
a2xpc3RlZCh2b2lkKQo+PiArewo+PiArICAgIHN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZjdXJy
ZW50X2NwdV9kYXRhOwo+PiArICAgIHVpbnQ2NF90IGxsY19zaXplID0gYy0+eDg2X2NhY2hlX3Np
emUgKiAxMDI0VUxMOwo+PiArICAgIHN0cnVjdCBjcHVfc2lnbmF0dXJlICpzaWcgPSAmdGhpc19j
cHUoY3B1X3NpZyk7Cj4+ICsKPj4gKyAgICBkb19kaXYobGxjX3NpemUsIGMtPng4Nl9tYXhfY29y
ZXMpOwo+PiArCj4+ICsgICAgLyoKPj4gKyAgICAgKiBMYXRlIGxvYWRpbmcgb24gbW9kZWwgNzkg
d2l0aCBtaWNyb2NvZGUgcmV2aXNpb24gbGVzcyB0aGFuIDB4MGIwMDAwMjEKPj4gKyAgICAgKiBh
bmQgTExDIHNpemUgcGVyIGNvcmUgYmlnZ2VyIHRoYW4gMi41TUIgbWF5IHJlc3VsdCBpbiBhIHN5
c3RlbSBoYW5nLgo+PiArICAgICAqIFRoaXMgYmVoYXZpb3IgaXMgZG9jdW1lbnRlZCBpbiBpdGVt
IEJERjkwLCAjMzM0MTY1IChJbnRlbCBYZW9uCj4+ICsgICAgICogUHJvY2Vzc29yIEU3LTg4MDAv
NDgwMCB2NCBQcm9kdWN0IEZhbWlseSkuCj4+ICsgICAgICovCj4+ICsgICAgaWYgKCBjLT54ODYg
PT0gNiAmJiBjLT54ODZfbW9kZWwgPT0gMHg0RiAmJiBjLT54ODZfbWFzayA9PSAweDEgJiYKPj4g
KyAgICAgICAgIGxsY19zaXplID4gMjYyMTQ0MCAmJiBzaWctPnJldiA8IDB4MGIwMDAwMjEgKQo+
PiArICAgICAgICByZXR1cm4gdHJ1ZTsKPj4gKwo+PiArICAgIHJldHVybiBmYWxzZTsKPj4gK30K
Pgo+SXNuJ3QgdGhpcyBtaXNiZWhhdmlvciB3b3JrZWQgYXJvdW5kIGJ5IHRoZSB3YmludmQoKSB5
b3UgYWRkIGluIHRoZSBuZXh0Cj5wYXRjaD8KCkhpIEphbiBhbmQgQW5kcmV3LAoKUGVyaGFwcyBJ
IG1pc3VuZGVyc3Rvb2Qgd2hhdCBJIHdhcyB0b2xkLiBJIGFtIGNvbmZpcm1pbmcgd2l0aCBBc2hv
awp3aGV0aGVyIHRoaXMgcGF0Y2ggaXMgbmVjZXNzYXJ5LgoKPgo+PiAtLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L21pY3JvY29kZS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9j
b2RlLmgKPj4gQEAgLTMwLDYgKzMwLDcgQEAgc3RydWN0IG1pY3JvY29kZV9vcHMgewo+PiAgICAg
IGJvb2wgKCptYXRjaF9jcHUpKGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKTsK
Pj4gICAgICBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgKCpjb21wYXJlX3BhdGNoKSgKPj4g
ICAgICAgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbmV3LCBjb25zdCBzdHJ1Y3Qg
bWljcm9jb2RlX3BhdGNoICpvbGQpOwo+PiArICAgIGJvb2wgKCppc19ibGFja2xpc3RlZCkodm9p
ZCk7Cj4KPldoeSBhIGhvb2sgcmF0aGVyIHRoYW4gYSBib29sZWFuIGZsYWcsIHdoaWNoIGNvdWxk
IGJlIHNldCBieQo+bWljcm9jb2RlX3VwZGF0ZV9vbmUoKSAoYXMgaW52b2tlZCBkdXJpbmcgQVAg
YnJpbmd1cCk/CgpIb3cgYWJvdXQgc2V0IHRoZSBib29sZWFuIGZsYWcgaW4gSW50ZWxfZXJyYXRh
X3dvcmthcm91bmRzPwoKT25lIGxpbWl0YXRpb24gb2Ygc2V0dGluZyB0aGUgZmxhZyBpbiBtaWNy
b2NvZGVfdXBkYXRlX29uZSgpIGlzOgpCU1AgYWxzbyBjYWxscyBtaWNyb2NvZGVfdXBkYXRlX29u
ZSgpLiBCdXQgY2FsY3VsYXRpbmcgTExDIHNpemUgcGVyCmNvcmUgb24gQlNQIHdvdWxkIG1lZXQg
dGhlIHNhbWUgaXNzdWUgYXMgdGhlIGZvbGxvd2luZyBwYXRjaAooaS5lLiBwYXRjaCAxNi8xNik6
IEJTUCdzIGN1cnJlbnRfY3B1X2RhdGEgaXNuJ3QgaW5pdGlhbGl6ZWQKcHJvcGVybHkuIFdlIG1p
Z2h0IG5lZWQgdG8gcmV2ZXJ0IGNvbW1pdCBmOTc4MzhiYmQ5ODBhMDEgaW4Kc29tZSB3YXkgYW5k
IHJlZW51bWVyYXRlIGZlYXR1cmVzIGFmdGVyIHVjb2RlIGxvYWRpbmcgaXMgZG9uZS4KClRoYW5r
cwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
