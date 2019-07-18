Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F026D2C3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:29:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoAAh-0005Qm-2Z; Thu, 18 Jul 2019 17:26:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoAAf-0005Qh-M7
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:26:21 +0000
X-Inumbo-ID: 27c0931e-a981-11e9-b36b-f3b366e25b29
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27c0931e-a981-11e9-b36b-f3b366e25b29;
 Thu, 18 Jul 2019 17:26:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563470779; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=EgcTZbIp/sNv/Nax1hJJy3JuzoKV0lR5z8FAtCjHhY4=;
 b=G3yueGhzRiWAqiJgzYkeryrEf+ZzXM2qu78kxokYlb81U07fMfgQrIvX9xg92jWoPhvhD/9D
 UWiIT89K6pOLmqFlwNLqufIHujF4ggJY/jDuou78HHn3cDXx20v+ymGpIuKu3Z+yNYHtTsLk
 s54TNa4jXKfx45oTbhlg2C1CI3c=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mxa.mailgun.org with ESMTP id 5d30abba.7f2d2d2a6eb0-smtp-out-n01;
 Thu, 18 Jul 2019 17:26:18 -0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id s3so26371895wms.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 10:26:18 -0700 (PDT)
X-Gm-Message-State: APjAAAUPFphX/sssJmQmsb04E9Zaqk/su5UUQMuxi09ZBUvEloN7UwNk
 JpqUitNumpzdKE0hgAKvSLk6sWnVol5GINqjHxA=
X-Google-Smtp-Source: APXvYqwcSpjFos0KSxWXpkHnByz1aDWWQa+QC3TCZtY5IHecF8QUtx5yNih3hlqNlTpqO0IAptRdjAKhmEp6mqUS/nE=
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr43588546wmj.128.1563470777561; 
 Thu, 18 Jul 2019 10:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
In-Reply-To: <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 11:25:40 -0600
X-Gmail-Original-Message-ID: <CABfawhmuMKjtEBLWu1rMyUgm5=WR-UFKN1dxCMnoanOVoFfz1w@mail.gmail.com>
Message-ID: <CABfawhmuMKjtEBLWu1rMyUgm5=WR-UFKN1dxCMnoanOVoFfz1w@mail.gmail.com>
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

PiAgICAtIExpbmUgMjc2OiBUaGUgc3dpdGNoIGNhc2UgaW5kZW50YXRpb24gd2FzIGNvcnJlY3Qg
ZnJvbSBYZW4gUG9WIGJlZm9yZQoKUmVtb3ZpbmcgImluZGVudC1zd2l0Y2hlcyIgZnJvbSB0aGUg
LmFzdHlsZXJjIGFjdHVhbGx5IGxlYXZlcyB0aGVzZQpzd2l0Y2hlcyB1bnRvdWNoZWQsIHNvIHRo
YXQncyBhbiBlYXN5IGZpeC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
