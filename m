Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007A1268B0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 19:09:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii0Ci-0000qK-0M; Thu, 19 Dec 2019 18:07:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ii0Cg-0000qD-0w
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 18:07:14 +0000
X-Inumbo-ID: 5ce91714-228a-11ea-88e7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ce91714-228a-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 18:07:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576778825; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=iQjaxxljpyYQWiEzpxYvAuLMj6VTuACLHd2fNhBwxfY=;
 b=cpjzIaFGrLspEeznRqtuvrbmERUkTkm9OBLEpXh5dOhM6lq9GeHhfvyhGlJIsPfLp9bNfauo
 oXm10cwZl6HjvoNPgRBNiIgBsnIaLR2la3MIk3TDuypPzX1yxGb1s9SJ1+MndPf+3n7KsbEL
 YvxK1t2vbFNpPex71IF5dUvKfk4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5dfba359.7f6fbf1f7bf0-smtp-out-n02;
 Thu, 19 Dec 2019 16:20:41 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p17so6260116wma.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 08:20:40 -0800 (PST)
X-Gm-Message-State: APjAAAWPAkJR2c3BK1fnye8Zwfi+PPM9ue6b3woOLKmhTWcXJoq/pKR1
 XWcjv7NGYEeIc2+ZfBM002jHpv45DWgb9CpwsuQ=
X-Google-Smtp-Source: APXvYqxlX/3sdy7c/8jFerfS+Zbp7U4Ff989eLg/quW7ij7FAlsfdhHxXZbFEmzkO2V2S3AwCRjguPM6DJNQk6KQ6A4=
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr11668445wmi.15.1576772440068; 
 Thu, 19 Dec 2019 08:20:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <cacdc0909f85b78b69c07ba5230b84ceae82954a.1576697796.git.tamas.lengyel@intel.com>
 <a8af0ab7-0396-f57b-2610-4417220034e2@citrix.com>
In-Reply-To: <a8af0ab7-0396-f57b-2610-4417220034e2@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 09:20:03 -0700
X-Gmail-Original-Message-ID: <CABfawhm-VbD-rxB_wMku4=MTsnCXS21MStjE1wcMNDG7HFGJLg@mail.gmail.com>
Message-ID: <CABfawhm-VbD-rxB_wMku4=MTsnCXS21MStjE1wcMNDG7HFGJLg@mail.gmail.com>
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

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgNDoxOSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDE4LzEyLzIwMTkgMTk6NDAsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIv
eGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ID4gaW5kZXggNWEzYTk2MmZiYi4uMWU4ODhiNDAzYiAx
MDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKPiA+IEBAIC0xOTAyLDEyICsxOTAyLDExIEBAIGludCBodm1faGFwX25l
c3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwKPiA+ICAgICAg
aWYgKCBucGZlYy53cml0ZV9hY2Nlc3MgJiYgKHAybXQgPT0gcDJtX3JhbV9zaGFyZWQpICkKPiA+
ICAgICAgewo+ID4gICAgICAgICAgQVNTRVJUKHAybV9pc19ob3N0cDJtKHAybSkpOwo+ID4gLSAg
ICAgICAgc2hhcmluZ19lbm9tZW0gPQo+ID4gLSAgICAgICAgICAgIChtZW1fc2hhcmluZ191bnNo
YXJlX3BhZ2UoY3VycmQsIGdmbiwgMCkgPCAwKTsKPiA+ICsgICAgICAgIHNoYXJpbmdfZW5vbWVt
ID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGN1cnJkLCBnZm4sIDApOwo+Cj4gVGhpcyBpcyBh
IGxvZ2ljYWwgY2hhbmdlLiAgSXMgaXQgaW50ZW5kZWQgdG8gYmUgaW4gYSBsYXRlciBwYXRjaD8K
CldoaWxlIGl0IG1heSBsb29rIGxpa2Ugb25lIGl0J3MgYWN0dWFsbHkgbm90LiBUaGUgdmFyaWFi
bGUKc2hhcmluZ19lbm9tZW0gaXMgZGVjbGFyZWQgYXMgYW4gaW50IGFuZCB0aGUgZnVuY3Rpb24g
b25seSBoYXMgdHdvCnBvc3NpYmxlIHJldHVybiB2YWx1ZXMsIDAgYW5kIC1FTk9NRU0uCgpUYW1h
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
