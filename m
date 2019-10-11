Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE460D4858
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 21:20:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJ0Ms-0004J5-08; Fri, 11 Oct 2019 19:14:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MXO=YE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iJ0Mr-0004J0-4I
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 19:14:25 +0000
X-Inumbo-ID: 54d98b7c-ec5b-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 54d98b7c-ec5b-11e9-bbab-bc764e2007e4;
 Fri, 11 Oct 2019 19:14:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD7E8142F;
 Fri, 11 Oct 2019 12:14:21 -0700 (PDT)
Received: from [10.37.12.177] (unknown [10.37.12.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F34313F703;
 Fri, 11 Oct 2019 12:14:19 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191613060.19418@sstabellini-ThinkPad-T480s>
 <5a093a67-51f6-2d3d-6a98-87753cf4d186@arm.com>
 <alpine.DEB.2.21.1909200813510.3272@sstabellini-ThinkPad-T480s>
 <72de38de-2856-8873-ed70-6c354786bba3@arm.com>
 <alpine.DEB.2.21.1910021756570.2691@sstabellini-ThinkPad-T480s>
 <40fc893e-2739-2fec-4b17-2aaa733ddc6c@arm.com>
 <alpine.DEB.2.21.1910071620140.13684@sstabellini-ThinkPad-T480s>
 <c9b7bd90-344c-77a1-0191-c215f1b201c1@arm.com>
 <alpine.DEB.2.21.1910081422040.13684@sstabellini-ThinkPad-T480s>
 <69bdb4a8-a50f-61cf-f685-867f67436555@arm.com>
 <alpine.DEB.2.21.1910101729000.9081@sstabellini-ThinkPad-T480s>
 <ef551ef4-f4a2-4829-1405-2bcf541f17c3@arm.com>
 <alpine.DEB.2.21.1910111002250.6326@sstabellini-ThinkPad-T480s>
 <50786e73-e98a-2eea-f4b8-396afa1ef7ca@arm.com>
 <alpine.DEB.2.21.1910111156140.6326@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <89b71a11-b87f-3686-58f0-99f88bd934bc@arm.com>
Date: Fri, 11 Oct 2019 20:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910111156140.6326@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8xMS8xOSA4OjAxIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gRnJp
LCAxMSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBTdGVmYW5vLAo+Pgo+PiBP
biAxMC8xMS8xOSA2OjExIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4gVGhpcyBp
cyBub3QgcHJldHR5LCBidXQgSSBkb24ndCB2aWV3IHRoaXMgYXMgY3JpdGljYWwgdG8gZml4IGZv
ciBYZW4gNC4xMy4KPj4+PiBTbwo+Pj4+IEkgYW0gdGhpbmtpbmcgdG8gZGVmZXIgdGhpcyBwb3N0
IDQuMTMuCj4+Pgo+Pj4gSWYgdGhlIGlzc3VlIGRvZXNuJ3QgdHJpZ2dlciBvbiA0LjEzLCB0aGVu
IEkgYWdyZWUgd2Ugc2hvdWxkbid0IHRyeSB0bwo+Pj4gZml4IGl0IChiYWRseSkgYXQgdGhpcyBz
dGFnZS4KPj4+Cj4+PiBCdXQgd2UgZG8gaGF2ZSBhICJtaW51cyBwaHlzX29mZnNldCIgb3BlcmF0
aW9uIGluIGR1bXBfaHlwX3dhbGssIEkgZG9uJ3QKPj4+IGZvbGxvdyB3aHkgd2Ugd291bGRuJ3Qg
c2VlIGEgcHJvYmxlbSBpZiBYZW4gaXMgbG9hZGVkIGF0IDFNQiBvbiBhcm0zMi4KPj4KPj4gSSBo
YXZlbid0IHNhaWQgdGhlIGlzc3VlIGNhbm5vdCBiZSB0cmlnZ2VyZWQuIEkgcG9pbnRlZCBvdXQg
SSBkb24ndCB2aWV3IHRoaXMKPj4gYXMgY3JpdGljYWwuCj4+Cj4+IE9uZSBvZiB0aGUgcmVhc29u
IGlzIHRoYXQgSSBiZXQgbm9ib2R5IGV2ZXIgcnVuIFhlbiBiZWxvdyAxTUIgb24gQXJtMzIuCj4+
IE90aGVyd2lzZSB0aGV5IHdvdWxkIGhhdmUgc2VlbiBhbiBlcnJvci4uLgo+Pgo+PiBJbiBvdGhl
ciB3b3JkcywgSSBhbSBub3QgZ29pbmcgdG8gcGxhbiB0byBmaXggaXQgZm9yIFhlbiA0LjEzLiBI
b3dldmVyLCBpZgo+PiBzb21lb25lIHdhbnRzIHRvIHNwZW5kIHRpbWUgb24gaXQgKGFuZCBoYXZl
IHBsYXRmb3JtIHRvIHRlc3QgaXQpLCB0aGVuIHBhdGNoCj4+IGFyZSB3ZWxjb21lZC4KPiAKPiBJ
ZiB0aGUgaXNzdWUgY2FuIGJlIHRyaWdnZXJlZCB0aGVuIEkgdGhpbmsgd2UgaGF2ZSBhIGNob2lj
ZSBiZXR3ZWVuCj4gZml4aW5nIGl0ICh5b3UgZG9uJ3QgbmVjZXNzYXJpbHkgaGF2ZSB0byBiZSB0
aGUgb25lIHRvIGRvIGl0KSBvcgo+IGRvY3VtZW50aW5nIHRoYXQgWGVuIG5lZWRzIHRvIGJlIGxv
YWRlZCBhYm92ZSBYRU5fVklSVF9BRERSIG9uIGFybTMyLgoKQXMgSSBzYWlkIGJlZm9yZSBvbiBh
IHNpbWlsYXIgdG9waWMsIGlmIHdlIGRvY3VtZW50IHRoaXMsIHdlIGFsc28gbmVlZCAKdG8gZG9j
dW1lbnQgdGhhdCBvdXIgWGVuIGJvb3QgY29kZSBpcyBkZWZpbml0ZWx5IG5vdCBjb21wbGlhbnQg
d2l0aCB0aGUgCkFybSBBcm0gYW5kIHlvdSBhcmUgYXQgcmlzayB0byBub3QgYmUgYWJsZSB0byBi
b290IDspLgoKPj4+IFhlbiBwYTogMHgxMDAwMDAKPj4+IFhlbiB2YTogMHgyMDAwMDAKPj4+IHBo
eXNfb2Zmc2V0OiAweGZmZjAwMDAwCj4+Pgo+Pj4gdGVzdF92YTogMHgyMDIwMDAKPj4+IHRlc3Rf
dmEgLSBwaHlzX29mZnNldCA9IDB4ZmZmZmZmZmYwMDMwMDIwMC4gQnV0IGl0IHNob3VsZCBiZSAw
eDEwMjAwMC4gPgo+Pj4gR2l2ZW4gdGhhdCB0aGUgcHJvYmxlbSBpcyBpbiBhIEJVR19PTiBtYXli
ZSB3ZSBjb3VsZCByZW1vdmUgaXQ/IE9yIGp1c3QKPj4+IHJld29yayB0aGUgQlVHX09OPwo+Pgo+
PiBGb3IgYXJtMzIsIGR1bXBfaHlwX3dhbGsoKSBpcyBvbmx5IGNhbGxlZCB3aGVuIHRoZSBBVCBp
bnN0cnVjdGlvbiBmYWlscyB0bwo+PiB0cmFuc2xhdGUgYSBwaHlzaWNhbCBhZGRyZXNzLiBZb3Ug
YXJlIGFscmVhZHkgZG9pbmcgc29tZXRoaW5nIHdyb25nIGlmIHlvdQo+PiBoaXQsIHNvIHlvdSB3
aWxsIHBhbmljIGluIGVpdGhlciBjYXNlLiBUaGUgb25seSBkaWZmZXJlbmNlIGlzIHlvdSBkb24n
dCBnZXQKPj4gdGhlIHBhZ2UtdGFibGUgZHVtcGVkLgo+IAo+IFdoeSBkb24ndCB3ZSBjaGFuZ2Ug
dGhlIEJVR19PTiBsaWtlIHRoZSBmb2xsb3dpbmc6Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPiBpbmRleCBhNjYzN2NlMzQ3Li5iNzg4M2Nm
YmFiIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4gKysrIGIveGVuL2FyY2gvYXJt
L21tLmMKPiBAQCAtMjg0LDEwICsyODQsNyBAQCB2b2lkIGR1bXBfaHlwX3dhbGsodmFkZHJfdCBh
ZGRyKQo+ICAgICAgICAgICAgICAib24gQ1BVJWQgdmlhIFRUQlIgMHglMDE2IlBSSXg2NCJcbiIs
Cj4gICAgICAgICAgICAgIGFkZHIsIHNtcF9wcm9jZXNzb3JfaWQoKSwgdHRicik7Cj4gICAKPiAt
ICAgIGlmICggc21wX3Byb2Nlc3Nvcl9pZCgpID09IDAgKQo+IC0gICAgICAgIEJVR19PTiggKGxw
YWVfdCAqKSh1bnNpZ25lZCBsb25nKSh0dGJyIC0gcGh5c19vZmZzZXQpICE9IHBndGFibGUgKTsK
PiAtICAgIGVsc2UKPiAtICAgICAgICBCVUdfT04oIHZpcnRfdG9fbWFkZHIocGd0YWJsZSkgIT0g
dHRiciApOwo+ICsgICAgQlVHX09OKCB2aXJ0X3RvX21hZGRyKHBndGFibGUpICE9IHR0YnIgKTsK
PiAgICAgICBkdW1wX3B0X3dhbGsodHRiciwgYWRkciwgSFlQX1BUX1JPT1RfTEVWRUwsIDEpOwo+
ICAgfQo+ICAgCj4gV2UgcHJvYmFibHkgZG9uJ3QgbmVlZCB0aGUgQ1BVMCBzcGVjaWFsIGNhc2U/
CgpXZSBkb24ndCBuZWVkIGl0LiBQYXRjaCBhcmUgd2VsY29tZWQuCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
