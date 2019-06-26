Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591CB566DD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 12:36:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg5GI-00085g-BO; Wed, 26 Jun 2019 10:34:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg5GG-00085Z-9f
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 10:34:44 +0000
X-Inumbo-ID: 00f98d10-97fe-11e9-ba65-e7999041ff28
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 00f98d10-97fe-11e9-ba65-e7999041ff28;
 Wed, 26 Jun 2019 10:34:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A49C360;
 Wed, 26 Jun 2019 03:34:40 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87E8F3F718;
 Wed, 26 Jun 2019 03:34:39 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251749180.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <40c837eb-c059-9f77-6d65-d7dd4f8e9348@arm.com>
Date: Wed, 26 Jun 2019 11:34:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906251749180.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/17] xen/arm64: head: Improve coding style
 and document cpu_init()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMDI6MDEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEFkanVzdCB0
aGUgY29kaW5nIHN0eWxlIHVzZWQgaW4gdGhlIGNvbW1lbnRzIHdpdGhpbiBjcHVfaW5pdCgpLiBU
YWtlIHRoZQo+PiBvcHBvcnR1bml0eSB0byBhbHRlciB0aGUgZWFybHkgcHJpbnQgdG8gbWF0Y2gg
dGhlIGZ1bmN0aW9uIG5hbWUuCj4+Cj4+IExhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFu
ZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQo+PiBmdW5jdGlvbi4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gLS0t
Cj4+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TCj4+IGluZGV4IDZhYTMxNDgxOTIuLmVlMDAyNDE3M2UgMTAwNjQ0Cj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUwo+PiBAQCAtMzk2LDE5ICszOTYsMjYgQEAgc2tpcF9ic3M6Cj4+ICAgICAgICAgICBy
ZXQKPj4gICBFTkRQUk9DKHplcm9fYnNzKQo+PiAgIAo+PiArLyoKPj4gKyAqIEluaXRpYWxpemUg
dGhlIHByb2Nlc3NvciBmb3IgdHVybmluZyB0aGUgTU1VIG9uLgo+PiArICoKPj4gKyAqIENsb2Ji
ZXJzIHgwIC0geDQKPiAKPiBTaG91bGRuJ3QgaXQgYmUgeDAgLSB4Mz8KClllcyBpdCBzaG91bGQg
YmUuIEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1lbnQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
