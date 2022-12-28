Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD26572F5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Dec 2022 06:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469454.728831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAP41-00050b-JA; Wed, 28 Dec 2022 05:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469454.728831; Wed, 28 Dec 2022 05:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAP41-0004yR-GO; Wed, 28 Dec 2022 05:33:17 +0000
Received: by outflank-mailman (input) for mailman id 469454;
 Wed, 28 Dec 2022 05:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Siob=42=opensource.wdc.com=prvs=354542e4c=alistair.francis@srs-se1.protection.inumbo.net>)
 id 1pAOsJ-000418-1x
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 05:21:11 +0000
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a6b9845-866f-11ed-8fd4-01056ac49cbb;
 Wed, 28 Dec 2022 06:21:02 +0100 (CET)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Dec 2022 13:20:59 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Dec 2022 20:39:05 -0800
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Dec 2022 21:21:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nhfxl2cm8z1RwtC
 for <xen-devel@lists.xenproject.org>; Tue, 27 Dec 2022 21:20:59 -0800 (PST)
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id MNGdOAOUF-w6 for <xen-devel@lists.xenproject.org>;
 Tue, 27 Dec 2022 21:20:58 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.13])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nhfxg69Wdz1RvLy;
 Tue, 27 Dec 2022 21:20:55 -0800 (PST)
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
X-Inumbo-ID: 6a6b9845-866f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1672204862; x=1703740862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=250uAQsDV16o/PqwGfmk5JGUTH9YnirGcQ3w6ZQnE8w=;
  b=cJAdCXiHzQtvwYMc5jkfbp7J7j+mJgZZePxHfgkr1r8Lzd23cKfYU4ZV
   0L1B5/6yJWJB4gz0LK0e9wbhQQNecFOOTouhyjm3+E6SEG1R0NdLW3XrY
   yejltxWnHoMn9FUaXXc/7oG7HqRROooHU+o6YFMfgXjopBjIaUxPxy8V3
   jmNUKvae/OVQ21zFT3kdDAvUC+5p4HrVvxCcKBvqgUj8dGgNo4Ah6C2H4
   HB6DBkgpL6TEGQrG4o5BTH7qbZbiETTChoi13/iCogRHUczqbamwTxOHR
   9YdY+FCmkKwuzVOmV9GmR40VKlsVa/XP0Z8tEorHq2tPkkPh4FIYYDouv
   w==;
X-IronPort-AV: E=Sophos;i="5.96,280,1665417600"; 
   d="scan'208";a="331619909"
IronPort-SDR: JzNqxlhlN6tR3WCOu6/EIJXGTSwIZBSSj9Na8fTilzNdl84PPhhR5MSRvXWVd+Ma+xM8/+0TZ3
 biHi6dkx1Re+5Z8rDqD4QPdy/+XAzxxVHpJHoIJQAGgNB0QyOXbI+CuWteYu3UoC6erdbsO3by
 LvaD+rGwpKQrV+Jxyo8IGz+7fE7Ff2VN9prdUWN/z/GRQI2gXgrB6xnoEAVmGlpFR0QIxdCtGi
 OJLqEE5ZXKTt80VwuQWxubmAc+VrzgTP5L+in24B8sg1+DaBQMpd8b7++e1XkIuH/Q7E9TXcN1
 mgs=
IronPort-SDR: 1JPXX0mbwmAVcAhhxc8/Sb5iyOZAvN/xD7STLfhKWpq8H1BNAmcRglGJSbI78YkbIyMB59WUa+
 jRrFlsaf2Mp5NyLQ+yDxK6jiewGRDtbAUewWBtghl1BkDC/nrXz26I+aLJpbiDcplMWO+bRdtu
 aLBn2kK8S6/hQ7E75NyLMk1rult1kbLSi5GIBRj4kjKKh7w4iA92pJkVNie/aXXtUX2JHsxyvG
 sFI6iVAoMOsKdPm9qTjEHLCPCwF11S9u1NS2BKMLJeFBlt5KKNHcJxl/SK5gY8+iY3xEV0gVXX
 d9Y=
WDCIronportException: Internal
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:mime-version
	:x-mailer:message-id:date:subject:to:from; s=dkim; t=1672204858;
	 x=1674796859; bh=250uAQsDV16o/PqwGfmk5JGUTH9YnirGcQ3w6ZQnE8w=; b=
	sSfPZZMOQ4ds6fZBjsvTM6PTirmil34mrffUhFCcMKAoJ9Jl5NIn8Tcm9uGY5/Vd
	Tk1lN839VSxoT+SMKqCQ1PfKU3BCvqcdxXn+dL1GlowUBoQn1kDjjJDI/LMkBONj
	JPVRNtCnRyU+JuqRrHBrNALlmE2rMJY3+aGA+SgXpyGF8Fguvhib90+MC5kqAE0I
	cLOuV7YmnG37p2/vfOavi4FsHSCq/OzfhrArPyf8vbCN4ojbBvjLN46uOybaXrS1
	Nd0wmSNCwn1o6BPokAYyLpuXMI6plGVNs9g4N/i7XEF/YGoa5k7geOYijpQrp8Ak
	jn6tGFMX2PKLO2jyWjiSNw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: xen-devel@lists.xenproject.org
Cc: bobbyeshleman@gmail.com,
	ayankuma@amd.com,
	Andrew.Cooper3@citrix.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] xen: define PADDR_BITS for riscv
Date: Wed, 28 Dec 2022 15:20:18 +1000
Message-Id: <20221228052018.730671-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Alistair Francis <alistair.francis@wdc.com>

Define PADDR_BITS and PAGE_SHIFT for the RISC-V 64-bit architecture.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 xen/arch/riscv/include/asm/page-bits.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/page-bits.h

diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/incl=
ude/asm/page-bits.h
new file mode 100644
index 0000000000..d7bd7be098
--- /dev/null
+++ b/xen/arch/riscv/include/asm/page-bits.h
@@ -0,0 +1,7 @@
+#ifndef __RISCV_PAGE_SHIFT_H__
+#define __RISCV_PAGE_SHIFT_H__
+
+#define PAGE_SHIFT              12 /* 4 KiB Pages */
+#define PADDR_BITS              56 /* 44-bit PPN */
+
+#endif /* __RISCV_PAGE_SHIFT_H__ */
--=20
2.38.1


