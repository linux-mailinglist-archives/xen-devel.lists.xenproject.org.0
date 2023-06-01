Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E65719654
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 11:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542345.846089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4eDr-0002m1-Vh; Thu, 01 Jun 2023 09:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542345.846089; Thu, 01 Jun 2023 09:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4eDr-0002jQ-S8; Thu, 01 Jun 2023 09:03:55 +0000
Received: by outflank-mailman (input) for mailman id 542345;
 Thu, 01 Jun 2023 09:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AzP7=BV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q4eDq-0002jK-8p
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 09:03:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b162b7f-005b-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 11:03:53 +0200 (CEST)
Received: from AS9PR06CA0434.eurprd06.prod.outlook.com (2603:10a6:20b:49e::16)
 by PA4PR08MB5902.eurprd08.prod.outlook.com (2603:10a6:102:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 09:03:46 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49e:cafe::f2) by AS9PR06CA0434.outlook.office365.com
 (2603:10a6:20b:49e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Thu, 1 Jun 2023 09:03:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.22 via Frontend Transport; Thu, 1 Jun 2023 09:03:45 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Thu, 01 Jun 2023 09:03:45 +0000
Received: from a6c6412a77dc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C68B641E-0577-4916-B884-3717D278DC75.1; 
 Thu, 01 Jun 2023 09:03:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6c6412a77dc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jun 2023 09:03:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9071.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 09:03:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 09:03:37 +0000
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
X-Inumbo-ID: 3b162b7f-005b-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6CV/j8U+E9gMXdxA0OUc74xoZEdLbUw1tyrYOXXMWA=;
 b=cg+86q0zVH5gougVBt5D5EErbnwYtoGPJfxcVnTAlGU+9G2l+NLSLfv0D39R/DsnsTkAHJjq13pW6Chk+X59t1nJbt8y77wG2k8p9Um2imHb29n+Qz0g6bSg1Mu97Fgqu0OmXOxn4mhhDiWr+qbha+fy+/oCAwxB9OdGYy28ccM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSYT0buiI86MvO4LzpWH8SV8u2YrFE48tGcQoALuhe+4x0slQswrNTnscTl28PrpysmlYhptIhgW7txS8vNoUox25YGPwqyUwxdczyBzvgA68/xBKxogAOHBuEFYPxl4QaKz+C6Ubjd4U3m4/9StZaFhE8AT1uSV5zZ08cC/eQ4kEloIPmVSeaaql6Ku//4FfVAxWkb5ss4fHZd1VJTku6483kkmrhwp3czCxebZvYSKni2JivktzEx9BX3YDthb+Vl9nw6gL3ImkyySaqXsuUHSISZmcujoG9PelRl+tXUTXR+QCTBrJ175ljN2FAR2zoh5Uo6EnlcYYDN4vS3SxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6CV/j8U+E9gMXdxA0OUc74xoZEdLbUw1tyrYOXXMWA=;
 b=Q/Boy0FPwqyxKEoTy75IZSquvAamZ0PvGcCEc1/Oh/wuZFCHEA1N+8kQWNP9etRGhH3bZcN+LA9WG3tQ5j/raFRd2PnE1VkhAq/YlMY6qTf9XCuov3KsFCYwnJcEnO6h0ahwvhTRA3hm/pBsDD/lN8WBsz3Sm2j7nBbdUkJKyQW7kD4jlMBLRFNWJNmvOa2FporeABEFIN4dputl/+AFbq4voELtJazGk/eZKqmiRNxUadBJyFxVRh13cNXR5HBaQEyAX+7FuJ9TWh7obyy7ddKYk0P0nxjGIwAEnHWYqUX/ePQdJpzJxNCkW9eHQaadtk9RfTtQeD7NkDw19edMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6CV/j8U+E9gMXdxA0OUc74xoZEdLbUw1tyrYOXXMWA=;
 b=cg+86q0zVH5gougVBt5D5EErbnwYtoGPJfxcVnTAlGU+9G2l+NLSLfv0D39R/DsnsTkAHJjq13pW6Chk+X59t1nJbt8y77wG2k8p9Um2imHb29n+Qz0g6bSg1Mu97Fgqu0OmXOxn4mhhDiWr+qbha+fy+/oCAwxB9OdGYy28ccM=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
 compatibility
Thread-Topic: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
 compatibility
Thread-Index: AQHZlGYy5qjjgMoLOEGy4kwMr/2+Ka91pqhg
Date: Thu, 1 Jun 2023 09:03:37 +0000
Message-ID:
 <AS8PR08MB799189FA7C2D4F024070912292499@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230601085001.1782-1-michal.orzel@amd.com>
In-Reply-To: <20230601085001.1782-1-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3936DD0A44DDEF4FB56115EDCCFFDE79.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9071:EE_|AM7EUR03FT043:EE_|PA4PR08MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 34521431-a7f8-4613-e87f-08db627f1af5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KlUs+c0J/+7dy/zeBgUxc6t4zD7naA46thCqZ/GFnRfh/pmOpSMMLRgop7wmgmwrexkOsK0RKSAkknNr17IfXVDjo4SywWhxkiJB5XVtFrb4O8YECEHaNJRQ+Bnuh4edwsj5R8jKK34wpLxi1Qfam2EVySPYrZofINWsMRyYOHrwyXeeydlWFvQdn+DZEYcTzecCSR2ocf5BXuOMdWNLwxq4PKtO+ydeJmUFS5UhDvETtTlo5Qe7tscw3NF1kF3v/VbNkiMrg52rHOt5HjPYlqD1kwGOIuvyuNVlMTJgeQQ7AEdt70IzBXjY5bI24C6kLQSMnXrJJLWeFmV5+5l1lb/cDDmv1+FgdJEs5P5CaYZ7DK9IQgFsu4bBcq0PPm99P6gd4q6kTWr/cX8lXlgiXMSWQWy5mCvg3JJs3w8Jh2m/X9sT8m3v1affe0dfL68wHtP5RO3cLLOI7vfJOrCXRo+04p8gntYk+GyhQzmyx2RcLkS/Braugwb+XLldDZZgXmreLqz9eFsdpqit0jnZkKLodN8GvuRu/ErfqaDnjlIB56hAhIlOlSmzmtolvPGIvw9XeePpSkIPp237DRiQ06SK3KAaRMbrCT8l2e6zNtYPCSBhbOUC0bsTVbhkhZnI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(66476007)(66946007)(64756008)(4326008)(66556008)(478600001)(66446008)(5660300002)(8936002)(52536014)(76116006)(71200400001)(110136005)(54906003)(8676002)(38070700005)(316002)(41300700001)(7696005)(55016003)(122000001)(6506007)(83380400001)(9686003)(26005)(38100700002)(2906002)(86362001)(4744005)(186003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9071
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5042779-019e-4949-96b6-08db627f1660
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dMAxCiCh07dNORnouCfc+TSV9VxUqZSbFLPyE+FenWT0h7cm1oSAonMil7KujrY6DkV4I1+MkOssv/X35YdCdKcaOLNHDr0KiagfHBayuiLA+vv0cyN/6BycoYieRDVdFKB9u4oKQAhcwCaF/V2to182cYqOLAMkEsX3NiYEOXMFL7sEUcbwx2JsoY03LJE+hngBxmjUblRkdyHkc8sx3Zd39sYIiow6dmqeBdW5VHX2hAqB1hY9ZHhFbkAaxzGssCU4dBnPCAJB79g9UQcYsK8r1dwlRIgbGB8rt265xeDIdEmRFpswIaXVlx+QjD5cUrdO/qKgvE3quMkQ8QPpnf3o9kC1jjsFXeirJLHOoOOif3saTfqqa0dItO5xm7DyAEoq/3i1K/2CIzyQmtGGXX4AI88vsRW0RseHSSo3ZG5FLpctTjxw6SmyItFaiOxiPitUTAIJAXTynRg+xt6XLRMLnOcuNXxJb7CjOYs7Doy0Wmgm81u/824YS/RKcy2iEu9bcflXso3WuPCFcLxNDw3GGbvnyHkj+sSaFaa7F7eJP5FOsng3xmNmDXb1sb1Prp8e7jFaND4YkJbNxyyObbhLyYqSAJ1PxS7VQoncp7RXFEPiPzqD8uX/kQ4SgcEO3qxQUrmX8zdh/+EUIgbr/K/7/ucKFSdTdGFoyOUVr/2rKbJ7iI8Dorlm9kElqH6JuXCc+Sz/SFk0p10M7zZeBbKbROGYBr1Ob6UJnqqkH5Nb8un4cNi4e0MjFi0sdlYM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(478600001)(107886003)(110136005)(54906003)(55016003)(7696005)(40480700001)(40460700003)(52536014)(5660300002)(336012)(8676002)(82310400005)(41300700001)(8936002)(2906002)(33656002)(36860700001)(86362001)(83380400001)(47076005)(9686003)(70206006)(6506007)(70586007)(26005)(316002)(4326008)(356005)(81166007)(186003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 09:03:45.5124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34521431-a7f8-4613-e87f-08db627f1af5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5902

Hi Michal,

> -----Original Message-----
> Subject: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
> compatibility
>=20
> There are implementations of the PL011 that can only handle 32-bit
> accesses (i.e. no 16-bit or 8-bit), usually advertised by 'reg-io-width'
> dt property set to 4. On such UARTs, the current early printk code for
> arm64 does not work. To fix this issue, make all the accesses to be 32-bi=
t
> by using ldr, str without a size field. This makes it possible to use
> early printk on such platforms, while all the other implementations shoul=
d
> generally cope with 32-bit accesses. In case they do not, they would
> already fail as we explicitly use writel/readl in the runtime driver to
> maintain broader compatibility and to be SBSAv2 compliant. Therefore, thi=
s
> change makes the runtime/early handling consistent (also it matches the
> arm32 debug-pl011 code).
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

