Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC315A5D9A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 10:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394862.634436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSwC1-0002qb-1k; Tue, 30 Aug 2022 08:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394862.634436; Tue, 30 Aug 2022 08:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSwC0-0002n6-TD; Tue, 30 Aug 2022 08:01:52 +0000
Received: by outflank-mailman (input) for mailman id 394862;
 Tue, 30 Aug 2022 08:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y69e=ZC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oSwBy-0002n0-Fd
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 08:01:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2065.outbound.protection.outlook.com [40.107.104.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffede73a-2839-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 10:01:49 +0200 (CEST)
Received: from DB9PR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::11) by AM0PR08MB4401.eurprd08.prod.outlook.com
 (2603:10a6:208:13a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Tue, 30 Aug
 2022 08:00:16 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::c6) by DB9PR01CA0006.outlook.office365.com
 (2603:10a6:10:1d8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Tue, 30 Aug 2022 08:00:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 08:00:15 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Tue, 30 Aug 2022 08:00:15 +0000
Received: from f484d1f4e0d0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E47EC250-098A-4D0D-9C01-0DB95ACAAB4B.1; 
 Tue, 30 Aug 2022 08:00:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f484d1f4e0d0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Aug 2022 08:00:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9830.eurprd08.prod.outlook.com (2603:10a6:102:2e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 30 Aug
 2022 08:00:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 08:00:05 +0000
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
X-Inumbo-ID: ffede73a-2839-11ed-a60c-1f1ba7de4fb0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HZVObzAk4/yGUHoE9ezZF3/x1mDgyNb9MWi6jTPrl8mmAiawEAgXjcvlXzVy87Y19GVSheGxNDROyS+XVJ2DPLutDSmEyvKNdhHYFXtU+BcmzMSH0DIkJ2tvU+5BKp72HAupqTEU0lna54SpZQaNC2S/C03KE4Qxx4E1Yjl/fP2zz2m4YZKDJbJRBQyEwxcKDRPLlxQrMQ9Q17QW2E9lrxcVaXA+HkDtL6yLzxRM4qBcvdyjJIRTVf9S7ajrauEMbJCeBpSrrNSKf1Qxe4xSnSvYyVaReWdEwwnKTL+nnw5mWWE2LoLHRigX5oHwAwaApeubSgVUeo584DuuF0Fw8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKXy+pqv6HZX8MVgwlffMbgObvTaFF30iGc17egXUD4=;
 b=AuWBJRSFB1AyISU44Aak6zhMOGb3w2i+de3hVLIn7AAnNLFLZgEJZJZv9SmziKc2V/6t9YdDX4pwwUe1bO7T+Rgqv/Ah0fYMnzm3hFx2MzEPJM8zUUXIyHv1UDXoB6maTbIQ8uk3DEPjUz8LvHXJUCxfMcTxrZiJkTo6PWT3IIfI7Y+0gjOuMOpQzHgn8LDNievoWm+lu6C+oOHzsDGuf168Tf0Ioln6tnER8QzIE2l67qDXRLeMkVgtToxkUba3wrfdrcl5aMD3CdPUH3L5JmPKNuqKNEk8LC35FgftWrM5Gzd7H7AaZWrhaOVkqi9+l5/XN7qYweuQlt5BGhJHaw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKXy+pqv6HZX8MVgwlffMbgObvTaFF30iGc17egXUD4=;
 b=EeAIhrOo4OEkIKmWviOgI01/sjHVYYDz3LrsNdoaMUCT/Ho1YcS8TUrUurZ7pbaKtVRTSuHbIXLnpqr/x6H4rLwrwD+GUccMaGAeIz9Z9G71pySiYO7p/GWbwWy5bmtv5tYLHCLwX+jA8B3+KnibgOaEtY07Oz5xbzteT8P8nys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOp9/no6uokcKysISZkgOY9GsEqFZcVc9xSMyTEshwkmzmG/R2UCKVHfDlBqwBw/C23lr+uI7Osjw+eIy6r7rUCKuY2/mR16gxDAmTtDElB/RQml2N6nii152oSqkPE94hu2zh3VK3Ro26jz5oV33G4MZwwFgiohrlF+gk4+z95HjZaCicslariSyw87Ia2DeYI+OvMkBpr/BH8ujxnMHbxnprqqvtd+IsT7IdBfMyM9b+tHMX1DZhqdhef1PjUL3TTrMakltasV3hcMnrMD5WkkTS2Z24/n6RqL0QH+HDl90q5QYXloZbaeRJMeHvQUaHpJrPgXNmiL+7gGhKAByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKXy+pqv6HZX8MVgwlffMbgObvTaFF30iGc17egXUD4=;
 b=IE+bQjAReEYbYpVNW+NVULqaw+Fr3bcNIb7UbtaS2BnIdhznrgWMgx3XxWsVuDyCN/jMWjkCQ+GYfaMhNl9k12PZm7cjW/Vwvi664pcgjLxjo0Ap59plKQ60+Lr6zGtO4uitAPmfhUKuXZg0QXmraT8+pdjtfkq6itu5leHU++f0n68GwVEKX2z1CQ1LgcxcXMIHDuB81JrcPli9mYWt7g7f1zBqlW6Sv7UE7Z0qLsdgvgDQJ5Vt91vrv9S0okJv+fX2gkBqewJKfFCJNUOkYmTcjDdXbNsjJ95WlcX2me+F7fIWdjw9Sbphd2MAbxzBqZxzaKVks4GglLOC/fg0tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKXy+pqv6HZX8MVgwlffMbgObvTaFF30iGc17egXUD4=;
 b=EeAIhrOo4OEkIKmWviOgI01/sjHVYYDz3LrsNdoaMUCT/Ho1YcS8TUrUurZ7pbaKtVRTSuHbIXLnpqr/x6H4rLwrwD+GUccMaGAeIz9Z9G71pySiYO7p/GWbwWy5bmtv5tYLHCLwX+jA8B3+KnibgOaEtY07Oz5xbzteT8P8nys=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index: AQHYt4ugTfbCAM/WyEil7pMplK0r3q2/e0SAgAeAsxCAABaogIAAAyrg
Date: Tue, 30 Aug 2022 08:00:05 +0000
Message-ID:
 <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
In-Reply-To: <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F2442FDAC8BBCB4FB18DE47F6E9A4E72.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cd6873f0-04b9-4c2c-898b-08da8a5dac82
x-ms-traffictypediagnostic:
	PAWPR08MB9830:EE_|DBAEUR03FT050:EE_|AM0PR08MB4401:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 N1X8h+4GSa3tZtW9CSKOkXVSDCA1OSQQpUpk9E1ax4C5C7DJ4WuOGtuvWt6+g3YvprDl7C9U3JSI49WC5fsmpBd+nwW9L8bjp4ZdVDWK27XQo8ULHg8UEHF43ZX1mBhwCH3HcQHX1LqjynkjumLrlLW/sxPRUGuXrY5HOhnhzZ4b/mbJv6Qf7fiZk9vmY2mr6Mj5IuHeUedgSzS/65jB8QJdv+qJt2Mp0FEoCOqVFbScgwVnkgGgegFV+g0pyLN1fCiAFdTpj/7Vdok5zdTnnJcR/mfx9OrCswoCsVGoS+0JN9QQ4yMpeDcnrdVx4JnzKIxfS8wsM22Q1ure1xJi+2eSMvuBssqu76t16DGoEQBAMeSkZsFT782jnh0TXbApvgJFzh1lOyPOmaCs70hayt4cDwrjdShgTE3+toBVbqdntXFzqfOXvqvrq7nofj+1L1LdoOEN4BFzgHAEeieGQsv2tZ6amLAqAf8ATT2wgFvntgEar1T3T4CC7iHAZzo/mmZ77ADK83IeZGhsxMGXYvS8CJ1BT6Hf5RLm12ApZ/gxytJ15a3V1E2UzEthWh/+yJRp85QqQJ4YdIF+btPFN9SiN5wgTxKk8496WEny34pcZ9VdSWU1+r7U+xA3ueq397CQbKBnnIueWYUTMIqWKudijqHHXPcdu/w1IGfiiZOsJmtXt0jQCKHFKj/3E92PBp/LS5UE9DS3UU9m14z7MLDtf6TjZVq7pAN5Jnd7VxS+4N2wp14ik4EGn1Uq2kMsxMtAKfO5OblOuuwFTM6Jmg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(2906002)(38070700005)(9686003)(122000001)(26005)(316002)(71200400001)(110136005)(54906003)(38100700002)(52536014)(6506007)(8676002)(7696005)(8936002)(64756008)(76116006)(66446008)(41300700001)(83380400001)(186003)(4326008)(86362001)(66476007)(5660300002)(66556008)(478600001)(66946007)(33656002)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9830
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8dffbeb-ae31-41bf-1fb0-08da8a5da68f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p8J1v6DYDOfrDtpvc5MANczFHsJAhPgB3zYPqEn+adrAEFuFMyBmUbnkOe+ljiCd/O4YtH8zynXUZoqCdaU4HKSucq19n8sJcRpjliboXGxgTPyOuKUrFxRYXncBqnL6bf+/hmy5sTge1qyZprnnc/UDEij8AAqkh6Gs4ZtHbpuLk63+ues1n4Z3vu/MvRXBH5diyYUcAlnqRdbL3ae6/mD6txAiT5oowXwDPej2bVJGncr647goXjlrqp1NeKgUYZCY2fCWdzTVJbFrfy31dIcQwHggmv2d6tr/gk/sK0enrTpxvmQWoOcGqkA/80NSilE/eMB2foVInCwEc7pLkZgaZcPtob39PwQaj0WaKgT9MFgqdEODRVUQmJb5r4REmDBJj9i2HFuqfpptGk7Z7sldM5Sets+f82AM3z7U/W4GqT9Ko5MPM23Bvpza4V7/F56Z1ZMcG3QCWmEqu2ZP97VgIKxkVI6rLr5zWfzsdG98aSlD78Itx2ktyaC9JkOtROL8P9li81mHMFMmDgOftjAGbI/Cp5QOFiCewi5bIk8CRA6X5f8lYB9yVzU7nEgBaatL2iSLhnMYPQCyOBipQRFGkKoRT0GajxMiKMlY4yJhriy/o5Tsp0MKcgL4uJgjO1x9dtZ53t96Op2/wCGkrRfFi6982Vc8gXZnKK/9/cr8iZh0OzmDEOfN22kfOlE3kaDPpg1pnvuYbU7YGVirFq82PulFKbBhMEHVvm5sYlnjE2rq000lTPOPl3uZsrqaPekVBvw/APVN8hy6VOYptQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(40470700004)(36840700001)(36860700001)(186003)(47076005)(83380400001)(2906002)(110136005)(70206006)(316002)(54906003)(8676002)(5660300002)(4326008)(70586007)(86362001)(7696005)(107886003)(26005)(6506007)(478600001)(41300700001)(52536014)(8936002)(9686003)(81166007)(33656002)(82310400005)(40460700003)(336012)(40480700001)(55016003)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 08:00:15.7017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6873f0-04b9-4c2c-898b-08da8a5dac82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4401

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4+Pg0KPiA+PiBEaWQgeW91IGNvbnNp
ZGVyIHB1dHRpbmcgcmVzZXJ2ZWRfaGVhcCBpbnRvIGJvb3RpbmZvIHN0cnVjdHVyZT8NCj4gPg0K
PiA+IEFjdHVhbGx5IEkgZGlkLCBidXQgSSBzYXcgY3VycmVudCBib290aW5mbyBvbmx5IGNvbnRh
aW5zIHNvbWUgc3RydWN0cyBzbw0KPiA+IEkgd2FzIG5vdCBzdXJlIGlmIHRoaXMgaXMgdGhlIHBy
ZWZlcnJlZCB3YXksIGJ1dCBzaW5jZSB5b3UgYXJlIHJhaXNpbmcgdGhpcw0KPiA+IHF1ZXN0aW9u
LCBJIHdpbGwgZm9sbG93IHRoaXMgbWV0aG9kIGluIHYyLg0KPiBUaGlzIGlzIHdoYXQgSSB0aGlu
ayB3b3VsZCBiZSBiZXR0ZXIgYnV0IG1haW50YWluZXJzIHdpbGwgaGF2ZSBhIGRlY2lzaXZlIHZv
dGUuDQoNClRoZW4gbGV0J3Mgd2FpdCBmb3IgbW9yZSBpbnB1dCBmcm9tIG1haW50YWluZXJzLg0K
DQo+IA0KPiA+Pj4NCj4gPj4+IC0gICAgaWYgKCAhIGUgKQ0KPiA+Pj4gLSAgICAgICAgcGFuaWMo
Ik5vdCBub3QgZW5vdWdoIHNwYWNlIGZvciB4ZW5oZWFwXG4iKTsNCj4gPj4+ICsgICAgaWYgKCAh
IGUgfHwNCj4gPj4+ICsgICAgICAgICAoIHJlc2VydmVkX2hlYXAgJiYgcmVzZXJ2ZWRfaGVhcF9w
YWdlcyA8IDMyPDwoMjAtDQo+IFBBR0VfU0hJRlQpICkgKQ0KPiA+PiBJJ20gbm90IHN1cmUgYWJv
dXQgdGhpcy4gWW91IGFyZSBjaGVja2luZyBpZiB0aGUgc2l6ZSBvZiB0aGUgcmVzZXJ2ZWQgaGVh
cCBpcw0KPiA+PiBsZXNzIHRoYW4gMzJNQg0KPiA+PiBhbmQgdGhpcyBoYXMgbm90aGluZyB0byBk
byB3aXRoIHRoZSBmb2xsb3dpbmcgcGFuaWMgbWVzc2FnZS4NCj4gPg0KPiA+IEhtbW0sIEkgYW0g
bm90IHN1cmUgaWYgSSB1bmRlcnN0YW5kIHlvdXIgcXVlc3Rpb24gY29ycmVjdGx5LCBzbyBoZXJl
IHRoZXJlDQo+ID4gYXJlIGFjdHVhbGx5IDIgaXNzdWVzOg0KPiA+ICgxKSBUaGUgZG91YmxlIG5v
dCBpbiB0aGUgcGFuaWMgbWVzc2FnZS4NCj4gPiAoMikgVGhlIHNpemUgb2YgeGVuaGVhcC4NCj4g
Pg0KPiA+IElmIHlvdSBjaGVjayB0aGUgY29tbWVudCBvZiB0aGUgeGVuaGVhcCBjb25zdHJhaW50
cyBhYm92ZSwgb25lIHJ1bGUgb2YNCj4gdGhlDQo+ID4geGVuaGVhcCBzaXplIGlzIGl0ICJtdXN0
IGJlIGF0IGxlYXN0IDMyTSIuIElmIEkgYW0gbm90IG1pc3Rha2VuLCB3ZSBuZWVkIHRvDQo+ID4g
Zm9sbG93IHRoZSBzYW1lIHJ1bGUgd2l0aCB0aGUgcmVzZXJ2ZWQgaGVhcCBzZXR1cCwgc28gaGVy
ZSB3ZSBuZWVkIHRvDQo+IGNoZWNrDQo+ID4gdGhlIHNpemUgYW5kIGlmIDwzMk0gdGhlbiBwYW5p
Yy4NCj4gVGhpcyBpcyB0b3RhbGx5IGZpbmUuIFdoYXQgSSBtZWFuIGlzIHRoYXQgdGhlIGNoZWNr
IHlvdSBpbnRyb2R1Y2VkIGRvZXMgbm90DQo+IGNvcnJlc3BvbmQNCj4gdG8gdGhlIHBhbmljIG1l
c3NhZ2UgYmVsb3cuIEluIGNhc2Ugb2YgcmVzZXJ2ZWQgaGVhcCwgaXRzIHNpemUgaXMgc2VsZWN0
ZWQgYnkNCj4gdGhlIHVzZXIuDQo+ICJOb3QgZW5vdWdoIHNwYWNlIGZvciB4ZW5oZWFwIiBtZWFu
cyB0aGF0IHRoZXJlIGlzIG5vdCBlbm91Z2ggc3BhY2UgdG8gYmUNCj4gcmVzZXJ2ZWQgZm9yIGhl
YXAsDQo+IG1lYW5pbmcgaXRzIHNpemUgaXMgdG9vIGxhcmdlLiBCdXQgeW91ciBjaGVjayBpcyBh
Ym91dCBzaXplIGJlaW5nIHRvbyBzbWFsbC4NCg0KQWN0dWFsbHkgbXkgdW5kZXJzdGFuZGluZyBv
ZiAiTm90IGVub3VnaCBzcGFjZSBmb3IgeGVuaGVhcCIgaXMgeGVuaGVhcA0KaXMgdG9vIGxhcmdl
IHNvIHdlIG5lZWQgdG8gcmVzZXJ2ZSBtb3JlIHNwYWNlLCB3aGljaCBpcyBzbGlnaHRseSBkaWZm
ZXJlbnQgdGhhbg0KeW91ciBvcGluaW9uLiBCdXQgSSBhbSBub3QgdGhlIG5hdGl2ZSBzcGVha2Vy
IHNvIGl0IGlzIGhpZ2hseSBsaWtlbHkgdGhhdCBJIGFtDQptYWtpbmcgbWlzdGFrZXMuLi4NCg0K
SG93IGFib3V0IGNoYW5naW5nIHRoZSBwYW5pYyBtZXNzYWdlIHRvICJOb3QgZW5vdWdoIG1lbW9y
eSBmb3IgeGVuaGVhcCI/DQpUaGlzIHdvdWxkIHJlbW92ZSB0aGUgYW1iaWd1aXR5IGhlcmUgSU1I
Ty4NCg0KPiANCj4gPj4+ICsgICAgICogSWYgcmVzZXJ2ZWQgaGVhcCByZWdpb25zIGFyZSBwcm9w
ZXJseSBkZWZpbmVkLCAob25seSkgYWRkIHRoZXNlDQo+ID4+IHJlZ2lvbnMNCj4gPj4gSG93IGNh
biB5b3Ugc2F5IGF0IHRoaXMgc3RhZ2Ugd2hldGhlciB0aGUgcmVzZXJ2ZWQgaGVhcCByZWdpb25z
IGFyZQ0KPiBkZWZpbmVkDQo+ID4+IHByb3Blcmx5Pw0KPiA+DQo+ID4gQmVjYXVzZSBpZiB0aGUg
cmVzZXJ2ZWQgaGVhcCByZWdpb25zIGFyZSBub3QgcHJvcGVybHkgZGVmaW5lZCwgaW4gdGhlDQo+
IGRldmljZQ0KPiA+IHRyZWUgcGFyc2luZyBwaGFzZSB0aGUgZ2xvYmFsIHZhcmlhYmxlICJyZXNl
cnZlZF9oZWFwIiBjYW4gbmV2ZXIgYmUgdHJ1ZS4NCj4gPg0KPiA+IERpZCBJIHVuZGVyc3RhbmQg
eW91ciBxdWVzdGlvbiBjb3JyZWN0bHk/IE9yIG1heWJlIHdlIG5lZWQgdG8gY2hhbmdlIHRoZQ0K
PiA+IHdvcmRpbmcgaGVyZSBpbiB0aGUgY29tbWVudD8NCj4gDQo+IEZXSUNTLCByZXNlcnZlZF9o
ZWFwIHdpbGwgYmUgc2V0IHRvIHRydWUgZXZlbiBpZiBhIHVzZXIgZGVzY3JpYmVzIGFuIGVtcHR5
DQo+IHJlZ2lvbg0KPiBmb3IgcmVzZXJ2ZWQgaGVhcC4gVGhpcyBjYW5ub3QgYmUgY29uc2lkZXIg
YSBwcm9wZXJseSBkZWZpbmVkIHJlZ2lvbiBmb3IgYQ0KPiBoZWFwLg0KDQpPaCBnb29kIHBvaW50
LCB0aGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJIHdpbGwgY2hhbmdlIHRoZSBjb21t
ZW50cw0KaGVyZSB0byAiSWYgdGhlcmUgYXJlIG5vbi1lbXB0eSByZXNlcnZlZCBoZWFwIHJlZ2lv
bnMiLiBJIGFtIG5vdCBzdXJlIGlmIGFkZGluZw0KYW4gZW1wdHkgcmVnaW9uIGNoZWNrIGJlZm9y
ZSBzZXR0aW5nIHRoZSAicmVzZXJ2ZWRfaGVhcCIgd291bGQgYmUgYSBnb29kDQppZGVhLCBiZWNh
dXNlIGFkZGluZyBzdWNoIGNoZWNrIHdvdWxkIGFkZCBhbm90aGVyIGZvciBsb29wIHRvIGZpbmQg
YSBub24tZW1wdHkNCnJlc2VydmVkIGhlYXAgYmFuay4gV2hhdCBkbyB5b3UgdGhpbms/DQoNCktp
bmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IH5NaWNoYWwNCg==

