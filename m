Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E5B6602A3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472700.733037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7k-0008WP-Ct; Fri, 06 Jan 2023 14:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472700.733037; Fri, 06 Jan 2023 14:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7k-0008UF-95; Fri, 06 Jan 2023 14:55:12 +0000
Received: by outflank-mailman (input) for mailman id 472700;
 Fri, 06 Jan 2023 14:55:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fu4g=5D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pDo7j-0008RI-3C
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:55:11 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2059.outbound.protection.outlook.com [40.107.103.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cd42182-8dd2-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 15:55:08 +0100 (CET)
Received: from AS9PR06CA0341.eurprd06.prod.outlook.com (2603:10a6:20b:466::14)
 by AS8PR08MB6614.eurprd08.prod.outlook.com (2603:10a6:20b:338::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Fri, 6 Jan
 2023 14:54:58 +0000
Received: from VI1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::18) by AS9PR06CA0341.outlook.office365.com
 (2603:10a6:20b:466::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 14:54:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT003.mail.protection.outlook.com (100.127.144.82) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.16 via Frontend Transport; Fri, 6 Jan 2023 14:54:57 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Fri, 06 Jan 2023 14:54:57 +0000
Received: from 0b56ebb67809.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 526C064E-1FEE-4E50-8EAE-57352C2BB4C2.1; 
 Fri, 06 Jan 2023 14:54:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b56ebb67809.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Jan 2023 14:54:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8639.eurprd08.prod.outlook.com (2603:10a6:10:401::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 14:54:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%4]) with mapi id 15.20.5986.007; Fri, 6 Jan 2023
 14:54:43 +0000
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
X-Inumbo-ID: 1cd42182-8dd2-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG4sc0OudoXcRpUzDMDRap1+qqTUrPvf4wRtlmnKiSA=;
 b=90O2dl5eyYiuH1YBAQZgg23+FPwdTPXuDkAeJ1hDaVheY5OfE2qLP7jn8cRf0eHTuSukvatFNVGrmRje01hxsxDxHIOmiBJq1MXiEMXQLPwLQtgGT19C6CEnXrOb1cBIMXsGDfcYaHWx5YKsyGBYeLjH0mN5tbmbMg+baIzUnfA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6uM9svt7xQB4r+KwcwNlZeQBPlGAIZ47wMu4zeEf6uv27mLWwjkXsTh2SkGCQnqmPXefHkcZmJcgHLB6dEkMhiwO8ryjGatSGn1fCvTcS+IjrXYd1tzMYa4ORQKCb1c1W3mXts0hYFk6m6+k8hSKuFEifSVMRAU2n+6q8A2xel/M/Xc9Z65xFJKqqsJnku2r1hzbOrXU4hF6Gzk7HB+JQQ6cvmDgC9Bgwqsgxjm0xUGub+ecI52ntNKR93dusCm5eDJ1sBKBxRQwc45v/eqnQtsxwMKwpmIK06LFjo4xJHgUtUE9PlpzxiNwFn2ktl+MCVhDniSpSM2irbto6+PLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG4sc0OudoXcRpUzDMDRap1+qqTUrPvf4wRtlmnKiSA=;
 b=TZFW/QUrCXPyIb9pgN4MtxtsdjHSEo9pvJmiaafmEhDNcaTvHcFRvdVwe372cWaJIt+s6MZ6IY14Dy+pCwrGdaV20K4P4UW0auHhZdbDOIjfjfNo7AYm1U7C/b00bPtqnT3spCZnDr5UlW9lmihUtzO7r7RMnzKF6nxMRYUvByj438IoFxLkFFP9Gb4HQPhk1Qz1UiSbkxBgCHwi0EAav3vMutYKyhuFsE8elx4C+qNAeD7GvvwoSwjrZOnCZN7HRw03AH9bh+NCrafYaZZMFSo4PKiFhibHj91L/L9b2CaxL9QZZ5C9pSFf7duyqn6I32thrj3QjBFTeUu4suZquw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG4sc0OudoXcRpUzDMDRap1+qqTUrPvf4wRtlmnKiSA=;
 b=90O2dl5eyYiuH1YBAQZgg23+FPwdTPXuDkAeJ1hDaVheY5OfE2qLP7jn8cRf0eHTuSukvatFNVGrmRje01hxsxDxHIOmiBJq1MXiEMXQLPwLQtgGT19C6CEnXrOb1cBIMXsGDfcYaHWx5YKsyGBYeLjH0mN5tbmbMg+baIzUnfA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH 12/22] xen/arm: fixmap: Rename the fixmap slots to follow
 the x86 convention
Thread-Topic: [PATCH 12/22] xen/arm: fixmap: Rename the fixmap slots to follow
 the x86 convention
Thread-Index: AQHZEUiBSJDHdzI2P0y6FBuQ6cG/JK6RkVVg
Date: Fri, 6 Jan 2023 14:54:43 +0000
Message-ID:
 <AS8PR08MB7991D6F06E5F3959E36307B092FB9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-13-julien@xen.org>
In-Reply-To: <20221216114853.8227-13-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5CCACC92360311429CBBF1ACCE56BA62.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8639:EE_|VI1EUR03FT003:EE_|AS8PR08MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d23b52-799f-42fd-c8a7-08daeff5fab2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cagJFJsjL3U8dHLo2wgYxmFhDL+KW6ZO67mRrAVZWWECZD4h2sKLuFf/U0Sy2C/IOvDa0gvXAVkyVs0YlXFqgzbSpxjmrIVKCMCNO9NHJx1TVMTkEyP2dx/7h0agpt+ufcUcqhJQGqfhUamR/AEXX29n3PsFNKohPWbGv4BgsLFwWGAdZrOnguZ9LDIf5aed0G5p9UJrcqVrgpYpFm09iyya+kLcMRh1w66UKasFtidydBcufOaGLepKDKusGqsDNRVXDAysMiuutO3Mr+1Fb4WfUfv3NX8bjxOnSJ4T3kWOWKaidTsAqIGHq94YJrofE6T8Fp9ISpXkxhb4aWaP4N5TF4HwWRKrq621HZnSBw3AK7TuCkbPAyZJiZEPLiGGkTivAD8jrizZ5gAdfHf9T4obWcHpHdpK/jwhG0ysIk8iGvjR+b8yNg8spwCYEVmaaqdT0kEQVjkL1dD3zxWTGBeYBGAF1BjjJum4so1m2bnNfh8jB29bmsx3lGWzo2pxgDTARzy/Z8iFm2avm1utj8Z4/qf4p8TPfW7yyyy4pxXTM7B9Dh4FPYo/aqi3KL7KY5P+Zb0uBFcpaSKDhDi1KLAM1s5sOutp5APXTPsZAa8+0T5FD+6gGmMunXKyNcurgZG42XqUSZyV9dxcGVxfovDdLF8Xedd/cNPij7bAaaKvnjWGyHRgZAHn7Hk5BMV0RcyPL54pI2lY3SGJ3SNKKA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(64756008)(66556008)(4744005)(66476007)(54906003)(66446008)(8676002)(86362001)(66946007)(478600001)(52536014)(76116006)(41300700001)(4326008)(8936002)(5660300002)(33656002)(2906002)(316002)(83380400001)(186003)(9686003)(26005)(7696005)(6506007)(55016003)(71200400001)(38070700005)(110136005)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8639
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4a9665f-c49e-4bf7-96a6-08daeff5f25f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UlrHIm40oCwryi13wX+5etIYW9MZdl4YYPYIz4DKR0CCGqgftYh9uqH5jlPC3zEUVFKN77hN7M1djsGPnifwhu/LDSMpL5hs9lpgYdTCM51XIYRi6mDO+3UgiNP7hesbFblpVarRityPZoRuxaC28v1np9xKdtAyUpvBI8bfx+OZPewhOyFk3qMhMqjljgRzCaZHRKyOgHQFrF+7ZVBxnqqNSo8JLAHgccwXpM+PZix/SioYieoZIsqnt7nhFr/iJt/NwLUE09Df2hh2lzoUHGla8CejPYG0yFo5ejQnf766NZhEX7gyrhGO5XBLyO1kfW0YM6+C0Gv0sIlHhgVXASril2Cf3/woADKXV0yeGrWZT2dapP6bJNSjx+Vek1Tm2QhAj53Ie9wqO6Fw0U+RlOn7nGw3KO7CcoDK1gxvJm10NTiR0fAKYFVTktQh9/MI2dvSsFElrENEriGEQ21gVjSurTOKYBnljFidkZwPqN9VeLYBj0uv35Lh/0hL1ik3QzVznP4nZwttzlM5pBIQ54CxDmyObShV1V6erA0/mr1XXJ7rdsldVBHC1mz4DPxZ6p57n7f6VZj7jLHgY/EgoX0T+gG8qJsy/oIusp1QWQ4IQfE/1OPHEo6EZd1o8asiK5SqkCANH8Z8TmIfsx0sLmq2HxEOsEZ2j59wCS0IKC1iXQilFfphq6SyClJNkM8TjD6nOJzr5lQdKS98KIxOQg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(376002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(6506007)(81166007)(7696005)(478600001)(82310400005)(336012)(2906002)(83380400001)(47076005)(54906003)(316002)(36860700001)(86362001)(40460700003)(33656002)(5660300002)(110136005)(40480700001)(9686003)(55016003)(186003)(356005)(4744005)(8936002)(52536014)(26005)(82740400003)(70586007)(41300700001)(4326008)(8676002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:54:57.7455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d23b52-799f-42fd-c8a7-08daeff5fab2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6614

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 12/22] xen/arm: fixmap: Rename the fixmap slots to follow
> the x86 convention
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment the fixmap slots are prefixed differently between arm and
> x86.
>=20
> Some of them (e.g. the PMAP slots) are used in common code. So it would
> be better if they are named the same way to avoid having to create
> aliases.
>=20
> I have decided to use the x86 naming because they are less change. So
> all the Arm fixmap slots will now be prefixed with FIX rather than
> FIXMAP.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


