Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9F57C672
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 10:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372564.604353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oERf2-0002P4-9D; Thu, 21 Jul 2022 08:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372564.604353; Thu, 21 Jul 2022 08:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oERf2-0002My-6Q; Thu, 21 Jul 2022 08:35:56 +0000
Received: by outflank-mailman (input) for mailman id 372564;
 Thu, 21 Jul 2022 08:35:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3IU9=X2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oERf0-0002Mq-DT
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 08:35:54 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50056.outbound.protection.outlook.com [40.107.5.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20a00264-08d0-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 10:35:51 +0200 (CEST)
Received: from AS9PR06CA0463.eurprd06.prod.outlook.com (2603:10a6:20b:49a::14)
 by AM4PR08MB2835.eurprd08.prod.outlook.com (2603:10a6:205:a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 08:35:49 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49a:cafe::af) by AS9PR06CA0463.outlook.office365.com
 (2603:10a6:20b:49a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Thu, 21 Jul 2022 08:35:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 08:35:48 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Thu, 21 Jul 2022 08:35:48 +0000
Received: from 07e529ff3c36.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8F02C5C-E7D6-416C-A40C-A7B346AEFF26.1; 
 Thu, 21 Jul 2022 08:35:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07e529ff3c36.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 08:35:40 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM0PR08MB4115.eurprd08.prod.outlook.com (2603:10a6:208:12e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Thu, 21 Jul
 2022 08:35:39 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 08:35:39 +0000
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
X-Inumbo-ID: 20a00264-08d0-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aPQBIw9UOdZ/era49AGXhTZnSBPDGa/VFGDXTNkPpQNWMsd9H1Fy76sHXxgzbeLKOPFMksWO5CHbkVydS7oQ5pwbl3OOS7ik7mvmLtLalIYeG0gEqzXzu8/j4zhgIsj/ku4Lakqx+Zvyotvjed8h5/ZWdOy47/JoLDsqc6tWoOMBrC+yIlpbqGciEO0M5MHAsRqy8+IIGfaYwYfd2N6QgYuOvq/9DzZCW4mk6hy8jVersQhxO/brYTtfSmiPTvT92F9F2QtnQmsqzumvi4ofgLtGu4ToA0K+qKaRTw1hLDG7lWjk8HZNeo7sl3OOYkoL8PAGdmc1WA3F3tsC+MnH6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fofCyzrORUdLScIptGph7XeCgcAnTIPNo8J8DG8sbkI=;
 b=a7OvFJNOAY2xJ8hdpscsT7FoZgLI3FLu3DPx4c/eNSwugwcPcEbOO5uBgsLwysOu9VnM/LK0Df9RQK+SVP8PLQdJhDhoGG1cqWpwUvfxlYILiZUN+Aiqy6gOB+Lm07qJ8A68I5cVMK3IcTSxEsWJAZQkW2qbwGbxQrJHWDqoVQ9mx14dGvl99qKGknXAx6e5mptz0+ztBi4bO+tN1Nl3LA0CvokzL7bQ/tuj44+z/0xTs/mEmiiumhMKnVJCMc6cEB6drfugv/mICMBlxcWekuIZMYuox7pvvH8CZUSruFCGYXA3qR9eiHpcoT1aSvzBhsm5LUgktSfvuaZmjREnoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fofCyzrORUdLScIptGph7XeCgcAnTIPNo8J8DG8sbkI=;
 b=jYNthHdxRivQuFz71ZPjvQ1lwGbsK76ishU8iDX4EdEWFiY48D6VEgNtQ/lFoqhOkMWZq4X6Z9dmbvRHg6WIomZUVp5fydW42mibI6q/UnfH5a+TOIZ6j6ZOc/MKVldxxCe5ygNS43hP+xb8s4Q8zb9tqcJhFuVN2bYA1TXmBhc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93cf0c1c4646c53b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKZX9F1XgJjaz9ztmrOLIAzdUBE907v5IHFD97jmkc/l6TUdnSWM+WgG/Ioy2aT6uCaJ2yt5lARlP0wJc8tHurugwACi4Kgw4TWVsTQrAW6rR2mFWDXYuvp9+fqd2PY6qeHlIUca0dUOlHTjONIxP73chrhuE3xMgGuMSJD7yyJi7CciGl1xpU65DtgAnbyYpM34v5d0rNRXZkKAirFw9UDQZXCtYTuc+pfnycLGmFYh/i37VjSoYzdYGV9kRcdEFXlogShq7LmynBNRQpUea0D1eqwKXDZ9y3GovOd2CEHC62lcPv0SUUEAoJ3Rpt4diIsUtRLBA7TcyD2oIu+ltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fofCyzrORUdLScIptGph7XeCgcAnTIPNo8J8DG8sbkI=;
 b=NtB3YaiFfFhzo23hpX8MsHBP9DLZCIonQQhn5pWNqpeNtDgfbiNIep++Bm6UwpMzT+sOCIsyzQYHE31Ws3s34C+Gciu1lw1jteZZpRZenLgc73p6WzY4jjR+0b1TTe6BBYXY4hlvqadyKS6/ugNPLfKyu+CVMYm8Vb4YaK4xexsttglLMQXVZnGw6Jc05O5OCuH9jKUKOWbThapZKvvUjwrVxaiRETP+xRVtA/aqIJe4MJafzIW1bumqQmBotjfp4SfWoDF8pgQvKAfP+RJdTVkctFq+FQyFuZzmCuNgzdJz61kM6kjE6BaFEKlO/n4VGUX7zQLWSbK1j/8NeEaQpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fofCyzrORUdLScIptGph7XeCgcAnTIPNo8J8DG8sbkI=;
 b=jYNthHdxRivQuFz71ZPjvQ1lwGbsK76ishU8iDX4EdEWFiY48D6VEgNtQ/lFoqhOkMWZq4X6Z9dmbvRHg6WIomZUVp5fydW42mibI6q/UnfH5a+TOIZ6j6ZOc/MKVldxxCe5ygNS43hP+xb8s4Q8zb9tqcJhFuVN2bYA1TXmBhc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 1/5] xen/arm: Remove most of the *_VIRT_END defines
Thread-Topic: [PATCH v2 1/5] xen/arm: Remove most of the *_VIRT_END defines
Thread-Index: AQHYnGjlp6U2YulxrUmlrCnvJIWo3q2IgOKA
Date: Thu, 21 Jul 2022 08:35:39 +0000
Message-ID: <364D75BC-39A0-4BB8-BE5F-B01BE4EDA707@arm.com>
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-2-julien@xen.org>
In-Reply-To: <20220720184459.51582-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7c6048c9-6d55-4717-6a7e-08da6af40323
x-ms-traffictypediagnostic:
	AM0PR08MB4115:EE_|AM5EUR03FT007:EE_|AM4PR08MB2835:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M+2t7rf7nlA8l2PpNUPeNC9COsDbEbhR+9ndz+HiILpHibHyNH45XYcshG7/9NBpFKOBGM78lRWQznl3LYQI/AwPmBh4yrTE5Zhnu/8zJSPL703N3/IIfnIlMFbWtuBmWX90Z7taty8vQpu1Hjb1PxqUoWoEK8/HmuYePFmrjMGtxbFm+FfiK+7CcPp/5UoKtcUyTd1He6DM3TeU5DCzKnzWkXpJqyIXxa/qxikrjfxvPabKo3aMArRgqdEDtqenP5rxoCR77bk726LkRTZfLDTeeCYAFQeNirOkQR5hit9jQA5i6A2AXgsLRp5chWeuvHyP0bjpmFPHNtoPp4HpfS0rrrAQ2/x4elAKxzdVxv2+Af4i+yWhSYIg6R0cHm5pJUX8jdLVJx4GOXeEd9TvThSlCrczBqO8XsJaqWVpy30yxxx0eywD7w+c3mH0xg0U1/tdxBnXsW3WsAP5VX0aSFsL4WEymzaCxukzVab2vCF34N0jlq9lm5KHcpdOhsefub2u81R6KidkuQkb4yDc6HzPMhq4PIzi0YD6KhzaZ9iOraJ98zICPtBg1WH9vKV0fdObMVV60HHEEpNHtRZYnW0gER2WCmoD38bmSCH7S/Znyn5lzbq9xvt0HM+sY47psn/rcc8S+7DlNCviGdH4A2tyMvCsQCdcg3nMC5Ofl0Tddu0dGYo7RpW2HQT3DW9AsEPNhosVmBAFRQvgsgdrMEVNG72enXmXw+KZQ4NI59QIx4/sQvsA4AYfjCz3hXAHUJNuXkKMYi5kLsD/lTplVUbigDBHaVy4rLwdzRt2xVKiJ2en5pEIBfb7KHiyg4vX4hBcjDJqyGhyEb/FGv+FEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(6486002)(8936002)(316002)(478600001)(36756003)(6916009)(54906003)(4744005)(76116006)(66946007)(71200400001)(5660300002)(66446008)(8676002)(91956017)(4326008)(66476007)(66556008)(64756008)(33656002)(2906002)(26005)(41300700001)(53546011)(2616005)(186003)(38070700005)(83380400001)(122000001)(6512007)(6506007)(38100700002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F539BB2178E2D449C3F9D779483AD3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4115
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f99ad09-c03c-4f0a-8ae4-08da6af3fdac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2204SWXlM/EP6ZmOyYKSuIcmyV4p1UfKYLLSYIyuDBL96sToMK3BcybO8FlOea2InUIT22OqhZWcUCUGCftSmQkQNNRl/r04O+JV48P6Mt90rL7LZoa96gYrGayTCiP9aQSqiN0wPB37zsaiVh3ROn6IEtYoodthxVAWMpB9FzmT1cfQRpjhAV7+rZDbjdAgvlI8CHU3ryZSGjPKOKZs5RYv3XChXWcBPHUBhVnXlOe21UGTBPJ+ytJWDtN7gzGRGt8E5JzqYin0VRKbQmDiVY6VvonIfDjpbmqppPcG0TuWMxIjL3RiPXTu1Ri89HVwwacTYtX4CMtSxghPuLD7MZHQqQvfkuRrl8dWVIE5AM5BYD7EX+MspG6mSG1w8zIq6TXQe/T2sbK3h2TTfbcL1XrNFTl8Am/p4qlII6mGJwPNWjZ/lTmAV4S8w2ym81y3OGTeon5WzHK+23p/WwJfcXeeHVHsnr1C4UDQQJgveahLqUboFhLltrbCipuGV3ieKu0FLXzLNNKLqHvjZ7ZZdNGzhDO4rN90255JTGekN00k9IVYweq1lDDo/5qHKAbcqm7Hicfv+LP5iPcqbNQeEO6/tTPEMJQKuJDz1Ykt8rIlqaO6GbXYkS/u1Ru66taz/7yBMao//3KW++sDIkOLxh08MuZzi+IdqlqXmmwhtJKAWVpSedYOgjubhmJRGKJ8L+rdnUrYkA8940gIWKTq3xp3c4Izh+CrnYYO6YYQluVpqPGSydp2lQyz0BAfa5rOP7fPe4+HshtcQg/jbZ393JxuXoz9xFgbVb5ctf58xn9FpYHP7XxIkTsesPFn0e1E
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(396003)(40470700004)(36840700001)(46966006)(356005)(82740400003)(86362001)(83380400001)(6486002)(478600001)(26005)(336012)(47076005)(186003)(107886003)(41300700001)(53546011)(54906003)(81166007)(6512007)(316002)(5660300002)(4326008)(33656002)(40460700003)(6862004)(8676002)(70586007)(8936002)(6506007)(82310400005)(2906002)(36756003)(40480700001)(36860700001)(70206006)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 08:35:48.3094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6048c9-6d55-4717-6a7e-08da6af40323
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2835

DQoNCj4gT24gMjAgSnVsIDIwMjIsIGF0IDE5OjQ0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBBdCB0aGUgbW9tZW50LCAqX1ZJUlRfRU5EIG1heSBlaXRoZXIgcG9pbnQgdG8gdGhl
IGFkZHJlc3MgYWZ0ZXIgdGhlIGVuZA0KPiBvciB0aGUgbGFzdCBhZGRyZXNzIG9mIHRoZSByZWdp
b24uDQo+IA0KPiBUaGUgbGFjayBvZiBjb25zaXN0ZW5jeSBtYWtlIHF1aXRlIGRpZmZpY3VsdCB0
byByZWFzb24gd2l0aCB0aGVtLg0KPiANCj4gRnVydGhlcm1vcmUsIHRoZXJlIGlzIGEgcmlzayBv
ZiBvdmVyZmxvdyBpbiB0aGUgY2FzZSB3aGVyZSB0aGUgYWRkcmVzcw0KPiBwb2ludHMgcGFzdCB0
byB0aGUgZW5kLiBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgY2FzZXMsIHNvIHRoaXMgaXMgb25seSBh
DQo+IGxhdGVudCBidWcuDQo+IA0KPiBTdGFydCB0byBzb2x2ZSB0aGUgcHJvYmxlbSBieSByZW1v
dmluZyBhbGwgdGhlICpfVklSVF9FTkQgZXhjbHVzaXZlbHkgdXNlZA0KPiBieSB0aGUgQXJtIGNv
ZGUgYW5kIGFkZCAqX1ZJUlRfU0laRSB3aGVuIGl0IGlzIG5vdCBwcmVzZW50Lg0KPiANCj4gVGFr
ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVuYW1lIEJPT1RfRkRUX1NMT1RfU0laRSB0byBCT09UX0ZE
VF9WSVJUX1NJWkUNCj4gZm9yIGJldHRlciBjb25zaXN0ZW5jeSBhbmQgdXNlIF9BVCh2YWRkcl90
LCApLg0KPiANCj4gQWxzbyB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBmaXggdGhlIGNvZGluZyBz
dHlsZSBvZiB0aGUgY29tbWVudCB0b3VjaGVkDQo+IGluIG1tLmMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCg0KSGkgSnVsaWVuLA0K
DQpJdCBsb29rIGdvb2QgdG8gbWUsDQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNh
LmZhbmNlbGx1QGFybS5jb20+DQoNCknigJl2ZSBhbHNvIHRlc3RlZCBvbiBmdnAsIHN0YXJ0aW5n
IERvbTAgYW5kIGZldyBndWVzdHMNCg0KVGVzdGVkLUJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZh
bmNlbGx1QGFybS5jb20+DQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

