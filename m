Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E06A84EA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505026.777553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkVi-00059I-Sb; Thu, 02 Mar 2023 15:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505026.777553; Thu, 02 Mar 2023 15:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkVi-00057D-PZ; Thu, 02 Mar 2023 15:06:22 +0000
Received: by outflank-mailman (input) for mailman id 505026;
 Thu, 02 Mar 2023 15:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfVa=62=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pXkVh-000577-CG
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:06:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8bd6f45-b90b-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:06:18 +0100 (CET)
Received: from DUZPR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::12) by GV2PR08MB9925.eurprd08.prod.outlook.com
 (2603:10a6:150:c3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 15:05:48 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::20) by DUZPR01CA0010.outlook.office365.com
 (2603:10a6:10:3c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 15:05:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19 via Frontend Transport; Thu, 2 Mar 2023 15:05:48 +0000
Received: ("Tessian outbound 55ffa3012b8f:v135");
 Thu, 02 Mar 2023 15:05:48 +0000
Received: from a98cf5542458.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F39A23E0-F48F-448B-B487-5441F18639CB.1; 
 Thu, 02 Mar 2023 15:05:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a98cf5542458.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Mar 2023 15:05:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB9230.eurprd08.prod.outlook.com (2603:10a6:150:d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Thu, 2 Mar
 2023 15:05:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 15:05:33 +0000
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
X-Inumbo-ID: c8bd6f45-b90b-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb8/1fYwL9DsNwKRw02U8FOwXyzkjmGyx7KhBB3azfI=;
 b=eKDuFSCkIf12/tIJnZ1G0ULn3YLhQk0A+1YmFqIyCGK4frKLhRBk9wzlgq5N+lZlZnRsXjdl6ANlw2IKWhd+ehdNVyTPVBEvSDB5g5OD/+/fETpkTu8AiWf2r2NS/2oIDUvAsXllqkERpa3JxFN6s26T9THP+ocmhtbTZaAnOHE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa0f9854b26331f7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlUnp5zjfSxlvKzVs/jN3BKR4KjRobHBGwdFWwUM0kqj8L9xfRveB2AtxEWk4XRlmmQDaeTwZ40e4gl3inB+zIFi7d4TkZVA+bH0AVSKWNshE28t7+OINiod5rjD3U9zf/XW5Bw/NSnWNx4o1yzEq+SJsUdvxXZ1in40WGgzZEXf3vNK/ou/7GeOGwsQhkBLD97eN3cHx7a1fOg+6Nv1Vis09zqPbf9TAboxRoUVlsNixKmEvVwKfEYvTmq2adjeRw2vGpDXJmjsTNjvKYnOHYylED8pF32CbHkl2nzo4LZn5TvJ82PTQua9uFcJH9rSZg7GegVKqPt/c5/JlFtltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb8/1fYwL9DsNwKRw02U8FOwXyzkjmGyx7KhBB3azfI=;
 b=H7eon1KzJTNBtkTlGkgNLsw2iv5y314QNolo5nnkPbdVQO6w0ihbccpImhAL6664BuhCgjeiTqAmCBQLPFW9Y4yt3F4+tBEXX0Uee07MoQvxEAUYvgmxo2TPURfDslOx80aARZlpG9HiXRPa35u2fYs0+9aRqW/7ay+ecTALwJCP1eUfo7sBrcAT7CGdMR51Qpa7RYI/J0xWULFVU3AivuFvY1110UvuEAa2Nm1/d+gX+zTOXWT9dOKtJA7O4BfXpHEBbxEnCK+JI/QHMiCuME2nViOvbSR21P2akFXIAERFZ/RcjzJB2fDn4NbrY6qSLAqUHp7IpThT2yoHC2T2Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb8/1fYwL9DsNwKRw02U8FOwXyzkjmGyx7KhBB3azfI=;
 b=eKDuFSCkIf12/tIJnZ1G0ULn3YLhQk0A+1YmFqIyCGK4frKLhRBk9wzlgq5N+lZlZnRsXjdl6ANlw2IKWhd+ehdNVyTPVBEvSDB5g5OD/+/fETpkTu8AiWf2r2NS/2oIDUvAsXllqkERpa3JxFN6s26T9THP+ocmhtbTZaAnOHE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 13/20] xen/arm: ffa: support mapping guest RX/TX
 buffers
Thread-Topic: [XEN PATCH v7 13/20] xen/arm: ffa: support mapping guest RX/TX
 buffers
Thread-Index: AQHZRtMeFpHwz1fcdEO/uVmQactk+a7noysA
Date: Thu, 2 Mar 2023 15:05:33 +0000
Message-ID: <BE16E58C-FBDF-4815-A6C1-CB0D3C573816@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <be5a37c0ec23bf8119f5cb68ec58d8cca16d9812.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <be5a37c0ec23bf8119f5cb68ec58d8cca16d9812.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV2PR08MB9230:EE_|DBAEUR03FT025:EE_|GV2PR08MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: b96a0785-021d-48d3-6d60-08db1b2f9b19
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lGF6VqWvtdLQ/k7Cu6j1QqZSf3mG83lDzyXpW4Cx9GHgnA+DsKG3ZpoQqFbgm6xrMLT71uf0c6q6eHfH1PBi2DcpJ8K8kRR+oBqZTyf7kFQe1c9rU8fzCgn4iOcJRZ7MlxdqSLssvQIBpzbEE+ZwSEkokVcf+6tC6Wa+0TRslaM7nnqfVheUiVOJjeK+wl1nFqpZb8oNlPxo7oFdAWV5LEXdJ+bsCuj4S/yV4yh9Q+WS5j9voRTj1CB7fAKmaDvwTsmQ3khozqab39jALuJdg6baANLhzkgMyZVYRxCnCrAjrNsyFbZcO9KaNg3T8LRBXgpoGBXIshUZhk15ZwC6no0k25h3M3LjkwixB3Pw5cv9ydxjtTDSypNpROzNi2dNZkMSv3xOKhCGQr/WS1gQtKuedWesE5xLWZn3R9JFXKFt9TSqwC+9parIYeo8SN+DjQOHn7V7JaW1axO5ODeA6Ux2Vfq0BmjYcJH129sLcbsVrtBEYyvLjgO6rey4XjcQbbEa+LZjKk/hZl2XdjSHqdFjvnNZI+t/J6NPzpJ4PAKZiK3DO8Yf9D5JbDPEcyBSLPHD8m3ocj+M+YBjv8S8g1CVbGr2pyRrrcKnBysFVA7l3bjpyplxS4TbRw7+A65MIjRL6zJYNVYXsU4fBVBQyC1R87w0Z4Nz+D9xrXMTbSEIfwuko2FuPqd6T6/rA5u+yh0P+fWe6j099JPg/WjXIxAILzqjiNn30hzsW//7Dss=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(71200400001)(38070700005)(4326008)(8936002)(122000001)(38100700002)(86362001)(33656002)(66556008)(66476007)(36756003)(41300700001)(6916009)(66946007)(5660300002)(66446008)(64756008)(2906002)(8676002)(6486002)(76116006)(6506007)(26005)(53546011)(2616005)(6512007)(83380400001)(186003)(316002)(54906003)(91956017)(478600001)(66899018)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B06387AE856A414487A227495AE89791@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9230
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2df3bf8-b98c-4b99-3e8f-08db1b2f9256
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YGIysifNbNsM+lwdZcUbNnUy0U8M/8yG7ayxod+meNoRmKyMAW4pfzW1avN5rPkprgTNmnJoVaBKEMsE029PdHMOArvjkHQ16r6KQSWH2zg1vc1A7o32XOfsYEGZpby/f1DgJYADGQZQtyOJLnYjD2TlIbKGBNkfhA5RovYrpJ6NN8CirCF7SKHdb126xjLbLUSR//WfLHXRFV6OVkHcRVe96EWspIh/KAm6G8/My580DBbx4Uk0HDSkkPlCNk99K1JV8j1TLmDEIzxtEvKx8gxw7ydthbxXdnZqi5SBfQcXjGGZrhSLlUMMdraNi9k+lRiMpqSH+DNx0QB94RHr03q7Qw35PPx1nE3DtDCq+iDqv+Apnc2B+ttnCEzAO9ASKCP8cebbLwXY+m7NMDXF/fNklyDdxz8dQbgzDu9IXlZJXv40BIvBiHo1g6zQ6EZYrqfnsafDd3OZ/K2H30TFyItdAoJVB3HRPb1eSGm5Vf4ZlRkDy1uEdBAUBGj3oUV89cRAkrs7iyMGkEntvcLncR/nM++hQEfIZcWvYNWFTv6AzXHlfidm7kenEYvEMlcQdo3D9lnlgvzvFrXOdpkdqUBm25E8IRsciKES4vj81v7SVj0ijRfwmAnVI+zlvyCG58FfJequ32poDerTtNg8tBX/r1mgXXXlh8vYtm8u6xu6dcweYvtH1jjrybfK5hE82bHI0yG2IuvvgMAzGZiTfA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199018)(46966006)(36840700001)(40470700004)(83380400001)(36860700001)(66899018)(47076005)(40460700003)(36756003)(5660300002)(33656002)(82740400003)(81166007)(478600001)(6862004)(8936002)(356005)(86362001)(40480700001)(82310400005)(2616005)(336012)(26005)(6512007)(6486002)(53546011)(6506007)(2906002)(70206006)(4326008)(70586007)(8676002)(316002)(41300700001)(186003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 15:05:48.2448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b96a0785-021d-48d3-6d60-08db1b2f9b19
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9925

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support in the mediator to map and unmap the RX and TX buffers
> provided by the guest using the two FF-A functions FFA_RXTX_MAP and
> FFA_RXTX_UNMAP.
>=20
> These buffer are later used to to transmit data that cannot be passed in
> registers only.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 127 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 127 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index f1b014b6c7f4..953b6dfd5eca 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -149,10 +149,17 @@ struct ffa_partition_info_1_1 {
> };
>=20
> struct ffa_ctx {
> +    void *rx;
> +    const void *tx;
> +    struct page_info *rx_pg;
> +    struct page_info *tx_pg;
> +    unsigned int page_count;
>     uint32_t guest_vers;
> +    bool tx_is_mine;
>     bool interrupted;
> };
>=20
> +
Newline probably added by mistake.

> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t ffa_version __ro_after_init;
>=20
> @@ -337,6 +344,11 @@ static void set_regs(struct cpu_user_regs *regs, reg=
ister_t v0, register_t v1,
>         set_user_reg(regs, 7, v7);
> }
>=20
> +static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_co=
de)
> +{
> +    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> +}
> +
> static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
>                              uint32_t w3)
> {
> @@ -358,6 +370,99 @@ static void handle_version(struct cpu_user_regs *reg=
s)
>     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> }
>=20
> +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +                                register_t rx_addr, uint32_t page_count)
> +{
> +    uint32_t ret =3D FFA_RET_INVALID_PARAMETERS;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    struct page_info *tx_pg;
> +    struct page_info *rx_pg;
> +    p2m_type_t t;
> +    void *rx;
> +    void *tx;
> +
> +    if ( !smccc_is_conv_64(fid) )
> +    {
> +        tx_addr &=3D UINT32_MAX;
> +        rx_addr &=3D UINT32_MAX;
> +    }

I am bit wondering here what we should do:
- we could just say that 32bit version of the call is not allowed for non 3=
2bit guests
- we could check that the highest bits are 0 for 64bit guests and return an=
 error if not
- we can just mask hopping that if there was a mistake the address after th=
e mask
does not exist in the guest space

At the end nothing in the spec is preventing a 64bit guest to use the 32bit=
 so it might
be a good idea to return an error if the highest 32bit are not 0 here ?

> +
> +    /* For now to keep things simple, only deal with a single page */
> +    if ( page_count !=3D 1 )
> +        return FFA_RET_NOT_SUPPORTED;

Please add a TODO here and a print as this is a limitation we will probably=
 have to
work on soon.


> +
> +    /* Already mapped */
> +    if ( ctx->rx )
> +        return FFA_RET_DENIED;
> +
> +    tx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M=
_ALLOC);
> +    if ( !tx_pg )
> +        return FFA_RET_INVALID_PARAMETERS;
> +    /* Only normal RAM for now */
> +    if ( !p2m_is_ram(t) )
> +        goto err_put_tx_pg;
> +
> +    rx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M=
_ALLOC);
> +    if ( !tx_pg )
> +        goto err_put_tx_pg;
> +    /* Only normal RAM for now */
> +    if ( !p2m_is_ram(t) )
> +        goto err_put_rx_pg;
> +
> +    tx =3D __map_domain_page_global(tx_pg);
> +    if ( !tx )
> +        goto err_put_rx_pg;
> +
> +    rx =3D __map_domain_page_global(rx_pg);
> +    if ( !rx )
> +        goto err_unmap_tx;
> +
> +    ctx->rx =3D rx;
> +    ctx->tx =3D tx;
> +    ctx->rx_pg =3D rx_pg;
> +    ctx->tx_pg =3D tx_pg;
> +    ctx->page_count =3D 1;

please use page_count here instead of 1 so that this is not forgotten once
we add support for more pages.


Cheers
Bertrand

> +    ctx->tx_is_mine =3D true;
> +    return FFA_RET_OK;
> +
> +err_unmap_tx:
> +    unmap_domain_page_global(tx);
> +err_put_rx_pg:
> +    put_page(rx_pg);
> +err_put_tx_pg:
> +    put_page(tx_pg);
> +
> +    return ret;
> +}
> +
> +static void rxtx_unmap(struct ffa_ctx *ctx)
> +{
> +    unmap_domain_page_global(ctx->rx);
> +    unmap_domain_page_global(ctx->tx);
> +    put_page(ctx->rx_pg);
> +    put_page(ctx->tx_pg);
> +    ctx->rx =3D NULL;
> +    ctx->tx =3D NULL;
> +    ctx->rx_pg =3D NULL;
> +    ctx->tx_pg =3D NULL;
> +    ctx->page_count =3D 0;
> +    ctx->tx_is_mine =3D false;
> +}
> +
> +static uint32_t handle_rxtx_unmap(void)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx->rx )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    rxtx_unmap(ctx);
> +
> +    return FFA_RET_OK;
> +}
> +
> static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32=
_t fid)
> {
>     struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> @@ -423,6 +528,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>     uint32_t fid =3D get_user_reg(regs, 0);
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    int e;
>=20
>     if ( !ctx )
>         return false;
> @@ -435,6 +541,24 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>     case FFA_ID_GET:
>         set_regs_success(regs, get_vm_id(d), 0);
>         return true;
> +    case FFA_RXTX_MAP_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_RXTX_MAP_64:
> +#endif
> +        e =3D handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg(r=
egs, 2),
> +                            get_user_reg(regs, 3));
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_RXTX_UNMAP:
> +        e =3D handle_rxtx_unmap();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
>     case FFA_MSG_SEND_DIRECT_REQ_32:
> #ifdef CONFIG_ARM_64
>     case FFA_MSG_SEND_DIRECT_REQ_64:
> @@ -515,6 +639,9 @@ static int ffa_relinquish_resources(struct domain *d)
>                    get_vm_id(d), subscr_vm_destroyed[n], res);
>     }
>=20
> +    if ( ctx->rx )
> +        rxtx_unmap(ctx);
> +
>     XFREE(d->arch.tee);
>=20
>     return 0;
> --=20
> 2.34.1
>=20


