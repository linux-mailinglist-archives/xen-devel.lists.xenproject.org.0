Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFAmAGUVjmmZ/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 19:01:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2AF1301F1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 19:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229720.1535565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqazl-0001Lt-TJ; Thu, 12 Feb 2026 18:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229720.1535565; Thu, 12 Feb 2026 18:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqazl-0001KS-QB; Thu, 12 Feb 2026 18:00:53 +0000
Received: by outflank-mailman (input) for mailman id 1229720;
 Thu, 12 Feb 2026 18:00:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZje=AQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vqazk-0001KM-Mv
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 18:00:52 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c129ac7c-083c-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 19:00:47 +0100 (CET)
Received: from BN1PR14CA0014.namprd14.prod.outlook.com (2603:10b6:408:e3::19)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:00:38 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::36) by BN1PR14CA0014.outlook.office365.com
 (2603:10b6:408:e3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Thu,
 12 Feb 2026 18:00:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Thu, 12 Feb 2026 18:00:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 12:00:36 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 12:00:36 -0600
Received: from [10.71.192.120] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 12 Feb 2026 12:00:35 -0600
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
X-Inumbo-ID: c129ac7c-083c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKoCr/DnsFUmBGy1dJA45l8MGpmcs7yxnTvaRmiKdOQdo0PV2lVB5WbgIs1hUWZsiwh/UoSU1IakZXE0zrrBocpB1OwldnjEZJbZZh3YGxyAHi3MnslRmtgT4hiZlG+TOTpgEeturuIbbrYndBeP5sWT5/PHLWFVd/3IwLXI21g7oCO2o95Vqxc2u7Yr8EYcBV7co0Yeul+asNBsweknPIDDoddsZd6pD/kEiG40xBcLX0gCyc4QlqX4y+YAMiHoYUdZ1e7WdC0ZSbZneyTVrSeoCzXQK5WokYUAyOKZk2YxKaD42k1C6LAAbnQ9LRQ9EZh26pFS9sVc9ZKCwbbT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCQGq7fHnJ0PSyP4nuF7erMJjxZuAxfPNw4GKvaiNT0=;
 b=liuVQ2O9ylcO91FbRs4JKJdqkSPF1m+VezcNL9rZLR2ydRyMuXXt+X5O3/tvzcDd0SVXY0aR1qacxx6WgkHVXqYwYygrQKnrXFKGJ2DUl/lGSUUnmP4c2LmVnK2r2j87P8bxvfypkkng7u+946enCxU8KMhGjQAOnwghEGcxGa+JF0hyacpTMJ02nmabkWTZUSOd+tkJOZX0+gjdySt/Weknaz2v87OLVeh+FRT5HhEFTyNndesNMxRYyFOb7EHQ3L2rcX5bLNde2HEP+WD41e/laBGgr5QRFSjqL8qJKJFLOLA6BdXie2SmecqKvqdQM4k6INk0f9VJET2TotxKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCQGq7fHnJ0PSyP4nuF7erMJjxZuAxfPNw4GKvaiNT0=;
 b=M/w0Ra54kvwJhx8rKfv+BebVLNvO/WXzKvlVdN34PMjVib0k8V/MH/z79DL6kkkc1UB/zY+gAmXml+BKn8iOaL8mCj2Fibv7bjUYd94x0dXeOKMzJ9Gm0F0NRkQ913Bg2RFknhlZnt9Duq8NQW2dbNrmJ1FLboO8A+4sLfHMwNE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a5318e5e-3082-4cd4-96cb-98d8dc27ae65@amd.com>
Date: Thu, 12 Feb 2026 18:00:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree property
 for domains
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-3-harry.ramsey@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260206090155.68466-3-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3ccb43-7b96-489b-51fb-08de6a60a061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXdBRXZpbXF4dk0vK1NFSVFFd3dOL1dIeUF0QzRic05CUU1OYit0clNUQW9a?=
 =?utf-8?B?Y0JFMDAzRW1DRkhPM3hlNU8vOXdMRmRON0RmUE1obnNCSjFzQ1RrSHR5amR4?=
 =?utf-8?B?YkpSRU44cFRkMXRFT1c4NWc5TnZTdlFqM1VXNlk4YXZXMjVOdzBWeS83cnY4?=
 =?utf-8?B?MWkrSnQxajFONnVSRzlyMi81WHJHZDRvQXhGTG5xZmUydy9UcWdVRTVJTEVY?=
 =?utf-8?B?RVhrUjY1RzJxdFdIK0M5WEUveGFqd1MxUHBKWHBZaVgzY1Y3dzZaVndBMG80?=
 =?utf-8?B?alVyRmR5ZWZINEk5MGFnK28zTjJRRkdvT0pnc1FRV0dheUJKcXVVc0FvWHhj?=
 =?utf-8?B?MXF6YnJuZktkOUVlcTVnaldnY0F4NVV0dis3WjdpZ2V3blNYR1BYNmF3SG91?=
 =?utf-8?B?azh4NFA5T3NVcHQ2M1dYaWRLeEhaZW9xZHE0b1RUMmtjL2k0L3Vib1hNT09E?=
 =?utf-8?B?MFNvWmk0dUlMLzJzZ1lVSlc4eTI2MERNa2JENUFGeExqMjdLMVVtcllCRVFU?=
 =?utf-8?B?UFFsaG5QMEJRR0F2VmowN0prSzRuNndLaFZXR1Z5WWE0azdYelVvSTBpSGlw?=
 =?utf-8?B?elJXMGhSbkR3MnpUbWdYU1pXWjhDWndzMEE0aFNtcVFFMmtNWEozMk84N0g2?=
 =?utf-8?B?azVnZUdwaVU4aG5LNEhvWndub1gySVhoNUVoU1JjMTM0VTAwUjR5VytZZkll?=
 =?utf-8?B?U2xYOGEreElZMzc4dmRDQVZBK1haUGdZM0tFcTZFUkM3Nzl6bzYyY1BXMkRJ?=
 =?utf-8?B?NDRlQUtFM2JyVEFFck5qbVZ2aG1qR3d0NDJiWFpGR1dlSXZ6bWw3dXBpQW9o?=
 =?utf-8?B?TVRQSVZ3VGQvTnZaQ1lSM09ZMXhML2h3VGF6TVhPMG9ORUpIamprVHlTYk9W?=
 =?utf-8?B?Z000YmpvazZzZXp6bXBkanZwdWxFSVBKMExENFExK3F4VlVaUHRDRTIrNCtx?=
 =?utf-8?B?L2RhZE1FSmV1K2dVbmdLQng1TWZaa1lzSWI3SU4rbWVrS3lMN3IvbW5lNGRU?=
 =?utf-8?B?RUJzUXZ1Qi9CTExWekJqQ1BBVG1tU1ArZTNnU1pKSlNrWXk3ci9oV2xuSWZK?=
 =?utf-8?B?dllwZ1g0ZzNnSXFnTlNvU3BERFAwSDBQZzBXRDBQWVFaTkhBRHRPNmd4djVI?=
 =?utf-8?B?emNYQlF1K2FscVdsNUNuSlluekd1YWs1a2p5NEllVkJxZjNzQk9xNTM4b2lY?=
 =?utf-8?B?QUw4aHBESnZ5eDRZeEFaSVVSd0JQaDNhbEFrd0NKNWU0VnAxbG1OaGZDNUZG?=
 =?utf-8?B?TjlGcmozQUJSSmFpQ0hFT2xOMTllTHp2dm1MY3ZxWms4ZmF2YjltN3JVOXZG?=
 =?utf-8?B?dVVwcnoxaW5mdjlPQ3VkRDQ0dkpzRmJteC83WVlKa01waWNhN2hmQ2NlVjRJ?=
 =?utf-8?B?akRTbHJ3TmJsTDlrL3VhZmU4ekhXWEsrcmlyS2J1TWRjSXd3R3BkMDNiY1h0?=
 =?utf-8?B?OUxMZDl5VGJ4SWY3Tk8xM09VZGFRaWpUTDJWSGx2Z2E4bnM3OWVicmhISXp2?=
 =?utf-8?B?azhGcGlEWTM1amt6R280MEdqbm50bWRiSnVoenViUmNBSDhTR1MwcDR3NVRG?=
 =?utf-8?B?dDZBSnhJZkIyVFpxdENDV2puTDI4L1ExK0g2VHh6dmxoM3VYZmR4eUJmMnhz?=
 =?utf-8?B?QmpseUZSSVRyRkplak5MYlo0ZU9kVzNiZldlZkpMR3VZSHlvRnpkZmxiTHlU?=
 =?utf-8?B?ZEU3VHpIQ3prMXJ1eXpyUTJCMkhGR3VZVGUwQUU0ZnVqMnNqZnI4MnRhNVZV?=
 =?utf-8?B?YkxBT25xN2pWNVNmVFNkdXFDemNkVlNtU1pXTjdXV0VQeUtabkZqOHJaUkQv?=
 =?utf-8?B?TE8zSFNRRHFMMFdNZDlrVHhMVGRmbUVuVHhQYk0vMUtHZ1llS25VNEFmQmpJ?=
 =?utf-8?B?VElRc1ZSbmxtK040N3BxSm9yZDlIV1psL2RNdno4clU5NGV3b1hENWdoK3NH?=
 =?utf-8?B?MDUwVitpUk50M2x0bzBXMVpGU3hlL1NzeVdqWnhGMG5uWUxVMExpNlhiWlB0?=
 =?utf-8?B?ZWp6MHlSOFp6SkczNG1zd1JQVnZDT3ZXb0oxM2FOOEtMdlNLSDNTL005Y2pX?=
 =?utf-8?B?bWdydkNqTlgrY0xSUjIxR1EydGRZL1FuRzh2REMzcDJFUTlOSUx5bHptZ2Qr?=
 =?utf-8?B?WEJsbnhYR3Nhc0VtTHdTWjNodTJPaHF6V0dmVGxhWGlsUmJyWTZaUUw2QnNp?=
 =?utf-8?B?SWUzajEvMWREU3FBSlBjaGQ0eFRDUWlSL0R5cHl4VW43SFJHM2pOUnc1S2dR?=
 =?utf-8?B?alBvMGZKdVR1QlFkOXFaaVd5YXF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QuS2B44L4oQFQZbkTryBnQIE15l99Of9mtOwfdO93GPo1tGCJfkVEpGgxnHfi7aPCXO8KbCB772fbiHoKOAqZb+1iTpmMZ6gY79GACA6AWapfcrEJT7edr260xMfL8J3w5gk5Sol0bvbCOROFLcDBL4OG160FJdX/WOuAsZVXV3F/j4PUeqrsKsIyLkCp38uHWhoO2yMXivEA5OnfHdCN5pK7a/YpCwEVugLXKi5KyVLlWX9cli7cyJqkGldGiVUQMkYTMsmqomiCWGq8t/0xpNCdlcuLajfIZepoYlksYZ27R+dEVREWtaI18IHhsrjzcyzI3nej5DaSeGssRK4JZeJOGdf6R4pRwHDE+TukqeecibWWNNJafcYDUWam4hibiblYICbslmyAFq8WF3bYRAAVjflHzu81EAyuUYltJG9TjZ6eUwgz9Y7G+/7Bo44
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:00:37.2913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3ccb43-7b96-489b-51fb-08de6a60a061
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:harry.ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email]
X-Rspamd-Queue-Id: 2E2AF1301F1
X-Rspamd-Action: no action

Hi Harry,

Just a suggestion. Please feel free to disagree.

On 06/02/2026 09:01, Harry Ramsey wrote:
> Add a new device tree property `v8r_el1_msa` to enable/disable the
> PMSAv8-64 translation regime at EL1.
>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>   docs/misc/arm/device-tree/booting.txt | 11 +++++++++++
>   xen/arch/arm/dom0less-build.c         | 25 +++++++++++++++++++++++++
>   xen/arch/arm/domain.c                 | 16 ++++++++++++++++
>   xen/arch/arm/include/asm/domain.h     |  9 +++++++++
>   xen/include/public/arch-arm.h         |  4 ++++
>   5 files changed, 65 insertions(+)
>
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 977b428608..431d285b6e 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -322,6 +322,17 @@ with the following properties:
>       Should be used together with scmi-smc-passthrough Xen command line
>       option.
>   
> +- v8r_el1_msa
> +
> +    A string property specifying whether, on Armv8-R aarch64 systems, a domain
> +    should use PMSAv8-64 (MPU) at EL1 or VMSAv8-64 (MMU) at EL1.
> +
> +    - "mmu"
> +    Enables VMSAv8-64 at EL1.
> +
> +    - "mpu"
> +    Enables PMSAv8-64 at EL1.
We can reuse this property for arm32 although there is no mmu. This may 
help to keep the code common between arm64 and arm32 for v8-R. So, the 
changes I suggest are
> +
>   Under the "xen,domain" compatible node, one or more sub-nodes are present
>   for the DomU kernel and ramdisk.
>   
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 4181c10538..41f538fb50 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -315,6 +315,7 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>       struct xen_domctl_createdomain *d_cfg = &bd->create_cfg;
>       unsigned int flags = bd->create_flags;
>       uint32_t val;
> +    const char *v8r_el1_msa;
>   
>       d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>       d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
> @@ -322,6 +323,30 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>       if ( domu_dt_sci_parse(node, d_cfg) )
>           panic("Error getting SCI configuration\n");
>   
> +    if (!dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa))
> +    {
> +#if defined(CONFIG_MPU)
#if
> defined(CONFIG_ARM_64)
> +        if ( !strcmp(v8r_el1_msa, "mmu") )
> +        {
> +            if ( system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT )
> +                panic("Platform does not support VMSA at EL1 (v8r_el1_msa)\n");
> +            d_cfg->arch.v8r_el1_msa = MPU_EL1_VMSA;
> +        }
#endif
> +        else if ( !strcmp(v8r_el1_msa, "mpu") )
if ( !strcmp( ....
> +        {
> +            d_cfg->arch.v8r_el1_msa = MPU_EL1_PMSA;
> +            if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
> +                panic("PMSA is not valid for domain without static allocation"
> +                      " and direct map (v8r_el1_msa)\n");
> +        }
> +        else
> +            panic("Invalid device tree option for v8r_el1_msa\n");
> +#else
> +        panic("'v8r_el1_msa' property requires CONFIG_MPU and CONFIG_ARM_64 to "
> +              "be selected\n");
> +#endif
> +    }
> +
>       if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>       {
>           int vpl011_virq = GUEST_VPL011_SPI;
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2eca2b913d..fc4c7ae734 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -35,6 +35,18 @@
>   
>   DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
>   
> +/* If this domain should use PMSAv8-64 translation regime (MPU) at EL1. */
> +static inline bool is_mpu_domain(struct domain *d)
> +{
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
#if defined(CONFIG_MPU)
> +    return d->arch.v8r_el1_msa == MPU_EL1_PMSA;

#else

             return false;

#endif

Further if we can set `v8r_el1_msa = mmu` by default for everyone 
(Armv8-A, Armv8-R) , then we can reduce further if-def.

> +#elif defined(CONFIG_MPU)
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
>   static void do_idle(void)
>   {
>       unsigned int cpu = smp_processor_id();
> @@ -731,6 +743,10 @@ int arch_domain_create(struct domain *d,
>       if ( (rc = sci_domain_init(d, config)) != 0 )
>           goto fail;
>   
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +    d->arch.v8r_el1_msa = config->arch.v8r_el1_msa;
> +#endif
> +
>       return 0;
>   
>   fail:
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 758ad807e4..1387adc0e9 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -29,6 +29,11 @@ enum domain_type {
>   #define is_64bit_domain(d) (0)
>   #endif
>   
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +#define MPU_EL1_PMSA 0
> +#define MPU_EL1_VMSA 1
> +#endif
> +
>   /*
>    * Is the domain using the host memory layout?
>    *
> @@ -126,6 +131,10 @@ struct arch_domain
>       void *sci_data;
>   #endif
>   
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +    uint8_t v8r_el1_msa;
> +#endif
> +
>   }  __cacheline_aligned;
>   
>   struct arch_vcpu
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index cd563cf706..0ef445a273 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -355,6 +355,10 @@ struct xen_arch_domainconfig {
>       uint32_t clock_frequency;
>       /* IN */
>       uint8_t arm_sci_type;
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +    /* IN */
> +    uint8_t v8r_el1_msa;
> +#endif
>   };
>   #endif /* __XEN__ || __XEN_TOOLS__ */
>   

LGTM.

- Ayan


