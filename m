Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCmhIRW/n2lOdgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 04:33:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7FB1A0947
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 04:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241207.1542359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvS7i-0003Es-2X; Thu, 26 Feb 2026 03:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241207.1542359; Thu, 26 Feb 2026 03:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvS7h-0003Cw-V9; Thu, 26 Feb 2026 03:33:09 +0000
Received: by outflank-mailman (input) for mailman id 1241207;
 Thu, 26 Feb 2026 03:33:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUpi=A6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vvS7g-0003Cq-NE
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 03:33:08 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc98abb9-12c3-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 04:33:06 +0100 (CET)
Received: from SJ0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:2c0::34)
 by DM4PR12MB8499.namprd12.prod.outlook.com (2603:10b6:8:181::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 03:33:01 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::84) by SJ0PR13CA0029.outlook.office365.com
 (2603:10b6:a03:2c0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0 via Frontend Transport; Thu,
 26 Feb 2026 03:33:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 03:32:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 25 Feb
 2026 21:32:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Feb
 2026 21:32:59 -0600
Received: from [172.24.237.99] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Feb 2026 21:32:57 -0600
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
X-Inumbo-ID: dc98abb9-12c3-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXauNnFZ/+XbP/o6z5PM98q1hFjHYGUlpZiGlFRlVJIrw1lWflBkL5SroTz6CkQMF8Y8xHGaNXjtZTxhjlWRhFKbniXCW4eH0h2b907EAvDUQHZ0McEfghTyYOk/aFWuAyJq/+8jedqwpMfhoGwjVpwjH9IXArptW/EcVA5VceR4tGnUr0hA4uL8W3wm27NfQogcpL18MgSWygN1wLT8rp6wHq+HPhMFfbWLZZTDnEbQk2JCWwWb6DgJccDd1kkFgZNt5WYpaBp0AuBy80RSlXppPAz5S22M6TjDsW7HbZmMBJ2ryLdrmKYa+LUUKPuAj9a41Ao4sH4UuRMiTmRyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHVmpml7MX7t6OeeygINfAmlog/QYeLXEBOI9hn/6HY=;
 b=VtNEdhhN7ljAuKBDpaT1aCKfBhV1qOXU5xUWN/EcDEsasjM6OtdiJEiVk+d97XIKl1+vSH28Tl+N8vJe7amVJjk+cMAWPcJ+oVazWcUVv61t8VDrux9WiJIAJ9Q4M7wsryp763V+P1GMpm7oWQhQMX8Wvk/cah94G0a1bxI4axOHiYHUIqiWEc7xbS9WsWqZIzS1IOi08few+cWNMo0Dj+k6kdmYDzu6G51ciQidmvEsjg1NOXOpsPq30llNr96YgDB2NsltfVy4CvUubBziBdscz5gNPqmbis1CUuMvnkZFYZPH6X0kU45NJ4LLl95ouTTpIRjGqzrWaOdKFL9A4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHVmpml7MX7t6OeeygINfAmlog/QYeLXEBOI9hn/6HY=;
 b=lgHyI6IfO2b5wnty3VEMLlSLRBWnmYsHeJV2tamDTpUHjyds3kKHvM6bt0rAB/pS4QqpybM4Y8/U4D6H3UsHqXE3bcyX5IEOLdH/ZlsGa3GJJQD3iD/cXOcv75Y9V02bqq6limV2Y+eAG5r7UiDg0hoJnYFEyJm4B/WP95sJC8o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9fd5a47d-6c94-40d5-8d89-fc76b11132b1@amd.com>
Date: Wed, 25 Feb 2026 22:33:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] vPCI: introduce private header
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <f3673515-5922-4748-a964-d4c391e937f5@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <f3673515-5922-4748-a964-d4c391e937f5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|DM4PR12MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 52524fe1-f4da-4126-a417-08de74e7bd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	XpBg35zbnPOVFH8b8k5pfYpxTG8REXawWce/L5Vp51Myrp0S6blApweZ4ZtKe7SjkEJWdaB5puC+StNZNAy/lggKkV6v5sOKtqu/5fDko25QQ4xRVT84ZZNENwxS+AzTdDY/Xw9/JpFN8ekpXIJY/gxtvVjd4t45uh5/+qqe4raRJTPNyRv9YT4psKd2Bmmqt7G5Gf22//7O9TZIPKgvndcuf16QybI9wFxPiU8UaOKQCVDqB13jBEP0djjY1Zws660xVZCouEMXj5YIuaHvAh3NWho2ISzy9AjiBTRtIJUz3/yL9tfCQIzzbDDauDd+7Ru37zICeFIVvePhxhZzb3meTEq4U/ARUXQp2LMSmCdgoSTLjgHRvaCC0Sw9CZBqWc+XZNSArygs7t5khXBpFwwA9vBZsZNxkEmBr7RRSD5X8GRja0Xyw5PSbNubxsu7/l4m+ypfj2TPNnNP9e/QnFbPOlV22n17/JEzl5+bOgtcDqiCduIgVgEXH1paDn8gZYQm/8utxF8XzDMWV45v1/J1I238Rr51+/b7KuEYTzF7A6TDUxWE08LLcI3k3rP5AmRhHn1NL+a4j2WwOGgcAToxJN64tiJoFJhhCpuPtjQj7Z90/UOpxYCdaONbXXAf5Cqbj2XpdoHPfL/Uw8Xw/OmFXemzMso/XVj4KSZXompKDrh+At0lg3AXQVR+ALm7xa3VFl9ISuES17BlCQHkz0OxI4OUNZ/0Q1yqsYN9EBLEepQ9s9WlJY+4bIUl6+ocR9EfAr1HpnSigQk2xuBRvcLelxl/eNu1fe5Z1SAd8fvGoYbo3H0jsr0iCuSHDUn2YAqGLlWiK6EPE04HQXorkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5dNPA6jZheZUSkFRLWR0/a3enbYkntzpQERNBBdV7jtnT4GdZh9pebC01VsBUvy2pL8pQeITln9mlFPlluPvLazIbEuw1V0WskhJATR6cxfM7MmofAMF7oo7JEzypxJc5bAIdncI62rLarltJMVDhPjLjTTkFu5BLOZx7DwbmxjltrxAk25RncsK8+NIn4hFgeBTXARJ+2QWaZW3687A+FGVy8IXinmVu+9zQcxZebAQ1pHdr7piUFevql3GAP8jb2/Ely+HZm7ViiSnnbniEAW3nhxloexcG3XCOnu9NbVqB5uKGZ1N7yU48U+0wjo/hOUTvjjF+6XFsj9gygVNgCE1TXSxuyRwyvcqygZwS6tgvklq0PEImScafl8hA3blRiPNZ0zqK2KHIkkJn3QGAPyxAVzjz8VAkN/P0rxoS0GsP13vEXZ+Or1hXHBT0GYR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 03:32:59.9476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52524fe1-f4da-4126-a417-08de74e7bd9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8499
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org]
X-Rspamd-Queue-Id: AA7FB1A0947
X-Rspamd-Action: no action

On 2/25/26 06:43, Jan Beulich wrote:
> Before adding more private stuff to xen/vpci.h, split it up. In order to
> be able to include the private header first in a CU, the per-arch struct
> decls also need to move (to new asm/vpci.h files).
> 
> While adjusting the test harness'es Makefile, also switch the pre-existing
> header symlink-ing rule to a pattern one.
> 
> Apart from in the test harness code, things only move; no functional
> change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

