Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DC0633CD2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 13:47:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447148.703072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSgi-0003yS-4w; Tue, 22 Nov 2022 12:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447148.703072; Tue, 22 Nov 2022 12:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxSgi-0003va-22; Tue, 22 Nov 2022 12:47:44 +0000
Received: by outflank-mailman (input) for mailman id 447148;
 Tue, 22 Nov 2022 12:47:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPg5=3W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxSgh-0002ru-9l
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 12:47:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daaa1b8a-6a63-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 13:47:42 +0100 (CET)
Received: from AS9PR04CA0142.eurprd04.prod.outlook.com (2603:10a6:20b:48a::16)
 by DU0PR08MB7907.eurprd08.prod.outlook.com (2603:10a6:10:3b1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 12:47:40 +0000
Received: from VI1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::23) by AS9PR04CA0142.outlook.office365.com
 (2603:10a6:20b:48a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Tue, 22 Nov 2022 12:47:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT033.mail.protection.outlook.com (100.127.144.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 12:47:39 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Tue, 22 Nov 2022 12:47:39 +0000
Received: from 8848a3136710.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30A6D0E9-2E78-47AD-BE39-64FB0002094D.1; 
 Tue, 22 Nov 2022 12:47:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8848a3136710.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Nov 2022 12:47:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7766.eurprd08.prod.outlook.com (2603:10a6:20b:526::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Tue, 22 Nov
 2022 12:47:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.013; Tue, 22 Nov 2022
 12:47:30 +0000
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
X-Inumbo-ID: daaa1b8a-6a63-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LpsNp6smybJ3wD5pJJ7YlNcHmaZvW1d0m0RIET8cVQ=;
 b=y/Aal0RkF4JnptXV0DpqLEfUYcJ+5QpjVMYBhExL6oONRBxr0R9Ztvr85O6jYacZAwKGNkWYfbaYCiQ4+GVet97GiI5x5bDA5OOvBauqNHeEfaO2Bh8axKYuLzJ1HdqjKQK7AYvtd6QSVCBrCNdBBEPdmmtGpf1sY4lmWjMj7+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwX//6NGfyRDiSrofj/VxP0cKKmjDYy/qT4fGCLpfbA73t8QqHrN/4EWRLR/eDzV5vjpISrA98peJvGlnCh1eQx/a7WHyH7GoINCB24qNRopCWwlRSATT4IOVkTiRbozuzVA1yVvGHDI5AxBjTG2sL+Dn/WIu5hH+0Vp7cUy6Lhz2LuqE/wB8Jrd5V8dqyBavA37h8VosawvvIf/aCYm4L+eumWBTnQFjZ7cDM6GbtqazLGPnp8wbtlfynpFdRO1qphuqBIt02JqlPcCMmRRDWabgFS4pgowJQ+TujPJjZ0JuwlU90qirHjYeLokU32o2u9/VC2E8pMAmKbEyZSpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LpsNp6smybJ3wD5pJJ7YlNcHmaZvW1d0m0RIET8cVQ=;
 b=KPgL+Iqh2N20L0ZG3Roz6y3ezQlCM8LuWFffVyGTUmczYLu219t3Cn0aqZvMHwxRVp6psBreljpgG9OaxSPHwld/4jWZm/EMb7x38F20Kkn5719feFMrZRgkyt3ajc+B9LIC4fLs5xMLURVXDGEz9khf9hbkvlpqjK5G004jc0q0i91nF52DlmuhqSRI4uS92VA3G97aisSa2eJUwbc45z9u7LlFIQRxJuHBj2M3MCHjbQyVTr+piHsLRYoSAq8jVH6yMaWX8+XzI78Js5A0YVTyM6nB1nStkc5oQD5va7XxkU2AzYGMC75RQmbmUaxIYEVAWyAGro+BDCEZIvjY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LpsNp6smybJ3wD5pJJ7YlNcHmaZvW1d0m0RIET8cVQ=;
 b=y/Aal0RkF4JnptXV0DpqLEfUYcJ+5QpjVMYBhExL6oONRBxr0R9Ztvr85O6jYacZAwKGNkWYfbaYCiQ4+GVet97GiI5x5bDA5OOvBauqNHeEfaO2Bh8axKYuLzJ1HdqjKQK7AYvtd6QSVCBrCNdBBEPdmmtGpf1sY4lmWjMj7+c=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Community Manager <community.manager@xenproject.org>
Subject: RE: [PATCH v3 2/3] Changelog: Add __ro_after_init and CET
Thread-Topic: [PATCH v3 2/3] Changelog: Add __ro_after_init and CET
Thread-Index: AQHY/mWEFM0MUU7mj0ueqMutGzP20q5K3AqAgAAIFLA=
Date: Tue, 22 Nov 2022 12:47:30 +0000
Message-ID:
 <AS8PR08MB799169B92C29CB8E1DB06C80920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
 <20221122112623.1441905-3-Henry.Wang@arm.com>
 <91ccea91-5b4c-4348-0efa-725aca1d683a@xen.org>
In-Reply-To: <91ccea91-5b4c-4348-0efa-725aca1d683a@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 89417DCF1559ED40B991B3E4BB2698D2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB7766:EE_|VI1EUR03FT033:EE_|DU0PR08MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d388124-1692-4528-64c7-08dacc87bd5e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k74KjCyyVkqP/sevEJ8WGLu7zGL3gzXPf4FOS0O68Y04xFPbtmrJA31bFZuxBb2MRHQwtHJkRQa8Aa+BXFR9EkpQushLMLpQ80bhZoyz4PpKvfBV7+PQ+PLeiPWuf7OuT0Des79KTkRaKssTzA87RP5cdaaooceejiawCTrlzUg2qWZKd+N7SG0oCWA9+MMtKFxCdyxIzrTqWtzhl99vopkunMu5fdK7pFk/Cc0BrP3yIdAR3o9ADcGmiM7zBF4mK2YEjPz+hMivNm5IpVmSpYFy/sByykYqlSaPPmRzyasQAvcScg62cu67oghGFojvVWz9RYcy1uan+nMNQAeuR/TpOKMrKYUQXzZe2rs5DINCFDqJbwieZ9aJAXwsyoW60OBzz1PHHz63uuevyTUNLevPC0OYzrRpOSNfRRQlmZAliGPR9+CsdHoUw6m4EOfnbY8MvD8XnrtTWtm+4QBFZ8f5g7AIaAHmMhh97O2vhsYPDj1GrZYtk6b5u51ywEtg8qSFxfoJWcjLgCSfx/yWLOp3GMcN0uFpGBRtmLU82LPXgDFbqr849v9rqbvFg8UXZXWxcOa6Vq6RqDeN5xRuwdBrgjsM9nrJ6IB2/20VPh2vXqYC6WoXyY2U2bnCeujQM0tS6ecOQUHfKonXYSKSKlvVZ7RZdc+gJEwm6ngLPqb1pr8D1vbIxPJF2Vkc3rb8RFOJlNAskxyIFYQc2Dy0rLdXx+eaZHJtZoST10yD0mZwa01GQ/aT0iwMS1FEluQHNP23BC86h8/nfmtVUP7OSFTsKYsf8t3PNjrcs7SCRnUUBpqPHpv2Zlk37Q4phDskavfU9kNdTXZ7PXq+FtRQTg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(7696005)(6506007)(53546011)(26005)(186003)(110136005)(122000001)(2906002)(478600001)(71200400001)(9686003)(38070700005)(38100700002)(33656002)(55016003)(83380400001)(86362001)(8936002)(4744005)(41300700001)(76116006)(66556008)(64756008)(66946007)(66476007)(52536014)(8676002)(66446008)(5660300002)(4326008)(54906003)(316002)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7766
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f5d3210-6d3b-4f12-f273-08dacc87b832
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XN4sg3OGalV1/oukP8ct8jMAGqvZ/X6MRc0W4R/KnKrrfpgq+V5RriwA9CJb7iVto5qe7x4kzmTz1XD72ViTfpuUa4QJk28hXiiDV/uNb5lHE6REYpQR6EFinujVc1ZFRaA+9c7rxkPQZOP9eVsAu09KK14fVNc/v+/oD7NPxUAHDj0O/rTJkcgnUlpgQWRSqIoBcP8j3n2aCoEw1/vWeLPzgiZ+so7ym131O9jrPt8gjum7RcW90wcM4VGWmjP+AXlsSW5ndM6udpDftTzqZx/s5/FjQzNBK4OViWj/k955tYKpFhJxN+QDUvC/EUHUA+D2P4ZSL8bkvNlnGnf/TGoj2xrWyWoKThzJ7TmBUNWs+bgLfarvuwrrbtH2+KBXaAeL0dfoJhYkSzCckouSXXfuK7ohP34n5QlgkM3Q0bz5OZCQjvRs0WB/rNuVe81zMCimPQ8wKuOgIyck6wnh91DwyA3j9eCFbWWgu5QjHQlhxkD2esNIJpBT9SW+8pHEFOvaGyxQHQPc2vwT695QpvDUV+JX3bslXdDQuf4rV4eFdAqDE/DB4OPmCjD5DumA9MTtHtZ6SMUhQrfXk+pWjbEYTe4X7qMLVAhK7DtfV453Qb2DN9gkElX9cjlfh+pOEIoFxitE9enqcwGONoZ59+VyWVcOH8DBiAlgIRbpJXw2/6su8YkGbZDLRMKeh20cechWcUxMjXZpd79jFF+h1uXVpwj5aMpeGnnD8eFwxrW/PWJed6KqgCHQrrYEV1Y1AS8P6izsOooil2H3d163lvKjV71YXvf2uRhyFSjuOy4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(33656002)(70586007)(478600001)(70206006)(4326008)(8676002)(316002)(36860700001)(41300700001)(55016003)(5660300002)(82310400005)(52536014)(54906003)(40460700003)(110136005)(81166007)(82740400003)(356005)(40480700001)(47076005)(53546011)(26005)(6506007)(7696005)(9686003)(186003)(86362001)(83380400001)(336012)(2906002)(4744005)(8936002)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 12:47:39.4984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d388124-1692-4528-64c7-08dacc87bd5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7907

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi8zXSBD
aGFuZ2Vsb2c6IEFkZCBfX3JvX2FmdGVyX2luaXQgYW5kIENFVA0KPiANCj4gSGkgSGVucnksDQo+
IA0KPiBPbiAyMi8xMS8yMDIyIDExOjI2LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IEZyb206IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiANCj4g
WW91ciBzaWduZWQtb2ZmLWJ5IGlzIG1pc3NpbmcuDQoNClNvcnJ5IEkgY29tcGxldGVseSBmb3Jn
b3QgSSBuZWVkIHRvIGFkZCBteSBvd24gc2lnbi1vZmYgaWYgSSBjaGFuZ2VkDQpvdGhlciBwZW9w
bGUncyBwYXRjaC4gV2lsbCBhZGQgaW4gdjQuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

