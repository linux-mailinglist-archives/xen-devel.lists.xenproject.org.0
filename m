Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7684A4C8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 17:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdFfA-0006zF-Vx; Tue, 18 Jun 2019 15:04:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdFf9-0006zA-2T
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 15:04:43 +0000
X-Inumbo-ID: 65ecbbcc-91da-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 65ecbbcc-91da-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 15:04:41 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 09:04:40 -0600
Message-Id: <5D08FD85020000780023958C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 09:04:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5D08ECBF02000078002394C6@prv1-mh.provo.novell.com>
 <5D08EF5A02000078002394E6@prv1-mh.provo.novell.com>
 <88205b2b-98c2-d512-c555-98bc16ae05ff@arm.com>
 <5D08F4AA020000780023953E@prv1-mh.provo.novell.com>
 <d5d5624b-4dfe-9160-dcec-a1dfe70041b7@arm.com>
In-Reply-To: <d5d5624b-4dfe-9160-dcec-a1dfe70041b7@arm.com>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDE2OjQ0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDE4LzA2LzIwMTkgMTU6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBXaGF0IEknZCBsaWtl
IHRvIGFzayBmb3IgaW4gdGhlIGZ1dHVyZSBpbiBhbnkgY2FzZSB0aG91Z2ggaXMgdGhhdCBhZnRl
cgo+PiBwdXNoaW5nIHN0dWZmIHRvIHN0YWJsZSB0cmVlcyB5b3Ugd291bGQgcGxlYXNlIGNoZWNr
IHRoZSBvc3N0ZXN0Cj4+IHJlcG9ydHMsIGFuZCBpbiBjYXNlIG9mIHJlZ3Jlc3Npb25zIGludmVz
dCBhdCBsZWFzdCBzb21lIHRpbWUgaW50bwo+PiBmaWd1cmluZyBvdXQgd2hhdCBicm9rZS4gUmln
aHQgbm93LCBldmVuIHdpdGggdGhlIFhTTSB0ZXN0cwo+PiAoaG9wZWZ1bGx5KSB0YWtlbiBjYXJl
IG9mIHRoZXJlJ3Mgc3RpbGwgYSBmbG9vZCBvZiBhcm1oZiBmYWlsdXJlcywgd2hpY2gKPj4gbWF5
IG9yIG1heSBub3QgYmUgZHVlIHRvIGVudmlyb25tZW50YWwgaXNzdWVzLgo+IAo+IEkgdXN1YWxs
eSBsb29rIG92ZXIgb3NzdGVzdCBidXQgZmFpbCB0byBkZXRlY3QgdGhpcyB3YXMgYW4gaXNzdWUg
YmVjYXVzZSBvZiB0aGUgCj4gWFNBcy4gUmVnYXJkaW5nIHRoZSBvdGhlciBhcm1oZiBmYWlsdXJl
LCBJYW4gYWxyZWFkeSBwb2ludGVkIG91dCBvbiBJUkMuCj4gCj4gSG93ZXZlciwgSSB3aWxsIG5v
dCBoYXZlIHRpbWUgdG8gbG9vayBhdCBpdCBiZWZvcmUgWGVuIFN1bW1pdC4gTWF5YmUgU3RlZmFu
byAKPiBjYW4/CgpOb3QgYmVmb3JlIHRoZSBzdW1taXQ/IFRoYXQncyBzdGlsbCBhbG1vc3QgYSBt
b250aCBvdXQuIFdlIHJlYWxseSB3YW50CnRvIGdldCA0LjExLjIgYW5kIGFsc28gNC4xMC40IG91
dCB0aGUgZG9vciBiZWZvcmUgdGhhdC4KCj4+PiBBbHNvLCBkbyB3ZSBuZWVkIHRvIHVwZGF0ZSB0
aGUgYWR2aXNvcnk/Cj4+IAo+PiBEdW5uby4gSSBkaWRuJ3QgZG8gZnVsbCBhbmFseXNpcyBvZiB3
aGF0IG1heSBnbyB3cm9uZywgSSd2ZSBqdXN0IHdvcmtlZAo+PiBteSB3YXkgZmFyIGVub3VnaCB0
byB1bmRlcnN0YW5kIHdoYXQgbmVlZHMgZml4aW5nLiBXaGV0aGVyIGFuCj4+IHVwZGF0ZSBpcyBu
ZWVkZWQgaW1vIGxhcmdlbHkgZGVwZW5kcyBvbiB3aGV0aGVyIHRoZSBwdXJwb3NlIG9mIHRoZQo+
PiBwYXRjaGVzIHdhc24ndCBmdWxmaWxsZWQuIFBlb3BsZSBhY3R1YWxseSB1c2luZyBYU00gd2ls
bCBub3RpY2UgdmVyeQo+PiBxdWlja2x5IHRoYXQgdGhpbmdzIGRvbid0IHdvcmsgYW55bW9yZSwg
YXMgY2FuIGJlIHNlZW4gZnJvbSB0aGUKPj4gb3NzdGVzdCBjYXNlcy4KPiAKPiBBRkFJQ1QsIEFy
bSBkb2VzIG5vdCBzZWVtIHRvIGJlIGFmZmVjdGVkIGJ5IHRoZSBwcm9ibGVtIChhdCBsZWFzdCBv
c3N0ZXN0IGRvZXMgCj4gbm90IGNvbXBsYWluKS4gSSB3b3VsZCBub3QgZXhwZWN0IHg4NiB1c2Vy
cyB0byBtZXJnZSB0aG9zZSBwYXRjaCwgc28gbWF5YmUgaXQgCj4gc2hvdWxkIGJlIG9rLgoKV2Vs
bCwgdGhlIGJyZWFrYWdlIHdhcyBpbiB0aGUgb25lIGNhc2Ugd2hlcmUgU0lMTyBtb2RlIGFjdHVh
bGx5CmRpc2FsbG93cyB3aGF0IHRoZSB0ZXN0IGlzIHNwZWNpZmljYWxseSBhYm91dCAtIHFlbXUg
cnVubmluZyBpbiBhCnN0dWJkb20sIGFuZCBoZW5jZSBuZWVkaW5nIHRvIGNvbW11bmljYXRlIHdp
dGggdGhlIGFjdHVhbCBndWVzdC4KSSBkb24ndCB0aGluayB0aGVyZSdzIGFueSBzaW1pbGFyIHRl
c3QgdG8gdGhpcyBmb3IgQXJtIGluIG9zc3Rlc3QuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
