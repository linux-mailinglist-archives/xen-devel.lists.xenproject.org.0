Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296BB60E1DB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 15:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430564.682391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongIH-0002ao-Bw; Wed, 26 Oct 2022 13:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430564.682391; Wed, 26 Oct 2022 13:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongIH-0002YS-8R; Wed, 26 Oct 2022 13:18:05 +0000
Received: by outflank-mailman (input) for mailman id 430564;
 Wed, 26 Oct 2022 13:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+8N7=23=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1ongIF-0002YM-Ux
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 13:18:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9df2a416-5530-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 15:18:01 +0200 (CEST)
Received: from AS9PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:20b:464::27)
 by GV2PR08MB9421.eurprd08.prod.outlook.com (2603:10a6:150:dd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 13:17:58 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::e4) by AS9PR06CA0083.outlook.office365.com
 (2603:10a6:20b:464::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 13:17:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 26 Oct 2022 13:17:57 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 26 Oct 2022 13:17:57 +0000
Received: from 7b2fe9640039.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 38E44109-FB3B-4D24-9E53-5EF46F7146E5.1; 
 Wed, 26 Oct 2022 13:17:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b2fe9640039.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 13:17:46 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PAWPR08MB9517.eurprd08.prod.outlook.com (2603:10a6:102:2eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 13:17:43 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3120:4825:cfd7:e572]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3120:4825:cfd7:e572%4]) with mapi id 15.20.5709.015; Wed, 26 Oct 2022
 13:17:43 +0000
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
X-Inumbo-ID: 9df2a416-5530-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F/jEgtfh7dsxALAxiyDYGSrXDtnDfpoIB2FWP/IT71KLfHTPN9Xkzqvgvp+ztUIR2iyjqaQqyTgmVCbHyGR/h+NxCjGhUTWf2Ko2HM2/UZW1ik0BZ/InBde3vBKa0GRtsEXGJpb618/2nAU5FUAIWg4SCvdd2Qo7gMrY4pKI2DUW0WxhamVEOrRRBvop5pkCbGNMtIHuUFh9didCRHR9nNCSZhYafPzl+u12n+BGc26iZQPdaX5Gksn8k62XintCHItFflNOHalHu1NBG4ZC1XjmVP6fj1H4OkZ+nprVHQyZc4MfO18jSlX1DRO3z0OntbvjIIkL8CG9WgDK5kN16Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L45+M+So87NQD79rx1b/VxFV+qYJWUyiyGYdUS3X/o=;
 b=Em70HyqAuLE1xJj/VDKc2+zJNpdQpPVcYfl6MeZmyteqB66K1p9u4ilidEZGSMo0zQwRyXbymCaZb/t3jwn279oX+Gd8wOn+o8/DBO+MyaFc0oawOJGTgv6YdkJ+HwIQIJ+O/dpgeVdxCSMouCh/GF/qRbYNqUvuEUcDfUCHnZzZ/0NP8U5M25qywYz3rQMp44cDcBRxkm2SZtTw6OjZ5ou+6EufeOYQB2jkK39SXARAOB/pQDtOUAnsyiFZxb4eVv3BLwusmt2x81/YZ9HfJ3ylTccS9y54jJA/kuWC76aR6zdY5/F6UB5A8rCKxg/JJ/G+PENPx04dodVh2Vuyfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7L45+M+So87NQD79rx1b/VxFV+qYJWUyiyGYdUS3X/o=;
 b=IOz7SXIwr7pgllZisP9izE0Pk+/zckU2Tpng8SGc/1wgvCWbhZMd6Pk1l8rUxTECAZ4t/RbBQuJratYgINt91SQ+Y62nlflyWLghlDqwq3aLbTbqhML8kYDZJ8RqfWIJbhHRMJcUj/Dty0xqkw6MiFRgYNjVH05BcwlpIZ/w4f0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd64b4cae576e573
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8PzA9xPZ5xvBrJSeyNL7NMj6036AclA+87zy80v+7uqZur3efrRfywQb6l9iN+gUGc3WvGsLOAzxFIku6IefOiynQWWraEWX/WkC7CTklWV91uX4TtdwH9fav4exAvniXCkAzWUpJbWaGYOLREnjOaVPUt6zMiQpPjOfKgL1MRY2V2BXADzNmbkO8sJzueVSxT9uWymIy/W0Wr3VWxlIAiAW8UIky9hsdzc67DqlGZfSyjTdO1Ay4szkaPOpu4+3dMdxbKA5gEY+7BIbabZgmeOXjJRkwh35T6nCGVc3lN6mwataLImIZBS9E5OW00kZ6cEOsFqZvSq5Z9dR/ukHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L45+M+So87NQD79rx1b/VxFV+qYJWUyiyGYdUS3X/o=;
 b=LL+hrEyQYQG8j6BXqi5FxSpuJvvW6et0tk6UMcErtK5CIpzFPVKyBeBkGbFC/QaC9TFCrpZTm1jjDHk+ULLybrmvq+OTk80uDt4BPPniSo15oYTQfJSvwkN3pDYYRAx1hXl+m04lrfa3iOnbHmHOVS381605GrRm2xQCYjKQWiVoQQBbtpiI7aFbaCqncX3dGPlAydGPYGfmac7MnrO1uwyyCFOoUvZNdQndeEvU0jzl7brI1pa+vzbqW1FUdV6c8MfrzLF/CYWPu5iY0d0r8NnKcC53b7wbygFeWKcuAeF1t62PGdsWR+5zBE5BWYyh5HzTjM61ARpYF/H9ltxOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7L45+M+So87NQD79rx1b/VxFV+qYJWUyiyGYdUS3X/o=;
 b=IOz7SXIwr7pgllZisP9izE0Pk+/zckU2Tpng8SGc/1wgvCWbhZMd6Pk1l8rUxTECAZ4t/RbBQuJratYgINt91SQ+Y62nlflyWLghlDqwq3aLbTbqhML8kYDZJ8RqfWIJbhHRMJcUj/Dty0xqkw6MiFRgYNjVH05BcwlpIZ/w4f0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <Michal.Orzel@arm.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough devices
Thread-Topic: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Index: AQHY6T1V+gcJbmRqpEyt0b8GeG9bFg==
Date: Wed, 26 Oct 2022 13:17:43 +0000
Message-ID: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|PAWPR08MB9517:EE_|AM7EUR03FT025:EE_|GV2PR08MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a033e6-304e-4602-0453-08dab7547fde
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kTE2MMJ8pjlDVY/VOVyo1PUu6qlHZ+3tQpgCLZwnumHSf3Tt0hxN1Jg2VkWD/lsl/Hw1ow9YQJncHtwmG6bkJBnZW/ayXXpA7eCgLCMcNXzgUa6NnpKVuA/EAnawcYmbYkMb4EXq3GCUBRzvi7KxRNGCAYRen6q67uSlzY3QO9gssBCyorkqoOOaytzMeqy2YMylfVm7HLKdRjLgfJCj5NtVH/QTcgezzlmvzEu11LUBkqS/UtffO3HX/oJoq43Rxp1YlWs+X9zuCv6blZVzF9oeLu99tOdZG7UxszEipdWLAUZXG45haP+pSyGGVXFZavysz+70DtIrkZ2wpNmfwPRFjDcu4dlyvMb8dHBiKlg8Mf/W28QZgSD2qB+CefT9pHYTvQlfYN1m3DjkZrJzXEGhszNkQE1ZT1rTxpRTRzQpKb7kABRnRMW9q2iubtTIKsG9mIWnNbo3IDf8VunkcA6Zb4cpN+061epEhjqdioMAV6mVf2BqLBUZdGykHcfmE0qR+js9p5B5XL5F6FJK++D3fAJ40G+GwEhs7CYxLUx08LmqIO6YDxNQPU3i3NxXrt87K+b9RmapN8F9p4GhkqbDBDJ4+WKuz4d4W1odcbWN/CnEKYiEQ2WhhyBix4WtXZdp2+FZZxnis/+JAduiCrxJCwnm1jsIKWHAq3X/USUNAE2Yl5DtwMlOCKc/fhVkOu2MdiVWAPRi8kjiB8BHzsNlgWZTknTPRjRv82N/uBdSOKeXRM4egBfvvleow7wkPy/wSOZHJ0u6VtrreA+WPomx/2+1QGtsWvRpS+blkZ5cDlvibCtUWFZal1RJ4yFgx5rjj06sijRYIORzTGMxxavQPWUDUW0/sa4tX9nSBlw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199015)(478600001)(966005)(86362001)(71200400001)(2906002)(38100700002)(122000001)(36756003)(66556008)(38070700005)(6486002)(2616005)(33656002)(186003)(83380400001)(76116006)(8676002)(91956017)(66946007)(316002)(4326008)(6506007)(66476007)(66446008)(41300700001)(64756008)(5660300002)(54906003)(6916009)(8936002)(6512007)(26005)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <99F6895D1FE9CE449C220739161C5DA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9517
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	efa7997b-402d-4647-9860-08dab7547791
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5caKnq/O8xvgRK2yRNp2nyUPdr9KGc4ohzICVR3ZSFnUVYJQbfao8U4HiR/Rl5qzW2OlKyM5flpVG0g0y+lUQWNE5P/BncwaEu8S5fVK6l/3UsIoMWfX25ktwMw26Rkh6PT5TD8fbRK2kdQXIEdmso0n9wPHMcQnFxaoRFoFaq/9S4hho74QVBfk2c2rfGoQEolUKkXkNomA51ooE3RtUlN2zTb2v6wjZirfxNdJFXaV9pWy7FKWsqdBgFhJ2r9Vrn3+KlHO5zzZp3GKb58TV/hRkmo85wwFmd561hi6/6Yp4J3wQ2v1SsgI3h48nGUNeH0XMVXiywJLsZVRXft6RFmXRjN65y65DIpH2fvwS/svesZZxMw0EeuYvieNaX17uzd/RiYmYEoFksJc1uE7MGKSYuScWbSY1HXTZqPzpr5HRKzpni+mb0AWUdqNk4QdWJFmMSMnZ/m1Fq4B2jodE//G7gBOPfy5OzvwDMhdjgO3Ia9NgC+kuniS48mXFTXaBXaedCChfJzGv805Rulmie44LFsNa3FGnVRUrUKdFzsjH4BHGNga95GMRlzOTWswN7d5F2MfIwqrljw1PYFDUGJocd/rUZ7xOfRi747+A2tg4htnWa6gy/C7DFciR7kCU3UXLZSz1sGcUm2RUEupcN7lfeBIjmu1TkFgaJicfpO23h71f6mnFcA5gqfcUTHr8M6/zxNck7dKEEPs/qu9Sn/oLBwzAXMXBVuNfHbnRDs0ps8ctwFolIuH9Oz6NpsXcCn7TzyCQW1uAOJpB1QjgMOuxJnoejDmWP0crghX+noA+mMpBNHApxpc/AqFWmm5uZBe79lmvCxFAY1dkwbobg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(107886003)(6506007)(41300700001)(6916009)(82740400003)(36756003)(5660300002)(54906003)(40460700003)(316002)(70586007)(40480700001)(81166007)(966005)(6486002)(356005)(8676002)(8936002)(86362001)(4326008)(478600001)(70206006)(33656002)(26005)(82310400005)(83380400001)(2616005)(6512007)(2906002)(47076005)(36860700001)(336012)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 13:17:57.5957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a033e6-304e-4602-0453-08dab7547fde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9421

SGkgQWxsLA0KDQpBdCBBcm0sIHdlIHN0YXJ0ZWQgdG8gaW1wbGVtZW50IHRoZSBQT0MgdG8gc3Vw
cG9ydCAyIGxldmVscyBvZiBwYWdlIHRhYmxlcy9uZXN0ZWQgdHJhbnNsYXRpb24gaW4gU01NVXYz
Lg0KVG8gc3VwcG9ydCBuZXN0ZWQgdHJhbnNsYXRpb24gZm9yIGd1ZXN0IE9TIFhlbiBuZWVkcyB0
byBleHBvc2UgdGhlIHZpcnR1YWwgSU9NTVUuIElmIHdlIHBhc3N0aHJvdWdoIHRoZQ0KZGV2aWNl
IHRvIHRoZSBndWVzdCB0aGF0IGlzIGJlaGluZCBhbiBJT01NVSBhbmQgdmlydHVhbCBJT01NVSBp
cyBlbmFibGVkIGZvciB0aGUgZ3Vlc3QgdGhlcmUgaXMgYSBuZWVkIHRvDQphZGQgSU9NTVUgYmlu
ZGluZyBmb3IgdGhlIGRldmljZSBpbiB0aGUgcGFzc3Rocm91Z2ggbm9kZSBhcyBwZXIgWzFdLiBU
aGlzIGVtYWlsIGlzIHRvIGdldCBhbiBhZ3JlZW1lbnQgb24NCmhvdyB0byBhZGQgdGhlIElPTU1V
IGJpbmRpbmcgZm9yIGd1ZXN0IE9TLg0KDQpCZWZvcmUgSSB3aWxsIGV4cGxhaW4gaG93IHRvIGFk
ZCB0aGUgSU9NTVUgYmluZGluZyBsZXQgbWUgZ2l2ZSBhIGJyaWVmIG92ZXJ2aWV3IG9mIGhvdyB3
ZSB3aWxsIGFkZCBzdXBwb3J0IGZvciB2aXJ0dWFsDQpJT01NVSBvbiBBcm0uIEluIG9yZGVyIHRv
IGltcGxlbWVudCB2aXJ0dWFsIElPTU1VIFhlbiBuZWVkIFNNTVV2MyBOZXN0ZWQgdHJhbnNsYXRp
b24gc3VwcG9ydC4gU01NVXYzIGhhcmR3YXJlDQpzdXBwb3J0cyB0d28gc3RhZ2VzIG9mIHRyYW5z
bGF0aW9uLiBFYWNoIHN0YWdlIG9mIHRyYW5zbGF0aW9uIGNhbiBiZSBpbmRlcGVuZGVudGx5IGVu
YWJsZWQuIEFuIGluY29taW5nIGFkZHJlc3MgaXMgbG9naWNhbGx5DQp0cmFuc2xhdGVkIGZyb20g
VkEgdG8gSVBBIGluIHN0YWdlIDEsIHRoZW4gdGhlIElQQSBpcyBpbnB1dCB0byBzdGFnZSAyIHdo
aWNoIHRyYW5zbGF0ZXMgdGhlIElQQSB0byB0aGUgb3V0cHV0IFBBLiBTdGFnZSAxIGlzDQppbnRl
bmRlZCB0byBiZSB1c2VkIGJ5IGEgc29mdHdhcmUgZW50aXR5KCBHdWVzdCBPUykgdG8gcHJvdmlk
ZSBpc29sYXRpb24gb3IgdHJhbnNsYXRpb24gdG8gYnVmZmVycyB3aXRoaW4gdGhlIGVudGl0eSwg
Zm9yIGV4YW1wbGUsDQpETUEgaXNvbGF0aW9uIHdpdGhpbiBhbiBPUy4gU3RhZ2UgMiBpcyBpbnRl
bmRlZCB0byBiZSBhdmFpbGFibGUgaW4gc3lzdGVtcyBzdXBwb3J0aW5nIHRoZSBWaXJ0dWFsaXph
dGlvbiBFeHRlbnNpb25zIGFuZCBpcw0KaW50ZW5kZWQgdG8gdmlydHVhbGl6ZSBkZXZpY2UgRE1B
IHRvIGd1ZXN0IFZNIGFkZHJlc3Mgc3BhY2VzLiBXaGVuIGJvdGggc3RhZ2UgMSBhbmQgc3RhZ2Ug
MiBhcmUgZW5hYmxlZCwgdGhlIHRyYW5zbGF0aW9uDQpjb25maWd1cmF0aW9uIGlzIGNhbGxlZCBu
ZXN0aW5nLg0KDQpTdGFnZSAxIHRyYW5zbGF0aW9uIHN1cHBvcnQgaXMgcmVxdWlyZWQgdG8gcHJv
dmlkZSBpc29sYXRpb24gYmV0d2VlbiBkaWZmZXJlbnQgZGV2aWNlcyB3aXRoaW4gdGhlIGd1ZXN0
IE9TLiBYRU4gYWxyZWFkeSBzdXBwb3J0cw0KU3RhZ2UgMiB0cmFuc2xhdGlvbiBidXQgdGhlcmUg
aXMgbm8gc3VwcG9ydCBmb3IgU3RhZ2UgMSB0cmFuc2xhdGlvbiBmb3IgZ3Vlc3RzLiBXZSB3aWxs
IGFkZCBzdXBwb3J0IGZvciBndWVzdHMgdG8gY29uZmlndXJlDQp0aGUgU3RhZ2UgMSB0cmFuc2l0
aW9uIHZpYSB2aXJ0dWFsIElPTU1VLiBYRU4gd2lsbCBlbXVsYXRlIHRoZSBTTU1VIGhhcmR3YXJl
IGFuZCBleHBvc2VzIHRoZSB2aXJ0dWFsIFNNTVUgdG8gdGhlIGd1ZXN0Lg0KR3Vlc3QgY2FuIHVz
ZSB0aGUgbmF0aXZlIFNNTVUgZHJpdmVyIHRvIGNvbmZpZ3VyZSB0aGUgc3RhZ2UgMSB0cmFuc2xh
dGlvbi4gV2hlbiB0aGUgZ3Vlc3QgY29uZmlndXJlcyB0aGUgU01NVSBmb3IgU3RhZ2UgMSwNClhF
TiB3aWxsIHRyYXAgdGhlIGFjY2VzcyBhbmQgY29uZmlndXJlIHRoZSBoYXJkd2FyZSBhY2NvcmRp
bmdseS4NCg0KTm93IGJhY2sgdG8gdGhlIHF1ZXN0aW9uIG9mIGhvdyB3ZSBjYW4gYWRkIHRoZSBJ
T01NVSBiaW5kaW5nIGJldHdlZW4gdGhlIHZpcnR1YWwgSU9NTVUgYW5kIHRoZSBtYXN0ZXIgZGV2
aWNlcyBzbyB0aGF0DQpndWVzdHMgY2FuIGNvbmZpZ3VyZSB0aGUgSU9NTVUgY29ycmVjdGx5LiBU
aGUgc29sdXRpb24gdGhhdCBJIGFtIHN1Z2dlc3RpbmcgaXMgYXMgYmVsb3c6DQoNCkZvciBkb20w
LCB3aGlsZSBoYW5kbGluZyB0aGUgRFQgbm9kZShoYW5kbGVfbm9kZSgpKSBYZW4gd2lsbCByZXBs
YWNlIHRoZSBwaGFuZGxlIGluIHRoZSAiaW9tbXVzIiBwcm9wZXJ0eSB3aXRoIHRoZSB2aXJ0dWFs
DQpJT01NVSBub2RlIHBoYW5kbGUuDQoNCkZvciBkb21VIGd1ZXN0cywgd2hlbiBwYXNzdGhyb3Vn
aCB0aGUgZGV2aWNlIHRvIHRoZSBndWVzdCBhcyBwZXIgWzJdLCAgYWRkIHRoZSBiZWxvdyBwcm9w
ZXJ0eSBpbiB0aGUgcGFydGlhbCBkZXZpY2UgdHJlZQ0Kbm9kZSB0aGF0IGlzIHJlcXVpcmVkIHRv
IGRlc2NyaWJlIHRoZSBnZW5lcmljIGRldmljZSB0cmVlIGJpbmRpbmcgZm9yIElPTU1VcyBhbmQg
dGhlaXIgbWFzdGVyKHMpDQoNCiJpb21tdXMgPSA8ICZtYWdpY19waGFuZGxlIDB4dk1hc3RlcklE
PiAgDQoJ4oCiIG1hZ2ljX3BoYW5kbGUgd2lsbCBiZSB0aGUgcGhhbmRsZSAoIHZJT01NVSBwaGFu
ZGxlIGluIHhsKSAgdGhhdCB3aWxsIGJlIGRvY3VtZW50ZWQgc28gdGhhdCB0aGUgdXNlciBjYW4g
c2V0IHRoYXQgaW4gcGFydGlhbCBEVCBub2RlICgweGZkZWEpLiAgDQoJ4oCiIHZNYXN0ZXJJRCB3
aWxsIGJlIHRoZSB2aXJ0dWFsIG1hc3RlciBJRCB0aGF0IHRoZSB1c2VyIHdpbGwgcHJvdmlkZS4N
Cg0KVGhlIHBhcnRpYWwgZGV2aWNlIHRyZWUgd2lsbCBsb29rIGxpa2UgdGhpczoNCi9kdHMtdjEv
Ow0KIA0KLyB7DQogICAgLyogIypjZWxscyBhcmUgaGVyZSB0byBrZWVwIERUQyBoYXBweSAqLw0K
ICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KICAgICNzaXplLWNlbGxzID0gPDI+Ow0KIA0KICAg
IGFsaWFzZXMgew0KICAgICAgICBuZXQgPSAmbWFjMDsNCiAgICB9Ow0KIA0KICAgIHBhc3N0aHJv
dWdoIHsNCiAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCiAgICAgICAgcmFuZ2Vz
Ow0KICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCiAgICAgICAgI3NpemUtY2VsbHMgPSA8
Mj47DQogICAgICAgIG1hYzA6IGV0aGVybmV0QDEwMDAwMDAwIHsNCiAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiY2FseGVkYSxoYi14Z21hYyI7DQogICAgICAgICAgICByZWcgPSA8MCAweDEwMDAw
MDAwIDAgMHgxMDAwPjsNCiAgICAgICAgICAgIGludGVycnVwdHMgPSA8MCA4MCA0ICAwIDgxIDQg
IDAgODIgND47DQogICAgICAgICAgIGlvbW11cyA9IDwweGZkZWEgMHgwMT47DQogICAgICAgIH07
DQogICAgfTsNCn07DQogDQpJbiB4bC5jZmcgd2UgbmVlZCB0byBkZWZpbmUgYSBuZXcgb3B0aW9u
IHRvIGluZm9ybSBYZW4gYWJvdXQgdk1hc3RlcklkIHRvIHBNYXN0ZXJJZCBtYXBwaW5nIGFuZCB0
byB3aGljaCBJT01NVSBkZXZpY2UgdGhpcw0KdGhlIG1hc3RlciBkZXZpY2UgaXMgY29ubmVjdGVk
IHNvIHRoYXQgWGVuIGNhbiBjb25maWd1cmUgdGhlIHJpZ2h0IElPTU1VLiBUaGlzIGlzIHJlcXVp
cmVkIGlmIHRoZSBzeXN0ZW0gaGFzIGRldmljZXMgdGhhdCBoYXZlDQp0aGUgc2FtZSBtYXN0ZXIg
SUQgYnV0IGJlaGluZCBhIGRpZmZlcmVudCBJT01NVS4NCiANCmlvbW11X2RldmlkX21hcCA9IFsg
4oCcUE1BU1RFUl9JRFtAVk1BU1RFUl9JRF0sSU9NTVVfQkFTRV9BRERSRVNT4oCdICwg4oCcUE1B
U1RFUl9JRFtAVk1BU1RFUl9JRF0sSU9NTVVfQkFTRV9BRERSRVNT4oCdXQ0KDQoJ4oCiIFBNQVNU
RVJfSUQgaXMgdGhlIHBoeXNpY2FsIG1hc3RlciBJRCBvZiB0aGUgZGV2aWNlIGZyb20gdGhlIHBo
eXNpY2FsIERULg0KCeKAoiBWTUFTVEVSX0lEIGlzIHRoZSB2aXJ0dWFsIG1hc3RlciBJZCB0aGF0
IHRoZSB1c2VyIHdpbGwgY29uZmlndXJlIGluIHRoZSBwYXJ0aWFsIGRldmljZSB0cmVlLg0KCeKA
oiBJT01NVV9CQVNFX0FERFJFU1MgaXMgdGhlIGJhc2UgYWRkcmVzcyBvZiB0aGUgcGh5c2ljYWwg
SU9NTVUgZGV2aWNlIHRvIHdoaWNoIHRoaXMgZGV2aWNlIGlzIGNvbm5lY3RlZC4gDQogDQpFeGFt
cGxlOiBMZXQncyBzYXkgdGhlIHVzZXIgd2FudHMgdG8gYXNzaWduIHRoZSBiZWxvdyBwaHlzaWNh
bCBkZXZpY2UgaW4gRFQgdG8gdGhlIGd1ZXN0Lg0KIA0KaW9tbXVANGYwMDAwMDAgew0KICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLHNtbXUtdjMiOw0KICAgICAgICAgICAgIAlpbnRl
cnJ1cHRzID0gPDB4MDAgMHhlNCAweGYwND47DQogICAgICAgICAgICAgICAgaW50ZXJydXB0LXBh
cmVudCA9IDwweDAxPjsNCiAgICAgICAgICAgICAgICAjaW9tbXUtY2VsbHMgPSA8MHgwMT47DQog
ICAgICAgICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImNvbWJpbmVkIjsNCiAgICAgICAgICAg
ICAgICByZWcgPSA8MHgwMCAweDRmMDAwMDAwIDB4MDAgMHg0MDAwMD47DQogICAgICAgICAgICAg
ICAgcGhhbmRsZSA9IDwweGZkZWI+Ow0KICAgICAgICAgICAgICAgIG5hbWUgPSAiaW9tbXUiOw0K
fTsNCiANCnRlc3RAMTAwMDAwMDAgew0KCWNvbXBhdGlibGUgPSAidmlvbW11LXRlc3TigJ07DQoJ
aW9tbXVzID0gPDB4ZmRlYiAweDEwPjsNCglpbnRlcnJ1cHRzID0gPDB4MDAgMHhmZiAweDA0PjsN
CglyZWcgPSA8MHgwMCAweDEwMDAwMDAwIDB4MDAgMHgxMDAwPjsNCgluYW1lID0gInZpb21tdS10
ZXN0IjsNCn07DQogDQpUaGUgcGFydGlhbCBEZXZpY2UgdHJlZSBub2RlIHdpbGwgYmUgbGlrZSB0
aGlzOg0KIA0KLyB7DQogICAgLyogIypjZWxscyBhcmUgaGVyZSB0byBrZWVwIERUQyBoYXBweSAq
Lw0KICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KICAgICNzaXplLWNlbGxzID0gPDI+Ow0KIA0K
ICAgIHBhc3N0aHJvdWdoIHsNCiAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCiAg
ICAgICAgcmFuZ2VzOw0KICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCiAgICAgICAgI3Np
emUtY2VsbHMgPSA8Mj47DQoNCgl0ZXN0QDEwMDAwMDAwIHsNCiAgICAgICAgICAgIAljb21wYXRp
YmxlID0gInZpb21tdS10ZXN0IjsNCiAgICAgICAgICAgIAlyZWcgPSA8MCAweDEwMDAwMDAwIDAg
MHgxMDAwPjsNCiAgICAgICAgICAgIAlpbnRlcnJ1cHRzID0gPDAgODAgNCAgMCA4MSA0ICAwIDgy
IDQ+Ow0KICAgICAgICAgICAgCWlvbW11cyA9IDwweGZkZWEgMHgwMT47DQogICAgICAgIH07DQog
ICAgfTsNCn07DQogDQogaW9tbXVfZGV2aWRfbWFwID0gWyDigJwweDEwQDB4MDEsMHg0ZjAwMDAw
MOKAnV0NCgnigKIgMHgxMCBpcyB0aGUgcmVhbCBwaHlzaWNhbCBtYXN0ZXIgaWQgZnJvbSB0aGUg
cGh5c2ljYWwgRFQuDQoJ4oCiIDB4MDEgaXMgdGhlIHZpcnR1YWwgbWFzdGVyIElkIHRoYXQgdGhl
IHVzZXIgZGVmaW5lcyBhcyBhIHBhcnRpYWwgZGV2aWNlIHRyZWUuDQoJ4oCiIDB4NGYwMDAwMDAg
aXMgdGhlIGJhc2UgYWRkcmVzcyBvZiB0aGUgSU9NTVUgZGV2aWNlLg0KDQpbMV0gaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11
L2lvbW11LnR4dA0KWzJdIGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5zdGFibGUvbWlz
Yy9hcm0vcGFzc3Rocm91Z2gudHh0DQoNClJlZ2FyZHMsDQpSYWh1bA0K

