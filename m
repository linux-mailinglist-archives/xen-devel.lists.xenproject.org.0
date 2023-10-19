Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867777CFF37
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 18:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619511.964703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVez-00065W-TX; Thu, 19 Oct 2023 16:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619511.964703; Thu, 19 Oct 2023 16:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVez-00063p-Ql; Thu, 19 Oct 2023 16:14:09 +0000
Received: by outflank-mailman (input) for mailman id 619511;
 Thu, 19 Oct 2023 16:14:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtVey-0005uY-Az
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 16:14:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 871da096-6e9a-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 18:14:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DAEA261940;
 Thu, 19 Oct 2023 16:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109ACC433C8;
 Thu, 19 Oct 2023 16:14:03 +0000 (UTC)
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
X-Inumbo-ID: 871da096-6e9a-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697732045;
	bh=hNoHyFi2nZwyQtAamdqORFzJx3iK8BRIJgVnZltx0OE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UyXCAQ3AS99BlIh6GKbmbgT1QyBeKH5R5/gwUyBXUjorDyZgsc+VGiZeu1LlmGYVH
	 Edb2bpe76punjzN1FJbkrWtd0CrQwFyBcHRwAHRzBnrlGVIlcmhexan5ysEzDnD3KX
	 HR05S68XYWxjX/RViKMoGwdcBTUt/Sz4dadVzFmLnCZjckG6XTMoxb48LJzj5Q1Srn
	 snl54zWUjjQiOm7Udj8rZ7rbzqm60Cr1O64PbyfwTo7qAMtqOUxRh7usyWU1hKkgbT
	 Df/eHHJ6CW4hSmA+NPMjtgQf8shEGhtJiz118pK+CtqRv73qwg22wFwT+SDfylAQqR
	 aO+OdObMSZsXg==
Date: Thu, 19 Oct 2023 09:14:02 -0700 (PDT)
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
Subject: Re: [PATCH 2/3] CHANGELOG.md: Set 4.18 release date and tag
In-Reply-To: <20231019052050.1032492-3-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310190913360.1945130@ubuntu-linux-20-04-desktop>
References: <20231019052050.1032492-1-Henry.Wang@arm.com> <20231019052050.1032492-3-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  CHANGELOG.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 47e98f036f..3c83878c9b 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
>  
>  The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
> -## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +## [4.18.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-10-30

Should we use xenbits.xenproject.org instead? I think that's the
official name. In any case:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

