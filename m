Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG9iN9Adn2lcZAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 17:05:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6D119A398
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 17:05:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240902.1542146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHO8-0000aa-0I; Wed, 25 Feb 2026 16:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240902.1542146; Wed, 25 Feb 2026 16:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHO7-0000Yq-Ts; Wed, 25 Feb 2026 16:05:23 +0000
Received: by outflank-mailman (input) for mailman id 1240902;
 Wed, 25 Feb 2026 16:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9A=A5=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvHO6-0000Yk-4f
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 16:05:22 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c86a5f03-1263-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 17:05:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8153.namprd03.prod.outlook.com (2603:10b6:8:281::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 16:05:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 16:05:16 +0000
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
X-Inumbo-ID: c86a5f03-1263-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHTowbhSclzQVxLkGY7zFiksPwEr209GfMdI9ZxA0QSBzlgxiEIY08Z6k6zPlKN9jrjmyvU4qe7zfJxLjznLYhidx6qHDz0Qb5nvct1cLQK7f31Z2cH4sNOwuoqNoIYG8zlfUctdpnYhAgL3nKIKkHLhJKhoWe4eWP9p7mzDoRqM1X6zYxzOZXuRsH0SX0sgyihQeXs9g1pWEPbtSwq6AQQbYNZNdLA1fxPoUKFcNoFuu+n1p5AXAzCgImozIy7eHPRfG3tFYlJF6npbkQe9KZK3GKcGSrQ+F1G0r9Y+Qo9HzKIFUfbBQshB4j/72J9fcQW3eeCPM7F7ZA51AKxUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4pjHcQCEXlE1hsG7aVAN1IQGSVFjDbEoRBjVgBkl8I=;
 b=g4ro7OZ0Rj4dbdMkh36ejojD2dsS4kOXfWCzZc55HnSuAHap6hR19hxysSaH2PSyHtSveBrbyUYXokcs7MwnsI4ZI/uwjKv+l8NJXtpiqE3OVyfuQNJ651cAuDWZZ7Aq4h0K3qvHhSzPn3oPxGqmZvJMdRYPPc5QBZDJU8lnovJV4nvOaMl4VhJ/ysF+b8SzGpR2QU6irti5UZjs4CcnDoFgCADquKDy4LZG7tQOK2Fq8lghBlVjjL3QJ/tYwPqECV9Cxt1MMNR7rMNZzwEUUUqo963FkHJjbBJaMkHib0HPre0/YMfMS4vd+26zHpWFAXYqro5pAhW5aib2+hXNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4pjHcQCEXlE1hsG7aVAN1IQGSVFjDbEoRBjVgBkl8I=;
 b=vPHN3OxG8J1j3Vw3W6VlBd9NdYy1dqnPhmXuikuxNrNhBLv+TZCr2VwuV88IrxcDLdwOp5e0BBedRWCUzyNbKO/gHBjJO2pvvH2Ac1VoNbP5dgdeXsLU75w44Wu0+CxFBq5InyD5W1+nnhT5jmTcwhmpBnSSKg2qemJgNE4G7tA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <82bbccff-fca6-4256-b228-88fc326cf5d6@citrix.com>
Date: Wed, 25 Feb 2026 16:05:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 11/12] xen: Bracket uses of macro parameters
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-12-andrew.cooper3@citrix.com>
 <a917dc27a7fba87a8f829558444545bb@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a917dc27a7fba87a8f829558444545bb@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0037.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd5a270-94d4-4bdb-e7c4-08de7487aa9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	0hXuDFn9Ar6K6AajoExZKWG8/uAwm/wxqhk33GQ5/gkMr8wnTP9NS+cdRynkIOzdK17MswLzozyYUPmXAcCb7o8n4yxWJGCV6ceBYfaVrFcxs7dyg9fiH6kYEwLgXqr3pmdgWfsT/RVcHZUaSAfBy1RhK7HRv+2gr702eTH2zfRKgCJbVnU0xpHmtcU1xgnYg9xWZl8gO304lq8/cQIukwlVwc6wGIdnOznJOilhxcFiXmDWNhUOsJD+UGVsmiLZG6lPH9y0uK3NvmtoX2Xmxen0nRe3Ov/choakGhhfG9tm8hhTfo5yzyXdIlZ34MThVUc4FGTKA6M7miPWCdwb0uLeUMjmK2QmMlibqkN3Nlhjb2vXOeWre1kdaXP5dfCF4MlJp98RtE2/aCmdvhhcoKJir8gs+CpwyZMM3xPqfzViV7yrlbLvxpJQIvziVhMuhFl4yfCa6x10cwCurrHVH1HbBBm3kCgjeFlaMDVhDCHHxKRz1+sJLNvUcaqFgaoUboBuJE+/6Nis8QCPtXTPG8SwWPrCpqq6EtKcJGKYIbbg/SR669JCHCXI899iXv/XNJPlW9s4DvOdQsZxTM9lE7ok3GB+4UQjo/F2H3Gm5uHSo9+hEUeIcQTkJNAqxP5q/9nPuW4v98RfFJnh+27Jx+CMegYS98HU0M5MGMRRvpUYbppxkeFowg7FDvDrzu3CFThZFmS2lri7vnBIjUX2QuiFaLVcGksopWMIfn/BOLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2ttblVFcFMxWVJSWHFCVG9xa3lxVlQzMFVPVyt4d3YyVmVqVGFhV2FVSnFO?=
 =?utf-8?B?dVlkT3FZOFlET2RXcFNIZ3l5THlCUWowU0VoMlVaWmIycFVPeHFVVkZhYlds?=
 =?utf-8?B?bUhnYi9aTWhLelZ4N09QSG1nU2VDSXNoc3RYaFl1ZnRaanV4S3Q1TTkxb1hL?=
 =?utf-8?B?RllhaXFicWh5QUZhbm9aM3NaNzF5czV6bXZhU3FOM1lMa0tqK29hV1BGdUIr?=
 =?utf-8?B?RWdOVUJsekZiRWlwTkVDdityQjRMQy8vc2lMN0dQWUtNV0pWTFlzZlU3RmJG?=
 =?utf-8?B?SXB4ZnQxa0prVG1zWHB3VXhnVU1rQ1ltRVlqQ24rSTZmb3o2Z29GdUFscmI4?=
 =?utf-8?B?TnkwV1RwNnVucTVmUWZzNlBaVDI0S2dVbVgzNTdHUGxhRnFmRWFiVTdtUzZC?=
 =?utf-8?B?WTZkcUIxaW10UnRkOVYzRXFtelNpUVI1TVlNK1hxNWJ5MmpaZDlyaU1ucDdt?=
 =?utf-8?B?TVo1MGN1dnJrbHdCK1dqRUtlM3YxWGVnbldWbHZFMmJFOXFWeU1nWklvYkRH?=
 =?utf-8?B?UHM5V0dtejFOaVNRNW8xcERkUGdtVnNtN0Q1OGJodUhmTktoazhua1Q1eTNM?=
 =?utf-8?B?MDZTS0F2cVJsZmFmOHpxbVY2K3FEQnRHSkZpaFliU3NTOGY5TDRaWnFvSXh1?=
 =?utf-8?B?bTBidlBBRnYwN2dZclFNK1FOeS9uWGNya1VSU3hSc0V0b2pPUHZzVy9NQzc0?=
 =?utf-8?B?VkNoOVVUdUtlOGlzdWFIa3lQVnFqSDVPZ3kvRXNtanlGSElNNkJsVjh6em5m?=
 =?utf-8?B?VHFwc2liMzRuakZIN2lsMU9GaFBtN0dwUFkzejlPc29lMm9LSG9yVEt2bHpE?=
 =?utf-8?B?Mm51OXBCWGxyd2xkK3A2NnBHNDMxZkpVbVhJN0xCcnh4bTBJTnRoV1FtRE9Y?=
 =?utf-8?B?VWVTTmNJd0FTcjkrU045SE53MTJmVno5aDQ3VytyYzl5SlhscUY0SjdBL0pz?=
 =?utf-8?B?c0twVDA4ampWRml4MTBYbThBb05hT2wzeER1MlZDelB2bkNSbEhaN0FxRkFI?=
 =?utf-8?B?Q005b0E1citkcGd1dll6bW85ZVNpZDlZSUFLOUZQWEk2RU9nWmlkMVVvQXlI?=
 =?utf-8?B?d2NyNGNEYXpaSE5PRHRCMDA0MGhZeHNWSkNxWnd6b05CRkRqS1gzVE9xdk1V?=
 =?utf-8?B?Ry9WRnJzZHA3a1orbm5ETW5jQmRGSlpZbzBzMzNMeWZTSklIUnE0QklnK2s3?=
 =?utf-8?B?VnBPYzlWOFp2aS9adDdqejYyNlJ2WUxIQ3RNRFJBTmR3dUJXNGNWWXFtNGpR?=
 =?utf-8?B?WW4xOWlicVNUM0YwM0xxKzBvM3FTaE1rSTc2TWxVUFZhR0pRMldyYW8vSjhh?=
 =?utf-8?B?akNsNHRKbVhXWEUvbFB0OUFJTzhLbjBqVENnOHFVTEZaVGZYbHBvelFlc1Q0?=
 =?utf-8?B?anFLVUZ0TVRzTFBrNk5SN0Q3dXlpZHhZU0FKc2YvKy9oQkpiUUU0cTBGVTVC?=
 =?utf-8?B?ME5DOVZQZXZwMmFwQnBJUTFQQmJhWG5HdDc5bzFVRi9ycU5tb3hYdmtuSTl2?=
 =?utf-8?B?cXNwT0svOVRaWW80OGxSb21tano1STYvS2M0YXltU20yMS9oT3FKWG14eU5J?=
 =?utf-8?B?SG41UnM4alM4cm1MVWV4MWpFRzJjcHpzVmgwd01mclF5bm40b0tBV0V3cVVK?=
 =?utf-8?B?OWFGaUpNSytQVFpXTTNiRWV3NGZxRkd4UzVnQ3g1RFQ5ZTh1TTZYWVB5b2or?=
 =?utf-8?B?K0pIYUYveVZFZ21kSnZvdE5RenJ3TlZ0M3BKMnlramdwVlcrVDI4TmRKbVZZ?=
 =?utf-8?B?YmRSa2VUUXV6d1BQQ2xPM2wyeTVBbkNTZkRiNklKMDRkeisydENCMVpsLzhU?=
 =?utf-8?B?RlVFczYwTU9xdjQ2QWsxcW12cmhaQ3hxZndwS0ZReTVEZ0pmaHZQdlE0OGJX?=
 =?utf-8?B?S003bE1tLzBiZFRRUHl6Ny95Vmg1d2FPZ1Z5cVlwR1ErUW5DTDhTekhYWGU5?=
 =?utf-8?B?b1JOSVJnbEpoMkk1a1JiYXZkUjhwSTFiNHJjYW50M2RFVjRKY0xIWlo2ZFA0?=
 =?utf-8?B?bWdDTUFjdElMK1RtUTh1U09FaGNrZ3k3UnhGTnkzK2RQK2tQU0p1ZFRZeDAw?=
 =?utf-8?B?ZjloaTdJdmdjY1dzZXNBbkVEMFp5UDY1ZHl2ZnJRZnUxckpPYUZyMnRuWllM?=
 =?utf-8?B?RjJTTDNMZ0tCaERyazRYNlRFYjNlZjR0Y3lJeThUdk1hdXN1M2xhc2ZWNkps?=
 =?utf-8?B?cHg1MVBCcEgrUFJIVHpialhWVkVSRE1OdU42d3lzdTdmQkxoV0Q5eXBVUWRz?=
 =?utf-8?B?NXdsa3ZSbkh4SHE1UmJVUVNXdStjdWU3b3Y0SC9SVnl6MGNpcWU3YUVXZVVk?=
 =?utf-8?B?TXIyYlJuQjhuSFBMNUpGQWFWVGpGaTVDbXY2WStJT2pBRkpuZ05jZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd5a270-94d4-4bdb-e7c4-08de7487aa9f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 16:05:16.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 246Eqddb2hDfIuiPxZhWFT1NNl7fEpR+EnsL3qfBeH+VgmYSemFcWPE1/K2ifyB/wN/vuOeXZeqqLfTB9glb4+ktX8v6fjKubxxdeYSxg7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bugseng.com:email,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3B6D119A398
X-Rspamd-Action: no action

On 20/02/2026 10:45 pm, Nicola Vetrini wrote:
> On 2026-02-20 22:46, Andrew Cooper wrote:
>> Fixing Rule 20.7 violations.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks.

>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
>> index 7446533c8cfb..63473925cafb 100644
>> --- a/xen/common/livepatch.c
>> +++ b/xen/common/livepatch.c
>> @@ -664,9 +664,10 @@ static inline int
>> livepatch_check_expectations(const struct payload *payload)
>>      const struct livepatch_elf_sec *__sec =
>> livepatch_elf_sec_by_name(elf, section_name); \
>>      if ( !__sec
>> )                                                     
>>                    \
>>         
>> break;                                                        
>>                    \
>> -    if ( !section_ok(elf, __sec, sizeof(*hook)) ||
>> __sec->sec->sh_size != sizeof(*hook) ) \
>> +    if ( !section_ok(elf, __sec, sizeof(*(hook)))
>> ||                                      \
>> +         __sec->sec->sh_size != sizeof(*(hook))
>> )                                         \
>>          return
>> -EINVAL;                                               
>>                    \
>> -    hook =
>> __sec->addr;                                               
>>                    \
>> +    (hook) =
>> __sec->addr;                                             
>>                    \
>
> This is not strictly needed, if not for consistency.

That explains why my first try didn't succeed.  But, why is it that only
MISRA only cares about bracketing for rvalues, not lvalues ?

~Andrew

