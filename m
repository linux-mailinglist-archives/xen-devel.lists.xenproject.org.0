Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A09757902
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 12:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565085.882971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhf8-0005NC-5P; Tue, 18 Jul 2023 10:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565085.882971; Tue, 18 Jul 2023 10:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhf8-0005LD-2p; Tue, 18 Jul 2023 10:10:34 +0000
Received: by outflank-mailman (input) for mailman id 565085;
 Tue, 18 Jul 2023 10:10:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLhf7-0005L7-6u
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 10:10:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54183041-2553-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 12:10:32 +0200 (CEST)
Received: from AM0PR10CA0057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::37)
 by AM9PR08MB5985.eurprd08.prod.outlook.com (2603:10a6:20b:286::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 10:10:28 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:150:cafe::43) by AM0PR10CA0057.outlook.office365.com
 (2603:10a6:20b:150::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 10:10:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 10:10:27 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Tue, 18 Jul 2023 10:10:27 +0000
Received: from d3a93c584bf1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 857CECA3-CC4E-4E71-A906-3A72E5C0EE34.1; 
 Tue, 18 Jul 2023 10:10:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3a93c584bf1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 10:10:20 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by AM8PR08MB5668.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 10:10:19 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 10:10:18 +0000
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
X-Inumbo-ID: 54183041-2553-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVsGkHwFr8tBv0RGAfHqPfsW3VgA8R6qmeJQPCvTvSw=;
 b=k9dh2PwONwthDW7CA3aKPx9PB/Z3Uq15nvT15HytBHSIUp+Jq3+u0LdvqoXlZ0cCF/HNTRcrBao557HgaBXpptapSHy4XSIoKtThQcIt73CpoxxG4v9KQ9xJkD7Uy4o/ewYy0ReVFo96gQce08ZqRy9gEu5YYQuMHcrWZhk9/6A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a8c863e103e962b0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Be+U7AqiRPAWBN1jOoCvQCHl1ZfOdJDroR7eZ0UivDnd/9KqrKtPsJgh8OZTNEgLbZerXYolcfw7bS7U+jQp5aNT5bZFUMIHJ0Dfv1MH5bx3opxVsIwNztMx24rwSBZ6b108RjIrEgo/cjytufsuhwegv2rUgC9vA/WzfcShvGfo7w/bJE/633AubsQ2903VSvUG8xrLHcRqUe0SBvRWhEi9yBqYyOGO/LnLojljteOhMTXSE4VHJv2JmKxVi9AXZmAPL9xRf3qZ/5X6X6uEJvDImgjISNwVy1vSVPlV1FV/c8mHlv5zNKFkn0DHuqVkcQ1pM1a6UvvTboByyvMy/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVsGkHwFr8tBv0RGAfHqPfsW3VgA8R6qmeJQPCvTvSw=;
 b=gzgRmjPWa5cnPnRaDXzoVd9w08/7UcjhSi4/DpAFXCJB0sj23JFF0plvNnhorhiouabKTj5NTTG2TGm1ACdYtuZOULfFPAgFKu5EP5QK3qgge3KYxbCtos7tCkb2uKm2gwVGwPv5Bc4z0UfKZNL50vuEPsqGqIxrQktqaU6hs1JChFPZRsscJblzZ0cXBtSqz9snSHwQtmeKibEPi+C7yEKKCJ3FBiQfrroeFlt+xN8Sr34atGMQyLIPJ77+acoiWFqxZlhx1sEA4C979u+2jGgwVXaCG+1cNpMf8UDT2SCSAfIf/VFY2nuWHoLjAcCnz2GXczCDRkG+WDS6sGyAyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVsGkHwFr8tBv0RGAfHqPfsW3VgA8R6qmeJQPCvTvSw=;
 b=k9dh2PwONwthDW7CA3aKPx9PB/Z3Uq15nvT15HytBHSIUp+Jq3+u0LdvqoXlZ0cCF/HNTRcrBao557HgaBXpptapSHy4XSIoKtThQcIt73CpoxxG4v9KQ9xJkD7Uy4o/ewYy0ReVFo96gQce08ZqRy9gEu5YYQuMHcrWZhk9/6A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v10 13/24] xen/arm: ffa: support mapping guest RX/TX
 buffers
Thread-Topic: [XEN PATCH v10 13/24] xen/arm: ffa: support mapping guest RX/TX
 buffers
Thread-Index: AQHZuH9XcNt8RODY5EiyyRkk5td9s6+/TxAA
Date: Tue, 18 Jul 2023 10:10:18 +0000
Message-ID: <88B6CFB1-81B3-4B55-AF8E-2BA8970CA5BB@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-14-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-14-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|AM8PR08MB5668:EE_|AM7EUR03FT037:EE_|AM9PR08MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfabb94-6062-4f07-8d84-08db877735fe
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cDNtH47YWzp5NLeiTXDERpfKiceIGjQ2i36q3YJNoLanSvfdWiGJk3s8ttwRp6QYoaG9suD+Mt73XUqCKopQwaiTyX6ATq9xX+vmqZXFr1bThAVGBGKmbeU/UeIgYB9zi+MXCICsSgZS4oYAU5CPw6E1WHPg00MJ0PDnFHkzKzk8bIGbMVaakSUhPQSkasdXR7+jMfK1q/ceBPfHDLqBCuPlc5Uz3NzR9c8wXdX3BU2eZqWwVYLa+WhDuYgWsYcS7pG9jusx6fVJGPXJ3OZAmWM7MTrRrTqzda3cCSznFuW/cj2DhxuxRMqbcxSd62JKRLHyHVgFy3njLpmpmO80wzZR4aULwncT8zzx5TZWyhSBkydbd8I9ZrHVBK6Aip93Ddx/769tn2RAX7oEIxtT+YIrjE+EPgN8iPP7ufJzJ+IoR314t7or94RQ2f3cye1Xin5NjIOqluoJCmGUzN8VyWhjE+hFMRmLcee6CeI35WQcFOJRfKGyerPo+cOJlL69HBs7G4Hrr1AjR3nuHduAWQ7/CV/vout9sji9JYiIt7WIow+Zt98kUaK32Px80qzoCsZ0ZFaiMeiGpjOlVJ1+6mUcvUncmuwqgs9ygzvieeuPgiVJzSu/SHH8mRPfre/iBAdhgJz9RFpyXmyFUUAIOA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(54906003)(478600001)(71200400001)(6486002)(91956017)(83380400001)(76116006)(6506007)(186003)(53546011)(6512007)(2906002)(64756008)(316002)(66556008)(6916009)(41300700001)(4326008)(66446008)(66946007)(8936002)(8676002)(5660300002)(38100700002)(122000001)(66476007)(36756003)(86362001)(38070700005)(2616005)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DD0CED81456ECF4C82910F04850B03EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5668
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79adfa69-ab09-4089-8680-08db8777309b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VvQiddQzYhzjmCojIBToG1uCg9k8sqxlAhM+gszSYxl073fWNkBEX6yGbnMAoa2feLyvdRUuCMBIhdw0LBj2m7JZRLYGoV2Ln4I2LZ+AgST0oq7ELImd1Sd872Jplxpuff0g1h9cF+wpEMtA5Uq8/kuq35Po2jLGlPmZuZq4XOgSJkPZRToJfwQOB52ce3ivOhMSVpP48f5hc42x4cIqIjcQmCzrubTd7Z++WicawwqyxEmGHmVy4/RCOMWm7YJj8DJlWeBqECshSyrwJt9wDEiPSGyJQ7o3W5FYg/mh88OyDixawpEXSEniSDz6KSOF2onfozmrUIbgf+IZW2zjMlEGwXF48TDBiY/h9JRulrY0rrXb4FdyJYDcJSoMUS5IZdv0jvFdqLNzmXktZU29b/Ybybd1auZqOuqv2rU4Fq8thmWAyyh9CiM3des85Me/7QlP3Czy/YvTRkkQo00nltwnSnFYNoNRybHXVx9MnNu9ORBgaPo34HTaQHS9gLIx6FFiiF97rLwEGSUITNNNFY8jjIZ/TppKV7S7HMNY8NpO8vzcHpsn2tt1V7QRoaPv+fay/J2DPOMpQz9bdM25zbgqAJUYS6stFVhTT085zsyNSsRTUy14KKsjP5bQQzw1kmELF4WeQekUku1oXOAN6N8jS9Z5vV0GSj4+Db8lMWYzgf0qT/CHUoKNY+JETrA/0Y8+8dkdZFuI6NqAC6dg5V1DtWl/3+zNtqeWPoBmxpt0xiwns6T+dMOqIDzbls8T
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(40480700001)(36756003)(33656002)(81166007)(82740400003)(40460700003)(356005)(478600001)(2906002)(6486002)(41300700001)(107886003)(53546011)(6506007)(26005)(6512007)(54906003)(6862004)(8936002)(316002)(86362001)(70586007)(70206006)(5660300002)(4326008)(8676002)(336012)(2616005)(47076005)(36860700001)(83380400001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 10:10:27.9008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfabb94-6062-4f07-8d84-08db877735fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5985

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support in the mediator to map and unmap the RX and TX buffers
> provided by the guest using the two FF-A functions FFA_RXTX_MAP and
> FFA_RXTX_UNMAP.
>=20
> These buffer are later used to transmit data that cannot be passed in
> registers only.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 138 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 138 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index d755363de686..ffabb5ed0a80 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -74,6 +74,12 @@
>  */
> #define FFA_RXTX_PAGE_COUNT             1
>=20
> +/*
> + * Limits the number of pages RX/TX buffers guests can map.

Typo: s/Limits/Limit/

> + * TODO support a larger number.
> + */
> +#define FFA_MAX_RXTX_PAGE_COUNT         1
> +
> /*
>  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
>  * BIT(31): Framework or partition message
> @@ -169,6 +175,12 @@ struct ffa_partition_info_1_1 {
> };
>=20
> struct ffa_ctx {
> +    void *rx;
> +    const void *tx;
> +    struct page_info *rx_pg;
> +    struct page_info *tx_pg;
> +    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
> +    unsigned int page_count;
>     /* FF-A version used by the guest */
>     uint32_t guest_vers;
>     /*
> @@ -176,6 +188,7 @@ struct ffa_ctx {
>      * ffa_domain_teardown() to know which SPs need to be signalled.
>      */
>     uint16_t create_signal_count;
> +    bool rx_is_free;
> };
>=20
> /* Negotiated FF-A version to use with the SPMC */
> @@ -371,6 +384,11 @@ static void set_regs(struct cpu_user_regs *regs, reg=
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
> @@ -392,6 +410,106 @@ static void handle_version(struct cpu_user_regs *re=
gs)
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
> +        /*
> +         * Calls using the 32-bit calling convention must ignore the upp=
er
> +         * 32 bits in the argument registers.
> +         */
> +        tx_addr &=3D UINT32_MAX;
> +        rx_addr &=3D UINT32_MAX;
> +    }
> +
> +    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT )
> +    {
> +        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (lim=
it %u)\n",
> +               page_count, FFA_MAX_RXTX_PAGE_COUNT);
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +
> +    /* Already mapped */
> +    if ( ctx->rx )
> +        return FFA_RET_DENIED;
> +
> +    tx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M=
_ALLOC);
> +    if ( !tx_pg )
> +        return FFA_RET_INVALID_PARAMETERS;

Please add a newline here

> +    /* Only normal RW RAM for now */
> +    if ( t !=3D p2m_ram_rw )
> +        goto err_put_tx_pg;
> +
> +    rx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(rx_addr)), &t, P2M=
_ALLOC);
> +    if ( !tx_pg )
> +        goto err_put_tx_pg;

Please add a newline here

> +    /* Only normal RW RAM for now */
> +    if ( t !=3D p2m_ram_rw )
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
> +    ctx->page_count =3D page_count;
> +    ctx->rx_is_free =3D true;
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
> +    ctx->rx_is_free =3D false;
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
> @@ -448,6 +566,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>     uint32_t fid =3D get_user_reg(regs, 0);
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    int e;
>=20
>     if ( !ctx )
>         return false;
> @@ -460,6 +579,22 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>     case FFA_ID_GET:
>         set_regs_success(regs, get_vm_id(d), 0);
>         return true;
> +    case FFA_RXTX_MAP_32:
> +    case FFA_RXTX_MAP_64:
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
>     case FFA_MSG_SEND_DIRECT_REQ_64:
>         handle_msg_send_direct_req(regs, fid);
> @@ -551,6 +686,9 @@ static int ffa_domain_teardown(struct domain *d)
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

Cheers
Bertrand



