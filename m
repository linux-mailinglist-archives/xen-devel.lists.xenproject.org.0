Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471C688EF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 14:34:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn09Y-0003VS-EC; Mon, 15 Jul 2019 12:32:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MlGE=VM=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1hn09W-0003VM-S0
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 12:32:23 +0000
X-Inumbo-ID: 96a394e2-a6fc-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 96a394e2-a6fc-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IZmADf5/xR5R3mmqabrQ4fHdojbS9pEGiQhr85URq6M=; b=aEybarIkTFSF6XayXEm9oTybN
 bRM340R6NHNLm2LEYd9DXp+8WWywggz0CuALF0J1wDzPuVxYFHl5h/Jw4SbiTUAtP+p3zqM/a6Lca
 uWAH/o4UXolDp6pR2+auZSFsE7irfkrG9l09A5kXNeTbBAkAuv9b3pSh6LV69G8TU2UFR19P7dSHs
 BP/piakMXAWFL9OGZtkRexsPfwx3DEGrBE5V6cPibP0GfHeoDmoIkzc3BID6B4OgeBLXPSMp7WZ2w
 RoSrOscOWXXcDUJRqOdN97QTU1LKAIpoBiSQ+oHxTwaZ5aC5ON7p97SNIWay0hnMAhwYsz9qoBbqS
 6ZKU8MzGQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hn09K-0002Kz-NY; Mon, 15 Jul 2019 12:32:10 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E2AA820144520; Mon, 15 Jul 2019 14:32:07 +0200 (CEST)
Date: Mon, 15 Jul 2019 14:32:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190715123207.GE3419@hirez.programming.kicks-ass.net>
References: <20190715113739.17694-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715113739.17694-1-jgross@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 0/2] Remove 32-bit Xen PV guest support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 Alok Kataria <akataria@vmware.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDE6Mzc6MzdQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUaGUgbG9uZyB0ZXJtIHBsYW4gaGFzIGJlZW4gdG8gcmVwbGFjZSBYZW4gUFYgZ3Vl
c3RzIGJ5IFBWSC4gVGhlIGZpcnN0Cj4gdmljdGltIG9mIHRoYXQgcGxhbiBhcmUgbm93IDMyLWJp
dCBQViBndWVzdHMsIGFzIHRob3NlIGFyZSB1c2VkIG9ubHkKPiByYXRoZXIgc2VsZG9tIHRoZXNl
IGRheXMuIFhlbiBvbiB4ODYgcmVxdWlyZXMgNjQtYml0IHN1cHBvcnQgYW5kIHdpdGgKPiBHcnVi
MiBub3cgc3VwcG9ydGluZyBQVkggb2ZmaWNpYWxseSBzaW5jZSB2ZXJzaW9uIDIuMDQgdGhlcmUg
aXMgbm8KPiBuZWVkIHRvIGtlZXAgMzItYml0IFBWIGd1ZXN0IHN1cHBvcnQgYWxpdmUgaW4gdGhl
IExpbnV4IGtlcm5lbC4KPiBBZGRpdGlvbmFsbHkgTWVsdGRvd24gbWl0aWdhdGlvbiBpcyBub3Qg
YXZhaWxhYmxlIGluIHRoZSBrZXJuZWwgcnVubmluZwo+IGFzIDMyLWJpdCBQViBndWVzdCwgc28g
ZHJvcHBpbmcgdGhpcyBtb2RlIG1ha2VzIHNlbnNlIGZyb20gc2VjdXJpdHkKPiBwb2ludCBvZiB2
aWV3LCB0b28uCj4gCj4gSnVlcmdlbiBHcm9zcyAoMik6Cj4gICB4ODYveGVuOiByZW1vdmUgMzIt
Yml0IFhlbiBQViBndWVzdCBzdXBwb3J0Cj4gICB4ODYvcGFyYXZpcnQ6IHJlbW92ZSAzMi1iaXQg
c3VwcG9ydCBmcm9tIFBBUkFWSVJUX1hYTAoKSG9vcmF5IQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
