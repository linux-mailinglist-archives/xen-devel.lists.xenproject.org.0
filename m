Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517E2ADE9EB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 13:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019071.1395928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRqx3-0005mW-1K; Wed, 18 Jun 2025 11:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019071.1395928; Wed, 18 Jun 2025 11:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRqx2-0005l5-Tz; Wed, 18 Jun 2025 11:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1019071;
 Wed, 18 Jun 2025 11:27:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQRF=ZB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRqx1-0005kz-54
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 11:27:31 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2413::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eb95f51-4c37-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 13:27:15 +0200 (CEST)
Received: from DM6PR03CA0092.namprd03.prod.outlook.com (2603:10b6:5:333::25)
 by CH3PR12MB8728.namprd12.prod.outlook.com (2603:10b6:610:171::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 11:27:11 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:333:cafe::61) by DM6PR03CA0092.outlook.office365.com
 (2603:10b6:5:333::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.30 via Frontend Transport; Wed,
 18 Jun 2025 11:27:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 11:27:10 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 06:27:08 -0500
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
X-Inumbo-ID: 2eb95f51-4c37-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5bVQbkm7PkhixT3QmX7bPFGazmuCDfhRw/P/PaNCb8Bnwkbpohcq7P2XFDJk/bkXsZYBw8RMKtKkDU1iGYQ+8Wvp0x4dS3oLtNFcXXoct5R09cQtNGZgAXe/NPYk4dWOi0N4lX6vzoNJrr5nidlyv8mAVH7Jf61AS/AcpRxKzS5Ao9YGPBgGrxT/Mho0cgPAdbNkhqRuI8aB0YZWhvyra8LYbi0NL4rP89LLbrzDpurco9u3PFzD8lYzQDxmprlkjO6coYztucml4N0nxItmT25/Bo0iDo8n0QwGHMvQNg1PqY8dm84n/mFLkA5Gg0bdweh8ljZfRii1GiyhRp4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWPZS55WWSHLHUZtdI+rkuAR3JOR9CRD/RZ+ZiQf0yw=;
 b=ugsu8xV/hT0QdBmmx4x5JQrUv4CdCpZzy5nM4JS35xWUQ/h6Zgckl9MyXQT8f+TzJAU+YQtrrWrdw9NWb4+dqb4C0uQwPF/ZgAbBafeOKuuugeqh/M7KMmRkD6t59qrYK5doLiue7RMh1OC04/XrhXi7/eP+bZhoFaFH2laq2SyYVY2bm0NpptGaHeF0dpZYpCobzwEpY0ZMZF8XW4hignDTDdtGSUCmhS+zLwoqZk9nzl+p9EQbjbQ5VYz94upX3G30QyHxH/C4SgCCW3hNx7dncuRdIEX3WZklxqYI+CYPOGl+chwT0ozL8eS1Q16HhKzIT5GU6J+AdZGd+tQwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWPZS55WWSHLHUZtdI+rkuAR3JOR9CRD/RZ+ZiQf0yw=;
 b=BZjOhxVhI2y6XyK6kpkzfmhxNedylARpzIQ+CY7uml0vZF70hY0i9FGOO4L4dnmcQzPDHQYhmJLSO6EdMOh/K70s4vhKGAqsG0PclLA+e+pfIYX06vge9ICjitAPgR+r2hsocwkEBSxgeOjGWDECUUanqTWJwSQ4PmHuuKuxfgU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Jun 2025 13:27:07 +0200
Message-ID: <DAPMFOV5M5KX.17TFBM7DK6PL0@amd.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2] xen/dt: Remove loop in dt_read_number()
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250617171358.670642-1-agarciav@amd.com>
 <a1b59e2d-0b18-406f-86e9-1b2a737a58e9@amd.com>
In-Reply-To: <a1b59e2d-0b18-406f-86e9-1b2a737a58e9@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|CH3PR12MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fff05df-19e4-453e-77a7-08ddae5b10e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3NERVNwSW9lelhhQjBIajBoMVpyczVDWGk1dmU2NlR3SVRENTRsSmM2QmVF?=
 =?utf-8?B?RzI0U1lkZWIybGtvMUVIUHNXRk1DL3ZodUxsOWRWRENrT3Z0ME1JNXI0Z21G?=
 =?utf-8?B?MEFsdnc2R09iNWZ3RWpyZjJybHo5WFhLaXNLMi9LN2xlL3I1aW1RTWZRTjN2?=
 =?utf-8?B?N0FhR3k3cWE4KzBReXpWaHpINlFtVjlKR1p5MC9BZmQrempUb3dYcXdYbDZu?=
 =?utf-8?B?emxPQk5zd1Z6YkxoZGJ6UVdDaVJEdWtnUFRhcnRoVGN2Sk5XeFdJVUtRMHFO?=
 =?utf-8?B?N3F6YklTRlNpbWpWN1JxaVRNaDdCSFBoUlE4eGlpaXd5ckNuaXM4SmdteHkr?=
 =?utf-8?B?K3hMSFo0V3dZZmx2WWdZNnV1bDhBN3VaOFNLQmJDRlNEajRKQWxZK2xuV08w?=
 =?utf-8?B?Um1kMUNMRTNIOXF2aktCM3JiaWhPQU1TL1ZuOU9RR3hXSVVBa24zdDROVzJr?=
 =?utf-8?B?eDA2Y1NmNGlGMFpqTVlBeCt4ZlArUTMzNk1nTHA5RmwvKzFSVC9aZWtrc01H?=
 =?utf-8?B?MVVUcWVtckhYV3FGMDFDditMandxV200U1A1QXo1amRjV1dyWWZKcS9kaGVC?=
 =?utf-8?B?bURqL29aOUJjZU9CMkdVUGdSbnlYMGVkTWVSeXhnUmhpTS83c0NYdlk2QktW?=
 =?utf-8?B?MlQ5eFpVM3VwWFllcWJvUjhycTZucmZ2UU10OEE1NzZoMGdjcTVwd3ViUWxS?=
 =?utf-8?B?a3VtbEZWV2h1VmJiYi9YTTNRY2lLd3BoNy9LdkpROFEvaFV1am1JUVhYR091?=
 =?utf-8?B?eTJWVFJKblUvNzk3TGxhS3VPQXdNZmJOeCt4V3ExRUlPc1FDU1llQnR0eXQz?=
 =?utf-8?B?RW9SUzZiMlY2bU15cXpVR09XZWgrQWkxeDV4bHBweUJMNXdadCtqQ2tFZnNR?=
 =?utf-8?B?eFNLVGgxV0hRRDdJcWd6OERJSXlPOU1sbUtQSTMyRTRjNjVyQ3Vac0hRYUxE?=
 =?utf-8?B?QUt6TU5uQnJHUGpscDFaaGRTaHVra0RwcHFHaC9uVDlSUXZQUll0NnJkQ25q?=
 =?utf-8?B?eFB6NkRtY0xaZ1FRT2NmNWk0anNaSVdoV3BuZ1E5Slozb29yRStEdUVZbFo5?=
 =?utf-8?B?R01ybGdjQTYva3pSNkhuUEhrMnd2N1VwUjN3bGI0Z0l3Sk0zY1BPcldCVldS?=
 =?utf-8?B?QTRHYWVFVDNjdU4vVjUzY0tRc1Yxd0JCWU5RREpJRjNPak0yR2RJVGRJeVpL?=
 =?utf-8?B?VHR3SnAvcTNCRGRpRVF2Syt3SFlNNHdtK2ZRd1B6TVU5OVBKM0ZzSUN1T3hz?=
 =?utf-8?B?UEVycmFCdThqZVJ4TGVya1ZXdmJBMVVndDFoM2dwOXdNK3lBVzlMdnluYk5l?=
 =?utf-8?B?NUlvakFSaG9pN2ZNdERpSCt0TnZSeityMVlxZk43UHROSEZoZlZpYUNDQnlC?=
 =?utf-8?B?NXhaMDBkekJGZHE4d3FuUDVvZ2U4bnhsUVp3QXpQR0NvSmYzWC9FdXZkWmVI?=
 =?utf-8?B?VlRSQ3NYMlhucDBHY0JjRUhhbXUxOHhpdnBYcnR1NmxuUXBsWlltWXRwTlBu?=
 =?utf-8?B?YUJhSXpGRk16R1pWM2EyckJFR3g2MWQ4WEdDWjlTNWk4MjEvQmRHUlJxeDRL?=
 =?utf-8?B?bXNKNno0UHNqK0VNUmxHZUJzbXRqV1REUzUxZHU2SHRNT3crbVVwb2JOeFE2?=
 =?utf-8?B?d000elZwZ3cyN09JVmRacENpd2Q5bzlYMlpndkx5a0NacUJnT21mazJIV0k3?=
 =?utf-8?B?eHRTNm5hRVlXazVtTFRuQmNxYVVhR2RUbHZJdTBUWTNSNmVzbGZGUlhlUEl4?=
 =?utf-8?B?QmJ2S3BhSEZXQkdYRFl5cnJ5blVuN0NsTDMyWlNBOHRxQjR1WU9uSFlNOTZB?=
 =?utf-8?B?SFdtckdCcEZRenNQVnVmbFhDT1ZvbzBMME1qVmh3S2JWVVJLOUpZQXdueUdJ?=
 =?utf-8?B?VUM4R29WTnpHK1RFK0JTenVPdU9jaS90ckJXeEJXRDdzRk9RTG42OUE1Vnhm?=
 =?utf-8?B?ZjlQUmVMK2tXazZ1QUNQOGxUYXpnTDZtZ3FESW9OMGdhMjlVNkJYeW9IalRr?=
 =?utf-8?B?NmZEbGlKQVFYLy9wL3h2RVlLdG5BeldIUDFpRkZkNSthVlJhOVZ5Q0o5aTdx?=
 =?utf-8?Q?t1EUSV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 11:27:10.4513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fff05df-19e4-453e-77a7-08ddae5b10e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8728

On Wed Jun 18, 2025 at 9:06 AM CEST, Michal Orzel wrote:
>
>
> On 17/06/2025 19:13, Alejandro Vallejo wrote:
>> The DT spec declares only two number types for a property: u32 and u64,
>> as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
>> with a switch statement. Default to a size of 1 cell in the nonsensical
>> size case, with a warning printed on the Xen console.
>>=20
>> Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v2:
>>   * Added missing `break` on the `case 2:` branch and added ASSERT_UNREA=
CHABLE() to the deafult path
>> ---
>>  xen/include/xen/device_tree.h | 17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree=
.h
>> index 75017e4266..2ec668b94a 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -261,10 +261,21 @@ void intc_dt_preinit(void);
>>  /* Helper to read a big number; size is in cells (not bytes) */
>>  static inline u64 dt_read_number(const __be32 *cell, int size)
>>  {
>> -    u64 r =3D 0;
>> +    u64 r =3D be32_to_cpu(*cell);
>> +
>> +    switch ( size )
>> +    {
>> +    case 1:
>> +        break;
>> +    case 2:
>> +        r =3D (r << 32) | be32_to_cpu(cell[1]);
>> +        break;
>> +    default:
>> +        // Nonsensical size. default to 1.
> I wonder why there are so many examples of device trees in Linux with
> #address-cells =3D <3>? Also, libfdt defines FDT_MAX_NCELLS as 4 with com=
ment:
> "maximum value for #address-cells and #size-cells" but I guess it follows=
 the
> IEE1275 standard and DT spec "is loosely related" to it.
>
> ~Michal

I could imagine DT's encoding CHERI 64bit capabilities as addresses, which =
could
require 4 cells. Needless to say, this function wouldn't even be in the top=
 10
biggest problems in making Xen happy running on a CHERI-capable processor.

As for #address-cells =3D <3>, I really can't think of a reason except test=
ing
theoretical corner cases. =20

Cheers,
Alejandro

