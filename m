Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA2345E42
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 13:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100668.191934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOgHL-0000QG-De; Tue, 23 Mar 2021 12:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100668.191934; Tue, 23 Mar 2021 12:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOgHL-0000Pr-9z; Tue, 23 Mar 2021 12:36:59 +0000
Received: by outflank-mailman (input) for mailman id 100668;
 Tue, 23 Mar 2021 12:36:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/Uj=IV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lOgHJ-0000Pl-2S
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 12:36:57 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed7ef406-b708-4c5d-9fa7-9ba7a610d106;
 Tue, 23 Mar 2021 12:36:56 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b4so2452504lfi.6
 for <xen-devel@lists.xenproject.org>; Tue, 23 Mar 2021 05:36:56 -0700 (PDT)
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
X-Inumbo-ID: ed7ef406-b708-4c5d-9fa7-9ba7a610d106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jjEXYV3IETTZZnE2F99X/YVsSolXNBNhR89Y7KFr44s=;
        b=tXmdVdIW7j1ogxeCxllmOV5WuyBQAhKztRhwrwRSZ7WUE0MfOkxX35fnAxvd11fp8T
         wdLvDW7sMt1tlkWvoq/vioXl1i6QF79FIu3vEb8wHNHdNCZLaSk6A8m/tw2c8IaauL/q
         0JuAkHnLYCt0Nst4mLaz/BQtbLtHHTV3JQGx9nLX9vUcwEXI3bA1uN3fePADrD7UJP+e
         vPqLKGsbpim8NbZwN6/ndMqUt5DGSwoiB2jH/KcQoVzWJG4adAZb33eEt9KyjnTaM0yQ
         wzP4I1QK9+y8ckXsBL/LUjcZTNd0lbDtxSldQBy4P5czHF1lGo0wWKJGGXgMxgHAQCUQ
         lFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jjEXYV3IETTZZnE2F99X/YVsSolXNBNhR89Y7KFr44s=;
        b=kyqX1Y2jtAxj9Fqfao0BbDaWgF0b0/gJ5q0rLzKHUCpqZXdpEqCjt/1VM0BTHGugjv
         ERdLofWtdakp49+fYazK4KrW72ImfThijOoj65Yx10NWIKvDpNPZWoSvT0E+jXH/zkk0
         Pr+rdH6QPiUdynsAP7fteHnNVQH99b1I1gc8NYr9rvmpa5uyf0FmDCTquGgflUgotbCM
         e0zmeUC3z6nXu4HrYMjsDmC2zTcdPpq1D+F7AkR9S/w+44FMObMicm9UUBMXFTU8MTPO
         j2U2+IU2yyLdX/9RYxjBDSXEYES6VZ/UEKiW8yGEYCImY07RqFFfE19TcV+FqWOKUNVS
         APCA==
X-Gm-Message-State: AOAM53356wW3gjngfETk/Cl13zZHMdi826QAnvAAKJ/JlEhZZxJ1tFwr
	oCUS8yDqjSpellRz70QGNYG7ZdqZingMBMoJHj0=
X-Google-Smtp-Source: ABdhPJyoVwfNP62aJ2wFY0rco6LaJ+jC66c0XypuSkILLC9vrfzrIl4+3Uu8tcIQmpGulN0hYrAI+urXDBT43x35kcM=
X-Received: by 2002:a05:6512:3290:: with SMTP id p16mr2488453lfe.150.1616503015051;
 Tue, 23 Mar 2021 05:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com> <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
 <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com> <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
 <2BC82A95-DFB9-4F90-8CC6-AE39405157ED@arm.com>
In-Reply-To: <2BC82A95-DFB9-4F90-8CC6-AE39405157ED@arm.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 23 Mar 2021 08:36:43 -0400
Message-ID: <CAKf6xptBm8G-T8UCfht22nfeS_4XOj2sN9fBvJhOVA1QKbfnhA@mail.gmail.com>
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 3:09 PM Luca Fancellu <luca.fancellu@arm.com> wrote=
:
>
> Hi Juergen,
>
> Yes you are right it was my mistake, as you said to remove the BUG_ON(=E2=
=80=A6) this serie (https://patchwork.kernel.org/project/xen-devel/cover/20=
210306161833.4552-1-jgross@suse.com/) is needed, since I=E2=80=99m using yo=
cto I=E2=80=99m able to build a preempt_rt kernel up to the 5.10.23 and for=
 this reason I=E2=80=99m applying that serie on top of this version, then I=
=E2=80=99m removing the BUG_ON(=E2=80=A6).
>
> A thing that was not expected is that now the Dom0 kernel is stuck on =E2=
=80=9CSetting domain 0 name, domid and JSON config=E2=80=A6=E2=80=9D step a=
nd the system seems unresponsive. Seems like a deadlock issue but looking i=
nto the serie we can=E2=80=99t spot anything and that serie was also tested=
 by others from the community.
> Do you have any idea on that?

I think this can happen if xenstored isn't running.  Client access to
xenstore blocks until xenstored becomes available.  So check your init
scripts ordering.

Regards,
Jason

