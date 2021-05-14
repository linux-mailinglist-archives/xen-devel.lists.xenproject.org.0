Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F4380C99
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 17:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127405.239458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZTO-0008L5-DE; Fri, 14 May 2021 15:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127405.239458; Fri, 14 May 2021 15:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZTO-0008I4-AD; Fri, 14 May 2021 15:11:30 +0000
Received: by outflank-mailman (input) for mailman id 127405;
 Fri, 14 May 2021 15:11:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRnq=KJ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lhZTM-0008Hy-Dq
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 15:11:28 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62292a28-6481-4c80-94a0-501172984c0b;
 Fri, 14 May 2021 15:11:27 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id e11so24716209ljn.13
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 08:11:27 -0700 (PDT)
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
X-Inumbo-ID: 62292a28-6481-4c80-94a0-501172984c0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dzs7MRMo9A8buEh5sBLpY4PovQtIpPtoa7SQSWRHsVY=;
        b=ZmyunJeGSLA5dQeNDTamB5aFmXggZhNUYLe1C/nzWG+R0LKmNAxyE7UfzPdRflAMQv
         0Ac+04szGVx7nrF+GGLCMvA27D4LV9ALjJMeBaxrLXgpOD/hSwer4UcP+XETZWbwBcGO
         kSxdKmNZq0bUSTR/9mX2XEPbpYgoX8LWp8v+1Isk4lqonkDm+oyom9PmT3uu2INTR/b9
         uEyCkRxrJwsjwBaPua0cvB30z8+/1Sb09ZkAGSnah3NsOUbS1D2/BDUcQVHPm1Pg2XSV
         DNd/LLGcfpAZHxgkgEL3hMFQsLP01OsBcXnVTzDoLxMebxM5K1hrGnJ0PPIiE7YoNlwJ
         8wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dzs7MRMo9A8buEh5sBLpY4PovQtIpPtoa7SQSWRHsVY=;
        b=oP02SQukkxUlRpe1HP19QqGmABA52bNeeVbyM1qctc64B4xkjKb3YN+mIyWSrdKcOS
         Nx7K5gGSS6vzBgfuBHGzvy9EzHX5ldffry0IR7YR7B+RuwR53wRI3QpZmJin8XOIXmGJ
         T/IH/BBvyH920zkZVgzNy8sJCs6MPPp1rlkZIecoefATPImaX+qbWR4kq1NSiLs2HbBX
         SzB3YBein06bsz9hDgg0CsWXt2TgWXIqHZvmqyFRbYxJaHtV+XFHZ0xu6vXrxXihHM8I
         EuMNeu1y1kz50icS7pjJO2iQUgG+OHHoObo2pvSpyN9g2MgavVhSKICwS0nlIrW3GKXP
         2NQw==
X-Gm-Message-State: AOAM532zXWoetWUveGv0q96P8GlNvMA/m8yNzEWK41V+tNiNTM3OXHb9
	pnPStuRuPZX/46/bhyWjg+P/KbF7n0RNxEBTTJ0=
X-Google-Smtp-Source: ABdhPJxgmceqpv46lA4a6UawsrEwtRjDxu78SMsYvcGI8+siPNkSPoaqEcBbRAWbdjC6+oZ1TBpD9niWDRG72qcQo2E=
X-Received: by 2002:a2e:9a8b:: with SMTP id p11mr26349892lji.285.1621005086100;
 Fri, 14 May 2021 08:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210514135014.78389-1-roger.pau@citrix.com>
In-Reply-To: <20210514135014.78389-1-roger.pau@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 14 May 2021 11:11:14 -0400
Message-ID: <CAKf6xpsyzazbY_mA0QtAuAqpOPkpuhjrZ1wid0khWy1urh4iBg@mail.gmail.com>
Subject: Re: [PATCH] libelf: improve PVH elfnote parsing
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 9:50 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
>
> Pass an hvm boolean parameter to the elf note parsing and checking
> routines, so that better checking can be done in case libelf is
> dealing with an hvm container.
>
> elf_xen_note_check shouldn't return early unless PHYS32_ENTRY is set
> and the container is of type HVM, or else the loader and version
> checks would be avoided for kernels intended to be booted as PV but
> that also have PHYS32_ENTRY set.
>
> Adjust elf_xen_addr_calc_check so that the virtual addresses are
> actually physical ones (by setting virt_base and elf_paddr_offset to
> zero) when the container is of type HVM, as that container is always
> started with paging disabled.

Should elf_xen_addr_calc_check be changed so that PV operates on
virtual addresses and HVM operates on physical addresses?

I worked on some patches for this a while back, but lost track when
other work pulled me away.  I'll send out what I had, but I think I
had not tested many of the cases.  Also, I had other questions about
the approach.  Fundamentally, what notes and limits need to be checked
for PVH vs. PV?

Regards,
Jason

