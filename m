Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856C46D0ED
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho89c-0002ln-NF; Thu, 18 Jul 2019 15:17:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ho89a-0002lf-Uz
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:17:06 +0000
X-Inumbo-ID: 1a1a546e-a96f-11e9-a3f7-a7677c615c65
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a1a546e-a96f-11e9-a3f7-a7677c615c65;
 Thu, 18 Jul 2019 15:17:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563463025; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=rZUuQAyURS4MI34PaSZRsFesccnvfB0ru1Sqv7dovr0=;
 b=QLg8jR2isJ9G1pUfUyTpOckkpUxrw0sym0jOE1fIblKEbU0DQc4U5Ghh0bgAMxUw7cO7Q2Gb
 rdJGW6RJolndK1bwArPNrnE5xfzLe13Xywa0IozT2F1yKMKJIJaTdkpLfriVRNoYBoNqDMOS
 r07pPaqAKPhDvqa+6KmjpHPDuO0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mxa.mailgun.org with ESMTP id 5d308d71.7fce6f2aa730-smtp-out-n02;
 Thu, 18 Jul 2019 15:17:05 -0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p74so25968804wme.4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 08:17:04 -0700 (PDT)
X-Gm-Message-State: APjAAAWVtIWgRPq2tof1WoXlLadGDpDODPGNHI61LWr+Ru1fIh/sbWRf
 JH+DVgFfmSSdy1iUgYoy6ebMP+THotFMUAbPQTk=
X-Google-Smtp-Source: APXvYqzjJehgoGaMHJ+WgGiIlmPz1IEwPRLncH1mF/cd4ROBgwYZ66ngcSHvVwtEld4RwgY7uqqNR3+It1paTGrB5X0=
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr41462632wmh.129.1563463023419; 
 Thu, 18 Jul 2019 08:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <642271a1-d9ca-adfc-c06b-cd05d266e53c@suse.com>
In-Reply-To: <642271a1-d9ca-adfc-c06b-cd05d266e53c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 09:16:27 -0600
X-Gmail-Original-Message-ID: <CABfawhke+TuJ2My-ZaTrT97mqW7V3HrVu=KCm9-2cFPj47Ewmw@mail.gmail.com>
Message-ID: <CABfawhke+TuJ2My-ZaTrT97mqW7V3HrVu=KCm9-2cFPj47Ewmw@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgOToxNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDcuMjAxOSAxNjo0MywgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gLS0tIGEvQ09ESU5HX1NUWUxFCj4gPiArKysgYi9DT0RJTkdfU1RZTEUKPiA+IEBA
IC02MCw4ICs2MCw4IEBAIEJyYWNpbmcKPiA+ICAgLS0tLS0tLQo+ID4KPiA+ICAgQnJhY2VzICgn
eycgYW5kICd9JykgYXJlIHVzdWFsbHkgcGxhY2VkIG9uIGEgbGluZSBvZiB0aGVpciBvd24sIGV4
Y2VwdAo+ID4gLWZvciB0aGUgZG8vd2hpbGUgbG9vcC4gIFRoaXMgaXMgdW5saWtlIHRoZSBMaW51
eCBjb2Rpbmcgc3R5bGUgYW5kCj4gPiAtdW5saWtlIEsmUi4gIGRvL3doaWxlIGxvb3BzIGFyZSBh
biBleGNlcHRpb24uIGUuZy46Cj4gPiArZm9yIHRoZSB3aGlsZS1wYXJ0IG9mIGRvL3doaWxlIGxv
b3BzLiAgVGhpcyBpcyB1bmxpa2UgdGhlIExpbnV4IGNvZGluZyBzdHlsZQo+ID4gK2FuZCB1bmxp
a2UgSyZSLiAgZG8vd2hpbGUgbG9vcHMgYXJlIGFuIGV4Y2VwdGlvbi4gZS5nLjoKPiA+Cj4gPiAg
IGlmICggY29uZGl0aW9uICkKPiA+ICAgewo+ID4gQEAgLTc3LDcgKzc3LDggQEAgd2hpbGUgKCBj
b25kaXRpb24gKQo+ID4gICAgICAgLyogRG8gc3R1ZmYuICovCj4gPiAgIH0KPiA+Cj4gPiAtZG8g
ewo+ID4gK2RvCj4gPiArewo+ID4gICAgICAgLyogRG8gc3R1ZmYuICovCj4gPiAgIH0gd2hpbGUg
KCBjb25kaXRpb24gKTsKPgo+IEkgZGlzYWdyZWUgd2l0aCB0aGlzIGNoYW5nZTogVGhlcmUncyBh
IGxhcmdlIG51bWJlciBvZiAoY29ycmVjdCBhcwo+IHBlciB0aGUgdGV4dCBwcmlvciB0byB5b3Vy
IGNoYW5nZSkgaW5zdGFuY2VzLCBhbmQgc2luY2UgdGhlcmUncwo+IG5vdGhpbmcgYWZmZWN0aW5n
IHRoZSBsZW5ndGggb2Ygc3VjaCBsaW5lcyBhdm9pZGluZyB0aGUgZXh0cmEgbGluZQo+IGlzIHF1
aXRlIGRlc2lyYWJsZSBpbW8uCj4KCkkgdW5kZXJzdGFuZC4gSG93ZXZlciwgdGhlIHVwc2lkZSBv
ZiB0aGUgY2hhbmdlIHdvdWxkIGJlIHRoYXQgd2UgY2FuCmF1dG9tYXRlIGl0LiBJIGNvdWxkbid0
IGZpbmQgYSB3YXkgdG8gb3ZlcnJpZGUgdGhlIGJzZCBmb3JtYXQgdG8KaW5jb3Jwb3JhdGUgdGhp
cyBleGNlcHRpb24uIFNvIGluIG15IGJvb2sgdGhpcyBjaGFuZ2UgaXMgc3RpbGwgd2VsbAp3b3J0
aCBpdC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
