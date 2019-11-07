Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E02F37AF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 19:58:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSmw9-0001LH-48; Thu, 07 Nov 2019 18:55:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSmw7-0001LC-N4
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 18:55:15 +0000
X-Inumbo-ID: 21ab1c94-0190-11ea-a1ca-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21ab1c94-0190-11ea-a1ca-12813bfff9fa;
 Thu, 07 Nov 2019 18:55:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 600B8AAC2;
 Thu,  7 Nov 2019 18:55:13 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <dd532554-81aa-7ebf-30f9-0aed22403856@eikelenboom.it>
 <20191107175244.3114-1-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1fdc9386-c9a9-60e3-e828-ccbf4530aae2@suse.com>
Date: Thu, 7 Nov 2019 19:55:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107175244.3114-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH] make-flight: Drop all win10 tests
 in all flights
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
Cc: Sander Eikelenboom <linux@eikelenboom.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTEuMTkgMTg6NTIsIElhbiBKYWNrc29uIHdyb3RlOgo+IFRoZXNlIGFyZSBmYWlsaW5n
IGFuZCBoYXZlIGJlZW4gZm9yIHNvbWUgdGltZSBhbmQgaXQgZG9lcyBub3QgYXBwZWFyCj4gdGhh
dCBhbnlvbmUgaGFzIHRoZSBjYXBhYmlsaXR5IHRvIGZpeCB0aGVtLiAgUnVubmluZyB0aGVtIGlu
IHRoZXNlCj4gY2lyY3Vtc3RhbmNlcyBzZWVtcyB3YXN0ZWZ1bC4KPiAKPiBFZmZlY3QgaXMgdG8g
ZHJvcCB0ZXN0LSotd2luMTAtKiBqb2JzIChjaGVja2VkIHdpdGgKPiBzdGFuZGFsb25lLWdlbmVy
YXRlLWR1bXAtZmxpZ2h0LXJ1bnZhcnMpLgo+IAo+IENDOiBTYW5kZXIgRWlrZWxlbmJvb20gPGxp
bnV4QGVpa2VsZW5ib29tLml0Pgo+IENDOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
