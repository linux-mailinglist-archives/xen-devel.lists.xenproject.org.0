Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C7B51B3F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 17:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118480.1464255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMZG-0001Fe-TX; Wed, 10 Sep 2025 15:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118480.1464255; Wed, 10 Sep 2025 15:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMZG-0001CK-Q2; Wed, 10 Sep 2025 15:17:06 +0000
Received: by outflank-mailman (input) for mailman id 1118480;
 Wed, 10 Sep 2025 15:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ly7=3V=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwMZE-0000x5-Ni
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 15:17:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2413::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 343d2d5e-8e59-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 17:17:03 +0200 (CEST)
Received: from BYAPR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:c0::26)
 by DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:16:59 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::72) by BYAPR05CA0013.outlook.office365.com
 (2603:10b6:a03:c0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 15:16:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 15:16:59 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 08:16:56 -0700
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
X-Inumbo-ID: 343d2d5e-8e59-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n93j8innBKuJuVUUwFqUcFCMNoCSuv+XN0q9R5+CjpNNF+wIa9GmDWmsayir2xcDaoLIKoiHrElq5JdRJ40KIvkP/26oTM9rBX4pHKI+1vDUESzCLEi9qFpliLY838tSLS71qMUUnNmN/FZlQu1cO9XJWZcSx9+NZZuAkPwGr3ks0kxYQz2RtHczN1L2UaMU/46MfpvxgeoQ3e6T50FFoWf0ec9d0gFOR4aPr8JNhA9XaScEEEyowWkzzWcrJCzRe3PABncEKz+ZsixdBrS7iDGjhJIUYqpz8UVXIgeHMLVbVwEWpqgwomDOBeKeG8E949WcofRequTo6+LrlKLhQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlCm9wSUY/e2X1TE/PRNyvakaoCfl+WJ+Dh7fT51WK8=;
 b=St7OphjDZeww2kd2+nc4+kn4nk+PZ9yI5IILBSTrn+RLBtAsSQyzMxnRHC67vcRHLDkQpn+PvYofar/7wTy5Pcb4xeq/64cmfib2AQhN7TQL+yjCJOrjtQXu0nxRRoyaqzH6Huux0Ts5uxF0GyewPePnsnOfJ8dBtxqqZOwuyZsU3dfnRgjxeDiqkgSDW9wTy+kMs8WLodEiMFkwupx/c4BdUA4CxUaG9Hr3gCYiRvXndEpOvPSXUd7IBQMQv32sbe/0gIq6HTGz07jaghn+RF6G60KRTW4bjWTzmMQ4yGlU5G22xdz52RBt2LlXiibl2c/LAcKL3yVgsHSU1oAlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlCm9wSUY/e2X1TE/PRNyvakaoCfl+WJ+Dh7fT51WK8=;
 b=o3RBHhzYLq/SK1T5HhadtV7LmD9y31QmDW5uisRakIq4iBYVM8G96oBo9CZi4VoSI+DGI07PudRHycRc8VWKRok86oWbzlSJIMOOHGNrAS2Y5wzg3W1jxTQ9xP3fJygP5jdVI9rSL36jpFMlp40GSMuWRtkPi8tlK2fL7/gSr9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Sep 2025 17:16:54 +0200
Message-ID: <DCP7XE3F1J8P.3HEG1CKHZW39U@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Roger Pau Monne <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] libacpi: Remove CPU hotplug and GPE handling from PVH
 DSDTs
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
 <2c559b3a-9991-4aab-ad65-645ac0cca5ab@suse.com>
In-Reply-To: <2c559b3a-9991-4aab-ad65-645ac0cca5ab@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 1209682b-12d4-4e5e-874a-08ddf07d164f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDRsdW0yMU1DeDk0UVNtZG5TaHMzZ1dlS0RSWEk1K2RPVVI0NFNBRkdZb0pB?=
 =?utf-8?B?S0pibEYxTmNzT0ZQaHVqeHZSOGdOaDF2dU5uQkdXWTJQUlFYZHBrYXc4Qnl3?=
 =?utf-8?B?OEo1SW9paUtaa2R4UnRMRDBLOC9oeFZMZEZqS0JXOTRkVHY1TkRsR0VYN2E5?=
 =?utf-8?B?d2JaUWwxelJYbDQ0SW8rdytFaTBzWjFNZCswOUZLS0tVdUlTL0ZzR2cwcjM4?=
 =?utf-8?B?YjIrQjV1VDNwRjErZXBwb2F4UWxuSlZNWHNMcGxRODBtZzlDWmZYOW5BMDR1?=
 =?utf-8?B?OG5RSnJCTExlZk5VZFpIc2M2cERlUzlCNi91ZWYzME0vQ2tHbWp0VnJoa0Js?=
 =?utf-8?B?YzJDVjJoZDFYdlo3NE42Ti9qSVh3RnFwUDNMcUR5bFZvRFlKcE9qZG5vd1JL?=
 =?utf-8?B?ZXBZNmZ0WGxzeGhrWVN0SkVkcmJrT1ppWWUxc2Vad0NJV2FXS2M2WlJsUDN5?=
 =?utf-8?B?UStpZXpTaXBnUXBSNkxEa2x1djl4RS9LcGpHeHp2bWVsNUk0NXN0UDdKbGNn?=
 =?utf-8?B?Wm13YnN6K2cwZ1FJQTlIdlhUa25WUXVaa0syVExGRFNLYU40R3JieEV2V2tR?=
 =?utf-8?B?NXJSTGFIOXNTN2taZG9mT29EOStxWXY2YXMzNFk2VzhTNGtUYWJnNXlVMFBt?=
 =?utf-8?B?aTdPQm4rUDhsd3ZHcm5CUWFJalBqMzBOMTRaSWZoWmc2ZENXcWF3d1EzOFF4?=
 =?utf-8?B?K2hsSVFaRC9QRHJiZWdYZ2JaMzlxeHJaWGUyd0pRR2VhUXFKZUk1VS9GWEUx?=
 =?utf-8?B?U3lwQ3h0U1NPTk10UG80YTFyOTFWVlczYWg4a3pweXZOM0JFUVdMYUNuQ3JN?=
 =?utf-8?B?dVcwN2tkcDlpWEo3MDZNdmlCYnNVRXZ0dUkyekF6TWEzNnlsMWIvUmJ4cGM3?=
 =?utf-8?B?OURRdUFtQ0JaaWM1WFNvdmE5a1ZWbzNPdVRURkVuSEV6VVJUbDRLVE5jc2xp?=
 =?utf-8?B?NGJweXhjYUtFRFRsdXowNXo5SXkvQW9yNS9JdXk3ZmxMY0pUaDNJYzdJT2xn?=
 =?utf-8?B?emwvdXRxR1haS2t6Wjh0b2lPWUlLKzlDdzhCOVozWGVEWWhqeEJ6ckJrRWtT?=
 =?utf-8?B?NysxcWF1UHFYdGlPNU5ER1hpRERkbGgyUDRVdVQvL0hnMUNvbE41enNLN05z?=
 =?utf-8?B?eEdCMGlzSWpxMFdtZ1lRZjlyVGUwOVNsRjZGa1cvN1ZxcGhjdnZKNUx2akt5?=
 =?utf-8?B?Z0s2ZjhTeDYwYnlQQkRqZHJSaHQ0ZzNKcWU2RkNqNUpjYUdCVFdsbjNEZFkw?=
 =?utf-8?B?cXkzTmdjTkJLOEN2dWNpZ1VIN040eFRONXdVZE9rV2RmbFZtS1JFSlFIQ0lK?=
 =?utf-8?B?ck4vNmVmRmcrWFN4dUNZd1oxV0t4d3dwSGMwV2JIaEN5VWJRbUpsYU1KYSt2?=
 =?utf-8?B?RlBGNDdScjV0ZklNemhDZEpLQ0N6eGxhZGNTYTF2Y09odjlNNkplY2wyKy9Z?=
 =?utf-8?B?ZjNtZys0TDlFc2V6Zis2c28xNmliQjJQOGVVbXJMKzBENmlMdkdNbG1mRGhq?=
 =?utf-8?B?dkpaQlN3NXd2MTBLd3RPSVBNdjNwS0xlMFYweERoajE3Q0tJODFLRG9LSHRq?=
 =?utf-8?B?bWw5cVpqejhROTVsbnhVVE9CR3ZrcUhBZ2c4T0srSnF6NXc1QVdsSmMySGpt?=
 =?utf-8?B?UFY4d2hHSFpLWnd0RXE2bTJTVVUyUFpWNVByYkY0UzNaSy9HQkN3c09saVBn?=
 =?utf-8?B?dk9Ndy9PUnBCSE85SS9IYWdTSCtyUmI1WnBpNnBMVXFXa1lUMjhHaXZ3b1dK?=
 =?utf-8?B?cFFJVGQrY0pZT1BUVFl5SGo4WXlUY2cramkzeFdJUEpiVndtTy9WUElZMk1R?=
 =?utf-8?B?em9jeEN1dGNjL0R2RjVUNmJRR1ZZcHlKUHM4blpGTHh6NVJZWHdyK0xTWlRE?=
 =?utf-8?B?RnN2SmpWQzh3c084bVhQMDJQVE4yK0NoZ2JXQ2U4SnVNTVlvVFJNQlVKOE1k?=
 =?utf-8?B?dDh2dklhK2haVEZhQjhiVnJJL0FzY1A1SUVLV2Q5c1hSN085ck02ODF5WDBU?=
 =?utf-8?B?bmtZSWRBWkRGcXRTNE5RQjA2Mm14WU1iSG82WUFIOG1JME5nWWFKOERtZ2Jv?=
 =?utf-8?Q?BS0w0v?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:16:59.1029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1209682b-12d4-4e5e-874a-08ddf07d164f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813

On Wed Sep 10, 2025 at 5:02 PM CEST, Jan Beulich wrote:
> On 10.09.2025 16:49, Alejandro Vallejo wrote:
>> CPU hotplug relies on the guest having access to the legacy online CPU
>> bitmap that QEMU provides at PIO 0xAF00. But PVH guests have no DM, so
>> this causes the MADT to get corrupted due to spurious modifications of
>> the "online" flag in MADT entries and the table checksum during the
>> initial acpica passes.
>
> I don't understand this MADT corruption aspect, which - aiui - is why
> there's a Fixes: tag here. The code change itself looks plausible.
>
> Jan

When there's no DM to provide a real and honest online CPU bitmap on PIO 0x=
AF00
then we get all 1s (because there's no IOREQ server). Which confuses the GP=
E
handler.

Somehow, the GPE handler is being triggered. Whether this is due to a real =
SCI
or just it being spuriously executed as part of the initial acpica pass, I =
don't
know.

Both statements combined means the checksum and online flags in the MADT ge=
t
changed after initial parsing making it appear as-if all 128 CPUs were plug=
ged.

This patch makes the checksums be correct after acpica init.

Grygorii noticed the checksum mismatch while validating an ACPI dump on a P=
VH
Linux system.

Cheers,
Alejandro

