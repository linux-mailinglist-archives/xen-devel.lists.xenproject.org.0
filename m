Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4026D2A9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:22:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoA4A-0004b0-UG; Thu, 18 Jul 2019 17:19:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoA49-0004Zt-2p
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:19:37 +0000
X-Inumbo-ID: 356df066-a980-11e9-8343-ebd002a81a3b
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 356df066-a980-11e9-8343-ebd002a81a3b;
 Thu, 18 Jul 2019 17:19:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563470373; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=JINs1PLWKz362605MoT8XSAA4KcQCMlcsGMNlr4cE9M=;
 b=NYxPymKIN9HqNo11mrIKE9NCGSOb5YagP3WQHM82aYUQvxgn+QXXALJNOSTc8S9N2LZp+a8b
 ys7v4ONoAz9NG9d+IVuoVN/TS5bPXRLWspoZyzuPcppHl7lN4gfMmpbcHne6N7YhzBJk/7Lq
 Pz4kQzKcdBpjxYdHlz4R28mgQiI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mxa.mailgun.org with ESMTP id 5d30aa23.7fdc7f4604b0-smtp-out-n01;
 Thu, 18 Jul 2019 17:19:31 -0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id u25so16111936wmc.4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 10:19:31 -0700 (PDT)
X-Gm-Message-State: APjAAAViDYx7Qs5PFVkZFOaBlKvc4lwTSjWUIuO8jJWpRqV2lgK7Vl6p
 YeIvbEVbv8e1fKrYmA2RKW9A4e4XX8peq/LZrR0=
X-Google-Smtp-Source: APXvYqxmgQYWoFWEVAi9fHZB1YYRy04Du/nZSPPBVAankERVrLIabRKqKCFKbP8tJND/wUstfrxKesU4TW6yLwxEp0Q=
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr41817813wmh.129.1563470370344; 
 Thu, 18 Jul 2019 10:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
In-Reply-To: <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 11:18:53 -0600
X-Gmail-Original-Message-ID: <CABfawhkQdRqC1fBd2BBgUrfiy2LighirOjVWzs4VXg31-DvZng@mail.gmail.com>
Message-ID: <CABfawhkQdRqC1fBd2BBgUrfiy2LighirOjVWzs4VXg31-DvZng@mail.gmail.com>
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

PiAgICAtIExpbmUgMjg5OiBGaWxlcyBpbXBvcnRlZCBmcm9tIExpbnV4IHNob3VsZCBub3QgYmUg
dG91Y2ggaGVyZS4KClRoaXMgaXMganVzdCBhIHJhdyBkdW1wIG9mIHdoYXQgaGFwcGVucyBpZiBJ
IHJ1biBhc3R5bGUgb24gYWxsIHNvdXJjZQphbmQgaGVhZGVyIGZpbGVzLiBPYnZpb3VzbHkgSSB3
b24ndCBhdHRlbXB0IHRvIHVwc3RyZWFtIGFsbCB0aGVzZQpjaGFuZ2VzIHlvdSBzZWUgaW4gdGhl
IGdpc3QuIFJlc3BlY3RpdmUgbWFpbnRhaW5lcnMgYXJlIHdlbGNvbWUgdG8gdXNlCnRoZSB0b29s
IGlmIHRoZXkgZmluZCB2YWx1ZSBpbiBpdC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
