Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27059E542
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 16:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392023.630138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQV5k-0005DW-IJ; Tue, 23 Aug 2022 14:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392023.630138; Tue, 23 Aug 2022 14:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQV5k-0005BW-EX; Tue, 23 Aug 2022 14:41:20 +0000
Received: by outflank-mailman (input) for mailman id 392023;
 Tue, 23 Aug 2022 14:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jact=Y3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQV5i-0005BQ-QC
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 14:41:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4b05300-22f1-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 16:41:16 +0200 (CEST)
Received: from FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a0::15)
 by AM6PR08MB5144.eurprd08.prod.outlook.com (2603:10a6:20b:ec::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 14:41:14 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a0:cafe::66) by FR3P281CA0173.outlook.office365.com
 (2603:10a6:d10:a0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 23 Aug 2022 14:41:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 14:41:14 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 23 Aug 2022 14:41:13 +0000
Received: from 4521df42283c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6B204949-7460-4ACB-8281-E95FA7A4EE72.1; 
 Tue, 23 Aug 2022 14:41:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4521df42283c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 14:41:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR3PR08MB5562.eurprd08.prod.outlook.com (2603:10a6:102:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 14:41:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 14:41:05 +0000
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
X-Inumbo-ID: a4b05300-22f1-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GCzSon9qPbJq9w1WUiKSqPC6S6Noh8UmMm1UBoZpQRUFCwWAKCXj7TWPh1r17zhH8/15Qw7BlZV1nofL8wO+rY29+qaKAcQ2ilKXTvSzUOyBsadTH8++v5+1h7PDrFybBz7z9I7HeTqnK9enWOskdamneXcAyqzS/e/k69lB5Iinq5CiKBJlhHM87GF6/hoZ0O8OkYw07DpgyMKWQAL4R3H+xQcp6qztGyHj4XUjTBXeBpYdbkQPtFpVojgcCGcj8XjDTIqZDafN3u9s3l89GC6t+qs4mRXykXOtfBW5vIAwmsm54eAxCn6Fmtn8On44IgmEUGUyhmwVyEB2KKh8LQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzO3nDsYoHJ6q99Fr/hduddJgdFXKpPUy+dNLRhHw4s=;
 b=UvuZDjs3+NqeusIqVjZoFWJxlLfIjcHywiRPXC9r6f6yiNYTroSX/ynEd5ttSvR1fVAfN3K4Pf53INeUjDHwlu91wudLWRKQ0T2dOlRJFo1WEFGMgvTrJakJS1EQHDhYyEbJACpngsyZNQ167MMU/V52pvc+Yg+wGuQJQ5hYKMKsL3Pve8DgMWtazxULoDvMnmBRkcikg1/1o6cfZ7KD+hsBcwYZ7P3y4d0N7ciMkplSr/sDRBH3pJAUJj/v5nDOMizD/fRCe/Qpht6dJUYriPMTo9Cg1GrlTogfRydrAIqqi2GoL2UwdReFwUbVPIOIUebEsXtsXGqirn4Y+1JEuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzO3nDsYoHJ6q99Fr/hduddJgdFXKpPUy+dNLRhHw4s=;
 b=B8mAYiJ1vDmNZsjT6L2KBFNJs8qMoHPoUvFwu5LbBn3TiMthWx7C6SwyDn4k4B87NAbiEcqZEi3wT2tPSooV9TBcpTEajsTyggue/QmHjLzKd4UDl1O0+lct21BS/sy/f5Rw2SdeLHolhYmPa8B+2+XjvaShAJz9ZvKY4eJ8yn0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5eccdfc91b62502
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cre73Bt8Cdv458wqYvDbYL+42/7n5qCQ0aWuXHRh+fcR2+VrZHSUbqUBsE+jc3cI5Ru3wK2JM76d5apOtXyzuN3Yw2UfddlBL2vvIUvRwZoSOHC8qU2xJDOF7wfhswZNjVkzVgBuxBnSrt16SO6vUpQL6j6mu7LanVlvhzXG4LdaBoFYnY+o7fpL6jbcxV3fjO7hAj0qMqBAL4vTliY+5dWY+NXflM4KXSJW7Oshfyw0LvaPC88MUsDkV+xfsxamZUol12l4wFvd9+2qwzjNejMJ4vos491Iaojybs21NEhY/pGg342sbqaNJ4UZb80BYFEoE/W+i8Uco29E0bDGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzO3nDsYoHJ6q99Fr/hduddJgdFXKpPUy+dNLRhHw4s=;
 b=A5Oh8BjuhwBE8wBrQxmOScX2zK/ruqYRI7qExWALaTfKr21k8YcOyJIC6Vj8J3mKEQwPsFF2Xrl940CZAHlULTRNdt0NuxRu1YJ/K6CCQWpjoh4JGgECM28eDu9FWVn1+kBIpu7XwhSX8pKTcPfm+xRYvrZyJAi/wfUoGl0zH4KwsZsgxNjAZ0zpY8mwi8nCpH7tNF1NYQU9NG9RkfdHDf5jORJTlfo6Ksnyk2yYgmVZRByKEqW1lgd47RxyNyxwGbr4dqzIZj16hZ9mnt2zsbokTtf5UHPrtWummlyVH48hYEQeBrtv8PczSArWyfbvTlpcctlhPeG+HjcicKuc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzO3nDsYoHJ6q99Fr/hduddJgdFXKpPUy+dNLRhHw4s=;
 b=B8mAYiJ1vDmNZsjT6L2KBFNJs8qMoHPoUvFwu5LbBn3TiMthWx7C6SwyDn4k4B87NAbiEcqZEi3wT2tPSooV9TBcpTEajsTyggue/QmHjLzKd4UDl1O0+lct21BS/sy/f5Rw2SdeLHolhYmPa8B+2+XjvaShAJz9ZvKY4eJ8yn0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Topic: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Index: AQHYttqU3r7Sk/IKHkKroerrTRS8F628a1KAgAARJACAABAJgIAAAokA
Date: Tue, 23 Aug 2022 14:41:04 +0000
Message-ID: <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
References:
 <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
 <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
In-Reply-To: <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c223478b-7006-496e-cb13-08da851587a8
x-ms-traffictypediagnostic:
	PR3PR08MB5562:EE_|VE1EUR03FT012:EE_|AM6PR08MB5144:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6cFhqDcn+cA7ojH+5S7M4WTcOnO1k1VivOduAP86R3xXYZxOMqWOInhiaJPlbChmAs9n1Ng/dWlwofiIxMLnXp5PZpWWF3Zbo8dRdLlDIr0aJnmdCqNFMQnCQTLPE3JnVPehtax2yWZmIjZlM9uSs+l2ANZT+EemPTtnWikxEmMj+VrFE4qlSvRzQ0tUca2zgiJC6se4Iw3VhSKqw4Z2c0cFEApLTn4zWNSv6bcnXYBMV3DnO1LvRimWRLwmE9PvoULOt6USwhyPaXIUXO0N1orE67RkOzFxGp1bp9L2thMwpo/s3SzArt7CY6TNQTyhc02WC9KrWQ/4oaC1FdTszbCeXUk5x4rVVBltF0PyWYWqLIOE8lhDPp9nTEsoVD9zmCdknrylXwpOXoQqxjoxU4adoqJfBHbknfjcHr6CKeP/Pvndqx8ehLFFHiXq/OcECqY5uS3PnpeqMvevJEIW5eaWiXQZejAe2pFStzsovGy3JFtGhomOIL6g5RcmOhvDHmhoaQGqyMcPHMDtcJwVMfOhHBI9kddXUXZEdfoC0Z5kQmdXCwxDdvwyObfE7GX0zlLqh6XU3ULqUEdjWZw4AehraJwewFK/qmoH+dooxq8lcCAefAgzQkT208fzOEKkN9aJ6J60pKWXftTiLgTx30RtxrOeb4CN8+urntC20jgfS9FYrOYEdJWM13TtPVSMVF9X0zFDxVAHN9cJiQLTcCw2kxFyoFb7mJmZQneCJ1dSIMCSHQCGXBFjxNJqso+wVJj0wKsrN64HIiXPpMLXrFvXhDg3ot4gxxxbULtTP3U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(122000001)(38100700002)(2906002)(53546011)(6506007)(2616005)(83380400001)(186003)(33656002)(26005)(6512007)(71200400001)(91956017)(66556008)(76116006)(8676002)(64756008)(66446008)(66476007)(4326008)(66946007)(6486002)(6916009)(54906003)(316002)(5660300002)(36756003)(478600001)(38070700005)(8936002)(86362001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EDA95FB17B47E47A91370149D96E1DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5562
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b904a79-5f73-46ac-f2ed-08da8515821f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CmsDDoaHFuY9YdjEBpTbmTBHanCe9RtJPBXg4QHgoukEV/+hJ7SNCmdfS043o1n57CIxLGHXV5RXHLdz6fmImP9JszSJR0R0v/vO96CUHwNe/1QYbY26u17r5qj9/qWXbCgueZPEWYU1zV+1gj33CmVeIpbP/YwtJMXL976mUWl0vzzWjh0HGMWi3p0hh4tpTNEF3uaPBF4MKQpEVSbte+RJi3HM6BOiSw/BVT2IRl+cZpe/sNqIv8+i4KqQDSoxFt0zeHIIniy0SyBcakTQXLz2zBJQD6L/tU85H9Qni+GCMoEOhVtHAxRteXfVbkO+sKxQXIDW4ez4rGB8k7ZGg6NK8LTq9Weta9W9VdvpjwmpsdKqG0PrQp4IKOY15eHkfOshjRBINEEoo3izMm3LNY0FiP3qz+jiGr0ICKYrvAQrvk/ehGrlV1+FKWpbzEaoXay+BGzQUogF686YZQEDXmlwFosvhRh4TYy0RXoqkx4KHJtc0unWvxLO2mU0kD5xK4Wv7uiX/8eC9BcwrQ6/ol7hjCugKpOyYqZkTWW2rCAjZP2z3LMpqqoaqljXfACthZQGIhgck1PHKmqorBzpMTI3HgQ58ZT1rxNJObnheUYvse6yF4FPBcQQc4L2eY5V9kVmAMU+7wEOxqAx7HBedb9rL5+dN2fUkCJ/t8fgI+QliDUgbp953LeHIBxaipqqjJZnL4ybg0mLBGvD0Zjw7UzNN7cVi2FD2NWnriGi8pLyl3OMOQ0GEz3DA9qLq5h14G2Ks9lfujpn31snZaNBfw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(40470700004)(36840700001)(46966006)(82310400005)(6862004)(2906002)(8936002)(4326008)(70206006)(8676002)(6506007)(70586007)(5660300002)(33656002)(6512007)(53546011)(26005)(41300700001)(36756003)(336012)(83380400001)(186003)(2616005)(47076005)(6486002)(478600001)(40480700001)(356005)(40460700003)(86362001)(36860700001)(316002)(81166007)(54906003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 14:41:14.2046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c223478b-7006-496e-cb13-08da851587a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5144

DQoNCj4gT24gMjMgQXVnIDIwMjIsIGF0IDE1OjMxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjMuMDguMjAyMiAxNTozNCwgQmVydHJhbmQgTWFycXVp
cyB3cm90ZToNCj4+PiBPbiAyMyBBdWcgMjAyMiwgYXQgMTM6MzMsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjMuMDguMjAyMiAxMjoyNCwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+Pj4gLS0tIGEvdG9vbHMvbGliYWNwaS9ta19kc2R0LmMNCj4+Pj4g
KysrIGIvdG9vbHMvbGliYWNwaS9ta19kc2R0LmMNCj4+Pj4gQEAgLTE4LDYgKzE4LDE2IEBADQo+
Pj4+ICNpbmNsdWRlIDxzdGRsaWIuaD4NCj4+Pj4gI2luY2x1ZGUgPHN0ZGJvb2wuaD4NCj4+Pj4g
I2lmIGRlZmluZWQoQ09ORklHX1g4NikNCj4+Pj4gKy8qDQo+Pj4+ICsgKiBXaGVuIGJ1aWxkaW5n
IG9uIG5vbiB4ODYgaG9zdCwgYXJjaC14ODYveGVuLmggd2lsbCBpbmNsdWRlIHhlbi5oIHdoaWNo
IHdpbGwNCj4+Pj4gKyAqIHRyeSB0byBpbmNsdWRlIHRoZSBhcmNoIHhlbi5oIChmb3IgZXhhbXBs
ZSBpZiBidWlsdCBvbiBhcm0sIHg4Ni94ZW4uaCB3aWxsDQo+Pj4+ICsgKiBpbmNsdWRlIHhlbi5o
IHdoaWNoIHdpbGwgaW5jbHVkZSBhcmNoLWFybS5oKS4NCj4+Pj4gKyAqIFRvIHByZXZlbnQgdGhp
cyBlZmZlY3QsIGRlZmluZSB4ODYgdG8gaGF2ZSB0aGUgcHJvcGVyIHN1YiBhcmNoIGluY2x1ZGVk
IHdoZW4NCj4+Pj4gKyAqIHRoZSBjb21waWxlciBkb2VzIG5vdCBkZWZpbmUgaXQuDQo+Pj4+ICsg
Ki8NCj4+Pj4gKyNpZiAhKGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykp
DQo+Pj4+ICsjZGVmaW5lIF9feDg2XzY0X18NCj4+Pj4gKyNlbmRpZg0KPj4+IA0KPj4+IEJlc2lk
ZXMgYmVpbmcgY29uZnVzaW5nIHRoaXMgZGVwZW5kcyBvbiB0aGUgb3JkZXIgb2YgY2hlY2tzIGlu
IHhlbi5oLg0KPj4+IA0KPj4+PiAjaW5jbHVkZSA8eGVuL2FyY2gteDg2L3hlbi5oPg0KPj4+PiAj
aW5jbHVkZSA8eGVuL2h2bS9odm1faW5mb190YWJsZS5oPg0KPj4+PiAjZWxpZiBkZWZpbmVkKENP
TkZJR19BUk1fNjQpDQo+Pj4gDQo+Pj4gQXQgdGhlIHZlcnkgbGVhc3QgeW91IHdpbGwgd2FudCB0
byAjdW5kZWYgdGhlIGF1eGlsaWFyeSBkZWZpbmUgYXMgc29vbg0KPj4+IGFzIHByYWN0aWNhbGx5
IHBvc3NpYmxlLg0KPj4gDQo+PiBBY2sNCj4+IA0KPj4+IA0KPj4+IEJ1dCBJIHRoaW5rIGEgZGlm
ZmVyZW50IHNvbHV0aW9uIHdpbGwgd2FudCBmaW5kaW5nLiBEaWQgeW91IGNoZWNrIHdoYXQNCj4+
PiB0aGUgI2luY2x1ZGUgaXMgbmVlZGVkIGZvciwgcmVhbGx5PyBJJ3ZlIGdsYW5jZWQgdGhyb3Vn
aCB0aGUgZmlsZQ0KPj4+IHdpdGhvdXQgYmVpbmcgYWJsZSB0byBzcG90IGFueXRoaW5nIC4uLiBB
ZnRlciBhbGwgdGhpcyBpcyBhIGJ1aWxkIHRvb2wsDQo+Pj4gd2hpY2ggZ2VuZXJhbGx5IGNhbid0
IGNvcnJlY3RseSB1c2UgbWFueSBvZiB0aGUgdGhpbmdzIGRlY2xhcmVkIGluIHRoZQ0KPj4+IGhl
YWRlci4NCj4+IA0KPj4gQXMgc3RhdGVkIGluIHRoZSBjb21tZW50IGFmdGVyIHRoZSBjb21taXQg
bWVzc2FnZSwgdGhpcyBpcyBub3QgYSBnb29kDQo+PiBzb2x1dGlvbiBidXQgYW4gaGFjay4NCj4+
IA0KPj4gTm93IEkgZG8gbm90IGNvbXBsZXRlbHkgYWdyZWUgaGVyZSwgdGhlIHRvb2wgaXMgbm90
IHJlYWxseSB0aGUgcHJvYmxlbQ0KPj4gYnV0IHRoZSBoZWFkZXJzIGFyZS4NCj4gDQo+IFdlbGwg
LSB0aGUgaXNzdWUgaXMgdGhlIHRvb2wgZGVwZW5kaW5nIG9uIHRoZXNlIGhlYWRlcnMuDQoNClll
cyBidXQgdGhlIHRvb2wgaXRzZWxmIGNhbm5vdCBzb2x2ZSB0aGUgaXNzdWUsIHdlIG5lZWQgdG8g
aGF2ZSB0aGUgdmFsdWVzDQppbiBwcm9wZXJseSBhY2Nlc3NpYmxlIGhlYWRlcnMuDQoNCj4gDQo+
PiBUaGVyZSBpcyBub3Qgc3VjaCBhbiBpc3N1ZSBvbiBhcm0uDQo+IA0KPiBUaGVuIHdoeSBkb2Vz
IHRoZSB0b29sIGluY2x1ZGUgeGVuL2FyY2gtYXJtLmggZm9yIEFybTY0Pw0KDQpCZWNhdXNlIHRo
aXMgaGVhZGVyIGRlZmluZXMgdGhlIHZhbHVlcyByZXF1aXJlZCBhbmQgYXMgbm8gc3VjaCB0aGlu
ZyBhcyBpbmNsdWRlIHhlbi5oLg0KVGhlIHBvaW50IGlzIG9uIGFybSwgdGhlIGFyY2gtYXJtLmgg
aGVhZGVyIGRvZXMgbm90IGRlcGVuZCBvbiBwZXIgY3B1IGRlZmluZXMuDQoNCj4gDQo+PiBUaGUg
dG9vbCBuZWVkcyBhdCBsZWFzdDoNCj4+IEhWTV9NQVhfVkNQVVMNCj4+IFhFTl9BQ1BJX0NQVV9N
QVANCj4+IFhFTl9BQ1BJX0NQVV9NQVBfTEVODQo+PiBYRU5fQUNQSV9HUEUwX0NQVUhQX0JJVA0K
Pj4gDQo+PiBXaGljaCBhcmUgZGVmaW5lZCBpbiBhcmNoLXg4Ni94ZW4uaCBhbmQgaHZtX2luZm9f
dGFibGUuaC4NCj4+IA0KPj4gSSBhbSBub3QgcXVpdGUgc3VyZSBob3cgdG8gZ2V0IHRob3NlIHdp
dGhvdXQgdGhlIGN1cnJlbnQgaW5jbHVkZQ0KPiANCj4gMSkgTW92ZSB0aG9zZSAjZGVmaW5lLXMg
dG8gYSBzdGFuZGFsb25lIGhlYWRlciwgd2hpY2ggdGhlIG9uZXMNCj4gY3VycmVudGx5IGRlZmlu
aW5nIHRoZW0gd291bGQgc2ltcGx5IGluY2x1ZGUuIFRoZSB0b29sIHdvdWxkIHRoZW4NCj4gaW5j
bHVkZSBfb25seV8gdGhpcyBvbmUgaGVhZGVyLg0KDQpTaG91bGRu4oCZdCB3ZSB0cnkgdG8gdW5p
ZnkgYSBsaXR0bGUgYml0IHdoYXQgaXMgZG9uZSBvbiBhcm0gYW5kIHg4NiBoZXJlID8NCk5vdCBv
bmx5IGZvciB0aGlzIHRvb2wgYnV0IGluIGdlbmVyYWwgaW4gdGhlIHB1YmxpYyBoZWFkZXJzDQoN
Ckkgd2lsbCB0cnkgdG8gcmVkdWNlIHRoZSBwcm9ibGVtIGEgYml0IG1vcmUgdG8gZmluZCB3aGF0
IHdlIHdvdWxkIG5lZWQgdG8NCnB1bGwgb3V0IGluIGEgc3RhbmRhbG9uZSBoZWFkZXIuDQoNCj4g
DQo+IDIpIFNlZGRlcnkgb24gdGhlIGhlYWRlcnMsIHByb2R1Y2luZyBhIGxvY2FsIG9uZSB0byBi
ZSB1c2VkIGJ5IHRoZQ0KPiB0b29sLg0KDQpZb3UgbWVhbiBhdXRvZ2VuZXJhdGluZyBzb21ldGhp
bmcgPyBUaGlzIHdvdWxkIGp1c3QgbW92ZSB0aGUgcHJvYmxlbS4NCg0KQmVydHJhbmQNCg0KPiAN
Cj4gSmFuDQoNCg==

