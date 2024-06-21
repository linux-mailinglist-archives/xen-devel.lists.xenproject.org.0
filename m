Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F1913001
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 00:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745638.1152784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmMn-000475-35; Fri, 21 Jun 2024 22:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745638.1152784; Fri, 21 Jun 2024 22:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmMn-00044b-0I; Fri, 21 Jun 2024 22:04:21 +0000
Received: by outflank-mailman (input) for mailman id 745638;
 Fri, 21 Jun 2024 22:04:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKmMk-00044Q-SZ
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 22:04:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32580418-301a-11ef-b4bb-af5377834399;
 Sat, 22 Jun 2024 00:04:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C606362FB6;
 Fri, 21 Jun 2024 22:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B008EC2BBFC;
 Fri, 21 Jun 2024 22:04:12 +0000 (UTC)
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
X-Inumbo-ID: 32580418-301a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719007453;
	bh=dMWh1Luls1b6qBIQ0xU1ayjG7GSZglQmnCDQ7tAZGJo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fNQ0KBFQWDHiH/0m3ThZSQaeLNZb+D5ludLK7ykuON0e3xjWYe56tWsDxg4vFXR6+
	 uBIpCvFjtc167FEd6OP2fYG71adUI33JHyXwZCusXeFp6xkVtPRKtgDT2cq/oQX+xF
	 YBmteeczG+zfXysoQG1+OR5ydB73LMU9O+5ZPDS3Dv5XaCZYaHB6iCI7tyDv8Nturd
	 sbNNNBj5YKzmGpJ8Rtis5VFgE7zBP9c7NDE/d5h9pNaOiGUnuIi49y/mCB5Ry+Jq0r
	 9d4/A6/S38aQS1KoH9b612aKxAUKhBQ+buQg/aCKcB+2tVgE+fxfus4aZvwehA830p
	 zZiSiZbuvWO5Q==
Date: Fri, 21 Jun 2024 15:04:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] automation/eclair_analysis: deviate and|or|xor|not
 for MISRA C Rule 21.2
In-Reply-To: <7b05a537b094598b98b92d0869d16402648fb6f5.1718964932.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406211503370.2572888@ubuntu-linux-20-04-desktop>
References: <7b05a537b094598b98b92d0869d16402648fb6f5.1718964932.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jun 2024, Alessandro Zucchelli wrote:
> Rule 21.2 reports identifiers reserved for the C and POSIX standard
> libraries: or, and, not and xor are reserved identifiers because they
> constitute alternate spellings for the corresponding operators (they are
> defined as macros by iso646.h); however Xen doesn't use standard library
> headers, so there is no risk of overlap.
> 
> This addresses violations arising from x86_emulate/x86_emulate.c, where
> label statements named as or, and and xor appear.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes from v1:
> Added deviation for 'not' identifier.
> Added explanation of where these identifiers are defined, specifically in the
> 'iso646.h' file of the Standard Library.
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 069519e380..14c7afb39e 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -501,7 +501,7 @@ still remain available."
>  -doc_begin="or, and and xor are reserved identifiers because they constitute alternate
>  spellings for the corresponding operators (they are defined as macros by iso646.h).
>  However, Xen doesn't use standard library headers, so there is no risk of overlap."
> --config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor)$)))"}
> +-config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
>  -doc_end

It looks like this patch relies on the previous version to be applied?
Maybe you forgot to squash your changes with your previous patch?

