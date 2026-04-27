Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOzdDqLc72mMHAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 00:01:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B014C47B0CE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 00:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295350.1572020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHU0V-0003Fv-TX; Mon, 27 Apr 2026 22:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295350.1572020; Mon, 27 Apr 2026 22:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHU0V-0003D5-QM; Mon, 27 Apr 2026 22:00:47 +0000
Received: by outflank-mailman (input) for mailman id 1295350;
 Mon, 27 Apr 2026 22:00:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wHU0U-00039Q-Mm
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 22:00:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHU0U-005yAH-3e
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 00:00:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69efdc8b-bab6-0a2a0a5309dd-0a2a450682f0-8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 00:00:45 +0200
Received: from [40.107.208.26]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69efdc8b-7371-0a2a45060019-286bd01aaaa4-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 00:00:45 +0200
Received: from SJ0PR03CA0376.namprd03.prod.outlook.com (2603:10b6:a03:3a1::21)
 by DS4PR12MB9588.namprd12.prod.outlook.com (2603:10b6:8:282::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 22:00:41 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::7) by SJ0PR03CA0376.outlook.office365.com
 (2603:10b6:a03:3a1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 22:00:40 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 22:00:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 17:00:38 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 17:00:38 -0500
Received: from [172.27.93.19] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 17:00:38 -0500
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
 b=kyhtrEgN/86GbNM11t50VscGXDc5FGGZ+7VUFVnd9Dzt/KxEl1yGz79hFBxSTsz44R+1tdxC7TTyFLQ/ygO5QR0M0arlOS5QZvoPw+od0Dd+CqdlX13OdcTwAndQtJoyod3Htp/6eeuOmSJ2WQKk/ARjybJy4QiLsrnMOJx2vtEG5/0U1BFnI6begVUySo0waM95J6KQ5UT2yrsaFwQnal/XFnM5dOs/guvPmMGbRx5SZfRTP7hVP/nhPgKq8Xa2F3ur5e8QDfC7YR/TiGtOk2nqCwh8wAqoS8ZRfRWyLuV+M6l+H2HAFkC2TKYIxCLj44WZXmP55FOTmeA/WWJG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Plj1IuUk+kxpPzBNOKhSZ00paaee269CWXprrl/G2DA=;
 b=KA5tvd7QVmUwGj+wXn1xKK4gn3db15ntQp0Mv/lZjvCQNqdNX/ZTQrpZp433R7PMzDnoCTiYsqHZxy077y0pbVEL0hbYkdC4yIZBwEbWtGPQ32z3yvKC/97M5yh5n39Vx17cegww7JAF8ngwAmgQWNxetnLNAjeC5b5Q16fdOFyIGJx99F4wURcD+4SSt55EJ4j+SGbmkPUKluw+db3rEzBpDzTra3PnWZOTRqo6WFT1QMAJnciahrLboeqGC1Anh6qKgc1wBw8hZzGzxBgVkKrl6Im4sa6/WXB5FUpqT/cHdfJpSS3jp0XlNSl4iU1uUz0OQacUo3kdpjJLgQsEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Plj1IuUk+kxpPzBNOKhSZ00paaee269CWXprrl/G2DA=;
 b=sF+pblCreddbQvFDVWb8DZCWk0/OtG0RaAsGw5pIwAwvUAa4SAOcXPr2Nx00wg15dljTtCKnisD+swDRrghEPmOJZpUhNHv/gjH4GI8RKMT6fvLL7uJ1L+1yVJMjtWsudLGQvZZXZEtQHLc6BwSnZGEc/6ChKTLZXJUqdz8XHz0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b752fdef-9950-45c9-bf0a-bea973c0c861@amd.com>
Date: Mon, 27 Apr 2026 18:00:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] tools/xenstored: add support for "all domains" node
 permission
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: <dmukhin@ford.com>, Anthony PERARD <anthony.perard@vates.tech>, "Julien
 Grall" <julien@xen.org>
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260423080840.530547-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|DS4PR12MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: 933944a8-c0b8-4f39-3f16-08dea4a86c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PVENZ9JHF7a0j/FDc+51aRqQ+1v1MIe6RFMECw7BWzQT2xpBtpueYuWuWCvagHcqREOT0MHIJ7JGhOoyUKOKiml7CHhGHKrDOY7bsNYIOyGB+Pc8r/zmIYJhfzqzaQ9VeTZsMCJ3lHvvsYBk10NwhOHlL5ZycOJcn3L1UWHI+Rrx0ZULGH+FxhqiEu3/HDXCE8X+5AUi2JQAiGHCZoQs+56RcIXupZ6aGtzncUN3MEgl3+DinNP4gKWkst+QYVO/PyB3ykWabszCTkZ/uVr0CSjPzm74FOF/bdr0xX5UuczxAy4Qa+sDFSRcsUySxpi9FArtJX8T1QF/KBtgiEvh0344FJ6mhqF71JpJO+plktY+bQmlxvOECnq5xbOkTN0E4+uHU96MSEK1PTP1RiSENBnyurCMj7QHKi6RQq3Gyzvkf5DnxWshP10deE/Jgg8WBDrdoDU2tCzxRQVbsQLAq9CxCGYwfYR1hrd0tedZhg5y7LKxPiJF/tmmTvS+KLTia7xHomYXermdom4lnCZzpc2JrlY3D4nGinegK5UvOtsnfBMNXyUEuBVFHlA0aC5LZeS4lzQrsSZvxFEJHFEKjq+v9wCU59x5R6Ayj4D0F/YHdFo5KS8CG7DnFMpbr6DP25JpOwZ4mjEV4xyv18hXY8RXS6+VZyqBRocKd1NU/dapyT2pPCJPkz0PtnqtFrXy2tUddzhEGj5X5ib3HXxVgf04kL8MTEJeZA/6+X7zHImhew8TxXxEyBW3iQQISA1VVcaO/wGis661dJr89F1HhA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vJ/E3e67BORGzMxIes60C3xdqZf88N8fYj3OZoO/VM/Bs1kzzUI+eh94ze08PExLDqmDqUTncnqH2E2E90wgIka+daGhuMwHkvbRnPxGn7wVxUghxyS/lBnJrk2SmhxgvzMPrLC5bvlX4UW40n2IlQBZz0/r/h4lNlvNRibkB2LMS3Nu8zd7zr9m2kLiIioYeYZgV7EiZkhB8/iQcplFG+PDni5xahMghKuwbkDPOyADWkm9/clNy/Kw4IVjt3uQeZEewC/1muteUm21Yp+wBRuoknt2JLzK0sIH6AhgDZyQYLdqambKyUaJgsZBwYiJ++tXoUGZ8+gkLEO8JtCDHvaOVyu5k1RTn137eDSgNXYD/ygaZoXOt0orJxtcgbfBSBOwX8ZyuDmrr3tl9E8qqv0DulwN1tovz8pbagdINOUKzl9cZ3Um2/a497k0xVou
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 22:00:40.6182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 933944a8-c0b8-4f39-3f16-08dea4a86c0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9588
X-purgate-ID: tlsNG-16d1c6/1777327245-91985D75-C5AC291C/0/0
X-purgate-type: clean
X-purgate-size: 1166
X-Rspamd-Queue-Id: B014C47B0CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]

On 2026-04-23 04:08, Juergen Gross wrote:
> Add support for using DOMID_ANY in node permissions to indicate that
> all domains are allowed to access the node.
> 
> Add a new feature bit for indicating the support of DOMID_ANY.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>


> @@ -1754,8 +1755,12 @@ static bool chk_domain_generation(unsigned int domid, uint64_t gen)
>    * Allocate all missing struct domain referenced by a permission set.
>    * Any permission entries for not existing domains will be marked to be
>    * ignored.
> + * An DOMID_ANY entry will be marked to be ignored, if the writing

a/An/A/

> + * domain doesn't have the XENSTORE_SERVER_FEATURE_DOMID_ANY enabled. Note
> + * that Xen tools will never set DOMID_ANY for a guest owned node.

I'm not sure about stating "Xen tools will never" here since it may 
change in the future, and will not be updated.  Maybe "Note that Xen 
tools don't currently set DOMID_ANY for a guest owned node, and they 
aren't expected in the future."?  But maybe just drop it since I'm not 
seeing much value.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

