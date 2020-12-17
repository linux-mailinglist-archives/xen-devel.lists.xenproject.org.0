Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE622DD64B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 18:34:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56071.97882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpxAs-0000O6-Kf; Thu, 17 Dec 2020 17:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56071.97882; Thu, 17 Dec 2020 17:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpxAs-0000Nj-Gt; Thu, 17 Dec 2020 17:34:46 +0000
Received: by outflank-mailman (input) for mailman id 56071;
 Thu, 17 Dec 2020 17:34:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYxM=FV=canonical.com=guilherme.piccoli@srs-us1.protection.inumbo.net>)
 id 1kpxAr-0000Ne-1g
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 17:34:45 +0000
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d86692f-2b8e-4c7f-8d85-a5e1a5a3295a;
 Thu, 17 Dec 2020 17:34:44 +0000 (UTC)
Received: from mail-ej1-f69.google.com ([209.85.218.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <guilherme.piccoli@canonical.com>) id 1kpxAp-0001SS-Dx
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 17:34:43 +0000
Received: by mail-ej1-f69.google.com with SMTP id d19so6989055ejo.18
 for <xen-devel@lists.xenproject.org>; Thu, 17 Dec 2020 09:34:43 -0800 (PST)
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
X-Inumbo-ID: 1d86692f-2b8e-4c7f-8d85-a5e1a5a3295a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPFRd5wk7DzLoWCgRoXY8TxuOzCkUgHlVxVwC36uc/k=;
        b=reQh+/t2ClTa63KUOcPRxsUTDGrCbvBaGKVhDED48cVvAcDnGYjLKK9DlwzH8AZyDw
         cl7jueFJPGAb2ul3iNP/N5tFq5tDVCS/yv9AY8xwv3oxX0FuYj7c9B5Zvr2yOUf6AhVV
         1XpMa64cmgdLzHL/MQ1YkpbK52JUoe23PSCB2LK8TubXKHTZxFGKahIc1Jlf3zMxCotx
         Yuc6nd9RGJI9/Hluruds9era9oBr8yXvvJUsWFkVuI3KMS2GJNmHpKj92bV9o+Hsqfcc
         l6POxOJus8zcJVsMXkc6jDkz2T7ShH4VbVU/gAHE+jNFT6AI8V1YgSDfNghpZQ1TgMei
         GS4g==
X-Gm-Message-State: AOAM531fB3vDrvvk8Vm23I8Bj+kP6S50VsjURZboO3y65H3S+YOWzdSH
	ARyU2gTNSKK9IrpxSNITsfZFJFKQi63QKdRsWs0fR0BpiJO1hiObuahijJoTGbwnm0Q4bAujfiV
	24YbV/qtp0GEIIYm/woacs+/+AtlxGDNjmq/P3g1T6zETZe7jpFoO1UaKOv51
X-Received: by 2002:a17:906:af49:: with SMTP id ly9mr109284ejb.38.1608226483104;
        Thu, 17 Dec 2020 09:34:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJkOCJR6Gowu5dIgYxfW5ocfxx7MhUz7e1MdKgnL5q38tShG3Uwa7Kq9s8kzjXXNOPRBmcnzKU85/lj+6LuhI=
X-Received: by 2002:a17:906:af49:: with SMTP id ly9mr109263ejb.38.1608226482844;
 Thu, 17 Dec 2020 09:34:42 -0800 (PST)
MIME-Version: 1.0
References: <87h7oudcbx.fsf@vps.thesusis.net> <CAHD1Q_zcruQ6KVHApvhb=0+mG0m80T+tmg1UzjQBki8j+aR51A@mail.gmail.com>
 <87czzcdtir.fsf@vps.thesusis.net>
In-Reply-To: <87czzcdtir.fsf@vps.thesusis.net>
From: "Guilherme G. Piccoli" <guilherme.piccoli@canonical.com>
Date: Thu, 17 Dec 2020 14:34:07 -0300
Message-ID: <CAHD1Q_z+WW36rfr1RAFYKjU5bocA90OonBmSKECRnpacvWyPmQ@mail.gmail.com>
Subject: Re: kexec not working in xen domU?
To: Phillip Susi <phill@thesusis.net>
Cc: kexec mailing list <kexec@lists.infradead.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 5:25 PM Phillip Susi <phill@thesusis.net> wrote:
> The regular xen cosole should work for this shouldn't it?  So
> earlyprintk=hvc0 I guess?  I also threw in console=hvc0 and loglevel=7:
>
> [  184.734810] systemd-shutdown[1]: Syncing filesystems and block
> devices.
> [  185.772511] systemd-shutdown[1]: Sending SIGTERM to remaining
> processes...
> [  185.896957] systemd-shutdown[1]: Sending SIGKILL to remaining
> processes...
> [  185.901111] systemd-shutdown[1]: Unmounting file systems.
> [  185.902180] [1035]: Remounting '/' read-only in with options
> 'errors=remount-ro'.
> [  185.990634] EXT4-fs (xvda1): re-mounted. Opts: errors=remount-ro
> [  186.002373] systemd-shutdown[1]: All filesystems unmounted.
> [  186.002411] systemd-shutdown[1]: Deactivating swaps.
> [  186.002502] systemd-shutdown[1]: All swaps deactivated.
> [  186.002529] systemd-shutdown[1]: Detaching loop devices.
> [  186.002699] systemd-shutdown[1]: All loop devices detached.
> [  186.002727] systemd-shutdown[1]: Stopping MD devices.
> [  186.002814] systemd-shutdown[1]: All MD devices stopped.
> [  186.002840] systemd-shutdown[1]: Detaching DM devices.
> [  186.002974] systemd-shutdown[1]: All DM devices detached.
> [  186.003017] systemd-shutdown[1]: All filesystems, swaps, loop
> devices, MD devices and DM devices detached.
> [  186.168475] systemd-shutdown[1]: Syncing filesystems and block
> devices.
> [  186.169150] systemd-shutdown[1]: Rebooting with kexec.
> [  186.418653] xenbus_probe_frontend: xenbus_frontend_dev_shutdown:
> device/vbd/5632: Initialising != Connected, skipping
> [  186.427377] kexec_core: Starting new kernel
>

Hm..not many prints, either earlyprintk didn't work, or it's a really
early boot issue. Might worth to investigate if it's not a purgatory
issue too - did you try to use the ""new"" kexec syscall, by running
"kexec -s -l" instead of just "kexec -l" ?
Also, worth to try that with upstream kernel and kexec-tools - I
assume you're doing that already?

Cheers,


Guilherme

