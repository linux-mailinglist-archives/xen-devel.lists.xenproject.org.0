Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL0LI/xMqGmvsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51A2026C0
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245601.1544959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnyC-0002Hv-Jm; Wed, 04 Mar 2026 15:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245601.1544959; Wed, 04 Mar 2026 15:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnyC-0002Eo-Fz; Wed, 04 Mar 2026 15:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1245601;
 Wed, 04 Mar 2026 15:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY7Q=BE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxnyB-0002Ei-5D
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:17:03 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 317854a6-17dd-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 16:17:02 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB5984.namprd03.prod.outlook.com (2603:10b6:5:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 15:16:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 15:16:56 +0000
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
X-Inumbo-ID: 317854a6-17dd-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyL6cD1gVsx1x77O4iM6efS1qcqQcLg9FHTBEt3lnuaY4ii1+SU/LzOm/37ifSim7fJaHxzYQMqululll9xn8Yb08D5W2u2Ila4rB1/sZfp5JQtmYsqN57J0yhReO6Xqf0+eEstknp0TBuKx1KYri4YxEYKcJPBtJV/SE5eX3Sfqg5Es+iqjzEB+s5GU/1sMEmySspyq38WGdpp8dq1hSWtIbcLfGkkhZ4mv8Io2q9Pbtgmr9m93GoS0//ntcGCCfSvWUV2heVfAB6xKKjh892IvLGBcJWP0eJBNKJ1BdHZ0JubX9/l1xddv05JTXJcScT4bBxlMDZ5MY2NXTrKerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zWOvi79uAiRZPeyvtUEvGOvoBJzCu4sYVQ/d/Gt9Ms=;
 b=GW7pE1GLaYPBeEaKY1ft2SZqoOh/RAr/eHvAQVsoacPat5rhBQwv+V0BGIOFOAWtt38P1FBwEdP6J23V+iuZrUu36iVRFINpRl5w8kP/msWRm0P1JkVzyWad3w7zbPuixC7edffnSdTJKli6/c4ePfllhe/dlCPTPr2131zE0Hu5Xs1FoCCf66JF0qgEPMzp8UljlRgwiA4pdoKrt1TXoPhSMWLhb2vA17jlMqXsdefE+oTunPHwZ0dDaOeL2AlHm0+Jt+EWX9LbREj+1WmnvDeQJ1Qf6kxCy49uLEEiXjLnqr8g530iVEWu4idGNuFKvrcDDPfGU2QfkYan2Jrmbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zWOvi79uAiRZPeyvtUEvGOvoBJzCu4sYVQ/d/Gt9Ms=;
 b=p5ZeOkTHfh5Eb3JRtVm/klTBrhzRVgXKf0n8qp+UJGm4ncn21qD9R3ICjTrqOJjouXu6hY/FLZjOM2dfZ54l3x/kw5K6PG5mJRboLldg6OqLvEMyqBrUA1HgRike06nzZkY+Lg13T9iWbJPn3kus0W54eS5ru1upEOXRu7QYZG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Mar 2026 16:16:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 4/6] vpci: add SR-IOV support for PVH Dom0
Message-ID: <aahM5QBet0Ehxxjm@macbook.local>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
 <c5cd0e9cd75cacee2127c45635c999bd296853a7.1753450965.git.mykyta_poturai@epam.com>
 <aIdgJPTf17M0g-8m@macbook.local>
 <8da9f137-a897-4438-9524-85836e0170a1@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8da9f137-a897-4438-9524-85836e0170a1@epam.com>
X-ClientProxiedBy: MR1P264CA0172.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d98dbe-6d64-421c-2959-08de7a011314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	MiMhN0wxm3dEgsHMqp6hsMr0iuHx65QwoCVsJ2A+emSYPbQIjLYjHoOXEA/SYJnW1xavbAF83Aym/ADr12lHKK468cY+NIDlHRrt612GYWKae2Mw7mcIarc3awbqSh61k+qIwerj9ggma9VDlS7QHV6AQwevN5/5HZDntvGYJG/Zdk88TIdPMUNVYj7U9wVVCKaH8GLo5ya73kg3ro4xgD7xLMrg28LezgU7z7RqAw0lz1X3LJ3LAdpdE+EA6+lAUQKdsSAikO84XeCvcQLK3t/mN2Bk/FCsGsnnfTLp1XhxRkz3sGzEj5HWC6JaNInKmAPzUtnhWMWoPo6+0gqRx8f0RAiuRg5PJ8yq3cljKx6aicq8JyA8QLHtinnDQ/HUEVWBv0MpzQtjrgxDN3OD6jeZQzOrXX6KgoMiHGgqX3LRtflqfNKa9nzOjYVnqnV3khnVN04CoYmpffZrupGIf6zlz3JzPl1HwHSXMWFK3kYqE8/TTwby7y72hPHRcDfXLKubY+ke3MIuABt+3dT764nv4jsy90s35z8bpHTLzxKQyZiSHn2baXpu3fkCV2RMCbJfAhoWw89Bo6SoeqgyxBV7rPPYSbm1WFieewK2oJoYddF/hLqss7mEQ52y4wfJYMNhPu0nZ8HQAAslN8PW8lE7IDsjdkFE5TezLsZ39qMJ1uCOO8OZxZNxN/x1ZGbs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBQenhtekpvQUkyWTRFbmFzL0lYbjRyZ3QxZnNKSkVUSWNLUVExL2FpcU1R?=
 =?utf-8?B?dkpsSlBzMUNIZGN1QlpVSXgwMzFQS2dQa0RyU09rTHFzQnpnb29zdEptVXlY?=
 =?utf-8?B?NS82b3VKa0s2dkYyUXB2QytPVDMraUljekg1MnlkakFJWWJRdUVsVXd3enBR?=
 =?utf-8?B?NUcvZGFYTW9HdHBMTkF3UDNrbnFScmM2aUVmNHQrYkxnR2pqQzNNc3JJVWZ0?=
 =?utf-8?B?RjYzb2RRVjBhN2hXL3o4UTZ3bkpDWDNHRldzU0xGd2MvYWFSQzZBUjJVWUQ4?=
 =?utf-8?B?amZDYktxeUNkTFlncysxRnVRNmJhSWNLaW1lcVBXb3gzMUp5SitkQVlvSGQ2?=
 =?utf-8?B?R2ZUYkZ1eWlVUzg3d0lnQ2lQdHo3SmY4UFBxRDhHVnFibWhGb3g4OGFvMWFv?=
 =?utf-8?B?N3JJTTVxbmE2dkNQeUFjeUxYdUhuMW5HcHhSaG5DOG91b3kyL3piYWxNV1dy?=
 =?utf-8?B?TDNoVWsxMXNodHdmVkIxWTlIVUdTbzVXaWkxOWxGWnRoVEJJMTNQTjRZd3ps?=
 =?utf-8?B?VWorRENZRE85SEp5cG5uU0lkcnAwcURBTXl3VlVNZjBxc1RBeWhGMlAwcTlr?=
 =?utf-8?B?YzZEWlgrb0k2SEZibk1Ga240M1VGK0tScUYvT1BCS0hUK2ZQOHY5RkdnRkUv?=
 =?utf-8?B?VThEcWw5NlZBakhKM3dLMjZuY1hlNkREdjVDV2YrSHpsMTloL0luTnd3Qk5E?=
 =?utf-8?B?Z1JuYitNRE5kTkhueG1janJZNWRqYjk0cjRZU1ZJV1c5bldNV1U5Zyt5QXdK?=
 =?utf-8?B?dUliY1EvWUpjV1pXbkV4c1d2RzVUTlZQMXpnYmZtTjNwaytIV3l2azQ1bXh5?=
 =?utf-8?B?NVNkVXFuRXVFK09DUUd5eUlMbGxkNkJZUVI0T3dGQ1g4ODgxcTkxQVhlNWs3?=
 =?utf-8?B?MzMybWdPRDhlRGExcnA5Uk40ZnFYUk9Bc0lSREI1SWpjdk4wOXp1TitUWDdo?=
 =?utf-8?B?aFhiWmVLSlVtNTJTblZmVE5BczZQQ2g3MVB5RHpiTDBVRndVdU1pMWxwem5l?=
 =?utf-8?B?akNNTGJrak5zalVHaUlpa2tBZG5XellkZXRHc2xGYlM0OFh4SDNSMlZWdEVi?=
 =?utf-8?B?cWZRRWhBcHpvdnNDcjV0QTR1Y2dWc2xOT2JXR1FKaUVySG9ERDJSWjNlRFVS?=
 =?utf-8?B?Y2lqWGQzRXRjVEt3SDZ4ZlVLeVZ2Vm1Lait6YlgwTlRSOFMzdE03TGgrSFJK?=
 =?utf-8?B?ellvOVBqakUva1VxcGZGd3N3ZHRuNXRkeElSdVpjd3cyUFU1Mkk5bFFoSlNB?=
 =?utf-8?B?NVZXRWVlemw1SmpFcWU4NU9tTndvbzJIQk1vZnFra0ZneCtEZU01am5KblRl?=
 =?utf-8?B?Vi9ZdGk5eEloUXFhZkdrSTNScS9razRsSkxWRGc4VWxjM09vN2NUbUUwWG5B?=
 =?utf-8?B?ZERLdXl4U0dMU0xaZXNUY0M5WlcwYjFKbVlQek1rNERvQUlWWnMyKzV0SXBQ?=
 =?utf-8?B?R2JCV2ZHNndLdUNCVWdwY3FZcVVEZDR0VVpWUTJkOWYzYkxyNGJzdDdSSVdZ?=
 =?utf-8?B?enVvK3VNa3hyWjhNdEswcUxFNnhvOTdpQTEwVUhpZUhuY0JTMW1TYTFDTmZl?=
 =?utf-8?B?VzJKY3Y0aVRQSXVINWc5SThmMDdvWVZLaThVQVlyeDZsa3Z2M2xYRVpiMmJs?=
 =?utf-8?B?UFppNHQyRTNhWktoaU12ZDBaMkJYNzVHWGxMTW5EQmZHZ2tnblFqZ3ZDc2Rx?=
 =?utf-8?B?Z3YxZExqSWRCb1FhMUlweHlFRG5nQVBlY2FYcTYxVjNHVXVUTUpWMFdTc1JH?=
 =?utf-8?B?VjVTczlkcysxMXBLM1NmeHdUSnQxbXl5MHJxQWFFV1VYdlZqMm0zVk9QYmJz?=
 =?utf-8?B?T3hVNlRhK1AzZ0FWRmxXTnpUV2xWejl6UW00M3Rtb0c4cXVjZ2E0R0pORmNy?=
 =?utf-8?B?TFFSMWUxOWFZLzdoOGFDeHpQL3dvaTBnZUVzWGRYbVFURmdZN2VlYmVma0pk?=
 =?utf-8?B?T05pWGI3M014czd4cTJReWJmbUFOa3FsOWRhUDlzQ2RGbDR6YXdUODE4Q2hP?=
 =?utf-8?B?MUNucURGK0E2NmxYR2N5a3RWY0N2N0JHMVV3QkVmcmlXQVhrTDdOZWlKV0FK?=
 =?utf-8?B?c0RUQ2Y0RFArbWFIa0U3VGlDMVBTcHlUQ0hPRjdLZFp4T0dldytWZ2ZVOFZh?=
 =?utf-8?B?SmNsdlJYM1ZkaEMyMEtaSlI5SGJSMVpON0tuNzZrQi9aQnRvdG4rejhWcVpD?=
 =?utf-8?B?THlYUXFyNUpCb0dpTHpvY3BjZmRUU2lVNnUvOHhYL01jdnc4MkpWcmszODlS?=
 =?utf-8?B?WVNEWGUyV3lUY3hhTjhqR29oenRUdldGTEJPUkFuWXdzeW5wNDVxTFlKZFE1?=
 =?utf-8?B?bytWMExjS0pMTVF0aHg5YUx2Tms3WkgzeGQzTXI4dm9ET2EyOVgxUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d98dbe-6d64-421c-2959-08de7a011314
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:16:56.8664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbGTQJUF4LqetCMCp1BuM9x+OHJZTWv8avzxBI56UDPEUWarvZjjxm/JJnKb7BSlSEo/5BKV/KIieKv5GwBUgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5984
X-Rspamd-Queue-Id: EE51A2026C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,amd.com,gmail.com,xenproject.org,citrix.com,vates.tech,suse.com,xen.org,kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,support.md:url,keepachangelog.com:url,changelog.md:url,macbook.local:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:43:17AM +0000, Mykyta Poturai wrote:
> On 7/28/25 14:33, Roger Pau Monné wrote:
> > On Fri, Jul 25, 2025 at 02:24:33PM +0000, Mykyta Poturai wrote:
> >> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>
> >> This code is expected to only be used by privileged domains,
> >> unprivileged domains should not get access to the SR-IOV capability.
> >>
> >> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
> >> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
> >> for possible changes in the system page size register.
> >>
> >> Relies on dom0 to enable SR-IOV and PHYSDEVOP to inform Xen about
> >> addition/removal of VFs.
> > 
> > Why I'm not opposed to allowing registration of devices using
> > PHYSDEVOP, can't Xen detect the addition of the VFs and add them
> > itself?
> > 
> > When I worked on this long time ago, the version of the series that I
> > posted had registration of the VFs done by Xen also:
> > 
> > https://lore.kernel.org/xen-devel/20180717094830.54806-12-roger.pau@citrix.com/
> > 
> >>
> >> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> >> ---
> >>   CHANGELOG.md              |   3 +-
> >>   SUPPORT.md                |   2 -
> >>   xen/drivers/vpci/Makefile |   2 +-
> >>   xen/drivers/vpci/header.c |   3 +
> >>   xen/drivers/vpci/sriov.c  | 235 ++++++++++++++++++++++++++++++++++++++
> >>   xen/drivers/vpci/vpci.c   |   1 +
> >>   xen/include/xen/vpci.h    |   7 +-
> >>   7 files changed, 247 insertions(+), 6 deletions(-)
> >>   create mode 100644 xen/drivers/vpci/sriov.c
> >>
> >> diff --git a/CHANGELOG.md b/CHANGELOG.md
> >> index 5f31ca08fe..7b0e8beb76 100644
> >> --- a/CHANGELOG.md
> >> +++ b/CHANGELOG.md
> >> @@ -23,8 +23,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/
> >>    - On x86:
> >>      - Option to attempt to fixup p2m page-faults on PVH dom0.
> >>      - Resizable BARs is supported for PVH dom0.
> >> -   - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
> >> -     capability usage is not yet supported on PVH dom0).
> >> +   - Support PCI passthrough for HVM domUs when dom0 is PVH.
> > 
> > Don't you need to move this out of the x86 specific section?
> > 
> > According to the cover letter you are testing on an ARM board, so this
> > probably needs to be put in a non-arch part of CHANGELOG?
> > 
> >>      - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
> >>   
> >>    - On Arm:
> >> diff --git a/SUPPORT.md b/SUPPORT.md
> >> index 6a82a92189..830b598714 100644
> >> --- a/SUPPORT.md
> >> +++ b/SUPPORT.md
> >> @@ -170,8 +170,6 @@ unexpected behavior or issues on some hardware.
> >>   
> >>   At least the following features are missing on a PVH dom0:
> >>   
> >> -  * PCI SR-IOV.
> >> -
> >>     * Native NMI forwarding (nmi=dom0 command line option).
> >>   
> >>     * MCE handling.
> >> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> >> index a7c8a30a89..fe1e57b64d 100644
> >> --- a/xen/drivers/vpci/Makefile
> >> +++ b/xen/drivers/vpci/Makefile
> >> @@ -1,2 +1,2 @@
> >> -obj-y += vpci.o header.o rebar.o
> >> +obj-y += vpci.o header.o rebar.o sriov.o
> >>   obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> >> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >> index f947f652cd..0a840c6dcc 100644
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -839,6 +839,9 @@ static int cf_check init_header(struct pci_dev *pdev)
> >>   
> >>       ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> >>   
> >> +    if ( pdev->info.is_virtfn )
> >> +        return 0;
> >> +
> >>       switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
> >>       {
> >>       case PCI_HEADER_TYPE_NORMAL:
> >> diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
> >> new file mode 100644
> >> index 0000000000..640430e3e9
> >> --- /dev/null
> >> +++ b/xen/drivers/vpci/sriov.c
> >> @@ -0,0 +1,235 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Handlers for accesses to the SR-IOV capability structure.
> >> + *
> >> + * Copyright (C) 2018 Citrix Systems R&D
> > 
> > If there's a Citrix copyright header here, shouldn't there be a
> > matching Signed-off-by from someone at Citrix (I think that's likely
> > me)?
> > 
> > Otherwise if there's no content authored by a Citrix employee the
> > copyright notice must be removed.  We need to be careful with
> > copyright and attribution.
> > 
> > And in any case the date should be updated.
> > 
> 
> Can I add your SOB or is it better to remove the copyright? Looking at 
> the patches you provided, I think this ones were definitely based on 
> them, but there are also a lot of changes since then.

If it's based on the patches that I sent many years ago (2018),
then yes, you likely need to add my SoB.  Look like that way from the
copyright notice.

Thanks, Roger.

