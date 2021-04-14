Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0B35F157
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 12:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110444.210815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcXc-0007KO-Kr; Wed, 14 Apr 2021 10:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110444.210815; Wed, 14 Apr 2021 10:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcXc-0007Jx-GX; Wed, 14 Apr 2021 10:14:36 +0000
Received: by outflank-mailman (input) for mailman id 110444;
 Wed, 14 Apr 2021 10:14:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1ra=JL=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lWcXb-0007Jl-Kl
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 10:14:35 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2a4d908-2bbb-4fc0-8920-40cfa16dd672;
 Wed, 14 Apr 2021 10:14:34 +0000 (UTC)
Received: from AM6PR10CA0101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::42)
 by HE1PR0802MB2602.eurprd08.prod.outlook.com (2603:10a6:3:e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Wed, 14 Apr
 2021 10:14:32 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::12) by AM6PR10CA0101.outlook.office365.com
 (2603:10a6:209:8c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 14 Apr 2021 10:14:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 10:14:32 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Wed, 14 Apr 2021 10:14:31 +0000
Received: from e36d91158788.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18E584F6-D9D2-4EA0-9FAF-A0DA6F7E4EEC.1; 
 Wed, 14 Apr 2021 10:14:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e36d91158788.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Apr 2021 10:14:21 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5423.eurprd08.prod.outlook.com (2603:10a6:803:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 10:14:19 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 10:14:19 +0000
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
X-Inumbo-ID: b2a4d908-2bbb-4fc0-8920-40cfa16dd672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56FXBxm/dLPCVztZyFYrmU7arC920SGoPVXAt2sJ9ds=;
 b=IrBYNyMfptueVbAMsyq12hIPxAsLvHOzNr3vMY9jM5Mue51WPFRqy+zCWkmndwtqhG9wC76fhGPk14eKvY7cvdS/XQOof84YHFmSt54HLRGJxmUmir/Br1kBL9crXw5mAsfhLx6l4vs9ccMIowTkBli2tHur5mrRAaStFN4Xi2E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5d2d8b8117520ca6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R98hwyTm4bxJn+pst4nX0T0N/x0m4XJ8MkLpLd1JKO7u8WqzoFpocvECZYrE0/nWGgkh4g7lBuRs0fiigARDDZyeQEQK4c2OM8x0MBmJPq/Z6XrE3yrNMuMaKGYb3f0wupM007UrHI9L/yQwoB8qhZ/3B9FKe9CE2mK4AQN1wNDq8KIR+OJSFzcTr/hIe6vLl22DQKJ59EgUXbvsN0GhIWqgyBZDh0pGTs8lDY+yrSz5222SZ2NPEUXhDTqDEovUCo0lEc6Qo7llswK0Hn5kzs9y95djYsj6eaxplmZlZaKfnEs04yV/2KuFnemKYL2zIr7Ja3bshy2sOvmiOjufaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56FXBxm/dLPCVztZyFYrmU7arC920SGoPVXAt2sJ9ds=;
 b=cGizGDOHf4Gn7vuJ5XXyoXcAO0q7YaIWjfEWANymIqPYZ5753yRIfFrEOHKZSAcYAw/tI/28nnqXPs8g/hgt7kFFVq4SjyZKpWvG/9sPZJzON1oC2640FkKAiT4RAdBw8+IeK6LmdB1PpO6nbrx9MENOmzN6G6SZWG5w6+YgeKAqZVHBwe5njIfZxPXMD8oXnpYGplDxdj1PflKn9cxj54C603h2a94D0De+SwFTZqD+a9kkhHV/uhIpec9809RLd7FouM1Zi9JzMSh3mwSj0cZvhSF4aaA+J8Q88zlvVgQpfrHvTgVvkD0HJymewqNHNkVUTwZJ/9qRqtkfREZ+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56FXBxm/dLPCVztZyFYrmU7arC920SGoPVXAt2sJ9ds=;
 b=IrBYNyMfptueVbAMsyq12hIPxAsLvHOzNr3vMY9jM5Mue51WPFRqy+zCWkmndwtqhG9wC76fhGPk14eKvY7cvdS/XQOof84YHFmSt54HLRGJxmUmir/Br1kBL9crXw5mAsfhLx6l4vs9ccMIowTkBli2tHur5mrRAaStFN4Xi2E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rahul
 Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v4 2/4] xen/arm: Handle cases when hardware_domain is NULL
Thread-Topic: [PATCH v4 2/4] xen/arm: Handle cases when hardware_domain is
 NULL
Thread-Index: AQHXMQ6Q3JcgcbdjF0OhB9yjIgtWraqzy74A
Date: Wed, 14 Apr 2021 10:14:19 +0000
Message-ID: <6FC0F527-B337-40ED-88E3-6E3AFB9BD3E3@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-3-luca.fancellu@arm.com>
In-Reply-To: <20210414091404.14215-3-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8faaa463-8fda-4df7-edc7-08d8ff2e18ca
x-ms-traffictypediagnostic: VI1PR08MB5423:|HE1PR0802MB2602:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB26024C9353078E2BDD922EA09D4E9@HE1PR0802MB2602.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2449;OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dPhhd5aCzBaN92i3M/QTD9O8KNOVo5XwXF3wHphwJGVP4aDQohmVdFQ5xo7Kt6665bxLys3PAQaJYspYEpLGt/3LYnebJl/wA7Y4z59JUd7xfkL/LfcoM0rXbiAxd7JTlIFODWlQyXZPhjF1iSe3+8UD4POLDEeUVkPG6ysBu0RnTewzc/RYOIhMBZgTQfAUx1yarRHuuVNJ8rDrR8w+BApvI24xVC2n3H66OFabu2fivfqQIHo0XCPfCOAY/vnDVWlcZoy4taf1ZznvSOiMeOq3NLrY5o6rMp8wonAfBLoW4XHuegGytwvvev0t1HI6ykv1jVQM4kBmadDs+jXozinVtR2uMUU3PHCF5GzOrczspluqrE/hX/2b2BfDHqFbPxynjbY1Kil4xOcHCj4dWL3jP6mp8LDI96EPHF0tOG+bI4bDxNfvM7gH+tOKPXYcbHUfl+9nCDb/SZE7MBPJKNUn5KJuxm7925VauRoyQRtZ0XIU6ub8BzDV6OaNf8o2ALEZ3BWvZWGBdjfm+Eqyys8Oz44WcQlDuq/a59uDP/ctENERiif97xHVUFPd5FA+vzIyyW8tmcfX4BnPh0+eKoRr02LF/8I9ZETvun7RNseyxgGF/W3KjOarr5LbwLZpDbdm0peuV5JSBK2Umz1bErJReSk2rPzLqxTcceUuGKc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(33656002)(54906003)(2906002)(6636002)(6506007)(26005)(316002)(83380400001)(66556008)(2616005)(122000001)(5660300002)(4326008)(38100700002)(91956017)(37006003)(36756003)(6862004)(66946007)(71200400001)(66446008)(66476007)(6486002)(6512007)(8936002)(53546011)(64756008)(478600001)(76116006)(86362001)(8676002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?qx61JOXvqvMCOAjmQjhTExctWdMPb+XM1CCBc7ZM3E8mhVM1UiSdwXfVq7Zo?=
 =?us-ascii?Q?TqI1TtBkdlSEj2IzO0wh4Uo2Z/9PBGlh3QT/kZToG6tkTNStChELnU+/apxz?=
 =?us-ascii?Q?58ifFQ8VC+YKI2IyhmnabV3HYTiT3BG9Ej3iT+zj4U7fSWBmyqrKi8i/dcPP?=
 =?us-ascii?Q?qJemWD1382O6RS2a8+0oYrRpOi+xkyCEWMny8UhtUiscs7ISOac6QaSt48Iu?=
 =?us-ascii?Q?mt70rI/3vfjgFZN1I4oK1//gpFyT2nSL40qnWKG74swIbLQ/fVjopn5r3FI/?=
 =?us-ascii?Q?z6GYf7N6ceuidv0A6x8ceTmicmGpflHLWvICKi9yZnOSedMfU/A35EmAMf/y?=
 =?us-ascii?Q?hf6hcUzj4457nSASPcyHBA7etsKWxrsGzFK6rBlQTbbSp/5MhPnFsLdwAd1Z?=
 =?us-ascii?Q?2t5LMexuFwO7eek4ZJfwGNdinT9KhDalCJtUprDCdNwiIiKPf12lMNWTDHbc?=
 =?us-ascii?Q?qJNIk305gqC5EqXfVy6c9IrQO9zk1hSdUxbPAEsmrFoVekystsV3uW7SLVEu?=
 =?us-ascii?Q?PzUNYyYcarIeFNtp+oNm+mTGkQPKSLt6VlLGMWJXEyfGjmA9aERYnpylecBz?=
 =?us-ascii?Q?y6rhvG/9FDKSJ/Sxd1HwUdhjYoWg7FrnqTz7qDeD3Wto65ryvkFENcQu/rqh?=
 =?us-ascii?Q?2kL8shIarvWBYdHbkZrl/rmEBSkqW2hqiFjTV+HBZchph94Zem0d1s6P4mY0?=
 =?us-ascii?Q?C8BZ4JHjHPeLCjTC6mWdWuCjiNsud8pE24Ap+yWfDkPz+WTi0V2cQ7V/klyJ?=
 =?us-ascii?Q?UA69UN0gXpOKjuVw4evg7Wj7vl0b6y/SGNK4X5p/Oi9DAhvWdF+bLsuR+jvf?=
 =?us-ascii?Q?TMNuyRqhX7bJ8O6z30tbUngumMFc+UoUwdm+78MS/PK0IPpUB5Mpw2CJrMAY?=
 =?us-ascii?Q?muDwJgUHny6/tPzQFnbjAw2/OWYjxV65OU1qL3R1JU1AR99qbPAD/Ju8kwGf?=
 =?us-ascii?Q?IDB4LZx0WScGsXPg5XMNPGPrB/GChdpPwjJ9Kfbr5vWVt1TlJCUEcDoIovVO?=
 =?us-ascii?Q?M8g88uQrPu1hWuOFHXgKFa60TmT+K60xa/zUQs9/epASx1pkoR+gTxPa+I3j?=
 =?us-ascii?Q?ixeMkGSEt8Py8iMh6M2JmDGKgrZ7GvJjIRdtgq8FNQHsbhWogYVk6OtjpcDH?=
 =?us-ascii?Q?LbnhNGZutQ30Cl716jgcKbxrS3re/0IM6PQXkJApuY/sEcbU54EuG2iQSsMG?=
 =?us-ascii?Q?zoLAXL1rkPAbdJIRQDc0cStNfCTZVqeKwuOQN2lc4OrmbxhwyOEKUYSK8c0N?=
 =?us-ascii?Q?3gVCeWt1JvDhQAPfNca3KNnceiH6fsF0uEPJgPwTsXG6CIUkKGH7T5f6I7VZ?=
 =?us-ascii?Q?F9VP5RRXLd9lBGyJwlAOHbMQs+X4nS2XmsDMKfigZPsZ9g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF4FBF361D10D845ACB236138E3185D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5423
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a434482e-e1d6-4ef6-6660-08d8ff2e1118
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	//Xf+0xITKCEHfimGbY9Rt3PD9HRmMwGLGRdu4J2rUEamZEcNN4ecWIk6pLWxsutVd53LYZKlgiElWHVH8cH4V7hpCID5Zo2pILPnTHFSEIw8fSadqzpNmoKaIaiLm2FTamt+u4XClwZuYygQe6rQG/QJ796Zs/sZGIAflE/ZOL44E3F1zzcNAiQDeJbfY9zzvJOQI8OrHiy/vEUBA/Cwp6by6LFx82op2wy4jueTp63yIa6jVPoK3IreFx0KUS/vHHguqnIwHgBISeUOJ1glCs+t1sORKpAfSdj647TzhMJCxgsaUFagWtWXGvHLgOWs8Ly5j7sJrHgFXmOGpUGOJIfxNpNX3wODMKlLso9XwSyGk7gL5LD2b5P18qKAToxqJIGZT38/kzl4Ej7PH2Tcw+0Fy33H42iG5vfx/8Jt3SK18rHLco+Xc/czRG29JCHtcUssB8hPn58hyMnNmR2StRCl3logcLwtXcPRMyO9WtoG6hZdfaT5HKNc9XviamsYxFxt+ZUIb9dvy963CpCRi5kpdB/LpYTKH3wDATDBfSU5J52IlNV9d+X0xsp+uLi3PNPxQn5gDdh2udvDJsYnocsJ3A0luUAPEDfhFAo3scJUSOR6oRUKuZ+CQ+xHYz320PG8hH0ayzHH1SZw9SuO/4iEMZt8SqCzBkfcVNNGJ4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(70206006)(82740400003)(37006003)(2906002)(6486002)(316002)(82310400003)(70586007)(8676002)(81166007)(336012)(6636002)(36756003)(186003)(6512007)(54906003)(83380400001)(356005)(5660300002)(36860700001)(47076005)(26005)(53546011)(2616005)(478600001)(86362001)(6862004)(8936002)(4326008)(6506007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 10:14:32.1862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8faaa463-8fda-4df7-edc7-08d8ff2e18ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2602

Hi Luca,

> On 14 Apr 2021, at 10:14, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Among the common and arm codebase there are few cases where
> the hardware_domain variable is checked to see if the current
> domain is equal to the hardware_domain, change this cases to
> use is_hardware_domain() function instead.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers,
Bertrand

> ---
> v4 changes:
> - removed unneeded check for domain NULL from is_hardware_domain
>  introduced in v3
> v3 changes:
> - removed unneeded parenthesis for macro is_domain_direct_mapped
> - is_hardware_domain() checks for the passed domain and if it is
>  NULL, it returns false.
> - reverted back checks in the function late_hwdom_init
> ---
> xen/arch/arm/irq.c                       | 2 +-
> xen/drivers/passthrough/arm/ipmmu-vmsa.c | 2 +-
> xen/drivers/passthrough/arm/smmu-v3.c    | 2 +-
> xen/drivers/passthrough/arm/smmu.c       | 2 +-
> xen/include/asm-arm/domain.h             | 2 +-
> 5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index b71b099e6f..b761d90c40 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -412,7 +412,7 @@ bool is_assignable_irq(unsigned int irq)
>  */
> bool irq_type_set_by_domain(const struct domain *d)
> {
> -    return (d =3D=3D hardware_domain);
> +    return is_hardware_domain(d);
> }
>=20
> /*
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index aef358d880..8b8e3a00ba 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1168,7 +1168,7 @@ static int ipmmu_reassign_device(struct domain *s, =
struct domain *t,
>     int ret =3D 0;
>=20
>     /* Don't allow remapping on other domain than hwdom */
> -    if ( t && t !=3D hardware_domain )
> +    if ( t && !is_hardware_domain(t) )
>         return -EPERM;
>=20
>     if ( t =3D=3D s )
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 53d150cdb6..d115df7320 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3366,7 +3366,7 @@ static int arm_smmu_reassign_dev(struct domain *s, =
struct domain *t,
> 	int ret =3D 0;
>=20
> 	/* Don't allow remapping on other domain than hwdom */
> -	if (t && t !=3D hardware_domain)
> +	if ( t && !is_hardware_domain(t) )
> 		return -EPERM;
>=20
> 	if (t =3D=3D s)
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index 3e8aa37866..932fdfd6dd 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2670,7 +2670,7 @@ static int arm_smmu_reassign_dev(struct domain *s, =
struct domain *t,
> 	int ret =3D 0;
>=20
> 	/* Don't allow remapping on other domain than hwdom */
> -	if (t && t !=3D hardware_domain)
> +	if ( t && !is_hardware_domain(t) )
> 		return -EPERM;
>=20
> 	if (t =3D=3D s)
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 1da90f207d..0a74df9931 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -30,7 +30,7 @@ enum domain_type {
> #endif
>=20
> /* The hardware domain has always its memory direct mapped. */
> -#define is_domain_direct_mapped(d) ((d) =3D=3D hardware_domain)
> +#define is_domain_direct_mapped(d) is_hardware_domain(d)
>=20
> struct vtimer {
>     struct vcpu *v;
> --=20
> 2.17.1
>=20


