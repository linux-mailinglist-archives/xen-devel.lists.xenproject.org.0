Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEB04360D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 14:50:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbP9n-00064I-LP; Thu, 13 Jun 2019 12:48:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbP9l-00064D-Pw
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:48:41 +0000
X-Inumbo-ID: 9167001e-8dd9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9167001e-8dd9-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 12:48:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD92BA5E;
 Thu, 13 Jun 2019 05:48:39 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FF1A3F694;
 Thu, 13 Jun 2019 05:48:38 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, andrii.anisov@gmail.com
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
Date: Thu, 13 Jun 2019 13:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
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

SGkgSmFuLAoKT24gMTMvMDYvMjAxOSAxMzo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTMuMDYuMTkgYXQgMTQ6MzIsIDxhbmRyaWkuYW5pc292QGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEph
biwgSnVsaWVuLAo+Pgo+PiBPbiAxMS4wNi4xOSAxMjoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+IEF0IHRoZSB2ZXJ5IGxlYXN0IHN1Y2ggbG9vcHMgd2FudCBhIGNwdV9yZWxheCgpIGluIHRo
ZWlyIGJvZGllcy4KPj4+Pj4gQnV0IHRoaXMgYmVpbmcgb24gYSBoeXBlcmNhbGwgcGF0aCAtIGFy
ZSB0aGVyZSB0aGVvcmV0aWNhbCBndWFyYW50ZWVzCj4+Pj4+IHRoYXQgYSBndWVzdCBjYW4ndCBh
YnVzZSB0aGlzIHRvIGxvY2sgdXAgYSBDUFU/Cj4+Pj4gSG1tbSwgSSBzdWdnZXN0ZWQgdGhpcyBi
dXQgaXQgbG9va3MgbGlrZSBhIGd1ZXN0IG1heSBjYWxsIHRoZSBoeXBlcmNhbGwKPj4gbXVsdGlw
bGUKPj4+PiB0aW1lIGZyb20gZGlmZmVyZW50IHZDUFUuIFNvIHRoaXMgY291bGQgYmUgYSB3YXkg
dG8gZGVsYXkgd29yayBvbiB0aGUgQ1BVLgo+Pj4+Cj4+Pj4gSSB3YW50ZWQgdG8gbWFrZSB0aGUg
Y29udGV4dCBzd2l0Y2ggbW9zdGx5IGxvY2tsZXNzIGFuZCB0aGVyZWZvcmUgYXZvaWRpbmcKPj4g
dG8KPj4+PiBpbnRyb2R1Y2UgYSBzcGlubG9jay4KPj4+Cj4+PiBXZWxsLCBjb25zdHJ1Y3RzIGxp
a2UgdGhlIGFib3ZlIGFyZSB0cnlpbmcgdG8gbWltaWMgYSBzcGlubG9jawo+Pj4gd2l0aG91dCBh
Y3R1YWxseSB1c2luZyBhIHNwaW5sb2NrLiBUaGVyZSBhcmUgZXh0cmVtZWx5IHJhcmUKPj4+IHNp
dHVhdGlvbiBpbiB3aGljaCB0aGlzIG1heSBpbmRlZWQgYmUgd2FycmFudGVkLCBidXQgaGVyZSBp
dAo+Pj4gZmFsbHMgaW4gdGhlIGNvbW1vbiAibWFrZXMgdGhpbmdzIHdvcnNlIG92ZXJhbGwiIGJ1
Y2tldCwgSQo+Pj4gdGhpbmsuIFRvIG5vdCB1bmR1bHkgcGVuYWxpemUgdGhlIGFjdHVhbCB1cGRh
dGUgcGF0aHMsIEkgdGhpbmsKPj4+IHVzaW5nIGEgci93IGxvY2sgd291bGQgYmUgYXBwcm9wcmlh
dGUgaGVyZS4KPj4KPj4gU28gd2hhdCBpcyB0aGUgY29uY2x1c2lvbiBoZXJlPyBTaG91bGQgd2Ug
Z28gd2l0aCB0cnlsb2NrIGFuZAo+PiBoeXBlcmNhbGxfY3JlYXRlX2NvbnRpbnVhdGlvbigpIGlu
IG9yZGVyIHRvIGF2b2lkIGxvY2tpbmcgYnV0IHN0aWxsIG5vdCBmYWlsCj4+IHRvIHRoZSBndWVz
dD8KPiAKPiBJJ20gbm90IGNvbnZpbmNlZCBhICJ0cnlsb2NrIiBhcHByb2FjaCBpcyBuZWVkZWQg
LSB0aGF0J3MKPiBzb21ldGhpbmcgSnVsaWVuIHN1Z2dlc3RlZC4KCkkgdGhpbmsgdGhlIHRyeWxv
Y2sgaW4gdGhlIGNvbnRleHQgc3dpdGNoIGlzIGEgbXVzdC4gT3RoZXJ3aXNlIHlvdSB3b3VsZCBk
ZWxheSAKY29udGV4dCBzd2l0Y2ggaWYgdGhlIGluZm9ybWF0aW9uIGdldCB1cGRhdGVkLgoKPiBJ
J20gcHJldHR5IHN1cmUgd2UncmUgYWNxdWlyaW5nIG90aGVyCj4gbG9ja3MgaW4gaHlwZXJjYWxs
IGNvbnRleHQgd2l0aG91dCBnb2luZyB0aGUgdHJ5bG9jayByb3V0ZS4gSSBhbQo+IGNvbnZpbmNl
ZCB0aG91Z2ggdGhhdCB0aGUgcHNldWRvLWxvY2sgeW91J3ZlIHVzZWQgbmVlZHMgdG8gYmUKPiBy
ZXBsYWNlZCBieSBhIHJlYWwgKGFuZCBwZXJoYXBzIHIvdykgb25lLCBfaWZfIHRoZXJlIGlzIGFu
eSBuZWVkCj4gZm9yIGxvY2tpbmcgaW4gdGhlIGZpcnN0IHBsYWNlLgoKWW91IHdlcmUgdGhlIG9u
ZSBhc2tpbmcgZm9yIHRoZW9yZXRpY2FsIGd1YXJhbnRlZXMgdGhhdCBhIGd1ZXN0IGNhbid0IGFi
dXNlIHRoaXMgCnRvIGxvY2sgdXAgYSBDUFUuIFRoZXJlIGFyZSBubyB3YXkgdG8gZ3VhcmFudGVl
IHRoYXQgYXMgbXVsdGlwbGUgdkNQVXMgY291bGQgCmNhbGwgdGhlIGh5cGVyY2FsbCBhbmQgdGFr
ZSB0aGUgc2FtZSBsb2NrIHBvdGVudGlhbGx5IGRlbGF5aW5nIHNpZ25pZmljYW50bHkgdGhlIAp3
b3JrLgoKUmVnYXJkaW5nIHRoZSBuZWVkIG9mIHRoZSBsb2NrLCBJIHN0aWxsIGNhbid0IHNlZSBo
b3cgeW91IGNhbiBtYWtlIGl0IHNhZmUgCndpdGhvdXQgaXQgYXMgeW91IG1heSBoYXZlIGNvbmN1
cnJlbnQgY2FsbC4KCkZlZWwgZnJlZSB0byBzdWdnZXN0IGEgd2F5LgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
