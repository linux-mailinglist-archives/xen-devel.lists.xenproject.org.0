Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI/NIlwcxWnr6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:45:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BCC334ABD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263815.1555648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5j9O-00015X-AW; Thu, 26 Mar 2026 11:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263815.1555648; Thu, 26 Mar 2026 11:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5j9O-00013O-7f; Thu, 26 Mar 2026 11:45:22 +0000
Received: by outflank-mailman (input) for mailman id 1263815;
 Thu, 26 Mar 2026 11:45:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1w5j9M-00013G-KN
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:45:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5j9M-00DN96-0Y
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:45:20 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c51c46-bab6-0a2a0a5309dd-0a2a45049334-34
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:45:19 +0100
Received: from [40.107.201.10]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69c51c4e-c823-0a2a45040019-286bc90a3328-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:45:19 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS4PR03MB8376.namprd03.prod.outlook.com (2603:10b6:8:328::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 11:45:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 11:45:17 +0000
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
 b=bqL74DCuOdsIK8HNuo3lfCoTzsaVlfGgIr6c4YE1FQZpt1rdUtX5ntpayBpczk1Ik66Ykq2+wv0LAcLcd5EX904/PySrDJ0tRgSBqQ7bh/Ia/J1gozl0zJlOUiK1rTzlp14ZmdvP/wGViS6yn/lpLrtSq7K4De8WAfH4c+JGGB7LGP324jNu92a8R7tTF2hCkWo0L2l0jYPrmUtwrNs/+0zp4InTr+rSbYCYuvWrJHBBvv26q4cYAQdg/uHVB3QoMEEdHtZSIr5+gWM6pBdmvxnR7hkmWiF75tF7ujPHea1sYYLHNGVLmiysbc4PSV46F3l6G7zWVDPuJ+jS1JpuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08pkUNNtmgv1oSkIqIP1vTUv/TgAPKfzbrl7ssQAttU=;
 b=ILiFVq4jcRgc5+Gdupxsf2ZXHNtQU9hT4XoF/SXgQMqeQb0JK4cpjSsu+7E0SkY0kkk4JekNm6fQoGK3nwxyfZ1PO964Yiz3T0axFYjzc0vWcQvSCrbco/nzV2fdnou5ppDuCL7BVTZDRwPyVj+SttBDLyihOeVwJCr5la9kpSeFIpSiT4MXR5eUU8J+3mRedk5OYJlXVmoB5nUV0gZKkG/WvYorcrGzBonLFouLCNaVA7s2jOjODc7naxiVAUJ8mxwfG08axUINWJzYg60IJhQWFgWu1N8Br7JJpClNuUKryFF3QWTdgOHdIVsa+E9gz3KksYUkwrATNc7+q+B5BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08pkUNNtmgv1oSkIqIP1vTUv/TgAPKfzbrl7ssQAttU=;
 b=A2Nik4cAk6FPFu8NBA3xadkruYsObBTUZyCIZ4DjhKRl92xLa3AAM3g3Lecal224lfOrWX9VAFIFVufyRm6fZPtabYv6qLPmjA9Oj46/zJYCYND8tbgSfWK1TrzLa/+y3IgOcK/RZ7MPhL00NA4CO/bD60UTwFrccX+LqXEbgvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <451fd937-bfa4-47cf-aa59-d2f60a04a6a4@citrix.com>
Date: Thu, 26 Mar 2026 11:45:14 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/4] xen/uart: report an error if the device type is not
 supported
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-4-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260325145824.31601-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0228.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS4PR03MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 566874f3-4f0f-43dc-d2a7-08de8b2d26c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EYiEyL9qGw1kEDjTvSM5lx6hf6H1WyQrjN+HUSH4k+001Ua5UMSe9tcRlXPe1CF1RHOsyMnozkdliHx7FW+ZMee5vxi35lf86krq+X7KSZzg/sZxaJPcH91//EeLuz+hUqk3zziiv1DlM4syInp24BvpYw3H4BlbX2WFQZIObWVyWYy11uMPwwv5ASbZy8KP5FYw/8l9WQnsZIDIeleMn0yTejNnFBKJblci1Mj6ObauyyyfCqc/Gl8/efPPxN6qfmmDM0lN9moDJSgOYMnYUG1Vx+LFvPNHGQ4Q7Dj9ej24eNppvWRVGGxEGqAZGLx/NZ4OGe3R2sduY2aoCy+codIBngTeQjEdNjXdTXAZ6QTYWN7c5nj+O+PVP7JNn3N2XS2xjCT/sTSZluJmG9rRUDOGeMRMvJ9ZcXePL43yscRZWFzUzvLTtpARF/N1KF1bjAS+hTXIwAYbJP+iu8fAjSdF01P1APlrXt9o+pBzoZMpwGLEEZpP7Oo7m5vW3r3FF0F199dbpFXBjCygrL7b+GNecbPfNbxtM+H7Mde+Nbllk2yzdsQ/3wkdxmkmuN6tptsWUCRxhzpfhLxSCeWjDbkQPu7tGRcbGcuMeoK1/LenDyZvIhck6WTDFGny5iPa9r6VoiL6r5Q7EO/oPf/2sfk0sWj1FXjwu5Ze7V5lr48xGLwfHK63DuCKimJhVNMMzp43kbT9/m6hn2GfQvsorojpf9hdrYjKjAyoxpSyvG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0hUMFIzaVpKbVp0elNubk9RQlg3S1NyYXhqNTZFMmJXUnRUMWV6Rm1yMGJC?=
 =?utf-8?B?blFra0hMMTJQSTJNd1NBK0JBRlA1elozbC8xeHg1RG5sdDRha3MvU0FSMmM0?=
 =?utf-8?B?aXhrellFajZqWjBYODFEeWtqa0ZjUjUyckE3NGMwWWpDbEt3Zlc2VC9NL3kx?=
 =?utf-8?B?Rytza2l1QnRkb2xTRExRcFZHZXFYZlhNNi9FWmRnWUlpbThvb3V1SnhEWFZT?=
 =?utf-8?B?eUliQ1hvNVJncGliWTd0QjJmMlVTKzczY254UytkSjNISTF2dEFQdjRaUlZN?=
 =?utf-8?B?VzhRZ3FaRmxSQkZodmt5SnI5dy9RVG5QcUtsZXdkanVPNEI3YU5VOW11OWhS?=
 =?utf-8?B?clZhOXBoekFDbmE0TzdkdFpIQzU5cUhHTkhuWE5LZnBDOUhVeUQ5WDBJekpN?=
 =?utf-8?B?MGdDaUIxNmdCUkVINU84a0VTemp6UFI1SHNQRDRzUGwweGZ1N1JHdUl2a0RO?=
 =?utf-8?B?NmdKQUFLbGN2MXlNTWRlVjFXcmN6ait1SzlIcVBZQSsvMWxZOENCMGRvdW5l?=
 =?utf-8?B?MDFVUDY0YXZVSTVUSlVzNTFMRWhLbnNqUnhRVFNoTVV5Vk50ekRwMTdjeExr?=
 =?utf-8?B?UmUrVmJidmNqOUtiMzdvVkFNWGJJNEt1TFpoYXJFTW12Q2Z6VHRjL2hRRlNI?=
 =?utf-8?B?VElLeDJUSlBUa3ZZRTZvZUErUnc4ZWwwczczOEcvcUY2MElJR2VjL0ZiS01G?=
 =?utf-8?B?cnhYaHY2dWdVYTI0M2tMaCtROVljaExGSEZVSE1rbTl6a21Bc1picHBFeC9Y?=
 =?utf-8?B?V05VMWR3K2VvOWNOYWtPLzgrU1ZLc1pIK08xSXBlNmN2cFJJT2R4RkdqZ2JT?=
 =?utf-8?B?NTNBeHlENkdMcmdjcUlrN0hySk1icVNaNWIwby8vNDVyWlJrZStuU0lqalli?=
 =?utf-8?B?aEp6RnhBOTduRjBvbEpvalhVNXhuSXJPZkNtRnNnMnRVSzh6ckJmdXhMKy9X?=
 =?utf-8?B?VithNHV6MWRwVks0OG5mY0M2RTV5Sm5ReDBWd0sxVDlqMlhEWkhxc3lsSWlM?=
 =?utf-8?B?SmxhMG01MnZrbHowSkltdjlTaUlDNnZFdWgyTzZwd0JpMVkwRmpvUXlGTzln?=
 =?utf-8?B?dFdBM3VNOUl1Nnl2OCtXOWNSN3Fjajk5NVFzMDQ5MHV2eldxaW5FV2VZYmtk?=
 =?utf-8?B?M3RFWHZSWk90K0tUOWlaMHlBdlQwRk1MdVVGTmZ1T0tpWnFTd01iUkZGcGpl?=
 =?utf-8?B?RE5DMWxiRHV4TE84VGxIR2t4VUpBUlBzTVh6UFRpQy9zZXJvdkpVR0o0eUtr?=
 =?utf-8?B?Wk5LUDRDZWJiUTVjTUJPWmtoZk83emNyUktpWm1WTkNUNG5wb0lMUHZxbC92?=
 =?utf-8?B?ZXRXbTNVMU1KalM1N1NsVW9LeEI5V3ROWUx2YzBlaXBpZXFTMy9yVUVYYzNj?=
 =?utf-8?B?d0VyNXJMajdDSForR0dLOXJxV0NIUDlEOEFWYWR4OUNjUDlpdCsrMHd4QmVD?=
 =?utf-8?B?bldzQWgrMG1JWURHcFh4ZWVlUjRMdXd4TEFmc2l4Mmc2RDlUTEJCb2lOUzM4?=
 =?utf-8?B?NGZYZjZubXNNbWRtMEpIQzdMZUpqSmQ0Mmd3VGM3eERqT2NrRmNMY2plVE9l?=
 =?utf-8?B?Yy9CeXlwWUtZR2JFK1huZ1FaTEw5N2NrV2xyTm1qSThON1lHVjJtT3UxOHp2?=
 =?utf-8?B?czQyaTRYWm1oK1BhczAxbUVDUjBab3N4Vk1UcWVKWTlxU3lhVXp3ZVcxbm1P?=
 =?utf-8?B?eE8rNEpWOXFKYi9lWVFuY2ozRnBFNUZla244dFFwR2ZLbkZTZ2sxRndQakJM?=
 =?utf-8?B?c1duckhZK1RlaVBXWEhzNTBtTkdYSE9BKzZFRXBGVzY2S1RDTXJFVHhGdXhh?=
 =?utf-8?B?ZTdUUGEyV01pTm1VSzJ0L3ZlYjNXYUlyNmQ1V05zWlBNSmg1cFBzM3FDMER4?=
 =?utf-8?B?NExRSy9teXRPU3lMTWpUelJPOGFTMnhvUXZXWGtMK1dlbEFnNWoySFkwTHpV?=
 =?utf-8?B?bnRkSEZuM2FNcm9lNXRWOFFzU3dvVml4RDRHbVdHT0J6Q2x3MWp0RWJDQ2py?=
 =?utf-8?B?aDN6RFpmdUVzUmJ5VnVzVWduYy9PU25vT0tkNFc3c3pRKzQ3OE1WRHBNUGtz?=
 =?utf-8?B?eFVhZzFCdW00bDNDR1B3WGlvZHpUcktZZ0pianJrUENSTVVYRUZEZC9wQitM?=
 =?utf-8?B?S3NpT3N1M0JaallYVForbnh3ZUp1L1l3NHd6RnRLd2lRNjl0cVZxeFkrWVNI?=
 =?utf-8?B?bTNtTys2QllUQWc1OTJ4QkphekxCancwVzBUWmErWGhKZVgzK0hobFR3NGZR?=
 =?utf-8?B?MUdObE95T0ljVEE4TkQ4akJaYkUvbHQ1V05adkpLVTdOUW9mWEpDUlV2Y2tv?=
 =?utf-8?B?b2tqZ0FTTEdyTFRlKys1ZXhjVGhXcTZJeFdtTVFFaVNpQ3k5b3lYcENnaWVp?=
 =?utf-8?Q?DbnIL46Qct/sfGxc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566874f3-4f0f-43dc-d2a7-08de8b2d26c4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 11:45:17.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8h9GyyQr3dDvZHK70Y11nkxFfxn8tsQAw67bMeDrM7SYcYZKFLzR2D14U3SYhVQSd4Vrt4y3526baWTLIMZcJUZenCvn8VHV6U9wnD2FzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8376
X-purgate-ID: tlsNG-ebf023/1774525519-B309B9D1-A62481E7/0/0
X-purgate-type: clean
X-purgate-size: 356
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 07BCC334ABD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/03/2026 2:58 pm, Roger Pau Monne wrote:
> When using key pairs for the uart configuration (com1 and com2 command line
> options), report an error if the passed device=<type> is not recognized
> instead of silently ignoring it.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

