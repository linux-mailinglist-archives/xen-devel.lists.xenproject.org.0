Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A732F332E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 15:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65730.116493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKyG-0000Ei-HG; Tue, 12 Jan 2021 14:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65730.116493; Tue, 12 Jan 2021 14:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKyG-0000EJ-DT; Tue, 12 Jan 2021 14:48:32 +0000
Received: by outflank-mailman (input) for mailman id 65730;
 Tue, 12 Jan 2021 14:48:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Af+B=GP=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kzKyF-0000E8-4H
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 14:48:31 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51cc52dc-b2e7-47b0-971b-2e60caebfc3a;
 Tue, 12 Jan 2021 14:48:30 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id s26so3731849lfc.8
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 06:48:30 -0800 (PST)
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
X-Inumbo-ID: 51cc52dc-b2e7-47b0-971b-2e60caebfc3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NAuuQtWIZlmAt5OkDC1xTAH/JxWX+LnCnI3DAZoS/x0=;
        b=JvUh7s49XLJWoUAzGCY8rjHWynzDlwaKtWNX7mC9nRXOhJAQzrJYer4bTqYqMH9Hce
         IRldfyj+8flNYGY61J8Btk2vT7OdAugMEljD6oRHKRZ0QQ0M9Zi2qXnBMtEZZhMwIVWe
         GxbzuTZYbzFjfYyp8fM38hMdzbVx0bGI2Hgv/+Ixjd+fCzRJFin//dcUonYOdFix9Hqx
         x4U5WDAbrBE1FzwQGBmaCtzYXNviZG+BKjkuak4/97OSACFVtA9PnfgbQ9ziC7lFdnVE
         GryXFJg6PCQ1+/ZFCi1HKN0wdupCQzNlVt1F7OCcZe4TFY+rHZeEbSJntlm+PbroqGDq
         FvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NAuuQtWIZlmAt5OkDC1xTAH/JxWX+LnCnI3DAZoS/x0=;
        b=Spt5efBw8aFN/X4ZrZkomJ9+URsvJnvkD4cijMSyjsuQDH7HUueyo3qd4/VY329K+f
         lpbntIOhsUmbBTiQjQCNhWREXEe7vwkDfl/j3EzInlcNWkeWbLUo4mp0hoHIy2uYDQBo
         qUU3xRGR0R/orhq1eyIAZVlIAE0jQqs1ZNZsXk/b4F8cZ1aLUJhh0gQK7ieELoR0d0XL
         0USYNIUun+WfmdDXkslH0cFXKy6b1wwAohX7HHqjWRmrls0IF7LTGLlSbdFkRlDdhAE4
         2n9LaaetTs5NYYsoVJYS1l9ZJX/nRV3KYsgwQqhRPdqUry0vdsjLVdO0W+9dClr5T8XE
         Knng==
X-Gm-Message-State: AOAM532eWQgFst4WYkEJYhZ2pjZ3QKiusX4P2Ce5aVyxmo+HZfVX0qwD
	a0AuqifDagFEExboXHiTnKw1sMuLrlPq4eXhaGU=
X-Google-Smtp-Source: ABdhPJyWuX20LQUxo9Tnku7Wu94vmeLso2zEK2YNnLuOywj6jKF1x7quA6VMVjydWtsEdn8qU1G7pQ3YEFaKcokGC9k=
X-Received: by 2002:a19:84d1:: with SMTP id g200mr2395859lfd.659.1610462908965;
 Tue, 12 Jan 2021 06:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20210112141057.xjbslkq2em56kk3r@Air-de-Roger> <20210112142529.btveobjtj45hcvg6@Air-de-Roger>
In-Reply-To: <20210112142529.btveobjtj45hcvg6@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 12 Jan 2021 09:48:17 -0500
Message-ID: <CAKf6xptsLxtjE3-MORi2eQ7ew+rMU1qPaxfPDpOu0Cz74-r0gw@mail.gmail.com>
Subject: Re: Purpose of translate MSI interrupt into INTx for guest passthrough
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 9:25 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> Dropping Qing He as this address bounces.
>
> On Tue, Jan 12, 2021 at 03:10:57PM +0100, Roger Pau Monn=C3=A9 wrote:
> > Hello,
> >
> > While trying to do some cleanup of the Xen interrupt support for pci
> > pass though I came across the MSI to INTx translation that Xen is in
> > theory capable of performing (ie: use a physical MSI interrupt source
> > and inject that as an INTx to a guest).
> >
> > AFAICT such functionality is not wired up to the toolstack, so it's
> > hard to tell what's the indented purpose, or whether it has seen any
> > usage.
>
> So apparently it is wired up to the toolstack for qemu-traditional,
> albeit it's disabled by default. There's some documentation in
> xl-pci-configuration:
>
> "When enabled, MSI-INTx translation will always enable MSI on the PCI
> device regardless of whether the guest uses INTx or MSI."
>
> So the main purpose seem to be to always use the MSI interrupt source
> regardless of whether the guest is using INTx or MSI. Maybe the
> purpose was to workaround some bugs when using INTx? Or buggy devices
> with INTx interrupts?
>
> qemu-upstream doesn't seem to support it anymore, so I would still
> like to remove it if we get consensus.

The cover letter from
http://old-list-archives.xenproject.org/archives/html/xen-devel/2009-01/msg=
00228.html
"""
This patchset enables MSI-INTx interrupt translation for HVM
domains. The intention of the patch is to use MSI as the physical
interrupt mechanism for passthrough device as much as possible,
thus reducing the pirq sharing among domains.

When MSI is globally enabled, if the device has the MSI capability
but doesn't used by the guest, hypervisor will try to user MSI as
the underlying pirq and inject translated INTx irq to guest
vioapic. When guest itself enabled MSI or MSI-X, the translation
is automatically turned off.

Add a config file option to disable/enable this feature. Also, in
order to allow the user to override the option per device, a
per-device option mechanism is implemented and an MSI-INTx option
is added
"""

It seems like it could be a good idea, but I don't know if it presents
compatibility issues when actually used.

As you say, it's not supported by qemu-upstream, so maybe it should
just be dropped.

Regards,
Jason

