Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ylejKPqXQmpR+QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 18:06:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B746DD1CF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 18:06:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=elt5y22B;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1347756.1605591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weEUi-0003xh-E9; Mon, 29 Jun 2026 16:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347756.1605591; Mon, 29 Jun 2026 16:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weEUi-0003vL-BA; Mon, 29 Jun 2026 16:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1347756;
 Mon, 29 Jun 2026 16:05:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alhouseenyousef@gmail.com>) id 1weEUg-0003uA-Rg
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:05:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weEUe-005OL7-GF
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:05:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a4297d0-2eae-0a2a0a5409dd-0a2a4506a422-48
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 18:05:56 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a4297e4-08de-0a2a45060019-d155802ab51d-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 18:05:56 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so29385775e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:05:56 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-472bca3caccsm16289696f8f.33.2026.06.29.09.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 09:05:55 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782749156; x=1783353956; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urju7AHNAPTsZhmiiZ2fXVN5kyTyXWHOnIy66aKFET0=;
        b=elt5y22BvDyKDxbeFu+aiELEAnRPTQkBdZrfFuIdpG2doJMqryhEiZDNRAXr5klsY5
         CGUXeTV2Z6U41OerIGMbLY/PXhsO83HoJ4Ch87dSK7mB5mpnMO6IEbkm59Eixpme+iQr
         r7Tb64jgs6geiLG16CEb/DUkBS5MUV4N6TbYDTAAWnZqW0Wam3OHSk8gSXdfOTfoCx0V
         BpHYtX6mWkHZz1BnIcJKFtqEd/RsnlyIGwLASEhuYnQbhYFfna18yK1hpqWEXNZijBVX
         47ByWDbezO6ZnC23rWl3SUWtncEG6QZ2eRpzNx0xUbFEcnsUO3wW1ciGCs1gJNQtyrbQ
         LRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749156; x=1783353956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urju7AHNAPTsZhmiiZ2fXVN5kyTyXWHOnIy66aKFET0=;
        b=FdoFOSs48EMVVmY7UBjwBluCoTAomGAqjeijTyQlCubtD/tGtFyoZvnqPXdog8Pv34
         cts73v2fW0En80TON6mh3StImOQXPBwQBsY04XCT7+dOa+g1gudJWi5n21vifoFBJLFr
         9TTyqRBywEsDxlHW1pCOSxE1RrN7qGN5s9RXDUeKv/PTLOdiDISDyYEaAWN6X39M1mVZ
         vZEfLWtJP1Gus5Obqb9oln00LxnsxDCeda/84hs5aiLpnB403a8xAeYgvN20azqLb2UY
         4XQX0B5VJmfk20ZRMOSPxwBGL7RZmdzRmvrjvCmpsW6vXQV1bdqaPiuOb85EMz3RFY0h
         dDFw==
X-Forwarded-Encrypted: i=1; AFNElJ+qNpaBB0BeS+jTQatxRSarXbRLVsdkQOtact/rPXhu+7mSo5lHEDJBLQbfR1Zi/sM0ryBEuc3Chvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrIh00QdPYEgP27kUuivAJVTCwJFxcy6J6qe73/lKsOM9IdW7f
	U5h9V3RHbg7v66llOqh5wYj1BjOKWwCIySQzImT0G5RS/JADd8BuRwZM
X-Gm-Gg: AfdE7clpNaunmvLwB2lfU8TLxJfXAwffQrqD+FsC2Pirr6tdgg7InZatTxkktD8yDKi
	hBRpwuwmM8vK4veaDpAy0MVA2VwpuhRSM6YL8JGKuE/U4sd9yVOchBifWDNzOsZGlDaLyr8CcHv
	l/F+SC42q1kFYJ9RI2EprfrfUuoLYon1eLnJwbQs+9B70oD4zB+nyf/n0yL6PPj7t87+O6WAejE
	8P7eRgEdQYMN4Y20fbj5ZzzVcrUKbp1/z1nUMpQI6W0Z7ZeQkP1XAQSEN1z1eI7V8ElCfDw9+C/
	HW9hHYrtyT3cFgdz48ajj5V8EB4ctXOu0DJhVJ2IeAFExlGTm/RSg6rwHTcrO3mAu8HCTX6vntg
	fpyoIyK3oq8MKa/btw4LCn2OQcIFiFNNbgNlTGt7knseOWnGOGGBA+6XQoDX+KemXx2RAwKh1eM
	9vR5CWQZNYbohgFHwMJ5FfK9LdRA==
X-Received: by 2002:a05:600c:8b4b:b0:493:b55f:bca2 with SMTP id 5b1f17b1804b1-493b82c3225mr4557905e9.34.1782749155666;
        Mon, 29 Jun 2026 09:05:55 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] xen/front-pgdir-shbuf: free grant reference head on errors
Date: Mon, 29 Jun 2026 18:05:17 +0200
Message-ID: <20260629160517.29340-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782749156-43F2C68D-C2A51C70/0/0
X-purgate-type: clean
X-purgate-size: 1650
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,epam.com,lists.xenproject.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45B746DD1CF

grant_references() allocates a private grant-reference head before
claiming references for the page directory and, for guest-owned buffers,
the data pages. The success path frees the remaining head, but claim
failures and grant_refs_for_buffer() errors return immediately.

Unwind through a common exit path so the private grant-reference head is
released even when granting fails part-way through setup. The caller
still tears down any references already stored in buf->grefs.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/xen/xen-front-pgdir-shbuf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/xen-front-pgdir-shbuf.c b/drivers/xen/xen-front-pgdir-shbuf.c
index 9c7d8af6e6a1..428187edf85d 100644
--- a/drivers/xen/xen-front-pgdir-shbuf.c
+++ b/drivers/xen/xen-front-pgdir-shbuf.c
@@ -445,8 +445,10 @@ static int grant_references(struct xen_front_pgdir_shbuf *buf)
 		unsigned long frame;
 
 		cur_ref = gnttab_claim_grant_reference(&priv_gref_head);
-		if (cur_ref < 0)
-			return cur_ref;
+		if (cur_ref < 0) {
+			ret = cur_ref;
+			goto out_free_refs;
+		}
 
 		frame = xen_page_to_gfn(virt_to_page(buf->directory +
 						     PAGE_SIZE * i));
@@ -457,11 +459,13 @@ static int grant_references(struct xen_front_pgdir_shbuf *buf)
 	if (buf->ops->grant_refs_for_buffer) {
 		ret = buf->ops->grant_refs_for_buffer(buf, &priv_gref_head, j);
 		if (ret)
-			return ret;
+			goto out_free_refs;
 	}
 
+	ret = 0;
+out_free_refs:
 	gnttab_free_grant_references(priv_gref_head);
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.54.0


