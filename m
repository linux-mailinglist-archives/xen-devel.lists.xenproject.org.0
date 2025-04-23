Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13290A98A80
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964677.1355408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zpe-0008Kw-K6; Wed, 23 Apr 2025 13:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964677.1355408; Wed, 23 Apr 2025 13:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zpe-0008Ik-Gk; Wed, 23 Apr 2025 13:08:06 +0000
Received: by outflank-mailman (input) for mailman id 964677;
 Wed, 23 Apr 2025 13:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7Zpc-0008Ie-HP
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:08:04 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2414::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbf9f656-2043-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 15:08:02 +0200 (CEST)
Received: from BN0PR10CA0015.namprd10.prod.outlook.com (2603:10b6:408:143::33)
 by SA1PR12MB7222.namprd12.prod.outlook.com (2603:10b6:806:2bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 13:07:58 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::d6) by BN0PR10CA0015.outlook.office365.com
 (2603:10b6:408:143::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 13:07:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 13:07:57 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 08:07:54 -0500
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
X-Inumbo-ID: fbf9f656-2043-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIQxZv3EuF9mpmJjSRHO6jKV1f2gBGOAq5cCV+f0nLMAKFfU332YKfLWaIj5m9SHMTFZFpTEuvYPZ6hDQTNtFH6mPxqrrO04ltkCypx0R0nxoB4bKbYktOMwFw2koROp3i4bTYYAwIW3flhfugmrw2Iqn1V0TMEjCHMVII5abOdt1maFJjcuTPV6DzMcepZ722JLTu+GYl+u8nWK2gYTaCs9XEU9d+JVhrRW8eVovN52E05ESsQgXushdvxwZ9/K1hMJDOJby5rdwo6lJUcKpM7bXPcvMH5WPl06xPNVF4PKpZ7HJ4omll2TyIZdIg5MwRQMUCAfqoU2rG/jXghaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNxTBPT4c3cs8bnzZWf6TFyxCPojNVRm6U3ZXly3Ht4=;
 b=qKfIfraMS+xjgAWq1E4s33v6C7T4bwGr9x5/hSbrhQUsExBbZCEXdq+sc4yPvSJCZZLzk0vTwxfJ3s8NR0azF0Cd7NpuD0q6CZIZsEHmV+deU7JGwzkDbUCCIhm8m0b7RN5YSuMeswx8sFD+6sO92RWBPiH5X/7TjKyZxpTSS2N8fHkdgYxDgvr6FnIjahJAB3l/0IunySJy8yI0VoTsIba8IZkMhiJx8yJU6wgs6zkZdTQA88msnUWac+b/vhQPxb43+AxsCYpVBxBGMwWeeN/Dl3UcXuQTOKd8/gEXDaySS/jCzgt0juIw7vHy3cX691ZENx9BM7lKaOxgl7DpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNxTBPT4c3cs8bnzZWf6TFyxCPojNVRm6U3ZXly3Ht4=;
 b=HAt5XD1x5p+CUU+88epjouNVZHu5rEuw4DRwT1IVBiTyRSKHn8KLBc1tAQj2bq1sIs5CX60114W2dXUoe6dFAJqK8Ym8HSdOmGoa5Ei4nqHqMcZZPg6czXSY26UT5K1B9Vur6UHsU2nH9/8zYS3i3uwD/dFJTDin+IY1kX+Gdqc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 14:07:51 +0100
Message-ID: <D9E1IBGIMTD2.1C7OB8RO40M0O@amd.com>
Subject: Re: [PATCH v4 13/13] x86/hyperlaunch: add capabilities to boot
 domain
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-14-agarciav@amd.com> <aALfIbTCAO95zycA@kraken>
In-Reply-To: <aALfIbTCAO95zycA@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|SA1PR12MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d35b9e1-037b-45b8-4b29-08dd8267de40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFlWQ21lYTlPQ0YrUm1WYi9WY1R4V0Q1ek5qZ08rREdVdlRsRVpNWGY3amUv?=
 =?utf-8?B?RnhpRGE1a1ZmYVJoZG1lVVRmcjZPam1qRHUzTDU5MHBJbE1mS01lT3pVTDRO?=
 =?utf-8?B?UHg2Z3Vwd2tNZzJUTDBkUkRJemwzOG8zYkMvaEUvakMvMTRCVDRHcWFZaTVi?=
 =?utf-8?B?RmJubFUweUFpRTB5dzdneHJCdzRrU2tEMjRVNHNhNDIxVHcrK2dhWnlQc01u?=
 =?utf-8?B?MUJHcStlaWxOdUtQNTVTMVkxWFBLWFI2aHBxTTBtbGVQYVQ1THllUk5yOE9X?=
 =?utf-8?B?NEJEckQxYlFmNkdhc0VwZEhFSXhxNE5xU205VkRxR2gxUEpyNmlNL2dBS21l?=
 =?utf-8?B?Vnd4cnNRUzgrR2RoWDNpbzBMbEhiMC9LMUJDTkQ2aUltK0V2SjZDc3BybzFW?=
 =?utf-8?B?RytqU2NISVdvZEgydjZiOFIvcGRGWFNWUkptQlJzSzdGVUVlQUJLUkVraHZW?=
 =?utf-8?B?c25HQTQ2TGk0NE9lbXlwNFVUYU9BYVdWT2hNSFZ0RUNtMUdGTE4ySW8wdkZs?=
 =?utf-8?B?VDNwWnFGVnBIQjJ5bU56MUhNT2pRaE44Y2YxRDFrVGF0cnVqNTFHaXlRNkFY?=
 =?utf-8?B?SVhNTXBOM214cU52V0dvVnhxTWJYVnNTQ3RzdDFXUDZueHg3Yk1wTFZTSG5p?=
 =?utf-8?B?cWtVU0pMNnM2YW9OSzJVNElEeDd6ZGRUcVFSUTNnRHlHd0E0KzJJK29zSmtF?=
 =?utf-8?B?U1BkMEZseFp6SnVNSSt5eUl1OGpZNml4TXByVlpwTmtFVDBQV2pUdW1IYVBw?=
 =?utf-8?B?aXppeE0zUUFzajJpWTkxZVJxS21WRE1iVmN0M080QzhwUkFBRG80R3ErRTk1?=
 =?utf-8?B?K2ZCdHBpeGUvMVl1RWl1SHo2S2xsMys0UzFMVjFyTmljcWlOYVRIOWtMQ1Fn?=
 =?utf-8?B?UHFYSGVucmE4LzMzRC9CZVp0UkRVTDBIR1VjRS9GbGxHaGI5Y1ptb2h2UVZP?=
 =?utf-8?B?THpRUkdSOTJOOE9WTXNCSEhRZVNKSnBmZ0daR1RQZDJVTXNxajIvUWgrdXpI?=
 =?utf-8?B?eFF0ZDRnWHdqMi9JRWpOOU5FUGVGMEtvZU5zNElnREpRNXpVWjdBTUQ5WnlJ?=
 =?utf-8?B?S015Tmw0NitPRTVPd1dtR3JKcGlqeHplTWZlMVV0a21KSXhLT3lEQm5CZEpL?=
 =?utf-8?B?dWkrbGNYUXB0UXg3SmhtSERIdGhzQTBWdUQ5UndBYVRzbndUU2djVWpnNzdv?=
 =?utf-8?B?dHkxTkR0L01TbElaZVhXZmUwT3JVQlg0NGtrTzRrMGROb1JDU2lzdWJiYVN3?=
 =?utf-8?B?czNnNHFzTml4M1Q2MHV6c3pSYWM4L2JrU09Jb2lPeUxsN3NSc3lxZHpLZ05E?=
 =?utf-8?B?MEEvQTdQekYwNGtOSXpKek1JOVM5emFHQWFrVTdIeHdRT2JZQWJZRVNydDha?=
 =?utf-8?B?cHJyRlZWMzBKY2s5bmpYTzJTTnF3Ry9oMXd4UW5pTzcyOXErZVpzS014SUFQ?=
 =?utf-8?B?SFR0ZTF0TnAwVm1BWlBSWVA2Tm5ySlBsN0VxWlUyMmQwS2NxRmpiVlJhWUxV?=
 =?utf-8?B?MjFrbGtCL3AzWjJxWSsxdDNqcjROUWIzQU1TVFRjUXFkVEFBVXVnYVRYdDRp?=
 =?utf-8?B?aVpWOXpSaWZUcjVVKzZSVzlpQ2lEbDB1bElxb211aGx4UHRyOWQ4MW5Rc3Ix?=
 =?utf-8?B?czV0aCtlTWNVbk9wRllUWHk4Q3Jic1JTQjZHcEZOUEdvSjR4amJ1MnZERXhX?=
 =?utf-8?B?WWhBUE1KdHc5M0JFYzFkQ3lxeEFQbDVWMWN6aFdUTmVXOVlBN3NTNmM4MXpC?=
 =?utf-8?B?b1lrYnFiVzhhc05FK0gzUE1zNmlKcThIaXQrN0cyUlJyOVM2Z1oyaTVkeXh2?=
 =?utf-8?B?eG52UjVqcmwzM1BkSlFnc3U0YXR6eGZtbE95UWNGUUkxd1ovZ0MvT2EyMVZC?=
 =?utf-8?B?SStLbWRyMW9KR3ZrUXN3MVlIWlM5K1hZQW0xVzVzaTl5bnQzMUFyVVlKVmo2?=
 =?utf-8?B?dFZaWnhhWnlBM2w1MHZONzRKdUpwWTV5aXVpdWJiUmZLTHlNUExNa045NW1V?=
 =?utf-8?B?dU5Tc1BQL2cxNHM5cm43TnhlWnRHRi8ra0hvaGc5Tm44cnNZY3ZFOGhuSnVF?=
 =?utf-8?Q?cq/VPI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:07:57.8058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d35b9e1-037b-45b8-4b29-08dd8267de40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7222

On Sat Apr 19, 2025 at 12:24 AM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:35PM +0100, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Introduce the ability to assign capabilities to a domain via its definit=
ion in
>> device tree. The first capability enabled to select is the control domai=
n
>> capability. The capability property is a bitfield in both the device tre=
e and
>> `struct boot_domain`.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

Thanks

Though now that CDF_hardware has been introduced to staging, this will have=
 to
change to introduce BUILD_CAPS_HARDWARE as well.

Cheers,
Alejandro

