Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ10MTh1AWr9ZwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:20:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A735087B1
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305769.1577923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMK0F-0001RW-BS; Mon, 11 May 2026 06:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305769.1577923; Mon, 11 May 2026 06:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMK0F-0001Oq-8r; Mon, 11 May 2026 06:20:31 +0000
Received: by outflank-mailman (input) for mailman id 1305769;
 Mon, 11 May 2026 06:20:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMK0E-0001Oi-3r
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 06:20:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMK0D-00GQWb-GX
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 08:20:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a017527-e002-0a2a0a5209dd-0a2a450b86c6-38
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:20:29 +0200
Received: from [40.107.209.9]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01752b-212f-0a2a450b0019-286bd1099363-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:20:28 +0200
Received: from MN0PR04CA0019.namprd04.prod.outlook.com (2603:10b6:208:52d::33)
 by DS7PR12MB5792.namprd12.prod.outlook.com (2603:10b6:8:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Mon, 11 May
 2026 06:20:20 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:52d:cafe::d) by MN0PR04CA0019.outlook.office365.com
 (2603:10b6:208:52d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 06:20:20 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 06:20:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 01:20:19 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 01:20:19 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 01:20:18 -0500
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
 b=HvrYTtCMlp0ILOS9LzkwyIr5cb4WJF7MToear3Bg9Tveej6ec+vzuwrb7MlNiwnNQQjyoqDwg6eOjN4+457lcK3g5lI66h2RHn6p3Dve69osHK3sbjgSirkCnY04wQ99Gq1dMNyoW3tlVde7wvTkiyIL0GYcePB0r/SaWUZQvKiIVbS0j/EoCf/Rp/gyDl55k9xuw43oHvC0J5AFcgg9JnSb2f2MoONPXFXBw/fkltKh1iDwjWUpq5qV01h6+xc4KVrhV2hUAa6WhuR4T2uwyJAqUQ4i349aDJeTJNb1VSEWNMTv6MF0T4Y2o0ZDsB9aPzdcAopOBQUZfGbPlhwXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdM50mrh+pLYS3OuhZx93MxruQNAV7za+f+2dsNIGHI=;
 b=vu8rH9OL6k1sLKsCRNPuUKLWqoyCrn3kZPg28SLRuq8ZxIT6pm1On/DwEGLOBX+li+1YlakyXulpXqIJT7gA47fdcJALngNjDxLlDfQlm7SJRRie8Phy2ne7prQzdYPne0v98a3iRsSaL/VG8KlmAkp1O1v/x7nPr35QmIYRhXOTR9T/YkiNVDWysANNmZojFIF8kgjwc1z67ed7aS1YTeHa7inTWyBxfRmmz3EAuAXYIaKK0gQkGB4V+VMTmuwwZhLdK2pwa9YJpY2RqarItVQ6ADMehzpIZko/zveo11Z2pk/CqISyV4ljruFiz4s49aPOgk8wFgE/TAWt4xJwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdM50mrh+pLYS3OuhZx93MxruQNAV7za+f+2dsNIGHI=;
 b=DuhJUDGTUT0ApIGE104cq5qXHSMeZHIiXOEdLvlJqBtu3R3VM7p2qom3w6WOyMCxtPr3QOXJQgpKC8Wscut66m5S8zARHxyuXjVGzXCVMWAGxqWqpKE5bQJpqzYZkB/5QRwnTncp7Yr242v8cUlqHiPE5WTnhgjr75FRsSxPOTs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d5f4943d-09a8-4a49-8179-d594022ad3a0@amd.com>
Date: Mon, 11 May 2026 08:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] CI: Refresh the Debian 12 arm32 cross compile
 container
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-3-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260508212907.1643761-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DS7PR12MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: a00b48ea-851d-425e-db29-08deaf25606e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uv1JRKLit6bJzJDyEuhUL2TYBWWq+5wR0BLwRn4HEC+QdyJE6pLUuw0DDMQDF3xgdI6ub3p1LIiSkD8+YxSIw+f76KXvEHKjPJtu1XirPhhVLuVi1pfoBOcmaL7K1mCyXTbokInr15VSh2D6tdM2Pw/jYMdVk7BzM94HMHMnb00nndznkEyexPu0UWNU/kf5lBhQlayWiTyiaSRfMb6+DPwiwnXJW4FJfCSHpxcAHpt5oY5mMzGDx69eatguL1NKNn9YWiVJspOHB5piapJ/NmSX6xdObhS5F3/0HtQs/Clv9rad6FqDvhuCldpjCkxHJD10HI5h/RX4Ai5XhZ0BV1yCI2rSxePEIDp93MW08S8te0+MEjQMNZPwn1MendfmVRQLzpsMoh6PU7/1hPfHICAX+Nqd6x0zTKK9Px4i5Zlng0MkatOWMGNfsRLBDw/I2opuT4reovRCFAc0ivllLakY14x0WBCePv8s7UDaTLnRkIT9ku9KBEWJ32gLp3XCnxpbpxm3AuTmHKKDDT6scQV2y3r1Gdglos1OamE6XWC3AmyjRDusnatGy2LEv3UgPaPypKU7WWmF5ouLRTFBJuH95sbINRkisPCI7FWkWvVFO8Fm7moIm6l4RqneoCsp5Usx/TgaBWqJzSauLDWgVCJaFZXXVqj67TUV+jUfjz/xfRHR5hdKXWAUCx4dhA1rfIc8R+Wye7xsN/I/pak99pGh4PRTP1z3oCagbr0uV0U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7veMQPN66XqAvkyGCc5+jfHd8yIhGKAnc2BEY6bzTBt7whu3M9ynyUaGQnjGGX/RZtkSn+6iYqi5TxEnRodYGc8VV913ORSNEe0o9dUAupbKvk2zPufMZwhjda1yNnO7NUanjY5wtL6SxlYh1qMqdL7Xsqg2HuL7IiKn1E4PjEyPjptR/MV+xFFSy/bsAi1k1EztB+THr20LwER8hEGtLvr6xeaZDy7ZlWUQC1H1Ff8iURE591YouJpV8EVOJwhLf0bEsXKsB3CaJ0a3dPd3RpizWIUMhmj9is3HRDqYEzmeA3P5dvGzLZC1Rh7jqn0I+mLgIWE6Zy7MLPoNrRbCcSXqkzuKWqE0jTQMubcnLBNPaPH0NbARctzaoaAeSgxEGebYFjQdy/SozShPG4NfYAqdwKvU/k4YCZzm2lEWHl0QsHE63DXWQY5Qgdx+C3/P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:20:19.9290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a00b48ea-851d-425e-db29-08deaf25606e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5792
X-purgate-ID: tlsNG-42698a/1778480428-22589F3B-5C8879EC/0/0
X-purgate-type: clean
X-purgate-size: 702
X-Rspamd-Queue-Id: 35A735087B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,cloud.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email]
X-Rspamd-Action: no action



On 08-May-26 23:29, Andrew Cooper wrote:
> From: Javi Merino <javi.merino@cloud.com>
> 
> Rework the container to user heredocs for readability, derive from
> bookworm-slim and use apt-get --no-install-recommends to keep the size down.
> 
> Convert it to being a non-root container.  Add checkpolicy as FLASK is an
> available build option for arm32 under Randconfig testing.
> 
> Rename the CI jobs to debian-12-arm32-* to follow the naming scheme of all the
> other CI jobs.
> 
> No functional change.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


