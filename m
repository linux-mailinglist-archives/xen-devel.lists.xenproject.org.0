Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DFC5EF44D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413660.657446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrij-0006Mj-W8; Thu, 29 Sep 2022 11:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413660.657446; Thu, 29 Sep 2022 11:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrij-0006Kl-TQ; Thu, 29 Sep 2022 11:28:49 +0000
Received: by outflank-mailman (input) for mailman id 413660;
 Thu, 29 Sep 2022 11:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yp8n=2A=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1odrii-0006Kf-MS
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:28:48 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10080.outbound.protection.outlook.com [40.107.1.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de22d551-3fe9-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 13:28:40 +0200 (CEST)
Received: from DB8PR06CA0047.eurprd06.prod.outlook.com (2603:10a6:10:120::21)
 by AM9PR08MB5969.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 11:28:45 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::b0) by DB8PR06CA0047.outlook.office365.com
 (2603:10a6:10:120::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 11:28:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 11:28:45 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Thu, 29 Sep 2022 11:28:44 +0000
Received: from d85168a4fb85.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D43FDDE3-4EE3-47DA-9C54-439F74430800.1; 
 Thu, 29 Sep 2022 11:28:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d85168a4fb85.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 11:28:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5592.eurprd08.prod.outlook.com (2603:10a6:10:1a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 11:28:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%4]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 11:28:35 +0000
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
X-Inumbo-ID: de22d551-3fe9-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RCMxNK11gWgSQ1PQzq/mQnWn2vfBlxlU6pyKIcaXT3kspkF4apapAVPKIeRZ/savfi5IHWUrHdteJlV7yALfQt0Eya7P2jV1UUsqL7lHAF5+fawqrBi+a3xXSslDVycnIzCwtm+czW/DASqloEtn+wwzkI3Bh2Wy/TTNijSTqYfGqcUAtCwBLCvx/J3vvXzyiC4OgvkP/1/rh1SahISOMvWfbXYjno+Xf1wp/p7YTEg5DiKWp4qOXPl1bHpZyWQQao1NaA+DRpaTpjIcK3onKaR4ODYVbJbZ3H5BoHC7IX8NMjAWTVzwt7dmC9AT7vxoQoyoDJsHEhWUdkY7LwOFrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+626US4mQEEhB7vlL6+Yu7x2uTa5CoTKT1x0hMiyn4Q=;
 b=cMkGzk7FcpFlDGDGh10SL0ram2AWCqRFqIONtOr7PtPgutwuRC9FF9JJ4Z87KmTc+5Retiu+VHcfqJMPACCwfb42EfSB8DbMLciPgsGqGoJgRw1DhebhrdLuKr7t3Pkr29CzkJjXtrVuTPKlet8SiGNM3tXr839SugC5NaVyUJstCAWq2Ub04AtB9WmjgrRdQLixK+2TwKtCn9C9UMr0o7i1cMUpCg2NsZtF9qqZACv2V+zXt4PL/oswnZ7jN6kNv8+41UJ2RnurMBI1TDBcYiPmfnQSo/1+FDfaLJsriC4TpC44CPTZD/z2QmzQt1s1dTt08Cbi5W/w3m7rAEBprg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+626US4mQEEhB7vlL6+Yu7x2uTa5CoTKT1x0hMiyn4Q=;
 b=DRPvzPw4KbBKmenacpTYIbaF7Id9TkaKterSo8f2xQZk7emgWt4CBK/eLo0YOGW9YSfJt0CM2D5L63Th0UQ++Ltc8zptNAm7BKaeEAPFUXgAy6ohTmzYrb0ymTtZxpp7jP8/siAKnDYlx+gOYjPa2dEmHyn3QVzflTpd8MgpS8g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ws4UuZAA6g8+RIV0kGGpqNNoQkYcJ3B99+AvDjdijgM9RIGwPSK+WT5d0k8WTP3qRLpzQLOrD5E/sxRlrOG77vOcudBk39DtgWzSBMfbzhhJ7wajb+Boh/T65rY7ZXhp94TYGi8aT24LN/sYgf0pBv+6TanTobFeMKW1Oa0mh9uZgOU/6jOdS43uaDxXgmJeiT6nVV3nz8fHWGC+lkhZUKRvSOrs3g+ZM5CoUyxq4sX9dZ1RebkQMJIhwwVyJ7lSGs24PVkCcR50Dv91D3DyA2FA2Ki1RpptyhQKXFW9SyneV0wG0JMDBQcu35yVNTHQTffE9/RtfE8kBWauquI0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+626US4mQEEhB7vlL6+Yu7x2uTa5CoTKT1x0hMiyn4Q=;
 b=csd1Y2lrQW0BGcMZ5+WcNo2aIPZrITXVe5zJ+TzGAtmUlJUlJxTRXDk6M6HHTKBSy3MdK7ZR7+3Vz8irQ9zsIICJKB3aHlAstUEJtSePl2F/5DLHRMwNGDVvqaVv61NWIOGyWq48N7rJibftwwHPb0p5H+ajHIszOpLu1H78Gz77i0zd7x3QjGYuffLHJYspU+WnLXxDXiKUFcTh0AbqXTB3q0pRNzSf8heAUqj9rSrKK7SgehF//6VoqULg2dH+GdSEPqZDHIu0wfNPrXzbkFnqC/Wp7MLS1jeGU+fOm+/0sdVgsPSkclGq0Cs8B0X3Gz/UfBdug27XY5JK1kSt6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+626US4mQEEhB7vlL6+Yu7x2uTa5CoTKT1x0hMiyn4Q=;
 b=DRPvzPw4KbBKmenacpTYIbaF7Id9TkaKterSo8f2xQZk7emgWt4CBK/eLo0YOGW9YSfJt0CM2D5L63Th0UQ++Ltc8zptNAm7BKaeEAPFUXgAy6ohTmzYrb0ymTtZxpp7jP8/siAKnDYlx+gOYjPa2dEmHyn3QVzflTpd8MgpS8g=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH 2/2][4.17?] x86: wire up
 VCPUOP_register_vcpu_time_memory_area for 32-bit guests
Thread-Topic: [PATCH 2/2][4.17?] x86: wire up
 VCPUOP_register_vcpu_time_memory_area for 32-bit guests
Thread-Index: AQHY0+kbd8ERHzF1s0C8/K+O8mIiH632Q3hw
Date: Thu, 29 Sep 2022 11:28:35 +0000
Message-ID:
 <AS8PR08MB799150126A9980081C1A0C0792579@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
 <b5afa774-d6a8-bf18-7412-25fa277d5648@suse.com>
In-Reply-To: <b5afa774-d6a8-bf18-7412-25fa277d5648@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 78E6713D3868284CA0A88DC2D91D6405.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBAPR08MB5592:EE_|DBAEUR03FT026:EE_|AM9PR08MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: e18d25f4-05be-4860-1930-08daa20dc50a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ftd2pi7ucwdBA2g9lPQ81M81xJeYLa4xw7r3MrlgyfNb9TclPJAsTnb0ZuEJFG3eAKlEDwAA/jPx8qrM+9GLs0JPq1AiHKSAssS/qq9IWDew5nzt3OZjKapXy7h/fg37MEVSZzux2feleYE0WBwE0EgOKukdL5n4ukvjmVeA/WSHy8oyKeZzrlAKLRePFhVEMxT345s8oh6uHhZKLxy0+SBts2hquh1op6t2GS4Dz5hquGdwv4Pp1qMekDMjSB727960rI68E1K59Tu1unRoL2SraGcvSoxHT1e+mL8UldOon2W+7+HjYnG8r/Vi9/HTnUgKIu2PqlhJbU3lX6E5y5TWGDB1IwB3c2i2C5EfuiO2tzmZY3il/uTJVtnEthTltmTH99wsiIrRKDGdBaeU7GW+sZxrQ9jteqfdEP4kJV/Ok8UhEe2uy1S87h0AWHFOyCveJQc55yEs27SU8LwxNNgBnyY6XA7YW5/IMn3Mf8NV1Y0lG6PQOBsJuYbRkjzs4pohCHfUREgmIr866GpOs18uawMtfxcKErWopAQr9haUz8apSF5sH/SxvEVkVkcipBh7UvmLiAUoF6U2yn1qjibINKBFu8ubHsxxfjbUmwJpqvjY8zsLqVENZC/xrrmK6I1G7Mdexk1Wt07+Qy6CH+m5D44U7VDd/NH4rZ2L4pObAvxH6rxT4MZ0dtSAWSlm3nG0CiZi8mLaz7hlm7q6HQM6lHBKVzL8Vm5qjROiY2EPhI8Z9k8dlf8Yw5eYcnWHJd0Vl/7eJdmc4Z431gModQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199015)(66476007)(86362001)(478600001)(38100700002)(122000001)(83380400001)(38070700005)(186003)(52536014)(41300700001)(66446008)(8936002)(66556008)(2906002)(9686003)(64756008)(66946007)(5660300002)(6506007)(4326008)(76116006)(7696005)(54906003)(55016003)(316002)(110136005)(26005)(71200400001)(33656002)(8676002)(66899015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5592
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81ff1b17-4cbc-4521-3d64-08daa20dbf60
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y3SdjBUg2Dyki9brQK1hcgyshFC/wKiFAjCSIAvxAC1Y8HUdxltppgLGOIT+7MqUWKeYnuNzauvMKnxZr77mFXp/Z4IUnjRY/iLNVx4dvAMISvnPD/4Wwbc8doIN5mEHk4pYRImUgmMPOp1z4DsMK72oTKv5HoZxWj1OVnUbLzeHAynz9MrTM0F85gc4BZKGMLNAfbmfzXnIv5Hf9kaQl975uRY/n8uK+fShbxReUgoHGaG9s08X80pmhWrYEroJJse9ijDIXmbu40SvTG4NKuAXKMa7zpwRW4u/IeTcvYlkexvGcl5an4WG2w6r/xaf97EP3Tmn9g5/G2lAXJOo773bCrWQfdBVwPK2t6DjwAdQ+OnD5KPTddJ61zjK4L8HXtZ0RjNTMqIdV1ylIZOqiOEXk9PZBCSu1D2ietkC5utoJs3wJS74RloyT7VQMUH8l3qgFKFxF2PHnqAZ5psguOAv9se1nlBsYHczjTHgdwrBZe2b3K4JlKDz/qJv9JnYVs+Np9JvPKyXcqID4CWSi26+wmWkZVEiOIOTQ5Iu7CLuiLTwwFybcViICdE/H8Q9UBC5NvxrdpbUTF+7Y89bx/Q6T2RJwgpK9pybJpC2OkHL9KzzkIHo02jAADeMJdzAuVLUiVSQ6hHdZ3dS84gYc7Uxo+vN/ZrxKn2RILmmtyAvcbVdLGM3lc3VT69I+rmiZKBpiwcSa4GuOumG0kQ6jt33LmFYTnPdzDrvgF8aODhTxpFEbf5aRlpe+cPhlVBv/If+93IoZKjg0xZFArCvHg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(66899015)(336012)(47076005)(82310400005)(356005)(33656002)(40460700003)(81166007)(5660300002)(26005)(6506007)(107886003)(41300700001)(8676002)(4326008)(7696005)(82740400003)(55016003)(86362001)(40480700001)(83380400001)(2906002)(186003)(36860700001)(54906003)(110136005)(9686003)(478600001)(70206006)(8936002)(52536014)(316002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:28:45.0238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e18d25f4-05be-4860-1930-08daa20dc50a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5969

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDIvMl1bNC4xNz9dIHg4
Njogd2lyZSB1cA0KPiBWQ1BVT1BfcmVnaXN0ZXJfdmNwdV90aW1lX21lbW9yeV9hcmVhIGZvciAz
Mi1iaXQgZ3Vlc3RzDQo+IA0KPiBGb3JldmVyIHNpbmNlZCBpdHMgaW50cm9kdWN0aW9uIFZDUFVP
UF9yZWdpc3Rlcl92Y3B1X3RpbWVfbWVtb3J5X2FyZWENCj4gd2FzIGF2YWlsYWJsZSBvbmx5IHRv
IG5hdGl2ZSBkb21haW5zLiBMaW51eCwgZm9yIGV4YW1wbGUsIHdvdWxkIGF0dGVtcHQNCj4gdG8g
dXNlIGl0IGlycmVzcGVjdGl2ZSBvZiBndWVzdCBiaXRuZXNzIChpbmNsdWRpbmcgaW4gaXRzIHNv
IGNhbGxlZA0KPiBQVkhWTSBtb2RlKSBhcyBsb25nIGFzIGl0IGZpbmRzIFhFTl9QVkNMT0NLX1RT
Q19TVEFCTEVfQklUIHNldCAod2hpY2gNCj4gd2UNCj4gc2V0IG9ubHkgZm9yIGNsb2Nrc291cmNl
PXRzYywgd2hpY2ggaW4gdHVybiBuZWVkcyBlbmdhZ2luZyB2aWEgY29tbWFuZA0KPiBsaW5lIG9w
dGlvbikuDQo+IA0KPiBGaXhlczogYTVkMzk5NDdjYjg5ICgiQWxsb3cgZ3Vlc3RzIHRvIHJlZ2lz
dGVyIHNlY29uZGFyeSB2Y3B1X3RpbWVfaW5mbyIpDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IElzIGl0IGFjdHVhbGx5IGNvcnJlY3Qg
Zm9yIHVzIHRvIGRvIGNyb3NzLXZDUFUgdXBkYXRlcyBvZiB0aGUgYXJlYSBoZXJlDQo+IChhbmQg
YWxzbyBpbiB0aGUgbmF0aXZlIGNvdW50ZXJwYXJ0IGFzIHdlbGwgYXMgZm9yIHJ1bnN0YXRlIGFy
ZWENCj4gdXBkYXRlcyk/IFRoZSB2aXJ0dWFsIGFkZHJlc3MgbWF5IGJlIHZhbGlkIGZvciB0aGUg
Z2l2ZW4gdkNQVSBvbmx5LCBidXQNCj4gbWF5IGJlIG1hcHBlZCB0byBzb21ldGhpbmcgZWxzZSBv
biB0aGUgY3VycmVudCB2Q1BVICh5ZXQgd2Ugb25seSBkZWFsDQo+IHdpdGggaXQgbm90IGJlaW5n
IG1hcHBlZCBhdCBhbGwpLiBOb3RlIGhvdyBIVk0gY29kZSBhbHJlYWR5IGNhbGxzDQo+IHVwZGF0
ZV92Y3B1X3N5c3RlbV90aW1lKCkgb25seSB3aGVuIHYgPT0gY3VycmVudC4NCj4gDQo+IEknbSBz
dXJwcmlzZWQgYnkgTGludXggbm90IHVzaW5nIHRoZSBzZWNvbmRhcnkgYXJlYSBpbiBhIGJyb2Fk
ZXINCj4gZmFzaGlvbi4gQnV0IEknbSBhbHNvIHN1cnByaXNlZCB0aGF0IHRoZXkgd291bGQgb25s
eSBldmVyIHJlZ2lzdGVyIGFuDQo+IGFyZWEgZm9yIHZDUFUgMC4NCg0KSSByZS1yZWFkIHRoZSBn
dWlkZSBmb3IgcmVsZWFzZSBtYW5hZ2VyLCBhbmQgaXQgdGVsbHMgbWUgdGhhdCAiaW4gZmVhdHVy
ZQ0KZnJlZXplIGFuZCBlYXJseSBzdGFnZSBvZiBjb2RlIGZyZWV6ZSwgYnVnIGZpeGVzIGFyZSBl
bmNvdXJhZ2VkIHRvIGJlDQptZXJnZWQsIHdoaWxlIGluIHRoZSBsYXRlIHN0YWdlIG9mIGNvZGUg
ZnJlZXplLCBjb21wbGV4IGJ1ZyBmaXhlcyBtaWdodA0KYmUgcmVqZWN0ZWQgaWYgdGhlIHJpc2sg
b2YgYWNjZXB0aW5nIGlzIGhpZ2hlciB0aGFuIHRoZSByaXNrIG9mIHJlamVjdGluZyBpdCIuDQoN
CkhlbmNlIEkgZ3Vlc3MgaW4gY3VycmVudCBzdGFnZSwgSSB3b3VsZCBub3QgYmxvY2sgdGhpcyBw
YXRjaCBmb3IgcmVsZWFzZS4NCklmIHRoaXMgcGF0Y2ggaXMgYWNrZWQvcmV2aWV3ZWQgYnkgb3Ro
ZXIgeDg2IG1haW50YWluZXJzLCBmZWVsIGZyZWUgdG8gYWRkOg0KDQpSZWxlYXNlLWFja2VkLWJ5
OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5
DQoNCg==

