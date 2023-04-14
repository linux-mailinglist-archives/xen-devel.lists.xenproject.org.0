Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2F46E19D8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 03:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521009.809238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn8an-0006i3-PX; Fri, 14 Apr 2023 01:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521009.809238; Fri, 14 Apr 2023 01:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn8an-0006g3-JM; Fri, 14 Apr 2023 01:51:13 +0000
Received: by outflank-mailman (input) for mailman id 521009;
 Fri, 14 Apr 2023 01:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eyEl=AF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pn8al-0006fx-Qm
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 01:51:11 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2d5f50b-da66-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 03:51:08 +0200 (CEST)
Received: from DU2PR04CA0263.eurprd04.prod.outlook.com (2603:10a6:10:28e::28)
 by AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 01:51:05 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::7c) by DU2PR04CA0263.outlook.office365.com
 (2603:10a6:10:28e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 01:51:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Fri, 14 Apr 2023 01:51:04 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Fri, 14 Apr 2023 01:51:04 +0000
Received: from e074ea808b3c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 00F90D79-7CBD-4E3E-8915-4F29574BB6D5.1; 
 Fri, 14 Apr 2023 01:50:58 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e074ea808b3c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Apr 2023 01:50:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB6354.eurprd08.prod.outlook.com (2603:10a6:20b:367::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 01:50:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 01:50:46 +0000
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
X-Inumbo-ID: d2d5f50b-da66-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0dmwobpMlHVyKGJ4RopLZFrcAb9z2gbFSUg5A+kZq8=;
 b=r8XzEUjpKvQ2Sr5adC968nFD6E+vElDdc+fQJ8uXuVdDWAobTI5TpDRXvwZtzQb3QdsSMkLTZW/VsBIfyn4zYlVlFX7Q3ijO/eGfPiiu2zyj9L9TVnrfJT1S6Iw/OmjJ0cTXN7x0H3TVOER+1fdax6jRaDYRcfA7RTA8hjnIaCE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxAxwgyYdWGjNAr/KqvArb3R/HiCqL3tqQu9U05MsJt9qALETe8epFwUcWY8c+B8jgMjhCLBeEHHBc5llxreKsTolKBavWGl/fYGZqEX72ZcOjVjUHEaLG0IQ46hO/67zL7ZDnaI27+OuxTRGIJnbQ+2RC32lF1Do8sB9d5CbhpKe6s0gz0B276zrKim4O342ufjOReRV6pH5Y6P3i8bZE/bfewXCf/Y01muSYcvZSHQKiKObY7Im2eie8kKlpXEm1ajkbcFFric650wStVAxBdpy7ShRlqLnS4YvTOAkfR0LRnmnhbI4NvKVB7xjq5Jge1W0AK6oEc9qLxHwzNbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0dmwobpMlHVyKGJ4RopLZFrcAb9z2gbFSUg5A+kZq8=;
 b=EeUPKXccVowS5jzkRYbk3M9MfqdAslyt9LThgi+qV4X620mPzP7xRp34U96FB67zPjd7ruTv8U0ISO1g2FRpU9bhCmXZIxpr9qJjkgxkh29EbFU7aW/KKkgXaVqf0lyjrcBaE5oC8wqH7eVD9jMTALfpE0AKYdNiO1Pys2pOAX4s6pXjoTEWMp7CThfVCj0GC/P0B/VgbK8skrN01jffub/UfHvcFU1E64irLP5u9cqcSLL14F6eWB5I6xOmfxvfCfQBwTH87955gwxZY3vOh6QJOlHSdhKdVflMwmfV1RGaAOGLFWdtsjvdZ+bdlU4gbeERKpphsO1r56pjOOAafg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0dmwobpMlHVyKGJ4RopLZFrcAb9z2gbFSUg5A+kZq8=;
 b=r8XzEUjpKvQ2Sr5adC968nFD6E+vElDdc+fQJ8uXuVdDWAobTI5TpDRXvwZtzQb3QdsSMkLTZW/VsBIfyn4zYlVlFX7Q3ijO/eGfPiiu2zyj9L9TVnrfJT1S6Iw/OmjJ0cTXN7x0H3TVOER+1fdax6jRaDYRcfA7RTA8hjnIaCE=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [XEN][PATCH v5 11/17] asm/smp.h: Fix circular dependency for
 device_tree.h and rwlock.h
Thread-Topic: [XEN][PATCH v5 11/17] asm/smp.h: Fix circular dependency for
 device_tree.h and rwlock.h
Thread-Index: AQHZbKpEgTyA0CRuYk66qjVY5D36Ua8qDYcw
Date: Fri, 14 Apr 2023 01:50:45 +0000
Message-ID:
 <AS8PR08MB79918B9918132341F547A22092999@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-12-vikram.garhwal@amd.com>
In-Reply-To: <20230411191636.26926-12-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EEFA672FD9D738488657FB1F1191A2F1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB6354:EE_|DBAEUR03FT053:EE_|AS8PR08MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a62ec8-2f7b-481d-eb8f-08db3c8ab52f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r2pNb9kKRMlXcx4lHZNIvkjviZLLOZ2UhOJqSEpqybuXStSDdXie8QZtPTKiP1jUv5S43gjmLATGzo6B15JXBD/1DPgOu/nNGs3cANafe7eet7xtM8xBAPzIjLphNpfCNm7cGUJVbb7APmG5vapUuGZOs3m5InLqpOLtlbMF/KmQrKGSemnlLhoGph3VVbkTNjLNB4HuxnXyADAyaqao/mPWoAgjibP5jZsyMTeU7+/9zq9rL4y6XAKHU/4slUZ/bi7iyO+I7U377Vd9Ya0cxywxWFlzy/fIBtnOsAZg5E5Px93p9hNf5NDT4i8zgdg9M3I/jCUOMmu7yRSg0lUhBKsC5I4//Y+GNeISvzSVqJwfn00F40Z3/kcupuHolJdrClFz6YQQ3KwNuhR4zBs8jtWrw5N8v8eE/BYBvENPSdWZUrdyjnX3TGIFZ7n/dUSfqrVgP2GI5ZGrEVzv1fENRL2kDf7UqPvcqDaCCofWOdVL15pNH2yOrXxpG/WVTpV27G0mejqDE6hZdEE9VkKI5yIdQ3Vxr3rhQKI3lcbrhLAqZa9NkvMhKrXWTwRTtJNrKYDMlk3/hHoD3LNMZkO4Bw1sLvluHmxBaVFeMydJHbPl0OK+PLkHi/zOa7OW8F0d
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(33656002)(55016003)(478600001)(54906003)(110136005)(7696005)(71200400001)(122000001)(41300700001)(8676002)(8936002)(38100700002)(66556008)(66946007)(316002)(66476007)(4326008)(64756008)(66446008)(83380400001)(76116006)(9686003)(6506007)(26005)(186003)(86362001)(52536014)(4744005)(2906002)(38070700005)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6354
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d949f1d-fa86-400a-e77e-08db3c8aa9e6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HXV+i+wy95Mjja1m1HgSYJf0R+hQSAvvPZh/QP/GHg1rvbMfoCEVG/rAL4TRmyD5R/vwekMgpi+ylCZZkd0dz0cKiav5si3URuvHeq0B87i42KSUOABFYHSBSPqkgPupNX9Zi6yqLLhzsU8oKTY2xPiHzXF7ateoFUZL7/8rH/gUU4CKAbtNKUMnmbBgFS5L5F3aoDLJI7E1pF7cjlurs26Iq+gyZHa5j8wMrfTmFyDnygfZa6v2X1U5RpUBIDtDa3XJupri2G856CPuc5wejS1hpSjUzMWgUl6lvXgTMdvAqczLNMdXhOBE2VIaT2i3UMiHk75pACMd2sTQwkqZlwYSbI1V0xEFOWfdh2kqCXlVn6q8SckIhQPwpInBHkE/PNF5Hiz2KQxToD8O25m+CP8dJBj4RYs6j26rdpqn5QF+BHoMOXxbJa1xZL3gq61ZdSyepTOnG5N1FXLOyh5Sq6ErpWN7/Fdk66WPEBEwmae+taeDKzkNDxkoww9aevYUvaul1lgMJbYarVIVulrJHXmDgxIMgPgVDfbpWyYaQiM1Cf5Lw+k7mItWs+5vAtmCHsNisQwauB0OZUOTbvsHaNh1KGxtVoHiNkzdBWdNtuxWoUIvsMDIVQRSxMBKbLrc+v9JsxkeZABqax6SKLqYdFL48ld8JGHCanfCcdLMacEBItqxiB67y6+Vd7Q+5WscQ9pyU73RnpA6DMWghtvFKw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(33656002)(40460700003)(316002)(41300700001)(9686003)(26005)(81166007)(6506007)(7696005)(186003)(86362001)(47076005)(107886003)(356005)(82310400005)(36860700001)(336012)(83380400001)(82740400003)(55016003)(40480700001)(110136005)(4326008)(54906003)(70586007)(8676002)(70206006)(8936002)(5660300002)(2906002)(4744005)(52536014)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 01:51:04.6027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a62ec8-2f7b-481d-eb8f-08db3c8ab52f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7696

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v5 11/17] asm/smp.h: Fix circular dependency for
> device_tree.h and rwlock.h
>=20
> Dynamic programming ops will modify the dt_host and there might be other
> function which are browsing the dt_host at the same time. To avoid the ra=
ce
> conditions, adding rwlock for browsing the dt_host. But adding rwlock in
> device_tree.h causes following circular dependency:
>     device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h
>=20
> To fix this, removed the "#include <xen/device_tree.h> and forward declar=
ed
> "struct dt_device_node".
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

