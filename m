Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B40E7E9E6D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 15:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631613.985142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2XlC-0003zy-FC; Mon, 13 Nov 2023 14:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631613.985142; Mon, 13 Nov 2023 14:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2XlC-0003y2-BK; Mon, 13 Nov 2023 14:17:54 +0000
Received: by outflank-mailman (input) for mailman id 631613;
 Mon, 13 Nov 2023 14:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUjx=G2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r2XlA-0003wU-UG
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 14:17:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d88cd44-822f-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 15:17:51 +0100 (CET)
Received: from AS4P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::19)
 by PAVPR08MB9139.eurprd08.prod.outlook.com (2603:10a6:102:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.26; Mon, 13 Nov
 2023 14:17:47 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::a7) by AS4P189CA0015.outlook.office365.com
 (2603:10a6:20b:5d7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Mon, 13 Nov 2023 14:17:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 14:17:47 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Mon, 13 Nov 2023 14:17:47 +0000
Received: from 8f6d3a58a679.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 67F0D586-D5CA-49D3-BB2E-29ECAB68D06B.1; 
 Mon, 13 Nov 2023 14:17:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f6d3a58a679.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Nov 2023 14:17:36 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by GV1PR08MB7707.eurprd08.prod.outlook.com (2603:10a6:150:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 14:17:31 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 14:17:31 +0000
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
X-Inumbo-ID: 6d88cd44-822f-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XZJ5Etjd2ZPbR6UYtjIxITaJeS69E/NopGVGYpo449LsWt+1wb4F171vDxQE8NlWSyGPjQgpr94Bco4CM9/WGTqBzPlg93ynjUigXkMrQpLVboqKe7QAg7SkSASbCGaUccZnNQoTLRLi6dqeFGb/N+NA0JN/sEO7Ne1ZmJ8G8vrLecUGd2wusi9HyUXhoHY7pxuN1cWGL146yLU8ID9P9wW/QwcsKmtvSq8alsOSZxbfnyxjpyVxsPQDy0NIhke9LjIDBUSEx5YszspY0UHBBV+x2womhHwMMHupLbqx8fTt3iKq+yl7433zI06ETxzxVbEE+8C7nh6ZEVZuuRKcuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDlMveBBAUHf/Y3uWO8Xe/3OD+n9dn9XlcmUzw0yHjw=;
 b=T40DQQScQHpq5KP4E3c8VD9aOuVLSpHx3csQTmzNNL3jHlnaQoqpaGMiuFUNxfJEyTz1gobACE8CH1r90JwgINJNWUkxUpFhYwi9n38FX3ZyDL7xW6NMGqI6olajN8CuVNV7pEyncPTxTO6mvywgaJJ0jFJWk4HEyrucA1NHYKck8Hex2Vh9Efob7OPYXjVRQR/HToeyZfkM7YNpOC5Ol6j78tBI3XNZFWKer41DC6+7xalzGkK7kwsA2Ane6HuBPMA+6deYqDZ+ad+BbeWD26axL2oImJ9nPIpLPglTV2AjEI5qQwYkUnvLjHiZaopEx2x8H6VVjgXaUjBjnFhHmA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDlMveBBAUHf/Y3uWO8Xe/3OD+n9dn9XlcmUzw0yHjw=;
 b=p0pCk8SrrhZoSOCZxV7meCxees4C0/gQ21Avdt/WDOaV8l7/EM5purLczJ+LB9ZKAcm51qaZDHR9UPC3MYeXv929x2wEfsJV4OuTb+sJJxRSFljjYUH62Yxdo9rNECYkCn+ox3rluAxYQL4l7yzcSi03N+E7X7P9X7szaE+0wHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06cac8a1a2ec6dd1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EitUgIZNu9O+lgWDGtbZxC9KtgsqYDZ2rPxDAuFp8ZpPp+P+OgViOtujoEYDKQpIPaJFzjmnFpeHOZ4t9crB/6MphY8RG/frR35A5TBHqbZSbXSOR6bYaMRVrpXr2Gk/8SDJv01DDbFBIAyt/h8XB9QtJWS3kjK58IMKrUjtitATI8pjcte3CLNCsXQgY2mh/oYq9lTtXyA904fXza4JxMWCnpk9r1rLCVMB8ILyhdF3GkhYcUqccaXozEZ+vry26J5b4eXqiiwXk4l/TTB6mmfXW8i2JHh4n9khdHAdpcu8rXNChQidxaIYYdObPhwp0JHSUsASJx0mA0goclM0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDlMveBBAUHf/Y3uWO8Xe/3OD+n9dn9XlcmUzw0yHjw=;
 b=obFayRyzoX3rsEICz8GinuA3HYtK6GmLwRTniRp3h/AyW+hm6Kjq3v/XV5UosEqCqq3lNSwAVvysAI7HDq+B9Jaf6c4r6shXb0Ky+3kHPhUl5IrMgn65kNTvUaK1REDyGi52OwwsSVMPvjMrbPe59AzIswCDs1e9GbB2KeOUdTlcQgFgEv8/UChLazIPBkMnBeDXj/WAY9hXvKGQhPTy/uEdhYJu+KWi12GsLMq3ZvH3NYw07zkKR6U+MubccjuBKnU4jFRXuWw5w02iVGqKwUuxrTgUKmfMUs8suAEIdXQNnPZuioDim5xwWuL641OQDVIRMZ/jEDKG5EqzolZyAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDlMveBBAUHf/Y3uWO8Xe/3OD+n9dn9XlcmUzw0yHjw=;
 b=p0pCk8SrrhZoSOCZxV7meCxees4C0/gQ21Avdt/WDOaV8l7/EM5purLczJ+LB9ZKAcm51qaZDHR9UPC3MYeXv929x2wEfsJV4OuTb+sJJxRSFljjYUH62Yxdo9rNECYkCn+ox3rluAxYQL4l7yzcSi03N+E7X7P9X7szaE+0wHA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v4 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHaFijSS6ojbhl1Cke6ibm0yLAE1LB4S+mA
Date: Mon, 13 Nov 2023 14:17:31 +0000
Message-ID: <91ACC322-B543-4675-BC56-D8D284BC7CA8@arm.com>
References: <20231113090841.595428-1-luca.fancellu@arm.com>
 <20231113090841.595428-4-luca.fancellu@arm.com>
 <8a4431da-7e48-4b71-9f62-154edcc5968c@amd.com>
In-Reply-To: <8a4431da-7e48-4b71-9f62-154edcc5968c@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|GV1PR08MB7707:EE_|AM3PEPF0000A79A:EE_|PAVPR08MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: a1363f19-7642-48a4-fa59-08dbe4534fc6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mwTVoy/TF9+mqgexKwwSp0sSRSytqhGh/iO0IvMWQmEyq4qV3SVDbTWBV3OESmNLzdNcwc5WIHSj7wJe0pcFs+T6va3nhIb6zFppHfeyIYdD5BsMQCX2kbthLAWv7o1e+Uc+pAdVPy32aaPVDFWd9XNgvi5nru1za8eB1mXZMSBTlpYbuQsh7wWw2DHbvlrvSbOHmCcSGTNpon6cRlWVJmY7sU9v3oWQIkeq/GVja56H19SYomPeKRh5rc+w7ir0CDKjSJWjwRwMbsDqnAzR9CF5T3ybpdoXwKkuP13PVxkbmgK+uoUnJB/45k4JncdSqeC+GliryIi+WHPf/hkTWohB2azaB7EAsXvPsCpizZlaGOQEFJ49h3zFCfly7gc0tRID/uJAqeTQjpbplbe2yicK+g63DZ5nJqsiQb4eyZzq90dQr03s90S8SBOcc7n7cJn73uSg9M8ps3K5AwDNpqVw5X8aPF5yFWXEMgHZ3s1Z1SCDHkdU/pNv62jrD+QlCsmPn3LxqRU4XX8Don9203qy5PTa0WOfNIr6kyp1H9SN47Pg+NqJfV21UrnWYtqyJeX6SNj2ldWyIa5997FSIQ1WyXSl/17JzjljVbZEg6neX+O4uoYUb0tu8uEZh42ytech7A41JYMMEMrlQgjg8KHtCHLDOROwWIx8gM9BpIXSKfruYtt8ZwQ1WpaggkHG1ILUvyqh0Ow9BwCRyJykNA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(1800799009)(451199024)(2906002)(71200400001)(6506007)(53546011)(478600001)(86362001)(26005)(6916009)(2616005)(6512007)(64756008)(54906003)(66446008)(316002)(66476007)(66556008)(91956017)(66946007)(76116006)(6486002)(33656002)(122000001)(38100700002)(83380400001)(5660300002)(38070700009)(8936002)(36756003)(8676002)(4326008)(41300700001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3124F7A12F02A54F87A8CCA1202F924C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7707
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9199509-3eee-470c-085f-08dbe4534655
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R6mPt5xhj3EY/wSJ5Hkswkk8Jomzd3MSPcYKzxVRhj846hw9OBWYqack1KcZcqep130KK2CbsqMicCp6abT0D7VOeOUndJ1c43SQbp0vYlkLgjD13QRaT4++hT05Mv3kksIDMz5u5KmLOumvsTRI3YivEUk55X5L/jMSo8mUhbuOFDXeBuDhXAuDz1LCnNRaJUVfTwqVlXKPkWvfW6VBiC9NVj6qH1UZ9ms1cY9cJBco/Cb7oylDO7rvRPXMjj3vv8IHO1ofDJ+yuN8OVMArbi/Ot1aSd4KmliJO8ugNm97KOgW2e2ZlCaX0JtJLo84f2bn75iFyRLS7FL736PA6JE8a9gZaIcDJbIltrxchIDJCE6LAUCleryJWvMa3PiHIYlognJEZ+Aiu1vQj7JoxmFEgDYGNukmmNR3HbXNrlJtLN+hW1wqP7WCh+7g809HG/cytXprgmpbFtoP/obRFZOKalXjQ/Va/Qp5LbN8kTD8vhVeTmVi6p6QO7gneHDBFYQyxsr53Wjvi3QRw4qh9WKXNCZhx31UNqMRLs/7V7qaTMc8OXEthBaxtqQQsgiBaCcer5jDK2YtzVXgTJXrMgNGed+U6rRa7gvPeHL+EkfTlOJlF9+BJfS2MnbMhhmC79Y/zbTrNB+ZdW+NMyFM1QlNWa47uV1Fnxu+MZ592BBkvd0G0NQt93uYIYmWMO6sJQou/9+seY2xX/hOfFbsxgWDvc4MumhuzAJa06l1F5j8xA5ki7nvunK1XEOe1qAcH0E0k3ihqKYB+M2YD1vfIJ0kbbh7c6lhIauf2CNVvWVHNfkTKzq223thf/afBsFqD
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(40470700004)(46966006)(36840700001)(40460700003)(26005)(107886003)(53546011)(6506007)(2616005)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(6862004)(8676002)(8936002)(41300700001)(4326008)(2906002)(6486002)(478600001)(54906003)(70206006)(70586007)(316002)(36756003)(86362001)(33656002)(82740400003)(356005)(81166007)(336012)(40480700001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:17:47.4290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1363f19-7642-48a4-fa59-08dbe4534fc6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9139

DQoNCj4gT24gMTMgTm92IDIwMjMsIGF0IDExOjU4LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBBcGFydCBmcm9tIHBlbmRp
bmcgcXVlc3Rpb24gb24gc3RhdGljIGV2ZW50IGNoYW5uZWxzIGNvZGUgbW92ZW1lbnQsIGEgZmV3
IE5JVHMuDQoNClJlbGF0ZWQgdG8gdGhhdCwgaXQgc2VlbXMgdG8gbWUgdGhhdCB0aGlzIHBhcnQg
Y2FuIGJlIGhhbmRsZWQgYnkgYSBzZXBhcmF0ZSBwYXRjaC9zZXJpZSBmcm9tDQp0aGlzIG9uZSwg
bW92aW5nIGNvZGUgZnJvbSBkb21haW5fYnVpbGQuYyB0byBhIG5ldyBtb2R1bGUsIHNvIEnigJlt
IHdvbmRlcmluZywgaXMgdGhpcyBwb2ludA0KYSBibG9ja2VyIGZvciB0aGlzIHNlcmllPw0KDQo+
IA0KPiBPbiAxMy8xMS8yMDIzIDEwOjA4LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiAN
Cj4+IEN1cnJlbnRseSB0aGUgZG9tMGxlc3MgZmVhdHVyZSBjb2RlIGlzIG1vc3RseSBpbnNpZGUg
ZG9tYWluX2J1aWxkLmMNCj4+IGFuZCBzZXR1cC5jLCBpdCBpcyBhIGZlYXR1cmUgdGhhdCBtYXkg
bm90IGJlIHVzZWZ1bCB0byBldmVyeW9uZSBzbw0KPj4gcHV0IHRoZSBjb2RlIGluIGEgZGlmZmVy
ZW50IGNvbXBpbGF0aW9uIG1vZHVsZSBpbiBvcmRlciB0byBtYWtlIGl0DQo+PiBlYXNpZXIgdG8g
ZGlzYWJsZSB0aGUgZmVhdHVyZSBpbiB0aGUgZnV0dXJlLg0KPj4gDQo+PiBNb3ZlIGdpY19pbnRl
cnJ1cHRfdCBpbiBkb21haW5fYnVpbGQuaCB0byB1c2UgaXQgd2l0aCB0aGUgZnVuY3Rpb24NCj4+
IGRlY2xhcmF0aW9uLCBtb3ZlIGl0cyBjb21tZW50IGFib3ZlIHRoZSBkZWNsYXJhdGlvbi4NCj4+
IA0KPj4gVGhlIGZvbGxvd2luZyBmdW5jdGlvbnMgYXJlIG5vdyB2aXNpYmxlIGV4dGVybmFsbHkg
ZnJvbSBkb21haW5fYnVpbGQNCj4+IGJlY2F1c2UgdGhleSBhcmUgdXNlZCBhbHNvIGZyb20gdGhl
IGRvbTBsZXNzLWJ1aWxkIG1vZHVsZToNCj4+IC0gZ2V0X2FsbG9jYXRpb25fc2l6ZQ0KPj4gLSBz
ZXRfaW50ZXJydXB0DQo+PiAtIGRvbWFpbl9mZHRfYmVnaW5fbm9kZQ0KPj4gLSBtYWtlX21lbW9y
eV9ub2RlDQo+PiAtIG1ha2VfcmVzdl9tZW1vcnlfbm9kZQ0KPj4gLSBtYWtlX2h5cGVydmlzb3Jf
bm9kZQ0KPj4gLSBtYWtlX3BzY2lfbm9kZQ0KPj4gLSBtYWtlX2NwdXNfbm9kZQ0KPj4gLSBtYWtl
X3RpbWVyX25vZGUNCj4+IC0gaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRzDQo+PiAtIGNvbnN0cnVj
dF9kb21haW4NCj4+IC0gcHJvY2Vzc19zaG0NCj4+IC0gYWxsb2NhdGVfYmFua19tZW1vcnkNCj4+
IA0KPj4gVGhlIGZ1bmN0aW9ucyBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5IGFuZCBhc3NpZ25fc3Rh
dGljX21lbW9yeV8xMQ0KPj4gYXJlIG5vdyBleHRlcm5hbGx5IHZpc2libGUsIHNvIHB1dCB0aGVp
ciBkZWNsYXJhdGlvbnMgaW50bw0KPj4gZG9tYWluX2J1aWxkLmggYW5kIG1vdmUgdGhlICNlbHNl
IGFuZCBzdHViIGRlZmluaXRpb24gaW4gdGhlIGhlYWRlcg0KPj4gYXMgd2VsbC4NCj4+IA0KPj4g
TW92ZSBpc19kb20wbGVzc19tb2RlIGZyb20gc2V0dXAuYyB0byBkb20wbGVzcy1idWlsZC5jIGFu
ZCBtYWtlIGl0DQo+PiBleHRlcm5hbGx5IHZpc2libGUuDQo+PiANCj4+IFRoZSBmdW5jdGlvbiBh
bGxvY2F0ZV9iYW5rX21lbW9yeSBpcyB1c2VkIG9ubHkgYnkgZG9tMGxlc3MgY29kZQ0KPj4gYXQg
dGhlIG1vbWVudCwgYnV0IGl0J3MgYmVlbiBkZWNpZGVkIHRvIGxlYXZlIGl0IGluIGRvbWFpbl9i
dWlsZC5jDQo+PiBpbiBjYXNlIHRoYXQgaW4gdGhlIGZ1dHVyZSB0aGUgZG9tMCBjb2RlIGNhbiB1
c2UgaXQuDQo+PiANCj4+IFdoZXJlIHNwb3R0ZWQsIGZpeCBjb2RlIHN0eWxlIGlzc3Vlcy4NCj4+
IA0KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaXMgaW50ZW5kZWQuDQo+PiANCj4+IFNpZ25lZC1v
ZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4g
Q2hhbmdlcyBmcm9tIHYzOg0KPj4gLSByZW1vdmUgaGVhZGVyIGluIGRvbTBsZXNzLWJ1aWxkLmgg
KE1pY2hhbCkNCj4+IENoYW5nZXMgZnJvbSB2MjoNCj4+IC0gbW92ZSBhbGxvY2F0ZV9iYW5rX21l
bW9yeSBiYWNrIGluIGRvbWFpbl9idWlsZC5jLCByZW1vdmUgaGVhZGVyDQo+PiAgIGZyb20gZG9t
MGxlc3MtYnVpbGQuYy4NCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgfCAgICAxICsNCj4+IHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jICAg
ICAgICAgICAgIHwgMTAxOCArKysrKysrKysrKysrKysrKw0KPj4geGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jICAgICAgICAgICAgICAgfCAxMjY1ICsrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4g
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbTBsZXNzLWJ1aWxkLmggfCAgIDIwICsNCj4+IHhl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW5fYnVpbGQuaCAgIHwgICA2MCArDQo+PiB4ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAuaCAgICAgICAgICB8ICAgIDEgLQ0KPj4geGVuL2Fy
Y2gvYXJtL3NldHVwLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDMzICstDQo+PiA3IGZpbGVz
IGNoYW5nZWQsIDEyNDAgaW5zZXJ0aW9ucygrKSwgMTE1OCBkZWxldGlvbnMoLSkNCj4+IGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYw0KPj4gY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb20wbGVzcy1idWlsZC5oDQo+PiAN
Cj4gDQo+IFsuLi5dDQo+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9kb20wbGVzcy1idWlsZC5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbTBsZXNzLWJ1
aWxkLmgNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjAy
MmFlNjFlYWQ3Yw0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL2RvbTBsZXNzLWJ1aWxkLmgNCj4+IEBAIC0wLDAgKzEsMjAgQEANCj4+ICsvKiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovDQo+PiArDQo+PiArI2lmbmRlZiBf
X0FSTV9ET00wTEVTU19CVUlMRF9IXw0KPiBUaGUgbWFqb3JpdHkgb2YgaGVhZGVyIGZpbGVzIGhh
dmUgYSBndWFyZCBzdGFydGluZyB3aXRoIF9fQVNNIHNvIEkgd291bGQgc3RpY2sgdG8gdGhlIHNj
aGVtZS4NCg0KU3VyZSwgbWFrZXMgc2Vuc2UNCg0KPiANCj4+ICsjZGVmaW5lIF9fQVJNX0RPTTBM
RVNTX0JVSUxEX0hfDQo+PiArDQo+PiArI2luY2x1ZGUgPGFzbS9rZXJuZWwuaD4NCj4+ICsNCj4+
ICt2b2lkIGNyZWF0ZV9kb21Vcyh2b2lkKTsNCj4+ICtib29sIGlzX2RvbTBsZXNzX21vZGUodm9p
ZCk7DQo+PiArDQo+PiArI2VuZGlmICAvKiBfX0FSTV9ET00wTEVTU19CVUlMRF9IXyAqLw0KPiAx
IHNwYWNlIGJldHdlZW4gI2VuZGlmIGFuZCBjb21tZW50DQoNCknigJlsbCBmaXgNCg0KPiANCj4+
ICsNCj4+ICsvKg0KPj4gKyAqIExvY2FsIHZhcmlhYmxlczoNCj4+ICsgKiBtb2RlOiBDDQo+PiAr
ICogYy1maWxlLXN0eWxlOiAiQlNEIg0KPj4gKyAqIGMtYmFzaWMtb2Zmc2V0OiA0DQo+PiArICog
aW5kZW50LXRhYnMtbW9kZTogbmlsDQo+PiArICogRW5kOmINCj4gV2hhdCBkb2VzICdiJyBtZWFu
cyBoZXJlPyBPbmx5IDIgZmlsZXMgaGF2ZSB0aGF0Lg0KDQpNbW0uLi4gSSB0aGluayBJ4oCZdmUg
Y29waWVkIHRoaXMgcGFydCBmcm9tIHNtY2NjLmggYW5kIEkgZGlkbuKAmXQgcmVhbGlzZWQgdGhl
cmUgaXMgYSB0eXBvIChvciBhdCBsZWFzdCBJIHRoaW5rIGl0IGlzKQ0KYmVjYXVzZSBsb29raW5n
IGludG8gQ09ESU5HX1NUWUxFLCB0aGVyZSBpcyBubyDigJhi4oCZIGluIOKAmEVuZDrigJksIEni
gJlsbCBmaXggaXQuDQoNCg0KPiANCj4gVGhlIGNvbW1lbnRzIGFwcGx5IHRvIG90aGVyIGZpbGVz
IGFzIHdlbGwuDQo+IA0KPiBBcGFydCBmcm9tIHRoYXQsIHRoZSBtb3ZlbWVudCBMR1RNLg0KPiAN
Cj4gfk1pY2hhbA0KPiANCg0K

