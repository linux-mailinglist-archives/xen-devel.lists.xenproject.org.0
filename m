Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4A95779A4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 04:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369219.600532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDGbt-0004gD-4x; Mon, 18 Jul 2022 02:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369219.600532; Mon, 18 Jul 2022 02:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDGbt-0004d6-24; Mon, 18 Jul 2022 02:35:49 +0000
Received: by outflank-mailman (input) for mailman id 369219;
 Mon, 18 Jul 2022 02:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrJR=XX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oDGbs-0004d0-3O
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 02:35:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 524c5bb8-0642-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 04:35:46 +0200 (CEST)
Received: from FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::20)
 by HE1PR0801MB2011.eurprd08.prod.outlook.com (2603:10a6:3:49::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 02:35:41 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::c8) by FR3P281CA0017.outlook.office365.com
 (2603:10a6:d10:1d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.16 via Frontend
 Transport; Mon, 18 Jul 2022 02:35:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 02:35:40 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Mon, 18 Jul 2022 02:35:40 +0000
Received: from 4143b5c5ee54.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34E6835D-0429-474A-AB64-725DF248BB9D.1; 
 Mon, 18 Jul 2022 02:35:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4143b5c5ee54.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 02:35:34 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VE1PR08MB5165.eurprd08.prod.outlook.com (2603:10a6:803:10b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 02:35:31 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 02:35:30 +0000
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
X-Inumbo-ID: 524c5bb8-0642-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=X31sVj9mqYShu89wtmVBecDL+sJ/eKr97EeOkq+1dw0pM6xyXkJPLWxylnhVblsnr/FY0c5m2EsKxL0qcfwP3iVAjIrUi6ilmD8fDFJs5nIk/pqkWh5u9KY2pAKhCb9H3pjAjYdgzjY3XnBBYGfw04kitJAt+jZvBT5nT8K9wa9E3effkA6oyovUmdp//3AScn4Cy+DJlfQGR+4ABpBRAR3LpRbAyX460Y7TbL8L4JI87d9D3Nat4S3ntGsZJMRdotWdxY/I2SElkEdOv/aKHgJVHsGauS+HbGTw6zu5Jb6Wh+iJupEP3ALlZGtDIn3sQGbpdwXG9s6XcI8tv1YNCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXeSAIE5D9TtN7VgfaN92kv4d7Jb6GTKGVhKjbNHNnA=;
 b=UkmzcbzZLenOb0S68NKqi4HPZcIujgZv707dHEN/BsIifAyYxQdhu4+l1ciC9lRnzYmPJEFGVIOojy1iGl7pBktf6W4c6g9hUjkubkJ63vAc79GgBj1rtJwuowgx7chG4w2MxLdbwoPmBUkow4cNflDtlAsid6Mq9mDEBgw3l7eDLMPMZpblDpbvGH/zdECIafo6D063XaWvt5LZ1yY626eVvWyNWSx7/a7nwpPaI4kZMf//6h1fmwgkRi3KZdTa1I+fG0N1oLXrr7MxUscGn/5uu04KejU74Y9Y76GL15v1v1/E8QvPW53vtwpRu+dlMtTjqRyJeHN7YvkFhrbKDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXeSAIE5D9TtN7VgfaN92kv4d7Jb6GTKGVhKjbNHNnA=;
 b=vJzImpqm2ybvrXgm/cGiNT0lZ1IWHt3iOGXYITjxFRFRJs5C0VlgsiBeehAlLC1+HUsdAlYZig4g9/JNRihuxQ8Z+pLo5ORD/fTj3msb/g+T/EK5RiGh+t3z6pbQYhtjL+BCa0YgTJC1oWaKrgEYve56onr9knYzKl6L9JhDL24=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIAkHR+8pU71PNi12h5WY8x9bFFOz6JhXV3/v1/dkeWh6OLVtmOI/KXlJxr7Og3cjk5PclFPAVB9Va0DDPBsnaKxIWpscA1S659SSY5/Ua8g5qjixPdXwrzmHhksvMWAc5mggpZOLNBB+S0OQ5NRKJkpPtWx4l4uCWjy0L1Iw8z8jUR3Rmr8BbKSRoANZ4NvxV3JbD9n4uGtWUZj52/lv1BIHjiRj/0ZuFD91Qij3YHKjKx+fsNLNMBXBhKPymk0pbLw1t+wmzIb+M1ThoFSmW2h81CMm7CTXV4M1mMNGIq2fsFRqz7WpHLuPV2JNdN2JGeKH9yNzq7JGl0ZNByK9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXeSAIE5D9TtN7VgfaN92kv4d7Jb6GTKGVhKjbNHNnA=;
 b=ne0VDd2jK12XziQqDxWT0L3nEXl3Keu7FDBO0D4jZ6eMFEr6KHV8QVDID69H46OvFMUPwEWXDvFYIYdoTJPy2aiJ1JslZXKjSAkvsYZ7CdFBrUY3/XZRzCWhP+LX5uXqLpCrxiW1g2VWZ5URVZCRylumvCRIHwQ51AaNSudroGPGFcpyv8uCzlT4MRXOPwUVh+JBmzG4QoxCe31ABLH7+de2bzW2TzwBGTt/FlI9wLdcFlVwDQIqo/Lq2Z+jd+zFfiXV9zIJXXcTmX1NgzwW3l9/qYgt0TIPznUOzRxXl5sEa36LBTpxZ9z014MwHpE7zp6tpOvJHeQtT8AhYPWTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXeSAIE5D9TtN7VgfaN92kv4d7Jb6GTKGVhKjbNHNnA=;
 b=vJzImpqm2ybvrXgm/cGiNT0lZ1IWHt3iOGXYITjxFRFRJs5C0VlgsiBeehAlLC1+HUsdAlYZig4g9/JNRihuxQ8Z+pLo5ORD/fTj3msb/g+T/EK5RiGh+t3z6pbQYhtjL+BCa0YgTJC1oWaKrgEYve56onr9knYzKl6L9JhDL24=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 1/8] xen/arm: introduce static shared memory
Thread-Topic: [PATCH v5 1/8] xen/arm: introduce static shared memory
Thread-Index: AQHYhGRAIMWAAZoglEyYz3pT8Ubq/a1e3kuAgAc4ucCAGcxmgIADsJ/Q
Date: Mon, 18 Jul 2022 02:35:30 +0000
Message-ID:
 <DU2PR08MB732511B5B93C6AE0113ABAF1F78C9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-2-Penny.Zheng@arm.com>
 <45a41132-1520-a894-a9eb-6688c79a660d@xen.org>
 <DU2PR08MB7325E703004D3BB160C2CF50F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <eb483210-9f6c-9177-4e96-d87fb4ff9d1b@xen.org>
In-Reply-To: <eb483210-9f6c-9177-4e96-d87fb4ff9d1b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 388CD2AECDA56A4688DFE397CA5F400D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 11edf379-d497-4b5f-8519-08da686634c3
x-ms-traffictypediagnostic:
	VE1PR08MB5165:EE_|VE1EUR03FT023:EE_|HE1PR0801MB2011:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IOkdwOgsSTKYxtFHoDLpanVfwZhJq1iE6UAjJ96fbmo/QuIYk/b0c/2SSVyhsCsYjhaHqJ7JZc3ZKRO0fcrxRi1jc9vLcFxEOnR81TKCFbynlRyNt/rEqrtNfKgiDda7Pxcr8h7txbYDP6lGZFNNKKX77kZzvbdOK5CVfEdhu5tAdSAbUgfarpqwncJfiNQCDkBgB1IkFc3czg25ZnT4i1mjw8ic/RZAcHOl0wOQcJiwT9+Iok3qenyiGiaT184PGtkFPuZD+NT8jPDPLyP8O6EAhxEUEwNhCRBBNFEalR1j5UT17pZYH8jnxIJ6NDKFZU/KthRfmytTiRq6+zH9Q6pGp2zSShKpcSwa8tzIftDeGHmUrp3sHr6o4dhZoRSYP891YHj5SHxx/BWNXOX1xNPLGeImwM95EJ5kfQusuJnL1iXu9i5iyTaiG0Y/eFeEhc2zo196vxcrJfBq3SjIHWkWIb22SFHziVHIhBT0AJEv91umg34eX5l3uKF51rlJvx4r4Ykeuvx5suef5DhsIWgOuRD9tEZk4172GhXMhmI7XTXYkqXk46M3AjiNn6nlZ1OQ3lWxsQdksrcwIjYxtuPM5pUsjmTRwSQ0dgWVWbPS1zUwB40iKFRAvaVZD70Lbc8Ds4hXLdDmKpej8aerXifF4JumruPl9z7BAsGAQPEIJxFwCwEu7nYudP7rUOH88FTCj5KGqqEdI5Q9idDd6QpJggt8COHrXTtMADgcnqSrh+NlCaSSgS6xrk28AP1PMmzY+13Kuw0nFXC4dbYPt01qzazazuKcaE5vErGqdIAvzpW/3d2Hgxv8PUheRtPu
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(366004)(39850400004)(376002)(9686003)(5660300002)(86362001)(52536014)(8936002)(7696005)(6506007)(478600001)(41300700001)(53546011)(2906002)(26005)(33656002)(4326008)(122000001)(38070700005)(83380400001)(186003)(55016003)(66556008)(66446008)(64756008)(66476007)(8676002)(76116006)(316002)(66946007)(54906003)(110136005)(71200400001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5165
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	100257bf-88d0-46a1-cfd1-08da68662ec7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yRqY5n8qXMHTOmZcqyErtVGm+w+QNY+VtBGc0IHeF6B7Y2ao/sTAOxzgb8nyETXWlvTVLe5joSVeioalxQT8djruUnbPiIXzvTh45yN5f7HzRNJQ4n7sLrJmR1gOelB0bhlcBf//nixOs3xLR2hA0J9d4qNr6zc4Z5sp0zmlqGdYQNLKrKbkJJ3puRfrypeYDR1PgFqqajb5ieOSjHGR2vXZ0ixixqMmPNOEHGNEDQt1oEhmaWR5qk6UG423HvIi5nhUdoqR4iZ583rPhn8zmrsT0A/yhNi7gb/Wx+prmYBZIkZYbDULt7SI4XOFj9EQcC2akWiTA5XPE4phWb3p9XZsKKfz22gF3V6nTjrpSngs6YIhdDUTHkH9lsnTkfs3GiynYZnuUpiB8SkUFwR+D3ufC8Ulen+30yek0c2R79hMkk4hJ0hP79tZLpo3dNUXQOA/rgFqr+nnrImBlXESHYF8sC/0qKkRMamtbD1czSKClPJNeaThdQKCah2hqgCkOcdj5KoJ7uy2rkbF1W3oT6lqMuRvdvfyTVU+2Uyig0q0DOILEyvXRBmyDpKu++pdPSAGCPbrhC4ABFbG5r6pRazGo289hmhrWhdrcfxodc3b9Orpb5lW53C3vDrdYE0yAZFX7DP334vmlFXBtUMUaLtoil9h8ZGZP+Qrmc+iLoAfRsprnkgI/sLcT7AXFNydeaANsgVMIORHgim/Lmg+SQBObNoy2WORMG10mRyo9BytnsZBFSRCrZOQF/oCFwyubdhCZlQ1N1cKqHEttr0hUg4Tw9REYL4MwsyIwJMszoU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(396003)(376002)(136003)(36840700001)(46966006)(40480700001)(36860700001)(5660300002)(55016003)(86362001)(82740400003)(316002)(70206006)(54906003)(2906002)(81166007)(70586007)(110136005)(336012)(107886003)(8676002)(186003)(47076005)(4326008)(478600001)(9686003)(26005)(7696005)(52536014)(8936002)(6506007)(41300700001)(53546011)(82310400005)(33656002)(356005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 02:35:40.6340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11edf379-d497-4b5f-8519-08da686634c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2011

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogU2F0dXJkYXksIEp1bHkgMTYsIDIwMjIg
MjoxMCBBTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNo
dWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1
IDEvOF0geGVuL2FybTogaW50cm9kdWNlIHN0YXRpYyBzaGFyZWQgbWVtb3J5DQo+IA0KPiBIaSBQ
ZW5ueSwNCj4gDQo+IE9uIDI5LzA2LzIwMjIgMDk6MzksIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
Pj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG1lbS0+bnJfYmFua3M7IGkrKyApDQo+ID4+PiArICAg
IHsNCj4gPj4+ICsgICAgICAgIC8qDQo+ID4+PiArICAgICAgICAgKiBBIHN0YXRpYyBzaGFyZWQg
bWVtb3J5IHJlZ2lvbiBjb3VsZCBiZSBzaGFyZWQgYmV0d2VlbiBtdWx0aXBsZQ0KPiA+Pj4gKyAg
ICAgICAgICogZG9tYWlucy4NCj4gPj4+ICsgICAgICAgICAqLw0KPiA+Pj4gKyAgICAgICAgaWYg
KCBwYWRkciA9PSBtZW0tPmJhbmtbaV0uc3RhcnQgJiYgc2l6ZSA9PSBtZW0tPmJhbmtbaV0uc2l6
ZSApDQo+ID4+PiArICAgICAgICAgICAgYnJlYWs7DQo+ID4NCj4gPiBNYXliZSBJIG5lZWQgdG8g
YWRkIGEgY2hlY2sgb24gc2htLWlkOg0KPiA+ICINCj4gPiAgICAgICAgICAvKg0KPiA+ICAgICAg
ICAgICAqIEEgc3RhdGljIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGNvdWxkIGJlIHNoYXJlZCBiZXR3
ZWVuIG11bHRpcGxlDQo+ID4gICAgICAgICAgICogZG9tYWlucy4NCj4gPiAgICAgICAgICAgKi8N
Cj4gPiAgICAgICAgICBpZiAoIHN0cmNtcChzaG1faWQsIG1lbS0+YmFua1tpXS5zaG1faWQpID09
IDAgKQ0KPiA+ICAgICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgaWYgKCBwYWRkciA9PSBtZW0t
PmJhbmtbaV0uc3RhcnQgJiYgc2l6ZSA9PSBtZW0tPmJhbmtbaV0uc2l6ZSApDQo+ID4gICAgICAg
ICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICAgICAgICAgZWxzZQ0KPiA+ICAgICAgICAgICAg
ICB7DQo+ID4gICAgICAgICAgICAgICAgICBwcmludGsoIldhcm5pbmc6IHhlbixzaG0taWQgJXMg
ZG9lcyBub3QgbWF0Y2ggZm9yIGFsbCB0aGUgbm9kZXMNCj4gdXNpbmcgdGhlIHNhbWUgcmVnaW9u
LlxuIiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzaG1faWQpOw0KPiA+ICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gICAgICAgICAgICAgIH0NCj4gPiAgICAgICAg
ICB9DQo+ID4gIg0KPiA+IFdkeXTvvJ8NCj4gDQo+IEFGQUlDVCwgdGhpcyB3b3VsZCBhbGxvdyB0
byByZWdpb24gdG8gb3ZlcmxhcCBpZiB0aGV5IGhhdmUgZGlmZmVyZW50IHNobSBJRC4gSQ0KPiBh
bSBub3QgZW50aXJlbHkgc3VyZSB0aGUgcmVzdCBvZiB5b3VyIGNvZGUgd291bGQgd29yayBwcm9w
ZXJseSBpbiB0aGlzIGNhc2UNCj4gKHdoYXQgaWYgdGhlIG93bmVyIGlzIGRpZmZlcmVudCkuDQo+
IA0KPiBTbyBJIHRoaW5rIHdlIG5lZWQgdGhlIGZvbGxvd2luZyBjaGVja3M6DQo+ICAgIDEpIFRo
ZSBzaG0gSUQgbWF0Y2hlcyAqYW5kKiB0aGUgcmVnaW9uIGV4YWN0bHkgbWF0Y2gNCj4gICAgMikg
VGhlIHNobSBJRCBkb2Vzbid0IG1hdGNoIGFuZCB0aGUgcmVnaW9uIGRvZXNuJ3Qgb3ZlcmxhcCB3
aXRoIGFuDQo+IGV4aXN0aW5nIG9uZQ0KPiANCg0KVW5kZXJzdG9vZCwgdHJ1ZSwgdGhlIG92ZXJs
YXAgc2hhbGwgYWxzbyBiZSBjaGVja2VkLg0KIg0KQEAgLTQ1MSw2ICs0NTMsMzEgQEAgc3RhdGlj
IGludCBfX2luaXQgcHJvY2Vzc19zaG1fbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLA0K
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCiAgICAgICAgICAgICB9DQogICAgICAg
ICB9DQorICAgICAgICBlbHNlDQorICAgICAgICB7DQorICAgICAgICAgICAgcGFkZHJfdCBlbmQg
PSBwYWRkciArIHNpemU7DQorICAgICAgICAgICAgcGFkZHJfdCBiYW5rX2VuZCA9IG1lbS0+YmFu
a1tpXS5zdGFydCArIG1lbS0+YmFua1tpXS5zaXplOw0KKw0KKyAgICAgICAgICAgIGlmICggKHBh
ZGRyIDwgbWVtLT5iYW5rW2ldLnN0YXJ0ICYmIGVuZCA8PSBtZW0tPmJhbmtbaV0uc3RhcnQpIHx8
DQorICAgICAgICAgICAgICAgICAocGFkZHIgPj0gYmFua19lbmQgJiYgZW5kID4gYmFua19lbmQp
ICkNCisgICAgICAgICAgICB7DQorICAgICAgICAgICAgICAgIGlmICggc3RybmNtcChzaG1faWQs
IG1lbS0+YmFua1tpXS5zaG1faWQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNQVhf
U0hNX0lEX0xFTkdUSCkgIT0gMCApDQorICAgICAgICAgICAgICAgICAgICBicmVhazsNCisgICAg
ICAgICAgICAgICAgZWxzZQ0KKyAgICAgICAgICAgICAgICB7DQorICAgICAgICAgICAgICAgICAg
ICBwcmludGsoImZkdDogZGlmZmVyZW50IHNoYXJlZCBtZW1vcnkgcmVnaW9uIGNvdWxkIG5vdCBz
aGFyZSB0aGUgc2FtZSBzaG0gSUQgJXNcbiIsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2htX2lkKTsNCisgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KKyAgICAgICAg
ICAgICAgICB9DQorICAgICAgICAgICAgfQ0KKyAgICAgICAgICAgIGVsc2UNCisgICAgICAgICAg
ICB7DQorICAgICAgICAgICAgICAgIHByaW50aygiZmR0OiBzaGFyZWQgbWVtb3J5IHJlZ2lvbiBv
dmVybGFwIHdpdGggYW4gZXhpc3RpbmcgZW50cnkgJSMiUFJJcGFkZHIiIC0gJSMiUFJJcGFkZHIi
XG4iLA0KKyAgICAgICAgICAgICAgICAgICAgICAgIG1lbS0+YmFua1tpXS5zdGFydCwgYmFua19l
bmQpOw0KKyAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCisgICAgICAgICAgICB9DQor
ICAgICAgICB9DQogICAgIH0NCg0KICAgICBpZiAoIGkgPT0gbWVtLT5ucl9iYW5rcyApDQoiDQoN
Cj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

