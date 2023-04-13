Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E026E0F44
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520777.808769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxOH-00053u-FU; Thu, 13 Apr 2023 13:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520777.808769; Thu, 13 Apr 2023 13:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxOH-00051P-C2; Thu, 13 Apr 2023 13:53:33 +0000
Received: by outflank-mailman (input) for mailman id 520777;
 Thu, 13 Apr 2023 13:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmxOF-00051J-SH
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:53:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 920bcd8a-da02-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 15:53:29 +0200 (CEST)
Received: from AM5PR0202CA0021.eurprd02.prod.outlook.com
 (2603:10a6:203:69::31) by GV2PR08MB8027.eurprd08.prod.outlook.com
 (2603:10a6:150:77::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 13:53:25 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::a3) by AM5PR0202CA0021.outlook.office365.com
 (2603:10a6:203:69::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 13:53:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Thu, 13 Apr 2023 13:53:24 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Thu, 13 Apr 2023 13:53:24 +0000
Received: from f0e5d4ac022f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22D427B3-6A3D-4AD2-98A1-D12CD192B6F5.1; 
 Thu, 13 Apr 2023 13:53:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0e5d4ac022f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 13:53:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5563.eurprd08.prod.outlook.com (2603:10a6:102:89::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:53:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 13:53:11 +0000
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
X-Inumbo-ID: 920bcd8a-da02-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/IiZS1H1pLzzQw8lxikRzQ5nWgyR1+jPu0WKdMTNjc=;
 b=nm7nbIVzgJdADF7rej5vFCPKbODKG2Sg0lZW6FwMmjtEppOJMT788w2snrez3drA+inVAFmO3szIUQrexgtTbsRnotrF8U+zLdACArZqsz9duQ9mm4K2CA58zXP1CU2o9RNZxszMJkzgNOBuFTae/PClcZHSmWhNFFYYu5PBvrw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gy6uKaLkpLZXAJKeAF+RACDIQioF8CPa7zV+125vQUYtFzkOmF3AlflQAe8CWbUMick//9uECIVrBlDALhwJjMQTjR3lYnUZTvJKbsf87xWYJpSpnNikbyiHnhNNRjij9l/l7N765H4HDwWBEMCdmqw/Mxlu7StsjP+gxhg9CInb+uCqNaCqo6tfEFn4K3Kv/fZyxLwRw/thQNJNOgXwnjPzioFHIbAxBvAnLj+hhZbF1mpaIBvlx0hsQvno/J62CZskY+OEZug5EKrSLwpS6qGVvFbMloKQzmeiaG4lPKLrq8sTdpgyNjRWOZNy4ITZgw+03Wsjps+fuUhOqawPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/IiZS1H1pLzzQw8lxikRzQ5nWgyR1+jPu0WKdMTNjc=;
 b=K1DNe5MeToeS+KC6X7aLaxxxgf0D+cw+mHJnraTnUgtI0HNT9jbBbhgG/5tQiIuXOdmNpIGOfHQDdVfy8aBp+RrrWfH70sQ10XjQLFlZe9vA1PceeA3k1EmJGr6VHjh/1O7ObHoQISrq0xACj/KS4YdGBmZGtxt3aqlyFI6mRcV1uhgyV9KD/fk01H5ezfSzjUFUZX0+VT/e+9j9i/R3yx9KxVjcR88aGjKnLlLtdlh24W1hK7Yzppra5P/BBxkSB/Xi+iARG1Ok9l2IiH9wesP/MdHVpUlJG/MDhU9BtIpwuqLcL78aUQTrPaLuCj4Nr1JTuTQS8LiYmzPMCeKIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/IiZS1H1pLzzQw8lxikRzQ5nWgyR1+jPu0WKdMTNjc=;
 b=nm7nbIVzgJdADF7rej5vFCPKbODKG2Sg0lZW6FwMmjtEppOJMT788w2snrez3drA+inVAFmO3szIUQrexgtTbsRnotrF8U+zLdACArZqsz9duQ9mm4K2CA58zXP1CU2o9RNZxszMJkzgNOBuFTae/PClcZHSmWhNFFYYu5PBvrw=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: RE: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for
 FFA_PARTITION_INFO_GET
Thread-Topic: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for
 FFA_PARTITION_INFO_GET
Thread-Index: AQHZbdfQYdI+Ke10g0y9D6f6Y8dBZq8pCBXggAA4ogCAAAB2UA==
Date: Thu, 13 Apr 2023 13:53:11 +0000
Message-ID:
 <AS8PR08MB799116F19A91F29F889D57A892989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-6-jens.wiklander@linaro.org>
 <AS8PR08MB79913E8D281DB674FDC0D70192989@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <CAHUa44FqgH3QRiTR=8v4WH+6XYbzwHYn8=Ht_KRC--jLWz9cog@mail.gmail.com>
In-Reply-To:
 <CAHUa44FqgH3QRiTR=8v4WH+6XYbzwHYn8=Ht_KRC--jLWz9cog@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CD35A620DCA0CA42B04F4775A9FD4A73.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5563:EE_|AM7EUR03FT040:EE_|GV2PR08MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 23265e6d-4a17-4572-997b-08db3c2673a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Kiw833tvy6p2VfGa30IJc4oruS7bWITyj1OHTUiDGjklItRiDrsIrAplUESIZ/vG8F0XB6EcDH2d69sTeykMFbdHp8o6HvpkTebszE6up/lBW2HHLYqvecTGFXGibBWs8xMUGq2LqXBG9Mp2A1yaancJXHs1W3kyrTRqY3SX6CSSzpiLfDQFnBqxSC1aQquJrm0rm1JJkzVWtsXGGuBaG0ZAiMJr2mOUmnlqkjpvxowAVEM4xNi92t1u62P8jcoN4mxMXuiTcJ56suzz8+Fqw5GCghH/6JhnIWpnmpMiQseDdjIe/nXMhzrrQsNypYUOXzdP/nUDQYSD4I98qlhUTEz9aMM3vksl4DLJxH6AhH6oQ+2x4NEldhchQ0hEmIwuc74irpLyoN/gqp31cS8DQCrvWRAo73BxOq/JNnPgUzxsvZa3YK5z03xK1+ljDNpssiD3EgFRPGgFf95qj2EJTkK3DN53gT0g+t8YKtT/jlckWvCsA7W9MMHlYLwtTUbeQkALXF+Vf9cvrCQWaPJHBh0zu1IqZ8U1C31zEAOEVZ2Ba1Wz8qkrog4E+bplU7fXH+rVF403Qa5wzwIcZss49ukya+qtZY2iCGPWsHW1l7qaKnv+q4j1OJa2CrOlJOkV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(8676002)(8936002)(76116006)(41300700001)(5660300002)(52536014)(66446008)(66476007)(66556008)(66946007)(64756008)(122000001)(6916009)(4326008)(316002)(2906002)(478600001)(54906003)(86362001)(38070700005)(38100700002)(7696005)(186003)(9686003)(6506007)(55016003)(71200400001)(83380400001)(26005)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5563
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	170c55e6-2a8b-41bc-6b82-08db3c266b9d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dePGJLiQc016Mm1JrOzms7JrxzI5M8Am8mHzkUd8CuRvkzb07inabgQYAGml/KZixqcjMGG6RAKsRJzSITcWsj4gO9rz2wQQEgM9uOpdAJDrhzBguxEolfvYOUHMnakMR9Z7Xg8rovCu35/GNLX6eIWjPt2TgNJA5kpVvo/U2/6O9yrBQRSfnwq7coypj5ZQqiy4JJS4xN6Haji0YYLibWhNkK8JSu1md16DSQcAi+RM1hnkRu4t97CbYeJv6SXxsErWgABq9MhY9USGzNTIUjn9qQeZ8eaUzvpmYVivjuFjSOXiVq1VP+eg8c1SYNCS6feJTDJ4hS/iZflRMnsGio14BnM4RzeQg0Ffjh4xXkLJYgLdRJ/MUJo/GvO4x39WN2mVefq/cIq5Ge64AmiJ0qvE+3nUqciIAKCWIKGI75ZAc98UPsTsFx9UjAepkRDwe+kVgmdiWLuiGlHDGikOw3sivmduymo1K4rBSHjf93CKDcoOSF6gRcrKSNjHSEbUuMLB/Dk7yd5o73ycoD7P0BoXCryD/ANsAiFziFKnt4APut3on1ofL8KWaR7W0J8aiKKLx5kdKyvEyxa355575XDXNndvv557GfcpINm4nChW6HEksLj91PkTDNrGuOS24rA6qD6imZFBhCttj2rE17JadMr3mMJF6up/RIkKjMFIg5s0Nk6B3o/qSMc3NIA45SzkntqWVnM4HWIDgaPh3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(478600001)(7696005)(83380400001)(40480700001)(55016003)(47076005)(356005)(81166007)(82740400003)(33656002)(336012)(86362001)(36860700001)(2906002)(316002)(6506007)(9686003)(26005)(186003)(54906003)(5660300002)(82310400005)(6862004)(52536014)(8936002)(41300700001)(40460700003)(8676002)(4326008)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:53:24.9506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23265e6d-4a17-4572-997b-08db3c2673a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8027

SGkgSmVucywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKZW5zIFdp
a2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJvLm9yZz4NCj4gU3ViamVjdDogUmU6IFtYRU4g
UEFUQ0ggdjggMDUvMjJdIHhlbi9hcm06IGZmYTogYWRkIGZsYWdzIGZvcg0KPiBGRkFfUEFSVElU
SU9OX0lORk9fR0VUDQo+ID4gPiArI2RlZmluZSBGRkFfUEFSVF9QUk9QX0RJUkVDVF9SRVFfUkVD
ViAgIEJJVCgwLCBVKQ0KPiA+ID4gKyNkZWZpbmUgRkZBX1BBUlRfUFJPUF9ESVJFQ1RfUkVRX1NF
TkQgICBCSVQoMSwgVSkNCj4gPiA+ICsjZGVmaW5lIEZGQV9QQVJUX1BST1BfSU5ESVJFQ1RfTVNH
UyAgICAgQklUKDIsIFUpDQo+ID4gPiArI2RlZmluZSBGRkFfUEFSVF9QUk9QX1JFQ1ZfTk9USUYg
ICAgICAgIEJJVCgzLCBVKQ0KPiA+ID4gKyNkZWZpbmUgRkZBX1BBUlRfUFJPUF9JU19NQVNLICAg
ICAgICAgICAoM1UgPDwgNCkNCj4gPg0KPiA+IEkgYW0gYSBiaXQgY29uZnVzZWQgaGVyZSwgaGVy
ZSAoM1U8PDQpIGlzICJJU19NQVNLIiBidXQuLi4NCj4gPg0KPiA+ID4gKyNkZWZpbmUgRkZBX1BB
UlRfUFJPUF9JU19QRV9JRCAgICAgICAgICAoMFUgPDwgNCkNCj4gPiA+ICsjZGVmaW5lIEZGQV9Q
QVJUX1BST1BfSVNfU0VQSURfSU5ERVAgICAgKDFVIDw8IDQpDQo+ID4gPiArI2RlZmluZSBGRkFf
UEFSVF9QUk9QX0lTX1NFUElEX0RFUCAgICAgICgyVSA8PCA0KQ0KPiA+ID4gKyNkZWZpbmUgRkZB
X1BBUlRfUFJPUF9JU19BVVhfSUQgICAgICAgICAoM1UgPDwgNCkNCj4gPg0KPiA+IC4uLmhlcmUg
dGhlIHNhbWUgdmFsdWUgaXMgdXNlZCBmb3IgIklTX0FVWF9JRCIuIEFjY29yZGluZyB0bw0KPiA+
IHRoZSBzcGVjIHRoYXQgSSByZWZlcnJlZCB0bywgYml0WzU6NF0gaGFzIHRoZSBmb2xsb3dpbmcg
ZW5jb2Rpbmc6DQo+ID4gYicxMTogUGFydGl0aW9uIElEIGlzIGFuIGF1eGlsaWFyeSBJRC4gSGVu
Y2UgSSBndWVzcyB0aGUgYWJvdmUNCj4gPiAiSVNfTUFTSyIgc2hvdWxkIGJlIHJlbW92ZWQ/DQo+
IA0KPiBGRkFfUEFSVF9QUk9QX0lTX01BU0sgaXMgc3VwcG9zZWQgdG8gYmUgdXNlZCB3aGVuIGV4
dHJhY3RpbmcgdGhlIGJpdHMNCj4gdG8gY29tcGFyZSB3aXRoIG9uZSBvZiB0aGUgb3RoZXIgIEZG
QV9QQVJUX1BST1BfSVNfKiBkZWZpbmVzLiBGb3INCj4gZXhhbXBsZToNCj4gaWYgKChwcm9wcyAm
IEZGQV9QQVJUX1BST1BfSVNfTUFTSykgPT0gRkZBX1BBUlRfUFJPUF9JU19QRV9JRCkNCg0KT2ho
IEkgbm93IHVuZGVyc3RhbmQsIHRoZSBuYW1pbmcgZG9lcyBub3QgbWVhbiBpdCAiaXMgYSBtYXNr
IiBidXQgYWN0dWFsbHkNCm1lYW5zICJ0aGlzIGlzIGEgbWFzayBmb3IgRkZBX1BBUlRfUFJPUF9J
U18iLiBUaGF0IG1ha2VzIGEgbG90IG9mIHNlbnNlLg0KDQpUbyBhdm9pZCB0aGlzIGtpbmQgb2Yg
YW1iaWd1aXR5LCBkbyB5b3UgdGhpbmsgY2hhbmdpbmcgdGhlIG5hbWUgdG8gc29tZXRoaW5nDQps
aWtlICJGRkFfUEFSVF9QUk9QX0lTX1RZUEVfTUFTSyIgbWFrZXMgc2Vuc2UgaGVyZT8gTm90ZSB0
aGF0IHRoaXMNCmlzIGp1c3QgbXkgc3VnZ2VzdGlvbiwgeW91IGNhbiBkZWNpZGUgdG8gY2hhbmdl
IG9yIG5vdCwgSSBhbSBhc2tpbmcganVzdA0KYmVjYXVzZSBJIGRvd25sb2FkZWQgdGhlIHdob2xl
IHNlcmllcyBhbmQgZm91bmQgdGhhdCBjdXJyZW50bHkNCkZGQV9QQVJUX1BST1BfSVNfTUFTSyBp
cyBub3QgdXNlZCBhbnl3aGVyZSwgc28gYmVmb3JlIGl0IGlzIHVzZWQgZXZlcnl3aGVyZQ0KaW4g
dGhlIGNvZGUsIGl0IG1pZ2h0IGJlIGdvb2QgdG8gdXNlIGEgbW9yZSBjbGVhciBuYW1lLg0KDQo+
IA0KPiB1c2luZw0KPiBpZiAoKHByb3BzICYgRkZBX1BBUlRfUFJPUF9JU19BVVhfSUQpID09IEZG
QV9QQVJUX1BST1BfSVNfUEVfSUQpDQo+IA0KPiBkb2Vzbid0IHNlZW0gcmlnaHQuDQoNCkluZGVl
ZC4gUGxlYXNlIHNlZSBteSBhYm92ZSByZXBseS4NCg0KUGVyc29uYWxseSBhZnRlciB0aGUgYWJv
dmUgY2xhcmlmaWNhdGlvbiwgSSBhbSBnb29kIHdpdGggdGhlIHBhdGNoLCBzbzoNCg0KUmV2aWV3
ZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0K
SGVucnkNCg0KPiANCj4gPg0KPiA+IEkgY29uZmlybSB0aGUgdmFsdWVzIG9mIG90aGVyIGZpZWxk
cyBhcmUgY29uc2lzdGVudCB3aXRoIHRoZSBzcGVjLg0KPiANCj4gVGhhbmtzLA0KPiBKZW5zDQo+
IA0KPiA+DQo+ID4gS2luZCByZWdhcmRzLA0KPiA+IEhlbnJ5DQo=

