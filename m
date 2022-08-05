Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CEC58AA4A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 13:45:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381095.615616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJvl6-0003dp-Lw; Fri, 05 Aug 2022 11:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381095.615616; Fri, 05 Aug 2022 11:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJvl6-0003bJ-Ih; Fri, 05 Aug 2022 11:44:52 +0000
Received: by outflank-mailman (input) for mailman id 381095;
 Fri, 05 Aug 2022 11:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcVI=YJ=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oJvl4-0003bD-R5
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 11:44:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 025bee11-14b4-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 13:44:48 +0200 (CEST)
Received: from AM6PR10CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::24)
 by DB8PR08MB5385.eurprd08.prod.outlook.com (2603:10a6:10:119::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 11:44:46 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::30) by AM6PR10CA0011.outlook.office365.com
 (2603:10a6:209:89::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Fri, 5 Aug 2022 11:44:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Fri, 5 Aug 2022 11:44:46 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Fri, 05 Aug 2022 11:44:45 +0000
Received: from c4ee71ceccce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F558D01-FC92-4DD3-B23B-73BA83C3F40B.1; 
 Fri, 05 Aug 2022 11:44:39 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4ee71ceccce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Aug 2022 11:44:39 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DBAPR08MB5607.eurprd08.prod.outlook.com (2603:10a6:10:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 11:44:37 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 11:44:37 +0000
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
X-Inumbo-ID: 025bee11-14b4-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cJINa2VTwg3fqq3Oj/xphfXPPlqWZrNRzlhKobjWu4eppD9Ah1vMi5SVSxyiwYW9L70xab8QF6xDWE6UqUQT4p01LqzNlYMV/e1gh7NKSFrYk6UaxkWI2ttBwxPjSXJSo4okURIDpip90FLCCdVxfbuMTy6UqS4FycJ0nhTEGuAr6VNffIF51WkkWHoLzU2+EVs8MMBBjgrRKVIy+H/XVcj2JWbiQpp60B1SItGgpqLa1h+vkHIJ/gtmcwXHrTcprlmU0qjPQma0MHqe2wpWzW6jhd/Y+jB7c7gCfSw+19HPNj2yaj9wRDTNC6NDuoNaicXrj3Pws1J2NSK/ezprgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWzF3SlKpUzG1sytpRrSPU1L7zn8eraL1X2wvtQ2gug=;
 b=FZ9wDH9lbRnnOQnAj8DpeOj2ptaTRvIxa/nhXYgmZLxqMbf62StF+YxmKQeQpo3+pTvJe1vnUXliBzOPuKe0ALph0EXBAJrEanUsEmca56xTpfoJl08Nh9x0mzMYJdVNIvxFRqr0+uaWT10J/ik2pOzAc8FlVH6wne0kXBpeldoYc+0erezcx1Q2bIlxnz8R5RJXZAjFvVQKEuJc2WqZZJFt5ckA7a408fONtxXslbX6mgQPjoKlvT6PESwgf4+xC6IgbfzdV7n3U6ncd0aBxur/9zexrt4BGAZWhJaF2KE/3zBA+lnH0BeQ+M2AdwRo+khHCPHFs9nOPG4/mrx/WQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWzF3SlKpUzG1sytpRrSPU1L7zn8eraL1X2wvtQ2gug=;
 b=Bri/mQTF/kMC+vsa01pDa5GAla/SRAbd8ZJx5n78QkWZKYd8Zn2GSEV1CRu6Mwd/rxlNF24blDMyScZ5u8YoFCzNwMSg0hiW4B2mG71t+02WoNDLj49xw2UQz5JQTleloAaenhsvFfKBQ9ouEbMCdcJfc66Lqrfv8LIBm4Okv6I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e0a11bf3ca6d663
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hy5TkeTsLuTgELUrhgkv8Bw+4X0a3VEgvwgEHvyiT+Gl+6V40qPV18cXruZAe4/59ycJA8mgkVt6X4E20rlGkeMeWpEUEBaWdYjmG4HfDxlegyYQU9PsQPyWuZARdOLZIqDRZLTJqkbvdudjtw4ydp6IaqqgeCKQkyp8oV5z8nIvd5tzSvaMrkRe8f7/I/nyE7r2ZOXO405cftkEMayFkkpDogdjjCq0xbt7d3pbWISYKIU/5DXU17C3blkiVwvSZbb7GhP64VA09Xp7hg3Jg0l5PRaPdAaRfxIsnp2ASBJpSuGdGBPzxCnH8LKOFycG51QQdPqTaVkhIgEYEjv3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWzF3SlKpUzG1sytpRrSPU1L7zn8eraL1X2wvtQ2gug=;
 b=W8lNNQ7rqI4ofairr+vIxXcmcR59uBCbJ2LHu9pGjl5TMZiFZ9uAug/ZdPOtIzvfbL93QslTNCIjxjAcgclLPRF+GjenaBAGPLf6U/lBkb5eZqM3/ew3Lw0TR7BKxCe56weEJ25wpYo1S75cd69p8KOq4yrZh2JtfJMGCed8Kz5xPKTwkeuSyKllIZMqj/NBBghAh/w/lYvjetPa6JSM/HwRotSKqvlx9aa8Ad5ebUSq6R9wdkyUNfTSZOVO3AIw9+Nzqv+jGuRyJVoxkhh+w2jtil+LCmVkuAgxN13W5QtwIRflzc9FNOVEfIGC9ISSsOv8FeVg8rVVzOnQ2s1Kdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWzF3SlKpUzG1sytpRrSPU1L7zn8eraL1X2wvtQ2gug=;
 b=Bri/mQTF/kMC+vsa01pDa5GAla/SRAbd8ZJx5n78QkWZKYd8Zn2GSEV1CRu6Mwd/rxlNF24blDMyScZ5u8YoFCzNwMSg0hiW4B2mG71t+02WoNDLj49xw2UQz5JQTleloAaenhsvFfKBQ9ouEbMCdcJfc66Lqrfv8LIBm4Okv6I=
From: Rahul Singh <Rahul.Singh@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Peter Griffin
	<peter.griffin@linaro.org>, Jerome Forissier <jerome.forissier@linaro.org>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Thread-Topic: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Thread-Index: AQHYp9oSH5EsxeaUkUyE6LjUTYBewq2gMcUA
Date: Fri, 5 Aug 2022 11:44:37 +0000
Message-ID: <D6DDAE40-A8EF-4230-A292-401FBA085EE0@arm.com>
References: <20220804081253.GA1219098@leoy-ThinkPad-X240s>
In-Reply-To: <20220804081253.GA1219098@leoy-ThinkPad-X240s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2a33f93e-2e5a-4ac6-019e-08da76d7e52e
x-ms-traffictypediagnostic:
	DBAPR08MB5607:EE_|AM5EUR03FT018:EE_|DB8PR08MB5385:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xnuOBSGJj0UlvPed0NnSx7cIQRq+1SZIdZ63mx9puYyEqYZlL8cIj9FB7jTWWHInAuSUMjiJj32XaEWstEK43EMeBu085NHEBo/cKOxkZ6ltLV8aV5yLB1qq2QEc3oA+YNJ6AyCo03JCDQtCUt4UQsTnkEpYhhGy4dBII5CpFC2H7IPGnLm6lZcJF2Hs5J+y+cvDxHUrKhqNaZByxvgpXdEwGCvzClvtoFAjniUiob8fUS4QT4y7yFBkSbx46RKey7+yhZXKiwRrxXkEBG3NQvj7lRN/ltqsd3Q/cTnIno9Z6TBLou6EHr5fRGvB6vBgDrWJTOKNKzRiWcj9wEUozA+akGUqbG8HfEv1B+mL1Syt2uiMU/B3KeSBoyV7QXWMPexv9Zw16NDa9tq1gJ3ayD38bxXhjPz8iQp/3QiVNeSClDZ0UuIofBhZ2hXMsw0T57+hO7MNWVYjuJnjTE+aggd7w+4haHpy6CZ/00AaB5cveTohdblU6MZsA9//+ZTaZEnJWYnHtvan8P/OqlUI9g9mB2CphjWx1tAe5uKEc/yYjRr/K9+46M5EHhhX4lnxtQli1lEU9qol8bNmp8jmmCcuQO4IdWyY5dw9Q3xGuZzzyNoIRwGOWFc4BadwX1TUnKycJIY69zvFB2dXIlZ2uXHVf4CG/v6KWYODyPE6eHFt9GVebctivAfJP5gZdy4zpV5pmro9Tvf3w9cpC2Oay8yQQa40PweyqOkb6I2kkpE+vgZvxJ9vZC5srlWcvhbYHAJoyUuKbIlJsZxW5gbrIKXsK0U1M2/vbsL8OV8B7jxUa0EoIQf+WlSp7DCAXnOGEi4uGk3zgbhn0x7XPe8Sgw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(83380400001)(38070700005)(86362001)(33656002)(66556008)(66476007)(76116006)(66446008)(66946007)(8676002)(4326008)(91956017)(64756008)(38100700002)(71200400001)(122000001)(478600001)(8936002)(6486002)(54906003)(45080400002)(316002)(6916009)(26005)(6512007)(186003)(6506007)(53546011)(2616005)(5660300002)(36756003)(41300700001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6454EA06E458274A92A04412AC654A35@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5607
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd899358-33e3-4c20-defe-08da76d7dfe0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	we8fyBwntnkn1PCrGg8xGTkho2GQvV72kfCtsLg7akBgVXss5BKMQTkkmPfHPq25Bm2CyeZ3FqelkQLS1Y9fwmHCIPy4q0LWIAHaeRDQTl2/u9Xyxk/UsrYPe+iOVB5tXSBEi4/VCy8Zj9ulgEWz9cCDFTNJLCAx89KzywozJh95Thez36khKWvULfDqoj3izWNSc/jpGTp57RhP5zDjDqPJemUE1qDOR0tTFEQxfzB/MzPeJ50OTZVmAQsENohFxBhiaS3vVT4z++uSmMFgAlapkXfnr9Tz03esfarIPnLxPPX9++HYvjlFu0zLw73aJ6qj1FPWFVIA0IXum4Ir3kbkSg+ZzPm9EzPy+b2gbiifa2V66LZSKibhI/MqYiMOmAvetCW1pKch50RcSHknx/E2w/EEdny+328FkBFDisl8frCW044h80wE4WbYKaZb99tPkwqqAJWLWGs1CMp+4ej2DlDePG1rAZEJVWsawHQ09cvYQ2EEzVikJhVQUYfdZfK4zJgVHbVHOImXV6RwKHjDsABOJAeO+GtRTdbn3WPNy5ll1NTwU2rw9tPRAR7BQmcZc3A/S5WrZJi0ilVU1UCHb/cvqqwMUOWxJ0CE+FqdiA5XCPJ3Tzi3E/m7bzjnpA37cTZ8Et+d9ke9TNw8mf9o5T6wEaxTUb/4Er+R4nB9QJJ+9ErBtN2Mxt6fXNinSDVNduHUS3cwAwcw3MGhoSN+gvSKPGaJRwKurqsnAuIaSMnJmx+5Hgr/Mva7vHleHt9NvuQI3lI3XLz67ZN8ZbOlneSIsVPbweFYz0ABsRnj4vh2QhzwI3RSjC+xtVpX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(45080400002)(316002)(40480700001)(478600001)(33656002)(107886003)(47076005)(336012)(2616005)(6486002)(41300700001)(53546011)(26005)(54906003)(6512007)(186003)(6506007)(4326008)(36860700001)(70206006)(86362001)(70586007)(36756003)(5660300002)(2906002)(81166007)(8936002)(6862004)(356005)(8676002)(83380400001)(40460700003)(82310400005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 11:44:46.0765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a33f93e-2e5a-4ac6-019e-08da76d7e52e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5385

Hi Leo,

> On 4 Aug 2022, at 9:12 am, Leo Yan <leo.yan@linaro.org> wrote:
>=20
> Hi there,
>=20
> Now I am working on Ampere Altra SoC platform, with Xen (4.16) and Linux
> kernel (5.15.23).
>=20
> I observed a warning is reported by Linux kernel in the booting flow:
>=20
> [    0.403737] ------------[ cut here ]------------
> [    0.403738] WARNING: CPU: 30 PID: 0 at drivers/irqchip/irq-gic-v3-its.=
c:3074 its_cpu_init+0x814/0xae0
> [    0.403745] Modules linked in:
> [    0.403748] CPU: 30 PID: 0 Comm: swapper/30 Tainted: G        W       =
  5.15.23-ampere-lts-standard #1
> [    0.403752] pstate: 600001c5 (nZCv dAIF -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    0.403755] pc : its_cpu_init+0x814/0xae0
> [    0.403758] lr : its_cpu_init+0x810/0xae0
> [    0.403761] sp : ffff800009c03ce0
> [    0.403762] x29: ffff800009c03ce0 x28: 000000000000001e x27: ffff88071=
1f43000
> [    0.403767] x26: ffff80000a3c0070 x25: fffffc1ffe0a4400 x24: ffff80000=
a3c0000
> [    0.403770] x23: ffff8000095bc998 x22: ffff8000090a6000 x21: ffff80000=
9850cb0
> [    0.403774] x20: ffff800009701a10 x19: ffff800009701000 x18: fffffffff=
fffffff
> [    0.403777] x17: 3030303035303031 x16: 3030313030303078 x15: 303a30206=
e6f6967
> [    0.403780] x14: 6572206530312072 x13: 3030303030353030 x12: 313030313=
0303030
> [    0.403784] x11: 78303a30206e6f69 x10: 6765722065303120 x9 : ffff80000=
870e710
> [    0.403788] x8 : 6964657220646e75 x7 : 0000000000000003 x6 : 000000000=
0000000
> [    0.403791] x5 : 0000000000000000 x4 : fffffc0000000000 x3 : 000000000=
0000010
> [    0.403794] x2 : 000000000000ffff x1 : 0000000000010000 x0 : 00000000f=
fffffed
> [    0.403798] Call trace:
> [    0.403799]  its_cpu_init+0x814/0xae0
> [    0.403802]  gic_starting_cpu+0x48/0x90
> [    0.403805]  cpuhp_invoke_callback+0x16c/0x5b0
> [    0.403808]  cpuhp_invoke_callback_range+0x78/0xf0
> [    0.403811]  notify_cpu_starting+0xbc/0xdc
> [    0.403814]  secondary_start_kernel+0xe0/0x170
> [    0.403817]  __secondary_switched+0x94/0x98
> [    0.403821] ---[ end trace f68728a0d3053b70 ]---
>=20
> Looked into the code, the GICv3 driver tries to create persistent
> reservations for pending pages, and the persistent reservation table
> can be used by kexec/kdump.  For the persistent reservations, it
> relies on MEMRESERVE EFI configuration table, but this table is not
> supported by xen.efi, I think this is the reason for the above oops.

Yes, you are right above warning is observed because Xen does not support=20
memreserve efi table. I also observed a similar warning on the N1SDP board.
>=20
> I checked that if I boot a host Linux (without Xen), then the EFI has
> provided MEMRESERVE configuration table, I can get below log:
>=20
>  #  dmesg | grep MEMRESERVE
>  [    0.000000] efi: TPMFinalLog=3D0x807f9ef0000 ACPI 2.0=3D0x807fa0d0018=
 ... MEMRESERVE=3D0x807f8141e98
>=20
> Just want to confirm, is anyone working on enabling MEMRESERVE EFI
> configuration table for Xen?  And welcome any comments and
> suggestions!
>=20


Regards,
Rahul


