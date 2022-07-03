Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC2E564848
	for <lists+xen-devel@lfdr.de>; Sun,  3 Jul 2022 17:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359644.588984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o81AK-0001EE-AP; Sun, 03 Jul 2022 15:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359644.588984; Sun, 03 Jul 2022 15:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o81AK-0001BR-7a; Sun, 03 Jul 2022 15:05:40 +0000
Received: by outflank-mailman (input) for mailman id 359644;
 Sun, 03 Jul 2022 15:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++8g=XI=gmail.com=andy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1o81AI-0001BL-8z
 for xen-devel@lists.xenproject.org; Sun, 03 Jul 2022 15:05:38 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 979cc0d5-fae1-11ec-bd2d-47488cf2e6aa;
 Sun, 03 Jul 2022 17:05:37 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id e69so6005843ybh.2
 for <xen-devel@lists.xenproject.org>; Sun, 03 Jul 2022 08:05:36 -0700 (PDT)
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
X-Inumbo-ID: 979cc0d5-fae1-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4QgHhJo99e7BP4qELBN4r2lriKbWdLtk6/DKUxmzOGg=;
        b=Vh7pwmFrp/ki5XJ76jyI5hNuUV1PKQWxt+H19V/GLJ3etny3Ed4qf9e0QV9OMyCnks
         +V7tZtdw1VniQ6BdZSdBWajNOZDP/9WVdUA9+J37kLhzlbC4xMvQ7twWstXyRhygrgEk
         OySwdBIMfbZujBrURcg8GdeODfqyyz4SIitS0W7F6ysxNT0VLPBddMx3/a/GvGvQdxvo
         iMowCy/4ZchQtcTLw19pWaXjlYPd52toUo7sie8xXqMfjy5oNYUEW0ViDYOw6PUrk0C5
         G34+Zs4D16S3OjNGlDvG+54xupVbs4o/Tt1NVLksn8dVuCTj0pxBkrj4yh/fdGcgDAoR
         8k/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4QgHhJo99e7BP4qELBN4r2lriKbWdLtk6/DKUxmzOGg=;
        b=E5JfP7G7BO+JvOsByQQ20Hx9SIwTwVSPwca/nJgkiJx/NtZa0i15q7dg970tWH//Kh
         e+N6QQ8ggznkr66R62UxAWkolvVgI2vblbq0GWBF/mAJaajMwTXk2BIq9cf9YhoULdiN
         HDvcrBLmzxg02fUZ0j8r0ZVG6eGgbCHvoEz0+WjmCrTrYPTTX98TBuZGv/3O8v5GHaK4
         ml5EqVo+kAwUvwkBrgAsL3V33CumKoswIvTL9jp8Ny9Qf2ZtRjwBrAcpG40LvBMDgP4k
         SNiIS2g+Wt1dXLRrO1owpZml0GUB8/cQ1XwyqT/0ttHNkAidGXuzGfZj3NpF4JHGYkjo
         oQNw==
X-Gm-Message-State: AJIora/si3e1cfnX27i7s2lsIRuAxM/7Rf3n35aBKMB9mirRVD4LOS8G
	q6ZTnDcl+YjcPmdpgJROHxBtN/Q3jx9mqt3xBBQ=
X-Google-Smtp-Source: AGRyM1uAuVW9IWphg5kSjbYsSYjb/TM871XbOL+Xts9oBKQbm/sejVIg7QWw6bS/e6Nkvrm3x1W/9pxqPUjTrwcE74M=
X-Received: by 2002:a25:858e:0:b0:66e:4898:63e2 with SMTP id
 x14-20020a25858e000000b0066e489863e2mr673140ybk.296.1656860735358; Sun, 03
 Jul 2022 08:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220701200056.46555-1-samuel@sholland.org> <20220701200056.46555-8-samuel@sholland.org>
In-Reply-To: <20220701200056.46555-8-samuel@sholland.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 3 Jul 2022 17:04:58 +0200
Message-ID: <CAHp75VccKxO+Gtw46GvxSiPo4ShfpaZPOBehAp6gCoq3gT_9Cw@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] genirq: Return a const cpumask from irq_data_get_affinity_mask
To: Samuel Holland <samuel@sholland.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chris Zankel <chris@zankel.net>, 
	Colin Ian King <colin.king@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dexuan Cui <decui@microsoft.com>, Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Haiyang Zhang <haiyangz@microsoft.com>, Helge Deller <deller@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jan Beulich <jbeulich@suse.com>, 
	Joerg Roedel <joro@8bytes.org>, Juergen Gross <jgross@suse.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Kees Cook <keescook@chromium.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Maximilian Heyne <mheyne@amazon.de>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Rich Felker <dalias@libc.org>, 
	Richard Henderson <rth@twiddle.net>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Serge Semin <fancer.lancer@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Stephen Hemminger <sthemmin@microsoft.com>, Sven Schnelle <svens@stackframe.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Wei Liu <wei.liu@kernel.org>, 
	Wei Xu <xuwei5@hisilicon.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, iommu@lists.linux.dev, 
	linux-alpha@vger.kernel.org, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	Linux on Hyper-V List <linux-hyperv@vger.kernel.org>, linux-ia64@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-parisc@vger.kernel.org, 
	linux-pci <linux-pci@vger.kernel.org>, Linux-SH <linux-sh@vger.kernel.org>, 
	linux-xtensa@linux-xtensa.org, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 1, 2022 at 10:01 PM Samuel Holland <samuel@sholland.org> wrote:
>
> Now that the irq_data_update_affinity helper exists, enforce its use
> by returning a a const cpumask from irq_data_get_affinity_mask.
>
> Since the previous commit already updated places that needed to call
> irq_data_update_affinity, this commit updates the remaining code that
> either did not modify the cpumask or immediately passed the modified
> mask to irq_set_affinity.

When we refer to functions, we use parentheses, e.g. func().

-- 
With Best Regards,
Andy Shevchenko

