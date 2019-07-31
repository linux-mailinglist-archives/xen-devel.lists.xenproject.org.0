Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E767B98F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 08:19:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hshtK-0003Cs-Pg; Wed, 31 Jul 2019 06:15:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GJXX=V4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hshtJ-0003Cn-BU
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 06:15:13 +0000
X-Inumbo-ID: 8b4496a0-b35a-11e9-b6be-57dc1e92204f
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b4496a0-b35a-11e9-b6be-57dc1e92204f;
 Wed, 31 Jul 2019 06:15:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 21BD5AD1E;
 Wed, 31 Jul 2019 06:15:07 +0000 (UTC)
To: Arnd Bergmann <arnd@arndb.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20190722074705.2082153-1-arnd@arndb.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4c9fa545-1940-5bb8-ddbb-1024a8a23655@suse.com>
Date: Wed, 31 Jul 2019 08:15:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722074705.2082153-1-arnd@arndb.de>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] [v3] xen: avoid link error on ARM
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMTkgMDk6NDYsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gQnVpbGRpbmcgdGhlIHBy
aXZjbWQgY29kZSBhcyBhIGxvYWRhYmxlIG1vZHVsZSBvbiBBUk0sIHdlIGdldAo+IGEgbGluayBl
cnJvciBkdWUgdG8gdGhlIHByaXZhdGUgY2FjaGUgbWFuYWdlbWVudCBmdW5jdGlvbnM6Cj4gCj4g
RVJST1I6ICJfX3N5bmNfaWNhY2hlX2RjYWNoZSIgW2RyaXZlcnMveGVuL3hlbi1wcml2Y21kLmtv
XSB1bmRlZmluZWQhCj4gCj4gTW92ZSB0aGUgY29kZSBpbnRvIGEgbmV3IHRoYXQgaXMgYWx3YXlz
IGJ1aWx0IGluIHdoZW4gWGVuIGlzIGVuYWJsZWQsCj4gYXMgc3VnZ2VzdGVkIGJ5IEp1ZXJnZW4g
R3Jvc3MgYW5kIEJvcmlzIE9zdHJvdnNreS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgoKUHVzaGVkIHRvIHhlbi90aXAuZ2l0IGZvci1saW51cy01LjNh
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
