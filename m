Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037A036098
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 17:56:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYYDl-000745-Qa; Wed, 05 Jun 2019 15:53:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dbI4=UE=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hYYDk-00073x-4Y
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 15:53:00 +0000
X-Inumbo-ID: fc1a5f4a-87a9-11e9-b3ca-1b42bddfeaca
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc1a5f4a-87a9-11e9-b3ca-1b42bddfeaca;
 Wed, 05 Jun 2019 15:52:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559749976; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=pdS2OBKRO0JSih2tzWAQQpV2WFirj1EKWY5Ore7Ezf4=;
 b=embXyCP8EEJY2AfrmNDVROwmnkZRxOPK4MCoHtKjJdGBcJbwCy99ZxQ8UueZfWmPmunmEGCW
 f0fHtd/QncXv4mP3MDJrrznliE/+CgacgKXO4FHzk5zKvBOFB+JqJhbMq6up8AZpJfWZiX/R
 O53MAsev4Okz/VLKY7izbd+EH+4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mxa.mailgun.org with ESMTP id 5cf7e556.7fe4e59495f0-smtp-out-n01;
 Wed, 05 Jun 2019 15:52:54 -0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id m3so4191851wrv.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2019 08:52:54 -0700 (PDT)
X-Gm-Message-State: APjAAAWhadpbh0eEv3+c6LM0o2StlEQcoDVvd0A21vc/J6JfQfokeGi+
 zjNXx0cxG8cpZlMNjZfMtgebkMCFnrRIeP7lW2M=
X-Google-Smtp-Source: APXvYqz3kk3K7eU4CAVYCDjN6uLDQjWMcTKDZwyLa8a3e4zUCP6PAKO699+k+q/gM0rQnQt3Q22b1FZ4ILYetP9pOMU=
X-Received: by 2002:adf:b64b:: with SMTP id i11mr25714053wre.205.1559749973706; 
 Wed, 05 Jun 2019 08:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <9e731967741fac6046a3a862964ac61ba7cababc.1559224640.git.ppircalabu@bitdefender.com>
In-Reply-To: <9e731967741fac6046a3a862964ac61ba7cababc.1559224640.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 5 Jun 2019 09:52:16 -0600
X-Gmail-Original-Message-ID: <CABfawhn4hEfgW=Pw+CR1Smfd5G_GzcV7jFxrDBP-tDK9pgPn8A@mail.gmail.com>
Message-ID: <CABfawhn4hEfgW=Pw+CR1Smfd5G_GzcV7jFxrDBP-tDK9pgPn8A@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH 4/9] vm_event: Remove "ring" suffix from
 vm_event_check_ring
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgODoxOCBBTSBQZXRyZSBQaXJjYWxhYnUKPHBwaXJjYWxh
YnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IERlY291cGxlIGltcGxlbWVudGF0aW9uIGZy
b20gaW50ZXJmYWNlIHRvIGFsbG93IHZtX2V2ZW50X2NoZWNrIHRvIGJlCj4gdXNlZCByZWdhcmRs
ZXNzIG9mIHRoZSB2bV9ldmVudCB1bmRlcmx5aW5nIGltcGxlbWVudGF0aW9uLgo+Cj4gU2lnbmVk
LW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KCkFj
a2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
