Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614365598AB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 13:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355466.583139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4hga-00044K-CW; Fri, 24 Jun 2022 11:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355466.583139; Fri, 24 Jun 2022 11:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4hga-00041y-9V; Fri, 24 Jun 2022 11:41:16 +0000
Received: by outflank-mailman (input) for mailman id 355466;
 Fri, 24 Jun 2022 11:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5tQ=W7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o4hgY-00041s-Rk
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 11:41:15 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20054.outbound.protection.outlook.com [40.107.2.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c2efe8e-f3b2-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 13:41:13 +0200 (CEST)
Received: from AM7PR03CA0002.eurprd03.prod.outlook.com (2603:10a6:20b:130::12)
 by AS8PR08MB7989.eurprd08.prod.outlook.com (2603:10a6:20b:541::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Fri, 24 Jun
 2022 11:41:10 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::bb) by AM7PR03CA0002.outlook.office365.com
 (2603:10a6:20b:130::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 24 Jun 2022 11:41:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 11:41:10 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Fri, 24 Jun 2022 11:41:09 +0000
Received: from adf84b4f8c51.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02AE1CBC-2DF2-4A35-B0FD-C70863F5293F.1; 
 Fri, 24 Jun 2022 11:40:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id adf84b4f8c51.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Jun 2022 11:40:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU2PR08MB7254.eurprd08.prod.outlook.com (2603:10a6:10:2d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 11:40:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 11:40:55 +0000
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
X-Inumbo-ID: 8c2efe8e-f3b2-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Mp4kVlEVW8U+2HPzPCMlM4bjrvlp+QXmjmd3gPsKJlsIoyMTuZnkCzRLxejDHDRfNEdu5lyyu+1sNzYovo5dLw6P4DRynu+GtgnYMPXX+8xgFsW0sp7W0RhuAHAD/0ZzASOx/OuNURRUnFP/T9L191uORu0R2nDPnA+b7uyqtMmxHUx1cj/lYthp3OM+5wRISFiFDG1YBhHeJKOAZon+N2eQVlmX5zcPCfuiBuPJpGGTbd4IhJ7iihdOCW011xmAN5tDJrJwutqvnC9+waq3XjGpYmNuYL3467zuPrEv64TbbTBJ0/iCIT1U5Wg4tA4OY6fm4RvM6YLC3eGtubofMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0EQT1+W7rPpR3E1TsLQbl3LADF7j3n1GrM6w034SEM=;
 b=SlLIHtb1bQOZuveFAvjFX7FafzXUnG3Ur4q6bH5K2GyOMwo6wPKaInlm498M0eDBwz9Fa2YjpwDlDQ9kPbmmjcibrJCo2AdihydfAPy0+kYtxcHIcL6Swt1d4MWmalvKUbiv23ODw3LzD+BKm4OBGVtiLNfpvBU58pqHyL8TUnNyiEHsNYQ9mKAd/wuImg3mNXrlZO3LzQxFMM48lqx5K4d3s3eQqNUelloMYtOV9b1eyc5BEL5xqs7l5nQE8e/B/z1iQLLBOtUffxVmLjHI1bHFPV5b/bce0FCPX6p6fs+I4iuS7soRpaYaDhK3snQvEtCt3D3V/eBorAsky1aMRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0EQT1+W7rPpR3E1TsLQbl3LADF7j3n1GrM6w034SEM=;
 b=o8f6ndPf+Ima6iHu9J7eso9Jsl0ucxW0E/VPZMBLM4FWG7y1P5nZfj0vKrTkOfdDPSj5x3GONl4wpOHOWM9KTxXmhuGbPkY89QmNzDdH9sVLiiXmZE4UZh8VuVWp8wObtc58UwNpsG+KpcKMg+TZjthSufCXVyXJnrH4wDy6JKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d0bcfe06c11831a0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFNC9LfqNZyzCuLoHHK4iSJiJnMHVBa4Bc9cW5d+u8jCBCXqtIxQ9vDAn8o2vC0TeycpcsN8JpwUzsKMuviHDok4T2ClBV0xqDIVqrZ3ccHEepfPMa5WkzEXVgw2++ZaB48gtYTxEAZKbL4xRmmvYhT3yKnL1VFqWf4+0hkSoqSUe/zke4cLhs53FIM68QrxBp8mgzZKLiBNjpa+LpOEtIyvAdo+M2lO2jVBPcMWLSyr7W3IoEIZ47t2eSYxnInMknVEvpLvvDzGOaHQ2rguzb8cy9fznNITHeGRkUiYq0Ef3x1NVNDlCzWibPl041AM11N9YZpUZ6+pCM8GJbbTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0EQT1+W7rPpR3E1TsLQbl3LADF7j3n1GrM6w034SEM=;
 b=nZBz1fc0NC/WSP022i/Qn3Y0bJVzV7QBFchW2nt6ZqCHm5VyWevj8/VJnabrUFJwo1bpZYhWLl2Pmz44DfpI4qEqDUCZu2/8uCtYpaZYYYTCQwEi0qx0GJOvcOoVsAO/3AJVUe+zPwZuczUAKZufA0jexrr19JpeUPs6e++rVyACl4z3fYXVo/LILoDTyoRLJZT1sGGTG9yc/tyeVJ7e+S7ohj6WvCIjTh30OqLGzUE+X9gcl8nWkJf+eU6Nr4OZdtkBIpOpjwFYeMPrhA/g4Z504+Z4stB0L/03O6hugS5H364l3dlUjXQ3GxkkP4NWLy81myzDhYhmrsG0DZK4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0EQT1+W7rPpR3E1TsLQbl3LADF7j3n1GrM6w034SEM=;
 b=o8f6ndPf+Ima6iHu9J7eso9Jsl0ucxW0E/VPZMBLM4FWG7y1P5nZfj0vKrTkOfdDPSj5x3GONl4wpOHOWM9KTxXmhuGbPkY89QmNzDdH9sVLiiXmZE4UZh8VuVWp8wObtc58UwNpsG+KpcKMg+TZjthSufCXVyXJnrH4wDy6JKU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Topic: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Index: AQHYh7iovubAjsqNDkKOdqYTdWMQia1eaYSAgAAFkYA=
Date: Fri, 24 Jun 2022 11:40:55 +0000
Message-ID: <E5F45AD6-8D0E-447C-9864-6E9F34C1BE0D@arm.com>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
In-Reply-To: <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b0649e7a-3ff9-48be-9d4d-08da55d66f2a
x-ms-traffictypediagnostic:
	DU2PR08MB7254:EE_|AM5EUR03FT003:EE_|AS8PR08MB7989:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n1fnQrLSiaTSjxruHYY+MB/9ZYlJNJCMYp2ViOL2/yOPuTMKYHxIm1zyxZCPQ2Uk2QwIs0e0iE2uGe6etu/ZIBK6zHpcske8odex/7lRnGBacgh5jTihL+VutyMaDT5opFHyeMJkr9TFj80VCpuxGX695J/+BPLyOtmUB0WjfYSNYsYmX/nRUGRBT9SPWb5Qa9LLp33BuTTPE7Y687q7HKgYPY334Tn4WYJ+ZTmjSlUxty9QpdQJFCtX3HBoSqUjb9CrHwMfSg5P7C2qme0S5LMV3KHA2aLPHyQae/D5yR85UecHCiVvC5mFFesMs7BI0v3dnuNLAdGkblDUoq1uZ6+GoWDgJiC+GybV2G/samYcKvk1QJHhIXf7bxG9YqE18H+BSmfqCL+N+a+PE82uu/nxsVV/oV6xiZ88MFklfwxO6IAe3XuePkqd2ezwjZOQ7V7XCwIDe18+aQnFSXDhayJP8k1COh2KOfEAcCFnZTh7pEosEvcxOjbujy7O3C/yMogzySt/8KEg9oG44zXrAT9FuqgGbG1bjUI9Xrr6EFw6TW31v5vpozQudTcLou0g8Yr9SgclsdPuCPL7IgP6D3SXX9gQkqJTXgIouoMYxqOoK2TMMi+FqX1zxzR72Ov/i/0HbFUMNKjeGIetTnyScBf1FBSv8P+wgkTpbHPkjWzp9WbOujLUTUH34AHI2+SCF23X/K2zpYFF9c4sNxY4imlkaeIP2XOhiGmtunAAOrQSIC6zn+Vb8Vpq5GvEdsA/OHjaLuPnNwmfF8K51VFr5qGJv9+xjHiLb0T07p0ONs2Dw4ZQJl9WHijDju7kuo8MYFCrhYf/Yt5giyKswkb6EQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(66946007)(64756008)(76116006)(66446008)(71200400001)(66556008)(2616005)(8676002)(4326008)(54906003)(6916009)(66476007)(91956017)(5660300002)(86362001)(186003)(122000001)(8936002)(38070700005)(38100700002)(6512007)(41300700001)(26005)(478600001)(6486002)(36756003)(33656002)(53546011)(316002)(2906002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <52EE7D3F9CCC1F4086F0C2A45076F043@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7254
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d6bbac9a-12d6-42e4-9c46-08da55d6668e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b6j0ZqclxdnUeD/Cgga7OOe2W3ZZSGdrdaG0OCKM5VzGUqPGyJpqws+pSaolxg5k/ES8gSSXqc0qiFl5SUqFJeY2SDo4m63WKtwlwqfjxV1XCfKBf8Ps1sPpr9dpWpTsvmHGSueGvddnWmZ4mABvIgcLNpd/L+WNQ2dS2c/Ro1tJ3+hFT6xSmi+4EkM76S0J6kTSCLX1MlrsPDWFOK/WueTD+tmk9Z5Ry+5oKDn6c3KYnGwLM1CCjNVT5BKkFtXpJr46ng+aPQ+qpKlAB4+ot1Ec1d7Ct2v864EUWDGEveiotnQSrQRQpjU3ur9BcFM5k6UIVSBrNhMiyaCxEy2mv+txeouRJ1vRVNkiuODYXgKBwYgJ6NGcFSkq/JcMYX8U0zOdFKQDdMFzoyHKKAPiFwzE7C5WjluBaV0/6tEeP6um0phYCkq1cgG4dB0j7MQvb5NZWdl+s2HCnPImiq+2NssV7ud4uzpwZ8QCMZwcTjsO5kmdZd/qjSWNMrGA9hu5p9Ok/p5s1U8p5P0bOyrQ6Rk/KH/oTsOVVs4SArQY211GFioLUeV+jTeZJFR1/GmaQt3heX5aGymycweWpX2nArgjS2oAWym0QyM1eHPcxul+yLOapqLzVPOfe5r2cjzNhCky7BdpZOwMv9gC60Bmtmir6lkBmw8MSKOWXqVh3imwQqCCHiIrFpmwlWpObZcC+lB2GEyfe3mikCH3x2XGNqXCZb7esp3Z3wmj1vUn3MiIhdIIVbaeLWO6XdSdlQ3fSY+h+h0UOy83HtMKJ1niBbHRfMxQjH4xUB2C40YtkwAbmauSFvqibY0mgqaYzI/K
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(40470700004)(36840700001)(336012)(8676002)(4326008)(186003)(2616005)(70586007)(47076005)(82310400005)(6512007)(70206006)(53546011)(26005)(36860700001)(82740400003)(86362001)(40460700003)(8936002)(33656002)(54906003)(36756003)(2906002)(316002)(478600001)(6862004)(356005)(81166007)(6506007)(6486002)(40480700001)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 11:41:10.1991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0649e7a-3ff9-48be-9d4d-08da55d66f2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7989

Hi Julien,

> On 24 Jun 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 24/06/2022 11:53, Luca Fancellu wrote:
>> Add instructions on how to build cppcheck, the version currently used
>> and an example to use the cppcheck integration to run the analysis on
>> the Xen codebase
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> docs/misra/cppcheck.txt | 66 +++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 66 insertions(+)
>> create mode 100644 docs/misra/cppcheck.txt
>> diff --git a/docs/misra/cppcheck.txt b/docs/misra/cppcheck.txt
>> new file mode 100644
>> index 000000000000..4df0488794aa
>> --- /dev/null
>> +++ b/docs/misra/cppcheck.txt
>> @@ -0,0 +1,66 @@
>> +Cppcheck for Xen static and MISRA analysis
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Xen can be analysed for both static analysis problems and MISRA violati=
on using
>> +cppcheck, the open source tool allows the creation of a report with all=
 the
>> +findings. Xen has introduced the support in the Makefile so it's very e=
asy to
>> +use and in this document we can see how.
>> +
>> +First recommendation is to use exactly the same version in this page an=
d provide
>> +the same option to the build system, so that every Xen developer can re=
produce
>> +the same findings.
>=20
> I am not sure I agree. I think it is good that each developper use their =
own version (so long it is supported), so they may be able to find issues t=
hat may not appear with 2.7.

Right now the reality is not that great:
- 2.8 version of cppcheck has bugs and Misra checking is not working
- older versions of cppcheck are generating wrong html or xml files

So in practice anybody can try an other version but at the moment only 2.7 =
is useable.

Cheers
Bertrand


