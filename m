Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7783AF5C0C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 17:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031336.1405144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyz1-00089C-3z; Wed, 02 Jul 2025 15:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031336.1405144; Wed, 02 Jul 2025 15:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyz1-000867-0W; Wed, 02 Jul 2025 15:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1031336;
 Wed, 02 Jul 2025 15:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWS=ZP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWyz0-000860-2G
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 15:02:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2415::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a7e1284-5755-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 17:02:43 +0200 (CEST)
Received: from PH0PR07CA0019.namprd07.prod.outlook.com (2603:10b6:510:5::24)
 by IA0PR12MB8228.namprd12.prod.outlook.com (2603:10b6:208:402::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:02:39 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::da) by PH0PR07CA0019.outlook.office365.com
 (2603:10b6:510:5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 15:02:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 15:02:38 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:02:37 -0500
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
X-Inumbo-ID: 9a7e1284-5755-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7RUxPvze4HGKDfSbWOSP+VRpNxyL0hC/BwZXQykqUf5AlqpKlYNRrewocCja1JPt3jyCR+7Wl/0FKUStPPAotTl/t71CIu+DzuICtEY+VtVvV/LYREbZfRNLZci+91Qs4yw28OUn/avX8ZlAiDLtvi6yeKxMQyhmLAEFW6T8X6/eZQhqfC9i2sY//DH/C7juAR+WCqvmzXYj+gZaFocs7eoYO+ixiu83mkYLW6v5JiX5XUnMT+KdC2zKKGs0IAuN4+AHGOWp5Q+jn0evbH+L9xv1hPCt5tlwcppGg35YJF6s0w9Yo159d2/k1b5JRqVc2/l1Ze2Bfo/7eUsZAA27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nILOuudRu0zZK7VGZvWtxD1HRqomg/c3ZslAFDarehE=;
 b=lL8DllkHPWXuqKVduR44y+CccrRLdpfdfaW+RQiLJHg6xZwjvbfQrHFrkh7FT79Rn2PtZudHiGWYzgnvbgWAqnP+Qci/wq+yRQR191dzZctuWZNzOyGr+gT17ZqNY6PEjgKCwIMWGQgFnxamTx9jaUMlstlb77AuvA/6f0CNWBGQvIeJ7reTqybIiU6QkwxYZ96wgiXziZd2vELRyCp9S1KjDaNlG2x1YqygLGNu0DpyxPp0CK94BxBxeKS6KTjHTQ7uToJSPw5NDiQuKSbr9MK6bWfmomZNhpWYfVLTy2kQekMUUyyN+eqWpcCVB78R2gSQ6/L1AMFa6Vu1cjbDLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nILOuudRu0zZK7VGZvWtxD1HRqomg/c3ZslAFDarehE=;
 b=NIWbbKTYpW0PMHGld5wXlK196pxFl1fbnaqNLZg+8q9gGX8n212N+/iDxyDe5jHp9lYECny+bTxEQdDTe8pAaPFXkj5PczT+h06NVnjVemPv1eo88Rz2yw/+AKKdc+WjUvUpAUhl7w0VMvyurKRYj6ci7Ulssf3IXaPq1eKZGDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 2 Jul 2025 17:02:37 +0200
Message-ID: <DB1NSBHY1P9Q.3HCNTHXLCEZX5@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 01/10] x86: Replace arch-specific boot_module with
 common one
From: Alejandro Vallejo <agarciav@amd.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-2-agarciav@amd.com>
 <1a2faa5c-9dcd-4d09-a5d5-dc692eef8c8c@suse.com>
In-Reply-To: <1a2faa5c-9dcd-4d09-a5d5-dc692eef8c8c@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|IA0PR12MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 180a22da-9026-44cb-ffa4-08ddb9797c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2xzUUtLZVVTRjZUQll0VDhyVitnR0tMV3Q5WnFodm4ybmtTOWlFTitrbnQ4?=
 =?utf-8?B?cm04Qm8zeEk3ejJRUit4eGZyUVRqN3RSNVpDUnBnYk52MHhORmdpSHJoU2dK?=
 =?utf-8?B?b0ZjcnRWUGZaYkFHRjhXdTNIa0NNN1QzWVRmVncyRlo3ZFZrWDVGcHVYMW1H?=
 =?utf-8?B?bkV1WUNjR2IxYm4xRjNNektFaVQ4blgyU3Vnd0xTaTBFaHE3TU5seEoyVlox?=
 =?utf-8?B?Mkkrd3M0UThmZVpySWVjVDArT1BySWR3QStjOGJ2enZSSXU2Ylo0enA1c0JL?=
 =?utf-8?B?eWxUOXdnZU91WFNLUWtqdVhpUHRySG9SbkVuMjB5WHF1elRPTVpsWEs1WEIz?=
 =?utf-8?B?TVNkOUF6NzFjbFNIMFl1QU5tVEQ2VzlxQ2hneHA1Y05BcXE5ejQzc0dFZ2tv?=
 =?utf-8?B?R2czWmtIck1BSk1hZnpsRHowYjVlRUlVQWd3ck9teklaMTlYZlIyM1M5Q0xR?=
 =?utf-8?B?L1BEcVVucjdnZ3pzSHJqeG94THNYTFBGaGNGZmNFd3ZIL2xxS2t0SXBHVWVI?=
 =?utf-8?B?eFA3aTI4ckthVkNBbVRhOC9SUUppcm12Q1AyMkFmVXBHREJjQnZjemlDeTE5?=
 =?utf-8?B?aXJlanZTOXMxb3Z1dldEKzc2aW5HamxJUTJXbzE0Y2U0Z01QalFMNy8xQ1dQ?=
 =?utf-8?B?NHdLbjYvc3BycjhvYmNCNkZMRlpOdTRUUXZoQ0JUemRuNUF1ZFlIT3ZuVWFT?=
 =?utf-8?B?L1FLVU1TcmdBZU81TktlQ3lBbm92aTNoNldRTFNnQTJFTjhGcWRsRWF6UUI0?=
 =?utf-8?B?UnE4VmxwcDZ3VUZuTytWN1B3ZDcxSzc3Qm16SFZ4R2VKWWdKL1QxWld6MDMz?=
 =?utf-8?B?UEhxbVU0T1VsVHlzdFpIVExqQUk2bTZUUUNoVi8rNkFWTUdBQTQ5Z1k2UnlQ?=
 =?utf-8?B?dmVUNldPbWI4R1B6c2tmSTZXdEhkZ210UlYrNExQRUZUU2RnaWRhV0g5aU9w?=
 =?utf-8?B?Vmhnd3RqcGphV0hvUXpRbXZlaDE4U3c4ZUxqWlhUdXIxWTVaSm96SnhQWng4?=
 =?utf-8?B?TnlCbm91bFdtWFdqNDN3MmExK0g1NGFVTWt6SjJxWVBOSnNQdWVnZGFNR2NY?=
 =?utf-8?B?REp1QlNlRUg4Szk5ZFhod2pNdlMyTk5EUkk2aEFjZ2phU2NFeDhWOExkNzgz?=
 =?utf-8?B?RjJXcW83a2pYYjZhbmtOdEJhcUQ1dXczK2JBcjN6VUJhcVIwQ2xKcHJNeHFv?=
 =?utf-8?B?eWdiQ29BRGhZbHVaK2tsZDErRjViVmxMQXA5ZEhwREUyMUs5dkFQcmh4aWFE?=
 =?utf-8?B?WE5oOGw4cFltMGV5VnBtY1RmYUUrMEwwQVV3alVmckhseDMrWWtiSVQ0MkRX?=
 =?utf-8?B?NkxEbFZCb2lOMG5Cd3FtczZOY000V3Awejd0MVlLYnMzS0svWTk5SnZYVEh5?=
 =?utf-8?B?UFZTL3JLODVTRFJBVlozYzJEOUNKVXpoZk1yVi9jZTJMVHNsa2t2b2NHNTRj?=
 =?utf-8?B?TG82V3phTmFqNEpxUXVTODZXVEgvSUtnTFVhbU1PNmZKR3ZTVXZWMnlLeW8y?=
 =?utf-8?B?Nkl5cXFqVWlHOE5rMi8wV1cxcXpzU1NnMkhNTGZBL2ZFRFFJc2dsZGVadGd0?=
 =?utf-8?B?c1I1VzA5TitsNnB3MGwrYWdlektMMWRHdjZKUTI1aXYzR1cwbStIei8vVU41?=
 =?utf-8?B?SkYxbzJNSVBNZE00V3h6eWoxaWJNaGhCNktpbHZYWS9VdEFVWVhUd3JXRHQy?=
 =?utf-8?B?NjI1WmtKaytmUk50b3paQy9zRjVsK3dPSERpc2pIVjZ4MGh0dHM3NzVuTlpY?=
 =?utf-8?B?RkkrVUk1VE92YWRZcjFiTkYvUTF4MzBPQ1FVc0dCRWdENWxnNkEySHhoZXl1?=
 =?utf-8?B?S3pKOGpCcGE4amZLR1E3SWJPeWVsUkZyMm8zaUx4WnJmT0V4Z0xWWjdtUTkr?=
 =?utf-8?B?RVYwcHdFTHBJek9mTHY4RHlsWkFnM3gwZ1RramV1K0tHOGJYSmVONDZMZG95?=
 =?utf-8?B?T3pzQWxVaFAzTUVLcGpvdkorTUFxcHE2ZFhRZzNFeGN1SWZvN1haamNGTjk0?=
 =?utf-8?B?TkYydDZjaitBNTBZdGVsWkptNzdON1NQRWlTb0l2ZHRqeklWTFdsTWh2RXB2?=
 =?utf-8?Q?UEgG32?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:02:38.7350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 180a22da-9026-44cb-ffa4-08ddb9797c88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8228

On Wed Jul 2, 2025 at 2:43 PM CEST, Jan Beulich wrote:
> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>> These types resemble each other very closely in layout and intent,
>> and with "struct boot_module" already in common code it makes perfect
>> sense to merge them. In order to do so, add an arch-specific area for
>> x86-specific tidbits, and rename identical fields with conflicting
>> names.
>>=20
>> No functional change intended.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>
> I'm largely okay with this change, just one question:
>
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -7,6 +7,10 @@
>>  #include <xen/macros.h>
>>  #include <xen/xmalloc.h>
>> =20
>> +#if __has_include(<asm/bootfdt.h>)
>> +#include <asm/bootfdt.h>
>> +#endif
>> +
>>  #define MIN_FDT_ALIGN 8
>> =20
>>  #define NR_MEM_BANKS 256
>> @@ -108,6 +112,10 @@ struct boot_module {
>>      bool domU;
>>      paddr_t start;
>>      paddr_t size;
>> +
>> +#if __has_include(<asm/bootfdt.h>)
>> +    struct arch_boot_module arch;
>> +#endif
>>  };
>
> The pre-existing domU field isn't used by x86. Shouldn't that move into A=
rm's
> (to be created) struct arch_boot_module? Or is that intended to become
> dependent upon CONFIG_DOM0LESS_BOOT? (While we apparently didn't adopt Mi=
sra
> rule 2.2, this is imo precisely the situation where we would better follo=
w it:
> An unused struct field raises questions.)

That can be moved to an arch-specific header, yes.

I expect that domU field to eventually drop after dom0less adopts the
more powerful hyperlaunch bindings for privilege separation. At that point
it doesn't matter whether a domain is a domU or not, it's jut a domain to b=
e
constructed.

Cheers,
Alejandro

