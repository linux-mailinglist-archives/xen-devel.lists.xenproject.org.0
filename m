Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A205811DC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 07:59:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huVwk-0002q7-8h; Mon, 05 Aug 2019 05:54:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ABr=WB=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1huVwi-0002q1-IM
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 05:54:12 +0000
X-Inumbo-ID: 70bf13c0-b745-11e9-ad8b-0bc2c40cbd6b
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70bf13c0-b745-11e9-ad8b-0bc2c40cbd6b;
 Mon, 05 Aug 2019 05:54:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Aug 2019 22:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,348,1559545200"; d="scan'208";a="178753494"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga006.jf.intel.com with ESMTP; 04 Aug 2019 22:54:03 -0700
Date: Mon, 5 Aug 2019 13:58:11 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190805055809.GA19492@gao-cwp>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-4-git-send-email-chao.gao@intel.com>
 <86eff704-cf77-ede0-7220-7cab59b65982@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86eff704-cf77-ede0-7220-7cab59b65982@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v8 03/16] microcode/intel: extend
 microcode_update_match()
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

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDE6Mjk6MTRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwMS4wOC4yMDE5IDEyOjIyLCBDaGFvIEdhbyB3cm90ZToKPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21pY3JvY29kZV9pbnRlbC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVf
aW50ZWwuYwo+PiBAQCAtMTM0LDE0ICsxMzQsMzUgQEAgc3RhdGljIGludCBjb2xsZWN0X2NwdV9p
bmZvKHVuc2lnbmVkIGludCBjcHVfbnVtLCBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqY3NpZykKPj4g
ICAgICAgcmV0dXJuIDA7Cj4+ICAgfQo+PiAgIAo+PiAtc3RhdGljIGlubGluZSBpbnQgbWljcm9j
b2RlX3VwZGF0ZV9tYXRjaCgKPj4gLSAgICB1bnNpZ25lZCBpbnQgY3B1X251bSwgY29uc3Qgc3Ry
dWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm1jX2hlYWRlciwKPj4gLSAgICBpbnQgc2lnLCBp
bnQgcGYpCj4+ICtzdGF0aWMgZW51bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0IG1pY3JvY29kZV91
cGRhdGVfbWF0Y2goCj4+ICsgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwg
Km1jX2hlYWRlciwgdW5zaWduZWQgaW50IHNpZywKPj4gKyAgICB1bnNpZ25lZCBpbnQgcGYsIHVu
c2lnbmVkIGludCByZXYpCj4+ICAgewo+PiAtICAgIHN0cnVjdCB1Y29kZV9jcHVfaW5mbyAqdWNp
ID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdV9udW0pOwo+PiAtCj4+IC0gICAgcmV0dXJu
IChzaWdtYXRjaChzaWcsIHVjaS0+Y3B1X3NpZy5zaWcsIHBmLCB1Y2ktPmNwdV9zaWcucGYpICYm
Cj4+IC0gICAgICAgICAgICAobWNfaGVhZGVyLT5yZXYgPiB1Y2ktPmNwdV9zaWcucmV2KSk7Cj4+
ICsgICAgY29uc3Qgc3RydWN0IGV4dGVuZGVkX3NpZ3RhYmxlICpleHRfaGVhZGVyOwo+PiArICAg
IGNvbnN0IHN0cnVjdCBleHRlbmRlZF9zaWduYXR1cmUgKmV4dF9zaWc7Cj4+ICsgICAgdW5zaWdu
ZWQgbG9uZyBkYXRhX3NpemUgPSBnZXRfZGF0YXNpemUobWNfaGVhZGVyKTsKPj4gKyAgICB1bnNp
Z25lZCBpbnQgaTsKPj4gKyAgICBjb25zdCB2b2lkICplbmQgPSAoY29uc3Qgdm9pZCAqKW1jX2hl
YWRlciArIGdldF90b3RhbHNpemUobWNfaGVhZGVyKTsKPj4gKwo+PiArICAgIGlmICggc2lnbWF0
Y2goc2lnLCBtY19oZWFkZXItPnNpZywgcGYsIG1jX2hlYWRlci0+cGYpICkKPj4gKyAgICAgICAg
cmV0dXJuIChtY19oZWFkZXItPnJldiA+IHJldikgPyBORVdfVUNPREUgOiBPTERfVUNPREU7Cj4K
PkJvdGggaGVyZSBhbmQgLi4uCj4KPj4gKyAgICBleHRfaGVhZGVyID0gKGNvbnN0IHZvaWQgKiko
bWNfaGVhZGVyICsgMSkgKyBkYXRhX3NpemU7Cj4+ICsgICAgZXh0X3NpZyA9IChjb25zdCB2b2lk
ICopKGV4dF9oZWFkZXIgKyAxKTsKPj4gKwo+PiArICAgIC8qCj4+ICsgICAgICogTWFrZSBzdXJl
IHRoZXJlIGlzIGVub3VnaCBzcGFjZSB0byBob2xkIGFuIGV4dGVuZGVkIGhlYWRlciBhbmQgZW5v
dWdoCj4+ICsgICAgICogYXJyYXkgZWxlbWVudHMuCj4+ICsgICAgICovCj4+ICsgICAgaWYgKCAo
ZW5kIDwgKGNvbnN0IHZvaWQgKilleHRfc2lnKSB8fAo+PiArICAgICAgICAgKGVuZCA8IChjb25z
dCB2b2lkICopKGV4dF9zaWcgKyBleHRfaGVhZGVyLT5jb3VudCkpICkKPj4gKyAgICAgICAgcmV0
dXJuIE1JU19VQ09ERTsKPj4gKwo+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgZXh0X2hlYWRlci0+
Y291bnQ7IGkrKyApCj4+ICsgICAgICAgIGlmICggc2lnbWF0Y2goc2lnLCBleHRfc2lnW2ldLnNp
ZywgcGYsIGV4dF9zaWdbaV0ucGYpICkKPj4gKyAgICAgICAgICAgIHJldHVybiAobWNfaGVhZGVy
LT5yZXYgPiByZXYpID8gTkVXX1VDT0RFIDogT0xEX1VDT0RFOwo+Cj4uLi4gaGVyZSB0aGVyZSdz
IGFnYWluIGFuIGFzc3VtcHRpb24gdGhhdCB0aGVyZSdzIHN0cmljdCBvcmRlcmluZwo+YmV0d2Vl
biBibG9icywgYnV0IGFzIG1lbnRpb25lZCBpbiByZXBseSB0byBhIGxhdGVyIHBhdGNoIG9mIGFu
Cj5lYXJsaWVyIHZlcnNpb24gdGhpcyBpc24ndCB0aGUgY2FzZS4gVGhlcmVmb3JlIHRoZSBmdW5j
dGlvbiBjYW4ndAo+YmUgdXNlZCB0byBjb21wYXJlIHR3byBhcmJpdHJhcnkgYmxvYnMsIGl0IG1h
eSBvbmx5IGJlIHVzZWQgdG8KPmNvbXBhcmUgYSBibG9iIHdpdGggd2hhdCBpcyBhbHJlYWR5IGxv
YWRlZCBpbnRvIGEgQ1BVLiBJIHRoaW5rIGl0Cj5pcyBxdWl0ZSBpbXBvcnRhbnQgdG8gbWVudGlv
biB0aGlzIHJlc3RyaWN0aW9uIGluIGEgY29tbWVudCBhaGVhZAo+b2YgdGhlIGZ1bmN0aW9uLgo+
Cj5UaGUgY29kZSBpdHNlbGYgbG9va3MgZmluZSB0byBtZSwgYW5kIGEgY29tbWVudCBjb3VsZCBw
ZXJoYXBzIGJlCj5hZGRlZCB3aGlsZSBjb21taXR0aW5nOyB3aXRoIHN1Y2ggYSBjb21tZW50CgpB
Z3JlZS4gQmVjYXVzZSB0aGVyZSB3aWxsIGJlIGEgdmVyc2lvbiA5LCBJIGNhbiBhZGQgYSBjb21t
ZW50LgoKPlJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpUaGFu
a3MuCkNoYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
