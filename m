Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D09F7871
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 17:09:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUCDb-0002Fh-Hr; Mon, 11 Nov 2019 16:07:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUCDa-0002Fc-2G
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 16:07:06 +0000
X-Inumbo-ID: 4cffffbc-049d-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cffffbc-049d-11ea-9631-bc764e2007e4;
 Mon, 11 Nov 2019 16:07:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 163D7AE92;
 Mon, 11 Nov 2019 16:07:03 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
 <55c0bc58-32bb-79da-b75f-a20946dac94f@suse.com>
 <55f3c0e3-7da7-f1ad-37cd-e5febdda4b09@eikelenboom.it>
 <1a8ea591-1ad9-514d-00ca-bd153f540d28@suse.com>
 <1df09247-dcb6-3587-7d86-978b08bbf77d@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7812e6a9-63af-216a-92b4-49e64935e052@suse.com>
Date: Mon, 11 Nov 2019 17:07:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1df09247-dcb6-3587-7d86-978b08bbf77d@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: AMD-Vi: update_paging_mode Try to
 access pdev_list without aquiring pcidevs_lock.
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMjAxOSAyMTo0OCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+ICAgICAgIFdo
aWxlIGluIHRoZSBndWVzdCBpdCBpcyBlbmRsZXNzbHkgcmVwZWF0aW5nOgo+ICAgICAgICAgICBb
ICAyMzEuMzg1NTY2XSB4aGNpX2hjZCAwMDAwOjAwOjA1LjA6IE1heCBudW1iZXIgb2YgZGV2aWNl
cyB0aGlzIHhIQ0kgaG9zdCBzdXBwb3J0cyBpcyAzMi4KPiAgICAgICAgICAgWyAgMjMxLjQwNzM1
MV0gdXNiIHVzYjEtcG9ydDI6IGNvdWxkbid0IGFsbG9jYXRlIHVzYl9kZXZpY2UKCkZvciB0aGlz
IG9uZSwgY291bGQgeW91IHRyeSAicGNpPW5vbXNpIiBvbiB0aGUgTGludXgga2VybmVsIGNvbW1h
bmQKbGluZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
