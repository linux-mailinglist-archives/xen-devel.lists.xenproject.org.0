Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA40923E5A
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 19:22:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSlxr-0000VW-IF; Mon, 20 May 2019 17:20:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSlxq-0000VR-M4
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 17:20:42 +0000
X-Inumbo-ID: 98272de8-7b23-11e9-8a62-5f6985ab748f
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 98272de8-7b23-11e9-8a62-5f6985ab748f;
 Mon, 20 May 2019 17:20:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B157374;
 Mon, 20 May 2019 10:20:41 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9189A3F718;
 Mon, 20 May 2019 10:20:39 -0700 (PDT)
To: Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
References: <20190520171315.12026-1-alistair.francis@wdc.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8d3413cd-1440-b18a-7d3f-fd8ad283de06@arm.com>
Date: Mon, 20 May 2019 18:20:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520171315.12026-1-alistair.francis@wdc.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org,
 jbeulich@suse.com, andrew.cooper3@citrix.com, alistair23@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxpc3RhaXIsCgpPbiAyMC8wNS8yMDE5IDE4OjEzLCBBbGlzdGFpciBGcmFuY2lzIHdyb3Rl
Ogo+IE1ha2UgdGhlIGFzbS92cGwwMTEuaCBkZXBlbmRlbnQgb24gdGhlIENPTkZJR19TQlNBX1ZV
QVJUX0NPTlNPTEUgZGVmaW5lLgoKWW91ciBjb21taXQgbWVzc2FnZSB3YW50cyBhIGJpdCBtb3Jl
IGV4cGxhbmF0aW9uLiBJbiB0aGlzIGNhc2UsIHlvdSB3YW50IHRvIHNheSAKdGhlIG9ubHkgdXNl
ciBvZiB0aGlzIGluY2x1ZGUgaXMgcHJvdGVjdGVkIGJ5IENPTkZJR19TQlNBX1ZVQVJUX0NPTlNP
TEUsIGhlbmNlIAppdCBtYWtlcyBzZW5zZSB0byBwcm90ZWN0IGl0IHdpdGggdGhlIHNhbWUgZGVm
aW5lLgoKVGhlIHRpdGxlIHdvdWxkIG5lZWQgdG8gYmUgdXBkYXRlZCBhcyB3ZWxsLgoKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+
Cj4gLS0tCj4gICB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDIgKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4g
aW5kZXggOWJiY2IwZjU3YS4uMjQyODdlNTljYiAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9j
aGFyL2NvbnNvbGUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4gQEAgLTM2
LDcgKzM2LDcgQEAKPiAgICNpZmRlZiBDT05GSUdfWDg2Cj4gICAjaW5jbHVkZSA8eGVuL2NvbnNv
bGVkLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Cj4gLSNlbHNlCj4gKyNlbGlmIENPTkZJ
R19TQlNBX1ZVQVJUX0NPTlNPTEUKPiAgICNpbmNsdWRlIDxhc20vdnBsMDExLmg+Cj4gICAjZW5k
aWYKClRoaXMgaXMgYSBiaXQgb2RkcyB0byByZXF1aXJlICFDT05GSUdfWDg2ICYmIENPTkZJR19T
QlNBX1ZVQVJUX0NPTlNPTEUgYnV0IHRoZSAKY29kZSBpcyBvbmx5IHByb3RlY3RlZCB3aXRoIHRo
ZSBzZWNvbmQgcGFydC4KCkhvdyBhYm91dDoKCiNlbmRpZgojaWZkZWYgQ09ORklHX1NCU0FfVlVB
UlRfQ09OU09MRQouLi4KI2VuZGlmCgo/CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
