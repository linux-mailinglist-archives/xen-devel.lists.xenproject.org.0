Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA15C116E70
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:02:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJac-0005sg-W2; Mon, 09 Dec 2019 14:00:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieJab-0005sb-5m
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:00:41 +0000
X-Inumbo-ID: 47f728e2-1a8c-11ea-a1e1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47f728e2-1a8c-11ea-a1e1-bc764e2007e4;
 Mon, 09 Dec 2019 14:00:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6BFDAF55;
 Mon,  9 Dec 2019 14:00:38 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <052b6003-53a7-0563-72ac-48fe558ac549@suse.com>
 <b18181b2-7237-c36e-1802-7d1fdb97ff06@suse.com>
 <40b7acd2-e98d-d744-6cea-0add8b19b74a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4ba450a8-50ed-892f-9b3f-d48282d9b40d@suse.com>
Date: Mon, 9 Dec 2019 15:00:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <40b7acd2-e98d-d744-6cea-0add8b19b74a@suse.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMTQ6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI2LjA5LjIwMTkgMTc6
MjMsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI1LjA5LjE5IDE3OjI3LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IFRoZXJlJ3Mgbm90aGluZyB0byByZXN0b3JlIGhlcmUgaWYgdGhlcmUncyBu
byBGUFUgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4KPj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+IFdoaWxlIEkndmUgY29tbWl0dGVkIHRoZSBjaGFu
Z2UgdG8gdGhlIHVuc3RhYmxlIGJyYW5jaCwgbWFraW5nIHVzZSBvZgo+IHRoaXMgUi1hLWIgbm93
IHdpdGhvdXQgYXNraW5nIHdvdWxkIHNlZW0gYWJ1c2l2ZSB0byBtZS4gSSdkIGV4cGVjdAo+IHlv
dSBkb24ndCB3YW50IHRoZSA0LjEzIGJyYW5jaCBkaXN0dXJiZWQgbW9yZSB0aGFuIHJlYWxseSBo
ZWxwZnVsLAo+IGFuZCBoZW5jZSBJIGV4cGVjdCB5b3UnZCByYXRoZXIgbm90IHNlZSB0aGlzIGdv
IGluIHRoZXJlIG5vdy4gUGxlYXNlCj4gbGV0IG1lIGtub3cgaWYgeW91IHZpZXcgdGhpcyBkaWZm
ZXJlbnRseS4KCkkgYXBwcmVjaWF0ZSB0aGF0IGEgbG90LiBQbGVhc2UgZG9uJ3QgY29tbWl0IHRo
aXMgdG8gNC4xMyBub3cuIDotKQoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
