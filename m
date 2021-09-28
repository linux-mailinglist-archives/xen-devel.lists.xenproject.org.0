Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1451541B258
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 16:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198048.351352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVENf-00069B-PS; Tue, 28 Sep 2021 14:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198048.351352; Tue, 28 Sep 2021 14:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVENf-00067E-L6; Tue, 28 Sep 2021 14:46:51 +0000
Received: by outflank-mailman (input) for mailman id 198048;
 Tue, 28 Sep 2021 14:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUli=OS=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mVENd-000678-M1
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 14:46:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 266d624f-491a-47df-9b41-871909b79ce1;
 Tue, 28 Sep 2021 14:46:46 +0000 (UTC)
Received: from AM6PR0502CA0041.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::18) by VI1PR08MB3616.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Tue, 28 Sep
 2021 14:46:42 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::fb) by AM6PR0502CA0041.outlook.office365.com
 (2603:10a6:20b:56::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Tue, 28 Sep 2021 14:46:41 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 14:46:41 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Tue, 28 Sep 2021 14:46:38 +0000
Received: from 11d9b4c7c2cd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F563137F-3E88-4D13-A724-8743B04376FA.1; 
 Tue, 28 Sep 2021 14:46:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11d9b4c7c2cd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Sep 2021 14:46:22 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5596.eurprd08.prod.outlook.com (2603:10a6:102:88::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 14:46:20 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 14:46:20 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P123CA0030.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 14:46:19 +0000
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
X-Inumbo-ID: 266d624f-491a-47df-9b41-871909b79ce1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw24404JNd1u24V3rFXoaO/pES0wg+9Qv+JR9AwHK/o=;
 b=enjIOUXokTvSU7SxTKOeNvi3r0D5EbuMeYD162vFixVIhpzvKGoJpALgX9CJUemftZgVmEwdaXNj+zdLjuk5BzdYR0x5cgJMV5CiG+yaDOlL7hjNB0iPG2Fhn+KtRTKIH57fuG1z6SxSJrEyxzmx3DqwMInJjLL8MXcuS1zeQ1g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee3aeafacdfe2b96
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPmSj1j+2U+h+wGWRr1SPffqQlfbJ/XI72dlUAUwQACiFxy58W1kF/TskRZTXjzNBDryFT24l95vTUziILh8S2GwwmxIer4KOtei5YvfLDCkdYIhznFYVv4On6wWDyNP24xsQXwbiWetrPia1Wyd6R37wA/AZkS8EcIUfBDqzVdbivJAIVnruI5u6XwnS4fq1JVMaUDR/HyQtj6Ldh/vXVANEISV1NiCg1q5Kgb5cRBJbIKU+NCsMA058b0HDkoy7VIug36hzgVLHtCcEI1yth7ERaxBNdiO0jARaYmLVXJvSQZzNu0NrZbpH4pkO/MtqJ6YLyJ3iv3EbmN2NVheyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Uw24404JNd1u24V3rFXoaO/pES0wg+9Qv+JR9AwHK/o=;
 b=ZeXOZqjfZ/b2mYnVwDlbfPznrgXT8cbMDXKYuSXebsRKZ8ooFBSUfv2PE0lKDX4NN7HAgekCN3AvCZU0Whv0nTzkE55qR3nKb6CQtC5c1pLg9K/U0WZys7fCYIhDsD9PE48PI0BWArdK9WU1X3UQN07HFa1C7bu9lrQnJMwHQ7QzffIWaJNPwvLezK5skzu8KWZe7V2uDOX/UsrXIrnBW/438CXelPLCltGFOoYc/wgSVCsm/9sU65CxiM1mhaHTkXK+MMbvJtFvkaPDXHGNyuY3lqQWrm9Iu/pprSPBiiB/ejiL2bA5CmfvztfkR077+HHfqJ9u+/F4GfGzDMonDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw24404JNd1u24V3rFXoaO/pES0wg+9Qv+JR9AwHK/o=;
 b=enjIOUXokTvSU7SxTKOeNvi3r0D5EbuMeYD162vFixVIhpzvKGoJpALgX9CJUemftZgVmEwdaXNj+zdLjuk5BzdYR0x5cgJMV5CiG+yaDOlL7hjNB0iPG2Fhn+KtRTKIH57fuG1z6SxSJrEyxzmx3DqwMInJjLL8MXcuS1zeQ1g=
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [XEN PATCH v4] xen: rework `checkpolicy` detection when using
 "randconfig"
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210928083944.780398-1-anthony.perard@citrix.com>
Date: Tue, 28 Sep 2021 15:46:13 +0100
Cc: xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <53B2FB4B-DE19-45F5-A490-1A304B91BA32@arm.com>
References: <20210928083944.780398-1-anthony.perard@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P123CA0030.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::18)
 To PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c54545a0-a11c-41ce-5fd1-08d9828ec8bd
X-MS-TrafficTypeDiagnostic: PR3PR08MB5596:|VI1PR08MB3616:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB36163775244B1568C8941B61E4A89@VI1PR08MB3616.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SVoOmX+8wMic3DbehSZTkVrJOa+5ZZlqFG+Vzm08cFX3F3FatyfBsYEj3C2GeCLt5RSTkjONPxA2yX7HBEd79nsE220gj2zsKbttHFcmmaM9AHkNFPfbRaE5tAWoUhtBNANeWP+/1GgXRVUNLsmsGNtkE0OsoKk3zfrudtLFi7uh2Y6EQXxRJ9cznBM6JPOjp0KZbx0VZ216mT+xcYfxVBNq2iR0fijBHe4pdmIOcUnOV5TWmKRwNSDdsJJ1T5r49S3zCx5ICSDcDZS44x+a1PembWu/dRvBHqOXXNLFkTB2ko1RmYkUN1m4J+Jln81+1nqgTPtKHLFLgWnXyoo+oedjYBFpn+//LA/m9u6FfuOa6L3K9eScV2HRR2fp8t0SmM/fjMBgacX90hsfPh+rw3UycZj1V8bY2wTmOiN4u8YWIblIIczXtCAe0Xx6r+ZPrDmIY76lcyQYD5FAtNWyfbcxy8jvK1LJrJnwxrXuWS2ljgveIxGmE+Pd4UHeH8qM4yScKjCYaUEZaCjNnGjtTHg9VbtPCm0XP5vIFrJiUmiQlYiWtt0b+Ndu7Ka1PHdRMfWR7qtrcgQQZyPxLnr7/4ziLJk/BCd6hJq/pouH3n4esTJ0m/J0mv2bnxgK5taKIg1dnNV3DxEEyWVNYydfXKQhngS1ysD/FORJHB++Q8h+eiVvD2h0hEaYyATvRzIucNW6qQ68++OTHAxGDJ/x/OuG+tTOC37102myddQaws7cQDWT9/QS/vFJB0ePp6Idqv1KD/mxQZI93CbziK6iQwFhhAETZpx+aKZZDx1RKSEthzQ4GcULEo56JJ04BM72hWnCQuuyjn7Oxx8LAiqWAw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(54906003)(508600001)(66476007)(38100700002)(2906002)(52116002)(66556008)(33656002)(6512007)(6666004)(86362001)(66946007)(6916009)(36756003)(6506007)(316002)(83380400001)(966005)(6486002)(53546011)(4326008)(8676002)(956004)(186003)(26005)(5660300002)(2616005)(8936002)(44832011)(81973001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5596
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb84d48f-beb8-4217-9786-08d9828ebbcd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hoeCbT4K98nRz/kyrB1BCyCRGcz2T5qRwdYzVJuY1lJFNE7y/jKA0XRvRK8hebc3H/acwmsa+OvGKl3DuMaShdhmi5T1HQV5cw0ADm4gWy06Vwes+lfx9dEit02zyN4PIw/xqZzCg82Tr4wVSAyBccAqYnHTbRugF55N4GXHhVWPcWC0Id0ZyDp0lwaZn7SDCrrRpHP/GYbOXMZKp8KsR/pvQqm/0l2YZcXolgxlj+N1s+6yOrVxo3CJbncuGwfJEA861ZLa6JMCkPreXWd8phWZ8VRFTh58gEoCLQ4XWIePuvtA0e7hvaj+D02ajBX8feANmdMelPBne2aA+xVEayY33oDujsgbsZmcE5sWbJkOj1RajYdDQEvJ728yW3TuhYux0Iv2M/z1BWs8db2Al/00w6XZIa/XUbL1AGSYut7mptvPqFzEUMOFcPBorCsQ19z5nwAV6fxASnXGK65ce0h6q6mZVmVN4qWY2t9jLXtSeAjhgO9MppssYWHx37e09s68n3Je2RGxp0mAOWVfAobEiRtBNwwKB/Gne2Dg5fJoGiheq8VTKK58jYUMwgMma1AILV/qLg7mbikjv7QQRYxI07nPzlPGubYo/3fFmLSwzyB/qhgtOosDTpQsdtmgw78kgdQqqP3JoJoBWYu/rFBg450rLI9QO/U6ur2/UK2Z0MnY2Q7uWMfrlZE8nTXcKN4sGqHHoRndeA7HoIA3OZz7O4NRr9UI29o0D9R6Gz3Hv8mTZnDGXgHZ3+vJMrRy0gqLhT5lbfIZ3TGPBFR777wEd/4pIoRPbWxdqBYrqutUvj1kmKMGUeYWA38lzY7h
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(36860700001)(6512007)(2906002)(956004)(2616005)(336012)(8936002)(33656002)(47076005)(44832011)(186003)(36756003)(6666004)(966005)(82310400003)(4326008)(316002)(6486002)(356005)(70586007)(26005)(508600001)(53546011)(6862004)(83380400001)(81166007)(6506007)(70206006)(8676002)(54906003)(5660300002)(81973001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 14:46:41.2227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c54545a0-a11c-41ce-5fd1-08d9828ec8bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3616



> On 28 Sep 2021, at 09:39, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> This will help prevent the CI loop from having build failures when
> `checkpolicy` isn't available when doing "randconfig" jobs.
>=20
> To prevent "randconfig" from selecting XSM_FLASK_POLICY when
> `checkpolicy` isn't available, we will actually override the config
> output with the use of KCONFIG_ALLCONFIG.
>=20
> Doing this way still allow a user/developer to set XSM_FLASK_POLICY
> even when "checkpolicy" isn't available. It also prevent the build
> system from reset the config when "checkpolicy" isn't available
> anymore. And XSM_FLASK_POLICY is still selected automatically when
> `checkpolicy` is available.
> But this also work well for "randconfig", as it will not select
> XSM_FLASK_POLICY when "checkpolicy" is missing.
>=20
> This patch allows to easily add more override which depends on the
> environment.
>=20
> Also, move the check out of Config.mk and into xen/ build system.
> Nothing in tools/ is using that information as it's done by
> ./configure.
>=20
> We named the new file ".allconfig.tmp" as ".*.tmp" are already ignored
> via .gitignore.
>=20
> Remove '=3D y' in Kconfig as it isn't needed, only a value "y" is true,
> anything else is considered false.

I don=E2=80=99t know if it is true, I=E2=80=99m having a look here:=20
https://www.kernel.org/doc/Documentation/kbuild/kconfig-language.txt

And the section =E2=80=9CMenu dependencies=E2=80=9D states that:

An expression can have a value of 'n', 'm' or 'y' (or 0, 1, 2
respectively for calculations).

So it seems to me that m and y are evaluated as true, am I wrong?

Cheers,
Luca

>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> v4:
> - keep XEN_ prefix for HAS_CHECKPOLICY
> - rework .allconfig.tmp file generation, so it is easier to read.
> - remove .allconfig.tmp on clean, .*.tmp files aren't all cleaned yet,
>  maybe for another time.
> - add information about file name choice and Kconfig change in patch
>  description.
>=20
> v3:
> - use KCONFIG_ALLCONFIG
> - don't override XSM_FLASK_POLICY value unless we do randconfig.
> - no more changes to the current behavior of kconfig, only to
>  randconfig.
>=20
> v2 was "[XEN PATCH v2] xen: allow XSM_FLASK_POLICY only if checkpolicy bi=
nary is available"
> ---
> Config.mk          |  6 ------
> xen/Makefile       | 20 +++++++++++++++++---
> xen/common/Kconfig |  2 +-
> 3 files changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/Config.mk b/Config.mk
> index e85bf186547f..d5490e35d03d 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -137,12 +137,6 @@ export XEN_HAS_BUILD_ID=3Dy
> build_id_linker :=3D --build-id=3Dsha1
> endif
>=20
> -ifndef XEN_HAS_CHECKPOLICY
> -    CHECKPOLICY ?=3D checkpolicy
> -    XEN_HAS_CHECKPOLICY :=3D $(shell $(CHECKPOLICY) -h 2>&1 | grep -q xe=
n && echo y || echo n)
> -    export XEN_HAS_CHECKPOLICY
> -endif
> -
> define buildmakevars2shellvars
>     export PREFIX=3D"$(prefix)";                                         =
   \
>     export XEN_SCRIPT_DIR=3D"$(XEN_SCRIPT_DIR)";                         =
   \
> diff --git a/xen/Makefile b/xen/Makefile
> index f47423dacd9a..7c2ffce0fc77 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -17,6 +17,8 @@ export XEN_BUILD_HOST	?=3D $(shell hostname)
> PYTHON_INTERPRETER	:=3D $(word 1,$(shell which python3 python python2 2>/=
dev/null) python)
> export PYTHON		?=3D $(PYTHON_INTERPRETER)
>=20
> +export CHECKPOLICY	?=3D checkpolicy
> +
> export BASEDIR :=3D $(CURDIR)
> export XEN_ROOT :=3D $(BASEDIR)/..
>=20
> @@ -178,6 +180,8 @@ CFLAGS +=3D $(CLANG_FLAGS)
> export CLANG_FLAGS
> endif
>=20
> +export XEN_HAS_CHECKPOLICY :=3D $(call success,$(CHECKPOLICY) -h 2>&1 | =
grep -q xen)
> +
> export root-make-done :=3D y
> endif # root-make-done
>=20
> @@ -189,14 +193,24 @@ ifeq ($(config-build),y)
> # *config targets only - make sure prerequisites are updated, and descend
> # in tools/kconfig to make the *config target
>=20
> +# Create a file for KCONFIG_ALLCONFIG which depends on the environment.
> +# This will be use by kconfig targets allyesconfig/allmodconfig/allnocon=
fig/randconfig
> +filechk_kconfig_allconfig =3D \
> +    $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), echo 'CONFIG_XSM_FLASK_=
POLICY=3Dn';) \
> +    $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG);) \
> +    :
> +
> +.allconfig.tmp: FORCE
> +	set -e; { $(call filechk_kconfig_allconfig); } > $@
> +
> config: FORCE
> 	$(MAKE) $(kconfig) $@
>=20
> # Config.mk tries to include .config file, don't try to remake it
> %/.config: ;
>=20
> -%config: FORCE
> -	$(MAKE) $(kconfig) $@
> +%config: .allconfig.tmp FORCE
> +	$(MAKE) $(kconfig) KCONFIG_ALLCONFIG=3D$< $@
>=20
> else # !config-build
>=20
> @@ -368,7 +382,7 @@ _clean: delete-unfresh-files
> 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} =
\;
> 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map=
 $(TARGET)-syms $(TARGET)-syms.map *~ core
> 	rm -f asm-offsets.s include/asm-*/asm-offsets.h
> -	rm -f .banner
> +	rm -f .banner .allconfig.tmp
>=20
> .PHONY: _distclean
> _distclean: clean
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index db687b1785e7..eb6c2edb7bfe 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -251,7 +251,7 @@ config XSM_FLASK_AVC_STATS
>=20
> config XSM_FLASK_POLICY
> 	bool "Compile Xen with a built-in FLASK security policy"
> -	default y if "$(XEN_HAS_CHECKPOLICY)" =3D "y"
> +	default y if "$(XEN_HAS_CHECKPOLICY)"
> 	depends on XSM_FLASK
> 	---help---
> 	  This includes a default XSM policy in the hypervisor so that the
> --=20
> Anthony PERARD
>=20
>=20


