Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE63364593
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112933.215320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTM-00065z-Aj; Mon, 19 Apr 2021 14:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112933.215320; Mon, 19 Apr 2021 14:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTM-00065S-5r; Mon, 19 Apr 2021 14:01:56 +0000
Received: by outflank-mailman (input) for mailman id 112933;
 Mon, 19 Apr 2021 14:01:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYUTK-0005yZ-EA
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:01:54 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6bedd42-5dc3-48a5-932f-a3843df327d4;
 Mon, 19 Apr 2021 14:01:50 +0000 (UTC)
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
X-Inumbo-ID: f6bedd42-5dc3-48a5-932f-a3843df327d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618840910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=c90n3UWvZdBwaNrzfvCy7mTTendEDQlhzxhGFVDknR8=;
  b=MPL87x1DMhqWgltjz6XXLEN57+nhEy/dzRd8XG/s6Mlg6Wgu7oYd67Yr
   ca1fyD+hOCUj8U+vqwN/PSEudkbFhqEJP1WgVBz9h92H17wOb311axzgk
   HwUY8tLkPntmvyWgtX9/cfhC4X4gMrCZEGiueIVwELFq30JnPLsHS28zU
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iXgvNWFjzftq9wYGBW4oTykAuHznRLeVbKnWNBvkEotkRAa7LkhsKGKva+s+305aXAaJlabshm
 IU6D7u32Pb1HhvtT+UTsSrSAzHa16UmyUZJPPZ6EOMkH5+3NDLV+chuPzdfdkqfM+MRsW1/YZG
 yFcpbkZBFGHNMTZ6qWKBb8MXY9cYJZa3AaeAKTXaODDerlNxzTyZ+c1OlNBBirJTul8AD60g/a
 LKPt4G4z+3Cx034+kv1/cQdG+0JXkbt+pAB+j3ApuJfX8pqQtmxmf+Zy8HPPxXMLRi1q4qrngx
 TYQ=
X-SBRS: 5.1
X-MesageID: 41885044
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ye+oyarXkTvSLtWJtdAfZY8aV5qzeYIsi2QD101hICF9WObwra
 GTtd4c0gL5jytUZWE4lbm7SdG9aF7V6JId2/hzAZ6MRw/j0VHGEKhD6s/YzyTkC2nC8IdmpM
 NdWoxfLPG1MlRgl8b952CDYq8d6f2K6rqhi+ub71oFd3AJV4ha4w10ChmWHyRNLWEsb/dUKL
 Om6sVKvDamc3gMB/7LYUUtZOTfu8bN0KvvfB9uPW9A1CC1kTiq5LTmeiL54j4iVVp0r4sKwC
 zgmwz96r7LiYDf9iPh
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="41885044"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/7] xen/arm: Make make_cpus_node() compile at -Og
Date: Mon, 19 Apr 2021 15:01:26 +0100
Message-ID: <20210419140132.16909-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210419140132.16909-1-andrew.cooper3@citrix.com>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

When compiling at -Og:

  domain_build.c: In function 'make_cpus_node':
  domain_build.c:926:12: error: 'clock_valid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    926 |         if ( clock_valid )
        |            ^

The compiler hasn't spotted that clock_valid is always initialised after the
"if ( !compatible )" check.  Initialise clock_valid to false.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b1d7b9849f..b10f5c8f85 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -831,7 +831,7 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
     /* Placeholder for cpu@ + a 32-bit hexadecimal number + \0 */
     char buf[13];
     u32 clock_frequency;
-    bool clock_valid;
+    bool clock_valid = false;
     uint64_t mpidr_aff;
 
     dt_dprintk("Create cpus node\n");
-- 
2.11.0


