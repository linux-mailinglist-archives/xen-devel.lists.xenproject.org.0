Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD2462B0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 17:27:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbo46-0005SF-K7; Fri, 14 Jun 2019 15:24:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbo44-0005S7-MQ
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 15:24:28 +0000
X-Inumbo-ID: 7f594715-8eb8-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7f594715-8eb8-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 15:24:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1716D344;
 Fri, 14 Jun 2019 08:24:27 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 444F63F718;
 Fri, 14 Jun 2019 08:24:25 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
 <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
 <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
 <5D0252300200007800237E93@prv1-mh.provo.novell.com>
 <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
 <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
 <a439c5ec-cec5-51be-bf76-eebdf50cf1bb@arm.com>
 <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c1094660-9c41-9883-8869-f04f95976728@arm.com>
Date: Fri, 14 Jun 2019 16:24:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gMTQvMDYvMjAxOSAxNjoxMSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiAKPiBPbiAxNC4wNi4xOSAxNzozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBXaHk/IFdoYXQg
YXJlIHRoZSBiZW5lZml0cyBmb3IgYSBndWVzdCB0byB1c2UgdGhlIHR3byBpbnRlcmZhY2UgdG9n
ZXRoZXI/Cj4gCj4gSSBkbyBub3Qgc2F5IHRoZSBndWVzdCBoYXMgdG8gdXNlIGJvdGggaW50ZXJm
YWNlcyBzaW11bHRhbmVvdXNseS4gSXQgaXMgCj4gbG9naWNhbGx5IG9kZCwgZG9pbmcgc28gd2ls
bCBvbmx5IHJlZmxlY3QgaW4gaW5jcmVhc2luZyBvZiBoeXBlcnZpc29yIG92ZXJoZWFkLgo+IEJ1
dCBzdWNoIGFuIGltcGxlbWVudGF0aW9uIHdpbGwgaGF2ZSBhIHNpbXBsZXIgY29kZSwgd2hpY2gg
ZXhwZWN0ZWQgdG8gYmUgKGEgCj4gYml0KSBmYXN0ZXIuID4gU28gdGhlIGNvZGUgc2ltcGxpY2l0
eSB3b3VsZCBiZSBhIGJlbmVmaXQgZm9yIHVzLiBMb3dlciBoeXBlcnZpc29yIG92ZXJoZWFkIGlz
IGEKPiBiZW5lZml0IGZvciBzYW5lIGd1ZXN0cywgd2hpY2ggdXNlIG9ubHkgb25lIGludGVyZmFj
ZS4KSSBob3BlIHlvdSBhcmUgYXdhcmUgdGhhdCBzcGVha2luZyBhYm91dCBzcGVlZCBoZXJlIGlz
IHF1aXRlIGlycmVsZXZhbnQuIFRoZSAKZGlmZmVyZW5jZSB3b3VsZCBiZSBjbGVhciBsb3N0IGlu
IHRoZSBub2lzZSBvZiB0aGUgcmVzdCBvZiB0aGUgY29udGV4dCBzd2l0Y2guCgpCdXQsIGlmIHlv
dSBhbGxvdyBzb21ldGhpbmcsIHRoZW4gbW9zdCBsaWtlbHkgc29tZW9uZSB3aWxsIHVzZSBpdC4g
SG93ZXZlciwgeW91IApoYXZlIHRvIGRpZmZlcmVudGlhdGUgaW1wbGVtZW50YXRpb24gdnMgZG9j
dW1lbnRhdGlvbi4KCkluIHRoaXMgY2FzZSwgSSBkb24ndCB0aGluayB0aGUgaW1wbGVtZW50YXRp
b24gc2hvdWxkIGRpY3RhdGUgd2hhdCBpcyBnb2luZyB0byAKYmUgZXhwb3NlZC4KCklmIHlvdSBk
b2N1bWVudCB0aGF0IGl0IGNhbid0IGhhcHBlbiwgdGhlbiB5b3UgaGF2ZSByb29tIHRvIGZvcmJp
ZCB0aGUgbWl4IGluIAp0aGUgZnV0dXJlIChhc3N1bWluZyB0aGlzIGNhbid0IGJlIGRvbmUgbm93
KS4KCkluIG90aGVyIHdvcmQsIHRoZSBtb3JlIGxheCBpcyB0aGUgaW50ZXJmYWNlLCB0aGUgbW9y
ZSBkaWZmaWN1bHQgaXQgaXMgdGlnaHRlbiAKaW4gdGhlIGZ1dHVyZS4KCkkgYW0gbm90IGdvaW5n
IHRvIHB1c2ggZm9yIGFuIGltcGxlbWVudGF0aW9uIHRoYXQgZm9yYmlkIHRoZSBtaXguIEJ1dCBJ
IGFtIApzdHJvbmdseSBnb2luZyB0byBwdXNoIGZvciBhbnkgZG9jdW1lbnRhdGlvbiBvZiB0aGUg
ZXhwZWN0ZWQgaW50ZXJhY3Rpb24uIFNvIHdlIApkb24ndCBtYWtlIG91ciBsaWZlIG1pc2VyYWJs
ZSBsYXRlciBvbi4KCj4gCj4gQlRXLCBkcm9wcGluZyB0aGUgb2xkIGludGVyZmFjZSBpbXBsZW1l
bnRhdGlvbiB3aWxsIGJlIG11Y2ggZWFzaWVyIGluIGZ1dHVyZSBpZiAKPiBpdCB3aWxsIG5vdCBj
bGFzaCB3aXRoIHRoZSBuZXcgb25lLgpJIGFtIGFmcmFpZCB3ZSB3aWxsIG5ldmVyIGJlIGFibGUg
dG8gcmVtb3ZlIHRoZSBvbGQgaW50ZXJmYWNlLgoKPiAKPj4gQWZ0ZXIgYWxsIHRoZXkgaGF2ZSBl
eGFjdGx5IHRoZSBzYW1lIGRhdGEuLi4KPiAKPiBZZXMsIGJ1dCBub3JtYWwgZ3Vlc3RzIHNob3Vs
ZCB1c2Ugb25seSBvbmUgaW50ZXJmYWNlLgoKU2VlIGFib3ZlLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
