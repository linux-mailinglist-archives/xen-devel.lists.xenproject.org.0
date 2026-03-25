Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N9tDyoDxGnOvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:45:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CD328545
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262674.1555099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QQD-0000Ae-QR; Wed, 25 Mar 2026 15:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262674.1555099; Wed, 25 Mar 2026 15:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QQD-000090-MR; Wed, 25 Mar 2026 15:45:29 +0000
Received: by outflank-mailman (input) for mailman id 1262674;
 Wed, 25 Mar 2026 15:45:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w5QQB-00008q-VP
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:45:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5QQB-00Eyv7-BH
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:45:27 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c4030e-e002-0a2a0a5209dd-0a2a450cbc1c-18
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:45:27 +0100
Received: from [40.93.196.15]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c40314-f93d-0a2a450c0019-285dc40f2f01-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:45:27 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7356.namprd03.prod.outlook.com (2603:10b6:a03:55c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:45:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 15:45:17 +0000
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
 b=yUttoXpksp6qJa6osLtVUTMnfGespKX7rnS9x3dzFWhiemaJZCcAq1NQyUzucT+d8uaitC4xSudX3f2jnvciQ6jE19NC7VEnd32DRh6FW93CLPyv88md8JHbe+t2mFfhZNnWr1TN+CPSo1o2kiYiCKj6J5OW4Cuk/cWRJROuElnlBUB4x3/ntL0wRehbMCj+xnOmla1Vz8aM+TZf9S8zKcJEC1DptZLNNFwdloqbVjKAtvvpHr9SWyxyuao2opTOzUJOL1mswFJ+PwDrLkeglYpZ1+GIzZuvVgtgLBagessXMJiJ2CsdSBGbpnLkSTJpJh8cQqMvQfjjRNeqTvmjtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc2QDuvsxN8t5/jIo64cdy98ZNZAYdRd08s7dNyjEXQ=;
 b=KLnwJ7dukECD6lsTWHvsWPU1Rdj0QARc6Dr8A6477ca6hekQskt+hlFe8+NPlhyktFX3l1dS41wWEFMoWsse8oF1Qfgba0HZfn6l5y3542GAjsuq09qwQ6KAM3rNPtKME3vvlE3RvS+DDcwZ2XFxSErGgwNZuDbb480FLDlIyTungbRrqjIkBLQ87GbKM3FEnIoHSBN36ySfQn4Ghk728ZWjIul2H/RwoJSupmEnpVWVC43oZankXKG3Ext6x9ZpO4xftgsKxbk1s9vXwd59BERbmMhK94Gmcr7KKA0pwpYvgWTiWYSjQMnwk0J8Uz+1icOamJZCSocRe/v6sHRX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc2QDuvsxN8t5/jIo64cdy98ZNZAYdRd08s7dNyjEXQ=;
 b=H0ApaMYNclEc9Y7ZfGqvF6AbZV+WUSb+xlNHwXhFmWOPmcEH2DcyP34o4or4OvEC0Oj248YGlAFOjU74MtozD8xX+mHTHVVujU0loEECZJp1ichjxm9cpZBaeCzntqdJjJ+2QyDnnnSNY/v91fvjkHs96La8X5k1q7L9kEOMJYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d37e995a-332d-4917-aa42-15a5fec2d960@citrix.com>
Date: Wed, 25 Mar 2026 15:45:13 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Subject: Re: [PATCH v2] xen/sched: validate RTDS putinfo period and budget
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c629e66ebf05d620423babf1e4e98866c1f75357.1774452210.git.oleksii_moisieiev@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c629e66ebf05d620423babf1e4e98866c1f75357.1774452210.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0201.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 2871fdb6-8b9b-48b8-bcf2-08de8a858365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|7053199007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WrMX+epEsQslVC6HoT2UgCL/3+Nz48CHfcecd0n91276c0kjwLT/pv2EvsgoX2fMSH+9t5NRew7QdmysbeMUn/CrIbZOXjKXrq8hw0qIJomz6NqvqgReXY3SkkUs7arjFmv3QvFWcpQA03l7qQo3hTi1vqdWLfaBxvX3pYWHIOWMqOaheSeBHMqMhVS1fh6L7graaUfPzoZxQOSFbvTUucoO0HTAdzFhsRq12QhSrNQra/zytXC6ZgpNzWvv/5hLXMj1x5y9qiPlHx8Vp/PxKqI37Og2nJVb0SHg+eJsI24bJt93hyPpFqsJ8lGAlYmjrf26jPUQu9L5clHkteHjegDO6sB1vHIqjNpOK0c0I1w6Ps9BJdJ5KUkUG4zoY30DWUe9puio14x4tm+4Yq4YeRUCLrL9g4wgGNIlfAesZ/MHuTBUvfLYaUGRD78E9XJYiwpjUWy1Lz8oLaypsT8UYrO5wuouggcbBcfKVKhRkX6PfT4GiUpVzl7TPY5I8H/Ze5xztImlRrpK1NEJVA7ikpb2Jeq4Mt16De+lbfjDciMhZn6oUPpAYfhnxI9AY699/phDwZ8mcaHOMacxW0f4mMEqrrQT1mnU/NOFPAsgYeP5uTxDcnYwpgEtJgyq0mGtspeiaSXETPjg+YJKoKlzR9A03xBYGV7VIuAYPAyM19dhnc+U/BzCH8T5bSrCvUVO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(7053199007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjQxbHY5dnhTNE1RaXFtWHgzSUUxODJOL1dUdmRieTU2eXBFTWc2UHRUdy9h?=
 =?utf-8?B?ZWJEQjU3RG83ZzFSbXJtMnNQQ1pGT0dhamdkY1hKSWxtU3Y5VjVZK1hZQzhU?=
 =?utf-8?B?NUlWK29wR21FdVJmQ1E2Q0hERDRNbmthQ3RkcE9vWkZmWkxFTHc2UU9hRElQ?=
 =?utf-8?B?S3NXbXVrbVNvSThxZHBGM0k1ZnJwUUNzRGhIempoZjF4Ky9tenVrVlZCZjVm?=
 =?utf-8?B?TDRtTUx3TDYwQ0gveHBBRWhRK3VkeWpoUmZudFZ3b296MXBzQ2xPZFJpWW9a?=
 =?utf-8?B?MTRlUGZnaHlNeEk1SW9Fc1p6SWdwT01wSktEZ21xamVoQ0RJTHR1Q1ZyaWoy?=
 =?utf-8?B?S0p4TmQ5YWRYc083alYrRWlpRU5nUmNYeTYxck9XZVdoWDZraFFvNkJhZlhw?=
 =?utf-8?B?ajdKV0gwMDNBUTgrK0R3ejd0TitmM1dzZGgwanhYS2RrQW5xcy9JT2tiNWwx?=
 =?utf-8?B?ak82YkxxMGVHWWc1Wld3QVJMLzBzR3Y3elduak5qUGlHS1Y1ZWM0MklFY3Z0?=
 =?utf-8?B?Y1FBeVgvYkh3cGhjQmo3bDR0YmV0SUtGdFQzekF2NjJKUk5JeFdhOWhjNXIw?=
 =?utf-8?B?NnFvaDY2T25PVUpsSUFrV0xWeWRMTlBKQUszWXlkVzlsSGlVdUNyTG9leXFY?=
 =?utf-8?B?MnJhSUVkUXhsR2NCdlZkUGlvQVM1bGtZR2lCSjIwL0duVEorR3JLZk82NlN3?=
 =?utf-8?B?U3hDSkthNC9PZkZDaFlBWnlXZUVhTitnTG9SaDJjU0hBNWxWcmYvY0UvaUl1?=
 =?utf-8?B?YVhsTCtQNGdDN3N4ZWROQmtMRHV6WEhSdndLT2xhY2JDa29VZXAvbUh3Y1Rl?=
 =?utf-8?B?eStYTjdRNkIwMlNTL0RxNitZWEV6dll3dU9YaGhJOXhGZ0RDY2hvOW0vTGRX?=
 =?utf-8?B?d3ByWXhpVDBMclkrbDIrL0MvdXIySlFoQXBMTWpPbElRRE9nRzBvUU1GMCtp?=
 =?utf-8?B?NFk2ZDgzY3Q3NzZ0bE1CQy9GS2xwK0Evc2JwNVJ1YkdUdVBmMWxKS2dMdXBR?=
 =?utf-8?B?Q2VyZ01od0NuWEJrMk9JeEo0NVgyK1JDOWF4VG13ZWV6UkxvQ2JLeFZLQ2Fl?=
 =?utf-8?B?RlJ5MHpFQzJBNUtYdjFxbzAzUzlSanFCYVcyMDBxR0hucVllVUdTRldFcTB5?=
 =?utf-8?B?RHhrMlFoMzQxTmVHSGlYYkFSNnJsRlJqUFZNMmtFOUlSRTVmbHRZYkFPa09x?=
 =?utf-8?B?WkhuT0FFRyt3Z2ZuNGRNYVFya3l5OFVQaU9nMHlva1AvTEd0V00zNUtNa0Jt?=
 =?utf-8?B?WmlOTWxJUDMxNXNhVEgzT3JtS2czZVlVNnVXTXczRnlNQVE0bHdueWg0WXNW?=
 =?utf-8?B?c21ZN1AwY1lOTUdIZkFMZ1c2VjAvd3htTlNaUTNOTVA0YXdHN2NkVzVWY0tT?=
 =?utf-8?B?eXFQUEpGNFAvTWVwN0JXZEZRWGsvd29uZ0RhNDRiUWJRTHNzYUs4djUxbGhn?=
 =?utf-8?B?aEo5Q280Kzhxb1hGWVY2U0VocEM5c0hIamdPZi95dzFQTnJlRWwxTFd5ZXlp?=
 =?utf-8?B?MFBuVWozUnFKTUpIcHc0T2lCbEhrYU8rNHBPL0xTRU5oRnJwaUtBd0dRcFVu?=
 =?utf-8?B?STRwaDc0RUFtSTZTN2FxUTV6bmNXbnB0Uk9yZlN1YW1qNVVaT1o5YnhWNVFJ?=
 =?utf-8?B?WGxxNmpGdjJOUFVLMSt0NkJjaUFEajZNMkhyb28weGVqUEVtTDRGcE1NU0lR?=
 =?utf-8?B?Vm1pQkpFUWh3UDZ0SzNSOGdXQ1ZDWDdERlByRkN0NDJEbVNzQndISkxkKzlj?=
 =?utf-8?B?Qy9jZk4wN2NTLzcxekdFNlF3d2ZGMXJUL2JaQmRrZ2YzUkFYSFhsMzJNVWUy?=
 =?utf-8?B?UkZBZVNsV1VKVVE5UThYVlBOTEJOSnNteHRLZnVXSzJ0bVVjZ0s3Q2NJVXBp?=
 =?utf-8?B?NU9yRFYrNkh3YTBjMDFXYVUxNGk0em1YSXF4bE5JQk9ZR3RhZUtrbFkwV3VP?=
 =?utf-8?B?eEgrSG41S1NxN2R1Q1ZQWXI5RFFXbVUvdDJ3TDFlT29uczEyeTJHMnptTkRY?=
 =?utf-8?B?WlpNQjV2UlQ3d2MvOFRYWXlnWFNXUjFCNU5WQ3pMY0Z5Y0tVaWNDLzdtc24y?=
 =?utf-8?B?d3hBOEw2a2o1eHBCbFRsdFJ5bXJzVzdzZUx4b2k5S0s1ZzlmMUNuanJsWmxB?=
 =?utf-8?B?UnJDcHM4Nk5oaUlzNnhZZndxdk4zQnlQMnU5N0VhenVlSGdVSHdaRHVRdWM3?=
 =?utf-8?B?Wld5Rldmck5oL3YyRzltcVgxaTRFOGhSUzFsQUJlSVFaUmdhWU1IRm5wSHdn?=
 =?utf-8?B?VEtqa1ByeHlHMnFxWVhGalkrL0RTYnRJMDJ1U3BOSkFNTVIvWkw0Nzd5aGpQ?=
 =?utf-8?B?aS84M2p1MEpvemhWYk42ZWNiMG1TYmdia3N4bzVsOWpKNWw0WWdpakMya1E3?=
 =?utf-8?Q?uKJO+/+wtHzc8xmY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2871fdb6-8b9b-48b8-bcf2-08de8a858365
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:45:17.4519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfxa0VrXsljqb+uTpcJ5LLGRl0BXGi+AE9I79pnFgajJsaEQtlsY3/f14UlbhxP2qtBp9x+UavuEjWBUijb7xZ7bP0hgkS5cCiJJgKXQ3kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7356
X-purgate-ID: tlsNG-d25034/1774453527-6FEA3734-70A0E5A1/0/0
X-purgate-type: clean
X-purgate-size: 2202
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D9CD328545
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 3:24 pm, Oleksii Moisieiev wrote:
> The RTDS domain-wide XEN_DOMCTL_SCHEDOP_putinfo path only checks for
> zero values before applying period and budget to all vCPUs in the
> domain.
>
> This is weaker than the per-vCPU XEN_DOMCTL_SCHEDOP_putvcpuinfo path,
> which already rejects values below the minimum, above the maximum, and
> cases where budget exceeds period.
>
> Use the same validation rules for putinfo as for putvcpuinfo, so
> invalid domain-wide updates are rejected with -EINVAL instead of being
> applied inconsistently.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>
> Changes in v2:
> - introduce rt_validate_params helper function to check period and budget
>
>  xen/common/sched/rt.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
> index 7b1f64a779..645b091de7 100644
> --- a/xen/common/sched/rt.c
> +++ b/xen/common/sched/rt.c
> @@ -1362,6 +1362,20 @@ out:
>      unit_schedule_unlock_irq(lock, unit);
>  }
>  
> +static int
> +rt_validate_params(uint32_t period_us, uint32_t budget_us,
> +                   s_time_t *period, s_time_t *budget)
> +{
> +    *period = MICROSECS(period_us);
> +    *budget = MICROSECS(budget_us);
> +
> +    if ( *period > RTDS_MAX_PERIOD || *budget < RTDS_MIN_BUDGET ||
> +         *budget > *period || *period < RTDS_MIN_PERIOD )
> +        return -EINVAL;
> +
> +    return 0;
> +}

Code written like this is horrible; both to read, and in terms of
generated code.  Because of potential aliasing, that's 7 distinct memory
accesses because the values cannot be cached in registers.

You'll get far better code generation by writing it more like:

{
    s_time_t p = MICROSECS(period_us);
    s_time_t b = MICROSECS(budget_us);

    if ( p > RTDS_MAX_PERIOD || ... )
        return -EINVAL;

    *period = p;
    *budget = b;

    return 0;
}

See https://godbolt.org/z/W63TY8qTW

But it would also be better still if you passed op->u.rtds into this
function rather than {period,budget}_us separately.

~Andrew

