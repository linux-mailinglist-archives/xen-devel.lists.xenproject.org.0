Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBsbAigfFGobKAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:06:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670755C8F81
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 12:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319125.1586848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRSCJ-00022T-JD; Mon, 25 May 2026 10:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319125.1586848; Mon, 25 May 2026 10:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRSCJ-00020C-GS; Mon, 25 May 2026 10:06:11 +0000
Received: by outflank-mailman (input) for mailman id 1319125;
 Mon, 25 May 2026 10:06:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wRSCI-000206-9d
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 10:06:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRSCH-00DBVz-8b
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 12:06:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a141f0a-e002-0a2a0a5209dd-0a2a4507b142-4
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:06:08 +0200
Received: from [40.107.200.17]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a141f0f-229c-0a2a45070019-286bc8113639-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 12:06:08 +0200
Received: from SJ0PR13CA0126.namprd13.prod.outlook.com (2603:10b6:a03:2c6::11)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 10:06:03 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::4f) by SJ0PR13CA0126.outlook.office365.com
 (2603:10b6:a03:2c6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Mon, 25
 May 2026 10:06:03 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 10:06:03 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 05:06:03 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 25 May 2026 05:06:01 -0500
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
 b=mkXjson8tSXoLJZNIYuLApbMci6RsfLZqO3BE+U41dLgZJSQP1fgw/4mgKHcTivNZ/c7ytCCP5QoQMCIuNqGhYv/7ZUp1hQVyRu6sG905+7TPwJS3FcSdlnbGsiChCI7GeK844qUuwp12l6rc2C3Td8jrU/TiQoJOLJS742XRZMTFzLYBAraS8CuUIIMrCzXRm8x9IH7sYuUv+nG+iuuHZeKYh6smP6JBdicbWQkWUFHrD61GRkOcs7gpyecrUrDzCa/4SfkJxC9RRwd5a5JLmFzEQHIAXRonOHIP8lqug+V7bXE96uOn/9NzXHislJCRhARIjS2WaT+XG1Gj+60UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PC8AmsdOJav2nT3TfPwky1vpKFPoayb1oxfx5g0rKyk=;
 b=X3weiGdG+620YnbYM0Kstr7EmOJ6lbuSOrGEc9ZGmxuqsZKU1oLLChnbC3XUeOVIW9PyMCC72tzfkaQKI+izeJ+XtjNfpxiha/RTTHxDy5QjCbSlXNj8YHN1vZsWkNo+JqOC/xHKK7noOJ95mP/S2dkAdchEfox4DM8RjMVPWcpe5r44U3sYgdzVzyEUqjegoOTiaaV6H1Wq69zlMYdmddws9E0gLUdSrd5+WREQKtWrbgIvcEwTg/TTBWxZYX6A3Vd8/6ZW9cXZmJt/sLQsHCqU0Mxikzc4BVS4ZUSqzwoqDn5NR4uuU0zGi4/ONjwUEFZy/KGTF768eFM0lETK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PC8AmsdOJav2nT3TfPwky1vpKFPoayb1oxfx5g0rKyk=;
 b=dE3LtsbWJG4Rbf2c/OhRRKkYUjtcnmkTscOx+tTdFVon0FDaQW6fOeSiiDIYvNhw1BixgpA5rdtfEuLluOdfEaTcJgJwqOvUmEHGqkEtKoLpqdsKAsiLOjbH+gnJAg4U6hm8rXPcPlBi+KWlzqiU2KyPbNwXaoy7QBT0SBaZ2nQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1524b146-cb05-441b-a055-ce3337d83b44@amd.com>
Date: Mon, 25 May 2026 12:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] xen/common: llc-coloring parser fixes
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Carlo Nonato <carlo.nonato@minervasys.tech>, Marco Solieri
	<marco.solieri@minervasys.tech>, Luca Miccio <luca.miccio@amd.com>, "Mykola
 Kvach" <mykola_kvach@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>
References: <cover.1779388510.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <cover.1779388510.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|MN2PR12MB4389:EE_
X-MS-Office365-Filtering-Correlation-Id: 535f7c3f-13d9-401b-6b7d-08deba453ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|6133799003|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h1wLJUIE0F48f6tEHnMNa5MA/CVzjovpBgDD+o6jD49A2TE989ql71DBNMwq0/GRCL7A9FKAZlUWNitjbITd5SCYqq6C7HcR2k0KKyfDsBj03PP2zh6GmjDiuUHQD4YXztBXbSAv7Aorgvc4Qalk+AfEiROm6Kl3ORooko6wJKPf2xYCKHylfmCgPXgIPxgWneskyMQr1s5Kt1zzF2M2Hd9XSj4oSWN2SuaYYKhsw5P0WoWyuStumJ6TkZfpagBth9jEOJpCtqpIRG1vW1JJNlH0Mo5CI+k2bZvclnIRsRmbTDbdYNbShG92vIx1WWddXPQxMjboNoKTM5Cq/5/4L8UiDpUr42a9vAnA6Fqa3AjSb+PjV3a8Ds735NbPyInQjlIh7FiE06Lqai43pbscKTysqrlq9riwNFpcqDuICdyiMUop/t75sHxnMAkUU2YQ9KqPzJdE7OisGCPdfm3bMZiOldZ/kUGq3qWQ2ByWr4xU8J9Ta1bRIPTwhkMjNO/K7tY9wg0IzuzMTJMVNXFzanN3nj7DyTQr5A1rNhwp+qP2v6A9E+EXZ663VAqUNtlkURg5T5/zGOzC/aOraCSIxNpomHd5BTHx2oLMQtP3VpjaKr61QfYFfzLJAdlMvowOwj/8j++sQ6iCA1cfnpDOUBBm0gLLqXtIg5B+2S4i0xwgEpQdBU7qnoOn6mUp55gEP/PL4KHeyyB98nAuebBeaVBzkpLLtIXTizR8SK0wiUI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(6133799003)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JFv17BTaLwLX9tDuF3wCSIrDhGtrFivufX+M+x6PHEyBZHqp2q9SYjDiXo17+n9QK0RMbEcoWpFtfHW/rjgR0JA81vhdTIF0Ah0Y7l/z0nlqpWH4kguVXBs3JpxMzu9Y+FiWs22+MeKqvdWtia5VB6oINNDGoPDrA+ZCpYlZabjM/aeHCUDys96JBKlzX+bB1D4pIx0t27ifLoDA5JPajYX0RBTzNwb486wiyI+GA6uduI5FUwDyCELSh3icYlrtnhpcqg/4ESxSCeejn5LSdstunXzjPWhJr7v7CaWdSDAnTT0fwF/4gkJpTj6WPMDjNKNtN8VMqkAk8XlWzxZ33tOuXwB1KcgibHMDYF51qZj4QzEGhj52r26jB7Oen+k5OUI6RBCiuNHDmVSTR6nS49uYft2eH5bfFZQ1wne9ulXOph/MrEBvQSC6krFIoPa7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 10:06:03.3907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 535f7c3f-13d9-401b-6b7d-08deba453ac5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
X-purgate-ID: tlsNG-ef75cf/1779703568-0A971C48-9F46FA22/0/0
X-purgate-type: clean
X-purgate-size: 1319
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:luca.miccio@amd.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[minervasys.tech,amd.com,epam.com,citrix.com,vates.tech,suse.com,xen.org,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 670755C8F81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CC: Oleksii

@Oleksii, can we ask for your release ack for this series?

~Michal

On 21-May-26 20:41, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Hi all,
> 
> This small series fixes two issues in parse_color_config().
> 
> The first patch makes parse failures leave the caller-visible color count
> at zero. This prevents a rejected command-line value from leaving a
> partially parsed configuration behind for later init paths to consume.
> 
> The second patch rejects empty color tokens. Previously, delimiters in
> places where a color value was expected could be interpreted as color 0,
> because simple_strtoul() returns zero without advancing the input pointer.
> The patch checks that each parsed color value consumed input. It also
> fixes the DT color parsing error message by adding the missing newline
> and including the domain ID.
> 
> Changes in v2:
> - Clarify the first commit message.
> - Include the domain ID in the DT color parsing error message.
> - Add Reviewed-by tags.
> 
> Mykola Kvach (2):
>   xen/common: llc-coloring: clear color count on parse failure
>   xen/common: llc-coloring: reject empty color tokens
> 
>  xen/common/llc-coloring.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 


