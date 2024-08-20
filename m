Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61A9957B40
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 03:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779981.1189597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgE7O-0000zE-5S; Tue, 20 Aug 2024 01:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779981.1189597; Tue, 20 Aug 2024 01:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgE7O-0000wx-2S; Tue, 20 Aug 2024 01:57:06 +0000
Received: by outflank-mailman (input) for mailman id 779981;
 Tue, 20 Aug 2024 01:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhUh=PT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sgE7M-0000wr-BM
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 01:57:04 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 791ee140-5e97-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 03:56:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E2C38CE09CB;
 Tue, 20 Aug 2024 01:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C58C32782;
 Tue, 20 Aug 2024 01:56:48 +0000 (UTC)
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
X-Inumbo-ID: 791ee140-5e97-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724119009;
	bh=zD3MBHISFFNfc9rBOTI82+b1FXm6v8IpE2FKbtznSuw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WIqYw1XeNALyeFxJYKlquZ445QVgile/IoCSy4zlgYuhvceqX6B+SOgAx0sgEM+m8
	 lZGGSzOrFM+QIA0m05qsGhABmjX+nCrDLbA4y0Q+yCAODvjHWywtn5UvfivUPEEyXg
	 cx3iuhTzAsWu6pos8R989FKMLsBQCVukz6moSbjS01cuJRxn8K0lqKD4Ec6lLwZX2m
	 McnE8Xqt+62Unvhf6AWHPNkdQ7XqXOdjeZecjnjjWAH3DqiPyOe0DTbp2gF7lVRIQk
	 CSH71ranqUVTLHgGXCJ1x7Q7zwu0pWWwRtFiLHevewF/LwKZbuJhhdxHOpE5qS3Uge
	 lO1rrTp+LoqYA==
Date: Mon, 19 Aug 2024 18:56:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] automation: restore CR filtering
In-Reply-To: <ZsNl7S1JOYQgQx87@l14>
Message-ID: <alpine.DEB.2.22.394.2408191819580.298534@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2408161642220.298534@ubuntu-linux-20-04-desktop> <6d2fbe22-8866-4769-95d0-a5a8613a5936@amd.com> <ZsNl7S1JOYQgQx87@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Aug 2024, Anthony PERARD wrote:
> On Mon, Aug 19, 2024 at 09:21:22AM +0200, Michal Orzel wrote:
> > On 17/08/2024 01:46, Stefano Stabellini wrote:
> > > diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > > index 0666f6363e..ed44aab0f0 100755
> > > --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > > +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > > @@ -65,4 +65,4 @@ export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x4000000
> > >  export QEMU_LOG="smoke.serial"
> > >  export PASSED="${passed}"
> > > 
> > > -./automation/scripts/qemu-key.exp
> > > +./automation/scripts/qemu-key.exp | sed 's/\r//'
> > 
> > I compared 3 pipelines:
> > 1) one before c36efb7fcea6 (https://gitlab.com/xen-project/hardware/xen/-/jobs/7566986885)
> > 2) one after c36efb7fcea6 (https://gitlab.com/xen-project/hardware/xen/-/jobs/7603830706)
> > 3) one with this fix (https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7603783403)
> > 
> > In 1), there is Xen log + Linux log in Gitlab web page
> > In 2), there is no log at all
> > In 3), there is only Xen log visible
> 
> It's nice that you can select uboot/Xen logs or Linux logs based on the
> number of '\r' at the end of a line (output cat -A):
>     U-Boot 2023.01+dfsg-2+deb12u1 (Apr 18 2024 - 22:00:21 +0000)^M^M$
>     (XEN) [    0.013864] Xen version 4.20-unstable (root@) (gcc (Alpine 12.2.1_git20220924-r10) 12.2.1 20220924) debug=n Sat Aug 17 00:54:57 UTC 2024^M^M$
>     [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd070]^M^M^M$
> 
> But to display to GitLab's job logs, we want: sed 's/\r\+$//'
> 
> Also, do you have to edit every single script to overcome a shortcoming
> from the "expect" script? Can't you write a bit of Tcl and edit the line
> in the script instead?

The sed route is not perfect but it works :-)

I did try using expect but the logs were mangled. I think I missed that
there can be multilple \r. I managed to get close to the wanted behavior
with the below, but the Xen logs are still missing and I don't know why. 

https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7617161552

diff --git a/automation/scripts/qemu-key.exp b/automation/scripts/qemu-key.exp
index 35eb903a31..38061f2deb 100755
--- a/automation/scripts/qemu-key.exp
+++ b/automation/scripts/qemu-key.exp
@@ -9,7 +9,8 @@ match_max 10000
 eval spawn $env(QEMU_CMD)
 
 expect_after {
-    -re "(.*)\r" {
+    -re "(.*)\r+$" {
+        puts $expect_out(1,string)
         exp_continue
     }
     timeout {send_error "ERROR-Timeout!\n"; exit 1}

