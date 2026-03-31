Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBzXMRSEy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:21:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4040B36604A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268668.1557897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ULr-00074n-VI; Tue, 31 Mar 2026 08:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268668.1557897; Tue, 31 Mar 2026 08:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ULr-00071k-SS; Tue, 31 Mar 2026 08:21:31 +0000
Received: by outflank-mailman (input) for mailman id 1268668;
 Tue, 31 Mar 2026 08:21:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7ULq-00071c-CC
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:21:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ULp-006UIb-Nz
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:21:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cb8409-2eae-0a2a0a5409dd-0a2a45078164-2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:21:29 +0200
Received: from [40.107.209.7]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cb8406-fd74-0a2a45070019-286bd107a0b0-4
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:21:28 +0200
Received: from CH0P221CA0034.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::17)
 by MW6PR12MB8900.namprd12.prod.outlook.com (2603:10b6:303:244::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 08:21:22 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::2f) by CH0P221CA0034.outlook.office365.com
 (2603:10b6:610:11d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Tue,
 31 Mar 2026 08:21:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 08:21:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 03:21:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 01:21:21 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 31 Mar 2026 03:21:19 -0500
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
 b=bHWnIMyI3QNfe7GTjl2Zn7Kn20nWe/8/MeQ/U6Bq0ywboDAhsXEvHO+u4Vde/Ut+8Ity2n8aqCUIXMh3xReS9d4QVlidTEsdQ+vEKgAWmEucmAhZj8oLVgTybHOBUpa1Y3vvCwrrEeamIWIM4xvQgWngAM18rGrnRzWcaUmQRRx1zaLzIyjlwXamM8EuHvupNCPl7kNlgSzJ/qjg17t6LJSIb69KBsclrFAgPCUlULdm2iQh2jUzr2HZTlNaxKiThp2iUWyPu+socojbcd9PtLEcmSOtuAL09jNhJwIezNpBeTiKEsychYA4RE1o81w3YEBAJBJyQKGjyRd80ODNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L6G/yvrhwe8kYL+KglZ+wUrVvLl0a/tWctidtfUUEY=;
 b=pGmEOvWfkFt/F4VC2AkhArdFTZhnnkNNMwGiO4YZNfQjOrXb+8SVnPPXY9NcWHeQExqYdLdjzMncWim++pQdhgSd8JBnS8wzc9KaXGmBrwaUU5ch9PGZfLd4l8eXFOX3J/fKN+pFOQu72c78qsXf+LI7diyEUCemR+HgSxtF13HlDCpEjay9emDIlyKeX1TsLJ0Paz8AXtFxpmznfvO3Hh0iGjvMb0+MOM3Ahh3Ol/n/4/L645qQW0pnzEIKfWc2Z4AbL9aQWWK5nBCn0d4+nq70bqnVl/1a2M/A/Viv9gCW/3MNVUsr7oqYXX0fsy2ufXBgNv8D8cDgZGqBmwBTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/L6G/yvrhwe8kYL+KglZ+wUrVvLl0a/tWctidtfUUEY=;
 b=kg8OTgjBmTkrZou+5ztC8aI94y+dj+gloIWNX+IvjiBCeQU+scV7G4RSkUaA7boN2ajHWQtejOe9ymPUteUzNyYFTQT6cXGvARU9z/13H7pr1wp16VFSvSjAJKi8JCeAoJUKXvfj1GdMvsmXLnz3K31heOW3HskfuaYK8vV5vg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <4d3f29ff-9259-4b0f-bd1c-0a4dee516b2a@amd.com>
Date: Tue, 31 Mar 2026 10:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen: introduce shared_info_to_gfn()
To: Penny Zheng <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>,
	<alejandro.garciavallejo@amd.com>
CC: <ray.huang@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20260327075025.3008606-1-Penny.Zheng@amd.com>
 <20260327075025.3008606-3-Penny.Zheng@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260327075025.3008606-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|MW6PR12MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 50021b5f-4a82-4367-7ac1-08de8efe7e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YPuBDNOo5ey+xKNWhjedUyzcQQjvry8bTeUNBLeAelqb7BeDSvg+ajuGbVtNSMia4it0uxEipbKPw8B454TFSqLuiGohtaIGHAu+mxELQgaCTwYj4X8ykOWH0q0MbmPcSPBBrEU0uwkYatz4Pje7zOv9NTJDbUoGBiCm6qQYBkwqq1e1mIuWAqaOFuZ2xf+ML5VdEpDt+wE+gRq0eIfGhzTne+982KiFYWpV2YrEh6ZDntHb4yA7mC/NFgpbTUidMpAw8QR/hM568rkn4kA5fUwtGntLchUkj/S3i6xo8/t70qaxgR/nHRP772XzL2ltPJuE5P46W4WxuPx6PjHEBTHnZa0iDpM3gWo6XcZ5raaXLK23ry7eh8j6YHfTpQJ/dpSA63o0VCcHv/fQdHXoVelo3+WLaL/EBRgsUgRXkF7DKkQQht6lc0uXnrL8noJymfg3wPl5kkxjOJSKT5aYATMYK37iZfy2JX3uuL7RfwJrzVFj873uFUzbv7hqvsY2RMopMAVMnxGCBrEzOGDiYQnmfTZBZpUSGHMNxthqRaox1XCfyYxwp7LP4DN83xcxIw4c5EaEtVr5K6rGFU7xAVTlaT1io6wg0MG+ZrqsIUBkHaZTAEUZRN/OEsOUFJFB31HoWeS3Gkldz0o/Gr0bsDEJWgNDYHOFmhCYQNOr5yLD1ldqhvBl1bQct4wzwaVYjRa61MH6xbtSNCmHM+egGT+IauFQED0ulHfVjI/+3W5hMUxLKwxYJrMoXWRC7zKq90XWjM3VHH6mrC4I3JRUZA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MWbKb2HJmdVMNmdUixWq7MXfGiZHr+wasL3WmT9MKqS5Y/0Y2Em0g5TEUpyN3FYlVqzlofWu9TKtUje6SD6ywRSIEZV/LQgKZ33vmLiz73UI2y1IVlHOdk014GELeGcJfUJtu79SP08jtS4xJKpgWUdfSrCHp8lVZkjfcBCWcr5GR2SPLtfxFhAlCB7gSCwchMkjBUjFSkUb7zflf9pGlsI3asfF7+6hycvkBMGRTDQOUZszq7SuiMv5iwHRNNyS/+6hupTur/+gfDBJJeGI7vpPdOgckcWqaIH/9jHgF/qfzk4MkZ0XhCLcAW1pLsZArjIxq1oojMWLvVqMu7AvXNHIUvzkxvzeqK6c14JQN2jLJ/3A9CCL3xBtDzUYOWlOokKG8qgxU4TImlwBMKubX+KubZkHcGevr9ctOjDCcghVy3CEfjrcZTdKD+PCfPyn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 08:21:22.3648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50021b5f-4a82-4367-7ac1-08de8efe7e40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8900
X-purgate-ID: tlsNG-ef75cf/1774945288-4DEB3303-1D1C93BC/0/0
X-purgate-type: clean
X-purgate-size: 1007
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:Penny.Zheng@amd.com,m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:ray.huang@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 4040B36604A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27/03/2026 08:50, Penny Zheng wrote:
> On ARM, mfn_to_gfn() is a simple identity macro that actually does not return
> the correct GFN for domains other than direct-map ones, so getdomaininfo() is
> returning the wrong shared_info_frame on ARM.
> 
> Introduce a common shared_info_to_gfn(d) macro to output correct GFN for both
> ARM and x86 in getdomaininfo():
> - ARM: uses page_get_xenheap_gfn() to read the stored GFN
> - x86: simply wraps the existing mfn_to_gfn() solution which consults the M2P
>        table
> 
> Suggested-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Signed-off-by: Penny Zheng <penny.zheng@amd.com>
> ---
>  xen/arch/arm/include/asm/mm.h  | 2 ++
>  xen/arch/x86/include/asm/p2m.h | 3 +++
>  xen/common/domctl.c            | 3 +--
Seeing you only added this macro for Arm and x86, the RISCV and PPC builds will
likely fail to build.

Other than that, I agree with Jan that this requires a Fixes tag and the changes
look good.

~Michal


