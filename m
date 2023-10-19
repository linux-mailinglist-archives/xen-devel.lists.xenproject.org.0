Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A22E7CFF38
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 18:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619512.964712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVfa-0006of-5z; Thu, 19 Oct 2023 16:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619512.964712; Thu, 19 Oct 2023 16:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVfa-0006mA-35; Thu, 19 Oct 2023 16:14:46 +0000
Received: by outflank-mailman (input) for mailman id 619512;
 Thu, 19 Oct 2023 16:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtVfY-0006kd-BV
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 16:14:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bdda8a3-6e9a-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 18:14:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 897B9CE2B53;
 Thu, 19 Oct 2023 16:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B487C433C7;
 Thu, 19 Oct 2023 16:14:38 +0000 (UTC)
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
X-Inumbo-ID: 9bdda8a3-6e9a-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697732079;
	bh=EOm7pPR+kyeRXvRZKKVaxeOcsLoE0YHFTknGdoTCmq0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T24FQvWCXNNY4o/7vQeG+0Sel+t+N37jEAuHaZRATPjRFWfY0Z5ZBmMuC7i4C3616
	 4ljwpOps4DfIcSNoWZQPPwT4D4vkKxfTAC4NR0anByTG45sOJdXE7I9p1A/506s2Yp
	 B1RnX6J8ZvNg+B8ZblmJnF1g+d2rVZrEnxJZ5+OtlnUcdInFw6ImLVhRBy7BXtl4iT
	 XGmMOse6Yf1oEULVu8Tr7C/EVKp/tCc9P0KIagOMiXaWJFYkIn7EncZVALpMBnvW0z
	 o6kFKAgsKDqEd6S3iiKI4r1RY2MIfUAdrw7uqefGTh+C2IeTgLW8BTbFfySpFu9zDh
	 zMRfCSysgO0KQ==
Date: Thu, 19 Oct 2023 09:14:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Community Manager <community.manager@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH 3/3] CHANGELOG.md: Start new "unstable" section
In-Reply-To: <20231019052050.1032492-4-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310190914110.1945130@ubuntu-linux-20-04-desktop>
References: <20231019052050.1032492-1-Henry.Wang@arm.com> <20231019052050.1032492-4-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  CHANGELOG.md | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 3c83878c9b..48aff24f3a 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,6 +4,14 @@ Notable changes to Xen will be documented in this file.
>  
>  The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
> +## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD

same here about xen.org/xenproject.org

In any case:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> +### Changed
> +
> +### Added
> +
> +### Removed
> +
>  ## [4.18.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-10-30
>  
>  ### Changed


