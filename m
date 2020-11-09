Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267BB2AB30D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 10:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22196.48473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc33g-0006Z6-Cb; Mon, 09 Nov 2020 09:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22196.48473; Mon, 09 Nov 2020 09:01:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc33g-0006Yg-7v; Mon, 09 Nov 2020 09:01:52 +0000
Received: by outflank-mailman (input) for mailman id 22196;
 Mon, 09 Nov 2020 09:01:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s5/2=EP=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kc33e-0006Yb-PQ
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:01:50 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a61f24e5-ae82-4332-8297-c9c2d3f06deb;
 Mon, 09 Nov 2020 09:01:48 +0000 (UTC)
Received: from AM5PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:203:2::30)
 by PR2PR08MB4906.eurprd08.prod.outlook.com (2603:10a6:101:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Mon, 9 Nov
 2020 09:01:45 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::d1) by AM5PR0701CA0068.outlook.office365.com
 (2603:10a6:203:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend
 Transport; Mon, 9 Nov 2020 09:01:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 09:01:44 +0000
Received: ("Tessian outbound 082214a64d39:v71");
 Mon, 09 Nov 2020 09:01:43 +0000
Received: from 6874ff27115d.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DF6879C-8B17-412C-B757-A60DA1041E46.1; 
 Mon, 09 Nov 2020 09:01:38 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6874ff27115d.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Nov 2020 09:01:38 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB3137.eurprd08.prod.outlook.com (2603:10a6:208:64::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Mon, 9 Nov
 2020 09:01:32 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 09:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=s5/2=EP=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
	id 1kc33e-0006Yb-PQ
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:01:50 +0000
X-Inumbo-ID: a61f24e5-ae82-4332-8297-c9c2d3f06deb
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown [40.107.9.77])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a61f24e5-ae82-4332-8297-c9c2d3f06deb;
	Mon, 09 Nov 2020 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ycnj+jXOWTGKLzVgLcpM39cPNIcUh/AdEUqjzwHTte0=;
 b=ebs2Nag7UQiCZDRhb1WOexkP7i44+6XxGpyZhhB2w7uMMuQ3F4BtjmvUoBWvm9Xk3Y/bza6CPE/29OFR3h6TVBjCn8RNjEj9OhwKBMFKTDkD3KC7PTuGJl+rvboz5GNrp82SVCmOEu34GGuTl97LII1XMDCFc6MiCMiQIDvAW2Q=
Received: from AM5PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:203:2::30)
 by PR2PR08MB4906.eurprd08.prod.outlook.com (2603:10a6:101:26::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Mon, 9 Nov
 2020 09:01:45 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::d1) by AM5PR0701CA0068.outlook.office365.com
 (2603:10a6:203:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend
 Transport; Mon, 9 Nov 2020 09:01:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Mon, 9 Nov 2020 09:01:44 +0000
Received: ("Tessian outbound 082214a64d39:v71"); Mon, 09 Nov 2020 09:01:43 +0000
X-CR-MTA-TID: 64aa7808
Received: from 6874ff27115d.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4DF6879C-8B17-412C-B757-A60DA1041E46.1;
	Mon, 09 Nov 2020 09:01:38 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6874ff27115d.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 Nov 2020 09:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmYuVR/2+W7xefYpiPgqqZLDGQiYfUSG4/1YubnXIxxYcVI4IrIUcAH9xE8lkrwCVb8w1GFy3mp9XuoBH532sWSX+DdQ3VAY1X7rRbLikU0FOn+vk0nl27iGevWem3nBWhwubYT5ewZxiOrVwVKLqvR1lVe3qBYg1TrxR2/4OOZ7vVJL9W2NJm/yDTw7kFVsWR/wioP4QGSaXxjfHAYdsX53IaVQlw1wcopsKMOeiDYhFD2oAbdzo7cgq/ns9gfs/oMxnJjvLUL3vh1nidiQUpNX2TGSjauIaJbgNClngR9NCwhprtZKp4Krr5Hy+aD59NiNVq8cJLUpIGDI+Rlv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ycnj+jXOWTGKLzVgLcpM39cPNIcUh/AdEUqjzwHTte0=;
 b=Zcl9kcVgg99au4/0G4fOUdoxJVC/uzjRnmlDaZyXo/v9KHYi+hEYDZ0Q5gQCmdTwLledR41RdsvlEHh3MQmLsangdxjsyS+B25gdd+ZtZN1BqhcBiED4oeiIf8rjTGVSRlYoh1wGLpYgBPBk8JW7ZfaUTu7FRaYb8vbrfMJdlvElwwGIBGKxiSKnXv8zmBWqI2h+l76wj62hIlixnWd481E6TY+E1WVhbCfvCgbxcfmENS6kbPdLH3Mv36UFg3mCl2mOoNJWQbXMyRtk3UHa3J/FMfXqrHjB7sgNuioO3GBlrWdv0VntF+ziOfTAEbTxkryX3pmeaDHauHJfnTxd4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ycnj+jXOWTGKLzVgLcpM39cPNIcUh/AdEUqjzwHTte0=;
 b=ebs2Nag7UQiCZDRhb1WOexkP7i44+6XxGpyZhhB2w7uMMuQ3F4BtjmvUoBWvm9Xk3Y/bza6CPE/29OFR3h6TVBjCn8RNjEj9OhwKBMFKTDkD3KC7PTuGJl+rvboz5GNrp82SVCmOEu34GGuTl97LII1XMDCFc6MiCMiQIDvAW2Q=
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB3137.eurprd08.prod.outlook.com (2603:10a6:208:64::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Mon, 9 Nov
 2020 09:01:32 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::257f:eb47:fe85:5993%3]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 09:01:32 +0000
From: Wei Chen <Wei.Chen@arm.com>
To: Penny Zheng <Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
CC: Andre Przywara <Andre.Przywara@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Kaly Xin
	<Kaly.Xin@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Topic: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
Thread-Index: AQHWtnF2jWNIb4RgFU+PRE0mwpdPDam/f5Dw
Date: Mon, 9 Nov 2020 09:01:32 +0000
Message-ID:
 <AM0PR08MB37475BBAE02CAD8EC0F067199EEA0@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20201109082110.1133996-1-penny.zheng@arm.com>
In-Reply-To: <20201109082110.1133996-1-penny.zheng@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A4A5B80817ADDB47AA86EBB75A7CC3C0.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.112]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6f045462-a295-48ef-e884-08d8848e1551
x-ms-traffictypediagnostic: AM0PR08MB3137:|PR2PR08MB4906:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB49065B9708005A2684DA747C9EEA0@PR2PR08MB4906.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EW6W8UC3hxngEAw7MMIFIiv/hbFX4jF9PZAQW2z+VjrvHULpKYnwzpC4pslPUpZK3XeQq8RhH4/S5Gw2gICCDxPODUtTVmwdOV0kgO0p1gh4n/DxMd8nf5B4XkRDokXusi4RT+/Gz26lI/GCSTyD+gxobZCsn3U7xM942TSnq/WcdzFlI9c7Gd0OT/r6LXFi4mdTBpPuA2KShmJ6yDCFL10Ek7KJTeOp/ZwaPjOZnxQQFGHkvw856Oq/qpWke1814p14Skses8bQyur8wxfx30d+TqjH0aPk8rptkdH67vcYI5/+b6tP3aIlTYkn5EcgBN7RnU5qryt2i1IymxlXJA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(8936002)(52536014)(26005)(4326008)(2906002)(54906003)(53546011)(6506007)(7696005)(478600001)(83380400001)(76116006)(66946007)(8676002)(66446008)(66556008)(64756008)(66476007)(9686003)(55016002)(86362001)(110136005)(33656002)(316002)(71200400001)(5660300002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 fK3wiLtIXT0f0o5JH6dwRk5d8jUZ92Jc5mgJnj0GfrEXUKObLg2r05G4ZHQrOFWWuhJaBE2B7NBC9D1gQa/7nGVrjKKsAKoKJvGDTVdO6Be6GXlzUuJxvCB2NRockMt0WAXIDHcCt5ZrnJJyMfct7QDlvIC3yr41krz/5orjtdoMSjCbKN2479NQHBJxdSVCIqCESepSDsEvi7wxu9mAYGhUU8ZieybyF4nx8oJG7GKpuI+aIfh8F8z1usahZMyGDjPhJcpHK7nAdsUBIcWvTX554c1q+c8+BsE37KItWgOZcUVRxjJwHNR7XYg5/KoewQxD/0edsl1wWMRm9GZtjP4tVosPyV6iIjLGv4S1vUivahKMILgzuFYc0uAzO3tqYN7nTHPKGwRo8l1b/l4TuE3sV8M8GZ2aTiESgyytnpWgoIMywsqgaGH0dMPYvRm4J+12ttugmw/ppWM/R/7I8Bmm4aD95JneHAL8ScqdJX+4pl8TELZgtVix5HEp29zCHznMX8WYxA9LkLehLF6PKqbDFSCjIFPAocFrKw4sp3r2TtBTw3dH868DeRZ4VAcsRQ49YYyw5cGYDwJnJIiCzI9CC6cIWejb6ngbl7qvOV80mXx6Ztf3yNcSF73w+xrYekQ2QNkCnhC78IJUr/hyfA==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3137
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55348e46-8506-444e-8430-08d8848e0dc7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/1fk8XQwkCxz9ZT7tO1oYlG+aKOEW3gHQtmFAu29KszB0pYJanvNzw7e8PkX+fvCC3uMTAOJqoARbP2i7Q5f7Ytn0RFxkKtbAWBeJPitLsGHU5Pnhjn5Rx+hyF80BJZDXutK11gIz9Jpe80Uflg+lDEG2yavmmJkgLShhJBE9bAzndY/LSeJv7F1AHmUgLnDj7L4F5CbqEZQ3+ZG85kxZLAmcUjkW7On7iixG9PcrzDdOQihXYNxRSo67m5Uuf7cuBjjTsNFYlgeappgoH47FT5/Vu+lpy11k4mRr38+OKTdpn5OBK1mMTDLY8DuxX7Ydu2vIFWpJvlmP0RL7PJ1oIVhMOiEaSHl9n9pgAppgZVv9ww8pOfmate65yZuTGIEx/IwOV5QpsNd5DQ10FaWhQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(82740400003)(47076004)(82310400003)(4326008)(2906002)(83380400001)(110136005)(52536014)(86362001)(336012)(8936002)(356005)(81166007)(478600001)(8676002)(33656002)(186003)(316002)(70586007)(36906005)(70206006)(5660300002)(7696005)(55016002)(26005)(6506007)(53546011)(54906003)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 09:01:44.8328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f045462-a295-48ef-e884-08d8848e1551
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4906

SGkgUGVubnksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGVubnkg
WmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+IFNlbnQ6IDIwMjDE6jEx1MI5yNUgMTY6MjEN
Cj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVs
Lm9yZzsganVsaWVuQHhlbi5vcmcNCj4gQ2M6IEFuZHJlIFByenl3YXJhIDxBbmRyZS5Qcnp5d2Fy
YUBhcm0uY29tPjsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
PjsgV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBQZW5ueSBaaGVuZw0KPiA8UGVubnkuWmhl
bmdAYXJtLmNvbT47IEthbHkgWGluIDxLYWx5LlhpbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSF0geGVuL2FybTogQWRkIENvcnRleC1BNzMgZXJyYXR1bSA4NTg5
MjEgd29ya2Fyb3VuZA0KPiANCj4gQ05UVkNUX0VMMCBvciBDTlRQQ1RfRUwwIGNvdW50ZXIgcmVh
ZCBpbiBDb3J0ZXgtQTczIChhbGwgdmVyc2lvbnMpDQo+IG1pZ2h0IHJldHVybiBhIHdyb25nIHZh
bHVlIHdoZW4gdGhlIGNvdW50ZXIgY3Jvc3NlcyBhIDMyYml0IGJvdW5kYXJ5Lg0KPiANCj4gVW50
aWwgbm93LCB0aGVyZSBpcyBubyBjYXNlIGZvciBYZW4gaXRzZWxmIHRvIGFjY2VzcyBDTlRWQ1Rf
RUwwLA0KPiBhbmQgaXQgYWxzbyBzaG91bGQgYmUgdGhlIEd1ZXN0IE9TJ3MgcmVzcG9uc2liaWxp
dHkgdG8gZGVhbCB3aXRoDQo+IHRoaXMgcGFydC4NCj4gDQo+IEJ1dCBmb3IgQ05UUENULCB0aGVy
ZSBleGlzdHMgc2V2ZXJhbCBjYXNlcyBpbiBYZW4gaW52b2x2aW5nIHJlYWRpbmcNCj4gQ05UUENU
LCBzbyBhIHBvc3NpYmxlIHdvcmthcm91bmQgaXMgdGhhdCBwZXJmb3JtaW5nIHRoZSByZWFkIHR3
aWNlLA0KPiBhbmQgdG8gcmV0dXJuIG9uZSBvciB0aGUgb3RoZXIgZGVwZW5kaW5nIG9uIHdoZXRo
ZXIgYSB0cmFuc2l0aW9uIGhhcw0KPiB0YWtlbiBwbGFjZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KDQpSZXZpZXdlZC1ieTogV2VpIENo
ZW4gPFdlaS5DaGVuQGFybS5jb20+DQoNClRoYW5rcywNCldlaSBDaGVuDQoNCj4gLS0tDQo+ICBk
b2NzL21pc2MvYXJtL3NpbGljb24tZXJyYXRhLnR4dCB8ICAxICsNCj4gIHhlbi9hcmNoL2FybS9L
Y29uZmlnICAgICAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICB4ZW4vYXJjaC9h
cm0vY3B1ZXJyYXRhLmMgICAgICAgICB8ICA4ICsrKysrKysrDQo+ICB4ZW4vYXJjaC9hcm0vdnRp
bWVyLmMgICAgICAgICAgICB8ICAyICstDQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0
YS5oICB8ICAyICsrDQo+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaCB8ICAzICsr
LQ0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS90aW1lLmggICAgICAgfCAyMiArKysrKysrKysrKysr
KysrKysrKystDQo+ICA3IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9zaWxpY29uLWVycmF0YS50
eHQgYi9kb2NzL21pc2MvYXJtL3NpbGljb24tZXJyYXRhLnR4dA0KPiBpbmRleCAxZjE4YTlkZjU4
Li41NTJjNDE1MWQzIDEwMDY0NA0KPiAtLS0gYS9kb2NzL21pc2MvYXJtL3NpbGljb24tZXJyYXRh
LnR4dA0KPiArKysgYi9kb2NzL21pc2MvYXJtL3NpbGljb24tZXJyYXRhLnR4dA0KPiBAQCAtNTEs
NiArNTEsNyBAQCBzdGFibGUgaHlwZXJ2aXNvcnMuDQo+ICB8IEFSTSAgICAgICAgICAgIHwgQ29y
dGV4LUE1NyAgICAgIHwgIzEzMTk1MzcgICAgICAgIHwgTi9BICAgICAgICAgICAgICAgICAgICAg
fA0KPiAgfCBBUk0gICAgICAgICAgICB8IENvcnRleC1BNzIgICAgICB8ICMxMzE5MzY3ICAgICAg
ICB8IE4vQSAgICAgICAgICAgICAgICAgICAgIHwNCj4gIHwgQVJNICAgICAgICAgICAgfCBDb3J0
ZXgtQTcyICAgICAgfCAjODUzNzA5ICAgICAgICAgfCBOL0EgICAgICAgICAgICAgICAgICAgICB8
DQo+ICt8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE3MyAgICAgIHwgIzg1ODkyMSAgICAgICAg
IHwgQVJNX0VSUkFUVU1fODU4OTIxICAgICAgfA0KPiAgfCBBUk0gICAgICAgICAgICB8IENvcnRl
eC1BNzYgICAgICB8ICMxMTY1NTIyICAgICAgICB8IE4vQSAgICAgICAgICAgICAgICAgICAgIHwN
Cj4gIHwgQVJNICAgICAgICAgICAgfCBOZW92ZXJzZS1OMSAgICAgfCAjMTE2NTUyMiAgICAgICAg
fCBOL0ENCj4gIHwgQVJNICAgICAgICAgICAgfCBNTVUtNTAwICAgICAgICAgfCAjODQyODY5ICAg
ICAgICAgfCBOL0EgICAgICAgICAgICAgICAgICAgICB8DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+IGluZGV4IDI3NzczODgyNjUu
LmY5MzhkZDIxYmQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ICsrKyBi
L3hlbi9hcmNoL2FybS9LY29uZmlnDQo+IEBAIC0yMjYsNiArMjI2LDI0IEBAIGNvbmZpZyBBUk02
NF9FUlJBVFVNXzgzNDIyMA0KPiANCj4gIAkgIElmIHVuc3VyZSwgc2F5IFkuDQo+IA0KPiArY29u
ZmlnIEFSTV9FUlJBVFVNXzg1ODkyMQ0KPiArCWJvb2wgIkNvcnRleC1BNzM6IDg1ODkyMTogUG9z
c2libGUgd3JvbmcgcmVhZCB2YWx1ZSBmb3IgQ05UVkNUIG9yDQo+IENOVFBDVCINCj4gKwlkZWZh
dWx0IHkNCj4gKwloZWxwDQo+ICsJICBUaGlzIG9wdGlvbiBhZGRzIGFuIGFsdGVybmF0aXZlIGNv
ZGUgc2VxdWVuY2UgdG8gd29yayBhcm91bmQgQVJNDQo+ICsJICBlcnJhdHVtIDg1ODkyMSBvbiBD
b3J0ZXgtQTczIChhbGwgdmVyc2lvbnMpLg0KPiArDQo+ICsJICBBZmZlY3RlZCBDb3J0ZXgtQTcz
IG1pZ2h0IHJldHVybiB3cm9uZyByZWFkIHZhbHVlIGZvciBDTlRWQ1Qgb3INCj4gQ05UUENUDQo+
ICsJICB3aGVuIHRoZSBjb3VudGVyIGNyb3NzZXMgYSAzMmJpdCBib3VuZGFyeS4NCj4gKw0KPiAr
CSAgVGhlIHdvcmthcm91bmQgaW52b2x2ZXMgcGVyZm9ybWluZyB0aGUgcmVhZCB0d2ljZSwgYW5k
IHRvIHJldHVybg0KPiArCSAgb25lIG9yIHRoZSBvdGhlciB2YWx1ZSBkZXBlbmRpbmcgb24gd2hl
dGhlciBhIHRyYW5zaXRpb24gaGFzIHRha2VuDQo+IHBsYWNlLg0KPiArCSAgUGxlYXNlIG5vdGUg
dGhhdCB0aGlzIGRvZXMgbm90IG5lY2Vzc2FyaWx5IGVuYWJsZSB0aGUgd29ya2Fyb3VuZCwNCj4g
KwkgIGFzIGl0IGRlcGVuZHMgb24gdGhlIGFsdGVybmF0aXZlIGZyYW1ld29yaywgd2hpY2ggd2ls
bCBvbmx5IHBhdGNoDQo+ICsJICB0aGUga2VybmVsIGlmIGFuIGFmZmVjdGVkIENQVSBpcyBkZXRl
Y3RlZC4NCj4gKw0KPiArCSAgSWYgdW5zdXJlLCBzYXkgWS4NCj4gKw0KPiAgZW5kbWVudQ0KPiAN
Cj4gIGNvbmZpZyBBUk02NF9IQVJERU5fQlJBTkNIX1BSRURJQ1RPUg0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jIGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jDQo+IGlu
ZGV4IDY3MzFkODczZTguLjU2NzkxMWQzODAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9j
cHVlcnJhdGEuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMNCj4gQEAgLTQ2OSw2
ICs0NjksMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcm1fY3B1X2NhcGFiaWxpdGllcyBhcm1f
ZXJyYXRhW10gPQ0KPiB7DQo+ICAgICAgICAgIC5jYXBhYmlsaXR5ID0gQVJNX1NTQkQsDQo+ICAg
ICAgICAgIC5tYXRjaGVzID0gaGFzX3NzYmRfbWl0aWdhdGlvbiwNCj4gICAgICB9LA0KPiArI2Vu
ZGlmDQo+ICsjaWZkZWYgQ09ORklHX0FSTV9FUlJBVFVNXzg1ODkyMQ0KPiArICAgIHsNCj4gKyAg
ICAgICAgLyogQ29ydGV4LUE3MyAoYWxsIHZlcnNpb25zKSAqLw0KPiArICAgICAgICAuZGVzYyA9
ICJBUk0gZXJyYXR1bSA4NTg5MjEiLA0KPiArICAgICAgICAuY2FwYWJpbGl0eSA9IEFSTV9XT1JL
QVJPVU5EXzg1ODkyMSwNCj4gKyAgICAgICAgTUlEUl9BTExfVkVSU0lPTlMoTUlEUl9DT1JURVhf
QTczKSwNCj4gKyAgICB9LA0KPiAgI2VuZGlmDQo+ICAgICAgew0KPiAgICAgICAgICAvKiBOZW92
ZXJzZSByMHAwIC0gcjJwMCAqLw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Z0aW1lci5j
IGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jDQo+IGluZGV4IDZkMzlmYzk0NGYuLmMyYjI3OTE1YzYg
MTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS92dGltZXIuYw0KPiArKysgYi94ZW4vYXJjaC9h
cm0vdnRpbWVyLmMNCj4gQEAgLTYyLDcgKzYyLDcgQEAgc3RhdGljIHZvaWQgdmlydF90aW1lcl9l
eHBpcmVkKHZvaWQgKmRhdGEpDQo+IA0KPiAgaW50IGRvbWFpbl92dGltZXJfaW5pdChzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnDQo+ICpjb25maWcpDQo+ICB7
DQo+IC0gICAgZC0+YXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0ID0gUkVBRF9TWVNSRUc2NChD
TlRQQ1RfRUwwKTsNCj4gKyAgICBkLT5hcmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQgPSBnZXRf
Y3ljbGVzKCk7DQo+ICAgICAgZC0+dGltZV9vZmZzZXQuc2Vjb25kcyA9IHRpY2tzX3RvX25zKGQt
PmFyY2gudmlydF90aW1lcl9iYXNlLm9mZnNldCAtDQo+IGJvb3RfY291bnQpOw0KPiAgICAgIGRv
X2RpdihkLT50aW1lX29mZnNldC5zZWNvbmRzLCAxMDAwMDAwMDAwKTsNCj4gDQo+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oIGIveGVuL2luY2x1ZGUvYXNtLQ0K
PiBhcm0vY3B1ZXJyYXRhLmgNCj4gaW5kZXggODhlZjNjYTkzNC4uOGQ3ZTdiOTM3NSAxMDA2NDQN
Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaA0KPiArKysgYi94ZW4vaW5j
bHVkZS9hc20tYXJtL2NwdWVycmF0YS5oDQo+IEBAIC0yOCw2ICsyOCw4IEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBjaGVja193b3JrYXJvdW5kXyMjZXJyYXR1bSh2b2lkKQ0KPiBcDQo+ICBDSEVDS19X
T1JLQVJPVU5EX0hFTFBFUig3NjY0MjIsIEFSTTMyX1dPUktBUk9VTkRfNzY2NDIyLA0KPiBDT05G
SUdfQVJNXzMyKQ0KPiAgQ0hFQ0tfV09SS0FST1VORF9IRUxQRVIoODM0MjIwLCBBUk02NF9XT1JL
QVJPVU5EXzgzNDIyMCwNCj4gQ09ORklHX0FSTV82NCkNCj4gIENIRUNLX1dPUktBUk9VTkRfSEVM
UEVSKHNzYmQsIEFSTV9TU0JELCBDT05GSUdfQVJNX1NTQkQpDQo+ICtDSEVDS19XT1JLQVJPVU5E
X0hFTFBFUig4NTg5MjEsIEFSTV9XT1JLQVJPVU5EXzg1ODkyMSwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIENPTkZJR19BUk1fRVJSQVRVTV84NTg5MjEpDQo+IA0KPiAgI3VuZGVmIENIRUNL
X1dPUktBUk9VTkRfSEVMUEVSDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9jcHVmZWF0dXJlLmggYi94ZW4vaW5jbHVkZS9hc20tDQo+IGFybS9jcHVmZWF0dXJlLmgNCj4g
aW5kZXggMTA4NzhlYWQ4YS4uMDE2YTlmZTIwMyAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLWFybS9jcHVmZWF0dXJlLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVmZWF0
dXJlLmgNCj4gQEAgLTQ1LDggKzQ1LDkgQEANCj4gICNkZWZpbmUgQVJNX1NTQkQgNw0KPiAgI2Rl
ZmluZSBBUk1fU01DQ0NfMV8xIDgNCj4gICNkZWZpbmUgQVJNNjRfV09SS0FST1VORF9BVF9TUEVD
VUxBVEUgOQ0KPiArI2RlZmluZSBBUk1fV09SS0FST1VORF84NTg5MjEgMTANCj4gDQo+IC0jZGVm
aW5lIEFSTV9OQ0FQUyAgICAgICAgICAgMTANCj4gKyNkZWZpbmUgQVJNX05DQVBTICAgICAgICAg
ICAxMQ0KPiANCj4gICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLWFybS90aW1lLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaA0KPiBp
bmRleCA5Y2I2ZjliMGI0Li4xYjJjMTM2MTRiIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20tYXJtL3RpbWUuaA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaA0KPiBAQCAt
Myw2ICszLDcgQEANCj4gDQo+ICAjaW5jbHVkZSA8YXNtL3N5c3JlZ3MuaD4NCj4gICNpbmNsdWRl
IDxhc20vc3lzdGVtLmg+DQo+ICsjaW5jbHVkZSA8YXNtL2NwdWVycmF0YS5oPg0KPiANCj4gICNk
ZWZpbmUgRFRfTUFUQ0hfVElNRVIgICAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAgIERUX01B
VENIX0NPTVBBVElCTEUoImFybSxhcm12Ny10aW1lciIpLCBcDQo+IEBAIC0xMyw3ICsxNCwyNiBA
QCB0eXBlZGVmIHVpbnQ2NF90IGN5Y2xlc190Ow0KPiAgc3RhdGljIGlubGluZSBjeWNsZXNfdCBn
ZXRfY3ljbGVzICh2b2lkKQ0KPiAgew0KPiAgICAgICAgICBpc2IoKTsNCj4gLSAgICAgICAgcmV0
dXJuIFJFQURfU1lTUkVHNjQoQ05UUENUX0VMMCk7DQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAg
ICAqIEFSTV9XT1JLQVJPVU5EXzg1ODkyMTogQ29ydGV4LUE3MyAoYWxsIHZlcnNpb25zKSBjb3Vu
dGVyIHJlYWQNCj4gKyAgICAgICAgICogY2FuIHJldHVybiBhIHdyb25nIHZhbHVlIHdoZW4gdGhl
IGNvdW50ZXIgY3Jvc3NlcyBhIDMyYml0IGJvdW5kYXJ5Lg0KPiArICAgICAgICAgKi8NCj4gKyAg
ICAgICAgaWYgKCAhY2hlY2tfd29ya2Fyb3VuZF84NTg5MjEoKSApDQo+ICsgICAgICAgICAgICBy
ZXR1cm4gUkVBRF9TWVNSRUc2NChDTlRQQ1RfRUwwKTsNCj4gKyAgICAgICAgZWxzZQ0KPiArICAg
ICAgICB7DQo+ICsgICAgICAgICAgICAvKg0KPiArICAgICAgICAgICAgICogQSByZWNvbW1lbmRl
ZCB3b3JrYXJvdW5kIGZvciBlcnJhdHVtIDg1ODkyMSBpcyB0bzoNCj4gKyAgICAgICAgICAgICAq
ICAxLSBSZWFkIHR3aWNlIENOVFBDVC4NCj4gKyAgICAgICAgICAgICAqICAyLSBDb21wYXJlIGJp
dFszMl0gb2YgdGhlIHR3byByZWFkIHZhbHVlcy4NCj4gKyAgICAgICAgICAgICAqICAgICAgLSBJ
ZiBiaXRbMzJdIGlzIGRpZmZlcmVudCwga2VlcCB0aGUgb2xkIHZhbHVlLg0KPiArICAgICAgICAg
ICAgICogICAgICAtIElmIGJpdFszMl0gaXMgdGhlIHNhbWUsIGtlZXAgdGhlIG5ldyB2YWx1ZS4N
Cj4gKyAgICAgICAgICAgICAqLw0KPiArICAgICAgICAgICAgY3ljbGVzX3Qgb2xkLCBuZXc7DQo+
ICsgICAgICAgICAgICBvbGQgPSBSRUFEX1NZU1JFRzY0KENOVFBDVF9FTDApOw0KPiArICAgICAg
ICAgICAgbmV3ID0gUkVBRF9TWVNSRUc2NChDTlRQQ1RfRUwwKTsNCj4gKyAgICAgICAgICAgIHJl
dHVybiAoKChvbGQgXiBuZXcpID4+IDMyKSAmIDEpID8gb2xkIDogbmV3Ow0KPiArICAgICAgICB9
DQo+ICB9DQo+IA0KPiAgLyogTGlzdCBvZiB0aW1lcidzIElSUSAqLw0KPiAtLQ0KPiAyLjI1LjEN
Cg0K

