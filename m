Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCD36E0C7D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 13:32:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520646.808460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvAu-0008Pd-7r; Thu, 13 Apr 2023 11:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520646.808460; Thu, 13 Apr 2023 11:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvAu-0008Nf-4H; Thu, 13 Apr 2023 11:31:36 +0000
Received: by outflank-mailman (input) for mailman id 520646;
 Thu, 13 Apr 2023 11:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmvAt-0008NZ-AU
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 11:31:35 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdaec907-d9ee-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 13:31:33 +0200 (CEST)
Received: from DB3PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:8::49) by
 AS2PR08MB8310.eurprd08.prod.outlook.com (2603:10a6:20b:555::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.38; Thu, 13 Apr 2023 11:31:27 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::8b) by DB3PR08CA0036.outlook.office365.com
 (2603:10a6:8::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.29 via Frontend
 Transport; Thu, 13 Apr 2023 11:31:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Thu, 13 Apr 2023 11:31:27 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Thu, 13 Apr 2023 11:31:27 +0000
Received: from f99560a82f49.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8043CDE-EBAF-40DB-BC5E-C5BFE48B29EE.1; 
 Thu, 13 Apr 2023 11:31:16 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f99560a82f49.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 11:31:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8331.eurprd08.prod.outlook.com (2603:10a6:150:86::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:31:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 11:31:11 +0000
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
X-Inumbo-ID: bdaec907-d9ee-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agRwrRlllO1RgHAX9L5poJQYfyokSC1xSJJLk9b08DY=;
 b=IHACNtRS/xQTn7IeqS7UF1Xv6ooMq1KxTGgkdoP9M4XR/iCKcGeubiAVJl9o3jYWmqIAVPEiLUhJGiz+4P6+3He9j7eb4eTPBmDTFDBgaHoORQpcXXqQGcYZ4LDHa3ldr9dsg3VZysmQpWRFCW3DATghLxrbb6Ot0N6q3D3i5mE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao0EgnI9VQ7baSq1IquIPFnl3f2pvCy5EM8czhuyHb2pWyVWon2KiuNhrVL1gIFV+8hZeLvM1EYeGApMrqX2QzT6hBG+yaNvGyY5byRWR4GWm3UHMjXmq9I3O1/N4ZESeUCP9xRZYHC+LC+nWQFjChxlLYQt0nSFWXBFbL+bdI9tXc+aBefn/zBw0/BTQoOw/UJV9CuzIsTs6q67GwR5YkIfZdilfYsk1k1a5LnaEeweRsAHn8Ne2SHKbwbYn5Mou9NQyhKBuIWi9SG01oCADrMvEeOHmmLrz7Mx/XSByd2mYcLq7hBorDf9d7fjc6iYr3EDJDt41hvQ/ZUpE2Lfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agRwrRlllO1RgHAX9L5poJQYfyokSC1xSJJLk9b08DY=;
 b=ibV+hGLq9XrESRf4wJ3WduIE61j8QrCe5pfN/A4each+J9zPaQheNiVp3atHAmOON+bht5qTZhlJx5YiuVbuuqffCcCwQn7T1nb7gwi1D3JqnSfLpdyimJFDNKCGtKZIEGvb9e2gfsJiOui2oOLHixB2050FM+xC5LpP+mAtQSyDzWXhXfuP/hP22ibCfDnfosTqrrkQHSq6MO41YjHRJ6Tu8rplIOztR1ZxHQnSf+InUgHmWSmQBIPM6Q/YqFQ9YJM2gfugQSuSRM8Ga+WVeXkRMJccIbHr4hUSFMyWUl19rNpRPGDi/l2JnApExNNeE57xZk2hqS/6I7hEZrL4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agRwrRlllO1RgHAX9L5poJQYfyokSC1xSJJLk9b08DY=;
 b=IHACNtRS/xQTn7IeqS7UF1Xv6ooMq1KxTGgkdoP9M4XR/iCKcGeubiAVJl9o3jYWmqIAVPEiLUhJGiz+4P6+3He9j7eb4eTPBmDTFDBgaHoORQpcXXqQGcYZ4LDHa3ldr9dsg3VZysmQpWRFCW3DATghLxrbb6Ot0N6q3D3i5mE=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: RE: [XEN PATCH v8 14/22] xen/arm: move regpair_to_uint64() and
 uint64_to_regpair() to regs.h
Thread-Topic: [XEN PATCH v8 14/22] xen/arm: move regpair_to_uint64() and
 uint64_to_regpair() to regs.h
Thread-Index: AQHZbdhGMHWAhk4AakOJfz+iMxVrZa8pGvlA
Date: Thu, 13 Apr 2023 11:31:11 +0000
Message-ID:
 <AS8PR08MB799105F5A90ECF0085BA63A492989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-15-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-15-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 363F3F4C22C48D45998409FFDB132FB8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8331:EE_|DBAEUR03FT052:EE_|AS2PR08MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: df56719b-03a1-4bc7-4105-08db3c129ec2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jgzaqY0KqXRIWSnRBw0lfEFtMwmjrtpNYVEmhmUDeVQx4IRlC4tGJM12rYOOGQRBQvYdMXQgd2/y8FiZlTOc05/oBeGnmpXIKzujGP+5i6AThuZAsleo7Yf2CsnK9c0xvusCozRhg2ICdPNTAP/IMOntSqi6mZ9JL3JsWZOCaIpNf2CygnDrIVjuA5nNhZDtZFWjXPULN0o+bJmJrwcRut3074YbR6xfcq7k9ic436k3/qHvvD0tKsk8AFU1T12ROUFDwkep7YPT1qZOe+LNPgOunRzmIMBu6QeUoJ+Zu0Oz8qLx/39SeiXglmzMPB+MW9KzSJYpjoNrQgbXvyo5HajBjV/8BWHLGU0SPBRbxEhCZX+g5rf4MhkDyKDQ3MA/GvxBhIEPUFBWbbFdCrGAwFkIhTTG5JdtzpVqHYkjUcSGBDM4pbu4+RcK2kYyj/nJ1DQRsyv4Bmah17Y56UKbUE2hBHOlrAAlNyagtsggN+vyHFi2lgR+93usDoO+EYjGDHKz8isyMRLAyzTpbQtv6kCBuvEOkxElGm8jyEZ/uB9U8CXnr0KlsESZZDOPchJrWKdWNpSgHDfk7tIfwVCVdQtEXwTJkndQiVnuiVUQiHRJ35/Kl3u+PHbSwE/lz0LJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(38100700002)(5660300002)(4744005)(2906002)(52536014)(38070700005)(55016003)(86362001)(316002)(8936002)(8676002)(4326008)(122000001)(64756008)(66556008)(66446008)(66946007)(66476007)(41300700001)(83380400001)(76116006)(26005)(186003)(110136005)(9686003)(6506007)(478600001)(7696005)(54906003)(71200400001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8331
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c8d7118-a72e-4d7e-38c6-08db3c129515
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kvM8EmC/8UI2f4+YzVniItzuv4Zbn87fdUXrbZWC6IOqqB6ZBC1EheA9bXTXSBzaTDw5QHdCp0w0c5Y/cB1qD0yvmHwDgYFmwj6hpKraPRiJfshYscRZJBNAgoDPYCtHBrAS1dVbJwJ08CW4HLQU6bYbwl0J1lT9u0sj5m25vhaYTrC+6ZdBLVulsMpN3lJZ2rdmWpNUfQn9cLkp+kj+vPOSh4ymAa16ymNnrcH2Qxpxy+cWhYWjDMbi2JPUXIiIg7DVQev2XIPDygLey0VKCMPdLE0s0+jErW1D9yE8/SzFdSpfOrFgcXR/PFSBq34fsnRCoxu0ZwYpCrKFXP22nDsvBmV6nVRxOywJhGfJlTKLMxcrzLkNclxtgQwk+AFS0bAnuvjV8MzqmsFjWPFhZsck7XvG2cQ5cDJkuJX+704ZF8e/A6x8d2/oYwt76LYfmV3YsnsGfXThpJeW2yhAO/BJisfclE30U3m1eanrjbQrpWZo9hutows9sR0X1H1odJ3K8OoaEIv/zdsV707swljCXw3eoUY5lAIiPclbKCCc25YD+ji/cTXuZOxuTW8JSqxyMH0l53G8SCW46EQwLMCIEXsbxgaI1R4azEsN9EO8TByT5rPBK0B4a5FNhIfEUQEO2jGaffo24I2UvUxnQGETllGP7P+pzuAAfGa2P2uMl5VFIHmqEWNvxtq7jbd/odvnHF6aNW0HzmnMtcwoXw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(7696005)(8676002)(70206006)(4326008)(54906003)(478600001)(70586007)(41300700001)(110136005)(316002)(33656002)(86362001)(336012)(9686003)(6506007)(26005)(47076005)(83380400001)(4744005)(40480700001)(82310400005)(5660300002)(36860700001)(55016003)(8936002)(186003)(52536014)(81166007)(2906002)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 11:31:27.3509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df56719b-03a1-4bc7-4105-08db3c129ec2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8310

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 14/22] xen/arm: move regpair_to_uint64() and
> uint64_to_regpair() to regs.h
>=20
> Moves the two helper functions regpair_to_uint64() and
> uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
> specific regs.h. This enables reuse of these functions in the FF-A
> mediator in a subsequent patch.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

