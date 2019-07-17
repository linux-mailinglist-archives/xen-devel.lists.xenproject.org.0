Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AAA6BC83
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 14:41:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnjDL-0002OZ-VH; Wed, 17 Jul 2019 12:39:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5amf=VO=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hnjDK-0002OT-Vq
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 12:39:19 +0000
X-Inumbo-ID: e47dbba0-a88f-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e47dbba0-a88f-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 12:39:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563367158; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=o4GzP1RBoy7zKviCXYOAuiZ3k5rHWnNhM6MLek+0vBc=;
 b=sd/ep71rt2QilW6HynMIKqsaH0IU1N2DE7J1Z7CbTE0jPQeTj/3Qpkcwa+QrUBoZF5BJjbHH
 5scG1FijsWoCOXBV9xATn1AJ/bYMsk3ulKUWvAf6n3bZmMKuCCl+v07oDa2ZL36Sj1/LGB5e
 mzKJyoMF/nkS+bRtr8NT/WrKRvk=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mxa.mailgun.org with ESMTP id 5d2f16ef.7fe9c74761b0-smtp-out-n01;
 Wed, 17 Jul 2019 12:39:11 -0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g67so17895014wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2019 05:39:11 -0700 (PDT)
X-Gm-Message-State: APjAAAXpMaxb2SnB7Faj38fPnLwvgyuz/3E8Z7aNRd4qgD/1Fe+hJDD5
 ykbaTbicuznimXwfKR6U8JCwx7A2haRgl1KAkjI=
X-Google-Smtp-Source: APXvYqy3uOxghrXYCOno7ZQwIEw0v0rBBsWxtLDicmubhTqq83uIRiFp/LT6KLkcLtZ1HbODhM5bpMPbAZLwuaQPD/g=
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr36763623wmj.128.1563367150297; 
 Wed, 17 Jul 2019 05:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
In-Reply-To: <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 17 Jul 2019 06:38:33 -0600
X-Gmail-Original-Message-ID: <CABfawhkbVuBOYX2zcgFoompsR8YGv51nR3SrUoxEqL0SBjeejQ@mail.gmail.com>
Message-ID: <CABfawhkbVuBOYX2zcgFoompsR8YGv51nR3SrUoxEqL0SBjeejQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBJJ3ZlIG9taXR0ZWQgYWxsIHN0eWxlIGNvbW1lbnRzIChmb3JtYXR0aW5nLCBwbGFpbiB2cyB1
bnNpZ25lZCBpbnQKPiBldGMpIC0gSSdkIGxpa2UgdG8gbGVhdmUgdGhhdCB0byB0aGUgVk0gZXZl
bnQgbWFpbnRhaW5lcnMuCgpEbyB3ZSBoYXZlIGFuIGF1dG9tYXRlZCB3YXkgdG8gY2hlY2sgZm9y
IHN0eWxlIGlzc3VlcywgbGlrZSBhc3R5bGU/IEluCm15IHByb2plY3RzIEkgaW50ZWdyYXRlIHRo
YXQgaW50byBteSBUcmF2aXMgY2hlY2tzIHNvIEkgZG9uJ3QgaGF2ZSB0bwpkbyB0aGF0IG1hbnVh
bGx5IChzZWUKaHR0cHM6Ly9naXRodWIuY29tL3RrbGVuZ3llbC9kcmFrdnVmL2Jsb2IvbWFzdGVy
Ly50cmF2aXMueW1sI0wyOCkuCkNoZWNraW5nIGZvciB0aGF0IGtpbmQtb2Ygc3R1ZmYgbWFudWFs
bHkgaXMgZmFyIGZyb20gaWRlYWwuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
