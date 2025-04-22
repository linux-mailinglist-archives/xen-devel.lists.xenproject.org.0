Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B392A9754F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 21:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963441.1354438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7J8M-0000QM-Av; Tue, 22 Apr 2025 19:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963441.1354438; Tue, 22 Apr 2025 19:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7J8M-0000My-7G; Tue, 22 Apr 2025 19:18:18 +0000
Received: by outflank-mailman (input) for mailman id 963441;
 Tue, 22 Apr 2025 19:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQRL=XI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7J8L-0000Ms-KS
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 19:18:17 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89cc727d-1fae-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 21:18:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D8A0437D3;
 Tue, 22 Apr 2025 19:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2C9C4CEE9;
 Tue, 22 Apr 2025 19:18:12 +0000 (UTC)
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
X-Inumbo-ID: 89cc727d-1fae-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745349493;
	bh=UK71251gmHrpbE4GoMq3+Q1TCKZtPTKBOwn/ti16NT4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ue5F6En1AsvCixHsm/mYzNkboBKKyPN/9TwWqib6g1UnacvBvHTONLSO9ixhcymAW
	 piTYU57/C7Nii+dBcZHtCZD+XeEp7FfU282Z6187jN8y+rPU6wVOwZ4ikTWeQgTaAg
	 hxJWXY/RiBP+a6U9l9r9aCRYhhqMxcO1cuyw8VPm54UGOt267eyjDUgnvY5Da+O1Wt
	 YLVIzUGLlKK5+LtJqp/cf+EtJP8s3UbocIDMzijzyLC5hMnvfzvqvAREaVdZonSWO8
	 j5ED0CH5MnKyeG3IqkF3CZersieYaXQ+a3i++7G+qtM/CtCMm1uC9htaCofZVTnYFs
	 cqSFtkiTH5kHg==
Date: Tue, 22 Apr 2025 12:18:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm/alternative: Drop unused includes of
 asm/alternative.h
In-Reply-To: <20250422173058.1459730-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2504221218070.785180@ubuntu-linux-20-04-desktop>
References: <20250422173058.1459730-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/arch/arm/arm64/cache.S | 2 --
>  xen/arch/arm/domain.c      | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/cache.S b/xen/arch/arm/arm64/cache.S
> index 66ed85f73503..c0a8ca163a47 100644
> --- a/xen/arch/arm/arm64/cache.S
> +++ b/xen/arch/arm/arm64/cache.S
> @@ -19,8 +19,6 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -#include <asm/alternative.h>
> -
>  /*
>   * dcache_line_size - get the minimum D-cache line size from the CTR register.
>   */
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index dc4b4e84c1c3..23cf8729f1d7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -12,7 +12,6 @@
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
>  
> -#include <asm/alternative.h>
>  #include <asm/arm64/sve.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> -- 
> 2.39.5
> 

