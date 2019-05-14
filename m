Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790E1C99A
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 15:52:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQXod-0004KT-R9; Tue, 14 May 2019 13:49:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZXeY=TO=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1hQXoa-0004Jx-NU
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 13:49:57 +0000
X-Inumbo-ID: 2631c0ab-764f-11e9-8980-bc764e045a96
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2631c0ab-764f-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 13:49:54 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:3531:a6bb:df13:221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 5D4F220214;
 Tue, 14 May 2019 23:49:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1557841791; bh=KiD53xGuLk/snEYCu7gYQ274VZxIo5e98uUfPtHz2G0=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=B0dpwPJSISEc/6s5LRD+p5h6UswxWL9iXJ6DUmZQLc9tUlOjNJcgVz7+JPkaxhVs5
 KapBI364iScPlPkGLslpNsxFkekNbf3vuOfZLotZ00fg48wYRq8Ymf3wpVThfKLtl5
 ezj6xXaa/2hIbryFe8UTD3WUYx7vpI9K8nPKcXRs=
Date: Tue, 14 May 2019 23:49:46 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: George Dunlap <dunlapg@umich.edu>
Message-Id: <1557841786.2639.0@crc.id.au>
In-Reply-To: <CAFLBxZawmyFKLko0PhhfJHuVBdqzhkYzyQZAeo2Z9eTX=YkEPA@mail.gmail.com>
References: <1557743068.2372.0@crc.id.au>
 <CAFLBxZawmyFKLko0PhhfJHuVBdqzhkYzyQZAeo2Z9eTX=YkEPA@mail.gmail.com>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
Subject: Re: [Xen-devel] pygrub not starting first menuentry in Fedora 30
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDExOjQwIFBNLCBHZW9yZ2UgRHVubGFwIDxkdW5sYXBn
QHVtaWNoLmVkdT4gCndyb3RlOgo+IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0IDExOjI1IEFNIFN0
ZXZlbiBIYWlnaCA8bmV0d2l6QGNyYy5pZC5hdT4gCj4gd3JvdGU6Cj4+IAo+PiAgVGhlcmUgc2Vl
bXMgdG8gYmUgc29tZSBjaGFuZ2VzIGluIEZlZG9yYSAzMCB0aGF0IGNhdXNlIHRoZSBzZWNvbmQg
Cj4+IGJvb3QKPj4gIGVudHJ5IGluIGdydWIuY2ZnIHRvIGJlIGJvb3RlZCBpbnN0ZWFkIG9mIHRo
ZSBmaXJzdC4KPj4gCj4+ICBUaGlzIG1lYW5zIHRoYXQgRmVkb3JhIDMwIHN5c3RlbXMgZWl0aGVy
IGFsd2F5cyBib290IGludG8gYW4gb2xkZXIKPj4gIGtlcm5lbCwgb3IgaW4gdGhlIGNhc2Ugb2Yg
c3lzdGVtcyB3aXRoIG9ubHkgb25lIGtlcm5lbCBpbnN0YWxsZWQsIAo+PiB0aGUKPj4gIHJlc2N1
ZSBpbWFnZS4KPj4gCj4+ICBUaGVyZSBhbHNvIHNlZW1zIHRvIGJlIHNvbWUgbmV3IGlzc3VlcyB3
aXRoIHRoZSBtb3ZlIHRvIEJMU0NGRyAtCj4+ICBob3dldmVyIGl0IHNlZW1zIGEgbmV3IHJlcXVp
cmVtZW50IGlzIHRvIGhhdmUKPj4gIEdSVUJfRU5BQkxFX0JMU0NGRz0iZmFsc2UiIGluIC9ldGMv
ZGVmYXVsdC9ncnViLiBUaGlzIGNhdXNlcwo+PiAgZ3J1YjItbWtjb25maWcgdG8gd29yayBjb3Jy
ZWN0bHkgYW5kIHNwaXQgb3V0IGEgZ3J1Yi5jZmcgZmlsZSB0aGF0Cj4+ICBweWdydWIgY2FuIHRo
ZW4gdXNlLgo+PiAKPj4gIElzIHRoaXMgYSBidWcgaW4gcHlncnViLCBvciBhIHByb2JsZW0gd2l0
aCBob3cgRmVkb3JhIDMwIGdlbmVyYXRlcyBhCj4+ICBncnViLmNmZz8KPj4gCj4+ICBJIHRyaWVk
IHRvIHBpY2sgdGhyb3VnaCBweWdydWIgLSBidXQgY291bGRuJ3QgcXVpdGUgZm9sbG93IHRoZSAK
Pj4gcHl0aG9uCj4+ICBsb2dpYyB0byBzZWUgd2hlcmUgdGhlIGRlZmF1bHQgYm9vdCBvcHRpb24g
aXMgc2VsZWN0ZWQuCj4gCj4gQUZBSUNULCB0aGUgYmFzaWMgaXNzdWUgaXMgdGhhdCBweWdydWIg
aXMgYSBwYXJ0aWFsIHJlLWltcGxlbWVudGF0aW9uCj4gb2YgZ3J1YiwgYW5kIGhhc24ndCByZS1p
bXBsZW1lbnRlZCB0aGUgYmxzY2ZnIGZ1bmN0aW9uYWxpdHkuCgpJIGRvbid0IHRoaW5rIHRoaXMg
aXMgYW4gaXNzdWUuIFdoZW4gdXNpbmcgJ0dSVUJfRU5BQkxFX0JMU0NGRz1mYWxzZScgCmluIC9l
dGMvZGVmYXVsdC9ncnViLCB0aGUgZ3J1YiBjb25maWcgZmlsZSBpcyBnZW5lcmF0ZWQgY29ycmVj
dGx5IGFuZCAKd29ya3MgYXMgZXhwZWN0ZWQuIFRoZSBwcm9ibGVtIGlzIG5vdCB0aGF0IGl0IGRv
ZXNuJ3Qgd29yaywgYnV0IApzb21ldGhpbmcgaXMgY2F1c2luZyBhbiBvZmZzZXQgaW4gdGhlIGRl
ZmF1bHQgbWVudSBpdGVtIChhbG1vc3QgbGlrZSBhbiAKb2ZmLWJ5LW9uZSkgdGhhdCBjYXVzZXMg
dGhlICpzZWNvbmQqIGVudHJ5IGluIHRoZSBncnViLmNmZyB0byBib290LgoKPiBUaGUgKm1vc3Qg
cm9idXN0KiBzb2x1dGlvbiBnb2luZyBmb3J3YXJkIGlzIGFsd2F5cyBnb2luZyB0byBiZSB0byB1
c2UKPiBncnViLXhlbiAoQUtBIHB2Z3J1YjIpIGluc3RlYWQgb2YgcHlncnViLiAgZ3J1Yi14ZW4g
aXMgYSBwb3J0IG9mIHRoZQo+IGFjdHVhbCBncnViIHByb2plY3QgdG8gcnVuIGFzIGEgUFYgZ3Vl
c3QsIGFuZCBzbyB3aWxsIGFsd2F5cyBiZSAgdGhlCj4gbW9zdCBjb21wYXRpYmxlIHdpdGggdXBz
dHJlYW0gZ3J1Yi4KPiAKPiBOb3Qgc3VyZSB3aG8ncyAiaW4gY2hhcmdlIiBvZiBweWdydWIgZW5v
dWdoIHRvIHRlYWNoIGl0IGhvdyB0byB1c2UgCj4gYmxzY2ZnLgoKSSdtIG5vdCBzdXJlIHRoZXJl
J3MgYSBodWdlIHJ1c2ggZm9yIHRoaXMuLi4gSWYgdXBzdHJlYW0gZ3J1YiAKaW5zdGFsbGVycyBj
aGVja2VkIHRvIHNlZSBpZiBpdCB3YXMgaW5zdGFsbGluZyBvbiBhIFhlbiBEb21VLCB0aGVuIHNl
dCAKR1JVQl9FTkFCTEVfQkxTQ0ZHPWZhbHNlIGJ5IGRlZmF1bHQgLSB0aGUgcmVtYWluaW5nIGZp
eCBzaG91bGQgYmUgCnJhdGhlciBzaW1wbGUgdG8gZmlndXJlIG91dCAtIGFmdGVyIGFsbCwgZnVu
Y3Rpb25hbGl0eSBpcyBjb3JyZWN0IC0gCmFwYXJ0IGZyb20gdGhlIHdyb25nIGVudHJ5IGJlaW5n
IHNlbGVjdGVkIGJ5IGRlZmF1bHQuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
