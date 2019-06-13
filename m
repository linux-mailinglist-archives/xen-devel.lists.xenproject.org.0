Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A41436D2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 15:43:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbPxY-0003Wp-U0; Thu, 13 Jun 2019 13:40:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbPxX-0003Wk-H5
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 13:40:07 +0000
X-Inumbo-ID: bf27c0e0-8de0-11e9-9906-774d68d1804a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf27c0e0-8de0-11e9-9906-774d68d1804a;
 Thu, 13 Jun 2019 13:40:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 07:40:02 -0600
Message-Id: <5D0252300200007800237E93@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 07:40:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
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
In-Reply-To: <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA2LjE5IGF0IDE1OjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEzLzA2LzIwMTkgMTM6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMy4wNi4x
OSBhdCAxNDo0OCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDEzLzA2LzIw
MTkgMTM6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDEzLjA2LjE5IGF0IDE0OjMy
LCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+PiBPbiAxMS4wNi4xOSAxMjox
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IEF0IHRoZSB2ZXJ5IGxlYXN0IHN1Y2ggbG9v
cHMgd2FudCBhIGNwdV9yZWxheCgpIGluIHRoZWlyIGJvZGllcy4KPj4+Pj4+Pj4gQnV0IHRoaXMg
YmVpbmcgb24gYSBoeXBlcmNhbGwgcGF0aCAtIGFyZSB0aGVyZSB0aGVvcmV0aWNhbCBndWFyYW50
ZWVzCj4+Pj4+Pj4+IHRoYXQgYSBndWVzdCBjYW4ndCBhYnVzZSB0aGlzIHRvIGxvY2sgdXAgYSBD
UFU/Cj4+Pj4+Pj4gSG1tbSwgSSBzdWdnZXN0ZWQgdGhpcyBidXQgaXQgbG9va3MgbGlrZSBhIGd1
ZXN0IG1heSBjYWxsIHRoZSBoeXBlcmNhbGwKPj4+Pj4gbXVsdGlwbGUKPj4+Pj4+PiB0aW1lIGZy
b20gZGlmZmVyZW50IHZDUFUuIFNvIHRoaXMgY291bGQgYmUgYSB3YXkgdG8gZGVsYXkgd29yayBv
biB0aGUgQ1BVLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB3YW50ZWQgdG8gbWFrZSB0aGUgY29udGV4dCBz
d2l0Y2ggbW9zdGx5IGxvY2tsZXNzIGFuZCB0aGVyZWZvcmUgYXZvaWRpbmcKPj4+Pj4gdG8KPj4+
Pj4+PiBpbnRyb2R1Y2UgYSBzcGlubG9jay4KPj4+Pj4+Cj4+Pj4+PiBXZWxsLCBjb25zdHJ1Y3Rz
IGxpa2UgdGhlIGFib3ZlIGFyZSB0cnlpbmcgdG8gbWltaWMgYSBzcGlubG9jawo+Pj4+Pj4gd2l0
aG91dCBhY3R1YWxseSB1c2luZyBhIHNwaW5sb2NrLiBUaGVyZSBhcmUgZXh0cmVtZWx5IHJhcmUK
Pj4+Pj4+IHNpdHVhdGlvbiBpbiB3aGljaCB0aGlzIG1heSBpbmRlZWQgYmUgd2FycmFudGVkLCBi
dXQgaGVyZSBpdAo+Pj4+Pj4gZmFsbHMgaW4gdGhlIGNvbW1vbiAibWFrZXMgdGhpbmdzIHdvcnNl
IG92ZXJhbGwiIGJ1Y2tldCwgSQo+Pj4+Pj4gdGhpbmsuIFRvIG5vdCB1bmR1bHkgcGVuYWxpemUg
dGhlIGFjdHVhbCB1cGRhdGUgcGF0aHMsIEkgdGhpbmsKPj4+Pj4+IHVzaW5nIGEgci93IGxvY2sg
d291bGQgYmUgYXBwcm9wcmlhdGUgaGVyZS4KPj4+Pj4KPj4+Pj4gU28gd2hhdCBpcyB0aGUgY29u
Y2x1c2lvbiBoZXJlPyBTaG91bGQgd2UgZ28gd2l0aCB0cnlsb2NrIGFuZAo+Pj4+PiBoeXBlcmNh
bGxfY3JlYXRlX2NvbnRpbnVhdGlvbigpIGluIG9yZGVyIHRvIGF2b2lkIGxvY2tpbmcgYnV0IHN0
aWxsIG5vdCBmYWlsCj4+Pj4+IHRvIHRoZSBndWVzdD8KPj4+Pgo+Pj4+IEknbSBub3QgY29udmlu
Y2VkIGEgInRyeWxvY2siIGFwcHJvYWNoIGlzIG5lZWRlZCAtIHRoYXQncwo+Pj4+IHNvbWV0aGlu
ZyBKdWxpZW4gc3VnZ2VzdGVkLgo+Pj4KPj4+IEkgdGhpbmsgdGhlIHRyeWxvY2sgaW4gdGhlIGNv
bnRleHQgc3dpdGNoIGlzIGEgbXVzdC4gT3RoZXJ3aXNlIHlvdSB3b3VsZCBkZWxheQo+Pj4gY29u
dGV4dCBzd2l0Y2ggaWYgdGhlIGluZm9ybWF0aW9uIGdldCB1cGRhdGVkLgo+PiAKPj4gRGVsYXkg
aW4gd2hhdCB3YXk/IEkuZS4gaG93IHdvdWxkIHRoaXMgYmUgYW4gaXNzdWUgb3RoZXIgdGhhbiBm
b3IKPj4gdGhlIGd1ZXN0IGl0c2VsZiAod2hpY2ggc2hvdWxkbid0IGJlIGNvbnN0YW50bHkgdXBk
YXRpbmcgdGhlCj4+IGFkZHJlc3MgZm9yIHRoZSByZWdpb24pPwo+IAo+IFdoeSB3b3VsZCBpdCBv
bmx5IGJlIGFuIGlzc3VlIHdpdGggdGhlIGd1ZXN0IGl0c2VsZj8gQW55IHdhaXQgb24gbG9jayBp
biBYZW4gCj4gaW1wbGllcyB0aGF0IHlvdSBjYW4ndCBzY2hlZHVsZSBhbm90aGVyIHZDUFUgYXMg
d2UgYXJlIG5vdCBwcmVlbXB0aWJsZS4KCkZvciBvbmUgSSBpbml0aWFsbHkgKHdyb25nbHkpIHVu
ZGVyc3Rvb2QgeW91IHdhbnQgdGhlIHRyeWxvY2sgaW4gdGhlCmh5cGVyY2FsbCBoYW5kbGVyLiBB
bmQgdGhlbiwgZm9yIGNvbnRleHQgc3dpdGNoLCB3YXN0aW5nIHRoZSB0YXJnZXQKKGkuZS4gYmVp
bmcgc3dpdGNoZWQgaW4pIHZDUFUncyB0aW1lIHNsaWNlIGlzIG5vdCBhbiBpc3N1ZSBoZXJlLiBP
Zgpjb3Vyc2UgaWYgdGhlcmUncyBhIGNoYW5jZSB0aGF0IGFjcXVpcmluZyB0aGUgbG9jayBjb3Vs
ZCByZXF1aXJlIG1vcmUKdGhhbiBhIGZ1bGwgdGltZSBzbGljZSwgdGhlbiB5ZXMsIHNvbWUgdHJ5
LWxvY2stZXJ5IG1heSBiZSBuZWVkZWQuCgpIb3dldmVyLCAuLi4KCj4+PiBSZWdhcmRpbmcgdGhl
IG5lZWQgb2YgdGhlIGxvY2ssIEkgc3RpbGwgY2FuJ3Qgc2VlIGhvdyB5b3UgY2FuIG1ha2UgaXQg
c2FmZQo+Pj4gd2l0aG91dCBpdCBhcyB5b3UgbWF5IGhhdmUgY29uY3VycmVudCBjYWxsLgo+Pj4K
Pj4+IEZlZWwgZnJlZSB0byBzdWdnZXN0IGEgd2F5Lgo+PiAKPj4gV2VsbCwgaWYgbm9uZSBjYW4g
YmUgZm91bmQsIHRoZW4gZmluZS4gSSBkb24ndCBoYXZlIHRoZSB0aW1lIG9yIGludGVyZXN0Cj4+
IGhlcmUgdG8gdHJ5IGFuZCB0aGluayBhYm91dCBhIGxvY2tsZXNzIGFwcHJvYWNoOyBpdCBqdXN0
IGRvZXNuJ3QgX2ZlZWxfCj4+IGxpa2UgdGhpcyBvdWdodCB0byBzdHJpY3RseSByZXF1aXJlIHVz
ZSBvZiBhIGxvY2suIFRoaXMgZ3V0IGZlZWxpbmcgb2YgbWluZQo+PiBtYXkgd2VsbCBiZSB3cm9u
Zy4KPiAKPiBJIGFtIG5vdCBhc2tpbmcgeW91IHRvIHNwZW5kIGEgbG90IG9mIHRpbWUgb24gaXQu
IEJ1dCBpZiB5b3UgaGF2ZSBhIGd1dCBmZWVsaW5nIAo+IHRoaXMgY2FuIGJlIGRvbmUsIHRoZW4g
YSBsaXR0bGUgaGVscCB3b3VsZCBiZSBleHRyZW1lbHkgdXNlZnVsLi4uCgouLi4gSSB0aG91Z2h0
IEkgaGFkIGFscmVhZHkgb3V0bGluZWQgYSBtb2RlbDogQWxsb3cgY3Jvc3MtdkNQVSB1cGRhdGVz
Cm9ubHkgd2hpbGUgdGhlIHRhcmdldCB2Q1BVIGlzIHN0aWxsIG9mZmxpbmUuIE9uY2Ugb25saW5l
LCBhIHZDUFUgY2FuIG9ubHkKaXRzZWxmIHVwZGF0ZSBpdHMgcnVuc3RhdGUgYXJlYSBhZGRyZXNz
LiBJIHRoaW5rIHlvdSBjYW4gZ2V0IGF3YXkKd2l0aG91dCBhbnkgbG9ja3MgaW4gdGhpcyBjYXNl
OyB0aGVyZSBtYXkgYmUgYSBjb3JuZXIgY2FzZSB3aXRoIGEgdkNQVQpiZWluZyBvbmxpbmVkIHJp
Z2h0IGF0IHRoYXQgcG9pbnQgaW4gdGltZSwgc28gdGhlcmUgbWF5IG5lZWQgdG8gYmUgYSBtb3Jl
CnN0cmljdCBjb25kaXRpb24gKGxpa2UgIm9ubHkgb25lIG9ubGluZSB2Q1BVIiBpbnN0ZWFkIG9m
ICJ0aGUgdGFyZ2V0IHZDUFUKaXMgb2ZmbGluZSIpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
