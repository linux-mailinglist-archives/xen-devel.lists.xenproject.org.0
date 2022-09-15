Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4D95B91DF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 02:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407168.649572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYcxn-0002yz-5k; Thu, 15 Sep 2022 00:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407168.649572; Thu, 15 Sep 2022 00:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYcxn-0002vo-35; Thu, 15 Sep 2022 00:42:43 +0000
Received: by outflank-mailman (input) for mailman id 407168;
 Thu, 15 Sep 2022 00:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaaQ=ZS=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1oYcxl-0002vf-89
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 00:42:41 +0000
Received: from MTA-10-4.privateemail.com (mta-10-4.privateemail.com
 [198.54.122.149]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b4a3b18-348f-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 02:42:38 +0200 (CEST)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
 by mta-10.privateemail.com (Postfix) with ESMTP id CB2FD18000A1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Sep 2022 20:42:35 -0400 (EDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mta-10.privateemail.com (Postfix) with ESMTPA id A7548180009F
 for <xen-devel@lists.xenproject.org>; Wed, 14 Sep 2022 20:42:35 -0400 (EDT)
Received: by mail-yb1-f176.google.com with SMTP id 198so20272114ybc.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Sep 2022 17:42:35 -0700 (PDT)
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
X-Inumbo-ID: 4b4a3b18-348f-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1663202555;
	bh=6c+E15qTNQYC/Wgk4Qqg+ltDuo8IcNO92o6suwDssqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WJO+a/esGO7vZmjH9rkz+x+c3WXgVGPUwpkE+Q+8lHkMww+ox8GehLac0SBzPlWQu
	 FwDFlsxzx+igUrWMr3kwDznmIkBLjwxWYLz9KROUo5vKWKHQiOKzti0ygciYTFIIBa
	 2vOvlgdjv+R83rsYHJG0l1mwb86iYFaLZyhx4B+7R6Xqw4HJvWl3gfTOJrP193cdKy
	 DFvlk1qfcaVcXWNiHEuMvPS3AUsr1bwXCiX3hLXoJYhgJIvU96AjMjByEmo5Es8Dj8
	 iSzhhTqWamEKm+u4F6WqJSTiFitGHmMQZr1iJ/OeKr6OMnAZWd4Dtz+g12VKWAOZTQ
	 6lfCvHJ93mi8A==
X-Gm-Message-State: ACgBeo0mnwQAr/HaqQLk4uq/XThKxvX9UxyxnzuMJjeL5IOGaguuWzqg
	CpdxTZWHtJnnbRb68ch1YT6oIGRcasshDu8Q0gU=
X-Google-Smtp-Source: AA6agR6vNdfJmyrGtXQMpdHUrYYtj4+Ij8hZ6HdUfxbXI17jGnYNIJxWqfW62UGGAmoUVRm6hN6dv8FYjII3Pc8rjus=
X-Received: by 2002:a25:42d7:0:b0:6ae:ae83:59c0 with SMTP id
 p206-20020a2542d7000000b006aeae8359c0mr18860776yba.165.1663202554967; Wed, 14
 Sep 2022 17:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl>
In-Reply-To: <YyJOWDWYVpShtAU9@mail-itl>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 14 Sep 2022 20:41:59 -0400
X-Gmail-Original-Message-ID: <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
Message-ID: <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
Subject: Re: Console output stops on dbgp=xhci
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

> > Do you have any idea what might be going on and preventing the output
> > from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
> > present on the receiving side, just nothing is being received over it.
>
> There are few more patches in the series that are de facto required.
> Especially those about IOMMU, otherwise it can only possibly work with
> iommu=0 (which I'm not sure if even is enough).

Unfortunately with iommu=0 Xen doesn't boot at all for me. I see this
on the console:

(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=0011]
(XEN) Faulting linear address: 00000000328b3a54

Not sure what's up with that. Either way, can you post a git branch
with the remaining patches that are not yet merged in master? Want to
check if those patches resolve the issue.

Thanks,
Tamas

