Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A0B733168
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 14:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550158.859076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA8k5-00060U-DS; Fri, 16 Jun 2023 12:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550158.859076; Fri, 16 Jun 2023 12:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA8k5-0005y6-Ag; Fri, 16 Jun 2023 12:39:53 +0000
Received: by outflank-mailman (input) for mailman id 550158;
 Fri, 16 Jun 2023 12:39:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2CY=CE=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qA8k4-0005y0-DN
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 12:39:52 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e226be0e-0c42-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 14:39:50 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5GCdh8BP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 16 Jun 2023 14:39:43 +0200 (CEST)
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
X-Inumbo-ID: e226be0e-0c42-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1686919184; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Sau7TxcbMD2hYKuqP3OZCZG8xZBNQnYKkaOZ/2YLGMAGASd+SgzY+2j7WSNjx7vECw
    /5FntSOkpYKVdwp1HHktGpUvhXXgKTDTCK8SdQk9Oj07uskTqkPihElmCCyLJhp+/Um7
    0djy/yGPUeajjCpk/0Yt101FgLKqe904rFqCEO2SmZiVgU4C26A8mQaIpILkeUvRaizO
    D9odxB66ocoHlR1BAlSLBykoxIZZFWmOmWdmIKv8XSqjpMeTf7oMh6RauV4Kbj2vjwq5
    l+/pKS7U0AysDc8MbdKkLNtgsHJHC8NTiWbxPy/hiSOmvGWxUTwcPFocVoudt0objUjO
    e+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686919184;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wFK9LEIHC5Lyh2cqXtt1DBdqqnSo5xG2B7caRPIX1zY=;
    b=kXl49KidqUoGqMbMi4va2YF+5gFTw6ftzii6joI+ldhgyQ5JwSxoP08Bd7seJkHDMq
    VOKRTvsLQjuhZdGcnsJaaRJS8INNQbWbEG+87XkoLFPr9iFLRzoTf60rt5ceqWNjkpDh
    BBNpZZMJAiMlLxSOCxLtFykTPZczspNKBBIncDhNwYiP3hQgO1rWhkqBcxL1fC+gfBid
    1R26Nf5H9H7oIVs+vm9Z4VMHdhQNKxZwrf2YlvPK4BGgd7VnvfcqL2tXZM/Bar0L1C8a
    /S2jS2Rjd+qg/ZbXfMeukeyueG9/LGYvKrIhy21pDvIA8o3TJJYfFXBce30vLKAGiNbi
    U6Dg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686919184;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wFK9LEIHC5Lyh2cqXtt1DBdqqnSo5xG2B7caRPIX1zY=;
    b=bgQQEnmPFSjhaCwBkbQSS7EboqYNFxN+DCiNtBMOyz7RkfrGpWnKqViLSV2DLXY/vg
    5l0wpaManwyWWjQm5UFHknkHPd9jwMu+Og3+rDCkD8JP6rkF3T+etDfetZITCb1ozin/
    5I9BOmzwQDxLUKE0NKUQYof1dsCnRoV9C/7/yyvnPIYwb3PA+5HazG0TXB80vnHCR55q
    0L1MKSEffRrUWPWn0KWqbBJ+cWh9TR8r20BGZsGyBJ92QxeJU67W8hydA4waMaAFK1uC
    K1oTZjvsXdGr+g7qqLDhQPBD6P6vos/c5LJM3+ju3lBHGLaFSk78P2B0jAR+bh8RSp/c
    xppw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686919184;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=wFK9LEIHC5Lyh2cqXtt1DBdqqnSo5xG2B7caRPIX1zY=;
    b=nf7spAwa0pCDN2FYblMAQfpt1Afss16lqdYqBmBDKtEkXH0UDEDNAyMqv6A8Ok/wWb
    CYcUqCg8niNlmWj9s4AQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wrlX7F5stp0W7RR6sn4IXX0XAi33PEsP+tJs+yA=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v1] xen/trace: remove duplicate check for tb_init_done
Date: Fri, 16 Jun 2023 14:39:38 +0200
Message-Id: <20230616123938.12458-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The single caller of next_record already checked for
tb_init_done. The functions are called with t_lock
held. The call stack look like this:

__trace_var
  tb_init_done?
  insert_wrap_record
  insert_lost_records
    __insert_record
      next_record
        tb_init_done?

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 xen/common/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/trace.c b/xen/common/trace.c
index 582c58c884..8d56124ec9 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -514,7 +514,7 @@ static unsigned char *next_record(const struct t_buf *buf, uint32_t *next,
 
     barrier(); /* must read buf->prod and buf->cons only once */
     *next = x;
-    if ( !tb_init_done || bogus(x, cons) )
+    if ( bogus(x, cons) )
         return NULL;
 
     if ( x >= data_size )

