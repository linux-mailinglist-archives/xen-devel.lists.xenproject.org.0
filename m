Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0217DF104
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 12:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626857.977509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVfy-0004gb-TJ; Thu, 02 Nov 2023 11:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626857.977509; Thu, 02 Nov 2023 11:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVfy-0004eI-QY; Thu, 02 Nov 2023 11:15:50 +0000
Received: by outflank-mailman (input) for mailman id 626857;
 Thu, 02 Nov 2023 11:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wS6e=GP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qyVfx-0004eC-Pb
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 11:15:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ac339e5-7971-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 12:15:45 +0100 (CET)
Received: from AM0PR04CA0143.eurprd04.prod.outlook.com (2603:10a6:208:55::48)
 by PAVPR08MB9649.eurprd08.prod.outlook.com (2603:10a6:102:310::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 11:15:42 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:208:55:cafe::6b) by AM0PR04CA0143.outlook.office365.com
 (2603:10a6:208:55::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21 via Frontend
 Transport; Thu, 2 Nov 2023 11:15:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 11:15:40 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Thu, 02 Nov 2023 11:15:40 +0000
Received: from 8dc625f13b2f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E31F48B7-6DF8-4CBA-AE79-6DDF4542E0C1.1; 
 Thu, 02 Nov 2023 11:15:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8dc625f13b2f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Nov 2023 11:15:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7392.eurprd08.prod.outlook.com (2603:10a6:10:353::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 11:15:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 11:15:26 +0000
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
X-Inumbo-ID: 2ac339e5-7971-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WhiEiM9AMZcHpVRobSGz+fhkfF/8QR2nlIlPdslEXK/OKTIruNaKTtFV6cK0UeY03MQEEpVUVNzSqgd8eY9krwVpbm3GFTZj1igdx12GZRyNBe97IQ0Ga7G3gn8ZKTT2f/NXwue+KYAzK49by0JQO6Q95tt8uSgHKiqDIVi8Ku+VsOM33Moq6+egGJpIPpsGzyez7NEQgGXs7PhjvoqsY9CCKACDMVRszuDWnOD8muPBsOMaSFZXdcy1C7VgpySJP2bVSFzyGBe9J6HH6KzDCjyRsRywuql9Na4YC83duDn5f5gQPTiN/caWwUqsp03o1oe3xGAIIqITZ0nSvtDJPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij4llLYRvzJoeeCMyPmnoP//UnQFLv2i3Iz6lGsUXlk=;
 b=BeAk1I+RAPMc+1GO19W9KSXIUS48J1nK6fFAVorb2FPgNT/ofnCaTmKtqxpBVrcqxQ1lY3Kag42Cn6R7RTOTeWr3Y+gy9hnlwq29kL+fuMfSP66I33kr6929RuuskM0CyP79XyhaUFV/Vhn5US8In/BKZD7UZ668t0WimcsOxfS06fpux/YVn9SivBG6SZMoXD140ZgMTR7pdMreQF0rdIc1YaW9j/Ow2NjUMP4zldqx9AbzEwQidm3JoQTBsfgyCXLaRm4ZGXHGSur5pJd3l/rvocvEpgPKJS/GfsIcJR4tegvlDJMeXZc7k7urhTvmFPI7z1uG0BSj4ZOP4bmaIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij4llLYRvzJoeeCMyPmnoP//UnQFLv2i3Iz6lGsUXlk=;
 b=KbKMgJsSqKMt7WJt3O+o2K2q7Sah8gjc0Am088ynogaMED0hZv8o9ultZjOetQnAwI/l6JoVqCkRDUh2Nuynn+jHbYE1kvP+sLw5PM5IFX4LLnJWNiMd+7xlKWBajTuFkaAHxzVzoiIFgsBbjmP6Bed+gA5f+X0B9s/pkVHScEI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87e44249aaf424df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwbEhRITkqfMglOI34NsHtancemB0pI31mNasDBfreyll578OlZWz/8oHLsvFxq1WEHWVtStaFSGW9kDk6pLwOyHtkMsXMuUrWA50VzjHkhMBKdeDagxky95xv7/RGJPYt1klkiwjIcH2hTTP6VTiS7AvqeH8kP16zASbSVgBnkwmH5qtq5gSJ6/OZp90mTafXAxMUKtCzIrWsm1flh2PaOhO+MK6TTZXtMnb7LkaIIvh0S117kUruhNsYXhZ1dy7dsY/yEAseWRLpUD5LKzqGT/D7q7WpeJDmUkcITT+PyrBdsoAoPXG2Nut7rOquJdnGWAL1Nk82e8CG3TgmAskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij4llLYRvzJoeeCMyPmnoP//UnQFLv2i3Iz6lGsUXlk=;
 b=EXvDUN2nBtUjwEBFVARWibhTY8n0ifvTcYYs1QW5NdYdQGmzMfftZDIThH8RO+akcrwumC5defEUbLaZfSlm1TQL/PYH5cpG8vJmiYidBupsIfVAb/uNLVhFB1C7vZTmEILqazxupwcXtpG9Xhcm0U3XhyeRJwskuAZgbX0ytlacHVAm/05UQnwi1a7HLwIR8W6FVA497TuqxGO6+Vyx+1AbOrsLks1P8rxURfCA/3ZUd80rS+Ated4Nv8MvQaH5ImQjFetyq6UIN3UDNANywREezdILODV5pEDsSgIW6cfNlv6Um7w6NPJhQ/j946613MdjUn4ZS3CQY3BhPmxjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij4llLYRvzJoeeCMyPmnoP//UnQFLv2i3Iz6lGsUXlk=;
 b=KbKMgJsSqKMt7WJt3O+o2K2q7Sah8gjc0Am088ynogaMED0hZv8o9ultZjOetQnAwI/l6JoVqCkRDUh2Nuynn+jHbYE1kvP+sLw5PM5IFX4LLnJWNiMd+7xlKWBajTuFkaAHxzVzoiIFgsBbjmP6Bed+gA5f+X0B9s/pkVHScEI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHZ8UtNgBNI2koBH0+cEATmTDiuOrBmBjGAgAES7gA=
Date: Thu, 2 Nov 2023 11:15:26 +0000
Message-ID: <00D15160-A5C1-4A42-A11E-9A9282676653@arm.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
 <20230927140133.631192-4-luca.fancellu@arm.com>
 <ac71e580-3d81-4024-b19c-d3d954df5948@xen.org>
In-Reply-To: <ac71e580-3d81-4024-b19c-d3d954df5948@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7392:EE_|AMS0EPF000001A7:EE_|PAVPR08MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: db2107a9-9d0e-4cfc-1cb3-08dbdb950c88
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8TXN/MUu+1dv5F61a7pRHX/tF5hfO5VUYP8zI6yt1rwMNqEP9q//sZW88oEAOHRYoqqocPPQc1merYpWiGmokU+O6JFBQ9EbdehoXjB9dAwWcCCS7Fqmb7X8IXWY0+A94MzWKBGyrzWDhwFrqaHe2TG/XWga3MsHOABnj8UI8g86dA8mBWoIK8BUeuU/KMUVt+QRJhDEAecPVOCZ2cWckOX5ocNj7orRfloQCJG5Zz2ZshKJjtMZID6oR31T+aCYi8HPz0vnSUa6PM3U/FqHIYHRtt8qLsS7KPZcGg8pctTpl2U5ESmXVVGUdNtEz5l+dtnLSDI5XGeb7R3JQDEdaOun+fZFfzKxygB0cq34MRxWAAHwHgeUw5uQuws5KFgQgpRIPMNDkhg6Cc478eR2kYquv2x60M6cOu773HIRprSEHG7Wmi15sO9NjmEsGYGRhWuJeFsew7v6GubCKyKEK9gy/ymb6IsEgBdg9+JAtdgpCjZtrhBXWjhxp3A3qiAEMwLdyY1hgE6isaFVFpDE0H63dK3m6GvNHCJm6fsHgGzL8LFe8B0CpTrX41XRv6D5kmTVE1oFbGG1Z6C/P+BrB0S2yKnoIyBXLCHK18Y1ME30XUwnohd0UMVe4aDmyKk4qhoHjfUXo/0A+F8D8GpnO99dxWpsNX7euuUAwH6r3qc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(8676002)(8936002)(4326008)(91956017)(54906003)(64756008)(66446008)(66476007)(76116006)(66946007)(6916009)(66556008)(316002)(5660300002)(2906002)(122000001)(83380400001)(6486002)(478600001)(41300700001)(26005)(86362001)(6506007)(71200400001)(2616005)(33656002)(36756003)(6512007)(38100700002)(38070700009)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78A3CCAD2393444F8FA5A115837A750A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7392
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3154e6d9-c714-44b9-4c3a-08dbdb9503dc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AOQbAgCI+ePonP9gl6EAOnvwAdnL9MZoTUjpB694v8ol4mBmlP1L8F+ZpenpS6OsJjDbnpahKd2rU2/g6sHyxNgEoE46PGqfcezJBztGEdim//M6P3PhtjXe44p3vr4s4fbRENjqWleSe7kurDCUHq5aK/+4y/iK88NRHPBdb3t2JfFY6AiCh46t68M7sHQ8VMtHa27AwdoCvKKdD6K35mMiyiut/0eggAlmT6PsSZW3c76tSp6LboHI+Jep2rptX+OSDIQqr0LYV/zBE1qweLGHpG9KPYl0c0T2W1IDafpz0B2vtnlx6IaZysn/JNRGbjbXpVpYRqmi1jmuIeTnM9R2J3GNJWTQfwWZpcXf9TQfmiddib0pDSG2SdwbFVAMINglt4xrH0+nzpv1Fk4dGUrX+Gyr3J90PPUtW68E6npqkMZAFziE6AzKFAnbds6Of7cAuquoMiOGLZkE6GH+yE5sHf1/pl86pg1wNkT1yp6m2x689ODJWJcr+R86GUE1ksOFQVZR+bvxR/wcDiw84zVQI1M82wp4H3U/3/fAGgHO3nkCt+dqAKshxaqPoRVB5cffiubLtBGJdlbLZbwYbEuk56CGuSsGwUY9Emm7/6kKHAOGiqr1Mq6WotEcqlbzveTBf5gl32v9dSy4f24nvB3mXBAz+aZX7rlRVq2i9Q1TQ/6uSfXJvGrBP9sK8JBXbtx1BDf5h3LNJtwMUJcYoW5LsZvN6u4nEgld0GTY6Er5mPYLi5N2pqAmpjwfABwKT9MdbqeNDFJ7KqBlgNUgYg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(46966006)(36840700001)(40470700004)(40460700003)(6862004)(4326008)(8676002)(8936002)(54906003)(316002)(40480700001)(70586007)(70206006)(2906002)(33656002)(41300700001)(5660300002)(86362001)(336012)(83380400001)(356005)(47076005)(81166007)(26005)(82740400003)(2616005)(107886003)(36860700001)(36756003)(478600001)(6506007)(6486002)(6512007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 11:15:40.9289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db2107a9-9d0e-4cfc-1cb3-08dbdb950c88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9649


Hi Julien,

>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build=
.c
>> new file mode 100644
>> index 000000000000..dc9c90cf00a7
>> --- /dev/null
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -0,0 +1,1087 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * xen/arch/arm/dom0less-build.c
>> + *
>> + * Code related to the dom0less functionality
>> + *
>> + * Copyright (C) 2023 Arm Ltd.
>=20
> This feels a bit odd to add your copyright here. It sounds like Arm wrote=
 all the code, but you only moved. That said, I am not a lawyer.

Mmm yes, we should be required to put our copyright in everything we create=
 or modify or touch,
said that, I could modify that to be like this:

/*
 * xen/arch/arm/dom0less-build.c=20
 *
 * Code related to the dom0less functionality
 *
 * Original code from xen/arch/arm/domain_build.c
 * Modifications: Copyright (C) 2023 Arm Ltd.
 */

What do you think?

>=20
>> + */
>> +
>> +#include <xen/device_tree.h>
>> +#include <xen/err.h>
>> +#include <xen/event.h>
>> +#include <xen/grant_table.h>
>> +#include <xen/iocap.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/sched.h>
>> +#include <xen/serial.h>
>> +#include <xen/sizes.h>
>> +#include <xen/vmap.h>
>> +
>> +#include <asm/arm64/sve.h>
>> +#include <asm/dom0less-build.h>
>> +#include <asm/domain_build.h>
>> +
>> +bool __init is_dom0less_mode(void)
>> +{
>> +    struct bootmodules *mods =3D &bootinfo.modules;
>> +    struct bootmodule *mod;
>> +    unsigned int i;
>> +    bool dom0found =3D false;
>> +    bool domUfound =3D false;
>> +
>> +    /* Look into the bootmodules */
>> +    for ( i =3D 0 ; i < mods->nr_mods ; i++ )
>> +    {
>> +        mod =3D &mods->module[i];
>> +        /* Find if dom0 and domU kernels are present */
>> +        if ( mod->kind =3D=3D BOOTMOD_KERNEL )
>> +        {
>> +            if ( mod->domU =3D=3D false )
>> +            {
>> +                dom0found =3D true;
>> +                break;
>> +            }
>> +            else
>> +                domUfound =3D true;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * If there is no dom0 kernel but at least one domU, then we are in
>> +     * dom0less mode
>> +     */
>> +    return ( !dom0found && domUfound );
>> +}
>> +
>> +static bool __init allocate_bank_memory(struct domain *d,
>> +                                        struct kernel_info *kinfo,
>> +                                        gfn_t sgfn,
>> +                                        paddr_t tot_size)
>=20
> I understand that this is today only used by domUs. However, we could tec=
hnically use it for allocating dom0 memory if it is not 1:1.
>=20
> So I think this function should stay in domain_build.c.

Ok I can leave it there, is it ok for you if I protect it using the KConfig=
 in domain_build.c since that code is currently not used apart from dom0les=
s?
(I will do that in the last patch if you agree)

>=20
> The rest of the code movement looks alright to me.
>=20
> Cheers,
>=20
> --=20
> Julien Grall


