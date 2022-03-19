Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218914DE4D3
	for <lists+xen-devel@lfdr.de>; Sat, 19 Mar 2022 01:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292285.496488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVMoq-0005pa-UH; Sat, 19 Mar 2022 00:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292285.496488; Sat, 19 Mar 2022 00:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVMoq-0005n7-Qh; Sat, 19 Mar 2022 00:19:44 +0000
Received: by outflank-mailman (input) for mailman id 292285;
 Sat, 19 Mar 2022 00:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/Ld=T6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nVMop-0005n1-Cj
 for xen-devel@lists.xenproject.org; Sat, 19 Mar 2022 00:19:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45bb976f-a71a-11ec-8fbc-03012f2f19d4;
 Sat, 19 Mar 2022 01:19:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BAC2DB825EA;
 Sat, 19 Mar 2022 00:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2B9C340E8;
 Sat, 19 Mar 2022 00:19:39 +0000 (UTC)
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
X-Inumbo-ID: 45bb976f-a71a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647649180;
	bh=uBdH8M+Zzqfm5YPRGnmg3dqkYXVp1NN+74H1opIC5zY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XG3iNCOysagbP6Xhbm5iQcJOoy03SRkHTbHJh+S1S3mkI9sJHqfOKLkDZpRM+Q8Hq
	 v+VvJwRyVM01eliRfV5LCFfRaB4SDIsl2rc8gMcoo/F7x1jQHZZRqSeRMiL8Xz/xZ6
	 0FJ03lR6mW6mFYc/TBL+z0cmQK7qK8CPRg4Zasii5Pcqd7jY7DE9/5udNnGR1VInpX
	 L4DdgFqaZWalrgMs30R3l6VsIIJdPeDXdhBAQIsW6bKsjVRugN0lbM8tjsLcmt6YOZ
	 3wzpe9k7Fm4IXQ75rMFwkkvW2bFZAs6qerRl5Q363jOLEIXvLAcPVDQu9gRK11Hop7
	 vEfid1ow9ZWLw==
Date: Fri, 18 Mar 2022 17:19:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
In-Reply-To: <YjSsMLl5Isn+OAMO@perard.uk.xensource.com>
Message-ID: <alpine.DEB.2.22.394.2203181715570.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203161843230.3497@ubuntu-linux-20-04-desktop> <20220317014653.2427386-2-sstabellini@kernel.org> <YjSsMLl5Isn+OAMO@perard.uk.xensource.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Mar 2022, Anthony PERARD wrote:
> On Wed, Mar 16, 2022 at 06:46:53PM -0700, Stefano Stabellini wrote:
> > +curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
> > +curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/initrd.gz
> 
>     curl --fail --silent --show-error --location --remote-name
> 
> I didn't know what all those short options were, I had to write it
> down. In script to be shared with others, I think it's better to use the
> long options, as it's kind of self-documenting.
> 
> Now, there an issue with the command line, "--remote-name" (or -O) needs
> to be replaced. We don't care about how the server calls the file, it is
> much more important do know where it is going to be stored. Instead, you
> should use "--output" to write the file to the location the script is
> going to use. It happened to work now, but we don't have to trust
> the Internet when not needed.
> 

Sure I copy-pasted it from the other scripts. With your suggestion it
becomes:
curl --fail --silent --show-error --location --remote-name http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz

I can make the change


> Also, maybe use "https"?

https doesn't work for this:

$ curl --fail --silent --show-error --location --remote-name https://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
curl: (60) SSL: no alternative certificate subject name matches target host name 'http.us.debian.org'


> Also, maybe as an improvement for later, and to avoid having to rely on
> the Internet, we could probably store those artifacts in the container
> that's going to run the test. But I'm not asking this for now.

I agree! Even better if we could update the kernel too. I think for now
it is OK but I'll try to improve it in the following weeks.


> > +timeout -k 1 240 \
> > +./qemu-system-arm \
> 
> There's probably a better way than waiting for the "timeout" like running an
> "init" that print something and shutdown the machine. But I guess
> that's ok for now.

Yeah I agree on both points. The other 3 tests are in the same
situation.

