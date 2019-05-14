Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30B1C82D
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:06:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWA0-00058I-TO; Tue, 14 May 2019 12:03:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQW9z-00058A-U1
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:03:55 +0000
X-Inumbo-ID: 564ac480-7640-11e9-a4f4-5f9689e929e8
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 564ac480-7640-11e9-a4f4-5f9689e929e8;
 Tue, 14 May 2019 12:03:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 06:03:49 -0600
Message-Id: <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 06:02:23 -0600
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
In-Reply-To: <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
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

Pj4+IE9uIDE0LjA1LjE5IGF0IDEzOjQ1LCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IE9uIDE0LjA1LjE5IDE0OjI0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSSB0aGluayB0
aGVyZSBhcmUgYW4gYWdyZWVtZW50IHRoYXQgdGhlIHR3byBtZXRob2RzIHNob3VsZCBub3QgYmUg
dXNlZCB0b2dldGhlci4KPj4+Cj4+PiBGb3IgYSBkb21haW4gb3IgZm9yIGEgcGFydGljdWxhciBW
Q1BVPwo+Pj4gSG93IHNob3VsZCB3ZSByZXNwb25zZSBvbiB0aGUgcmVxdWVzdCB0byByZWdpc3Rl
ciBwYWRkciB3aGVuIHdlIGFscmVhZHkgaGF2ZSByZWdpc3RlcmVkIHZhZGRyIGFuZCB2aWNlIHZl
cnNhPwo+PiAKPj4gIEZyb20gdGhlIGRpc2N1c3Npb24gd2l0aCBKYW4sIHlvdSB3b3VsZCB0ZWFy
IGRvd24gdGhlIHByZXZpb3VzIHNvbHV0aW9uIGFuZCB0aGVuCj4+IHJlZ2lzdGVyIHRoZSBuZXcg
dmVyc2lvbi4gU28gdGhpcyBhbGxvd3MgY2FzZXMgbGlrZSBhIGJvb3Rsb2FkZXIgYW5kIGEgCj4g
a2VybmVsIHVzaW5nIGRpZmZlcmVudCB2ZXJzaW9uIG9mIHRoZSBpbnRlcmZhY2UuCj4gCj4gSSdt
IG5vdCBzdXJlIEphbiBzdGF0ZWQgdGhhdCwgaGUgcmF0aGVyIHF1ZXN0aW9uZWQgdGhhdC4KPiAK
PiBKYW4sIGNvdWxkIHlvdSBwbGVhc2UgY29uZmlybSB5b3UgYWdyZWUgdGhhdCBpdCBzaG91bGQg
YmUgZHJvcHBlZCBhbHJlYWR5IAo+IHJlZ2lzdGVyZWQgcnVuc3RhdGUgYW5kIChwb3RlbnRpYWxs
eSkgY2hhbmdlZCB2ZXJzaW9uIGluIGNhc2Ugb2YgdGhlIG5ldyAKPiByZWdpc3RlciByZXF1ZXN0
PwoKV2VsbCwgSSB0aGluayBKdWxpYW4ncyBpbXBsaWNhdGlvbiB3YXMgdGhhdCB3ZSBjYW4ndCBz
dXBwb3J0IGluIHBhcnRpY3VsYXIKdGhlIGJvb3QgbG9hZGVyIC0+IGtlcm5lbCBoYW5kb3ZlciBj
YXNlIHdpdGhvdXQgZXh0cmEgbWVhc3VyZXMgKGlmCmF0IGFsbCksIGFuZCBoZW5jZSBoZSBhZGRl
ZCB0aGluZ3MgdG9nZXRoZXIgYW5kIHNhaWQgd2hhdCByZXN1bHRzCmZyb20gdGhpcy4gT2YgY291
cnNlIGlkZWFsbHkgd2UnZCByZWplY3QgbWl4ZWQgcmVxdWVzdHMsIGJ1dCB1bmxlc3MKc29tZW9u
ZSBjYW4gY29tZSB1cCB3aXRoIGEgY2xldmVyIG1lYW5zIG9mIGhvdyB0byBkZXRlcm1pbmUgZW50
aXR5CmJvdW5kYXJpZXMgSSdtIGFmcmFpZCB0aGlzIGlzIG5vdCBnb2luZyB0byBiZSBwb3NzaWJs
ZSB3aXRob3V0IGJyZWFraW5nCmNlcnRhaW4gc2V0dXBzLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
