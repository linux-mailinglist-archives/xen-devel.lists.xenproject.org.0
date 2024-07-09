Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966F192C6BF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 01:47:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756495.1165135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRKXE-0000G4-VI; Tue, 09 Jul 2024 23:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756495.1165135; Tue, 09 Jul 2024 23:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRKXE-0000Df-Ro; Tue, 09 Jul 2024 23:46:12 +0000
Received: by outflank-mailman (input) for mailman id 756495;
 Tue, 09 Jul 2024 23:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1mn=OJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sRKXD-0000DH-BA
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 23:46:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68a85896-3e4d-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 01:46:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 822DE6172C;
 Tue,  9 Jul 2024 23:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF98C32786;
 Tue,  9 Jul 2024 23:46:04 +0000 (UTC)
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
X-Inumbo-ID: 68a85896-3e4d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720568765;
	bh=DPmGonOws0osxhHvBdy+UQQJhsLrDiJr/gIuBbQSIok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iujAxdqjxu83ZPpV/65FjvUEfIzp0NCxPAPyJQ92cijbyoXPfAninjT3VuxPQVsYF
	 VVJ4wV9BLc4JhDGq6X61NdMvPw/QXBbxkNw4PSSenEK077EQPCrTkfBb56D+9BFVhc
	 mJrCLuutKFsDjyfU71PgrzsHuuyULBJ7K/nxeMlz9ikMwPQ9dvZz0Xm1mIGavl7m2k
	 Y0nx28DAGqXSsIgkT3RfLtQRK78Z5OPC9e79WWEUjCbDXDB1mtcfDOq1ariB6FwI3R
	 sWWYxhJhyKywz2tmmOBjgJ9mUc5BfHgsnx5vXhaeNtnR/PR3iz1Dl9wMH4ADNYA8o3
	 VLiouzhwUbszA==
Date: Tue, 9 Jul 2024 16:46:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20] automation: Use a different ImageBuilder
 repository URL
In-Reply-To: <D2L0YQOMMQ3G.GLD8N5NQ50JS@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2407091645320.3635@ubuntu-linux-20-04-desktop>
References: <20240709122117.48051-1-michal.orzel@amd.com> <D2L0YQOMMQ3G.GLD8N5NQ50JS@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jul 2024, Alejandro Vallejo wrote:
> On Tue Jul 9, 2024 at 1:21 PM BST, Michal Orzel wrote:
> > Switch to using https://gitlab.com/xen-project/imagebuilder.git which
> > should be considered official ImageBuilder repo.
> >
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> >  automation/scripts/qemu-smoke-dom0-arm32.sh       | 2 +-
> >  automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
> >  automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
> >  automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
> >  automation/scripts/qemu-xtf-dom0less-arm64.sh     | 2 +-
> >  automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
> >  6 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> > index d91648905669..5b62e3f691f1 100755
> > --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> > +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> > @@ -73,7 +73,7 @@ UBOOT_SOURCE="boot.source"
> >  UBOOT_SCRIPT="boot.scr"' > config
> >  
> >  rm -rf imagebuilder
> > -git clone https://gitlab.com/ViryaOS/imagebuilder
> > +git clone https://gitlab.com/xen-project/imagebuilder.git
> 
> For this clone and all others:
> 
> You probably want "git clone --depth 1 <url>" to pull the tip of the repo and
> not its history.

That's a good idea. You can add my

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> >  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> >  
> >  rm -f ${serial_log}
> > diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> > index e0bb37af3610..ca59bdec1b2b 100755
> > --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> > +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> > @@ -87,7 +87,7 @@ LOAD_CMD="tftpb"
> >  UBOOT_SOURCE="boot.source"
> >  UBOOT_SCRIPT="boot.scr"' > binaries/config
> >  rm -rf imagebuilder
> > -git clone https://gitlab.com/ViryaOS/imagebuilder
> > +git clone https://gitlab.com/xen-project/imagebuilder.git
> >  bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
> >  
> >  
> > diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> > index 1e2b939aadf7..11804cbd729f 100755
> > --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> > +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> > @@ -125,7 +125,7 @@ if [[ "${test_variant}" == "without-dom0" ]]; then
> >  fi
> >  
> >  rm -rf imagebuilder
> > -git clone https://gitlab.com/ViryaOS/imagebuilder
> > +git clone https://gitlab.com/xen-project/imagebuilder.git
> >  bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
> >  
> >  # Run the test
> > diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> > index 292c38a56147..4b548d1f8e54 100755
> > --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> > +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> > @@ -198,7 +198,7 @@ NUM_CPUPOOLS=1' >> binaries/config
> >  fi
> >  
> >  rm -rf imagebuilder
> > -git clone https://gitlab.com/ViryaOS/imagebuilder
> > +git clone https://gitlab.com/xen-project/imagebuilder.git
> >  bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
> >  
> >  
> > diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > index a667e0412c92..59f926d35fb9 100755
> > --- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > +++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
> > @@ -45,7 +45,7 @@ UBOOT_SOURCE="boot.source"
> >  UBOOT_SCRIPT="boot.scr"' > binaries/config
> >  
> >  rm -rf imagebuilder
> > -git clone https://gitlab.com/ViryaOS/imagebuilder
> > +git clone https://gitlab.com/xen-project/imagebuilder.git
> >  bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
> >  
> >  # Run the test
> > diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> > index 4a071c6ef148..e3f7648d5031 100755
> > --- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> > +++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> > @@ -122,7 +122,7 @@ if [[ "${test_variant}" == "gem-passthrough" ]]; then
> >  fi
> >  
> >  rm -rf imagebuilder
> > -git clone https://gitlab.com/ViryaOS/imagebuilder
> > +git clone https://gitlab.com/xen-project/imagebuilder.git
> >  bash imagebuilder/scripts/uboot-script-gen -t tftp -d $TFTP/ -c $TFTP/config
> >  
> >  # restart the board
> 
> Cheers,
> Alejandro
> 

