Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E041BFEF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198679.352294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU3D-0008N0-3B; Wed, 29 Sep 2021 07:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198679.352294; Wed, 29 Sep 2021 07:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU3C-0008KF-VV; Wed, 29 Sep 2021 07:30:46 +0000
Received: by outflank-mailman (input) for mailman id 198679;
 Wed, 29 Sep 2021 07:30:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU3B-0008K2-LS
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:30:45 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 997078b8-59c1-452b-904f-726b8c31a740;
 Wed, 29 Sep 2021 07:30:44 +0000 (UTC)
Received: from DB6P192CA0006.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::16) by
 DB8PR08MB5434.eurprd08.prod.outlook.com (2603:10a6:10:116::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15; Wed, 29 Sep 2021 07:30:38 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::25) by DB6P192CA0006.outlook.office365.com
 (2603:10a6:4:b8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 07:30:38 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:30:38 +0000
Received: ("Tessian outbound 173d710607ad:v103");
 Wed, 29 Sep 2021 07:30:38 +0000
Received: from 36f130a07c45.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D3FF14B-8DB4-49E6-9421-7799B6264A4C.1; 
 Wed, 29 Sep 2021 07:30:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36f130a07c45.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:30:25 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 07:30:24 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:30:24 +0000
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
X-Inumbo-ID: 997078b8-59c1-452b-904f-726b8c31a740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOejfLP7LhKJrTKaI5uSV9u/URoVTJbE7lE88j5sq7U=;
 b=lGMj2SoRHRwvYgJMwWCub6oWwKtm7FePlLQ1+7UizfL2Izj9D85MvMY0xsFFCAQLW28rGX6zeDZaWhCO2D964TzyVVSgJAsdBedGYH5uj20NY4y7UhJdmDOuADpK65SWGJRWjH+/8lvzOIZFeffHVYGdfGf7YJxElGn6jreZWdo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe8c31bef69c5875
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh8wxvp2Cpq4qwrS/Q24udg4/f5eEKVeDpbQTPINsTMq/iwpLE65aZpnZUBHVgXiG34/qwRmiZSsVAjJ/20jmpbkmFudY3zMnAdgCw91MDrjR7zdhiWJINVe0yLpdQ1hK/PRFNa9QVfuVQoA6MIlb2FvTV7deqPgkQjQNAziJXq78kTk/neJg1UzT6dF69FetCTwzkcdwl84EBvxD2IFcphAfd9DvjG/GYmw7Kzt0i83Nfzy0lgms8BmfeAQqj+QWIG/SuIscjN6wYIB6A/k8CG9kF4rVLWGTEVxjqWI476Y1ax5HdjcLpJaOpyMGbX0XwoEjKjeBHYApBJmoUauIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dOejfLP7LhKJrTKaI5uSV9u/URoVTJbE7lE88j5sq7U=;
 b=NV4+4kQx5uSKUY7MFTmbv1nTJb2/gppXCiaim63n0EBIdY/OaNXTwWiHATV2XwoFPImSgixObQKcavgJiGwu3qImbJmj7TLUZzVdVBMtB1i0NyDfdUDjQTUdpok6ZDoEcPQQ1k88TwHU5oB0YEEpHkHd6JEXjxcstQDrfFPL5rikcfEjZti7ZGanoZURPFpqXgMfdDVxRs+ZlICCxHMqgXaV0Q36KwQuUsDH2qZGxx0Du+YK5dFMbW/mIyBOdPYnJVxLYkeZoiS5J6YwKb/fAdWGMMpbXsQHtJR1EXJ7AIZgrXdsPc9IM9D/cD+QWY/+kfWqnboKXgV6LD17L5azYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOejfLP7LhKJrTKaI5uSV9u/URoVTJbE7lE88j5sq7U=;
 b=lGMj2SoRHRwvYgJMwWCub6oWwKtm7FePlLQ1+7UizfL2Izj9D85MvMY0xsFFCAQLW28rGX6zeDZaWhCO2D964TzyVVSgJAsdBedGYH5uj20NY4y7UhJdmDOuADpK65SWGJRWjH+/8lvzOIZFeffHVYGdfGf7YJxElGn6jreZWdo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 04/17] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v3 04/17] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index: AQHXtJWDr/ZkVrSogUyoFTUx7ZyQTKu6no+A
Date: Wed, 29 Sep 2021 07:30:24 +0000
Message-ID: <FC836F6B-3873-4E08-8606-2FD0D398B8B5@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <9d796d7c5c6d6c2d206809f99ed0be7ec9ebe056.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <9d796d7c5c6d6c2d206809f99ed0be7ec9ebe056.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 67e1a731-757f-4278-16f3-08d9831b08d1
x-ms-traffictypediagnostic: PAXPR08MB6816:|DB8PR08MB5434:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5434751F4D768209C7A375419DA99@DB8PR08MB5434.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MEwYmG//WQiAFA3M1ysLLVLndSx+jloznVbSF6YSS+mJCPhJHkl9SSQ8LTj819KM5eZJD2ibbxbIA05bZskSdBX+Tfc4tOVym+2qPNprpN1+QochuuGnL/lOEeFRLSIIs6Dwmq056bK7JtLajxy7lakxnQNHb9c1tCxnvHtBJeNf89mC6h6fOr+q8VadmSsPtYwnsPSExDmZVCM9h49Mg6rUlNIzJLStVZRED7m26rcDRS60eDluqwB76xd3HJ63O1ricpgeBoJz+xd9SspbX2nZaVI16UO6308qm6OVwDhODyPPse9Lm5m8fU86AKpxbhDnBvFzhAThzAfTuZ47bhLGGAyhAQ9/Txkys37BvFBo0MegAvtjP0XoOjBm4e9xTEEQiBQjYvNk3sM3JvRI8Tj53r42KKiSO77mFanvys3u7SgFGyIZvZeaN65lNqnfBXlBuZPfLW9r8hXnJy/5n87aP+ycy9BbaWUXr73P2hLaJpl2DqVnTQz1LcFP8kymGsb6cAjO84eDfURSQhaWdYPoOf4ZBjzA+khwSmjcCD3ql79iHfIhOi0uImbZM16C0pdclg/thmfStP0RcbSizmAC1nZw0lx3XvMV+7dpDQAzSjALS0HOHYp2xsrJ46NehDrFsFjto6Ax7FCIEqcaLM00E7yF7nJ34bCyzfTEn7rNKZHxMyIi/04VHd7l/PQ3AazBjxSYXmm4PYNoejm+VuiFq7MRVUhVkLVbwG2xfWFb9a0fNDYc2bQe6plhLbmd
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(71200400001)(186003)(6862004)(53546011)(5660300002)(6506007)(4326008)(6636002)(122000001)(38100700002)(83380400001)(38070700005)(8676002)(66446008)(64756008)(91956017)(2906002)(76116006)(2616005)(66946007)(66476007)(66556008)(33656002)(316002)(37006003)(54906003)(86362001)(26005)(508600001)(6486002)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4EBA6CC05A424941BD90461754F11996@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6816
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf4fe2e9-8259-4f22-d7cf-08d9831b0080
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2oxuq2FLzmJbaf4atu3KbMp7wwvqDIaenYTtyx2YafgFhXSDVJws5jGFtMQyGAbHFHWxPzoEbup8aGyk9EqTX3tpGp7wAAaM+zMgZogzdBPOb70GeRmkfxU3DA33RTa+ROhbqUd3U3o0wS6ajcM68n2M36a4vIrHbOOtlEoH9/i2BUD7cjEsUnP6Dm/eHFeQDwWJ9V3BHrGYj4u8rruRvqTXY+LIZSj/Jqjm4QW4EWVz2mdKhCQqynEOUhjoLlaAsLFfJLcvY+tGrzatti5YGtgiIpeBvtnKvCPWQOluK2RUoY3MSSjcBpg1VQdHCS84zk4ydmM0E+DHf41d65rKvFiKAP1lcTLerTiHp3oQLp23v6uG4CUSoXzKhdW1y1OxQl19NnhpjhRjbZjwMP44yXUHJWf/koK+Jvugh9l6Fwblamqrondg4czmK5gvCNNshFjj/0gMhroZyW20Kdjc14Ywt0GZ12gJUqUL19mghq2wW4XUsxeTa9am+raQhYQGK5dStIDFzs9zK+aincCluy2mFIaHXLbj1/CylwTjawVhjwrdqW4DxUxJYAwvhQ+IC2MHhsRcoWxOSiN7IJko/LB9FW7jy8KksmLsQ82dDlp9bI6BMzPulfwdFEMYnyxKV7SSwwMh6IdT14QUJzPnnyKrSPQqw8wlfAD+AWbkc7lkyuKCdyHtX/2zHZpf7qRWiUOdT5VCyUaQGuRaT+kmuQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(5660300002)(316002)(54906003)(2906002)(36860700001)(83380400001)(6486002)(107886003)(6636002)(82310400003)(6862004)(37006003)(8676002)(86362001)(53546011)(81166007)(4326008)(6506007)(6512007)(186003)(70206006)(8936002)(26005)(336012)(33656002)(47076005)(508600001)(356005)(36756003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:30:38.4847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e1a731-757f-4278-16f3-08d9831b08d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5434

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> ARM architecture does not implement I/O ports. Ignore this call on ARM
> to avoid the overhead of making a hypercall just for Xen to return
> -ENOSYS.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3: Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.o=
rg>
> Change in v2:
> - Instead of returning success in XEN, ignored the call in xl.
> ---
> tools/libs/ctrl/xc_domain.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 23322b70b5..25c95f6596 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -1348,6 +1348,14 @@ int xc_domain_ioport_permission(xc_interface *xch,
>                                 uint32_t nr_ports,
>                                 uint32_t allow_access)
> {
> +#if defined(__arm__) || defined(__aarch64__)
> +    /*
> +     * The ARM architecture does not implement I/O ports.
> +     * Avoid the overhead of making a hypercall just for Xen to return -=
ENOSYS.
> +     * It is safe to ignore this call on ARM so we just return 0.
> +     */
> +    return 0;
> +#else
>     DECLARE_DOMCTL;
>=20
>     domctl.cmd =3D XEN_DOMCTL_ioport_permission;
> @@ -1357,6 +1365,7 @@ int xc_domain_ioport_permission(xc_interface *xch,
>     domctl.u.ioport_permission.allow_access =3D allow_access;
>=20
>     return do_domctl(xch, &domctl);
> +#endif
> }
>=20
> int xc_availheap(xc_interface *xch,
> --=20
> 2.17.1
>=20


