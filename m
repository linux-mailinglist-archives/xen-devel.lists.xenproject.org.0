Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8328813BE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695967.1086367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxKW-0000KJ-Tn; Wed, 20 Mar 2024 14:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695967.1086367; Wed, 20 Mar 2024 14:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxKW-0000Hm-Qv; Wed, 20 Mar 2024 14:54:12 +0000
Received: by outflank-mailman (input) for mailman id 695967;
 Wed, 20 Mar 2024 14:54:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q18G=K2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rmxKV-0000Hb-7d
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:54:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260d::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4a1fdeb-e6c9-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 15:54:09 +0100 (CET)
Received: from AS9P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::16)
 by AM0PR08MB5428.eurprd08.prod.outlook.com (2603:10a6:208:182::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Wed, 20 Mar
 2024 14:54:07 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:46d:cafe::42) by AS9P194CA0011.outlook.office365.com
 (2603:10a6:20b:46d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Wed, 20 Mar 2024 14:54:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 20 Mar 2024 14:54:05 +0000
Received: ("Tessian outbound 1b0f2681ce6f:v300");
 Wed, 20 Mar 2024 14:54:05 +0000
Received: from d754fdb2c57d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C436C516-8FE6-4B24-A1B9-A44B352E6C09.1; 
 Wed, 20 Mar 2024 14:53:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d754fdb2c57d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Mar 2024 14:53:54 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AM8PR08MB6596.eurprd08.prod.outlook.com (2603:10a6:20b:369::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Wed, 20 Mar
 2024 14:53:52 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::446b:ac86:e80c:ffda]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::446b:ac86:e80c:ffda%6]) with mapi id 15.20.7386.023; Wed, 20 Mar 2024
 14:53:52 +0000
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
X-Inumbo-ID: b4a1fdeb-e6c9-11ee-afdd-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Glh/jMTCwEsf9H8bvSa+7EISz4zxzUIIFuXNf82WaTjrVOupZdRgnoT1N0b5gw/C6JG4VYl/ZaVWAhjOKaRfe70axPYV5DU80TyzCGxrDgVDCGtcTYt1oyTwEjCb9XT1Qty+HhHKyqZRilVC0nunGl3az6YIapFzgNsil93qfezFMAYeJef8GkVYN3VwheHgH6Zn+8oBMM+/74QYBOv1f2WT16oOmf+huZKGehu/uK989ORHt1KYzvwAv2bYewr3GO57V9LnAP/5uMBP+KoZA7/nt4eZ0toxv1RtXQjI7HFhcCm+YnBw2TqE7fagacu2whtDpk0u8aTLVVg3M/tZ8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCrHcLBUoBzKyfc/QzlK3Dv+hNOybDPb78n0FUH4GQ8=;
 b=IqoJZWiTIhv9z9iOCIroJ0IIj2aRlct0+SfjCvrENolGsDx0ASR97+tve5KtYNGccbOEO/RujxNHX/TDrwMShi0DhI/HuIcJlX0GxXUt8FB4cN1EuyLx3XtRPunCcbfMziWXGoUDzshh3RsP24sq3NlSBGcrsJWkVQmcQJPBLRUqE0YAqVJIfO8rjxsyHz1ZJpP0CowTAkpEHvTEUHzh0OMDbOPYZ6MGGHrwNu8H452XXbh2vn3u6c6JRsaD2EtfhexrPEgEaq1uZhW7kB7qXY7AqNUg0apxqevwQI//Tpd9md99y9QOnLtoYLo3sq9/Lo6todXFa1qp5cgVzZYk7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCrHcLBUoBzKyfc/QzlK3Dv+hNOybDPb78n0FUH4GQ8=;
 b=wUfiqwMdZBFd8lTWeeEzg9GtkGZtyXPyXGByA76c0638JYOAeczVilK7oSqatN1m2o/CLRvwobVOUEQgAhuw6OV4ppKrWiFcxNBStbU27a6Om0CiyTg7qSqL2eJk8Q5q4gpsjapRpiwPfr54R3EBRv1GU/zLcbilDHf+LjP9llo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f28c292ed61c27ef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYgCk/sHmlQQC0Nn4XmWDFSO7NIwZB3zH/jltDSBskBCVrxuoW0RhzbrtubpLgdIMUSmSLp3fu8DkmWZJl2x1Xj/iPtzgCMEaasTlttM8F8nXRcId9xjy0tT4t6uJ03IjB1DswqoWBIXbLNAE8lArowoPzd7wMvB1zfo4jVlD5px3kUlghd7maPus6QEevJopE7y1rEw5L9/tMP+l41KIeId43rV7ohXcocgSroEEEQ+v1t1ayYFBn4cQKXb0HNKfA4Gx1QViIyaXKppbHKOG/KXVVP5o3UjCvte1yzHOr4KiTiz6EyosYM1jBrSmvUaRVPNzdQHNuI/Xa12EjCfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCrHcLBUoBzKyfc/QzlK3Dv+hNOybDPb78n0FUH4GQ8=;
 b=KLdtc+VjU8qryW2bhqsv8Nq4PvkabqjP7nQEkYbSf/O+iPwV+ehox0s23vdy4ky34YIqoieDSNZBHdFhpfk1UOQMdGhivNYjns2EcXz3uKfyP2VjrLnU7fk9QSKUryRtZSrUtXmkrYbTih/oZx7CEKZpAqrMUPEOsubZYIf5ofwuBkrA76D/S0Gf6JHSMkJt4hHcXwFOqyAkMy6LtuKQ9vH0qLcrieG6obN0deCUeQfTllTZXMXZEf3/z3x6m9kLy06xRDdK1MSXAG5vFsdHFTSbk/1yLp8fMcLEiVV/CzDmLqJ/2LvBN23O5gXv75xIk3celFW+/pXJXhFCgi9w3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCrHcLBUoBzKyfc/QzlK3Dv+hNOybDPb78n0FUH4GQ8=;
 b=wUfiqwMdZBFd8lTWeeEzg9GtkGZtyXPyXGByA76c0638JYOAeczVilK7oSqatN1m2o/CLRvwobVOUEQgAhuw6OV4ppKrWiFcxNBStbU27a6Om0CiyTg7qSqL2eJk8Q5q4gpsjapRpiwPfr54R3EBRv1GU/zLcbilDHf+LjP9llo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 06/11] xen/arm: Avoid code duplication in
 find_unallocated_memory
Thread-Topic: [PATCH 06/11] xen/arm: Avoid code duplication in
 find_unallocated_memory
Thread-Index: AQHadH3Zl0JABPg3OE+1Nn9HTjmokLFAgeKAgABB7YA=
Date: Wed, 20 Mar 2024 14:53:52 +0000
Message-ID: <280936E1-27DC-41FA-8E3B-080CA562A7B8@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-7-luca.fancellu@arm.com>
 <3bd5d32c-d2e6-4e53-8b3e-aa7fdd058c71@amd.com>
In-Reply-To: <3bd5d32c-d2e6-4e53-8b3e-aa7fdd058c71@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AM8PR08MB6596:EE_|AM4PEPF00027A62:EE_|AM0PR08MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: 164dfd0a-b1cd-4845-bf1b-08dc48ed96ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zyilVJM0ZpJlDC66fCpCUO8FX7tiqq9G8pRtn8WKvYfcPSUdFx1im5qkd4II91i27yb/lsLy9sWH6X7xl3sYfS5wMsMvaZRlo07Or35934vslBeTi28cIaSJRd7z0z/jUTh9kTMKWSGk2NGTGeDeFuMUzv7HNQpVQOum8pvrcQl1RyF1MeqyJN01HPRgI688kMCsbuFrItp1O8YRX/Pngzf1V1TU0/o92ShNSi9SWTSNPXt+kgZwcnBEtcwUEgSwkiPJQ9IhZyvtpSZUKsacVkOQ77cpju46C4k0sgyHasJCJqjU8XwNGNg9y3N1Vug4dRHSObeC9ZJzMgA64oZpWHzfa2nU1TFwYBP+pw54l8HAyGfbhJxl5MeiAWoFPg6dlw2g5ppZqqoNrSi9H84GdDc/EGyT676KINEl/94P1bRLFKwvAY/huBPD2dyYyKeLpzFNcIS/rO6PTRTvNLhkOznVjJfuI7lmhhoMgOVkTDSqy/KCLxxUsjq5g3Cix+YOr/hPsAokrXa+W6eGDiJ0m4fyCsNmVxBdF8ZWfNpN7w6/SHAHhMWYT8xI9QYmQJLLn2HQ5V+XFkwXmB3TnL8OlcnIjh9bmWYvqcokwsQ1ryXDtN+jjQ9fD+1k/n8L4QNlyiJrovKqjydIK/N2YBqodgfJkWpaNM8WtApmf3eimn8PR/4WBVCPaqIbExg6O/ueejxrWJh+K2tYRCfha4nwohUnlQhbkB51BsEGxvfYcLc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E386B88CDACA547BF5711B5964709FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6596
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42a6296d-d8ff-4fb0-bde7-08dc48ed8ef0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VKTE54e6JZ62d4TwE+JCBpOYs1mn/9HTx8p9cGunpAV4Abznsl103Ar/ibr3LWNb/SUb2PakNzCUL6djsDyZpTzcpo/XKNB+0+5IySHS0aunOOltxmnefxU1dXHdvwx3jjoaniaXg7gmu0W3ycFnmrAEMufhvjCWUPPeO9Hwm1JuOI+RhHL3oR1hTepxch+B8x3BCH75cb5EKBEcMK1kwdwB5ZuR77Zeo5reG/WZVEu2D/xR1Ikb+D3uWh9NgoXOKpJFBrmkTLZ90CuOB1A0+xMDj7c6Bv3MEN6P/wOm/3R2b2OTgp7HvuJtXCjWMQeFFDxIkC/ajf6paEpKKPC5gM16Pw/xD/xmW0mWx6RnMAEqVv7QWDM9KDclKdfcn9GaUcIylacyUaLaVISBWT1Zoug8WnDwncWQoo6yeNk3MU9zLe8BeoKaQjvhEHl3W9SSxCx1XoRQBNETbYjwS+e6nS4E++qsxin0nt1hf/zo8herK3k8LJfLlHcoyGzVl49xxUwsEagT8C6O8i2jhG7+EImhqerEnN2I/AGkDvb4XeDqmQfaoNmPRh/JPV0TQzRSmpfzQHPf9MVWKa1+4lgLFbZRK7IqP+Cm1d9PeR4/8tQ4fRLUjzkGwkW7ONh8Mb7l9mSao7Y+jijGj3u30JpGOHWWs7Mn0VTyeNOcHRI5L270aBEE4MMZ7DKgo6zMEgEIVcS0K2LfyQl4b9e0IpznK2eiPTTpLX2K3+Gr148lVD3AtQyUTG/aAp7A2pLoWpS/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 14:54:05.5689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 164dfd0a-b1cd-4845-bf1b-08dc48ed96ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5428

DQoNCj4gT24gMjAgTWFyIDIwMjQsIGF0IDEwOjU3LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAxMi8wMy8yMDI0IDE0
OjAzLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IFRoZSBmdW5jdGlvbiBmaW5k
X3VuYWxsb2NhdGVkX21lbW9yeSBpcyB1c2luZyB0aGUgc2FtZSBjb2RlIHRvDQo+PiBsb29wIHRo
cm91Z2ggMyBzdHJ1Y3R1cmUgb2YgdGhlIHNhbWUgdHlwZSwgaW4gb3JkZXIgdG8gYXZvaWQNCj4+
IGNvZGUgZHVwbGljYXRpb24sIHJld29yayB0aGUgY29kZSB0byBoYXZlIG9ubHkgb25lIGxvb3Ag
dGhhdA0KPj4gZ29lcyB0aHJvdWdoIGFsbCB0aGUgc3RydWN0dXJlcy4NCj4+IA0KPj4gU2lnbmVk
LW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gLS0tDQo+
PiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCA2MiArKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+PiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNDUg
ZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IGluZGV4IGIyNTRmMjUyZTdj
Yi4uZDBmMmFjNjA2MGViIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IEBAIC04NjksMTIg
Kzg2OSwxNCBAQCBzdGF0aWMgaW50IF9faW5pdCBhZGRfZXh0X3JlZ2lvbnModW5zaWduZWQgbG9u
ZyBzX2dmbiwgdW5zaWduZWQgbG9uZyBlX2dmbiwNCj4+IHN0YXRpYyBpbnQgX19pbml0IGZpbmRf
dW5hbGxvY2F0ZWRfbWVtb3J5KGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbWVtYmFua3Mg
KmV4dF9yZWdpb25zKQ0KPj4gew0KPj4gLSAgICBjb25zdCBzdHJ1Y3QgbWVtYmFua3MgKmtpbmZv
X21lbSA9IGtlcm5lbF9pbmZvX2dldF9tZW0oa2luZm8pOw0KPj4gLSAgICBjb25zdCBzdHJ1Y3Qg
bWVtYmFua3MgKm1lbSA9IGJvb3RpbmZvX2dldF9tZW0oKTsNCj4+IC0gICAgY29uc3Qgc3RydWN0
IG1lbWJhbmtzICpyZXNlcnZlZF9tZW0gPSBib290aW5mb19nZXRfcmVzZXJ2ZWRfbWVtKCk7DQo+
PiArICAgIGNvbnN0IHN0cnVjdCBtZW1iYW5rcyAqbWVtX2JhbmtzW10gPSB7DQo+PiArICAgICAg
ICBib290aW5mb19nZXRfbWVtKCksDQo+PiArICAgICAgICBrZXJuZWxfaW5mb19nZXRfbWVtKGtp
bmZvKSwNCj4+ICsgICAgICAgIGJvb3RpbmZvX2dldF9yZXNlcnZlZF9tZW0oKSwNCj4+ICsgICAg
fTsNCj4+ICAgICBzdHJ1Y3QgcmFuZ2VzZXQgKnVuYWxsb2NfbWVtOw0KPj4gICAgIHBhZGRyX3Qg
c3RhcnQsIGVuZDsNCj4+IC0gICAgdW5zaWduZWQgaW50IGk7DQo+PiArICAgIHVuc2lnbmVkIGlu
dCBpLCBqOw0KPj4gICAgIGludCByZXM7DQo+PiANCj4+ICAgICBkdF9kcHJpbnRrKCJGaW5kIHVu
YWxsb2NhdGVkIG1lbW9yeSBmb3IgZXh0ZW5kZWQgcmVnaW9uc1xuIik7DQo+PiBAQCAtODgzLDUw
ICs4ODUsMjAgQEAgc3RhdGljIGludCBfX2luaXQgZmluZF91bmFsbG9jYXRlZF9tZW1vcnkoY29u
c3Qgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCj4+ICAgICBpZiAoICF1bmFsbG9jX21lbSAp
DQo+PiAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4gDQo+PiAtICAgIC8qIFN0YXJ0IHdpdGgg
YWxsIGF2YWlsYWJsZSBSQU0gKi8NCj4+IC0gICAgZm9yICggaSA9IDA7IGkgPCBtZW0tPm5yX2Jh
bmtzOyBpKysgKQ0KPj4gLSAgICB7DQo+PiAtICAgICAgICBzdGFydCA9IG1lbS0+YmFua1tpXS5z
dGFydDsNCj4+IC0gICAgICAgIGVuZCA9IG1lbS0+YmFua1tpXS5zdGFydCArIG1lbS0+YmFua1tp
XS5zaXplOw0KPj4gLSAgICAgICAgcmVzID0gcmFuZ2VzZXRfYWRkX3JhbmdlKHVuYWxsb2NfbWVt
LCBQRk5fRE9XTihzdGFydCksDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
UEZOX0RPV04oZW5kIC0gMSkpOw0KPj4gLSAgICAgICAgaWYgKCByZXMgKQ0KPj4gLSAgICAgICAg
ew0KPj4gLSAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJGYWlsZWQgdG8gYWRkOiAlIyJQ
UklwYWRkciItPiUjIlBSSXBhZGRyIlxuIiwNCj4+IC0gICAgICAgICAgICAgICAgICAgc3RhcnQs
IGVuZCk7DQo+PiAtICAgICAgICAgICAgZ290byBvdXQ7DQo+PiAtICAgICAgICB9DQo+PiAtICAg
IH0NCj4+IC0NCj4+IC0gICAgLyogUmVtb3ZlIFJBTSBhc3NpZ25lZCB0byBEb20wICovDQo+PiAt
ICAgIGZvciAoIGkgPSAwOyBpIDwga2luZm9fbWVtLT5ucl9iYW5rczsgaSsrICkNCj4+IC0gICAg
ew0KPj4gLSAgICAgICAgc3RhcnQgPSBraW5mb19tZW0tPmJhbmtbaV0uc3RhcnQ7DQo+PiAtICAg
ICAgICBlbmQgPSBraW5mb19tZW0tPmJhbmtbaV0uc3RhcnQgKyBraW5mb19tZW0tPmJhbmtbaV0u
c2l6ZTsNCj4+IC0gICAgICAgIHJlcyA9IHJhbmdlc2V0X3JlbW92ZV9yYW5nZSh1bmFsbG9jX21l
bSwgUEZOX0RPV04oc3RhcnQpLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFBGTl9ET1dOKGVuZCAtIDEpKTsNCj4+IC0gICAgICAgIGlmICggcmVzICkNCj4+ICsgICAg
Zm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG1lbV9iYW5rcyk7IGkrKyApDQo+PiArICAgICAg
ICBmb3IgKCBqID0gMDsgaiA8IG1lbV9iYW5rc1tpXS0+bnJfYmFua3M7IGorKyApDQo+IEl0IG1p
Z2h0IGJlIGEgbWF0dGVyIG9mIHBlcnNvbmFsIG9waW5pb24sIGJ1dCBJIHdvdWxkIGFjdHVhbGx5
IHByZWZlciB0aGUgY3VycmVudCBjb2RlDQo+IHRoYXQgbG9va3Mgc2ltcGxlci9uZWF0ZXIgKHRo
ZSBzdGVwcyBhcmUgY2xlYXIpIHRvIG1lLiBJJ2QgbGlrZSB0byBrbm93IG90aGVyIG1haW50YWlu
ZXJzIG9waW5pb24uDQoNCk9rLCBJ4oCZbGwgd2FpdCB0aGUgb3RoZXIgbWFpbnRhaW5lcnMgdGhl
biwgSeKAmW0gZ29pbmcgdG8gdXNlIHRoaXMgY29uc3RydWN0IGluIG90aGVyIHBhcnQNCm9mIHRo
ZSBjb2RlIHRvIHNpbXBsaWZ5IGFuZCByZW1vdmUgZHVwbGljYXRpb24gc28gaXQgd291bGQgYmUg
aW1wb3J0YW50IHRvIGtub3cgaWYNCkl04oCZcyBkZXNpcmFibGUgb3Igbm90Lg0KDQpNYXliZSB5
b3VyIG9waW5pb24gY291bGQgY2hhbmdlIHdpdGggYSBwcm9wZXIgY29tbWVudCBvbiB0b3Agb2Yg
dGhlIHN0cnVjdHVyZSBhbmQgdGhlIGxvb3AsDQpsaXN0aW5nIHRoZSBvcGVyYXRpb24gcGVyZm9y
bWVkIGluIG9yZGVyPw0KDQoxKSBTdGFydCB3aXRoIGFsbCBhdmFpbGFibGUgUkFNDQoyKSBSZW1v
dmUgUkFNIGFzc2lnbmVkIHRvIERvbTANCjMpIFJlbW92ZSByZXNlcnZlZCBtZW0NCjxsYXRlcj4N
CjQpIFJlbW92ZSBzdGF0aWMgc2hhcmVkIG1lbW9yeSByZWdpb25zDQoNCkNoZWVycywNCkx1Y2EN
Cg0KDQo+IA0KPiB+TWljaGFsDQoNCg==

