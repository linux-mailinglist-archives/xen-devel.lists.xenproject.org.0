Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHzTJdMxHWqtWAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:16:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB3A61AC52
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323704.1589378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTwsS-0007uh-Ap; Mon, 01 Jun 2026 07:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323704.1589378; Mon, 01 Jun 2026 07:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTwsS-0007nT-7I; Mon, 01 Jun 2026 07:16:00 +0000
Received: by outflank-mailman (input) for mailman id 1323704;
 Mon, 01 Jun 2026 07:12:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ravindrarkb1205@gmail.com>) id 1wTwp4-0007cJ-RK
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 07:12:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTwp4-009Vor-72
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 09:12:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ravindrarkb1205@gmail.com>)
 id 6a1d30d4-5cb7-0a2a0a5109dd-0a2a450ad178-30
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:12:30 +0200
Received: from [209.85.214.177] (helo=mail-pl1-f177.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ravindrarkb1205@gmail.com>)
 id 6a1d30dc-56b3-0a2a450a0019-d155d6b1dd88-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:12:30 +0200
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2c0c2d792c8so6001935ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:12:29 -0700 (PDT)
Received: from DESKTOP-988GDP4 ([203.92.58.30])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c0ce622c26sm41077575ad.67.2026.06.01.00.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 00:12:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780297948; x=1780902748; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7DFxsU4D/ay+eRV7XxnX8h4nmcXOheUbufn0kw5BPY=;
        b=DTmDkZSjMPt9Rb0iAvKmjOLnRZtW1GGVqAl1sGbrvKqLEhyizoGPfBw6TpdiNppAkM
         6ip7DuqN5Ad2cmOIr6LZBdEMJYE5VbVDpypWJNz21hsS/7ztr2YGMPlCAV2VXKNZlMJ4
         fi4tHbb2da+Tjyf6aNJgoZuvnnhXwquU9FS1knWwd4AI/SbLngI7HeL7wLnXrTxAcf0d
         DepkkGBWiV/11FuIljxuii/9XBKL0AeDkZatzYjTrS3GvSdo4ksn/jPGMpJPXDC08L9q
         n8PMbn9WSU83GXjQWurICfvCXls0goNf5ToYYzouZwMp2uak5brLhyRmwxtZyU/uUMEx
         BfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780297948; x=1780902748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7DFxsU4D/ay+eRV7XxnX8h4nmcXOheUbufn0kw5BPY=;
        b=ZkZJymrQ8w5W56mIitJoZCcnrRd8tRCeOJuARmfp9VVeuRsk7OHhYrumUVSP0uucC/
         RWpwNYTYNtziRtHh9vqGjcnRITjaDjDhEmIzKhMNrzzkL62IGj7rj4AC8xq5ADM3NI66
         jAZLQrI7JDBPckcWb7nAl3N4BkDWNZqnLsTiAkHyb37hjcXOx53AOM/w3rWGXYaYJd+1
         Y8uPr9K+EVkCuCxckIJZIDoumU58EMJm+idms8pbuJmtqXlKOdaMkQ17HyBOSzBXLSIM
         D08oy4ez2QrqeDlnm1mPnRf7yFi4c3l2Sp20UCRkLW119Oc8Nt1cIQShrCejtuK8AA4P
         DIWw==
X-Gm-Message-State: AOJu0YwWmOr/kC3Y6zr+onM3F7NwoOOZKMBccjg371K2DJenMdks2soI
	usa8mRkqAU2PUCvnPmjkF+PVj/AB8Q6r8JxZ0UXG/Db7rpu9P8jog/0uJvVzpwSY
X-Gm-Gg: Acq92OFWQdXPoxI0Gywt43Sbk+EXRjaMkNVym6Ar2zJDx0P9AXCHUv8krmQ4ug3VuNX
	FrDj2Rwq+AxFbAJPiZFsRi2jgYfXPP59romVo4RgFM9uQR0cQRM8izMwHdjmdGN6gWh1595S4j+
	cDVyh/r+IvwWRNfOtdTPS+rFlUajC78qxmoJ1iVNGk3WQCQnDRU8apMYBJ0sqNIIY9NK84Tx9uI
	Wxo349/gMVxd9cmEeZL1RQtAWqNnvT1d0Ub7+QZT2AcqzCa1Pb24hAFvLtlC+752mfl8QUykFmA
	b/KbyCpXw6i5nytj4X+L+G5lHyGGpR2uADhjdBu0hI842X6YCClTO5mEWomFx/9FEkr3xF9/2DJ
	p8hzd3N4bnnqxQlxruQAezh2Ws0UWuff0e4fSIzUlKlk46SLVgelICWA31LOtgGFmhLl0CzhGwq
	kG8jmQu54J+RyTjrP/yiM1WM5BAJKdVgVJss5VDdtKgbUw6j89dlBn6KHPqA==
X-Received: by 2002:a17:903:390b:b0:2c0:cea4:3df4 with SMTP id d9443c01a7336-2c0cea4404cmr46973645ad.40.1780297948048;
        Mon, 01 Jun 2026 00:12:28 -0700 (PDT)
From: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
Subject: [PATCH 3/3] docs: fix spelling of 'receiver' and 'receiving' in libxc-migration-stream
Date: Mon,  1 Jun 2026 12:42:15 +0530
Message-ID: <20260601071215.468-3-ravindrarkb1205@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.2
In-Reply-To: <20260601071215.468-1-ravindrarkb1205@gmail.com>
References: <20260601071215.468-1-ravindrarkb1205@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780297950-73F798B7-1D9CB0F3/0/0
X-purgate-type: clean
X-purgate-size: 1466
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8AB3A61AC52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
---
 docs/specs/libxc-migration-stream.pandoc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
index 8aeab3b11b..1319ce1f1e 100644
--- a/docs/specs/libxc-migration-stream.pandoc
+++ b/docs/specs/libxc-migration-stream.pandoc
@@ -753,7 +753,7 @@ A v3 stream is compatible with a v2 stream, but mandates the presense of a
 STATIC_DATA_END record ahead of any memory/register content.  This is to ease
 the introduction of new static configuration records over time.
 
-A v3-compatible reciever interpreting a v2 stream should infer the position of
+A v3-compatible receiver interpreting a v2 stream should infer the position of
 STATIC_DATA_END based on finding the first X86_PV_P2M_FRAMES record (for PV
 guests), or PAGE_DATA record (for HVM guests) and behave as if STATIC_DATA_END
 had been sent.
@@ -807,7 +807,7 @@ never change size or location.
 Errata
 ======
 
-1. For compatibility with older code, the receving side of a stream should
+1. For compatibility with older code, the receiving side of a stream should
    tolerate and ignore variable sized records with zero content.  Xen releases
    between 4.6 and 4.8 could end up generating valid HVM_PARAMS or
    X86_PV_VCPU_{EXTENDED,XSAVE,MSRS} records with zero-length content.
-- 
2.51.0.windows.2


