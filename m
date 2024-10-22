Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ED79A9F61
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 11:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824076.1238167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Bcq-000207-Ci; Tue, 22 Oct 2024 09:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824076.1238167; Tue, 22 Oct 2024 09:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Bcq-0001x0-9u; Tue, 22 Oct 2024 09:56:28 +0000
Received: by outflank-mailman (input) for mailman id 824076;
 Tue, 22 Oct 2024 09:56:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tTvi=RS=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t3Bco-0001vb-UM
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 09:56:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2614::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e63dc665-905b-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 11:56:25 +0200 (CEST)
Received: from AS4P192CA0038.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::7)
 by VI1PR08MB9960.eurprd08.prod.outlook.com (2603:10a6:800:1c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 09:56:20 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::34) by AS4P192CA0038.outlook.office365.com
 (2603:10a6:20b:658::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Tue, 22 Oct 2024 09:56:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Tue, 22 Oct 2024 09:56:19 +0000
Received: ("Tessian outbound de6fe3af73ff:v473");
 Tue, 22 Oct 2024 09:56:19 +0000
Received: from L152ac9f6f7fb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2CFDF8F6-AA1E-4DE8-8CC5-082D9ACD2265.1; 
 Tue, 22 Oct 2024 09:56:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L152ac9f6f7fb.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Oct 2024 09:56:08 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB8PR08MB5356.eurprd08.prod.outlook.com (2603:10a6:10:f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Tue, 22 Oct
 2024 09:56:06 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 09:56:06 +0000
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
X-Inumbo-ID: e63dc665-905b-11ef-a0be-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Jv8SlrmUKHtaHUxe0C5oeJ2EwcP6N35MqeLddeicsKVzg+9eicIsDyqg/1lKWNAEY/mEPwo0kEMPyXp2Ppe8D6mAZy9bmGCrwlMKXSgeYVP433eZPYUxwY5IY9cUYaHBhd8HHCQOiwa6T416LI5bH3StCtR2e/YxvZgQY4TMLNIjmRBP4uBOeOrcuVt6UUwO+3FJZQW5vwgaMHt5CaKdOeHXq1e0EU/6tYdHq3QY3EJ26KGZVfUSRCLIgFlp6Jc1zfmoeDMuXfoqSh9/X2sdLfwRmGQuIWMn94LD9lU42xPfnpRz0+ODyOqyIehzoz5Ib2xeD/9p2Yb0zASde1iILg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/jkBc+Jo2chXmFr1nPWkw0pkZ25zz2KFn/IsMUEgcU=;
 b=RkVxq2s0zHRRBraQtklYmBBh/8smoUEbyj2dSKN2GdCQKxUJJIih+BdrIPnbGob0MG2txxH5O6p7Dv1bAUh1QPYKwUe/ID/thZP+TuGbEOgYWpaxr42KHkQcUhx1LJFdh3n7bUJZocFjfNGgo5Wm3DU3Q9GwL31lHhzIP1G65x4Fs/nr2XqlLnyG45T4UzOC3jLSruVLbVlg280RPgpPT9JVJ9/5AOxAJVIbLqj/AX+bMp8NoiGszZGZLVaMmFNZVYR0w5Cy0fPnnXM/6+h8S80Zy9d0fQ1iLl+pVGdzZoIV7aunPgFCOfqSmCWGhfaEuVeAZXcyW3A9tNS8FMar6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/jkBc+Jo2chXmFr1nPWkw0pkZ25zz2KFn/IsMUEgcU=;
 b=STOjpeE3yY3pOs5dBY7Q9Doc0CQpPOV4PuAXmAjIA+4JuPra5hu2Gvj1fWfU2okC9IElPQq7TCtnpLgSi9upULqcMD8OkqZFCIhh9/ONc9iOcJsuXGnxjI0QZCWjDsz3RtAq4FSnJfeGxUzqMqVEvANSxiAmFaDNhBM0Q+fN/P4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d3841bc22a130d2f
X-TessianGatewayMetadata: OHlhpz3N40fHIfZxRGbh4xQ0cWu7owc1xCn9ukgSYZFb8/MZeD/05l280qQAZNQHIZLZrO3BjF0JhS7JUoqXZ9m00mdcROaIn1ribNsPNIvDEOS1YbO2YXGqvxCWn3g2RLsZ1SpM9KZFXCLAQWCpBIQiJ4rcucOTVap1lbXfIAc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYLWpNZSo9jBXNWlGrwtmB4r55sERdSzdZwluTRMuqiOTei7s0lhd+UcIjgVQQd5kzgoZiFB6OVAj/jCtPN7Mao0u0ULcpvvo1DlzrLuWJh28OpdSiQidGb0bzJ+ibV/+OdCB26X2hCSbxheSSaD/LekP/an9Xgye0wJDZu1QVPFYXYuLewNJ7P8G5RNKSwuQXuBh8mguveXc9pzI8WKXMBKg/iNz+7pNKGSoojTNQ4n7l8WonZcFGuih+XPzNS8uMsP9j+cwGcJUV4cnmvS6Zqad1z/6PjQ2vCBy5q3FmbmijKmgt2QI229V7Iubm+LyIHUaShdO35YOHzO/RNG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/jkBc+Jo2chXmFr1nPWkw0pkZ25zz2KFn/IsMUEgcU=;
 b=tAXc7WPbEIqBnMi/9/yObplAGwrqiPgXQZ6wvTw+QRHoY4emqgXkhOFTkciEPnZyQMHCxu+q2OHP0G+oNTCMPxUXQPMG+crdbVBadqh8aH986aXZy27GthORPzKztwVaW4jdHieo73cnCkTEhfaqVoFV5eaSx3vcWjhQZhw+oLSNMivUFVGJQPpS8AYsZavh0M6HLSnTQxRIJm9gFuqekzSxiZKUHPakUKZgPH9J1EmwUAlPdO9TKRBZ50DpXTEKW48VgqmocVKESbaDcn1CxwKqMblE8Tnt6vU1FM1GE/JJZtQ2lcKanHLR35fY4V90LK1pGJH1Deupa8bUxd1ZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/jkBc+Jo2chXmFr1nPWkw0pkZ25zz2KFn/IsMUEgcU=;
 b=STOjpeE3yY3pOs5dBY7Q9Doc0CQpPOV4PuAXmAjIA+4JuPra5hu2Gvj1fWfU2okC9IElPQq7TCtnpLgSi9upULqcMD8OkqZFCIhh9/ONc9iOcJsuXGnxjI0QZCWjDsz3RtAq4FSnJfeGxUzqMqVEvANSxiAmFaDNhBM0Q+fN/P4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Topic: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Index:
 AQHbGx2Ge9N55hTx/U2iD9lYiTVQprKNIysAgARC6gCAAA8agIAAAOKAgAEgqoCAAAHOgIAAAmiA
Date: Tue, 22 Oct 2024 09:56:06 +0000
Message-ID: <61C13F4F-24D2-4B6D-9216-813EDEED4865@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
 <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
 <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
 <A302D615-E25E-46DE-A4CA-4FF911293D83@arm.com>
 <d1e8decf-3c63-41fe-a6e3-f880b984dda4@xen.org>
In-Reply-To: <d1e8decf-3c63-41fe-a6e3-f880b984dda4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB8PR08MB5356:EE_|AM3PEPF00009B9C:EE_|VI1PR08MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8c2873-9149-4a97-ebdd-08dcf27fc754
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d1RtOFBVSzFpbkxoS3MweFQvTDNwdHNLWmNwS21WcCt1RzBjbmlldDV4NlQv?=
 =?utf-8?B?elRHL3NQL29OVStSWHdPeU5Td3FoRDVkVG5kVjRlbVg1QVFOK0dodklIWjVn?=
 =?utf-8?B?Vk1qVndic1U5d3J2RUtTckdhSmdXZStTbHk5MzRZMVU3MWp1eVpldlJ6Z1hU?=
 =?utf-8?B?NFNMWlZTL3hpSUpuSG9ZU2dmUEFVcXZrNXE0NU5SaWgzN1dGcEQyZm4rRExX?=
 =?utf-8?B?bEJaRzVLV2ZaQ2tpL0Z1bUw2RWgxVUV5ZTZRM2FaNHlsRUlOdHNBVlpRQUZW?=
 =?utf-8?B?RHNuNU5CY1pTc0F1MEgvYXR3L01CWmtKc3czNnpGYVVZOFVUbXkxOFNkNzhq?=
 =?utf-8?B?RytRdnIzR2VnNmV2MmxOSy93cGJhbndWOER3QW94VGhVa1lybThKY1d3RXVh?=
 =?utf-8?B?bHpyZHNLQUt4eXhSdEk4THNZL05wWUJpZUFMTnl2TWU1TGRWcmt2eGFwQ0Yx?=
 =?utf-8?B?S0ZKaE5GRkxQdzF5TU1MbnA0TVhXZFg5dVJKSnladjhJRjZDTUJKNk11SEtk?=
 =?utf-8?B?WXlKNm1rdDJrWUVRanZFdVM2aVJUV0J4cHNIQ0FSdHB1MFQrS1UzNktVS0FF?=
 =?utf-8?B?Y0FyNlJqVnltT3gvUEwydW9RWk0yMDVuNEl0bnFLQlVwUDhEZWpTVk1UclNR?=
 =?utf-8?B?a3FpUnZmZDkyWUNnVUhDbHgwUjNGSUlPdE5Mc3VCYkp1aGpXNVdUTVduZ0RL?=
 =?utf-8?B?c2taK3lwM1U0bXk3aXMyTjkyek9jS2NvU0h0cFJiUkxkSVdQVEFwenhRZmpT?=
 =?utf-8?B?SmZlaDlDNW9vQ2h6L0g1dmxpaU5iaVlYaWJtaSt1L1FtRTlqYkkyaGxmdlFT?=
 =?utf-8?B?alhXTkNsWTh6Q0FYR3h1VURkczM5RHpUYWtQeVpkZHhpQVJIeEFrdU5pUnR4?=
 =?utf-8?B?RXpTcTM1c3JPK2k5K3RqK01ZTzl4NUNaT2ZkSGlTS0pqbUdYb1paMnF4Q1Zx?=
 =?utf-8?B?Wk1UQVc5cFV4aU5UY3BWL2E4QjZTVXM5TXRyV2kxNXRHUWw0emdkdFR0WTBm?=
 =?utf-8?B?d0d3YUt2NkVNbllYclhDN2RYVnFRTVcwZlFleXg1elRySVppeXJ3YkczOTY0?=
 =?utf-8?B?TU1KTHZyWG53SVU3K0tqNDlSV21nanZCdWN4RGdBN00xc3RvMC94OTZBSDIr?=
 =?utf-8?B?SGgxbmp3UkdzWUp6TitxZjNNTFBiV1pJTWpVQnRRKzdaNWp2N2I3SGRmRUNa?=
 =?utf-8?B?TnhOVTc0aHFBRTVHeUkvcnFucHpFMmd3L1J1NkV2UDFCK25DalJTVjA4amtr?=
 =?utf-8?B?VVNSRE1BN25XZzM3THNkVTgrU0wveGtDa3cwNG0vQ2trbk9BY0Q3eUlEc3JU?=
 =?utf-8?B?OWVuTTJMUkwwZk1HTGd4RzVMTU9oVklaR2FXVVRvOGkwZ2RYaU9SMXhsWlY5?=
 =?utf-8?B?aUc2clJDMTlGYVlxOVBGdlJSYVdkbUZvcUhZaFVIUHY2K2toU2M2anZ5QWNP?=
 =?utf-8?B?MVJ1a1JvVnVTVEJsay8rZ245TksyZHB5UVZUNGZWQm1hemlLZitUV1NIalhU?=
 =?utf-8?B?N2toWVAzTzVHSmFBcDc1Y2x6ejBFMjBDTGZYa3JNY2Y3bnBiNGM4RzFFakJo?=
 =?utf-8?B?b01HZ1JKMXowdDNKdVVVTUkxWUxZemZ0L1poVnp1U0k0cUkvMkpWY05TYjE0?=
 =?utf-8?B?eVFrYWU1NU1Ob21LdFcxc0VNOWJQUitBT3hjMUIvb2VSYk9CVWs1Tldjd1RX?=
 =?utf-8?B?bmxGSGlpb0FpcS9Td3dSQWNBVVFEWFhVd0lpbHovNko3TTR0QWtPbzZ3SVFV?=
 =?utf-8?B?YW9Yd0Exa3Y3NUZOODZUUTc3MS9tZFpyY0V3SWtVaU9iR2tEWjlhVUQwZ2cz?=
 =?utf-8?Q?1chbk/GdU4RuQMPmOOyNrBEhOQ3+YWjXhAO4k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EF7253A325F8E459ECE333F19DE48DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5356
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ed4f7fc2-d54e-488d-fbc3-08dcf27fbf2e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REg0NTJ3VFQ1QW5TK2k3N1ByYmd5TFg1S1B1MUNCVnFPYzJINHdqZmpNRVJo?=
 =?utf-8?B?SzFrV0lIdkF5WS9hUjFRVDVXMDFwaGM2ZE4yZHNFd0VlY2RwMjUrZkpWdGhO?=
 =?utf-8?B?TmFob3lEcVNtcEt2c1NJa0pBZ1YyWnBGNHJsVzFTQllmSHBmbFNpRWVYOTBz?=
 =?utf-8?B?NHZiOW9BcFBYWk5ydmJaNG80akNTenBsQzUrTmNSMWUzRlpXeDg4V0dONndl?=
 =?utf-8?B?NkplUUxUWVRhWlBqL1NmMWVUTU1nNXZ3bTJlNDY4ZXo4ZkdQUURvbzd0cFhN?=
 =?utf-8?B?SGdXYWloSzJEdVRXVG5XRW5OemJ5TFd5YWxWdFo1SGt6YlVpNEoyY1Y0QVZJ?=
 =?utf-8?B?RFlzTnQ2WUMzcGtjYXJ1R3hibTNSSytFd2QxNVFVcGQ3YU1FbDJVMmJhRW9O?=
 =?utf-8?B?TE9STHZ5MVA3eGpBMXovV0RKd2NyMDM3RlVmNEIvaDhqTklxUzgwc3NpUXd5?=
 =?utf-8?B?RmpHeEw4alc4TnNCOGppMnpSZitVaGFWeENUM1E1N0pOVnFoZEk2bmlsQVYr?=
 =?utf-8?B?U3B5UXU2SW45QTJvaXo4NTFNRnc5SlFZR25XUm1TZTl1a1R2RWJFQWFDNCtF?=
 =?utf-8?B?b2xmbG9NMi8xcWNLdFV0YmZpNSsvLzBuaVJSZ0VLVHkyN3ZCZHhCQ0tlYWd2?=
 =?utf-8?B?WEQ4Mkh2cFVtSFo0NXE3Nm9Pdk1iMDE3RHZWbFpQcHBQeDBYRlFYQjdJQXA1?=
 =?utf-8?B?OU5GSmxuU3E3b2RpakpQUjFSbG5WTFNIN0VqdHdiMEtoZGNpeVlJWWtGTXpp?=
 =?utf-8?B?ZHJKOHBtcUVGU0JUdENjVnFCVExScWFvUlM2eE8xU1kxK285bnZkUmQxaWs1?=
 =?utf-8?B?Z1J2ekJhNEZLcU0ySG9admwxQUlmTlpBNVVVOW1ZdDNNek4rdlRaNXZNY1BM?=
 =?utf-8?B?TCtiOFFKWExjdDJxY0xoeUpuelVIaHp5OFFzbXIxNmEvZk43WHVhQ29jNlNz?=
 =?utf-8?B?dTdjVDdBN2pucmpOTlpxNnNDUlMxcjU5cHJuR1cwcDVqUk5NejFrY3lBcUxI?=
 =?utf-8?B?UVZIc01PR3FyUkJVbGoxQUF2UDI4TERyWXMrd2pSRTBJRis5N0VjaGNlSWh2?=
 =?utf-8?B?anZMMnE4QzQ0NTlWRUt2NWVLZ24yOXEvL0p2Y0lhVEpZS0lqUUJpK0xEMlpQ?=
 =?utf-8?B?N3FFVHhCcDdoTEwrb3hLL3RSN2xJWnc4dXNpbElod1hJbm5kZVdMNDZtQWZH?=
 =?utf-8?B?WnJXRDNSZXVQK3QvYTRvcExNd1BmK2tTTGgwV3A1K0NVZ01CN1pzcDNqUnFO?=
 =?utf-8?B?a21FYjJYb3RrdG9sRkRkb3VwYkZHU0RuNWIwMEJ0STZLb210bWVpMlcvSHpo?=
 =?utf-8?B?UjBNNUxRSFJYR2haR2ZJT3I5NmF2MUdIZW44T0thZ3VJbHgzT1I0blkyMjdB?=
 =?utf-8?B?TWRDODZMdlpiSTdoV015RFZOV2NPOVJBTVh3c3owTUN3RjVnd3R1bUJXeHN4?=
 =?utf-8?B?S0o5dFNVNE5hMERZTjlHSWtYWmt4WStOb1VYaGhGSmRjRGpiUzkvallyVUZN?=
 =?utf-8?B?SDRKaEpPUHhmdzFmOW1wdWhXVVc2K0ZOTUZST1hVeXJsT2xYZlhNNFR5Vzcx?=
 =?utf-8?B?ang2UXJtK0tiUEFtUlBUc0wzdkszckxsZVd6dHFINEFKTzhlVWRYTE9XbTd1?=
 =?utf-8?B?UjVvS3A0WStQSkM2MXpaMjRFbVFPUkRCRUZURTAvcVFqS3g3MmxIYUdrMlcz?=
 =?utf-8?B?NytISmk3a202dDBxRDRWdm9VTTNpZkd6ODI1czZVL2t0bGI0bDNuYmphQ01P?=
 =?utf-8?B?VEZkamk4N3lUSWR2QnFhS2xUK1ZwN2p4ZVpuMWxaUnJ4Nzg1ODBNUS94U2dq?=
 =?utf-8?B?ZzZDbktPamRiL25yQk14VG5xakk5SGV3bERGVit5QndHeDNRVFlMcjVSdUJj?=
 =?utf-8?B?amtaYnZEc1RMRGV0V1Nna1lTRkpEcDVBZi96bXAwV0lLMXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 09:56:19.8298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8c2873-9149-4a97-ebdd-08dcf27fc754
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9960

DQoNCj4gT24gMjIgT2N0IDIwMjQsIGF0IDEwOjQ3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyMi8xMC8yMDI0IDEwOjQxLCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDIxIE9jdCAyMDI0LCBhdCAxNzoyNywgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+PiAyKSBkc2IraXNiIGJhcnJpZXIgYWZ0
ZXIgZW5hYmxpbmcgdGhlIE1QVSwgc2luY2Ugd2UgYXJlIGVuYWJsaW5nIHRoZSBNUFUgYnV0IGFs
c28gYmVjYXVzZSB3ZSBhcmUgZGlzYWJsaW5nIHRoZSBiYWNrZ3JvdW5kIHJlZ2lvbg0KPiANCj4g
VEJILCBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBvbmUuIFdoeSB3b3VsZCBkaXNhYmxpbmcgdGhl
IGJhY2tncm91bmQgcmVnaW9uIHJlcXVpcmVzIGEgZHNiICsgaXNiPyBEbyB5b3UgaGF2ZSBhbnkg
cG9pbnRlciBpbiB0aGUgQXJtdjgtUiBzcGVjaWZpY2F0aW9uPw0KDQpJ4oCZbSBhZnJhaWQgdGhp
cyBpcyBvbmx5IG15IGRlZHVjdGlvbiwgU2VjdGlvbiBDMS40IG9mIHRoZSBBcm3CriBBcmNoaXRl
Y3R1cmUgUmVmZXJlbmNlIE1hbnVhbCBTdXBwbGVtZW50IEFybXY4LCBmb3IgUi1wcm9maWxlIEFB
cmNoNjQgYXJjaGl0ZWN0dXJlLA0KKERESSAwNjAwQi5hKSBleHBsYWlucyB3aGF0IGlzIHRoZSBi
YWNrZ3JvdW5kIHJlZ2lvbiwgaXQgc2F5cyBpdCBpbXBsZW1lbnRzIHBoeXNpY2FsIGFkZHJlc3Mg
cmFuZ2UocyksIHNvIHdoZW4gd2UgZGlzYWJsZSBpdCwgd2Ugd291bGQgbGlrZSBhbnkgZGF0YQ0K
YWNjZXNzIHRvIGNvbXBsZXRlIGJlZm9yZSBjaGFuZ2luZyB0aGlzIGltcGxlbWVudGF0aW9uIGRl
ZmluZWQgcmFuZ2Ugd2l0aCB0aGUgcmFuZ2VzIGRlZmluZWQgYnkgdXMgdHdlYWtpbmcgUFJCQVIv
UFJMQVIsIGFtIEkgcmlnaHQ/DQoNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGll
biBHcmFsbA0KPiANCg0K

