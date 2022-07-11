Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21DD570734
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 17:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365256.595374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAvSD-00082G-CL; Mon, 11 Jul 2022 15:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365256.595374; Mon, 11 Jul 2022 15:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAvSD-000805-95; Mon, 11 Jul 2022 15:36:09 +0000
Received: by outflank-mailman (input) for mailman id 365256;
 Mon, 11 Jul 2022 15:36:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfPE=XQ=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1oAvSB-0007zx-7m
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 15:36:07 +0000
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d9dd9c4-012f-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 17:36:06 +0200 (CEST)
Received: by mail-ed1-f51.google.com with SMTP id fd6so6731983edb.5
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jul 2022 08:36:06 -0700 (PDT)
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
X-Inumbo-ID: 2d9dd9c4-012f-11ed-924f-1f966e50362f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jm527PWGKrFyLtMs1rIk0OXlRvMiCuSZcQb4xJE6qXc=;
        b=Vpm8MaCD5r16iKvWOa1vIaQpARNyf7MLE+JaOGVltw22G5ZrH/aydCgHIT9Yst6z6i
         GqBT7hA5vuAS2HoEwqTK1W6oWh4JXrPsGeXLZUxfrlCHo2kPu008/msawoujWNTLHr+A
         ZBLennmZfqsYQTONyEc8942xFPjVCOvHsm17ixZIJQ2Lx01ZrLPEX5yTV3fsuHLMVAiO
         UP3AVbXLnvDXY4CKXqpeqRhPTdEtuzHkOoG1wXEoKQFqS2UIHfXH1jtuBPjK0mK3beUL
         L+1lKTG4S1mAV8L95ZsUd+HAT9oq4oXNbR+3CqGAHAaN2iQLlC4QpdUurHOw3kWOC7u/
         Fc/Q==
X-Gm-Message-State: AJIora9SdNki3Uh/UZW6H5o6RMv5ZGBkrVfs3pB7SqWHMZkCVvxFfrl2
	6fl1LU9Qd4mgIkRHoNGCGMBI905fV1vJSiIvvXA=
X-Google-Smtp-Source: AGRyM1vQgo4AKLh0jeJiN9pSgDVPwuQD7wnhTSDPFEHLMrkL04nkUAEyNSN7LccUu9dkurwFm1Y5kRiIk1RjpHzQF2k=
X-Received: by 2002:a05:6402:11d1:b0:43a:8c33:f549 with SMTP id
 j17-20020a05640211d100b0043a8c33f549mr25800419edw.354.1657553765546; Mon, 11
 Jul 2022 08:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220711103847.21276-1-anthony.perard@citrix.com> <490ef2d3-98e3-42f9-84e9-cf2122b14472@suse.com>
In-Reply-To: <490ef2d3-98e3-42f9-84e9-cf2122b14472@suse.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Mon, 11 Jul 2022 23:35:53 +0800
Message-ID: <CAKhsbWanTngsCF3p5QDEF0RtWhA95HovJqE=H047HoN0hfz-CA@mail.gmail.com>
Subject: Re: [XEN PATCH] libxl: Check return value of libxl__xs_directory in name2bdf
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 11, 2022 at 7:03 PM Juergen Gross <jgross@suse.com> wrote:
>
> On 11.07.22 12:38, Anthony PERARD wrote:
> > libxl__xs_directory() can potentially return NULL without setting `n`.
> > As `n` isn't initialised, we need to check libxl__xs_directory()
> > return value before checking `n`. Otherwise, `n` might be non-zero
> > with `bdfs` NULL which would lead to a segv.
> >
> > Reported-by: "G.R." <firemeteor@users.sourceforge.net>
> > Fixes: 57bff091f4 ("libxl: add 'name' field to 'libxl_device_pci' in the IDL...")
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Hi Anthony,

I can confirm that the change fixed the segment fault issue I observed
on 4.16.1 release.

However, the behavior is still not entirely clean after the fix. But
that's probably a separate issue.
I have two devices assigned to pckback through kernel command-line.
When I attempted to use pci-assignable-remove on the SSD that caused
me a lot of trouble, it fails on the first attempt but works fine
later...
root@gaia:~# xl pci-assignable-list
0000:00:17.0
0000:05:00.0
root@gaia:~# xl pci-assignable-remove 05:00.0
libxl: error: libxl_pci.c:906:libxl__device_pci_assignable_remove:
failed to de-quarantine 0000:05:00.0
root@gaia:~# xl pci-assignable-list
0000:00:17.0
0000:05:00.0
root@gaia:~# xl pci-assignable-add 05:00.0
libxl: warning: libxl_pci.c:802:libxl__device_pci_assignable_add:
0000:05:00.0 already assigned to pciback
root@gaia:~# xl pci-assignable-list
0000:00:17.0
0000:05:00.0
root@gaia:~# xl pci-assignable-remove 05:00.0
root@gaia:~# xl pci-assignable-list
0000:00:17.0
root@gaia:~# xl pci-assignable-add 05:00.0
libxl: warning: libxl_pci.c:822:libxl__device_pci_assignable_add:
0000:05:00.0 not bound to a driver, will not be rebound.
root@gaia:~# xl pci-assignable-list
0000:00:17.0
0000:05:00.0

I'm no longer in a debug environment, so cannot collect more debug
info right now.

Thanks,
G.R.

