Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFVMHjgQjmkM/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 18:39:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724C12FFE4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 18:39:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229680.1535535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqadf-0004o0-HR; Thu, 12 Feb 2026 17:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229680.1535535; Thu, 12 Feb 2026 17:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqadf-0004lz-Dm; Thu, 12 Feb 2026 17:38:03 +0000
Received: by outflank-mailman (input) for mailman id 1229680;
 Thu, 12 Feb 2026 17:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZje=AQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vqadd-0004lt-Jj
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 17:38:01 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 926097dc-0839-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 18:37:59 +0100 (CET)
Received: from SN6PR04CA0100.namprd04.prod.outlook.com (2603:10b6:805:f2::41)
 by SJ2PR12MB9113.namprd12.prod.outlook.com (2603:10b6:a03:560::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 17:37:37 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:805:f2:cafe::89) by SN6PR04CA0100.outlook.office365.com
 (2603:10b6:805:f2::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 17:37:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 17:37:36 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 11:37:36 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 11:37:35 -0600
Received: from [10.71.192.120] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 12 Feb 2026 11:37:34 -0600
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
X-Inumbo-ID: 926097dc-0839-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCoBXoRzwZzxL2CLKKwGuFmOamj8H7L1dqvKe3XOG+T/g+juqk+8qUo1YdAGydZ/nbEpmj1DWxcMUVUK89aZSL1+9iTlYiI9frUVMaOrt6NrF1wIr+NUirwgAO/axjfTO2rE0nntftbl4kZxpXTpgWctYcukL4SxUD+cCOXAAxk8E8AR9GEiB9ZCJee9gU7k/IJ2i0mQ5Cm23VqO+UXLqIInJ4oIwLhMLtkjSNB/tNu86rklJlKLK8JNFaDrY0ObGDPYUqNF79CHoa08jc/xgbKl2+C3Uv8waZH7cfn3bv59hUW1/UuprTjWcDGChKovTavwj/qQsv7mQSgRtvIR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t6XMCdTR5iZ3qYPmxu3R/vEW9YqOPPKcBp/9qLY1nQ=;
 b=lk93FnIebtYjJOlzFG8rfSELI8qc8SwWOLwydCQF0hYKxdfVg1up75aZG6sV1BvR+3VhP4eSC4q8Y/utnoiPpcCWpeB7mhxuXeBtyFmsPprtksglVix7VaV7hLQPkbRi09fE0jC7osmxn489X9mG+Y2fWuPIkHJNzqEimNwihtcMUWB8Xl9SAXaOv6FfPw9yy7fVZNGtmjYj99fjZ10lTKR+Zj2rMnep6HqTP1H0Z0tHBG6CrigVdjpcFnAxXQnsnvb/FTDUGrqd+zqWm1idBFj2GXMDA/PnA40d7sI2DZrwhKZJ0kzWqBtVBfEIOTkTiPh0Fc+UFoNhWDWQ9ydUzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t6XMCdTR5iZ3qYPmxu3R/vEW9YqOPPKcBp/9qLY1nQ=;
 b=v/6P45kmTqcal6+yNtcZR06vIffq28TopY85uAtDOLyMQk+WIzMHnYrTHCDEp9y7PVhNaP1EDeEOxg+KjQD0gapmW81iqIvqYSqPMTqh0VpGrprW/u+wlrHXQW7zJVL04yUhllo1LitRSY5/VWrgeNa2WQjPjO89A2Y+rLpOmgM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <49fd6b8c-5a6e-4914-a3e4-80ede233ac93@amd.com>
Date: Thu, 12 Feb 2026 17:37:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm/mpu: implement setup_virt_paging for MPU system
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Wei Chen"
	<wei.chen@arm.com>, Hari Limaye <hari.limaye@arm.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-2-harry.ramsey@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260206090155.68466-2-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SJ2PR12MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e1b4cd6-94b9-4d51-2c79-08de6a5d697e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWxhSDI2V3VxemlNK3VaWVZlWlVSNXFpNThZcnBPSDhDb0FvR2pQZEZKTUpI?=
 =?utf-8?B?OGU3UUpqR1FYZGJkbzY5OXZoMVBNMWs4ZzdvWkRSSTJ0eVJuNC9haEJNYTBl?=
 =?utf-8?B?UjlLVTVVT3FGZVhrb25reS8xbXk4czhITnFabmZLaFc2MGp2M0E1Uk83c3Bo?=
 =?utf-8?B?SEt3VldOcXlmZ2NkRmpMZDVlM1VKemdXNk44dWxOZUY1b1NZOWNQWE1NamJW?=
 =?utf-8?B?UVFtbDZob0lXWlJIVHFIcWtEcTdvdDdpUFdCcm4yVDR1a2Y1cko4a3grSDdt?=
 =?utf-8?B?UEJQVVBySmFhMXF0YnZQdVRMazJpT1dKZ3pLSnNqNm1ZVFFRUjhLcmdsdXNM?=
 =?utf-8?B?WlpRZVFtdE5IUjBCS29HVGpMZGh3bFFLdjA2ellLK3VGUm1QY1dzcStaenNt?=
 =?utf-8?B?VVVpS0x2VnlobHpRQ0FMMTlFWTN2NjB3b2Y3V3VoNE5uMHhxeW1QOHZmRG52?=
 =?utf-8?B?d0V2dEF4M3ovcXI0dU8zSCtQT0FybkQwMyt2MzlkQitoNno0WWZ3Z0ZGeWNa?=
 =?utf-8?B?b0FISTZPamZtR2hkT250WE5nR3ZFeEE5OEtCbFVWRVJZZnZtRzZHZDZuNHB5?=
 =?utf-8?B?MXIreTlyUG1VUGNCREYrZkVuQzB3a3hodk9CM1FSWldNam5MUU52SEtCOTJR?=
 =?utf-8?B?Y3J0SWJxdFcwWjB3azlQODFjTldpSjhXUk5mZjRNT2x1WDRUZlZOQ2FjVzBy?=
 =?utf-8?B?SkZGc0dxYmpFcTFkOHNPT1I0S05hOGt3RmtxZVFpMVFVT2ZMOTIyNWxKRWxp?=
 =?utf-8?B?UDhEeGtEbzlocXloeU9SWFQrNElIQ2RieTU0bE8vYi96TWN6cldMYTlwSVJ6?=
 =?utf-8?B?Vnk3dTRQaVFud0xWWm1DS3NWOVhPY3VVRlVVQU9Id3lDTlgvUXVMZ3BxVkdB?=
 =?utf-8?B?b2I2UUtOaElGYlI2WDlvRzNOSFJ6SmNSZWlYQ3VISEhGSDhJOUIwTjBkTzNt?=
 =?utf-8?B?dTh4c25BRHovRWk2TGJHcGJXMHdvVE95bWw5VWRwOVg1eVJlOThrdzdkUmd2?=
 =?utf-8?B?N05neUNVZm54ZXNtZU9jR3g0ZXU0NDRpd2NMRit0Q0JHdmFSWU1kc0VFOFRQ?=
 =?utf-8?B?NExnRUJkYklsL3dNRE1oUHFXeDVFbkpEOUU0b0pLRWtnWHFOanp5QVd5Q2Er?=
 =?utf-8?B?RHFmSnliUCs4WHliQm5pTTR2bjVQN3hWTUFsMWdPbTA3bmZqMmtydzhTa2Rw?=
 =?utf-8?B?TE1vUkNxYU5rZlh1L1M2am56ZlNWWXo1UFo0RjExVEJZZTN4S2dDTDNRVCta?=
 =?utf-8?B?RkowS2p3cCtmdmdSeUNoR29FY3lTQ1M3czRNaGs1aFM5TmxIK3RyckV4L3Vy?=
 =?utf-8?B?QVVPWFhrSnJDRVk3R1ZBMkgyZWtBV3JYdDNpa3N2eDlRVjNlTGpZeFlwcHdJ?=
 =?utf-8?B?M0dOM3k4ZjJoQ3lBeUFmZ3k3Uy9ia3IvV2pDSkNLaFlpR0dKK3liWkJlT0lG?=
 =?utf-8?B?dzl2SFpyZnlaVTh1NVN3TlJOTTdraldkWFh4OXFuSHppM2l4MnJ1M0swK0o0?=
 =?utf-8?B?eU9QUEVNYjlyYTZNNkFNWHFiZGNyWFJMcCttakNTWW10eXlycm5ySHFBcCtv?=
 =?utf-8?B?U05nQ1dpVkFIR2J2djd0ckpkTEd0YS9uVlVwZG9lUStQOWxrZ0dzQzJkdzYr?=
 =?utf-8?B?aFlmb0FaZWtUODFkdDBybmFWeVVVdkphNUM1VnM2RWd1NzF4bWRSVzFZb3VE?=
 =?utf-8?B?d2JmUVltWFVESytWeGVPSW9QaXNzRzkzLzI5cVJnd29Ydis3ck9LQjVOWUp1?=
 =?utf-8?B?OHFyT0ZBWUZuaXJ0aFhkRTVoWW1Cdnd2K3ZNaDUvK3BaUCtjVDA4YXp0Z2RS?=
 =?utf-8?B?Qnl5WW0vY2dxM2hhOXhhL0xuTU9KSWNkZW43SGVrTWJPM3F0S1R6TlFhMmt4?=
 =?utf-8?B?UlpYMHE4dWJMeFF6UEptWUJUY1JLdmx2SzZtYjdEa3FJU1lLWmVGRUk2a2ZJ?=
 =?utf-8?B?NG54LzU4bWlkM3QrclFHMTVIQmsrWkJ4eXptODBEMWQzOUtyMXdYekt0UDhy?=
 =?utf-8?B?Y00zQlNxdld3andZdEZId082d0VRMjRVUVlZL1JmdzVvM3VnSkdmTjg3V0do?=
 =?utf-8?B?aUJOaitNaXMzOG1US2F3dHhvZTNvSmJIN3c0eHlYb1YyVmxDVEliSVE1MitV?=
 =?utf-8?B?dmtyVTdhS280WTNMdUhZQzViOWRjQ3ZiUS9vTVdWZzFpV2dMS3BmQVNZVDhM?=
 =?utf-8?B?aFVEVW11b0lzMnA5UGprQWhVQVlGK3huazk3akpHYUVKZnJ6cWhHaVFXTlBV?=
 =?utf-8?B?OXZyMXdHYi81WTVuUmN1LzNXN1JRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QfTJAdHi8+M6pBWDCw3obvzUMO9N3d9w4QnCTfwqV80+42Cdt9Gh/WGg5wGLmISASV0SAwPWoJlmgdhsEMeLRJQlFxlgVr9ow4VictWUJxo6iTHZ1j2RQ7Iu3QB+KlGcgbzu89oJglmYUwXzfoe6A6c+gOuluPn3aa6iDO48/K6iPFlQz41ZW/J0ZWc/k9ib9TkcK/GsmqQpruG6S810aDICPUYEJsUITF8cE1Ps+8hD48rehCyw/atZtknoMDAgWK2hM3CWFZaNqMihKxr3bKFSNFX3NZGmomv+KMUL60b6iRuX/XWeD+BSQKjG/frdmtOOlL3DgGDrWukRTropEMdIkkpP3Vp9wr7NACff23XJ8XjFhdLlyspLKE0oEnTC0pmduKPBhwXrWxsEcWdi7k/7DBwNXl29vbqenf1vIFfjmmkipqmtXHJV/e+hs8rj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 17:37:36.6814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1b4cd6-94b9-4d51-2c79-08de6a5d697e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9113
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	URIBL_MULTI_FAIL(0.00)[vstcr_el2.sc:server fail,arm.com:server fail,amd.com:server fail,aarch64-vstcr_el2.sa:server fail,lists.xenproject.org:server fail,vstcr_el2.sa:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harry.ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,aarch64-vstcr_el2.sa:url,arm.com:url,arm.com:email]
X-Rspamd-Queue-Id: 9724C12FFE4
X-Rspamd-Action: no action

Hi Harry,

On 06/02/2026 09:01, Harry Ramsey wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> For MMU system, setup_virt_paging is used to configure stage 2 address
> translation regime, like IPA bits, VMID allocator set up, etc.
> Some could be inherited in MPU system, like VMID allocator set up, etc.
>
> For MPU system, we could have the following memory translation regime:
> - PMSAv8-64 at both EL1/EL0 and EL2 (default)
> - VMSAv8-64 at EL1/EL0 and PMSAv8-64 at EL2 (enabled with device tree
>    proprty v8r_el1_msa)
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>   xen/arch/arm/arm64/mpu/p2m.c             | 67 +++++++++++++++++++++++-
>   xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
>   xen/arch/arm/include/asm/cpufeature.h    | 13 +++--
>   xen/arch/arm/include/asm/mpu/p2m.h       | 12 +++++
>   xen/arch/arm/include/asm/p2m.h           |  5 ++
>   xen/arch/arm/include/asm/processor.h     | 11 ++++
>   6 files changed, 108 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
> index b6d8b2777b..da8f0553c1 100644
> --- a/xen/arch/arm/arm64/mpu/p2m.c
> +++ b/xen/arch/arm/arm64/mpu/p2m.c
> @@ -2,11 +2,76 @@
>   
>   #include <xen/bug.h>
>   #include <xen/init.h>
> +#include <xen/warning.h>
>   #include <asm/p2m.h>
>   
>   void __init setup_virt_paging(void)
>   {
> -    BUG_ON("unimplemented");
> +    uint64_t vtcr_el2 = READ_SYSREG(VTCR_EL2),

I think this register is redefined for R82 . See

https://developer.arm.com/documentation/102670/0301/AArch64-registers/AArch64-register-descriptions/AArch64-Generic-System-control-register-description/VTCR-EL2--Virtualization-Translation-Control-Register?lang=en . 
So

>   vstcr_el2 = READ_SYSREG(VSTCR_EL2);
> +
> +    /* PA size */
> +    const unsigned int pa_range_info[] = {32, 36, 40, 42, 44, 48, 52, 0,
> +                                          /* Invalid */};
> +
> +    /*
> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
> +     * with IPA bits == PA bits, compare against "pabits".
> +     */
> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
> +        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
> +
> +    /*
> +     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translation output
> +     * address space to access the Secure PA space as Armv8r only implements
> +     * secure state.
> +     */
> +    vtcr_el2 &= ~VTCR_NSA;

But the TRM says this

This bit behaves as 1 for all purposes other than reading back the value 
of the bit when the value of AArch64-VSTCR_EL2.SA is 1.

So shouldn't we keep it as 1.

> +
> +    /*
> +     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register identify the
> +     * memory system configurations supported. In Armv8-R AArch64, the
> +     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
> +     */
> +    if ( system_cpuinfo.mm64.msa != MM64_MSA_PMSA_SUPPORT )
> +        goto fault;
> +
> +    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b0010. */
> +    if ( system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_NONE_SUPPORT )
> +        goto fault;
> +
> +    /*
> +     * cpuinfo sanitization makes sure we support 16bits VMID only if all cores
> +     * are supporting it.
> +     */
> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
> +        max_vmid = MAX_VMID_16_BIT;
> +
> +    /* Set the VS bit only if 16 bit VMID is supported. */
> +    if ( max_vmid == MAX_VMID_16_BIT )
> +        vtcr_el2 |= VTCR_VS;
this field does not exist.
> +
> +    p2m_vmid_allocator_init();
> +
> +    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
> +
> +    /*
> +     * VSTCR_EL2.SA defines secure stage 2 translation output address space.
> +     * To make sure that all stage 2 translations for the Secure PA space access
> +     * the Secure PA space, we keep SA bit as 0.
> +     *
> +     * VSTCR_EL2.SC is NS check enable bit. To make sure that Stage 2 NS
> +     * configuration is checked against stage 1 NS configuration in EL1&0
> +     * translation regime for the given address, and generates a fault if they
> +     * are different, we set SC bit 1.
> +     */
> +    vstcr_el2 &= ~VSTCR_EL2_SA;
> +    vstcr_el2 |= VSTCR_EL2_SC;
> +    WRITE_SYSREG(vstcr_el2, VSTCR_EL2);
> +
> +    return;
> +
> + fault:
> +    panic("Hardware with no PMSAv8-64 support in any translation regime\n");
>   }
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 19d409d3eb..a4b6eef181 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -462,6 +462,10 @@
>   #define ZCR_ELx_LEN_SIZE             9
>   #define ZCR_ELx_LEN_MASK             0x1ff
>   
> +/* Virtualization Secure Translation Control Register */
> +#define VSTCR_EL2_SA                 (_AC(0x1,UL)<<30)
> +#define VSTCR_EL2_SC                 (_AC(0x1,UL)<<20)
> +
>   #ifdef CONFIG_MPU
>   /*
>    * The Armv8-R AArch64 architecture always executes code in Secure
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index 13353c8e1a..bf902a3970 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -248,6 +248,12 @@ struct cpuinfo_arm {
>               unsigned long tgranule_16K:4;
>               unsigned long tgranule_64K:4;
>               unsigned long tgranule_4K:4;
> +#ifdef CONFIG_MPU
> +            unsigned long __res0:16;
> +            unsigned long msa:4;
> +            unsigned long msa_frac:4;
> +            unsigned long __res1:8;
> +#else
>               unsigned long tgranule_16k_2:4;
>               unsigned long tgranule_64k_2:4;
>               unsigned long tgranule_4k_2:4;
> @@ -255,6 +261,7 @@ struct cpuinfo_arm {
>               unsigned long __res0:8;
>               unsigned long fgt:4;
>               unsigned long ecv:4;
> +#endif
>   
>               /* MMFR1 */
>               unsigned long hafdbs:4;
> @@ -267,13 +274,13 @@ struct cpuinfo_arm {
>               unsigned long xnx:4;
>               unsigned long twed:4;
>               unsigned long ets:4;
> -            unsigned long __res1:4;
> +            unsigned long __res2:4;
>               unsigned long afp:4;
> -            unsigned long __res2:12;
> +            unsigned long __res3:12;
>               unsigned long ecbhb:4;
>   
>               /* MMFR2 */
> -            unsigned long __res3:64;
> +            unsigned long __res4:64;
>           };
>       } mm64;
>   
> diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
> index e46d9e757a..d165585d4e 100644
> --- a/xen/arch/arm/include/asm/mpu/p2m.h
> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
> @@ -5,6 +5,18 @@
>   
>   struct p2m_domain;
>   
> +/*
> + * The architecture allows at most 255 EL2 MPU memory regions. The size of the
> + * MPU structure entry (pr_t) is 32 Bytes on AArch64 (requiring two 4KB pages)
> + * and 16 bytes on AArch32 (requiring one 4KB page).
> + */
> +#ifdef CONFIG_ARM_64
> +#define P2M_ROOT_ORDER 1
> +#else
> +#define P2M_ROOT_ORDER 0
> +#endif
> +
> +/* Not used on MPU system */
>   static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
>   
>   static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 010ce8c9eb..ed1b6dd40f 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -48,8 +48,13 @@ struct p2m_domain {
>       /* Current VMID in use */
>       uint16_t vmid;
>   
> +#ifdef CONFIG_MMU
>       /* Current Translation Table Base Register for the p2m */
>       uint64_t vttbr;
> +#else
> +    /* Current Virtualization System Control Register for the p2m */
> +    register_t vsctlr;
This exist only for Arm64 MPU. Should we enclose this in ARM_64  ?
> +#endif
>   
>       /* Highest guest frame that's ever been mapped in the p2m */
>       gfn_t max_mapped_gfn;
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 1a48c9ff3b..7344aa094b 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -403,6 +403,10 @@
>   
>   #define VTCR_RES1       (_AC(1,UL)<<31)
>   
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +#define VTCR_NSA        (_AC(0x1,UL)<<30)
> +#endif
> +
>   /* HCPTR Hyp. Coprocessor Trap Register */
>   #define HCPTR_TAM       ((_AC(1,U)<<30))
>   #define HCPTR_TTA       ((_AC(1,U)<<20))        /* Trap trace registers */
> @@ -464,6 +468,13 @@
>   #define MM64_VMID_16_BITS_SUPPORT   0x2
>   #endif
>   
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +#define MM64_MSA_PMSA_SUPPORT       0xf
> +#define MM64_MSA_FRAC_NONE_SUPPORT  0x0
> +#define MM64_MSA_FRAC_PMSA_SUPPORT  0x1
> +#define MM64_MSA_FRAC_VMSA_SUPPORT  0x2
> +#endif
> +
>   #ifndef __ASSEMBLER__
>   
>   extern register_t __cpu_logical_map[];

Rest LGTM

- Ayan


