Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C96F63CC
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 06:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529531.823987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQAq-0006mo-Sj; Thu, 04 May 2023 04:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529531.823987; Thu, 04 May 2023 04:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQAq-0006kL-Pp; Thu, 04 May 2023 04:02:32 +0000
Received: by outflank-mailman (input) for mailman id 529531;
 Thu, 04 May 2023 04:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ABSM=AZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1puQAp-0006kD-Sl
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 04:02:31 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d103d32-ea30-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 06:02:29 +0200 (CEST)
Received: from AS9P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::19)
 by AS8PR08MB7718.eurprd08.prod.outlook.com (2603:10a6:20b:50a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25; Thu, 4 May
 2023 04:02:25 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::ee) by AS9P250CA0021.outlook.office365.com
 (2603:10a6:20b:532::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 04:02:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.21 via Frontend Transport; Thu, 4 May 2023 04:02:24 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Thu, 04 May 2023 04:02:24 +0000
Received: from 7b7f01d2abe7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD37423D-E1B3-498D-A885-44CB77E5BD62.1; 
 Thu, 04 May 2023 04:02:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b7f01d2abe7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 04:02:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB8079.eurprd08.prod.outlook.com (2603:10a6:10:385::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Thu, 4 May
 2023 04:02:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 04:02:12 +0000
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
X-Inumbo-ID: 7d103d32-ea30-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaxhynDBCTXoTSxI9Bm3w0rOkevBy3kSLJCJWr+icL4=;
 b=IRwSFvDzAgeDnR6J+MytlgvBsCqL6lf3vnFKbAb0PB5VtecbtO7oQJsIt3EEfK3K4IVhFhJDjLnb3T4aKWAyz6n14yF0JqyULws3LN9PMISBbvml4w2bP0Yyr4DxZXvV5IWrDmT+rnlBbtc1ydLiBDsmnjQxR/KMkNSkxaG9jmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhLDA9ktPq2qbTYeY6WxJxZiRrFFqqXN4z/8sryUytfp/AjOeCkmzJXqgJCJmspHo3G9npsebVwKm8FDtSIVDyNDhLcVCJFGdvUYlLoCa/zndqpv6YS49VBnRqzpXALkLihLgJLOwAAn7hFFKX2kVtj4XuE3GyqQV7aLQaa6j/oK2lYT6W0z1LHAH5Kdgbi2sin1F6IF9og0vTvUEMsbH0ZU8DjWwBPe3An7E+dA4RbLOibeBb5n7JpJJLf41IEIYFu7WslWCN9AmrAFSuGBr3t0e+q536nxM0TF/64R5+M47iOK8lZr1eCNQg9K/ZYKMs7NkxgKDLcYM6XI6FYA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaxhynDBCTXoTSxI9Bm3w0rOkevBy3kSLJCJWr+icL4=;
 b=JfwDmKb2yj2jFnKWYzQn5JLrFxY2F9aFiP4TjaNoR+x/5NWH/7sNiMzBA2gEKkpaJhkMW3j2MMFDt0R6s0Flxomxlm2Scd4Uyo9DzO74+GAePCe+VeeEPv1gVV+B7wB9JSXmXfmzBci/ah+w9pwUWFsKxsQqCGJ/lRTtdVcMeJQnQj8pmUBpDFm464EeYW2KPc7qpKrYc8jrixmzsfV4+NlM1sBB46aGutndhlppVukRZMvpyxv/elgks7GoGnCanCnd6EX3Tg3GEw41cfp/DOlySyROkhW6ITClQiwX/amCP5/ZletCnNMpeIXDfhOOi9QfiXEnINju5prCKQ3Yrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaxhynDBCTXoTSxI9Bm3w0rOkevBy3kSLJCJWr+icL4=;
 b=IRwSFvDzAgeDnR6J+MytlgvBsCqL6lf3vnFKbAb0PB5VtecbtO7oQJsIt3EEfK3K4IVhFhJDjLnb3T4aKWAyz6n14yF0JqyULws3LN9PMISBbvml4w2bP0Yyr4DxZXvV5IWrDmT+rnlBbtc1ydLiBDsmnjQxR/KMkNSkxaG9jmY=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: RE: [XEN][PATCH v6 03/19] common/device_tree: change
 __unflatten_device_tree() type
Thread-Topic: [XEN][PATCH v6 03/19] common/device_tree: change
 __unflatten_device_tree() type
Thread-Index: AQHZfU8eFkyMAUM1+keBcOFUYgl+f69Jf5iw
Date: Thu, 4 May 2023 04:02:12 +0000
Message-ID:
 <AS8PR08MB799161E2F76EB54D4BF0A78E926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-4-vikram.garhwal@amd.com>
In-Reply-To: <20230502233650.20121-4-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3B261B364574344BBB4AF7D4E5CF721A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB8079:EE_|AM7EUR03FT013:EE_|AS8PR08MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c2850d-fd5b-4c3a-ab3b-08db4c545e80
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2wKQiCXB3W9owXHSbAT01FTBYDAAR5an3buN8KAewWeHxsJVxIFdeHNEISZmn7+p1ca/gaa5bFjTewUmoWOiQHQidphtLorI2mmXgTM1sVuSJq9OZ3HF5XUKssHcyVDLm0ELfbTA31ruQyns7xw8tpmIO/uy8kWPSKulmpgcaKRFs561nfm8tK/zsvVUdhXGE/br+WN+0pllDrpm8u9wvTnc0IAF2VYHdjhoruNVkYdzRDDsmhIXDW744OKK002G7xhJVi5o3M/VMsEgOTfGK3I86yU/pyv9lW6uVznXhpYI+EFfYHyI+OEAY475fy/5wRbJofViQKGInpPx+7t4HUwK/jknhkZWJjYFSmKXXGsv5afjJ4oGPJp2BJVd5jGykg/Uy6t7zvsvHtn6osuiJUms+Pe982hyXDo/5wo3IbVKihG7UsdPR4FFEOdK7tblDurchup+bW8MhCVQDIfpCWq9fzA/UFsUIrC/xbRQfxqYfJvncTduDpdGq0Gi47L6TVFe6lhJZDmZISqPFxORS0slo0l4ygtqpDW9/hqq0irkUEv2gAzotJEA7ZPrhTbrO83rplzTs+3gwlBz4i4gytFBp5IkklZ0rISTN9/W/DBhVr9GejY/ahCgtpbvfMZK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(451199021)(2906002)(38100700002)(4744005)(8936002)(8676002)(52536014)(5660300002)(33656002)(86362001)(122000001)(38070700005)(55016003)(71200400001)(7696005)(54906003)(478600001)(110136005)(186003)(26005)(6506007)(9686003)(83380400001)(76116006)(66446008)(66476007)(66946007)(66556008)(64756008)(41300700001)(4326008)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8079
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ad99b47-f05d-4115-55bf-08db4c5456d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5VtMzY41cjmmAf9oevHWI0URtocUXtIJhvrAXQ0vUsK83/LNbln8s9E/yvzNzmJVeBz4k4hkD5arnKymn3h3iNDDgi19K3BDmhNUSK7e6pFrAupeg0H+eraTItURuHO57WNu95UFCrWnfUHLBmkO4gYkKK+pm6VSK88f+MEVT10BZzUPXWhAGHNer3qUW2y/1HynPEFVziumluwZ0jQ8Kj6r0B9uT9d86Io9gJrVDNgzaDD5pSpAuDEzrgtfa+35zEfWGH9WmDc7xfJgBaedWm2pUdDSXGFNsV7qTMtbxMYSLw/de970KZrZKq5kiav46kRyXiCAfvE06E8EvdMtqj4vzkSwGH3YeJqCtOim13a3RboGsrY5+0ALMjymaMTTyhR5S8rN/gtClcEtpn8f6NAitgMEYDx2HznV8ffGX3ZyOv9GDsd2ufdw16KDqmaa0xG+M+f513HPCzWoDYBSXmVIb0sJrq1HR4n2oXK6M8Co4OsN/VQU1vtj9vXdF6nTRLZKJmELm45rQ0DQ2Xuimz6BI+y6uJguziD+pk2hPYr5t4ZTCp5kbdnbyo7QzVvYm8E0s9b1onjyamnr+9LBtyGtYIhhb90BBFwg9fnZLjngQXsHrkSy6FUL9NpZr8YaU5gpNsrsciCKOTwpFgT5oPRqwopLmB39vUZYO+oCq3yLboJBUX0ZdrTh/nyYG40nA0iyjF462rfHhh9x8k4njDuMVIF66ci+vasL2TffMZo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(34020700004)(478600001)(356005)(81166007)(40480700001)(55016003)(52536014)(82740400003)(5660300002)(8676002)(8936002)(40460700003)(54906003)(110136005)(82310400005)(6506007)(26005)(86362001)(70206006)(70586007)(47076005)(4326008)(83380400001)(7696005)(336012)(9686003)(316002)(33656002)(2906002)(186003)(41300700001)(4744005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 04:02:24.8886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c2850d-fd5b-4c3a-ab3b-08db4c545e80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7718

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v6 03/19] common/device_tree: change
> __unflatten_device_tree() type
>=20
> Following changes are done to __unflatten_device_tree():
>     1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>     2. Remove __init and static function type.
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

I have a feeling that it may be better to swap the order between patch #2
and patch #3, so you won't need the extra name change in function
dt_unflatten_host_device_tree(). But this is my personal opinion and I thin=
k
the Arm maintainers are the people to do the final call.

Anyway this change looks good to me, either with the swap of patch order
or not, you can keep my:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

