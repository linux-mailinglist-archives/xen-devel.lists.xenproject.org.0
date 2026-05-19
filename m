Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Eo4MsSADGpPigUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:24:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127358161C
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313156.1583380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMJD-0005Zc-0X; Tue, 19 May 2026 15:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313156.1583380; Tue, 19 May 2026 15:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMJC-0005Wq-U5; Tue, 19 May 2026 15:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1313156;
 Tue, 19 May 2026 15:24:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Edgar.Iglesias@amd.com>) id 1wPMJB-0005Wk-O7
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:24:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPMJB-00DAZD-0C
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:24:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0c8099-e002-0a2a0a5209dd-0a2a4506bd94-44
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:24:36 +0200
Received: from [40.107.200.68]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0c80b2-7371-0a2a45060019-286bc844dc50-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:24:36 +0200
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by SA1PR12MB8741.namprd12.prod.outlook.com (2603:10b6:806:378::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 15:24:28 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8%5]) with mapi id 15.21.0025.016; Tue, 19 May 2026
 15:24:28 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKZLqP/6Sc8wWaTL6rYRBOgY8ifiprFYvEp3rzTLaF7hlqXu1LJWhUji1ANn3LH0CQ07MW6msSUAtBa5V5WTADtzxrBAM+6mM+6g9mxWkUSPR4lBQRIpFBuscW+9wyqHQAR/+U4nJpf/mjVcopi18uIn5o5RiDDooOf/EEmlAOm252+ISwhjFSizngReKcMYVZZ9LMaDCAYtBwD2CcMgAvhj7zUS5TEK+2P7m6xNfCGaEC5UMaFIoES4LEDgxiFCvOLYiMHAtgiyySmuEXUrEQxZKBghjFROIp8nGc5v3KTHvwfHC6bcCzaN0XpARUOB7IVS5WvCoXhWY3rUgeqb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2FPL1DcUqrpzDA09JXWsJT5W314n+sIwMchd5dgiPQ=;
 b=b/UULwZl0m1cvTxsU5zf2/v0uWBAxDe3tM3PtmMJoaDqZPQx8QZYjc0z0GNVWqbgx16EEV9YuEkM09kQvTrAVTtXCz2qPBAna9UXbhsT74yBpgmY2fPia9ah0wqA+H+I+Kw8D8DB+Yd2i6Z/fs4ItapfUehm+7m9ne0qvsTBz/HbEHlYeVtDRN4yBmSt74JdMNHVNgeMzj6ExS7oc7cQLTwKtUqEYxq4pZvrKnemQ9+oCh9D0Tvl4x9Hfl2B/3ZsuNQielb2cXX0fwpLb2Jedj9/QhsNr8m8EQyplUt7RXTq2MjCscKlyZ2UoAU63zGxPdA9FeBszxfa5IgJ/+08+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2FPL1DcUqrpzDA09JXWsJT5W314n+sIwMchd5dgiPQ=;
 b=MGeET17aKfUUvdY6chFjvA3x8Ca6MR86bUsd0N2nIMd4h7HEz4Jfy6GHkGO+gyB3m0fP7FduQCKymvKV9PHvzssv+0c23+pSRTtOStDu5Lm4burDAgtkRxyUii38hPz31jId7iCXJp1VCN/fh0Fj1mBamksayrD4g4US5Klr/MI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 19 May 2026 17:24:24 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
	michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/1] arm64: Fix strrchr() matching of null terminator
Message-ID: <agyAqDWWYUunmYFW@zapote>
References: <20260518234353.453193-1-edgar.iglesias@amd.com>
 <20260518234353.453193-2-edgar.iglesias@amd.com>
 <9b8ec97f-02ae-4a1a-9abe-59873d574a64@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b8ec97f-02ae-4a1a-9abe-59873d574a64@suse.com>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: GVYP280CA0014.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::8) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|SA1PR12MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: 297e2c95-40d4-40a6-aa6c-08deb5bab7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799003|4143699003|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tmZTYJ/W6d+RlR8Eku8u7z3vQaA+90AyOYFa6tzTiIrUzuxnFNHkXlGyUabOicZTn/3uqf9mn0i4o02zrZeQjxBYYrmJonOQTmO+aj+bWKMgO2pUnMJenEDT7tQW5Abk2O2KFTdFDqpnQ8KDmtt3eLDTQa5G2gFyxvmNdWS+oYZwZOhXt5gKDdfAtEJOa7vluab1aiIHCxOVOTIjiVQz1EGvaXrPOVeyhNPNTzTXAJbkzjpkn9Q0aOQgspDoX7BUzSwhQ2XpjkrOuD4+Ef4+YLUwMaTxFBH2j6hf10h2sEzizXOIH2cSq/70xiWElp7FysEEKRyzVoIZWKflnPVy3cRHuHDnXKIMKMi9n/fopEbm7ELg64ddXHZzllIERhUWXVKsuUa6BUPTCAHAMy0vLBUYOSdGyU71oTFFEAjnjnnFllLZDeixkRRfI6Jgm31GcHMT4/ZP2jM7x6aOHHO6ftIS14DFPP2UeSWOys6tW/+LBjFB02WDtkYM4E4tKEy2p6MarzUs9jiWCU8k7p646ECXa8Gj4LYAZVJ2oURzVlJrxmJkKrXsrlsDReFSGUYs8CCgf7kXjg3OkgJOFkebMLvqVoZJAA/71cisZ1hxht63T5dOM2gLTc0XuuuH7w3CAKvbkLRu6VhLJb1BERKsKqnLhsi9kkxx7YWainPHSpdp4GvOjp5AsrI94oz7Y7pi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6839.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799003)(4143699003)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QBfjWozbAG8qMJNwstrHDXTcMAIKgNBSoYecip+I66M+yNrfSjbLMr4a5Sgt?=
 =?us-ascii?Q?5T21EEQJjmNG8392+nu7J5U0BgzPCS6VZjZrMahPT1Lj6rYokEz5M1uY41w/?=
 =?us-ascii?Q?by/Siho4D11bUZupIVB/NPQw6CkXa1jLiF17H0v2AWJK0JMQ3iUJk8pHZJbO?=
 =?us-ascii?Q?uhOH5ejEZOqT5geIEWWszuadcYgAAtpCECCRT8x1Z3Wxq1tC32ODrQnupeuL?=
 =?us-ascii?Q?rpDr/fnJbK71y8fZTHCFEUYp+YNBC6wwZQz4lObLEEM6NHpUuZCQwyI01mHz?=
 =?us-ascii?Q?wecMCxGyKkaVahPsgjKUfg2sEf7ubAcpqXje8xsQDWSvQL/cMtAwkBy+a2IV?=
 =?us-ascii?Q?08I8ngbA+VgSpRP5sZ+Z6OB4XbD2a1IVVN243YIIfT45LXlfHFBw5owfWqkO?=
 =?us-ascii?Q?xfpXVDvCmm4287JFsZVNgSq7fldykdJ1TrByaJD4tD7S8nJuPbcF7qUCvBJC?=
 =?us-ascii?Q?/qTP4FNFo09wMWaK+5IT420Hkaz9KQJKk34JPWWGL9bvxd3MMaHiTXociR91?=
 =?us-ascii?Q?ixgP8hS/Rcu1n2T2eKzD6gq253b+129gOc32XIVQKZk6/OE4kOtpXq4H4Mig?=
 =?us-ascii?Q?lJVZHjwnAqBgbzAWLW6oplQFn8Pzabk0CDKNfRrWE9hZvkDozanM4P8XBP6Y?=
 =?us-ascii?Q?ovq2JN6RKEMholLalz0uiJsfQ0G8C5pDJWvTvIMp51xWUINCGAZj/MhJHfqN?=
 =?us-ascii?Q?u+9QMgsg4QOicoQ4YcbVeYepdORO3AyEzCknmSdPuWfMp7ktFN9H68jk6AXN?=
 =?us-ascii?Q?TahXkrPXUSX9vQ2mpL/ZYcMpdf3ZGurr/U9GTi9GwFv1cdCragdWlHiZqZGz?=
 =?us-ascii?Q?KoC6z4yif1T5D4g32WIdnz9HT+en9cIVGZXHkvl7WmyIb4U9GbBwSFR5Q4Go?=
 =?us-ascii?Q?FDb0vKoXoWSjEgNA0XWUqxRqMJEO9b1NbjIH6g8WgK06i1TFfCnxIeyzrr3y?=
 =?us-ascii?Q?16GViuX0RTrGbPrXY9mWRcuwg7g5H+ln/0Vsn7SzJEMb4X3VLjI80d227gZM?=
 =?us-ascii?Q?Ierq32HbWcgbxd31L1zEhEqSwjx5c1v0Rrno+1UHGdohn5Wu5KHuqjJRsNcp?=
 =?us-ascii?Q?lLRiAf9gIY/QOlXR4vpq3/eeZx/ll2p/50GgLueHcSt117OjCVx38otA+gdL?=
 =?us-ascii?Q?ZCSc6/QoThE42TnHymclJ47Kb8VZT64y75G3O++n4o98y4DW1M67QNrsOSJP?=
 =?us-ascii?Q?VHtrx7IW2SgRdHJCbNFl3VsR1pONfzUsq6yoU4jTMSmwqhNTyTYOKPwyt5eu?=
 =?us-ascii?Q?fL00YkpL2/sGT18vm9767MZZ7Mnd1PO4MR+459G8QKMX5KzuQmTQd+dysZds?=
 =?us-ascii?Q?Oz+bWjC6NEdHWNx6b4OuqiR2qebDxW1xTPRk1ZcDMTSwMTjXOWTVHP28ERb+?=
 =?us-ascii?Q?VLf35tjKTL4Kpha5t0M75s9aXrQtL+why2CQxy8Otm8FyvgKTo3RJUhnqWkk?=
 =?us-ascii?Q?xIyc2ZVCxl6TFSB7OZ8bsJlLFC6XgNZE11SCoS+ctcn8RmzoQG/1tia8WXwP?=
 =?us-ascii?Q?XsxDcvkCXJCpR8cdjMY0CuRz5OyOi28WpixdXpi53Jee+z0hJoh1vDUqZTpO?=
 =?us-ascii?Q?VNHg9kdYonPgFZaveTpASrexMM2HzffqvaK/e/gH3VvX1Q7XsfQgYBV/mWg0?=
 =?us-ascii?Q?wG83fhWV8/5RuRlLhMhE09kV8m3v3DFXtti2Q2ptD5T+5YKlrRpCOMw6nBTG?=
 =?us-ascii?Q?IlUbpPL5SInPY0aXHPPiHhtIFMGbMiw1xd3f4pDBnf8jwV5C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297e2c95-40d4-40a6-aa6c-08deb5bab7c3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 15:24:28.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAk4bXmuVNNMLKXhzZ/d9kKt8wTjJX7eVf9iCRfWmQOWCKHNmTDHWoE4oHGUkoW/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8741
X-purgate-ID: tlsNG-16d1c6/1779204276-8E38FD75-99C6F12A/0/0
X-purgate-type: clean
X-purgate-size: 2748
X-Spamd-Result: default: False [0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email,amd.com:dkim,suse.com:email,b.ne:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3127358161C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 08:40:54AM +0200, Jan Beulich wrote:
> On 19.05.2026 01:43, Edgar E. Iglesias wrote:
> > The generic Xen strrchr() implementation returns a pointer to the string
> > terminator when searching for '\0', matching the standard C semantics.
> > 
> > The ARM64 assembly version stopped as soon as it loaded the terminator and
> > returned the previous match pointer instead.  This made strrchr("", '\0')
> > return NULL.
> 
> I wonder though: Why would one pass '\0' to strrchr()? If you want to find
> the end of a string, more efficient (at least in the general case) options
> exist (strchr(), memchr(), strlen()).

Right, this came from a fuzzer checking standard strrchr() behavior, not
from an explicit end-of-string use case.

I agree strlen() or strchr(s, '\0') would be better for that, but
strrchr(s, '\0') is valid input, so we should handle it to avoid
surprises for existing or future callers.


> 
> > Compare the loaded byte against the requested character before deciding
> > whether to stop at the terminator, so the terminator itself can be returned
> > when it is the requested character.
> 
> Nit: "..., so a pointer to the terminator ...".

Updated, thanks.


> 
> > Fixes: 42c4eb6a83 ("xen: arm64: assembly optimised mem* and str*")
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> However, the function having come from Linux, imo the patch wants to go to
> Linux (ideally first, but at the very least also).

Yes, sounds good.


> 
> Additionally, looking at strchr() - couldn't the code here be written in a
> similar way, allowing to get away with just a single branch? (Arm32's pair
> of functions is also pretty similar in this regard.)

Hm, good point. I had a closer look and came up with a couple of options
that look better. This one is not quite the same shape as strchr(), but it
eliminates one branch and shortens the inner loop from 5 to 4 insns...

FUNC(strrchr)
	mov	x3, #0		/* Last match, or NULL */
	sub	x0, x0, #1	/* For the pre-indexed load */
	and	w1, w1, #0xff
1:	ldrb	w2, [x0, #1]!	/* Load next byte */
	cmp	w2, w1
	csel	x3, x0, x3, eq	/* Remember match */
	cbnz	w2, 1b		/* Keep going until NUL */
	mov	x0, x3
	ret
END(strrchr)

Cheers,
Edgar

> 
> Jan
> 
> > --- a/xen/arch/arm/arm64/lib/strrchr.S
> > +++ b/xen/arch/arm/arm64/lib/strrchr.S
> > @@ -30,11 +30,10 @@ FUNC(strrchr)
> >  	mov	x3, #0
> >  	and	w1, w1, #0xff
> >  1:	ldrb	w2, [x0], #1
> > -	cbz	w2, 2f
> >  	cmp	w2, w1
> > -	b.ne	1b
> > +	b.ne	2f
> >  	sub	x3, x0, #1
> > -	b	1b
> > -2:	mov	x0, x3
> > +2:	cbnz	w2, 1b
> > +	mov	x0, x3
> >  	ret
> >  END(strrchr)
> 

