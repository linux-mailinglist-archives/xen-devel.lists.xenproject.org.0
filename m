Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AKtOs/rAmpKygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 10:58:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3687651D25F
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 10:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306636.1578477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMiwu-0006mL-Kg; Tue, 12 May 2026 08:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306636.1578477; Tue, 12 May 2026 08:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMiwu-0006kw-Ht; Tue, 12 May 2026 08:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1306636;
 Tue, 12 May 2026 08:58:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wMiws-0006kq-3L
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 08:58:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMiwr-00325c-GT
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 10:58:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a02ebc0-bab6-0a2a0a5309dd-0a2a45019034-4
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:58:41 +0200
Received: from [52.101.62.35]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a02ebc0-c1f2-0a2a45010019-34653e232d5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:58:41 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH4PR03MB7603.namprd03.prod.outlook.com (2603:10b6:610:23c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 08:58:38 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 08:58:38 +0000
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
 b=nnxlfFEIl6LbOy5ahady0CbZ3k4PGlQaHE2iX0YaQsxb6oqNE9Lls+PJ/w1IASsy6IjDU0qABeEFZEH2zP+mf2MxpQtItse9pAvnPJgxCLCfNGulB1IBFuiDjhIlYq5UjAzk76OwFv+CjWr/qQ5DPkiHw/e5KZ0CEpFwJJsuhOtEUlXdpkf8phpDOVOMTFeFbxdkUFqV743M1G2DJaIKJ2wcSoVY2dSGCj2lxIIVMDHfipkpULUI63zUr9ltid9Ny6YK3QiCAxiLq84Lijs7+eyIuHC+ce7R1ZExeudXQgGLTyOv9l/9YZepPVTzBZ4PntzmJLX6P1B93GA0qXmphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qH4EWmAqN6sVd9w3DT5QYXve3FhDQLaIzlvXI4tn7w8=;
 b=FjZs75dTFqogmSMMmoqDHnmV2d2SAry+GkyHaEFCHIVTvY4BqDoARPOFKgcpWsRqG0jd6KZHGcXTRn4W/lo5GEeK53fRSbCCZEE4h4i9dhofWDF1CFYeQtMZjmVDTbujgzOV1EOiVRzP1AhRxh+0pjKx8rcbFlOtKueRMoYrHZZPUV1l1TaX4JcqlNx0e88BPuFFAp69sRGgarZVQC9ymxev72tEALAS/Rib4amiiDHGLcY44YBmCoH9g2fCXMOP+p4zuFkc4+4HENTEfaTQyMQWdgIuzNj+DcmIAwv404j6nonSA+ib8hR+h7GO6scgtMQhgeglI6hH2iY2lILfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qH4EWmAqN6sVd9w3DT5QYXve3FhDQLaIzlvXI4tn7w8=;
 b=hTSVqqLmUtvXKccTCLImU8P5r6GG+en4bFc8IJs4dfmj2ZIGjsfgpa52/jhb0DwmTstJG1uBsE10nbCxhFUnT2MCRD0r51Ok9wr/fVHSCtDacJWA/YTWywqZVf2rcrBd8OW6Ese3ucl1BzyeE9Vc5PGv1oZTyw/r9goHSnszRNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 12 May 2026 10:58:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
Message-ID: <agLruvURfBUb-VgF@macbook.local>
References: <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
 <5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
 <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
 <d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
 <e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com>
 <878q9vt0lg.fsf@epam.com>
 <e9610f70-85b8-44d9-8e13-da26d506d5b7@suse.com>
 <877bparq9t.fsf@epam.com>
 <1d591ff7-599d-4dfa-b521-bfaded430a76@suse.com>
 <925f2076-f98b-4102-ba45-a85a83861c9f@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <925f2076-f98b-4102-ba45-a85a83861c9f@epam.com>
X-ClientProxiedBy: MR1P264CA0205.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH4PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca4d1e6-781f-49eb-b1f9-08deb004a807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pvPKAKsVLLkl8pSs8QlzmGS7GSRHqWd6hxf05emM+aqu6PrnEmcYicIItb6vbQp+dpLKAfKwwFQT+Tz80imF9nEaGIE0y3k39Bg9XzpWjnLsi90X0BHRbLg5RLhIKnoGg0uF3fS2y7m2zYxygc3ItmzsJVWJAee+Qh702/IG5tYCx5j1Gjd/w091+vxn6hjtHHTC6+RvjBk+o7MDnC8mBqrZMfFmiMKQ3N4Z4G0cQcT1DduMCxC871bKe5jIug4hvqASS9C6aOTtmyfxFbIJh9H8ApnMDiYe41GyFf7SLT5Dbmf6O08ydZMLOTxGtdKRTO3QBFdjJ4twuq4KBBM2xkLMkB5Vj+jE7WeelPoks91IeEN5ayk6ALGu90Yz5QqLfwDKnf1gxDLAewnMnwHxH8Uif0+RkN0zlatIvlZNswlTdcCkzGBugps1H57oBK9XFSaeUKhd+ebT0g5j9yvsW13mylnL00TJTpPa5SuEmn6kUtkEhqWcstg30GbPY5N+4FkE8KKCZD9aSIz0UYAy8h0K49Lvw3XABIbBVtGv3aSfpznEfxmM9XIA06gdI546Jxydfod8tY7LXJrQmmrOA8k0F9R9/Kvypc2v5z3t2gojeNCzdqC557CHlEtT0Csbv6CugWdrj5KxrKEq8iGI7SbBZ9xmk7/WNxZUPWRq9b9D3ov3oWVk06zuHBH0BJ/7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0xFSDFnQXU4NUQ2cGFEVXdLUndIT3VzUDlUcFk1Snp5aFpXUDlMdVBWRVRP?=
 =?utf-8?B?NmROWjdHMVJyWmlWQWxMYVJzL3RWSlF4TTVKaURrdzArcklxcDN4c2c4VVdx?=
 =?utf-8?B?bng0ZDF5TG9CQjg4YTNHRGZ2cGh5eHlnQjFoU3MwRUNXY3U5R29OUzBSWXVO?=
 =?utf-8?B?aW11VVZpQjZEcDlPM3EwTmU3c0tjMFdaa2tIZGlncFJIRDdPM3JCUlRBdUpU?=
 =?utf-8?B?SUtueStmS0tBZWNROFhHU2tCSGxVNTE3dXJ6SUdubGxhMG1FWVBNdU1jaENI?=
 =?utf-8?B?TTFRa25XR3cvdThMNjUrYjdockZrT0RSUHErL21ZK2ZDNzQ0R0pwSmJaU1A5?=
 =?utf-8?B?OEovSEJ3Ykg1bnA3aTVWYWJYR3pqazhCNnY0endhN1VCVDJ3ZURHdHNhYy9w?=
 =?utf-8?B?T1NQbFdPWHBZVWtjaWxPb1J1dzRVcjhFaWJOVERmMUtUWTEvcHZBTWZwd25p?=
 =?utf-8?B?bzN6d010Umt6KzhSdUF0NnU0bmpzenlKQ3AvY3czNUJGUzQ1ekFoQWFyZ1NQ?=
 =?utf-8?B?Q2ltVnVkeDlXY0E3aXdLNUphMDR4V3gwcDQrQ1RPNkplQjlrWlZQcXBaRUVl?=
 =?utf-8?B?SEczY0RLdCs3dTM5T21yT1MzeW5JMlkvL0dtSVpLYW9OVHF6ek1qVzhaRVNv?=
 =?utf-8?B?VW1IV3dsa2ZvTUd2OS9wdktoVS8vSHZJRFhodGhyejNtNno0eGlaVlUzUHRF?=
 =?utf-8?B?bENHVlFJVjdBeWJrQm4wT1JjNzdKelJOSEt2OGJJV0JyN2pxdUhxSGtoTjEw?=
 =?utf-8?B?Z1ZJUnFkSUR0YXFxTzJKdFdwbDJ2ZnRJTGk1SnNhdVVCbVczK1NCek00Z3Y1?=
 =?utf-8?B?ZitYc3MzNFltOEdBUG9ndlU5NEdFUzdoQmRGOSswd25DMzFHRjg3aTdNNVdM?=
 =?utf-8?B?VnNuSkZpSnNzWnlHdC9xZXpYQm9QbnpuWEtKQllDc01vcHdENlNQRUo1Sk9v?=
 =?utf-8?B?K2RWcmdqWCswaTkxaXhjdGlZQlpjNVBqY1FUZW5JQ2s2VURQcmlTVlhLcWxr?=
 =?utf-8?B?UmNaVlFGUXJVU1lpSEZvbW5sWlROY3MrUkY2bkZ3eGduTDhMNzU5YUlTTXE0?=
 =?utf-8?B?NnFBMU5OelE2L3JpY0VNeGVWSGFSeDJDQmI3N3VmYnVCayttU1YrWXFoZW9D?=
 =?utf-8?B?czNRSklOWnBjMjgrR1p6US9FRlE5VkxhSTV2ZjFvMG1wN3pXcUF5K2Y1Y1N4?=
 =?utf-8?B?ZDd5Q2tkUmhYMmdQc0haUWdkejJ0OWpHYXR1ZWhZOU1XZUhlSHJFUGZuUEF1?=
 =?utf-8?B?MkY5ZVhiamZ2eTl6Snk3YTA5R3lDZnkxSWVEM1NVeThqYmg1TzhtWis5Mlhz?=
 =?utf-8?B?Tnl1UzZENWpyRXhESlYva1ZwNFY3OExBVjBQMmZBZjFqWVl3blY3WVZqTmZV?=
 =?utf-8?B?dVNkNklsTnBaOTdPQUlXZjFCd1MvUmpJcDVjeDdndm5qbHVNaXJFSXBrMndr?=
 =?utf-8?B?eVY5T2I5b1ZJRXE4b2dZWUd4bjNLak41TU83NWo2QWxIbG93UVBiOW9MNkZT?=
 =?utf-8?B?ekNWME9GUzdnM2pNV2pPNkt3NE9iM3N6UWc5aEhHUHpHMzlNMlpCVkVEb0NS?=
 =?utf-8?B?S3VQRW5GM1BIOFkxTmx3TVlsSnZ0dnlSeDBwSmZxM1YwK2lSL1pUYWxHT2pB?=
 =?utf-8?B?NlFmUUI3NnZGcnIzWHRZQWJvUWhWM0hhU2JFcXpQZHV1NllyTGZDQ0Q3UG1z?=
 =?utf-8?B?eWNiMUhML29OYnl0Yy85eFhrSjZ0NTdzMm0xR0F6cDkvZmpRd0xHcFNRRmNT?=
 =?utf-8?B?N0h0SHlUTHlROXRhWjZUWlZ2U1VuNnBOaDFRZHRIa1BuYXNneG5rUmZ2L1d3?=
 =?utf-8?B?dlp5cjRHVk1obHJ5MHA3b0tpSmFDZ0I1RHJ0cU5TRWcwanVPMlFFanZsK0tm?=
 =?utf-8?B?Wkt3M3hDTTZ0OHlEWmNIbHpweWF6aTJsWXM1YVlWYU9teEQvdDBsL29ISUhi?=
 =?utf-8?B?dktsM3hHT1hHTnk3dkZDLzBWeXJ0WTd3Tm1GYnVyN2t2Q01OZE5aZHh4Z0lk?=
 =?utf-8?B?TWthT2dxOThvVXJ1TlZ0anRKVlNob2lJaWhKN2lrWmYzbW5UK2FBay96TFVy?=
 =?utf-8?B?cGNUNUJxYXFMMmlrL2FyTG9iS0lOb2lFZ1BMV0lPbkhxM3pIZlF0cWVsdzF2?=
 =?utf-8?B?eklCUzR5Z3R5VEFPT013R2htV2NnWDMvbXh1RWlXdmd4RTJyYVZhbldMREF6?=
 =?utf-8?B?ZEk2OGxGanJONnBSZDh5ajNXbHF6OVAxOUVzZDgrMGxscVEzL0RjcU1nbmVh?=
 =?utf-8?B?YXh4Yk0vSlR5TEJzQm8vRVZkeFNwSEtHVEdVUXJlbnJDdWsrQkRUeC9RN1Ra?=
 =?utf-8?B?emJZTW43L1VMYkZEZkdmN0twbm9NdU9Fa2EvdEkyZFVhYzNLTkZDQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca4d1e6-781f-49eb-b1f9-08deb004a807
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:58:38.1183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9PrDyRQ6T/3PJfldxTPPJmWmlxWjlSYiUvQW0wH/YWHicohRiRMBozFRVonrcLB6MK3brPANbg03f1G+qSRmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7603
X-purgate-ID: tlsNG-d62444/1778576321-AE55DFF4-D25A4595/0/0
X-purgate-type: clean
X-purgate-size: 6889
X-Rspamd-Queue-Id: 3687651D25F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:jbeulich@suse.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 07:32:20AM +0000, Mykyta Poturai wrote:
> 
> 
> On 5/12/26 09:20, Jan Beulich wrote:
> > On 11.05.2026 16:10, Volodymyr Babchuk wrote:
> >> Hi Jan,
> >>
> >> Jan Beulich <jbeulich@suse.com> writes:
> >>
> >>> On 07.05.2026 22:40, Volodymyr Babchuk wrote:
> >>>> Jan Beulich <jbeulich@suse.com> writes:
> >>>>> On 06.05.2026 11:39, Mykyta Poturai wrote:
> >>>>>> On 5/4/26 08:37, Jan Beulich wrote:
> >>>>>>> On 23.04.2026 12:12, Mykyta Poturai wrote:
> >>>>>>>> On 4/21/26 17:43, Jan Beulich wrote:
> >>>>>>>>> On 09.04.2026 16:01, Mykyta Poturai wrote:
> >>>>>>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>>>>>>>>
> >>>>>>>>>> This code is expected to only be used by privileged domains,
> >>>>>>>>>> unprivileged domains should not get access to the SR-IOV capability.
> >>>>>>>>>>
> >>>>>>>>>> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
> >>>>>>>>>> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
> >>>>>>>>>> for possible changes in the system page size register. Also force VFs to
> >>>>>>>>>> always use emulated reads for command register, this is needed to
> >>>>>>>>>> prevent some drivers accidentally unmapping BARs.
> >>>>>>>>>
> >>>>>>>>> This apparently refers to the change to vpci_init_header(). Writes are
> >>>>>>>>> already intercepted. How would a read lead to accidental BAR unmap? Even
> >>>>>>>>> for writes I don't see how a VF driver could accidentally unmap BARs, as
> >>>>>>>>> the memory decode bit there is hardwired to 0.
> >>>>>>>>>
> >>>>>>>>>> Discovery of VFs is
> >>>>>>>>>> done by Dom0, which must register them with Xen.
> >>>>>>>>>
> >>>>>>>>> If we intercept control register writes, why would we still require
> >>>>>>>>> Dom0 to report the VFs that appear?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Sorry, I don't understand this question. You specifically requested this
> >>>>>>>> to be done this way in V2. Quoting your reply from V2 below.
> >>>>>>>>
> >>>>>>>>    > Aren't you effectively busy-waiting for these 100ms, by simply
> >>>>>>>> returning "true"
> >>>>>>>>    > from vpci_process_pending() until the time has passed? This imo is a
> >>>>>>>> no-go. You
> >>>>>>>>    > want to set a timer and put the vCPU to sleep, to wake it up again
> >>>>>>>> when the
> >>>>>>>>    > timer has expired. That'll then eliminate the need for the
> >>>>>>>> not-so-nice patch 4.
> >>>>>>>>
> >>>>>>>>    > Question is whether we need to actually go this far (right away). I
> >>>>>>>> expect you
> >>>>>>>>    > don't mean to hand PFs to DomU-s. As long as we keep them in the hardware
> >>>>>>>>    > domain, can't we trust it to set things up correctly, just like we
> >>>>>>>> trust it in
> >>>>>>>>    > a number of other aspects?
> >>>>>>>
> >>>>>>> How's any of this related to the question I raised here, or your reply
> >>>>>>> thereto? If we intercept PCI_SRIOV_CTRL, we know when VFs are created.
> >>>>>>> Why still demand Dom0 to report them then?
> >>>>>>>
> >>>>>>
> >>>>>> The spec states that VFs can take up to 100ms after the VF_ENABLE bit is
> >>>>>> set to become alive. We discussed in the V2 that it is not acceptable to
> >>>>>> do a required 100ms wait in Xen while blocking a domain. And not doing
> >>>>>> that blocking would require some mechanism to only allow a domain to run
> >>>>>> for precisely 99(or more?)ms. You yourself suggested that we can trust
> >>>>>> the hardware domain with registering VFs if we already trust it with
> >>>>>> other PCI-related stuff. Did you change your mind, or am I completely
> >>>>>> misunderstanding this question?
> >>>>>
> >>>>> No, I still think that we can trust hwdom enough. Nevertheless we should
> >>>>> aim at being independent of it where possible. And I seem to recall that
> >>>>> I had also outlined an approach how to avoid spin-waiting for 100ms in
> >>>>> the hypervisor.
> >>>>
> >>>> I want to clarify: you are telling that Xen should not wait for hwdom to
> >>>> report VFs and instead create them by itself. Is this correct?
> >>>
> >>> If that's technically possible, yes.
> >>
> >> Okay, so let's clear this. If I remember correct, you discussed this
> >> with Mykyta in the previous version and suggested to put the vCPU to
> >> sleep for 100ms.
> > 
> > I don't think I did (except perhaps from a very abstract perspective),
> > precisely because of ...
> > 
> >> I don't think that this is a good idea, because guest
> >> kernel will not be happy about that.
> > 
> > ... this. Instead iirc I suggested to refuse (short-circuit) handling
> > VF register accesses for the next 100ms.
> > 
> > Jan
> 
> Do you have any suggestions on how to ensure that we accurately catch 
> the window where 100ms have already passed, but guests haven’t tried to 
> read anything yet, to flip this back? As I mentioned in the previous 
> version, Linux, for example, doesn’t attempt to re-read anything if the 
> first read failed after 100ms. So it appears to me that this approach 
> would be prone to racing with the guest for getting to the VF first. One 
> approach I can think of is to somehow swap the register handlers back 
> in-flight during the first read by the guest if 100ms have already 
> passed. However, this would still depend on Dom0 for registering VFs, 
> but in a more convoluted way. We also can’t add the VFs before 100ms 
> have passed and add timing checks to all register handlers, because 
> pci_add_device and everything below it expects the device to be 
> functional at the moment of addition.
> 
> 
> 
> Maybe you see some other way to avoid these problems that I am missing?

We could maybe do some middle ground here, kind of similar to what
Linux does.  The overall idea would be to put on hold any accesses to
the device(s) PCI config space for 100ms, that would include the PF
and any VFs.  At the point when VF enable is set Xen already knows the
position of the VFs in the PCI config space.

Any PCI config space access attempts to the PF or VFs during that
100ms window would cause the guest vCPU to be put on hold, and the
access would only be retried once the 100ms window has passed and Xen
has registered the VFs with vPCI.  This approach needs extra logic to
put vPCI accesses on hold, similar to what Xen does when mapping a BAR
into the p2m, and a timer to defer the adding of the Vfs and the
unlocking of the affected PCI config space region.

That would be a middle ground IMO, as the guest vCPUs could be running
freely, unless accesses to the affected PCI config space was attempted
before the 100ms window, at which point they would be blocked waiting
for the timeout to expire.  A well-behaved domain shouldn't try to
access the PCI config space either ahead the 100ms window expiring.

Roger.

