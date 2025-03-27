Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F7EA7414C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 00:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929979.1332718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwCh-00066I-4H; Thu, 27 Mar 2025 23:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929979.1332718; Thu, 27 Mar 2025 23:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwCh-00063A-0m; Thu, 27 Mar 2025 23:00:03 +0000
Received: by outflank-mailman (input) for mailman id 929979;
 Thu, 27 Mar 2025 23:00:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1txwCf-0005Hp-Ho
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 23:00:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 359e1bb3-0b5f-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 00:00:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0EFEF5C4756;
 Thu, 27 Mar 2025 22:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4FBC4CEDD;
 Thu, 27 Mar 2025 22:59:58 +0000 (UTC)
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
X-Inumbo-ID: 359e1bb3-0b5f-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743116398;
	bh=II7J9WX9J488Gulj8+zcvXQZNYD3BPx/QAr6USW1fKo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t339PC9+raAsSgheSzawWWhlf09gGA2qFTLMWpKD1V/LgGlBiQDtYXGB03i/VhJtr
	 xybEvb/0qwEGcJieEd8G5bWdtkt+so08jHQbjoA2DuW2EwpybbN+oUUsR1wDyimYZb
	 sSEmw51BH1b9g3KtBHsq1n+982tys7qVjT7w3Fs+/veYXlz310U+DssWkWzox1vz8W
	 ZW5OREVboU47HrGZaNRzQ43sIyyNi1CzUB4GYwGQNRdDjQ00rND8KDwMraHh5lhYZB
	 iO5PrBmV3Oc3IFrIpDTe2zl3YsFGTI9fCc11Bx4cBTrtaOETVTT0MLdEjXnT7lIBeX
	 xH/WZguWLMezw==
Date: Thu, 27 Mar 2025 15:59:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] CI: Change pipeline name for scheduled pipeline
In-Reply-To: <20250327103345.21306-1-anthony.perard@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2503271559510.563920@ubuntu-linux-20-04-desktop>
References: <20250327103345.21306-1-anthony.perard@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Mar 2025, Anthony PERARD wrote:
> This description is already displayed on the web UI of the list of
> pipeline, but using it as "name" will make it available in webhooks as
> well and can be used by a bot.
> 
> This doesn't change the behavior for other pipeline types, where the
> variable isn't set.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Notes:
>     doc:
>     https://docs.gitlab.com/ci/yaml/#workflowname
>     https://docs.gitlab.com/ci/variables/predefined_variables/#predefined-variables
> 
>  .gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index b3beb2ff9d..7974ac4e82 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -4,6 +4,7 @@ variables:
>      description: "Regex to select only some jobs, must be enclosed with /. For example /job1|job2/"
>  
>  workflow:
> +  name: "$CI_PIPELINE_SCHEDULE_DESCRIPTION"
>    rules:
>      - if: $CI_COMMIT_BRANCH =~ /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
>        when: never
> -- 
> 
> 
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 

