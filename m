Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82970F364
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538939.839339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1l5r-00020I-FZ; Wed, 24 May 2023 09:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538939.839339; Wed, 24 May 2023 09:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1l5r-0001xS-CP; Wed, 24 May 2023 09:47:43 +0000
Received: by outflank-mailman (input) for mailman id 538939;
 Wed, 24 May 2023 09:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q1l5q-0001xM-1y
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:47:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a9d1a7-fa18-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 11:47:38 +0200 (CEST)
Received: from AS9PR06CA0576.eurprd06.prod.outlook.com (2603:10a6:20b:486::10)
 by PAWPR08MB10240.eurprd08.prod.outlook.com (2603:10a6:102:366::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.25; Wed, 24 May
 2023 09:47:37 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::29) by AS9PR06CA0576.outlook.office365.com
 (2603:10a6:20b:486::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Wed, 24 May 2023 09:47:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 09:47:36 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Wed, 24 May 2023 09:47:36 +0000
Received: from d613ba3180f2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FED0CA29-2088-495B-BAD1-3496B6233F74.1; 
 Wed, 24 May 2023 09:47:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d613ba3180f2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 09:47:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB8487.eurprd08.prod.outlook.com (2603:10a6:150:b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 09:47:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 09:47:27 +0000
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
X-Inumbo-ID: 04a9d1a7-fa18-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgzGKZTLSJ2OF9q6yjz06r5nx+NFpp6mUw96GiZbv/M=;
 b=nk/aA/IAPZhqDuetf3TsYhz7OPM18lx7R73iGss+nj8M8QPGnL71Tct3GzHcvscBgmanCh6VnKCDNsDGEUrTZ2gCPKfcrRvezn/BVpk6/xRMyFx3Hj3mFRqXby3lPSZsTZ7Jdh0S0UpyDFOJnKfJphGC/qZ26U2rT0CYh0WgzPg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1bf272dc08745cd6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3K4NHFFwWEvn1do8M8BFIp4GKwBm3LyoVrutgvxl7tZjNJMDRUiZj7+0V6zHAv67Px0Hhy01cuxqQdlSUirbXcWQXcBaPNRqo295TfYq81T9AicyY4vEprfxgmgfbgbIDeMPDGiTjZ9D9gw36kIz89XYTb29aPK5gseg65mVod1kVhCDG+0O0zX9bSQcq96xluLiEZqSj/M06ASbNJZTb6omjovftgFViOyK1AniLWERjoaDHHEtieO9l3FA5Vk2/5HQbMv90md6ciVVu6vaSPA5PDgG7HJ+uXtXs3RJ52k8rAd1jAO0uMyWMElwfHA1AjROSzChYyeSwQ3hghf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgzGKZTLSJ2OF9q6yjz06r5nx+NFpp6mUw96GiZbv/M=;
 b=UkYTfrd/cwcAo/zq+bmfbDIaF92coAZ/4tzG204Ov3bCvLY03Te20I7bcQmHbo3nZvjRc3mzNvUX06XhdFxNlSYjUBZ32uSqYamxCuq5bqcaukSqOleCFCpxRWLoc60foJIFBW0AKpQJcBUBtLr+2iQIjagUEYjVUl4JvNoC5qqrj13JmyJwpX1cF5o5l3ruVlEEUiJx0LaqVVdlfgBJxxezCqUUMJH6TItNNZ5ftlkHRMj1sdt+dJGD35Gp6fjaDBYUZWqt9cHdeNq9p21pgfx9/eSHgkJIPZAQSpJAttHEzFpWWqx3o2yteazI5ymwSRvIMu7bJmLjvumeosvPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgzGKZTLSJ2OF9q6yjz06r5nx+NFpp6mUw96GiZbv/M=;
 b=nk/aA/IAPZhqDuetf3TsYhz7OPM18lx7R73iGss+nj8M8QPGnL71Tct3GzHcvscBgmanCh6VnKCDNsDGEUrTZ2gCPKfcrRvezn/BVpk6/xRMyFx3Hj3mFRqXby3lPSZsTZ7Jdh0S0UpyDFOJnKfJphGC/qZ26U2rT0CYh0WgzPg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v7 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZjUpTyDGNoUFbjUSAMdNsQrEV069pLt6A
Date: Wed, 24 May 2023 09:47:27 +0000
Message-ID: <04720B92-03CF-464A-8FE7-F90B527F3E7B@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-6-luca.fancellu@arm.com>
In-Reply-To: <20230523074326.3035745-6-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB8487:EE_|AM7EUR03FT014:EE_|PAWPR08MB10240:EE_
X-MS-Office365-Filtering-Correlation-Id: c7710e18-f8aa-4cbe-77e9-08db5c3be816
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HmUFb88Qtqv6LO3GtfFX9MCnLyiimnGPfynZTeJQmxKwXT0p7SdQbVMgpJFVZBJcOkFrCrbKgzYEazBQrJdnqvyfSoU6M6VDTEw7yVCW6t7Dg6qZ9s7iW5McJwvywRnfzEZvzqn3XBDvunmqIq0cMQBmiP8NBdLR6QwyyHDRbtJm+ZS0eLp1UccBQUDxBiWj/38rp+XRihVqxrbD2X1KBbMhNh/T4MsMjG78zQNtuzp4m3q2iTQEXat9ECInujMdjDAwbXgrb51ywJ8RhJWj8bTkkCtdL4+rkI5lMb25dpnOMuWgCUe64eAXqku6wIcs4KqHt+YGfgabHudIuz0RpJIFd3BSE5/0YyVfCwx2uYwumJB0/WCntn7q67jK2ht2DDd3esERAoJxO9ZXZzgTGif4zsJdhdUqGvoEnZyNOsTYy8IGwpfZLct+TOk2RDhf7sLXakuDkSi8kQoUHuHCnWiYEsCUSqKODTzOD0yqJs72kZ3uxgGcwlRKR5W29cP76ocRi+KHWYwkRm7wxYzeseCo0dGbjUeyljSFr+2I6opTNy4xayZvIJbIYNO4/P3cKS8iXEzAdk19fnAu16plzxBl13jIhDobtXDXiV8AF3oYQvylrUJhye7M44Awj7i4keFDdrAfePkG+u1Wr/Zbmg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199021)(6486002)(41300700001)(316002)(71200400001)(33656002)(8936002)(8676002)(122000001)(186003)(6862004)(36756003)(38100700002)(53546011)(26005)(6506007)(6512007)(5660300002)(2906002)(2616005)(66946007)(76116006)(66476007)(66446008)(64756008)(66556008)(6636002)(4326008)(91956017)(38070700005)(478600001)(37006003)(54906003)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <39AE7D40E2818F409CAEDB99BCA99574@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8487
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cbfc2bef-9098-4b6f-5070-08db5c3be28a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FdcwwaoY64bcYtjRTfxLygFcObea9G5i7xuu9W62ZRnqh6btfURWZOcj/u2Y6CH7IGuLNcXiZJZRAQyLv74i3IQBlJeBW4RXtYZvTBgQnPgvmyg8B6ehvhw4ulRMFuV5qmHBCcfbSIC8ty2G8MOB6nyKdOOX/2InEKtwKipIKNEiYI/20o/aODfPhksl/VnkI5U55QZQYOCFkIZuSeFc/alECXGfV6SiRyGT5VKklP1jMClZ5e/CXMSlvWr02+GZlAtzrr5bs2/fayiIQZ2z0Kc0LgCtkTGPYOOiTwqOExUZVQOFfKecE8hWVIsYHfU3aLtDaSv2vC97nEhTA8+zJ245Wa6ZisuYJF29221w2CVwhM1CGLanVnshuICpyjCqg8M+EsuxU8Pq8hqzhrf8NlArHVSDrkJTTJyLPXO++sHJQv2WtRjTd7VOSW2xWkh41IKKdFM5mP+OqGP/2dNR0w2JAulvtnuFk2neo4vzV+kWwHV3hv7lKfv0hndzvIsiOPIHBk/98aSJ+cU+jGJVI4K51altOVyOSznwTW2hd0LxHr1K1qvWU/s9cF+VnL5NtkPm7b10aCg2vqvIlwhOVchU0XR2NfrxNmqji3P66mY7PFXB/Cp8XONhuoJCc6thGiYQM46sTTVhy66J/sSbWMnD9qA0wtWRgnVab0ldW4UgN5hnUbaqqjkLdCLp1M5LQMhg6oJBan8E0fMvTy1/7X/0tTLpMSchX1PbTMLQaM99xbseHVMA/PVOmMszfIkB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(316002)(70586007)(54906003)(37006003)(70206006)(4326008)(6636002)(81166007)(356005)(82740400003)(41300700001)(82310400005)(478600001)(6486002)(8676002)(86362001)(5660300002)(40460700003)(8936002)(6862004)(40480700001)(186003)(33656002)(36860700001)(107886003)(53546011)(6506007)(336012)(6512007)(26005)(2906002)(47076005)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:47:36.9044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7710e18-f8aa-4cbe-77e9-08db5c3be816
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10240

Hi Luca,

> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Save/restore context switch for SVE, allocate memory to contain
> the Z0-31 registers whose length is maximum 2048 bits each and
> FFR who can be maximum 256 bits, the allocated memory depends on
> how many bits is the vector length for the domain and how many bits
> are supported by the platform.
>=20
> Save P0-15 whose length is maximum 256 bits each, in this case the
> memory used is from the fpregs field in struct vfp_state,
> because V0-31 are part of Z0-31 and this space would have been
> unused for SVE domain otherwise.
>=20
> Create zcr_el{1,2} fields in arch_vcpu, initialise zcr_el2 on vcpu
> creation given the requested vector length and restore it on
> context switch, save/restore ZCR_EL1 value as well.
>=20
> List import macros from Linux in README.LinuxPrimitives.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Just ...

> ---
> Changes from v6:
> - Add comment for explain why sve_save/sve_load are different from
>   Linux, add macros in xen/arch/arm/README.LinuxPrimitives (Julien)
> - Add comments in sve_context_init and sve_context_free, handle the
>   case where sve_zreg_ctx_end is NULL, move setting of v->arch.zcr_el2
>   in sve_context_init (Julien)
> - remove stubs for sve_context_* and sve_save_* and rely on compiler
>   DCE (Jan)
> - Add comments for sve_save_ctx/sve_load_ctx (Julien)
> Changes from v5:
> - use XFREE instead of xfree, keep the headers (Julien)
> - Avoid math computation for every save/restore, store the computation
>   in struct vfp_state once (Bertrand)
> - protect access to v->domain->arch.sve_vl inside arch_vcpu_create now
>   that sve_vl is available only on arm64
> Changes from v4:
> - No changes
> Changes from v3:
> - don't use fixed len types when not needed (Jan)
> - now VL is an encoded value, decode it before using.
> Changes from v2:
> - No changes
> Changes from v1:
> - No changes
> Changes from RFC:
> - Moved zcr_el2 field introduction in this patch, restore its
>   content inside sve_restore_state function. (Julien)
>=20
> fix patch 5
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Change-Id: Ief65b2ff14fd579afa4fd110ce08a19980e64fa9

You have a signed off and a change-id that should not be here.
They are in the comment section so should be removed during push so might b=
e ok :-)

Cheers
Bertrand


