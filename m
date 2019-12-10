Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E507E118DDE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 17:42:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieiXa-0001fo-AA; Tue, 10 Dec 2019 16:39:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieiXY-0001fj-GB
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 16:39:12 +0000
X-Inumbo-ID: 97bf2a8e-1b6b-11ea-a1e1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97bf2a8e-1b6b-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 16:39:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6D6C2B2CE;
 Tue, 10 Dec 2019 16:39:10 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-7-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e032bd4d-74b7-9f0b-7738-5b8c0a683354@suse.com>
Date: Tue, 10 Dec 2019 17:39:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191025091618.10153-7-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 6/7] x86/hyperv: provide
 hyperv_guest variable
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMjAxOSAxMToxNiwgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9o
eXBlcnYuYwo+IEBAIC0yNCw2ICsyNCw3IEBACj4gICNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2
LXRsZnMuaD4KPiAgCj4gIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBtc19oeXBlcnY7Cj4gK2Jvb2wg
aHlwZXJ2X2d1ZXN0OwoKV2l0aCBfX3JlYWRfbW9zdGx5IGFkZGVkIGhlcmUgKHBlcmhhcHMgYWxz
byBpbiB0aGUgZWFybGllcgpwYXRjaCBmb3IgdGhlIGFkamFjZW50IG9uZSkKQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
