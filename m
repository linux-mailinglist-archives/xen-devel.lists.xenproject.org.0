Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAtPFtMxHWqtWAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:16:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B10761AC4B
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323701.1589365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTwsR-0007gz-Po; Mon, 01 Jun 2026 07:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323701.1589365; Mon, 01 Jun 2026 07:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTwsR-0007eo-M2; Mon, 01 Jun 2026 07:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1323701;
 Mon, 01 Jun 2026 07:12:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ravindrarkb1205@gmail.com>) id 1wTwp1-0007bj-6a
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 07:12:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTwoz-00GWnh-JA
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 09:12:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ravindrarkb1205@gmail.com>)
 id 6a1d30d0-bab6-0a2a0a5309dd-0a2a4503dc72-24
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:12:25 +0200
Received: from [209.85.214.196] (helo=mail-pl1-f196.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ravindrarkb1205@gmail.com>)
 id 6a1d30d8-672d-0a2a45030019-d155d6c4b4b2-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:12:25 +0200
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-2c0c1e0b0faso6513325ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:12:25 -0700 (PDT)
Received: from DESKTOP-988GDP4 ([203.92.58.30])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c0ce622c26sm41077575ad.67.2026.06.01.00.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 00:12:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780297943; x=1780902743; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BrAEZhtX2cTc6MCSwIp9N3idGRDAVYUepIZGLE1U7wM=;
        b=KO4WAqldJRW91yc2x3sfxo9UQA84+HclkWqsXlAnrYyhRFWsPzzPF/AgLsXxjhBqFt
         cHZXtvZG+MUcQ6BPV1qNIU5jNcWVLPBlq2e50/Nqof1lIgnpRxL8OSYUK7MxU5jCjCGW
         4M+KXmoqGxYcU8yM11EoPuA23ynCI8coVOHFqrbzTxqVOoiAZo4SYZZSKWhhc2bx7cQy
         qk5eFD3uX7SOOVLamTTRfozodUGdE2CkKyQcFrIGKxYP8U0xEmA9k4qcnGbAUGy++63a
         P6owjNhV1FJOjRljxujEnAv9rBORGSOvWkiKy9uG32xvyJO+FeWXoLKPHHVWRVrn7Cxf
         HBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780297943; x=1780902743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrAEZhtX2cTc6MCSwIp9N3idGRDAVYUepIZGLE1U7wM=;
        b=GRnVMx2Zkj+IWo1jpHgufLlwZ0kFUZZYXtY9qSTwnumzAGQaioxskcTNy19sywBrAT
         JHt5fHlE6Id0cZ/eFx86V4GNzieejIsCACkJBs6i02Cw2KtrZoOioeyM80upyNpqroPI
         bAxQ2LwwKjpnj5rK8b9OS6Blsz2nslWFaurfb19U+BGrCxgiTaZ9Vx60VXtoV4qpGQ+Q
         +QFZ3PNsBBS1JH7aoj/hHssIOsnyLU5gxdREmiFlGVMxRqgbFiVVQejelMQ/AB/7ZM7q
         HhB8SeQhi1Ojp/TvroIaqK/9gotAXHZBydGbbq/QJvHgwMrxYwwa51fTVTgAIODtI40I
         4hUA==
X-Gm-Message-State: AOJu0YyTp8kqG2KyXp76iq4cKmDDLruWlCD5pMcKGZ6lQXJdbF1pIPDW
	lCTsMq0jSF0uuJPVbc8XFJnB8W0LhjLKraQPPwCL3Xuw1lqQDM4xV8TQBOFLqM7LNCc=
X-Gm-Gg: Acq92OH0fkb3dNcU6YqQSMnCUz5JgOf307SnrZDNiX0oCoTiGQp7GQucshVMTRHRxml
	d7I8pObcrKwHFtCCxO+FUDbX1K+iK7sOQY+NuC6gbgMd7zJr8clwocYCjYbQ0Z5BYi2ItbUXI7T
	QXIToijzQUUFREc7Il3R7GIOtpkobdv83oyKeXHpuzNJtaTmJ46M6QakhU2DJU6xofbKQBpaEep
	VctxTmQ2Wvx7NUpCErOMIoVyOE1xSZZTzpIBVkF9zdfYQD0xn/u2El8fS1RY0ZWZjWVVifrHqiL
	GeqlYjeJFUiKOYhS02tr1DWvYFn8sz30HxE8YSRRP2Ereq9EaK/f5qzX15zvO3ibW8nHWukjOpS
	TKb4MUk/CfwDjh+LKV6s9qwl9L7JbeyjO+oqZHnG1HkZZzFQ/919cMDAIZkfGaJX2Vl3lzTlQg1
	Sb9yhjV9j++o2ZMxpYh/lsT4bO4uzoefRSGHE/g6Xfa/9YBz6i2/31pMNrFAhxUNAAyuuE
X-Received: by 2002:a17:903:15cf:b0:2c0:c38d:9d43 with SMTP id d9443c01a7336-2c0c38da2b7mr63308905ad.17.1780297943407;
        Mon, 01 Jun 2026 00:12:23 -0700 (PDT)
From: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
Subject: [PATCH 1/3] docs: fix typo in printk-formats documentation
Date: Mon,  1 Jun 2026 12:42:13 +0530
Message-ID: <20260601071215.468-1-ravindrarkb1205@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1780297945-39370938-60565C6C/0/0
X-purgate-type: clean
X-purgate-size: 695
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ravindrarkb1205@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ravindrarkb1205@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4B10761AC4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
---
 docs/misc/printk-formats.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/misc/printk-formats.txt b/docs/misc/printk-formats.txt
index ce32829dae..2cad98703b 100644
--- a/docs/misc/printk-formats.txt
+++ b/docs/misc/printk-formats.txt
@@ -23,7 +23,7 @@ Bitmaps (e.g. cpumask/nodemask):
 
 Symbol/Function pointers:
 
-       %ps     Symbol name with condition offset and size (iff offset != 0)
+       %ps     Symbol name with conditional offset and size (iff offset != 0)
                  e.g.  printk
                        default_idle+0x78/0x7d
 
-- 
2.51.0.windows.2


