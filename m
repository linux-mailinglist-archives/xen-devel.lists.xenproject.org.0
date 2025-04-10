Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A16A8426A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945463.1343653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qeO-0006rm-Ot; Thu, 10 Apr 2025 12:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945463.1343653; Thu, 10 Apr 2025 12:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qeO-0006ol-KZ; Thu, 10 Apr 2025 12:04:56 +0000
Received: by outflank-mailman (input) for mailman id 945463;
 Thu, 10 Apr 2025 12:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ged3=W4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2qeN-0006ob-8u
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:04:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2413::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02216ca5-1604-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 14:04:53 +0200 (CEST)
Received: from CH0PR13CA0013.namprd13.prod.outlook.com (2603:10b6:610:b1::18)
 by BL3PR12MB6403.namprd12.prod.outlook.com (2603:10b6:208:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 12:04:49 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:b1:cafe::70) by CH0PR13CA0013.outlook.office365.com
 (2603:10b6:610:b1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Thu,
 10 Apr 2025 12:04:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.0 via Frontend Transport; Thu, 10 Apr 2025 12:04:49 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 07:04:47 -0500
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
X-Inumbo-ID: 02216ca5-1604-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx58lBJAe7Wi5f7x3/r3RXAHJSRknF73rRGaVnhVWTx+gvT+na+QHPWWHO87eySye4u4VqdeRDBT7wu/6lBU0iItO25HBooRJ1Y9+5ThfwB9hhxuekgqKTu9q00SDcaaPmDwFFchR4SpsgIuVgGzNIt2Tz3MAm41Dk9fEfLvHVdsj+ZH6Y7usLmnHaj8fCNBM+1O+45+p2v0m9fsqan4RQaBn8p0lsDIs5TVvk01Nz5PQJBwO0oaIgSp5NQwsxCXxEeXJWAnxAdKSUb+cU3pKyRNUn5oahprQUZlWfLpMDdRj6uOpdV2lJO9+gENrGIo3sghUS/zbFlZN56i045hjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko1fDwGe7shXzAv+xWTpfeAIVL+V3a6TLVr8WOultI0=;
 b=aMddur72hqTLc/Y/hT3bmVFr9T2ZyBYf5FQyXoVEZ32WnUwdWCUgtOl6BSdm3Ns0lWWmbd9CaFWTsoHVX1dz97G7ICUxL6qSYLsNCQxbH/7F8nkYp+imOrS8wLJ2+7X4lSzzrC0CD+WGwYLVaSCWGwcgolihqWx8aMCIUI0fAoBhLkRpehzl/mRzNiphve+XPygvxA932IoTHAJYsnp+1YU0QflFxxYzwi8hpCjN3oRvnZ58Cvx7PPHluu5XwGQm49xXi20JeZ6FAQSOqccBZdUAgrcOsbRa/JQFhfB/6tGcmodSJjk9OFyIdKhfCQiBJaP8fYAuKWsSboCZzMykPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko1fDwGe7shXzAv+xWTpfeAIVL+V3a6TLVr8WOultI0=;
 b=L8iVLTr953tdlPyBMrhBGHG5ZVn3ozqmYq9FUDdwUHRb0B016wPaxEnFrTYkc6rdROcv4SOl0DuVjKKLPHc8sFFtMX3dZyp0lvtObnZRbYE0W9tasl3xhctxFU65Vg8wvrouJhZULXNxbEkwbM0XAvsKvmDa6D8IqQx2f1cOLRk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Apr 2025 13:04:46 +0100
Message-ID: <D92Y0XDL09HE.A66TJOU4L4HR@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 04/16] kconfig: introduce option to independently
 enable libfdt
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-5-agarciav@amd.com>
 <230e7222-386a-46a9-8e8c-2fbdb595b645@suse.com>
In-Reply-To: <230e7222-386a-46a9-8e8c-2fbdb595b645@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|BL3PR12MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ee20b0-c165-464c-7da4-08dd7827e498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0lseldLenpJWGFIVjB3K2oyeVJqWjNuSGliL1J2anE0UGdEZy9pVmRLQkdH?=
 =?utf-8?B?Uml4L3VaVE1Dc0wzTDNvSkhNTVNTbWY5SndySlg4L2ppT1BGNkt4QnF3NUF2?=
 =?utf-8?B?Ykl5NkczRFZYZHZBNTA3NGZNNXFCdDF1L2JKZWlhbS9ROUlON1R6b2Zwb0d0?=
 =?utf-8?B?TG81SElicWZFek8zQUE4WGFPRUJ3bmhyQUpaMEQ2VGozVitobVhscVJ6YUd6?=
 =?utf-8?B?V2ZXVllIZDcxZk9FeXZINDZPV3l2amUrSGJTb3VLazRNYmRTY2FFd3k5OHZZ?=
 =?utf-8?B?YlRzL1BhZVhFMDZpVmFLZGk1eEFwRDRYaS9hTzRkUkFIN2VET1Q2QTR6Q1JJ?=
 =?utf-8?B?dG5zb0U3UVZmMyttQWtKNzN5MWxhQUxoRHhqbGFRcFN6aFd5UHBMNms3TENx?=
 =?utf-8?B?b3RzQ2xvQTRxKzRUeVBIb0FVUnJsOVJpK0M2SWs1SkduWisyOFVoTXJFTWdi?=
 =?utf-8?B?bXZybzR2VWJTai9JRDZFSzByQnRYekU2TXdXaUxyOFZrM0I0ZU9VMmQ5Smxa?=
 =?utf-8?B?emJwWkIxS0NpaUUzbWE1YjFVNWN2VGVpS2Z0UDQrcyt5KytPS1A0SHFrVTZr?=
 =?utf-8?B?bUtaamFWUzZpc1pmemZnbkVXS1JZdURCeTJ0NUkzZDRoQUkzQWRzUEhlMTlj?=
 =?utf-8?B?b0R5Q3ZnY202dEl6aWMvRFkxZ0x0SEdDOGIvRFBHMko1Sjd3VlZvOVBPWkVY?=
 =?utf-8?B?QXljYm5rbkI0eFpZeVFJVUpYQzdKMW5OUFRvV25vTURKVHN6VmprYUt0eXVF?=
 =?utf-8?B?d2FWTGsyK1IxQkY3N2JqV3ovaFZ0aTdQdzBaQ3IzTUtJdS9KUndlL2JTa2xv?=
 =?utf-8?B?SjNLNmdDRFUzYWdvNmNOOXNhczRteVp1U0NzMFprV0NKTCttWVRFcTFrZ25o?=
 =?utf-8?B?aXRMcFpOektmczRlQk9zOGhnYmJiTmtlN0txbnNsSWVYN0dSMHZLbUVBbTA5?=
 =?utf-8?B?Ky8yWHlCNEJvakt5ZlVudHZhaDc5dnZkWnA1K1NjeXFPejZnMkd1TmVMdG94?=
 =?utf-8?B?dzc1SGdSdThpYVRtVzY4WGtpUFpPZ0JHSHFSa2RBL3ZyZE01M0Y0Q1Q1VlBh?=
 =?utf-8?B?NFNHM3Fuam9JL2ZJTEtqOC9XTWMwMzlMbEFYTTdKNzl2Vi9VWHJwTWNqMlND?=
 =?utf-8?B?WVJ2cTk0YTN0THhvTExac3NPUEhDRkZ2UDhWb1laYU5udUJMajNCVm1BbXU4?=
 =?utf-8?B?SkI4Vy95bm9SSjFIbm9qQ0t2Tm1nNnh4dDNTcUIwaUZISVMxTmkzWmFmSCtU?=
 =?utf-8?B?Y2doUU11U25EUnQyYUF5bklXWjN4cTk5ZGJDY053cUtYTHRYUE5BU1ZvSHdI?=
 =?utf-8?B?RG1ySS9RQkdBNXRtL0g2RUNvZ1A5dng0SExoSTBTaUdlY21zVDRiYjZPRzFW?=
 =?utf-8?B?cnp6RmVRV1QxazdWLzhGWHhJQVlMc3FicjhCRXhFY1RqV2lHVjlFOW9qYTYz?=
 =?utf-8?B?dzlQT1NxbFRTSm5Ob0xsTVVBY0lwcTAwT2grTnNHWm95ZFhKRDh0Q0E0L3hw?=
 =?utf-8?B?MXhTK24rZHJSU3BReTREM0VFZWw0MEZvdVFjdTRPNTdLYmMzM2RQcEFaT01D?=
 =?utf-8?B?R3dsbEl3Y1RiQnpHUWRvTVVIdThSYzZ3bkpzL1YrNnNkK0V3MDR4WFk2TGNs?=
 =?utf-8?B?L092MXJlTzdRUWloblJ3Yy9penhPMEF2QjB0UzdrVlFRcUwyUFgwakNmTmhv?=
 =?utf-8?B?Mkk5QWJMOGxkWFFDMUwwNWZQa0RXQzJqbmhXSUw0VlUrRnR5S0UwVnR4dW1r?=
 =?utf-8?B?QlZSc0JWL3crRWo2Qm4wZUVNTlRLWUZWOVRBTng2eWxVRWtGREFvaHlWQjJH?=
 =?utf-8?B?L09pUTNNaFRWWC9GUU9uYm1IVW9BaXhHOGtWTmk2akZuR2ltaXZVOVNqMmRt?=
 =?utf-8?B?ZXE5azR5blVqVXoxK2phQlhSQUIxVGJXeENzQWlYWVdFQmwvaHVFTlQ1bHc1?=
 =?utf-8?Q?mWcdmKELOmEderKftE3lgE+DrCxivi7Y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:04:49.0078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ee20b0-c165-464c-7da4-08dd7827e498
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6403

On Thu Apr 10, 2025 at 10:04 AM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Currently, the inclusion of libfdt is controlled by the CONFIG_HAS_DEVIC=
E_TREE
>> kconfig flag. This flag also changes behavior in a few places, such as b=
oot
>> module processing for XSM. To support the ability to include libfdt with=
out
>> changing these behaviors, introduce CONFIG_LIBFDT. The inclusion of
>> libfdt is then moved under CONFIG_LIBFDT.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks

>
> Looks independent of earlier patches, and hence may be possible to go in =
right
> away?
>
> Jan

Yes, it's independent of those.

Cheers,
Alejandro

