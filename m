Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540EE80A300
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 13:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650607.1016304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBZnl-0000SO-II; Fri, 08 Dec 2023 12:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650607.1016304; Fri, 08 Dec 2023 12:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBZnl-0000QP-De; Fri, 08 Dec 2023 12:17:53 +0000
Received: by outflank-mailman (input) for mailman id 650607;
 Fri, 08 Dec 2023 12:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBZnk-0000Pd-G2
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 12:17:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc4e37e6-95c3-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 13:17:47 +0100 (CET)
Received: from AS9PR06CA0185.eurprd06.prod.outlook.com (2603:10a6:20b:45d::6)
 by DU0PR08MB9582.eurprd08.prod.outlook.com (2603:10a6:10:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 12:17:43 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:45d:cafe::a) by AS9PR06CA0185.outlook.office365.com
 (2603:10a6:20b:45d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28 via Frontend
 Transport; Fri, 8 Dec 2023 12:17:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 12:17:42 +0000
Received: ("Tessian outbound 26ee1d40577c:v228");
 Fri, 08 Dec 2023 12:17:42 +0000
Received: from a691f3392ef4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A34C2FE-66FA-4BC0-985A-34E98A11BB95.1; 
 Fri, 08 Dec 2023 12:17:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a691f3392ef4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 12:17:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7653.eurprd08.prod.outlook.com (2603:10a6:20b:4cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 12:17:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 12:17:34 +0000
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
X-Inumbo-ID: cc4e37e6-95c3-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EoAUl6Z+smPzfYYI/1X9Z8g8Ezh1mU3ZAgyhbZ2BuRUnPhEORIhP8Cw86wUc505VcX3eQjH6OHcX6LA2ZPCdh2r2oOQVnhDsltiFbS+x63ILcWmiL/8ZYGX4Rmmukm8mdyE+PrJMLHm0YR/ABXyo5X3qypPQdIp+qXJGSbcUw8KfdklnMCZ1qzOctSbCPm5kVVxB1lJcI5sep+Rvt/FUICz81TimTuF4kK32IvjFR/tRt1zUrpnG5C1JR85YIOEQ5vxsXcuN7CJspgwBu4PpzuRohSOW7zp9PWdVAOHrIvKbB9+u547TQSZkAlL3fP1tXxrrR/o4XPnoRPE2uKLggw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwGDt1w4oiea6jPH0q9wgRDo8KSF8ZhzqkJX98j04A8=;
 b=B8XZJMR4RtLlbfhM/3stuf0KRViFIRKZ8bxQx5U5mKqi+JmubVY/BwoTvLbw31PXDuGQTt9+TIuw8a+d4GRED7GdobLaqWLJfqVkalr8/kM+m10XW2yO0hxc6wTc/DL/QUjXCzM8GZZYDoWmKYQqZ/AQOzJHr8q1ZbKdLAT1MeTGVr6jRvlnn6ijsD2/Dkl4HDO9tl3NwACTVP1eVwjvayWpH53LWJr8FJYG0IiFvofLYMcG18fyCau90uWEzrcJT+Vn1DO/qWlZcKa7IDSHtFoFDXZF+o39fRUzOPhBwm66Ru7zTd8s3cVQQYGotIRMBwWkz/jeNcN8Na0Sse6dGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwGDt1w4oiea6jPH0q9wgRDo8KSF8ZhzqkJX98j04A8=;
 b=qW0pja20eoYCdBHLjNd8ou3NZkehnBh9CGO687CESR6tjPLDwSrEN8ldrs7xj41VTBhGyy5p0AAU+l/m3IfdE2Y01VZA1ZR5EEYCRjkHR6b/IuA9DV9bSHlwqSe2DtfhwiPE7GCljAkiNvCVYzl2MbrRewCZqiNqYs/79sZEgok=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e394adabb40f72a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZ241DnD7PW0c+XDnkSrkrUGjMJ5cgkz5cPlryEmaBZtLBIHbs+j3yhgu9A2TyU33KDwJY0Eq7r+GgFbJtlRQqK0y2RIHTZUdt/01weTYVh8eGJd9hrUFrV+r8N+ajFGb7R3BwxFLLoA602u2aHjP20E6kIijCsXWBiMdGn7odvx1xBsDH98hYLzF3HNntpMoudxPjESBdNl1piOAoShKLD0GPB+faI4LLuWJJ29ebZnNHhhvgVRRv2EG4x7y0tfeHDfaH67RUyYJ5+IPxCFfWaXyFGEiBF1t/O2yOWqA6V4JUWhPFynjfq+vcZ6Uxdw68TyBDiq4GSUYbM13Lq7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwGDt1w4oiea6jPH0q9wgRDo8KSF8ZhzqkJX98j04A8=;
 b=IouefIVqi+h4dxJi86e98SwZVuVXaEbth6W9D7kl1tObdXAZzvo+26y6KfWhyhnyd+t1OF5gxIDf/hqFPoE0OkL4W3G9OudZ90vrJOlStNA665rmwjYQQHZeiH5g8f5y0wu7A89Rx6Eo2x97GeJkS/NBnFI+Gw/T0esi3S20M96SjHNbO3DGSuGSq27KQsYcteuL7NERRHe45jRX15ydPA+3GEoycvIFhfsrkfba5AVw52kjYMs1OnoxGt5GDwHAvdwduEl5OEwIVz3/EJO/X0vCnzS7QBe5hb8VCXn4Sf3JnybqhSNjdfSeNz0rSgN+E7Z8+5p2zUX4MsaX/Kty3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwGDt1w4oiea6jPH0q9wgRDo8KSF8ZhzqkJX98j04A8=;
 b=qW0pja20eoYCdBHLjNd8ou3NZkehnBh9CGO687CESR6tjPLDwSrEN8ldrs7xj41VTBhGyy5p0AAU+l/m3IfdE2Y01VZA1ZR5EEYCRjkHR6b/IuA9DV9bSHlwqSe2DtfhwiPE7GCljAkiNvCVYzl2MbrRewCZqiNqYs/79sZEgok=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Topic: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Index:
 AQHaKZoAVIHO2rCYDECWUL8sUR2sfLCfFe6AgAACFwCAAAHkAIAAAsIAgAAIGgCAACWygIAAA1IA
Date: Fri, 8 Dec 2023 12:17:34 +0000
Message-ID: <5E874DF6-4766-4925-AC62-F30AE191B249@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
 <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
 <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
 <0554806a-35c2-4abb-aa3c-3bab104c6c61@amd.com>
 <B9AFD918-42F6-4190-963B-E5A639D9F60E@arm.com>
 <2f34c0ec-0d94-48e2-bec0-faa96e1702f1@amd.com>
 <8f0a66e9-70bc-421e-8069-88fed9dee4ed@xen.org>
In-Reply-To: <8f0a66e9-70bc-421e-8069-88fed9dee4ed@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7653:EE_|AMS0EPF000001A4:EE_|DU0PR08MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 90806abc-c3d7-4996-681e-08dbf7e7add8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 37XP3kqvyt4batZHbiS8Wft7LWHp19KrfNGoWmsTyPri0j84fpQ5m3NwLWT/ex0ZtEpBa87lLdCUENh6N/cspAlq8EClqpnAJouHss2pQWsvHhNmIiZU6x0TPQtl7s+vbTRf+3qQqmcDvniI03VKxbGa3D8BxFXnXzLt6n+lGQb1O4jURh24mi16VrBsmN/vW3Xyj14KZHVeq+6tQ5Q5q8zwPDfss2FBBQrxuQq8Ku0PFSuM57J2z8oElM05GiBBD6CmSWBCRxmKIjSm4MVCxO3PyTA/+zbOZuiburITxZ8bzhGQI874NHd59hqypAVi9Df7AdM5s0aL72fjCDlejrIY83FsxQNLHR8QHx2ga3jmUlg3GRqWExObNWZ0V9aFfJe74cc9NYFKdc1KQeOuI2IrbmXhgAgfc3EGLUQGdKyrRzgvNfYavt6W2Q0+IZcM/372KgJePU0HGobx3rrecyTHW4bJGTNOfpj2TalguiW7S9PSAY7iVfJK8jijDlnYqUkPyAgVo7Uh5MHV8TsQuCz1yABNS/tH8RJSPKkvhK4pOrbuMhDxH6pYUKHh7WzkrM/Q5IFAvq02oY5xqiZXAj9TpwBXKW1g2I5sNF95ALdIntpXWX5hMzadE/pFZ7C6DtaOOnYO609Mon8if0ddkg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(366004)(346002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(38070700009)(41300700001)(36756003)(86362001)(2906002)(33656002)(71200400001)(2616005)(6512007)(6506007)(53546011)(83380400001)(6486002)(26005)(478600001)(4326008)(8676002)(122000001)(8936002)(6916009)(66446008)(66476007)(66556008)(54906003)(316002)(64756008)(38100700002)(91956017)(66946007)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <12F33D29B597114B88EC0CC2BFF9640B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7653
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b88774db-f88b-47ba-669d-08dbf7e7a8bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ffKx8b6QJQWl2D+u1sF8VbYgA4uIfe1h9icbHbtM/pOc4eKPAxmgjJfQtR5Xo7DI6mPNVMe56iv5YIrdvztiKPlz8fHX1NoyNkkODWuGvbvgOPAqIiBBAJW/89lWsY8mNWHS+haxacwry73KHs+u1IF9N3T7jt5bWzPmmbM+e3eVQpZc8fj/36mU3XOnIcIcQa1FDa0akEHvUSmVF934RwAWm1mbCfklefmYZScbrfD1MRvjitnX1VtvhPhyAm/3oSmmFobHTu3zlFVgYPkzEBJ7uH0rn0XW7mb+wreAj0WqREchzqojP5QNyU/ZahXVjwuDjBnieLOJkvA3PpMKDUIb5myGvmL+hfU8VDtoaSC24Xj7oSltsorUnNzjF5s8a6/5+SljHEYpOsTzHXblu15fQl1kUvgQb2tt0v3J/lNrNMsKvQW2eFRN1+ewqgRJ6sITG1oYudFxLBX23tXmSgO5dwS6cxRw8WbGOptfMb3OLf5wLm5yF0f5qG4XhplGWQ/zbbxL1WWhHuvyXqwBeVebwl5nTMvfc8UwNaVBPhTtuDZBrVPN680bCB1VQ1LTXN2b/DZ18yQiof7nZlVEPGOX92spwoXGB/EyI+ZX/dyZu0xWRPoF9qmKDi9nJeJLMh2Jm36vosoK8jlE6Nbhb9ANu2NiEm2zGv95jlfcHhI9Q96ynvMPBSlK8ZHL+jC4fM6n/UKi2M3JJE6y95MDDi/oIKM4cq5tUrH6Y0PSrjOoP/LM4zHOwpp+cCwnzzf
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(186009)(451199024)(1800799012)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(83380400001)(81166007)(36756003)(41300700001)(40460700003)(33656002)(2906002)(47076005)(356005)(82740400003)(36860700001)(6506007)(6512007)(6486002)(478600001)(53546011)(54906003)(70586007)(40480700001)(86362001)(70206006)(316002)(2616005)(4326008)(6862004)(8676002)(8936002)(26005)(5660300002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 12:17:42.8579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90806abc-c3d7-4996-681e-08dbf7e7add8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9582

SGkgSnVsaWVuLA0KDQo+IE9uIERlYyA4LCAyMDIzLCBhdCAyMDowNSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDA4LzEyLzIwMjMgMDk6
NTAsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+IE9uIDA4LzEyLzIwMjMgMTA6MjEsIEhlbnJ5IFdh
bmcgd3JvdGU6DQo+Pj4+IE9uIERlYyA4LCAyMDIzLCBhdCAxNzoxMSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIDA4LzEyLzIwMjMgMTA6MDUsIEhl
bnJ5IFdhbmcgd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEhpIE1pY2hhbCwNCj4+Pj4+IA0KPj4+Pj4+
IE9uIERlYyA4LCAyMDIzLCBhdCAxNjo1NywgTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1k
LmNvbT4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gSGkgSGVucnksDQo+Pj4+Pj4gDQo+Pj4+Pj4g
T24gMDgvMTIvMjAyMyAwNjo0NiwgSGVucnkgV2FuZyB3cm90ZToNCj4+Pj4+Pj4gZGlmZiAtLWdp
dCBhL2F1dG9tYXRpb24vc2NyaXB0cy9leHBlY3QvZnZwLWJhc2Utc21va2UtZG9tMC1hcm02NC5l
eHAgYi9hdXRvbWF0aW9uL3NjcmlwdHMvZXhwZWN0L2Z2cC1iYXNlLXNtb2tlLWRvbTAtYXJtNjQu
ZXhwDQo+Pj4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNzU1DQo+Pj4+Pj4+IGluZGV4IDAwMDAwMDAw
MDAuLjI1ZDlhNWY4MWMNCj4+Pj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+Pj4+PiArKysgYi9hdXRv
bWF0aW9uL3NjcmlwdHMvZXhwZWN0L2Z2cC1iYXNlLXNtb2tlLWRvbTAtYXJtNjQuZXhwDQo+Pj4+
Pj4+IEBAIC0wLDAgKzEsNzMgQEANCj4+Pj4+Pj4gKyMhL3Vzci9iaW4vZXhwZWN0DQo+Pj4+Pj4+
ICsNCj4+Pj4+Pj4gK3NldCB0aW1lb3V0IDIwMDANCj4+Pj4+PiBEbyB3ZSByZWFsbHkgbmVlZCBz
dWNoIGEgYmlnIHRpbWVvdXQgKH4zMCBtaW4pPw0KPj4+Pj4+IExvb2tpbmcgYXQgeW91ciB0ZXN0
IGpvYiwgaXQgdG9vayAxNiBtaW5zIChxdWl0ZSBhIGxvdCBidXQgSSBrbm93IEZWUCBpcyBzbG93
DQo+Pj4+Pj4gKyBzZW5kX3Nsb3cgc2xvd3MgdGhpbmdzIGRvd24pDQo+Pj4+PiANCj4+Pj4+IFRo
aXMgaXMgYSByZWFsbHkgZ29vZCBxdWVzdGlvbi4gSSBkaWQgaGF2ZSB0aGUgc2FtZSBxdWVzdGlv
biB3aGlsZSB3b3JraW5nIG9uDQo+Pj4+PiB0aGUgbmVnYXRpdmUgdGVzdCB0b2RheS4gVGhlIHRp
bWVvdXQgMjAwMCBpbmRlZWQgd2lsbCBmYWlsIHRoZSBqb2IgYXQgYWJvdXQgMzBtaW4sDQo+Pj4+
PiBhbmQgd2FpdGluZyBmb3IgaXQgaXMgaW5kZWVkIG5vdCByZWFsbHkgcGxlYXNhbnQuDQo+Pj4+
PiANCj4+Pj4+IEJ1dCBteSBzZWNvbmQgdGhvdWdodCB3b3VsZCBiZSAtIGZyb20gbXkgb2JzZXJ2
YXRpb24sIHRoZSBvdmVyYWxsIHRpbWUgbm93DQo+Pj4+PiB3b3VsZCB2YXJ5IGJldHdlZW4gMTVt
aW4gfiAyMG1pbiwgYW5kIGhhdmluZyBhIDEwbWluIG1hcmdpbiBpcyBub3QgdGhhdCBjcmF6eQ0K
Pj4+Pj4gZ2l2ZW4gdGhhdCB3ZSBwcm9iYWJseSB3aWxsIGRvIG1vcmUgdGVzdGluZyBmcm9tIHRo
ZSBqb2IgaW4gdGhlIGZ1dHVyZSwgYW5kIGlmIHRoZQ0KPj4+Pj4gR2l0TGFiIEFybSB3b3JrZXIg
aXMgaGlnaCBsb2FkZWQsIEZWUCB3aWxsIHByb2JhYmx5IGJlY29tZSBzbG93ZXIuIEFuZCBub3Jt
YWxseQ0KPj4+Pj4gd2UgZG9u4oCZdCBldmVuIHRyaWdnZXIgdGhlIHRpbWVvdXQgYXMgdGhlIGpv
YiB3aWxsIG5vcm1hbGx5IHBhc3MuIFNvIEkgZGVjaWRlZA0KPj4+Pj4gdG8ga2VlcCB0aGlzLg0K
Pj4+Pj4gDQo+Pj4+PiBNaW5kIHNoYXJpbmcgeW91ciB0aG91Z2h0cyBhYm91dCB0aGUgYmV0dGVy
IHZhbHVlIG9mIHRoZSB0aW1lb3V0PyBQcm9iYWJseSAyNW1pbj8NCj4+Pj4gRnJvbSB3aGF0IHlv
dSBzYWlkIHRoYXQgdGhlIGF2ZXJhZ2UgaXMgMTUtMjAsIEkgdGhpbmsgd2UgY2FuIGxlYXZlIGl0
IHNldCB0byAzMC4NCj4+Pj4gQnV0IEkgd29uZGVyIGlmIHdlIGNhbiBkbyBzb21ldGhpbmcgdG8g
ZGVjcmVhc2UgdGhlIGF2ZXJhZ2UgdGltZS4gfjIwIG1pbiBpcyBhIGxvdA0KPj4+PiBldmVuIGZv
ciBGVlAgOikgSGF2ZSB5b3UgdHJpZWQgc2V0dGluZyBzZW5kX3Nsb3cgdG8gc29tZXRoaW5nIGxv
d2VyIHRoYW4gMTAwbXM/DQo+Pj4+IFRoYXQgc2FpZCwgd2UgZG9uJ3Qgc2VuZCB0b28gbWFueSBj
aGFycyB0byBGVlAsIHNvIEkgZG91YnQgaXQgd291bGQgcGxheSBhIG1ham9yIHJvbGUNCj4+Pj4g
aW4gdGhlIG92ZXJhbGwgdGltZS4NCj4+PiANCj4+PiBJIGFncmVlIHdpdGggdGhlIHNlbmRfc2xv
dyBwYXJ0LiBBY3R1YWxseSBJIGRvIGhhdmUgdGhlIHNhbWUgY29uY2VybiwgaGVyZSBhcmUgbXkg
Y3VycmVudA0KPj4+IHVuZGVyc3RhbmRpbmcgYW5kIEkgdGhpbmsgeW91IHdpbGwgZGVmaW5pdGVs
eSBoZWxwIHdpdGggeW91ciBrbm93bGVkZ2U6DQo+Pj4gSWYgeW91IGNoZWNrIHRoZSBmdWxsIGxv
ZyBvZiBEb20wIGJvb3RpbmcsIGZvciBleGFtcGxlIFsxXSwgeW91IHdpbGwgZmluZCB0aGF0IHdl
IHdhc3RlZCBzbw0KPj4+IG11Y2ggdGltZSBpbiBzdGFydGluZyB0aGUgc2VydmljZXMgb2YgdGhl
IE9TIChtb2Rsb29wLCB1ZGV2LXNldHRsZSwgZXRjKS4gQWxsIG9mIHRoZXNlIHNlcnZpY2VzDQo+
Pj4gYXJlIHJldHJpZWQgbWFueSB0aW1lcyBidXQgaW4gdGhlIGVuZCB0aGV5IGFyZSBzdGlsbCBu
b3QgdXAsIGFuZCBmcm9tIG15IHVuZGVyc3RhbmRpbmcgdGhleQ0KPj4+IHdvbuKAmXQgYWZmZWN0
IHRoZSBhY3R1YWwgdGVzdCg/KSBJZiB3ZSBjYW4gc29tZWhvdyBnZXQgcmlkIG9mIHRoZXNlIHNl
cnZpY2VzIGZyb20gcm9vdGZzLCBJIHRoaW5rDQo+Pj4gd2UgY2FuIHNhdmUgYSBsb3Qgb2YgdGlt
ZS4NCj4+PiANCj4+PiBBbmQgaG9uZXN0bHksIEkgbm90aWNlZCB0aGF0IHFlbXUtYWxwaW5lLWFy
bTY0LWdjYyBzdWZmZXJzIGZyb20gdGhlIHNhbWUgcHJvYmxlbSBhbmQgaXQgYWxzbw0KPj4+IHRh
a2VzIGFyb3VuZCAxNW1pbiB0byBmaW5pc2guIFNvIGlmIHdlIG1hbmFnZWQgdG8gdGFpbG9yIHRo
ZSBzZXJ2aWNlcyBmcm9tIHRoZSBmaWxlc3lzdGVtLCB3ZQ0KPj4+IGNhbiBzYXZlIGEgbG90IG9m
IHRpbWUuDQo+PiBUaGF0IGlzIG5vdCB0cnVlLiBRZW11IHJ1bnMgdGhlIHRlc3RzIHJlbGF0aXZl
bHkgZmFzdCB3aXRoaW4gZmV3IG1pbnV0ZXMuIFRoZSByZWFzb24geW91IHNlZSBlLmcuIDEyIG1p
bnMNCj4+IGZvciBzb21lIFFlbXUgam9icyBjb21lcyBmcm9tIHRoZSB0aW1lb3V0IHdlIHNldCBp
biBRZW11IHNjcmlwdHMuIFdlIGRvbid0IGhhdmUgeWV0IHRoZSBzb2x1dGlvbiAod2UgY291bGQN
Cj4+IGRvIHRoZSBzYW1lIGFzIFF1YmVzIHNjcmlwdCkgdG8gZGV0ZWN0IHRoZSB0ZXN0IHN1Y2Nl
c3MgZWFybHkgYW5kIGV4aXQgYmVmb3JlIHRpbWVvdXQuIFRoYXQgaXMgd2h5IGN1cnJlbnRseQ0K
Pj4gdGhlIG9ubHkgd2F5IGZvciBRZW11IHRlc3RzIHRvIGZpbmlzaCBpcyBieSByZWFjaGluZyB0
aGUgdGltZW91dC4NCj4+IFNvIHRoZSBwcm9ibGVtIGlzIG5vdCB3aXRoIHRoZSByb290ZnMgYW5k
IHNlcnZpY2VzICh0aGUgaW1wcm92ZW1lbnQgd291bGQgbm90IGJlIHNpZ25pZmljYW50KSBidXQg
d2l0aA0KPj4gdGhlIHNpbXVsYXRpb24gYmVpbmcgc2xvdy4NCj4gDQo+IEZyb20gbXkgZXhwZXJp
ZW5jZSB3aXRoIHRoZSBGVlAgaW1wcm92ZW1lbnQgd291bGQgYmUgc2lnbmlmaWNhbnQuIEEgbm9y
bWFsIGJvb3QgZGlzdHJpYnV0aW9uIHdpbGwgc3RhcnQgYSBsb3Qgb2Ygc2VydmljZXMuIEkgZW5k
IHVwIHRvIHdyaXRlIG15IG93biBpbml0c2NyaXB0IGRvaW5nIHRoZSBiYXJlIG1pbmltdW0gZm9y
IGNyZWF0aW5nIGEgZ3Vlc3QuIFRoaXMgc2F2ZXMgbWUgYSBsb3Qgb2YgdGltZSBldmVyeXRpbWUg
SSBuZWVkZWQgdG8gdGVzdCBvbiBGVlAuDQoNCisxLCBJIGZlZWwgdGhlIHNhbWUsIGJ1dCBJJ3Zl
IG5ldmVyIGRvbmUgdGhlIHRpbWUgbWVhc3VyZW1lbnQgdGhvdWdoLg0KDQo+IEkgdGhpbmsgd2Ug
Y2FuIGRvIHRoZSBzYW1lIGZvciB0aGUgZ2l0bGFiLiBNYXliZSBub3QgdG8gdGhlIHBvaW50IG9m
IHdyaXRpbmcgeW91ciBpbml0c2NyaXB0IGJ1dCBjdXR0aW5nIGRvd24gYW55dGhpbmcgdW5uZWNl
c3NhcnkuDQoNClllYWggSSBjYW4gdHJ5IHRvIHBsYXkgd2l0aCByZW1vdmluZyBzb21lIG9mIHRo
ZSB1bm5lY2Vzc2FyeSBzZXJ2aWNlcyB3aGVuIHByZXBhcmluZyB0aGUgcm9vdGZzDQpmb3IgRG9t
MCAoc2VlIHBhdGNoIDQpLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IFRoaXMgd2lsbCBh
dm9pZCB0aGUgRlZQIHRlc3QgdG8gYmVjb21lIHRoZSBib3R0bG5lY2sgaW4gdGhlIGdpdGxhYiBD
SS4NCj4gDQo+IENoZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

