Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DDD32688B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 21:36:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90584.171520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFjqq-0001sk-6y; Fri, 26 Feb 2021 20:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90584.171520; Fri, 26 Feb 2021 20:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFjqq-0001sK-1w; Fri, 26 Feb 2021 20:36:40 +0000
Received: by outflank-mailman (input) for mailman id 90584;
 Fri, 26 Feb 2021 20:36:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECYH=H4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFjqo-0001sF-VS
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 20:36:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88c54186-65c5-416e-aa66-741a7ac32f38;
 Fri, 26 Feb 2021 20:36:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 493F764EFA;
 Fri, 26 Feb 2021 20:36:37 +0000 (UTC)
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
X-Inumbo-ID: 88c54186-65c5-416e-aa66-741a7ac32f38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614371797;
	bh=xex4eDlzhtDi9TdoA4FM7ulEpD14jeshElkv2Pk1l2s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WZDPD92+OkR74Vps1x0tcncaH/iCPEP1dndYdjidiWKqhwIYQ1LXxxoyF5+oLPjze
	 0APeb+4zziUKGguy1sVwaet2lyIcub+qbTUn3ndWY+tTyKoq0MwunjahAOT3KNmEzI
	 rxdiiL1dr4l47asMbukmJT2caj008cpBYrXqlZWS/WtVTFbWJ9EAIfhks21WOB5Ove
	 hgYZDB2GIaqM4LqRMclhw8p2eXvuIzTqCKRHvTxdt41jdM1gMfQOXGAT66xwp/zyJy
	 +2Khb0pKsuwyYBt9htmwK/zfdVZsVS9K8gzcqRW0RsuV1qEGnLIfgtzMzfuJ02KvSJ
	 IshRo2P+9lRBg==
Date: Fri, 26 Feb 2021 12:36:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15 2/3] firmware: provide a stand alone set of
 headers
In-Reply-To: <20210226085908.21254-3-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.21.2102261233160.3234@sstabellini-ThinkPad-T480s>
References: <20210226085908.21254-1-roger.pau@citrix.com> <20210226085908.21254-3-roger.pau@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1154894328-1614371797=:3234"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1154894328-1614371797=:3234
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 26 Feb 2021, Roger Pau Monne wrote:
> The current build of the firmware relies on having 32bit compatible
> headers installed in order to build some of the 32bit firmware, but
> that usually requires multilib support and installing a i386 libc when
> building from an amd64 environment which is cumbersome just to get
> some headers.
> 
> Usually this could be solved by using the -ffreestanding compiler
> option which drops the usage of the system headers in favor of a
> private set of freestanding headers provided by the compiler itself
> that are not tied to libc. However such option is broken at least
> in the gcc compiler provided in Alpine Linux, as the system include
> path (ie: /usr/include) takes precedence over the gcc private include
> path:
> 
> #include <...> search starts here:
>  /usr/include
>  /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
> 
> Since -ffreestanding is currently broken on at least that distro, and
> for resilience against future compilers also having the option broken
> provide a set of stand alone 32bit headers required for the firmware
> build.
> 
> This allows to drop the build time dependency on having a i386
> compatible set of libc headers on amd64.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> There's the argument of fixing gcc in Alpine and instead just use
> -ffreestanding. I think that's more fragile than providing our own set
> of stand alone headers for the firmware bits. Having the include paths
> wrongly sorted can easily make the system headers being picked up
> instead of the gcc ones, and then building can randomly fail because
> the system headers could be amd64 only (like the musl ones).
> 
> I've also seen clang-9 on Debian with the following include paths:
> 
> #include "..." search starts here:
> #include <...> search starts here:
>  /usr/local/include
>  /usr/lib/llvm-9/lib/clang/9.0.1/include
>  /usr/include/x86_64-linux-gnu
>  /usr/include
> 
> Which also seems slightly dangerous as local comes before the compiler
> private path.
> 
> IMO using our own set of stand alone headers is more resilient.
> 
> Regarding the release risks, the main one would be breaking the build
> (as it's currently broken on Alpine). I think there's a very low risk
> of this change successfully producing a binary image that's broken,
> and hence with enough build testing it should be safe to merge.

This patch is a lot nicer and smaller than I thought it would be. It
looks like the best approach.

In terms of testing, gitlab-ci has a pretty wide build test coverage, so
if we can pass those (and you have already provided a link with all
tests green in patch #0) then I am in favor of getting this in for 4.15.


> ---
>  README                                        |  3 --
>  tools/firmware/Rules.mk                       | 11 ++++++
>  tools/firmware/include/stdarg.h               | 10 +++++
>  tools/firmware/include/stdbool.h              |  9 +++++
>  tools/firmware/include/stddef.h               | 10 +++++
>  tools/firmware/include/stdint.h               | 39 +++++++++++++++++++
>  tools/firmware/rombios/32bit/rombios_compat.h |  4 +-
>  7 files changed, 80 insertions(+), 6 deletions(-)
>  create mode 100644 tools/firmware/include/stdarg.h
>  create mode 100644 tools/firmware/include/stdbool.h
>  create mode 100644 tools/firmware/include/stddef.h
>  create mode 100644 tools/firmware/include/stdint.h
> 
> diff --git a/README b/README
> index 33cdf6b826..5167bb1708 100644
> --- a/README
> +++ b/README
> @@ -62,9 +62,6 @@ provided by your OS distributor:
>      * GNU bison and GNU flex
>      * GNU gettext
>      * ACPI ASL compiler (iasl)
> -    * Libc multiarch package (e.g. libc6-dev-i386 / glibc-devel.i686).
> -      Required when building on a 64-bit platform to build
> -      32-bit components which are enabled on a default build.
>  
>  In addition to the above there are a number of optional build
>  prerequisites. Omitting these will cause the related features to be
> diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
> index 26bbddccd4..5d09ab06df 100644
> --- a/tools/firmware/Rules.mk
> +++ b/tools/firmware/Rules.mk
> @@ -17,3 +17,14 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
>  # Extra CFLAGS suitable for an embedded type of environment.
>  CFLAGS += -fno-builtin -msoft-float
> +
> +# Use our own set of library headers to build firmware.
> +#
> +# Ideally we would instead use -ffreestanding, but that relies on the compiler
> +# having the right order for include paths (ie: compiler private headers before
> +# system ones). This is not the case in Alpine at least which searches system
> +# headers before compiler ones, and has been reported upstream:
> +# https://gitlab.alpinelinux.org/alpine/aports/-/issues/12477
> +# In the meantime (and for resilience against broken compilers) use our own set
> +# of headers that provide what's needed for the firmware build.
> +CFLAGS += -nostdinc -I$(XEN_ROOT)/tools/firmware/include
> diff --git a/tools/firmware/include/stdarg.h b/tools/firmware/include/stdarg.h
> new file mode 100644
> index 0000000000..c5e3761cd2
> --- /dev/null
> +++ b/tools/firmware/include/stdarg.h
> @@ -0,0 +1,10 @@
> +#ifndef _STDARG_H_
> +#define _STDARG_H_
> +
> +typedef __builtin_va_list va_list;
> +#define va_copy(dest, src) __builtin_va_copy(dest, src)
> +#define va_start(ap, last) __builtin_va_start(ap, last)
> +#define va_end(ap) __builtin_va_end(ap)
> +#define va_arg __builtin_va_arg
> +
> +#endif
> diff --git a/tools/firmware/include/stdbool.h b/tools/firmware/include/stdbool.h
> new file mode 100644
> index 0000000000..0cf76b106c
> --- /dev/null
> +++ b/tools/firmware/include/stdbool.h
> @@ -0,0 +1,9 @@
> +#ifndef _STDBOOL_H_
> +#define _STDBOOL_H_
> +
> +#define bool _Bool
> +#define true 1
> +#define false 0
> +#define __bool_true_false_are_defined 1
> +
> +#endif
> diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/stddef.h
> new file mode 100644
> index 0000000000..c7f974608a
> --- /dev/null
> +++ b/tools/firmware/include/stddef.h
> @@ -0,0 +1,10 @@
> +#ifndef _STDDEF_H_
> +#define _STDDEF_H_
> +
> +typedef __SIZE_TYPE__ size_t;
> +
> +#define NULL ((void*)0)
> +
> +#define offsetof(t, m) __builtin_offsetof(t, m)
> +
> +#endif
> diff --git a/tools/firmware/include/stdint.h b/tools/firmware/include/stdint.h
> new file mode 100644
> index 0000000000..7514096846
> --- /dev/null
> +++ b/tools/firmware/include/stdint.h
> @@ -0,0 +1,39 @@
> +#ifndef _STDINT_H_
> +#define _STDINT_H_
> +
> +#ifdef __LP64__
> +#error "32bit only header"
> +#endif
> +
> +typedef unsigned char uint8_t;
> +typedef signed char int8_t;
> +
> +typedef unsigned short uint16_t;
> +typedef signed short int16_t;
> +
> +typedef unsigned int uint32_t;
> +typedef signed int int32_t;
> +
> +typedef unsigned long long uint64_t;
> +typedef signed long long int64_t;
> +
> +#define INT8_MIN        (-0x7f-1)
> +#define INT16_MIN       (-0x7fff-1)
> +#define INT32_MIN       (-0x7fffffff-1)
> +#define INT64_MIN       (-0x7fffffffffffffffll-1)
> +
> +#define INT8_MAX        0x7f
> +#define INT16_MAX       0x7fff
> +#define INT32_MAX       0x7fffffff
> +#define INT64_MAX       0x7fffffffffffffffll
> +
> +#define UINT8_MAX       0xff
> +#define UINT16_MAX      0xffff
> +#define UINT32_MAX      0xffffffffu
> +#define UINT64_MAX      0xffffffffffffffffull
> +
> +typedef uint32_t uintptr_t;
> +
> +#define UINTPTR_MAX     UINT32_MAX
> +
> +#endif
> diff --git a/tools/firmware/rombios/32bit/rombios_compat.h b/tools/firmware/rombios/32bit/rombios_compat.h
> index 3fe7d67721..8ba4c17ffd 100644
> --- a/tools/firmware/rombios/32bit/rombios_compat.h
> +++ b/tools/firmware/rombios/32bit/rombios_compat.h
> @@ -8,9 +8,7 @@
>  
>  #define ADDR_FROM_SEG_OFF(seg, off)  (void *)((((uint32_t)(seg)) << 4) + (off))
>  
> -typedef unsigned char uint8_t;
> -typedef unsigned short int uint16_t;
> -typedef unsigned int uint32_t;
> +#include <stdint.h>
>  
>  typedef uint8_t  Bit8u;
>  typedef uint16_t Bit16u;
> -- 
> 2.30.1
> 
--8323329-1154894328-1614371797=:3234--

