Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C3248D58A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 11:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257044.441457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7x9T-0001g2-96; Thu, 13 Jan 2022 10:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257044.441457; Thu, 13 Jan 2022 10:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7x9T-0001d6-59; Thu, 13 Jan 2022 10:16:15 +0000
Received: by outflank-mailman (input) for mailman id 257044;
 Thu, 13 Jan 2022 10:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WE3=R5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n7x9Q-0001d0-RA
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 10:16:13 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe08::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d426ee6a-7459-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 11:16:10 +0100 (CET)
Received: from AM6P193CA0069.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::46)
 by PAXPR08MB7467.eurprd08.prod.outlook.com (2603:10a6:102:2b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 10:16:07 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::bd) by AM6P193CA0069.outlook.office365.com
 (2603:10a6:209:8e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Thu, 13 Jan 2022 10:16:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 10:16:07 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Thu, 13 Jan 2022 10:16:06 +0000
Received: from 34cdc8d2fdc5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9AE7541-2B0C-4F07-B913-F12009E202D3.1; 
 Thu, 13 Jan 2022 10:15:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34cdc8d2fdc5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jan 2022 10:15:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5060.eurprd08.prod.outlook.com (2603:10a6:208:15e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 10:15:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4844.019; Thu, 13 Jan 2022
 10:15:52 +0000
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
X-Inumbo-ID: d426ee6a-7459-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azP6RZwQvRapbVYm2z05mTjZqhhRUjR80ofnqWaTwSs=;
 b=qx+NVc3pEFO89vYovAY0mvbzmJlmAjDTZTHbLB63kGXHfxplq1Eb0qObt1AgGQpK0HvPTI/RxdtiQycYM94knO0ng0YBLMb/Tuva5SKhuJq060Rfh2LvR/50OaTyxjcm0HI35206xHDj9PoiB5DABPFcsnqS7R/9LNFjKURZYNo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3bd9b1f5fe4ccf5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSSsnmzvFOftsv8241FIuQFCiK1VPOv5OCtK7jwgstunOaQ9wNonV432DJQYQ4t0hWULbLga+NEZMWvMV5sFGMwyEbwSKLW6sRnKBULx8VLufP9ztAb/wqp9chWVHc1D/+s1LznXHg0HiuNO+AdH3XSyMYjpWddJePKghmPpvoAJuT9ez8raKj846e92uk9kUaZ5qqd0duv4dmdQkaYtmyndMGTuPWp9kzB8x27UmBFNrOSS3Yam9JFvvnEqltRlSCK+eyECN5SXBr5kYUEPnk6w4PAIb2l4xPSTeXXlApQKbAdzyTl5jMLTD5k2Xqx7AjwhVO1Ht7vkdPt4gxYf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azP6RZwQvRapbVYm2z05mTjZqhhRUjR80ofnqWaTwSs=;
 b=ND1fGoLAvvLeLakwtV3fzII1UN1wFQkZjYI3aNcs2lomzpqlg5nN9YJQ2DksHb62L/h4sP0FFrTPlj1ovzLr9i89XlcmagYanLYPkCyMGnRD9Ux6UUW4TsNKDJyJQE4XBAgKiTOVtd/X0mPn7XLhWSNWTFEjrowxEKv4fHs6oGhJd/uDWTACuyb1RIPc0+/j7JZuuQQQjBccBD4qtv/yMWp3SAtNa77teF2NfxNf7rbM1onvTTg3j0aE10zeNrox1BThn3BxZ1ysNKkVzG3Fn8rrroFr+Jv6fGF2N4SdYaP/L7K0Z37t8PXK91u9O3yKlDhT7oz2Uo/+BoHlx7cDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azP6RZwQvRapbVYm2z05mTjZqhhRUjR80ofnqWaTwSs=;
 b=qx+NVc3pEFO89vYovAY0mvbzmJlmAjDTZTHbLB63kGXHfxplq1Eb0qObt1AgGQpK0HvPTI/RxdtiQycYM94knO0ng0YBLMb/Tuva5SKhuJq060Rfh2LvR/50OaTyxjcm0HI35206xHDj9PoiB5DABPFcsnqS7R/9LNFjKURZYNo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Luca Miccio <lucmiccio@gmail.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [XEN PATCH v2 3/5] xen/arm: configure dom0less domain for
 enabling xenstore after boot
Thread-Topic: [XEN PATCH v2 3/5] xen/arm: configure dom0less domain for
 enabling xenstore after boot
Thread-Index: AQHYCBjL/vo/dgc9yEWI4Vp+MtHLXqxgvOQA
Date: Thu, 13 Jan 2022 10:15:52 +0000
Message-ID: <B458F1F7-4DF0-4919-8E16-11E889A9ABB2@arm.com>
References:
 <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-3-sstabellini@kernel.org>
In-Reply-To: <20220113005855.1180101-3-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 15551586-cc8c-4467-673f-08d9d67db690
x-ms-traffictypediagnostic:
	AM0PR08MB5060:EE_|VE1EUR03FT046:EE_|PAXPR08MB7467:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB74673C4A0FA36B32C91F97DB9D539@PAXPR08MB7467.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cVaM+h4TS9blUDon6wKtUmpDxrVkeaYm3z2ja6nEXZVUiKQU0+AlzXst30iFTmg2XuUZxydbNFRKkZ29RcwpKgNdO68G4hb2k1m1MXj0fnxZHuILlwzfqRjBoFdwSKH2Q7Xh16waXhOvtifdtjM2LDtR7RuHf+ledRayRQV6F2NLzj37mS7z1xu2biCa5HFX+R6ifo8J90+ynfduOf1HmkY9DNEnF9tgiLJ7tNH7X28V0dzUExdUqRrsSBPiqdI67d60kwUAP8fbcylPIWJxki2W3U/Z3mm6JSfbpXfSuyQt8CZaXiBEJCu6/NakKDO6M/9BhSTBC82f+IVluK5ieSplm9z7RoGl3XvaIhlphrCbx0MktIg4/TqfJb2mTM22u6Vx7ctOSCN5oBC3RhHBlhAJMbpyPngXoQZHPv+FRlM6CW4cqwrxrMBDl8EyO1NpoPJHIALoxLrkRMV8BFj7GK/uxtK3u3EbUxNZvgOVWLIei00QdLe+REeXLiwvvQvOHkp9k+HyVIk7VcqfrzR7ZJnJSiVDVscY69f+ReZ+3udrpEMUSg+viov+GpNon4nDOF+gy8EMG7wqGwFiTXN59K9/Ww8jCBwdnsryYY4QK5KU5lA2HUaqa6zxZEBfAypdmLbCxyS+eLxJPMxoVmb2Ijb16V8+cLb7Y71QMBWETa2xyiV6hrq42PnKjKdvMUo7LGrg6i+SEKcYGyCjREtHKypyWiJ1JxYHqgs3SJkntLfwEvS8MlshkxtvmFxBrj8y+w5rGlwK+uYvkLOPJxGLMg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(316002)(71200400001)(2616005)(6916009)(54906003)(6486002)(6506007)(122000001)(38100700002)(5660300002)(26005)(2906002)(186003)(8936002)(53546011)(36756003)(64756008)(83380400001)(33656002)(86362001)(8676002)(508600001)(38070700005)(4326008)(66476007)(66946007)(66556008)(66446008)(91956017)(76116006)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DFEC219C199FF41A85CF9C6BC48CBA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5060
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d899fa6-8f8c-49f6-3391-08d9d67dadf7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/0HSoNUM2v1Ow3voaWLW5yAalH0cWM4AWw2UWCLLxLpdCK7TwHDjL5frXraJBkb73NTClfm9mNRsLfCyEwgH6p2QMvDI236yzEfm5NOMTHDBkbkZa+RWsS0Ob015Yn+awFavk6EuY15EkNtdb2k1pn7Gi5ANi1RW+iTnlOsNbSFxPlorP2bZHCWl28w0hyct2GU0WQkBWAOvW2xdEDfMP+PXnPRt+61QukyvEUOMRin8cT02fBfZMy7VkSnJpemF7hb+ELSG1Av9sNfbBfB/QOgLRtrkaSzAgCi905zby19S2bF+ue2I360P04OiR+4ceITgqVjMQkcVFmAU/cBESpyvBZ71Lq3CnPS25NniQjMBJNYCrFybjN9A93XGeMRzfc2rJ6RXAluXfPhxbOBS3eTxlPdYyvyWnl8krSH5fp9UlMme8l3a6CvaAMKaQN/IfwFHkh4rBAwyyqIHRGNrmA/V898uQJz66DY9pDTzbkSxtUa4nk1F+yZHYSlyhr7P435EAB5oTnbvmmSIPOsMA/kVeh/yKY6nP+4w8qjIQwGMTSMmKFqF24NZTx0XnfDJntkG2BxtUsN+gPQStoe1Yx/LCh5gZjxiK5KDdRwWVG0U4KxDGSKoqFmawRIU+VgAFQPTpjVlOZuzK0xUT/17NUx1VYUkUF2+l/cdoSljV9apbGNZ51+eQzPSWy57f+HPKxOYaNH5oJvSpvtNJRKqTaSL0nfjjmVyyb8BT9Vs1TiYKm9qH8YDTbiRRaNc9Yq5bT++xg7NUiJ3stZP8zJl8IAgBA13lqVZ1e82xj9zvA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(8676002)(83380400001)(336012)(47076005)(8936002)(54906003)(356005)(508600001)(2906002)(186003)(26005)(81166007)(6862004)(70586007)(33656002)(316002)(4326008)(70206006)(5660300002)(86362001)(82310400004)(6512007)(6486002)(40460700001)(36860700001)(6506007)(53546011)(2616005)(36756003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 10:16:07.0715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15551586-cc8c-4467-673f-08d9d67db690
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7467

Hi Stefano,

+ Penny in CC for the question.

> On 13 Jan 2022, at 00:58, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> If "xen,enhanced" is enabled, then add to dom0less domains:
>=20
> - the hypervisor node in device tree
> - the xenstore event channel
>=20
> The xenstore event channel is also used for the first notification to
> let the guest know that xenstore has become available.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Just one question: GUEST_GNTTAB_BASE is fixed but could it be a problem for=
 a direct map guest in the future ?

Regards
Bertrand

>=20
> ---
> Changes in v2:
> - set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
> - in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound
> ---
> xen/arch/arm/domain_build.c | 43 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 43 insertions(+)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9144d6c0b6..251d933c8e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -27,6 +27,7 @@
> #include <asm/setup.h>
> #include <asm/cpufeature.h>
> #include <asm/domain_build.h>
> +#include <xen/event.h>
>=20
> #include <xen/irq.h>
> #include <xen/grant_table.h>
> @@ -2619,6 +2620,8 @@ static int __init prepare_dtb_domU(struct domain *d=
, struct kernel_info *kinfo)
>     int ret;
>=20
>     kinfo->phandle_gic =3D GUEST_PHANDLE_GIC;
> +    kinfo->gnttab_start =3D GUEST_GNTTAB_BASE;
> +    kinfo->gnttab_size =3D GUEST_GNTTAB_SIZE;
>=20
>     addrcells =3D GUEST_ROOT_ADDRESS_CELLS;
>     sizecells =3D GUEST_ROOT_SIZE_CELLS;
> @@ -2693,6 +2696,13 @@ static int __init prepare_dtb_domU(struct domain *=
d, struct kernel_info *kinfo)
>             goto err;
>     }
>=20
> +    if ( kinfo->dom0less_enhanced )
> +    {
> +        ret =3D make_hypervisor_node(d, kinfo, addrcells, sizecells);
> +        if ( ret )
> +            goto err;
> +    }
> +
>     ret =3D fdt_end_node(kinfo->fdt);
>     if ( ret < 0 )
>         goto err;
> @@ -2959,6 +2969,27 @@ static int __init construct_domain(struct domain *=
d, struct kernel_info *kinfo)
>     return 0;
> }
>=20
> +static int __init alloc_xenstore_evtchn(struct domain *d)
> +{
> +    struct evtchn *chn;
> +    int port;
> +
> +    if ( (port =3D get_free_port(d)) < 0 )
> +    {
> +        printk("Failed allocating event channel for domain\n");
> +        return port;
> +    }
> +    chn =3D evtchn_from_port(d, port);
> +
> +    chn->state =3D ECS_UNBOUND;
> +    chn->u.unbound.remote_domid =3D hardware_domain->domain_id;
> +    evtchn_port_init(d, chn);
> +
> +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] =3D chn->port;
> +
> +    return 0;
> +}
> +
> static int __init construct_domU(struct domain *d,
>                                  const struct dt_device_node *node)
> {
> @@ -3014,7 +3045,19 @@ static int __init construct_domU(struct domain *d,
>         return rc;
>=20
>     if ( kinfo.vpl011 )
> +    {
>         rc =3D domain_vpl011_init(d, NULL);
> +        if ( rc < 0 )
> +            return rc;
> +    }
> +
> +    if ( kinfo.dom0less_enhanced )
> +    {
> +        rc =3D alloc_xenstore_evtchn(d);
> +        if ( rc < 0 )
> +            return rc;
> +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] =3D ~0ULL;
> +    }
>=20
>     return rc;
> }
> --=20
> 2.25.1
>=20


