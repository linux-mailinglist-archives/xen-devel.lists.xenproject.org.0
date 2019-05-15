Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF631F214
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 14:03:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQsZb-0005ig-A7; Wed, 15 May 2019 11:59:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQsZZ-0005iR-JM
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 11:59:49 +0000
X-Inumbo-ID: efcb7716-7708-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id efcb7716-7708-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 11:59:48 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 15 May 2019 05:59:47 -0600
Message-Id: <5CDBFF32020000780022F3A1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 15 May 2019 05:59:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <andrii.anisov@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
 <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
 <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
 <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
 <5CDAC779020000780022EBA7@prv1-mh.provo.novell.com>
 <9a285538-2c98-2b3d-9c1c-f7a21f9de890@gmail.com>
In-Reply-To: <9a285538-2c98-2b3d-9c1c-f7a21f9de890@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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

Pj4+IE9uIDE1LjA1LjE5IGF0IDEwOjQ0LCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IE9uIDE0LjA1LjE5IDE2OjQ5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSWYgdGhpcyB3YXMg
YSBjb25jZXJuIG9ubHkgZm9yIG5ld2x5IHdyaXR0ZW4gY29kZSwgdGhpcyB3b3VsZCBiZSBmaW5l
Lgo+PiBCdXQgeW91IG5lZWQgdG8gbWFrZSBzdXJlIGFsbCBleGlzdGluZyBjb2RlIGFsc28gY29u
dGludWVzIHRvIHdvcmsKPj4gd2l0aCB3aGF0ZXZlciBuZXcgaW50ZXJmYWNlIHlvdSBpbXBsZW1l
bnQuCj4gCj4gQW5kIHRoYXQgaXMgb25lIG1vcmUgcmVhc29uIHdoeSBJIHRlbmQgdG8gaW50cm9k
dWNlIHRoZSBuZXcgaW50ZXJmYWNlIGluIAo+IHBhcmFsbGVsIHRvIGJlIGZ1bGx5IGluZGVwZW5k
ZW50IGZyb20gdGhlIG9sZCBvbmUuCj4gQnV0IG5vdCBkbyBhIG1peGVkIGltcGxlbWVudGF0aW9u
IGFzIHlvdSBhbmQgSnVsaWVuIHN1Z2dlc3QuCgpXaGF0IGJlaGF2aW9yIGd1ZXN0cyBzZWUgYW5k
IGhvdyBpdCBpcyBpbXBsZW1lbnRlZCBpbiB0aGUgaHlwZXJ2aXNvcgphcmUgdHdvIGxhcmdlbHkg
aW5kZXBlbmRlbnQgdGhpbmdzLiBUaGF0IGlzLCB3ZSBjb3VsZCBjaG9vc2UgdG8gZm9yYmlkCm1p
eGluZyBvZiByZWdpc3RyYXRpb24gbWV0aG9kcyB3aGlsZSBzdGlsbCBoYXZpbmcgc29tZSBsZXZl
bCBvZiBjb2RlCnNoYXJpbmcgYmV0d2VlbiBob3cgYm90aCBoeXBlcmNhbGwgdmFyaWFudHMgZ2V0
IGFjdHVhbGx5IHByb2Nlc3NlZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
