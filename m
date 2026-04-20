Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH1yLUy45mlJ0AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:35:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039D434E4E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288240.1568532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEy9L-0004P6-E9; Mon, 20 Apr 2026 23:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288240.1568532; Mon, 20 Apr 2026 23:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEy9L-0004Me-BY; Mon, 20 Apr 2026 23:35:31 +0000
Received: by outflank-mailman (input) for mailman id 1288240;
 Mon, 20 Apr 2026 23:35:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wEy9J-0004MU-Ak
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:35:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEy9I-001b2f-O2
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 01:35:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6b7ee-2eae-0a2a0a5409dd-0a2a450b921e-40
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:35:28 +0200
Received: from [52.101.62.24]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6b83e-212f-0a2a450b0019-34653e18899b-4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:35:28 +0200
Received: from CH0PR03CA0418.namprd03.prod.outlook.com (2603:10b6:610:11b::19)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 23:35:23 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::ec) by CH0PR03CA0418.outlook.office365.com
 (2603:10b6:610:11b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 23:35:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 23:35:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 18:35:23 -0500
Received: from [172.28.123.27] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 18:35:22 -0500
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
 b=FGz3NmtQ86pF26TQcW6Wc9l9vq7vrPBKQVhGNx/STHdk+yjTOvz8kb9ffrzJLdrrVgDXwcGJVYqy0iccGO5Kl+D+U0ho34MaX/T5lxTcjyUXZ14cLDUVWJg/h+B90SNJNl+UG3YllKAOAoq0lOqP2TCRhR6aRQLTIlYyf2hmhAfzglzNRfez0ALEYx4CbDioIB7wQV64oDnW1oAvHV/xHV8fLabN9s7DVA7j26V2FeBQnpJis8WY1HDFUVGdt8awCOq3/UsGnbF2rdhAYIoeFFopLPtYu0iFbJC2p5djy+VGWFxzJsqURrINa0y8jBRecXqMGyaP+e3vll5M1Ng86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCX9S++GQCGjzqucD1iuv4GnP7mPn0tiT+ZfLqYlnS4=;
 b=ujoF4tafBT5SzQ9FDdiHpbW3ml3p6gVn4z2mGsfmP9+2bdZCxpwpqgNUew1FeQfi3aMC4wraWu+WhXrFjyJZF8uSY2hHeXGu9OjR3p+mx6d4Zxo0PxYZMA9Aj1KPF9iCUVcg+cifJ/vzPlgGfzEXw0dZkQ+mzlVAGvwFL3YkPk3hHDVfHF8GKXlDENrPj7CvWNHoV75kw/a2SFMSAhsMJ+KYBgj7p9P6l9ZuFRRvyoVZNT79JSbNcFuLIE/2Edz2a2l6QMwFVigj30ErAAp4m5s/tsXDWN/bDxqLyEA+LvcIy7SXaab+1kx4y8S3snnArD6NyXMhF/F6ioLb3TVJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCX9S++GQCGjzqucD1iuv4GnP7mPn0tiT+ZfLqYlnS4=;
 b=VfJSOQuIYDeA4SOHUvNsgml+06t50lvkETBwZxsl4fTyqSQfRPkoMRalJSV59yGmTiBW7k8pKVq96h0ho/Ga0UiI1t20FVXqbPBtHACu1qR4xZ1riS3uta/8d9pVrNsdyiPTfJ6S6awjflxmYqVaOEvlN+nUBXwefq+kLKvfIRA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <60d08d55-e87d-4869-aab8-d661e1b44fa7@amd.com>
Date: Mon, 20 Apr 2026 18:38:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] tools/xenstored: add depth handling to XS_WATCH
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-6-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260313074751.2904215-6-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d86ece-b057-4009-7a06-08de9f357e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M63arBU16lBd8nBwCBbTuSxQoI1ZL5d5FKRIq/np3gttuDhZ/y++NwXrCDCTriWZiStBpr0f2HgnnP5w23pihPIQKifV/YzER5BRq24Zd19i/31HQiBk1VGZsmYLaG9TRbRJHSrOgQ+l/5fHqsl8HIs+Z4kUjUCUjMtvI7oSrzKUad1sT//+6qMSnYCBolZeAvBJPET79iCSOYjEQQwd19c4qaulqmcN84VLRWR1tdR76soQvdn8dllSRqpSifjEA8JZZ01oJVAQFO3ytWWrnRcEUz4T03wEVPjcqsKdxtKull+qA/TVP3uB+6hRMv47KdY9BwmFeWG7W1Ch5/zqF95QpBv/EgTdSeze3tw0SbiRasMSoV9jyJLOWWB4MyTOodCSwStVuAOgrUj46hXlPYE1NrPAYb8vhBhHuH6KxrFG+WW8prCOpN+75ETKKe2hJYcxKxROml0sWkg3RuElCJcxPMUbbFztpZLBdRmA/tVka6SdRGWfcDaVAUvzmxHzzti+pTzp1YB1kbC6Cl+0I378BQhDcZDlSdPDJKrzYBgD85Q3k5kZXq+5NcRCL/VYxrjuYk17TElLkPsKznv6vucDdFa1bnSR4Qps+no/ALp3Cc7yRwF0SXUw3BwXzxY6lPk/pkdfRU5kQ+ActLgI/+Fz9I6TgILXFHPWPF20d0I/nCWFxnWojtY5p6dxZRyMFiHBWzTAS+xL+LZxwoYxDF3UoB8NMzjUc1mF0pQTrLWCEPKTY4UpoRCF58NoyyJrxS8G5qBUsxC+5rqSsESOfA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RNetcckmIrm+le1zLPClZ0bNwuBG+TnwtWYw3kEfnC46ZQsTtU8C8Ybv6b76I9HJZEagcdrWUfBJQMUfl6/xYMm/q0zjcb4qs4TSIduqNJd400HDEUm3Jx7C7DpbnvXs0IkksrT06vpR5t1VNwFkOkzvAVmBABT+L/1d297GS0jWslQI78BzYkJVsJhAOCLp9cIvnxaG/R7qDPi5FRBtcabyAKQIjub6GGz/g9HbY2FjuvL1mZTOgR5wXihR8CSqwVtW29MCiAFaHmcEzpePUcrtgnoMKMk0PQWGu4LCsgXHhwT8YRGU7mKkLP0/mHVWDODG0t5MjkUfg1a+eW3PbqjCOVRaCtoKhPv/yWiIvem0WskSbDyABdQ905R97BvHdZB1P6qQ5ih+qXh90iCAC0YxEjvMqlHGKgb4GtolTFeQuNybqpHNlenlctnbXWh4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 23:35:23.6425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d86ece-b057-4009-7a06-08de9f357e76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
X-purgate-ID: tlsNG-42698a/1776728128-06573F3B-AF96DCBF/0/0
X-purgate-type: clean
X-purgate-size: 257
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2039D434E4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 03:47, Juergen Gross wrote:
> In case XENSTORE_SERVER_FEATURE_WATCHDEPTH is set, allow XS_WATCH to
> have "depth" as 3rd parameter.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

