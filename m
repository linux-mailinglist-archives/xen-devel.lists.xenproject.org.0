Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE9A60B61
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913977.1319831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0OB-00075W-7o; Fri, 14 Mar 2025 08:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913977.1319831; Fri, 14 Mar 2025 08:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0OB-00071r-4j; Fri, 14 Mar 2025 08:27:31 +0000
Received: by outflank-mailman (input) for mailman id 913977;
 Fri, 14 Mar 2025 08:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rUO=WB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tt0O9-0006mw-Os
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:27:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2614::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29b74fb5-00ae-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:27:27 +0100 (CET)
Received: from DUZPR01CA0233.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::17) by AS8PR08MB8159.eurprd08.prod.outlook.com
 (2603:10a6:20b:560::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 08:27:20 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::94) by DUZPR01CA0233.outlook.office365.com
 (2603:10a6:10:4b4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.26 via Frontend Transport; Fri,
 14 Mar 2025 08:27:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 14 Mar 2025 08:27:20 +0000
Received: ("Tessian outbound 95d47b41fce3:v594");
 Fri, 14 Mar 2025 08:27:20 +0000
Received: from Le9e6fd9eb1b6.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 726D8B83-5D8A-437A-8FDF-CF118FF957EE.1; 
 Fri, 14 Mar 2025 08:27:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le9e6fd9eb1b6.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 14 Mar 2025 08:27:13 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AM7PR08MB5301.eurprd08.prod.outlook.com (2603:10a6:20b:dd::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.29; Fri, 14 Mar 2025 08:27:11 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 08:27:10 +0000
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
X-Inumbo-ID: 29b74fb5-00ae-11f0-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CRK+dIIVJnTnZMjWbZi8KsrMJ8eAWLqQEULchVh+Ux1UpL1KWH0/4+3W4igTF5VteWrTY0NNNmXWhLcviqsQG/z3x0Q2PR/jOJoU8yfNLH18SDbEAtcsJLYOhFIPVhm2wAdewdg3thVI4rgia6czUpSa/08IfI3hFHuKIUgjP+GoB87tLPq0HvFOezERdMT/v520uzRP2WX58tobZ1lMg+bhkQPfwVgqedaToZFA8AJr6Jm2M74/ABgH1Xidv9LbWdm/PKPfmYK9aiiXZwVc3r9QWrs3MSS1LYKwRMJZviPvLg9TGXinQo4iUxX6Hf2UaFXmXoGHPULb7KrBsGzFSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf6C5LUM5AhF5N6Zlr7dgntyiIXIYkTyZEsKBVV+EXc=;
 b=lXuT5BunaO3DfhfExXRVm93gCncUXNgiQ1zXezMbDG4xjeMUNCiXlK840Nsdb9N3ghTMQQ5S98hx7zI/brhfD5vjSXW6CSJMNNoBLrteBuevq2lTMzOX9IUrzA/TO6Tj3h/CSUkajhnAiGOV1PBDyyxdjqC75cDjkmGl09g4DiTFzl531+zPHHzuQ5nGbuNe0gtgLk17DlaETPwoAuDQHmJrYJCRQgt9ZPG1DjJe/L2Mkczgwy9c2z0zpxoWs08XiitdWEG5sbA181EJ3RP76OUsUO8bNp+IEYF9oHEvSZqe3bG43Dx1olsxpNAizae86s2QEjTIto/Q9ysn69UeOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf6C5LUM5AhF5N6Zlr7dgntyiIXIYkTyZEsKBVV+EXc=;
 b=LTArY9xRqHjx3gybijKnEsg8U+b71bckMr3UxKY8z6M+sAGgDUjHQiaAUkOuPo8PvejdnoQ5sfNmiTaz2gdsXP5qosccnn/9sJuuFQvZXVBSe04M90rS9QFiyL+P8Ns2Nau79nCPWNaoiupXlILK45IaK4JEvniv4XkX5D7np1Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87f3d024242bf396
X-TessianGatewayMetadata: yGe8fN2pg/Faol3oMRXMXF4bWwRjHUD+3xwgmxpCEP2EuyOPD2UpflIh8/9HWuco9qMMcpGYYLdHQc/Oy6f1YVsWKfC4UHEYSJRp+ucM4hL+FtHReCI13iq+jciU06Eh1y4d4iMS6u7UzVl0QDq/r8Spfht5EOW7qFJDd9reU38=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F37NvkejXVU3J09HjF5pQzyA4K/1ZogdUlyDSC2RuIz5710Iyw8s0SLJoX0CX5Q27NcIAuQ49n4CgJHvBfMVbv6WVNw59Or/okGjClV2vCMmFdKkub8G17FtF99G8agx4LCysLEGUe4pLrrs30N//1toE7KqCkAbnBouvEMXOKfof9LMtWMo8Earj3glNrZjMYkGO96SfAWT8dmf2bsPDKSVn0s5wdoaLQH989d10WytmdyUhSVz9oC3ToKQiH8GTIZPCxLkC0kRb5iXqaPXkP999A9sVVSO1gHB/2b7Hvt+23Ccq7glVt1Yi5sqZIpnxJ7oMWz37K6gjpaiiI6Elw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf6C5LUM5AhF5N6Zlr7dgntyiIXIYkTyZEsKBVV+EXc=;
 b=txKGBJFTsP0fTYkY3SS7sRsHU8c3Sv6zEeEUKL3jeqS9u3X/YHAiv8AeNQA3guU+0TqTQuGksZbW3misNW7RMd/oc5MZVEXa7lML66/5H84ANnGi2fWCakB0vSln4p+4jkj9kX5nSZjbqgb+KDMyGzQ//ivSIrwoS8zFDejYHyyljwHbity7qg5XbmvUvbOllYEHlygPk6d8xGmLW3qajqyjjhON3SI8IX+1KWx8HOe6ntnMmga/bDXDrlSa/uvMUw+5g2ulWkywJVd/IFuyN73fCoatdvEvlms7OGXOcif1pMN7+q1cywGX1Rt5UgneC7Mm+7xrgLkCQWEVVp8bgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf6C5LUM5AhF5N6Zlr7dgntyiIXIYkTyZEsKBVV+EXc=;
 b=LTArY9xRqHjx3gybijKnEsg8U+b71bckMr3UxKY8z6M+sAGgDUjHQiaAUkOuPo8PvejdnoQ5sfNmiTaz2gdsXP5qosccnn/9sJuuFQvZXVBSe04M90rS9QFiyL+P8Ns2Nau79nCPWNaoiupXlILK45IaK4JEvniv4XkX5D7np1Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 09/10] xen/arm: introduce Kconfig HAS_PAGING_MEMPOOL
Thread-Topic: [PATCH 09/10] xen/arm: introduce Kconfig HAS_PAGING_MEMPOOL
Thread-Index: AQHblLbwv7MiSBrO3UKxZwO6qqNV+LNyTDAA
Date: Fri, 14 Mar 2025 08:27:10 +0000
Message-ID: <1BC877F2-9446-4E20-B34E-B2D36563A0BD@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-10-luca.fancellu@arm.com>
 <17d30bf5-90bc-408b-b39f-c1d41c73e68e@amd.com>
In-Reply-To: <17d30bf5-90bc-408b-b39f-c1d41c73e68e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AM7PR08MB5301:EE_|DB3PEPF0000885A:EE_|AS8PR08MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 314c6bc4-1346-429d-e483-08dd62d209bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?S0M0b2RJTldkVjNSZ0lOQ1lMMGxlMmhFeHkvN081Ums2QVNFTW53QnF0cmRt?=
 =?utf-8?B?TE1yV3lvZzlpY0ZXQ1ZyZ3oxMDVVdlUzTkZjaUNqOGdUa0NYQXNrQmxwdzFX?=
 =?utf-8?B?emJSaFhBYng0Z25PcnZpaVF2c3d6R2h2N2xaWURhUHZaZUZuTlVheDJmcEU2?=
 =?utf-8?B?TGpMNXBFeThTR0NLMFZGRVd5V2Fla3NOTzBVRmxESnc5RjloYXp2aXhjdHNJ?=
 =?utf-8?B?M1lHQzRLclg0SmlNdU05T2VTemdNZDl4RWxtbG5ROHpHd1R0L3FtMENobkdo?=
 =?utf-8?B?RlpWdHVSci8yQnZTOGdMZmEwOG5lZk5mbnhMMWVidi8rYTV0Vm9hTXF1blBy?=
 =?utf-8?B?MHRseHdBcU1rQjdSV056b2dlKzY1VUxWMW8xTVBjUW9wSk5zblVUWE5WUzRU?=
 =?utf-8?B?QTREajIvN0RHYlRmazhXVC8xbHBkU3ozUWQ4TkFTcnFTQmpPT2Q3b3BQLzBO?=
 =?utf-8?B?Ukx3QXhVdzlSUjJzVlNKVGlqbVZBelQxaWdhTW9CVW9BVFN1WFlDUlVqM2g3?=
 =?utf-8?B?V2JNWEJmL1FLMFo1UWdLTUt5Qm1oWEE5N1NidXA2Q1RrZ3pJREg0dE1vL25z?=
 =?utf-8?B?Y2ZtRDVncFVhYUlOTytmZm5PaW5RRmtEMTlleGJCa0NvMzJSM3FtL20wbXg3?=
 =?utf-8?B?WTlOQm05WnA1SmpQeDdlYzhqTE1DZ3IzRytFMkJHQ1Z3U2hBTjNYeWlyay9F?=
 =?utf-8?B?eGs0azlFM0xOanU2Z1RMT09DUUdZY0t0R0x5MTV2aG42ZTNzZ2ZTTHlyM0lV?=
 =?utf-8?B?SlFGRnZmYTA1d2NjaXVISy9vYnF2YUFOY1ZLMkRHSHNpYWZDaGpwVDdWOHZn?=
 =?utf-8?B?Vk45dkNqenZyMko3cjFLNUdBakNWeEZDM1ZvNm5KMDhLOEI2U2lFVUtUdDk4?=
 =?utf-8?B?bVFSZGhHeXZ6M2VxZVF0OTQ4ZEliL2xkbWt5ZFVXRGpScWlzdDhWaE5aNWpN?=
 =?utf-8?B?dE0zNnNvTEg3aDRSYUJ4L3IxZDF2S21GclBjeVp3VFM3TTFyNkpkWUFPWVpO?=
 =?utf-8?B?cU5KeHNBYXR6YW1OODRBb2xrOU02WmJvN1hIWFJMME84UC82eWQ1aVB5K2p2?=
 =?utf-8?B?MmdZOFJnSFhUQnBJMXA3SUdJWHZmc0RwSGNrSDFUN3NXYWZwZWVuMUdTdFhu?=
 =?utf-8?B?VHRONGErcXZwZjVHaGxTNXJpR2tOMU44aVFUa0R4Y3hYenE2bS9ORTJ4bk5Q?=
 =?utf-8?B?VWtsVS9hNnNzcW0wNkRJVWlURkNFN3pqKzE2UnhXbmxIYjZoU0drMk5wK2N4?=
 =?utf-8?B?QzdTa3U3VDBvOXdncHhTREtFTnRtRDNtaWJwcUEzTWF0WmZIcWZpd2htYm5j?=
 =?utf-8?B?NXdLc2c5ZXVheE1DYldSbk5EdWNzeDV4RjcwWGh6M0pLYW1PeE5kcGxyalRN?=
 =?utf-8?B?TXpsU3V4R21vZTllL1pWZ2gyWVpxUTM1YmF3aFdsMWlBZzZZZXQrcVUyNy9w?=
 =?utf-8?B?WnhYVUtiYTVkdDJqekxIc0NCTTVGWUZRb1ZmYTZSVUtseDl5Zk1DaWxsR1I2?=
 =?utf-8?B?NHhkTE9ySmd2OXd0MG53dEtTdWFNLzI2QkgwcXJObE53ZjVlTWxEUXl3cGox?=
 =?utf-8?B?Sko1ZGRyQjMrRlFWQnJrbE1QSFhvSmhSUVZkT3FLczNraVJyRjR3MnA1aC9L?=
 =?utf-8?B?U1JteWpXN290SE5CaklSSkhubUNDQ1U1NXdrUUVQV015NWRjcmJiQTIrM05o?=
 =?utf-8?B?OFVTWEJ4T0NOa044ZE5yM2JYK3RZZ3g4SGdpR0U1a3hObzRtd0hGQjZqQ2JP?=
 =?utf-8?B?VFhBdWhsVnFPZlk5WU8vQUE0bkw1c05NaGIwVEF1TFNtbG93MlQ4cjQzVVBh?=
 =?utf-8?B?SThNTEx2TDNYMEg5Y3pjeC8zKzdxeXpXcHJWbituZ1lGVWlsb0NLalczMW45?=
 =?utf-8?B?dTVRREp4RUc1NzcxdUJ1aTg1YkRUdVA5M3FkNGhjMDFZdjBIQm0wTUlOMUNm?=
 =?utf-8?Q?VpmFF1go7PYo2dzgqkLjfsDBCj/+LvUq?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <989398F7FC6F9946AA029314784C047C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5301
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f108cc63-334a-4534-69bc-08dd62d203e5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDEzekIrSDZmc2s1bkRBVEpwYk00eDYwQ0hNRFNGWGwyVFBRN3hjbng5Y09W?=
 =?utf-8?B?NkFDNG1GeUY2YVdxT2drYkQ5Ti96aDdLRVFoTUYvNWhCME5QSjRxR3NwaWl4?=
 =?utf-8?B?b0dhQ0ZtaG9IYTlMakFocG9sSitNL3J5bzFtSW5Ed2dUVUEyZ1VPY2JYYTZC?=
 =?utf-8?B?YURROUk2SWpJUlhPd2ZCOHFHTGY2UkROQlMwaG5ueXlMaGk2SlNnL3g5T0Va?=
 =?utf-8?B?VmdzUG9iZ1J5M2l0MUw4Q0ZFaW1jUklJKzVqWEhUZndqY3p6aElaa3IwWWF3?=
 =?utf-8?B?TVZRZDJZU2JlSzZMWEQwWWxIMjZ1KytyT01OZVZjM2Q5VmF0OFEraTJnRjdU?=
 =?utf-8?B?QXRWMXdVWU9WejZUWnF2ZkNrK3kwZ3JtWFNueGpUMkpJVVN1TG5ieHBYVzdU?=
 =?utf-8?B?dUpDYXpsK3RsMU1lQXQxelVyRDJrQk1zaVloblBoWDdMeWtEMHU4dGhxTCsr?=
 =?utf-8?B?anQvV3o1S3dhT0hIc2F5MWVxNHM1SkJMZGQwQW5GL3Z1Mko1OFBRazJ5Sm8y?=
 =?utf-8?B?SmpkckVyeFRuMW5IYk51VWJVZ0dxWFo5bVBuYXEvdjZNTVh5SStnQkVveUJn?=
 =?utf-8?B?Z2lvUytRbm9Ja1Q0NFgvQi9DQ1ZKRE53bWszT0N2M2xwUTlPSDlodU9rTStW?=
 =?utf-8?B?U1RuaVVjQWUvSE9pdFl3Y0tWaHRYY2t1NzN1MVVseEk5VVBacEpQSjhqWU5H?=
 =?utf-8?B?VGJtTGROTzZkNERlVVJMODBPci9JaThZN1NUWlFDTitSNHdPWWJVNUdTakVW?=
 =?utf-8?B?b0ZWQ2RxcWZ2RnMwaUZFWUpPVXJwRUJ3MTdLNWkxaXhsRHRFTHJMK0Z2bkVW?=
 =?utf-8?B?TDByKzBtcDEwQ29zNlUvNWhvV0luL3pPbEVlcS9nM3ZaSGpPN2IwbWM0OWxZ?=
 =?utf-8?B?WUM5VVp4Vk1EeFpSTSsrNE5MbHU2VUY0dlo3REpmc2ZwM1lBSTUydG0wY2FE?=
 =?utf-8?B?K2ZSa1lDdHVySmo2VGxzTklGOHppcHhjUEtLUmFPZmoyTXNUN29FS1ZqU0o1?=
 =?utf-8?B?TzFMZWFmZkdBZitEUEI5RHY3RE1oOUlKZFdtdTkwaW1yMlNtWFZaOHZLM2lj?=
 =?utf-8?B?VUVMdHRIZGdUL1V3Q0RwdHF5OTdNSW00UmFwTzlCVGJzNzMzcmZ2M0oxU1VY?=
 =?utf-8?B?N1ZpMHN5akZCLzIra1N0K1dPdWQyaGE5RTZpbEFobzVJaUNzcW8zaFJNRm40?=
 =?utf-8?B?aXc5TXcxa3Z0dTdnNHlNb1NsTTNETitsZU5xSXo0eHM1cHVTZ2Y1YWg0NU1V?=
 =?utf-8?B?SHlFNGNSekNKdk5oUFRSeU1SSkdZZ1RGTllKREo2VFpVTktPUHE5R0xOTFZH?=
 =?utf-8?B?RDRXMEVHQ2xHSFFPcWVqTTNrSFFOS2duMnhqY1dqYTNKRTl6Sk1sQlJsbWlW?=
 =?utf-8?B?bVIrbkx0elIzTGdXaTRONDEyQ2pod2hubUxIZHVNWmFmSjRlSUR6NGVGZ2hV?=
 =?utf-8?B?K01KUC9HaDdrVVNTdlhQNnpVUEhxZGRSZkhvd1VScUtIeW9hV2poamFEUWQy?=
 =?utf-8?B?eDhET0VXM09XdHR1b2NGaTdWZ0pPSGEzLzRJc2lRZGVqeHVZdHBUVFNMZ1BJ?=
 =?utf-8?B?UDR6ZytDc1JZdEN0K0FjeFJXVGRERjhIM0lEekQ3OExjcldjbFdrazBsdzJq?=
 =?utf-8?B?UW84WTNndDh6TlJINk93aTYzOEtzNUZ6d1FtRnoxMHp6THFRY29zS1JHR0h3?=
 =?utf-8?B?SENYUmlNU2tFdGQyRU14ME1vOGE4c2FvcWhKbzRxVFdYNTVkNW9UUzQ2eVNs?=
 =?utf-8?B?WjdINmxJdGw1QU11SHM4dk9QQVYvUUlRYUEvU1A5VkxXeUVhUUdTQU95eEJO?=
 =?utf-8?B?UnZ0eUpGTHZOc2Z1QWsrNUpWN2h5a1JQRUZCRlhmK20rTTI0eEY0QTlrS2JT?=
 =?utf-8?B?WVlDUTZVbitWcFpiSVFDY28yRm9hZ3o3bjBQcXdxU1g4RDRZWkdwcXJSYTd3?=
 =?utf-8?B?L1o0SThURVQyQjVqUG9KVUFJclBHVWxyT1g2a09KbUJPMGpGaTBvM0IrT3FK?=
 =?utf-8?Q?v23t5XYC3Fjl+6zKpPoFiPQf1SsFC4=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:27:20.2391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 314c6bc4-1346-429d-e483-08dd62d209bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8159

SGkgTWljaGFsLA0KDQo+IE9uIDE0IE1hciAyMDI1LCBhdCAwNzo1OCwgT3J6ZWwsIE1pY2hhbCA8
bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxMi8wMy8yMDI1
IDE0OjUyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IEZyb206IFBlbm55IFpo
ZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPj4gDQo+PiBBUk0gTVBVIHN5c3RlbSBkb2Vzbid0
IG5lZWQgdG8gdXNlIHBhZ2luZyBtZW1vcnkgcG9vbCwgYXMgTVBVIG1lbW9yeQ0KPj4gbWFwcGlu
ZyB0YWJsZSBhdCBtb3N0IHRha2VzIG9ubHkgb25lIDRLQiBwYWdlLCB3aGljaCBpcyBlbm91Z2gg
dG8NCj4gTklUOiBJIGFsd2F5cyB3b25kZXIgd2hhdCAibWFwcGluZyIgbWVhbnMgaW4gTVBVIHdv
cmxkLiBJcyB0aGlzIGNvbW1vbiB0byB1c2UNCj4gdGhpcyB3b3JkIGV2ZW4gdGhvdWdoIHRoZXJl
J3Mgbm8gbWFwcGluZyBiZWluZyBkb25lPyBJJ2QgZXhwZWN0IHRvIHNlZSBlLmcuDQo+IHByb3Rl
Y3Rpb24gdGFibGUgb3Igc2ltaWxhci4NCg0Kd2VsbCBpZiB3ZSBoYXZlIGEgbG9vayBvbiB0aGUg
QXJtIHNwZWNpZmljYXRpb25zIGZvciBBcm12OC1yIGFhcmNoNjQsIGNoYXB0ZXIgQzEgUE1TQSwN
Cml0IHJlZmVycyB0byDigJxhZGRyZXNzIG1hcOKAnSBhbmQg4oCcZmxhdCBtYXBz4oCdLCBzbyBJ
IHRoaW5rIG1hcHBpbmcgaXMgc3RpbGwgb2sgZm9yIE1QVS4NCg0KPiANCj4+IG1hbmFnZSB0aGUg
bWF4aW11bSAyNTUgTVBVIG1lbW9yeSByZWdpb25zLCBmb3IgYWxsIEVMMiBzdGFnZSAxDQo+PiB0
cmFuc2xhdGlvbiBhbmQgRUwxIHN0YWdlIDIgdHJhbnNsYXRpb24uDQo+PiANCj4+IEludHJvZHVj
ZSBIQVNfUEFHSU5HX01FTVBPT0wgS2NvbmZpZyBzeW1ib2wgZm9yIEFybSwgc2VsZWN0ZWQgZm9y
IE1NVQ0KPj4gc3lzdGVtcy4NCj4gSSBkb24ndCB0aGluayB0aGlzIHNob3VsZCBiZSBBcm0gc3lt
Ym9sLiBBZnRlciBhbGwsIHdlIGhhdmUgY29tbW9uIGhlbHBlcnMgbGlrZQ0KPiBhcmNoX2dldF9w
YWdpbmdfbWVtcG9vbF9zaXplKCksIHNvIEknZCBuYXR1cmFsbHkgZXhwZWN0IHRoaXMgc3ltYm9s
IHRvIGJlIGluIHRoZQ0KPiBjb21tb24gS2NvbmZpZy4NCg0KeWVzIHlvdSBhcmUgcmlnaHQsIEni
gJlsbCBtb3ZlIHRoaXMNCg0KPiANCj4+IA0KPj4gV3JhcCBjb2RlIGFjY2Vzc2luZyB0aGUgJ3N0
cnVjdCBwYWdpbmdfZG9tYWluJyBwYWdpbmcgbWVtYmVyIHdpdGgNCj4+IHRoZSBuZXcgS2NvbmZp
ZywgaW50cm9kdWNlIGFyY2hfe2dldCxzZXR9X3BhZ2luZ19tZW1wb29sX3NpemUNCj4+IGltcGxl
bWVudGF0aW9uIGZvciBNUFUgc3lzdGVtLCBwcm92aWRlIHN0dWJzIGZvciBwMm1fdGVhcmRvd24g
YW5kDQo+PiBwMm1fdGVhcmRvd25fYWxsb2NhdGlvbiBiZWNhdXNlIHRoZXkgd2lsbCBub3QgYmUg
dXNlZCBmb3IgTVBVIHN5c3RlbXMsDQo+PiByZW1vdmUgJ3N0cnVjdCBwYWdpbmdfZG9tYWluJyBm
cm9tIEFybSAnc3RydWN0IGFyY2hfZG9tYWluJyB3aGVuIHRoZQ0KPj4gZmllbGQgaXMgbm90IHJl
cXVpcmVkLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdA
YXJtLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0K
Pj4gLS0tDQo+PiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgfCAgNCArKysrDQo+
PiB4ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYyAgICAgfCAgMiArKw0KPj4geGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oIHwgIDIgKysNCj4+IHhlbi9hcmNoL2FybS9tcHUvTWFr
ZWZpbGUgICAgICAgICB8ICAxICsNCj4+IHhlbi9hcmNoL2FybS9tcHUvcDJtLmMgICAgICAgICAg
ICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IDUgZmlsZXMgY2hhbmdl
ZCwgNDUgaW5zZXJ0aW9ucygrKQ0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9t
cHUvcDJtLmMNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVu
L2FyY2gvYXJtL0tjb25maWcNCj4+IGluZGV4IDVhYzZlYzAyMTJkMi4uODljMDk5ZmY0NjRiIDEw
MDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9LY29uZmlnDQo+PiBAQCAtNzYsNiArNzYsNyBAQCBjaG9pY2UNCj4+IGNvbmZpZyBNTVUNCj4+
ICAgICAgICBib29sICJNTVUiDQo+PiAgICAgICAgc2VsZWN0IEhBU19MTENfQ09MT1JJTkcgaWYg
IU5VTUEgJiYgQVJNXzY0DQo+PiArICAgICAgIHNlbGVjdCBIQVNfUEFHSU5HX01FTVBPT0wNCj4+
ICAgICAgICBzZWxlY3QgSEFTX1BNQVANCj4+ICAgICAgICBzZWxlY3QgSEFTX1ZNQVANCj4+ICAg
ICAgICBzZWxlY3QgSEFTX1BBU1NUSFJPVUdIDQo+PiBAQCAtMTU4LDYgKzE1OSw5IEBAIGNvbmZp
ZyBWR0lDVjINCj4+IGNvbmZpZyBIVk0NCj4+ICAgICAgICAgZGVmX2Jvb2wgeQ0KPj4gDQo+PiAr
Y29uZmlnIEhBU19QQUdJTkdfTUVNUE9PTA0KPj4gKyAgICAgICBib29sDQo+IFNlZSBhYm92ZQ0K
PiANCj4+ICsNCj4+IGNvbmZpZyBORVdfVkdJQw0KPj4gICAgICAgIGJvb2wgIlVzZSBuZXcgVkdJ
QyBpbXBsZW1lbnRhdGlvbiINCj4+ICAgICAgICBzZWxlY3QgR0lDVjINCj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb20wbGVzcy1i
dWlsZC5jDQo+PiBpbmRleCAzMWYzMWMzOGRhM2YuLmZlYWJhNTc2MTk4YiAxMDA2NDQNCj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0v
ZG9tMGxlc3MtYnVpbGQuYw0KPj4gQEAgLTg2NSwxMSArODY1LDEzIEBAIHN0YXRpYyBpbnQgX19p
bml0IGNvbnN0cnVjdF9kb21VKHN0cnVjdCBkb21haW4gKmQsDQo+PiAgICAgICAgICAgICAgICAg
cDJtX21lbV9tYiA8PCAoMjAgLSBQQUdFX1NISUZUKSA6DQo+PiAgICAgICAgICAgICAgICAgZG9t
YWluX3AybV9wYWdlcyhtZW0sIGQtPm1heF92Y3B1cyk7DQo+PiANCj4+ICsjaWZkZWYgQ09ORklH
X0hBU19QQUdJTkdfTUVNUE9PTA0KPj4gICAgIHNwaW5fbG9jaygmZC0+YXJjaC5wYWdpbmcubG9j
ayk7DQo+PiAgICAgcmMgPSBwMm1fc2V0X2FsbG9jYXRpb24oZCwgcDJtX3BhZ2VzLCBOVUxMKTsN
Cj4+ICAgICBzcGluX3VubG9jaygmZC0+YXJjaC5wYWdpbmcubG9jayk7DQo+PiAgICAgaWYgKCBy
YyAhPSAwICkNCj4+ICAgICAgICAgcmV0dXJuIHJjOw0KPj4gKyNlbmRpZg0KPiBUaGF0J3MgZG9l
cyBub3QgbG9vayByaWdodC4gSWYgd2UgZG9uJ3QgaGF2ZSBQMk0gcG9vbCBmb3IgTVBVIGRvbWFp
bnMsIHRoZW4NCj4geGVuLGRvbWFpbi1wMm0tbWVtLW1iIGRvbTBsZXNzIHBhcmFtZXRlciBkb2Vz
IG5vdCBtYWtlIHNlbnNlIGFzIHdlbGwgYXMgaXRzDQo+IGhhbmRsaW5nIGFib3ZlIHRoYXQgeW91
IGRpZCBub3QgcHJvdGVjdC4NCg0KeWVzIHRoZSBwcm90ZWN0aW9uIHNob3VsZCBiZSBleHRlbmRl
ZCBhYm92ZQ0KICAgIHJjID0gZHRfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgInhlbixkb21haW4t
cDJtLW1lbS1tYiIsICZwMm1fbWVtX21iKTsNCg0KU2hhbGwgd2UgdGhyb3cgYW55IHdhcm5pbmcg
aWYgIUhBU19QQUdJTkdfTUVNUE9PTCBidXQgdGhlIHVzZXIgc2V0cyAieGVuLGRvbWFpbi1wMm0t
bWVtLW1i4oCdPw0KDQoNCj4gDQo+PiANCj4+ICAgICBwcmludGsoIioqKiBMT0FESU5HIERPTVUg
Y3B1cz0ldSBtZW1vcnk9JSMiUFJJeDY0IktCICoqKlxuIiwNCj4+ICAgICAgICAgICAgZC0+bWF4
X3ZjcHVzLCBtZW0pOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9k
b21haW4uaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaA0KPj4gaW5kZXggNTBi
NmE0YjAwOTgyLi5mYWRlYzdkOGZhOWUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vZG9tYWluLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21h
aW4uaA0KPj4gQEAgLTc1LDcgKzc1LDkgQEAgc3RydWN0IGFyY2hfZG9tYWluDQo+PiANCj4+ICAg
ICBzdHJ1Y3QgaHZtX2RvbWFpbiBodm07DQo+PiANCj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQUdJ
TkdfTUVNUE9PTA0KPj4gICAgIHN0cnVjdCBwYWdpbmdfZG9tYWluIHBhZ2luZzsNCj4+ICsjZW5k
aWYNCj4+IA0KPj4gICAgIHN0cnVjdCB2bW1pbyB2bW1pbzsNCj4+IA0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9tcHUvTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0vbXB1L01ha2VmaWxlDQo+
PiBpbmRleCAwNGRmMGIyZWU3NjAuLmYxNDE3Y2QxYjlkYiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9h
cmNoL2FybS9tcHUvTWFrZWZpbGUNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9tcHUvTWFrZWZpbGUN
Cj4+IEBAIC0xLDIgKzEsMyBAQA0KPj4gb2JqLXkgKz0gbW0ubw0KPj4gK29iai15ICs9IHAybS5v
DQo+PiBvYmoteSArPSBzZXR1cC5pbml0Lm8NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
bXB1L3AybS5jIGIveGVuL2FyY2gvYXJtL21wdS9wMm0uYw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzUyNWQ5YjAwYmNiDQo+PiAtLS0gL2Rldi9udWxs
DQo+PiArKysgYi94ZW4vYXJjaC9hcm0vbXB1L3AybS5jDQo+PiBAQCAtMCwwICsxLDM2IEBADQo+
PiArDQo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPj4g
Kw0KPj4gKyNpbmNsdWRlIDx4ZW4vZG9tYWluLmg+DQo+PiArI2luY2x1ZGUgPGFzbS9wMm0uaD4N
Cj4gV2h5IGRvIHdlIG5lZWQgdG8gaW5jbHVkZSBwMm0uaCBhdCB0aGlzIHN0YWdlPw0KDQppdCB3
YXMgdG8gaGF2ZSB2aXNpYmlsaXR5IG9mIHRoZSBkZWNsYXJhdGlvbnMsIGJ1dCAuLi4NCg0KPiAN
Cj4+ICsNCj4+ICsvKiBOb3QgdXNlZCBvbiBNUFUgc3lzdGVtICovDQo+PiAraW50IHAybV90ZWFy
ZG93bihzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0K
Pj4gKw0KPj4gKy8qIE5vdCB1c2VkIG9uIE1QVSBzeXN0ZW0gKi8NCj4+ICtpbnQgcDJtX3RlYXJk
b3duX2FsbG9jYXRpb24oc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiArICAgIHJldHVybiAw
Ow0KPj4gK30NCj4gV2hhdCdzIHRoZSByZWFzb24gZm9yIGFkZGluZyBlLmcuIHAybV90ZWFyZG93
bigpIGJ1dCBub3QgcDJtX2ZpbmFsX3RlYXJkb3duKCkgaW4NCj4gdGhpcyBwYXRjaD8gSSBpbml0
aWFsbHkgdGhvdWdodCB0aGF0IGluIHRoZSBuZXh0IHBhdGNoIG90aGVyIGZ1bmN0aW9ucyB3aWxs
IGJlDQo+IGFkZGVkIHRoYXQgcmVxdWlyZSBpbXBsZW1lbnRhdGlvbiBpbiB0aGUgZnV0dXJlIChp
LmUuIHN0dWJzKSBidXQgdGhlbiBJIHNhdw0KPiByZWxpbnF1aXNoX3AybV9tYXBwaW5nKCkgd2hp
Y2ggcmV0dXJucyAwIHNhbWUgYXMgdGhlc2UgMiBmdW5jdGlvbnMuDQoNCmFzIHlvdSBzYWlkIHRo
ZXNlIGNhbiBiZSBwYXJ0IG9mIHRoZSBsYXN0IHBhdGNoPyBPciB3b3VsZCB5b3UgbGlrZSBhbiBh
ZGRpdGlvbmFsDQpwYXRjaCB0aGF0IGRlZmluZXMgYWxsIHRoZSBmdW5jdGlvbnMgdGhhdCBhcmUg
aW1wbGVtZW50ZWQgYXMgc3R1YnMgKGUuZy4gbGlrZSB0aGVzZQ0KdHdvIHdob3NlIGltcGxlbWVu
dGF0aW9uIGlzIGFscmVhZHkgZGVmaW5lZCBhbmQgZG9u4oCZdCByZXF1aXJlIGltcGxlbWVudGF0
aW9uDQppbiB0aGUgZnV0dXJlKT8NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

