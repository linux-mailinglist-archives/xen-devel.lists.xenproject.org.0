Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199408031B8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 12:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646853.1009455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7Pm-0001tc-9U; Mon, 04 Dec 2023 11:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646853.1009455; Mon, 04 Dec 2023 11:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7Pm-0001rV-6m; Mon, 04 Dec 2023 11:47:06 +0000
Received: by outflank-mailman (input) for mailman id 646853;
 Mon, 04 Dec 2023 11:47:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUg+=HP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rA7Pk-0001rO-FY
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 11:47:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6affe86-929a-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 12:47:02 +0100 (CET)
Received: from AM0PR02CA0114.eurprd02.prod.outlook.com (2603:10a6:20b:28c::11)
 by PA4PR08MB5982.eurprd08.prod.outlook.com (2603:10a6:102:eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 11:46:28 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::d9) by AM0PR02CA0114.outlook.office365.com
 (2603:10a6:20b:28c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 11:46:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 11:46:27 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Mon, 04 Dec 2023 11:46:27 +0000
Received: from 3b362c5b53d8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83884EE7-84B2-4ACB-B0EB-6EDEB37B5F2E.1; 
 Mon, 04 Dec 2023 11:46:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3b362c5b53d8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Dec 2023 11:46:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB8198.eurprd08.prod.outlook.com (2603:10a6:10:382::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 11:46:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 11:46:19 +0000
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
X-Inumbo-ID: d6affe86-929a-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ISfpEJ/F75lkpHwHno327eWarUpCXlAD7458PCGbQPLFAgFR/dkblm10U+flK6vu+DVgqVz9+rPgFdZCPzTqm9AOyXyv+pVfpBi2eP/JaAx/Lk8DLydT9o+kJRRZX2YM/w+tpk52jyal3XKhXEo7BwFcPf0o5fa8SY8G8LoaS9Jg3A0v9YRoUo9/iwPHzuAtXNwGNOf4hLcfDVS0A0bomgy1WPKZl4y9lDZSUV/dZftHUzvP9n+nQSQlfbeHlEXkcf36OEmWdOTVKOOGuwGNarrISay5BzPvr6drfuLgLvJgIOkhrgJA5/mnljuQHQlxyvo4kS6x2Vb9HDQ7twm2yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH786Qtaz73U3Uy/0RWfSRhyfkNXha2QcuCH9A5W2ho=;
 b=b7z6+88Yy61KclfbWYJ4mqIfxDlJZn3Z3Y0TMd+17x3Xd6ISP/JA70xJ0cinORkz5nj2Je0HkMGJKtzS9Dz8P/3aJH+zgJ18G4E/qw93sZWUHCPGGEb1HZ9EQho2pHVKEhrN6H8Lu4ck4tLXB1P8Pmjj7NQLfeWqGm10f8x6grr7QquPGQI2yCQuSF/ZJnT2qOU7bz0Knk/eDXRJmUmgXuTk74eAsxwJURfTMaiT8jupfIcnbb1Jq7Yf8ejERjTpiS+jLzG+/4uqbKr2xavA97kcFo1OuJHOT8867lcnXDaoCoAbwo9GD9nALTSzaZMwSos06TK2V0LUVlgZo7//Fw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH786Qtaz73U3Uy/0RWfSRhyfkNXha2QcuCH9A5W2ho=;
 b=5gNvyHBlM5vBoibPYoxtEhYrGx43yphFs+J0X2O51AI7zGk2W2Y++AFUMJ7vLOBErPbTMhSRFLGrBVdoAkx1Q6YN4hL8ZAah3Rft/aO0DB1j2dPf1uBiGw1qBMBZZFmKeekavr6tEi11urQYoQljXf7u3XXSiX6zGM32kR8uHvw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1714de045a2a82d1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoOn4PnyZxnw4tSjvjs7rKvXtO+rN2ugIdLkn60MtTZxEP9gOwdVJ05wI5yxq8r2/ZipDYbnyHnbIyna0UtaTohLzwYVoJ8QaF6/eS8xJAU6FJo2BkgmpsWqmNZfA5aqdwkuwyJivaKUb08+sdbrtDuB05gH5Nj+fGjzZE4L76Dm74nlbtmxlzSdE4lUVcfcQH1N99koW6A9R22aMBok0SwE/Uc+4nC+J1f0uyI6wdpL4DtAm6J9ATXn98S+ZETdbvRixUYXMkrWDPFRWbEEXHIvEgI9kM2dkKKq4C2/LRBrwJjLC9tOvDXigTnFTqBg6yqna1aZ8pexAp2wTL7x4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH786Qtaz73U3Uy/0RWfSRhyfkNXha2QcuCH9A5W2ho=;
 b=HvjjlyKfoPSdJffDu6ujHHjjfySj+V6AlMGzP4EPtXT+bOUPYks2DPE2/BdYffJDQPdX2+ASP5je6coAeJN9E6DKLAHkLyuuy4F0WxTUluqtvPE3mvg9blHvZAAAZhZs2tT/9Ukfr/10Xter71ZhyUffTWC+Emn6sHtseyRmiuJxOuZ0p1IFeSXowLNCxq8Gvb974tFkYkSqx5i1XjpLIgwKvhKXpRXiymr+5t/1Qo0uMSAl76KKYRWwCxTPBn1cZSDRxZRxtwQ8mMlDZI+nkUiAuPpeBlObu3oqYhbnlTDh1KFyCXxcYqb/jLSIL71kmkotV9gIa1Rkv8g91+p3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH786Qtaz73U3Uy/0RWfSRhyfkNXha2QcuCH9A5W2ho=;
 b=5gNvyHBlM5vBoibPYoxtEhYrGx43yphFs+J0X2O51AI7zGk2W2Y++AFUMJ7vLOBErPbTMhSRFLGrBVdoAkx1Q6YN4hL8ZAah3Rft/aO0DB1j2dPf1uBiGw1qBMBZZFmKeekavr6tEi11urQYoQljXf7u3XXSiX6zGM32kR8uHvw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
Thread-Topic: [PATCH] CODING_STYLE: Add a section of the naming convention
Thread-Index: AQHaJIbmwHP4nuD1ZUiv2fi04v+voLCUxT2AgAQ5aoCAAAMKAIAABDEA
Date: Mon, 4 Dec 2023 11:46:19 +0000
Message-ID: <235A77D3-932D-4D31-8AC1-267B3C734DEE@arm.com>
References: <20231201184728.31766-1-julien@xen.org>
 <0e20592b-9800-4b9d-9f2f-a996f9ac00bd@xen.org>
 <956BC72E-0898-490F-9881-226EE7224F94@arm.com>
 <1038b45c-3427-4d1e-bfed-dbd303b67cd2@xen.org>
In-Reply-To: <1038b45c-3427-4d1e-bfed-dbd303b67cd2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB8198:EE_|AM3PEPF0000A793:EE_|PA4PR08MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5d4546-4a5e-447f-810f-08dbf4bea679
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1IoGpLke5Tlj7Yx7NyzaTCjTZ/1DFDYjh+sODRr1p/vLVpCQllM4Kok0UvKKyOHPyFZFG91fFIM7IMbNcdHvBe7/3o8IocgIehO22DLuSVQmusWLCWa5+mhc5uWsgfBBjACTB49wOtkk/9Zlfs6LK1iHXKiF+CnJc3o17geXoCWKKVRNa40GTOc/H3Oo5TOgCQZSaQYhsv858mOnJSE9sRn2b8pk5RyqT+cJLZEMvHpaP46dcxonwNP5uyYb1UKpf7BU5nxcPvb9kyx/p4Fr/mvAb/664BBnb+cvgAVS6X1FkGU6Q0G6QDJxIEMIAekUl3YIwVVkYOWV7ojUrdRJ8spcVRMfUYipqAYI11eAMzGPIwhD4UZIJZS9OyNzo/bqbaGVPg72a51i/lDKdtNvLpDEY8KbWvZnWO8ATLGHZ0FpQnDfhoGZIvPP85zbfWiGO+cfkhTmgiTTCvWpypt95Rp9Q+zFpGeMjkTS3wwaP1z1xdFQAKbA2WwSA0Pzn9kazono6pB2GbDJYIOITi736WYDCrmQN7Jkd/a6zQAbPOMCvEliPNkrhNiw849Q/3K4p/rQD8JEa21f9FQlFVBz0ZqxcnvCVFT1SRnc8ifjXyrql4gQoSh58Cb0OPw/1d4cGAd0FFqY69bzn03/ve/OXvqKys5tcUzLMnfQCJS/f2RbQOylTjCJrcisi7p+ladH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(39850400004)(366004)(230173577357003)(230922051799003)(230273577357003)(64100799003)(1800799012)(186009)(451199024)(2616005)(122000001)(4326008)(8676002)(8936002)(6512007)(6506007)(53546011)(26005)(6486002)(71200400001)(478600001)(91956017)(66476007)(76116006)(66446008)(64756008)(66946007)(66556008)(54906003)(316002)(6916009)(33656002)(2906002)(36756003)(41300700001)(38100700002)(38070700009)(86362001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BDF663FA78DAA4B8543BFB59DC7DFB1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8198
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55dd8077-2117-4c6c-3431-08dbf4bea184
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JEp7J2apbEp7cKW/pekgdKTqo0nesG768tV2PEnw3lCuh3VU6B5zPdxzHJlrkn33PP+7FykCaGjTe9lApiW+TmbdVayu+9aLdWkE/CU4AOFTcbhMWFW6gqe/3JYcL8U+F3U3RLzimuLFfnp2nyZwUmAuS2cLIro68fwcY4w3PxpAQiBAdvmQR700JtOSobB+eHYoepARlMxBhrZpo7XJFxndQMrz7pMkM71dpMj5PuLhO5d2gUYRYUDj0a0g7v2rLsKWeN0aUmHMDa3NSA0F4ERqMvDYqlAaLTBIIhCI4D9RyFwU2NNaeI510DQSBhNgj/z+uOcLGavUpwHvUdhIpO7I88X4bstoYW47nzBWLKSH4U0k57oE1au7JctEPcn/QzCpCQgPiweTpwJ7lbfkCD5kUkvXN8X7M3fe9waQpMkjT33YQ+hReG8d6OV3UzB3xLEZQLe9wxhAi21XzO0qV0awxJ+by8IpjnKt5Ddpcar7ob87qHjULcDe5nAjH+6gDEG4w9ztYs7wnWj2BAie5S9xtlhbbm7pUYwfb0/Gt3+7OeQWIbq84uKb0M08bCb69Tj6XwrOgpIT7WiSsV4S6yMG85+u7UIZqhJ98lKprdT2B4j7NNd3Klr/MC7EkqELogIcW2gBeyqiVK3pWfF9X7Eakt7sXvJr2hacKBLBv93gCXr5r/gqJAmBvdBxVb+buOUqHImKc7mViuAdO3AhRyAJOxrcJulsEdtLf1ISvxbSmZD5c6RWxOrfpkevnwmN915z+pYNr7k1iYTwYeTPBRk0U32OqkncN877wrw0JDY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(36840700001)(46966006)(40470700004)(47076005)(81166007)(356005)(82740400003)(40480700001)(26005)(336012)(2616005)(6506007)(53546011)(6512007)(36860700001)(478600001)(6486002)(40460700003)(70206006)(70586007)(54906003)(316002)(8936002)(8676002)(6862004)(4326008)(33656002)(2906002)(41300700001)(36756003)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 11:46:27.6376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5d4546-4a5e-447f-810f-08dbf4bea679
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5982

DQoNCj4gT24gNCBEZWMgMjAyMywgYXQgMTE6MzEsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IE9uIDA0LzEyLzIwMjMgMTE6MjAsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gMSBEZWMgMjAyMywgYXQgMTg6NDksIEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDAx
LzEyLzIwMjMgMTg6NDcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4gRnJvbTogSnVsaWVuIEdy
YWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+Pj4gU2V2ZXJhbCBtYWludGFpbmVycyBoYXZlIGV4
cHJlc3NlZCBhIHN0cm9uZ2VyIHByZWZlcmVuY2UNCj4+Pj4gdG8gdXNlICctJyB3aGVuIGluIGZp
bGVuYW1lIGFuZCBvcHRpb24gdGhhdCBjb250YWlucyBtdWx0aXBsZQ0KPj4+PiB3b3Jkcy4NCj4+
Pj4gU28gZG9jdW1lbnQgaXQgaW4gQ09ESU5HX1NUWUxFLg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPj4+PiAtLS0NCj4+Pj4gIENPRElOR19T
VFlMRSB8IDkgKysrKysrKysrDQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
DQo+Pj4+IGRpZmYgLS1naXQgYS9DT0RJTkdfU1RZTEUgYi9DT0RJTkdfU1RZTEUNCj4+Pj4gaW5k
ZXggY2VkM2FkZTVhNmZiLi5hZmQwOTE3Nzc0NWIgMTAwNjQ0DQo+Pj4+IC0tLSBhL0NPRElOR19T
VFlMRQ0KPj4+PiArKysgYi9DT0RJTkdfU1RZTEUNCj4+Pj4gQEAgLTE0NCw2ICsxNDQsMTUgQEAg
c2VwYXJhdGUgbGluZXMgYW5kIGVhY2ggbGluZSBzaG91bGQgYmVnaW4gd2l0aCBhIGxlYWRpbmcg
JyonLg0KPj4+PiAgICogTm90ZSBiZWdpbm5pbmcgYW5kIGVuZCBtYXJrZXJzIG9uIHNlcGFyYXRl
IGxpbmVzIGFuZCBsZWFkaW5nICcqJy4NCj4+Pj4gICAqLw0KPj4+PiAgK05hbWluZyBjb252ZW50
aW9uDQo+Pj4+ICstLS0tLS0tLS0tLS0tLS0tLQ0KPj4+PiArDQo+Pj4+ICtXaGVuIGNvbW1hbmQg
bGluZSBvcHRpb24gb3IgZmlsZW5hbWUgY29udGFpbiBtdWx0aXBsZSB3b3JkcywgYSAnLScNCj4+
Pj4gK3Nob3VsZCBiZSB0byBzZXBhcmF0ZSB0aGVtLiBFLmcuICd0aW1lci13b3JrcycuDQo+Pj4+
ICsNCj4+Pj4gK05vdGUgdGhhdCBzb21lIG9mIHRoZSBvcHRpb24gYW5kIGZpbGVuYW1lIGFyZSB1
c2luZyAnXycuIFRoaXMgaXMgbm93DQo+Pj4+ICtkZXByZWNhdGVkLg0KPj4+IA0KPj4+IFVyZ2gs
IEkgc2VudCB0aGUgd3JvbmcgZHJhZnQgOiguIFRoaXMgaXMgdGhlIHdvcmRpbmcgSSB3YW50ZWQg
dG8gcHJvcG9zZToNCj4+PiANCj4+PiArTmFtaW5nIGNvbnZlbnRpb24NCj4+PiArLS0tLS0tLS0t
LS0tLS0tLS0NCj4+PiArDQo+Pj4gKyctJyBzaG91bGQgYmUgdXNlZCB0byBzZXBhcmF0ZSB3b3Jk
cyBpbiBjb21tYW5kbGluZSBvcHRpb25zIGFuZCBmaWxlbmFtZXMuDQo+Pj4gK0UuZy4gdGltZXIt
d29ya3MuDQo+Pj4gKw0KPj4+ICtOb3RlIHRoYXQgc29tZSBvZiB0aGUgb3B0aW9ucyBhbmQgZmls
ZW5hbWVzIGFyZSB1c2luZyAnXycuIFRoaXMgaXMgbm93DQo+Pj4gK2RlcHJlY2F0ZWQuDQo+Pj4g
Kw0KPj4+IA0KPj4gSGkgSnVsaWVuLA0KPj4gQ2FuIHdlIG1ha2UgYW4gZXhjZXB0aW9uIGZvciBw
eXRob24gZmlsZXMgdGhhdCBhcmUgbWVhbnQgdG8gYmUgdXNlZCBhcyBtb2R1bGU/DQo+PiBCZWNh
dXNlIG1vZHVsZXMgY29udGFpbmluZyDigJgt4oCYIGNhbm5vdCBiZSBpbXBvcnRlZCB1c2luZyDi
gJhpbXBvcnTigJkga2V5d29yZCBhbmQNCj4+IG5lZWRzIGFub3RoZXIgd2F5IHRvIGRvIHRoZW0g
d2hpY2ggaXMgbm90IGNvbnZlbnRpb25hbA0KPiANCj4gSSBhbSBub3Qgc3VyZSB0aGlzIG5lZWRz
IHRvIGJlIHdyaXR0ZW4gZG93biBleHBsaWNpdGVseS4gQXQgdGhlIHRvcCBvZiB0aGUgZmlsZSB3
ZSBoYXZlOg0KPiANCj4gIlRoZSBYZW4gY29kaW5nIHN0eWxlIGRlc2NyaWJlZCBiZWxvdyBpcyB0
aGUgY29kaW5nIHN0eWxlIHVzZWQgYnkgdGhlDQo+IFhlbiBoeXBlcnZpc29yIGl0c2VsZiAoeGVu
LyopIGFzIHdlbGwgYXMgdmFyaW91cyBhc3NvY2lhdGVkIGxvdy1sZXZlbA0KPiBsaWJyYXJpZXMg
KGUuZy4gdG9vbHMvbGlieGMvKikuDQo+IA0KPiBBbiBleGNlcHRpb24gaXMgbWFkZSBmb3IgZmls
ZXMgd2hpY2ggYXJlIGltcG9ydGVkIGZyb20gYW4gZXh0ZXJuYWwNCj4gc291cmNlLiBJbiB0aGVz
ZSBjYXNlcyB0aGUgcHJldmFpbGluZyBjb2Rpbmcgc3R5bGUgb2YgdGhlIHVwc3RyZWFtDQo+IHNv
dXJjZSBpcyBnZW5lcmFsbHkgdXNlZCAoY29tbW9ubHkgdGhlIExpbnV4IGNvZGluZyBzdHlsZSku
DQo+IA0KPiBPdGhlciBwYXJ0cyBvZiB0aGUgY29kZSBiYXNlIG1heSB1c2Ugb3RoZXIgY29kaW5n
IHN0eWxlcywgc29tZXRpbWVzDQo+IGV4cGxpY2l0bHkgKGUuZy4gdG9vbHMvbGlieGwvQ09ESU5H
X1NUWUxFKSBidXQgb2Z0ZW4gaW1wbGljaXRseSAoTGludXgNCj4gY29kaW5nIHN0eWxlIGlzIGZh
aXJseSBjb21tb24pLiBJbiBnZW5lcmFsIHlvdSBzaG91bGQgY29weSB0aGUgc3R5bGUNCj4gb2Yg
dGhlIHN1cnJvdW5kaW5nIGNvZGUuIElmIHlvdSBhcmUgdW5zdXJlIHBsZWFzZSBhc2suIg0KPiAN
Cj4gYW5kIEkgd291bGQgbm90IGRlc2NyaWJlIFB5dGhvbiBhcyBsb3ctbGV2ZWwuDQoNCk9rIG1h
a2VzIHNlbnNlIHRvIG1lISBUaGFua3MNCg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4g
SnVsaWVuIEdyYWxsDQoNCg==

