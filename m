Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHihFxkkDGroXAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:49:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0857A7C2
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312610.1582690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPG8a-0005A3-Ll; Tue, 19 May 2026 08:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312610.1582690; Tue, 19 May 2026 08:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPG8a-000579-Ia; Tue, 19 May 2026 08:49:16 +0000
Received: by outflank-mailman (input) for mailman id 1312610;
 Tue, 19 May 2026 08:49:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPG8Z-000572-1j
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:49:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPG8Y-005wzN-Dg
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:49:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0c2407-bab6-0a2a0a5309dd-0a2a450bd00e-8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:49:13 +0200
Received: from [40.93.195.0]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0c2408-212f-0a2a450b0019-285dc30088cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:49:13 +0200
Received: from CH0PR03CA0377.namprd03.prod.outlook.com (2603:10b6:610:119::31)
 by IA1PR12MB9740.namprd12.prod.outlook.com (2603:10b6:208:465::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 08:49:09 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::34) by CH0PR03CA0377.outlook.office365.com
 (2603:10b6:610:119::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 08:49:09 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 08:49:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 03:49:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 01:49:05 -0700
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 03:49:04 -0500
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
 b=PVKRwKmOFPhXuLGpza/qy0F6MOK7wYyk9WXxy+54iULRfOEiMcGR6Q0kqgVwFOhsxWWVmLirn0JjzL5SGh6ALSwMc7GNHa3lgdy9i1OlbJHR9B2OP85GNTPl6pQ1WAJiDkGdFNjVZYMKwU2MJuy2RI6rcuDp1MirzS5le9rl9AO9yciT/mWnbpb5zDtlcmEUX6D18XCGQTpp6KPui3/bRY8ldhOUAFIqdbi7Y16bx33KZVoHGSednA/FVaEUbiDZDpsvQYHTDIYPct24r3vfLKvUsj1pMZfs6hL/LMIqjz7IXyJek7fiJbTliLG3bB4VCwk8bqHennATn1/uTYJ0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdU8KP8Law14UPZzsFBMa2+++QIUhEUyVlkbL0ovslo=;
 b=vx2wHWIX+mDk4EIcKIqKlU1tT5XCzTCoOmZXx26mRr4Fscy74BBA8PvFOUA0757L7BOacIcMrW0ULLfa7VeakxxwQNAKxiQojA4sBF/Xe1moEhA5HjtcpzbAV+5+lw70BitNLjaVnLCtN4rzc0urUeKcRtgdazq6AgvDiUVJD1sAW1LxbvXa0tQRrbXKZ1xHpTUZ4AlwGsGrc0mW5A3OkqdbzGbf6kRGUpDee2T+9ZnUV2uVfbjKuYxZpwQoyTMGnHCl95Cy1nq1n+3oZuA0zqpYwDeXApDldlqp+J0Ko5H5KTExptGnQscyfg3ZlbqsxCwYk44zgR83s5n200osGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdU8KP8Law14UPZzsFBMa2+++QIUhEUyVlkbL0ovslo=;
 b=bt8ZVBK3SKaTc5B9P/vysZrFb7AQeDkFmg1p8Nu+xRxQzMH4Htcgh4LiDFmwzbMQyIUED5sFH5/37Sd+IGAaKAaTU4aexTKMNswZ23vZLYj+qGM6QQapEO59NL6HqwTqsnuFOiSbjraTV7R6zeZpOtDWY0jMs+1BICpGU6sWb98=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <ca61a607-2f55-47b6-93f2-c25079dfd88b@amd.com>
Date: Tue, 19 May 2026 10:49:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/libfdt: fix UBSAN null pointer in
 fdt_property()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <0addc679de64cb59b28cf49ba3d39d17443d1ac8.1779179301.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0addc679de64cb59b28cf49ba3d39d17443d1ac8.1779179301.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|IA1PR12MB9740:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdca3c5-9351-4cd9-409d-08deb5837e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099003|18002099003|11063799006|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	mKyXxkRcHXOPp4z3OYr5ccZt4AXwq8s0lQhr/ezZTv3Nygf8nBkeQDDcn4RY5MTi4bHcX9rvQ7iyRoM3F19RfnXM73yfzPPwSPzIwNX0I8X732aAj5K+Z3z+97r7ap/2+lgMqknYVh+w1/Hty7YGHQWE0d+E7WFySZZ9EYy5YPO0Y5IF9DE/fGt8URTSTMnzvCaf8ojeULzHPB2Ox3a/d6BntuxU46sOgBwGuhb6fh11ykYlWuQEYQPbHu/CHRgagze14Rzs/vY1XE/oGpR054ukIMBpau+a9WQohc69BOQ3dO7INBaMlfWKoXOixH9D8UkXWyBDO3kFXgVDmk+H6yLF6HQ7G/J/+cU/ClqUkbB3Q6rI+xGbvHxq4S1Uj2GtSk3a7mB7xx23HeY/nEG6pEmo9AJjEq7QUWE5NE3169hQZIYZSCB+rpz0D85nRDd5wB3dPUm0c4OMDrnoaZws+RzmDruGLnsHm7Xmf+sBPrq9fFU8en8Mf0IQW+hssOmoj/83HHL64/tPHHdG70oJ39k2mN28USx/7dMpW2AVrvvYHMHNLQx7DaSeoNaaYnWm7bAdbKUNzOrGx7im06QGhiESXMQcOcYqlZUgKSIpeEG4XUZaIMMwoJsJ4Z/qSZ3ujAQytvograkfAWS9ye6R90ys9OsI4NsD5Q2wKyGyrsOP7ygPPBEIjviDYKWgP2s7P1+0P/z8edFiBtalA2ix1NHiBrpLaYH8l2wJ+YJIipg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099003)(18002099003)(11063799006)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3ARutpuTfTNvNt6VMfDLk+VvM+s8uwl8GTZMfLNh1DkuYpB12XoowRTarbYZuGtDC4I+xiXtzGwhHNIFq6L2MWz9b43H7rKNrSoezu5XFesL+hKNcsqWWkxseHwRmO6s0VwS1eUNmGaBHwPg9osB3ELnWGISmMm3ZsbMb5PmBFBl+axHc10yUtVvLJJ53scpt+9I1XwxJHB4s3DT55/t53Rar9U9LVdTJ4bDDzRTN/YRDQCQ/eHIu6FHqA/zhlxyPRRLmUZMWu9XsA8jdaLVdowSTZjcorSrobrUvyclTRdhJhKqTRq2TI4SX0A09VaJPRbQDdz+bvn3H2QyY8CB0inS4R75wG7dSdGvKaHeP7NIqwZGC4tynlIsRU8fiEx/w0AcvuBWEDeGmgGY5q7W/eu93qfAeEtkX8kuJtnsq506QWuuKCKg4gmixu1PD9V/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:49:09.2464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdca3c5-9351-4cd9-409d-08deb5837e08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9740
X-purgate-ID: tlsNG-42698a/1779180553-1BF7EF3B-7A759B5C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1775
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: BFE0857A7C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksii,

We treat libfdt as external library and we don't accept any edits here prior to
first sending a fix to libfdt and then cherry-picking a patch (in fact, afacit
we then do the libfdt version update).

~Michal

On 19-May-26 10:39, Oleksii Kurochko wrote:
> fdt_property() unconditionally calls memcpy(ptr, val, len) even when
> len is zero and val is NULL.  This is a legitimate calling convention
> for adding empty FDT properties such as "interrupt-controller", which
> carry no payload.
> 
> In Xen, memcpy() maps to __builtin_memcpy(). The compiler treats
> __builtin_memcpy as nonnull on its pointer arguments, so UBSAN fires
> before it can observe that len is zero:
>   UBSAN: Undefined behaviour in common/libfdt/fdt_sw.c:333:2
>          null pointer passed as argument 2, declared with nonnull
>          attribute
> 
> Guard the memcpy() with a check on len so it is skipped entirely when
> there is no payload to copy, bringing the code in line with the
> nonnull contract.
> 
> Fixes: f0ea06558068 ("libfdt: add version 1.3.0")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>  xen/common/libfdt/fdt_sw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/libfdt/fdt_sw.c b/xen/common/libfdt/fdt_sw.c
> index 4c569ee7eb0d..96d4cf571319 100644
> --- a/xen/common/libfdt/fdt_sw.c
> +++ b/xen/common/libfdt/fdt_sw.c
> @@ -330,7 +330,8 @@ int fdt_property(void *fdt, const char *name, const void *val, int len)
>  	ret = fdt_property_placeholder(fdt, name, len, &ptr);
>  	if (ret)
>  		return ret;
> -	memcpy(ptr, val, len);
> +	if (len)
> +		memcpy(ptr, val, len);
>  	return 0;
>  }
>  


