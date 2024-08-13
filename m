Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C987594FB44
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775805.1185994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgbl-0002TG-3o; Tue, 13 Aug 2024 01:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775805.1185994; Tue, 13 Aug 2024 01:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgbl-0002R6-0u; Tue, 13 Aug 2024 01:45:57 +0000
Received: by outflank-mailman (input) for mailman id 775805;
 Tue, 13 Aug 2024 01:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sdgbj-0002Qe-Pp
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:45:55 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6003687-5915-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 03:45:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CA89ACE10D3;
 Tue, 13 Aug 2024 01:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C3AC4AF0D;
 Tue, 13 Aug 2024 01:45:49 +0000 (UTC)
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
X-Inumbo-ID: c6003687-5915-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513551;
	bh=ECjQDs9jziapBcyXSTtq2tx6hUghV1n/XxS12P5heA0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RL1TyfKukkhFoK7lg6aUIzmfh+UjCF4vgBgj42v8NqiVovWn08NTuEl/1OommeWCx
	 eakdXydKoigcr39Mo32UuHCs/YG1M3OBrPyxngLg46TVYz3FATUxnnY0HzZkIcF9Yd
	 xZMqPwlD5nrweeprJkCRwBIA87nkrBC80sGSi5dyt1QHcXZDVhbCiCLpa940JbV+tA
	 EfSbNMaBoHu9PafV01E2G5RCkCd/+D8WQBsTxUYVNtHuHa8uPl1Dt8rgQzX09wvfXK
	 U+4fUVTaP8HiQIqn86tC8bSUJQDnGkIzknVUcKsC1ycdrNGUfTip80tTECBLDblCau
	 C89g7o2ir0RaA==
Date: Mon, 12 Aug 2024 18:45:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v1 02/10] hw/arm: xenpvh: Update file header to use
 SPDX
In-Reply-To: <20240812130606.90410-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121646560.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-3-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Update file header to use SPDX and remove stray empty
> comment line.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 6fad829ede..766a194fa1 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -1,24 +1,7 @@
>  /*
>   * QEMU ARM Xen PVH Machine
>   *
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a copy
> - * of this software and associated documentation files (the "Software"), to deal
> - * in the Software without restriction, including without limitation the rights
> - * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> - * copies of the Software, and to permit persons to whom the Software is
> - * furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
~ - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> - * THE SOFTWARE.
> + * SPDX-License-Identifier: MIT
>   */
>  
>  #include "qemu/osdep.h"
> -- 
> 2.43.0
> 

