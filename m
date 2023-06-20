Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22997361F7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 05:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551379.860893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRho-0005BN-2s; Tue, 20 Jun 2023 03:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551379.860893; Tue, 20 Jun 2023 03:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRhn-00058D-WB; Tue, 20 Jun 2023 03:06:56 +0000
Received: by outflank-mailman (input) for mailman id 551379;
 Tue, 20 Jun 2023 03:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+cFY=CI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qBRhn-000587-1d
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 03:06:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 806e4833-0f17-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 05:06:51 +0200 (CEST)
Received: from DB6P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::14) by
 GV1PR08MB8156.eurprd08.prod.outlook.com (2603:10a6:150:90::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.37; Tue, 20 Jun 2023 03:06:47 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::c7) by DB6P195CA0004.outlook.office365.com
 (2603:10a6:4:cb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35 via Frontend
 Transport; Tue, 20 Jun 2023 03:06:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 03:06:46 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Tue, 20 Jun 2023 03:06:46 +0000
Received: from cd7d0006a7f8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0E782EA0-2FA1-441B-958D-9E135262CEDD.1; 
 Tue, 20 Jun 2023 03:06:41 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd7d0006a7f8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 03:06:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9142.eurprd08.prod.outlook.com (2603:10a6:10:3fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:06:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 03:06:39 +0000
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
X-Inumbo-ID: 806e4833-0f17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iP5NrzmbrQmiTxSeJcYrmBjGHBt8szUrwWyfRndvOv0=;
 b=nYqA2jUlOWvJVnkLk+c49xJT728FrluIlPSAK2QnnqquKNb+KF0RLV1KI+HRhgMF2FT2IlvA/Y5n7Zhug/BJwplD6zDrqBKx567PLufGlfAZI2vObvPfnuzkbRqMsfknfjkAL2Ysd0FFCy9NJ/AVoieiwRff0gTzfrvCDOD3mRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWDcyXOJ4lRHdO6Zmr8sSZwaO2OwfHyTOhuTOggRTT9Cx2KRqL4rKclUZ6g6trrSLnwXcBUG66kLqPYi0vlK8VRjFoL3gg3jEvTv75VSxSCbhGQeigr/YU7NNjGp04k2vrHxg2ge+o7/szCph3i0nYcBD49VW8S5JE0u957uTwrg50rim/cj1a+D8LTTFTcdIZZmdq2XcpPoxRJhF6tmemIdndModwFgIVtSP28VHPxr2kvmJGM80gxnEh7v9vOLcK5ZiinH1oa4BfV0iJf4khDIAlE0ioiUbDhzQD+scJLvsTXwGtj7oEhNGUx79g9ywwgRunhDTLqKrvtbIKUgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP5NrzmbrQmiTxSeJcYrmBjGHBt8szUrwWyfRndvOv0=;
 b=QzSD+bYAQstER6SrPINoZz/nKTIMKYlqo5IH2Aan398jlFgknHORPj9iZZsBqOo6Vhqf3uQvrUL1w8jrANbmoum9+a0pP5NTLmCoRVoz+khL6R9NHCUbh/2OtcwJt3rzQrTjBDdQ9Na4y/RKj0lFYzbZliXXhMjzFue0/7oB4D4FpQPDmksbRDXAtHA+3cGbEKMMVeJqoZmhJnlxuUZpMI508lh3OeReJDaVUAedMnQVuW41xheNnjLkY0dOvu1Bjhmt5/PCFFX1vHidcjETkY84lhyqxQLrez6GuGfOc551LC2ZKm+wC0xbPp5LmdyfVK8yMEhxZn1NyVU0gtCVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iP5NrzmbrQmiTxSeJcYrmBjGHBt8szUrwWyfRndvOv0=;
 b=nYqA2jUlOWvJVnkLk+c49xJT728FrluIlPSAK2QnnqquKNb+KF0RLV1KI+HRhgMF2FT2IlvA/Y5n7Zhug/BJwplD6zDrqBKx567PLufGlfAZI2vObvPfnuzkbRqMsfknfjkAL2Ysd0FFCy9NJ/AVoieiwRff0gTzfrvCDOD3mRw=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/7] xen/arm32: head: Add missing isb in setup_fixmap()
Thread-Topic: [PATCH 1/7] xen/arm32: head: Add missing isb in setup_fixmap()
Thread-Index: AQHZos+2ltfg5NgjVEuuwuFzD+8iLa+S1BNw
Date: Tue, 20 Jun 2023 03:06:39 +0000
Message-ID:
 <AS8PR08MB79914D67845C8899218F9785925CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-2-julien@xen.org>
In-Reply-To: <20230619170115.81398-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DCB63A26EF53E943A4FEF1AAE9041E62.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9142:EE_|DBAEUR03FT036:EE_|GV1PR08MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: c720c7d3-914e-4851-f56c-08db713b623a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PARMrAmwt3BpXxDRG1r/N0A2XDjHPtgnEAoOvWaV6CX/Bpm8GSFUeTjG1XIAgLrp7RI2AnqTbh4KCPtOfmqafOw3o5xr0PC3RB5/6RDMuWpRvuk2GK1CM4Mo5PD8HUlsa8bGMh8N57gcUtVk9t/15OWujnnvSJM+9ESkkkSuFI5BFsU5IVnzxZS+aCYZDWzuF3DSjdXJNc/d6bvzqdrYBr1sOlLDz1HSPGYQUvwSoHX2YXGyScrmEmQfIrZiLyRLYE4NvA8SKnXlHPSw27e13Umm9LjVLEbaXGbgYPfAtBtVevgIefxjo2Hk77pr9cbxlTzYUvNKSSJJYZCjKZ4FCi1i+ZtRpyRmQozzMin7F3Pv1NttIWXP5xa3zB5TIWFQOnzU+EX63+4lay9bWIMRYCL4I4c5PGoYEBx9LYvHzU/bKuQjdz47M4zDShQNFKSOVhUMVKMs/o8J6t4pvqY6IE6OWzEf8c5nFIv3wEwGnTPG7lU/3rkqjPRNhYiWWd/Ob6mN8ifeku8kN0AIYGm8IsYie5bpfXaRomoblC1fSTwbyG8vdwXkeHX7idt46egtd1zbfMvAweLBankQxXPSVD1fDUbj57gNs1c3pJYv9qBq7gTgxls4MfrGnhUqT6IV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(71200400001)(7696005)(478600001)(33656002)(83380400001)(186003)(9686003)(6506007)(26005)(38100700002)(38070700005)(86362001)(122000001)(55016003)(8936002)(52536014)(8676002)(5660300002)(316002)(4326008)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51ad6f92-650b-4b25-c087-08db713b5e07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	82xnroAgiAkmQYZsl15I7Ae9qQJSxYKjfiaKFMLpvMdlFTVsNKq4FDg1YJ2Xk8rpP7fpUcI9shL/amyHa8/nAELpHmeJTwa7QohcJzyGBm870TN5VKuaJIPLqB6DGxQMOCupF+QBuxusdfAARLgfux8dc21KVwWAHJdiy+pIxnSlg4qfux5c4cX6O/UNAgqiof2kicc0Ksiby0An3niTOY3+LfcZFuYjSu9zT8aPSbS15tbWNKvRhsgfaVkHOSJFAljhvHS3Osvdu6WbEOiQQugxFnO92u/ghGUlWDmpAT/wKYRFjCPlaUdcppagJoUQmtW+aCotRjBHieIwd+JdJiOrBw+Rbaa52HUmTlyTDpKSR2EDnpakeN0DQn2uZq5A44RxlDGcIYq+oySUP3Nd65gPlQs7Cls+YnLXlqvzYL1Fg1l61QWHustb/nRtOpzAs2xzmBkOEjqUVERFdQNj0NbRJJhe9HnPm6IbhZhgkmT+j7jbWwNvc8NAx8ym/vKndaOZXlNKyqpstrwZvfAS6KU3UqowD1Jnw93xjk6XMOVdq8RaP1Tsvi+5f5RKGSyyKkJUtARJ1QhXwlFYrSXf8yiGqpTHHb6HmeRZX5VlenVVnJP0lk/jHqojrjQVnCBSj91gVQc/lsBCHLV9GBiJzsN2icm6KmyFCC3M6Jd8tiGeeUppJBONwGGhAjmI85Mx7Tc3mX1GmcEB7cnq/T4Pq05broGDxuO5uNtWXZftRD8+f8eGaa76h26bCHU4b9Se
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(36840700001)(40470700004)(46966006)(8676002)(8936002)(82740400003)(356005)(5660300002)(81166007)(52536014)(26005)(9686003)(6506007)(107886003)(186003)(7696005)(33656002)(40480700001)(86362001)(55016003)(36860700001)(47076005)(83380400001)(336012)(40460700003)(478600001)(110136005)(54906003)(41300700001)(316002)(4326008)(70206006)(70586007)(2906002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 03:06:46.8097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c720c7d3-914e-4851-f56c-08db713b623a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8156

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 1/7] xen/arm32: head: Add missing isb in setup_fixmap()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm (ARM DDI 0406C.d A3.8.3):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> In setup_fixmap(), we write the fixmap area and may be used soon after,
> for instance, to write to the UART. IOW, there could be hardware
> translation table access. So we need to ensure the 'dsb' has completed
> before continuing. Therefore add an 'isb'.
>=20
> Fixes: e79999e587d7 ("xen/arm32: head: Remove 1:1 mapping as soon as it i=
s
> not used")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also tested this patch on top of today's staging by our internal CI, w=
hich
includes the FVP arm32 mode and qemu-arm32. Our CI says this patch looks
good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

