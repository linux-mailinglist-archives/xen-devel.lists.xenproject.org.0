Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7268961E35
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 14:14:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkSV6-000128-2h; Mon, 08 Jul 2019 12:12:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkSV4-000122-4B
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:12:06 +0000
X-Inumbo-ID: 98dafcf2-a179-11e9-aa76-6fc65ba7729c
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 98dafcf2-a179-11e9-aa76-6fc65ba7729c;
 Mon, 08 Jul 2019 12:12:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6F54360;
 Mon,  8 Jul 2019 05:12:03 -0700 (PDT)
Received: from [10.37.9.206] (unknown [10.37.9.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84A443F738;
 Mon,  8 Jul 2019 05:12:02 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190618085851.22902-1-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c9fd6e90-e5bc-0665-4c46-9c86ad0511a2@arm.com>
Date: Sun, 7 Jul 2019 18:29:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618085851.22902-1-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: remove unused dt_device_node
 parameter
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
Cc: sstabellini@kernel.org, Viktor Mitin <viktor_mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmlrdG9yLAoKT24gNi8xOC8xOSA5OjU4IEFNLCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4gU29t
ZSBvZiB0aGUgZnVuY3Rpb24gZ2VuZXJhdGluZyBub2RlcyAoZS5nIG1ha2VfdGltZXJfbm9kZSkK
PiB0YWtlIGluIGEgZHRfZGV2aWNlX25vZGUgcGFyYW1ldGVyLCBidXQgbmV2ZXIgdXNlZCBpdC4K
PiBJdCBpcyBhY3R1YWxseSBtaXN1c2VkIHdoZW4gY3JlYXRpbmcgRFQgZm9yIERvbVUuCj4gU28g
aXQgaXMgdGhlIGJlc3QgdG8gcmVtb3ZlIHRoZSBwYXJhbWV0ZXIuCj4gCj4gU3VnZ2VzdGVkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZp
a3RvciBNaXRpbiA8dmlrdG9yX21pdGluQGVwYW0uY29tPgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
