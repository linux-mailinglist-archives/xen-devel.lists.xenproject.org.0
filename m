Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE287A9CC55
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 17:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968246.1357910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8KcP-0002lZ-56; Fri, 25 Apr 2025 15:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968246.1357910; Fri, 25 Apr 2025 15:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8KcP-0002iu-0q; Fri, 25 Apr 2025 15:05:33 +0000
Received: by outflank-mailman (input) for mailman id 968246;
 Fri, 25 Apr 2025 15:05:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fya8=XL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u8KcO-0002io-E4
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 15:05:32 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20610.outbound.protection.outlook.com
 [2a01:111:f403:2409::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8e76e02-21e6-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 17:05:28 +0200 (CEST)
Received: from MN2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:208:239::31)
 by DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 15:05:22 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::ed) by MN2PR08CA0026.outlook.office365.com
 (2603:10b6:208:239::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 15:05:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 15:05:22 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 10:05:20 -0500
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
X-Inumbo-ID: b8e76e02-21e6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiKNvbtYIxCr3Pugv05E2QKb9HFUOk+xNg8HhIpwsHJu8GL5S4zyFOvGWefyK787z4jp1NkaXlh3yiSMXbxmF95gJS1ar2jC3Jb+A/ZAHeRqRqYkyn8/SkpZkjQE+dxqjabDKsW2pvXB2akG3iNr8055a3CD+Zcq27Psoor+nabjvbyHqgPhfsZYn+lw467RPNT+LjlCR50vpvu+l+s3ZkVHwZxhBLuq5ZCCmElHU//UZl/GCs93O9DW4qJimNrsmLrmBkKk4I7+SErzOam3K8OUGBqvVlAOtHewO4mTL7ij67Nvqe5ohaG9nNzYyrAy79hK7s/sbKywAocSAb09kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYCxa/vBeVlmOwio7PE+M4cuHvrml2IC/+3T8IpQ/ZQ=;
 b=DWZnYD6rBVyJmYejsw46tvRX8nYSpHDNHa0raae9uUgCkAKGPWm1nEgK5vxa1/Ob+6VrcZMvmgJVTAZOGMqKYVfvJ5qd95UrRQnEhMeCfGiE3Q7ySO0X/EOyiQ+jh4LmcBtWnf+fw43Dnds7nxFQCgmxXu6zhl6cbkrQshzDFusxT+Cb6BF0wZ2tDY0jEM2KfzkUdAt3lJ9Y8NRLFbgI2pa8g+sc9rTkaMBnTWxuiMr6hGXSbcmC3wkxuHo2hzxIyfBeBkxihmVxuAPKhNK4AqbvwkxgaiUt851PLcGtW8HWEryRIYaueDHJH1neTGtwNkaWtHwZQuo8jy5+dLyA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYCxa/vBeVlmOwio7PE+M4cuHvrml2IC/+3T8IpQ/ZQ=;
 b=FpIllVfE9qifWefySTuONWnHgN1A6gE4UUUCFu1VFqlb8crlMwum3swq7HJUVFdgYu74liIoIgDUkdorGE0xnUS1fBtz+rF+NF4rXuRm8EGv68xOlcVgDujPrWSZt4+dj1lpHe/3LeIZn0tIsW54qQd/ApFClUnzmJCFFSTlLfk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Apr 2025 16:05:19 +0100
Message-ID: <D9FT9CGX7VBK.1SKSWAY7UG6SV@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: Re: [RFC 03/38] x86/hyperlaunch: convert max vcpu determination to
 domain builder
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-4-dpsmith@apertussolutions.com>
 <b3069950-ac03-4603-866c-27c6166bfecf@amd.com>
In-Reply-To: <b3069950-ac03-4603-866c-27c6166bfecf@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DM6PR12MB4057:EE_
X-MS-Office365-Filtering-Correlation-Id: cf75f65b-d16e-4262-2d7f-08dd840a99e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm5Ya3FiakNESkhMR0dVYkhzY25VdnVLSnJwZjNkMkVpTlhoa0pFSnZQVnZO?=
 =?utf-8?B?NXhhRW1QR0JFZVhqUi9JUmgyN016ZkJpNHhFbzFrYWwvajNOZlJVK0lMcHNh?=
 =?utf-8?B?ZC9LdDBndzVHVEdDWkUwUWZGem5aY1dPV29OTy9vQ0NwQmt4dHpxN3BMWWhT?=
 =?utf-8?B?L0xwS3NRcEJYVTd1MENjMkthaEhsVU5JRkcvMnhNemJKdVdDT25uek5pV1Ji?=
 =?utf-8?B?d0JXUktzQlZrUGx2cXJ0NDZmQ3ZHVUltNHVoY3lJdWxLZjZwSENCU1hYTUJE?=
 =?utf-8?B?cHM2UmRCN0MxdEVKcEJsaFB6eE5aVzhkWHdqSjU1M0c5SVNFdUIxNGhXeXdX?=
 =?utf-8?B?a2o3QVpkK2hWb3hFSDBQZVgydGxrWGk5MU5XNWtIcDdFNVpKRFZqSnptQXBS?=
 =?utf-8?B?TGU5UythK3RDdzhhN1hlOTRiUjZBcGNEaVpGT2VtZ0ZuMThkcC9tWWtJeFFs?=
 =?utf-8?B?NWpsWjhnNHdHUHhPSTRZNXFtT3Y5dCtLbDRxNWYxdUhEUExoa1pvc3ZMRzRM?=
 =?utf-8?B?aGgvOVpFOUtYYUlyalJ3OVM4djBpS1E3cnBoaGQvYmlkNC8vZ2V2a2lXRlJJ?=
 =?utf-8?B?MlZzekUrUGpvZFY3ckFpMGNZV1ZDRGxtYnNubUx0T3NBNFhHM3g3Ym5WbS9Y?=
 =?utf-8?B?UmNqUFMrbXUxQ2FOZHZ5WFY4SFVTL0hBN3MraVBMZGtuenArQUZrbkduR0pm?=
 =?utf-8?B?YXdnS3FlRDFja2xWb1hEK3c3MG15NkpTN05najVpWlFCalJralB4MkFjdmZy?=
 =?utf-8?B?Y25tVHpudlByL2JqNkpjR1krWnJNbjNSRE9XWksrSjdsMjZQNEhVZXc1V0kz?=
 =?utf-8?B?ZWtCY3FFYTYzM1g2VFBJaVVMeVk2SWxWNHNjemxhQjJibDBNQ3dpK1dVNGl5?=
 =?utf-8?B?aWxMWVpaZVQvTGNtL1RWZ2lmeWlNWVJzNm5mcGhDTERCTlR4eVBCbXFlcm5Y?=
 =?utf-8?B?L0IzYUFqT3U1RFVLNDAyWlA2aFI0dkZCeXQ4U0lUT1dVRUFqQm9XOWNiOFN3?=
 =?utf-8?B?ZHdtOHVrSWI0R1ZDQmYxb1RwTGtxT2ZSZUtBRlNzU3ZrOG9LVFovWDBMelMz?=
 =?utf-8?B?TGRPRDJqbm9xS2VGWW1FWDJKRkxrWDVLdzcyS2s4cHkvMlMvQlJyTDRCZXZk?=
 =?utf-8?B?NndheFRpUTBhT01TOWpFczVnSlJobkJlUEFhWjRnL1d3dllKeUc5UDY2c2px?=
 =?utf-8?B?aUdoMUpHVWRaaktUM1dFc2x4YnpaQlJLVlg5RWRWWG0xdTZZVnRid0hqL1cz?=
 =?utf-8?B?TDNEUDhXeE01RzA5ZVpKdWdQYmFIZ1BiSzZEUEd6SHRNNlBmNXpYNGNMY1Jt?=
 =?utf-8?B?bWZreStDU0s1cktGVkxoc2F4RitjL2kvZzA0MUdDakMxY0JMbzJYK3lmemQy?=
 =?utf-8?B?bWlubEFFSE5qbE5RTXppNm9ka2pIMmY4UlNGNzhvWkVBR3ZXbHpKUTlJR0lI?=
 =?utf-8?B?ZEVhYTVDY0tlZCtWSXU5RncyUFBqUDg5M015aUpyQVZNOGRPdmhoTW9NaDJa?=
 =?utf-8?B?dFZZZjVtWjhDcnV3QnFFcEl2TnhPZVY3Rmh3M0t4YklhNnU4Z29QZENoa3Vl?=
 =?utf-8?B?c2E4Q3BKWVh0MVl0OFZZKzhMMzVEL3NuTnZoSG1CLzFMY2Z0WUhlR2dPTkxB?=
 =?utf-8?B?eXI4cGtFQ3A5b095cXljaDlmc2krcXNucDNjRG1FNyt4YXRBVi9ucFhJL0t4?=
 =?utf-8?B?Vm5SQUdYTlVGZ0czTmRRL2Fqb0wrc3dURTRlbm5zVUpLbjluSVNjeG80a3E4?=
 =?utf-8?B?ZkU1dXJVakVyUGMwRlRnNVphZWYzOEpBM3RIbytGOVhNUzJPWnZZY09FS09R?=
 =?utf-8?B?cnQ0ZC9IajVJVloyTkRVelZwZC9IN2tJTDhYQmFoK0RQQkZqRDZkZEswM1Vq?=
 =?utf-8?B?Y1dWY2hHTE5mb3ZWQTlOdi9IMENxQTIzWFBqbUhSS091c3RFTk0rVkxOTjB1?=
 =?utf-8?B?Z09CdmhRTHpCdTViUXJNNzU2dm0vKzhJcFZsbkgzcmR1M2t6S01Xdnh3THFr?=
 =?utf-8?B?Mk8rTUFvaFBXYzh6QzdKOGNCcGtNOW93R3dSQ2VBV0xoVnEraWNWaGdqOVR6?=
 =?utf-8?Q?rZfvaR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 15:05:22.2588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf75f65b-d16e-4262-2d7f-08dd840a99e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057

On Tue Apr 22, 2025 at 9:36 PM BST, Jason Andryuk wrote:
> On 2025-04-19 18:07, Daniel P. Smith wrote:
>> +        limit =3D dom0_max_vcpus();
>
> dom0_max_vcpus() applies Xen's dom0_max_vcpus command line option.  That=
=20
> is desirable for a traditional dom0.  For a disaggregated, Hyperlaunch=20
> system, I'm not sure it's appropriate.  Considering there can multiple=20
> control domains, it's more questionable.
>
> Might it be better to only apply Xen "dom0" command line options to=20
> non-hyperlaunch dom0?  Or a domain with all of=20
> BUILD_CAPS_CONTROL/HARDWARE/XENSTORE?

Alternatively, why not apply it to the hardware domain instead? That's
guaranteed to be (at most) one, and will still function appropriately
when doing non-DTB based boots.

I'll make this adjustment while rebasing this rfc against my latest
hlaunch series.

>
> I guess it could stay as-is, but it seems unusual.

And would probably be particularly weird when it applies to all your
control domains and _not to your hardware domain, which incidentally is
the one domain with domid 0.

>
> Regards,
> Jason

Cheers,
Alejandro

