Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOwQN8ww62lfJwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 10:58:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFFE45BCB6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 10:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293316.1571112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCMp-0002jo-Uo; Fri, 24 Apr 2026 08:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293316.1571112; Fri, 24 Apr 2026 08:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGCMp-0002i3-Rb; Fri, 24 Apr 2026 08:58:31 +0000
Received: by outflank-mailman (input) for mailman id 1293316;
 Fri, 24 Apr 2026 08:58:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wGCMo-0002hx-Ga
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 08:58:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGCMn-00E6Ip-TS
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 10:58:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb30b4-bab6-0a2a0a5309dd-0a2a4501e8b2-6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 10:58:29 +0200
Received: from [52.101.62.21]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69eb30b4-c1f2-0a2a45010019-34653e1542b9-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 10:58:29 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5280.namprd03.prod.outlook.com (2603:10b6:208:19e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 08:58:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 08:58:25 +0000
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
 b=mbeiUwyO1E4oQZDP6OqEQ/7ja59QuHZhBdziKRemxq8UCdxJ8FIz6vQwSx2yWZbqMzH7vDLD5ZhTcHA0VKJGQDW4uYOKjQwHgUcTRfW1r+r/9jul/Uy5QD3QSraF3uyzTvNzD4drodLXqEJyDzB7mP7YeZ0x8oUkv3yCZdZOjl11HI2MZ7psU9vnnuD4feZaZgEtkaV2tKNO4Xkl1Deht2nzirLZulMXQlBEcvbpIgxoD5A75cry/01k1BlsKCl3PWu+Qu7F30X7PwdVEzan2lDhu96w56/tz4o0MtRL0FF1t+fK/jB4zZxQ4Z1GThhFMOoXNoOXxuM3YID8i/aBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q30Qn+m5GPX6SjHc9+OHy2BFyepqWpqFl8i0NVVPmiM=;
 b=JxSbvqO43Fj2+gVUMRDgq9si4X0njwLnuUCx0xJeY9aKPLvkEUM/yugX5FSWtWewW4p4/KEhE3XiZoRB5T4Zi1ll6nrFYiCQ7hmCN3trVHmRDuU/bc8K8jYZUlSkfjrqQwG1wGZa5Q6hjTKvUUxGk+eMLj11FtJEvLj/XXSALPlMs2iihD6o577oOgvEgs44muIHmvnGG71cMH7t034cAocMUxIyMFWG11Q647wsQiTjRYs/ubMhOz3Srb7QQzuIR3u6gKP9zD6vWFrGWLOkA3jZWBRxu+O97EfPRAUIOM91qIy+0jnsbsD86QmdJGrouVcYACmA2itqDGmwa2fdfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q30Qn+m5GPX6SjHc9+OHy2BFyepqWpqFl8i0NVVPmiM=;
 b=ore26eyFukOfXoGtcgFQ7igxqEGW+sDE/jZR2x1cGOqNki8HVRmP3ayOeV/G0yIS9VgHYTnAs9nlk/Ra4H9PBDnB1kMqXJXQ95eN3i1OthNtQ3RTIbrfBfF3srY8nLEmuYcpxIYUDtLm56YQ/XFD5lFjgjSg/uGCOryJV97D/ds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Apr 2026 10:58:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [RFC PATCH 1/2] pci: Allow platforms to modify BAR adresses
Message-ID: <aeswrXLdbdK1wPMf@macbook.local>
References: <cover.1776756291.git.mykyta_poturai@epam.com>
 <a0f623792497ab92cfb64c50bd17d28138e10b99.1776756291.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a0f623792497ab92cfb64c50bd17d28138e10b99.1776756291.git.mykyta_poturai@epam.com>
X-ClientProxiedBy: MR1P264CA0099.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 3525ed14-65e5-4c7b-9c61-08dea1dfa501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GpP6JrR01MUFE/jZ0pIMYyBVbtwDv3tkj111vgmd1v6QxP4fpVKlDiBXoqkqRbI54whoHpcBMhDO3XHaIoN/IHEEzCCq/yj7tDYXCucYcGKXupEs3AOT7rg93hYhYJM9sCr/rweEA5ECrJ0JVnyCMwhACA0ZT8Yuvb8xt/b4NLYxN9lCJnrXOKFsxBsbBBU5VGXyI0nbxreoNtvkOi8czE3xTyRAjczqzf55t/sxSacZ4GlLS08U6SjoI/6s4TTxzXN756lKg/cHIUW9PzaLEozo9o5MTsa454KV3gk9feXgIluewXu+D0+7JFehquia1jczYKRjTXIMz3ua3KeUAU+s7zqCVJzyaJbY5ptPpA+jMMA/jDIN6sNi/D5s8zAoTUCwtw6qDEoTALtnA+pwk90bAF7tG/Y2ZaO2O1/zSFbTtyl4oS2Pab0c9HzFyaC2DGLLnkvBNDmDLEnruBtnyWt2MEAYrPYZyZOuL1oI0IF0trm4rp2rVVME/NZE9S0LDhp9fDyJEbPusX4FIEZrvb3r98qoIbaLiN3tiHkGa/BXsh+V/+UFER7eN446dJO6Wdh5WV2Xwp8a6xZFjgdjRSMRgirKp5hbEsj72/B3WekhAaKskujSz4+WxYUiYcGkkO8J86Z8yhuxDAxrGB0+F7W+AxMG6fwfm3RxPBkDInle9IQKfxVJkm8sArEIfmkbOtaqsDWzIiG6njkCXlyxvV9IRqORXy5XmYMpfIZPjgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yi93MWE2NmtRemEyWEU2UWtnVzdLU1J4RWxCTms5VXY0Lzhmc3NTeWc4TCs4?=
 =?utf-8?B?L1JCQjNTTUFDZXIrVitSRmlOTmY3WmVQZ0ZrV3dyaXBLZzJNaW05bjZVN1lz?=
 =?utf-8?B?S0tuTGJJUnhUbWdmTFRzNG9DcldaaC9Rbm5ad1RlUmhTZVkrTUdGRktzSURx?=
 =?utf-8?B?N1M1USttVG41d2taaDBLSzkrSktpS212eGhsZ1hTOVR3emh0Q004bDVEcmw3?=
 =?utf-8?B?WDIxZUlmK3pXa3UxUjl0LzhqMFhMSS9PRS94YzVpZHFONVJVWTFaWFR4TlRO?=
 =?utf-8?B?dTVrVjFmUlhMbVFuVmN2OE5qT1l3WldGUi9seHU4Zk5XK3BpSmtaQzIvS05j?=
 =?utf-8?B?NFhBeDhxa1VzbUdBcTkxWFFQL0c2cThXclRwRGpvcWhJWTZlbGp6K2xiaG8w?=
 =?utf-8?B?Slk1ZXl1K2tmQUdINyt4Qk9DMzErMWt6NWxkS1dQbGtqU3JwWGI3Q3hZdFI2?=
 =?utf-8?B?Z2pCYzZvbnZLQVlrcWFpb2tJbTBSMmxwY2NWWmRYWkNsb2xKVVdkUk4yalR2?=
 =?utf-8?B?WDIvV2piVGVDM29sdG1zZFhLcjRVa0V0WFZVVjNmQll3ZXM3ZmVTK2RZUGVT?=
 =?utf-8?B?WXpTcEFOT1NsQW9YUmcvQ0t4Nnp5MmtjK3k4QTBRK0toU2hVR0svSHVSZnVj?=
 =?utf-8?B?ZlZKdjB4bDRkejAzZlhvRklQS2gvRlc4d2pyK3JZV0ZZTlF4R3hkbEVySitV?=
 =?utf-8?B?Q2tNaGpqTkRpaVBqdm53Vnd0NjRzeHlTZnRDOHpuUktCOCt1Y0lYanZldUp5?=
 =?utf-8?B?dGw5NGpYZlBUZFhVVWx1RUpkdHV3TlU5UmZQQTVnSHlYbkYvb2tCSUxEeVR0?=
 =?utf-8?B?UDh2T2lPTDJERGpQMlJQYjVpcVNabVVJdERZR0pBeFFTMm04dG5Cdm1Qakcz?=
 =?utf-8?B?ZkF3bkhFK1l5ZXJFV3pMY3ZrQkpQNjZFcHlITU54dHV6MTE1L2NxK1lqL3dm?=
 =?utf-8?B?OWVzNEthTWU0RmNXQkJaL3FjSnVUaW1VZHlwb05rMnFqUkhCMGo2S2xjZEMr?=
 =?utf-8?B?YVFEa0hOdXNCVGN5cVhDRGREVVR6S3NkNkJlemRsRmdiRlZwS3FvS1ZPL1B1?=
 =?utf-8?B?QzBJUDNxclJIcDF3UEhXZXNvYk9GM1d6K1B4SG1OUG04SVBBNjNaUzJ6aW03?=
 =?utf-8?B?cnNJZDBsNjZXWFI0NFR1S0UzSXc5cksvTHJKclUycDA4Wi9VRUo4RWxqZ0Fa?=
 =?utf-8?B?QTYzdXQ0MGh4ZS9BUGZPaVo2Q0JpeDdkQ1NLWmpGU0lqdGVqOGNNaS8yUnFY?=
 =?utf-8?B?aEZKSUd1My9PNXJnTk1VcmQxSkpWU0c0WVRrOEFNMGExZ0hKZXVXSHdwU2d1?=
 =?utf-8?B?Tkd6YnE4Vng1YUwyM1RPZ0tPMTRGQ1VsL1Z5T3hUOEtxZDl4Yk9UZWJ3TWVC?=
 =?utf-8?B?SnJUVVh5SzltNXcvbDZ0WUdRMGo0aUJOVEZrTnFVcnYxV2pORmhHOTl2emtu?=
 =?utf-8?B?Vzh6Mm15MzVNZ2w3Z2xTVXpiUmtOeWkrcDBFSFpKMWh4VUw2aW9tdnRUb1h6?=
 =?utf-8?B?L3hJekJSNFNzWGdXTEloMnhxS3pGVlJnWTU1SzZMU2xMNXVCR2N5SEJyRlVn?=
 =?utf-8?B?QlhvQjJBV3RXdmdvMmM2M1hjSzRGbHcyTjBKdzhHK0VsQ1NwcTRxN3pLSGF2?=
 =?utf-8?B?Y1dacTVuQWNUM0J1VU9mUVJ2TUxyVnRpQTlkQmViTFhlT0h5WDV6dkJwVXZJ?=
 =?utf-8?B?dnBDa294N2Urcnl5N3VOQm9Ec3cyQVIxMHNEMXpJQmRKaHRyLzU4MnJUYjE0?=
 =?utf-8?B?VlVwYVkrcEdPMHNuR1RuUU1QdTVLcllWZGJ0NWR1QUlkWkV0UTFERXA5aTNR?=
 =?utf-8?B?SWtjcjBuU2RGQ1FqNEsvck9Wamo5bnJydjVkYTVpeFJMNTQreVpHRG9GR3k5?=
 =?utf-8?B?Q0V5dkx6NG54RmwvWnA0NEkwSkRya3FQeEJWdWZiL0NrYjY5akN1U0ZyYTBt?=
 =?utf-8?B?THJ4S2JDWWJDOXVMaGswMWY3eXJxZC9YVmt1UERuUXZrNFgvaXhnVzVBcGRz?=
 =?utf-8?B?SExaMlArRmc1YTBVR3NOajYyUCtiVDFJcG03VUdwRlFQMU9EWUdsMkpVTUti?=
 =?utf-8?B?Y050d1lTR2RUMEtrejBkYjFSc1JkVWFZaWRKUmxpZFVxOGlabFo0aityTTBK?=
 =?utf-8?B?SS9rUXEwcjFjSFBnckgwYTR1QjRoaEd4YWROZGtRUjdDZWF4MFFnWVVOcWZ1?=
 =?utf-8?B?K0hQWTg3dDdMc3Vjc0xzUTJQWktaYVh5cTNWaW5FeEhPVXdRWU45aCtGLyt6?=
 =?utf-8?B?ZmlObXE2amhzYXdTUUxiT0ZGUisrNnJsMVhRUGd5ZTFRSitIRzJ0Z3E0YzVa?=
 =?utf-8?B?QjFQVzFMVnJBdHpMSm5zWVFjeFFLZ2wwQ2kwc014RmUyNWFUU2plUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3525ed14-65e5-4c7b-9c61-08dea1dfa501
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 08:58:25.3186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPlc/IYa//Vi+1VBzbtmDIMISdw9NsHNnwwRvH+urV9KiuBJVTIhEEZCwUeMH0NV5KAaKXuSJHhtVLaBOqUByA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5280
X-purgate-ID: tlsNG-d62444/1777021109-BD06EFF4-0B236057/0/0
X-purgate-type: clean
X-purgate-size: 4464
X-Rspamd-Queue-Id: 4BFFE45BCB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,macbook.local:mid,citrix.com:dkim,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, Apr 21, 2026 at 07:57:14AM +0000, Mykyta Poturai wrote:
> This patch is a preparatory work for adding Region ID support on Renesas
> R-Car series boards. Add new host bridge op "fixup_bar" that allows
> platforms to modify BAR addresses before they are mapped.
> 
> Because x86 don't have support for PCI Host Bridge drivers, add another
> level of indirection in form of platform_pci_fixup_bar() function, that
> will call host bridge op on ARM and do nothing on x86.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/include/asm/pci.h  |  3 +++
>  xen/arch/arm/include/asm/vpci.h |  9 +++++++++
>  xen/arch/arm/vpci.c             | 12 ++++++++++++
>  xen/arch/x86/include/asm/vpci.h |  6 ++++++
>  xen/drivers/vpci/header.c       |  2 ++
>  5 files changed, 32 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 7c3211823f..398a4eb746 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -80,6 +80,9 @@ struct pci_ops {
>      void (*init_bus_range)(struct dt_device_node *dev,
>                             struct pci_host_bridge *bridge,
>                             struct pci_config_window *cfg);
> +    void (*fixup_bar)(struct pci_host_bridge *bridge,
> +                      unsigned int bar_num,
> +                      paddr_t *addr);
>  };
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/vpci.h b/xen/arch/arm/include/asm/vpci.h
> index 0cc6f5a105..f5c817a51c 100644
> --- a/xen/arch/arm/include/asm/vpci.h
> +++ b/xen/arch/arm/include/asm/vpci.h
> @@ -16,6 +16,10 @@ struct vpci_arch_msix_entry {
>  
>  int domain_vpci_init(struct domain *d);
>  unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d);
> +
> +void platform_pci_fixup_bar(const struct pci_dev *pdev, unsigned int bar_num,
> +                            paddr_t *addr);
> +
>  #else
>  static inline int domain_vpci_init(struct domain *d)
>  {
> @@ -26,6 +30,11 @@ static inline unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>  {
>      return 0;
>  }
> +
> +static inline void platform_pci_fixup_bar(const struct pci_dev *pdev,
> +                                          unsigned int bar_num,
> +                                          paddr_t *addr)
> +{}
>  #endif /* CONFIG_HAS_VPCI */
>  
>  #endif /* ARM_VPCI_H */
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index d41aa383a8..ec6efec22e 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -189,6 +189,18 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>      return 1;
>  }
>  
> +void platform_pci_fixup_bar(const struct pci_dev *pdev,
> +                                          unsigned int bar_num,
> +                                          paddr_t *addr)
> +{
> +    struct pci_host_bridge *bridge = pci_find_host_bridge(pdev->sbdf.seg, pdev->sbdf.bus);
> +
> +    if ( bridge->ops->fixup_bar )
> +    {
> +        bridge->ops->fixup_bar(bridge, bar_num, addr);
> +    }
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/include/asm/vpci.h b/xen/arch/x86/include/asm/vpci.h
> index c501ff1709..a05b70abbf 100644
> --- a/xen/arch/x86/include/asm/vpci.h
> +++ b/xen/arch/x86/include/asm/vpci.h
> @@ -16,6 +16,12 @@ struct vpci_arch_msix_entry {
>      int pirq;
>  };
>  
> +/* X86 does not require PCI BAR modifications */
> +static inline void platform_pci_fixup_bar(const struct pci_dev *pdev,
> +                                          unsigned int bar_num,
> +                                          paddr_t *addr)
> +{}
> +
>  #endif /* X86_VPCI_H */
>  
>  /*
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index a760d8c32f..d89e43354c 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -882,6 +882,8 @@ int vpci_init_header(struct pci_dev *pdev)
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> +        platform_pci_fixup_bar(pdev, i, &bars[i].addr);

You do this for vpci_init_header(), but don't you also need to do it
for bar_write(), in case dom0 decides to relocate the BAR?

Also - I would assume that both the firmware and dom0 are aware of
this limitation, and hence wonder why you need this fixup in Xen?

Thanks, Roger.

