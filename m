Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532A136097
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 17:56:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYYFM-0007HO-8U; Wed, 05 Jun 2019 15:54:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dbI4=UE=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hYYFK-0007HF-Pf
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 15:54:38 +0000
X-Inumbo-ID: 37e72ec2-87aa-11e9-867f-233819fb90bf
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37e72ec2-87aa-11e9-867f-233819fb90bf;
 Wed, 05 Jun 2019 15:54:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559750076; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Gn1CBnWnBwIAFSY1IHwVHtgGixO+x0ZIf+JN3Y2vyCM=;
 b=UxCPdsPYKwzMonKkblKFQHjw+iUCdswfGMhc0uRrRvXiNdWYdAbK5QE+/fo1NPQX7gDLEQIA
 v6UE9fxKukIe03YmYfChkKb6zBCoCMsT8Ppb7SYAURxrUDPyfTpsemQLBY76/Yrcx9/DO0Wp
 GElwLRdVOCmZx4EBg98TQ1+WXEM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mxa.mailgun.org with ESMTP id 5cf7e5bb.7fa79e0a6330-smtp-out-n03;
 Wed, 05 Jun 2019 15:54:35 -0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id w9so2091596wmd.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2019 08:54:35 -0700 (PDT)
X-Gm-Message-State: APjAAAX6OHKRRl2h5/Aac409Q5Dc0mE1+TTx2t9gFLRtxPXQxkuVsUQr
 EGZHFZoHgEBwbCU3XJgscrKUo3I7bnTx9+6BuMw=
X-Google-Smtp-Source: APXvYqwVL9Y7CPGiREnKGkbahNtRyB7kTBKWIjTy8syAgCwI+SovCakK5n17DrtXhghe7o7VdYbUDf+isCO69AwY6ko=
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr3376846wmm.153.1559750074683; 
 Wed, 05 Jun 2019 08:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <d50c5737dcff7f3225fe507322bb10d104a6e6b4.1559224640.git.ppircalabu@bitdefender.com>
In-Reply-To: <d50c5737dcff7f3225fe507322bb10d104a6e6b4.1559224640.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 5 Jun 2019 09:53:57 -0600
X-Gmail-Original-Message-ID: <CABfawhmTEFKwdzwmw3O_ToCcJ=56K9tu=oVX3o2D4azEXb-Lgw@mail.gmail.com>
Message-ID: <CABfawhmTEFKwdzwmw3O_ToCcJ=56K9tu=oVX3o2D4azEXb-Lgw@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH 6/9] vm_event: Move struct vm_event_domain
 to vm_event.c
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgODoxOCBBTSBQZXRyZSBQaXJjYWxhYnUKPHBwaXJjYWxh
YnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IFRoZSB2bV9ldmVudF9kb21haW4gbWVtYmVy
cyBhcmUgbm90IGFjY2Vzc2VkIG91dHNpZGUgdm1fZXZlbnQuYyBzbyBpdCdzCj4gYmV0dGVyIHRv
IGhpZGUgZGUgaW1wbGVtZW50YXRpb24gZGV0YWlscy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBldHJl
IFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CgpBY2tlZC1ieTogVGFtYXMg
SyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
