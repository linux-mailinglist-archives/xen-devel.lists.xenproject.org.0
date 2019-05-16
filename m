Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BBC200E4
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 10:01:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRBHj-0006e6-Kd; Thu, 16 May 2019 07:58:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRBHi-0006dy-8N
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 07:58:38 +0000
X-Inumbo-ID: 684d3148-77b0-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 684d3148-77b0-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 07:58:36 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 01:58:35 -0600
Message-Id: <5CDD182B020000780022F768@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 01:58:35 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <3c245c5b-51c6-1d0e-ad6c-42414573166f@arm.com>
 <85205f11-1d5c-1f6d-e987-c238a025658e@citrix.com>
In-Reply-To: <85205f11-1d5c-1f6d-e987-c238a025658e@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] struct vcpu_guest_core_reg stable ABI?
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE1LjA1LjE5IGF0IDIyOjEyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDUvMjAxOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBhbGws
Cj4+Cj4+IEl0IGxvb2tzIGxpa2UgdGhlIHN0cnVjdHVyZXMgdmNwdV9ndWVzdF9jb3JlX3JlZ3Mg
YW5kCj4+IHZjcHVfZ3Vlc3RfY29udGV4dCBkb2VzIG5vdCBjb3JyZWN0bHkgcmVmbGVjdCB0aGUg
QUFyY2g2NCBzdGF0ZS4gRm9yCj4+IGluc3RhbmNlLCBhbGwgQXJtNjQgc3lzdGVtIHJlZ2lzdGVy
cyAoZS5nIHNjdGxyLCBjcHNyLCBzcHNyX2VsMSkKPj4gc2hvdWxkIGJlIDY0LWJpdCB3aWRlIG5v
dCAzMi1iaXQgd2lkZS4KPj4KPj4gT24gQVJNdjguMCwgc29tZSBvZiB0aGUgcmVnaXN0ZXJzIGhh
dmUgb25seSB0aGUgbG93IDMyLWJpdCBkZWZpbmVkLAo+PiB0aGUgcmVzdCBpcyBSRVMwLiBSRVMw
IG9ubHkgbWVhbnMgdGhleSBhcmUgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UsIGl0Cj4+IGRvZXMg
bm90IG1lYW4gdGhleSBjYW4gYmUgaWdub3JlZC4gTmV3ZXIgcmV2aXNpb24gKHN1Y2ggYXMKPj4g
QVJNdjguMC1TU0JTKSBhY3R1YWxseSBiZWdhbiB0byBkZWZpbmUgYml0IGluIHRoZSB0b3AgMzIt
Yml0Lgo+Pgo+PiBUaGlzIG1lYW5zIHRoYXQgdGhlIHN0cnVjdHVyZXMgdmNwdV9ndWVzdF9jb3Jl
X3JlZ3MgYW5kCj4+IHZjcHVfZ3Vlc3RfY29udGV4dCB3b3VsZCBub3QgYmUgYWJsZSB0byBzdG9y
ZSB0aGUgdG9wIDMyLWJpdCBhbmQKPj4gdGhlcmVmb3JlIG1pc3JlcHJlc2VudGluZyB0aGUgaGFy
ZHdhcmUuCj4+Cj4+IEZyb20gbXkgdW5kZXJzdGFuZGluZywgdmNwdV9ndWVzdF9jb250ZXh0IGlz
IGRlZmluZWQgYmV0d2VlbiB0aGUgdG9vbHMKPj4gYW5kIFhlbi4gU28gaXQgd291bGQgYmUgcG9z
c2libGUgdG8gbW9kaWZ5IGl0IHdpdGhvdXQgY2FyaW5nIG9uCj4+IGJhY2t3YXJkIGNvbXBhdGli
bHkuCj4+Cj4+IEhvd2VydmVyLCBzdHJ1Y3QgdmNwdV9ndWVzdF9jb3JlX3JlZyBzZWVtcyB0byBi
ZSBvdXRzaWRlIG9mIHRoZQo+PiAjaWZkZWYuIFNvIEkgYXNzdW1lIGl0IGlzIHBhcnQgb2YgdGhl
IHN0YWJsZSBBQkkuIEFtIEkgY29ycmVjdD8KPj4KPj4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rp
b24gaG93IHRoaXMgY291bGQgc2FmZWx5IGJlIGV4dGVuZGVkPwo+IAo+IFN0dWZmIGxpa2UgdGhp
cyBzaG91bGQgbmV2ZXIgaGF2ZSBiZWVuIGluIHRoZSBwdWJsaWMgQVBJIHRvIGJlZ2luIHdpdGgu
IAo+IHg4NiBoYXMgc29tZSBuYXN0eSBpc3N1ZXMgd2hpY2ggSSBoYXZlIHlldCB0byBmaW5kIGEg
Z29vZC1lbm91Z2ggd2F5IHRvIGZpeC4KPiAKPiBGb3IgQVJNLCBhbmQgZnV0dXJlIGFyY2hpdGVj
dHVyZXMsIEknZCB1c2UgdGhlIGZhY3QgdGhhdCB0aGVyZSBhcmUgbm8KPiBub24tdG9vbHMgaW50
ZXJmYWNlcyB3aGljaCB1c2UgdGhpcyBzdHJ1Y3R1cmUgdG8gYWxsb3cgeW91cnNlbGYgdGhlCj4g
d2lnZ2xlcm9vbSB0byBkZWNsYXJlIGhpc3RvcnkgYSBtaXN0YWtlLCBhbmQgZml4IGl0IGJ5IG1h
a2luZyBpdCB0b29scy1vbmx5LgoKSSdtIHVuY29udmluY2VkIG9mIHRoZSAiZGVjbGFyZSBoaXN0
b3J5IGEgbWlzdGFrZSIgcGFydCwgYnV0IEkgYWdyZWUKd2l0aCB0aGUgc3VnZ2VzdGlvbiBvZiBz
aW1wbHkgbW92aW5nIHRoZSBzdHJ1Y3R1cmUgZGVjbGFyYXRpb24gZG93bgppbnRvIHRoZSBndWFy
ZGVkIGFyZWEuIEl0IHNpbXBseSB3YXMgYSBtaXN0YWtlIHRvIG5vdCBwdXQgaXQgdGhlcmUgaW4K
dGhlIGZpcnN0IHBsYWNlLgoKRm9yIHg4NiBQViBhdCBsZWFzdCBJIGRvbid0IHJlYWxseSBzZWUg
aG93IHdlIGNvdWxkIGhhdmUgZ29uZQp3aXRob3V0IGV4cG9zaW5nIHRoaXMgLSB3ZSBoYXZlIHRv
IGFsbG93IGd1ZXN0cyB0byBzcGVjaWZ5IGF0IGxlYXN0CnNvbWUgb2YgYSB0by1iZS1icm91Z2h0
LXVwLXZDUFUncyByZWdpc3RlcnMuIEFueXRoaW5nIGVsc2UKd291bGRuJ3QgcmVhbGx5IGhhdmUg
YmVlbiBQViBhbnltb3JlLiBGb3IgUFZIIHRoaXMgbWF5IGhhdmUKYmVlbiBhdm9pZGFibGUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
