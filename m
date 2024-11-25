Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB49D898D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842859.1258528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbEB-0000aN-U7; Mon, 25 Nov 2024 15:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842859.1258528; Mon, 25 Nov 2024 15:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbEB-0000Y3-Qo; Mon, 25 Nov 2024 15:42:19 +0000
Received: by outflank-mailman (input) for mailman id 842859;
 Mon, 25 Nov 2024 15:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caTh=SU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFbEA-0000Wk-Iv
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:42:18 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2415::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d63de508-ab43-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 16:42:15 +0100 (CET)
Received: from CH0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:610:b3::8)
 by LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 15:42:06 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::8e) by CH0PR03CA0033.outlook.office365.com
 (2603:10b6:610:b3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend Transport; Mon,
 25 Nov 2024 15:42:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Mon, 25 Nov 2024 15:42:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 09:42:06 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 09:42:05 -0600
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
X-Inumbo-ID: d63de508-ab43-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjIzIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQ2M2RlNTA4LWFiNDMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ5MzM1LjY3Nzg5Niwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcpTBbfmn3BnMot70tfJmy7Oye+5105EQ4qzi9vU2k8TKa4nqj1fd6/xHsMdy5p8RUst1qm/HRJkTfN3cOimVkYkzKW3ANBiVDR7RaqjPgO406Ywk/wGfgOS4ZUO8GWigLhRM9D5XVIitdX7TKZx/aoXylT5shsT/8+G+QllCEgql/QZFOsWV3ZUokXkIAwtK+HE4yE55GCd/eLaPcH/m5yuaR3scxCNN7gfV3eGojMn+IQF47nnzJymMdQV7NmjOR8HRv5bUuL1euKjDJEiUYn6MWQUHNJcz8y75phGpDMX4N2UOTq9aN9DpoIc27c9Fcm2qzIDzsgwk2sTSQ4HCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcRWqvfZs6PV81YuTl+FNAb/lwx4e71osOa5QMHpj9c=;
 b=H+YNIIjQbOMpMMcCc7puv5cKmhBLDUlW6Zqq42LEKe6Gzr/yTkcqvMGo6Wo3bm5IZ0X/Q8YY+JCTnNOZbzwlpzMFzaz9qddkRNLde+Ds0RYglYMiJS6cK7T+xtsfi69AbbBWxvQVlbyUPG7rYaUNk1PitVQZlCqbdPnm6h0UoFCaz5SU1EyGf45+RL38gM0q3cVcbG/VC+1+tSaonrz3I9LQZSJE+ufet95tSzdW2DfTflMSZsQsAOBZ5RgFLHXYo5Imvi7JeYBt+qpNT2/0SAXJpCN3tWaOlxWxZanxyNnBxSm96ZC9sz8FtSSBt0jGyzSHHfCIXYb5MQ1eS4Wfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcRWqvfZs6PV81YuTl+FNAb/lwx4e71osOa5QMHpj9c=;
 b=dAWwxILc1JLpYPml8zOtZnyIGxYDEqzTTqq8oMGyaDymFMvJm8eVO5qGQ4x3NM/1z6P5qVTMe5FCGDmkeQiX7T+Jb7WEMVCKDdBMO5NWbl5Q4Bttw8qi1BJlMEi4Fnwgc9dlkmGIiXkrKJW/AXMaAsqqP+Q7K55i4h3VIOEFoEc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <20753f5c-bdf5-4f87-aa94-6a32a96f4b94@amd.com>
Date: Mon, 25 Nov 2024 10:42:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] kconfig: introduce option to independently enable
 libfdt
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-5-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: d23cf07e-b258-4be3-1fe9-08dd0d67b771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWloNVU4ZEoyQjZvV1ZZQzFEbEl0THN3V2lvSVVXaEt1dURKa1BIcDRybXdq?=
 =?utf-8?B?ZDQ2Sjg4Skpnb0MwY0FDbDJHTTJBRkw0N215K1Uya25zZGszRHBhQlNLdUJk?=
 =?utf-8?B?L3BCVTU2amhqMys1N0NzNlU1YkwwTEtmcER0MXJzdExUNm5kTjhQWWNZWFFz?=
 =?utf-8?B?UmY5SGQ4L1RWZ3pIQnBXbVlucmkrMERJaXNPU0FidUo4ZmIzM3o1NzllaEtD?=
 =?utf-8?B?QTgwdTFQRWJYWVExUUpOSk0yV0dab1NBaUV1SndTUTByY3BVR093V3VjMnVx?=
 =?utf-8?B?bjl4MVJqYzBxRWpmUWJTYnl5aytrWHhLdytweTZuVHUyKzVZNDI1aTIwUFFE?=
 =?utf-8?B?bVRQbUtFTFVVTW44ZmJ0M0JwamNBM01IOEJ3Y1NOZ2d6b0d2SVY5S25pajYx?=
 =?utf-8?B?RUFMZE9wYUs2ZmNvT0h3VWRGbno5WEFzR0FNS3JFemkzUEZ2Z2c4Y1orTXdx?=
 =?utf-8?B?V3hoMHl3cFZ5UXMvck5xQmtCQzEyWHFnQ1dCckVNa1lVQzkwMEZhSzVrUndZ?=
 =?utf-8?B?YTRaalJYNFNDVStMcTdTVmpBVmJWSVYvdXBWTlVYWTFmMktFa2NncHJZZGpX?=
 =?utf-8?B?MFFaaDFLT3RJcElGQ21lYUg2eFF2b25MQThTRHpIa0gyRDJRbHB4NmNpbld4?=
 =?utf-8?B?U2FlQkdneGdSMmRYVW5RejROSHo3aTdTRWNJZm1hWXEzaUNmbzZXS1JiZjAv?=
 =?utf-8?B?NThRV0RBRWJVODlFMHljMUhVQ0RPSWJnNGFWVjVNR2VPYXRoMnJjRGpFNnFW?=
 =?utf-8?B?bVFnNy91N0Z0dWpOVXFNYnVBKzNsdktXZU8wVExqVXErTUFrU2RLa3M0bmEw?=
 =?utf-8?B?Y1E1VTNFVlc0b1k3RExIVzdENFlKT0gwMFZ0NE1VYnVkY0hJQ3J4aG5TQVdj?=
 =?utf-8?B?Q0RwYWZ1ZGZsamNMT1hQQUswZ3RUcUhac2hIakpVVXJNSlFnL0VUKzVvMXhk?=
 =?utf-8?B?WitIeGFINkJjVUEzeXhTM1c4MkxaSjVBQ20rSW9tQUJIMTZ4cko2VEMvR0pi?=
 =?utf-8?B?WHpFcktCQitVYXpVQVNXclFobHZQRVRJL0ljcUt6U2FOREtuVk1xQlVGbkRJ?=
 =?utf-8?B?S3VPNGxOb2s5bE5JSlgydDRoVUh4Sk9WdGRTaG1lNFBDdHhycXJpRlAwZFQw?=
 =?utf-8?B?NUh5QXVUVnlISVcybGY1UjBvY2ZSSDlESHV1R3IxakRnMEhSZmdpb3Y1SlNk?=
 =?utf-8?B?ZkJnWDBVV3RCSFFtTzZYMCs4U01nSThqRzlwR3IyMXdQT0xLSUhyQm81QUVM?=
 =?utf-8?B?aUpiSzlvT1NyTTdhNkVZVW9wbHhuTE14bDA4WnNyZG0zZktab3NEVFdOZnZM?=
 =?utf-8?B?bTlpMzJXMmsxZUIxZm5ISGR6cm9HNWFoY1RWRkNkTWdrYmFrS1A5VDdxajZE?=
 =?utf-8?B?M3RnbEZBNkNlV2RSbTlNb1BsaS9sY0RmL0xpeG5XVDNyVU5RSHlEeWJLVUhQ?=
 =?utf-8?B?b2ZPZ0E4ajd3M0RxZmdwakNqQ3c4eVdvZ2wvTjBrdVZtanZHTEk1RjQ5UDc0?=
 =?utf-8?B?bkRRQlNxbFBsdHZqcUVaSk5Kd3BiUGNOa2xUSStuaUVBYklOblEvZWN4VHpu?=
 =?utf-8?B?MGUxSU00LzhRSzA3cGdOdWNIekk3V3BTSjBKVnBkRm1lUnZtU2Zvc25NZXpJ?=
 =?utf-8?B?ZXgrTWdzaVR2QnVxZkg1aktkUStVeEptNC9rVVFkNjFkU2MySkhxL1FKY1BK?=
 =?utf-8?B?QUlET2M5UWRsM09WYVBZY3N2WXNsWFVsNjdmeTllZEtOazA3Y052VUJOakFr?=
 =?utf-8?B?U0pQTnJQMTBVNFA4NlFpQUlvcTU5WDUyZUJIc3dONHJ3OVhUa3hPbFVhUUQw?=
 =?utf-8?B?TzVUekYwRUdXYk9SQ3prRVFnZDlZOUNwVnpjbHh2MGIrbHBpVVAwd1Z5aEU1?=
 =?utf-8?B?ZmZjNFNVSVlGYXVsRnljMFR5aENIOGNDRktRbFUvcURwTW1lditMUGNFYkc1?=
 =?utf-8?Q?73TpB1GxnrPnfR/F9R6c3g5HazjYh12s?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:42:06.6133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d23cf07e-b258-4be3-1fe9-08dd0d67b771
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Currently the inclusion of libfdt is controlled by the CONFIG_HAS_DEVICE_TREE
> kconfig flag. This flag also changes behvaior in a few places, such as boot

behavior

> module processing for XSM. To support the ability to include libfdt without
> changing these behaviors, introduce CONFIG_LIB_DEVICE_TREE. The inclusion of
> libfdt is then moved under CONFIG_LIB_DEVICE_TREE.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

