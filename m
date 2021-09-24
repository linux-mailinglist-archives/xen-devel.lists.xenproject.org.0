Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE920416B2B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 07:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194917.347304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTdgu-00088v-QV; Fri, 24 Sep 2021 05:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194917.347304; Fri, 24 Sep 2021 05:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTdgu-00086L-NS; Fri, 24 Sep 2021 05:24:08 +0000
Received: by outflank-mailman (input) for mailman id 194917;
 Fri, 24 Sep 2021 05:24:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTdgs-00086F-VM
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 05:24:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9efbe5d-f110-4d99-92f8-9545335aab91;
 Fri, 24 Sep 2021 05:24:04 +0000 (UTC)
Received: from AS8P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::8)
 by DB8PR08MB5018.eurprd08.prod.outlook.com (2603:10a6:10:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 24 Sep
 2021 05:23:59 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::6a) by AS8P250CA0003.outlook.office365.com
 (2603:10a6:20b:330::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 05:23:59 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 05:23:59 +0000
Received: ("Tessian outbound b324a1dbd9be:v103");
 Fri, 24 Sep 2021 05:23:57 +0000
Received: from d7225c28f6e2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 68100AED-80F2-4B76-8C58-05D7F8FADA34.1; 
 Fri, 24 Sep 2021 05:23:46 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7225c28f6e2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 05:23:46 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6060.eurprd08.prod.outlook.com (2603:10a6:10:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 05:23:45 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 05:23:45 +0000
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
X-Inumbo-ID: f9efbe5d-f110-4d99-92f8-9545335aab91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSd0/RzzIp9LN58ByGpKpfys2qCamPVwSVxllXFsM3M=;
 b=17BRHa24PzzPBrJ/rH86FzkXiTeJNhgsWfSG0SExP2Uo1yVfKrvOgBVwSs29yfAFCnSQNR8ta29aZdqE29zbqiT90zAXgKuO3Nixu2p+OwIhv87XmKdXyIpw+quWZ8lyIdKvsL+ivgfZ3f5eQK+CUBXW+mJMmUGVjAJDJIHV5hw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQo9ExXWJdHidBiwBhGIEajZtFD+aN6QROBWWAC+AhlQlCOJUikQoRqoux8bvkD1qzE/jvbJeGj05uJ3glOYNkvxwCXJ3V7my8e2WdpjtmMhhklGshwei3EltpaIuYt9X5c/pXLISeMp2s3fyxm4Jet+/plt15bo8Yik+utBkPKJ15kTz+TgKBdJRVkz6IbR5RNcrsm5y3bvwFKtikiJxrsJLUJFFluDtLk71BFdBe0u/v3NfgJjXBbtFxkCngebv0wEaieYcanNsJiCTBG7Fwfhl1GuDKDfdDHQAFwQ3je8rFb/c3AJ4whuUrzs1vS9ufrOH4mMlnEncZ950bavOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oSd0/RzzIp9LN58ByGpKpfys2qCamPVwSVxllXFsM3M=;
 b=hIyW+GkQWCyJDDm1G7kMJR5HWRR2ySq8jUibG+A49MUJAd8wZHDyp9eJYIZ5Umlb/2DRH4c5UN3eoa60eTM13Ar7Nq/42/0SNsuVpYEKtXofnVnDq/ZF9vwwzg5hNPDwE2FPSMpwqHUIoM9sxHI49im3ZPNht3DzpRTC6xR63BnTfLYhgCRkK79FDEBJIwOIYxiAwFAQy/7tOiUDohcDo49cVC0G9XfOdLELXxNyEI3i0h4m+FkI8PZoOU6mN7z7KbqEp2l5BoHU9fZkPbqKR+MnH1DyO4albw3DSlIJeTr0yTwsVcHHyzdMQwIBqYUXXhk0ldFS6bUSSlxpmG6emQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSd0/RzzIp9LN58ByGpKpfys2qCamPVwSVxllXFsM3M=;
 b=17BRHa24PzzPBrJ/rH86FzkXiTeJNhgsWfSG0SExP2Uo1yVfKrvOgBVwSs29yfAFCnSQNR8ta29aZdqE29zbqiT90zAXgKuO3Nixu2p+OwIhv87XmKdXyIpw+quWZ8lyIdKvsL+ivgfZ3f5eQK+CUBXW+mJMmUGVjAJDJIHV5hw=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 31/37] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH 31/37] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Index: AQHXsHM2Uv3zsz8Z7USP26PICjaLN6uygQuAgAAi0qA=
Date: Fri, 24 Sep 2021 05:23:45 +0000
Message-ID:
 <DB9PR08MB6857DE08F7A14D887CD6DBC99EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-32-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231958250.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231958250.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E6777E74B2606742881527366C1376D5.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 61230c63-2902-4ba8-4ec1-08d97f1b8340
x-ms-traffictypediagnostic: DBBPR08MB6060:|DB8PR08MB5018:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5018DA36D42CE0D4E275A8F69EA49@DB8PR08MB5018.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DnahBi0biaiuLDEHUy8RJ9oiJcEkBFuQNl4v2egAnRCtdZmoO0TpKF/+m6XYsnpgTcjcGHsgpV8GGfMpxS83/3JBtVieN1BbjC/FmUiLRDn/Et/+kGSSYA24kLFPv85a8NQ64zoHTmfTUed/YmQJ98PGYVuYO01X0SEODRcEG1XN42Kb5vx6qubKD5Iq+USJFcm8lBvLmZ/9fAqagXBAROHN5HXce049pnKlnMqBIugRBMaYNl5rqT9+2yiH0rEsGkL76ipyQkNbhMvzNnmLdV+wpnLntQTzgesgtP/pXE+7WdmW83NIxcbb+daOkERxGQWpL7u0jRekM+6j8eW2h9RREn6cj7KLmDfnFIHUIBJ2kILBjFQYWjo1OvgH3GjxHtfxmv6mc1Lv3aoBdPePdYTQrLElzxfDMV1kNmCnn43furJjEp0mI8r7xPhq/uVD0TERsTxPDwcOolEgC1MY9646JbhvuylPF0FAidD8LFqKhRhSwMCkO30dr4/v2eGUR1mMRH+ZAPEGLb6o4vT13Tilg92xmImb90Ws+ZlmzTHud3RpGYSESA+ijdNqpRUIbBEKiBA/4TMcn2GT3WG3YNpVA4H5NvIYS+huyK2aLCOIloKrx6ZpYzbnUs8GW2vj0PadQ6owrFs1BSLKoQa1ykm13Ifaw2+ULQB7NScR+Nwa/YNwY4+2v+diaVUBwNG59gTdHLP80XAFcioysRGq/6wF9fmAc29Z0TgtcUNr1yD/A7Z0VeB9JI29/rHEwxHCjbIViS1L7wycxqJgwf1MWh11JB3E84xj5vA/Q4t6r/Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(52536014)(53546011)(508600001)(7696005)(33656002)(54906003)(8676002)(6916009)(186003)(38100700002)(122000001)(38070700005)(76116006)(6506007)(966005)(4326008)(83380400001)(2906002)(64756008)(316002)(66556008)(71200400001)(66446008)(8936002)(66476007)(55016002)(5660300002)(66946007)(86362001)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6060
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f21e6947-088c-4f7e-5c6a-08d97f1b7ae0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	deYq4XvPI+5giYDb9EPH1FA++bhWyaX1nmFjI9B7/Mlaxv8ut25+lpk4h1b9UBybW1z4y7XzTSp6M1vdrrOtXaIND9gHIxhNxhdjKrfnSpTMrKDMrj57FXjpJeuy9Tar+Ak/mPdWfyzxIq6uG+pivL1dqt5Q3Hx54fNXMc6S/NoT6cyfkhSRlkrcpXeZ+4LZIGN2iZaaiW76eprNKU54+K+lteY9n5YsXi+Ne5f/O5tflJ3p44m3i4R80YHXR2089p7gsBjcWOJrInV+expr1IA/icotbjOLJ81caLnLO7hdga/l+NRCrGsAbmDshaqW4YB3HoMS/0yTDq8RbwDKnyyILkGMDj7Y7c5B8YbKnoRNgvBGucpIW488c+8LJrOhaURtpJtE9fx6Xpl/Z17PErxS/9LvJv7s3YJMWfS7xu4UPlHRUlQecYKSOpCi5XBB9FtT7bUeUq6oMJCHQx4AhZKKyjbXjtN6G078f1TRqlHzjnpDdDcZ9ZhNz5kFbe67PK4hJfp5fc0Eq4Dwr0pXht0SAjqgraL50q+M1vNPDOQHT/S0PuCc0rEBzj2bpPI54FDMta9S8daPSPeNr3BDhimRYM3yC9LCP2O9zG2Q7xrq2Y0Fb2etOsnyhy+fiX9P9TYPjZlbCSSSCEpLNBNVT2O+76yy85aaOxzL1vqpwPpFF5+nmXB2CiA+f19yv/vWzHZlfd4bJImWlYDKlIuXO3eCyB0++uw6RuoYEJpJwCmbeneY4cyyWoApnFoNUcrhXE367TC191uVjj7WZE7LO600JdyxMC61SR7G3sIeDuQ=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(33656002)(54906003)(55016002)(70206006)(36860700001)(7696005)(356005)(508600001)(6862004)(52536014)(8936002)(2906002)(26005)(81166007)(8676002)(47076005)(186003)(336012)(966005)(83380400001)(316002)(86362001)(53546011)(70586007)(5660300002)(9686003)(6506007)(82310400003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 05:23:59.1170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61230c63-2902-4ba8-4ec1-08d97f1b8340
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5018

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgMTE6MDUNCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxp
ZW5AeGVuLm9yZzsNCj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMxLzM3XSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYSBoZWxw
ZXIgdG8gcGFyc2UgZGV2aWNlDQo+IHRyZWUgTlVNQSBkaXN0YW5jZSBtYXANCj4gDQo+IE9uIFRo
dSwgMjMgU2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEEgTlVNQSBhd2FyZSBkZXZpY2Ug
dHJlZSB3aWxsIHByb3ZpZGUgYSAiZGlzdGFuY2UtbWFwIiBub2RlIHRvDQo+ID4gZGVzY3JpYmUg
ZGlzdGFuY2UgYmV0d2VlbiBhbnkgdHdvIG5vZGVzLiBUaGlzIHBhdGNoIGludHJvZHVjZSBhDQo+
ID4gbmV3IGhlbHBlciB0byBwYXJzZSB0aGlzIGRpc3RhbmNlIG1hcC4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICB4ZW4v
YXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jIHwgMTA2ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gYi94ZW4v
YXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gaW5kZXggNzkxOGEzOTdmYS4uZTdmYTg0
ZGY0YyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+
ID4gKysrIGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0KPiA+IEBAIC0xMzYsMyAr
MTM2LDEwOSBAQCBzdGF0aWMgaW50IF9faW5pdCBmZHRfcGFyc2VfbnVtYV9tZW1vcnlfbm9kZShj
b25zdA0KPiB2b2lkICpmZHQsIGludCBub2RlLA0KPiA+DQo+ID4gICAgICByZXR1cm4gMDsNCj4g
PiAgfQ0KPiA+ICsNCj4gPiArDQo+ID4gKy8qIFBhcnNlIE5VTUEgZGlzdGFuY2UgbWFwIHYxICov
DQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGZkdF9wYXJzZV9udW1hX2Rpc3RhbmNlX21hcF92MShj
b25zdCB2b2lkICpmZHQsIGludA0KPiBub2RlKQ0KPiA+ICt7DQo+ID4gKyAgICBjb25zdCBzdHJ1
Y3QgZmR0X3Byb3BlcnR5ICpwcm9wOw0KPiA+ICsgICAgY29uc3QgX19iZTMyICptYXRyaXg7DQo+
ID4gKyAgICB1aW50MzJfdCBlbnRyeV9jb3VudDsNCj4gPiArICAgIGludCBsZW4sIGk7DQo+ID4g
Kw0KPiA+ICsgICAgcHJpbnRrKFhFTkxPR19JTkZPICJOVU1BOiBwYXJzaW5nIG51bWEtZGlzdGFu
Y2UtbWFwXG4iKTsNCj4gPiArDQo+ID4gKyAgICBwcm9wID0gZmR0X2dldF9wcm9wZXJ0eShmZHQs
IG5vZGUsICJkaXN0YW5jZS1tYXRyaXgiLCAmbGVuKTsNCj4gPiArICAgIGlmICggIXByb3AgKQ0K
PiA+ICsgICAgew0KPiA+ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiA+ICsgICAg
ICAgICAgICAgICAiTlVNQTogTm8gZGlzdGFuY2UtbWF0cml4IHByb3BlcnR5IGluIGRpc3RhbmNl
LW1hcFxuIik7DQo+IA0KPiBJIGhhdmVuJ3Qgc2VlbiB3aGVyZSB0aGlzIGlzIGNhbGxlZCBmcm9t
IHlldCBidXQgbWFrZSBzdXJlIHRvIHByaW50IGFuDQo+IGVycm9yIGhlcmUgb25seSBpZiBOVU1B
IGluZm8gaXMgYWN0dWFsbHkgZXhwZWN0ZWQgYW5kIHJlcXVpcmVkLCBub3Qgb24NCj4gcmVndWxh
ciBub24tTlVNQSBib290cyBvbiBub24tTlVNQSBtYWNoaW5lcy4NCj4gDQoNCk9ubHkgdXNlcnMg
ZW5hYmxlIE5VTUEgb3B0aW9uIGFuZCBudW1hX29mZiBpcyBmYWxzZSwgdGhlbiBYZW4gY2FuIHJ1
biBpbnRvDQp0aGlzIGZ1bmN0aW9uICh0aGlzIGNoZWNrIGlzIGluIG51bWFfaW5pdCkuIFNvIG5v
bi1OVU1BIG1hY2hpbmVzIHdpbGwgbm90DQpyZWFjaCBoZXJlLg0KDQo+IA0KPiA+ICsgICAgICAg
IHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmICggbGVuICUg
c2l6ZW9mKHVpbnQzMl90KSAhPSAwICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwcmludGso
WEVOTE9HX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgICAgImRpc3RhbmNlLW1hdHJpeCBpbiBu
b2RlIGlzIG5vdCBhIG11bHRpcGxlIG9mIHUzMlxuIik7DQo+ID4gKyAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgZW50cnlfY291bnQgPSBsZW4gLyBz
aXplb2YodWludDMyX3QpOw0KPiA+ICsgICAgaWYgKCBlbnRyeV9jb3VudCA9PSAwICkNCj4gPiAr
ICAgIHsNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIk5VTUE6IEludmFsaWQg
ZGlzdGFuY2UtbWF0cml4XG4iKTsNCj4gPiArDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgbWF0cml4ID0gKGNvbnN0IF9fYmUzMiAqKXBy
b3AtPmRhdGE7DQo+ID4gKyAgICBmb3IgKCBpID0gMDsgaSArIDIgPCBlbnRyeV9jb3VudDsgaSAr
PSAzICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICB1aW50MzJfdCBmcm9tLCB0bywgZGlzdGFu
Y2UsIG9wcG9zaXRlOw0KPiA+ICsNCj4gPiArICAgICAgICBmcm9tID0gZHRfbmV4dF9jZWxsKDEs
ICZtYXRyaXgpOw0KPiA+ICsgICAgICAgIHRvID0gZHRfbmV4dF9jZWxsKDEsICZtYXRyaXgpOw0K
PiA+ICsgICAgICAgIGRpc3RhbmNlID0gZHRfbmV4dF9jZWxsKDEsICZtYXRyaXgpOw0KPiA+ICsg
ICAgICAgIGlmICggKGZyb20gPT0gdG8gJiYgZGlzdGFuY2UgIT0gTlVNQV9MT0NBTF9ESVNUQU5D
RSkgfHwNCj4gPiArICAgICAgICAgICAgKGZyb20gIT0gdG8gJiYgZGlzdGFuY2UgPD0gTlVNQV9M
T0NBTF9ESVNUQU5DRSkgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgcHJpbnRr
KFhFTkxPR19XQVJOSU5HDQo+ID4gKyAgICAgICAgICAgICAgICAgICAiTlVNQTogSW52YWxpZCBk
aXN0YW5jZTogTk9ERSMldS0+Tk9ERSMldToldVxuIiwNCj4gPiArICAgICAgICAgICAgICAgICAg
IGZyb20sIHRvLCBkaXN0YW5jZSk7DQo+ID4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
PiA+ICsgICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJO
VU1BOiBkaXN0YW5jZTogTk9ERSMldS0+Tk9ERSMldToldVxuIiwNCj4gPiArICAgICAgICAgICAg
ICAgZnJvbSwgdG8sIGRpc3RhbmNlKTsNCj4gPiArDQo+ID4gKyAgICAgICAgLyogR2V0IG9wcG9z
aXRlIHdheSBkaXN0YW5jZSAqLw0KPiA+ICsgICAgICAgIG9wcG9zaXRlID0gX19ub2RlX2Rpc3Rh
bmNlKGZyb20sIHRvKTsNCj4gDQo+IFRoaXMgaXMgbm90IGNoZWNraW5nIGZvciB0aGUgb3Bwb3Np
dGUgbm9kZSBkaXN0YW5jZSBidXQuLi4NCj4gDQoNCkFoLCB5ZXMsIGl0J3MgYSBtaXN0YWtlLiBJ
dCBzaG91bGQgYmUgX19ub2RlX2Rpc3RhbmNlKHRvLCBmcm9tKTsNCj4gDQo+ID4gKyAgICAgICAg
aWYgKCBvcHBvc2l0ZSA9PSAwICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIC8q
IEJpLWRpcmVjdGlvbnMgYXJlIG5vdCBzZXQsIHNldCBib3RoICovDQo+ID4gKyAgICAgICAgICAg
IG51bWFfc2V0X2Rpc3RhbmNlKGZyb20sIHRvLCBkaXN0YW5jZSk7DQo+ID4gKyAgICAgICAgICAg
IG51bWFfc2V0X2Rpc3RhbmNlKHRvLCBmcm9tLCBkaXN0YW5jZSk7DQo+IA0KPiAuLi5zaW5jZSB5
b3Ugc2V0IGJvdGggZGlyZWN0aW9ucyBoZXJlIGF0IG9uY2UgdGhlbiBpdCBpcyBPSy4gWW91IGFy
ZQ0KPiBjaGVja2luZyBpZiB0aGlzIGRpcmVjdGlvbiBoYXMgYWxyZWFkeSBiZWVuIHNldCB3aGlj
aCBpcyBjb3JyZWN0IEkNCj4gdGhpbmsuIEJ1dCB0aGUgY29tbWVudCAiR2V0IG9wcG9zaXRlIHdh
eSBkaXN0YW5jZSIgYW5kIHRoZSB2YXJpYWJsZSBuYW1lDQo+ICJvcHBvc2l0ZSIgYXJlIHdyb25n
Lg0KPiANCg0KTXkgYWJvdmUgbWlzdGFrZSBtYWtlIHRoaXMgbWlzLXVuZGVyc3RhbmRpbmc6DQpJ
IHdhbnQgdG8gY2hlY2sgdGhlIG9wcG9zaXRlIHdheSBkaXN0YW5jZSBpcyBzZXQgb3Igbm90Lg0K
SWYgb3Bwb3NpdGUgd2F5IGRpc3RhbmNlIGlzIG5vdCBzZXQsIEkgd2lsbCBzZXQgYm90aCB3YXkg
aGVyZS4NCg0KU28gSSB3aWxsIGNoYW5nZSAiIG9wcG9zaXRlID0gX19ub2RlX2Rpc3RhbmNlKGZy
b20sIHRvKTsiIHRvDQoiIG9wcG9zaXRlID0gX19ub2RlX2Rpc3RhbmNlKHRvLCBmcm9tKTsiLiBB
bmQga2VlcCB0aGUgY29tbWVudC4NCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgaXQ/DQoNCj4gDQo+
ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgICAgIGVsc2UNCj4gPiArICAgICAgICB7DQo+ID4gKyAg
ICAgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICAgICAqIE9wcG9zaXRlIHdheSBkaXN0YW5jZSBo
YXMgYmVlbiBzZXQgdG8gYSBkaWZmZXJlbnQgdmFsdWUuDQo+ID4gKyAgICAgICAgICAgICAqIEl0
IG1heSBiZSBhIGZpcm13YXJlIGRldmljZSB0cmVlIGJ1Zz8NCj4gPiArICAgICAgICAgICAgICov
DQo+ID4gKyAgICAgICAgICAgIGlmICggb3Bwb3NpdGUgIT0gZGlzdGFuY2UgKQ0KPiA+ICsgICAg
ICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgICAg
ICogSW4gZGV2aWNlIHRyZWUgTlVNQSBkaXN0YW5jZS1tYXRyaXggYmluZGluZzoNCj4gPiArICAg
ICAgICAgICAgICAgICAqDQo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9udW1hLnR4dA0KPiA+ICsgICAgICAgICAgICAgICAgICog
VGhlcmUgaXMgYSBub3RlcyBtZW50aW9uczoNCj4gPiArICAgICAgICAgICAgICAgICAqICJFYWNo
IGVudHJ5IHJlcHJlc2VudHMgZGlzdGFuY2UgZnJvbSBmaXJzdCBub2RlIHRvDQo+ID4gKyAgICAg
ICAgICAgICAgICAgKiAgc2Vjb25kIG5vZGUuIFRoZSBkaXN0YW5jZXMgYXJlIGVxdWFsIGluIGVp
dGhlcg0KPiA+ICsgICAgICAgICAgICAgICAgICogIGRpcmVjdGlvbi4iDQo+ID4gKyAgICAgICAg
ICAgICAgICAgKg0KPiA+ICsgICAgICAgICAgICAgICAgICogVGhhdCBtZWFucyBkZXZpY2UgdHJl
ZSBkb2Vzbid0IHBlcm1pdCB0aGlzIGNhc2UuDQo+ID4gKyAgICAgICAgICAgICAgICAgKiBCdXQg
aW4gQUNQSSBzcGVjLCBpdCBjYXJlcyB0byBzcGVjaWZpY2FsbHkgcGVybWl0DQo+IHRoaXMNCj4g
PiArICAgICAgICAgICAgICAgICAqIGNhc2U6DQo+ID4gKyAgICAgICAgICAgICAgICAgKiAiRXhj
ZXB0IGZvciB0aGUgcmVsYXRpdmUgZGlzdGFuY2UgZnJvbSBhIFN5c3RlbQ0KPiBMb2NhbGl0eQ0K
PiA+ICsgICAgICAgICAgICAgICAgICogIHRvIGl0c2VsZiwgZWFjaCByZWxhdGl2ZSBkaXN0YW5j
ZSBpcyBzdG9yZWQgdHdpY2UNCj4gaW4gdGhlDQo+ID4gKyAgICAgICAgICAgICAgICAgKiAgbWF0
cml4LiBUaGlzIHByb3ZpZGVzIHRoZSBjYXBhYmlsaXR5IHRvIGRlc2NyaWJlDQo+IHRoZQ0KPiA+
ICsgICAgICAgICAgICAgICAgICogIHNjZW5hcmlvIHdoZXJlIHRoZSByZWxhdGl2ZSBkaXN0YW5j
ZXMgZm9yIHRoZSB0d28NCj4gPiArICAgICAgICAgICAgICAgICAqICBkaXJlY3Rpb25zIGJldHdl
ZW4gU3lzdGVtIExvY2FsaXRpZXMgaXMgZGlmZmVyZW50LiINCj4gPiArICAgICAgICAgICAgICAg
ICAqDQo+ID4gKyAgICAgICAgICAgICAgICAgKiBUaGF0IG1lYW5zIGEgcmVhbCBtYWNoaW5lIGFs
bG93cyBzdWNoIE5VTUENCj4gY29uZmlndXJhdGlvbi4NCj4gPiArICAgICAgICAgICAgICAgICAq
IFNvLCBwbGFjZSBhIFdBUk5JTkcgaGVyZSB0byBub3RpY2Ugc3lzdGVtDQo+IGFkbWluaXN0cmF0
b3JzLA0KPiA+ICsgICAgICAgICAgICAgICAgICogaXMgaXQgdGhlIHNwZWNhaWwgY2FzZSB0aGF0
IHRoZXkgaGlqYWNrIHRoZSBkZXZpY2UNCj4gdHJlZQ0KPiA+ICsgICAgICAgICAgICAgICAgICog
dG8gc3VwcG9ydCB0aGVpciByYXJlIG1hY2hpbmVzPw0KPiA+ICsgICAgICAgICAgICAgICAgICov
DQo+ID4gKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAiVW4tbWF0Y2hlZCBiaS1kaXJlY3Rpb24hIE5PREUjJXUtPk5PREUj
JXU6JXUsDQo+IE5PREUjJXUtPk5PREUjJXU6JXVcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZnJvbSwgdG8sIGRpc3RhbmNlLCB0bywgZnJvbSwgb3Bwb3NpdGUpOw0KPiANCj4gUFJJ
dTMyDQoNClllcy4NCg0KPiANCj4gDQo+ID4gKyAgICAgICAgICAgIH0NCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgIC8qIE9wcG9zaXRlIHdheSBkaXN0YW5jZSBoYXMgYmVlbiBzZXQsIGp1c3Qgc2V0
IHRoaXMgd2F5ICovDQo+ID4gKyAgICAgICAgICAgIG51bWFfc2V0X2Rpc3RhbmNlKGZyb20sIHRv
LCBkaXN0YW5jZSk7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAg
IHJldHVybiAwOw0KPiA+ICt9DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0K

