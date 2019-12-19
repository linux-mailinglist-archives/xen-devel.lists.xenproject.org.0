Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA147126E01
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 20:30:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii1SQ-0008KX-6q; Thu, 19 Dec 2019 19:27:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ii1SO-0008KR-85
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 19:27:32 +0000
X-Inumbo-ID: 945cca8c-2295-11ea-b6f1-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 945cca8c-2295-11ea-b6f1-bc764e2007e4;
 Thu, 19 Dec 2019 19:27:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576783643; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=m+Y/Lume8qk9IthRanfmCsUVjusuNlopNKhc7JZnDVI=;
 b=lCtBUh0g/0BtO7YGaf1OCUI9wlBf0A5lD8EiT5EBKV+Ts0y6gE52pai8GcIPjBs09cLWj8ao
 JLIWzMa/Koh06UVzJsoyr1RoZpUeEGWEeIN8ZyOSdfweYhN1v6Btp6Ny/QjiAI27HrMCR+nG
 1TTTvgrVxDQjQ2VU96oba3R/O+I=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mxa.mailgun.org with ESMTP id 5dfbcf16.7f775f9f3e30-smtp-out-n02;
 Thu, 19 Dec 2019 19:27:18 -0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p17so6874168wma.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 11:27:18 -0800 (PST)
X-Gm-Message-State: APjAAAUBeR5Ea086WyEKjtLAYX3UqAmBvgTb7R6j+UprBNPqBGswzwEx
 X57VEI1cyqxi0CfNTGcIpDVtvlG4uFKacYNxGiQ=
X-Google-Smtp-Source: APXvYqz9u5pGHrQ8zVWEPOgg0JBkHKwbokgGcxdXGAZomduAQmydM0JhYGg+dEihtMJdhFDA9tPGh3MVfVRqJwiiWqo=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr12606925wme.125.1576783636624; 
 Thu, 19 Dec 2019 11:27:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <cacdc0909f85b78b69c07ba5230b84ceae82954a.1576697796.git.tamas.lengyel@intel.com>
 <a8af0ab7-0396-f57b-2610-4417220034e2@citrix.com>
 <CABfawhkAh1Fr4XEGaf4UoHE=APoqutFoAKTjWjSEWJSh_3bjwg@mail.gmail.com>
 <7b3724df-db04-ef7b-6c1b-a3c772b0552e@citrix.com>
In-Reply-To: <7b3724df-db04-ef7b-6c1b-a3c772b0552e@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 12:26:40 -0700
X-Gmail-Original-Message-ID: <CABfawhkN1nuxPjvMfLdcXGRjT+N+Zq1c-JGuSoQusLnLWmJwLQ@mail.gmail.com>
Message-ID: <CABfawhkN1nuxPjvMfLdcXGRjT+N+Zq1c-JGuSoQusLnLWmJwLQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 04/20] x86/mem_sharing: cleanup code and
 comments in various locations
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMTE6NTEgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxOS8xMi8yMDE5IDE2OjIxLCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPj4+IEBAIC00MzcsMjUgKzQ0MSwyOSBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgbWVtX3NoYXJpbmdfZ2ZuX2Rlc3Ryb3koc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwKPiA+
Pj4gICAgICB4ZnJlZShnZm5faW5mbyk7Cj4gPj4+ICB9Cj4gPj4+Cj4gPj4+IC1zdGF0aWMgc3Ry
dWN0IHBhZ2VfaW5mbyogbWVtX3NoYXJpbmdfbG9va3VwKHVuc2lnbmVkIGxvbmcgbWZuKQo+ID4+
PiArc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZV9pbmZvKiBtZW1fc2hhcmluZ19sb29rdXAodW5z
aWduZWQgbG9uZyBtZm4pCj4gPj4gU2VlaW5nIGFzIHRoaXMgaXMgY2xlYW51cCwgdGhlIHBvc2l0
aW9uIG9mIHRoZSAqIGNhbiBtb3ZlLiAgU2ltaWxhcmx5LAo+ID4+IGl0IHNob3VsZG4ndCBnYWlu
IGFuIGlubGluZS4KPiA+Pgo+ID4+IEkgY2FuIGZpeCBhbGwgb2YgdGhpcyB1cCBvbiBjb21taXQg
KGFuZCBhIGZldyBvdGhlciBicmFjZSBwb3NpdGlvbgo+ID4+IGlzc3VlcykgaWYgeW91IHdhbnQs
IHRvIHNhdmUgcmV3b3JraW5nIGEgdHJpdmlhbCB2Mi4KPiA+Pgo+ID4gUHJvdmlkZWQgbm90aGlu
ZyBlbHNlIGlzIG91dHN0YW5kaW5nIHdpdGggdGhlIHBhdGNoIGFuZCBpdCBjYW4gYmUKPiA+IGNv
bW1pdHRlZCBJIHdvdWxkIGNlcnRhaW5seSBhcHByZWNpYXRlIHRoYXQuCj4KPiBJJ3ZlIHB1c2hl
ZCB0aGlzIGFuZCB0aGUgcHJldmlvdXMgcGF0Y2gsIHdpdGggc29tZSBmdXJ0aGVyIGZpeHVwcyB0
aGF0IEkKPiBzcG90dGVkLgo+Cj4gSG9wZWZ1bGx5IHRoZSByZWJhc2Ugd29uJ3QgYmUgYW4gaXNz
dWUuCgpHcmVhdCEgVGhlcmUgd2VyZSBxdWl0ZSBhIGZldyBjb25mbGljdHMgaW4gdGhlIHJlYmFz
ZSBzbyBJIGhvcGUgSQpkb24ndCBhY2NpZGVudGFsbHkgcmV2ZXJ0IHNvbWUgb2YgeW91ciBuZXcg
Zml4ZXMgOikKClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
