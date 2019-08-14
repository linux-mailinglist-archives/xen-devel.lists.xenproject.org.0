Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7C8D084
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 12:17:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxqIW-0005Kq-8g; Wed, 14 Aug 2019 10:14:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gPVK=WK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxqIU-0005Kf-NG
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 10:14:26 +0000
X-Inumbo-ID: 49ffff7c-be7c-11e9-b51a-7b7908a93ead
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 49ffff7c-be7c-11e9-b51a-7b7908a93ead;
 Wed, 14 Aug 2019 10:14:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 959F428;
 Wed, 14 Aug 2019 03:14:23 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AFC73F706;
 Wed, 14 Aug 2019 03:14:22 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190807125725.31683-1-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b6c2cc85-78d7-9ada-bf2f-8f5fa704b5c9@arm.com>
Date: Wed, 14 Aug 2019 11:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807125725.31683-1-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 0/2] xen/arm: Consolidate make_timer_node
 and make_timer_domU_node
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNy8wOC8yMDE5IDEzOjU3LCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4gRnVuY3Rpb25z
IG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9kb21VX25vZGUgYXJlIHF1aXRlIHNpbWls
YXIsCj4gc28gaXQgaXMgYmV0dGVyIHRvIGNvbnNvbGlkYXRlIHRoZW0gdG8gYXZvaWQgZGlzY3Jl
cGFuY3kuCj4gCj4gVGhpcyBwYXRjaCBzZXJpZXMgYWNoaXZlcyB0aGlzIGdvYWwgaW4gdHdvIHN0
ZXBzOgo+IC0gRXh0ZW5kIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzIHRvIGRlYWwgd2l0aCBvdGhl
ciBkb21haW4gdGhhbiB0aGUgaHdkb20uCj4gLSBDb25zb2xpZGF0ZSBtYWtlX3RpbWVyX25vZGUg
YW5kIG1ha2VfdGltZXJfZG9tVV9ub2RlIGludG8gb25lIGZ1bmN0aW9uOgo+IAo+IFZpa3RvciBN
aXRpbiAoMik6Cj4gICAgeGVuL2FybTogZXh0ZW5kIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzIHRv
IHN1cHBvcnQgRG9tVQo+ICAgIHhlbi9hcm06IGNvbnNvbGlkYXRlIG1ha2VfdGltZXJfbm9kZSBh
bmQgbWFrZV90aW1lcl9kb21VX25vZGUKCkkgaGF2ZSBjb21taXR0ZWQgdGhlIHR3byBwYXRjaGVz
LiB0aGFuayB5b3UhCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
