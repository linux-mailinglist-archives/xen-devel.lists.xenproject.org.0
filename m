Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3617435FB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 14:42:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbP0a-00051q-VY; Thu, 13 Jun 2019 12:39:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbP0Z-00051k-J6
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:39:11 +0000
X-Inumbo-ID: 3de32d45-8dd8-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3de32d45-8dd8-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 12:39:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 06:39:09 -0600
Message-Id: <5D0243EB0200007800237D74@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 06:39:07 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <andrii.anisov@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <92d534ef-082e-58d7-a4ff-c74cf7c23195@gmail.com>
 <f8f8ea51-46dd-7e0a-9b5b-4da439eee4c0@gmail.com>
In-Reply-To: <f8f8ea51-46dd-7e0a-9b5b-4da439eee4c0@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA2LjE5IGF0IDE0OjIxLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IE9uIDExLjA2LjE5IDEzOjIyLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+PiBPbiAxMS4wNi4x
OSAxMjoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IEV4Y2VwdCB3aGVuIHRoZXJlJ3Mgbm8g
bmVlZCBmb3IgS1BUSSBpbiB0aGUgZ3Vlc3QgaW4gdGhlIGZpcnN0IHBsYWNlLAo+Pj4+PiBhcyBp
cyB0aGUgY2FzZSBmb3IgeDg2LTY0IFBWIGd1ZXN0cy4gSSB0aGluayB0aGlzIGlzIHdvcnRod2hp
bGUgY2xhcmlmeWluZy4KPj4+Pgo+Pj4+IEkgYW0gbm90IHN1cmUgd2hhdCBpcyB5b3VyIHBvaW50
IGhlcmUuIEF0IGxlYXN0IG9uIEFybSwgdXNpbmcgdmlydHVhbCBhZGRyZXNzIGlzCj4+Pj4gbm90
IHNhZmUgYXQgYWxsICh3aGV0aGVyIEtQVEkgaXMgdXNlZCBvciBub3QpLiBBIGd1ZXN0IGNhbiBn
ZW51aW5lbHkgZGVjaWRlcyB0bwo+Pj4+IHNoYXR0ZXIgdGhlIG1hcHBpbmcgd2hlcmUgdGhlIHZp
cnR1YWwgYWRkcmVzcyBpcy4gT24gQXJtLCB0aGlzIHJlcXVpcmUgdG8gdXNlCj4+Pj4gdGhlIGJy
ZWFrLWJlZm9yZS1tYWtlIHNlcXVlbmNlLiBJdCBtZWFucyB0aGUgdHJhbnNsYXRpb24gVkEgLT4g
UEEgbWF5IGZhaWwgaXMKPj4+PiB5b3UgaGFwcGVuIHRvIGRvIGl0IHdoaWxlIHRoZSBndWVzdCBp
cyB1c2luZyB0aGUgc2VxdWVuY2UuCj4+Pj4KPj4+PiBTb21lIG9mIHRoZSBpbnRlcm1pdHRlbnQg
aXNzdWVzIEkgaGF2ZSBzZWVuIG9uIHRoZSBBcm5kYWxlIGluIHRoZSBwYXN0IFsxXSBtaWdodAo+
Pj4+IGJlIHJlbGF0ZWQgdG8gdXNpbmcgdmlydHVhbCBhZGRyZXNzLiBJIGFtIG5vdCAxMDAlIHN1
cmUgYmVjYXVzZSBldmVuIGlmIHRoZQo+Pj4+IGRlYnVnLCB0aGUgZXJyb3IgZG9lcyBub3QgbWFr
ZSBzZW5zZS4gQnV0IHRoaXMgaXMgdGhlIG1vc3QgcGxhdXNpYmxlIHJlYXNvbiBmb3IKPj4+PiB0
aGUgZmFpbHVyZS4KPj4+Cj4+PiBBbGwgZmluZSwgYnV0IEFybS1zcGVjaWZpYy4gVGhlIHBvaW50
IG9mIG15IGNvbW1lbnQgd2FzIHRvIGFzayB0byBjYWxsCj4+PiBvdXQgdGhhdCB0aGVyZSBpcyBv
bmUgZW52aXJvbm1lbnQgKHg4Ni02NCBQVikgd2hlcmUgdGhpcyBLUFRJCj4+PiBkaXNjdXNzaW9u
IGlzIGVudGlyZWx5IGluYXBwbGljYWJsZS4KPj4gCj4+IEkgYWRtaXQgdGhhdCB4ODYgc3BlY2lm
aWNzIGFyZSBxdWl0ZSB1bmNsZWFyIHRvIG1lIHNvIGNsYXJpZmljYXRpb25zIGFuZCAKPiBjb3Jy
ZWN0aW9ucyBpbiB0aGF0IGRvbWFpbiBhcmUgZGVzaXJhYmxlLgo+IAo+IENvdWxkIHlvdSBwbGVh
c2UgZWxhYm9yYXRlIG1vcmUgYWJvdXQgdGhpcz8KPiBEbyB5b3UgbWVhbiB0aGF0IG1vcmUgd29y
ZHMgc2hvdWxkIGJlIGFkZGVkIHRvIHRoZSBjb21taXQgbWVzc2FnZSBhYm91dCB4ODY/Cj4gSWYg
c28sIHBsZWFzZSBwcm92aWRlIHdoYXQgaXMgcHJvcGVyIGZyb20geW91ciBwb2ludCBvZiB2aWV3
LgoKSSBzdGlsbCB0aGluayBteSBpbml0aWFsIHJlc3BvbnNlIChzdGlsbCB2aXNpYmxlIGluIGNv
bnRleHQpIHdhcwpzdWZmaWNpZW50LiBBbGwgSSdtIGFmdGVyIGlzIHRoYXQgeW91IHNsaWdodGx5
IHNvZnRlbiB5b3VyIGJvbGQKc3RhdGVtZW50IGluIHRoZSBkZXNjcmlwdGlvbiAobm8gbG9uZ2Vy
IHZpc2libGUgaW4gY29udGV4dCkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
