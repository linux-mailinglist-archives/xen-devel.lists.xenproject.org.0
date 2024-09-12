Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC43975DE9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 02:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796908.1206618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXX6-00036f-A8; Thu, 12 Sep 2024 00:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796908.1206618; Thu, 12 Sep 2024 00:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXX6-00034B-6k; Thu, 12 Sep 2024 00:18:00 +0000
Received: by outflank-mailman (input) for mailman id 796908;
 Thu, 12 Sep 2024 00:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soXX5-000343-Do
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 00:17:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75fefcc4-709c-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 02:17:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07D575C0776;
 Thu, 12 Sep 2024 00:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777BFC4CEC0;
 Thu, 12 Sep 2024 00:17:55 +0000 (UTC)
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
X-Inumbo-ID: 75fefcc4-709c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726100276;
	bh=jNPHq9lgex79uKX0sg00kTOKdHkuYlIH84/HULuimZk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XxzXjNVzBLTiqXmIzpHHfBRhNk87Zg4d6vKuht1F3HWh/nWsvy8+F7K2kBNW4nBjv
	 0Ra8wjoOWmtlD2jC6sDBrc72uugV5nZjLiAfW/YcM8PgmSVUMmuIyUzmLxuhnyF6KQ
	 RFoLoAoiltTg4uHNohynW4HNlcuYYKgIpKdwtEnP0wP5doUepbq3/u/Ne1x/oRtyKD
	 HxCySaVVZCQO44AYU0QxP5fw1WAeJNEoZiPAZ56lp/UWg83JhDx3q7wtb3Np6bQ2UI
	 ZYmHrLetn7zw4p/8CGyrFz3Fs9W21/9VHx9qa8s7LgeU/e3KR4J52HasgFoHYTDbZv
	 BH5KykCL+DazQ==
Date: Wed, 11 Sep 2024 17:17:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 3/3] automation/eclair: tag Rule 13.6 as clean
In-Reply-To: <5d95cef297b3f18f96e9261394046b4c741486c9.1725994633.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2409111717260.611587@ubuntu-linux-20-04-desktop>
References: <cover.1725994633.git.federico.serafini@bugseng.com> <5d95cef297b3f18f96e9261394046b4c741486c9.1725994633.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Federico Serafini wrote:
> Update ECLAIR configuration to consider Rule 13.6 as clean:
> introducing violations of this rule will cause a failure of the CI pipeline.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>


With of course the understanding that this patch can only be committed
after the last two 13.6 fixes are committed:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index b8448938e6..76032b1fe1 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -60,6 +60,7 @@ MC3R1.R11.6||
>  MC3R1.R11.7||
>  MC3R1.R11.9||
>  MC3R1.R12.5||
> +MC3R1.R13.6||
>  MC3R1.R14.1||
>  MC3R1.R14.3||
>  MC3R1.R14.4||
> -- 
> 2.34.1
> 

