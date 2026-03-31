Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCcdBv15y2k3HwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 09:38:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9E236555E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 09:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268538.1557798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Tg7-0002a6-P0; Tue, 31 Mar 2026 07:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268538.1557798; Tue, 31 Mar 2026 07:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Tg7-0002X3-LO; Tue, 31 Mar 2026 07:38:23 +0000
Received: by outflank-mailman (input) for mailman id 1268538;
 Tue, 31 Mar 2026 07:38:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7Tg5-0002Wx-Hh
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 07:38:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Tg4-006Ktf-NO
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:38:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cb79e3-5cb7-0a2a0a5109dd-0a2a450691ea-46
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:38:20 +0200
Received: from [40.93.195.23]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cb79ea-3034-0a2a45060019-285dc3179aeb-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:38:20 +0200
Received: from BLAPR03CA0043.namprd03.prod.outlook.com (2603:10b6:208:32d::18)
 by MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 07:38:16 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::e5) by BLAPR03CA0043.outlook.office365.com
 (2603:10b6:208:32d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 07:38:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 07:38:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 02:38:16 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 31 Mar
 2026 00:38:16 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 31 Mar 2026 02:38:14 -0500
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
 b=TA/U8bNPAI2nhTCDvseSaqa8Td0D/1/89rhNgZJEHx8kzrWGHqxuxW19E/CNzLajvSZp4yAP0ODs/FalWBfXl+JpewjBDZ0zLg8SyFMs92enNIHfcXRh6Tqxb65bU/TNQGcEaD7ftvEQvRhJ+Ma4PCQlInNTpCqPNnAvIFfuq5h9qt+RTSidieUP6o1UQD7U6pMIxQTSzR3qGcnIq2LDcKNXuSmi9KuoZqJ72vNuhGFC7Quas94BWCZWdmGakepvaBFYFTvdqhMUq6fM7DhInoSyOqM7yyZxtGkVLOCA+TvcOu7fCecgBK02Bhg8Lb3EiKutyGm5N05Ol0cdZZMHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8OTOJopiED8U5AoPpQCZNkIuYW8frx00RgQRk+tzc0=;
 b=if8MWhZ+DYrbxYxrOeHhrfuUJWdjbZ81qdVBHJOn1VQVc0yUdSEFaqL7n1qh3Yl9zpRwAwSIfq0TtclyWQ/qlb6paCBImkTeV5S75nNp54aGD5L6PW9q4gWwLoCAL6dm9B1vK/TEGQ/FIM/V55rs7I0Nwd6Xp5ck616Ca0Vc8Hdoprd6kUfTnSS5ZtOpIu2fioBieFMneAzBcbjX1pjUO6pJ3jIIQWk/pUILYtepGpZni47mT7KBCyMWrrUcDbNi1gJbBCzSlMhNAw9AIpZQR6NLXKwyGOWBEPV2d4UMjwI5WsUuHrg3D1v7wY8KOE44rWxRnEANtHnXfRry2ThG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8OTOJopiED8U5AoPpQCZNkIuYW8frx00RgQRk+tzc0=;
 b=SJ7FGJkzSgwYUXHaNDEWCOU0E442oGNdv0lOj1r1bJ6Fx7b20ky81fmoXDXylgYtapCMjjrDk+2VIlk0EbWuarstY4x/M/sTNZjGgOJu1UVQ2f4H/DOUJ82VKoiMROBS4P4oMK/se6cPHsSvwuHegpmN4H8HLaHhTpkcCVQvmG8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <be90998c-a8ac-4bd2-98b6-335bae982a22@amd.com>
Date: Tue, 31 Mar 2026 09:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] common: move safe_copy_string_from_guest() to lib/
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <0ba80bf0-e786-4e17-936c-0b769194d369@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0ba80bf0-e786-4e17-936c-0b769194d369@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|MN2PR12MB4256:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a69468-8a3e-4796-0ce9-08de8ef878ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	h9QZkWgYwgvfd8SXdswahGPW39Pr2C6S1Kd9pMNrZIxRv+Q/KB1w3N4qu79PF9O+yj9gDDecCZtuLn0i6zHxW/MubFewpL01NHVJPSUrj6cfiGet77HDrY/NuM/J3nBsNiTI/RBWHRazKY+HlWmgzUQIUioUnE73+tM6dR3aI7Ws7yoIu8g5mcz4KdJJJQ4vYRdy9n86AjWbsULtg2W88LMkK4MUQfaFd+rJ5XoUfn84gMdxQwfdNvOHJrn5A4nk/yKqi0Wck9QVup5CbsD5f/zTVv4RpYiBBAj0pnFT6rCcYR4o6epkawTwsNmdGozR4EJg3WWeGVyGxEpxLpSTd+Ukv2veIa7zf7/f5fou7w3av31vpK9sUFY9Uj7His/sq1ZlUl3pq5lYDiLLUtNTqsuKk8jaJeG6yAK25SOjVSgmX35HJAeKd4zV9BDGTMB86HZ7P0t9gpF8XKyxdoXt4d6//3fwRmI+jI4W2kxL1yzblql5OEbQN3EXHezf8VObCa62Yg1e8H7bQ437XCyuSrn2uNhwtH9i7jUMmEG79yDyj497ftq3YmD0lFjxRWnIuOz4+JGDGKjM8euKusd1ZW3R9vBTgI6AHAQRDJg368hLEPbs3cfYvbKb9MvOEJNlCcKG11KkxsjYblfvXDYsS+6bFTgJAayzGo30drhtI0e4DI0sLT4h+zHwsrpjv99hH114jKGSkyVRZnqyZflGbBbMPjvszjuiNcM5i/iRUwWylUPfWCCCj0PW5HYCA3VlRjbwcBZ+M+gGGQ9jCM09hQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W+Q3Vm+xIewMKypXuzRc5i3sRXOpbA7ZKZIbGLTZkfgHEMV/zORNYEywUjvhhePeEt2V+d2BFMqUpoTEIYkmhuDO96rESMjoPcd+NN1jM/mgJ4LmwX3BF40cjOY2EbleFyYLRCHq06ZDLR3hro0+PMkT8JCxsG74mS06HwnPX779XD59znTanMAlstYDFoMtOFBb5Xx080o+jFn5/3mpj3frD+8fnPz26GUWYkRyepbP8pUiTqEogZ2vRCa8XsWWkrxh9u/Yn+DUupCPUc1JMQBk8SejlIlfsjsKhsncsr9hJ9uxwH4U3HLvlTRszouaxP7Y1ZBllbMteAf3Tb6FS7tEgytPSr0uiRk7eGhCVOKC8PskCKSb2/b6nDhkYrDOrZgJRnuTetIMn56prMcJwmJ83q00zw0wvPdbmvCWQGNKhr9UBn0qOtpRN9YzvMVP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:38:16.4566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a69468-8a3e-4796-0ce9-08de8ef878ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
X-purgate-ID: tlsNG-16d1c6/1774942700-80D851C2-3BEF0DD1/0/0
X-purgate-type: clean
X-purgate-size: 277
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 7D9E236555E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 30/03/2026 13:34, Jan Beulich wrote:
> This function is unreachable on x86 when XSM_FLASK=n, and it is another
> good candidate to put in an archive.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


