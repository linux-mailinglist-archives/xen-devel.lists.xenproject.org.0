Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NGnVGhilj2nqSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:26:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B999C139C86
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:26:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231949.1536871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1cE-0003gO-E9; Fri, 13 Feb 2026 22:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231949.1536871; Fri, 13 Feb 2026 22:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1cE-0003e2-Ao; Fri, 13 Feb 2026 22:26:22 +0000
Received: by outflank-mailman (input) for mailman id 1231949;
 Fri, 13 Feb 2026 22:26:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvVf=AR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vr1cC-0003du-DE
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 22:26:20 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03544212-092b-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 23:26:18 +0100 (CET)
Received: from BLAPR03CA0062.namprd03.prod.outlook.com (2603:10b6:208:329::7)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 22:26:11 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:329:cafe::25) by BLAPR03CA0062.outlook.office365.com
 (2603:10b6:208:329::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Fri,
 13 Feb 2026 22:26:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 22:26:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 16:26:11 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 14:26:10 -0800
Received: from [10.135.199.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Feb 2026 16:26:08 -0600
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
X-Inumbo-ID: 03544212-092b-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LU4+FI1Zevpm8AbEqoU1bECE6llKYdCzCuK2zYT9XbzF9ORw2X0gtmtdhxot1bM54sTZZ5bQr4yTkgpfSeNdfr0ZSh+s8O6VdlRuF7egPS6KQJc80XT9M6zrcDYtOd0Fu2+4FyvVk2b7SORedqQn3KKz3nk3NGj2DjxRxfGWqOC9c1rsDX0VANf/eZ7wBjhCxnmRsKgj7B5ah8Hr57hPvAsZ6wQmIoeuyrPhsgbwLiH2cotXyxVlH9E2jR+KU8o8NHoYPy14SpT3+QL2xOZ01TgX+nirIkiU1fSGvgVJtmthNhSUAlpcZY4OT5T4PiGpvqPzoStal/GItBlcyYcuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41vI2baCxNv2Q6M9bPOvw/AKlYobI0hvttsQBN2B+qU=;
 b=JoHJ/KikcS419PqrWPYl6+SU0tQwsMwJ55wWSZZ6IhnPRcT/VUV4+IPOb+ogiDIp/4Sub951ReCd1YMdEMU9JJwCxMmmGwgCAzAMznkoOjYjcwgS4D6rIfs4asqVpVppEJ47eMXqJafyMF8ZRtqEriCMYA7MWcd8ZKg/qEgzpcFKXWTnNfKYOXS+TjRSL3aHUkV38aHlMuw8vZlThvCQ3hvObIgmjuZAQSBEO8ytuNcLYA+T4oGT6xQh8tHuBMJw4mz1vn3Vc8InRiAmaAgcvRGvDgwVe6O1//E7Yq8QF2KKKIGsrVPbVxzicOyXI+C3JyP1JOjSAOBwSBU2NyLzug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41vI2baCxNv2Q6M9bPOvw/AKlYobI0hvttsQBN2B+qU=;
 b=1+XodRg6sYVeXFhLrqERyDjJd+kPagYJjypXBIbk0Vsnm2TirOkbCzyefBpywwpAtRENlnuijYkc4ud9kBr8K9aeArktxQ2avRs3TsMzeDNQTC3ePukswkufUob+bbGZFV7GISXFc961PVYOs8bnzv1FuPB54qRT4t1P/UnNA+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <267b283e-7ee3-47fd-9fa6-0bd4ea07fd0a@amd.com>
Date: Fri, 13 Feb 2026 22:26:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm/mpu: Implement p2m tables
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-4-harry.ramsey@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260206090155.68466-4-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb4a41d-ee45-41e2-77c9-08de6b4ee426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmNZSjlMWHBqTE9QVWcxMTFIM2p3ZmVKcUFpMW1KTWp2MlhJRTc3TzZrWS96?=
 =?utf-8?B?QlczMHJiTzFCSDR3bkJwZWZ6bysydnIxNlJaVGRqWWVrWldLU0VxbVovVFFr?=
 =?utf-8?B?NFVEaEVCSytaZ2daNFBUQnM0aG9meTEyVTlVZnA0SXV2ekhRZWNZdGZQNjhZ?=
 =?utf-8?B?OWZtSHE3TTBGSHBEY0tjZ2VCTVQ4TVZvR0FZcjk4QWxqNUg2Mlp5eUlOZzFh?=
 =?utf-8?B?SjM4R09Da0U5T1hKUk1YQ3llWG9HdGFneWxZeUtZTWdwOWZFd2xxMnhiMnlX?=
 =?utf-8?B?MU44VjAxRVBadXl2ZHJ2QUllVnA1TlZTbXZXMmtWZ0VCekVJL2pLRmxMeEp0?=
 =?utf-8?B?dTdyNFVod2o3ZHdMWTB4VXQ0aWdKbTh0M2hDVUg4WmNXMVk3YjB1dFFXa3o1?=
 =?utf-8?B?UkFBdVFFbXppaE1OWTVwQkxXWFp6S2xQY1ZKREdocCt2TzUzdjFzT3NkSWxl?=
 =?utf-8?B?RFpwVHRaWXNuSXBrWlNWTEM2UDUvd1BBLzNaWStaVHR0YUlYMVBDRHh1cVNB?=
 =?utf-8?B?UnFNSE1ESlBKdnlOUVkvSGY5ODdNOWJYQm9EU1hIR1NSV0JpU2Jlc25kbHJ5?=
 =?utf-8?B?ZTlzYkJxUFFvWHZtUDk3ZzRqSnRJYmRMODdCbmtpcWM2aGJPWFVMWnRRd296?=
 =?utf-8?B?a0ErVFdRTXBEeDFIWkNOVlBUd3FWdWorK3M3c0tXY3V4bWUrODFOUTU3SXlB?=
 =?utf-8?B?ZzFWTWJJZEszRkFGTjFHR0ErbjdaRGFhMlI3L3JEbXo4dmhlcjJVdit2NlZV?=
 =?utf-8?B?YXo1TEMzT1A4WHRMT0ZtbVYxYzBYWEJIMVF2ZnI3REZrWkR3akMxNHVGZG5o?=
 =?utf-8?B?bys4NmxxZTJKcTdHMkwyWE5wMzhyU2UxcGk1bER4Ly83SjllaVZXODlxSTNx?=
 =?utf-8?B?UHF2bkUrOWN3dmZkb3E5c0E4Wm4waGlXdlo0SkJGQjdCTzNRaWVXend6bWpB?=
 =?utf-8?B?TW9GSHZVWE93bU1SVG92YllVMm5MbWdKMWt5ZEFFbG4rMStUMFNGZHJadzRV?=
 =?utf-8?B?b3ZtZWo2aFdMT3UwQmNia1pnbmw1dDlsNGxzVEdKUGNIQnZMR3pBalJjc2dM?=
 =?utf-8?B?R05GOHNPU2FEaVBLMHE4VzIvYURRVVlZTmhnSEFicVAyN2NMY0VKOUZTWUJ2?=
 =?utf-8?B?VXNVZFJyaWh2YmlvSzlwWWFRZFlnUTdCYklySjZqOW1VVlB5WCtzVmZvdGkw?=
 =?utf-8?B?TXFBZEg1em5YR052b2FIcm9ObGpUOTQ1K29RRnhkazhJYjY2OStzSE02ODUw?=
 =?utf-8?B?eDZMTXMyK2Z1eitESkdzdlZRalc0clFQK3ljY051aTdGWE1HeDRmTEcwWjV4?=
 =?utf-8?B?K2h1bk9QQ0hDL0ZJTjlyZmNVVFNLSVQrUU5HSnVZRnk5MWNIT3N6RmNIbnYx?=
 =?utf-8?B?VVc4bGVTSWhIK2JrMVhHZ01Zazl6SDdNNXJpMmMwNlZSRTJNRmdsZmx6MFZL?=
 =?utf-8?B?cG1hK1hDOFNFOUxqaHk0dXFmbzF3RnVwZUpubmovRVIzNlViTURaL2lGU2h4?=
 =?utf-8?B?T1lOc2lKU1RzVnpQbk5SYmRFeWhTSFBTSVRoVyt1MWtQcmlXbXZINUpkejRI?=
 =?utf-8?B?SEwyenZ3SXIzdTBWVWpXWE9HbnhGN0R6UHVPbzJ6UXNKSTJoajFTTkxwYkJa?=
 =?utf-8?B?cTF6OExnWGJVcUVSOGdWUmh2RU41WkVvUDJIWkVIUVhYZGE0SExCNm84ektm?=
 =?utf-8?B?TnZUV1NjeHRWYkkvOGFkb2hNa20rZEdoZTVzemtUcGc2Kzczd2RPclRTT0Vm?=
 =?utf-8?B?WnFMUk5lVEtQLzdZaWNhd1BTeXFMMDd5OHNuRDJoUWtrYSsyRnNYZ1A2Nlhx?=
 =?utf-8?B?VGVXZlBqQWh6bkh4OGYxUUlvUkZDQVBNd1pTWWRJWWpzTndxd3VBTUlyNkxG?=
 =?utf-8?B?VUErNS9UOXVaTVdSd1p6ODRod1o2QVNOVHBzY2tQM0k2VkRMQW12MUVWSUt4?=
 =?utf-8?B?eXZVazhXL1V6SW5BNUg0aXRCZEpZak9ZY0o3M2xpemErQlRsZWs4ZjJPSjJL?=
 =?utf-8?B?TjlOTy9jTVZlVy9ibXN4QzFjV3M1Ti9DaDFLbWtDQ2FadjFyQ20wdktCUGZS?=
 =?utf-8?B?ZSthVzJhNWJQNndYNEN5R082eFRhcVFVWWZPbXN6MDdGaGV4bzJuQnVpWTZP?=
 =?utf-8?B?TlZLekxTZXcwMlBzSVQ2TTZpK0FiSWlFbnpjaUg3M0lVTXJjLzVwNHYzTGNH?=
 =?utf-8?B?U0tMTWtFSXpxTGY4Q3JUYjRxUmJlaFhNVnBkc0lTeW5XakdOdmdFRGlMQWxn?=
 =?utf-8?B?bWhXWGx1QnluWEw2OTRoWHl3ME13PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AxightObPdfPvC4DZNuuPHrnzUxAAYjojYdtPqA3ZRu0k4Rd+oAagwIuHto6VyCEb6LFcOFFrQCsBh7Oy1JVD/oUo7RUo/e5rUXAlVaY/hggkjB+RHxHgUffqwKULVEa28vcwnqLQuRdBw5VlFROaa6GH0hPKEyyiACk/7hwtjHHuBI/o2XvyH2uTdpUBbQvHMGAARSXjshv69ANUdGS2Uo1I2pZ9ajSLQMV29qj2sf5d42KE2YNTcfrOlw8wGH1ODZxHueuoklw9Xx+9HZS5FxkZqqfIakA2ZAP9Loc6DjW9VLx9Yxa/Ws37x2RwxWKH0/W84pgBoYW1OFwydpE2JvjwbkH/5/10Q8kkrggsS5/BA6LweCWMG1BPw59i5XrNEqifpvgF2a5ya5dPxzrUTi3GYIjx0qF9/iBOudDO9AWEfc/+/CB88/PaoYivROb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 22:26:11.2189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb4a41d-ee45-41e2-77c9-08de6b4ee426
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: B999C139C86
X-Rspamd-Action: no action


On 06/02/2026 09:01, Harry Ramsey wrote:
> Implement `p2m_alloc_table`, `p2m_init` and `p2m_final_teardown` for MPU
> systems. Additionally implement a helper function `generate_vsctlr` for
> p2m initalization.
>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

- Ayan


