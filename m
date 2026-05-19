Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P02HLOBDGpPigUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:28:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1748581747
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 17:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313164.1583390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMN2-0006Pw-H2; Tue, 19 May 2026 15:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313164.1583390; Tue, 19 May 2026 15:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMN2-0006N2-Di; Tue, 19 May 2026 15:28:36 +0000
Received: by outflank-mailman (input) for mailman id 1313164;
 Tue, 19 May 2026 15:28:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Edgar.Iglesias@amd.com>) id 1wPMN1-0006Mw-GL
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:28:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPMN0-0013Vn-Bq
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:28:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0c819f-e002-0a2a0a5209dd-0a2a4503d486-8
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:28:34 +0200
Received: from [52.101.43.2]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0c81a0-672d-0a2a45030019-34652b02ca67-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:28:33 +0200
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 15:28:25 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8%5]) with mapi id 15.21.0025.016; Tue, 19 May 2026
 15:28:23 +0000
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
 b=MV03DHUdzvs0GnxqS4AXJx2sXPMeVh2+IlkReacGVyMvEwc3Ae/hR5F1cVEHROO/+dGYR8NIyi8SCYFh1LJPxY0ZjscthC5GIdTy4OQsWi5D6ikoyyXMj7h8wpYF2whCtXxuAP+wjG3NWz5ulbxZyOIKIMA/gQf2pQGRZiQUoDPVeG4tte7hGpWAoUrGfIkai0AE7hHlnPI0KtjcOe96Gef4ton+hyMkS8+04A6y4EhS3aLGrp0JqS68GHaq3g0OO1zU2QTtnccIpSdbBvRlHf+UnxbFKS1c3F1oB0AVX7OnKiV3uV5ImvFlCG86eiSu0Zh1X4QCWocPWoTf0aFMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLxL1355H4oAxjE+x6aGUjZQyn+L6Reedm8G67kkc8I=;
 b=E+VgaPJGDdIcipm8w8vYKjp4q6yMLcqXTyOP/0cJ6qlJyPyrj1NUhiY+cQ3ktLAb7NT2EXXXNR3RY4l02eTCpouVw6B7AEqY8757XYf6YMmVMAbvgkPWhNJBTtAa7NEaYf46u9jyM3TSFh3Cx29GVcReoShy/cWDWVMlPFEu1stJ3/5COavgALtO/d1XxtHvJj+En04oXJVSoFoKsgv+WBRV3joVphe8wRD97+wnxLbNlKt6dA36Sno3IxlUwVLBQSuh+nZL7lIl7iyuMFMhhNu0G/CaL9QtdKk9kjSevIUVwmca4jff35eZAPmLwM3EOzfSKlF/Sk4BH4ncrZmwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLxL1355H4oAxjE+x6aGUjZQyn+L6Reedm8G67kkc8I=;
 b=pauqsv+y4QDMCTPrk2xkerXMO11M6GtbaMyvOG2uV80qBNBtDN00coCfhAie19A7pEsB/FkQ7K07p9qh/KnMOv8IcrR0bw5BSRo4/K+K6x4+YtOHVktgjTzv5qtjbmPLcYKKFkEBC7tKHYGix930do2oK53hvyAvz4tzjxZ1Q1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 19 May 2026 17:28:20 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org,
	bertrand.marquis@arm.com, michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/1] arm64: Fix strrchr() matching of null terminator
Message-ID: <agyBlAsqtVEv5c38@zapote>
References: <20260518234353.453193-1-edgar.iglesias@amd.com>
 <20260518234353.453193-2-edgar.iglesias@amd.com>
 <9b8ec97f-02ae-4a1a-9abe-59873d574a64@suse.com>
 <3d1001c8-6761-41ba-83df-42c83a453f3e@xen.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d1001c8-6761-41ba-83df-42c83a453f3e@xen.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: CPCP307CA0004.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::17)
 To SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|IA0PR12MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: f67f9c87-520c-45e5-5378-08deb5bb43f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|3023799003|4143699003|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	yueoleGg9KSq15ln/FGRgLaYwz9ApaGeGNI7DNgDxx8LuU+ujkQiXiwSgDBaJrIjMcc2DsF/YvmA8D68RUbrER8AwocPMqFZgf3ec7GgL1+JWUa3XHNDdRpcsmGpgYGbQcTwdDy9MFDFgq5qcTHiNtXqRYYNf4hfWljcQNOF9a30lYVmlPM01iL4x29jIuV7vL1fL0H3rLL/23D+XgTDFfcgt1hJLEjtsjIb/z5165YkI9/VgzSXEoR2C0gZK+Yh+tO6wlku8qftM69wYTYv6RE4fioJcz2MVV4uGO1zyuY9DslwPjkN+fsuGTTeJN+ImgSa7u/CjWEQdE3n9KkQoPmsJbxfDDiX7CAwRi6bYN66OL3BPCoA5OX17RMLd5yslbx1kSpUwtMVMmNNWUjlff5Z7Suvir+GQNFmbWTeME5Gb/9+g//UE0rfjSYVez9zvU0k1BFn9bwWAOO8VpTjRu+e6NThz+JwXasjHAb9XdJnITQFRNGusU9JZol2SNxEtef+MqW+u3+cRNcGT2erZ8nYQiKIOPiPcPMMomLxFTGOf5PYCLosDDbd2f4GYj0jnDCrF0GcXw7tkGkthOepbMmm7Pw0/xon4KuG71Fg7tBc0sIGRMCtrB1zgApLrv3pshg6kSacC4cyoRvyApZC9y11i9J7l+HE1Atc8QweSlYuTlFrtbUuieRxnjNPJEPv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6839.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3023799003)(4143699003)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PHVaY1qJLDGae23Sz+Z+g/asK5pATlVMZ9iXXHUsT/F0UH55T00hLlxeN8W+?=
 =?us-ascii?Q?ta3uW+mWSSBAZVRLhgxa0lJhQhjuh2VKcyNN9+Gf46jdbTMhFVJh0/epspL6?=
 =?us-ascii?Q?Sra/9eVpymGAGv5bJFWBjHpt2HxuXdVoKK6GhWSO4Giabm/8IXO9PbbpTcYR?=
 =?us-ascii?Q?yL9AAHi/z37w/1e5Cq2oNl0YyqH4eNTYUU0/CkYd6E/UtUqFG/hjH8Ynd0Vv?=
 =?us-ascii?Q?InDL6CLKH7RUtCvXbwc+dTR7cGU8WKjEydk3MxsRg7QvL7AgRDEBREcxTHdg?=
 =?us-ascii?Q?xjtOwH52aS0UL/GzlLU/wAqAgym6imDmWwEo7msQO4A7yQTd5U1S14PUi4MI?=
 =?us-ascii?Q?0FkBKGkm2ygTxgrcAcb6uWf0vyvzCLokPvV1XzNiBY4vJrMVCeBV6G/lKHyC?=
 =?us-ascii?Q?x/G/rAOp2wHVHsNqh71lwcdusWgaobVw5mxjBOwvpxNxmlh8AntAiStYuIN8?=
 =?us-ascii?Q?W5AMj6mGPLmH6VuSIpIKDqhpFE+wZaTYtTYHR8WcORZfRDVPevbz6ujczVvv?=
 =?us-ascii?Q?IdpLMXpk+em9nFDOjq1C3asX4xtOVkjQMe0viNAkyfkyVkl+jscEpUU1LDu7?=
 =?us-ascii?Q?PZlPUrWleWAj1BBaRP+2ttEHV6xFR0r7j935HGle8FicqiBmzFlfQuxWcVNs?=
 =?us-ascii?Q?5h7v7ToAZrDokLi47+C2zHWPmoK/M6DlcQBZYzjdWxdXyfOZO0Y124gnrmuP?=
 =?us-ascii?Q?u3Tbg67jlAKX3abkYkDfTKlc/ZZaIE8GRmYnBlQMNlzmtEbJ7OStKG7OHqvI?=
 =?us-ascii?Q?VLZynlOfaAlAIZxGWBxzqkXsO0TBMz7fs10bQZtJ/UxKlk52PcFTzeySdFu/?=
 =?us-ascii?Q?QgyNy/KVTwNzukRCd6Bu5YkYFBbT92l7ZB47+u6jEaOnJNKeSwtSiQd2jXce?=
 =?us-ascii?Q?EsiDfgn4gAM4SiSabfavAkuIG2OeQSW3Sn7Qw58Jc1TJ6S2RzTxI4OAAPN+X?=
 =?us-ascii?Q?fQ4gcWlWFLrBsF8qnv1vYagP2x9nSDKPizdAsPppuTbWHYewT61SPFpnPRKK?=
 =?us-ascii?Q?fNJHSeRupyPMQlzgNZHXu8DAvxnMhaAcwNWtFGJ+N5rZnwBjJjidMRSLqrqP?=
 =?us-ascii?Q?w8uJuB3yPeMfK0Ng3rSpovjRY8cQCLQc2wir0cxnCBXpJjbxgYd8XnxsWXsA?=
 =?us-ascii?Q?qsPdEDtT30jYlrnYkyXFfp2j/kgQpgZZYmZgS6fWgGTZVv0qtqK7ItLzigAf?=
 =?us-ascii?Q?RhIkE+1RzCtOprYuarjO4GZzW94B7OJptpsxrIUNjsBKTJ3LqilBltUhzym5?=
 =?us-ascii?Q?ETXyM36+iSDSh04mqMyAT98xHSa24ns/g91zQaLwvrqZSQOVEEUL/U92ChjV?=
 =?us-ascii?Q?GrGrjPyMwrEhIwHaND3ZP9azOyJh4dPq0+IdbqS829Yf8cYvemcPOe3N53SJ?=
 =?us-ascii?Q?Eo3EgLNvoOYYEm9dWRSTScCAq8+g3RocneNBbmgoF0xh5Y2DoEEjoWMqj+T1?=
 =?us-ascii?Q?RSURZhDDXziWNUabu+ATxrXhwe4DSgrgcZgW3IJJ6EVR8X0NHhipJbjEUkRi?=
 =?us-ascii?Q?p+U2k4gKaQupt04qG4hDfk3WGYvKGaeJBbWvfAGntMHfXW/yyAEHCb+8Ixmq?=
 =?us-ascii?Q?dIR7cHg7Da5cTnTamBvC2S0oEgvu7GeLq/NFzUAsA7E6c+91Gm/9tQiFTCMi?=
 =?us-ascii?Q?lfQInDWngONqOSCHgEqS4Ji3yeQOjjA1iiLcv2bs9JB3CsU8sgR2LJUAeGaQ?=
 =?us-ascii?Q?M7whSb3BxTEdW+nUxoSPOOX5uTPYk87hU4/003xos2Bc6gv4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67f9c87-520c-45e5-5378-08deb5bb43f0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 15:28:23.7600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOxuofKU5Q3D+zdTc1bMiGqtAzFlOV/hXn0rec08Qq5Zo9iqglaP2oW/AEqb1u7S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205
X-purgate-ID: tlsNG-33051d/1779204514-3B360938-F3B59085/0/0
X-purgate-type: clean
X-purgate-size: 1856
X-Spamd-Result: default: False [0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: C1748581747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 08:47:17AM +0100, Julien Grall wrote:
> Hi Edgar and Jan,
> 
> On 19/05/2026 07:40, Jan Beulich wrote:
> > On 19.05.2026 01:43, Edgar E. Iglesias wrote:
> > > The generic Xen strrchr() implementation returns a pointer to the string
> > > terminator when searching for '\0', matching the standard C semantics.
> >>>> The ARM64 assembly version stopped as soon as it loaded the terminator
> and
> > > returned the previous match pointer instead.  This made strrchr("", '\0')
> > > return NULL.
> > 
> > I wonder though: Why would one pass '\0' to strrchr()? If you want to find
> > the end of a string, more efficient (at least in the general case) options
> > exist (strchr(), memchr(), strlen()).
> 
> +1 I am interested to know the use-case for this change. Is this for
> compliance or real issue? If the latter, can we add some details.
> 
> It might also be worth to write a selftest to avoid any regression (in
> particular if we decide to diverge from Linux).
> 
> > 
> > > Compare the loaded byte against the requested character before deciding
> > > whether to stop at the terminator, so the terminator itself can be returned
> > > when it is the requested character.
> > 
> > Nit: "..., so a pointer to the terminator ...".
> > 
> > > Fixes: 42c4eb6a83 ("xen: arm64: assembly optimised mem* and str*")
> > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > 
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > 
> > However, the function having come from Linux, imo the patch wants to go to
> > Linux (ideally first, but at the very least also).
> 
> We are trying to keep the core implementation in lib the same as linux (see
> arch/arm/README.LinuxPrimitives). I would prefer if this is also first
> committed to Linux and then backported.
>

Sounds good, thanks!


