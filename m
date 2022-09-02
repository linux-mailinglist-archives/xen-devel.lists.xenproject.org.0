Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC4C5AA9C8
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 10:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397454.638037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1tA-0004eJ-E7; Fri, 02 Sep 2022 08:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397454.638037; Fri, 02 Sep 2022 08:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1tA-0004by-Az; Fri, 02 Sep 2022 08:18:56 +0000
Received: by outflank-mailman (input) for mailman id 397454;
 Fri, 02 Sep 2022 08:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mC+w=ZF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oU1t9-0004bq-Fq
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 08:18:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e17deb58-2a97-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 10:18:53 +0200 (CEST)
Received: from AS9PR06CA0355.eurprd06.prod.outlook.com (2603:10a6:20b:466::22)
 by VI1PR08MB5309.eurprd08.prod.outlook.com (2603:10a6:803:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 08:18:50 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::11) by AS9PR06CA0355.outlook.office365.com
 (2603:10a6:20b:466::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11 via Frontend
 Transport; Fri, 2 Sep 2022 08:18:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 08:18:50 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Fri, 02 Sep 2022 08:18:49 +0000
Received: from c517a640682f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CC23C4BE-217D-445A-A4F8-7E201EC37CDC.1; 
 Fri, 02 Sep 2022 08:18:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c517a640682f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 08:18:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB5907.eurprd08.prod.outlook.com (2603:10a6:20b:2da::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:18:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 08:18:42 +0000
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
X-Inumbo-ID: e17deb58-2a97-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FTcNEYJ/N70G5dmbMcUaftY0FEtNU+Np4YoHG1LR9J+kKrAN2WJ+fQGsarewCy32tuYn4+bNymFA0dIRBhElQg2XgCYxop8c9hF6IBIR6gpBUqhaQgMxxXPIrPsNeSkLqNqHGTZeSEH4j+7/RhudPrt7zbg9If8nV5eCHr50x9PT4XJ6/oiz2WKF+V7YfnMDTp47252dGBIhjPZx/GaDOBF8E1mXnCgxaPMW78ZmP3BaJqx7F4svbVTilnDiu3GXbJS7lxcSfTazYR6pP+UyieroTzfkrmDfKstRvtHyu0pZNApLm/heHZ7dasGXwdrc5ToXKzz40FaJUZHYU2XWiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUVHDdxEJym8NDyFqApVQbksD709+G831EmR+xDOp7Y=;
 b=a1yzChJ1nUHm28ux0tW1Wl2Ws65a64+kQkDs2xea22wtqYQfmmZUM2woXgugrHW+s+G81TVdTGU4dgdt+pb2ZC6XU+02jl1jvNRogLdBLfSiPONuz0feJKAi0HxQRMeRPaIC5osMGR7qrdw7q4+2aucxc++4VSEViZVVWt9j9bq0vIiXmexrj3b6RAw3qWBDakpjyLqJuLEqMvx+glMqfhacU/vgqYuMfERhy/U5KwQVe3QTLkZKImf+usrTwMu0esprUOX89jaajfHmsifBcK8qsXaA9sL9tsyFNGp7B6K4xafKtiUL6DGS8tzezIrbJtGN2z76PlcEWAv5C2w8/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUVHDdxEJym8NDyFqApVQbksD709+G831EmR+xDOp7Y=;
 b=upueO9yL5JmQ5nG3plI3E1BvWTBTsZprlhvNgvLL/WEEojfMpZ2PfBvB3+dcBOvN7UOfOFVaynBSUAyG3dQbjbjsxpO286o7c9U2SwS3UUhqyD2VsUim80Hutua28s5Q+CppzZeEMZ0XPNAU8sBWGEI9vZoQDAN217dyxdWNWqc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4ZZw4J1eD0exYqF2YpEB/UmN6aBeyFMw+37aepBIQt5e3pApP53g63CE+a4jWR1aJHTDEYxvVhtujH9drL7IafbjnByMDnzVZWhtnCEgaecYKgG5RoJeAOetbVhi465zXAeTVpnVAHSyNefnGqn9sg8MHWqIukKHwOJdhllq9lQO4pGjogc6Jwtf1VE+fCVP4LyQBWuOOGCfSdXPpQFb15EsbKYkjFMQX7zxuQCA8QPef8bDl65lgK/0N4FwTth19J+dxuHhSbl35LCUhFy6e2mEOdn6QSL19nXpY7Zv/EG42oO4EUzZjUm9gxRg97M1dJq7brMQEnmLVtkoZ6+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUVHDdxEJym8NDyFqApVQbksD709+G831EmR+xDOp7Y=;
 b=eMOLAUdRxGt5clL/5Nt6G1qhCkq4QgrbJ5Pe+0nj9VTs4V4IGuWjwwT41QTffKFNMH+spMoJRsWPozkqNWXtucnsvWkxmkPOOrJO/WSbbX6wS4qGecoWtzZfdlXdmADm99pkC292JjpGqTxUsKNvWKKZ/APDwe7Q+TNNAyPVs8Xqg3rGziMIA75pzVs9VkGCA29LEKlRpblqftz3g2BfAjq30AJIGhHYr70o93gOfvwnMMe6Mk9XRATK0vn0VigaodHMB0uHw7tf3LpJH7x2h6yt0jbH0R9GItM5LCHmFOL/vDKdMxPx2SKUIvitX1iQHd6mSOE/1gPZ9gzVRHuGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUVHDdxEJym8NDyFqApVQbksD709+G831EmR+xDOp7Y=;
 b=upueO9yL5JmQ5nG3plI3E1BvWTBTsZprlhvNgvLL/WEEojfMpZ2PfBvB3+dcBOvN7UOfOFVaynBSUAyG3dQbjbjsxpO286o7c9U2SwS3UUhqyD2VsUim80Hutua28s5Q+CppzZeEMZ0XPNAU8sBWGEI9vZoQDAN217dyxdWNWqc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index:
 AQHYt4ugTfbCAM/WyEil7pMplK0r3q3KwCgAgAAG+VCAABfUgIAApokQgABStYCAAADsEA==
Date: Fri, 2 Sep 2022 08:18:42 +0000
Message-ID:
 <AS8PR08MB7991A48B85358E7788DFA05B927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
 <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <b05106cc-09d8-9a9b-38e5-328cd8caff97@xen.org>
 <AS8PR08MB799161163796249F1AFC4C06927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3597a89f-98f6-d43a-4dd9-345b155e7216@xen.org>
In-Reply-To: <3597a89f-98f6-d43a-4dd9-345b155e7216@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7579A6AB8DDEB74B8F2E4D5905BE385E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0b701a83-6ff5-4663-37bb-08da8cbbc409
x-ms-traffictypediagnostic:
	AM9PR08MB5907:EE_|AM7EUR03FT012:EE_|VI1PR08MB5309:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WmtNxs+PHmvQwyQjPxQCss8u9+cK+IZ52BwN1Ut0hwUzz0EKQnnJxn4ymrULiIMGAG1XSXC5yS/4l0Exnsc/DyQZKPU/dXQllSwBZAiq96H6unob5YxZnXBHhKPJkK32SGijJ5dCk+tYbsbTv36CiRhdL4pQjhhmvYQ6JQhfgRmFTq9ILmjaqK/dv4TnZuSWuYT2OdL3oLXRrXzaur8FoCI5/BwiDboVK0Ai5AuaJyV9Gu7BQiy8rQ721AsvrRwI0IKFQOsOeVuPH5iJK7G76DoyB02f7hgy7oPgUYyEfey2O/2YeeKyjtp8y4eLq+e3lhObRXU2TaLeERA8Mu4TJ4SrYPj41/x08T11PuhuVIl9X68It1JoUbXnGPF42c3cTVaTG+v3zaX4p8o2qhNUehrtg5hx8mqoejbps3UXExfcXP1lrchekePE7EbTT0zWXGL1xvHVDg0Na0E+cWxo7HpLsB877bgBSjN2q3JZRWbz3zzfLae3FzknVFDpCZ9AF4hCU1VFM+X02MtF7U6l36bljDUoDzWqDOppjSuadJitfplGSiFq9RiGZbYaW12YR2E8+dNQFtS6Ch/tU/vcTV9Hk2VwXI14uWjS+LD0xFsKOYww6LKNF19zZjc62nYmAYqfGfq2wdNwBemci+01Xv7HEVnbhYjKmVGfKhz4Qh9HxVoUBurS9BG1Y2Bl4d2NLvwl6IhBZIk/5H6Uyck4za3FkoePAYofP9bDz5D3GQJqtd2i3Izxtg79kyZIyNcidAMPG94uigzODgLkJDSY5A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(6506007)(7696005)(26005)(9686003)(71200400001)(186003)(52536014)(8936002)(5660300002)(33656002)(86362001)(41300700001)(478600001)(122000001)(83380400001)(38070700005)(54906003)(4326008)(8676002)(64756008)(110136005)(66446008)(66476007)(2906002)(316002)(38100700002)(66556008)(55016003)(66946007)(76116006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5907
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2abc870d-7d8a-42ad-8179-08da8cbbbf6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GrsRCWEL7dildT5uxSaxqkYSFPZ/evDkVySw25uhUi4Pval4Jbj+p6bDzyJqoGLOs1TGiS+feHjoSPmphQQx4wr4g/nI2axCNc5w/nRCEeZNU1quYZly/Hck6UVBAM5Fuk6/P/9y+oGYWvOgWyIon8G9XiX9MgdtfMaSEwMDcCCRrok9nVevBUYvxcmP4BRH7SatcufHxLkjDfZ2ELMaQW5AOi5Ii0JYvSjH3S5SJxFsaJUFKJu5ZyFDXA45+E1rOezqQXIT/zvvUkESwRiZL7rzLvPm0L74mEin80a3tkhSoJv1UtAaZTHF9JEhpRhKeDn7JzNDyxm2jquARrff7B8g3p5iNdSglDC9g/SNdfvGeFz8r9xNHEg+hRzXv0QhXWZMQKPhKi01Q0C0RTpCzFz2MqynbtSlYT477PWp44VbQna+9G6kc5sqmOy37C1TGoMUGSZWmYUW5VJ5L1FvfcBsz80q+V/EoB0oDNp3k49H/wdwcj+zoTPgnKOpFG1aFKeCC/pBL7J6H5a8bQXVJ+1Nm3T/Z5ohArbKkn2F4u/GWeq7s5xlfNjEvl37XI7oD9pY+BJ7RfPEktWDz+IncrlH2uBYcPImKzVCSrKZaOT/nXsDjBvM3XVHlA2ZcMOLssn06qAcUIjgOtZI5Vv4ej6yDIU4xeeJQ21EF4jsKyOqDQEPdUvkZbY4m7Y0z3kM3OgozTRiR0hgvP5E897hOg782WsQPhNKXRWyjjX+IiiCv7sTDLkzPPw8ltMAFLXP+nCvL0H9tP/PYbmVC7CFtQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(6506007)(7696005)(47076005)(9686003)(26005)(186003)(336012)(52536014)(8936002)(5660300002)(33656002)(86362001)(41300700001)(107886003)(478600001)(36860700001)(356005)(83380400001)(81166007)(54906003)(82310400005)(4326008)(110136005)(8676002)(2906002)(316002)(40480700001)(40460700003)(82740400003)(55016003)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:18:50.1589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b701a83-6ff5-4663-37bb-08da8cbbc409
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5309

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlv
bi4gSSBjaGVja2VkIHRoZSBjb2RlIGFuZCBmb3VuZCB0aGUgeGVuaGVhcF8qDQo+ID4gdmFyaWFi
bGVzIGFyZToNCj4gPiB4ZW5oZWFwX3ZpcnRfc3RhcnQsIHhlbmhlYXBfdmlydF9lbmQsIHhlbmhl
YXBfbWZuX3N0YXJ0LA0KPiA+IHhlbmhlYXBfbWZuX2VuZCwgeGVuaGVhcF9iYXNlX3BkeC4NCj4g
Pg0KPiA+IEZvciBjbGFyaWZpY2F0aW9uLCBkbyB3ZSBuZWVkIHRvIGNoYW5nZSBhbGwgb2YgdGhl
bSB0byBkaXJlY3RtYXBfKj8NCj4gDQo+IEdvb2QgcXVlc3Rpb24uDQoNCjopKSkgVGhhbmtzIGZv
ciB5b3VyIHBhdGllbmNlIQ0KDQo+IA0KPiA+DQo+ID4gQSBwdXJlIHJlbmFtaW5nIHNob3VsZCBi
ZSBlYXN5IChhbmQgSSBndWVzcyBhbHNvIHNhZmUpLCBidXQgbWF5YmUgSSBhbQ0KPiA+IG92ZXJ0
aGlua2luZyBiZWNhdXNlIGFybTMyIGFsc28gdXNlcyB4ZW5oZWFwX3ZpcnRfZW5kLA0KPiB4ZW5o
ZWFwX21mbl9zdGFydA0KPiA+IGFuZCB4ZW5oZWFwX21mbl9lbmQuIFRoZXNlIHZhcmlhYmxlcyBy
ZWZlciB0byB0aGUgcmVhbCB4ZW5oZWFwLCBJIGFtIG5vdA0KPiA+IHN1cmUgcmVuYW1pbmcgdGhl
c2Ugd291bGQgcmVkdWNlIHRoZSByZWFkYWJpbGl0eSBmb3IgYXJtMzIuDQo+IA0KPiBTbyBvbiBh
cm0zMiwgb25seSB0aGUgeGVuaGVhcCBpcyBkaXJlY3QgbWFwcGVkIHRvZGF5LiBTbyBJIHRoaW5r
IGl0DQo+IHdvdWxkIGJlIGZpbmUgdG8gc3dpdGNoIHRoZSBuYW1lIHRvICJkaXJlY3RtYXBfKiIu
IEZvciBleHRyYSBjbGFyaWZ5IHdlDQo+IGNvdWxkIGFkZCBhbiBhbGlhcyBmb3IgYXJtMzIgYmV0
d2VlbiAieGVuaGVhcF8qIiBhbmQgImRpcmVjdG1hcF8qIi4NCg0KU291bmRzIGdvb2QgdG8gbWUs
IEkgdGhpbmsgSSB3aWxsIHRyeSB0byBhZGQgYSBzZXBhcmF0ZSBwYXRjaCBmb3IgcHVyZWx5DQpy
ZW5hbWluZyBhbGwgYWJvdmUtbWVudGlvbmVkIHZhcmlhYmxlcywgdGhlbiBhbm90aGVyIHBhdGNo
IGZvciBjcmVhdGluZyB0aGUNCmFsaWFzIGZvciBhcm0zMi4gSG9wZSB5b3Ugd291bGQgZmluZSB3
aXRoIHRoaXMgcGxhbi4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0K
PiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

