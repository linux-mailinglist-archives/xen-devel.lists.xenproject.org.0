Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1AD355A7B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 19:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106163.203048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTpdw-0001Tm-52; Tue, 06 Apr 2021 17:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106163.203048; Tue, 06 Apr 2021 17:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTpdw-0001TN-1s; Tue, 06 Apr 2021 17:37:36 +0000
Received: by outflank-mailman (input) for mailman id 106163;
 Tue, 06 Apr 2021 17:37:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gMKf=JD=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lTpdu-0001TI-Ua
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 17:37:35 +0000
Received: from mail-qv1-xf33.google.com (unknown [2607:f8b0:4864:20::f33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aeb01a59-df44-4776-ab4d-cfd13e888f47;
 Tue, 06 Apr 2021 17:37:34 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id u3so5425329qvj.8
 for <xen-devel@lists.xenproject.org>; Tue, 06 Apr 2021 10:37:34 -0700 (PDT)
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
X-Inumbo-ID: aeb01a59-df44-4776-ab4d-cfd13e888f47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bfQHUU/Sr/PnCTN0LARQB8ZFDFD0VEfnBYa9ZmZwT5s=;
        b=iPWJ6xoEaJuBtRua/7FTtMl2ybMudrkpxfilPFI159dU6BurVnVuLMAlYe0o7MXgoc
         AO7hTeFteKDeKeGnBmj9JZz7kHBFmR01xJZCFJKApoKsGbw+Y+6jaI4DcXeVUMzYN57g
         JCX0N/CZmdKSuDNtA6OoiucgNCVdu0X3fWnaXSMaBtxVFx5lc7UySOfcbeqkfuYMoI0I
         Tefwd7XbVnI5k6lKshBn43//uVRWD2Lg4PxQy1sdH6x6+GJE2h+U6kGCCh4q4vQhaSBD
         hnqECuagXX45zPUfKxPd8i8DEPsU47sX5m2AeGsQT6fwACk30KjT0FeicT6l5bD2tClb
         IbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bfQHUU/Sr/PnCTN0LARQB8ZFDFD0VEfnBYa9ZmZwT5s=;
        b=Rqgu98Rul4UKbMG9G1wonw2X1FTzemIfYudAO6Jrpbu0M5HfpRphoT2hRGz23YN8BF
         sWhqxT/4cL+YYGgudaigx6WVqMFy6wzTIm9xt/yb7k7KGszuoK+BO/dD0eQnFHMO8ACM
         UOV0EFbkxsyXaUazxgXGKmFI4JdMAQoKTiPmOSy9Iee3EZnbWwUTTPwjZ93WhnLNY3pW
         xlLVqlVBnWPF5fIxc4dpnMajPYr2jDca4+Gsc3mUWKqhpWqLzTvl70AQXo6FQGrqnpOW
         iRvR1GBzYiANJL2DlyXg4HQZsYbT35s6OMVrdsc6RV9vR0gFJBpjsWclGdJYVxVDZw//
         I0fQ==
X-Gm-Message-State: AOAM533wENeNGa1lx9sc+XDjqjJpRz38S2/ICaEqw21Z09mPs+TxekGW
	Uqc2FwaWmeQeYsbkdpcMck+hMe+Zs1xORdfEXsK7kg==
X-Google-Smtp-Source: ABdhPJx6OWoaFmyWmzSaFypWS88s8ThVXrz5lUFVpGKyQ2uP81mRrIJ3PwHM2O2gvOFyJ6BTtKTy1ScoOxe76qlttd4=
X-Received: by 2002:a0c:f702:: with SMTP id w2mr29977785qvn.0.1617730653937;
 Tue, 06 Apr 2021 10:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com> <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
 <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com> <YGWH89ubVe104Tnl@Air-de-Roger>
 <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com> <f800ac60-7d49-fa08-ca8d-1c75408dd2de@suse.com>
In-Reply-To: <f800ac60-7d49-fa08-ca8d-1c75408dd2de@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 6 Apr 2021 10:37:25 -0700
Message-ID: <CAMmSBy910nvfYPn-V_MdtP_S8=LQbmcgb_gx1Gyz2qwEx3gufQ@mail.gmail.com>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	grub-devel@gnu.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000f8733905bf51441c"

--000000000000f8733905bf51441c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 6, 2021 at 1:19 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 01.04.2021 21:43, Andrew Cooper wrote:
> > On 01/04/2021 09:44, Roger Pau Monn=C3=A9 wrote:
> >> On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:
> >>> On 01.04.2021 03:06, Roman Shaposhnik wrote:
> >>>> And the obvious next question: is my EVE usecase esoteric enough tha=
t
> >>>> I should just go ahead and do a custom GRUB patch or is there a more
> >>>> general interest in this?
> >>> Not sure if it ought to be a grub patch - the issue could as well
> >>> be dealt with in Xen, by concatenating modules to form a monolithic
> >>> initrd.
> >> I would rather have it done in the loader than Xen, mostly because
> >> it's a Linux boot specific format, and hence I don't think Xen should
> >> have any knowledge about it.
> >>
> >> If it turns out to be impossible to implement on the loader side we
> >> should consider doing it in Xen, but that's not my first option.
> >
> > Concatenating random things which may or may not be initrds is
> > absolutely not something Xen should do.  We don't have enough context t=
o
> > do it safely/sensibly.
>
> Well, I wasn't suggesting anywhere to concatenate random things.
> Instead I was envisioning a command line option giving us the
> context we need (e.g. "initrd=3D3+5").
>

That's actually not a bad idea at all -- I may look into how feasible it
would
be to add on Xen side. GRUB side is trivial (but I'm not sure upstream folk=
s
would take it).

Thanks,
Roman.

--000000000000f8733905bf51441c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Apr 6, 2021 at 1:19 AM Jan Beulic=
h &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 01.04.2021 21:43, Andrew Cooper wrote:<br>
&gt; On 01/04/2021 09:44, Roger Pau Monn=C3=A9 wrote:<br>
&gt;&gt; On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:<br>
&gt;&gt;&gt; On 01.04.2021 03:06, Roman Shaposhnik wrote:<br>
&gt;&gt;&gt;&gt; And the obvious next question: is my EVE usecase esoteric =
enough that<br>
&gt;&gt;&gt;&gt; I should just go ahead and do a custom GRUB patch or is th=
ere a more<br>
&gt;&gt;&gt;&gt; general interest in this?<br>
&gt;&gt;&gt; Not sure if it ought to be a grub patch - the issue could as w=
ell<br>
&gt;&gt;&gt; be dealt with in Xen, by concatenating modules to form a monol=
ithic<br>
&gt;&gt;&gt; initrd.<br>
&gt;&gt; I would rather have it done in the loader than Xen, mostly because=
<br>
&gt;&gt; it&#39;s a Linux boot specific format, and hence I don&#39;t think=
 Xen should<br>
&gt;&gt; have any knowledge about it.<br>
&gt;&gt;<br>
&gt;&gt; If it turns out to be impossible to implement on the loader side w=
e<br>
&gt;&gt; should consider doing it in Xen, but that&#39;s not my first optio=
n.<br>
&gt; <br>
&gt; Concatenating random things which may or may not be initrds is<br>
&gt; absolutely not something Xen should do.=C2=A0 We don&#39;t have enough=
 context to<br>
&gt; do it safely/sensibly.<br>
<br>
Well, I wasn&#39;t suggesting anywhere to concatenate random things.<br>
Instead I was envisioning a command line option giving us the<br>
context we need (e.g. &quot;initrd=3D3+5&quot;).<br></blockquote><div><br><=
/div><div>That&#39;s actually not a bad idea at all -- I may look into how =
feasible it would</div><div>be to add on Xen side. GRUB side is trivial (bu=
t I&#39;m not sure upstream folks</div><div>would take it).</div><div><br><=
/div><div>Thanks,<br>Roman.=C2=A0</div></div></div>

--000000000000f8733905bf51441c--

