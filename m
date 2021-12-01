Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23209464C73
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:16:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235898.409178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNas-0007zs-On; Wed, 01 Dec 2021 11:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235898.409178; Wed, 01 Dec 2021 11:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNas-0007wr-Gk; Wed, 01 Dec 2021 11:16:10 +0000
Received: by outflank-mailman (input) for mailman id 235898;
 Wed, 01 Dec 2021 11:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNZg=QS=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1msNaq-0007wa-VF
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:16:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8705fe72-5296-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 12:05:02 +0100 (CET)
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
X-Inumbo-ID: 8705fe72-5296-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638357366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=akoFfWVQuW3/lSJUhlj/Ed+4xcJeZB9+aYB4pPZ2o+Y=;
  b=QfIcWjARg3DLQgUPIJohBG6ExzaOojb34ZtvVx0eb7JHMhBqpU+Q9c5D
   WKo5z+xF17Nd5dd6IieITxLKBkDYozFwWUHZXqsN3MeHeXj7rVcUkMZCl
   XOgPSfE0gNI9ZqtFNfHR8FBvXli0A4XV2lxmHP+6NShUTrsVrVeMUGGxj
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Dq7kZ3HOilYplWNWU9JCLrz09ayTts7AZ3slSf4g6TPvKcHthI81diwOhxP7H5Fc8dZmov23eL
 VGI1G/wpKYbknKNAHPFWVdPwVt+XWcP4kOfsA7J523Itjlfmxor7E0BV5NlmSgpxWturzsDhpq
 R/h8nOxfHqqBrwdnaoctAuyZ8lzU1K26XGbZFTDeNMHae0jZUHmh+XkSS2Dwjg+aZrwEQXT2/N
 fEK1waaT2ZzNbuICEq1YjYPRQyp342kzIPgcsUQ8tIIfQ4hwVTC+TbwtE2znTTzvXcyWeBlTwO
 VjLV66I/wRuErXH0kt1PwmNc
X-SBRS: 5.1
X-MesageID: 58996273
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zYksZagoeEGk96n1SqXJMWwxX161uxcKZh0ujC45NGQN5FlHY01je
 htvDWzTaPfYZWf8Kdt+YYnj8k0FusfdyNJqSlZvryg9Qi8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1spITraBc0A5fKp/0wDiZJCjtPEPdvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauON
 ptHM2U0BPjGS0RvAQ4vC6sCpbeLpmvZdzFBkXynjrVitgA/yyQuieOwYbI5YOeiSd1Om0eEp
 krP52njHgwBL9ub1CaE9XS3wOTImEvTVI0eGbKi/9Z2kVaTwSoVExRQWlylydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nO4nXWcLx
 kK0pdXWHBEyj6yMU0OwrJ7B+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hie22r0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJc3d/MBuaL9UdF1M2xpjGGaH6bKIN8N8nwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpONLrWptynfW8SImNuhXogjxmOcMZmOivpnwGWKJt9zq1zBhEfV8XZ
 /93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1ORDt8VqSPmOx5IOSIXc19z4/1w
 510YWcAoHKXuJENAVzihqlLZOy9UJBhg2g8OCBwb1+k12J6OdSk7bsFdotxdr4irbQxwflxR
 vgDWsOBHvUQFWiXp2VDNcHw/N54aRCmpQOSJC75MjIxSIFtGl7S8dj+cwqxqCRXVnirtdEzq
 qGL3x/ARcZRXBxrCcvbMar9z164sXUHtvh1Wk/EfotadEn2qdA4IC3tlP4nZcoLLEyblDed0
 g+XBzYepPXM/NBpoIWY2/jcot7wQeVkH0dcE23K1pqMNHHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGYgj5Cr5kJXXaj8BDurcUm+1csAqyH
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCInrqCaVUhyPgWXjH0PJbR4B4op3
 OM9tZNE8Ae4kBcrbo6Lgy08G75g9ZDcv3HLbq0nPbI=
IronPort-HdrOrdr: A9a23:SepVDquJFl1eOpuJbpUz9KE67skDdNV00zEX/kB9WHVpmszxra
 6TdZUgpGbJYVkqOE3I9ertBEDEewK4yXcX2/h2AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YGT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,278,1631592000"; 
   d="scan'208";a="58996273"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH 1/2] xsm: Switch xsm_ops to __alt_call_maybe_initdata
Date: Wed, 1 Dec 2021 11:15:54 +0000
Message-ID: <20211201111555.16408-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201111555.16408-1-andrew.cooper3@citrix.com>
References: <20211201111555.16408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This should have been done at the point xsm_ops became fully altcall'd.  This
puts the xsm_ops structure in .init on architectures where it is no longer
referenced at runtime.

Fixes: d868feb95a8a ("xen/xsm: Complete altcall conversion of xsm interface")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/xsm_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 21fffbcb41d3..14d98f1f725f 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -30,7 +30,7 @@
 
 #define XSM_FRAMEWORK_VERSION    "1.0.1"
 
-struct xsm_ops __read_mostly xsm_ops;
+struct xsm_ops __alt_call_maybe_initdata xsm_ops;
 
 enum xsm_ops_state {
     XSM_OPS_UNREGISTERED,
-- 
2.11.0


