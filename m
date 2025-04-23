Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C403AA98A41
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964615.1355368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zk1-0005nf-AQ; Wed, 23 Apr 2025 13:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964615.1355368; Wed, 23 Apr 2025 13:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zk1-0005kf-6L; Wed, 23 Apr 2025 13:02:17 +0000
Received: by outflank-mailman (input) for mailman id 964615;
 Wed, 23 Apr 2025 13:02:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7Zjz-0005kA-JM
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:02:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b49a393-2043-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 15:02:13 +0200 (CEST)
Received: from SJ0PR05CA0149.namprd05.prod.outlook.com (2603:10b6:a03:33d::34)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 13:02:08 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::19) by SJ0PR05CA0149.outlook.office365.com
 (2603:10b6:a03:33d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 23 Apr 2025 13:02:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 13:02:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 08:02:02 -0500
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
X-Inumbo-ID: 2b49a393-2043-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLFxcv84W2yNldpiYLFasb56OK3R+4RwW6y5x3pikPvAGSzL5+S1QifILxW5P7uhtABmWYu8QPJWaay69HA2sWXQ4Lo0f+ET9BDDbWfXdkLQO/SR/ghBiRH3YlzSiNbWCSSzhNUa6Hdr9Y2jJfMXvPJnolN8/yvFMrV2+Im4WBs5vCoXz/m4Fc0SZpHKpJH5Wh6YXj/WTXhFhp7ia0Y2x/EjtHByaida1NArtW9Uoquz0lcYgF9S8tJVf3dJaaEwMHk0g+rm7YL1MB9bmA2KCfv0gCi4HAB40wALCcZ6/TR8N4T5NLH4MzKGlgKkLKBlcJt2AtU6IZIabK6+uKMWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3142NNlFSgTFaKNdkb67u921C2xnmhV71+/sQLY6AVM=;
 b=BlZLc0deV4cowivi5fvf66Fshq7HXcCNhIRs2lAUHit6QN0VeBrVF+BmRPoQSa7NXPzggfb1n1KcsgF3DGY6za52e2N4owu8SBJU458JuevQCKZErie05Qw943u/NcdXZ5431n+zDY70TtCQb2M7/95MKt0jGQDRHYUq2RSCXu47L5KLJc0XjSe58zkX3ElplOxenGTEbLTdX2/AA9AjiPX5IXB+16Akxsqme80r+zUUuytBZSQKXGPGBCj56Bc1BL8IfzmO2CPRnoX1ncI7xjcrxME3+mUB2B6OOlEzUn0R1OuzeXRvD5m1v8GBWwuVzZUcd/n8ibEPzi86defvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3142NNlFSgTFaKNdkb67u921C2xnmhV71+/sQLY6AVM=;
 b=O95l3EQvWJr+PnX6ws7PR4nNW7aLIxGIrUxo9P7J2hm89pHXfqJatUWsi36GHd7z1aVEePvsmX4l1tDeKMq2iFLdD8n6tWXImgwZ6FTsy34gMjh327F0aP9tgMLUZIdjTcmmzjaz57VEylIz9kkPxeCNjPng6kuku0XJKP582qQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 14:01:54 +0100
Message-ID: <D9E1DR9RL9KK.RXY5F9WRUKTW@amd.com>
To: <dmkhn@proton.me>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 08/13] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-9-agarciav@amd.com> <aALZGCW4IXPo87wb@kraken>
In-Reply-To: <aALZGCW4IXPo87wb@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|DM4PR12MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba7c460-68f0-43e5-d76e-08dd82670dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0FJZllibXB2MFU1N2lWSVllTEtKeDFrN0ozWlRubkNtcWlPZWQyVTJHTm9R?=
 =?utf-8?B?bngvWkZiMWVrV2h6TGhwVmhtVW1uZG9Ia0hvcDlKbDJlLzZoMnVzQXNuYU9H?=
 =?utf-8?B?QTVEY2pCT2Y1ZWpaaElrUTBCVUhZZ0ZNalNUZ2tma0ZBN0Rod1lnZzBQTlUz?=
 =?utf-8?B?V1c3SjgrNGRkQndPRHllc3JtWGtHc0xxbm1LaXN0WVJoVnNIbFFFdWU0UkVS?=
 =?utf-8?B?VlIvUERUcitBQWdqcDdyQVVSbVlxdStNSXFHRVkzdHV5VFpwWURTa0xHcDNK?=
 =?utf-8?B?dy9KNzl3blVTSHkyam5SRER4dGlNdlpGeEFEZWl5RC81U3dOMy9jeHJ2Nlpt?=
 =?utf-8?B?TEJ2Qzgxb3JxaGgvZzk1SGplQ09nSStrVmxCaHdaV2dacVB0TW9XL0N5ajV2?=
 =?utf-8?B?ZjRMb0tkc2dzbE5HODNYTER0SE10UVZzbWg3bzQ1a0hCamNLSEhQbUkzem9X?=
 =?utf-8?B?Tm5YZkFJZkNIRzI0WUcrclJ4ZS9EelRRdlJmSFRnc3d2QlpMOG12a1NHWjlF?=
 =?utf-8?B?ek83MGF0dVZyRzB5cXNNMXJsNElRUTRpY2VFbk1RakpwakF6WmtJZUlLQ0gr?=
 =?utf-8?B?bWY1cCthcXdPRzliZ2Z6NnY2NzdhZVdLa2lEdGNmNjNVWHFEdEFjelVCT3J2?=
 =?utf-8?B?eTAreU5XWnd1RTJMSVhXU25GaDM4N2lWMG41VDIwT01xKzhweWxueWVZYnhu?=
 =?utf-8?B?TEZKcHNGK3FnbEdaeFl4NXlkbHpWeHpSQ2VwVEVqYmE4aldWZ2JhZ3NsZkNN?=
 =?utf-8?B?RmVRNDl1RGFuMXovK1RLRWp0c3VCTXgvRWhjdFh4OGxHclFlYklRMW04R0Zo?=
 =?utf-8?B?TytRN3ZhWjdNVXlVNmFrVWExWU5rZ0YrbVpuQ3NwdDB5eWp5UnU0cEV0OXJN?=
 =?utf-8?B?TXZtY0J1ZG0vU0d1Y0pVQ0JrZHJ6WlRVUXkweXFCT3ZFaEtza210dUJvaVFs?=
 =?utf-8?B?c2pRVW1ZWUdmUzVxUDBzUGhYc2NkN3hxaWcvNlNmRmRtemI1eGdmVzQyRGI0?=
 =?utf-8?B?c1hUQWxTSjlVVGNYMlJKWjNGZDFtNXhSdGVVS29WWHpSUDNoNkxRTllpZVhw?=
 =?utf-8?B?alZTQ2d5ZU16eXRNejRQeDFaOUFlc0pUL0NKc01WelpHdDhTbnUrTFQrL01N?=
 =?utf-8?B?dFJzb2RDVnoxU0VoUUJ1NGJsZUIwR2NBOE9IWXBudUxEanV6VklZOGNDanY5?=
 =?utf-8?B?Y2FXSUxQR2RlSGZGOUhRQXovT2VFRTVmaHlxWW0wS1BLSG5QZXRFbDhBUGhv?=
 =?utf-8?B?N3FiSmJ2UmgzTEZiR3hBTDd5TmVxek53dTFYd08rQllwR3k4SUYxTTZReWc1?=
 =?utf-8?B?T21JcDdEUTVXUHhSMVRWeUFDVzdtVUNSdEJhZUh6c2JKRU5oYkw5NmN4Qlp2?=
 =?utf-8?B?Q0svblJGeWNRUUdDcjVJd1E5Yi9KTnJjT2cxNkpTNDIvN0NTVjNSb0FzWjFu?=
 =?utf-8?B?YURWRXVUMkM1M3BMOVNWOHNkVGoyQmt0dGNEaG9kWnd6ZDFRV2tSYlF5ak1E?=
 =?utf-8?B?WTVXUGlMRkovYTVYS011VytyZGx5WEs5NW9ENnNJMTc2RHg2Wk5PNWllZ0R2?=
 =?utf-8?B?Ryt0OGFmUnV3d1N1b0VtUFhOQ1RMaWJnWEVtRHJHeHdIWGxxMTBNWmhReUZX?=
 =?utf-8?B?ZkUwQjZOUC91V3A0SWFmUC9aRzVrRmZxakhPRHk1R0YvS09ZZGVOQ0dVTzcr?=
 =?utf-8?B?K1pjSFZLY3dMQWlwNFlnYTl3ZDR2TmFtaWRLTU9mV2xPeldzeWJiK1h0VUJQ?=
 =?utf-8?B?dXdXN09PQy9ienpTb2lJTlNJK1ptSFJwbkJKVWRZR2NSZmxKM3ZSRG1TUzFC?=
 =?utf-8?B?c2prS05sdW9mV2dpdktNb1NlclRKWlp2YmlYWE1naUpBSUl2VmRSYkExTmg0?=
 =?utf-8?B?Wm9MSzdUKzhURkRkK0pVWVJPbXoxajhxdkg3dzFoVkFzWHJ6VE5BMzQwS3RQ?=
 =?utf-8?B?WitMc0ZTUWF6RUR6ZnZvc2N4OVF6WCtTYTVQQjBNM3pFZUVJaUFWdHVseU9o?=
 =?utf-8?B?YUZuaGFBTnlPTm95RENxdktkc0JYaWd0dFhGLzZWQWVqM28xVHNvSWI4UkRi?=
 =?utf-8?Q?2P7ebr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:02:07.8794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba7c460-68f0-43e5-d76e-08dd82670dbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742

On Fri Apr 18, 2025 at 11:58 PM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:30PM +0100, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Look for a subnode of type `multiboot,ramdisk` within a domain node and
>> parse via the fdt_read_multiboot_module() helper. After a successful
>> helper call, the module index is returned and the module is guaranteed
>> to be in the module list.
>>=20
>> Fix unused typo in adjacent comment.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v4:
>>   * s/XENLOG_ERR/XENLOG_WARNING/ on duplicate ramdisk.
>>   * Removed stray ")" in printk
>>   * s/else if/if/ (because of continue)
>>   * Removed trailing continue
>> ---
>>  xen/arch/x86/setup.c            |  4 ++--
>>  xen/common/domain-builder/fdt.c | 25 +++++++++++++++++++++++++
>>  2 files changed, 27 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 4cae13163b..76ceb5221f 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -2150,11 +2150,11 @@ void asmlinkage __init noreturn __start_xen(void=
)
>>       * At this point all capabilities that consume boot modules should =
have
>>       * claimed their boot modules. Find the first unclaimed boot module=
 and
>>       * claim it as the initrd ramdisk. Do a second search to see if the=
re are
>> -     * any remaining unclaimed boot modules, and report them as unusued=
 initrd
>> +     * any remaining unclaimed boot modules, and report them as unused =
initrd
>>       * candidates.
>>       */
>>      initrdidx =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> -    if ( initrdidx < MAX_NR_BOOTMODS )
>> +    if ( !bi->hyperlaunch_enabled && initrdidx < MAX_NR_BOOTMODS )
>>      {
>>          bi->mods[initrdidx].type =3D BOOTMOD_RAMDISK;
>>          bi->domains[0].module =3D &bi->mods[initrdidx];
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder=
/fdt.c
>> index 50fde2d007..c0f526a4ce 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -216,6 +216,31 @@ static int __init process_domain_node(
>>                  bd->kernel->fdt_cmdline =3D fdt_get_prop_offset(
>>                      fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>>          }
>> +        else if ( !fdt_node_check_compatible(fdt, node, "multiboot,ramd=
isk") )
>> +        {
>> +            int idx;
>> +
>> +            if ( bd->module )
>> +            {
>> +                printk(XENLOG_WARNING
>> +                       "Duplicate module for domain %s\n", name);
>> +                continue;
>> +            }
>> +
>> +            idx =3D fdt_read_multiboot_module(fdt, node, address_cells,
>> +                                            size_cells, bi);
>> +            if ( idx < 0 )
>> +            {
>> +                printk(XENLOG_ERR
>> +                       "  failed processing module for domain %s\n",
>> +                       name);
>> +                return -EINVAL;
>
> Propagate fdt_read_multiboot_module()'s error to the caller, i.e.:
>
>                    return idx;

Sure

Cheers,
Alejandro

