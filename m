Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGbzMYh3/Gm3QQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 13:29:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316F64E7788
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 13:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302624.1576496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwud-0001v7-SY; Thu, 07 May 2026 11:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302624.1576496; Thu, 07 May 2026 11:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwud-0001se-O1; Thu, 07 May 2026 11:29:03 +0000
Received: by outflank-mailman (input) for mailman id 1302624;
 Thu, 07 May 2026 11:29:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wKwuc-0001sW-Lr
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 11:29:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKwuc-00CttB-2n
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 13:29:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fc777a-e002-0a2a0a5209dd-0a2a4505c6ee-4
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 13:29:01 +0200
Received: from [40.93.194.27]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69fc777c-aaa8-0a2a45050019-285dc21b8ee3-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 13:29:01 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5042.namprd03.prod.outlook.com (2603:10b6:408:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 11:28:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 11:28:58 +0000
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
 b=gZ4RruHTchaEdtG/ieZzAMh3a+tDY3N6c3CWjyFX07nj9FEHyBrS7zu28DOJSeAhAqnKbDgziO/Yl50co0XAB5Sbnl9SFXrLRwLJpD1RDoV0mhctjHvHpbl2hjMwPXKUryDntkdbE3ghhPApNEC3yxeLxrq1meb+aXXqEI7egzNeCB9J2GGN2HX+fAWdEQekcXQ3oYNgrcSG2bxWdwWeKALc4XdjVGoGClcRdAa4AcjpS4pRjUMHaFM4qUeJhtThNx7vhhBFJ+LnCqrnHT+exJ2JLR2fRR4lV6veIkYoeLcyFLY2hm1kQbDBA9H95qtwRNZcYtmwXv6lXiesRU+Fvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHMG25xy42UAZCnd3gYO99L+5XJikj4FFcXQiMgWA4Q=;
 b=Q3414ry0MDbcSThLqMWDkxI8lsycVmA2IrM0yY4JAW0bhlZQLs9SWtW8HmCYras7mHTjnhcbHI//VTh8RU23/1L4KBfcid/Vg2mUHN7xpyKpYGlJyNYalLufrifZKAqn6YU7CEAAPCeZNVJ7SV6YDZHw8teeetdMtpffkonFyulyjZLYEN2fl6B00xmcJm/Q7fdTCUXoPMvmRmpnKxmC9Upjf5dgWzr2zH7sXYOuupTpGtBKnFT8GOFh1nusumjrIniy5A9yK/R8JGlV7EYefiyttxOdg6cG4VvWm05+nldbNYxDUPTOLfzzfkulc8qeoLUXBBlWwffedkYYSxFrjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHMG25xy42UAZCnd3gYO99L+5XJikj4FFcXQiMgWA4Q=;
 b=ov/f0J3+5I1/ADSlcF75EEK+WnucDGSKmwyTDBHDjcHhkCqap3PAnEE3FYtsMbjxLMW+bvgPNqoLF/ZnwMuxGi1wxuyYAe21RpjuHBo5Sg/vAk1zlNrKK8t18d0ySpAWrOFjlG5T6MbxqxR09duyEUg2RstERa43g/TnXndtg/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a809dc2a-158f-4b7e-8798-50548600b57f@citrix.com>
Date: Thu, 7 May 2026 12:28:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 2/2] nestedsvm: Clear GIF when injecting VMEXIT
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260507105507.2078971-1-ross.lagerwall@citrix.com>
 <20260507105507.2078971-3-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260507105507.2078971-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0021.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: 9627f2db-e974-4138-b243-08deac2bd474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KI+h0Gr2XZBeiw5UoWoHHtkOsA0L4o1YvdavWcKaBAi4gC09Q+Kty5wzVqQZyaG7CFf4Q1KNwNphvEWJ7XuT8ruKC1HPXOoNd1xSaVsyDZYaVXkeHxzC2NBpOTgxlrMtZz0aJeC1XaC+gNKjpgSJwEMHvEAwVeFpoxb2sWShwqOT8iI/HHhyOUdeWxsWVZvfjFqO+1YNW5hWo7fijQ+7x53bxtpKKVJJ3ZxyQX1I7lu0DaGa6BqUkg0k8xeIBsiRoNqmjlbxSkKOxEJ3iel64z4eB2oSDf/haFxD5wI5V7P1+dH7xQUxd+PMtBmaOMPQP9IMV3VTxS+p/vuQ5b+qX8i2hS5rhqiALDBVPJ3sdWgm5VC4phT68F1wzvwlZiUDK4UxTvsdnO2AeRQ1DjVogEcz87KyHYw2uZFYyeAnoWunxD7mA1JLFEwOPVMeiwFXmVXd5chCJzBvvjHRGYT2X04jU2bV6X2uJ7X6k1dlnxnkr4W7v6YWE0/sQ/9Js9CNukfk8wy1Rcimy0GMP2fNuyZGVWNVp3Gpqts3U62T0z2hGz9gu5LcxMG47R0yuwzMA1HVz3Xjo0f/LGzPOG+E9FSa3sZjA73nnY4TYZzCggd5fnkG9LcIxV9R/rfA+BbP+NnLfpi3pQbDJSnYEgUXpuTAz9Sz/4mc6Objvaq7LLBhM0tmAdLhlIoCksvNUWx5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2llUnZjRE5IQStjdEphUWlDd0swQzJGYUJJUTE0QXpzOEh2VmRrbGpBbVJG?=
 =?utf-8?B?QzdWcGp3eWk5cUNuTVJDdHp2SWJvejBzdlJRaEU3M1A1ZHl1dCttQVFNN2kx?=
 =?utf-8?B?T0NTODdUaThxWnppZ25xYXY4TG1BVktLLzFwYkpnaWIycmpkcDVPQ2MwZDlV?=
 =?utf-8?B?SG9BdUczclR1K0JoQTBTZEJVSmJxNG41OUlSbEZCdzJ0R01mNVp4Q0pLSlo5?=
 =?utf-8?B?VnM4TmZEbHU2VVd2dm5BWnpJRG50YmdXTEFGck43S0NXbjlCQ2ZQUnluVDhC?=
 =?utf-8?B?V081N2x5Ujg0NitQd21yMGsrc2ZPRC82c1N3TmFLVlpxWXk1RHo3dWd2TlBI?=
 =?utf-8?B?YmcrNXBETyt0NmVSMnZRbzJZSUNsOTQyd1FycUs4QkpsaGhCc2tUbUhLK3ZS?=
 =?utf-8?B?NE51R0xvaW02UW8rbXYyeEx1eTdHb3ZjamZyTDJxYk9TNG9tVkxqNTZNeUE5?=
 =?utf-8?B?ZTBuTFFIQzBONjNESFFKWVNuV1pSZ0s4YUNZMFN0ek51NzdpUjF0Q2ZjY2E0?=
 =?utf-8?B?ai8xTG9tNVNSRUNqTk9GNE1OQVFxeGRjbnN2TzVyeGsxNVRQQTRHQXdpQXls?=
 =?utf-8?B?TXltbDAxU09kT3ZHZHN1ek5SVWZTQU4rdXU0RU8vSjNWcFZUQUVJamMyekVX?=
 =?utf-8?B?L3puZnRIRUtJZGdxWlR3blEzQjJoaGFVY2xLWXU4aEF1QWxqMjlyWE5sam9E?=
 =?utf-8?B?QjBnb0NrN0p3L3JUcFJSd1VtZmlOUXBaZjNMeW5jbkNLVERiL3ZydXp4Ylp1?=
 =?utf-8?B?V3RnaVVBUW1tNHNXM1FsSFlQV1Jwb3ZiN1g2enBHQlZYb2h4MVRpSnkzUmcx?=
 =?utf-8?B?Ym5mYU1iZFVoZnU2OHJKSTVKM1pMRndKMllsMHNrU25DcHpiTCthOWpTK0lj?=
 =?utf-8?B?WVhZSWQzd2FxODJNcnY2NUlHbG5MYTlpSlJCTDNXZmFZY1V3eThOcUNFMVk2?=
 =?utf-8?B?Rk0wTzNvbDArTTY3SmlqU2RjdmZjVVVLTExsMTRGVlpXWlhnMWpXbSt4a3E4?=
 =?utf-8?B?SUM5cytybkFpZE1SRCtQZnJxc004KzFYZzUxNUorMXlBMFRWWUJhZi9EZEdB?=
 =?utf-8?B?T2ozTTJpbDZiZFF4NXY4VjZEVWxYQVVqVDUxSURGQk5WYUY4TE4zUEx0QVhV?=
 =?utf-8?B?NGhsYXA2UlZuVmFTL1kyNWZ0eGtJcHBWUUxicmxqM0Yra3ArM1R0dCtpamFp?=
 =?utf-8?B?OUZxenpIUE9FZEJJc3Z2UGdzZm81ZXlDWkZEbm9ka0hpRng2c1phblpzRENk?=
 =?utf-8?B?T0JSd21DSHlCMjNxVHlUaWNPcmd2cGxtaDFaekNoNUNLMTUwQndJRHFUMWd2?=
 =?utf-8?B?clFhTGNONENybVoyTW9qS2dteTJkejFPTlRjaGJoSnRZMDhaV2M3ZDZqYng1?=
 =?utf-8?B?d3c5Z1N2Mm1HNFBhSG5vTytWTzdyOFdRTXhOV25mOUltSEpnTHVxVStKZXc2?=
 =?utf-8?B?emh6RHp0elB2Qmt3UTd4VTJ6L1R6YVVmQ3JvYmRSU3BTZEJKaWFZRGxWZVU2?=
 =?utf-8?B?SFdsaU9rNWU1T21mYmxFRHZ5WjEwbGZ6Nm5yUkxGclNMdkd5a1N2Z01wNU0x?=
 =?utf-8?B?Y25nVUtRa0RhenVtVmFrSDlIS1o0bFFnQlpDSXNSMHZzU3dKbTNyd0k1SVR3?=
 =?utf-8?B?RkEzMmJEWi9xWmhqT3hRNzZmcWd1SmZobzNuRzJDKzIvaWt0TndUUUJGWk45?=
 =?utf-8?B?c0ZjV2FKTDJIeHJxbGJhcGgwSFhQb3dPZ0hhbkZMMG5adkc0azluRldrYytM?=
 =?utf-8?B?RU9KL2ljUW02WXpoalZuc2NNT2FXcEpvNmlOWUNJQWxzUW4yQUNpQk1ocTJE?=
 =?utf-8?B?YllkK2pQdGQ5eEZOMlVLTFlVb2tjK05FeEkvYUJKOWxYQmpYS1pac2tJcHhB?=
 =?utf-8?B?UnRsYmFwVWcvdFhMMjlGUE52SGMxTUM0OXNTaW5FUGM2VEFmQ3djdGxOS3Fy?=
 =?utf-8?B?NktvdVNPaGM0RC9zalRVWXl0OTl4RlBnWTdlN1JkRVVtc2JJZjVpVU1xaEo0?=
 =?utf-8?B?cTI0UkVrbVJxOW9NS2pEWDBJR2pnMHU4RUc3RjA2bXZIVFlOVmdTOTkxb3Vn?=
 =?utf-8?B?elV6Z0xQQ0JUWVROeHJuTUlnL0hneDR4UzRGMEk1RVVzN2RxOUJEUUd4TUFW?=
 =?utf-8?B?N3I4aVc0bzRNb1cwZ04yWi9vTTVLd1NPSEpGQ01zTEY0d0l2Z1JmWHRGZDg2?=
 =?utf-8?B?TitCOUdpdDU5VG9UN3YrQXRvWHBvTVp0eEI1dHBFVFF4Y2pzVTN6VWlwMnVs?=
 =?utf-8?B?czd0NU16bkd4TWd1RlJrTDBPZGtQOVlTYU54ZE9Ic08vQWhmekpFSWs0YmlG?=
 =?utf-8?B?UEZBd2RNbnpOdjVYKzREd21ScTYrSHFDK2xUcmIySWZRMUFzWVA4UzJYTEJM?=
 =?utf-8?Q?f3WoHIIkGUiHfOpU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9627f2db-e974-4138-b243-08deac2bd474
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 11:28:58.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+FE2aoZt0XreoX33ZpoxjyF4jS35O5pHJZ2wC/W9/JP6wpteZvLa/IfcnO2Tpx9dLhxrv10LoNAamK6FnmXvTDJ7VbeRqvVoYbpNTd5Nyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5042
X-purgate-ID: tlsNG-c201ff/1778153341-DAD6F443-60EE864D/0/0
X-purgate-type: clean
X-purgate-size: 486
X-Rspamd-Queue-Id: 316F64E7788
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Action: no action

On 07/05/2026 11:55 am, Ross Lagerwall wrote:
> If L1 executes VMRUN with the GIF set and it fails consistency checks,
> Xen will inject a VMEXIT and fail the assert checking the GIF is cleared.
>
> Instead, clear the GIF when injecting a VMEXIT to match what hardware
> does.
>
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

