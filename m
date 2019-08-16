Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C096F905F3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 18:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyfBk-00013Z-1D; Fri, 16 Aug 2019 16:34:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyfBj-00013S-A6
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 16:34:51 +0000
X-Inumbo-ID: c38b1d40-c043-11e9-8bb8-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c38b1d40-c043-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 16:34:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CB4B28;
 Fri, 16 Aug 2019 09:34:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CCC63F694;
 Fri, 16 Aug 2019 09:34:48 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190815173258.20752-1-julien.grall@arm.com>
 <87y2ztf4v0.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5763512a-f2bd-845c-f4ba-3219323ae72d@arm.com>
Date: Fri, 16 Aug 2019 17:34:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87y2ztf4v0.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain_build: Print the correct
 domain in initrd_load()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNi8wOC8yMDE5IDE3OjMyLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBKdWxp
ZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBpbml0cmRfbG9hZCgpIGNhbiBiZSBjYWxsZWQgYnkgb3Ro
ZXIgZG9tYWluIHRoYW4gZG9tMC4gVG8gYXZvaWQKPj4gY29uZnVzaW9uIGluIHRoZSBsb2csIHBy
aW50IHRoZSBjb3JyZWN0IGRvbWFpbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsg
PHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgo+IAo+IEJ1dCB3aHkgZGlkbid0IHlvdSBnYXRo
ZXJlZCBhbGwgdGhvc2UgcGF0Y2hlcyBpbnRvIG9uZSBwYXRjaCBzZXJpZXM/CgpCZWNhdXNlIEkg
Y291bGRuJ3QgYmUgYm90aGVyZWQgdG8gd3JpdGUgYSBjb3ZlciBsZXR0ZXIgZm9yIGl0IGFuZAp0
aGV5IGRvbid0IGRlcGVuZCBvbiBlYWNoIG90aGVyLi4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
