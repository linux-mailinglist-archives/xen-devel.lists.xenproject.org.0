Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCA2A208A0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 11:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878337.1288503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcivr-0008Du-0Y; Tue, 28 Jan 2025 10:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878337.1288503; Tue, 28 Jan 2025 10:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcivq-0008B3-U6; Tue, 28 Jan 2025 10:34:58 +0000
Received: by outflank-mailman (input) for mailman id 878337;
 Tue, 28 Jan 2025 10:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldbH=UU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tcivo-0008Ax-VM
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 10:34:57 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20620.outbound.protection.outlook.com
 [2a01:111:f403:260c::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8312d426-dd63-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 11:34:55 +0100 (CET)
Received: from PAZP264CA0086.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fa::16)
 by AS2PR08MB9716.eurprd08.prod.outlook.com (2603:10a6:20b:604::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 10:34:51 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:102:1fa:cafe::dd) by PAZP264CA0086.outlook.office365.com
 (2603:10a6:102:1fa::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Tue,
 28 Jan 2025 10:34:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Tue, 28 Jan 2025 10:34:51 +0000
Received: ("Tessian outbound 671aa0ad34c4:v560");
 Tue, 28 Jan 2025 10:34:50 +0000
Received: from La8f9e7951bec.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3F27725-9BD2-4229-8C66-1C7036DF596C.1; 
 Tue, 28 Jan 2025 10:34:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La8f9e7951bec.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Jan 2025 10:34:40 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PA6PR08MB10594.eurprd08.prod.outlook.com (2603:10a6:102:3cd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 10:34:38 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 10:34:38 +0000
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
X-Inumbo-ID: 8312d426-dd63-11ef-a0e6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k3Tjq6GOafm9Wzuav+BmSjzt70+/o77Qii4CsfNLstrXD00LW+43CCRct8zLAynBnjrKpHY1XZtlR6dIl6h6BURG1Uis9qMgver7iv/qo6DuDdyNNrFxumOpVLNQ4tlJd4rWvmZ0GFAVpJQUIEUPiO2XZieKXLp34olSSUQUlKlMmWlr0lHldBoUcAAWANJjban4A5sniQYbNYoV3+xoG0Lw0E8aaKalTuk6blHHR7S1B97YR9cUiIG4P3egXVktBMgpltDQ806eGaK4/TJTropwQds5BxF9rrxoUsV8HtMktb/3K+OX1dwS5SR7vPdMQYPw82AEegAC9rK/I6ambg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xiinY+D8vfdhgdrxMh3iziYTey/5cXJj2erHf0h0zY=;
 b=SnjW1e5tnpe8FAK8rZT40NXPghMxf8ti9vz44KIh+OPirTYlPH8ALUoCaVj11wQs9NDC0rD/mQLwpsPmRrLkAYjlPAizwIk0uM3rFVCQOipQgS+I19NTtWXahja7yurveg3SMc6gNdWxomIPNnFSW8v0czzh416mla0fmScr0OO9BcokPJmV841CmsFmym6nHqoQH9fBQGhQ2cT/g2yNH6mqo5FXl1GCEfD7YMb2VdQFJVqsgFo/jGq0/+yPAKcPRd2pxPzMx8wAfiC90Qvj+m8e2kdqtpo2i8LHeE37E16KCb5Z88cMZLadGpQvlZKM9dgGFecHED/dEQZJAOeEQw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xiinY+D8vfdhgdrxMh3iziYTey/5cXJj2erHf0h0zY=;
 b=pWtkFwE+1Y3TwORtf5oZyW9fmAm/6OJ4Px3qgQ6IOoXYSJxy48qsN5gJwi84NiNcDjUIYa0nDvJjFoVapysA69m9OOL2cdyxzfK4Ez748MydRb9XW2WP5+DT0aIuecftXR9E1snxT/qTi3zpK5SnkApkg/XiX76mcqVqiukBrGk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e366d069cb3207e
X-TessianGatewayMetadata: i7HFIcXRbkAMa8Pt+Hg+tASLMcYgQBP2Dc1w/DagHgTzgJMW2AdrJx27uhfQVpwSb+uHrMF/ScOsahSpqsTgEc92BjfzMjaAyDtGor1SU+ZmTCchjczHMpRAQO4R9pXoboZB29L+Ld1JYoBj+ImlHZy3+6+absZB1mgWeOtHjko=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0v9qF3+yS0D1bhhuNcBxf/qo6J+RXeEJruxMMPUBagNn3K62XWynD4aeMMd5ohAxSGtZUY2qDLCuCHy22EQ6jOCJ8MkGaLKRvWkBX/g4wwiFE9BZw/L0160LNiuBZJg3zPgBULRxjNp0pXkUFPucevDyaaha2FmLM7XY++eZcnlfAG91nUIz19liZTv37SdfOx/Zlip1kKGQ5MTgq071KiiZcHMFyArKhl5YLkUrZ/5+k8eiCCN7vpyaJ9y7Jb9S8WDRjJKALmFqfwXPaq3gt96moA76scWvXJ8lSa7H9P4uE7YtpTfaT3cAh4s1ENS+nF9vSyo5/p0u3bO2MmD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xiinY+D8vfdhgdrxMh3iziYTey/5cXJj2erHf0h0zY=;
 b=MuEMrTrGH8ZWpUcampHvdM/FgUvYlyig4NJGgZnfgClOa9ly0MUJ5wl35fnxLP6aGQcZE1OfPYhhUaPn5wqwDiE8BGCYzlAyupMeh1ftufToiTHG+Clw2fYl59y6u4cMklSb6FS6xeuohlMWWDoTujbPLeFikLo/V6LIUy9UiZA8CL/lFwdz0dxhu/scqZX1VQ9t6sSvrytWmRIJ9MvyCP3YpNMjkFwuviWRVW6b27cnfrYHyc2NqlB8VDOiIlUGC0KAFkkiZ3uGgIGvj99hGVQqz+NrZ/zNc9TyRiNR7QtP8fMYPoBaIw0gtwHXBW4uzc6XvVYH9YZhJ0xgX2DcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xiinY+D8vfdhgdrxMh3iziYTey/5cXJj2erHf0h0zY=;
 b=pWtkFwE+1Y3TwORtf5oZyW9fmAm/6OJ4Px3qgQ6IOoXYSJxy48qsN5gJwi84NiNcDjUIYa0nDvJjFoVapysA69m9OOL2cdyxzfK4Ez748MydRb9XW2WP5+DT0aIuecftXR9E1snxT/qTi3zpK5SnkApkg/XiX76mcqVqiukBrGk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>
Subject: Re: [for-4.20][PATCH v2 1/2] device-tree: bootfdt: Fix build issue
 when CONFIG_PHYS_ADDR_T_32=y
Thread-Topic: [for-4.20][PATCH v2 1/2] device-tree: bootfdt: Fix build issue
 when CONFIG_PHYS_ADDR_T_32=y
Thread-Index: AQHbcWiul9cH2IOw7U+mIQTrfYS+Q7Mr/YSA
Date: Tue, 28 Jan 2025 10:34:38 +0000
Message-ID: <4A4FAE76-59FF-4DBD-92A7-5158B0404C7F@arm.com>
References: <20250128094002.145755-1-michal.orzel@amd.com>
 <20250128094002.145755-2-michal.orzel@amd.com>
In-Reply-To: <20250128094002.145755-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PA6PR08MB10594:EE_|AMS1EPF00000047:EE_|AS2PR08MB9716:EE_
X-MS-Office365-Filtering-Correlation-Id: d82fd8b0-7c38-411c-ae9a-08dd3f876589
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?THRVWGc2TG9qWjRiRzNNRHJleElkakd5MXB2VTg4L2RwMFRjOFRVbzhCaUZW?=
 =?utf-8?B?ME1nWjlqQ1FpVVpvZUM2THNSSFIvTUp0M0cyQTZXYzROTWxlTS9DZlZHNTA0?=
 =?utf-8?B?blZqWUNTbkZOR09lR201VjdJTEVsWVgzTkIyd2hDS2hSNUozMy9Vak1xYmNL?=
 =?utf-8?B?b0J1TlFJTTlSdzZYU2VxN0x2VGNPaVQwbUc5a21DTERNcVdFNXUycmoyV0V2?=
 =?utf-8?B?dTRxcVJMRWJlUzkxSzA1Sm9lYU9sQmo2WVVmZXBVM2hiWDZva2REZVV0NHdt?=
 =?utf-8?B?bzJhT2JrcGoxejQ4TmJ0OW84Sk83VUs4TE1jUEsrbHdURlJTVVRYR2J4djNF?=
 =?utf-8?B?RDVPVkZUb05rSnVQeTJNWi9Hb2d5OXIzcUprbCsrZWJYaHczZC9KNWpTYkxI?=
 =?utf-8?B?SVE4cEpLRDhQQW9XVzdSUk5uWHVVWUpVT0RaWlZZZXpaSDQzRWRJTm1YQnpB?=
 =?utf-8?B?Tm5teXp2UW5hdFIvNkY2UjJQdlVlT3dkdFZnSngvZnpWNlJsWlU0dTdoaE1P?=
 =?utf-8?B?UTJJaENmY2hlWVNMcFdTcnA2aVFoSnRsNnU3b3FWYktuV0l4NTlXU3h2NmRU?=
 =?utf-8?B?bHBzUWpNMWFCWkZISG5XdzhBVXdDN3lEbUdQaEtJOWlmcDVIVEZxQUIxUDY3?=
 =?utf-8?B?VlB1V1pmUFpORmQ0em1oRkVya2Z6L0dCNzNhR2RlalVjL0xUVVhQcFU4dXVT?=
 =?utf-8?B?ZU0wSytEYnRWSGIyZE8zYVBSNVhZMWZBTHJZeFN6dVg4bXl5UFY2TUwyWHd1?=
 =?utf-8?B?TWliSkt6MmlxYjIvUS9ZVnU4bUZ2T1VmV05OSXpmYzBZdWVjM2ZZVmhvSmZQ?=
 =?utf-8?B?Tk51c2F3eWJZQkdoa3UvWU4yRHJ5S3RIV1FrcEFTRGdPUjlacHpUTkdrdjcr?=
 =?utf-8?B?MDl0RU1TOEU3UUxhNmVWZDRTRFl4N1pRTXR2azY3Vm5XYXNBRDJldGtpRWpY?=
 =?utf-8?B?cmxLbXd6b3VnZlROLzQreFVtMFJPeElBUkF2aVRBZzlTZ3ZUZTkzb0c4VVU2?=
 =?utf-8?B?TitjN3JaQ284bzFwZU5iblI3cUMzWWdsZFk0TEFreXIvd0s4V0JGd244ZkN5?=
 =?utf-8?B?M3FQYitHdGROejV6eFlIWHJTZlNBWjlkNTc1TXV1blJ0ZFZSdG5qMXhRSFd1?=
 =?utf-8?B?RExEbFdic2ZUakVtcFdSTVVTRkRMOENTQkx1WUY2ZG1aanQ1aTdvc3pVeVNV?=
 =?utf-8?B?SWh1cnlFTXY3NG4rR0NRZ0tYKytrTUJnWEgvWlk5MnhMRk5nWFBlQ2dxcUdB?=
 =?utf-8?B?OGFQekZiZEJiQmx5a3pUVnMvRWNQaENndU10Zld4YlBOU2ZpbTIyeGFnQUts?=
 =?utf-8?B?T0dRV0NNUUhaNGRGbHJyYUc0SFNXR0JhZmlNWmlWZDN2MVptQkZ0Q1laUUxj?=
 =?utf-8?B?aExpb05pZHY5SFArS2dlMWh1TXkwOTljaVNYbm5RUFJGVnp2WkM2UHZqUEhk?=
 =?utf-8?B?dVBtaFQxMWh1dEEySE9yQTFBMmNSOXlDSXVpREUrNUJtdS9hVXB3M2ExSWN3?=
 =?utf-8?B?M1FFZk1rYy9UMDBoNGZVdnJsUU9iQnlRZmNONW1iT2hTMXRncklDU2lJOFB5?=
 =?utf-8?B?MEgvWlhPSlVPZEEySVBlRU9ZLzBCR0FSaDE3c0trR1ZRcFhmWTRCVWR1bHRo?=
 =?utf-8?B?ekUxbThtY1gxRXMrcitaRndDMTQyMGRwY1lmMThJSTNOMGZobVN1VURPU1JF?=
 =?utf-8?B?cDMwM1NPbERNNlJ3TFpleFVIbkZvNWErK2tHTzVNTWJ6REFnWkduWFdJZHBE?=
 =?utf-8?B?Qm9KRDJSWVpzdmxVU2I0cG5YcFloMTM0U3ZZQjdCeTZzeGl1bWdJOHNtdDRH?=
 =?utf-8?B?c2Q3NExLczN5d1V2MDlmOW51SFZuWDVlbjEvSS9tYjNpZGIyMG4vTG1qcWRR?=
 =?utf-8?B?Z1ZPY0IrcVR2NmlnNHlPVW45MUw0R1lzdVJWMTFlNEpNcGt0cDBZQUpEbTAv?=
 =?utf-8?Q?PlTzUH4pR29Ic3yzFHgkV58a8etAb1FU?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <211A94DB77EA8947935F867A28B4A7BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10594
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ccdb1552-25c3-4b22-07c0-08dd3f875e09
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWxWU05ZSzQ4WStzdW9kb2FQbndVZEpYY3pjZXJTV0JhNVhUSkZzaDNGNVJl?=
 =?utf-8?B?QUtOdkwrVkZyMGttSVM0ZmtwVFJUbSswZHI5SHRnaStrcTd6RlpCekJKbVQ1?=
 =?utf-8?B?aWdVVW1Gdkk1RDY2eGs5Uld1OGdhcEVRMlcyQmVqRTNqY2dHL2JmUnVxKzhJ?=
 =?utf-8?B?ODUxZ3dFTU5tVTBBa1B4VE1ITDNDVGlKRkVyUVhPUlEyUWFMeUtTRjd0MVQr?=
 =?utf-8?B?Z2tkOUNBMWdhL0hpSXdGTUpuRisvc0ltT0JDMWY1UjJIWXAvWGRRMUpmWjhY?=
 =?utf-8?B?RHAreGlxbFpjSkRBY085dFYzd2NsQTUzV1FOWG9EZkJLQzh3YlArUnRwYXYw?=
 =?utf-8?B?czhKWjlWTVhKQlh0bmlUdWRJaFE5ajZCODd4bzZHK2RQT09tY2svVE1hZHpR?=
 =?utf-8?B?WFBYdnZYaVZaZ0g2TGwybWhtTVpRYWtSV1lFR2h5TU5aWFMwSVFLMW5BUzdP?=
 =?utf-8?B?ZmFNVWZEcWVCWnJUUE01aTE4SFdwMGdmQjVmTlp3UlFlN0pscExCRWl2NTBQ?=
 =?utf-8?B?bGg0NDZ1VHB0SlRQR2lCY2gzOXBOejFmUDZ3QndqZDg2U0ZGU1FFZjNQcVhW?=
 =?utf-8?B?TlhmT2dodVl5YUIrSnZVLzZnV09sTUt2NzZKOG05a3RpdjZYMVI2c3Bpc2Fs?=
 =?utf-8?B?QkFIWWh6U1NEL3R3TldYOEpySnpoWDRUQkJVOVdjaFIzMUlCdXE2aG9MMjFi?=
 =?utf-8?B?MmtsM3o0Z0pocGsraWVQb3ZZM1RvK255SXozekZmOHc4YVBWaFFqVTE2V3NN?=
 =?utf-8?B?SENRUmpyVTNGNjlYbzhiNDg5ZzhFR2l5TUZBY2JIbCtQTXFUUzd0NGkzVnVn?=
 =?utf-8?B?aXhuZ3RPY0I2L1pMK2VYZ1gySHRmVnJDK2Fycy84NEY2azZCWkNoakhsYW5n?=
 =?utf-8?B?Q21tcWZURnBpV2lNc3dJdFJJTStHTUh5SElINlBlcnVoYlpYZWJXVk5iWjJ1?=
 =?utf-8?B?Tm5rdmdSV3RxNHoyWTEzdUpNOFNnUUREVTNBWkdCMU13OGs3eS9kRWpnbCt0?=
 =?utf-8?B?USs4M0xsVzJRRWY1aC9IYW0yR2JNSkZWUXdJQUtLck5ZNU1haTVHbEhlRHR5?=
 =?utf-8?B?TTZsWmx1VGdaaFQrMEIzVUhHZm9aWDRVL3c0TXkraU1pSEFpRkpQTzVqWmFF?=
 =?utf-8?B?WktGV09xZDVRcmhFODd1ZzNNUndlakF2aVJDUXZYSVJxQXp1NVZ0cnFyTGFU?=
 =?utf-8?B?UHVGZkpCTTNuK3U4d0FqMUlIMklWSHF5SGIzM2lwaWFrbmxQQUZzckU2VlZm?=
 =?utf-8?B?YnNWdGtRSlhDRkI2UFdKQ2lpREl1OUxCUEZQZWZsbWZGNnZMb0pvV2RMQVhj?=
 =?utf-8?B?alVaanNxeDlNVU90S0RBUUd3ZTNFTmJoL3o1aE1YTFljUmYwbklzR1NQc3c1?=
 =?utf-8?B?NDRlbzBzV0M1QkgyRXRvWDY5OHkwM0tzV2s2N0w4V1E0YmFDSU04Z3BjN0tL?=
 =?utf-8?B?NjNXTUVibXIyZ25nS25mcWFMZ2xiR2o1YzJOKy9UTW1NUkxUdDNIaG1rR1k0?=
 =?utf-8?B?UGdhdjNta1JzWndyeEJwNno2aHFOanJrZ3p6VTQ5ZFN1bGtwakdPUWZreGFX?=
 =?utf-8?B?eWpqbUNrMnVUQkF2U1RSVmpKeU5aaWErb3I1OEovUEI5dmRRT3NtSmpJTWl1?=
 =?utf-8?B?TnJHTERZVTNwbTJJanZFYWJTcWRzOWJnM2lIdkNYNGFDaGJkdDRzTURyVUQv?=
 =?utf-8?B?U3h3L3RJejBLQzVCamRWWXFwVDlDanFRY09MMWJTcHAwYjNVa3FTYUovazA1?=
 =?utf-8?B?TWdocHhnbmRRaHA5aHRUUEFjTE5Va3Z2bk13aUE0MVpDQjBoeUx3eForbTdp?=
 =?utf-8?B?YmNvcDlGdVZIbytEZmlVK1FxVmlHWFRMeGkweldrTUhYTWVNYzlyMEFnRnZR?=
 =?utf-8?B?WExXMFdCbllLNkNhdG9NZ2tRTGJ3THBlSStTU1F4TEFYRlo2cUhxYkpuTkZx?=
 =?utf-8?B?bWRkKzY4VFdKeVIzNXhBTEQvOWcveWk4dm5XK294Z0l1bzNiWm9DZlJNN0p4?=
 =?utf-8?Q?g0WqN2v3rCCk7XIcieKi7sFtKZB1Wk=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 10:34:51.2510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d82fd8b0-7c38-411c-ae9a-08dd3f876589
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9716

SGkgTWljaGFsLCBKdWxpZW4sDQoNCj4gT24gMjggSmFuIDIwMjUsIGF0IDA5OjQwLCBNaWNoYWwg
T3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IE9uIEFybTMyLCB3aGVu
IENPTkZJR19QSFlTX0FERFJfVF8zMiBpcyBzZXQsIGEgYnVpbGQgZmFpbHVyZSBpcyBvYnNlcnZl
ZDoNCj4gY29tbW9uL2RldmljZS10cmVlL2Jvb3RmZHQuYzogSW4gZnVuY3Rpb24gJ2J1aWxkX2Fz
c2VydGlvbnMnOg0KPiAuL2luY2x1ZGUveGVuL21hY3Jvcy5oOjQ3OjMxOiBlcnJvcjogc3RhdGlj
IGFzc2VydGlvbiBmYWlsZWQ6ICIhKGFsaWdub2Yoc3RydWN0IG1lbWJhbmtzKSAhPSA4KSINCj4g
ICA0NyB8ICNkZWZpbmUgQlVJTERfQlVHX09OKGNvbmQpICh7IF9TdGF0aWNfYXNzZXJ0KCEoY29u
ZCksICIhKCIgI2NvbmQgIikiKTsgfSkNCj4gICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+DQo+IGNvbW1vbi9kZXZpY2UtdHJlZS9ib290ZmR0LmM6MzE6
NTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdCVUlMRF9CVUdfT04nDQo+ICAgMzEgfCAg
ICAgQlVJTERfQlVHX09OKGFsaWdub2Yoc3RydWN0IG1lbWJhbmtzKSAhPSA4KTsNCj4gDQo+IFdo
ZW4gQ09ORklHX1BIWVNfQUREUl9UXzMyIGlzIHNldCwgcGFkZHJfdCBpcyBkZWZpbmVkIGFzIHVu
c2lnbmVkIGxvbmcsDQo+IHRoZXJlZm9yZSB0aGUgc3RydWN0IG1lbWJhbmtzIGFsaWdubWVudCBp
cyA0QiBhbmQgbm90IDhCLiBUaGUgY2hlY2sgaXMNCj4gdGhlcmUgdG8gZW5zdXJlIHRoZSBzdHJ1
Y3QgbWVtYmFua3MgYW5kIHN0cnVjdCBtZW1iYW5rLCB3aGljaCBpcyBhDQo+IG1lbWJlciBvZiB0
aGUgZm9ybWVyLCBhcmUgZXF1YWxseSBhbGlnbmVkLiBUaGVyZWZvcmUgbW9kaWZ5IHRoZSBjaGVj
ayB0bw0KPiBjb21wYXJlIGFsaWdubWVudHMgb2J0YWluZWQgdmlhIGFsaWdub2Ygbm90IHRvIHJl
bHkgb24gaGFyZGNvZGVkDQo+IHZhbHVlcy4NCj4gDQo+IEZpeGVzOiAyMjA5YzFlMzViNDcgKCJ4
ZW4vYXJtOiBJbnRyb2R1Y2UgYSBnZW5lcmljIHdheSB0byBhY2Nlc3MgbWVtb3J5IGJhbmsgc3Ry
dWN0dXJlcyIpDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFt
ZC5jb20+DQo+IFJlbGVhc2UtQWNrZWQtYnk6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vy
b2Noa29AZ21haWwuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBtb2RpZnkgdGhl
IGNoZWNrIHRvIHRlc3QgYWdhaW5zdCBhbGlnbm1lbnQgb2Ygc3RydWN0IG1lbWJhbmsNCj4gLS0t
DQo+IHhlbi9jb21tb24vZGV2aWNlLXRyZWUvYm9vdGZkdC5jIHwgNCArKy0tDQo+IDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9ib290ZmR0LmMgYi94ZW4vY29tbW9uL2RldmljZS10
cmVlL2Jvb3RmZHQuYw0KPiBpbmRleCA0NzM4NmQ0ZmZmZWEuLjUyOWM5MWU2MDNhYiAxMDA2NDQN
Cj4gLS0tIGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9ib290ZmR0LmMNCj4gKysrIGIveGVuL2Nv
bW1vbi9kZXZpY2UtdHJlZS9ib290ZmR0LmMNCj4gQEAgLTI3LDggKzI3LDggQEAgc3RhdGljIHZv
aWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnModm9pZCkNCj4gICAgICAq
Lw0KPiAgICAgQlVJTERfQlVHX09OKChvZmZzZXRvZihzdHJ1Y3QgbWVtYmFua3MsIGJhbmspICE9
DQo+ICAgICAgICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IG1lbWluZm8sIGJhbmspKSk7DQo+
IC0gICAgLyogRW5zdXJlICJzdHJ1Y3QgbWVtYmFua3MiIGlzIDgtYnl0ZSBhbGlnbmVkICovDQo+
IC0gICAgQlVJTERfQlVHX09OKGFsaWdub2Yoc3RydWN0IG1lbWJhbmtzKSAhPSA4KTsNCj4gKyAg
ICAvKiBFbnN1cmUgInN0cnVjdCBtZW1iYW5rcyIgYW5kICJzdHJ1Y3QgbWVtYmFuayIgYXJlIGVx
dWFsbHkgYWxpZ25lZCAqLw0KPiArICAgIEJVSUxEX0JVR19PTihhbGlnbm9mKHN0cnVjdCBtZW1i
YW5rcykgIT0gYWxpZ25vZihzdHJ1Y3QgbWVtYmFuaykpOw0KDQpBcG9sb2dpZXMgZm9yIG5vdCBj
YXRjaGluZyB0aGUgaXNzdWUgZm9yIHlvdXIgdjEsIHByb2JhYmx5IEkgZGlkbid0IHVuZGVyc3Rh
bmQgdmVyeSB3ZWxsIHRoZSB0ZXN0IGl0c2VsZiwNCndoeSBhcmUgd2UgY2hlY2tpbmcgdGhhdCB0
aGUgc3RydWN0dXJlIGhhdmUgdGhlIHNhbWUgYWxpZ25tZW50PyANCkkgc2VlIHdlIGNoZWNrIHRo
ZSBvZmZzZXQgb2YgYChzdHJ1Y3QgbWVtYmFua3MpLmJhbmtgIGFnYWluc3QgYChzdHJ1Y3QgbWVt
aW5mb3xzdHJ1Y3Qgc2hhcmVkX21lbWluZm8pLmJhbmtgLA0KaXNuJ3QgdGhhdCBlbm91Z2g/DQpG
b3Igc3VyZSBJ4oCZbSBtaXNzaW5nIHNvbWV0aGluZy4uLg0KDQpBbnl3YXkgSSB0ZXN0ZWQgdGhp
czoNCg0KVGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoN
Cj4gfQ0KPiANCj4gc3RhdGljIGJvb2wgX19pbml0IGRldmljZV90cmVlX25vZGVfaXNfYXZhaWxh
YmxlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUpDQo+IC0tIA0KPiAyLjI1LjENCj4gDQo+IA0K
DQo=

