Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMkUJOyS+Wm/9wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 08:49:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C714C74FF
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 08:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300218.1574748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK9a9-0000FN-Iw; Tue, 05 May 2026 06:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300218.1574748; Tue, 05 May 2026 06:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wK9a9-0000Do-Fw; Tue, 05 May 2026 06:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1300218;
 Tue, 05 May 2026 06:48:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wK9a7-0000Di-E2
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 06:48:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wK9a5-000ohL-4H
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:48:33 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f992c0-2eae-0a2a0a5409dd-0a2a450ba5c6-0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 08:48:32 +0200
Received: from [52.101.201.60]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f992bc-212f-0a2a450b0019-3465c93c2737-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 08:48:29 +0200
Received: from SJ0PR03CA0109.namprd03.prod.outlook.com (2603:10b6:a03:333::24)
 by DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 06:48:24 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::1c) by SJ0PR03CA0109.outlook.office365.com
 (2603:10b6:a03:333::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 06:48:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 06:48:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 01:48:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 4 May
 2026 23:48:23 -0700
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 01:48:21 -0500
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
 b=P72EIXPXhlpOBhWUt16BkLcX6aW5s7phcrZMctaTLSOINc3gSfGPHjQpuUOELg5JVMV3Ap/fpM3RA0dWMlaTOXjzqBPayVGtQnrBlue+y3uoGrVgJuWbau99WD0E2A1Xh9Dje08Yj0jbhZAuHaLQBPmuZenEMdOcTBReIRt42kLxCkqF94Y2cO054WbZRUIacvdxDZohFAUiSM59AHIRcBMkDfb6+ruQqSnXWQwzwfl8Tb8H4cAT6zfroniP33I0UTy/h0amg+2W3EyhEvMMPjTpm3eXK/wJgJzQYL2s0FxXxYtmt5x6tzE11SqsmPPEC7DP7MncxIrHuxvC2xLN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgFvu6n7dTdYcri9lLZhZEKLMUEdQbz2ewQ/EV+CiKI=;
 b=SYM6ImdQPCWffs08TLHhMkZMI/s4cgmy9RM9z4fUReizfrCazWIIKgPqHicmHlbps6bB6eMq2+CaKW5v1GMkAvCQbyC7FTDgFQKRf0ywrL3Ok7lyRjUYDRWa2C7+nH6pu72DNMg01VgbwzBt7Qp/uHQrA97M8NED1jeXwqC6lO+D7RufJyM/l7WMdXQmdBKCTaDe+EA0050JQUY56J1PNQ8Xwth1rDx1dJ+lxpD9em/5UAyG48mYytBmNLRd/Ci6Esy4yQ7O6z2LDJ4TX51NrNpNogK+rQQm5Yz9UyXaffeylTh/GHSAkDyFdNr3UsaxmRWZ60erax9uw1xD5f2trA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgFvu6n7dTdYcri9lLZhZEKLMUEdQbz2ewQ/EV+CiKI=;
 b=CFFS9Yp0oh5ETDCqkU1yaZyynKtuMjOyE5d02Gy9aEc9DoL4MUuA9egFngYV0ActSVGbd9EEVVcUzfCFap9D6IwkClantIiY7L6g+8Y1IdZ1q4QAcHQ1fZtwboig2m68hQnPKJGz06/UvxdoFPsIUliLb222nPVZNiNaRRQg7kg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
Date: Tue, 5 May 2026 08:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <afi7HUFoDYabM9VV@macbook.local>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <afi7HUFoDYabM9VV@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|DM4PR12MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 4337b790-5199-4aaa-8f73-08deaa724da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TVa+i9Bwm+q0VAWcejyOp6p+jJTFpaCuGDPDZgr6zuyvyIwXrAVbvIvMqZJw+WBOEcOuJbZAN8NwFwMEMjg4SmWMRjDnmdMoVhhffWXWz6pMLejNRpjmMjOkaUBFFx1jblZgPikucJcLZPU8fpZEW8LjOYO2JHuxRD+QH9F2rGCO0PnrefRLveY2otA8sGXkpTB4pfnyZR4SZBfTuHKGLXZ+wkJmplnN94KFOAqJxSra4EFBp0+2Pj0Lj+qy0v5KK3Ac2jXd65nKobptdEPdwidY1Wbwy0mqwBjA99bTQ27XSeGVJjGWoFygGh7c4/1twpTxRXDFxvIotLJf4GJPIbUfM0egedmmK3c+ImAfNHHtX/pcP6Ms/FkJkgXQSY8tUAaWB6hMIzZfdOv57xF5EmLqbYyUoueB7CgweVfbow/uaLIBjum6KPvmzsTq+CU5xp5tO1o20PzZyF5K0aaD4QOYOXVYVsvCyaX1rD2ow8g+2lmt/NEj+KHBdlSPP1QtnFyGweQX3dYjICS00AeFGofoiQUPGG3Er0Ib0J61+NZ0S2EqgKxOroZC02IT7pwIq//iWDD5JPt4A1safkf8A4D/k3i5jQpTuZQzFQMed4d5jiAaOTD1uSmk4lBiYGn5MUm5H3rFBDoyKgNXckeJ2I9bfKFjAZSqw3hV2bHy7xv57ZIpbvcLMdMeET1s1vBvOs+ItPVJFtp1JrR3GJ2AG6vk3LUO/Loefa0rN+GgIe0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0/sFvgQfzg7e+mtzbxdwkEpQLW0wyPUyCO3YAW5FMz7cxcfmiDU1iSYkXNw6lAKUI+VrBoHQ2zwMHc7QN6eirZRM4C2F/XV4s3/9MRzpraj81HcGpF0EHbxE85RvqE3w5NkHRc4ah3fcjqBIoeA5Qu1mXKp6CEfMF7Z1paxtXh+9iBzp452MNoUaV5tcsXiHxpO8SKUncEpLl/Sl40x6lXuKGVaigI90ib7Kx9wdQSseTkGSHZcW15lQpIEmAVNoee/NBbo/54RrV0eF43OHLssT5kK8RbWAf/KG9Mu9kv2cOiYlPM3tPQmtnlwr0tDkxSajMubVZYKd1Lkw+PKZgzaXtcpDqdnaQwwSYnzeivpUk69HkOPIOZJnwlbhsz+6RLVBv1ztra+l+9bKPl8U2IHaP9KeppZWcYlGmIXiGclRWDpIzAisNZBo3P9Mjqh6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 06:48:23.7740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4337b790-5199-4aaa-8f73-08deaa724da8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8451
X-purgate-ID: tlsNG-42698a/1777963710-7D165F3B-908CECB4/0/0
X-purgate-type: clean
X-purgate-size: 1570
X-Rspamd-Queue-Id: E8C714C74FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]



On 04-May-26 17:28, Roger Pau Monné wrote:
> On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
>> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
>> the frame table starts at PDX 0, which is only true on x86. ARM
>> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
>> defines it).
>>
>> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
>> to 0 when the arch does not define it. This makes the generic macros
>> correct for all architectures, even though they are only used on x86
>> today.
> 
> Hm, I assume this offset was added because the original mask PDX
> compression won't (usually) compress the gap between 0 and the start
> of RAM.  However the newish offset PDX compression should be able to
> compress from 0 to start of RAM, and hence you don't need to apply
> an extra PDX offset there?
> 
> If that's indeed the case it might be better to integrate
> frametable_base_pdx into the mask compression algorithm itself, so
> that on some arches it's a mask plus a decrease.
The offset is needed regardless of whether compression is used. With
CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
0x80000000, the first valid PDX is 0x80000. Without frametable_base_pdx
the frame table would have to be indexed from 0, wasting
0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.

So frametable_base_pdx is really a frame table indexing offset, not
something tied to the compression algorithm.

~Michal



