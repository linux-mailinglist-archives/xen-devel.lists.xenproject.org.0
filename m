Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835876D40D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 20:38:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoBFN-0002kQ-Ti; Thu, 18 Jul 2019 18:35:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoBFM-0002kL-1r
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 18:35:16 +0000
X-Inumbo-ID: c704ac90-a98a-11e9-b22c-47690032ade5
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c704ac90-a98a-11e9-b22c-47690032ade5;
 Thu, 18 Jul 2019 18:35:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563474912; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=1jW9Mi5T2TR3Wfcq8u3cBSfQNfxIf+ZzWtemgeZeXxA=;
 b=KEUUHLT7fmzXnyOWbq2n9QUjp1Lb44tYI/f95sk0eXa+MHRPbNzliFqX4kLdGntjKUTT2Mau
 L/JFXeTHOjKqr8jRua1C8t7c/f0yRO+EYVqXB0i3GYj9ql1MZw7wEjux9Xbo2p3AVWJJDFjc
 zVwwYhSs3EY8ZOwi1UCpsAYLQ8E=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5d30bbde.7f8614680ab0-smtp-out-n01;
 Thu, 18 Jul 2019 18:35:10 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id c2so26561704wrm.8
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 11:35:09 -0700 (PDT)
X-Gm-Message-State: APjAAAX0IkJ9vydb+Ya1go34fon81mkVdF/BtQOvRCzbGko8NhqMuwO7
 qFXl/Crijt9BwmIIg6Pr13ahFP5IexInRkGuDZg=
X-Google-Smtp-Source: APXvYqzKCnwENTaNaAaoMlU9tNGN30s1sxp3F7byGZqMQLlTfTq0ADxLCI3GeGMphTM7i2a1Orl0xmy1kV0iJWk6mtA=
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr49388203wro.60.1563474908800; 
 Thu, 18 Jul 2019 11:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <766b2e92-9d0d-e4d8-2a11-37b7e974f6d0@citrix.com>
In-Reply-To: <766b2e92-9d0d-e4d8-2a11-37b7e974f6d0@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 12:34:32 -0600
X-Gmail-Original-Message-ID: <CABfawhk-qCQeo+feqk=a2P_cXBrNsDtRuDYAQ9Vf56AQH0H_dg@mail.gmail.com>
Message-ID: <CABfawhk-qCQeo+feqk=a2P_cXBrNsDtRuDYAQ9Vf56AQH0H_dg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMTE6NTkgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxOC8wNy8yMDE5IDE1OjQzLCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvQ09ESU5HX1NUWUxFIGIvQ09ESU5HX1NU
WUxFCj4gPiBpbmRleCA2Y2M1Yjc3NGNmLi4wYjM3ZjdhZTRkIDEwMDY0NAo+ID4gLS0tIGEvQ09E
SU5HX1NUWUxFCj4gPiArKysgYi9DT0RJTkdfU1RZTEUKPiA+IEBAIC02MCw4ICs2MCw4IEBAIEJy
YWNpbmcKPiA+ICAtLS0tLS0tCj4gPgo+ID4gIEJyYWNlcyAoJ3snIGFuZCAnfScpIGFyZSB1c3Vh
bGx5IHBsYWNlZCBvbiBhIGxpbmUgb2YgdGhlaXIgb3duLCBleGNlcHQKPiA+IC1mb3IgdGhlIGRv
L3doaWxlIGxvb3AuICBUaGlzIGlzIHVubGlrZSB0aGUgTGludXggY29kaW5nIHN0eWxlIGFuZAo+
ID4gLXVubGlrZSBLJlIuICBkby93aGlsZSBsb29wcyBhcmUgYW4gZXhjZXB0aW9uLiBlLmcuOgo+
ID4gK2ZvciB0aGUgd2hpbGUtcGFydCBvZiBkby93aGlsZSBsb29wcy4gIFRoaXMgaXMgdW5saWtl
IHRoZSBMaW51eCBjb2Rpbmcgc3R5bGUKPiA+ICthbmQgdW5saWtlIEsmUi4gIGRvL3doaWxlIGxv
b3BzIGFyZSBhbiBleGNlcHRpb24uIGUuZy46Cj4gPgo+ID4gIGlmICggY29uZGl0aW9uICkKPiA+
ICB7Cj4gPiBAQCAtNzcsNyArNzcsOCBAQCB3aGlsZSAoIGNvbmRpdGlvbiApCj4gPiAgICAgIC8q
IERvIHN0dWZmLiAqLwo+ID4gIH0KPiA+Cj4gPiAtZG8gewo+ID4gK2RvCj4gPiArewo+Cj4gSSdk
IGhhcHBpbHkgdGFrZSB0aGlzIGFkanVzdG1lbnQgdG8gWGVuJ3Mgc3R5bGUgaWYgaXQgaGVscHMg
dXMgZW5kIHVwCj4gd2l0aCBhdXRvLWZvcm1hdHRlci4KCllheSEKCj4KPiBBbHNvLCB0aGVyZSBh
cmUgYSBudW1iZXIgb2YgZmlsZXMgd2hpY2ggYXJlIHRlY2huaWNhbGx5IExpbnV4IHN0eWxlLCBi
dXQKPiBoYXZlIHRvdGFsbHkgZGl2ZXJnZWQgZnJvbSBMaW51eCwgYW5kIHdvdWxkIGJlIGVhc2ll
ciB0byBtb3ZlIHRvIFhlbiBzdHlsZS4KPgo+IERvIHlvdSBoYXZlIGFuIHVwZGF0ZWQgLmFzdHls
ZXJjIGJhc2VkIG9uIEp1bGllbidzIG9ic2VydmF0aW9ucz8KClllcywgdGhpcyBpcyBpdDoKCnN0
eWxlPWJzZApzdWZmaXg9bm9uZQphbGlnbi1wb2ludGVyPW5hbWUKYWxpZ24tcmVmZXJlbmNlPW5h
bWUKaW5kZW50PXNwYWNlcz00Cm1heC1jb2RlLWxlbmd0aD04MAptaW4tY29uZGl0aW9uYWwtaW5k
ZW50PTAKbWF4LWNvbnRpbnVhdGlvbi1pbmRlbnQ9NzgKYXR0YWNoLWNsb3Npbmctd2hpbGUKcmVt
b3ZlLWJyYWNlcwpicmVhay1vbmUtbGluZS1oZWFkZXJzCnBhZC1jb21tYQpwYWQtaGVhZGVyCgpX
aXRoIHRoaXMgaXQncyBkb3duIHRvIDg2MCBmaWxlcyB0aGF0IGFyZSBmb3JtYXR0ZWQuCgo+Cj4g
SVNUUiBzb21lb25lIHNheWluZyB0aGF0IHRoZSBtYWludGFpbmVyIG9mIGFzdHlsZSB3YXMgdmVy
eSBoYXBweSB0YWtpbmcKPiBhZGRpdGlvbnMsIGlmIHdlIG5lZWQgdG8gZ28gYWxvbmcgdGhhdCBy
b3V0ZS4KClJpZ2h0LCBhZGRpbmcgYSAieGVuIiBzdHlsZSB0ZW1wbGF0ZSB3b3VsZCBiZSBhIHBv
c3NpYmxlIHJvdXRlLCBidXQKSU1ITyB3ZSBhcmUgbm90IHRoYXQgZmFyIG9mZiBmcm9tIHRoZSBi
c2Qgc3R5bGUgdG8gd2FycmFudCBpdC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
