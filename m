Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3242A2E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 17:02:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb4ie-0001e5-9t; Wed, 12 Jun 2019 14:59:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yu3J=UL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hb4id-0001e0-73
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 14:59:19 +0000
X-Inumbo-ID: a55b305c-8d22-11e9-a69c-1bb2165bc6c3
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a55b305c-8d22-11e9-a69c-1bb2165bc6c3;
 Wed, 12 Jun 2019 14:59:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C42B2AEEE;
 Wed, 12 Jun 2019 14:59:14 +0000 (UTC)
To: Peter Zijlstra <peterz@infradead.org>
References: <20190612101228.23898-1-jgross@suse.com>
 <20190612114836.GI3436@hirez.programming.kicks-ass.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <74c04cc4-4b05-2bca-d788-ea3605853fcc@suse.com>
Date: Wed, 12 Jun 2019 16:59:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612114836.GI3436@hirez.programming.kicks-ass.net>
Content-Language: de-DE
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDYuMTkgMTM6NDgsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDEy
LCAyMDE5IGF0IDEyOjEyOjI4UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFdoZW4g
cnVubmluZyBhcyBhIFhlbiBndWVzdCBzZWxlY3RpbmcgIm5vc210IiBlaXRoZXIgdmlhIGNvbW1h
bmQgbGluZQo+PiBvciBpbXBsaWNpdGx5IHZpYSBkZWZhdWx0IHNldHRpbmdzIG1ha2VzIG5vIHNl
bnNlLCBhcyB0aGUgZ3Vlc3QgaGFzIG5vCj4+IGNsdWUgYWJvdXQgdGhlIHJlYWwgc3lzdGVtIHRv
cG9sb2d5IGl0IGlzIHJ1bm5pbmcgb24uIFdpdGggWGVuIGl0IGlzCj4+IHRoZSBoeXBlcnZpc29y
J3Mgam9iIHRvIGVuc3VyZSB0aGUgcHJvcGVyIGJ1ZyBtaXRpZ2F0aW9ucyBhcmUgYWN0aXZlCj4+
IHJlZ2FyZGluZyBzbXQgc2V0dGluZ3MuCj4+Cj4+IFNvIHdoZW4gcnVubmluZyBhcyBhIFhlbiBn
dWVzdCBzZXQgY3B1X3NtdF9jb250cm9sIHRvICJub3Qgc3VwcG9ydGVkIgo+PiBpbiBvcmRlciB0
byBhdm9pZCBkaXNhYmxpbmcgcmFuZG9tIHZjcHVzLgo+IAo+IElmIGl0IGRvZXNuJ3QgbWFrZSBz
ZW5zZTsgdGhlbiB0aGUgdG9wb2xvZ3kgc2hvdWxkIG5vdCBleHBvc2UgU01UCj4gdGhyZWFkcyBh
bmQgdGhlIGtub2Igd2lsbCBub3QgaGF2ZSBhbnkgZWZmZWN0LgoKWWVzLCB0aGF0J3MgdGhlIHRo
ZW9yeS4KCkkgYWdyZWUgY29tcGxldGVseSwgYnV0IHRoaXMgaXMgb25nb2luZyB3b3JrIHdoaWNo
IHdpbGwgbmVlZCBzb21lIG1vcmUKdGltZS4gSXQgcHJvYmFibHkgd291bGQgaGF2ZSBiZWVuIHJl
YWR5IGZvciBzb21lIHRpbWUgbm93LCBidXQgc29tZQpyZWNlbnQgcHJvY2Vzc29yIGJ1Z3MgcmVx
dWlyZWQgYSBzaGlmdCBpbiBwcmlvcml0aWVzIHdoYXQgdG8gZG8gZmlyc3QuCgpJbiBvcmRlciB0
byBydW4gYSBuZXcga2VybmVsIG9uIGV4aXN0aW5nIFhlbiB3ZSBuZWVkIHRoYXQgcGF0Y2ggdG8g
YXZvaWQKZGlzYWJsaW5nIHJhbmRvbSBjcHVzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
