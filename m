Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cRz8K8RaCmrG0AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 02:18:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00905647E3
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 02:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311378.1581527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOlfc-0002Fw-QP; Mon, 18 May 2026 00:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311378.1581527; Mon, 18 May 2026 00:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOlfc-0002Cy-JN; Mon, 18 May 2026 00:17:20 +0000
Received: by outflank-mailman (input) for mailman id 1311378;
 Mon, 18 May 2026 00:17:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wOlfa-0002Bw-Om
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 00:17:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOlfW-0016Gt-NU
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 02:17:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a0a5a84-bab6-0a2a0a5309dd-0a2a450ba0ea-4
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:17:14 +0200
Received: from [52.101.69.110]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a0a5a8a-212f-0a2a450b0019-3465456e67f7-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:17:14 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS1PR03MB8174.eurprd03.prod.outlook.com (2603:10a6:20b:4c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 00:17:09 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 00:17:09 +0000
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
 b=UsLen5IY62MU9o4iJ1MUkX6nT9/CUSq3qpb6xoAXD+X+l+BZDpxC/94EjXoCd706OXNy/oNo4rmAvn2wAabPGbNru6yIO3UIeBG5NZqRQjDVuSwJsqoSzfG9js481W9YhL6vxWdn+/P1OiIhWLvURzkYkM+KNKZMRQTx6rracCgXH+Mt5WNHNFyXge42bw6Qg8B9OlduqQVC5u+eWM6y/NlS7qAtmdZGttS0QCmniX1GizZPw4tyFZdKwyKbXQRMDvCI1bzaVsTt5UQumIV58S3HCfI+6q8ruxZMfZZ1xAyM5u2EcpEdMHOiS8u6ff3AVLLCnujETli0Z9aumP+h0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9Hztv43pW+b9Svw/ou9qn/Zo1JDXaUfuZfdgYW6Db4=;
 b=WIK3RjXGpryea05K3UHRteYnPiUK3OkqlyPqpac1BzwcO6d4ZcpzPVsWaWEJCt7X1gJfOyjfO/QcE7MHoQZuqf6Eq1c8NrE9CU4+qm79HMj12WfOjgGmPDSfPeQV4pXi+4sjzRiI2EpfUd5bRb7tFIDetmXK40ySPjP2XinKxbdT3wHQ6FNuopecltVnKVc9eCuj0W3ZoYGuk+ETFx41DYVzSdkJUOD0oPK7xBAV3GeHdF5e7SNtPzgpE5g7rRjni5wwnV63fy/xuEh/eDMJEwhxfxTpna+sZsxgP4CtN9bJeVU4Z4/ktYHbUgZ/p4czstzK4BUPMWQ83cY+8rQttA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9Hztv43pW+b9Svw/ou9qn/Zo1JDXaUfuZfdgYW6Db4=;
 b=UfcFEO0f9GcxG0Tfdbnum0oqbB4Ysvk4h43pXE7CvMx6IY731dDbvXz5LOGa2HwhSW3GdKEpjyhE//WPvSS0m/GTH686aox1v9+C9igjo4nKvXdyneOfL3YAaDBHA81irBrpnxDTFi3AVUHDFNcccW4qVEP6c2YB6MARUpaGFZm+0MDtIBju0stE380BFc+OnTD8H+Ml5opZVTWF6zLGJ9B6ZTk/CFp/LVoK8xfH+UWBErhb32gQ/xydf10r/wob73Cblwi/UkTyQQlEST7iGOxs+GuOuBLRyND/7kT3AUee3FI0Ster29sCedNuko7VQNfdR/k124rzFCO2pl8jYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <ceb8751a-0a5f-4f54-81e1-cc7488e9782e@epam.com>
Date: Mon, 18 May 2026 02:17:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
 <C6057E0E-ED2E-4C9A-B768-5EE8E23BF346@arm.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <C6057E0E-ED2E-4C9A-B768-5EE8E23BF346@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::8) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS1PR03MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: f2aa06f7-7645-464d-a445-08deb472cc9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	BNl8J8MnBVF6GgW5KvLqAq2C1QroEDagGswiFDY5eBUXz/vZIUnFcTiHOfpX0upcrEwfQlUPvUHUqQD4Ct4xvEryvAg34s5OZ/6pFnzbaSFmiI+QilKYzWDs0+N4etMxA+XxKouGiVFFS9eCBvM+CV/TrGvpNaLywujUUHxtnAPesYrWsOgs5ExIBkLlUWeW/8am+deMmM+wW1pECYs4TDua416I1W1CcJVud4ICDJUClvXwz12O0/f97xTSiuAu6JxkEpkG7j1FfFDkLGd5S3CHrmeIeJgy5v+8bIiI4kWJXamxqx/y/ynSuXRo1Wxcd9vInqLAEMLV2k5sdIKCux3MnqMxkeOrmvmkVIKDBp2QtkPcu93czK9i64dSRnirHUrikoTwsh7ZrUddVE1kPaYyBh0Q9nJB+Yi2NpUCWAp17Ma5Avnrgb0WE+wQFx/DG6EFa3WFiNLZol7uZeZ1Vm0auuNMTEGxqrcdy6vPGaauxZgM4mSJtrG9ZiEFMS0JD32BGdPMyRXJuhzAXE2UfuqaZTMZP0j8xLDGOC73OP/B5d1OyyPTw7ZEW3Y6sA0n6K1Ns7wFfXef+/lfkcjf/BzY5BSjLR5+55gl9lM/5PqHKTAuPaO+vy7qQk/pOaA0+WG/BFDEi+KE/06LcBOigBEANJw0CZGAqVqbHicR1lp/l9jPb+bwibdhSaXZM3sf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(11063799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3hPMzk1UjFrM3VUL2l2anVQRzI5RTFtYnQ3aVlrdnhiTEdzRW5GM3BGNjNl?=
 =?utf-8?B?L2o0NEt5RlFnRjc3OHZ3UmVvMGZ4MG92UTBvNHdtVHR2dENObDg5dmhBS0dy?=
 =?utf-8?B?d2lCbEs5VWpsRHBuTEpBZjI2UW1xMzBOM3NrRklvWnV4V0hIalF2bWN4NU91?=
 =?utf-8?B?b2JxR0U3MGcrTWZXc2JvbEdVd0E0emJrS3h1OWw1V0dxaFJpeXR0MEpVQVA5?=
 =?utf-8?B?S3ZFRVk5bEcxWDlwOUU0WndzYjFYMlNESHllWHVxSmlrZ3ZBNlRGM0VoRDAr?=
 =?utf-8?B?TEMwY3dscHBwWjlhdm9pVGo3SVpLZS9iR3AvZmdPOThOVmcrT0RVMUc1NzZv?=
 =?utf-8?B?WFl5UmxMNXdVdVFTQWJFNksyeUdlRU5XdkhjWWR5MllyRDlMOHRmeVZ4UXNt?=
 =?utf-8?B?eG82NExSZHJNc2dqUk0zRkxmS2oxUU1qNi9DVnhVVlVGZWZsSmQ4ZTdFZS8w?=
 =?utf-8?B?QlZBWjFXNm1iWG9YSnRTbktKTHBVN3lvL1BULzc5dGlYL3lDdWdTTW1Gc2t6?=
 =?utf-8?B?ZndSR3VQWXVwaG9nU29MZEpUY21DcmpZbW5VenNUVWM0MGVYellxZlF3L2ox?=
 =?utf-8?B?UGVWaldhVTdzdDBBQWxpdmlaTFdlcm9yZGZkak5tVDB6SkVQZkVHVmhUeGI5?=
 =?utf-8?B?K1dJYkdQbHR4bm5xQXFTVWpvR1A2eTM3ODhQVCt0NjRnNFJ3aU0rdWk2bXBm?=
 =?utf-8?B?QlNCdml2UU1JS1BiZGNmNHd2QytINDhmVmhUTGhuNkw3YnNETHMrbWhmNXNE?=
 =?utf-8?B?cGJNNE8yTnJ2UDM1QngxVlZqV1hGV05oZit2bEJqaU9ZN1d1NDU1YURhUDhn?=
 =?utf-8?B?a3QzN0FNVGtra0lJOWhEelRhdys5ZUhJbVVyU01VeENDZmJzQWgwMjBGRjR6?=
 =?utf-8?B?TUYwTW9uZFh5cS9yTFp4TUQ2UGVYNFhkeWdWUUIzRG5oUkpXMnA2SnpBRGNY?=
 =?utf-8?B?bzdmUDlvSW5BSnhOQUJnUFUrTW5DcWZHOU1nc3pKbjQ1K1IySWdHWmlOZkRB?=
 =?utf-8?B?V21BbkxDYUJKRlgzSUloVHFidTNVQ0RWMkJUWWR2S1o1cUVaaUxSdTMxa1Vy?=
 =?utf-8?B?VHAxT1paZzJBTEEwVm4xQlVZTFU1UzkvVGVMeThDdDkwWnlEbThGTG9lSDRB?=
 =?utf-8?B?dTFpS3dUR2RhSUc3VkZsQnZ0UDJTbTFIZk5SNmtTRXAvenh0OTRHaTRCVEpn?=
 =?utf-8?B?V0t0RXE4RndYUW53NXRSbjNDaUlLZUg2VjlZaWlBRFRFeUtPZVBjREZwbjEz?=
 =?utf-8?B?WVNRRGFtV2ZZZ09TTjRsTzN5NFFMbXdjaXNIT1pPdGZIZUlpemlkbTBPZmVN?=
 =?utf-8?B?TnRLOStPL1pSVUZ4cHF0d3Q1bUZFNTJQd2d6a0NQaFlIZG5kWGRnTC9SbXBM?=
 =?utf-8?B?aHhvem9GNVBnUGU0M1hzWDY4dTVDRzh4QWJaOEdWY3NvbDIyazQvYXp1U2xL?=
 =?utf-8?B?K3Y4YlAwMXJrbmoyVTFyRjEyeDN3NUxyQndKSXhKTi9pdS90Y1p1RGEwa2ZR?=
 =?utf-8?B?SWxZRVROS1I4Y3JyYWpuU2ltL3dRZ2JPL0xSVHFXQlUyY0VjcmRsb3BSUjV5?=
 =?utf-8?B?bnByYnlpVmFUeENoK1hzTFkyK1BBV0JHUGt0dWhiYmJwSmJNV28xcHBjMHMv?=
 =?utf-8?B?RGM4a3JmZ3NldlhWM3Y3NVBGSE1vZHpuaG5FMnl4RnRmVGRGeUYxQXJLNC9K?=
 =?utf-8?B?VnhIMGorSUJ4S2dOTm9UM0g3T0JMdGpDeEhTMEQxNW5Zbm5ZT0Fvb014MFc1?=
 =?utf-8?B?ZENZZ2NzUGlyUk1nT1dIM1hLRnlFK3hwc3dDQldESk5rWXFpWjd5S245ZXpC?=
 =?utf-8?B?ZTFvUFVxVk9NVzgrSHJCRGlsc0x2ZG9uRlJzVTd6VmcyTW9TQUh3Ym44aHQ4?=
 =?utf-8?B?NGYrdERSUW5FZHBmL3lTWWFnaU5Fa0Q1MmVPd2dYWFlHaVNRVkZpYkpCaG1H?=
 =?utf-8?B?MFhzWDliNzVSUlpFTVFjMW1tbmlWa0NQTjExeFFSRmJuS2YyeGhPWStWbmg3?=
 =?utf-8?B?T3o0YmtDazJ3QkpUMk1LSTBYUkJ2OHlpWWZ4ZStDOXlpam9oVUFvaUtONlBr?=
 =?utf-8?B?VjhBeEdlb3JsT01hK1BFOXRkSXRmV3l6bWxUbjlRSUhIaFMzanhma2tuQlBu?=
 =?utf-8?B?NU9iZ2FLZTdhSjE4US9CU24vaHgxdFVEN21CMm9ENGp5WUk4L2tGWWQ3SlIx?=
 =?utf-8?B?Z1I5a3k3V05sNUR2NDdFZUJYOEJXMTVieUU0TmM4ZkJwUUlDaDdnRlNDMDU3?=
 =?utf-8?B?dzh1WjhKcERhU3IwOHErTDU5NGp6U3MzZVBqQjl0Q0F4NDkzZUhxVEVEQ0hx?=
 =?utf-8?B?Mno0V0pLcU1QbURMQ2Y3dG91MVgvOUN5UkVDRmpvZVlwU0FScFBaZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2aa06f7-7645-464d-a445-08deb472cc9b
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 00:17:08.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8q6DaCKSgMmU5GMkdRQfOjGM0kTwpCmC6M0/lkJCX8yhXh7ERyqTV0GDnQgRZyndgwc4L7j6OFs57ManSO9zwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR03MB8174
X-purgate-ID: tlsNG-42698a/1779063434-19F6EF3B-04B9EED8/0/0
X-purgate-type: clean
X-purgate-size: 9508
X-Rspamd-Queue-Id: E00905647E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Luca,

On 4/10/26 17:27, Luca Fancellu wrote:
> Hi Milan,
> 
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index e36f200ba5..3ae1e62a50 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>>
> [...]
>> static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>>                                register_t r, void *priv)
>> {
>> +    struct virt_smmu *smmu = priv;
>> +    uint64_t reg;
>> +    uint32_t reg32;
>> +
>> +    switch ( info->gpa & 0xffff )
>> +    {
>> +    case VREG32(ARM_SMMU_CR0):
>> +        reg32 = smmu->cr[0];
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cr[0] = reg32;
>> +        smmu->cr0ack = reg32 & ~CR0_RESERVED;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR1):
>> +        reg32 = smmu->cr[1];
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cr[1] = reg32;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR2):
>> +        reg32 = smmu->cr[2];
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cr[2] = reg32;
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_STRTAB_BASE):
>> +        reg = smmu->strtab_base;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->strtab_base = reg;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
>> +        reg32 = smmu->strtab_base_cfg;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->strtab_base_cfg = reg32;
>> +
>> +        smmu->sid_split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, reg32);
>> +        smmu->features |= STRTAB_BASE_CFG_FMT_2LVL;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_BASE):
> 
> I think this needs to be VREG64
> 
>> +        reg = smmu->cmdq.q_base;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->cmdq.q_base = reg;
>> +        smmu->cmdq.max_n_shift = FIELD_GET(Q_BASE_LOG2SIZE, smmu->cmdq.q_base);
>> +        if ( smmu->cmdq.max_n_shift > SMMU_CMDQS )
>> +            smmu->cmdq.max_n_shift = SMMU_CMDQS;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_PROD):
>> +        reg32 = smmu->cmdq.prod;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cmdq.prod = reg32;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_CONS):
>> +        reg32 = smmu->cmdq.cons;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->cmdq.cons = reg32;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_BASE):
> 
> And also this one VREG64
> 
>> +        reg = smmu->evtq.q_base;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->evtq.q_base = reg;
>> +        smmu->evtq.max_n_shift = FIELD_GET(Q_BASE_LOG2SIZE, smmu->evtq.q_base);
>> +        if ( smmu->cmdq.max_n_shift > SMMU_EVTQS )
>> +            smmu->cmdq.max_n_shift = SMMU_EVTQS;
> 
> This seems a typo, I think here we want to modify the evtq, not the cmdq?
> So in case both condition and assignment needs to change.
> 
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_PROD):
>> +        reg32 = smmu->evtq.prod;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->evtq.prod = reg32;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_CONS):
>> +        reg32 = smmu->evtq.cons;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->evtq.cons = reg32;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IRQ_CTRL):
>> +        reg32 = smmu->irq_ctrl;
>> +        vreg_reg32_update(&reg32, r, info);
>> +        smmu->irq_ctrl = reg32;
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
>> +        reg = smmu->gerror_irq_cfg0;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->gerror_irq_cfg0 = reg;
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
>> +        reg = smmu->evtq_irq_cfg0;
>> +        vreg_reg64_update(&reg, r, info);
>> +        smmu->evtq_irq_cfg0 = reg;
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_GERRORN):
>> +        reg = smmu->gerrorn;
>> +        vreg_reg64_update(&reg, r, info);
> 
> this should be vreg_reg32_update
> 
>> +        smmu->gerrorn = reg;
>> +        break;
>> +
>> +    default:
>> +        printk(XENLOG_G_ERR
>> +               "%pv: vSMMUv3: unhandled write r%d offset %"PRIpaddr"\n",
>> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
>> +        return IO_ABORT;
>> +    }
>> +
>>      return IO_HANDLED;
>> }
>>
>> static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>>                               register_t *r, void *priv)
>> {
>> +    struct virt_smmu *smmu = priv;
>> +    uint64_t reg;
>> +
>> +    switch ( info->gpa & 0xffff )
>> +    {
>> +    case VREG32(ARM_SMMU_IDR0):
>> +        reg  = FIELD_PREP(IDR0_S1P, 1) | FIELD_PREP(IDR0_TTF, 2) |
>> +            FIELD_PREP(IDR0_COHACC, 0) | FIELD_PREP(IDR0_ASID16, 1) |
>> +            FIELD_PREP(IDR0_TTENDIAN, 0) | FIELD_PREP(IDR0_STALL_MODEL, 1) |
>> +            FIELD_PREP(IDR0_ST_LVL, 1) | FIELD_PREP(IDR0_TERM_MODEL, 1);
>> +        *r = vreg_reg32_extract(reg, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IDR1):
>> +        reg  = FIELD_PREP(IDR1_SIDSIZE, SMMU_IDR1_SIDSIZE) |
>> +            FIELD_PREP(IDR1_CMDQS, SMMU_CMDQS) |
>> +            FIELD_PREP(IDR1_EVTQS, SMMU_EVTQS);
>> +        *r = vreg_reg32_extract(reg, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IDR2):
>> +        goto read_reserved;
>> +
>> +    case VREG32(ARM_SMMU_IDR3):
>> +        reg  = FIELD_PREP(IDR3_RIL, 0);
>> +        *r = vreg_reg32_extract(reg, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IDR4):
>> +        goto read_impl_defined;
>> +
>> +    case VREG32(ARM_SMMU_IDR5):
>> +        reg  = FIELD_PREP(IDR5_GRAN4K, 1) | FIELD_PREP(IDR5_GRAN16K, 1) |
>> +            FIELD_PREP(IDR5_GRAN64K, 1) | FIELD_PREP(IDR5_OAS, IDR5_OAS_48_BIT);
>> +        *r = vreg_reg32_extract(reg, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IIDR):
>> +        *r = vreg_reg32_extract(ARM_SMMU_IIDR_VAL, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR0):
>> +        *r = vreg_reg32_extract(smmu->cr[0], info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR0ACK):
>> +        *r = vreg_reg32_extract(smmu->cr0ack, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR1):
>> +        *r = vreg_reg32_extract(smmu->cr[1], info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CR2):
>> +        *r = vreg_reg32_extract(smmu->cr[2], info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_STRTAB_BASE):
> 
> this needs to be VREG64 I think
> 
>> +        *r = vreg_reg64_extract(smmu->strtab_base, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_STRTAB_BASE_CFG):
>> +        *r = vreg_reg32_extract(smmu->strtab_base_cfg, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_BASE):
> 
> VREG64
> 
>> +        *r = vreg_reg64_extract(smmu->cmdq.q_base, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_PROD):
>> +        *r = vreg_reg32_extract(smmu->cmdq.prod, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_CMDQ_CONS):
>> +        *r = vreg_reg32_extract(smmu->cmdq.cons, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_BASE):
> 
> VREG64
> 
>> +        *r = vreg_reg64_extract(smmu->evtq.q_base, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_PROD):
>> +        *r = vreg_reg32_extract(smmu->evtq.prod, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_EVTQ_CONS):
>> +        *r = vreg_reg32_extract(smmu->evtq.cons, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_IRQ_CTRL):
>> +    case VREG32(ARM_SMMU_IRQ_CTRLACK):
>> +        *r = vreg_reg32_extract(smmu->irq_ctrl, info);
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
>> +        *r = vreg_reg64_extract(smmu->gerror_irq_cfg0, info);
>> +        break;
>> +
>> +    case VREG64(ARM_SMMU_EVTQ_IRQ_CFG0):
>> +        *r = vreg_reg64_extract(smmu->evtq_irq_cfg0, info);
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_GERROR):
>> +        *r = vreg_reg64_extract(smmu->gerror, info);
> 
> vreg_reg32_extract
> 
>> +        break;
>> +
>> +    case VREG32(ARM_SMMU_GERRORN):
>> +        *r = vreg_reg64_extract(smmu->gerrorn, info);
> 
> vreg_reg32_extract
> 

Yes, these are all mismatches. I'll fix them in the next revision.

>> +        break;
>> +
>> +    default:
>> +        printk(XENLOG_G_ERR
>> +               "%pv: vSMMUv3: unhandled read r%d offset %"PRIpaddr"\n",
>> +               v, info->dabt.reg, (unsigned long)info->gpa & 0xffff);
>> +        return IO_ABORT;
>> +    }
>> +
>> +    return IO_HANDLED;
>> +
>> + read_impl_defined:
>> +    printk(XENLOG_G_DEBUG
>> +           "%pv: vSMMUv3: RAZ on implementation defined register offset %"PRIpaddr"\n",
>> +           v, info->gpa & 0xffff);
>> +    *r = 0;
>> +    return IO_HANDLED;
>> +
>> + read_reserved:
>> +    printk(XENLOG_G_DEBUG
>> +           "%pv: vSMMUv3: RAZ on reserved register offset %"PRIpaddr"\n",
>> +           v, info->gpa & 0xffff);
>> +    *r = 0;
>>      return IO_HANDLED;
>> }
> 
> Cheers,
> Luca
> 

BR,
Milan




