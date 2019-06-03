Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC632FC6
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:36:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXm9u-0004IH-92; Mon, 03 Jun 2019 12:33:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXm9t-0004I8-Ch
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:33:49 +0000
X-Inumbo-ID: d58c5c4c-85fb-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d58c5c4c-85fb-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 12:33:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93DC015A2;
 Mon,  3 Jun 2019 05:33:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB1D23F5AF;
 Mon,  3 Jun 2019 05:33:46 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-7-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <559ecc94-3e88-1912-07b3-a3cb0e3f1dca@arm.com>
Date: Mon, 3 Jun 2019 13:33:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-7-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 06/10] xen/arm: optee: add support for
 RPC SHM buffers
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
dGU6Cj4gT1AtVEVFIHVzdWFsbHkgdXNlcyB0aGUgc2FtZSBpZGVhIHdpdGggY29tbWFuZCBidWZm
ZXJzIChzZWUKPiBwcmV2aW91cyBjb21taXQpIHRvIGlzc3VlIFJQQyByZXF1ZXN0cy4gUHJvYmxl
bSBpcyB0aGF0IGluaXRpYWxseQo+IGl0IGhhcyBubyBidWZmZXIsIHdoZXJlIGl0IGNhbiB3cml0
ZSByZXF1ZXN0LiBTbyB0aGUgZmlyc3QgUlBDCj4gcmVxdWVzdCBpdCBtYWtlcyBpcyBzcGVjaWFs
OiBpdCByZXF1ZXN0cyBOVyB0byBhbGxvY2F0ZSBzaGFyZWQKPiBidWZmZXIgZm9yIG90aGVyIFJQ
QyByZXF1ZXN0cy4gVXN1YWxseSB0aGlzIGJ1ZmZlciBpcyBhbGxvY2F0ZWQKPiBvbmx5IG9uY2Ug
Zm9yIGV2ZXJ5IE9QLVRFRSB0aHJlYWQgYW5kIGl0IHJlbWFpbnMgYWxsb2NhdGVkIGFsbAo+IHRo
ZSB0aW1lIHVudGlsIGd1ZXN0IHNodXRzIGRvd24uIEd1ZXN0IGNhbiBhc2sgT1AtVEVFIHRvIGRp
c2FibGUKPiBSUEMgYnVmZmVycyBjYWNoaW5nLCBpbiB0aGlzIGNhc2UgT1AtVEVFIHdpbGwgYXNr
IGd1ZXN0IHRvCj4gYWxsb2NhdGUvZnJlZSBidWZmZXIgZm9yIHRoZSBlYWNoIFJQQy4KPiAKPiBN
ZWRpYXRvciBuZWVkcyB0byBwaW4gdGhpcyBidWZmZXIgdG8gbWFrZSBzdXJlIHRoYXQgcGFnZSB3
aWxsIGJlCj4gbm90IGZyZWUgd2hpbGUgaXQgaXMgc2hhcmVkIHdpdGggT1AtVEVFLgo+IAo+IExp
ZmUgY3ljbGUgb2YgdGhpcyBidWZmZXIgaXMgY29udHJvbGxlZCBieSBPUC1URUUuIEl0IGFza3Mg
Z3Vlc3QgdG8KPiBjcmVhdGUgYnVmZmVyIGFuZCBpdCBhc2tzIGl0IHRvIGZyZWUgaXQuIFNvIGl0
IHRoZXJlIGlzIG5vdCBtdWNoIHNlbnNlCj4gdG8gbGltaXQgbnVtYmVyIG9mIHRob3NlIGJ1ZmZl
cnMsIGJlY2F1c2Ugd2UgYWxyZWFkeSBsaW1pdCB0aGUgbnVtYmVyCj4gb2YgY29uY3VycmVudCBz
dGFuZGFyZCBjYWxscyBhbmQgcHJldmVudGlvbiBvZiBSUEMgYnVmZmVyIGFsbG9jYXRpb24gd2ls
bAo+IGltcGFpciBPUC1URUUgZnVuY3Rpb25hbGl0eS4KPiAKPiBUaG9zZSBidWZmZXJzIGNhbiBi
ZSBmcmVlZCBpbiB0d28gd2F5czogZWl0aGVyIE9QLVRFRSBpc3N1ZXMKPiBPUFRFRV9TTUNfUlBD
X0ZVTkNfRlJFRSBSUEMgcmVxdWVzdCBvciBndWVzdCB0cmllcyB0byBkaXNhYmxlCj4gYnVmZmVy
IGNhY2hpbmcgYnkgY2FsbGluZyBPUFRFRV9TTUNfRElTQUJMRV9TSE1fQ0FDSEUgZnVuY3Rpb24u
Cj4gSW4gdGhlIGxhdHRlciBjYXNlIE9QLVRFRSB3aWxsIHJldHVybiBjb29raWUgb2YgdGhlIFNI
TSBidWZmZXIgaXQKPiBqdXN0IGZyZWVkLgo+IAo+IE9QLVRFRSBleHBlY3RzIHRoYXQgdGhpcyBS
UEMgYnVmZmVyIGhhdmUgc2l6ZSBvZgo+IE9QVEVFX01TR19OT05DT05USUdfUEFHRV9TSVpFLCB3
aGljaCBlcXVhbHMgdG8gNDA5NiBhbmQgaXMgYWxpZ25lZAo+IHdpdGggdGhlIHNhbWUgc2l6ZS4g
U28sIGJhc2ljYWxseSBpdCBleHBlY3RzIG9uZSA0ayBwYWdlIGZyb20gdGhlCj4gZ3Vlc3QuIFRo
aXMgaXMgdGhlIHNhbWUgYXMgWGVuJ3MgUEFHRV9TSVpFLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZv
bG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KCkFja2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
