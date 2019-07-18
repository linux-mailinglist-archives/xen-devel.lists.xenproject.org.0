Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D896D2B2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:24:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoA78-0005If-GN; Thu, 18 Jul 2019 17:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoA76-0005IY-69
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:22:40 +0000
X-Inumbo-ID: a40bcf70-a980-11e9-9690-577c76af267e
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a40bcf70-a980-11e9-9690-577c76af267e;
 Thu, 18 Jul 2019 17:22:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563470558; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=ksKVOH7L5XRdEPkH8lf4/HqxYi9oPGraooFsgRIna3I=;
 b=hDoN4FzLpHMaj9gPts2qzxvIFKSNOx0UZ+WtNX2t9h2fxUZWI7Hupk593QHuvWdtcdMgotP6
 w9miQ4tnYeBevzAFfQ5+S4m67qk+/eMpKr4H7nbqFd9E3DsyeNSJzQqo/Q869tzq9GNfbPvj
 i4Buw2gBslOgn31/wOZJHpV+UrA=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mxa.mailgun.org with ESMTP id 5d30aade.7f9c51d2e9f0-smtp-out-n03;
 Thu, 18 Jul 2019 17:22:38 -0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id w9so21977130wmd.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 10:22:37 -0700 (PDT)
X-Gm-Message-State: APjAAAW9KEIP0ahk/nj4c2a/1/3or/HO9EXJppCxJez6Jb+WoKR6kuXi
 UFO7kyMGBShKZsVp/2Bqn9D0eu0kSyYwq98HGPI=
X-Google-Smtp-Source: APXvYqyIWwAVGorUDXe9SdWdIAQjcCNLGOJCZPfOnyoqVZcOgug/hzD8YTeyaST3OXe35n7RieEDXjP4GDa68Ru3dF0=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr43821769wmc.169.1563470557040; 
 Thu, 18 Jul 2019 10:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
In-Reply-To: <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 11:22:00 -0600
X-Gmail-Original-Message-ID: <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
Message-ID: <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
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

PiAgICAtIExpbmUgMTM5OiBUaGUgeyBhcmUgY29tbW9ubHkgb24gdGhlIHNhbWUgbGluZSBhcyBz
dHJ1Y3Qgb3IgZGVmaW5pdGlvbi4KCkFjY29yZGluZyB0byBDT0RJTkdfU1RZTEUgdGhhdCdzIG5v
dCBob3cgaXQgc2hvdWxkIGJlLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
