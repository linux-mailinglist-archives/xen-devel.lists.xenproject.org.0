Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C642152E862
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 11:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333584.557428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrycu-0002oP-T4; Fri, 20 May 2022 09:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333584.557428; Fri, 20 May 2022 09:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrycu-0002kv-PP; Fri, 20 May 2022 09:08:52 +0000
Received: by outflank-mailman (input) for mailman id 333584;
 Fri, 20 May 2022 09:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dhdo=V4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nrycs-0002kp-FZ
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 09:08:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe02::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7599967b-d81c-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 11:08:49 +0200 (CEST)
Received: from AS9PR06CA0250.eurprd06.prod.outlook.com (2603:10a6:20b:45f::8)
 by AS1PR08MB7636.eurprd08.prod.outlook.com (2603:10a6:20b:478::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 09:08:47 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::8e) by AS9PR06CA0250.outlook.office365.com
 (2603:10a6:20b:45f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Fri, 20 May 2022 09:08:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Fri, 20 May 2022 09:08:45 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Fri, 20 May 2022 09:08:44 +0000
Received: from 7712050afdbf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28F45EB4-A854-4C1F-9F97-623D69173078.1; 
 Fri, 20 May 2022 09:08:38 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7712050afdbf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 May 2022 09:08:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Fri, 20 May
 2022 09:08:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 09:08:36 +0000
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
X-Inumbo-ID: 7599967b-d81c-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K6P+y6XYwAQPShHyS/3T/JXYfoHYEM9kFOKGRt45Vej+iVJXPMNPgxg94O6pHzVc7Cg76CAzXYmVsV038Is0gYQ99b+v01x9UpTb6mCpEZZIdOGMMXJCYu2Sxb5wPvzZChyq5D1D/V2Ua7l4VhgP41IdePoFM8H3N51wTZ/ULpIutFaW7GIWODj4Gcd0wpWMkHPCqiFjAJfXlg7N2otGUbbmWtTQ1WWJjRKoy+qs3xHjiMI6vtUtB9yK0CCsb9dlA8hUiKGRFo8I2VQKJvX1SEYBfT+F5Z6F2tHE4JaVM0UHAZ4uZZOi+ddFhl1Op3VbDIcMzv+eylbD3LZiqunBaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tg9wI8pbLsSNAOGEc544JGsIFy0/XLtT+D4FLaodeWQ=;
 b=hjSZi6qSStBFZpDlir5mNs/wk6W0IpMNFTRBWTabT26HFPQSFx0ek/bsT4eRoIaHOfmSp7LatqVXdlPCrG82MTIsqqdmfKK/KUYEbA74zWqIwoaU3Vi25+tYToHSXuThB2ugbovg0Ol2L7m/Y2Oc58jMJPWS3bahiec/tMzVZUa23cEXnm7AsYU3dZ5Nd3SH0xJOuklFn1a7ptppjhGP86EVRVnMefwkPJxAeB8E51PImOuhtVZmdyloCda22o/mNzHkligib+srLDsZZ27yGRL8NyZYA/rQHSmMz6iPrDM0+QWxtckLwRhFva+XO05Urwpl4owXI79qTWmYFOj1dQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg9wI8pbLsSNAOGEc544JGsIFy0/XLtT+D4FLaodeWQ=;
 b=G91+6aCcZ++R4Vj2HkA0/lovs4FnurVUUT/sB1YsAqVgH61lXhiJRXf6l/CHbz2EFhaD6YDVDyBDA3agYQx6fFHpm/NUZVZhw0Xx+3BnlqMO8kN8kL2zmpU94mrZXi+Xd4QjGaVL18UIsgo9T6ASvWBGXfDVxgr+jhtFrXozqMM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3811c6f2841b5ec5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noEccqOyPZMiV0Ia6f1x8SSadP3zPl31uy++hftBXi4iIriF7zun4++6RbyVvKkgirKbqwv2fIYTrSnBKWUyD9NJtEi9/sW7wmyEPh7U4ych7dBYinAIZvazWGryAjuG7yck3TKk59WqX/G4MQfdAFQSu/8g2JG9eYiv4rvslgbI2lWbwOllCi3Lxhs0E7k8dPMwijjmOxvEaqgy/OvtM59eUBStyc10BBoh7v+VHnuQGjiJB8AX438Q86UQd4HF8GN4DjSzNcEpa5yi3tp5R1J0MbgNZ2HBHU1Bat6nsAnP6nTiuVp/3+3Og7v978zTnk7fmYmtmVKp7n5bpDMiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tg9wI8pbLsSNAOGEc544JGsIFy0/XLtT+D4FLaodeWQ=;
 b=WF3M7dynjO+xJcuCGi5t6kXVMG82W3NnHEL8JHzxW0rA6K+CuRpNwLrCm7OGVWVGDglvYckkClqQ875VcseGAOpLFTUx3dTESuwMJIAat06iQb0U71qpA4w51PC3QMaq7PEtyvhNt8YWZ+1tnO1uxwqOWHvD4c7AfrAoY1GD27ZzPXffV4tjm1Jniy8/6v82xr5U41OV+GsqUFnnT1xC+qYDc6B9I9oIa5kDTB5UalbjL1JsfEpucoB2vHA7uj5EF7bQomzAn1gu6GtNyQhpzxB35cYBpmp9wHJKvtkd+Z3JtJz1B6MgJYpnLq1gXhkCntJBvRWsTojAetSUWH1ffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg9wI8pbLsSNAOGEc544JGsIFy0/XLtT+D4FLaodeWQ=;
 b=G91+6aCcZ++R4Vj2HkA0/lovs4FnurVUUT/sB1YsAqVgH61lXhiJRXf6l/CHbz2EFhaD6YDVDyBDA3agYQx6fFHpm/NUZVZhw0Xx+3BnlqMO8kN8kL2zmpU94mrZXi+Xd4QjGaVL18UIsgo9T6ASvWBGXfDVxgr+jhtFrXozqMM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Wei Chen <Wei.Chen@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, nd <nd@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jiamei Xie
	<Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
Thread-Topic: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
Thread-Index: AQHYZNkEfStZ9tvSv0uE8gVJVUTE+a0kpgQAgADixQCAAf/jgA==
Date: Fri, 20 May 2022 09:08:36 +0000
Message-ID: <A8CC0713-A798-4F23-B39D-7A4BE738E0AC@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-3-wei.chen@arm.com>
 <9b04ca55-f617-dc14-cbf0-a3e427ad5869@suse.com>
 <PAXPR08MB7420C70C703B1C006A3403EE9ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
In-Reply-To:
 <PAXPR08MB7420C70C703B1C006A3403EE9ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2e430025-2dac-4dc2-9b87-08da3a4057d7
x-ms-traffictypediagnostic:
	AM4PR08MB2851:EE_|VE1EUR03FT025:EE_|AS1PR08MB7636:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR08MB763649B70BE7680CBB8B45C29DD39@AS1PR08MB7636.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6YG+T63/Xanrd9Ott1UiDEMmqjgcQg8eAXGyOUb0e8gqb6kAGQ0mrm1OcY3o+OOkNtsJqt6p2q22UM1JPz148bteclgQnEtCvygc58VffS4SwyLzAmaW67lAh36r5ped+rbM/vL2W+ose9jN0ZZ9XVD8wlEcdWD3kzzWnthDarC0hoX05rruYn/HjUxBF8m9H2X2ecuR8OGhPinI0ngVTCIzzQyIFvXTQA141oFpInTEkvgCAHIFZ7y5IFF4eRyEp3HqFosZq2uC6ATI9Eggiulc7Dzy8UQhnxd+xUgBBD5qf9rYTg0Vah0Pe1uPO8zxcVzVriXBg1mR9MTXSLJaF6Z4x1z+DHL7hlELS06CrzteI3slRRIvDtaImAUb2aab337wBz5JiSnjICBSU88PO3zZTrTcEFxBdXfRpqtmzmiMwHr1P4lqYmeAPTR/l0pGZ8F/dKHjzXnM4itoxzh7Y3Xd9OtB8sPFMteB+M6i81hxz+nVbEcXPIpe6hDlA3reg+p3OQcFzMovKRR1q/GwGJzntd/kdJBlq4Qoa8BYdVLzlh48EF1uN5YDtVQ/zPEPQOp/koRBMxftJGGxu5CW/NYQlIeWgY8hBLRI0wzUtzqwyQHaLLYz8tzk+qDPPGtuFen7SjP0PC3eQDPTquQYtQW63YX7oKKBj4ZZ3t3OY4XrhxKw3fwvrKyf5fOFju4qvAbELUSiER3Yo2NxLXZm7OZlsAEd/1hwtbVLCOeeDECs1J4GLdErFBKOh3s74jSe
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(316002)(6636002)(26005)(6506007)(53546011)(37006003)(54906003)(38070700005)(36756003)(122000001)(2906002)(71200400001)(8936002)(186003)(5660300002)(64756008)(66476007)(4326008)(2616005)(6862004)(8676002)(6486002)(508600001)(86362001)(66946007)(38100700002)(76116006)(33656002)(66446008)(66556008)(91956017)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5585BE3133EE0946A314E5C9AB0A78ED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63efc7eb-748c-4739-1319-08da3a40528c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vmofAJrNJ5G7FxXrDAiK5WydUpFDTgvM6Ybmyd0WluL/xqhS721A+U65w6Belws5mNa3uuP1r8M0EvJhAg10plmRhk8bbDyWnblpVKNsjU1Dm+AA7GY2chvKvsRSDMzTNVDCX/oI1JO8VD6UPIkrjCsDK/loWIUKG48zvmUjCyPdSFNG5RY5hKAexIkh0i5MEwEf2CYW6VQRXzVDY5iHsqtqGdDvVW7wNAmBlnG5CShVXjAD8ndrPPnR83Bek1Rpup1orMUA5nf6jCEPM59HTjBjO9U9HsIzk4QWiYts5zn/RDGV44uYtH36R9lKOuoxlGi36lLcWCtf8F9G5ua4tawJZz+jxd1KGMi57TMpeguCEqHb1IEmJDU5e4E1xTDHkn+rzNECO+u3bTcL8wgDgGLga4WmGuliWXmjcWYXgr5eapX0X/MtAhEObqKri+Yjb3LBMw9qdtoSWOSR7B4FM7qCZCvBktYjqaZBWKnVkEju6sN5hP54PGsimT+xywoisLJ5jV6JDtMbh1HfopmCa6vAtlMPcWH5wqBRYr/4+8qGcHjPkay56eIX23iyv/djepM9Y8JPbKd3kEl9cQ53TEDFR/8giRiEOo9dGuRM2iZ8iLPNXOeEl3tU8lny6S5jTDH0+Vc9LLG9We3zDRh1iqUaslURDB2vtggPgz07hNw+ynGZYyUJvDxxX54Jq6mm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6512007)(53546011)(6506007)(6486002)(26005)(33656002)(40460700003)(508600001)(81166007)(356005)(2616005)(36860700001)(6636002)(82310400005)(86362001)(47076005)(83380400001)(336012)(186003)(36756003)(70586007)(70206006)(8676002)(37006003)(316002)(54906003)(5660300002)(8936002)(4326008)(2906002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 09:08:45.1474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e430025-2dac-4dc2-9b87-08da3a4057d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7636

SGksDQoNCj4gT24gMTkgTWF5IDIwMjIsIGF0IDAzOjM2LCBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJt
LmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBKYW4sDQo+IA0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IFNlbnQ6
IDIwMjLlubQ15pyIMTjml6UgMjE6MDUNCj4+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNv
bT4NCj4+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz47IEp1bGllbg0KPj4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4+IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4+IDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+OyBXZWkNCj4+IExpdSA8d2xAeGVuLm9yZz47IEppYW1laSBYaWUgPEppYW1laS5YaWVA
YXJtLmNvbT47IHhlbi0NCj4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+PiBTdWJqZWN0
OiBSZTogW1BBVENIIHYzIDIvOV0geGVuOiByZXVzZSB4ODYgRUZJIHN0dWIgZnVuY3Rpb25zIGZv
ciBBcm0NCj4+IA0KPj4gT24gMTEuMDUuMjAyMiAwMzo0NiwgV2VpIENoZW4gd3JvdGU6DQo+Pj4g
eDg2IGlzIHVzaW5nIGNvbXBpbGVyIGZlYXR1cmUgdGVzdGluZyB0byBkZWNpZGUgRUZJIGJ1aWxk
DQo+Pj4gZW5hYmxlIG9yIG5vdC4gV2hlbiBFRkkgYnVpbGQgaXMgZGlzYWJsZWQsIHg4NiB3aWxs
IHVzZSBhbg0KPj4+IGVmaS9zdHViLmMgZmlsZSB0byByZXBsYWNlIGVmaS9ydW50aW1lLmMgZm9y
IGJ1aWxkIG9iamVjdHMuDQo+Pj4gRm9sbG93aW5nIHRoaXMgaWRlYSwgd2UgaW50cm9kdWNlIGEg
c3R1YiBmaWxlIGZvciBBcm0sIGJ1dA0KPj4+IHVzZSBDT05GSUdfQVJNX0VGSSB0byBkZWNpZGUg
RUZJIGJ1aWxkIGVuYWJsZSBvciBub3QuDQo+Pj4gDQo+Pj4gQW5kIHRoZSBtb3N0IGZ1bmN0aW9u
cyBpbiB4ODYgRUZJIHN0dWIuYyBjYW4gYmUgcmV1c2VkIGZvcg0KPj4+IG90aGVyIGFyY2hpdGVj
dHVyZXMsIGxpa2UgQXJtLiBTbyB3ZSBtb3ZlIHRoZW0gdG8gY29tbW9uDQo+Pj4gYW5kIGtlZXAg
dGhlIHg4NiBzcGVjaWZpYyBmdW5jdGlvbiBpbiB4ODYvZWZpL3N0dWIuYy4NCj4+PiANCj4+PiBU
byBhdm9pZCB0aGUgc3ltYm9sIGxpbmsgY29uZmxpY3QgZXJyb3Igd2hlbiBsaW5raW5nIGNvbW1v
bg0KPj4+IHN0dWIgZmlsZXMgdG8geDg2L2VmaS4gV2UgYWRkIGEgcmVndWxhciBmaWxlIGNoZWNr
IGluIGVmaQ0KPj4+IHN0dWIgZmlsZXMnIGxpbmsgc2NyaXB0LiBEZXBlbmRzIG9uIHRoaXMgY2hl
Y2sgd2UgY2FuIGJ5cGFzcw0KPj4+IHRoZSBsaW5rIGJlaGF2aW9ycyBmb3IgZXhpc3RlZCBzdHVi
IGZpbGVzIGluIHg4Ni9lZmkuDQo+Pj4gDQo+Pj4gQXMgdGhlcmUgaXMgbm8gQXJtIHNwZWNpZmlj
IEVGSSBzdHViIGZ1bmN0aW9uIGZvciBBcm0gaW4NCj4+PiBjdXJyZW50IHN0YWdlLCBBcm0gc3Rp
bGwgY2FuIHVzZSB0aGUgZXhpc3RlZCBzeW1ib2wgbGluaw0KPj4+IG1ldGhvZCBmb3IgRUZJIHN0
dWIgZmlsZXMuDQo+PiANCj4+IFdvdWxkbid0IGl0IGJlIGJldHRlciB0byBtYW5kYXRlIHRoYXQg
ZXZlcnkgYXJjaCBoYXMgaXRzIHN0dWIuYywNCj4+IGFuZCBpbiB0aGUgQXJtIG9uZSBhbGwgeW91
J2QgZG8gKGZvciBub3cpIGlzICNpbmNsdWRlIHRoZSBjb21tb24NCj4+IG9uZT8gKEJ1dCBzZWUg
YWxzbyBiZWxvdy4pDQo+PiANCj4gDQo+IFBlcnNvbmFsbHksIEkgZG9uJ3QgbGlrZSB0byBpbmNs
dWRlIGEgQyBmaWxlIGludG8gYW5vdGhlciBDIGZpbGUuDQo+IEJ1dCBJIGFtIE9LIGFzIGxvbmcg
YXMgdGhlIEFybSBtYWludGFpbmVycyBhZ3JlZS4NCj4gQFN0ZWZhbm8gU3RhYmVsbGluaSBAQmVy
dHJhbmQgTWFycXVpcyBASnVsaWVuIEdyYWxsDQoNCkkgYWdyZWUgd2l0aCBXZWkgaGVyZSBhbmQg
aWYgd2UgYXJlIHJlYWxpc3RpYyB0aGUgY3VycmVudCB3YXkgdGhlIEVGSSBjb2RlIHdvcmtzIG5l
ZWRzIGEgcmVkZXNpZ24gYW55d2F5IGFuZCBhc2tpbmcgaGltIHRvIGNoYW5nZSB0aGlzIGluIHRo
aXMgc2VyaWUgaXMgbm90IHJpZ2h0Lg0KU28gSSBhbSBPSyB3aXRoIFdlaSBzb2x1dGlvbi4NCg0K
Q2hlZXJzDQpCZXJ0cmFuZA0KDQo=

