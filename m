Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A16705A00
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 23:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535711.833670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz2bq-0005N4-Ok; Tue, 16 May 2023 21:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535711.833670; Tue, 16 May 2023 21:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz2bq-0005L5-L2; Tue, 16 May 2023 21:53:30 +0000
Received: by outflank-mailman (input) for mailman id 535711;
 Tue, 16 May 2023 21:53:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pz2bp-0005Kz-Nx
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 21:53:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 162e25a1-f434-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 23:53:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFD6F63FC6;
 Tue, 16 May 2023 21:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954DBC4339B;
 Tue, 16 May 2023 21:53:24 +0000 (UTC)
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
X-Inumbo-ID: 162e25a1-f434-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684274005;
	bh=SDVOhqlrpiKenrawhVplIOdyEUYgKvyJLav+NDE2hGg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=grV2teyudrdipUb9uyAfdd5mjRcj9RE63vQ1w52fgY+64B7ZDp8RSC3tpb0w00x15
	 zRyyEsutC6HnIDaiWgR/dlNvGNKa4QLfP4M2IbyZndiLcnZT1elrwbcuM3UF6OqoW7
	 uj2hCpH6Aq+pqKsyt8UpKO2ZrffgYjLLuRV8lsqR+1ats+PD4zKuAat1qapXj5sVdR
	 BbCerADv42qDjFWC/uXwv1vLJgv1DudErt4jO3SWwIt5GtlpopYqtcIbs1eGIsaHEW
	 gC5W/qWpW5pXGaVioR2cHd/QEJ4yf0PWvxsPFlgmDDqtU6YTPZdRH2dz/JuwyIzJIE
	 yjLdobMY7Xn2Q==
Date: Tue, 16 May 2023 14:53:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: provide example for downloading an existing
 container
In-Reply-To: <20230516195204.66590536@sender>
Message-ID: <alpine.DEB.2.22.394.2305161447580.128889@ubuntu-linux-20-04-desktop>
References: <20230502201444.6532-1-olaf@aepfle.de> <alpine.DEB.2.22.394.2305151533320.4125828@ubuntu-linux-20-04-desktop> <20230516105155.0c59143a@sender> <alpine.DEB.2.22.394.2305161145540.62578@ubuntu-linux-20-04-desktop> <20230516195204.66590536@sender>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 May 2023, Olaf Hering wrote:
> Am Tue, 16 May 2023 11:46:00 -0700 (PDT)
> schrieb Stefano Stabellini <sstabellini@kernel.org>:
> 
> > I think you have a point that automation/build/README.md should also
> > describe how to do what gitlab-ci does but locally (i.e. call
> > automation/scripts/build). It should not only describe
> > automation/scripts/containerize.
> 
> Meanwhile I have figured this out, additional variables must be set. I
> already sent a patch for the example. That way I was able to
> understand and reproduce the error seen in the CI build.

Thanks!


> > https://gitlab.com/xen-project/xen/-/jobs/4284741849
> 
> It turned out this bug in qemu is triggered by debug=y vs. debug=n in
> the build environment. I have not checked which commit exactly fixed it
> in upstream qemu.git, it should probably be backported. Or qemu should
> be moved forward to v8.x at some point. I think I have not seen this
> specific failure in my own qemu.git builds.
> 
> The reason is: --enable-debug will disable _FORTIFY_SOURCE, so the build
> succeeds. Without that flag, configure will enable _FORTIFY_SOURCE.

This is very interesting. Thank you for investigating the problem.

I would prefer a proper backported fix to QEMU, or wholesale QEMU
upgrade. But if neither are possible we could also add a way to add
--enable-debug or disable _FORTIFY_SOURCE in another way for Tumbleweed.
See for instance EXTRA_XEN_CONFIG as a way to pass special parameters
from automation/gitlab-ci/build.yaml to automation/script/build.

