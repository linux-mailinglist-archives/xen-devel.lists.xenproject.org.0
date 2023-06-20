Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE237361FE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 05:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551401.860943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRii-0007gU-Mp; Tue, 20 Jun 2023 03:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551401.860943; Tue, 20 Jun 2023 03:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRii-0007d0-JK; Tue, 20 Jun 2023 03:07:52 +0000
Received: by outflank-mailman (input) for mailman id 551401;
 Tue, 20 Jun 2023 03:07:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+cFY=CI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qBRih-000587-N8
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 03:07:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3940745-0f17-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 05:07:49 +0200 (CEST)
Received: from DB8PR03CA0023.eurprd03.prod.outlook.com (2603:10a6:10:be::36)
 by AM8PR08MB5761.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:07:14 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::7e) by DB8PR03CA0023.outlook.office365.com
 (2603:10a6:10:be::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 03:07:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 03:07:14 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Tue, 20 Jun 2023 03:07:14 +0000
Received: from d83264b0a235.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6943F74E-B86C-4D5F-A073-224E7DDD77C7.1; 
 Tue, 20 Jun 2023 03:07:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d83264b0a235.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 03:07:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9142.eurprd08.prod.outlook.com (2603:10a6:10:3fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:07:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 03:07:06 +0000
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
X-Inumbo-ID: a3940745-0f17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+0lwwmotLMtqrhLh/iZ91YY18lo1ZbQCuY5pwacwRw=;
 b=0NHZaQ/XzQ3Qpt6jegHvYCW4Efy+WnSQLd1k1YIAifQDmnoEMd2iMpEvj+hTblJTD9B32Z+TZsWjJEc861tRVMP3bwBirGyxUKz/VTogeFRLOcHQj8AKVwDQ71wvzMOtvHpSh+WeTdyukNAVw+b303cx7B+BB85oiRTHjrZJMP4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2u7RJWKpwanLMdJhlTsw1JETLq961x5pF0QrPk5HxOWQ06Yraubt5tAdzsatDFtOtJctlKmBqma7/rZmPDlNeYLClXZum0VzJAMSULNa9gCxbD38BDG6lk3WrB3TL8c6woKM1JD8EgPr96cDEY4XX+BtU9qQEBrTJlAmcBybRXLvRpnLPEkGRlQ9GVFy9M0CoFrHib7kUTnbWSVoCOHqcFfvNBrquxVtDS8Q3zkqYm3IR5tdNRBPw8bq5w9l8w2eTToXuiqVaDJTh2CBxhi4g3RoMHYK6V18Hu3At7YI3juxwaQ8IzEv6dDn1L3rV1+DgTYbLFkhTTOIS5eLSp68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+0lwwmotLMtqrhLh/iZ91YY18lo1ZbQCuY5pwacwRw=;
 b=TZFS9S2lJvegDsCY7P94Hfkn0IcFjRs1tqCOI7Me40qrKqndQV13VvVLK0bWLMVGieGE76rNUHmgneHt4eKGLLZUs27c51AQtzYuAx1VmyppqrfHef1Cu45NpIXEBW/4W+i9hxpAnVedSlrwcZJttusTYs1EcAAkHuEpBcUqlzQbgkylx5GcFaU6Z83Nlztzmzne67ZJXPgFQfzlYOMjteRTUlyxIcMr+s+XCJxYubqCLicQ4bMnvBFIkdj4v0o2oFxPBLEFnPPbUniGw+AYaiUUurjBr+3+ua77v7GeOH4byoVcaI0QQG7JS6NxsDyd9EezfOpuY1AUFPetn1QB3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+0lwwmotLMtqrhLh/iZ91YY18lo1ZbQCuY5pwacwRw=;
 b=0NHZaQ/XzQ3Qpt6jegHvYCW4Efy+WnSQLd1k1YIAifQDmnoEMd2iMpEvj+hTblJTD9B32Z+TZsWjJEc861tRVMP3bwBirGyxUKz/VTogeFRLOcHQj8AKVwDQ71wvzMOtvHpSh+WeTdyukNAVw+b303cx7B+BB85oiRTHjrZJMP4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 5/7] xen/arm: pmap: Add missing ISB in arch_pmap_map()
Thread-Topic: [PATCH 5/7] xen/arm: pmap: Add missing ISB in arch_pmap_map()
Thread-Index: AQHZos+1SFys8OlrDESZKk38tKur+K+S1zXw
Date: Tue, 20 Jun 2023 03:07:06 +0000
Message-ID:
 <AS8PR08MB79916CFF2D46ECE029918446925CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-6-julien@xen.org>
In-Reply-To: <20230619170115.81398-6-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6653964B8927D241956C9AC6511ED26F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9142:EE_|DBAEUR03FT046:EE_|AM8PR08MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 67838842-0c5e-44f0-e1e4-08db713b72b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TTHe7oEO2InU5vlx7hJ6hjD0X2k3A5PpUW/oXgstrZ1CVounJ9KF5QmqM2xetTAugTvZpNSjgYatj+oa9APZ5/kIlw7RfDXKADyWwvvBCtfAypF0x3viql47KpEfGdVh/PhuvVB9a72m7v8wvSNNzvxU7r4I4dR22yRUJWz81eBxgdGtkxbumaa3yh9G7Z2Cun0N97amI/egnf0MKFVk3ywXstH5n7U7lWWVOGX8dFbR+Tc4t6TO6qgD7h4uPNBB6vK+5tFsRji244of8rrlgxseIMluaSX+X2Gz4X6OY7RSBM+UOT/Wo4e5UjeMQBO4AU8QbtCbq9NjhCovZN66cCdC/w/DRI5Z30PEqceYr0K663NCwvINeJ9ydJMsfX5qX3NSpkUZx4UNgz6s/SS0rZTVT8opAeWrM/MfJBZpyDW+lTo8we5Ie1EKhYnY5XGptO3Pv+cOOCkK+U6S9frlzLS/X81/xJmKsXFX2aeN5xe7HXVnVKHuGSt2RgS9kJoCW9THZG3N3ozoqA37mxM7KeakmQtdzlCYEaahGhBfJVtgmX5pi5d0LPp9wF05RcsDsqMKfClR0DIOn5ME1sBGOgXxOzxzMg7CuCfXhnB2TA8fcZXVS36uXW6tXF/GvGAB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(71200400001)(7696005)(478600001)(33656002)(83380400001)(186003)(9686003)(6506007)(26005)(38100700002)(38070700005)(86362001)(122000001)(55016003)(8936002)(52536014)(8676002)(5660300002)(316002)(4326008)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21fd5f17-246e-4e55-9dde-08db713b6e23
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tMBmczeSC0zhP/k49lQu4QHgEpHAcX/0R4/C4Un1JPxe2MU82miIixfNRB3CtrnWztfXj/zRlPbo5EKSt0nkmbI1KamF+zCzAuTPByyBLe7rKEG9fGo7LETMkSzm4HKEUk1Gl27qVr/rujKJeeoAD95hyeNhwbSqLKS/dIZcZtF4YyCMo3+BfBqgBj+nNfXB+1WhNixEGuJ/z4ClIu6a+ZvTV1B7jOF+L8V33ikxoK+dSSVEmCW0PuftS2228Lhivjsi/ujHnN5OjQU+VUbmSpDf3VprB51AuHVeRfGmj1v1NyQXbNH+HQdTRf6Zzyl0mRSyKzGtPrEG35D/vhU7F+eVaJKWepxNX3phxNjEJAgS2X7RRGdTVyFi/0yQvGMUpMO4OXP0gqJ0j5PyI2htsndOhKTGszqEiJASJJ24yWwJKgfs1DQtIQwhQl+vMx7IVR4vIrfQC/EmplRkUJm9UzEbauxynV593UmeoGQKTVz8HY4N+KRUNKxYOW2SRYmL9tlTipwk9rgCQ6qx/5AqZ1+epTsEoovdkz+sy1uhWiJhGGtH9zy8DwResZYnMlpZpSfeLUsrgHCKNGH+KplVnkp6JfG2enJDhoPC1ILVk7z2KKhKk1dmnqOtHEmS3GjF8j1hWP69zKfcwlPQ+0P2bplJ7wZsYAIiU5P2Sby/1NaMCiRwlmDEJtdsgJJGuymlQSukZ/WVags+xNavZ3/6oN6/gaSW46I+nGsnICUAW3cTYDK6nZinHBfDiHl69iWi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(186003)(7696005)(82310400005)(82740400003)(81166007)(83380400001)(356005)(107886003)(336012)(26005)(6506007)(9686003)(47076005)(36860700001)(41300700001)(55016003)(86362001)(54906003)(110136005)(2906002)(478600001)(316002)(40480700001)(70586007)(70206006)(33656002)(8676002)(4326008)(8936002)(52536014)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 03:07:14.4261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67838842-0c5e-44f0-e1e4-08db713b72b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5761

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 5/7] xen/arm: pmap: Add missing ISB in arch_pmap_map()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm, (Armv7 DDI406C.d A3.8.3 and Armv8 DDI 0487J.a B2.3.12):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> Note that second sentence is not part of the newer Armv8 spec. But the
> interpretation is not much different.
>=20
> As the entry created by arch_pmap_map() will be used soon after
> pmap_map() returns, we want to ensure the DSB in write_pte() has
> completed. So add an ISB.
>=20
> Fixes: 4f17357b52f6 ("xen/arm: add Persistent Map (PMAP) infrastructure")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also tested this patch on top of today's staging by our internal CI, a=
nd this
patch looks good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

