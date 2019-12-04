Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E412D1130DA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:32:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYTY-0006GJ-8J; Wed, 04 Dec 2019 17:30:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icYTW-0006GE-Jn
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:30:06 +0000
X-Inumbo-ID: b4901e72-16bb-11ea-8206-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4901e72-16bb-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 17:30:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7CBAEAE3C;
 Wed,  4 Dec 2019 17:30:03 +0000 (UTC)
To: Sander Eikelenboom <linux@eikelenboom.it>
References: <ce5bd41b-90ed-fcf3-9e2d-a536ff1fcf90@eikelenboom.it>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59ac3962-a947-337b-b758-7ecfb69561ca@suse.com>
Date: Wed, 4 Dec 2019 18:30:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ce5bd41b-90ed-fcf3-9e2d-a536ff1fcf90@eikelenboom.it>
Content-Language: en-US
Subject: Re: [Xen-devel] xen-unstable (4.14 to be): Assertion
 '!preempt_count()' failed at preempt.c:36
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxODoyMSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIGN1cnJl
bnQgeGVuLXVuc3RhYmxlICg0LjE0IHRvIGJlKSBhbmQgQU1EIGNwdToKPiAKPiBBZnRlciByZWJv
b3RpbmcgdGhlIGhvc3QsIHdoaWxlIHRoZSBndWVzdHMgYXJlIHN0YXJ0aW5nLCBJIGhpdCB0aGUg
YXNzZXJ0aW9uIGJlbG93Lgo+IHhlbi1zdGFnaW5nLTQuMTMgc2VlbXMgZmluZSBvbiB0aGUgc2Ft
ZSBtYWNoaW5lLgoKTm90aGluZyBiZXR3ZWVuIDQuMTMgUkM0IGFuZCB0aGUgdGlwIG9mIHN0YWdp
bmcgc3RhbmRzIG91dCwKc28gSSB3b25kZXIgaWYgeW91IGNvdWxkIGJpc2VjdCBvdmVyIHRoaXMg
cmFuZ2U/IE9yIHBlcmhhcHMKc29tZW9uZSBlbHNlIHNlZXMgc29tZXRoaW5nIEkgZG9uJ3Qgc2Vl
IChyaWdodCBub3cpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
