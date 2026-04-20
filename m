Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kx/Awa85mkW0QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:51:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7563F434F92
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288261.1568550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEyOT-0006Nu-VC; Mon, 20 Apr 2026 23:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288261.1568550; Mon, 20 Apr 2026 23:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEyOT-0006Lj-SN; Mon, 20 Apr 2026 23:51:09 +0000
Received: by outflank-mailman (input) for mailman id 1288261;
 Mon, 20 Apr 2026 23:51:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wEyOS-0006JA-H1
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:51:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEyOR-008x0I-PE
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 01:51:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6bbaa-5cb7-0a2a0a5109dd-0a2a450bb2da-24
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:51:07 +0200
Received: from [40.93.201.5]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6bbe9-212f-0a2a450b0019-285dc9050b78-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:51:07 +0200
Received: from CH5PR03CA0002.namprd03.prod.outlook.com (2603:10b6:610:1f1::14)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 23:50:59 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::63) by CH5PR03CA0002.outlook.office365.com
 (2603:10b6:610:1f1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 23:50:58 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 23:50:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 18:50:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 18:50:58 -0500
Received: from [172.28.123.27] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 18:50:57 -0500
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
 b=ue8RVeraOTZnhGArymj+um+5g+Oe0TeBkNZi3ltEKbUXawH+DQLGQI+2vBM7qbgI2LmUiCmduUeL3CSeOFI4+t/TLPSgfM5CCVD18+iu5ZLDTCMju9ofYw/+gUx0xtRYlBLtbhhWaRFvBC35wO557RiW07QK63aBjpv4RpDWBml/Roj/eFk7TSbxqQQtM4Vc/yziPdIiCV/vOtLFn24pMs8w8H6I3trfD73y4DcI4N2OZ/BtC36dQSIhg8iLUKjS4zh2QfTIJnPp5Y4uDDYqvW5+0gZN8R6cFratx/wvNkokoSk4V+5ifVqGRHWptTB387PlCwFWQdjk/xJSX+efng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnZjx5wyPP3o8YwyK/kvZqix0T4Ac0UZ5dpsNMO9/KU=;
 b=nS0/jsiJ1D80rWckZTU0ntwpnh0AejEYnarPAYzOj1zQTgolh7ZDKxv/6iwaH1/K+NM4KDy2desHSFBhm6UCcH3qtXLwa0lsP8tjRfjcSYSPOOzoEOEbnb3kSF2EgZOk0FHxuLFmeIbSyWckWj3hsx6lLPOCFp7UTjUn6qq35YDd4evcBHSGVE0UNLf5TYfeaeklvde81dCdfQsAYPEr6OTR/Cb6eQpnPFNC1zvUkqSkrBQLqFmFALilFNkeuu3h8VRaF4gzF/hxXRR3+MhQRKLGhNe3R2GdV6MNT+pm9ievNZZR6Yd7qsjDZ5ZQZY0vl2Yv40hO8N7TPHy0d3fEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnZjx5wyPP3o8YwyK/kvZqix0T4Ac0UZ5dpsNMO9/KU=;
 b=xcDkb9UThi3h5dCyAGnuiQYMVMteZr8UYdmL8ZQz/JIDXhvjTD7BKGLwXn59kA6cayGFHxLzOG/3/+j3fdJyv29Ubs9/ImYCkdQ3b1zk1gnYtL1ZV4jD613dQuqj7ODcSDhZPofeMRoNb/m+KUWip1btS4XRa7dwzALhbjgYAIM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <262d66a0-972d-46e1-80cb-13d29866b874@amd.com>
Date: Mon, 20 Apr 2026 18:55:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] tools/xenstored: expand special watch handling with
 depth feature
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-8-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260313074751.2904215-8-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|SA0PR12MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: 891ccf73-c908-48af-b7f6-08de9f37abc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	C8TvHD1NDbdHKNxumQSXNZr74laywmpoQEKgqT5fN+lkJ1yy2rti1CMV+itsgY3+huMTkHZ+bXJJ1434XgMUTqUjLtsqZdR/hz9YyzewpuW2xjdbIFF+P4+mgNNgnzOfD+sf5c6OxVUHAdCLHO4jxjNIVnxqC3l0XzDQ2DQfypWFvTeOWy0yKYYS6YRvAEpsPYWKb2aNZKjxCURCROkliMhIk4Qv4CsmXUrkkaKxRsAMyP1bm9BjnAkVnNXc74HPUoITymD2aKEViDso8+axoNYySeEKwOyPo10V5l8CN6t4USh3xF8gjKKFIH8e8LaRcdSvOB1yDOCDncrvhzSlndt/FtVfv70Oqmb7rvKVwN7tF99w7/2l/Tz7gG/bEQfCtwonw3+ItG/NkGZUpkecjhj47FGYu6xQ8O7Vm+5J8+ItLm7rsSlpnjG4CrdciyEYVzDqHRW+AlzpMo0SF9EeFgnLzHx5luoDHehJFSnSzwXMyaMPv/nY1Uhcr1dXVC6TteFnsTgvk25RPxUnTA50ytaePxxhpxbhOK/U3vNCo+B1asV9bEl8VqUWHj8PhAiWJgoAwVGT+ufbZ7DOoevQAWg6Ya+iDRFASbG/ftcO7gzTSZ3JkTl4tDWsGKgAu37CWtB5Ihpy7tqjhv/EUHhK81blgjmHpjixTME/bJfqylJ9FFQVcgSytgGe9EOlhAT0cLe7pVuVsATcDY6kHYFPhVrrrrDpGmm+nC1KAWCV/NZ+z+OQwdxG0ucPd6NUrUeuB85SAlosXxs/p1gjhjXong==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+AhnAyaSZVWPdmLfTYSFKr1envXMAVmgaVGLqPZQKRFG/Iuk4FPhFrmIDP2GZpkmlLApfwAW8sClSb7KdwV9PCHVsK3cCb69G0utmMdBlT1/FdBtLLc+IOrEfOSNePLgXh7QBWGXny0RxnxwbgpuqTyP/Scuc6vPoJj38zC9broWwCqFupXtBESgS6uZMsHCcmbfcpsC0Th6Xfczxxy411aMTJzog2c9NrEtU4v6DkvYPRSG/3WrPTynO+o/EUbYwGo270XGobJJ08t5qTbksuYKWJODYLD/am2tWVUDb4NA0+RBFM99m5keeLYTxV/mZyCRVnkblMbCQQdg0YeNcaVxO8i4GRfHlSdLGMbdUfHl1H90POFXMrU+WFjw6XeXfIlBlcur4sAPmiceekhjtwdRDmeaDEkYXFagQaNJPbCNziebSrJ/8RwKmLIJAQhy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 23:50:58.6438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 891ccf73-c908-48af-b7f6-08de9f37abc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
X-purgate-ID: tlsNG-42698a/1776729067-7F57BF3B-D7E2B85F/0/0
X-purgate-type: clean
X-purgate-size: 999
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7563F434F92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 03:47, Juergen Gross wrote:
> With XENSTORE_SERVER_FEATURE_WATCHDEPTH available, special watch
> handling needs to be extended:
> 
> - when a special watch is set with depth = 1, the domid is added to
>    the watch event
> 
> - it is possible to watch for @releaseDomain/<domid>
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

> @@ -678,10 +693,13 @@ static int do_check_domain(struct domain *domain, bool *notify,
>   		if ((state & XENMANAGE_GETDOMSTATE_STATE_SHUTDOWN)
>   		    && !domain->shutdown) {
>   			domain->shutdown = true;
> +			fire_special_watches("@releaseDomain", domain->domid,
> +					     WATCH_DOM);
>   			*notify = true;
>   		}
> -		if (!(state & XENMANAGE_GETDOMSTATE_STATE_DEAD))
> +		if (!(state & XENMANAGE_GETDOMSTATE_STATE_DEAD)) {
>   			return 0;
> +		}

Stray  {} addition?

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

>   	}
>   	if (domain->conn) {
>   		/* domain is a talloc child of domain->conn. */

