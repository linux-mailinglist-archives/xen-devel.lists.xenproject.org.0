Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3783C471
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 08:47:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haaVm-0003X8-6h; Tue, 11 Jun 2019 06:44:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1haaVk-0003X3-PS
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 06:44:00 +0000
X-Inumbo-ID: 4aa22754-8c14-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4aa22754-8c14-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 06:43:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 00:43:58 -0600
Message-Id: <5CFF4DA60200007800236D45@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 00:43:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
 <1b21850b-29a0-37da-2765-54ce51783a7b@arm.com>
In-Reply-To: <1b21850b-29a0-37da-2765-54ce51783a7b@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA2LjE5IGF0IDIyOjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpLAo+IAo+IE9uIDYvNS8xOSA1OjAxIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gICA+IE9u
IDA1LzA2LzIwMTkgMTY6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gSnVsaWVuLAo+Pj4KPj4+
Pj4+IE9uIDE2LjA1LjE5IGF0IDE1OjM3LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdy
b3RlOgo+Pj4+IEFzIGJ1aWxkIHN5c3RlbSBub3cgc3VwcG9ydHMgKl9kZWZjb25maWcgcnVsZXMg
aXQgaXMgZ29vZCB0byBiZSBhYmxlCj4+Pj4gdG8gY29uZmlndXJlIG1pbmltYWwgWEVOIGltYWdl
IHdpdGgKPj4+Pgo+Pj4+ICAgbWFrZSB0aW55NjRfZGVmY29uZmlnCj4+Pj4KPj4+PiBjb21tYW5k
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9i
YWJjaHVrQGVwYW0uY29tPgo+Pj4KPj4+IHlvdSBoYWQgb2JqZWN0aW9ucyBoZXJlLCBhbmQgdGhl
IGZpcnN0IHBhdGNoIG1ha2VzIGxpdHRsZSBzZW5zZQo+Pj4gd2l0aG91dCB0aGUgMm5kLiBNYXkg
SSBhc2sgd2hhdCB0aGUgdmVyZGljdCBpcywgaS5lLiB3aGV0aGVyIEkgc2hvdWxkCj4+PiBkcm9w
IHRoZXNlIHR3byBmcm9tIG15IGxpc3Qgb2YgcGVuZGluZyBwYXRjaGVzPwo+PiAKPj4gVm9sb2R5
bXlyIHdhcyBnb2luZyB0byByZXNlbmQgdGhlIHNlcmllcyB3aXRoIGRvY3VtZW50YXRpb24gKGFz
IGEgCj4+IHNlcGFyYXRlIHBhdGNoKS4gQnV0IEkgd291bGQgYmUgaGFwcHkgdG8gdGFrZSAjMSBh
bmQgIzIgYXNzdW1pbmcgdGhhdCAKPj4gZG9jdW1lbnRhdGlvbiBwYXRjaCBpcyBnb2luZyB0byBi
ZSBzZW50Lgo+PiAKPj4gWW91IGNhbiBjb25zaWRlciB0aGlzIGFzIGFuIGFja2VkOgo+PiAKPj4g
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IGZvciB0aGUgdHdv
IHBhdGNoZXMuCj4gCj4gSSB3YXMgYWJvdXQgdG8gYXBwbHkgdGhlIHR3byBwYXRjaGVzLCBidXQg
SSBkb24ndCBzZWVtIHRvIGJlIGFibGUgdG8gCj4gYXBwbHkgaXQgYmVjYXVzZSBzb21lIGxpbmVz
IGNvbnRhaW5zID0yMC4gQUZBSUNULCBpdCBpcyBpbiByZXBsYWNlbWVudCAKPiBvZiAic3BhY2Ui
IGluIGNlcnRhaW4gY2FzZS4KCldlbGwsIGluZGVwZW5kZW50IG9mIGFueSBmb3JtYXR0aW5nIGlz
c3VlcyB5b3Ugb3VnaHQgdG8gaGF2ZSB0cm91YmxlCmFwcGx5aW5nIHRoZW0gc2luY2UgSSBkaWQg
c28gYWxyZWFkeS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
