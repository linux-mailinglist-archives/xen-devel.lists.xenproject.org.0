Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519DF52BD90
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 16:34:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332269.555942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKl8-0002rn-1f; Wed, 18 May 2022 14:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332269.555942; Wed, 18 May 2022 14:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrKl7-0002ow-U7; Wed, 18 May 2022 14:34:41 +0000
Received: by outflank-mailman (input) for mailman id 332269;
 Wed, 18 May 2022 14:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ceor=V2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nrKl6-0002oq-6X
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 14:34:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5028f47-d6b7-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 16:34:38 +0200 (CEST)
Received: from DB6PR07CA0191.eurprd07.prod.outlook.com (2603:10a6:6:42::21) by
 AS8PR08MB7205.eurprd08.prod.outlook.com (2603:10a6:20b:404::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 14:34:35 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::a0) by DB6PR07CA0191.outlook.office365.com
 (2603:10a6:6:42::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.5 via Frontend
 Transport; Wed, 18 May 2022 14:34:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 14:34:35 +0000
Received: ("Tessian outbound c1f35bac1852:v119");
 Wed, 18 May 2022 14:34:35 +0000
Received: from 2277c4fa6b64.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91DB3DD3-5532-4D4E-963B-2E709C932FD3.1; 
 Wed, 18 May 2022 14:34:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2277c4fa6b64.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 May 2022 14:34:27 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by PAXPR08MB7320.eurprd08.prod.outlook.com (2603:10a6:102:223::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Wed, 18 May
 2022 14:34:20 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914%5]) with mapi id 15.20.5273.013; Wed, 18 May 2022
 14:34:20 +0000
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
X-Inumbo-ID: a5028f47-d6b7-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EEzFC3caKKtCnKu2+nXQWONrpmySF0w7VU4vxOJnvwTDwU6mFugEjvVYfLL/i02axZYjqCDa9hCTgAjwAJQytBNyKBA1irtilN9V2B1L5rIS3D1WXBWd03Bz4KFM3Psl9TYFabJKdMJ4G1fsYh7nuwbNDzi5tndwKS5BUROP3diggVEXLmZor0KA8n4eXE1rkcQU9Jm+hFU/tPlOj99EtESxytpfCmNddjEZf3acCnk+vZ4eM2D4aeC8sYeVzP9xp4tarfVcG4MQClPkuUYTXlvDi6oY9l1Y5pX53qg5lJMAII13/2/L73aLvnD0dRAHyrXjmh8vkOxKHK0EGizRNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTLCVwlrWKM3V3A61jSURmWa9cl69XKqoMPyl8wYNCU=;
 b=Ux2qiL1L7VnRvjWcT+WshIRxm00Lca8Vg90KetTGldf79RjGbjcCvwNx2hSVkl+E2Vb+uppUDL7O1RVEejMmFVWlicLb2v8ptQExfI5+P0UwPlQ6+SUX6AH0TB9A8AKVQswRHnzW7A7vANSBgXFJBYKIiy2qcxlGUI8H4qnNLI1k3j7Bcko+RZVK6GPAM6NauZufE/E6qLIJnZb/7PlbXXe7FMkBuOSClZw1NgBfJkl7x+Yfynvxo7cRYZtbwITJi8FU9x1tATSuS3EyDY8d4dLoxsvur/J9s/bNXFTiMF0qKU9dwtslDFMePEGs/3XjhTt6B0CTOb4EgTuEll31ZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTLCVwlrWKM3V3A61jSURmWa9cl69XKqoMPyl8wYNCU=;
 b=vKhM3VmuPv3NQ1wkGODJLPzV69E+zKLsDEKCzkcZPyRshAH2yojU+SqxCnk57Qfw46N7TYQLOMjbLmdNDtED2G++BiqWENQq0Q5Px01rgH0kPKwZ4aajJFKFA4bYrBH84Cy7sWGY5R8psDOrLTl5U2GtulzeUObkUFtSwU0HTDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3906e04989055eff
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqSufAsDYo0s6nLfO2hfH4ukbuT67p7GQv10exM6USB2oxnRStpTaT84XwN4NIoLA/9FYqZKi3jaVmrpKHAvzMjxqeBJ5UWf8KeY5t6UvWpp37pkacbGSTQVpWfk/ckntAFif0pWfX+oYebLeFfJpBOMR0gdIso73H+JY00j/HuANhkYe4KVCtgbzbeB5jLIWCbgiaxEgePbZOcycmL8Is1s7McwZAhAXmh0gmxccq1haAULAnq1RgKM4grwYeylAzvlKr0s4eOna3GdpIOe/8awJPPTepcJKJZxm1+Lxt1ss0QyIWLDC5zf1NwhG/WrMcuRnDjBpYEe77D33oGdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTLCVwlrWKM3V3A61jSURmWa9cl69XKqoMPyl8wYNCU=;
 b=cVvH1zVhyXTxsHXxW1TDV+KuuFcPkjEpRIn/Ob1/ODn8Dg4nFC8ikAFmNUu1d5sfR7Wlgg1bFVS5aWpPEYps7PxPe9iXYy287tPmJb6XbzVdI2RMb5YIn02rcD+hiriiFHGQnBSgOYPRzqnSK6ARs1ZnVpzw6jzDopveQ15vKXTkayeSJB8fUyp3oGOr/ETj9dnCnyKrMpgpzYg/tLpUngM9vYNnbwP+zNGXxwI2CPXQEH2CX2H9dMuyfQFNWAyXQdLXnANoB6toKFE2CB4T0oIiGx3sT7uQBqtkuye4IQG1Y+TeLk6WlgB2+Xw9I0Huz9dfMxz321ldt6ZeFBa8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTLCVwlrWKM3V3A61jSURmWa9cl69XKqoMPyl8wYNCU=;
 b=vKhM3VmuPv3NQ1wkGODJLPzV69E+zKLsDEKCzkcZPyRshAH2yojU+SqxCnk57Qfw46N7TYQLOMjbLmdNDtED2G++BiqWENQq0Q5Px01rgH0kPKwZ4aajJFKFA4bYrBH84Cy7sWGY5R8psDOrLTl5U2GtulzeUObkUFtSwU0HTDM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Edwin Torok <edvin.torok@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] tools/ocaml: Fix stubs the introduction of
 domain_create.cpupool_id
Thread-Topic: [PATCH 2/2] tools/ocaml: Fix stubs the introduction of
 domain_create.cpupool_id
Thread-Index: AQHYaiYlhlRp70KGIk+7qOp/vtrSaK0kZYcAgAAF1oCAAATWAIAAEd6AgAAyWYA=
Date: Wed, 18 May 2022 14:34:20 +0000
Message-ID: <F497845B-E20C-4A75-AF9C-ED801217B094@arm.com>
References: <20220517194113.2574-1-andrew.cooper3@citrix.com>
 <20220517194113.2574-3-andrew.cooper3@citrix.com>
 <987CBBF2-D9EE-4644-96DF-5DA89D96921A@citrix.com>
 <db69a8a8-d6a1-b94b-388e-b0c851b1d9c8@citrix.com>
 <107B2C8E-59DF-4D7B-A6E1-E136E702AB96@arm.com>
 <c82af9e0-db35-53b5-f00f-64bcb20c1791@citrix.com>
In-Reply-To: <c82af9e0-db35-53b5-f00f-64bcb20c1791@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 35e620b3-121f-45a5-a322-08da38db87d2
x-ms-traffictypediagnostic:
	PAXPR08MB7320:EE_|DBAEUR03FT063:EE_|AS8PR08MB7205:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB720535F6C0F02B69ABFBA2F7E4D19@AS8PR08MB7205.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8g6DTxe+g++30huOxgPkGKB1ey3ENM47HeLw5zP31dlC7Dt8sYprf8C2HoOiAZMkcwrIqinRPLigJCzbDfQeMwddlYamCrxu8cYSxD8OCISw69s8B0QjVjKEMTZdqUE+FDQ1OD7ZSg+lgaRElsGCOOW/iXzyYL2K35cFD13V/jGUjA9ShDIH4n+cxPM591gTclzDr1Uvl8RpFgUjHmjwOGt7aJ3z66rtF3o3uafz8gGqXCydVAywQrwsua2RuL1nMIlKkdYwbWabNa9ODAnFC8Xbk47z9Mp+LXzikhWs5p22G2+79FNirEfLqsjY6kRP9MG0Ewd4HuxzGEFw+a7coT4bVlcFiD9ywlTCkvkPRex1OxBAcS+Ivxoky4EA1qHreoV/krjQlOaEwEB90f5M2uu6o+tdGukWGN9Q05mJUG5P1rNQj4G1ZtXyVBLEzwujQKfjnlidFxXDChMpffWOZD78hPbX7EZIa/QCFA2/3Q+pxBLOoOjQ7a/o7Jk/dPA4d/qG9+IBpR3Uouyba7ecM4QSm1DSTQjM8+g25rPwt1EzczRbTsPSEOaezRp/EDK4NdaIR1na06T+vWz0DmeoTAlE9xCiCOHF71HOWQCKuPZFmc/OI152a4toQ6mBF5poPPWAge7lV8YKjoOiEwc25K2L2zM1jm0mnfA8P9oPfm1wmtrpdw2mj/BLjyUVWaxrVmcJlPL+lEisSTKf5sQBX9xMKWOXAf3ZJn2FpeEy7qpCMQu8Q+1UvwlH8+7vchVI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(6506007)(316002)(91956017)(76116006)(4326008)(86362001)(66946007)(2906002)(508600001)(26005)(53546011)(38100700002)(38070700005)(186003)(5660300002)(36756003)(2616005)(6486002)(54906003)(6916009)(33656002)(6512007)(64756008)(66446008)(8936002)(71200400001)(8676002)(66476007)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8BC4B5FD154084D930A15FB35F87243@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7320
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4973b6e-557c-47c4-06f5-08da38db7eec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3+1ifkyXQIfYOb5JnSbmDn19+x5ryQSGoN9pNgQuuIZ7uQQerqrq8tAEj0vpGWX17LqOQblc/O4xSdk71HRLJ1/RUVele0eL66zVi3i5ZlIfs8SPjIe1cA9xWy2HqjN1UdzrAqOo4hMoAVM0UL/O8dKHAt/HWUN7q9m8PKfj0JeYNuH/hUR9vS9L/lkRcCsVh+bcqvMiPt/9kajxuJNNSmvMOAkZCRfsrtRA4W5t44nbTxK/dTv68l+ttmCPaUsOs/f38jh2C06mjl8FnmnGNSjq6P4HA+Vp7crFMvpPB8pHCxqBhTuYUJ5obA34ZmazXjIV1cYjpcmDgyksgSojNNA/g+hZw8LVLDH8pqOyz5vBJ61wjRQb2j+kdkPq2dTURDRDD1YcUhY9NtyvpFqSYSn2IIT8qmr4KMIA7hdIcwxTe3+5yPKnWx/29p1Eq1g+xXvJNT93RlR6MMTyMPl+GFKN6CDbn57KNLPzq1AWFuCl0SiRVOM0QGZehtGCyZZWGBtWdW0WrX1wB41wmF4dbIUY8RHzVcqWJmVXmu5Kq7l90uXlQlMw2Yj1GWqB84PQ8S5fWnA4XJYV/7Yu4b64ML1UUscVMHum0rkQXO4c38iEBP65ziqV2Usy8H8tlsdOhgSPp55fexClf3rArE9jV0fauD1dZK1ict+chkhLulC1f2/sI+jFiOab57Zb58y
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70586007)(8676002)(6862004)(4326008)(70206006)(8936002)(33656002)(2616005)(316002)(47076005)(86362001)(5660300002)(40460700003)(107886003)(336012)(186003)(36860700001)(53546011)(82310400005)(36756003)(6506007)(6512007)(6486002)(26005)(81166007)(2906002)(508600001)(356005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 14:34:35.4068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e620b3-121f-45a5-a322-08da38db87d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7205

KyBBZGRpbmcgdG9vbHN0YWNrIG1haW50YWluZXINCg0KPiBPbiAxOCBNYXkgMjAyMiwgYXQgMTI6
MzQsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiAN
Cj4gT24gMTgvMDUvMjAyMiAxMTozMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+PiBPbiAxOCBN
YXkgMjAyMiwgYXQgMTE6MTIsIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDE4LzA1LzIwMjIgMTA6NTEsIEVkd2luIFRvcm9rIHdy
b3RlOg0KPj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCBi
L3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbA0KPj4+Pj4gaW5kZXggNzUwMzAzMWQ4ZjYx
Li44ZWFiNmY2MGViMTQgMTAwNjQ0DQo+Pj4+PiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hl
bmN0cmwubWwNCj4+Pj4+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbA0KPj4+
Pj4gQEAgLTg1LDYgKzg1LDcgQEAgdHlwZSBkb21jdGxfY3JlYXRlX2NvbmZpZyA9DQo+Pj4+PiAJ
bWF4X2dyYW50X2ZyYW1lczogaW50Ow0KPj4+Pj4gCW1heF9tYXB0cmFja19mcmFtZXM6IGludDsN
Cj4+Pj4+IAltYXhfZ3JhbnRfdmVyc2lvbjogaW50Ow0KPj4+Pj4gKwljcHVwb29sX2lkOiBpbnQz
MjsNCj4+Pj4gV2hhdCBhcmUgdGhlIHZhbGlkIHZhbHVlcyBmb3IgYSBDUFUgcG9vbCBpZCwgaW4g
cGFydGljdWxhciB3aGF0IHZhbHVlIHNob3VsZCBiZSBwYXNzZWQgaGVyZSB0byBnZXQgYmFjayB0
aGUgYmVoYXZpb3VyIHByaW9yIHRvIHRoZXNlIGNoYW5nZXMgaW4gWGVuPw0KPj4+PiAoaS5lLiB3
b3VsZCBpdCBiZSBjcHUgcG9vbCBpZCAwIG9yIC0xIGlmIGNwdSBwb29scyBhcmVuJ3Qgb3RoZXJ3
aXNlIGV4cGxpY2l0bHkgY29uZmlndXJlZCBvbiB0aGUgc3lzdGVtKQ0KPj4+IGNwdXBvb2xzIGFy
ZSBhIG5vbi1vcHRpb25hbCBjb25zdHJ1Y3QgaW4gWGVuLg0KPj4+IA0KPj4+IEJ5IGRlZmF1bHQs
IG9uZSBjcHVwb29sIGV4aXN0cywgd2l0aCB0aGUgaWQgMCwgdXNpbmcgdGhlIGRlZmF1bHQNCj4+
PiBzY2hlZHVsZXIgY292ZXJpbmcgYWxsIHBDUFVzLCBhbmQgZG9tMCBpcyBjb25zdHJ1Y3RlZCBp
biB0aGlzIGNwdXBvb2wuDQo+Pj4gDQo+Pj4gUGFzc2luZyAwIGhlcmUgaXMgdGhlIGJhY2t3YXJk
cyBjb21wYXRpYmxlIG9wdGlvbi4NCj4+PiANCj4+PiBBbmQgb24gdGhhdCBub3RlLCBMdWNhLCB5
b3Ugb3VnaHQgdG8gcGF0Y2ggeGwvbGlieGwgdG8gYXBwbHkgdGhlIHBvb2w9DQo+Pj4gc2V0dGlu
ZyBkaXJlY3RseSBkdXJpbmcgZG9tYWluIGNyZWF0ZSwgcmF0aGVyIHRoYW4gZGVwZW5kaW5nIG9u
IGNwdXBvb2wNCj4+PiAwIGV4aXN0aW5nIGFuZCBtb3ZpbmcgdGhlIGRvbWFpbiBsYXRlci4NCj4+
IElzIGl0IGFuIGVuaGFuY2VtZW50IG9yIGEgYnVnIGZpeD8NCj4gDQo+IFRoaXMgaXNuJ3QgYSBi
aW5hcnkgb3B0aW9uLg0KPiANCj4gWW91ciBzZXJpZXMgYWRkZWQgYW4gb3B0aW1pc2F0aW9uIHRv
IERPTUNUTF9jcmVhdGVkb21haW4sIHRoZW4gZGlkbid0DQo+IGFkanVzdCBsaWJ4bCB0byB1c2Ug
dGhlIG9wdGltaXNhdGlvbiAod2hpY2ggd291bGQgaGF2ZSByZWR1Y2VkIHRoZQ0KPiBudW1iZXIg
b2YgaHlwZXJjYWxscyB0byBjcmVhdGUgdGhlIGRvbWFpbiwgYW5kIHJlZHVjZSB0aGUgbnVtYmVy
IG9mDQo+IGR5bmFtaWMgbWVtb3J5IGFsbG9jYXRpb25zIGluIHRoZSBoeXBlcnZpc29yLiAgTWFy
Z2luYWwsIGNlcnRhaW5seSwgYnV0DQo+IGNsZWFybHkgYSBuaWNlLXRvLWhhdmUpLg0KPiANCj4g
VGhlcmVmb3JlLCB5b3UgY3JlYXRlZCB0ZWNobmljYWwgZGVidCwgd2hpY2ggaXMgb3B0aW9uIDMu
DQo+IA0KPiBCeSBkZWZhdWx0LCBhcyB0aGUgY29udHJpYnV0b3IsIHlvdSBhcmUgZXhwZWN0ZWQg
dG8gYWRkcmVzcyB0aGUNCj4gdGVjaG5pY2FsIGRlYnQsIGJlY2F1c2UgaXQgaXMgYW4gaW1wb3J0
YW50IGRpZmZlcmVuY2UgYmV0d2VlbiBoYWNraW5nIGENCj4gZmVhdHVyZSB1cCBmb3IgeW91cnNl
bGYsIGFuZCBpbnRlZ3JhdGluZyB0aGUgZmVhdHVyZSBuaWNlbHkgZm9yIGV2ZXJ5b25lLg0KPiAN
Cj4gWW91IGNhbiBvZiBjb3Vyc2UgbmVnb3RpYXRlIHdpdGggdGhlIHRvb2xzIG1haW50YWluZXIg
dG8gc2VlIGlmIHRoZXkNCj4gY2FyZSwgYW5kIHJpZ2h0IG5vdyB0aGF0J3MgYSBiaXQgZGlmZmlj
dWx0LiAgSXQncyBxdWl0ZSBwb3NzaWJsZSB0aGF0DQo+IG5vb25lIG90aGVyIHRoYW4gbWUgY2Fy
ZXMsIGFuZCBJJ20gbm90IGxpYnhsIG1haW50YWluZXIuDQo+IA0KPiBFaXRoZXIgeW91IG5lZWQg
dG8gcGF5IG9mZiB0aGUgdGVjaG5pY2FsIGRlYnQsIG9yIHNvbWVvbmUgZWxzZSB3aWxsIGhhdmUN
Cj4gdG8uICBTb21lb25lIGVsc2UgaXMgZ29pbmcgdG8gaGF2ZSB0byBzdGFydCB3aXRoIGRpZ2dp
bmcgaW50byBzb3VyY2UNCj4gaGlzdG9yeSwgd2hpY2ggbWVhbnMgaXQncyBtb3JlIGV4cGVuc2l2
ZSB0aGFuIHlvdSBkb2luZyBpdCBub3cuDQo+IA0KPiBBdCBhbiBhYnNvbHV0ZSBtaW5pbXVtLCB5
b3UgbmVlZCB0byBiZSBhd2FyZSBvZiB3aGVyZS93aGVuIHlvdSBhcmUNCj4gY3JlYXRpbmcgdGVj
aG5pY2FsIGRlYnQuDQoNCk9rLCB3ZSd2ZSBqdXN0IGNyZWF0ZWQgYSB0YXNrIHRvIGhhbmRsZSB0
aGlzIHdvcmsgc28gdGhhdCB3ZSBjYW4gdHJhY2sgaXQsIHdlIHdpbGwNCmhhbmRsZSBpdCBpbiB0
aGUgZnV0dXJlLg0KDQpDaGVlcnMsDQpMdWNhDQoNCj4gDQo+PiBGcm9tIHdoYXQgSSBrbm93LCBw
bGVhc2UgY29ycmVjdCBtZSBpZiBJ4oCZbSB3cm9uZywgY3B1cG9vbDANCj4+IElzIGFsd2F5cyBw
cmVzZW50LCBzbyB0aGVyZSB3b27igJl0IGJlIHByb2JsZW0gb24gYXNzdW1pbmcgaXRzIGV4aXN0
ZW5jZQ0KPiANCj4gRnJvbSB3aGF0IEkgY2FuIHNlZSwgeW91ciBzZXJpZXMgaGFzIHJlZHVjZWQg
dGhlIG1hZ2ljIGludm9sdmVkIHdpdGgNCj4gY3B1cG9vbDAsIHdoaWNoIGlzIGdvb2QuDQo+IA0K
PiBCdXQgdGhlIGZhY3QgdGhhdCBpdCBzdGlsbCBoYXMgbWFnaWMgcHJvcGVydGllcyBpcyBzdGls
bCB0ZWNobmljYWwgZGVidA0KPiB0aGF0IHNvbWVvbmUgaXMgZ29pbmcgdG8gaGF2ZSB0byBwYXkg
b2ZmIGV2ZW50dWFsbHkuDQo+IA0KPiB+QW5kcmV3DQoNCg==

