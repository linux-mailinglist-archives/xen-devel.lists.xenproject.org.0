Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBcCM10wEGpFUwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:30:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCFE5B2224
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316589.1585976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQN9I-0006OJ-Io; Fri, 22 May 2026 10:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316589.1585976; Fri, 22 May 2026 10:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQN9I-0006LP-Ff; Fri, 22 May 2026 10:30:36 +0000
Received: by outflank-mailman (input) for mailman id 1316589;
 Fri, 22 May 2026 10:30:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wQN9G-0006LJ-Jk
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:30:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQN9F-001vbt-W1
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:30:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a103044-5cb7-0a2a0a5109dd-0a2a450bb448-30
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:30:33 +0200
Received: from [52.101.46.42]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a103048-212f-0a2a450b0019-34652e2a8d89-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:30:33 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH3PR03MB7434.namprd03.prod.outlook.com (2603:10b6:610:1a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:30:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:30:29 +0000
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
 b=JrD9zJXpYH93EpVdvbNAr4NkMKtBSlMdH8Hj6/ywqK6LGQ0y58AGrLLuBQVhEqfyOManzRATCSCN5Jus8L5ObgmzDz4dOEZqApd/EehlAVkEx5JeAC8pvAzACvuEfuSjQiDdWAbsSAJMGwY8ie6LNJVYJZ3n1h7lVDxF3/xNbTGQwuHmZ9EW3/QPk0NddTgI+6XPUyrCp/dNLs4PSaE343lrkcLEV4eIEZUR/qtuRzR6n2E7/qzIzl0FPxr1VNA4vrycX9GI1Nf9hMATKTRFfhy1gmO212HmE5VgVhF8fevPm/KdxJhxncBx/fZf+nsR3m8X5GRfbWlnTkhr/pve3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaqmvXKmaleQxgGw8BSuaUmkUV3Iyx+yxOcrs9IDUYA=;
 b=KYSa32kT24tbhBur5D+dctp36OQs5dK5tgkCxMW9s44QmJX5lq3yhcDprvIZh2YKE97akHIn6s7xJws1quyAl4STTGM+q09SUVK+AoOU3ir+6p7pjMY5kXkfcPb73BCKBDGMUKC3vadwico7UeQGW1QzmXRKtQ7jJwcwAviulYLD9u5UQoXFo2x8JZ5Plkv274kbJRBMNFO9OcAEgKmvxKaHhv5SaFP/9B4aTmLNpJFOrcfMElbUiiHFVzZL2G904FN84amdEYUrcAUaNb+59DHurVctzffQE4PwB089LBiUImj7T1ILEe9Qqit0sDp6d9Kh0JdchKTNRV8fD4Rexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaqmvXKmaleQxgGw8BSuaUmkUV3Iyx+yxOcrs9IDUYA=;
 b=tlJfpyShRTUsUER2fLmKc/o3JFnMOSOGe4djfzmMb8YJVR9iUoHMVukNx+ZAVM6x+MVBMyWl6WBDzZHOquf0n/dvm6gWpChVJc42waoM4wR+HweeQmUxh0vutBJTlG25BU91Dt4XILfPgz7eViz0R8YGH1X5q14n4dALDpbyXo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 May 2026 12:30:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 5/5] x86/shadow: rename a parameter of shadow_l<N>_index()
Message-ID: <ahAwQQiWxLnWtmP7@macbook.local>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
 <8aca671a-eb6f-475d-87cb-7a738ecd0793@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8aca671a-eb6f-475d-87cb-7a738ecd0793@suse.com>
X-ClientProxiedBy: MR1P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH3PR03MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a53175-a001-4d53-1e95-08deb7ed255d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	56oqteO9j4YJpklfnr+2pAJgNkFs3KJ2W5u2oF5Qp9mtHgq3ZiIilfTACQQCe1I/u1qLVgVSADJ36Vv8JVgKRauwDGAz/noMyC+VDmE4O/xNVswJW6Fe7ekMaGF1UnQEWTkJlptKVhTOHPYueno5wuvSFraJViNI1Gn34uqtA/fviSLnarX8Vh9f/8qG8wYRYCE8+AN1cEziF2u+kbobdCdd/pX6oSoX0MGdeyAn9QmrlmmWYSFfc5aS3LeXweesD9pY6LzprgSpP/u6iV24czIoqSiJrK17acrGj+qAPfFG1qvbYjDM7HcRw73x0OEHaN0TQB9dRbFQoMnGA0cm1Jvu2d9wuU+PXPshbpC8l2DMqeJCyTQ77UHYDFGEofbhq/ftyfsIzUjScJ9pLZeHihaPrugQMcWTmCaEc0cljaqGL+xwbfEu82Nzcv9VttJ32h0CR2EKmHxKe+iojAYmIOuH7z+atVwlAgOlGuEJk2Thzw8KhPpO9f7Q5kYBB572yGm7/T+Y3oxYPTVffQr54F1dT8Ue+WfM9Q7hs1fOoyckPukWWOA5LbY+ETglFwXabsDlYGyMzbCHTR9vUiArGYwo0OEP4gJf1KpP39uWwG0Oe67sYtC6s5oLKIivB5F5nEnT2+0lhPOk4CoBDV6qa6dF09QsX+yaenDtEsgw7bDyvE6LlJTRWMZcb0rgb9lD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dThHWXVIWWdVaDJpQVo1d2RGRVlkSVBjaVhqWkhrOWpqa05ZMHUwMk5sNFo5?=
 =?utf-8?B?d256OThIUExUYTEyK2V1UGZFNXNsUVR2UVAySU5BVnd1dWhwNml5dy9zM0xF?=
 =?utf-8?B?dS9lb3kwYjZqTWpRdkhBZ2VtNmJuRS91ME9EM210SXNldDYyYkFrOWhyZnJL?=
 =?utf-8?B?QkFSVFEwbEhpNDQzYlNjN05ScURQMzZuTnEwSWdQUnVGRFpxaWt0d1RwNzZV?=
 =?utf-8?B?RkJpK0tTeFNCYi9QN2w0aUY4ZlNmT3pLcFpRelhleHU0cjdFNlpqSXBtZVlm?=
 =?utf-8?B?V2hYZi9DTUxySVlUZXlRV0V4V0JBTXBZWHZSYzBqM2RhRk0vbk1ZWXIvMnJy?=
 =?utf-8?B?c0ZHWEQwSk5UeitaeFR1eWFLclljRzFkdHlDaXorWFdBbitkQk42SFEyOWVw?=
 =?utf-8?B?cENKTnBteVlUeU1Nc0hTVXNIK2lrMU1WVUtUNDJ1SDN0WHFXcHBudVIzMmF3?=
 =?utf-8?B?NXdvNHNKTXQvb21RaE9oa2M4RW5kd3lyTm5HTklSZzJUWkpmTm5KVThlMnF0?=
 =?utf-8?B?em1DWmFCelR6ZzZTZTBmOGFZZGdmK3huN1k4Z1EyN2FBRDYrODhJTW9JdFpS?=
 =?utf-8?B?OGd0RG1VUDQrRXRWMTJXVk9GdWlXM0JkT2NrMG1LYlRkMWgycWdBSjhFRXJ3?=
 =?utf-8?B?bUp0bmZrSUFFd3Y1LzJZOUtUaHZNYU55cUZIbWZpK0ErbWhBYmlFbWttTFJp?=
 =?utf-8?B?SEhQQWZCbVRoYUhUM254bll6ZXBXUkxlVnVMQUZhdGVJNkJhdE1EZjRJZy9i?=
 =?utf-8?B?eElvU3Yrb0FKcEM5K0p5WWhpRVg0aG9obzBuNjhjQXczSitDOUQvQ0l6YnNX?=
 =?utf-8?B?UWtCei9yNm14bThxTWF1ejM0NEhGNnJWUmFtVzB4MWd4SmN2M3NIWFkzMmlW?=
 =?utf-8?B?NW1QUTRwUzcxdDBoZ2ZmL2xIRnNOUzRPRlA4Z1FhZFNVK0RUVlJDQ3kwZE1C?=
 =?utf-8?B?bnYrc3ZSR0pHd0xBSTFmSUw2N3J4WDE3TENzT3pwT0p1ZGc3YjRHWU8vY2Ra?=
 =?utf-8?B?bnZNdjVVTDQxdnRnV2tUaEd2M1BNU2RWYjBLZzBmRVZNNUU1N3dpOFBUald3?=
 =?utf-8?B?TG5XNzZSdVhweHVSMGZJYzkxNnJNc0prQkV2ODdEMEJ2N0VVNWZIVzFXTjRr?=
 =?utf-8?B?OFBBY0tpcHV3bnZVNWtzQkJvdWpsc21OU29uTmp6S1ZGODh1bXEzMU91Rk10?=
 =?utf-8?B?VlVwTHJlczE5ZHRDY2dScDVaNzZRWUVHV29yYTF0MG9ldXRwMHMvZWtlNmhi?=
 =?utf-8?B?QWlsZTZ1NHpoUVhxbVpnK1FJSEZDQ1pZeUNPakc2Vmkrcnpzd2RrVmppeEJO?=
 =?utf-8?B?TVY1Lzh3Q2thR2tVeFRrMlhLdFlwTW5aYnhIdXJUOU5EcEF1MjBHamZBaWEv?=
 =?utf-8?B?Zlo2aCtmZjJpMzUzVEpydnlmenprb2tObWVORGlCT0tqTWZ5M0VZRjB5YUQ2?=
 =?utf-8?B?YTFwMHhkQjd2cktKdTdwYlM2Y09vcXlvQm1QVng1QXBUVVBMMytKS3hRRmVE?=
 =?utf-8?B?WWxkbEFVdkxrMXJVSHBQM2tCT3lRRkgydEtCVDVWTWdJZmt6aDRJanoxcVQ4?=
 =?utf-8?B?NXpSQUM4TlZMZTRRZysyVDFBQjA4dmh4RkNoSmxEdkFjMkRwYVlPTnozY1J2?=
 =?utf-8?B?UEhtRG5SOWVXK0JaNnkyMUZPcmpvdGVBRU9RM1R2b1F2R0FSNHh4bzhZY0Vz?=
 =?utf-8?B?UGJ3NUxrNVR0WitEdUhMNnFvN3JjeDVyZlpsQXVNQXJLR0RncEZSMmQ0bjBJ?=
 =?utf-8?B?cjlOZXAyK2thNDJ6b1h0dkxGdll2SnRmdytIMExIMlNJcXMyeFRYSjlvQUZz?=
 =?utf-8?B?cHNTdkwveS9WSDh3TVFyUW5HbGk4YzBEVEhBRW54SjBnZVVwbnprdlFpVWwr?=
 =?utf-8?B?cDZVbS9ZSm1VZFQ3WitSeUdhQVB1K3Z1K2I2OTFWVkEwYWJqL0JXOHNLR3lQ?=
 =?utf-8?B?eFRCRXR0bnJhQitSdTB6ZURybzNYaTh1dXEweXdRVnZ3b3ZNMUNuNXJqZkVT?=
 =?utf-8?B?YjI5ZXN1NXhiSEVpUEJFUFg2azN0YnhoOS9EZ2NjRkhQc3FNbVRRYUpxaHpY?=
 =?utf-8?B?bGNpdHB0dSt2TmVKVzBDK2NwU1Z5NWpocDQvazVTN1ZMODJtKy9oNE05RU1E?=
 =?utf-8?B?dDFsZjFwOU00b0ZUdGFlaTVQaWEvMll0SXU0bjBCazdYU3JnZ2dyYm9SUHps?=
 =?utf-8?B?SHZEL3NBWmEwZjByZmtQTVJWTTRJbVBnQ0pxYStzZ0djZFZTOHJiL1pJZnhF?=
 =?utf-8?B?UFloZUY2MUhQSVZESzRnY2IxYXNIeCtHc3MxMHhvNU1HWi9VYkdvVWRmSVVX?=
 =?utf-8?B?WDF0dVUwV1RnWkVGNHZwWldnU0w2aUJwVXhsalI4dDYwdXZpUkNIQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a53175-a001-4d53-1e95-08deb7ed255d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:30:29.7630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krtylLsS9MAZXTJLRXYms9kxb66SeKpqvqSZ2A7+8yTCIEMygARxhhqNHPNxaoKdoSuVLPjVJPmaGOuydrvk7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7434
X-purgate-ID: tlsNG-42698a/1779445833-21D85F3B-BA15F593/0/0
X-purgate-type: clean
X-purgate-size: 658
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3CCFE5B2224
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 01:46:59PM +0200, Jan Beulich wrote:
> ... shadowing a file scope one, thus violating Misra C:2012 rule 5.3
> ("An identifier declared in an inner scope shall not hide an identifier
> declared in an outer scope").
> 
> While there,
> - replace u32 by uint32_t,
> - reduce the number of cf_check by aliasing shadow_l<N>_index() to
>   shadow_l1_index() for N > 1 and GUEST_PAGING_LEVELS > 2.
> 
> No difference in generated code, except of course the removal of the
> duplicate function instances.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

