Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A51C997
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 15:51:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQXoZ-0004JS-Fn; Tue, 14 May 2019 13:49:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQXoX-0004JG-PN
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 13:49:53 +0000
X-Inumbo-ID: 24d3f58e-764f-11e9-b89f-579e73167cd0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24d3f58e-764f-11e9-b89f-579e73167cd0;
 Tue, 14 May 2019 13:49:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 07:49:49 -0600
Message-Id: <5CDAC779020000780022EBA7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 07:49:45 -0600
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
In-Reply-To: <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
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

Pj4+IE9uIDE0LjA1LjE5IGF0IDE1OjA1LCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IE9uIDE0LjA1LjE5IDE1OjAyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2VsbCwgSSB0aGlu
ayBKdWxpYW4ncyBpbXBsaWNhdGlvbiB3YXMgdGhhdCB3ZSBjYW4ndCBzdXBwb3J0IGluIHBhcnRp
Y3VsYXIKPj4gdGhlIGJvb3QgbG9hZGVyIC0+IGtlcm5lbCBoYW5kb3ZlciBjYXNlIHdpdGhvdXQg
ZXh0cmEgbWVhc3VyZXMgKGlmCj4+IGF0IGFsbCksIGFuZCBoZW5jZSBoZSBhZGRlZCB0aGluZ3Mg
dG9nZXRoZXIgYW5kIHNhaWQgd2hhdCByZXN1bHRzCj4+IGZyb20gdGhpcy4gT2YgY291cnNlIGlk
ZWFsbHkgd2UnZCByZWplY3QgbWl4ZWQgcmVxdWVzdHMsIGJ1dCB1bmxlc3MKPj4gc29tZW9uZSBj
YW4gY29tZSB1cCB3aXRoIGEgY2xldmVyIG1lYW5zIG9mIGhvdyB0byBkZXRlcm1pbmUgZW50aXR5
Cj4+IGJvdW5kYXJpZXMgSSdtIGFmcmFpZCB0aGlzIGlzIG5vdCBnb2luZyB0byBiZSBwb3NzaWJs
ZSB3aXRob3V0IGJyZWFraW5nCj4+IGNlcnRhaW4gc2V0dXBzLgo+IAo+ICBGcm9tIG15IHVuZGVy
c3RhbmRpbmcsIGlmIHdlIGFyZSBzcGVha2luZyBvZiBkaWZmZXJlbnQgZW50aXRpZXMgaW4gYSBk
b21haW4gCj4gYW5kIHRoZWlyIGJvdW5kYXJpZXMsIHdlIGhhdmUgdG8gZGVmaW5lIHVucmVnaXN0
ZXIgaW50ZXJmYWNlIGFzIHdlbGwuIFNvIHRoYXQgCj4gdGhvc2UgZW50aXRpZXMgd291bGQgYmUg
YWJsZSB0byB0YWtlIGNhcmUgb2YgdGhlbXNlbHZlcyBleHBsaWNpdGx5LgoKSWYgdGhpcyB3YXMg
YSBjb25jZXJuIG9ubHkgZm9yIG5ld2x5IHdyaXR0ZW4gY29kZSwgdGhpcyB3b3VsZCBiZSBmaW5l
LgpCdXQgeW91IG5lZWQgdG8gbWFrZSBzdXJlIGFsbCBleGlzdGluZyBjb2RlIGFsc28gY29udGlu
dWVzIHRvIHdvcmsKd2l0aCB3aGF0ZXZlciBuZXcgaW50ZXJmYWNlIHlvdSBpbXBsZW1lbnQuIEp1
c3QgYmVjYXVzZSBhIGtlcm5lbAp1c2VzIHlvdXIgbmV3IHBoeXNpY2FsIGFkZHJlc3MgYmFzZWQg
bWVjaGFuaXNtIGRvZXNuJ3QgbWVhbiB0aGUKYm9vdCBsb2FkZXIga25vd3MgdG8gdW5yZWdpc3Rl
ciB3aGF0IGl0IGhhcyByZWdpc3RlcmVkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
