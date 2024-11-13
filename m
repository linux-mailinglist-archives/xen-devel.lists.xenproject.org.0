Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA49C7EBD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 00:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835993.1251871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBMij-0000vp-Ca; Wed, 13 Nov 2024 23:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835993.1251871; Wed, 13 Nov 2024 23:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBMij-0000tq-9s; Wed, 13 Nov 2024 23:24:21 +0000
Received: by outflank-mailman (input) for mailman id 835993;
 Wed, 13 Nov 2024 23:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKVH=SI=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tBMih-0000tk-Q5
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 23:24:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 635cecba-a216-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 00:24:12 +0100 (CET)
Received: from DS7P220CA0063.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::10) by
 DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.17; Wed, 13 Nov 2024 23:24:07 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:8:224:cafe::94) by DS7P220CA0063.outlook.office365.com
 (2603:10b6:8:224::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Wed, 13 Nov 2024 23:24:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 23:24:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 17:24:05 -0600
Received: from [172.17.143.135] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 17:24:04 -0600
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
X-Inumbo-ID: 635cecba-a216-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNDo6NjAxIiwiaGVsbyI6Ik5BTTExLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjYzNWNlY2JhLWEyMTYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTQwMjUyLjQxMjgwNSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9W8P2VkpcWqO6lch6a0qpMXgM29w9AY31EjFGsrs04JEkOpE6zGDUvsn9YO+szFYF+1UQuy69RUZ67kwx+rWxP5r6PKLnOygmFMTWAMhYRsKT3su7FvE91+A4NgHU1TUZZdUIH1QlY2PjRKbu1jcsUjP1e3+DR+tOTrouFWtVsts59/SBQW0WUVLnVkBuH1kAl9AObxdEaZ3E+aX22VWIV1dSfMQievdpCbiY8/yqecFxOntmsgsUgVXhk0ICQ8V+41aRempfFNM7KXMoyI2Dm6f5WZtZi9tmLWJ7/kjFR9KpzJTk/UzsdhABvI50W/Y8A+t5KfNleH5+3azGbLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbk56jpjMmBTLsMVmSo+qlp3vQ1+KGT4CwyZKhI1+hQ=;
 b=S9tOzwOEDmRsEek/d8SZKlrVVeGKC0/6+EggnJZ5WCnlM8IrdqPAicn37H3WccZGh6r5kOLRzze2FGetLldw30oHBRh6M73z6VxpSpPInmW95JsAy4tqYcmgVffIKbc/6Y+DHMl19UOUkJPBIAOu1x0aVXOwtn4LHBPKpTtnblnjlHwFlgEVrX78WbRlKE/lBqr5q5hJBOWAUVZwdWfL4Gz3WfPnMOxJ33sH+LWvXc8VYyyD4/WoeBhxZyN2W7XG5mnC7hRXxZTDtBEJe81OPDiA+N32y9J/3NeKgDYZUaJx4FGGMROCbmvdmlogBQ0XQ38hS94ydIePsXECoB9c9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbk56jpjMmBTLsMVmSo+qlp3vQ1+KGT4CwyZKhI1+hQ=;
 b=AU4GohdkpBgOj8su/Y0ymUbRUEFX9PRC8ECRIodMd7qiW96XBX0yHLhmwvXlqDXNZT1sjvmsCeNpssa2R7aKI6q0tn+C0YSDEo4x94f2PLJ6OlJsrgrMUw/+Ofrd45vB+i/jrvdtXZlQ0uW15n6VprYocQz4bN3oU9uMx9WPzZE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <777b5cca-2d74-4526-ba25-b9ece75901c5@amd.com>
Date: Wed, 13 Nov 2024 18:24:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/earlycpio: Fix header to be standalone
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241113164844.1750237-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241113164844.1750237-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DM6PR12MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d2f9c0-d763-4df7-9d12-08dd043a452f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEkyeitrREg3TGpydVRuY1FUdTdkdGdiT2pseVpqREV4NFRZQTN5S0M3WVpJ?=
 =?utf-8?B?dHIvTlA1WHJSaXVzT2RIcERQZTdCampDdWxTdkVvbUsvVUhtWWk1elVaM0dN?=
 =?utf-8?B?cG1teXdkMkswc0pmb2F6Vm9JTEhINW1aYXNVZzJWZmpGZlM1WmxWOHJXZWNa?=
 =?utf-8?B?RmMwSzJ2UG9JcTl1T1VrYllvNHJFQkdKdS9EQlcvbTJ6TWJhQUVPbngxRk9R?=
 =?utf-8?B?S2t5RUNnRjltZ1JYMkR3NW1iOEFHVDBPNjBEc2RtZklPODlpR1c2bFBSd0ox?=
 =?utf-8?B?a3NGS1pzNVYwY1pnQVRPYVFlbk5aU2haYjVmMGlDUGtEcUIzUVdsNkc4alg2?=
 =?utf-8?B?T3VwamNmT1g1UW82Q3JwOUtNbDZiYTR4TE96MjFqRUFvVTNMUW8vS3lpMlB1?=
 =?utf-8?B?ZUJ1bXFMYSs5Sy83VCtyN2JFZGJoSHBzazFaaEc5QmRDR0lPTVJ2azgzMzY1?=
 =?utf-8?B?NzR3b0FpbXBuRDdIM1Q2cVZ2SjhBNUZQRXllVkZNTDl1RnFudEF1RnNTQ2xC?=
 =?utf-8?B?dnVvODByV2NFZlg3dk9ISFd1NU9EZnM5cVA5MnF2TmN2WlYzanpPM1ZCbXlQ?=
 =?utf-8?B?enpxV09NRGNDTmZwcW1nMEVLOXlMaTZRM1BjQWE4QVBkeHo5eXdZZDVMZ1lz?=
 =?utf-8?B?TFJDT0VKVFdDSXhuaE56L21TK0lQTjQ5eWVsc0xtNkNLN2YrZFhiS05uSThL?=
 =?utf-8?B?SDZQV09wZ0tTNEp3YXhPL2Q5Tkw1dnJ0bGhtMWl1TXp1eittR1NGWVB6bUMx?=
 =?utf-8?B?N2V1U3BaaU01Mjl0ZWY4d3ZYVDZ2SDFOVEZxSi9hZmMrRFc0MGtUd2lQamRL?=
 =?utf-8?B?ZDRHWnFpMWxib0ExZlg4NUZHcHFJN1IzVVlGTlozVDRZaGZwdE1BRXBlays0?=
 =?utf-8?B?S2VjU2xkS2svOHM1L1JVZExWOFFCRmMzenJ6bDJDWlJWOTlOMktFblZPaDhH?=
 =?utf-8?B?d2FGaVI4UmFRcUdpQkY0SFdYRFl2dVRwbGp1amZNcHdJcTJsendBYzcxRnU2?=
 =?utf-8?B?SHdJS0pyNzhwMThnRFhJV3c2RjNrN20wTkFSZ05OT01RazFHTHFIelNwQzl2?=
 =?utf-8?B?VWlKQnFML2FZbGNpRmZFN3UyS1BXaU15Sk5iZTJoUVAveTV5aFhjU0EvUGt5?=
 =?utf-8?B?ZGtTSTdLTkZuTDFTMzE4UmtyVHMyd1JIeXN4cE9Fb1crS3JZSmdWM2lxbHky?=
 =?utf-8?B?YjYwSS9tUFZWYUF4SGdWd095UmlQb1hJTGVxVDJVNEV1ZTNTYW5pYlVrQzhz?=
 =?utf-8?B?enVvb1UycCtuT2UyMFpTaDBObE5BMndaeVZiTVpqOG5wV1hDaWt0N2xKUzZt?=
 =?utf-8?B?TDhxNDVBZ3lTb09ud05tb1B5TmVZbkxMMXBIUEpvOWROei9NMjJkVSt2bmFO?=
 =?utf-8?B?S056OWx4ZmdMSVRKK1BOdDh0clFpbWxxZTV5Kzd4bXRIMXJMdFl3Q0ZxYldY?=
 =?utf-8?B?Y3AvNVRjc0hWSFlDdjFnWkI0V01US2xMNS9jS2R6RDIxU0gxbko2NWp0VnBJ?=
 =?utf-8?B?eXBZdmZvRWtNVDVkRUFielBEQmx1YXRxTmNOS1FUZlhicU9JUk93aTFraEtB?=
 =?utf-8?B?d0FLVUFyS0J3eDNyT3pqQytVSVNoMTk3eGZUSXdMT2lHK3lUeXNhcHIyd1Zl?=
 =?utf-8?B?MWpQVWJ6dTB0UDBLQURRNlFRQ2VoNWc3VWtpR2gvVm84RzE1Mis0QUhtZDMy?=
 =?utf-8?B?K3dhQnB3SjZkRmVrRUlwWHhhNjJ5bUxONzc4OWxLSi83NStOaWkvZ1FXSDhE?=
 =?utf-8?B?ZHoxY2g2K3BnNTMrKzUvaHBxT3JzSSswU25hekJrRHVFUmtRa21lZnRaSVN5?=
 =?utf-8?B?andoVkF2MTd0ZjVZcmRubEU5RzZrMGMzSFlTVXJpY1o2QndHTExzS3dRMTNq?=
 =?utf-8?B?T2dVN1JZWnJqcTM3S1FISnZEM2dscmd2eVRRL3QvOHVPOGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 23:24:06.8716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d2f9c0-d763-4df7-9d12-08dd043a452f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265

On 2024-11-13 11:48, Andrew Cooper wrote:
> Split out of yet-more microcode cleanup work.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

