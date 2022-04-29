Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1BC514D31
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 16:34:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317398.536703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkRgk-0007Ta-Hh; Fri, 29 Apr 2022 14:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317398.536703; Fri, 29 Apr 2022 14:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkRgk-0007SG-Ef; Fri, 29 Apr 2022 14:33:42 +0000
Received: by outflank-mailman (input) for mailman id 317398;
 Fri, 29 Apr 2022 14:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjT=VH=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nkRgi-0007SA-Um
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 14:33:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c201b8f-c7c9-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 16:33:39 +0200 (CEST)
Received: from DB6PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:6:2d::16) by
 AM4PR08MB2836.eurprd08.prod.outlook.com (2603:10a6:205:d::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12; Fri, 29 Apr 2022 14:33:34 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::7c) by DB6PR07CA0006.outlook.office365.com
 (2603:10a6:6:2d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.6 via Frontend
 Transport; Fri, 29 Apr 2022 14:33:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 14:33:34 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Fri, 29 Apr 2022 14:33:34 +0000
Received: from deeca7ce46bb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0ECFA33F-1C97-41F0-82C1-B35527895F47.1; 
 Fri, 29 Apr 2022 14:33:26 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id deeca7ce46bb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Apr 2022 14:33:26 +0000
Received: from DB6PR0801MB2022.eurprd08.prod.outlook.com (2603:10a6:4:76::15)
 by AM6PR08MB4166.eurprd08.prod.outlook.com (2603:10a6:20b:a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 14:33:18 +0000
Received: from DB6PR0801MB2022.eurprd08.prod.outlook.com
 ([fe80::556f:106a:aa3:42f6]) by DB6PR0801MB2022.eurprd08.prod.outlook.com
 ([fe80::556f:106a:aa3:42f6%3]) with mapi id 15.20.5186.025; Fri, 29 Apr 2022
 14:33:17 +0000
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
X-Inumbo-ID: 5c201b8f-c7c9-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OTCuXrZY6D9pq/oNQQdI4cvkjYc77y8Ukf5/TB37fkXDoPQjT4OMbVgKoooKRwHQ0uifvG/sOOa2fQNOBrVaMFlVe0vY2Pfqjy45ro6fuDqy55eal9GZhosbmK7Jm/ylcvrLkHbx1a9Fi0trBO7/FRCyal4FJTkCSF73HfKi/59kf2gIxfPvZzgtlIbQPpUQebxUTTJNIjhIyRB3rdL52amQqCOmJ1h2ZPHBmmEwwqhLbkscfQgiJiPvbRAMEFnw1NshxBe8sBHtXsayT2G8Z+v1PMS02RVUmCMMNdULocq8ZTAkwxm/VeRIw2mFEj2ja7my2WxAY+JZpR7O5+g9JA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8UqTu4o0IYoUCHO1jrwbDByB81Vgr7jktqWisZeiy4=;
 b=BlGTa6g8XwJJ85u9/YC7rAqZX8CY73KNcCjF8GWw1wbzh7oS9K65PmoraKGjP1aKbhpHthkrlBsX4xOtaTyEPNG2cMGCU8GwCJoyty0uIbzlTnLPiOvGKCu3GuCH06c8VYoeG2fTOkI76vNRGqUNDsacGhFBLIBTxVQ8KePOhFHyyAMjFkZafTODlQEgw2QvKV+U9xWWkeqLJDfsr7+DywgF0iBeW1TubK8cud89PnJAFRgiwONbpTvnwBQZUVkWi8LR/539h4B+TRuPHyZaUGZhy8v673IAcuYex4P14k7/wvNTuj4hlVJ5dEtEFVFutWwnEjfjrYdBP4mlrS5yBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8UqTu4o0IYoUCHO1jrwbDByB81Vgr7jktqWisZeiy4=;
 b=j1gHED3Vcal/HezkW5a1MGlUdJE5wow0JPVxNh64YN0oXRG6pLREimSwGcMv83Bv8P7ene722IHxZF2Ab5xmykaBSQ2MrUkOTK6eyOWG2RqCFDOcv5NfjkqvZegtoR+JrrBfIB4RFu2VjZvb5VS9M0i+TXPCCaLamL/BZMVCt80=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1b5e74b37100d3c1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPwBPnT7mPIhZYL1KVu9/ue2+6K2twuUfUjK0kVfxsjRtG/2irHv7hyyh2jeNMyEF5PbJu8BzDVCofBcqI/b/QxnWnCUnXDTZ0b+eM1eVuEMeSeg3aqgxwUiPsDavtya8YyQqsvoUwcClGkYPHix6SoPQ1pvjMiFu+b23eN1W0fpoIZ6IBv+QA+xhqWESsLBjBy5fKmSNPEHS+d72Xkz8eD2eNmnNGGQmcx2PBKs6vk1MlD67QU/AGH0z46+vRXgW4/hqArOHWO5MX8Ids3fK84JHVNuVhSkauMYIWe27LNJWvZYivv6ZHZvULeNePTZC2RovdVCFooFTB+N4cW+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8UqTu4o0IYoUCHO1jrwbDByB81Vgr7jktqWisZeiy4=;
 b=G6jnIf9fFzEzCDVTesWwX5zCdlDoTywY4F+gAO9h661rKECutgsxKGresAMD7+Hvm0CJBp3nry6i+evmc0ts+qB7+yXtEIed/EYwWD58CLHd6V+SiuhLlgrPUCEXEESUHmcVEuLXD5wwtHthxY0OpQjKKcy5aw3GWC2ND4vGuuPqwtMLK5l2Xu6jlqO1u7NgzR+7/9hoSjXpCbdnm0WnZfwMC7blhY25/C13Y68yHRKjjEQExbbdwCgfy9uroorn9vZl8ZhY08mGae95sHRUYhwLiU3042kjIVaxqNjTSkDpdhxNtu5aiVnCS4vFXNXcMctWeFTf36JBBoXbAhF2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8UqTu4o0IYoUCHO1jrwbDByB81Vgr7jktqWisZeiy4=;
 b=j1gHED3Vcal/HezkW5a1MGlUdJE5wow0JPVxNh64YN0oXRG6pLREimSwGcMv83Bv8P7ene722IHxZF2Ab5xmykaBSQ2MrUkOTK6eyOWG2RqCFDOcv5NfjkqvZegtoR+JrrBfIB4RFu2VjZvb5VS9M0i+TXPCCaLamL/BZMVCt80=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Topic: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Index: AQHYWlIekEFYa4Z+ZkOKg6prrRxnv60EB7eAgALvxoA=
Date: Fri, 29 Apr 2022 14:33:17 +0000
Message-ID: <004BB439-72CA-4543-8CEA-C3BADC7D98CF@arm.com>
References:
 <a19f7238f428deb610df643944f60e1e79e273cf.1651075797.git.rahul.singh@arm.com>
 <0c6fd5db-ffc7-893a-1ad0-d54f3974a45a@xen.org>
In-Reply-To: <0c6fd5db-ffc7-893a-1ad0-d54f3974a45a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 86e719eb-b81f-49cf-101c-08da29ed3d74
x-ms-traffictypediagnostic:
	AM6PR08MB4166:EE_|DBAEUR03FT031:EE_|AM4PR08MB2836:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB283630D7B00DEB23B8F72E00FCFC9@AM4PR08MB2836.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3GUqMQmsPFJgukEu+wgulObbVRJOw7vf8JWf7bKS6v2DVpn/Yp2vCkHEshxaqOm9CqI9ULqtQc0y2F2n8pjr83AhG6D4M4Hr5+eAaJ34SE6VP1/gCmkv8BmioVCfc1fFERbgZ/BI3Agssd8HNDjxRXJClaV/9qO4lVDHVN2y5fqmP4xMUDoymUu7YLnvz+tMon/m3ABrbSDRzJu2AGDjRzTgBYBg0AMt0LxBbe8YCU1oqNW0brincV/3XzAQ1sY8gR46LIXyS4jRQ35Ukbs31ZuA1lTwWI5eFj0I5wxLDoh7CAOPKWt1U/808r1imnsaqTLcA1Dj9hIARcIIT//BH+LyVEQNtBN211LSvpaVW6k70ggBNdqWdOLifWhhjX02aFko2rocWhedFQXNhm9BJ2LzilGZVGp7DIZCSYn1URsiFoCdKoi+/qmGHNNlFDW6lVF5M7RHWDtvCVwdgSo6IWe3GIa3i8gPcaJL1NMMmsrnNPdhmeeSyyIlBNH6gmhmzTkr+daKHoSx0lGgJch7a9uCCzh94lx9UOZJwQ6V+h2Jf0lA1tGn/ZSZ/3l2ta2g4/25RJdB3cN7GPy3O581y7M7c1jKsz2cOpX/mj0cIZ2L0AM1RTtnusGZoZoUgSfM1xqV1hXiN83GDCYz6OOjEEaMuEF6jLkfT/yzmDZLEQm2aKOALcxDpDoH2dudUKhzzZ9XO22IuVwtd4zQczEW78eerxvd5OIzgP5/rxt/Y59dekxASwPraa82RRMXeQ8J
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2022.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(36756003)(6506007)(33656002)(53546011)(4326008)(26005)(6512007)(5660300002)(71200400001)(508600001)(6486002)(66946007)(91956017)(66556008)(66446008)(8676002)(66476007)(64756008)(54906003)(76116006)(86362001)(122000001)(316002)(2616005)(6916009)(186003)(38100700002)(38070700005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <704152574B971B41B177957346D74610@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4166
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	496a317e-fa1a-4c31-f270-08da29ed33a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XBQaJ88j7ifrRTI4WSGkiwhp1ZawI/cOU1Tuz1ICGUZOBTvvATgP+MhUdIGq9nOZyuhrfoEnCSSL1mUf3maoTOCAVwDs+Sbm6rodSnOGmELECv2mZoqpLueBYUVza67vgNKXwOKo4cjVy6y4sDdx49vsNHm9L9ZN4c1P7s8iXsZnriYIIaPaS+lotEX30OfzDK/ex7gZbIx713q7Q+04LzBnxoadms1NghwHmeOi1H5NrUesyI6V7bX3DuTVzILLfqc6wUl3uE+HsK7gmH7npc4fB/Wap5VNtnK29z55L4lAUyhqzTvn0eLYoKOzIhMklBYpmvC1NosjEJC0qR5TI/Zyl/vGn5Q+Et385bQ5CLvrEt5aEHZWGgk4TdoRXD4tlA6y01Jhp8NNwmC0cGp0o2fVIFJZYM6OlZpWKbpFBSvYQ+Q5MPaA+nFTDWG7EiLcuCuDztrL29WgsUjYIxI/F6zTDTPN/UlFt/WA7zqQ+K++AiDSqZBIo13R+MGJWw/vyWMhyXA746sJLZqNl/U8hBDy9cBzVcvyCDcjTpdD++vNQ2nJ+kxphXs8WxMDO5y4tEAJnbEQckKKPbTdckEkVvSkIeTRVZ7OgTiugytkeeUE37DuPvw0fyPCCnWPKSN9xYEQ8vEtytUhuPn7hTVa7ocRshdYKPZSuxcczuh4TrB3H9YsRBNNfvLti7/93QKq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(54906003)(336012)(2906002)(5660300002)(81166007)(8936002)(356005)(40460700003)(6862004)(8676002)(4326008)(70586007)(82310400005)(86362001)(36860700001)(70206006)(6512007)(186003)(107886003)(2616005)(33656002)(508600001)(53546011)(6486002)(36756003)(26005)(6506007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 14:33:34.1194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e719eb-b81f-49cf-101c-08da29ed3d74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2836

SGkgSnVsaWVuLA0KDQo+IE9uIDI3IEFwciAyMDIyLCBhdCA2OjQyIHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMjcvMDQvMjAyMiAx
NzoxNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBXaGVuIGEgZGV2aWNlIGlzIGRlYXNzaWduZWQg
ZnJvbSB0aGUgZG9tYWluIGl0IGlzIHJlcXVpcmVkIHRvIHJlbW92ZSB0aGUNCj4+IGlvbW11IGdy
b3VwLg0KPiANCj4gVGhpcyByZWFkIHdyb25nIHRvIG1lLiBXZSBzaG91bGQgbm90IG5lZWQgdG8g
cmUtY3JlYXRlIHRoZSBJT01NVSBncm91cCAoYW5kIGNhbGwgYXJtX3NtbXVfYWRkX2RldmljZSgp
KSBldmVyeSB0aW1lIGEgZGV2aWNlIGlzIHJlLWFzc2lnbmVkLg0KT2suDQo+IA0KPj4gSWYgd2Ug
ZG9uJ3QgcmVtb3ZlIHRoZSBncm91cCwgdGhlIG5leHQgdGltZSB3aGVuIHdlIGFzc2lnbg0KPj4g
YSBkZXZpY2UsIFNNRSBhbmQgUzJDUiB3aWxsIG5vdCBiZSBzZXR1cCBjb3JyZWN0bHkgZm9yIHRo
ZSBkZXZpY2UNCj4+IGJlY2F1c2Ugb2YgdGhhdCBTTU1VIGZhdWx0IHdpbGwgYmUgb2JzZXJ2ZWQu
DQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgYSBidWcgZml4IGZvciAwNDM1Nzg0Y2M3NWRjZmVmM2I1
ZjU5YzI5ZGViMWRiYjg0MjY1ZGRiLiBJZiBzbywgcGxlYXNlIGFkZCBhIEZpeGVzIHRhZy4NCg0K
T2sgTGV0IG1lIGFkZCB0aGUgRml4ZXMgdGFnIGluIG5leHQgdmVyc2lvbi4NCj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+IC0tLQ0KPj4g
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyB8IDIgKysNCj4+IDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hcm0vc21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYw0KPj4g
aW5kZXggNWNhY2IyZGQ5OS4uOWEzMWMzMzJkMCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS9zbW11LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FybS9zbW11LmMNCj4+IEBAIC0xNjkwLDYgKzE2OTAsOCBAQCBzdGF0aWMgdm9pZCBhcm1fc21t
dV9kZXRhY2hfZGV2KHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwgc3RydWN0IGRldmljZSAq
ZGV2KQ0KPj4gCWlmIChjZmcpDQo+PiAJCWFybV9zbW11X21hc3Rlcl9mcmVlX3NtZXMoY2ZnKTsN
Cj4+ICsJaW9tbXVfZ3JvdXBfcHV0KGRldl9pb21tdV9ncm91cChkZXYpKTsNCj4+ICsJZGV2X2lv
bW11X2dyb3VwKGRldikgPSBOVUxMOw0KPj4gfQ0KPiANCj4gVGhlIGdvYWwgb2YgYXJtX3NtbXVf
ZGV0YWNoX2RldigpIGlzIHRvIHJldmVydCB0aGUgY2hhbmdlIG1hZGUgaW4gYXJtX3NtbXVfYXR0
YWNoX2RldigpLiBCdXQgbG9va2luZyBhdCB0aGUgY29kZSwgbmVpdGhlciB0aGUgSU9NTVUgZ3Jv
dXAgbm9yIHRoZSBzbWVzIGFyZSBhbGxvY2F0ZWQgaW4gYXJtX3NtbXVfYXR0YWNoX2RldigpLg0K
PiANCj4gQXJlIHRoZSBTTUVTIG1lYW50IHRvIGJlIHJlLWFsbG9jYXRlZCBldmVyeXRpbWUgd2Ug
YXNzaWduIHRvIGEgZGlmZmVyZW50IGRvbWFpbj8gSWYgeWVzLCB0aGUgYWxsb2NhdGlvbiBzaG91
bGQgYmUgZG9uZSBpbiBhcm1fc21tdV9hdHRhY2hfZGV2KCkuDQoNClllcyBTTUVTIGhhdmUgdG8g
YmUgcmUtYWxsb2NhdGVkIGV2ZXJ5IHRpbWUgYSBkZXZpY2UgaXMgYXNzaWduZWQuDQoNCklzIHRo
YXQgb2theSBpZiBJIHdpbGwgbW92ZSB0aGUgZnVuY3Rpb24gYXJtX3NtbXVfbWFzdGVyX2FsbG9j
X3NtZXMoKSBmcm9tIGFybV9zbW11X2FkZF9kZXZpY2UoKSB0byBhcm1fc21tdV9hdHRhY2hfZGV2
KCkuDQpJbiB0aGlzIGNhc2Ugd2UgZG9u4oCZdCBuZWVkIHRvIHJlbW92ZSB0aGUgSU9NTVUgZ3Jv
dXAgYW5kIGFsc28gYXJtX3NtbXVfZGV0YWNoX2RldigpIHdpbGwgYWxzbyByZXZlcnQgdGhlICBj
aGFuZ2UgbWFkZSBpbiBhcm1fc21tdV9hdHRhY2hfZGV2KCkuDQoNCmRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL3NtbXUuYw0KaW5kZXggNWNhY2IyZGQ5OS4uZmYxYjczZDNkOCAxMDA2NDQNCi0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMNCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FybS9zbW11LmMNCkBAIC0xNjgwLDYgKzE2ODAsMTAgQEAgc3RhdGljIGludCBhcm1f
c21tdV9hdHRhY2hfZGV2KHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwgc3RydWN0IGRldmlj
ZSAqZGV2KQ0KICAgICAgICBpZiAoIWNmZykNCiAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RF
VjsNCiANCisgICAgICAgcmV0ID0gYXJtX3NtbXVfbWFzdGVyX2FsbG9jX3NtZXMoZGV2KTsNCisg
ICAgICAgaWYgKHJldCkNCisgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KKw0KICAgICAgICBy
ZXR1cm4gYXJtX3NtbXVfZG9tYWluX2FkZF9tYXN0ZXIoc21tdV9kb21haW4sIGNmZyk7DQogfQ0K
IA0KQEAgLTIwNzUsNyArMjA3OSw3IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfYWRkX2RldmljZShz
dHJ1Y3QgZGV2aWNlICpkZXYpDQogICAgICAgIGlvbW11X2dyb3VwX2FkZF9kZXZpY2UoZ3JvdXAs
IGRldik7DQogICAgICAgIGlvbW11X2dyb3VwX3B1dChncm91cCk7DQogDQotICAgICAgIHJldHVy
biBhcm1fc21tdV9tYXN0ZXJfYWxsb2Nfc21lcyhkZXYpOw0KKyAgICAgICByZXR1cm4gMDsNCiB9
DQoNClJlZ2FyZHMsDQpSYWh1bA0KPiANCj4gSWYgbm90LCB0aGVuIHdlIHNob3VsZCBub3QgZnJl
ZSB0aGUgU01FUyBoZXJlDQo+IA0KPiBJSVVDLCB0aGUgU01FUyBoYXZlIHRvIGJlIHJlLWFsbG9j
YXRlZCBldmVyeSB0aW1lIGEgZGV2aWNlIGlzIGFzc2lnbmVkLiBUaGVyZWZvcmUsIEkgdGhpbmsg
d2Ugc2hvdWxkIG1vdmUgdGhlIGNhbGwgdG8gYXJtX3NtbXVfbWFzdGVyX2FsbG9jX3NtZXMoKSBv
dXQgb2YgdGhlIGRldGFjaCBjYWxsYmFjayBhbmQgaW4gYSBoZWxwZXIgdGhhdCB3b3VsZCBiZSB1
c2VkIHdoZW4gcmVtb3ZpbmcgYSBkZXZpY2UgKG5vdCB5ZXQgc3VwcG9ydGVkIGJ5IFhlbikuDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

