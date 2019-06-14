Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01C4632E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 17:45:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hboLl-0007Wb-Vg; Fri, 14 Jun 2019 15:42:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hboLk-0007WW-HT
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 15:42:44 +0000
X-Inumbo-ID: 0bd72392-8ebb-11e9-aa87-1fbb467ad9ae
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bd72392-8ebb-11e9-aa87-1fbb467ad9ae;
 Fri, 14 Jun 2019 15:42:42 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 09:42:41 -0600
Message-Id: <5D03C06F020000780023864D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 09:42:39 -0600
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
In-Reply-To: <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
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

Pj4+IE9uIDE0LjA2LjE5IGF0IDE3OjExLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IE9uIDE0LjA2LjE5IDE3OjM5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEFmdGVyIGFsbCB0
aGV5IGhhdmUgZXhhY3RseSB0aGUgc2FtZSBkYXRhLi4uCj4gCj4gWWVzLCBidXQgbm9ybWFsIGd1
ZXN0cyBzaG91bGQgdXNlIG9ubHkgb25lIGludGVyZmFjZS4KCkkgdGhvdWdodCBpdCBoYWQgYmVl
biBjbGFyaWZpZWQgYWxyZWFkeSB0aGF0IG5vcm1hbCBndWVzdHMgY2FuIHZlcnkKd2VsbCB1c2Ug
Ym90aCBpbnRlcmZhY2VzLCBqdXN0IG5vdCBib3RoIGF0IHRoZSBzYW1lIHRpbWU6IEJvb3QgbG9h
ZGVyCmFuZCBPUyBjb3VsZCBkaXNhZ3JlZSBpbiB0aGlzIHJlZ2FyZCwgYXMgdGhlIHByaW1lIGV4
YW1wbGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
