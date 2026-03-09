Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOotMnvNrmnEIwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 14:39:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D1239DDC
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 14:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249507.1546974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzaop-0001Nr-2E; Mon, 09 Mar 2026 13:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249507.1546974; Mon, 09 Mar 2026 13:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzaoo-0001Md-V5; Mon, 09 Mar 2026 13:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1249507;
 Mon, 09 Mar 2026 13:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqfy=BJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vzaon-0001MX-QD
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 13:38:45 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48fdf30f-1bbd-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 14:38:42 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8047.namprd03.prod.outlook.com (2603:10b6:208:596::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 13:38:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 13:38:37 +0000
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
X-Inumbo-ID: 48fdf30f-1bbd-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jhp+xVVhAZo2OX+UivxzzwGfZOmP9aacCe5it+UQEt3ShqeRA71Dvq6NDCtmJmaSZQozDuxT3Jfc20oGGF9X02PvykoTGGve3O/STervJ1t7eL6u86SmXFAbNaG75v+cjm1JTQraJuts9DSS3UATc5EB+9mAMkpg10rUWyBqGRBCMuNz4yi/JYQEIUxzWciJDy/jyV1jUvomfWbK5UWc+UZ3kfBV5V/dMfCrCXcYIcr9o4NNyKMkPUONtovToBlmYQPddDgWvmh4XCuKDdEe6DCE9q0cbz4hHh4LoAxtg1XRCxBXcuZkQOPtnVil6Ia19p/FlFJf5EBveBtRx9D/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3Kjmze1PvonsWyS6ZRnDjxJM008BAiAB/e5vCFFx6s=;
 b=gvZ1Cd5o/KOKbvMJxIGcvLjLlrQ3aHXEYrhn3C9YJmtnwbZMAHcFP2SGtrlJvVv9ynSzWsCJag1CgE7Trisi6+SI10SskfFku9qZd/0iFOfO0ZbOdT3fBlbs1n8Js/lXIuuCfWjmM0tMKydYUJRtaiG6LEeF8kG0wztUBoqZcK8wJfIITq9Z//dxBx6A9NyW3YIErdRcT+gl4yjpklwV2cbmfCAfMOXJK9Dng5mQs1MCuA/ZZNizHUiGKhM5yMSRdc7Sj4OnGBU1stsRnf22ps10SAsGwajgN3M9PRSR6iAL4awW0lW6r0/G0K+4ykHx4kQ4U8KVVgYGCIeE9V8W4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3Kjmze1PvonsWyS6ZRnDjxJM008BAiAB/e5vCFFx6s=;
 b=V4zrfeiZc5cjjwV1ixVQLLUMwqDQXW008VuzSdO26v3wvmA4NrkCsuJkL9gtiaem/pGWbgCAP3d8LTpAFCqgzgR4VxAg02nv5WYk8E5IiLehNdtvDGVXytgd2w76cHIGxbJxDc861y+FIPsNRVR1nzCGlWzptbf0fqUfP2uZZ2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Mar 2026 14:38:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 5/7] x86/dmop: Add XEN_DMOP_{bind,unbind}_pt_msi_irq
 DM ops
Message-ID: <aa7NWl8oKFS5ZDAP@macbook.local>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-5-julian.vetter@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309123055.880050-5-julian.vetter@vates.tech>
X-ClientProxiedBy: BL0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:91::26) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: c62b4e96-6767-4c1a-fae5-08de7de12a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	m7ffxQikZYey/DUm2ZrptAXIWCtLw5dpYBso9/Cm5UFUN86kCJe2IlqX7ZsnSY7rIAx3uU/6AY59TaEgd6YZ8xBMEdomaz+V0FONaU1ymNAFMGZUHXvCtCxVyFIzNdGYoTHSBQqrpTGbzovTNSe3RtsN5Km05rpFbHCdAXNzlkGjLkrYECkBB1m4EILB1CNGseYLlDU5ENmv/l6NMJhFkzE6yND1FpfQKJji0goZCFvFwzEEuJcYZQ0S2ltisHCQhs97RAVU44VtSpsl+PTb0d4/t8tb+IXeU4sY16NcQljChmUglH7q0cxmz/lCUPDfe6YFcf3Sp/Gv5PcbwriVofR2aZweQL1+HHZ9ogfOyTPUvVTcaRYGRMEPxnEbC6KVYnzZ/0ZWnxLpruOgtyJvy+Sf2onoD3nduJm/MSy8IXiw2BOXsExv+nXQvtmoVNNNf7VwV48mbBe7zWlQXZ3wKVoE53qcg0qIMihXNGZO6KQ4odq6EFIOTHzot4dxL8c+MAT/znutd923itTzDuaCbuPgXhMBr5hVczzP97Vjwl0kd4+fuc9UZxklGFZv6MpG6MTVPoJt8pJJ0vb5ojbWoQ8lE7ESBtcFj2S2q6K/ClIRrpEJrSbtOldOJBcbF6aLwcb8imPc2bvcfZhtDqOYAUYRhI/HJMltekIKwQX1DxNksZHmXOOaJ/18ND6ib0mO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2Y0STRMN0U5UExTa04vK3QrRUQyQ1A0MytoTVVsQ0hpdU1Ba0d0T1V0WFVj?=
 =?utf-8?B?ckRLOHVNMTNiZUtyTWsxYXhDYVF6WnJtVU9ramNzOWU4VUFvYjdhZGRFNVVS?=
 =?utf-8?B?ZWd4WTB4ZEJVekJSdDJlUXhPMFBVMGZkSDF5dDR0V1lZcEg2dEFxNUI2Z20r?=
 =?utf-8?B?b01EbjFSQmNGOStkQjZhU05CZm13Q2xackxjQjFSSHdYR3BpdWJ4ek0wUFBV?=
 =?utf-8?B?Z2FjUUZiNDJ3NmJGMnJVK2dGaTZpcmRZc2xEV0wrZ0I1QWhCZ0FJYTB6cWhG?=
 =?utf-8?B?eUFCZWMyN2d2VXJKOVpBTXZGTFVZQkFmTkI1ZEtGdzB2MFIyYU1Ua0x6WXF6?=
 =?utf-8?B?YmZTN3piWjBaRUgxNytFSWd3ZitoZlFrRkl1Z0xRU1hCOWt5N0dnbUpTeGRS?=
 =?utf-8?B?dSt4K2Y3cWVyN3Y2ZWFINUcrTGw5Q1RtMHR0Q0dDL0pYSGNYMDlQQUZ4ODVS?=
 =?utf-8?B?OUJSSzIwbjl0dXZyM0dGVDJjVXVaVGJHNm9CWTVhbmg0d1RWNkNpNWo2QkFE?=
 =?utf-8?B?UHFRQk5iUWxrYnlVVUxRUVFUTW5Xa1hva0Z6NlFpU0U5TDNkQUVVTDZPQkNK?=
 =?utf-8?B?bDM0YjBrQUFTNGNpSitLSjQxVnR5c2VTbTVNQklDa2pJWGtYOXcvbit1cU82?=
 =?utf-8?B?dGJvcGh3UGI3Qy9rUjNNckZJVE9rZVBza3NReitQVmFhS0lnaFhFSE51c3hp?=
 =?utf-8?B?dFhkV2FuSWRFcGkreGVlY0hRVFZpOE5jOFpVR1kvTjBJaGxZc0t2dzZsRGZO?=
 =?utf-8?B?L0d4dzZiblY0d0tsSndZRk1SY01VL2xIbjEya2p3ZHNXRnM4bmVUNWRJcTZ4?=
 =?utf-8?B?bXFMSkNrbEV3NkhWVlFNbmFNRStRcEZyUmpHNFdsSnBPVk1VdUpSY3d4SEVp?=
 =?utf-8?B?aUU3L2plYTJTaWlYUkVrYVloajkwQ256OWcyaFgvcEpJNmpTdkVKUjEvd2V5?=
 =?utf-8?B?dUZqNTF0ZTR2WVNSM2pWT0VXVTRHZkZXWU9ERWE5bE4zYVJrQSttTWxaZGdU?=
 =?utf-8?B?cnNwVkg2VE5VNHBqdWZBRE0xUzJMRnV3azJ4Ui92d2ROV2ZSRkVSeURUd09Q?=
 =?utf-8?B?MlVzK1c5bHV4Y0dtR0FobGpyYzVHWU43T05RbS9xNlZYWHkzTGxKd0tTYk96?=
 =?utf-8?B?cVI3V2xEbWZwdXVpR1RpUHdGNVp3V3RMQjBrZng5emdTK1V2MTNRbFJiU3hL?=
 =?utf-8?B?akxoNDZXa010NHhHZm9oQ3ZpRTBvbFhXQUU1a1lzTDVQYjBObHRqdG1iR1la?=
 =?utf-8?B?THR0T2FFZWJCWWRqVmIvSHFvdGZKTGpodmhzZGhVYzdQMGk1Zmt4bk1YNXNi?=
 =?utf-8?B?OW9QT09KVTVVZkdyT1hldUFaSkdQYVRtTWwzd3lUZ3d2R0FVWFBPZlNYMHpV?=
 =?utf-8?B?THVJRVBaN1hXTVhGSW50d0J2SzNHRHlWM01yTWxvdFJGOEI4L2lRZDJGQzdY?=
 =?utf-8?B?VkN1MkhKZjk2LzNTNWFkd29IT0g3QlpmSjFuNllmSnVLQlNaa29xNEF4U2JV?=
 =?utf-8?B?VXVHdk1YbmVrZEhtbkNwVkRDT0xDSisxSWlDZHJaQkMraEgrQW9KbzZBSXRU?=
 =?utf-8?B?ZHVKeHNPT3VSMjEwVm0wMTBHQlJWUGtDVW0zM01tUzYxcGxSc28zUXc2b2xv?=
 =?utf-8?B?bmpCb0RZRkJjanhJcXJoSmJ6eml6Ynl1YlJyUnF1c2FYR0ZYM3U2OXplUTd2?=
 =?utf-8?B?SzBUSy9ONVJ5Z0NWVXROZThlSWlYSCsvM0xoRDh2NlA0ZDJxNW9pNThLYVdJ?=
 =?utf-8?B?QjFFanJjZU5sQXRnSU9YYzRzYk5qODF6QkVvclBYRitGUjFxcWJ3VWJVNk1s?=
 =?utf-8?B?Sk1zN2xTSzJEeWt6dDNCNURkMWR1anBwMmlBdHhsVEZINjJiczcyUHZIRzl5?=
 =?utf-8?B?V3h1UURKSUhOMzlqeWVnbDVNcDArMkQ4RVovWHhGRFlndGx2ellERUhWZ3B0?=
 =?utf-8?B?QmtvbW4xTE5iN1BOL1hWUnVwL3crUU1GT2NlcXJMR2hiRFgySEVucGFKVmRn?=
 =?utf-8?B?TjJvSXFTTGNOd3ZSMVZGME53VDMzZnpNRXJ0c0dwSTdUd1JoYzdGTEFPVGMy?=
 =?utf-8?B?aGV5dUtmUjJoYlY4bis2OE82eFFtanlYWlRSblRqK1lwS2RaS1dvT1VNem9r?=
 =?utf-8?B?QXd5WWk2RnVaUVlhNXBGMkcyQk5nZHFCcmUyVFRqQ3hHU3FteU12VWRwK2lv?=
 =?utf-8?B?QjMrcVAvMG1wKy9YRklBZVFYQVJnbXZFMVZZNmlna1RPMmo2N3MvYUR4MEI5?=
 =?utf-8?B?dThWeGc3TFBmdUhwRkMwa2pZRTB4L1hJQXEwa0lxNUhVUVc0KzRoTkcvSERI?=
 =?utf-8?B?MHN1SnNPUmcwOXR3MjNvWTNjQ3BRcSs1OHo0N2V5aWhNRFhRRE81QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62b4e96-6767-4c1a-fae5-08de7de12a9a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:38:37.2181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwoeFWTCqD4wZ3/MnOOkC6Q89Buj+m2a4ULdojm3GufTiLP1l7YQS7/X4o3WLiiNp0GVSWCgmkMgi2+a0j18fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8047
X-Rspamd-Queue-Id: 189D1239DDC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 12:31:03PM +0000, Julian Vetter wrote:
> Add two DM ops for MSI passthrough IRQs. These new DM ops take the raw
> MSI address and data fields rather than a pre-decoded gflags values. Xen
> decodes the destination ID via msi_addr_to_gflags(), including any
> extended destination bits in address[11:5]. This means the device model
> does not need to understand the extended destination ID encoding, and
> simply forwards the MSI address it observes from the guest.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in V3:
> - New patch addressing feedback from Roger
> ---
>  tools/include/xendevicemodel.h |  37 ++++++++++++
>  tools/libs/devicemodel/core.c  |  44 ++++++++++++++
>  xen/arch/x86/hvm/dm.c          | 102 +++++++++++++++++++++++++++++++++
>  xen/include/public/hvm/dm_op.h |  23 ++++++++
>  xen/include/xlat.lst           |   1 +
>  5 files changed, 207 insertions(+)
> 
> diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
> index 227e7fd810..0d5d7b0ff1 100644
> --- a/tools/include/xendevicemodel.h
> +++ b/tools/include/xendevicemodel.h
> @@ -375,6 +375,43 @@ int xendevicemodel_nr_vcpus(
>   */
>  int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid);
>  
> +/**
> + * This function binds a passthrough physical IRQ to a guest MSI vector
> + * using raw MSI address/data fields. Unlike XEN_DOMCTL_bind_pt_irq,
> + * this interface supports extended (15-bit) destination IDs by having
> + * Xen decode the MSI address internally.
> + *
> + * @parm dmod a handle to an open devicemodel interface.
> + * @parm domid the domain id to be serviced.
> + * @parm machine_irq the physical IRQ number (pirq).
> + * @parm gvec the guest interrupt vector.
> + * @parm msi_addr the MSI address (0xfeexxxxx, includes extended dest ID).
> + * @parm msi_data the MSI data (vector, delivery mode, trigger mode).
> + * @parm gtable the MSI-X table base GFN, or 0 for plain MSI.
> + * @parm unmasked if non-zero, leave the IRQ unmasked after binding.
> + * @return 0 on success, -1 on failure.
> + */
> +int xendevicemodel_bind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
> +    uint8_t gvec, uint64_t msi_addr, uint32_t msi_data, uint64_t gtable,
> +    int unmasked);
> +
> +/**
> + * This function unbinds a passthrough physical IRQ previously bound
> + * with xendevicemodel_bind_pt_msi_irq.
> + *
> + * @parm dmod a handle to an open devicemodel interface.
> + * @parm domid the domain id to be serviced.
> + * @parm machine_irq the physical IRQ number (pirq).
> + * @parm gvec the guest interrupt vector.
> + * @parm msi_addr the MSI address.
> + * @parm msi_data the MSI data.
> + * @return 0 on success, -1 on failure.
> + */
> +int xendevicemodel_unbind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
> +    uint8_t gvec, uint64_t msi_addr, uint32_t msi_data);
> +
>  #endif /* XENDEVICEMODEL_H */
>  
>  /*
> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> index 8e619eeb0a..4a52fe4750 100644
> --- a/tools/libs/devicemodel/core.c
> +++ b/tools/libs/devicemodel/core.c
> @@ -645,6 +645,50 @@ int xendevicemodel_nr_vcpus(
>      return 0;
>  }
>  
> +int xendevicemodel_bind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
> +    uint8_t gvec, uint64_t msi_addr, uint32_t msi_data, uint64_t gtable,
> +    int unmasked)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_bind_pt_msi_irq *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op.op = XEN_DMOP_bind_pt_msi_irq;
> +    data = &op.u.bind_pt_msi_irq;
> +
> +    data->machine_irq = machine_irq;
> +    data->gvec = gvec;
> +    data->data = msi_data;
> +    data->addr = msi_addr;
> +    data->gtable = gtable;
> +    if ( unmasked )
> +        data->flags |= XEN_DMOP_MSI_FLAG_UNMASKED;
> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> +}
> +
> +int xendevicemodel_unbind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
> +    uint8_t gvec, uint64_t msi_addr, uint32_t msi_data)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_bind_pt_msi_irq *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op.op = XEN_DMOP_unbind_pt_msi_irq;
> +    data = &op.u.bind_pt_msi_irq;
> +
> +    data->machine_irq = machine_irq;
> +    data->gvec = gvec;
> +    data->data = msi_data;
> +    data->addr = msi_addr;
> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> +}
> +
>  int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid)
>  {
>      return osdep_xendevicemodel_restrict(dmod, domid);
> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
> index 3b53471af0..3d530d948f 100644
> --- a/xen/arch/x86/hvm/dm.c
> +++ b/xen/arch/x86/hvm/dm.c
> @@ -7,12 +7,15 @@
>  #include <xen/guest_access.h>
>  #include <xen/dm.h>
>  #include <xen/hypercall.h>
> +#include <xen/iocap.h>
> +#include <xen/iommu.h>
>  #include <xen/ioreq.h>
>  #include <xen/nospec.h>
>  #include <xen/sched.h>
>  
>  #include <asm/hap.h>
>  #include <asm/hvm/cacheattr.h>
> +#include <asm/msi.h>
>  #include <asm/shadow.h>
>  
>  #include <xsm/xsm.h>
> @@ -322,6 +325,25 @@ static int inject_event(struct domain *d,
>      return 0;
>  }
>  
> +static uint32_t msi_addr_to_gflags(uint64_t addr, uint32_t data, bool masked)
> +{
> +    uint32_t tmp = (uint32_t)addr;
> +
> +    return MASK_INSR(MASK_EXTR(tmp, MSI_ADDR_DEST_ID_MASK),
> +                     XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
> +           MASK_INSR(MASK_EXTR(tmp, MSI_ADDR_EXT_DEST_ID_MASK),
> +                     XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) |
> +           MASK_INSR(MASK_EXTR(tmp, MSI_ADDR_REDIRECTION_MASK),
> +                     XEN_DOMCTL_VMSI_X86_RH_MASK) |
> +           MASK_INSR(MASK_EXTR(tmp, MSI_ADDR_DESTMODE_MASK),
> +                     XEN_DOMCTL_VMSI_X86_DM_MASK) |
> +           MASK_INSR(MASK_EXTR(data, MSI_DATA_DELIVERY_MODE_MASK),
> +                     XEN_DOMCTL_VMSI_X86_DELIV_MASK) |
> +           MASK_INSR(MASK_EXTR(data, MSI_DATA_TRIGGER_MASK),
> +                     XEN_DOMCTL_VMSI_X86_TRIG_MASK) |
> +           (masked ? 0 : XEN_DOMCTL_VMSI_X86_UNMASKED);
> +}
> +
>  int dm_op(const struct dmop_args *op_args)
>  {
>      struct domain *d;
> @@ -350,6 +372,8 @@ int dm_op(const struct dmop_args *op_args)
>          [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
>          [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
>          [XEN_DMOP_nr_vcpus]                         = sizeof(struct xen_dm_op_nr_vcpus),
> +        [XEN_DMOP_bind_pt_msi_irq]                  = sizeof(struct xen_dm_op_bind_pt_msi_irq),
> +        [XEN_DMOP_unbind_pt_msi_irq]                = sizeof(struct xen_dm_op_bind_pt_msi_irq),
>      };
>  
>      rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
> @@ -607,6 +631,83 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_bind_pt_msi_irq:
> +    {
> +        const struct xen_dm_op_bind_pt_msi_irq *data =
> +            &op.u.bind_pt_msi_irq;
> +        struct xen_domctl_bind_pt_irq bind = {
> +            .machine_irq = data->machine_irq,
> +            .irq_type = PT_IRQ_TYPE_MSI,
> +        };
> +        int irq;
> +
> +        rc = -EINVAL;
> +        if ( data->pad0 || data->pad1 )
> +            break;
> +
> +        if ( data->flags & ~XEN_DMOP_MSI_FLAG_UNMASKED )
> +            break;
> +
> +        irq = domain_pirq_to_irq(d, bind.machine_irq);
> +
> +        rc = -EPERM;
> +        if ( irq <= 0 || !irq_access_permitted(current->domain, irq) )
> +            break;
> +
> +        bind.u.msi.gvec = data->gvec;
> +        bind.u.msi.gflags =
> +            msi_addr_to_gflags(data->addr, data->data,
> +                               !(data->flags & XEN_DMOP_MSI_FLAG_UNMASKED));
> +        bind.u.msi.gtable = data->gtable;

Retrofitting the new interface into the old one seems weird.  I would
do it the other way around - implement the old bind domctl on top of
an interface that's more suited for the new DM op.

That way you avoid having to expand gflags with extended destination
field.

> +
> +        rc = -ESRCH;
> +        if ( is_iommu_enabled(d) )
> +        {
> +            pcidevs_lock();
> +            rc = pt_irq_create_bind(d, &bind);
> +            pcidevs_unlock();
> +        }
> +        if ( rc < 0 )
> +            printk(XENLOG_G_ERR
> +                   "pt_irq_create_bind failed (%ld) for dom%d\n",
> +                   rc, d->domain_id);
> +        break;
> +    }
> +
> +    case XEN_DMOP_unbind_pt_msi_irq:
> +    {
> +        const struct xen_dm_op_bind_pt_msi_irq *data =
> +            &op.u.bind_pt_msi_irq;
> +        struct xen_domctl_bind_pt_irq bind = {
> +            .machine_irq = data->machine_irq,
> +            .irq_type = PT_IRQ_TYPE_MSI,
> +        };
> +        int irq;
> +
> +        rc = -EINVAL;
> +        if ( data->pad0 || data->pad1 )
> +            break;
> +
> +        irq = domain_pirq_to_irq(d, bind.machine_irq);
> +
> +        rc = -EPERM;
> +        if ( irq <= 0 || !irq_access_permitted(current->domain, irq) )
> +            break;
> +
> +        rc = -ESRCH;
> +        if ( is_iommu_enabled(d) )
> +        {
> +            pcidevs_lock();
> +            rc = pt_irq_destroy_bind(d, &bind);
> +            pcidevs_unlock();
> +        }
> +        if ( rc < 0 )
> +            printk(XENLOG_G_ERR
> +                   "pt_irq_destroy_bind failed (%ld) for dom%d\n",
> +                   rc, d->domain_id);
> +        break;
> +    }
> +
>      default:
>          rc = ioreq_server_dm_op(&op, d, &const_op);
>          break;
> @@ -643,6 +744,7 @@ CHECK_dm_op_remote_shutdown;
>  CHECK_dm_op_relocate_memory;
>  CHECK_dm_op_pin_memory_cacheattr;
>  CHECK_dm_op_nr_vcpus;
> +CHECK_dm_op_bind_pt_msi_irq;
>  
>  int compat_dm_op(
>      domid_t domid, unsigned int nr_bufs, XEN_GUEST_HANDLE_PARAM(void) bufs)
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index 2bf0fdc1ae..fd0f3a6a99 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -444,6 +444,28 @@ struct xen_dm_op_nr_vcpus {
>  };
>  typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>  
> +#define XEN_DMOP_bind_pt_msi_irq   21
> +#define XEN_DMOP_unbind_pt_msi_irq 22
> +
> +struct xen_dm_op_bind_pt_msi_irq {
> +    /* IN - physical IRQ (pirq) */
> +    uint32_t machine_irq;
> +    /* IN - guest vector */
> +    uint8_t  gvec;

If you pass the address and data MSI fields there's no need to also
pass the vector, this can be obtained by Xen from the MSI fields?

> +    uint8_t  pad0;
> +    uint16_t pad1;
> +    /* IN - MSI data (vector, delivery, trigger) */
> +    uint32_t data;
> +    /* IN - flags */
> +    uint32_t flags;
> +#define XEN_DMOP_MSI_FLAG_UNMASKED (1u << 0)
> +    /* IN - MSI address (0xfeexxxxx, includes ext dest) */
> +    uint64_aligned_t addr;
> +    /* IN - MSI-X table base GFN, 0 for MSI */
> +    uint64_aligned_t gtable;
> +};
> +typedef struct xen_dm_op_bind_pt_msi_irq xen_dm_op_bind_pt_msi_irq_t;
> +
>  struct xen_dm_op {
>      uint32_t op;
>      uint32_t pad;
> @@ -468,6 +490,7 @@ struct xen_dm_op {
>          xen_dm_op_relocate_memory_t relocate_memory;
>          xen_dm_op_pin_memory_cacheattr_t pin_memory_cacheattr;
>          xen_dm_op_nr_vcpus_t nr_vcpus;
> +        xen_dm_op_bind_pt_msi_irq_t bind_pt_msi_irq;
>      } u;
>  };
>  
> diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
> index 9d08dcc4bb..9236394786 100644
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -107,6 +107,7 @@
>  ?	dm_op_map_mem_type_to_ioreq_server hvm/dm_op.h
>  ?	dm_op_modified_memory		hvm/dm_op.h
>  ?	dm_op_nr_vcpus			hvm/dm_op.h
> +?	dm_op_bind_pt_msi_irq		hvm/dm_op.h
>  ?	dm_op_pin_memory_cacheattr	hvm/dm_op.h
>  ?	dm_op_relocate_memory		hvm/dm_op.h
>  ?	dm_op_remote_shutdown		hvm/dm_op.h
> -- 
> 2.51.0
> 
> 
> 
> --
> Julian Vetter | Vates Hypervisor & Kernel Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 

