Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D79221EBE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 10:43:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvzTR-0005dM-09; Thu, 16 Jul 2020 08:42:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvzTP-0005dH-6L
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 08:42:35 +0000
X-Inumbo-ID: 4ab1f5f6-c740-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ab1f5f6-c740-11ea-bca7-bc764e2007e4;
 Thu, 16 Jul 2020 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594888955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ThoXaI+9EcbSt53nPcI0hOiCh0/m8Q04GcOj/lwd8k0=;
 b=fAo/o0blSCJLuTOTaVivGEApzfNiEkbcySPg1mK6O3sj03KhpFENsFN4
 MFoasCoGKBOSB7Wq0b/uJQVKeQ+Y+1RWkV4Mkx82v6jN29m/X6cDjGEZg
 qcEgbgUELodop6WCIbdzC8F4FkdI/rZUIs0zUappBV8LXsoD1SCjZ4HEc 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: A5OWCGzZxaEmS5z09n2G2HEoN4Hbb/2KaukvTCnPUiCU8fyaBtM1MinYpyXsQj5cw3VBIMlLYZ
 f4pMeVTc9+SYFflnQnjgyu6h4Kx0gQcbuWCek/Qr36LsFOMkU2fOMlM8ITPnE4bo3wfnhzfa56
 Uv/AlDEHy4o50aC2JmzQmgr4cexHH/s2dvYGUCwbtDoLeWatDguYDWVjeJjGj9wfYY4smxo6uh
 0ZlGNdeenz7sX09AHpKdwnWW+j1LmYTdk1zDIKUX34iK+ix8Mvhvd9RYC9Vr0+TWHEu8rwA8Dg
 Xvs=
X-SBRS: 2.7
X-MesageID: 22504981
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,358,1589256000"; d="scan'208";a="22504981"
Date: Thu, 16 Jul 2020 10:42:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 11/11] tools/proctrace: add proctrace tool
Message-ID: <20200716084209.GJ7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <8bc5959478d6ba1c1873615b53628094da578688.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bc5959478d6ba1c1873615b53628094da578688.1594150543.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: xen-devel@lists.xenproject.org, tamas.lengyel@intel.com,
 luwei.kang@intel.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 07, 2020 at 09:39:50PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Add an demonstration tool that uses xc_vmtrace_* calls in order
      ^ a
> to manage external IPT monitoring for DomU.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  tools/proctrace/Makefile    |  45 +++++++++
>  tools/proctrace/proctrace.c | 179 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 224 insertions(+)
>  create mode 100644 tools/proctrace/Makefile
>  create mode 100644 tools/proctrace/proctrace.c
> 
> diff --git a/tools/proctrace/Makefile b/tools/proctrace/Makefile
> new file mode 100644
> index 0000000000..9c135229b9
> --- /dev/null
> +++ b/tools/proctrace/Makefile
> @@ -0,0 +1,45 @@
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
> +	$(RM) -f proctrace $(DEPS_RM)
> +
> +.PHONY: distclean
> +distclean: clean
> +
> +-include $(DEPS_INCLUDE)
> diff --git a/tools/proctrace/proctrace.c b/tools/proctrace/proctrace.c
> new file mode 100644
> index 0000000000..3c1ccccee8
> --- /dev/null
> +++ b/tools/proctrace/proctrace.c
> @@ -0,0 +1,179 @@
> +/******************************************************************************
> + * tools/proctrace.c
> + *
> + * Demonstrative tool for collecting Intel Processor Trace data from Xen.
> + *  Could be used to externally monitor a given vCPU in given DomU.
> + *
> + * Copyright (C) 2020 by CERT Polska - NASK PIB
> + *
> + * Authors: Michał Leszczyński, michal.leszczynski@cert.pl
> + * Date:    June, 2020
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; under version 2 of the License.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <sys/mman.h>
> +#include <signal.h>
> +#include <errno.h>
> +
> +#include <xenctrl.h>
> +#include <xen/xen.h>
> +#include <xenforeignmemory.h>
> +
> +volatile int interrupted = 0;
> +volatile int domain_down = 0;

No need for the initialization, globals are already initialized to 0.

> +void term_handler(int signum) {
> +    interrupted = 1;
> +}
> +
> +int main(int argc, char* argv[]) {
> +    xc_interface *xc;
> +    uint32_t domid;
> +    uint32_t vcpu_id;
> +    uint64_t size;
> +
> +    int rc = -1;
> +    uint8_t *buf = NULL;
> +    uint64_t last_offset = 0;
> +
> +    xenforeignmemory_handle *fmem;
> +    xenforeignmemory_resource_handle *fres;
> +
> +    if (signal(SIGINT, term_handler) == SIG_ERR)
> +    {
> +        fprintf(stderr, "Failed to register signal handler\n");
> +        return 1;
> +    }
> +
> +    if (argc != 3) {
> +        fprintf(stderr, "Usage: %s <domid> <vcpu_id>\n", argv[0]);
> +        fprintf(stderr, "It's recommended to redirect this"
> +                        "program's output to file\n");
> +        fprintf(stderr, "or to pipe it's output to xxd or other program.\n");
> +        return 1;
> +    }
> +
> +    domid = atoi(argv[1]);
> +    vcpu_id = atoi(argv[2]);
> +
> +    xc = xc_interface_open(0, 0, 0);
> +
> +    fmem = xenforeignmemory_open(0, 0);

I think you also need to test that fmem is set? (like you do for xc).

> +
> +    if (!xc) {
> +        fprintf(stderr, "Failed to open xc interface\n");
> +        return 1;
> +    }
> +
> +    rc = xc_vmtrace_pt_enable(xc, domid, vcpu_id);
> +
> +    if (rc) {
> +        fprintf(stderr, "Failed to call xc_vmtrace_pt_enable\n");
> +        return 1;
> +    }
> +    
> +    rc = xc_vmtrace_pt_get_offset(xc, domid, vcpu_id, NULL, &size);
> +
> +    if (rc) {
> +        fprintf(stderr, "Failed to get trace buffer size\n");
> +        return 1;
> +    }
> +
> +    fres = xenforeignmemory_map_resource(
> +        fmem, domid, XENMEM_resource_vmtrace_buf,
> +        /* vcpu: */ vcpu_id,
> +        /* frame: */ 0,
> +        /* num_frames: */ size >> XC_PAGE_SHIFT,
> +        (void **)&buf,
> +        PROT_READ, 0);
> +
> +    if (!buf) {
> +        fprintf(stderr, "Failed to map trace buffer\n");
> +        return 1;
> +    }
> +
> +    while (!interrupted) {
> +        uint64_t offset;
> +        rc = xc_vmtrace_pt_get_offset(xc, domid, vcpu_id, &offset, NULL);
> +
> +        if (rc == ENODATA) {
> +            interrupted = 1;
> +            domain_down = 1;
> +	} else if (rc) {

Hard tab.

> +            fprintf(stderr, "Failed to call xc_vmtrace_pt_get_offset\n");

Should you try to disable vmtrace here before exiting?

> +            return 1;
> +        }
> +
> +        if (offset > last_offset)
> +        {
> +            fwrite(buf + last_offset, offset - last_offset, 1, stdout);
> +        }
> +        else if (offset < last_offset)
> +        {
> +            // buffer wrapped

I know this is a test utility, but I would prefer if you could use the
C comment style /* */.

> +            fwrite(buf + last_offset, size - last_offset, 1, stdout);
> +            fwrite(buf, offset, 1, stdout);
> +        }
> +
> +        last_offset = offset;
> +        usleep(1000 * 100);
> +    }
> +
> +    rc = xenforeignmemory_unmap_resource(fmem, fres);
> +
> +    if (rc) {
> +        fprintf(stderr, "Failed to unmap resource\n");
> +        return 1;
> +    }
> +
> +    rc = xenforeignmemory_close(fmem);
> +
> +    if (rc) {
> +        fprintf(stderr, "Failed to close fmem\n");
> +        return 1;
> +    }
> +
> +    /*
> +     * Don't try to disable PT if the domain is already dying.
> +     */
> +    if (!domain_down) {
> +        rc = xc_vmtrace_pt_disable(xc, domid, vcpu_id);

I'm not sure you can assume a domain is dying just because
xc_vmtrace_pt_get_offset has returned ENODATA. Is there any harm in
unconditionally attempting to disable vmtrace?

Thanks.

