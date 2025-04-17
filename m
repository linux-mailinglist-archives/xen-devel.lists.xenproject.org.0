Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC2A92237
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 18:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958193.1351124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rl7-0005Hx-I7; Thu, 17 Apr 2025 16:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958193.1351124; Thu, 17 Apr 2025 16:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rl7-0005FY-EW; Thu, 17 Apr 2025 16:06:37 +0000
Received: by outflank-mailman (input) for mailman id 958193;
 Thu, 17 Apr 2025 16:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5Rl6-0005EY-2v
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 16:06:36 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2416::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee89cb8f-1ba5-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 18:06:35 +0200 (CEST)
Received: from SA9PR03CA0001.namprd03.prod.outlook.com (2603:10b6:806:20::6)
 by PH7PR12MB5758.namprd12.prod.outlook.com (2603:10b6:510:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 16:06:28 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:20:cafe::bb) by SA9PR03CA0001.outlook.office365.com
 (2603:10b6:806:20::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Thu,
 17 Apr 2025 16:06:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 16:06:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 11:06:26 -0500
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
X-Inumbo-ID: ee89cb8f-1ba5-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mR8yDWC/z9mH+65o1zH9RCfUVs6pSoTW+A14mlJjpWJzER0NIe4EK8rHM8IBdstZlwhisywAmHUjPSZulRBIdNFIm7p+qPO7Oqyi5KbG+zxP3oG/7VbOWcXpd4zR5mp9yrtH8oGCCqsDAJEF/bcvbOqRK5cEDfjBf/oY0Px3Z2E1xSsyOjxPvxlxjMuwzUYOC0CcrRZQhQm78xIW6q9BEwN1k/fGESatB7PCS+yfTMPbhHRp4INe++TcO1feKXZBD2j54uGDLCS9v4ebfexKEag6sm1rBjtykLDn66ZDLzyJOkiQE0XTrINoyA1pAJPJpZhpASSeTHcgU0w8Qx8eTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjDC+Ukrj5uJKnfLceqL6VPO/rMZW8zSW7MpcHiCdRE=;
 b=nPsDBuFqUdOg2dVTmylYeC9j/ysjvXjDSlT2bb5RjuaG2EPuumWlVlE7VvgSCLcyI/AZuNWNJcrRTE2snK65izbk/C3IrL+GPW8pQYvNHZ9y2M2Xslh3qpwiAKkJ83b7ZnRfNH4ibT0TAcU9IhkdHu6sjtBR1/aOMBhS8JT/lAHEOyvvZr2gpb7g6c9gsWYQrsGFYbpdOPhMMb/aCDObM5YgYfNcwHf7coSxCjPSxAThw/fsr3xmT2qXT5SnHn8FYxA47y3esSxtjzCG7QGTXKju3Cx1t3UqT2srySa9s2lHfAaq9yzFd2TcaJdcuJbT6MBcJo0AYN3pf4MQtH10xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjDC+Ukrj5uJKnfLceqL6VPO/rMZW8zSW7MpcHiCdRE=;
 b=BIgKWyeQUsofqh+O7GgT4r13bHtVyL/iNEHunI6830TyM6+ql9YrsLSW0AvhtyWBFwy3C6RgdK0x4whGPzNSE3RuFLnzc3KXdZGMbg4h18KueyRh1HFVlji4fxHydkXE3hB33Sz/epN/AH0Rkx5hl3HDYbTTO6obxTodFh3DKYE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Apr 2025 17:06:25 +0100
Message-ID: <D991JRCSOIZD.2MRXXPX1A09OY@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 01/13] x86/boot: add cmdline to struct boot_domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-2-agarciav@amd.com>
 <c59f6453-92eb-4015-bb2d-e0d06a668bf4@suse.com>
In-Reply-To: <c59f6453-92eb-4015-bb2d-e0d06a668bf4@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|PH7PR12MB5758:EE_
X-MS-Office365-Filtering-Correlation-Id: a33b17f6-9a79-4d23-39d8-08dd7dc9cfa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTJINHJxeXVRZGNyU2NIMGZ6VlV2V0RaMkduY2t0UlBPYllKYi85aWk3YU56?=
 =?utf-8?B?VEdud2RBL3JnY1pHSlp5OGZERDdYTUppZ0xiYW01aWo5QzYvUFZCaEtaZjFk?=
 =?utf-8?B?RGd6UVhqRTRneTU0N3IzQmhMY3N4UUtBT2Uwc3krbFo1bkdwOHdJMUM1T3Rq?=
 =?utf-8?B?Z3hGTXJqcTlxRE9LT3c0M3UzRktyODhPNm43T28wbkpuZkNJZ1g3T1QyTitX?=
 =?utf-8?B?MVRlMWJLa0pRQTV3TmJBQ01aRk9ucEtNV2F3cHZDSkFkSFl5R1RDL1dISjdy?=
 =?utf-8?B?dmFlK29RTWREVWoySlhJQlR6emRtZDJCYUhSZS9oclYzeCsxd2ltSWh1WEhR?=
 =?utf-8?B?dXhJTHlKTG4vN2IrNVVRWkY3QVhTQ1owTHJsY0s1VVAwRmU3a1M5d2x2NlZW?=
 =?utf-8?B?QW4rb01nL2VCWHA3N3V6enh3SlU3VW5BbU1qdmxLbGVHUWdJQnQ0V2YvbWZt?=
 =?utf-8?B?THdPcWNIby9GYWhvMjZ0dk5qUmozSVljMHV6V1ZrQ0k5a1h5aTMxMUQzL3BH?=
 =?utf-8?B?YkVBR3V2ZmRmdExqRmlNdkVYbGlrN21tRnFIRnNEZFEzWFl6YkJuMFhZeVlT?=
 =?utf-8?B?TngrYUtZNVBhSTdlWVNHaXBYV0xJbVhQd0RScXB2ZDZqNFg1eU5JaDl3TXk0?=
 =?utf-8?B?bnhNYzV2RGR0VFdWTWxkeWtFTVFuaklReExKdzRkS3R4amJNOXB5UU9yaFRV?=
 =?utf-8?B?YktTTHMzY01hL2l1VEpYMk5NODE5bHNOL1krVCtDaE9CUHd1YkdXZ21ZdUkv?=
 =?utf-8?B?eklRWFFaQWg4MnBmMEF0NTdkK09oVTlRNFBoM0U1aFRpak5UREN5MTkvckEv?=
 =?utf-8?B?c3lUUEczQjJON1VSeHI5RXhKY3cxTnF6UVZmVW91QmMrd1JLZ2JFZFV5VENQ?=
 =?utf-8?B?YnJsblZ6M2NLbFRiMVJna1haTXViT0c2bmk0TXdrNzVnMWZ4VmhPOHhsbyt4?=
 =?utf-8?B?cDNsUjcza09QTmZyNlRZdmV0YXl6SnRUTDhSUE5KekFIcG43SWtKM1p0SDF3?=
 =?utf-8?B?a3l4RWpISW5OaExGb1c0SGs1UnIrSWttQ0EyYWdwbXRzbUxEL3I1MGJOWEV3?=
 =?utf-8?B?Q0kzZDRLdXNCTUVieG84OG5vQm1wZTZGMWx1bzl1Vmw0UTUxeFRqNG1wVTBr?=
 =?utf-8?B?Tkt0ZzBIK0NCVXVxRVNIeVlNWTNrWEl5ZFlMN2dqdFJSY3QycUlPblZjNC9v?=
 =?utf-8?B?ellvV3VpSlhJUGhXVkxQWGVWN3hMSXlvUU5xeURVZDA2Q2lBUHdsQVM5Q3BE?=
 =?utf-8?B?MFJvWE5rS3dZU3cxdW16VEhPSDdLYzh5amVmblJCZDFKbXVpUEN2THpVR09I?=
 =?utf-8?B?UlJ6Q1lGRytBQ1dwTENKN2tmQ3NXc1pwanUza1FVRmN0R1FQRmNhTFNVOUZv?=
 =?utf-8?B?YW1IT3YwdElucHRzYmorVnFzKzJxSVRjWEkxdzlTUExyYk4rbTltTnNWeWJW?=
 =?utf-8?B?eXc1cndOZENxSGpZVXhESTgwbVdMUndBbHhiNnpYSzVZbVZuVGt1M1Nkb21M?=
 =?utf-8?B?TTV4STdPWnF4TkcvakZyZythOXlzUTR5NXNQOUplak9nK21OK0p6OThockdD?=
 =?utf-8?B?eHJZSkc4WXVMMDhCSFpIUGVrZWFjUEdDdTNTK21aL3NVWWs4NWxxSXZJWGtB?=
 =?utf-8?B?QVZVcldzZ09mT1VaaVRENG95YkNpN3hORmJHM2VrcU50RnljSjhwRnRXUzBG?=
 =?utf-8?B?VlFvMlNLRTBxdWxNbTJIS3NhNm9tYjl6eFRPOG10Z2tJanhROHFxK3M5NW1P?=
 =?utf-8?B?Z1VxSWx1UGxhdlpJSlg3VjFwdTVSbmtkVk1tazlBcktlTUM3YXNaWmcvMXd4?=
 =?utf-8?B?eFBvZFphMHBYR2Z2MmhQb0xuaFgvNStjME5YMmx4TGZsT3JYdkoyYSt4SjI4?=
 =?utf-8?B?WEhZNVJDcWNWYW53bGNxSEkvRzhyLzhkR3dxejRucGdRcmVrcng5em1aSWtp?=
 =?utf-8?B?ZS9LR0NXUTlPL1MydzJuTkFXR0pZTk9jbzJpTDlYeDEyRHJ0ZmhjNU5Rcmly?=
 =?utf-8?B?ZmRHRWgxYm5FQzM4ZkhiS3FVSHUyTEF5bFdNNEhiWm1sMmFMN3doSHhLc1lM?=
 =?utf-8?Q?bbEryh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:06:28.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a33b17f6-9a79-4d23-39d8-08dd7dc9cfa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5758

On Thu Apr 17, 2025 at 3:54 PM BST, Jan Beulich wrote:
> On 17.04.2025 14:48, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Add a container for the "cooked" command line for a domain. This
>> provides for the backing memory to be directly associated with the
>> domain being constructed.  This is done in anticipation that the domain
>> construction path may need to be invoked multiple times, thus ensuring
>> each instance had a distinct memory allocation.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,

> preferably with ...
>
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -653,7 +653,7 @@ static int __init pvh_load_kernel(
>>      void *image_start =3D image_base + image->headroom;
>>      unsigned long image_len =3D image->size;
>>      unsigned long initrd_len =3D initrd ? initrd->size : 0;
>> -    const char *cmdline =3D image->cmdline_pa ? __va(image->cmdline_pa)=
 : NULL;
>> +    unsigned long cmdline_len =3D bd->cmdline ? strlen(bd->cmdline) + 1=
 : 0;
>
> ... this becoming either size_t (as you have it elsewhere) or unsigned in=
t.
> Happy to make the adjustment while committing, so long as you agree with
> either of the suggested variants.
>
> Jan

Yes, sounds good. I'd rather it be size_t seeing as it's the output type
of strlen()

Cheers,
Alejandro

