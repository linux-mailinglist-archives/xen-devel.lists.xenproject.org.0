Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B979632FC7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:37:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXmAK-0004OW-Vy; Mon, 03 Jun 2019 12:34:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXmAJ-0004OH-Lj
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:34:15 +0000
X-Inumbo-ID: e565e1b6-85fb-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e565e1b6-85fb-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 12:34:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27D0415A2;
 Mon,  3 Jun 2019 05:34:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D0393F5AF;
 Mon,  3 Jun 2019 05:34:13 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-6-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5b6b6565-b189-a681-f004-3b94c9cbd064@arm.com>
Date: Mon, 3 Jun 2019 13:34:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-6-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 05/10] xen/arm: optee: add std call
 handling
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMjEvMDUvMjAxOSAyMjoyNiwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gVGhlIG1haW4gd2F5IHRvIGNvbW11bmljYXRlIHdpdGggT1AtVEVFIGlzIHRvIGlzc3Vl
IHN0YW5kYXJkIFNNQ0NDCj4gY2FsbC4gIlN0YW5kYXJkIiBpcyBhIFNNQ0NDIHRlcm0gYW5kIGl0
IG1lYW5zIHRoYXQgY2FsbCBjYW4gYmUKPiBpbnRlcnJ1cHRlZCBhbmQgT1AtVEVFIGNhbiByZXR1
cm4gY29udHJvbCB0byBOVyBiZWZvcmUgY29tcGxldGluZwo+IHRoZSBjYWxsLgo+IAo+IEluIGNv
bnRyYXN0IHdpdGggZmFzdCBjYWxscywgd2hlcmUgYXJndW1lbnRzIGFuZCByZXR1cm4gdmFsdWVz
Cj4gYXJlIHBhc3NlZCBpbiByZWdpc3RlcnMsIHN0YW5kYXJkIGNhbGxzIHVzZSBzaGFyZWQgbWVt
b3J5LiBSZWdpc3Rlcgo+IHBhaXIgYTEsYTIgaG9sZHMgNjQtYml0IFBBIG9mIGNvbW1hbmQgYnVm
ZmVyLCB3aGVyZSBhbGwgYXJndW1lbnRzCj4gYXJlIHN0b3JlZCBhbmQgd2hpY2ggaXMgdXNlZCB0
byByZXR1cm4gZGF0YS4gT1AtVEVFIGludGVybmFsbHkKPiBjb3BpZXMgY29udGVudHMgb2YgdGhp
cyBidWZmZXIgaW50byBvd24gc2VjdXJlIG1lbW9yeSBiZWZvcmUgYWNjZXNzaW5nCj4gYW5kIHZh
bGlkYXRpbmcgYW55IGRhdGEgaW4gY29tbWFuZCBidWZmZXIuIFRoaXMgaXMgZG9uZSB0byBtYWtl
IHN1cmUKPiB0aGF0IE5XIHdpbGwgbm90IGNoYW5nZSBjb250ZW50cyBvZiB0aGUgdmFsaWRhdGVk
IHBhcmFtZXRlcnMuCj4gCj4gTWVkaWF0b3IgbmVlZHMgdG8gZG8gdGhlIHNhbWUgZm9yIG51bWJl
ciBvZiByZWFzb25zOgo+IAo+IDEuIFRvIG1ha2Ugc3VyZSB0aGF0IGd1ZXN0IHdpbGwgbm90IGNo
YW5nZSBkYXRhIGFmdGVyIHZhbGlkYXRpb24uCj4gMi4gVG8gdHJhbnNsYXRlIElQQXMgdG8gUEFz
IGluIHRoZSBjb21tYW5kIGJ1ZmZlciAodGhpcyBpcyBub3QgZG9uZQo+ICAgICBpbiB0aGlzIHBh
dGNoKS4KPiAzLiBUbyBoaWRlIHRyYW5zbGF0ZWQgYWRkcmVzcyBmcm9tIGd1ZXN0LCBzbyBpdCB3
aWxsIG5vdCBiZSBhYmxlCj4gICAgIHRvIGRvIElQQS0+UEEgdHJhbnNsYXRpb24gYnkgbWlzdXNp
bmcgbWVkaWF0b3IuCj4gCj4gRHVyaW5nIHN0YW5kYXJkIGNhbGwgT1AtVEVFIGNhbiBpc3N1ZSBt
dWx0aXBsZSAiUlBDIHJldHVybnMiLCBhc2tpbmcKPiBOVyB0byBkbyBzb21lIHdvcmsgZm9yIE9Q
LVRFRS4gTlcgdGhlbiBpc3N1ZXMgc3BlY2lhbCBjYWxsCj4gT1BURUVfU01DX0NBTExfUkVUVVJO
X0ZST01fUlBDIHRvIHJlc3VtZSBoYW5kbGluZyBvZiB0aGUgb3JpZ2luYWwgY2FsbC4KPiBUaHVz
LCBtZWRpYXRvciBuZWVkcyB0byBtYWludGFpbiBjb250ZXh0IGZvciBvcmlnaW5hbCBzdGFuZGFy
ZCBjYWxsCj4gZHVyaW5nIG11bHRpcGxlIFNNQ0NDIGNhbGxzLgo+IAo+IFN0YW5kYXJkIGNhbGwg
aXMgY29uc2lkZXJlZCBjb21wbGV0ZSwgd2hlbiByZXR1cm5lZCB2YWx1ZSBpcwo+IG5vdCBhIFJQ
QyByZXF1ZXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlt
eXJfYmFiY2h1a0BlcGFtLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
