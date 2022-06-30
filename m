Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F556154F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358326.587473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pjr-0004gx-M5; Thu, 30 Jun 2022 08:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358326.587473; Thu, 30 Jun 2022 08:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pjr-0004e8-JC; Thu, 30 Jun 2022 08:41:27 +0000
Received: by outflank-mailman (input) for mailman id 358326;
 Thu, 30 Jun 2022 08:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+N5j=XF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o6pjq-0004e2-Em
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:41:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ab72044-f850-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 10:41:21 +0200 (CEST)
Received: from AM5PR1001CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::49) by PAXPR08MB7549.eurprd08.prod.outlook.com
 (2603:10a6:102:24c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 08:41:22 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::f2) by AM5PR1001CA0072.outlook.office365.com
 (2603:10a6:206:15::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 30 Jun 2022 08:41:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 30 Jun 2022 08:41:21 +0000
Received: ("Tessian outbound 4748bc5c2894:v121");
 Thu, 30 Jun 2022 08:41:21 +0000
Received: from bd76e660bb4f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B836C286-7A1E-4A4F-8AEE-536469E6503E.1; 
 Thu, 30 Jun 2022 08:41:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd76e660bb4f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Jun 2022 08:41:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB2799.eurprd08.prod.outlook.com (2603:10a6:802:19::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 08:40:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 08:40:55 +0000
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
X-Inumbo-ID: 6ab72044-f850-11ec-bdce-3d151da133c5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GpQarhKfY1OzrZ3cXaKd7JxmKEfMQkD7CTby4oYN/HD5UlK32Fp4ilhvBA/2XgfxVd5LG6s+b18VanOh9wL7aqsSIWeMVyHoBln5dxC+4VMhsthQyq9IS/dfPF57XBWrmmfkxApVevxWwmzIzPtm2EK9ntBgeIM3RDLp7YAdGsAX6JXuG/QBBo8hWoxBE4IOWktYiG4zSVjQOWPHx6Ni6js6SmHo/lm3bQzmkHrjYwiQ6WCYQoqOCLv9BSGB4GBF1oyH7Gc8F8euJb/3C8S4kYOMwtDD5fOWsIySJ62B+pp/2H0bIoFQ7cp/FM8iQ5e5T8mrVGYzbBrHtVjMkDdAng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezCmuNKMIB3MTY9SF7b2uXP+7DTkfHwrHZflJsoVeYI=;
 b=IZz72PQKV8BiVU4cQlBeHbZdLjrIhif2D4IE6tv/KDgk5FqLRUrs1WfHHnbKw2q4SwF+T3U//a6wbCxjPnIf1z3ZElG+n3Ijp6lpYV9S+0U9Kk3iGjycuf0ZcAfMFXE0wVVz6r3prqmpJpmb/gYrgnoZ/TxNkPxPukxRgjSeRsquUoA0N+qcTkJei2opR2KE12/bmkDSGySY5IyXAS7Nctc74KzBPa0CQlb6sux4JAj49YVpRpZ3+MoWYKKzV1xZjD/RzW7chR+LYeHOsZOuMZVsnO4U0e3cNYPa404Zbg6NTSFTAR81lSUtOR215zoWIqxhsQOcNil62Ja2GRITCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezCmuNKMIB3MTY9SF7b2uXP+7DTkfHwrHZflJsoVeYI=;
 b=AJZ/xzLYxpy/Xdwjn57vxvbqMnERIw171l1zTZnx/Vqyst1RYNHCtrWAdPWS5abGvxTeKU4+/F3yzbZ97rYKM/phjESSAAtJUCTtU5ME2UC30xOFCgV00Qy6XNtO9vnedPVOXCZGLD0Mk/KWLgeBMkHLSisfL40c8EKmnrrWzEQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XG7h+y5VnsSryCdIw0dnwdjKDFcXQcyWn2y7QUdHknUfB4rvAVFScW+FX+avcH+H/MVcERmI38sKFcSsbJ4WU/fYsdnTdZ8ykclCH5CNBasFjrw+OWpN+WZPWPUHSI2HxnMPJrWRh167QjCUuaP9GnIZddRboRfrCmRKH4mcUM0BsQ1GZB765OiQkX+SsWIg/iUK7sb5Qe4dMOQm98WCYVaN6y9Jqm/FGyp6CEy4IUde5NhooIhC+6LX7v7Cjc1CfrZ+pPb5cyJiW0OyKQAH8EoaNACgFdfKljYRVlD4Fc9Ys02icEIMQSXZx578JuoFaai57aAjtgTO8X6/wQDYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezCmuNKMIB3MTY9SF7b2uXP+7DTkfHwrHZflJsoVeYI=;
 b=lACmGeF549uPm+leoTMLAr8oFzZkT0dLaYAxGoXY0W+lF64yslIj3jbymfakn1xrZJs8Uz1qTGvnSchUHGQG0A91jdO+YU9yZFFAgUal0XOYTzTJ+IQxr8Eb0SDCT4/bVmv/LjpfGefFvjjefmPfych+/3VZzYie/gFnfMN9pa6rg+Y/Plnm38IFQHmH1xRIndAFLxW6LhosWE7in0cRGgtX4+zjegYGgKdvo/8eVKay0qAnARzaCDKlWkZ7pcRP549/KOQjVHpV1P9F3J1Gf3loVqCKW84729V9C7XNUvU4yAuyKewcNGpfpY4blWyzwgC3g4VCEu7Hh5Pv2neskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezCmuNKMIB3MTY9SF7b2uXP+7DTkfHwrHZflJsoVeYI=;
 b=AJZ/xzLYxpy/Xdwjn57vxvbqMnERIw171l1zTZnx/Vqyst1RYNHCtrWAdPWS5abGvxTeKU4+/F3yzbZ97rYKM/phjESSAAtJUCTtU5ME2UC30xOFCgV00Qy6XNtO9vnedPVOXCZGLD0Mk/KWLgeBMkHLSisfL40c8EKmnrrWzEQ=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>, "jandryuk@gmail.com"
	<jandryuk@gmail.com>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: RE: [PATCH v9 3/3] xsm: refactor flask sid alloc and domain check
Thread-Topic: [PATCH v9 3/3] xsm: refactor flask sid alloc and domain check
Thread-Index: AQHYjChOQ8kNa3hXJ0OsgkVBHq90Ka1nneog
Date: Thu, 30 Jun 2022 08:40:55 +0000
Message-ID:
 <AS8PR08MB7991EF8AA64EAB4754513A7892BA9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
 <20220630022110.31555-4-dpsmith@apertussolutions.com>
In-Reply-To: <20220630022110.31555-4-dpsmith@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9726E471F8D307449217EB6E7E959FD2.1
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4aa5af78-f2a7-4379-0a18-08da5a744f2a
x-ms-traffictypediagnostic:
	VI1PR08MB2799:EE_|AM5EUR03FT061:EE_|PAXPR08MB7549:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3pqXGziqjkoyti5cDoGH5JKdI8adOYXtySA0FlsJUorcx9PusoJ2P7+WhSF76/ybFj3MSG3JE93z8OYbCUn3ekRSCdQqoZlifJXmqPYwERkvR2oSRgzxjL4+JIZpbbGhoJ3cH9bm2EKamLEllr2UZ0kk0SSb9nHe7GuTGDbggfGVowf+Fc49h9IajOyeTanomz3ZqufnQadlHxeFkvv6zDpBwul3HpsiZ2RDjQlG49wbqFStb+QTQpeaGqs6/aUFSHrctMVLMnitohVTOM/ZHTbdxJEkOWnb4W5SFnB9MMN16whNp1V8uTgKlacKsJrRN5vI2TICH/ANBfy+2eCHgviNhHebiZExSbzB4CjOKa6ZEQfDUNzIez4FKOOZLoK62f8KjG1ZPcxoHsdIXOE9AimJsRAFwjGpKqzgu/RdIhkRWHKKzKEHDugw5RH8IBYwPwoO1GDqkP67lK8ELBDI7T49I0zIV+B2yM5wL0ene4fTxCocimsle1VPywQTFBjmM/pJEBTBMQE650YpmYQNIvreuXNunlR3mU+mQANGkW5Lwj1R3KmIclP8q4MN44Mk7SpYasfKZ4Ms6AVFaYpESQsTVGWYzbzDSCb4FCmgoGNPMlKRhWx6BmMi08XEYDAdaShM7dJ0af+GhXOvRi+73AXB4IKBXYj3q0TMyM0zFhlXMKjj7/CsQ2CFRlXWAo3Y7P0ZuEKZDgphhTK/DxHR6nKm5bGD2EOPZLUKSxW5EnEKl89veaKEpY6h2bVEfsDHkctO9442illnLAoyQzhWPeW/KWmRYf68qvETG3s1mRTVHi8Y17cxRsfsU8NXoVgX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(8936002)(86362001)(33656002)(52536014)(5660300002)(8676002)(66446008)(66476007)(64756008)(478600001)(76116006)(66556008)(4326008)(66946007)(9686003)(26005)(83380400001)(55016003)(186003)(71200400001)(2906002)(41300700001)(122000001)(38070700005)(6506007)(7696005)(38100700002)(54906003)(316002)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2799
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad49176d-da9c-4a1f-850f-08da5a743f9e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NW/Kt9tRKCFgnhVvEvSBpbOEPkBZsrQlKLr3/399/cPCcrreP66JV0sqUC8uML1GOYPDDzKVN3xyuIdTdzOawXWljY5G1oag/i3kmFLwGPFsaEMLqxaZ9psHEpfluy52ZEemZvZnxZ9gxZvChi8YL+XJBGlks4VaoalLPvpgBWNAMhp/VwgH5Z5DveF1xg+vruwwywS3ZIRbLM++gUV4HzRxsHR3E+4t3PLhT0NHZoe/GUWntvYX4zPcUsBUXh85mswUfK6EXThi5VPISdpqN8QIbvWuNGrDiucae3EWyldC9XPkfnX/TVx3pnHdOjLPAauTU0SX2BtCSFXPk3nRqILT9PVOEmnVpSqWkmHYGE5JemM79ogbGnCtCB9MKrm+w3VeacdBG8+8FNKgW4xl1m0LU05pJxBVe4R8SWXhV70t+2TkqiixvXe0JOuXGozoASlmT4Ud3z4eZE5QWxxgZViOqlH/19dSudOEPqy+Jzre27i8WK7wxPk57dCyBSHIcOIxR/RoxMmHjF3cClnikEqwhIpLsjmEPozQhAEgsScp8NEaMmz8NOYoDK+qFseOboJufOrSea362CovRxo+HP1ip8hH8SxouCNh7ui1tieCWuJK6XDqn3HcoYC1EgZVASrXdUS5QW6x7DMun7etaIBU7ElZCEM+DRh3116C7HujMhbpajFeATp4TCm13nH4m/uJ0uhtTWiWSiz9NMNvX5A0Wy//5Vl71wyAh1ODurwHyLxbKjaeqQyggyJLJrQZbdZS6cKDj8cOD9ILLX3zAx9/knM1ssIz1/HMBf0hUbTVVGZtw6RyX6AhmKfZd+ja
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(40470700004)(46966006)(36840700001)(33656002)(2906002)(26005)(6506007)(7696005)(107886003)(41300700001)(47076005)(9686003)(336012)(8936002)(478600001)(5660300002)(86362001)(40460700003)(83380400001)(52536014)(186003)(36860700001)(81166007)(82740400003)(54906003)(82310400005)(316002)(110136005)(8676002)(356005)(4326008)(55016003)(40480700001)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:41:21.6582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa5af78-f2a7-4379-0a18-08da5a744f2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7549

SGkgRGFuaWVsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFtQ
QVRDSCB2OSAzLzNdIHhzbTogcmVmYWN0b3IgZmxhc2sgc2lkIGFsbG9jIGFuZCBkb21haW4gY2hl
Y2sNCj4gDQo+IFRoZSBmdW5jdGlvbiBmbGFza19kb21haW5fYWxsb2Nfc2VjdXJpdHkoKSBpcyB3
aGVyZSBhIGRlZmF1bHQgc2lkIHNob3VsZCBiZQ0KPiBhc3NpZ25lZCB0byBhIGRvbWFpbiB1bmRl
ciBjb25zdHJ1Y3Rpb24uIEZvciByZWFzb25zIHVua25vd24sIHRoZSBpbml0aWFsDQo+IGRvbWFp
biB3b3VsZCBiZSBhc3NpZ25lZCB1bmxhYmVsZWRfdCBhbmQgdGhlbiBmaXhlZCB1cCB1bmRlcg0K
PiBmbGFza19kb21haW5fY3JlYXRlKCkuIMKgV2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHhlbmJv
b3RfdCBpdCBpcyBub3cgcG9zc2libGUNCj4gdG8gZGlzdGluZ3Vpc2ggd2hlbiB0aGUgaHlwZXJ2
aXNvciBpcyBpbiB0aGUgYm9vdCBzdGF0ZS4NCj4gDQo+IFRoaXMgY29tbWl0IGxvb2tzIHRvIGNv
cnJlY3QgdGhpcyBieSB1c2luZyBhIGNoZWNrIHRvIHNlZSBpZiB0aGUgaHlwZXJ2aXNvciBpcw0K
PiB1bmRlciB0aGUgeGVuYm9vdF90IGNvbnRleHQgaW4gZmxhc2tfZG9tYWluX2FsbG9jX3NlY3Vy
aXR5KCkuIElmIGl0IGlzLCB0aGVuIGl0DQo+IHdpbGwgaW5zcGVjdCB0aGUgZG9tYWluJ3MgaXNf
cHJpdmlsZWdlZCBmaWVsZCwgYW5kIHNlbGVjdCB0aGUgYXBwcm9wcmlhdGUNCj4gZGVmYXVsdCBs
YWJlbCwgZG9tMF90IG9yIGRvbVVfdCwgZm9yIHRoZSBkb21haW4uIFRoZSBsb2dpYyBmb3INCj4g
Zmxhc2tfZG9tYWluX2NyZWF0ZSgpIHdhcyBjaGFuZ2VkIHRvIGFsbG93IHRoZSBpbmNvbWluZyBz
aWQgdG8gb3ZlcnJpZGUgdGhlDQo+IGRlZmF1bHQgbGFiZWwuDQo+IA0KPiBUaGUgYmFzZSBwb2xp
Y3kgd2FzIGFkanVzdGVkIHRvIGFsbG93IHRoZSBpZGxlIGRvbWFpbiB1bmRlciB0aGUgeGVuYm9v
dF90DQo+IGNvbnRleHQgdG8gYmUgYWJsZSB0byBjb25zdHJ1Y3QgZG9tYWlucyBvZiBib3RoIHR5
cGVzLCBkb20wIGFuZCBkb21VLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFAuIFNtaXRo
IDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPg0KDQpTYW1lIGFzIHdoYXQgSmFuIGhhcyBz
YWlkLCBJIGRvbid0IHRoaW5rIEkgYW0gcXVhbGlmaWVkIHRvIHByb3Blcmx5IHJldmlldw0KdGhl
IHNlcmllcywgYnV0IEkgZGlkIHJ1biBhIGNvbXBpbGUgYW5kIHJ1bnRpbWUgdGVzdCBvbiBBcm02
NCBwbGF0Zm9ybSB3aXRoDQp0aGUgeHNtIGFuZCBmbGFzayBlbmFibGVkIGFuZCBpdCBsb29rcyBs
aWtlIGV2ZXJ5dGhpbmcgaXMgZmluZS4NCg0KSGVuY2UgKGFsc28gZm9yIHRoZSB3aG9sZSBzZXJp
ZXMpOg0KVGVzdGVkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCj4gLS0t
DQo+ICB0b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy9kb20wLnRlIHwgIDMgKysrDQo+ICB0b29s
cy9mbGFzay9wb2xpY3kvbW9kdWxlcy9kb21VLnRlIHwgIDMgKysrDQo+ICB4ZW4veHNtL2ZsYXNr
L2hvb2tzLmMgICAgICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
DQo+ICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0K
DQo=

