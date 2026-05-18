Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEvKMJ62CmoB6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:50:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36570566F32
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311519.1581635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrnV-0007En-0S; Mon, 18 May 2026 06:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311519.1581635; Mon, 18 May 2026 06:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrnU-0007DJ-Sl; Mon, 18 May 2026 06:49:52 +0000
Received: by outflank-mailman (input) for mailman id 1311519;
 Mon, 18 May 2026 06:49:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wOrnT-0007D8-T8
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 06:49:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOrnT-0075aF-4m
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:49:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0ab675-bab6-0a2a0a5309dd-0a2a4503ecca-44
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:49:50 +0200
Received: from [52.101.43.18]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0ab68c-672d-0a2a45030019-34652b124845-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:49:50 +0200
Received: from DM6PR02CA0130.namprd02.prod.outlook.com (2603:10b6:5:1b4::32)
 by SA1PR12MB6948.namprd12.prod.outlook.com (2603:10b6:806:24f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 06:49:43 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::d7) by DM6PR02CA0130.outlook.office365.com
 (2603:10b6:5:1b4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 06:49:43 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 06:49:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 18 May
 2026 01:49:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 May
 2026 01:49:42 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 18 May 2026 01:49:39 -0500
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
 b=c6AOCoVAyYfn02aiN+DUacLfty/GyC1/qHkbdPj2auyhJEyQ2xoZOozCdxo9k4ebXcGCAFfJqKEzO0UNO1L2MopCY1jk+8Q5kcs7TXYZld6lfLX8tFAvTJW8AACGm7u4fe6gvdWhbKf3EpKoMUBQPDFVaNs5BlY0uxyoQ/Bw7vWr/kH/TNxfrnEl9Zxxr8Pcymw4pzMmP0mYVXuhJpqzFK76IQoOfeWeoFp4azxsx4urIoR/vvhoKjKM2GtNegUuIZodVOoXff/Onjc6vPu2RZakpTMRsiUvRKTfFbiAQ6J0C4QAjWmXggD0LWxXR0z6zJ2SVBX/I7JIL52Zc3FZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyFcLFBZ/FHST6KrIS+sKf3VQK0G9mbIEtwtjkVCqdU=;
 b=TxeQnLbWFXuhu+9FVdh73JxBHsGy3MBXh/E45PrceDoN+PMAYqPXY44oTUvuMQSqzBWU3Zzty2fSVeOw/w2PUa3InBHUvn+w3D9WGDPDJXKI0DybuZc+cwdBVQh3G/aFAHLhbVtR9CF5cctIm9hnP50bd66lj2XA3iW7PRvDaq1vjc4WEzEniMQZsDrmLFNzfl3NzeAANo2pqOIH2XhSjbE99fExdll2SKkyiP33qFLT2qmEfXYhcNUxSXLZkBi6d2FhgrE9PLaYLO7Uv7VZDHTIyi8GUhPBAwDfwoNKKJrDl7j7MiHGHVVxrCpZNOTaPOeWpKyG6/NPj+7IK8oxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyFcLFBZ/FHST6KrIS+sKf3VQK0G9mbIEtwtjkVCqdU=;
 b=uaSdnX632DErEtitLZow3dz4EbqcSj8KdsEMB9Xb/SXLP4CATeyWa9a9eXyFKk3i4DRqwcpv41v0TfzCC3TlCq4GJZI+mt13r/4AWXbj+U/dt7Q6mbiGMWo+yAERUTBweFshgeAzejaV41+pdg8AmLcpyBHcS9UX8RzYu8WRZ8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <09274238-3874-4114-99e1-efd587498a8b@amd.com>
Date: Mon, 18 May 2026 08:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/common: llc-coloring: reject empty color tokens
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Carlo Nonato <carlo.nonato@minervasys.tech>,
	"Miccio, Luca" <luca.miccio@amd.com>, Marco Solieri
	<marco.solieri@minervasys.tech>
References: <cover.1778925998.git.mykola_kvach@epam.com>
 <0820f91dd0499e5f66f8961b5e27fe0a0ff9be35.1778925998.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0820f91dd0499e5f66f8961b5e27fe0a0ff9be35.1778925998.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|SA1PR12MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e311160-ddfd-4ca5-6e29-08deb4a9a43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|30052699003|36860700016|7416014|376014|11063799003|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2IG8CN5zh/Rg2MNfpezi5UlDTeIDth7OCu3FtHlpVkC+ks3wnVGXPmBynjAs5TWDPxJT6Rd0LT4J/nPAgcjgpIDD852PSGuLDfu0qQX/tB6zXwjBcFreDuc6yxcVGUrC3tk+WwHNsQbnQ7bHuyX4ZY4skPGWtDKcDJ+ZgHLAfFQq0HcAOKGJgEaL8ntzzDCExtA2haIbilvuYq3VcLb0bw4tuHqX44/tJrdE8qzqg3OAZgr3EjYw1mhEDgnTt55UHNLNv9UBblzIQDbbg1m4hXhyWobfKU4ZFAk/5nLywspM3S9do3kfV4XguIQVfThY8e1bQgybKYyX9dAmwgPM8qVOdCTipCXIjIa/XNvHaWQBngcYt66tsVzNmmkJNx08iylN2AOeVKkBV1iSmdoZFTDeVXr2g/DbA5rO1pI4L1Wvpir0VW9rGMa5/Php8YZ8owibPzyW/EfTieuyDw8guFwajmd1MGtnPmp0B0CXuLxGFDwkMcBwgu55ZU7nJTRnlzpfuCHGC9PHgVQlwM574TYU2CaexMAfrlID+L54/SX2FHOexUxovtNElh9nNlbuVHrIXDgFhX+K2cRTOIEBnHpKQe+YSJCqHZGpj2vuEPQZDiYTS5EuCv9DKtjDcSatbxAjo2cA4G2UhaBm/kHXey6PkdbO6+wIoClC32PmjyANMbZfyMbSF9BVtI3cseIs0B1yCjvtqLDtvey7m3jq7WxUCpuQynOBNrTDMpBOWaM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(30052699003)(36860700016)(7416014)(376014)(11063799003)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XcD0HDLX+RrXoKtcMt6cuTYexBQqbp5N9TccUCCD92rObKjI84t8syYSbLn2aK//nHoGniTYPHlpmsZBy5mz7vg3Cvy9i4WHaWsuFXDu85TKPaK1Rfh4Jg4XoyYiVMPWxZ8U/bdjcdkx3qQOufLZ9o/P34kf0LrFXGR7hgHsYvcHEnTdUCXaPPEQXm340RAJn5UkobB8GFvBcywurV/0Rc3SWgQnrTqqa+WYKLBdWxjQHqI7PL3Q64n7T2FWEn5hRHN5/Ked75mPW/QsvP86OIoBMuupLKGMW3PSMlSOyINDkdPtgkz0dnU5ojXRE/ItA9D8IYPGxpEXVevbW/mUb4zAi9gA9tDxc1GQVqZL5ZTBw7XtJTAk6UlrqdKITy3Qjh8rxEyNTwDWOLl9htG2IxTSbQ19vK/CmjKbdJ/fyy/Klj48g9/VM5ob2Q8a9AcA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 06:49:43.0399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e311160-ddfd-4ca5-6e29-08deb4a9a43e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6948
X-purgate-ID: tlsNG-33051d/1779086990-42F62938-322199E5/0/0
X-purgate-type: clean
X-purgate-size: 2313
X-Rspamd-Queue-Id: 36570566F32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:carlo.nonato@minervasys.tech,m:luca.miccio@amd.com,m:marco.solieri@minervasys.tech,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

+cc Carlo, Marco, Luca

On 16-May-26 17:03, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> parse_color_config() currently accepts delimiters where a color value
> is expected because simple_strtoul() returns zero without advancing the
> input pointer. This makes strings such as ",2-6", "-10,19-20" or
> "1,,2" look as if an empty value was color 0.
> 
> Also add the missing newline to the DT color parsing error message.
> 
> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
I don't see anything in the user facing docs that would make me think the
current behavior is intentional, therefore:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I will still give a chance for the original authors to chime in if needed.

~Michal

> ---
>  xen/common/llc-coloring.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> index 2606cb0977..5d00d4b40e 100644
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -64,14 +64,21 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
>  
>      while ( *s != '\0' )
>      {
> +        const char *endp;
>          unsigned int color, start, end;
>  
> -        start = simple_strtoul(s, &s, 0);
> +        start = simple_strtoul(s, &endp, 0);
> +        if ( endp == s )
> +            goto fail;
> +        s = endp;
>  
>          if ( *s == '-' )    /* Range */
>          {
>              s++;
> -            end = simple_strtoul(s, &s, 0);
> +            end = simple_strtoul(s, &endp, 0);
> +            if ( endp == s )
> +                goto fail;
> +            s = endp;
>          }
>          else                /* Single value */
>              end = start;
> @@ -334,7 +341,7 @@ int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
>      err = parse_color_config(str, colors, max_nr_colors, &num_colors);
>      if ( err )
>      {
> -        printk(XENLOG_ERR "Error parsing LLC color configuration");
> +        printk(XENLOG_ERR "Error parsing LLC color configuration\n");
>          xfree(colors);
>          return err;
>      }


