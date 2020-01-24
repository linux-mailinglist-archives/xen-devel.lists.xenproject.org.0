Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D5148671
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 15:01:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuzTO-0006Uy-1I; Fri, 24 Jan 2020 13:58:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuzTN-0006Uq-6E
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 13:58:09 +0000
X-Inumbo-ID: 87fe20c8-3eb1-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87fe20c8-3eb1-11ea-9fd7-bc764e2007e4;
 Fri, 24 Jan 2020 13:58:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E9AFAD89;
 Fri, 24 Jan 2020 13:57:59 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20200124135621.105766-1-tamas@tklengyel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d38fef3d-b128-87a3-d87c-5a9bcd1b8708@suse.com>
Date: Fri, 24 Jan 2020 14:58:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200124135621.105766-1-tamas@tklengyel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mem_access: move _ve functions to x86
 header
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDEuMjAyMCAxNDo1NiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFRoZXNlIGZ1bmN0
aW9ucyBkb24ndCBiZWxvbmcgaW4gdGhlIGNvbW1vbiBtZW1fYWNjZXNzIGhlYWRlciBhcyB0aGVy
ZSBpcyBubyAjVkUKPiBlcXVpdmFsZW50IG9uIEFSTS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUYW1h
cyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
