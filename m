Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316DDA842B1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945536.1343723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qmS-0005iY-1S; Thu, 10 Apr 2025 12:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945536.1343723; Thu, 10 Apr 2025 12:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qmR-0005fX-UM; Thu, 10 Apr 2025 12:13:15 +0000
Received: by outflank-mailman (input) for mailman id 945536;
 Thu, 10 Apr 2025 12:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ged3=W4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2qf8-00077g-1Q
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:05:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2414::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b5a3a77-1604-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:05:35 +0200 (CEST)
Received: from CH5P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::22)
 by IA0PR12MB7699.namprd12.prod.outlook.com (2603:10b6:208:431::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 12:05:29 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:1ef:cafe::10) by CH5P220CA0016.outlook.office365.com
 (2603:10b6:610:1ef::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.24 via Frontend Transport; Thu,
 10 Apr 2025 12:05:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.0 via Frontend Transport; Thu, 10 Apr 2025 12:05:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 07:05:27 -0500
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
X-Inumbo-ID: 1b5a3a77-1604-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOsIVm+97c7inmwJR9keJbWcg2EzNN25y7vBR2qMcQiisiITd6dtb1PVy3PATOoymR9V5sc9RMyWr257WvxQc6ECyV4AV0xHmkZC+WJJizpNq73rxcRtFNjQvlAY0ngeXrvKGK1amMGbwE9ZqAp7FIoH6C03YPOOmEgopg8cArzOEShugOF/cG3xwpnzq+Le6sTMyoP6Rej46HbcReFZQe60n3X4624EEDeG7OB9+B1mMSCyHj23BFORh7YwugFKoXdslhgN6GcgHH8yvYLWwpqnwKfajhmaiPzSh3eVI/szgyP7I5ZSMvjob4fcfF5mVqdRulsab9mjIhSzCKLR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TAN7IA2M8DdftQopZKJP3lG7D4zowg6G8xdf5FOIAE=;
 b=RU343dnc4koTImZ+O08m80Pg7kyIs7kQeLmHcrJX6m6x6SZ4Pjfs9t4SySmmoEx4V0SAeI0zqKOryZkOWfd0qqX3+zFDN7Ha7OfeUTIdt0IG97gXk8CFgCYmz1gZCr9K059t4kbDak1nSZdNyy2W1CJGrmx2UFrsg2/+6ynAYrLi1NPQmTpckTaAyAHqBL44pcHqi2PKqcw0BEYVDkB5i+aKhsMPD80jIFCKKcWxlx0dCia/o3nrau0n5b0/uJvCwrDtUbxklyGkl2e0DOAf4x1jh5RuCjvEgjNmn3RX7YuTCtL4c4uFo6cSeWe5VExzZks74olvCw2Mfj8CbQ0Jsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TAN7IA2M8DdftQopZKJP3lG7D4zowg6G8xdf5FOIAE=;
 b=puMy7Ug7XQeW6iOEgd8cOehnXNP8bi9S+8WV7+A0Si/45pK+qt6pm2chCoI5XKvvUfSaQbt25VkMlgH9baj6QTRg4gKXmjQmjlwDR9QoB6RNe4jS3VPV1fx35nbjIZutmrbEFLt5S2hacklYLJRaXr1Ev4JMNdQwXWWZrtbTfFQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Apr 2025 13:05:25 +0100
Message-ID: <D92Y1FMJSC3L.ULV8TKJ956D2@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 04/16] kconfig: introduce option to independently
 enable libfdt
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-5-agarciav@amd.com>
 <7UJZ7DNBvYS92pCcplKug_7DNUY5QJtWUdcN_CWIUsdcumUN4dOXsQka1nGQ5dQwgSSmHBJXJGJo9EGByjmq-eeNR0VyNftIPnKZHcWUrZw=@proton.me>
In-Reply-To: <7UJZ7DNBvYS92pCcplKug_7DNUY5QJtWUdcN_CWIUsdcumUN4dOXsQka1nGQ5dQwgSSmHBJXJGJo9EGByjmq-eeNR0VyNftIPnKZHcWUrZw=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|IA0PR12MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 604f0074-ca1c-4ad2-4e89-08dd7827fc6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3ZoOUwxWWdiVlU3ZEJtMmxyVnNzM2VXRnVZRDF2OENTQWFyQXR4eW9hcFRj?=
 =?utf-8?B?WnpjYlFIWjg1TnhvaHNvNXNPMEVFQmhycXRTWExQeHN2N29YQ0E5ZkRjOXpt?=
 =?utf-8?B?UW8xWnZzek52S0xSVkY0eVhrWTc0UGJqOWhTck04N3R2TVVwMVlWZTB1T1J6?=
 =?utf-8?B?TW44RG5TOVZrU1JGNGdSNkZxajI0OTY0UWVpUmp6c1A4eXZIek03KzhZL3hV?=
 =?utf-8?B?MjladzZYUFEzT3Jtcmt1cEVVaXhieWppVlR6dzdxSWtwcm43S0xVUFV0WTJZ?=
 =?utf-8?B?TEhINzlLWFZ5d08xdEpoSmdNWUI4eGpWUU1tRzROZ3l3OGd1VThSLzFEY0tu?=
 =?utf-8?B?Z3JwMURWRnZFKzZRMTQ3S0NUWWtKc2tFRmJ4OW5LMTRqdjlmR1FWU0dMb3Fs?=
 =?utf-8?B?bWNJcFFTRzZGa1lnWmc4ZVV2SDNISnQ0bGRsNnNKV0JQVVMwVUtkOVFhV0Jn?=
 =?utf-8?B?VWc2WmdGWlZKZzh1VXRWNVJYU3Y1YjhSNkNxd0tuYURtVy8yM3hHQmlUeEwz?=
 =?utf-8?B?eUx5MVBtZVpTV0RpQW45UWRhWEZRNDQxTS9SaE1laldWVndKNy9SM1ZycWV3?=
 =?utf-8?B?M3JMcm91bTdhK24rQVhFdTl4QW0xRTQ1Z1BDTDhYbDV0d3BkdlpKY2pQTnVz?=
 =?utf-8?B?L2tJeFZmcmlqUGJqMENSaDN4T3FIMzB5MVN3WVRDOHUwcE9MOTFZVWd5emtI?=
 =?utf-8?B?dzEzd1hNdURFbncxRkZUZjJTSHU4QlVTZUxnbEdWZVJHRUswcXBpaVJhRlNU?=
 =?utf-8?B?QmFoSkxzMFJHV2s4ekEzaDV0RUZMblF1ck41T3h2dzN1MWdNMXdJK0ZiTUxz?=
 =?utf-8?B?dUpSVHIvOFVUOWozL3JJUWRZM2VSdVBvTFlOS0E2SGVzQ29EdEZ5bWNCbnFO?=
 =?utf-8?B?bHRkNmUrVit4a1NVZTFqenp4blJraXAwaG1xTFFHWkljdWQxaUFxbitPNFVv?=
 =?utf-8?B?b2NFWkFTdDBnOG4zMmxPYzYreXUxUE84N1FRZFE2R29wMHA0SlAwWEpxemtP?=
 =?utf-8?B?bXIyOGF5bWdGU01CWXNSWjlvNGU3YnVWWitERmlzNVE2YkJsSFNmS0JrczlZ?=
 =?utf-8?B?bVpHZDNCR2lMT29KUkhYdVd6ZnFDeVBXaE5QRXdnTzFnUjhaQjc5bDhDK3JN?=
 =?utf-8?B?V0x3bVRwSXFIeUI5MnN2U2ZTUHMzaDNLQnBGZDNybndaQXBZak5RYlpjUUd1?=
 =?utf-8?B?UXVML1BidzQzd21pcG51RDhEanIwdGVwSDFmOHZ5YVdVS2M4S1JYZnVEVjV6?=
 =?utf-8?B?d0xmOGluTWRIOEdFV3ZCcVlqQVdGaTc5c0hjc3p2aGZVREg3RWxRZThmeXly?=
 =?utf-8?B?bFI0RStCL1ViQm93Q3ZHeFFpYVFncFJtWHVZUnRLenZ5RkpUanZjUnQrSFZZ?=
 =?utf-8?B?aTk0Y21ta2JDNDBURUI4VHBWSHZtRGdHUndoaEhwL1loeStETUFWS0Jyc0JY?=
 =?utf-8?B?Q1duUUgvcWgzWWlDYXRvNXJlUDJxTkdRUWRVYXA2eHc2akhjclRQb1g2NkM5?=
 =?utf-8?B?M0d0ZG0yeTBrZGxTdURSTlYrWTZsSXFXeC9DZUlqYkNpS1dVZkFIWFhwSk9N?=
 =?utf-8?B?ZGpMK3JXbE9wS3J1YnpFa0JDZmwyR0ZHeU9YeHdudkpDbldnODI1YmdDbDQw?=
 =?utf-8?B?aWNkTE4raWpRdndoZmcvU0ozV28xbm93WlpEeko2REtqenRheE0xME8xd2ha?=
 =?utf-8?B?V1ZwUk9ZT2hTTjFaNmlJQ0xOdDhhblZSWjBGU3JNRUlvNzRERWUxU1d3YTll?=
 =?utf-8?B?SjNQOUE4T3hYMFNRS2xuL0NGc2NSYWNLbTBUNDg1dHhoRHhLeU5qUFVoSllm?=
 =?utf-8?B?Y1RINzBWMjRzdW1oczhCRGJxeElxZUltWEwxeUhUWmRXNDdpRHNHK2tmMC91?=
 =?utf-8?B?VHA5Vnp6bXpvU0VhUDlWTjB6bnhhZFhmRDY4Wk9tVzVwc3R3NG5oejcyNUxQ?=
 =?utf-8?B?bEFaMGo2a3hpaEQ2b2p5ZjRNZzIvN2w3RDJSWmVLejcySEF6VmZZT2NrWjd0?=
 =?utf-8?B?UnY4YXZkZDNRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:05:28.9933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 604f0074-ca1c-4ad2-4e89-08dd7827fc6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7699

On Wed Apr 9, 2025 at 7:57 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Currently, the inclusion of libfdt is controlled by the CONFIG_HAS_DEVIC=
E_TREE
>> kconfig flag. This flag also changes behavior in a few places, such as b=
oot
>> module processing for XSM. To support the ability to include libfdt with=
out
>> changing these behaviors, introduce CONFIG_LIBFDT. The inclusion of
>> libfdt is then moved under CONFIG_LIBFDT.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

Thanks

Cheers,
Alejandro

