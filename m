Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D99AE21B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 12:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825140.1239368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ukX-0001XO-9w; Thu, 24 Oct 2024 10:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825140.1239368; Thu, 24 Oct 2024 10:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3ukX-0001Va-6b; Thu, 24 Oct 2024 10:07:25 +0000
Received: by outflank-mailman (input) for mailman id 825140;
 Thu, 24 Oct 2024 10:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sutq=RU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t3uiq-0005hp-2W
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 10:05:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20620.outbound.protection.outlook.com
 [2a01:111:f403:260e::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8466c389-91ef-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 12:05:38 +0200 (CEST)
Received: from AM0PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:208:3e::41)
 by GVXPR08MB11057.eurprd08.prod.outlook.com (2603:10a6:150:1f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 10:05:33 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::73) by AM0PR02CA0028.outlook.office365.com
 (2603:10a6:208:3e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Thu, 24 Oct 2024 10:05:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Thu, 24 Oct 2024 10:05:32 +0000
Received: ("Tessian outbound 57fa7becdebd:v490");
 Thu, 24 Oct 2024 10:05:32 +0000
Received: from Le97da073b730.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F037C093-6781-472B-8AC9-F2AD64195CD0.1; 
 Thu, 24 Oct 2024 10:05:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le97da073b730.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 10:05:25 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM8PR08MB6419.eurprd08.prod.outlook.com (2603:10a6:20b:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 10:05:22 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 10:05:22 +0000
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
X-Inumbo-ID: 8466c389-91ef-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DADGkOHPSOC14fMMGc8KKsDMSfR1xb/QSq6mpItS9RczDPTLtckF/rUZhJ/TUFcUMXm9iP0PXhMm/IX/a3VnMdRJ9Xo0RjPgU8q/fE7saL/Y7kNqenbyM5CnpDKq2DA/Ry5+kTXfrAiP6iqe1uvejKfOBr/a5J5CtWa63P9xgKatJ/dvgzElGAUB+lh2CoHuQlKPz8CDrgPC3tiI2CmiR0O6sZI28E0tedFufEqgAr+8zFEUhnzQVJke4UtY5NDXBmlTWxDWHwuAQIkRjjHNu+N9YdeG+tvDFB70rwt92auvx8VToB6bKzf7IGe4FKY8vGYox0GTmiWIGNq7+HX04Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzVcn8qpvldPKrdGQcDtdcF9/RxDkXjuqpbYCo6Eikc=;
 b=p04O0mXmCptWv6PMyOcpF0ZcCmRDhmwAKAQxtina0sy9CB6tdG3Du6gOsZS6FAGXTYfoO5UFfBEhbb5hTbl1UWzuZqNT+Afo/ywk5HHDzmA0fHqW38ZLg4jEZV3b1HJ9K0xzKcQ5bNuQef1bCpc3Az/0o+P4xE6mpDNy+8qR7qtcjL8+YLvapy9qOrrVYX8pf6WEljp+VrVKy1lgsguAZ3msC+poqzT6HFxWwlrCzUXvwci67zIER+J8JpW3i6V1BchkJPnvuZ31UcCxQ0f/iC5rz12laFHN3/5fXnF8+Xq8C3n6b4kHUnFFhokZ7S08vTqkzlA81i+6ca6ia95EUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzVcn8qpvldPKrdGQcDtdcF9/RxDkXjuqpbYCo6Eikc=;
 b=Io04Y5Ug0FQjTl7koLZ5l6MzBu/jNXQ9KLlthRD/TChOr2x0RdCZ3jutWf192+X3Gek1vwi4ME9rs6Ma1Cgv87HtBRg0iysWvMg7tyEnlhMDbLRtUDuksXNST+AeK4t48mYza7vavO9C9Q+loSlrqoa9nJoA6Je7dRDz7rqo1Js=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cfec53548f50be92
X-TessianGatewayMetadata: gFPrxMtDqJ77uMxGMzKhnODJw7wbqm2ypbFb8D9Cv88yFoy9hDudffUhXKiDme0tS4A6UDuRhC2RncLKUEYOpNJp9CG/YTYGU14Z5ZVTZOvIgp7IPhXxNIJlFOXCtzw4PxE25Xvy2GSdMy/63or25y2O/Kp7FWg0iRG47L2AECo=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+DpsuQCDA2rMfOargvvJALHBBseszsye+Wqu8mOWQL+9YydU/tl+pNE/f42LlkKmuQoIH0vV0At1eoktR4gUckgQNjdxk7baM+QrPsxZPZqzYnRTeh5Z/4SEVcKusEVJK0MVTyT0+svu7BD42F+PB+ABKOLIyGnd0pkwrqZhdaA7ay/U7RNmynztGmk8VCHOJg+7AnT4EP84uwFMa6FBfksPMkilZAVSZ+KmH/9GyY8Sr6998dThMpWKiAjcSH1r+KLjDO14BgjdunhOXnusOLmE0+shJwyFMaOhGawrjicrugPVCqu4NqmWmbWu/uA6znZoTa5W0dK8wKDhXtMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzVcn8qpvldPKrdGQcDtdcF9/RxDkXjuqpbYCo6Eikc=;
 b=mbk2GzL6s424WC1WBLbHfCT1FOCC5h2pw3VQpQhnOf45C4BvIZnc/Fa6WwjAeSSswNeWCSP6wabuvu1c78fYh42ZWwOmZbrvM//lzPO0di8evPJiSoc6CfnM4dze8w4FLPK7r8QZ4Z+qNs+VgfYjHERBkN7XU5eBsBJ93HLwFror9KMcjldpzL1aecJmczr4yvak/FjKL6Mb8fJ/4sJVAX553BWjqn3N5p1DSfhYtdgpul3SPe4vDxIGfYyDli35jDceQPy5R+evDKBsERKryySHpJ3SaVSGdigEDAXtjX8YhD4RVQ+T3hh0QXzC5QrFOkCULh39tl8xwuJwaVt4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzVcn8qpvldPKrdGQcDtdcF9/RxDkXjuqpbYCo6Eikc=;
 b=Io04Y5Ug0FQjTl7koLZ5l6MzBu/jNXQ9KLlthRD/TChOr2x0RdCZ3jutWf192+X3Gek1vwi4ME9rs6Ma1Cgv87HtBRg0iysWvMg7tyEnlhMDbLRtUDuksXNST+AeK4t48mYza7vavO9C9Q+loSlrqoa9nJoA6Je7dRDz7rqo1Js=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 10/10] xen/arm: ffa: Add indirect message support
Thread-Topic: [PATCH v2 10/10] xen/arm: ffa: Add indirect message support
Thread-Index: AQHbH6X9IBo7HgFtxUejZCumPUt4kbKVpD+AgAAU4gA=
Date: Thu, 24 Oct 2024 10:05:22 +0000
Message-ID: <5497A12A-B077-44B4-AB66-1D22D62681D0@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <9464941b06e82763ebe79e3f2adb4ca2497cf298.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44H+EipP-F_12tWidOxfFPf-jVcSs4XjLjBv5t05-Kw59g@mail.gmail.com>
In-Reply-To:
 <CAHUa44H+EipP-F_12tWidOxfFPf-jVcSs4XjLjBv5t05-Kw59g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AM8PR08MB6419:EE_|AM4PEPF00027A6B:EE_|GVXPR08MB11057:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd57522-b476-4c01-189f-08dcf41365d7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R3Z1ZFkxZVBpeEdBTWZvc3dXakNENmVISVl6Wmg4RjlkNzM0WXYzb0p1SU1p?=
 =?utf-8?B?ZDhWR2xEek5HbzMzdG9Hc21vak9IZ2ZPV1hXNVlqTm9SZjd3dDFPd3M3SDhF?=
 =?utf-8?B?ZUFtZG1Vc1ZGU05TdFBETmdNNzlnYjNiYW9wSWF2NmNQUGRpL1BvOVhxT2V3?=
 =?utf-8?B?MzlMVURCdW9LL2xOZVFKcHpJc0xIbkx2YVNSdHZCdHVmZjRsWjFzdmlncklS?=
 =?utf-8?B?Q1JScUYrVmZIR0gzSjE2Qm9lREFQWUNKRlNhUFEwV0k5bGcwSndBVWtwWHda?=
 =?utf-8?B?aDlPb1RzK0VjQUxGZFVCMTcxa2dSZVFjdFFqY0Y2SzJ6cDhRV2o5RjRScmQ1?=
 =?utf-8?B?YzY4MnhTUFhTU0ZoNDBUNzRWRS9yQ1FhcUxBSVZyR0ZkNWtJamR2Y1Y3NDdo?=
 =?utf-8?B?QlpBQ3oyNWhzZW1TNisydEtyN1NQQVdLWXJUNml4T1IxVkRLY2JVR0FHb090?=
 =?utf-8?B?ZDZMaDNFRW9HcWJCMGVTMU4xWXpEbUEvL0VBTU9SLzU5a3BIZDBvMmR4QTBV?=
 =?utf-8?B?dS92UEs4bDFQZTNMTmFucTNWWUhDNS85M0FyV054cHMwTUlsUEh1cDBxMXVs?=
 =?utf-8?B?WFUyZ1BPYiszMG1SaWZ0K3NjYkpBMlBiekswUDZVT213U3o0bjNvRmd4ZHBk?=
 =?utf-8?B?TzhuT3A5VXZlQ1NxR2IxQzNUN2dHWkR6TDl0T3k4UU44NVIzQlgwbVJYTG9j?=
 =?utf-8?B?Vk9weERRWlpob2RTUlc1eTNTQW90em16YTBDcnVwc3NlaVFaWVlrMVNsNXUy?=
 =?utf-8?B?OGdneVNOa1NDMDJuWjh0UlhRSktGVlg0WVBibitUMnduV3VPN0lndVlMVHpX?=
 =?utf-8?B?TW9CZi9kbGFsM2tnL2YxT3krRGM1TU5zVTJ3YXdnOFk4d1hzd1dxSzJWM3A1?=
 =?utf-8?B?ZmdPRHpoRE0zYk5mQ05VT21DUEdxYWdjMEpNRmpsQlFoTkU5Vyt6SUtMR24v?=
 =?utf-8?B?NGlZYVUxUnNsbzRpY0pvbnJ0NzEyN28wb0RjSjZ0SkdjTTZMbWxVdzQzR2RB?=
 =?utf-8?B?eVhwbS93czhlN3lFZnNZNDBFT3ZaTHF3NTVGaGxqcVZWNExMK1JIQUIxOWts?=
 =?utf-8?B?eUZ0VHM5cHdLOUF0S2VFeXhyRFZwMmcvd1JMU2lqZzNPcXRsUTVGL2xGYnRy?=
 =?utf-8?B?S1JlV1NTd2hXbXhVNmxKcHlnVGJqNUY5WTRlREFLQU5PTDM0dFNFa1lIWnB6?=
 =?utf-8?B?eGNGbGk5ekNOUlloSDhTelNLd1FDd0xuVEZNeHV4RXExMk55ZVE2Z0ZlSEpO?=
 =?utf-8?B?bXAySkxpd0NHSnQ4bUdsQUo0ODhRVUFYMHlBc0htTWhELzc3Z1JJekREeTVF?=
 =?utf-8?B?UkdHTDJuSlJWRlNZelJDWE5RNG1CblJyYjJjM3AxZE15Tk9NeEZWaTNIeitu?=
 =?utf-8?B?R2lGZzFzMHBZNXcrb1RiTFJvcmttR2U2YVNNejlpeTA2TmY2RGcvdURvOXZj?=
 =?utf-8?B?dEtpbGplcEJYUWRHdStZa3pOaFJuV3EyTUFKRG5tOXd4ZjFhSFE4cEpNNERL?=
 =?utf-8?B?U1MrdTc5UXlhNi94TU5XVlc1U0RXQ3pPS0g3VUlSWHRFR0p3Y2VydGwzK0xO?=
 =?utf-8?B?VmwvYVhxQXhwckZnN2F0cHJONUVXa3lBV1drZlZGLzVyNGR2Kzk2SHlBME9n?=
 =?utf-8?B?MEVPSHQ0MUZpM2h0QVh2eHdLRDQ5K2pSOStYSXBjemJ3NVp5bHhtTlJPUEMr?=
 =?utf-8?B?YmhWdTVMdytvWTdSejRpclBEUzJtdXduTW1hckd4bzVSWXBTbFNud0tZc1Jv?=
 =?utf-8?B?VDJFSFY4WkNJc2R5WkRYMW1SSkFoeUtDalUrNEpQR09rcVR2Y3dveFZ6Qzla?=
 =?utf-8?Q?BW474raoQA5J2OV+KGwyG0w0wJoyx/Tm/hJF8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A190E605B14EE44C8FC2F23F0B822C08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6419
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	69cb3790-caad-4ddd-83f4-08dcf4135fa0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWhVSkJCRXROM1UwcVM2VkFUOXN0emNnNTRYbmt3THNBZzRPZ0V4M3ZCdHRI?=
 =?utf-8?B?L1V6RlhabjhQdWdEbVRpRndaVnZ2anB6NXY3ME5uanhuZ2dBb0k5WFhwaERi?=
 =?utf-8?B?OVFHSG4wVjh4dTJpVDJiNDNDZUxLMVNPVmRXdmJjb3ZHVHhCK3JnbFdMT2U5?=
 =?utf-8?B?QkJ1TkxEWVhlVjVkYm9WcWVxWnBVMDBxNW9zWjhWeHFZV3pPRTZ1b2Zpd3FL?=
 =?utf-8?B?OHJRanlPSm96cFBFd1I4MytWbk9YWHRGQ1FpR0Z6TzhGdm1jbGFuNmh6WjU5?=
 =?utf-8?B?RDIzdnVWOW1tdGxaQWs1UE9ZZ0FOcjZWVWVuOWY5MzBkcEVRcWR0TFR0QnZN?=
 =?utf-8?B?VWQrUmtITjdmWU1SRHdpdXNCMVA3R0FXUmpFMzFkZkJIeW1uN0UrQXVyZFhC?=
 =?utf-8?B?VExUZ0NTSFBLcUxtUms5NGN4QVNwSFBsWkUvS2FQdEF4WldXSnIxN3JZZGdk?=
 =?utf-8?B?NmYvOFFsWm14UFZWMGZjaVhqaTlyNSttRHVXd0VuNlZNdnJrazJBSTNMVXpZ?=
 =?utf-8?B?R045YkxuVHBMS0FneWtGZmVVYU90UksxcXkzS0d2c1V3eTlUSDBSWmpzcGtR?=
 =?utf-8?B?S3RTYTF3U3hDb3Q3YS9pZGdNSi9kaUhNTitVQmU2ZmN3RUY4VDAvN3ArL1h5?=
 =?utf-8?B?b242aUJtTzBvOWs3bmJvclFKelRTVTNzRE8yQ0VwWHUyaFozMnBLWVYxS2Vq?=
 =?utf-8?B?eXlQQ0dEU1FPNExuVzRRRW9DVHFkeU9mNG05SU1qeVBCR2dpbnJHUnB2cUFY?=
 =?utf-8?B?R2orZExnMWNXU3QyNGlCQ3BjcFNkbWZsb3A4VDdzMTdPV0xpMHVKV0EwQzFS?=
 =?utf-8?B?T1BhMUsxNTZ3RjgrMEo1K0J3RnBJa1R2N1VqTVdIN2FLRHBzWStCZHdJaUtS?=
 =?utf-8?B?UHROTzFVSTVYQW00QjlhZDFBK3dMbzEyWUwrekFualdKVEZ5WDI3VUNHZnNa?=
 =?utf-8?B?T2ZkelVKYW1scVVVUldRQWU1ZDh5Zm50U05kWHhFSnc5Vk52UUVMazRHc3pl?=
 =?utf-8?B?TVkrZTRNRlliRmd1WUxMNVJreWx1Q2t2T1VpSFNBZ1lremY0eTJrWXFxS0tK?=
 =?utf-8?B?THMrdld0SjI4VGQ2Q3FLQktkTGRvRlVYRmdKVWd6cmZWaGFHbjdsd0R4YUtK?=
 =?utf-8?B?WEowazFmL2cya1hVR0xLWWE4V05GT3dxK09udHFFZmF3ZDlKdGNsRE9Qck1W?=
 =?utf-8?B?b1pKMzNOQmo5NXhQN1BPTGo0Nzk3QmFkcjZoSHVVTnlwZDZSVXduSEdkVHNm?=
 =?utf-8?B?L21nZXZwYjJzdTJPd3dPQzdLT0c1OHRCRERJcEZuN2hUakxOa3huTEhGaWJK?=
 =?utf-8?B?TFd6eWVoMzVRRzBpSGQ3dEpiRGtaTVp5OGxzU1hTb1U1SHlYMVk0aS9CaGRH?=
 =?utf-8?B?RlY5bWcrSm9ySEduK0xWT2RBR0Jxc2UzekY0ckFOTzZVK1BqWGE0Y0M5RFFK?=
 =?utf-8?B?dDZzTkEvZTZyblo1eCtTa21tSUJzUFRQRFhCNmdxNTJaekQvM0NpNjZwOWZS?=
 =?utf-8?B?UDJwcEQ1bVpsYXpkdW9VNEpRRnZGL0t0ckRlN0x0SE9uK0FhNkQyemRIMDNr?=
 =?utf-8?B?UnNOemNRVXQwd2QwbFpyS3B5MnRMZEJscU1DVFJ1Lyt4bFgrWmIvQVRLcFJS?=
 =?utf-8?B?U1BDdFExb3hUYUN0YWZkR3R3ZnhsOUVHTi9sQ1E3WlI1RU9yeHRpWEpKTjlJ?=
 =?utf-8?B?NFpXa252enNCcjNOUDBzNGpIM0cwZVNWek1VOGtFdnFFTzA4OWQycmpqNDhz?=
 =?utf-8?B?RFQ3Z3hNeFlZZmM1RDgzV3dpUWJ2M1FMMTMvUmtFU3R5QkdzQVgvbFAzNWJy?=
 =?utf-8?B?cjVZaXY4MjNDeENyME9IQmNUYUVUOEpWdWNsaVdnd1Z1b01rZUhJNk44SWwz?=
 =?utf-8?B?NUJveWY2WnhYd2MrQ1ZPNTVGaVNud2FKNkJTOVBWQWVjZUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 10:05:32.9137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd57522-b476-4c01-189f-08dcf41365d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11057

SGkgSmVucywNCg0KPiBPbiAyNCBPY3QgMjAyNCwgYXQgMTA6NTAsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTA6MzLigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBBZGQgc3VwcG9ydCBm
b3IgRkZBX01TR19TRU5EMiB0byBzZW5kIGluZGlyZWN0IG1lc3NhZ2VzIGZyb20gYSBWTSB0byBh
DQo+PiBzZWN1cmUgcGFydGl0aW9uLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBN
YXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4g
djI6DQo+PiAtIHJlYmFzZQ0KPj4gLS0tDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jICAgICAg
ICAgfCAgNSArKysrDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYyAgICAgfCA0OSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9w
cml2YXRlLmggfCAgMSArDQo+PiAzIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykNCj4+
IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMgYi94ZW4vYXJjaC9hcm0v
dGVlL2ZmYS5jDQo+PiBpbmRleCAzYTk1MjVhYTQ1OTguLjIxZDQxYjQ1MmRjOSAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUv
ZmZhLmMNCj4+IEBAIC0xMDEsNiArMTAxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmZmFfZndf
YWJpIGZmYV9md19hYmlfbmVlZGVkW10gPSB7DQo+PiAgICAgRldfQUJJKEZGQV9NRU1fUkVDTEFJ
TSksDQo+PiAgICAgRldfQUJJKEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVRXzMyKSwNCj4+ICAgICBG
V19BQkkoRkZBX01TR19TRU5EX0RJUkVDVF9SRVFfNjQpLA0KPj4gKyAgICBGV19BQkkoRkZBX01T
R19TRU5EMiksDQo+PiB9Ow0KPj4gDQo+PiAvKg0KPj4gQEAgLTE5NSw2ICsxOTYsNyBAQCBzdGF0
aWMgdm9pZCBoYW5kbGVfZmVhdHVyZXMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAg
ICAgY2FzZSBGRkFfUEFSVElUSU9OX0lORk9fR0VUOg0KPj4gICAgIGNhc2UgRkZBX01TR19TRU5E
X0RJUkVDVF9SRVFfMzI6DQo+PiAgICAgY2FzZSBGRkFfTVNHX1NFTkRfRElSRUNUX1JFUV82NDoN
Cj4+ICsgICAgY2FzZSBGRkFfTVNHX1NFTkQyOg0KPj4gICAgICAgICBmZmFfc2V0X3JlZ3Nfc3Vj
Y2VzcyhyZWdzLCAwLCAwKTsNCj4+ICAgICAgICAgYnJlYWs7DQo+PiAgICAgY2FzZSBGRkFfTUVN
X1NIQVJFXzY0Og0KPj4gQEAgLTI3NSw2ICsyNzcsOSBAQCBzdGF0aWMgYm9vbCBmZmFfaGFuZGxl
X2NhbGwoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgY2FzZSBGRkFfTVNHX1NF
TkRfRElSRUNUX1JFUV82NDoNCj4+ICAgICAgICAgZmZhX2hhbmRsZV9tc2dfc2VuZF9kaXJlY3Rf
cmVxKHJlZ3MsIGZpZCk7DQo+PiAgICAgICAgIHJldHVybiB0cnVlOw0KPj4gKyAgICBjYXNlIEZG
QV9NU0dfU0VORDI6DQo+PiArICAgICAgICBlID0gZmZhX2hhbmRsZV9tc2dfc2VuZDIocmVncyk7
DQo+PiArICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIEZGQV9NRU1fU0hBUkVfMzI6DQo+PiAg
ICAgY2FzZSBGRkFfTUVNX1NIQVJFXzY0Og0KPj4gICAgICAgICBmZmFfaGFuZGxlX21lbV9zaGFy
ZShyZWdzKTsNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYyBiL3hl
bi9hcmNoL2FybS90ZWUvZmZhX21zZy5jDQo+PiBpbmRleCBhZTI2M2U1NDg5MGUuLjMzNWYyNDZi
YTY1NyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX21zZy5jDQo+PiArKysg
Yi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYw0KPj4gQEAgLTEyLDYgKzEyLDE1IEBADQo+PiAN
Cj4+ICNpbmNsdWRlICJmZmFfcHJpdmF0ZS5oIg0KPj4gDQo+PiArLyogRW5jb2Rpbmcgb2YgcGFy
dGl0aW9uIG1lc3NhZ2UgaW4gUlgvVFggYnVmZmVyICovDQo+PiArc3RydWN0IGZmYV9wYXJ0X21z
Z19yeHR4IHsNCj4+ICsgICAgdWludDMyX3QgZmxhZ3M7DQo+PiArICAgIHVpbnQzMl90IHJlc2Vy
dmVkOw0KPj4gKyAgICB1aW50MzJfdCBtc2dfb2Zmc2V0Ow0KPj4gKyAgICB1aW50MzJfdCBzZW5k
X3JlY3ZfaWQ7DQo+PiArICAgIHVpbnQzMl90IG1zZ19zaXplOw0KPj4gK307DQo+PiArDQo+PiB2
b2lkIGZmYV9oYW5kbGVfbXNnX3NlbmRfZGlyZWN0X3JlcShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAq
cmVncywgdWludDMyX3QgZmlkKQ0KPj4gew0KPj4gICAgIHN0cnVjdCBhcm1fc21jY2NfMV8yX3Jl
Z3MgYXJnID0geyAuYTAgPSBmaWQsIH07DQo+PiBAQCAtNzgsMyArODcsNDMgQEAgb3V0Og0KPj4g
ICAgICAgICAgICAgICAgICByZXNwLmE0ICYgbWFzaywgcmVzcC5hNSAmIG1hc2ssIHJlc3AuYTYg
JiBtYXNrLA0KPj4gICAgICAgICAgICAgICAgICByZXNwLmE3ICYgbWFzayk7DQo+PiB9DQo+PiAr
DQo+PiAraW50MzJfdCBmZmFfaGFuZGxlX21zZ19zZW5kMihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAq
cmVncykNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBkb21haW4gKnNyY19kID0gY3VycmVudC0+ZG9t
YWluOw0KPj4gKyAgICBzdHJ1Y3QgZmZhX2N0eCAqc3JjX2N0eCA9IHNyY19kLT5hcmNoLnRlZTsN
Cj4+ICsgICAgY29uc3Qgc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4ICpzcmNfbXNnOw0KPj4gKyAg
ICB1aW50MTZfdCBkc3RfaWQsIHNyY19pZDsNCj4+ICsgICAgaW50MzJfdCByZXQ7DQo+PiArDQo+
PiArICAgIGlmICggIWZmYV9md19zdXBwb3J0c19maWQoRkZBX01TR19TRU5EMikgKQ0KPj4gKyAg
ICAgICAgcmV0dXJuIEZGQV9SRVRfTk9UX1NVUFBPUlRFRDsNCj4+ICsNCj4+ICsgICAgaWYgKCAh
c3Bpbl90cnlsb2NrKCZzcmNfY3R4LT50eF9sb2NrKSApDQo+PiArICAgICAgICByZXR1cm4gRkZB
X1JFVF9CVVNZOw0KPj4gKw0KPj4gKyAgICBzcmNfbXNnID0gc3JjX2N0eC0+dHg7DQo+PiArICAg
IHNyY19pZCA9IHNyY19tc2ctPnNlbmRfcmVjdl9pZCA+PiAxNjsNCj4+ICsgICAgZHN0X2lkID0g
c3JjX21zZy0+c2VuZF9yZWN2X2lkICYgR0VOTUFTSygxNSwwKTsNCj4+ICsNCj4+ICsgICAgaWYg
KCBzcmNfaWQgIT0gZmZhX2dldF92bV9pZChzcmNfZCkgfHwgIUZGQV9JRF9JU19TRUNVUkUoZHN0
X2lkKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9QQVJB
TUVURVJTOw0KPj4gKyAgICAgICAgZ290byBvdXRfdW5sb2NrX3R4Ow0KPj4gKyAgICB9DQo+PiAr
DQo+PiArICAgIC8qIGNoZWNrIHNvdXJjZSBtZXNzYWdlIGZpdHMgaW4gYnVmZmVyICovDQo+PiAr
ICAgIGlmICggc3JjX2N0eC0+cGFnZV9jb3VudCAqIEZGQV9QQUdFX1NJWkUgPA0KPj4gKyAgICAg
ICAgIHNyY19tc2ctPm1zZ19vZmZzZXQgKyBzcmNfbXNnLT5tc2dfc2l6ZSB8fA0KPj4gKyAgICAg
ICAgIHNyY19tc2ctPm1zZ19vZmZzZXQgPCBzaXplb2Yoc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4
KSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVU
RVJTOw0KPj4gKyAgICAgICAgZ290byBvdXRfdW5sb2NrX3R4Ow0KPj4gKyAgICB9DQo+IA0KPiBU
aGUgZ3Vlc3QgY2FuIGNoYW5nZSBzcmNfbXN0IGF0IGFueSBtb21lbnQgd2l0aCBhbm90aGVyIENQ
VSBzbyB0aGVzZQ0KPiB0ZXN0cyBhcmUgb25seSBzYW5pdHkgY2hlY2tzLiBUaGUgU1BNQyB3aWxs
IGFsc28gaGF2ZSB0byBsb2NrIGFuZCBkbw0KPiB0aGUgc2FtZSB0ZXN0cyBhZ2Fpbi4gU28gdGhl
IHRlc3RzIGhlcmUgd2lsbCBvbmx5IGluIHRoZSBiZXN0IGNhc2UgKGluDQo+IGNhc2UgdGhlIGd1
ZXN0IGlzIG1pc2JlaGF2aW5nKSBzYXZlIHVzIGZyb20gZW50ZXJpbmcgdGhlIFNQTUMgb25seSB0
bw0KPiBnZXQgYW4gZXJyb3IgYmFjay4gVGhlIGxvY2sgbWFrZXMgc2Vuc2Ugc2luY2Ugd2UgY291
bGQgaGF2ZSBjb25jdXJyZW50DQo+IGNhbGxzIHRvIEZGQV9NRU1fU0hBUkUuIEhvdyBhYm91dCBy
ZW1vdmluZyB0aGUgdGVzdHM/DQoNCkkgdGhpbmsgd2Ugc2hvdWxkIHN0aWxsIHByZXZlbnQgdG8g
Zm9yd2FyZCBpbnZhbGlkIHJlcXVlc3RzIHRvIHRoZSBTUE1DIGFzDQptdWNoIGFzIHdlIGNhbiB0
byBwcmV2ZW50IGEgbWFsaWNpb3VzIGd1ZXN0IGZyb20gc3RpbGxpbmcgQ1BVIGN5Y2xlcyBieQ0K
ZG9pbmcgaW52YWxpZCBjYWxscyB0byB0aGUgc2VjdXJlIHdvcmxkLg0KDQpJIGNvdWxkIHB1dCBh
IGNvbW1lbnQgaW4gdGhlcmUgc2F5aW5nIHRoYXQgdGhpcyBpcyBqdXN0IHByb3RlY3Rpb24gYnV0
IHRvIGJlDQpmYXJlIHRoZSBTUE1DIGluIHNlY3VyZSB3aWxsIGhhdmUgdGhlIHNhbWUgaXNzdWVz
OiB0aGlzIGNhbiBiZSBjaGFuZ2VkDQphdCBhbnkgdGltZSBieSB0aGUgY2FsbGVyIG9uIGFub3Ro
ZXIgY29yZS4NCg0KPiANCj4+ICsNCj4+ICsgICAgcmV0ID0gZmZhX3NpbXBsZV9jYWxsKEZGQV9N
U0dfU0VORDIsICgodWludDMyX3Qpc3JjX2lkKSA8PCAxNiwgMCwgMCwgMCk7DQo+IA0KPiBJJ2Qg
cmF0aGVyIHVzZSBmZmFfZ2V0X3ZtX2lkKHNyY19kKSBpbnN0ZWFkIG9mIHNyY19pZC4NCg0Kc3Jj
X2lkIGlzIGEgbG9jYWwgdmFyaWFibGUgYW5kIHdhcyBjaGVja2VkIHRvIGJlIGVxdWFsIHRvICBm
ZmFfZ2V0X3ZtX2lkKHNyY19kKQ0KdXBwZXIgc28gdGhvc2UgMiB2YWx1ZXMgYXJlIHRoZSBzYW1l
Lg0KV2h5IHdvdWxkIHlvdSByYXRoZXIgcmVjYWxsIGZmYV9nZXRfdm1faWQgaGVyZSA/DQoNCkNo
ZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiBKZW5zDQo+IA0KPj4gKw0KPj4gK291
dF91bmxvY2tfdHg6DQo+PiArICAgIHNwaW5fdW5sb2NrKCZzcmNfY3R4LT50eF9sb2NrKTsNCj4+
ICsgICAgcmV0dXJuIHJldDsNCj4+ICt9DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Rl
ZS9mZmFfcHJpdmF0ZS5oIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oDQo+PiBpbmRl
eCA5NzNlZTU1YmUwOWIuLmQ0NDFjMGNhNTU5OCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0
ZS5oDQo+PiBAQCAtMzU5LDYgKzM1OSw3IEBAIHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25f
Z2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTsNCj4+IGludCBmZmFfaGFuZGxlX25vdGlm
aWNhdGlvbl9zZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpOw0KPj4gDQo+PiB2b2lkIGZm
YV9oYW5kbGVfbXNnX3NlbmRfZGlyZWN0X3JlcShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywg
dWludDMyX3QgZmlkKTsNCj4+ICtpbnQzMl90IGZmYV9oYW5kbGVfbXNnX3NlbmQyKHN0cnVjdCBj
cHVfdXNlcl9yZWdzICpyZWdzKTsNCj4+IA0KPj4gc3RhdGljIGlubGluZSB1aW50MTZfdCBmZmFf
Z2V0X3ZtX2lkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+PiB7DQo+PiAtLQ0KPj4gMi40Ny4w
DQoNCg0K

