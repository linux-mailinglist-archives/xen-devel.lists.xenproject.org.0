Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0526F8C6E
	for <lists+xen-devel@lfdr.de>; Sat,  6 May 2023 00:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530685.826446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv40o-0000UL-Ai; Fri, 05 May 2023 22:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530685.826446; Fri, 05 May 2023 22:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv40o-0000Rn-7K; Fri, 05 May 2023 22:34:50 +0000
Received: by outflank-mailman (input) for mailman id 530685;
 Fri, 05 May 2023 22:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSQs=A2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pv40m-0000Rh-LW
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 22:34:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09b6a312-eb95-11ed-b226-6b7b168915f2;
 Sat, 06 May 2023 00:34:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D31DB64151;
 Fri,  5 May 2023 22:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C84DC433D2;
 Fri,  5 May 2023 22:34:44 +0000 (UTC)
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
X-Inumbo-ID: 09b6a312-eb95-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683326085;
	bh=C/tyMP0on/mJnQfCVGm2XWdaMp5GF2+MJvI5FCXTLqw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DgNoqDqYcVbOWM3f1/A10Xt2InPUysmrPBBiqkpFrPuF89iQLuhs84grhdxWLq8qJ
	 8Zi8OKJOy1SgtK4YkipQD3naH/FzZsIotDzXMu0Jq95aQaiQj5kXm8nHKGdnrY12Tt
	 V/xZtvlupwWCOmgr5AmSaMsjBERFG1avpPqrQ+NNEVkvWmH0ARbdDQr9WVdG74gSAo
	 NRnPCaMp+aiRbUtRETTtZ1cwsDMlP9+m0DJtkcD8kDEwwDldiqOj/I+GwOz3q7vWBL
	 HUVgIthV5MSAvNzY5I1gNJWZVJvpin43ztSXsYdcgVl+mOFfYBwZ7N+flRGKcAoM7F
	 /ajPZcMvRlHbQ==
Date: Fri, 5 May 2023 15:34:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 2/2] LICENSES: Remove the use of deprecated SPDX
 tags
In-Reply-To: <20230505181528.3587485-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2305051534190.974517@ubuntu-linux-20-04-desktop>
References: <20230505181528.3587485-1-andrew.cooper3@citrix.com> <20230505181528.3587485-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 May 2023, Andrew Cooper wrote:
> The GPL and LGPL SPDX forms without an explicit -only or -or-later suffix are
> deprecated and should not be used.  Update the documention.
> 
> Somewhat unhelpfully at the time of writing, this only appears to be indicated
> by the separation of the two tables at https://spdx.org/licenses/
> 
> The recent changes to libacpi are the only examples of deprecated LGPL tags in
> tree, so fix them all up.
> 
> For GPL, we have many examples using deprecated tags.  For now, just identify
> them as such and recommend that no new instances get added.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> 
> Unsure whether this should get some Fixes: tags or not.  Note also that
> Jenny's "[PATCH v4 2/2] acpi: Add TPM2 interface definition." wants its SPDX
> tag correcting as per this patch.
> 
> v2:
>  * Extend commit message to include https://spdx.org/licenses/
>  * Update the URLs too
> ---
>  LICENSES/GPL-2.0                    | 15 ++++++++-------
>  LICENSES/LGPL-2.0                   | 11 ++++++-----
>  LICENSES/LGPL-2.1                   | 11 ++++++-----
>  tools/libacpi/Makefile              |  2 +-
>  tools/libacpi/acpi2_0.h             |  2 +-
>  tools/libacpi/build.c               |  2 +-
>  tools/libacpi/dsdt.asl              |  2 +-
>  tools/libacpi/dsdt_acpi_info.asl    |  2 +-
>  tools/libacpi/libacpi.h             |  2 +-
>  tools/libacpi/mk_dsdt.c             |  2 +-
>  tools/libacpi/ssdt_laptop_slate.asl |  2 +-
>  tools/libacpi/ssdt_pm.asl           |  2 +-
>  tools/libacpi/ssdt_s3.asl           |  2 +-
>  tools/libacpi/ssdt_s4.asl           |  2 +-
>  tools/libacpi/ssdt_tpm.asl          |  2 +-
>  tools/libacpi/static_tables.c       |  2 +-
>  16 files changed, 33 insertions(+), 30 deletions(-)
> 
> diff --git a/LICENSES/GPL-2.0 b/LICENSES/GPL-2.0
> index fa5c66236fe9..07f332641ccd 100644
> --- a/LICENSES/GPL-2.0
> +++ b/LICENSES/GPL-2.0
> @@ -1,9 +1,11 @@
> -Valid-License-Identifier: GPL-2.0
>  Valid-License-Identifier: GPL-2.0-only
> -Valid-License-Identifier: GPL-2.0+
>  Valid-License-Identifier: GPL-2.0-or-later
>  
> -SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
> +SPDX-URL: https://spdx.org/licenses/GPL-2.0-only.html
> +SPDX-URL: https://spdx.org/licenses/GPL-2.0-or-later.html
> +
> +Deprecated-Identifier: GPL-2.0
> +Deprecated-Identifier: GPL-2.0+
>  
>  Usage-Guide:
>  
> @@ -13,14 +15,13 @@ Usage-Guide:
>  
>    For 'GNU General Public License (GPL) version 2 only' use:
>      SPDX-License-Identifier: GPL-2.0-only
> -  or (now deprecated)
> -    SPDX-License-Identifier: GPL-2.0
>  
>    For 'GNU General Public License (GPL) version 2 or any later version' use:
> -    SPDX-License-Identifier: GPL-2.0+
> -  or
>      SPDX-License-Identifier: GPL-2.0-or-later
>  
> +  The deprecated tags should not be used for any new additions.  Where
> +  possible, their existing uses should be phased out.
> +
>  License-Text:
>  
>  		    GNU GENERAL PUBLIC LICENSE
> diff --git a/LICENSES/LGPL-2.0 b/LICENSES/LGPL-2.0
> index 2fa16d72eabf..100c72c6db8c 100644
> --- a/LICENSES/LGPL-2.0
> +++ b/LICENSES/LGPL-2.0
> @@ -1,7 +1,8 @@
> -Valid-License-Identifier: LGPL-2.0
> -Valid-License-Identifier: LGPL-2.0+
> +Valid-License-Identifier: LGPL-2.0-only
> +Valid-License-Identifier: LGPL-2.0-or-later
>  
> -SPDX-URL: https://spdx.org/licenses/LGPL-2.0.html
> +SPDX-URL: https://spdx.org/licenses/LGPL-2.0-only.html
> +SPDX-URL: https://spdx.org/licenses/LGPL-2.0-or-later.html
>  
>  Usage-Guide:
>  
> @@ -10,11 +11,11 @@ Usage-Guide:
>    guidelines in the licensing rules documentation.
>  
>    For 'GNU Library General Public License (LGPL) version 2.0 only' use:
> -    SPDX-License-Identifier: LGPL-2.0
> +    SPDX-License-Identifier: LGPL-2.0-only
>  
>    For 'GNU Library General Public License (LGPL) version 2.0 or any later
>    version' use:
> -    SPDX-License-Identifier: LGPL-2.0+
> +    SPDX-License-Identifier: LGPL-2.0-or-later
>  
>  License-Text:
>  
> diff --git a/LICENSES/LGPL-2.1 b/LICENSES/LGPL-2.1
> index b366c7e49199..d3e213c39c26 100644
> --- a/LICENSES/LGPL-2.1
> +++ b/LICENSES/LGPL-2.1
> @@ -1,7 +1,8 @@
> -Valid-License-Identifier: LGPL-2.1
> -Valid-License-Identifier: LGPL-2.1+
> +Valid-License-Identifier: LGPL-2.1-only
> +Valid-License-Identifier: LGPL-2.1-or-later
>  
> -SPDX-URL: https://spdx.org/licenses/LGPL-2.1.html
> +SPDX-URL: https://spdx.org/licenses/LGPL-2.1-only.html
> +SPDX-URL: https://spdx.org/licenses/LGPL-2.1-or-later.html
>  
>  Usage-Guide:
>  
> @@ -10,11 +11,11 @@ Usage-Guide:
>    guidelines in the licensing rules documentation.
>  
>    For 'GNU Lesser General Public License (LGPL) version 2.1 only' use:
> -    SPDX-License-Identifier: LGPL-2.1
> +    SPDX-License-Identifier: LGPL-2.1-only
>  
>    For 'GNU Lesser General Public License (LGPL) version 2.1 or any later
>    version' use:
> -    SPDX-License-Identifier: LGPL-2.1+
> +    SPDX-License-Identifier: LGPL-2.1-or-later
>  
>  License-Text:
>  
> diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
> index aa9c520cbe85..bcfcd852f92f 100644
> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -1,4 +1,4 @@
> -# SPDX-License-Identifier: LGPL-2.1
> +# SPDX-License-Identifier: LGPL-2.1-only
>  #
>  # Copyright (c) 2004, Intel Corporation.
>  
> diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
> index 212f5ab64182..e00b29854be0 100644
> --- a/tools/libacpi/acpi2_0.h
> +++ b/tools/libacpi/acpi2_0.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /*
>   * Copyright (c) 2004, Intel Corporation.
>   */
> diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
> index 830d37c61f03..3142e0ac84c0 100644
> --- a/tools/libacpi/build.c
> +++ b/tools/libacpi/build.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /*
>   * Copyright (c) 2004, Intel Corporation.
>   * Copyright (c) 2006, Keir Fraser, XenSource Inc.
> diff --git a/tools/libacpi/dsdt.asl b/tools/libacpi/dsdt.asl
> index c6691b56a986..32b42f85ae9f 100644
> --- a/tools/libacpi/dsdt.asl
> +++ b/tools/libacpi/dsdt.asl
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /******************************************************************************
>   * DSDT for Xen with Qemu device model
>   *
> diff --git a/tools/libacpi/dsdt_acpi_info.asl b/tools/libacpi/dsdt_acpi_info.asl
> index c6e82f1fe6a7..6e114fa23404 100644
> --- a/tools/libacpi/dsdt_acpi_info.asl
> +++ b/tools/libacpi/dsdt_acpi_info.asl
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  
>      Scope (\_SB)
>      {
> diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
> index acf012e35578..7ae28525f604 100644
> --- a/tools/libacpi/libacpi.h
> +++ b/tools/libacpi/libacpi.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /******************************************************************************
>   * libacpi.h
>   * 
> diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
> index c74b270c0c5d..34f6753f6193 100644
> --- a/tools/libacpi/mk_dsdt.c
> +++ b/tools/libacpi/mk_dsdt.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  
>  #include <stdio.h>
>  #include <stdarg.h>
> diff --git a/tools/libacpi/ssdt_laptop_slate.asl b/tools/libacpi/ssdt_laptop_slate.asl
> index 494f2d048d0a..69fd504c19fc 100644
> --- a/tools/libacpi/ssdt_laptop_slate.asl
> +++ b/tools/libacpi/ssdt_laptop_slate.asl
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /*
>   * ssdt_conv.asl
>   *
> diff --git a/tools/libacpi/ssdt_pm.asl b/tools/libacpi/ssdt_pm.asl
> index e577e85c072b..db578d10ac3e 100644
> --- a/tools/libacpi/ssdt_pm.asl
> +++ b/tools/libacpi/ssdt_pm.asl
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /*
>   * ssdt_pm.asl
>   *
> diff --git a/tools/libacpi/ssdt_s3.asl b/tools/libacpi/ssdt_s3.asl
> index 8f3177ec5adc..f6e9636f4759 100644
> --- a/tools/libacpi/ssdt_s3.asl
> +++ b/tools/libacpi/ssdt_s3.asl
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /*
>   * ssdt_s3.asl
>   *
> diff --git a/tools/libacpi/ssdt_s4.asl b/tools/libacpi/ssdt_s4.asl
> index 979318eca1f5..8014f5fc9014 100644
> --- a/tools/libacpi/ssdt_s4.asl
> +++ b/tools/libacpi/ssdt_s4.asl
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /*
>   * ssdt_s4.asl
>   *
> diff --git a/tools/libacpi/ssdt_tpm.asl b/tools/libacpi/ssdt_tpm.asl
> index 6c3267218f3b..944658d25177 100644
> --- a/tools/libacpi/ssdt_tpm.asl
> +++ b/tools/libacpi/ssdt_tpm.asl
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /*
>   * ssdt_tpm.asl
>   *
> diff --git a/tools/libacpi/static_tables.c b/tools/libacpi/static_tables.c
> index 631fb911413b..715f46fee05c 100644
> --- a/tools/libacpi/static_tables.c
> +++ b/tools/libacpi/static_tables.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: LGPL-2.1 */
> +/* SPDX-License-Identifier: LGPL-2.1-only */
>  /*
>   * Copyright (c) 2004, Intel Corporation.
>   * Copyright (c) 2006, Keir Fraser, XenSource Inc.
> -- 
> 2.30.2
> 

