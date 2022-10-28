Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17CC610882
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 04:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431378.684224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooFY3-0007t0-UP; Fri, 28 Oct 2022 02:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431378.684224; Fri, 28 Oct 2022 02:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooFY3-0007qh-RG; Fri, 28 Oct 2022 02:56:43 +0000
Received: by outflank-mailman (input) for mailman id 431378;
 Fri, 28 Oct 2022 02:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/aT=25=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ooFY2-0007qb-8z
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 02:56:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22c6e0e4-566c-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 04:56:36 +0200 (CEST)
Received: from DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) by DU0PR08MB8493.eurprd08.prod.outlook.com
 (2603:10a6:10:406::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Fri, 28 Oct
 2022 02:56:24 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::e0) by DUZPR01CA0086.outlook.office365.com
 (2603:10a6:10:46a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 02:56:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 02:56:23 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 28 Oct 2022 02:56:23 +0000
Received: from 04977826e0d5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 316BC360-9FEB-4AB9-B292-3B362551DC30.1; 
 Fri, 28 Oct 2022 02:56:14 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04977826e0d5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 02:56:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 28 Oct
 2022 02:56:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 02:56:13 +0000
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
X-Inumbo-ID: 22c6e0e4-566c-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=e+24LfDAy1mzvoxuQYtHstEtdOKFZlGyO1Y4hcpxXjcDe5e/oXkhiaWZRjgHgo/KTJ0j6m+MnE22H3++csbW7NMP9TbkRy8QpOKJ7hRYlb4NxTex4IL9Uha3KrB68DogHWO7VWDmAeXWvFdWvoMeuuo+ZCvOebxpU5vMJ5b9fjk9FlYxN4n2RF3tNYk2QGOnjGYZrODG+8j6ek/+mqk4p7jfC77idw3rVjSBwf9VQ+E6AmSNyrOL3y0K7MtY1CKY1G2z3Wi8bEf+eAJeFq/QqPeb24qttnF/4WvxJszG6kNPvLVBDZIau5FcgTLmBSwwkqo3nx7cBoEQPQpUA8G0sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UEgP8UdKuw1heNoBAVkzU29+rag/Yv31sWuP0bWZ/M=;
 b=KyofLWc5S5/D3yeITiTqZsDARU58hMQowFcyEqAT8PId0PDhNJPrZKJl4079g+4XmXPDklTyWhX4YOVwEXv8tdu1yEmowVc1Nv7LOoLTZoKqVSTdJRuQNUOU2h/flYo20Jlw1OxUV7viF1TFUzGsnOHI6JO41iI/fXhI8mRMQIrGtRk/nApi7Yg2gM52bOAp/gYNUc6l9JDQAgu7k2pEbDKwweI9UiFBn10lD81Savi4eeX2R8MVGbHclgiQFY45WJylJKGET+SGCo92pUBkRM5qZA2/xlVx6PuyqUb7QGVJfXeCvY4JUd+CjctQkHPAZfAgBg6B/ts3EjBjZor20w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UEgP8UdKuw1heNoBAVkzU29+rag/Yv31sWuP0bWZ/M=;
 b=vwjreV/cwTVRz2ApCt6lRNfc9z4TbBFXZ5e6I799G5eFFnzt3H3D2Gwq48LjCAvK5rsMYFQqgd9qWy8R9fLyvrzBQ6b9ROVSO/rGhS8gO6pgc+DzVVDIY8gEDmrdEIkcwa7t2TGpMobDW+3lImn+p0bLsQsVSl/L4M5Hhhl+ccc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 66db3c28a15e05bf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IC7JwZet8HcBpZUe43H+v+aYF34+RPeAQIZTX+uhC5bXQ0vocBgKU2cG9M1dJuNYppoglJNIqme7+zl1YfnOSVtFy55JOwJUzP6w6uyw5KIjnRKHT2MB5BDtWwQustfTKDqsSdPBCzBnq6+Rv1pZZZz5nBSsnzAMtIsfj7OFVyzhP9KdMRLHbutZB1j/ANCIjtP4ZZC5diJPBiU6p/O6KVqpCUaxUyAY75YJW873K356oRKYwjqPxKMW0RIfgotADOL/Dm+aAw/oPQlFz3YssvBvv5s/XlbQ7FN7L6vB9xHIqIfSSYi1rO5CaJNVrzqDQCUW+LNy31kVbJm+e4fx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UEgP8UdKuw1heNoBAVkzU29+rag/Yv31sWuP0bWZ/M=;
 b=ZcVX0MSGWFxClHFHXZCNxEg9REPGXI/ZaTYWkWi8hgR1rUfHnFOFT6CptIgPoFyW1H7fpJhWnGkt//KeMOny0yIrESgLc4njWD3kGEAjv8uy/tH/ZMN+iWCwyq+cLY8LpIZYQ/eCR0EOoFZqOSqqi6IBG7KStQ+cxPVa4NHScEvHa/ZJmUOv3pLjVK2SbO9BV2cddiT3kQfNatWB8ioh3SeT06K1DZgdhet8ItaO+1iYNnnheXMo65Y1C1LpxfgwTi0jFhE4KVI1XcMPYyB7uyfttoDIML/w6YJ8nmJItGn9/f2yRFT6KAQ44MhTimdrWy1bMIfP7V8G5S15AwnSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UEgP8UdKuw1heNoBAVkzU29+rag/Yv31sWuP0bWZ/M=;
 b=vwjreV/cwTVRz2ApCt6lRNfc9z4TbBFXZ5e6I799G5eFFnzt3H3D2Gwq48LjCAvK5rsMYFQqgd9qWy8R9fLyvrzBQ6b9ROVSO/rGhS8gO6pgc+DzVVDIY8gEDmrdEIkcwa7t2TGpMobDW+3lImn+p0bLsQsVSl/L4M5Hhhl+ccc=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH for-4.17 v3 1/2] pci: do not disable memory decoding for
 devices
Thread-Topic: [PATCH for-4.17 v3 1/2] pci: do not disable memory decoding for
 devices
Thread-Index: AQHY6gdfXU3AcwAAuU+ikCtUluaIt64jHX+g
Date: Fri, 28 Oct 2022 02:56:12 +0000
Message-ID:
 <AS8PR08MB7991AADA9FF4A6F85C14CF7C92329@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221027132315.80592-1-roger.pau@citrix.com>
 <20221027132315.80592-2-roger.pau@citrix.com>
In-Reply-To: <20221027132315.80592-2-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 88CBC4AC7DACCC40B2A75A57AA9F99AA.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8385:EE_|DBAEUR03FT041:EE_|DU0PR08MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd7599f-56ab-42c9-c3bd-08dab88fffa5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aBC5DAWFZMmGPLBVQ129tl+SjxOWzDhQRY9Snr3DiF8PL9sv/4toO4cXBRXoX+pTZ1td6SbcTQZUmPM7eOQpahqK5yzw2XZ/EDgCvdju+EnUObGqST7BrkfigF0RtCcdDg2FWCr+jv56a1kdBUgFaLn66AKAPFFB0TMvoH6lkSFStLBGrlg7XvwoDgqwZSKZ3dRC/z8Gi/755xXEqX1WdhoqHBbeViABXnHY7YD7g18CrZxwktqalXqqsdHfdu3QFtMnK+i38PDrNSw4ppLPanQtKhegKAMk37njYp1dSdAtHa4AotCruhuZUqeO7+aWMbvQ4mUXSN/ApOTnQpQucbK8Ws1ZWyUgGXgPiKnmLv3HArhsC74tFoGqrMo+X/tK/7Z6SBOR7xPdHrJShyAB2nMVEPpZFtGdIPyefWartgiuRpW7X/mTbvKDip3gifOFJG1GBQekylWdT7AUmgFQEPAoz9Qw6RwNQTsmWpinmrQRmXEyWDwJMDDQZj2XCiIwPub/vDIE9Civ985NEdIKJXN704+jUUH6WJJiC7I4qNV8SVja91LrRfmI/cpqJN3HGsTyPMP5AYTDVBou32uQwrW+mt/C6U7lAuaExEm2T9fYIq/IkzlyWfT/xKko1MxJhNrYNbrCaw1DMwaBXLDxx3z4wvRaTFm6gned3Nv93XdPjlEIFIP3hqO+JF+Bz8ao/emwIc1PB7hSMT9SM7jVsWQnzWpXugLE5h3HcsUlF5QwyN1wPs/qEtvL0mOzKGSemhu9up3dX5vP24SIPSeXLA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199015)(33656002)(6506007)(55016003)(478600001)(7696005)(38100700002)(71200400001)(122000001)(54906003)(316002)(110136005)(38070700005)(26005)(9686003)(186003)(86362001)(83380400001)(2906002)(8936002)(66476007)(66946007)(64756008)(66446008)(41300700001)(4326008)(76116006)(5660300002)(66556008)(52536014)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8385
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c678615-62cb-452a-508e-08dab88ff960
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yoR2JokZ/G8EIaCOmROHYb7U3MiDVpilECxioC192GtQDJ0kUpgQyP8eCVwBpyKPRqgfcJXLTZGzRAPEuTnh1o0busgAyOv6uKVX+t2XeMtLPdV786WIANtlZ61+xwv64T3kzpd5Jw8rt6cb9xij7TgBJQTUGOJmcBgBtFrn1mSnV1oezsA260V/fnNffhxxZzC6EL9pTO75pukK74ytWWV7ccTqn3SPZIsk7oXvZnBcMxyc7kyPfwSHmBp1la+qfRCKaVPHEeT/GEcK5DQ1OuPGq/vKRVUh04LHMFe3U0zJX8y62n5D1n4N7VzVP7VrY34XyQRhsXTBp6bb+Luv6KChmMFevAQ8m5LAHa595hRhMTq1I76LsMpc+pjKJcKloMNabUYELwCS+NIIKuEF8hSS7Uont4/Ys64ixH81sEU4+P8eZj2+uD1pgzIx0qV/MYVJq9JJSqit5gMpMR1xxwuxQ8hQQPRB7N3f1r4EpF9NSJKAj6Vv1siPYA2W15/gd+hKGtaBFrW3Y1cfLmzGgxiDxbrnlxl/AweQTy4YvvJx3d98czeVRj8sYEDfdVGEJsfpH0ySr2gZPIDPKfpLaEpi79uOBl91jWUN3+Bs8ApfleNTlDgX923ljhLpDg1PJun2DDFJwzkFoj8fihIxDYD7WQOIT7VHsWi0+LsVshdckrj7GHNxL1uId8rJjsnLDz/fqCAcw7VNp1V43i46LUAd0Efii/kVGO2uwxsex3rd2rqdtSULIIogc1VmGKspNtRCPMRgO0tG32vxZ4QL4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(52536014)(336012)(186003)(316002)(9686003)(7696005)(6506007)(26005)(41300700001)(86362001)(5660300002)(47076005)(2906002)(33656002)(70206006)(478600001)(70586007)(8936002)(36860700001)(8676002)(356005)(40480700001)(55016003)(82310400005)(82740400003)(4326008)(81166007)(40460700003)(110136005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 02:56:23.5234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd7599f-56ab-42c9-c3bd-08dab88fffa5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8493

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGZvci00
LjE3IHYzIDEvMl0gcGNpOiBkbyBub3QgZGlzYWJsZSBtZW1vcnkgZGVjb2RpbmcgZm9yDQo+IGRl
dmljZXMNCj4gDQo+IENvbW1pdCA3NWNjNDYwYTFiIGFkZGVkIGNoZWNrcyB0byBlbnN1cmUgdGhl
IHBvc2l0aW9uIG9mIHRoZSBCQVJzIGZyb20NCj4gUENJIGRldmljZXMgZG9uJ3Qgb3ZlcmxhcCB3
aXRoIHJlZ2lvbnMgZGVmaW5lZCBvbiB0aGUgbWVtb3J5IG1hcC4NCj4gV2hlbiB0aGVyZSdzIGEg
Y29sbGlzaW9uIG1lbW9yeSBkZWNvZGluZyBpcyBsZWZ0IGRpc2FibGVkIGZvciB0aGUNCj4gZGV2
aWNlLCBhc3N1bWluZyB0aGF0IGRvbTAgd2lsbCByZXBvc2l0aW9uIHRoZSBCQVIgaWYgbmVjZXNz
YXJ5IGFuZA0KPiBlbmFibGUgbWVtb3J5IGRlY29kaW5nLg0KPiANCj4gV2hpbGUgdGhpcyB3b3Vs
ZCBiZSB0aGUgY2FzZSBmb3IgZGV2aWNlcyBiZWluZyB1c2VkIGJ5IGRvbTAsIGRldmljZXMNCj4g
YmVpbmcgdXNlZCBieSB0aGUgZmlybXdhcmUgaXRzZWxmIHRoYXQgaGF2ZSBubyBkcml2ZXIgd291
bGQgdXN1YWxseSBiZQ0KPiBsZWZ0IHdpdGggbWVtb3J5IGRlY29kaW5nIGRpc2FibGVkIGJ5IGRv
bTAgaWYgdGhhdCdzIHRoZSBzdGF0ZSBkb20wDQo+IGZvdW5kIHRoZW0gaW4sIGFuZCB0aHVzIGZp
cm13YXJlIHRyeWluZyB0byBtYWtlIHVzZSBvZiB0aGVtIHdpbGwgbm90DQo+IGZ1bmN0aW9uIGNv
cnJlY3RseS4NCj4gDQo+IFRoZSBpbml0aWFsIGludGVudCBvZiA3NWNjNDYwYTFiIHdhcyB0byBw
cmV2ZW50IHZQQ0kgZnJvbSBjcmVhdGluZw0KPiBNTUlPIG1hcHBpbmdzIG9uIHRoZSBkb20wIHAy
bSBvdmVyIHJlZ2lvbnMgdGhhdCB3b3VsZCBvdGhlcndpc2UNCj4gYWxyZWFkeSBoYXZlIG1hcHBp
bmdzIGVzdGFibGlzaGVkLiAgSXQncyBteSB2aWV3IG5vdyB0aGF0IHdlIGxpa2VseQ0KPiB3ZW50
IHRvbyBmYXIgd2l0aCA3NWNjNDYwYTFiLCBhbmQgWGVuIGRpc2FibGluZyBtZW1vcnkgZGVjb2Rp
bmcgb2YNCj4gZGV2aWNlcyAoYXMgYnVnZ3kgYXMgdGhleSBtaWdodCBiZSkgaXMgaGFybWZ1bCwg
YW5kIHJlZHVjZXMgdGhlIHNldCBvZg0KPiBoYXJkd2FyZSBvbiB3aGljaCBYZW4gd29ya3MuDQo+
IA0KPiBUaGlzIGNvbW1pdHMgcmV2ZXJ0cyBtb3N0IG9mIDc1Y2M0NjBhMWIsIGFuZCBpbnN0ZWFk
IGFkZHMgY2hlY2tzIHRvDQo+IHZQQ0kgaW4gb3JkZXIgdG8gcHJldmVudCBtaXNwbGFjZWQgQkFS
cyBmcm9tIGJlaW5nIGFkZGVkIHRvIHRoZQ0KPiBoYXJkd2FyZSBkb21haW4gcDJtLiAgU2lnbmFs
aW5nIG9uIHdoZXRoZXIgQkFScyBhcmUgbWFwcGVkIGlzIHRyYWNrZWQNCj4gaW4gdGhlIHZwY2kg
c3RydWN0dXJlLCBzbyB0aGF0IG1pc3BsYWNlZCBCQVJzIGFyZSBub3QgbWFwcGVkLCBhbmQgdGh1
cw0KPiBYZW4gd29uJ3QgYXR0ZW1wdCB0byB1bm1hcCB0aGVtIHdoZW4gbWVtb3J5IGRlY29kaW5n
IGlzIGRpc2FibGVkLg0KPiANCj4gVGhpcyByZXN0b3JlcyB0aGUgYmVoYXZpb3Igb2YgWGVuIGZv
ciBQViBkb20wIHRvIHRoZSBzdGF0ZSBpdCB3YXMNCj4gcHJldmlvdXMgdG8gNzVjYzQ2MGExYiwg
d2hpbGUgYWxzbyBpbnRyb2R1Y2luZyBhIG1vcmUgY29udGFpbmVkIGZpeA0KPiBmb3IgdGhlIHZQ
Q0kgQkFSIG1hcHBpbmcgaXNzdWVzLg0KPiANCj4gRml4ZXM6IDc1Y2M0NjBhMWIgKCd4ZW4vcGNp
OiBkZXRlY3Qgd2hlbiBCQVJzIGFyZSBub3Qgc3VpdGFibHkgcG9zaXRpb25lZCcpDQo+IFNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZWxl
YXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVn
YXJkcywNCkhlbnJ5DQo=

