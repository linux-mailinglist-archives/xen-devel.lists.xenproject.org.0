Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C356558D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 14:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360329.589669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8LJE-0006k7-LA; Mon, 04 Jul 2022 12:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360329.589669; Mon, 04 Jul 2022 12:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8LJE-0006j3-GT; Mon, 04 Jul 2022 12:36:12 +0000
Received: by outflank-mailman (input) for mailman id 360329;
 Mon, 04 Jul 2022 12:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TmxG=XJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8LJC-0006i6-Ed
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 12:36:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130059.outbound.protection.outlook.com [40.107.13.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1919adf-fb95-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 14:36:09 +0200 (CEST)
Received: from DB9PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:10:1da::28)
 by VI1PR08MB3598.eurprd08.prod.outlook.com (2603:10a6:803:7a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 12:35:51 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::f7) by DB9PR05CA0023.outlook.office365.com
 (2603:10a6:10:1da::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Mon, 4 Jul 2022 12:35:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 12:35:50 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Mon, 04 Jul 2022 12:35:50 +0000
Received: from 4283c43f9d00.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FBDCAB56-753C-44AE-A565-CEAC7C60291D.1; 
 Mon, 04 Jul 2022 12:35:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4283c43f9d00.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 12:35:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB3058.eurprd08.prod.outlook.com (2603:10a6:208:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 12:35:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Mon, 4 Jul 2022
 12:35:40 +0000
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
X-Inumbo-ID: e1919adf-fb95-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=C8Kh2iuDrVE+esE6djcoOBUElGQdYRBDWajcLOqOLJmU3zOevMi/t5dBY2pBGtXhpjRI5xEjfRSV022duWGVFu0DD1zOif+zAnUxKovr2Exz6cbbv23BNfMH23+6y3fuG08tLOxO1oxln5CSKrLc+9yP5QraKYJ7TkkfYKU2VuUDOxeENexYfa1pNpxsdc7xCYBH1xoBMPhHAcgzIYsY2UK7uJvlT0ciQrdCrehREND4INJOfOCqqEiqz0gIZWChBj9Rcx2osPjc6cqGFghBNGMTPxYVX2JZCA4VIhJMUlDOQ5dMUMkkF5am1ElWwyHLRB43BP3VMnfHW83fMnFErA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwVmXhjQUYqEw3iucK0gBCn2de2fsddfDRRY3Msm62Q=;
 b=MqSDkpd2FKE1KekZZ70q1wqa6tjAouOVpRPG+QAHZgywq5R5bxr02+E+xaBhrbFH4Ft9wA12RjojjNbtuAsToX2MZmEGi30NL86/BVuH0bQKfAMg8LuzuUEa1raSsO2A2nNvfb2+FwKGOVlhAvcG+mVCwO1/GkXcbZz2/679XT72NnFDVVcJOSQq0hU3WF0xKRE6cVZFUwQGKqKqa4Vn1j7/hIFSM3kJMbr6xLJHImEtocoCJcF2wDGZOYkhPMwxRpOVK6jI3A9mJ51uyGLQkmxYsW/PIpOFWjhSVTVAx4nu+FMOvg+AhbJkjhwLRG88f4uORlMBKpABpXyK3uUFPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwVmXhjQUYqEw3iucK0gBCn2de2fsddfDRRY3Msm62Q=;
 b=LUdPj4Q/IFINACb7vahOdXBXYZ/GBOe3qLt+pGtJIWwggc6DIUbjTxIULUHbVQ1p3tXF59DCWMWoJiYgrjJrakAf2f4Iu9hQaXxWEZ0jPTn/phHRVfVTez1FDJ/aicVm01jJP+UuxT9m0XZ+EYun4AZBGU7T718UJq6Zd8OU0O0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5788fe92432cdada
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiCcCnGv+y8rLAshEi0QkRwsiyASaINd9TXTgj39ulCcwyA8YvaPsffObkebwnT1Nrh9MVxse8WYDEMgKMbL3WqEsaCLjEOVvg8Yx/gm2+HKZOXG1fNoSDt0dwh66m5ezwn9ECw+zheCsXPLn/8aITwnjwllDL1ZWv4dVftxmPVsr2ovCA5f3BJi3VNz/yEkJ3JnaXPVK/Y26vuHNOH/lGvYKjoT1BC6jRCs9bzV9uSvX6z5O3j/FDLBigLMwn83HCGF9KFqL9KWd/ASU3MzevnWw/iv99To86vZbsNSPYbL5PCIXasjd0Kfex8/FICrdrZo+Ddj5UERtg9X7mqDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwVmXhjQUYqEw3iucK0gBCn2de2fsddfDRRY3Msm62Q=;
 b=KyCnERSVSno58Smqr97lUPunjmujmzfOvBaCKBJHiDttuyN/8EwFU7VxdJZp2EgNPtTYoItWxt9RZSBBDEqYqBKTjFfd8U6pKibF6Prz1ZTyZmZ6l+G+yGmbJonNE5VtSoRdnxDZx3gmdUiLhuixjwekvJdwXeDO/ztAtOvM1TkXuFUd4Q6/NHPAJSIVz8ne2ch6MVUZPtnXH/hF92VEF7nIJnNPFPkYkcJKFxWnCe3n7QHi5HMa76breYWRtVLVlpP6wPzJSMDLlMWfbBN/aMTKNMuUiU/UAsIBAg1CSyBEhBshL89yXQLlAbEEaK5AgPEYbdACtUEA2f1GDRy80A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwVmXhjQUYqEw3iucK0gBCn2de2fsddfDRRY3Msm62Q=;
 b=LUdPj4Q/IFINACb7vahOdXBXYZ/GBOe3qLt+pGtJIWwggc6DIUbjTxIULUHbVQ1p3tXF59DCWMWoJiYgrjJrakAf2f4Iu9hQaXxWEZ0jPTn/phHRVfVTez1FDJ/aicVm01jJP+UuxT9m0XZ+EYun4AZBGU7T718UJq6Zd8OU0O0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/7] xen/arm: mm: Add more ASSERT() in {destroy,
 modify}_xen_mappings()
Thread-Topic: [PATCH 4/7] xen/arm: mm: Add more ASSERT() in {destroy,
 modify}_xen_mappings()
Thread-Index: AQHYh6p2Vro/QJFr+UKIGJC/olafua1uNcwA
Date: Mon, 4 Jul 2022 12:35:39 +0000
Message-ID: <5CD19BFD-62C6-4409-A5A9-675D8F5FF795@arm.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-5-julien@xen.org>
In-Reply-To: <20220624091146.35716-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 37c11192-e252-445e-9d2b-08da5db9baa8
x-ms-traffictypediagnostic:
	AM0PR08MB3058:EE_|DBAEUR03FT042:EE_|VI1PR08MB3598:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 H1j1s5Xzdr8rmB36Ftvf4MxE8JZr7OpzdHNtIXn3eHYfLkii/u5aAWWsKmTXDCpB+MPGaI8ZfowCKB4YpJJo/zEZVZjJyCRQt8T84jPaanSDT0PRnYOi9b8nZhIqlMRuMFZ2wxBQmZpk1VjXm9Edm6aCtsioLFC/bQfc7q+D1BakyNmI98NfuDduVkKYY/Qf/9jOjYPqmqMzaTRQ5CuW1fg5kKcGSJP7Is2UnyUPndU6ClNH/nhAlTNTDxTb7g0PvBOm8uLdozehnDmO67jUoW6NGDIxP8j0fgxyvcGBTzPAzu5Diq6Xrxo7a+mwbYSNMaziBvj9wzjS8vVXN05E/7oxiJOd7Nr8dIb1RhUSOeo4XEa0Y/2OkDzuZVW094FJjH3n2/GTUecu87uAoi0nX5n/YS84qn+pNgAdrVSpyJNaZEWTue73cXe0Jw9WNHCY9UoqSqQw8DCjXkilq6htu9YUacb0QzQo7f4n524Re1BJkEc7Sc43h+PbvJsl1Hmx9TGoiJz03JOOHUiIVgNEbYegvm9M5oVeBMzIvV4w64K1i2Q6i6MzkxvUePkA4lJnW17ZZbUB5dBYuQYMc8nVep8i9UtPmxY5ePKlf6L6wY3bPOiWKHUStl3RfYnlBYb5VLD2oJa7rHD18ZEASSeF7usa3gHNAUxrqabHis86txuGG/ik7xysJN/hiy6Bi7kA1Wv1DW+JfUQ9th3JJLR9Ax3D1PaX+FV+SiGrJENY7r76c5fSanuUlHeR7OX8sR/zM8JghJTXg9s41P/rqFpBbEUq4xvsX9jtv2r9QvA59VjmtAckbotJs7Y8SbTiTw4HgcVbRIDAi1ro6Kj0qcF5w9P6uUdMg2Nkc2624hompJo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(83380400001)(6506007)(53546011)(71200400001)(33656002)(5660300002)(8936002)(2906002)(478600001)(6486002)(316002)(66556008)(122000001)(38070700005)(6916009)(66476007)(186003)(86362001)(36756003)(66946007)(2616005)(54906003)(41300700001)(38100700002)(26005)(6512007)(66446008)(76116006)(64756008)(91956017)(8676002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7BCA4A5614FA504F914CA8AE518B1862@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3058
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f0246e0-442b-4889-5e3f-08da5db9b3c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IFjBuVfdMYufpmkpor7k4yO0HRj+kcbNCCCENGg8H+4lUBbqzVV+TDIeF4jkzuB1cNyHSl2My7WePk9Qrt86rcUssIy/ZkJ8tBlLARA2LXChstLLMWeLl8U7mGAi9puXkFMC3qsCMAQZ6uCXdaeirHzwTE+RV6FV9dTuxJBasUZsJYOA4IaqPITzu7V0Mt47613MpwX6hq/sTwYB/Pava3NBTO36xUIVosQygfnYv6WuftPPt6friRJ+evxP2QLnCroWC5G8swTg57AB1aVxqmsQsog8Yc42TVzZwy91M93Rw35omPsec0dFfM3/f74zo16GODX9H5bwmDpDTragr0qLwViKKb6bmWABCRTqqrybGC+5X3V7Vu8zXXMR3jYTjiQ2jpLzRzjBWg//vxfK5Nj4r72HrS+5PquiUtjoz3Y7xce9fdJcv0VBfaf11/8WgMMtrq63QI93VmLjCgMyOGhLBbWdlNh/7Tc9XUQ4Q7nJHB+4iQ5g4e1QkRXs4vHWLh9UhDaeVAS9CqycCTFt5YLN6dLI6+2KrE2L3siB6fhkGaz1JPZCA68o9wj9BES+4g2v53hvaMXJ+lab1NAXVEQm5/mq5P5P5RgM3RSOHDYiAeiffiWPrCrJ90y9P4AnljBGGn+LBq3mnmU7DfMrUhRKaLNkDZUzTTqDDh7UbY+di8ZDyhYkvDqv0aUxd3YNqtc0UirsX0VEO2ZvEDKGkH8cPbnh2lD4bknPvwzBFCRaWKejUUATfUfroMy8PS29HTRpB5R8a+yOPG6PxkL6nXxmPrhzxMr/jmcd2UZnOSpaJLQ8zRW/r/wo4I+2YkWl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(40470700004)(46966006)(36840700001)(82310400005)(336012)(47076005)(107886003)(186003)(40460700003)(81166007)(356005)(40480700001)(82740400003)(83380400001)(36860700001)(41300700001)(70206006)(6862004)(86362001)(70586007)(316002)(54906003)(6512007)(6486002)(478600001)(53546011)(26005)(2616005)(2906002)(4326008)(8676002)(33656002)(8936002)(5660300002)(6506007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 12:35:50.8135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c11192-e252-445e-9d2b-08da5db9baa8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3598

Hi Julien,

> On 24 Jun 2022, at 10:11, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Both destroy_xen_mappings() and modify_xen_mappings() will take in
> parameter a range [start, end[. Both end should be page aligned.
>=20
> Add extra ASSERT() to ensure start and end are page aligned. Take the
> opportunity to rename 'v' to 's' to be consistent with the other helper.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With the prototype updated in mm.h as suggested by Michal:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/mm.c | 10 +++++++---
> 1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0607c65f95cd..20733afebce4 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1371,14 +1371,18 @@ int populate_pt_range(unsigned long virt, unsigne=
d long nr_mfns)
>     return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
> }
>=20
> -int destroy_xen_mappings(unsigned long v, unsigned long e)
> +int destroy_xen_mappings(unsigned long s, unsigned long e)
> {
> -    ASSERT(v <=3D e);
> -    return xen_pt_update(v, INVALID_MFN, (e - v) >> PAGE_SHIFT, 0);
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> +    ASSERT(s <=3D e);
> +    return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
> }
>=20
> int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int fl=
ags)
> {
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>     ASSERT(s <=3D e);
>     return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
> }
> --=20
> 2.32.0
>=20


