Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CC33EAE19
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 03:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166611.304108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mELu8-0007K3-Lp; Fri, 13 Aug 2021 01:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166611.304108; Fri, 13 Aug 2021 01:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mELu8-0007HU-Ih; Fri, 13 Aug 2021 01:22:36 +0000
Received: by outflank-mailman (input) for mailman id 166611;
 Fri, 13 Aug 2021 01:22:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OsaJ=NE=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mELu6-0007HO-AW
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 01:22:34 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e197710-29b6-41b0-85d4-6545343c3076;
 Fri, 13 Aug 2021 01:22:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id n17so16932144lft.13
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 18:22:32 -0700 (PDT)
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
X-Inumbo-ID: 1e197710-29b6-41b0-85d4-6545343c3076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wmrcw/N71vvTrVh1SBuD/Rt2CzlEcsATYPEQyLT0wfA=;
        b=ZmhhzW4a8yxGCjAx+VqFNb6EL3ZlmtwXeGmE/Uw86Y5Q6eIi4sbm7jtnFHTcxWeKIt
         PpKwjjNW5vn9vTOjTEaPsgSkUqUcjGRl2oVuqxObAYM4US69o4E8UcOT465SVIsSD8dG
         SrtOSeczp8pLgLGcVMlpyDKzKw9m6qkMju+/0PcdboZwkznNzoo7VQCyWKMawWCMmsxS
         btcuWo6F0dIxJ0FP4npsnguSAarSO1M7AyvKfmMSxL1e1ocKAcKH6YZ6VFzB/Iiy9htM
         HWoeN/oFpaIp+1Otu9Ars3B10+d7ZCkvkulxbeCh1mjmCrvNS2vy279rIHNLKf2I/KzW
         uLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wmrcw/N71vvTrVh1SBuD/Rt2CzlEcsATYPEQyLT0wfA=;
        b=bdEpHkzcbs03gK9wz/vhw9hX1Y9OKQ2N5IOQjRe8NCUcAzCIiAkSz5QAO8OtWVg7NR
         L0ic3dJIe0RMC2mgk1wuUIlojjfqIrMkDfYBy/gIycxTj8ACeMjzMwFPs0HwWG3ZmsRQ
         vAjDeE5Js+XacZAG3FszIbnUsiFutvg9YBA0Td2n9155QJDbQtSudfbtRs8qokt++SJJ
         GBGySFBBAOBScdSUUMuWH528NROlh6V4OsrdrxaC0ET/EaNE68+2D7L0s49lCFOWD2G/
         d+xSYYWzFYDBvquQtlCro7xhVn8+caosyuSXEBFXEo+KIeICY8ydyuzJFG78BdNTTDL1
         AYGA==
X-Gm-Message-State: AOAM533z6zLYCEdYPyQm0uJpsyCCXXHTjJ/P+8yy71rtPwM/mcqcp/yQ
	DHCEv9gg9wIAvYWcZzjtYfWB0AH7YiehkPQ1QbY=
X-Google-Smtp-Source: ABdhPJwLnAggYhk4A3b7EkOUVe1xsF76XjE5UBObjnkwpVztezxRnCQIYes94gmTRXnQjLACcqZ5exETHmIlNIaGfO4=
X-Received: by 2002:ac2:4564:: with SMTP id k4mr3777767lfm.150.1628817751971;
 Thu, 12 Aug 2021 18:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210812005700.3159-1-jandryuk@gmail.com> <30354256-4527-d909-8453-28dd384a35dc@suse.com>
 <24853.1026.39229.230658@mariner.uk.xensource.com>
In-Reply-To: <24853.1026.39229.230658@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 12 Aug 2021 21:22:19 -0400
Message-ID: <CAKf6xptUu7hxfmGDWBd50Vy6rESiLvZdaum39YWZX3n0yasVyQ@mail.gmail.com>
Subject: Re: [PATCH v2] libxl: Fix stubdom PCI passthrough
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 12, 2021 at 7:20 AM Ian Jackson <iwj@xenproject.org> wrote:
>
> Jan Beulich writes ("Re: [PATCH v2] libxl: Fix stubdom PCI passthrough"):
> > On 12.08.2021 02:57, Jason Andryuk wrote:
> > > commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
> > > reflected in the config" broken stubdom PCI passthrough when it moved
> > > libxl__create_pci_backend later in the function.  xl pci-attach for a
> > > running PV domain may also have been broken, but that was not verified.
> > >
> > > The stubdomain is running (!starting) and PV, so it calls
> > > libxl__wait_for_backend.  With the new placement of
> > > libxl__create_pci_backend, the path does not exist and the call
> > > immediately fails.
> > > libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
> > > libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
> > > libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices
> > >
> > > The wait is only relevant when the backend is already present.  num_devs
> > > is already used to determine if the backend needs to be created.  Re-use
> > > num_devs to determine if the backend wait is necessary.  The wait is
> > > necessary to avoid racing with another PCI attachment reconfiguring the
> > > front/back. If we are creating the backend, then we don't have to worry
> > > about a racing reconfigure.
> >
> > And why is such a race possible in the first place? If two independent
> > actions are permitted in parallel on a domain, wouldn't there better
> > be synchronization closer to the root of the call tree?

It is possible because pci front/back share the single xenstore state
node but have multiple sub-devices.    "The wait is necessary to avoid
racing with another PCI attachment reconfiguring the front/back" is my
determination after thinking through the code.  xl is poking at the
frontend and backend domains, which are running independently and
their state is not under xl's control.  Connected is the quiescent
state, so it makes sense to wait for it before switching to
Reconfigurating.  That was the old behavior which I am restoring.

> libxl does not have a per-domain lock that would prevent this kind of
> thing.  Individual operations that might malfunction if done
> concurrently are supposed to take appropriate precautions.
>
> I think that this patch is trying to be those precautions.  It's not
> clear to me whether it's correct, though.  I (or another mailntainer)
> will have to look at it properly...

Please do :)

Regards,
Jason

