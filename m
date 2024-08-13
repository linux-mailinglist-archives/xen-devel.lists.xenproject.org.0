Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BBD94FB42
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775804.1185984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgbg-0002FI-TV; Tue, 13 Aug 2024 01:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775804.1185984; Tue, 13 Aug 2024 01:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdgbg-0002CP-Qg; Tue, 13 Aug 2024 01:45:52 +0000
Received: by outflank-mailman (input) for mailman id 775804;
 Tue, 13 Aug 2024 01:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgOn=PM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sdgbf-0002CJ-PR
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:45:51 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3c746a4-5915-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 03:45:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8EAA3CE1098;
 Tue, 13 Aug 2024 01:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FBCC4AF09;
 Tue, 13 Aug 2024 01:45:42 +0000 (UTC)
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
X-Inumbo-ID: c3c746a4-5915-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723513543;
	bh=y7xq1E/AVCMdkVkPZZGZ9H2ZIIdZ94R5oUZ1GBbJ0EM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=q6IONffbf9PePnTEjpMVzp/BFnjwhOSRDZUYQC/vXbIjaq5yrLw/f2nn1rmbA14iS
	 2H/pvK9eDRg3/w/X0N02gNu8P8+VSGhB/9R1cTelc/Kfob5/5+BqJinWX2grM3JIvp
	 eicAG9xCylyfm/HP1LPhNAq0Xx39p1iReKPwCnxB4OPm92sZ7GXGeHnCipzANzEtOB
	 pleBhALP9lwvWXbm/W/muIFZHWF4IIZ0nBwEoEyjTUyBOtz7NpnuolUC2UKcM97Ky7
	 mGX3+squm1cKIElDwSR+M5/rpvXjaUY4+3hKBYPbmYp8dZNWAG5C8SqWTYmXpQ/Qmu
	 RWAFv3BR07o9Q==
Date: Mon, 12 Aug 2024 18:45:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/10] MAINTAINERS: Add docs/system/arm/xenpvh.rst
In-Reply-To: <20240812130606.90410-2-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408121646290.298534@ubuntu-linux-20-04-desktop>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com> <20240812130606.90410-2-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10af212632..a24c2e14d9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -559,6 +559,7 @@ F: include/hw/xen/
>  F: include/sysemu/xen.h
>  F: include/sysemu/xen-mapcache.h
>  F: stubs/xen-hw-stub.c
> +F: docs/system/arm/xenpvh.rst
>  
>  Guest CPU Cores (NVMM)
>  ----------------------
> -- 
> 2.43.0
> 

