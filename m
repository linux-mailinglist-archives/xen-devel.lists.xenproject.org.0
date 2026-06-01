Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IANoENIxHWqtWAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:16:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E361AC44
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323702.1589372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTwsS-0007lW-1y; Mon, 01 Jun 2026 07:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323702.1589372; Mon, 01 Jun 2026 07:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTwsR-0007hQ-Sd; Mon, 01 Jun 2026 07:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1323702;
 Mon, 01 Jun 2026 07:12:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ravindrarkb1205@gmail.com>) id 1wTwp2-0007bp-Pg
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 07:12:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTwp1-00CHIF-VR
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 09:12:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ravindrarkb1205@gmail.com>)
 id 6a1d30da-5cb7-0a2a0a5109dd-0a2a450bc63e-2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:12:27 +0200
Received: from [209.85.214.179] (helo=mail-pl1-f179.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ravindrarkb1205@gmail.com>)
 id 6a1d30da-212f-0a2a450b0019-d155d6b3f08a-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:12:27 +0200
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2bf02708e8fso28093075ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:12:27 -0700 (PDT)
Received: from DESKTOP-988GDP4 ([203.92.58.30])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c0ce622c26sm41077575ad.67.2026.06.01.00.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 00:12:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780297946; x=1780902746; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ie31hZoIIBjgyXsWodiLr0VB+wLXigW6gUNYZ0Kgug=;
        b=JFgfIXS/9vyzZ5IAY4Bzt0rwkWZGAmGqp8idyECavmq7clzlAcOJouzVFxRqa3tAGP
         PICAZ5QuFRCQLiSomXWYQcIX806R21yEt1kraBBtfFUyj+yb0yqaThs3SgaOdRkAICZk
         TPwgXKvUwiTPU/Rkn22863FkWBTLh1l9pIUcF8L1Q3XZnrI8ltnUr/RNaX1RjJxUsyhu
         Ndop7YcJCNWyMreWD8HLY4ULyAPgn8t3wM6BMxtKdfUw4YYKWbKXj7vWL4h2Xg5TEHK7
         1XqKv/Vtt7MPMtJqc9fNAIV5Zm0hJwSurcKDm78I8ntdQG1w9eKF4A84a+U62OYvnt/U
         px/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780297946; x=1780902746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Ie31hZoIIBjgyXsWodiLr0VB+wLXigW6gUNYZ0Kgug=;
        b=gSp4swIYyn5xetoaMbwnfbkdQBgP4L1WDfckobDjAGzqhjy+MjB3wSOWrZEXHcWMan
         YKIaO+Dp7NHdnUWpzGnja26MmLoGlUddFlHk4Q3yFmqLql/FAcT1dJmp/x9ZYwDhkZfN
         wVs7LDPHEKrJsbR9Vsh++yDtj0vHIQaZbL/NzA2mRkXvvQXO4b5bar70EBhlRCPqaz/I
         qrQfNZMapERMKZtv6QO8I10g6PhfI/+kCWOKyRnQV01h8YZtIQdvZe8OPPAVnrmojAaj
         4L9yyJwpqiSI2Gymw2MmPWRs1imk2RwDBax1W8/W8xwUN2vBUx9sYd06N2t2yeQGnWn7
         sHEQ==
X-Gm-Message-State: AOJu0Yw7AFB2OoOH2JqXBM2R0MkniAmRSlT1cPN5Aor8SGzJeqdhtfE1
	8MY8VFDhShzZmaDLx3v4SnhTx6L998yGBXbBDDZ08Rmmzd0OUAgisftQYLBITVbS
X-Gm-Gg: Acq92OF8cjsEo8Bng/rwT2l4dN1RL5z1Gx6776m6xDSv9pirjCHMydyWApoiQo+cCeq
	crWH+xaB28tbapiWb6UigsU0PMT0DOnXIEgUMI9/6DX222yi/oN0gc+xdfAEsxiea2WP6+/Y3nu
	1uJV9rBr8VLd8hqKC9uWY7nn/XChFzHGzGNwwF7xUINTZsdVjKSO5PASBzUjJwf+XgRN1i+a9GH
	8rxglD7sqjS2qz2Y2+iBbBuLuAFydLjtf1aKhiQhcsjsMxk4ztj4+yRyJiDsiBxcvUQHUAf91+o
	8wiHQkbi1vKrJcUXKRXMNw3XFrN8tSx54R7NaRpII2AO/dNRrm5e/oqPT+WpApKuD1Gd7T0X6XV
	77XdFdbkAkoCR1DB/qxk/oXlcP20SnNZGZC148BtTRXDGq8BeQ0Y4qkT7Ume0crt692H18HcA/C
	e24kkNrfcvoQ2d3VUBRaOhs5tmDzFrGfx97Te0Z5HEgoqjsVmj/8gC3AyIsg==
X-Received: by 2002:a17:902:f78b:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2bf9760bc96mr97581265ad.26.1780297945769;
        Mon, 01 Jun 2026 00:12:25 -0700 (PDT)
From: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
Subject: [PATCH 2/3] docs: fix spelling of 'receive' in xen-command-line
Date: Mon,  1 Jun 2026 12:42:14 +0530
Message-ID: <20260601071215.468-2-ravindrarkb1205@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.2
In-Reply-To: <20260601071215.468-1-ravindrarkb1205@gmail.com>
References: <20260601071215.468-1-ravindrarkb1205@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780297947-21D85F3B-63B0922C/0/0
X-purgate-type: clean
X-purgate-size: 957
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ravindrarkb1205@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ravindrarkb1205@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ravindrarkb1205@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D49E361AC44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
---
 docs/misc/xen-command-line.pandoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8c89b7852c..ef3c737189 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -191,7 +191,7 @@ The functionality that this option controls is only available when Xen has been
 compiled with the build setting for Argo enabled in the build configuration.
 
 Argo is a interdomain communication mechanism, where Xen acts as the central
-point of authority.  Guests may register memory rings to recieve messages,
+point of authority.  Guests may register memory rings to receive messages,
 query the status of other domains, and send messages by hypercall, all subject
 to appropriate auditing by Xen.  Argo is disabled by default.
 
-- 
2.51.0.windows.2


