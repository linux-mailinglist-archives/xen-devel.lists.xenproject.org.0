Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0868C02CCA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 19:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149527.1481149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBzTW-0000Lg-Sf; Thu, 23 Oct 2025 17:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149527.1481149; Thu, 23 Oct 2025 17:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBzTW-0000KE-Po; Thu, 23 Oct 2025 17:51:46 +0000
Received: by outflank-mailman (input) for mailman id 1149527;
 Thu, 23 Oct 2025 17:51:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YwCF=5A=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vBzTV-0000K7-IU
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 17:51:45 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec5b7cfa-b038-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 19:51:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 158474465D;
 Thu, 23 Oct 2025 17:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C710DC4CEE7;
 Thu, 23 Oct 2025 17:51:35 +0000 (UTC)
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
X-Inumbo-ID: ec5b7cfa-b038-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761241896;
	bh=gn6UH8np+oYtcgbB1GF2veKUFHfEzZ0+5+K6zjrqUyg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mUKWOtRX+LsL3nm9z/l4hJ2U1TobCP8gDawYG1mKxBmkrYmP3wj202FzJaWgWwYDI
	 dSrsF/6zTbthOB7zjoORG0iyUYM9FVcWBUHpHKDD/6cSZj/uyxk6JqW7Y8FIOKn1GR
	 pljf28/H1F5Ix1858lo04PnE/LxYedTx3VdtQlopaaBkBaKnmWtCc4IxCC3RQauFa4
	 32byro11YpXqS++jbWYWEeNjVyDpwZQ4cpqE0wS/0A3okqx2fO2WhSnaEVS3Sksw+f
	 tQpJ1tvjessbPHWE2Hrjo3AYG4Ya55Sjfnm3GIn4jzvQbF4koH0QQxMxJNwEXuVOm0
	 B36NGk30EpoIg==
Date: Thu, 23 Oct 2025 10:51:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: oleksii.kurochko@gmail.com
cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    oleksii.kurochko@gmail.com, sstabellini@kernel.org
Subject: Re: [PATCH 0/2] xen: randconfig fixes
In-Reply-To: <alpine.DEB.2.22.394.2510221616570.495094@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2510231051270.495094@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2510221616570.495094@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Oleksii,

The two patches solved the problem and survived 1000 iterations on
gitlab. They are reviewed and acked.

Can I go ahead and commit them to staging so that they will be in RC3?

Cheers,

Stefano


On Wed, 22 Oct 2025, Stefano Stabellini wrote:
> Hi all,
> 
> I tested the two fixes together for 1000 randconfig build tests here:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2114931367
> 
> And also locally on my workstation for a full day successfully.
> 
> 
> Jan Beulich (1):
>       x86/mm: correct PG_log_dirty definition again
> 
> Stefano Stabellini (1):
>       xen: fix randconfig build problems after introducing SYSCTL
> 
>  xen/arch/x86/hvm/Kconfig          | 1 +
>  xen/arch/x86/include/asm/paging.h | 2 +-
>  xen/common/Kconfig                | 1 +
>  xen/include/hypercall-defs.c      | 4 ++--
>  4 files changed, 5 insertions(+), 3 deletions(-)
> 

