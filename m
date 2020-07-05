Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890C9214EC2
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 20:59:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js9rF-0006iL-5a; Sun, 05 Jul 2020 18:59:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgbI=AQ=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1js9rD-0006iE-Tg
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 18:59:19 +0000
X-Inumbo-ID: a119caba-bef1-11ea-8496-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a119caba-bef1-11ea-8496-bc764e2007e4;
 Sun, 05 Jul 2020 18:59:19 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6DF33A1BA5;
 Sun,  5 Jul 2020 20:59:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6B88AA1B9C;
 Sun,  5 Jul 2020 20:59:17 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AkBzsEYyKSVV; Sun,  5 Jul 2020 20:59:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0F325A1BA5;
 Sun,  5 Jul 2020 20:59:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LlagYyDGD44d; Sun,  5 Jul 2020 20:59:16 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E4D04A1B9C;
 Sun,  5 Jul 2020 20:59:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D824C22C09;
 Sun,  5 Jul 2020 20:58:46 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GxDN8sUCE3ir; Sun,  5 Jul 2020 20:58:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7777622C0D;
 Sun,  5 Jul 2020 20:58:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id eRShEoNG52Mn; Sun,  5 Jul 2020 20:58:41 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 59DA122C09;
 Sun,  5 Jul 2020 20:58:41 +0200 (CEST)
Date: Sun, 5 Jul 2020 20:58:41 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <983829150.19744505.1593975521301.JavaMail.zimbra@cert.pl>
In-Reply-To: <e0ac5422825ce307470256aab1652336d5179a9a.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <e0ac5422825ce307470256aab1652336d5179a9a.1593974333.git.michal.leszczynski@cert.pl>
Subject: Re: [PATCH v5 11/11] tools/proctrace: add proctrace tool
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: tools/proctrace: add proctrace tool
Thread-Index: XPBWFQz1Fq+Dhs3nny1nHRh5+zAzMw==
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
Cc: luwei kang <luwei.kang@intel.com>, tamas lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 5 lip 2020 o 20:55, Micha=C5=82 Leszczy=C5=84ski michal.leszczynski@c=
ert.pl napisa=C5=82(a):

> From: Michal Leszczynski <michal.leszczynski@cert.pl>
>=20
> Add an demonstration tool that uses xc_vmtrace_* calls in order
> to manage external IPT monitoring for DomU.
>=20
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
> tools/proctrace/Makefile    |  48 +++++++++++
> tools/proctrace/proctrace.c | 163 ++++++++++++++++++++++++++++++++++++
> 2 files changed, 211 insertions(+)
> create mode 100644 tools/proctrace/Makefile
> create mode 100644 tools/proctrace/proctrace.c


> diff --git a/tools/proctrace/proctrace.c b/tools/proctrace/proctrace.c
> new file mode 100644
> index 0000000000..22bf91db8d
> --- /dev/null
> +++ b/tools/proctrace/proctrace.c


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


I would like to discuss here, how we should retrieve the trace buffer size
in runtime? Should there be a hypercall for it, or some extension to
acquire_resource logic?

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

