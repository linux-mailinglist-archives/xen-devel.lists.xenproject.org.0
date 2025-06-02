Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B21ACB271
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003533.1383107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6Bx-0006Pk-Ga; Mon, 02 Jun 2025 14:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003533.1383107; Mon, 02 Jun 2025 14:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6Bx-0006O3-Dk; Mon, 02 Jun 2025 14:31:09 +0000
Received: by outflank-mailman (input) for mailman id 1003533;
 Mon, 02 Jun 2025 14:31:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM6Bv-0006Nx-R0
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:31:07 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2407::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37862069-3fbe-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 16:31:06 +0200 (CEST)
Received: from BY5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:1d0::33)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 2 Jun
 2025 14:31:00 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::3b) by BY5PR04CA0023.outlook.office365.com
 (2603:10b6:a03:1d0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Mon,
 2 Jun 2025 14:31:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 14:31:00 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 09:30:57 -0500
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
X-Inumbo-ID: 37862069-3fbe-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgylZAB+tO8GOrpFvLqcBMQbf6yKFOf9ktAdf8NCyEukiwe9uFD9lcaM+uXkfSLtbgQCCR0Km7LuUOV2VIWtKhGc1+kximjxoWUD0kdum3Zq/0DG2kufHYTe2nbWkDCvM4OHyy5yzVvfRNC99MEunN/E1a7qzY1i4VPGAibL3U3xCCLDGxlTwkYwzxETFoq+6kQmghngFoMjqQ7NJntStYn/KYZCADRva/47XI4Dxo/+Cvyi0jObmJCggnkRVgeQHIfrbL1QDNOzNhAozJr9xTN/uQpDWheVZwZBZROsDZktn8vJkRtRTfjX1duVPXt2boxBMoSypVsoVz/gJoZRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DztQnG2UMubC+EwWW6HqFUliBpkKn8jWegdjsxqAeQo=;
 b=AwKwfzr6A8ESISWbCt9ivfcUib6cOkfw+2wigtTp2TgOVQ5VqRgcdSteFtsCuCj5AjOPBCBYWoN+Ehzbg0JelexdaMw6fIC1oJLaNt5Isz4TrosTJGMiVPpDs+8tnpJxEweOLvb471h57WOQyc7EpnvBSrZ5zD/HBxTllbUzTC59bzrh0GWqYQIiFNI9SWUK5ARjTfJ8htj9UthFLw3Q4laefXglI8whZdUNzz37AHoM83xdEud1k6qDWNOESYtB+9c5aIWOyoV8wFdsobVDrZIMAj6aRWTnW0gfKuiXnzveGA25dvkV8/QZZkK5iQgooBgI3qEQEDFIJ0ads1qGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DztQnG2UMubC+EwWW6HqFUliBpkKn8jWegdjsxqAeQo=;
 b=v1YPEjC04Iw9gfXby15HUcCIfXTNrxHOOHsgCsr7Cb3bNj4TJ2Cjtj7EJaQKF1DggH1NTMkaD284gzfjTCITK2InL//B3kiWV5DxgXW9C0MVwdO+We78WdMcZwjkY/cznbEv6bMU/q1uYKsHcTrTNTikrOUiQsRftj/VKwUE948=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 16:30:56 +0200
Message-ID: <DAC4BPMR5N3A.3JYN5WXUSRGBG@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h
 and xen/grant_table.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-8-agarciav@amd.com>
 <5f3de127-70cd-422f-a368-6c23d83c6cf9@suse.com>
In-Reply-To: <5f3de127-70cd-422f-a368-6c23d83c6cf9@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|DM4PR12MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: fad0d522-ee4f-4847-78a3-08dda1e2188f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Slgyd1FFOXNyUmdubVEwYU56ditNUG51elZ1bFB2ZE53cWFJUnJ6dUpGVUw3?=
 =?utf-8?B?bk9OeTFvZUdiL2JVQmpaeHNyUm5LMENSUWpEVTRuUUFlTDRPQldXaUhYQzgw?=
 =?utf-8?B?UWROZEkxMHhjYTBkWmZWaXpaczQvczBxTlZUM3dDRzFMNzBDNDc1amRLdWE1?=
 =?utf-8?B?ZVdmZVV3SExvUFJ3YXgyQ3JqaFBndldxbG1vVDN6WDNaV2w0eUxKNE9CL2Yx?=
 =?utf-8?B?L0MyTGVEWGVTNEhtV005c1JPOGRqaXRPVXJ5Ym5zN1l4bUNzYVNGMzhkSTdx?=
 =?utf-8?B?RlhjYWRQUWp0Uk92OGxhd0lNWWxJQitUQUVmaDRBNG1taXVUUGRVMHUxWEly?=
 =?utf-8?B?ZWg1dDJhR25Ua0NaNldITzE0L0Y2TEVuOXZjVHlIMmdHRlJPMXlJZkZhTDlu?=
 =?utf-8?B?ZGdaR05CdGhRYVE4QmQwSkMyNXVGOUNaQmdseFhOL2hMZFdMeUozWElQUXh2?=
 =?utf-8?B?SDVpa3VJVEF4RFMyRHdiaWxVSjIzWUh2anVvbjJiZ3VjeCtlcUFEbEUrbU9a?=
 =?utf-8?B?TWlOb2h6Z3VzVmtDa29ubGthbGJsZjg2MTlYbDdtbkJaWXdGVTFsckkrOTly?=
 =?utf-8?B?V21TcmpZM3ZidHpiazg2clNuK3lFYzU5ZmUzOHQ5clYxcGNKdEo2ODdyNENR?=
 =?utf-8?B?RDhrS3YweXQ0TzByb3lyV2V2blo1Yk5reC9CMXRmdzJFWG1yWWgwbGJCdE93?=
 =?utf-8?B?dmZka3BGVU4yNWZPekNoMlFlYVMrUm4xWnlRVGlPYy9haEhaelF6bjl1MlVC?=
 =?utf-8?B?ejRKclVNaFpSMHc1WkE3Uy9IUzNQZXFlZ2xhYURQdXRYeWJlbFlIMGdQSFNq?=
 =?utf-8?B?YWlVVnIrOUMzTmNkMkZqbWw4WU5MakVKZEZJRzVldlNyNTdKRDcvemZ1ZThx?=
 =?utf-8?B?clVIaVFCL0ZVR1B4RExHTEsvNllrZHdBSFdxZU9DUkJjM1BJOGxvVldOSU9B?=
 =?utf-8?B?Q2c4dWZQVkJrQ24rRGxjd1N6SFNqL3U1RU5ObEg1MGxTZ3hURHBSVjZWRFI4?=
 =?utf-8?B?SG9INGpkdHZwTUpKRFJTcVNTeXBrOUszNVRISkl2VjBSSW94SERIT0tJTXlQ?=
 =?utf-8?B?cmRKcHpvcWE1SzMxbGxZN1hYRWMzWmlQU2hZMWp5QVRndTFHTlJ1eW0zK1hh?=
 =?utf-8?B?elNPM3VLYjdoelhtYmRWWTlEeGlaU2hEQ1pLRmpqZ3Naa1JkVS9ySFNMTEFL?=
 =?utf-8?B?SXhBS3pLaEtaSzFXVTJIblpVUnBhSVAxMXFmbTE5aitnT3ZhOFFIM3VaL3Yz?=
 =?utf-8?B?ZWVoSEZSU0o1RHlJaGl6azZFSGYrdnRNa2FzYTBMNkxFQzdJaU9UTXJ5SGVD?=
 =?utf-8?B?dW85TE9kMUV5VloyMmhUUCtacldQWHdlTHFOMEhRQnprU0l5bHd3L2hIUkRw?=
 =?utf-8?B?TURJYzBrZDZ6WTZTYjdRZFV6NjJLSTBaclpwcEpOelRuZTNDQU5ibEVWQUlo?=
 =?utf-8?B?dGJWR0hNZ2h4Vko4NFhIbHJQZ1p6V1ZKcHJMSUk4TFR4SUcvalR4NnpTZ2Za?=
 =?utf-8?B?OGJVeFFvdHU2bEk1cmNQUGFjcHI1NmZPd0pWVzVWY2RHM2hxUDFuWDYzUVZW?=
 =?utf-8?B?VTdLVUVjZkcrVkJzTExpaUpxc0gyWXRLSndKU2hTTFhyTlp4QThwTFRpdFJ2?=
 =?utf-8?B?ZytSL1RTMVpqRE1VbDlVKzFvMDJMTXQrWDR4VWJkT2VsWkQ4N3NRc21tT04v?=
 =?utf-8?B?YXhadVFobUJRV2VGRk9aeVhWVmx3dHF6TEREaTJITTJQbkY3KzRWYU5QVGFE?=
 =?utf-8?B?U3BSeGdzbXp4bzZGUmU5K3NWUm43R1h6ZVFsTC9xdzZlRitOM0Mvdjg5Mk5W?=
 =?utf-8?B?SXdDU2lJNmp1eXY3M3hBdVJmdXVqbVFsNlNOUFJoWndPZHM2K3Z6N2dQS2RD?=
 =?utf-8?B?WnZpclYvRytpTFFMUkkvYjdVTCthbGx4OVpCQVlQT1AxRXZ4WlpTM1NRSjM3?=
 =?utf-8?B?eCtPL2dYRVlCSU0zbTgyNGRnd3F3TGVxTkxrMExkejBGYnBEbGFSYk9aVWVH?=
 =?utf-8?B?cVB4c29KQ21jNSszQVU5cGRsUjgwS2MzNFVrK3dwQ285aG1XekZaY21jWWJv?=
 =?utf-8?Q?ikAd7H?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:31:00.1749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fad0d522-ee4f-4847-78a3-08dda1e2188f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6447

On Mon Jun 2, 2025 at 9:53 AM CEST, Jan Beulich wrote:
> On 30.05.2025 14:02, Alejandro Vallejo wrote:> --- a/xen/include/xen/gran=
t_table.h
>> +++ b/xen/include/xen/grant_table.h
>> @@ -27,7 +27,7 @@
>>  #include <xen/rwlock.h>
>>  #include <public/grant_table.h>
>> =20
>> -#ifdef CONFIG_GRANT_TABLE
>> +#if __has_include("asm/grant_table.h")
>>  #include <asm/grant_table.h>
>>  #endif
>
> This change looks wrong (or otherwise is lacking justification): With GRA=
NT_TABLE=3Dn
> the arch header isn't supposed to be included.
>
> Jan

It's not equivalent to the previous code; but that's a feature, not a bug.

Not including the header with GRANT_TABLE=3Dn  was the best we could with
the older toolchains in order to not try to include a header that might not
exist. The high number of sequential inclusions of xen/grant_table.h and
asm/grant_table.h seem to attest to that.

I can ammend the commit message to be clearer, but IMO this is what it was =
always
meant to be. I can replace the current commit message with:

  "The previous toolchain base version didn't provide __has_include(), whic=
h
   allows conditional inclusion based on a header's existence. Lacking that
   feature the inclusion was guarded by the GRANT_TABLE option being presen=
t
   but even then sometimes the arch-specific header is required even when
   the option is not selected. This causes inclusion sites to needlessly
   include both asm/grant_table.h and xen/grant_table.h.

   Using __has_include() removes this requirement at inclusion sites."

Thoughts?

Cheers,
Alejandro

