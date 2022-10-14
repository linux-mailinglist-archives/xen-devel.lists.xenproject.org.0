Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092E15FED22
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 13:20:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422796.669072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIjF-0000re-2O; Fri, 14 Oct 2022 11:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422796.669072; Fri, 14 Oct 2022 11:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIjE-0000pg-UY; Fri, 14 Oct 2022 11:19:48 +0000
Received: by outflank-mailman (input) for mailman id 422796;
 Fri, 14 Oct 2022 11:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojIjD-0000pa-Qx
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 11:19:47 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20086.outbound.protection.outlook.com [40.107.2.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b57c6ba-4bb2-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 13:19:45 +0200 (CEST)
Received: from AS9P250CA0009.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::18)
 by AS8PR08MB9119.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 11:19:39 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::a2) by AS9P250CA0009.outlook.office365.com
 (2603:10a6:20b:532::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Fri, 14 Oct 2022 11:19:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 14 Oct 2022 11:19:39 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 14 Oct 2022 11:19:39 +0000
Received: from ed5cc8a2ff1c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3C2B00A2-8B63-4F35-86F5-332C17DDC97F.1; 
 Fri, 14 Oct 2022 11:19:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed5cc8a2ff1c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 11:19:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6239.eurprd08.prod.outlook.com (2603:10a6:102:ef::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 11:19:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 11:19:31 +0000
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
X-Inumbo-ID: 1b57c6ba-4bb2-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bUbA4VRLYaUMdCuev2kIgYvjoAe24wWFzinxQGSKE5o+vtnhlM2UlDbydns0wQEaEoaMpybS53gi749IxbXkSd+WF04DebA9Ch9otpUCFlmKXUwScYHnDYwrDwM9IUMp9RjGHCF3V5fS1BdtohhDcG88/yCUYVcUcHk2aApcCmd3XHjRNH3ime4r9Smw0s+WcNBE9X+3LBqQplMym3mSNvVJ9UBoaHsLsqVHGn3eGztoOFoD0qguTiVXxVOaL5coUNDATYv6fmIo/oCwy9cTkmPXHkPJMJoSJf2RfDMZnMjjo/AYZFpAa5ABreAquoathwOLtjMqh/UL4yaYIt+0wQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKeH86N2pPjp35fhhl/nBPKsW6jJKRt2H1dEOdWCLaM=;
 b=YlQAe6420+HWKXbPp8HY7TwczGK/6lxFECD4Zya7k60ZcmxM+/yKO/1TX0MzG/s46KpiX7GClmWHOUGbHX85X2AzCg2TinxrDjV8yCGkAHA+7ktajODHZfgvC0/VcWL14eucKD3lNMv1zYZTmiFieCoCJpQCKRSwAnPUtU4vlYa4HTWfXMUQewt4W5E1Er7vK/03sMkqYFn3oRdf8ZW9w7SlCEWZGsY1qvP3OsP3mJ5/Tsiuo74kuijjZaAMDnn5l903bFSovW43BnGS41sBr3/qdoomGVy3UzCVEm2seYQjLxPW7WegJgQMzC2abBGSEQ3UGpC7MFmWMTxHK/oi1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKeH86N2pPjp35fhhl/nBPKsW6jJKRt2H1dEOdWCLaM=;
 b=quTWPgrCGhvazWSNbUcHt+Mp9pwaQnVe0I5YiCZyuzZnO9g6cUIIOirl7Oa9Xg3qlYBBTeGEbf1SD/2QUHW4CtsedaQcG4FX0iQ1kbsrIWGUPvVBCWUi/bleec8Iw/hhHJvxvUm8pkdXxsKvymn7TSroXVFbBksrYn8gdmg5sP8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYR1CNtoq3osnDAwwDEpfxQQGdZ+E4SVpg7iI71Kin2OnU2yUTEZbjbwtIBBaACncJO9yA8CAQh050nPCDzOd3Nt+ms6j/6FbcBoi2Kpb9GNjN7R9ZFrfhUW1wY5dTxkF+LWcvllsX3f+C+2t02I8wAkVscRrYI0eoufdRNLQ7XtPHny4i2BsfuWoZShNZSXxYQRKEalevYNuDQMchibVGRpCZFXXWBS3Ml5wNOtBmWZ8c8yyelljsqHSY6Yl7BWTBptDsbf+HJ/q/ymxn3PZGHwRSbWP07DBZVa2/Dm+oJUVYovUGS00T7VT7jSW8SW7Z7xWBs7FzN5oDA/pEFECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKeH86N2pPjp35fhhl/nBPKsW6jJKRt2H1dEOdWCLaM=;
 b=K1wtFNkKo0Pg6SwypyJQyXLYjfdnK9WQ5i3V3qiJNHbb8Q1iXNvA9ScPH7SbEAX6kZxnJOE1l951ETBVkJ+4bwqamKQXorp9QoyBVj3hBkYv9aZCdDw7rIpvb5DhiBbJnF453mfouvNf4BaEZ4j9UEMQuZ4GLIlmL/9dIxdDUSdYl2IZkhPfzzMiyLl2bt27qlvum16VTd/Bcdy49UIIugH9obwUX9nic+BZgNX9NNS5C1DU2droQ3zrNetev+AiwzcQ7alzcMLLP8cmP1blP8MsRPKb00wNJohD2ulREUWab944uPYxjGVaS5Z/4Upz+JZT7ezu20CxfzF0/t9pqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKeH86N2pPjp35fhhl/nBPKsW6jJKRt2H1dEOdWCLaM=;
 b=quTWPgrCGhvazWSNbUcHt+Mp9pwaQnVe0I5YiCZyuzZnO9g6cUIIOirl7Oa9Xg3qlYBBTeGEbf1SD/2QUHW4CtsedaQcG4FX0iQ1kbsrIWGUPvVBCWUi/bleec8Iw/hhHJvxvUm8pkdXxsKvymn7TSroXVFbBksrYn8gdmg5sP8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY36RSrOIThkYtnEq9RrtWc+uYX64NsO2AgAACdYA=
Date: Fri, 14 Oct 2022 11:19:31 +0000
Message-ID:
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
In-Reply-To: <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7ECF97F8DFD8F64A88FB34C0BC660E96.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6239:EE_|AM7EUR03FT031:EE_|AS8PR08MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b433eb-bafb-4da1-f312-08daadd5fc00
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u8Nl8QtlIuCyAWqqU7hcTbod7Bt0MNfGT4fC1+M846GDGuJMSWkh/HLoyJAD1ChB/UuOZ/9+hqLY+s29xe6TJUWbQ8QhVCaVYYoAhJ1mFJCUYXKBxVCJfi9W6Gm539sZw/afglj1d1MeDhR0AN/9Sb/n4hvpPOWEgWygP+YaoJ+ke+9EnNYUrRf/WpGMgrCykuIrG6v084Tgp0SYfIX50G/TLAZP59THViQR8L0Buxb8MK1tVMvGUh4ULUFQ7n9+V+mWutlxn0W9vYYdSHi5VdJjZePNd/pm8fUm5gFN6YvoVPVsTO+0MKKbUkK/q2NxLRE1uhNDCDYnCcwSEg8b0bL6zoVtwkl0zgYFVTbCRWTgJK78aaPjkpi/8984q2Eo7JEG50HVXexKpGcLCGmDd7uB3kKeYxSYwQVv5TyHwCqKMaog+HPZVEENdvE8zHnjd+lgj7ci3wjqO2WTAQq3RJjY6UL51Lm9ATpNRkbj2iFDCsCMQK5opfw/Nr3VDH0VoF/jNI4RNTkH42/+OoxsjW9cEzgdK+eY/HP5dHolSSug5TmYyrcVvFghj275IrLDjqummZ5cyDuMy9nGAqWlAoNZOhjiPpKb0XQhXewPmQW4g3jSfzcFoiQL0QS8j1JF8No+UDoG82GnCbxNrhjna+/YcPQpiWZSaIRg8HVwvwGQeRVWByfyWFbZBm8Q/LaYvflLV6uAZFeXXSPruAHm8/uysQH0f+qLEmJMyuByVLyJgcLGku4AoEV3rCkwtj+cRLQm5U2B+Slitw2Zdfyaug==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199015)(38100700002)(52536014)(5660300002)(2906002)(41300700001)(38070700005)(122000001)(4326008)(8676002)(66446008)(55016003)(66556008)(76116006)(66946007)(86362001)(186003)(66476007)(316002)(33656002)(64756008)(478600001)(8936002)(9686003)(6506007)(71200400001)(7696005)(83380400001)(26005)(110136005)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6239
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3b49dee-1bd8-460c-39dd-08daadd5f766
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GhoYNRHfSDfMZErI9g/kOCv+LotqgTSY4qMvZAB84P3oNAHXi00GamSnblodUweCjwC6nMGMc+77veDVq3dqQaNcDyHGfwNwZQer93wkE2FDqFYCvpEOjx1v+NbJ1hlKNfuVOG3bvve7e+H+ECogbZ6QXJaLl0tvdTX39nAKSU49YaIMgxMLdcN/KBRsYY0lG97+ZS6k74X/endoB+O7vAuxQQzgH75kcmEXHzmusuedwy4SRG1vJiDcOJr+5Va/2oOcKvVlOfYGZ4sgj0Q5Ce3VrsfN4uO7NbGPjyNHsSp+iG5cBe5o1w2s6J07XPInivfUGYfQzxdtRIuYAxLAjiOIrqNY6W22cCx5SpU1/ABxWUeg+EqFsenrmDGk0PU3ue5CUjb49cuLHvs84AfC3MOPZJyErFagoz1uBXBoz01g6AjS96tSLUtDItQkI2tJCRAa0zK8NfZFPh1RovjJY6QkjhcAdCI5t8QVFuIuVvuYF+XlfXEgRgjKHSqTferUx98RaVzfyzOEkRLzk4l7pVWZRBp6QTrmVQglGQaEaMYl39vZ2BK2RrSLc8ItNMEUEMdHhw6y4mUfwdGoIFneBm2bGb62MWzh/1au3fhomwymC9RoQCQdMfjOKjmorCeDTKDFl/cBq5kfIpW89x6YBYbv2Uy1rno1aC65OupXViELb17Mn5peG4FHElKWDrl/x8p4djMo85KWg5EFxPRsCHYDr7Usq3/t7FpBXb7tn2aKpeA/GJHD60vWtVe6MOOp0l1CAKP8DREfURd/NW+NRA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(336012)(47076005)(83380400001)(186003)(26005)(52536014)(8936002)(5660300002)(33656002)(2906002)(40460700003)(40480700001)(55016003)(86362001)(36860700001)(81166007)(107886003)(82740400003)(316002)(82310400005)(110136005)(7696005)(8676002)(4326008)(9686003)(54906003)(70586007)(478600001)(6506007)(70206006)(41300700001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 11:19:39.3437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b433eb-bafb-4da1-f312-08daadd5fc00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9119

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHhl
bi9hcm06IHAybTogUG9wdWxhdGUgcGFnZXMgZm9yIEdJQ3YyIG1hcHBpbmcgaW4NCj4gYXJjaF9k
b21haW5fY3JlYXRlKCkNCj4gDQo+IEhpIEhlbnJ5LA0KPiANCj4gPg0KPiA+IC1pbnQgcDJtX3Rl
YXJkb3duKHN0cnVjdCBkb21haW4gKmQpDQo+ID4gK2ludCBwMm1fdGVhcmRvd24oc3RydWN0IGRv
bWFpbiAqZCwgYm9vbCBhbGxvd19wcmVlbXB0aW9uKQ0KPiA+ICAgew0KPiBJIHRoaW5rIHRoZSBw
YXJ0IHRvIGNsZWFuICYgaW52YWxpZGF0ZSB0aGUgcm9vdCBzaG91bGQgbm90IGJlIG5lY2Vzc2Fy
eQ0KPiBpZiB0aGUgZG9tYWluIGlzIG5vdCBzY2hlZHVsZWQuIFNpbWlsYXJseSwgSSB0aGluayB3
ZSBtaWdodCBvbmx5IG5lZWQgdG8NCj4gZG8gb25jZSBieSBkb21haW4gKHJhdGhlciB0aGFuIGZv
ciBldmVyeSBjYWxsKS4gU28gSSB3b3VsZCBjb25zaWRlciB0bw0KPiBtb3ZlIHRoZSBsb2dpYyBv
dXRzaWRlIG9mIHRoZSBmdW5jdGlvbi4NCj4gDQo+IFRoYXQncyBub3QgZm9yIDQuMTcgdGhvdWdo
dC4NCg0KU3VyZSwgSSBjYW4gcHJlcGFyZSB0aGUgZm9sbG93IHVwIHBhdGNoIGFmdGVyIDQuMTcg
YXMgKDEpIEkgYW0gYWxzbyB3b3JyaWVkDQphYm91dCBpZiB0aGlzIHBhdGNoIHdvdWxkIGJlY29t
ZSBiaWdnZXIgYW5kIGJpZ2dlciAoMikgSSBjaGVja2VkIHlvdSBhbHNvDQp3YW50IG90aGVyIHRo
aW5ncyBpbiB5b3VyIGJlbG93IGNvbW1lbnQuDQoNCj4gDQo+ID4gICAgICAgc3RydWN0IHAybV9k
b21haW4gKnAybSA9IHAybV9nZXRfaG9zdHAybShkKTsNCj4gPiAgICAgICB1bnNpZ25lZCBsb25n
IGNvdW50ID0gMDsNCj4gPiBAQCAtMTcxNiw3ICsxNzE2LDcgQEAgaW50IHAybV90ZWFyZG93bihz
dHJ1Y3QgZG9tYWluICpkKQ0KPiA+ICAgICAgICAgICBwMm1fZnJlZV9wYWdlKHAybS0+ZG9tYWlu
LCBwZyk7DQo+ID4gICAgICAgICAgIGNvdW50Kys7DQo+ID4gICAgICAgICAgIC8qIEFyYml0cmFy
aWx5IHByZWVtcHQgZXZlcnkgNTEyIGl0ZXJhdGlvbnMgKi8NCj4gPiAtICAgICAgICBpZiAoICEo
Y291bnQgJSA1MTIpICYmIGh5cGVyY2FsbF9wcmVlbXB0X2NoZWNrKCkgKQ0KPiA+ICsgICAgICAg
IGlmICggYWxsb3dfcHJlZW1wdGlvbiAmJiAhKGNvdW50ICUgNTEyKSAmJg0KPiBoeXBlcmNhbGxf
cHJlZW1wdF9jaGVjaygpICkNCj4gPiAgICAgICAgICAgew0KPiA+ICAgICAgICAgICAgICAgcmMg
PSAtRVJFU1RBUlQ7DQo+ID4gICAgICAgICAgICAgICBicmVhazsNCj4gPiBAQCAtMTczNiw2ICsx
NzM2LDE3IEBAIHZvaWQgcDJtX2ZpbmFsX3RlYXJkb3duKHN0cnVjdCBkb21haW4gKmQpDQo+ID4g
ICAgICAgaWYgKCAhcDJtLT5kb21haW4gKQ0KPiA+ICAgICAgICAgICByZXR1cm47DQo+ID4NCj4g
PiArICAgIGlmICggIXBhZ2VfbGlzdF9lbXB0eSgmcDJtLT5wYWdlcykgKQ0KPiANCj4gRGlkIHlv
dSBhZGQgdGhpcyBjaGVjayB0byBhdm9pZCB0aGUgY2xlYW4gJiBpbnZhbGlkYXRlIGlmIHRoZSBs
aXN0IGlzIGVtcHR5Pw0KDQpZZXAuIEkgdGhpbmsgd2Ugb25seSBuZWVkIHRoZSBwMm1fdGVhcmRv
d24oKSBpZiB3ZSBhY3R1YWxseSBoYXZlIHNvbWV0aGluZw0KaW4gcDJtLT5wYWdlcyBsaXN0Lg0K
DQo+IA0KPiA+ICsgICAgICAgIHAybV90ZWFyZG93bihkLCBmYWxzZSk7DQo+IA0KPiBUb2RheSwg
aXQgc2hvdWxkIGJlIGZpbmUgdG8gaWdub3JlIHAybV90ZWFyZG93bigpLiBCdXQgSSB3b3VsZCBw
cmVmZXIgaWYNCj4gd2UgYWRkIGFuIEFTU0VSVCgpL0JVR19PTigpIChvciBlbHNlKSB0byBtYWtl
IGNvbmZpcm0gdGhpcyBpcyB0aGUgY2FzZS4NCg0KU29ycnkgSSBkbyBub3QgcmVhbGx5IHVuZGVy
c3RhbmQgd2h5IHdlIGNhbiBpZ25vcmUgdGhlIHAybV90ZWFyZG93bigpDQpwcm9iYWJseSBiZWNh
dXNlIG9mIG15IEVuZ2xpc2guIExldCdzIHRhbGsgYSBiaXQgbW9yZSBpbiBDIGlmIHlvdSBkb24n
dCBtaW5kIDopKQ0KRG8geW91IG1lYW4gcDJtX3RlYXJkb3duKCkgc2hvdWxkIGJlIGNhbGxlZCBo
ZXJlIHVuY29uZGl0aW9uYWxseSB3aXRob3V0DQp0aGUgaWYgKCAhcGFnZV9saXN0X2VtcHR5KCZw
Mm0tPnBhZ2VzKSApIGNoZWNrPw0KDQo+IA0KPiBUaGlzIGFsc28gd2FudHMgdG8gYmUgZG9jdW1l
bnRlZCBvbiB0b3Agb2YgcDJtX3RlYXJkb3duKCkgYXMgaXQgd291bGQgYmUNCj4gZWFzaWVyIHRv
IGtub3cgdGhhdCB0aGUgZnVuY3Rpb24gc2hvdWxkIGFsd2F5cyByZXR1cm4gMCB3aGVuDQo+ICFh
bGxvd19wcmVlbXB0aW9uIGlzIG5vdCBzZXQuDQoNCk9rLCB3aWxsIGRvLg0KDQo+IA0KPiBJIGFs
c28gbm90aWNlZCB0aGF0IHJlbGlucXVpc2hfcDJtX21hcHBpbmcoKSBpcyBub3QgY2FsbGVkLiBU
aGlzIHNob3VsZA0KPiBiZSBmaW5lIGZvciB1cyBiZWNhdXNlIGFyY2hfZG9tYWluX2NyZWF0ZSgp
IHNob3VsZCBuZXZlciBjcmVhdGUgYQ0KPiBtYXBwaW5nIHRoYXQgcmVxdWlyZXMgcDJtX3B1dF9s
M19wYWdlKCkgdG8gYmUgY2FsbGVkLg0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBnb29kIHRv
IGNoZWNrIGl0IGluIF9fcDJtX3NldF9lbnRyeSgpLiBTbyB3ZSBkb24ndA0KPiBlbmQgdXAgdG8g
YWRkIHN1Y2ggbWFwcGluZ3MgYnkgbWlzdGFrZS4NCg0KSSB0aG91Z2h0IGZvciBhIHdoaWxlIGJ1
dCBmYWlsZWQgdG8gdHJhbnNsYXRlIHRoZSBhYm92ZSByZXF1aXJlbWVudHMNCnRvIHByb3BlciBp
ZiBjb25kaXRpb25zIGluIF9fcDJtX3NldF9lbnRyeSgpLi4uDQoNCj4gDQo+IEkgd291bGQgaGF2
ZSBzdWdnZXN0ZWQgdG8gYWRkIGEgY29tbWVudCBvbmx5IGZvciB2ZXJzaW9uIGFuZCBzZW5kIGEN
Cj4gZm9sbG93LXVwIHBhdGNoLiBCdXQgSSBkb24ndCBleGFjdGx5IGtub3cgd2hlcmUgdG8gcHV0
IGl0Lg0KDQouLi5ob3cgYWJvdXQgcDJtX2ZpbmFsX3RlYXJkb3duKCksIHdlIGNhbiB1c2UgYSBU
T0RPIHRvIGV4cGxhaW4gd2h5DQp3ZSBkb24ndCBuZWVkIHRvIGNhbGwgcmVsaW5xdWlzaF9wMm1f
bWFwcGluZygpIGFuZCBhIGZvbGxvd2luZyBwYXRjaA0KY2FuIGZpeCB0aGlzPw0KDQo+IA0KPiA+
ICsNCj4gPiArICAgIGlmICggZC0+YXJjaC5wYWdpbmcucDJtX3RvdGFsX3BhZ2VzICE9IDAgKQ0K
PiA+ICsgICAgew0KPiA+ICsgICAgICAgIHNwaW5fbG9jaygmZC0+YXJjaC5wYWdpbmcubG9jayk7
DQo+ID4gKyAgICAgICAgcDJtX3NldF9hbGxvY2F0aW9uKGQsIDAsIE5VTEwpOw0KPiA+ICsgICAg
ICAgIHNwaW5fdW5sb2NrKCZkLT5hcmNoLnBhZ2luZy5sb2NrKTsNCj4gPiArICAgICAgICBBU1NF
UlQoZC0+YXJjaC5wYWdpbmcucDJtX3RvdGFsX3BhZ2VzID09IDApOw0KPiA+ICsgICAgfQ0KPiA+
ICsNCj4gPiAgICAgICBBU1NFUlQocGFnZV9saXN0X2VtcHR5KCZwMm0tPnBhZ2VzKSk7DQo+IA0K
PiBJIHdvdWxkIG1vdmUgdGhpcyBhc3NlcnQgYmV0d2VlbiB0aGUgdHdvIGlmcyB5b3UgYWRkZWQu
DQoNClN1cmUsIHdpbGwgZG8gaW4gdjMuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+
ID4gICAgICAgQVNTRVJUKHBhZ2VfbGlzdF9lbXB0eSgmZC0+YXJjaC5wYWdpbmcucDJtX2ZyZWVs
aXN0KSk7DQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

