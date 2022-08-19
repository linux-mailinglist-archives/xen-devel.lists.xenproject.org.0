Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C242599656
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 09:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390066.627262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwnr-0001Xt-Vb; Fri, 19 Aug 2022 07:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390066.627262; Fri, 19 Aug 2022 07:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwnr-0001UW-Sh; Fri, 19 Aug 2022 07:52:27 +0000
Received: by outflank-mailman (input) for mailman id 390066;
 Fri, 19 Aug 2022 07:52:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOwnq-0001UP-HG
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 07:52:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOwnp-0002mB-JF; Fri, 19 Aug 2022 07:52:25 +0000
Received: from [54.239.6.188] (helo=[192.168.16.114])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOwnp-0004GX-CP; Fri, 19 Aug 2022 07:52:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=gaUMOV9gHh3ZP5vqAVQkvHf0gNfXoamg54eNb6z7AEw=; b=rd4sRACjWHp8XFaxCsTrKmBMSA
	oLJxEE41pfSTKNqI/E0ZwZ5Hmd0jRex5IXIKL3nhj/EAg8KeW1duXKR38an2MFbDSeI9nKUxxtuDl
	j3qGutUc7JS/5gV7lph5Gm8ErBwXjS6fkOLRMnASwqdluRhVafB/64JIbrKhvyY2fasI=;
Message-ID: <61b01c8b-1f98-e559-f971-f081a25e0b93@xen.org>
Date: Fri, 19 Aug 2022 08:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 3/3] add SPDX to arch/arm/*.c
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wl@xen.org, jbeulich@suse.com,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
 <20220818220320.2538705-3-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220818220320.2538705-3-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 18/08/2022 23:03, Stefano Stabellini wrote:
> Add SPDX license information to all the *.c files under arch/arm.

There are some of the files below that didn't have copyright. It would 
be worth explaining in the commit message which license you selected and 
how. AFAICT you assumed they were GPLv2 but I am not sure this is 
correct at least one of them.

[...]

> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index f5f6562600..2537dbebc1 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */

This license is not part of LICENSES. Was it intended?

If yes, this should be mentioned in one of the commit message (possible 
patch #2) and maybe in CONTRIBUTING (to tell user to not use it for new 
files) because one could expect all the LICENSES to be listed.

>   /*
>    * xen/arch/arm/decode.c
>    *
> @@ -5,16 +6,6 @@
>    *
>    * Julien Grall <julien.grall@linaro.org>
>    * Copyright (C) 2013 Linaro Limited.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
>    */
>   
>   #include <xen/guest_access.h>

[...]

> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3fd1186b53..b29bdf3aa6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

AFAIU, the assumption is all the files with no copyright are GPLv2. That 
works here. But ...

>   #include <xen/init.h>
>   #include <xen/compile.h>
>   #include <xen/lib.h>
> diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
> index 71182575f9..47405e0866 100644
> --- a/xen/arch/arm/domain_page.c
> +++ b/xen/arch/arm/domain_page.c
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

.... this file was split from mm.c which is gpl-2.0-or-later. So I don't 
think we can use GPL-2.0 here.

>   #include <xen/mm.h>
>   #include <xen/pmap.h>
>   #include <xen/vmap.h>

Cheers,

-- 
Julien Grall

