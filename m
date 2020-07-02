Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF44212772
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 17:12:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr0sD-0005iG-W4; Thu, 02 Jul 2020 15:11:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMTP=AN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jr0sD-0005iB-3E
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 15:11:37 +0000
X-Inumbo-ID: 516c7f58-bc76-11ea-8849-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 516c7f58-bc76-11ea-8849-12813bfff9fa;
 Thu, 02 Jul 2020 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593702696;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7w8TacDIa9VCOgiQeVRNIRtXyJ8Dk4dulQpwXemfS/I=;
 b=VdT/zBQV+S10yhbKtkUN9+PCbhtUpTBxlbZx0jM4Bxj4WE1qIJ1i2JpU
 yJLuQ2DCvJtYCa8epMlJHdEfRvTwwHM+6WiTkGteMmhxvRXyWAr10wRVT
 a64HCEK0vGfmMfcqRpCwakUrhXSphYoIKlVpOIZIRoGsG5YHDTJyhlWXL 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OQ4WFe5y4gRPrBJDc9VjOm/uCTcaLTjlnNRlwnFWvGLxf/y8oQ93PveJrnxOy3FfzyuFX4n4OS
 9FzT3AKHHVZIzSbUauAUD7euu9IJzrV8gFRHq8kCO1Sulj9NREIfknFBahN29I5DGQ/b1ub+t9
 bvSFYpvqd+gRHKoEx6GKWbP/PaTQcM4bgy6/169zOKj92wYbxO6ZuVtX1HiNNYcGQh3AlyukB+
 XIHK6TuzsGB2YlIQqGsTsv6R6rNEPPVUfv5t/ZqS15bvVHwzfqByPmz08ZY0yiwjBxLssKd0jR
 JxE=
X-SBRS: 2.7
X-MesageID: 21503911
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,304,1589256000"; d="scan'208";a="21503911"
Subject: Re: [PATCH v4 10/10] tools/proctrace: add proctrace tool
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 <xen-devel@lists.xenproject.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <0ab003238e4e666d3847024b8917dbc11c40fecb.1593519420.git.michal.leszczynski@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <241285fc-f8be-575f-8b2a-f5aa44b77d47@citrix.com>
Date: Thu, 2 Jul 2020 16:10:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0ab003238e4e666d3847024b8917dbc11c40fecb.1593519420.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: luwei.kang@intel.com, tamas.lengyel@intel.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/06/2020 13:33, Michał Leszczyński wrote:
> diff --git a/tools/proctrace/COPYING b/tools/proctrace/COPYING
> new file mode 100644
> index 0000000000..c0a841112c
> --- /dev/null
> +++ b/tools/proctrace/COPYING

The top-level COPYING file is GPL2.  There shouldn't be any need to
include a second copy here.

> diff --git a/tools/proctrace/Makefile b/tools/proctrace/Makefile
> new file mode 100644
> index 0000000000..2983c477fe
> --- /dev/null
> +++ b/tools/proctrace/Makefile
> @@ -0,0 +1,48 @@
> +# Copyright (C) CERT Polska - NASK PIB
> +# Author: Michał Leszczyński <michal.leszczynski@cert.pl>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; under version 2 of the License.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +
> +XEN_ROOT=$(CURDIR)/../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +CFLAGS  += -Werror
> +CFLAGS  += $(CFLAGS_libxenevtchn)
> +CFLAGS  += $(CFLAGS_libxenctrl)
> +LDLIBS  += $(LDLIBS_libxenctrl)
> +LDLIBS  += $(LDLIBS_libxenevtchn)
> +LDLIBS  += $(LDLIBS_libxenforeignmemory)
> +
> +.PHONY: all
> +all: build
> +
> +.PHONY: build
> +build: proctrace
> +
> +.PHONY: install
> +install: build
> +	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
> +	$(INSTALL_PROG) proctrace $(DESTDIR)$(sbindir)/proctrace
> +
> +.PHONY: uninstall
> +uninstall:
> +	rm -f $(DESTDIR)$(sbindir)/proctrace
> +
> +.PHONY: clean
> +clean:
> +	$(RM) -f $(DEPS_RM)

You need to remove proctrace as well, for `make clean` to have the
intended semantics.

> +
> +.PHONY: distclean
> +distclean: clean
> +
> +iptlive: iptlive.o Makefile
> +	$(CC) $(LDFLAGS) $< -o $@ $(LDLIBS) $(APPEND_LDFLAGS)

This rule looks to be totally unused?

> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <sys/mman.h>
> +#include <signal.h>
> +
> +#include <xenctrl.h>
> +#include <xen/xen.h>
> +#include <xenforeignmemory.h>
> +
> +#define BUF_SIZE (16384 * XC_PAGE_SIZE)

This hardcodes the size of the buffer which is configurable per VM. 
Mapping the buffer fails when it is smaller than this.

It appears there is still outstanding bug from the acquire_resource work
which never got fixed.  The guest_handle_is_null(xmar.frame_list) path
in Xen is supposed to report the size of the resource, not the size of
Xen's local buffer, so userspace can ask "how large is this resource".

I'll try and find some time to fix this and arrange for backports, but
the current behaviour is nonsense, and problematic for new users.

~Andrew

