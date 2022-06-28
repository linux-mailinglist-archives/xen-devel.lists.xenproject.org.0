Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD4F55E5A6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357224.585736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6D4W-0007oa-Io; Tue, 28 Jun 2022 15:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357224.585736; Tue, 28 Jun 2022 15:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6D4W-0007mG-Ft; Tue, 28 Jun 2022 15:24:12 +0000
Received: by outflank-mailman (input) for mailman id 357224;
 Tue, 28 Jun 2022 15:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=97eV=XD=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o6D4U-0007lr-7Z
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:24:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10052.outbound.protection.outlook.com [40.107.1.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59ea71a8-f6f6-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 17:24:07 +0200 (CEST)
Received: from AS8PR07CA0014.eurprd07.prod.outlook.com (2603:10a6:20b:451::11)
 by AM9PR08MB5972.eurprd08.prod.outlook.com (2603:10a6:20b:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 15:23:59 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::9a) by AS8PR07CA0014.outlook.office365.com
 (2603:10a6:20b:451::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.13 via Frontend
 Transport; Tue, 28 Jun 2022 15:23:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 15:23:58 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Tue, 28 Jun 2022 15:23:57 +0000
Received: from f07c404ea09e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6937AAAD-C2EA-49EF-B0DF-4CA9C084BC06.1; 
 Tue, 28 Jun 2022 15:23:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f07c404ea09e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 15:23:50 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB7PR08MB3051.eurprd08.prod.outlook.com (2603:10a6:5:1e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 15:23:49 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 15:23:49 +0000
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
X-Inumbo-ID: 59ea71a8-f6f6-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PKL0BA4lwDA//0i8Bl91+MQjt/XrDLbkE9QIZxC25WZfEtmPsa8Sf6Kv18pFiwuvBaG5IWYAYGyGW0r39DOLbZ65uKgUtAFAjTNbu4hhufWZqhoueidSustyDAA+HSgUJM3w2JiK7gr41DcajjWdu1GdGSrItirIjH8OEglsHWRCvYOhFa2gHoo/w2ek99FBJ0lnVNeAHIt5havwUg5die1l9vCtE5XnL/AXcENQ+xrrmZPUeqLnaPXvzgZl3sgMV0wi4kAA6y8mrEdsI8ym81vbb28I03pld2qyzdgJfMIkaVDfg5sd2SXiEVB680uobzXYtaeDGtZzurzdBp4vMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkAEXHpWhd+TGBrVXj9Cje4WR6fV5sL+sqCK7ejyEIU=;
 b=KRWSOyVNM8PED4jpiyDzaWMhQ8g4TlMQoOXni7cMRioUsRjenr/4TKgDuOSStOs4ul2AJsczUDhMVTJNWl7iI+6RH+lpSRsyZmu1EmYlYYO8nrpO9D1A3tJoZ68YpD+ouLFFZp45frg3dphjU/w8iG0/qHEp+Jk5CKrDlzDaYpXC1BHXCHzNysxv0kMxZRqeh1PJeIiUDj5D7xifoUV5LSZocBWePTKgADyeKb25KoRrZ6vizUSDZUvrGo1MorCFPQr5hvIcudj15Ajng2xeCH4mSWu2om90hvsrHEfPI5/WTzYh4GFNPD1peFqSSn6GgoXVT1smcts5884xG8Ajqw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkAEXHpWhd+TGBrVXj9Cje4WR6fV5sL+sqCK7ejyEIU=;
 b=AYs8xwuif0tobu/9/V5LijYMfIjYZ3ActRSAu1W3y2aiBJ7DJcBpPFRPUsE+XqXaw5QtILfj1aZiBtB0tDMwKO8dQ+IElyOyJafv32ctVdB3LM1GmA+25VyZIFCohlyFBGm3J3TJm/L3MThJJG0l+yAk10E6mZlqGVa9yWVS1Qc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f472122aade4a4d4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEP54BOOA75lEMz8S2VZ1JRyCIgEPYyNGKkUL8N5AwYLnjRhO0F4rgrptk6n0O5tWxLSps7IkgjfrQzw8u8FMBWMlZCNrG43AIXRnJtPcXIGvcCSt2D0aLG8D7EXd63pqJk7gpGU65y196oOy4W94rMMC2qZRWJrg7awxRVY6XWAqOpDf2Z0QvDoR5oxnM/U6ojwVp3kVPzRJmm8Phh931oy8xCpvzRse8v+cq+gFE2EexxuArOtXCPDrhhg644LqZD95mIsn0PfjqPQJQk+HdwjHeiBUkUQFQP3sgw46hk9SC0OYQp6HW5Dyy5ZVLqAE3mzgND+sjmlp0QuFbIj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkAEXHpWhd+TGBrVXj9Cje4WR6fV5sL+sqCK7ejyEIU=;
 b=YdFz1Er9iHQNq1NnPD1LZRPKAbnyjIpubslsTWVjvRWKt/NI8FKR6RZnf7QiW/J9nN+ZA1Wagr1roSquaGoYWyqi8ZZY97ODKP6qk2H6WmKYMn9E0+wPDNwVB7qCuiGge9B4eocuuAIhncZ4h7PuoSEKS+tAERr8JvGQY/tplLFSAWEdelVdPKqYVY7qb9aRRK2PuWFxTDE3+H9KXV3323mKbsKD6RrNHBl9+hliQ4vOVjAWBm7v9SW3maL0PhCHeUTBpuPxsnhcpM1JxwwWI52CzAzybYP5nVweaEtuZ2PwW51yEn0+51KeQHX+0Be5mZVzPhnkBbrU4g3A7cIaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkAEXHpWhd+TGBrVXj9Cje4WR6fV5sL+sqCK7ejyEIU=;
 b=AYs8xwuif0tobu/9/V5LijYMfIjYZ3ActRSAu1W3y2aiBJ7DJcBpPFRPUsE+XqXaw5QtILfj1aZiBtB0tDMwKO8dQ+IElyOyJafv32ctVdB3LM1GmA+25VyZIFCohlyFBGm3J3TJm/L3MThJJG0l+yAk10E6mZlqGVa9yWVS1Qc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Topic: [PATCH] docs/misra: Add instructions for cppcheck
Thread-Index:
 AQHYh7nJHM8+T3fZ/0Gr0RGCgDxGeq1eaYGAgAALcICAAARSgIAAFXiAgABAfoCABidzAA==
Date: Tue, 28 Jun 2022 15:23:49 +0000
Message-ID: <C7643376-EBD0-46C3-B940-D3F6198BD124@arm.com>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
 <15F23829-3693-47CC-A9D6-3D7A3B44EB64@arm.com>
 <88bd7017-e2b3-59f3-a68a-25db9e53136d@xen.org>
 <CA8DFF26-3D7F-4CDA-9EDC-E173203B2A51@arm.com>
 <81c33c8c-e345-2fe3-32c6-2f80799eefd0@xen.org>
In-Reply-To: <81c33c8c-e345-2fe3-32c6-2f80799eefd0@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 504c5049-85d0-4d05-44e6-08da591a38da
x-ms-traffictypediagnostic:
	DB7PR08MB3051:EE_|VE1EUR03FT011:EE_|AM9PR08MB5972:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6nq1PdwlR+jTT6lIQWt/q282PJv2T8UV9H3IphnyUmJZqyv9PZT/wjuUSVG5xmZxaIQVU982qgpuvDxaPM2dkKbJ8G0IN3nZjRPTb0JKW8v7Isbbq7yGgSaROGFW5KXylmYF3BuQlS4LAIzQ5e0jBwSXy6vGSU4ZtaHKLx4sJqkYcO+BgjEdRGax8P9JVvfFsn/EKP09U91xsyZdRIfL0kGl3iLi9uRVrdlHrJhGmD3IWX6kd68VU53/suVWRnARfroqFlJHUZoGLRfVYn06ezQ3qhpHyJ4zzAWzS62uTxMfGYofsreDQ/GaCuVc0yytl5Za9dGKoXEFX1FypQ0gvzaEhloQalNlKqTiPGU8FcLo4TW9XaTDssOvLbB1rGu3jDh/CGrvaYxNC+NtSoSSn9j0vmGHCH/3IhVYpplsvW/l3m13GAy4MNqSz7u/ZI6ttkRXxAmLAnggEtHhNK33tJWUIDVnnIseBAaZxPq0Jw63cnDujLg5rtL3lftQzhXd0nakAcNCj6Mrr7K05qjeBomnMMGJS5/JZUq5c1c+12/VpPI3sQjMXvmqvSrucED4EyPCnv8rz2loCmoMdJoIBOiFYpY7bqMeyGajW1baK7856MNuc/R8qifwhl0maRpXfzSEg8BBVC/26CtHWGCtfVioofFdMLnyTOfWF48ML8jKK2WNLodHPBDpDTO6qszqltcOxktjqySHTFJkz4v+gb9gCptAMPhsFBCBpm15urTsA18IJKBFv8mreBKX2M0hBKIqN03a/0IWi47289bJGVYO2wPFAmagwHrCaDX00Hm0kmQqGG5UV9DqQnlJTmRiq8HoXqu34nQN0bWvDrz//9/IY3SVsaLJFh38gd4/1BI//GCfvabEjjwM1gr1xXnl3/wEj5QfePGXNN+D91m4cg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(8676002)(6486002)(38070700005)(66556008)(4326008)(64756008)(71200400001)(66946007)(66476007)(966005)(86362001)(6506007)(53546011)(41300700001)(76116006)(26005)(6512007)(66446008)(478600001)(91956017)(186003)(6916009)(2906002)(36756003)(33656002)(38100700002)(8936002)(122000001)(2616005)(54906003)(5660300002)(316002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCE19F31B8451849B9E1CAF03E430121@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3051
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e2d5fc3-1974-4829-e8a5-08da591a3349
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qCXNK4X8wEScbeRXz0bUgDn8U8ToVyAAUJDmwCvDsZR9gU11x7s4WunHZPuHffUgpIHzvXrcwYEF/m/Fe9jrlcijsbsGvO3Q8nOnaaAtjMbfJke7FVpYCrx3i97L9BOttTBvcoKr7Dr9oeEkK63WslbVa1JFvZDx9LQXRQ6xATi5c4+D+cIJ1C+vTzZOldMROVT1GLeS63L8CVgT+Ke9DIClv5vdI+f1bkpWn3+PgHloln/p6NCO+Di1GaKVmObukqolpZ7oyXq3nwC4MqFuwbhxmPmABbrFatKte9LuJthfTqyhr/hHjHnvPRoD5EuLXB2gxOB1qF00cLnIPXNInI48Z09D6utK9HXNLialU0w+sPeSKDKbJQZ+loY/SNVnGthmv11dVrbNH3XwvXiKRXSz5J8W2d9x6T4hHvQSSvJvI44FRDu1VnyCq5M9+pXA9HQjKD36d8Jw9b9otLKwbwTeW4WBOlrZ7PKQNbChlczz+hf/c747T4GECLQ8XSF1LVLaan/mGVCr6tQN9gPNcxrYrCycSWJgbv7ypvP/LtmIiUyMZyCb2g/o9F/ea/aXoMi4dfYcL1sJUNsUWJz1SRe/GPuj52GcFZfqLxLJi7bKNhVlp1uKvV31Z6b54K/r9jNAQpJbiYYxriiw6FPdtHGnlnOxHIifVeyHWuh55EgohO0NcOsJc8vzojGFhvJN9DEYm3oXbzBHV1gWTsyfd4WRy0DPOs04155hae6Ips+t+mjOhUaUrNPqLi9gV0FKC2H8sa+qkxcllf7NbmOG4dmQyes30LLAPrBQmP5FxTTsy+RIOXxdjhfB+8bRV2PdLRBJSthr4mh6EueXSVsds0OrNDVuvJb8nRvPf4ETdx0QChjGg0KCgI5MlSZBqraj
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(40470700004)(46966006)(36840700001)(6512007)(53546011)(478600001)(26005)(5660300002)(2616005)(41300700001)(82310400005)(6506007)(8936002)(40480700001)(356005)(2906002)(33656002)(70586007)(336012)(316002)(82740400003)(83380400001)(40460700003)(36860700001)(47076005)(186003)(81166007)(966005)(8676002)(6862004)(36756003)(54906003)(86362001)(70206006)(4326008)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 15:23:58.3103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 504c5049-85d0-4d05-44e6-08da591a38da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5972

DQoNCj4gT24gMjQgSnVuIDIwMjIsIGF0IDE4OjI1LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyNC8wNi8yMDIyIDE0OjM0LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDI0IEp1biAyMDIyLCBhdCAxMzoxNywgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+PiBJIHdvdWxkIGtlZXAgdGhlIHNlY3Rp
b24gYWJvdXQgY29tcGlsaW5nIGNwcGNoZWNrIHNpbmNlIG1hbnkgcmVjZW50IGRpc3RybyBkb2Vz
buKAmXQgcHJvdmlkZSBjcHBjaGVjayA+PTIuNyB5ZXQgKGFuZCAyLjggaXMgYnJva2VuKSwNCj4+
IElmIHlvdSBhZ3JlZSB3aXRoIGl0Lg0KPiANCj4gSXQgZGVwZW5kcyBvbiB0aGUgY29udGVudCBv
ZiB0aGUgc2VjdGlvbi4gSWYgdGhlIGNvbnRlbnQgZHVwbGljYXRlcyB0aGUgY3BwY2hlY2sgUkVB
RE1FIHRoZW4gbm8uIElmIHRoaXMgaXMganVzdCB0byBwb2ludCB0byB0aGUgY3BwY2hlY2sgUkVB
RE1FLCB0aGVuIEkgYW0gT0sgd2l0aCB0aGF0Lg0KPiANCg0KSGkgSnVsaWVuLA0KDQpTb3JyeSBm
b3IgdGhlIGxhdGUgcmVwbHksIHRoaXMgd291bGQgYmUgbXkgY2hhbmdlcywgd291bGQgeW91IGFn
cmVlIG9uIHRoZW0/DQoNCkNwcGNoZWNrIGZvciBYZW4gc3RhdGljIGFuZCBNSVNSQSBhbmFseXNp
cw0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQoNClhlbiBjYW4g
YmUgYW5hbHlzZWQgZm9yIGJvdGggc3RhdGljIGFuYWx5c2lzIHByb2JsZW1zIGFuZCBNSVNSQSB2
aW9sYXRpb24gdXNpbmcNCmNwcGNoZWNrLCB0aGUgb3BlbiBzb3VyY2UgdG9vbCBhbGxvd3MgdGhl
IGNyZWF0aW9uIG9mIGEgcmVwb3J0IHdpdGggYWxsIHRoZQ0KZmluZGluZ3MuIFhlbiBoYXMgaW50
cm9kdWNlZCB0aGUgc3VwcG9ydCBpbiB0aGUgTWFrZWZpbGUgc28gaXQncyB2ZXJ5IGVhc3kgdG8N
CnVzZSBhbmQgaW4gdGhpcyBkb2N1bWVudCB3ZSBjYW4gc2VlIGhvdy4NCg0KVGhlIG1pbmltdW0g
dmVyc2lvbiByZXF1aXJlZCBmb3IgY3BwY2hlY2sgaXMgMi43LiBOb3RlIHRoYXQgYXQgdGhlIHRp
bWUgb2YNCndyaXRpbmcgKEp1bmUgMjAyMiksIHRoZSB2ZXJzaW9uIDIuOCBpcyBrbm93biB0byBi
ZSBicm9rZW4gWzFdLg0KDQpJbnN0YWxsIGNwcGNoZWNrIG9uIHRoZSBzeXN0ZW0NCj09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KDQpDcHBjaGVjayBjYW4gYmUgcmV0cmlldmVkIGZyb20g
dGhlIGdpdGh1YiByZXBvc2l0b3J5IG9yIGJ5IGRvd25sb2FkaW5nIHRoZQ0KdGFyYmFsbCwgdGhl
IHZlcnNpb24gdGVzdGVkIHNvIGZhciBpcyB0aGUgMi43Og0KDQogLSBodHRwczovL2dpdGh1Yi5j
b20vZGFubWFyL2NwcGNoZWNrL3RyZWUvMi43DQogLSBodHRwczovL2dpdGh1Yi5jb20vZGFubWFy
L2NwcGNoZWNrL2FyY2hpdmUvMi43LnRhci5neg0KDQpUbyBjb21waWxlIGFuZCBpbnN0YWxsIGl0
LCB0aGUgY29tcGxldGUgY29tbWFuZCBsaW5lIGNhbiBiZSBmb3VuZCBpbiByZWFkbWUubWQsDQpz
ZWN0aW9uICJHTlUgbWFrZSIsIHBsZWFzZSBhZGQgdGhlICJpbnN0YWxsIiB0YXJnZXQgdG8gdGhh
dCBsaW5lIGFuZCB1c2UgZXZlcnkNCmFyZ3VtZW50IGFzIGl0IGlzIGluIHRoZSBkb2N1bWVudGF0
aW9uIG9mIHRoZSB0b29sLCBzbyB0aGF0IGV2ZXJ5IFhlbiBkZXZlbG9wZXINCmZvbGxvd2luZyB0
aGlzIHBhZ2UgY2FuIHJlcHJvZHVjZSB0aGUgc2FtZSBmaW5kaW5ncy4NCg0KVGhpcyB3aWxsIGNv
bXBpbGUgYW5kIGluc3RhbGwgY3BwY2hlY2sgaW4gL3Vzci9iaW4gYW5kIGFsbCB0aGUgY3BwY2hl
Y2sgY29uZmlnDQpmaWxlcyBhbmQgYWRkb25zIHdpbGwgYmUgaW5zdGFsbGVkIGluIC91c3Ivc2hh
cmUvY3BwY2hlY2sgZm9sZGVyLCBwbGVhc2UgbW9kaWZ5DQp0aGF0IHBhdGggaW4gRklMRVNESVIg
YW5kIENGR0RJUiBpZiBpdCdzIG5vdCBjb252aW5pZW50IGZvciB5b3VyIHN5c3RlbS4NCg0KSWYg
eW91IGRvbid0IHdhbnQgdG8gb3ZlcndyaXRlIGEgcG9zc2libGUgY3BwY2hlY2sgYmluYXJ5IGlu
c3RhbGxlZCBpbiB5b3VyDQpzeXN0ZW0sIHlvdSBjYW4gb21pdCB0aGUgImluc3RhbGwiIHRhcmdl
dCwgRklMRVNESVIsIENGR0RJUiBhbmQgY3BwY2hlY2sgd2lsbCBiZQ0KanVzdCBjb21waWxlZCBh
bmQgdGhlIGJpbmFyaWVzIHdpbGwgYmUgYXZhaWxhYmxlIGluIHRoZSBzYW1lIGZvbGRlci4NCklm
IHlvdSBjaG9vc2UgdG8gZG8gdGhhdCwgbGF0ZXIgaW4gdGhpcyBwYWdlIGl0J3MgZXhwbGFpbmVk
IGhvdyB0byB1c2UgYSBsb2NhbA0KaW5zdGFsbGF0aW9uIG9mIGNwcGNoZWNrIGZvciB0aGUgWGVu
IGFuYWx5c2lzLg0KDQpEZXBlbmRlbmNpZXMgYXJlIGxpc3RlZCBpbiB0aGUgcmVhZG1lLm1kIG9m
IHRoZSBwcm9qZWN0IHJlcG9zaXRvcnkuDQoNClsgbGVhdmluZyBVc2UgY3BwY2hlY2sgdG8gYW5h
bHlzZSBYZW4gYXMgaXQgaXMgXQ0KW+KApl0NCg0KWzFdIGh0dHBzOi8vc291cmNlZm9yZ2UubmV0
L3AvY3BwY2hlY2svZGlzY3Vzc2lvbi9nZW5lcmFsL3RocmVhZC9iZmMzYWI2YzQxLz9saW1pdD0y
NQ0KDQoNCkNoZWVycywNCkx1Y2ENCg0K

