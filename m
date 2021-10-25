Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CC443965F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 14:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215802.375176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mez8u-0006sI-E8; Mon, 25 Oct 2021 12:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215802.375176; Mon, 25 Oct 2021 12:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mez8u-0006py-Ag; Mon, 25 Oct 2021 12:31:56 +0000
Received: by outflank-mailman (input) for mailman id 215802;
 Mon, 25 Oct 2021 12:31:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eqc=PN=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mez8t-0006ps-2V
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 12:31:55 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fce91ae7-2e36-44a4-8970-bd11ddf32f18;
 Mon, 25 Oct 2021 12:31:54 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y26so9106494lfa.11
 for <xen-devel@lists.xenproject.org>; Mon, 25 Oct 2021 05:31:54 -0700 (PDT)
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
X-Inumbo-ID: fce91ae7-2e36-44a4-8970-bd11ddf32f18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsXzxcxV0y5xMwXg4e7QntuXuk695o/R/LGfdUxufpA=;
        b=UclQCWoAv/aInb3BX+pcCYm0XwoRRLg80Fem/NVkw+y0qjEEcpB76FpBdjTp8vuK1l
         z50Yeu6KoK2B/7LVypXChh0LkNiwjKjm3orMDx5yOABtMiwwjkYs3NEIx7h3KxkjdDdP
         Ek7NLHytlcCgWuz6xBQYu3Q403aKF7vQuGLXhTVh6z0Pzvn+JGXltleEp250t38JzH5j
         s4EPzZTZxzd/l83xcwuR+WVOPek9mSUTXQbRelreN6AZqWyrHC3KmxczQUZfWae9+KEL
         vTq70uNd/ShSO42sqqkPdHucUQN/mJWzpyYYCytxFaJSHRB87w0ZDUWAzYEf5GEHdsqO
         ar2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsXzxcxV0y5xMwXg4e7QntuXuk695o/R/LGfdUxufpA=;
        b=ZZJhaM+r4o8y49fuVVtxG8A9zE5OYpjca+VQOj/FzVn1IW+1XytBon2qhuaNpP0U6Y
         KPz6cwJKt22FCKiDY/6g3RwiMrcQjHYAdZ7Yg1ST4gVW37KwxlUW0VERU4ikCoAZwbTA
         U0vSURk/TZaP1OkDYsSNAZmB47iPmndLcvyKmqSSpbn+qt1o3excs7lRgPzCDoJ2NYQI
         qFQhD18jirSsqC0rMMUEG/q6aRWjd/v/0+0jSCYhlIj5oOB5VVYpg4JNYL4xvvJU8OvU
         csw/cTCOfFQNOkuLkP2OuuW/9WeymhA/Vfg5osLxdhxPySxR/0tEaZa8qL3g7JjIqxrY
         7w4g==
X-Gm-Message-State: AOAM533fSct46dHLpySFaK31v28Ehbjhnn7Ia0EE6Fk/UbJJ5mjhCxF4
	zqGoZCZCzoqy4458hxWBlrT6AkFnwXJzTajSrTA=
X-Google-Smtp-Source: ABdhPJzmw7j45jN5rCnXFGhqUnslOEjOY9G+jsrw/HmHox7WH0FH5oHXmcXWmHzJplbhYRjkRg+VGMR9MuRvpdL6/j4=
X-Received: by 2002:a19:7903:: with SMTP id u3mr15963739lfc.406.1635165113269;
 Mon, 25 Oct 2021 05:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se>
 <20211025012503.33172-1-jandryuk@gmail.com> <eb38c1d2707d03bf675d7b15f014cbe741de0998.camel@infradead.org>
In-Reply-To: <eb38c1d2707d03bf675d7b15f014cbe741de0998.camel@infradead.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 25 Oct 2021 08:31:41 -0400
Message-ID: <CAKf6xpvkF55U7Zrtx4PK=tqT8fjdmY-kZSm3WJO1gAnutnum-A@mail.gmail.com>
Subject: Re: [PATCH] PCI/MSI: Fix masking MSI/MSI-X on Xen PV
To: David Woodhouse <dwmw2@infradead.org>
Cc: Josef Johansson <josef@oderland.se>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, Juergen Gross <jgross@suse.com>, linux-pci@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 3:44 AM David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Sun, 2021-10-24 at 21:25 -0400, Jason Andryuk wrote:
> > commit fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
> > functions") introduce functions pci_msi_update_mask() and
> > pci_msix_write_vector_ctrl() that is missing checks for
> > pci_msi_ignore_mask that exists in commit 446a98b19fd6 ("PCI/MSI: Use
> > new mask/unmask functions").  The checks are in place at the high level
> > __pci_msi_mask_desc()/__pci_msi_unmask_desc(), but some functions call
> > directly to the helpers.
> >
> > Push the pci_msi_ignore_mask check down to the functions that make
> > the actual writes.  This keeps the logic local to the writes that need
> > to be bypassed.
> >
> > With Xen PV, the hypervisor is responsible for masking and unmasking the
> > interrupts, which pci_msi_ignore_mask is used to indicate.
>
> This isn't just for Xen PV; Xen HVM guests let Xen unmask the MSI for
> them too.

Ah, that makes sense that Xen handles both.  I was repeating another
commit message's statement.  Oh, it looks like pci_msi_ignore_mask is
PV-specific.

Regards,
Jason

