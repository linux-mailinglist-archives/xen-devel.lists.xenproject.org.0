Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D968075784F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565072.882941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhEg-0000KO-F6; Tue, 18 Jul 2023 09:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565072.882941; Tue, 18 Jul 2023 09:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhEg-0000IL-CE; Tue, 18 Jul 2023 09:43:14 +0000
Received: by outflank-mailman (input) for mailman id 565072;
 Tue, 18 Jul 2023 09:43:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLhEf-0000ID-4F
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:43:13 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 817903b6-254f-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 11:43:10 +0200 (CEST)
Received: from AM0PR02CA0176.eurprd02.prod.outlook.com (2603:10a6:20b:28e::13)
 by DB9PR08MB10377.eurprd08.prod.outlook.com (2603:10a6:10:3db::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:43:01 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:28e:cafe::96) by AM0PR02CA0176.outlook.office365.com
 (2603:10a6:20b:28e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 09:43:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 09:43:00 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Tue, 18 Jul 2023 09:43:00 +0000
Received: from 3dac995c2375.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A992C3C5-4A2B-402C-939F-BEE0C7CA04E9.1; 
 Tue, 18 Jul 2023 09:42:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3dac995c2375.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 09:42:54 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by DU0PR08MB9655.eurprd08.prod.outlook.com (2603:10a6:10:447::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:42:52 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:42:52 +0000
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
X-Inumbo-ID: 817903b6-254f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLo76JlBiMGN9yQ+IcEoC33k5ozWBw0p6kk6mDt+Eq4=;
 b=0EIv0szEsb+uw3O+c4WQlBEfcoE/NaqmYEJEJiLvgGunlrpMomdRoo672owVhBI3JhszEOWwvuGgD1DNN8hTgAflsi0QEHOGYxqT3yBCEN09tQescdehPtmjR1miC+MkSRy/YIOdbxuTcCg7Grw2RNsQ3CIOFN9b24k87+1QSwI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a658ff11987a8c97
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrSZl37Stoqux/s6FVzYr168ujGIeMfW+eye8Xgj5/KFyDfAbgGtxjbBwL/LupQH1R2IQO7HPfYRJEAwW46IG3GZJoNFJX1pwKEJqPZd9LHa2i/4qB7jSPg1yY8B1ZRibzOZVhNIzi4G4V4tTmjiqcXxDgC6srwaPnnsEzZzv6bMh/gjWxpSdSw/18WMOIxE3W5ZxbgWLt9V0D+rtI32RXEYDBzug2NZPfdqXvZDrTFF4Ks+E3jEU+YNGUAgIOaQDaccGd6kzySdxs8sh5MrMQCSNM5xBKetZCaHG0XIvnR8YKq06VHCux32zb+N9NYY0k6KQoBp9kyl3kOHMsSUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLo76JlBiMGN9yQ+IcEoC33k5ozWBw0p6kk6mDt+Eq4=;
 b=h4jDYcSJdSENT6OP+Kp6GFQb/SI21BVcX4Ki4UTvPYrW9HO8NTpK5LspGso+FyVCqYDItl7hwthGsYhq4r3lN4Jtfy1Dj1q/kznJvVBupwuLkP5JZ8PKK6rTjQ77WYbgEI/lbf2J/f5j3dhfVfBRVvzpo0F++myNbC7qhbKG4RYJHbepFLEffRodTwaedHY//AWv1diK837QQBjEOAXx2BY2afetTLT9r+EOo/2gXRCk5sope48h6fUpk1suRqTgk5umDa6NJ/9MSHcM8BkpCehMxl5KnwCa4Zf1Lu0kNnyQ7pyIJW6h8sLtuBKVDzJFVRKkDu9xIJqslG+DcJeJ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLo76JlBiMGN9yQ+IcEoC33k5ozWBw0p6kk6mDt+Eq4=;
 b=0EIv0szEsb+uw3O+c4WQlBEfcoE/NaqmYEJEJiLvgGunlrpMomdRoo672owVhBI3JhszEOWwvuGgD1DNN8hTgAflsi0QEHOGYxqT3yBCEN09tQescdehPtmjR1miC+MkSRy/YIOdbxuTcCg7Grw2RNsQ3CIOFN9b24k87+1QSwI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>
Subject: Re: [XEN PATCH v10 11/24] xen/arm: ffa: map SPMC rx/tx buffers
Thread-Topic: [XEN PATCH v10 11/24] xen/arm: ffa: map SPMC rx/tx buffers
Thread-Index: AQHZuH9VJ4u8cEY7e0yX7WDachuwCa+/R2WA
Date: Tue, 18 Jul 2023 09:42:52 +0000
Message-ID: <8EC95462-76E9-48AA-B784-92DC52309240@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-12-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-12-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|DU0PR08MB9655:EE_|AM7EUR03FT032:EE_|DB9PR08MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: aad3d7d5-8c72-449a-1c08-08db8773603d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 L44EtRD4pDb+C+6PK5gT8TZiXu+N3l23rAXFvApkPCZV0OEebYgjlDv51iBuIra+9UEP4fD5CXAPfQHo9p6Rhh8uHdNRAOax2FKVVuOwm30ymXpTZ6fU4dtE9jHolXXV2kqzeQ/IJHrlUJ1+TcvTIh41r1mfgJnNE1aqqkHcThQW2BSUywDw3R97pzVns4cDVzEA3HEdN04MpApADp/VtHFy0ZgcOIy6GRMRrlVdb98JvBz1+o+p1+eVhUftEYHn2SIiGs6F45vt2GB8uS3Cp2lhheSt+Mo+nRkshpDeBYGvFb5crFaMXMbF6E0GS9HECAS/dEGVh4/n761V+1bxBvCMUjhzbonq2dhzj7vTIXDE55Xta6qPQEMQZUc7PxREszNUmocMvBbajwsuYK20tq0V2BT7c5DLyz3WSqGtPQWam4La21aThdK/jb5zoNLXAqMvIG6ZnCNLhQEFNGh6QN03derj7Z8u6b8UPbeisidboFEUNBuPztOtqUXkpIq/hqDJrfq2iYtagse9lb7gls5bwf49vma29UZz1xN1BEH/L6rnvD3+4nL1Rg6rGAcE/r4zqPsOiUo0/a7kWfxgNezzh66DqRh78gQ8Ro75VJVx02ruvJGUpjKSMKYzJYlS37t3HpJXSLE+kduiIFvXhQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(478600001)(71200400001)(6486002)(91956017)(66556008)(54906003)(83380400001)(38070700005)(86362001)(33656002)(76116006)(2906002)(53546011)(186003)(36756003)(6506007)(2616005)(316002)(6512007)(122000001)(38100700002)(64756008)(6916009)(66446008)(66946007)(66476007)(41300700001)(4326008)(8676002)(8936002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A251DF7A7AF63D4383D4CBA761A5D6F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9655
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2dafdee-209e-4aed-bce2-08db87735b0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GK54cJ2hZv/62vMvKJHBVzymQJsPYAsT8uxhVEho07rG+tR7ZVD9xhrEUf5j9vuUDW6A5/f8MCXPSHaDBRkV/SlJCxS/S3Aw5jSMeXAReFegilrN5Y+aKpYkX5DS22sY5X4yCJAZK0UujsbG9QjXmPsBpTwZfZg59v1t81cgRLQRpd8GHRJ36VVzJkjo+3prPLhXvDRlZBTxAxWK8fbyD4Vt0DDfrlFSLh071IrnEfxztEOwX691m0DZMYXMNJZhYMybaiRe8s2zznGD42pKcwDuvkKjYQuNTp1JfIETGfjJa/ftMqhdl4lwdSTTy0OMbtuHNw9EAXY8JMFxbBkMsaALWOg22Y+jJm2cTaWUQ28ke8/W2xzh7+cr3i1agGaVYvFyxhzf+oNW/iQFCaClXHNWuVnCPttays3gpDzwetnhaZADzzJ8tG2T2muMXZiQp4mt11KJH9ak20JNUz8EkjaUk6eH3pf9So/4w0u98KH1ERRmFyCmAjjw5wx7zmSV1jq8Dc8JLE88wlGJiBakJPYeaYuefZmtFsVbJLukG8b+b8fRIxmcWvU6ypvkaWctn1BNmhJFetudok+7Cd8BgSgdtylYMWe2W0Zm9VJu7fF444vdwMCxKScjDlcUsm3Ks7wedHjmh1KNXJ4jIxgCi5lFr2bs5iKLTuSOMuzeTYc+lcdGSLX+MpmaWdoMwGOtKYM6OwrtjPxaLeWFvLta6NcR4szD1/Q4IRt2J9/C0xRGc8GusTCVypJ9PT/X8Kil
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(36860700001)(41300700001)(316002)(83380400001)(53546011)(336012)(186003)(6512007)(2616005)(26005)(47076005)(6506007)(356005)(40460700003)(6486002)(478600001)(81166007)(82740400003)(54906003)(4326008)(70206006)(70586007)(40480700001)(86362001)(33656002)(5660300002)(6862004)(8676002)(36756003)(2906002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:43:00.8038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aad3d7d5-8c72-449a-1c08-08db8773603d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB10377

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> When initializing the FF-A mediator map the RX and TX buffers shared with
> the SPMC.
>=20
> These buffer are later used to to transmit data that cannot be passed in
> registers only.
>=20
> Adds a check that the SP supports the needed FF-A features
> FFA_RXTX_MAP_64 and FFA_RXTX_UNMAP.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 50 +++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 49 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index e05d58cf7755..f8ccaabc568d 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -12,6 +12,7 @@
> #include <xen/errno.h>
> #include <xen/init.h>
> #include <xen/lib.h>
> +#include <xen/mm.h>
> #include <xen/sched.h>
> #include <xen/sizes.h>
> #include <xen/types.h>
> @@ -67,6 +68,12 @@
>  */
> #define FFA_PAGE_SIZE                   SZ_4K
>=20
> +/*
> + * The number of pages used for each of the RX and TX buffers shared wit=
h
> + * the SPMC.
> + */
> +#define FFA_RXTX_PAGE_COUNT             1
> +
> /*
>  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
>  * BIT(31): Framework or partition message
> @@ -161,6 +168,13 @@ struct ffa_ctx {
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t __ro_after_init ffa_version;
>=20
> +/*
> + * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
> + * number of pages used in each of these buffers.
> + */
> +static void *ffa_rx __read_mostly;
> +static void *ffa_tx __read_mostly;
> +
> static bool ffa_get_version(uint32_t *vers)
> {
>     const struct arm_smccc_1_2_regs arg =3D {
> @@ -231,6 +245,12 @@ static bool check_mandatory_feature(uint32_t id)
>     return !ret;
> }
>=20
> +static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
> +                            uint32_t page_count)
> +{
> +    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count=
, 0);
> +}
> +
> static uint16_t get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> @@ -394,6 +414,7 @@ static int ffa_relinquish_resources(struct domain *d)
> static bool ffa_probe(void)
> {
>     uint32_t vers;
> +    int e;
>     unsigned int major_vers;
>     unsigned int minor_vers;
>=20
> @@ -441,12 +462,39 @@ static bool ffa_probe(void)
>      * TODO: Rework the code to allow domain to use a subset of the
>      * features supported.
>      */
> -    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> +    if (
> +         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> +         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> +         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> +        return false;
> +
> +    ffa_rx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
> +    if ( !ffa_rx )
>         return false;
>=20
> +    ffa_tx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_CO=
UNT), 0);
> +    if ( !ffa_tx )
> +        goto err_free_ffa_rx;
> +
> +    e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
> +        goto err_free_ffa_tx;
> +    }
>     ffa_version =3D vers;
>=20
>     return true;
> +
> +err_free_ffa_tx:
> +    free_xenheap_pages(ffa_tx, 0);
> +    ffa_tx =3D NULL;
> +err_free_ffa_rx:
> +    free_xenheap_pages(ffa_rx, 0);
> +    ffa_rx =3D NULL;
> +    ffa_version =3D 0;
> +
> +    return false;
> }
>=20
> static const struct tee_mediator_ops ffa_ops =3D
> --=20
> 2.34.1
>=20


