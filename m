Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84419E2500
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 16:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848049.1263066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIVEM-0005fj-HP; Tue, 03 Dec 2024 15:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848049.1263066; Tue, 03 Dec 2024 15:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIVEM-0005cY-E3; Tue, 03 Dec 2024 15:54:30 +0000
Received: by outflank-mailman (input) for mailman id 848049;
 Tue, 03 Dec 2024 15:54:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tIVEL-0005cM-Cc
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 15:54:29 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061b.outbound.protection.outlook.com
 [2a01:111:f403:260c::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df7bd25a-b18e-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 16:54:26 +0100 (CET)
Received: from DU2PR04CA0316.eurprd04.prod.outlook.com (2603:10a6:10:2b5::21)
 by PAWPR08MB9590.eurprd08.prod.outlook.com (2603:10a6:102:2e8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 15:54:21 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::26) by DU2PR04CA0316.outlook.office365.com
 (2603:10a6:10:2b5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 15:54:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 15:54:20 +0000
Received: ("Tessian outbound 206fab1c37e0:v514");
 Tue, 03 Dec 2024 15:54:19 +0000
Received: from L4a802d8ed828.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0983236E-F230-4036-8706-7CE37C759F22.1; 
 Tue, 03 Dec 2024 15:54:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4a802d8ed828.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Dec 2024 15:54:08 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by GVXPR08MB7848.eurprd08.prod.outlook.com (2603:10a6:150:16::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 15:54:05 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 15:54:05 +0000
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
X-Inumbo-ID: df7bd25a-b18e-11ef-a0d3-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KFtQIToY1zDwHyortKBHjgwumgt/OHYCxCuJaKuc/IbQDOO5K956NUpnrvCJpQnKEX/Ljet9ACsMVsmncYas7IcZRPKCRdwLd7/Y9XM7UQPd0bZ0kdxkGsfiIrRuwqJiIXAVUUGnKQFr7mdGm6AmRXVpF7Pqn/9V+BbBJ1vpDK1m75K6IM8bokiOHjeHhGelyBao/Y14HbqgnBPAtmvNRzYjPBS03O0jjMS1NHi/cu+5wx6Sq4UMqsEBmXkHwZ0DGoN4iPANpX3A5EUWAHcwPFHBQHLJl+0w/Ds0fdIW27K9gUzvjmCTxYu/9PZoWQwt80PYaSIPv5TFQp3WtxppyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfdpysEpVYmCg3juruySqhZcoVCTgjl+WYsJi5jecUg=;
 b=HzRZDY+EKrekH28A5cb6io+E772meaZ2nIOGhYKfGLamFaWlj2r+16x5dwra1MdO9od8SSsyVeI7EmhUQhTArZki4Pd1WFsA39L1y3w7juEfcKKZEkeG51wr9IatpfbRKUUtKsLsTq0x4IAhUAjZd94BJhYfgAJLKptevSd5Y7vYlR06hkmYpEEB05/9U0F0oKywKs78KzRdMmQR9SjSQ/OWSSWOA9lC1+oOFJzwTtZv8ouBQUfqY7k9JhI/J/Qr9zoP45g1I2hKo40t2PVRSPCjTkTxDwp7tKxofXfMAn9+mPmBvftAYRltJfdb+5hYuyaAMoRGDgTC4knJjA0k/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfdpysEpVYmCg3juruySqhZcoVCTgjl+WYsJi5jecUg=;
 b=WJtcuHKeANc8/OaKx5RJYSepl12CmXhA47sJE8MneE4gakqms/zDRCHYVzg9eBAJTIv8egzn/bm/N2zGfCMppkd4O+ktbrx8749y5JSXLCDBsmwl6OCOb2fENurWmI2Xeg0HWxeJ4UiKeS+5lmGNoQ44mdOUw042mrQvM0gCDvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 010ef2828509d02d
X-TessianGatewayMetadata: VuZMNs+3RBXvncJOEGc/vMVUaB1UE/LLRXTb9IQWYox7T4X6gUUUVHfGrmePQ6ecTuw60Rfnqry9wntNONj/jilGinZQ498k59+a3tuGOvCbG/8gwL+6Ts7x7RgSmDB7M0cTY/Snx0sEfwttJxGSKTZtHXB5Bi2b3vR5vvxrXrE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwF++H1KyomAfmRWncMdqcMLUNDueEOwSAP5Gd5h6cLasRZPRCRSRyni4zbYcUuGzJoIkhUAIfwjicO2PujVc4THJkWeTH0LE/XI4TvzeHmQ+3K0Cb1yBrP4HB3/meHw4O63bHUmMJlJnfh2OnyV5nSghFbUYT6J1PwNaZWtq+yFSaWDxLDA1QWkTJCv1nlluYepFPS8hUOgGRUZXTNwpJNITQ6nCBaPPgOnDNIuKWUP6sFGUfE+UUwduyou9rmWZnPZD0gcLRtq/ogFVHxUcov6UlGH1vJV/V1ODofSe9NiQ6rWmlvUlboRKmJEmkxb4/xz68RYOWu2TnKPrD+Tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfdpysEpVYmCg3juruySqhZcoVCTgjl+WYsJi5jecUg=;
 b=YY/67yh2EDx1I9TFdAOae4ZNGB+UxQsRWVj7F6VhgML88EPYATYzNV6jcmCTyu5zZiUN8iwdGojl3Qzpf24OdkbYVBKamwddm8mpOnBVw9d85dTfJTKEe+UUAJz18n70w9678mZgVRE8zTjRZwPadLUq6aTXGuDvECFUlBUAEVUNUAv/E4irtF1BUc+7Dc3+5DglrWORR9P4wtDzwTT+BYWmleinfNxgfnR8xHRBsSvvcAUhfhf6zNb9jDWF46M+BuJzrC+nihdEyZPYn95760pUDV90gXDZTxNSFLtylh3VNEI0gdYxU9uO3JXDpIQ8kdVZod7f62WIeEwdprXuaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfdpysEpVYmCg3juruySqhZcoVCTgjl+WYsJi5jecUg=;
 b=WJtcuHKeANc8/OaKx5RJYSepl12CmXhA47sJE8MneE4gakqms/zDRCHYVzg9eBAJTIv8egzn/bm/N2zGfCMppkd4O+ktbrx8749y5JSXLCDBsmwl6OCOb2fENurWmI2Xeg0HWxeJ4UiKeS+5lmGNoQ44mdOUw042mrQvM0gCDvE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Topic: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Index: AQHbRWz5mao3stJzR02TMW5lND/1eLLUrCiA
Date: Tue, 3 Dec 2024 15:54:05 +0000
Message-ID: <433175CF-550A-4AF8-9422-5411D0107653@arm.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
 <20241127183906.485824-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20241127183906.485824-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|GVXPR08MB7848:EE_|DB1PEPF00050A00:EE_|PAWPR08MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da99b2a-3314-4576-8d63-08dd13b2c029
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MnRqZjlqUEVUNTREQ1RpeU15WjRvNFZCTjA3bnQ4VFMxQ1J2bGRMczBaZ2o2?=
 =?utf-8?B?WC96OXgxTDA2TU40N28yYktpTUpobUxzbUF6Q2ZtTkVLdk1tUFV3QlBRQUsy?=
 =?utf-8?B?N2lhN1ZOSVQ0ZVlEZWM2M3c4d3lIbnJ0UzB6alR1RHlGMFkzamdIdDFtNTFS?=
 =?utf-8?B?cXgxdEh4ak5TZEEzMDFNVnFCZFE3Z3lZeWg3M0hSb2xsd2s2SmkrNVUveDl1?=
 =?utf-8?B?RzV2TTlPOXgyNFFXMXJyZ2ZzOVBDVGFHa0JSNWJkOFVwb2VjVGVSNWhRR0Ji?=
 =?utf-8?B?QlI0d0I1V0ttOE9UQTl4UnFQam1pTHh2NnU0dHZTa1JYZVBFWkZHMG56OXRD?=
 =?utf-8?B?eUFsY0xvYkhHSlhiK1lyaVpjMUdPbmJrTWhhNktzZlVrdWhDeVovenZBQXB3?=
 =?utf-8?B?aFNydTEzMGtHZEREclNFTkFIeHdHR3lJd3ZYd01Xa2NJaTlMWHlXUmdaYjJ5?=
 =?utf-8?B?VkVFampnODI5cWN5V3V6bVN5aEpoN3NvOU1kY1MxK0JUcElMcGkweXlKOS82?=
 =?utf-8?B?RlRTdHgyRjhhNStMeXp2ZDR3Y056WGJXd1JSelM4RlJORVNvUmRkSkk1SUE5?=
 =?utf-8?B?ZitKVkFuNWtjcXBJWE9NR2dqdmxDZjJ3ZWowalV2eDI3WFc5Z0dSNzdRRG1k?=
 =?utf-8?B?eGRueDBQUURRUmltMGNxbndiT3JqSzFnbGd5emVpZHRGcXY3Vm5Ucmx3WENa?=
 =?utf-8?B?d0c4b0xwTmFTMWlRUHQvN1lmNW1PemVsUFoxS1FWWE5DOWFvMGJpd290QTlo?=
 =?utf-8?B?eE9mcXVhd09zM0xhNldDUEJXakpWS3VzOEMza3pIeU50dk5nN3V2eGhsd2VZ?=
 =?utf-8?B?SlJQck5neitTd3ZzWk1sN0g2YS9XWmgwYnVtSkptUFRIdUQ0WTlDd05HWnBY?=
 =?utf-8?B?bjlWb3owVlhFZzMycis4UFNua3BoZEhWQU1MaWN4ak1OR0F1djBhK3djbDVM?=
 =?utf-8?B?VllKcnlXU0c3czdEclVRTVpUYWFXMEd5WkkzYkVOMlNoM25uR3VaUmhMZUJO?=
 =?utf-8?B?UTlRWm10NTlVSzFEbndyeitFVXhLeG9YSlFyNEZ2Z3VKWnFCMTQvODhxTSs4?=
 =?utf-8?B?ZElHanNaVzJ2dE9iY2dOU0hNVmdpbHg5YnZzQ2dTUXRBR2dyZ2tid3o4Ny9r?=
 =?utf-8?B?Syt0YmdqVGdzd3ZvR0tqMEc3VE1BUE4xQmFyM0ozbERLRzlHYzRvdGRTVE9m?=
 =?utf-8?B?QTlDRFMwR09jalJNYkEzUXBxZDRkcVB0NnNpS2I1eHhScTI4VDQwZHYrSC9O?=
 =?utf-8?B?MnFYTTNJWElZUkgvcjQrczFFMmNBekE3KzNrOUF0OG94Uzd3OWRpQnhIVmRM?=
 =?utf-8?B?RHJCRC9QMGJWY2wzWnZzTThKRDF6bFRBdzZWU2VNYklHaGRuRldmS0VneFF0?=
 =?utf-8?B?OU03TWFKSVMwbFVuejJDc0U0eWtFMFhmb0NLZlQvQWtqSkFUczg1SEtTMnJn?=
 =?utf-8?B?TW9IemM4b29WeVM5STNsaUJNemVEanhBQzlzTDFNV1NldlJOY3pWWHhjcVp2?=
 =?utf-8?B?R2pJbmI3ZUNyMm5BdDRIYzdOeVYvNkVObUNqYjMrRFhubG12NzYxWldyKzVm?=
 =?utf-8?B?bEZLcWlLWXM2VVlHVytLYUlHY21Wa2s1dC9SY2F6WVd0QTcrSGE1RVBUSVAr?=
 =?utf-8?B?SmdKSkhhN01CaTBzM1B2YTI1clZjL3cwTXJrNFJTRFBFQkphWWk2Y0pHSzkx?=
 =?utf-8?B?Uno2am9mcTNMYlJPdHdTNk9QUktUeHVqV2R4dzBkbDZNODJYa3lsM3pmdURq?=
 =?utf-8?B?b0JwU0FjYk1DekhsaFpHamhtT0FmemFnM3haaDgva1VlTUFla3E5ZE9aTTlN?=
 =?utf-8?B?WExPYS9XZUdJRnVLeHNnQWtaMnV3b2ovS1JReno5aitvQmd2d3hjN1U5dmdh?=
 =?utf-8?B?bkJjb011SWR2Z0MzVmFhMHpRU1RCZ0FxWmxBUXZScCtMQ0E9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <30FCA0C9FDB6AD4CBE5EDB1D2A4117A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7848
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b005394-1214-4636-7651-08dd13b2b6f7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c211NGVFeS92Q3kvSld6dzVwSDVkRnJnaGoyTGtzU2d6YmhEci9EekdSdkp6?=
 =?utf-8?B?b2ViTnE4Vm5lbFlWWGR0cEhUV0lPeDJvVklCak15N1ltWHZUYmZhd0VZdGFx?=
 =?utf-8?B?Si9rcUJ3LzQ1akJWRUdzdnlyMllZeTJXeFZDT1RrYVFGRzdnVVJ2Qmg5OVNI?=
 =?utf-8?B?MjFoWkVIbTJ2M0JHcERBNmlHaUtTb3ZoWnB3anhzV1RUd0w5bVdTR0gyNjND?=
 =?utf-8?B?NUZPTUo5eGJtRGZieUVvamNxM0pSOXUyc2tzaitaL3daRXprNFRaeEdFY25F?=
 =?utf-8?B?bEV3TkJOOFhjcE9DY092MmxvbkxnS1l6d21xR2tId0VnVDljSS93MWtsTDFm?=
 =?utf-8?B?dDJXVUhVRWpZYXZtQXV0QWVhRCtDKzVncVExNk5PWG9VL1djcWxvdU9Qd3VO?=
 =?utf-8?B?dnptSU1yWTloWjZFWGNkVlJMRHJqdTdBWnVrQStHSTdoeXJRVXNPc1lVb3FB?=
 =?utf-8?B?QysweGJleG5QYTZsY2FEekREUWhtODJCU3dzMzlFdXg0L3hSN2VqN0ZBZ1kz?=
 =?utf-8?B?UHYzcjNoanpEaXRrT2R5bElMK2ZHSkVVa2pYbW81YU40ejZRekVYRE04Z29V?=
 =?utf-8?B?c1RlbmNjSXI1a09oaTJGTW5vc0VvZXphbGMvemtMek9PM2RVYUJZVTI1Y3JM?=
 =?utf-8?B?RGdRdXJIcWNZZC83UTFWbWVQNE8rc280UnJRMHN6NE4xSVVMTGV0WUhkUUEw?=
 =?utf-8?B?NkVnSzZYVjJidVcrVmpaSlFzbU00emJWcmFTT3RSNXNkSndGNmNwTmNkS0FJ?=
 =?utf-8?B?d1BoSlNvNmFPZ3NKTE9GSHNiZUo2eTNFT2VkN0FTcFZnQ0tVOHRGQUZUVVR5?=
 =?utf-8?B?c3FGSllaVHU4c3BmbEJpRXYxV251aVc4NTZCTmN6cXB0RXMrelVCeFJuaUNM?=
 =?utf-8?B?RHRVVzhSVk9VOXdPK1ZjZExDQnVPSHR5K24wck1xMjQwaVVzdFZPKzljRG5q?=
 =?utf-8?B?U3p0Q1V0akMyNWpvV3lyN21WQVpOL1lZYXEwb1F0ckt4c01nNWY2YTZaYklt?=
 =?utf-8?B?Ni9rUlEydDJ5RjgrTm5sb1F5S0hLTm1RWEczYm1kVTEvbk9mejRMODhEcGtZ?=
 =?utf-8?B?T01oUzBLWlJDNHdMSHdWclBZYUhmdWdLUzg1TGNLL3U1RE1sZmg0cFFFVWh2?=
 =?utf-8?B?TEtPWGlleWN1V2NtL2Fxb0dmdGZyWnhLMzJPcXpCcEpzaFRUdXJsSndtMWdv?=
 =?utf-8?B?UXhBUzNMclA5eHpnZVo3RW44RU5vSnhFenJLd3dwQ1pzMXpvNWhRRWV5aHNr?=
 =?utf-8?B?YTJzcXAzdjRscFo1L3VjWGZFK0VxSWl1ZVBmMU9GTEtzNWRBNHRSOGFCcG9a?=
 =?utf-8?B?T0MvR1VyTXJLazJqTnpDVWZJczdNY3B6YkNiVWMxWFZkU1ZjbDZjNEJvRUwr?=
 =?utf-8?B?aE5Bb1JlOGsyZGN2Z3Ntdk10ZU9TTTlNcU9ud294RnRiR3RVNnRhN0E1d0VN?=
 =?utf-8?B?amdNQ3pla24rK0VzUGRNT3I5Z0s2U1B4djFCQTYvcUpiOTUraXpFNWlpN2pq?=
 =?utf-8?B?Z2pBR3hNb1YzTXFJdXNuMmh1azFzc2xFY3VSNHMzcENVNHUxcFFUb1hkV1Uw?=
 =?utf-8?B?YXhLc29Qa3ErR3I2NjI4S2tqR1hwaUZFdnhGaEdUVURCNkI1YlhyNDdmNkJr?=
 =?utf-8?B?VzJHaXZyMzBMY1h5cUk3b1dDNjhxbnpMMXBBOHo2VEZpWC9UdU1FVlUxd0Fo?=
 =?utf-8?B?T1pIZ1FQQk53MDJQZUJkdzNCVHlkZ0RxbmFvK0c3dzh0WXZKVjIvbnA3RmR0?=
 =?utf-8?B?MHQ4R1VIZUN2UXovbWlBYzN5SGcyQ1ExUXFGWnczV2J1WW9DRXQyMXoyNWtZ?=
 =?utf-8?B?MkExbWczUmRNMzlITVNpUnJIUlFOUnlyTmpXQ0VBaE1JSEJlaUlqNTRkTWQw?=
 =?utf-8?B?SjZsdmpZaUNWY1k5TCtVK3dMcWxTZUpZOEROcTBlRUFhV3hFVldpaEhMWnl2?=
 =?utf-8?Q?iZAHLwE60mG40D3Y8vFIO50zdEoF4PkS?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 15:54:20.4283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da99b2a-3314-4576-8d63-08dd13b2c029
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9590

SGkgQXlhbiwNCg0Kc29ycnkgZm9yIHRoZSBzZXBhcmF0ZSBtZXNzYWdlLCBJJ3ZlIHNwb3R0ZWQg
YW5vdGhlciB0aGluZyB3aGVyZSBJ4oCZbSBpbiBkb3VidA0KDQo+IE9uIDI3IE5vdiAyMDI0LCBh
dCAxODozOSwgQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdy
b3RlOg0KPiANCj4gQ09ORklHX0VBUkxZX1VBUlRfU0laRSBpcyBpbnRyb2R1Y2VkIHRvIGxldCB1
c2VyIHByb3ZpZGUgcGh5c2ljYWwgc2l6ZSBvZg0KPiBlYXJseSBVQVJULiBVbmxpa2UgTU1VIHdo
ZXJlIHdlIG1hcCBhIHBhZ2UgaW4gdGhlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSwNCj4gaGVyZSB3
ZSBuZWVkIHRvIGtub3cgdGhlIGV4YWN0IHBoeXNpY2FsIHNpemUgdG8gYmUgbWFwcGVkLg0KPiBB
cyBWQSA9PSBQQSBpbiBjYXNlIG9mIE1QVSwgdGhlIG1lbW9yeSBsYXlvdXQgZm9sbG93cyBleGFj
dGx5IHRoZSBoYXJkd2FyZQ0KPiBjb25maWd1cmF0aW9uLiBBcyBhIGNvbnNlcXVlbmNlLCB3ZSBz
ZXQgIEVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTIGFzIHBoeXNpY2FsDQo+IGFkZHJlc3MuDQo+
IA0KPiBFQVJMWV9VQVJUX0JBU0VfQUREUkVTUyBhbmQgRUFSTFlfVUFSVF9TSVpFIHNob3VsZCBi
ZSBhbGlnbmVkIHRvIHRoZSBtaW5pbXVtDQo+IHNpemUgb2YgTVBVIHJlZ2lvbiAoaWUgNjQgYml0
cykgYXMgcGVyIHRoZSBoYXJkd2FyZSByZXN0cmljdGlvbnMuIFJlZmVyIEFSTQ0KPiBEREkgMDYw
MEEuZCBJRDEyMDgyMSBBMS4zICJBIG1pbmltdW0gcHJvdGVjdGlvbiByZWdpb24gc2l6ZSBvZiA2
NCBieXRlcy4iLg0KPiANCj4gVUFSVCBpcyBtYXBwZWQgYXMgbkduUkUgcmVnaW9uIChhcyBzcGVj
aWZpZWQgYnkgQVRUUj0xMDAgLCByZWZlciBHMS4zLjEzLA0KPiBNQUlSX0VMMiwgIi0tLTAxMDAg
RGV2aWNlIG1lbW9yeSBuR25SRSIpIGFuZCBEb2MgSUQgLSAxMDI2NzBfMDEwMV8wMl9lbg0KPiBU
YWJsZSA0LTMsIEFybXY4IGFyY2hpdGVjdHVyZSBtZW1vcnkgdHlwZXMgKG5HblJFIC0gQ29ycmVz
cG9uZHMgdG8gRGV2aWNlIGluDQo+IEFybXY3IGFyY2hpdGVjdHVyZSkuIEFsc28sIGl0IGlzIG1h
cHBlZCBhcyBvdXRlciBzaGFyZWFibGUsIFJXIGF0IEVMMiBvbmx5DQo+IGFuZCBleGVjdXRpb24g
b2YgaW5zdHJ1Y3Rpb25zIGZyb20gdGhlIHJlZ2lvbiBpcyBub3QgcGVybWl0dGVkLg0KPiANCg0K
Wy4uLl0NCg0KDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hlYWQuUyBi
L3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TDQo+IGluZGV4IGY2OTJmYzc0NDMuLjg2ZTQw
MTlhMGMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TDQo+ICsr
KyBiL3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TDQo+IEBAIC0xMSw4ICsxMSwxMCBAQA0K
PiAjZGVmaW5lIFJFR0lPTl9URVhUX1BSQkFSICAgICAgIDB4MzggICAgLyogU0g9MTEgQVA9MTAg
WE49MDAgKi8NCj4gI2RlZmluZSBSRUdJT05fUk9fUFJCQVIgICAgICAgICAweDNBICAgIC8qIFNI
PTExIEFQPTEwIFhOPTEwICovDQo+ICNkZWZpbmUgUkVHSU9OX0RBVEFfUFJCQVIgICAgICAgMHgz
MiAgICAvKiBTSD0xMSBBUD0wMCBYTj0xMCAqLw0KPiArI2RlZmluZSBSRUdJT05fREVWSUNFX1BS
QkFSICAgICAweDIyICAgIC8qIFNIPTEwIEFQPTAwIFhOPTEwICovDQo+IA0KPiAjZGVmaW5lIFJF
R0lPTl9OT1JNQUxfUFJMQVIgICAgIDB4MGYgICAgLyogTlM9MCBBVFRSPTExMSBFTj0xICovDQo+
ICsjZGVmaW5lIFJFR0lPTl9ERVZJQ0VfUFJMQVIgICAgIDB4MDkgICAgLyogTlM9MCBBVFRSPTEw
MCBFTj0xICovDQoNClNob3VsZCB0aGlzIHBvaW50IHRvIEFUVFI9MCBpbnN0ZWFkPyBGcm9tIHdo
YXQgSSBzZWUgb24gWmVwaHlyLCB0aGUgcGwwMTEgaXMNCm1hcHBlZCB3aXRoIG5HblJuRSwgb24g
UjgyIHRoaXMgd29ya3MgZmluZSBiZWNhdXNlIGl0IHdpbGwgdHJlYXQgYWxsIGRldmljZSBtZW1v
cnkgYXMNCm5HblJuRSwgYnV0IEnigJltIG5vdCBzdXJlIHRoYXQgdGhpcyB3aWxsIHdvcmsgd2Vs
bCBvbiBvdGhlciBBcm12OC1SIGFhcmNoNjQgcGxhdGZvcm1zLg0KDQpJIHdhcyB0cnlpbmcgdG8g
Y2hlY2sgaG93IExpbnV4IG1hcHMgcGwwMTEgYnV0IEnigJltIGtpbmQgb2YgbG9zdCwgc28gbWF5
YmUgaWYgYW55b25lIGhhcw0KbW9yZSBleHBlcmllbmNlIGlzIG1vcmUgdGhhbiB3ZWxjb21lIHRv
IGNvbnRyaWJ1dGUgdG8gdGhlIGRpc2N1c3Npb24uDQoNCkNoZWVycywNCkx1Y2ENCg0K

