Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80071538D5C
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 11:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339318.564158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxjU-0007lU-Pj; Tue, 31 May 2022 09:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339318.564158; Tue, 31 May 2022 09:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxjU-0007kW-MK; Tue, 31 May 2022 09:00:08 +0000
Received: by outflank-mailman (input) for mailman id 339318;
 Tue, 31 May 2022 09:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfOh=WH=gmail.com=xiexun162534@srs-se1.protection.inumbo.net>)
 id 1nvxjT-0007kP-5q
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 09:00:07 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b3e9a3-e0c0-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 11:00:06 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id j10so20288166lfe.12
 for <xen-devel@lists.xenproject.org>; Tue, 31 May 2022 02:00:06 -0700 (PDT)
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
X-Inumbo-ID: 10b3e9a3-e0c0-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xn241K/WzSuVszlXSeXsZNWKauUQmaANW/CPCHgDjaA=;
        b=I9ioFXkH6MqeWIQyuvvtsUJSE2RMM9LL3+SoyTmAnNPZdD35SZcdzInnnTHdvYGihh
         q4gDqzrTFON6HmACP0FRVF3ajwvssfcqmZo4qqurFGNFbUkIhzu6SDrmWfSzs4qZdL+J
         yfld1NEtwMe+MmPCanKaOzvMlWrg3ul9LANu5yeDiUgSEJkxTebvhWdp+QBYKLKNHI+t
         iBud6NrohGBFBcSSgfsgHqzvPnRL5jJChNGdJep6FCgcjkxyH3X4gJ0KJcNECEvqwcJO
         FOeMfXm2EVA7nJiEIMrn+ESCZkbXJxlZlCF9jzoEe4rW0C4DgxVE99vl/lxVdFt7gEUh
         QDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xn241K/WzSuVszlXSeXsZNWKauUQmaANW/CPCHgDjaA=;
        b=vJ5AaLN8ae3QO16AeAzX+kOsBzKOXceE0CGoDRDHCOlZGtd8LeYbmyLPk9TNiMaT3z
         zurBKVzP9Q+on9UBGsvBS8dY5aOlPz7OUh0E2v+ZttXKM23YsLEhN/392dFsF9uGS+XP
         pr7fa+N/1h4m1BjKaq+/eWPRNySZ1drhyfeVPISR/7A+JxsMxqtJd3BbxCmOQqUDG19K
         CsCvYt6NH/pqGH4U7khD/TrQMX1D4VkE/yo9U3+Zu1Wp0xPahQN721UHuvpCQODXqETp
         GEjkLIijRxcxqOIRU2hmm/BC60/OSojecqOqFZ29C2zVRPDgReZB2NJXYZQikoA+7ZfM
         fHMw==
X-Gm-Message-State: AOAM530/wXNUwYEBVFWaAd2XhFO8KlTHj7BtOItWqH0Y0rPcqh0xOlKp
	6OJKgiGkLpuIzQdHflmf6DjONBaC4pd0+ZuxO3Q=
X-Google-Smtp-Source: ABdhPJwIW/uQxYLqLH+1KGOhSAO2rLxzaNU5jCVrikbRAIQr+7P6DW7lIPZZcYlcRCWEnaHE+lltYUJjchlPv+sIYRM=
X-Received: by 2002:a05:6512:3401:b0:473:ce5f:7945 with SMTP id
 i1-20020a056512340100b00473ce5f7945mr42054983lfr.636.1653987605663; Tue, 31
 May 2022 02:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653977696.git.xiexun162534@gmail.com> <ab42b2b2309874e5c3a42ce04e2f94e4409284a7.1653977696.git.xiexun162534@gmail.com>
 <55710c63-c531-3330-786d-ec6349690311@suse.com>
In-Reply-To: <55710c63-c531-3330-786d-ec6349690311@suse.com>
From: Xie Xun <xiexun162534@gmail.com>
Date: Tue, 31 May 2022 16:59:52 +0800
Message-ID: <CAGJ6h0XF66R9540f9e7riaDM3OKtLh96zNA-OKrgW5uVSLkOuw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/6] xen/riscv: Add sbi.c, sbi.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Tue, 31 May 2022 at 15:54, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 31.05.2022 08:57, Xie Xun wrote:
> > Signed-off-by: Xie Xun <xiexun162534@gmail.com>
>
> Is this correct / complete, considering ....

Thank you for pointing out this problem.

I have read the submitting guide
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Signed-off-by

and it says that signed-off-by indicates I certify the patch under the
"Developer's
Certificate of Origins".
And in the "Developer's Certificate of Origins":
        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or

Because Xvisor is also distributed under GPL, i think it will be
correct if it is
signed-off-by Bobby. The problem is that I did not modify this part of the code,
so I want to know how to submit this patch in a correct way?

Thank you for replying.



>
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/sbi.h
> > @@ -0,0 +1,275 @@
> > +/**
> > + * Copyright (c) 2021 Vates SAS.
> > + *
> > + * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
>
> ... this?
>
> Jan
>

