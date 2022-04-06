Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A8F4F5EEA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 15:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299873.511144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5Qo-0008G8-Uc; Wed, 06 Apr 2022 13:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299873.511144; Wed, 06 Apr 2022 13:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5Qo-0008Dc-Rh; Wed, 06 Apr 2022 13:10:42 +0000
Received: by outflank-mailman (input) for mailman id 299873;
 Wed, 06 Apr 2022 13:10:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vzw=UQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nc5Qn-0008DP-Ho
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 13:10:41 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4db19a2-b5aa-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 15:10:40 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id d5so3979831lfj.9
 for <xen-devel@lists.xenproject.org>; Wed, 06 Apr 2022 06:10:40 -0700 (PDT)
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
X-Inumbo-ID: f4db19a2-b5aa-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Nnm+4SYrJfvah7q1xJFB6IeOVdlM7FcfSEnU8mTnms=;
        b=TfjXKlGre5028SMmQDl+/BBmoiv3A4g0ZlD7ZF/f+/uJeQupxi5E/qabjkm090Pyhj
         5HQ3NwJCLEApnKBgbK/gFQU4+5Evo885WrmOLtEzgEFnzgDwE8Kd1cH2I51kMsfGC/aA
         Fku1tp20Q4iYeQmrp5qzTKQKXvbYGi5Ry/mVutHWEZhi8Vuwg8TStFnEoEIyLGs/5laI
         sHGnMBM1oolNVmtaN7Lh+rJIjILFzBwkXQ4ouYFV6v1ScNsewz3v52WHKdVoJdSrwIvI
         zf5r8yPl4pBicRXHYd+h9FYxd/7/4Yv7Tinuu9lISvXFGLMMfMbIpuQpah/IPm6aZ9ea
         V7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Nnm+4SYrJfvah7q1xJFB6IeOVdlM7FcfSEnU8mTnms=;
        b=3ol3OGkbVPq81Cz6yCdc8ZVv58MAbt91wi1NmtybjGTTJ3Z2BY/cyRuD0kZJGERcTd
         btwCkltjI1KbDxvTIeRaHHNQtynNZnd6lpDiY88efygDEtQzt+m1lil1BdgDP+l3EERf
         ju+OaPJ8FsXq5K21QtPRZkrrHNee9NHQgg3mepiTCt6cvPvHtL6e2hvwkWx64GmNoUyr
         KqjN9aJNTB+WXoelySIuVXrNGf39CH8Qy7xoqgwbVByMCXHToFLhbUPx0oIbDj2rP+/S
         ouRULcjePwgGtLpXcuEDHxGMG3SM3PIIynqvaCLFI9T46nfBFmeqeoXzVnpphA3GTcR6
         lKbg==
X-Gm-Message-State: AOAM5338b6kywRmPKCWrDnIMci7ufNd4MeGvOlT+cyT+75pzcMP7i0wI
	Kj3dz+me7Uk53ydXvZuC5C6HQyLVinfhDMDBp+72j+yA
X-Google-Smtp-Source: ABdhPJzmU2QpBB5ybDTj86tGfQRUM026ZUtZac6NLuhUf7nIr27AO/x4vWWq/9DVU2XxRnNGtWpXCygOcbWal4K6Dsw=
X-Received: by 2002:a05:6512:280c:b0:44a:a844:d7d8 with SMTP id
 cf12-20020a056512280c00b0044aa844d7d8mr6143295lfb.250.1649250639480; Wed, 06
 Apr 2022 06:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com> <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
 <d13f08dd-6575-6215-80e5-9d5b2c85b923@netscape.net> <5d14eeb8-038f-e99a-31b8-f6b3b562c2c4@netscape.net>
In-Reply-To: <5d14eeb8-038f-e99a-31b8-f6b3b562c2c4@netscape.net>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 6 Apr 2022 09:10:27 -0400
Message-ID: <CAKf6xpsNsYM=fHb4DwiLmsH+Nz+0UF5RvjWr=GeYo5d+6Rmi_Q@mail.gmail.com>
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 5, 2022 at 9:31 PM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
> Correction (sorry for the confusion):
>
> I didn't know I needed to replace more than just a
> re-built i915.ko module to enable the patch
> for testing. When I updated the entire Debian kernel
> package including all the modules and the kernel
> image with the patched kernel package, it made
> quite a difference.
>
> With Jason's patch, the three call traces just became a
> much shorter error message:
>
> Apr 05 20:46:18 debian kernel: xen: --> pirq=16 -> irq=24 (gsi=24)
> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: [drm] VT-d active for
> gfx access
> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: vgaarb: deactivate vga
> console
> Apr 05 20:46:18 debian kernel: Console: switching to colour dummy device
> 80x25
> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: [drm] DMAR active,
> disabling use of stolen memory
> Apr 05 20:46:18 debian kernel: resource sanity check: requesting [mem
> 0xffffffff-0x100001ffe], which spans more than Reserved [mem
> 0xfdfff000-0xffffffff]
> Apr 05 20:46:18 debian kernel: caller memremap+0xeb/0x1c0 mapping
> multiple BARs
> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: Device initialization
> failed (-22)
> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: Please file a bug on
> drm/i915; see
> https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs
> for details.
> Apr 05 20:46:18 debian kernel: i915: probe of 0000:00:02.0 failed with
> error -22
> --------------------- End of Kernel Error Log ----------------------
>
> So I think the patch does propagate the error up the
> stack and bails out before producing the Call traces,

Thanks for re-testing.

> and...
>
> I even had output after booting - the gdm3 Gnome display
> manager login page displayed, but when I tried to login to
> the Gnome desktop, the screen went dark and I could
> not even login to the headless Xen Dom0 control domain
> via ssh after that and I just used the reset button on the
> machine to reboot it, so the patch causes some trouble
> with the Dom0 when the guest cannot access the
> opregion. The patch works fine when the guest can
> access the opregion and in that case I was able to
> login to the Gnome session, but it caused quite a bit of
> trouble and apparently crashed the Dom0 or at
> least caused networking in the Dom0 to stop working
> when I tried to login to the Gnome session in the
> guest for the case when the guest cannot access
> the opregion. So I would not recommend Jason's
> patch as is for the Linux kernel. The main reason
> is that it looks like it is working at first with a
> login screen displayed, but when a user tries to login,
> the whole system crashes.

I'm a little surprised you still had output from the VM & display with
the i915 driver not binding.  I guess Linux fell back to another VGA
or Framebuffer driver for the display.

However, locking up the host isn't good.  You didn't happen to catch
any Xen or dom0 output when that happened?

Regards,
Jason

