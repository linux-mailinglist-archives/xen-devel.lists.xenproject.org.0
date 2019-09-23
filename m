Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3D4BAF8F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 10:30:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCJgY-0005tR-JR; Mon, 23 Sep 2019 08:27:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=83n9=XS=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iCJgX-0005tM-F2
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 08:27:05 +0000
X-Inumbo-ID: ea872d52-dddb-11e9-b299-bc764e2007e4
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea872d52-dddb-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 08:27:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 01:27:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; d="scan'208";a="188079387"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga008.fm.intel.com with ESMTP; 23 Sep 2019 01:26:59 -0700
Date: Mon, 23 Sep 2019 16:31:01 +0800
From: Chao Gao <chao.gao@intel.com>
To: Joe Jin <joe.jin@oracle.com>
Message-ID: <20190923083059.GA12996@gao-cwp>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
 <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
 <30e5e335-9c01-ef8c-3437-3d42fb31e8f0@suse.com>
 <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
 <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
 <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDI6MTY6MTNQTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
Pk9uIDkvMTYvMTkgMTE6NDggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxNy4wOS4yMDE5
IDAwOjIwLCBKb2UgSmluIHdyb3RlOgo+Pj4gT24gOS8xNi8xOSAxOjAxIEFNLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+PiBPbiAxMy4wOS4yMDE5IDE4OjM4LCBKb2UgSmluIHdyb3RlOgo+Pj4+PiBP
biA5LzEzLzE5IDEyOjE0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDEyLjA5LjIw
MTkgMjA6MDMsIEpvZSBKaW4gd3JvdGU6Cj4+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvaW8uYwo+Pj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKPj4+
Pj4+PiBAQCAtNDEyLDYgKzQxMiw5IEBAIGludCBwdF9pcnFfY3JlYXRlX2JpbmQoCj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZ3ZlYyA9IHB0X2lycV9iaW5kLT51Lm1z
aS5ndmVjOwo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgcGlycV9kcGNpLT5nbXNpLmdmbGFncyA9
IGdmbGFnczsKPj4+Pj4+PiAgICAgICAgICAgICAgfQo+Pj4+Pj4+ICsKPj4+Pj4+PiArICAgICAg
ICAgICAgaWYgKCBodm1fZnVuY3Muc3luY19waXJfdG9faXJyICkKPj4+Pj4+PiArICAgICAgICAg
ICAgICAgIGh2bV9mdW5jcy5zeW5jX3Bpcl90b19pcnIoZC0+dmNwdVtwaXJxX2RwY2ktPmdtc2ku
ZGVzdF92Y3B1X2lkXSk7Cj4+Pj4+Pgo+Pj4+Pj4gSWYgdGhlIG5lZWQgZm9yIHRoaXMgY2hhbmdl
IGNhbiBiZSBwcm9wZXJseSBleHBsYWluZWQsIHRoZW4gaXQKPj4+Pj4+IHN0aWxsIHdhbnRzIGNv
bnZlcnRpbmcgdG8gYWx0ZXJuYXRpdmVfdmNhbGwoKSAtIHRoZSB0aGUgb3RoZXIKPj4+Pj4+IGNh
bGxlciBvZiB0aGlzIGhvb2suIE9yIHBlcmhhcHMgZXZlbiBiZXR0ZXIgbW92ZSB2bGFwaWMuYydz
Cj4+Pj4+PiB3cmFwcGVyIChzdWl0YWJseSByZW5hbWVkKSBpbnRvIGh2bS5oLCBhbmQgdXNlIGl0
IGhlcmUuCj4+Pj4+Cj4+Pj4+IFllcyBJIGFncmVlLCBJJ20gbm90IDEwMCUgc3VyZSwgc28gSSBz
ZXQgaXQgdG8gUkZDLgo+Pj4+Cj4+Pj4gQW5kIGJ0dywgcGxlYXNlIGFsc28gYXR0YWNoIGEgYnJp
ZWYgY29tbWVudCBoZXJlLCB0byBjbGFyaWZ5Cj4+Pj4gd2h5IHRoZSBzeW5jaW5nIGlzIG5lZWRl
ZCBwcmVjaXNlbHkgYXQgdGhpcyBwb2ludC4KPj4+Pgo+Pj4+Pj4gQWRkaXRpb25hbGx5LCB0aGUg
Y29kZSBzZXR0aW5nIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQKPj4+Pj4+IChyaWdodCBh
ZnRlciB5b3VyIGNvZGUgaW5zZXJ0aW9uKSBhbGxvd3MgZm9yIHRoZSBmaWVsZCB0byBiZQo+Pj4+
Pj4gaW52YWxpZCwgd2hpY2ggSSB0aGluayB5b3UgbmVlZCB0byBndWFyZCBhZ2FpbnN0Lgo+Pj4+
Pgo+Pj4+PiBJIHRoaW5rIHlvdSBtZWFucyBtdWx0aXBsZSBkZXN0aW5hdGlvbiwgdGhlbiBpdCdz
IC0xPwo+Pj4+Cj4+Pj4gVGhlIHJlYXNvbiBmb3Igd2h5IGl0IG1pZ2h0IGJlIC0xIGFyZSBpcnJl
bGV2YW50IGhlcmUsIEkgdGhpbmsuCj4+Pj4gWW91IG5lZWQgdG8gaGFuZGxlIHRoZSBjYXNlIGJv
dGggdG8gYXZvaWQgYW4gb3V0LW9mLWJvdW5kcwo+Pj4+IGFycmF5IGFjY2VzcyBhbmQgdG8gbWFr
ZSBzdXJlIGFuIElSUiBiaXQgd291bGRuJ3Qgc3RpbGwgZ2V0Cj4+Pj4gcHJvcGFnYXRlZCB0b28g
bGF0ZSBpbiBzb21lIHNwZWNpYWwgY2FzZS4KPj4+Cj4+PiBBZGQgZm9sbG93aW5nIGNoZWNrcz8K
Pj4+ICAgICAgICAgICAgIGlmICggZGVzdF92Y3B1X2lkID49IDAgJiYgZGVzdF92Y3B1X2lkIDwg
ZC0+bWF4X3ZjcHVzICYmCj4+PiAgICAgICAgICAgICAgICAgIGQtPnZjcHVbZGVzdF92Y3B1X2lk
XS0+cnVuc3RhdGUuc3RhdGUgPD0gUlVOU1RBVEVfYmxvY2tlZCApCj4+IAo+PiBKdXN0IHRoZSA+
PSBwYXJ0IHNob3VsZCBzdWZmaWNlOyB3aXRob3V0IGFuIGV4cGxhbmF0aW9uIEkgZG9uJ3QKPj4g
c2VlIHdoeSB5b3Ugd2FudCB0aGUgcnVuc3RhdGUgY2hlY2sgKHdoaWNoIGFmdGVyIGFsbCBpcyBy
YWN5Cj4+IGFueXdheSBhZmFpY3QpLgo+PiAKPj4+PiBBbHNvIC0gd2hhdCBhYm91dCB0aGUgcmVz
cGVjdGl2ZSBvdGhlciBwYXRoIGluIHRoZSBmdW5jdGlvbiwKPj4+PiBkZWFsaW5nIHdpdGggUFRf
SVJRX1RZUEVfUENJIGFuZCBQVF9JUlFfVFlQRV9NU0lfVFJBTlNMQVRFPyBJdAo+Pj4+IHNlZW1z
IHRvIG1lIHRoYXQgdGhlcmUncyB0aGUgc2FtZSBjaGFuY2Ugb2YgZGVmZXJyaW5nIElSUgo+Pj4+
IHByb3BhZ2F0aW9uIGZvciB0b28gbG9uZz8KPj4+Cj4+PiBUaGlzIGlzIHBvc3NpYmxlLCBjYW4g
eW91IHBsZWFzZSBoZWxwIG9uIGhvdyB0byBnZXQgd2hpY2ggdmNwdSBhc3NvY2lhdGUgdGhlIElS
UT8KPj4+IEkgZGlkIG5vdCBmb3VuZCBhbnkgaGVscGVyIG9uIGN1cnJlbnQgWGVuLgo+PiAKPj4g
VGhlcmUncyBubyBzdWNoIGhlbHBlciwgSSdtIGFmcmFpZC4gTG9va2luZyBhdCBodm1fbWlncmF0
ZV9waXJxKCkKPj4gYW5kIGh2bV9naXJxX2Rlc3RfMl92Y3B1X2lkKCkgSSBub3RpY2UgdGhhdCB0
aGUgZm9ybWVyIGRvZXMgbm90aGluZwo+PiBpZiBwaXJxX2RwY2ktPmdtc2kucG9zdGVkIGlzIHNl
dC4gSGVuY2UgcGlycV9kcGNpLT5nbXNpLmRlc3RfdmNwdV9pZAo+PiBpc24ndCByZWFsbHkgdXNl
ZCBpbiB0aGlzIGNhc2UgKHBsZWFzZSBkb3VibGUgY2hlY2spLCBhbmQgc28geW91IG1heQo+PiB3
YW50IHRvIHVwZGF0ZSB0aGUgZmllbGQgYWxvbmdzaWRlIHNldHRpbmcgcGlycV9kcGNpLT5nbXNp
LnBvc3RlZCBpbgo+PiBwdF9pcnFfY3JlYXRlX2JpbmQoKSwgY292ZXJpbmcgdGhlIG11bHRpIGRl
c3RpbmF0aW9uIGNhc2UuCj4+IAo+PiBZb3VyIGNvZGUgYWRkaXRpb24gc3RpbGwgdmlzaWJsZSBp
biBjb250ZXh0IGFib3ZlIG1heSB0aGVuIHdhbnQgdG8KPj4gYmUgZnVydGhlciBjb25kaXRpb25h
bGl6ZWQgdXBvbiBpb21tdV9pbnRwb3N0IG9yIChwZXJoYXBzIGJldHRlcikKPj4gcGlycV9kcGNp
LT5nbXNpLnBvc3RlZCBiZWluZyBzZXQuCj4+IAo+Cj5Tb3JyeSB0aGlzIGlzIG5ldyB0byBtZSwg
YW5kIEkgaGF2ZSB0byBzdHVkeSBmcm9tIGNvZGUuCj5EbyB5b3UgdGhpbmsgYmVsb3cgY2hlY2sg
Y292ZXIgYWxsIGNvbmRpdGlvbnM/Cj4KPmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9pby5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwo+aW5kZXggNDI5MGM3Yzcx
MC4uOTBjM2RhNDQxZCAxMDA2NDQKPi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMK
PisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKPkBAIC00MTIsNiArNDEyLDEwIEBA
IGludCBwdF9pcnFfY3JlYXRlX2JpbmQoCj4gICAgICAgICAgICAgICAgIHBpcnFfZHBjaS0+Z21z
aS5ndmVjID0gcHRfaXJxX2JpbmQtPnUubXNpLmd2ZWM7Cj4gICAgICAgICAgICAgICAgIHBpcnFf
ZHBjaS0+Z21zaS5nZmxhZ3MgPSBnZmxhZ3M7Cj4gICAgICAgICAgICAgfQo+Kwo+KyAgICAgICAg
ICAgIC8qIE5vdGlmeSBndWVzdCBvZiBwZW5kaW5nIGludGVycnVwdHMgaWYgbmVjZXNzYXJ5ICov
Cj4rICAgICAgICAgICAgaWYgKCBkZXN0X3ZjcHVfaWQgPj0gMCAmJiBpb21tdV9pbnRwb3N0ICYm
IHBpcnFfZHBjaS0+Z21zaS5wb3N0ZWQgKQoKSGkgSm9lLAoKRG8geW91IGVuYWJsZSB2dC1kIHBv
c3RlZCBpbnRlcnJ1cHQgaW4gWGVuIGJvb3Qgb3B0aW9ucz8gSSBkb24ndCBzZWUKd2h5IGl0IGlz
IHNwZWNpZmljIHRvIHZ0LWQgcG9zdGVkIGludGVycnVwdC4gSWYgb25seSBDUFUgc2lkZSBwb3N0
ZWQKaW50ZXJydXB0IGlzIGVuYWJsZWQsIGl0IGlzIGFsc28gcG9zc2libGUgdGhhdCBpbnRlcnJ1
cHRzIGFyZSBub3QKcHJvcGFnYXRlZCBmcm9tIFBJUiB0byBJUlIgaW4gdGltZS4KClRoYW5rcwpD
aGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
