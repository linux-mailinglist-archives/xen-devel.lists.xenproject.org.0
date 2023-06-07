Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D8072708A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 23:28:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545015.851184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q70gE-0002mb-OS; Wed, 07 Jun 2023 21:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545015.851184; Wed, 07 Jun 2023 21:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q70gE-0002jk-LG; Wed, 07 Jun 2023 21:26:58 +0000
Received: by outflank-mailman (input) for mailman id 545015;
 Wed, 07 Jun 2023 21:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ksrr=B3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q70gD-0002je-Bz
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 21:26:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 059bf33a-057a-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 23:26:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E74E1616E2;
 Wed,  7 Jun 2023 21:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A066EC433EF;
 Wed,  7 Jun 2023 21:26:51 +0000 (UTC)
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
X-Inumbo-ID: 059bf33a-057a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686173212;
	bh=UM7gIhudZZFJIj4696jJkmgh8v6/NA8OnspsUhRWDzM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eTj4/2lfkJsz4QtXGYAYTvWaLFNwDeSBRFYYaqWs285IpxT0RlqN9+IkY6Etrqeae
	 2KOBADdMElMmOpB3y7im7+qJGQN/DAz3dgtKdwsyAHze9VLqRC0Ou6j7ivhA3GQ7Nf
	 EZFIC0p+nxpmSi/NtUnlwVnz3i0DTLAticdcyAKl77nm3nzok8bdwc5mnb8T8IbQIt
	 FXDj/oP3LfV4PnbLx+WFkd127+w7ibk+TyuAsVYWM2C7iSJ2HQp1UisEAkZ/DAiTxf
	 BoPFJ8aSqq5Pttq7aMkLlPrKu8qJaRIjKBd8XX9Vo9GvY+3NvYU2g84XgBULqXEFGg
	 JqFSYnNw9Fb3Q==
Date: Wed, 7 Jun 2023 14:26:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] CI: Fix the github actions Coverity run
In-Reply-To: <20230607093612.2219286-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2306071426430.3567387@ubuntu-linux-20-04-desktop>
References: <20230607093612.2219286-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1659974247-1686173212=:3567387"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1659974247-1686173212=:3567387
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 Jun 2023, Andrew Cooper wrote:
> The Install step is failing with:
> 
>   Package python-dev is not available, but is referred to by another package.
>   This may mean that the package is missing, has been obsoleted, or
>   E: Package 'python-dev' has no installation candidate
>   is only available from another source
>   However the following packages replace it:
>     python2-dev python2 python-dev-is-python3
> 
> which is a side effect of ubuntu-latest having changed from 20.04 to 22.04.
> 
> Drop python-dev as python3-dev is already present, and used a fixed runs-on to
> avoid such problems in the future.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> 
> Untested.  This needs to be committed and wait until the next cron on the main
> repo (which has the appropriate secret token) for an end-to-end test.
> ---
>  .github/workflows/coverity.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
> index 427fb86f947f..60ac8dee5570 100644
> --- a/.github/workflows/coverity.yml
> +++ b/.github/workflows/coverity.yml
> @@ -8,7 +8,7 @@ on:
>  
>  jobs:
>    coverity:
> -    runs-on: ubuntu-latest
> +    runs-on: ubuntu-22.04
>      steps:
>      - name: Install build dependencies
>        run: |
> @@ -18,7 +18,7 @@ jobs:
>            libbz2-dev e2fslibs-dev uuid-dev ocaml \
>            ocaml-findlib libyajl-dev \
>            autoconf libtool liblzma-dev \
> -          python3-dev golang python-dev libsystemd-dev
> +          python3-dev golang libsystemd-dev
>  
>      - uses: actions/checkout@v2
>        with:
> -- 
> 2.30.2
> 
--8323329-1659974247-1686173212=:3567387--

