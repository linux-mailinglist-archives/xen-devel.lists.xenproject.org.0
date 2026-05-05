Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEGTOvEK+mlsIgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:21:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB44D01D9
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300801.1575269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKHZT-0002kg-6q; Tue, 05 May 2026 15:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300801.1575269; Tue, 05 May 2026 15:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKHZT-0002hw-3W; Tue, 05 May 2026 15:20:27 +0000
Received: by outflank-mailman (input) for mailman id 1300801;
 Tue, 05 May 2026 15:20:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKHZR-0002hq-94
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 15:20:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKHZP-004FA0-4H
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 17:20:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fa0aa7-e002-0a2a0a5209dd-0a2a4504e16c-48
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:20:24 +0200
Received: from [40.107.209.68]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fa0ab6-1dec-0a2a45040019-286bd1441d2d-4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:20:24 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB7076.namprd03.prod.outlook.com (2603:10b6:806:33d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 15:20:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Tue, 5 May 2026
 15:20:18 +0000
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
 b=X0yFCG9o776Yfu2351swqgUkBJJ1lh0SLSXt95oO+eyF5Yun9pJI0ku0Z/VVM1mwNDVVhWaR1O7g1hjrLL1988m/1c84cBPeTzgjkeYvR4uNns8sgPkGmoE8DrFrTCRv/lxp5EnE8aF/OIjJqTKAGVvfvj9zYnbl+r8/O6wZM78YooKud5naQAdAasSTpZbmabSU7j65gRGWF9GHc4GbLtUgdkEGImcrKj8b5lFdvWdAm27keuRD2zlhnJGY9iB82WQbf3FcxMskB/G4xK00eCYl2EtCgwZtpcZXL6/qn/w7Pi+BkajEvJkgWbb74u0GyEaDvXE1zse56Ssroum+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj/j1347nmGGMN+UrJY1jiDh2tQtl1UDfnAXMgjXy4U=;
 b=rVyN+F5az3qjmVLvifsGTdiX2tSZu0gJKHf+2BxtaaLJMVQ9dLcxstmBXcGzYBdQpuRGYaENKOmuAXUfkQFr9oi3u/4gqrhs7yHzG10a2Y6eWIfiYs1EQBTvuXpIOKwkQa14SClU1iTteWKfMnpqW55GWgrxyce5FsFB5/vGJ4f5RuGGMXpR3/8URSF/Z+O3Y6uLrr8BJAJ7bR0XG176CHWvJ6RB8PRicFGQQX3KKpeQPDFVvTAd33tId3+jfGnntQlrWpbGGwMBLkwfRKtsmMP9ZueaHHzI2Zo1XnG85FYANV0th+wbKuyIeVoY0nbWOJRU35xYIXGQ750wcgq/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj/j1347nmGGMN+UrJY1jiDh2tQtl1UDfnAXMgjXy4U=;
 b=tAqVGWbSy02hfJKSBZdJYuPzCg06tkkvXR3qulTzNOErp8g7lS+gBdOQBmoddk29jhnhaUrvhR5/EcSf05u5b6K9hrlMTupQ5Jv/YU3PXjD8aFDnYCkX6EEDJwUooCtYt5JUr72GPWgMfcB9ALE4SFOPqLvv8FL4vMceOJRAC5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 5 May 2026 17:20:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
Message-ID: <afoKrmK7-vkPe8qE@macbook.local>
References: <afi7HUFoDYabM9VV@macbook.local>
 <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
 <afmYf-ldUxWQXRDL@macbook.local>
 <309b2ff6-c200-47d0-be3f-ec289df641c6@amd.com>
 <0a3583df-2682-426e-a704-aa8711caec0d@suse.com>
 <a90db340-e569-4f77-b5df-dd1a1504f8cf@amd.com>
 <0267eb6f-1161-45b7-8905-d7aecb78e74c@suse.com>
 <e8218607-26d8-4517-8634-df3c365e5bb2@amd.com>
 <94f1f29c-0430-421a-8b48-398fa0495966@suse.com>
 <323e36d0-63e1-4331-87ad-d84f948feef7@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <323e36d0-63e1-4331-87ad-d84f948feef7@amd.com>
X-ClientProxiedBy: BN1PR14CA0008.namprd14.prod.outlook.com
 (2603:10b6:408:e3::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ba5677-2f7a-48d9-8ae2-08deaab9d095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XYS0V303CwMlmnreoV1H77EH2rs6IWvcTTcjZUsPTE3FKsyRc3pj60VYd5wDt08N6Y94qbd8jGAKc05X3JutePejE28P6km2jYVuq963scEeErwh+im6zB4P4c8SJZYXMsGENpjr15sWATFuytY6BZP7k60aouNsAyiVVtEkid7EinD98si7+0fzxF1l8N3A//M0H0ZvI6eRMromN8P01OgWgb1zl89YDuBNffVw+DUQB0x1WYKdNzU2AwXwbnf9IOo7rBtg0OxGNzIsdPMbOOAbb7XM3HjuCrMb0UkkW/8TKJA3Y49B6ig1tpfV177sF6/ATjIp2JmAqg+4evy4+2IQVJRTBO4+rfkTiwIVXqB9bdNba78v6kvscDzuIjrJB4YCtghq4bA58hEmWV0NS6OMAzGyX/GunQvwpRLq2gvdeENRFVskwAChjCRSsvB+FepZ+Zk8hzp7lbHxCkbmuDuFgYYbYpia9HSthX5/Z68HJxLtqdX4OGRGznZxyl9Kj1CLjin7wLBRGy0ZO38D8jbtFqK8iDiNKMYd1CMjbp03KKL+btqFHEtNjKL+ky8CZUujqWkIToNa/oY99cEGeBe4BjBnwCxMcYyBCO1/kMVO2ea1Z6w4K9KrIq2WkR6ecmgCWDv7tTH84thVnRt1dZrUflpXyaF3Jgaf6qYlxos9adDGzWVu26EsXD+41JdB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE5yNFJFb0hBSUN2cGRiWVFoYU5tY1RWd0hoTTRFcjFCUUZRT1llQ2hMa2hh?=
 =?utf-8?B?VTA0bkVVT3g0MlRqWGNDUHl4OXFrL2ZiVzIwb3ZEdVU0SUxLSG1nT2tpeGJS?=
 =?utf-8?B?cVEzc2w5UEhSakMyeCswbDZaOElhRDR5MHp5RndSN29GamwwVk0wSkdMeGF3?=
 =?utf-8?B?bURqWnA2WEhEN1hScnpmOS9PK25EcXZzbnhsUE9YZTZlczhyYmNkV0o5b1U0?=
 =?utf-8?B?N2h3bzhZakN3ZzJ6aDNZSldmVE1WalBnT1R3VFQwdlEzcnZjYjNkc2o2WmI0?=
 =?utf-8?B?cU9INTcxOW5sUDJ3NzN1TVIxVEVyR0MzSHIzTVAyS0hUMkIyaGFENDFDSmJL?=
 =?utf-8?B?OGtrMW1oayt3MWdoR3lTZ29OeDh0VXl5MW13V2ZDZmVPTzhTdzVmNTIrVlNG?=
 =?utf-8?B?dlYzb1RBUjJnRGNqMUlubzk5eVljRnF1QUxxb3JNWkEzdzBQSlVoc3dxMDc1?=
 =?utf-8?B?bDFubld1RnBQVXg3ZW9mTzhMQi9PQjRTS3lINm9zOXNtcmdkNGloZXUyajRL?=
 =?utf-8?B?cFEzM3lhVTcrakNmNlBWOGhCRFpJOW5GT2QvVUIwd3hSRmN1d3BXbnZLR3lG?=
 =?utf-8?B?MUhpTjVObmcycDU5RWN3aS92elpYWWtnVWNpRWppYnBiQ2RzQXlXdXV6dzZt?=
 =?utf-8?B?eTR5bE9ycHdsUk1wdU9qVndLQ2UrZWo3UnROWlJaVHVtQ1ZKWFg1Z2JTQzdR?=
 =?utf-8?B?N0dHeno2c0NETW9NRzQvWC9ZZmlPRmdSTWZKaGc4a2M0Wm5wL1Z3K0cvMmJF?=
 =?utf-8?B?cEV0TGkvc2RlVDhtOHVqeXFXd2pnNmNoMlZFMFc4Ti9xeTQzdkF2cS80R3VU?=
 =?utf-8?B?cnF6YTJONEh3MmxNa2lLZXliZjFtRTRvRkdEbUgzV2NQUTVYUjBYWmpaQWNl?=
 =?utf-8?B?YStvUEJGTzR1MWNmUlEyTGI4RHI1d3czZnduYm9MR1pJVk5ndDk3d2NBTW8v?=
 =?utf-8?B?ZjNJRytQSS8xeno4VUY0MWVqcDBOejhUNGZBZHF0aHJLOWlxZm02SzRBb3Ey?=
 =?utf-8?B?cG03SlpETk5TbklERGdsODN6bjVaM3FZb2g1R2d0R2lvNllzLzJEUFJOOElM?=
 =?utf-8?B?WGdFWWsyTU9DeDZaV2pxT2hYNlhTa1FMRjZDQlZRazFEbFRlSDFiS2xRVElu?=
 =?utf-8?B?b202WjFtcFArNjdFK1h4WmdidmQ4QWoxK29VUkhRYlgyTy9FTVNHSWE1bktF?=
 =?utf-8?B?emx6UHlsVWhJT0tub2JQelEvMHdyRkVjaHFjc0JOTnhsL2c3dzgwSW1ORXVy?=
 =?utf-8?B?QXZQOXh4UzFMMHRWbXIyRW5WOGwwVEdzdlNTLzQ5WGVhcTE2VkZ5bVB4THZp?=
 =?utf-8?B?eDVVZjZ0bDhuSnliQTNuZXBQbXFiZnQ4Si9ub3dRYW16RHpVbmUvZnFiSENh?=
 =?utf-8?B?bUtyY0NCMDNNMmkwQjRSUEFCdWpSYlZkOFZzV2IvYU5oYVo4a2kwK3BlWUpX?=
 =?utf-8?B?Q3dXdnVvRE9HdmREOWNqWS9rdGVXYmtkZDUvSjFEa0NHU3FrRmw2NXJ2cE96?=
 =?utf-8?B?N1RYVzEwb3UzT3pCZGNjTEZBRmZKOWt0SFZRUU5VdWFJZ1N2b2FVVmhtUnVF?=
 =?utf-8?B?U1Y4c1JjYUpJbTFFREdBbkFnSktrTGVZcjg2aWJZUUt6anNseHI0QnkwVnV1?=
 =?utf-8?B?UnVMUFBDV1hqUUdqMC9aZkdMdG1OU3N2bjRrbWFhV2lXMFJoUVlVUmN6dzVs?=
 =?utf-8?B?b09zYXBJdlg2TnZLTFJDNEdLVkptOWpsNFZzcm0vMFNoTFF4eks4SU8wcWw1?=
 =?utf-8?B?QTlmMkRkUW42bnVHWEdOdjcwRUhFZ1VlaHRiYmRIOWp4U1Q5ZkRvZVFOMzhw?=
 =?utf-8?B?cjlpdlFJTmdzc251dGZScHcxVFRzeGZlNWMveGJGMTd5QjVMRkQ3QXk2ZXJj?=
 =?utf-8?B?Q29MWG1KMm9CM3VEdmhWSk9KdXc0ZGdNMFVmRng1dWxXZ0MvL0xrbmtPYi8y?=
 =?utf-8?B?czErNUdtaDJDWHRVUHJJclhLekxsTXE3Q3dWUVovWDhGZ01PVlB1em14K3Jm?=
 =?utf-8?B?WlcxR2dub3dSNmZmQ0FVTE85RHY3Yk5RdlNUa1YyNHBiazNsczlLQkptem1B?=
 =?utf-8?B?d2dsa2lscUNYWmEvQ0FMYjBGcmVqaE0zMXVvZVk1MHlRcTVmQ3FRR0hOdXZt?=
 =?utf-8?B?VUtqK0xmTFpQYWR6OWh2UlJUNURUalBRZmdybnZqR2xFOEwwcVJDZXlKdk03?=
 =?utf-8?B?QTQxMWtuQUV1OVYwYklWc3BGdVdqUElCc3JBTFBISzRha05hOUxWZFhYQ0lh?=
 =?utf-8?B?Nmd3KzFTTEkvSUlMcDdudjhWNHlKeVlYVWxlZnB4N1VIRmpmQS9HalNuSkZM?=
 =?utf-8?B?eXFqTlk0YlMxbE9KVXIyazV1cmw2MkxrcjZEK3RMK3pMcDdMUlVXZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ba5677-2f7a-48d9-8ae2-08deaab9d095
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 15:20:18.1465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n14dwXWYmrJI5+1x3pBW25kf7ThXh0OdPB4V1jvt3zyrTMDvXWVJgE4M6EvFPIPSMhnTk7bRVcRCmiKMmi8n+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7076
X-purgate-ID: tlsNG-ebf023/1777994424-43D6C3FF-122A9B51/0/0
X-purgate-type: clean
X-purgate-size: 6418
X-Rspamd-Queue-Id: 35AB44D01D9
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, May 05, 2026 at 04:44:16PM +0200, Orzel, Michal wrote:
> 
> 
> On 05-May-26 15:00, Jan Beulich wrote:
> > On 05.05.2026 13:46, Orzel, Michal wrote:
> >> On 05-May-26 12:49, Jan Beulich wrote:
> >>> On 05.05.2026 12:46, Orzel, Michal wrote:
> >>>> On 05-May-26 12:40, Jan Beulich wrote:
> >>>>> On 05.05.2026 09:35, Orzel, Michal wrote:
> >>>>>> On 05-May-26 09:13, Roger Pau Monné wrote:
> >>>>>>> On Tue, May 05, 2026 at 08:48:15AM +0200, Orzel, Michal wrote:
> >>>>>>>> On 04-May-26 17:28, Roger Pau Monné wrote:
> >>>>>>>>> On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
> >>>>>>>>>> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
> >>>>>>>>>> the frame table starts at PDX 0, which is only true on x86. ARM
> >>>>>>>>>> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
> >>>>>>>>>> defines it).
> >>>>>>>>>>
> >>>>>>>>>> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
> >>>>>>>>>> to 0 when the arch does not define it. This makes the generic macros
> >>>>>>>>>> correct for all architectures, even though they are only used on x86
> >>>>>>>>>> today.
> >>>>>>>>>
> >>>>>>>>> Hm, I assume this offset was added because the original mask PDX
> >>>>>>>>> compression won't (usually) compress the gap between 0 and the start
> >>>>>>>>> of RAM.  However the newish offset PDX compression should be able to
> >>>>>>>>> compress from 0 to start of RAM, and hence you don't need to apply
> >>>>>>>>> an extra PDX offset there?
> >>>>>>>>>
> >>>>>>>>> If that's indeed the case it might be better to integrate
> >>>>>>>>> frametable_base_pdx into the mask compression algorithm itself, so
> >>>>>>>>> that on some arches it's a mask plus a decrease.
> >>>>>>>> The offset is needed regardless of whether compression is used. With
> >>>>>>>> CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
> >>>>>>>> 0x80000000, the first valid PDX is 0x80000.
> >>>>>>>
> >>>>>>> OK, so you are doing some (kind of) address space compression (removing
> >>>>>>> the leading empty range to the first RAM region) even when PDX is
> >>>>>>> disabled.
> >>>>>>>
> >>>>>>>> Without frametable_base_pdx
> >>>>>>>> the frame table would have to be indexed from 0, wasting
> >>>>>>>> 0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.
> >>>>>>>
> >>>>>>> But you don't really "waste" memory, just address space?  Oh, maybe
> >>>>>>> not on ARM as it doesn't use pdx_group_valid?  And so you
> >>>>>>> unconditionally populate the frametable from PDX 0 to max PDX.
> >>>>>> With pdx_group_valid (which this series adds) we wouldn't waste
> >>>>>> physical memory for the leading gap. But we'd still waste virtual address
> >>>>>> space and the FRAMETABLE_NR check (max_pdx > FRAMETABLE_NR) becomes tighter
> >>>>>> because the full range from PDX 0 must fit. For example with RAM starting at 5TB
> >>>>>> the virtual offset before the first usable entry would be ~70GB — more than the
> >>>>>> entire 32GB FRAMETABLE_SIZE on ARM64.
> >>>>>
> >>>>> Yet still - this is exactly one of the situations offset compression means
> >>>>> to cover. I'm entirely with Roger as to it being undesirable to build a
> >>>>> special case variant of "offset compression" into "no compression".
> >>>> In this case, if you don't want to generalize the macros, how should we proceed
> >>>> on Arm if we still need the offset to cover the PDX_NONE variant that we also
> >>>> use? In v1 I just created a local override but Julien wanted to generalize the
> >>>> macros instead. The discussion about switching the default on Arm from mask to
> >>>> offset that is not even selectable on Arm needs to wait for the new release cycle.
> >>>
> >>> I'm not convinced of that. If you need offset by default, why not enable it by
> >>> default (right now, and potentially even as a backport if there's any bug that
> >>> is being fixed)?
> >> As said before, we also need offset when using just PDX grouping and no compression.
> > 
> > And as also said before, this really is poor man's offset compression then. That
> > may be tolerable if you insist that's best for Arm, yet then I'd suggest to limit
> > that offset to just the "no compression" case. It's redundant with offset
> > compression, and it may be (possible to make) redundant with mask compression.
> > If the latter can't be arranged for, an offset may want introducing there as well.
> > But it shouldn't exist independent of the compression scheme used.
> Having a single per-scheme mechanism rather than an extra independent offset is
> cleaner. But I don't think we can limit frametable_base_pdx to PDX_NONE today:
> 
>  - Mask compression doesn't fold a leading [0, first_ram_pdx) zero
>    prefix into anything. So the PDX of
>    the first RAM frame stays at first_ram_pdx, and without the offset
>    the frame table virtual extent is max_pdx * sizeof(page_info)
>    rather than (max_pdx - first_ram_pdx) * sizeof(page_info).
> 
>    For systems with a high RAM base (the 5TB example I gave earlier
>    needs ~70GB just to skip the leading hole, vs. 32GB FRAMETABLE_SIZE
>    on arm64) the (max_pdx > FRAMETABLE_NR) check then fails and we
>    panic before mapping anything. pdx_group_valid (which patch 2/2
>    adds) avoids backing those leading groups with physical memory, but
>    it doesn't shrink the virtual extent — only the offset does.
> 
>  - With offset compression you're right that the leading hole could be
>    absorbed into the lookup table, making the extra offset redundant.
>    But Arm doesn't currently select offset compression, it's non-selectable,
> untested and switching
>    the default is a separate (and bigger) discussion that I don't think
>    should block this fix given the state of the release.
> 
> So as it stands, the offset is needed on Arm for both PDX_NONE and
> PDX_MASK_COMPRESSION. Folding it into the mask scheme (and dropping it
> for offset compression) is a reasonable cleanup, but it's a refactor
> of the compression layer itself, not something I'd like to mix into
> this series.

Right, then it's likely best to avoid generalizing frametable_base_pdx
and instead focus on integrating it with the PDX mask compression
algorithm at a possibly later time (after release)?

Thanks, Roger.

