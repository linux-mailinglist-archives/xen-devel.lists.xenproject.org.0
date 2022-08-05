Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2A58AB6F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 15:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381240.615843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJx8j-0005u5-D5; Fri, 05 Aug 2022 13:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381240.615843; Fri, 05 Aug 2022 13:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJx8j-0005qq-A9; Fri, 05 Aug 2022 13:13:21 +0000
Received: by outflank-mailman (input) for mailman id 381240;
 Fri, 05 Aug 2022 13:13:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LiuH=YJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oJx8i-0005qb-69
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 13:13:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f657930-14c0-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 15:13:19 +0200 (CEST)
Received: from AS9P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::29)
 by AM0PR08MB5362.eurprd08.prod.outlook.com (2603:10a6:208:180::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 13:13:06 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::fa) by AS9P194CA0024.outlook.office365.com
 (2603:10a6:20b:46d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Fri, 5 Aug 2022 13:13:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Fri, 5 Aug 2022 13:13:06 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 05 Aug 2022 13:13:06 +0000
Received: from 6780071df1f6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0254D989-E64A-4029-880B-FA48708B5A45.1; 
 Fri, 05 Aug 2022 13:12:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6780071df1f6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Aug 2022 13:12:54 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by GV1PR08MB8473.eurprd08.prod.outlook.com (2603:10a6:150:81::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 13:12:52 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 13:12:52 +0000
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
X-Inumbo-ID: 5f657930-14c0-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=A6lX5AdE1sH5dm4pCnzQiI7UAjmoe8EgJlepyfCqwW1Xsf7+kTOcK+voBTjmVSF2m6M+40ASh06bHA4b5ob0U90dK4YjmC70eSrLTNoa6RVRlRsIW3VHrAeX5FWFw9mUUAljFB7f6glzknmmPhaRF2h26G5RoqhOtamPiRb6sSdoAk42QPb4B2rGXw2lpoANqo1mP0UtYTmj7iXBco2xo1OdjUZpVkN8gmXhB36c3zdTFU81/oaFRj4Es6Cl6gQOmxnyfCkuuNjiGchu3v+AJoSfdaIcIT+dw5/HnkPmsQjO/Jv1l+09ExWYvsddpi/pw6vsKjC363WHM4Jmvnfqjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZlSKummqDwyA7XSeCEvJAjoFOPoUHXJcN868r8iNcY=;
 b=RKnW1sC97J0OanPGQ4qprJK9a5y0jWlMD9I5LiuyS0c4JX9LQtkVE42E3EtrXxos4xBZbjmQdmMDdKMskBwiNmC517ledFlWrduSuDZBwnYKu1soZsYHmNX/eu49dAdbKfkBg1uubMgJouBxPcv3BZaAskU+yQ26IPOnwXZqtW+jlOfGHjdWfq0BQLcLpcRH02utb00nZ+ydqvTcjU/ufIr9hnkg2k7t8Qjq0gvTRV+BXvF2AIAZMP6qzp/GjgeJRxq/pV+3MUJrbPszg+mM/l57jI5CVQCLHmGW5TmEWe/6BXwfSpNP0LpdwOfeaf6sZGKk00TjZtedAT9c5zqyoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZlSKummqDwyA7XSeCEvJAjoFOPoUHXJcN868r8iNcY=;
 b=mNarN6+umvPffiILeCxxRzcdtDO0yNXElXJ9oF1udVDoHedZRhE0vqdUjdihVRx7bNz53jS5GqOeEv96p61xRGNC+CSFhOvp+O3366p8dedc9kk3kuLREMhC5cqA2PWAUC8W/i3xzL4Eb+QC+ZAQ7kMpOv+bQj6GSbRTBp70Wno=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: db805199d11b63d7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRfJtSgh7DCh7K2+1KAE7utDGA1YBrNR/WgqT7HlCuPdCUCVwrEZrZ25Rp34lxIKls4ayfb3frAWezlLnN07HAvflzWHcI803nONPl/x7yDkssrVWp375RvSORIt2OdYW5WPkMQ4O4KkUeM92JdXWtuu7iBbqFU0ekKioATYa9rF3A7lRr55/PWO+N9RMUMAcyh1l7fXQLRRYSnwoOC4+IZ35zhVLzKeas6mRqtyBcTYMeem5odeZSaN9nM3MFVrymnmT96Dpu5Nn98IxvG/f/fFEYiwqrMurZv92puba0Qdd96QUn+sHGdA3MHSXlmXiG3rYsIcNvjT8mtB8lQD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZlSKummqDwyA7XSeCEvJAjoFOPoUHXJcN868r8iNcY=;
 b=Z92UR6A873UJhF/+ajwtuu3GNT37pmLu8kCgetj9AG3hR+K3//H5XfjjCsjQd+K/jsyn69TB35VoIqRIE1sbDfobQ/cDMs+S2qbmYjOGyeysodMrwszuWx7vZ3f/fLzo4owMR6iMCggjyVhHpiLH9RqeWJEr1j5sifxr2GmUJ2N/e+G4IHd4/NZZT3huGCR3q9+KmGXbyRvbT1s9eXXZOIRCGUggahtK/IIvEA7CM0MNN/k6h2/Cy4EBwpBsjfk9qg81HIjHjgymaIj57IIk3aJUMBrPiP6/5rFswxmMk3D6Dey3PlfGSzIwR2uhqipZk5Gi+IgYMxpZCG3vdQmHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZlSKummqDwyA7XSeCEvJAjoFOPoUHXJcN868r8iNcY=;
 b=mNarN6+umvPffiILeCxxRzcdtDO0yNXElXJ9oF1udVDoHedZRhE0vqdUjdihVRx7bNz53jS5GqOeEv96p61xRGNC+CSFhOvp+O3366p8dedc9kk3kuLREMhC5cqA2PWAUC8W/i3xzL4Eb+QC+ZAQ7kMpOv+bQj6GSbRTBp70Wno=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen development discussion <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/domain: fix comment for arch_set_info_guest
Thread-Topic: [PATCH] arm/domain: fix comment for arch_set_info_guest
Thread-Index: AQHYqMxj+SsCb6WfSkeThh/1USfbDq2gSIcA
Date: Fri, 5 Aug 2022 13:12:50 +0000
Message-ID: <7ED079C7-4A8A-45EF-8DC7-539D338F8535@arm.com>
References: <20220805130800.16387-1-luca.fancellu@arm.com>
In-Reply-To: <20220805130800.16387-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bfc08538-26c8-490e-ab7f-08da76e43c6e
x-ms-traffictypediagnostic:
	GV1PR08MB8473:EE_|AM5EUR03FT015:EE_|AM0PR08MB5362:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LhVKvsjkGdK5FCTWgJUi50KXPD9TBUb2zClOrjS57FiXJt1W76Xl0klzmc2doLGpNnR+aKlDHQJ4EYmbkM5xaX2kNdUXg3MhX7cD/F6/aLNyzfLvJILU5wgG9mKMpz7ZmLDwPGLC+MCSDD4n9H3yn8h33Lw3l6X4q8w5R1NDrm3FJP56rHcrgoKYMprQuzejvlA78QE0US73O4txMiSkoBVfnGZzv08cJXUenjQ8DUte/pZD8CT2Dm8pNJ+w4mFaLGJZBENAawwB2It9Bhc2e7ZQnXvsdSgdMlElcTF0F8t9Fy45Nn2qSoYejFCCy/b39+XG21skRhKshfKXbg79OOyo9SokyAahzyAGnd+OIr2Q9KdhEN3w8AAgPjiKInuh+QbE4KvyhePJOiMW/LtbKg0x45QGYxHLPxk1x0DJ+LKCKPrfG8PgJPA4LpBhC9rYeYxdHl3nhFyP1455kXxb1UV0va5uQdzhZtGUwwBJvA/jwDSqALhJGFgbwFMwcUWYvFg+eomdOO8xQEJNZjYMWfNAkqQcC9FymexNGSlgIs63BLTQISi27uCZ48AyoAxWIDVRVZ8M9JXnnwgmpDRWaUgckC8BFhBIJGElUN+nqqb+SKtAw4/DvthAcDIApVKI4Uu2O0I8fatBsppiI+A8FdblZQbxFTiaA390QKwjMqPphw33p2NfMOpZ7ML/k3QwvB/dw6qeh5bFUsoksrhdblIsVcWTgw07iO+EkBm2D/7tms9i3sAaGg8q6MZ9AOC1+UI5NA7W32MmNPrJwL3SWFvR1umNI8xfoF6hlaFtV4SgPGMnOlvbFbgaxKJkmYFDnpGJt89pRul3YA9w8glBEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(2906002)(478600001)(8936002)(38100700002)(6506007)(6512007)(36756003)(26005)(53546011)(54906003)(6916009)(316002)(2616005)(91956017)(122000001)(4326008)(41300700001)(64756008)(76116006)(66556008)(66476007)(66446008)(66946007)(86362001)(8676002)(83380400001)(71200400001)(6486002)(38070700005)(5660300002)(186003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B21AD160A45D04EA9FF183628EBA995@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8473
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf4560da-c9ee-43bc-0bc4-08da76e43327
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	65OiH8Jo7EDztNaAC9ks4neNeu82+xafaDXHz33GV47ZzTOdxs9Npe2/5FDXkHtYATNYnfaWeCHNF6HAy9ScwI4Son3YEnqjI+KKOutVdcIMYq/sVufOgRobKlKxqMBiEdTk/IMlZki9GU3MP1Ngty3iUrtmZCZJegqiwJSPSyQUlGVlcXHi4wy1m6SZ4mRyiXB5EWdVGxMk4L8/KBPrN1iu7AKMvpvcSwUuSX8BFSrF7z5uokKE0vGV6f2Wg4RFZOGBCQCt2vGNrBWyiCMuakEtaga2ApvdTr01yi+En2nuy9kSeWTg1XH7/wXuLqnZCMBe+U6J9gmw3dSvJd+SfmWwTI9gRWR6oibdsAzNTMX736qyXgnOjrSd+BZtfWf3JXt5mHx2XV73853+vRnOCue+n1+S7V6j6LjOTpPQXw5j7wwM3UD7GcVK/fcodAYkqrt0CT8cps63z3SPj10qiuy5hFlVpl0ZxvJrAOQVxnMoJJ+JoWf9EAVYSxTsyzwTT1ho7A+Vzjw8Nmy4dkMf3nUhXRuF0OhsMBEBCsfgu8O/FxXJJRXHwbdWmXVAM3KwHexZgyxzam2FGAtP97cON9tJT/n8lG6BASavVck1JR56b9lAA9uQZvOfSCSTREqchliDWrNJXRHQWfxQwbfIvQN6Iof0wfQQuQAgddcHb1YKH3jZCYAomMRLPs+ntpagLJ6ByJn2SnrRdIry4J7Ws9rHNsDx584UvgHUGIAI1eY8H99zYf1WJWzjwiunQ/VHwx7qu2RWi8o70qbIZ9DasNIpp6EtF+TF5/qns7d77VauoyCLLh1qxpfvxIOuNJDk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966006)(40470700004)(36840700001)(6486002)(8936002)(70586007)(70206006)(2616005)(8676002)(6916009)(54906003)(5660300002)(4326008)(53546011)(6506007)(41300700001)(6512007)(107886003)(26005)(2906002)(36756003)(47076005)(40460700003)(81166007)(83380400001)(186003)(86362001)(336012)(33656002)(356005)(36860700001)(40480700001)(316002)(478600001)(82310400005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 13:13:06.4228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc08538-26c8-490e-ab7f-08da76e43c6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5362



> On 5 Aug 2022, at 14:08, Luca Fancellu <luca.fancellu@arm.com> wrote:
>=20
> The function arch_set_info_guest is not reached anymore through
> VCPUOP_initialise on arm, update the comment.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Hi All,

Sorry I forgot to put v2 in the tag.

Cheers,
Luca

> ---
> Changes in v2:
> - rephrased comment to not list caller functions (Julien)
> ---
> xen/arch/arm/domain.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2cd481979cf1..9db8a37a089c 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -885,9 +885,8 @@ static int is_guest_pv64_psr(uint64_t psr)
> #endif
>=20
> /*
> - * Initialise VCPU state. The context can be supplied by either the
> - * toolstack (XEN_DOMCTL_setvcpucontext) or the guest
> - * (VCPUOP_initialise) and therefore must be properly validated.
> + * Initialise vCPU state. The context may be supplied by an external ent=
ity, so
> + * we need to validate it
>  */
> int arch_set_info_guest(
>     struct vcpu *v, vcpu_guest_context_u c)
> --=20
> 2.17.1
>=20
>=20


