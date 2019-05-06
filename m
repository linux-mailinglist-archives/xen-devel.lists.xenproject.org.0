Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46F2145DF
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 10:17:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNYm6-0006x8-7S; Mon, 06 May 2019 08:15:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNYm4-0006x1-DE
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:15:00 +0000
X-Inumbo-ID: 03a25136-6fd7-11e9-8f8d-e3cfd735f9fa
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03a25136-6fd7-11e9-8f8d-e3cfd735f9fa;
 Mon, 06 May 2019 08:14:48 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 02:14:47 -0600
Message-Id: <5CCFECF3020000780022C0BE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 02:14:43 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DEF70200007800229EA3@prv1-mh.provo.novell.com>
 <20190503162159.ymqzwzv43opzljlr@Air-de-Roger>
In-Reply-To: <20190503162159.ymqzwzv43opzljlr@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/9] x86/IRQ: desc->affinity should strictly
 represent the requested value
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDE4OjIxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDA1OjI0OjM5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBkZXNjLT5hcmNoLmNwdV9tYXNrIHJlZmxlY3RzIHRoZSBhY3R1YWwgc2V0IG9mIHRh
cmdldCBDUFVzLiBEb24ndCBldmVyCj4+IGZpZGRsZSB3aXRoIGRlc2MtPmFmZmluaXR5IGl0c2Vs
ZiwgZXhjZXB0IHRvIHN0b3JlIGNhbGxlciByZXF1ZXN0ZWQKPj4gdmFsdWVzLgo+PiAKPj4gVGhp
cyByZW5kZXJzIGJvdGggc2V0X25hdGl2ZV9pcnFfaW5mbygpIHVzZXMgKHdoaWNoIHdlcmVuJ3Qg
dXNpbmcgcHJvcGVyCj4+IGxvY2tpbmcgYW55d2F5KSByZWR1bmRhbnQgLSBkcm9wIHRoZSBmdW5j
dGlvbiBhbHRvZ2V0aGVyLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwo+PiAr
KysgYi94ZW4vYXJjaC94ODYvaXJxLmMKPj4gQEAgLTU3MiwxMSArNTcyLDE2IEBAIGludCBhc3Np
Z25faXJxX3ZlY3RvcihpbnQgaXJxLCBjb25zdCBjcHUKPj4gIAo+PiAgICAgIHNwaW5fbG9ja19p
cnFzYXZlKCZ2ZWN0b3JfbG9jaywgZmxhZ3MpOwo+PiAgICAgIHJldCA9IF9fYXNzaWduX2lycV92
ZWN0b3IoaXJxLCBkZXNjLCBtYXNrID86IFRBUkdFVF9DUFVTKTsKPj4gLSAgICBpZiAoIXJldCkg
ewo+PiArICAgIGlmICggIXJldCApCj4+ICsgICAgewo+PiAgICAgICAgICByZXQgPSBkZXNjLT5h
cmNoLnZlY3RvcjsKPj4gLSAgICAgICAgY3B1bWFza19jb3B5KGRlc2MtPmFmZmluaXR5LCBkZXNj
LT5hcmNoLmNwdV9tYXNrKTsKPj4gKyAgICAgICAgaWYgKCBtYXNrICkKPj4gKyAgICAgICAgICAg
IGNwdW1hc2tfY29weShkZXNjLT5hZmZpbml0eSwgbWFzayk7Cj4+ICsgICAgICAgIGVsc2UKPj4g
KyAgICAgICAgICAgIGNwdW1hc2tfc2V0YWxsKGRlc2MtPmFmZmluaXR5KTsKPiAKPiBJIGd1ZXNz
IGl0J3MgZmluZSB0byB1c2Ugc2V0YWxsIGluc3RlYWQgb2YgY29weWluZyB0aGUgY3B1IG9ubGlu
ZSBtYXAKPiBoZXJlPwoKSXQncyBub3Qgb25seSBmaW5lLCBpdCdzIGFjdHVhbGx5IG9uZSBvZiB0
aGUgZ29hbHM6IFRoaXMgd2F5IHlvdSBjYW4gc2V0CmFmZmluaXRpZXMgc3VjaCB0aGF0IHRoZXkg
d29uJ3QgbmVlZCBhZGp1c3RtZW50IGFmdGVyIGJyaW5naW5nIHVwCmFub3RoZXIgQ1BVLiBJJ3Zl
IGFkZGVkIGEgcmVzcGVjdGl2ZSBzZW50ZW5jZSB0byB0aGUgZGVzY3JpcHRpb24uCgo+IEFGQUlD
VCBfX2Fzc2lnbl9pcnFfdmVjdG9yIGFscmVhZHkgZmlsdGVycyBvZmZsaW5lIENQVXMgZnJvbSB0
aGUKPiBwYXNzZWQgbWFzay4KCkluZGVlZC4gQW5kIGFsbCBvdGhlciBpbnZvbHZlZCBjb2RlIHNo
b3VsZCwgdG9vLCBieSBub3cuIEkgdGhpbmsKdGhlcmUgaXMgYXQgbGVhc3Qgb25lIHBsYWNlIGxl
ZnQgc29tZXdoZXJlIHdoZXJlIHRoZSBvbmxpbmUgbWFwIGlzCnVzZWQgZm9yIHNldHRpbmcgYWZm
aW5pdGllcywgYnV0IEkgc3VwcG9zZSB0aGlzIGNhbiBiZSBkZWFsdCB3aXRoIGF0CmFub3RoZXIg
dGltZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
