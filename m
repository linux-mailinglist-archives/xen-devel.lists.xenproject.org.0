Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF8447A12
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 08:31:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcl8Y-0002cl-Tu; Mon, 17 Jun 2019 06:29:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcl8W-0002cR-SK
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 06:29:00 +0000
X-Inumbo-ID: 3057499e-90c9-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3057499e-90c9-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 06:28:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 00:28:58 -0600
Message-Id: <5D0733230200007800238AF2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 00:28:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <andrii.anisov@gmail.com>
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
 <5D0252300200007800237E93@prv1-mh.provo.novell.com>
 <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
 <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
 <a439c5ec-cec5-51be-bf76-eebdf50cf1bb@arm.com>
 <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
 <5D03C06F020000780023864D@prv1-mh.provo.novell.com>
 <46e206de-dd8e-6931-bda6-32af5c7ba964@gmail.com>
In-Reply-To: <46e206de-dd8e-6931-bda6-32af5c7ba964@gmail.com>
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

Pj4+IE9uIDE0LjA2LjE5IGF0IDE4OjIzLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IE9uIDE0LjA2LjE5IDE4OjQyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTQuMDYu
MTkgYXQgMTc6MTEsIDxhbmRyaWkuYW5pc292QGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBPbiAxNC4w
Ni4xOSAxNzozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEFmdGVyIGFsbCB0aGV5IGhhdmUg
ZXhhY3RseSB0aGUgc2FtZSBkYXRhLi4uCj4+Pgo+Pj4gWWVzLCBidXQgbm9ybWFsIGd1ZXN0cyBz
aG91bGQgdXNlIG9ubHkgb25lIGludGVyZmFjZS4KPj4gCj4+IEkgdGhvdWdodCBpdCBoYWQgYmVl
biBjbGFyaWZpZWQgYWxyZWFkeSB0aGF0IG5vcm1hbCBndWVzdHMgY2FuIHZlcnkKPj4gd2VsbCB1
c2UgYm90aCBpbnRlcmZhY2VzLCBqdXN0IG5vdCBib3RoIGF0IHRoZSBzYW1lIHRpbWU6IEJvb3Qg
bG9hZGVyCj4+IGFuZCBPUyBjb3VsZCBkaXNhZ3JlZSBpbiB0aGlzIHJlZ2FyZCwgYXMgdGhlIHBy
aW1lIGV4YW1wbGUuCj4gCj4gSSBtaXNzZWQgImF0IHRoZSBzYW1lIHRpbWUiLgo+IAo+IFdlIG1h
eSByZXF1aXJlIGV4aXN0aW5nIHJ1bnN0YXRlIGFyZWEgdW5yZWdpc3RlcmluZyBpZiB0aGUgc3lz
dGVtIGlzIGF3YXJlIAo+IG9mIGl0LiBCdXQgaXQgaXMgZm9yIHRoZSBuZXcgaW50ZXJmYWNlLgo+
IFRoZSBvbGQgb25lIGhhcyBubyBkb2N1bWVudGF0aW9uIGFib3V0IHRoZSB1bnJlZ2lzdGVyaW5n
LiBUaGUgaW1wbGljaXQgd2F5IAo+IGlzIGtub3duIHRvIHVzLCBidXQgbm90IGtub3duIHRvIHVz
ZXJzLgo+IEhvdyB0byBzb2x2ZSB0aGUgY2xhc2g/CgpBbmQgb25jZSBhZ2FpbiBJJ20gbm90IHN1
cmUgd2hhdCB0byBhbnN3ZXIsIGNvbnNpZGVyaW5nIHRoYXQgSSd2ZQphbHJlYWR5IG91dGxpbmVk
IGEgcG9zc2libGUgbW9kZWwgKHdpdGhvdXQgYW55IGV4cGxpY2l0IHVucmVnaXN0cmF0aW9uKS4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
