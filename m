Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPJZDzskBWq3SwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 03:24:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B953CAD0
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 03:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308579.1579983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNKnr-0001mG-T9; Thu, 14 May 2026 01:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308579.1579983; Thu, 14 May 2026 01:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNKnr-0001kZ-Q0; Thu, 14 May 2026 01:23:55 +0000
Received: by outflank-mailman (input) for mailman id 1308579;
 Thu, 14 May 2026 01:23:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wNKnq-0001kT-Qb
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 01:23:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNKno-00Div4-DV
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 03:23:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a0523e1-e002-0a2a0a5209dd-0a2a450accb0-46
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 03:23:53 +0200
Received: from [52.101.52.55]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a052428-56b3-0a2a450a0019-34653437d48a-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 03:23:53 +0200
Received: from MW3PR05CA0008.namprd05.prod.outlook.com (2603:10b6:303:2b::13)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 01:23:49 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::99) by MW3PR05CA0008.outlook.office365.com
 (2603:10b6:303:2b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 01:23:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 01:23:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 13 May
 2026 20:23:47 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 May
 2026 20:23:47 -0500
Received: from [172.22.59.187] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 20:23:47 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mhu9FUR8iHeR+Q9nfyEMyNdN2mVabyzAf0/PH+ePpRFFJ2zJQLTQWnv6oFYoDDTwLq6mUCOG4K+jX9eYK7GxlZc5gO6l/47qNCfSPZpxumyX+F/PA8YaCJcbJmE4vQ2+f7Z940NzMjqQCFYI33tWrqoQGvruNcTOnqnKCH9y1EQcYy1ypp50S0dfSesyptwhQTD6t5hbpYxQr2Z6ZgtIah5hCmwGzPG9lw6W44ucKg4f8FT2UIBYLZ8+FI88z4Da1ZRmpCw+qwZ4plyc7oRobioSMiOOcwQFAsaItgrh83/rP0fgmLOI86WwmU0EUCvv1Mf2OFqyHvmJyKkobUd8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vMMdgFpCCx7rZUbpem9G3SNarBzXP9jMrSI85xD/z8=;
 b=krg3ygcli8gHfMF9fBUVgtYFNTRxpWGYoRU1Btfjeklg5//G0TSut4kVeLano9+FF4iLqphJUJ7VYliEq7xie9VIc3YIRkIIrsLV4HfITWZ9mDh6fURPOl2hi69iWE22bXhDhdq+cL/rskdHCmkYQqd8ue4c7y3Q6pv0I2FLXoZ93GisYNebomhGVmpF17FKBiZ58Tm2/gLgcqf8lnkSWc8+8bMjDs2U/iWDaMZkZEsQnKTNbBESC5J2fTlUMjbr+Z8fkDsSrVphuZ4uVYQzX1swCqGveONAToSzDwfx2EX85tPmkUeKHyYMfHzILK1k2R9ra/T34eZyDxdUQ9M8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vMMdgFpCCx7rZUbpem9G3SNarBzXP9jMrSI85xD/z8=;
 b=zg33CVKGZf65aKsK8xCduf/yTY57te/T7JoIhGp9lzKIuzzc1zJMLyjadighh5F93WSkj+TthJGrQQ/9vsdJyRZTuRFkKSNdI3Mtc+XDTsEco0nXollW4htx6WZYRSaHZ0tfsqKM/d3Dzjt1cprDiscKlu8kUW99M/mFebakf3A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <700f3bd5-2887-4f30-95b2-5dd19fb91abe@amd.com>
Date: Wed, 13 May 2026 21:18:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: map_domain_pirq(): pirq already mapped?
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: c2efcd20-7c5a-4360-b276-08deb1577325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	mhmP0cPi7nKkdafkchOukfzOxMhVrJE3Ujd8lvvDc5+W8q8kOXkEhNpKowZS8gSxB8YfL4EGSvR0LG+7fZ1DosftmzQZyPfbeOLzFjv8WH87iyJx2F8C0do7/qy1hp5qYIVRTRb8mudKz46yAQMqwM8d/GuUQz3gw2nfDiLIVsKo7ZgrbvU6tX3Eir2HpmYFNOn2Lnd9GeslgE3cYiQHINMIXyCv5DOqfx4Ht/AM2wExokBk11cqswwgSbSss6uQtuih8Zkps260eHiEk/O97kqQ3zfuHqxuzUtFKbn79B30Gbnt4sltbiRF58/rBA0EpEozamw//oQBTCyJDlqVVPZfkyWVpeOYKzBX6ZIR4R/f/wPUT4q12IWihcrH4/EQMWamNIgcPPLejmQvM+xekf8K/0pjDdFkzImI6pPJFXM+0UTo7AT9uzj7T9RO4R0ehyCeFcX36V2b9/lweGWXCdd9uK1/NoEnexoHfIvcNNKX6JC2rR/yoHymprIhXhJUI9RLLcjE11cXCMbSHuQfJdCzh8TMqT2DIkMmURjYMBHxmoKrRe4j3isHl9neqXGr8rCUOIIOjZx43UqQLQY7QAOF6h6pe/efH9j1NextcPOgYELk97dn4Wlg5zVMX8f46v2hqd1DNb4o+1lEwJdplhzMJ2XueHZZjdp4vwTkZ065kNDOS9FKaTOCOq/XY4dCsH/3DarjWjvhShp/Q3YrvXi1IYJMhY1TC9ZuABaYo+M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hrVwLu7xq4dMloaBwk/WSxUPo3QvEab0RtKyLOLTMzN9OSe0NUw0lx/C9MauiqEKNaG5B5sNikCO1+Kl/EoixjxFWbhOCS01cXjIZzK17bF78kOgmsq/TUCt9MIeWo6jOgYnAxqDmd+IlS6ZoiY2ZH+FDQa6Mkny+PIlUbesDWUrm62pVHa+gHx8nDoTuGa7gKOBdx3j5Du8iFj/8MH19M2vzzBBhHBQu+qS5km0L91NYuRCp9E6a3DoFJF1cvVo+LahFB6oqXrJqIDaGXIeEkmvyDIWnLChFj0ofblbg1J2EPTEVVjDcd9pQq0V4o35Xm8w+cfu0B0r9C8ZoEyTJwSIz6JcqDHrd7yETmgS+xSJkyvsjRSS5JuJwUx5pdlapsQW9AaCJ5lGKzXlh6aVma2xJKrAKi87lB9R7CJZK5gLLPrkjRBbbhvvDO7a+ZYy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 01:23:48.4584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2efcd20-7c5a-4360-b276-08deb1577325
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193
X-purgate-ID: tlsNG-4011c0/1778721833-70F618B7-CAF279E9/0/0
X-purgate-type: clean
X-purgate-size: 791
X-Rspamd-Queue-Id: A42B953CAD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action

Hi,

Early in map_domain_pirq(), we have this block:

     old_irq = domain_pirq_to_irq(d, pirq);
     old_pirq = domain_irq_to_pirq(d, irq);

     if ( (old_irq > 0 && (old_irq != irq) ) ||
          (old_pirq && (old_pirq != pirq)) )
     {
         dprintk(XENLOG_G_WARNING,
                 "dom%d: pirq %d or irq %d already mapped (%d,%d)\n",
                 d->domain_id, pirq, irq, old_pirq, old_irq);
         return 0;
     }

Why do we return 0 instead of -EEXIST?  Since the pirq is not updated, 
the caller doesn't know that pirq won't fire - only old_pirq.  For 
allocate_and_map_gsi_pirq(), the new pirq is still returned to the 
caller.  I would expect old_pirq to be returned so the caller knows what 
to use.  Am I missing something?

Thanks,
Jason

