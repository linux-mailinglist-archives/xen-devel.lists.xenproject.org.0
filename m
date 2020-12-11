Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656072D7194
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 09:22:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50192.88765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kndh8-0001W1-Li; Fri, 11 Dec 2020 08:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50192.88765; Fri, 11 Dec 2020 08:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kndh8-0001Vg-Id; Fri, 11 Dec 2020 08:22:30 +0000
Received: by outflank-mailman (input) for mailman id 50192;
 Fri, 11 Dec 2020 08:22:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WZY=FP=linaro.org=linus.walleij@srs-us1.protection.inumbo.net>)
 id 1kndh6-0001Vb-Vi
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 08:22:29 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea2351fe-2a03-4101-8b3c-0a0e64b5593b;
 Fri, 11 Dec 2020 08:22:27 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id m12so12201002lfo.7
 for <xen-devel@lists.xenproject.org>; Fri, 11 Dec 2020 00:22:27 -0800 (PST)
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
X-Inumbo-ID: ea2351fe-2a03-4101-8b3c-0a0e64b5593b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2E9lnRJNmKjai1CIMZDErJ15p/JF+kjk/cqnxyQj4Dg=;
        b=Sg4cSLWy6IZckqqkeAYWtdI97FK7RQhI79W1qCeW5ejotUknN/MdP8pOZwiJvJO7uZ
         1g0ChmDEvTyZ23ejJpGuTfR48BiteLYb+OL/KdYtSnujk6eEaD9Otld8+8Y1g2J3MkZy
         tBoVa7+XwKCBx80qyQ1lEL4q5LEMtfg9bICdHSQfD91by6GBTt8+YUD0LCicXSAecwzu
         UGwPYj7soqTu0UOqubjIEnM4Y4/SCD8/nRHiZ64GIKuX4gCcysUu5Anc/HkVqEhjxidw
         EOW9o76j1CYEbDn1Eew6P3PNlPF6IkqqOz0I8fQQT/K3wBjEt9vG4/VgfYmY3wimDZ9S
         ttIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2E9lnRJNmKjai1CIMZDErJ15p/JF+kjk/cqnxyQj4Dg=;
        b=phd2UmfAKu1u4CSkuo0ezhxtrBgftnfbOH6npVJ4W4oAz/DiU+h40VHSmB/k1c9Xjw
         cTIrHG2Pi8GUOSw67uO5YBDDcJw6KQOlazDN+nTPjT0QaBTuJKV06FEKerI3n1EwQ86G
         jXCi6Fa4mFviHL4E7kRcNW1fsJ1cq5kd9TCidypflhfkfDJNjcxovItMF5C7c03F8eBA
         SljBXd1YGPPEZ8G+GjCZa9f32V3RVrzuEnqBuRW8EaY3MsHV6MBwa61fSlvcKug3XZqR
         4UVA2KGK3IcK1YJWj2OmhYO+H9OC769qvlZjgDOCm9kOAKgyLcZyzm1Myg5y+UHFBrPh
         BToQ==
X-Gm-Message-State: AOAM531RvU4i8kHuICbR3ktbe0VGft0W3j52V0xpk8I1V2idvUfTTaAw
	+8p2VJxug1aiIs39a5lQpPWtzmnCXAV2lBMnU7HS2Q==
X-Google-Smtp-Source: ABdhPJy4uaPybRyNu7M8RrLozSmYT+Qwt4yF5yxQSb1/0NkgevgBErArzujQXpmZiKS3OBl0PE4C3Qi2TwkDPG47X1M=
X-Received: by 2002:a19:8384:: with SMTP id f126mr3904234lfd.649.1607674946619;
 Fri, 11 Dec 2020 00:22:26 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de> <20201210194044.157283633@linutronix.de>
In-Reply-To: <20201210194044.157283633@linutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Dec 2020 09:22:15 +0100
Message-ID: <CACRpkdZuPp0KN1BCJ26vWH1=nopaD-ctv6bh-rt2X9bJczZE-Q@mail.gmail.com>
Subject: Re: [patch 16/30] mfd: ab8500-debugfs: Remove the racy fiddling with irq_desc
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marc Zyngier <maz@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, 
	Chris Wilson <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Jon Mason <jdmason@kudzu.us>, 
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Tariq Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, linux-rdma@vger.kernel.org, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 8:42 PM Thomas Gleixner <tglx@linutronix.de> wrote:

> First of all drivers have absolutely no business to dig into the internals
> of an irq descriptor. That's core code and subject to change. All of this
> information is readily available to /proc/interrupts in a safe and race
> free way.
>
> Remove the inspection code which is a blatant violation of subsystem
> boundaries and racy against concurrent modifications of the interrupt
> descriptor.
>
> Print the irq line instead so the information can be looked up in a sane
> way in /proc/interrupts.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

