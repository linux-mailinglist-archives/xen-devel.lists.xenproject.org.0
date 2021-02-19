Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E5631FCDD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86962.163700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8OB-00074x-3J; Fri, 19 Feb 2021 16:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86962.163700; Fri, 19 Feb 2021 16:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8OA-00074Y-W4; Fri, 19 Feb 2021 16:12:18 +0000
Received: by outflank-mailman (input) for mailman id 86962;
 Fri, 19 Feb 2021 16:10:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/VLz=HV=gmail.com=kevinnegy@srs-us1.protection.inumbo.net>)
 id 1lD8MY-00071h-08
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:10:38 +0000
Received: from mail-ot1-x32f.google.com (unknown [2607:f8b0:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 152974fb-6c79-4267-8752-4bcdc551d0b5;
 Fri, 19 Feb 2021 16:10:37 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id q4so5521347otm.9
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 08:10:37 -0800 (PST)
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
X-Inumbo-ID: 152974fb-6c79-4267-8752-4bcdc551d0b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=v7MkuIaxgQ1ml4ate7F2T/nEuIWneFQOQs/Dm6gkCfw=;
        b=lf9NBKI9DxnzQEiCcAdaAPYWqEt77bmkca/HJc8mT2PIqqY4AvS0zciEhEXubfrpHN
         nGovZXcOAZeIeP0zD4Y9Ceuoq8jNwX71a+pt+TWmb45G6EQczHmjZvk3cn28MoI/V3sX
         bTGHCGxA9gA6+4KNta0IRv5nAMJ+xi/MU+H/QFc3Fj4thgO1G3CYG2xcLbdNgk/d1qyL
         4HFhFJVH/g4c8ij1tV9rTSgsOP/OI/PFkUWut5vcYF2w9UJd9pKIrZTH5bl/eYRz4QkR
         eq8FSugWI/nd/Qi02d4m9IrS7iazp8F9pDL6oQuye3jnS1iYBk3U2LQQk1fcO1yVaSKF
         wkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=v7MkuIaxgQ1ml4ate7F2T/nEuIWneFQOQs/Dm6gkCfw=;
        b=DfuiwqIKB9XMgIkNgac9aK3punj+Pjdt/HfESU/a3sAaM9Fcr1PdmJARje2U2Suurz
         Enurzjgl8GYwUg7OA/iJm1n3mOd/oiQbBwpLCLjT5l+hdFdK3xomGsERNgdJo+XW6Dfb
         yJJoKe5NJnD5v5HidHl61rueQM0kaC/PS9jy1nYXsTdP/Ni2OphuFf+wl9E42fFOJIX/
         e8/7h+Du7dNhwsEg4xo+ePYp/arZkmGH1F4aA1XhbS/LvxoSB3a9GnYX+3DoeWwROfdN
         KD/vwvCZ8UOV6gm1FIuahhFT25SIJYwNUeQVpuC50w339hfl3v6r6Qb8NJNh5r/u6Rn1
         QKiQ==
X-Gm-Message-State: AOAM530g98D5+NkavZvQCP3DAL73G30yqVhtqnqW1nBha5jiUB31aeW4
	HQDzkudln8REjNTmX3KWstcKBEJ1Luzp6nTDz206OAPQwQ==
X-Google-Smtp-Source: ABdhPJwOoeGr8acsF+dBNLbmaVXbY2yvyZys9FcN7wdThmiDFwKSF3BX35N2v72curU1KzeZIGdoKAXdzPp97aB5Ovw=
X-Received: by 2002:a9d:d87:: with SMTP id 7mr7559451ots.256.1613751036403;
 Fri, 19 Feb 2021 08:10:36 -0800 (PST)
MIME-Version: 1.0
From: Kevin Negy <kevinnegy@gmail.com>
Date: Fri, 19 Feb 2021 11:10:00 -0500
Message-ID: <CACZWC-qK_biKgyi+ZiXnsHRscAbK9pz=kncdBA25QYWY129HCQ@mail.gmail.com>
Subject: How does shadow page table work during migration?
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000047e49b05bbb2b138"

--00000000000047e49b05bbb2b138
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm trying to understand how the shadow page table works in Xen,
specifically during live migration. My understanding is that after shadow
paging is enabled (sh_enable_log_dirty() in
xen/arch/x86/mm/shadow/common.c), a shadow page table is created, which is
a complete copy of the current guest page table. Then the CR3 register is
switched to use this shadow page table as the active table while the guest
page table is stored elsewhere. The guest page table itself (and not the
individual entries in the page table) is marked as read only so that any
guest memory access that requires the page table will result in a page
fault. These page faults happen and are trapped to the Xen hypervisor. Xen
will then update the shadow page table to match what the guest sees on its
page tables.

Is this understanding correct?

If so, here is where I get confused. During the migration pre-copy phase,
each pre-copy iteration reads the dirty bitmap (paging_log_dirty_op() in
xen/arch/x86/mm/paging.c) and cleans it. This process seems to destroy all
the shadow page tables of the domain with the call to shadow_blow_tables()
in sh_clean_dirty_bitmap().

How is the dirty bitmap related to shadow page tables? Why destroy the
entire shadow page table if it is the only legitimate page table in CR3 for
the domain?

Thank you,
Kevin

--00000000000047e49b05bbb2b138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m trying to understand how=
 the shadow page table works in Xen, specifically during live migration. My=
 understanding is that after shadow paging is enabled (sh_enable_log_dirty(=
) in xen/arch/x86/mm/shadow/common.c), a shadow page table is created, whic=
h is a complete copy of the current guest page table. Then the CR3 register=
 is switched to use this shadow page table as the active table while the gu=
est page table is stored elsewhere. The guest page table itself (and not th=
e individual entries in the page table) is marked as read only so that any =
guest memory access that requires the page table will result in a page faul=
t. These page faults happen and are trapped to the Xen hypervisor. Xen will=
 then update the shadow page table to match what the guest sees on its page=
 tables. <br><br>Is this understanding correct? <br><br>If so, here is wher=
e I get confused. During the migration pre-copy phase, each pre-copy iterat=
ion reads the dirty bitmap (paging_log_dirty_op() in xen/arch/x86/mm/paging=
.c) and cleans it. This process seems to destroy all the shadow page tables=
 of the domain with the call to shadow_blow_tables() in sh_clean_dirty_bitm=
ap(). <br><br>How is the dirty bitmap related to shadow page tables? Why de=
stroy the entire shadow page table if it is the only legitimate page table =
in CR3 for the domain?=C2=A0<br></div><div><br></div><div>Thank you,</div><=
div>Kevin</div></div>

--00000000000047e49b05bbb2b138--

