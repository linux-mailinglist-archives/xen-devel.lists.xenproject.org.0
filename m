Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9AA6CB2EA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 02:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515503.798451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgxcn-00008M-7g; Tue, 28 Mar 2023 00:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515503.798451; Tue, 28 Mar 2023 00:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgxcn-00004v-4f; Tue, 28 Mar 2023 00:55:45 +0000
Received: by outflank-mailman (input) for mailman id 515503;
 Tue, 28 Mar 2023 00:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=by25=7U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pgxcm-0008WU-KK
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 00:55:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d4be67-cd03-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 02:55:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A2116151A;
 Tue, 28 Mar 2023 00:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9378AC433D2;
 Tue, 28 Mar 2023 00:55:40 +0000 (UTC)
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
X-Inumbo-ID: 43d4be67-cd03-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679964941;
	bh=QwH876x3Xp10ISoavWb7onImESnjGegfwz5SnvRb7wc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S16sYIwqrLX1eTj5H/GZ+abc7GpYxt7lVfOdQKnuT5daJI+1x41cgxn8vavrciCOx
	 zSiYyVgWAL6MlsWhj0m0MRsvXF7EJdZH1mWpRJ9vJaaJ8q+HU9VgK4iC/vjT7XMTI+
	 ZJ1KHgMtmhRULeNUJ6AGQKbQzjL9s8fLtW4kYsqLFOY4+gIt7/P6Mtfx9sUYEtf0s8
	 /2v+Dpxt5njt+musQuLNxE20HMLxUGexNrbwlczwL9KKUkEC33smr3XSmxotCHpRHT
	 yuGLqlttnLDDYyxA4O87a2pFQMM01b4yZyCXWpnuwH0sTq3Pvj9TZH3AqJe+Zk2Hgj
	 xgIOKAl8WenQw==
Date: Mon, 27 Mar 2023 17:55:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/7] xen/x86: Replace GPL v2.0 license boilerplate
 with an SPDX tag in *.c (part 3)
In-Reply-To: <20230327184520.81828-4-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2303271755200.4066@ubuntu-linux-20-04-desktop>
References: <20230327184520.81828-1-julien@xen.org> <20230327184520.81828-4-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Mar 2023, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> It is easier to understand the license of a file when using SPDX.
> 
> This is replacing the below pattern with the SPDX tag GPL-2.0-only
> in xen/arch/x86/*.c:
> 
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms and conditions of the GNU General Public
>  * License, version 2, as published by the Free Software Foundation.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
>  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>  * General Public License for more details.
>  *
>  * You should have received a copy of the GNU General Public
>  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
>     Changes in v2:
>         - Switch SPDX to GPL-2.0-only
> 
> 42sh> cat gpl-2.0-pattern-2.txt
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms and conditions of the GNU General Public
>  * License, version 2, as published by the Free Software Foundation.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
>  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>  * General Public License for more details.
>  *
>  * You should have received a copy of the GNU General Public
>  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
> 42sh> find xen/arch/x86/ -name '*.c' -exec replace_license.py gpl-2.0-pattern-2.txt GPL-2.0-only {} \;

I ran the same commands on my system and the result is the same.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
>  xen/arch/x86/hvm/dom0_build.c       | 13 +------------
>  xen/arch/x86/hvm/domain.c           | 13 +------------
>  xen/arch/x86/pv/callback.c          | 13 +------------
>  xen/arch/x86/pv/descriptor-tables.c | 13 +------------
>  xen/arch/x86/pv/grant_table.c       | 13 +------------
>  xen/arch/x86/pv/mm.c                | 13 +------------
>  6 files changed, 6 insertions(+), 72 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index d44de7f2b2c6..fd2cbf68bc62 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -1,21 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * hvm/dom0_build.c
>   *
>   * Dom0 builder for PVH guest.
>   *
>   * Copyright (C) 2017 Citrix Systems R&D
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms and conditions of the GNU General Public
> - * License, version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public
> - * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #include <xen/acpi.h>
> diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> index 10e30175a1b6..deec74fdb4f5 100644
> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -1,19 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * HVM domain specific functions.
>   *
>   * Copyright (C) 2017 Citrix Systems R&D
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms and conditions of the GNU General Public
> - * License, version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public
> - * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #include <xen/domain_page.h>
> diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
> index 067ee3b795d0..702a68def69c 100644
> --- a/xen/arch/x86/pv/callback.c
> +++ b/xen/arch/x86/pv/callback.c
> @@ -1,19 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * pv/callback.c
>   *
>   * hypercall handles and helper functions for guest callback
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms and conditions of the GNU General Public
> - * License, version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public
> - * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #include <xen/event.h>
> diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
> index b4135b450cdf..02647a2c5047 100644
> --- a/xen/arch/x86/pv/descriptor-tables.c
> +++ b/xen/arch/x86/pv/descriptor-tables.c
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * arch/x86/pv/descriptor-tables.c
>   *
> @@ -5,18 +6,6 @@
>   *
>   * Copyright (c) 2002-2005 K A Fraser
>   * Copyright (c) 2004 Christian Limpach
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms and conditions of the GNU General Public
> - * License, version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public
> - * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #include <xen/guest_access.h>
> diff --git a/xen/arch/x86/pv/grant_table.c b/xen/arch/x86/pv/grant_table.c
> index 81c72e61ed55..247436a0156a 100644
> --- a/xen/arch/x86/pv/grant_table.c
> +++ b/xen/arch/x86/pv/grant_table.c
> @@ -1,21 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * pv/grant_table.c
>   *
>   * Grant table interfaces for PV guests
>   *
>   * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms and conditions of the GNU General Public
> - * License, version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public
> - * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #include <xen/types.h>
> diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
> index 5ed7b3ccdbf2..24f0d2e4ff7d 100644
> --- a/xen/arch/x86/pv/mm.c
> +++ b/xen/arch/x86/pv/mm.c
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
>  /*
>   * pv/mm.c
>   *
> @@ -5,18 +6,6 @@
>   *
>   * Copyright (c) 2002-2005 K A Fraser
>   * Copyright (c) 2004 Christian Limpach
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms and conditions of the GNU General Public
> - * License, version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public
> - * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
>  #include <xen/guest_access.h>
> -- 
> 2.39.2
> 
> 

