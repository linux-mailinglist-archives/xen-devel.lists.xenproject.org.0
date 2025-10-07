Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA96BC0D32
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 11:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138631.1474275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v63jz-0007Pc-7Q; Tue, 07 Oct 2025 09:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138631.1474275; Tue, 07 Oct 2025 09:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v63jz-0007OB-4b; Tue, 07 Oct 2025 09:12:15 +0000
Received: by outflank-mailman (input) for mailman id 1138631;
 Tue, 07 Oct 2025 09:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVcl=4Q=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v63jx-0007Ny-9n
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 09:12:13 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2616926-a35d-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 11:12:07 +0200 (CEST)
Received: from BYAPR05CA0002.namprd05.prod.outlook.com (2603:10b6:a03:c0::15)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Tue, 7 Oct
 2025 09:12:01 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::46) by BYAPR05CA0002.outlook.office365.com
 (2603:10b6:a03:c0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Tue, 7
 Oct 2025 09:12:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 09:11:59 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 02:11:58 -0700
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
X-Inumbo-ID: b2616926-a35d-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciwAlPwn09IbnjO/PiQ4bNA2pzn7pYf1H0aM8Lov/GOehipfGgupsvTgPUu+5aTyg53GtDTSZJ46Zl8FmZWes1fv+nDWTEHyYMHrWJBfvdlC5RhHammHbLue/8t5sS8dyxEBoWsjzDPtV4qBXrENGxmb5Y8O2i/ZL1es9phwVHCU40h+gaEw42YVQtBXhgVk1t0kzzmg0U7mzwC96SrGtADVepcUVVQh14421bq0ZHpyAEFJUC69eVzS53JTH8vv2uUaIyuAnhdShsvvI6OgcpgmfungfsWvFwe0D88/wTWbDfge27L9k0rf/XhyEWUN/LOlUq/QIdn8HfAQ17xozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRBbOsAQzRdP52mgci1MzF2yRKWRNEkie8mPHxmMbos=;
 b=VM7Xb0IzaHRGDqkG63vPErMTAtJQTRaZVHYBNEqIYliwhheFbh68xdy7LIPBYqClg9P0gtQGmWiSLCeS41vjbrkqVx0ui0InB7pH4Fhg3iECMTRtL4zQz6uuPDA0J7/UMcBSJFrty5DEu0JfMxTnASEWykbVg66qEDddDkbcYbR7KA2mrbJFU4V1r4v1xuPMznQVqkf3TDlRjPwW7TLn3omqwqai7DfWNEUxbo4+ymJIG2WvbpKcLWflSorr5dINesssbjzDP/3E72iIwsZWSGzmt2MT9VoyH2HcgwB/tOs2ZR3P7zyULwZmfsta7xUlnDhyXvEyoARPwJ3l97/7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRBbOsAQzRdP52mgci1MzF2yRKWRNEkie8mPHxmMbos=;
 b=oVeIvWv0S2F8L0N25OI3yaULkFG/pHtWeUDWfyFB3y0Q1SErYUXeGPkC+DgGKJkwYZnWHaFFSOPrAsVLEMfmtlqoEDeh2q1NZhP4F38lUZe1d7UXlZ9LpJlNtpphEFpVaFo3STojlM8XW68Jt9b5pfqeH1W8Gz8dSIa1pJ7GkTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 7 Oct 2025 11:11:56 +0200
Message-ID: <DDBZ2NZECIMD.200RAWMH4ON51@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v2] tools: init-dom0less: Replace err() with more
 informative messages
X-Mailer: aerc 0.20.1
References: <20251007062656.4254-1-michal.orzel@amd.com>
In-Reply-To: <20251007062656.4254-1-michal.orzel@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 233de156-463a-4ae4-61d7-08de0581925a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1U5VU0wRWpJN0xMbGNLdVcvRUNHMy8vaUlIYm83SGtOUXNyMzdlQjNtd1JQ?=
 =?utf-8?B?TmdMclgvTGNsRE5sMTE4RmRWQWdLakxMWTl5MlVwR2JQSzhocnJMNUFPNllp?=
 =?utf-8?B?c2dJNzBWZ2tIdDg0VTRWdGVHa0V3SDl1dXpBZVpVRkhRVlcxTTJhZmtBeVY0?=
 =?utf-8?B?RDFHSVI1T2xkZEcxeHlHTTZLWHowYmsxN3JQZlJVa213enEwdERHcldKNUdF?=
 =?utf-8?B?ZEtrWWNYeHJxMlUrRDF4M3RHeHF4M28zbjBIVmZjZjdrZW1xMkxZS05lazEz?=
 =?utf-8?B?cVlYUGk4RVhJaEpRTDVMaXphQjlyNDFYRzhNTGhOSzRPTUZFY2xPN3NTdXM4?=
 =?utf-8?B?aWVGYmtDYTArYjlxRnRmTVhEeHlGcnJOa1UyV1JaY2J6MDJBS0tKdUplVWQ1?=
 =?utf-8?B?VjhhVzJBUGphYWZmdDFWV0dqNnVxaTNwQlVLQXRvc3dDa0F5clhCUktmRzE2?=
 =?utf-8?B?YnQvL3l5VnVZbTJscjJNbG1PQUgzQnhOQzhIYTVLME1vMy80U3Vxd2doa1Jr?=
 =?utf-8?B?UmZIbDhNR1RoYUd5d2NScnBIWmtCWnVoanVpN0tjek14WmZRdllqdzdKbjNq?=
 =?utf-8?B?YUlGb1ViSFg0a3JiV202TGNIb0NjZTJORC8wUkZIZFYyR1RqSnpCYlQveXZn?=
 =?utf-8?B?ZWhUS05tcWNFQ3JieFBLWVFER0NrV2tjOUpMdHF0RGJDMTF5V3FZbzRtUVh5?=
 =?utf-8?B?SHJJR0JQTGNXS1FiWnBiaDlzT3VBZjA2N0Jza0JCVHdKNjNUTzBFSmdqeXJz?=
 =?utf-8?B?L0JPTElQVVFWRHJqYWRsYXcxcVN5UlRxc1pQemhBandCaXVYc2JRRlpFMUZQ?=
 =?utf-8?B?QzEvWjN3d21sNDdBWEtuSE4vdUxpYnFNdUJ1RDYrUjd5SW0zWnBXZ0xtTGJx?=
 =?utf-8?B?NVZUcm54NDE5Q1pYUDlVSHBZTzJJaHhzQUhhbjd5b1JFSkRNUWsxOWQ5SDhx?=
 =?utf-8?B?Z3RMSE8zRW8rWFFCNXdYZ3ZTUWoxK1o1S1kxY1crSzJMbk1GV2kwMzQ5Q1BO?=
 =?utf-8?B?YU5oTE9uUzF0Zk4vbEVrcFZDRE5uam16QW9wdzZtVHBPNXRIZUhhVVFJK3JX?=
 =?utf-8?B?UERmMG95amx4K2FtalNCOTB5Ym5iR01YZ0ZlUFNrRnhRdDQ1YXhnRTBRRzEx?=
 =?utf-8?B?NlV6cHJJZ1FSOGIxbHJhWWdiT1dZcTBQZFk5eitPT0VxL0ZVRS9UOHRnZ3dN?=
 =?utf-8?B?SlZFMElEZTBkbyt1bWtmMUZxWlpCb05ubFl5bVgxU0lwWTdPSlFnaFBsT3h3?=
 =?utf-8?B?MGRhZ3BXcDVwU25ObERIZVhoZG0vNWhPUTdyMGdtanhxODlFL2poV2xmMjF5?=
 =?utf-8?B?Q0h6Q0ROQW1rVzgwSkNuYXZpUTBsREE4bWVZemZwRytXSGlkSVUzcDdNa05G?=
 =?utf-8?B?aEpvOGgreEE1QjJIbVJMN1NBbGhoUU9VbnNFUkRzVTYrVHBUZDlZOFliLzR0?=
 =?utf-8?B?Y2JxSkplNUtaamFCQWtOMjFQR0xkYWRYZmgyUkZhTHJFOHVsSlBPZlFicDZx?=
 =?utf-8?B?RWhwdnVENytOeWsydlE4R0ZvUGVQTjlKb0xaVzk4aGt2Z3lrblVkbnN2N1Mx?=
 =?utf-8?B?YnlKRHRSZjdRNUVmZHdsREdoZmlmb01OUHFWT09ORnhSd2FTaUQ0NUYraWQz?=
 =?utf-8?B?dURYQ05sUVZJY3d5dFRjQjl6RVliT25BdUwrY2c1UG8zM2haWE9KYk5sNVdo?=
 =?utf-8?B?RmNTVEEyS3F0b3psZnAvRHJVL2xWL3NSc0oydmJBaVk5QllnNkFVdVM5RkF4?=
 =?utf-8?B?T0hzRjc1MnhRWkhjTHBCWjdJeE5xN0lMZkZTYlNYeW0zc1czcW02TFJObVV1?=
 =?utf-8?B?NzJKZXI1cXVOZkFiNkpsQVA0bkYwVFZRV0I4dE5mQnhydXN2WXgvbEdzK2RW?=
 =?utf-8?B?UFpZS1dINHphMFlvbEd5ZTkrakF2QUZTYVZRYytBT1VPZUh1dFVVSUNscmxH?=
 =?utf-8?B?TjVrQWRiajF2WG1YK2MzS2d6cmRPVGczVEg4eGVJMk5FVjNUWkpEdkQ0UnBl?=
 =?utf-8?B?cFhhOWxxZ2NTL2F4dGJjMGhHK3JaVS82N1B6aXplUzA0b1poWXRHTUI3bVo2?=
 =?utf-8?B?UWRoNHFkWHNKWTZ1U1g3Vzd3ak5ZZUVieXFnRnM2Zk1qdS9DSzN0NXh3VnhN?=
 =?utf-8?Q?C6Aw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 09:11:59.6163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 233de156-463a-4ae4-61d7-08de0581925a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391

On Tue Oct 7, 2025 at 8:26 AM CEST, Michal Orzel wrote:
> Current use of err() has the following issues:
> - without setting errno, on error it results in printing e.g.:
>  "init-dom0less: writing to xenstore: Success"
>  This is very misleading and difficult to deduct that there was a
>  failure.
> - does not propagate error codes to the caller.
> - skips "init_domain failed" message by exiting early.
> - early exit prevents setting up any remaining domains.
>
> Replace err() with more informative messages propagating rc when
> possible.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

