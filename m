Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D79729E9E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 17:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546166.852829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7e8W-0003Bo-7R; Fri, 09 Jun 2023 15:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546166.852829; Fri, 09 Jun 2023 15:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7e8W-00039P-4O; Fri, 09 Jun 2023 15:34:48 +0000
Received: by outflank-mailman (input) for mailman id 546166;
 Fri, 09 Jun 2023 15:34:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NPzv=B5=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q7e8V-00035X-7j
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 15:34:47 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2863c468-06db-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 17:34:45 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 4BA093F08F;
 Fri,  9 Jun 2023 08:34:42 -0700 (PDT)
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
X-Inumbo-ID: 2863c468-06db-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686324883; bh=oyGAJiSll86ehtygLyDnbLJfDxeBK+sytUj9BYl6Jdw=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=PHt+o53aAWiJkHTWsantC+yghG+Vt79PUMfhqkwd9+jIxl7SCHsPv7P1oJRbFItpZ
	 H6zglebXVRlygVXiKB4ayV1njyt9rHTKHESI4kYX6wiY4/r4TNo6YMQXcTtwSMLEbt
	 JUWVLdxRNdizrXvSfoPPwLyda0AF6y4PSLeDTqjvZc8JXgY/rltEcy+eSMlBq17/B/
	 N9+1/2kc/+hJKwbj8YGKTOkk3dX/cROD1AhlBe7zDAVCy33rbZqveuU+gGE3YBp/fh
	 zgt2FAm3qEUmJL8Wk3AoTl7QrE6I+Jb9RLbfFSF9FgDLX0CQm2DlXMnyRhhDlg9/eh
	 pNnpUgXqHIDwA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jun 2023 10:34:41 -0500
Message-Id: <CT88A3XMI9ZS.WUDTG1UJGQVC@Shawns-Mac-mini.lan>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: <tpearson@raptorengineering.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "George Dunlap" <george.dunlap@citrix.com>,
 "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>, "Shawn Anastasio"
 <shawnanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] xen: Add files needed for minimal Power build
From: "Shawn Anastasio" <shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
 <e2e1435f5d0fadaa00dfff6c04af29165439db5d.1686148363.git.shawn@anastas.io>
 <9676af82-7af2-24d4-838d-6f5a90c1d604@suse.com>
In-Reply-To: <9676af82-7af2-24d4-838d-6f5a90c1d604@suse.com>

On Fri Jun 9, 2023 at 4:15 AM CDT, Jan Beulich wrote:
> > --- /dev/null
> > +++ b/config/ppc64.mk
> > @@ -0,0 +1,5 @@
> > +CONFIG_PPC64 :=3D y
> > +CONFIG_PPC64_64 :=3D y
> > +CONFIG_PPC64_$(XEN_OS) :=3D y
>
> The first of the 64-s here are a little odd; looking at RISC-V's
> counterpart, wouldn't this want to be
>
> CONFIG_PPC :=3D y
> CONFIG_PPC_64 :=3D y
> CONFIG_PPC_$(XEN_OS) :=3D y>

Good point, this was definitely an oversight on my part. I'll clean this
up in v2.

> > --- /dev/null
> > +++ b/xen/arch/ppc/Kconfig
> > @@ -0,0 +1,42 @@
> > +config PPC
> > +	def_bool y
>
> Is this necessary? Iirc PPC is frequently used as a name for 32-bit PPC
> (but then also elsewhere as covering both 32- and 64-bit), so I'm not
> sure we want this without having a need for it.

This was mostly modeled after riscv/Kconfig. The idea was that this
option guards PPC support in general (both 32- and 64-bit) and the
subsequent option specifically opts in to 64-bit.

Given that this effort is only targeting 64-bit mode, though, the
argument could definitely be made that having the two options is
redundant, but I believe that is also the case for the risc-v port.

> > +config PPC64
> > +	def_bool y
> > +	select 64BIT
> > +
> > +config ARCH_DEFCONFIG
> > +	string
> > +	default "arch/ppc/configs/openpower_defconfig"
> > +
> > +menu "Architecture Features"
> > +
> > +source "arch/Kconfig"
> > +
> > +endmenu
> > +
> > +menu "ISA Selection"
> > +
> > +choice
> > +	prompt "Base ISA"
> > +	default POWER_ISA_2_07B if PPC64
> > +	help
> > +	  This selects the base ISA version that Xen will target.
> > +
> > +config POWER_ISA_2_07B
> > +	bool "POWER ISA 2.07B+"
> > +	help
> > +	  Target version 2.07B+ of the POWER ISA (POWER8+)
> > +
> > +config POWER_ISA_3_00
> > +	bool "POWER ISA 3.00+"
> > +	help
> > +	  Target version 3.00+ of the POWER ISA (POWER9+)
>
> What are the + in here meant to indicate? Since this is about a baseline
> ISA, I find such a use (presumably standing for "or newer") ambiguous.

Fair point. The + was intended as an "or newer" but I agree that it's
ambiguous (for instance, it might be interpreted as a part of the ISA's
name). I'll remove it in v2, along with a renaming of "POWER ISA" to
"Power ISA" which I originally overlooked.

> Jan

Thanks,
Shawn


