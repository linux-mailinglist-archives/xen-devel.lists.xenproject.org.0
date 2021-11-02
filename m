Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC6644281B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 08:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219711.380669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mho2I-0003ju-9Z; Tue, 02 Nov 2021 07:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219711.380669; Tue, 02 Nov 2021 07:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mho2I-0003hz-6L; Tue, 02 Nov 2021 07:16:46 +0000
Received: by outflank-mailman (input) for mailman id 219711;
 Tue, 02 Nov 2021 07:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7LG=PV=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1mho2G-0003hW-P9
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 07:16:44 +0000
Received: from mail-il1-x134.google.com (unknown [2607:f8b0:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b37a1ff3-e48d-40e6-b34e-6399f7922851;
 Tue, 02 Nov 2021 07:16:43 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id h23so7419739ila.4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Nov 2021 00:16:42 -0700 (PDT)
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
X-Inumbo-ID: b37a1ff3-e48d-40e6-b34e-6399f7922851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f+Wh1jTF/T22Wugki61qznXHNVr7NIVzBbfgHhFKdLk=;
        b=GXHPwLbxndzMD3YIPrRd5Lgf7dKYYPryGpg2qTWrCoFiA1dDMkmMUKBLEvJ9lW78r8
         mua6ZCUzRgc9vKJMEFRlDbfpfXwrlwL4/zepF7bhK2m7LzlnjTS3muPY7PYXI6Kchj5X
         IPbPIvYROAQN+hMKR4MCw5TlAa/xR6W8mxXQLl1+j60LsXQp/cNeYGjbmlMApgYONfY1
         Jt4jDWr82x5egCuDaKWke1WkxI9UmXWeiDIDp7Mxrdvs33c6pjLmdi+2XVCpz1kx9KH6
         lbqkeZ3gmR//GOORaWATymzKVH982Gre6W3J2FZ2IyteJtW/sN7rXX6snZV/29DwqAgj
         /gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f+Wh1jTF/T22Wugki61qznXHNVr7NIVzBbfgHhFKdLk=;
        b=bM/sLdGzBvGPUClfdkGP5f6xYmQfF4SsgGsg70wYLO/FZXWdPu5kE0Nm4MduWGI/9e
         zeq8Y6lNQZxdRZlWaqBFHViLkHYMzXTEsNi88T/5rKBINRM+fEQDFDWjNQzTTlLs8Che
         4vcYgVqBVwycInAJYv+a5QRhk4v2I7lw6rSjwxzAmUYE2Bo1iURl8Qg7GvcsG5+wB2q/
         TeHO7ytNF1FwLJJxCcicZTdyoBxzGVNlbdvdE4HIVC3ikImlKX2krvJn871CMFZFh1E2
         ryN4tjeU428Ou7l+oYz4NyrZ5mYM9fqJSY0+AeONy3ftEP6tIS1esfyBRKzn/D0VbGw1
         Z10A==
X-Gm-Message-State: AOAM530dyVcDZ6f3R2Tjsly+q1R2GblHcYb/ryQtS724GoIMtkJ23+3Z
	l1bluOvTmid+rmJt16B3yg36Dee8vv17a06yw04=
X-Google-Smtp-Source: ABdhPJzdYVf3NCZz9aljEeBBsZk80TmOv67jvMtIO4O2LcFjSaZspk8JI7V1L7RXLzAT9g5fcR+J0kZ+xb1Ng5kxNhw=
X-Received: by 2002:a05:6e02:1402:: with SMTP id n2mr24008411ilo.208.1635837401784;
 Tue, 02 Nov 2021 00:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com> <alpine.DEB.2.21.2111011330310.20134@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2111011330310.20134@sstabellini-ThinkPad-T480s>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Nov 2021 17:16:15 +1000
Message-ID: <CAKmqyKOJgYbb_pgd8CPH90yPVcEHBU9J65URw7CUA_unyw6gBw@mail.gmail.com>
Subject: Re: Arch-neutral name for hardware interrupt support
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jane Malalane <jane.malalane@citrix.com>, Bobby Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Bertrand.Marquis@arm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021 at 6:33 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> +Bertrand
>
> On Mon, 1 Nov 2021, Andrew Cooper wrote:
> > Hello,
> >
> > On ARM, the GIC is a hard prerequisite for VMs.
> >
> > I can't remember what the state of RISCV is, but IIRC there is still
> > some debate over how interrupts are expected to work under virt.

We are getting there, the current draft is pretty stable:
https://github.com/riscv/riscv-aia/

> >
> > On x86, the story is very different.  PV have no hardware assistance,
> > while HVM hardware assistance depends on hardware support.  Therefore we
> > want to introduce a new CDF flag so we can control the setting per
> > domain, rather than globally as it is done now.
> >
> > This brings us to the question of what a suitable architecture name
> > would be.
> >
> > Hardware Virtual Interrupts is a little too close to Hardware Virtual
> > (Machine) Introspection, and Hardware Assisted Interrupts (mirroring
> > HAP) doesn't seem great either.
> >
> > Thoughts / ideas / suggestions?
>
> Maybe "hardware-enabled virtualized interrupts"

hardware-supported virtualised interrupts (HSV Interrupts)

Alistair

