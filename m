Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339330CA7
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:33:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWeog-0001Xm-4z; Fri, 31 May 2019 10:31:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWeoe-0001Xh-PC
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:31:16 +0000
X-Inumbo-ID: 37764004-838f-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 37764004-838f-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 10:31:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 04:31:13 -0600
Message-Id: <5CF1026F0200007800233ED8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 04:31:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
 <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
 <5CF0FC080200007800233E50@prv1-mh.provo.novell.com>
 <7ca91b27-1c37-70ab-e367-494603e4464d@arm.com>
In-Reply-To: <7ca91b27-1c37-70ab-e367-494603e4464d@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDEyOjEwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvMzEvMTkgMTE6MDMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMS4wNS4x
OSBhdCAxMTo1MiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDUvMzEvMTkg
MTA6NDkgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDMxLjA1LjE5IGF0IDExOjQy
LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiBPbiA1LzMxLzE5IDEwOjM1IEFN
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4+
Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+Pj4+Pj4gQEAgLTY0NCw2ICs2NDQsOSBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgZmlsdGVyZWRfZmx1c2hfdGxiX21hCj4+Pj4+PiAgICAgCj4+
Pj4+PiAgICAgLyogUHJpdmF0ZSBkb21haW4gc3RydWN0cyBmb3IgRE9NSURfWEVOLCBET01JRF9J
TywgZXRjLiAqLwo+Pj4+Pj4gICAgIGV4dGVybiBzdHJ1Y3QgZG9tYWluICpkb21feGVuLCAqZG9t
X2lvLCAqZG9tX2NvdzsKPj4+Pj4KPj4+Pj4gRG9uJ3QgeW91IHdhbnQgdG8gcHJvdGVjdCBkb21f
Y293IHdpdGggIiNpZmRlZiBDT05GSUdfSEFTX01FTV9TSEFSSU5HIj8KPj4+Pgo+Pj4+IFRoZXJl
J3Mgbm8gbmVlZCB0byB3aXRoIC4uLgo+Pj4+Cj4+Pj4+PiArI2lmbmRlZiBDT05GSUdfSEFTX01F
TV9TSEFSSU5HCj4+Pj4+PiArIyBkZWZpbmUgZG9tX2NvdyBOVUxMCj4+Pj4+PiArI2VuZGlmCj4+
Pj4KPj4+PiAuLi4gdGhpcywgYW5kIHRoaXMgd2F5IHRoZXJlJ3MgbGVzcyBjbHV0dGVyIG92ZXJh
bGwuCj4+Pgo+Pj4gSSBhbSBhbGwgZm9yIGF2b2lkaW5nIGNsdXR0ZXJpbmcgYnV0IG5vdCBhdCB0
aGUgZXhwZW5zZSBvZiBtYWtpbmcgdGhlCj4+PiBjb2RlIGxlc3MgaW50dWl0aXZlLiBJbiB0aGlz
IGNhc2UsIEkgd291bGQgcHJlZmVyIHRoZSBkZWNsZXJhdGlvbgo+Pj4gZG9tX2NvdyB0byBiZSBn
dWFyZGVkLgo+PiAKPj4gV2hpbGUgaXQgd291bGQgYmUgZWFzeSBlbm91Z2ggdG8gZG8sIEkgZmFp
bCB0byBzZWUgaG93IHRoZSBjaG9zZW4KPj4gY29uc3RydWN0IGlzIG5vdCAiaW50dWl0aXZlIi4K
PiAKPiBFdmVuIGlmIEkga25vdyB0aGUgcHJlLXByZXByb2Nlc3NvciB3aWxsIGRvIHRoZSByaWdo
dCB0aGluZyBoZXJlLCB5b3UgCj4gY291bGQgc3BhcmUgdGhlIGRldmVsb3BwZXIgdG8gdHJpcCBv
dmVyIHRoaXMgY29kZSBhbmQgd29uZGVyIHdoeSBpdCBpcyAKPiBmaXJzdCBkZWZpbmVkIGFuZCB0
aGVuIG92ZXJyaWRlIHdpdGggTlVMTC4KClRvIGJlIGhvbmVzdCwgYW4gdW5jb25kaXRpb25hbCBk
ZWNsYXJhdGlvbiB3aXRoIGEgY29uZGl0aW9uYWwKb3ZlcnJpZGUgZG9lc24ndCBsZWF2ZSBtdWNo
IHRvIHdvbmRlciBhYm91dC4gSSdsbCB3YWl0IHRvIHNlZQp3aGF0IG90aGVyIG1haW50YWluZXJz
IHRoaW5rIGJlZm9yZSBkZWNpZGluZyBlaXRoZXIgd2F5LgoKPj4gSW4gZmFjdCBJIGRvbid0IHRo
aW5rIHRoaXMgd291bGQgYmUgdGhlCj4+IGZpcnN0IGluc3RhbmNlIG9mIGEgI2RlZmluZSBvdmVy
cmlkaW5nIGEgcHJpb3IgZGVjbGFyYXRpb24uIERvaW5nIHNvCj4+IHV0aWxpemVzIG9uZSBvZiB0
aGUgdmVyeSBiYXNpYyBDIHByZXByb2Nlc3NvciBwcmluY2lwbGVzLgo+IAo+IFlvdSBhcmUgdGhl
IGZpcnN0IG9uZSB1c3VhbGx5IHRvIHNheSB0aGF0IHNvbWUgY2hvaWNlcyBpbiBYZW4gd2VyZSBu
b3QgCj4gY29ycmVjdCBhbmQgdGhlcmVmb3JlIG5vIG1vcmUgaW5zdGFuY2Ugc2hvdWxkIGJlIGFk
ZGVkLgoKT2gsIGRpZCBteSBlYXJsaWVyIHJlcGx5IHNvdW5kIGFzIGlmIEknbSBub3QgaGFwcHkg
YWJvdXQgdGhvc2UKbWVudGlvbmVkIGluc3RhbmNlcz8gSSBjZXJ0YWlubHkgZGlkbid0IG1lYW4g
aXQgdG8gYmUgdGhhdCB3YXkgLQpzb21lIG9mIHRoZW0gSSdtIGxpYWJsZSB0byBoYXZlIGludHJv
ZHVjZWQgbXlzZWxmLCBhbmQgSQpjb250aW51ZSB0byBhcHByb3ZlIG9mIHRoZW0gYmVpbmcgdGhl
cmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
