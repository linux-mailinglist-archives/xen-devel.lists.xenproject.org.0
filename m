Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D634810
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 15:18:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY9Gn-00069D-PD; Tue, 04 Jun 2019 13:14:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY9Gl-000691-PM
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 13:14:27 +0000
X-Inumbo-ID: acb2d732-86ca-11e9-ae9a-cb2628873085
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acb2d732-86ca-11e9-ae9a-cb2628873085;
 Tue, 04 Jun 2019 13:14:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 07:14:24 -0600
Message-Id: <5CF66EAE02000078002351BE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 07:14:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF667500200007800235116@prv1-mh.provo.novell.com>
 <4c58c2b3-4d47-1a47-59f6-dda8b3077d9d@arm.com>
 <5CF66C2E0200007800235190@prv1-mh.provo.novell.com>
 <54648a1c-5f8a-478e-59eb-6d5343eab8e0@arm.com>
In-Reply-To: <54648a1c-5f8a-478e-59eb-6d5343eab8e0@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/4] PCI: move pdev_list field to common
 structure
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@cirix.com>,
 Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDE1OjA1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpIEphbiwKPiAKPiBPbiA2LzQvMTkgMjowMyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+
IE9uIDA0LjA2LjE5IGF0IDE0OjU1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4g
T24gNi80LzE5IDE6NDIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9wY2kuaAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+Pj4+IEBAIC0x
MjEsNyArMTIxLDkgQEAgc3RydWN0IHBjaV9kZXYgewo+Pj4+ICAgIH07Cj4+Pj4gICAgCj4+Pj4g
ICAgI2RlZmluZSBmb3JfZWFjaF9wZGV2KGRvbWFpbiwgcGRldikgXAo+Pj4+IC0gICAgbGlzdF9m
b3JfZWFjaF9lbnRyeShwZGV2LCAmKGRvbWFpbi0+YXJjaC5wZGV2X2xpc3QpLCBkb21haW5fbGlz
dCkKPj4+PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkocGRldiwgJihkb21haW4pLT5wZGV2X2xp
c3QsIGRvbWFpbl9saXN0KQo+Pj4+ICsKPj4+PiArI2RlZmluZSBoYXNfYXJjaF9wZGV2cyhkKSAo
IWxpc3RfZW1wdHkoJihkKS0+cGRldl9saXN0KSkKPj4+Cj4+PiBUaGlzIGZlZWxzIGEgYml0IHN0
cmFuZ2UgdG8ga2VlcCAiYXJjaCIgaW4gdGhlIG1hY3JvIG5hbWUgd2hlbiB0aGUgY29kZQo+Pj4g
aXMgbm93IGdlbmVyaWMuIEhvdyBhYm91dCAiZG9tYWluX2hhc19wZGV2cyI/Cj4+IAo+PiBJbmRl
ZWQgSSBkaWQgbm90aWNlIHRoaXMgb2RkaXR5IHRvbywgYnV0IGlmIHN1Y2ggYW4gYWRqdXN0bWVu
dCBpcwo+PiB0byBiZSBtYWRlIHRoZW4gaW1vIG5vdCBpbiB0aGlzIHBhdGNoLiBBZnRlciBhbGwg
aW4gdHVybiBJJ2QgbmVlZAo+PiB0byBjaGFuZ2UgYWxsIHVzZSBzaXRlcy4KPiAKPiBJdCBmZWVs
cyB0byBtZSB0aGV5IGFyZSBraW5kIG9mIHRpZWQgdG9nZXRoZXIgYmVjYXVzZSBoYXNfYXJjaF9w
ZGV2cyBpcyAKPiBhbiBhY2Nlc3NvciBvZiB0aGUgZmllbGQuCgpJbiBhIHdheSB0aGV5IGFyZS4g
QnV0IHRoZSBuYW1lIG9mIHRoZSBtYWNybyBoYXNuJ3QgYmVjb21lCiJ3cm9uZyIgYnkgdGhlIGNo
YW5nZSBoZXJlLiBUaGF0IHJlbmFtaW5nIHlvdSBhc2sgZm9yIGNvdWxkCmFsc28gaGF2ZSBiZWVu
IGRvbmUgYSB5ZWFyIGFnbywgaWYgc28gd2FudGVkLgoKPiBCdXQgSSBhbSBoYXBweSB0byBzZWUg
dGhpcyBpbiBhIHNlcGFyYXRlIHBhdGNoZXMuCgpGQU9EIC0gSSBkaWRuJ3QgcHJvbWlzZSBhbnl0
aGluZy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
