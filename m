Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94701758D1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 12:00:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8ilG-0003YQ-1u; Mon, 02 Mar 2020 10:57:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8ilF-0003YL-51
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 10:57:21 +0000
X-Inumbo-ID: 96787a32-5c74-11ea-aea3-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96787a32-5c74-11ea-aea3-bc764e2007e4;
 Mon, 02 Mar 2020 10:57:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 52B1FAC37;
 Mon,  2 Mar 2020 10:57:19 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
 <00a4c7ca-36a4-c108-719c-01a6e16df9b2@suse.com>
 <d851c095-84a1-9edb-5905-64860fb1b7a7@citrix.com>
 <cf139d45-13ba-668e-f2e9-b88180429db7@suse.com>
 <d817ac30-c57d-5db0-e48e-b4a6308e7733@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <30456058-9e9a-c718-4890-a9224ffa95c4@suse.com>
Date: Mon, 2 Mar 2020 11:57:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d817ac30-c57d-5db0-e48e-b4a6308e7733@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/5] IOMMU: iommu_intremap is x86-only
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDMuMjAyMCAxMTo0NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDAyLzAz
LzIwMjAgMTA6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyOC4wMi4yMDIwIDIxOjE2LCBB
bmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMjgvMDIvMjAyMCAxMjoyNiwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4gUHJvdmlkZSBhICNkZWZpbmUgZm9yIG90aGVyIGNhc2VzOyBpdCBkaWRuJ3Qg
c2VlbSB3b3J0aHdoaWxlIHRvIG1lIHRvCj4+Pj4gaW50cm9kdWNlIGFuIElPTU1VX0lOVFJFTUFQ
IEtjb25maWcgb3B0aW9uIGF0IHRoaXMgcG9pbnQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4KPj4+PiAtLS0gYS9kb2NzL21pc2Mv
eGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5wYW5kb2MKPj4+PiBAQCAtMTI5OSw2ICsxMjk5LDggQEAgYm9vbGVhbiAoZS5nLiBgaW9t
bXU9bm9gKSBjYW4gb3ZlcnJpZGUgdAo+Pj4+ICAgICAgIGdlbmVyYXRpb24gb2YgSU9NTVVzIG9u
bHkgc3VwcG9ydGVkIERNQSByZW1hcHBpbmcsIGFuZCBJbnRlcnJ1cHQgUmVtYXBwaW5nCj4+Pj4g
ICAgICAgYXBwZWFyZWQgaW4gdGhlIHNlY29uZCBnZW5lcmF0aW9uLgo+Pj4+ICAgCj4+Pj4gKyAg
ICBUaGlzIG9wdGlvbiBpcyBub3QgdmFsaWQgb24gQXJtLgo+Pj4KPj4+IFRoZSBsb25nZXZpdHkg
b2YgdGhpcyBjb21tZW50IHdvdWxkIGJlIGdyZWF0ZXIgaWYgaXQgd2VyZSBwaHJhc2VkIGFzICJp
cwo+Pj4gb25seSB2YWxpZCBvbiB4ODYiLCBlc3BlY2lhbGx5IGdpdmVuIHRoZSBSRkMgUklTQ1Yg
c2VyaWVzIG9uIGxpc3QuCj4+Cj4+IEhvdyBkbyB3ZSBrbm93IGhvdyBpbnRyZW1hcCBpcyBnb2lu
ZyB0byB3b3JrIG9uIGZ1dHVyZSBwb3J0cz8KPiAKPiBXZSBkb24ndCAga25vdy4gQnV0LCBmb3Ig
YSByZXZpZXdlciwgaXQgaXMgZ29pbmcgdG8gYmUgbXVjaCBlYXNpZXIgdG8gCj4gbm90aWNlIGEg
Y29tbWFuZCBsaW5lIG9wdGlvbiBpcyBnb2luZyB0byBiZSB1c2VkIGFzIHRoZSBwYXRjaCB3b3Vs
ZCAKPiBtb2RpZnkgYSBjYWxsZXIuCgpJJ20gc3RydWdnbGluZyB3aXRoIHVuZGVyc3RhbmRpbmcg
dGhpcyAobm90IHNlZWluZyB0aGUgY29ubmVjdGlvbgpiZXR3ZWVuICJjb21tYW5kIGxpbmUgb3B0
aW9uIiBhbmQgImNhbGxlciIpLCBidXQgLi4uCgo+IFNvIEkgYWdyZWUgd2l0aCBBbmRyZXcgdGhh
dCB3ZSB3YW50IHRvIHNheSAib25seSB2YWxpZCBvbiB4ODYiLgoKLi4uIHdlbGwsIG9rYXkgdGhl
biAoYW5kIGRvbmUgYWxzbyBmb3IgdGhlIGlvbW11X2ludHBvc3QgY291bnRlcnBhcnQpLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
