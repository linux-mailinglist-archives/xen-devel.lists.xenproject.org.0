Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84CC5296A7
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 03:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330399.553765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqluI-0001pF-Qa; Tue, 17 May 2022 01:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330399.553765; Tue, 17 May 2022 01:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqluI-0001nR-Md; Tue, 17 May 2022 01:21:50 +0000
Received: by outflank-mailman (input) for mailman id 330399;
 Tue, 17 May 2022 01:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mpUK=VZ=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nqluH-0001nL-65
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 01:21:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7fe3dd3-d57f-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 03:21:48 +0200 (CEST)
Received: from AS8PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:20b:310::8)
 by PAXPR08MB6782.eurprd08.prod.outlook.com (2603:10a6:102:13a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 01:21:35 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::fc) by AS8PR04CA0003.outlook.office365.com
 (2603:10a6:20b:310::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Tue, 17 May 2022 01:21:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 01:21:34 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Tue, 17 May 2022 01:21:34 +0000
Received: from f0386a441de7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 587AA467-B163-43A3-99A6-46B48A56FC56.1; 
 Tue, 17 May 2022 01:21:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0386a441de7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 May 2022 01:21:24 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM8PR08MB5604.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 01:21:13 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 01:21:13 +0000
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
X-Inumbo-ID: b7fe3dd3-d57f-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UU8zH8pGgToQMOhmcnHEXFXXdio1CRPxxpQnvL5PL59q03EUJ20VKP6AyV6j9ho1kRxVAcbrbS8BrX1Ohpes4sVtx+TdLYqwOk0beaC/23TBd1k8bn9U55IVRsJhSq8t/42ALz+/pqLWPGgvXO5i+5URdpINCGTpFPIsF/lMMB9IQamKq2gk53dsQkdqj/TTnw5Ctc5bMPMGo9h+fDMKiW3p4h4vK+WNf7KWSfAJ1RPfZCtQfYXpm3OvS9BW3jViiKRfwIb+odBfnV5Li6WhnG36Ghmlq8H+awfeJe2Yok0CtZDMmbYabUiYc3ynHxtYnUh2am4bnW3YXgB8ZiRNaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYAa+r5kvkSNTBeuANzUQ4D6YWZIXz9KN2uFTzia8hw=;
 b=d0LVoNNRmyefhdsqfQtTUju5Yl3V0YeJp2B+EeqRmDY36iBITNYpoQTA4h/kL+fptlsfWdHyO4hUk82Cy+nPKC1cwLrH7MtXfLbUlgJ4R3HK07ON3TX9k+vCzf/5eb7VC49nStBtoT6oKx5R41j+d51hvPeKkA5LkC8mCU14Wyadzj2UPlwe0NKTlvEFeaLVCTS4rlTCx+R7GJ6WLRAc1DOTvdd1sonEg/uYFOLG+XaskM6Ja4PGzeJ6Sgsf5nCl2JMCKrKlB9rbhpMp9J+pWgeOn4PwDgICQq14rqrksOxtAo6ny9kYKWArwKoqtYRnmBEp1xyPPb2vCooDTsFj2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYAa+r5kvkSNTBeuANzUQ4D6YWZIXz9KN2uFTzia8hw=;
 b=6ncljqBS4xtxNrlpq0C/Em5TPeVhLmgDB/QZcH3hWsZfkw4Yjz92/8fDAXsH3QyEQHHjXzsgw+KbD09wDoovFO9kfl+pEDFPFxJZVcJIGsSzZXpGhQ4ro+WWjPL64/IvEDyAuZZz0nLUVe6wVO3GEcqs5D4/2OBhEOxsbMKSAzE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ery3EZ+yqjioBFdvvDrEAvORyyBEm2yrWqA9c6lMJRorjSSa7rr9gcs2V4okkB/6f43hnz/xu4tx3sO0xbNrqW5eaq4rtIkB+HGWFc6TfVrkMm8KAg6iYBw6GE2lRojM/XrEEUxdUHEza/jXuG7J8JX3hTHjgOPHKIxgmBeFhdMVqkrkv6sgPHprpcYsbpxGkNYq/Vl17Wd5e3SciKVELndejg1S2Y2q5xAJPrcC//iFLmLPFnipTmCAqzSsuZ4aBqL+PzDT6zYPc034aoB8SRXucI4pVnupcRK6mX6bcI4zMMlDymZtfZRisWk+8vpdiPMz9alZytH6qCx0QgKcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYAa+r5kvkSNTBeuANzUQ4D6YWZIXz9KN2uFTzia8hw=;
 b=OnLvKox8vBvG6cBZ8AxTgoCczDMuqhnXXHmmIQwy4bRjNm8L4a4+zwJCppTrnGcYPqlQIhZqQ2aWcwu3CawlfGFmiUZNF+zC/CVAfDL1PLggrQAsRMNotk5A3NJZZEz1YnL8NTivlIS+YGgGMaOWtjdk5tti7adT00YRV56jTnFME6vIBUHUwWHjIrDdAp0ZZtDq/uJ9OPzryuYwFeYCZ+EfAydrH6sqE3gr0z624WagK4lbn6iq5r65iSNp0c+ZAEukEBBkBMg4D4mMBXpdgGjwTHCz3RdW29EzkOrDmqZJHppJhoxsAm17fRCbvaSnoDrQUMjPDUxjk7mNhA2VRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYAa+r5kvkSNTBeuANzUQ4D6YWZIXz9KN2uFTzia8hw=;
 b=6ncljqBS4xtxNrlpq0C/Em5TPeVhLmgDB/QZcH3hWsZfkw4Yjz92/8fDAXsH3QyEQHHjXzsgw+KbD09wDoovFO9kfl+pEDFPFxJZVcJIGsSzZXpGhQ4ro+WWjPL64/IvEDyAuZZz0nLUVe6wVO3GEcqs5D4/2OBhEOxsbMKSAzE=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jiamei Xie <Jiamei.Xie@arm.com>, Julien Grall
	<jgrall@amazon.com>
Subject: RE: [PATCH v3 1/9] xen/arm: Print a 64-bit number in hex from early
 uart
Thread-Topic: [PATCH v3 1/9] xen/arm: Print a 64-bit number in hex from early
 uart
Thread-Index: AQHYZNkH8NyJIpE/PUu9tm96KkUvVa0hxzQAgACHh7A=
Date: Tue, 17 May 2022 01:21:13 +0000
Message-ID:
 <PAXPR08MB742021BEEA1A85BFCF2D7F3C9ECE9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-2-wei.chen@arm.com>
 <46f6a909-2f77-021c-a069-6a8f827e53fc@xen.org>
In-Reply-To: <46f6a909-2f77-021c-a069-6a8f827e53fc@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C3E6F517A834AF4DA8ED90DDBEE92748.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 42319104-0f55-4432-008b-08da37a39530
x-ms-traffictypediagnostic:
	AM8PR08MB5604:EE_|VE1EUR03FT045:EE_|PAXPR08MB6782:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6782FD433AB5E991C0BA6D4B9ECE9@PAXPR08MB6782.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4HIPGw9+Op3i8XaRtl5B3sdal1o6RbrY9TvzMg2JDikeAytOsa0L7562njkGUkJY0w89ko1o4Txnsgnv+Tkz/Hza0ojumtbxeMKoyoWXGQc1PwmWJc+kDLKkYmZZcQ8zWb4fD1ChjNGNw2arzLVS2qDe/+8Zi4YSqRWOKE58bbseFhWjAmT3dz7hHjcYtgihhzOgyZkD5PSHeF2+qn3nIisUSniHNVGLj4lc0Ak0beiQEgVaTpLdDlDEyfD8fOgj1+P/ANqOZjjKSeGU0xsh6HY94MaDDkZw5qlhZ7Kse3BkeEN1d7QCvdiN8PP9raGJJVWeAjvalo0Hma89RIQAvXgoN8uvagTfQbkpqwlyXymSTTY7xrSyuAAFGqVGFHVA0zb+eXZEVO6YmGL9PwBvEZFwXzerIkyKTpCUFxdCxPU2Yn7Ockfo/Bt8RE4Xyb3xjV4Lbg8Ycmm0D5aDoRq1q1HLPfFHf0RlsL4TD1UFQjMWJfzaq4fMvW8uuHsMZsRNUoIRbKuSmdC3jTzbsbp4vKcIgpuLvVJnB7+XcvGlgTmYrYWoOnLQnFCda9r/sP+kVDrb5qEifh+KpuzLZjghywWC5sjpnWttEeg1XuTVF/szNhoMHeUOznOn+mpxhfRxviD777VsNSAylRmtK1kSEFyT8T2szB+sKrP3Bd1gzWwp0mIdvgksdOkybIDKU7P4VVmt5aZi0DwA3T7F1kySWQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(33656002)(508600001)(110136005)(55016003)(71200400001)(4326008)(76116006)(64756008)(66556008)(66446008)(66946007)(54906003)(66476007)(2906002)(7696005)(6506007)(9686003)(8676002)(122000001)(86362001)(186003)(316002)(26005)(8936002)(83380400001)(5660300002)(38070700005)(38100700002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5604
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	760de866-5b70-4e68-42b2-08da37a3887b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xrjH83oiEZ4KyUhhbMoyKs2Dw1WCBKC/a9Cl9dY/x9vvnL4SqtspojIIp+sVw+ge5JQgP2eZSenRoIzS55LoRD9COqVZi4oMC7C7fkvzo2XwQ24ZAbNFG5fVlAz3uhiHB4ypMdndX8UxOgv3Z70HXQdnuyJaFof2xBay1YUYYRNrfgUAe8C3xr7i7jCCsVUSk3OoNDffHdAl5iIzCHrm4cyakMG7LFQmjewPagXnewmODVKZOOwnLHg4zCab36mZdEwbvlUeZ7XUHmExzCxtNE91byz6M3tHsnUMRFog7LJ9pflrxU1SZIEzuv4a6SPWx6ZXeH0lBdyy+062es2ChtixxYlkxnThhIXxf34yempfg/9mSkpYKDDrth9LoLUVcqGXGU8Qg+EX/GSXyb2uOL18hjRZZdKOQt3GoHFHkApSNpVXTdlS1LinzdjYkCi2/gHPvSbZnPBmaKUn5raiDtEP5N3hOOXY4kVuN8aGHLfInSdNiDxvIrp0XZXP48z6mRkkbN+ZFZ/Ms106y9ZFzlvQ8K32jFqPoI2HIm7M6MyedbdjlxHggmA+F7tFV223WYzgG72B1qmqrRJ86Obw+Ew7bd7KftUSX4TVQwZGb8EIN4t4Ncb8Yb9zkG/pZDj7hGU103ol05L3WBBwoma4IbQMJ68AOPtP0nS5szn6MWh6t9ZeHZmoQdF9f2XhxYjk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(110136005)(81166007)(8676002)(54906003)(186003)(4326008)(316002)(5660300002)(40460700003)(6506007)(33656002)(107886003)(53546011)(55016003)(26005)(70586007)(70206006)(2906002)(9686003)(52536014)(7696005)(8936002)(36860700001)(82310400005)(336012)(356005)(86362001)(83380400001)(47076005)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 01:21:34.7556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42319104-0f55-4432-008b-08da37a39530
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6782

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQ15pyIMTfml6UgMToxNQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQNCj4gTWFycXVpcyA8QmVydHJhbmQuTWFycXVp
c0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPjsgSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgSnVsaWVuDQo+IEdyYWxsIDxq
Z3JhbGxAYW1hem9uLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzldIHhlbi9hcm06
IFByaW50IGEgNjQtYml0IG51bWJlciBpbiBoZXggZnJvbQ0KPiBlYXJseSB1YXJ0DQo+IA0KPiBI
aSwNCj4gDQo+IE9uIDExLzA1LzIwMjIgMDI6NDYsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEN1cnJl
bnQgcHV0biBmdW5jdGlvbiB0aGF0IGlzIHVzaW5nIGZvciBlYXJseSBwcmludA0KPiA+IG9ubHkg
Y2FuIHByaW50IGxvdyAzMi1iaXQgb2YgQUFyY2g2NCByZWdpc3Rlci4gVGhpcw0KPiA+IHdpbGwg
bG9zZSBzb21lIGltcG9ydGFudCBtZXNzYWdlcyB3aGlsZSBkZWJ1Z2dpbmcNCj4gPiB3aXRoIGVh
cmx5IGNvbnNvbGUuIEZvciBleGFtcGxlOg0KPiA+IChYRU4pIEJyaW5naW5nIHVwIENQVTUNCj4g
PiAtIENQVSAwMDAwMDAwMTAwMDAwMTAwIGJvb3RpbmcgLQ0KPiA+IFdpbGwgYmUgdHJ1bmNhdGVk
IHRvDQo+ID4gKFhFTikgQnJpbmdpbmcgdXAgQ1BVNQ0KPiA+IC0gQ1BVIDAwMDAwMTAwIGJvb3Rp
bmcgLQ0KPiA+DQo+ID4gSW4gdGhpcyBwYXRjaCwgd2UgaW5jcmVhc2VkIHRoZSBwcmludCBsb29w
cyBhbmQgc2hpZnQNCj4gPiBiaXRzIHRvIG1ha2UgcHV0biBwcmludCA2NC1iaXQgbnVtYmVyLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4g
VGVzdGVkLWJ5OiBKaWFtZWkgWGllIDxqaWFtZWkueGllQGFybS5jb20+DQo+ID4gQWNrZWQtYnk6
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IA0KPiBJIGhhdmUgY29tbWl0dGVk
IHRoaXMgcGF0Y2guDQo+IA0KPiBQYXRjaCAjMyBsb29rcyB0byBiZSBzdWl0YWJseSBhY2tlZCBi
dXQgSSBhbSBub3Qgc3VyZSB3aGV0aGVyIGl0IGNhbiBiZQ0KPiBjb21taXR0ZWQgYmVmb3JlICMy
LiBTbyBJIGRpZG4ndCBjb21taXQgaXQuDQo+IA0KDQpObywgaXQgZGVwZW5kcyBvbiBwYXRjaCMy
IHRvIHByb3ZpZGUgRUZJIHN0dWJzIGZvciBBcm0zMiwgb3RoZXJ3aXNlDQpBcm0zMiB3aWxsIGJl
IGZhaWxlZCBvbiBidWlsZGluZy4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiBQbGVhc2UgbGV0
IG1lIGtub3cgaWYgaXQgY2FuIGJlLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVu
IEdyYWxsDQo=

