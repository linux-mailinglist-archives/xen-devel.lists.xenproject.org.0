Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C51D0508
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 04:36:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYhFQ-0007ho-S6; Wed, 13 May 2020 02:35:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WltO=63=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYhFO-0007hj-TV
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 02:35:50 +0000
X-Inumbo-ID: 75035d46-94c2-11ea-ae69-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75035d46-94c2-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 02:35:50 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a9so12267959lfb.8
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 19:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E9N4W2DwvaFGv1eRMFSJ1p6aZv3XUhtfCnoLChztmVA=;
 b=Ifk0J4Xmf2rqOyNut+l9VVX80YJg2wQ5sphfC0LxSYuXdTLYlJcoxKdx3Y+hlm/Qoa
 xVrwuYwUwvG2BZGFyZpR8wSMGB/mHlsCOwBe3mNzYoPf0h/jssE9VLhKEaGhripYcdq6
 ZGOACzEDqsNverHqjLhPIsJbhiO0+GrB2mVqB7rtIkGGH4M+F9MOYoy6pTDIpNktjHKk
 1457IrfBxMYUtQu+drKkQEf9dWEETSEW+rBGkZdorb8Kjihzrkf8mjKa+vTdnGqJa27X
 k02lISbThujYMBuBHHsjn/5/aSIFePHF0cbMrCx8DODvw2hvINXs0wKv53uQtYXQUc4B
 nRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E9N4W2DwvaFGv1eRMFSJ1p6aZv3XUhtfCnoLChztmVA=;
 b=B4zReaj4kSA9DJYPEyE36fx+dpsyBZuwFqB2dyDq0XLQoExm4Gesuhzr7Ffto/vgRO
 6ngxn8uVultBsOoOlGxz/ruK8+1Lw4KBbDYgd9E0TM9v3eKiDDPbi7KL0/pJbd2isDEO
 tgyuelNpdMU9KXB7aiuSdwS1tT17CU4nSBDCjPVpb8yw8YzWJSk7ZgbrkE7Nh+Uuhp/B
 NARyLB4rgoTdhJ0L8/KaTSdBBwDrluhXupk26wIjEBhlr1zMm8h6sCR63tilruRIiNZW
 +MHWq+taFuZp+ZxEDE18ktf/qkmvU7WIHwC0BFQFivb7XBa1EWDz+mXmRT5sV+9J7kOH
 Sppg==
X-Gm-Message-State: AOAM532Tx5XrMftimEvgu/MQh98RKBIrAd/QTUCt01NukyXkClMBhUDa
 Ptv+tNK3T2zVMg/mtBNahsPkQx7utNIM+JGC6o8=
X-Google-Smtp-Source: ABdhPJxs0TdijdGhSlbSI5fXuLNpbmbV92urJRIUVRWarQ8/4SvmZiU6YxqrO2jP1zqhMquADG0OG0qPwdqw7EmtpZ0=
X-Received: by 2002:ac2:4c3b:: with SMTP id u27mr16203886lfq.212.1589337349132; 
 Tue, 12 May 2020 19:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200512191116.6851-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200512191116.6851-1-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 12 May 2020 22:35:38 -0400
Message-ID: <CAKf6xpt-WLVOTaca_FncB4XX0PQ2ZbP6GFWQjinAYex=6mptRA@mail.gmail.com>
Subject: Re: [PATCH] x86/build: Unilaterally disable -fcf-protection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefan Bader <stefan.bader@canonical.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 12, 2020 at 3:11 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> See comment for details.  Works around a GCC-9 bug which breaks the build on
> Ubuntu.
>
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Tested-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> index 2a51553edb..93e30e4bea 100644
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -67,6 +67,15 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
>  CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
>  CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
>
> +# Xen doesn't support CET-IBT yet.  At a minimum, logic is required to
> +# enable it for supervisor use, but the Livepatch functionality needs
> +# to learn not to overwrite ENDBR64 instructions.

Is the problem that existing functions start with ENDBR64, but the
livepatch overwrites with a "real" instruction?

Regards,
Jason

