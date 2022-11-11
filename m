Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5986257B4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 11:14:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442409.696555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otR2j-00073M-JW; Fri, 11 Nov 2022 10:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442409.696555; Fri, 11 Nov 2022 10:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otR2j-000712-GS; Fri, 11 Nov 2022 10:13:49 +0000
Received: by outflank-mailman (input) for mailman id 442409;
 Fri, 11 Nov 2022 10:13:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Waqq=3L=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1otR2h-00070t-Kq
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 10:13:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86b96ee4-61a9-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 11:13:46 +0100 (CET)
Received: from FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::11)
 by DU0PR08MB7740.eurprd08.prod.outlook.com (2603:10a6:10:3bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:13:43 +0000
Received: from VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::7) by FR3P281CA0108.outlook.office365.com
 (2603:10a6:d10:a3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 11 Nov 2022 10:13:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT016.mail.protection.outlook.com (100.127.144.158) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 10:13:42 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 11 Nov 2022 10:13:42 +0000
Received: from 5417698481b3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CA2C238-E79B-4AAF-97C8-091D6E9F04F5.1; 
 Fri, 11 Nov 2022 10:13:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5417698481b3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 10:13:36 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM7PR08MB5317.eurprd08.prod.outlook.com (2603:10a6:20b:101::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:13:35 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 10:13:35 +0000
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
X-Inumbo-ID: 86b96ee4-61a9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KJD2ychhI913e0Y3e3bDp3TmZENAb7zkUWzBjTy/uvMBIHJI5v+rIpmC6h6W0z7K6smlP3qoe0NoYmkc/elpidhUE7oo/fHuQatfGea0KbSzJHh64KJIqy1gfARdtbFgeUvgc1P4CxBcEsV+U96SLN/D/NBXxDzsiJQakrMe43qL9rjhsunI1oEkDU8M+444zQ5f1a5UCkOHyJi7BKMWS7U8xYrm1h0TQnGnQ7wq19IN9XgQvxXhUN4kPQKHmUYzz2O7N9I2mmM6I4R51vYc1K2nZ7+SGwgFqAGHiFCK1dRpEzoKkcHjwi7mFHeKDGbKdtO2opbdN0Y2ljErhNQvew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBH9rh7P9eM9JZEnhJuEPOHZEq+2CEa1iYUBDb3Vjuo=;
 b=FUrpU/U5X1MgyTEDsnBR/5dILVbIEgoxx0xkc1wlbqSkP9YZi2C/tEVx0sLuBBDz6nDxlGXnVGBZb0FfbrwUV6dd641es5L6AHb/Rn0ck5e6/9WaLFpq2IE9X2VZmaxzw9SYS1eorS8jWhH3k+1ZHgkn3C7lsf5mHI9am5sEtREBXghxf9LdkrYqfZgR/ShiLeMFGn69F53/GIzBiKWGUPw34iW3yMR7xZfvbIYxFu0v1ce4ctJ9hkBd28S2fOwuVwoV9S6AZ3aiccC/vK8iqxZFjkMl3NmsLs1wIkrj31N2ffy077UGrYkLROaej6XsV+lUDCcQfWXZyLR3nt72XA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBH9rh7P9eM9JZEnhJuEPOHZEq+2CEa1iYUBDb3Vjuo=;
 b=QBA7kFjy3HYXCTDiJtbUdSd+T1ouTY0BpxQhKsQy5XVbXwgHiVXv+IrX6BFGDnpvZGwd7F+RfmnumLhUPPAorVncbfXzUGJqDDCH+qYYMqusXd3k7GaqTwGcAjjimATxqtR6nfSy3CWVRQaH0A1ONL682zWF+ueg//4vFWB+rGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8gNETefFrMXC35elVBSb46YtgXX/KQU535bsFgZQCoAi+opiyUrhU5Osfcz7tkf9PKYQbhcfqytdnev7CamplpNFEFqG6np2N0hJBIT/GM27LYGPOQRqRcgCy1zibJFy15PBJEftNWuw8PBiE93PX/lZCtIEkbZF5IBNudHN1UapwBYNJxsDJ6oi//5bc2HS/IWZIfSMqnvWDPXMdRr2FNRiD+qXwlPSYck+Auuaoi8WLhh6wfJeRDWz0zUtt9RqkXijbBFtf3b91So4X9cBT4ZYKYybCINgh/V9AAi9B7YHIssFvDOlIJN+JReWE08mJ2RWebpAwTaqRxCSjHhaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBH9rh7P9eM9JZEnhJuEPOHZEq+2CEa1iYUBDb3Vjuo=;
 b=B/MjBlI1EQsPa2gW6uBC93bNmej/ijHR9+tgeCnRNO9CkKyk+Io6jO9Qr8egY17FjdjeA/36lfqw2ZvzuXfYyo7z7cxEqMENPSestbgu6MBKIhIu01ZilCVJVuIqRSdELnzcAPvmmfjOGRTc0S6p8KqvXWJCY2F+lwKjz3w1FcHzKE2ganqkajXBTV+V1GmztfXPTxkgpkPSGO0q0CWxOY5wEAubCoO3RUUBND5xUCIvFwJnJohZ5k5OPKpsGPN0MUJFCZH4HBN6VoTsLkTgGPkXPjQRq+j5SbiO8iAdGwR8KbdQn510bCh04Lsq5pnp8hgMrhKNLPd6u8ZZKJq8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBH9rh7P9eM9JZEnhJuEPOHZEq+2CEa1iYUBDb3Vjuo=;
 b=QBA7kFjy3HYXCTDiJtbUdSd+T1ouTY0BpxQhKsQy5XVbXwgHiVXv+IrX6BFGDnpvZGwd7F+RfmnumLhUPPAorVncbfXzUGJqDDCH+qYYMqusXd3k7GaqTwGcAjjimATxqtR6nfSy3CWVRQaH0A1ONL682zWF+ueg//4vFWB+rGI=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd
	<nd@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jiamei Xie <Jiamei.Xie@arm.com>
Subject: RE: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
Thread-Topic: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
Thread-Index: AQHY8DVkWYjGQuvcKkq0uEcag43TF64ySPmAgAO1+zCAAPGnAIAB0gYAgAC9l7A=
Date: Fri, 11 Nov 2022 10:13:34 +0000
Message-ID:
 <PAXPR08MB7420EFE8FD44EAD0DC4321E19E009@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-6-wei.chen@arm.com>
 <0ffe8a4d-7caf-89af-d189-a872b6b4f0fa@xen.org>
 <PAXPR08MB7420A3A20199F477622EB7099E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e2a1233c-c001-9553-7abe-de97e96a650e@xen.org>
 <alpine.DEB.2.22.394.2211101358090.50442@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211101358090.50442@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 572198DB5C01B24EB0BC00FE0235931E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AM7PR08MB5317:EE_|VI1EUR03FT016:EE_|DU0PR08MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: f538b5eb-5cc2-4ec9-d79f-08dac3cd6976
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hs8om6YC8Yj7FYRtlV7Wq7pJcC3bVM4XoSlxpED9ObxzUKMxGDYrA3z8e6IHHdeph0IS1y9Uc1lK/Rmk69iWSp+4HbaxJlPhLtPreMWk1DaIH02JgnGV30onaS4cSnQUnzXrwJi2OluMBMTRuGTUVmtHTTxYUUWtoLwSrncxGJC2slLpEPr4duzymSc65wX39Jw0M4xfp2RN7KaEzjuhR/3GP5YF+yDzR3zO3I39OK2bcnlpiGSQheyRQ8ntaFpCkI6oqUNtrkCMNSKIWMiAzV6G6WPMebw/3GZDknsOrPwgfSX55cPRdaxonK9POue44ePUPVd2szX+2mM32KaQLi0D7uZz9DRpLw5PwvAOjLmlfcc395dqteHErrIzjuVVygRaMkt5U2NWho8rKTO4vw6ozjQpc8owyGtFdRLVCVYWJn7WQwJj7J/QtCeXRP47edzxIMLgZ47gDviU5Rgv+k+QBLK94oCymcDdUgIBF+6DPU9vZYpgrkE3VXEdQksnit2i9fpWNPbqHTpImC99Ypxe0W5UQFXvSc/EtfrNaXZHJ5KF2x5AXaxfnwuj7h9+xrLwBpojAu2Io1SZfU+/UJEoVoTxpJ+KQNW2fPI+Zh6p0bCzXjldCInY5Ik11XBwO0Hsk0qjddAYUX1A9jwLi49wQuwzZHWYJZDc+Uo303m8ugqNtI133OielwLWGaTVWyFaiTl5ER3eTuLYqY68xz/9Y9p/R9CfU9/b6mLZ2kAW2cRKSh1M8y/vfcRuPX/njE4AoAKbQK2NP/SjwBAiLQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(38070700005)(316002)(478600001)(33656002)(9686003)(86362001)(2906002)(122000001)(41300700001)(186003)(53546011)(52536014)(5660300002)(66476007)(76116006)(71200400001)(6506007)(54906003)(66946007)(7696005)(66446008)(64756008)(38100700002)(26005)(66556008)(83380400001)(55016003)(8936002)(110136005)(4326008)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5317
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1eab6355-bc69-4467-8b0e-08dac3cd6498
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pglp98k9ybZTgmyvmQS0fv1e4ZmiuE6nNvpUwPHCJ7zgiLWT+WXSr3k7ou8Pp0oGvLIf6xytSYv7ceNgJGuOLzPy8Aj4NPQp9PpCgKVZ6FaAzejdiOI/P0AlGqUbGCFLeF4ATI348z00GwiIgyxi6d+NbtAwXMo5w8cUJUZVoYANEGRG94YZzIyzsMY9cGGRJC7jpCkxVwE2SvDbmQPyrLI7PhQ7/X4MQVkfUJpYQCSlUlQyNODW7Wi37cx6rPVNbDHbkF3S4uR95kT+vch5r8TSukvv1vinwuhxa5CGKiQjwtXsGFXjTKiS7wyUHaiUCHfjwgLmqd7Ce0t627ybidjHyP05pnSBXrG6TCBXBl5W7vlTuTkyfN2bDNmppD5kSQhOhAId6ZTm4d9KzD2cE6SVmC/1dJC34uLV84Fg5I1JtR5vZaPXtvRExHoSBdSJm7qmd5YU5q08BODjkIrv7zhilj6fWmqVJhYyhKsETjPOM/rR4UCV9VlfhAS9BfvMiZOQfcr41YVJX2/pfKmqAXzYouIsPIDilksehAgfuxcIbmVqA7v6L6jw+SJ9bWYwBF+u/paINYxsQBSUYMdmDDvfU/H/ZsNAwQ9qOWTFjUfER8nfAqLZlr/6n4cCSCVwyecUMZklMuFyfzLES926ErFbp141P1EjIxuVkd4tLzN5t27SFMeI12NlcvART1loi/Kh9FjhY4RDsay6XYUx/o453B2cJegy4DQJgocDJB8KElVGL+puanCsB1jvXuE3GtNoXqR3Mz7Sr209bjGWPA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(82740400003)(2906002)(40460700003)(81166007)(33656002)(356005)(6506007)(7696005)(70206006)(4326008)(82310400005)(86362001)(41300700001)(47076005)(336012)(8936002)(186003)(36860700001)(83380400001)(53546011)(5660300002)(54906003)(52536014)(70586007)(316002)(478600001)(9686003)(8676002)(110136005)(26005)(40480700001)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:13:42.9892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f538b5eb-5cc2-4ec9-d79f-08dac3cd6976
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7740

SGkgU3RlZmFubywgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9u
IEJlaGFsZiBPZg0KPiBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gU2VudDogMjAyMuW5tDEx5pyIMTHm
l6UgNjoxMw0KPiBUbzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gQ2M6IFdlaSBD
aGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBu
ZA0KPiA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZv
bG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEppYW1laSBY
aWUgPEppYW1laS5YaWVAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0g
eGVuL2FybTogZGVmaW5lIFhlbiBzdGFydCBhZGRyZXNzIGZvciBGVlANCj4gQmFzZVIgcGxhdGZv
cm0NCj4gDQo+IE9uIFdlZCwgOSBOb3YgMjAyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiBGcm9tOiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPg0KPiA+ID4gPiBTZW50OiAyMDIy5bm0MTHmnIg35pelIDM6MjANCj4g
PiA+ID4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+ID4gPiA+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+IEJlcnRyYW5kDQo+ID4gPiA+IE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+ID4gPiA+
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJt
LmNvbT4NCj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0geGVuL2FybTogZGVm
aW5lIFhlbiBzdGFydCBhZGRyZXNzIGZvcg0KPiBGVlANCj4gPiA+ID4gQmFzZVIgcGxhdGZvcm0N
Cj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gT24gMDQvMTEvMjAyMiAxMDowNywg
V2VpIENoZW4gd3JvdGU6DQo+ID4gPiA+ID4gT24gQXJtdjgtQSwgWGVuIGhhcyBhIGZpeGVkIHZp
cnR1YWwgc3RhcnQgYWRkcmVzcyAobGluayBhZGRyZXNzDQo+ID4gPiA+ID4gdG9vKSBmb3IgYWxs
IEFybXY4LUEgcGxhdGZvcm1zLiBJbiBhbiBNTVUgYmFzZWQgc3lzdGVtLCBYZW4gY2FuDQo+ID4g
PiA+ID4gbWFwIGl0cyBsb2FkZWQgYWRkcmVzcyB0byB0aGlzIHZpcnR1YWwgc3RhcnQgYWRkcmVz
cy4gU28sIG9uDQo+ID4gPiA+ID4gQXJtdjgtQSBwbGF0Zm9ybXMsIHRoZSBYZW4gc3RhcnQgYWRk
cmVzcyBkb2VzIG5vdCBuZWVkIHRvIGJlDQo+ID4gPiA+ID4gY29uZmlndXJhYmxlLiBCdXQgb24g
QXJtdjgtUiBwbGF0Zm9ybXMsIHRoZXJlIGlzIG5vIE1NVSB0byBtYXANCj4gPiA+ID4gPiBsb2Fk
ZWQgYWRkcmVzcyB0byBhIGZpeGVkIHZpcnR1YWwgYWRkcmVzcyBhbmQgZGlmZmVyZW50IHBsYXRm
b3Jtcw0KPiA+ID4gPiA+IHdpbGwgaGF2ZSB2ZXJ5IGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlIGxh
eW91dC4gU28gWGVuIGNhbm5vdCB1c2UNCj4gPiA+ID4gPiBhIGZpeGVkIHBoeXNpY2FsIGFkZHJl
c3Mgb24gTVBVIGJhc2VkIHN5c3RlbSBhbmQgbmVlZCB0byBoYXZlIGl0DQo+ID4gPiA+ID4gY29u
ZmlndXJhYmxlLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU28gaW4gdGhpcyBwYXRjaCwgd2UgcmV1
c2UgdGhlIGV4aXN0aW5nIGFybS9wbGF0Zm9ybXMgdG8gc3RvcmUNCj4gPiA+ID4gPiBBcm12OC1S
IHBsYXRmb3JtcycgcGFyYW1ldGVycy4gQW5kIGBYRU5fU1RBUlRfQUREUkVTU2AgaXMgb25lDQo+
ID4gPiA+ID4ga2luZCBvZiBGVlAgQmFzZVIgcGxhdGZvcm0ncyBwYXJhbWV0ZXJzLiBTbyB3ZSBk
ZWZpbmUgZGVmYXVsdA0KPiA+ID4gPiA+IGBYRU5fU1RBUlRfQUREUkVTU2AgZm9yIEZWUCBCYXNl
UiBpbiBpdHMgcGxhdGZvcm0gZmlsZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdlIGFsc28gaW50
cm9kdWNlIG9uZSBLY29uZmlnIG9wdGlvbiBmb3IgdXNlcnMgdG8gb3ZlcnJpZGUgdGhlDQo+ID4g
PiA+ID4gZGVmYXVsdCBYZW4gc3RhcnQgYWRkcmVzcyBvZiBzZWxlY3RlZCBwbGF0Zm9ybSwgaWYg
dGhleSB0aGluaw0KPiA+ID4gPiA+IHRoZSBkZWZhdWx0IGFkZHJlc3MgZG9lc24ndCBzdWl0IHRo
ZWlyIHNjZW5hcmlvcy4gRm9yIHRoaXMNCj4gPiA+ID4gPiBLY29uZmlnIG9wdGlvbiwgd2UgdXNl
IGFuIHVuYWxpZ25lZCBhZGRyZXNzICIweGZmZmZmZmZmIiBhcyB0aGUNCj4gPiA+ID4gPiBkZWZh
dWx0IHZhbHVlIHRvIGluZGljYXRlIHRoYXQgdXNlcnMgaGF2ZW4ndCB1c2VkIGEgY3VzdG9taXpl
ZA0KPiA+ID4gPiA+IFhlbiBzdGFydCBhZGRyZXNzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQW5k
IGFzIHdlIGludHJvZHVjZWQgQXJtdjgtUiBwbGF0Zm9ybXMgdG8gWGVuLCB0aGF0IG1lYW5zIHRo
ZQ0KPiA+ID4gPiA+IGV4aXN0ZWQgQXJtNjQgcGxhdGZvcm1zIHNob3VsZCBub3QgYmUgbGlzdGVk
IGluIEFybXY4LVIgcGxhdGZvcm0NCj4gPiA+ID4gPiBsaXN0LCBzbyB3ZSBhZGQgIUFSTV9WOFIg
ZGVwZW5kZW5jeSBmb3IgdGhlc2UgcGxhdGZvcm1zLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogSmlhbWVpLlhpZSA8amlhbWVpLnhpZUBhcm0uY29tPg0KPiA+ID4gPiA+IC0tLQ0K
PiA+ID4gPiA+ICAgIHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMSArKysrKysrKysrKw0KPiA+ID4gPiA+ICAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9wbGF0Zm9ybXMvZnZwX2Jhc2VyLmggfCAxNA0KPiArKysrKysrKysrKysrKw0KPiA+ID4gPg0K
PiA+ID4gPiBJIGxvb2tlZCBhdCB0aGUgY29udGVudCBvZiBmdnBfYmFzZXIuaCBhZnRlciB0aGlz
IHNlcmllcyBpcyBhcHBsaWVkLg0KPiA+ID4gPiBUaGVyZSBhcmUgYSBiaXQgb2YgYm9pbGVyIHBs
YXRlIHRoYXQgSSBleHBlY3QgdG8gYmUgcGFydCBmb3Igb3RoZXINCj4gPiA+ID4gcGxhdGZvcm1z
LiBJbiBwYXJ0aWN1bGFyLi4uDQo+ID4gPiA+DQo+ID4gPiA+ID4gICAgeGVuL2FyY2gvYXJtL3Bs
YXRmb3Jtcy9LY29uZmlnICAgICAgICAgICAgICAgICB8IDE2DQo+ICsrKysrKysrKysrKystLS0N
Cj4gPiA+ID4gPiAgICAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+ID4gPiA+ID4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IHhlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9wbGF0Zm9ybXMvZnZwX2Jhc2VyLmgNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+
ID4gPiA+ID4gaW5kZXggYWQ1OTIzNjdiZC4uYWMyNzYzMDdkNiAxMDA2NDQNCj4gPiA+ID4gPiAt
LS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9L
Y29uZmlnDQo+ID4gPiA+ID4gQEAgLTEzOCw2ICsxMzgsMTcgQEAgY29uZmlnIFRFRQ0KPiA+ID4g
PiA+ICAgIAkgIFRoaXMgb3B0aW9uIGVuYWJsZXMgZ2VuZXJpYyBURUUgbWVkaWF0b3JzIHN1cHBv
cnQuIEl0IGFsbG93cw0KPiA+ID4gPiBndWVzdHMNCj4gPiA+ID4gPiAgICAJICB0byBhY2Nlc3Mg
cmVhbCBURUUgdmlhIG9uZSBvZiBURUUgbWVkaWF0b3JzIGltcGxlbWVudGVkIGluDQo+ID4gPiA+
ID4gWEVOLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gK2NvbmZpZyBYRU5fU1RBUlRfQUREUkVTUw0K
PiA+ID4gPiA+ICsJaGV4ICJYZW4gc3RhcnQgYWRkcmVzczoga2VlcCBkZWZhdWx0IHRvIHVzZSBw
bGF0Zm9ybSBkZWZpbmVkDQo+ID4gPiA+IGFkZHJlc3MiDQo+ID4gPiA+ID4gKwlkZWZhdWx0IDB4
RkZGRkZGRkYNCj4gPiA+ID4NCj4gPiA+ID4gLi4uIHRoaXMgZGVmYXVsdCB2YWx1ZSB3aWxsIG5l
ZWQgdG8gYmUgdGVzdGVkIGV2ZXJ5d2hlcmUuIEF0IGxlYXN0DQo+IGZvcg0KPiA+ID4gPiBub3cs
IEkgdGhpbmsgeW91IGNhbiBhdm9pZCB0aGUgcGVyIHBsYXRmb3JtIGhlYWRlciBieSB1c2luZyB0
aGUNCj4gS2NvbmZpZw0KPiA+ID4gPiB0byBzZWxlY3QgdGhlIHByb3BlciBhZGRyZXNzIChzZWUg
dGhlIGNvbmZpZyBmb3Igc2VsZWN0aW5nIGVhcmx5DQo+IHByaW50aw0KPiA+ID4gPiBhZGRyZXNz
KS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyB3aWxsIGFsc28gYXZvaWRzIHRvIHVzZSBhbiBpbnZh
bGlkIHZhbHVlIGhlcmUuDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gV2UgaGFkIGNvbnNpZGVyZWQg
dG8gdXNlIEtjb25maWcgdG8gZGVmaW5lIHRoZSBzdGFydCBhZGRyZXNzZXMgb2YNCj4gdjhSNjQN
Cj4gPiA+IHBsYXRmb3JtcyAocHJvbXB0IHVzZXJzIHRvIGlucHV0IHRoZSBhZGRyZXNzKS4gQnV0
IHdlIGFsc28gd2FudCB0bw0KPiBwcm92aWRlDQo+ID4gPiBhIGRlZmF1bHQgc3RhcnQgYWRkcmVz
cyBmb3IgZWFjaCBwbGF0Zm9ybSAoRGlzY3Vzc2VkIGluIFsxXSwgaGVhZGVyDQo+IGZvcg0KPiA+
ID4gZGVmYXVsdCB2YWx1ZSwgS2NvbmZpZyBvcHRpb24gZm9yIGN1c3RvbWl6ZWQgYWRkcmVzcyku
DQo+ID4gV2h5IGRvIHlvdSB3YW50IHRvIHByb3ZpZGUgYSBkZWZhdWx0IHZhbHVlPyBBbmQgaG93
IGl0IGlzIGd1YXJhbnRlZWQNCj4gdGhhdCBpdA0KPiA+IHdpbGwgd29yayBmb3IgbW9zdCBvZiB0
aGUgdXNlcnM/DQo+ID4NCj4gPiA+DQo+ID4gPiBXZSBhbHNvIGhhZCB0aG91Z2h0IHRvIHVzZSBL
Y29uZmlnIHRvIGRlZmluZSBhIGRlZmF1bHQgc3RhcnQgYWRkcmVzcw0KPiA+ID4gZm9yIGVhY2gg
cGxhdGZvcm0gbGlrZSB3aGF0IHdlIGhhZCBkb25lIGZvciBlYXJseSBwcmludGsgaW4gUkZDWzJd
Lg0KPiA+ID4gQnV0IHRoaXMgbWV0aG9kIGhhcyBiZWVuIGRlcHJlY2F0ZWQuDQo+ID4NCj4gPiBN
b3N0IG9mIHRoZSBjdXJyZW50IFhlbiBpcyBib2FyZCBhZ25vc3RpYyBleGNlcHQgdGhlIFVBUlQu
IFdlIHB1c2ggYmFjaw0KPiB0aGUNCj4gPiBhZGRpdGlvbiBvZiBuZXcgb25lIGJlY2F1c2UgdGhl
IGFkZHJlc3MgY2FuIGJlIGZvdW5kIGluIHRoZSBmaXJtd2FyZQ0KPiB0YWJsZSBhbmQNCj4gPiBJ
IHdhbnRlZCB0byBhdm9pZCBpbmNyZWFzZSB0aGUgbnVtYmVyIG9mIG9wdGlvbiAodGhlcmUgYXJl
IGRvemVucyBvZg0KPiBwbGF0Zm9ybQ0KPiA+IG91dC4uLikuDQo+ID4NCj4gPiA+DQo+ID4gPiBT
byBpZiB3ZSBkb27igJl0IHVzZSBoZWFkZXIgZmlsZXMsIGp1c3QgdXNlIHRoZSBLY29uZmlnLCB3
ZSBjYW4ndA0KPiA+ID4gcHJvdmlkZSBhIGRlZmF1bHQgc3RhcnQgYWRkcmVzcyBmb3IgcGxhdGZv
cm1zLCBhbmQgaGF2ZSB0byBmb3JjZSB1c2Vycw0KPiA+ID4gdG8gZW50ZXIgdGhlIHN0YXJ0IGFk
ZHJlc3MuDQo+ID4NCj4gPiBJIGFtIG5vdCBzdXJlIEkgc2VlIHRoZSBwcm9ibGVtIHRvIGZvcmNl
IHRoZSB1c2VyIHRvIGVudGVyIHRoZSBzdGFydA0KPiBhZGRyZXNzLg0KPiA+IE15IHdvcnJ5IHdp
dGggcGVyLXBsYXRmb3JtIGRlZmF1bHQgdmFsdWUgaXMgd2UgZW5kIHVwIHRvIGZvcmNlIGVhY2gN
Cj4gdmVuZG9yIHRvDQo+ID4gcHJvdmlkZSBhbiBoZWFkZXIgaW4gb3JkZXIgdG8gYm9vdCBYZW4u
DQo+ID4NCj4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBwcm92aWRlIGEgY29uZmln
IHRhaWxvcmVkIGZvciB0aGF0DQo+IHBsYXRmb3JtDQo+ID4gKHdoZXRoZXIgaXQgaXMgcGFydCBv
ZiBYZW4gY2FuIGJlIGRlYmF0YWJsZSkuIFRoaXMgd291bGQgYWxsb3cgYSB1c2VyIHRvDQo+IHRy
eSBhDQo+ID4gcmVsZWFzZSBYZW4gb24gdGhlaXIgcGxhdGZvcm0gd2l0aCB6ZXJvIGNoYW5nZXMg
aW4gdGhlIGNvZGUuDQo+IA0KPiBJIGFncmVlIHdpdGggSnVsaWVuLCBlc3BlY2lhbGx5IG9uIHRo
aXMgbGFzdCBwb2ludC4NCj4gDQo+IE9mIGNvdXJzZSB3ZSBuZWVkIGEgZGVmYXVsdCBjb25maWd1
cmF0aW9uIGZvciBhIGdpdmVuIHBsYXRmb3JtLCB3ZSBkb24ndA0KPiB3YW50IGV2ZXJ5IHVzZXIg
b2YgdGhlIHNhbWUgcGxhdGZvcm0gdG8gaGF2ZSB0byBnbyBhbmQgbG9vayBhdCB0aGUNCj4gbWFu
dWFsIHRvIGZpbmQgdGhlIHJpZ2h0IGFkZHJlc3MgdG8gdXNlLg0KPiANCj4gVGhlIHF1ZXN0aW9u
IGlzIHdoZXJlIHRvIHB1dCB0aGUgcGVyLXBsYXRmb3JtIGRlZmF1bHQgdmFsdWUuIFRoZSBrY29u
ZmlnDQo+ICJkZWZhdWx0IiBrZXl3b3JkIGlzIG5vdCBncmVhdCBmb3IgdGhhdCBhbmQgaXQgaXMg
bm90IHJlYWxpc3RpYyB0byBoYXZlDQo+IGEgc2luZ2xlIGFkZHJlc3MgdGhhdCB3b3JrcyBldmVy
eXdoZXJlLg0KPiANCj4gSW5zdGVhZCwgd2UgY291bGQgaGF2ZSBhIHByZXBvcHVsYXRlZCBrY29u
ZmlnIHVuZGVyDQo+IHhlbi9hcmNoL2FybS9jb25maWdzLCBvciBzb21ldGhpbmcgdW5kZXIgSW1h
Z2VCdWlsZGVyLCBvciBtYXliZSBleHBhbmQNCg0KRG8geW91IG1lYW4gd2UgY2FuIGtlZXAgYSBj
b25maWcgbGlrZSBhcm12OHJfZnZwX2Jhc2VyX2NvbmZpZyBpbg0KeGVuL2FyY2gvYXJtL2NvbmZp
Z3MgZm9yIHVzZXJzIHRvIGdlbmVyYXRlIGEgZGVmYXVsdCBjb25maWc/DQpJZiB5ZXMgSSB0aGlu
ayB0aGlzIG1ldGhvZCBtaWdodCBiZSBiZXR0ZXIgZm9yIG5vdy4gQW5kIGFib3V0IEltYWdlQnVp
bGRlcg0Kc29sdXRpb24gd2UgY2FuIGRvIGl0IGFmdGVyIE1QVSBzdXBwb3J0IGJlIG1lcmdlZD8N
Cg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiB0aGUgZXhpc3RpbmcgIlBsYXRmb3JtIFN1cHBvcnQi
IGtjb25maWcgbWVudS4NCj4gDQo+IElmIHRoaXMgd2FzIGp1c3QgWEVOX1NUQVJUX0FERFJFU1Ms
IEkgd291bGQgc3VnZ2VzdCB0byBrZWVwIGl0IGluDQo+IHhlbi5naXQgc29tZXdoZXJlLiBCdXQg
Z2l2ZW4gdGhhdCB0aGVyZSBhcmUgYSBmZXcgYWRkcmVzc2VzIGFuZCBzaXplcyB0bw0KPiBwcm92
aWRlL2NhbGN1bGF0ZSBmb3IgWGVuIG9uIE1QVSB0byB3b3JrLCB1c2luZyBJbWFnZUJ1aWxkZXIg
Y291bGQgYmUgYQ0KPiBnb29kIGlkZWEuDQoNCg==

