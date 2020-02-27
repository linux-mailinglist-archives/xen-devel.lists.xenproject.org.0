Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA71715E4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 12:26:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7HHY-0001Nf-TL; Thu, 27 Feb 2020 11:24:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7HHX-0001Na-1z
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 11:24:43 +0000
X-Inumbo-ID: bec4f82c-5953-11ea-b7e8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bec4f82c-5953-11ea-b7e8-bc764e2007e4;
 Thu, 27 Feb 2020 11:24:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 291CEADAB;
 Thu, 27 Feb 2020 11:24:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-6-andrew.cooper3@citrix.com>
 <88c175bc-ebeb-c40b-fc4e-5e175706c3af@suse.com>
 <8730f07d-decd-7ed1-b07b-ce3af000c0ca@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3b72260-c95f-6ed3-66cb-21a470606234@suse.com>
Date: Thu, 27 Feb 2020 12:24:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8730f07d-decd-7ed1-b07b-ce3af000c0ca@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 05/10] x86/msr: Compile out unused
 logic/objects
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxMTozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNy8wMi8yMDIw
IDA4OjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEBAIC03NiwxNiArNzcsMjcgQEAgdm9pZCBfX2luaXQgaW5pdF9n
dWVzdF9tc3JfcG9saWN5KHZvaWQpCj4+PiAgewo+Pj4gICAgICBjYWxjdWxhdGVfcmF3X3BvbGlj
eSgpOwo+Pj4gICAgICBjYWxjdWxhdGVfaG9zdF9wb2xpY3koKTsKPj4+IC0gICAgY2FsY3VsYXRl
X2h2bV9tYXhfcG9saWN5KCk7Cj4+PiAtICAgIGNhbGN1bGF0ZV9wdl9tYXhfcG9saWN5KCk7Cj4+
PiArCj4+PiArICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfUFYpICkKPj4+ICsgICAgICAgIGNh
bGN1bGF0ZV9wdl9tYXhfcG9saWN5KCk7Cj4+PiArCj4+PiArICAgIGlmICggaHZtX2VuYWJsZWQg
KQo+Pgo+PiBBbnkgY2hhbmNlIG9mIHRhbGtpbmcgeW91IGludG8gZG9pbmcgdGhpbmdzIG1vcmUg
c3ltbWV0cmljYWxseSwKPj4gYnkgZWl0aGVyIGFsc28gdXNpbmcgSVNfRU5BQkxFRChDT05GSUdf
SFZNKSBoZXJlIG9yIC4uLgo+Pgo+Pj4gKyAgICAgICAgY2FsY3VsYXRlX2h2bV9tYXhfcG9saWN5
KCk7Cj4+PiAgfQo+Pj4gIAo+Pj4gIGludCBpbml0X2RvbWFpbl9tc3JfcG9saWN5KHN0cnVjdCBk
b21haW4gKmQpCj4+PiAgewo+Pj4gLSAgICBzdHJ1Y3QgbXNyX3BvbGljeSAqbXAgPQo+Pj4gLSAg
ICAgICAgeG1lbWR1cChpc19wdl9kb21haW4oZCkgPyAgJnB2X21heF9tc3JfcG9saWN5Cj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICZodm1fbWF4X21zcl9wb2xpY3kpOwo+
Pj4gKyAgICBzdHJ1Y3QgbXNyX3BvbGljeSAqbXAgPSBpc19wdl9kb21haW4oZCkKPj4+ICsgICAg
ICAgID8gKElTX0VOQUJMRUQoQ09ORklHX1BWKSAgPyAgJnB2X21heF9tc3JfcG9saWN5IDogTlVM
TCkKPj4+ICsgICAgICAgIDogKElTX0VOQUJMRUQoQ09ORklHX0hWTSkgPyAmaHZtX21heF9tc3Jf
cG9saWN5IDogTlVMTCk7Cj4+IC4uLiAoaW1vIHByZWZlcmFibHkpIGh2bV9lbmFibGVkIGhlcmU/
IEVpdGhlciB3YXkKPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiAKPiBUaGUgYXN5bW1ldHJ5IGlzIGRlbGliZXJhdGUuCj4gCj4gSW4gdGhlIGZvcm1lciBo
dW5rLCBodm1fZW5hYmxlZCBpcyBzaG9ydC1jaXJjdWl0ZWQgdG8gZmFsc2UgZm9yCj4gIUNPTkZJ
R19IVk0sIGFuZCBpZiBJIGRvbid0IHVzZSBodm1fZW5hYmxlZCwgaGVyZSwgdGhlbiBJJ3ZlIGdv
dCB0bwo+IHJldGFpbiB0aGUgbG9naWMgYXQgdGhlIHRvcCBvZiBjYWxjdWxhdGVfaHZtX21heF9w
b2xpY3koKS7CoCBUaGF0IHNlZW1zCj4gc2lsbHkuCj4gCj4gSW4gdGhpcyBsYXRlciBodW5rLCB3
ZSBhcmUgbG9va2luZyBmb3IgdGhlIG1vc3QgZWZmaWNpZW50IHdheSB0byBhbGxvdwo+IHRoZSBj
b21waWxlciB0byBkaXNjYXJkIHRoZSByZWZlcmVuY2UgdG8gaHZtX21heF9tc3JfcG9saWN5LsKg
IFVzaW5nCj4gaHZtX2VuYWJsZWQgd291bGQgYmUgbG9naWNhbGx5IGVxdWl2YWxlbnQsIGJ1dCBj
b21waWxlIHRvIG1vcmUgY29kZSBpbgo+IENPTkZJR19IVk0gY2FzZSwgYXMgaXQgaXMgYSByZWFs
IGJvb2xlYW4gbmVlZGluZyBjaGVja2luZy4KCkZhaXIgZW5vdWdoLCBhbGJlaXQgSSBkb24ndCB0
aGluayB0aGUgYWRkZWQgZXZhbHVhdGlvbiBvZiBodm1fZW5hYmxlZAp3b3VsZCBiZSB0aGUgZW5k
IG9mIHRoZSB3b3JsZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
