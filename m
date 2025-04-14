Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193E5A88BDE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:00:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951190.1347299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4P1o-00071D-BS; Mon, 14 Apr 2025 18:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951190.1347299; Mon, 14 Apr 2025 18:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4P1o-0006z1-8Q; Mon, 14 Apr 2025 18:59:32 +0000
Received: by outflank-mailman (input) for mailman id 951190;
 Mon, 14 Apr 2025 18:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4P1m-0006yt-8m
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 18:59:30 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2417::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96ba51e4-1962-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 20:59:28 +0200 (CEST)
Received: from BN9PR03CA0531.namprd03.prod.outlook.com (2603:10b6:408:131::26)
 by MN0PR12MB5882.namprd12.prod.outlook.com (2603:10b6:208:37a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 18:59:23 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::ca) by BN9PR03CA0531.outlook.office365.com
 (2603:10b6:408:131::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 18:59:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 18:59:23 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 13:59:21 -0500
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
X-Inumbo-ID: 96ba51e4-1962-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3UjrMk17lg7t/iCzv1jWTPrNIew/KHnf2Y87fjq5hFyOEEoMIp1qn3kWtERM0CTQ/kK12uLmuY4Xxlrp0aaig/QlEruEuU3Do2I1vQ0justvY00evZKlDNVL+oyGVPIk7wcycicTGbIsRzzBbTV3ngNSJiqXEaWezKJpiQZ9yOvSgzIW1IMGfCa9c2AInLq/jiWUAb5yjBQzz21K1nBUNgGamNuANWJ3bHmv0XGjO2teQVxIbgUkcOH6Ew156oz6Pd+w48SxQWlXoRUoUCYq4aKGE//Dw5gSE3cBQHvhpmNI2pKumDuIVfI57s4uhkaDrBZAwfCN/G299RnZaZXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+kUEEgJlwdl3Tb1dK+FcrO+rHmP2LGO2wJVEO9Kz6M=;
 b=Pc7MJ16IWUzrpiWha1F319n56+NKyvL3UcwmE6U3oumdqZDPbvG6947rYbRFbE+KXu4VNfb0/dLx33ZLRGsUl3SJ4v3fh6bZcpdpCYJo9gLXLCxpiEYdPIqbB7MVGJoAKYP2TA+dKes4A/7ReppQVrvhHfF9M09FwexYKGzGrOWjF2POcmezamxk5AaXyFk9Xohx6S44LW6vngRdsyQBeraZENIkHpPX1A14TS/oJaDwNzPchrixo5XClOx+W/vMRgky/iStdmfN78preY5rPW4Cmsov5B9KowVkolmmscuOZpYQ9HK4AZy1x1kOIGQ/4DNtZzVDLwNcC2noG8dNRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+kUEEgJlwdl3Tb1dK+FcrO+rHmP2LGO2wJVEO9Kz6M=;
 b=w3i7o07maquH2iAcokc8T+W8Fs0/hoLGNZX1G59rSeHyKTdtGlful2b0njwt5yFN6JxxFEnfz7bAzTqOZaEVPHiMU2AYSo4VDy9O7VqOSIA4F6Xz4v/2pctny/WS5FVwoiBrbdcXGv6+OUlVRBcyDkjMG6emEYhdwv0Hq9+WGv4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 19:59:19 +0100
Message-ID: <D96LCIN71OHH.3CVCYBOYFRYSE@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 14/16] x86/hyperlaunch: add memory parsing to domain
 config
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-15-agarciav@amd.com>
 <e78824bc-3b0a-406e-80ac-5a67b127254f@suse.com>
In-Reply-To: <e78824bc-3b0a-406e-80ac-5a67b127254f@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|MN0PR12MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: e269051c-bc63-4690-899e-08dd7b86789c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWt2MUhKbG9jVUs0dFhwR0toWVhoSHVYRjU4TGRwd1Q3a1QvWVN0TW1qc3hU?=
 =?utf-8?B?NDlHUXhPNTJoTmtrdklsZzB6VE5TSWl1bXpxUVNNaTJIZUw4QlQxMktvRlZv?=
 =?utf-8?B?cVM1dXdhblJDRjk2TVhucDVvSmI3Zm15anMrd0J2a3d4Y1o5TmF1T3h4RGVZ?=
 =?utf-8?B?M3ZvNzdGMUxVUDJLQTRvUUxUcDJqWWQ1ZHAzZkV3WDQ3SGw3a0E3Y1VVazdT?=
 =?utf-8?B?UndZbWJVZVVzUXdBMkF2NHIxMW5Fd2l5MzY4KzBMN213ekliUXFUeWpCa0Qw?=
 =?utf-8?B?UW9CQStrWkx4U0J2RlZCZFA3QlQ4cWN3alpqQS9mR2I0Ny9YQW5rRVQzbGEw?=
 =?utf-8?B?VTd0enNyNTMwSW5yUDBZSHltOEdkUXowbDlCSEU3M2pFSzhzSy9qMkc1SGoy?=
 =?utf-8?B?dHlGQWZKSHpLcmNmUitiNjZVR2JHanp3OExhL1hhQ1pvOEY5ODVNYVBldEt1?=
 =?utf-8?B?UXJFNFdFTXdoeWhyK2VYeU5Tb2tFY1NzVTd1cUc5aS92M1JCdXAvZnl4bm43?=
 =?utf-8?B?eU9oWHRQUWhkbDRXMVZ3SnU4NzRPQkJ5Ym5jRUJLNDVtUUcwR0tvbk5KRklT?=
 =?utf-8?B?enNZSnkzMmlvWm9iOTdNUmtTL2ZrWHZrNzArbS9WOS9pYlpXM1JwcEpIWkFN?=
 =?utf-8?B?bmw2eDI3RVBMa0t0NHNSNmJzaDNHVUNzcmg0TzdWZm1PcFQxRWVwWGJJRENp?=
 =?utf-8?B?emI4clJzOVZ0M1pkV3hZVTdaZlRZOHpNSGozSldxT3IySlRKYmFSSUlXcnQv?=
 =?utf-8?B?eFVUcTR2Rlc1ZEdVVmR5c0V0bGVXU1AzczlmQzZOZ2owQ05qK2Q3eEd0MXUz?=
 =?utf-8?B?WmRCVFp0eXdmakJXMHh4KzVmRmVyZWFWN0haS2kzV2NZZGhLdVRTNmRxZ3JC?=
 =?utf-8?B?bkNlcmxlWC9nSU9SYnh3VlJzcVk3M0dwRjVhRTFZZml6MXN5cnVvNHBkZ1hz?=
 =?utf-8?B?cU9BZk04aEc1aG1pei8veFVIQ0lyTk90ZjMyM01Ucjg1Wis3eTF1YUtPZ1ZD?=
 =?utf-8?B?aFZnNDdFL0JBdzArOE03SnAyZnJ1TTZlbHVjZzZUek5pQnpKWUhJaFdQdkVH?=
 =?utf-8?B?VlNDRkIxVU5TNmV1MTFmRkVuK2dHb1NBS1M3MFBzQWVqSXcxbGVxWU0yM3Zu?=
 =?utf-8?B?b2IwQVJ2QkJmN2xHbGxxd1o3QjlXV3dKSVlTaFNIeTVFNGdxRGtycUVYcnBM?=
 =?utf-8?B?YThqSEdvUXhnWTRIdmV3MVB2YUowVWNjQTZ1NFJIbUpKYjh0dUNWYmNCaXVa?=
 =?utf-8?B?dG1PUUNFTmRFYXlHODA2UDY3SlVGUDdxZy9xTjE4dGp1YzVKSE1uYTA4dkFw?=
 =?utf-8?B?RWhkN2Q3UURBbm41TWpVcG0zdnZvZ2VpaXNybS84MytrNjZ2SnJLeXNtREhx?=
 =?utf-8?B?dm94OHk3UFZURGtyU1YyazdTV0ZjYzdudUJrd3NqWk9XU2NKT2d5Z21TVC9q?=
 =?utf-8?B?OEhqYzRocEtiYVUwOW9LWFZCWitkTmpMdDdHcTlqc1ZSUXFDK1puMGRhSVh6?=
 =?utf-8?B?OXlRcGx1Rm5TYWlMeGtVbExybkFua0lFZDh4STlQY3JqVHVJanJrbHJMRUNG?=
 =?utf-8?B?T2xVeUtyVGVTd09hMkVwRHU1bys4S2tyeDJnRGN4b3p1elRSWGZKVTVuajRa?=
 =?utf-8?B?TVhnWGlyMzBNSnA5RXpjaFVNTmt0cHlRbnVmS0pXbFRtZ0JnQ3BGNzhHLzBD?=
 =?utf-8?B?bkFKSUxTZE9ZTWNJOHRsWjllMy9ncmRNVnFqZ0xmcU9VY09lMEcxZ2FodVZv?=
 =?utf-8?B?bE4rVEthaDRtUGtIVGdaLzVpVHVVOFJGUTNFR2JVd3ZBYnJDYTNHamJjNEh6?=
 =?utf-8?B?RVNrOW51UU1HcWZma1oxYmRmTSsxeExnZ00zOGxkd0ZENk5XQTBzWDFnMmp6?=
 =?utf-8?B?aGhmUkFoc3dweTdMUVA2dnM2UnpJdDk3QTRUTUNpY0xNMEFaZ1VSd3JBaS9v?=
 =?utf-8?B?UWVITmlNamlQV0hEcUY2WFhUWDQ4MU5rYUhsNFZPM0VuSi94UHk2S0VoOHdJ?=
 =?utf-8?B?ck5wTG4yQ0g1QS9PL3p5YmhicGl3UW1PVjloTlZsNmRoSGZZVkZ1MVFpMXFC?=
 =?utf-8?Q?n9+PB3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:59:23.5524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e269051c-bc63-4690-899e-08dd7b86789c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5882

On Thu Apr 10, 2025 at 1:03 PM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> @@ -212,6 +213,39 @@ static int __init process_domain_node(
>>              else
>>                  printk("PV\n");
>>          }
>> +        else if ( strncmp(prop_name, "memory", name_len) =3D=3D 0 )
>> +        {
>> +            uint64_t kb;
>> +            if ( fdt_prop_as_u64(prop, &kb) !=3D 0 )
>
> Nit (you know what I have to say here, and again below.)

Ack

>
>> +            {
>> +                printk("  failed processing memory for domain %s\n", na=
me);
>> +                return -EINVAL;
>
> Any reason to override fdt_prop_as_u64()'s return value here?

Mostly to avoid needing to recover the error code. I'll just do it.

>
>> +            }
>> +            bd->mem_pages =3D PFN_DOWN(kb * SZ_1K);
>> +            printk("  memory: %ld kb\n", kb);
>> +        }
>> +        else if ( strncmp(prop_name, "mem-min", name_len) =3D=3D 0 )
>> +        {
>> +            uint64_t kb;
>> +            if ( fdt_prop_as_u64(prop, &kb) !=3D 0 )
>> +            {
>> +                printk("  failed processing memory for domain %s\n", na=
me);
>> +                return -EINVAL;
>> +            }
>> +            bd->min_pages =3D PFN_DOWN(kb * SZ_1K);
>> +            printk("  min memory: %ld kb\n", kb);
>> +        }
>> +        else if ( strncmp(prop_name, "mem-max", name_len) =3D=3D 0 )
>> +        {
>> +            uint64_t kb;
>> +            if ( fdt_prop_as_u64(prop, &kb) !=3D 0 )
>> +            {
>> +                printk("  failed processing memory for domain %s\n", na=
me);
>
> All three error messages being identical doesn't help diagnosing issues.

Indeed. Will add the prop that trigger each.

>
>> --- a/xen/include/xen/libfdt/libfdt-xen.h
>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>> @@ -34,6 +34,16 @@ static inline int __init fdt_prop_as_u32(
>>      return 0;
>>  }
>> =20
>> +static inline int __init fdt_prop_as_u64(
>> +    const struct fdt_property *prop, uint64_t *val)
>> +{
>> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u64) )
>> +        return -EINVAL;
>> +
>> +    *val =3D fdt_cell_as_u64((fdt32_t *)prop->data);
>
> Please avoid casting away const. Looks like I overlooked this in
> fdt_prop_as_u32() that was introduced by an earlier patch.

As part of v4 I moved this and fdt_prop_as_u32() earlier to patch8 and
already adjusted accordingly.

Cheers,
Alejandro

