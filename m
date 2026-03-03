Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ADOMBAQp2k0cwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:45:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251E71F4091
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244949.1544294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxSrg-00081u-G7; Tue, 03 Mar 2026 16:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244949.1544294; Tue, 03 Mar 2026 16:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxSrg-00080P-DJ; Tue, 03 Mar 2026 16:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1244949;
 Tue, 03 Mar 2026 16:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vxSre-00080F-V8
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 16:44:54 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9d9331-1720-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 17:44:52 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6623.namprd03.prod.outlook.com (2603:10b6:510:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:44:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 16:44:47 +0000
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
X-Inumbo-ID: 4c9d9331-1720-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7UfKB3gSPFHs70Y5Jz8t6biZNAj/AEnT/F/r3yWUR9PGNbj0ESNxg4u7Q9JLoPX0DQQcwxC1VyrIJ4m7kWTNoSImLzCSCCf43eGpyds66lr3yP93hvnUhgbpLlt570tAbnI9ySPr3Fo2nCoLdLbY4WWLZ6fLiziJ0ACgJv0Il2InhQyE8PUivH8nux5uPPfvXOKjD0NzqhrSyEAT1X2ScW8dvkhqMZDA4U2qsJe7d6+5oabqDMj+vVGGmUzcdsIsUF4E3HGk8lPteEfrRv807pLZL5MCV6vYhBi9P5e1+i92TxktGDRrjPYBEWziD4EVS9tXRuTV05G4m+Yh6ijZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0APOjVFT3cdvjaAW4vRXuCpNVGbuxVVn2TFVw9aURp8=;
 b=F9EbZVI7eTUvE8ckCClnjc3CEnCIe0hvLB5qy018iJcX30ft3ZFLpcUvrWl3hdLsjmuhDCmiNUicQq10E/KlhNvwFIHvOdWxImD39MwqC1vaKKPbpLzLDQQjhL7XUHPnMCo5uNAPlHtjz9VSjmHoNm40pHe+P45JVsu5EdP/B6DRz0Z8mcjZVKx8Z+Zs/2UOx0tJ6Ql1MC0WzEoDOoWlbSN4eoOFqci+p6LvexllCwzrO+Ler7U/GUZTr03d2X43Us3qawgezTcwUgBHFOqOsi35EzWVYgdvuHJjyRqhDiLtgK3XKaxDWtJKerYLapbOYCyVAdWa3hNyE5kAvNgh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0APOjVFT3cdvjaAW4vRXuCpNVGbuxVVn2TFVw9aURp8=;
 b=d8bP0TLfAiBdi1I2JNRXFsgSefk+ke1hGXi+XwHcsJOzqnSBWagVELfHEUd/wVneeyemA44XSeJaoaMhQt10qHNlHA/8KRKsZJaXZoJQWeb630hfkGjif5IQfDn0klYXEH7cgxy2mdwFBhSz5tcHl0X99/CnvY9h+JQZua/dgXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 Mar 2026 17:44:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v5 1/5] vPCI: introduce private header
Message-ID: <aacP_Dk6lTALXvhJ@macbook.local>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <f3673515-5922-4748-a964-d4c391e937f5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3673515-5922-4748-a964-d4c391e937f5@suse.com>
X-ClientProxiedBy: MA3P292CA0031.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a31d27f-5219-4bc0-25d9-08de79442e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	7qHEhBRT3eeOb7lhr5eW7+ufG02dV6GMPWJP/Ggr7ZJ3+jZ4U8NtnPiyY5jyPWRx0yB8N6Z+bnAEIMad/DlqZZNINcbhmjhahpG0f67LKZnXFdEVeDzV46OS4N2HohIGsN6mZlt8+PtWDafG3Ovex4YY6aw2ZMItHiVm+qJI+kUNfvy8kWSMNhs4Jj97qvj+iMZMoV/jS4Fw1EFivBGALDrYTUs1YdD8w908PR88HzYA0wNVE6ht9n2RM7lsz5oSTgkMVRXVDMXMmRpsbjzfzNRn+qz1ZqpHBjahSdh/e8wRtywm9ifxiB0aLshrmMUqnWWm+jnpTX7j19lsCNVZn/8mW/xll1+9dr5CyxrzMFObtp9yZoHV5YZTAy0dAEoJGDjEinDdCtlw5Kdam6OQBlLR9VHvB3yR4N8GCPeVpU+VUCrJdS5vfqyXv1sBiRaw+FNAT4NdsScWrcOFW+2xD8X2eHF57PwZvb/Aa/0aft47/4oGQmohI1qgk55XrriGvVFjrj1uOIxXDuL9H6EmuksnftcloQ+KvKejok5IwttihZVusoMLIhrUjMfdON/Q+OrTBsMeXEQLgL+1AMed/ytPpx6zngqKubqXy93g13ewCBVmvJO9cJEjPLLiU2PcsIdzBZwj56TfD7VgeSRWOZ7hcI4k1mu4EZrVG/Fx/SgJ0ZzU3JdgxqCDAvgbEm4+VdpkkFlQgLs8AAEtanQrM8/CPVP/PF4jtBCWyyd6fzU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnFJQ2F0YTNZOVYxekRKMnZ2WDN4QjFKdy9wUjlvazFOQ0lzMUdGamRCSmJ0?=
 =?utf-8?B?eTVidmRBand3WDNqdUFsT2dXeDhJRkJnN0Jnc3B6bkhoZjF3QnVGWnJ4V0Zx?=
 =?utf-8?B?NWN2ZmVQbzUrMXd5RlF2UUVSY3liak1YU3ZhVnpoRzhnZ2FidXVCQU04Q2Jn?=
 =?utf-8?B?b3h2a1JZV3RUcFVxVlUycXh3ajJDQ3pKYVpaZ3EwYzdWbk16bGROaFJjVENu?=
 =?utf-8?B?WWxzazNTVFdzTnVRL1J1U3loZHlQZTZSVE9JSm94ZXJmMU5HLzVCMERlbVJm?=
 =?utf-8?B?QUxhZmUyODJZR0xTNzg3a1NxcWlHSitlem9KcEs2UXlCeXlsWk5KUy9EdWxx?=
 =?utf-8?B?RlR5TmVvRndIOFZyN3VpQ0plZ2R3b0pLTFZiQzVpNC82NWF5RHRRMm1rWnF6?=
 =?utf-8?B?Q2FLZlBEcCthdkE1bTk4Z3MzMDJwK0Roc0NoNzVmc0FWVFB2VngwSVdrVXZ1?=
 =?utf-8?B?Slh4aVliMCsxK3lIQ1BoSytGbGE2MnQ2WmpEbndnRkhTaHJ1OVVVNmhIQVAx?=
 =?utf-8?B?V2l1cFNlN21LbHk3QmJuc3JRRWZhMjA2SEI3YXp5aTVCMm5uOHp3ZWZBSVRs?=
 =?utf-8?B?MkpGdGZkVHlmU1UvTWNOS2w3YXY1SjIyMnhHMjRmQ01FYlY4QnEyR0wra2E5?=
 =?utf-8?B?MW9HOFI5eVI5dnNLN1dlK2dsVXVkVzdWMlVjZkFoUSttSFZ5R3JDSEZLNE9w?=
 =?utf-8?B?Qzd0ZW81Rk9YdXJ2RURLQlhZeGhMQ28yNmVObmsvaHgraUxqUTZKdzFNVkh2?=
 =?utf-8?B?c2RaVlRaTTEySnkxbXBxd3F2QkJseHJhczVFajBFQkF2OFR3QWpwZjhsU3Nq?=
 =?utf-8?B?VEFzMkJaUlBmTW55ZXc3ZFh5TUI2VGlwU3Q0QnhtOWRlcU40RE9xSktnQTdw?=
 =?utf-8?B?TExYcy9xTU42VWlqaXFoTk0vaDJ0NnhXdmJBRW40UkxhV2lReTA1R3NXcU16?=
 =?utf-8?B?T2lDeE5QZUtZRjZUNEc4YVpJNHgzc1ZOS2ZWb3BqbzRicmRzVDkvZUV3cUtV?=
 =?utf-8?B?WE1aOVA5VEUraFZBOXVuRkpnWDFhSEJhc092djIxKzgyNmxha0V5Mzd0Z04w?=
 =?utf-8?B?ZlY4QldkQ0dCdWl1L0ZLTkl0RXFnQTVrVi80UUhjdlN5Q2NobHlXbGgxVmFs?=
 =?utf-8?B?R0tqb005UEZZVWxXTGJzQzdCMnVKWUE0aEp5RzVkRU0vWEVNN0Z4T01YS01Q?=
 =?utf-8?B?Q0RuL1BwL2QvbVAzd2hNNUVmRjMzUjdvdzl2RFBnaXplcWdqZEc5VFhERUsw?=
 =?utf-8?B?WTF2S3hkYURXOVFIZlhiaGxHUjZ1aGFVVElNR1JJREUzcXNjSWJKOVVzV0FY?=
 =?utf-8?B?SThLR1lpUlJ3ViszWmROZzJ4SXkxVTN3ODhUdHdGc1NoakpkRHBIZ2FBRHhD?=
 =?utf-8?B?Ry9rOUtQcjVEZFZGeVFOTzBwNGczZzJvQnhTWitDTURxS0lVTVhiTkJ3Lzl1?=
 =?utf-8?B?THZkb0dxT2orUE9yc0wxKzM4M1dDc21GeW93eEhmQmd5T0ZsZ29ZdHZaaUZC?=
 =?utf-8?B?UjFYZEg1WkFwMHhmS28yZGNJa0ZjNnZIN1NDdTNEaThMc04wS1B6aXFLdU4w?=
 =?utf-8?B?MWEzc1RieEthUExyemlGTEdXQXpUKzUwUTNxc0NDb0NpTTFTeHk3S0hxbXVC?=
 =?utf-8?B?QWE5ZUQ3cnNJMCtxWVVrM0ZheGsxbk5VblNUeWYrZmVmL3ZYTmkwMFFWZG9B?=
 =?utf-8?B?alJzbzI2VGJIQkhWWlBZTmIrR0dZYlZYQVFCVkh1YkZEZFMzYXV0alRlS0tu?=
 =?utf-8?B?RTVEL1pqaWpNU0M2Lzc4SmR4Q0c4Um1UZ2d5TEVud3hIVFJkbGQxTCs5dlhp?=
 =?utf-8?B?L3Bab3V5ZUJMMlpsYkV2SDhncE9ZR0E1QTVFeHdDRVRKN0pQRDhNcDF5aFN1?=
 =?utf-8?B?WUxPWTFhbnYwaGttSlExNGhoWmpSR2p6aFEydkh3RSt5UTVxSyt0dnc0ek1Y?=
 =?utf-8?B?Zm4zRUZJYVN4cmVJNHJGTGE0NTZOS2M4WS9PMjRxSXNFMzQzSGJBZG1VMDBv?=
 =?utf-8?B?WURQSjd3Qm9mV1AzbUpTRDdTb3hQckhMQUJtbm1HMXMxYU9SUEdEYW8yYzZ1?=
 =?utf-8?B?OVZLemZ4SUpIYnNpVFB0OGNMb2lGVmFLbkQzbE1zS2tGRkIvQU90anRxL0tr?=
 =?utf-8?B?K2ppdjNFbG5OUW82UEJFRjVBSGJwUWZQaHJtb2JXa2doSi9ubDQyb014cjJT?=
 =?utf-8?B?RG5qUVVmOFdWQ2plZWx5YkszbUk0aXExNXRDNVFwK0dTamxzVFRTRHA5dSsz?=
 =?utf-8?B?WU0xMXVIRW50S1VOVTk3M09jSmdyWlFZLzhjNHB5Z2tCOXRuUkZocnk5aUhS?=
 =?utf-8?B?R2Z0U05uZWNnZGtrMTJYemRDZy9DejR4dFZFenJMSnU3ZkxPbnp4dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a31d27f-5219-4bc0-25d9-08de79442e6a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:44:47.8926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bn+Co/SeESsL0ajZW9IA5CmYVtHJYpHc4QVCqQ6VkOn7vZZbQxGR+fBU1S0QjIhYiJPr8yj0M0tY70DPZNIHMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6623
X-Rspamd-Queue-Id: 251E71F4091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 12:43:01PM +0100, Jan Beulich wrote:
> Before adding more private stuff to xen/vpci.h, split it up. In order to
> be able to include the private header first in a CU, the per-arch struct
> decls also need to move (to new asm/vpci.h files).
> 
> While adjusting the test harness'es Makefile, also switch the pre-existing
> header symlink-ing rule to a pattern one.
> 
> Apart from in the test harness code, things only move; no functional
> change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One comment below.  The Ack stands regardless of whether you want to
change it or not.

> ---
> Subsequently, at least on x86 more stuff may want moving into asm/vpci.h.
> ---
> v5: Add new generated header to test harness clean rule and to .gitignore.
>     Also move vpci_init_header().
> v4: New.
> 
> --- a/.gitignore
> +++ b/.gitignore
> @@ -154,6 +154,7 @@ tools/tests/x86_emulator/test_x86_emulat
>  tools/tests/x86_emulator/x86_emulate
>  tools/tests/x86_emulator/xop*.[ch]
>  tools/tests/vpci/list.h
> +tools/tests/vpci/private.h
>  tools/tests/vpci/vpci.[hc]
>  tools/tests/vpci/test_vpci
>  tools/xcutils/lsevtchn
> --- a/tools/tests/vpci/Makefile
> +++ b/tools/tests/vpci/Makefile
> @@ -14,12 +14,12 @@ else
>  	$(warning HOSTCC != CC, will not run test)
>  endif
>  
> -$(TARGET): vpci.c vpci.h list.h main.c emul.h
> -	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
> +$(TARGET): vpci.c vpci.h list.h private.h main.c emul.h
> +	$(CC) $(CFLAGS_xeninclude) -include emul.h -g -o $@ vpci.c main.c
>  
>  .PHONY: clean
>  clean:
> -	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h
> +	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h private.h
>  
>  .PHONY: distclean
>  distclean: clean
> @@ -34,10 +34,10 @@ uninstall:
>  	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
>  
>  vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
> -	# Remove includes and add the test harness header
> -	sed -e '/#include/d' -e '1s/^/#include "emul.h"/' <$< >$@
> +	sed -e '/#include/d' <$< >$@
> +
> +private.h: %.h: $(XEN_ROOT)/xen/drivers/vpci/%.h
> +	sed -e '/#include/d' <$< >$@

Nit: if you are changing/adding those we might as well do
/^#[[:space:]]*include/d, as sometimes we add spaces if the header
inclusion is conditional.

Thanks, Roger.

