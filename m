Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C76F86E0
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 18:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530520.826193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyQS-0000vP-Bq; Fri, 05 May 2023 16:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530520.826193; Fri, 05 May 2023 16:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyQS-0000s9-8M; Fri, 05 May 2023 16:36:56 +0000
Received: by outflank-mailman (input) for mailman id 530520;
 Fri, 05 May 2023 16:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5z1=A2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1puyQR-0000s3-47
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 16:36:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a2ad505-eb63-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 18:36:52 +0200 (CEST)
Received: from AS9PR06CA0617.eurprd06.prod.outlook.com (2603:10a6:20b:46e::28)
 by DBBPR08MB6010.eurprd08.prod.outlook.com (2603:10a6:10:20a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 16:36:49 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::11) by AS9PR06CA0617.outlook.office365.com
 (2603:10a6:20b:46e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27 via Frontend
 Transport; Fri, 5 May 2023 16:36:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.27 via Frontend Transport; Fri, 5 May 2023 16:36:49 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Fri, 05 May 2023 16:36:48 +0000
Received: from ca8a46735cf3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E47D95F-2933-4CDE-A313-4478EB5C3B26.1; 
 Fri, 05 May 2023 16:36:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca8a46735cf3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 May 2023 16:36:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB5PR08MB10047.eurprd08.prod.outlook.com (2603:10a6:10:4a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 16:36:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be%6]) with mapi id 15.20.6363.021; Fri, 5 May 2023
 16:36:35 +0000
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
X-Inumbo-ID: 0a2ad505-eb63-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBuac5j1CkQDJPxMr1oMigHqHJsCRs+q87fc4/OYyE0=;
 b=DpuC5N7HRaj+3ICHI5MvEHM7ZJ2HL26lkA2AA1AYHgoIViftYNazRLVkDmC99kt9+fZzDHkriDmb/k2bmRSCCzgETU5H0K5VxCtut6dfyosQjiHvoB+5E4+Cx5ttXwOKa9Pl2xSuvhFKfkuUpNDD6MI9tasyH/VTUj+qScM4rKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ea9e56575b35ba4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niJXtgMVCJghSiylNfNhRlICut4mMpVOe4Qn8Mj8G3wbdWIAZuRw8eDyvN95nplB86Rgov93bHKJ6ySlDa7dR0HvMOX9qYjJ3cePe5AnZhiwbgIXM4KbeuR22RpPvydEopaRYJiYv4wj2ggMtcUoVWEMbs315T4qyW9y9BFxd1ZlgaKI5UM8uYp2v/G5zGeAMJBbAy57gsroxudGiMI6IRPn0qyEoAns1M0wPh0YjPBKK8wzRLuh0Nx7gchfBXraAYnj4ouAYbQoK4z+hFJyfc56VjT9BLyoF+jzKoEGeSVdLCamzrS7cvzFtWrsT/Xg6IeXyyx3IEIZkKH4RNdEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBuac5j1CkQDJPxMr1oMigHqHJsCRs+q87fc4/OYyE0=;
 b=FWFMTdF0GzUdHY80NDNwAQ4rlzwzoNkDJcWheWe8MSeuv4Ubz6mJuiu1pdiGW+MBS1ueXLlazjsk0dKQw0cUtZSVbou/jbAzYwZ926eDWCvU+1br+x2UCfFUc68m/Uq6DxdZs7KCmvrqvaacQ1Fugwhzxy3qX7q+n/c79+vBJSaLJtM+AuHsYuDFEx8hIe3Nlu5Hwi2FQaNn9sKSbnP1poKrhQbWLhA5QoYK2g+8ddcJ+d025IdY31bqKroEJ72d9ce/b2LPTyW2YN3BR2e7FUf14rca6ooYGFUt5IVpsoocU8H9OFPbpZMH3z2R2p/aH4K4kMrnS/yayeW4yoNaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBuac5j1CkQDJPxMr1oMigHqHJsCRs+q87fc4/OYyE0=;
 b=DpuC5N7HRaj+3ICHI5MvEHM7ZJ2HL26lkA2AA1AYHgoIViftYNazRLVkDmC99kt9+fZzDHkriDmb/k2bmRSCCzgETU5H0K5VxCtut6dfyosQjiHvoB+5E4+Cx5ttXwOKa9Pl2xSuvhFKfkuUpNDD6MI9tasyH/VTUj+qScM4rKY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 10/12] xen/tools: add sve parameter in XL configuration
Thread-Topic: [PATCH v6 10/12] xen/tools: add sve parameter in XL
 configuration
Thread-Index: AQHZdnKI1/ryq6h2kEuVT2yTgC4YMq9HQ+EAgAAu74CABHwZgIAAA6SA
Date: Fri, 5 May 2023 16:36:32 +0000
Message-ID: <D11202BE-18AF-4F78-A422-B484E390AC15@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-11-luca.fancellu@arm.com>
 <996db21b-e963-4259-884d-2131c548ca1e@perard>
 <8C3DC6ED-83D8-4DD0-9C99-B34449304373@arm.com>
 <da845262-9bb3-467e-9f04-18c9eb06c2eb@perard>
In-Reply-To: <da845262-9bb3-467e-9f04-18c9eb06c2eb@perard>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB5PR08MB10047:EE_|AM7EUR03FT028:EE_|DBBPR08MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 89196cc3-0a0e-4432-1796-08db4d86ec91
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VTOL/3PHStL0SwwFAPIuCSeaHr2LGELHedp7rT28YOUlqSfccPOCgbeq9t80/xWC90frd8jIdDq2DQzE5Ofe+qRt+BuMUbMpTYLQQUi+IsaWFM5PgvdWT/BM58/DZTD+k/JWza9oNglEVKsZEX25c41oqRcV0uh7LzIxANqm1O9xPpvS70QdbQNJLb9lx2qkw6jGcGNcgI5i6h6FFXnSD4XzQOQ98RWulLWObcoBuJd72NPXpRO2ceUjvwvY1TZgtJgdDoScd0QpgSbHygP/Z9QPcuUFYOsibE/nI5NxLWmNCa0FSrnqQcN+9EGMkIlnXvVLN1e/93LSrW+eCRztorhmUUo07rqOO29EO/zoft0vwURqAsNsJu4BKhnLkwTPqgP1DyeeaVH7y3P8Cp4vSZyA3n6zEaPD32NUJsB2wuaVbDOiflzw+4p6qE6mldZjWD0KCxbRa+zOgHTPopWuvgAqeyIJx9Ep+vafF0H+p/uPBuSKy8ZcOGa2dHqt9Sw1N45yz9t28yjfs3aUDo33kWeF6oVie/j4aeHUnscwtZhxaR+zuPeGpVEGjKNR4jAK3TzS6z6tU5JEVktV8FjtSDQGSxp5Fyy7cZ5UlNNsBOHjeJTcELhI2ZUldFp3QTDsOyQr57Xvm3wQ4BUVQPqS4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(136003)(366004)(376002)(451199021)(36756003)(86362001)(33656002)(6666004)(6486002)(71200400001)(316002)(91956017)(54906003)(76116006)(66476007)(66556008)(66446008)(64756008)(6916009)(4326008)(478600001)(66946007)(8676002)(8936002)(5660300002)(41300700001)(2906002)(2616005)(38100700002)(38070700005)(122000001)(186003)(6506007)(6512007)(26005)(53546011)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CBE64C3515C9E4A9BE565F762B2E6D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10047
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3cf9d66b-249f-45b0-e003-08db4d86e279
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7q9ddN1LJ37biC3S/yuW1dQVpAHr9zKi+OgliZ4q9epaokqQVX6K3Rp5ohdRUlui3J7WB4fOD0NwDR5KPG5NQsNUgeY3PaFt9+OVZ0N3GhYxCSa3QVRO0mkWPRT3bB+7y3SOFIV7Ak5FmWVE6Httq9ROl3EXM1nZF/+F44I/9DdDsh61B4ZYfzYpJfSYF9Z3STpe36kzDRsFj6Z8y0zQMiDYEwA3TBsbMdGeOJBtiay9WGXMYKZfxqEspv5tcT02IyIHBOGMfKBb6xLSzDRzSJc1RQy4fr89dagVQKiIbLSdCCNsNOqo5BaspRtHk2+el9toavuBX+ujrCvCRMwj5U7wRizU8Or47wxh0TEmd1TXfcex52+jJ7k3uxeezMnVv4Z3564oDUnwyvMK6pvrBE7WzRY7C4tO6MWZln8DOq9jxBBKNE1QTEX99o4XdCvNEr+gtdKSmfk0HhVJU+Rk+jSGH4/vO0Hi8sMIm6BXDPwmaJMoLnpSlJW1pJjtE6/W4CufQooZaB+seX2PC5OGYSJx9QRY+9uhp2BAnw7vVuBlyDl5YRCuZ4l+l/1Au1eMpmcbFw+JqCDwKuo2F1fSwWu/KWtRKuy0O4oid0SGPMSzlZXeNJHl5OXvT6aIf6oud70kRBAAKj/MmneCPmPtZN65tPgA3j5mY6vodZJqxpj8BjVwqta/lJPJfhVkme597iXVg109PJe4hlp+4Qi62A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(70586007)(70206006)(4326008)(6486002)(6666004)(316002)(54906003)(33656002)(86362001)(36756003)(478600001)(47076005)(336012)(83380400001)(6506007)(107886003)(26005)(53546011)(36860700001)(6512007)(2616005)(8936002)(8676002)(6862004)(5660300002)(41300700001)(82310400005)(40480700001)(2906002)(186003)(82740400003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 16:36:49.2164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89196cc3-0a0e-4432-1796-08db4d86ec91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6010

DQoNCj4gT24gNSBNYXkgMjAyMywgYXQgMTc6MjMsIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgTWF5IDAyLCAyMDIzIGF0IDA3
OjU0OjE5UE0gKzAwMDAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gMiBNYXkgMjAyMywg
YXQgMTg6MDYsIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPiB3cm90
ZToNCj4+PiBPbiBNb24sIEFwciAyNCwgMjAyMyBhdCAwNzowMjo0NkFNICswMTAwLCBMdWNhIEZh
bmNlbGx1IHdyb3RlOg0KPj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9h
cm0uYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCj4+Pj4gaW5kZXggZGRjN2IyYTE1
OTc1Li4xZTY5ZGFjMmM0ZmEgMTAwNjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGli
eGxfYXJtLmMNCj4+Pj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0uYw0KPj4+PiBA
QCAtMjExLDYgKzIxMywxMiBAQCBpbnQgbGlieGxfX2FyY2hfZG9tYWluX3ByZXBhcmVfY29uZmln
KGxpYnhsX19nYyAqZ2MsDQo+Pj4+ICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsNCj4+Pj4gICAg
fQ0KPj4+PiANCj4+Pj4gKyAgICAvKiBQYXJhbWV0ZXIgaXMgc2FuaXRpc2VkIGluIGxpYnhsX19h
cmNoX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQgKi8NCj4+Pj4gKyAgICBpZiAoZF9jb25m
aWctPmJfaW5mby5hcmNoX2FybS5zdmVfdmwpIHsNCj4+Pj4gKyAgICAgICAgLyogVmVjdG9yIGxl
bmd0aCBpcyBkaXZpZGVkIGJ5IDEyOCBpbiBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4g
Ki8NCj4+Pj4gKyAgICAgICAgY29uZmlnLT5hcmNoLnN2ZV92bCA9IGRfY29uZmlnLT5iX2luZm8u
YXJjaF9hcm0uc3ZlX3ZsIC8gMTI4VTsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gICAgcmV0
dXJuIDA7DQo+Pj4+IH0NCj4+Pj4gDQo+Pj4+IEBAIC0xNjgxLDYgKzE2ODksMjYgQEAgaW50IGxp
YnhsX19hcmNoX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywNCj4+
Pj4gICAgLyogQUNQSSBpcyBkaXNhYmxlZCBieSBkZWZhdWx0ICovDQo+Pj4+ICAgIGxpYnhsX2Rl
ZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT5hY3BpLCBmYWxzZSk7DQo+Pj4+IA0KPj4+PiArICAg
IC8qIFNhbml0aXNlIFNWRSBwYXJhbWV0ZXIgKi8NCj4+Pj4gKyAgICBpZiAoYl9pbmZvLT5hcmNo
X2FybS5zdmVfdmwpIHsNCj4+Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IG1heF9zdmVfdmwgPQ0K
Pj4+PiArICAgICAgICAgICAgYXJjaF9jYXBhYmlsaXRpZXNfYXJtX3N2ZShwaHlzaW5mby0+YXJj
aF9jYXBhYmlsaXRpZXMpOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGlmICghbWF4X3N2ZV92bCkg
ew0KPj4+PiArICAgICAgICAgICAgTE9HKEVSUk9SLCAiU1ZFIGlzIHVuc3VwcG9ydGVkIG9uIHRo
aXMgbWFjaGluZS4iKTsNCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOw0KPj4+
PiArICAgICAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgaWYgKExJQlhMX1NWRV9UWVBFX0hX
ID09IGJfaW5mby0+YXJjaF9hcm0uc3ZlX3ZsKSB7DQo+Pj4+ICsgICAgICAgICAgICBiX2luZm8t
PmFyY2hfYXJtLnN2ZV92bCA9IG1heF9zdmVfdmw7DQo+Pj4+ICsgICAgICAgIH0gZWxzZSBpZiAo
Yl9pbmZvLT5hcmNoX2FybS5zdmVfdmwgPiBtYXhfc3ZlX3ZsKSB7DQo+Pj4+ICsgICAgICAgICAg
ICBMT0coRVJST1IsDQo+Pj4+ICsgICAgICAgICAgICAgICAgIkludmFsaWQgc3ZlIHZhbHVlOiAl
ZC4gUGxhdGZvcm0gc3VwcG9ydHMgdXAgdG8gJXUgYml0cyIsDQo+Pj4+ICsgICAgICAgICAgICAg
ICAgYl9pbmZvLT5hcmNoX2FybS5zdmVfdmwsIG1heF9zdmVfdmwpOw0KPj4+PiArICAgICAgICAg
ICAgcmV0dXJuIEVSUk9SX0ZBSUw7DQo+Pj4+ICsgICAgICAgIH0NCj4+PiANCj4+PiBZb3Ugc3Rp
bGwgbmVlZCB0byBjaGVjayB0aGF0IHN2ZV92bCBpcyBvbmUgb2YgdGhlIHZhbHVlIGZyb20gdGhl
IGVudW0sDQo+Pj4gb3IgdGhhdCB0aGUgdmFsdWUgaXMgZGl2aXNpYmxlIGJ5IDEyOC4NCj4+IA0K
Pj4gSSBoYXZlIHByb2JhYmx5IG1pc3NlZCBzb21ldGhpbmcsIEkgdGhvdWdodCB0aGF0IHVzaW5n
IHRoZSB3YXkgYmVsb3cgdG8NCj4+IHNwZWNpZnkgdGhlIGlucHV0IEkgaGFkIGZvciBmcmVlIHRo
YXQgdGhlIHZhbHVlIGlzIDAgb3IgZGl2aXNpYmxlIGJ5IDEyOCwgaXMgaXQNCj4+IG5vdCB0aGUg
Y2FzZT8gV2hvIGNhbiB3cml0ZSB0byBiX2luZm8tPmFyY2hfYXJtLnN2ZV92bCBkaWZmZXJlbnQg
dmFsdWUNCj4+IGZyb20gdGhlIGVudW0gd2Ugc3BlY2lmaWVkIGluIHRoZSAuaWRsPw0KPiANCj4g
YHhsYCBpc24ndCB0aGUgb25seSB1c2VyIG9mIGBsaWJ4bGAuIFRoZXJlJ3MgYGxpYnZpcnRgIGFz
IHdlbGwuIFdlIGFsc28NCj4gaGF2ZSBsaWJ4bCBiaW5kaW5ncyBmb3Igc2V2ZXJhbCBsYW5ndWFn
ZXMuDQoNClJpZ2h0LCB0aGlzIHBvaW50IHdhc27igJl0IGNsZWFyIHRvIG1lLCBJIHdpbGwgYWRk
IHRoZSBjaGVjayB0aGVyZSwgdGhhbmsgeW91DQpmb3IgdGhlIGV4cGxhbmF0aW9uLg0KDQo+IFRo
ZXJlJ3Mgbm90aGluZyBzdG9wcGluZyBhDQo+IGRldmVsb3BlciB0byB3cml0ZSBhIG51bWJlciBp
bnRvIGBzdmVfdmxgIGluc3RlYWQgb2YgY2hvb3Npbmcgb25lIG9mIHRoZQ0KPiB2YWx1ZSBmcm9t
IHRoZSBlbnVtLiBJIHRoaW5rIHdlIHNob3VsZCBwcm9iYWJseSBzYW5pdGl6ZSBhbnkgaW5wdXQg
dGhhdA0KPiBjb21lcyBmcm9tIG91dHNpZGUgb2YgbGlieGwsIHRoYXQncyBwcm9iYWJseSB0aGUg
Y2FzZSwgSSdtIG5vdCBzdXJlLg0KPiANCj4gU28gaWYgdmFsaWQgdmFsdWVzIGZvciBgc3ZlX3Zs
YCBhcmUgb25seSBudW1iZXJzIGRpdmlzaWJsZSBieSAxMjgsIGFuZA0KPiBzb21lIG90aGVyIGRp
c2NyZXRlIG51bWJlcnMsIHRoZW4gd2Ugc2hvdWxkIGNoZWNrIHRoYXQgdGhleSBhcmUsIG9yDQo+
IGNoZWNrIHRoYXQgdGhlIHZhbHVlIGlzIG9uZSBkZWZpbmVkIGJ5IHRoZSBlbnVtLg0KPiANCj4g
Q2hlZXJzLA0KPiANCj4gLS0gDQo+IEFudGhvbnkgUEVSQVJEDQoNCg==

