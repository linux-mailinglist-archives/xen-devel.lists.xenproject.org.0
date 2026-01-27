Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAtFHLo7eGnsowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 05:14:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE5F8FD28
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 05:14:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214071.1524476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkaSM-0001st-47; Tue, 27 Jan 2026 04:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214071.1524476; Tue, 27 Jan 2026 04:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkaSL-0001qx-VY; Tue, 27 Jan 2026 04:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1214071;
 Tue, 27 Jan 2026 04:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nq+A=AA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vkaSK-0001qp-E7
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 04:13:32 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 864654f6-fb36-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 05:13:26 +0100 (CET)
Received: from DS7PR05CA0079.namprd05.prod.outlook.com (2603:10b6:8:57::9) by
 CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 04:13:20 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::7a) by DS7PR05CA0079.outlook.office365.com
 (2603:10b6:8:57::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 04:13:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 04:13:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 22:13:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 22:13:19 -0600
Received: from [172.29.134.248] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 26 Jan 2026 22:13:18 -0600
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
X-Inumbo-ID: 864654f6-fb36-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nh/XBHWqd+2EYWkVRa7euWOGO7HOmWnMIeV1ry6EFin7JDGoqQpVz8MGG9dXL8up0RXMhpo96BHGOiQOUUzlRQ/rCVe6DCNU7RuAZDeXqSYmUQ9HPHMLY2dB5+FALZodSPacTMZ7Ayqmmv+VdVvpvDnKkA1XNtG+zrAtJ1mX/GyllJZJOJMU/idzA9G5jUmlGFmRK521W+DpkDkieKiU8RREpcFxIOE4PlXD20wUVnLuOtCM+PAX71ar9aOfpCXSUWvuCcYvNgC9gcuZXyN0Wgbj9zH5JrZHCW9vLVdNKl/5iM/+PcCXwSv/tvE5TQVu7dvRn1Gx1D0YDMI8W+7xlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ov61H8GFM6LGnpAsfu0E9lm8ujvcYFn91F3JOCrMpQ=;
 b=s5ys4yJ/aYZMLygnPR3M1fCT+Av5vz/d2F0C6UcTt1/hS22qH/dMyzpLgbk6uW7x/sSw8ohitSl/CnfbvRLq9whyIixlMLSPW53LqDD64H9h3/qPPhuOyPp2Ohq/jVY1xOXglrFpiiXj1u+D7jJJ7fFjDTXnykgd+IwlDFVi2f9r89HSExzUI6P0Atd3TtbFby/fsAPfqtsFenD4My/PCfzRH4AtoyV1NBuSBS6tkP/yaYTEgd+B3THYJISPRnRQdEGdkUHDm1pGS6Lerdtxddm39jRp+jkswWNKMyXkFTtVqYsNznX2/AdwKKy9N1rYlUtLja2yUjNmVXor4M6bjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ov61H8GFM6LGnpAsfu0E9lm8ujvcYFn91F3JOCrMpQ=;
 b=dBBdnTRRU47FwcGhtccaGEMkMCCA9u55q9HIjoSJAIrHkdjLhGQ5XKjlNpxyw1eLl9BQOiOrLwF/RONiFqo5czzfy9LcRZO0yDl4SIVrgcIFog7x776pAQTytHg+ew/CktFiVtIHsXqgug20piPCAim04jnhO+TXNuhV0TlSKEI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b6a4e2cf-e95f-461d-9c6e-34a2f8815d8c@amd.com>
Date: Mon, 26 Jan 2026 23:13:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI: determine whether a device has extended
 config space
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com>
 <fd509fbb-9dc4-4619-847f-6edd2a1bdb7f@amd.com>
 <553d1a7a-e465-413f-a60f-32455bbce621@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <553d1a7a-e465-413f-a60f-32455bbce621@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2b62bf-e0fd-4daf-0f4a-08de5d5a67eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajZMMDUxZjRXVDgxQXZsdi95dGVnTERuL0RyMngzenBEeFVPOVRjZlFuSXpj?=
 =?utf-8?B?YlIzYm9ZWEZoWUdNcVNMaGtraUJ6UjJsQXRwT3g5SlNKdVVQOGFtR2xlNUlX?=
 =?utf-8?B?NlMrb1dXR1c1VXNDajlsRjlucFFheGlWTDU0MFJZYTdWQXJORVlVeXpFSHV3?=
 =?utf-8?B?Z2N6MXdBUXlKNGtCWkk4YSt5N0hrS1l2bDM0cFgzU2xuSmRuTUgxaEdlU3Z3?=
 =?utf-8?B?TEpuMjBjRnRGbFR1Mk5wa25qVzdyNW82T1VFRDIxelNxVWxTbFF2eExZd0h1?=
 =?utf-8?B?V1h1Sk5rWmlFZFpBTmd0czRzU2pXU0dJVVVIV3VVS0JtZFJpWU9SQ0VQS1Uy?=
 =?utf-8?B?aDZoY1NIaTkwVms1eXBBd296NEVOVG93S013aHErZHMyZkc5TDhLR0dpWnFr?=
 =?utf-8?B?ZFdudU14MWxjWFFMaUdORGZxNnZzRHo3Vk5tR1c5NHU0N0w1WGM1TmQ2aTdE?=
 =?utf-8?B?Szk1c29WcG54TFBMUjdUdm5jVXNPc0FCR3Y0TmpPcGIxaGdNckxYWlZNUzdN?=
 =?utf-8?B?a3V1U2dqdCtXcDQ3WndvSlhYZStYbUl1bUJ5Z0FDSE1zTTJHN1ZTSjNZT2hw?=
 =?utf-8?B?RXJrMFZWc0Z5aU5ZSlB4aHhDMGpsaGNYRGMvRkVmRUh6QnBOeW5GY2lqNlJC?=
 =?utf-8?B?dHBTcy9ud0F1NlJkdzdSeUtDamRpY1Y0dlBTVlNtWWlQbkR2RjVFR2ZpT1VJ?=
 =?utf-8?B?TnFKUkxvYm9YUUF1TC94UkFmTFlDMHJEa201VU16djljNUNFRndwR0xzbnAx?=
 =?utf-8?B?WENLcThiSC9NanZIR1pNbTYyVWJCNDJ1ejJFN0pOTFFuMU13VW9DZFZXVlJi?=
 =?utf-8?B?RlQ5UmdsaU9xZlF4Q2hKcFRsdDhud3ZXaWppV1hoeURMTlpmeDZLUjlRU2Z6?=
 =?utf-8?B?MU83cjFTWTRnWkxYNWdCeUpmSEdhZkNVNi9BQWNRemJyNHpFclBHeU1URnZW?=
 =?utf-8?B?bUNvLzlZeDBhM3B4MGY1Y1dVcGIyQW92Z1ZoYnVRamdMelQwNEo2aldpa2xG?=
 =?utf-8?B?TlhUUlcyRTkwS0k4SGJsazZUNjFveUd3SDdkbzBPSVBGdWFZRFVwU2lJaGo1?=
 =?utf-8?B?NkNZU094Mys2eDNWbHEwc0VNU09zcFN1bVY5QmJzU09OMGoyLzNtWTZhZ0hS?=
 =?utf-8?B?ZlR2THVOREZJRlplOHdxWWxBZmRqNWtZZjZNdm5Tb0U3VEZqTFRMZGxQV0VK?=
 =?utf-8?B?dlJQNmNlNmRyb1ZkR0RBVU9XS2ZLZjBhdEgwVkhMT2xxNFJjM25NNndzajRM?=
 =?utf-8?B?TGNCY0ttZ2xmN25CS2d4OEozME1PZ3NXbTY1RVhlc01MdThrZzlVR09CMzBI?=
 =?utf-8?B?UTgrQU5SKzNsNDFkalpuQk5FR3NaMXdzY0Uvbk5ZQkVFZk1qMkJMODFxSUJI?=
 =?utf-8?B?NjZMS25KdkFPK3d1WWdPWDAzTzRiRkU0cm90OG1uVzVvaktrMklOQVdGL1dE?=
 =?utf-8?B?VjlrNXVFTzhLaDBzRForUXNDdVNGOFBtRTkxRm1WYmJEQ01iQWRNNlpUMWg3?=
 =?utf-8?B?SzFmTnRpK25QaEkxUjJTVTA1ZDRaWWRTMkVKekkzYWwrakpYVGE4czFGV21J?=
 =?utf-8?B?WUtTVFlaajNMb204QnEwYkh2SmoyMUxoWDY1dEhRMHlUaEFuZ01sK2t3a2Zt?=
 =?utf-8?B?QXc4OTVNY1J3bUlLUlEzcElEUGhQR1VsRUNZbGNObXVNTXVPUGsvKzdzUkIv?=
 =?utf-8?B?cUhTOGlVQWtBcWNqYmJpN1BUVGNzbVRIdEFDcWFSdHdoY0tOa1ZJejhzV0Ir?=
 =?utf-8?B?d3Q3cmw4QTJGYjFrakxxM3Bva1JxLzRxOUxoelRiRzI0TmVScEtaTExZaW50?=
 =?utf-8?B?WlluMTVVeG8wVlVvdVpZWm1EejFoVlpvakxWbHNwYllwOVdQUFRQbElqcnZN?=
 =?utf-8?B?a0NIeUZFMFBRTDU2RHhScS9KL0x0b09TNU94VHJQTythOHBIY0xoNDBxQjdN?=
 =?utf-8?B?RGVNL3Zrb1o1RmpDUWVwVENld2FvWXREZ2wwYUlZbmx1SWlCK0lvYkhDYTNj?=
 =?utf-8?B?dlpYTXJ5cG5FU2pTZGFVWElGM2RtOWZxdHBZdTd2bWFwb291TmtCbW54dWtZ?=
 =?utf-8?B?UEVlbG9NbEo3bzhsUmptMUlwQ2dIcFNHclNNeXhUSUppQWN0Q0FqdXIvUFJq?=
 =?utf-8?B?S1pyb0pHMDlETy9FWGcrbkxJd1NUQ0t4U2I1Zm9UVi9FMFVYVjlOSFZ5R2k0?=
 =?utf-8?B?bVVvSkJqTlh1a3k4a2JEUmpWTUpxNDdNTFE1REpyMDJqK3hVQUNXWVhZWnpa?=
 =?utf-8?B?eEJvRy9NejNidmExcENrUm9iMVJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 04:13:20.4298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2b62bf-e0fd-4daf-0f4a-08de5d5a67eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: CAE5F8FD28
X-Rspamd-Action: no action

On 1/26/26 03:58, Jan Beulich wrote:
> On 23.01.2026 23:24, Stewart Hildebrand wrote:
>> On 1/19/26 09:46, Jan Beulich wrote:
>>> Legacy PCI devices don't have any extended config space. Reading any part
>>> thereof may return all ones or other arbitrary data, e.g. in some cases
>>> base config space contents repeatedly.
>>>
>>> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
>>> determination of device type; in particular some comments are taken
>>> verbatim from there.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Thanks, but see below (as that may change your take on it).
> 
>>> ---
>>> Should we skip re-evaluation when pci_mmcfg_arch_enable() takes its early
>>> exit path?
>>
>> I don't have a strong opinion here, though I'm leaning toward it's OK as is.
> 
> Maybe I need to add more context here. Not short-circuiting means that for
> a brief moment ->ext_cfg for a device can be wrong - between
> pci_check_extcfg() clearing it and then setting it again once all checks
> have passed. As long as only Dom0 is executing at that time, and assuming
> Dom0 actually issues the notification ahead of itself playing with
> individual devices covered by it, all is going to be fine. With
> hyperlaunch, however, DomU-s can't be told "not to fiddle" with devices
> they've been assigned.
> 
> With the yet-to-be-written vPCI counterpart changes the window is actually
> going to get bigger for DomU-s using vPCI.
> 
> For hyperlaunch this is going to be interesting anyway, on systems like
> the one you mentioned. First, without Dom0 / hwdom, how would we even
> learn we can use MCFG? And even with hwdom, how would we keep DomU-s from
> accessing the devices they were passed until ->ext_cfg has obtained its
> final state for them (and vPCI reached proper state, too)?
Ah, I see. Thanks for the additional context.

First of all, to re-answer the original question, it still feels more of a
nice-to-have optimization than a necessity since we don't have hyperlaunch PCI
passthrough upstream yet. Of course, skipping re-evaluating ext_cfg would be a
welcome change if you're up for it. An alternative approach might be to
implement pci_check_extcfg() such that it only modifies ->ext_cfg if it needs to
be changed, but again, I don't have an issue with it as is.

With that said, what do you think if we took the stance that ->ext_cfg shouldn't
be re-evaluated for a pdev while it's assigned to a domU with vPCI? I.e. we
would return an error from the pci_mmcfg_reserved hypercall in this case.

If I understand things correctly, conceptually speaking, from a system
perspective, setting up mcfg is something that *should* be done at boot, not
ad-hoc during runtime. In the hyperlaunch model that I'm envisioning, there will
also be hardware/control domain separation, and we will want to limit the
hardware domain's ability to interfere with other domains. So I'd consider
disabling the mmcfg_reserved hypercall anyway in such a configuration. The
assumption with this model is that we would not need rely on dom0 to enable mcfg
the system/platform of choice.

Longer term, if we really think we need to support hyperlaunch while relying on
a dom0 to initialize mcfg, we could potentially delay assigning pdevs to
hyperlaunch domUs until ->ext_cfg has been initialized and is not expected to
change. This would imply implementing hotplug for PVH domUs (also needed for
"xl pci-attach" with PVH domUs). I wrote some patches in an internal branch to
expose an emulated bridge with pcie hotplug capability, laying some of the
groundwork to support this, and I'll plan to eventually send this work upstream.

In the scenario without a dom0, I don't have a good answer at the moment for how
Xen would learn that mcfg could be used.

