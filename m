Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOncAvgaoGmzfgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 11:05:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA771A3F18
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 11:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241364.1542419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvYEK-0000Ix-Ow; Thu, 26 Feb 2026 10:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241364.1542419; Thu, 26 Feb 2026 10:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvYEK-0000Gh-MA; Thu, 26 Feb 2026 10:04:24 +0000
Received: by outflank-mailman (input) for mailman id 1241364;
 Thu, 26 Feb 2026 10:04:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEVl=A6=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vvYEI-0000Gb-Ei
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 10:04:22 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84b794f6-12fa-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 11:04:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW5PR03MB6907.namprd03.prod.outlook.com (2603:10b6:303:1c2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 10:04:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 10:04:17 +0000
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
X-Inumbo-ID: 84b794f6-12fa-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi3O9KgSErvlxmQlLGz/F+BGFY5fIdtb6SPsAZTzkch8xPhvJOdIa4/LtvAUMbwDsaqymLf+Rc7FS+oXO6MV4HPsO9UsFost122/pJm3JsuM88fuFe1NeRcGd9tismlUfhy4Wuy43fX2avpqVEhmAjlBg05yLasamJxNhp94WWZ91Fqvg6ydWAYtKgNxMWoulSLgwrN7KzaFoKt3DGUqYEjUJltqtEwjqkNqxo/wCxxlv8uWmjxhYmVCiEDWxm1WN8a1IWZKfbRsa8hUJgi6XLF8UqgJ+IGLzn9A0hKx+HA1lcUSCHj5m6b3KDueRNfDDO/l1Q40taxS37rpmWiHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nur07DrxjgT6QdN0xBW6YHYrP4RJX3ZYILLg/TEeCM=;
 b=GBNrnwDPMB5/Un0AoNpl2qA01hiZtcq6odlzmHkRW89Wj4nThrX5fqbElXqOr4ay2zWvryEp6hKTlsmGU9Kt0bKWQ7e6in5N1W4OmviigCDTRRgeN53ixYw3WVShAr0ET+rQSIKQOvSCYG+vsUQXe5X9AFtqynrTFJ5wzIM4k8sc62YV187cNBNlaeCY9jCCaAFT8FYJ5GHMYHmwnzRak8W9dsNb71bvymv3u+GxGkqkgEmlPEKLuLWXAcSALmKu8E2wbbdCP5CF0KAR8t6ZcrWU9ICDMZmNsI2dK6HHQlReLlYzBY6GfR6LJOPEMGUOu5r4vupfMxNeo+hFYOLFcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nur07DrxjgT6QdN0xBW6YHYrP4RJX3ZYILLg/TEeCM=;
 b=iH8GsxwjYJm/VpgsDEmaJmk8rWvVp0BQ5B857vx3Q4FCv3Yg4pz3tfNVhkKSF+KyxXuPQuC9P8AS/SORyPCphMoQK/VwMacD07oZuDs2xXkg9RAxM09X/viPw+NBK1zwmApJgAcKIErI56gzGEatDTL9r7Fv1wtHggj4rCNr1Q0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <51685aba-2a5a-4b59-9e78-913ed20a1adf@citrix.com>
Date: Thu, 26 Feb 2026 10:04:13 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/shadow: don't use #if in unlikely() invocation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f11a57c2-662a-453b-86f9-b10c489aaa90@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f11a57c2-662a-453b-86f9-b10c489aaa90@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW5PR03MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f17649e-350e-455b-08c4-08de751e66c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	H1DlClLa9/bO/gfMWWvS3FayM/bSUPy1rD8dIcVVIldy3BOJ33yZcQqLRsAF0WEl82uL2+6OtymZvMEcbn7KVHkrmIq7WZJ5CanqWbRgjzZC1JX+9FHdPcfs7R/6SAUjDZJ6JdOVNSjJ2UTHF88/zjffJX36TPFs8/MXoFbFmcNHScgZoZSzLbj6cBQIw2Ilqkw4SoN5dwgspQU/BC+UNRAHzRimRpFoW05OFxg3vgTZ5VW4zgJ//88r69BVBi2xKZrq1Yqgp2ifU6/cvWM4edWIMurISsbrtjBIQoOhxtGQi0TQzfy1bRUhAXVGGUHSDMsp4+hfozai53A0bSRRqJGPk8YJjTI+u6BDrb4TDsgARxlXMpzSVSq3og/i2I14kHeRJSy7zb42jV39ipi+xAQYCLlfN5bz6qB+eEK8nIDeShkxrTZS1jIM+XnxBwgQ+NSrUvNmPdhoVbMFfnw5aOMAy8mkP8EEbuWsrKv8tams2G9PSy/H08WJq7uzY+WPFK1oHNDxBUkdBWyZAaKdXczpXL7Lp6OsP3LFccB6MnpIavjDE465H7fs+Zg2EcbgC2k3OszB5dDrA0Wre94Y1d6kxyjgRBaeBMYF1u5TTdXI8lMZCbpIuvdlcFtQohiyeX8FaDaMbYWJdPPFf2Nr/w6FKeoLrcqsCmBeAYUJ/T5zPlj5raXgnLFMa8JTk+gQ0QD5OlLCqeL9wh+17D2eVxKwxeDYDRSGETuYK6IqrxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azEyakRwQmIxQmMrNFdrcHcwWi9LWHNOUUw5cHk4M1g1eE1RNytzVUc1bitk?=
 =?utf-8?B?VDV1cVJYY3FqeUswR1JzRUVqbHZtT05XODJXRSt4SndSSnFQZ2R1aVRjY0NL?=
 =?utf-8?B?QnFzWmRmVlVwNVZLeHBDR3ZCZnFQV241L0ZOMjRKYzFxdlB5RDVwb1FhQzNl?=
 =?utf-8?B?dXV0YUxEQ2xxOUYrR2pUWWFXbXVibjRPbnpTUHlhUWI4dFB5YTRBU1VSM3RX?=
 =?utf-8?B?c05vNGNlS1VSR2tNT1Y4dk9Hb3I0OFpVK0wxVEtVNXM2Y3V2U3pvVEI3MDVQ?=
 =?utf-8?B?ZHdYUGJBM3JybGR5R0crZTRwSDdOYnRCdzRSdGZJdFFRRTFVbHFDVmRLT2Jh?=
 =?utf-8?B?c0REVTAvNjBKZzh2YUlEdzBZOGxwTkZiQld6VFNuUStxN2FOdlBORTBnZHRP?=
 =?utf-8?B?S21vbzh0NFZPVHNxbnVkRklsYXhQN3E3b1FjdjlmYlFZcU5GZUdDZXFvQ2hP?=
 =?utf-8?B?TytZSU01TkZicUFFeTF6SUxwamJtZi9IbnFQenNhZWVPM2pvWG5vcERZbngz?=
 =?utf-8?B?MXJxVVo0VVMwaVRzVFYrN1FObG9EWVY4NGVmSXVKTjU5QkNwSjhvQ0Zuay9T?=
 =?utf-8?B?SGdkS3RTOE1iUzM0bkxtY0VBS0tzMmZCekFTRUs1aHRxRW53cnJYa29ieE44?=
 =?utf-8?B?UmpFaFExb1QwSkVYUGFseW5Vb3ZEeFV0R2NuZlNFVHdRTUdIZGpHTnNKR1JS?=
 =?utf-8?B?RzRXYlM0ZmRSdG0vRGZlNy9GNmxzbHcxcmU0eURhZTY2STViUlBXU1RRWDB0?=
 =?utf-8?B?WWxwcTNKNTZ5Sm5jMXMrL0U0NTJ3YmRqdXAzc2I1Mzl3Z2N5OC9UUXVxcjNW?=
 =?utf-8?B?S096RFVRaG9XaUVLQjFXTzErVjIvMFF1ZXF3YU1VWG5yRUJDdlhySjRCd1F2?=
 =?utf-8?B?MTJVNE8xSTRNcG96ZCtlUnNnOFp4aUVQMzJPeUQ2OU9Ma3pIVy8rUkZuMldN?=
 =?utf-8?B?QS9WcjBPR29HU3J2SnNhMThrN0JZQk1sb3U0Rkgwdi9ycU5vNHRESDBSOXFk?=
 =?utf-8?B?Q3N4V3g0RGNyMXhNNTJDZk5LaVFPdE9ScmpRMG5wSGlWdExkWFhaYVRLZ0FP?=
 =?utf-8?B?SE13S1NlSndPSnFvL1QzOUg1N0R3c0JnS2ovcURHZWE3T1BLNXA0UktlM0kr?=
 =?utf-8?B?cDBZSVFJNE5YMmtmRjM2THh5LzhWRU1GcFZmRXJyUjRpWWVtOXJEaVRoWEpR?=
 =?utf-8?B?bXlnY2d0aHRENmo1RXNZM09Lc0VVcDVqaUFWVG4yMTY1OHN0eThFSko0UTdV?=
 =?utf-8?B?WkpDbDB2TEFuMGdmM2ZwZmkxMmp5eWlLbVRsM29wZWk5SC9QME1lazlWQjBa?=
 =?utf-8?B?dzYyLytOZTlQUE9PTDlHelNkYk03aGxuZHlyREZteTVxTERXVkJpemNpK0dQ?=
 =?utf-8?B?dGxBSnZLcHhxb29CZUhpbVV2d2YzQXdUTUNRa0daOUdRbU10UVByeUh3d3NY?=
 =?utf-8?B?dkZRUW5TTThzWE9jMlkrZXBnT0xobTF3aTFrQ2V1SEFYYTBmZC9CZnFqNlgy?=
 =?utf-8?B?NmdlTnBmT21oVXhqQWFxMHRPZ0dzWE1sbnlUZDZKdVpUUDFiNVp6a1FFWVVP?=
 =?utf-8?B?T2dpODRWLzVwc3p0V0VONWtrSU5jNjl1RFdjbnozd1BVQklnbVNSKzJrWlY0?=
 =?utf-8?B?T25DcmpZS0lmUUNYMXhYR0tWWXNjRk1BNi9wM1ZnWGdDYjBmWHBqS1ExaTdM?=
 =?utf-8?B?dFRYd1NPam1La1Zzb1IrT2xJRTNlWXJoZGVLQzBOZ3NyK3RVUGFuTWxXWjlL?=
 =?utf-8?B?dGJFeFhNVEFBMmJzQkt4T1N4YXpCTlZmVzBKdUR1SjZBSzhmRnZGNStSTmhR?=
 =?utf-8?B?d3FRNzlVNXVGNUlReDVWMVZSYjNBQkNvMDg1VDRNVUdYc3EyS1BUdDI4UG5V?=
 =?utf-8?B?bEV0QkdCSmlycG5VQU81dDN6L29tN3JRUHhOSXdnMGE5bzcwdkRodDhDR21m?=
 =?utf-8?B?aGxzVWNZajVjU3cyQkVJbWg4NjJNV1oraWR3aDRxb3Y4Ui9BMHp3ZTd1ZHFY?=
 =?utf-8?B?d09rdk4yekVNNmRsUyswQUZDTmlKVy83UzFEVzRJZFlZcmJXSnliUWcycE5V?=
 =?utf-8?B?cnRnUWNmV0hVMldkK284OFMyUzVINUszcDJFWVF5ZW1WRC83NzFjeENHVEJz?=
 =?utf-8?B?UnBSVkFVMkpJTEoxeUdUOEFJUktsTzFubk5oMm9TVVV0V1R5a1lCd1RQRUh5?=
 =?utf-8?B?Mk05NlBrQm1WSm1CNkxqL0lORDh5M1dxQ2REV1FrYUZySDRZajgrc0lwT2xL?=
 =?utf-8?B?TERFYURoYS91ZTZiVHFZNjRYemxEZGlyRDRHKzg1cU5pb1FRUm02dngwVEpw?=
 =?utf-8?B?YSt6S3NoQXJFOGxMZzYzNVJweXF1ZGhBWEVTYTFBVERxWmcwZHBtUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f17649e-350e-455b-08c4-08de751e66c8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:04:16.9172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyNb/LRClIjpw496WJQOVIbBkQ9NbgxMGy++8TcTLowIjL1z5yoj9zVl/9i0CjEU23ETxxMafSCtK7xt/l9sCvWFBxpNiRMUFKG4xLZjh0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6907
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5FA771A3F18
X-Rspamd-Action: no action

On 26/02/2026 8:57 am, Jan Beulich wrote:
> As per the standard this is UB, i.e. we're building on an extension in
> the compilers we use (for gcc, see "The C Preprocessor" section
> "Directives Within Macro Arguments"). Misra C:2012 rule 20.6 disallows
> this altogether, though.
>
> Combine the fix with some tidying: Fold the two level-1 checks, adjust in
> particular comment style, and move the unlikely() use to a single inner
> part of the conditional.
>
> No functional change intended.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

