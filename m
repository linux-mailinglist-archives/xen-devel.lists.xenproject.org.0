Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC1EB54093
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 04:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121269.1465682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwtj3-00044P-8w; Fri, 12 Sep 2025 02:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121269.1465682; Fri, 12 Sep 2025 02:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwtj3-00042s-6Q; Fri, 12 Sep 2025 02:41:25 +0000
Received: by outflank-mailman (input) for mailman id 1121269;
 Fri, 12 Sep 2025 02:41:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uwtj2-00042J-5u
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 02:41:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwtj1-006Gyr-2o;
 Fri, 12 Sep 2025 02:41:23 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uwtj1-00556J-2k;
 Fri, 12 Sep 2025 02:41:23 +0000
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
	bh=XkovJnvqB+4UBBkHkUhrOHgvkoti+hw9OZjVaGMk/JE=; b=yUUO/s2VzG4Lt3RnTnJbfDIk8U
	nzecdCcfv40mA29iN/mILZSp4kzffN4dLctK0uUiTzh1V4s6hTGjbOG9UTUjJsgd2oMa/LQewqB+z
	j1flwHIsWfp7qlOECDN2MxlW+1VuK025GtZyPbMx0F8zvwnBqQOfDNL/s1GiRGGOOylo=;
From: dmukhin@xen.org
Date: Thu, 11 Sep 2025 19:41:22 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 5/5] CHANGELOG: Notes about distro changes in CI
Message-ID: <aMOIUpE3TZVVrNnF@kraken>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
 <20250911231216.1886818-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911231216.1886818-6-andrew.cooper3@citrix.com>

On Fri, Sep 12, 2025 at 12:12:16AM +0100, Andrew Cooper wrote:
> Also state the RISC-V baseline now it's been set, as it's the reason why
> RISC-V Bullseye got dropped.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> v2:
>  * New
> ---
>  CHANGELOG.md | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 7bd96ac09d14..ca1b43b940d2 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -10,6 +10,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - The minimum toolchain requirements have increased for some architectures:
>     - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>     - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
> +   - For RISC-V, GCC 12.2 and Binutils 2.39
> + - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
> +   to the baseline change.
>   - Linux based device model stubdomains are now fully supported.
>  
>   - On x86:
> -- 
> 2.39.5
> 
> 

