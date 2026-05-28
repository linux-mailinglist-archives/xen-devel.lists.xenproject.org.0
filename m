Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GRXI3FpGGrcjggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 18:12:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D335F4CEE
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 18:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321559.1588258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSdKb-0000fB-PO; Thu, 28 May 2026 16:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321559.1588258; Thu, 28 May 2026 16:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSdKb-0000cQ-Jb; Thu, 28 May 2026 16:11:37 +0000
Received: by outflank-mailman (input) for mailman id 1321559;
 Thu, 28 May 2026 16:11:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <VictorM.Lira@amd.com>) id 1wSdKZ-0000cK-OG
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 16:11:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSdKY-00HHql-Ir
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 18:11:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <VictorM.Lira@amd.com>)
 id 6a186925-bab6-0a2a0a5309dd-0a2a4506a978-30
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 18:11:34 +0200
Received: from [40.93.201.4]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <VictorM.Lira@amd.com>)
 id 6a186934-7371-0a2a45060019-285dc9045cfa-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 18:11:33 +0200
Received: from MN2PR16CA0047.namprd16.prod.outlook.com (2603:10b6:208:234::16)
 by MN2PR12MB4422.namprd12.prod.outlook.com (2603:10b6:208:265::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 16:11:26 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:234:cafe::98) by MN2PR16CA0047.outlook.office365.com
 (2603:10b6:208:234::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 16:11:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Thu, 28 May 2026 16:11:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 11:11:25 -0500
Received: from [10.17.28.18] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 11:11:25 -0500
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
 b=IvnL2s+t6LdXHOWR/DX+djkRR144qi42l8D6QeE5oiKLZK8DSqMI+h2+iBHKPgpQ8WnlrzciLwwZgGlUs+7JiS15sYXV1RZUGmjWtqf7V1vP2hrJg06PP0VPTTAJxc6GRv6uWcSw5O/yEQm6g8nJdRf8RcH3V1xbQPenPzPEZaWVWe9VMcTdHlwA22lbCZV91J4lgUhbmsZQt6EyO3CtL2Fwo9ic4mgLU2OyQVsTB9634vRC5MY6rM13ApJ6s+zZtws6gBEBkFYtI76YHIT+s8rhe7VNhjMdhYi5saHVHGBRJIEu7l9beCQPmJjEvpEo+UFBaJXaZbi/sDWnYiPlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWTaBrlPdk+Kem4y7pQkIR07B4zzAEMQGdVzpny1AX4=;
 b=byRGz1MSoID2J8gMog1OrNG2WOVEQgHYLynBS8B2sdwWL5fUp0mDY4X5r66nLnpm3wOb+gWKK6sWiW2I3B0qM4TSsQRQCFiyxLSZ/CkFDAjiUno/omfBxUW5NJJOVMhQTr/KKn/WxyWTgSRasU3ekou2cHw2IIOfsgIsRjCQHDJpYrFD/7OgitTGeXOUR/oXZ9JJa1GB2gHA54m3/UK0JcdoQ1efhBtiM0ZQwAM6pESZrwdmEPZVkDZmVwhDknwcC5bcCKJOSVTyNqdN7p5tUH5WshHDBN+/C/0jR0xwplf04ViNnFOL9KdlOt6AjWKEaG0hEKoCpGG0PoLFK9BtEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWTaBrlPdk+Kem4y7pQkIR07B4zzAEMQGdVzpny1AX4=;
 b=rfOOZca2RHww07KCG3qhPU/tcz7xinK5s+lwUO7GARRofpnHiUg6B8aXu21gQHrgoAIX+VxiEiRXoUUlSI9jHyt+u9k8HDNbMDiO22eIYxbnG2MFLh5/ebHPmZS+A36Ur8xDI6Cg7/KOKK4ATUMZXIylNyLJ5VHuJtjjbJKN6iQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1715c407-4915-4c40-ae1b-9e815a8ab4f2@amd.com>
Date: Thu, 28 May 2026 09:11:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] automation: edit rules for analyze jobs
To: Anthony PERARD <anthony.perard@vates.tech>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
References: <20260520225820.31550-1-victorm.lira@amd.com>
 <00d987d3-6a9c-440e-beb8-6587a3fd1d9b@citrix.com>
 <751c1684902e41fdd9d29b71670b49f0@bugseng.com>
 <1779452642.8631fc262581453bbf619ec5b2062170.19e4fa4847a000f373@vates.tech>
Content-Language: en-US
From: "Lira, Victor M" <victorm.lira@amd.com>
In-Reply-To: <1779452642.8631fc262581453bbf619ec5b2062170.19e4fa4847a000f373@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|MN2PR12MB4422:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6647e8-48d3-4d12-8d1f-08debcd3c4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099006|6133799003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qa7nApOq/UkdCUfBVsc4Obk9h4tUxy6tZMjhCAoWh01tP0OECbthR+nwiwvrVdfhhciT3eLQhAiVljSli5pzqm1iuFumrgW1tAiwvHf7rqpQZICjuULzaTF/RR4Ra+7ar3BWu5qzhU2E7qMk0sPCgpEzjuwi3MQs/2EIHivMAypFxIRbLlfKXKshn/KDWCMZHwaEsCe7Qt/wc8wol7p7JdMaCpmpCi3geirqw/6P08G5nSIyxRIASypJ4+O3mywIADZX9+MGtSzle18OfcMnwCN4+GfXVYk3fW8XzNFI5YcAi7qYkBY0c7EAcyAjPKeRm34hsIH9jdBLWk0Gg4RCS5bifmMYt0bLmQ8haJdC7jSnCGFdR4Cq/COjyyxSIsp+4E6dxB1voWK1X0vFrIQYiRnPF2ttIdxVGEAI/Is/vlLPIJfbTY5H6ZtJ+TbDamCRy28N6IRKfH2K3FYu6kR8v6qyF7eFkCULqy3dhtvEeh1HTVqDc5ATRa8wc+tdplCwgJAxV6iqVfC9f+j03iZI5mOADHjAGQApxwV6AC+1dNJr05fXrQnXtcgolyStbSJvO4i42XlicChsyQ4wlzVQwcuI3/a5qXKXcVXnreXX8ckhqBtG1UcrHUnyk9suqWBlD9mtN1Ozyh6uPX/hTIthyJt3URjiGa9yhjJdOzyr4mXOVvJ2qQhQKMOJqJLHwEm4AYZHMjPGLhfRQJq+MNDKyOCMlx52lP31nDDQ1ny8Q4g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n74M5w9YwGc+g1WwdQGi0XCYkgVeq7+b+umHhotv5HivHuBnignH7RkMv/ePc6WY1EvVrSkWbMg/uAwdLUEq5rLrKENjsuy2OdybuYQr+siy8IQ8NtYvILpmaQuWXNZNnT71z+ibmxb4MMzcs9P/107Z9zEHSLJIdGAJ4ZY9tNbICWjkyuj+LScztthPNcxBswsS0c82xYPIvKmaGAbY36YDbJSeSVhQKF1ccEkYY7+VAX2uNX1mDs0mAJ63DLsAOFGcwF0n1VDprOALfBYdPObOKCIxbavYTiaY4lZrj2vzNYpBRN7VQ3BjqQCqQS9CzpU1IA56NIGPbswLXXPO91sZPxMWVGdhMXO/qDC/PGvfQborcVIBn+gA6RmybzAzmfXK2uC2Vk4xMYT4iDvr7p6f5FuRmcgcIS/nBVACX1vu8Q9EAUMnZ2PgqfBfq0Z1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 16:11:25.9866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6647e8-48d3-4d12-8d1f-08debcd3c4df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4422
X-purgate-ID: tlsNG-16d1c6/1779984694-85D6AD75-05A96275/0/0
X-purgate-type: clean
X-purgate-size: 680
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[victorm.lira@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:nicola.vetrini@bugseng.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victorm.lira@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: E6D335F4CEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/2026 5:24 AM, Anthony PERARD wrote:
> The variable isn't set in the runner (runners variable wouldn't be taken
> into account here anyway). The variable is set for the group
> "xen-project/hardware", so for every repo under it.
is this variable ECLAIR_SAFETY meant to force enable the jobs as I 
thought, or is the intention to disable the safety jobs outside 
xen-project/hardware ?

in the second case we can do

     eclair-x86_64-amd:
         ...
         rules:
         - if: $CI_PROJECT_PATH !~ /^xen-project\/hardware\/.*$/
           when: never
         - !reference [.eclair-analysis:triggered, rules]

-- 
Victor



