Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PsSBFgS5WmBeAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 19 Apr 2026 19:35:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D1424E6B
	for <lists+xen-devel@lfdr.de>; Sun, 19 Apr 2026 19:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285344.1566421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEW31-0000Qg-PQ; Sun, 19 Apr 2026 17:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285344.1566421; Sun, 19 Apr 2026 17:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEW31-0000Nj-Kk; Sun, 19 Apr 2026 17:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1285344;
 Sun, 19 Apr 2026 17:35:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wEW30-0000Nd-OB
 for xen-devel@lists.xenproject.org; Sun, 19 Apr 2026 17:35:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEW30-005Y9A-1J
 for xen-devel@lists.xenproject.org; Sun, 19 Apr 2026 19:35:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69e51245-bab6-0a2a0a5309dd-0a2a450ababc-2
 for <xen-devel@lists.xenproject.org>; Sun, 19 Apr 2026 19:35:05 +0200
Received: from [52.101.83.117]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69e51249-56b3-0a2a450a0019-346553753a97-3
 for <xen-devel@lists.xenproject.org>; Sun, 19 Apr 2026 19:35:05 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sun, 19 Apr
 2026 17:35:01 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%6]) with mapi id 15.20.9818.032; Sun, 19 Apr 2026
 17:35:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0Iz++GLre/IE6ITK3MZeY/sfXuNHIE/cBCix/ZVhpvaNPXzSfyloX/BYHtYPr6+DkCus85xUzSf/9R+5Xj2N3/Sw+b6UTU36/u+yYNGEIzrWIdBRKZ52n2LYnMFBKzM2sEAUrMc17UtVSnU5bT9YXjGbdJ5YbCeI08nvmdGVZBU6KdrpOUdyTli2ygVw9s/3gcgnGuJ/mbzOuM1gc7o6ktPcNty8PaNQrYl8rkRqzmdJ8HGRtKVItnHmPqT4KPhgdabfPrE/qstdr/qlzwwxi1rXDRiZnfaKo8wqoOY5B8JZ+zQ0IeLQD5WY+PtJSZG+X4FlAKbDjJMRKvHQc/HDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1iNbuWJhTBeTFknRK2AabvGtZuQPfXsn/35Pau2dkM=;
 b=URIIFAx+eqE8T4ZV29K8lC8kK+3+2p4NECxE/EFATJKAcCq/rPP09YeW6KzMJG/j5B53IR20sjjVLH+wfXYBvku5QK/n7+yE/q9QrG3SJ75Xb3cYM4eyw69TATTfggQs/eY6S6bMOjx9pIYk1bWaEph7dmA7A6cQfXEM3eT53DtyHn+qSz8BpvlSVjwYyjqSISDC8d/40yYB4DWwEnzxSc7clL7cT1EWbmpyJap1cW66sQprPflpZjv24eg8+Hqd4O3HcguKETrj2sBqkg7Rzz9s3QRduZbaiuwyTuZnhKV9BIP6UK71x9e7wTjzHkQBam4eXdRLDqNVFVr/jC4Dog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1iNbuWJhTBeTFknRK2AabvGtZuQPfXsn/35Pau2dkM=;
 b=mPynpdsXNtFH6HiLeLluF5uKtYEtCclG6xq2clI+Y7kRBxHlCz1sHlwGDBz5TeuBqybKH98TScRszRF2biG8MNxClEE++I4YOzK6cs7LBJbFDt+veSw4cS1ITxW2TaTEEmDMGR5sp9fLM7qUDWlkdv82DWd3+hQYNyixl7rl/6JKPt7BloyHNf9ZEj9NrgfQlxJQXHymahjCSo0RUN3QHkoQgQP9zBDZwxy+2qJB1TcmgN1GWak7CHnq+k7a9YU5v/BKZyaqRk7uzyJ/XR9asnwkTQS4ugGj2UOE0wxwqUKdkgnEWtsEtgj/1aCMJWSE3GVa2pTwS5k2DHSmwfbZiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
Date: Sun, 19 Apr 2026 19:34:59 +0200
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
Content-Language: en-US
In-Reply-To: <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0050.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::15) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|DB4PR03MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 13be872a-5731-4bcd-aaec-08de9e39fbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+0YQ/nu2QiQINgwr+ByE6TcJjg2S/YgIUJFqGRB4HsMLF8lQ1+bZ/OR5gN6Zf4rWAXI21vq/twc97DTw+adGfmVzG4MWFP+UnSgfLa8sLXlQIVgRfRMSniijhln59jL8tTg5i6Jl2beUOxbP60RMfROIV1fxgpKvjf/GBqKq6S565bYZv0i3yxziUggErHpNaq2rOB+HuFUmSTzbV073aSeI2hDw92hORSk2LFfAFYFJaSF4Gj7xMCuuTxVPSKtycf79nDIIK5QAonYOvtJYLWm7RYGLPvHlcqDVL1mTLA5jddzHRrEsRuZHlUEZuZ54d12mViXmah/SDPs9w2gDtqKfhJsRoJrIKS7J0FhR4vF3YKBQIPVD9e5jB6h9k7el0SjWwqz9d6oYWLDFcqTuys6vjnEnXG5qntEs0Flm1H1KXNwz79iNmcElWpQr05xi/yuK8kppNq0SpqtNuOpx4GfkJDwZL35fyEH0fn+WS9n4QQzGx+cEN8Zx36R6OB4O48YBJt9X1t4N/ES5Gj74stfrxDn0DIhwIUlD7NDXI7HhLW3lW/f3sQQBALwhRfIb9zKoBTOU/a8yO0ozTKqoA84vAWnS6eb3QC/qxCy9ztL456AkyYAZeQI7zgoqcoelyUSEmWXsHkPtUtLZSWVtVr63SrqOC233t2dIq3zP1O0zzjhucIFuPWkCgnUaMlX+2ELcY6TOekf3hd718oQ/J2v2pWYz69l1Rc1mXShtN8s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHZZVGowVXpVYkt0bWpjTmVvVFlhaEFmWjZMRFpaaWEweVFveUdPTHhieDJR?=
 =?utf-8?B?SUE2bi9UblRra1VBcHNSNkx4MnJzOTNhWnlPclVvZXRVNEpycS9OdTBtZWlj?=
 =?utf-8?B?cHVtOXArcWprQVdqOEw0QnpxbThtMENaL2R3dSthZzhKdFNrU1NteGJER0xV?=
 =?utf-8?B?UVVxZER2amtoOWNSWEt0ZkFkbTJQbEsxS0RackhrdCtPQzE3d0R3SUpVNE1w?=
 =?utf-8?B?bXU4cnhPNHlnaVR0MUdGVHRjRWh1eEZYQk5UR3EwQnZUaHAzYy8ybWkxUXQ3?=
 =?utf-8?B?eWdxb2lGMFdPbFY3TkJjUGo3ZmlXM0N6YWJkOW1JbG8vRDNQcUhxbkZIQldi?=
 =?utf-8?B?aVRwWUY3d2U5Zms5OW4wOTVLbzUrK2w4d2J4MUFlVFJWQTBUUTZ3VHIzWEM3?=
 =?utf-8?B?WTRCZHVKdFZxaWVoUVRaT1RtQ2JTZGdmdUJoN3Y3cjBqajZEYzhRM2hYS2lm?=
 =?utf-8?B?VEI1MjQ5Y0ZqVzNnQXVSM2x0K1RJZG5vdXJtUHNHalpFK0xEK0daSm1rdXRP?=
 =?utf-8?B?T3QzNGUreFVLeWJ2RDY3cDVvbno2S3BqR2VYRE5MR0RkYWpsV2dmU2ovalF2?=
 =?utf-8?B?aDMrcEhVejNNOEVHZFdWQ2k2Y21NQlllSkVDQVlOQ3laSE4rRURnWEpUUVhj?=
 =?utf-8?B?c283UnNTY29zNHpXWnJwT3ZtRmlNYndNRk8zeWFtdXViUU9kbjVGclhqY1Jp?=
 =?utf-8?B?U2pKcXVybk4vOTltOENZZmpKOC93RjVpbCtzU0ttZG1rRVV4Mlg3NEM2RDZm?=
 =?utf-8?B?SFY4d3VxUE15VW54MlNTRXhQbWdOVWpqaXFKdDJVZC9rKzNsdUFJeUY5dXQy?=
 =?utf-8?B?eFlSSkdoc0NwRHlTTWd3bC95cGdpWTRJMEQrd0VKWTJPRHlLaU5zVitEQlFt?=
 =?utf-8?B?UFFHbTMrb3JSVCtNQi9PTGZ0bkdEbzhXZ0FuOGtTbFN3WFBPQXY5VnErN2FI?=
 =?utf-8?B?aTRiQkpOSGtESDRRYzQwZHNyMTNsSTRkSTdwNUk5Yk04Z09nc1o3ZDgxNHFm?=
 =?utf-8?B?ZVJYazdFMEU1dzRpVEdOUkVFWkFvQy91NFdJVGl4TTVBaEtpZE8xZEx6SmxY?=
 =?utf-8?B?dDlONjBUclpPL2hiZXUxenRkVVdsZHNEZ3RwdDMwQ2ZWZU4za1ljbXJVK1lD?=
 =?utf-8?B?bUVpaXN3dmJlMjF0TnVrRVFiTXhObEE1QStUUGxxV245Y3VRSXJTUHZ5ZEts?=
 =?utf-8?B?TjZxcm9BdFRXSWZEckVkVk0ySjA4VHRGNHdGbjVNTDRLUm96YzBaNExndlA4?=
 =?utf-8?B?Y05ueXZ6QnpDby94RE90eXlXQmN1cURnaGViUlA1TFFMTWhQZE1CbExxV2tQ?=
 =?utf-8?B?YW5YYW1XbWpWSGt5RWx5Uyt4Y0JwZEVIQTV6c2doMjlOa3lyTXdubFNrT01h?=
 =?utf-8?B?UEFGWXNVSXhDYXJERmxqRjdDcHhQMmhPSDhxeGo3M3J1TGt6TnFYZFhRR2Vm?=
 =?utf-8?B?aytaMUdscEdqSFh5R1ROOFJVQXpQOEtkZ25qeTJDWHkxT0FnVEZXelY4TmN1?=
 =?utf-8?B?SzNBS05UQ1JXR1cwbUVLSURFdXdZdnp6TURTZlJSa1JCVzlFc1dvTzg3aGFV?=
 =?utf-8?B?K2NPalJWd2ludHZEa0VwSFQxR0ZXMStJcjVsb2JNSlJONnRpY1dqTnRKdjNt?=
 =?utf-8?B?dFdkeG1LL0diemhMMHE3WFFKZGtGQmhsazQyYXNVcWU0cU81Z05LL25wS09z?=
 =?utf-8?B?OWk5T1F2R2trY29lYU1oeDVla1YyWHZuRTMzZmpSUnc3M08wNmQzazF5dFBY?=
 =?utf-8?B?QWpDREZOR3dtSzhOUE8veWpPcjhFUGVhTTllQXJPK1JxT3lpY1pkYUd0WFJv?=
 =?utf-8?B?bU1Ca3NZZlN3bnNmNnJtRkdDWHJIZk5lOXJWc0NKZ2doVHR6cXFjTGZxeEx6?=
 =?utf-8?B?TkZqUXByaG9ZeHRvWmZIUlI1QVpxZm9TeENJVG83d2llNDI2WlJjMGhmanhr?=
 =?utf-8?B?ZldpNDRQRVRoODZIdVVMZzdLK2gzRHRhM2NGY2M2d2tVWmpOb0o1dDE1YUhh?=
 =?utf-8?B?SzROSXRGY0laSEorZy82V0hoby9WTk5Tc3prbGdzMzE5S2wrN1hEekdZbzFr?=
 =?utf-8?B?ZjNUajdQbVZ0ZzV4NVRZaHZQUG53YVlpUWtkc1BPdkIwWnBBY25YNmxtbEdN?=
 =?utf-8?B?eE16dmwyTnI3QnBnZmtCNlF4a2lFUThZQUJqVEplTGRoMWlwcWx3OWYxOFJU?=
 =?utf-8?B?TzNaQzJLQStXTkVjcjNHK0xMTDNhR1RBOVhHYWw3REdpdCtaT3d2YXRXZUVm?=
 =?utf-8?B?a2V6MXFzZjBMQW9wWlYvK0Y1K3BvMU1ScEh1dmtObVV5cU5hNXB0cHo3NlZu?=
 =?utf-8?B?ZERMUTVPbGtwdE91STFLVTQ2QUVlL05pVUNXRjQ2RkhlM1BpcElDZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13be872a-5731-4bcd-aaec-08de9e39fbeb
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 17:35:01.1357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfn/QIlrC7kvSFoB3+oBwAJaVohwv7lK9a2w9DFsqEPwxkh4f2trbyTqCZ+QohVNuiQCqGp5t1qIDHP56JbeWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-purgate-ID: tlsNG-4011c0/1776620105-CF57C8B7-5DFB33A9/0/0
X-purgate-type: clean
X-purgate-size: 9242
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 597D1424E6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Julien,

On 4/14/26 04:17, Julien Grall wrote:
> Hi Milan,
> 
> On 24/03/2026 07:51, Milan Djokic wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Xen SMMUv3 driver only supports stage-2 translation. Add support for
>> Stage-1 translation that is required to support nested stage
>> translation.
>>
>> In true nested mode, both s1_cfg and s2_cfg will coexist.
>> Let's remove the union. When nested stage translation is setup, both
>> s1_cfg and s2_cfg are valid.
>>
>> We introduce a new smmu_domain abort field that will be set
>> upon guest stage-1 configuration passing. If no guest stage-1
>> config has been attached, it is ignored when writing the STE.
>>
>> arm_smmu_write_strtab_ent() is modified to write both stage
>> fields in the STE and deal with the abort field.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/drivers/passthrough/arm/smmu-v3.c | 93 +++++++++++++++++++++++----
>>    xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
>>    2 files changed, 91 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index 73cc4ef08f..f9c6837919 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -683,8 +683,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>    	 * 3. Update Config, sync
>>    	 */
>>    	u64 val = le64_to_cpu(dst[0]);
>> -	bool ste_live = false;
>> +	bool s1_live = false, s2_live = false, ste_live = false;
>> +	bool abort, translate = false;
>>    	struct arm_smmu_device *smmu = NULL;
>> +	struct arm_smmu_s1_cfg *s1_cfg = NULL;
>>    	struct arm_smmu_s2_cfg *s2_cfg = NULL;
>>    	struct arm_smmu_domain *smmu_domain = NULL;
>>    	struct arm_smmu_cmdq_ent prefetch_cmd = {
>> @@ -699,30 +701,54 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>    		smmu = master->smmu;
>>    	}
>>    
>> -	if (smmu_domain)
>> -		s2_cfg = &smmu_domain->s2_cfg;
>> +	if (smmu_domain) {
>> +		switch (smmu_domain->stage) {
>> +		case ARM_SMMU_DOMAIN_NESTED:
>> +			s1_cfg = &smmu_domain->s1_cfg;
>> +			fallthrough;
>> +		case ARM_SMMU_DOMAIN_S2:
>> +			s2_cfg = &smmu_domain->s2_cfg;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +		translate = !!s1_cfg || !!s2_cfg;
> 
> NIT: translate is a bool. So do you actually need the !!?
> 

No, !! is not necessary here, will fix this.

>> +	}
>>    
>>    	if (val & STRTAB_STE_0_V) {
>>    		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
>>    		case STRTAB_STE_0_CFG_BYPASS:
>>    			break;
>> +		case STRTAB_STE_0_CFG_S1_TRANS:
>> +			s1_live = true;
>> +			break;
>>    		case STRTAB_STE_0_CFG_S2_TRANS:
>> -			ste_live = true;
>> +			s2_live = true;
>> +			break;
>> +		case STRTAB_STE_0_CFG_NESTED:
>> +			s1_live = true;
>> +			s2_live = true;
>>    			break;
>>    		case STRTAB_STE_0_CFG_ABORT:
>> -			BUG_ON(!disable_bypass);
> 
> I am not sure I understand why this was removed. Can you clarify?
> 

Yes. With the stage-1 support, abort is controlled per guest smmu 
configuration, so abort state is valid and not controlled by the global
disable_bypass, but with per-config smmu_domain->abort field instead.


>>    			break;
>>    		default:
>>    			BUG(); /* STE corruption */
>>    		}
>>    	}
>>    
>> +	ste_live = s1_live || s2_live;
>> +
>>    	/* Nuke the existing STE_0 value, as we're going to rewrite it */
>>    	val = STRTAB_STE_0_V;
>>    
>>    	/* Bypass/fault */
>> -	if (!smmu_domain || !(s2_cfg)) {
>> -		if (!smmu_domain && disable_bypass)
>> +	if (!smmu_domain)
>> +		abort = disable_bypass;
>> +	else
>> +		abort = smmu_domain->abort;
>> +
>> +	if (abort || !translate) {
>> +		if (abort)
>>    			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
>>    		else
>>    			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
>> @@ -740,7 +766,33 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>    		return;
>>    	}
>>    
>> +	if (ste_live) {
>> +		/* First invalidate the live STE */
>> +		dst[0] = cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
>> +		arm_smmu_sync_ste_for_sid(smmu, sid);
>> +	}
>> +
>> +	if (s1_cfg) {
>> +		BUG_ON(s1_live);
>> +		dst[1] = cpu_to_le64(
>> +			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
>> +			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
>> +			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
>> +			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
>> +			 FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
>> +
>> +		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
>> +		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
>> +			dst[1] |= cpu_to_le64(STRTAB_STE_1_S1STALLD);
>> +
>> +		val |= (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
>> +			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
>> +			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
>> +			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
>> +	}
>> +
>>    	if (s2_cfg) {
>> +		u64 vttbr = s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
>>    		u64 strtab =
>>    			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
>>    			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
>> @@ -750,12 +802,19 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>>    			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
>>    			 STRTAB_STE_2_S2R;
>>    
>> -		BUG_ON(ste_live);
>> +		if (s2_live) {
>> +			u64 s2ttb = le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
>> +			BUG_ON(s2ttb != vttbr);
>> +		}
>> +
>>    		dst[2] = cpu_to_le64(strtab);
>>    
>> -		dst[3] = cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
>> +		dst[3] = cpu_to_le64(vttbr);
>>    
>>    		val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
>> +	} else {
>> +		dst[2] = 0;
>> +		dst[3] = 0;
>>    	}
>>    
>>    	if (master->ats_enabled)
>> @@ -1254,6 +1313,15 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>>    {
>>    	int ret;
>>    	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
>> +
>> +	if (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED &&
>> +		(!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
>> +		 !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))) {
>> +			dev_info(smmu_domain->smmu->dev,
>> +					"does not implement two stages\n");
>> +			return -EINVAL;
>> +	}
>>    
>>    	/* Restrict the stage to what we can actually support */
>>    	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
>> @@ -2353,11 +2421,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>>    		break;
>>    	}
>>    
>> +	if (reg & IDR0_S1P)
>> +		smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
>> +
>>    	if (reg & IDR0_S2P)
>>    		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
>>    
>> -	if (!(reg & IDR0_S2P)) {
>> -		dev_err(smmu->dev, "no stage-2 translation support!\n");
>> +	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
> 
> I believe the behavior is now slightly different. This would not print
> anything if the SMMU support stage-1 but not stage-2. However, Xen at
> least need the latter.
> 

The original idea was to also allow stage-1-only support. But I'm not 
sure if stage-1-only usecase is useful or even valid for Xen.. I will 
update the patch series with the missing parts for stage-1-only support, 
pointed out by Luca, but the question remains if this is needed at all. 
If not, I can revert to original state where stage-2 was always required.

>> +		dev_err(smmu->dev, "no translation support!\n");
>>    		return -ENXIO;
>>    	}
>>    
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
>> index ab1f29f6c7..3fb13b7e21 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.h
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
>> @@ -197,6 +197,7 @@
>>    #define STRTAB_STE_0_CFG_BYPASS		4
>>    #define STRTAB_STE_0_CFG_S1_TRANS	5
>>    #define STRTAB_STE_0_CFG_S2_TRANS	6
>> +#define STRTAB_STE_0_CFG_NESTED		7
>>    
>>    #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
>>    #define STRTAB_STE_0_S1FMT_LINEAR	0
>> @@ -549,6 +550,12 @@ struct arm_smmu_strtab_l1_desc {
>>    	dma_addr_t			l2ptr_dma;
>>    };
>>    
>> +struct arm_smmu_s1_cfg {
>> +	u64				s1ctxptr;
>> +	u8				s1fmt;
>> +	u8				s1cdmax;
>> +};
>> +
>>    struct arm_smmu_s2_cfg {
>>    	u16				vmid;
>>    	u64				vttbr;
>> @@ -669,7 +676,9 @@ struct arm_smmu_domain {
>>    	atomic_t			nr_ats_masters;
>>    
>>    	enum arm_smmu_domain_stage	stage;
>> +	struct arm_smmu_s1_cfg	s1_cfg;
>>    	struct arm_smmu_s2_cfg	s2_cfg;
>> +	bool			abort;
> 
> I think there might be some padding before s1_cfg. So I wonder whether
> this would be better be moved before to reduce the size of the structure.
> 

Will do so.

>>    
>>    	/* Xen domain associated with this SMMU domain */
>>    	struct domain		*d;
> 
> Cheers,
> 

Best regards,
Milan


