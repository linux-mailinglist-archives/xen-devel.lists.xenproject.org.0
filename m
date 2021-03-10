Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479793349C1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 22:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96308.182070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK6BU-0000pu-Rq; Wed, 10 Mar 2021 21:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96308.182070; Wed, 10 Mar 2021 21:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK6BU-0000pV-Nz; Wed, 10 Mar 2021 21:16:00 +0000
Received: by outflank-mailman (input) for mailman id 96308;
 Wed, 10 Mar 2021 21:15:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ig2C=II=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lK6BT-0000pQ-50
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 21:15:59 +0000
Received: from mail-qt1-x833.google.com (unknown [2607:f8b0:4864:20::833])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e60e7937-3016-49df-bc37-8dee613b6781;
 Wed, 10 Mar 2021 21:15:58 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id n26so5024073qtv.8
 for <xen-devel@lists.xenproject.org>; Wed, 10 Mar 2021 13:15:58 -0800 (PST)
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
X-Inumbo-ID: e60e7937-3016-49df-bc37-8dee613b6781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=9+waY9//i7aB7OCxxc58Mb5VgSwZAqQcRVQSVN1WFl0=;
        b=ch/ieljRNbjVMXTf65xR/pUCJAxjgWagarsfT5k4yq79eacuhr3d0Bfb9Tg6KxnuPJ
         hN1kClvaaku9tH1Mj09evdcxERTBiRVYiN7Jg2WFO0o9ajmor6keAxPHFrL6WcoGy1ye
         CIizxB3EBi1tDEbjLVg+2fdsGjEMI4Rcko7gSpxZffigl8KUXrYYdXCI3zXmdk+NmRFz
         ++MArghp3vnRXGrukcvGLYs7sRaZAJdEUIiQpHnP8DjMdOYIEx3ukwVfZkVWrP0UWeyu
         SQAbzzjWZ+2w6FTtIbmUkyBCpBydK9TauoGXJNrITwrNRVa53HlV8Cu1/3t2lrUBJS0B
         Jtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=9+waY9//i7aB7OCxxc58Mb5VgSwZAqQcRVQSVN1WFl0=;
        b=qq8/tWqVb66mirN3FXCHn4gxt9SwBDyULrHuSVNz5PLnGn0L3dF2YaUZQ47mPHVPYZ
         OfruVi3NaBtExj5ftvgZLRk5YF/oLNeyKBG2OxV6KGs35S+zTJtpd9/JKHV3+/elaBOg
         0Pc2bIMEi8PJBK1kgSQjJa4KUMwanH252YprabamQOUF3+WqXVUozprwZAR33OH/OJGD
         iOVUbW7UfnXzLejkLfC6yUprWaMH9tj/Lebku1kyA/248OWBj5bnPk7lGOM44IuLoShE
         /CmY7bTzKWELGjfPqzIIpWb5PAAHbWonSIGt4zCqK79ckuYvKPiyK2bVXWOaoRtMsrnv
         KBnw==
X-Gm-Message-State: AOAM532tqh8c7CADmauDwqnGkKWm0FfNBsxcHfpwEFYB/gpRfjTMEVYR
	RybI8VU+PR5Yo1Q1X2p++pJ76TRHKCDNR9tkbrBGeL5fMW32zZqJ
X-Google-Smtp-Source: ABdhPJwOzVz2Pty8qCzHwZ12CczBmmV6KORnOyD+JqoyKjFOMGJ11P2wY2S3v9XQYk72vo1gKVS6kTI6PpmG2yYIGg0=
X-Received: by 2002:ac8:1403:: with SMTP id k3mr4703702qtj.266.1615410957845;
 Wed, 10 Mar 2021 13:15:57 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 10 Mar 2021 13:15:46 -0800
Message-ID: <CAMmSBy-iwV86QB+P4OCDgevx9MND0NzwBECUVqavT6cF+bvrcA@mail.gmail.com>
Subject: Xen 4.14 build failing on aarch64 with GCC 10.2.1
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="UTF-8"

Hi!

just came across this failure on aarch64:

ld: prelink.o: in function `_spin_lock_cb':
19187(.text+0x1f26c): undefined reference to `__aarch64_ldadd4_acq_rel'
19188ld: prelink.o: in function `_spin_lock':
19189(.text+0x1f2ec): undefined reference to `__aarch64_ldadd4_acq_rel'
19190ld: prelink.o: in function `_spin_lock_irq':
19191(.text+0x1f35c): undefined reference to `__aarch64_ldadd4_acq_rel'
19192ld: prelink.o: in function `_spin_lock_irqsave':
19193(.text+0x1f3d4): undefined reference to `__aarch64_ldadd4_acq_rel'
19194ld: prelink.o: in function `_spin_lock_recursive':
19195(.text+0x1f6b0): undefined reference to `__aarch64_ldadd4_acq_rel'

This, of course, goes away if I build Xen with:
   CFLAGS=-mno-outline-atomics

However, at this point I'm curious if this is going to get addressed in Xen
proper or not.

Thanks,
Roman.

