Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B03862FE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 15:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hviJe-0008Ac-Ib; Thu, 08 Aug 2019 13:18:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hviJe-0008AX-2u
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:18:50 +0000
X-Inumbo-ID: 0dff9376-b9df-11e9-8f46-539ee2e56e14
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0dff9376-b9df-11e9-8f46-539ee2e56e14;
 Thu, 08 Aug 2019 13:18:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49A2C15A2;
 Thu,  8 Aug 2019 06:18:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 965343F694;
 Thu,  8 Aug 2019 06:18:46 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
 <20190808110107.kh2jbl2eztgzong3@Air-de-Roger>
 <e5483aef-cb1f-4fa0-eea7-59005ababa38@gmail.com>
 <2dfcda6f-c5da-7b86-429f-f11827ad1b08@arm.com>
 <a6d060d0-663e-83ac-e880-813db882b677@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <13592722-6a0c-ac81-1402-3f09e662ca4d@arm.com>
Date: Thu, 8 Aug 2019 14:18:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a6d060d0-663e-83ac-e880-813db882b677@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Let the IOMMU be accessible by
 Dom0 if forcibly disabled in Xen
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOC8wOC8yMDE5IDE0OjAzLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gSGksIEp1bGllbiwg
Um9nZXIuCgpIaSwKCj4gCj4gCj4gCj4+Pgo+Pj4KPj4+PiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBh
dCAwMTo1MzoyM1BNICswMzAwLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4+Pj4gRnJv
bTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+
Pj4+Pgo+Pj4+PiBEb24ndCBza2lwIElPTU1VIG5vZGVzIHdoZW4gY3JlYXRpbmcgRFQgZm9yIERv
bTAgaWYgSU9NTVUgaGFzIGJlZW4KPj4+Pj4gZm9yY2libHkgZGlzYWJsZWQgaW4gYm9vdGFyZ3Mg
KGUuZy4gImlvbW11PTAiKSBpbiBvcmRlciB0byBsZXQKPj4+Pj4gdGhlIElPTU1VIGJlIGFjY2Vz
c2libGUgYnkgRE9NMC4KPj4KPj4gSSBkb24ndCB0aGluayB5b3VyIGNvZGUgaXMgZG9pbmcgd2hh
dCB5b3UgZXhwZWN0Li4uIElmIGlvbW11PTAsIHRoZW4gWGVuIHdpbGwgCj4+IG5vdCBsb29rdXAg
Zm9yIElPTU1VcyAoaW9tbXVfaGFyZHdhcmVfc2V0dXAoKSB3aWxsIG5vdCBiZSBjYWxsZWQpLiBT
byBub25lIG9mIAo+PiB0aGUgZGV2aWNlIHdpbGwgaGF2ZSBERVZJQ0VfSU9NTVUgc2V0IGFuZCBo
ZW5jZSB0aGV5IGFyZSBhbHJlYWR5IGdpdmVuIHRvIGRvbTAuCj4+Cj4+IEJ1dCBJIHRoaW5rIGl0
IGlzIHdyb25nIHRvIGdpdmUgdGhlIElPTU1VcyB0byBEb20wIHdoZW4gaW9tbXU9MC4gVGhpcyBp
cyBub3QgCj4+IHRoZSBnb2FsIG9mIHRoaXMgb3B0aW9uLiBJZiB5b3Ugd2FudCB0byBwYXNzdGhy
b3VnaCB0aGUgSU9NTVUgdG8gRG9tMCwgdGhlbiAKPj4geW91IHNob3VsZCB1c2UgdGhlIHBhcmFt
ZXRlciBpb21tdV9od2RvbV9wYXNzdGhyb3VnaC4KPj4KPj4gSG93ZXZlciwgSSBhZ3JlZSB3aXRo
IFJvZ2VyIHRoYXQgZ2l2aW5nIHRoZSBJT01NVSB0byBkb20wIGlzIGEgcHJldHR5IGJhZCAKPj4g
aWRlYS4gU28gdGhpcyBzaG91bGQgYmUgZml4ZWQuCj4gCj4gCj4gSSBmdWxseSBhZ3JlZSB3aXRo
IHRoZSBhcmd1bWVudHMgcHJvdmlkZWQgdGhhdCBpdCBpcyBhIGJhZCBpZGVhLiBTbywgcGxlYXNl
IAo+IGNvbnNpZGVyIHRoYXQgcGF0Y2ggYXMgbm90IHJlbGV2YW50Lgo+IAo+IAo+IEJ1dCwgSSBh
bSBub3Qgc3VyZSBJIGZvbGxvdyB0aGUgbGFzdCBzZW50ZW5jZToKPiAKPiAgPj4+IElmIGlvbW11
PTAsIHRoZW4gWGVuIHdpbGwgbm90IGxvb2t1cCBmb3IgSU9NTVVzIChpb21tdV9oYXJkd2FyZV9z
ZXR1cCgpIAo+IHdpbGwgbm90IGJlIGNhbGxlZCkuIFNvIG5vbmUgb2YgdGhlIGRldmljZSB3aWxs
IGhhdmUgREVWSUNFX0lPTU1VIHNldCBhbmQgaGVuY2UgCj4gdGhleSBhcmUgYWxyZWFkeSBnaXZl
biB0byBkb20wLgo+IAo+IEkgY2FuIHNlZSB0aGF0IGRldmljZXMgaGF2ZSBERVZJQ0VfSU9NTVUg
c2V0LiBBbHRob3VnaCwgdGhlIElPTU1VIGRyaXZlciBpcyBub3QgCj4gaW4gdXNlLCBpdCBpcyBw
cmVzZW50IGFuZCBjb21wYXRpYmxlIG1hdGNoZXMuIFNvLCBldmVuIGlmIGlvbW11PTAsIHRoZSBJ
T01NVSAKPiBkZXZpY2VzIGFyZSBub3QgZ2l2ZW4gdG8gRG9tMCwgYmVjYXVzZSBvZiBza2lwcGVk
LiBPciBJIG1pc3NlZCBzb21ldGhpbmc/CgpJIGNhbid0IHNlZSBob3cgaW9tbXVfaGFyZHdhcmVf
c2V0dXAoKSBjYW4gYmUgY2FsbGVkIG9uIHN0YWdpbmcgd2hlbiBpb21tdT0wIGFzIAp0aGlzIGlz
IHByb3RlY3RlZCBieSBhIGlmICggaW9tbXVfZW5hYmxlICkuCgpDYW4geW91IHBsZWFzZSBnaXZl
IGEgc3RhY2sgdHJhY2UgaG93IHRoaXMgaXMgY2FsbGVkIGFuZCB0aGUgdmVyc2lvbiB5b3UgdXNl
PyAKV0FSTigpIHNob3VsZCBkbyBpdCBmb3IgeW91LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
