Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A01CB41D4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 22:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183376.1506100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTSCy-0003na-Ai; Wed, 10 Dec 2025 21:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183376.1506100; Wed, 10 Dec 2025 21:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTSCy-0003kp-7n; Wed, 10 Dec 2025 21:58:52 +0000
Received: by outflank-mailman (input) for mailman id 1183376;
 Wed, 10 Dec 2025 21:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vTSCw-0003kj-O0
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 21:58:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66f392a3-d613-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 22:58:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D1464412A;
 Wed, 10 Dec 2025 21:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E104C4CEF7;
 Wed, 10 Dec 2025 21:58:45 +0000 (UTC)
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
X-Inumbo-ID: 66f392a3-d613-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765403926;
	bh=dyoJtzuAd9fl+ADZptUpXBBHb1oaAKHEGVibRWZ96T0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s36oM1TtGV4dobM2nHDqfwZT2iUx5VspNh2RK+XgBEhCy3dV7LA7g34aD8cQ70u3A
	 Hoc3HercoW5Wb9dG11tKZHitfqixdQVqYMBHnFOeeq+xkrKhKs2LFyjub9ZKAQDnrB
	 gsaeN315H9o1yAkgIWt6rEyN9dNxVvxbQ5Xj/8VZw/Z5WIqxsBLbY1lRqQjz/NIDOu
	 eEE5YjnQ5eYkrKsgfu+GtKufNQeaHPH31mOXSJ0QHWb73xDk9o8dFKU4HyFtWIswfD
	 /ZW9iiFoPzYlyLJ1b3ridnr/nhK8x2YXIC3HaPfTZdE8tEmjaWADXVLzOy2QmLz/W0
	 1NZSRMbGE5c/Q==
Date: Wed, 10 Dec 2025 13:58:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 4/6] CI: Add driver domains tests
In-Reply-To: <aTnezVY1NoE-vZRF@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2512101344130.19429@ubuntu-linux-20-04-desktop>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com> <cf2a2544fe27fedca5129b61912c064f4be08236.1764989098.git-series.marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2512091534060.19429@ubuntu-linux-20-04-desktop>
 <aTjOBpuKMSO4LzzN@mail-itl> <alpine.DEB.2.22.394.2512101219460.19429@ubuntu-linux-20-04-desktop> <aTnezVY1NoE-vZRF@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1231701061-1765403884=:19429"
Content-ID: <alpine.DEB.2.22.394.2512101358120.19429@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1231701061-1765403884=:19429
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2512101358121.19429@ubuntu-linux-20-04-desktop>

On Wed, 10 Dec 2025, Marek Marczykowski-Górecki wrote:
> > > > > +    mkfs.ext4 -d . ../domU-rootfs.img 1024M
> > > > 
> > > > Do we really need 1GB? I would rather use a smaller size if possible.
> > > > I would rather use as little resources as possible on the build server
> > > > as we might run a few of these jobs in parallel one day soon.
> > > 
> > > This will be a sparse file, so it won't use really all the space. But
> > > this size is the upper bound of what can be put inside.
> > > That said, it's worth checking if sparse files do work properly on all
> > > runners in /build. AFAIR some older docker versions had issues with that
> > > (was it aufs not supporting sparse files?).
> > 
> > I ran the same command on my local baremetal Ubuntu dev environment
> > (arm64) and it created a new file of the size passed on the command
> > line (1GB in this case). It looks like they are not sparse on my end. If
> > the result depends on versions and configurations, I would rather err on
> > the side of caution and use the smallest possible number that works.
> 
> Hm, interesting. What filesystem is that on?
> 
> On my side it's definitely sparse (ext4):
> 
>     [user@disp8129 Downloads]$ du -sch
>     12K	.
>     12K	total
>     [user@disp8129 Downloads]$ mkfs.ext4 -d . ../domU-rootfs.img 1024M
>     mke2fs 1.47.2 (1-Jan-2025)
>     Creating regular file ../domU-rootfs.img
>     Creating filesystem with 262144 4k blocks and 65536 inodes
>     Filesystem UUID: f50a5dfe-4dcf-4f3e-82d0-3dc54a788ab0
>     Superblock backups stored on blocks: 
>         32768, 98304, 163840, 229376
> 
>     Allocating group tables: done                            
>     Writing inode tables: done                            
>     Creating journal (8192 blocks): done
>     Copying files into the device: done
>     Writing superblocks and filesystem accounting information: done
> 
>     [user@disp8129 Downloads]$ ls -lhs ../domU-rootfs.img 
>     33M -rw-r--r--. 1 user user 1.0G Dec 10 21:45 ../domU-rootfs.img

I went and check two of the runners, one ARM and one x86, and it looks
like they support sparse outside and inside containers. They should have
all the same configuration so I think we can assume they support sparse
files appropriately.

So it looks like it OK. But please could you add an in-code comment to
highlight that the file created will be sparse?


> > > > Moreover this script will be run inside a container which means this
> > > > data is probably in RAM.
> > > 
> > > Are runners configured to use tmpfs for /build? I don't think it's the
> > > default.
> > 
> > I don't know for sure, they are just using the default. My goal was to
> > make our solution more reliable as defaults and configurations might
> > change.
> > 
> > 
> > > > The underlying rootfs is 25M on both ARM and x86. This should be at most
> > > > 50M.
> > > 
> > > Rootfs itself is small, but for driver domains it needs to include
> > > toolstack too, and xen-tools.cpio is over 600MB (for debug build).
> > > I might be able to pick just the parts needed for the driver domain (xl
> > > with its deps, maybe some startup scripts, probably few more files), but
> > > it's rather fragile.
> > 
> > My first thought is to avoid creating a 1GB file in all cases when it
> > might only be needed for certain individual tests. Now, I realize that
> > this script might end up only used in driver domains tests but if not, 
> 
> Indeed this script is specifically about driverdomains test.
> 
> > I
> > would say to use the smallest number depending on the tests, especially
> > as there seems to be use a huge difference, e.g. 25MB versus 600MB.
> > 
> > My second thought is that 600MB for just the Xen tools is way too large.
> > I have alpine linux rootfs'es with just the Xen tools installed that are
> > below 50MB total. I am confused on how we get to 600MB. It might be due
> > to QEMU and its dependencies but still going from 25MB to 600MB is
> > incredible!
> 
> Indeed it's mostly about QEMU (its main binary itself takes 55MB),
> including all bundled firmwares etc (various flavors of edk2 alone take
> 270MB). There is also usr/lib/debug which takes 85MB.
> But then, usr/lib/libxen* combined takes almost 50MB.
> 
> OTOH, non-debug xen-tools.cpio takes "just" 130MB.

Can we use the non-debug xen-tools.cpio and also can we remove all the
bundled firmware? Do we really need EDK2 for instance?

I don't think it is worth doing an in-details analysis of what binaries
to keep and what to remove, but at least removing the unnecessary
in-guest firmware and ideally chosing a non-debug build sounds
reasonable?
--8323329-1231701061-1765403884=:19429--

