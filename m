Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CarCzX4w2nPvAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:59:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5874327526
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262512.1555009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Ph7-0003sL-7z; Wed, 25 Mar 2026 14:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262512.1555009; Wed, 25 Mar 2026 14:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Ph7-0003pF-2x; Wed, 25 Mar 2026 14:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1262512;
 Wed, 25 Mar 2026 14:58:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5Ph4-0003mm-UI
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:58:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Ph4-00GX2B-A4
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:58:50 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f811-bab6-0a2a0a5309dd-0a2a4507d41a-46
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:50 +0100
Received: from [40.93.194.40]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c3f828-fd74-0a2a45070019-285dc228b9de-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:58:50 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB8032.namprd03.prod.outlook.com (2603:10b6:806:45a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 14:58:21 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:58:46 +0000
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
 b=ieuV3YtokPS0ABuZKF/6NiNMC60w3jO6TVXXDyJ7yOcYFOKzMeF7bkzE3p1A0C75Jjd5lQLzvtjYwwTV4amSxBosBnAhTfmf0oWhQAPYTtzKqeg5obsdwgF9LHWGK+7qxhTT3XwkSnRvrSqM2aQqJUxpZRn2feQ6NitgXTt315tEUn9g+omAaZCDe5b2RslgcCLf9GhkL2GxTai5SBlaIwLI07fYVjP58rS8bEXXXIJMGMus/4AoLfnAv6hzJk/zuaDC4qCoQtMy4rS9ikDBia3EoTriaFXkfVYz3JfZO9B0NE2yafFcdredkqWWneiJMGMhAjS6xmNk71THFoWNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HJQmWV5LXBRJiOFnmS7ItBccNC3tJXifThqLT1z2f4=;
 b=Z/SQHsk2JRf1VMo2/GFthJBiuHybXPX8FY1lW9AyfTZ5NuJ1t2JYPAPKDaqfJLxfaaa3owYieABzbZ8gALnL4X6+IXStifKUhXNpG3eyOipCeE9OdRZ9BIRo4w6/ELjYomY11mRKR1aG7fSzVVLfAGtnIs7OGEYaIKbMs+d396P9ThsGSm7higNnmIgtOFReK0zuGvtst4Rrp13yyV8lLlAjj7clPm5gearfYfjvnlw0c6uBoHi6rmf8BvflADuHjOkQ+hsLGECqwuV6tcZj0zUpWOKqZB9UtvoTXNRtAaXhs48mNwgA44itM/jLkTZW8kd+y6/x5dbM+cPt0Kz46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HJQmWV5LXBRJiOFnmS7ItBccNC3tJXifThqLT1z2f4=;
 b=S/IBT+kADLsTiVLCvN2ri338FFRaVXWQHu8eyTala17a8MQ1r+TQ3OmMUj5fb9CEIsz4pF2yJTjk2nXU8Hsu7q+wYDfCi416c/I/ZVCpagiiq5EAOyBEmEY+tMnuZBjCgb0HU8Os3lT0gt4dQA3d7oGNH4B3lEJlBaq6ZVao/6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/4] xen/uart: report an error if the device type is not supported
Date: Wed, 25 Mar 2026 15:58:23 +0100
Message-ID: <20260325145824.31601-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325145824.31601-1-roger.pau@citrix.com>
References: <20260325145824.31601-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0022.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::11)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: e827eb6a-1d12-41a7-d930-08de8a7f03dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jgMgvq5l2jx1XL5JtOr3YkaG8hN4J0SyAItSaVOmSVwC+MTST00q01Y0y8VHiHWJmtk1AGgm01V8fYrYPetv9j30MtXfeKqWamMJ2pGcOjLlR7DyJKnYSsZyvU38pdj2ZEyfT91Kv9UQAWBUYQk/FEXNmULyNcPdY5pNhdzo8JrhYq7bWninjeNDOZqXvroxaky8we+ppTmk8Gh6zZVtjrziFOacOpMnuozV8Ey7nyJm5lk0vmWq3LPgCr/1wdw2MjQpHzsTsbDeF5jOJV3szfaYrSI+E8Flfccmo7G3p0gyg3m6oo12XwSFyn9wzXq4KzmXb/YWUvS9uIwXb749pyP6dr1IjTlqRqzAdT/SiUd0m0BvqRQy6QLFURQXOVGYyJeRScSclRney/3SArmoWdr94oieXFLpeiK0FlFsYHcDrphN4v5dj+10GBtdWhR9cgHn94jYcgz9Q4VDy9cIYVFVURWPO8WJ27d5Eg3VH4g5YOh1RWyPUFnUgO5Jaa5Dz08jv7f2dgJywhTRixqrIgDZ5zgTlTbGqNtnW/oWhO+05VwVfJ1Bk7I7sNjR0CiOaojGIJcD1SckaFCVv6O1deSpIy8x9WRlFKR4KLQQMbSHgo68jrnJrcnMGHa8htoVG0YFFILKdQ048XvGviHwkIRw7Xsqbu2jHNNl1v2x1uyegmvg1Ix9G64MeBb0+x6opWXV35K2zVBpBNb4lGdwc+4XZIDaA+BlsiTUgvIAOwo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3VrZHNrSjcreUNCUExBYnQrV3E0SS9MZzA2QlgvcXIvVGNhYU5wd3FwNTRX?=
 =?utf-8?B?SjZBNHJ3Z1FKd1Qya3cvOFFtTHFNNC9qYkMzQmRYbEJ4SDVWRVBIcEhSNnpp?=
 =?utf-8?B?QmdhK2NETXpDa01xL0NycytGSWZXVkd2eURkcFRTcTJTbzd5NHh2bG4vUkM2?=
 =?utf-8?B?cEdUM3ZJSmJHT3pkVDJ0TEFkR0kzRXJMWlJzTUhkRkRWOUFobDByaWVIT0hV?=
 =?utf-8?B?dGw1TmpmbThFWHpuMjhxdk1FZGo3RFJJQ1NBaU1nRFRRV2t3bHNjSjNGc0RK?=
 =?utf-8?B?Vno4MkI4cUdTNEZHYXVPM0tza1VJRzU0N3RpQkxxc01aUUV6QWxleGhFWUhy?=
 =?utf-8?B?K0pHdFA5ZmxkSHI0WERlR1puM0w0cC91TFZxYnEzUHRIMmJKRXV1aGJ5Nmw4?=
 =?utf-8?B?MjFaZUFrN3pWSFlwN2RVejdJRFBUdW1wUDk1cDduelNua1lXM1RLZkU1Vm9r?=
 =?utf-8?B?UjVaeEJrdlJiNnhkSVQxamI3RER0M3JGNzErUkwra1JVWjZGMnBpUzRxaEta?=
 =?utf-8?B?UjNXbTk2UmFvd09OSTJHQ25hZTVCL2dvQnZvS2c1SUpkWWxxdGM1ZHNlZVNP?=
 =?utf-8?B?WTY4aE40cG5mUTZDUWRqcTFKdTErazIyR1FUQVJsalhnb0I5ZklTN1QyOXJo?=
 =?utf-8?B?cDNhM09pcTR4ZWszckFaRU9PQUVMYVhJUDlqaDNtOS9QaDRRcVNnbS91TWRZ?=
 =?utf-8?B?d3JIdlMwMGRLN3dIaGRaVkExNHJBeHVIcW0vSW1TY2tBbzU0YVRyL3lVN01Y?=
 =?utf-8?B?bE4zVjJWUm9pY3VJZDB4TzhkNmhRd1NRM0FHQzYwclYvazR1dmcyVTlzR1NJ?=
 =?utf-8?B?VGltOGl0U1ZaR0FLUlpqaThlNWkwRTdoR1dsWGRHazVKeG5uQVpNd09ZdGox?=
 =?utf-8?B?QkZtOFhxdWhUclo2RkRwemFicGNJd2FLNEd4cE1iSmo1cFNPTGs4WmxWT0pB?=
 =?utf-8?B?Tjhjd0ZQQWttV00xRjVCSDJvU2JQYm4zZzhsQlA4a0cwYjlnTUJZQ3JYVkh1?=
 =?utf-8?B?L0VTcFZxRi83aTl3d2NNTGUwM29pWFJ0U093blVWVXFuQS9VYkJvK2ZMOUFo?=
 =?utf-8?B?aFFNSUxyTnBEMElIUXQ1a05CR3REVXpQQklLdDlmUWdCc2hmSElFMEJYdFps?=
 =?utf-8?B?dG90bDMzQ1VPU1h5R2NVOEgrL0pVMGZoazFnYU8vcUpiM0JnRGRRQUt3YUJN?=
 =?utf-8?B?dEdNd1NSLzhUOFBqMUZ3dXlEc3RPa3JtT1FSM0c1NGVwalN0M2N2VVhXYU5I?=
 =?utf-8?B?SHU4cUJnYktPRGlObHFhN0NWNDFLcEJzUmo5cDRVZUJSTG9LeHFiOXlERDRz?=
 =?utf-8?B?TUczZEhDN1c1SGszOUNXb1U3c0Jsc3VndzUzNVQxTzJHSnJMWGN5QldQcEQ4?=
 =?utf-8?B?Q0E1dExNN3N5clRleFhYc0FwaDBDRG00b0E2TkpuQnpIdmVYbUpaWGF2NDNC?=
 =?utf-8?B?eGVHQm9ZR214a3ZZVzd1WXNFR25zU0xKTnV6d2pPbzcrcjlIZGNhcTY3RC9H?=
 =?utf-8?B?SVNqWEd5VE1lRzhucXh4bFU1Z3ZWZ3ZGNnVBQlI4VVJLak9EdjlHVXFoTFYw?=
 =?utf-8?B?bUtJSlI4Q2lqT3JxY0ZtKzR1NDJQcll1bE1HajVRUlZ1QjIxUHAwWUowYXc1?=
 =?utf-8?B?N2RzV1VMbS80Z1Y1MXlCUUl0bllvcE5xbFV1ZVQ4cUVuSXRpQzg5bFI0bWhi?=
 =?utf-8?B?dmo3aGthZkprUkhZNkNhMDdaYk16TjNGVTJHQ1FuWEdSbEFVbTBkMTlCdEFs?=
 =?utf-8?B?M1gxRVZDelh2MDN1bE53azM0NFdwU21MOVhJZURvNWJVOW8yU0V1YmN0S2Zq?=
 =?utf-8?B?NGN4ejRURVRWOHhCNVdXaW1Ma2pCWkJaeXpoWkJKaW90OFhjZ3NrdkQzbXdX?=
 =?utf-8?B?RTNxdXlLU0FQVXo4MUhldkhKVDdDd3ZvOTFrb0ZvVGZ4ZXpHditUZkFrQ01X?=
 =?utf-8?B?cUNlWWFwOGx1RDZBMHdIUDZqQzV2SWs3aWZ3TnU5Tng4cElBejU5a2FQSVJ4?=
 =?utf-8?B?Z0RzbVpsSkZQTlFIdDNjeTdWS2orcW5CZFJRVFVDMGJ0dXRZMGJFL1Uvdjg5?=
 =?utf-8?B?MVBFZFBsem5YL0Y4Z1dpUFdLeVFKL3RHVE9GS2FTSG45Ykd3WHFEVEl4Y3pY?=
 =?utf-8?B?TTZyWWVFdWY3QlMvNlFLL2wyYTgrSEQyTlRYYkdiRTVkMXd4QnA0bEZvSVp0?=
 =?utf-8?B?TUJQUUhuY1ZxWmhnVWlTWkVwRE1SNk5mblhiTDF0UU03cmJRUlNCS2VwUXEr?=
 =?utf-8?B?Qmx1RlpUa1kvallLc0RjenN5T2E5WkhmT2c0a1RkTDhRS216L2JldzhDQkF2?=
 =?utf-8?B?eW1NMW4xblkvSHliRFg2M3RxeWt4NmxFbU8wdDlsVkRyY25GRnowdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e827eb6a-1d12-41a7-d930-08de8a7f03dc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:58:46.5378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1Pjeil8tVgIbzkgke61f+qGv1DHyRqM0T6HyDWTRAelUAgoN9J7lYUpJlVCwTXoOPpoGUKyRGy82z/laxJ/8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8032
X-purgate-ID: tlsNG-ef75cf/1774450730-566AF303-9F04E9DC/0/0
X-purgate-type: clean
X-purgate-size: 866
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D5874327526
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When using key pairs for the uart configuration (com1 and com2 command line
options), report an error if the passed device=<type> is not recognized
instead of silently ignoring it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/ns16550.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index da3b6fdf99d9..9cd3e471bfa5 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1655,6 +1655,8 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
                 pci_uart_config(uart, 0, uart - ns16550_com);
                 dev_set = true;
             }
+            else
+                PARSE_ERR_RET("Unknown device type %s\n", param_value);
             break;
 
         case port_bdf:
-- 
2.51.0


