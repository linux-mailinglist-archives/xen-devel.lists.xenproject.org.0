Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0177473D3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558393.872447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgny-0008M4-1z; Tue, 04 Jul 2023 14:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558393.872447; Tue, 04 Jul 2023 14:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgnx-0008K7-U1; Tue, 04 Jul 2023 14:14:57 +0000
Received: by outflank-mailman (input) for mailman id 558393;
 Tue, 04 Jul 2023 14:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGgnw-0008K1-Gn
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:14:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b750e8-1a75-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 16:14:54 +0200 (CEST)
Received: from AM0PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:208:3e::28)
 by AM7PR08MB5366.eurprd08.prod.outlook.com (2603:10a6:20b:10b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:14:52 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:3e:cafe::ef) by AM0PR02CA0015.outlook.office365.com
 (2603:10a6:208:3e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 14:14:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.22 via Frontend Transport; Tue, 4 Jul 2023 14:14:51 +0000
Received: ("Tessian outbound 546d04a74417:v142");
 Tue, 04 Jul 2023 14:14:51 +0000
Received: from b98e52ff82e0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA13D457-3978-4FC5-850C-D6A586231AB0.1; 
 Tue, 04 Jul 2023 14:14:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b98e52ff82e0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:14:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB8694.eurprd08.prod.outlook.com (2603:10a6:20b:55d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:14:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:14:42 +0000
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
X-Inumbo-ID: 25b750e8-1a75-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiVGKPFwbIjAlKAFWLXTaQK/I0D0UDw/eEEWsAhzXPg=;
 b=UNgw0JYu8wa3TwGbAukXqDDlwHrby01gtpIL+bw3RDK3OdYPvn9gkOhMGKbzOtXOe0BjJV5Iigc9TmPAN99o2JzknX4ogJiQYd9A6Ab4GaHXtG3BlGuIbkasQIOJCtenjDcdIlwyLHKhvnVGX2HXBaNZlDtKt/pMdVy22ugyBTE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4e1208e2f18b545
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5fWVKIqI+eAYhkEfon6JNNZsU4+vmmK8eSEqVy4X0AdaXPUIS1LEDXay1XZ0ONXhBdOvyWZ58WTzBWeE1SR2sVbEBkyBvOjEA6UMYbcCn0G5nC+7T1WpofKSUdKD6t3gouHZumaSSLBYoy+JIdsTKeYW0qmB6aHxQtyd9gL1eVylG7J8r4RuJF9yoK+4kYRVdt4lPIuuk85L4ZVsjM6SaSQu0EbxjaPNP08e3pKCQRwT8Gti5qOwcfePLkcS9Ht92TBBXl1ZeeskM8DwDgpGO0i08bTxtbQejsz5J4CFFbVSp3yVBmCjhZOGzVal/b7oCjyKDXL2S2gBXZqE36O1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiVGKPFwbIjAlKAFWLXTaQK/I0D0UDw/eEEWsAhzXPg=;
 b=LdpYJ11XL1Dmc4o9uuvOTrlUnBDk7YWvuX+yy28epW5W3dU2aFo0QSz2xFN2TaYBiI7h5T8myw+43OVECEZ21gSZPYb7hBiUP6yiLGjMG3ZhKbMIQHrqrBkkd7bMYN5xijTADcxgo5UuOYL+Nos4ytxo/OUKkStcqthiDxc7n01d4HiAVV2QZKwCFvAhkhzZzUnK99IcxjA9l8Lg4gfLS8rH64eZVxriQjea7MS9ehuxbmKASKcdDm1dtoeU94OjnE5Ak5UqimENB6lWhfQguBVbCQswxh8rVpeSjeF8YrSxjuh0Nutl3Ud03QWVtZXPUt9Ju4kLG/KWOE/tmnd48g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiVGKPFwbIjAlKAFWLXTaQK/I0D0UDw/eEEWsAhzXPg=;
 b=UNgw0JYu8wa3TwGbAukXqDDlwHrby01gtpIL+bw3RDK3OdYPvn9gkOhMGKbzOtXOe0BjJV5Iigc9TmPAN99o2JzknX4ogJiQYd9A6Ab4GaHXtG3BlGuIbkasQIOJCtenjDcdIlwyLHKhvnVGX2HXBaNZlDtKt/pMdVy22ugyBTE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Henry
 Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [v2 4/4] xen/arm: Allow the user to build Xen with UBSAN
Thread-Topic: [v2 4/4] xen/arm: Allow the user to build Xen with UBSAN
Thread-Index: AQHZqsX05lUuU4F5z0qXrKvpd1a/f6+prigA
Date: Tue, 4 Jul 2023 14:14:42 +0000
Message-ID: <6BC60C8C-745E-459F-91E3-FCFB5DDB9F76@arm.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-5-julien@xen.org>
In-Reply-To: <20230629201129.12934-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB8694:EE_|AM7EUR03FT004:EE_|AM7PR08MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a7f30c-d7bb-4346-66ae-08db7c990877
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6ciRGoJqmLtnabO/DcrJpfZ4cTHdlB1q6mXCtQIIsveAncXIOgDlnrRSdwpw1c9RL0q4Ph8wJh+6Hok0Ck66YBjb3ja7SNqfc7XgHxIGVRaa4feOt8mcSQm/DrTqnzPdcwGALugLeVmKr654+DP0irujmdjsVTFs4DHPFcXSgQhnk+CVgfz23krgpcwcvRqiHeT6BY/499fWflTvF4FoLu7YHrx22/bkZUuc4RmBnxPTC/N3UirczRSty2QNwl0CIdmXfeukNq50qE7jXEZHPNC1gkL5FN4oMZxW6Zwp0dIyH/CEoHKEsIOtC7sXvs6CQ5rAmAK6/57Ma3+2p1C5RXE/pbxihq/N+4io0lzcG64qA1lTgLcsrnUDcPrXjKp74vhlU1Tqv/qJHuGEohuFnEP6p1ipUM6Ec0p963uQSthcMCp6mObccjZDNVozs5qJUIlTCy2dkrbtxqQlP8SPzNHlYx3ukdHuI7afrCI53HIMoq48eT+fpDXQKffHyqxMoictfM/hqhsOvcQHha3718dWnCDUeihqeE6blzqumuT8ATrxRT93iPA+rGeaqbB2t2H+hexKY0QjZW98nIBc6ruYQe0prxDl3dFOQwHAYOzz40ZCcbDlp8OVFbTbNjDYPAzPQVl3RO8qzYJ8x87v8w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(478600001)(6506007)(71200400001)(6512007)(86362001)(2616005)(186003)(38100700002)(53546011)(54906003)(4326008)(6916009)(66946007)(66446008)(66476007)(66556008)(83380400001)(64756008)(6486002)(91956017)(76116006)(316002)(122000001)(8676002)(8936002)(38070700005)(41300700001)(2906002)(5660300002)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <07C1C1DEA003DC4C812C6418AB903CB2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8694
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b7eeb52-f06d-4a56-6170-08db7c99033c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FA58q3xECwUUPkRCu6xhnvnGUGr+ro1d8FmccKRKjlLLe94dLEiq2GgFNh3hpr65nFJZEe0Zdd1S6uuhuEUwd1GidbV8PNNVeLRtI9ub7ioiOXkLltml6tjC8KLjmscQosOtqWAHpArFf6Rvmxz6PA36mU48NUWbSVhcM6dX5Sl5QWZ+BEqzX6iG80X+nlxf9Zb0qoU+zqfYfc1DzoRgYWsAuSn5MsO0z1havFElPqplDFP7xuyptE9lpwcLcZVZsrk+u+OWCE9nboFa4RBfGkDKDa0LmYEfWN6WSKCGxuPBQ3cjvO3B3vKu34H0JNLj6D7uL69UTqf6HGgqpfnBkOkydRDDlED6ha2UvIbeQHNag70OfjKasMVxAdhNHDv+sYMbvlynmExwohps+YDr8lV7cRpbyHjrgdjh3KAel721NpXjwmwpjwgMByTWVOx053juKIq0KN3IYUJFtAaUQg5WtGugK42wm5tUZTSCpywoVmSslTXmUi5BJbwoSl8kqdZ6d3g30nZ5OlTKOuFb9RuMRZ7UP2WFEI8QMoWJ+Gk3/ZYz595am3gSf/d8H8EKVYKopcMAghvuXkmAoF9ckqNuZbxrposkJWoHOIDV8yDzDcdsGmZbQ+314R23wF2xgh2Vbj8fJ5cYoPyFif8h1se9aODGQxtQUh2t30ks4a2igNM6Nzklpj64UYG5eOrexxXlmCqRkyh/1/v/l3nFgg9hXmp+ANwK29+8yFZ2iHulhtxjLIyLb09HXH8oZ4AN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(2906002)(41300700001)(6862004)(5660300002)(8676002)(8936002)(82310400005)(33656002)(36756003)(40480700001)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(82740400003)(6486002)(70206006)(47076005)(316002)(70586007)(4326008)(36860700001)(107886003)(53546011)(81166007)(54906003)(336012)(83380400001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:14:51.6315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a7f30c-d7bb-4346-66ae-08db7c990877
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5366

Hi Julien,

> On 29 Jun 2023, at 22:11, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> UBSAN has been enabled a few years ago on x86 but was never
> enabled on Arm because the final binary is bigger than 2MB (
> the maximum we can currently handled).
>=20
> With the recent rework, it is now possible to grow Xen over 2MB.
> So there is no more roadblock to enable Xen other than increasing
> the reserved area.
>=20
> On my setup, for arm32, the final binaray was very close to 4MB.
> Furthermore, one may want to enable UBSAN and GCOV which would put
> the binary well-over 4MB (both features require for some space).
> Therefore, increase the size to 8MB which should us some margin.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I am ok with the drawback.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>=20
> The drawback with this approach is that we are adding 6 new
> page-table (3 for boot and 3 for runtime) that are statically
> allocated. So the final Xen binary will be 24KB bigger when
> neither UBSAN nor GCOV.
>=20
> If this is not considered acceptable, then we could make the
> size of configurable in the Kconfig and decide it based on the
> features enabled.
>=20
>    Changes in v2:
>        - Fix typoes
>        - Add Michal's reviewed-by tag
>        - Add Henry's  reviewed-by tag
>        - Add a comment regarding the reserved size for Xen
> ---
> xen/arch/arm/Kconfig              |  1 +
> xen/arch/arm/include/asm/config.h | 22 +++++++++++++---------
> 2 files changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 61e581b8c2b0..06b5ff755c95 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -17,6 +17,7 @@ config ARM
> select HAS_PASSTHROUGH
> select HAS_PDX
> select HAS_PMAP
> + select HAS_UBSAN
> select IOMMU_FORCE_PT_SHARE
>=20
> config ARCH_DEFCONFIG
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm=
/config.h
> index 6d246ab23c48..cc32802ad0e9 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -74,10 +74,10 @@
> /*
>  * ARM32 layout:
>  *   0  -   2M   Unmapped
> - *   2M -   4M   Xen text, data, bss
> - *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> - *   6M -  10M   Early boot mapping of FDT
> - *   10M - 12M   Livepatch vmap (if compiled in)
> + *   2M -  10M   Xen text, data, bss
> + *  10M -  12M   Fixmap: special-purpose 4K mapping slots
> + *  12M -  16M   Early boot mapping of FDT
> + *  16M -  18M   Livepatch vmap (if compiled in)
>  *
>  *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>  * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
> @@ -94,10 +94,10 @@
>  * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
>  *  (Relative offsets)
>  *   0  -   2M   Unmapped
> - *   2M -   4M   Xen text, data, bss
> - *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> - *   6M -  10M   Early boot mapping of FDT
> - *  10M -  12M   Livepatch vmap (if compiled in)
> + *   2M -  10M   Xen text, data, bss
> + *  10M -  12M   Fixmap: special-purpose 4K mapping slots
> + *  12M -  16M   Early boot mapping of FDT
> + *  16M -  18M   Livepatch vmap (if compiled in)
>  *
>  *   1G -   2G   VMAP: ioremap and early_ioremap
>  *
> @@ -124,7 +124,11 @@
> #define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
> #endif
>=20
> -#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
> +/*
> + * Reserve enough space so both UBSAN and GCOV can be enabled together
> + * plus some slack for future growth.
> + */
> +#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(8))
> #define XEN_NR_ENTRIES(lvl)     (XEN_VIRT_SIZE / XEN_PT_LEVEL_SIZE(lvl))
>=20
> #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
> --=20
> 2.40.1
>=20
>=20


