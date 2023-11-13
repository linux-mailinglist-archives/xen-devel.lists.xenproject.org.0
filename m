Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6777E9994
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 10:59:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631478.984827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Tip-0000v7-45; Mon, 13 Nov 2023 09:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631478.984827; Mon, 13 Nov 2023 09:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Tip-0000t2-15; Mon, 13 Nov 2023 09:59:11 +0000
Received: by outflank-mailman (input) for mailman id 631478;
 Mon, 13 Nov 2023 09:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUjx=G2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r2Tin-0000sw-UR
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 09:59:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 496c050a-820b-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 10:59:08 +0100 (CET)
Received: from AS9PR06CA0634.eurprd06.prod.outlook.com (2603:10a6:20b:46f::21)
 by PAVPR08MB9796.eurprd08.prod.outlook.com (2603:10a6:102:2f8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 09:59:05 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:46f:cafe::2a) by AS9PR06CA0634.outlook.office365.com
 (2603:10a6:20b:46f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Mon, 13 Nov 2023 09:59:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 09:59:05 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Mon, 13 Nov 2023 09:59:04 +0000
Received: from c6061292fb02.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2632119D-D925-478B-84AC-5CCAA4675839.1; 
 Mon, 13 Nov 2023 09:58:58 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c6061292fb02.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Nov 2023 09:58:58 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AS2PR08MB8621.eurprd08.prod.outlook.com (2603:10a6:20b:55c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 09:58:55 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 09:58:55 +0000
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
X-Inumbo-ID: 496c050a-820b-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hxCykQ50O6QPzcWcVLel4FrjBWCqueO6AltykVJGZvoVixjTCgEXoXB7XtcgALNnKNFniigmbxC6PDgFsum1Ytjd3q9amtfwfAgZGhbHWWdC0osI7shPqO5Hv/boQ21v1BDi86ges4iiF9Z9mwGqe+YoYiSmuEWaYE1UUByghMnCh+SkzUBr6gEvQ2wZHClWJkI0a+EK1bSv/OppxhMfu6kXHBFWgDuy7j6tAuomdhVuYCUDoJuSBK2qwx0wMo/ynu7M+rZPYHU5z6LUVxhftkKMj2eSoBuu8lJAJN9ErnMoszIduy0Crum1Yf3iUEIrjXO0C2/xBiMcMFrZpHhLYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgs8imh2O3/Qs4hf4jV1+sMvl95XSbIL9e+23/wUkfM=;
 b=VrVrdGTf2rZI6wsOpFeB8fR1wX0my5W0BD28YKjs3RwyZU4Ez0GF3XdZjda91FDV5JV+oke429X6bbsB9C/gdF+zuAbYnd0H7EMjQmkGiBnyKhycV+UGnocmgOnJV2VEnuuBEcRJ49zJDJdo4t7BpvKEE6hmJCmG/Sr55wg0KtdC8/So29mOiEdiWZOJy+/m54+nZYvzsVKL2uSsVsLOLh2hIntHmtQ0GO+K7dwI0KQHG9Wsh3ecMkAMJKwSv3gIl3bG2guP6ytePqjzZs/OeTWL2xDo/pzfC+W7bMN4ZZx/NEW38e4js3ol91x2nu1e+dCwYO910kBUUpZk6jKCpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgs8imh2O3/Qs4hf4jV1+sMvl95XSbIL9e+23/wUkfM=;
 b=I4f8bJe1ol+0r2sqT+DUotap7xEnYCCUKurSL9/M2SaAhCa3mG0gSv3uS+YLzcH0QNLivolqgHUAuUq1tdIdjM525P8j6eSx7m/iTb8Q3G5zLqmAZ/ZfKcv+YkqIbp5IJc1ekYwTLQqgu5VrnRPxJNunJ+hgzsVj5kM6DQnit2M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90740e10935d4ae1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kle6iVIbBdCoLq+ozJ2zd0swoGr+cpQGP+m/ispU+TdasVwRDOOjQhsMfIpe178axK9zIpjwyKswU8gz3/2MQYDO09BupmexFZHTip6GeqPGek0oDD7szb5hyb+D8Wxqn4JlZlD5PUS+17v1ot2Z18rlq/UJ7WJZjoYNv756iKhDwEyvJU5C6iX+hE/5T3p+AK6Can9AnfZ5OCHof96f9xf7n5qP5XwwsMJvwgXc0/i9jLGeFKhvrCId80mW+tscJI/qIrkZzqiiHQN0w3G2astwDkvhGHeLQm8yP0AwEcxN5dmoSqiCUCvJNebxflQuf+S5RrmBor70s2Eh64SgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgs8imh2O3/Qs4hf4jV1+sMvl95XSbIL9e+23/wUkfM=;
 b=EzVPA+xSp1UpRwNouiW6lvdTjxkcaRFIp2bYKZ6UPiYR5I60cgauZAw7hksSGNwH+F/e8gw/yC6bzwRvMfmEQ/wV/GoQbUO+jc3Qnaw8LOTpR/oL07G9HgZOOMqz2uBt9kxCH5jLrlJ1Y84i/C/55WpowqJVnvUnuNa1zWoPjrenL2Gas4nOLIfv/3WZINebXFXjxrDxBABPO/sttCJpSGw+4qEMPuKn211gPaTnYcx+wU71GhfRIyGG3sc2DhA3bSxllIpF74YhJW+7OVoOBpbNL+6G1j+YMExv6SwSUj0JPYCljAhE1JCR82c+PowYEMfQu5w8gE1+ALwTFw5aHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgs8imh2O3/Qs4hf4jV1+sMvl95XSbIL9e+23/wUkfM=;
 b=I4f8bJe1ol+0r2sqT+DUotap7xEnYCCUKurSL9/M2SaAhCa3mG0gSv3uS+YLzcH0QNLivolqgHUAuUq1tdIdjM525P8j6eSx7m/iTb8Q3G5zLqmAZ/ZfKcv+YkqIbp5IJc1ekYwTLQqgu5VrnRPxJNunJ+hgzsVj5kM6DQnit2M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v3 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHaEuwcMi2uzYg9sUaekJ4uQMuKYLBx1QmAgAY1GYA=
Date: Mon, 13 Nov 2023 09:58:55 +0000
Message-ID: <7C92A577-716B-4D48-B685-3EA0C93AAF5C@arm.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-4-luca.fancellu@arm.com>
 <bec276f9-ea9d-4c9f-887c-358a3f7815fd@amd.com>
In-Reply-To: <bec276f9-ea9d-4c9f-887c-358a3f7815fd@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AS2PR08MB8621:EE_|AM1PEPF000252DA:EE_|PAVPR08MB9796:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d030b6-8bbe-4c6f-a11f-08dbe42f2bb0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6dCvgHYZp+JyV9Owt8v0laDvyvKZXkpiV522L3DBkOhARhHWXReraCF99AwpKChFLeyZBctRHHjmOcsTNHQ7i+NR002XPVaCeP/embGMDpCLCeSfEqYnM6rB02icW35yCzPG5KYKiPrPKYr0eJhKfZ69N/Mf6jbNhJB+DS841zPVFfJiHR3rIazrR5wCRC4hoacOfuwhBqk9rzqMSaWRSZRUQAQL8n4ZBhWteaegLpEFkc0vrRSUpYxhxSxxUHBHBH/5VLsiBPmdSA82ozVQi5+hSgswesn/wFr+10IGX1pFSeRqSvbjNa1uzXrLIQavIv+HaRwC7BvGmbLxdrRjnfJptkunB4XudnfUeUW4If+El/SlShjLCTzmO4lTdcWwGzHyEQ01WWZaSJS7brioEDvRTMlRwFLI/1CUHsKCkFrZY70jEU+JX1XJFChZ1AUg6M+ctLoPeGA8bJXstp0tO7bumT8E47Asi7UuR5DWw4XbvhjTKtSxGUE8DL9nkboPcS9hyTe1ZbC0ANYXx8cNn7k67KUVxFLVyQmRFkkbDWCPPy0jm5CIxnF4m0mJCEqD4OtoVukFwgFHFCkw0bkFAdYKw7pdhe2WJsKo8svrVL1JTUoneGIjAx8+curHBGCl8gNRpixnmjgqmKmDhScLVbSaRbINpJIS2DiuCa/uUBAE6x50LQVtuUKISeM/Rk9rDTrbbD4KVfZEjO7GdX2lSA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(1800799009)(451199024)(186009)(38100700002)(2616005)(83380400001)(122000001)(6512007)(26005)(6506007)(6486002)(478600001)(71200400001)(91956017)(66556008)(54906003)(76116006)(66476007)(66446008)(64756008)(66946007)(316002)(6916009)(33656002)(36756003)(41300700001)(8676002)(4326008)(8936002)(2906002)(38070700009)(86362001)(5660300002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8062A933341084C8453BBD8BB13FAB2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8621
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0a722d90-0167-47d0-81bb-08dbe42f262c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7T1HwPA2JZ1WXm/sRlBtSmokmc3SiOXhV8OENd7hBz96BWWHde1DP4DE7wEUe1ijPX+yAW4kUkzHrR2xmADsUv8FcoZJpZPk1ZK9c/pVmyBk1QrffHi/kHR3HKzgU4q9JGHjy70At4C+lEA6Q1YkPUnur6dW5uNrNeDfGveI88W7mlmLLvR5sVNDPGv6cuq6eRXsu9Yuui1Q7ZydwpZSX+MQzXWwLzcvdlvsJpbHHfHuOvn7asnncJttXu0oLo8cwkUkiJn6nsNXUFO1odQQ6VSqAOgCOvMuZ6Th+NGHZiGi/ntIZ83HoLQG9TWJ+7y+8M3RgNAcvrlAfTbqnhAD9etg3x149ZtwYVmUzjYTf+xB2eJ3OfzQq3n7c+noaL7vB5Vwr8hXoaNn29Za9VhGBKNNnSZWGghlhAcpjh6lxjHIUXIqLjXgr5uB+GhFHG1l9AoWS3cpIwZ3+/CoR4V9iqeA7v8Wb3YmIeDse6iIZs2IVO44vr76qyrL0cqm757ZKt69TaSyNpZ9xizcUaeuzvEvCnM6ali4ews0yRbmQn70S5NTNKNpwINHa9+9ewYW29bMsWFDvx+4MapyZxbMlsoLT84qkkJ8RF17IokhOqUR0zWEsNzyylbi9Ig6s3uLxoFBmrW39WqJKFNZYnPk7DDiTaUX35gBErEwbZ4QNWF9tQIfslFUROnoOBvbErI0YYBHrSrbybBATModIJ9DmXoj1Y9QtZ6SmbOVzF0Q4gC8xIy5D8AidmlkDM6TdEQP0l0bJCT5yXskXq5SmLriUxOUNbRy0CMJL/6V74oMCOo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(6486002)(478600001)(81166007)(36756003)(6506007)(356005)(336012)(107886003)(47076005)(33656002)(316002)(6512007)(70206006)(70586007)(54906003)(41300700001)(40480700001)(83380400001)(6862004)(4326008)(8676002)(8936002)(40460700003)(5660300002)(82740400003)(86362001)(2616005)(2906002)(26005)(36860700001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 09:59:05.0180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d030b6-8bbe-4c6f-a11f-08dbe42f2bb0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9796

PiANCj4+IA0KPj4gVGhlIGZ1bmN0aW9ucyBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5IGFuZCBhc3Np
Z25fc3RhdGljX21lbW9yeV8xMQ0KPj4gYXJlIG5vdyBleHRlcm5hbGx5IHZpc2libGUsIHNvIHB1
dCB0aGVpciBkZWNsYXJhdGlvbnMgaW50bw0KPj4gZG9tYWluX2J1aWxkLmggYW5kIG1vdmUgdGhl
ICNlbHNlIGFuZCBzdHViIGRlZmluaXRpb24gaW4gdGhlIGhlYWRlcg0KPj4gYXMgd2VsbC4NCj4+
IA0KPj4gTW92ZSBpc19kb20wbGVzc19tb2RlIGZyb20gc2V0dXAuYyB0byBkb20wbGVzcy1idWls
ZC5jIGFuZCBtYWtlIGl0DQo+PiBleHRlcm5hbGx5IHZpc2libGUuDQo+PiANCj4+IFRoZSBmdW5j
dGlvbiBhbGxvY2F0ZV9iYW5rX21lbW9yeSBpcyB1c2VkIG9ubHkgYnkgZG9tMGxlc3MgY29kZQ0K
Pj4gYXQgdGhlIG1vbWVudCwgYnV0IGl0J3MgYmVlbiBkZWNpZGVkIHRvIGxlYXZlIGl0IGluIGRv
bWFpbl9idWlsZC5jDQo+PiBpbiBjYXNlIHRoYXQgaW4gdGhlIGZ1dHVyZSB0aGUgZG9tMCBjb2Rl
IGNhbiB1c2UgaXQuDQo+PiANCj4+IFdoZXJlIHNwb3R0ZWQsIGZpeCBjb2RlIHN0eWxlIGlzc3Vl
cy4NCj4+IA0KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaXMgaW50ZW5kZWQuDQo+PiANCj4+IFNp
Z25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0t
LQ0KPj4gQ2hhbmdlcyBmcm9tIHYyOg0KPj4gLSBtb3ZlIGFsbG9jYXRlX2JhbmtfbWVtb3J5IGJh
Y2sgaW4gZG9tYWluX2J1aWxkLmMsIHJlbW92ZSBoZWFkZXINCj4+ICAgZnJvbSBkb20wbGVzcy1i
dWlsZC5jLg0KPiBJIGNhbiBzZWUgeW91IHJlbW92ZWQgdGhlIGNvcHlyaWdodCBmcm9tIC5jIGJ1
dCAuaCBzdGlsbCBoYXMgaXQuIFRoaXMgYWxzbw0KPiBhcHBsaWVzIHRvIG90aGVyIG5ld2x5IGlu
dHJvZHVjZWQgZmlsZXMgdGhhdCB3ZXJlIHN1YmplY3Qgb25seSB0byBjb2RlIG1vdmVtZW50Lg0K
DQpJ4oCZdmUganVzdCByZWFkIGFnYWluIHlvdXIgY29tbWVudCwgSSBwdXNoZWQgdGhlIHY0IGJ1
dCByZW1vdmluZyB0aGUgaGVhZGVyIG9ubHkgZnJvbQ0KZG9tMGxlc3MtYnVpbGQuaC4NCkkgbGVm
dCB0aGUgaGVhZGVyIGluIHRoZSBvdGhlciBzdGF0aWMtKiBiZWNhdXNlIHRoYXQgSSB0aGluayB3
YXMgY29kZSBwcm9kdWNlZCBieSBBcm0sDQpwbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0aG91Z2h0
cyBhYm91dCB0aGF0ICh5b3UgYW5kIHRoZSBBcm0gbWFpbnRhaW5lcnMpDQoNCkNoZWVycywNCkx1
Y2ENCg0K

