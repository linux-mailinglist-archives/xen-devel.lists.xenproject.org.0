Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDl4IF6k12lfQwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:06:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E4A3CAC9C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277330.1562565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAp5Q-0006xd-5I; Thu, 09 Apr 2026 13:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277330.1562565; Thu, 09 Apr 2026 13:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAp5Q-0006wC-26; Thu, 09 Apr 2026 13:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1277330;
 Thu, 09 Apr 2026 13:06:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wAp5O-0006w6-U0
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:06:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAp5O-00DocB-5e
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:06:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7a43e-5cb7-0a2a0a5109dd-0a2a4504d730-16
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:06:18 +0200
Received: from [52.101.66.116]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7a449-bb33-0a2a45040019-346542743460-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:06:17 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM7PR03MB6280.eurprd03.prod.outlook.com (2603:10a6:20b:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 13:06:14 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Thu, 9 Apr 2026
 13:06:14 +0000
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
 b=F4lVvO4qL/Bgl/GmU8uk7soZBf8UvM3OS77gePxT8Fmq8i11iOk7vjDh6bWkCUZRhHrX4Bcs+mL3E0+cSitlzrlM2CAEgPHWCxoI/yz43b3xW5CDkhGmzLNt3jm+RgnFInGHZyRYODrNpGrjZGxJDbnDR9LwqnBTcyotgMg+QTfh5Pemy5YOSErs1hQvgABAQXawmcLklENyUW21pOf+ufl8ORxuEmBnJE30Qy7lGpisN4djpIBNG83Mpi8iKXkpacYQN01CRdHf3Sy7KY0XiS0nL+FWdcLpcfvZAaTDw7g8iMP2Kno+ISDYOGM/3YbuhnPBey/chogxaIQNXDPqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0Ly5MxtLFFmTRQKhDZ5zQHPP4uEQId4cHluN4LiXi8=;
 b=AA1MMxwL0osopM2G1JRM9hggvNjAKsQ8bNSbH3+TgMdm4YV3EzjdeFrVOeF0rzXHb9YXXiQ8zibvewK8gYXQHaglZWLsWhl12WXngsqQQlbNHiebBzgmbbsHpgO8DwMCu0iaCLdCddLmodOF6tCL9QfdqLZF7yeAdUdbkOwGaUKBEYjmJrzBP+T9A0NRDODAOcavfD3ZoR34gNx3nulZpJI4l5Zx0ctbYrxbfZnydeamSZFzVk8BwjCYwRlPPt9DdFJGRwoRy30g3/eayuuqCyVwfiaKlN/NJhnklDO12slgZxGZz/yioFnlHWNQ7mQTxQbuEiKzAV3BjNM3mSohZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0Ly5MxtLFFmTRQKhDZ5zQHPP4uEQId4cHluN4LiXi8=;
 b=onaoUOk7aIX1P/dG2bJ1pT7HImMb44yENzihmkNiVJaGuoZHDWqZ/LIiYFTRJupqoqjS4eBmIGGfTHrCXWpRr7IJItBMR2UDSHejzopMSFSLJhwuUbLd88U6aInlJW5Td7yGekL/llt8duPOZCdFstKcEqvhEasdwggGwc/UnXoW78IdqcDIUZPuE8xx3xJeyUkTTwy2Q4AKE2Zn6ds9A0bXgYKvjX6DoY08IU0vABLCr0zq6iJSqCcwIH9XRxYKh01iuOFEUq4ULsgTX3LhpJEp4hpyVHV2ySZOsQCasCp0PrvoA5kSEEqV3gkcSvUiwmIVA3SXTsMMUM9TI+JOCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <52a2e3e2-6276-4f4b-8dfe-11d14fe727c3@epam.com>
Date: Thu, 9 Apr 2026 16:06:12 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/drivers/char: fix SCIF IRQ registration failure
 propagation
To: "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <6d1996b3d36e4d21e58c0e60876a1976db9a6208.1775667739.git.oleksii_moisieiev@epam.com>
 <464adb13-b702-45cd-a28a-71d3278feb4c@amd.com>
Content-Language: en-US
From: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
In-Reply-To: <464adb13-b702-45cd-a28a-71d3278feb4c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To DU5PR03MB10263.eurprd03.prod.outlook.com
 (2603:10a6:10:519::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU5PR03MB10263:EE_|AM7PR03MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: bbaa57ed-c747-4b77-73a1-08de9638c76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xzoX5Cne704eGiavZCw4y807K0UIZUp++HDED3ewZj98pkvvBMV873IfQ5Lk/N60VMHh5EqkprmeJudJHD9mR44Ff7tthNl7/5laxpv91L1dv9OtUjkz7dJTTRJQgCJEkEB2gEN5DZsXlzFWdOGP4KDPLb67IBBU4PnCwvK5X+wcrBxVWDiRyK40VWpMZ+Y/ImhIh7XcT4ucfRHTYAThP4lc9AHPy9jonYDiYxnhIei6DNt3btqqSQt/Ujaftn2gYPoYXgUeU3eUWCtJFZSbkjQI4yALS840DiKvLguLYVp6/tNLKmMS1cCe9JxOerPszu48ImdR+wxMX6rJEjZ7ru56sqPVUoiK2+PjmxD3VFXhsmHdLVOT1TRhPJ6ESiYFosBfPbQgoP+DSEM0Zcnb0mMmoa1TIoXZOz1c1krO1sKqpRZbzCXwn3MqbIxweAubm0TZYBHS+Enhxt7eIbOIJcOp4gNFhWgC47k91JOba9s52hOTPEBxOp2dZ59P/1/YSDP4kuSVQt7cVeBO+IokFAvOBDR5deyK/tpPk6G4YnPALWPmrHVd3fN78+ZJuWFEYh/iijbt/tHjHKd3c9q/ERb4soFio6zgMjaVVKWDXSiFq2QwS4NMCQKK9fVo3bjYLvwiQwgFBelh++8m5J/PCZHKoS6DCtT75cOmQeuiCnFvFi9uTxbL25kSQyAG4Zk3tY0+wZJwv4BUrY/CfbtXgtUCuyU1lDWFnvgO/RvMeB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUdtVG0xR3J4TEMyS3RXL3BPWi9Kbk50bHRyZjRJcWhmakdjNUZxNHI3d1Bz?=
 =?utf-8?B?N1ZiN1k2RXl3Q1FXdHBvd0hvU1hNVlAyMnM3SW81V1pmRHhLdnJTRFRVVUdn?=
 =?utf-8?B?N0RDbHliclcyOFNWRmFpR1lneVJNY1NxTjVzYUJsVFVvanM5S3RhYjA1Tmlp?=
 =?utf-8?B?QkI1WWVYcEtSK3pDSVdMSXNvRDRiL0RqQVI4d2hyTVdkWG1IUy9xTnljaDBq?=
 =?utf-8?B?UFdPdnV4RVNmUUJnYTUrWlZoTHFySzFkSmNPejlrTlhLaHhPa0krdUZ0a3NL?=
 =?utf-8?B?dGVndUR3RjVjVWNGcW9Vc0pqdzZTdlAwVENLQmpjT21zTzgraVRxcVRlYW9S?=
 =?utf-8?B?Q0FNR3NLNER4Nzc3WFhUaXlqWFl4dXg0TWliRWtYUU90cHIzdWxpRGRJNUpZ?=
 =?utf-8?B?TnZ3dU85Zk8zblFIc0UrNFNVQjYrdURObXQ5dlQ4WGVXTENlZzdwV0ZzSCtW?=
 =?utf-8?B?UWNBTmZJVWJPbTBINGJDcDFCem9kbmlYbEZMTGFEREMrbHFxR3NmUmtQejRK?=
 =?utf-8?B?UlNDQ3BRS2V2MzNPRGh5MXhpc1g1Q0I5M3kxSHh2d1ltMFRjdFNVWkVrZFU1?=
 =?utf-8?B?RTZjenRSNXBRY1k5cVhRc1lSTnczRlV1bk1JMUZ4QWNyTHB4cWNtN3R4QWxO?=
 =?utf-8?B?SmtTMklWZU83bCthZjZoQTg3dnJxbWI3WUNVZVp3Q0F5anNLVXVpblhUNmpq?=
 =?utf-8?B?WTd5SzRRMDZ1VkJFQXp6bE9UaDlaNG9KZE5KNFRIMktjeVdiSUg0UGUrR0pj?=
 =?utf-8?B?dy9WQ1YxYlJ0ejUwQlNUZVJWbzI1czRPL2Y0V1ZQRzRmVDM5VVRMUWt2WkZD?=
 =?utf-8?B?M1JpaDl0TERRUHNxdWZ0M3pYbmZDYWVSUVlXTzRvQlpWY3ozNDd0bnZITDRa?=
 =?utf-8?B?NVd4N3UwdE9yajhMbWJKdERZTVArT2VnR3BiOFNOSWlzVWk3UE1kQTQ1dGVT?=
 =?utf-8?B?QTAvOVhTU0l6U29WMmoyNHBUbFZMWDVUN0hMSkdoWnlKTEJrS3g3MjJ3ZTI1?=
 =?utf-8?B?ZUZlNGc5d3FYN0pYRkErV09FbUM4aDFodml0NnVaVXU0VERDd1lnQkhTSnAv?=
 =?utf-8?B?cmpmM1FKbFdOT1NlQ2VhUFJja0RQQnBEVHF4SFpOQnhoeFlUVVk1Nit2VEJ3?=
 =?utf-8?B?ZDdGd2k1MFVVcE5Tdzllc1c3Q0hnc0xORWF4NnkydTEzV2JhZjR3SVVoeTY5?=
 =?utf-8?B?UGxDZk04QWNsV0VIRFRQek04MGh4WWxwT2J4YjhwSDBqSU5lOWN6TXFQbVZE?=
 =?utf-8?B?bUg4ZmlMV1ZYUmFZSFB5em1VUUZSa2g0WWxPcm9Ueno4Q2tNQnFvOHhIVm0x?=
 =?utf-8?B?UFA5OW0zdkJ2aWFoWWNDbmN6aHllR3JYa0hXUGRGQWhELzJGY3orV0FEeE03?=
 =?utf-8?B?MkMvbUFaZzhhdEoreUVPRDF5KythYmlKVXYyd01WYldEVkd4bXFHSkRjb3Nm?=
 =?utf-8?B?WHB2NHFkZkw5cjJSd2lUdEtKNnhtdTEwSkx2TVJ1WEw2azRwbzJ6NDZpNG9Y?=
 =?utf-8?B?Yy9Rei9IUVRTSWhINHYyaGxncnpiSUIzK292SWlDSFlUUWllTG9WNFdsOGVV?=
 =?utf-8?B?d0h0eFdDTmJlb1hVcyt4VEdUL3pSNEFTRTh4VEppNUs1R0J2SEhXUzZ1VWJn?=
 =?utf-8?B?dUJkWjZjSzkxTjhxN2JmWTJVaFUvdkcxbkpYWEdVeFdWSVBaaDg2ZnAybGFO?=
 =?utf-8?B?TUdweXg0aTRsSWNQcVozb2RTQzJtWWN5emlJWFFYSVhpZkk2bXJuMHVIRGhy?=
 =?utf-8?B?ZUpTY0VCUmxOUFIxV0R1R0pLRmoyUzlyT2R1dU5jSk5BR1ZNa1RyWktJUHdH?=
 =?utf-8?B?UjlHR0hmYk1JK2pVdGJzcm5tQ0JDWm96SGlUYTNIWUhQUUVmRnNLNkdNN2gw?=
 =?utf-8?B?Y3RQa2t3SWtnOERvdTl0a0xFaVNwWXAxOUFJbU9hUFJyTUVOcCtsTUdzOEd5?=
 =?utf-8?B?UDA0ZlhSU1Fqb0VLWVhUVHBHSkJnYTl6b2twei9OWlUwSGp5UzhvZ2I1RTdo?=
 =?utf-8?B?WTFkTlRDNy96cmxORjZQZ2dhbXdKYjM2ZXM4V0Vkdm9MNVNxVHN2eUlkVXl1?=
 =?utf-8?B?eE82VGRzQnZHSEs4bFA5N2dDdlB1cE5TbHRYOW0xN3JScGFJYzJHMmFOeGdt?=
 =?utf-8?B?WERJb1FrWDdweDEybThqMC90MEJPTzNaWGlxeVdtbTlxRWx6SlBhUHB3L3dY?=
 =?utf-8?B?MjJGK3ZQbmZnY0VuTWpvYVhLUklQQWd3Z21SVkJ1SzVzdlI0KyszeElTR0ow?=
 =?utf-8?B?UTRIV05qY0MrT1R4K2podVdTQm1GNENFWkxRSG1sQ2lIb2RCb3RVYnllVENO?=
 =?utf-8?B?UWlvdkxUOVZYbGJpaEZ2N1dpeUprVTFlcStuQ1I0UVFKT3NQakpETFJSVFA3?=
 =?utf-8?Q?lMAHDMMQHBu1x77U=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaa57ed-c747-4b77-73a1-08de9638c76d
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:06:14.3529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LO3cin7RIHCq610ttGkoLmFYWB8scdKaWciIwbTVrf3W6CaBxKeLqRM9dMCaYfdJDiXQW6iF13V0h3iesJfzgyZ6IYFxgHplXJB3D+RvGqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6280
X-purgate-ID: tlsNG-ebf023/1775739978-B2D3F51B-F03B2A7A/0/0
X-purgate-type: clean
X-purgate-size: 3696
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksii_moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: B7E4A3CAC9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

I'll prepare v2 with the fixes.

--

Oleksii

On 09/04/2026 11:17, Orzel, Michal wrote:
>
> On 08/04/2026 19:03, Oleksii Moisieiev wrote:
>> In scif_uart_init_postirq(), when setup_irq() returns an error the
>> failure was only logged via dprintk() and execution continued,
>> unconditionally writing TIE|RIE|REIE into the Serial Control Register
>> (SCSCR). This armed all three hardware interrupt lines (TX FIFO empty,
>> RX data ready, receive error) with no handler registered to service
>> them. On platforms where the GIC receives these asserted lines, the
>> result is either repeated spurious-interrupt warnings or an unhandled
>> interrupt fault.
>>
>> The fix adds an early return inside the error branch. The
>> interrupt-enable write to SCSCR is skipped entirely when no handler is
>> registered.
>>
>> SCIF TX continues to operate correctly after this change. The Xen
>> serial framework never calls serial_async_transmit() for SCIF, so
>> port->txbuf is always NULL. This causes __serial_putc() to take the
>> synchronous finite-capacity path, which polls the SCFSR_TDFE hardware
>> flag directly and does not depend on the interrupt mechanism.
> NIT: It would be nice to at least mention that there will be no serial RX
> without interrupts.
>
>> As a secondary clean-up, the hardware error-flag clearing sequence is
>> moved to before the setup_irq() call so that error bits accumulated
>> since init_preirq() are cleared unconditionally, regardless of whether
>> IRQ registration succeeds.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> That's a good catch. I can see most of our drivers already use that.
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> That said, I can see that we have exactly the same issue for pl011, cadence and
> exynos. I can either take your patch as is (no more work for you) and submit the
> patch fixing remaining drivers or you can send a v2 fixing all at once. It's up
> to you.
>
> ~Michal
>
>> ---
>>
>>   xen/drivers/char/scif-uart.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
>> index 888821a3b8..673a2d3800 100644
>> --- a/xen/drivers/char/scif-uart.c
>> +++ b/xen/drivers/char/scif-uart.c
>> @@ -187,16 +187,24 @@ static void __init scif_uart_init_postirq(struct serial_port *port)
>>       uart->irqaction.name    = "scif_uart";
>>       uart->irqaction.dev_id  = port;
>>   
>> -    if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
>> -        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %d\n",
>> -                uart->irq);
>> -
>>       /* Clear all errors */
>>       if ( scif_readw(uart, params->status_reg) & params->error_mask )
>>           scif_writew(uart, params->status_reg, ~params->error_mask);
>>       if ( scif_readw(uart, params->overrun_reg) & params->overrun_mask )
>>           scif_writew(uart, params->overrun_reg, ~params->overrun_mask);
>>   
>> +    if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
>> +    {
>> +        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %d\n",
>> +                uart->irq);
>> +        /*
>> +         * If the IRQ handler could not be installed (setup_irq failed),
>> +         * do not enable TX/RX or error interrupts. Serial transmit will
>> +         * fall back to polling mode.
>> +         */
>> +        return;
>> +    }
>> +
>>       /* Enable TX/RX and Error Interrupts  */
>>       scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) |
>>                   params->irq_flags);

