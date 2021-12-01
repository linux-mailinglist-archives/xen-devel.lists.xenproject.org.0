Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7532F464C74
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:16:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235900.409198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNav-00005s-89; Wed, 01 Dec 2021 11:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235900.409198; Wed, 01 Dec 2021 11:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNav-0008Tn-4a; Wed, 01 Dec 2021 11:16:13 +0000
Received: by outflank-mailman (input) for mailman id 235900;
 Wed, 01 Dec 2021 11:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNZg=QS=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1msNas-0007wa-O9
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:16:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f671dd-5296-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 12:05:04 +0100 (CET)
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
X-Inumbo-ID: 88f671dd-5296-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638357368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=YkekjYG04jbiZH/kfWiElK2zEy91zRt0qThwJ4BT3/4=;
  b=LDRcKFp6HTq9GDeKER75zQZm3REMZ7JiLRZD8mbmry763Iqx6vZyJuo8
   p7W1eHornc1cbUlr+8J/xCtQt27fSrOK8tFJ0Z7VVM27xLDWfcxPM99//
   UndGreTdpJob4CQt6TgvXxJxOrQuQLfTnvUp7CehS4RjGEdOnjxGYmrn3
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wI3yVvBLs5CHucLgP7kmdipbf3Bg7n908gjuMSJ3OitN9eVntiRfUan5P+wszZvYIQtiPOmVJB
 0lxl66dN3aVuWXOoLN17kBq2H81T0IshCRTw8M0BL6i4sqso+Mpr389AmA1dzpMxDquRSxLwaF
 /ZV23Ky34YAmunXGO2LWfnpJNCwBrbe+UMJWwzf0o4SEZHWYG+QLhTroxFU+hwWkN/nD5xvANS
 jcCEWTwB9HzUQIBYjPoq1aWtiA/WQwM1N9v2hwUrL1cUknRLHCb21679F8xJfOYVLOHh8c2iuH
 7tMLYdDPt/8ohOPBorVIAWVk
X-SBRS: 5.1
X-MesageID: 58996274
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uXljoK3JDKtuppUu3PbD5Qh2kn2cJEfYwER7XKvMYLTBsI5bpzAEn
 GEdCDuBPKnZNmWjLtx1bou+8UIAvceAy4RkTVA5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es5w7dh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhvsFpk
 /RdqKGKTzgwE/Dzif0HYjQCOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t1pEfQ6yBO
 6L1bxJvYBSeOCB2JmwGM6oRpb7xl1jGKRth/Qf9Sa0fvDGIkV0ZPKLWGNbNYdmLWcV9l16Vv
 H7b5H/+BgwGNduZ0nyO9XfEruPAkS70Qos6CKyz9vkshkaagGMUFnU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBZgecR9ld8reAYs6
 Uakwuz4HCZenee8HCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44Tvfr04Sd9SXYh
 mnT8XNg3+l7Ydsjjv3jpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDCvIji7rnXzURhpdnh+pnyvJ5p1xWG3DZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYiD6N/4oO9LsV5l3pUQFKTgDfquPBjapSsIsHDJrAQk0PRLAt4wTuBZEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrLZf1c9Rjh+U6S5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEeAQnVOH1ldp31WpNz8SAyMSA2ZA760Hk/e4e/qqwYcsJvL7Ug8eViy99yT
 uUEJJrcUqgeFGyf9mRPd4T5oaxjaA+v2VCEMR26bWVtZJVnXQHIpIPpJ1O96CkUAyOrnsIiu
 Ln8hBjDSJ8OSl06XsbbYf6i1X2run0ZlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSQ3PKKtYakFed6D3F2JWiD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXwwk4TnXGa1OnVuFpLnWchJQds6RMwvlSuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEDbRCDhRtUIKZxLI54k
 /wqv9Qb6lDnhxcnWjpcYvu4K4hYwqQ8bpga
IronPort-HdrOrdr: A9a23:NlpJ0agrL/klote791TZpKzQfnBQXtgji2hC6mlwRA09TySZ//
 rBoB17726MtN9/YhEdcLy7VJVoBEmskKKdgrNhW4tKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QFJSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,278,1631592000"; 
   d="scan'208";a="58996274"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH 2/2] xsm: Drop extern of non-existent variable
Date: Wed, 1 Dec 2021 11:15:55 +0000
Message-ID: <20211201111555.16408-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201111555.16408-1-andrew.cooper3@citrix.com>
References: <20211201111555.16408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

dummy_xsm_ops was dropped as part of organising XSM to be altcall compatible,
but the extern was accidentally left around.

A later change reintroduced dummy_ops which is logically the same thing, but
is private to xsm/dummy.c

Fixes: 164a0b9653f4 ("xsm: refactor xsm_ops handling")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/xsm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 5aa4dd588d17..3e2b7fe3dbb3 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -789,8 +789,6 @@ int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
 bool has_xsm_magic(paddr_t);
 #endif
 
-extern struct xsm_ops dummy_xsm_ops;
-
 void xsm_fixup_ops(struct xsm_ops *ops);
 
 #ifdef CONFIG_XSM_FLASK
-- 
2.11.0


