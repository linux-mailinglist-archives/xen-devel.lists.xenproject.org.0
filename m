Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E8112752
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:29:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icQwb-0001u8-Fn; Wed, 04 Dec 2019 09:27:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DlgT=Z2=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1icQwa-0001tf-DR
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:27:36 +0000
X-Inumbo-ID: 4b1bad12-1678-11ea-99dd-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4b1bad12-1678-11ea-99dd-bc764e2007e4;
 Wed, 04 Dec 2019 09:27:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB2D01FB;
 Wed,  4 Dec 2019 01:27:29 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D666F3F52E;
 Wed,  4 Dec 2019 01:27:28 -0800 (PST)
Date: Wed, 4 Dec 2019 09:27:25 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20191204092725.0ccab913@donnerap.cambridge.arm.com>
In-Reply-To: <796e5014-9eee-a084-714c-eab63021f65b@xen.org>
References: <20191202084924.29893-1-tiny.windzz@gmail.com>
 <86d52917-1ba3-a660-2502-56b9657086b9@xen.org>
 <20191203143818.09e74f25@donnerap.cambridge.arm.com>
 <796e5014-9eee-a084-714c-eab63021f65b@xen.org>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: Basic support for sunxi/sun50i h6
 platform.
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAzIERlYyAyMDE5IDE2OjUyOjQ1ICswMDAwCkp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOgoKSGksCgo+IE9uIDAzLzEyLzIwMTkgMTQ6MzgsIEFuZHJlIFByenl3YXJh
IHdyb3RlOgo+ID4gT24gVHVlLCAzIERlYyAyMDE5IDExOjM5OjU4ICswMDAwCj4gPiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPiA+IAo+ID4gSGksCj4gPiAgIAo+ID4+ICgr
QW5kcmUpCj4gPj4KPiA+PiBIaSwKPiA+Pgo+ID4+IEBBbmRyZSwgSUlSQyB5b3Ugb3JpZ2luYWxs
eSBhZGRlZCB0aGUgc3VwcG9ydCBmb3Igc3VueGkgaW4gWGVuLiBDb3VsZAo+ID4+IHlvdSBoYXZl
IGEgbG9vayBhdCB0aGlzIHBhdGNoPyAgCj4gPiAKPiA+IExvb2tzIGFscmlnaHQsIGFuZCBpbmRl
ZWQgdGhlIEg2IG5lZWRzIGl0LiBFdmVuIHRob3VnaCBBbGx3aW5uZXIgdG90YWxseSByZS1hcnJh
bmdlZCB0aGUgbWVtb3J5IG1hcCwgdGhleSBtaXNzZWQgdGhlIG9wcG9ydHVuaXR5IHRvIHB1dCBl
YWNoIGRldmljZSBhdCBsZWFzdCBpbiB0aGVpciBvd24gNEsgcGFnZS4KPiA+IAo+ID4gUmV2aWV3
ZWQtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPiAgCj4gCj4gVGhh
bmsgeW91IGZvciB0aGUgcmV2aWV3IQo+IAo+ID4gCj4gPiBJZiB5b3UgY2FuIHdhaXQgdGlsbCB0
aGlzIGV2ZW5pbmcsIEkgY2FuIGV2ZW4gdGVzdCBpdC4gIAo+IAo+IEkgY2FuIHdhaXQgdW50aWwg
dG9tb3Jyb3cgYmVmb3JlIGNvbWl0dGluZyB0aGUgcGF0Y2guCgpJIGJvb3RlZCBYZW4gNC4xMi4x
IHRvIHRoZSBEb20wIHByb21wdCBvbiB0aGUgUGluZSBINjQsIGFuZCBzYXcgYWxsIHRoZSBzZXJp
YWwgZGV2aWNlcyBpbiAvc3lzL2Zpcm13YXJlL2RldmljZXRyZWUvYmFzZS9zb2MuIFRoZW4gSSBh
cHBsaWVkIHRoZSBwYXRjaCwgYW5kIHRoZSBzZXJpYWwgZGV2aWNlcyB3ZXJlIGdvbmUuIEFuZCB5
ZXMsIGFsbCB0aGUgZm91ciBtYWluIHNlcmlhbCBwb3J0cyBzaGFyZSBvbmUgNEsgcGFnZSBvbiB0
aGUgSDYuCgpUZXN0ZWQtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29t
PgoKQ2hlZXJzLApBbmRyZS4KCj4gPiBJdCdzIGFjdHVhbGx5IGEgc2hhbWUgdGhhdCB3ZSBuZWVk
IHRoaXMgZW51bWVyYXRpb24sIHdoZW4gYWxsIHdlIGFyZSBhZnRlciBpcyBhbiBhbnN3ZXIgdG8g
dGhlIHF1ZXN0aW9uOiBEb2VzIGEgZGV2aWNlIHVzZWQgYnkgWGVuIHNoYXJlIGEgNEsgcGFnZSB3
aXRoIGEgZGV2aWNlIGhhbmRlZCBvZmYgdG8gRG9tMD8gSXQgc291bmRzICAgCj4gbGlrZSBhIG5p
Y2UgcmFpbnkgYWZ0ZXJub29uIGV4ZXJjaXNlIHRvIHNjYW4gdGhlIERUIHRvIGZpbmQgdGhvc2Ug
Cj4gZGV2aWNlcyBhdXRvbWF0aWNhbGx5IGFuZCBtYXNrIHRoZW0gKG9uIHRoZSBBNjQgZm9yIGlu
c3RhbmNlIFVBUlQ0IGlzIG9uIAo+IGEgZGlmZmVyZW50IHBhZ2UpLgo+IAo+IEkgYWdyZWUgYW5k
IEkgdGhpbmsgd2UgZGlzY3Vzc2VkIGFib3V0IGl0IGJlZm9yZSA6KS4gSSB3b3VsZCB3ZWxjb21l
IAo+IHN1Y2ggaW1wcm92ZW1lbnQgaW4gWGVuLCB0aGlzIHdvdWxkIGFjdHVhbGx5IGFsbG93IHVz
IHRvIGRyb3Agc3VueGkuYyAKPiBjb21wbGV0ZWx5Lgo+IAo+IENoZWVycywKPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
