Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA3GAt/2zGl9YQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 12:43:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519C0378B08
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 12:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270116.1558898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7t1z-0002Ah-8q; Wed, 01 Apr 2026 10:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270116.1558898; Wed, 01 Apr 2026 10:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7t1z-00028H-50; Wed, 01 Apr 2026 10:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1270116;
 Wed, 01 Apr 2026 10:42:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w7t1x-000287-OI
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 10:42:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7t1x-0054rc-44
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 12:42:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ccf697-5cb7-0a2a0a5109dd-0a2a450883fe-30
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 12:42:37 +0200
Received: from [52.101.84.128]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ccf69c-fab6-0a2a45080019-346554803d0c-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 12:42:37 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by PAVPR03MB9139.eurprd03.prod.outlook.com (2603:10a6:102:326::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 10:42:34 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 10:42:34 +0000
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
 b=UxoSgd6yIWi3ivcRGT7578zYuyGVd3v+ORwigAe2W/+7FSY0/A/kgNn5Wr64YuKvuTVehRDd1cNd5kHeGU1k5XFqINLWjkLLHp6ZfQFAT9XPRIl9AzCBayhB2GcHf53hkxMo9zPPHzU+IE/PX8P6q8St0hSbBRw+HLNOC/dcw18jtjMNBUaC7R4B9XANEQ+sMku4EXtgjADrngDLMbEnAxiU+DqJ9sr77kKZBXvyxa/zXnaniQgjcmMKFm+SkcCjNHp7ZClIpgg1SvgRyLx4BO2+kzoJbh09yn9CjOOJIpwB927hMIAlnY8BA3rF0wKw/1AbI69MdsnXLx5wknatUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVY3b3fWcKAQXVxPXu4SXEFjoVVDvCCE5N7bue1Qb1A=;
 b=uNfr2X/iX2J0Mcw1GdnthZ82FzDq++vrGB6KkXK8a9ROARs5DruuwjI7ewJFvt3arJZQ06iV8luci9m+CeOKpn7EBmvxs/SyyEyYsujsVvPKcobbVQeWrmzRaGkZsLdcBsH6htKqCi2koESR5T7hDVClunWZ8vn+SW0QKJNq6SzIK6y8XvlSuWhLZ1/dggLVTRfz9Tr8x+JMaRwF+HbdgfSBKoU0SSMXXRN3vCo85bXdTyyVNhr5SPK5uCXPZZJQyZBM/87/UEShwbxnHpdx2EWIT+IcCSyijA8R46J8h0Ani9Y8v3ukeNzH7Y1RSrS5iO/rsHqbqB0vLEIY0qlYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVY3b3fWcKAQXVxPXu4SXEFjoVVDvCCE5N7bue1Qb1A=;
 b=JwuerzPQm6StZXtNsRxNA/NLNC4Mhyv26p+xF1c6iyE9ur3c8oiIQGO12UejHVCLXJfwutUC1fUrTBY2dlAbnLMOFjiaqx86ycNnwnBwrukdJQmrQIRPtCQn3J3ZEqpoB3aGvlKZ6nbARxl0PDHmJgmwEe19uhKhNo+9ncvcR7iVWnEwoKORP4gs8JwArE0psvjSYpwUB4SSl7LKnsMunorQGc4k5+nLXQbqIpMHfmPGI7oAQjwhSUNFNvwN/xj6hnxZWkNwqzxJSi+p7E60M9awFhOvE4aipaf+VNhjxZV7lU8YmcuTWG65iprzVVFX5AUaldLWoh+C1RC0LDrajQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2e6e0203-da8b-4261-8817-f4590350f8c9@epam.com>
Date: Wed, 1 Apr 2026 13:42:33 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: rtds: prevent extratime priority_level
 wraparound
To: Jan Beulich <jbeulich@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>
 <5b1e5de7-b2b0-4dae-bbe6-03809637d239@suse.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <5b1e5de7-b2b0-4dae-bbe6-03809637d239@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0396.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::10) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|PAVPR03MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a786e5-97f3-4de0-81d5-08de8fdb626a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qWZVINSx0pAaO6XPj5UnJ0CTS/8n8an/MTBUxX1CsR1Pe/v9BXSr2THY334I9c8hPLhUMXWYZlk4AmqK/A5QinV0dMQ3yFQozlltfalEk1MLs2ZWgAo/pYav+tMTqTEanwAjfI3gyZCOrhrW0h2pdNeYtEdtLgz1uN1AFk4j/9V4USclR0NRncRBaMytRFE+KTYcjTDPAng7A/v+kDPmOB2NZSXKQtUIzPU3KkZp/2Lk6jQLrqN5YrvEJtZ8qO+0bH7kp58Y1wWapFVUqt14GdB5IhndFrn5I2Wwy9sDQB6DZ+Km2DS4kLj/3uOgIsT7n1HL4+7Q1kw+N4IDJ9r8zFfqTRGdTe7alQJpsm8OAQKMER+5VO7HV0lVHNPpUqmjm2i5j//wCuNcyEY5k6ZviEZOdUZ51Bkv1alFeq9qLE2Ie6+CFfjVZDnoKC9DHA79LEUVBJ/n2MCnPYQcmk4c2fIbVXuKMAe8utxFvBu8sgnK3Q801tA387vYZmkfTYhwYRj1F+jllVs+geUemto9W2MFv+sw1QaADrBrB7CG1dTV9D/G8H/VR5IGbnZm/GGCQQ3URXQnM65O1EJthvLo2/rB6Bo8Nwylf72hdX5XSSmDPE12/DH3DzEE0l3DSeAVJJg0cBI4AhGvcz+NpDT6O2jLpd7ia3SO4UIUTRF4B6koV2pMuUs92/du7aaDLP/l3nW72k4qEBgFgoqO4Rb5ihRTGiaBdqfs06OoPVQFkMY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkI0TzF5UndpTXYwLzRyZkNndFVqUm5sRWkxQXAvWXlOQ05ScExaYlcrVHdR?=
 =?utf-8?B?OStUbWpSalU4S1FKdVJvVkk2b0lpZmtOMTVBOWlMQUlENlA4VERudHovb1Jx?=
 =?utf-8?B?ZjQ5VDI0N0Z6dUpwbC9SR25YV3YwWElwMzhuM1I3em55UDJINGJLaEFzWmRK?=
 =?utf-8?B?RXV2OG1oaTFsVXdPemVJSG1sODg2SldGN3NzOG5IRVk2L0tkSElSd2tUR0V5?=
 =?utf-8?B?bjJvZ1JFSEl0czRUamk4RUZFZFZGRDNwMWtMOFRjdHVTYWp6VitZM0JWaTJn?=
 =?utf-8?B?cVBCV3BZTWFEcnZNckFjKzZYU1ZrZFpEQW0yUVlhclpLTkl6SkdzMEIyTnI0?=
 =?utf-8?B?M2RFblVuMWRQanAydXFBY3JWcFN5MkhndXZHUVh3alkvQmU0b2l1dEExdlFB?=
 =?utf-8?B?OGJ6L1N4cXpXTmNYMndIVWxKUW0vRG1SWDdvQWtuazBqbW5RemdBSDlWYnZJ?=
 =?utf-8?B?aVNMKzF6WTBQVGwxMkV5ZWFvdzQxRDdxdGZ3M2ZhNUtJZ1dKQ2lFSlZMUFZR?=
 =?utf-8?B?SThLeTB6aElXMkwvcjYrUmlKVXJVbDRYN21PaGlNc2ZPUFhHb01LWHozZ1JT?=
 =?utf-8?B?WHhUaUpZRFdObnFYaU1yUUV5dWJMSTYrWG01TUN0ZHg2eE9YWDI2REhuZytx?=
 =?utf-8?B?dndmb1YyN0FqK2MwMUdBekNsK3lYVXhmSm9vU012QlpXaG1OSVEzekx5UE9o?=
 =?utf-8?B?N2g0K3k2MWE3NUpndUFJa09ZK1hjSGVXWjUweXg0TW90Tkl3RmhXaXhXZTFs?=
 =?utf-8?B?bVZHNW45Y202ZFZGeDA0UTdQZitqbnZvZWpmSWE1TTk5MXhIaENqbGErVTFF?=
 =?utf-8?B?dUZWOFZQbC9qNnVNOXR6QTBDTkFiNTZmVW1lMW8xTldHSDJCWU5ROXdqbUI4?=
 =?utf-8?B?V1paNzE4Rk5XVDM3Tkl6VHAxLzlhanJIRmpRT0ZEMFRvWHdBUGVkb0hyNTJo?=
 =?utf-8?B?bTZqTzNzc21sZitUSXpNVmYyVy82aUZucjF5NFZOV09qRHNDUTJ5S0lkTWJ4?=
 =?utf-8?B?bi9VczBSME9rM3JNZnVXQSs2ZE1KWmJPTm9nSmZXNXZIZGVUdnZhRFhjMHc0?=
 =?utf-8?B?YjdpbHRvSDB6a0QrSWk0UDczc1dWOEw5V01KeE5Wc1BROEIxNDMzRStxYmtq?=
 =?utf-8?B?OVdIUW9hWWFKT2dtb2V6VTAxT29MNDUrWDE4dEVoa3BZa01aSkdFeHM0ajRX?=
 =?utf-8?B?QVNhcWpRTXVrcEtHWTdvZWcxbDl2b1g2WWdSbXFSaU41MlhTV3c0NEF5U09B?=
 =?utf-8?B?MFhUOFdIQUFQZnFURjNQRHZZUFJla3ZERU5JRXRHVFFjNU8wdEVuNzc5bEEw?=
 =?utf-8?B?N2RBQ2xwWFpnVEtlcGFsOERyR0wzdEJCQno4UEt2TkdiaDRZT1h0TE1OR0l3?=
 =?utf-8?B?czhTTmZpRW1hTnpsTkhSTjJCVUs3SzVqZjY3RE1lSUxVOXkvVzQrRDR4QnNv?=
 =?utf-8?B?LzFoNWFwekRaaXFmVklhRytnTVdGY2hSUUtxN0xGQWtLN2pFWkJIU2I3cVRs?=
 =?utf-8?B?WFF2NldianB5Z044ZmgxN1RQblQ1RkU0K09RYmFsM09pUWVRcDdhUUtHMW41?=
 =?utf-8?B?NjAwTUc1K0p0T0MwUUVJbDlJMkMzNWhONHVCZ0lKb3VBWStMbzRkWThWd3Nn?=
 =?utf-8?B?cGNoQnduSVNWKy9RRGFoaTlSSUJ3b0JOS0FXUWNIZnE2NlNQeDhzK3ZaVGwv?=
 =?utf-8?B?cC9tOTd6Rzl3QUlUTENQSDI0clJyQVlHRG1QN0ZodnRSYkdGUm40WHkrTUVE?=
 =?utf-8?B?OGt4aVl1TkpLVGlxbTN6L2RaZ3BQYzY0UStKUTVOc3F5MjRkZGkxVmtUVWVD?=
 =?utf-8?B?cVUwUE9FeU56TnVIb0VYUEhEdFo1T2hsRFArLzVmMmlHd25kd3FVR3dFZDRO?=
 =?utf-8?B?ME8vNlhIUnFhclVTTWRZeWhHaVNEdDFZdEpyZDg2V2FDRzhsNDAzY3AwbEpB?=
 =?utf-8?B?OTlQRmpzd3VSUVhmV0hDSSt3Rk95WWxZU1podXRnM05NUVBKQXpXNXpiWWFq?=
 =?utf-8?B?UWl2YVltZGNoejhzVDZyK2JrM0NxdFpsWWUwTEJKVlNhOFhwTUF6ZjMwNjJ3?=
 =?utf-8?B?cDVKc1lCK0FvczMxMkRxUUJ5d0E0WTM3aUt1eWtLaVJxUnN1bUQrN0ZjZ0U1?=
 =?utf-8?B?ODlvWEMrZFV1VUJZUXVvUnBXbnB4M3lFL2dHRTJpMGpkd3ZsckxoREl0TkdF?=
 =?utf-8?B?c0JIVzJMTzlFQTF5ZS9uek0xdnpiSlhBdlRsVlA5MHBnS3pzeEZ3QTduVzNu?=
 =?utf-8?B?bGtsbUhjYUdYL0FTSnk1UEp0UDhqR1phSlh4eW5rWlBmaDU2ZkRsRGQ0U1pF?=
 =?utf-8?B?UjhCaWluT3RLZ1RBMUJqbVBnclhzdXQ2Y3d3Ymx4ZW1YVXA2dmNwMUEwdDdS?=
 =?utf-8?Q?NTAttBfTuJAO/RzE=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a786e5-97f3-4de0-81d5-08de8fdb626a
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 10:42:34.6560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkclCdHCI8mVQvjan5cKa/pnua+7jv08rQ1fOrteM92EEF+3FshMIgtzH6NqIgA9sLhptZC2CwP3TqNIDAmZwORlwIBKCk4tvPkXgcCE3N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9139
X-purgate-ID: tlsNG-c1860d/1775040157-F6D4B497-71F19D2E/0/0
X-purgate-type: clean
X-purgate-size: 1109
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 519C0378B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jan,

I have an R-b from Juergen. Should I post another version with "Fixes:"

or it could be added to the commit message during merge?

--

Oleksii

On 31/03/2026 11:10, Jan Beulich wrote:
> On 31.03.2026 09:54, Oleksii Moisieiev wrote:
>> In RTDS, burn_budget() increments priority_level for extratime units
>> whenever cur_budget is exhausted. As priority_level is unsigned and was
>> unbounded, it could eventually overflow to 0.
>>
>> A wrapped value of 0 is the highest RTDS priority, so an extratime unit
>> could unexpectedly regain top priority and preempt units with active
>> real-time reservations, violating EDF intent.
>>
>> Fix this by saturating priority_level at RTDS_MAX_PRIORITY_LEVEL instead
>> of incrementing unconditionally. Budget refill semantics are unchanged.
>>
>> Normal behavior is unchanged. Once saturated, priority_level remains at
>> the lowest priority until the next period update resets it.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>  From the description, this looks to want to have a Fixes: tag added.
>
> Jan

