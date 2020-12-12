Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1D2D86E0
	for <lists+xen-devel@lfdr.de>; Sat, 12 Dec 2020 14:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51154.90059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko4r5-00074s-0j; Sat, 12 Dec 2020 13:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51154.90059; Sat, 12 Dec 2020 13:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko4r4-00074T-Su; Sat, 12 Dec 2020 13:22:34 +0000
Received: by outflank-mailman (input) for mailman id 51154;
 Sat, 12 Dec 2020 13:22:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJ6z=FQ=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1ko4r2-00074O-Gx
 for xen-devel@lists.xenproject.org; Sat, 12 Dec 2020 13:22:32 +0000
Received: from mail-pf1-x430.google.com (unknown [2607:f8b0:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b26b176-c3df-47d5-b858-c07763c636dd;
 Sat, 12 Dec 2020 13:22:31 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id f9so8917878pfc.11
 for <xen-devel@lists.xenproject.org>; Sat, 12 Dec 2020 05:22:31 -0800 (PST)
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
X-Inumbo-ID: 8b26b176-c3df-47d5-b858-c07763c636dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VTZpp0n/Om/Jf11Mz+DqRKpiaIjN4mJ897+taVy59Ug=;
        b=gs+DafSa6tm6ZhcmtOMAV2zOpZsgVdlfnJO3Cc8h6uZ7zEIkJ//kiGJiG610YJYd9c
         hi7RAK/gnCn0RzWdwMYCDo5iWNdBQbtvJKYrsQI5ZcoVP15/FlhWsHbcStHoxRpLv5K2
         7tZggztOJ5OrWHKSc7C0B5gdsPwG3Jh4XQNGDZzJ5uC91i9eb/FOwSgLNZwxuhvbJlm1
         NZRNGWscN+BvdnS2hdE/2kf8TIOM+A9TYoTVx3z4X0kR366gEuSlj/jqKKPOYQFh4Kj3
         5afdtXgK8N3xa39LgKIpCZwsKgk5qgska42v8wTbiGBbB+guXeCE2Frkke6P3b+dq3Ir
         zifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VTZpp0n/Om/Jf11Mz+DqRKpiaIjN4mJ897+taVy59Ug=;
        b=ms5m0BjK7zSIF2hRB06tK7MzvxZravSQpGaN0NUOfPA1YP3lKOqAQLsY/maCsB0m7j
         24jwD0Nqe7U3UYpzKB28spK0ZDH7OsSXfJgW1ZoD1rJ1DSfvXwaKrvXScJVXxpHU1BTq
         Ld7c7SR2dNorhilkedX/qcTsQ20Qb2+h1YxDDWO/2R+TpUAYUzs1Q4FknKhWlYvBLgfy
         8po4sX4FAPRNqj7NF4rMc3oizL0pC/y/V4ZnMeccEhk78HH43x9iaPQqwocxKUz9G9sJ
         HdfXOOP0oM6EvqYo08wTAEfpEUQaLiiTwogPvjVLVfvo1fd7kt75bncnVCwxAEOpCa0t
         8B/g==
X-Gm-Message-State: AOAM532j01pxkI8CuuCo0hiRajqCXyGUJeHc9zyztSUua0ue9Qpg570v
	p65lVwuwiCMuc3tAPchI1m/A70MOITiRx+RP530=
X-Google-Smtp-Source: ABdhPJz6qkGZaIbcK80z8oNTbmCmaNucZ+fxbrx52JjiY59cFl32wS2FAI0NK0C4i2f9nCp4IxJVJq78J8uiblnFRTg=
X-Received: by 2002:a05:6a00:170a:b029:19d:afca:4704 with SMTP id
 h10-20020a056a00170ab029019dafca4704mr15887538pfc.7.1607779350726; Sat, 12
 Dec 2020 05:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de> <20201210194042.860029489@linutronix.de>
 <CAHp75Vc-2OjE2uwvNRiyLMQ8GSN3P7SehKD-yf229_7ocaktiw@mail.gmail.com>
 <87h7osgifc.fsf@nanos.tec.linutronix.de> <87360cgfol.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87360cgfol.fsf@nanos.tec.linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Dec 2020 15:22:14 +0200
Message-ID: <CAHp75Ve5zzeQw8P2wD083WW5+KGehETTy810wksfpXbj+3GBug@mail.gmail.com>
Subject: Re: [patch 03/30] genirq: Move irq_set_lockdep_class() to core
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marc Zyngier <maz@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, 
	Chris Wilson <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, 
	linux-ntb@googlegroups.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Michal Simek <michal.simek@xilinx.com>, linux-pci <linux-pci@vger.kernel.org>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Tariq Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, 
	"open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 12, 2020 at 12:07 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Fri, Dec 11 2020 at 22:08, Thomas Gleixner wrote:
>
> > On Fri, Dec 11 2020 at 19:53, Andy Shevchenko wrote:
> >
> >> On Thu, Dec 10, 2020 at 10:14 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >>>
> >>> irq_set_lockdep_class() is used from modules and requires irq_to_desc() to
> >>> be exported. Move it into the core code which lifts another requirement for
> >>> the export.
> >>
> >> ...
> >>
> >>> +       if (IS_ENABLED(CONFIG_LOCKDEP))
> >>> +               __irq_set_lockdep_class(irq, lock_class, request_class);
> >
> > You are right. Let me fix that.
>
> No. I have to correct myself. You're wrong.
>
> The inline is evaluated in the compilation units which include that
> header and because the function declaration is unconditional it is
> happy.
>
> Now the optimizer stage makes the whole thing a NOOP if CONFIG_LOCKDEP=n
> and thereby drops the reference to the function which makes it not
> required for linking.
>
> So in the file where the function is implemented:
>
> #ifdef CONFIG_LOCKDEP
> void __irq_set_lockdep_class(....)
> {
> }
> #endif
>
> The whole block is either discarded because CONFIG_LOCKDEP is not
> defined or compile if it is defined which makes it available for the
> linker.
>
> And in the latter case the optimizer keeps the call in the inline (it
> optimizes the condition away because it's always true).
>
> So in both cases the compiler and the linker are happy and everything
> works as expected.
>
> It would fail if the header file had the following:
>
> #ifdef CONFIG_LOCKDEP
> void __irq_set_lockdep_class(....);
> #endif
>
> Because then it would complain about the missing function prototype when
> it evaluates the inline.

I understand that (that's why I put "if even no warning") and what I'm
talking about is the purpose of IS_ENABLED(). It's usually good for
compile testing !CONFIG_FOO cases. But here it seems inconsistent.

The pattern I usually see in the cases like this is

 #ifdef CONFIG_LOCKDEP
 void __irq_set_lockdep_class(....);
 #else
 static inline void ... {}
 #endif

and call it directly in the caller.

It's not a big deal, so up to you.

-- 
With Best Regards,
Andy Shevchenko

