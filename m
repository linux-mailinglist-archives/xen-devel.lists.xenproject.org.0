Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20323C21
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 17:29:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSkBa-0004td-JT; Mon, 20 May 2019 15:26:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSkBZ-0004tS-3g
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:26:45 +0000
X-Inumbo-ID: ac2966f5-7b13-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ac2966f5-7b13-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 15:26:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 20 May 2019 09:26:43 -0600
Message-Id: <5CE2C72D0200007800230AD1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 20 May 2019 09:26:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE927002000078002300BA@prv1-mh.provo.novell.com>
 <20190520140449.5ihqctltaeiegqiz@Air-de-Roger>
In-Reply-To: <20190520140449.5ihqctltaeiegqiz@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 13/15] x86/IRQ: tighten vector checks
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

Pj4+IE9uIDIwLjA1LjE5IGF0IDE2OjA0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTWF5IDE3LCAyMDE5IGF0IDA0OjUyOjMyQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBVc2UgdmFsaWRfaXJxX3ZlY3RvcigpIHJhdGhlciB0aGFuICI+IDAiLgo+PiAKPj4g
QWxzbyByZXBsYWNlIGFuIG9wZW4tY29kZWQgdXNlIG9mIElSUV9WRUNUT1JfVU5BU1NJR05FRC4K
Pj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAK
PiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpU
aGFua3MuCgo+IFRoZSBxdWVzdGlvbiBJIGhhdmUgYmVsb3cgaXMgbm90IGRpcmVjdGx5IHJlbGF0
ZWQgdG8gdGhlIHVzYWdlIG9mCj4gdmFsaWRfaXJxX3ZlY3RvciwgYnV0IHJhdGhlciB3aXRoIHRo
ZSBleGlzdGluZyBjb2RlLgo+IAo+PiBAQCAtNDUyLDE1ICs0NTIsMTggQEAgc3RhdGljIHZtYXNr
X3QgKmlycV9nZXRfdXNlZF92ZWN0b3JfbWFzawo+PiAgICAgICAgICAgICAgaW50IHZlY3RvcjsK
Pj4gICAgICAgICAgICAgIAo+PiAgICAgICAgICAgICAgdmVjdG9yID0gaXJxX3RvX3ZlY3Rvcihp
cnEpOwo+PiAtICAgICAgICAgICAgaWYgKCB2ZWN0b3IgPiAwICkKPj4gKyAgICAgICAgICAgIGlm
ICggdmFsaWRfaXJxX3ZlY3Rvcih2ZWN0b3IpICkKPj4gICAgICAgICAgICAgIHsKPj4gLSAgICAg
ICAgICAgICAgICBwcmludGsoWEVOTE9HX0lORk8gIklSUSAlZCBhbHJlYWR5IGFzc2lnbmVkIHZl
Y3RvciAlZFxuIiwKPj4gKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0lORk8gIklSUSVk
IGFscmVhZHkgYXNzaWduZWQgdmVjdG9yICUwMnhcbiIsCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGlycSwgdmVjdG9yKTsKPj4gICAgICAgICAgICAgICAgICAKPj4gICAgICAgICAgICAgICAg
ICBBU1NFUlQoIXRlc3RfYml0KHZlY3RvciwgcmV0KSk7Cj4+ICAKPj4gICAgICAgICAgICAgICAg
ICBzZXRfYml0KHZlY3RvciwgcmV0KTsKPj4gICAgICAgICAgICAgIH0KPj4gKyAgICAgICAgICAg
IGVsc2UgaWYgKCB2ZWN0b3IgIT0gSVJRX1ZFQ1RPUl9VTkFTU0lHTkVEICkKPj4gKyAgICAgICAg
ICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIklSUSVkIG1hcHBlZCB0byBib2d1cyB2ZWN0
b3IgJTAyeFxuIiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaXJxLCB2ZWN0b3IpOwo+IAo+
IE1heWJlIGFkZCBhbiBhc3NlcnRfdW5yZWFjaGFibGUgaGVyZT8gSXQgc2VlbXMgcmVhbGx5IGJv
Z3VzIHRvIGNhbGwKPiBpcnFfZ2V0X3VzZWRfdmVjdG9yX21hc2sgd2l0aCBhbiB1bmFzc2lnbmVk
IHZlY3Rvci4KCkhvdyB0aGF0PyBUaGlzIHdvdWxkIGUuZy4gZ2V0IGNhbGxlZCB0aGUgdmVyeSBm
aXJzdCB0aW1lIGEgdmVjdG9yCmlzIHRvIGJlIGFzc2lnbmVkLiBCdXQgSSdtIGFmcmFpZCBJJ20g
YSBsaXR0bGUgY29uZnVzZWQgYW55d2F5IGJ5CnRoZSB3b3JkaW5nIHlvdSB1c2UgLSBhZnRlciBh
bGwgdGhpcyBpcyB0aGUgY29kZSBwYXRoIGRlYWxpbmcgd2l0aAphbiBJUlEgX25vdF8gYmVpbmcg
bWFya2VkIGFzIGhhdmluZyBubyB2ZWN0b3IgYXNzaWduZWQsIGJ1dAphbHNvIG5vdCBoYXZpbmcg
YSB2YWxpZCB2ZWN0b3IuCgo+IEJ1dCBJJ20gbm90IHN1cmUgSSBmdWxseSB1bmRlcnN0YW5kIHRo
aXMgcGllY2Ugb2YgY29kZSwgbmVpdGhlciB3aHkgYQo+IHZlY3RvciB3aXRob3V0IGEgSVJRIGFz
c2lnbmVkIGNhbiBoYXZlIGEgdmVjdG9yIGFzc2lnbmVkLiBJcyB0aGlzCj4gY292ZXJpbmcgdXAg
Zm9yIHRoZSBsYWNrIG9mIGNsZWFudXAgZWxzZXdoZXJlPwoKSSBkb24ndCB0aGluayBzbywgbm8u
IEhvd2V2ZXIsIHVzZXJzIG9mIGlycV90b192ZWN0b3IoKSBuZWVkIHRvCmJlIGNhcmVmdWw6IFRo
ZSBmdW5jdGlvbiBjYW4gbGVnaXRpbWF0ZWx5IHJldHVybiAwIChiZXNpZGVzCklSUV9WRUNUT1Jf
VU5BU1NJR05FRCkgYXMgYW4gZXJyb3IgaW5kaWNhdGlvbi4gSSd2ZSB0cmllZCB0bwpkbyBhd2F5
IHdpdGggdGhpcywgYnV0IHF1aWNrbHkgcmVhbGl6ZWQgSSdkIGJldHRlciBub3QgZG8gc28uIEkn
dmUKbm90IHNlZW4gdGhlIHByaW50aygpIHRyaWdnZXIsIGJ1dCBJJ2QgcmF0aGVyIHNlZSB0aGUg
cHJpbnRrKCkgbG9nCmEgbWVzc2FnZSB0ZWxsaW5nIHVzIHRoYXQgd2UgYWxzbyBuZWVkIHRvIGV4
Y2x1ZGUgdmVjdG9yIDAgdGhhbgphIHdyb25nIGFzc2VydGlvbiB0byBmaXJlLgoKSmFuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
