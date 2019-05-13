Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03EA1B206
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 10:42:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ6US-00034Y-FJ; Mon, 13 May 2019 08:39:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQ6UQ-00034T-8E
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 08:39:18 +0000
X-Inumbo-ID: 9829c616-755a-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9829c616-755a-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 08:39:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 037D5341;
 Mon, 13 May 2019 01:39:17 -0700 (PDT)
Received: from [10.37.12.148] (unknown [10.37.12.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957743F720;
 Mon, 13 May 2019 01:39:15 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
 <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
 <20190503141952.GD5900@zion.uk.xensource.com>
 <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4fb5058d-9810-7a1b-91f4-db31bad82a85@arm.com>
Date: Mon, 13 May 2019 09:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
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
 Wei Liu <wei.liu2@citrix.com>, Andrii_Anisov@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA1LzEzLzE5IDk6MTggQU0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiBIaSBKdWxpZW4sCgpI
aSwKCj4gUGxlYXNlIGJlIGF3YXJlIHRoYXQgdGhlIHBhdGNoIHlvdSBwcm9wb3NlZCAoK25vY292
LXkgKz0gbGliZmR0Lm8pCj4gZmFpbGVkIHRvIGJ1aWxkIHdpdGggdGhlIG5leHQgZXJyb3IgKHhl
biA0LjEyKToKCk15IHBhdGNoIGlzIGJhc2VkIG9uIDQuMTMsIGFsdGhvdWdoIHNob3VsZCB3b3Jr
IG9uIFhlbiA0LjEyLiBCdXQuLi4KCj4gCj4gYWFyY2g2NC1wb2t5LWxpbnV4LWdjYyAgIC1EQlVJ
TERfSUQgLWZuby1zdHJpY3QtYWxpYXNpbmcgLXN0ZD1nbnU5OQo+IC1XYWxsIC1Xc3RyaWN0LXBy
b3RvdHlwZXMgLVdkZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQKPiAtV25vLXVudXNlZC1idXQt
c2V0LXZhcmlhYmxlIC1Xbm8tdW51c2VkLWxvY2FsLXR5cGVkZWZzICAgLU8yCj4gLWZvbWl0LWZy
YW1lLXBvaW50ZXIKPiAtRF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX189X19YRU5fTEFURVNUX0lO
VEVSRkFDRV9WRVJTSU9OX18gLU1NRCAtTUYKPiAuaGFuZGxlcmVnLm8uZCAtRF9MQVJHRUZJTEVf
U09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAgIC1XZXJyb3IKPiAtV21pc3NpbmctcHJvdG90
eXBlcyAtSS4vaW5jbHVkZQo+IC1JL2hvbWUvYy93L3JjYXJfaDNfdWJ1bnR1MTYwNF95b2N0by9i
dWlsZC90bXAvd29yay9hYXJjaDY0LXBva3ktbGludXgveGVuLzQuMTIuMC4wK2dpdEFVVE9JTkMr
ZmQyYTM0Yzk2NS1yMC9naXQvdG9vbHMvbGlicy90b29sY29yZS8uLi8uLi8uLi90b29scy9pbmNs
dWRlCj4gICAtYyAtbyBoYW5kbGVyZWcubyBoYW5kbGVyZWcuYwoKLi4uIHRoaXMgbG9va3MgbGlr
ZSBhIHRvb2wgYnVpbGRpbmcgZXJyb3Igd2hlbiBJIG9ubHkgdG91Y2ggdGhlIApoeXBlcnZpc29y
IHBhcnQuIEFyZSB5b3UgY2VydGFpbiB0aGlzIGlzIG15IHBhdGNoIGFuZCBub3QgYW5vdGhlciBl
cnJvciAKaW4gWGVuIDQuMTIgKG9yIGFueSBwYXRjaCB5b3UgaGF2ZSBvbiB0b3ApPwoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
