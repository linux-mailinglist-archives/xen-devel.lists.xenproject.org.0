Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3604F9DB5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 21:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301762.515039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncuO1-0005sk-1E; Fri, 08 Apr 2022 19:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301762.515039; Fri, 08 Apr 2022 19:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncuO0-0005qB-Te; Fri, 08 Apr 2022 19:35:12 +0000
Received: by outflank-mailman (input) for mailman id 301762;
 Fri, 08 Apr 2022 19:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K+qN=US=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ncuNz-0005q2-CC
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 19:35:11 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffc1beb8-b772-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 21:35:08 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so3971042lfb.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Apr 2022 12:35:08 -0700 (PDT)
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
X-Inumbo-ID: ffc1beb8-b772-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e+Zs/fygwfY5AW0hm60Mi1+uIO7asaNlIHJq4/TS9t8=;
        b=iunr/26cun0ZMag9yzLRwb4PSZN+zZIaF1uGgDyiE83Sgr5YPsA+2IiT9kqWhOkU/+
         hkWxQKmCpTCq7rDPjFPczAnlSFqaNenSrKwJpVCLq3Ig9akH+y4C8HQAlftV3pUhdnJk
         6jfZhYTqoaWZvp10ovqqpvP5/Kugs1K2FiwCuU2t2FaZ2FzIFHYKqcRhXAHCQN1CeMpW
         /JEG/rFYReJcG42cx8EyEzcxKeX1npBWDFRtqG6yYs42//otZlJ3Ghnf6jfPQF4O3FOH
         U+aoUlkhR5EhKgJqjZ5W2HINxwFd6+e5CXdmMkqzuWztlBDpFsI2WVgzKSNUy346B1cO
         iYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e+Zs/fygwfY5AW0hm60Mi1+uIO7asaNlIHJq4/TS9t8=;
        b=YMJ087xmmIwWAqXT6ZDbh700r4X7KLSH0BSU2cH77wOKpwK5mGx1F4hKtk8A6kYnCo
         GC30fzlctKbuxzcaNRwTHG31El3Z1yo0JuTuiM0uFZeKE8o/94LoKJznXkYrjA7/elve
         aIuYhvR6394LihQgM6izflNH8J54BR8bTaRJayJNZHOtrPYWtZ861+V66nldLk9FU4HL
         uaRaJzIhEx+A2lSmL9ifNBohSj7EDiuHUFRArBf5wQ9J/NpRjbDceO5Ex5g7XDHDgFPf
         rGOHOh8XZpLxYpBFSb+yrI/sPhwFxGgR/BJYQ6UWqymsOskHWDjfoYVglgo0Jj2K5++C
         T95A==
X-Gm-Message-State: AOAM531y06FeF2qeyBaXZSx+pbhdglbSDkHMX12vU7SK00YWx6pOIcK7
	GsPr7RgzgTTZJuH1qtK3ds8A5W9xmAYb14ZD0xU=
X-Google-Smtp-Source: ABdhPJzR0CWmPnQrY0OZPD34pcR+T1eWU47AHJUZphi47OFxdy3jQs8qvUY/uvYT/Z772q07qmBr752sBbmj8qtI/Ic=
X-Received: by 2002:a19:520e:0:b0:464:f639:9d8b with SMTP id
 m14-20020a19520e000000b00464f6399d8bmr5903846lfb.388.1649446508133; Fri, 08
 Apr 2022 12:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220330194656.39051-1-jandryuk@gmail.com> <YlBNGCXm+wh2v7Yr@perard.uk.xensource.com>
In-Reply-To: <YlBNGCXm+wh2v7Yr@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 8 Apr 2022 15:34:56 -0400
Message-ID: <CAKf6xpvnm5Qh4D3A7j4PiXhds2mymWhsDdrguuxZH3f+T_QEsw@mail.gmail.com>
Subject: Re: [PATCH] libxl: Retry QMP PCI device_add
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 10:56 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Wed, Mar 30, 2022 at 03:46:56PM -0400, Jason Andryuk wrote:
> > PCI device assignment to an HVM with stubdom is potentially racy.  First
> > the PCI device is assigned to the stubdom via the PV PCI protocol.  Then
> > QEMU is sent a QMP command to attach the PCI device to QEMU running
> > within the stubdom.  However, the sysfs entries within the stubdom may
> > not have appeared by the time QEMU receives the device_add command
> > resulting in errors like:
> >
> > libxl_qmp.c:1838:qmp_ev_parse_error_messages:Domain 10:Could not open '/sys/bus/pci/devices/0000:00:1f.3/config': No such file or directory
> >
> > This patch retries the device assignment up to 10 times with a 1 second
> > delay between.  That roughly matches the overall hotplug timeout.
> >
> > The qmp_ev_parse_error_messages error is still printed since it happens
> > at a lower level than the pci code controlling the retries.  With that,
> > the "Retrying PCI add %d" message is also printed at ERROR level to
> > clarify what is happening.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > @@ -1252,10 +1258,22 @@ static void pci_add_qmp_device_add_cb(libxl__egc *egc,
> >                                        const libxl__json_object *response,
> >                                        int rc)
> >  {
> > -    EGC_GC;
> >      pci_add_state *pas = CONTAINER_OF(qmp, *pas, qmp);
> > +    STATE_AO_GC(pas->aodev->ao);
>
> I think this changes are wrong, what is the reason to use STATE_AO_GC
> instead of EGC_GC?
> I think in this case, it is fine to keep using EGC_GC, as there doesn't
> seems to be any allocation that needs to live after this function
> returns. And you could just pass `pas->aodev->ao` to
> libxl__ev_time_register_rel().

Yes, I think you are correct.  I think I made this change to use a
libxl macro to declare the local ao variable, but as you say that is
not needed.

> >
> > -    if (rc) goto out;
> > +    if (rc) {
> > +        if (pas->retries++ < 10) {
> > +            LOGD(ERROR, qmp->domid, "Retrying PCI add %d", pas->retries);
> > +            rc = libxl__ev_time_register_rel(ao, &pas->timeout_retries,
> > +                                             pci_add_qmp_device_add_retry,
> > +                                             1000);
> > +            if (rc) goto out;
> > +
> > +            return; /* wait for the timeout to then retry */
> > +        } else {
> > +            goto out;
> > +        }
> > +    }
>
> So this retry logic would be done regardless of whether stubdom is in
> use or not. It's not going to be useful in the non-stubdom case, is it?

Yes, it should not be applicable for non-stubdom since the sysfs
entries should already be present.

> When adding a pci device to a domain that has its device model in a
> stubdomain, there's a first call to do_pci_add() which works fine,
> right? Then there's a callback to device_pci_add_stubdom_wait(), which
> is supposed to wait for the stubdom to be ready, but the sysfs entry
> might still be missing at that time, right? Then, there is a second call
> to do_pci_add() for the guest, and it's the one that fail in your case,
> right?

Yes, I think that is all correct.

> If my reasoning is correct, could we enable the retry logic only for the
> second do_pci_add() call? So that guests without stubdom aren't impacted
> as I don't think retrying in this case would be useful and would just
> delay the error.

That should be possible.  Instead of differentiating between the
do_pci_add invocation, I'm thinking pci_add_qmp_device_add_cb would
gain a stubdom check:

if (rc) {
    /* Retry only applicable for HVM with stubdom. */
    if (libxl_get_stubdom_id(CTX, domid) == 0)
        goto out;
    /* retry logic */
}

I just noticed that pci_add_qmp_device_add() registers the
pci_add_timeout, and pci_add_qmp_device_add_retry() calls back into
pci_add_qmp_device_add().  I expected a single 10 second timeout
across all the entire add operation, but the retry logic is
re-registering it.  The duplicate registration may also be corrupting
lists?  I plan to move the pci_add_timeout registration into
do_pci_add()

I went with 10 retries of 1 second each since that matches the
sleep(1) loop patch coming out of OpenXT.  It seems like it could be
optimized, but trying for longer and succeeding seems better than
shorter and failing.

Thanks,
Jason

