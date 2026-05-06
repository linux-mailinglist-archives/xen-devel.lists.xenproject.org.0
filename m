Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAKqNJxI+2lZYwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 15:56:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6E4DB6C7
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 15:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301761.1575950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcjV-0004SS-OB; Wed, 06 May 2026 13:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301761.1575950; Wed, 06 May 2026 13:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcjV-0004QF-LO; Wed, 06 May 2026 13:56:13 +0000
Received: by outflank-mailman (input) for mailman id 1301761;
 Wed, 06 May 2026 13:56:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKcjT-0004Q9-Fo
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 13:56:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKcjS-000W84-P2
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 15:56:10 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb487a-5cb7-0a2a0a5109dd-0a2a4504a980-0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 15:56:10 +0200
Received: from [40.93.198.20]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb4878-1dec-0a2a45040019-285dc61492ea-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 15:56:10 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5064.namprd03.prod.outlook.com (2603:10b6:a03:1e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 13:56:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 13:56:06 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br3hyTTVp8qNNg5L4WCzOHRXVO/ewHoyAM7MSiyIMe/KpmZPe+p6X5TXYrNrj9RuzDCc0wge1jNPlEKka8laigWQjMoCVz3no9tPhrQAycTnBIabw58eR7oyhIWSc8By5ieJflh3s7FehcotSvEriE0oBYU1noguGuxafv6C4xhTkxxZl1ir+KRGUQrDoPMWAom0jjNVklpVpQYwqfdldcOXYeRESkuDfnQSzi6sNSza4D8z3aMFmHQULGx5sBRhAEfTAlvzea8A+7yduDUIZFofSNBBd102IbrOfSTJljL6QGGS9xOq520UUwwlGp+Y3BNDAeX9m0minkVMmQKLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaNqmi2181d7sItoZx8M4v072bIVyy49YGtb+AoIeBI=;
 b=Q3RH8k+VOUk3RRYplLtY6lN1xh0eKjBiV8grUrN/vGGPkiD6VjyZkOBnuS3ezm6OZIgGNLWl6DOJ/M1wkWkXq9e2lGP34+j+NfOmkI3imXzpTETCTlnkwXu9Tn8Fp1EunELHV+1XSVgBWTO9wB3rD7HRIgNoOjssrYWrVheHaXAfJR0NmXuXCMdw5F7mrHWKOYUcjJlHg3gYRB0TF7wLmb0SXDC4PxaEBuS/HUYdb/BQ/O7bcb4VYER7Pjzzi3u+9HTrYz3YNq7+eHkTMlVz+FvKwdZ4Fcsdgit8zjLd9NOhBqi2hKTLpa640QvSxilHZF3+c4qnh1IDDHFyzivBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaNqmi2181d7sItoZx8M4v072bIVyy49YGtb+AoIeBI=;
 b=oBtSBWXPYjkWNN8dR1AZXw9OQjQcwrP6weG0riAKWVBzNjNSYvHPz3tkfJb4PLN+lCVcPXt1pWogQKfX5inJqRJMiNlbLKcQZ/BBMQcbhAQtY6p/cQCej0Vh9UYcF3sJmASe7c9v8mE9P91VYk0e6BjS6ks2uNvHzEV7qz67oWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 0/2] iommu/amd-vi: remove zeroing of MMIO region
Date: Wed,  6 May 2026 15:55:12 +0200
Message-ID: <20260506135514.47310-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a54b7c-be1e-4ff5-8781-08deab773825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	l1Rb7onEzjtHT2uObgiM7/OI8aGg5ZGcJUQr1UOa72S4xpegeBNZEs0SncbwaHY7ao+p1BzqQ5Fxw2RZk/TTrQZgv6Ng8KNRoTpe1Ynphq5hZx2tCMOUNF93VcCWKZK09yJtEK3Bi2E3BhYIQAArWWH2KOl2ChmuZJDim9gQBL7GKwvJM1LiCRxQcIwYdTVdTF3SY+Rbj1HyhOYqBHxYMi3avva10oY+9CnHDSeu4AK+IDzRtYlzfPeC3Ul0xbwY7GZ3jJIBisyqh62m58+clXBiINpICF/iWTUxNETbRjDRcXwqzd8tyn540D5acCPbx2m8OYfrxHN5MilOUBlgJX2pIWoRbCzFaXDk1YPVSpWRTcjuFuTVjFJzS+NeTJ4ivMefvammkrqtvmfeODW8tIaCZqLW7PfAGcmLJmiC/KIfliYbVzNnqpBjj1p+VR6/XUZR+5NoccC9UHrFmPYq6HJp9KsbU5gWeXcpRscTrVfF8hLUT8DiBWQ4hKWb3VIf9mRZMbdEyEGpIuHu0Iqyr8VysrEOAVqSjEe/Pa9cwN5pZ2dLBtzk0RiReAL+NLMflW/IRnnVKZhJt5IaKlHUQX30n2Yt4ET67pDNMTyuEOnA58FVFph6n0dmxRNHhfVhKrxS59csCK+OLDtMNQGQgYos+7aNPalB258JFcQBTSq18uYMqwSxotekgz2xmFZm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU5DL0NLTGdBMSsxVS9ndTFDN2JzVFVSbjg3cTM4c3YxNERWajhJKzlqNlB4?=
 =?utf-8?B?ZDBwN3l6djI3eWo4d2tMSjdnV1lSanRNNTNzY2xRZlBvZ3F3TVRkM0V2MXhT?=
 =?utf-8?B?aGxCZjBDaldaSlBMYnBqYlpDbTVDNkJSamVycHN1QkxuZlR6OUVuVVJKdFRN?=
 =?utf-8?B?MThoa2ZiZThUTUFwK1ZmeDVKRi96b1VXV2ZKamlqdUI2K0M0bVBvb1ZYM1Mv?=
 =?utf-8?B?Wk5IeEdvRUdvZXBMT1BIRDZ2UHhlbTJuR0RIeE8zS2pJanVsU1k0eGlKcVho?=
 =?utf-8?B?dmlkMVZUTVdjdncwaytRSTYxUEtFUWp6TVNoSFFyOGNUem1vd0REMzR0aEhP?=
 =?utf-8?B?Z09OSXlzUVlBSlJJeTdNOHdNNDgra0ZFTjUxcmlvNHpsR3ZLdUlEb01aZW5a?=
 =?utf-8?B?S2ZhaDFhSXZZZFd4ZnlkUUJoTWN6N0NxQ3hIRTlhNFpwa1JsNzJzRXNqMmp4?=
 =?utf-8?B?Y3lBdzIwTUxuQzF4cEZtc3BZNUZPZFM0ZGVBTWlJa3plclBYN2VXZFU2MFlU?=
 =?utf-8?B?Uks2RlFxdy9WWFJhNjJtUU5QdzlLSjdZcHJVRlZCb25KTkw4ZlpKVFFwN0Vk?=
 =?utf-8?B?a3F3S2xEVzUwc2s3Z2pVSjZ1Y0lsZkE4c2d6MXgwYVU2WjU5RUFNS2lXeGdF?=
 =?utf-8?B?YlNnSFMyNk1HdFFIdWJPUXFtWmpBRDk2ZitDN2JHVUZObVArVm1ueFBmaHlW?=
 =?utf-8?B?Wi9EMEV6ajJxQWE3OFVjNHhYUHNKNEF4UUdzWUU5bndScGVDWkpCVWxVWG54?=
 =?utf-8?B?VDRnZTRaZWRBOWFvYlZLakU1OXRlbVFJOE83T2s4cWRvYStJNUJuSC9KbURo?=
 =?utf-8?B?amtKcGdiVE1DWFdNdWRWUGQ5Z0F5bXB5NnRxdCtPc0VwNWh2bGxIVUlJYkZz?=
 =?utf-8?B?V3N1dFNIdWwwQThlZXd6UFdTUlMrNkdRSlZlVGxvWjhmQjBZNEx2Z2tlZUJM?=
 =?utf-8?B?VmpHNnhmWEUrK2FObXkvQlUxKzFRc2NzTXlCSU1HdUtNN09KRXpRejM3c3Zh?=
 =?utf-8?B?bnZpWjUyK2RkSzE4d2hJWldUTFBCdiszTkJScVBoQ0NGQzFVUmNyR252VHVn?=
 =?utf-8?B?VWcyUmpjdjZCM2M5VG5FZ1NMQ3p6Z1U3cXZKQk5hSnRSS2t5MXZFZ2k1RlM2?=
 =?utf-8?B?S3JjTlUwbnk1aVMrS1ZlWjR2R01ISWNiQVVaQVluYlh3Vm1ib0lJbU03SnFL?=
 =?utf-8?B?b05ac3Roajd1Ymp3L0x0ZFBrenM0L3dPMnlYbkdmS1JxQXJLczNUck1nOXpO?=
 =?utf-8?B?WWdlMWkrcVJmSnU0Z2RxbVdlcFIvQzBQY1JESzlyQ0hWS0ZDaWRqdWEzSm1T?=
 =?utf-8?B?bXh1eG9GOEJvYmFDK3dVb3cyYlNmRkN6bU04V25zSlEwZzJUUWpIK1hXczBm?=
 =?utf-8?B?Q25XMDJmemY3UCtBMldvc2pNVy9kRUNkZS9la2FCbnd2Z0dPU0RmU2tjUEla?=
 =?utf-8?B?b1QvZUlhZERDcmc4LytDV3U3Z2pRUkJZMVV6YjVzbGxqaEpHNm1hTG93WDA5?=
 =?utf-8?B?a1o4Q29jbUlXV3Vod0UrUVpIVW55STNHUC91NktBMERKSUdMWUtQQktZZmVj?=
 =?utf-8?B?eTExM3NZTkIrQjBncHlFU3ZrMDZjYldQcHo0TUppdHAwLzF0bW9uWDRIVlJw?=
 =?utf-8?B?Qmp1dFB0Nm9QRWxGSUFyWWg0alV5cDYzbGc2NmpKMndsNjZHZDFwQ1R3SGhM?=
 =?utf-8?B?UFNJaUQreEc2NE1uR2NNTkNmNXE0UThFaWM4N1pzQU9zbk5wb1BGR214a3Bt?=
 =?utf-8?B?alZWZ0hOVkNsTFdUbjQ1emFhTFVOSlZVMG9KNUk3SUR3SW5MVHdtQXNobFli?=
 =?utf-8?B?TEpTcXh2TUxDTUZwekxIa28yb0Zpc2JYT0x1ZlkwLzRGNXMvRFBhcDM0aHUv?=
 =?utf-8?B?MXdxdUl3WnlRbjQ5ZjUwMk13VDRwMWcwSG1USVFuOEVCQVNyazBHN0tOeVFy?=
 =?utf-8?B?L0hFSzZXZ2hBaXJDWDdCOUJTeGM4VGNNamNxVVpBSkxuM2VsaTZZREM5OEFL?=
 =?utf-8?B?Q255Vk9ETTlyMUhkVDIvYmZZMUxKS3E0dUlGK0Uvbk5oK2pRYVFWSnhaWDU0?=
 =?utf-8?B?SGlncFBJOVBGZTRieHQwWTMyNFhpM0FzN2k1bFMrNElNbGZ6cnRZR3JOS0Ny?=
 =?utf-8?B?dmNvMjlGVFBmeHRFdFV5QUQvQmJVNTN6aDlwN05WcW1vOE9ETDZKdi8wZGlR?=
 =?utf-8?B?dy9XVHBGaTdFbjRpa1RhOHY2SjhyM2ZlSXEzTGJLY0JJaDY1MzVyMkp0VEov?=
 =?utf-8?B?czUrQkFjdXR1S3ZUaStRRS96VFBuWWNCUWpJQTFENGU2YjhZWm8vaUNIMjkr?=
 =?utf-8?B?VDN0Zncrb1EwRFNEOVR6VW14cmt3a0d3M0J0a1Z6VGJsOXc2WlBOdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a54b7c-be1e-4ff5-8781-08deab773825
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 13:56:06.8203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vETvrO11pOEtn7uOdhC+pxvmHfHGqzkiiD8qcOh+IBZCXOSRMBNoj5LywZ9Z49UD8yoaMfi1JcHsibTO3wfzYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5064
X-purgate-ID: tlsNG-ebf023/1778075770-40F753FF-5B6C38AC/0/0
X-purgate-type: clean
X-purgate-size: 601
X-Rspamd-Queue-Id: 8CE6E4DB6C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

Hello,

Unconditionally zeroing the whole IOMMU MMIO region is dangerous, at
least on an upcoming platform this does put the IOMMU in a broken state
that's not recoverable by the init procedure in Xen.

Get rid of the zeroing, and instead attempt to disable the IOMMU ahead
of enabling it.

Thanks, Roger.

Roger Pau Monne (2):
  iommu/amd-vi: allow disable_iommu() against non-initialized IOMMUs
  iommu/amd-vi: do not zero IOMMU MMIO region

 xen/drivers/passthrough/amd/iommu_init.c | 41 +++++++++++++-----------
 1 file changed, 22 insertions(+), 19 deletions(-)

-- 
2.53.0


