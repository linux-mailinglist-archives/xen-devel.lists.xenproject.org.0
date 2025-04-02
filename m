Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E62A7859E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 02:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935039.1336558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlsE-0002fD-1F; Wed, 02 Apr 2025 00:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935039.1336558; Wed, 02 Apr 2025 00:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlsD-0002dd-Tv; Wed, 02 Apr 2025 00:22:29 +0000
Received: by outflank-mailman (input) for mailman id 935039;
 Wed, 02 Apr 2025 00:22:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tzlsC-0002dW-Rb
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 00:22:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8da23f9c-0f58-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 02:22:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D280B5C3FCC;
 Wed,  2 Apr 2025 00:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA06AC4CEE4;
 Wed,  2 Apr 2025 00:22:23 +0000 (UTC)
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
X-Inumbo-ID: 8da23f9c-0f58-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743553344;
	bh=GW+JcUjsAPrxTRCOzqIxwLPCy4cz/rmvfzwYSx+avoY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O5ZSeYpuvCHEgKl18yq81EehsbiMSbk7a5bQj2jqx63yskcbVOxXJ+uLjaHt5CejJ
	 01Fat4316/ZlOHFMeYozsa0jyiHGa6q37QDW/PezjcXPZmXPGQEJKQ7zai1xpSalzW
	 x6z0P/1PmYpETGnMzIL4GKb0GsygEOfsJkpzamTifHq4FuGl2GFJaleNb5LhYiZsVk
	 5iRP0NRmvI1902FxZNU54VhO/ja3FBUULRL2QrLlhWFR495SpO8A4b89YKCCsLGkuH
	 g4f4GYQvy0Pdhqu+UYGYau3T9MG116S14+gyybssb4RNIu1p2KJbrhBg6SL4Soag+8
	 7CRcQg0l+6yaw==
Date: Tue, 1 Apr 2025 17:22:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] ci: add Intel KabyLake HW runner
In-Reply-To: <c92c7baeb09883dbbfc493c0abc1e9576533cffa.1743464494.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504011722030.3098208@ubuntu-linux-20-04-desktop>
References: <cover.c37f01ae6ae3cbc9c0897f39de9037d7225d2c94.1743464494.git-series.marmarek@invisiblethingslab.com> <c92c7baeb09883dbbfc493c0abc1e9576533cffa.1743464494.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-305143249-1743553344=:3098208"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-305143249-1743553344=:3098208
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 1 Apr 2025, Marek Marczykowski-Górecki wrote:
> This is Intel i7-7567U in NUC 7i7BNH. This one is an older one, with no
> firmware updates (last update from 2023) and no microcode udpates
> either. While this firmware supports UEFI, network boot works only in
> legacy mode - thus legacy is used here (via iPXE, instead of grub2.efi).
> Testing legacy boot path may be a useful thing on its own.
> 
> Add the same set of tests as on ADL runner.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Not sure if duplicating pvshim test makes sense? Others do look like may
> have hardware-sensitive parts.

The more the merrier


> ---
>  automation/gitlab-ci/test.yaml | 89 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 225eb4399807..d05b9a98afa6 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -155,6 +155,17 @@
>    tags:
>      - qubes-hw2
>  
> +.kbl-x86-64:
> +  # it's really similar to the ADL one
> +  extends: .adl-x86-64
> +  variables:
> +    PCIDEV: "00:1f.6"
> +    PCIDEV_INTR: "MSI"
> +    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi"
> +    SUT_ADDR: test-3.testnet
> +  tags:
> +    - qubes-hw3
> +
>  .zen2-x86-64:
>    # it's really similar to the above
>    extends: .adl-x86-64
> @@ -312,6 +323,84 @@ adl-tools-tests-pvh-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +kbl-smoke-x86-64-gcc-debug:
> +  extends: .kbl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +kbl-smoke-x86-64-dom0pvh-gcc-debug:
> +  extends: .kbl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +kbl-smoke-x86-64-dom0pvh-hvm-gcc-debug:
> +  extends: .kbl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +kbl-suspend-x86-64-gcc-debug:
> +  extends: .kbl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +kbl-pci-pv-x86-64-gcc-debug:
> +  extends: .kbl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +kbl-pci-hvm-x86-64-gcc-debug:
> +  extends: .kbl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +kbl-pvshim-x86-64-gcc-debug:
> +  extends: .kbl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +kbl-tools-tests-pv-x86-64-gcc-debug:
> +  extends: .kbl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
> +  artifacts:
> +    reports:
> +      junit: tests-junit.xml
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +kbl-tools-tests-pvh-x86-64-gcc-debug:
> +  extends: .kbl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
> +  artifacts:
> +    reports:
> +      junit: tests-junit.xml
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  zen2-smoke-x86-64-gcc-debug:
>    extends: .zen2-x86-64
>    script:
> -- 
> git-series 0.9.1
> 
--8323329-305143249-1743553344=:3098208--

