Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156C5564E90
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 09:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359865.589119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8GNy-0008O7-CR; Mon, 04 Jul 2022 07:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359865.589119; Mon, 04 Jul 2022 07:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8GNy-0008Lr-7Y; Mon, 04 Jul 2022 07:20:46 +0000
Received: by outflank-mailman (input) for mailman id 359865;
 Mon, 04 Jul 2022 07:20:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mey7=XJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o8GNw-0008Ll-QU
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 07:20:45 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00080.outbound.protection.outlook.com [40.107.0.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfedac6b-fb69-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 09:20:42 +0200 (CEST)
Received: from DB6PR0201CA0006.eurprd02.prod.outlook.com (2603:10a6:4:3f::16)
 by VI1PR08MB3246.eurprd08.prod.outlook.com (2603:10a6:803:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 07:20:39 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::c2) by DB6PR0201CA0006.outlook.office365.com
 (2603:10a6:4:3f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Mon, 4 Jul 2022 07:20:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 07:20:38 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Mon, 04 Jul 2022 07:20:38 +0000
Received: from a547f1302c5b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 894C64A3-D7CD-4181-B131-2F7E374EC1AF.1; 
 Mon, 04 Jul 2022 07:20:28 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a547f1302c5b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 07:20:28 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM6PR08MB3430.eurprd08.prod.outlook.com (2603:10a6:20b:43::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Mon, 4 Jul
 2022 07:20:25 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%6]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 07:20:24 +0000
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
X-Inumbo-ID: cfedac6b-fb69-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EZqQVAp9pvDTva3kyDU0xWKJ3ZutlgJv11lisuMtFptt0mklNXjM+aar/0TJobmYnY93E3RlHoykyR52XvyNoZASuH30f6X27q5ZHSBDi0YaBQish4ietkddM1a3nW2r6ZOUDtqautKkdso8So2HHbgKa/0zIJPFwUJiiF0icjJ8ho36MxyigkjBr+30ImOM1/ZdO2sZOmJJ/DmKgaUgV3GdircI19yef28s1Fp0EMM88kZdVEFPoRnLYoIfmsuX5EfZ263lUkh9c4pfQHaCOxmGnb5LFjgdb9wFoNLW1pO6+H2mM31GfZoVqySvzUlrgOT1Dr7LCu56CPTSxm+VfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTKVQx3g0DNIMIBckUhZBcEWumL0Uzie8AvhI3YjEE4=;
 b=hDg3yqwLMH2MAn5g3B3SUXeW/BQXb1V+Tt6UcorwLgUafUASYr9f2RR5lGthqf+pd45VlRXVA2T9mFXH6tbpX+lt6d/JrWSIC6BkQJXqQ9PPh96piDP/0N2SRYzNFi62WFBnn8uBwNJBNWwsrdt6GKyTdPszuy5AxfGWaQd7fOnhOFTHVl204bU8V29Ifc+1fqCShqdTtDAE/QnWKzR/8d5mA/5yUKhm6ip0V/hEgXwPcpjrlBjxkQNGAwPQvto5tu7QSnQUtoo0rkWUpwznan1TFpB+hq1+0PngJfleJdHXjYb5DThlFLy7kigFvYuRIkzdEO+j8hFuXYVQceS/sw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTKVQx3g0DNIMIBckUhZBcEWumL0Uzie8AvhI3YjEE4=;
 b=LOx1Zc+uWqkSJvjJZFK+m38LYuzBr8jXq/8IgJsFRbgZf+8U+hmxCYseGDIVogWY3rkvxlUPTUau/xF1s33ONeE/xgPpQoBFfGQ3/jfwOl/bx0nnsjLUK+zfNVex0tNYm6n2zyQGmPKbwKAK9J7HmnBH+wkyGZru35dm070gQDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT/haiCQ+VGNCp/oi03Zj/1KqM/2ZJwR1hE6i0rIw23q51WUevZgQthHRo62oc2qfZ5iEThyjcOPdcpKDFDw+SAuiL/rKfsphiuVGvCl9CFlw2MFRI1ZxNMZgIRwp76knx3iogEpBLD0nyCRZ4yEoK4jROtcGy9O2MczfI3ehfNIJbw95ehczlzgE12eioe8LLCJSKRDJIrhu1sv/zqc4/vtpHkvM+sac19Kefk2Bnr0zBp3U3jPPWwr4UBPnCsCFVUBfo+wzAjkpTWjloFwKM10GZhNK5DeOijcuhMxVAfhgIkUpC8SDzelcZE+3LQf760bQ4p5cLLTZF0y1lh/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTKVQx3g0DNIMIBckUhZBcEWumL0Uzie8AvhI3YjEE4=;
 b=WNphd5Knq2JC8uVEQVdySgRx0TMZUWRpyY0MipgWu+Dp7dfu/lKE9UjrfeX9kYCPR/tBhWQP7FphRIx1a+SdFMO6pJ9QGaENfftaSI48yYihUV58Qhi5ByiqmPSCP1cSOxZMWr7qp6gaqlc2ZMo54zFBQtglLYGqKGV8DbmppePIjTBb+PWUMu05TCt7Ycro/l9ZInjKUtuflRbDg8gLrAQXTHsYZAnDGA6wS2GeNnrtWjiuv/Ldhsvyr2ex+aYcdZiX40br+n68EShAqOv0GgcH1CU/pzr9OvDy/6X2GUmW2xjXk+jkS9DVvfN5kIAAx23+1F13rc3SnnT74b8zKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTKVQx3g0DNIMIBckUhZBcEWumL0Uzie8AvhI3YjEE4=;
 b=LOx1Zc+uWqkSJvjJZFK+m38LYuzBr8jXq/8IgJsFRbgZf+8U+hmxCYseGDIVogWY3rkvxlUPTUau/xF1s33ONeE/xgPpQoBFfGQ3/jfwOl/bx0nnsjLUK+zfNVex0tNYm6n2zyQGmPKbwKAK9J7HmnBH+wkyGZru35dm070gQDs=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: RE: [PATCH v5 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
Thread-Topic: [PATCH v5 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
Thread-Index: AQHYhGQ84mRcoOoQ8UiRh2nj8rBdHq1e5e0AgAcJLcCAAE/NgIAHooTQ
Date: Mon, 4 Jul 2022 07:20:24 +0000
Message-ID:
 <DU2PR08MB7325AF32FF119BCDB5890C58F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-3-Penny.Zheng@arm.com>
 <3b7b32cb-df48-e458-e8a9-f17e86f39c9a@xen.org>
 <DU2PR08MB7325A7C7C50807D7FF6AE280F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <5a49381c-c69d-88dc-1bba-783241dbfe23@xen.org>
In-Reply-To: <5a49381c-c69d-88dc-1bba-783241dbfe23@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 10F1047C52BACB409A050E37111768D2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fc6879df-8abd-43de-094a-08da5d8db1e2
x-ms-traffictypediagnostic:
	AM6PR08MB3430:EE_|DBAEUR03FT005:EE_|VI1PR08MB3246:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7HYuJp09FnI5yJxMJKUFwrpOWEiF4eZYG7paPFEVO30lnMNnDoUZ5zc496su0GU2Y5t+pxq5MaQuhozqv4jtSwO0lXWAaxHODFjjrhQ8yMgxCgqrYshvhWrtWMlXvd27hsYzYz/g/qTxOi5z4u0Pg3hp4pxaaACICRbE6E+KUBCZ1/FGS9GSXyp7WuL9Pa6Psr7QgU5lE80P0dT2KjLDayjjOBUFVLoC7w28Y0L6QFX5x6iebDnur+aG5IIIzRdtbAM7JrGdOctF9s+mLlCwg84xO8nGoi2XnaIbcRF0PXp6hfJH3F/yTPJWiU2PJy/WV21L1Vxp4UxHLbcTaIkOKz0F8Eo/G62S8fhhEzy6j76A7klOWSgVKm9F3HX4f0aZJ2JCDYWcBxhgcUW2PoNXq9hy94kfPHSHZMY/ORHz9XLruc2Fk6+Vyk9PIEfLt1WF3Oa8txwRE2ACsTz24TLAvak+Qpv0SCCpeJkp82e7BPyT7FBVDhXMNOxmLtsHxVFkbmeuYa8JjdopVuouO53hcJ2lZZrbWmArWSokRyPCSb9obaNEb9VRv2ucNMXp7iPiM31LOkd8Brn9zkd8QuKJE18RZPXu4ENkb04kUJ4Ko1gwU6zwDAwuEMjEqIHygOry6JPfAVBbyUtxKuXW02v0eJcOkRXifxFJR4mEehKlHBF82Mc39b+k154B8pL03mJBVvMWwF0J/NgBv7zXycjWsLA6lXwiivauQVwx+DgGDdsxFj9RZP1rAbJYNUKoQT088UF6zbANhkGOCWL8hW2SJvdViilgyWTIkb7yuY9P0cdAXtiruyUTK8BwaiqW4OnV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(8936002)(52536014)(5660300002)(26005)(478600001)(9686003)(55016003)(53546011)(186003)(86362001)(41300700001)(2906002)(6506007)(7696005)(33656002)(83380400001)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(8676002)(64756008)(4326008)(38100700002)(71200400001)(110136005)(38070700005)(54906003)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3430
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ecef96e4-943e-4bc7-ab29-08da5d8da9e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KyfTI+W8puGqS/l3tTe+fbhdkL5j3CfPYWLkvr91qfW2xbXyDoLq5FkUjANC+qgbCdDTMnJ8xD0T2vi7kDcphsVQYzWXp14+fn185l/K6rEmzYvXGae401j2JYWrhDraRNjRl18sQ3qZb0RltvbfK6O+mqdhCcOjHAXLEpV47Thg/DAJz12oP1LdpLgQDqV9ni08B4ZYaTuxMHdYtqQNvzxT3gaQT+4X4B6e9SiJtHeurj4FlIfqYk+LVw1jhgIUzaeYHjkwPBJ2hzqj5+ZCo3TLlyGUg8ElZ8ei1WFl5OTFpvSdQPEElM8KG3iUM21Kw5l+VPzudZvCVrpDMbzciZSYR1A10K/t/n/YkxytR+id3ImIU7YDwgsh+fGd24I0fKlhKD7aGxSmQZ5zeIgq32NequOpFWIOlXNu5AIH7GK1tBBYuKo9r0XWTdQt/+O7avEVM4qta7iuNIZXyB+ZbQodjNehA4ZFRv+8IN3thf+Qjcdo0CSnVDJSrBic2SvWW5x9qJ7VKdBJGv7MNXtEtOyxMTgk/jiFaAFoYcEQdkMmRIjJsPITMtHiRznLQkDHo3jj2AeOurOmVzwKB/y7HxdMbmJPqpDJbixQO8tpd6Q+8sR180334Kc1pEpYZY6g69Gv9/LK337gjmVq5h6bDr4i9+5E57iHs+OQszliKplGqqZEjIazDWndWncJVFg5BO1+yukE3mrsIRPfmbS6cZQTCkwFubhDC8IqdElEF5PjUG9PMB1+JPexlK1VAyDBPIJ92l5iUOZjga2aFPDrK+JzKcpCdrjlEmnUFOmx7IY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(346002)(376002)(396003)(46966006)(36840700001)(30864003)(52536014)(9686003)(7696005)(5660300002)(53546011)(8936002)(6506007)(26005)(86362001)(54906003)(8676002)(4326008)(70586007)(110136005)(70206006)(316002)(41300700001)(81166007)(356005)(478600001)(82740400003)(36860700001)(47076005)(336012)(82310400005)(186003)(55016003)(40480700001)(2906002)(33656002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 07:20:38.2342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6879df-8abd-43de-094a-08da5d8db1e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3246

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjksIDIwMjIgNjozNSBQTQ0KPiBU
bzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBT
dGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15
cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47DQo+IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi84XSB4ZW4vYXJtOiBhbGxvY2F0ZSBzdGF0aWMgc2hhcmVk
IG1lbW9yeSB0byB0aGUNCj4gZGVmYXVsdCBvd25lciBkb21faW8NCj4gDQo+IA0KPiANCj4gT24g
MjkvMDYvMjAyMiAwODoxMywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuDQo+IA0K
PiBIaSBQZW5ueSwNCj4gDQoNCkhpIEp1bGllbg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+
IFNlbnQ6IFNhdHVyZGF5LCBKdW5lIDI1LCAyMDIyIDI6MjIgQU0NCj4gPj4gVG86IFBlbm55IFpo
ZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiA+PiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJl
bGxpbmkNCj4gPj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+
ID4+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA+PiA8
Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+ID4+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcA0KPiA+PiA8Z2VvcmdlLmR1bmxhcEBj
aXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdQ0KPiA+
PiA8d2xAeGVuLm9yZz4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzhdIHhlbi9hcm06
IGFsbG9jYXRlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IHRvDQo+ID4+IHRoZSBkZWZhdWx0IG93bmVy
IGRvbV9pbw0KPiA+Pg0KPiA+PiBIaSBQZW5ueSwNCj4gPj4NCj4gPj4gT24gMjAvMDYvMjAyMiAw
NjoxMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiBGcm9tOiBQZW5ueSBaaGVuZyA8cGVubnku
emhlbmdAYXJtLmNvbT4NCj4gPj4+DQo+ID4+PiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIHByb2Nl
c3Nfc2htIHRvIGNvcGUgd2l0aCBzdGF0aWMgc2hhcmVkIG1lbW9yeQ0KPiA+Pj4gaW4gZG9tYWlu
IGNvbnN0cnVjdGlvbi4NCj4gPj4+DQo+ID4+PiBET01JRF9JTyB3aWxsIGJlIHRoZSBkZWZhdWx0
IG93bmVyIG9mIG1lbW9yeSBwcmUtc2hhcmVkIGFtb25nDQo+ID4+IG11bHRpcGxlDQo+ID4+PiBk
b21haW5zIGF0IGJvb3QgdGltZSwgd2hlbiBubyBleHBsaWNpdCBvd25lciBpcyBzcGVjaWZpZWQu
DQo+ID4+DQo+ID4+IFRoZSBkb2N1bWVudCBpbiBwYXRjaCAjMSBzdWdnZXN0IHRoZSBwYWdlIHdp
bGwgYmUgc2hhcmVkIHdpdGgNCj4gZG9tX3NoYXJlZC4NCj4gPj4gQnV0IGhlcmUgeW91IHNheSAi
RE9NSURfSU8iLg0KPiA+Pg0KPiA+PiBXaGljaCBvbmUgaXMgY29ycmVjdD8NCj4gPj4NCj4gPg0K
PiA+IEnigJlsbCBmaXggdGhlIGRvY3VtZW50YXRpb24sIERPTV9JTyBpcyB0aGUgbGFzdCBjYWxs
Lg0KPiA+DQo+ID4+Pg0KPiA+Pj4gVGhpcyBjb21taXQgb25seSBjb25zaWRlcnMgYWxsb2NhdGlu
ZyBzdGF0aWMgc2hhcmVkIG1lbW9yeSB0byBkb21faW8NCj4gPj4+IHdoZW4gb3duZXIgZG9tYWlu
IGlzIG5vdCBleHBsaWNpdGx5IGRlZmluZWQgaW4gZGV2aWNlIHRyZWUsIGFsbCB0aGUNCj4gPj4+
IGxlZnQsIGluY2x1ZGluZyB0aGUgImJvcnJvd2VyIiBjb2RlIHBhdGgsIHRoZSAiZXhwbGljaXQg
b3duZXIiIGNvZGUNCj4gPj4+IHBhdGgsIHNoYWxsIGJlIGludHJvZHVjZWQgbGF0ZXIgaW4gdGhl
IGZvbGxvd2luZyBwYXRjaGVzLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpo
ZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+Pj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPj4+IC0tLQ0KPiA+Pj4gdjUgY2hh
bmdlOg0KPiA+Pj4gLSByZWZpbmUgaW4tY29kZSBjb21tZW50DQo+ID4+PiAtLS0NCj4gPj4+IHY0
IGNoYW5nZToNCj4gPj4+IC0gbm8gY2hhbmdlcw0KPiA+Pj4gLS0tDQo+ID4+PiB2MyBjaGFuZ2U6
DQo+ID4+PiAtIHJlZmluZSBpbi1jb2RlIGNvbW1lbnQNCj4gPj4+IC0tLQ0KPiA+Pj4gdjIgY2hh
bmdlOg0KPiA+Pj4gLSBpbnN0ZWFkIG9mIGludHJvZHVjaW5nIGEgbmV3IHN5c3RlbSBkb21haW4s
IHJldXNlIHRoZSBleGlzdGluZw0KPiA+Pj4gZG9tX2lvDQo+ID4+PiAtIG1ha2UgZG9tX2lvIGEg
bm9uLWF1dG8tdHJhbnNsYXRlZCBkb21haW4sIHRoZW4gbm8gbmVlZCB0byBjcmVhdGUNCj4gPj4+
IFAyTSBmb3IgaXQNCj4gPj4+IC0gY2hhbmdlIGRvbV9pbyBkZWZpbml0aW9uIGFuZCBtYWtlIGl0
IHdpZGVyIHRvIHN1cHBvcnQgc3RhdGljIHNobQ0KPiA+Pj4gaGVyZSB0b28NCj4gPj4+IC0gaW50
cm9kdWNlIGlzX3NobV9hbGxvY2F0ZWRfdG9fZG9taW8gdG8gY2hlY2sgd2hldGhlciBzdGF0aWMg
c2htIGlzDQo+ID4+PiBhbGxvY2F0ZWQgeWV0LCBpbnN0ZWFkIG9mIHVzaW5nIHNobV9tYXNrIGJp
dG1hcA0KPiA+Pj4gLSBhZGQgaW4tY29kZSBjb21tZW50DQo+ID4+PiAtLS0NCj4gPj4+ICAgIHhl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDEzMg0KPiA+PiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0NCj4gPj4+ICAgIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICB8
ICAgMyArDQo+ID4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDEzNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYw0KPiA+Pj4gYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgaW5kZXggN2RkZDE2
YzI2ZC4uOTFhNWFjZTg1MSAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYw0KPiA+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4+PiBA
QCAtNTI3LDYgKzUyNywxMCBAQCBzdGF0aWMgYm9vbCBfX2luaXQNCj4gPj4gYXBwZW5kX3N0YXRp
Y19tZW1vcnlfdG9fYmFuayhzdHJ1Y3QgZG9tYWluICpkLA0KPiA+Pj4gICAgICAgIHJldHVybiB0
cnVlOw0KPiA+Pj4gICAgfQ0KPiA+Pj4NCj4gPj4+ICsvKg0KPiA+Pj4gKyAqIElmIGNlbGwgaXMg
TlVMTCwgcGJhc2UgYW5kIHBzaXplIHNob3VsZCBob2xkIHZhbGlkIHZhbHVlcy4NCj4gPj4+ICsg
KiBPdGhlcndpc2UsIGNlbGwgd2lsbCBiZSBwb3B1bGF0ZWQgdG9nZXRoZXIgd2l0aCBwYmFzZSBh
bmQgcHNpemUuDQo+ID4+PiArICovDQo+ID4+PiAgICBzdGF0aWMgbWZuX3QgX19pbml0IGFjcXVp
cmVfc3RhdGljX21lbW9yeV9iYW5rKHN0cnVjdCBkb21haW4gKmQsDQo+ID4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IF9fYmUzMiAqKmNl
bGwsDQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHUzMiBhZGRyX2NlbGxzLA0KPiA+Pj4gdTMyIHNpemVfY2VsbHMsIEBAIC01MzUsNyArNTM5
LDggQEAgc3RhdGljIG1mbl90IF9faW5pdA0KPiA+PiBhY3F1aXJlX3N0YXRpY19tZW1vcnlfYmFu
ayhzdHJ1Y3QgZG9tYWluICpkLA0KPiA+Pj4gICAgICAgIG1mbl90IHNtZm47DQo+ID4+PiAgICAg
ICAgaW50IHJlczsNCj4gPj4+DQo+ID4+PiAtICAgIGRldmljZV90cmVlX2dldF9yZWcoY2VsbCwg
YWRkcl9jZWxscywgc2l6ZV9jZWxscywgcGJhc2UsIHBzaXplKTsNCj4gPj4+ICsgICAgaWYgKCBj
ZWxsICkNCj4gPj4+ICsgICAgICAgIGRldmljZV90cmVlX2dldF9yZWcoY2VsbCwgYWRkcl9jZWxs
cywgc2l6ZV9jZWxscywgcGJhc2UsDQo+ID4+PiArIHBzaXplKTsNCj4gPj4NCj4gPj4gSSB0aGlu
ayB0aGlzIGlzIGEgYml0IG9mIGEgaGFjay4gVG8gbWUgaXQgc291bmRzIGxpa2UgdGhpcyBzaG91
bGQgYmUNCj4gPj4gbW92ZWQgb3V0IHRvIGEgc2VwYXJhdGUgaGVscGVyLiBUaGlzIHdpbGwgYWxz
byBtYWtlIHRoZSBpbnRlcmZhY2Ugb2YNCj4gPj4gYWNxdWlyZV9zaGFyZWRfbWVtb3J5X2Jhbmso
KSBsZXNzIHF1ZXN0aW9uYWJsZSAoc2VlIGJlbG93KS4NCj4gPj4NCj4gPg0KPiA+IE9rLCAgSSds
bCB0cnkgdG8gbm90IHJldXNlIGFjcXVpcmVfc3RhdGljX21lbW9yeV9iYW5rIGluDQo+ID4gYWNx
dWlyZV9zaGFyZWRfbWVtb3J5X2JhbmsuDQo+IA0KPiBJIGFtIE9LIHdpdGggdGhhdCBzbyBsb25n
IGl0IGRvZXNuJ3QgaW52b2x2ZSB0b28gbXVjaCBkdXBsaWNhdGlvbi4NCj4gDQo+ID4+PiAgICAg
ICAgQVNTRVJUKElTX0FMSUdORUQoKnBiYXNlLCBQQUdFX1NJWkUpICYmIElTX0FMSUdORUQoKnBz
aXplLA0KPiA+Pj4gUEFHRV9TSVpFKSk7DQo+ID4+DQo+ID4+IEluIHRoZSBjb250ZXh0IG9mIHlv
dXIgc2VyaWVzLCB3aG8gaXMgY2hlY2tpbmcgdGhhdCBib3RoIHBzaXplIGFuZA0KPiA+PiBwYmFz
ZSBhcmUgc3VpdGFibHkgYWxpZ25lZD8NCj4gPj4NCj4gPg0KPiA+IEFjdHVhbGx5LCB0aGUgd2hv
bGUgcGFyc2luZyBwcm9jZXNzIGlzIHJlZHVuZGFudCBmb3IgdGhlIHN0YXRpYyBzaGFyZWQNCj4g
bWVtb3J5Lg0KPiA+IEkndmUgYWxyZWFkeSBwYXJzZWQgaXQgYW5kIGNoZWNrZWQgaXQgYmVmb3Jl
IGluIHByb2Nlc3Nfc2htLg0KPiANCj4gSSBsb29rZWQgYXQgcHJvY2Vzc19zaG0oKSBhbmQgY291
bGRuJ3QgZmluZCBhbnkgY29kZSB0aGF0IHdvdWxkIGNoZWNrIHBiYXNlDQo+IGFuZCBwc2l6ZSBh
cmUgc3VpdGFibGUgYWxpZ25lZCAoQVNTRVJUKCkgZG9lc24ndCBjb3VudCkuDQo+IA0KPiA+DQo+
ID4+PiArICAgIHJldHVybiB0cnVlOw0KPiA+Pj4gK30NCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMg
bWZuX3QgX19pbml0IGFjcXVpcmVfc2hhcmVkX21lbW9yeV9iYW5rKHN0cnVjdCBkb21haW4gKmQs
DQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
MzIgYWRkcl9jZWxscywgdTMyIHNpemVfY2VsbHMsDQo+ID4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90ICpwYmFzZSwNCj4gPj4+ICtwYWRk
cl90ICpwc2l6ZSkNCj4gPj4NCj4gPj4gVGhlcmUgaXMgc29tZXRoaW5nIHRoYXQgZG9lc24ndCBh
ZGQtdXAgaW4gdGhpcyBpbnRlcmZhY2UuIFRoZSB1c2Ugb2YNCj4gPj4gcG9pbnRlciBpbXBsaWVz
IHRoYXQgcGJhc2UgYW5kIHBzaXplIG1heSBiZSBtb2RpZmllZCBieSB0aGUgZnVuY3Rpb24uIFNv
Li4uDQo+ID4+DQo+ID4NCj4gPiBKdXN0IGxpa2UgeW91IHBvaW50cyBvdXQgYmVmb3JlLCBpdCdz
IGEgYml0IGhhY2t5IHRvIHVzZQ0KPiA+IGFjcXVpcmVfc3RhdGljX21lbW9yeV9iYW5rLCBhbmQg
dGhlIHBvaW50ZXIgdXNlZCBoZXJlIGlzIGFsc28gZHVlIHRvDQo+ID4gaXQuIEludGVybmFsIHBh
cnNpbmcgcHJvY2VzcyBvZiBhY3F1aXJlX3N0YXRpY19tZW1vcnlfYmFuayBuZWVkcyBwb2ludGVy
DQo+IHRvIGRlbGl2ZXIgdGhlIHJlc3VsdC4NCj4gPg0KPiA+IEnigJlsbCByZXdyaXRlIGFjcXVp
cmVfc2hhcmVkX21lbW9yeSwgYW5kIGl0IHdpbGwgYmUgbGlrZToNCj4gPiAiDQo+ID4gc3RhdGlj
IG1mbl90IF9faW5pdCBhY3F1aXJlX3NoYXJlZF9tZW1vcnlfYmFuayhzdHJ1Y3QgZG9tYWluICpk
LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
ZGRyX3QgcGJhc2UsIHBhZGRyX3QNCj4gPiBwc2l6ZSkgew0KPiA+ICAgICAgbWZuX3Qgc21mbjsN
Cj4gPiAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGZuczsNCj4gPiAgICAgIGludCByZXM7DQo+ID4N
Cj4gPiAgICAgIC8qDQo+ID4gICAgICAgKiBQYWdlcyBvZiBzdGF0aWNhbGx5IHNoYXJlZCBtZW1v
cnkgc2hhbGwgYmUgaW5jbHVkZWQNCj4gPiAgICAgICAqIGluIGRvbWFpbl90b3RfcGFnZXMoKS4N
Cj4gPiAgICAgICAqLw0KPiA+ICAgICAgbnJfcGZucyA9IFBGTl9ET1dOKHBzaXplKTsNCj4gPiAg
ICAgIGlmICggZC0+bWF4X3BhZ2UgKyBucl9wZm5zID4gVUlOVF9NQVggKQ0KPiANCj4gT24gQXJt
MzIsIHRoaXMgY2hlY2sgd291bGQgYWx3YXlzIGJlIHRydWUgYSAzMi1iaXQgdW5zaWduZWQgdmFs
dWUgaXMgYWx3YXlzDQo+IGJlbG93IFVJTlRfTUFYLiBPbiBhcm02NCwgeW91IG1pZ2h0IGdldCBh
d2F5IGJlY2F1c2UgbnJfcGZucyBpcw0KPiB1bnNpZ25lZCBsb25nIChzbyBJIHRoaW5rIHRoZSB0
eXBlIHByb21vdGlvbiB3b3JrcykuIEJ1dCB0aGlzIGlzIGZyYWdpbGUuDQo+IA0KPiBJIHdvdWxk
IHN1Z2dlc3QgdG8gdXNlIHRoZSBmb2xsb3dpbmcgY2hlY2s6DQo+IA0KPiAoVUlOVF9NQVggLSBk
LT5tYXhfcGFnZSkgPCBucl9wZm5zDQo+IA0KPiA+ICAgICAgew0KPiA+ICAgICAgICAgIHByaW50
ayhYRU5MT0dfRVJSICIlcGQ6IE92ZXItYWxsb2NhdGlvbiBmb3IgZC0+bWF4X3BhZ2VzOiAlbHUu
XG4iLA0KPiA+ICAgICAgICAgICAgICAgICBkLCBwc2l6ZSk7DQo+ID4gICAgICAgICAgcmV0dXJu
IElOVkFMSURfTUZOOw0KPiA+ICAgICAgfQ0KPiA+ICAgICAgZC0+bWF4X3BhZ2VzICs9IG5yX3Bm
bnM7DQo+ID4NCj4gPiAgICAgIHNtZm4gPSBtYWRkcl90b19tZm4ocGJhc2UpOw0KPiA+ICAgICAg
cmVzID0gYWNxdWlyZV9kb21zdGF0aWNfcGFnZXMoZCwgc21mbiwgbnJfcGZucywgMCk7DQo+ID4g
ICAgICBpZiAoIHJlcyApDQo+ID4gICAgICB7DQo+ID4gICAgICAgICAgcHJpbnRrKFhFTkxPR19F
UlINCj4gPiAgICAgICAgICAgICAgICAgIiVwZDogZmFpbGVkIHRvIGFjcXVpcmUgc3RhdGljIG1l
bW9yeTogJWQuXG4iLCBkLCByZXMpOw0KPiA+ICAgICAgICAgIHJldHVybiBJTlZBTElEX01GTjsN
Cj4gPiAgICAgIH0NCj4gPg0KPiA+ICAgICAgcmV0dXJuIHNtZm4NCj4gPiB9DQo+ID4gIg0KPiA+
DQo+ID4+PiArew0KPiA+Pj4gKyAgICAvKg0KPiA+Pj4gKyAgICAgKiBQYWdlcyBvZiBzdGF0aWNh
bGx5IHNoYXJlZCBtZW1vcnkgc2hhbGwgYmUgaW5jbHVkZWQNCj4gPj4+ICsgICAgICogaW4gZG9t
YWluX3RvdF9wYWdlcygpLg0KPiA+Pj4gKyAgICAgKi8NCj4gPj4+ICsgICAgZC0+bWF4X3BhZ2Vz
ICs9IFBGTl9ET1dOKCpwc2l6ZSk7DQo+ID4+DQo+ID4+IC4uLiBpdCBzb3VuZHMgYSBiaXQgc3Ry
YW5nZSB0byB1c2UgcHNpemUgaGVyZS4gSWYgcHNpemUsIGNhbid0IGJlDQo+ID4+IG1vZGlmaWVk
IHRoYW4gaXQgc2hvdWxkIHByb2JhYmx5IG5vdCBiZSBhIHBvaW50ZXIuDQo+ID4+DQo+ID4+IEFs
c28sIHdoZXJlIGRvIHlvdSBjaGVjayB0aGF0IGQtPm1heF9wYWdlcyB3aWxsIG5vdCBvdmVyZmxv
dz8NCj4gPj4NCj4gPg0KPiA+IEknbGwgY2hlY2sgdGhlIG92ZXJmbG93IGFzIGZvbGxvd3M6DQo+
IA0KPiBTZWUgYWJvdmUgYWJvdXQgdGhlIGNoZWNrLg0KPiANCj4gPiAiDQo+ID4gICAgICBucl9w
Zm5zID0gUEZOX0RPV04ocHNpemUpOw0KPiA+ICAgICAgaWYgKCBkLT5tYXhfcGFnZSArIG5yX3Bm
bnMgPiBVSU5UX01BWCApDQo+ID4gICAgICB7DQo+ID4gICAgICAgICAgcHJpbnRrKFhFTkxPR19F
UlIgIiVwZDogT3Zlci1hbGxvY2F0aW9uIGZvciBkLT5tYXhfcGFnZXM6ICVsdS5cbiIsDQo+ID4g
ICAgICAgICAgICAgICAgIGQsIHBzaXplKTsNCj4gPiAgICAgICAgICByZXR1cm4gSU5WQUxJRF9N
Rk47DQo+ID4gICAgICB9DQo+ID4gICAgICBkLT5tYXhfcGFnZXMgKz0gbnJfcGZuczsNCj4gPiAi
DQo+ID4NCj4gPj4+ICsNCj4gPj4+ICsgICAgcmV0dXJuIGFjcXVpcmVfc3RhdGljX21lbW9yeV9i
YW5rKGQsIE5VTEwsIGFkZHJfY2VsbHMsIHNpemVfY2VsbHMsDQo+ID4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYmFzZSwgcHNpemUpOw0KPiA+Pj4gKw0KPiA+Pj4g
K30NCj4gPj4+ICsNCj4gPj4+ICsvKg0KPiA+Pj4gKyAqIEZ1bmMgYWxsb2NhdGVfc2hhcmVkX21l
bW9yeSBpcyBzdXBwb3NlZCB0byBiZSBvbmx5IGNhbGxlZA0KPiA+Pg0KPiA+PiBJIGFtIGEgYml0
IGNvbmNlcm5lZCB3aXRoIHRoZSB3b3JkICJzdXBwb3NlZCIuIEFyZSB5b3UgaW1wbHlpbmcgdGhh
dA0KPiA+PiBpdCBtYXkgYmUgY2FsbGVkIGJ5IHNvbWVvbmUgdGhhdCBpcyBub3QgdGhlIG93bmVy
PyBJZiBub3QsIHRoZW4gaXQNCj4gPj4gc2hvdWxkIGJlICJzaG91bGQiLg0KPiA+Pg0KPiA+PiBB
bHNvIE5JVDogU3BlbGwgb3V0IGNvbXBsZXRlbHkgImZ1bmMiLiBJLmUgIlRoZSBmdW5jdGlvbiIu
DQo+ID4+DQo+ID4+PiArICogZnJvbSB0aGUgb3duZXIuDQo+ID4+DQo+ID4+IEkgcmVhZCBmcm9t
IGFzICJjdXJyZW50IHNob3VsZCBiZSB0aGUgb3duZXIiLiBCdXQgSSBndWVzcyB0aGlzIGlzIG5v
dA0KPiA+PiB3aGF0IHlvdSBtZWFuIGhlcmUuIEluc3RlYWQgaXQgbG9va3MgbGlrZSB5b3UgbWVh
biAiZCIgaXMgdGhlIG93bmVyLg0KPiA+PiBTbyBJIHdvdWxkIHdyaXRlICJkIHNob3VsZCBiZSB0
aGUgb3duZXIgb2YgdGhlIHNoYXJlZCBhcmVhIi4NCj4gPj4NCj4gPj4gSXQgd291bGQgYmUgZ29v
ZCB0byBoYXZlIGEgY2hlY2svQVNTRVJUIGNvbmZpcm0gdGhpcyAoYXNzdW1pbmcgdGhpcw0KPiA+
PiBpcyBlYXN5IHRvIHdyaXRlKS4NCj4gPj4NCj4gPg0KPiA+IFRoZSBjaGVjayBpcyBhbHJlYWR5
IGluIHRoZSBjYWxsaW5nIHBhdGgsIEkgZ3Vlc3MuLi4NCj4gDQo+IENhbiB5b3UgcGxlYXNlIGNv
bmZpcm0gaXQ/DQo+IA0KDQpJIG1lYW4gdGhhdCBhbGxvY2F0ZV9zaGFyZWRfbWVtb3J5IGlzIG9u
bHkgY2FsbGVkIHVuZGVyIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uLCBhbmQNCml0IGNvbmZpcm1z
IGl0IGlzIHRoZSByaWdodCBvd25lci4NCiINCiAgICAgICAgaWYgKCAob3duZXJfZG9tX2lvICYm
ICFpc19zaG1fYWxsb2NhdGVkX3RvX2RvbWlvKHBiYXNlKSkgfHwNCiAgICAgICAgICAgICAoIW93
bmVyX2RvbV9pbyAmJiBzdHJjbXAocm9sZV9zdHIsICJvd25lciIpID09IDApICkNCiAgICAgICAg
ew0KICAgICAgICAgICAgLyogQWxsb2NhdGUgc3RhdGljYWxseSBzaGFyZWQgcGFnZXMgdG8gdGhl
IG93bmVyIGRvbWFpbi4gKi8NCiAgICAgICAgICAgIHJldCA9IGFsbG9jYXRlX3NoYXJlZF9tZW1v
cnkob3duZXJfZG9tX2lvID8gZG9tX2lvIDogZCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYWRkcl9jZWxscywgc2l6ZV9jZWxscywNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGJhc2UsIHBzaXplLCBnYmFzZSk7DQoiDQoNClRCSCwg
YXBhcnQgZnJvbSB0aGF0LCBJIGRvbid0IGtub3cgaG93IHRvIGNoZWNrIGlmIHRoZSBpbnB1dCBk
IGlzIHRoZSByaWdodCBvd25lciwgb3IgYW0gSQ0KbWlzdW5kZXJzdGFuZGluZyBzb21lIHlvdXIg
c3VnZ2VzdGlvbiBoZXJlPw0KIA0KPiBbLi4uXQ0KPiANCj4gPj4+ICsgICAgICAgIHByb3AgPSBk
dF9maW5kX3Byb3BlcnR5KHNobV9ub2RlLCAieGVuLHNoYXJlZC1tZW0iLCBOVUxMKTsNCj4gPj4+
ICsgICAgICAgIGlmICggIXByb3AgKQ0KPiA+Pj4gKyAgICAgICAgew0KPiA+Pj4gKyAgICAgICAg
ICAgIHByaW50aygiU2hhcmVkIG1lbW9yeSBub2RlIGRvZXMgbm90IHByb3ZpZGUNCj4gPj4+ICsg
XCJ4ZW4sc2hhcmVkLQ0KPiA+PiBtZW1cIiBwcm9wZXJ0eS5cbiIpOw0KPiA+Pj4gKyAgICAgICAg
ICAgIHJldHVybiAtRU5PRU5UOw0KPiA+Pj4gKyAgICAgICAgfQ0KPiA+Pj4gKyAgICAgICAgY2Vs
bHMgPSAoY29uc3QgX19iZTMyICopcHJvcC0+dmFsdWU7DQo+ID4+PiArICAgICAgICAvKiB4ZW4s
c2hhcmVkLW1lbSA9IDxwYmFzZSwgcHNpemUsIGdiYXNlPjsgKi8NCj4gPj4+ICsgICAgICAgIGRl
dmljZV90cmVlX2dldF9yZWcoJmNlbGxzLCBhZGRyX2NlbGxzLCBzaXplX2NlbGxzLCAmcGJhc2Us
ICZwc2l6ZSk7DQo+ID4+PiArICAgICAgICBBU1NFUlQoSVNfQUxJR05FRChwYmFzZSwgUEFHRV9T
SVpFKSAmJiBJU19BTElHTkVEKHBzaXplLA0KPiA+Pj4gKyBQQUdFX1NJWkUpKTsNCj4gPj4NCj4g
Pj4gU2VlIGFib3ZlIGFib3V0IHdoYXQgQVNTRVJUKClzIGFyZSBmb3IuDQo+ID4+DQo+ID4NCj4g
PiBEbyB5b3UgdGhpbmsgYWRkcmVzcyB3YXMgc3VpdGFibHkgY2hlY2tlZCBoZXJlLCBpcyBpdCBl
bm91Z2g/DQo+IA0KPiBBcyBJIHdyb3RlIGJlZm9yZSwgQVNTRVJUKCkgc2hvdWxkIG5vdCBiZSB1
c2VkIHRvIGNoZWNrIHVzZXIgaW5wdXRzLg0KPiBUaGV5IG5lZWQgdG8gaGFwcGVuIGluIGJvdGgg
ZGVidWcgYW5kIHByb2R1Y3Rpb24gYnVpbGQuDQo+IA0KPiA+IElmIGl0IGlzIGVub3VnaCwgSSds
bCBtb2RpZnkgYWJvdmUgQVNTRVJUKCkgdG8gbWZuX3ZhbGlkKCkNCj4gDQo+IEl0IGlzIG5vdCBj
bGVhciB3aGF0IEFTU0VSVCgpIHlvdSBhcmUgcmVmZXJyaW5nIHRvLg0KPiANCg0KRm9yIHdoZXRo
ZXIgcGFnZSBpcyBhbGlnbmVkLCBJIHdpbGwgYWRkIHRoZSBiZWxvdyBjaGVjazoNCiINCiAgICAg
ICAgaWYgKCAhSVNfQUxJR05FRChwYmFzZSwgUEFHRV9TSVpFKSB8fCAhSVNfQUxJR05FRChwc2l6
ZSwgUEFHRV9TSVpFKSB8fA0KICAgICAgICAgICAgICFJU19BTElHTkVEKGdiYXNlLCBQQUdFX1NJ
WkUpICkNCiAgICAgICAgew0KICAgICAgICAgICAgcHJpbnRrKCIlcGQ6IHBoeXNpY2FsIGFkZHJl
c3MgJWx1LCBzaXplICVsdSBvciBndWVzdCBhZGRyZXNzICVsdSBpcyBub3Qgc3VpdGFibHkgYWxp
Z25lZC5cbiIsDQogICAgICAgICAgICAgICAgICAgZCwgcGJhc2UsIHBzaXplLCBnYmFzZSk7DQog
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCiAgICAgICAgfQ0KIg0KRm9yIHdoZXRoZXIgdGhl
IHdob2xlIGFkZHJlc3MgcmFuZ2UgaXMgdmFsaWQsIEkgd2lsbCBhZGQgdGhlIGJlbG93IGNoZWNr
Og0KIg0KICAgICAgICBmb3IgKCBpID0gMDsgaSA8IFBGTl9ET1dOKHBzaXplKTsgaSsrICkNCiAg
ICAgICAgICAgIGlmICggIW1mbl92YWxpZChtZm5fYWRkKG1hZGRyX3RvX21mbihwYmFzZSksIGkp
KSApDQogICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgcHJpbnRrKCIlcGQ6IGludmFsaWQg
cGh5c2ljYWwgYWRkcmVzcyAlIlBSSV9wYWRkciIgb3Igc2l6ZSAlIlBSSV9wYWRkciJcbiIsDQog
ICAgICAgICAgICAgICAgICAgICAgIGQsIHBiYXNlLCBwc2l6ZSk7DQogICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQogICAgICAgICAgICB9DQoiDQo+IENoZWVycywNCj4gDQo+IC0tDQo+
IEp1bGllbiBHcmFsbA0K

