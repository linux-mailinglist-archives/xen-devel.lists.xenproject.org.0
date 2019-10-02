Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7FBC89DB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 15:36:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFelA-0003sM-AL; Wed, 02 Oct 2019 13:33:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFel8-0003sA-Vb
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 13:33:38 +0000
X-Inumbo-ID: 3cb48b62-e519-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 3cb48b62-e519-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 13:33:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4BD46B0E2;
 Wed,  2 Oct 2019 13:33:36 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191002104935.60245-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5dc7c62-ea14-7930-8f2d-62e20984da60@suse.com>
Date: Wed, 2 Oct 2019 15:33:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002104935.60245-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: xen-devel@lists.xenproject.org, Stanislav Spassov <stanspas@amazon.de>,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxMjo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9mIGhvc3RfbWFza2FsbCBtYWtlcyBpdCBzdGlja3kgYWNyb3NzCj4g
YXNzaWduIGFuZCBkZWFzc2lnbiBjYWxscywgd2hpY2ggbWVhbnMgdGhhdCBvbmNlIGEgZ3Vlc3Qg
Zm9yY2VzIFhlbiB0bwo+IHNldCBob3N0X21hc2thbGwgdGhlIG1hc2thbGwgYml0IGlzIG5vdCBn
b2luZyB0byBiZSBjbGVhcmVkIHVudGlsIGEKPiBjYWxsIHRvIFBIWVNERVZPUF9wcmVwYXJlX21z
aXggaXMgcGVyZm9ybWVkLiBTdWNoIGNhbGwgaG93ZXZlcgo+IHNob3VsZG4ndCBiZSBwYXJ0IG9m
IHRoZSBub3JtYWwgZmxvdyB3aGVuIGRvaW5nIFBDSSBwYXNzdGhyb3VnaCwgYW5kCj4gaGVuY2Ug
dGhlIGZsYWcgbmVlZHMgdG8gYmUgY2xlYXJlZCB3aGVuIGFzc2lnbmluZyBpbiBvcmRlciB0byBw
cmV2ZW50Cj4gaG9zdF9tYXNrYWxsIGJlaW5nIGNhcnJpZWQgb3ZlciBmcm9tIHByZXZpb3VzIGFz
c2lnbmF0aW9ucy4KPiAKPiBOb3RlIHRoYXQgb3RoZXIgbWFzayBmaWVsZHMsIGxpa2UgZ3Vlc3Rf
bWFza2VkIG9yIHRoZSBlbnRyeSBtYXNrYml0Cj4gYXJlIGFscmVhZHkgcmVzZXQgd2hlbiB0aGUg
bXNpeCBjYXBhYmlsaXR5IGlzIGluaXRpYWxpemVkLgoKSSB0YWtlIGl0IHlvdSBtZWFuIGEgZ3Vl
c3QgYWN0aW9uIGhlcmUsIGFzIFBIWVNERVZPUF9wcmVwYXJlX21zaXggaXMKc3BlY2lmaWNhbGx5
IGFib3V0IHNldHRpbmcgdXAgdGhlIGFjdHVhbCBoYXJkd2FyZSdzIG9uZT8gVGhpcyBoYXBwZW5z
CnF1aXRlIGEgYml0IGxhdGVyIHRob3VnaCwgaS5lLiAtPmd1ZXN0X21hc2thbGwgbWF5IG5lZWQg
ZXhwbGljaXRseQpzZXR0aW5nIGF0IHRoZSBzYW1lIHRpbWUgYXMgeW91IGNsZWFyIC0+aG9zdF9t
YXNrYWxsLiBGdXJ0aGVybW9yZSAuLi4KCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+IEBAIC0xNTA0LDcg
KzE1MDQsMTAgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUx
NiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQo+ICAgICAgfQo+ICAKPiAgICAgIGlm
ICggcGRldi0+bXNpeCApCj4gKyAgICB7Cj4gICAgICAgICAgbXNpeHRibF9pbml0KGQpOwo+ICsg
ICAgICAgIHBkZXYtPm1zaXgtPmhvc3RfbWFza2FsbCA9IGZhbHNlOwo+ICsgICAgfQoKLi4uIGRv
aW5nIGp1c3QgdGhpcyB3b3VsZCB2aW9sYXRlIGFuIGFzc3VtZWQgcHJvcGVydHk6IEl0IG91Z2h0
IHRvCmJlIGZpbmUgdG8gYXNzZXJ0IGF0IGV2ZXJ5IGVudHJ5IG9yIGV4aXQgcG9pbnQgdGhhdCB0
aGUgcGh5c2ljYWwKbWFza2FsbCBiaXQgb2YgYW4gTVNJLVgtZW5hYmxlZCBkZXZpY2UgaXMgdGhl
IGxvZ2ljYWwgT1Igb2YKLT5ob3N0X21hc2thbGwgYW5kIC0+Z3Vlc3RfbWFza2FsbC4gSS5lLiBJ
IHNlZSB0aGUgZm9sbG93aW5nCm9wdGlvbnM6CgoxKSB5b3VyIHZhcmlhbnQgYWNjb21wYW5pZWQg
YnkgdXBkYXRpbmcgb2YgdGhlIGhhcmR3YXJlIGJpdCwKCjIpCgogICAgICAgIHBkZXYtPm1zaXgt
Pmd1ZXN0X21hc2thbGwgPSBwZGV2LT5tc2l4LT5ob3N0X21hc2thbGw7CiAgICAgICAgcGRldi0+
bXNpeC0+aG9zdF9tYXNrYWxsID0gZmFsc2U7CgpsZWF2aW5nIHRoZSBoYXJkd2FyZSBiaXQgYWxv
bmUsIGFzIHRoZSBhYm92ZSB0cmFuc2Zvcm1hdGlvbgp3b3VsZG4ndCBjaGFuZ2Ugd2hhdCBpdCdz
IHN1cHBvc2VkIHRvIGJlIHNldCB0bywKCjMpCgogICAgICAgIHBkZXYtPm1zaXgtPmd1ZXN0X21h
c2thbGwgPSB0cnVlOwogICAgICAgIHBkZXYtPm1zaXgtPmhvc3RfbWFza2FsbCA9IGZhbHNlOwoK
YWxvbmdzaWRlIHNldHRpbmcgdGhlIGJpdCBpbiBoYXJkd2FyZSAoaWYgbm90IGFscmVhZHkgc2V0
KSwKCjQpCgogICAgICAgIHBkZXYtPm1zaXgtPmd1ZXN0X21hc2thbGwgPSBmYWxzZTsKICAgICAg
ICBwZGV2LT5tc2l4LT5ob3N0X21hc2thbGwgPSBmYWxzZTsKCmFsb25nc2lkZSBjbGVhcmluZyB0
aGUgYml0IGluIGhhcmR3YXJlIChpZiBub3QgYWxyZWFkeSBjbGVhciksCnJlbHlpbmcgb24gYWxs
IGVudHJpZXMgYmVpbmcgaW5kaXZpZHVhbGx5IG1hc2tlZCAod2hpY2ggb3VnaHQKdG8gYmUgdGhl
IHN0YXRlIGFmdGVyIHRoZSBpbml0aWFsIG1zaXhfY2FwYWJpbGl0eV9pbml0KCkpLgoKSW4gYWxs
IGNhc2VzIHRoZSBvcGVyYXRpb24gd291bGQgbGlrZWx5IGJldHRlciBiZSBkb25lIGJ5CmNhbGxp
bmcgYSBmdW5jdGlvbiB0byBiZSBwdXQgaW4geDg2L21zaS5jLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
