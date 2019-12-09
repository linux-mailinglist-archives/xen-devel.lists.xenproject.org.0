Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883B116D97
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 14:09:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieIkL-0000Jw-Od; Mon, 09 Dec 2019 13:06:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieIkK-0000Jg-Lh
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 13:06:40 +0000
X-Inumbo-ID: bc424504-1a84-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc424504-1a84-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 13:06:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1785AB1B7;
 Mon,  9 Dec 2019 13:06:38 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <052b6003-53a7-0563-72ac-48fe558ac549@suse.com>
 <b18181b2-7237-c36e-1802-7d1fdb97ff06@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40b7acd2-e98d-d744-6cea-0add8b19b74a@suse.com>
Date: Mon, 9 Dec 2019 14:06:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b18181b2-7237-c36e-1802-7d1fdb97ff06@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/CPUID: RSTR_FP_ERR_PTRS depends on FPU
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxNzoyMywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNS4wOS4xOSAx
NzoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZXJlJ3Mgbm90aGluZyB0byByZXN0b3JlIGhl
cmUgaWYgdGhlcmUncyBubyBGUFUgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKV2hpbGUgSSd2ZSBjb21taXR0ZWQg
dGhlIGNoYW5nZSB0byB0aGUgdW5zdGFibGUgYnJhbmNoLCBtYWtpbmcgdXNlIG9mCnRoaXMgUi1h
LWIgbm93IHdpdGhvdXQgYXNraW5nIHdvdWxkIHNlZW0gYWJ1c2l2ZSB0byBtZS4gSSdkIGV4cGVj
dAp5b3UgZG9uJ3Qgd2FudCB0aGUgNC4xMyBicmFuY2ggZGlzdHVyYmVkIG1vcmUgdGhhbiByZWFs
bHkgaGVscGZ1bCwKYW5kIGhlbmNlIEkgZXhwZWN0IHlvdSdkIHJhdGhlciBub3Qgc2VlIHRoaXMg
Z28gaW4gdGhlcmUgbm93LiBQbGVhc2UKbGV0IG1lIGtub3cgaWYgeW91IHZpZXcgdGhpcyBkaWZm
ZXJlbnRseS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
