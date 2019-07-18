Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854206D2F2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:41:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoAMq-0006SK-4a; Thu, 18 Jul 2019 17:38:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoAMo-0006SE-Mw
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:38:54 +0000
X-Inumbo-ID: e962efd5-a982-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e962efd5-a982-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 17:38:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563471533; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=MnxkelMiOoHB/nq/YRZs4/MXs+7UWUkgKtkJgPFLGBw=;
 b=R11uG+ofI54CrexeC9jlCNQXU4hhaV7X6d1XRqKtiUJsOEtJ64z83Z/P10sqjqj4rQ8bsyjR
 E1NazPJHvXzBPYuAIygABWvIaj7UwbMTRcIOpMvRx1MbYTTJ5Anea98u3jvU+vyh42D0L4T1
 Ox7hEM1mNcQU/suG8AQPPrZY6MY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5d30aeac.7f43b159fc70-smtp-out-n03;
 Thu, 18 Jul 2019 17:38:52 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id n4so29650000wrs.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 10:38:51 -0700 (PDT)
X-Gm-Message-State: APjAAAW1xW7y/jbAWHoQdHqR53hdJK/oykRmZ347uM5tjhDMI7HLicoc
 5K4rNgEQvQkrQmk40+lpKc3MvbGWEWSJKj7sxB4=
X-Google-Smtp-Source: APXvYqwjOOpcA30/J4+fCF/2WWnGSTUoEMHiWgNOssapKk/w8quIG0SSDDqaoIoNxYudV0nTI5vOZAgxAtGuFxyAS5Q=
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr49223714wro.60.1563471530431; 
 Thu, 18 Jul 2019 10:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
In-Reply-To: <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 11:38:13 -0600
X-Gmail-Original-Message-ID: <CABfawhm6gN-zanCJwg-gc8Bm1LZeD8JsQ52fzNXm4dc=PNf9AQ@mail.gmail.com>
Message-ID: <CABfawhm6gN-zanCJwg-gc8Bm1LZeD8JsQ52fzNXm4dc=PNf9AQ@mail.gmail.com>
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

PiAgICAtIExpbmUgODczNTogSXQgbG9va3MgbGlrZSB0byBtZSB0aGUgdG9vbHMgcG9saWN5IGlz
IHF1aXRlCj4gaW5jb25zaXN0ZW50LiBJbiBwcmV2aW91cyBwbGFjZSBpdCBrZWVwcyBpdCBwcm9w
ZXJseSBhbGlnbmVkIHNlZSBsaW5lIDU3NzcuCgpUaGlzIHdhcyBhbHNvIGR1ZSB0byBub3QgYWxs
b3dpbmcgaW5kZW50YXRpb24gdG8gYmUgbW9yZSB0aGVuIDQwCmNoYXJhY3RlcnMgdG8gdGhlIHJp
Z2h0LiBPdmVycmlkaW5nIG1heC1jb250aW51YXRpb24taW5kZW50IGxlYXZlcwp0aGVzZSBiZS4K
ClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
