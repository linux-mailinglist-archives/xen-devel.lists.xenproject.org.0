Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEAC5AFEC6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400918.642553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqDX-0007JZ-Sf; Wed, 07 Sep 2022 08:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400918.642553; Wed, 07 Sep 2022 08:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqDX-0007GX-Os; Wed, 07 Sep 2022 08:15:27 +0000
Received: by outflank-mailman (input) for mailman id 400918;
 Wed, 07 Sep 2022 08:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVqDW-0007GP-Ii
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:15:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39bbd6d3-2e85-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 10:15:25 +0200 (CEST)
Received: from DU2P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::31)
 by DU0PR08MB8640.eurprd08.prod.outlook.com (2603:10a6:10:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 08:15:22 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::e0) by DU2P251CA0029.outlook.office365.com
 (2603:10a6:10:230::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 08:15:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 08:15:22 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Wed, 07 Sep 2022 08:15:22 +0000
Received: from 05b14929be20.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3071A3E9-D217-4F57-908C-C25AC91117F6.1; 
 Wed, 07 Sep 2022 08:15:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05b14929be20.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 08:15:11 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU0PR08MB7692.eurprd08.prod.outlook.com (2603:10a6:10:3a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 08:15:10 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 08:15:10 +0000
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
X-Inumbo-ID: 39bbd6d3-2e85-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dB4XHX4397zZtXLvPXhqQYBHgoC2vMgL/BCMhLd519iwcVTpvsDPUROPUnRKff8RJ5YBkcQidJgUB/YSKqFvHqiGxIHtzjQhCmvvbhRTCWsqT6pqwVvdIt/n/CX8R6BCNW3ViucyPGAAoyhpUdWjc8XSJGH5ye0y5qk9f/ni/uEsB9+BU62J7IBs1QMzNpu61Sufi0AYw1oxOJa9vqG0DKxzSVFpTONaoyoYcx1I3ATqKMV16N7evgACipOoB3nkDHbyqyqVeiHmL6fDzVqEMgrT5J/r9uVhKtVbLTRe6I0fP8M+Lz2g2Xc8ml2Ql1Q6WXq5RPPiJS7RG80vd7qdPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUz9p4/vrHxW3u4lCgSxrEnvHPOtAxd+lxsACLaA0yQ=;
 b=ba3p9O6zPo18w01mvot8EyMhJx6g4AyLTcVEn6qHNpOwXvWaqxF2q7Lei8J3nCZkHUbDk4n4DG7l6V+vpx1NR6Lo15cqN/CfzAkhtQ2iN7LEvg9pzqpP3JS7MT4vgLlzAXxI6+tXdF7rqtj0Trmom4w13+xVkbeiHa8JJ9dGGwu5HvLiSIeChOsGkrMqW9FwcB5Hm8z1ezl4Y7BvDN0x0t9nuXFxPhrpNascQmGjOYmBVyjDp8x9MfDtgjolMBs/gMXC48eEsBwCGE6XnwNFgSuXmWaSH0vAiV/kEKE7gyys60+g6uQkUcGlXuiX8/xrC+o+C+vfSTbQ6SQQd86CRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUz9p4/vrHxW3u4lCgSxrEnvHPOtAxd+lxsACLaA0yQ=;
 b=dgoEpCZQcyzuPqZJpPSsjAwk6gKEMrstUN7fJ/Q1HgsQ2fMdlVdOyXSgudNh7ZMkguoLu428ebUGJRSzEaKOXj+D8OxibcR5K0AO1ej+9RAk9gBQpqnnOcbMJli0oElG6Yiey1+nRML59+Y9QfULHUeogd+dEetXgKJDyRw0Ie0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bbf8880585506c81
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6MPlt8LiNjerTmKeSMWwrMyxMa4a7cE1BtlGZpnGiQ8rICINZloj1kT+nfOcm1fd0M5nHKhCZx2E9XvkAyihjuxUqou9XjZxEZO2/+imRpLOTqFf/28Fdwo086rGTxrJz/ECbfT6sP/gDlrqQuiUkXN/ME5QaVQS81NdojLQo019aM1AlSmeiINgYXBrixaLmxcUpkSmdrbi7y7hFNfTx0ZtYm8z6VvBxLmttsy/xNA1A0ReedrO9TXqLS8UkQH+LEah2u2plfMUpY1oQHZBbOhQX0Em/8H0hApRgENvuUxyUwgHBsubdDiWBJOK0s1X1Jv+jgu5rnP+DuFBEQRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUz9p4/vrHxW3u4lCgSxrEnvHPOtAxd+lxsACLaA0yQ=;
 b=AiveZtwr7yPPEyOE9/zgNsuxUQkMdotgLwzEXk9Me/bETeqfhJzVAiB/D6wc/j1iGgIi+sMJWS/L03479FMZiWiyf5ryj5kPPN7cMZoJsiY7A8C6ERkcVF5mayl1yGmKgC5xrJHoFuV5P2OTfEtUBj/eyF7T8xMGcLn97MH4dr5FXIvvQdBsprcdS4W9t75rjnP5hLV1ZOQdtKymI6/vW8MN9mjq3dPtVbauQmtL/lFMhUpI5sFiw9OrMutUlx7xcP9flU3uWOH9qxSrvyfwxM/TGsOpVQplcKaiqKgSIP5ry7ULGdNboEpoWh8d4iKtoIddz3roGAguwKWPDv1qGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUz9p4/vrHxW3u4lCgSxrEnvHPOtAxd+lxsACLaA0yQ=;
 b=dgoEpCZQcyzuPqZJpPSsjAwk6gKEMrstUN7fJ/Q1HgsQ2fMdlVdOyXSgudNh7ZMkguoLu428ebUGJRSzEaKOXj+D8OxibcR5K0AO1ej+9RAk9gBQpqnnOcbMJli0oElG6Yiey1+nRML59+Y9QfULHUeogd+dEetXgKJDyRw0Ie0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Topic: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Index: AQHYveWaAk0wZPH8TEaypPBHbuXyK63NTxAAgATeK4CAAAQegIABdr+A
Date: Wed, 7 Sep 2022 08:15:10 +0000
Message-ID: <7A39A45C-E29D-4D51-9748-D52DA356A552@arm.com>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
 <be43a751-2ceb-df74-7525-b84505d341b8@xen.org>
 <CC75ADF3-C7BA-4AE7-B5C0-22B0EA87F08B@arm.com>
 <6b230e0a-1075-1ce9-9ceb-9d3dd5410f9c@xen.org>
In-Reply-To: <6b230e0a-1075-1ce9-9ceb-9d3dd5410f9c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7e4efb33-0f3a-4f34-956c-08da90a91c05
x-ms-traffictypediagnostic:
	DU0PR08MB7692:EE_|DBAEUR03FT053:EE_|DU0PR08MB8640:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PyuRX3+JbFYrB3PoiPNSnP+B/nxBCiqzo88sXs8gBFDDTEBCUATr5MxMvbC3emAoUyOpXJCsXt0TAHHv15jojqheCjIfJoBIZ4HesirbkbcyP5y94ZZ495VLtSeLx8Sls6elabAgF30Lgt29+L/QqNlv1Hk33C2wgO7CoWLWzk+LzPYAgwjVDCrfkxQuecjOHUbJ3nK7Fk5uHUgBTFfnxQxBSYWiGJDRlTf2Ro7mtT2xu+mVhOYBfGmT5q5JhHf6JGcmILfFz0nzCuhHkJ3TDjAH4JA3kBjcpPxLj/Sj1XQWg4OfUOGj+o6dFqyKBlxHIflnM3BoNkvhh5NlZW2o7RUS7uaOj+wblBvOMcV4cOA/uFOzhpH2D8QFY8J6PG9w55ZufnPXAXG4kqWVlDoCPq5JurIeOt0lx7RNS/i9r/rNj/wh3ZXDixfaWnd51qtUjTV4SCkKDrIvcBhxeaDNmS57uxCnWa0nioVfZmru1xNDBUa8BMWVC4EQnTZBWssIwyCjM8X+8QsKagQLaX1AzRUtA9Jb/v/0JcOKKIItd3leP2UNYxniYXWudICWy4Tr8PSQtiOac7EQCyv5VDgFnnahWE4sQ4ekbvsUvLimaoTU7WGKSQjndPa7zZXrebCY1VrTGGIWUjKjVziuxTkxtq0qmKEfqVAU4AMb6RDHqr6ABgTtafaal8efPJBo+bouUwZalhIW3TTpLXgmDJkJV8wDXO5VvSUGF8h+qROk61e1kvZLfBVx3HtnFFn/gttFvIEzZfpTBNIJO4BrSe+iIZYZvxfCT7yZxkjCVwlZ7vI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(83380400001)(316002)(6916009)(6512007)(478600001)(26005)(6506007)(54906003)(38070700005)(8936002)(36756003)(2906002)(33656002)(86362001)(5660300002)(53546011)(66556008)(66476007)(4326008)(66446008)(64756008)(122000001)(76116006)(66946007)(8676002)(186003)(41300700001)(71200400001)(2616005)(91956017)(38100700002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EB75F231BC539478B7C8ED09FE1C315@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7692
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	72beb2d3-c1c1-42ee-94be-08da90a914e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iAYi/h/B/6yMZKvgVS3dtcQRGycsALd3RlBvhXlGA0W/BeYBCzms9anXlfbZxa7360QRyYYQjzKVGaDVxzTU2sLAYROJbtgHS18JIhoVP/7r75NQfJZsdddSr5RDtXVbAeCjZjYQpYC/AAtUpKulH9kagsIG+EFd+SVkGfS5JgBExht6oJRr5RDoUOsWyJSjzoJ52931VgR50rwqtK/34xvI40bjtSFCeqG/8LUEVkjMLfpUEihsGVzGO3vu8RFCd4WDHVFULKYTkcvMhY/tmXv3VB5QJ0uF8acHrSoyFsJeiK9441VtUSMQrZNA+kE78nPz1mBg7BTbFIBVKwALObVx82up7kIg17nsND9oHG/3gFs4+S+AxKXlxdChKRYLz30E6ggyBkOJiHBpxQ2jFttpfjb3oh8HvHPlV/rm1Qp1FGuqVbdZ2Y0k5X/DcMmjiMskNYl/8rxGApDoN7WvunMPDLBaNCKXRT/0oerNkEP5bgGE+CmbZC47gsql92UrJV8Ydk7XwwbkgEVO+TkpS3Pb73lNWC+x0GIWQPCRHF2+7rBxxmrkGoNMva9fTQOsPbKUWRCqpA/kyv8Gt47QZ0yjfblNhR3j6NpAh/q8fgN8Undr/pDbDalqXtuB9PSMAdHykXA3G+84Tm3mX8gxlTpef58CsAiJOnE1gLFXQjegrbRA0qDWcHfrvDSQp2Iwz+fRTyemR4pgRVU2nZZUHQ87w2or50qyGNUkBNEWpN2C/16FYV/ZBua2HSgCxUCYxQN49v65YzO4u5q7Rvv3hg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(40470700004)(36840700001)(46966006)(6512007)(2616005)(40480700001)(47076005)(8676002)(186003)(4326008)(36860700001)(70586007)(70206006)(81166007)(356005)(82740400003)(336012)(6486002)(40460700003)(41300700001)(6506007)(54906003)(26005)(83380400001)(2906002)(316002)(53546011)(82310400005)(5660300002)(36756003)(33656002)(8936002)(478600001)(6862004)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 08:15:22.0347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4efb33-0f3a-4f34-956c-08da90a91c05
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8640

SGkgSnVsaWVuLA0KDQo+IE9uIDYgU2VwIDIwMjIsIGF0IDEwOjUzIGFtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMDYvMDkvMjAyMiAxMDoz
OSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+Pj4gT24gMyBTZXAgMjAyMiwg
YXQgODoxOCBhbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+
Pj4gSGkgUmFodWwsDQo+Pj4gDQo+Pj4gT24gMDEvMDkvMjAyMiAxMDoyOSwgUmFodWwgU2luZ2gg
d3JvdGU6DQo+Pj4+IGlzX21lbW9yeV9ob2xlIHdhcyBpbXBsZW1lbnRlZCBmb3IgeDg2IGFuZCBu
b3QgZm9yIEFSTSB3aGVuIGludHJvZHVjZWQuDQo+Pj4+IFJlcGxhY2UgaXNfbWVtb3J5X2hvbGUg
Y2FsbCB0byBwY2lfY2hlY2tfYmFyIGFzIGZ1bmN0aW9uIHNob3VsZCBjaGVjaw0KPj4+PiBpZiBk
ZXZpY2UgQkFSIGlzIGluIGRlZmluZWQgbWVtb3J5IHJhbmdlLiBBbHNvLCBhZGQgYW4gaW1wbGVt
ZW50YXRpb24NCj4+Pj4gZm9yIEFSTSB3aGljaCBpcyByZXF1aXJlZCBmb3IgUENJIHBhc3N0aHJv
dWdoLg0KPj4+PiBPbiB4ODYsIHBjaV9jaGVja19iYXIgd2lsbCBjYWxsIGlzX21lbW9yeV9ob2xl
IHdoaWNoIHdpbGwgY2hlY2sgaWYgQkFSDQo+Pj4+IGlzIG5vdCBvdmVybGFwcGluZyB3aXRoIGFu
eSBtZW1vcnkgcmVnaW9uIGRlZmluZWQgaW4gdGhlIG1lbW9yeSBtYXAuDQo+Pj4+IE9uIEFSTSwg
cGNpX2NoZWNrX2JhciB3aWxsIGdvIHRocm91Z2ggdGhlIGhvc3QgYnJpZGdlIHJhbmdlcyBhbmQg
Y2hlY2sNCj4+Pj4gaWYgdGhlIEJBUiBpcyBpbiB0aGUgcmFuZ2Ugb2YgZGVmaW5lZCByYW5nZXMu
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0K
Pj4+PiAtLS0NCj4+Pj4gQ2hhbmdlcyBpbiB2MzoNCj4+Pj4gIC0gZml4IG1pbm9yIGNvbW1lbnRz
DQo+Pj4+IC0tLQ0KPj4+PiAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BjaS5oICAgICB8ICAy
ICsrDQo+Pj4+ICB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jIHwgNDMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+ICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20v
cGNpLmggICAgIHwgMTAgKysrKysrKw0KPj4+PiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmMgICAgICB8ICA4ICsrKy0tLQ0KPj4+PiAgNCBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL3BjaS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BjaS5oDQo+Pj4+IGluZGV4
IDgwYTI0MzE4MDQuLjhjYjQ2ZjZiNzEgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9wY2kuaA0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcGNp
LmgNCj4+Pj4gQEAgLTEyNiw2ICsxMjYsOCBAQCBpbnQgcGNpX2hvc3RfaXRlcmF0ZV9icmlkZ2Vz
X2FuZF9jb3VudChzdHJ1Y3QgZG9tYWluICpkLA0KPj4+PiAgICBpbnQgcGNpX2hvc3RfYnJpZGdl
X21hcHBpbmdzKHN0cnVjdCBkb21haW4gKmQpOw0KPj4+PiAgK2Jvb2wgcGNpX2NoZWNrX2Jhcihj
b25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgbWZuX3Qgc3RhcnQsIG1mbl90IGVuZCk7DQo+Pj4+
ICsNCj4+Pj4gICNlbHNlICAgLyohQ09ORklHX0hBU19QQ0kqLw0KPj4+PiAgICBzdHJ1Y3QgYXJj
aF9wY2lfZGV2IHsgfTsNCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhv
c3QtY29tbW9uLmMgYi94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+Pj4+IGlu
ZGV4IDg5ZWYzMDAyOGUuLjBlYjEyMTY2NmQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9wY2kvcGNpLWhvc3QtY29tbW9uLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9wY2kt
aG9zdC1jb21tb24uYw0KPj4+PiBAQCAtMjQsNiArMjQsMTYgQEANCj4+Pj4gICAgI2luY2x1ZGUg
PGFzbS9zZXR1cC5oPg0KPj4+PiAgKy8qDQo+Pj4+ICsgKiBzdHJ1Y3QgdG8gaG9sZCBwY2kgZGV2
aWNlIGJhci4NCj4+Pj4gKyAqLw0KPj4+IA0KPj4+IEkgZmluZCB0aGlzIGNvbW1lbnQgYSBiaXQg
bWlzbGVhZGluZy4gV2hhdCB5b3UgYXJlIHN0b3JpbmcgaXMgYQ0KPj4+IGNhbmRpZGF0ZSByZWdp
b24uIElPVywgdGhpcyBtYXkgb3IgbWF5IG5vdCBiZSBhIFBDSSBkZXZpY2UgYmFyLg0KPj4+IA0K
Pj4+IEdpdmVuIHRoZSBjdXJyZW50IHVzZSBiZWxvdywgSSB3b3VsZCByZW5hbWUgdGhlIHN0cnVj
dHVyZSB0byBzb21ldGhpbmcgbW9yZSBzcGVjaWZpYyBsaWtlOiBwZGV2X2Jhcl9jaGVjay4NCj4+
IEFjay4NCj4+PiANCj4+Pj4gK3N0cnVjdCBwZGV2X2Jhcg0KPj4+PiArew0KPj4+PiArICAgIG1m
bl90IHN0YXJ0Ow0KPj4+PiArICAgIG1mbl90IGVuZDsNCj4+Pj4gKyAgICBib29sIGlzX3ZhbGlk
Ow0KPj4+PiArfTsNCj4+Pj4gKw0KPj4+PiAgLyoNCj4+Pj4gICAqIExpc3QgZm9yIGFsbCB0aGUg
cGNpIGhvc3QgYnJpZGdlcy4NCj4+Pj4gICAqLw0KPj4+PiBAQCAtMzYzLDYgKzM3MywzOSBAQCBp
bnQgX19pbml0IHBjaV9ob3N0X2JyaWRnZV9tYXBwaW5ncyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+
PiAgICAgIHJldHVybiAwOw0KPj4+PiAgfQ0KPj4+PiAgK3N0YXRpYyBpbnQgaXNfYmFyX3ZhbGlk
KGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LA0KPj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDY0X3QgYWRkciwgdWludDY0X3QgbGVuLCB2b2lkICpkYXRhKQ0KPj4+PiAr
ew0KPj4+PiArICAgIHN0cnVjdCBwZGV2X2JhciAqYmFyX2RhdGEgPSBkYXRhOw0KPj4+PiArICAg
IHVuc2lnbmVkIGxvbmcgcyA9IG1mbl94KGJhcl9kYXRhLT5zdGFydCk7DQo+Pj4+ICsgICAgdW5z
aWduZWQgbG9uZyBlID0gbWZuX3goYmFyX2RhdGEtPmVuZCk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBp
ZiAoIChzIDw9IGUpICYmIChzID49IFBGTl9ET1dOKGFkZHIpKSAmJiAoZSA8PSBQRk5fVVAoYWRk
ciArIGxlbiAtIDEpKSApDQo+Pj4gDQo+Pj4gQUZBSUNUICdzJyAgYW5kICdlJyBhcmUgcHJvdmlk
ZWQgYnkgcGNpX2NoZWNrX2JhcigpIGFuZCB3aWxsIG5ldmVyIGNoYW5nZS4gU28gY2FuIHdlIG1v
dmUgdGhlIGNoZWNrICdzIDw9IGUnIG91dHNpZGUgb2YgdGhlIGNhbGxiYWNrPw0KPj4gWWVzLCBX
ZSBjYW4gbW92ZSB0aGUgY2hlY2sgb3V0c2lkZSB0aGUgY2FsbGJhY2sgYnV0IEkgZmVlbCB0aGF0
IGlmIHdlIGNoZWNrIGhlcmUgdGhlbiBpdCBpcyBtb3JlDQo+PiByZWFkYWJsZSB0aGF0IHdlIGFy
ZSBjaGVja2luZyBmb3IgYWxsIHBvc3NpYmxlIHZhbHVlcyBpbiBvbmUgc3RhdGVtZW50LiBMZXQg
bWUga25vdyB5b3VyIHZpZXcgb24gdGhpcy4NCj4gVGhlIHJlYWRhYmlsaXR5IGlzIHJlYWxseSBh
IG1hdHRlciBvZiB0YXN0ZSBoZXJlLiBCdXQgbXkgcG9pbnQgaXMgbW9yZSBvbiB0aGUgbnVtYmVy
IG9mIHRpbWUgYSBjaGVjayBpcyBkb25lLg0KPiANCj4gSXQgc2VlbXMgcG9pbnRsZXNzIHRvIGRv
IHRoZSBzYW1lIGNoZWNrIE4gdGltZXMgd2hlbiB5b3Uga25vdyB0aGUgdmFsdWVzIGFyZSBub3Qg
Z29pbmcgdG8gY2hhbmdlLiBBZG1pdHRlZGx5LCB0aGUgb3BlcmF0aW9uIGlzIGZhc3QgKHRoaXMg
aXMgYSBjb21wYXJpc29uKSBhbmQgTiBzaG91bGQgYmUgc21hbGwgKD8pLg0KPiANCj4gSG93ZXZl
ciwgSSB0aGluayBpdCByYWlzZXMgdGhlIHF1ZXN0aW9uIG9uIHdoZXJlIGRvIHlvdSBkcmF3IHRo
ZSBsaW5lPw0KPiANCj4gUGVyc29uYWxseSwgSSB0aGluayBhbGwgaW52YXJpYW50IHNob3VsZCBi
ZSBjaGVja2VkIG91dHNpZGUgb2YgY2FsbGJhY2tzLiBTbyB0aGUgbGluZSBpcyB2ZXJ5IGNsZWFy
Lg0KPiANCiANCkkgd2lsbCBtb3ZlIHRoZSBjaGVjayBmb3IgInMgPD1l4oCdIG91dHNpZGUgdGhl
IGNhbGxiYWNrIGFuZCB3aWxsIHNlbmQgaXQgZm9yIHJldmlldy4NCg0KUmVnYXJkcywNClJhaHVs

