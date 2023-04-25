Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797116EDA63
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 04:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525701.817040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr8ry-0004iJ-Jo; Tue, 25 Apr 2023 02:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525701.817040; Tue, 25 Apr 2023 02:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr8ry-0004gW-Em; Tue, 25 Apr 2023 02:57:30 +0000
Received: by outflank-mailman (input) for mailman id 525701;
 Tue, 25 Apr 2023 02:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxgq=AQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pr8rx-0004gO-JP
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 02:57:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7410efb-e314-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 04:57:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11E3662B20;
 Tue, 25 Apr 2023 02:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A80BC4339B;
 Tue, 25 Apr 2023 02:57:21 +0000 (UTC)
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
X-Inumbo-ID: e7410efb-e314-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682391442;
	bh=M4r5vmYkLXyRQc5/0qxxQmnvwfhEm4K9QtE/5QDP5+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QYv2LcKxpL4wKXCBDVjgf51cqTF9teFWCuFV+0K0YzXTBrheSje+sFomKqeiZ/CVO
	 /qVori92nD6HttkqupLBoMhBoekahWBPnv02SPVuUpsa/Svfr5zzudRdNKTXWFkpKE
	 d8GEyotZaf8EbBWWg5h7C6cwmFCzVfvd4hEBtzurxZnc31qocZiE2LGcqmilNvUp7a
	 EnCiRt4FnrHg8MnOguovO8rDfK2XWAchVA4UD9t5gDUPxytqyoZL6ykVe95I4nh+Ke
	 929pqGAXi8X3XNt6Q+9N76Dn7QcoxODS1Z2dm/cYr60oVWGEFyL1CeDsLWdORM9Yl7
	 K+nDbwuh2uLlA==
Date: Mon, 24 Apr 2023 19:57:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 3/6] automation: re-enable building SeaBIOS in Alpine
 container
In-Reply-To: <f28aa73c1db56ccfce23c408283af28195b5eac2.1682369736.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304241717050.3419@ubuntu-linux-20-04-desktop>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com> <f28aa73c1db56ccfce23c408283af28195b5eac2.1682369736.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1250059942-1682381831=:3419"
Content-ID: <alpine.DEB.2.22.394.2304241730280.3419@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1250059942-1682381831=:3419
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304241730281.3419@ubuntu-linux-20-04-desktop>

On Mon, 24 Apr 2023, Marek Marczykowski-Górecki wrote:
> It seems to build just fine with Alpine 3.12, and SeaBIOS is necessary
> for a HVM test (that use the Alpine build).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/build | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 7d1b19c4250d..d830cff7b7c7 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -77,8 +77,6 @@ else
>      if ldd /bin/ls | grep -q musl; then
>          # disable --disable-werror for QEMUU when building with MUSL
>          cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
> -        # SeaBIOS doesn't build on MUSL systems
> -        cfgargs+=("--with-system-seabios=/bin/false")
>      fi
>  
>      # Qemu requires Python 3.5 or later, and ninja
> -- 
> git-series 0.9.1
> 
--8323329-1250059942-1682381831=:3419--

