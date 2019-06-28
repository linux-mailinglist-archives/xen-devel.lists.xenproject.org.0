Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0F594D5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 09:27:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hglDq-0002fO-UQ; Fri, 28 Jun 2019 07:23:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=droh=U3=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hglDp-0002fJ-ED
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 07:23:01 +0000
X-Inumbo-ID: 8db585f2-9975-11e9-8980-bc764e045a96
Received: from gandi.net (unknown [217.70.182.73])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8db585f2-9975-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 07:22:58 +0000 (UTC)
Received: from diconico07.gandi.net (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id 5DDD51604B6;
 Fri, 28 Jun 2019 07:22:57 +0000 (UTC)
Date: Fri, 28 Jun 2019 09:22:57 +0200
From: Nicolas Belouin <nicolas.belouin@gandi.net>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190628072257.nejiniwndjcwnii6@diconico07.gandi.net>
References: <20190627075834.14469-1-nicolas.belouin@gandi.net>
 <644e478e-41f5-603b-cb9a-03f14f690923@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <644e478e-41f5-603b-cb9a-03f14f690923@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Fix type issues with
 recent Go version
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDYgMTc6MjQsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gNi8yNy8xOSA4OjU4IEFN
LCBOaWNvbGFzIEJlbG91aW4gd3JvdGU6Cj4gPiBHbyBpcyBkb2luZyBtb3JlIHR5cGUgY2hlY2sg
KGV2ZW4gd2hlbiB1c2luZyBDR28pLCBzbyB0aGVzZSBpbmNvcnJlY3QKPiA+IHVzZSBvZiBgdW5z
YWZlLlBvaW50ZXJgIGFzIHdlbGwgYXMgdGhlIGxhY2sgb2YgYHVuc2FmZS5Qb2ludGVyYCBmb3IK
PiA+IHRoZXNlIGNhbGxzIG5vIGxvbmdlciBjb21waWxlIHdpdGggcmVjZW50IEdvIHZlcnNpb25z
Lgo+ID4gCj4gPiBUaGlzIGRvZXMgKm5vdCogYnJlYWsgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVy
IEdvIHZlcnNpb24uCj4gTmVlZCBhIFNvQiBoZXJlLgoKSW5kZWVkIEkgbWlzc2VkIHRoYXQgb25l
LgoKPiAKPiBBbHNvLCBJIHRoaW5rIGEgc2xpZ2h0bHkgbW9yZSBkZXNjcmlwdGl2ZSBjb21taXQg
bWVzc2FnZSB3b3VsZCBiZQo+IGhlbHBmdWw7IHNvbWV0aGluZyBsaWtlOgo+IAo+IC0tLQo+IE5l
d2VyIHZlcnNpb25zIG9mIEdvIGhhdmUgYmVjb21lIHN0cmljdGVyIG9uIGFjY2VwdGFibGUgcG9p
bnRlcgo+IGNvbnZlcnNpb25zLiAgU3BlY2lmaWNhbGx5LCB0aGUgZm9sbG93aW5nIHR3byBjb252
ZXJzaW9ucyBhcmUgbm8gbG9uZ2VyCj4gYWxsb3dlZDoKPiAKPiAtIHVuc2FmZS5Qb2ludGVyIGJl
aW5nIGF1dG9tYXRpY2FsbHkgY2FzdCB0byBhbm90aGVyIHR5cGUKPiAtIEEgcG9pbnRlciB0eXBl
IG90aGVyIHRoYW4gdW5zYWZlLlBvaW50ZXIgYmVpbmcgYXV0b21hdGljYWxseSBjYXN0IHRvIEMK
PiB2b2lkICoKPiAKPiBGaXggdGhpcyBieSBhZGRpbmcgZXhwbGljaXQgY2FzdHMgd2hlcmUgbmVj
ZXNzYXJ5Lgo+IC0tLQoKVGhpcyBpcyBpbmRlZWQgbW9yZSB1bmRlcnN0YW5kYWJsZSwgaW4gZmFj
dCBHb2xhbmcgZG9lcyBub3QgYWNjZXB0IGFueQppbXBsaWNpdCBjb252ZXJzaW9uIGFuZCB0aGVz
ZSB3b3JraW5nIHdlcmUgbW9yZSBsaWtlbHkgYSBidWcgaW4gQ0dvLiBJCndpbGwgdGFrZSB5b3Vy
IHN1Z2dlc3RlZCBjb21taXQgbWVzc2FnZSBhcyBhIGJhc2UgZm9yIGEgVjIKCj4gCj4gPiAtLS0K
PiA+ICB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCA4ICsrKystLS0tCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbwo+ID4gaW5kZXggNTM1MzRkMDQ3ZS4uZTI4MTMyOGQ0
MyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwo+ID4g
KysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCj4gPiBAQCAtODU0LDcgKzg1
NCw3IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgT3BlbigpIChlcnIgZXJyb3IpIHsKPiA+ICAJfQo+
ID4gIAo+ID4gIAlyZXQgOj0gQy5saWJ4bF9jdHhfYWxsb2MoJkN0eC5jdHgsIEMuTElCWExfVkVS
U0lPTiwKPiA+IC0JCTAsIHVuc2FmZS5Qb2ludGVyKEN0eC5sb2dnZXIpKQo+ID4gKwkJMCwgKCpD
LnN0cnVjdF94ZW50b29sbG9nX2xvZ2dlcikodW5zYWZlLlBvaW50ZXIoQ3R4LmxvZ2dlcikpKQo+
ID4gIAo+ID4gIAlpZiByZXQgIT0gMCB7Cj4gPiAgCQllcnIgPSBFcnJvcigtcmV0KQo+ID4gQEAg
LTg2OSw3ICs4NjksNyBAQCBmdW5jIChDdHggKkNvbnRleHQpIENsb3NlKCkgKGVyciBlcnJvcikg
ewo+ID4gIAlpZiByZXQgIT0gMCB7Cj4gPiAgCQllcnIgPSBFcnJvcigtcmV0KQo+ID4gIAl9Cj4g
PiAtCUMueHRsX2xvZ2dlcl9kZXN0cm95KHVuc2FmZS5Qb2ludGVyKEN0eC5sb2dnZXIpKQo+ID4g
KwlDLnh0bF9sb2dnZXJfZGVzdHJveSgoKkMuc3RydWN0X3hlbnRvb2xsb2dfbG9nZ2VyKSh1bnNh
ZmUuUG9pbnRlcihDdHgubG9nZ2VyKSkpCj4gCj4gSSdtIHdvbmRlcmluZyBpZiBhIGJldHRlciBh
cHByb2FjaCBoZXJlIHdvdWxkIGJlIHRvIGhhdmUgQ3R4LmxvZ2dlciBiZQo+IHR5cGUgQy54ZW50
b29sbG9nX2xvZ2dlciwgYW5kIGp1c3QgZG8gdGhlIGNhc3QgZnJvbQo+IHhlbnRvb2xsb2dfbG9n
Z2VyX3N0ZGlvc3RyZWFtIG9uY2Ugd2hlbiBjcmVhdGluZyB0aGUgbG9nZ2VyLgoKVGhpcyBsb29r
cyBsaWtlIGEgYmV0dGVyIGFwcHJvYWNoIGFzIEN0eCBzaG91bGQgbm90IGV4cGVjdCBhIHNwZWNp
ZmljCnhlbnRvb2xsb2dfbG9nZ2VyIHR5cGUgKGV2ZW4gdGhvdWdoIHRoZXJlIGlzIG9ubHkgb25l
IGZvciBub3cpCgo+IAo+IFRoZSBvdGhlciB0d28gY2hhbmdlcyBsb29rIGdvb2QsIHRoYW5rcy4K
PiAKPiAgLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
