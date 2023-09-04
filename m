Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B095179192E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 15:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595241.928740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdA3C-000379-Qe; Mon, 04 Sep 2023 13:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595241.928740; Mon, 04 Sep 2023 13:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdA3C-00034e-NM; Mon, 04 Sep 2023 13:55:34 +0000
Received: by outflank-mailman (input) for mailman id 595241;
 Mon, 04 Sep 2023 13:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUi+=EU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qdA3B-00034Y-IZ
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 13:55:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b577fd0a-4b2a-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 15:55:30 +0200 (CEST)
Received: from DU7PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::11) by PAVPR08MB9818.eurprd08.prod.outlook.com
 (2603:10a6:102:31e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 13:55:23 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:50f:cafe::15) by DU7PR01CA0016.outlook.office365.com
 (2603:10a6:10:50f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Mon, 4 Sep 2023 13:55:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.23 via Frontend Transport; Mon, 4 Sep 2023 13:55:22 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Mon, 04 Sep 2023 13:55:22 +0000
Received: from 19383bff2fb9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E41A57D0-1BE3-4D96-9AFE-9A9D90BF3201.1; 
 Mon, 04 Sep 2023 13:55:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19383bff2fb9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 13:55:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB7614.eurprd08.prod.outlook.com (2603:10a6:10:31c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 13:55:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 13:55:13 +0000
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
X-Inumbo-ID: b577fd0a-4b2a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9sJABUIlpmpXiKQpuaGlgUW15tWjkX/1AIiQ/CZppA=;
 b=VlhXaBhUkMdUeNwYACPaKqBNwhUaBloQlLhDML0DhDxSj+/5/PBLLtidolttLqAaF2E+dxj0AJ+m+0ctcSgP8rOi37wDejPq0xzvnM0j2/A0BNvag1+USKMbCpKYVlX0VnzCr1MdnnyWRUtyZQdR1HdJZ3SmYtCboTrhN3DxwBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 303382f8088a1de0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLRxaiz/8iX6aZNLzWAd1SEmdXGDhCuApSAv/Lxdcr9PC+g05+7qVgZBZ3IKCqrS2ssRqqgg+9WPs99XwQ6RmY5Kt8wsHZhyokDYtFOiiNZ2SpPz0gDZxfoVwUoKm+ZNLSfcYNO3JxUxkpZ3mONPErQuNKmOywclRBpjvgezor7645oAPdllQvdlex7lxPGMJVC6P7CfAtY+w59g+HptgjqNGNRokYx6y0SaEHASz9zZ02p9/NoAg3ROV7lNu+seB8qTAqjl3T6eVTrp/+B+Mpuzklhf23X9JjuWJNVr9542RPiDZ2HVpXvNbRt5ieb0RXBWuhn+wRac5K6547EEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9sJABUIlpmpXiKQpuaGlgUW15tWjkX/1AIiQ/CZppA=;
 b=YXdmNQN0HnBbaFQsSlGNxJ+oB98jb6HXeaVutSOowXWZSzhVWZPhSB5DZdKJd6My6yRZz4evEycYcLPTwKB+rp+SWnlqkqpKIkHz+i7vN41zMWETAKz7wced0Zvw5AxD3TaLqfR+Ps4s90gEbjguxaWze399s4GQjvseUL67RC0clNV4mKTQE2pnOATeSWb2K+Tuan/vs4zueMYuomavJpRjTRcX58y6v2h/fs5Zj+Aq4afy1iAuOuDRqNUsO2YaOuseiTGns33uUcILzRi+FM49dXaP25WAhrXs7kCI1pgwuhFWwXxqMmFbsgYjZexCDql9E9PG8DTNbRTVv87sSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9sJABUIlpmpXiKQpuaGlgUW15tWjkX/1AIiQ/CZppA=;
 b=VlhXaBhUkMdUeNwYACPaKqBNwhUaBloQlLhDML0DhDxSj+/5/PBLLtidolttLqAaF2E+dxj0AJ+m+0ctcSgP8rOi37wDejPq0xzvnM0j2/A0BNvag1+USKMbCpKYVlX0VnzCr1MdnnyWRUtyZQdR1HdJZ3SmYtCboTrhN3DxwBY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH v1 2/2] xen/arm: Enlarge identity map space to 127TiB
Thread-Topic: [PATCH v1 2/2] xen/arm: Enlarge identity map space to 127TiB
Thread-Index: AQHZ2/qDuICFuFkYAUiWEvnuJknicbAKttaA
Date: Mon, 4 Sep 2023 13:55:12 +0000
Message-ID: <338BB8BD-5B22-4201-8411-4836B5768AF4@arm.com>
References: <20230831110107.2747633-1-leo.yan@linaro.org>
 <20230831110107.2747633-3-leo.yan@linaro.org>
In-Reply-To: <20230831110107.2747633-3-leo.yan@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB7614:EE_|DBAEUR03FT026:EE_|PAVPR08MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: bf101268-d60f-4efb-a56b-08dbad4e9572
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5dzq1eIC8XladPpurYc47y/u7/6BKAtEguPzUyhS0Df02uw2B0Dn7bm/LrCbEfsBYnzJIBOyD1udfnQyDweNOadybdQotWo3yQGGga2U3ifnbBzPKe3Ptt1RGD+FD90i1cs+6thWTz6OokIUz9h4QVFbkCiyNqX9jD1Lxb/RQCNJQsIuzlXyCiGwGNwcNwq/8CWIVEzUcUHGG8IOSgDa30zAEqV7Cx1xm6UgDc4HdRWACa77BLqqpVKMn2mCuRg2BkSTaz5yclnYVFH/nKDduchoJz+LX/czFjS2OBd5DN0iLL93uMrh5ks7a8lUevYdT6W1ODFcYjZO1Yj0v8lTyQNXWRfu5ZXN/nVi4M1S6rCZ4ibJ518A4u4gFrGe0q9oJwYzXcRKb/ZDD+H2Ti/QWgfNDIU5izJQ8DlCUKI45eYK8O3uK+hfAASv6od4oX2TS90xPaBMW+wU6q5k0QwRG4JsPuBuh0ELzDVpQhCGPmlf6VGb+L9ajUKl8eS5HIaApqKkJFKHrJ/q08ga5WJz/zUHPBV8o85tpgD1gtLjFRFdTW6EOSJqEmU+lr96Tvu90fSLwS9W9Wvuq/v3Vc5LR4f0kjyjYB7lhRwzZ23dzTh8J6U9OghmZKsUVmtY0Ge6FvpV4Pe7bgRMsAzFdtmC66oWj9+IR1ZbUfO8zHM4O+aMwNh8hETszTKJPMLFu88w
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199024)(186009)(1800799009)(66476007)(6916009)(66446008)(76116006)(2906002)(66946007)(36756003)(64756008)(54906003)(86362001)(316002)(33656002)(91956017)(66556008)(5660300002)(4326008)(8936002)(8676002)(41300700001)(6512007)(2616005)(38070700005)(83380400001)(26005)(38100700002)(478600001)(122000001)(71200400001)(6486002)(6506007)(53546011)(147533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5D4E2AB5DAD68A47886EEAC979496884@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7614
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1607ec36-06b4-4c8a-77a7-08dbad4e8f63
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vTtHTeBn7t0iAProvMTue/+UH0LA3bv/iV8EjPGaQm2MH8YGxhcALyLlYB3YLlEaRWMxYHG3oNfihY6tIRFaomY7A5481I5jC7WOOUOLNgiqMf02zpzZAPCGeSAEWxKeyr3m6pyRdSePyhmbOCRZrsKrxVwoNrX7hyu8jS2GG/0ua4ohfKmhBw3SPYRxyufwjDtEV8PZHpbWoFOYsXj/lx0MAl0G7gj2WRQtxPqJnTBFl0yOasaIMlXi69rWPvi5S+lZgU1upbnlego2h1UGplqQ9IfLb+0hUM4pCB15ucZQPkiZ9STsCO3kmrQ249KVpds5hqwjEuca+BZvm2lPpLzOt8tB1i/eGWSRLMTD+33pqiMdvEhSB98GncIAhGIa1zSTfIVDOBZS67a5M9IwHwkS4MDzXVtL4qmyDYBb+asGQUjNQd8i64e4lEuV50L0nIA77+GzOiCpkaxsMKBc/sgBqO34Hp7JqzQo9dA545zNA2ICAoAj0yJQ8LwHMVUlRkk7l1cyXeyPwMR0gvhWx6n4UlGNedmbrjMcV8JDib0TRnzZjoaChJIKRAleMQDrjdrpWoYhhsCOEhiyK4xHUWTvb+oUF+ale1YkC/fL6zvMoz5K/IOLK/PQ8MC6pkF99eygkiRTUJWnfur5l/EGR2AsByfk4jJAiVYJzgD5CzW2srtFzO+oQVjx1iy57MqVOZUzBdoqUut8zWDaxFUozQlmJXXsT2RyRngYda/6+caYe2Sjw0kh6uLFFKlMM2CxVvE9L0dtnn+dUb/OjPRE8Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39850400004)(451199024)(186009)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(2906002)(36756003)(54906003)(86362001)(316002)(70586007)(70206006)(33656002)(40480700001)(5660300002)(4326008)(8936002)(8676002)(6862004)(41300700001)(40460700003)(107886003)(6512007)(47076005)(2616005)(83380400001)(336012)(26005)(36860700001)(478600001)(81166007)(356005)(82740400003)(6486002)(6506007)(53546011)(147533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 13:55:22.9430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf101268-d60f-4efb-a56b-08dbad4e9572
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9818

Hi Leo,

> On 31 Aug 2023, at 13:01, Leo Yan <leo.yan@linaro.org> wrote:
>=20
> On some platforms, the memory regions could be:
>=20
>  (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>  (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>  (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>  (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
>=20
> In this case, the Xen binary is loaded above 2TB, so Xen fails to boot
> up due to the out of the identity map space.
>=20
> This patch enlarges identity map space to 127TiB, which can support the
> memory space [0x0 .. 0x00007eff_ffff_ffff], thus it has flexibility for
> support different platforms.
>=20
> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/di=
sable")
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

This is not based on the current status of staging where this part of the
code was modified.

Currently Xen virtual address is at 2TB and the extension you are making
will potentially make it possible to load Xen at 2TB which will clash for t=
he
identity mapping handling in Xen.

Please rebase on the latest staging and check there how you can do as
this patch if rebased on staging right now with rightfully end in a compila=
tion
error.

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/config.h | 9 +++------
> 1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm=
/config.h
> index 21f4e68a40..3e97c95b57 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -87,11 +87,11 @@
>  *   2G -   4G   Domheap: on-demand-mapped
>  *
>  * ARM64 layout:
> - * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
> + * 0x0000000000000000 - 0x00007effffffffff (127TB, L0 slots [0..253])
>  *
>  *  Reserved to identity map Xen
>  *
> - * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
> + * 0x000007f000000000 - 0x00007fffffffffff (1TB, L0 slot [254..255])
>  *  (Relative offsets)
>  *   0  -   2M   Unmapped
>  *   2M -  10M   Xen text, data, bss
> @@ -103,9 +103,6 @@
>  *
>  *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>  *
> - * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
> - *  Unused
> - *
>  * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
>  *  1:1 mapping of RAM
>  *
> @@ -117,7 +114,7 @@
> #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
> #else
>=20
> -#define IDENTITY_MAPPING_AREA_NR_L0 4
> +#define IDENTITY_MAPPING_AREA_NR_L0 254
> #define XEN_VM_MAPPING SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
>=20
> #define SLOT0_ENTRY_BITS  39
> --=20
> 2.39.2
>=20


