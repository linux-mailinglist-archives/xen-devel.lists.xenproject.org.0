Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64D49C869
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 12:15:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260813.450924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCgGh-0001ad-UN; Wed, 26 Jan 2022 11:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260813.450924; Wed, 26 Jan 2022 11:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCgGh-0001Ym-Ql; Wed, 26 Jan 2022 11:15:15 +0000
Received: by outflank-mailman (input) for mailman id 260813;
 Wed, 26 Jan 2022 11:15:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG2W=SK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nCgGg-0001YY-OD
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 11:15:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b8de206-7e99-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 12:15:14 +0100 (CET)
Received: from AS8PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:20b:311::31)
 by HE1PR0801MB2121.eurprd08.prod.outlook.com (2603:10a6:3:80::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Wed, 26 Jan
 2022 11:15:10 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::6f) by AS8PR05CA0026.outlook.office365.com
 (2603:10a6:20b:311::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Wed, 26 Jan 2022 11:15:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 11:15:09 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Wed, 26 Jan 2022 11:15:09 +0000
Received: from 57ce7fbaef00.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6542E82A-2283-4314-8C2F-790ACF783762.1; 
 Wed, 26 Jan 2022 11:15:00 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57ce7fbaef00.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Jan 2022 11:15:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0801MB2006.eurprd08.prod.outlook.com (2603:10a6:4:79::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 11:14:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 11:14:56 +0000
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
X-Inumbo-ID: 3b8de206-7e99-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVGkjH3tRb9nMYO+u7HSiYAccb6EBrm0PR+smAqRjjY=;
 b=YKrbkgInN2atKemG3u8daKQHuYadkGU9gqmB4qkzvNXrjZ/e/8KTkF420JdrbHUIyEX9cUOhdF+6XRr9jzD4IZ+cMNAjWIQCTOZK/y/AGJhwMRZUvc30L+f0rXUnIiJ/iiPGtWWcVrI/7i0Twh8ATRny4b8rriIU4Kx/a6yZa2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 844d1f4a161a6f38
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UppbW6RqShyAkmZjRZgACFWmup2mqjhWqXr4YIEYPxO/vayuQd9ibr0GL+GCVSOtkuQhuwBgmEO5qP9TCUMAiZmerLboO5NPMNSybeLd2IVB2h1b7NAD3u8HkciDPcE0d14M1XbNeMT9GHJsqwPAvOyrtu+3aMDu3T/67rVVa/1zTlLpcOqscTwXYHI1pt5gGCOtFJ0c4bvbY1Vazsb/E+8JF6h29/bVKjZ6eVrraK1yQ2Z+SU0TuAXhscAzyWldL7PkCT5gGsQaaFE4NxOqxBu/DrGz08cmKmkfRN2IoLSt79zyT8HJ3W+pvkDkVhICRwrSohb/JdyuFkHh37HS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVGkjH3tRb9nMYO+u7HSiYAccb6EBrm0PR+smAqRjjY=;
 b=ng9nb/fZR7FnPPPxV4Vkk0gjDMTNm+9Yx4+0is1IwXdrAGNCljqnn3tErnNPL2FX0036dxcDZTuGs7t0oIVz+/mfmMUMHvcYe3jBGSJxSVyR0gRyCY/+NU3Hojtjl2HlwVrHsR89NlPLFc87/cc7kJKO2Ycck/PpkroK0/t7fGvrjfyVRv1h0I//EG+5GEYCdh9YAge9x6+PoCzZcPu48YtNK/z7bs1WgSG3fGtmrqBznII2lHI4Blwe8w25CPfqohzN7eMAEXOq2hodedlQ13CRwwp83J7Ujs3MUGNZuY9Re9jf/vuZyqc+ZdbvlVA/um1Zx9y+48H48yy2ivQdBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVGkjH3tRb9nMYO+u7HSiYAccb6EBrm0PR+smAqRjjY=;
 b=YKrbkgInN2atKemG3u8daKQHuYadkGU9gqmB4qkzvNXrjZ/e/8KTkF420JdrbHUIyEX9cUOhdF+6XRr9jzD4IZ+cMNAjWIQCTOZK/y/AGJhwMRZUvc30L+f0rXUnIiJ/iiPGtWWcVrI/7i0Twh8ATRny4b8rriIU4Kx/a6yZa2o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] design: design doc for shared memory on a dom0less system
Thread-Topic: [PATCH] design: design doc for shared memory on a dom0less
 system
Thread-Index: AQHYEpzfSIEi7U4qpUyQXv3OoTZGLKx1IfuAgAAEr4A=
Date: Wed, 26 Jan 2022 11:14:56 +0000
Message-ID: <2C44219B-A661-481E-851B-B2DF07ED6F84@arm.com>
References: <20220126100943.4086208-1-penny.zheng@arm.com>
 <c820b027-1b23-a762-ca91-7a2f0a46f423@xen.org>
In-Reply-To: <c820b027-1b23-a762-ca91-7a2f0a46f423@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fe44876f-da7a-414a-8bec-08d9e0bd1da2
x-ms-traffictypediagnostic:
	DB6PR0801MB2006:EE_|VE1EUR03FT028:EE_|HE1PR0801MB2121:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB21214B0129F25A134BD2B7839D209@HE1PR0801MB2121.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qfJhoTyU8DuTWKSPmv0SmDwuhA2YqbbB8OyjErjac51euDT4SpdoBRD86dmm1ubbr2tKntH7TTh87VG5mnO9M56rmr5s9Zrw4rWk+nQ+gk5jZAxGTd7ah5jYn2pqBMkXaqZGMeAh437ECXerCk3RndnsJ786U2GLfKkbBQtXvZp0W3ySYo+lKKKp/S6Nii/oBYMUkDNA8ZfYGE5cYbH23NaL/zuLPRzvDcmk7xZT60WZNBcQhHgjjOrAzBoIm1O0xewWbiJnedRLD0mEw2RVURfdL7jSXXLO6DFIqdwM2JuJ/riRycgz5kTIHp8OUJelwyl1i4GONfKJrU8XXcwO8UU5RgcASvMNchAsB5H0grOw5wkAR09q3SaJU7+aQ12J/j35eMg++8dSkX7BoWoJwNJ3oVXcy/M8+1ytIgWPHr8k4w+LFWQWqSwdtY5mqC7ZYPHUnpYxpc2GSIWm/FO0rBxAPo5slXmXtTuzloVk3ZlK16f5alASo020Ssm6RKCHNwba0N9Qhkz5IGoycqVJrpuLVMtXHsoKKXzisJWNocGNXVtwQI1QTNhbTd9xxBoA+2BSSgyQbkoyH6NJsfZgxwfxTjD04HyGZRTyCUrQqXtHV1i1e48WsyMevR6qSGYobpVJwTp4JuX8sSvPsWak7sWuUjd8MpzKm94zClmtgUZXUTXF2L8TmUi11EqO1KdssqwTbW3UCkguLcOti4ziCjb/NtlOK/D9FjI8HOCaO5wjvEuIzPQjjtbFRERSVBKqfLgn8xyChk9b4McvCcd+8ewFxYJ4/sVb1azCu3B0suBUzIBGwwBwM4btKcOK1R9fMY12hh5zWKvnBa+YXnW0PhO3OevpIJfhkzPtt7L964E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(186003)(26005)(966005)(33656002)(508600001)(6512007)(54906003)(316002)(91956017)(6916009)(5660300002)(86362001)(53546011)(64756008)(66446008)(6506007)(2906002)(8676002)(76116006)(66946007)(66556008)(66476007)(83380400001)(8936002)(38070700005)(4326008)(38100700002)(122000001)(71200400001)(2616005)(36756003)(32563001)(45980500001)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00863C2892729D4C87D2E3570166BA77@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2006
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ca338a5-8b56-48aa-e789-08d9e0bd155c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uu7ScTGVhZIPBtIgcIASZErGWMyxgCj4Z/UU4FGtS8rB6hHjxcR0eMHeNxQwozIjvt5rKNikfqg4iQ4rktQEPqRsccTS8tMdio1fOPGA/RJTLdsOjIFvDvlJ6XAuxgyUfTEXys5/Ba03iqV1EUkqqBJusyAQMmQi7jMznkcR/a7LwllSnp96cedwwIXSJsuhrc1lXATU8kM4o4EQW2N4iNrzzAKb9RUD7APxaBHI6G0ofOP7PHZwlZM4+DnAS53z8iEiikdHLroA/al5h+bgvdTGgn+qrwFQGRFdyTxv/hSJ9D8kDrEVmB/AGLQFSBHL1H8BBlY8+FvVf7aOJ3nYv7EL8Af17iRBTAinCo5PIUYE5h2CNGgDsDeaUNK+5V0oWeSr6X+9ZhA1N6LUlmZfyr64c3eSOlFb778npHAmJfplwUJ6SiMbQiilb23cjKGjaAzzpV0M6AJahLGR0o1wiW0yV94CHThmd2XRh484TtU5JU5GQLVBO6o/p1LhcviTpkD7TbwseHg5VjBePfygHIlvPYJ0G3kYhav/VjsZSOm8wJRrIjUVCOUQ4Z353MQo+iAmjRNMwXim8No2NHam0Nxi/xW8k2n6NP0curJ0iyXCuan1ORrHng9UlI5jzrgLwaeqVCGckTchG9r7GGH3FGEDmaGJD8JKdVMvuH670O9xbvxcme9mMKkNLL95z1c61EhYSOd3iPLf+HuXPAE5KaR5marXbw76WpCiFKj7d6ULLozqeVzMNeML7f1TfI+Oe9rqUTjwyeSwHibE9uirrfiulTNw3hlhrrYU6YyoASb33oAug3MV23zmjIhGgiPyRxyqezAfE3W5Potcjtppx8UpWpQQBaLsrPs4BwRmq0yI5l+biuGDu/NE3ZkWYPcb
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700004)(36840700001)(46966006)(2616005)(40460700003)(2906002)(6862004)(26005)(30864003)(82310400004)(6486002)(8676002)(33656002)(336012)(36756003)(47076005)(36860700001)(54906003)(4326008)(186003)(316002)(81166007)(966005)(86362001)(70206006)(6512007)(83380400001)(8936002)(5660300002)(356005)(53546011)(6506007)(508600001)(70586007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 11:15:09.6050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe44876f-da7a-414a-8bec-08d9e0bd1da2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2121

SGkgSnVsaWVuLA0KDQpUaGFua3MgYSBsb3QgZm9yIHRoZSBxdWljayBmZWVkYmFjay4NCg0KPiBP
biAyNiBKYW4gMjAyMiwgYXQgMTA6NTgsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdy
b3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAyNi8wMS8yMDIyIDEwOjA5LCBQZW5ueSBaaGVuZyB3
cm90ZToNCj4+IFRoaXMgY29tbWl0IHByb3ZpZGVzIGEgZGVzaWduIGRvYyBmb3Igc3RhdGljIHNo
YXJlZCBtZW1vcnkNCj4+IG9uIGEgZG9tMGxlc3Mgc3lzdGVtLg0KPj4gU2lnbmVkLW9mZi1ieTog
UGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+PiAtLS0NCj4+ICBkZXNpZ24vc2ht
LWRvbTBsZXNzLm1kIHwgMTgyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE4MiBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRlc2lnbi9zaG0tZG9tMGxlc3MubWQNCj4+IGRpZmYgLS1naXQgYS9kZXNpZ24v
c2htLWRvbTBsZXNzLm1kIGIvZGVzaWduL3NobS1kb20wbGVzcy5tZA0KPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAuLmI0NjE5OWQNCj4+IC0tLSAvZGV2L251bGwNCj4+
ICsrKyBiL2Rlc2lnbi9zaG0tZG9tMGxlc3MubWQNCj4+IEBAIC0wLDAgKzEsMTgyIEBADQo+PiAr
IyBTdGF0aWMgU2hhcmVkIE1lbW9yeSBiZXR3ZWVuIGRvbWFpbnMgb24gYSBkb20wbGVzcyBzeXN0
ZW0NCj4+ICsNCj4+ICtUaGlzIGRlc2lnbiBhaW1zIHRvIHByb3ZpZGUgYW4gb3ZlcnZpZXcgb2Yg
dGhlIG5ldyBmZWF0dXJlOiBzZXR0aW5nIHVwIHN0YXRpYw0KPj4gK3NoYXJlZCBtZW1vcnkgYmV0
d2VlbiBkb21haW5zIG9uIGEgZG9tMGxlc3Mgc3lzdGVtLCB0aHJvdWdoIGRldmljZSB0cmVlDQo+
PiArY29uZmlndXJhdGlvbi4NCj4+ICsNCj4+ICtUaGUgbmV3IGZlYXR1cmUgaXMgZHJpdmVuIGJ5
IHRoZSBuZWVkIG9mIGZpbmRpbmcgYSB3YXkgdG8gYnVpbGQgdXANCj4+ICtjb21tdW5pY2F0aW9u
IGNoYW5uZWxzIG9uIGRvbTBsZXNzIHN5c3RlbSwgc2luY2UgdGhlIGxlZ2FjeSB3YXlzIGluY2x1
ZGluZw0KPj4gK2dyYW50IHRhYmxlLCBldGMgYXJlIGFsbCBhYnNlbnQgdGhlcmUuDQo+IA0KPiBT
dGVmYW5vIGhhcyBhIHNlcmllcyB0byBhZGQgc3VwcG9ydCBmb3IgZ3JhbnQtdGFibGUgWzJdLiBT
byBJIHRoaW5rIHlvdSB3YW50IHRvIGp1c3RpZnkgaXQgZGlmZmVyZW50bHkuDQo+IA0KPj4gKw0K
Pj4gK0l0IHdhcyBpbnNwaXJlZCBieSB0aGUgcGF0Y2ggc2VyaWUgb2YgInhsL2xpYnhsLWJhc2Vk
IHNoYXJlZCBtZW1vcnkiLCBzZWUNCj4+ICtbMV0gZm9yIG1vcmUgZGV0YWlscy4NCj4+ICsNCj4+
ICsjIFN0YXRpYyBTaGFyZWQgTWVtb3J5IERldmljZSBUcmVlIENvbmZpZ3VyYXRpb24NCj4+ICsN
Cj4+ICtUaGUgc3RhdGljIHNoYXJlZCBtZW1vcnkgZGV2aWNlIHRyZWUgbm9kZXMgYWxsb3cgdXNl
cnMgdG8gc3RhdGljYWxseSBzZXQgdXANCj4+ICtzaGFyZWQgbWVtb3J5IGFtb25nIGEgZ3JvdXAg
b2YgZG9tMGxlc3MgRG9tVXMgYW5kIERvbTAsIGVuYWJsaW5nIGRvbWFpbnMNCj4+ICt0byBkbyBz
aG0tYmFzZWQgY29tbXVuaWNhdGlvbi4NCj4+ICsNCj4+ICstIGNvbXBhdGlibGUNCj4+ICsNCj4+
ICsgICAgInhlbixkb21haW4tc2hhcmVkLW1lbW9yeS12MSINCj4+ICsNCj4+ICstIHhlbixzaG0t
aWQNCj4gDQo+IEZyb20gdGhlIGRvY3VtZW50LCBpdCBpcyBub3QgY2xlYXIgdG8gbWUgd2hhdCBp
cyB0aGUgcHVycG9zZSBvZiB0aGUgaWRlbnRpZmllci4gQ291bGQgeW91IGNsYXJpZnkgaXQ/DQo+
IA0KPj4gKw0KPj4gKyAgICBBbiB1MzIgdmFsdWUgcmVwcmVzZW50cyB0aGUgdW5pcXVlIGlkZW50
aWZpZXIgb2YgdGhlIHNoYXJlZCBtZW1vcnkgcmVnaW9uLg0KPj4gKyAgICBVc2VyIHZhbHVpbmcg
cGVyIHNoYXJlZCBtZW1vcnkgcmVnaW9uIHNoYWxsIGZvbGxvdyB0aGUgYXNjZW5kaW5nIG9yZGVy
LA0KPj4gKyAgICBzdGFydGluZyBmcm9tIHhlbixzaG0taWQgPSA8MHgwPiwgdG8gdGhlIG1heGlt
dW0gaWRlbnRpZmllcg0KPj4gKyAgICB4ZW4sc2htLWlkID0gPDB4MTI2Pi4NCj4gDQo+IFdoeSBp
cyBpdCBsaW1pdCB0byAweDEyNj8gQW5kIGFsc28sIHdoeSBkbyB0aGV5IGhhdmUgdG8gYmUgYWxs
b2NhdGVkIGluIGFzY2VuZGluZyBvcmRlcj8NCj4gDQo+PiBUaGUgc3BlY2lhbCB4ZW4sc2htLWlk
ID0gPDB4MTI3PiBpcyByZXNlcnZlZCBmb3INCj4+ICsgICAgSU5WQUxJRF9TSE1JRC4NCj4gDQo+
IFdoeSBkbyB3ZSBuZWVkIHRvIHJlc2VydmUgaW52YWxpZD8NCj4gDQo+PiArDQo+PiArLSB4ZW4s
c2hhcmVkLW1lbQ0KPj4gKw0KPj4gKyAgICBBbiBhcnJheSB0YWtlcyBhIHBoeXNpY2FsIGFkZHJl
c3MsIHdoaWNoIGlzIHRoZSBiYXNlIGFkZHJlc3Mgb2YgdGhlDQo+PiArICAgIHNoYXJlZCBtZW1v
cnkgcmVnaW9uIGluIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSwgYSBzaXplLCBhbmQgYSBn
dWVzdA0KPj4gKyAgICBwaHlzaWNhbCBhZGRyZXNzLCBhcyB0aGUgdGFyZ2V0IGFkZHJlc3Mgb2Yg
dGhlIG1hcHBpbmcuDQo+IA0KPiBJIHRoaW5rIHNoYXJlZCBtZW1vcnkgaXMgdXNlZnVsIHdpdGhv
dXQgc3RhdGljIGFsbG9jYXRpb24uIFNvIEkgdGhpbmsgd2Ugd2FudCB0byBtYWtlIHRoZSBob3N0
IHBoeXNpY2FsIGFkZHJlc3Mgb3B0aW9uYWwuDQo+IA0KPj4gKw0KPj4gKy0gcm9sZShPcHRpb25h
bCkNCj4+ICsNCj4+ICsgICAgQSBzdHJpbmcgcHJvcGVydHkgc3BlY2lmeWluZyB0aGUgb3duZXJz
aGlwIG9mIGEgc2hhcmVkIG1lbW9yeSByZWdpb24sDQo+PiArICAgIHRoZSB2YWx1ZSBtdXN0IGJl
IG9uZSBvZiB0aGUgZm9sbG93aW5nOiAib3duZXIiLCBvciAiYm9ycm93ZXIiDQo+PiArICAgIEEg
c2hhcmVkIG1lbW9yeSByZWdpb24gY291bGQgYmUgZXhwbGljaXRseSBiYWNrZWQgYnkgb25lIGRv
bWFpbiwgd2hpY2ggaXMNCj4+ICsgICAgY2FsbGVkICJvd25lciBkb21haW4iLCBhbmQgYWxsIHRo
ZSBvdGhlciBkb21haW5zIHdobyBhcmUgYWxzbyBzaGFyaW5nDQo+PiArICAgIHRoaXMgcmVnaW9u
IGFyZSBjYWxsZWQgImJvcnJvd2VyIGRvbWFpbiIuDQo+PiArICAgIElmIG5vdCBzcGVjaWZpZWQs
IHRoZSBkZWZhdWx0IHZhbHVlIGlzICJib3Jyb3dlciIgYW5kIG93bmVyIGlzDQo+PiArICAgICJk
b21fc2hhcmVkIiwgYSBzeXN0ZW0gZG9tYWluLg0KPiANCj4gSSBkb24ndCBwYXJ0aWN1bGFybHkg
bGlrZSBhZGRpbmcgYW5vdGhlciBzeXN0ZW0gZG9tYWluLiBJbnN0ZWFkLCBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gYWx3YXlzIHNwZWNpZnkgdGhlIG93bmVyLg0KDQpIYXZpbmcgYW4gb3duZXIgd2hp
Y2ggaXMgbm90IFhlbiBpcyBjcmVhdGluZyBhIGRlcGVuZGVuY3kgc28gcmVzdGFydCB0aGUgb3du
ZXIgeW91IHdvdWxkIG5lZWQgdG8gcmVzdGFydCB0aGUgYm9ycm93ZXJzLg0KVG8gcmVtb3ZlIHRo
aXMgZGVwZW5kZW5jeSBhbmQgYWxsb3cgdXNlIGNhc2VzIHdoZXJlIGFueSBkb21haW4gaGF2aW5n
IGFjY2VzcyBjYW4gYmUgcmVzdGFydGVkIHdpdGhvdXQgdGhlIG90aGVyIHNpZGUNCm5lZWRpbmcg
dG8sIGhhdmluZyBYZW4gYXMgdGhlIG93bmVyIGlzIHJlcXVpcmVkLg0KDQpJbml0aWFsIGRpc2N1
c3Npb24gc3RhcnRlZCBiZXR3ZWVuIFBlbm55IGFuZCBTdGVmYW5vIHdlbnQgdGhlIHdheSB5b3Ug
c2FpZCBhbmQgSSBhc2tlZCB0byBtb2RpZnkgaXQgbGlrZSB0aGlzIHRvIGhhdmUgc29tZXRoaW5n
DQptb3JlIGxvb2tpbmcgbGlrZSBhIHN0YW5kYXJkIHNoYXJlZCBtZW1vcnkgd2l0aCBvbmx5IHVz
ZXJzIGJ1dCBubyDigJxvd25lcuKAnS4NCkFsc28gaXQgZml0cyB0byBzb21lIG9mIG91ciB1c2Ug
Y2FzZXMuDQoNCkFuZCBpdCBhbHNvIHNvbHZlIHNvbWUgb2YgdGhlIGlzc3VlcyB5b3UgZm91bmQg
Li4uDQoNCj4gDQo+PiArDQo+PiArIyMgRXhhbXBsZQ0KPj4gKw0KPj4gK2Nob3NlbiB7DQo+PiAr
ICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MT47DQo+PiArICAgICNzaXplLWNlbGxzID0gPDB4MT47
DQo+PiArICAgIHhlbix4ZW4tYm9vdGFyZ3MgPSAiY29uc29sZT1kdHVhcnQgZHR1YXJ0PXNlcmlh
bDAgYm9vdHNjcnViPTAiOw0KPj4gKw0KPj4gKyAgICAuLi4uLi4NCj4+ICsNCj4+ICsgICAgLyog
dGhpcyBpcyBmb3IgRG9tMCAqLw0KPj4gKyAgICBkb20wLXNoYXJlZC1tZW1AMTAwMDAwMDAgew0K
Pj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sZG9tYWluLXNoYXJlZC1tZW1vcnktdjEiOw0K
Pj4gKyAgICAgICAgeGVuLHNobS1pZCA9IDwweDA+Ow0KPj4gKyAgICAgICAgcm9sZSA9ICJvd25l
ciI7DQo+PiArICAgICAgICB4ZW4sc2hhcmVkLW1lbSA9IDwweDEwMDAwMDAwIDB4MTAwMDAwMDAg
MHgxMDAwMDAwMD47DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgZG9tVTEgew0KPj4gKyAgICAg
ICAgY29tcGF0aWJsZSA9ICJ4ZW4sZG9tYWluIjsNCj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxz
ID0gPDB4MT47DQo+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDE+Ow0KPj4gKyAgICAgICAg
bWVtb3J5ID0gPDAgMTMxMDcyPjsNCj4+ICsgICAgICAgIGNwdXMgPSA8Mj47DQo+PiArICAgICAg
ICB2cGwwMTE7DQo+PiArDQo+PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICogc2hhcmVkIG1l
bW9yeSByZWdpb24gaWRlbnRpZmllZCBhcyAweDAoeGVuLHNobS1pZCA9IDwweDA+KQ0KPj4gKyAg
ICAgICAgICogc2hhcmVkIGJldHdlZW4gZG9tMC4NCj4+ICsgICAgICAgICAqLw0KPj4gKyAgICAg
ICAgZG9tVTEtc2hhcmVkLW1lbUAxMDAwMDAwMCB7DQo+PiArICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJ4ZW4sZG9tYWluLXNoYXJlZC1tZW1vcnktdjEiOw0KPj4gKyAgICAgICAgICAgIHhlbixz
aG0taWQgPSA8MHgwPjsNCj4+ICsgICAgICAgICAgICByb2xlID0gImJvcnJvd2VyIjsNCj4+ICsg
ICAgICAgICAgICB4ZW4sc2hhcmVkLW1lbSA9IDwweDEwMDAwMDAwIDB4MTAwMDAwMDAgMHg1MDAw
MDAwMD47DQo+IA0KPiBUZWNobmljYWxseSwgeW91IGFscmVhZHkga25vdyB0aGUgcGh5c2ljYWwg
YWRkcmVzcyBmcm9tIHRoZSBvd25lci4gSW4gZmFjdCwgaXQgd2lsbCBvbmx5IGluY3JlYXNlIHRo
ZSByaXNrIHRvIGdldCB0aGUgd3JvbmcgYmluZGluZy4gU28gSSB3b3VsZCBsaWtlIHRvIHN1Z2dl
c3QgYSBkaWZmZXJlbnQgYmluZGluZy4NCj4gDQo+IDEpIFJlc2VydmUgdGhlIHJlZ2lvbiBpbiB0
aGUgaG9zdCBtZW1vcnkgdXNpbmcgcmVzZXJ2ZWQtbWVtb3J5IGJpbmRpbmcNCj4gMikgQ3JlYXRl
IGEgYmluZGluZyBwZXIgZG9tYWluIHRoYXQgY29udGFpbnMgYSBwaGFuZGxlIHRvIHRoZSBob3N0
IG1lbW9yeSBhbmQgdGhlIHJvbGUuDQo+IA0KPiBUaGUgYWR2YW50YWdlIHdpdGggdGhpcyBpcyB3
ZSBjb3VsZCBlYXNpbHkgc3VwcG9ydCByZWdpb24gdGhhdCBhcmUgbm90IGJhY2tlZCBieSBhIHJl
c2VydmVkLW1lbW9yeS4NCj4gDQo+IA0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAg
ZG9tVTEtc2hhcmVkLW1lbUA1MDAwMDAwMCB7DQo+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJ4ZW4sZG9tYWluLXNoYXJlZC1tZW1vcnktdjEiOw0KPj4gKyAgICAgICAgICAgIHhlbixzaG0t
aWQgPSA8MHgxPjsNCj4+ICsgICAgICAgICAgICB4ZW4sc2hhcmVkLW1lbSA9IDwweDUwMDAwMDAw
IDB4MjAwMDAwMDAgMHg2MDAwMDAwMD47DQo+PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAg
ICAuLi4uLi4NCj4+ICsNCj4+ICsgICAgfTsNCj4+ICsNCj4+ICsgICAgZG9tVTIgew0KPj4gKyAg
ICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sZG9tYWluIjsNCj4+ICsgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDB4MT47DQo+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDE+Ow0KPj4gKyAgICAg
ICAgbWVtb3J5ID0gPDAgNjU1MzY+Ow0KPj4gKyAgICAgICAgY3B1cyA9IDwxPjsNCj4+ICsNCj4+
ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBzaGFyZWQgbWVtb3J5IHJlZ2lvbiBpZGVudGlm
aWVkIGFzIDB4MSh4ZW4sc2htLWlkID0gPDB4MT4pDQo+PiArICAgICAgICAgKiBzaGFyZWQgYmV0
d2VlbiBkb21VMS4NCj4+ICsgICAgICAgICAqLw0KPj4gKyAgICAgICAgZG9tVTItc2hhcmVkLW1l
bUA1MDAwMDAwMCB7DQo+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sZG9tYWluLXNo
YXJlZC1tZW1vcnktdjEiOw0KPj4gKyAgICAgICAgICAgIHhlbixzaG0taWQgPSA8MHgxPjsNCj4+
ICsgICAgICAgICAgICB4ZW4sc2hhcmVkLW1lbSA9IDwweDUwMDAwMDAwIDB4MjAwMDAwMDAgMHg3
MDAwMDAwMD47DQo+PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICAuLi4uLi4NCj4+ICsg
ICAgfTsNCj4+ICt9Ow0KPj4gKw0KPj4gK0l0IGlzIHRoZSBleGFtcGxlIG9mIHR3byBzdGF0aWMg
c2hhcmVkIG1lbW9yeSByZWdpb25zLg0KPj4gKw0KPj4gK0luIHRlcm1zIG9mIHNoYXJlZCBtZW1v
cnkgcmVnaW9uIGlkZW50aWZpZWQgYXMgMHgwLCBob3N0IHBoeXNpY2FsIGFkZHJlc3MNCj4+ICtz
dGFydGluZyBhdCAweDEwMDAwMDAwIG9mIDI1Nk1CIHdpbGwgYmUgcmVzZXJ2ZWQgdG8gYmUgc2hh
cmVkIGJldHdlZW4gRG9tMA0KPj4gK2FuZCBEb21VMS4gSXQgd2lsbCBnZXQgbWFwcGVkIGF0IDB4
MTAwMDAwMDAgaW4gRG9tMCBndWVzdCBwaHlzaWNhbCBhZGRyZXNzDQo+PiArc3BhY2UsIGFuZCBh
dCAweDUwMDAwMDAwIGluIERvbVUxIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UuIERvbTAg
aXMgdGhlDQo+PiArb3duZXIgZG9tYWluLCBhbmQgZG9tVTEgaXMgdGhlIGJvcnJvd2VyIGRvbWFp
bi4NCj4+ICsNCj4+ICtBbmQgaW4gdGVybXMgb2Ygc2hhcmVkIG1lbW9yeSByZWdpb24gaWRlbnRp
ZmllZCBhcyAweDEsIGhvc3QgcGh5c2ljYWwgYWRkcmVzcw0KPj4gK3N0YXJ0aW5nIGF0IDB4NTAw
MDAwMDAgb2YgNTEyTUIgd2lsbCBiZSByZXNlcnZlZCB0byBiZSBzaGFyZWQgYmV0d2VlbiBEb21V
MQ0KPj4gK2FuZCBEb21VMi4gSXQgd2lsbCBnZXQgbWFwcGVkIGF0IDB4NjAwMDAwMDAgaW4gRG9t
VTEgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcw0KPj4gK3NwYWNlLCBhbmQgYXQgMHg3MDAwMDAwMCBp
biBEb21VMiBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlLiBTaW5jZSBubyBvd25lcg0KPj4g
K2RvbWFpbiBpcyBleHBsaWNpdGx5IGRlZmluZWQsIHRoZSBkZWZhdWx0ICJkb21fc2hhcmVkIiBp
cyB0aGUgb3duZXIgZG9tYWluLA0KPj4gK2FuZCBib3RoIGRvbVUxIGFuZCBkb21VMiBhcmUgdGhl
IGJvcnJvd2VyIGRvbWFpbnMuDQo+PiArDQo+PiArIyBPdmVydmlldyBvZiBTdGF0aWMgU2hhcmVk
IE1lbW9yeSBGbG93DQo+PiArDQo+PiArU3RhdGljIFNoYXJlZCBNZW1vcnkgd29ya2luZyBmbG93
IGNvdWxkIGJlIGNsYXNzaWZpZWQgaW50byB0aGUgZm9sbG93aW5nDQo+PiArc3RlcHM6DQo+PiAr
IC0gQ2FydmUgb3V0IGEgcmFuZ2Ugb2YgbWVtb3J5IGluIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBz
cGFjZSB0byBiZSB1c2VkDQo+PiArZm9yIHNoYXJpbmcuIERlZmluZSBpdCBpbiBkZXZpY2UgdHJl
ZSBjb25maWd1cmF0aW9uLCB0aGVuIHBhcnNlIGFuZCByZXNlcnZlDQo+PiAraXQgdG8gYXZvaWQg
b3RoZXIgdXNlLg0KPj4gKyAtIENyZWF0ZSBhIHNwZWNpYWwgZG9tYWluICJkb21fc2hhcmVkIi4g
SXQgd2lsbCBiZSB0aGUgb3duZXIgZG9tYWluIHdoaWNoDQo+PiAraXMgb3duaW5nIHRoZSBzdGF0
aWNhbGx5IHNoYXJlZCBwYWdlcywgaWYgInJvbGUiIHByb3BlcnR5IGlzIG5vdCBzcGVjaWZpZWQu
DQo+PiArIC0gUGVyIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGNvdWxkIGJlIHNoYXJlZCB3aXRoIG11
bHRpcGxlIGRvbWFpbnMuIEZvcg0KPj4gK293bmVyIGRvbWFpbiwgaXQgYWNxdWlyZXMgc3RhdGlj
YWxseSBzaGFyZWQgcGFnZXMgYW5kIGFzc2lnbiB0aGVtIHRvIGl0c2VsZiwNCj4+ICtpbiB0aGUg
c2FtZSB3YXkgd2l0aCBzdGF0aWMgbWVtb3J5LiBBbmQgb3RoZXIgdGhhbiBvd25lciBkb21haW4s
IHRoZSBvdGhlcnMNCj4+ICt3aG8gYXJlIGFsc28gc2hhcmluZyBhcmUgY2FsbGVkICJib3Jyb3dl
ciBkb21haW4iLCBmb3Igd2hpY2ggZm9yZWlnbiBtZW1vcnkNCj4+ICttYXAgb2Ygc3RhdGljYWxs
eSBzaGFyZWQgcGFnZXMgaXMgcmVxdWlyZWQuDQo+PiArIC0gRXhwb3NlIHRoZSBzaGFyZWQgbWVt
b3J5IHRvIHRoZSBkb21VIHVzaW5nIHRoZSAieGVuLHNoYXJlZC1tZW1vcnktdjEiDQo+PiArcmVz
ZXJ2ZWQtbWVtb3J5IGJpbmRpbmcuIFNlZQ0KPj4gK0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yZXNlcnZlZC1tZW1vcnkveGVuLHNoYXJlZC1tZW1vcnkudHh0DQo+PiAraW4gTGlu
dXggZm9yIHRoZSBjb3JyZXNwb25kaW5nIGRldmljZSB0cmVlIGJpbmRpbmcuDQo+PiArDQo+PiAr
IyBNZW1vcnkgbWFuYWdlbWVudCBvZiBTaGFyZWQgTWVtb3J5IFJlZ2lvbg0KPj4gKw0KPj4gK0Vh
Y2ggbWVtb3J5IHBhZ2UgbmVlZHMgdG8gaGF2ZSBhbiAib3duZXIiIGFuZCBpdCBpcyBsaWtlbHkg
dGhhdCBpbiBtYW55IGNhc2VzDQo+PiArdGhlIHVzZXIgZG9uJ3QgY2FyZSB3aG8gdGhlIG93bmVy
IGlzLCBzbyBpdCBtYWtlcyBzZW5zZSB0aGF0IHVzZXJzIGRvbid0DQo+PiArbmVlZCB0byBzcGVj
aWZ5IHRoZSAicm9sZSIgaW4gZGV2aWNlIHRyZWUgaWYgdGhleSBkb24ndCB3YW50IHRvLCBpbiB3
aGljaA0KPj4gK3NjZW5hcmlvLCBhIGRlZmF1bHQgZG9tYWluIHNoYWxsIGJlIHRoZSBvd25lciBk
b21haW4uDQo+PiArDQo+PiArV2UgcHJvcG9zZSBhIG5ldyBzeXN0ZW0gZG9tYWluICJkb21fc2hh
cmVkIiB0byBiZSB0aGUgZGVmYXVsdCBkb21haW4gb3duaW5nIGFsbA0KPj4gK3N0YXRpY2FsbHkg
dW5vd25lZCBzaGFyZWQgcGFnZXMsIGFzc2lnbmluZyBpdCBkb21faWQgMHg3RkY1KERPTUlEX1NI
QVJFRCkuDQo+PiArDQo+PiArImRvbV9zaGFyZWQiIGRvbWFpbiBzaGFsbCBnZXQgY29uc3RydWN0
ZWQgYmVmb3JlIGRvbWFpbiBjb25zdHJ1Y3Rpb24gYW5kIGFmdGVyDQo+PiArInNldHVwX3ZpcnRf
cGFnaW5nIiwgZHVyaW5nIHN5c3RlbSBib290LXRpbWUsIHNvIGl0IGNvdWxkIHN1Y2Nlc3NmdWxs
eSBkbw0KPj4gK3AybSBpbml0aWFsaXphdGlvbi4NCj4gDQo+IElITU8sIHRoaXMgaXMgZ29pbmcg
dG9vIG11Y2ggaW50byBkZXRhaWxzIGZvciBhIGRlc2lnbiBkb2N1bWVudC4gVGhlIGdvYWwgaXMg
dG8gYWJzdHJhY3QgdGhlIGZlYXR1cmUgcmF0aGVyIHRoYW4gbWVudGlvbmluZyB0aGUgaW1wbGVt
ZW50YXRpb24gKHdoaWNoIG1heSBjaGFuZ2UgZHVyaW5nIHJldmlldyBvciBpbiB0aGUgZnV0dXJl
KS4NCj4gDQo+PiArDQo+PiArT3duZXIgZG9tYWluIGFjcXVpcmVzIHN0YXRpY2FsbHkgc2hhcmVk
IHBhZ2VzIGFuZCBhc3NpZ24gdGhlbSB0byBpdHNlbGYsDQo+PiArd2hpbGUgYm9ycm93ZXIgZG9t
YWlucyBnZXQgYW5kIHRha2UgcmVmZXJlbmNlIG9mIHRoZW0sIHRoZW4gZG8gZm9yZWlnbiBtZW1v
cnkNCj4+ICttYXAgb2YgdGhlc2Ugc3RhdGljYWxseSBzaGFyZWQgcGFnZXMuDQo+IA0KPiBXaGF0
IGhhcHBlbnMgaWYgdGhlIGJvcnJvd2VyIGlzIHNlZW4gYmVmb3JlIHRoZSBvd25lcj8NCg0KVGhp
cyBpcyBub3QgYW4gaXNzdWUgaWYgWGVuIGlzIHRoZSBvd25lci4NCg0KPiANCj4+ICsNCj4+ICtX
aGVuIGRlc3Ryb3lpbmcgb3IgcmVib290aW5nIGEgZG9tYWluLCBpZiBpdCBpcyBhIGJvcnJvd2Vy
IGRvbWFpbiwgb3RoZXIgdGhhbg0KPj4gK3JlbW92aW5nIGZvcmVpZ24gbWVtb3J5IG1hcCBvZiBz
dGF0aWNhbGx5IHNoYXJlZCBwYWdlcyBpbiBQMk0gdGFibGUsIHdlIGFsc28NCj4+ICtuZWVkIHRv
IGRyb3AgYWNjb3JkaW5nIGdhaW5lZCByZWZlcmVuY2UuIEFuZCBpZiBpdCBpcyBhbiBvd25lciBk
b21haW4sIHNpbmNlDQo+PiArc3RhdGljYWxseSBzaGFyZWQgcGFnZXMgYXJlIGFsbG9jYXRlZCBh
cyBndWVzdCBub3JtYWwgcmFtLCBpdCBpcyBub3QgbmVlZGVkIHRvDQo+PiArZG8gZXh0cmEgcmVt
b3ZpbmcuDQo+PiArDQo+PiArSG93ZXZlciBpZiBvd25lciBkb21haW4gaXMgbm90IHRoZSBkZWZh
dWx0ICJkb21fc2hhcmVkIiBkb21haW4sIGJ1dCBzcGVjaWZpZWQNCj4+ICtleHBsaWNpdGx5IGlu
IGRldmljZSB0cmVlLCBzdG9wcGluZyBpdHNlbGYgd2lsbCBtYWtlIHNoYXJlZCBtZW1vcnkgcmVn
aW9uDQo+PiArdW5hY2Nlc3NpYmxlIHRvIGFsbCBib3Jyb3dlciBkb21haW5zLCBzbyB3ZSBuZWVk
IHRvIHJlbW92ZSBmb3JlaWduIG1lbW9yeSBtYXANCj4+ICtmb3IgYWxsIGJvcnJvd2VyIGRvbWFp
bnMuIE5vdGljZSB0aGF0IGFsbCBib3Jyb3dlcnMgZG9tYWlucyBzaG91bGQgYmUgc3RvcHBlZA0K
Pj4gK2JlZm9yZSBzdG9wcGluZyB0aGUgb3duZXIgZG9tYWluLg0KPiANCj4gSG93IHdpbGwgeW91
IGVuZm9yY2UgdGhhdD8NCg0KQW5kIHRoaXMgZWl0aGVyLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoN
Cj4gDQo+PiArDQo+PiArImRvbV9zaGFyZWQiIGRvbWFpbiBpcyBkZXN0cm95ZWQgd2hlbiB0aGUg
d2hvbGUgc3lzdGVtIHNodXRzIGRvd24sIHNvIGl0cw0KPj4gK293bmluZyBzdGF0aWNhbGx5IHNo
YXJlZCBwYWdlcyBhcmUgb25seSBmcmVlZCBhdCBzeXN0ZW0gc2h1dGRvd24uDQo+PiArDQo+PiAr
WzFdIGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE1NDQwNDgyMTczMTE4Ng0KPiAN
Cj4gWzJdIDxhbHBpbmUuREVCLjIuMjIuMzk0LjIyMDExMjE2NDYyOTAuMTkzNjJAdWJ1bnR1LWxp
bnV4LTIwLTA0LWRlc2t0b3A+DQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

