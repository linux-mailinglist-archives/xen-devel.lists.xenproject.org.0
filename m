Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B114928
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 13:50:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNc4q-0001wE-Vu; Mon, 06 May 2019 11:46:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNc4p-0001w9-9e
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 11:46:35 +0000
X-Inumbo-ID: 8fbd42c6-6ff4-11e9-a2db-e32b0773e516
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fbd42c6-6ff4-11e9-a2db-e32b0773e516;
 Mon, 06 May 2019 11:46:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 05:46:18 -0600
Message-Id: <5CD01E86020000780022C229@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 05:46:14 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <20190505132740.GT1728@mail-itl>
 <a4435002-24ef-9565-f1fb-3de6c54b1fe7@suse.com>
 <5CD004F2020000780022C1B2@prv1-mh.provo.novell.com>
 <20190506102953.GW1728@mail-itl>
In-Reply-To: <20190506102953.GW1728@mail-itl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] {xen,
 dom0}_vga_console_info.u.vesa_lfb.lfb_base field too small
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDEyOjI5LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gQlRXIGFub3RoZXIgcHJvYmxlbSBJIGhhdmUgb24gdGhpcyBtYWNoaW5lIGlz
IHRoZSBmcmFtZWJ1ZmZlciBzaXplLiBJdCdzCj4gMzg0MCB4IDIxNjAsIHdoaWNoIGlzIGxhcmdl
ciB0aGFuIG1heCByZXNvbHV0aW9uIGhhcmRjb2RlZCBpbgo+IGRyaXZlcnMvdmlkZW8vbGZiLmMg
KDE5MjAgeCAxMjAwKS4gZWZpX2ZpbmRfZ29wX21vZGUoKSBjaG9vc2VzIHRoZQo+IGxhcmdlc3Qg
b25lLCBpZ25vcmluZyB0aGlzIGxpbWl0LiBPbiBvbmUgaGFuZCwgaXQgc2hvdWxkIHRha2UgdGhl
IGxpbWl0Cj4gaW50byBhY2NvdW50LCBidXQgb24gYW5vdGhlciwgaW5jcmVhc2luZyB0aGUgbGlt
aXQgbG9va3MgcXVpdGUgaGFybWxlc3MKPiAob3RoZXIgdGhhbiB0aGUgY29uc29sZSBpcyBxdWl0
ZSBzbG93KSBhbmQgbm90IGNoYW5naW5nIHRoZSBtb2RlIGR1cmluZwo+IGJvb3QgbG9va3MgYmV0
dGVyLgoKSWlyYyBpbiBhIHByaW9yIGRpc2N1c3Npb24gd2UgaGFkIGRlY2lkZWQgdG8gZHJvcCB0
aGUgbGltaXQgYWx0b2dldGhlcgooYW5kIGluIGZhY3QgYWxsIHRoZSBNQVhfKiB2YWx1ZXMgbGl2
aW5nIHRoZXJlKSwgYXMgdGhlcmUgd2FzIG5vdGhpbmcKZm91bmQgYWN0dWFsbHkgcmVxdWlyaW5n
IHRoZXJlIHRvIGJlIGEgbGltaXQuIFRoaXMgcHJvYmFibHkgd2FzIGluIHRoZQpjb250ZXh0IG9m
IHNvbWUgKHBlcmhhcHMgZHJhZnQgLyBSRkMpIHBhdGNoLCBzbyBJJ2QgZ3Vlc3Mgd2hvZXZlcgpp
dCB3YXMgdGhlbiBsb3N0IGludGVyZXN0IGFuZCBkaWRuJ3Qgc2VuZCBhIGZ1bGwgcGF0Y2ggYXMg
YWdyZWVkIHVwb24KZHVyaW5nIHRoYXQgZGlzY3Vzc2lvbi4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
