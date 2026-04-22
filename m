Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LnvKGVi16Gl8PAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:47:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F6445906
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290390.1569990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFW3C-0002UZ-4K; Wed, 22 Apr 2026 11:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290390.1569990; Wed, 22 Apr 2026 11:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFW3C-0002RY-0R; Wed, 22 Apr 2026 11:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1290390;
 Wed, 22 Apr 2026 11:47:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wFW3A-0002RP-DT
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:47:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFW39-0072p0-CI
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:47:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b549-2eae-0a2a0a5409dd-0a2a4501a632-18
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:47:23 +0200
Received: from [40.93.198.11]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e8b548-c1f2-0a2a45010019-285dc60b2dd2-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:47:22 +0200
Received: from BL1P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::25)
 by LV0PR12MB999070.namprd12.prod.outlook.com (2603:10b6:408:32a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Wed, 22 Apr
 2026 11:47:18 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2c5:cafe::4c) by BL1P221CA0029.outlook.office365.com
 (2603:10b6:208:2c5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 11:47:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 11:47:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 06:47:17 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 06:47:16 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 06:46:59 -0500
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
 b=YHEaMe+afAPcBU0bHlYIm+HKkgFL7io7FK7jwjovGmbrqD1NSCHHlXbzK1xIRMabXV81ZhhJw9nAq6OaBv+AHnRf8OAkg9h7Sv3yF0CkqpBraRb7Rvt2dYf+JhIBOC+sLse4AqGo8CqIWtutWCIWd4vRNqQe0ISjUsTluWv0nZdFXC0rUXweVExXOWYLRT6KaS2o53hcVfsHIERvx2mlarwcAE6Bu4dN0bGywN1Go2K/OGx6JiHYUNJ7Ys90lkXfmJkUJjz8xuXZ1VuxlKgcIvthkJyICitOW38AZLcEL/IiTwSB12L2nyqm9vDTvsoKgijcOezkbWnI43Y90zgWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KPNaKAHkGK41G1lb5YPQ7/mCKPBwAtQ3GmXqW0Zwcc=;
 b=C/ElT6Bdg8Psk3GozyJyPd3r6+7JikAUKwKuTywIoe67GjVuq65Ins/ifJY8ufer2R13t3Q4IPdAIUzUL2iCqPI6CTM9h48fKJYnlinpJwLaO0GMP0fEzciGrzq3PBwrWoGi6P49bnH+95FWINCsKPbh7w3EclK8Jk/QlE2cdVTFZpxNKu8e5N00uMFw7pb38huTpVOtpPlm/0SK/rEg6cV6TlxKGwTjsmlcZmk2owYrRmfsW2vwc+JjPqPDGJ2+IKEazO3cl8NfSE+0xESqOY9vFDmSzVTF8C07CjM7BqpSc2twZXi926MZAVy/pFniW54Wubk+RBEe9/uWUEtJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KPNaKAHkGK41G1lb5YPQ7/mCKPBwAtQ3GmXqW0Zwcc=;
 b=F+Vnwqc4tigVlnZdw/VQyzsijDmFzRtlpVzfsPqDPGl4nwZMECqO0f47aGprV2qhPj9dXvVVKBiSzA0BlxlNPY7CrJM+d4qbQE1WtBCci5dY7wvPBQiI9StISMBQXq4tv0ZGUjDUdGPVM5YnucjhWBhaBqAoKAJH1/87TC0fv08=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a4f8660d-fd77-46af-85c1-db2be27429a8@amd.com>
Date: Wed, 22 Apr 2026 13:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/dom0less: pass kernel_info struct instead of
 fdt to make_cpus_node()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.1776780944.git.oleksii.kurochko@gmail.com>
 <2617586205ec7b07a302fcb8dd9dd39f3eb2c5ed.1776780944.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <2617586205ec7b07a302fcb8dd9dd39f3eb2c5ed.1776780944.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|LV0PR12MB999070:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c07f73-50af-4478-aff8-08dea064e800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3d2b9XXod1XtwWYlOedlO1+Qn6yePBS0NIj1ymAbsuXoGJAKNijkJDEj1ajDC8H2OsZ94Mz59EtsgIeTiw3M/zlgq9zfmpxxEb+XGkS9zQ1KxWgiVm7n9XOnmymeqTFTDbeyTLJAhcz2GE05zkMSktjvq9kkxvRV7Dm8JQU+m683+cUfpimwvK0O+bpZx/kSwXHpdRn9ERl11wGua4XoA/02zbEi7JJwZ3KDeVF0nV1dEVXgsuKmwwJvI6R5W+URD75RCb6qQcKVM/1Zpqbr5FQq0CzEwm7JZSTEHw4i4g8FKQHCKkQXuQiIHBIh4ABmUq6ZunJFYtmV9nW+hduL8P4BIcMjbcCU4ABjRWblljqxva2fmHm8/RLf14SGUMQ7Bz5eTeedDRFTVc2gCnAN1g6CGcGDS+3yG7NMsX5pjAhpMNSvGThgf6jNRwNz8/F9ReoGxR6oVokpbxaKudmlZvrclmbRT5J1dGuc30Pz1MPWXgT0F8ly8XOgEuyEW62CBovJfc6vsX7glWJ6YYn1mxEJ0khRKPr82KAW03EwQHsfGoI5V3s5mXp96zwcSXzZS3qqANdnByRSlDurk9gXRSOr8JqiENq+dTcbZjz48QYL+kfzU7VP7AVHEEWDQ3U//p0MmQTfRfodRtxh5NGjrX47gitbdUCX0uvZKlTkCDNfdOYNEwlx7oFinxsPpF8nokWZz72w7qw7opsk217vKw86QcFDvSMb1Fz1yvf1+ZrWN6T4+XAWoECj34dEbgJMqNXi1TEyBLzzkY9oQaOK1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4byrWqZdr+vjTnAH95hbjQnJvvS6muMBDSHY0cvj3P1YMNpCw+gAO/noHCY4Nbs/GNderUyCoQmR0OGVEsxoDrkd5g9XMMOLpulNDDsahRIiSc+SlgsNeHbmriot6Oo8l1EBmoSf8/9NdvdxtZtFh6J+6Q7o1mG5A/nP5GuDkZ+jsW+A411kzhUJ/V4FDeNIeEhi8JQEQ6L0z3kj/fQu+y6lvqTmBC9Fg4ENQnh6ThE5gHRayx4pm29087fR0jDH9Nctc1VpklNrzwUV6nJTn+yGACpy2LJC+f+P/uTS/RGVA2TMyqxwNnboi6wyLP9lJ483DKqGWRy+Zy3RlIm4ixS250QjLCf45TwWIKy/FZHOiFhSwSAXEtJaGjbyAbwdK53HUJGrrunILXpYkqmQvyq+8zzOGH3fN7C3wDa95dYelJgzyX3oHg3gHGC8zuZa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 11:47:18.2273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c07f73-50af-4478-aff8-08dea064e800
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999070
X-purgate-ID: tlsNG-d62444/1776858443-B7C74FF4-341877B3/10/73395122804
X-purgate-type: spam
X-purgate-size: 431
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: BC5F6445906
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22/04/2026 11:44, Oleksii Kurochko wrote:
> There are two reasons of this change:
> 1. Align prototype with what other make_*_node() are passed.
> 2. A follow-up RISC-V patch will call get_next_free_phandle() inside
>    make_cpus_node(), requiring mutable access to kinfo->free_phandle.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


