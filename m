Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKNfOUS9DWrH2wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 15:55:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A058F22E
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 15:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313986.1584003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhO1-00020e-Tq; Wed, 20 May 2026 13:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313986.1584003; Wed, 20 May 2026 13:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhO1-0001yQ-QW; Wed, 20 May 2026 13:55:01 +0000
Received: by outflank-mailman (input) for mailman id 1313986;
 Wed, 20 May 2026 13:55:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wPhNz-0001yI-So
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 13:55:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPhNy-00GHcw-Ry
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 15:54:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a0dbd15-2eae-0a2a0a5409dd-0a2a4507aac2-38
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 15:54:58 +0200
Received: from [40.93.201.32]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a0dbd30-229c-0a2a45070019-285dc9206623-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 15:54:58 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6523.namprd03.prod.outlook.com (2603:10b6:303:126::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 13:54:52 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 13:54:52 +0000
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
 b=RpR4ifVe77t2GEop0aicxKo+RGpgDCTOQ1DE7CinXElZK9PaZhtVutTUIPgW/pgPtnUAXLpH9Y3DJHvxTGuUzOTnbr5+5kncRirsGBi+8LL5S/Sftfc4priWbUnQ1oHTnVjFd/cjdwbBaaVEhzF09lxfSlfXANNva3syqzHzRvD9P9Sjgj8diGD6YceFjJR55FesJsLginUUbFQHzudeEHyhNhY3BAYtSA2iZFlHz1zhb46POlA/+uAjSvHiH0BTDAxQQGlxzcGCisX5NRul2qrxVX+Ip6btZCE9hA+9U16W6eCg2AaYUokpfPQ5XI5gyLfkMCT56e8us/26rvWrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SGbwOpwSnbAXjVEgb37b75Phl/x2O+0FRj1Cy2LLmQ=;
 b=VnYLDZCjiY1K/Kj1ISYzqGv99+Dzl+sYlZOW3Q9+abJsfHfLkUetPo7vY5LajmKkrI+OfKPGMgb/ElRPUkV01C7eLx4BMlXsbdht0vJVI7BJdICfhHvNRGycDTG+p1+8gxjPRyEzPuDkV8JGQNtnyPyntyGHFk+204u7lfDwizcPWEKFntXLVoQv/HS8EeeXCL1GM/Qr2Gz3Bs5kpZaxW48yk6BxlEuJLD6pdRSRKtFkgyK0uaG3pWu3WMMlonmBxHgUNxeqO9w/B92i2BlglA0FTrRal/0k+hbPfcs7YYXvXrNA9smr4MpQVwj5zm47Ta6xGmM5GrYromJwEkD2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SGbwOpwSnbAXjVEgb37b75Phl/x2O+0FRj1Cy2LLmQ=;
 b=IimDgSwUFIN9iAoAcXuhB99fs7qaheWvLGJkYbu/ej45yGnCJdPveWKGaiBCrwc786RRdnzZXx4JFgrK79dBywanVhPaJMb8/B9HEe6rPQemNE4bF3Zib8y9B6tzOVHM/O8W5+CON+lhJjRRiokM4pMeOhHzmcBj+mNOyXLHHCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 20 May 2026 15:54:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/shadow: VRAM last_dirty tagging
Message-ID: <ag29KOzxOyU47mFM@macbook.local>
References: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
 <8559db88-5f1d-4ced-980c-e71c4e229c7c@suse.com>
 <ae8sMiXAWjeXI3o1@macbook.local>
 <eba10bd9-064b-437a-bf42-7a627fda464b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eba10bd9-064b-437a-bf42-7a627fda464b@suse.com>
X-ClientProxiedBy: MR1P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: e7495e67-9ed6-417b-69ff-08deb6775d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	peIokoq4r67ZmAROmnjlxMpgG9a8uOoBzIs8fzgAJyszphSGPi5/lt8FYVTOxV4felPwyV3ZaLlvziclQywUCD5niZHKnIPizXK9vNCGOz01bA3QiQU4DY+ElZaCASULpFyD1nYnZajyxEC6fMw8tRgR+wlLcSP/BY1mRKvO7T2K0GfAqKZ3Vf5JeqZ7WmHkIhMmm2/fTMaE/9/4ks+DDhSGs4idZFoU3LO4DC6ffXZF7i8WLU7UW+aQ/t3RXL+ac2t/ZBeUjE7mZG5p0vExLeng2QGCLQhSJHB/uWRqQzwgFw4YQ+XDNCtbpU8RpQGtJYKUiGwjlTJL15YYYm/TryLO99Zd93i6Hef60Pm36YFgfEExFL6D3/G57u8xWKOLuN7gACq36zkEw+0NwAy6cXvBGJ3zI5++lTH5qpUdAgb0OFEcs0MDOHtboaJDERREIjr05GrI9IpjjMipUpNv7Eoq7wMpEzy/asdW8ov18oruhmtb1VqT6e2svZhf7b1SeaSGpzPsLDY/NnNYXAZgGN4PkyHuKznsE1TZf+Kf7DRxpvtvOp3Rf3rmj3k0N8fc6eazOyFDH+hxGPuwDBqEKNMFBOMYM/br9C7Pzga5HeyaJtxnijiC6UfxBiRenCT++rHFyzYv5eRJnNrr/ZVruUiSJ8Xcmjg3NYaFD2uH7vtHssBrXDcTADAZEPkZ6vCd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGVIbzZvZnIrdmN3THdacm94OHErWWxGaGRyOGwrUkNJdU5uVUVZWFJKeE50?=
 =?utf-8?B?N2xxRGoxZVhRYWliM1A0WVo3Uk1KTEJHVkQ4c0ZnMzhHUzRWYThrSXdTWjY3?=
 =?utf-8?B?eHd4WnJ1eGRpMld4UzZDZ0Fma1hKOGtlYUdZZG1QOW5mRjY0eWhpRmxxZGl6?=
 =?utf-8?B?eFQwUittNUd3M0czampmRXplUVh1anBMTmNld3U0WXVCWkFrbVF1SklDZnp4?=
 =?utf-8?B?YzhMbVBRanEzVUVQUGxXZW8xc1J6NjdFZFBYRE9XMGZVckoyWW44clFCVjlk?=
 =?utf-8?B?cis3QXR0dzluSVlpdG5JaU54c1BWUXY4UWpPQnE5YWtaU0xER1NPQ3NyYlJI?=
 =?utf-8?B?WGNJbVVUSXY1TWtjSnc2QTU4cERoMzkzUzFiVEJlbkJUeEFFWnJsOU5TUUl3?=
 =?utf-8?B?cmpyc01PbEMrRGJLbjFraElkRXUwSmNQUTlYRWY2TFRuSzF0bFZNV0lUT0l6?=
 =?utf-8?B?MXBrTVBWWUZtVGhPR25pUnVsQ2pCMUxCNmRXc2pVdDdKQ29SYjJsRWNwY0Za?=
 =?utf-8?B?YW5tVjJhZDYyY1JDdjZuT1hiUEg5MmFndlh1MXBGY3MvTS9YT2RGV0RMV2Jp?=
 =?utf-8?B?Rk5NSnorK0Z5K0FyYUQvTk5rR0Q5bUZJTlNtTkczYUxKV1NudDRzUHNCSlpw?=
 =?utf-8?B?VjZUVjJoT3JJWENRUmtQMjNKT0ZpNzB6TTVhT2Z1cStiSDBNVTU4SHcxMlh0?=
 =?utf-8?B?bFpVZXByUGpHOFNNYTR0ZWwwdWlzVDRRN3JVeWR0Qkx6UWVFd1FIR2ZpaytL?=
 =?utf-8?B?Y3A5Tm9uL0xJYWRINHJndTk0VzZBRHNraHNreExXQVU2Ym5PMjh5b09tRTdk?=
 =?utf-8?B?RTl5bmJCMFAvQzNxbjYraWlPamZnM2ZGZU5lZThvM2d4UmwrQUFKbWxtYURV?=
 =?utf-8?B?aXFVMm9XbEYvZzV3RFkzOHNGTjBVb1Z1dU9oMm1VWEZaNVB1MFhGL3MxTXhp?=
 =?utf-8?B?bzdmWE9aZUhyT215dUorS0VhL08zaGJLQkhWb0JWZllWN3lNUURKOExycGUx?=
 =?utf-8?B?bmJwcHhFT1BmY3pNTHA0RnJHRC9JM09LZzZ5K3E0cFBObUVQYytjeE43Nkla?=
 =?utf-8?B?bDZwUE1kK3dKQUk4SkJOTm9oRXVYa014OXordXp6YUpYdVlSWHNMSVVFc1Bw?=
 =?utf-8?B?ZVFWYkY0Ui9OeDh4MitBMzR6bjNzRDZqWko4RG1Bd2dvemt0dmk1ZjNWR2Qr?=
 =?utf-8?B?YUtNaWhYbUYzNVo3WCtDbkdUa21mSXpwQm1uYW5LQVppZnA3RWdSeVNXSGZo?=
 =?utf-8?B?ditGRmlueHltTmtUMUlBQi9HTlFnOGJCZFJPYkxOdXBqaEJ4Vmsvbk5tclpX?=
 =?utf-8?B?K2RHY0VtNHZLaWJNL2ZzQWFPQ0ZJVE1XWkJidVBxTFh2Nkw2UDcrQlJOWmJU?=
 =?utf-8?B?K0wxMGxXZVRGQWhJbHZ1cXhUdWJGeHVURWpqcnN1QXZXdWJYYVFVcU04TVhS?=
 =?utf-8?B?MURva2k3VVdFZEZ3WVc5ODc0cjRDeVdjNjdHN0l6RUU3U3NtOENaS25adno3?=
 =?utf-8?B?TGJ2OUl4b2s2RFBpRkt4ZVNrT3RPTnY0L1FMMEZKZW5ZQ2VlNXRNUW9md2Fp?=
 =?utf-8?B?enpkdGZ2ZnBUYUlGZVdMZG5uVDJwU1JCQkNhRGRLWGhqN3B6d0NlM0pYcTQr?=
 =?utf-8?B?ZERURkpHQ1ZPTWdrY2xGdjZvdDBHVlcyWG9pbmdkTTFjdVRhQWFKUDNLS2Vr?=
 =?utf-8?B?bEJST0d0TzVhZjNHUURmTzJ3RjFZWSt6K2ErOTRzVDhQUERnOVI2NnBVT2Zh?=
 =?utf-8?B?cm5lUUc1WDJsWVJWQlU2NVliMEl1cnA2eGxXb3RJRHpad0xrTWtoUGdnUDJa?=
 =?utf-8?B?NVU3eThsK2NwdCtQZmdEZ3FMTDFLK3JSeTI1aDV1bDArYnNwRE9YVDloQlE2?=
 =?utf-8?B?bkZabExaSFdEQUx2UUoyWG5QeFNPY0pHK2lrNERzVC9Ud1NicFc5OXJhMXdE?=
 =?utf-8?B?dWxjMVVSc1NFZGFTQVBOZExRZGN4bzV0OWYyZ0JCRU5IdWltbE1ObXRyQm1m?=
 =?utf-8?B?YVR3VFZsWDBiWlg1UFBOdTdtemdyZzBxOTB3WkhiN3laSlhXMjdCMnF6Wkly?=
 =?utf-8?B?aGh1K09nVWhHTVpHbnZmSlNseUNvYTlJUy9oL2dSbEo0Z2UxajVSRDJ0RjFl?=
 =?utf-8?B?NFVsamRLYTNLT09uZVVpNCttMnJiU2xxZWl2YVdTU2liaVJjeFBuOTFhZm56?=
 =?utf-8?B?Nk1YOG5oWTRUcEp6RlArZ2ZhQnNrVFRRQWxzV1dEM2g0dS9qZWFZL0RWb2pl?=
 =?utf-8?B?dHF4N2pUQ3k4eW91R0V2OEVoRlcvSWxBU1VEWXpLRTd2RFdDZ0hRYVBYUjlJ?=
 =?utf-8?B?WEdJSk9kRGoxMXd3dDB6ZXk1dTZTeW5PSm9JR01ER29LQmplZTlGdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7495e67-9ed6-417b-69ff-08deb6775d8d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 13:54:52.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nwk8Yz2FAeN4TPQA8Xu5EYjY19ncHoTr4gSYe0djeP+lIcsUE1YYJJOC4rbpRpeQchXsg3JjGlYc9C+vBg6i7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6523
X-purgate-ID: tlsNG-ef75cf/1779285298-0BD7FC48-2DB25939/0/0
X-purgate-type: clean
X-purgate-size: 3590
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,citrix.com:dkim];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5B4A058F22E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 04, 2026 at 10:39:53AM +0200, Jan Beulich wrote:
> On 27.04.2026 11:28, Roger Pau Monné wrote:
> > On Tue, Feb 03, 2026 at 05:49:55PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/mm/shadow/hvm.c
> >> +++ b/xen/arch/x86/mm/shadow/hvm.c
> >> @@ -1087,18 +1087,18 @@ int shadow_track_dirty_vram(struct domai
> >>          if ( (dirty_vram->dirty_bitmap = xzalloc_array(uint8_t, dirty_size)) == NULL )
> >>              goto out_sl1ma;
> >>  
> >> -        dirty_vram->last_dirty = NOW();
> >> +        dirty_vram->last_dirty = -1;
> >>  
> >>          /* Tell the caller that this time we could not track dirty bits. */
> >>          rc = -ENODATA;
> >>      }
> >> -    else if ( dirty_vram->last_dirty == -1 )
> >> -        /* still completely clean, just copy our empty bitmap */
> >> -        memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
> >> -    else
> >> +    /* Nothing to do when the bitmap is still completely clean. */
> >> +    else if ( dirty_vram->last_dirty != -1 )
> >>      {
> >>          mfn_t map_mfn = INVALID_MFN;
> >>          void *map_sl1p = NULL;
> >> +        bool any_dirty = false;
> >> +        s_time_t now;
> >>  
> >>          /* Iterate over VRAM to track dirty bits. */
> >>          for ( i = 0; i < nr_frames; i++ )
> >> @@ -1174,16 +1174,20 @@ int shadow_track_dirty_vram(struct domai
> >>              if ( dirty )
> >>              {
> >>                  dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
> >> -                dirty_vram->last_dirty = NOW();
> >> +                any_dirty = true;
> >>              }
> >>          }
> >>  
> >> +        now = NOW();
> >> +        if ( any_dirty )
> >> +            dirty_vram->last_dirty = now;
> > 
> > I'm a bit confused with the setting of ->last_dirty here ...
> > 
> >> +
> >>          if ( map_sl1p )
> >>              unmap_domain_page(map_sl1p);
> >>  
> >>          memcpy(dirty_bitmap, dirty_vram->dirty_bitmap, dirty_size);
> >>          memset(dirty_vram->dirty_bitmap, 0, dirty_size);
> > 
> > ... as here the bitmap is zeroed, and hence ->last_dirty should be set
> > to -1?
> 
> That's not how I understand the field is used. Aiui it identifies "was
> clean for more than 2 seconds". That's not the case here. Hence the
> setting to -1 only conditionally a few lines down from here.

Hm, OK, it seems like a very complicated way to signal this.  Won't it
be easier to unconditionally store the last write time in
->last_dirty, and let the consumer decide whether it's been more than
2s or not?

Maybe you could write a comment next to the field in the struct
declaration?

Either way:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> >> @@ -1216,6 +1220,7 @@ int shadow_track_dirty_vram(struct domai
> >>          paging_lock(d);
> >>          for ( i = 0; i < dirty_size; i++ )
> >>              dirty_vram->dirty_bitmap[i] |= dirty_bitmap[i];
> >> +        dirty_vram->last_dirty = NOW();
> > 
> > I think this is doesn't deserve a 'Fixes:' tag because the setting of
> > ->last_dirty unconditionally to NOW() regardless of whether the bitmap
> > is zeroed?
> 
> There was (and is) no unconditional setting of ->last_dirty. Technically
> maybe a Fixes: tag might be appropriate, but this is an error path which
> should never be taken (assuming a well behaved DM). Do you think I should
> dig out the offending commit?

I'm not specially fuzzed about backporting this, I think it's fine to
go in without a Fixes tag (and then no backport).

Thanks, Roger.

