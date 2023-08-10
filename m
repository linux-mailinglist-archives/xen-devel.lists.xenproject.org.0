Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF2777319
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581916.911382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1Bo-00040Z-Nu; Thu, 10 Aug 2023 08:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581916.911382; Thu, 10 Aug 2023 08:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1Bo-0003xX-K0; Thu, 10 Aug 2023 08:38:40 +0000
Received: by outflank-mailman (input) for mailman id 581916;
 Thu, 10 Aug 2023 08:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5UL=D3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qU1Bm-0003xR-TM
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:38:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cc70348-3759-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 10:38:37 +0200 (CEST)
Received: from DU2PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:10:234::6)
 by AS2PR08MB10128.eurprd08.prod.outlook.com (2603:10a6:20b:644::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:38:35 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::7e) by DU2PR04CA0031.outlook.office365.com
 (2603:10a6:10:234::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Thu, 10 Aug 2023 08:38:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 08:38:34 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Thu, 10 Aug 2023 08:38:34 +0000
Received: from de9826d7aad7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD9885AC-D492-488F-9F0A-AEF804E63272.1; 
 Thu, 10 Aug 2023 08:38:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de9826d7aad7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 08:38:06 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAVPR08MB9062.eurprd08.prod.outlook.com (2603:10a6:102:32d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 10 Aug
 2023 08:38:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 08:38:04 +0000
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
X-Inumbo-ID: 4cc70348-3759-11ee-b283-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO2tgQkAdBjGa/uthO+eyDrq7JXwsMYpicKrL8pKHco=;
 b=t99fSbHyJpNGBnnntSLfNlUswvGU6pu5F9vGq4lf8ULVrNx7u8o6OvnKSFECA+ismoj/kSnL0vlczJJ3A2gJWkk+hwJZbm+Y8XeZHzilGNn2Rq+iYN07vluox5eX6Ty6OohL9SWc2s8GlNMrEFyk+5l+OjH23aahDIQlciNCYuE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f20c3922870d8ac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsYySa/g7NuGGbb77CoT8DD6CF4ZNSNBf1SKGOnTKfmOol8FSuU8ZAYg58AGclpv+kbN1l8bkb/wrBPT74s6EynaYlrhJn6ToxYfOulex9cknroj4+rI4qavrsS5IBbHRFHJBBx/VrJDyfOIusuWaUz8UADYS4Sf66/QhSUhHpOaQ2Qsv5mFVc/oHj7I70Mbjd6/hgY8hN5WW71BL8VjfB0LIrmvHFGpKnE+2Yo0oE4JDUDa6ZiNeYsJcUtXFJrlK9E3pLbbMcJf392K6J55zNTrXWa0AcXZLaM68TMJsU/7/tVuhHJeJCKuAy3QDPGHRmcNFBeu3HVqbY5USwj9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO2tgQkAdBjGa/uthO+eyDrq7JXwsMYpicKrL8pKHco=;
 b=efdxFPQ281aX4z+XXvsXlSp1Of6Tq/vLIJNCqQb17jhgTUDzmfJ5c/DFT4wC7JAYoQQlZrzJVgJRkh3tW+6I7n9ZYpgJUUt7CmZbWKH5Sz0DOhNhfbW6NDusTcgt6MyllanEqg6F0wgGRZJpmRVigSQcQXY3hXEZaLIi59ThGSbYJc2XlYvd/OqEH97oGTyUEHKYtc9GW02rjf5eA6k8Mmhdv5eNzx46DzqMlSg8EVmxnOAg35dNE1ubXD6q9eAZxQlzZEvFNzYQY7+40m2IB6vBs+BlEJaSYn4rNJrIeyqJf7DGlKQ5QsnHmCpOngVzxhpjztEO2aRNvV518lxwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO2tgQkAdBjGa/uthO+eyDrq7JXwsMYpicKrL8pKHco=;
 b=t99fSbHyJpNGBnnntSLfNlUswvGU6pu5F9vGq4lf8ULVrNx7u8o6OvnKSFECA+ismoj/kSnL0vlczJJ3A2gJWkk+hwJZbm+Y8XeZHzilGNn2Rq+iYN07vluox5eX6Ty6OohL9SWc2s8GlNMrEFyk+5l+OjH23aahDIQlciNCYuE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 5/5] xen: Add clang-format configuration
Thread-Topic: [RFC PATCH 5/5] xen: Add clang-format configuration
Thread-Index: AQHZwStJjnl5s/6RqkyuxqTMVBpDCK/iL4wAgAAIMgCAAQm9gIAACB2A
Date: Thu, 10 Aug 2023 08:38:04 +0000
Message-ID: <7219AAB4-7218-405F-8B4E-D9F3E54213EA@arm.com>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-6-luca.fancellu@arm.com>
 <3c5ae070-d6c2-070c-e482-e5135e2acef1@suse.com>
 <394778DB-2D5E-4C52-9DA1-F23A530534A8@arm.com>
 <9743391f-3b89-ddba-1c79-ddbb1d143437@suse.com>
In-Reply-To: <9743391f-3b89-ddba-1c79-ddbb1d143437@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAVPR08MB9062:EE_|DBAEUR03FT046:EE_|AS2PR08MB10128:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bd083e-224b-40ae-b919-08db997d2f7f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8NYmK8eCNpqaaFY4os2IN4VCLdwaiw8vDPqN57fGcMbrTCmWH16Vm7JcLiJpEVPBUldYE++6qkL7u8d7ZCfYlhGzYoTFQ2Yo+013uveWg8/JTVzRS+c+bpqKzlciWaHaltaicfdAgtdaH/ml8CaTb2fb+M8xyUkvDdbWaVGIoP4r+sC+ZD7YQejWdTbmgXXfPXRoc1zOhJNbMzBuOQI0g7MSfLdc3PypE8/uquXDM4bYlzrCWtNL1W0nka2tdONRPk4zx9P3kkSxw0g3nReU5lSJWD7FPG8i6tG/asCe/6z1LVxjBpThOu7NH3lGuk3J5EvuG+KxNXQE1HZA3S/aG0qYLBqNqOsECXan9LQvcGzTmq326ZbdAsdqPg1htSGFWTZY5gMdq35QR+DEcE1zTAWzgBIqE3QjRoO4uIv8JzpElg8IgRBlg3aRWJ8INV8F3idrQOotkiPhYJDF4w3pG8biYYsQf/vWjR+HlwIpvRDU6rCD54wE8krBH05NOlEUN0dc/1nkrg1yPk72adruj67e16jcMtCqe3QCB2yv8RJmm8PoJC7zVjNm0xHbzSk82S+3rcu7R/9yLG7cdtHGliBkcD/Qv+d0NT94KYf3G24wvyRPlgHJ7XTOirFf9oGD+Fu2qwzc72kXNAOi1Aa1/DwdXCqrrl1U2tg5S3z4aApjN36ukB0ZS1OOwyROdhFJs4Bg9stotQAkpBq9gwtFVg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(186006)(1800799006)(2616005)(6916009)(36756003)(6512007)(966005)(4326008)(316002)(122000001)(86362001)(54906003)(66556008)(478600001)(38100700002)(66946007)(76116006)(91956017)(66446008)(6486002)(71200400001)(33656002)(53546011)(66476007)(64756008)(6506007)(26005)(8676002)(38070700005)(8936002)(41300700001)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7BAB73839D2F44FA3D47B2722A5D149@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9062
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e4445f3f-6e5b-4877-002c-08db997d1d18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wsj+svH5HxqpBTvmOPHO9LJQP4aLJMwfqVjT3BDDOJsXUwKmGOZIs+Eop0P3yhquzN2fc08uNZPeOFYNwLtiy5CD0SVmBvq5e/OKGTPFDtXVldQRFcu8pRQaWAUy/knWKWI49k9ZHEjj6ivG5+6o/EBF5pZrRsBIoZ5Wzac1MsopcmFp03x4FlQiu+iXz7hoTi+PjEXk+TPQ2N1Pee3GYFfNvUjyIqbnZBKN/XCPYnAPKuS37lEZ7gKaXRrUTsmRWScT8NrIQpfNia5XPjsthc6Z4CZD9sSTKgDqL+N7fKCQkU8+vDlMSJ1WHxFBd4NOs2TjKe2P+53FQfLjUXs5m1I82CGTf/b6TeQKrIPpZ6TopZb23OuFTbPQ2gD6bofC8uUrTK/Cr1jKJqRQRuyxj55XiEWd2m9At3UexC869qx3idDyworkXMXEyxvFi6NIjZokml5fBuSm7nH7lhgbjbbc93vU1q0t8sdkFICoC1p7fpXxqdTF+W3IitWoWnf1mjwio93/PLHXRtKBYvEL0/O8R5Aw21b4hP2noFBalR3KaQNuakBz4FPFsil5Mu6nNVLO9yVR551zLXNyHfzno/U3RAtopQmUhCsmjNTtfjVEC3/IzALsq2wsAnjNzS2PzY6E6vW3ul2pDV1QiKLRiYYiuw9XRSzvyxSlbSEnvYm9H2Xw94YIvUIiCSyLDjDGKcOEk+d+tZjeSZIa/jD8QrFeRxco2rtMEVbD33bU6Lkt3zoV9+tAUFaS8ECk/pyU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(1800799006)(186006)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(70206006)(70586007)(336012)(54906003)(6506007)(53546011)(26005)(478600001)(36756003)(33656002)(47076005)(2616005)(36860700001)(316002)(41300700001)(6512007)(4326008)(6486002)(966005)(2906002)(8936002)(8676002)(86362001)(81166007)(82740400003)(356005)(5660300002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:38:34.9762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bd083e-224b-40ae-b919-08db997d2f7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10128

DQoNCj4gT24gMTAgQXVnIDIwMjMsIGF0IDA5OjA4LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDkuMDguMjAyMyAxODoxOCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiA5IEF1ZyAyMDIzLCBhdCAxNjo0OCwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+PiBPbiAyOC4wNy4yMDIzIDEwOjExLCBMdWNhIEZhbmNlbGx1
IHdyb3RlOg0KPj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+ICsrKyBiL3hlbi8uY2xhbmctZm9ybWF0
DQo+Pj4+IEBAIC0wLDAgKzEsNjkzIEBADQo+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9ubHkNCj4+Pj4gKyMNCj4+Pj4gKyMgY2xhbmctZm9ybWF0IGNvbmZpZ3VyYXRp
b24gZmlsZS4gSW50ZW5kZWQgZm9yIGNsYW5nLWZvcm1hdCA+PSAxNS4NCj4+Pj4gKyMNCj4+Pj4g
KyMgRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZToNCj4+Pj4gKyMNCj4+Pj4gKyMgICBEb2N1bWVu
dGF0aW9uL3Byb2Nlc3MvY2xhbmctZm9ybWF0LnJzdA0KPj4+PiArIyAgIGh0dHBzOi8vY2xhbmcu
bGx2bS5vcmcvZG9jcy9DbGFuZ0Zvcm1hdC5odG1sDQo+Pj4+ICsjICAgaHR0cHM6Ly9jbGFuZy5s
bHZtLm9yZy9kb2NzL0NsYW5nRm9ybWF0U3R5bGVPcHRpb25zLmh0bWwNCj4+Pj4gKyMNCj4+Pj4g
Ky0tLQ0KPj4+PiArDQo+Pj4+ICsjIFtub3Qgc3BlY2lmaWVkXQ0KPj4+PiArIyBBbGlnbiBmdW5j
dGlvbiBwYXJhbWV0ZXIgdGhhdCBnb2VzIGludG8gYSBuZXcgbGluZSwgdW5kZXIgdGhlIG9wZW4g
YnJhY2tldA0KPj4+PiArIyAoc3VwcG9ydGVkIGluIGNsYW5nLWZvcm1hdCAzLjgpDQo+Pj4+ICtB
bGlnbkFmdGVyT3BlbkJyYWNrZXQ6IEFsaWduDQo+Pj4gDQo+Pj4gSSdtIG5vdCBjb252aW5jZWQg
dGhpcyBydWxlIChhc3N1bWluZyBJJ20gZ2V0dGluZyBpdCByaWdodCkgaXMNCj4+PiBzdWl0YWJs
ZSBpbiBhbGwgY2FzZXMsIGVzcGVjaWFsbHkgZm9yIGZ1bmN0aW9ucyB3aXRoIGxvbmcgbmFtZXMg
b3INCj4+PiB2ZXJ5IG1hbnkgcGFyYW1ldGVycy4NCj4+IA0KPj4gTm90IHN1cmUgSSB1bmRlcnN0
YW5kLCBJIHRoaW5rIHRoaXMgaXMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIGluIHRoZSBjb2RlYmFz
ZSBub3cuDQo+IA0KPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGFib3ZlIGFpbXMgYXQg
KG9ubHkpDQo+IA0KPiB1bnNpZ25lZCBsb25nIGZ1bmN0aW9uKHVuc2lnbmVkIGxvbmcgZmlyc3Rf
bG9uZ19hcmd1bWVudCwNCj4gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2Vj
b25kX2xvbmdfYXJndW1lbnQpOw0KPiANCj4gd2hlbiB3ZSBhbHNvIHBlcm1pdA0KPiANCj4gdW5z
aWduZWQgbG9uZyBmdW5jdGlvbigNCj4gICAgdW5zaWduZWQgbG9uZyBmaXJzdF9sb25nX2FyZ3Vt
ZW50LA0KPiAgICB1bnNpZ25lZCBsb25nIHNlY29uZF9sb25nX2FyZ3VtZW50KTsNCg0KT2hoIG9r
IG5vdyBJIHNlZSB3aGF0IHlvdSBtZWFudCENCg0KSSBkaWQgdHJ5IHRoaXMsIG9rIHN1cmUgaXQg
d2lsbCBmb3JtYXQgaXQgYXM6DQoNCnVuc2lnbmVkIGxvbmcgZnVuY3Rpb24odW5zaWduZWQgbG9u
ZyBmaXJzdF9sb25nX2FyZ3VtZW50LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgc2Vjb25kX2xvbmdfYXJndW1lbnQpOw0KDQpCZWNhdXNlIGl0IHNl
ZXMgdGhhdCBpdCB3aWxsIGZpdCB0aGUgODAgY2hhcnMuDQoNCkF0IHNvbWUgcG9pbnQgSSB0aGlu
ayB3ZSBuZWVkIHRvIG92ZXJjb21lIHRoZSB1bmNlcnRhaW50eSBhbmQgY2hvc2UgYSBzaWRlLCBv
bmx5DQpmcm9tIHRoZXJlIHdlIGNhbiBiZW5lZml0IGZyb20gYW4gYXV0b21hdGljIGNoZWNrZXIg
YW5kIHdlIGNhbiBnZXQgcmlkIG9mIHN0eWxlIGlzc3VlcyAobW9zdCBvZiB0aGVtKS4NCg0KVW5m
b3J0dW5hdGVseSBtb3N0IG9mIHRoZSB0aW1lIHdlIGNhbuKAmXQgc2F5IHRvIHRoZSB0b29sOiB3
ZSBwZXJtaXQgdGhpcyBzdHlsZSBidXQgYWxzbyB0aGlzIHN0eWxlLCANCm9ubHkgb25lIGNhbiBi
ZSBhbGxvd2VkIGFuZCBqdXN0IGZldyBkaXNjcmVwYW5jeSBtaWdodCBiZSBkZXZpYXRlZCBpZiBw
cm9wZXJseSBqdXN0aWZpZWQgKGluLWNvZGUgY29tbWVudHMpLg0KDQpJIGd1ZXNzIHRoaXMgaXMg
dGhlIG9ubHkgd2F5IHRvOg0KMSkgaGF2ZSBhIGZvcm1hbGlzZWQgY29kaW5nIHN0eWxlDQoyKSBo
YXZlIGFuIGF1dG9tYXRpYyBjaGVja2VyDQozKSB1bmlmeSB0aGUgaHlwZXJ2aXNvciBjb2RlYmFz
ZSBzdHlsZSwgdGhhdCB3aWxsIGRpdmVyZ2UgKG1vcmUgdGhhbiBub3cpIHZlcnkgcXVpY2tseSB3
aXRoIHRoZSBpbnRyb2R1Y3Rpb24NCiAgICBvZiBuZXcgYXJjaCBhbmQgZmVhdHVyZXMNCg0KQ2hl
ZXJzLA0KTHVjYQ==

