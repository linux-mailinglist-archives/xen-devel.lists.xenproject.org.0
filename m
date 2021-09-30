Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FB541D692
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 11:43:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199688.353900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsbA-0003zv-MI; Thu, 30 Sep 2021 09:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199688.353900; Thu, 30 Sep 2021 09:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsbA-0003xA-HV; Thu, 30 Sep 2021 09:43:28 +0000
Received: by outflank-mailman (input) for mailman id 199688;
 Thu, 30 Sep 2021 09:43:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YInd=OU=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVsb9-0003wh-9h
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 09:43:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::614])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 550c3535-fb4d-470f-95d9-d834d68aa1ba;
 Thu, 30 Sep 2021 09:43:25 +0000 (UTC)
Received: from AS8P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::11)
 by DB6PR0802MB2199.eurprd08.prod.outlook.com (2603:10a6:4:82::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 09:43:20 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::bf) by AS8P250CA0006.outlook.office365.com
 (2603:10a6:20b:330::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 09:43:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 09:43:19 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Thu, 30 Sep 2021 09:43:19 +0000
Received: from 544f83ba2cb5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F4DF077-0C78-4E01-AB13-5D50AB5A149C.1; 
 Thu, 30 Sep 2021 09:43:07 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 544f83ba2cb5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Sep 2021 09:43:07 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5706.eurprd08.prod.outlook.com (2603:10a6:102:80::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 09:43:04 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4566.017; Thu, 30 Sep 2021
 09:43:04 +0000
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
X-Inumbo-ID: 550c3535-fb4d-470f-95d9-d834d68aa1ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KOPRA8woA7GFpEEycwOKYeCiKXnsQNEbMEPlXO0pww=;
 b=Mhx7dB8aLPTrqT3jYKL1YbRmP+aY/cOwAVHjRMkMbYAOLvuZ4oj7IDlxVBictmkhaa+1pAXWkdspsZkQmuxQ8NpeXlYp8FXKDggBaIS5o+qAqWxLTQCiEfVjj++auaF0cPFSUyd4E2OR43Ddwd+vEO6EP9CuGS8T4CH/Nic6pog=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad706858e98831c1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3F4eW0gzz02pPthrk3IJF7VOpsW5zzJV4+R507WrpX2q64cqVRix7jUcVJlxKfMds1Yak72M5KfxorLqV38NzgeDpDYb/iAW/FSVlk2NGqvLPARUso3pobvPEXDpKEbT9gB7Be64crOQBdT3RLx8YM070adQZKqMq5/Z4wXmwqefNa7zrH6Qb62lDnW7xazwM0AVVp0AsHfREQ6OtMdYq3i9bu4qTkDr5AEy1qz9fAWissizk7CSISNs08vvAfxe/vtFr/9aX5b3QrnKxpgFWun/hd7nqjT3vunN3Q7gg+FupS9XOKJB5Gaj7LTarnUzrtF8b49Z0rB0mr3Inb69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+KOPRA8woA7GFpEEycwOKYeCiKXnsQNEbMEPlXO0pww=;
 b=RYWUzPk5k+KiUDhtXtEbW59WK2Yt0QrZlRDMBNWzO/qgJtyVlgtrDuCEWiQhl4apVUHTOB//hs0BVJalOrmeObRyNxHaCNctWB0wBxU1QpZsubwOthDA2jdaF4fXV0Lb2xx+7gZv9s3lDTOWWw9lETOl2RW9AIydjuNzVMCiPDnIxJBJgiKKDH0t0/UNl/LwmJi80GthLrnMJZzGi225iqJ4YVCDL73Xc6I+gnOfdZwR3PMz8pSaiDtLXLNXLc51agfGSp6ML8VI2MX5V1Q9Tf+ZMqlyXOrFztG5rsZzhPh8Yzu6APzRIkDYMJxRsaz/ef+YqyERmxUz+/oYtTNZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KOPRA8woA7GFpEEycwOKYeCiKXnsQNEbMEPlXO0pww=;
 b=Mhx7dB8aLPTrqT3jYKL1YbRmP+aY/cOwAVHjRMkMbYAOLvuZ4oj7IDlxVBictmkhaa+1pAXWkdspsZkQmuxQ8NpeXlYp8FXKDggBaIS5o+qAqWxLTQCiEfVjj++auaF0cPFSUyd4E2OR43Ddwd+vEO6EP9CuGS8T4CH/Nic6pog=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: Expose the PMU to the guests
Thread-Topic: [PATCH] xen/arm: Expose the PMU to the guests
Thread-Index: AQHXtd1dT9hAp9ZDCE6Sy/7vjqGAOqu8U2WA
Date: Thu, 30 Sep 2021 09:43:04 +0000
Message-ID: <50185DD3-12E0-419C-8B02-0486DB68F1C4@arm.com>
References: <20210930092651.1350-1-michal.orzel@arm.com>
In-Reply-To: <20210930092651.1350-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3fbf524c-418c-4cb6-24d3-08d983f6bc97
x-ms-traffictypediagnostic: PR3PR08MB5706:|DB6PR0802MB2199:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2199D2AD37740C7742A3AEC59DAA9@DB6PR0802MB2199.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c8bDp/63TcvhRjMcTlVBZ8oRzcGF4b4XO7rbTFIy7uWOyo3TO/OzjlPa0pKwjmmqrYaUfqbWRuG3dDHZumYBjqxa4eephEqCZEHiLhM+05IeBYTmRkTTL+WV8JtVx6OH/B1z0jp53q1K07zpoG/G3zlcJ6pfjWtSxEqERXRwkD3AqLvvcef21V0xTHVCnZ8ZB/8r6UnA47znBcVM2ze2Y7sgE48NyIBRPFnT0pvxp5LkBmCXU9XIz5LPZXdGLAAu3wnXzMGG1F2ouwpiBilKeShSgIwgbg+GVZev0TANP+3kyA+Meipypi9+iXFgmdEvVo1xyQW3tElFC+YsDr3wim6NtLQEm8SFmyzWlj2Q1PvMvMtVUO/zvhJF9a3658cUsThZyM3oNUpaopd62UBJfld8whyoXimKRbe8Y2BJuH8oo5YpJX1PlfXVH9A4hryWR4BHACQGtH5sqBCghR+bCoguSeAp3mhjwVvdrrH7L76wt0bzCMry8qY4XFQdzMeEezjHWXGdh/7axYCfx9Pr108kI1/hpugF0sS5uB7bJnCU6QozaAkFXb6+XoLWrsqQ7MusBZ0T4wsHtakEFTsldQVH7VdiJ/RO/YZtQwW0IZhJL7v4kDUi1BdQi2+ScTLs1UhKAwDIezjSHLp/sdgYa4J7q0lIfwzQ3+A69eTXJDuMsqSDP944oSBWVHsZzhUqNmu4ySmml5hDrwfobab9OJwZrHB5nfwWaOzA08bk3ik4sjExYlORrmo/4aVRnjz+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(64756008)(66446008)(33656002)(66946007)(2906002)(91956017)(76116006)(71200400001)(83380400001)(38070700005)(86362001)(122000001)(38100700002)(2616005)(6506007)(186003)(6862004)(4326008)(6512007)(508600001)(37006003)(316002)(53546011)(26005)(54906003)(7416002)(36756003)(6636002)(5660300002)(8676002)(8936002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CE6797C851093B439673652C316818F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5706
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8bff03ad-2531-4b3c-ddff-08d983f6b33f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7BvAGvCZXv/QA8mpJjWJ9/9CFcak97jCjY0dvQE6IWEm/zXSHwTUd6sUy72YStd6aR94J0e4RwKmP1aGkWkaCtibEjUvjNsYtQe6bnYmz3lYkGmoI1W0C1fvkqvtUk4frwta0vu692U3oFyaI+FKXUYGNyLsfkLIgLRIxURqxAGeno/W3H/w1xCq6KS83OgxJ9+wYBVSeLpGB0cu5W6ZF/T9IeLNL1FJiee1eUpm7IsxKZ59LUzAbZmc2IdimvZ3xV/bdc9ehjHIBidqLpO6MkLJ3ljZsg9NWKY1BSX+miaMKcFBpdYDsUG4YkbPoH8N5ldCMBrRHPPciPa5e7dE/2A2JV/tpSAcxay+G5cYDZjnCgZDjVvVyQOdCxpqQ+PntgyLhHsaiq5cIMY1c9ptaoohnmz292O2Zf9CY4q0FwFk+lEgvpCGFueNZLjGrieN2RuMF1jJvgvRvzCzhORrYIZ4a4XHk2rEDL+T4dQsqK4VppQnm5iXD1VDzxvPc0wMkJXQMwfHHbuASOAlY7XTVGE+ftoH4d31gzNAW9aH8HycqFQHuidvgD5OvFVbtcI+IcIU6Utfxidiaq9VNC93ZCNrp5XmNfYQYn9GvM8GVr0ThSWicKCocMCPPIVyc3+26Rn3g1xyeiQJ/BF/Fyp9ii6Zi129p3JTD7kewOZoKLdaQOKzAZxZ8xgOCxIUVSb4y7bBGZQfY4fP/RLFiMblZw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(356005)(81166007)(70206006)(8676002)(6486002)(26005)(70586007)(2906002)(2616005)(37006003)(6512007)(47076005)(8936002)(36860700001)(508600001)(6506007)(53546011)(6862004)(107886003)(83380400001)(36756003)(6636002)(86362001)(186003)(33656002)(5660300002)(82310400003)(336012)(4326008)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 09:43:19.7402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbf524c-418c-4cb6-24d3-08d983f6bc97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2199

Hi Michal,

> On 30 Sep 2021, at 10:26, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Add parameter vpmu to xl domain configuration syntax
> to enable the access to PMU registers by disabling
> the PMU traps.
>=20
> This change does not expose the full PMU to the guest.
> Long term, we will want to at least expose the PMU
> interrupts, device-tree binding. For more use cases
> we will also need to save/restore the PMU context.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> docs/man/xl.cfg.5.pod.in         | 12 ++++++++++++
> tools/include/libxl.h            |  7 +++++++
> tools/libs/light/libxl_arm.c     |  6 +++++-
> tools/libs/light/libxl_types.idl |  1 +
> tools/xl/xl_parse.c              |  2 ++
> xen/arch/arm/domain.c            | 10 ++++++++--
> xen/common/domain.c              |  2 +-
> xen/include/asm-arm/domain.h     |  1 +
> xen/include/public/domctl.h      |  5 ++++-
> 9 files changed, 41 insertions(+), 5 deletions(-)
>=20
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 4b1e3028d2..4a75203b9f 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2843,6 +2843,18 @@ Currently, only the "sbsa_uart" model is supported=
 for ARM.
>=20
> =3Dback
>=20
> +=3Ditem B<vpmu=3DBOOLEAN>
> +
> +Specifies whether to enable the access to PMU registers by disabling
> +the PMU traps.
> +
> +This change does not expose the full PMU to the guest.
> +Currently there is no support for virtualization, interrupts, etc.
> +
> +Enabling this option may result in potential security holes.
> +
> +If this option is not specified then it will default to B<false>.
> +
> =3Dhead3 x86
>=20
> =3Dover 4
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d698..c6694e977d 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -502,6 +502,13 @@
>  */
> #define LIBXL_HAVE_X86_MSR_RELAXED 1
>=20
> +/*
> + * LIBXL_HAVE_ARM_VPMU indicates the toolstack has support for enabling
> + * the access to PMU registers by disabling the PMU traps. This is done
> + * by setting the libxl_domain_build_info arch_arm.vpmu field.
> + */
> +#define LIBXL_HAVE_ARM_VPMU 1
> +
> /*
>  * libxl ABI compatibility
>  *
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6e00..bc614dcb05 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -29,6 +29,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>     uint32_t vuart_irq;
>     bool vuart_enabled =3D false;
>=20
> +    if (libxl_defbool_val(d_config->b_info.arch_arm.vpmu))
> +        config->flags |=3D XEN_DOMCTL_CDF_pmu;
> +
>     /*
>      * If pl011 vuart is enabled then increment the nr_spis to allow allo=
cation
>      * of SPI VIRQ for pl011.
> @@ -1186,8 +1189,9 @@ void libxl__arch_domain_create_info_setdefault(libx=
l__gc *gc,
> void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>                                               libxl_domain_build_info *b_=
info)
> {
> -    /* ACPI is disabled by default */
> +    /* ACPI and vPMU is disabled by default */
>     libxl_defbool_setdefault(&b_info->acpi, false);
> +    libxl_defbool_setdefault(&b_info->arch_arm.vpmu, false);
>=20
>     if (b_info->type !=3D LIBXL_DOMAIN_TYPE_PV)
>         return;
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 3f9fff653a..3524629909 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -644,6 +644,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>=20
>     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                ("vuart", libxl_vuart_type),
> +                               ("vpmu", libxl_defbool),
>                               ])),
>     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                               ])),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 17dddb4cd5..e15c2e64f5 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2750,6 +2750,8 @@ skip_usbdev:
>                     "If it fixes an issue you are having please report to=
 "
>                     "xen-devel@lists.xenproject.org.\n");
>=20
> +    xlu_cfg_get_defbool(config, "vpmu", &b_info->arch_arm.vpmu, 0);
> +
>     xlu_cfg_destroy(config);
> }
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 19c756ac3d..02120ff640 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -276,6 +276,8 @@ static void ctxt_switch_to(struct vcpu *n)
>      * timer. The interrupt needs to be injected into the guest. */
>     WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
>     virt_timer_restore(n);
> +
> +    WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
> }
>=20
> /* Update per-VCPU guest runstate shared memory area (if registered). */
> @@ -586,6 +588,10 @@ int arch_vcpu_create(struct vcpu *v)
>=20
>     v->arch.hcr_el2 =3D get_default_hcr_flags();
>=20
> +    v->arch.mdcr_el2 =3D HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
> +    if ( !(v->domain->options & XEN_DOMCTL_CDF_pmu) )
> +        v->arch.mdcr_el2 |=3D HDCR_TPM | HDCR_TPMCR;
> +
>     if ( (rc =3D vcpu_vgic_init(v)) !=3D 0 )
>         goto fail;
>=20
> @@ -622,8 +628,8 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
> {
>     unsigned int max_vcpus;
>=20
> -    /* HVM and HAP must be set. IOMMU may or may not be */
> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=3D
> +    /* HVM and HAP must be set. IOMMU and PMU may or may not be */
> +    if ( (config->flags & ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_pmu)) =
!=3D
>          (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>     {
>         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 6ee5d033b0..63c4db8b9f 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -483,7 +483,7 @@ static int sanitise_domain_config(struct xen_domctl_c=
reatedomain *config)
>          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_pmu) )
>     {
>         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>         return -EINVAL;
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index c9277b5c6d..14e575288f 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -166,6 +166,7 @@ struct arch_vcpu
>=20
>     /* HYP configuration */
>     register_t hcr_el2;
> +    register_t mdcr_el2;
>=20
>     uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
> #ifdef CONFIG_ARM_32
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 96696e3842..a55ceb81db 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,12 @@ struct xen_domctl_createdomain {
> #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
> #define _XEN_DOMCTL_CDF_nested_virt   6
> #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> +/* Should we expose the vPMU to the guest? */
> +#define _XEN_DOMCTL_CDF_pmu           7
> +#define XEN_DOMCTL_CDF_pmu            (1U << _XEN_DOMCTL_CDF_pmu)
>=20
> /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_pmu
>=20
>     uint32_t flags;
>=20
> --=20
> 2.29.0
>=20


