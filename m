Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFbrCTAgl2nwuwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:37:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D615F9CE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236383.1539114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt59a-0004Eb-Q6; Thu, 19 Feb 2026 14:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236383.1539114; Thu, 19 Feb 2026 14:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt59a-0004D4-NR; Thu, 19 Feb 2026 14:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1236383;
 Thu, 19 Feb 2026 14:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0KsF=AX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vt59Y-0004Ct-F5
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 14:37:16 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78ebf98e-0da0-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 15:37:14 +0100 (CET)
Received: from PH8PR02CA0019.namprd02.prod.outlook.com (2603:10b6:510:2d0::27)
 by DS0PR12MB7535.namprd12.prod.outlook.com (2603:10b6:8:13a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:37:05 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::5a) by PH8PR02CA0019.outlook.office365.com
 (2603:10b6:510:2d0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 14:37:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 14:37:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 19 Feb
 2026 08:37:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Feb
 2026 08:37:03 -0600
Received: from [172.24.149.13] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Feb 2026 08:37:02 -0600
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
X-Inumbo-ID: 78ebf98e-0da0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrUgK1yEFZqyDuZJXPZ+qkG5TC8AzaFpggcSH/6HY7oIc9s6V2e8G2GPM/OuTP52BDlt+yk4IS3aePfLknJ+2bGBKZwcIfB+gWFXmV/2ek1Jn6f/JBKIqZJGFm3RCM4OSrUf4ih+KdiOH1Z4F9s35bt0aZ7m/jPXYaGoxGnQ0RdHB74uwn/dy4+blC9t1eMkOe9AkQgH6CTGbdwsq9oMcGiopzxhX+E+7aIwpLjB2ydKZp26gy+DYC9VMVBSHMWroqxL5e4PMSpdKJ0ieiC/JSpU5Tx/2MgoIUb/+WNdW2Bva3dwU7S9gvjgw6EmVcG2qCxnVQsJbiSXrF9i/bnpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYK2ZDaHL3CDGHtV+ngCMUktxVage+/6HNdZScp0ESE=;
 b=QjsL2hJgCxJvFCYSrGfinf5c7IZ8ZryrZFpDtmechZat9wGQI4h2Sb0RGXRDuf65M5M6vtn16LQx2QO+/GYrQFV19c0+9CyGBIoZRjqKHZCqqh0nyUK4Z+pmqeorwpC+t9V9DiLamEEoEoAroNbxazuEvOTSHh8dbo1NRX4SN8QtOmxV/BRNzanM+NkjJOidVwwe2LqJmlncOhwXAUTUZ0T7I2FVnl5r3BH6SJcJkjrKEnGdMx0n5/g+TBWGLUCnmNbCvhZyHxXYA+CG2O36r5zU8Ko0pXJIAeg0r7CjFdfz+agM24rvv1fk/70Ct1ITANDImSP5c77Sc3tVBqaVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYK2ZDaHL3CDGHtV+ngCMUktxVage+/6HNdZScp0ESE=;
 b=Top2128g7fBLA8L7RxRslNLcDETj1XYPxo97d3rODJE9XGxsSB+pOYVu3/BakmdbWGrR49eb1QrKVXuWtM2h/xuKKFs0wzSHEakDM+EL83TT7P7srhJ5J1tbVOxVKIBn8bVGN1bMli4M/9CEQ9EIrZdGxqXL1MK8x0YWOJzBoiA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <88098c92-b905-49bf-be78-ccc794b1d5e0@amd.com>
Date: Thu, 19 Feb 2026 06:31:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Chris Rogers <rogersc@ainfosec.com>, Dmytro Firsov
	<dmytro_firsov@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
 <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
 <a13a45a1-9da4-4fab-9d5d-59ac06ea7b23@suse.com>
 <7a334660-95db-4f6e-beb5-9115372567bb@suse.com>
 <539aceb3-8e94-4476-a538-77c1eb47e188@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <539aceb3-8e94-4476-a538-77c1eb47e188@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DS0PR12MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c23c847-32eb-4c89-7863-08de6fc45a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjNLY3RBeTBSZVJtS2VnQWFSaTVFaW5mREp0NEkyQjJtYkpjZS9xWVA1QjJN?=
 =?utf-8?B?V0JmOWxoMGl3VEY3MlVqVlN5STFEMUtvS3BobmtjWXYwYXFCTUNMVUYwVmxk?=
 =?utf-8?B?bTJSNmkxQTVsSGVYc3lUZWYrRTJZSnNxOFlaS0t2Y1cvc2pYeU5DdGlHS1RR?=
 =?utf-8?B?eDNQcEFBeVN2bEZUOWxLV011T0NIdDNLWkN1SWFYZGVRR3V6OGxxdzd6ZDhw?=
 =?utf-8?B?bWV2dHpYU1g1dXVXSE5oTjRnUlpsR05adGRKNG5XNXBvZHM5NXFOaHZNWVRG?=
 =?utf-8?B?Q1cxN0pLZkRvZGcvdTFEbkM0cHlhbEVpZTBHV1ZQRk9VNldkRzRUbWFqRHBY?=
 =?utf-8?B?RWNOSG80d2VrOWVrSkk3M1crZXNSWnVHa3VCZHZMRXowMEREVHlMcWxHSEFu?=
 =?utf-8?B?RmNGd3VvYXhGajRFTG1qRjZNZDZMWUozVis5L2pOL3Fxa2RnblJXVEp0Mmpn?=
 =?utf-8?B?bVltU3dFNE1QRkEwM1NjUVNIRDhvNzlrcTkyeVVxaHUreFZBZjFlSmhxMFQ5?=
 =?utf-8?B?a2g1cVdQeEVkUFpJcHlyblRQV1ZrdHYrWEhpSDBsT1FmVzdNam12cjRoUWlw?=
 =?utf-8?B?RjJqRXRqUTFsYU96YlF6QTF2NDByekN6cXFDOFUzMHZWbEMxbzRXdTA4aDlT?=
 =?utf-8?B?ZUczOWRpWGoya1RaZ3NJWlVhT0VkeU1SSVQxcnI1SEFtUzZjdXlEOTA3ajRW?=
 =?utf-8?B?bGNWNU9qOEJHZldqRnhwbDBkUko5Z0ZyY1VOakQvZEk2MWl5VnNiSExmL3pH?=
 =?utf-8?B?eVV3d2habnpNRVdTNTdIQWlybWFWY1JmcTluVGhPSW5Hc09oc3RFYU9pM2Uy?=
 =?utf-8?B?ajVlcEhjYkJHTkZjRzk4SStxU2RUM2puNGZDZ2VUUTRNOVU4RGZ5aWw3dUZO?=
 =?utf-8?B?bmZ0OTUyVlNqMWY5SEdYb0F6YmEwV3FnVEVld015WGs1WjJVQzl0Q21QOU51?=
 =?utf-8?B?eHJFdm1uYU5FTHlyOVZ5aUh0UXFYY3RaOHA2a0NMTHVjYzZCVndPWUpNbEpC?=
 =?utf-8?B?ay9JNHl2dEQwSXlwelBDRlNNTlBLY2g4SDdyMzFzQi9XOVBESGpDdFJwOENF?=
 =?utf-8?B?eDV5ZXFjZ1lLeWsvd3hZWFRuZU1ENUg5bHNkY1pkdGJsTTlsSlhhWkhkMUtK?=
 =?utf-8?B?YTNqYWEybU9hZlNJTzhvckNhUEJ4ZU8ycytpV2NCRHNjMkkwdHBBdkYxTVUz?=
 =?utf-8?B?UGdubDRJbFlkUWtvTzZKU3pTSXpoTHJNUmpreXFoVDRac2ovZGpRd0RkZk5y?=
 =?utf-8?B?TzZvcHlNV2lGSW01V0dZSGUxemtTNDdhNHIwRU5adURhcnRHS0JkaFpxa3Jl?=
 =?utf-8?B?OHhWRlc0aXNmMmg4MTVaNUt0T2gySWxQL1d5b1Zna0tRWEdEV2VrVjRFWGlu?=
 =?utf-8?B?RmJwaHJVYWpoSStRYjR3akNkbjhhTkJNU2xqM1ZDak5rNFIvdDVrTzVpV0pC?=
 =?utf-8?B?SnEyLzNYa3R1STlvMG8rbXR4UWlPMW15TlNXaHFidlRDNnNKamZ5T3dkSEtj?=
 =?utf-8?B?ajZpcGxsdU5leVdHdXhMZVZnckJEbDF0UTRkVDBlVmdGajhEVGZ0S0V5NDJY?=
 =?utf-8?B?WUc4a1JtZ2pRVEpSOFhpZ0crbUFPZkRRaHdPRllxU2hQN0krQ0loRzI0WDFJ?=
 =?utf-8?B?TWhXY1dWa2wySkYycnFBemxXSVBYa3VlN1FyOW81QjFUWWczZXBPaFJXcGZy?=
 =?utf-8?B?dU0yemVVQ0FQRkMvbkYzaEt5MnhlL1JwUFRqcEFHVURYOVI2ZjRweWN2TG0x?=
 =?utf-8?B?WXZUd2VjZkJhTmRuK0hNTGM4dXJtN2F6TVV4a20xUFhMU3lmbStkUkpGVlo2?=
 =?utf-8?B?M0pwRDFWd2RCKzV0ZlZYZ0plK3U5VVZySGxNMW9jcmdWa2NWOGFOWkZack4w?=
 =?utf-8?B?WEd2MExzTmtMVUE3WjRJRXFqaFQ1MnZEUHRaQUdSK0MrOG43cUFlQnA4cFV5?=
 =?utf-8?B?VUI0MzZwQlhPaDQySzE2S1pFUU5VY0llRjRYV0ZjbHZnQmMwVktZTHBoUEtB?=
 =?utf-8?B?aTdGWUkxTFJucVU0NVl4Vk1FY0F5QnlVc3JzaU4yS0NrSlVCYU1pMGx4OW9R?=
 =?utf-8?B?Nm52K1l3Umd6Q3RBdDlmUGVKVE9yT0JhWWo2RDlTUkI3NTJvRExST0dMZXFN?=
 =?utf-8?B?R2RHdXkrQ3AxbkxNdFdIY2ZSanlXc3g5MXkxVjh4ME5UeWM1cFlZK2FXYXpO?=
 =?utf-8?B?dXR6OXpLa0c3TDlHV1ZvTFByYjg5L05ZK3JxZi9YeUZvVDBGclVKSTVkVDZE?=
 =?utf-8?B?blZ3MVJFMnUwYzRFVFNQRGtjbWVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	skQTELzijJ7mplWEKKqpn+RXhYSSRHCsGASFqYKGg7q5ASnQmi+D/Jc+QJQdIuQdT9+YDhrHYytFCfmfWeJRT+3yKFCFxazl/UT0ZAvxm/UHcWa56AhBkiMMDR7zTLWmX+jYWAdlBAgS4nL6muT93a1/K5UIALb2VqxbImZ31o4hQKFQs3BU7kwHFqwzSVbLq7SXVrVPr1D+UrZ8t19bE35a6nrAO5KYzOBPqrCpLSy3DpD6sp1zjjdLVfvCDb8W/3S3g04YzfyV6UIDDbDFfl0lQIaVy7xUb5J8I4+PQhEc//R3RYm4N9msFBPSmGwMhODRYAwRF640iDbrvpCXSdodLF5ymeiirRJc16VD2AMr84+7J06LtJG7woA1gKTnvm0Zil1Jw5krcjVAicAcRNw8d8Ps4IBrBMRzBaD0h2aHDXdks/qvdcjzua/vpzn0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 14:37:04.8519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c23c847-32eb-4c89-7863-08de6fc45a1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7535
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
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:jbeulich@suse.com,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 8A7D615F9CE
X-Rspamd-Action: no action

On 2026-02-19 06:21, Jürgen Groß wrote:
> On 19.02.26 12:13, Jan Beulich wrote:
>> On 19.02.2026 12:03, Juergen Gross wrote:
>>> On 19.02.26 11:52, Jan Beulich wrote:
>>>> On 19.02.2026 00:04, Jason Andryuk wrote:
>>>>> On 2026-02-18 14:08, Daniel P. Smith wrote:
>>>>>> --- a/xen/common/domain.c
>>>>>> +++ b/xen/common/domain.c
>>>>>> @@ -210,7 +210,7 @@ static void set_domain_state_info(struct 
>>>>>> xen_domctl_get_domain_state *info,
>>>>>>     int get_domain_state(struct xen_domctl_get_domain_state *info, 
>>>>>> struct domain *d,
>>>>>>                          domid_t *domid)
>>>>>>     {
>>>>>> -    unsigned int dom;
>>>>>> +    unsigned int dom = -1;
>>>>>>         int rc = -ENOENT;
>>>>>>         struct domain *hdl;
>>>>>> @@ -219,6 +219,10 @@ int get_domain_state(struct 
>>>>>> xen_domctl_get_domain_state *info, struct domain *d,
>>>>>>         if ( d )
>>>>>>         {
>>>>>> +        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>>>>>> +        if ( rc )
>>>>>> +            return rc;
>>>>>> +
>>>>>>             set_domain_state_info(info, d);
>>>>>>             return 0;
>>>>>> @@ -238,28 +242,39 @@ int get_domain_state(struct 
>>>>>> xen_domctl_get_domain_state *info, struct domain *d,
>>>>>
>>>>> Between the two hunks is this:
>>>>>
>>>>>        hdl = lock_dom_exc_handler();
>>>>>
>>>>>        /*
>>>>>         * Only domain registered for VIRQ_DOM_EXC event is allowed 
>>>>> to query
>>>>>         * domains having changed state.
>>>>>         */
>>>>>        if ( current->domain != hdl )
>>>>>        {
>>>>>            rc = -EACCES;
>>>>>            goto out;
>>>>>        }
>>>>>
>>>>> So it is only the domain with VIRQ_DOM_EXC that can enter the while 
>>>>> loop:
>>>>>
>>>>>>         while ( dom_state_changed )
>>>>>>         {
>>>>>> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
>>>>>> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, 
>>>>>> dom + 1);
>>>>>>             if ( dom >= DOMID_FIRST_RESERVED )
>>>>>>                 break;
>>>>>> +
>>>>>> +        d = rcu_lock_domain_by_id(dom);
>>>>>> +        if ( d && xsm_get_domain_state(XSM_XS_PRIV, d) )
>>>>>
>>>>> ... if the VIRQ_DOM_EXC owner is denied for domain d ...
>>>>>
>>>>>> +        {
>>>>>> +            rcu_unlock_domain(d);
>>>>>> +            d = NULL;
>>>>>> +            continue;
>>>>>
>>>>> ... the caller would continue ...
>>>>>
>>>>>> +        }
>>>>>> +
>>>>>>             if ( test_and_clear_bit(dom, dom_state_changed) )
>>>>>
>>>>> ... and this bit would never be cleared.  Should the VIRQ_DOM_EXC 
>>>>> owner
>>>>> always get to clear the bit even if it cannot see the result?
>>>>
>>>> I don't think so, no. Whenever a legitimate consumer occurs (the 
>>>> owner of
>>>> VIRQ_DOM_EXC can change, after all), it'll then consume the bits as 
>>>> needed.
>>>> More generally, I think we're better off not making the code here 
>>>> depend
>>>> too much on that special VIRQ_DOM_EXC property.
>>>
>>> OTOH a new VIRQ_DOM_EXC owner will result in a complete reset of the 
>>> bitmap
>>> anyway (that is: the bits for all existing domains will be set, while 
>>> all
>>> others will be cleared).
>>
>> Yes, while writing my reply I wondered whether I should mention that. 
>> To keep
>> things a little more simple, I didn't. Plus for this aspect the last 
>> sentence
>> of my earlier reply also applies.
> 
> I believe flask settings can be changed, right?
> 
> If so, clearing the bit would be affecting the scenario where the 
> VIRQ_DOM_EXC
> is NOT changed, but the flask settings are updated to allow it obtaining 
> info
> about d.

Yes, this could happen, so the bits should remain set.

Thanks,
Jason

