Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6062C3E176C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 16:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164387.300672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBeoV-0006Gx-5G; Thu, 05 Aug 2021 14:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164387.300672; Thu, 05 Aug 2021 14:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBeoV-0006EZ-2H; Thu, 05 Aug 2021 14:57:39 +0000
Received: by outflank-mailman (input) for mailman id 164387;
 Thu, 05 Aug 2021 14:57:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z8be=M4=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mBeoU-0006ET-EH
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 14:57:38 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 168205b1-c366-4698-9970-1bc9f7c3dd7b;
 Thu, 05 Aug 2021 14:57:37 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x8so11720201lfe.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Aug 2021 07:57:37 -0700 (PDT)
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
X-Inumbo-ID: 168205b1-c366-4698-9970-1bc9f7c3dd7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XdhcJBdbnjTbb6dPz8nmpWDYDMR4VQL5Pi8Ects9fzY=;
        b=rZzFeb0IYfD3r3/VPGVh6RZTRiygDhX8oj/XnGZ0F/cZ0wSZ1gOwYndVtqUDwiUWvj
         hMH1W259uqNPyL8/kZa6Ev3cx8ble5zRr66mx2/L7AhN/YD8xoefoGAnR7QTTzxtG598
         nNXeqP4mnMcCSpwp6ALUtA9pdw9OL4MxvzwTXMufxWUuDvj96d6sKmRebKz3NtLibWc+
         ixCMuAInYoYfEY6WkdqZdDEk0dWrC9PwiY6Ujqw+6aCnFAWr9B/YUf049H+ucptj6x4Y
         TJqD61zMw5wGy8sE5p/1eZXjdmSi4/LfDLhzMsOManukyMe+ug7wvbf9PPJI7TkBBRjf
         vGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XdhcJBdbnjTbb6dPz8nmpWDYDMR4VQL5Pi8Ects9fzY=;
        b=lVtzvBOI0STfg+wBRGFz26F4fFaehxi1DnRzYoBScahke+KtN+E1xWPIHS9/9ovXqF
         vt+Bab60FQ6Gojn/BrJ7R5xr2LfeZEbwsq6YYlCxx35yCsGxfmjB/7FMXBdiJtY/0CcO
         ewsD2ASYzz0uT76nkoj7R6AKOCTtnLs1jJRtCJWFZ83dE3GjxkE+RARFSoSzN7Xht9Bs
         16hslQzztjYvwxWIvzvkbIYRqesg34r7T4bHfmup+AfuFObPSjAwph1Pu5do/odYoyrw
         jSHxyhUTwwnWrQ9ak5wDOSz3Srs4Dl1Kmjg/secJwu8BPPbXS0Pfs9/EcRNybQqgAG3B
         uX8Q==
X-Gm-Message-State: AOAM53277CW/jl3JVu57+UMI43MgrIWL7VooMjTCPvIH0qcRJW+wRhbn
	lkonI9fmokJ9ROaLPR1XvAMuQkVzgKd99zBWLLA=
X-Google-Smtp-Source: ABdhPJwxTluVKo7z4MS9J1WWc9Yu7vP9pogOfJ5ws5KtzjiLWrXG/DZpOh/po+Fihy47Gf/8/5uTQwxMPP2gLNqtDIc=
X-Received: by 2002:a05:6512:3085:: with SMTP id z5mr4237798lfd.659.1628175456369;
 Thu, 05 Aug 2021 07:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210804221749.56320-1-jandryuk@gmail.com> <cb1b8918-639f-668f-c663-a6392a2d8e1f@suse.com>
In-Reply-To: <cb1b8918-639f-668f-c663-a6392a2d8e1f@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 5 Aug 2021 10:57:24 -0400
Message-ID: <CAKf6xpt3_erJPzG6awZorr+tBi5DyfGRZeeaYACe3v5O=aK7PQ@mail.gmail.com>
Subject: Re: [PATCH] libxl: Fix stubdom PCI passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 5, 2021 at 2:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 05.08.2021 00:17, Jason Andryuk wrote:
> > commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> > reflected in the config"
>
> This should be in a Fixes: tag; whether you fully spell out the
> reference here or instead refer to that tag would by up to you.

Yes, you are correct.  Thanks.

> > broken stubdom PCI passthrough when it moved
> > libxl__create_pci_backend later in the function.  xl pci-attach for a
> > running PV domain may also have been broken, but that was not verified.
> >
> > The stubdomain is running (!starting) and PV, so it calls
> > libxl__wait_for_backend.  With the new placement of
> > libxl__create_pci_backend, the path does not exist and the call
> > immediately fails.
> > libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
> > libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
> > libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
> >
> > The wait is only relevant when the backend is already present.  Use the
> > read on num_devs to decide whether the backend exists and therefore the
> > wait is needed.
>
> But the presence of the node is not an indication of the backend existing,
> is it? libxl__device_pci_add_xenstore() itself writes the node a few lines
> down from your change, so upon processing a 2nd device the function would
> still behave as it does now.

The way this code is written, num_devs is an indicator.  As you say,
it's used to control if the overall backend is created.  When the
backend is created without num_devs, Linux xen-pciback closes the
front/back with "Error reading number of devices".  I also tried
adding a new libxl__create_pci_backend() call which wrote num_devs
"0", but that failed with some error I did not write down.  Although I
may have messed that up by not executing the transaction.

When libxl__device_pci_add_xenstore() runs a second time, the wait is
fine because the backend exists.  I just tested to confirm.  Testing
`xl create` for HVM w/ Linux stubdom and 2 PCI devices shows the
wait's watch trigger for Reconfiguring and Reconfigured before it
settles back to Connected.

The point of the wait is to let the front/back finish any
Reconfiguring for a running domain before a new attachment is
initiated.  If we have to create the backend, then the wait is
unnecessary - a non-existant backend cannot be Reconfiguring.  The
function already changes behavior depending on the num_devs node.
When num_devs doesn't exist, it creates the backend.  That is why I
went with an additional parameter and comment.

Would you like an expansion of the commit message with something like:
"""
The wait is only relevant when the backend is already present.
num_devs is already used to determine if the backend needs to be
created.  Re-use num_devs to determine if the backend wait is
necessary.  The wait is necessary to avoid racing with another PCI
attachment reconfiguring the front/back. If we are creating the
backend, then we don't have to worry about a racing reconfigure.
"""

And having written that, two "1st" `xl pci-attach` could maybe race
for a stubdom since there is no backend?  They would both try to write
the same nodes, so only 1 would take effect.  I guess that is okay.
Non-stubdom takes libxl__lock_domain_userdata(), so it should be okay.

Regards,
Jason

> Jan
>
> >  This restores starting an HVM w/ linux stubdom and PCI
> > passthrough.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > Looks like this should be backported to 4.15, but I have not tested.
> > ---
> >  tools/libs/light/libxl_pci.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> > index 1a1c263080..19daf1d4ee 100644
> > --- a/tools/libs/light/libxl_pci.c
> > +++ b/tools/libs/light/libxl_pci.c
> > @@ -157,8 +157,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
> >      if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
> >          return ERROR_FAIL;
> >
> > -    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> > -        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
> > +    /* wait is only needed if the backend already exists (num_devs != NULL) */
> > +    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> > +        if (libxl__wait_for_backend(gc, be_path,
> > +                                    GCSPRINTF("%d", XenbusStateConnected)) < 0)
> >              return ERROR_FAIL;
> >      }
> >
> >
>

