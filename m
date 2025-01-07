Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A747A04AF3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 21:27:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866788.1278147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVG9R-00079p-Lf; Tue, 07 Jan 2025 20:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866788.1278147; Tue, 07 Jan 2025 20:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVG9R-00077d-IR; Tue, 07 Jan 2025 20:26:09 +0000
Received: by outflank-mailman (input) for mailman id 866788;
 Tue, 07 Jan 2025 20:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5H8=T7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tVG9Q-00077S-Bj
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 20:26:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b8f9e1d-cd35-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 21:26:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E0B95C561A;
 Tue,  7 Jan 2025 20:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0935BC4CED6;
 Tue,  7 Jan 2025 20:25:57 +0000 (UTC)
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
X-Inumbo-ID: 9b8f9e1d-cd35-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736281558;
	bh=/sWlrrM1T9AyujFgsvL5X+RXwuVpm4WJdUNUjeXG6CI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ig8vYS9iMgeF6d2t9vGRtG/aTrW0/kt+gM2cSgz6B8RSbt5UH2loavzM5K7gLxZOm
	 0/zFOHrzS6/eEyJ9TFWRNrWUsVYkGUarSZ/ZDTfa9wQ0jKxiNCQUkypg4oqz4FhYac
	 KX6Rc9jq08D6EwYobOa8eRVmBaeIgxqNBB6D8ZK53cvvQ/mwsJXASrl5R9UPxv2IgE
	 kmSu0z361LT7FPa+4Fwp320/QbSmlChN9QtjKHLk+lDk7paOhXESANCOyyEFmRsZ/y
	 6/toXVhBeLzCev5cfor+rnmmVxY62X7efVRuJ87Lnhf2+6UVZ0cBzUNo0/7/0bm09C
	 1WnsBpVTPgHgA==
Date: Tue, 7 Jan 2025 12:25:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/arm: ffa: add changelog entries for FF-A
 improvements
In-Reply-To: <059ad52a5d2aa6fb7fabe44fe2a99d8b73c1b907.1736240334.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2501071225480.133435@ubuntu-linux-20-04-desktop>
References: <059ad52a5d2aa6fb7fabe44fe2a99d8b73c1b907.1736240334.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jan 2025, Bertrand Marquis wrote:
> Add a CHANGELOG entry for release 4.20 to mention the various
> improvements and fixes that have been done in the FF-A support since
> 4.19 release.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  CHANGELOG.md | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8507e6556a56..d58a2ffd130b 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -22,6 +22,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
>       forwarding the calls to EL3 FW if coming from hwdom.
>     - Support for LLC (Last Level Cache) coloring.
> +   - Several FF-A support improvements: add indirect messages support, transmit
> +     RXTX buffer to the SPMC, fix version negotication and partition
> +     information retrieval.
>   - On x86:
>     - xl suspend/resume subcommands.
>  
> -- 
> 2.47.1
> 

