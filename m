Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9832FCA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:37:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXmB4-0004cI-Qy; Mon, 03 Jun 2019 12:35:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXmB3-0004bu-I1
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:35:01 +0000
X-Inumbo-ID: 00ce3e7a-85fc-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 00ce3e7a-85fc-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 12:35:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2645E15AB;
 Mon,  3 Jun 2019 05:35:00 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AA1E3F5AF;
 Mon,  3 Jun 2019 05:34:59 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-4-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <12506d0d-e19a-0c40-98d5-91b8d4bcb1e5@arm.com>
Date: Mon, 3 Jun 2019 13:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-4-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 03/10] xen/arm: optee: add OP-TEE
 mediator skeleton
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

SGkgVm9sb2R5bXlyLAoKT24gMjEvMDUvMjAxOSAyMjoyNSwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gQWRkIHZlcnkgYmFzaWMgT1AtVEVFIG1lZGlhdG9yLiBJdCBjYW4gcHJvYmUgZm9yIE9Q
LVRFRSBwcmVzZW5jZSwKPiB0ZWxsIGl0IGFib3V0IGRvbWFpbiBjcmVhdGlvbi9kZXN0cnVjdGlv
biBhbmQgdGhlbiByZXR1cm4gYW4gZXJyb3IKPiB0byBhbGwgY2FsbHMgdG8gdGhlIGd1ZXN0Lgo+
IAo+IFRoaXMgY29kZSBpc3N1ZXMgdHdvIG5vbi1wcmVlbXB0aWJsZSBjYWxscyB0byBPUC1URUU6
IHRvIGNyZWF0ZSBhbmQKPiB0byBkZXN0cm95IGNsaWVudCBjb250ZXh0LiBUaGV5IGNhbid0IGJs
b2NrIGluIE9QLVRFRSwgYXMgdGhleSBhcmUKPiBjb25zaWRlcmVkICJmYXN0IGNhbGxzIiBpbiB0
ZXJtcyBvZiBBUk0gU01DQ0MuCj4gCj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsg
PHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
