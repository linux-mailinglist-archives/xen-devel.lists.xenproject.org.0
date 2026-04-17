Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGllGysg4mlX1wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 13:57:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E8541AFB1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 13:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284202.1566068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDhom-000750-40; Fri, 17 Apr 2026 11:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284202.1566068; Fri, 17 Apr 2026 11:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDhom-00072G-0U; Fri, 17 Apr 2026 11:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1284202;
 Fri, 17 Apr 2026 11:57:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wDhok-00071h-15
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 11:57:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDhoj-002VRs-Bg
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:57:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e22003-bab6-0a2a0a5309dd-0a2a450691ce-46
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 13:57:01 +0200
Received: from [40.107.208.42]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69e2200b-7371-0a2a45060019-286bd02a9aa3-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 13:57:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5778.namprd03.prod.outlook.com (2603:10b6:303:6e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:56:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 11:56:56 +0000
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
 b=uU2num00x53P2j7E13LEVly/pm5XFfOkNVxls7s/zAOzdAaDIhOCPIDa6Og3C4wzQNixNAO2tJbT5ZMpsrUHGe/JH2PhpszgtbftK5pMtKVZg4nCWAU383jThj5f+ih5ZELrK3SRqoz4OnKIm8r3I9cEPANWcmmuhnmIMrJdiZ56SVvhTZjXixPga5cGmZfcepz6XrRC6BDqDhae2/Wp3S8N6864IKvyoYOX5bavSka/vfRhTOZcpyeV2Ek5l4GLx+gsmsfmnrA0jDYSJx+VQItp4n5lKUWqGWX5qI/nekFgur8Kc1lzC1Y+aYYhYZzbwpSIKLgB47RHhfa/Y0LPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gugI186i9jfrpmlhISLAKwWbgzF2emXM81g8BgE7ZIM=;
 b=ChB1n0waVWbwbYqImrSzXCE+ZtXd1oDLAv7A5hOWxSsK0/GZnVKc8uZyv64fRKMtPjVkbsIzHYmY37kZaKJPbHiGCd3lrecvwj4kHoiDMyVJwd6bPlA3Ysc2uQqjt5Z+WDOjiSW2pmrt8hnYsyw2KTMbSUNoWPBIu9LYCSDQAnrwLx7F0mwILg1iRhN8CBzL0wX6yg8t/NCNg9wTDTTQ6qhGsCNqaiMctXl6HiC6sezoSTldAy+pWTHOakv1lyNc1zE2SM+mN1kBfEA7IGcuVJ8F/eCTY2LcwPVth6OH4Sf4dttmIA076bA8G5GxMoXd/Zd37HgtLNp/rRseKvoOow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gugI186i9jfrpmlhISLAKwWbgzF2emXM81g8BgE7ZIM=;
 b=lOwgCJVXaE40jv6OBxoJo+CVLWnCoGNqumbkYW3U3P8LnIioP0cFxOmiDPdKdkPKj/ciJ2KCgYrrVITJ5UD9OF/z1C8XfkZQ6R49L+HmqEY+T0xRTAbsK8fTGRwtyOQbasLV7yg29BKv+uci5OkyrhiyuI04BAxZYNT/2dDRGX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <30270183-7e11-4512-b8cb-8d11191094ca@citrix.com>
Date: Fri, 17 Apr 2026 12:56:52 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20260417091124.39552-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260417091124.39552-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbbdf0a-6706-4ed0-7017-08de9c786c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zw1BsO4qrLrVsq3Wu5T7nbQqDxWQPNsgMRipAxFo4KrhtWA5uCJtejIHkPy0INKYNF11M3XhlV9/vEYBS/GBOfVUJNknZ+YhAvbZoxN+bEtPDGq648supujca+2NTNfXP9Y55AavIBpjukL6XM90Mpa8SA1yK9tHPig/VCcZsGsvOVqrSrZlG88NGX56rJHxP/JEjIQj5lOGHm76HPGiLb2GP9vMPUVwGYWp8m4vLIH/vXxVy/jlzIwQLa3WWdlNCJyTlkMqqRUbja9BSjgi3e1RoxsZTYQDu8bfjHWxNETqfmJkhhtCXCbNmob4wWYUc6sjkFpq2/zC+0LYooZHtFxVAlF7VzgnYgo4mcw5YYO1mNpnaV2UsZwuinzBXEuE/fT/iBq1Sm0IEQ8/Wa/x7YFX2CY+a6b1ynB796ctnUCXG4xlF88Fezm8QFSvYZaQVi/JqXgI1jLArWu1N8ONdnBa/ergMTWoyPf3QZ9MHNaU0GOY8IJVa97VezkQcwQwLiPzfOyZuMZTf+6teulvgwdO6Aoe5gDn5fQRdFB2MfUBBnkgRqQbgYntZufkS/52s4PuESXeAdAiuWBapF1gw+/tTRdWyEi+SmABvxMpQ69UJ/aGSoZvAIC3M5bZNwlaMPPmNaIk9j63JqKKOiffLcGcivgRLM7KNkP3Y0OVGPelvnMJ7sUq16mXeBSU8DOtQe1XZOsCNbq7tD67ReI887CJIkbt2OqenXE2tk5D6lk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVFkV3RLanFiWU5XZUlNenI3ZnZzTzVBcitTaU5LS0o2eldXM3BibzZYWm9T?=
 =?utf-8?B?aDBXczFMaThCTjhUWXNhU3REMjNKTVRpTmtabEVlYzdlVUM3TDBhdmo1NUVU?=
 =?utf-8?B?aE9mUHhEbUZGNXFNSDlYWjVkcThla3gyc0ZIa29ZL3gzNTZ6elNDeU1WOEF2?=
 =?utf-8?B?cFN1SncxekFsbVUwNElRUUNvMHorRjFVS3E2WnQ4cG1hUUp3eHNRcHNNMzlx?=
 =?utf-8?B?Z24xYlBGZmltY1h1N0lBMFViTVVzb214Vnd5Zy8rTmVpd0EyVFBqUkVtTGNp?=
 =?utf-8?B?VVZMTEdQaW1QVU92ajUrdW9VVU5aaGJHK0NPbDdNRzZoZDlvbjFVYWRRS21J?=
 =?utf-8?B?c1VHKzRjVE9Ha0JUVCtrMXEwbDJhTXJ6SFg3KzllNTFLdFg4eldCWmRBVHVJ?=
 =?utf-8?B?UFpNemdhOTBvUlBpcGJjeXVBZGI5VTQwZDUyTTdVZE5EdmFwTWQ1SDJIWmxV?=
 =?utf-8?B?eHI3TkF6bjlMZERHbHpRUFVNc3FIc28wUDN4TFZlRyt3akNFWWZ5TnRVZVkz?=
 =?utf-8?B?Mno1M2Fla0NQT2lnMUthWEp2SEgrekg4My9RQXhuLzhyckJQdmtac3JoZWhV?=
 =?utf-8?B?TUo5Z1RIemJ2b3VKdzVuT2h2aG9mWmJDelRseHo5Y1MycHZzcGNWU2pUZlQ2?=
 =?utf-8?B?R2RQeWVNaXVranQxeGdMY01QUUtzNDFuOG8rN2xJSk5SL2FXVE1JTEt2ZUM0?=
 =?utf-8?B?OVlzVmlLUGdvRlBSQjhySWhDSDB3MHJ2dFZERVgvWld1d0hyalU3UXY3WlZs?=
 =?utf-8?B?UGhhR3gvMFJYeXI2Z0RwWlRpMUpGT3F0SE9vZlJtR3hDbVMrQnVpQnIvU21n?=
 =?utf-8?B?d09OakQ2UHlCQnV6STlHclNaL3VyVHNjTGtZK1gvWkc1aWZrYnMzT3RyaWpw?=
 =?utf-8?B?TUU5aHJCLzM5WlhkVnJVaWFTS1pRUTkycmpwQWZ5SDM5NWlodFV2VTFUVGxL?=
 =?utf-8?B?UGMwUlJZK1gwMmFYKzNLaW16WDlTNVV6Mm1yODM5R1lSejc0OFl0UC9nbEQ2?=
 =?utf-8?B?a0MyYWlIM2ZmbTdmdXBjbHEyS1BRc2JrRmlMbzYvd01NN04rR29VaGFWVXgr?=
 =?utf-8?B?SnVTSEQ3SmlqTG1qd1NiMlBaL0ZWUUxuZU1BNnRKUE91UHB3blg3dml6SmRo?=
 =?utf-8?B?c080Z3FmK2duT2FWMWFnTU1kMWd2VitNM2tLVGk0YzdkNlg4YjZkQXExYWNj?=
 =?utf-8?B?bnhkUEtyZ1hlTFlLaC9UaHp1TlZDZkRmSW9lN3FoSFIwOCtuWFVHaW1QVGdU?=
 =?utf-8?B?UWMwWktNUjR4QzhtQ2w5cnhjRkRWN2QxUEkyL3Z3WExtZGVMR2dsWVRlSGdX?=
 =?utf-8?B?NEcvZERrRUc2NG5SdVN4UEluQS9WbVpkNkxtR290ZEpEL1F5b2o0N0gvWjN3?=
 =?utf-8?B?SUwybFlDSXd5Z0EwdHZWMEtTdytwcWV2OFFGVjgxTWhkUlBWL2N3WWNiQkx1?=
 =?utf-8?B?RFFsNWJjREUzRHlzNTFIemMvdGt6czF4K2p2WmFSenh0ZDBKd3JzbVcwNzdo?=
 =?utf-8?B?b0NlQUJLK0hRcUNSZVQ4Y2gyNWNyeHNMMWRzOW80SFNvMno1bnFCMUh1TTMr?=
 =?utf-8?B?SERoRDRHM05OWGs4MndFUXlBM0llS0NFTGhpU1NjbnVYVzFWMTJVajJmZXVm?=
 =?utf-8?B?M2xUWjdTcy9DRjh4cXZFbzZxYkVQanFvM3Q3alVHam1FT1kvR0VSbTlPSFcz?=
 =?utf-8?B?THd5V1U0SXBHZEJVS3Q5VDFTTTZaZTF4aWQ5T3JoNk9ac2pFUmZsZ2t0WUxW?=
 =?utf-8?B?WlNWeUJiU2x4K29Dd2dCUWhFaVpHb28vMXV5L1U2b0h5TlBhTmc3emhwNyts?=
 =?utf-8?B?Ujk4Y2pSd0RqMDBMN2FpQ0JJMXBUNHdwd3djWGpWbjVleXJRNEtoOFQ2a1dR?=
 =?utf-8?B?UmJzRmVuMklhSUF5UHR3WlUxZmEyWUhFcXdkVzRNN1A5OHlkMkhqN3Njd3lj?=
 =?utf-8?B?MEYzaEVaVDRoRkM3L0hDRnYvSmdpejI4eHEwQ0NsbkdTWC8vWlhKYzNwaGVr?=
 =?utf-8?B?UTNwREFrVEFnam9BZ2xueXNCdzk0VWRHUTBhMDc2NVRZRFFMWWRlRVd0NWky?=
 =?utf-8?B?aG1XRmttcHV5Y1Bhd3A4Qmg2ZDlMWGg2aWROOFFCK1JQUmUzU1NoRTBJcjd4?=
 =?utf-8?B?Q1FXbWdzVnZBTGxZQklaWm5OQUhKOFFLYXFCMUdxV1Nka1c3UDZwN2xreG55?=
 =?utf-8?B?KzNCT3NGeVZYNWNTOW9iaFJSczNYR1hXZXJSYUQ1NFBGNkwxdXQ3VTZ3OG5j?=
 =?utf-8?B?aGFmbERmSUVJVnZKRThWMXZTTkdWZDg3OW9tUCt2QXB1NTRhU21CejlXN3BM?=
 =?utf-8?B?OUsrVk9CckxDU2RnQXZhamZQOGh4MkM4R3FNZjAwYStaV1pwQ0s2TS9raXA4?=
 =?utf-8?Q?4mXK+0UzzqS1VfaE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbbdf0a-6706-4ed0-7017-08de9c786c58
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 11:56:56.2006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O15qdUJ3wprCvkBh5t6Dc+Ry3tITJDenlDIyFoJ8Tf3OoD9nWFcmMy2Dc9IiQizHgHI7zhLprGOMHepc50naiNVHq4tShGs704WDHkD5hRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5778
X-purgate-ID: tlsNG-16d1c6/1776427021-50767D75-D93FB8D2/0/0
X-purgate-type: clean
X-purgate-size: 2174
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D5E8541AFB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/04/2026 10:11 am, Michal Orzel wrote:
> Refactor setup_frametable_mappings() into init_frametable(), modeled
> after x86's implementation. Instead of mapping one contiguous frametable
> covering ram_start to ram_end (including holes), iterate the
> pdx_group_valid bitmap to allocate and map frametable memory only for
> valid PDX groups, skipping gaps in the physical address space. At the
> moment we don't really take into account pdx_group_valid bitmap.
>
> This reduces memory consumption on systems with sparse RAM layouts by
> not allocating frametable entries for non-existent memory regions.
>
> A file-local pdx_to_page() override is needed because the generic macro
> in xen/include/xen/pdx.h does not account for ARM's non-zero
> frametable_base_pdx.
>
> Update the MPU implementation to match the new init_frametable()
> signature. Since MPU has no virtual address translation (ma == va),
> hole-skipping is not possible and the frametable remains a single
> contiguous allocation.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> We've been using this approach at AMD for a while now. Without this we would not
> be able to boot some of our boards that have huge holes in the PA space, so I
> consider this patch a great improvement.
>
> Two things to consider as a follow-up in the future:
>  - change generic pdx_to_page, page_to_pdx to take into account offset that
>    on x86 is zero but on other arches it is not. The page list code is
>    for now unaffected because the offset cancels out,
>  - use the same on RISCV.

PPC also has frametable_base_pdx and a TODO saying "make this work". 
The header file however is horribly tangled and needs some work.

What I think we want is to include <asm/pdx.h> early (if it exists), and
allow it the option to define frametable_base_pdx, but with a common
fallback making it 0.

I think we also want to split out xen/pdx-{mask,offset}.h each taking
their respective chunk of the giant comment.  Possibly pdx-none.h too. 
This separates the unrelated algorithms, and puts their definitions next
to the comment explaining how it works.

~Andrew

