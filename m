Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59508B54075
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 04:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121211.1465642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwte5-00011U-55; Fri, 12 Sep 2025 02:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121211.1465642; Fri, 12 Sep 2025 02:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwte5-000104-2M; Fri, 12 Sep 2025 02:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1121211;
 Fri, 12 Sep 2025 02:36:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uwte3-0000zy-Jg
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 02:36:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwte2-006Gs0-2z;
 Fri, 12 Sep 2025 02:36:14 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwte2-0054fq-2H;
 Fri, 12 Sep 2025 02:36:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=24T8MpKarVXiuYct/e/CYDD298o/Xba9qUJZu1cUHxo=; b=mpOwiVrtqOSy7n3K/2y0R22x6p
	UXUYLuU8nBNUcxOHETzEcop1k4EZQ5DC26JlVeP5wtneT/1+EaE1YkgoHFBsNSTwA3KZy4NWY2Grg
	GdZ+JxSNZk0WGOEJTy2oDHY1k61CN+9Vmab2bCFn5THWKhQHBKaqzK6bH6ho1zq5z24A=;
From: dmukhin@xen.org
Date: Thu, 11 Sep 2025 19:36:13 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: Re: [PATCH v3 1/5] CI: Use the Debian Trixie container for RISC-V
 test jobs
Message-ID: <aMOHHZ0CJOdNonYm@kraken>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
 <20250911231216.1886818-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911231216.1886818-2-andrew.cooper3@citrix.com>

On Fri, Sep 12, 2025 at 12:12:12AM +0100, Andrew Cooper wrote:
> This was missed when introducing Trixie.
> 
> Fixes: aad6ebf0596f ("CI: Update riscv64 to use Debian Trixie")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Victor Lira <victorm.lira@amd.com>
> 
> v3:
>  * New
> ---
>  automation/gitlab-ci/test.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 95b883b32bb6..1de68a0fe450 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -77,7 +77,7 @@
>  .qemu-riscv64:
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:12-riscv64
> +    CONTAINER: debian:13-riscv64
>      LOGFILE: qemu-smoke-riscv64.log
>    artifacts:
>      paths:
> -- 
> 2.39.5
> 
> 

