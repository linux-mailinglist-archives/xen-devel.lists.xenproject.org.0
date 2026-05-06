Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI2WEN/v+mlGUgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:38:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B34D7522
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 09:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301210.1575519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWpE-00057v-1C; Wed, 06 May 2026 07:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301210.1575519; Wed, 06 May 2026 07:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKWpD-00055E-Ud; Wed, 06 May 2026 07:37:43 +0000
Received: by outflank-mailman (input) for mailman id 1301210;
 Wed, 06 May 2026 07:37:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKWpC-00054i-Hd
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 07:37:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKWpA-006Cfl-Cp
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 09:37:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69faefc5-5cb7-0a2a0a5109dd-0a2a4507dd94-0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:37:41 +0200
Received: from [40.93.201.29]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69faefc4-229c-0a2a45070019-285dc91dc8f5-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 09:37:41 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5397.namprd03.prod.outlook.com (2603:10b6:5:2c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 07:37:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 07:37:39 +0000
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
 b=npkXec1ooaw6zg78Dg0dA4tKQHjOWNxKGn5JzoC2Rycr1dbkswhGsDwLaM+dPBPgMVtKOLR1LIzNEHhUrLS+lPHvrsx+J16eJsBj5pK0xnj9nOehCzapxqjkyxcNJN9NzJME7muY/WQND02I9gdBSdwdcjFO4x4FiXjVjd6K8M/kNlkdFiwSNidLOO8vPACY7/kGWs2W6YHJpnCX53f7DtUwA/fErAOpLG/064sPbhNHtBvvPFlFeZM5fMYji/jBN+MSoKZ2UQlmxshTYmpDqRdY6BSAXOYbPC1w4mUrPrNEQ6Ah0lU7Y2KwTkCgLRfpJC/LWALRAJp/YNhES6hBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJTGyzoNCBosYYOm3qJmbE2HE4BnkvRapJ+78U4LS4U=;
 b=ex9zNBfrsBG4nFn5W6CKsa5ZAzBkvse4XaPInDSukEPvACBqpdQ6t15gbkineph/thzbCycnSTL5nq559Wq3ANV4O6Altnm+vMgEIOSuqDg3SDddQUTfmwLNQdRJ8X2G7oF7lUGorzREbjaQyPqR7Em5nC4LOAA8AkwsxL76laEOO4vhPRTCJkBqAoWItWGNc5ekt09zT54hPa4JL+EdEJc3Ov4w7dLUkOPyRbfwPSBdTr9YVM8mNUI+zUGZBuofxFuO3S2VnzYIbDEJRgGToPy+o5tyhOxOb1O/CcKKg3GjVrwz4echDuzTZjjuNXtFN64/1GXdwm6tfxyui9ss4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJTGyzoNCBosYYOm3qJmbE2HE4BnkvRapJ+78U4LS4U=;
 b=qDCYSJ2KMfeLZABsroktcnn1bIGEj4zSbvHBqQA/ObnJvalSXZ9G61FfB8woe26SXwrq6WsVXxSkRi15mMsyAReyUekI6GE79pAjfH6nTaBsEFDUDs5gtLNqGY6X+KI4BN+qUfrP94PTCIcrNzrNzTFl4ujgTKvjf5QzKT7SF38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 1/2] iommu/amd-vi: allow disable_iommu() against non-initialized IOMMUs
Date: Wed,  6 May 2026 09:37:18 +0200
Message-ID: <20260506073719.40075-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506073719.40075-1-roger.pau@citrix.com>
References: <20260506073719.40075-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0182.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf90afd-edc0-4e97-eb6b-08deab425967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	gN7aOcWAzKQxwiZNxH6DAa7bkTMs4zRbkT5Hk3EpMP9+y6vQomCwOC72sPT5ZMV3QPt3GlhnZ8K5le071Veo2Mv6XAUoKNTdP6MpFfddyFmkDzaH08duKumvl0Ep6JkWC7ittBYhX1JclMIVKYGl6XggIAUg0WbKeuiGmLgd6uNw9jKlViuLkfHgG312MYkZodAV5RVuhVBzOucx8VTdc3bsT4YqydOncOxrVO7WJksoCRTbWHxZR5l/FngReEEwLm5VVc0dNpT0zVRBa0Fr8Z3TazXtbnb5RvC0nq9NR3TYYDfukzqApLzcx9zK3qMpQtqnhNxuMXfs/aLQj9cKieSFPhX6i2mrXrYw6dTVXLX3gqlQDDJCtkhYwnGo8LsEZSuCau7Xy0QYKTDfZUJZtlWeAvuu4OZnAxC5ha2vhLkefRagmTfoeDxLrQdwX9cUrc+Nn9aouD9m0tTybMDE/avp8Yw/sTaaI8LxHXgwCCJp/WaFFZGqsuLTXkAZH8L2Inl4qU7V16esxonlLakrPizyNsNJa95CIPYWb5/KxfyJ34ZuRMaKh82IrzEK7RiDPl8xiD6wjra5aFgryrGj5TCldC4vWV3NsDvbi23Ms1ol9nixJyAqiWEM7WDFHvBAN1qN7yH3B9A7DGaXiTzwcwUW0waSgkfqQqcLfVXU100mgAWlnoaDDfbaAbfdRXE7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW01Vng0cG9sbmRUd0dQbjc0cHZVZUlvcHRvcU1oajRtemVKK2RxY3M4MHhx?=
 =?utf-8?B?MWVYTVhmbzAzNnJwQ2VGSzFtK3U3dUErSmJhV05qZWRqSkdVTkM5dDFJd0V3?=
 =?utf-8?B?bUhiYzB5Q1gyaUFPZHpYa3lScURiUnZrK0ZxVXl3bmVZSi9xdGhWVmpnUlFp?=
 =?utf-8?B?NzVpRkRRTUZTejRGckV5Z0JDaUdtb1JEaDNadVNHZFd2ZEFpTEpFVGNDYXhR?=
 =?utf-8?B?RGxaeGU3YXZpQmxobjE0VndQVzVEMHZzZ013Tm9MazV4L21LNmhlczVWdXJN?=
 =?utf-8?B?WWFoYWZnZzZKWlNVVnVoci84ZExCc1B3WWVGdWVPSEhuYW11SzBXVXBXeDdh?=
 =?utf-8?B?aWNCWnp0OEhpK0h6TG84MktqaU1wWmVOS3FSQ3ppU1pmVEhBNVFKcW54a3NH?=
 =?utf-8?B?dThid1NHRDFuWEdvNHJ2KzlzL1dtaHVsSC9Pa3Z6S2llczFWY3pMVklPajA2?=
 =?utf-8?B?TTVFZ1hMeWt6OHZtZ3h3MktrUWdKZlorTmwrQ2lpbHZKL0ZsaFh0cHRBanpY?=
 =?utf-8?B?QWdUYWtaRllUSHdvaDI3Vy9kSldsVnFtVjY3Y0R3K1d2NVV1SWViSzNyK2E2?=
 =?utf-8?B?OFFTTFpVTG9JRDVFR2xtN0Z4YmtmMTlMN2drMFlwUDVONkJZd1l4d3RQRzBH?=
 =?utf-8?B?MXI4WWNHdzJGRzYvZ2FkampvdGRaRFhiVG5JZjhxTkVJQ0gvWWViQkcvcTJv?=
 =?utf-8?B?cFdzREt4d3FXN3RQWEN4SUdXMTJPRjByL214MWM5VVREeG1LSHRkeVo2MXh6?=
 =?utf-8?B?MDFLOXowL29Ub2krMnFXL3FSbW1pTFRkUTdEUnpEbCs2b0Npakl4dU10M0xP?=
 =?utf-8?B?ck9Db1dnam5HRjhQeDJQVjJ1SDdkV3ZEZUsyTTdMRG43ME93S2MxYWRLZGpa?=
 =?utf-8?B?dWtMUGE5NFBLNGYvTEJpVjgzamovblA5eDJmbTcwZFpiMWJYZjFwazdSVzRC?=
 =?utf-8?B?WVQyVmtUcTNUV0JDYVVKTUQ0Sk9ZcklYZ3lFdUo5WlZaTmhyM1RZUEJnbzlp?=
 =?utf-8?B?TC9PeHQwN1YxS0pjaGpMNjFYWms0THhYWkJNMDBycVZpS1ZlMnl3QWVncThz?=
 =?utf-8?B?d1BBNmcrRzdHSlgwSUdFeW1Uck1iWGhZbENvbDFNSUo3cUhZVVZWVm1mLzA0?=
 =?utf-8?B?Y3hveTdOaGtld1VHNktWekNQbFJ2RjBWdUZPbW03bnhIRjlONk5ocWUvb2dz?=
 =?utf-8?B?b1llNkw0YzA1N0JZcS9oendQQm9uRmE0NEZjZFMvVmdWdldSS0FnUUxQeXFk?=
 =?utf-8?B?RjVyTTRSMnhPVU1ielhTNVNOaXJWYXJlcHpuWHQySFllUXE2V1JMaXZkMWJC?=
 =?utf-8?B?YXh1L3dTNGpMNFI2TUVwQVdiU285OWRUR05NakF2bVVOWXBXS3llNkFnTjR5?=
 =?utf-8?B?RWptR3NOeldaeWRhajdGeTdLaUlzbmVZYnovYVhyTDdvRU8ycytYb2J1WUhN?=
 =?utf-8?B?Q2NMRXBObXo4OWNMTVo1NzgraWxWY3lHU0pORnVqY3Y5WDU0SjZwdE5KaUpS?=
 =?utf-8?B?NkdrOEVkN3NVWitiSUVzKys3aElCelN1a1l3MDJSZ2Z1eExlQzNHcGVkOU5v?=
 =?utf-8?B?MmpmV1phdWZCdDlub244aXJSTktLZnYzM0NIWTJZNTZDWkFnbGJaZkxZamJS?=
 =?utf-8?B?bnB6d1pvRU8vTnFXT3NtNVpDRnl0Qm5VY0tZYVR5WEEvTVlGT2FXL3FqVGdv?=
 =?utf-8?B?TC9HbnZFOXl0SzJQS1FQM1UyWjA3azhXMVhwQ2JYQ3MySDVGREdwdnBPM2dG?=
 =?utf-8?B?RUxmL2JOT0c5cUU1bG9RK016YjZiZDhudXRKTTBacG5ia1g3NXBvOWVEdUJP?=
 =?utf-8?B?REZsWk5OMGcwaVljRE90S0tQdFV1eG10dVZJc296TFBTRFU5WFhMS2VZdlVJ?=
 =?utf-8?B?aEYrUGdCZEZ6eTUrWWNaMERPUTYwUjN2SVcxb1VmNWkvTkZZbm5wNGdwc3pE?=
 =?utf-8?B?bVFFVjVoL1RDU0JoSUVlMEpBRWdTNFZFOW5mMVFTTTlzNVBWeEcvQmRUaTRG?=
 =?utf-8?B?Vlppekx4d2xpTlFRZ0RWTXFqcXNPVTRvQUVHbGRqeFBUdUhDSUxKV1RZSEhm?=
 =?utf-8?B?bmora3lGaStaYnhRcnRKVXpxUEJwWm5rMGJuTUk5eHdVZk4wQlN0TTJmZjgw?=
 =?utf-8?B?U3RQL3A0Y3A0MXZLcFpEc2xoeW1zdkZPSE44OFhUYVZHZUZQenY4TEl3NktO?=
 =?utf-8?B?eFMzTnJWN2NWS1BxWW05RjduSzRGRUtWMDRCcWlScnZZMDgzaUF2UFluZEdH?=
 =?utf-8?B?MG1GeDYvWGpoMWxCL2VSZlVYSm9CL01vamJ0YTRLaUpSdDlrTkJBRE1qOEQ2?=
 =?utf-8?B?anJPSktYSVk3ZVNTb0YwN3AxNkFTNGxhRDI3cmhTdWE3MmptYVVGZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf90afd-edc0-4e97-eb6b-08deab425967
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 07:37:39.1016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrb+cqEDO+WYKb3Qrd0A7PFTvabu/2i8dSxIvFNO+V6233V24KjWLs5wW23m/O57dyFvv6MfVn/px/nAuNWlaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5397
X-purgate-ID: tlsNG-ef75cf/1778053061-2B979C48-944672F3/0/0
X-purgate-type: clean
X-purgate-size: 2134
X-Rspamd-Queue-Id: A13B34D7522
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Introduce a force option to disable_iommu() that allows it to disable the
IOMMU, even when ->enabled is not set.  While there remove the unlikely(),
this is not a hot path anyway.

No functional change, as there are no current callers that pass force ==
true.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu_init.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index d77dd8511288..76ae78e5ea53 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -929,13 +929,13 @@ static void enable_iommu(struct amd_iommu *iommu)
         amd_iommu_flush_all_caches(iommu);
 }
 
-static void disable_iommu(struct amd_iommu *iommu)
+static void disable_iommu(struct amd_iommu *iommu, bool force)
 {
     unsigned long flags;
 
     spin_lock_irqsave(&iommu->lock, flags);
 
-    if ( unlikely(!iommu->enabled) )
+    if ( !iommu->enabled && !force )
         goto out;
 
     if ( !iommu->ctrl.int_cap_xt_en )
@@ -1139,7 +1139,7 @@ static void __init amd_iommu_init_cleanup(void)
         iommu->ctrl.int_cap_xt_en = 0;
 
         if ( iommu->enabled )
-            disable_iommu(iommu);
+            disable_iommu(iommu, false);
         else if ( iommu->mmio_base )
             writeq(iommu->ctrl.raw,
                    iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
@@ -1584,7 +1584,7 @@ void cf_check amd_iommu_crash_shutdown(void)
     struct amd_iommu *iommu;
 
     for_each_amd_iommu ( iommu )
-        disable_iommu(iommu);
+        disable_iommu(iommu, false);
 }
 
 void cf_check amd_iommu_resume(void)
@@ -1598,7 +1598,7 @@ void cf_check amd_iommu_resume(void)
         * To make sure that iommus have not been touched 
         * before re-enablement
         */
-        disable_iommu(iommu);
+        disable_iommu(iommu, false);
         enable_iommu(iommu);
         if ( !iommu->features.flds.ia_sup )
             invalidate_all = false;
-- 
2.53.0


