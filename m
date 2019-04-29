Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29EE2A1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 14:30:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL5OD-00060J-8W; Mon, 29 Apr 2019 12:28:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL5OB-0005zs-Ms
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 12:28:07 +0000
X-Inumbo-ID: 3ddd1948-6a7a-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3ddd1948-6a7a-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 12:28:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84632918"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190408083224.104802-1-wipawel@amazon.de>
 <20190408083224.104802-2-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <f5e5e8e2-2304-b366-2f92-f260098f26fc@citrix.com>
Date: Mon, 29 Apr 2019 13:27:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190408083224.104802-2-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools 2/4] livepatch-gcc: Ignore
 built_in.o and prelink.o object files
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC84LzE5IDk6MzIgQU0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IERvIG5vdCBj
b3B5IG92ZXIgdGhlIGJ1aWx0X2luLm8gYW5kIHByZWxpbmsubyBvYmplY3QgZmlsZXMgd2hlbiB0
aGV5Cj4gZ2V0IHJlYnVpbHQgYXMgdGhleSBhcmUgdXNlZCBmb3IgdHJhbnNpZW50IGxpbmtpbmcg
YnkgWGVuJ3MgYnVpbGQKPiBzeXN0ZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pv
cmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBNYXJ0aW4gUG9obGFj
ayA8bXBvaGxhY2tAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBQZXRyZSBFZnRpbWUgPGVwZXRy
ZUBhbWF6b24uY29tPgoKUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2Fs
bEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
