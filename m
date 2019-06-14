Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50B9463F3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 18:23:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbowS-0002zq-Bz; Fri, 14 Jun 2019 16:20:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbowQ-0002zl-H6
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 16:20:38 +0000
X-Inumbo-ID: 569bef5c-8ec0-11e9-9f1c-2342451d2c47
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 569bef5c-8ec0-11e9-9f1c-2342451d2c47;
 Fri, 14 Jun 2019 16:20:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C505128;
 Fri, 14 Jun 2019 09:20:34 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 529623F694;
 Fri, 14 Jun 2019 09:20:33 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
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
From: Julien Grall <julien.grall@arm.com>
Message-ID: <210a3749-46e4-d659-ee5f-6b14990b6ab0@arm.com>
Date: Fri, 14 Jun 2019 17:20:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <848e4c57-7cc2-2d68-bc23-1c01c0329c80@gmail.com>
Content-Language: en-US
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
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC8wNi8yMDE5IDE3OjExLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9uIDE0LjA2LjE5
IDE4OjI0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEJ1dCwgaWYgeW91IGFsbG93IHNvbWV0aGlu
ZywgdGhlbiBtb3N0IGxpa2VseSBzb21lb25lIHdpbGwgdXNlIGl0LiBIb3dldmVyLCAKPj4geW91
IGhhdmUgdG8gZGlmZmVyZW50aWF0ZSBpbXBsZW1lbnRhdGlvbiB2cyBkb2N1bWVudGF0aW9uLgo+
Pgo+PiBJbiB0aGlzIGNhc2UsIEkgZG9uJ3QgdGhpbmsgdGhlIGltcGxlbWVudGF0aW9uIHNob3Vs
ZCBkaWN0YXRlIHdoYXQgaXMgZ29pbmcgdG8gCj4+IGJlIGV4cG9zZWQuCj4+Cj4+IElmIHlvdSBk
b2N1bWVudCB0aGF0IGl0IGNhbid0IGhhcHBlbiwgdGhlbiB5b3UgaGF2ZSByb29tIHRvIGZvcmJp
ZCB0aGUgbWl4IGluIAo+PiB0aGUgZnV0dXJlIChhc3N1bWluZyB0aGlzIGNhbid0IGJlIGRvbmUg
bm93KS4KPj4KPj4gSW4gb3RoZXIgd29yZCwgdGhlIG1vcmUgbGF4IGlzIHRoZSBpbnRlcmZhY2Us
IHRoZSBtb3JlIGRpZmZpY3VsdCBpdCBpcyB0aWdodGVuIAo+PiBpbiB0aGUgZnV0dXJlLgo+Pgo+
PiBJIGFtIG5vdCBnb2luZyB0byBwdXNoIGZvciBhbiBpbXBsZW1lbnRhdGlvbiB0aGF0IGZvcmJp
ZCB0aGUgbWl4LiBCdXQgSSBhbSAKPj4gc3Ryb25nbHkgZ29pbmcgdG8gcHVzaCBmb3IgYW55IGRv
Y3VtZW50YXRpb24gb2YgdGhlIGV4cGVjdGVkIGludGVyYWN0aW9uLiBTbyAKPj4gd2UgZG9uJ3Qg
bWFrZSBvdXIgbGlmZSBtaXNlcmFibGUgbGF0ZXIgb24uCj4gCj4gSSBkbyBub3QgZW5jb3VyYWdl
IHVzaW5nIGJvdGggaW50ZXJmYWNlcyBzaW11bHRhbmVvdXNseSwgaXQgaXMgcG9pbnRsZXNzLgo+
IElmIHlvdSBhcmUgc2F5aW5nIHRoYXQgdGhpcyBtYXR0ZXIgY291bGQgYmUgc29sdmVkIHdpdGgg
dGhlIGFwcHJvcHJpYXRlIAo+IGRvY3VtZW50YXRpb24sIGl0J3MgT0sgd2l0aCBtZS4KPiAKPj4+
IEJUVywgZHJvcHBpbmcgdGhlIG9sZCBpbnRlcmZhY2UgaW1wbGVtZW50YXRpb24gd2lsbCBiZSBt
dWNoIGVhc2llciBpbiBmdXR1cmUgCj4+PiBpZiBpdCB3aWxsIG5vdCBjbGFzaCB3aXRoIHRoZSBu
ZXcgb25lLgo+PiBJIGFtIGFmcmFpZCB3ZSB3aWxsIG5ldmVyIGJlIGFibGUgdG8gcmVtb3ZlIHRo
ZSBvbGQgaW50ZXJmYWNlLgo+IAo+IE1heWJlLgoKV2VsbCwgdGhhdCBhIHN0YWJsZSBBQkkuLi4g
RXZlbiBpZiBJIHdvdWxkIGxvdmUgdG8gcmVtb3ZlIGl0LCB5b3UgY2FuJ3QgZ2V0IHJpZCAKb2Yg
b2xkIGd1ZXN0cyB0aGF0IGVhc2lseS4uLgoKQ2hlZXJzLAoKCj4gCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
