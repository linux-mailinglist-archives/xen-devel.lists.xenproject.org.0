Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5067676BE7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:44:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1Qq-0005pt-3e; Fri, 26 Jul 2019 14:42:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr1Qo-0005pl-GU
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:42:50 +0000
X-Inumbo-ID: a301cd12-afb3-11e9-95ab-d3197dbacdf8
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a301cd12-afb3-11e9-95ab-d3197dbacdf8;
 Fri, 26 Jul 2019 14:42:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE2E5152D;
 Fri, 26 Jul 2019 07:42:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D2043F71F;
 Fri, 26 Jul 2019 07:42:47 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-8-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <375e98f5-3f6e-e579-acf0-8052dc15a210@arm.com>
Date: Fri, 26 Jul 2019 15:42:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723213553.22300-8-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 7/7] xen/arm: types: Specify the zero
 padding in the definition of PRIregister
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

T24gMjMvMDcvMjAxOSAyMjozNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBkZWZpbml0aW9u
IG9mIFBSSXJlZ2lzdGVyIHZhcmllcyBiZXR3ZWVuIEFybTMyIGFuZCBBcm02NCAoMzItYml0IHZz
Cj4gNjQtYml0KS4gSG93ZXZlciwgc29tZSBvZiB0aGUgdXNlcnMgdXNlcyB0aGUgd3JvbmcgcGFk
ZGluZy4KPiAKPiBGb3IgbW9yZSBjb25zaXN0ZW5jeSwgdGhlIHBhZGRpbmcgaXMgbm93IG1vdmVk
IGludG8gdGhlIFBSSXJlZ2lzdGVyIGFuZAo+IHZhcmllcyBkZXBlbmRpbmcgb24gdGhlIGFyY2hp
dGVjdHVyZS4KCkJlbG93IGEgc3VnZ2VzdGVkIG5ldyBjb21taXQgbWVzc2FnZToKCiJUaGUgZGVm
aW5pdGlvbiBvZiBQUklyZWdpc3RlciB2YXJpZXMgYmV0d2VlbiBBcm0zMiBhbmQgQXJtNjQgKDMy
LWJpdCB2cwo2NC1iaXQpLiBIb3dldmVyLCBzb21lIG9mIHRoZSB1c2VycyB1c2VzIHRoZSB3cm9u
ZyBwYWRkaW5nIGFuZCBvdGhlcnMgYXJlCm5vdCB1c2luZyBwYWRkaW5nIGF0IGFsbC4KCkZvciBt
b3JlIGNvbnNpc3RlbmN5LCB0aGUgcGFkZGluZyBpcyBub3cgbW92ZWQgaW50byB0aGUgUFJJcmVn
aXN0ZXIgYW5kCnZhcmllcyBkZXBlbmRpbmcgb24gdGhlIGFyY2hpdGVjdHVyZS4iCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
