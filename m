Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443686D331
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:51:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoAWX-0007Jd-Hs; Thu, 18 Jul 2019 17:48:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoAWV-0007JX-I1
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:48:55 +0000
X-Inumbo-ID: 4d86112a-a984-11e9-af81-a3aacacb69d1
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d86112a-a984-11e9-af81-a3aacacb69d1;
 Thu, 18 Jul 2019 17:48:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563472131; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=RJTo5tes5t1fnSz40v8gpUmmH3aMdurBQkumNQapOis=;
 b=HS4cbFUDEGegtpnHLtw+qk9pyJK3Bux/1OyjaoB/a9gR/nsqQzC2TLnxQj8kxkKaXpDFzupa
 cWiTxqZpVeLheLfaqiPFF8iz/KqKkkC7j3MPrgJ1OufC90Kx+0MjUGUFRf7C7hzQCIzDcHEE
 3sWe8zpFRVsZE04yFUHo2ac0K4U=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mxa.mailgun.org with ESMTP id 5d30b0fd.7fae699aa870-smtp-out-n02;
 Thu, 18 Jul 2019 17:48:45 -0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y4so29650446wrm.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 10:48:44 -0700 (PDT)
X-Gm-Message-State: APjAAAWnv+aYfoK3+8/wA4iqfMvZo348veYuLFmoEZiW2WUsn2VxEFCI
 t+IT8UA9JeFot6xyza6Dux51muCV/bf4OF/hhSk=
X-Google-Smtp-Source: APXvYqyXy2EQm61twMk0yteMWKQdv1+JPAgh3d73suOKkcf1s4dI8A6+eh+w+YEgHBTQ8tBbrO1jcG+pn1THCIfLcvc=
X-Received: by 2002:a5d:5012:: with SMTP id e18mr22543464wrt.166.1563472123367; 
 Thu, 18 Jul 2019 10:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
In-Reply-To: <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 11:48:07 -0600
X-Gmail-Original-Message-ID: <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
Message-ID: <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
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

PiAgICAtIExpbmUgMTAyNTogVGhlIHRvb2xzIG5lZWRzIHRvIGJlIGFibGUgdG8gZGVhbCBmb3Jf
ZWFjaF92Y3B1KC4uLikgJiBjby4KClRoZXNlIGNhbiBiZSBtYWRlIE9LIGJ5IGFkZGluZyBicmFj
ZXMuIE90aGVyIHRoYW4gdGhhdCB0aGUgb25seSB3YXkgSQpmb3VuZCB0byBtYWtlIGl0IG5vdCBj
aGFuZ2UgdGhlIGluZGVudGF0aW9uIGlzIHRvIGFkZCB0aGUgY29tbWVudCAiLyoKKklOREVOVC1P
RkYqICovIiBiZWZvcmUgdGhlIGJsb2NrIGFuZCAiLyogKklOREVOVC1PTiogKi8iIGFmdGVyd2Fy
ZHMuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
