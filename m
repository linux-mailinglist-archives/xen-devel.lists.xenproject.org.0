Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA34A409
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 16:30:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdF4c-0003K1-JE; Tue, 18 Jun 2019 14:26:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdF4b-0003Jw-0K
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 14:26:57 +0000
X-Inumbo-ID: 1e96e4d2-91d5-11e9-a6ee-9b9a577e20f9
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e96e4d2-91d5-11e9-a6ee-9b9a577e20f9;
 Tue, 18 Jun 2019 14:26:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 08:26:53 -0600
Message-Id: <5D08F4AA020000780023953E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 08:26:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5D08ECBF02000078002394C6@prv1-mh.provo.novell.com>
 <5D08EF5A02000078002394E6@prv1-mh.provo.novell.com>
 <88205b2b-98c2-d512-c555-98bc16ae05ff@arm.com>
In-Reply-To: <88205b2b-98c2-d512-c555-98bc16ae05ff@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH for-4.11 1/2] XSM: adjust Kconfig names
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDE2OjExLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDE4LzA2LzIwMTkgMTU6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBTaW5jZSB0aGUgS2Nv
bmZpZyBvcHRpb24gcmVuYW1pbmcgd2FzIG5vdCBiYWNrcG9ydGVkLCB0aGUgbmV3IHVzZXMgb2YK
Pj4gaW52b2x2ZWQgQ09ORklHXyogc2V0dGluZ3Mgc2hvdWxkIGhhdmUgYmVlbiBhZG9wdGVkIHRv
IHRoZSBleGlzdGluZwo+PiBuYW1lcyBpbiB0aGUgWFNBLTI5NSBzZXJpZXMuIERvIHRoaXMgbm93
LCBhbHNvIGNoYW5naW5nIFhTTV9TSUxPIHRvIGp1c3QKPj4gU0lMTyB0byBiZXR0ZXIgbWF0Y2gg
aXRzIEZMQVNLIGNvdW50ZXJwYXJ0Lgo+PiAKPj4gVG8gYXZvaWQgYnJlYWtpbmcgdGhlIEtjb25m
aWcgbWVudSBzdHJ1Y3R1cmUgYWxzbyBhZGp1c3QgWFNNX1BPTElDWSdzCj4+IGRlcGVuZGVuY3kg
KGFzIHdhcyBhbHNvIHNpbGVudGx5IGRvbmUgb24gbWFzdGVyIGR1cmluZyB0aGUgcmVuYW1pbmcp
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IAo+IFNvcnJ5IGZvciB0aGUgYnJlYWthZ2UuIFRvIGF2b2lkIHN1Y2ggYmx1bmRlciBkdXJpbmcg
WFNBcywgd291bGQgaXQgYmUgcG9zc2libGUgCj4gdG8gdGVzdCB0aGVtIG9uIG9zc3Rlc3QgYmVm
b3JlIHRoZXkgYXJlIHB1Ymxpc2hlZD8KClRoYXQncyBhbiBvcHRpb24sIGJ1dCB3b3VsZCBjYXVz
ZSBmdXJ0aGVyIGRlbGF5cy4gSG93IGV4YWN0bHkgdG8KYXJyYW5nZSBmb3IgdGhpcyBJJ20gdGhl
IHdyb25nIG9uZSB0byBhc2ssIHRob3VnaC4KCkJ1dCBsZXQncyBmYWNlIGl0OiBUaGUgcGF0Y2gg
Y2hhbmdpbmcgS2NvbmZpZyBub3QgaGF2aW5nIGFwcGxpZWQKd2l0aG91dCBmdXp6IHNob3VsZCBo
YXZlIHRvbGQgd2hvZXZlciBkaWQgdGhlIGJhY2twb3J0IHRvIGxvb2sKbW9yZSBjbG9zZWx5LgoK
V2hhdCBJJ2QgbGlrZSB0byBhc2sgZm9yIGluIHRoZSBmdXR1cmUgaW4gYW55IGNhc2UgdGhvdWdo
IGlzIHRoYXQgYWZ0ZXIKcHVzaGluZyBzdHVmZiB0byBzdGFibGUgdHJlZXMgeW91IHdvdWxkIHBs
ZWFzZSBjaGVjayB0aGUgb3NzdGVzdApyZXBvcnRzLCBhbmQgaW4gY2FzZSBvZiByZWdyZXNzaW9u
cyBpbnZlc3QgYXQgbGVhc3Qgc29tZSB0aW1lIGludG8KZmlndXJpbmcgb3V0IHdoYXQgYnJva2Uu
IFJpZ2h0IG5vdywgZXZlbiB3aXRoIHRoZSBYU00gdGVzdHMKKGhvcGVmdWxseSkgdGFrZW4gY2Fy
ZSBvZiB0aGVyZSdzIHN0aWxsIGEgZmxvb2Qgb2YgYXJtaGYgZmFpbHVyZXMsIHdoaWNoCm1heSBv
ciBtYXkgbm90IGJlIGR1ZSB0byBlbnZpcm9ubWVudGFsIGlzc3Vlcy4KCj4gQWxzbywgZG8gd2Ug
bmVlZCB0byB1cGRhdGUgdGhlIGFkdmlzb3J5PwoKRHVubm8uIEkgZGlkbid0IGRvIGZ1bGwgYW5h
bHlzaXMgb2Ygd2hhdCBtYXkgZ28gd3JvbmcsIEkndmUganVzdCB3b3JrZWQKbXkgd2F5IGZhciBl
bm91Z2ggdG8gdW5kZXJzdGFuZCB3aGF0IG5lZWRzIGZpeGluZy4gV2hldGhlciBhbgp1cGRhdGUg
aXMgbmVlZGVkIGltbyBsYXJnZWx5IGRlcGVuZHMgb24gd2hldGhlciB0aGUgcHVycG9zZSBvZiB0
aGUKcGF0Y2hlcyB3YXNuJ3QgZnVsZmlsbGVkLiBQZW9wbGUgYWN0dWFsbHkgdXNpbmcgWFNNIHdp
bGwgbm90aWNlIHZlcnkKcXVpY2tseSB0aGF0IHRoaW5ncyBkb24ndCB3b3JrIGFueW1vcmUsIGFz
IGNhbiBiZSBzZWVuIGZyb20gdGhlCm9zc3Rlc3QgY2FzZXMuCgo+IEFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKVGhhbmtzLCBKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
