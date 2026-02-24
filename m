Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIwkO8oPnmlBTQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 21:53:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC718C836
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 21:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240278.1541717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuzOU-0008CA-Gu; Tue, 24 Feb 2026 20:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240278.1541717; Tue, 24 Feb 2026 20:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuzOU-0008AW-E0; Tue, 24 Feb 2026 20:52:34 +0000
Received: by outflank-mailman (input) for mailman id 1240278;
 Tue, 24 Feb 2026 20:52:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KvKI=A4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vuzOS-0008AQ-VK
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 20:52:33 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6c61b62-11c2-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 21:52:22 +0100 (CET)
Received: from BN9PR03CA0470.namprd03.prod.outlook.com (2603:10b6:408:139::25)
 by MW3PR12MB4444.namprd12.prod.outlook.com (2603:10b6:303:5c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 20:52:17 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:139:cafe::44) by BN9PR03CA0470.outlook.office365.com
 (2603:10b6:408:139::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 20:52:03 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 20:52:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 14:52:16 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 12:52:16 -0800
Received: from [172.29.61.144] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 24 Feb 2026 14:52:14 -0600
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
X-Inumbo-ID: b6c61b62-11c2-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoR/ToMfEfCJHqK2nioYzPnhgB0qMODIkKZRMW7HMJAP98hg08iTUv0Nsk1ZHLcdy9Wd0XNaWLla+0MxX7rU8LWxRyEv/bgD7rGN1QTltpmGU3mVnyBZd+MqBLxYN6gnQ/DiLQOmFjXhFOoXrxZuavNDPKTrlOLOQwj2uVRLZQFaXfvepSyHCqzGYqFYtztsk/eiT60s9WILyUZnDcBCGCvnctsofm4afoz1FZ191euzouvdtcETh0LTNA8szBccctUYYEsMhullj7Qyc/cDCjPwJfaKbf4ArJCFecrVUD3DXUAnPYM/DZg1HlGrJOcjJiknB7484AWVD/0dLcXjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvnv/VbGJdkyy1D/PtRyAfHEXoJ/d1hWLcP3Y0G/Ej8=;
 b=AVm0zOUiIIlmGV2CLjhwmzCIJos2E9zlKShm3655A7ijivaITx4i2RpApPWsPjA237D816CZSfAVikbjzl68yNMFbJeqncaP40soK73PWYbtFK33Uqem3QUGaGCgHbYMSArj+ZeMyjm0ZEYUogjHIBX/RtnEP2jgovG20gqeyrXZi7pOCLQebeqK5orPg5nPUqq0ZKnxfUQbYMTOZHHh7iKMOeowbZdhIcTO7VWAXqpvYD67JAdmIw0ToAbtzefl/wrzLKZElfGB3EtzJB4hrxBz+YD9JWgNf5Y4Yzqs3prrhdYTBAhhH2B71UCpgnZytzt59ZxJmS74G3z0PYxPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvnv/VbGJdkyy1D/PtRyAfHEXoJ/d1hWLcP3Y0G/Ej8=;
 b=bhe94YUG/SOFaSSEXHKIlX2uxpyexdMQ5LFF5U/MvIXOPp1exfiwEaedkuCFlXI2HuXpqBUsDCirxbZsv/tIkFrQQkXAsxxJDHAtmnoQg8Gf50PnTgVBLuoDl4SWqiRGKmI4IM493JoSfaHCaM8pK3zd4S6tttuN8ZBUOS24teA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c0241f4d-98ba-4b35-94d0-53938b85c6ee@amd.com>
Date: Tue, 24 Feb 2026 14:05:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/efi: remove unreachable efi_halt_system() function
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260224200708.51120-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260224200708.51120-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|MW3PR12MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f12ab1-9b39-4ede-f553-08de73e69829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aHYvUTBsM0g5MFgxNDVRTkZtS3F4emljWVk1bFBJazhsQkZaZ0hXQk51djhq?=
 =?utf-8?B?cjBOVXRQREZNRDVhcVFNVG1KMDBoWFl4OHQ4Q2tTVTQvRkFGVHRDaHh3N2pJ?=
 =?utf-8?B?RVlaVE1aU2RaTWNhM3dsd2c2S1VpS1FxM2diT0c4cE5sMXRPQ3FxbFpReVhx?=
 =?utf-8?B?bExVTWFHZEFpTThKRTVtcTc1V05zVVBwbEtLQm80Q3ZvblpubmM2TXdGS2Iy?=
 =?utf-8?B?S1Q4QWxnbDV2eGJ5TFdsdDNVRmo1elFuRGMzcWdSSmhHbjBnRjhPME5IcWJ3?=
 =?utf-8?B?am9yZURtNTQ5THZTM1loa0tiNjQwZlFLY3RKNko2N2c1dkNzZ2gwZGsrdjJJ?=
 =?utf-8?B?K1pOSVVhVG5ialgyMkRnbW9ud2lvaVg3dEVIcjRFdi81Tnp1N3FyQVErcmRi?=
 =?utf-8?B?VklLSW13QnRMUHlMMXZGYXNDenRQN2ZJRElPVkkyQmVtQWZoelJIdzdzR0RM?=
 =?utf-8?B?TU1veDkvSnJJR1Z5TEtEeW5tamUyaEtWNTl2d1I1VUpDWnR6UDVlbktQQjNp?=
 =?utf-8?B?MHBwSUVxRTN3Ykw5TTY4aGVwWFc5dU9Tb1RpaHhmZDcvSkdDNm1qRC81Y1RQ?=
 =?utf-8?B?RGNUZWl0SDNjSDVqeVVBc1pXaFZrQ0ZNTlpXck41azRtLzl0VDd0MnIvN29i?=
 =?utf-8?B?RUhuU1RFOFNWUFEvWW9pK3I3Umsrbzc2RkRjaGdSUnV5aWxyK0VaT0VyYTlq?=
 =?utf-8?B?eVVmUk92MU02MVBCajlLUy9hUXRLNWVudzZFZzg3Qlo2amx3SDF4SzJKTUk0?=
 =?utf-8?B?MkpsRWpoRnNrRUREVzBBZnZvVDZ3RHh3MHJMZGZMaCtZcWNKT1RzTGJDR09G?=
 =?utf-8?B?ZlhrcDJLQWdiWVNWNjdCWlErVVp0L2xDWFd1RWZPNjZmQkthNmdDVzFhT0gy?=
 =?utf-8?B?SElIMFJISzVLZXEreXF1a0oxejJadGlPdU9VSUVobWtLQkJBOTEyWHg3QzU0?=
 =?utf-8?B?Nk91WXd5ZllBUFhNd3ZqV0V0RzJEOVRuTjFJbVFBZU5tSWxLNWQwSXhobGc5?=
 =?utf-8?B?VTEyR1A5ckJUVkZER1BCQVd2cVJ1ai9IVjBjN0RlM3kxRlpWWGlFTGx3MXda?=
 =?utf-8?B?ZG0xVFhEQ0JzQk5ybGM1UGJ0U3JCZWhCZmFJQzNWVjN4eHd0TWVaM243aUlP?=
 =?utf-8?B?dWJ6cE5rQmlueDErT3NteUFISStIZ3hGZHRsNml5RWhmYVo1cjZmVUhVb1NZ?=
 =?utf-8?B?M1ZjcEJBYmdCeDV6NllyVTFEUFdSSmVabFY3UW1SRWNONmFZN1p5MHNCK2JS?=
 =?utf-8?B?KzIzcGNudUY0L2RQS0tWYnc5UUxDZG4wVU9wdk9qT3EvVnFuKzJ2bW1SZnVS?=
 =?utf-8?B?QWlXSlg4V1dWcXhRN3o4VlZuMitvcUJaZWpoS2M4YjNDd1lLMytxd1hPbmVC?=
 =?utf-8?B?RC83aVA4cFd0S0p2NFp6YTg2V3lRS0dYUHRNTkNvVDYrclhua2RHMTV5Qjhn?=
 =?utf-8?B?MWpQYktVWUFmVXdpQlJuTGZ2MG9pLzVKOUhNNG92Wmo4OUFyYVVTeGlQQU9a?=
 =?utf-8?B?YmxsQkk1VTV0azlpNXRqSkJwczBScGNZME1UNGJlTVdUR0kyM2drMUoxVnE0?=
 =?utf-8?B?bllkdyt1eE8ycWMzc0tuaVE5OHFkWkw0T1JyczZ6TERLZDlTWlFycU1DbnY2?=
 =?utf-8?B?c0VpaDVEYysyamdTb2d6R0VzYnUzVjBtVTVQMEJtTDY4N1ZVYWhPTGh2SVNz?=
 =?utf-8?B?YlRuamhLVHJMWW9kMmZwc1lkREFlN0w0b2dqU3k0Q1N3M0ZTMXh1WnJ0UTJD?=
 =?utf-8?B?MFdpNnYzRTcrRDBML2QzYmN2UmNVNEdQOEtxaHd1VzBQbG9QMENoakJLcm5W?=
 =?utf-8?B?TDB2WkdNbUZIQXEzWGNkdFAxRzRQTkNEcVk4SGZKbmJyZXZWRXgwYjd1VW91?=
 =?utf-8?B?TW5tVkJSZWtxdGhEQndDKzBZbU1vMXVmbklNTTk5ZEpkUUNoakdSY25VRzAv?=
 =?utf-8?B?c05RZGxNL09YL2tlaWFQdXA2SDJwVzlITnJ2cWlLa0VLSkNWYmlXbGlrNjl2?=
 =?utf-8?B?aFkrb1VHVGtBbit4b21rYWNjUHVQT2VSRVo0aVNtMWNiRS9mVE5YMFUzbDR1?=
 =?utf-8?B?a3BmYUlKTWZnUVVWREh1Q1E4Sjh1UWtZbGY0WDRXL2hzeVZ4TmlRVUFVYVpD?=
 =?utf-8?B?ckRiMS9ydXc1YVRUaTZmakU4RjVldE5kWlYrYzJwclNTTHBTa2NaUUl3a3Fz?=
 =?utf-8?B?NUNaUFJ4dXBJSk9rN2M4bVZEK2hDNzcwNnpWWWpvVExIcXRPQ2FDZEV2VW8y?=
 =?utf-8?B?d2x1aE1DM2ZYcHZkWDZaeURXVjZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0udXo4zjYsILG562rGI+KTBfk3s1q7pHrmOV05f9nMpRkmZiEauxp5SSTFtjrv0OY+IT5MXq8lPuUEJJZ+1T2oEsXMAtgIjDNZ16hqXHVMw3bI1VcSkflOBoAh22hAIRh/e7j08U8C51W5fSAvee/MMLgtF0TzbvVPdPvOqxTXt2t2kcdpyw8irWe8DcD0TVC1PR+4WMddhzpvLYOcVPSgvKD1W9d+ESJtyT+Y+vBLo+/6ZjDBtuHs164YHhvQoJGkveELtC+nGa3ZKcPIcKDzc2n8gg1fQUlCgZvjh2JBOj74O58qRYj8WfudN2nOi8ST8t7hBrNv/sdNzKHibj7SpY5Ws6/NDxzb9YWEBVq0ENgpjZe3wpCTqiK2NpGR+XThH+29mzrvEDRCMve6g+MabJeOwF3XQSEHrdjCvY3GYbktd5QNZ0s5CW552qz9h9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:52:16.5312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f12ab1-9b39-4ede-f553-08de73e69829
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4444
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 37EC718C836
X-Rspamd-Action: no action

On 2026-02-24 15:07, Roger Pau Monne wrote:
> After e4c3755d4dd7 the function efi_halt_system() is unreachable, remove it
> from the file.
> 
> No functional change expected, as the function is not called.
> 
> Fixes: e4c3755d4dd7 ("x86-64/EFI: don't call EfiResetSystem() from machine_halt()")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

I see this dropped with --gc-sections, FWIW.

Thanks,
Jason

