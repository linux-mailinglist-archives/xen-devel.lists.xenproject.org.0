Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF38186C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 13:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubS9-00048f-H9; Mon, 05 Aug 2019 11:47:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ABr=WB=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hubS8-00048a-3T
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 11:47:00 +0000
X-Inumbo-ID: bac71469-b776-11e9-8980-bc764e045a96
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bac71469-b776-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 11:46:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 04:46:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="175568882"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga007.fm.intel.com with ESMTP; 05 Aug 2019 04:46:56 -0700
Date: Mon, 5 Aug 2019 19:51:04 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190805115102.GA1685@gao-cwp>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-4-git-send-email-chao.gao@intel.com>
 <86eff704-cf77-ede0-7220-7cab59b65982@suse.com>
 <20190805055809.GA19492@gao-cwp>
 <a79836ad-5a20-8a66-3dfd-c35adae1ebd3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a79836ad-5a20-8a66-3dfd-c35adae1ebd3@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDk6Mjc6NThBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwNS4wOC4yMDE5IDA3OjU4LCBDaGFvIEdhbyB3cm90ZToKPj4gT24gRnJpLCBBdWcg
MDIsIDIwMTkgYXQgMDE6Mjk6MTRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAw
MS4wOC4yMDE5IDEyOjIyLCBDaGFvIEdhbyB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYv
bWljcm9jb2RlX2ludGVsLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVs
LmMKPj4+PiBAQCAtMTM0LDE0ICsxMzQsMzUgQEAgc3RhdGljIGludCBjb2xsZWN0X2NwdV9pbmZv
KHVuc2lnbmVkIGludCBjcHVfbnVtLCBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqY3NpZykKPj4+PiAg
ICAgICAgcmV0dXJuIDA7Cj4+Pj4gICAgfQo+Pj4+ICAgIAo+Pj4+IC1zdGF0aWMgaW5saW5lIGlu
dCBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKAo+Pj4+IC0gICAgdW5zaWduZWQgaW50IGNwdV9udW0s
IGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIsCj4+Pj4gLSAg
ICBpbnQgc2lnLCBpbnQgcGYpCj4+Pj4gK3N0YXRpYyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1
bHQgbWljcm9jb2RlX3VwZGF0ZV9tYXRjaCgKPj4+PiArICAgIGNvbnN0IHN0cnVjdCBtaWNyb2Nv
ZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIsIHVuc2lnbmVkIGludCBzaWcsCj4+Pj4gKyAgICB1
bnNpZ25lZCBpbnQgcGYsIHVuc2lnbmVkIGludCByZXYpCj4+Pj4gICAgewo+Pj4+IC0gICAgc3Ry
dWN0IHVjb2RlX2NwdV9pbmZvICp1Y2kgPSAmcGVyX2NwdSh1Y29kZV9jcHVfaW5mbywgY3B1X251
bSk7Cj4+Pj4gLQo+Pj4+IC0gICAgcmV0dXJuIChzaWdtYXRjaChzaWcsIHVjaS0+Y3B1X3NpZy5z
aWcsIHBmLCB1Y2ktPmNwdV9zaWcucGYpICYmCj4+Pj4gLSAgICAgICAgICAgIChtY19oZWFkZXIt
PnJldiA+IHVjaS0+Y3B1X3NpZy5yZXYpKTsKPj4+PiArICAgIGNvbnN0IHN0cnVjdCBleHRlbmRl
ZF9zaWd0YWJsZSAqZXh0X2hlYWRlcjsKPj4+PiArICAgIGNvbnN0IHN0cnVjdCBleHRlbmRlZF9z
aWduYXR1cmUgKmV4dF9zaWc7Cj4+Pj4gKyAgICB1bnNpZ25lZCBsb25nIGRhdGFfc2l6ZSA9IGdl
dF9kYXRhc2l6ZShtY19oZWFkZXIpOwo+Pj4+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4+Pj4gKyAg
ICBjb25zdCB2b2lkICplbmQgPSAoY29uc3Qgdm9pZCAqKW1jX2hlYWRlciArIGdldF90b3RhbHNp
emUobWNfaGVhZGVyKTsKPj4+PiArCj4+Pj4gKyAgICBpZiAoIHNpZ21hdGNoKHNpZywgbWNfaGVh
ZGVyLT5zaWcsIHBmLCBtY19oZWFkZXItPnBmKSApCj4+Pj4gKyAgICAgICAgcmV0dXJuIChtY19o
ZWFkZXItPnJldiA+IHJldikgPyBORVdfVUNPREUgOiBPTERfVUNPREU7Cj4+Pgo+Pj4gQm90aCBo
ZXJlIGFuZCAuLi4KPj4+Cj4+Pj4gKyAgICBleHRfaGVhZGVyID0gKGNvbnN0IHZvaWQgKikobWNf
aGVhZGVyICsgMSkgKyBkYXRhX3NpemU7Cj4+Pj4gKyAgICBleHRfc2lnID0gKGNvbnN0IHZvaWQg
KikoZXh0X2hlYWRlciArIDEpOwo+Pj4+ICsKPj4+PiArICAgIC8qCj4+Pj4gKyAgICAgKiBNYWtl
IHN1cmUgdGhlcmUgaXMgZW5vdWdoIHNwYWNlIHRvIGhvbGQgYW4gZXh0ZW5kZWQgaGVhZGVyIGFu
ZCBlbm91Z2gKPj4+PiArICAgICAqIGFycmF5IGVsZW1lbnRzLgo+Pj4+ICsgICAgICovCj4+Pj4g
KyAgICBpZiAoIChlbmQgPCAoY29uc3Qgdm9pZCAqKWV4dF9zaWcpIHx8Cj4+Pj4gKyAgICAgICAg
IChlbmQgPCAoY29uc3Qgdm9pZCAqKShleHRfc2lnICsgZXh0X2hlYWRlci0+Y291bnQpKSApCj4+
Pj4gKyAgICAgICAgcmV0dXJuIE1JU19VQ09ERTsKPj4+PiArCj4+Pj4gKyAgICBmb3IgKCBpID0g
MDsgaSA8IGV4dF9oZWFkZXItPmNvdW50OyBpKysgKQo+Pj4+ICsgICAgICAgIGlmICggc2lnbWF0
Y2goc2lnLCBleHRfc2lnW2ldLnNpZywgcGYsIGV4dF9zaWdbaV0ucGYpICkKPj4+PiArICAgICAg
ICAgICAgcmV0dXJuIChtY19oZWFkZXItPnJldiA+IHJldikgPyBORVdfVUNPREUgOiBPTERfVUNP
REU7Cj4+Pgo+Pj4gLi4uIGhlcmUgdGhlcmUncyBhZ2FpbiBhbiBhc3N1bXB0aW9uIHRoYXQgdGhl
cmUncyBzdHJpY3Qgb3JkZXJpbmcKPj4+IGJldHdlZW4gYmxvYnMsIGJ1dCBhcyBtZW50aW9uZWQg
aW4gcmVwbHkgdG8gYSBsYXRlciBwYXRjaCBvZiBhbgo+Pj4gZWFybGllciB2ZXJzaW9uIHRoaXMg
aXNuJ3QgdGhlIGNhc2UuIFRoZXJlZm9yZSB0aGUgZnVuY3Rpb24gY2FuJ3QKPj4+IGJlIHVzZWQg
dG8gY29tcGFyZSB0d28gYXJiaXRyYXJ5IGJsb2JzLCBpdCBtYXkgb25seSBiZSB1c2VkIHRvCj4+
PiBjb21wYXJlIGEgYmxvYiB3aXRoIHdoYXQgaXMgYWxyZWFkeSBsb2FkZWQgaW50byBhIENQVS4g
SSB0aGluayBpdAo+Pj4gaXMgcXVpdGUgaW1wb3J0YW50IHRvIG1lbnRpb24gdGhpcyByZXN0cmlj
dGlvbiBpbiBhIGNvbW1lbnQgYWhlYWQKPj4+IG9mIHRoZSBmdW5jdGlvbi4KPj4+Cj4+PiBUaGUg
Y29kZSBpdHNlbGYgbG9va3MgZmluZSB0byBtZSwgYW5kIGEgY29tbWVudCBjb3VsZCBwZXJoYXBz
IGJlCj4+PiBhZGRlZCB3aGlsZSBjb21taXR0aW5nOyB3aXRoIHN1Y2ggYSBjb21tZW50Cj4+IAo+
PiBBZ3JlZS4gQmVjYXVzZSB0aGVyZSB3aWxsIGJlIGEgdmVyc2lvbiA5LCBJIGNhbiBhZGQgYSBj
b21tZW50Lgo+Cj5IYXZpbmcgc2VlbiB0aGUgdXNlcyBpbiBsYXRlciBwYXRjaGVzLCBJIHRoaW5r
IGEgY29tbWVudCBpcyBub3QgdGhlCj53YXkgdG8gZ28uIEluc3RlYWQgSSB0aGluayB5b3Ugd2Fu
dCB0byBmaXJzdCBtYXRjaCBfYm90aF8KPnNpZ25hdHVyZXMgYWdhaW5zdCB0aGUgbG9jYWwgQ1BV
ICh1bmxlc3MgZS5nLiBmb3IgZWl0aGVyIHNpZGUgdGhpcwo+aXMgbG9naWNhbGx5IGd1YXJhbnRl
ZWQpLAoKWWVzLiBJdCBpcyBndWFyYW50ZWVkIGF0IHRoZSBmaXJzdCBwbGFjZTogd2UgaWdub3Jl
IGFueSBwYXRjaCB0aGF0CmRvZXNuJ3QgbWF0Y2ggd2l0aCB0aGUgQ1BVIHNpZ25hdHVyZSB3aGVu
IHBhcnNpbmcgdGhlIHVjb2RlIGJsb2IuCiAgCj5hbmQgcmV0dXJuIERJU19VQ09ERSB1cG9uIG1p
c21hdGNoLiBPbmx5Cj50aGVuIHNob3VsZCB5b3UgYWN0dWFsbHkgY29tcGFyZSB0aGUgdHdvIHNp
Z25hdHVyZXMuIFdoaWxlIGZyb20gYQo+cHVyZSwgYWJzdHJhY3QgcGF0Y2ggb3JkZXJpbmcgcGVy
c3BlY3RpdmUgdGhpcyBpc24ndCBjb3JyZWN0LCB3ZQo+b25seSBjYXJlIGFib3V0IHBhdGNoZXMg
YXBwbGljYWJsZSB0byB0aGUgbG9jYWwgQ1BVIGFueXdheSwgYW5kIGZvcgo+dGhhdCBjYXNlIHRo
ZSBleHRyYSByZXN0cmljdGlvbiBpcyBmaW5lLiBUaGlzIHdheSB5b3UnbGwgYmUgYWJsZSB0bwo+
YXZvaWQgdGFraW5nIGV4dHJhIHByZWNhdXRpb25zIGluIHZlbmRvci1pbmRlcGVuZGVudCBjb2Rl
IGp1c3QgdG8KPmFjY29tbW9kYXRlIGFuIEludGVsIHNwZWNpZmljIHJlcXVpcmVtZW50LgoKWWVz
LiBJIGFncmVlIGFuZCBpdCBzZWVtcyB0aGF0IG5vIGZ1cnRoZXIgY2hhbmdlIGlzIG5lZWRlZCBl
eGNlcHQKdGhlIGltcGxlbWVudGF0aW9uIG9mIC0+Y29tcGFyZV9wYXRjaC4gUGxlYXNlIGNvcnJl
Y3QgbWUgaWYgSSBhbSB3cm9uZy4KClRoYW5rcwpDaGFvCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
