Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD4120458
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:49:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igop5-00073V-H4; Mon, 16 Dec 2019 11:45:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1igop4-00073Q-3r
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:45:58 +0000
X-Inumbo-ID: 904c8eee-1ff9-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 904c8eee-1ff9-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 11:45:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F36DAD5F;
 Mon, 16 Dec 2019 11:45:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-users <xen-users@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>, xen-announce@lists.xenproject.org
Message-ID: <7f9da449-4405-0d64-4327-dca1ae783c3f@suse.com>
Date: Mon, 16 Dec 2019 12:45:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen 4.13 RC5
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKWGVuIDQuMTMgcmM1IGlzIHRhZ2dlZC4gWW91IGNhbiBjaGVjayB0aGF0IG91dCBm
cm9tIHhlbi5naXQ6CgpnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdCA0LjEzLjAtcmM1CgpG
b3IgeW91ciBjb252ZW5pZW5jZSB0aGVyZSBpcyBhbHNvIGEgdGFyYmFsbCBhdDoKaHR0cHM6Ly9k
b3dubG9hZHMueGVucHJvamVjdC5vcmcvcmVsZWFzZS94ZW4vNC4xMy4wLXJjNS94ZW4tNC4xMy4w
LXJjNS50YXIuZ3oKCkFuZCB0aGUgc2lnbmF0dXJlIGlzIGF0OgpodHRwczovL2Rvd25sb2Fkcy54
ZW5wcm9qZWN0Lm9yZy9yZWxlYXNlL3hlbi80LjEzLjAtcmM1L3hlbi00LjEzLjAtcmM1LnRhci5n
ei5zaWcKClBsZWFzZSBzZW5kIGJ1ZyByZXBvcnRzIGFuZCB0ZXN0IHJlcG9ydHMgdG8geGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnLgpXaGVuIHNlbmRpbmcgYnVnIHJlcG9ydHMsIHBsZWFz
ZSBDQyByZWxldmFudCBtYWludGFpbmVycyBhbmQgbWUKKGpncm9zc0BzdXNlLmNvbSkuCgpUaGlz
IHdpbGwgcHJvYmFibHkgdGhlIGZpbmFsIFJDIG9mIDQuMTMgYmVmb3JlIHRoZSByZWxlYXNlIG9m
IFhlbiA0LjEzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
