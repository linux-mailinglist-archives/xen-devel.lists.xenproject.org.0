Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BECABD3C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 18:02:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6GeM-0001aJ-5S; Fri, 06 Sep 2019 15:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6GeK-0001aE-Rj
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 15:59:48 +0000
X-Inumbo-ID: 59a468f0-d0bf-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59a468f0-d0bf-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 15:59:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C101CAF77;
 Fri,  6 Sep 2019 15:59:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190906153948.2160342-1-arnd@arndb.de>
 <7abad95e-ea47-c068-d91c-ba503f2530b9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <742b216d-9219-7ba5-553b-6445513ccedd@suse.com>
Date: Fri, 6 Sep 2019 17:59:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7abad95e-ea47-c068-d91c-ba503f2530b9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ARM: xen: unexport HYPERVISOR_platform_op
 function
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDkuMjAxOSAxNzo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wOS8yMDE5
IDE2OjM5LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+PiBIWVBFUlZJU09SX3BsYXRmb3JtX29wKCkg
aXMgYW4gaW5saW5lIGZ1bmN0aW9uIGFuZCBzaG91bGQgbm90Cj4+IGJlIGV4cG9ydGVkLiBTaW5j
ZSBjb21taXQgMTViZmMyMzQ4ZDU0ICgibW9kcG9zdDogY2hlY2sgZm9yCj4+IHN0YXRpYyBFWFBP
UlRfU1lNQk9MKiBmdW5jdGlvbnMiKSwgdGhpcyBjYXVzZXMgYSB3YXJuaW5nOgo+Pgo+PiBXQVJO
SU5HOiAiSFlQRVJWSVNPUl9wbGF0Zm9ybV9vcCIgW3ZtbGludXhdIGlzIGEgc3RhdGljIEVYUE9S
VF9TWU1CT0xfR1BMCj4+Cj4+IFJlbW92ZSB0aGUgZXh0cmFuZW91cyBleHBvcnQuCj4+Cj4+IEZp
eGVzOiAxNWJmYzIzNDhkNTQgKCJtb2Rwb3N0OiBjaGVjayBmb3Igc3RhdGljIEVYUE9SVF9TWU1C
T0wqIGZ1bmN0aW9ucyIpCj4+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4gCj4gU29tZXRoaW5nIGlzIHdvbmt5LsKgIFRoYXQgc3ltYm9sIGlzICgvIHJlYWxs
eSBvdWdodCB0byBiZSkgaW4gdGhlCj4gaHlwZXJjYWxsIHBhZ2UgYW5kIG1vc3QgZGVmaW5pdGVs
eSBub3QgaW5saW5lLgoKSXQncyBIWVBFUlZJU09SX3BsYXRmb3JtX29wX3JhdyB0aGF0J3MgaW4g
dGhlIGh5cGVyY2FsbCBwYWdlIGFmYWljcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
