Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CEA2DDC62
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 01:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56259.98402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq3eo-00035V-MB; Fri, 18 Dec 2020 00:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56259.98402; Fri, 18 Dec 2020 00:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq3eo-000359-He; Fri, 18 Dec 2020 00:30:06 +0000
Received: by outflank-mailman (input) for mailman id 56259;
 Fri, 18 Dec 2020 00:30:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NeVu=FW=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1kq3em-0002o8-De
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 00:30:04 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c19b0671-0274-4186-a4bc-ff74f22daf12;
 Fri, 18 Dec 2020 00:30:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id 91so304097wrj.7
 for <xen-devel@lists.xenproject.org>; Thu, 17 Dec 2020 16:30:03 -0800 (PST)
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
X-Inumbo-ID: c19b0671-0274-4186-a4bc-ff74f22daf12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hyHN9ivFR9PDDp25TgpaViYqFJZgbegacz/Nx05KtIM=;
        b=hmZz1LupRe5BCWEWEqPp5S5fy1uFWvckjX6rxxtPqRubFosqKb4/SrzyPkWwoDEX0j
         OCMXeR0bGxGqXB5N9+shkTsUpMOpOvNyPxCRl7d9XYsxkagiHnQanOa14QMNzaBEPgn4
         0BGY9girSbM1zEFGUyvvqYRN5Xk+FKZ+DrX76Meym1qEuJNuk9dNUKvocu2eZvEJ6273
         F+E5H2qQIdF6l8WBR1OLlLleLHSEWsP53VYG0C2ocIaAOj8gM2twVrmYJcxGWeHeOis+
         EDwazjWsPEvrAoI9ZOhyuai/Ir17nKdCd6gm/gwUFhxpthQD4F2Tj5DllqZViWegCVyY
         69eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hyHN9ivFR9PDDp25TgpaViYqFJZgbegacz/Nx05KtIM=;
        b=ZhQFChbOXdKxMI1lgMZr1g+twtY3oBoQRg8BqHK108mzlG502smaboIr5n12pF7jhy
         PIZjsMYzqykLRiEi+8FsSD02saxeD1vLdo/2KBXkss3QTDxy56I3D2xNqk+4eYViXPEt
         ZPZeZvh8w31c6s9+J8RPla47Vkb2eWENlwdhoxdziC4jc3K04n/xYdC4ADepR8QvUX5o
         5svBzCoN3l/hUKYhZST6oxB4GuwxDn3YzVuioEESmvY3HypdWqErs9ZoTXAxdCZv1t6b
         XqdBtjoQfPOkOiPs+sXDbu1Kv05sx+h1sbr5ClidTJsmTmVvn9fYctRzKAPWF91JYqHW
         7wPA==
X-Gm-Message-State: AOAM530lycm4xJbizOU45PlyXft2Z0DQd2OCaR9cStkGDgUm91jNbv2m
	/tCiiYjylrxGUbbaygcBXbJtFdIWmyOXfQ/vLWg=
X-Google-Smtp-Source: ABdhPJzpyOYE1jO619sHqXkuT26r7EaN9vmUB7THeI/3KEcszuWlm51aRIMzZUmbOOW5SdvojwTCRcJDaoyJDaTm2ok=
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr1384085wrr.326.1608251402434;
 Thu, 17 Dec 2020 16:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20201215112610.1986-1-julien@xen.org> <c5ac88e6-4e06-553d-2996-d2b027acd782@suse.com>
 <04455739-f07f-3da8-f764-33600a9cab6f@xen.org> <3f165cf8-88a4-590a-6e86-2435e8a7e554@suse.com>
 <alpine.DEB.2.21.2012171553340.4040@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012171553340.4040@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 18 Dec 2020 00:29:51 +0000
Message-ID: <CAJ=z9a1cJ3H6U0nymU9mPcXbDcxhBmih-Jmua5ScGqeQKcVt5w@mail.gmail.com>
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was triggered
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <jgrall@amazon.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Dec 2020 at 23:54, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Tue, 15 Dec 2020, Jan Beulich wrote:
> > On 15.12.2020 14:19, Julien Grall wrote:
> > > On 15/12/2020 11:46, Jan Beulich wrote:
> > >> On 15.12.2020 12:26, Julien Grall wrote:
> > >>> --- a/xen/include/xen/lib.h
> > >>> +++ b/xen/include/xen/lib.h
> > >>> @@ -23,7 +23,13 @@
> > >>>   #include <asm/bug.h>
> > >>>
> > >>>   #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
> > >>> -#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
> > >>> +#define WARN_ON(p)  ({                  \
> > >>> +    bool __ret_warn_on = (p);           \
> > >>
> > >> Please can you avoid leading underscores here?
> > >
> > > I can.
> > >
> > >>
> > >>> +                                        \
> > >>> +    if ( unlikely(__ret_warn_on) )      \
> > >>> +        WARN();                         \
> > >>> +    unlikely(__ret_warn_on);            \
> > >>> +})
> > >>
> > >> Is this latter unlikely() having any effect? So far I thought it
> > >> would need to be immediately inside a control construct or be an
> > >> operand to && or ||.
> > >
> > > The unlikely() is directly taken from the Linux implementation.
> > >
> > > My guess is the compiler is still able to use the information for the
> > > branch prediction in the case of:
> > >
> > > if ( WARN_ON(...) )
> >
> > Maybe. Or maybe not. I don't suppose the Linux commit introducing
> > it clarifies this?
>
> I did a bit of digging but it looks like the unlikely has been there
> forever. I'd just keep it as is.

Thanks! I was planning to answer earlier on with some data but got
preempted with some higher priority work.
The Linux commit message is not very helpful. I will do some testing
so I can convince Jan that compilers can be clever and make use of it.

Cheers,

