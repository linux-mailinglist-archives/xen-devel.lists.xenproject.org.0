Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B3529826
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 14:38:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU9Pr-00035m-RR; Fri, 24 May 2019 12:35:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU9Pq-00035h-NX
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 12:35:18 +0000
X-Inumbo-ID: 6268f940-7e20-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6268f940-7e20-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 12:35:17 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 06:35:16 -0600
Message-Id: <5CE7E503020000780023204B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 06:35:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com>
 <5CE52014020000780023147E@prv1-mh.provo.novell.com>
 <316af0ff-904b-4cf7-1cb4-08c4ae69c4bd@suse.com>
 <5CE791650200007800231DEA@prv1-mh.provo.novell.com>
 <2a816b64-ae01-23e6-d287-1622e55bc295@suse.com>
 <5CE7ADCA0200007800231E77@prv1-mh.provo.novell.com>
 <7b83d3ab-238a-5262-d67c-4da9c4e4a283@citrix.com>
In-Reply-To: <7b83d3ab-238a-5262-d67c-4da9c4e4a283@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/3] xen: drop in_atomic()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDE0OjMwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjQvMDUvMjAxOSAwOTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI0
LjA1LjE5IGF0IDEwOjM0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDI0LzA1LzIw
MTkgMDg6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDI0LjA1LjE5IGF0IDA3OjQx
LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4gT24gMjIvMDUvMjAxOSAxMjoxMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAyMi4wNS4xOSBhdCAxMTo0NSwgPGpncm9zc0Bz
dXNlLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4+
Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4+Pj4+PiBAQCAtMzE4NSwyMiArMzE4
NSw2IEBAIHN0YXRpYyBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQgX19odm1fY29weSgKPj4+
Pj4+PiAgCj4+Pj4+Pj4gICAgICBBU1NFUlQoaXNfaHZtX3ZjcHUodikpOwo+Pj4+Pj4+ICAKPj4+
Pj4+PiAtICAgIC8qCj4+Pj4+Pj4gLSAgICAgKiBYWFggRGlzYWJsZSBmb3IgNC4xLjA6IFBWLW9u
LUhWTSBkcml2ZXJzIHdpbGwgZG8gZ3JhbnQtdGFibGUgb3BzCj4+Pj4+Pj4gLSAgICAgKiBzdWNo
IGFzIHF1ZXJ5X3NpemUuIEdyYW50LXRhYmxlIGNvZGUgY3VycmVudGx5IGRvZXMgCj4gY29weV90
by9mcm9tX2d1ZXN0Cj4+Pj4+Pj4gLSAgICAgKiBhY2Nlc3NlcyB1bmRlciB0aGUgYmlnIHBlci1k
b21haW4gbG9jaywgd2hpY2ggdGhpcyB0ZXN0IHdvdWxkIAo+IGRpc2FsbG93Lgo+Pj4+Pj4+IC0g
ICAgICogVGhlIHRlc3QgaXMgbm90IG5lZWRlZCB1bnRpbCB3ZSBpbXBsZW1lbnQgc2xlZXBpbmct
b24td2FpdHF1ZXVlIHdoZW4KPj4+Pj4+PiAtICAgICAqIHdlIGFjY2VzcyBhIHBhZ2VkLW91dCBm
cmFtZSwgYW5kIHRoYXQncyBwb3N0IDQuMS4wIG5vdy4KPj4+Pj4+PiAtICAgICAqLwo+Pj4+Pj4+
IC0jaWYgMAo+Pj4+Pj4+IC0gICAgLyoKPj4+Pj4+PiAtICAgICAqIElmIHRoZSByZXF1aXJlZCBn
dWVzdCBtZW1vcnkgaXMgcGFnZWQgb3V0LCB0aGlzIGZ1bmN0aW9uIG1heSBzbGVlcC4KPj4+Pj4+
PiAtICAgICAqIEhlbmNlIHdlIGJhaWwgaW1tZWRpYXRlbHkgaWYgY2FsbGVkIGZyb20gYXRvbWlj
IGNvbnRleHQuCj4+Pj4+Pj4gLSAgICAgKi8KPj4+Pj4+PiAtICAgIGlmICggaW5fYXRvbWljKCkg
KQo+Pj4+Pj4+IC0gICAgICAgIHJldHVybiBIVk1UUkFOU191bmhhbmRsZWFibGU7Cj4+Pj4+Pj4g
LSNlbmRpZgo+Pj4+Pj4gRGVhbGluZyB3aXRoIHRoaXMgVE9ETyBpdGVtIGlzIG9mIGNvdXJzZSBt
dWNoIGFwcHJlY2lhdGVkLCBidXQKPj4+Pj4+IHNob3VsZCBpdCByZWFsbHkgYmUgZGVsZXRlZCBh
bHRvZ2V0aGVyPyBUaGUgYmlnLWRvbWFpbi1sb2NrIGlzc3VlCj4+Pj4+PiBpcyBnb25lIGFmYWly
LCBpbiB3aGljaCBjYXNlIGRyb3BwaW5nIHRoZSAjaWYgMCB3b3VsZCBzZWVtCj4+Pj4+PiBwb3Nz
aWJsZSB0byBtZSwgZXZlbiBpZiBpdCdzIG5vdCBzdHJpY3RseSBuZWVkZWQgd2l0aG91dCB0aGUg
c2xlZXAtCj4+Pj4+PiBvbi13YWl0cXVldWUgYmVoYXZpb3IgbWVudGlvbmVkLgo+Pj4+PiBJIGp1
c3QgaGFkIGEgbG9vayBhbmQgZm91bmQgdGhlIGZvbGxvd2luZyBwYXRoOgo+Pj4+Pgo+Pj4+PiBk
b19kb21jdGwoKSAodGFrZXMgZG9tY3RsX2xvY2sgYW5kIGh5cGVyY2FsbF9kZWFkbG9ja19tdXRl
eCkKPj4+Pj4gICBhcmNoX2RvX2RvbWN0bCgpCj4+Pj4+ICAgICByYXdfY29weV9mcm9tX2d1ZXN0
KCkKPj4+Pj4gICAgICAgY29weV9mcm9tX3VzZXJfaHZtKCkKPj4+Pj4gICAgICAgICBodm1fY29w
eV9mcm9tX2d1ZXN0X2xpbmVhcigpCj4+Pj4+ICAgICAgICAgICBfX2h2bV9jb3B5KCkKPj4+Pj4K
Pj4+Pj4gU28gbm8sIHdlIGNhbid0IGRvIHRoZSBpbl9hdG9taWMoKSB0ZXN0IElNTy4KPj4+PiBP
aCwgcmlnaHQgLSB0aGF0J3MgYSBQVkggY29uc3RyYWludCB0aGF0IGNvdWxkIHByb2JhYmx5IG5v
dCBldmVuCj4+Pj4gYmUgdGhvdWdodCBvZiB0aGF0IHRoZSB0aW1lIHRoZSBjb21tZW50IHdhcyB3
cml0dGVuLiBJJ20gc3RpbGwKPj4+PiBvZiB0aGUgb3BpbmlvbiB0aG91Z2ggdGhhdCBhdCBsZWFz
dCB0aGUgc3RpbGwgYXBwbGljYWJsZSBwYXJ0IG9mCj4+Pj4gdGhlIGNvbW1lbnQgc2hvdWxkIGJl
IGtlcHQgaW4gcGxhY2UuIFdoZXRoZXIgdGhpcyBtZWFucyBhbHNvCj4+Pj4ga2VlcGluZyBpbl9h
dG9taWMoKSBpdHNlbGYgaXMgdGhlbiBhbiBpbmRlcGVuZGVudCBxdWVzdGlvbiwgaS5lLgo+Pj4+
IEkgd291bGRuJ3QgY29uc2lkZXIgaXQgb3Zlcmx5IGJhZCBpZiB0aGVyZSB3YXMgbm8gaW1wbGVt
ZW50YXRpb24KPj4+PiBpbiB0aGUgdHJlZSwgYnV0IHRoZSBhYm92ZSBzdGlsbCBzZXJ2ZWQgYXMg
ZG9jdW1lbnRhdGlvbiBvZiB3aGF0Cj4+Pj4gd291bGQgbmVlZCB0byBiZSByZS1hZGRlZC4gU3Rp
bGwgbXkgcHJlZmVyZW5jZSB3b3VsZCBiZSBmb3IgaXQKPj4+PiB0byBiZSBrZXB0Lgo+Pj4gV291
bGQgeW91IGJlIG9rYXkgd2l0aCByZXBsYWNpbmcgdGhlIHJlbW92ZWQgc3R1ZmYgYWJvdmUgd2l0
aDoKPj4+Cj4+PiAvKgo+Pj4gICogSWYgdGhlIHJlcXVpcmVkIGd1ZXN0IG1lbW9yeSBpcyBwYWdl
ZCBvdXQgdGhpcyBmdW5jdGlvbiBtYXkgc2xlZXAuCj4+PiAgKiBTbyBpbiB0aGVvcnkgd2Ugc2hv
dWxkIGJhaWwgb3V0IGlmIGNhbGxlZCBpbiBhdG9taWMgY29udGV4dC4KPj4+ICAqIFVuZm9ydHVu
YXRlbHkgdGhpcyBpcyB0cnVlIGZvciBQVkggZG9tMCBkb2luZyBkb21jdGwgY2FsbHMgd2hpY2gK
Pj4gLi4uIHRoaXMgaXMgdHJ1ZSBhdCBsZWFzdCBmb3IgLi4uCj4+Cj4+PiAgKiBob2xkcyB0aGUg
ZG9tY3RsIGxvY2sgd2hlbiBhY2Nlc3NpbmcgZG9tMCBtZW1vcnkuIE9UT0ggZG9tMCBtZW1vcnkK
Pj4+ICAqIHNob3VsZCBuZXZlciBiZSBwYWdlZCBvdXQsIHNvIHdlIGFyZSBmaW5lIHdpdGhvdXQg
dGVzdGluZyBmb3IKPj4+ICAqIGF0b21pYyBjb250ZXh0Lgo+Pj4gICovCj4+IE5vdCBzdXJlIGFi
b3V0IHRoaXMgRG9tMC1zcGVjaWZpYyByZW1hcms6IEFyZSB3ZSBjZXJ0YWluIHRoZXJlIGFyZQo+
PiBubyBvdGhlciBwYXRocywgc2ltaWxhciB0byB0aGUgZ250dGFiIG9uZSBoYXZpbmcgYmVlbiBt
ZW50aW9uZWQgdGlsbAo+PiBub3c/Cj4gCj4gV2h5IGlzIF9faHZtX2NvcHkoKSBzbyBzcGVjaWFs
PyAgSXQgaXMganVzdCBvbmUgb2YgbWFueSBwbGFjZXMgd2hpY2ggY2FuCj4gZW5kIHVwIHRvdWNo
aW5nIGd1ZXN0IG1lbW9yeS4KCkFyZSB5b3Ugc3VyZT8gSSB0aGluayBldmVyeXRoaW5nIHRoYXQg
Y2FuIHRvdWNoIGd1ZXN0IChIVk0pIG1lbW9yeQphY3R1YWxseSBlbmRzIHVwIGNhbGxpbmcgaW50
byB0aGlzIGZ1bmN0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
