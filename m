Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4884EEE78
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 15:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297404.506610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHf5-0004Ie-4u; Fri, 01 Apr 2022 13:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297404.506610; Fri, 01 Apr 2022 13:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHf5-0004G3-1s; Fri, 01 Apr 2022 13:49:59 +0000
Received: by outflank-mailman (input) for mailman id 297404;
 Fri, 01 Apr 2022 13:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AW7G=UL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1naHf3-0004Fx-Uy
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 13:49:57 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d95675c-b1c2-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 15:49:56 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id 5so5096557lfp.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Apr 2022 06:49:56 -0700 (PDT)
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
X-Inumbo-ID: 9d95675c-b1c2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+UjquPGwFGeqwBCb89WBL58YtOG7MMP1lqm5Lsl5SDI=;
        b=L5A0O7TEbaLtciBNfvyE8wAwyB5iLGqjgF9ks9SQzE8qXCg+y0WJ/kz2kA2u0BbEft
         4QgYrjPCZ4KCokQW+GRPWBFVGdC/nsu55VRzmAbZ7UrB97b63Cf9BT7JwgpiVOw7v6uX
         tndcrIRkzRKU79d1L2cywN9bZH12QBhDEXdvcfMk+cfTfLdmY694SW2IAF7jxp4YSuqV
         H4ghKXQSIUtl5fKUF6SJZtm7eHWkaaaa9YHc2Hegqq8U03PTdd7b2Sxx1NoVnJSZQvDw
         36yssT1PfGLwrzf7/IDBv9PdjHcePe/X/DFLm46sdi0N3UK4oysuz2gOPI8aa3YE03es
         7Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+UjquPGwFGeqwBCb89WBL58YtOG7MMP1lqm5Lsl5SDI=;
        b=PT24UyJv8V9KNxXYRACUUn6ylaXxGOmBTWo//YEijc9L2kjFyeULOrgUwLvftO3+6h
         ItCwTquv4piwY9GQKyxgVhkpb2kdtLrrzHDlgeY/V2PeqREEsoxn9CC8/gJ4RJqtFtL3
         7c9vHFnsO3S1vkSGbT3nYtkD9TDF7j5MLOcAbVn6acgJm61UQmdydaWxvYINvsJ/j0N9
         xiNT9rOpsCizM4MNnDRFZ0HK1amQiLKzZ8PP80zPFO66bp9/ygMqTmp2WLxxey06/Fq2
         Pe6waCo42xezx59tbty9xf46f1uxZ0xszt/FPTd8SGoQ2pBMTvXLgECUCpb+hcxss5wJ
         +lJg==
X-Gm-Message-State: AOAM531ilQZx1r/nRvjJp92rKzH4WQvKafsk9UK0h/OfNqwEzFGPUhGU
	XV9ELSTsBj5k8AFV3cdkqhFbdwjtY3w264SEjGI=
X-Google-Smtp-Source: ABdhPJyMLbS0P7Ni/ivW/xJ8aVi3h3jMAv1txZ+yu0lzm/nIfcakK1WfLyfjbni6paaBYnrMulkDdV6eEcXJSd8SlaE=
X-Received: by 2002:a05:6512:11cc:b0:44a:5770:7425 with SMTP id
 h12-20020a05651211cc00b0044a57707425mr13614617lfr.406.1648820996182; Fri, 01
 Apr 2022 06:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com> <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
 <d13f08dd-6575-6215-80e5-9d5b2c85b923@netscape.net> <c60f8789-d91a-3076-41a4-25c2fb07fae8@netscape.net>
In-Reply-To: <c60f8789-d91a-3076-41a4-25c2fb07fae8@netscape.net>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 1 Apr 2022 09:49:44 -0400
Message-ID: <CAKf6xpshJAy0P4v9uhNTd-U6boivfq-yqBb3Yo02mSQnvUxRCw@mail.gmail.com>
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 1, 2022 at 9:41 AM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>
> On 4/1/22 9:21 AM, Chuck Zmudzinski wrote:
> > On 3/30/22 2:45 PM, Jason Andryuk wrote:
> >> On Fri, Mar 18, 2022 at 4:13 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
> >>>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
> >>>> opregion to the guest but libxl does not grant the guest permission to
> >>>> access the mapped memory region. This results in a crash of the
> >>>> i915.ko
> >>>> kernel module in a Linux HVM guest when it needs to access the IGD
> >>>> opregion:
> >>>>
> >>>> Oct 23 11:36:33 domU kernel: Call Trace:
> >>>> Oct 23 11:36:33 domU kernel:  ? idr_alloc+0x39/0x70
> >>>> Oct 23 11:36:33 domU kernel: drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
> >>>> Oct 23 11:36:33 domU kernel: drm_reset_vblank_timestamp+0x5b/0xd0
> >>>> [drm]
> >>>> Oct 23 11:36:33 domU kernel:  drm_crtc_vblank_on+0x7b/0x130 [drm]
> >>>> Oct 23 11:36:33 domU kernel:
> >>>> intel_modeset_setup_hw_state+0xbd4/0x1900 [i915]
> >>>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
> >>>> Oct 23 11:36:33 domU kernel:  ? ww_mutex_lock+0x15/0x80
> >>>> Oct 23 11:36:33 domU kernel: intel_modeset_init_nogem+0x867/0x1d30
> >>>> [i915]
> >>>> Oct 23 11:36:33 domU kernel:  ? gen6_write32+0x4b/0x1c0 [i915]
> >>>> Oct 23 11:36:33 domU kernel:  ? intel_irq_postinstall+0xb9/0x670
> >>>> [i915]
> >>>> Oct 23 11:36:33 domU kernel:  i915_driver_probe+0x5c2/0xc90 [i915]
> >>>> Oct 23 11:36:33 domU kernel:  ?
> >>>> vga_switcheroo_client_probe_defer+0x1f/0x40
> >>>> Oct 23 11:36:33 domU kernel:  ? i915_pci_probe+0x3f/0x150 [i915]
> >>>> Oct 23 11:36:33 domU kernel:  local_pci_probe+0x42/0x80
> >>>> Oct 23 11:36:33 domU kernel:  ? _cond_resched+0x16/0x40
> >>>> Oct 23 11:36:33 domU kernel:  pci_device_probe+0xfd/0x1b0
> >>>> Oct 23 11:36:33 domU kernel:  really_probe+0x222/0x480
> >>>> Oct 23 11:36:33 domU kernel:  driver_probe_device+0xe1/0x150
> >>>> Oct 23 11:36:33 domU kernel:  device_driver_attach+0xa1/0xb0
> >>>> Oct 23 11:36:33 domU kernel:  __driver_attach+0x8a/0x150
> >>>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
> >>>> Oct 23 11:36:33 domU kernel:  ? device_driver_attach+0xb0/0xb0
> >>>> Oct 23 11:36:33 domU kernel:  bus_for_each_dev+0x78/0xc0
> >>>> Oct 23 11:36:33 domU kernel:  bus_add_driver+0x12b/0x1e0
> >>>> Oct 23 11:36:33 domU kernel:  driver_register+0x8b/0xe0
> >>>> Oct 23 11:36:33 domU kernel:  ? 0xffffffffc06b8000
> >>>> Oct 23 11:36:33 domU kernel:  i915_init+0x5d/0x70 [i915]
> >>>> Oct 23 11:36:33 domU kernel:  do_one_initcall+0x44/0x1d0
> >>>> Oct 23 11:36:33 domU kernel:  ? do_init_module+0x23/0x260
> >>>> Oct 23 11:36:33 domU kernel:  ? kmem_cache_alloc_trace+0xf5/0x200
> >>>> Oct 23 11:36:33 domU kernel:  do_init_module+0x5c/0x260
> >>>> Oct 23 11:36:33 domU kernel: __do_sys_finit_module+0xb1/0x110
> >>>> Oct 23 11:36:33 domU kernel:  do_syscall_64+0x33/0x80
> >>>> Oct 23 11:36:33 domU kernel: entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >>> The call trace alone leaves open where exactly the crash occurred.
> >>> Looking at 5.17 I notice that the first thing the driver does
> >>> after mapping the range it to check the signature (both in
> >>> intel_opregion_setup()). As the signature can't possibly match
> >>> with no access granted to the underlying mappings, there shouldn't
> >>> be any further attempts to use the region in the driver; if there
> >>> are, I'd view this as a driver bug.
> >> Yes.  i915_driver_hw_probe does not check the return value of
> >> intel_opregion_setup(dev_priv) and just continues on.
> >>
> >> Chuck, the attached patch may help if you want to test it.
> >>
> >> Regards,
> >> Jason
> >
> > I tested the patch - it made no noticeable difference.I still
> > get the same crash and call trace with the patch. Actually,
> > the call trace I posted here is only the first of three call
> > traces, and I still see all three call traces with the patch.

Thanks for testing.  Sorry it didn't help.

> It is probably necessary to patch intet_opregion_setup to
> return from it with an error sooner if the goal is to suppress
> the call traces that occur when the driver cannot access
> the opregion.

It looks correct for 5.17 running in your domU.  I thought the
opregion signature check would fail.  A failure in
intel_opregion_setup would percolate up through i915_driver_hw_probe
to i915_driver_probe.  In i915_driver_probe the error should goto
out_cleanup_mmio and skip intel_modeset_init_nogem which is in your
backtrace.

Regards,
Jason

