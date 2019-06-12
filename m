Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4206D4225C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 12:23:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb0Lk-0000Dw-L9; Wed, 12 Jun 2019 10:19:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hb0Lj-0000Dq-Nt
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 10:19:23 +0000
X-Inumbo-ID: 8bb9f2d6-8cfb-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8bb9f2d6-8cfb-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 10:19:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 04:19:21 -0600
Message-Id: <5D00D1A602000078002376A9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 04:19:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190612101228.23898-1-jgross@suse.com>
In-Reply-To: <20190612101228.23898-1-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/xen: disable nosmt in Xen guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org,
 mingo@redhat.com, Borislav Petkov <bp@alien8.de>, hpa@zytor.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEyLjA2LjE5IGF0IDEyOjEyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBXaGVu
IHJ1bm5pbmcgYXMgYSBYZW4gZ3Vlc3Qgc2VsZWN0aW5nICJub3NtdCIgZWl0aGVyIHZpYSBjb21t
YW5kIGxpbmUKPiBvciBpbXBsaWNpdGx5IHZpYSBkZWZhdWx0IHNldHRpbmdzIG1ha2VzIG5vIHNl
bnNlLCBhcyB0aGUgZ3Vlc3QgaGFzIG5vCj4gY2x1ZSBhYm91dCB0aGUgcmVhbCBzeXN0ZW0gdG9w
b2xvZ3kgaXQgaXMgcnVubmluZyBvbi4gV2l0aCBYZW4gaXQgaXMKPiB0aGUgaHlwZXJ2aXNvcidz
IGpvYiB0byBlbnN1cmUgdGhlIHByb3BlciBidWcgbWl0aWdhdGlvbnMgYXJlIGFjdGl2ZQo+IHJl
Z2FyZGluZyBzbXQgc2V0dGluZ3MuCgpJIGRvbid0IGFncmVlIHdpdGggdGhlIHNlY29uZCBzZW50
ZW5jZTogSXQgaXMgaW4gcHJpbmNpcGxlIGZpbmUgZm9yIHRoZQpoeXBlcnZpc29yIHRvIGV4cG9z
ZSBIVCAoaS5lLiBub3QgZGlzYWJsZSBpdCBhcyBidWcgbWl0aWdhdGlvbiksIGFuZApsZWF2ZSBp
dCB0byB0aGUgZ3Vlc3Qga2VybmVscyB0byBwcm90ZWN0IHRoZW1zZWx2ZXMuIFdlJ3JlIGp1c3Qg
bm90CmF0IHRoZSBwb2ludCB5ZXQgd2hlcmUgWGVuIG9mZmVycyBzdWZmaWNpZW50IC8gcmVsaWFi
bGUgZGF0YSB0byBndWVzdAprZXJuZWxzIHRvIGRvIHNvLCBzbyBfZm9yIHRoZSB0aW1lIGJlaW5n
XyB3aGF0IHlvdSBzYXkgaXMgY29ycmVjdC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
