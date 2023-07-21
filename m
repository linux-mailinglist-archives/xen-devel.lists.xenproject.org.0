Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893EF75C27D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 11:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567432.886469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMm75-0002eP-MD; Fri, 21 Jul 2023 09:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567432.886469; Fri, 21 Jul 2023 09:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMm75-0002c6-I8; Fri, 21 Jul 2023 09:07:51 +0000
Received: by outflank-mailman (input) for mailman id 567432;
 Fri, 21 Jul 2023 09:07:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=So7w=DH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qMm73-0002c0-UK
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 09:07:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f7fa0af-27a6-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 11:07:47 +0200 (CEST)
Received: from DB8PR06CA0047.eurprd06.prod.outlook.com (2603:10a6:10:120::21)
 by PAVPR08MB9860.eurprd08.prod.outlook.com (2603:10a6:102:2f4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 09:07:43 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::70) by DB8PR06CA0047.outlook.office365.com
 (2603:10a6:10:120::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 09:07:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.34 via Frontend Transport; Fri, 21 Jul 2023 09:07:43 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Fri, 21 Jul 2023 09:07:43 +0000
Received: from 945dda9b1bc1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09A08A93-9E4E-4AC3-9C7F-9F3904517B36.1; 
 Fri, 21 Jul 2023 09:07:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 945dda9b1bc1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 09:07:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB9810.eurprd08.prod.outlook.com (2603:10a6:20b:605::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 09:07:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 09:07:35 +0000
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
X-Inumbo-ID: 0f7fa0af-27a6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4f1rTFssjmFsd+63GZ4Eqi/5EzeTrpFEiKa6FbhcdM=;
 b=p0VWnlajhFgb+ooocA+EiAsr9V35W0mzj7QZDAckboIRzaOnshwkCVAf6KxJOjVtvQ+n1FWFXmWVsKel6RwBe/H2zNmyTx+geyYLqChXnXnOpGd8LG+d3Hm/c5xeBp5jS3updNDRtjoJeFqZIrjvMeVxMDpGBC84QXsrchxqj14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb194719756ccf74
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsiHbK3oJ6RQ3K3PKUjoSI8/7Nyd949rhyjOS142J9HsRP6XQpVM7EmQPIaQND/6nd9PX9IfUgxe2J9omuGbz2xp80CgvY4J/dQXXx8IzvCTZH636zseS1gVQvusP+IFsw9MCpzi/vuzk81khj+9aSAikXdOrS8+S1WIP3GE+MZITbLab+PHiWCQV3iOmbr13svsQNcfOgrA8XqKAw6w+BhgeS+g58hxp4XPtmvFrYFGPBnsJRzj/iHFsQsro6rg4wOLAjUtxFG4Fe8mfH97m+OFi2IYab4dBS9ewft1dxG7UNVjIfUzO1fdoHBruOlvyhR0j4ZCW7WlBO7wJaMtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4f1rTFssjmFsd+63GZ4Eqi/5EzeTrpFEiKa6FbhcdM=;
 b=JyMhT1Y3bTRJuyswFw8A0Sz0rUIHTvV/jsfJEMziSgUvm1xp6k/CnQr+1CCXkF2eOft8gEhAu4NqFpM0uLDQDfNAkoIHlWU/M964nPwIIygat/Qzjbohz7luBxx7tL4v43tUpfRKu/cHB+T0pX+BgdnUFfPiytXervvc04C9n/MvEu0CCQYF5aMQfRef0/ChZvVkKGn23KRU4Cq/vlz7ivShl8wTPNGELq5FBzEd1e+yvfASOnUafD4knPRPYWmGQ3aqbVNUsutgTlGO79N0AfrqgEEyuWg6xd1CRlwAjsd1poUFekcdh7UE/qlH6//bvGcwl54ksQA+vGrx4dV5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4f1rTFssjmFsd+63GZ4Eqi/5EzeTrpFEiKa6FbhcdM=;
 b=p0VWnlajhFgb+ooocA+EiAsr9V35W0mzj7QZDAckboIRzaOnshwkCVAf6KxJOjVtvQ+n1FWFXmWVsKel6RwBe/H2zNmyTx+geyYLqChXnXnOpGd8LG+d3Hm/c5xeBp5jS3updNDRtjoJeFqZIrjvMeVxMDpGBC84QXsrchxqj14=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "jens.wiklander@linaro.org"
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Topic: [PATCH] xen/arm: Move TEE mediators in a kconfig submenu
Thread-Index: AQHZu6nFJdPelAC9nE2wzAZF/5qPkK/D6hwAgAAEFwA=
Date: Fri, 21 Jul 2023 09:07:35 +0000
Message-ID: <9E2CA0D9-1D1C-439B-BD81-8F4A80D034BD@arm.com>
References:
 <a44f74559f52d1fa90a3f77390e7d121c9cd848e.1689926422.git.bertrand.marquis@arm.com>
 <fa58a361-939c-6114-263f-0640156c235b@xen.org>
In-Reply-To: <fa58a361-939c-6114-263f-0640156c235b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB9810:EE_|DBAEUR03FT023:EE_|PAVPR08MB9860:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4c23d4-a33f-4a82-6443-08db89c9f162
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UWLpzgndaVVKQzOYw0NYGvlbuzLskLH9pqB8qhF9fOosgo1r9QneEeEUfd9z1FHNrxr7T0JRTvWcgJKXeJnxdkqIQdRTG2tF6jLtncY2vGCYN0yP9XFacfb4LrPXZCAz8/JZfDhf66kaY5j8oPTwKDAbEyI3iYlrc2h62PoCbaOvh6Jb47T2Z+6TyChi1QDP/Xajk92ea/rJWoeVxbde+dTTOqXisOezPJ20UoAptOEgNxe5eYUReyeBR+6OvoTBjosobXboS1nsMNARVx9l7AUODp4sLqgv3x6jL8abhjmfRMC3Q4wwMUEjdayYBb19pD8eMJ1vJcMcLRoTN/ZKnxlt/SEpjDi96BBDHqGKD4QbjFY0hvOYPG1CxnC7bNlsiakDT3NCl8qXA72OrGvrHC0S9NxcNhtSM0TjTrNEsHnSI64thTCqWyWk1VupPl6EIWRgfwyiEeRMW1b/tx0a4B/gfEyDdUwjgJ0qiBG3av8jIxc2ja/aJWQ/2bbSjSqC9/+NVoN1wcNGRwq4yAClu7MCAy5cBwxUjRsQlVFTWH9Tbub5j5+4/7/LpB6iYx9Z1bnl9bTdkL0cQp5cuoZVM6lzqDmYIpq2cSxStl9gsHo50eSda+So8KXzZJxCYkHA/NiODVDnQPdO9BoKZtrQdQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(6486002)(478600001)(91956017)(54906003)(71200400001)(36756003)(83380400001)(2616005)(33656002)(38070700005)(86362001)(2906002)(6512007)(6506007)(186003)(66476007)(53546011)(966005)(66556008)(38100700002)(5660300002)(122000001)(316002)(76116006)(8676002)(66446008)(64756008)(6916009)(8936002)(4326008)(66946007)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E8E11C4C3F358345BBE737B850BFC801@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9810
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d0852e8e-334f-4b03-853e-08db89c9ec76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xNrvfF/iG9jOPD8xN6KmDUw9N8uUdM0ImOzY6SPeAbnAE8gJ212vBTeL/8ANqZtCzFVhNNmkoD2XAm1LmopFzrDqE5Ospl1bCqosAX9R3lNC8IkPvooQpo+wPt02XqrqG3KalrCVlytGpa/l1kQ5MCI2s2LYETYfKkLIkm2xqrKLR3crHqpec2LGZsyYu6Jgi6V4g8p122St/sqCMwFliJnP/vXB3u+fW68npk8SrMNHtonimb4Mhx5oFmuNH1Ym1e9COdPEuD80WQ9fL2Ykjv0U18p94Pbj3E/aWi6P5/rKXZZLvR/UFUuMLnG5melmt/Jp22MqXVSkdJl71m7M1rxvPah4kuwlLiyBkU4lLfPk56cV33q/MPi68AN/P2CiPO2PR0fzuvY+GBPgfxeupnoM0J7uC0ibPdmIuiaTJBVtn9vDohb5r4Q/gbzB0tqqJIRGeF9g3UMm03ACinnL6o5Fo91iam0UyZcPq6eqPLSipKlz+4TJb7z0qRIpm/7UTlUKkZ+oBupigJyObZ7AAmdmcXN+149ZH2JcjCmXzrMcqQqfvpp7xONkHDEqdxGoOFwWCV2mIvVPWwHbw7KnQC/qEsbtJOXTEScO70vCja+G9Lp93URSxQmB2F5QxF35bE2pDXYmgpUWYgx938H19vNeaQbaz8KvzcZjyTME+fEbcJpuxPGsnDhRiylsVDthlqM5AT34ycwFB91Wa7P2Ft8JtDLKJECMZACuQV7VjTQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(82310400008)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(47076005)(2616005)(26005)(186003)(336012)(6506007)(107886003)(53546011)(36860700001)(83380400001)(4326008)(70206006)(316002)(70586007)(8676002)(6862004)(8936002)(5660300002)(41300700001)(6512007)(6486002)(966005)(2906002)(478600001)(54906003)(40480700001)(82740400003)(356005)(81166007)(33656002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 09:07:43.4089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4c23d4-a33f-4a82-6443-08db89c9f162
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9860

Hi Julien,

> On 21 Jul 2023, at 10:52, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 21/07/2023 09:02, Bertrand Marquis wrote:
>> Rework TEE mediators to put them under a submenu in Kconfig.
>> The submenu is only visible if UNSUPPORTED is activated as all currently
>> existing mediators are UNSUPPORTED.
>> While there rework a bit the configuration so that OP-TEE and FF-A
>> mediators are selecting the generic TEE interface instead of depending
>> on it.
>> Make the TEE option hidden as it is of no interest for anyone to select
>> it without one of the mediators so having them select it instead should
>> be enough.
>> Rework makefile inclusion and selection so that generic TEE is included
>> only when selected and include the tee Makefile all the time making the
>> directory tee self contained.
> The problem is now we will always recurse to the directory even if there =
is nothing to build. I would rather prefer reducing the build time (even if=
 here it would be minimal) over "self-contained" directory.

Makes sense, I will restore the obj-$(CONFIG_TEE) +=3D tee/ in the Makfile.

>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> I wasn't able to apply this patch cleanly on the latest staging.

I will rebase properly and send a v2.

>=20
>> ---
>>  xen/arch/arm/Kconfig      |  7 -------
>>  xen/arch/arm/Makefile     |  2 +-
>>  xen/arch/arm/tee/Kconfig  | 18 ++++++++++++++++--
>>  xen/arch/arm/tee/Makefile |  2 +-
>>  4 files changed, 18 insertions(+), 11 deletions(-)
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 439cc94f3344..fd57a82dd284 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -175,13 +175,6 @@ config ARM64_BTI
>>     Branch Target Identification support.
>>     This feature is not supported in Xen.
>>  -config TEE
>> - bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
>> - default n
>> - help
>> -   This option enables generic TEE mediators support. It allows guests
>> -   to access real TEE via one of TEE mediators implemented in XEN.
>> -
>>  source "arch/arm/tee/Kconfig"
>>    config STATIC_SHM
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 7bf07e992046..d47d5c20aa73 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -5,7 +5,7 @@ obj-$(CONFIG_HAS_PCI) +=3D pci/
>>  ifneq ($(CONFIG_NO_PLAT),y)
>>  obj-y +=3D platforms/
>>  endif
>> -obj-$(CONFIG_TEE) +=3D tee/
>> +obj-y +=3D tee/
>>  obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
>>    obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
>> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
>> index 923f08ba8cb7..cecbf7e12b43 100644
>> --- a/xen/arch/arm/tee/Kconfig
>> +++ b/xen/arch/arm/tee/Kconfig
>> @@ -1,7 +1,17 @@
>> +menu "TEE mediators"
>> + visible if UNSUPPORTED
>> +
>> +config TEE
>> + bool
>> + default n
>> + help
>> +   This option enables generic TEE mediators support. It allows guests
>> +   to access real TEE via one of TEE mediators implemented in XEN.
>=20
> We don't typically add an 'help' section for non-select option. In fact, =
it looks like menuconfig will not show the 'help'.

Yes i kept that one but it can be removed.
Will clean on v2.

>=20
>> +
>>  config OPTEE
>> - bool "Enable OP-TEE mediator"
>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>=20
> Given this is under 'TEE mediators', do we still need the 'if UNSUPPORTED=
'?

As explained to Jan, i used visible if which does not enforce the dependenc=
y, just a hint for the display.

I thought that it was clearer to keep things like that to make it easier to=
 have one of them supported in the future and i added the visible if just s=
o that there was not an empty menu.

I could also just use a
if UNSUPPORTED
 ...

endif

to surround everything if that is clearer.
Please tell me and i will push a v2.

>=20
>>   default n
>> - depends on TEE
>> + select TEE
>=20
> I was sort of hoping we could remove 'select TEE'. But I understand why y=
ou did it that way, you have one less selection to do. So I am Ok with that=
.

The fact that OPTEE or FFA was hidden before TEE was selected was kind of w=
eird i thought.

An other solution is to keep the select and leave TEE visible but I do not =
really see the reason to select TEE without one of optee or ffa selected so=
 i did it like that.

Cheers
Bertrand

>=20
>>   help
>>     Enable the OP-TEE mediator. It allows guests to access
>>     OP-TEE running on your platform. This requires
>> @@ -13,9 +23,13 @@ config FFA
>>   bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>>   default n
>>   depends on ARM_64
>> + select TEE
>>   help
>>     This option enables a minimal FF-A mediator. The mediator is
>>     generic as it follows the FF-A specification [1], but it only
>>     implements a small subset of the specification.
>>       [1] https://developer.arm.com/documentation/den0077/latest
>> +
>> +endmenu
>> +
>> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
>> index 58a1015e40e0..1ef49a271fdb 100644
>> --- a/xen/arch/arm/tee/Makefile
>> +++ b/xen/arch/arm/tee/Makefile
>> @@ -1,3 +1,3 @@
>>  obj-$(CONFIG_FFA) +=3D ffa.o
>> -obj-y +=3D tee.o
>> +obj-$(CONFIG_TEE) +=3D tee.o
>>  obj-$(CONFIG_OPTEE) +=3D optee.o
>=20
> Cheers,
>=20
> --=20
> Julien Grall



