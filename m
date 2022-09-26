Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF7B5EA571
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411716.654746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmox-0006s9-1T; Mon, 26 Sep 2022 12:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411716.654746; Mon, 26 Sep 2022 12:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmow-0006oz-Um; Mon, 26 Sep 2022 12:02:46 +0000
Received: by outflank-mailman (input) for mailman id 411716;
 Mon, 26 Sep 2022 12:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M8J=Z5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ocmov-0006or-Km
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:02:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 213833f9-3d93-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 14:02:44 +0200 (CEST)
Received: from AS8P189CA0056.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::33)
 by PAXPR08MB7382.eurprd08.prod.outlook.com (2603:10a6:102:22d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:02:43 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::b) by AS8P189CA0056.outlook.office365.com
 (2603:10a6:20b:458::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 12:02:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 12:02:42 +0000
Received: ("Tessian outbound fc2405f9ecaf:v124");
 Mon, 26 Sep 2022 12:02:42 +0000
Received: from 3accd779a705.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C3FF296-2195-4B74-99D2-E76C99E98C83.1; 
 Mon, 26 Sep 2022 12:02:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3accd779a705.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 12:02:35 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS8PR08MB6133.eurprd08.prod.outlook.com (2603:10a6:20b:298::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:02:34 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 12:02:34 +0000
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
X-Inumbo-ID: 213833f9-3d93-11ed-9648-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mcOGjrwBFuwBfvvQmAMAWTnLIQesICIlb3x4mPjefVEPUbvoTqhBpHQ+fFbS/cWAH7AQQRiVjcm7sMwlP0RexsoTIwOiKonro5eq6pjqXIEw65FAvyVLNuTY/ANiww0/vK2+S773JjL4NV4j1sGWKltgeA0k8THN3xhZrjnTixD7F6Nd6giFxKK9nooTxbwVW2hxIMUR37sit2THUjKlf4cVzdeaz5ljjWCPvGAkA/zQxTeY/MjEkfFnKZ/Z6IuwLBpU0M2DEDzwyjVZyOr/wcAnY0TrOnnm0qvdJvtq/3RFB+k0WAgTguaKEmA3vRR+3l1kOOQGI7SpjCyOjmsAug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KasLfE/X0LhDELQ0X2bfKouKx3VzTwYshly2bC4Aelo=;
 b=mDza+feByzeFzRv0XXZBDKcBsSJCCbgw9F0hAOpv01QwsVdue4RKKKMq6ilQOjD6YlvIEg2BVbqhXxFcJhvuzzrITZDt8A11IjXw/xr0Y072qlOikOStCESibCEw0282AT7rFQtd1CexAF1ODZ5bQFo5jD2sTd1wnXHY+RbGnwbLyD054EUmcZptyJLBYjxDSuM7NFqP/03gaoBElxuDl1T5b+OHplgnuS4noDpZUwXlrKfNn3Elw2IbER0GPQc+JsFe2E0TWfGGwQYkhBU7yVJ4FamY5GbrV3/KbjTR0ADCFZ0XXW6HqOPBAAySkJ4evmz9GiUjHfJzrrZ942ga6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KasLfE/X0LhDELQ0X2bfKouKx3VzTwYshly2bC4Aelo=;
 b=1EdbL+kzrsupTdSJIef+buyl/cyOnAZhTwAo1ECWtz+eHtGZI7qqet+IJr6CyEyAdooXAb9FSiIVPZ5+PyaQD+dXSOxi81QE2s9LsZnecQjNQF7yqjXbIcAsBQGZtxfqkcor0raY70rZG5s6j/a2UPK7dcsNvhyqUNbaM7Cy44I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e14c49fc4586f81e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExWEtDEB36+q59UWMPLTP7qaHGSWKQDrOWT89qosRIy8FQI5lc3a5bHWiyvzlDn2HUSG+RtyPx06ZYS94V9+qr8WJ1M9vEzL9lHTUzirTwojr3rpanQNWq/e/KPFws2MYEhaabM3BdkQD94Xu+M3NnnGSLape8BOGMS1GTWr71sCvHWOEcQEslxcVYTI2YdnLiJvXlygBo+UrxMcUf+DmyrTZoheWxJVAt9iSbA+BAblNU9iyR9zuuKGtAQZgmEAs0bWG8BBJjnJSq1AycdFTtpeN7kUFYEq/kht+jgDC/xdrjRl41LApq1zh2HsOwj6UbK5DqxhNQODsFj5CbL71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KasLfE/X0LhDELQ0X2bfKouKx3VzTwYshly2bC4Aelo=;
 b=nn7GhqQSokEjeotJGdccthO8RZNhMASj6OEgr7AkgKy8j0lUamZIQFKVrzXcC+7aozUizuwpLCSUlEisGGjtxGNpUlEO+RKuBflLZbmT+J5puaND5Lu/JiW8C0Q9fjNPAVeNvZxSNJ6s/u1HZCL85b3S5AM59VBuqGikxYic9hSvvHa6gvolKS54gV50NwC6k8CBffl0QJRhDoal7vuz2ozNaMbVAWqud8kIojny0rSbryjgPDN20G0pgTpo6pAjsMNq6NazXI9FRfVwHjwKxjP6JV4YhnNK+hrpZQ0nRaCEip9xiw4pJ5askUAPd/6Bwatsj68jTs48lQnxi8L1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KasLfE/X0LhDELQ0X2bfKouKx3VzTwYshly2bC4Aelo=;
 b=1EdbL+kzrsupTdSJIef+buyl/cyOnAZhTwAo1ECWtz+eHtGZI7qqet+IJr6CyEyAdooXAb9FSiIVPZ5+PyaQD+dXSOxi81QE2s9LsZnecQjNQF7yqjXbIcAsBQGZtxfqkcor0raY70rZG5s6j/a2UPK7dcsNvhyqUNbaM7Cy44I=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 03/10] automation: qemu-smoke-arm64.sh: Increase RAM
 size
Thread-Topic: [PATCH v2 03/10] automation: qemu-smoke-arm64.sh: Increase RAM
 size
Thread-Index: AQHY0ZfSoOTmkXvu7EK7d+66XPqkYK3xnIiA
Date: Mon, 26 Sep 2022 12:02:34 +0000
Message-ID: <DFC510D8-1EF6-49BB-BFD3-2B5A9B2595C3@arm.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
 <20220926110423.26030-4-michal.orzel@amd.com>
In-Reply-To: <20220926110423.26030-4-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS8PR08MB6133:EE_|AM7EUR03FT041:EE_|PAXPR08MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf28a53-573b-4035-77f2-08da9fb7044a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PLCngetpR/5BAPVdeiIXfvnG/+Sa59KC5HINrq4pN1rwA3KKIl5nAW3eCO/A+mZ5MvT5ngowekcSiz81uSYWepNW8bc6BhZU3gjSnApFbXOzowXWJ14nOwrWVKO5cqePf67XA/mjdkH5af3noYBfVmtO6NOuXPBov6MVdR6NWC99J4YPREuEGYVYc74upvE/uqIqZzThC6xZebPxSqGyWDxRQiOqfRlLqFmKIyyBhNK9N+pqZ2rxNxPExEIUcCLCSg4Rjd6uAf0moj6V2A4qlhre6adOvxVjmdJMpTtLWBxgYycjG3NNN7+beHc5xdpJ1SGemWXMq1BjC6cx30xhEIjhPs3BYeNKjExOaZ64tCy0UE4VBdqoEviDEE2hkFc8i5itQ8mNC7KxfyJQsUqNX0gcGou0jRud+BCEO9g/s2Pcg1gpPJhZc8MJYwBxiQh6UO1nFKwThF7mzAy74+JYwQrrMfL6dJa60dwb0Q3vZ0mTQt2cu3XTKLQ68bWacwaabzvsBJJ3mUfvw5AfSjBQIb7ebD+D8TVL2zaoGZMiyUk8AoejV+IHN2Ep7R/lAep2JyjD15suuvd5K6UpNKce63fCTR5mK/DhdyPGgVrpeOIQF9ZMhdeP9sE5CZDknYlpVtfDIGXF4BvkKvLTPlI4jFwevodVztfx0y+4s88vz3af9TCsF6JT5uJzzUPIM0oa95CREZeVyqwWNdZiv6OxCl8tVnecLzhFCZQ5EcaPoySGJClbi4AEgCBVb4K3rieVCfbupdiTdMOKV5zOJ1SKljux9tIMmmxtM+U/LlgBHBo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(71200400001)(186003)(8676002)(2616005)(316002)(38100700002)(8936002)(4744005)(26005)(53546011)(6512007)(6506007)(86362001)(91956017)(5660300002)(2906002)(38070700005)(478600001)(66556008)(64756008)(66476007)(66446008)(76116006)(54906003)(66946007)(6916009)(122000001)(4326008)(36756003)(33656002)(41300700001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <312EF131A665C64CB093F90185AE159A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6133
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cecbfa04-c8da-41e6-6659-08da9fb6ff6e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z1JZZPYCHp0IwIV+SbppwYV9rDmwu7wPSzjSfRMrVOVjK+ksxyOFN7VY1Q5j7eqWnVGcQB+X1cxC9RPIHAElVnXaCVhgIc8egK5qS3FKUchsFVp/AV79YkpLWXa5tO83D//xAn5jKPJguwDZ/5DqfC+/SKySbuKl5grX1ESxfFSZhH9AOEqi4iUn2U1zVAOdW881yRJaq6IR7cFthJ1hvmpIZAP6ANjPhfQB2CoQc+Z27OT+eaaIlqoqp8SR8RCNNeWmj7qOLnhrwqTMEn5iOuRvw5EcqmtIrgynGGYtaYY9EEpT/JG6xVontGtrHhgw1+ynPrxmGxFWciX8URVyxfex3apKmJKEYvhWbx/YH5idfSRXUihA0KCVwJcSrDXLp25FK1b1etmsaktGPLGQM2LAXOTF+1BwEgFfYNKeNe9LVl4cHkixbtByqzMw14PBkBQh5B4e65tZXrGJSS32H+DoWvG/Miz3R0PrLBz/GSybXrj4QEeCE72MzZgF+sYMXfZQcM1AhPiMx6/7ZneOtl937oAsr7cqJ5LLDE/Rk1Nl4S3j9NR/0lKHSRdY1je1yT8D0bNzK4OWIN2i+LE9bdRnrb7F2B0zStB3RfC8okyK3Jt+nCrB7dlzmF63mRbMtlYir1GLqg3RHdNL8hTR5JVlFVszYzv7EKCHz86oo4muGazCZnTKBKC3rPwxQGW7+ydvDjfjAxOYQnY6GlvEgxmw4ph89bT7hrsH2htusbZCcBENv9qbMPMk+9cVk7YAF9zTBuMO0TLN1r66GDpuuA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(47076005)(40460700003)(36756003)(33656002)(356005)(2906002)(81166007)(86362001)(70586007)(82740400003)(4744005)(70206006)(5660300002)(6862004)(8936002)(8676002)(4326008)(6512007)(54906003)(36860700001)(316002)(40480700001)(82310400005)(26005)(478600001)(2616005)(53546011)(6506007)(186003)(336012)(107886003)(41300700001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:02:42.5698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf28a53-573b-4035-77f2-08da9fb7044a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7382



> On 26 Sep 2022, at 12:04, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> In the follow-up patch we will add new jobs using debug Xen builds.
> Because the debug builds take more space and we might end up in
> a situation when there is not enough free space (especially during
> a static memory test that reserves some region in the middle), increase
> RAM size for QEMU from 1GB to 2GB.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Hi Michal,

This looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




