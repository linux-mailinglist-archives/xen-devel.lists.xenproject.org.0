Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5B647A11
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 08:31:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcl7W-0002XL-7p; Mon, 17 Jun 2019 06:27:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcl7V-0002XG-2Q
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 06:27:57 +0000
X-Inumbo-ID: 085ebd78-90c9-11e9-a04c-1780bb1bdc44
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 085ebd78-90c9-11e9-a04c-1780bb1bdc44;
 Mon, 17 Jun 2019 06:27:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 00:27:50 -0600
Message-Id: <5D0732E30200007800238AEF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 00:27:47 -0600
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
 <c1094660-9c41-9883-8869-f04f95976728@arm.com>
 <848e4c57-7cc2-2d68-bc23-1c01c0329c80@gmail.com>
 <210a3749-46e4-d659-ee5f-6b14990b6ab0@arm.com>
 <12bf2d15-32a1-4978-1cd5-2b365bc61308@gmail.com>
In-Reply-To: <12bf2d15-32a1-4978-1cd5-2b365bc61308@gmail.com>
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

Pj4+IE9uIDE0LjA2LjE5IGF0IDE4OjI1LCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IE9uIDE0LjA2LjE5IDE5OjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdlbGwsIHRoYXQg
YSBzdGFibGUgQUJJLi4uIEV2ZW4gaWYgSSB3b3VsZCBsb3ZlIHRvIHJlbW92ZSBpdCwgeW91IGNh
bid0IGdldCAKPiByaWQgb2Ygb2xkIGd1ZXN0cyB0aGF0IGVhc2lseS4uLgo+IAo+IEluIDUgeWVh
cnMsIGFzIFhFTiBkaWQgZm9yIExLIDMuMTg/CgpJJ20gYWZyYWlkIEkgZG9uJ3QgZXZlbiBrbm93
IGhvdyB0byBiZXN0IHdvcmQgYSByZXBseSB0byB0aGlzLiBXaGF0CmhhcyB0aGUgTGludXgga2Vy
bmVsIHZlcnNpb24gZ290IHRvIGRvIHdpdGggdGhlIGludGVyZmFjZXMgcHJvdmlkZWQKYnkgWGVu
PyBJcyB5b3VyIHJlcGx5IG1lYW50IHRvIHNheSB0aGF0IHNvbWV0aGluZyB3YXMgcmVtb3ZlZApm
cm9tIHRoZSBMaW51eCBrZXJuZWwgaW4gdGhhdCB2ZXJzaW9uPyBUaGF0J3MgZmluZSAtIGNvbnN1
bWVycyBjYW4Kc3RvcCBjb25zdW1pbmcgaW50ZXJmYWNlcyB0aGV5IGRvbid0IGxpa2UgdG8gdXNl
LiBCdXQgWGVuICh0aGUKcHJvZHVjZXIgb2YgaW50ZXJmYWNlcyBsaWtlIHRoZSBvbmUgZGlzY3Vz
c2VkIGhlcmUpIGNhbid0IGxpZ2h0bHkgc3RvcApwcm92aWRpbmcgaW50ZXJmYWNlcywgaXJyZXNw
ZWN0aXZlIG9mIHRoZWlyIHVzZSBpbiB1cHN0cmVhbSBMaW51eC4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
