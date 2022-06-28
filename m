Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D7255BF60
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 10:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357009.585405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o66Q2-00067l-Is; Tue, 28 Jun 2022 08:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357009.585405; Tue, 28 Jun 2022 08:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o66Q2-00064k-Fj; Tue, 28 Jun 2022 08:17:58 +0000
Received: by outflank-mailman (input) for mailman id 357009;
 Tue, 28 Jun 2022 08:17:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+rg=XD=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1o66Q1-00064e-3N
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 08:17:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfc9bb61-f6ba-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 10:17:55 +0200 (CEST)
Received: from AM6PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:20b:92::46)
 by VI1PR08MB3118.eurprd08.prod.outlook.com (2603:10a6:803:46::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 08:17:53 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::bb) by AM6PR04CA0033.outlook.office365.com
 (2603:10a6:20b:92::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 08:17:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 08:17:52 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Tue, 28 Jun 2022 08:17:51 +0000
Received: from 0592b720cbb0.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91CE5B72-D6BA-4381-BBFE-6050126E76FF.1; 
 Tue, 28 Jun 2022 08:17:41 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0592b720cbb0.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 08:17:41 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by DB9PR08MB7147.eurprd08.prod.outlook.com (2603:10a6:10:2cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 08:17:39 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::69e7:f6d2:15e6:d90]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::69e7:f6d2:15e6:d90%6]) with mapi id 15.20.5373.016; Tue, 28 Jun 2022
 08:17:38 +0000
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
X-Inumbo-ID: cfc9bb61-f6ba-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Eb1rlAdfcdNnygh/6uw4WVfZBHV02e53RCPGymL7GIuFcFgDg7Y+XsN9R5IwghDtYyeF4/iYuIxxseyzihL6lTNfO3PJAv03qp5LBfhMDnP5SXbxIK+9AEKoRrfv/gEc3LVV6BrDGeX6AtfPWV7nGXe+aqjJAvNbU8n+C2zXMX81xfMtLFtqWZ3HDn0qxMZOvFjUUtQB4q6yvoXJ9AIm/FPopw76JF53UfgtjSVaSFY1FP1QGxAMNnT65iFz3j0iK7SWf1rrqNXdZW2YCw0TDEn2Vvp97XgvwhG86g/bhhdH5odcO1l/09/Go6AO7EEbdIq5TL+HW13FTOr2DTjmzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIAh/tt34y2FHhmXu+jB0X/mDmoFFAYal2qtxwfInFA=;
 b=NKGjR6rLTX2aNcrftGn4pBs1/28EyRvWfha+U5tl7WEHsLnLWXPavEklx3vC8+fkqwxjE9Va1rKo3xUr51+GaqCQgLzJi9HPUB3ko3XnBatMCusvyYNSVIm7nfvzWiLqTiwlS4sybeNYLpG0apsP8ALeY2MyWWGgCEZHLshioph/E55iu3GBSAC4BYPgbc6xjYtpcUHAvgg0UyMN9A/ki3NXCLE1zHYi1BlJX12eeO5akFHYkzyf9YDlbBhDhDTJRYgDaPi8OHSECe2HWHd5dPX1ni8eyB639w86qWXMlrOM2ac5ZKSV+slwVxcpX7MZRlIedmKs7NlmiCfcoi01kw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIAh/tt34y2FHhmXu+jB0X/mDmoFFAYal2qtxwfInFA=;
 b=KQ0MvQdIHFQcEiWVkTMWVyXW5UZxq3nPhEnuVyhDhl5Rc3A4wWcXUPiObavoByabdYNl/rLZug8RLyzoQ2j8+2nsTm9640leVnLV1S2tH3paFv3S3PlObZcwyYVJnS4GCsYVh5KzL5TuCeTUTvNyK4dz0lfR6mHk9neQgv423IE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScrLtuE4aY858b6mqgqgZFHe9K96+ko80KEPzk54ZaGZt4UGdCjvs/UKRDz9TeuAlNVY715oO2V+WoRzZjfixJHn44zcDXr0xh2x5AfihUtROLOW5Xysz8dwUZ40OZPdt7/0dleFZZmf3zXBSJEEyLxlk7X8yM/BJd1/mfrP6RrJTp7pxqdITKAF/KzQx2C4hob+aQaBDQRYnydqaoEys2A0qIGf+87X7uIeZqHU98oD3LlmXJ8rzGbJ2LhJIpdlm16FxoQka3eB7hbx6+QZ8UYk6jstvpwchDJN31ov8FAlsaB1n6s19858ND28WZjkVSPtb+LRTNywxt10maya9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIAh/tt34y2FHhmXu+jB0X/mDmoFFAYal2qtxwfInFA=;
 b=MwFD2M3sE3+80NaOVLsqZ5YmIkYIU+wccA3GmIbovySbahAPwER7xuSwlqAvqyaHguQzTb4wHrzPtB6liWI10sIccidf/L1fKRzofqz63H9LaSjHQr5JLaJSach6XzrSecQ70Pr7wuSgpKIUYWZlPIDoR3GpZ3d/uy9zIgFX6FfibEL8C1FyJie7ZCsGrkvQfvSMHSoeSOSe4CO67SCS0dyu1qMyCikXuf6h6R0GJS2fmNZRRHiE+pkhMAQv4mkJrgX6vl8KaO5iHErEyRegfCFP1nUp4TMaOZUixxIUmEmZHsmGRO/lh7VT/TzKw0UpQI2+bBGoc6NDVcFYOGvSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIAh/tt34y2FHhmXu+jB0X/mDmoFFAYal2qtxwfInFA=;
 b=KQ0MvQdIHFQcEiWVkTMWVyXW5UZxq3nPhEnuVyhDhl5Rc3A4wWcXUPiObavoByabdYNl/rLZug8RLyzoQ2j8+2nsTm9640leVnLV1S2tH3paFv3S3PlObZcwyYVJnS4GCsYVh5KzL5TuCeTUTvNyK4dz0lfR6mHk9neQgv423IE=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH] xen/arm: avoid extra caclulations when setting vtimer in
 context switch
Thread-Topic: [PATCH] xen/arm: avoid extra caclulations when setting vtimer in
 context switch
Thread-Index: AQHYidHeBWnNLqFeFEKI7B/maNA44q1jD7IAgAFN1oCAABBlgIAADOqA
Date: Tue, 28 Jun 2022 08:17:37 +0000
Message-ID:
 <AS8PR08MB7696A4F4FA945FA2F9C8A77E92B89@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220627025809.1985720-1-jiamei.xie@arm.com>
 <cbb7a231-0f61-7170-3fc4-d4ae55398f3a@xen.org>
 <AS8PR08MB76964C46AE16A6CEF6DE221892B89@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <983E3136-4388-4249-90DC-FAFF18BC7724@arm.com>
In-Reply-To: <983E3136-4388-4249-90DC-FAFF18BC7724@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 44CB141685E18A45B70C29B289D97A68.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a0fe32a0-e3ed-4a29-898d-08da58deb220
x-ms-traffictypediagnostic:
	DB9PR08MB7147:EE_|AM5EUR03FT007:EE_|VI1PR08MB3118:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WNtAdKiPzzkCOn4ESS/r4/WdYuroqyjah97Pp5QkOPM1sO3dQCQQ1dIEMgKjjcBBVCBPIfKgS2L1opNTcK9r9Lb2NkB+puC8VOdOZaWWQfMfhckjXDISyhe2XdX5rA9YpE0aQItWIMkosYX9fNDC0cuGLCXUPNgC3+ir574ZuVTVIAVoe7ZM78rMBc73EFWHP9iNkwZW5BdMVEdj7efZu82XJh5U8iBBIVGL/J+DaZ5CVEBkhQugQYOHzMlLSHrbSe2f3zuZXRQ4qR4B7g2x6Pa0lEis0gB0zly1ezI4wZBEF1gqhyt0mkuBexNtAosHamEM3Z9N6OlQgyi9aXIly0SC49F6mDmImeqwQWIp4RiST/WJO09tMSFaWUX8bcXI5Az6D/bu726FrGZIA6hRdHMwGoYjzcwQ+FtNxcs0k78CdeXC2QUe/S6olMv6D6a4bFWjcoPU95aSAKxLvi9CTwfvO4y6HEy1Jclo9SgNwSq1O63b2W8QR812E9fZF8oNHjXgbQpX1kfeJHvQleBXKgCGUZeJwc7awEzdobw4Bk73ZhPYinaaYcMcR1Q38GnXH66wB09yIG7+GSuC6Ldz4fUBFdCEL+Ccva8Bk0avJync8gipPYkEctEiaLFgjq3BCLKs+nwQ3ALCBZ997RSQ8iot/CTEJfJfHXMcece0+FGSjZUTElQTMUp4+s7j+XZ+rVwH+g+QcCwEsvZiWhz+HoWP/TuIA83uLu4/1My+xqcBJe531QC9U0yiLBBguQ9Ue3PR2X/7CSMzNQJV2/jHC1W4+6KKQbUBf2PjJT/qDeckmuGFeC5WCLrfBoMD8mTK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(76116006)(8676002)(66476007)(7696005)(8936002)(66946007)(66446008)(64756008)(83380400001)(26005)(38070700005)(66556008)(84970400001)(4326008)(55016003)(6506007)(186003)(71200400001)(33656002)(9686003)(6636002)(6862004)(478600001)(122000001)(5660300002)(52536014)(966005)(54906003)(316002)(2906002)(86362001)(53546011)(38100700002)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7147
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5673388e-9dc6-416b-8286-08da58dea9b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AF+dw4wQ3ct0nGTbMVAB6nc9Lnp8zaeL8lWqimehvwUqf/ZhhefkAzN9NwyD1TSinVCfeEJSAmpqw+pSI2I91KRGnNOJyO9RBss6uLmDU8A0iPN3a5eApnA3vZsEbOkgunOqc07FSGOZA/bGo30X0jOW2TPqsWfGNqpBIbW0+GXhFWYkoXtxHWN53iYs5ODrvo8XycLOHZ+fB+moCpsaUvXTG47UyzDfFHYHzIFFO34QCMqszBq6yukNyW3cM7EjJRx9Y/OYuKaagUi4vSPKfea3AzyuEaedNAPMsGoBtcSJCkWO2MA0SoJQfw16yq0aClqltbl0DzTX2VIBJh/Pk78ddQmABkxJANdvMtcH4Ui7OhZZYbNlFD19UjAWDpvyeydtJDWs16YML0GOpZjyFrqrHObO0EmwViBOFMHPIbrtdFtl6X3ahr5xC+8wTholeA953vDTBF7IFY89RjMOU4ysj2e0F53Oxz1kgVBdgKj4BaYoCvqsovE7P3C3SC54dygAjc/jTSpoSE7MhAMVuM+Qv+JteHxofiJ0WFsTrypStA3oumQHO8r+A2kOXfSz6N73RbKWm3siMu7D0W2Vi+XBBl77a0uvnp/l0kyRP9TH4MW1LpEen3ljeBC2ZPYDiGSdtQjlAe9EuzIUyGXxLMG0lC19kQqFJejmLuiB71wNeAnfcRhFYLXvXSJVqBRQhFBt8K0iFTF17rEoBWZDAgitKdjeaC7GCW+yAxp9dWv87jE2a+N291YFzF1df+hRJecJbkmlKEQQgMM+T+h7dt8r/+NTHwkdQy0JeZGsBaw5QdH2y3hBoEI7BVSadWvuQIaCgELo239b8l4hOsUBDA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(36840700001)(46966006)(40470700004)(33656002)(478600001)(36860700001)(6506007)(186003)(55016003)(84970400001)(41300700001)(26005)(86362001)(40480700001)(966005)(9686003)(336012)(5660300002)(7696005)(47076005)(40460700003)(8936002)(316002)(83380400001)(81166007)(356005)(6636002)(2906002)(82740400003)(54906003)(70586007)(8676002)(53546011)(6862004)(70206006)(52536014)(82310400005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 08:17:52.0026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fe32a0-e3ed-4a29-898d-08da58deb220
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3118

SGkgQmVydHJhbmQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTZW50OiAyMDIy5bm0
NuaciDI45pelIDE1OjI5DQo+IFRvOiBKaWFtZWkgWGllIDxKaWFtZWkuWGllQGFybS5jb20+DQo+
IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVuL2FybTog
YXZvaWQgZXh0cmEgY2FjbHVsYXRpb25zIHdoZW4gc2V0dGluZyB2dGltZXINCj4gaW4gY29udGV4
dCBzd2l0Y2gNCj4gDQo+IEhpIEppYW1laSwNCj4gDQo+ID4gT24gMjggSnVuIDIwMjIsIGF0IDA3
OjM1LCBKaWFtZWkgWGllIDxKaWFtZWkuWGllQGFybS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkg
SnVsaWVuLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjLlubQ25pyIMjfm
l6UgMTg6MzYNCj4gPj4gVG86IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJtLmNvbT47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcw0KPiA+PiA8QmVydHJhbmQu
TWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPj4gPFZvbG9keW15cl9CYWJj
aHVrQGVwYW0uY29tPjsgV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+ID4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIHhlbi9hcm06IGF2b2lkIGV4dHJhIGNhY2x1bGF0aW9ucyB3aGVuIHNldHRp
bmcNCj4gdnRpbWVyDQo+ID4+IGluIGNvbnRleHQgc3dpdGNoDQo+ID4+DQo+ID4+IEhpIEppYW1p
DQo+ID4+DQo+ID4+IFRpdGxlOiBzL2NhY2x1bGF0aW9ucy9jYWxjdWxhdGlvbnMvDQo+ID4+DQo+
ID4+IEhvd2V2ZXIsIEkgdGhpbmsgdGhlIHRpdGxlIHNob3VsZCBtZW50aW9uIHRoZSBvdmVyZmxv
dyByYXRoZXIgdGhhbiB0aGUNCj4gPj4gZXh0cmEgY2FsY3VsYXRpb25zLiBUaGUgZm9ybWVyIGlz
IG1vcmUgaW1wb3J0YW50IHRoZSBsYXR0ZXIuDQo+ID4+DQo+ID4gSSB3aWxsIGNoYW5nZSB0aGUg
dGl0bGUgdG8gIiB4ZW4vYXJtOiBhdm9pZCBvdmVyZmxvdyB3aGVuIHNldHRpbmcgdnRpbWVyIGlu
DQo+IGNvbnRleHQgc3dpdGNoIg0KPiA+DQo+ID4+IE9uIDI3LzA2LzIwMjIgMDM6NTgsIEppYW1l
aSBYaWUgd3JvdGU6DQo+ID4+PiB2aXJ0X3Z0aW1lcl9zYXZlIGlzIGNhbGN1bGF0aW5nIHRoZSBu
ZXcgdGltZSBmb3IgdGhlIHZ0aW1lciBpbjoNCj4gPj4+ICJ2LT5hcmNoLnZpcnRfdGltZXIuY3Zh
bCArIHYtPmRvbWFpbi0+YXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0DQo+ID4+PiAtIGJvb3Rf
Y291bnQiLg0KPiA+Pj4gSW4gdGhpcyBmb3JtdWxhLCAiY3ZhbCArIG9mZnNldCIgbWlnaHQgY2F1
c2UgdWludDY0X3Qgb3ZlcmZsb3cuDQo+ID4+PiBDaGFuZ2luZyBpdCB0byAidi0+ZG9tYWluLT5h
cmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQgLSBib290X2NvdW50ICsNCj4gPj4+IHYtPmFyY2gu
dmlydF90aW1lci5jdmFsIiBjYW4gcmVkdWNlIHRoZSBwb3NzaWJpbGl0eSBvZiBvdmVyZmxvdw0K
PiA+Pg0KPiA+PiBUaGlzIHJlYWQgc3RyYW5nZSB0byBtZS4gV2Ugd2FudCB0byByZW1vdmUgdGhl
IG92ZXJmbG93IGNvbXBsZXRlbHkgbm90DQo+ID4+IHJlZHVjaW5nIGl0LiBUaGUgb3ZlcmZsb3cg
aXMgY29tcGxldGVseSByZW1vdmVkIGJ5IGNvbnZlcnRpbmcgdGhlDQo+ID4+ICJvZmZzZXQgLSBi
b3VudF9jb3VudCIgdG8gbnMgdXBmcm9udC4NCj4gPj4NCj4gPj4gQUZBSUNULCB0aGUgY29tbWl0
IG1lc3NhZ2UgZG9lc24ndCBleHBsYWluIHRoYXQuDQo+ID4gVGhhbmtzIGZvciBwb2ludGluZyBv
dXQgdGhhdC4gSG93IGFib3V0IHB1dHRpbmcgdGhlIGNvbW1pdCBtZXNzYWdlIGxpa2UNCj4gdGhl
IGJlbG93Og0KPiA+IHhlbi9hcm06IGF2b2lkIG92ZXJmbG93IHdoZW4gc2V0dGluZyB2dGltZXIg
aW4gY29udGV4dCBzd2l0Y2gNCj4gPg0KPiA+IHZpcnRfdnRpbWVyX3NhdmUgaXMgY2FsY3VsYXRp
bmcgdGhlIG5ldyB0aW1lIGZvciB0aGUgdnRpbWVyIGluOg0KPiA+ICJ2LT5hcmNoLnZpcnRfdGlt
ZXIuY3ZhbCArIHYtPmRvbWFpbi0+YXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0DQo+ID4gLSBi
b290X2NvdW50Ii4NCj4gPiBJbiB0aGlzIGZvcm11bGEsICJjdmFsICsgb2Zmc2V0IiBtaWdodCBj
YXVzZSB1aW50NjRfdCBvdmVyZmxvdy4NCj4gPiBDaGFuZ2luZyBpdCB0byAidGlja3NfdG9fbnMo
di0+ZG9tYWluLT5hcmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQgLQ0KPiA+IGJvb3RfY291bnQp
ICsgdGlja3NfdG9fbnModi0+YXJjaC52aXJ0X3RpbWVyLmN2YWwpIiBjYW4gYXZvaWQgb3ZlcmZs
b3csDQo+ID4gYW5kICJ0aWNrc190b19ucyhhcmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQgLSBi
b290X2NvdW50KSIgd2lsbCBiZQ0KPiA+IGFsd2F5cyB0aGUgc2FtZSwgd2hpY2ggaGFzIGJlZW4g
Y2FjdWxhdGVkIGluIGRvbWFpbl92dGltZXJfaW5pdC4NCj4gPiBJbnRyb2R1Y2UgYSBuZXcgZmll
bGQgdmlydF90aW1lcl9iYXNlLm5hbm9zZWNvbmRzIHRvIHN0b3JlIHRoaXMgdmFsdWUNCj4gPiBm
b3IgYXJtIGluIHN0cnVjdCBhcmNoX2RvbWFpbiwgc28gd2UgY2FuIHVzZSBpdCBkaXJlY3RseS4N
Cj4gPj4NCj4gPj4+ICwgYW5kDQo+ID4+PiAiYXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0IC0g
Ym9vdF9jb3VudCIgd2lsbCBiZSBhbHdheXMgdGhlIHNhbWUsDQo+ID4+PiB3aGljaCBoYXMgYmVl
biBjYWN1bGF0ZWQgaW4gZG9tYWluX3Z0aW1lcl9pbml0LiBJbnRyb2R1Y2UgYSBuZXcgZmllbGQN
Cj4gPj4+IHZ0aW1lcl9vZmZzZXQubmFub3NlY29uZHMgdG8gc3RvcmUgdGhpcyB2YWx1ZSBmb3Ig
YXJtIGluIHN0cnVjdA0KPiA+Pj4gYXJjaF9kb21haW4sIHNvIHdlIGNhbiB1c2UgaXQgZGlyZWN0
bHkgYW5kIGV4dHJhIGNhY2x1bGF0aW9ucyBjYW4gYmUNCj4gPj4+IGF2b2lkZWQuDQo+ID4+Pg0K
PiA+Pj4gVGhpcyBwYXRjaCBpcyBlbmxpZ2h0ZW5lZCBmcm9tIFsxXS4NCj4gPj4+DQo+ID4+PiBT
aWduZWQtb2ZmLWJ5OiBKaWFtZWkgWGllIDxqaWFtZWkueGllQGFybS5jb20+DQo+ID4+Pg0KPiA+
Pj4gWzFdIGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20veGVuLQ0KPiA+PiBkZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZy9tc2cxMjMxMzkuaHRtDQo+ID4+DQo+ID4+IFRoaXMgbGluayBkb2Vz
bid0IHdvcmsuIEJ1dCBJIHdvdWxkIHBlcnNvbmFsbHkgcmVtb3ZlIGl0IGZyb20gdGhlIGNvbW1p
dA0KPiA+PiBtZXNzYWdlIChvciBhZGQgLS0tKSBiZWNhdXNlIGl0IGRvZXNuJ3QgYnJpbmcgdmFs
dWUgKHRoaXMgcGF0Y2ggbG9va3MNCj4gPj4gbGlrZSBhIHYyIHRvIG1lKS4NCj4gPiBTb3JyeSwg
YSAnbCcgaXMgbWlzc2luZyBhdCB0aGUgZW5kIG9mIHRoZSBsaW5rLiBUaGUgbGluayBpcyBodHRw
czovL3d3dy5tYWlsLQ0KPiBhcmNoaXZlLmNvbS94ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcvbXNnMTIzMTM5Lmh0bWwgLg0KPiA+IEkgd2lsbCBwdXQgaXQgYWZ0ZXIgLS0tIGluIHYzLg0K
PiA+Pg0KPiA+Pj4gLS0tDQo+ID4+PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmgg
fCA0ICsrKysNCj4gPj4+IHhlbi9hcmNoL2FybS92dGltZXIuYyB8IDYgKysrKy0tDQo+ID4+PiAy
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPj4+DQo+
ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+ID4+
IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+ID4+PiBpbmRleCBlZDYzYzJi
NmY5Li45NGZlNWI2NDQ0IDEwMDY0NA0KPiA+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2RvbWFpbi5oDQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWlu
LmgNCj4gPj4+IEBAIC03Myw2ICs3MywxMCBAQCBzdHJ1Y3QgYXJjaF9kb21haW4NCj4gPj4+IHVp
bnQ2NF90IG9mZnNldDsNCj4gPj4+IH0gdmlydF90aW1lcl9iYXNlOw0KPiA+Pj4NCj4gPj4+ICsg
c3RydWN0IHsNCj4gPj4+ICsgaW50NjRfdCBuYW5vc2Vjb25kczsNCj4gPj4NCj4gPj4gVGhpcyBz
aG91bGQgYmUgc190aW1lX3QgdG8gbWF0Y2ggdGhlIGFyZ3VtZW50IG9mIHNldF90aW1lcigpIGFu
ZCByZXR1cm4NCj4gPj4gb2YgdGlja3NfdG9fbnMoKS4NCj4gPj4NCj4gPj4+ICsgfSB2dGltZXJf
b2Zmc2V0Ow0KPiA+Pg0KPiA+PiBXaHkgYXJlIHlvdSBhZGRpbmcgYSBuZXcgc3RydWN0dXJlIHJh
dGhlciB0aGFuIHJlLXVzaW5nIHZpcnRfdGltZXJfYmFzZT8NCj4gPiBTdXJlLCBJJ2xsIGFkZCB0
aGlzIGZpZWxkIGluIHZpcnRfdGltZXJfYmFzZS4NCj4gPiBzdHJ1Y3Qgew0KPiA+IHVpbnQ2NF90
IG9mZnNldDsNCj4gPiBzX3RpbWVfdCBuYW5vc2Vjb25kczsNCj4gPiB9IHZpcnRfdGltZXJfYmFz
ZTsNCj4gPj4NCj4gPj4+ICsNCj4gPj4+IHN0cnVjdCB2Z2ljX2Rpc3QgdmdpYzsNCj4gPj4+DQo+
ID4+PiBzdHJ1Y3QgdnVhcnQgew0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92dGlt
ZXIuYyBiL3hlbi9hcmNoL2FybS92dGltZXIuYw0KPiA+Pj4gaW5kZXggNmI3OGZlYTc3ZC4uNTQx
NjFlNWZlYSAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL2FybS92dGltZXIuYw0KPiA+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jDQo+ID4+PiBAQCAtNjQsNiArNjQsNyBAQCBpbnQg
ZG9tYWluX3Z0aW1lcl9pbml0KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdA0KPiA+PiB4ZW5fYXJj
aF9kb21haW5jb25maWcgKmNvbmZpZykNCj4gPj4+IHsNCj4gPj4+IGQtPmFyY2gudmlydF90aW1l
cl9iYXNlLm9mZnNldCA9IGdldF9jeWNsZXMoKTsNCj4gPj4+IGQtPnRpbWVfb2Zmc2V0LnNlY29u
ZHMgPSB0aWNrc190b19ucyhkLT5hcmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQgLQ0KPiA+PiBi
b290X2NvdW50KTsNCj4gPj4+ICsgZC0+YXJjaC52dGltZXJfb2Zmc2V0Lm5hbm9zZWNvbmRzID0g
ZC0+dGltZV9vZmZzZXQuc2Vjb25kczsNCj4gPj4NCj4gPj4gSG1tbS4uLiBJIGZpbmQgb2RkIHRv
IGFzc2lnbiBhIGZpZWxkICJuYW5vc2Vjb25kcyIgdG8gInNlY29uZHMiLiBJIHdvdWxkDQo+ID4+
IHN1Z2dlc3QgdG8gcmUtb3JkZXIgc28geW91IGZpcnN0IHNldCBuYW5vc2Vjb25kcyBhbmQgdGhl
biBzZXQgc2Vjb25kcy4NCj4gPj4NCj4gPj4gVGhpcyB3aWxsIG1ha2UgbW9yZSBvYnZpb3VzIHRo
YXQgdGhpcyBpcyBub3QgYSBtaXN0YWtlIGFuZCAic2Vjb25kcyINCj4gPj4gd2lsbCBiZSBjbG9z
ZXIgdG8gdGhlIGRvX2RpdigpIGJlbG93Lg0KPiA+IElzIGl0IG9rIHRvIHJlbW92ZSBkb19kaXYg
YW5kIHdyaXRlIGxpa2UgYmVsb3c/DQo+ID4gZC0+YXJjaC52aXJ0X3RpbWVyX2Jhc2UubmFub3Nl
Y29uZHMgPQ0KPiA+IHRpY2tzX3RvX25zKGQtPmFyY2gudmlydF90aW1lcl9iYXNlLm9mZnNldCAt
IGJvb3RfY291bnQpOw0KPiA+IGQtPnRpbWVfb2Zmc2V0LnNlY29uZHMgPSBkLT5hcmNoLnZpcnRf
dGltZXJfYmFzZS5uYW5vc2Vjb25kcyAvDQo+ID4gMTAwMDAwMDAwMDsNCj4gDQo+IFRoZSBpbXBs
ZW1lbnRhdGlvbiBtdXN0IHVzZSBkb19kaXYgdG8gcHJvcGVybHkgaGFuZGxlIHRoZSBkaXZpc2lv
biBmcm9tIGENCj4gNjRiaXQgYnkgYSAzMmJpdCBvbiBhcm0zMiBvdGhlcndpc2UgdGhlIGNvZGUg
d2lsbCBiZSBhIGxvdCBzbG93ZXIuDQoNClRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbiBmb3Ig
dGhpcy4gSSB3aWxsIGtlZXAgdGhlIGRvX2Rpdi4gDQoNCkJlc3Qgd2lzaGVzDQpKaWFtZWkgWGll
DQoNCg0KPiANCj4gQ2hlZXJzDQo+IEJlcnRyYW5kDQo+IA0KDQo=

