Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F7C16F40
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 04:53:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOCfM-0001gK-LL; Wed, 08 May 2019 02:50:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pUii=TI=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hOCfK-0001gF-KN
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 02:50:42 +0000
X-Inumbo-ID: 11025c2c-713c-11e9-843c-bc764e045a96
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 11025c2c-713c-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 02:50:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 19:50:40 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga004.fm.intel.com with ESMTP; 07 May 2019 19:50:39 -0700
Date: Wed, 8 May 2019 10:54:53 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190508025451.GA10310@gao-cwp>
References: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
 <5CC7FFAF020000780022A42A@prv1-mh.provo.novell.com>
 <20190430090120.GA6748@gao-cwp>
 <20190430093033.ncd2ism7n4mvy733@Air-de-Roger>
 <20190430164113.GB20660@gao-cwp>
 <20190502082009.gromld47umko65ld@Air-de-Roger>
 <20190506044439.GA22540@gao-cwp>
 <5CD000DC020000780022C1A7@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD000DC020000780022C1A7@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH] x86/pt: skip setup of posted format IRTE
 when gvec is 0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDM6Mzk6NDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMDYuMDUuMTkgYXQgMDY6NDQsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+PiBPbiBUaHUsIE1heSAwMiwgMjAxOSBhdCAxMDoyMDowOUFNICswMjAwLCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOgo+Pj5DYW4geW91IHNlZSBhYm91dCBhdm9pZGluZyB0aGUgWEVOX0RPTUNU
TF9iaW5kX3B0X2lycSBjYWxsIGluIFFFTVUgaWYKPj4+dGhlIGludGVycnVwdCBpcyBnb2luZyB0
byBiZSByb3V0ZWQgb3ZlciBhbiBldmVudCBjaGFubmVsPwo+PiAKPj4gWWVzLiBJdCBpcyBkb2Fi
bGUuIEJ1dCBpdCBuZWVkcyBjaGFuZ2VzIGluIGJvdGggcWVtdSBhbmQgWGVuIGFuZCBzb21lIHRy
aWNrcwo+PiB0byBiZSBjb21wYXRpYmxlIHdpdGggb2xkIHFlbXUuCj4KPlRoYXQgd291bGQgYmUg
dWdseSBpbmRlZWQuCj4KPj4gSSBwcmVmZXIgbm90IHRvIHRvdWNoIHFlbXUgYW5kIGtlZXAgcWVt
dSB1bndhcmUgb2YgTVNJJ3MgInJvdXRpbmcgb3ZlciBldnRjaG4iLAo+PiBsaWtlIHRoZSBwYXRj
aCBiZWxvdzoKPgo+SXMgdGhpcyBtZWFudCBhcyBhIHJlcGxhY2VtZW50IHRvIHlvdXIgb3JpZ2lu
YWwgcGF0Y2gsIG9yIGFzIGFuCj5hZGQtb24/IEluIGFueSBldmVudCBpdCdzIG5vdCBpbW1lZGlh
dGVseSBjbGVhciB0byBtZSBob3cKCkEgcmVwbGFjZW1lbnQuCgo+Li4uCj4KPj4gLS0tIGEveGVu
L2NvbW1vbi9ldmVudF9jaGFubmVsLmMKPj4gKysrIGIveGVuL2NvbW1vbi9ldmVudF9jaGFubmVs
LmMKPj4gQEAgLTUwNCwxMCArNTA0LDcgQEAgc3RhdGljIGxvbmcgZXZ0Y2huX2JpbmRfcGlycShl
dnRjaG5fYmluZF9waXJxX3QgKmJpbmQpCj4+ICAgICAgaWYgKCAhaW5mbyApCj4+ICAgICAgICAg
IEVSUk9SX0VYSVQoLUVOT01FTSk7Cj4+ICAgICAgaW5mby0+ZXZ0Y2huID0gcG9ydDsKPj4gLSAg
ICByYyA9ICghaXNfaHZtX2RvbWFpbihkKQo+PiAtICAgICAgICAgID8gcGlycV9ndWVzdF9iaW5k
KHYsIGluZm8sCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgISEoYmluZC0+ZmxhZ3Mg
JiBCSU5EX1BJUlFfX1dJTExfU0hBUkUpKQo+PiAtICAgICAgICAgIDogMCk7Cj4+ICsgICAgcmMg
PSBwaXJxX2d1ZXN0X2JpbmQodiwgaW5mbywgISEoYmluZC0+ZmxhZ3MgJiBCSU5EX1BJUlFfX1dJ
TExfU0hBUkUpKTsKPgo+Li4uIHRoaXMgYmVjb21pbmcgdW5jb25kaXRpb25hbCB3b24ndCBjb25m
bGljdCB3aXRoIGl0cyBvdGhlcgo+aW52b2NhdGlvbiAuLi4KClllcy4gSXQgY29uZmxpY3RzIHdp
dGggdGhlIGNhbGwgaW4gcHRfaXJxX2NyZWF0ZV9iaW5kKCkgZm9yIG5vbi1NU0kgY2FzZS4KCj4K
Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwo+PiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9pby5jCj4+IEBAIC0zNDYsNiArMzQ2LDEyIEBAIGludCBwdF9pcnFfY3Jl
YXRlX2JpbmQoCj4+ICAgICAgICAgIHVpbnQzMl90IGdmbGFncyA9IHB0X2lycV9iaW5kLT51Lm1z
aS5nZmxhZ3MgJgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICB+WEVOX0RPTUNUTF9WTVNJ
X1g4Nl9VTk1BU0tFRDsKPj4gIAo+PiArICAgICAgICBpZiAoICFwdF9pcnFfYmluZC0+dS5tc2ku
Z3ZlYyApCj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZkLT5ldmVu
dF9sb2NrKTsKPj4gKyAgICAgICAgICAgIHJldHVybiAwOwo+PiArICAgICAgICB9Cj4KPi4uLiBm
dXJ0aGVyIGRvd24gaW4gdGhpcyBmdW5jdGlvbiwgZm9yIHRoZSBub24tTVNJIGNhc2UuCj5TaW1p
bGFybHkgSSB3b25kZXIgd2hldGhlciB0aGUgcmVzcGVjdGl2ZSB1bmJpbmQgZnVuY3Rpb24KPmlu
dm9jYXRpb25zIHRoZW4gd29uJ3QgZ28gKG9yIGFscmVhZHkgYXJlPykgb3V0IG9mIHN5bmMuCgpU
aGUgIm91dCBvZiBzeW5jIiBpc3N1ZSBzZWVtcyBoYXJkIHRvIGJlIHNvbHZlZC4gSXQgaXMgZXJy
b3ItcHJvbmUgdG8KbW92ZSBwaXJxX2d1ZXN0Xyh1biliaW5kIGZyb20gb25lIGh5cGVyY2FsbCB0
byBhbm90aGVyLgoKT24gc2Vjb25kIHRob3VnaHQsIEkgcGxhbiB0byBnbyBiYWNrIHRvIG15IG9y
aWdpbmFsIHBhdGNoLiBUaGUgb25seQppc3N1ZSBmb3IgdGhhdCBwYXRjaCBpcyBob3cgdG8gbWln
cmF0ZSBpcnEgcHJvcGVybHkgdG8gYXZvaWQgSVBJIGR1cmluZwppbnRlcnJ1cHQgZGVsaXZlcnku
CgpBY3R1YWxseSwgY3VycmVudCBjb2RlIGhhcyBzZXQgaXJxIGFmZmluaXR5IGNvcnJlY3RseToK
MS4gcGlycSBpcyBib3VuZCB0byB2Y3B1WzBdIGluIHB0X2lycV9jcmVhdGVfYmluZCgpLiBJdCBh
bHNvIHNldHMKY29ycmVzcG9uZGluZyBwaHlzaWNhbCBpcnEncyBhZmZpbml0eSB0byB2Y3B1WzBd
LgoyLiBldnRjaG4gaXMgYm91bmQgdG8gdmNwdVswXSBpbiBldnRjaG5fYmluZF9waXJxKCkuIER1
cmluZwpkZWxpdmVyeSwgd2Ugd291bGQgc2VuZCBwaXJxIHRvIHZjcHVbMF0gYW5kIG5vIElQSSBp
cyByZXF1aXJlZC4KMy4gSWYgZXZ0Y2huIGlzIHJlYm91bmQgdG8gYW5vdGhlciB2Y3B1IGluIGV2
dGNobl9iaW5kX3ZjcHUoKSwgdGhlCmFmZmluaXR5IG9mIHRoZSBwaHlzaWNhbCBpcnEgaXMgYWxy
ZWFkeSByZWNvbmZpZ3VyZWQgdGhlcmUuCgpUaGFua3MKQ2hhbwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
