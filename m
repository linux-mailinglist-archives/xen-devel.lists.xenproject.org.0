Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1E84D84A8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 13:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290208.492137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTjr8-0006Kw-PI; Mon, 14 Mar 2022 12:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290208.492137; Mon, 14 Mar 2022 12:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTjr8-0006Il-KE; Mon, 14 Mar 2022 12:31:22 +0000
Received: by outflank-mailman (input) for mailman id 290208;
 Mon, 14 Mar 2022 12:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1jB=TZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nTjr6-0006If-Mp
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 12:31:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe02::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f5763c5-a392-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 13:31:08 +0100 (CET)
Received: from AM5PR0601CA0035.eurprd06.prod.outlook.com
 (2603:10a6:203:68::21) by PAXPR08MB7368.eurprd08.prod.outlook.com
 (2603:10a6:102:22a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 12:31:15 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::fa) by AM5PR0601CA0035.outlook.office365.com
 (2603:10a6:203:68::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Mon, 14 Mar 2022 12:31:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 12:31:15 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Mon, 14 Mar 2022 12:31:14 +0000
Received: from f2084ae6d7d0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7A8CD84-7F5C-46DD-9722-4B73DC07B0DF.1; 
 Mon, 14 Mar 2022 12:31:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2084ae6d7d0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 12:31:08 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM8PR08MB5651.eurprd08.prod.outlook.com (2603:10a6:20b:1c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 12:31:06 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 12:31:06 +0000
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
X-Inumbo-ID: 9f5763c5-a392-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bM1Gm+RvVmUA+1zyEjvmswn5Rv6KWFgmLnYkWdQqsU=;
 b=nx0mZeyxPLhzkswHe3cRCuyVxUKFH5+yXatz4RSQxQGtlNrL9Y/x8+w45lNgjMnc4qVERXuGWcUTS7XalnV56tBoe1X4gxEk0q9OTbw8qSqZFCKR8nEBGRpRvtAbTArsJ7Xw2WMYFHs3jkpQbL6YKA/1kKptTvLs/czsk6XmKhc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: be4e28bf5fc133e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcvYXCJx6ewEwJI+74QGa/Yvt2ddw5Qh6ThrmpVTF81mvdYAsZTx/5oCpGEtbOwKCqV9h6vn2DIHqD3LtpoES0qKz4uayMewmyCVglQO9OO1kzggLziKnETNyqgV1gB3F4naU2rXXqs5bJ9iVvB9NqKCNJZSuRCdkxF06dRg15WzBWc3MoWowfn258SLHrTBO93Bol1y1rZY5njxkZanjrBgXP4mLpWDMcY76XylYQ1mbbvHZ6kYEDD36iw/EQ3iqHShzjdv4gRuHgISGEG2Sfk+lOKPd5rWRdk9oOqw1kZw6jVZmo8a7OwoJ79+mba/IoK80d2T1BKnxkHs/TuqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bM1Gm+RvVmUA+1zyEjvmswn5Rv6KWFgmLnYkWdQqsU=;
 b=CAxLmuflo/s3NxfZUlU97AnKWMdr+HC7Cn3Z5I5EXjBsFThupBzLoJFvy/mATDIcRO2mJkaVOPG6UJJnVgj9kAGFPjBqiIVt+P8+UZJPRpw8RyhZvLUKWWXnt9Ynq/zRjxJqZlrhgOXgspXumsAKKf2f50uNlHfIjhi9ICuCSo5B1CfSwrWpqNRNs55TCK5rV/mAZ6JtCsGqltyeB+N4NZTIjFTmVc9fD4DRLBEhRCyiSP80dVIEIeR5qWrYh7oPdWnj4JY/VrHXYXglh0o28uF6RKJNwJKxmjAutBo1HOz7qPBXuvTo2N4AUEKcwP73mNpskb8b3mzobimpsUx34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bM1Gm+RvVmUA+1zyEjvmswn5Rv6KWFgmLnYkWdQqsU=;
 b=nx0mZeyxPLhzkswHe3cRCuyVxUKFH5+yXatz4RSQxQGtlNrL9Y/x8+w45lNgjMnc4qVERXuGWcUTS7XalnV56tBoe1X4gxEk0q9OTbw8qSqZFCKR8nEBGRpRvtAbTArsJ7Xw2WMYFHs3jkpQbL6YKA/1kKptTvLs/czsk6XmKhc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>
Subject: Re: [XEN][RFC PATCH v3 01/14] xen/arm/device: Remove __init from
 function type
Thread-Topic: [XEN][RFC PATCH v3 01/14] xen/arm/device: Remove __init from
 function type
Thread-Index: AQHYMyVyyZZSb95l5UaUheP8eaC2Lqy+2HMA
Date: Mon, 14 Mar 2022 12:31:06 +0000
Message-ID: <337CEFA8-895C-4B5D-810A-3D4E2927CE01@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-2-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-2-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: acdfd66e-74b9-4a09-f31f-08da05b68824
x-ms-traffictypediagnostic:
	AM8PR08MB5651:EE_|VE1EUR03FT013:EE_|PAXPR08MB7368:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB73687FB6740A5E5993E83E3CE40F9@PAXPR08MB7368.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A+iTgmO+271BaShS2PBYBX7YVHCXncyM/A96mTuLz/eQiu4LtBJDxlZgNN97L3rXGrw0e/aalm2S8lsPazDUz1FKrKPAIkTIGOmCp2TDUZzHK1zobV2YsjEl3C6/WKL/GJEXv18QJTk5nGDEdEKte4OrGClQwuQKgRSaiUej6aOoUAMYf3z0kty1/wn7S+EB9DNkUYvcgRkbdw8F4YycDaP3LSj5oSlt6lPJGUvtRy9hwEKg6vqVaJxbAB6hEIC8tBQjFiXwDJzp0xc+EfCg4t2GYGX/BLeOvJ4/nIVi1QzcZKzW9urDrwZF2uy3CAm8MpGkzYMNT046ikOR0r0VkBjuUwU0YmmJ/dEsDK+v25nFgNncZNNZkoxbFDSJu9k6jyJLUBrb3582r+3ZsYaz1NU8CIrSTAXbeZvgvyTBoQw3ZGUdSxCeH5qovJcLv7sfus89Y3Nv8/LROHZu6JUzNjp56Hb9cvA46NsangXePqpOl2HwYv1rJol1MA8qccUMEGenwYBGiGq/zikiCENLnmQsl0EExpaKys/KVpHwKOKqJYSSapJ+jlqDYPi5+1joCr9J3DNB/Sqvp8oxT9gsbHa8ydr7hSzlafmfIc+SuzmkYEGNvjGfYS9/W7k1+My/zg1ke36CdHAAjgmxBWmimjEn5pb/X+0P5bTwc+XWtTx+Qe2WXUR/7JViaQh1k6XVlykkNbTYO/gFbaWO5Vz96MOh0cbi1LDhrCTAqpSdkyKkpUbbHqzha1mI8LImqHck
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(122000001)(33656002)(2616005)(38070700005)(6916009)(5660300002)(6512007)(6506007)(6486002)(8936002)(83380400001)(316002)(54906003)(36756003)(186003)(26005)(30864003)(4326008)(76116006)(66946007)(53546011)(2906002)(91956017)(8676002)(66446008)(66556008)(38100700002)(64756008)(66476007)(71200400001)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5F167E6048F8BA41BC9150F2DF55C6C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5651
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0e9e64a-8add-4626-70f2-08da05b682bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cweYl5u9UZZWSVIG/MIs1iG3EV5ztwvDL1l3allrqPdoOlCFghag/xXu4S99IW2nOlCbYKRWlTm7q8a5P2Ngw0yPCpElW6M/3Ktrf83Gmo6EnCQBR6/gLQqH7j6NY1d7K5Vsehfq6tlfb5727G+PxvvmftbKtoZVPyS12OzTOBOnmvgA2LNgUjdx/UbU0IJnaUBaRKHu8wim6PJMMa59P96qe9WfAuxXSK12P88BOctF2lifEmldYIV57HblDI1vqERp07szKfDd6zEKCQK4apDQsXHP0iOqZjJrzP+Llr/e+6syEutrkNjcgtpSQ/nKcqmCvnbHPECOBE5FxIPsKRrGWcRTieJWrJOh6hEOefonK5cjgBxg/ksgPiGTfDReAh3KOrtyJ7s43LTpscOb+We/FNdyy4UhIeG0bbb1biuENVsqFKiADJgUDtIb8yA1HG5gq7nnSvzDJIW2rH84/cCr/fEnNSdKA/wK35LxWCKZym9Ye0d1UW3pUm7flsM+oslTkx80NaNXkBaD/0Pt0iGwjO4h+4az41RpwBcMOvv6sx8D3xd8ZLFhvPzHcraIbiDMEEe7/qgxGr6bQd7B7hqEy3U4iFlxaipqdguFKcwkre/1nzwbsAtjasdk/tRUx7JGQk3yfhq/kr+7vVXmDhuyowgIDPHhUbpK8euAeEy1dqt6QawhkPpGFmqt4P4h
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(30864003)(47076005)(2906002)(508600001)(40460700003)(5660300002)(36860700001)(8936002)(36756003)(83380400001)(336012)(86362001)(6486002)(54906003)(33656002)(316002)(107886003)(26005)(186003)(82310400004)(81166007)(6512007)(6506007)(8676002)(4326008)(6862004)(70586007)(70206006)(2616005)(356005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 12:31:15.1249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acdfd66e-74b9-4a09-f31f-08da05b68824
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7368



> On 8 Mar 2022, at 19:46, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
>=20
> Change function type of following function to access during runtime:
>    1. map_irq_to_domain()
>    2. handle_device_interrupt()
>    3. map_range_to_domain()
>    4. unflatten_dt_node()
>    5. unflatten_device_tree()
>=20
> Move map_irq_to_domain(), handle_device_interrupt() and map_range_to_doma=
in() to
> device.c.
>=20
> These changes are done to support the dynamic programming of a nodes wher=
e an
> overlay node will be added to fdt and unflattened node will be added to d=
t_host.
> Furthermore, IRQ and mmio mapping will be done for the added node.
>=20
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
> xen/arch/arm/device.c            | 136 +++++++++++++++++++++++++++++
> xen/arch/arm/domain_build.c      | 142 -------------------------------
> xen/arch/arm/include/asm/setup.h |   3 +
> xen/common/device_tree.c         |  20 ++---
> xen/include/xen/device_tree.h    |   5 ++
> 5 files changed, 154 insertions(+), 152 deletions(-)
>=20
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 70cd6c1a19..0dfd33b33e 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -21,6 +21,9 @@
> #include <xen/errno.h>
> #include <xen/init.h>
> #include <xen/lib.h>
> +#include <xen/iocap.h>
> +#include <asm/domain_build.h>
> +#include <asm/setup.h>
>=20
> extern const struct device_desc _sdevice[], _edevice[];
> extern const struct acpi_device_desc _asdevice[], _aedevice[];
> @@ -84,6 +87,139 @@ enum device_class device_get_class(const struct dt_de=
vice_node *dev)
>     return DEVICE_UNKNOWN;
> }
>=20
> +int map_irq_to_domain(struct domain *d, unsigned int irq,
> +                      bool need_mapping, const char *devname)
> +{
> +    int res;
> +
> +    res =3D irq_permit_access(d, irq);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n"=
,
> +               d->domain_id, irq);
> +        return res;
> +    }
> +
> +    if ( need_mapping )
> +    {
> +        /*
> +         * Checking the return of vgic_reserve_virq is not
> +         * necessary. It should not fail except when we try to map
> +         * the IRQ twice. This can legitimately happen if the IRQ is sha=
red
> +         */
> +        vgic_reserve_virq(d, irq);
> +
> +        res =3D route_irq_to_guest(d, irq, irq, devname);
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
> +                   irq, d->domain_id);
> +            return res;
> +        }
> +    }
> +
> +    dt_dprintk("  - IRQ: %u\n", irq);
> +    return 0;
> +}
> +
> +int map_range_to_domain(const struct dt_device_node *dev,
> +                        u64 addr, u64 len, void *data)
> +{
> +    struct map_range_data *mr_data =3D data;
> +    struct domain *d =3D mr_data->d;
> +    int res;
> +
> +    res =3D iomem_permit_access(d, paddr_to_pfn(addr),
> +            paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));

Hi Vikram,

Why the if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
strlen("/reserved-memory/")) !=3D 0 ) was dropped?


> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Unable to permit to dom%d access to"
> +                " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                d->domain_id,
> +                addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> +        return res;
> +    }
> +
> +    if ( !mr_data->skip_mapping )
> +    {
> +        res =3D map_regions_p2mt(d,
> +                               gaddr_to_gfn(addr),
> +                               PFN_UP(len),
> +                               maddr_to_mfn(addr),
> +                               mr_data->p2mt);
> +
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
> +                   " - 0x%"PRIx64" in domain %d\n",
> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> +                   d->domain_id);
> +            return res;
> +        }
> +    }
> +
> +    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=3D%x\n",
> +               addr, addr + len, mr_data->p2mt);
> +
> +    return 0;
> +}
> +
> +/*
> + * handle_device_interrupts retrieves the interrupts configuration from
> + * a device tree node and maps those interrupts to the target domain.
> + *
> + * Returns:
> + *   < 0 error
> + *   0   success
> + */
> +int handle_device_interrupts(struct domain *d,
> +                             struct dt_device_node *dev,
> +                             bool need_mapping)
> +{
> +    unsigned int i, nirq;
> +    int res;
> +    struct dt_raw_irq rirq;
> +
> +    nirq =3D dt_number_of_irq(dev);
> +
> +    /* Give permission and map IRQs */
> +    for ( i =3D 0; i < nirq; i++ )
> +    {
> +        res =3D dt_device_get_raw_irq(dev, i, &rirq);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> +                   i, dt_node_full_name(dev));
> +            return res;
> +        }
> +
> +        /*
> +         * Don't map IRQ that have no physical meaning
> +         * ie: IRQ whose controller is not the GIC
> +         */
> +        if ( rirq.controller !=3D dt_interrupt_controller )
> +        {
> +            dt_dprintk("irq %u not connected to primary controller. Conn=
ected to %s\n",
> +                      i, dt_node_full_name(rirq.controller));
> +            continue;
> +        }
> +
> +        res =3D platform_get_irq(dev, i);
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> +                   i, dt_node_full_name(dev));
> +            return res;
> +        }
> +
> +        res =3D map_irq_to_domain(d, res, need_mapping, dt_node_name(dev=
));
> +        if ( res )
> +            return res;
> +    }
> +
> +    return 0;
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8be01678de..b06770a2af 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1794,41 +1794,6 @@ int __init make_chosen_node(const struct kernel_in=
fo *kinfo)
>     return res;
> }
>=20
> -int __init map_irq_to_domain(struct domain *d, unsigned int irq,
> -                             bool need_mapping, const char *devname)
> -{
> -    int res;
> -
> -    res =3D irq_permit_access(d, irq);
> -    if ( res )
> -    {
> -        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n"=
,
> -               d->domain_id, irq);
> -        return res;
> -    }
> -
> -    if ( need_mapping )
> -    {
> -        /*
> -         * Checking the return of vgic_reserve_virq is not
> -         * necessary. It should not fail except when we try to map
> -         * the IRQ twice. This can legitimately happen if the IRQ is sha=
red
> -         */
> -        vgic_reserve_virq(d, irq);
> -
> -        res =3D route_irq_to_guest(d, irq, irq, devname);
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
> -                   irq, d->domain_id);
> -            return res;
> -        }
> -    }
> -
> -    dt_dprintk("  - IRQ: %u\n", irq);
> -    return 0;
> -}
> -
> static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>                                        const struct dt_irq *dt_irq,
>                                        void *data)
> @@ -1860,57 +1825,6 @@ static int __init map_dt_irq_to_domain(const struc=
t dt_device_node *dev,
>     return 0;
> }
>=20
> -int __init map_range_to_domain(const struct dt_device_node *dev,
> -                               u64 addr, u64 len, void *data)
> -{
> -    struct map_range_data *mr_data =3D data;
> -    struct domain *d =3D mr_data->d;
> -    int res;
> -
> -    /*
> -     * reserved-memory regions are RAM carved out for a special purpose.
> -     * They are not MMIO and therefore a domain should not be able to
> -     * manage them via the IOMEM interface.
> -     */
> -    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
> -                     strlen("/reserved-memory/")) !=3D 0 )
> -    {
> -        res =3D iomem_permit_access(d, paddr_to_pfn(addr),
> -                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Unable to permit to dom%d access to"
> -                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
> -                    d->domain_id,
> -                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
> -            return res;
> -        }
> -    }
> -
> -    if ( !mr_data->skip_mapping )
> -    {
> -        res =3D map_regions_p2mt(d,
> -                               gaddr_to_gfn(addr),
> -                               PFN_UP(len),
> -                               maddr_to_mfn(addr),
> -                               mr_data->p2mt);
> -
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
> -                   " - 0x%"PRIx64" in domain %d\n",
> -                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
> -                   d->domain_id);
> -            return res;
> -        }
> -    }
> -
> -    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=3D%x\n",
> -               addr, addr + len, mr_data->p2mt);
> -
> -    return 0;
> -}
> -
> /*
>  * For a node which describes a discoverable bus (such as a PCI bus)
>  * then we may need to perform additional mappings in order to make
> @@ -1938,62 +1852,6 @@ static int __init map_device_children(const struct=
 dt_device_node *dev,
>     return 0;
> }
>=20
> -/*
> - * handle_device_interrupts retrieves the interrupts configuration from
> - * a device tree node and maps those interrupts to the target domain.
> - *
> - * Returns:
> - *   < 0 error
> - *   0   success
> - */
> -static int __init handle_device_interrupts(struct domain *d,
> -                                           struct dt_device_node *dev,
> -                                           bool need_mapping)
> -{
> -    unsigned int i, nirq;
> -    int res;
> -    struct dt_raw_irq rirq;
> -
> -    nirq =3D dt_number_of_irq(dev);
> -
> -    /* Give permission and map IRQs */
> -    for ( i =3D 0; i < nirq; i++ )
> -    {
> -        res =3D dt_device_get_raw_irq(dev, i, &rirq);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> -                   i, dt_node_full_name(dev));
> -            return res;
> -        }
> -
> -        /*
> -         * Don't map IRQ that have no physical meaning
> -         * ie: IRQ whose controller is not the GIC
> -         */
> -        if ( rirq.controller !=3D dt_interrupt_controller )
> -        {
> -            dt_dprintk("irq %u not connected to primary controller. Conn=
ected to %s\n",
> -                      i, dt_node_full_name(rirq.controller));
> -            continue;
> -        }
> -
> -        res =3D platform_get_irq(dev, i);
> -        if ( res < 0 )
> -        {
> -            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> -                   i, dt_node_full_name(dev));
> -            return res;
> -        }
> -
> -        res =3D map_irq_to_domain(d, res, need_mapping, dt_node_name(dev=
));
> -        if ( res )
> -            return res;
> -    }
> -
> -    return 0;
> -}
> -
> /*
>  * For a given device node:
>  *  - Give permission to the guest to manage IRQ and MMIO range
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/=
setup.h
> index 7a1e1d6798..8a26f1845c 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -134,6 +134,9 @@ void device_tree_get_reg(const __be32 **cell, u32 add=
ress_cells,
> u32 device_tree_get_u32(const void *fdt, int node,
>                         const char *prop_name, u32 dflt);
>=20
> +int handle_device_interrupts(struct domain *d, struct dt_device_node *de=
v,
> +                             bool need_mapping);
> +
> int map_range_to_domain(const struct dt_device_node *dev,
>                         u64 addr, u64 len, void *data);
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 4aae281e89..f43d66a501 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -1811,12 +1811,12 @@ int dt_count_phandle_with_args(const struct dt_de=
vice_node *np,
>  * @allnextpp: pointer to ->allnext from last allocated device_node
>  * @fpsize: Size of the node path up at the current depth.
>  */
> -static unsigned long __init unflatten_dt_node(const void *fdt,
> -                                              unsigned long mem,
> -                                              unsigned long *p,
> -                                              struct dt_device_node *dad=
,
> -                                              struct dt_device_node ***a=
llnextpp,
> -                                              unsigned long fpsize)
> +static unsigned long unflatten_dt_node(const void *fdt,
> +                                       unsigned long mem,
> +                                       unsigned long *p,
> +                                       struct dt_device_node *dad,
> +                                       struct dt_device_node ***allnextp=
p,
> +                                       unsigned long fpsize)
> {
>     struct dt_device_node *np;
>     struct dt_property *pp, **prev_pp =3D NULL;
> @@ -2047,7 +2047,7 @@ static unsigned long __init unflatten_dt_node(const=
 void *fdt,
> }
>=20
> /**
> - * __unflatten_device_tree - create tree of device_nodes from flat blob
> + * unflatten_device_tree - create tree of device_nodes from flat blob
>  *
>  * unflattens a device-tree, creating the
>  * tree of struct device_node. It also fills the "name" and "type"
> @@ -2056,8 +2056,8 @@ static unsigned long __init unflatten_dt_node(const=
 void *fdt,
>  * @fdt: The fdt to expand
>  * @mynodes: The device_node tree created by the call
>  */
> -static void __init __unflatten_device_tree(const void *fdt,
> -                                           struct dt_device_node **mynod=
es)
> +void unflatten_device_tree(const void *fdt,
> +                           struct dt_device_node **mynodes)
> {
>     unsigned long start, mem, size;
>     struct dt_device_node **allnextp =3D mynodes;
> @@ -2179,7 +2179,7 @@ dt_find_interrupt_controller(const struct dt_device=
_match *matches)
>=20
> void __init dt_unflatten_host_device_tree(void)
> {
> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
> +    unflatten_device_tree(device_tree_flattened, &dt_host);
>     dt_alias_scan();
> }
>=20
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index fd6cd00b43..06d7866c10 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -177,6 +177,11 @@ int device_tree_for_each_node(const void *fdt, int n=
ode,
>  */
> void dt_unflatten_host_device_tree(void);
>=20
> +/*
> + * unflatten any device tree.
> + */
> +void unflatten_device_tree(const void *fdt, struct dt_device_node **myno=
des);
> +
> /**
>  * IRQ translation callback
>  * TODO: For the moment we assume that we only have ONE

NIT: there are some minor code style issues, like indentation that could be=
 fixed

Cheers,
Luca


