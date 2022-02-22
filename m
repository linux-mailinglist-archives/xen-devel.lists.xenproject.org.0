Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA94BFC5B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276839.473153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWz5-00050P-Sy; Tue, 22 Feb 2022 15:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276839.473153; Tue, 22 Feb 2022 15:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWz5-0004xy-Pi; Tue, 22 Feb 2022 15:21:47 +0000
Received: by outflank-mailman (input) for mailman id 276839;
 Tue, 22 Feb 2022 15:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+sy=TF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nMWz3-0004xs-Lp
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:21:45 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe09::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 244c0b16-93f3-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:21:43 +0100 (CET)
Received: from FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::8) by
 DBAPR08MB5861.eurprd08.prod.outlook.com (2603:10a6:10:1a3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Tue, 22 Feb 2022 15:21:39 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::4) by FR0P281CA0003.outlook.office365.com
 (2603:10a6:d10:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Tue, 22 Feb 2022 15:21:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 15:21:38 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Tue, 22 Feb 2022 15:21:37 +0000
Received: from 1da513be42aa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07908EFA-249C-4D96-85D2-07C563C75125.1; 
 Tue, 22 Feb 2022 15:21:22 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1da513be42aa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Feb 2022 15:21:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB7338.eurprd08.prod.outlook.com (2603:10a6:20b:445::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 15:21:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 15:21:20 +0000
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
X-Inumbo-ID: 244c0b16-93f3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1Sg6hmdGSK+VnQcAqi4CNwLfN1N+8PC0oP3vF7S+a0=;
 b=IYW6sqDnW0Tx1UO62Vrqk9WkTRg9YQ6+sHvtDYmjtrUFR4GiSqxcXP2Cj1elDdjDr9d6QExJ3SvJWwrO7I3w1qu0zhL3V9zllCvPMJDI4KB9rZEd0+bJ0mq96tNto0MQfk8Yt6ci7TYW1fBz/7Xmh1Rn7ePpPEoZetqc5NI1/og=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8be3d795d342b181
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtlEFej1kKjLYlfduQO+GbCM215cmg5lQF0wh4dW0rHOtTVo3iKOEw56LxlhOrINGH2B85srkFPzbWHvLkIXdIB/qQnFDAau+thm3NcTaZOvC+DdQpKOSM8i/bYkVq5rmsYrf2S2NXi0aZemoNDtJOlwFJCKuHTl1XFpViPNotwieqM1kkzeRast0jiLiOLnYdCzWHg7TpByOn0WQgABbEBOJw2uYRJMTkgt72ruK+zPbRDq3NRaY30o1XcTaY7MfLDSL/BD8yEa+sJ6neFcQ+qU9TwA2NKGBV8mhKhYWK8UJhX7zdwnRtKrCBUKDGs/LBjeaVH8qTp9ZJd+lrxjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1Sg6hmdGSK+VnQcAqi4CNwLfN1N+8PC0oP3vF7S+a0=;
 b=iA5o+hXHPjhNLU/frNNdbRZB/aa4tvj3hL+mxZrDFcSl2XQP0bPPpE8N1W9ner7fJfqOhvY6bSTRiQ4ttGwBhKCyh7pWWsXIJST7c4lZB0ESuwKCzj9jsYZD1Pwk66PJZhLgeIoAl96IORcZy1Il58o7cCqp0kEjbJ8l0ufPYo44WZeVEcwC8A/ODKMRgxmYg8nBVl1wnfG1aGNGrkMnKYauCORV3KZvDjS1kCHsGm3x91OStciUQtjvCaZVPo9NbjrZRembUW69uuIHk9v95NkjrddROEvW/UQ6GkAkfgSGQudPI3N+Xxe0TS3B7H45hYdiq8ZlV4F3ze/mTI+xAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1Sg6hmdGSK+VnQcAqi4CNwLfN1N+8PC0oP3vF7S+a0=;
 b=IYW6sqDnW0Tx1UO62Vrqk9WkTRg9YQ6+sHvtDYmjtrUFR4GiSqxcXP2Cj1elDdjDr9d6QExJ3SvJWwrO7I3w1qu0zhL3V9zllCvPMJDI4KB9rZEd0+bJ0mq96tNto0MQfk8Yt6ci7TYW1fBz/7Xmh1Rn7ePpPEoZetqc5NI1/og=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 01/19] xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS to
 LPAE_ENTRY_MASK_GS
Thread-Topic: [PATCH v3 01/19] xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS to
 LPAE_ENTRY_MASK_GS
Thread-Index: AQHYJwzyz49F2mM0IUmkmDU5Z+UrjKyfsZUA
Date: Tue, 22 Feb 2022 15:21:20 +0000
Message-ID: <5FD206B8-D32B-4AD1-92E7-31BAFCB73AFD@arm.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-2-julien@xen.org>
In-Reply-To: <20220221102218.33785-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 923733b2-0f71-4efb-7ffd-08d9f617057e
x-ms-traffictypediagnostic:
	AS8PR08MB7338:EE_|VE1EUR03FT009:EE_|DBAPR08MB5861:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5861FE3DB961C451B73716329D3B9@DBAPR08MB5861.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Jzp0s7q2D1EK3Ik28DdEygkjEjIBXM4BWkG8X9GOveXvYR0F6Q3nTfTWnBhlVb3jMDGPGrlCjpj+546WIixaMYzUaZE32XfQFLJ7Xah9Tm6MfwQuU6/lVzc22X1DZhTzgJkNha47ufwMGZZMk1hf3H4gPIB9fFlj+PZb4Ntana0SKdyvmO0h3bOnIGUwMmoxOOFJEewfZfECRjptjE28p93lCU55+3O4yiCIVv/JkmV4xQiMSHfCKnLjH1CgNPaJ669SloKYnuIafHKb0nCRAY0Ivj/Du5Ue6Bcvvd5LyqnbTC9VAw8TbgCVH6eu2QtBFSEg94a7w3rt9BS+SqjJfs/d/B4teJ8G9hYwEKKG532ECj3lyg/2L4AHZ1NilVXkGDBLQ6LREQ21z+6FbawoUKx/dxQtyJ91Ap0sBwFFF/ZfCQSSXCP3x09HvbFR3alYUiYnAfOIZ3Y8umI9PaHs/JcJYcAUInXveoA4FgLiwkGn/Fky9YYInNIV/I6FbT+eFoGB0Ahocl+Y3qZ8c2XWsuPiJYLICYrjKJZWf6wkqRrvKVx6dc5HRRqOnALhBQq0Kq8DVnzutfwNgdcE0pmcxtfsClDeHPKvYAghmOoG5wGiKH2K7UQ/FJeTfzMQf5dTF/P3IJSee6b1ch/2Nti4iIclUsjO/wx5gm75zYeMlbmg6E0HaSxBob782tsmSmrEbEWEvhwY7qrhZI1YGpD1GSLNHfDSsPRwu8WMWk2NqREhnkqUpXwOkwtqO31pLLvp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(186003)(5660300002)(2616005)(26005)(122000001)(6512007)(38100700002)(8936002)(86362001)(2906002)(316002)(76116006)(64756008)(66946007)(71200400001)(83380400001)(36756003)(66476007)(66446008)(91956017)(54906003)(6916009)(53546011)(6506007)(6486002)(33656002)(8676002)(508600001)(4326008)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A86A7EB0CAC66F45826C2A9DECE278B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7338
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3702f9d-ead1-4efa-a19b-08d9f616fad4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3G5aUHqYfrXq6/lGOjyGuftmBLstJZyj6VYtKk02CG37At980w7d16xRutOy7bU2AgtKYeC2fIPTVXFtj7BYdM2eTCFjNjVqAe1vrxUWLbPwwR9YmKFm4bz9VrZVl+zaythGjK0QBT0sdT+oVlKs99ig40uUcFGbyso40d77vU7swqNu0nHu55qz3C6SBD832LhZtwAtB0J3fL3rADy+B7DZAmHh48qFCkzF+AtajQ0JnjyrIvwBFUPQUcE+LKV8Qs48HJ/GIWEIAi+EMByoSkZ80XsR2qtEFxYoYG5uKZsiw8yiTjxh7WRtdcyEQzj6E/qrZkgfa3bZeo8ouaGy2I01Czi6UNi8qmvT+hLs1aeDQ+Xu6/RRz6H17sN48i5zBR1I6VbuXap8CyE8n49Hd6cU0JZp0tX1TTrU4B75LLvGDM5a2hi5B5ThrLA6yChhHtWjzldq8HWTiKfOdcRJ26x8rnty7+xPiXEKaQHfc5vupN0ipjnmC2ZTbJLrjobehpOiJz+OamHRsluaeMC3dIWnQmGFOQckWp8WdPPUk+npfLICQxsC/bW+lJjAA/k+Jlor5v10jJjW6rF+1KSAvirFS89jU4uvqs3KYc+uiewv4D5LE1eRrbl66WtKaMRIQTKqaBC9I3vZPLY+nI0OLZLH2y0kZiIDphf1q3QOlNDON3ejBpdsYK8BuygbruCY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(336012)(33656002)(36860700001)(316002)(82310400004)(70206006)(70586007)(4326008)(6862004)(8676002)(6486002)(508600001)(2616005)(5660300002)(6506007)(53546011)(6512007)(186003)(83380400001)(26005)(356005)(81166007)(86362001)(107886003)(8936002)(36756003)(54906003)(2906002)(47076005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:21:38.5399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 923733b2-0f71-4efb-7ffd-08d9f617057e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5861

Hi Julien,

> On 21 Feb 2022, at 10:22, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 05031fa87357 "xen/arm: guest_walk: Only generate necessary
> offsets/masks" introduced LPAE_ENTRIES_MASK_GS. In a follow-up patch,
> we will use it for to define LPAE_ENTRY_MASK.
>=20
> This will lead to inconsistent naming. As LPAE_ENTRY_MASK is used in
> many places, it is better to rename LPAE_ENTRIES_MASK_GS and avoid
> some churn.
>=20
> So rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With the 2 small fixes suggested by Michal, you can add my
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>    Changes in v2:
>        - New patch
> ---
> xen/arch/arm/include/asm/lpae.h | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/l=
pae.h
> index e94de2e7d8e8..4fb9a40a4ca9 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -180,7 +180,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsi=
gned int level)
>  */
> #define LPAE_SHIFT_GS(gs)         ((gs) - 3)
> #define LPAE_ENTRIES_GS(gs)       (_AC(1, U) << LPAE_SHIFT_GS(gs))
> -#define LPAE_ENTRIES_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
> +#define LPAE_ENTRY_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
>=20
> #define LEVEL_ORDER_GS(gs, lvl)   ((3 - (lvl)) * LPAE_SHIFT_GS(gs))
> #define LEVEL_SHIFT_GS(gs, lvl)   (LEVEL_ORDER_GS(gs, lvl) + (gs))
> @@ -188,7 +188,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsi=
gned int level)
>=20
> /* Offset in the table at level 'lvl' */
> #define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
> -    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRIES_MASK_GS(gs))
> +    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRY_MASK_GS(gs))
>=20
> /* Generate an array @var containing the offset for each level from @addr=
 */
> #define DECLARE_OFFSETS(var, addr)          \
> --=20
> 2.32.0
>=20


