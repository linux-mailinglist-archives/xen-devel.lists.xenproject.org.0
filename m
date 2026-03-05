Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLbKCQlEqWlV3gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:51:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838320DBFA
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246308.1545510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4Q9-0002hx-Ix; Thu, 05 Mar 2026 08:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246308.1545510; Thu, 05 Mar 2026 08:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy4Q9-0002fJ-Ff; Thu, 05 Mar 2026 08:51:01 +0000
Received: by outflank-mailman (input) for mailman id 1246308;
 Thu, 05 Mar 2026 08:51:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NtvN=BF=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vy4Q8-0002fD-6V
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 08:51:00 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6acf36a0-1870-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 09:50:54 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6534.namprd03.prod.outlook.com (2603:10b6:a03:38e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 08:50:49 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 08:50:49 +0000
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
X-Inumbo-ID: 6acf36a0-1870-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SW3Cyp4l/y4VkGlcMoe2dAw9hCSGS7bcExQLMn5oXrM7X5lJlx5ND9hicEOYb6gPCYS3VdWcIBfQ5Tl1NCbUcSeJwf27zoAnbXrCPT7LwfJZl0tDn7S8XVC09OZhuipJhMhu6izKE8SOpyl0/FB36PJIbK5kJ6KX+KelB/iNBSO2pVNXdF9RxBgpgFthIG6IhMxa5rPpw/kWX2+Zfo9QOI+/xHgxOqhyesk53NUxOtsWL/lBNdkLFmOZwAVSuF2QFqVe2vvOvaypWDugYhWF/JagAtV0CKFXiWi2DR8XUfwLskjdsSTno0/ZcJvbc8OMigq654J7cdxBjGxyn740ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhKML0+vEIxkGGxamiIJllZsv3zny0fmnhubU2tvKPc=;
 b=jdEO+0fDSZ6Nyr7tnUgu8sMJrvCrcDUWehl804FCCvboNfFgz1OQPEp54TEDWUyc1Q7v+usJM7bzAyAARs1g5pAvh+imMuiFsCCQjX3LgQi1ykSWu4FIPTyQLJ/Oezg9l9zV3vnLo1CDqJVW8x+EhaOHpAVrLCdXk5+vw1hJhUBanKm5AznPqDC8eq/T4f08R/sHTpggUlC6rEfgpU1eCD4SFATOgnxstJ889y1gM4KtQC2t2t9pgUfbFljeOYkZ/cbQb0OImACOVOFTbOL4eNjrXZcN5L9hmK8G2EBJTDbsGkJVWr4epFgwMKQ+mLFu6KHFpG51c8ZcEyRhHSuKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhKML0+vEIxkGGxamiIJllZsv3zny0fmnhubU2tvKPc=;
 b=wSDn4kfhFtB8vJDYWBiRxvPXF6Vokkv6PtOhxr0mSUl5sxGTfRULB3HXLpOpVIjfhbbyirIsXljRoo99igD5sf7pnQ+JTfB2kIP4dJBP/R6iwPB/3Xfh1hYuh6HwCq0RPH8pElyjkw9P4L4PzjWyyiv9+H/rbZmHGoJUWRyH/vg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Mar 2026 09:50:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH] x86/ACPI: _PDC bits vs HWP/CPPC
Message-ID: <aalD5VRBBuM16pxN@macbook.local>
References: <ca1812c2-dadf-422a-a195-9c285ce08077@suse.com>
 <aahfgDDNVwJPa-jF@macbook.local>
 <3449aaf7-b221-4c45-9d22-54e340167b3f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3449aaf7-b221-4c45-9d22-54e340167b3f@suse.com>
X-ClientProxiedBy: MR1P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9e8341-a50c-4df9-b5b2-08de7a944cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	VscHNN2wjnQezb34t5LCoUnAaRdTtmEsQwu2YrzH0fVGL9kDtyg7x8oU+l2mOtUYP9SvuHr/5VDEI+0xbsB88OdXFWfWjEH0ETyFFOsL5rdFOuzVCUiKDF6aJb4HG1KPX+8dPp0zAdgPKqoJ2CzLv9DOr8UwRMVaxEc7DN6PAZLRGtQdOGY+EiP3X1CXBzVfO9bYWTLld6KpsiPsD4m8dkHCPrcF4bt0EjGNrfrz7ziXByypJafRH+w2PYHrTZrP98VcnA6iLoHMcNBkfjpSpD2owJ5NFUqMZrGaoFVxEelK1NDEip/exkmTjyX9Sz0WAdKj5vPhYrJpCa76w9gJYbXH7YCCvJKNuZ4HjO3IReewnv2cwj/fMhhYMAa8dqtRVIhFpl4J/9h4FnW/GY24SKfuOb9V14HXlEpzGdG24HIQU4iO3vrAyF3EWN2hDh1fFxccW8H0ugDILqZMDIddAXtLLmShIoROpuBs2a7OjC0GuQuLKj3QZDzF15Lpj5xY5DpgP/qa7lvyuigWQHvRfR7DIeG1n+MKqup8WMd84phEO2y0tYnhHOdyuLvV7X+gE0OsmZe92uiUeL1JS1BCEPv2E3MOhma33Di5e6XTlGcTf5Lf/7x0HPCAcwS8GASn43LbmzGqgYVdYxdK9rZg0nGdft32EJUcpCNC9GglShvmafa80xbe580vzBh87peazNHnmsI/xf+uKRKFy4koz08uWms2CO244dDO81AtbkE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXlJY2tCNzl5ejRkbSttT3h3R2ZkOVg0U1dGcUNvREdoczBSUzV5dkV0ekhR?=
 =?utf-8?B?cTRoL25BSGZWTWc0dWx0MnFSc2FHU1Z1RHNaMHdNUUpRTHpSRDlxQ3lSSGpJ?=
 =?utf-8?B?MytHcGQzQmdMd01XU1dHbllOdWlHTGRLaS9JZkN5V29LY1RLUjdmMElKems0?=
 =?utf-8?B?RmMrTE84NWdMTkk4bWdsbzR5MmgxM3pzZUI3QzBvMlpCbTBWc1RVOHJkc21v?=
 =?utf-8?B?M0xFbEV3eVZHMnEyUjhZSmU4cHNwcVkrYlJwUUhwT1JHYm4wMEQ1SHdaSmpG?=
 =?utf-8?B?R2piSU5lQzBDL3NSQWpNOEF0cExGUVBqcUpCcTByYk0xRldmaHc0dlp3bnd4?=
 =?utf-8?B?NmxoRGJQNnZRdmRXT01TL1NUQUQ1WkIwN3VERFp6cUxDUkdlMmpRNXk0M21F?=
 =?utf-8?B?cTM1Vm5sa21rYzlsMlpOMWQ1eEdMRFJBK3puQVFTVW9GSGRGT3hHbkxybDJC?=
 =?utf-8?B?Y2xrd3QrMW1qZlJXNHZBRGU3WXpUT3EwVU5EbURZc2dlTXhiQ1FQNC8xajNU?=
 =?utf-8?B?YXFHcFRPQ0U2Y1plL0Uwb0pNc0lodXZRQmxkaUwwVlZ6RDU3NFo1ZkQ5eTNB?=
 =?utf-8?B?RVpGcS9XUTkxa1VBZEZJMHIrL3hPWi9ETkErQVQxa3dzWW40NjVDZTVPQnNv?=
 =?utf-8?B?ZTdlOWdEbC9QenVoVXhHekxwVG1VNFI4SjZoQ1NmVHAyMVdnNVd0cGp0Qnpo?=
 =?utf-8?B?QnZabUdGVlEwUVNEMDUwSWVEWGZsTVVLSjhFVnZFM3dUQW9lUFFTdTBmaEZh?=
 =?utf-8?B?RC95Y1JPMG81R2RQOVBveGdsdHZuWDYxSDRVVGZWTEdnTTd3RVNrQWNXZVVx?=
 =?utf-8?B?dXlzL2tpci96bDVaOXNJenZKcTR4OWFLcmxxVDJseUNEditTMWJNTXl5UkM3?=
 =?utf-8?B?OGROWnhoM2pkQUNNck5GRXliMWFoV2gyaVlHdjEyeS9RTzhSb3Q3R0FTeEU0?=
 =?utf-8?B?dGpiTzRLb2M4cEZDRTdCR1Uvc1l4c0ZEeExKNUY1YWFNYkZ2ZHlnTS9sa0dO?=
 =?utf-8?B?WVN2akVjVW56cHhKV1hjQlhkZW5ESENyV0dDV3BUbm5DOFFiMEhmc2k0Rk5i?=
 =?utf-8?B?V1hzV3Y2RDMzcjZIbkt5QVI4dmxFNnpYWS9VUDVyWFVvbU9sWFZkbVZFZC9K?=
 =?utf-8?B?SWZBeVFzUjh4a09VVGhMamVsYmhyR3hNQktUa1F3QVZtRWRMZXRETnYvMnFQ?=
 =?utf-8?B?OGNFRFpPWHFxZU40TkJhVWRidHdVVksxVHRZckE4NnFTdFgwK2d5VVQ4WnV3?=
 =?utf-8?B?WXppSU5PcGtWNFdKTVFvbWdWejJ1UVJCSlIwb1UwN2RnYkFSZXo4Wk05b1lV?=
 =?utf-8?B?UGhXT2t2VDMzTy8yWTNsUkN0ZmlRa08xYVdKUHh6VGt4dXdvNktpdU9KWTc3?=
 =?utf-8?B?WHh4bUowY3htQjNWaDBLQXBNZjdKQXd1L2VyZW11SVNMaUtlMW1MZFc4UUpC?=
 =?utf-8?B?NFVVNXNHMnJDUjRrVit3K1B3VjQ1aUVMU3hXQkZUMTA2VC9pNE9UZkQ2aC9y?=
 =?utf-8?B?d3A5TU5tVjVXeVA5Zkk4UjVacDZwY1RLVmJ1TW9xTldpSmNuQnNlS3hPcCtN?=
 =?utf-8?B?Y01jN0U0NUNLclFhQUNYR3laUlpMMkYzeVpzZEhyUU5CU1NQTlRqNFN2TjFH?=
 =?utf-8?B?R2F6YjMveW5CTUVnNjBscHJva29QV3JhZldjSkZNMHFTTUhSeVdTSmVhRC9R?=
 =?utf-8?B?Zm9rOVJ3SE1KbWVGb3Z4OG4zRGhBYlBPSzY4SVdWMGUySno4UE5YVXB6bjdm?=
 =?utf-8?B?MTBqSWpRUVRiTlZnMmI5N1pBYVpTbUZVSlNXS1ZlZzg4SnpPcDFiREFCYUNq?=
 =?utf-8?B?cGUrVFh0L2taSm9HRnVobU5PSWVPbnVGNzNZR0JIYjczdmNPK2dvVGZoNkRI?=
 =?utf-8?B?MzFGQzRTTmxXOWpUWXVjSS94NW10VWhja1pxU2hLZ2RFTjNvbnN4ZEZoS1ow?=
 =?utf-8?B?U1ZsUi8yZE9RblRwNnpNd1ZYZTg4YzZEbTlkY1ZmSUNwMTFBZHNnZnljTFY2?=
 =?utf-8?B?bjY5YnVVclFPWGlKQUpJbTQ4YlpVbGdleUVQdzZtRmVXQnR3TnFabjFDMDhR?=
 =?utf-8?B?dG5RNHNCdnJiOFFOWW5aVEJ6b2NINlVwczZvMkMvbXZzeU96UWk2Y3dQNTc0?=
 =?utf-8?B?WGxxMVowOEVXZkdmSldIZWdGQmpLK0dUbENNN0pZYzFGMWFuTHA4RmZIYXVH?=
 =?utf-8?B?S0xMNmh1Zk1Bbzd6MFV2MnV0N1NoUGl0Q0FxTm9rUGJaRVE1K09wbVJEL1R6?=
 =?utf-8?B?N3JXZktGNXhlUVJzc2l5b3cvdnFyREtYUEVSZWMxeEg1VzZtMEVUa2J4MXR2?=
 =?utf-8?B?WFVuVm5rMDd4alhZNzN5dy84TGpYWUdrYkgvRkVXaTRhQjh3SGV0dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9e8341-a50c-4df9-b5b2-08de7a944cb4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 08:50:49.5911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jljAOfFXE9eqxjSwqe8EhKosadhqOYhAGYK3lUjuGJXWgXqRJelEWHNltJ8Y9vwR0xHkgJMz2ZXVJ6YWvJXeUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6534
X-Rspamd-Queue-Id: 7838320DBFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:17:23AM +0100, Jan Beulich wrote:
> On 04.03.2026 17:36, Roger Pau Monné wrote:
> > On Wed, Mar 04, 2026 at 03:37:25PM +0100, Jan Beulich wrote:
> >> The treatment of ACPI_PDC_CPPC_NATIVE_INTR should follow that of other P-
> >> state related bits. Add the bit to ACPI_PDC_P_MASK and apply "mask" in
> >> arch_acpi_set_pdc_bits() when setting that bit. Move this next to the
> >> other P-state related logic.
> >>
> >> Further apply ACPI_PDC_P_MASK also when the amd-cppc driver is in use.
> >>
> >> Also leave a comment regarding the clearing of bits and add a couple of
> >> blank lines.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Including XEN_PROCESSOR_PM_CPPC may need accompanying with some change to
> >> arch_acpi_set_pdc_bits(), but it's entirely unclear to me what to do
> >> there. I'm unaware of an AMD counterpart of Intel's "Intel® Processor
> >> Vendor-Specific ACPI". Plus even when the powernow driver is in use, we
> >> never set any bits, as EIST is an Intel-only feature.
> > 
> > We possibly never need to set any bits there for AMD, as those _PDC
> > Processor bits are Intel specific?
> 
> Indeed, that's a possibility.
> 
> >> --- a/xen/drivers/cpufreq/cpufreq.c
> >> +++ b/xen/drivers/cpufreq/cpufreq.c
> >> @@ -694,14 +694,23 @@ int acpi_set_pdc_bits(unsigned int acpi_
> >>      {
> >>          uint32_t mask = 0;
> >>  
> >> +        /*
> >> +         * Accumulate all the bits under Xen's control, to mask them off, for
> >> +         * arch_acpi_set_pdc_bits() to then set those we want set.
> >> +         */
> >>          if ( xen_processor_pmbits & XEN_PROCESSOR_PM_CX )
> >>              mask |= ACPI_PDC_C_MASK | ACPI_PDC_SMP_C1PT;
> >> -        if ( xen_processor_pmbits & XEN_PROCESSOR_PM_PX )
> >> +
> >> +        if ( xen_processor_pmbits &
> >> +             (XEN_PROCESSOR_PM_PX | XEN_PROCESSOR_PM_CPPC) )
> > 
> > Currently the CPPC driver is AMD only, and hence when using it we
> > don't care about filtering the _PDC bits, because the ones Xen knows
> > about are Intel-only?
> > 
> > As you say, we likely need some clarification about whether there's
> > _PDC bits AMD care about?
> > 
> > Linux seems to unconditionally set bits in _PDC, so some of those
> > might actually be parsed by AMD.
> 
> Or it setting whatever it wants is meaningless on AMD systems. Where I
> have extracted ACPI tables readily to hand, there's no _PDC there.

Oh, interesting, so there's no method to start with.  Is there an _OSC
method however for processor objects?  _PDC is deprecated, and maybe
AMD systems only expose the equivalent non-deprecated _OSC?

> > I think we might want to split the setting of XEN_PROCESSOR_PM_CPPC
> > here from the addition of ACPI_PDC_CPPC_NATIVE_INTR into
> > ACPI_PDC_P_MASK.  The latter we can possibly untie from the questions
> > we have about AMD usage of _PDC.
> 
> Hmm, yes, I can certainly split the patch. I'm looking at it a little
> differently, though: Us leaving any P-state related bits in place when
> cpufreq handling is done in Xen has been a mistake anyway.

Yes, TBH I even wondered whether we might just wipe whatever the OS
sets in the _PDC bits and completely fill it from Xen (unless for the
weird/broken case where dom0 is driving cpufreq?).

This is kind of what Xen already does now.  However see below.

> What's
> unclear is solely whether because of us driving things some bits need
> setting (likely none if AMD systems indeed don't surface _PDC in the
> first place).

Since we have the parsing of the ACPI related data done from dom0 it's
not only Xen that needs to support the feature, but dom0 also needs to
know how to parse it.  Or we just assume the driver in dom0 must
strictly know how to parse data from the features enabled by Xen.

Maybe Xen supported bits should be & with the dom0 ones?  So dom0
would set what it can parse, and Xen would AND that with what the
cpufreq drivers support?  However that would be an ABI change.

Thanks, Roger.

