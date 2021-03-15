Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DED33AFFD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 11:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97930.185699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLkUD-0003fR-FF; Mon, 15 Mar 2021 10:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97930.185699; Mon, 15 Mar 2021 10:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLkUD-0003f2-Be; Mon, 15 Mar 2021 10:30:09 +0000
Received: by outflank-mailman (input) for mailman id 97930;
 Mon, 15 Mar 2021 10:30:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/z0=IN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lLkUC-0003ex-7H
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 10:30:08 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2212335-9192-42f3-b8dc-17380361cf9c;
 Mon, 15 Mar 2021 10:30:06 +0000 (UTC)
Received: from DB6PR0501CA0021.eurprd05.prod.outlook.com (2603:10a6:4:8f::31)
 by PR2PR08MB4796.eurprd08.prod.outlook.com (2603:10a6:101:21::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 10:29:56 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::60) by DB6PR0501CA0021.outlook.office365.com
 (2603:10a6:4:8f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 10:29:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 10:29:56 +0000
Received: ("Tessian outbound 24a7072fdae6:v71");
 Mon, 15 Mar 2021 10:29:56 +0000
Received: from f70850ec4f7a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4B4825C-BF86-44AE-B6E7-A6099F0FA2A4.1; 
 Mon, 15 Mar 2021 10:29:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f70850ec4f7a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Mar 2021 10:29:20 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0801MB1872.eurprd08.prod.outlook.com (2603:10a6:800:86::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 10:29:16 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 10:29:15 +0000
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
X-Inumbo-ID: a2212335-9192-42f3-b8dc-17380361cf9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSKQAci77+VJmJ0vscZTCxSI6oueURxbYe5hjUdP5TI=;
 b=v3Yx7PTW9R4p2PEHw+zsZSBUZdTA5S4/leam5NlbozLSRKhcOcfGrKOnVtHX6E73f5z3cnfSRqL3hodLlkad9bm87DibKgJP0E0DkFaAyfC/D8sC5QrFaQJaZxpXlmnjA4Jm3yCriC1TSPWQ04LVtUcYWH1LTapbMHKv+Pz6vjI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d30a369b90a641c2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEIYJdc0yyi5RXnQOrQNUs6YHStEwHKlUP6grD2AZWAABBCHLTaD/p6nCVMiZ0BkyxFrI2MOW+RJQ6KYZH2k/pCIu/WnWBXYvDI4byiSc9LgD1fgX+kjGoCYkf23U1+Kl7UxEkbVyYIaOXWQMpClhkRJMaj64dSZfIEEcrNRgy8+UYIpCZV68b0HUKWFe9HWcLHw7BldmvgaOtMs4iX7U6gCNRxdj/0jfiIgD2k2BiViWiDUFawslVi0kcQaixpf75keukQJ+77AdkK4ZXXVuTJY7a/KAFlfep3hdpkEdwGHnF5El+KMEg5nlVHlB32OOZae1NfmHLSMpKVNv558ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSKQAci77+VJmJ0vscZTCxSI6oueURxbYe5hjUdP5TI=;
 b=KWFfbPHSvfqKQjUEtO2A5NEtaxF/941eveGpbz/REFGLYwyQv6tYeeEK9i9cP0LmelfUDn62FLBvXEFJBf9XxUVKsswfxLl6bkNF5rHro5mDhB9/ISUDd4d2jLRJQj0OaacquaO8j9SjFXXOw+xKKRFPkMhb2za3XRM99Oe0u4ahsrw0soTlmek5btFhV7nCHGrF62ZQQVFVfu98XMcVEMKTaBh7bWyQ+5jPe0cAGaVJoCZTjIxZk80KGd3/8bCyE1QI59zFFmGUGpzhc12k/IJt2RCbNi7JeOW8nWzs5pkZjo4D2IktNb91AS17h5UGSvTw6Kejq6HSsnj45/EzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSKQAci77+VJmJ0vscZTCxSI6oueURxbYe5hjUdP5TI=;
 b=v3Yx7PTW9R4p2PEHw+zsZSBUZdTA5S4/leam5NlbozLSRKhcOcfGrKOnVtHX6E73f5z3cnfSRqL3hodLlkad9bm87DibKgJP0E0DkFaAyfC/D8sC5QrFaQJaZxpXlmnjA4Jm3yCriC1TSPWQ04LVtUcYWH1LTapbMHKv+Pz6vjI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7] arm: Add Kconfig entry to select CONFIG_DTB_FILE
Thread-Topic: [PATCH v7] arm: Add Kconfig entry to select CONFIG_DTB_FILE
Thread-Index: AQHXGXzxZpQ/TGqhSkqtfY2YUu6quKqE2RuA
Date: Mon, 15 Mar 2021 10:29:15 +0000
Message-ID: <B22D9908-4F40-4619-9ABC-395F725437FF@arm.com>
References: <20210315092342.26533-1-michal.orzel@arm.com>
In-Reply-To: <20210315092342.26533-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd74df1f-8ca1-4d92-492e-08d8e79d473a
x-ms-traffictypediagnostic: VI1PR0801MB1872:|PR2PR08MB4796:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB47964A258096E21FD938532D9D6C9@PR2PR08MB4796.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O0pQdBtHg+briUXdrtne8wEVP1uBlS7+eYYZ3cAzW5tK9p17S8jk/i/OObxtZ3qdZiAU6IOf1qSLIoafMNXnlD+7UZcsC3Qa8lUT8G+cO29nHOL3HabarUp0V2dKJ5VKarsYHHgoD7W/yBfry/TDrA0anD9LqYAh9k6rcc2PXZ2AxJpKLL7VM4Dk+jb64D6Yv5IK+4FVe2QwwsEHyMfpSSBoQwAckpRq4g+J6zyaC0UTq4GZ1ftlr0tlP2ULBUA591gjEIblGoGeHVuYqANyrSyvbsXImD3k/Z8Xgo2/MBSV5JAAVPzFQuw/UZIhq0W5QQVLVed7k1D5SH5sst0rIznNLM1pjXqr8hPnGgrb7XwR9wS6ROC3gBQplP4YE+FOUvoi7dyc1sQg4NSCNIIm16btKpFnKSYT1f8QMHYE5I5YKTXMtQwVgKe8lFqiR0ILnozBSM2x0ri+kdqud46nUlk9IpalIzFCxn1gm/qhPUC3XK31BqUy1fEmSN7k8cXynmSnh7cI7Tyww3k0XrOhIawfaq6am3qXBenklMXLD7Rk0E6iwaiCsc49i1yLapTLfoj/qqRUuSRtTzffMq2DM1tGfT+3V6qDrCC0RpghJexF9fiUf1rAsV0Yvs2+XN7p
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(26005)(6512007)(6862004)(186003)(86362001)(2906002)(36756003)(33656002)(4326008)(37006003)(8676002)(54906003)(66556008)(6636002)(478600001)(5660300002)(316002)(91956017)(6506007)(66476007)(8936002)(64756008)(6486002)(71200400001)(2616005)(76116006)(66946007)(55236004)(53546011)(83380400001)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?rv4exRJ5ZzNZsPiY11N1KoMwDABXbwfT8f96VgXQJFzdBnYA8qq+YPdx2myW?=
 =?us-ascii?Q?QHGqhRI+L5qQFcUUcq4VNmyEV99difn1quRNQt0NYqo+s/I2rCvoTtwjzTMR?=
 =?us-ascii?Q?SRIgnoIb0Lqv0oURMu/Blr8sJPFVzLFKm/r0ZOqMl46GBQoTMy4EnKdzjqrs?=
 =?us-ascii?Q?p07/NtAO1xyLy8gqZL/DC957enkSf9Gb2KmAVnwoA5mDrit8JLAN5HcQdQ8Z?=
 =?us-ascii?Q?jYdmT50gV19RsobhjGRGRWZ1ptFlfE7FWZFi2YYdtf4FSYI5eeENavqD3vQZ?=
 =?us-ascii?Q?Jx3PVKhX0nCoiLDefajgbOJSgrAhr4V4rD5+H0K/nxD6tCRpZE9Ba2RSwzfX?=
 =?us-ascii?Q?IdN0Uy2VaiyxyV3g04WxJIbqNTQBTOWLLCWtahcBbTHKnYKUBI6mxm2aTtdJ?=
 =?us-ascii?Q?iTNA4i3/1AkfaQmuyMgxKxF5AJK8ivmiy4c2/YiBEUMqy/d0p4LugkKCNq2o?=
 =?us-ascii?Q?qqfIEMLv8uKBcQcao7pmRgS0c0kivb/59WtUkvMoL2MVT05f0kdITDvf1+Rg?=
 =?us-ascii?Q?4OwOS402lyEFJuKorT9IHcyDDvWWHG3Q0cLazOgyrUdcDKiB8nHrItgjUOlg?=
 =?us-ascii?Q?JtUF7wuAm+9N9kgW/o5+FPbK76td3aO3mJp/sm2pwqHwkYzHMSEXa3o5fE/o?=
 =?us-ascii?Q?EFR+S3FdwboLBRf8ozILm7IUAsfPo2xfcxLtNGmouOXR8v7ufnEhKU/WT1ms?=
 =?us-ascii?Q?43A+xFMHy7js0wvUQzmVUVamFFAFBI65OEAE0MyM3LNP9aLWVzb1wdnSiCaO?=
 =?us-ascii?Q?veWZJdZ1dgH3l5MRyVye1jPZLjw1U0Y3oTAbHlxQ6H1uY0jNOG1k/Ly57Ch6?=
 =?us-ascii?Q?1oSZfd5xnpw8u8CcKPo6Ucmqe1rMJ9EBBh9kIDwrDT4Uad41faqyVB/u7nyt?=
 =?us-ascii?Q?i3uSwFbSlNPsNCt+yRZ103i2eTrJMNZmZvjndVaq60H33hljlABtn5n7R/Bx?=
 =?us-ascii?Q?yPH2mbQ2wXRFOrJlJBuAvDhY2AHySNjiT4IUJ/mjmYbA/yztOWRCHanrxhmy?=
 =?us-ascii?Q?IscvcvRFLMdsxF+UManhZoaKo8tfJFVO/ihd29/D+bKYRXcioyRE/YaQtEvd?=
 =?us-ascii?Q?Ve92AI37I7EjXTZ/htJeGQYI0j5CWdW+rZiLBr4t4kSi31JDoHautxuFtpIY?=
 =?us-ascii?Q?p5sgjT3mNPWicjIE/cYxnmDzdkz87nOHMyNQnmpLFmHUcAZoro8oqVqK7ehz?=
 =?us-ascii?Q?/SWQTg0M1rGYceZj9F6JpVqdWi1WMAi/Ys8qY6VVrKmJjtWS39Ku/8zHf+y8?=
 =?us-ascii?Q?a5s7Pj6YfBKRRhSqocTj2iArXakdqj3Et1tQoxfJDI0JaAQtsXYuzIPEHbcq?=
 =?us-ascii?Q?jbCVLjddawUb2JVmFdAX8g6E?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <61B7C66E9F819D448C70081DB23EB031@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1872
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	744eded7-49d4-448e-6274-08d8e79d2f0a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/iy953T8Dczni2OQ5ew+IfYUCgmt68V8aZupSyVy1q/iGQZmcLuECwKpcUqsMpbA7xYXbECal/YDeScQMSh4lEo/2dwDocpTtMA4cc7Ou+QUqhnESKO2spbeS0Cob8kGCaDx67BJtYX8t8MlCRE3/w0flB5rUPXw8lW23qbkWrlqXpYNz4jYcNcdFzUjPzn2V1uMK/eYchO+jvmJysol3lT5aHx9XRQSqGUfACWxWik2dNOMUD7VOrK7+hIq6isWmeVj1nMhB+gwn2fhR8kZeUH2ZRUQkdeEniFElbMsiCtwQUHsH7ixP9twjS5r1TsvdfFDDLfEWWWe6JOFM8dtTUA6rU7L4bdjqsee903Kr27DojYIzp2i+JZLkklIvQwcIoluuIhKDIS3a8mV3AKTY2PZkl2/gAEGgNalbZTHi7WGEtC3BCCubB2560TDsp5ka7jFbIngZEuHthgWIg4oFvWQ2cMTg52v28E+zMcQ3RWAv/M/FK3Lg9fy9Xwr90wnJaf3IXv35hR/U8SItIWUm6tl+1avUndV5XeYjHl2J7QXkdjTkFVQJog/vtKPUP+JiapIHWirzDIlACIDqpxo13LmotX7OhiTzT0K+3N0o268LU3+arkZM3eBTFUevgzwnT564n4aAs2OIECJLV8zUaYXHLu8ZRQNW80gLVY5/Q4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(83380400001)(356005)(47076005)(36756003)(316002)(6506007)(6486002)(82310400003)(5660300002)(86362001)(36860700001)(82740400003)(37006003)(54906003)(33656002)(478600001)(8936002)(81166007)(186003)(336012)(6636002)(70206006)(70586007)(2906002)(6512007)(6862004)(4326008)(26005)(2616005)(55236004)(53546011)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:29:56.3739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd74df1f-8ca1-4d92-492e-08d8e79d473a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4796

Hi Michal,

> On 15 Mar 2021, at 09:23, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Currently in order to link existing DTB into Xen image
> we need to either specify option CONFIG_DTB_FILE on the
> command line or manually add it into .config.
> Add Kconfig entry: CONFIG_DTB_FILE
> to be able to provide the path to DTB we want to embed
> into Xen image. If no path provided - the dtb will not
> be embedded.
>=20
> Remove the line: AFLAGS-y +=3D -DCONFIG_DTB_FILE=3D\"$(CONFIG_DTB_FILE)\"
> as it is not needed since Kconfig will define it in a header
> with all the other config options.
>=20
> Make a change in the linker script from:
> _sdtb =3D .;
> to:
> PROVIDE(_sdtb =3D .);
> to avoid creation of _sdtb if there is no reference to it.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

The use of ifnes and PROVIDE is very clever :-)

Cheers
Bertrand


> ---
> xen/arch/arm/Makefile     |  5 ++---
> xen/arch/arm/arm32/head.S |  4 ++--
> xen/arch/arm/arm64/head.S |  4 ++--
> xen/arch/arm/xen.lds.S    |  4 +---
> xen/common/Kconfig        | 10 ++++++++++
> 5 files changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 16e6523e2c..46e6a95fec 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -68,9 +68,8 @@ extra-y +=3D $(TARGET_SUBARCH)/head.o
>=20
> #obj-bin-y +=3D ....o
>=20
> -ifdef CONFIG_DTB_FILE
> +ifneq ($(CONFIG_DTB_FILE),"")
> obj-y +=3D dtb.o
> -AFLAGS-y +=3D -DCONFIG_DTB_FILE=3D\"$(CONFIG_DTB_FILE)\"
> endif
>=20
> ALL_OBJS :=3D $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
> @@ -137,7 +136,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
> xen.lds: xen.lds.S
> 	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>=20
> -dtb.o: $(CONFIG_DTB_FILE)
> +dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
>=20
> .PHONY: clean
> clean::
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index c404fa973e..50f019ed98 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -156,10 +156,10 @@ past_zImage:
>         sub   r10, r9, r0            /* r10 :=3D phys-offset */
>=20
>         /* Using the DTB in the .dtb section? */
> -#ifdef CONFIG_DTB_FILE
> +.ifnes CONFIG_DTB_FILE,""
>         ldr   r8, =3D_sdtb
>         add   r8, r10                /* r8 :=3D paddr(DTB) */
> -#endif
> +.endif
>=20
>         /* Initialize the UART if earlyprintk has been enabled. */
> #ifdef CONFIG_EARLY_PRINTK
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 5d44667bd8..f38a8dfca7 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -296,9 +296,9 @@ real_start_efi:
>         sub   x20, x19, x0           /* x20 :=3D phys-offset */
>=20
>         /* Using the DTB in the .dtb section? */
> -#ifdef CONFIG_DTB_FILE
> +.ifnes CONFIG_DTB_FILE,""
>         load_paddr x21, _sdtb
> -#endif
> +.endif
>=20
>         /* Initialize the UART if earlyprintk has been enabled. */
> #ifdef CONFIG_EARLY_PRINTK
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 004b182acb..540a7ccc9d 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -220,11 +220,9 @@ SECTIONS
>   } :text
>   _end =3D . ;
>=20
> -#ifdef CONFIG_DTB_FILE
>   /* Section for the device tree blob (if any). */
> -  _sdtb =3D .;
> +  PROVIDE(_sdtb =3D .);
>   .dtb : { *(.dtb) } :text
> -#endif
>=20
>   /* Sections to be discarded */
>   /DISCARD/ : {
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index eb953d171e..a1755cd380 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -400,6 +400,16 @@ config DOM0_MEM
>=20
> 	  Leave empty if you are not sure what to specify.
>=20
> +config DTB_FILE
> +	string "Absolute path to device tree blob"
> +	depends on HAS_DEVICE_TREE
> +	help
> +	  When using a bootloader that has no device tree support or when there
> +	  is no bootloader at all, use this option to specify the absolute path
> +	  to a device tree that will be linked directly inside Xen binary.
> +
> +	  This is an optional config. Leave empty if not needed.
> +
> config TRACEBUFFER
> 	bool "Enable tracing infrastructure" if EXPERT
> 	default y
> --=20
> 2.29.0
>=20


