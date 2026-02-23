Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMX6C2IXnGmq/gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:01:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B369D173673
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238545.1540156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRo9-0004MJ-J3; Mon, 23 Feb 2026 09:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238545.1540156; Mon, 23 Feb 2026 09:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRo9-0004KN-GF; Mon, 23 Feb 2026 09:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1238545;
 Mon, 23 Feb 2026 09:00:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2fJ=A3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vuRo8-0004KH-Kp
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 09:00:48 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23a95f0d-1096-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 10:00:46 +0100 (CET)
Received: from SJ0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:33a::11)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 09:00:42 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::3e) by SJ0PR03CA0006.outlook.office365.com
 (2603:10b6:a03:33a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 09:00:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 09:00:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 03:00:41 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 03:00:41 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 03:00:39 -0600
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
X-Inumbo-ID: 23a95f0d-1096-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhIQPvXmYKzN2GIOL2RZkiA9u7VUdNSlFUMODNGoYI9YNLR53KBKevJgGzOkViLiIr2ZXB5x1KdHMJPk8jda3OzbEJwzCam2aE6i3b0BaBkBoW0u2GDWiQi/3RW6ESgxovYpzNvwLAlvtOrtb1wd9oSn9hkFuM6QpT20+XIbmR6PEqZfm8Bm7eE+4q+x8QtSy3t2wWX8QmLadV7w2hs+4pYtNAdEEb+ms5cDKXryh3R31XN1SzHUg4/Swpy5ymjDl+hXxbvX5MZMEnXqxeFoxGL80P/DS79eGRHqo7+4Ky2lJXz6ilXgjlsJu/1qaeEh9Oeg37zmRES6EXsbx1ZgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ja7RLCsw3T1d4+UddOJk8/jWAop8kQKIJNbmZTL6NOw=;
 b=qXXMw9D4BQaCN21eCnOiq6j7PnU69dLBOmPI0lFCg5g6HT0W6p/TVLAK2jkfJvAXbWXuUVc/bdsZXosuGNTCvYTjabRyHiQFvR4sN/hMLth/EcuJOUvfliDlZLNWbOqmJZW5eXNWNaJ9uq+yiUystRdncF51s23se3OkAc87X9Hkffpy6sG4d/bXHeUWG4iJBeQxSmX+bHi3HS84fbqHmC36iL/95RnLJ4TGKoS56fm7Igp4v7by0PVEBPtw4gH4jucj701L5fTHpdRuVK5HrbHoqOQauHhNUgKJoO4cj03eQP0iIwjP57eS84SDnlMtwjcnKSzRNcXJrq0TEzCkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja7RLCsw3T1d4+UddOJk8/jWAop8kQKIJNbmZTL6NOw=;
 b=zvrRaT49/Qxao7JuUo3WOHeeUtR+wEeUbEfTTOPSjrs0rKFemVaax6q5XNYzZPeeZV74yuIbGj30D+qsYD+2cTu0feyf6fq21yJEokY5wkn4NCW8N/bGl8qzRkcTnz7vDSiPJ1Qn0gDfu1AHA3h63wHAHZtwTKJD2v2gkiqfIPY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <afc77f4a-c880-4e68-8e6e-d4754a22028a@amd.com>
Date: Mon, 23 Feb 2026 10:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] arm/pci-designware: Fix MISRA violations
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-9-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260220214653.3497384-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 46450b04-7cdc-4d41-a1f0-08de72ba05c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGdQOVFlb3lZZ2FoK2tKNGdwSEpORGFtNGtKQXFGeGw0bkRlSDRDWm1xK2Zh?=
 =?utf-8?B?blA0VmN1UElUNEpYVWhkL2lUNWp2OVZDQUd0SnlScndPb1VCK2NqNU1NYktQ?=
 =?utf-8?B?dVFYc2gzd2xNQ2dvcXN5d0l6TGtKdytPblpyZXg0MTNxTkNPL0ZJQ1U1c2NE?=
 =?utf-8?B?Ui80OVFDOFVDUWdNclJmNS8yenZGS0xObXhUdUdwRDFmdmROQ243WHJoWjZ2?=
 =?utf-8?B?Qk9rNno5YTdnZFZjRmJpM1Yrd05ONWp0bWhscU9ySlNDM3ZFd29qYWUrRS93?=
 =?utf-8?B?bEtIUWxwaW1sdGV6M2NIUEhUUS9vd0pxT0V6WU9UczVFY0FzMWJ2Tzh6UHR2?=
 =?utf-8?B?aVhWajJVQlVSKytSUkpOcFZqelEzMmFaVHczNklndWRsTWlPOG44dnR4SXJ4?=
 =?utf-8?B?NE4rK0lGVUVnUW05Mkc1dzlaUHhOQkxKeGd0TGVPYW5yczQxSktpZWtKRWI3?=
 =?utf-8?B?eVl2anMyQWhhM08xZ3NaYXplVFo1MWxZSHVRRURneitxdnZpTGdSR2E5Mml6?=
 =?utf-8?B?UXJZcXBFcW1nTFVNOG1rdE5NNmFORis5djNZT0pBTVB1dzYxZXlENExQNS8r?=
 =?utf-8?B?clJ6RDNxcFZ3QlM3ZHF2YUdOTGd6ZVNUMEN3SGVjdWgxTEprUlRZeURRSGRi?=
 =?utf-8?B?RStEZmRtT3lRbURUenI0U3NMREJzN3Q0eG5xMGJYQWxTcTdaekFnNEJHanVX?=
 =?utf-8?B?K0pqeTJCZENSd3lYeXhPUVBUSUZhK1c4WXp6dGd2QnBFVUgvZHJmUUdVRmVj?=
 =?utf-8?B?OHJ4VlFtYUZ4endML1NWNkFWQitsVTk5MDdNWnRESGp5cUlSRm1nTTBiUG05?=
 =?utf-8?B?RHZrcmNJZXIxVDc5Z2M4ZnhBbC9yT3ZrVGZTb0ZJbVFuZThmUEdsN2tRVGIy?=
 =?utf-8?B?SXM4S1FRYnJCWVUxS3MxbERUQUhDZTlNYnV0NnBjWDUyQWdvZ1ZQMHpseEdH?=
 =?utf-8?B?eldvRkd0RXk3azVMQUFhNFlFbU1BVDhlWGVGQ25ZbTJud1podWJBZFlEdVFY?=
 =?utf-8?B?Tm5lTUJ3MXd5M3N4SUtuT01hVnVWazZ4VTFoSmJadFlnWWIxSTNTTkFrSThN?=
 =?utf-8?B?bDRoc1VrNTdPZFZvOTdLMnJrMmtOWjFjQnJDOStlUG94VVg1Vjk5SDg0TVFT?=
 =?utf-8?B?amZ5cWQzQk5BWXBkb2tFNWEyS0x1TGlVSEsvSGxLQVRXOEE0RjBQNXQ1Q0lz?=
 =?utf-8?B?RXk5RjBaMDluRUVOSlVoSCtUOU1uSGNQN1dITlhNa2luakRmSndsQmlRRWhj?=
 =?utf-8?B?Ym1LNUZhVTZ4cEVqSHJkWTBDalpDcXZhZlFXRzZ3L3NIc0s3dHN6b2dVWVRF?=
 =?utf-8?B?bjJzVXVVVVl2U3VBRTR5QzNHUjVNdjd4WVRUNkdBUkYrZ3djWW9kUVN6L0JX?=
 =?utf-8?B?YWxXNmt0OFpSUHBYamRPdFdmT25jUElOYXh3Q041elROVm1QVmlYa3V4eUNz?=
 =?utf-8?B?U251TnlLcFRZVXlsYXp2dGpsdTRwU2pDcE1UZGcwMmhCUFVVeDJlcUxrL3c3?=
 =?utf-8?B?TkVyMCt3N1FwUEJsTDZaeXp2WCtnd2hrYmdoZnBieUNPVmJ0ZHpBb29xY0Yz?=
 =?utf-8?B?Rm5vb0pUT0xBdGczVmlXRWt1U2tJL0dicjBlNjhLNG12ejJkdFJLWEU4V3hq?=
 =?utf-8?B?ZUQ0eUhHaFN1SkxLT2ZEUllIME5FYzYyRHdQOFEwSTByZHNSWFpvTnRycVpE?=
 =?utf-8?B?Q0VxaFJEcFV5K1dEUlZRcnFEWmhmVlN6TGwxL2V3N253dmtoakdXdERrTHdS?=
 =?utf-8?B?Q3RWbXVsZ09xYlppVXBGemxhVkNuYXdzc05QakIwU2RVYVpyTEovaDN4Y2Yx?=
 =?utf-8?B?Qm44L1VEYUNhajlJVVJ3YlpZTU5jMk1nSnFOM0FyZzBKOXFEbEQweDMweGFU?=
 =?utf-8?B?eHppNExXZFJ1VEl1V3M2Ukc5VWp2elp6WHRkNzMrUGZxeENiNUlrTENPRFRQ?=
 =?utf-8?B?eTh2SnRmRjVwTnBKSUxaRzRGOXRzU0xQSHI0VnYwYnovL0pTa3NXY3BNdjcx?=
 =?utf-8?B?OWMxb3pKRnFPSldoMzB4MXM5TlNpbUc2VWpEMXJqTUpVbW4raWIvWCtIMUo1?=
 =?utf-8?B?eVVYbXJDbU5FVmthamN1UTlxRitvdytScnRIRkd1YTFad01TNVBzekcxMC9P?=
 =?utf-8?B?aWNabHFqSVl0M2pZL1prb3pvVXhiNE5EclYzZmswa0pRV0tsYWdlYzBwOGdM?=
 =?utf-8?B?eHN2TVUweHpKTHMyL01MaU1EWE9XVXJFbytYZ3JpU2diSnFramorMVFmQ1Z2?=
 =?utf-8?B?SUM2NnJEZDhJU2hvcVBtdGxTcExnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0q6yW/4weBpPxLAcyOAOqh6f7XdNIb1w89pno5Gmte2HfC79HLDzyCPJqnRsIwsbUqArgi8WRDu/+5GRhCxzIgqzfiwGYgfE7IjzodsxHYLpxhMkhK/OppoED+buIJvYA5DonxbcPKqU8Zf7HOnxGLLtq1bgFS0fNvJq3yOAuX8wuduswrhgRLwEVgczD7TK8tHIGX/lIpfsBmDTWB2MPyrzN3jSDCApWFia77/fYZl2Uhbwlor9DHKUL+fygxSsZqBy/BqtI9cejKI0aDZAj87QF2FJHhpoBqSebFYeVQM5S35hyxsq3Guzp59LsmjbeVIoYWgbx05mLr1aNN5AV435iguoSqz39JSOXwypqwfZXwX+KKzfZx014bIANQhyRAMSpKi53EDvioYXUl4y/ZSkILf3h9GafAUbW9uNe3CTBuBUprFcuDrBV9jBTnqb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:00:41.8700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46450b04-7cdc-4d41-a1f0-08de72ba05c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[amd.com:query timed out,citrix.com:query timed out];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[michal.orzel.amd.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email,citrix.com:email]
X-Rspamd-Queue-Id: B369D173673
X-Rspamd-Action: no action



On 20/02/2026 22:46, Andrew Cooper wrote:
>  * Move includes inside the header guards (D4.10)
>  * Use NULL in preference to 0 (R11.9)
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


