Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7502B67105F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 02:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480061.744242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHxUd-0000st-Mt; Wed, 18 Jan 2023 01:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480061.744242; Wed, 18 Jan 2023 01:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHxUd-0000pz-J8; Wed, 18 Jan 2023 01:43:59 +0000
Received: by outflank-mailman (input) for mailman id 480061;
 Wed, 18 Jan 2023 01:43:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pHxUc-0000pt-7S
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 01:43:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2083.outbound.protection.outlook.com [40.107.8.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91bc0f18-96d1-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 02:43:56 +0100 (CET)
Received: from DB7PR05CA0064.eurprd05.prod.outlook.com (2603:10a6:10:2e::41)
 by DU0PR08MB9300.eurprd08.prod.outlook.com (2603:10a6:10:41f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 01:43:51 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::e9) by DB7PR05CA0064.outlook.office365.com
 (2603:10a6:10:2e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Wed, 18 Jan 2023 01:43:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 01:43:50 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Wed, 18 Jan 2023 01:43:50 +0000
Received: from 0db16cb1853e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE945F30-9B51-4F2D-A550-566266FE9C75.1; 
 Wed, 18 Jan 2023 01:43:45 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0db16cb1853e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 01:43:45 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM9PR08MB6020.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 18 Jan
 2023 01:43:43 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 01:43:43 +0000
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
X-Inumbo-ID: 91bc0f18-96d1-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpS6PScZSY6VWnV7kqq4QoafUlL/+ppe1J78pWtpZv4=;
 b=jaq0e4O8W9JDy2Oz4qRbzM/+66aozZ8waRG5h6FzDC7XmVCSqGGx9glzAkD7HYsuhaGcAgKC/azer+Uu/TFtL1yz1aFVYaANFxQn7X0oRcBNFjzHeS0NZBOovXOlYCmMkPGFVMXJbuhdK5t3mramg0GodQv6bvnM2ctXmG7fSxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyeJIBXqi3RAld6ffg6C1rLytjzvSVc8e/k6BPz+JC7WxzaJ+cipwaM7fnCaBdeNc7/sOM8WCJ1iOVM7s9WgrUnBLoauQGQXoUoDE1HojNRawvjTxO7EBzcIXs71XvBJR3mt1FNHxZVJU0CI5DepLJzuifTd488iBs5sz+HwUFZzrC+qZhRY4LTeQ8MsCiRJUkcpNaOBZ2iwkOZjpYyjMtSEg0XRt5KuTOAhmOeXhbypw7Og3jUhl6nEQPQI6mczGH/qfpHIfHq43wX7Fx8tfci5BuBMCtxqrzognAwZ0nMThfXGqvQRKHClIksDHusMoDBHFNBmkjKMCMrfvZOCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpS6PScZSY6VWnV7kqq4QoafUlL/+ppe1J78pWtpZv4=;
 b=CVv0Knzt9SjU6gcrCdMjANyV19UX0dadBetgIWLmt8iI5iTv5YU9msMTQNKGbrdGLynDU+NS3Pix1NmwPM2pZmC1E2VgBz2opSTNJHVtbRLOH7K+IZceddd74LqDKe0I/BJqmoa/uARwqaaaJbM3Qdk9pvaILUkdbDzLm7tuIkca3yJSn/Pz9VEwKzadDpX5W3tpCyIUC1QMWo1LO5jqHaOkoBDE7ORgGh4qjimP0DkeU9Ztl0dBK5JBHRIsqBfM8gs7qK9aS80Llv0j19AsZz462IjTUFDouc/9ovxuKdhvH8ouaOWSJUkcC8GgnWw0Z1OpYcuWuCS3mOgJfgRPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpS6PScZSY6VWnV7kqq4QoafUlL/+ppe1J78pWtpZv4=;
 b=jaq0e4O8W9JDy2Oz4qRbzM/+66aozZ8waRG5h6FzDC7XmVCSqGGx9glzAkD7HYsuhaGcAgKC/azer+Uu/TFtL1yz1aFVYaANFxQn7X0oRcBNFjzHeS0NZBOovXOlYCmMkPGFVMXJbuhdK5t3mramg0GodQv6bvnM2ctXmG7fSxQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 08/40] xen/arm: use PA == VA for
 EARLY_UART_VIRTUAL_ADDRESS on Armv-8R
Thread-Topic: [PATCH v2 08/40] xen/arm: use PA == VA for
 EARLY_UART_VIRTUAL_ADDRESS on Armv-8R
Thread-Index: AQHZJxAhOdeISnEbykSTu6lhfGgLIq6jTn6AgAAbGHA=
Date: Wed, 18 Jan 2023 01:43:42 +0000
Message-ID:
 <PAXPR08MB74205278BB264245DC91EFCB9EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-9-Penny.Zheng@arm.com>
 <09e4c2ef-eddf-e798-573b-68744a061d68@xen.org>
In-Reply-To: <09e4c2ef-eddf-e798-573b-68744a061d68@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 46A645E76417544AA7616AE3CE5E841E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AM9PR08MB6020:EE_|DBAEUR03FT019:EE_|DU0PR08MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: 40307e19-1e1b-47d0-493e-08daf8f57300
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ft7jaQrMEDQ+RE+JSBLg6AGD6X3fcUO+5ixnfL7WFq9/KyxpwhgZ221dFuLfjk7JrwQI4jhkSmx38eQpT/UteWQjIyFYbh/BMpaYgHgd4nN6YVtqLKxGrtPf9rDwHAVVTzyXPiiRqyefZxm5BRVF6S2IGV5QPRaGWrQXmHBPOu03zjWTlVTzwAASLqfuCFFzwDO2q3x6GlKmk7xoywc4wWDtpmxEhE1OUplwckmciHjZr6zn3YgYe0VT9KhG/sFCKTihSMuuzTS4QcQ5OCoTw6knOpj/s+xltNo18qLfJyfloPEFhOtfFDn+MpBo7mds1t7+E+RlfxhFfhhHX45OSrz8GbNg1Q6gkEyOnSmIdaYq+lHTkHxK+OjOHBpx2YDs2iCcCIkN/xdQsejCqhR8wvQVO5ZZsuuY/jKuEQ2BjRnU0LH1Tya4R1MYnmQs0IJl2hdx45nUlgJQHmfx1MokOVYYePxKUM4H91ujkBQKjLkHqrsZm8PBbg9l754I6dKEzRrdsSWxgmEnrvJr5KI6goX4XEkdKu0PijT1SZxrmpLLoBxO7vtv/1HnMPZ2ELJ9EErbIjeBcxguVWuD6jn8dyPJXuBgZCCP085IhpzO5r4KNLkvqLhcLRYEVGG031YZKnCGZ46lw6ok6UrZEtfID+4W1QCHUOfw3awp/C6uv0cJSiHq2J2NSWADaVirznfClTVmusB2owE0oR3Lsodc1w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199015)(8676002)(33656002)(66946007)(76116006)(66476007)(66446008)(55016003)(186003)(66556008)(41300700001)(9686003)(53546011)(64756008)(26005)(4326008)(86362001)(5660300002)(52536014)(83380400001)(8936002)(478600001)(110136005)(54906003)(6506007)(71200400001)(7696005)(316002)(38070700005)(2906002)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6020
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8f01498f-f109-4c9e-ae26-08daf8f56e53
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LdJrPkT+6zOx348IMgcmrctENaoWwvuVfN429AgxrWEtS2VZQOtv5oeQxK74cIo9NFd93G2lrIthGiLCKXNvpntvtT2wBMo882USkkD09a7KBEVeTk09hE9ENdurkcJ63h+hEoH82cmQV6Q3RKrvfaFmfipLJZXVDdFs1BNYMQaP6gnZVJvZpwl5DDwuvDLONbRRJLeg8pHxaXPaNQpZhR4iz3UFvngZ8q/eCANBHCjzM3NUhINH4Eg/ugbRqSZkRo7zTguS1RI4HU5AP09Nm3HGKhCjoVJ97Uaj5xpLU5G2cs5hSIvCQ9uWqMRd6759ubigC4USQkeBz8/I88MfJikZlO2Lb73AMaiotgIs/PqIj9enf4cjEAeBkvh6LrCrCbU1yafjrJznc9+hKF9if3qmnwATEjInV1TWpj4kTCHb38qxhpTuCx1TXmuZQYYMLptN03CQzp/ac+0gMXiSuDThHI3sWSGIUBfhYy8KOeKt9mV7Ks3zwySiMXfJuj50qAE5fXfF3a1aCTTgMOVSutMRAjivHDJq4hVuj2GFRb6Hvrj4Hbm6+jeH3wRYaH2RCGKRrVhVeyMTxhdFW8C4nZQfT5xcC3hE3DbOVHDEvkDzwT5FDWboOKCh7H/+XH6HTC9f2JMK05BC9wmI36ye2OTWfY7a+xwAygho87Yr3/ktOfJncy7p+QXLj9aNZo0f4M9YkIfJBTedJwB5Bf4w8g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(82310400005)(316002)(2906002)(54906003)(110136005)(336012)(53546011)(9686003)(26005)(186003)(86362001)(81166007)(356005)(47076005)(83380400001)(7696005)(33656002)(36860700001)(478600001)(40460700003)(55016003)(107886003)(40480700001)(6506007)(5660300002)(82740400003)(8936002)(4326008)(70206006)(8676002)(70586007)(52536014)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 01:43:50.6264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40307e19-1e1b-47d0-493e-08daf8f57300
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9300

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjPlubQx5pyIMTjml6UgNzo0OQ0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA4LzQwXSB4
ZW4vYXJtOiB1c2UgUEEgPT0gVkEgZm9yDQo+IEVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTIG9u
IEFybXYtOFINCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24gMTMvMDEvMjAyMyAwNToyOCwgUGVu
bnkgWmhlbmcgd3JvdGU6DQo+ID4gRnJvbTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+
ID4NCj4gPiBUaGVyZSBpcyBubyBWTVNBIHN1cHBvcnQgb24gQXJtdjgtUiBBQXJjaDY0LCBzbyB3
ZSBjYW4gbm90IG1hcCBlYXJseQ0KPiA+IFVBUlQgdG8gRklYTUFQX0NPTlNPTEUuIEluc3RlYWQs
IHdlIHVzZSBQQSA9PSBWQSB0byBkZWZpbmUNCj4gPiBFQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVT
UyBvbiBBcm12OC1SIEFBcmNoNjQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8
d2VpLmNoZW5AYXJtLmNvbT4NCj4gDQo+IFlvdXIgc2lnbmVkLW9mZi1ieSBpcyBtaXNzaW5nLg0K
PiANCj4gPiAtLS0NCj4gPiAxLiBOZXcgcGF0Y2gNCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9lYXJseV9wcmludGsuaCB8IDEyICsrKysrKysrKysrKw0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vZWFybHlfcHJpbnRrLmgNCj4gYi94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vZWFybHlfcHJpbnRrLmgNCj4gPiBpbmRleCBjNTE0OWIyOTc2Li40NGEyMzA4NTNm
IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9lYXJseV9wcmludGsu
aA0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9lYXJseV9wcmludGsuaA0KPiA+
IEBAIC0xNSwxMCArMTUsMjIgQEANCj4gPg0KPiA+ICAgI2lmZGVmIENPTkZJR19FQVJMWV9QUklO
VEsNCj4gPg0KPiA+ICsjaWZkZWYgQ09ORklHX0FSTV9WOFINCj4gDQo+IFNob3VsZG4ndCB0aGlz
IGJlIENPTkZJR19IQVNfTVBVPw0KPiANCg0KV2UgaGFkIGNvbnNpZGVyZWQgdGhhdCB0aGVyZSBt
YXkgYmUgYW4gaW1wbGVtZW50YXRpb24gb2YgQXJtOFIgd2l0aG91dA0KYW4gTVBVLCBzbyB3ZSB1
c2VkIENPTkZJR19BUk1fVjhSIGhlcmUuIEJ1dCB5b3UncmUgcmlnaHQsIHdlIGhhdmUgbm90DQpz
dXBwb3J0IG5vbi1NUFUgc2NlbmFyaW8gaW4gdGhpcyBzZXJpZXMsIHNvIHVzZSBDT05GSUdfSEFT
X01QVSBoZXJlDQp3b3VsZCBiZSBiZXR0ZXIgdG8gaW5kaWNhdGUgdGhpcyBpcyBhIGZlYXR1cmUg
YmFzZWQgY29kZSBzZWN0aW9uLg0KV2Ugd2lsbCBjaGFuZ2UgaXQgdG8gQ09ORklHX0hBU19NUFUg
aW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gKw0KPiA+ICsvKg0KPiA+ICsgKiBGb3IgQXJtdi04ciwg
dGhlcmUgaXMgbm90IFZNU0Egc3VwcG9ydCBpbiBFTDIsIHNvIHdlIHVzZSBWQSA9PSBQQQ0KPiAN
Cj4gcy9ub3Qvbm8vDQo+IA0KDQpPay4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiA+ICsgKiBm
b3IgRUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MuID4gKyAqLw0KPiA+ICsjZGVmaW5lIEVBUkxZ
X1VBUlRfVklSVFVBTF9BRERSRVNTIENPTkZJR19FQVJMWV9VQVJUX0JBU0VfQUREUkVTUw0KPiA+
ICsNCj4gPiArI2Vsc2UNCj4gPiArDQo+ID4gICAvKiBuZWVkIHRvIGFkZCB0aGUgdWFydCBhZGRy
ZXNzIG9mZnNldCBpbiBwYWdlIHRvIHRoZSBmaXhtYXAgYWRkcmVzcw0KPiAqLw0KPiA+ICAgI2Rl
ZmluZSBFQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUyBcDQo+ID4gICAgICAgKEZJWE1BUF9BRERS
KEZJWE1BUF9DT05TT0xFKSArIChDT05GSUdfRUFSTFlfVUFSVF9CQVNFX0FERFJFU1MgJg0KPiB+
UEFHRV9NQVNLKSkNCj4gPg0KPiA+ICsjZW5kaWYgLyogQ09ORklHX0FSTV9WOFIgKi8NCj4gPiAr
DQo+ID4gICAjZW5kaWYgLyogIUNPTkZJR19FQVJMWV9QUklOVEsgKi8NCj4gPg0KPiA+ICAgI2Vu
ZGlmDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

