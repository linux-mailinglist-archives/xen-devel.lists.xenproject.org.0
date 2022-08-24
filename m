Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C954B5A0320
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 23:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392952.631606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQxaD-0001pZ-Ub; Wed, 24 Aug 2022 21:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392952.631606; Wed, 24 Aug 2022 21:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQxaD-0001n9-Rk; Wed, 24 Aug 2022 21:06:41 +0000
Received: by outflank-mailman (input) for mailman id 392952;
 Wed, 24 Aug 2022 21:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NROC=Y4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oQxaC-0001n1-No
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 21:06:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a547744f-23f0-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 23:06:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E945B825EE;
 Wed, 24 Aug 2022 21:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8078FC433D6;
 Wed, 24 Aug 2022 21:06:36 +0000 (UTC)
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
X-Inumbo-ID: a547744f-23f0-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661375197;
	bh=jbAXo48ccPs9T0sKvcpPPfTDFKLUxIWCa7gTYyvthR8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nFP2PGj/Zkk25Vp3qUI8heI093dgaVF+qk8DHsVm90/sWcJukdMAHpnmWow/WWCUL
	 +7pHwDmza0O2620lJObODGjmwtlb2gHdPWDXQp2bGz4vQ/lyvazsfca6uF3pUlBRlP
	 C/sLSYyZIyiZkRGIJgCUFXVo8GtVYiTnzzsgHWTfv5aLzYM9ESz39z5tIN0uZ3xt/7
	 a60ivjr6QOqll9fK1vhu+71eXJDOgJ8winWPlhO6+9/a67jf+6dy6ZGznKALo9i3W8
	 fAO3S6OBokee6Cdn0+ALdW6uq8eZsQTk8szSNlamscXRwQBbPKdQIgbjISn03yt36g
	 nzB+hRyImyWtA==
Date: Wed, 24 Aug 2022 14:06:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vipul Suneja <vsuneja63@gmail.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "julien@xen.org" <julien@xen.org>
Subject: Re: Porting xen on rpi4
In-Reply-To: <CALAP8f_=NztOC9FKYnrCyknOM4jf27cRqjJ9+7UqOEH6qCAD8Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208241401110.15247@ubuntu-linux-20-04-desktop>
References: <CALAP8f_L0ggPP=a6Xrywge2-ZTa3msqj0UKN8L66cC6ypNOAfw@mail.gmail.com> <2992A27C-B9F7-43BB-A7EA-CC5A3C8B5B22@arm.com> <CALAP8f_=NztOC9FKYnrCyknOM4jf27cRqjJ9+7UqOEH6qCAD8Q@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-994484074-1661374995=:15247"
Content-ID: <alpine.DEB.2.22.394.2208241403220.15247@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-994484074-1661374995=:15247
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2208241403221.15247@ubuntu-linux-20-04-desktop>

On Wed, 24 Aug 2022, Vipul Suneja wrote:
> Hi Bertrand,
> Thanks for your response!
> 
> I builded the guest image on yocto kirkstone source which has FSTYPE ext3. Guest image generated is
> xen-guest-image-minimal-raspberrypi4-64.ext3.
> Below is the content of guest.cfg file
> 
>    kernel = "/home/root/Image" 
>    cmdline = "console=hvc0 earlyprintk=xen sync_console root=/dev/xvda" 
>    memory = "256" 
>    name = "guest1" 
>    vcpus = 1 
>    serial="pty" 
>    disk = [ 'phy:/dev/loop0,xvda,w' ] 
>    vif=[ 'mac=00:11:22:66:88:22,bridge=xenbr0,type=netfront', ]
> 
> I am trying to mount xen-guest-image-minimal-raspberrypi4-64.ext3 to a virtual device & then will run the guest VM by command "xl create -c
> guest.cfg". But facing issue while trying to mount. 

You don't actually need to mount
xen-guest-image-minimal-raspberrypi4-64.ext3 anywhere to use it to run
your guest VM with "xl create". 

It is enough to do this instead, as Bertrand suggested:

disk=["file:/path/to/file/xen-guest-image-minimal-raspberrypi4-64.ext3,xvda,w"]

No need to call losetup or mount. Just xl create -c.

More answers below.


> Regards,
> Vipul Kumar
> 
> On Wed, Aug 24, 2022 at 8:06 PM Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>       Hi Vipul,
> 
>       > On 24 Aug 2022, at 15:16, Vipul Suneja <vsuneja63@gmail.com> wrote:
>       >
>       > Hi,
>       >
>       > I am porting xen hypervisor on rpi4 with yocto kirkstone sources. Followed the basic steps to build xen-image-minimal &
>       xen-guest-image-minimal. I could flash sd card with xen minimal image & could see dom0 up. I copied "Image",
>       "xen-guest-image-minimal" .ext3 file & guest.cfg to "/home/root". After that created a bridge with below step:
>       >
>       > killall -SIGUSR2 udhcpc
>       > brctl addbr xenbr0
>       > brctl addif xenbr0 eth0
>       > killall udhcpc
>       > udhcpc -R -b -p /var/run/udhcpc.xenbr0.pid -i xenbr0
>       >
>       > Could see the xenbr0 interface up.
>       > After that while mounting the guest file system it shows no such file or directory but the file is already there.
>       >
>       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
>       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root      24652288 Mar  9 12:36 Image
>       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root           247 Mar  9 12:37 guest1.cfg
>       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root     868220928 Mar  9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
>       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# chmod 0777 xen-guest-image-minimal-raspberrypi4-64.ext3
>       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# ls -l
>       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root      24652288 Mar  9 12:36 Image
>       > [23:40:15] <Guest9046> -rw-r--r--    1 root     root           247 Mar  9 12:37 guest1.cfg
>       > [23:40:15] <Guest9046> -rwxrwxrwx    1 root     root     868220928 Mar  9 12:39 xen-guest-image-minimal-raspberrypi4-64.ext3
>       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup /dev/loop0 xen-guest-image-minimal-raspberrypi4-64.ext3
>       > [23:40:15] <Guest9046> losetup: xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or directory
>       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
>       > [23:40:15] <Guest9046> losetup: /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or directory
>       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
>       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
>       > [23:40:15] <Guest9046> root@raspberrypi4-64:~#
>       > [23:40:15] <Guest9046> root@raspberrypi4-64:~# losetup /dev/loop0 /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3
>       > [23:40:15] <Guest9046> losetup: /home/root/xen-guest-image-minimal-raspberrypi4-64.ext3: No such file or directory

It looks like either
/home/root/xen-guest-image-minimal-raspberrypi4-64.ext3 doesn't exist or
/dev/loop0 doesn't exist

 
>       Why do you want to mount the file system ?
> 
>       Anyway this is not related to Xen, I guess you could start without xen and still not manage to mount the file like that (linux
>       configuration issue ?)
> 
>       What is the content of you guest.cfg
>       How do you want to pass the guest root file system ?
> 
>       Yocto should actually generate an img file and you could use it by having something like this in your guest.cfg:
>       disk=["file:/home/root/guest1.img,xvda,w”]
> 
>       Cheers
>       Bertrand
> 
>       >
>       > Any input on this issue will be really helpful, expecting your response.
>       >
>       > Thanks & Regards,
>       > Vipul Kumar
> 
> 
> 
--8323329-994484074-1661374995=:15247--

