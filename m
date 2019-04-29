Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC15E4A3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 16:24:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7Ae-0000LF-T8; Mon, 29 Apr 2019 14:22:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cijb=S7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hL7Ad-0000Kw-2C
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 14:22:15 +0000
X-Inumbo-ID: 2f2ab534-6a8a-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 2f2ab534-6a8a-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 14:22:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE42BA78;
 Mon, 29 Apr 2019 07:22:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15F6F3F5C1;
 Mon, 29 Apr 2019 07:22:12 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
 <1555513175-7596-4-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9cf62212-f841-8ec9-1151-543b573ca414@arm.com>
Date: Mon, 29 Apr 2019 15:22:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555513175-7596-4-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 3/5] xen/arm: drivers: scif: Add support
 for SCIFA compatible UARTs
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMTcvMDQvMjAxOSAxNTo1OSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IEZvciB0aGUgZHJpdmVyIHRvIGJlIGFibGUgdG8gaGFuZGxlIFNDSUZB
IGludGVyZmFjZSBhcyB3ZWxsLAo+IHRoaXMgcGF0Y2gganVzdCBhZGRzIHRoZSBmb2xsb3dpbmc6
Cj4gLSBTQ0lGQSByZWxhdGVkIG1hY3Jvcwo+IC0gTmV3IGVsZW1lbnQgaW4gInBvcnRfcGFyYW1z
IiBhcnJheSB0byBrZWVwIFNDSUZBIHNwZWNpZmljIHRoaW5ncwo+IC0gU0NJRkEgY29tcGF0aWJs
ZSBzdHJpbmcKPiAKPiBUaGlzIHBhdGNoIG1ha2VzIHBvc3NpYmxlIHRvIHVzZSBleGlzdGluZyBk
cml2ZXIgZm9yIFJlbmVzYXMgIlN0b3V0Igo+IGJvYXJkIGJhc2VkIG9uIFItQ2FyIEgyIFNvQyAo
U0NJRkEpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
