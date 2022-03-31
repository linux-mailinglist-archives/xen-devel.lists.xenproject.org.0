Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE5E4ED994
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296923.505601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtqJ-0003T9-2C; Thu, 31 Mar 2022 12:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296923.505601; Thu, 31 Mar 2022 12:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtqI-0003RK-VN; Thu, 31 Mar 2022 12:23:58 +0000
Received: by outflank-mailman (input) for mailman id 296923;
 Thu, 31 Mar 2022 12:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR9h=UK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZtqI-0003RE-Ay
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 12:23:58 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fe17455-b0ed-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 14:23:57 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id z12so27394835lfu.10
 for <xen-devel@lists.xenproject.org>; Thu, 31 Mar 2022 05:23:57 -0700 (PDT)
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
X-Inumbo-ID: 6fe17455-b0ed-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xh7d2xCBG8mMbyWdm3KuBhh059/iZ5OHo/vg30SxVLU=;
        b=c3rurIi6U1aeXz+MRwSaGX82gptRqxlL6v89NFsBJwELCXrTJXFkSGOeT+NJ5mGjh7
         CYnskRa4/rOjl8+93EW3kMUjGTFta/7zdTmUh0x6XgRfcwPRlcS0v8/2xbiZUTjY4I5G
         /zchInacJMYwgzS38zO2TFpifL2Qf1qyE8L9N3LE9tTVkEQycHWn78LTQaHe4oAbeBSH
         ZfGaFT+/+835hC/29dtetYdiQoROSLLcph5DLDezO48BG7tq4OYuTDnRladh8l5dhaLx
         hFcFu7toIZi7NVaIBLqSIcjllvl0cmr4g84PtXl/hwFuPk7rScQFFt4tg/hCdETTCT7b
         WfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xh7d2xCBG8mMbyWdm3KuBhh059/iZ5OHo/vg30SxVLU=;
        b=ar4rBczOcY6BIK45ZYjQMHaxX3W2jpTL+TcuG+NcC+wbrSFt9HsJd1lZM+h6gOdnY+
         Dn7oWMc1H+/L4eu+vTr4oCFCsqhwwhqzEnSCA5Xl44krQwxf/vegz4jFBJlUJPcv0b2K
         6oT66RwNpciSKAfElkWzeeXz+EvlAkX2jfMY8oOqrT3dnd9lkPvf5f0qEH+M+e6HtezA
         VjM/hz5OztAvcQLtLMT+OOuMwAkMSglPuknUSFMknWMuS6Lafp1bePerSDgPjWAG+v80
         ce9aP+0TjVNvhcSxJ/AJf0TuUPbLt/FjTpA0JhwPHaHeqSRHBv0WpMeaKwJQ9R0USdet
         qHbQ==
X-Gm-Message-State: AOAM532gB5baPP4UYAyxWvOdaSL98MyNE8oIp9S9ST1N5YUJAuTsUn5h
	ukk+p1MU7AkVDiKnr8r77t+0gXi+99BpP8mHgXY=
X-Google-Smtp-Source: ABdhPJzBv6KJa+6uIlQI7dRQSQ15t7dUAiWb3AEAOXGJlN1WP+Mh18Cn0SZOuxqiAmRPvNW1llO8Jx+WlnZGLS/QFAk=
X-Received: by 2002:a19:d61a:0:b0:43f:1a03:21ee with SMTP id
 n26-20020a19d61a000000b0043f1a0321eemr10807666lfg.152.1648729436794; Thu, 31
 Mar 2022 05:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com> <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
 <59471dea-c379-59a3-9202-384a4ec54a07@netscape.net>
In-Reply-To: <59471dea-c379-59a3-9202-384a4ec54a07@netscape.net>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 31 Mar 2022 08:23:45 -0400
Message-ID: <CAKf6xpsyxDJS36tNmXMrzusKMgi_gGvdvMwncSry_rWB-ZTjZg@mail.gmail.com>
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 12:34 AM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>
> On 3/30/22 2:45 PM, Jason Andryuk wrote:
> > On Fri, Mar 18, 2022 at 4:13 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
> >>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
> >>> opregion to the guest but libxl does not grant the guest permission to
> >>> access the mapped memory region. This results in a crash of the i915.ko
> >>> kernel module in a Linux HVM guest when it needs to access the IGD
> >>> opregion:
> >>>
> >>> Oct 23 11:36:33 domU kernel: Call Trace:
> >>> Oct 23 11:36:33 domU kernel:  ? idr_alloc+0x39/0x70
> >>> Oct 23 11:36:33 domU kernel:  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
> >>> Oct 23 11:36:33 domU kernel:  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
> >>> Oct 23 11:36:33 domU kernel:  drm_crtc_vblank_on+0x7b/0x130 [drm]
> >>> Oct 23 11:36:33 domU kernel:  intel_modeset_setup_hw_state+0xbd4/0x1900 [i915]
> >>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
> >>> Oct 23 11:36:33 domU kernel:  ? ww_mutex_lock+0x15/0x80
> >>> Oct 23 11:36:33 domU kernel:  intel_modeset_init_nogem+0x867/0x1d30 [i915]
> >>> Oct 23 11:36:33 domU kernel:  ? gen6_write32+0x4b/0x1c0 [i915]
> >>> Oct 23 11:36:33 domU kernel:  ? intel_irq_postinstall+0xb9/0x670 [i915]
> >>> Oct 23 11:36:33 domU kernel:  i915_driver_probe+0x5c2/0xc90 [i915]
> >>> Oct 23 11:36:33 domU kernel:  ? vga_switcheroo_client_probe_defer+0x1f/0x40
> >>> Oct 23 11:36:33 domU kernel:  ? i915_pci_probe+0x3f/0x150 [i915]
> >>> Oct 23 11:36:33 domU kernel:  local_pci_probe+0x42/0x80
> >>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
> >>> Oct 23 11:36:33 domU kernel:  pci_device_probe+0xfd/0x1b0
> >>> Oct 23 11:36:33 domU kernel:  really_probe+0x222/0x480
> >>> Oct 23 11:36:33 domU kernel:  driver_probe_device+0xe1/0x150
> >>> Oct 23 11:36:33 domU kernel:  device_driver_attach+0xa1/0xb0
> >>> Oct 23 11:36:33 domU kernel:  __driver_attach+0x8a/0x150
> >>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
> >>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
> >>> Oct 23 11:36:33 domU kernel:  bus_for_each_dev+0x78/0xc0
> >>> Oct 23 11:36:33 domU kernel:  bus_add_driver+0x12b/0x1e0
> >>> Oct 23 11:36:33 domU kernel:  driver_register+0x8b/0xe0
> >>> Oct 23 11:36:33 domU kernel:  ? 0xffffffffc06b8000
> >>> Oct 23 11:36:33 domU kernel:  i915_init+0x5d/0x70 [i915]
> >>> Oct 23 11:36:33 domU kernel:  do_one_initcall+0x44/0x1d0
> >>> Oct 23 11:36:33 domU kernel:  ? do_init_module+0x23/0x260
> >>> Oct 23 11:36:33 domU kernel:  ? kmem_cache_alloc_trace+0xf5/0x200
> >>> Oct 23 11:36:33 domU kernel:  do_init_module+0x5c/0x260
> >>> Oct 23 11:36:33 domU kernel:  __do_sys_finit_module+0xb1/0x110
> >>> Oct 23 11:36:33 domU kernel:  do_syscall_64+0x33/0x80
> >>> Oct 23 11:36:33 domU kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >> The call trace alone leaves open where exactly the crash occurred.
> >> Looking at 5.17 I notice that the first thing the driver does
> >> after mapping the range it to check the signature (both in
> >> intel_opregion_setup()). As the signature can't possibly match
> >> with no access granted to the underlying mappings, there shouldn't
> >> be any further attempts to use the region in the driver; if there
> >> are, I'd view this as a driver bug.
> > Yes.  i915_driver_hw_probe does not check the return value of
> > intel_opregion_setup(dev_priv) and just continues on.
> >
> > Chuck, the attached patch may help if you want to test it.
> >
> > Regards,
> > Jason
>
> Thanks for the patch, I will try it when I get a chance
> and report if it prevents the crash and enables video
> output to my screen. Has your patch been committed
> to Linux? I just checked on the gitlab Linux master
> branch and didn't see it there.

This patch should just make the i915 probe error out properly inside
the domU when the opregion cannot be mapped properly.  It would avoid
trigger the domU trace you posted above, but it wouldn't solve any other
issue.

I have not yet submitted upstream.

Regard,
Jason

