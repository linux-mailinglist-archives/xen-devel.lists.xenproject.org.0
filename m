Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E755F69A16
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 19:45:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn4zp-0004Im-09; Mon, 15 Jul 2019 17:42:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TQSl=VM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hn4zn-0004If-GE
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 17:42:39 +0000
X-Inumbo-ID: ef1abbda-a727-11e9-96f1-8364249bd3e9
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef1abbda-a727-11e9-96f1-8364249bd3e9;
 Mon, 15 Jul 2019 17:42:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 31FDDAF0D;
 Mon, 15 Jul 2019 17:42:36 +0000 (UTC)
To: Andy Lutomirski <luto@kernel.org>, Andi Kleen <ak@linux.intel.com>
References: <20190715113739.17694-1-jgross@suse.com>
 <87y30zfe9z.fsf@linux.intel.com>
 <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <35d93381-7517-5741-0b81-0839dd46a1fa@suse.com>
Date: Mon, 15 Jul 2019 19:42:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
Content-Language: de-DE
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, X86 ML <x86@kernel.org>,
 Alok Kataria <akataria@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMTkgMTk6MjgsIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPiBPbiBNb24sIEp1bCAx
NSwgMjAxOSBhdCA5OjM0IEFNIEFuZGkgS2xlZW4gPGFrQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
Cj4+Cj4+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gVGhl
IGxvbmcgdGVybSBwbGFuIGhhcyBiZWVuIHRvIHJlcGxhY2UgWGVuIFBWIGd1ZXN0cyBieSBQVkgu
IFRoZSBmaXJzdAo+Pj4gdmljdGltIG9mIHRoYXQgcGxhbiBhcmUgbm93IDMyLWJpdCBQViBndWVz
dHMsIGFzIHRob3NlIGFyZSB1c2VkIG9ubHkKPj4+IHJhdGhlciBzZWxkb20gdGhlc2UgZGF5cy4g
WGVuIG9uIHg4NiByZXF1aXJlcyA2NC1iaXQgc3VwcG9ydCBhbmQgd2l0aAo+Pj4gR3J1YjIgbm93
IHN1cHBvcnRpbmcgUFZIIG9mZmljaWFsbHkgc2luY2UgdmVyc2lvbiAyLjA0IHRoZXJlIGlzIG5v
Cj4+PiBuZWVkIHRvIGtlZXAgMzItYml0IFBWIGd1ZXN0IHN1cHBvcnQgYWxpdmUgaW4gdGhlIExp
bnV4IGtlcm5lbC4KPj4+IEFkZGl0aW9uYWxseSBNZWx0ZG93biBtaXRpZ2F0aW9uIGlzIG5vdCBh
dmFpbGFibGUgaW4gdGhlIGtlcm5lbCBydW5uaW5nCj4+PiBhcyAzMi1iaXQgUFYgZ3Vlc3QsIHNv
IGRyb3BwaW5nIHRoaXMgbW9kZSBtYWtlcyBzZW5zZSBmcm9tIHNlY3VyaXR5Cj4+PiBwb2ludCBv
ZiB2aWV3LCB0b28uCj4+Cj4+IE5vcm1hbGx5IHdlIGhhdmUgYSBkZXByZWNhdGlvbiBwZXJpb2Qg
Zm9yIGZlYXR1cmUgcmVtb3ZhbHMgbGlrZSB0aGlzLgo+PiBZb3Ugd291bGQgbWFrZSB0aGUga2Vy
bmVsIHByaW50IGEgd2FybmluZyBmb3Igc29tZSByZWxlYXNlcywgYW5kIHdoZW4KPj4gbm8gdXNl
ciBjb21wbGFpbnMgeW91IGNhbiB0aGVuIHJlbW92ZS4gSWYgYSB1c2VyIGNvbXBsYWlucyB5b3Ug
Y2FuJ3QuCj4+Cj4gCj4gQXMgSSB1bmRlcnN0YW5kIGl0LCB0aGUga2VybmVsIHJ1bGVzIGRvIGFs
bG93IGNoYW5nZXMgbGlrZSB0aGlzIGV2ZW4KPiBpZiB0aGVyZSdzIGEgY29tcGxhaW50OiB0aGlz
IGlzIGEgcGF0Y2ggdGhhdCByZW1vdmVzIHdoYXQgaXMKPiBlZmZlY3RpdmVseSBoYXJkd2FyZSBz
dXBwb3J0LiAgSWYgdGhlIG1haW50ZW5hbmNlIGNvc3QgZXhjZWVkcyB0aGUKPiB2YWx1ZSwgdGhl
biByZW1vdmFsIGlzIGZhaXIgZ2FtZS4gIChPYnZpb3VzbHkgd2Ugd2VpZ2h0IHRoZSB2YWx1ZSB0
bwo+IHByZXNlcnZpbmcgY29tcGF0aWJpbGl0eSBxdWl0ZSBoaWdobHksIGJ1dCBpbiB0aGlzIGNh
c2UsIFhlbiBkcm9wcGVkCj4gMzItYml0IGhhcmR3YXJlIHN1cHBvcnQgYSBsb25nIHRpbWUgYWdv
LiAgSWYgdGhlIFhlbiBoeXBlcnZpc29yIHNheXMKPiB0aGF0IDMyLWJpdCBQViBndWVzdCBzdXBw
b3J0IGlzIGRlcHJlY2F0ZWQsIGl0J3MgZGVwcmVjYXRlZC4pCj4gCj4gVGhhdCBiZWluZyBzYWlk
LCBhIHdhcm5pbmcgbWlnaHQgbm90IGJlIGEgYmFkIGlkZWEuICBXaGF0J3MgdGhlCj4gY3VycmVu
dCBzdGF0dXMgb2YgdGhpcyBpbiB1cHN0cmVhbSBYZW4/CgpYZW4gc3RpbGwgc3VwcG9ydHMgdGhh
dC4KCldlIGhhdmUgYXNrZWQgZG93bnN0cmVhbSBmb3IgdGhlaXIgb3BpbmlvbiBhYm91dCBkcm9w
cGluZyAzMi1iaXQgUFYKZ3Vlc3Qgc3VwcG9ydCBpbiB0aGUga2VybmVsIGFib3V0IDEgeWVhciBh
Z28gYW5kIHRoZSBjb21tb24gYW5zd2VyIHdhczoKbm8gcHJvYmxlbSwgYnV0IGZvciB1c2VycyBz
dGlsbCB3YW50aW5nIDMyIGJpdCBndWVzdHMgd2Ugc2hvdWxkIHdhaXQKdW50aWwgUFZIIHN1cHBv
cnQgaXMgYXZhaWxhYmxlIGluIGFsbCByZWxhdGVkIHByb2R1Y3RzLiBHcnViMiB3YXMgdGhlCmxh
c3Qgb25lIG1pc3NpbmcgYW5kIGFzIGdydWIyIGhhcyByZWxlYXNlZCBhIHZlcnNpb24gd2l0aCBQ
Vkggc3VwcG9ydApJIHBvc3RlZCB0aGlzIHNtYWxsIHNlcmllcyBub3cuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
