Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89665588977
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 11:29:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379697.613374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAhL-0007h3-VC; Wed, 03 Aug 2022 09:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379697.613374; Wed, 03 Aug 2022 09:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAhL-0007fF-S6; Wed, 03 Aug 2022 09:29:51 +0000
Received: by outflank-mailman (input) for mailman id 379697;
 Wed, 03 Aug 2022 09:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qDY/=YH=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oJAhK-0007f7-QJ
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 09:29:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d14dd29f-130e-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 11:29:48 +0200 (CEST)
Received: from AM6PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:20b:6e::14)
 by VI1PR0801MB1919.eurprd08.prod.outlook.com (2603:10a6:800:89::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Wed, 3 Aug
 2022 09:29:44 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::4b) by AM6PR02CA0001.outlook.office365.com
 (2603:10a6:20b:6e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Wed, 3 Aug 2022 09:29:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Wed, 3 Aug 2022 09:29:44 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 03 Aug 2022 09:29:43 +0000
Received: from dac534fd900f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD0CC219-6965-418A-ADBC-A2A787DA18DD.1; 
 Wed, 03 Aug 2022 09:29:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dac534fd900f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Aug 2022 09:29:32 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VI1PR08MB3040.eurprd08.prod.outlook.com (2603:10a6:803:45::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.13; Wed, 3 Aug
 2022 09:29:30 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 09:29:30 +0000
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
X-Inumbo-ID: d14dd29f-130e-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CHRZOx7AnQm5pEb+w3QPbD/SJLe7E+ZraC3LAAzADOQ87LtLRntK54ny+P3R/nYm28w7Z0lPnGEmAtUeHF7uQni547g8kl0v+Ip5k1L+ZiwVrhwSuSmdpqZxqWX1ZIIBqcq32azQT2bGiHphqfCMlbY5EUb7bsvy6A+ONvd3DP+o6Pm7SBFu6JeGViVLsIuG73WoV6zl6guZBF4szxlhi+ULhuvTMDo2XjZgKqYi3PfudNSOlXTsCwpwrxHKDOxl8WZbhcGmffTC4efjr9RN2YGh7CdD5eFWdR8hAdYspCKGiY91cTP6KlV36flgTJsoJp3gQ71kJyW8D6cnNVtuAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7LsUQkASUsQ3/xYCcyDKys2w0HCjo9W9ByR8ZAk/lU=;
 b=Yf1XovYjKIVVauMrYuM1BseGZyGDwQUkZkUwxdYs5P9io+UYMauI4+mTWpp5cRTB/k7fmz0xj19lhMkX0Obe/zTYNsH5hoqHnvgHt9n6Uox5rExw0Dj95h/AQVdU+rU2I+7pDm7hhI6bT2z4xf2d/9vNe6NwNQd3De5l9pGYRPYpk6MJ4NXXHpjuBeSODeS4UaYpZzBOhYnDffLiLEahgCh7xzoYKJtno5z5kvN5FKg6aEBrSmElN8C6QgAoWr5aJbdjJLZEpN/dlesv5T4bR3uhtKGaNbN5i/T3hzjVvSy9Zg3sSkQ9ix27CtVDZ+VjUcqmp+NDtOmC9r2VH5j61Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7LsUQkASUsQ3/xYCcyDKys2w0HCjo9W9ByR8ZAk/lU=;
 b=vydB1bSXtPj5uu167AYH+c6kfMZAJv1W3GtQDEj0yYzun2Unc7MxctrVIteY2Ij2hsaMmGvHWvWGyA+Miy+gUaGIFdWKfj+KD+sN2UiG4+vK+uwmlYrLD+A6nHaM/YRsyasUqB9whK23higaBG2WSMCaOc5BpS3goBHCY17P9HA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 996fb032c3153cb3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjuKaPiY1RDCHYLFV6KZghMbVYVvNrGXw+ti1sYZIl3bNvzBEAIiBue/CKijFSp3BZvNy8hJRTiXi2neH2udn00cU4lGa9SUHCPBA8Dx3y2JLit5u5Disemup79RI44/r95WD7pnqxgfUSXew9c2xqvDTz9Uxf3alie0ZLZg/3nNY/XA9VAK/5W6JoWzz1yYBiPQG6t1Fx1bZ67IY0Skc8EIu4/G/+f5EIaqCwU47rwkjGNOjaBrmSYKmnUwT8cJ5K8u6sdQAugCKC9zEC3CLJ72cjDvkGFcU3gF4G/1N0iaHvuC4RN5T868OpRk0wcq7Y9re7tF/p+rE4N3aDj6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7LsUQkASUsQ3/xYCcyDKys2w0HCjo9W9ByR8ZAk/lU=;
 b=nPeLRPQhXztJg3sopEAKtCCuCqdP0lXie1gxGAZVHCvRCinjQlUCTuR9JOfNhEpuu3/bTZNUvffNf00AaiEbVjFUJLL/NtZDUXtBVzC237HZ5cxWw6CKK01IPujxCByfrAjI+HRWtHKtNgLD6M+Xmc4eyFGe+hlJT5GJ51OR7lvwsT3t8rQlpQcixtluvQcd1Bxqn6QeaWtNNGhC8qi57ibithLfqE1hOxbdaFBnbALMhVH88rc+vD3+bwNbsAq1wrHgF8R6foER0e7+vueRN+Y1iVMyqqHQIp6HZVdG+K/y2EcygXkTnr+/mDmTsZgsDSZeFvR18imBlXvFcybGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7LsUQkASUsQ3/xYCcyDKys2w0HCjo9W9ByR8ZAk/lU=;
 b=vydB1bSXtPj5uu167AYH+c6kfMZAJv1W3GtQDEj0yYzun2Unc7MxctrVIteY2Ij2hsaMmGvHWvWGyA+Miy+gUaGIFdWKfj+KD+sN2UiG4+vK+uwmlYrLD+A6nHaM/YRsyasUqB9whK23higaBG2WSMCaOc5BpS3goBHCY17P9HA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr <olekstysh@gmail.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH V7 01/11] xen/pci: arm: add stub for is_memory_hole
Thread-Topic: [PATCH V7 01/11] xen/pci: arm: add stub for is_memory_hole
Thread-Index: AQHYm5cPHjzDoLlJ5UyWUT58Xfo5Ca2VmV4AgAdmg4A=
Date: Wed, 3 Aug 2022 09:29:30 +0000
Message-ID: <304DD889-A643-42D9-9B60-7B34950A127D@arm.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-2-olekstysh@gmail.com>
 <8e912bdf-a93f-c3d8-8906-8132a8f30035@gmail.com>
In-Reply-To: <8e912bdf-a93f-c3d8-8906-8132a8f30035@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 97f85829-8d17-4c59-cf60-08da7532b32f
x-ms-traffictypediagnostic:
	VI1PR08MB3040:EE_|VE1EUR03FT038:EE_|VI1PR0801MB1919:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1yVIPJZFunP9EQqfmq1PsPxZT1Y93QtSvRUUjtsgojSfqc8tzly/k7Z2eYidlSkObEenczs6quUTYpILfeJAYGUh0e9vJRBgiOo8AjhQtJMwb7EkIKL8T2N6XVpj/YLrTgKK2hB0HJepzFR/XWdFROiTGrcDf9KtrpCQAm6pTFSyNMw6GA2rvhWj5mCNWQqyO3vXdMDD7he/zmAinzh8LbboRmP9Uixz6TGA+cPFhGvtxqpDV3WHBnM9hez/xKM9oDpPixKchABhQGNtIw1DwiyoyqaLtA0muw2zpRA9DlGPthKtRCnqQJuZBaWb9f7D7yn3M4DQsHv/7IoyAuG1XBXiNCDPbwNUSxkqXwoFUxMU1D6k0ESqbZqzxD3wvCaFv/9yX50yPPf7TGgh8QSviaD1gh+JvHhFpQRIGGAtZvvqSx8r67A/s0/5v8lyPEhK6QszIVCn4FCGvMu2/Mw7n8LQM+/ogTDmbmLl034wHySnhSumK2Pk5TxEtf9qHenAZ2sEvDb9cdx2zU8YEDQNy9N/l8inhwReq0AJCKaCWdpGGM60YZELG76drUn8Xewmp7QMtwv9k8dVEwUcDxkVT58+azEnrb/jjtAuS/o6eiAvBwTMRrQHPUAj40k7poJw1J3JdZ4yxL4FhERtRdDkkSE2+0OieJvK0mWiZFpN1Lq4HBI34LSohW+6UJ4QdW8JQgjjbjWkln07b+a1d3XQICKfF++EjLL1TNKZtWUFgw4NRj+QhEZFWTZTB33/LbSNZWtF54RuZoCseGCuEv8lJ6hX56axW1Ckfkf7wjtShLjtekGCeI7rYcZzQ33UFc7xkl7Y75vpMM50guDx6W5E3g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(83380400001)(86362001)(5660300002)(8676002)(38100700002)(6916009)(122000001)(54906003)(2906002)(41300700001)(2616005)(33656002)(316002)(478600001)(66946007)(53546011)(36756003)(71200400001)(6506007)(91956017)(64756008)(6512007)(76116006)(26005)(186003)(6486002)(66446008)(66476007)(4326008)(8936002)(66556008)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6091193A810D834AA33682FAB467F235@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3040
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52f758c3-f306-41e6-fa32-08da7532aad8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eoZYj7+bqA4PfzlYfpxd1xIlmurk0MAovS+EHT/9ICcIuPauv6ni/FZI8FF5p5KTCMEXHxEJIe41W1BcilN2r/kV5vnx/3lg0SgP6LtREtR3/0KS3ML6mC698t1ExLT4kgWMD7H6NtHpCEvHDI1nY0Hef6YLyfLKg/cCc7rJKcgywkKfhASbJNiW0fWJROi4aG/7J6fjS2UF2OyRaaRBf6+Is40Sc5E229RHOgvZPbZ9n6oFEm3EoIi4dNCB1JQ7UzFLoOp6R3dv6R0HmTSAe+bHT6n+5WDGBKyhQk829OjFttwQ7tay39qToEhmYQDiFUUTOgA09secqUouP3ku5p5LUY8PENI8GquaXGp0Tn8ZhEMZ6Kpv8BjQUTLB6ger8ygy9eiSVJtGIRdWDzPAemBgKT4wnG5PToRn28yMTI5MppxVfqTOmIA0acV13ZVm2WDbgbYAoVtQSRf9aIUr6bcOqSbiTdEhbBMjDTfMQhaI3OuTceN6SLrgjtX16cJYx0J9P53q/ZxzN5yQIx7KUJ/aObH7hbdnNbbl8R2Qx8z02O9TuRfWpSNVqY38iQTwJh0ITCQKItQprDf9jsajmKZWDsAVUcBjy7vRdJXn5vVSkmA1txofOGhpB8J5QDAPVDQnJOHY65DqHkXzhtDS98bAgWWH0UF4N+2UtUWg0l/YcwLVBi9ZHGdQjST36VFHvJUp7UFAoqf619gIutwroBFGv5PHrIpJOCk9mSwIcuHyI7nlEqkNaXNvmJGv3sgRljcytn8IadnyKRf6epSAjwClbQgrZGYPsxJbMj3IY5RC31Dgl/vfiGpD8utr4rLk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(36840700001)(46966006)(40470700004)(33656002)(82740400003)(82310400005)(6512007)(26005)(53546011)(6486002)(6506007)(6862004)(41300700001)(356005)(478600001)(5660300002)(81166007)(4326008)(40460700003)(8676002)(2906002)(8936002)(86362001)(83380400001)(36756003)(54906003)(316002)(70206006)(40480700001)(47076005)(186003)(336012)(2616005)(36860700001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 09:29:44.0322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f85829-8d17-4c59-cf60-08da7532b32f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1919

Hi Oleksandr,

> On 29 Jul 2022, at 5:28 pm, Oleksandr <olekstysh@gmail.com> wrote:
>=20
>=20
> Hello Rahul
>=20
>=20
> On 19.07.22 20:42, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>=20
>> Add a stub for is_memory_hole which is required for PCI passthrough
>> on Arm.
>>=20
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com=
>
>> ---
>> OT: It looks like the discussion got stuck. As I understand this
>> patch is not immediately needed in the context of current series
>> as PCI passthrough is not enabled on Arm at the moment. So the patch
>> could be added later on, but it is needed to allow PCI passthrough
>> to be built on Arm for those who want to test it.
>>=20
>> Copy here some context provided by Julien:
>>=20
>> Here a summary of the discussion (+ some my follow-up thoughts):
>>=20
>> is_memory_hole() was recently introduced on x86 (see commit 75cc460a1b8c
>> "xen/pci: detect when BARs are not suitably positioned") to check
>> whether the BAR are positioned outside of a valid memory range. This was
>> introduced to work-around quirky firmware.
>>=20
>> In theory, this could also happen on Arm. In practice, this may not
>> happen but it sounds better to sanity check that the BAR contains
>> "valid" I/O range.
>>=20
>> On x86, this is implemented by checking the region is not described is
>> in the e820. IIUC, on Arm, the BARs have to be positioned in pre-defined
>> ranges. So I think it would be possible to implement is_memory_hole() by
>> going through the list of hostbridges and check the ranges.
>>=20
>> But first, I'd like to confirm my understanding with Rahul, and others.
>=20
>=20
> May I please ask about your opinion on that?

I agree with Julien we can implement the something similar to is_memory_hol=
e()  for ARM
that will check that the bar is within the bridge ranges.

If you are okay you can discard this patch in next version of the series an=
d I will push the patch
for review.

Regards,
Rahul=20

