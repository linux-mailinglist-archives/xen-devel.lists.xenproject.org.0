Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE4A8837E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:59:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950328.1346688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KL1-00039y-G9; Mon, 14 Apr 2025 13:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950328.1346688; Mon, 14 Apr 2025 13:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KL1-00037G-DO; Mon, 14 Apr 2025 13:59:03 +0000
Received: by outflank-mailman (input) for mailman id 950328;
 Mon, 14 Apr 2025 13:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4KKz-000378-Om
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:59:01 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2412::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c318acf-1938-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 15:58:59 +0200 (CEST)
Received: from CH0P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::18)
 by CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 13:58:54 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::5e) by CH0P221CA0016.outlook.office365.com
 (2603:10b6:610:11c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 13:58:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 13:58:54 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 08:58:52 -0500
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
X-Inumbo-ID: 9c318acf-1938-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBrQFPeTp2Ij8psBv0GNxFriMoEARRmMleDV4Qsg1Fxp+ZCLGwIuGuY2sSZ9QQw5gQlHN3pECdtJSyLQ4S1HQaAlXOO4Ha4wYzt/VFoG2HQGbQvieCMV6sFTuAA9SkZsA1qwkMbvF+GBXeJbsi7qMrpMqjcG7R77FzekfRgwX+vcTwz+Trj0zkkNbMiaGk4I2exrSmAiDtD+ZUoiZNzTu7M7asWLgXsLYXYWSnYJaIGrgFdjRvU8G9u4+teSlxnqCdsxLOYm5XrO0AAZxkEQ0DjEVNAYgd5KZ+LZzd8GGhxxi57bnrxca+odTqDTy435y5OpOdJmyeKDT+Lsd/fH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy597cODJ56+FOhqRWzJ1gQXGTJKR+k+qSI6Gh93lO4=;
 b=SPye6g24xVvBclyayiqfAiqpA+PDfRMo2hr7Wl1tT5bJHzSxzmuwhM3534d2PifKVkR7vFau2UYz//s8KAOxQoR7xvvxgYcCKt/jCJpt9Bh5FApqh8CK6lJrzDWLa1WPOeOAS3GsPsWvX7sVxKU6uLAhFXXrjyKFo+nZfvFem+fXKhP0x0297vX7CLKCH6J4plfmUQKg5c4bJIpG8BZSNxzYaN9Moy0LYFls4dsXj4SWJ1F2BEPdoVZ7+vVIuh3fEwk0QHyVzOvB6e5oEStsDQzgu0lgqMczsivPLsA8YQCMRqWTzu9k1HVbH+ABT59QlF5DJeSr2zh22AU3j/S3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy597cODJ56+FOhqRWzJ1gQXGTJKR+k+qSI6Gh93lO4=;
 b=Y9hpojLeZYcgm/4b0JXkSsuYkMmbGwz4H9azwJPzY/suDkx+Xpi1Bq5igTrV4F3aawE9oKYLYOzccN/7QQb6s4kvyTgd2WmGVgtm341bCNgttsfm0fMHvapMEy35BkiMYiv1mtnwXlVZrjhrP8sxbpXi+Wc/1tZqdHvGVzpBVhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 14:58:51 +0100
Message-ID: <D96EYGKI9INQ.2W2TCBO8XHGST@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 09/16] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-10-agarciav@amd.com>
 <09e1b9f3-6660-4cdd-9bcf-af075f95bb63@suse.com>
In-Reply-To: <09e1b9f3-6660-4cdd-9bcf-af075f95bb63@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6a20b3-6be9-41d6-f3ad-08dd7b5c7e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1Awdzd4ajBHRFp0elBzSmdnaTFEL2l1R2dyS3BkOTBBYWxkRjJPaGdhVGh0?=
 =?utf-8?B?cjBNbjVJMXhzZkJ3SjBmMjhmSHhQT3dRQVZEWWh6d2J5R01tMmEvOHkraGQz?=
 =?utf-8?B?UytUNTBJS3FVUEZJWVVGQk5jd3VtQmZQZ28yMG5BVXora2gxanVBcGhzMXBY?=
 =?utf-8?B?K0kwamhMYWIrdS8yZWtJR29kQ3lldlc1NkMyUzBwYnB5U3JRSWt4TE95b3V5?=
 =?utf-8?B?bTlqeWJOM3JlYUR0VDQ4MzBGeGF4bGdLMEJ2dnlYcURUdFY1TUVZbEIyR29w?=
 =?utf-8?B?UUdUZVZNQ1plY0M1dFVHMFc5T3BlNDVzNk1OVUFOWXc5UUdJQ0VlUmkxTmFn?=
 =?utf-8?B?SFo5c1hCM0FCOEszeFBERm9zdXBnTytOVDFEdTAxQ1ordm9WRXRjanlnWHNn?=
 =?utf-8?B?ZlBWMzVDNEswMzRvSWRUS0x5cGUyOEpncTNMLzN1SEh2QXowb3hYVU5QK09j?=
 =?utf-8?B?aVRCRXNuUlhSa3JlUEpLTjZ1MG5LK21EQ2ROQ0F1NVl6QWZ0RnJIY3VPMU9u?=
 =?utf-8?B?UXRJOWhmQStaYmlIMGpXU3RLeDZnamtYYTVuOEJIU0dPZUg0Z0ZnZ2wyc1Vw?=
 =?utf-8?B?VGVoM3Ztalc1MVRiYURoQmZMbWhDSHJpb1FOVkRWViswTzA2cFhLWjRwU1lZ?=
 =?utf-8?B?UmRXVWNsa1JYZURhT2V1a1NZVFNZOXVCYjlXL3BQQmJjckYrMk9UUy9IbFJE?=
 =?utf-8?B?U2lTeWxtcVJBVEJaVzU1eldtSkpBcWJaeTFuOUhVQkZydDEzeEVkNUNjOTZv?=
 =?utf-8?B?YjRXOVgvc280VTI4cjhzVEtsUDlCZS9tOXNKZ0l6ZkhUVGUwNGx4K1BpeGht?=
 =?utf-8?B?L0VnNENDMkhNMW8wU0YwR3ZZaFRhQlptVURLUTRRQWFyYUZScENtamVWVHNp?=
 =?utf-8?B?R09uOUl6L1liZVVzRGR2VjVEdnk3bVljdXZwcllJbnBSaTB3REp3cTh5VElv?=
 =?utf-8?B?WFZxMFBjcHd4ZnZqMTFDNkJKV0FWU2hUa25VS29nUXJrVC9HTUNISS95MHlS?=
 =?utf-8?B?bVNNVktZNWZMUjhpUmJZb3JsemdITTQ0b21mQ0RFQ3ZvQk4wZmNaR01uTUVX?=
 =?utf-8?B?WDljN043YTN6QTAvQ3B0NXc3OWtnR1ZpNjgvN2wwU1VkdHRVRG9NWGsyZHp5?=
 =?utf-8?B?U1lmRDZ4Y1VtbmwwdGljbjVOQk9jTXdWQ0NmaDdzZ2VUTndPeEY0bkVhWDQw?=
 =?utf-8?B?NWR2Uk03R2EzVHA1WVRxaTJzTXMrUis0OWJtTUdnM285UklSTUZldTRCYmRt?=
 =?utf-8?B?SmlOd1UvbWlrbmVkY2ZqMUxzRDkraUhMVUdqSEZ0ZHJndjl4UVFxK2s5bjFF?=
 =?utf-8?B?TktXdkhadnA5U3NLMSs0Wlo5VGpYV2RXb3hrdjVOeE80d0ZzK0R1RkJJeXlM?=
 =?utf-8?B?VlFHcDBIRG1kTWllQi9NdDcwaXk1UzRGaWE1aXZmcC9Lbm12OE1JaENXWkVa?=
 =?utf-8?B?SFR1dWRBWFBaVGtWZnFtMnRPRDNJQkY2K1hkdm1EcmlUbzJjUndWMUZWdk9o?=
 =?utf-8?B?cmlBa0pPTmg5YnRBcTB0bmhtQ0owekMwMGM4QkEwS2k5blFJaURsREV6L29B?=
 =?utf-8?B?ZlcxNmxMTDZJRlVUcFBYWUlHNVExQVhEYWpDdVdydUdwZnh4SzRacUxoUkkx?=
 =?utf-8?B?MUdyZnRMUzNoWVU4bE5ZNjhyOEsyU3kwOXdWbHpyVnlMQlJIekQzTGZ6TjMy?=
 =?utf-8?B?OWtDQm5qL2pPYkxQQ1Fjb1UwVWZyZThVclBhNE1EQ1FOMGticXlBV2NVcTha?=
 =?utf-8?B?WiszdHhFSXIzekJzOVBTWDZVM3k4dmtGNU9Ib2ZNODZ3UGZCZ1NiSjgyUzhz?=
 =?utf-8?B?Y0Y3QS9oM0h5cnMzaDNQd1ZLV2NMYnJMS1VCK1h6VkM4Q2tMK1dsRFgyNDNJ?=
 =?utf-8?B?dDBobk1VeldmdytiKzRvbWREMTZVb2orM01sb1NjcVZhMGNFZjQyYjk1Kzgz?=
 =?utf-8?B?SHlNQUQ2Ukp1QlBOWWhtdVlMOXhtQmh5U1Q2NVZ5YmRLVlFkSmIrbnkvQ1hU?=
 =?utf-8?B?UHpxclZKNGJSZUowNkJsVEswdXZsbmZJeENPRWl0M0ZMWHlYMU1KLzRpd2Vq?=
 =?utf-8?Q?9virur?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 13:58:54.2164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6a20b3-6be9-41d6-f3ad-08dd7b5c7e4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509

On Thu Apr 10, 2025 at 11:58 AM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Look for a subnode of type `multiboot,kernel` within a domain node. If
>> found, locate it using the multiboot module helper to generically ensure
>> it lives in the module list. If the bootargs property is present and
>> there was not an MB1 string, then use the command line from the device
>> tree definition.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v3:
>>     * Add const to fdt
>>     * Remove idx =3D=3D NULL checks
>>     * Add BUILD_BUG_ON for MAX_NR_BOOTMODS fitting in a uint32_t
>
> At least this one looks to rather belong into patch 08?

Urg, yes. Sorry. There was a lot of code motion when I factored out the
helpers.

>
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -155,6 +155,52 @@ int __init fdt_read_multiboot_module(const void *fd=
t, int node,
>>      return idx;
>>  }
>> =20
>> +static int __init process_domain_node(
>> +    struct boot_info *bi, const void *fdt, int dom_node)
>> +{
>> +    int node;
>> +    struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>> +    const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown"=
;
>> +    int address_cells =3D fdt_address_cells(fdt, dom_node);
>> +    int size_cells =3D fdt_size_cells(fdt, dom_node);
>
> Oh, okay - regarding my earlier comment elsewhere: If the sizes come from=
 DT,
> then of course ASSERT_UNREACHABLE() can't be used at the place where bogu=
s
> ones are rejected.
>
>> +    fdt_for_each_subnode(node, fdt, dom_node)
>> +    {
>> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") =
=3D=3D 0 )
>> +        {
>
> When the loop body is merely an if() with a non-negligible body, invertin=
g
> the condition and using "continue" is usually better. Much like you do ..=
.

This becomes a chain of if conditions later on, one per property.

>
>> +            int idx;
>> +
>> +            if ( bd->kernel )
>> +            {
>> +                printk(XENLOG_ERR "Duplicate kernel module for domain %=
s\n",
>> +                       name);
>> +                continue;
>
> ... here already.
>
> Jan

Cheers,
Alejandro


