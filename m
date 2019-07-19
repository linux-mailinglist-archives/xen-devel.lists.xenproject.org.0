Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4056E607
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:03:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSVI-0007VF-RG; Fri, 19 Jul 2019 13:00:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVsN=VQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoSVH-0007V5-8o
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:00:51 +0000
X-Inumbo-ID: 3a9f21cc-aa25-11e9-bbcd-13f377da1495
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a9f21cc-aa25-11e9-bbcd-13f377da1495;
 Fri, 19 Jul 2019 13:00:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563541248; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=3cWIX/ptAV25/doircB1Dczwy7hDA5bftQDSKJGUTt4=;
 b=epTgVpi5b7jW+gVWgniHt4Jn/0uQ1TACsxnwbdueEgePemf0C+/pfIavvpsZ/k3gjKU3Qnym
 LGMq36t6DUfeHZm5m5UnmPbuhRkrmC0WFpmQ/4+bUHd9qwanQ/nWdqyDg/sfNZLjQcTrX+Ej
 kSOvPIgEFBbWJ2WAkcMis5tOrFI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mxa.mailgun.org with ESMTP id 5d31beff.7fa037c0b1f0-smtp-out-n01;
 Fri, 19 Jul 2019 13:00:47 -0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id u25so18601264wmc.4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:00:46 -0700 (PDT)
X-Gm-Message-State: APjAAAVEOlPH3fQeKO5/t5WQt9e4nDFZBKjTDwxnHKQgmXE2NMkP0UXD
 znsAA5aLhJ9xK+4zHzbBQRWjJjZZtKc9z1BpgRM=
X-Google-Smtp-Source: APXvYqyWdPdGK7tFhE1Z3M7Xvl6YCWflylGiwtOAu8EOVMfmjjsGP+wdxdq8HjPMTqY9NRwbJfFr2BBzPRCzTm1mtgw=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr48706182wmc.169.1563541246058; 
 Fri, 19 Jul 2019 06:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
 <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
In-Reply-To: <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Jul 2019 07:00:09 -0600
X-Gmail-Original-Message-ID: <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
Message-ID: <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMjo0MyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpIFRhbWFzLAo+Cj4gT24gMTgvMDcvMjAxOSAxODo0OCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+ICAgICAtIExpbmUgMTAyNTogVGhlIHRvb2xzIG5l
ZWRzIHRvIGJlIGFibGUgdG8gZGVhbCBmb3JfZWFjaF92Y3B1KC4uLikgJiBjby4KPiA+Cj4gPiBU
aGVzZSBjYW4gYmUgbWFkZSBPSyBieSBhZGRpbmcgYnJhY2VzLiBPdGhlciB0aGFuIHRoYXQgdGhl
IG9ubHkgd2F5IEkKPiA+IGZvdW5kIHRvIG1ha2UgaXQgbm90IGNoYW5nZSB0aGUgaW5kZW50YXRp
b24gaXMgdG8gYWRkIHRoZSBjb21tZW50ICIvKgo+ID4gKklOREVOVC1PRkYqICovIiBiZWZvcmUg
dGhlIGJsb2NrIGFuZCAiLyogKklOREVOVC1PTiogKi8iIGFmdGVyd2FyZHMuCj4KPiBOb25lIG9m
IHRoZW0gbG9va3MgcmVhbGx5IGFwcGVhbGluZyBiZWNhdXNlIGl0IG1lYW5zIGFzdHlsZSB3aWxs
IG5vdCBjb3JyZWN0bHkKPiBpbmRlbnQgaWYgdGhlIHVzZXIgZG9lcyBub3QgYWRkIGJyYWNlcyBv
ciBjb21tZW50cy4KPgo+IENvdWxkIGFzdHlsZSBiZSBlYXNpbHkgbW9kaWZpZWQgdG8gcmVjb2du
aXplIGZvcmVhY2ggbWFjcm9zPwoKTm90IHRoYXQgSSdtIGF3YXJlIG9mLiBJZiB5b3UgZG9uJ3Qg
d2FudCB0byBtYW51YWxseSBhbm5vdGF0ZSBmaWxlcwp3aXRoIHVuc3VwcG9ydGVkIG1hY3JvcyB0
aGVuIGp1c3QgZXhjbHVkZSB0aG9zZSBmaWxlcyBmcm9tIGFzdHlsZS4gSQp3b3VsZG4ndCByZWNv
bW1lbmQgYWRkaW5nIHRoaXMgdG8gdGhlIENJIGZvciBhbGwgZmlsZXMsIG9ubHkgZm9yIHRob3Nl
CnRoYXQgdGhlaXIgcmVzcGVjdGl2ZSBtYWludGFpbmVycyBoYXZlIGNvbmZpcm1lZCB0byBjb25m
b3JtIHRvIHRoZQpzdHlsZSBhbmQgd2FudCB0byBlbmZvcmNlIGl0IGdvaW5nIGZvcndhcmQuCgpU
YW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
