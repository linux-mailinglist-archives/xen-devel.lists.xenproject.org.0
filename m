Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08652A974C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 14:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20802.46825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb2Gj-0000mu-TU; Fri, 06 Nov 2020 13:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20802.46825; Fri, 06 Nov 2020 13:59:09 +0000
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
	id 1kb2Gj-0000mV-Q9; Fri, 06 Nov 2020 13:59:09 +0000
Received: by outflank-mailman (input) for mailman id 20802;
 Fri, 06 Nov 2020 13:59:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kb2Gi-0000mQ-6n
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 13:59:08 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28e8122e-6c12-4750-8ad9-2aceff2a4296;
 Fri, 06 Nov 2020 13:59:05 +0000 (UTC)
Received: from AM5PR0602CA0012.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::22) by AM6PR08MB5126.eurprd08.prod.outlook.com
 (2603:10a6:20b:ef::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 13:59:00 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::36) by AM5PR0602CA0012.outlook.office365.com
 (2603:10a6:203:a3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 13:59:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 13:58:59 +0000
Received: ("Tessian outbound 39167997cde8:v71");
 Fri, 06 Nov 2020 13:58:59 +0000
Received: from 10479a49d559.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE4FC947-2DA3-4447-A3DC-1A213827F0C2.1; 
 Fri, 06 Nov 2020 13:58:53 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10479a49d559.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Nov 2020 13:58:53 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5482.eurprd08.prod.outlook.com (2603:10a6:10:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 6 Nov
 2020 13:58:51 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 13:58:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a9Kh=EM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kb2Gi-0000mQ-6n
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 13:59:08 +0000
X-Inumbo-ID: 28e8122e-6c12-4750-8ad9-2aceff2a4296
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:fe0a::62b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 28e8122e-6c12-4750-8ad9-2aceff2a4296;
	Fri, 06 Nov 2020 13:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWwooVcyJrpyGQlqMMlxBu7rW3tCH0uVg/JsavKGz8g=;
 b=TXLYYFxODjucBcy+AGd1PTqGwC0MuT+WB3G34+YoSY7FrD2ICWcnVD/5hwm0qBTOC+9wu23rkscogtf1s+2WtBEp9BCMjwrM/66YntUxjBxp2GMbbEa+spSODk8pTRvyWllck/0D0JmyoaFWMRf8VQGBu7w/elbe28wY5dVm4AU=
Received: from AM5PR0602CA0012.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::22) by AM6PR08MB5126.eurprd08.prod.outlook.com
 (2603:10a6:20b:ef::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 13:59:00 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::36) by AM5PR0602CA0012.outlook.office365.com
 (2603:10a6:203:a3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 13:59:00 +0000
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
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 13:58:59 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Fri, 06 Nov 2020 13:58:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01f93f8bfebe764a
X-CR-MTA-TID: 64aa7808
Received: from 10479a49d559.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FE4FC947-2DA3-4447-A3DC-1A213827F0C2.1;
	Fri, 06 Nov 2020 13:58:53 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10479a49d559.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 13:58:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbCKckoVUcvSHmvmtOj8aDc4+Y+X4QqbMvzI0qVwFjRrYm4ICJCaMMt6exSdaLR/60zv91HKcZwkfv1MSaYOGFEc2FaxBV0UlXlFxUmH7zsVNmfp8ZzwhNarppjP81SFJ/hg04+SIY05fzsH6V2o8p3dLYQ8sEQ42sI67ZlRITzBjQ3eGl9iic+IpDWlx4PsXp6BQGTsXlzzoHhfSiYY7ZCv9jB9/U7wiraxZWob0jSfQ31OS9Mx5dMgfLJsmmZFnplGnk+CqNMHyqR5ln6nBRBCddzhDoRCwthEhCdviuekIXVf8dI9ejSrs+2Mv0JS8SvOYKJJ0rLetlYhaZ/wGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWwooVcyJrpyGQlqMMlxBu7rW3tCH0uVg/JsavKGz8g=;
 b=LLA8i2QHPqdF2PZDeCq9/9zeUj/ee8l96ZwO7nzzARjTqD54cXfcVFjuhr1CHRKel7HdZPZBhCgKcIafd4il1nE3ftGPHzopbTHTF7HeV8s7XQ11Uz9kHKhvOLzjUjfFEjomRPFOWfAod/0DyBc/N7Ly938dbhk0kqZoR5CuWRfFOPc7+Av9X4EAdEfP2iH3+A8Y3yjg84dglYpgwvPunETYqq5j4qPQW/0O0PqiU9nBBPWkwtLXQwpNRgD8b5Q3nlF8ogTqYkx9bki/Ka3w+24ofFMlGzYe1rxOdycj5QTmq4LEo5bFbdoAeTZhvS9yrdjBGf25BkmcAPUqeeG/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWwooVcyJrpyGQlqMMlxBu7rW3tCH0uVg/JsavKGz8g=;
 b=TXLYYFxODjucBcy+AGd1PTqGwC0MuT+WB3G34+YoSY7FrD2ICWcnVD/5hwm0qBTOC+9wu23rkscogtf1s+2WtBEp9BCMjwrM/66YntUxjBxp2GMbbEa+spSODk8pTRvyWllck/0D0JmyoaFWMRf8VQGBu7w/elbe28wY5dVm4AU=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5482.eurprd08.prod.outlook.com (2603:10a6:10:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 6 Nov
 2020 13:58:51 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 13:58:51 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<andr2000@gmail.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvrkmJwOYERdUOadvid1OghFamwEIWAgABuPwCAA/gngIAAQvMAgAAErACABnTvAIAAA4IAgAAQNoA=
Date: Fri, 6 Nov 2020 13:58:51 +0000
Message-ID: <20FF6A26-41CF-4888-901A-0FF0ABCC6E64@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
 <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
 <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
 <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
 <5F09F481-DC27-4FC3-8CE5-F4F97FDF6DF9@arm.com>
 <2f62f34b-f47d-3472-511f-a89ec1cd36c3@epam.com>
In-Reply-To: <2f62f34b-f47d-3472-511f-a89ec1cd36c3@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e965285e-f388-4969-76dd-08d8825c1c88
x-ms-traffictypediagnostic: DB8PR08MB5482:|AM6PR08MB5126:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB51263AF486429821FE70D01BFCED0@AM6PR08MB5126.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t18XbNF4K6jGloN+HDh1A5HE01MuNLNVgeeR/00XmSdQq7UBkvq1EaQAZDN/+Jixc5g+x7PLvVATeJte9TxgnKQokmpDD6M4lrOfp0FYizqyzDbypYqTDWDmIgPqdtMZzIqeFGqDHjBCplONtNpCtaFwMusfJ8M0236WdarKWqUMgU8USVzZb9SDkjfEfWOlypNDYnffNSnfd5F3la5SIegR+gtBG2arWhvx4qXkp2HwlA4mMnODcwzmDTw2VLIdoPmM/5e5XXnoKW7w8vgpnxcf+OFzqU3rFMfrzCN4DD4xue6NeVa9mmbO8DOeF6dJOuH0JMzVP1wxHdgF1ZvLCg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(376002)(136003)(396003)(8936002)(33656002)(71200400001)(5660300002)(2906002)(6486002)(8676002)(6506007)(36756003)(478600001)(64756008)(91956017)(316002)(26005)(54906003)(86362001)(6916009)(53546011)(66446008)(66946007)(186003)(55236004)(83380400001)(66556008)(76116006)(6512007)(2616005)(66476007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 GsjGizzlL4+gl4PqxOipH4Oq1zLilFeVSV/yoMibzlMTAbshpied1nW7VIoIHICJnQ8WH5+pbbtw0jYAc8w1TPCjrPLcpuuBTRENneeVBIWmt4lHaMYkr/To1Nr2dvWaXemAqK/mETL11cEmweBRCN3g72AunyqwhnDfp1gYBStdgwf9gh6QuUJWjWTMjbwvYpIugw64LdM6Sd2nPopkHVy1BKoc2pWQVoLWBEzchElISk+1C3gOdE+ElPu9ERtww4UlYViAWyB0IHPxnPVhCyHJQ39lcBiudiu2aTAdAvOZO78biYGrYJtsYINYXipZQ25oPwVNEbB36lvYznUFILBGOzv8huuowY8F50+r1wPl5GwCrDpbetS49MTdbtZ61rg4+IIXupthXOSRx3I3E3sL9Ks87AvwlPJLZkK8BNFK4nK2N4psV9SxS5VTrE4v0OKPoL/5rZkwKQDhSrtHIDbrVgKDPsrEb74yBomXpk45a10ip0bayY78zKAs/sOWJ/pNAqlTdJr5dUB2btcAoycn6cGCFqwQOKUUARCK97WNzBvP9QT8hrlIalXyx1JZY6l9ij4CHjDIDYLaL99go2TZUWVbXNdOFmHaTBv8tpk5ot9SwwVTUcrMAHQlJQEx7i0MC4krv3tZounT9RbpKQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <375B1A2ABC60424AA7589FFFD5EF1928@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5482
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	74b8df9c-29d7-4173-b692-08d8825c1788
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xhDIuXj0Bm+E+kvgPs7n2S6xQsA4LlO2MHp8DAtRia9qLUdmFMMW2ez/OlQ4yKp/vDQTbepA9ZGnXh1Oo2Lu3HwaXxhGpCo3RxL+iJ7L+QlTZlmVrj1N6YKThFUVbpkttnn1NhbXH09VAWmQPnz4udRJcH2GtR+SjmnukRzPN5jiIDo9uOJUxi28/qtnuWHBQNYmZbtkMhypkd+g5c26AHnZYuMv4e0+/acbkR0xyN92/ewbOedNaiLBAJSXszJqIWzTI5blB+ORTciQVVTWzIaZn6YT0q8/AZ/xndhRE4hv5QD92Q2gTfB8FxSt0vPwLNGYF9ZeDeuXfDiVFHBLgCM7Ameh5xraylJBnvVhNtEMRwZlZ1EGV4F+0xXzMSYNgYc0WQp9EvxtFe1aiuh3Ug==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(46966005)(5660300002)(356005)(2616005)(316002)(53546011)(478600001)(54906003)(6862004)(4326008)(81166007)(36906005)(107886003)(26005)(6486002)(47076004)(2906002)(8676002)(186003)(86362001)(6512007)(36756003)(33656002)(82310400003)(8936002)(70206006)(70586007)(83380400001)(82740400003)(6506007)(55236004)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 13:58:59.9153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e965285e-f388-4969-76dd-08d8825c1c88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5126

SGVsbG8gT2xla3NhbmRyLA0KDQo+IE9uIDYgTm92IDIwMjAsIGF0IDE6MDAgcG0sIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIDxPbGVrc2FuZHJfQW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4gd3JvdGU6
DQo+IA0KPiBIZWxsbywgUmFodWwhDQo+IA0KPiBPbiAxMS82LzIwIDI6NDggUE0sIFJhaHVsIFNp
bmdoIHdyb3RlOg0KPj4gSGVsbG8gT2xla3NhbmRyLA0KPj4gDQo+Pj4gT24gMiBOb3YgMjAyMCwg
YXQgMTA6MTIgYW0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxPbGVrc2FuZHJfQW5kcnVzaGNo
ZW5rb0BlcGFtLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGksDQo+Pj4gDQo+Pj4gT24gMTEvMi8y
MCAxMTo1NSBBTSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gSGksDQo+Pj4+IA0KPj4+
Pj4gT24gMiBOb3YgMjAyMCwgYXQgMDU6NTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxhbmRy
MjAwMEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBIaSwgSnVsaWVuIQ0KPj4+Pj4g
DQo+Pj4+PiBPbiAxMC8zMC8yMCA3OjE4IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4g
SGkgT2xla3NhbmRyLA0KPj4+Pj4+IA0KPj4+Pj4+IE9uIDMwLzEwLzIwMjAgMTA6NDQsIE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+PiBPbiAxMC8yMC8yMCA2OjI1IFBNLCBS
YWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+IEFkZCBzdXBwb3J0IGZvciBBUk0gYXJjaGl0ZWN0
ZWQgU01NVXYzIGltcGxlbWVudGF0aW9ucy4gSXQgaXMgYmFzZWQgb24NCj4+Pj4+Pj4+IHRoZSBM
aW51eCBTTU1VdjMgZHJpdmVyLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBNYWpvciBkaWZmZXJlbmNl
cyBiZXR3ZWVuIHRoZSBMaW51eCBkcml2ZXIgYXJlIGFzIGZvbGxvd3M6DQo+Pj4+Pj4+PiAxLiBP
bmx5IFN0YWdlLTIgdHJhbnNsYXRpb24gaXMgc3VwcG9ydGVkIGFzIGNvbXBhcmVkIHRvIHRoZSBM
aW51eCBkcml2ZXINCj4+Pj4+Pj4+ICAgICAgdGhhdCBzdXBwb3J0cyBib3RoIFN0YWdlLTEgYW5k
IFN0YWdlLTIgdHJhbnNsYXRpb25zLg0KPj4+Pj4+PiBGaXJzdCBvZiBhbGwgdGhhbmsgeW91IGZv
ciB0aGUgZWZmb3J0cyENCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEkgdHJpZWQgdGhlIHBhdGNoIHdpdGgg
UUVNVSBhbmQgd291bGQgbGlrZSB0byBrbm93IGlmIG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdA0K
Pj4+Pj4+PiANCj4+Pj4+Pj4gdGhhdCB0aGlzIGNvbWJpbmF0aW9uIHdpbGwgbm90IHdvcmsgYXMg
b2Ygbm93Og0KPj4+Pj4+PiANCj4+Pj4+Pj4gKFhFTikgU01NVXYzOiAvc21tdXYzQDkwNTAwMDA6
IFNNTVV2MzogRFQgdmFsdWUgPSBldmVudHENCj4+Pj4+Pj4gKFhFTikgRGF0YSBBYm9ydCBUcmFw
LiBTeW5kcm9tZT0weDE5NDAwMTANCj4+Pj4+Pj4gKFhFTikgV2Fsa2luZyBIeXBlcnZpc29yIFZB
IDB4NDAwMzEwMDAgb24gQ1BVMCB2aWEgVFRCUiAweDAwMDAwMDAwYjg0NjkwMDANCj4+Pj4+Pj4g
KFhFTikgMFRIWzB4MF0gPSAweDAwMDAwMDAwYjg0NjhmN2YNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFtz
bmlwXQ0KPj4+Pj4+PiANCj4+Pj4+Pj4gSWYgdGhpcyBpcyBleHBlY3RlZCB0aGVuIGlzIHRoZXJl
IGFueSBwbGFuIHRvIG1ha2UgUUVNVSB3b3JrIGFzIHdlbGw/DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBJ
IHNlZSBbMV0gc2F5cyB0aGF0ICJPbmx5IHN0YWdlIDEgYW5kIEFBcmNoNjQgUFRXIGFyZSBzdXBw
b3J0ZWQuIiBvbiBRRU1VIHNpZGUuDQo+Pj4+Pj4gSnVzdCBmb3IgY2xhcmljYXRpb24sIHlvdSBh
cmUgdHJ5aW5nIHRvIGJvb3QgWGVuIG9uIFFFTVUsIHJpZ2h0Pw0KPj4+Pj4gRXhhY3RseQ0KPj4+
Pj4+IFlvdSBtaWdodCBiZSBhYmxlIHRvIHVzZSB0aGUgc3RhZ2UtMSBwYWdlLXRhYmxlcyB0byBp
c29sYXRlIGVhY2ggZGV2aWNlIGluIFhlbi4gSG93ZXZlciwgSSBkb24ndCB0aGluayB5b3Ugd2ls
bCBiZSBhYmxlIHRvIHNoYXJlIHRoZSBQMk0gYmVjYXVzZSB0aGUgcGFnZS10YWJsZXMgbGF5b3V0
IGJldHdlZW4gc3RhZ2UtMSBhbmQgc3RhZ2UtMiBpcyBkaWZmZXJlbnQuDQo+Pj4+PiBTbywgaXQg
aXMgZXZlbiBtb3JlIHdvcmsgdGhlbg0KPj4+PiBPdmVyYWxsIGl0IHdvdWxkIG1ha2UgbW9yZSBz
ZW5zZSB0byBzcGVuZCBzb21lIHRpbWUgYWRkaW5nIHByb3BlciBzdXBwb3J0IGluIFFlbXUgdGhl
biB0cnlpbmcgdG8gbW9kaWZ5IHRoZSBkcml2ZXIgdG8gc3VwcG9ydCBRZW11IHJpZ2h0IG5vdy4N
Cj4+Pj4gDQo+Pj4+Pj4+IFdlIGFyZSBpbnRlcmVzdGVkIGluIFFFTVUvU01NVXYzIGFzIGEgZmxl
eGlibGUgcGxhdGZvcm0gZm9yIFBDSSBwYXNzdGhyb3VnaA0KPj4+Pj4+PiANCj4+Pj4+Pj4gaW1w
bGVtZW50YXRpb24sIHNvIGl0IGNvdWxkIGFsbG93IHRlc3RpbmcgZGlmZmVyZW50IHNldHVwcyBh
bmQgY29uZmlndXJhdGlvbnMgd2l0aCBRRU1VLg0KPj4+Pj4+IEkgd291bGQgcmVjb21tZW5kIHRv
IGdldCB0aGUgU01NVSBzdXBwb3J0aW5nIHN1cHBvcnRpbmcgc3RhZ2UtMiBwYWdlLXRhYmxlcy4N
Cj4+Pj4+IFlvdSBtZWFuIGluIFFFTVU/DQo+Pj4+IFNlZSBiZWZvcmUuDQo+Pj4+IA0KPj4+Pj4+
IFJlZ2FyZGxlc3MgdGhhdCwgSSB0aGluayBYZW4gc2hvdWxkIGJlIGFibGUgdG8gc2F5IHRoZSBT
TU1VIGlzIG5vdCBzdXBwb3J0ZWQgcmF0aGVyIHRoYW4gY3Jhc2hpbmcuDQo+Pj4+PiBZZXMsIHRo
YXQgd291bGQgYmUgbmljZQ0KPj4+PiBGdWxseSBhZ3JlZSBhbmQgd2Ugd2lsbCBsb29rIGludG8g
dGhhdC4NCj4+Pj4gDQo+Pj4+IEFueXRoaW5nIHlvdSBjb3VsZCBzaGFyZSBzbyB0aGF0IHdlIGNv
dWxkIHF1aWNrbHkgcmVwcm9kdWNlIHlvdXIgc2V0dXAgd291bGQgYmUgbW9yZSB0aGVuIGdyZWF0
Lg0KPj4+IE5vdGhpbmcgc3BlY2lhbCwNCj4+PiANCj4+PiBxZW11L2FhcmNoNjQtc29mdG1tdS9x
ZW11LXN5c3RlbS1hYXJjaDY0IC1tYWNoaW5lIHR5cGU9dmlydCAtbWFjaGluZSB2aXJ0LGdpYy12
ZXJzaW9uPTIgXA0KPj4+IA0KPj4+IC1tYWNoaW5lIHZpcnR1YWxpemF0aW9uPXRydWUgLWNwdSBj
b3J0ZXgtYTU3IC1zbXAgNCAtbSAyMDQ4IC1uaWMgdXNlcixob3N0ZndkPXRjcDoxMjcuMC4wLjE6
MjIyMi06MjIgXA0KPj4+IA0KPj4+IC1ub2dyYXBoaWMgLXNlcmlhbCBtb246c3RkaW8gWy4uc25p
cC4uXQ0KPj4+IA0KPj4+IEkgYWxzbyBzZXQgaW9tbXUgdG8gc21tdXYzIGluIG15IHRlc3RzLCBR
RU1VIGVtdWxhdG9yIHZlcnNpb24gNC4yLjENCj4+IEkganVzdCBjaGVja2VkIGFuZCBjb25maXJt
ZWQgdGhhdCBRRU1VIGlzIGJvb3Rpbmcgd2l0aCBYRU4gU01NVXYzIHBhdGNoIGFuZCBYRU4gaXMg
YWJsZSB0byBzYXkgU01NVSB0cmFuc2xhdGlvbiBpcyBub3Qgc3VwcG9ydGVkLiBBcyBYRU4gc3Vw
cG9ydHMgU3RhZ2UtMiB0cmFuc2xhdGlvbiBhbmQgUUVNVSBzdXBwb3J0cyBTdGFnZS0xIG9ubHku
DQo+PiANCj4+IA0KPj4gKFhFTikgU01NVXYzOiAvc21tdXYzQDkwNTAwMDA6IFNNTVV2MzogRFQg
dmFsdWUgPSBldmVudHENCj4+IChYRU4pIFNNTVV2MzogL3NtbXV2M0A5MDUwMDAwOiBJRFIwLkNP
SEFDQyBvdmVycmlkZGVuIGJ5IEZXIGNvbmZpZ3VyYXRpb24gKGZhbHNlKQ0KPj4gKFhFTikgU01N
VXYzOiAvc21tdXYzQDkwNTAwMDA6IG5vIHRyYW5zbGF0aW9uIHN1cHBvcnQhDQo+PiAoWEVOKSBJ
L08gdmlydHVhbGlzYXRpb24gZGlzYWJsZWQNCj4+IA0KPj4gT25seSBkaWZmZXJlbmNlIEkgb2Jz
ZXJ2ZWQgaXMgdGhhdCB5b3UgaGF2ZSB0byBhZGQgb3B0aW9uICItbWFjaGluZSB2aXJ0LGlvbW11
PXNtbXV2MyDigJwgd2hlbiBsYXVuY2hpbmcgdGhlIFFFTVUuDQo+IEkgZG8gdXNlIHRoZSBvcHRp
b24NCg0KSSB1c2VkICItbWFjaGluZSB2aXJ0LGlvbW11PXNtbXV2MyDigJwgIG9wdGlvbiB3aGls
ZSBjcmVhdGluZyB0aGUgdmlydC1kdGIgYW5kIHdoaWxlIGxhdW5jaGluZyB0aGUgUUVNVS4NCkkg
YWxzbyBvYnNlcnZlZCB0aGUgc2FtZSBlcnJvciB3aGF0IHlvdSBvYnNlcnZlZCBpZiBJIGFtIG5v
dCB1c2luZyB0aGUgIi1tYWNoaW5lIHZpcnQsaW9tbXU9c21tdXYzIOKAnCBvcHRpb25zIHdoZW4g
bGF1bmNoaW5nIHRoZSBRRU1VIHNvIEkgdGhvdWdodCB0aGlzIG1pZ2h0IGJlIGNhc2UgZm9yIHlv
dSBhbHNvIGJ1dCBhbnl3YXlzIHlvdSBoYXZlIHVzZSB0aGUgb3B0aW9ucyBpdCBtaWdodCBiZSBv
dGhlciBpc3N1ZS4NCg0KPj4gDQo+PiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgaXQgYWxzbyB3b3Jr
cyBmb3IgeW91Lg0KPiANCj4gV2VsbCwgSSBzaG91bGQgaGF2ZSByZXBvcnRlZCB0aGF0IGVhcmxp
ZXIgdGhhdCBJIGRvIG5vdCB1c2UgdGhlIHN0YWdpbmcgWGVuIGF0IHRoZSBtb21lbnQsDQo+IA0K
PiBpdCBpcyA0LjE0LjAuIFNvLCBjYW4gdGhpcyBiZSBhIHByb2JsZW0gd2l0aCB0aGF0IFhlbiB2
ZXJzaW9uPw0KDQpJIGRvbuKAmXQgdGhpbmsgc28gdGhpcyBpcyB0aGUgcHJvYmxlbSB3aXRoIHRo
ZSBYRU4gdmVyc2lvbi4NCj4gDQo+IEFueXdheXMsIGlmIGl0IHdvcmtzIHdpdGggdGhlIHN0YWdp
bmcgdGhlbiBldmVyeXRoaW5nIGxvb2tzIG9rDQo+IA0KPiBUaGFuayB5b3UsDQo+IA0KPiBPbGVr
c2FuZHINCj4gDQo+PiANCj4+Pj4gUmVnYXJkcw0KPj4+PiBCZXJ0cmFuZA0KPj4+PiANCj4+Pj4+
PiBDaGVlcnMsDQo+Pj4+Pj4gDQo+Pj4+PiBUaGFuayB5b3UsDQo+Pj4+PiANCj4+Pj4+IE9sZWtz
YW5kcg0KDQpSZWdhcmRzLA0KUmFodWw=

