Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Jv3LT4PDGqJVAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:20:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DAF578EAD
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312449.1582537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPEkX-0001mK-7V; Tue, 19 May 2026 07:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312449.1582537; Tue, 19 May 2026 07:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPEkX-0001jq-4d; Tue, 19 May 2026 07:20:21 +0000
Received: by outflank-mailman (input) for mailman id 1312449;
 Tue, 19 May 2026 07:20:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wPEkV-0001jk-Qn
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:20:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPEkV-005ckq-6x
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:20:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0c0f30-5cb7-0a2a0a5109dd-0a2a450bee00-4
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:20:18 +0200
Received: from [52.101.193.56]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0c0f30-212f-0a2a450b0019-3465c1386552-4
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:20:18 +0200
Received: from SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 07:20:11 +0000
Received: from CO1PEPF00012E84.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::17) by SJ0PR03CA0158.outlook.office365.com
 (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Tue,
 19 May 2026 07:20:11 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E84.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 07:20:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 02:20:06 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 02:20:05 -0500
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
 b=INPl+KLtWhyVoK4b0YOjtJ8HG95Z5qRIiNt5OvTHDuENZlym2WbIRsXT2HNDi9JKXe1BI2nxFnZMGmT0UC0BrMjPmFyjLOTsLxoBQrhYx2jbmwWPvwfUXlFCotl8rIDEiZzgcJ4EFfIZ8PNLNwqYTkaPy5sDdF96Z+xWZfU9KIY1DT/qE04mxkCpM8ikw/jKuY5UyYYY7s6KSBouT6A/XJMVcx/LGDQ4/n3Y5AtQRBaQWowonXRsGlSLu+xEjeqcYJDiyxTnIx8vX10FQGYubnMbb71Vi1SNG8x72IvuxytoMa4fnTecSSboW3GwaNb0z87wjUrFnN2iQMOFSXfrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z16yhBir+oCgVOrPPXL53jORhztnzJIqAkRmY0B6nyA=;
 b=asv7GoP4bGbDbacKkYJF2Aj4IjniioqEOptxhkbfXfeGFLqoyEt+YMLoyV/eyTuXuxSw9GgKhDRDECPrnj3e6QmijyCX2fxyqLrrFOlXsUBYKGDVd/+mVL/MZb4BGA1dGHLcbvYmmX4NIEB3/Vybk3mfiVRo+5Ziw8Y0fe/rTFPLO8K4xJyT8SvANXQXbuu4sKQxE8IuFS/sTBjFH2mr2gnjVxxbHDu7HiaPZ2iSPfstjSz3D9VUhIgUK4CfykDZGw/3LGzGIretNup6KEfnITxFFr9c9zwOOY3cECGF9yh63tZhP8OcLa5xkjBEy8mU14g8oABaZaKyaK5EYCuXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z16yhBir+oCgVOrPPXL53jORhztnzJIqAkRmY0B6nyA=;
 b=DHTp2yX4+bbT74XOop1HN39a0QTVqxWSM0LQMDU9AdwrjOA3MbFtX3s/qyDAd2kRp5VpaUfpaU7N+oAYD1Zs+E/XB5b2M2290K1sDXaq4TuE9XjwKZCx6pFBmptPt7w9PAo0c/YX4ay8u1DJTVW9spsDxkObP5UnrN54CQsTOY4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <64094528-9c9c-47d4-98b6-640df0a9df3b@amd.com>
Date: Tue, 19 May 2026 09:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gic-v3: Fix redistributor wakeup polling
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260518070524.19813-1-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260518070524.19813-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E84:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0367f1-186a-4c68-73d3-08deb5771046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	2W3i1qeab+QYwrAZLReEpOsxJzQ2O2un6CPdH0CdJZ6Xy/gL8pw2ruKpeIK1a657Zcxu/UhSC0PAiFQaRkYbW3jcOW2ZPp0qA58gYY9zMPfg/EyvafvLApLmNWERynW6VDTU6z0hDOAVa9XU0iyenHqV4tCgUZuW7y839fHbCV+fqNh1Kz/hyKi+Y0PLwyK77vX9D5H1TRInv8MxMZZM/ezoTfG6STrRe0glFa2GEAbSBf8IN/tXz3JlNCpvpLgFbNlOeuWpn4CrFmhlA+O0xHmBlhrZxpUY7I4lDtDUcXe+aMfyXHbWbavbfmny9ZUwW+qwpTbd0NQlYn1/HxUSgLy8xKxvzRtQNOM5DJNooeoU6rXaosFPsdsptGMtgem2THtHGe9DxG9GQ99JURG3RN5S8VhvcFPRhtZNwKoIgJfjccV4TlTtpXIqMmUF8Osd/HhlxF9pBavrkKehT31mzbbmej0243GP7kzxTOD0ZZUITAxedukKR+zS7ITcF0YdBxWX2VZ4zRENE95TPFaErvSUBm1kDEPYVkmVfsYqndHBhSpQY/CVsjnQRkCADuHG6C8KjfMz9caUpo8BnCtDE6OwOnu4lKhgTzppIrAIjYAV8pMYBx8g2TfjNopl4AYRx/WvCKPEROquj2IlSpZuPdSvgvep1KknVnIsl5y6YV1ov83dLhNV+qxmvhEbPgz6YidqSNYg1rlXRBYs7rApw4WYf6Cs4jyOBBJPWlwHh/0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mAqnxGS7cBy3QlpbAZwULSwesazYpXzub6bLJWx0M/fW8h2WyhbatBQ9mCl9H4ZTRoPehGjI/Og6MXc2AD2SUrvYzzyia96pG6t5ztJRl9IL+to+YrhjfredKIHX8njRc5/YiJhKm8o3ciXYWgY9F9MXF2JdbklLGCNbkl0rhDrM7x6fR5pl7o5g5ZgifyQYA1Je3FTdpAFv17G43I60DirxsCfoo+bjJkSXXMvg1W+t15lpF+M73oXJu1R3pd8vgupQ7ugvHxRfZRFC4jynjqgaNlqnB2wlodoUw+xgtqvEfahWVQODBcxJdIq9SKe3Pfk3qidVtcX0dtZVzumRLGPrssd4AWDP/j7/FPgWT1Y6d/fx1Ro+lE9MiAY1pwcbNHPYfnn0tgvDaPX6Ca2WEtY6H5AT/fIjWtEIxVgdeNnmLFRsnKJw/Dc5EWJEaWYX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:20:11.0637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0367f1-186a-4c68-73d3-08deb5771046
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E84.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391
X-purgate-ID: tlsNG-42698a/1779175218-13F7EF3B-BB960D17/0/0
X-purgate-type: clean
X-purgate-size: 967
X-Spamd-Result: default: False [-0.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,arm.com:email]
X-Rspamd-Queue-Id: 21DAF578EAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 18-May-26 09:05, Luca Fancellu wrote:
> gicv3_enable_redist() clears GICR_WAKER.ProcessorSleep and then waits for
> GICR_WAKER.ChildrenAsleep to clear, as required after waking a
> redistributor.
> 
> However, the polling loop currently uses "while ( timeout )". Since
> timeout is initially false, the loop runs only once unless the timeout
> path has already been reached. As a result, Xen can continue before the
> redistributor has completed wakeup.
> 
> Use an unconditional loop, matching the surrounding timeout/break pattern,
> so the code polls until either ChildrenAsleep is clear or the deadline is
> reached.
> 
> While there, also fix the timeout message. This path polls
> GICR_WAKER.ChildrenAsleep, not an RWP bit, so "RWP timeout" is misleading.
> 
> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


