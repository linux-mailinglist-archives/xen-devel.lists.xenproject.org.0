Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9CC5A4375
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 08:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394459.633866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSYiO-00034h-9M; Mon, 29 Aug 2022 06:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394459.633866; Mon, 29 Aug 2022 06:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSYiO-00031c-5J; Mon, 29 Aug 2022 06:57:44 +0000
Received: by outflank-mailman (input) for mailman id 394459;
 Mon, 29 Aug 2022 06:57:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=td9j=ZB=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oSYiM-00031G-IW
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 06:57:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df3d3c2d-2767-11ed-9250-1f966e50362f;
 Mon, 29 Aug 2022 08:57:40 +0200 (CEST)
Received: from AS8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:310::30)
 by DB9PR08MB6989.eurprd08.prod.outlook.com (2603:10a6:10:2c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 06:57:38 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::a3) by AS8PR04CA0025.outlook.office365.com
 (2603:10a6:20b:310::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21 via Frontend
 Transport; Mon, 29 Aug 2022 06:57:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Mon, 29 Aug 2022 06:57:37 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 29 Aug 2022 06:57:36 +0000
Received: from abf9ac426bc6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D941AA8-4558-4625-8C0F-E9673BEBB6DF.1; 
 Mon, 29 Aug 2022 06:57:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abf9ac426bc6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 29 Aug 2022 06:57:31 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AS2PR08MB8575.eurprd08.prod.outlook.com (2603:10a6:20b:55e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 06:57:29 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20%7]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 06:57:28 +0000
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
X-Inumbo-ID: df3d3c2d-2767-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=maeKmc6BrIKNdMdLL+IATizU085H+CPgLq0pKYD5Oo0PDq1fOL9TqjLAcS78WPY1y6md91bPehi6cn7vEvE0XeZ/LRgC2xrrP8e+GV/YswuxkXeuhCbFvqROKNy+4FXTDa2UHDKoYZv5ZECtU7IWaihZ7/iEjBRK64gSpvRdKyMvH4oEO6ArOQR6AU2vlOTFChNu9Yq5H01krRevKBRq9NtE6gre7L9rz7nxFqddodzeSEiyWGUENe3TOYkuBqAoLn3Fxn5WM2kC+RgkWl96o6x0g9dJO9oBTy1vsJeSnxlRarKp4Nc5PkudSG6LvtMgw15VILgZ9LR8u1rZUmyzxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7h6UkEUgGUt7qynhP5I71NuSYAdge7kW5t0hkkkOxE=;
 b=A4ZyU7ttPsiA+Kd5p+GdVep9GyOz2W6gGdoJGyWODCcfqIkWWrS2CrYYX1bQMI7AaFm+ML8K1i/uKHHDMbT7dBvnPp7XlD68O0Hzxf28e2rjNr3rPwPuSNWXEgFdMBXN21h71GhPJrcIVD2YvC17zSZ6ThddRPzZbtdN6yr8ybV9RueRDFJdDIbBw1997TLDIwweVsvBkMxjBQgoJKLmcYp0oxJ27YG01Y1Xy7OTBLWHHCdCufy2wgPq/EDyGPBsrUHKHYsOcbVDhFH7iMIUxf5WED6y5h7Xn6dU9rzaBwjlesuldNAdbQMMNdIK4b7fDlwpqzLZf02Qk1AtRqRDoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7h6UkEUgGUt7qynhP5I71NuSYAdge7kW5t0hkkkOxE=;
 b=MjcJZmiqV6kFvajqNCcgFStUkfHaRT7Wuk/BRuaBBGNmoT0F9jAn2iiRkGDnvztuxGKSKOplhK1QG9ULKCh0MFov/6pO/I+iQC/qQJyn4DsknIxzo1SEk73r0wBXWCOEVJ9F9cfgSDtoqApB1wZkv9Uk39GuE2RoXGJ5a8eYjhE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gP0t9Gp7BJtNu5NiRNeBfqRVRvtOXy/yFmCtJzWRfOyX8p6b8w3W6hidZhNaUWXQQo26AFN2YNVx84uwTbIsXFRbfyxEYwkgXMlsJ9SbCZ4IYvyjt7pQ4SfMeU63kdhS4zNEsaJUNomiqzVTiE68654+F28XTsIXiVLGY7ZRhOyJDsdyDQid7tv4hwauc0IGd0rGC3MvD2Ev5q6+2Ipu4TiGx0ahf5w3ETpffFlw+Ip455ra8L0mpmd5NoaA+lSCw+PPWTtWcUy8Dbfp+yFbHF7/rJNkZRBJartX40NpkkbVHlqvOkcqCB/UOmDSkFzQ4WqOCH8/f2gJ9rgHKO4c7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7h6UkEUgGUt7qynhP5I71NuSYAdge7kW5t0hkkkOxE=;
 b=ZNjQCHbAlYZ+u596vwjQ9gYBzgqw6wc6jf/+wMG87OJssmG2XhObgaLaXUODZjTMQKFwwG71Ywrhup5kc8t5dwerkZ4H5aWm34/r7LRZmRny+VE1cjwkKtKNkaomXdSggCE2QoYcDH3Mq4jOTEPLDwW7rEqF6GYOX+zJvENfAZeeI7n0dKRgnOqCisUws7E/LpVaDixweRGTx91CTlDx6YMM8pigm7vI5QbJk/7lZdTqrNsox7PoebzTS9YVrDYgmgXMjweB19lkmynLZgMH/EFTMw/Zc8G8kzBvS8PvDE/J//3rFA7L4Cx2v+W/Ce7tKzY8P0Vpo6Q1Y/xdEan2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7h6UkEUgGUt7qynhP5I71NuSYAdge7kW5t0hkkkOxE=;
 b=MjcJZmiqV6kFvajqNCcgFStUkfHaRT7Wuk/BRuaBBGNmoT0F9jAn2iiRkGDnvztuxGKSKOplhK1QG9ULKCh0MFov/6pO/I+iQC/qQJyn4DsknIxzo1SEk73r0wBXWCOEVJ9F9cfgSDtoqApB1wZkv9Uk39GuE2RoXGJ5a8eYjhE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 1/9] xen/arm: introduce static shared memory
Thread-Topic: [PATCH v6 1/9] xen/arm: introduce static shared memory
Thread-Index: AQHYnQTR3P1Hf4Rlc0O1VRJveInV4K3BYj8AgARCxIA=
Date: Mon, 29 Aug 2022 06:57:28 +0000
Message-ID:
 <AM0PR08MB453055962750CBD525997CE7F7769@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-2-Penny.Zheng@arm.com>
 <ce6c2e20-2d5f-dccc-e4d0-0e8ce92caeb4@xen.org>
In-Reply-To: <ce6c2e20-2d5f-dccc-e4d0-0e8ce92caeb4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 613E4193B9ADA149A88656AFE4CAACC6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2002493b-dd39-449a-023e-08da898bc20a
x-ms-traffictypediagnostic:
	AS2PR08MB8575:EE_|VE1EUR03FT051:EE_|DB9PR08MB6989:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /U8+dNEwaKa/i8QAvmBFDx+2FTsMkf0CAvUalyHEE5f0jVykRH+tTC0QJSwqgVXyQhGalaiMvVcSurb8KSkb/JvfN4/KfEF7KkgizYS/79Fgzqnzte3PZw//2ElkURQaTOBHFYtG4zOsnR8FZ+6sqO5SskZkzH6mAe22pmu0k12DxVKUKty1enD/5TtXEX7fdTpoCSlbRhPito5fYgdO6J9ZqkSdjxwr9d5ETWDoa7DVO1QYPoqfH6RdAtiXssZjHGQlM28iRDBxkjol6hVjwMPzjzQ54wFVGcSSGwBo5O4A6f0uUzgmXV0LjyiXFj5otEVKlVToVI0sTYTvTuWxADdztd6ZBtyDYBQww3Mu45Owr0IooJLA0XR1haQU8hd2KVBpZOnGAfajhGvdWlyg9zf/CiFwYfVoWAfkBJjbcfFEq+C5DdUAlj4qrzrPZif8gwWgDpQvGtJtlEW9hheDCDK6bidJ+SAl2R+Xq9NZSl9sOeSbKUsIhdxQaMVcCKkqzNahsgST9kA0CZQr28qxnE3o0VOXyUUC+UL76nkptTY2nJ4W5qetw39Eif5cVmpPsnRDe2aEVsP53V1UrbNyZdqcBs7poZcduYQmQ5/bzANDnATI/6pR0poXuoaa33tU+ScfVGCz0J3qaiRnqHwvtLFj2XY3AGgyfFmupF+/xmQ4/cBCtTVO0Jnm34SMkETVF9nyTWoQuR42D/p1W+FZrvm8YfHUqd2rU380Usch3zBNfcREh2I+ClLpjarf87shQX0TGsv5c+9TwwJ0v7ceEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(38070700005)(122000001)(86362001)(186003)(83380400001)(38100700002)(52536014)(5660300002)(9686003)(4326008)(8676002)(76116006)(66446008)(64756008)(66476007)(66556008)(66946007)(2906002)(55016003)(71200400001)(41300700001)(478600001)(7696005)(6506007)(110136005)(8936002)(54906003)(53546011)(33656002)(316002)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8575
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19d82dc2-50c6-4b93-5231-08da898bbcf0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FIrUI0wx+wchelg6Vom6Y21QDP+zIoAvxG/zptdzcJ718fKTUjM/cHcxiTJB6xrq8dqPF/pTQBRNzw0zOSR6D/CYLFUK+EoewbjbElaGFcT6BxXZAaDxXy8LQT6tTg4ek4UPXWRY8Vdbhxp1W8KqpBWB3J8My01eL7dHa5HpRoODWNvW0ntpL+EBVRYNQMrxXdL1cQuHu0B3ZbExsDvE9Vzv3+lJfWwFja7KqDyWwzNl/OVDOBHhP6+OVYbgED88y3+O6y489YGCZDw/ZrbKkRk+0mnYUKljHfUKWq51Cf0xhrEtCYZaksw1Une+Y0VZ+rlbEOQVisFZdj83sRaFRCMJOGxFTKXi5ZCJdcn8hSZiWxxZtNH8F7dQpN5zMui3mnCemV9U37/1SJBigEY/fO97Avfq/ldK9p+ffqDBEL21nbGtAAEDDN3dL2i0zUPeK3UqEC8hM/CDrfB/QriDE9roxWkLk4SU1jyyHEKf0qnizr1CZ+bOWFOeTMgp6Vmp9AdmJ4xS3llNf1XMMbyNsjXTuwv9eq5NOhy9054EkjLmCOsfwxsAgGVWzdxyB3YAG99hEtX5sn3s5nN/qaJCMaYKDlb060+oYILx4EzchCy/SKs2s9foNQ8QwiMsnU0I4JUdiLNvdI9bLiOaIR14VSNhBOTfkJsElFhdKj46erxyK/yR6stnnU9P8g++rnsRc6InzN6ez1cbKHOBb7V7zIHM17vOv/WM8Xjst0qTCQC1DEVNKvBYl0HV7BJfQqbXBNQ68rejEHPm7qPd16siOg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(136003)(346002)(40470700004)(46966006)(36840700001)(9686003)(86362001)(53546011)(70206006)(26005)(82310400005)(478600001)(107886003)(6506007)(7696005)(41300700001)(336012)(186003)(40480700001)(82740400003)(55016003)(40460700003)(356005)(81166007)(83380400001)(47076005)(36860700001)(110136005)(5660300002)(8676002)(8936002)(4326008)(52536014)(316002)(54906003)(2906002)(70586007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 06:57:37.3679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2002493b-dd39-449a-023e-08da898bc20a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6989

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyNiwgMjAyMiA5OjE3IFBNDQo+IFRv
OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9s
b2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY2IDEvOV0geGVuL2FybTogaW50cm9kdWNlIHN0YXRpYyBzaGFyZWQgbWVt
b3J5DQo+IA0KPiBIaSBQZW5ueSwNCj4NCg0KSGkgSnVsaWVuDQogDQo+IE9uIDIxLzA3LzIwMjIg
MTQ6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEZyb206IFBlbm55IFpoZW5nIDxwZW5ueS56
aGVuZ0Bhcm0uY29tPg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBhIG5l
dyBmZWF0dXJlOiBzZXR0aW5nIHVwIHN0YXRpYyBzaGFyZWQNCj4gPiBtZW1vcnkgb24gYSBkb20w
bGVzcyBzeXN0ZW0sIHRocm91Z2ggZGV2aWNlIHRyZWUgY29uZmlndXJhdGlvbi4NCj4gPg0KPiA+
IFRoaXMgY29tbWl0IHBhcnNlcyBzaGFyZWQgbWVtb3J5IG5vZGUgYXQgYm9vdC10aW1lLCBhbmQg
cmVzZXJ2ZSBpdCBpbg0KPiA+IGJvb3RpbmZvLnJlc2VydmVkX21lbSB0byBhdm9pZCBvdGhlciB1
c2UuDQo+ID4NCj4gPiBUaGlzIGNvbW1pdHMgcHJvcG9zZXMgYSBuZXcgS2NvbmZpZyBDT05GSUdf
U1RBVElDX1NITSB0byB3cmFwDQo+ID4gc3RhdGljLXNobS1yZWxhdGVkIGNvZGVzLCBhbmQgdGhp
cyBvcHRpb24gZGVwZW5kcyBvbiBzdGF0aWMgbWVtb3J5KA0KPiA+IENPTkZJR19TVEFUSUNfTUVN
T1JZKS4gVGhhdCdzIGJlY2F1c2UgdGhhdCBsYXRlciB3ZSB3YW50IHRvIHJldXNlIGENCj4gPiBm
ZXcgaGVscGVycywgZ3VhcmRlZCB3aXRoIENPTkZJR19TVEFUSUNfTUVNT1JZLCBsaWtlDQo+ID4g
YWNxdWlyZV9zdGF0aWNtZW1fcGFnZXMsIGV0Yywgb24gc3RhdGljIHNoYXJlZCBtZW1vcnkuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4N
Cj4gPiAtLS0NCj4gPiB2NiBjaGFuZ2U6DQo+ID4gLSB3aGVuIGhvc3QgcGh5c2ljYWwgYWRkcmVz
cyBpcyBvbW1pdGVkLCBvdXRwdXQgdGhlIGVycm9yIG1lc3NhZ2UNCj4gPiBzaW5jZSB4ZW4gZG9l
c24ndCBzdXBwb3J0IGl0IGF0IHRoZSBtb21lbnQNCj4gPiAtIGFkZCB0aGUgZm9sbG93aW5nIGNo
ZWNrOiAxKSBUaGUgc2htIElEIG1hdGNoZXMgYW5kIHRoZSByZWdpb24NCj4gPiBleGFjdGx5IG1h
dGNoDQo+ID4gMikgVGhlIHNobSBJRCBkb2Vzbid0IG1hdGNoIGFuZCB0aGUgcmVnaW9uIGRvZXNu
J3Qgb3ZlcmxhcA0KPiA+IC0gY2hhbmdlIGl0IHRvICJ1bnNpZ25lZCBpbnQiIHRvIGJlIGFsaWdu
ZWQgd2l0aCBucl9iYW5rcw0KPiA+IC0gY2hlY2sgdGhlIGxlbiBvZiB0aGUgcHJvcGVydHkgdG8g
Y29uZmlybSBpcyBpdCBiaWcgZW5vdWdoIHRvIGNvbnRhaW4NCj4gPiAicGFkZHIiLCAic2l6ZSIs
IGFuZCAiZ2FkZHIiDQo+ID4gLSBzaG1faWQgZGVmaW5lZCBiZWZvcmUgbnJfc2htX2RvbWFpbiwg
c28gd2UgY291bGQgcmUtdXNlIHRoZSBleGlzdGluZw0KPiA+IGhvbGUgYW5kIGF2b2lkIGluY3Jl
YXNpbmcgdGhlIHNpemUgb2YgdGhlIHN0cnVjdHVyZS4NCj4gPiAtIGNoYW5nZSAibnJfc2htX2Rv
bWFpbiIgdG8gIm5yX3NobV9ib3Jyb3dlcnMiLCB0byBub3QgaW5jcmVtZW50IGlmDQo+ID4gdGhl
IHJvbGUgaXMgb3duZXIgaW4gcGFyc2luZyBjb2RlDQo+ID4gLSBtYWtlICJ4ZW4sc2htX2lkIiBw
cm9wZXJ0eSBhcyBhcmJpdHJhcnkgc3RyaW5nLCB3aXRoIGEgc3RyaWN0IGxpbWl0DQo+ID4gb24g
dGhlIG51bWJlciBvZiBjaGFyYWN0ZXJzLCBNQVhfU0hNX0lEX0xFTkdUSA0KPiA+IC0tLQ0KPiA+
IHY1IGNoYW5nZToNCj4gPiAtIG5vIGNoYW5nZQ0KPiA+IC0tLQ0KPiA+IHY0IGNoYW5nZToNCj4g
PiAtIG5pdCBmaXggb24gZG9jDQo+ID4gLS0tDQo+ID4gdjMgY2hhbmdlOg0KPiA+IC0gbWFrZSBu
cl9zaG1fZG9tYWluIHVuc2lnbmVkIGludA0KPiA+IC0tLQ0KPiA+IHYyIGNoYW5nZToNCj4gPiAt
IGRvY3VtZW50IHJlZmluZW1lbnQNCj4gPiAtIHJlbW92ZSBiaXRtYXAgYW5kIHVzZSB0aGUgaXRl
cmF0aW9uIHRvIGNoZWNrDQo+ID4gLSBhZGQgYSBuZXcgZmllbGQgbnJfc2htX2RvbWFpbiB0byBr
ZWVwIHRoZSBudW1iZXIgb2Ygc2hhcmVkIGRvbWFpbg0KPiA+IC0tLQ0KPiA+ICAgZG9jcy9taXNj
L2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dCB8IDEyNCArKysrKysrKysrKysrKysrKysrKw0K
PiA+ICAgeGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgNiArDQo+ID4g
ICB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICAgICAgICAgIHwgMTU3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAuaCAg
ICAgIHwgICA5ICsrDQo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDI5NiBpbnNlcnRpb25zKCspDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4
dA0KPiA+IGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KPiA+IGluZGV4
IDk4MjUzNDE0YjguLjgwMTNmYjk4ZmUgMTAwNjQ0DQo+ID4gLS0tIGEvZG9jcy9taXNjL2FybS9k
ZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KPiA+ICsrKyBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRy
ZWUvYm9vdGluZy50eHQNCj4gPiBAQCAtMzc4LDMgKzM3OCwxMjcgQEAgZGV2aWNlLXRyZWU6DQo+
ID4NCj4gPiAgIFRoaXMgd2lsbCByZXNlcnZlIGEgNTEyTUIgcmVnaW9uIHN0YXJ0aW5nIGF0IHRo
ZSBob3N0IHBoeXNpY2FsIGFkZHJlc3MNCj4gPiAgIDB4MzAwMDAwMDAgdG8gYmUgZXhjbHVzaXZl
bHkgdXNlZCBieSBEb21VMS4NCj4gPiArDQo+ID4gK1N0YXRpYyBTaGFyZWQgTWVtb3J5DQo+ID4g
Kz09PT09PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICtUaGUgc3RhdGljIHNoYXJlZCBtZW1v
cnkgZGV2aWNlIHRyZWUgbm9kZXMgYWxsb3cgdXNlcnMgdG8gc3RhdGljYWxseQ0KPiA+ICtzZXQg
dXAgc2hhcmVkIG1lbW9yeSBvbiBkb20wbGVzcyBzeXN0ZW0sIGVuYWJsaW5nIGRvbWFpbnMgdG8g
ZG8NCj4gPiArc2htLWJhc2VkIGNvbW11bmljYXRpb24uDQo+ID4gKw0KPiA+ICstIGNvbXBhdGli
bGUNCj4gPiArDQo+ID4gKyAgICAieGVuLGRvbWFpbi1zaGFyZWQtbWVtb3J5LXYxIg0KPiA+ICsN
Cj4gPiArLSB4ZW4sc2htLWlkDQo+ID4gKw0KPiA+ICsgICAgQW4gYXJiaXRyYXJ5IHN0cmluZyB0
aGF0IHJlcHJlc2VudHMgdGhlIHVuaXF1ZSBpZGVudGlmaWVyIG9mIHRoZSBzaGFyZWQNCj4gPiAr
ICAgIG1lbW9yeSByZWdpb24sIHdpdGggYSBzdHJpY3QgbGltaXQgb24gdGhlIG51bWJlciBvZiBj
aGFyYWN0ZXJzKFwwDQo+IGluY2x1ZGVkKSwNCj4gPiArICAgIGBNQVhfU0hNX0lEX0xFTkdUSCgx
NilgLiBlLmcuICJ4ZW4sc2htLWlkID0gIm15LXNoYXJlZC1tZW0tMSIiLg0KPiA+ICsNCj4gPiAr
LSB4ZW4sc2hhcmVkLW1lbQ0KPiA+ICsNCj4gPiArICAgIEFuIGFycmF5IHRha2VzIGEgcGh5c2lj
YWwgYWRkcmVzcywgd2hpY2ggaXMgdGhlIGJhc2UgYWRkcmVzcyBvZiB0aGUNCj4gPiArICAgIHNo
YXJlZCBtZW1vcnkgcmVnaW9uIGluIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSwgYSBzaXpl
LCBhbmQgYQ0KPiBndWVzdA0KPiA+ICsgICAgcGh5c2ljYWwgYWRkcmVzcywgYXMgdGhlIHRhcmdl
dCBhZGRyZXNzIG9mIHRoZSBtYXBwaW5nLg0KPiA+ICsgICAgZS5nLiB4ZW4sc2hhcmVkLW1lbSA9
IDwgW2hvc3QgcGh5c2ljYWwgYWRkcmVzc10gW3NpemVdIFtndWVzdA0KPiA+ICsgYWRkcmVzc10g
Pg0KPiANCj4gWW91ciBpbXBsZW1lbnRhdGlvbiBiZWxvdyBpcyBjaGVja2luZyBmb3Igb3Zlcmxh
cCBhbmQgYWxzbyBoYXZlIHNvbWUNCj4gcmVzdHJpY3Rpb24uIENhbiB0aGV5IGJlIGRvY3VtZW50
ZWQgaW4gdGhlIGJpbmRpbmc/DQo+IA0KPiA+ICsNCj4gPiArICAgIFRoZSBudW1iZXIgb2YgY2Vs
bHMgZm9yIHRoZSBob3N0IGFkZHJlc3MgKGFuZCBzaXplKSBpcyB0aGUgc2FtZSBhcyB0aGUNCj4g
PiArICAgIGd1ZXN0IHBzZXVkby1waHlzaWNhbCBhZGRyZXNzIGFuZCB0aGV5IGFyZSBpbmhlcml0
ZWQgZnJvbSB0aGUgcGFyZW50DQo+IG5vZGUuDQo+IA0KPiBJbiB2NSwgd2UgZGlzY3Vzc2VkIHRv
IGhhdmUgdGhlIGhvc3QgYWRkcmVzcyBvcHRpb25hbC4gSG93ZXZlciwgdGhlIGJpbmRpbmcNCj4g
aGFzIG5vdCBiZWVuIHVwZGF0ZWQgdG8gcmVmbGVjdCB0aGF0LiBOb3RlIHRoYXQgSSBhbSBub3Qg
YXNraW5nIHRvIGltcGxlbWVudCwNCj4gYnV0IGluc3RlYWQgcmVxdWVzdCB0aGF0IHRoZSBiaW5k
aW5nIGNhbiBiZSB1c2VkIGZvciBzdWNoIHNldHVwLg0KPiANCg0KSG93IGFib3V0Og0KIg0KSG9z
dCBwaHlzaWNhbCBhZGRyZXNzIGNvdWxkIGJlIG9taXR0ZWQgYnkgdXNlcnMsIGFuZCBsZXQgWGVu
IGRlY2lkZSB3aGVyZSBpdCBsb2NhdGVzLg0KIg0KRG8geW91IHRoaW5rIEkgc2hhbGwgZnVydGhl
ciBwb2ludCBvdXQgdGhhdCByaWdodCBub3csIHRoaXMgcGFydCBmZWF0dXJlIGlzIG5vdCBpbXBs
ZW1lbnRlZA0KaW4gY29kZXM/DQoNCj4gPiBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1
cC5oDQo+IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmgNCj4gPiBpbmRleCAyYmIw
MWVjZmE4Li4zOWQ0ZTkzYjhiIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9zZXR1cC5oDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmgN
Cj4gPiBAQCAtMjMsMTAgKzIzLDE5IEBAIHR5cGVkZWYgZW51bSB7DQo+ID4gICB9ICBib290bW9k
dWxlX2tpbmQ7DQo+ID4NCj4gPg0KPiA+ICsjaWZkZWYgQ09ORklHX1NUQVRJQ19TSE0NCj4gPiAr
LyogSW5kaWNhdGVzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBjaGFyYWN0ZXJzKFwwIGluY2x1ZGVk
KSBmb3Igc2htX2lkDQo+ID4gKyovICNkZWZpbmUgTUFYX1NITV9JRF9MRU5HVEggMTYgI2VuZGlm
DQo+IA0KPiBJcyB0aGUgI2lmZGVmIHJlYWxseSBuZWVkZWQ/DQo+IA0KPiA+ICsNCj4gPiAgIHN0
cnVjdCBtZW1iYW5rIHsNCj4gPiAgICAgICBwYWRkcl90IHN0YXJ0Ow0KPiA+ICAgICAgIHBhZGRy
X3Qgc2l6ZTsNCj4gPiAgICAgICBib29sIHhlbl9kb21haW47IC8qIHdoZXRoZXIgdGhlIG1lbW9y
eSBiYW5rIGlzIGJvdW5kIHRvIGEgWGVuDQo+ID4gZG9tYWluLiAqLw0KPiA+ICsjaWZkZWYgQ09O
RklHX1NUQVRJQ19TSE0NCj4gPiArICAgIGNoYXIgc2htX2lkW01BWF9TSE1fSURfTEVOR1RIXTsN
Cj4gPiArICAgIHVuc2lnbmVkIGludCBucl9zaG1fYm9ycm93ZXJzOw0KPiA+ICsjZW5kaWYNCj4g
PiAgIH07DQo+IA0KPiBJZiBJIGNhbGN1bGF0ZWQgcmlnaHQsIHRoZSBzdHJ1Y3R1cmUgd2lsbCBn
cm93IGZyb20gMjQgdG8gNDAgYnl0ZXMuIEF0IHRoZQ0KPiBtb21lbnQsIHRoaXMgaXMgcHJvdGVj
dGVkIHdpdGggQ09ORklHX1NUQVRJQ19TSE0gd2hpY2ggaXMgdW5zdXBwb3J0ZWQuDQo+IEhvd2V2
ZXIsIEkgdGhpbmsgd2Ugd2lsbCBuZWVkIHRvIGRvIHNvbWV0aGluZyBhcyB3ZSBjYW4ndCBjb250
aW51ZSB0byBncm93DQo+ICdtZW1iYW5rJyBsaWtlIHRoYXQuDQo+IA0KPiBJIGRvbid0IGhhdmUg
YSBxdWljayBzdWdnZXN0aW9uIGZvciA0LjE3ICh0aGUgZmVhdHVyZSBmcmVlemUgaXMgaW4gYSB3
ZWVrKS4gTG9uZw0KPiB0ZXJtLCBJIHRoaW5rIHdlIHdpbGwgd2FudCB0byBjb25zaWRlciB0byBt
b3ZlIHRoZSBzaG0gSUQgaW4gYSBzZXBhcmF0ZSBhcnJheQ0KPiB0aGF0IGNvdWxkIGJlIHJlZmVy
ZW5jZWQgaGVyZS4NCj4gDQo+IFRoZSBvdGhlciBzb2x1dGlvbiB3b3VsZCBiZSB0byBoYXZlIHRo
ZSBzaGFyZWQgbWVtb3J5IHJlZ2lvbnMgaW4gYQ0KPiBzZXBhcmF0ZSBhcnJheS4gVGhleSB3b3Vs
ZCBoYXZlIHRoZWlyIG93biBzdHJ1Y3R1cmUgd2hpY2ggd291bGQgZWl0aGVyDQo+IGVtYmVkZGVk
ICJtZW1iYW5rIiBvciBjb250YWluIGEgcG9pbnRlci9pbmRleCB0byB0aGUgYmFuay4NCj4gDQoN
Ck9rLCBzbyBvdGhlciB0aGFuIHRoaXMgZml4aW5nLCBvdGhlcnMgd2lsbCBiZSBhZGRyZXNzZWQg
aW4gdGhlIG5leHQgc2VyaWUuIEFuZCB0aGlzDQpwYXJ0IGZpeGluZyB3aWxsIGJlIGludHJvZHVj
ZWQgaW4gYSBuZXcgZm9sbG93LXVwIHBhdGNoIHNlcmllIGFmdGVyIDQuMTcgcmVsZWFzZS4NCg0K
SSdtIGluIGZhdm9yIG9mIGludHJvZHVjaW5nIGEgbmV3IHN0cnVjdHVyZSB0byBjb250YWluIHNo
bS1yZWxhdGVkIGRhdGEgYW5kIGxldA0KJ21lbWJhbmsnIGNvbnRhaW5zIGEgcG9pbnRlciB0byBp
dCwgbGlrZQ0KYGBgDQogK3N0cnVjdCBzaG1fbWVtYmFuayB7DQorICAgIGNoYXIgc2htX2lkW01B
WF9TSE1fSURfTEVOR1RIXTsNCisgICAgdW5zaWduZWQgaW50IG5yX3NobV9ib3Jyb3dlcnM7DQor
fQ0KKw0KIHN0cnVjdCBtZW1iYW5rIHsNCiAgICAgcGFkZHJfdCBzdGFydDsNCiAgICAgcGFkZHJf
dCBzaXplOw0KICAgICBib29sIHhlbl9kb21haW47IC8qIHdoZXRoZXIgdGhlIG1lbW9yeSBiYW5r
IGlzIGJvdW5kIHRvIGEgWGVuIGRvbWFpbi4gKi8NCisgICAgc3RydWN0IHNobV9tZW1iYW5rICpz
aG07DQogfTsNCmBgYA0KVGhlbiBldmVyeSB0aW1lIHdlIGludHJvZHVjZSBhIG5ldyBmZWF0dXJl
IGhlcmUsIGZvbGxvd2luZyB0aGlzIHN0cmF0ZWd5LCAnbWVtYmFuaycgd2lsbA0KYXQgbW9zdCBn
cm93IDggYnl0ZXMgZm9yIHRoZSByZWZlcmVuY2UuDQoNCkknbSBvcGVuIHRvIHRoZSBkaXNjdXNz
aW9uIGFuZCB3aWxsIGxldCBpdCBkZWNpZGUgd2hhdCBpdCBmaW5hbGx5IHdpbGwgYmUuIDspDQoN
Cj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQoNCkNoZWVycywNCg0KLS0NClBl
bm55IFpoZW5nDQo=

