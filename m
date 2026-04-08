Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ+6GWWJ1mmwFwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 18:59:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC303BF35E
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 18:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276350.1561856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWEr-0007oz-K7; Wed, 08 Apr 2026 16:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276350.1561856; Wed, 08 Apr 2026 16:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWEr-0007nX-HD; Wed, 08 Apr 2026 16:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1276350;
 Wed, 08 Apr 2026 16:58:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAWEp-0007nR-Fx
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 16:58:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAWEn-006Qss-8K
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 18:58:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d68934-2eae-0a2a0a5409dd-0a2a450ce1fc-30
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 18:58:46 +0200
Received: from [52.101.193.38]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d68944-f40c-0a2a450c0019-3465c126c109-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 18:58:45 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8279.namprd03.prod.outlook.com (2603:10b6:806:480::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 16:58:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 16:58:42 +0000
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
 b=P7mXmrPNAXJ8EiFlIJx7sgJU+0DgA+k8f2QEMO5MO6fKh3Jk8n+zIqSrz2MdYHxhx5bqofZGWtkBa/D8Me3dgiEqg0j3hsY2e2BQh2aMN/8faE5/NpNzCX4DRD5l8WDhY980fY0JxILjUWzAstebdd043LFvx3H7JKylVbHub9vrcLiHsjD4mwrkkFzo0Muw7xnjl2ndpXRKlIvqAxKoPg43oGmrtlmZ4zMQnvVZBqPtOPIq7JS3x5C/qB8suX8hF3kj04jahMpRgipWQsR4X/R6XZavZuUxx7ETp/iOifj/1mszs1u1vdchIsS/VsdDcenwFg+WK17SM7ss2e/r/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YD1H3AF3dvMsrFdCPpttKDlO7I0Femin0BjKcMJ4GE=;
 b=OBSjm4c7au+O8q4XVl1jsq9XNyS672fIYuBKPm0sBTi4eJa9Pjw7YHMcNI6mkgCg/yxT+JkCoT8nhLuoRMiEFlxGTs1qR2j13e7CuX6LPdwyEaamCpa9Mrxowkj3c5HU/akS46L/ArtNIPieA7V0cGNmomVamRmEkc54NMzsJXqqZsCi3gtabwuS6RJ1qocJK2PN/Ksuj4d2XGoYMQJtVRTPsGw4pM6CmOzVR0EgR2w3qVYC1QjtF6nm9uB+zNDJHe0zkiNJSTJPgYyx7DaMFlLRPOMKOKpsHphjO+C62NzcSfVKO4e5wn/jRMwknIb9HoHV/Y0FMLehbSPtkhstCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YD1H3AF3dvMsrFdCPpttKDlO7I0Femin0BjKcMJ4GE=;
 b=Rf4OuJVPO4tdJ5gtDnYxV9iPI5/JkXgTbviLX3vD6Mj2nIzQPM2Uf97Eir3i0Qsrk7s6lmVVjqRPFdp8O5VX0WArxwugqj1wHReiWeT3Rh2UEBoipssKFz2xU/Naeqv28cpduEXPy0lfGHhWfLe+sRkP0WtKdMXizSeO7jsdKn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f08e0fbf-3570-4760-9977-4e99e651a3a4@citrix.com>
Date: Wed, 8 Apr 2026 17:58:38 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/3] x86: record SSP at non-guest entry points
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
 <de873764-c803-4f56-b88a-936cb948c382@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <de873764-c803-4f56-b88a-936cb948c382@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: e610da4f-700b-4a1c-348c-08de959016a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8tRVGCh4S56+EBLNuXfgOVt3YYnw/kVFg1j25qdwUo0svKm+nDVUMpRaC90H8v10DgM/rXK60clfe3roZ6VJSbxf3x0jbgzGX67rERevoVBjHtQc0E52CiMy3rhexAwdvGzArvPolwvYJCIApYi71vHakihrPkzoRJzTk4z1JepGK3OED+iEQYgXvX7aX597QkqCcfx3maBRl/Kb5XfX6vKiJI7RYYtzpd4vTY5BRs8csQd7UXpUayxaBghmyKe6SK5oNdzaTDUEAFjhbtg2VgsoviuOiE8MflFMjRzBBkouFLvkdxwXw9hFYCvW+HwzFtGwkRIns2G1Tee4sz5d8LDyI1sV3jzK/d9ntkitRMC1FkdEIFX5LFg+u9fpnfjzvYJImY23f/rRMJtRaN0FZVxCxejabb2jYWrTY06aWQ/Dmu979t3R6ICyeG2vKpJKCJTS0rw+xI5BTYYZMRc/hoJ5+0aRLrrNpNIoltYbw0Gfpq0qyatmLybasRBkjNo/+3AxXZ6RO1hyWtc+1fMTuf01LK1hOoKyf3SPAUs13xzMuyoBKe9c2wmHBbs1hfIFA9IVgo1fqttneFVBAtUCECRZdd63vKmUWWqegs9EC+IVsSnamohV8B9kZYhrX+d5Rw6FzUZIj/XaI95S4xP+jB3SISwSIKOmNxeoUMmEAFf+w1oXue9PdwzibUYl2oA+wM1KkMONqOftSQeaeWp58+OrTQ3k7NDHb6OFu/3Fdjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXJybm9WUXd1SWJRV0J4VW0wbXM3N0hJdVpiM0x5eGJMby8rTUNaUUlEQUV0?=
 =?utf-8?B?TGwyOUlxNC84dGErczhHcWZWZ0oxSVZwdjVSVllWT0grMkRaN1JMQjFidW00?=
 =?utf-8?B?b1dZR0VXSjE2YWEzSFcxelhUT2ptYmp0ODBTMmcrTUtIVUVuN1QzeUN5UHox?=
 =?utf-8?B?ZnZ0R0E4dTFWVURVYzRMWGFRcHE4QVFrelNHMkk4b3BNMkRseFR2WjlyTmNY?=
 =?utf-8?B?bnZXK2NGcUlWeklmSkh0K1crZnJrbGxQWlJyZUF3QlZmWC84YXppaTFaTVBZ?=
 =?utf-8?B?Qi9zWTN2TXhjanNoRmhsNkhLc1p1RHFrdU4yelZFRENYenB2NkcwUlU5Z0Fo?=
 =?utf-8?B?dWZwRkt3T2U4NytOYStUd1l0WXBZSStqZllabkFvZkwwMEVsNEFiRzVOZEg3?=
 =?utf-8?B?WkN1ZE9rTFFTc0ltUk1iSDhXZGQyeHA0MXFCZ1gwN1hjdVZQcDJnTmJodnQ4?=
 =?utf-8?B?WkZNRTFvekpqVWRxa1BCbXE5T2dTS1I4Z2x1RWhVZGg1TEhYUGZ4c3IwTDhw?=
 =?utf-8?B?Ukg4NmxXUXU0czNtZmhLeitRS1ZBWjRXSUlWOXZmZkZZZ2d2SStqZTBwS1VF?=
 =?utf-8?B?R2hqNW8xUG9OVktmZDEyL1B0VElMeEpscEpqbkhoNDU3cHExdzZCSDNxd2Nw?=
 =?utf-8?B?ZFpFWEJwNmhCOGUxa1ZOOFJrMjVPNnp3SmFwUElHeUc0TE5zd2FJRmFvVGJv?=
 =?utf-8?B?aXVlZWVLdDBrWnVJbDBab3BCQkpjQXNrUDZaNXVQd1hDTlhUZDAwMzRudUpX?=
 =?utf-8?B?SllLRnlYakJ0ZDlMc3NjK2Z1aUpRcDdUYTdibnlnZUJJQU8wRWZYV3ptbVVN?=
 =?utf-8?B?WmRua3FQMWhna3UzR1RaWnFKaFlBYW4xSzZBZU5vM3ZVQ0Q3eU9CYWdQRHJW?=
 =?utf-8?B?Vkg4YnFQbDRKSWpyaTByemUwMWV2STBQWHRSVmdXN1RHb1d2dDlibnNVT1Bq?=
 =?utf-8?B?MmNKQ1kvSXBMWDM5NUQ2UVdyMFBnR3BsckNDRDJTaFBFYmt1THQyMm1FNEhC?=
 =?utf-8?B?MURtNlNRSS9kSkxPeTNjS0x6a0pnMWpBLzVYUXQ1VzdTbUo5RDU5dFVTZ0dm?=
 =?utf-8?B?MENJaUlJRWVsMVJpYVowMVk5ZnpjMVZXNnhVNWlzTVNGcG4zQkhLT28rZWl4?=
 =?utf-8?B?eHBZeDUxMjdlSm9GNEJDbVlRMU9VdDBEYnFHdW4wR1Q2RUpsQUJDSHJXQi95?=
 =?utf-8?B?dnlLRngrVSt5SXk4aHJsekZxNVpkN3MyM0djN1hkc0MxVzd6cVFNRnV6a0pW?=
 =?utf-8?B?WUY1eVJkdVBPL2wzMjdDNHY0czhsMEZHTjNOWkRUaWxPTzJybUE2OUxncW1W?=
 =?utf-8?B?UWp6S2laT0JDOGphRm0xY3lMbXBMdTFIcmhkc2V0MUp5VjNtTW43UHVHLytJ?=
 =?utf-8?B?Z1lJTXB3ZDVOZjlRenZGaDJtNklSVERwWFY1c2V0MjFlRC9VZERKdDFiMXBz?=
 =?utf-8?B?N1I5SDFwRWU2MGpVSi9nempBNVI1Qjd0b0NiU0NyU1RqM2dQVm1sSEQ0enpm?=
 =?utf-8?B?VWc3Z0NMeFk5S1JibDB5aTdZdGxLVHhrRWZEeWk1OWEyellYaEVFUHUzaUJk?=
 =?utf-8?B?UHYzakY2N25ia21SNmRNdFl4ZmwrMzJVSlJtMXROeFQwMnB3QWNQNWg2S25N?=
 =?utf-8?B?cUFYSG1GMjlkK09qeXAyTUNQcUxjNzErY1AybmV1U1phSU5DZ0ZjOTlVaXMr?=
 =?utf-8?B?MlplTTlvSFlwbHRFOTlodkJUcmx5NFVweUxadmEyN3hxWGdjdHVqc2tYUFl6?=
 =?utf-8?B?dUFtbXBVMDROMlRZZis1djJ1dytiWmJWbGJLUkE3elhPaVZtR24zVHFLVjFx?=
 =?utf-8?B?K1A5Z2NPSkZyamlmdFhONHNDSkJhZVJncUNvSjFqeUFPSHorWDdoR04rWW40?=
 =?utf-8?B?ZjRoaCs2dVpNWXJsY1owUkpaUU1CWHlHM3Vid0tMOGtZV1IxWFJEbjRnLzhP?=
 =?utf-8?B?Sm1qQlhYODBoZXh0RmliOWkxcmlCWVJkWVpiYS91ekpHOGNacXRzeG54YU1X?=
 =?utf-8?B?dHBVcnJaRU5YN0Yrc1QzNENJT3B6N2lSWElpdkd4a3dQTUlIVlY0a2MxT05n?=
 =?utf-8?B?NEVxVEg2QWtJWFE1c1ZhaWU5dTlpMC9NS1NtQlFqN1JmRGdKekMxbnBIY3Vx?=
 =?utf-8?B?dWd5NnJhZncxMlI5QVBJM3lIdE5pZGxvUDE3R3JpTWRQOEJ1bmZyRDN6Snla?=
 =?utf-8?B?aHJYTmpnYytqS2xUbEloY2xpUGpBelBvdXRuc2tXOXIveG5jaG1OREVqc3lm?=
 =?utf-8?B?LzhZeFpJSWxpbE0rRUs1aHFTaGlwT3FCWnR4Uk9JSjIwSHJtZFVCdkRkY0l6?=
 =?utf-8?B?K2lkTkpScnJlSUhsTHArSUd5NzNIMzlQcmNzWDVycDUvMnluN1B0UEhYa3pL?=
 =?utf-8?Q?O01dA5dC9CZTYhAg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e610da4f-700b-4a1c-348c-08de959016a6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 16:58:42.2220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/Vjxa7MKGk77NeT8D6X7d1nqI7QKBfvfpgXGITaKWifiOVHeMbQExb/Vk8wzS8HpbCpes+atY+cyj0z+qLWHLOwKgf90kT7XYTJVirW9EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8279
X-purgate-ID: tlsNG-d25034/1775667525-A49BFA3D-B21CE93D/0/0
X-purgate-type: clean
X-purgate-size: 1969
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BBC303BF35E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 1:22 pm, Jan Beulich wrote:
> We will want to use that value for call trace generation, and likely
> also to eliminate the somewhat fragile shadow stack searching done in
> fixup_exception_return(). For those purposes, guest-only entry points do
> not need to record that value.
>
> To keep the saving code simple, record our own SSP that corresponds to
> an exception frame, pointing to the top of the shadow stack counterpart
> of what the CPU has saved on the regular stack. Consuming code can then
> work its way from there.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> For PUSH_AND_CLEAR_GPRS and POP_GPRS, putting the new field right next to
> the error code isn't entirely nice; putting it ahead of %r15 would entail
> other changes, though. An option may be to not make SSP handling part of
> the macros in the first place. Thoughts?

I have a firm dislike for SAVE/RESTORE_ALL, both for their substantial
complexity/inefficiency, and mixing of unrelated tasks.

I have several series trying to purge them.  I suppose I really ought to
try and finish this off properly.

While classing SSP as a "register" is probably fine, the ssp= parameter
(and particular it's asymmetric nature) is on the wrong side of the
"complex" argument IMO.

> For POP_GPRS, does it really matter that it doesn't alter EFLAGS? 

Yes.  The SYSCALL fix for one (reviewed, but waiting on final testing
before I commit).

Then the VT-x code when swapped to use POP_GPRS.


To take a step back, you say that putting it ahead of %r15 would entail
other changes.  What changes?

The resulting asm would be far cleaner.  It would be an rdssp;push on
one side, and a pop into any register on the other side.  Furthermore,
given that the ssp= doesn't exclude storing it for some user frames,
just store it for all.  It's one push/pop into a hot cacheline, and
makes a substantial reduction in complexity.

~Andrew

