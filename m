Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EE86D2DA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 19:36:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoAHY-000693-Sg; Thu, 18 Jul 2019 17:33:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoAHX-00068y-GE
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 17:33:27 +0000
X-Inumbo-ID: 26299d24-a982-11e9-b97a-4fc66a332745
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26299d24-a982-11e9-b97a-4fc66a332745;
 Thu, 18 Jul 2019 17:33:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563471206; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=9Iani5JmavjBI0JbdCTvX8RPBsgG6+lh/1ieeV93pLk=;
 b=lProtKbNRWIIYSnCTEHVDWllm4B7oQiVV0Y5TqPQw3fdzu/hU8CAQ+k4E6GXixu+R5krM/s+
 wuUjxaoa1dMkZKNz0thknNil0lrfygXAF8t7r4CD/YuZ8E5px7SLnU7dSjJcNoj0Zf6q6fI4
 WcFSr8nOmGcMT1RStmDWHoAsshA=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mxa.mailgun.org with ESMTP id 5d30ad65.7f906890e9f0-smtp-out-n01;
 Thu, 18 Jul 2019 17:33:25 -0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id u25so16148919wmc.4
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 10:33:25 -0700 (PDT)
X-Gm-Message-State: APjAAAU1tE+I/Zv5F+Nggn+8Q8J7KOxO6I9V5BOPfprFAg3dkc7Aqbq+
 FnInPAY30dGuNLckUTiJeTqFs60myMEMs1fqE1c=
X-Google-Smtp-Source: APXvYqyhircymAuA4D1dR4tm0AS9hdz28fwUebNNwJkxyfdvJeMe4g5y/XietPgB0DR4yyyYs8wtwzOt6Xr/oyMz8os=
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr41852219wmh.129.1563471204371; 
 Thu, 18 Jul 2019 10:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
In-Reply-To: <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 11:32:47 -0600
X-Gmail-Original-Message-ID: <CABfawh=GjRwraOsEG2Bauj34GKz4BZ_GKEhgJK6NfqsNdEG1dg@mail.gmail.com>
Message-ID: <CABfawh=GjRwraOsEG2Bauj34GKz4BZ_GKEhgJK6NfqsNdEG1dg@mail.gmail.com>
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

PiAgICAtIExpbmUgNTg6IFRoaXMgaXMgZmFpcmx5IGNvbW1vbiB0byBpbmRlbnQgdGhlIHBhcmFt
ZXRlcnMgYXMgaXQgaXMKPiB0b2RheS4gQnV0IHRoZW4gb24gbGluZSAxNTgvMjcyIGl0IGluZGVu
dHMgYXMgd2UgZG8gdG9kYXkuIFNvIEkgYW0gbm90Cj4gc3VyZSB3aGF0IHRoZSBleHBlY3RlZCBj
b2Rpbmcgc3R5bGUgZnJvbSB0aGUgdG9vbHMuCgpUaGlzIHdhcyBkdWUgdG8gdGhlIHRvb2wgbm90
IGFsbG93aW5nIGluZGVudGF0aW9uIHRvIGJlIGZ1cnRoZXIgdG8gdGhlCnJpZ2h0IHRoZW4gNDAg
Y2hhcmFjdGVycy4gQ2FuIGJlIG1vZGlmaWVkIHdpdGgKbWF4LWNvbnRpbnVhdGlvbi1pbmRlbnQs
IHNvIGZvciBleGFtcGxlIG1heC1jb250aW51YXRpb24taW5kZW50PTc4Cih3aGljaCBpcyB0aGUg
bWF4IHRoYXQgd291bGQgbWFrZSBzZW5zZSBpbiB0aGUgZXh0cmVtZSkgbGVhdmVzIHRoZXNlCmNv
cnJlY3QgaW5kZW50YXRpb25zIHVudG91Y2hlZC4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
