Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A6A28CB32
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 11:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6137.16147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSGx1-0007Xn-Cu; Tue, 13 Oct 2020 09:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6137.16147; Tue, 13 Oct 2020 09:50:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSGx1-0007XQ-9e; Tue, 13 Oct 2020 09:50:35 +0000
Received: by outflank-mailman (input) for mailman id 6137;
 Tue, 13 Oct 2020 09:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7Gs=DU=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kSGwz-0007XL-SO
 for xen-devel@lists.xen.org; Tue, 13 Oct 2020 09:50:33 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0de1c894-d0f1-4dcb-93ab-d6f7ad329001;
 Tue, 13 Oct 2020 09:50:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id b8so10004805wrn.0
 for <xen-devel@lists.xen.org>; Tue, 13 Oct 2020 02:50:32 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id t124sm27717735wmg.31.2020.10.13.02.50.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Oct 2020 02:50:31 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=J7Gs=DU=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kSGwz-0007XL-SO
	for xen-devel@lists.xen.org; Tue, 13 Oct 2020 09:50:33 +0000
X-Inumbo-ID: 0de1c894-d0f1-4dcb-93ab-d6f7ad329001
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0de1c894-d0f1-4dcb-93ab-d6f7ad329001;
	Tue, 13 Oct 2020 09:50:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id b8so10004805wrn.0
        for <xen-devel@lists.xen.org>; Tue, 13 Oct 2020 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=rukc4O6BWhhiRJWFSR0WSL5dfYldZYGmLkmWRIlbsRA=;
        b=twLPNP0SSfNVVM+VX7KuHbtc2oPtMdERSPRax91RG8eO5h4yf/Nskn5mIWy/OIWnRh
         5O+0u303zr/dXnSoIul22NkE7LxQATr1LqGmK/D7osO7gxJ/CWMsmwr0rYEqGlbbAHCY
         eX5qJY5HibyJIvt1a3XaKixfgggfhISYY9OTphfYv8SIHC+U2wCqUBWtoO1a2JYW4dni
         LVGqGy5fTEFCrNPSEvVou8dy3PejJ1vrFe2I/VDOHhJuP5l+LmIifiqTindu5aIGMRzr
         Uuphv/ungBrFZeCk1Mbq6Vq509BctPm2Fpa5S3c6AjEt22q+Jw2DSZiiksB+YZkV6uwA
         oHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=rukc4O6BWhhiRJWFSR0WSL5dfYldZYGmLkmWRIlbsRA=;
        b=BaEKJ/cfEVNMiKXgketCMHdf8QJo2kPa684QsNtmrhE9ckrEpBOgBVbqHpOBdNewUo
         CIYNhpSuR2Nv5DfPErh+h2BaxiAMunE8ieigPjpY99+/UYwJFe6r7wGMSEtAYAfviNfB
         OfEttJABBkki1vNHeN0EV4O186iKYkiRmkBCXLoJQku4+Qxj2wwBpzsetCbT8DCHWo6H
         ssYO/CfB44ouCKtKX969t/4j5A11cTRwsl+gtl6Td+8AHvINiC8N678r9bJo1devlAvt
         rRRC17huN6LCd+z0Gh1aM8gVzxSil6ApznllqACzfPjB1VcN4RNqtVcrUt9WFiLARChl
         gv9w==
X-Gm-Message-State: AOAM5321grnDItWxL43NsWcTDrZK+hTYElseLsc9LdJT36TVaDkA/UPe
	vE1sd4wPUjrv08/RAvHl3Jc=
X-Google-Smtp-Source: ABdhPJx9bzXYCNb8lC+HyMSDkZl8ZGHTaJ4auYOiFjy1chHk6eX/HbSb3UPev9K9ERTM4+pVcjdGaQ==
X-Received: by 2002:a05:6000:110f:: with SMTP id z15mr33251472wrw.87.1602582631708;
        Tue, 13 Oct 2020 02:50:31 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id t124sm27717735wmg.31.2020.10.13.02.50.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2020 02:50:31 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Don Slutz'" <don.slutz@gmail.com>,
	<xen-devel@lists.xen.org>,
	"'Boris Ostrovsky'" <boris.ostrovsky@oracle.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Tim Deegan'" <tim@xen.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Konrad Rzeszutek Wilk'" <konrad.wilk@oracle.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>
References: <cover.1597854907.git.don.slutz@gmail.com> <bfe0b9bb7b283657bc33edb7c4b425930564ca46.1597854908.git.don.slutz@gmail.com> <e7581f3a-71eb-3181-9128-01e22653a47e@suse.com> <000901d69bb8$941489b0$bc3d9d10$@xen.org> <8bf54ee4-2379-f3eb-57a4-ee572978d219@suse.com>
In-Reply-To: <8bf54ee4-2379-f3eb-57a4-ee572978d219@suse.com>
Subject: RE: [XEN PATCH v14 7/8] Add IOREQ_TYPE_VMWARE_PORT
Date: Tue, 13 Oct 2020 10:50:29 +0100
Message-ID: <005b01d6a146$49b79900$dd26cb00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQE3EbIOCgkLUtOBXNlfcF4M3GLQwwHXOsu5AXIpxzoCBV3QmgKqbpWKqpSetoA=

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 13 October 2020 10:38
> To: paul@xen.org
> Cc: 'Don Slutz' <don.slutz@gmail.com>; xen-devel@lists.xen.org; 'Boris =
Ostrovsky'
> <boris.ostrovsky@oracle.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Jun =
Nakajima'
> <jun.nakajima@intel.com>; 'Kevin Tian' <kevin.tian@intel.com>; =
'Stefano Stabellini'
> <sstabellini@kernel.org>; 'Tim Deegan' <tim@xen.org>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>;
> 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>; 'George Dunlap' =
<George.Dunlap@eu.citrix.com>
> Subject: Re: [XEN PATCH v14 7/8] Add IOREQ_TYPE_VMWARE_PORT
>=20
> On 06.10.2020 10:13, Paul Durrant wrote:
> >
> >
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 01 October 2020 15:42
> >> To: Don Slutz <don.slutz@gmail.com>
> >> Cc: xen-devel@lists.xen.org; Boris Ostrovsky =
<boris.ostrovsky@oracle.com>; Ian Jackson
> >> <iwj@xenproject.org>; Jun Nakajima <jun.nakajima@intel.com>; Kevin =
Tian <kevin.tian@intel.com>;
> >> Stefano Stabellini <sstabellini@kernel.org>; Tim Deegan =
<tim@xen.org>; Andrew Cooper
> >> <andrew.cooper3@citrix.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; George Dunlap
> >> <George.Dunlap@eu.citrix.com>; Paul Durrant <paul@xen.org>
> >> Subject: Re: [XEN PATCH v14 7/8] Add IOREQ_TYPE_VMWARE_PORT
> >>
> >> On 19.08.2020 18:52, Don Slutz wrote:
> >>> This adds synchronization of the 6 vcpu registers (only 32bits of
> >>> them) that QEMU's vmport.c and vmmouse.c needs between Xen and =
QEMU.
> >>> This is how VMware defined the use of these registers.
> >>>
> >>> This is to avoid a 2nd and 3rd exchange between QEMU and Xen to
> >>> fetch and put these 6 vcpu registers used by the code in QEMU's
> >>> vmport.c and vmmouse.c
> >>
> >> I'm unconvinced this warrants a new ioreq type, and all the =
overhead
> >> associated with it. I'd be curious to know what Paul or the qemu
> >> folks think here.
> >>
> >
> > The current shared ioreq_t does appear have enough space to =
accommodate 6 32-bit registers (in the
> addr, data, count and size) fields co couldn't the new =
IOREQ_TYPE_VMWARE_PORT type be dealt with by
> simply unioning the regs with these fields? That avoids the need for a =
whole new shared page.
>=20
> Hmm, yes, good point. But this is assuming we're going to be fine with
> using 32-bit registers now and going forward. Personally I'd prefer a
> mechanism less constrained by the specific needs of the current VMware
> interface, i.e. potentially allowing to scale to 64-bit registers as
> well as any of the remaining 9 ones (leaving aside %rsp).
>=20

I think that should probably be additional work, not needed for this =
series. We could look to expand and re-structure the ioreq_t structure =
with some headroom. An emulator aware of the new structure to resource =
map a different set of shared pages.

  Paul

> Jan



