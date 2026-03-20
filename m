Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDKjH6EQvWlf6QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:17:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A32D7DEF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:17:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257915.1552163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Vyh-0001KZ-BX; Fri, 20 Mar 2026 09:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257915.1552163; Fri, 20 Mar 2026 09:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Vyh-0001IC-7C; Fri, 20 Mar 2026 09:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1257915;
 Fri, 20 Mar 2026 09:17:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XX1m=BU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1w3Vyf-0001I4-78
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 09:17:09 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 900eb2a8-243d-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 10:17:06 +0100 (CET)
Received: from SJ0PR13CA0032.namprd13.prod.outlook.com (2603:10b6:a03:2c2::7)
 by SA1PR12MB6822.namprd12.prod.outlook.com (2603:10b6:806:25d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 09:16:59 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::20) by SJ0PR13CA0032.outlook.office365.com
 (2603:10b6:a03:2c2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 09:16:58 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 09:16:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 04:16:59 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 02:16:59 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 20 Mar 2026 04:16:58 -0500
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
X-Inumbo-ID: 900eb2a8-243d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBNdxNc5WlLPBSbeOUYcv9U47Uam9TNRPxAHYwim0V+iykAV5Drz0vbrg88LNE1Jt9BfS+rTwiB7YapYbE91x01L870hNHfE9+Kw3ChwDTzKLFQ/l6VAzX/pg083vS/kRjTFG9lh2XJqnsnQm4Oq7hQOWOWh2FajA3o4k+FRTolqFd/auMPYI8M4h4931oBFOeA/ZFyEFzdqtqMuN/kEPWJit+zRzvn+E3XGJx0yXRDwxTz05BJ5vFK3xhNIm3Aa06OjMxsM39IAcagirglbXhoYQCQ3b5GFBtH6wrWgRk8dhtLEiQSy8I1nBKy6rMyqnsYMJFlF9dDQrLI6YKdnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eeZGSvzIySCPkF0XqPe02MVVawYn69quaGtofXl5Bc=;
 b=Ervt8eDBXlAe5bXtTHZOMxy2lGImupKgxQppalGsdHvbRQ5+2K6M5JzK1Q4lNwTprZ1t2okpZN0ZWJNfdt0/HkHIE7zV9bq2sLZAvk5h/laA0LtqRIaEWiZJdgIgtcs8GwCeSbNewjC9zA5rqwQ5v5E74DTnMtCReNY4vOEPlnM8xVurXolAaNIcbJG9aPz5/4wGy0ZvpA1rsd9GtX6yteW+kf8kQ5+IkWc9WWQXccObKvgbkUhDV5kP3ThSa37od8g7Hf65DG1F4r1DBun4LHW8WCZ9/5VxcriOMYonnLeX1+fMXgWrbKFNq7xuvg8r4Mm7H5otKQk3paflk1KXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eeZGSvzIySCPkF0XqPe02MVVawYn69quaGtofXl5Bc=;
 b=C326olAY7Gqds2EB/gEdAo/mLGl0cRVH2Xy0fCP9gHDyEhq5S/g+8bAgiKcaXab2HlLWXDWDR5lAJ+MWnASKjKc8Ke3+gUurBu5S8TuHXXZCQDztO7OqWaBxTlKM0XOz1xRk1OwgfzPMdOtg1GzCsZIzqKpORSRhQgGmbjIRYuk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1ff75249-e147-4086-a79e-9c9a3cf74030@amd.com>
Date: Fri, 20 Mar 2026 10:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: optee: Add MISRA-compliant switch default
 labels
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
References: <cover.1773911799.git.bertrand.marquis@arm.com>
 <0050ab559814a619b4ae23dd070e7aa4629865e2.1773911799.git.bertrand.marquis@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0050ab559814a619b4ae23dd070e7aa4629865e2.1773911799.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|SA1PR12MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b81ca4-112f-4c07-83d5-08de866170d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|7053199007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YOvtNdjTa1SiwYYacaroLgLkAZyV7EdzIq1S2Tng7Od1maqHUzu7X7/qW4iTGcNnlMX0qz4QzB4hL5y1iU2OYrnfgGLfbdEahEFnsYl/QBoJkUJB2yNaHCgIMFXa43L4jjAUpRzm8392rAxpbvs6mD8UxM2mhFvs1fDNaFn9L9ZUdxIfY00STPV4iNoOSTJEuq5qISd6If22oO6H+znCKHf5a7sh5yTqXKZCxIOUXpdaQG7prCnj4XAIXby4InSOYRsVbv3W/AA8wKSvfbo8Ylz6Hys7UNlK/6nUlG0/2+ZxoVc/cv3NnffVfbjkitEIPcoiNyI5fS5h3SFhK2k4W3pOg5tktJESUPCi7Vtevah6OgkI0kDgmXvulIVwHwgRRH3PD7wm1Gm6k7n1pYaX7VwUIgM8loz8IDdMvuhq/Iaqobq5InqBJQoogDSBhixWMQlN+QKZMUJ9eYloHK4qmueUHFiAaUXQE1liaQKZJj31aHZs25cTWD1uOoJ/A7tX0d4IsppL/CvEuYMyE2/vza3adSYG9g7W9nJqK3g2GkqylEAs7wK2tG8/2j7o6OlL3eUX6ppcVOhwTBJiOCgUdeO8uzzOKlRBYcmKYNXH3x0CpYbyXVwoHmrtbryhnOzs/EzJs2e29Y7/cXlh1N0UKBDRX0WPSRo9JrjjSYkPZ+E8utN+WG4ruvCDi5GhTa8g/3SRzKTSkBHtJUEu5JJOS2CL0HE2ruCni9/vkuH4yO4yYlxDZhc3e9Qf91x4OvTZyb9tWfl1hL2fyd8ZxCok0Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(7053199007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3Q+INQLC9PWoO+RYkPLJlCAM9sHMdk8hYxzMEnH9Eoyhfnh58ZYkN/JeXkkvt4CMY4OCfqEWmmgSVdvPdR1IpQvmvoqxpMnuT2ATf8AYICdkMAfuVcPjG7Jma3tlFxf9I5U8pmOFQ07m0Tu2dOjsgbgg52sWNv4F+dqLxwVYd+6M9sMC//+gvWdlfl0hnZyQGzT+ZMpKsGaK9gmlhScQpCVCzDrTkVQn9Be10e+h+Guk6dHj8rQHYIzTfgbzaE9bxJj+JRfhZ88eyqpwQDkVzjXutK+qvzaf7man+hMa2pHQ3T84oWkavg2qZbqGAuXkoaXImJR77tmQvAuXcI0gYzIigl8aS6Qzzr8beOMudPOcHmddVYg4SXIXecmQW/mup+r8FoO9n2LIqPo3HNg4XeF0ZAR4XhB9HZxxhEH4CjCNgUzt9c1wriK5IsoV3Clb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:16:59.5092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b81ca4-112f-4c07-83d5-08de866170d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: E35A32D7DEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20/03/2026 10:07, Bertrand Marquis wrote:
> optee.c has several switch statements over integer-valued OP-TEE fields
> without a default label, and two default clauses that only contain
> break. This triggers MISRA C Rule 16.4 findings.
> 
> Add explicit default labels to all reported switches and document the
> intentional no-op defaults with rationale comments. The new default
> paths preserve the existing behavior:
> - unsupported parameter attribute types are ignored;
> - non-handled RPC commands require no post-processing in Xen;
> - unknown RPC function IDs are resumed unchanged.
> 
> No functional changes.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


