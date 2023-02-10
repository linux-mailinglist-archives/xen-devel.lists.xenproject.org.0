Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25719691DA6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 12:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493330.763222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQRHI-0005Rs-Mr; Fri, 10 Feb 2023 11:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493330.763222; Fri, 10 Feb 2023 11:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQRHI-0005PB-JO; Fri, 10 Feb 2023 11:09:16 +0000
Received: by outflank-mailman (input) for mailman id 493330;
 Fri, 10 Feb 2023 11:09:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQRHH-0005P5-D3
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 11:09:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQRHE-0003KR-Rt; Fri, 10 Feb 2023 11:09:12 +0000
Received: from [54.239.6.186] (helo=[192.168.26.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQRHE-0007bs-Jm; Fri, 10 Feb 2023 11:09:12 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=qAQKf3ZgLfRydlGQCnsXnvQTJPMsbGPflQesNI/O3x8=; b=DuNOKKhH9zMlMsjHxNr2aUGPiN
	J8V7sUsBT2Xj41IOLcjCkbUIXx9iZ4ta8bYI1XFwR9a441c5AUEhHPPm5W6NdUCF/Ttz894/Q+KiV
	WaYdNqB9oemRzIoTc5q1PdjFMp6cPFvCSwNcJ4u4YSpXK98YKyPQwTmIbTkprBaFJxsc=;
Message-ID: <a7c067ce-f574-25c2-a8dd-a1541f7867f8@xen.org>
Date: Fri, 10 Feb 2023 11:09:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH 3/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag
 in *.h
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: demi@invisiblethingslab.com, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20230209230020.52695-1-julien@xen.org>
 <20230209230020.52695-4-julien@xen.org>
In-Reply-To: <20230209230020.52695-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/02/2023 23:00, Julien Grall wrote:
> diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
> index 74c0cedd11cc..c0e1380076a7 100644
> --- a/xen/arch/x86/include/asm/hvm/vpt.h
> +++ b/xen/arch/x86/include/asm/hvm/vpt.h
> @@ -1,19 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>   /*
>    * vpt.h: Virtual Platform Timer definitions
>    *
>    * Copyright (c) 2004, Intel Corporation.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program; If not, see <http://www.gnu.org/licenses/>.
>    */
>   
>   #ifndef __ASM_X86_HVM_VPT_H__
> diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
> index fc0afe35bf6b..8e1e0ad9ee18 100644
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Hmmm... I didn't notice that the licence text wasn't removed in iommu.h. 
It looks like this is...


>   /*
>    * This program is free software; you can redistribute it and/or modify it
>    * under the terms and conditions of the GNU General Public License,

... because '*/' is the indented the usual way. I will add the pattern 
in the python script and also harden it to throw an error if it can't 
replace the licence text.

Cheers,

-- 
Julien Grall

