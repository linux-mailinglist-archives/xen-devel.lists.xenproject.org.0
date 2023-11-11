Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5389D7E878A
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 02:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630857.984031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1coJ-0001ib-N0; Sat, 11 Nov 2023 01:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630857.984031; Sat, 11 Nov 2023 01:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1coJ-0001gH-Jt; Sat, 11 Nov 2023 01:29:19 +0000
Received: by outflank-mailman (input) for mailman id 630857;
 Sat, 11 Nov 2023 01:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrjv=GY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1coI-0001gB-5d
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 01:29:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b97d83a5-8031-11ee-9b0e-b553b5be7939;
 Sat, 11 Nov 2023 02:29:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74CB261B4D;
 Sat, 11 Nov 2023 01:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E921C433C7;
 Sat, 11 Nov 2023 01:29:11 +0000 (UTC)
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
X-Inumbo-ID: b97d83a5-8031-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699666152;
	bh=Qxuhe2GxH8zg5H2zI06Run0oen8nzBl7b3GfzB6y1vA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fa1Qhi7heOHuNVOuoba7govojjnavfwC3AEs14+0HESyrRkCNYSB6QFmt60clCZRq
	 FUFcVwsfqRkJwB0tELA6Yz7ztsE9u96NHHD/DQocpTnvFx2BqFuvw4I9WuB5HCGzUu
	 oh9ZJOi0xdfM6jiKqkmYPuIP1hcQaifL4Fm1Fc/YZfNUPICfAwEZv8LCHPj4+BiNSt
	 LDtsdjZHfuj7Z3lLkld6yPEQc3Nz8GFVIjCjgAmqDYm4Ylh5mA2RiPveRy9usGbVDO
	 CDwFsiBC4TjEsBj9NL1BsKDf2A8DImzkbjPKSl4Ux/6aeunAcd6/Q94xWUYb2vbRMP
	 eraSBKqEe1zHA==
Date: Fri, 10 Nov 2023 17:29:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    viryaos-discuss@lists.sourceforge.net, xen-devel@lists.xenproject.org, 
    brian@woods.art
Subject: Re: [PATCH] Use hex for bitstream_size as expected by u-boot
In-Reply-To: <eb5b015c-0697-469b-be87-b933831fc351@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311101728300.3478774@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2311091740490.3478774@ubuntu-linux-20-04-desktop> <329849be-f2c1-4ca6-8b97-b288d163aeb1@xen.org> <dbab3224-a15b-41b4-9a1f-bef4222f3a9d@amd.com> <50ad4fb5-77c4-44f3-80cf-a2555d595e10@xen.org>
 <eb5b015c-0697-469b-be87-b933831fc351@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-482275272-1699666151=:3478774"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-482275272-1699666151=:3478774
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 10 Nov 2023, Julien Grall wrote:
> On 10/11/2023 10:08, Julien Grall wrote:
> > On 10/11/2023 10:01, Michal Orzel wrote:
> > > Hi Julien,
> > > 
> > > On 10/11/2023 10:27, Julien Grall wrote:
> > > > 
> > > > 
> > > > Hi Stefano,
> > > > 
> > > > On 10/11/2023 01:44, Stefano Stabellini wrote:
> > > > > Reported-by: Brian Woods <brian@woods.art>
> > > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > 
> > > > > diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> > > > > index b284887..6e52da5 100755
> > > > > --- a/scripts/uboot-script-gen
> > > > > +++ b/scripts/uboot-script-gen
> > > > > @@ -790,7 +790,7 @@ bitstream_load_and_config()
> > > > >            check_file_type "$BITSTREAM" "BIT data"
> > > > >            bitstream_addr=$memaddr
> > > > >            load_file $BITSTREAM "fpga_bitstream"
> > > > > -        bitstream_size=$filesize
> > > > > +        bitstream_size=`printf "0x%X\n" $filesize`
> > > > 
> > > > Looking at [1], there is no indication that the size parameter for "fpga
> > > > load" should be hexadecimal. At the contrary, all the example I have
> > > > found seems to use $filesize.
> > > U-boot expects size to be passed in hex format. You can see it here:
> > > https://github.com/u-boot/u-boot/blob/master/cmd/fpga.c#L60C20-L60C27
> > > 
> > > Also, AFAICT $filesize var that gets updated after image load (e.g. tftpb)
> > > is in hex format.
> > 
> > Hmmm, now that you are saying this... I vaguely recall we had some issues in
> > the past with the size. The format was not consistent across U-boot.
> > 
> > Maybe this is the same problem here?
> 
> I had a chat with Michal on Matrix. 'filesize' is a variable internal to the
> image-builder rather than U-boot. Hence the confusion.
> 
> The variable will be set in decimal. So it needs to be converted to
> hexadecimal. So the code seems to be correct.
> 
> That said, I think some clarifications is needed in the commit message to help
> understanding the code and at least giving a hint whether this code was ever
> tested (or this was introduced by a follow-up change).

Makes sense, I added an explanation on commit. Passing the parameter as
hex with 0x should make it work on both old and new versions of u-boot.
--8323329-482275272-1699666151=:3478774--

