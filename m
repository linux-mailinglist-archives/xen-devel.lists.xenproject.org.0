Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1266E687C46
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488753.756991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXnX-000678-Eq; Thu, 02 Feb 2023 11:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488753.756991; Thu, 02 Feb 2023 11:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXnX-00065Q-9l; Thu, 02 Feb 2023 11:30:35 +0000
Received: by outflank-mailman (input) for mailman id 488753;
 Thu, 02 Feb 2023 11:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GbMY=56=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pNXnV-00065K-Vx
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:30:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0089cb87-a2ed-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 12:30:32 +0100 (CET)
Received: from DUZPR01CA0087.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::18) by DU0PR08MB7544.eurprd08.prod.outlook.com
 (2603:10a6:10:316::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 11:30:24 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::f7) by DUZPR01CA0087.outlook.office365.com
 (2603:10a6:10:46a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24 via Frontend
 Transport; Thu, 2 Feb 2023 11:30:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.27 via Frontend Transport; Thu, 2 Feb 2023 11:30:23 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Thu, 02 Feb 2023 11:30:22 +0000
Received: from 641cd612e235.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DA986EB-F0FE-4DBF-9054-E6E8D2F16CEA.1; 
 Thu, 02 Feb 2023 11:30:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 641cd612e235.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Feb 2023 11:30:12 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by GV2PR08MB8366.eurprd08.prod.outlook.com (2603:10a6:150:b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 11:30:09 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 11:30:09 +0000
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
X-Inumbo-ID: 0089cb87-a2ed-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81oPDZqnenrFmE/c1UvH/EDyHHSndpEg2rKs9xVhYcs=;
 b=h1tcbVAVEf7bB2X0r8kLm4bgsMmlynyuzl1DdqxSAYz1tPj9y//Pr2L7VqUrQvr/78qQc2HTqE6YZ1b4sYJqa/53ZTkcvG+w1iw6go+Zxuql1ZXrEZgasFNeXDqjREYRe1+2BJ4XMAvXOls6IFsrQO42TuKIAFvlDfBKfEiHXMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRdvzyHZU2uE6hDiLDbm2z4gfqHWB9zm3k5qS6oadCsK9dTGZvQXbGYvZ2RkeEkMCc0aBPNZ45TPZQaVvG7ZIbOvpDufb4AKKJntq4ZHGZ1rAn24ozvHcFsslMO8BOFq7CZmYnqD+WFzXnao64dqzS3pbq1pFjvw5wqn8SpncceyjhyVkSkCWkVFZnEAIN3XRIMoGS2fxkODf9YbwBRNPd+UnnN0Gk7Woy26/H79mtbYPkqZO3bpLMZrjIW3ULkLwXCdBTdBJJscwNoyrFfmKiz4tAItvyRNDFbFDJzygujyjk0+1Ys0XdpZ7w0Wif286aEvQa/PC7qYg00FW6ZyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81oPDZqnenrFmE/c1UvH/EDyHHSndpEg2rKs9xVhYcs=;
 b=gar6Qx4aRkK2gFX+EzNcj0UPNIeGSwyNCL944dPk5vfo2ZuA2nJ8X+9KfmM7ESzkiIhfDgTeuOP6ko46zDowztn/tTRxcAUzCj8p57kWRSJurKLurMOusX0vjsC14DgHlM15DKu4Va8SmNCY+/u0AH8qi5fE8US/BHcSiUaZIO1nJdszqBIEPaTDypNLzHVstEUxfqn3xDOlNNfGR0Wb0kxmtrQfVyCxuf38pK+dDuoJ7FBnrICTYHP2KYSCCB2w9cq95rqtHUR8JiNEyrM2YtO4bGEnOg/1+ue+bUdzR+yFhDPZo7BuDalWwqO7jZE6zArEPgdBv66NE76H/bqyvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81oPDZqnenrFmE/c1UvH/EDyHHSndpEg2rKs9xVhYcs=;
 b=h1tcbVAVEf7bB2X0r8kLm4bgsMmlynyuzl1DdqxSAYz1tPj9y//Pr2L7VqUrQvr/78qQc2HTqE6YZ1b4sYJqa/53ZTkcvG+w1iw6go+Zxuql1ZXrEZgasFNeXDqjREYRe1+2BJ4XMAvXOls6IFsrQO42TuKIAFvlDfBKfEiHXMU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "ayan.kumar.halder@xilinx.com"
	<ayan.kumar.halder@xilinx.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Topic: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Index:
 AQHZJxAhTWb1zeTHm029bSgcZo/2Yq6l4H6AgA7nVJCAAFMfgIAAHOxggAGXmACAARsywIAAc7oAgAFRxNCAAN+ggIABBK2AgAAH44CAAAdVIA==
Date: Thu, 2 Feb 2023 11:30:08 +0000
Message-ID:
 <AM0PR08MB4530C8EFDE49FE9609905524F7D69@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
 <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
 <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <7931e70f-3754-363c-28d8-5fde3198d70f@xen.org>
 <AM0PR08MB45308D5CD69EBB5FE85A4B88F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <3c915633-ddb8-d1e4-f42e-064aaff168b2@xen.org>
 <AM0PR08MB45309F6DCB1B1E0975A741B7F7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <509eafac-bbe7-ed18-ce11-3fede7ca691d@xen.org>
 <AM0PR08MB4530DD5EE9DD4339594F3FE9F7D19@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <1f360356-b143-e732-5a4a-197ed56b2cd1@xen.org>
 <AM0PR08MB4530C5B6E0A8ADCDED65D7C4F7D69@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <83ba0e60-1a3f-f91a-05b3-79ec32ba4caa@xen.org>
In-Reply-To: <83ba0e60-1a3f-f91a-05b3-79ec32ba4caa@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7DDC2E287A20F44F848ABE3981F9F1D8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|GV2PR08MB8366:EE_|DBAEUR03FT009:EE_|DU0PR08MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: c6354f3f-2daa-4d42-0c81-08db0510df8e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A1BqRfC/WpiRc1mfQjnLwBzUYzisMS0b3ETriD942gUw185Iqc9Pwx4b314ueKJmnGf4aT5itLX+28aKMIO4XjjXgRsEoDeFFNRxfWvkOC/c3z0r62Mzc2KwdDnHXHEySKmDSZAk5O139qn2biNq8YdkyU9yLlQWAm5vc4txB2SrMRXnLXS/QjiBIX4PbJpC29UnQRL6tnsMJHWD3LBAdcuhXIGkhEcTVXBOBZ9G9qejUT7IjlYDlGEPNYftvNbT71Q6JuDsafK4RKrj0HIOBOfhohvtf/v+u7Urt+/EU/+5QPK3zIQXyYDpf2gYzHKFbB1yiwnMLGTPPTfjld60MPrDUcLnfzxiksLWLCSvRo2EoD/gPLR4Pib7Vo8mDw9lwLSxouPauJQ+CawekpOLgpcg+MjZHb7gYN2yd/PFkBpqmeGLmLB9VTETXhOEM6wmbJmqKYhlz/06bxPfdZjuHUDQhsGgoNG/S78SQclE7wFe1iDYaPvLXK2o/iwQ2O1/39OBE7UW3j+WVLWIXm4qUrHw1FERfp+mxIIdu1teURmR8cDgqOb9G4M0y+ihzd3G++QmKD3vfwdbhAdCGAc2t5eeL4pij8dv/JTJ+2XZDhpdgLEA1Y1ip0tnsHZIprKW1fDVLFg9CqqMSfXXkYF6pkve/sW1HfbpOWmQs8a6TrS+KzLqCHqaMCNEEiz5v6s48N7tfph30bUhazW02wqa7A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199018)(8676002)(26005)(6506007)(53546011)(66446008)(9686003)(186003)(64756008)(66476007)(66556008)(4326008)(66946007)(76116006)(71200400001)(83380400001)(2906002)(5660300002)(55016003)(316002)(7696005)(38100700002)(110136005)(122000001)(52536014)(8936002)(86362001)(478600001)(41300700001)(38070700005)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8366
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c684e9ec-3ee6-4c67-eeac-08db0510d71f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l0caGJwa+YoKqw0KlWr+IxUdfNeegEsuYUhgsc1kazLqI8VSw1a41e3hUJ7Wta1+y/AQ9SabXstBvmRhqdeSdocH+UOLB4IcXw6wtcySyFT9M2/H/6XmTlgiZJqzjyeAL23DPJjyNCw6DxPLfrIRh99TBpou2dvnZ07T7FCDS5zXHvg8rhjbqlFuRrQG1hYc4qWWW7zog5P88I4bYE3XT5kC/evrfZAkyZ/tAfj3paCr6OPg2/5BXGvCupgbDiJN61CQwtCEIiq3qV0FKzPI67GQTQc/hdmOAPInlTgIULukMu0X58lgFI+Tnf2EogbF8C0kLT21M25yeuxdyxWwl6Qapf33pdjfva3+9GGd2jtgcEYj2d45kIf8WaZhwi7vBV0cyAFlwHHrzUijzW1amtK4FfCd9qo37zJL5Lu6SodmofyOR8FNmFOzin+7CezhOeFYNPiWOPejL8csi3ySKbiSpJ33vmr97Al9DsMtQ412K1litFaNV91yRX7T+pj61HrO4VWDIzXyU71D9GGTCleUBV9zRV2U5Pwll/rxj7aITm7ID5aT7YnUl2t0foj2UAefNM00UdvO3d15AdPjr6fMryUDog32dQ5utSgZIFthQZfalrR6oE6tFqB/gjB0C0CNYJ7h+VX4G/cmxdE+X1OISuB4Lo5lKmOEvmFKaR1yGcURPHA0ssVUMTzm++JyebOK0i3iZgXEn4SntgkKvg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(46966006)(36840700001)(40470700004)(70586007)(33656002)(70206006)(40460700003)(4326008)(83380400001)(81166007)(316002)(36860700001)(110136005)(82740400003)(82310400005)(53546011)(186003)(26005)(47076005)(5660300002)(9686003)(107886003)(478600001)(40480700001)(41300700001)(6506007)(356005)(8676002)(7696005)(336012)(52536014)(8936002)(55016003)(86362001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:30:23.0832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6354f3f-2daa-4d42-0c81-08db0510df8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7544

SGksIEp1bGllbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyLCAy
MDIzIDY6NTggUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRy
YW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IGF5YW4ua3VtYXIuaGFs
ZGVyQHhpbGlueC5jb20NCj4gQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1
a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxMS80MF0geGVuL21wdTogYnVp
bGQgdXAgc3RhcnQtb2YtZGF5IFhlbiBNUFUNCj4gbWVtb3J5IHJlZ2lvbiBtYXANCj4gDQo+IA0K
PiANCj4gT24gMDIvMDIvMjAyMyAxMDo1MywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgSnVs
aWVuLA0KPiANCj4gSGksDQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50OiBUaHVyc2Rh
eSwgRmVicnVhcnkgMiwgMjAyMyAyOjU3IEFNDQo+ID4+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnku
WmhlbmdAYXJtLmNvbT47DQo+ID4+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgV2Vp
IENoZW4gPFdlaS5DaGVuQGFybS5jb20+Ow0KPiBTdGVmYW5vDQo+ID4+IFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+ID4+IDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+OyBheWFuLmt1bWFyLmhhbGRlckB4aWxpbnguY29tDQo+ID4+IENjOiBW
b2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+ID4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMTEvNDBdIHhlbi9tcHU6IGJ1aWxkIHVwIHN0YXJ0LW9mLWRheSBY
ZW4gTVBVDQo+ID4+IG1lbW9yeSByZWdpb24gbWFwDQo+ID4+DQo+ID4+IEhpIFBlbm55LA0KPiA+
Pg0KPiA+PiBPbiAwMS8wMi8yMDIzIDA1OjM5LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+Pj4g
SWYgd2UgYXJlIGFkZGluZyBNUFUgcmVnaW9ucyBpbiBzZXF1ZW5jZSBhcyB5b3Ugc3VnZ2VzdGVk
LCB3aGlsZQ0KPiA+Pj4+PiB1c2luZyBiaXRtYXAgYXQgdGhlIHNhbWUgdGltZSB0byByZWNvcmQg
dXNlZCBlbnRyeS4NCj4gPj4+Pj4gVEJILCB0aGlzIGlzIGhvdyBJIGRlc2lnbmVkIGF0IHRoZSB2
ZXJ5IGJlZ2lubmluZyBpbnRlcm5hbGx5LiBXZQ0KPiA+Pj4+PiBmb3VuZCB0aGF0IGlmIHdlIGRv
bid0IGRvIHJlb3JnIGxhdGUtYm9vdCB0byBrZWVwIGZpeGVkIGluIGZyb250DQo+ID4+Pj4+IGFu
ZCBzd2l0Y2hpbmcgb25lcyBhZnRlciwgZWFjaCB0aW1lIHdoZW4gd2UgZG8gdmNwdSBjb250ZXh0
DQo+ID4+Pj4+IHN3aXRjaCwgbm90IG9ubHkgd2UgbmVlZCB0byBodW50IGRvd24gc3dpdGNoaW5n
IG9uZXMgdG8gZGlzYWJsZSwNCj4gPj4+Pj4gd2hpbGUgd2UgYWRkIG5ldyBzd2l0Y2gtaW4gcmVn
aW9ucywgdXNpbmcgYml0bWFwIHRvIGZpbmQgZnJlZQ0KPiA+Pj4+PiBlbnRyeSBpcyBzYXlpbmcg
dGhhdCB0aGUNCj4gPj4+PiBwcm9jZXNzIGlzIHVucHJlZGljdGFibGUuIFVuY2VydGFpbnR5IGlz
IHdoYXQgd2Ugd2FudCB0byBhdm9pZCBpbg0KPiA+Pj4+IEFybXY4LVIgYXJjaGl0ZWN0dXJlLg0K
PiA+Pj4+DQo+ID4+Pj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBpdCB3b3VsZCBiZSB1bnByZWRp
Y3RhYmxlLiBGb3IgYSBnaXZlbg0KPiA+Pj4+IGNvbWJpbmF0aW9uIG9mIHBsYXRmb3JtL2Rldmlj
ZS10cmVlLCB0aGUgYml0bWFwIHdpbGwgYWx3YXlzIGxvb2sNCj4gPj4+PiB0aGUgc2FtZS4gU28g
dGhlIG51bWJlciBvZiBjeWNsZXMvaW5zdHJ1Y3Rpb25zIHdpbGwgYWx3YXlzIGJlIHRoZQ0KPiBz
YW1lLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gSW4gYm9vdC10aW1lLCBpdCB3aWxsIGJlIGFsd2F5
cyB0aGUgc2FtZS4gQnV0IGlmIHdlIHN0aWxsIHVzZSBiaXRtYXANCj4gPj4+IHRvIGZpbmQgZnJl
ZSBlbnRyeShmb3Igc3dpdGNoaW5nIE1QVSByZWdpb25zKSBvbiBydW50aW1lLCBobW1tLCBJDQo+
ID4+PiB0aG91Z2h0IHRoaXMgcGFydCB3aWxsIGJlIHVucHJlZGljdGFibGUuDQo+ID4+DQo+ID4+
IEkga25vdyB0aGlzIHBvaW50IGlzIG5vdyBtb290IGFzIHdlIGFncmVlZCBvbiBub3QgdXNpbmcg
YSBiaXRtYXAgYnV0DQo+ID4+IEkgd2FudGVkIHRvIGFuc3dlciBvbiB0aGUgdW5wcmVkaWN0YWJp
bGl0eSBwYXJ0Lg0KPiA+Pg0KPiA+PiBJdCBkZXBlbmRzIG9uIHdoZXRoZXIgeW91IGRlY2lkZSB0
byBhbGxvY2F0ZSBtb3JlIGVudHJ5IGF0IHJ1bnRpbWUuDQo+ID4+IE15IGFzc3VtcHRpb24gaXMg
eW91IHdvbid0IGFuZCB0aGVyZWZvcmUgdGhlIHRoZSB0aW1lIHRvIHdhbGsgdGhlDQo+ID4+IGJp
dG1hcCB3aWxsIGFsd2F5cyBiZSBjb25zaXN0ZW50Lg0KPiA+Pg0KPiA+DQo+ID4gSW4gTVBVLCB3
ZSBkb24ndCBoYXZlIHNvbWV0aGluZyBsaWtlIHZ0dGJyX2VsMiBpbiBNTVUsIHRvIHN0b3JlIHN0
YWdlDQo+ID4gMg0KPiA+IEVMMS9FTDAgdHJhbnNsYXRpb24gdGFibGUuIFhlbiBzdGFnZSAxIEVM
MiBtYXBwaW5nIGFuZCBzdGFnZSAyIEVMMS9FTDANCj4gPiBtYXBwaW5nIGFyZSBib3RoIHNoYXJp
bmcgb25lIHRhYmxlLg0KPiA+IFNvIHdoZW4gY29udGV4dCBzd2l0Y2hpbmcgaW50byBkaWZmZXJl
bnQgZ3Vlc3QsIHRoZSBjdXJyZW50IGRlc2lnbiBpcw0KPiA+IHRvIGRpc2FibGUgRE9NMSdzIGd1
ZXN0IFJBTSBtYXBwaW5nIGZpcnN0bHksIHRoZW4gZW5hYmxlIERPTTIncyBndWVzdA0KPiA+IFJB
TSBtYXBwaW5nLCB0byBlbnN1cmUgaXNvbGF0aW9uIGFuZCBzYWZldHkuDQo+IA0KPiBJIHVuZGVy
c3Rvb2QgdGhhdCBidXQgSSBkb24ndCB1bmRlcnN0YW5kIGhvdyB0aGlzIGlzIHJlbGF0ZWQgdG8g
bXkgcG9pbnQNCj4gaGVyZS4gVGhlIGVudHJpZXMgeW91IGFyZSByZXBsYWNpbmcgYXJlIGFsd2F5
cyBnb2luZyB0byBiZSB0aGUgc2FtZSBhZnRlcg0KPiBib290Lg0KPiANCj4gU28gaWYgeW91IGhh
dmUgYSBiaXRtYXAgaW5kaWNhdGUgdGhlIGZpeGVkIGVudHJpZXMgYW5kIHlvdSBkb24ndCBhZGQg
bW9yZQ0KPiBmaXhlZCBvbmUgYXQgcnVudGltZSwgdGhlbiBpdCB3aWxsIGFsd2F5cyB0YWtlIHRo
ZSBzYW1lIHRpbWUgdG8gd2FsayBpdC4NCj4gDQoNCkFoLCBzb3JyeSBmb3IgdGFraW5nIHNvIGxv
bmcgdG8gdW5kZXJzdGFuZCA7Ly4gVHJ1ZSwgdGhlIGZpeGVkIGVudHJpZXMgd2lsbCBuZXZlcg0K
Y2hhbmdlIGFmdGVyIGJvb3QtdGltZSwgZWFjaCB0aW1lIHdoZW4gc3dpdGNoaW5nIHRvIGd1ZXN0
IHZjcHUsIHdlIGFsd2F5cyBjaG9vc2UNCnRoZSBzYW1lIGVudHJ5Lg0KDQo+IENoZWVycywNCj4g
DQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KDQpDaGVlcnMsDQoNCi0tDQpQZW5ueSBaaGVuZw0K

