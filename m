Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE603888D6
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 09:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129933.243665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljH5x-0008Jh-Sh; Wed, 19 May 2021 07:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129933.243665; Wed, 19 May 2021 07:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljH5x-0008HE-Pg; Wed, 19 May 2021 07:58:21 +0000
Received: by outflank-mailman (input) for mailman id 129933;
 Wed, 19 May 2021 07:58:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljH5w-0008H8-Mw
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 07:58:20 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.68]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4459739e-9d99-4310-99b3-cf9d058bf421;
 Wed, 19 May 2021 07:58:19 +0000 (UTC)
Received: from AM6P191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::19)
 by AM9PR08MB6004.eurprd08.prod.outlook.com (2603:10a6:20b:285::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 07:58:18 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::1a) by AM6P191CA0042.outlook.office365.com
 (2603:10a6:209:7f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 19 May 2021 07:58:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:58:17 +0000
Received: ("Tessian outbound 3c5232d12880:v92");
 Wed, 19 May 2021 07:58:17 +0000
Received: from a15a64af0ede.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95C9BC84-2C03-48EC-92AF-14DC46B9433C.1; 
 Wed, 19 May 2021 07:58:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a15a64af0ede.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 07:58:11 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4366.eurprd08.prod.outlook.com (2603:10a6:803:fc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 07:58:08 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:58:08 +0000
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
X-Inumbo-ID: 4459739e-9d99-4310-99b3-cf9d058bf421
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnlDh86C58JYNQlFKUuNIswqitz6f1t8JwsKTbmEjoo=;
 b=9i7aOssTubm07d1z+o5DMY2q2Cl2jD1Ts76bZ7fBOMPLjSVvY6SXPqzgbMvDJdDmJb/hc0Ll6kyYfTmGrAJw3Zs/hQbTrALnj/AGhj2NAk6U8nymgZbeyKsE4raqqAhggltQ3SytTru+0a60JDA5mgaM5eZ/doB1YkmaVxTl++U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eqm2VeoSASeFTA+bilaifRcRtpOns5oqVdaq2Esp1qwfucI6TEqCpknV8u88qmWc7KWFfRVT1qDA+xACodeZMDsdKv8l+uvsxZj3MDqr0Npg92qX6tuIIZvIgZuKd8uds/I6nmqyx5zb2XrLIZE8c1SAVp24/M4hj0DLN8VQ7r25/9GLIJLPpMKg8xT0c3UgBNHIGRA04PJlMFgCWZS2teC7kNabV/lM+3SV+UkYaLs+VZXobLQ3opzC/UweWk1GHTnZC4cv/gaCNn6MCce6zhRBjRPBhBq99Ggo4oMmRcZ1iXQ5YkstYiKPgWTQCu6RcDSj5yc2gOsO96dPzWm0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnlDh86C58JYNQlFKUuNIswqitz6f1t8JwsKTbmEjoo=;
 b=aRxj5GyFLrc6pCw8g1dMZybUPIww5gPDSyi/7EGQOE4KIFL9p1JZEmzoEq6rn21jQ6/tm3v9c9ly6YpdLSy2DyBdZ3xPgJTnVIjqcLAtlL3+Nx+MyDxsrO6f2/1urHqEENOa3wn9MSOtJI9NquLr7ge1vmKnu2QuQApbR0b4DZOVQ4rzaEtcP0PTf0Kjn2c8wZ0+1YO33conOFBINPexkyjTRGSo+ejkH1DODIcNCQoHA+hIyb+MYOI2orMfz6UXZHexOt/dufQrYdHyU8bIxSEqpwuqlBnw0Wo/3DK8VZwR5waXD1t9xhCCBerNFw1VTOVpkKl3xlrh1QCS5R3G/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnlDh86C58JYNQlFKUuNIswqitz6f1t8JwsKTbmEjoo=;
 b=9i7aOssTubm07d1z+o5DMY2q2Cl2jD1Ts76bZ7fBOMPLjSVvY6SXPqzgbMvDJdDmJb/hc0Ll6kyYfTmGrAJw3Zs/hQbTrALnj/AGhj2NAk6U8nymgZbeyKsE4raqqAhggltQ3SytTru+0a60JDA5mgaM5eZ/doB1YkmaVxTl++U=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 09/10] xen/arm: parse `xen,static-mem` info during domain
 construction
Thread-Topic: [PATCH 09/10] xen/arm: parse `xen,static-mem` info during domain
 construction
Thread-Index: AQHXS6XDy5MrKETGVUijoDUAUijwiqrpJf6AgAFKs2A=
Date: Wed, 19 May 2021 07:58:08 +0000
Message-ID:
 <VE1PR08MB5215E7B93DC2E7FCBE7B0898F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-10-penny.zheng@arm.com>
 <61b41d12-c69e-fe41-0b5e-d35a485b4a51@xen.org>
In-Reply-To: <61b41d12-c69e-fe41-0b5e-d35a485b4a51@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A63B90C98C539447A65B65F2450941CC.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c80b356a-2a14-4daa-4c8d-08d91a9bdcf7
x-ms-traffictypediagnostic: VI1PR08MB4366:|AM9PR08MB6004:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB600404DFD7DA0B99E38E5644F72B9@AM9PR08MB6004.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fZNlJT7lLIwq19pPge/8fw4cq6Yqb3VK48g5a7Jxok2YB6EhQEnhGIYpOX6spq6P1pzskrm22NVsZO50NggZ8DCaoXoCAXaAuSZC4NwpCB7enQrmty7Qi1zk1i+xUBCyweaSVR2PZSMv2aE16umoP5xAlspjPWMDystPzmHblxU0PJtC3vHeNFe0JXLXBbqDLIQwjGO5Jr7mVXyyDXxuHZo1XUcVKyxp3/+L180umYSE9LExQMe+JEQXXC71K90hZ3dIgYldpJLPTVYtdsoxbDXE7WTxXT/uPsscPKH78bQOWAXZcEkJsjyOevx3mDYFlbvhFgz/gjMDHDds8gqcBudxDmxozHbEs7evj9jwt7BjdhOb2fGUkukShzQlc5JJ3S5HV/G3aWMTx7JlGsT4ej0GFp6GRTtbujMxplLge3jIHxWcFyObJtWpfXF1UCANmgtNZ2DEc3Lr2WPepcUz74xynLyuooT+5CqvFv5ir8MxgWzfda3t5J9ITL5+YFzdgrWuqX6DWyWUwGdQvco2NjO089T8flJPHAH9+xlX1bBwrZtxSZR/Fne5Urtk64SICesfLLfsEPvpInwK4ulAj1WUZY2NtXOvgFPBwBnqXxrBjt0qBx753taL+7xBVbScnXHLTA+FmATC2u+/kfsb/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(38100700002)(64756008)(66476007)(8676002)(66946007)(66446008)(66556008)(76116006)(52536014)(8936002)(122000001)(5660300002)(86362001)(33656002)(83380400001)(316002)(7696005)(4326008)(478600001)(110136005)(26005)(54906003)(55016002)(186003)(9686003)(2906002)(53546011)(71200400001)(6506007)(81973001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?cTY0aFJyYjBlVmNqZnBlWGxaNnc5ZGFua0dIcHcrc1g0NDdFeVIzUnRvd1c3?=
 =?utf-8?B?SktyNEcvbjhkZndCN3htYTVYNy9BckVNRE5tRzM2TWtkQjdRUHFLbFhYZmt2?=
 =?utf-8?B?S2o2TDkrQkc0NEFFMHVBRWpWL1lSc2c1eS9FNVVtWVljVzlGazNOS01yUXlT?=
 =?utf-8?B?cEN6alFnRXV0bDNBa2FCYmRoOWZmcHIrN3IwbCtFOHF3Zi9HbTZ2bUtPL1dL?=
 =?utf-8?B?UVBkVUcwMFdwbEhvWHVvRi9rVFlNKzZ0VHN2UmE1R1J1OVZySFZiaExRc0E3?=
 =?utf-8?B?aGxoenZsUmdQL1J5M2hSdFJsMWZQQ01uNEg4UE4zbkdmY1FPS1BTdTJZVThz?=
 =?utf-8?B?b1pvcXdocGdQTDFHZmJodERPSXJPVVA5MzFNTE5QVEJ0Qk9QQXBYc3Bxak0w?=
 =?utf-8?B?VmZ5UW8yT2tFRzFQdmN4dDdCYWdyWlJwR0tVK083MlRsNC9IU1k2RmxOYllw?=
 =?utf-8?B?SE5RRnJ0YTNJaXlDMDk5TTRyQXVTN1pvWnhWNTk3ZXV4NGtJZ0laeFhsWWVW?=
 =?utf-8?B?NnlyeFN6ZjB5YnI0cHBMVEZiQVVtenB2SER1RFZQZnFYSEptVnRoL3lZYjZX?=
 =?utf-8?B?R0NNRDd3TklIQ1NrYnFUZDBvTTViQURqaVM1UFdINWdmYkppSktJd09Na1lF?=
 =?utf-8?B?OWFncVdQUno0dW5na3BGeEZJaHpuY3dDMXRhLzRNZVNFdHM3UXVLQWEzQUo1?=
 =?utf-8?B?aHpCZUFVT2dQcm1FclRSMFBQSWl6Tjh2TWVuY1lUdmFxcG5iSzlzOXQvVnRP?=
 =?utf-8?B?QnJvdGs3clhyQm9naStkTEJyMUZYT2dmdmhENk96cHR5bngvNzlzUCtQbG9o?=
 =?utf-8?B?Y0xkRnpNeHZDcVdGRWk3eXlGZ1NBYTEzMVJBK2ZONWtvdVFMQWNCY2syd1dp?=
 =?utf-8?B?SjVIdkVGU1VaTjkxR3d3L3pGeUZWTG5UdmY0bklSZXBGZEtUKy81TmZvZWZI?=
 =?utf-8?B?MFJBeDZGRXpqQTVVOVdIYitraThrQkNZdnpDR2dLdlViMGtEMVZNTWRRb3BJ?=
 =?utf-8?B?VXl1TFdNVnFTaWpWWWRyQU9Fa3pPWnZjNG5Xam54SnYza1dpayt1Q3VNTlls?=
 =?utf-8?B?ZUNEbjJpR05tUjBmU1l0dzdhK29FTmNFNHlZanNIVUE2bWlqMk50VEp4Vmd5?=
 =?utf-8?B?Q1dDQVFqWXBMTk5CR0VGMUh5VHNNVm8yUUZ5dXQ5azdMd2x5Wmk2RmFJN2RF?=
 =?utf-8?B?WG5WeXpVNUdwSE1DclB1L0lwUkt0SkJKbDNqT05rUnQ4d0JHWXVFY1E4QThl?=
 =?utf-8?B?M2FXQiswQWxTY0VUYXU2SVAwSnlkOWRhSGZjMFJEMUh0bk81dTdHOXRHU1Rv?=
 =?utf-8?B?cjlkcVBqUmRVSEJKT0RZVVlSU1pPcTVwV2lSeDdZM1J5cEUvaTFXWTFvQ2Vp?=
 =?utf-8?B?M0twQklOUnNMNlZ3R2U0dnlpVWY3ZUF5M0k0OG5oRzNlaU14UDdXYnFRbVJ6?=
 =?utf-8?B?ak9nbjFqRUJtSmkzeEFFVUFvbUMzRHk3YVduV3lXZGdEWjlZMXlBcTcycDFv?=
 =?utf-8?B?ekIzcUdIeW9jQUVzMmJnQmZ4ZlBxdFJMaXcwZlJITmVKY1N0R0l3cFlHd2JZ?=
 =?utf-8?B?N3F1bDhYRlVQSEZQWWxqWnJpMmRUWmtyTkZob3pVcTVaVE9yOFFnTEhOTEpP?=
 =?utf-8?B?UEZzSGpVb1Y1NnQvOEpGRDFKR1V5dUY5M0tjWlhGdGlKZ3N6Tm1hR1FYaCtT?=
 =?utf-8?B?cXBZOWNFQllOWWJXaHRHSE1nZVlvaUpPenZjR3hVSlN4d0xKOWFoTjdxME1Y?=
 =?utf-8?Q?HzOMKu2jIfsKI+HhNxXvnJB47MM2/sM5ASEFMCw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4366
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91fd67f7-825f-4d6d-fc49-08d91a9bd742
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FrWeK+nzrrHxg8aJ34QtbLkkPG4/yXhGlZ5I5EYTrIerPd85fy7yKOZCLpVE/DLd254UBx/v+8eNsRuRhy37arIgmCWB/KZY/9Esof5NIKkSKnc+kXVLx/TWvH3JM45vtdh4kB64XfT6N6DDJzufWo96t/WQJ7u5haOLYoAXsSbg05qDr2jqKN1I6U4pDUde1PbmgZLq54kMOM8Z093KbbPwImpe0P+885uJKKXXUyDckWwd1MciNrHA64ehu/ubgDYLTpTJDQ3doQqNebU4G+m1km2vf27I+q4DEuDPqsC16tFsiZ+vlHEJHS1AwJwM5dwEA5nDi//TCUWO5sI+dzu/LQ/tYYRin4riCqhB0f6MQASuJxrXX7xhdnQMurc1Y812kWF2ddsAi1AuvTac4mPv6Kj/37c9quWLGzSCC0tY8CwqYz+g8dW09AzffSTKU6nyFzhKF/OGO595+XD2PE+2MgTANH9GOpeIEeKKf6+7CuLq5vf0raTj/H61tZtg8vQ09A1hlg4GOShclygTddv2E/2y+sV/zCQrb0wgU42pRcy2VlphDBv1pY0ZPsndXsPW5Y3cx+8QTzCH4zGrM+VP3WHAtY46fAOQex3nohPxpM3NqSwrPb03VgqvMCilwa56kQh+pakkJGqAeKeGY2yjYtL2bg4/RcN8aGcGFyfAoMdkTvKfyJA7B4lwSZT1
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966006)(36840700001)(70206006)(83380400001)(2906002)(36860700001)(54906003)(70586007)(4326008)(186003)(110136005)(82310400003)(5660300002)(316002)(47076005)(9686003)(8676002)(55016002)(8936002)(53546011)(356005)(52536014)(33656002)(6506007)(7696005)(82740400003)(336012)(26005)(86362001)(478600001)(81166007)(81973001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:58:17.7405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c80b356a-2a14-4daa-4c8d-08d91a9bdcf7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6004

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDg6
MDkgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDA5LzEwXSB4ZW4vYXJtOiBwYXJzZSBgeGVuLHN0YXRpYy1tZW1gIGluZm8gZHVyaW5nDQo+IGRv
bWFpbiBjb25zdHJ1Y3Rpb24NCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24gMTgvMDUvMjAyMSAw
NjoyMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gVGhpcyBjb21taXQgcGFyc2VzIGB4ZW4sc3Rh
dGljLW1lbWAgZGV2aWNlIHRyZWUgcHJvcGVydHksIHRvIGFjcXVpcmUNCj4gPiBzdGF0aWMgbWVt
b3J5IGluZm8gcmVzZXJ2ZWQgZm9yIHRoaXMgZG9tYWluLCB3aGVuIGNvbnN0cnVjdGluZyBkb21h
aW4NCj4gPiBkdXJpbmcgYm9vdC11cC4NCj4gPg0KPiA+IFJlbGF0ZWQgaW5mbyBzaGFsbCBiZSBz
dG9yZWQgaW4gbmV3IHN0YXRpY19tZW0gdmFsdWUgdW5kZXIgcGVyIGRvbWFpbg0KPiA+IHN0cnVj
dCBhcmNoX2RvbWFpbi4NCj4gDQo+IFNvIGZhciwgdGhpcyBzZWVtcyB0byBvbmx5IGJlIHVzZWQg
ZHVyaW5nIGJvb3QuIFNvIGNhbid0IHRoaXMgYmUga2VwdCBpbiB0aGUNCj4ga2luZm8gc3RydWN0
dXJlPw0KPiANCg0KU3VyZSwgSSdsbCBzdG9yZSBpdCBpbiBraW5mbw0KDQo+ID4NCj4gPiBSaWdo
dCBub3csIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5IGlzIG1p
c3NpbmcsDQo+ID4gYW5kIHdpbGwgYmUgaW50cm9kdWNlZCBsYXRlci4gSXQganVzdCBCVUcoKSBv
dXQgYXQgdGhlIG1vbWVudC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxw
ZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jICB8IDU4DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiA+
ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCB8ICAzICsrDQo+ID4gICAyIGZpbGVzIGNo
YW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jDQo+ID4gaW5kZXggMjgyNDE2ZTc0ZC4uMzBiNTU1ODhiNyAxMDA2NDQNCj4gPiAtLS0g
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMNCj4gPiBAQCAtMjQyNCwxNyArMjQyNCw2MSBAQCBzdGF0aWMgaW50IF9faW5p
dCBjb25zdHJ1Y3RfZG9tVShzdHJ1Y3QgZG9tYWluDQo+ICpkLA0KPiA+ICAgew0KPiA+ICAgICAg
IHN0cnVjdCBrZXJuZWxfaW5mbyBraW5mbyA9IHt9Ow0KPiA+ICAgICAgIGludCByYzsNCj4gPiAt
ICAgIHU2NCBtZW07DQo+ID4gKyAgICB1NjQgbWVtLCBzdGF0aWNfbWVtX3NpemUgPSAwOw0KPiA+
ICsgICAgY29uc3Qgc3RydWN0IGR0X3Byb3BlcnR5ICpwcm9wOw0KPiA+ICsgICAgdTMyIHN0YXRp
Y19tZW1fbGVuOw0KPiA+ICsgICAgYm9vbCBzdGF0aWNfbWVtID0gZmFsc2U7DQo+ID4gKw0KPiA+
ICsgICAgLyoNCj4gPiArICAgICAqIEd1ZXN0IFJBTSBjb3VsZCBiZSBvZiBzdGF0aWMgbWVtb3J5
IGZyb20gc3RhdGljIGFsbG9jYXRpb24sDQo+ID4gKyAgICAgKiB3aGljaCB3aWxsIGJlIHNwZWNp
ZmllZCB0aHJvdWdoICJ4ZW4sc3RhdGljLW1lbSIgcHJvcGVydHkuDQo+ID4gKyAgICAgKi8NCj4g
PiArICAgIHByb3AgPSBkdF9maW5kX3Byb3BlcnR5KG5vZGUsICJ4ZW4sc3RhdGljLW1lbSIsICZz
dGF0aWNfbWVtX2xlbik7DQo+ID4gKyAgICBpZiAoIHByb3AgKQ0KPiA+ICsgICAgew0KPiA+ICsg
ICAgICAgIGNvbnN0IF9fYmUzMiAqY2VsbDsNCj4gPiArICAgICAgICB1MzIgYWRkcl9jZWxscyA9
IDIsIHNpemVfY2VsbHMgPSAyLCByZWdfY2VsbHM7DQo+ID4gKyAgICAgICAgdTY0IHN0YXJ0LCBz
aXplOw0KPiA+ICsgICAgICAgIGludCBpLCBiYW5rczsNCj4gPiArICAgICAgICBzdGF0aWNfbWVt
ID0gdHJ1ZTsNCj4gPiArDQo+ID4gKyAgICAgICAgZHRfcHJvcGVydHlfcmVhZF91MzIobm9kZSwg
IiNhZGRyZXNzLWNlbGxzIiwgJmFkZHJfY2VsbHMpOw0KPiA+ICsgICAgICAgIGR0X3Byb3BlcnR5
X3JlYWRfdTMyKG5vZGUsICIjc2l6ZS1jZWxscyIsICZzaXplX2NlbGxzKTsNCj4gPiArICAgICAg
ICBCVUdfT04oc2l6ZV9jZWxscyA+IDIgfHwgYWRkcl9jZWxscyA+IDIpOw0KPiA+ICsgICAgICAg
IHJlZ19jZWxscyA9IGFkZHJfY2VsbHMgKyBzaXplX2NlbGxzOw0KPiA+ICsNCj4gPiArICAgICAg
ICBjZWxsID0gKGNvbnN0IF9fYmUzMiAqKXByb3AtPnZhbHVlOw0KPiA+ICsgICAgICAgIGJhbmtz
ID0gc3RhdGljX21lbV9sZW4gLyAocmVnX2NlbGxzICogc2l6ZW9mICh1MzIpKTsNCj4gPiArICAg
ICAgICBCVUdfT04oYmFua3MgPiBOUl9NRU1fQkFOS1MpOw0KPiA+ICsNCj4gPiArICAgICAgICBm
b3IgKCBpID0gMDsgaSA8IGJhbmtzOyBpKysgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAg
ICAgICAgZGV2aWNlX3RyZWVfZ2V0X3JlZygmY2VsbCwgYWRkcl9jZWxscywgc2l6ZV9jZWxscywg
JnN0YXJ0LCAmc2l6ZSk7DQo+ID4gKyAgICAgICAgICAgIGQtPmFyY2guc3RhdGljX21lbS5iYW5r
W2ldLnN0YXJ0ID0gc3RhcnQ7DQo+ID4gKyAgICAgICAgICAgIGQtPmFyY2guc3RhdGljX21lbS5i
YW5rW2ldLnNpemUgPSBzaXplOw0KPiA+ICsgICAgICAgICAgICBzdGF0aWNfbWVtX3NpemUgKz0g
c2l6ZTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICJTdGF0aWMgTWVtb3J5IEJhbmtbJWRdIGZvciBEb21haW4gJXBk
OiINCj4gPiArICAgICAgICAgICAgICAgICAgICAiMHglIlBSSXg2NCItMHglIlBSSXg2NCJcbiIs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaSwgZCwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICBkLT5hcmNoLnN0YXRpY19tZW0uYmFua1tpXS5zdGFydCwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICBkLT5hcmNoLnN0YXRpY19tZW0uYmFua1tpXS5zdGFydCArDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgZC0+YXJjaC5zdGF0aWNfbWVtLmJhbmtbaV0uc2l6ZSk7DQo+ID4gKyAgICAgICAg
fQ0KPiA+ICsgICAgICAgIGQtPmFyY2guc3RhdGljX21lbS5ucl9iYW5rcyA9IGJhbmtzOw0KPiA+
ICsgICAgfQ0KPiANCj4gQ291bGQgd2UgYWxsb2NhdGUgdGhlIG1lbW9yeSBhcyB3ZSBwYXJzZT8N
Cj4gDQoNCk9rLiBJJ2xsIHRyeS4NCg0KPiA+DQo+ID4gICAgICAgcmMgPSBkdF9wcm9wZXJ0eV9y
ZWFkX3U2NChub2RlLCAibWVtb3J5IiwgJm1lbSk7DQo+ID4gLSAgICBpZiAoICFyYyApDQo+ID4g
KyAgICBpZiAoICFzdGF0aWNfbWVtICYmICFyYyApDQo+ID4gICAgICAgew0KPiA+ICAgICAgICAg
ICBwcmludGsoIkVycm9yIGJ1aWxkaW5nIERvbVU6IGNhbm5vdCByZWFkIFwibWVtb3J5XCIgcHJv
cGVydHlcbiIpOw0KPiA+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgICAgICB9DQo+
ID4gLSAgICBraW5mby51bmFzc2lnbmVkX21lbSA9IChwYWRkcl90KW1lbSAqIFNaXzFLOw0KPiA+
ICsgICAga2luZm8udW5hc3NpZ25lZF9tZW0gPSBzdGF0aWNfbWVtID8gc3RhdGljX21lbV9zaXpl
IDoNCj4gPiArIChwYWRkcl90KW1lbSAqIFNaXzFLOw0KPiA+DQo+ID4gLSAgICBwcmludGsoIioq
KiBMT0FESU5HIERPTVUgY3B1cz0ldSBtZW1vcnk9JSJQUkl4NjQiS0IgKioqXG4iLCBkLQ0KPiA+
bWF4X3ZjcHVzLCBtZW0pOw0KPiA+ICsgICAgcHJpbnRrKCIqKiogTE9BRElORyBET01VIGNwdXM9
JXUgbWVtb3J5PSUiUFJJeDY0IktCICoqKlxuIiwNCj4gPiArICAgICAgICAgICAgZC0+bWF4X3Zj
cHVzLCAoa2luZm8udW5hc3NpZ25lZF9tZW0pID4+IDEwKTsNCj4gPg0KPiA+ICAgICAgIGtpbmZv
LnZwbDAxMSA9IGR0X3Byb3BlcnR5X3JlYWRfYm9vbChub2RlLCAidnBsMDExIik7DQo+ID4NCj4g
PiBAQCAtMjQ1Miw3ICsyNDk2LDExIEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb21V
KHN0cnVjdCBkb21haW4NCj4gKmQsDQo+ID4gICAgICAgLyogdHlwZSBtdXN0IGJlIHNldCBiZWZv
cmUgYWxsb2NhdGUgbWVtb3J5ICovDQo+ID4gICAgICAgZC0+YXJjaC50eXBlID0ga2luZm8udHlw
ZTsNCj4gPiAgICNlbmRpZg0KPiA+IC0gICAgYWxsb2NhdGVfbWVtb3J5KGQsICZraW5mbyk7DQo+
ID4gKyAgICBpZiAoIHN0YXRpY19tZW0gKQ0KPiA+ICsgICAgICAgIC8qIGFsbG9jYXRlX3N0YXRp
Y19tZW1vcnkoZCwgJmtpbmZvKTsgKi8NCj4gPiArICAgICAgICBCVUcoKTsNCj4gPiArICAgIGVs
c2UNCj4gPiArICAgICAgICBhbGxvY2F0ZV9tZW1vcnkoZCwgJmtpbmZvKTsNCj4gPg0KPiA+ICAg
ICAgIHJjID0gcHJlcGFyZV9kdGJfZG9tVShkLCAma2luZm8pOw0KPiA+ICAgICAgIGlmICggcmMg
PCAwICkNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaA0KPiA+
IGIveGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCBpbmRleCBjOTI3N2I1YzZkLi44MWI4ZWI0
NTNjIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmgNCj4gPiAr
KysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oDQo+ID4gQEAgLTEwLDYgKzEwLDcgQEAN
Cj4gPiAgICNpbmNsdWRlIDxhc20vZ2ljLmg+DQo+ID4gICAjaW5jbHVkZSA8YXNtL3ZnaWMuaD4N
Cj4gPiAgICNpbmNsdWRlIDxhc20vdnBsMDExLmg+DQo+ID4gKyNpbmNsdWRlIDxhc20vc2V0dXAu
aD4NCj4gPiAgICNpbmNsdWRlIDxwdWJsaWMvaHZtL3BhcmFtcy5oPg0KPiA+DQo+ID4gICBzdHJ1
Y3QgaHZtX2RvbWFpbg0KPiA+IEBAIC04OSw2ICs5MCw4IEBAIHN0cnVjdCBhcmNoX2RvbWFpbg0K
PiA+ICAgI2lmZGVmIENPTkZJR19URUUNCj4gPiAgICAgICB2b2lkICp0ZWU7DQo+ID4gICAjZW5k
aWYNCj4gPiArDQo+ID4gKyAgICBzdHJ1Y3QgbWVtaW5mbyBzdGF0aWNfbWVtOw0KPiA+ICAgfSAg
X19jYWNoZWxpbmVfYWxpZ25lZDsNCj4gPg0KPiA+ICAgc3RydWN0IGFyY2hfdmNwdQ0KPiA+DQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg0KQ2hlZXJzDQoNClBlbm55
DQoNCg==

