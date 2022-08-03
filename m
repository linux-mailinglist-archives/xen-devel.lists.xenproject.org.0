Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC860589367
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 22:44:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380099.614073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJLCp-0004FV-JC; Wed, 03 Aug 2022 20:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380099.614073; Wed, 03 Aug 2022 20:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJLCp-0004Cp-Fn; Wed, 03 Aug 2022 20:43:03 +0000
Received: by outflank-mailman (input) for mailman id 380099;
 Wed, 03 Aug 2022 20:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7Vd=YH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oJLCo-0004Cj-JB
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 20:43:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcca16cd-136c-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 22:43:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E55561532;
 Wed,  3 Aug 2022 20:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99833C433D6;
 Wed,  3 Aug 2022 20:42:58 +0000 (UTC)
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
X-Inumbo-ID: dcca16cd-136c-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659559379;
	bh=YeXtbBliMUDISzh6WQ7jb7FiUaupdbolNvxbXwlxVKI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RTsUeBfqLHhaC3YGC76x0tNXuUXkYmww5s0IYyHIBNSHFBftyI2WWr5qyL9b64Vb/
	 IK9Xfpf9wn9siYdIUIH3oUScb0DCtM5ffjcFmsFUUzmezcJWa3rpAE9nr7xu0CYlAw
	 SRKoTggZXIJWaoW1hK24pL648gZTyqNvx5edvlaRFRKqeKGIV434B5wNVdKQYjH32G
	 hW2OeGjx48zjJpZ7oChKGZjWd1qzwZLNiYKU3goJVSNMAQbRwh/aZtP4bm0u5Qndaz
	 CTgpF1zca4Ruy7dLuFpM37MuO1YyDRmhBjIrloielhUebDR25n1SSPldaPx1oB7laa
	 G5Odfk0IvLTFA==
Date: Wed, 3 Aug 2022 13:42:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] doc: Add git commands to generate Fixes
In-Reply-To: <b57628b8cf8355a5f4f32e6ea577689ae7450a69.1659537759.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2208031342190.3147284@ubuntu-linux-20-04-desktop>
References: <b57628b8cf8355a5f4f32e6ea577689ae7450a69.1659537759.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Aug 2022, Bertrand Marquis wrote:
> Add git commands examples that can be used to generate fixes and how to
> use the pretty configuration for git.
> This should make it easier for contributors to have the right format.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/process/sending-patches.pandoc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
> index 7ff7826c992b..9c4c4655323b 100644
> --- a/docs/process/sending-patches.pandoc
> +++ b/docs/process/sending-patches.pandoc
> @@ -102,6 +102,10 @@ E.g.:
>  
>      Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
>  
> +If git was configured as explained earlier, this can be retrieved using
> +``git log --pretty=fixes`` otherwise ``git log --abbrev=12 --oneline`` will
> +give the proper tag and title.
> +
>  ### Backport:
>  
>  A backport tag is an optional tag in the commit message to request a
> -- 
> 2.25.1
~ 

