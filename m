Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4C51B7EE
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 08:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321441.542444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmUul-00033M-BS; Thu, 05 May 2022 06:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321441.542444; Thu, 05 May 2022 06:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmUul-00030D-6v; Thu, 05 May 2022 06:24:39 +0000
Received: by outflank-mailman (input) for mailman id 321441;
 Thu, 05 May 2022 06:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxCF=VN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmUui-000307-RB
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 06:24:37 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe06::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07c72537-cc3c-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 08:24:34 +0200 (CEST)
Received: from AS8PR04CA0114.eurprd04.prod.outlook.com (2603:10a6:20b:31e::29)
 by AM6PR08MB5157.eurprd08.prod.outlook.com (2603:10a6:20b:e8::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 06:24:31 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::5b) by AS8PR04CA0114.outlook.office365.com
 (2603:10a6:20b:31e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25 via Frontend
 Transport; Thu, 5 May 2022 06:24:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 06:24:30 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Thu, 05 May 2022 06:24:30 +0000
Received: from dbbfcfa96db2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 547A895A-7E17-426E-A3DF-CC9D33FA1D51.1; 
 Thu, 05 May 2022 06:24:20 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dbbfcfa96db2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 May 2022 06:24:20 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 06:24:17 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 06:24:17 +0000
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
X-Inumbo-ID: 07c72537-cc3c-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d3Y684bcOr79PPdtZ8HSiseYGEWdV+V8hRpOIJSeLwQiBoDfTiwyB0v3PPSQBXceWuWxGgAW0kHZX/+sHUFzrolpkJhZbIjRqHRh7Unus107ngZz+scVb24sdrNvB7oj9hopMZV5J038eoj/WUoTWKYjqa/g5jLSxrlHNuf8cpql4k6QxpHPzdv0n7AdetznEC0e/6xlu+RXHrATXpn0iKZKJ9+AgePmuw5SVHq4g/4ZC65GWQDZARC6lGkBp0ZN01fCCrDoFyviQFN26BeD8SNAl9WlS7yqHrJqkmT3plzUvo9ylRoSZ4MBnl4qX6tFhnJ1TjlFQLsiNmAQYWa+0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzQe7Cb12yxjblIaJlPcI092brMvHMWkPmc6L4PYCqA=;
 b=HQHHwdKkPYWGuhMzY9ZEpLpOzMT5jQ5pukvpUFD7hkfoZ6jtc3YFzphTTXPd82awA4Zj43tBbalG9qx4seDtjZkGao3GQvA2HXRYYGEtS9bTvz3y3cvK7pGG8JbPumE2tdZeoLdTd+w04uh4OBmh111JAaG+c7t12z53WcI8ngpuhDUZBZhWUO/M2/ssnMrdupv6Adhl9x9iZVbm6EbtuqgjxiRRYJUG8BKN1x1FmXnPwDxr81iX6dvqIsOhW9UUQG7Vs+TLJ7YKTcI9Am+/XpBsJeuAKUxhwniMcHi6nZmtWWPLAThIxWrD4Hx/TWgMb6AGMmyEg3mkfAbvouy3vQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzQe7Cb12yxjblIaJlPcI092brMvHMWkPmc6L4PYCqA=;
 b=oYtEfq0cikChyrHY5/pjOTIrC1AHrUZ4Bd6iibkIPVnCl9AcoAHHQEyI6nUsXs4iUi/+F4P71mJomG/BXilmKxL7WmOeTe0xeBvVZHfL3aGrFGuSqp8MJUrz5DN7d79DCzWBgnmOTqt/6pSFsIwlhlRl9GOIe+zGPLwixBw2J9E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ly14b8uW25XyRSsh/KnxrGFpNrGunA3n87uhYBCikSEwkHq6GVVNEo/HNz77lcmV1Pv6ORHbwRmmn5A41lHPQvPB/jdMjHFchTk3qpvu+ZVXskZ/VkAyMEUKyb6r2zeCrSbRA3Xu4hAHKjgD30KWQFc7+zqflRlAnkN1+Jdg68H97UbBpAprKtZVTQq2VFUTDTuQdYYgVK6nCTMecUxqTRdsj9sDhaonu881ITbZlGp8Dah0kGVaQZ2ApF35ke12n6F0cBcTmTkt7cJ12UfjTnlaKGSFg4NIC1ZqWS4vuh1xCT4WYKqZS0lXjyyGsfKDMnP3aQI6WxcFqsqh4cfWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzQe7Cb12yxjblIaJlPcI092brMvHMWkPmc6L4PYCqA=;
 b=nFdU0XquqbpHOfjPE3Gpdsz5dyDWhhaiz9FA11WppZD5xXe1qMvUh0IOBWtm2Or9sThSM62s+RCM1YIV0MWbJf04Dhzu1vgusUBLao0+YEukLjM8EkZae4wRX330Z2uZYL19a3WJiYRDUYd94pBEHLnnDUX+jOWeYA+ELcozC+RUt3TlRd/dYbXsj1RHwArXPEMacq2EIOilXljBodBxwhZw3PyZ5fowQymSXeU9bMwvjAkOyHco4dBlFF4X3LodVjXjH4PCGJSuVWA8GHH001nR/3TEHLkJOz22JRCC1CUGWuf/TBFQei34j5Uadk5vpyWOUFOnTk2+DL/rf5G/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzQe7Cb12yxjblIaJlPcI092brMvHMWkPmc6L4PYCqA=;
 b=oYtEfq0cikChyrHY5/pjOTIrC1AHrUZ4Bd6iibkIPVnCl9AcoAHHQEyI6nUsXs4iUi/+F4P71mJomG/BXilmKxL7WmOeTe0xeBvVZHfL3aGrFGuSqp8MJUrz5DN7d79DCzWBgnmOTqt/6pSFsIwlhlRl9GOIe+zGPLwixBw2J9E=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYWhlFOdBlNRd7J0aYNs5h64D4UK0OxgEAgAEVjwA=
Date: Thu, 5 May 2022 06:24:17 +0000
Message-ID:
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
In-Reply-To: <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7405BF0E8CE6B341BE247F2B41D24E4F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 081da096-dd88-421f-3a1b-08da2e5fea09
x-ms-traffictypediagnostic:
	VI1PR0802MB2288:EE_|VE1EUR03FT024:EE_|AM6PR08MB5157:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB515703B0B7F6B6E6C29782A3F7C29@AM6PR08MB5157.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0PBD8NEGXTKwiP15omzpMoc2fu5cBvDCCR/JDpZ26P2dVgN0fbOtEfibBspWLxWPKhNYTSeZQuYuQQyRnHabU7tjXHqJGKh1/CNoU0uU2iYymf81knAuHoQ802RrYrPekNGWEBc92/Mi0Rf11dBM+Awz20QOh5JQ+Cp+0r7/K0fpcVc+cEZwhfU9LnMQ6QXbpP1GAquytQlxqxVcuA/jBSjL9rH5EgYvphnrQDtpJ6i8oM7C7AeuyA7kp0ie+TxkBRYsc8jGQ71sU9ySb72zgq3ccsWUAUT1fEwG7ImltmIngysMJDHFApCB0saRy0Gp5SpO1/AeXGZM98XmR5cEJOJIjnWslBgyVugqgcy5QMVynBOkX4Z+KshsDvKxfe/Bl/fbrK5jdWYnzzPvGV229tm/RAQr6W9BJFlxpUOuv8j65t2RAK/zVDDV3+FVKtp6UJZwq9F+XT+BRSGIAxJLy3s4/fxL1UcTCswI9gklsHwJNL8R6NWBrHDBdNx86+MR1YgKpyq6RSZQfo4wWq80ud0gmz8QI5iENt1WYtjFQBMmAgtqKpMoo2aA7XqNrUO+UVq72Lo5U+aSr/XYGod5Pdvk7pBpoBbj4+XxJVbHe1dCIfQcinwK+YrejU7CaIpcg/QOO1UJIRFpbaEU2g4VAiULqkSiRsrWgHgQ5CkwzIXi9MdL515ppN5pj23ExrN7TZwtQf74ZjuUhRbVA4Ooig==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(6916009)(83380400001)(66946007)(4326008)(76116006)(8676002)(66446008)(64756008)(66476007)(66556008)(71200400001)(2906002)(52536014)(316002)(508600001)(5660300002)(8936002)(9686003)(33656002)(7696005)(186003)(26005)(53546011)(6506007)(38100700002)(38070700005)(86362001)(55016003)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac7d28e4-c815-44ec-5c05-08da2e5fe218
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EJZKqea/1Q3CMyxegAx8XOVigfpKsMDEM0Jdy1wwEgdM0Otw+62hmSPJusWf2BTQenuIlVxs60m9hLpXHWFGwRlIn6DE3WLK9m/YxxIxm1RikjGq68Jq7PjfWmj37txBVUJoPsrDUMztLDqzfXHGRMrrMHMq1/+lrJkc3vJRteBIUgjgLdB8oHD6VOjSje2cIUf+QjV06m6GZHjWbaMiqC8rxhCCLg5det28q7JL5/Qlzzg9dusP26AqCKZOyCGwHvWjZ8QRziQLHtwK2Yf6RJTbfQZzOY0fFwhZv6PR/sdz+YbLXkVz30EQhARF7Sm55RFv9faalqKZqmsnxGtNFTdIu1j8I9jWdrTO0Vigcuqz7HOxr4dwtWdNAkSI2ZdMob0ZlItIgDLbppPIpbWMTq5ts5/pYWDikrto2MzApLmlLLMvacjnsbOcDxbIgph5s7lVwXjSwUx49JItEHPgUMMpXkDXw4uW7Bs6dc/rb8hZQEXaODlMPh3TovglED99qWl3/rJBttgkK1AFjLNxofqekMDhOaL35dW6iXX+WAHaxj+sFKbi7UHKeVNgxhjZlMvbVeWTCwZpjl5ef5f8t8gkuMhVMk8yeX+IwQgFDhso5Wmkw/XcJ2tbq1WaBC9fLT5tSmCccxgVyrcuzW5OM5kNWOHgfToYebeTeSUvA/5gSioItboGSJlO41MArjQJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(8936002)(26005)(55016003)(508600001)(316002)(52536014)(186003)(5660300002)(40460700003)(7696005)(70586007)(6506007)(86362001)(53546011)(70206006)(4326008)(83380400001)(6862004)(81166007)(8676002)(82310400005)(2906002)(33656002)(54906003)(47076005)(9686003)(336012)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 06:24:30.8184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 081da096-dd88-421f-3a1b-08da2e5fea09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5157

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSA0LCAyMDIyIDk6
NDUgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzogV2Vp
IENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+
Ow0KPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1
bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNi82XSB4ZW46IHJldHJpZXZlIHJlc2VydmVkIHBh
Z2VzIG9uDQo+IHBvcHVsYXRlX3BoeXNtYXANCj4gDQo+IE9uIDI3LjA0LjIwMjIgMTE6MjcsIFBl
bm55IFpoZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gPiArKysg
Yi94ZW4vY29tbW9uL21lbW9yeS5jDQo+ID4gQEAgLTI0NSw2ICsyNDUsMjkgQEAgc3RhdGljIHZv
aWQgcG9wdWxhdGVfcGh5c21hcChzdHJ1Y3QgbWVtb3BfYXJncw0KPiA+ICphKQ0KPiA+DQo+ID4g
ICAgICAgICAgICAgICAgICBtZm4gPSBfbWZuKGdwZm4pOw0KPiA+ICAgICAgICAgICAgICB9DQo+
ID4gKyAgICAgICAgICAgIGVsc2UgaWYgKCBpc19kb21haW5fdXNpbmdfc3RhdGljbWVtKGQpICkN
Cj4gPiArICAgICAgICAgICAgew0KPiA+ICsgICAgICAgICAgICAgICAgLyoNCj4gPiArICAgICAg
ICAgICAgICAgICAqIE5vIGVhc3kgd2F5IHRvIGd1YXJhbnRlZSB0aGUgcmV0cmVpdmVkIHBhZ2Vz
IGFyZQ0KPiA+ICsgY29udGlndW91cywNCj4gDQo+IE5pdDogcmV0cmlldmVkDQo+IA0KPiA+ICsg
ICAgICAgICAgICAgICAgICogc28gZm9yYmlkIG5vbi16ZXJvLW9yZGVyIHJlcXVlc3RzIGhlcmUu
DQo+ID4gKyAgICAgICAgICAgICAgICAgKi8NCj4gPiArICAgICAgICAgICAgICAgIGlmICggYS0+
ZXh0ZW50X29yZGVyICE9IDAgKQ0KPiA+ICsgICAgICAgICAgICAgICAgew0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJDb3VsZCBub3QgYWxsb2NhdGUgbm9uLXplcm8tb3JkZXIgcGFnZXMNCj4g
PiArIGZvciBzdGF0aWMgJXBkLlxuLiIsDQo+IA0KPiBOaXQ6ICJDb3VsZCBub3QiIHJlYWRzIGFz
IGlmIGFuIGF0dGVtcHQgd2FzIG1hZGUsIHNvIG1heWJlIGJldHRlciAiQ2Fubm90Ij8NCj4gSSdk
IGFsc28gcHVsbCAic3RhdGljIiBhaGVhZCBvZiAibm9uLXplcm8tb3JkZXIiIGFuZCwgdG8gaGVs
cCBvYnNlcnZlcnMgb2YgdGhlDQo+IG1lc3NhZ2UgYXNzb2NpYXRlIGl0IHdpdGggYSBjYWxsIHNp
dGUsIGFjdHVhbGx5IGxvZyB0aGUgb3JkZXIgKGkuZS4NCj4gIm9yZGVyLSV1IiBpbnN0ZWFkIG9m
ICJub24temVyby1vcmRlciIpLg0KPiANCj4gQWxzbyBwbGVhc2Ugb21pdCBmdWxsIHN0b3BzIGlu
IGxvZyBtZXNzYWdlcy4gVGhleSBzZXJ2ZSBubyBwdXJwb3NlIGJ1dA0KPiBjb25zdW1lIHNwYWNl
Lg0KPiANCj4gRmluYWxseSwgaGVyZSBhcyB3ZWxsIGFzIGJlbG93OiBJcyAiaW5mbyIgbG9nIGxl
dmVsIHJlYWxseSBhcHByb3ByaWF0ZT8NCj4gWW91J3JlIGxvZ2dpbmcgZXJyb3IgY29uZGl0aW9u
cyBhZnRlciBhbGwsIHNvIGltbyB0aGVzZSB3YW50IHRvIGJlIGF0IGxlYXN0DQo+ICJ3YXJuIiBs
ZXZlbC4gQW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gb21pdCBsb2dnaW5nIG9mIG1lc3NhZ2Vz
IGhlcmUNCj4gYWx0b2dldGhlci4NCj4gDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9j
LmMNCj4gPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+IEBAIC0yNzY5LDEyICsy
NzY5LDUwIEBAIGludCBfX2luaXQgYWNxdWlyZV9kb21zdGF0aWNfcGFnZXMoc3RydWN0DQo+ID4g
ZG9tYWluICpkLCBtZm5fdCBzbWZuLA0KPiA+DQo+ID4gICAgICByZXR1cm4gMDsNCj4gPiAgfQ0K
PiA+ICsNCj4gPiArLyoNCj4gPiArICogQWNxdWlyZSBhIHBhZ2UgZnJvbSByZXNlcnZlZCBwYWdl
IGxpc3QocmVzdl9wYWdlX2xpc3QpLCB3aGVuDQo+ID4gK3BvcHVsYXRpbmcNCj4gPiArICogbWVt
b3J5IGZvciBzdGF0aWMgZG9tYWluIG9uIHJ1bnRpbWUuDQo+ID4gKyAqLw0KPiA+ICttZm5fdCBh
Y3F1aXJlX3Jlc2VydmVkX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG1lbWZs
YWdzKQ0KPiA+ICt7DQo+ID4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOw0KPiA+ICsgICAg
bWZuX3Qgc21mbjsNCj4gPiArDQo+ID4gKyAgICAvKiBBY3F1aXJlIGEgcGFnZSBmcm9tIHJlc2Vy
dmVkIHBhZ2UgbGlzdChyZXN2X3BhZ2VfbGlzdCkuICovDQo+ID4gKyAgICBwYWdlID0gcGFnZV9s
aXN0X3JlbW92ZV9oZWFkKCZkLT5yZXN2X3BhZ2VfbGlzdCk7DQo+ID4gKyAgICBpZiAoIHVubGlr
ZWx5KCFwYWdlKSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIN
Cj4gPiArICAgICAgICAgICAgICAgIiVwZDogZmFpbGVkIHRvIGFjcXVpcmUgYSByZXNlcnZlZCBw
YWdlIGZyb20gcmVzdl9wYWdlX2xpc3QuXG4iLA0KPiA+ICsgICAgICAgICAgICAgICBkKTsNCj4g
DQo+IEEgZ2RwcmludGsoKSBpbiB0aGUgY2FsbGVyIGlzIGFjY2VwdGFibGUuIFR3byBsb2cgbWVz
c2FnZXMgaXNuJ3QgaW1vLCBhbmQgYQ0KPiBYRU5MT0dfRVJSIG1lc3NhZ2Ugd2hpY2ggYSBndWVz
dCBjYW4gdHJpZ2dlciBpcyBhIHNlY3VyaXR5IGNvbmNlcm4gKGxvZw0KPiBzcGFtKSBhbnl3YXku
DQo+IA0KPiA+ICsgICAgICAgIHJldHVybiBJTlZBTElEX01GTjsNCj4gPiArICAgIH0NCj4gPiAr
DQo+ID4gKyAgICBzbWZuID0gcGFnZV90b19tZm4ocGFnZSk7DQo+ID4gKw0KPiA+ICsgICAgaWYg
KCBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcyhkLCBzbWZuLCAxLCBtZW1mbGFncykgKQ0KPiA+ICsg
ICAgICAgIHJldHVybiBJTlZBTElEX01GTjsNCj4gDQo+IERvbid0IHlvdSB3YW50IHRvIGFkZCB0
aGUgcGFnZSBiYWNrIHRvIHRoZSByZXNlcnZlZCBsaXN0IGluIGNhc2Ugb2YgZXJyb3I/DQo+IA0K
DQpPaCwgdGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dC4NCg0KPiA+ICsgICAgcmV0dXJuIHNt
Zm47DQo+ID4gK30NCj4gPiAgI2Vsc2UNCj4gPiAgdm9pZCBmcmVlX3N0YXRpY21lbV9wYWdlcyhz
dHJ1Y3QgcGFnZV9pbmZvICpwZywgdW5zaWduZWQgbG9uZyBucl9tZm5zLA0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJvb2wgbmVlZF9zY3J1YikgIHsNCj4gPiAgICAgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOw0KPiA+ICB9DQo+ID4gKw0KPiA+ICtpbnQgX19pbml0IGFjcXVpcmVfZG9t
c3RhdGljX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQsIG1mbl90IHNtZm4sDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX21mbnMsIHVuc2lnbmVk
IGludA0KPiA+ICttZW1mbGFncykgew0KPiA+ICsgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+
ID4gK30NCj4gDQo+IEkgY2FuJ3Qgc3BvdCBhIGNhbGxlciBvZiB0aGlzIG9uZSBvdXRzaWRlIG9m
IHN1aXRhYmxlICNpZmRlZi4gQWxzbyB0aGUgX19pbml0IGhlcmUNCj4gbG9va3Mgd3JvbmcgYW5k
IHlvdSBsb29rIHRvIGhhdmUgbWlzc2VkIGRyb3BwaW5nIGl0IGZyb20gdGhlIHJlYWwgZnVuY3Rp
b24uDQo+IA0KPiA+ICttZm5fdCBhY3F1aXJlX3Jlc2VydmVkX3BhZ2Uoc3RydWN0IGRvbWFpbiAq
ZCwgdW5zaWduZWQgaW50IG1lbWZsYWdzKQ0KPiA+ICt7DQo+ID4gKyAgICBBU1NFUlRfVU5SRUFD
SEFCTEUoKTsNCj4gPiArfQ0KPiA+ICAjZW5kaWYNCj4gDQo+IEZvciB0aGlzIG9uZSBJJ2QgYWdh
aW4gZXhwZWN0IENTRSB0byBsZWF2ZSBubyBjYWxsZXJzLCBqdXN0IGxpa2UgaW4gdGhlIGVhcmxp
ZXINCj4gcGF0Y2guIE9yIGFtIEkgb3Zlcmxvb2tpbmcgYW55dGhpbmc/DQo+IA0KDQpJbiBhY3F1
aXJlX3Jlc2VydmVkX3BhZ2UsIEkndmUgdXNlIGEgZmV3IENPTkZJR19TVEFUSUNfTUVNT1JZLW9u
bHkgdmFyaWFibGVzLCBsaWtlDQpkLT5yZXN2X3BhZ2VfbGlzdCwgc28gSSdkIGV4cGVjdCB0byBs
ZXQgYWNxdWlyZV9yZXNlcnZlZF9wYWdlIGd1YXJkZWQgYnkgQ09ORklHX1NUQVRJQ19NRU1PUlkN
CnRvbyBhbmQgcHJvdmlkZSB0aGUgc3R1YiBmdW5jdGlvbiBoZXJlIHRvIGF2b2lkIGNvbXBpbGF0
aW9uIGVycm9yIHdoZW4gIUNPTkZJR19TVEFUSUNfTUVNT1JZLg0KDQoNCj4gSmFuDQoNCg==

