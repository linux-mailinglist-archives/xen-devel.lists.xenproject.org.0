Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA15618E59
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 03:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437242.691473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqmcW-0000Xq-Ma; Fri, 04 Nov 2022 02:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437242.691473; Fri, 04 Nov 2022 02:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqmcW-0000VU-Hr; Fri, 04 Nov 2022 02:39:48 +0000
Received: by outflank-mailman (input) for mailman id 437242;
 Fri, 04 Nov 2022 02:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKjc=3E=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqmcU-0000VO-Ph
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 02:39:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f160d7ba-5be9-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 03:39:45 +0100 (CET)
Received: from AS9PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:20b:46a::9)
 by AS1PR08MB7500.eurprd08.prod.outlook.com (2603:10a6:20b:4db::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 02:39:35 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::73) by AS9PR04CA0059.outlook.office365.com
 (2603:10a6:20b:46a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 02:39:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 02:39:34 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 04 Nov 2022 02:39:34 +0000
Received: from 444d75fd1051.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 25754052-EEE1-4E30-AF55-1EF2AFDEB121.1; 
 Fri, 04 Nov 2022 02:39:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 444d75fd1051.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 02:39:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6279.eurprd08.prod.outlook.com (2603:10a6:20b:294::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 02:39:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Fri, 4 Nov 2022
 02:39:27 +0000
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
X-Inumbo-ID: f160d7ba-5be9-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hPuDz7v8XI82wbDP2bNNucO3b8Px8nAjSkzyprxVkQOWgd1op1DvcmR0ZL2r0EYKK0T/4qSnDSMmYaUc6xX8EYt49zFYTHImMQa+rtld5DXMNp4FtbX8YKVgQuHlsesht5FLBBQGNISbmTd0KsG2ETdwHXAdE98Wr0qxmJizhqpUsoH/jsUF3wM6/IQtPpToMciMxT3NFYP3bv8UFGsekS2t9MYB2U2DxtNrmIOProVE4JdbdbJzX5OpoVBFjiI68A8dD2/++T8BPwSCzIaeQUO0OjqT6LZ99Z7MvGsDtcAdSpEDXXCWEQk01M/oGp5fzoXSPUdf422qnt6FZJnCRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKLhjeN6o45WTc5+DVVRmL+vTCD6wVUety8LtgAKsn4=;
 b=JMwm+9rpSccCwaE7NTUklSX/XzVwLd6VXYBuBZ4mm8OSR9NFghsyNKx/5AGWHH6WJ82w6JlpT+Kx3ZTasgERUiSCnMLFc5QhBOboorrvBomA0bqUfkyEBYINGUblkzcL8GTyp/YC2t25rsw0XiTANBXwZcmrdwxiarIoiIpRXtDTnDnh5jwhGvhtUMFF8WtHvPRdFyGWBGAPFXvV/UOUvk8iirXtc+7ODzTkobwsy5lT7dLmTFfHNOh4e7Q2v3gj7nGKGxCBJzY7oRot2e8sUB2GdS9ApMU2fajKZvMglAMXKeDnF5cuszStYgeiuKR+6Ano4urIDMwEKk2C0yGi8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKLhjeN6o45WTc5+DVVRmL+vTCD6wVUety8LtgAKsn4=;
 b=mAvQnigZBx9+fbiQOgbFjIYpiDMY6YPGgwZLdT9WePZzu4DQQRO5j0dc/lMnik7IUU9j5zLs819TRgZ+NrF+BF6X9yybq7KpWCjV1/IeqaBLXOIHBN7RiJrCMiqy6FlYewK0fOt0ZYmiUHZhIp+b3ijUwRgWjrNd8OWPMp4gA/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JF3V/OSXKNeRKTDwFM/JL4DzAYD7ovpGlx1JMrJe1iGl+skP1BXf3KhkR2eZPEhQiCyvhhHASzm3yifm6CQYL9MTc+iiBoeEHQVCnMjkx6/C1CKbAEfZjC7rieRBIO8ECu0mMignfznVQLcmnb5dSd6dU6sJAAH77Ryx1T114XJA7eFuzs1TJoFX1F5XWXewm3Ikyw/lJdCdeS9MUIoL81Ye5Khpy1UEtTT1tdtcmV/8DDkcwi9z68U7aEGyGg5gjTOfOBuoKLAhuERIMjWfWtjtCBCIDNwDSe2is304ixizfA+W9VAqP1z4at1Ze0cIPK7xCSbi05Q43mVqRRiBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKLhjeN6o45WTc5+DVVRmL+vTCD6wVUety8LtgAKsn4=;
 b=BhvCNIYWi92knEbK5R0c+RdHbay8D3F96yi3NHJNf72JmTI91LvHdNMUUuLEFNa/lJcz/q3ZRzHjHDMWKByc8IASQeHb6Ltz7GKTKvp+GVkgbdWHCjn5x+QOEysy3xjBCCale3Nd6xyJoVkvF1/pX/M5Va28uJ8bskFWcyPLgbUpkqBdE8Jdqu0ektG93AwTZjVCIO3Rdy3M1Rq1/kaDuQdq8fpOMBEt+72W6ttHzlQxhLywSXyhc/gKMTo8NNNjhdSvej2Hpcq5fGXnfCYzpUqU3elF+Tma5yx33CGqOHpD/Bj+S6RvkFuXeirnv9sPVAWvFWKc2ayPDSjg6z2QFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKLhjeN6o45WTc5+DVVRmL+vTCD6wVUety8LtgAKsn4=;
 b=mAvQnigZBx9+fbiQOgbFjIYpiDMY6YPGgwZLdT9WePZzu4DQQRO5j0dc/lMnik7IUU9j5zLs819TRgZ+NrF+BF6X9yybq7KpWCjV1/IeqaBLXOIHBN7RiJrCMiqy6FlYewK0fOt0ZYmiUHZhIp+b3ijUwRgWjrNd8OWPMp4gA/I=
From: Henry Wang <Henry.Wang@arm.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH v8 2/2] drivers/char: suspend handling in XHCI console
 driver
Thread-Topic: [PATCH v8 2/2] drivers/char: suspend handling in XHCI console
 driver
Thread-Index: AQHY1Agq3zcKCbhszkCMLD93E3RjZK4uRM4g
Date: Fri, 4 Nov 2022 02:39:26 +0000
Message-ID:
 <AS8PR08MB7991EDFFD6E1704704EC5BD1923B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
 <5ebc3a1176fcb9f1e4852826edfe67fe62062d05.1664458360.git-series.marmarek@invisiblethingslab.com>
In-Reply-To:
 <5ebc3a1176fcb9f1e4852826edfe67fe62062d05.1664458360.git-series.marmarek@invisiblethingslab.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D2E23BAE300A474E8A931BA905305220.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6279:EE_|AM7EUR03FT018:EE_|AS1PR08MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: cee3a09d-7808-4442-cb89-08dabe0dcf69
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2rk33ski/B6YK4kbZzLgHcVImd7D/Wn5llJRasmF2uRIn1DmiIt/rBHDxw+qFSuhdfKFxWSAWJOHW6eyQOo/ifOAlKgobydnUCkcgD2aJcbqhGImKVUiiugfbFfPqfmZGI7ma7GIdpquvKXQ6EPN4sTcCZWPHUNxAtvJ5pVBUAFj2meo059jJQOsx9fO/0Uyu3RM/hVS2xJp/84gZ7eZtcP4nnHNBF54i0w+Ir6iiBf+5HAJatsXbkEcHoiwAOi7M44upBesFMZOkH/k1h4SeYADRGOVzl+QZMM0ddi0ACVUMZadRJhsXs+gBeGi+XodaLE10/LyjpGIdNN0zCDrxg+TGof5+hqgx07eXVWzjEdPKBRIeMZYXsGieHi8pprNjTJ7cbk5lZk7jpwq96b6ltpr0YF8Lw1UrhJghRJkYY4ZZlKbxCwE1U7jp6Cnj2bxXfet2bnSrvp6DzgmU04neKwOeF+OV8YVqTFGXy0tlUkINfiGUuC0GU2XzXNfyDpZ/tlV2q43nG9nIhN1DHqDd/p2df6IkHetCzB4iMUEyggZhk17L8m0qxXzO5vNUAGM2kiF5KVZh23pjHGH4xxq14Xwxjyk+ELvkk8OLV0QeIyLrKWVeLGldLbkzQ1DhWtKOUe1XFLwRgFJ5sC6TspHAdg5XgbLOPRaDq5b5YZm+J090uTwCnEI6nwZi4ET/oTCfVrZb82tGxRPiONs5EbzT0jLayqwaudpf4bRtJuQS1/Ts8z3MleP/f9WeKGWQ/vhPd6v5ME67GEDdwCtJCFdaA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199015)(55016003)(66574015)(83380400001)(33656002)(38070700005)(86362001)(122000001)(5660300002)(38100700002)(2906002)(41300700001)(8676002)(54906003)(52536014)(4326008)(7696005)(66446008)(66556008)(6506007)(66476007)(64756008)(76116006)(110136005)(186003)(66946007)(9686003)(8936002)(26005)(316002)(71200400001)(15650500001)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fc776374-2bf9-4e5c-ae63-08dabe0dcab0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b7qHpeptOJzfOgnmQPAJn0s4BEzVnH0jC7kphsfJ66xnyz9GcjUei8qWOQYPsOv7V8t+75RY/0BeWvYEmR9xQkCswP2v+O2EwpxAvT7iZNSSV4Nopwx7CdbiPWNOMt9h+tg2+r0QV+gZ6HYNhKDUqx6ddixG7g9sHfRKV/cAM2niKTs4eLbpz6sTyg40N+6nX+tu+M4JfVTCBiGDYYCwsfLmDWuOBEsdspy3uIaQp0GbWX/tUELJc2Zv0LCOvNl9Gx/Vl5WTekGqIfk92MRR9TtO+Lvlo2P+xjZLmHkg0Qug4JlT/Vb+S7mja2uigUJAPUe9QbCM0LgMEC+QxiXwoJZ0YycfFJbLz6eoYpMaPnJYj8ckZ7jT0KUyVsEVHmIVf0IUc7OwOpWmaIaEJol+A8lk8iMNKTcrFmT+P8ZDrHGEUnronvmktBC+svB31824f/TrLl27boCtxwEu37D6oHWLCHnqNO5UitXfempcHMBdvspFHnaQnqIzpRGMSQJJE9LoLBXAfARZJ9WWweTKBJxV2gFoRYlBYxHN7wswIADHKTNaH1Idf+EmVyBJMZBV/OGlaSzbkmOyKS2snw2qA8FsjLzUQsRfIuAAMaWAYzACy+FcAWwndDE3HHoq5mQoQMxlc1PRBttA4rT2e3x1Axuck6/90LYnt+atpoi1hUrsLCBHMUA/K+iP9ceYwyu+dt3VCpyPGJGNQJGgZQ4uMaHrry7aVkt344+Qur/P7ahhC/fCMFtLmbRElnjw299frPxGwUaX329C2OWAm4u9lg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(33656002)(81166007)(186003)(47076005)(66574015)(86362001)(356005)(36860700001)(82740400003)(2906002)(5660300002)(9686003)(70206006)(70586007)(52536014)(4326008)(15650500001)(41300700001)(7696005)(6506007)(82310400005)(110136005)(336012)(54906003)(26005)(316002)(40460700003)(8676002)(8936002)(55016003)(478600001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 02:39:34.8922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cee3a09d-7808-4442-cb89-08dabe0dcf69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7500

SGkgTWFyZWssDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRl
dmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9m
DQo+IFN1YmplY3Q6IFtQQVRDSCB2OCAyLzJdIGRyaXZlcnMvY2hhcjogc3VzcGVuZCBoYW5kbGlu
ZyBpbiBYSENJIGNvbnNvbGUNCj4gZHJpdmVyDQo+IA0KPiBTaW1pbGFyIHRvIHRoZSBFSENJIGRy
aXZlciAtIHNhdmUvcmVzdG9yZSByZWxldmFudCBCQVIgYW5kIGNvbW1hbmQNCj4gcmVnaXN0ZXIs
IHJlLWNvbmZpZ3VyZSBEYkMgb24gcmVzdW1lIGFuZCBzdG9wL3N0YXJ0IHRpbWVyLg0KPiBPbiBy
ZXN1bWUgdHJpZ2dlciBzZW5kaW5nIGFueXRoaW5nIHRoYXQgd2FzIHF1ZXVlZCBpbiB0aGUgbWVh
bnRpbWUuDQo+IFNhdmUgZnVsbCBCQVIgdmFsdWUsIGluc3RlYWQgb2YganVzdCB0aGUgYWRkcmVz
cyBwYXJ0LCB0byBlYXNlIHJlc3RvcmluZw0KPiBvbiByZXN1bWUuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kNCj4gPG1hcm1hcmVrQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+DQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQoNCkFzIHBlciBNYXRyaXggZGlzY3Vzc2lvbiwgdGhpcyBpcyB0aGUgb25seSBvbmUgbGVmdCBp
biB0aGlzIHNlcmllcyBhbmQNCmFjY29yZGluZyB0byBBbmRyZXcsIHRoaXMgcGF0Y2ggd2FzIGFs
cmVhZHkgYWNrZWQgYW5kIGVudGlyZWx5DQpjb250YWluZWQgd2l0aGluIHRoZSBuZXcgZHJpdmVy
IGl0c2VsZiwgZml4aW5nIGEgcmVhbCBidWcsIHNvIGlmIG5vDQpvYmplY3Rpb25zIGZyb20gb3Ro
ZXIgbWFpbnRhaW5lcnM6DQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5Lldh
bmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KDQo+IC0tLQ0KPiBDaGFuZ2Vz
IGluIHY4Og0KPiAgLSBtb3ZlICdib29sIHN1c3BlbmRlZCcgdG8gb3RoZXIgYm9vbHMNCj4gTmV3
IGluIHY3DQo+IA0KPiBXaXRob3V0IHRoaXMgcGF0Y2gsIHRoZSBjb25zb2xlIGlzIGJyb2tlbiBh
ZnRlciBTMywgYW5kIGluIHNvbWUgY2FzZXMNCj4gdGhlIHN1c3BlbmQgZG9lc24ndCBzdWNjZWVk
IGF0IGFsbCAod2hlbiB4aGNpIGNvbnNvbGUgaXMgZW5hYmxlZCkuDQo+IA0KPiBWZXJ5IHNpbWls
YXIgKGlmIG5vdCB0aGUgc2FtZSkgZnVuY3Rpb25zIG1pZ2h0IGJlIHVzZWQgZm9yIGNvb3JkaW5h
dGVkDQo+IHJlc2V0IGhhbmRsaW5nLiBJIHRyaWVkIHRvIGluY2x1ZGUgaXQgaW4gdGhpcyBwYXRj
aCB0b28sIGJ1dCBpdCdzIGEgYml0DQo+IG1vcmUgaW52b2x2ZWQsIG1vc3RseSBkdWUgdG8gc2hh
cmU9eWVzIGNhc2UgKFBIWVNERVZPUF9kYmdwX29wIGNhbiBiZQ0KPiBjYWxsZWQgYnkgdGhlIGhh
cmR3YXJlIGRvbWFpbiBvbmx5KS4NCj4gLS0tDQo+ICB4ZW4vZHJpdmVycy9jaGFyL3hoY2ktZGJj
LmMgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvY2hhci94aGNpLWRiYy5jIGIveGVuL2RyaXZlcnMvY2hhci94aGNp
LWRiYy5jDQo+IGluZGV4IDQzZWQ2NGEwMDRlMi4uODZmNmRmNmJlZjY3IDEwMDY0NA0KPiAtLS0g
YS94ZW4vZHJpdmVycy9jaGFyL3hoY2ktZGJjLmMNCj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci94
aGNpLWRiYy5jDQo+IEBAIC0yNTEsMTQgKzI1MSwxNyBAQCBzdHJ1Y3QgZGJjIHsNCj4gICAgICBz
dHJ1Y3QgeGhjaV9zdHJpbmdfZGVzY3JpcHRvciAqZGJjX3N0cjsNCj4gDQo+ICAgICAgcGNpX3Ni
ZGZfdCBzYmRmOw0KPiAtICAgIHVpbnQ2NF90IHhoY19tbWlvX3BoeXM7DQo+ICsgICAgdWludDY0
X3QgYmFyX3ZhbDsNCj4gICAgICB1aW50NjRfdCB4aGNfZGJjX29mZnNldDsNCj4gICAgICB2b2lk
IF9faW9tZW0gKnhoY19tbWlvOw0KPiANCj4gICAgICBib29sIGVuYWJsZTsgLyogd2hldGhlciBk
YmdwPXhoY2kgd2FzIHNldCBhdCBhbGwgKi8NCj4gICAgICBib29sIG9wZW47DQo+ICsgICAgYm9v
bCBzdXNwZW5kZWQ7DQo+ICAgICAgZW51bSB4aGNpX3NoYXJlIHNoYXJlOw0KPiAgICAgIHVuc2ln
bmVkIGludCB4aGNfbnVtOyAvKiBsb29rIGZvciBuLXRoIHhoYyAqLw0KPiArICAgIC8qIHN0YXRl
IHNhdmVkIGFjcm9zcyBzdXNwZW5kICovDQo+ICsgICAgdWludDE2X3QgcGNpX2NyOw0KPiAgfTsN
Cj4gDQo+ICBzdGF0aWMgdm9pZCAqZGJjX3N5c19tYXBfeGhjKHVpbnQ2NF90IHBoeXMsIHNpemVf
dCBzaXplKQ0KPiBAQCAtMzU4LDggKzM2MSw5IEBAIHN0YXRpYyBib29sIF9faW5pdCBkYmNfaW5p
dF94aGMoc3RydWN0IGRiYyAqZGJjKQ0KPiANCj4gICAgICBwY2lfY29uZl93cml0ZTE2KGRiYy0+
c2JkZiwgUENJX0NPTU1BTkQsIGNtZCk7DQo+IA0KPiAtICAgIGRiYy0+eGhjX21taW9fcGh5cyA9
IChiYXIwICYgUENJX0JBU0VfQUREUkVTU19NRU1fTUFTSykgfCAoYmFyMQ0KPiA8PCAzMik7DQo+
IC0gICAgZGJjLT54aGNfbW1pbyA9IGRiY19zeXNfbWFwX3hoYyhkYmMtPnhoY19tbWlvX3BoeXMs
DQo+IHhoY19tbWlvX3NpemUpOw0KPiArICAgIGRiYy0+YmFyX3ZhbCA9IGJhcjAgfCAoYmFyMSA8
PCAzMik7DQo+ICsgICAgZGJjLT54aGNfbW1pbyA9IGRiY19zeXNfbWFwX3hoYyhkYmMtPmJhcl92
YWwgJg0KPiBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgeGhjX21taW9fc2l6ZSk7DQo+IA0KPiAgICAgIGlmICggZGJjLT54
aGNfbW1pbyA9PSBOVUxMICkNCj4gICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiBAQCAtOTc5LDYg
Kzk4Myw5IEBAIHN0YXRpYyBib29sIGRiY19lbnN1cmVfcnVubmluZyhzdHJ1Y3QgZGJjICpkYmMp
DQo+ICAgICAgdWludDMyX3QgY3RybDsNCj4gICAgICB1aW50MTZfdCBjbWQ7DQo+IA0KPiArICAg
IGlmICggZGJjLT5zdXNwZW5kZWQgKQ0KPiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICsNCj4g
ICAgICBpZiAoIGRiYy0+c2hhcmUgIT0gWEhDSV9TSEFSRV9OT05FICkNCj4gICAgICB7DQo+ICAg
ICAgICAgIC8qDQo+IEBAIC0xMjEzLDkgKzEyMjAsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGNm
X2NoZWNrDQo+IGRiY191YXJ0X2luaXRfcG9zdGlycShzdHJ1Y3Qgc2VyaWFsX3BvcnQgKnBvcnQp
DQo+ICAgICAgICogcGFnZSwgc28ga2VlcCBpdCBzaW1wbGUuDQo+ICAgICAgICovDQo+ICAgICAg
aWYgKCByYW5nZXNldF9hZGRfcmFuZ2UobW1pb19yb19yYW5nZXMsDQo+IC0gICAgICAgICAgICAg
ICAgUEZOX0RPV04odWFydC0+ZGJjLnhoY19tbWlvX3BoeXMgKyB1YXJ0LQ0KPiA+ZGJjLnhoY19k
YmNfb2Zmc2V0KSwNCj4gLSAgICAgICAgICAgICAgICBQRk5fVVAodWFydC0+ZGJjLnhoY19tbWlv
X3BoeXMgKyB1YXJ0LT5kYmMueGhjX2RiY19vZmZzZXQgKw0KPiAtICAgICAgICAgICAgICAgICAg
ICAgICBzaXplb2YoKnVhcnQtPmRiYy5kYmNfcmVnKSkgLSAxKSApDQo+ICsgICAgICAgICAgICAg
ICAgUEZOX0RPV04oKHVhcnQtPmRiYy5iYXJfdmFsICYNCj4gUENJX0JBU0VfQUREUkVTU19NRU1f
TUFTSykgKw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgIHVhcnQtPmRiYy54aGNfZGJjX29m
ZnNldCksDQo+ICsgICAgICAgICAgICAgICAgUEZOX1VQKCh1YXJ0LT5kYmMuYmFyX3ZhbCAmIFBD
SV9CQVNFX0FERFJFU1NfTUVNX01BU0spICsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdWFy
dC0+ZGJjLnhoY19kYmNfb2Zmc2V0ICsNCj4gKyAgICAgICAgICAgICAgICBzaXplb2YoKnVhcnQt
PmRiYy5kYmNfcmVnKSkgLSAxKSApDQo+ICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTw0KPiAg
ICAgICAgICAgICAgICAgIkVycm9yIHdoaWxlIGFkZGluZyBNTUlPIHJhbmdlIG9mIGRldmljZSB0
byBtbWlvX3JvX3Jhbmdlc1xuIik7DQo+ICAjZW5kaWYNCj4gQEAgLTEyNTUsNiArMTI2NCwzOCBA
QCBzdGF0aWMgdm9pZCBjZl9jaGVjayBkYmNfdWFydF9mbHVzaChzdHJ1Y3QNCj4gc2VyaWFsX3Bv
cnQgKnBvcnQpDQo+ICAgICAgICAgIHNldF90aW1lcigmdWFydC0+dGltZXIsIGdvYWwpOw0KPiAg
fQ0KPiANCj4gK3N0YXRpYyB2b2lkIGNmX2NoZWNrIGRiY191YXJ0X3N1c3BlbmQoc3RydWN0IHNl
cmlhbF9wb3J0ICpwb3J0KQ0KPiArew0KPiArICAgIHN0cnVjdCBkYmNfdWFydCAqdWFydCA9IHBv
cnQtPnVhcnQ7DQo+ICsgICAgc3RydWN0IGRiYyAqZGJjID0gJnVhcnQtPmRiYzsNCj4gKw0KPiAr
ICAgIGRiY19wb3BfZXZlbnRzKGRiYyk7DQo+ICsgICAgc3RvcF90aW1lcigmdWFydC0+dGltZXIp
Ow0KPiArICAgIGRiYy0+cGNpX2NyID0gcGNpX2NvbmZfcmVhZDE2KGRiYy0+c2JkZiwgUENJX0NP
TU1BTkQpOw0KPiArICAgIGRiYy0+c3VzcGVuZGVkID0gdHJ1ZTsNCj4gK30NCj4gKw0KPiArc3Rh
dGljIHZvaWQgY2ZfY2hlY2sgZGJjX3VhcnRfcmVzdW1lKHN0cnVjdCBzZXJpYWxfcG9ydCAqcG9y
dCkNCj4gK3sNCj4gKyAgICBzdHJ1Y3QgZGJjX3VhcnQgKnVhcnQgPSBwb3J0LT51YXJ0Ow0KPiAr
ICAgIHN0cnVjdCBkYmMgKmRiYyA9ICZ1YXJ0LT5kYmM7DQo+ICsNCj4gKyAgICBwY2lfY29uZl93
cml0ZTMyKGRiYy0+c2JkZiwgUENJX0JBU0VfQUREUkVTU18wLCBkYmMtPmJhcl92YWwgJg0KPiAw
eEZGRkZGRkZGKTsNCj4gKyAgICBwY2lfY29uZl93cml0ZTMyKGRiYy0+c2JkZiwgUENJX0JBU0Vf
QUREUkVTU18xLCBkYmMtPmJhcl92YWwgPj4gMzIpOw0KPiArICAgIHBjaV9jb25mX3dyaXRlMTYo
ZGJjLT5zYmRmLCBQQ0lfQ09NTUFORCwgZGJjLT5wY2lfY3IpOw0KPiArDQo+ICsgICAgaWYgKCAh
ZGJjX2luaXRfZGJjKGRiYykgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgZGJjX2Vycm9yKCJyZXN1
bWUgZmFpbGVkXG4iKTsNCj4gKyAgICAgICAgcmV0dXJuOw0KPiArICAgIH0NCj4gKw0KPiArICAg
IGRiY19lbmFibGVfZGJjKGRiYyk7DQo+ICsgICAgZGJjLT5zdXNwZW5kZWQgPSBmYWxzZTsNCj4g
KyAgICBkYmNfZmx1c2goZGJjLCAmZGJjLT5kYmNfb3JpbmcsICZkYmMtPmRiY19vd29yayk7DQo+
ICsgICAgc2V0X3RpbWVyKCZ1YXJ0LT50aW1lciwgTk9XKCkgKyBNSUNST1NFQ1MoREJDX1BPTExf
SU5URVJWQUwpKTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHN0cnVjdCB1YXJ0X2RyaXZlciBkYmNf
dWFydF9kcml2ZXIgPSB7DQo+ICAgICAgLmluaXRfcHJlaXJxID0gZGJjX3VhcnRfaW5pdF9wcmVp
cnEsDQo+ICAgICAgLmluaXRfcG9zdGlycSA9IGRiY191YXJ0X2luaXRfcG9zdGlycSwNCj4gQEAg
LTEyNjIsNiArMTMwMyw4IEBAIHN0YXRpYyBzdHJ1Y3QgdWFydF9kcml2ZXIgZGJjX3VhcnRfZHJp
dmVyID0gew0KPiAgICAgIC5wdXRjID0gZGJjX3VhcnRfcHV0YywNCj4gICAgICAuZ2V0YyA9IGRi
Y191YXJ0X2dldGMsDQo+ICAgICAgLmZsdXNoID0gZGJjX3VhcnRfZmx1c2gsDQo+ICsgICAgLnN1
c3BlbmQgPSBkYmNfdWFydF9zdXNwZW5kLA0KPiArICAgIC5yZXN1bWUgPSBkYmNfdWFydF9yZXN1
bWUsDQo+ICB9Ow0KPiANCj4gIC8qIFRob3NlIGFyZSBhY2Nlc3NlZCB2aWEgRE1BLiAqLw0KPiAt
LQ0KPiBnaXQtc2VyaWVzIDAuOS4xDQoNCg==

