Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBOyI3Ye1mluBAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:23:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33BF3B9D06
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275515.1561305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAP7B-00055I-8T; Wed, 08 Apr 2026 09:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275515.1561305; Wed, 08 Apr 2026 09:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAP7B-000538-5D; Wed, 08 Apr 2026 09:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1275515;
 Wed, 08 Apr 2026 09:22:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAP78-000532-No
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 09:22:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAP77-005G0F-VG
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:22:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d61e4c-bab6-0a2a0a5309dd-0a2a450cd0b2-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:22:21 +0200
Received: from [52.101.43.37]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d61e4b-f40c-0a2a450c0019-34652b253af4-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:22:21 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB6076.namprd03.prod.outlook.com (2603:10b6:408:119::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 09:22:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 09:22:18 +0000
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
 b=EVIV+CL4KqyH46EHNpsp7q3dp8PiJ70FE/ZIZ1POAoH+BEFasuLtIxhvBJouwZdrCP/my2BI/7uEjgj9Dx18kaUUkf4Ehzjp2hFHu42iPAbChU34XD5pPswt2XW89qW9ob4UjFwlWX5OHJ1eLrPNQBO8L7aGaMaSi8SQBZvbAaPUtr0FcuxXMt3EqGUXSnomeXAp9k1KKBfnPvqqIe34DWfB/kYw0jurMgP84fz7O3+/0bpPBjqHngZObbxtSc1+aws5P0UZ+yxxP11cvtYEyaMMSvzprk7ovkuuFXNriXIGQ6wI+DKojEI0Gd8Xjplykxj53OBELP9Qkk8o6oWdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIYs3I+tFM7lYDAyrs4Spm1MndEzn13Bu4lr0MfEzlg=;
 b=vTAQ808w+rMfwbG4cyD+9eULHSaChSTLx6fH7q9qlAorf9LetcGpu/0m51/yYXxDD7O/QE5UH2yLKbpDVmxRO7UqoAHqri0uuyYiLTNMSDDgfg84N5EqhBcf+avASDBgYK5TXNfuuajr3rE0HZuKac2MCXqf2BZ6M6L+/HRVNaK9O1b2qSygSc13/ci4vhj7cQ42QOkpygx6kACa67c7mWx5Y6Oi5ZEYcnk05jwZnlN6ep8cKLy/njnj0bZ1nM/Cp7pk0d/5/RHXSvaD9ldwiYsk4xBnKuZdOmjmptxT3Sa/9fz+tkZyEMYMgXMcz5hzTGWb9FsbHA1UCXq4ayfbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIYs3I+tFM7lYDAyrs4Spm1MndEzn13Bu4lr0MfEzlg=;
 b=mMahAD3mOA7WuZug/Er2GErAyDvY2TxWuIlCT34k/qbJ6toutrUK531rH9Wmr8Cl6SJp/GWmKLlIH8MnbfFI9WC8dT2N+a3MzFpBW4W63qnNwja4MBeoelTO5DTxuJM9ksv7cBEU8H0yND3lsKM/b3zBsUJPZC366lYtXRnoVRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <68cea196-efdc-4481-9e4b-bb450bcd2071@citrix.com>
Date: Wed, 8 Apr 2026 10:22:14 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/2] Final series to make Arm MISRA allcode green
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20260407103434.90838-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260407103434.90838-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0270.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a57319-373b-4e46-f97c-08de9550548c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OdxKgamFHLB9w5Zbx1wcDV0uiNjh6m3052VQSAEIrF5cfQRSVPrqIHU7JVBhealFtYybYez8F3tZWnkL3WV9yWnS2sHdGzfKS5kjzCcUJFIvfa8mJ3htDl6nYna8oyaeaKtBDq0UUL5Bm+f0OAGPlGin/M4cDeyihkTnOSGXwzcFeTqqdf/pH7F67ivvaXqNkEUw6IrmI6oelgVRqASFDfyssBqLTqmDKQInJ7cN+5sNHwK/gB+weJIYrEnC3h+LekCcAcyMeScWdQ553gXgKTpsX8bs9STPXMYnruBS8S4oOW+X4uvkosmmR0/LL3HM+n9dQy5KSYtPO9uISSQhA9uTtGCS8l+WT0mJI9C52JGXU+ZAH/WleXeGxUxCQzC6HgZgauA5ohparxmW25yevzlm5rSByZpTMJo+TepvON2V8i8p0X0OsbxS0kKxyVwobEpycK5G8B097GRsJDFxY5DQu3ZNF9UjxGBid72ZWEy0CyBTL2lUhu3ZXCgIYt5yvkY3CV5gx3R9OPEUjVflPhtEcWjKMdMg0Adp5wbINaXejFsWbAfTQ0aXKCtqrvTOmDA9mrl4pw7/11aH1Xhxkuregh3kIkMpJW+RC/GQngPhsE2CuxNlLsair6a4QbmH4hBYJfgLRX5+HIYUWF0CJipmm5qrcz8bpl26jcnwy6c9AwYhQjveqgOuDE27YwW8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWtFRmhXbTJ0Nkk5V1RQZmlEYnUrR3l2akNjYXQ5VFlIUWtna05RQklCL01L?=
 =?utf-8?B?UWJoUFc5YnB6U3o1ZG9TYVh5eGpTS2gyL2NrVm5KNUJxMVpkMTJJZXZ3elZ4?=
 =?utf-8?B?ZkFPSjF1QmpNWHBxVytFS3pjWElsSENIU1V1QzZvVEI4OGU3Q3NPUFlNYWxo?=
 =?utf-8?B?cVcwdEpZamhyTHVmakkxSnZxaEdMUmVoeUM5WnNaY1BiTGNYU2RZbVNmZ2pz?=
 =?utf-8?B?QVVLVmFRSGw0VUNta0JLNzlrbGpHTU9qVSs0c3p5UCtNVytkU0ZreHZFY0Zw?=
 =?utf-8?B?SlF3cXhhU0FaWnpTTWk0KzlCZ0REQnpzWWg2N0hWNmQ0VFJ5cllseVFhLzhP?=
 =?utf-8?B?K3d6OW1pRC96SS92cDhhT29WeUxNTWw1UTErTFB0MzhIR1ZKR3BzVkp0MC8r?=
 =?utf-8?B?ZzVYQnUvZ0MwcFBXbkc5aHJmUnR0UzNnY0ZOYUZxcXlhc1FxT1AyMW9aYSs2?=
 =?utf-8?B?MGljcGc3cnFBb3N1RGtGOGJnWHhpeWwxZm5GQjRUWno5U0FyMUU1YmxzWm45?=
 =?utf-8?B?aE5rWEVDYVR4NFF2WE5LMElNZnlUdUJmYUMvaDg4WHVvanRPSmRJRUY0Unlh?=
 =?utf-8?B?ZHJTUUZSNTgzS05ZSkJZSjNsWkFGTTJHSStGQnFlSzZGOTJCbXJ0YVc0Vm41?=
 =?utf-8?B?U3k5ckRRQVdzOWtmS2syQkt4dncyMVhiS0FuTmFndjdXOHczYkN6NTVGemtG?=
 =?utf-8?B?VVR1Qldjdm9uTlppSWVWckhtMHFicG9pZVhQK3V1eXRLTHpoRVFFWFBrZHR2?=
 =?utf-8?B?Kzh6eXVWZFAvYzRLOElxbExNKzZWalVCVW04V3pTMUtBbUE1dDlvRjUwbGdv?=
 =?utf-8?B?d1JOd283b1VkbnlreDl1aEVXeUU3dTl3K1M2VFdCMWRRWFplUG9abjl4N3Jh?=
 =?utf-8?B?STZKbVY0K3hXRi81b1ZjNkFMQ2hmcFl4S2RQUGRISnhURTNZa0F0YTNKSkEr?=
 =?utf-8?B?RkdWYjcyT245MWdWbnI4dGlhT1VEN0xtTW1BcFRiZzJnbEo0Z1hTdktGRTB2?=
 =?utf-8?B?ejNiNjNFSVhDWTJVSy9Mb014dEFpd0M3dFkzb1NaY0NOYVI4b2dLOHhxYWJM?=
 =?utf-8?B?Qjg3S3NzUkVNMkVoT2Q4Wml0dDYwQW5jQVlVZVN0cU5Db1p3cFpNNWhMeGdp?=
 =?utf-8?B?SWVXNk9yLzV4Q1ZMYU1PYTR3Vk1PRzNQTUhueG01eFFGVDByNWVzZEVjTXNX?=
 =?utf-8?B?T2FUNzM1aDUzZ2dTQUh4WTlJYnZKTGg0YXZxb3lwRFppd0tkcnAxd0ExNjhB?=
 =?utf-8?B?dlNGWWNaWlYvZHBuOC9lQVRZYjRKT1lucVpqc0NHYVpieHhESkdrZlN6M3Fk?=
 =?utf-8?B?NjJnRE02ZzQwYm5hZVdjbHd3QjZoZmtqMUloRGVJLzBlK0NDN3BKbTI3bnJ5?=
 =?utf-8?B?aDcwUGRkOWs2ZWpTL1BWZ01BanhIbjNOZGVCNDFrZ21KeWpZaStQZXc5UThr?=
 =?utf-8?B?cDNOblZQcnB4ZTBiZXJzWDRveE9sQ1pTVHlHMFlqM2JJb2lWM2pBM3FlVW0x?=
 =?utf-8?B?U3MzQzg2WGtucUFmdWFFK0daaStCMEZFaVRRbmIxWmpQN294OExYS01vMVZH?=
 =?utf-8?B?aVl4anI0bzZOK08rdjNsRUNwQ2JzQi9Mckpsd3BUT242dXdFUTZTYkVpRzVu?=
 =?utf-8?B?eko3WmM0VEpyT1dpMGlKNUw2QmEvMi83clJPTWc1c0VjZW9jcmM3bWdMZHZE?=
 =?utf-8?B?cWxVSmIxRjNEa00xT0VmeHhxcCt3dnN2MFpzd2Y2SVRPdHNZdkJxZVNHMHRZ?=
 =?utf-8?B?WFlnQm1MdWp5SUZSOElsdE9DUVVSZ2F2OHVhem1Hd00xMjdmbVdLcTVaZ0ZM?=
 =?utf-8?B?bHZ5ajlIUGlJTERWZVIzT201RldrME54MXpBcXd0L2xtSlZSMjFOa1FpK1Rv?=
 =?utf-8?B?c0lXSHhHK2pIUFBJcTMrMEtibmh5Y3dXYldwWFZqOTd4SllwWEtFNWlBeWNM?=
 =?utf-8?B?TVR1OUF0cjRIM1JxekZ6WUN4MUN6VExOakRLUTVQTXB5cjg4c3Z4dTkrTUsr?=
 =?utf-8?B?SVZPaFRuNHFiM1dURTA0bEpPWmhPSXkzUnUyTmxxd2ZNaTg5aVlhVkRGNUlT?=
 =?utf-8?B?WjNZWkF5dzBUSE5yclVCV0lRVjBqemZMTjlEeU4vS0h0dUJ3a3psTTRTeUx5?=
 =?utf-8?B?S2tEaWxKc2FYUW5YVGtpRTQ3VFFKdEVCeHdDL3BWVi9wdlJlK2hpTVJQOXA3?=
 =?utf-8?B?VGt3TTBtZGQzcEtBZS9kMFBacmpOcUl3NHFqK1dwMEkrajY4WnkxTk5KUmZt?=
 =?utf-8?B?aExTVUl6L1Q3b3ZiRmVnN1VaQkE1anpnZXcyL095UHRiY1dOSi9VcC9PUHF5?=
 =?utf-8?B?U2o1U0c1Q3FZeldkQ3E4cUhOTEowb0xNdVczOG5hTmV4K2taWklmTVBiUEtD?=
 =?utf-8?Q?lWGnbXw45owxR0T8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a57319-373b-4e46-f97c-08de9550548c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:22:18.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ri3kLf+BJzzDxETVGY0AZ3PJwFksn+aCqko3yUdTTJKhoR9dUcQA/n5PWPmLZA7YGfnC2PqFnZqZzexcXpd9fx0QYVUFYXNuIAlUeVR+RgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6076
X-purgate-ID: tlsNG-d25034/1775640141-81955A3D-C753AF2A/0/0
X-purgate-type: clean
X-purgate-size: 536
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,citrix.com:dkim,citrix.com:mid];
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
X-Rspamd-Queue-Id: D33BF3B9D06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07/04/2026 11:34 am, Michal Orzel wrote:
> No more regressions for clean guidelines:
> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2433943072
>
> Michal Orzel (2):
>   iommu/arm: smmu: Fix variable shadowing
>   iommu/arm: ipmmu-vmsa: Fix variable shadowing
>
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
>  xen/drivers/passthrough/arm/smmu.c       | 7 +++----
>  2 files changed, 5 insertions(+), 8 deletions(-)

If all the violations are fixed, should this test be made blocking?

~Andrew

