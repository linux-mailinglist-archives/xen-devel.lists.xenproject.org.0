Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2E102963
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 17:29:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX6M0-0002Wu-6H; Tue, 19 Nov 2019 16:27:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iX6Ly-0002Wn-Td
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 16:27:46 +0000
X-Inumbo-ID: 84553868-0ae9-11ea-adbe-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84553868-0ae9-11ea-adbe-bc764e2007e4;
 Tue, 19 Nov 2019 16:27:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DF0FC093;
 Tue, 19 Nov 2019 16:27:44 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191114180542.1016867-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0f286d0-544e-70e2-a298-b37bdd5bf017@suse.com>
Date: Tue, 19 Nov 2019 17:27:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191114180542.1016867-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] xen: Fix race to build
 arch/x86/efi/relocs-dummy.o
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAxOTowNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gV2l0aCAkKFRBUkdF
VCkuZWZpIGRlcGVuZGluZyBvbiBlZmkvcmVsb2NzLWR1bW15Lm8sIGFyY2gveDg2L01ha2VmaWxl
Cj4gd2lsbCBhdHRlbXB0IHRvIGJ1aWxkIHRoYXQgb2JqZWN0LiBUaGlzIHJlc3VsdCBpbiB0aGUg
ZGVwZW5kZW5jeSBmaWxlCj4gYmVlbiBnZW5lcmF0ZWQgd2l0aCByZWxvY3MtZHVtbXkubyBkZXBl
bmRpbmcgb24gZWZpL3JlbG9jcy1kdW1teS5vLgo+IAo+IFRoZW4sIHdoZW4gYXJjaC94ODYvZWZp
L01ha2VmaWxlIHRyaWVzIHRvIGJ1aWxkIHJlbG9jcy1kdW1teS5vLCB3ZWxsCj4gZWZpL3JlbG9j
cy1kdW1teS5TIGRvZXNuJ3QgZXhpc3QuCj4gCj4gSGF2ZSBvbmx5IG9uZSBtYWtlZmlsZSByZXNw
b25zaWJsZSBmb3IgYnVpbGRpbmcgcmVsb2NzLWR1bW15Lm8uCgpPbiBhIHN5c3RlbSB3aXRoIHRv
byBvbGQgYSB0b29sIGNoYWluIGZvciB0aGUgRUZJIGJ1aWxkIHRvIGdldAplbmFibGVkIEkgbm93
IGdldCBhYm91dCBhIGRvemVuIGluc3RhbmNlcyBwZXIgYnVpbGQgb2YKCm5tOiAnZWZpL3JlbG9j
cy1kdW1teS5vJzogTm8gc3VjaCBmaWxlCgpJIGRvbid0IHN1cHBvc2UgeW91IGRpZCB0cnkgb3V0
IHlvdXIgY2hhbmdlIGluIHN1Y2ggYW4gb2xkaXNoCmVudmlyb25tZW50PyBJIGFzc3VtZSB0aGUg
cHJvYmxlbSBhcmUgdGhlc2UgdHdvIGxpbmVzOgoKJChUQVJHRVQpLmVmaTogVklSVF9CQVNFID0g
MHgkKHNoZWxsICQoTk0pIGVmaS9yZWxvY3MtZHVtbXkubyB8IHNlZCAtbiAncywgQSBWSVJUX1NU
QVJUJCQsLHAnKQokKFRBUkdFVCkuZWZpOiBBTFRfQkFTRSA9IDB4JChzaGVsbCAkKE5NKSBlZmkv
cmVsb2NzLWR1bW15Lm8gfCBzZWQgLW4gJ3MsIEEgQUxUX1NUQVJUJCQsLHAnKQoKSSdtIG5vdCBz
dXJlIGl0IGlzIHdlbGwgZGVmaW5lZCB3aGVuIG1ha2Ugd291bGQgZXZhbHVhdGUgc3VjaAp0YXJn
ZXQgc3BlY2lmaWMgdmFyaWFibGUgYXNzaWdubWVudHMgKGkuZS4gSSdtIG5vdCBzdXJlIHRoaXMK
ZG9lc24ndCBwb2ludCBvdXQgYW4gaXNzdWUgZXZlbiBvbiBFRkkgY2FwYWJsZSB0b29sIGNoYWlu
cykuClRoZW4gYWdhaW4gdGhlc2Ugbm90IHVzaW5nIDo9IHNob3VsZCBjYXVzZSB0aGVtIHRvIGdl
dApldmFsdWF0ZWQgb25seSB1cG9uIHVzZSwgaS5lLiBuZXZlci4gQnV0IHRoYXQncyBjbGVhcmx5
IG5vdAp0aGUgY2FzZSBoZXJlOyBvZiBjb3Vyc2UgbWFrZSBpcyBhbHNvIHRoZSBub3cgcHJldHR5
IGRhdGVkCjMuODEgb25lLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
