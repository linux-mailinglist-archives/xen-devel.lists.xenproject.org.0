Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E496576C14
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:52:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1Yo-00072T-1y; Fri, 26 Jul 2019 14:51:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XdPt=VX=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hr1Ym-00072A-C2
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:51:04 +0000
X-Inumbo-ID: c9f17662-afb4-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c9f17662-afb4-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:51:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1564152662; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=aPYVdwpVxuKCUBD60YPVFNfBk+jHUo8wDfshJK3vzm0=;
 b=j6glKdrqEhd6reOJhn6Ng5tvQmHBmEbjEA9odz2I5ejKHR+5bhkpNydE97QXJe64tgQ43/qc
 yj99nMO2sFWNmssLJgX+wq5JjtYgihAQbiQW/O89E8m83G5lLbLcQ04g5qI5OfQFZlKLK4Xw
 X9gvCgdxbNCkf+h8AQ2K6dtmRIQ=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mxa.mailgun.org with ESMTP id 5d3b1355.7f563fe486b0-smtp-out-n02;
 Fri, 26 Jul 2019 14:51:01 -0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n9so54837894wru.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 07:51:00 -0700 (PDT)
X-Gm-Message-State: APjAAAW5ZvOj5lY7LX0Vopvr34sKPN6xA5ifhsVH3qjuUI1dBhS9o/i3
 ulIRwD5Rz3P41JaH0eyP8Ojw32euVcJMX0f4qwU=
X-Google-Smtp-Source: APXvYqwFfpHUOvfNCXAFhSOHavHWm7MPjAw3aEEeN+Hy3s9vLjkXjH0WGj5zuWhOtuSEhkm1KhjcNT3viKnsKASK6f0=
X-Received: by 2002:adf:9486:: with SMTP id 6mr71460069wrr.242.1564152659423; 
 Fri, 26 Jul 2019 07:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <642271a1-d9ca-adfc-c06b-cd05d266e53c@suse.com>
 <CAOcoXZZr+54R2i_aPNWDVXCoMxf5+ZZi=c4vthxaqa95_SP5Ww@mail.gmail.com>
In-Reply-To: <CAOcoXZZr+54R2i_aPNWDVXCoMxf5+ZZi=c4vthxaqa95_SP5Ww@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Jul 2019 08:50:22 -0600
X-Gmail-Original-Message-ID: <CABfawhmY+aZ6F3bSPEQ2M-r+JF6WAx=3UTk52Rmzg3CcKOwyFA@mail.gmail.com>
Message-ID: <CABfawhmY+aZ6F3bSPEQ2M-r+JF6WAx=3UTk52Rmzg3CcKOwyFA@mail.gmail.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgODo0MiBBTSBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRp
bi4xOUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQWxsLAo+Cj4gT24gVGh1LCBKdWwgMTgsIDIw
MTkgYXQgNjoxNiBQTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4K
PiA+IE9uIDE4LjA3LjIwMTkgMTY6NDMsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gLS0t
IGEvQ09ESU5HX1NUWUxFCj4gPiA+ICsrKyBiL0NPRElOR19TVFlMRQo+ID4gPiBAQCAtNjAsOCAr
NjAsOCBAQCBCcmFjaW5nCj4gPiA+ICAgLS0tLS0tLQo+ID4gPgo+ID4gPiAgIEJyYWNlcyAoJ3sn
IGFuZCAnfScpIGFyZSB1c3VhbGx5IHBsYWNlZCBvbiBhIGxpbmUgb2YgdGhlaXIgb3duLCBleGNl
cHQKPiA+ID4gLWZvciB0aGUgZG8vd2hpbGUgbG9vcC4gIFRoaXMgaXMgdW5saWtlIHRoZSBMaW51
eCBjb2Rpbmcgc3R5bGUgYW5kCj4gPiA+IC11bmxpa2UgSyZSLiAgZG8vd2hpbGUgbG9vcHMgYXJl
IGFuIGV4Y2VwdGlvbi4gZS5nLjoKPiA+ID4gK2ZvciB0aGUgd2hpbGUtcGFydCBvZiBkby93aGls
ZSBsb29wcy4gIFRoaXMgaXMgdW5saWtlIHRoZSBMaW51eCBjb2Rpbmcgc3R5bGUKPiA+ID4gK2Fu
ZCB1bmxpa2UgSyZSLiAgZG8vd2hpbGUgbG9vcHMgYXJlIGFuIGV4Y2VwdGlvbi4gZS5nLjoKPiA+
ID4KPiA+ID4gICBpZiAoIGNvbmRpdGlvbiApCj4gPiA+ICAgewo+ID4gPiBAQCAtNzcsNyArNzcs
OCBAQCB3aGlsZSAoIGNvbmRpdGlvbiApCj4gPiA+ICAgICAgIC8qIERvIHN0dWZmLiAqLwo+ID4g
PiAgIH0KPiA+ID4KPiA+ID4gLWRvIHsKPiA+ID4gK2RvCj4gPiA+ICt7Cj4gPiA+ICAgICAgIC8q
IERvIHN0dWZmLiAqLwo+ID4gPiAgIH0gd2hpbGUgKCBjb25kaXRpb24gKTsKPiA+Cj4gPiBJIGRp
c2FncmVlIHdpdGggdGhpcyBjaGFuZ2U6IFRoZXJlJ3MgYSBsYXJnZSBudW1iZXIgb2YgKGNvcnJl
Y3QgYXMKPiA+IHBlciB0aGUgdGV4dCBwcmlvciB0byB5b3VyIGNoYW5nZSkgaW5zdGFuY2VzLCBh
bmQgc2luY2UgdGhlcmUncwo+ID4gbm90aGluZyBhZmZlY3RpbmcgdGhlIGxlbmd0aCBvZiBzdWNo
IGxpbmVzIGF2b2lkaW5nIHRoZSBleHRyYSBsaW5lCj4gPiBpcyBxdWl0ZSBkZXNpcmFibGUgaW1v
Lgo+ID4KPgo+IFBsZWFzZSBiZSBhd2FyZSB0aGF0ICd4ZW4gbW9kaWZpZWQnIGNsYW5nLWZvcm1h
dCBzdXBwb3J0cyBzdWNoCj4gJ2RvL3doaWxlJyBicmFjZXMgZXhjZXB0aW9uLgo+IEl0IGhhcyBi
ZWVuIHRlc3RlZCBwcmV2aW91c2x5IGFuZCB3b3JrcyB3ZWxsLgo+CgpTb3VuZHMgZ29vZCB0byBt
ZSwgSSB3b3VsZCBzYXkgbGV0J3MgZ28gd2l0aCB0aGF0IGlmIGl0IHJlZHVjZXMgY2h1cm4KaW4g
dGhlIGNvZGUuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
