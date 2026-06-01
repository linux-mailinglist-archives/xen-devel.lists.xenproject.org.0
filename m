Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMenB2s2HWoqWQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:36:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8C561AF6F
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323739.1589411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTxBq-00044g-91; Mon, 01 Jun 2026 07:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323739.1589411; Mon, 01 Jun 2026 07:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTxBq-00041r-69; Mon, 01 Jun 2026 07:36:02 +0000
Received: by outflank-mailman (input) for mailman id 1323739;
 Mon, 01 Jun 2026 07:36:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wTxBo-00041Z-FX
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 07:36:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTxBn-00CLvD-SM
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 09:35:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1d365c-bab6-0a2a0a5309dd-0a2a450cc952-20
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:35:59 +0200
Received: from [52.101.48.23]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1d365b-62f1-0a2a450c0019-34653017f0cb-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:35:57 +0200
Received: from SA1PR02CA0022.namprd02.prod.outlook.com (2603:10b6:806:2cf::29)
 by SA0PR12MB7463.namprd12.prod.outlook.com (2603:10b6:806:24b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Mon, 1 Jun 2026
 07:35:52 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::59) by SA1PR02CA0022.outlook.office365.com
 (2603:10b6:806:2cf::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Mon, 1
 Jun 2026 07:35:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 07:35:52 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 02:35:51 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 1 Jun 2026 02:35:51 -0500
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
 b=DST5lG6+Sq9/R6RK83qvlXsK4ywo/D43ejmNsRolCd5T30/yHbvqKhnot4kLT91BxW/eQR8Jzx/Yx1FsCeUjdKSCtL/OmwSOtbE4rqlB5jnAdv01iSTI05m2UwTH13xMSE8VDkO81IONZnuagUAQaWhfQIrs9Ysz9pv7awYswR+rFSepdhiWTcHEKJfIMvY/OUl9JHHbZEvCEmDPTneXVIu3WBnkzBVmlXzAQgOxIHpsJrPh5NJmMUwBpqGPsptdLrrg10CyfGrr85fLt7IYIR2HYYl0jr8xdsSFZc7SA1KrOo9BYdj5GSHfx/rGEZKNBCxVshsgF6iABFtPiU2RIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umTJoen5CxzPeQKwd3zF98RX2J62pDM94omI3nqAAVw=;
 b=swH5zvOHP9v/5Xdj2D2UFXtNI5XCUjSbToqxgg+UXIV9VxW46kM2g4QGZhGqJyzK4T5nGYAgBX9baMI9l2cVrGiPU3+gg/yTpJ/f4KV3KjgrS0NjfkovWg5lDvpqJHubbpXGiv4UQnIUvwCamvAMOV8D9LcrMnjRWBnkDEEP8GdrDs98Tnp3NXgAFEyd13sE3cXQ0H6mlEkKZRt44rHeXHZSI6J8AJnJ8tl0LZDPEYFATFyKYAyLpvH8bAulTSKez1LJ74q3iScToqdesRXuTAy59Ipaflk83qOgAo2ie0j3peZH9uKXlGXYD5E6LwyrCpcjcj72fbBmdgxvzg3OPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umTJoen5CxzPeQKwd3zF98RX2J62pDM94omI3nqAAVw=;
 b=R4JXO4KaHI4mOZ5ztak+RItROhlUQgLTIBYQJNetR/gkUwaikdb+jzOD1RjBTD4U2TfulHXlfvkcBpAPeHHbirsXu+UxzgPy0FgVGZXcNilcSWlFovznf6gbYbqkWVZyYmXEcoFA5R9dyPBqk9fmF7GQZ80NxGGVKdWHTJzCH8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b59a6497-eb15-4abe-9a60-b2d23877306b@amd.com>
Date: Mon, 1 Jun 2026 09:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] docs: fix spelling of 'receiver' and 'receiving' in
 libxc-migration-stream
To: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>,
	<xen-devel@lists.xenproject.org>
References: <20260601071215.468-1-ravindrarkb1205@gmail.com>
 <20260601071215.468-3-ravindrarkb1205@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260601071215.468-3-ravindrarkb1205@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|SA0PR12MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9eb6b4-12dc-4104-d51b-08debfb0687a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|11063799006|6133799003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rlE0W6/g1SBiG6amvycw/ih40plUOkK7pAcwCzblp7+joYkL/Hh9tvqVJDc8KN2BKGYQRrxpK41ZKKDR+p/4U1E0WAa+lqP488/8ib4Q9jj40Q5ZgOpcxfYLuQpDyaA9P91z4O+oIPpor5t+15+vY9UQ8JgINHq3Scbsqx/Wq+ICWFg/n9C5bGRJusnWFoGIPCN1yjhihc4resnIgTrZ4Q8u3D3e+oR8hIxFrbQiF2Q2LFCQdZLSEhd7jykn2ppMlRPJUjwJxnSUEpHBVp+OFriLK3To8zclrYGkBkJMFr1ME2e/ADoALAZ3xzbNnNZ0SO2ldZsTFLVS2rPI42nSknSKS1Cvl9Fsq2rjxSzgYS1lI+jhAC8e7xaXCYOrVAT/iZwu2Vh/1wbszzEiWPVJa1609mIkRfdBXEzlRSetV9osQLEtErXNCsWhOJL5Evn9bRCfhqv2F/BHy6MO7s4AW2gEW1+/KB7S/8lfzwKc0ufDy98wAMWzLRfA5R6CIrwYdaFCHF3d6wBW50jItytYlkz+KJRaY+Q9Y4m/HczlyeXZfxvTd/XBkidcNBPFAcOMG/qYcGDD3rRDtB0V530QrJZ+x9aFVxORmX4tcYivG3K15QtSyt46hwdUGCeI5ykNxXJQj+BbmEdMy61A0REUL0QFUhf4kaKYGghujaSON7SebBuGm4t+1ZVP3G1gl7u7FGJHSAQeoPqHmCHFtgCdWgdjw2GpUD2IvUUHAK7SJkc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(11063799006)(6133799003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IV1sJGmOxQbOYHB78+2azKDRw6uxechVpcDVHhxWjfvDM+HkWuIm0/mSCSb+inS1qYJsQcYiKBL5Deieg/086uiZZCiKaDMcqhf31ZWR07nwu+3iAnJadJosdmwiApK82uw8kIujKJ8PPQcn1an1znqnNmxSfHz49Zzd3Njc0XuVnDvJoyjow6EAZRngLvaXnbe0o47pN+QAFIn4xQFkyNXgr7qaLg0jcLIXS4s5otpqDKnb5L5pjB/rR4jOdu6awy2WlTlq2R7ITsSfPWhSbssi9g7BTJrn/cxSuzFXWbLZfboDiI5eiLCzI/LtlBz9zqpIRS/zHAttOuWc+r9TWBIn5XffC2ptMt/QBgc5TnuuEyNo1czQLgq/yYAsRU5KoL+SisOx7dYPEJ+XvV70wrD0+mSgOFcwg8E3DaIU1FmCkeq6/ckY+wiK7DiJg6m7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:35:52.0603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9eb6b4-12dc-4104-d51b-08debfb0687a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7463
X-purgate-ID: tlsNG-d25034/1780299357-E0159CF5-6A31B838/0/0
X-purgate-type: clean
X-purgate-size: 1610
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ravindrarkb1205@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 7D8C561AF6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 01-Jun-26 09:12, Ravindra Kumar Bundela wrote:
> Signed-off-by: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
> ---
>  docs/specs/libxc-migration-stream.pandoc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
> index 8aeab3b11b..1319ce1f1e 100644
> --- a/docs/specs/libxc-migration-stream.pandoc
> +++ b/docs/specs/libxc-migration-stream.pandoc
> @@ -753,7 +753,7 @@ A v3 stream is compatible with a v2 stream, but mandates the presense of a
>  STATIC_DATA_END record ahead of any memory/register content.  This is to ease
>  the introduction of new static configuration records over time.
>  
> -A v3-compatible reciever interpreting a v2 stream should infer the position of
> +A v3-compatible receiver interpreting a v2 stream should infer the position of
>  STATIC_DATA_END based on finding the first X86_PV_P2M_FRAMES record (for PV
>  guests), or PAGE_DATA record (for HVM guests) and behave as if STATIC_DATA_END
>  had been sent.
> @@ -807,7 +807,7 @@ never change size or location.
>  Errata
>  ======
>  
> -1. For compatibility with older code, the receving side of a stream should
> +1. For compatibility with older code, the receiving side of a stream should
>     tolerate and ignore variable sized records with zero content.  Xen releases
>     between 4.6 and 4.8 could end up generating valid HVM_PARAMS or
>     X86_PV_VCPU_{EXTENDED,XSAVE,MSRS} records with zero-length content.
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


