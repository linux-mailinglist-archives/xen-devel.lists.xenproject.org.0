Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81C177232D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578322.905763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyqK-00059K-K5; Mon, 07 Aug 2023 11:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578322.905763; Mon, 07 Aug 2023 11:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyqK-00056S-H8; Mon, 07 Aug 2023 11:56:12 +0000
Received: by outflank-mailman (input) for mailman id 578322;
 Mon, 07 Aug 2023 11:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJNd=DY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qSyqJ-00056M-CI
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:56:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6294ba9c-3519-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 13:56:04 +0200 (CEST)
Received: from AM6P192CA0029.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::42)
 by AS8PR08MB10142.eurprd08.prod.outlook.com (2603:10a6:20b:633::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 11:56:01 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::46) by AM6P192CA0029.outlook.office365.com
 (2603:10a6:209:83::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26 via Frontend
 Transport; Mon, 7 Aug 2023 11:56:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.15 via Frontend Transport; Mon, 7 Aug 2023 11:56:01 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Mon, 07 Aug 2023 11:56:00 +0000
Received: from 13288bc356b7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FCBEE955-F3E4-4ED2-B2B3-575A6929C577.1; 
 Mon, 07 Aug 2023 11:54:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13288bc356b7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Aug 2023 11:54:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 11:54:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 11:54:24 +0000
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
X-Inumbo-ID: 6294ba9c-3519-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1X5C/qh14GlZuXhXyVYEqvM8mfJnjsB9yJtw/H8xng=;
 b=pwiOdH6BmhZ+RPkjWZNx8POlyP7qjEIqjvFi9z2VHR9i8dWXwyUh0xn3r+kajQrspvj+ATc51Hi2XYHOnrfesUsZNAKskjLaIcknYhilOHlYMx9HcC4nNOSdNXxII1cfHLbCJW9Au61awwBntVD8JU5wYEuiEsvXByiq2MyntPU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78c20b38bbf0466a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYNwLyVmuzpHjnzudCEU3mBNaY/F5sCvCJQ9MD2Vbz33rUtuVvnwRLw0BiGJeksONhyLakpPV64ZaldB6NMqAds946vya3JIrY0IQ67HDZhcp460pRhOcIC/qchgKky55YKi6sBZ+RSqVImsTMavsxkhjihXS70vPalBwDHewYYoeBhtPeZCeJPz2EPQ45ZTDKPH3eGAbBCpT2OnXDr+JuB2FcdiRr3tnWcTHg9z2217IKO5Nu/USWS98LgHp/50Kn5U3EQ0x2ZbKdZ807hITE1U9seu9HO3nzKd9o2MlJUc+4sqcmPqpi9uRyB+qRglNNHKObcJvmqsrgi0erSl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1X5C/qh14GlZuXhXyVYEqvM8mfJnjsB9yJtw/H8xng=;
 b=oa8Pm44Qcc3AwoTUa2DK7b7B8knHkeFdgNbWyd5mg/zZNRFJeQ0hpWrClsyQpcEFzVOmqB7c7L/ZgEcoM5mHCm7EyrqQlX50lfWianVu0rDW/ZaqHcDngRFYqsDhCyqO+4wFmhcyxsFt17/0iMXNDePn4ggwfEXW3BGgEhWj31nkGBXkoJ/rFTb8iI+vq/yIn0xB8VQsgjVGf6Wvs0aKndJtSj8Mhos22MZmzpzeA4QYvFdo9nXwqklikJTXedMkwnU/xjTVYqiEg73jDYE3ZxmgKUw8ODt6hOXrbpnkZ++xi+ocj11xCt3zE6j3rSG3kPQ06BOiW6CevOlMJqnrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1X5C/qh14GlZuXhXyVYEqvM8mfJnjsB9yJtw/H8xng=;
 b=pwiOdH6BmhZ+RPkjWZNx8POlyP7qjEIqjvFi9z2VHR9i8dWXwyUh0xn3r+kajQrspvj+ATc51Hi2XYHOnrfesUsZNAKskjLaIcknYhilOHlYMx9HcC4nNOSdNXxII1cfHLbCJW9Au61awwBntVD8JU5wYEuiEsvXByiq2MyntPU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
Thread-Topic: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
Thread-Index: AQHZxCqBtZIUxf7FmUaIEyO8EPs3TK/euu6AgAABikCAAAQOAIAAAf9g
Date: Mon, 7 Aug 2023 11:54:24 +0000
Message-ID:
 <AS8PR08MB79914FA9CCA0EEF9FFD50F77920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-2-Henry.Wang@arm.com>
 <79de42d1-35db-79b1-da2a-f08a72fa53d7@amd.com>
 <AS8PR08MB7991B7C1B78531B9322934E2920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <88fff832-af85-497e-9608-612c8a351d9b@xen.org>
In-Reply-To: <88fff832-af85-497e-9608-612c8a351d9b@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C2DD655B15D18844B94CD4DA615C0D6C.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8385:EE_|AM7EUR03FT040:EE_|AS8PR08MB10142:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d73824-d949-4c3c-b72a-08db973d4525
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cRyQkPjVK3LVECw/25omadT9jFb0+VyzMTZvt3xEjjxXS1igt+DU1Mfp4nViBTuJbphXPpILlTw3qntAQyXDmM7ve1xl23L82VsR0e2xgMsYNgQoLXMUyBgq9f/bZRqln+EogBvamHZqEfyeaYZa7j5cpmTdqP5lUMSMrUAOk8R6JQRsvkjajOmtpqtPBz669QqwTchCvMDN2b3aEiwK1rzUS0FFlyQMe9hWBxsSazcsHYMEO8VzmfBPoQbExpaRwE67PaXffx4ES0xS12yatyl8PdGkK0d6uSvp6o57rA6JhmwXMvlOYslAdHY5dQB6KeTzYAvQqp+8NosZ73UBjjaVQKZrHCNGaA96cyeiVIdCJP02Y8Y8CKM0bAhn1D+9YK/tp7zEaZfGgXindIFjQggwxJS43/Jtl3tdwlezO0LIQKCD0h7s5PuOKLL0rV6KQTWLDN9XNHNa1nzBsaexruvbCjlaIBQTdXPM9xWh5gX4MGjBB3Kj4Chv6hWphpM5k+TiCyNfQkHRYrYtLtqHWKN2Cmz8dzWP7XHuyYnuVe3Zy7Vtc3/hO5MC/Q/79BjNQqBjBaGOb32RagV8fpGpWX1b9oLd+FigJ5rQ5hZbRRZd/RwZ2ZlDG9SkrH4y4ASCwZVoBgp+jS5kJmcH06iVwg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(186006)(1800799003)(55016003)(966005)(9686003)(4326008)(316002)(86362001)(478600001)(122000001)(54906003)(110136005)(38100700002)(76116006)(71200400001)(66946007)(66446008)(64756008)(66556008)(66476007)(33656002)(7696005)(6506007)(41300700001)(26005)(52536014)(38070700005)(8676002)(8936002)(2906002)(83380400001)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8385
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ba047f0-8927-48e9-52e0-08db973d0b64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JzPVbPtqPpn+UIMuo8DCEVom9PZYcwN5TUu3Ir7uj3CtZKGFAJvEz2OQnMNTVKS1MXgQ6a6tjg5RtZ62VxbG/0uLC7cCFYfNAgyo5WqUgkGJE+b5TvNF3pON20UbIp6+9Uv9BlVOSV8Pjjq3XBcqCbWhUW+Fq8AYsoZevmXVYAuSUdEoPMG/nr+E/+uLdmH7uo/Lig/w2hg0A4IciHz242JIMn0WmY9CLB+X6FEDFYykdLf1MJHhNUBLgqppRBwSdjTWN0U8ymTLvR0yzbRm9loiyJnoClPbQczUn7l3EDzhjedKEC/giSn0EZh2EzZh+Kx7Th5PAVOfQjNmqMQWhr7PwCHUJrVRE/oigxt7YzyzStJDigeFzQZBBMIQH0Zz/a0C75jIPm0Up8wgbfAfeJSyr7Xn6O/qlK5XZY+cTCdz3b7Pd2HlN9UJ/ZU1ZvnslaShGfmRaYxITETgUkJKISVucxpwJpJjgXg29vcA1ZF5yQ5USHgbYwB+hg+X2f5pqhSRdRhW7Utg7zvdfDKl++kFcv1t4YOrZypsVWr06yiK8uHaBlLq+jH+xJRS7fKpimG58HScRCoaqm08AkH2TFe8xqLA9FpVBREYBaLyFrwy02Uzj5pzcv9BiQd4O1MX8YEWaC6hFfAF113llbX7/ljHikZXY1Nwvir2+pSM96n+CSh4u40JCiSJz1BEqXhUwi8KxuFebraZQj5KCFTlF9H3WtHenz9Ls0hJav2pYZ1phi9AqOwtUp/aUoue2DyAPTgsmVfv+2MK3n7HOhjEYQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(82310400008)(451199021)(186006)(1800799003)(46966006)(40470700004)(36840700001)(86362001)(40480700001)(41300700001)(336012)(52536014)(478600001)(40460700003)(6506007)(8676002)(8936002)(26005)(7696005)(5660300002)(47076005)(83380400001)(2906002)(110136005)(54906003)(36860700001)(55016003)(316002)(356005)(966005)(70206006)(70586007)(81166007)(4326008)(82740400003)(9686003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 11:56:01.1330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d73824-d949-4c3c-b72a-08db973d4525
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10142

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjQgMDEvMTNdIHhlbi9hcm02NDogaGVhZC5TOiBJbnRyb2R1Y2UNCj4gZW5hYmxl
X3tib290LHNlY29uZGFyeX1fY3B1X21tDQo+ID4+IHByZWZlciAiZW5hYmxlX2Jvb3RfY3B1X21t
dSIgYXMgaXQgaXMgTU1VIHNwZWNpZmljIGFzIHdlbGwuDQo+ID4NCj4gPiAuLi50aGlzLCBhcmUg
dGhlIG5hbWUgc3VnZ2VzdGVkIGJ5IEp1bGllbiBpbiBbMV0sIHNvIHByb2JhYmx5IEkgd2lsbCBz
dGljaw0KPiA+IHRvIHRoZXNlIG5hbWVzLCB1bmxlc3MgaGUgd291bGQgcHJlZmVyIHRoZSBwcm9w
b3NlZCBuYW1lcy4gSSB3b3VsZA0KPiA+IHBlcnNvbmFsbHkgcHJlZmVyIHRoZSBuYW1lcyB0aGF0
IEp1bGllbiBzdWdnZXN0ZWQgdG9vLCBiZWNhdXNlIGZyb20NCj4gPiB0aGUgY29tbWVudHMgYWJv
dmUgdGhlc2UgdHdvIGZ1bmN0aW9ucywgdGhlc2UgZnVuY3Rpb25zIG5vdCBvbmx5DQo+ID4gZW5h
YmxlIHRoZSBNTVUsIGJ1dCBhbHNvIHR1cm4gb24gdGhlIGQtY2FjaGUsIGhlbmNlIGEgbW9yZSBn
ZW5lcmljDQo+ID4gbmFtZSAodXNpbmcgIm1tIiksIGlzIG1vcmUgYXBwcm9wcmlhdGUgaGVyZSBJ
IGd1ZXNzLg0KPiANCj4gSSBoYXZlIHN1Z2dlc3RlZCB0aG9zZSBuYW1lIGJlY2F1c2UgdGhlIHR3
byBmdW5jdGlvbnMgYXJlIG1lYW50IHRvDQo+IGFic3RyYWN0IHRoZSBpbXBsZW1lbnRhdGlvbiBi
ZXR3ZWVuIE1QVSBhbmQgTU1VIChzZWUgWzJdIGZvciB0aGUgTVBVKS4NCj4gDQo+IElmIHdlIHBy
ZWZpeCB0aGVtIHdpdGggKl9tbXUgbm93LCB0aGV5IHdpbGwgaGF2ZSB0byBiZSByZW5hbWVkIGxh
dGVyIG9uDQo+IGFuZCB3aWxsIGp1c3QgaW50cm9kdWNlIHVubmVjZXNzYXJ5IGNodXJuLg0KDQpF
eGFjdGx5LCBJIGZ1bGx5IGFncmVlIHdpdGggeW91LiBJZiB3ZSBjYW4gZG8gYWxsIHRoZSByZW5h
bWluZyBpbiBvbmUgc2hvdCB0byBmaXQNCmJvdGggTU1VIGFuZCBNUFUsIHdlIHNob3VsZCBkZWZp
bml0ZWx5IGdvIGZvciBpdC4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gPg0KPiA+
IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvYzEwYmMyNTQtYWQ3OS1kYWRh
LWQ1ZmItDQo+IDllZTYxOTkzNGZmYkB4ZW4ub3JnLw0KPiANCj4gWzJdDQo+IGh0dHBzOi8vZ2l0
bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvaGVucnl3L3hlbi8tDQo+IC9ibG9iL21wdV92NC94
ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hlYWQuUz9yZWZfdHlwZT1oZWFkcyNMMjA1DQo+IA0KPiAt
LQ0KPiBKdWxpZW4gR3JhbGwNCg0K

