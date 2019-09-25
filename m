Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7321BDA11
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 10:43:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD2rA-0007zc-2a; Wed, 25 Sep 2019 08:41:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD2r7-0007yV-R0
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 08:41:01 +0000
X-Inumbo-ID: 337aa5a8-df70-11e9-962c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 337aa5a8-df70-11e9-962c-12813bfff9fa;
 Wed, 25 Sep 2019 08:41:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E7F3AAE16;
 Wed, 25 Sep 2019 08:40:59 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190925070503.13850-1-jgross@suse.com>
 <20190925070503.13850-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eae901ad-9a10-6bb7-0812-648bb63ef874@suse.com>
Date: Wed, 25 Sep 2019 10:41:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925070503.13850-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 a653sched_free_vdata()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAwOTowNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGUgYXJpbmM2NTMg
c2NoZWR1bGVyJ3MgZnJlZV92ZGF0YSgpIGZ1bmN0aW9uIGlzIG1pc3NpbmcgcHJvcGVyCj4gbG9j
a2luZzogYXMgaXQgaXMgbW9kaWZ5aW5nIHRoZSBzY2hlZHVsZXIncyBwcml2YXRlIHZjcHUgbGlz
dCBpdCBuZWVkcwo+IHRvIHRha2UgdGhlIHNjaGVkdWxlciBsb2NrIGR1cmluZyB0aGF0IG9wZXJh
dGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgooYW5kIG1heWJl
IGFsc28gU3VzcGVjdGVkLWJ5KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
