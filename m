Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33582566F2A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361271.590691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iaM-0001mR-AI; Tue, 05 Jul 2022 13:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361271.590691; Tue, 05 Jul 2022 13:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iaM-0001jL-7F; Tue, 05 Jul 2022 13:27:26 +0000
Received: by outflank-mailman (input) for mailman id 361271;
 Tue, 05 Jul 2022 13:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skT/=XK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8iaK-0001jE-W5
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:27:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34866774-fc66-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 15:27:24 +0200 (CEST)
Received: from AM5PR1001CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::30)
 by PAXPR08MB6351.eurprd08.prod.outlook.com (2603:10a6:102:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:27:22 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::61) by AM5PR1001CA0017.outlook.office365.com
 (2603:10a6:206:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Tue, 5 Jul 2022 13:27:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 13:27:21 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Tue, 05 Jul 2022 13:27:21 +0000
Received: from 47eb244027b7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0936B872-E09B-4150-9FB5-6CAFFD93B2DF.1; 
 Tue, 05 Jul 2022 13:27:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47eb244027b7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 13:27:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3847.eurprd08.prod.outlook.com (2603:10a6:20b:8a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 13:27:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Tue, 5 Jul 2022
 13:27:13 +0000
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
X-Inumbo-ID: 34866774-fc66-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XyuxXmiiYbiRSPW4KJfkYswPm1LDUL9Ma9vg+pRvNWUwU+1IS6h1Y4AZGC3hh1t+C/BVNPFqi7RPdfcIlSxE1UZCKWcxaEMBt48zO3IgeFEPSmHvKeol8GJyAe7fR4C1WqQ6ewLlSOdDN6fKibRgFI6do1ri375UIfzslfV7PEQ4KIKbcseA2qZIcPtPbAFm6fidc5BZjnTgSatu7xiuH524wGAq4DqQ9stFfq4agNhBC+5/XyZT1xsCojuC/7pZGu3CRfJFooVHqPfXyK0fAOaTD8F3ilTcVO3aT3QhSJ0NoQdlG1FfAwW/7W2R5Gk3yOMNvPh4SkmZhZuvy8mmDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvvWkkQIw2EDI2UOoH1zyEnMBj4a0QaZXykYEIApz5g=;
 b=iYCRmXTWH3R41aopRWjO0W+Kd9b0sG6NkeTiQiriUBgPQemiZ5lk4gUF9y/giUlSIt6J3pVSVu3Vq+GOS7UHEOegMsNCjOJ5SjsXzhm+ilXKvsuWfAhSR/sKCMTrGIRMkHBORPEvdUeXFPiR5cJPKS3Up2SN0zDmNKpsRuCw7Zc2tFZ60Zh45Yji6o58VRXNxnXD5iwh97rraVStNRGEpUZ67gXloV63/odB+xa4s3POBE3JecCEpNnrmOkpdSnBoVYknYGKzvTN8lHgTp1liTNAwzhSXpI+/nljSviMEBoP2P6EJPtWjNRG8R855+EzJXQt4nizb+PzEAO8QpR4GA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvvWkkQIw2EDI2UOoH1zyEnMBj4a0QaZXykYEIApz5g=;
 b=bkGixkY8cE/7dMOx0YV/726vzrBc/ZL0xVDWKDWUfqpAWLFWaEPwJWQW7U5/j0Cj7tdc3MKaef4OYapCUqW0v0v32Qv871YAwbDNztEUZbb35fTGhPWKQ1tcuPMosrBr362ryhQMzcrNN7zMxJRWkYRDUPh5jCIt8+14oxmwEGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: efd1762cbdcfdde4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXHOKbl6T8PaW7dgxCcHQYVNtvBqgTWVZQ7RxlJkywrghAnSw3UBFcPPyNoy0mqwcgGKZZcy19Lj7Ps9a8WDUHrEd1J6uyD/zYP7hSYkKrinKbFDCfwrioTl3qmDXI1svKC5zFUUe5QpxV9zW4AHI+qcIWoiB5RHOo9L7L2UZHDVsy2RF8RgAoMd+TXLejYgRN3aJJPdcSJnanoO/lu4//XArNyPtSReJ960btlGaMcyULCNLBfOKSf9CuR5ZmNbi9Xv3Rhbu0Vh2qGDlLXcRIMJHv3w27eZ+SXOh0FxscIVJAvUOFl4EVjhfs0gEesXNsAhyAqqTnue2B/zFeJXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvvWkkQIw2EDI2UOoH1zyEnMBj4a0QaZXykYEIApz5g=;
 b=fDJecEfGK1P4+0dFygaKZ65XCd9XW6rL29O5j5dl4n9y0H2yOVOkwxo7bM81AN5JrMlO0XzggtUiRBIjLrKlNvkrcPgZlUdMrDj+OGCADr0SLELkoHas1AafgKqQUsw1tzEzRQ0rdQl1Pmx9jwgPRBzteov2mvYHYUCH9eOlrA2UfyGYI6PAxrJcQ8hKIjOxZnNHdN2jVyZhXcxbtSQRQPIKkXrWMUzj2VveZcKJCXDIKvTVLiTmACiz57EpU7lJ69bQ+rneKHiBg0vGCMn1aC3tHzcJirrDKVBCx6a8L3pltqDOIGfPU0nwWzHUM+k/XTGg74f6thCmuBtoS4Azfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvvWkkQIw2EDI2UOoH1zyEnMBj4a0QaZXykYEIApz5g=;
 b=bkGixkY8cE/7dMOx0YV/726vzrBc/ZL0xVDWKDWUfqpAWLFWaEPwJWQW7U5/j0Cj7tdc3MKaef4OYapCUqW0v0v32Qv871YAwbDNztEUZbb35fTGhPWKQ1tcuPMosrBr362ryhQMzcrNN7zMxJRWkYRDUPh5jCIt8+14oxmwEGM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v3 16/25] libs/libs.mk: Remove the need for
 $(PKG_CONFIG_INST)
Thread-Topic: [XEN PATCH v3 16/25] libs/libs.mk: Remove the need for
 $(PKG_CONFIG_INST)
Thread-Index: AQHYh+RFzqfxR1Q720uC1zVKAzFjWq1v1hUA
Date: Tue, 5 Jul 2022 13:27:13 +0000
Message-ID: <44345ED4-CEBB-42F6-970E-B719C3E43842@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-17-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-17-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0c40df7f-ceb1-49d3-7a51-08da5e8a1780
x-ms-traffictypediagnostic:
	AM6PR08MB3847:EE_|AM5EUR03FT007:EE_|PAXPR08MB6351:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vlyTSSlesfr7GVPxEbXtmZ1heoD5AHtPV1kkCI7mES6pLff4d8X1j3eX3ogB2T0AcbWLIoFj1WIjgNFf2AaK5YuRgMt9W1Ebwbfyz6ClUIpiNBSqggLFFK8usRGjy1tU9srCwGqsRsywEL8W64FMVQSv26EZqDlGRU618rTM/sW/RlVMm1FT/hCSf9ljdU8HQdSgcFnWxkus2iMESDU+YeBzgfefSCC9/+SxERPhlpWlUAUsLtgzooMwvO3M5FZGCEpUqwWThG9g3S4Xy9ubVHPJ7lzvt7l7VttOkMMGx2pFppv1nD+Z/nCxLPdhKQ2QmuWWJb2w+Excx9bHYDiCJ8kpIN9JzbYEnXDomii/N2bSx8ZQsHmAmkaSzmQ8RN/l39ExvR845B+0ZHnCo9HcKRMAb+4DS13mpn94jPxHsQyPGHQ0sQgDTOFNbDfnlC1nqE/HCsEjwnq/tls8ZauMIcH39uescm569V62EJvvsIizEDq6SMuA84QWo5Sq40c0AgZ5V6laWmagBiLj0xVCcx2X+PNATsbvCFGEeFxRS7WmkYCH5folNvBDd5UXjFRkrcXqbt3ZCrcTvZKkg/afS6NQmgAOO81lhgLWeBKt9wCfjRaAmoGhtWKNPEYcO52idzhdoUuy/hQbaSdhJWqcHSwirqzQtCVkups+zb1oFWFl1Ja74/hJTYjeCvB7RmqOANVAxwKnaCs6uzlQHkVoiefrBCdlN72Ha70t+99VW9OLEsDnyC6OTgQ/6HRWNV9Oz1HETfOhdvJNxtQ4oefOOlQoB9KUJjJJGRfs6eDZNGi8ZwaP3X7a1+/P9MTF66TRWh7F4p4Q6jeFIRrvNkgvM3Lu54ry0S5vBvfg3LhQsE4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(186003)(66946007)(66476007)(38070700005)(83380400001)(41300700001)(6512007)(122000001)(38100700002)(91956017)(316002)(33656002)(64756008)(6916009)(71200400001)(6486002)(478600001)(6506007)(54906003)(53546011)(66446008)(8676002)(76116006)(66556008)(2616005)(4326008)(86362001)(8936002)(5660300002)(2906002)(26005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4C10717DCDC7E647A67A31733578DDAE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3847
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44fcbb38-b216-438a-1c27-08da5e8a1269
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5CLDC5GJh63SdusU+G/HDHUDUPl6dEysS2JcwmAsaRuboEcipwDwUXcpa2/RISpVUR2yNx0XrI2tAoWqNP5JbD2u6FPcKC76dViESIgtKYu+wBrFqRc4CYehvPWS08P5X48NoL7bvv13XIt/509bfJZ34f4Im//KIsVVh3W6fn84JiAjImx64WmgTec+S1/9ndVhdTJb7tB3ryCtTXYNfkeyiMmMDPAkOyOrw4Chh1lQasqozrYAxp6GSqGkorSBHzrsEeJjUW4OoDdOoOiDYTfVmCeR/dHRR9KEKAwyZ7vhGedRpSLcZukIJ4oGoFaheshMa76H72Vdjf3wuoLCO9JQXmjriLQt/w5TZh9JjJIrZSAOHrj6Nzm6wZ/Hb1EWrjwdtG24g6/eqKH816Qqvv373ZSSZg9FPjOzmIshOlwAPkWZKrrey6bbTbWUhX4nV7rtvM9mCIjZYxPDfbtppkn5rJtr9+oVAj4Lt6/kFc4R+TgmXPOZtSkvfrBfunl4QPl0lPEMn5lp8Wu5+LQG535QI80Uv5ppuk3e53Dc7LZP44bLjL26ncyz96Ac260DNuFd8B8gGmyPC+t/MldwJ3BxeSMYi0/c13YMxULCizjCIsNRfL4cO7LQner0angyV/w5LcZ9KK9grZSNGe1D/Fcn4OxFeJzCnBDPaGXxI5GsmNUKB3B5z5cTWzNzvyaP1KFwJc9oAAwk17wWFb1CBNdbz3AE2/aFLAQlMLg6/4gLtzqWJ0sHOEa2GYcjNO5CMkXvpzQZXbQ36hMGB3xwCFEDX8u1R18mDxWCyDgdlCAqd9lptJOJUS77Ggvw0kyo
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(40470700004)(46966006)(36840700001)(36860700001)(8936002)(86362001)(40480700001)(81166007)(186003)(47076005)(336012)(107886003)(5660300002)(83380400001)(33656002)(36756003)(356005)(82740400003)(6862004)(478600001)(6506007)(2616005)(6486002)(316002)(26005)(41300700001)(54906003)(6512007)(53546011)(2906002)(70586007)(70206006)(4326008)(8676002)(82310400005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:27:21.8671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c40df7f-ceb1-49d3-7a51-08da5e8a1780
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6351

Hi Anthony,

> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> We can simply use $(PKG_CONFIG) to set the parameters, and add it to
> $(TARGETS) as necessary.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> tools/libs/libs.mk | 11 +++++------
> 1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
> index e02f91f95e..7aee449370 100644
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -37,10 +37,10 @@ PKG_CONFIG_LIB :=3D $(LIB_FILE_NAME)
> PKG_CONFIG_REQPRIV :=3D $(subst $(space),$(comma),$(strip $(foreach lib,$=
(patsubst ctrl,control,$(USELIBS_$(LIBNAME))),xen$(lib))))
>=20
> ifneq ($(CONFIG_LIBXC_MINIOS),y)
> -PKG_CONFIG_INST :=3D $(PKG_CONFIG)
> -$(PKG_CONFIG_INST): PKG_CONFIG_PREFIX =3D $(prefix)
> -$(PKG_CONFIG_INST): PKG_CONFIG_INCDIR =3D $(includedir)
> -$(PKG_CONFIG_INST): PKG_CONFIG_LIBDIR =3D $(libdir)
> +TARGETS +=3D $(PKG_CONFIG)
> +$(PKG_CONFIG): PKG_CONFIG_PREFIX =3D $(prefix)
> +$(PKG_CONFIG): PKG_CONFIG_INCDIR =3D $(includedir)
> +$(PKG_CONFIG): PKG_CONFIG_LIBDIR =3D $(libdir)
> endif
>=20
> PKG_CONFIG_LOCAL :=3D $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
> @@ -55,7 +55,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR =3D $(XEN_INCLUD=
E)
> $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR =3D $(CURDIR)
>=20
> .PHONY: all
> -all: headers.chk $(TARGETS) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL) libxe=
n$(LIBNAME).map $(LIBHEADERS)
> +all: headers.chk $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(L=
IBHEADERS)
>=20
> ifneq ($(NO_HEADERS_CHK),y)
> headers.chk:
> @@ -127,7 +127,6 @@ clean::
> 	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
> 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(=
MAJOR)
> 	rm -f headers.chk headers.lst
> -	rm -f $(PKG_CONFIG)
>=20
> .PHONY: distclean
> distclean: clean
> --=20
> Anthony PERARD
>=20
>=20


