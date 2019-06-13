Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E759543656
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 15:16:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbPYS-0000AP-OC; Thu, 13 Jun 2019 13:14:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbPYR-00009D-1V
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 13:14:11 +0000
X-Inumbo-ID: 21587ee9-8ddd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 21587ee9-8ddd-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 13:14:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B53EB2B;
 Thu, 13 Jun 2019 06:14:09 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 442E03F73C;
 Thu, 13 Jun 2019 06:14:08 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
 <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
Date: Thu, 13 Jun 2019 14:14:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTMvMDYvMjAxOSAxMzo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTMuMDYuMTkgYXQgMTQ6NDgsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEhpIEph
biwKPj4KPj4gT24gMTMvMDYvMjAxOSAxMzo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBP
biAxMy4wNi4xOSBhdCAxNDozMiwgPGFuZHJpaS5hbmlzb3ZAZ21haWwuY29tPiB3cm90ZToKPj4+
PiBKYW4sIEp1bGllbiwKPj4+Pgo+Pj4+IE9uIDExLjA2LjE5IDEyOjEwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+Pj4+PiBBdCB0aGUgdmVyeSBsZWFzdCBzdWNoIGxvb3BzIHdhbnQgYSBjcHVfcmVs
YXgoKSBpbiB0aGVpciBib2RpZXMuCj4+Pj4+Pj4gQnV0IHRoaXMgYmVpbmcgb24gYSBoeXBlcmNh
bGwgcGF0aCAtIGFyZSB0aGVyZSB0aGVvcmV0aWNhbCBndWFyYW50ZWVzCj4+Pj4+Pj4gdGhhdCBh
IGd1ZXN0IGNhbid0IGFidXNlIHRoaXMgdG8gbG9jayB1cCBhIENQVT8KPj4+Pj4+IEhtbW0sIEkg
c3VnZ2VzdGVkIHRoaXMgYnV0IGl0IGxvb2tzIGxpa2UgYSBndWVzdCBtYXkgY2FsbCB0aGUgaHlw
ZXJjYWxsCj4+Pj4gbXVsdGlwbGUKPj4+Pj4+IHRpbWUgZnJvbSBkaWZmZXJlbnQgdkNQVS4gU28g
dGhpcyBjb3VsZCBiZSBhIHdheSB0byBkZWxheSB3b3JrIG9uIHRoZSBDUFUuCj4+Pj4+Pgo+Pj4+
Pj4gSSB3YW50ZWQgdG8gbWFrZSB0aGUgY29udGV4dCBzd2l0Y2ggbW9zdGx5IGxvY2tsZXNzIGFu
ZCB0aGVyZWZvcmUgYXZvaWRpbmcKPj4+PiB0bwo+Pj4+Pj4gaW50cm9kdWNlIGEgc3BpbmxvY2su
Cj4+Pj4+Cj4+Pj4+IFdlbGwsIGNvbnN0cnVjdHMgbGlrZSB0aGUgYWJvdmUgYXJlIHRyeWluZyB0
byBtaW1pYyBhIHNwaW5sb2NrCj4+Pj4+IHdpdGhvdXQgYWN0dWFsbHkgdXNpbmcgYSBzcGlubG9j
ay4gVGhlcmUgYXJlIGV4dHJlbWVseSByYXJlCj4+Pj4+IHNpdHVhdGlvbiBpbiB3aGljaCB0aGlz
IG1heSBpbmRlZWQgYmUgd2FycmFudGVkLCBidXQgaGVyZSBpdAo+Pj4+PiBmYWxscyBpbiB0aGUg
Y29tbW9uICJtYWtlcyB0aGluZ3Mgd29yc2Ugb3ZlcmFsbCIgYnVja2V0LCBJCj4+Pj4+IHRoaW5r
LiBUbyBub3QgdW5kdWx5IHBlbmFsaXplIHRoZSBhY3R1YWwgdXBkYXRlIHBhdGhzLCBJIHRoaW5r
Cj4+Pj4+IHVzaW5nIGEgci93IGxvY2sgd291bGQgYmUgYXBwcm9wcmlhdGUgaGVyZS4KPj4+Pgo+
Pj4+IFNvIHdoYXQgaXMgdGhlIGNvbmNsdXNpb24gaGVyZT8gU2hvdWxkIHdlIGdvIHdpdGggdHJ5
bG9jayBhbmQKPj4+PiBoeXBlcmNhbGxfY3JlYXRlX2NvbnRpbnVhdGlvbigpIGluIG9yZGVyIHRv
IGF2b2lkIGxvY2tpbmcgYnV0IHN0aWxsIG5vdCBmYWlsCj4+Pj4gdG8gdGhlIGd1ZXN0Pwo+Pj4K
Pj4+IEknbSBub3QgY29udmluY2VkIGEgInRyeWxvY2siIGFwcHJvYWNoIGlzIG5lZWRlZCAtIHRo
YXQncwo+Pj4gc29tZXRoaW5nIEp1bGllbiBzdWdnZXN0ZWQuCj4+Cj4+IEkgdGhpbmsgdGhlIHRy
eWxvY2sgaW4gdGhlIGNvbnRleHQgc3dpdGNoIGlzIGEgbXVzdC4gT3RoZXJ3aXNlIHlvdSB3b3Vs
ZCBkZWxheQo+PiBjb250ZXh0IHN3aXRjaCBpZiB0aGUgaW5mb3JtYXRpb24gZ2V0IHVwZGF0ZWQu
Cj4gCj4gRGVsYXkgaW4gd2hhdCB3YXk/IEkuZS4gaG93IHdvdWxkIHRoaXMgYmUgYW4gaXNzdWUg
b3RoZXIgdGhhbiBmb3IKPiB0aGUgZ3Vlc3QgaXRzZWxmICh3aGljaCBzaG91bGRuJ3QgYmUgY29u
c3RhbnRseSB1cGRhdGluZyB0aGUKPiBhZGRyZXNzIGZvciB0aGUgcmVnaW9uKT8KCldoeSB3b3Vs
ZCBpdCBvbmx5IGJlIGFuIGlzc3VlIHdpdGggdGhlIGd1ZXN0IGl0c2VsZj8gQW55IHdhaXQgb24g
bG9jayBpbiBYZW4gCmltcGxpZXMgdGhhdCB5b3UgY2FuJ3Qgc2NoZWR1bGUgYW5vdGhlciB2Q1BV
IGFzIHdlIGFyZSBub3QgcHJlZW1wdGlibGUuCgpBcyB0aGUgbG9jayBpcyB0YWtlbiBpbiB0aGUg
Y29udGV4dCBzd2l0Y2gsIEkgYW0gd29ycnkgdGhhdCBhIGd1ZXN0IGNvbnRpbnVvdXNseSAKdHJ5
aW5nIHRvIGNhbGwgdGhlIGh5cGVyY2FsbCBhbmQgdGhlcmVmb3JlIHVzZSB0aGUgbG9jayBtYXkg
YWN0dWFsbHkgZGVsYXkgdGhlIAplbmQgb2YgdGhlIGNvbnRleHQgc3dpdGNoLiBBbmQgdGhlcmVm
b3JlIGRlbGF5IHRoZSByZXN0IG9mIHRoZSB3b3JrLgoKSSBzdWdnZXN0ZWQgdGhlIHRyeWxvY2sg
aGVyZSwgc28gdGhlIGNvbnRleHQgc3dpdGNoIGNvdWxkIGF2b2lkIHVwZGF0aW5nIHRoZSAKcnVu
c3RhdGUgaWYgd2UgYXJlIGluIHRoZSBoeXBlcmNhbGwuCgo+IAo+Pj4gSSdtIHByZXR0eSBzdXJl
IHdlJ3JlIGFjcXVpcmluZyBvdGhlcgo+Pj4gbG9ja3MgaW4gaHlwZXJjYWxsIGNvbnRleHQgd2l0
aG91dCBnb2luZyB0aGUgdHJ5bG9jayByb3V0ZS4gSSBhbQo+Pj4gY29udmluY2VkIHRob3VnaCB0
aGF0IHRoZSBwc2V1ZG8tbG9jayB5b3UndmUgdXNlZCBuZWVkcyB0byBiZQo+Pj4gcmVwbGFjZWQg
YnkgYSByZWFsIChhbmQgcGVyaGFwcyByL3cpIG9uZSwgX2lmXyB0aGVyZSBpcyBhbnkgbmVlZAo+
Pj4gZm9yIGxvY2tpbmcgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Pgo+PiBZb3Ugd2VyZSB0aGUgb25l
IGFza2luZyBmb3IgdGhlb3JldGljYWwgZ3VhcmFudGVlcyB0aGF0IGEgZ3Vlc3QgY2FuJ3QgYWJ1
c2UgdGhpcwo+PiB0byBsb2NrIHVwIGEgQ1BVLiBUaGVyZSBhcmUgbm8gd2F5IHRvIGd1YXJhbnRl
ZSB0aGF0IGFzIG11bHRpcGxlIHZDUFVzIGNvdWxkCj4+IGNhbGwgdGhlIGh5cGVyY2FsbCBhbmQg
dGFrZSB0aGUgc2FtZSBsb2NrIHBvdGVudGlhbGx5IGRlbGF5aW5nIHNpZ25pZmljYW50bHkgdGhl
Cj4+IHdvcmsuCj4gCj4gV2VsbCwgSSBtYXkgaGF2ZSBnb25lIGEgbGl0dGxlIHRvbyBmYXIgd2l0
aCBteSBvcmlnaW5hbCByZXNwb25zZS4gSXQKPiBqdXN0IHdhcyBzbyBvZGQgdG8gc2VlIHRoaXMg
cHNldWRvIGxvY2sgdXNlZC4KPiAKPj4gUmVnYXJkaW5nIHRoZSBuZWVkIG9mIHRoZSBsb2NrLCBJ
IHN0aWxsIGNhbid0IHNlZSBob3cgeW91IGNhbiBtYWtlIGl0IHNhZmUKPj4gd2l0aG91dCBpdCBh
cyB5b3UgbWF5IGhhdmUgY29uY3VycmVudCBjYWxsLgo+Pgo+PiBGZWVsIGZyZWUgdG8gc3VnZ2Vz
dCBhIHdheS4KPiAKPiBXZWxsLCBpZiBub25lIGNhbiBiZSBmb3VuZCwgdGhlbiBmaW5lLiBJIGRv
bid0IGhhdmUgdGhlIHRpbWUgb3IgaW50ZXJlc3QKPiBoZXJlIHRvIHRyeSBhbmQgdGhpbmsgYWJv
dXQgYSBsb2NrbGVzcyBhcHByb2FjaDsgaXQganVzdCBkb2Vzbid0IF9mZWVsXwo+IGxpa2UgdGhp
cyBvdWdodCB0byBzdHJpY3RseSByZXF1aXJlIHVzZSBvZiBhIGxvY2suIFRoaXMgZ3V0IGZlZWxp
bmcgb2YgbWluZQo+IG1heSB3ZWxsIGJlIHdyb25nLgoKSSBhbSBub3QgYXNraW5nIHlvdSB0byBz
cGVuZCBhIGxvdCBvZiB0aW1lIG9uIGl0LiBCdXQgaWYgeW91IGhhdmUgYSBndXQgZmVlbGluZyAK
dGhpcyBjYW4gYmUgZG9uZSwgdGhlbiBhIGxpdHRsZSBoZWxwIHdvdWxkIGJlIGV4dHJlbWVseSB1
c2VmdWwuLi4KCk90aGVyd2lzZSwgSSB3aWxsIGNvbnNpZGVyIHRoYXQgdGhlIGxvY2sgaXMgdGhl
IGJlc3Qgd2F5IHRvIGdvLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
