Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487CF710A34
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 12:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539525.840490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q28KP-0001Bo-6E; Thu, 25 May 2023 10:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539525.840490; Thu, 25 May 2023 10:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q28KP-000199-3V; Thu, 25 May 2023 10:36:17 +0000
Received: by outflank-mailman (input) for mailman id 539525;
 Thu, 25 May 2023 10:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ga2A=BO=citrix.com=prvs=5022cd99a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q28KO-000193-1J
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 10:36:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7c50c54-fae7-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 12:36:14 +0200 (CEST)
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
X-Inumbo-ID: f7c50c54-fae7-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685010974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mA6akEa2coskAXl2tw+5C0vLkLFfO7xbPc822gVdzDU=;
  b=hWaYs6QXY++ILrynlyoPcnCFBsjvbFmT/9l/8nN6NR6jSqtPn/tSHv9W
   5xD0yMnCGCy4RWCpSfonMmdH0NJI0pg4Y/5UQsAlJf45DxE/3o4xL1lVC
   dTDstivONcoo+ccjuPmfm/p3GxWFPgogDnPKwZuOSOJB/T4/qCXh7QfSU
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112826491
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:F2fOl6+/k5YlxMCft662DrUDTH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jZODW6OO/7cMDehLtF/OoXk8U8G7JHRnd9hT1E+/y88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKoX5AO2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl33
 KEBOChUcSy/jv7n2pWiafJ3wcg8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxxzI/
 Dyarj2R7hcyE/C1lgDeqFWVnvbmuyejG7wuSLbhz6s/6LGU7jNKU0BHPbehmtG7gEOjX9NUK
 2QP5zEj66M18SSDTMT5XhC+iG6JuFgbQdU4O/Yh9AiHx67Q4gCYLmsJVDhMbJohrsBebSMu/
 k+EmZXuHzMHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnR85uCqevgvXpGDv7x
 HaBqy1WulkIpZdVjePhpwmB2m/y4MGTFWbZ+zk7QEqcx15gdJb8eLCU4ESK99FZD52CCVWe6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSiay4hTiFfKsEy/tX1
 XKnnSGEUx4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgvSP71itvje+ViNm
 zq6Cydt40wFONASnwGNqdJDRbz0BSNT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7FYc1Buvr6Qp
 BmVAxYIoGcTcFWbcW1mnFg/MuKwNXu+xFpnVRER0aGAgiZ9MdbxtfZHL/Pav9APrYRe8BK9d
 NFdE+3oPxiFYm2vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:CB5NB6DYzypvg1PlHemU55DYdb4zR+YMi2TDtnoBLyC9Hfb4qy
 nDppQmPHzP+VEssRMb6LW90cC7KBu2n/MYjucs1NGZLWrbUQCTXeVfBOXZsl/d8/GXzJ8h6U
 4aSdkGNDQ1NykD/L2KmnjFL+od
X-Talos-CUID: =?us-ascii?q?9a23=3AgRnweGm2j/+Me4Rv5jcqilHL8DjXOUT0kW7AOxa?=
 =?us-ascii?q?nNVpgVOyPbkaz47gjn9U7zg=3D=3D?=
X-Talos-MUID: 9a23:Qvs3jAT+QTei3Yc9RXTLqBs9DpwyxJ22EWkrlc1FhfXYPnVJbmI=
X-IronPort-AV: E=Sophos;i="6.00,190,1681185600"; 
   d="scan'208";a="112826491"
Date: Thu, 25 May 2023 11:36:05 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 02/15] build: rework asm-offsets.* build step to use
 kbuild
Message-ID: <6bba5a7f-baca-4d36-b75e-46644fe94759@perard>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-3-anthony.perard@citrix.com>
 <6cf71fcf-789a-e80d-2d9d-407257fe5e3f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6cf71fcf-789a-e80d-2d9d-407257fe5e3f@suse.com>

On Wed, May 24, 2023 at 04:09:39PM +0200, Jan Beulich wrote:
> On 23.05.2023 18:37, Anthony PERARD wrote:
> > Use $(if_changed_dep, ) macro to generate "asm-offsets.s" and remove
> > the use of $(move-if-changes,). That mean that "asm-offset.s" will be
> > changed even when the output doesn't change.
> > 
> > But "asm-offsets.s" is only used to generated "asm-offsets.h". So
> > instead of regenerating "asm-offsets.h" every time "asm-offsets.s"
> > change, we will use "$(filechk, )" to only update the ".h" when the
> > output change. Also, with "$(filechk, )", the file does get
> > regenerated when the rule change in the makefile.
> > 
> > This changes also result in a cleaner build log.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> > 
> > Instead of having a special $(cmd_asm-offsets.s) command, we could
> > probably reuse $(cmd_cc_s_c) from Rules.mk, but that would mean that
> > an hypothetical additional flags "-flto" in CFLAGS would not be
> > removed anymore, not sure if that matter here.
> 
> There's no real code being generated there, and what we're after are
> merely the special .ascii directives. So the presence of -flto should
> have no effect there, and hence it would even look more consistent to
> me if we didn't use different options (and even rules) for .c -> .s
> transformations.
> 
> > But then we could write this:
> > 
> > targets += arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s
> > arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s: CFLAGS-y += -g0
> > arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.s FORCE
> > 
> > instead of having to write a rule for asm-offsets.s
> 
> Ftaod, I'd be happy to ack the patch as it is, but I would favor if
> you could do the rework / simplification as outlined.

Thanks, I'll do this rework.

-- 
Anthony PERARD

