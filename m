Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ5HHmQE+ml1HAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:53:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB2F4CFC4A
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300777.1575259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKH8x-0006Xp-4t; Tue, 05 May 2026 14:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300777.1575259; Tue, 05 May 2026 14:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKH8x-0006WN-20; Tue, 05 May 2026 14:53:03 +0000
Received: by outflank-mailman (input) for mailman id 1300777;
 Tue, 05 May 2026 14:53:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKH8v-0006WH-V0
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 14:53:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKH8v-006Vcm-83
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 16:53:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fa044b-bab6-0a2a0a5309dd-0a2a450acf4e-6
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:53:00 +0200
Received: from [52.101.52.43]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fa044b-56b3-0a2a450a0019-3465342b9d0f-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:53:00 +0200
Received: from BL1PR13CA0003.namprd13.prod.outlook.com (2603:10b6:208:256::8)
 by CH3PR12MB8546.namprd12.prod.outlook.com (2603:10b6:610:15f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 14:52:50 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::73) by BL1PR13CA0003.outlook.office365.com
 (2603:10b6:208:256::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.13 via Frontend Transport; Tue,
 5 May 2026 14:52:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 14:52:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 09:52:49 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 07:52:49 -0700
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 09:52:48 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qfm7Trj3IP1qAiIIETHMWLi7tu66EzFvJkSG6Wgc+CwmH03trdJUU+1UzAdLm7sUVeTKzDDZuCO8HceHL741aKgsJM7wvdqQlYPorWJYFMtZ9bFucAzFBw15eoNJv5M1KNZq+hQF9MCHCrELMhJWLUSf81emMLrUcsTYPRnAoeg4zV6+Cgt1vKEgfYpneNAfiKxTGg9fkApP5lNXK2UWMy6JiM49zZ+xibPQB75w+8lL1pHZGEJ8ElW390QvNSOIpdiP1+rYjmUPfged2KZK8wZ65QLTrJvcXdAxz125ZUPX22Cf71Rl1wQLAmbKwuK3cCCivnyU54plfRxGlAJ40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRjDYUCgD/tOtGW6rkMYl+B7O9PGHUlDXdxoFIK/BI8=;
 b=yVR4Hxa7xal0FP5+vdj+GlSDutjTdF2u32QNazs99llhwGo0QEPYilUozc53Ru5RX0WnVsfcgcbnuCtFeUDHFFh9jagd6+clbj/KalkT08Ukkmj2iDKkKz1RGf2dPzTjYwjTxThYD1CBzWN7uI8Glt8RXW187c9TZn5hmngiWvnl5qvyaSeHnFbeFdp5/r1UQ/tH+WKHirEPy96pC9cm8VPVQ8UOvsynN5saq8N+8j1eiFMkse+XLOT5zrmTVg8CBH045pZLvU5SpY8lJlIB8fPsn5yldUwW5hPj8SuJaSFmSosH0mN39jgVVX+15Iy2r4fL5Mh2/TQT7lsR9vDqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRjDYUCgD/tOtGW6rkMYl+B7O9PGHUlDXdxoFIK/BI8=;
 b=3NkGHtCnvuTaG3NK7IP2ZPCsMuXAaJAHwEMoAmlfXiwpMIql15Yl8i8nzbZro+933mHfG0SpKooC60av1kj0+wlEFuiisdZCT9O71PeuBgiTyM9hMWmUL2IrwGiTs4Owk2rj5DGgU+AwhKA+MfjOrFIxts6Tx1wPYijBE4AiZnA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d7b30467-50ed-482c-9046-6a51d43bb514@amd.com>
Date: Tue, 5 May 2026 16:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>,
	<xen-devel@lists.xenproject.org>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <661c18d9-eceb-4a4e-ac2e-37a6931e06b2@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <661c18d9-eceb-4a4e-ac2e-37a6931e06b2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|CH3PR12MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6fbcaf-648b-45a3-66e3-08deaab5fa9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yzpb0aNrlWD+InGTrf5uSJpS43sWKCMr6ckZuan1g1bGez0C5asmbVoiQEZ3yZ6/RbZUHLg9whhmyRJ0fc+pacTj/6u8ly+jvzvRgx0sQOMb9JMaHE08/6mgj1uDscou36SJ9YCxYHY8+eXHfVSc+xuaTIwBDmULqbRQV/dbF6u0WttLu67bOaxzf07in9RyqoNSUdROa7fQQitWurYPbkoxKPS5FJW2bzVC/zLe2LISxa5wCDwPWIoy9nieZnf6OxHiGh1xOm+bChmiJLZebk3jb7SOdUIrT881LNtXllkTzeDntju/ZqUxDsPH7HeN+9YcyIIphXjF7aNO3oiGvDO7I+1Y0wMpDfYyl3Kk5nTRBGjzQIcX0zZRSso0F4QPnvjHYw+nnjChGliStDMCswtcFSlXt1hIK/uNHizv1pA1ketd3Emrrd6fhf63YBOg8Cxas8312k1YeYMcaXyFNfgXiDYMlFDgnrGvUHiK9IaPu3bakyb0y4LkpyfFfR8Xcp8YHV6KyjjMgQT/LQ+RCg9ulzs5h3Xwl2atOdM7Z5fgzlubkPpdMYFWUHxiUsYigfui4CywAjNgWSMEcgOKsww9B9eeha35LEKxx5s3G0tdtbKwp/+aRIftbf5tLFUbBPFZ+79LLGFQTIdZ0UPQjjJ0KTxP3u35u0gM9nrOKmNvZ/PIxH+CO1t7JS6hmY0kmPmzobiGWwQ8IDxxmoUw28NG1N6zfsrdnr3WaVOSOxQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XJM9fQ1EduezxB2GcU1Ij8C06n7nQUYoAzU+C9/9U9hymyMxnoTInri4eRVck64AA2KonXGSAbi9qbd0/hGtY3NmbYfOf1bh5szKn8YiE90cA0j+iCYTqrMJtGHHekokcus1Y4d7pSFSQPIUU3zMIZYEJ1nPnBojPFaKGicH4Czl+ygIyPAMDfJmuw/kUxdEWBa3D3RmVmzWMe40CPBz6IH1vU6wF0PFFUQ+wjbJdY0MgfsWINkGcgBBO1Sb32+4UicNGTNrrNaRaPWWmHViALCNK7qUNRK6Bs9qlXHRHOTZ06GW1H3bs+idUvIpWy0imN6T+3383biOLBJMIHoJZcMO1F6wEZlW4KvJ7fa9oIg/75nbmVEZuMdu3DIb53y8vnXn6z2/BO2i7TYrp81NQIDcnzmZ/Rk7V7NyHzZm+pVXhOiAaH1ImHjL8n+7mXfZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:52:50.2973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6fbcaf-648b-45a3-66e3-08deaab5fa9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8546
X-purgate-ID: tlsNG-4011c0/1777992780-465748B7-D5448F01/0/0
X-purgate-type: clean
X-purgate-size: 1647
X-Rspamd-Queue-Id: 9FB2F4CFC4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 05-May-26 15:05, Jan Beulich wrote:
> On 30.04.2026 14:51, Michal Orzel wrote:
>> --- a/xen/include/xen/pdx.h
>> +++ b/xen/include/xen/pdx.h
>> @@ -132,8 +132,9 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn);
>>   */
>>  bool __mfn_valid(unsigned long mfn);
>>  
>> -#define page_to_pdx(pg)  ((pg) - frame_table)
>> -#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
>> +#define page_to_pdx(pg) \
>> +    ((unsigned long)((pg) - frame_table) + frametable_base_pdx)
>> +#define pdx_to_page(pdx) gcc11_wrap(frame_table + ((pdx) - frametable_base_pdx))
> 
> If you alter these, ...
> 
>>  #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>>  #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
> 
> ... how come these can remain unaltered? Maybe you have some special
> arrangements in Arm code, but surely in generic code transformations done
> should be uniform. After all
> 
>     ASSERT(page_to_pdx(pg) == mfn_to_pdx(page_to_mfn(pg)));
> 
> (and alike) ought to be universally true for valid inputs.
The invariant holds. There are two transformations on different
boundaries:

  - PFN <-> PDX: the compression scheme — lives in mfn_to_pdx /
    pdx_to_mfn.
  - PDX <-> frame-table index: +/- frametable_base_pdx — lives in
    page_to_pdx / pdx_to_page (and Arm's page_to_mfn / mfn_to_page).

On x86 the second is the identity (frametable_base_pdx == 0), so it's
invisible. On Arm it isn't, so it has to appear in the macros that
cross that boundary. Pushing it into mfn_to_pdx as well would mix the
two boundaries and double-apply on Arm (page_to_mfn already adds it).

~Michal


