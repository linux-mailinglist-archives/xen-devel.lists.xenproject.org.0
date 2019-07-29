Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C8879C5D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 00:18:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsDv7-0000t0-OB; Mon, 29 Jul 2019 22:15:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsDv6-0000sv-P2
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 22:15:04 +0000
X-Inumbo-ID: 501fe75d-b24e-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 501fe75d-b24e-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 22:15:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9B762073F;
 Mon, 29 Jul 2019 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564438503;
 bh=ZXTrzC3Xn7CC3R2JL4/U6YLNOyDyzHOjVh4Hm2XNRlI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sIlIygF8fCC6ALGehsJdsZU268CggIm1jdxuQtaRJdyYiUzcvTc5NpGIzgXjiecA4
 56G/ULSY33hZXqKyn6PQ2oOoqFPZr3AEL4FcvlxXAUTApwacHNeJOMyQB0r16BVr+k
 mdmeGT5p1IEaYElXNGYL+A3Ff109RlgVrbrDDpkk=
Date: Mon, 29 Jul 2019 15:15:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87a7d0iv4z.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1907291514550.1237@sstabellini-ThinkPad-T480s>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-8-julien.grall@arm.com>
 <375e98f5-3f6e-e579-acf0-8052dc15a210@arm.com> <87a7d0iv4z.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNiBKdWwgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gPiBPbiAyMy8w
Ny8yMDE5IDIyOjM1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPj4gVGhlIGRlZmluaXRpb24gb2Yg
UFJJcmVnaXN0ZXIgdmFyaWVzIGJldHdlZW4gQXJtMzIgYW5kIEFybTY0ICgzMi1iaXQgdnMKPiA+
PiA2NC1iaXQpLiBIb3dldmVyLCBzb21lIG9mIHRoZSB1c2VycyB1c2VzIHRoZSB3cm9uZyBwYWRk
aW5nLgo+ID4+Cj4gPj4gRm9yIG1vcmUgY29uc2lzdGVuY3ksIHRoZSBwYWRkaW5nIGlzIG5vdyBt
b3ZlZCBpbnRvIHRoZSBQUklyZWdpc3RlciBhbmQKPiA+PiB2YXJpZXMgZGVwZW5kaW5nIG9uIHRo
ZSBhcmNoaXRlY3R1cmUuCj4gPgo+ID4gQmVsb3cgYSBzdWdnZXN0ZWQgbmV3IGNvbW1pdCBtZXNz
YWdlOgo+ID4KPiA+ICJUaGUgZGVmaW5pdGlvbiBvZiBQUklyZWdpc3RlciB2YXJpZXMgYmV0d2Vl
biBBcm0zMiBhbmQgQXJtNjQgKDMyLWJpdCB2cwo+ID4gNjQtYml0KS4gSG93ZXZlciwgc29tZSBv
ZiB0aGUgdXNlcnMgdXNlcyB0aGUgd3JvbmcgcGFkZGluZyBhbmQgb3RoZXJzIGFyZQo+ID4gbm90
IHVzaW5nIHBhZGRpbmcgYXQgYWxsLgo+ID4KPiA+IEZvciBtb3JlIGNvbnNpc3RlbmN5LCB0aGUg
cGFkZGluZyBpcyBub3cgbW92ZWQgaW50byB0aGUgUFJJcmVnaXN0ZXIgYW5kCj4gPiB2YXJpZXMg
ZGVwZW5kaW5nIG9uIHRoZSBhcmNoaXRlY3R1cmUuIgo+IFdpdGggdGhpcyBjb21taXQgbWVzc2Fn
ZToKPiAKPiBSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVr
QGVwYW0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
