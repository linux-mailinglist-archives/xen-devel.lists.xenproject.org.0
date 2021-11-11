Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE044D327
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 09:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224646.388056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml5Pv-0000Si-8n; Thu, 11 Nov 2021 08:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224646.388056; Thu, 11 Nov 2021 08:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml5Pv-0000QK-5W; Thu, 11 Nov 2021 08:26:43 +0000
Received: by outflank-mailman (input) for mailman id 224646;
 Thu, 11 Nov 2021 08:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tymM=P6=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ml5Ps-0000QE-Uy
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 08:26:41 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe07::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1702c306-42c9-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 09:26:38 +0100 (CET)
Received: from AS9PR0301CA0021.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::11) by AS8PR08MB6614.eurprd08.prod.outlook.com
 (2603:10a6:20b:338::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Thu, 11 Nov
 2021 08:26:36 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::7b) by AS9PR0301CA0021.outlook.office365.com
 (2603:10a6:20b:468::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Thu, 11 Nov 2021 08:26:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Thu, 11 Nov 2021 08:26:36 +0000
Received: ("Tessian outbound 2bb1f94ba47e:v108");
 Thu, 11 Nov 2021 08:26:36 +0000
Received: from 06b6f347fbd9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD40197F-8B96-49DE-8579-EE8FCB1E4650.1; 
 Thu, 11 Nov 2021 08:26:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06b6f347fbd9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Nov 2021 08:26:30 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DU2PR08MB7312.eurprd08.prod.outlook.com (2603:10a6:10:2e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Thu, 11 Nov
 2021 08:26:29 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165%3]) with mapi id 15.20.4669.011; Thu, 11 Nov 2021
 08:26:27 +0000
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
X-Inumbo-ID: 1702c306-42c9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wg42JrRQEESIOLWc7L/k/2yYrcDRK/cYBkON798A60=;
 b=iWLHc48KSqep6zijf/jkAaw4YnfGVkjoW9fiPc3R/UeWK5eevXW33oBJK4NFn/jC1MRk7EJZ12xhCwdqnLZ05XzxEp3WZXiT+IedSoCELbIYkyDDXM4w7OLqreohtO4lkKMC3FsZsTR03wUFcdg3fNCqtxFJAEw8tSsrSTADEXk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY+h1iSSfEvSMMRe2322ze9GyhtHctFLIpEJybP4aSOfNaSk7xbByS9DSD8/sYtPuDTEoiRr/P8rzVCvcNBx7rBqzV3lHoFR30jYpr66b5ZOy/zNXGH2Lg/S8Y2GyL6c+IfvpiF7lM1SbBdCxFivMXg7TSbiiNWLCOaxFYpin+3XocjVAQgmA8jbs8JR0TfkEYgcQi0Apz6jzSA06gnpmuGi9NjCefywj9oFYlExLB2YItaVTYIKC+qd+Arf1eTbUgqujlbrlEzOZQTg2leyGANrmH+PFQhiwqYCT6ep3VeC68NCJ8B8ZGr+awtmrDpMk+z/ywuAAZBG4ypUgBWeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wg42JrRQEESIOLWc7L/k/2yYrcDRK/cYBkON798A60=;
 b=D7HuA0iy6jMgQMqPzunbW0JGIPe4K3P6I3RhCIulkoGj+1/oAdAv15FUw6YnlSDdsu/Ye6irlLvXH6aWQ5R4zAhHt7v5ypZrFA5TyWGl4RKMn8TyKwSwgmkkPJEuY77eGxpSNvPFHCsDsByG6pW68vkDe4hE0OcLgUMKHEFSDjrdBJnX/vqKsLAnTdpSyu1Hha23kRZxNiocJ39ornTL0XFRLiMOFjK9dFhZI2+jU/pGwJfaM6iF2ccl1ckA4OTYQVPkz4GUrdxnPblD820pCiY1hIUJ+3CA5a5+QbkAkWnzHgisB43anpk33q0Olgv3gQYoIwDV0xECTBWlZhLPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wg42JrRQEESIOLWc7L/k/2yYrcDRK/cYBkON798A60=;
 b=iWLHc48KSqep6zijf/jkAaw4YnfGVkjoW9fiPc3R/UeWK5eevXW33oBJK4NFn/jC1MRk7EJZ12xhCwdqnLZ05XzxEp3WZXiT+IedSoCELbIYkyDDXM4w7OLqreohtO4lkKMC3FsZsTR03wUFcdg3fNCqtxFJAEw8tSsrSTADEXk=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"iwj@xenproject.org" <iwj@xenproject.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: RE: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as
 reserved-memory
Thread-Topic: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as
 reserved-memory
Thread-Index: AQHX1nAjHIlrrODS3kOS9MmML45m+av9/FFw
Date: Thu, 11 Nov 2021 08:26:26 +0000
Message-ID:
 <DU2PR08MB7325C9C705C9C3246A4E2C9DF7949@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20211110201812.934306-1-sstabellini@kernel.org>
In-Reply-To: <20211110201812.934306-1-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F717BE517462AE4FA5C9A3A2F0FFACCF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 51871084-0460-4686-55c6-08d9a4ecfa20
x-ms-traffictypediagnostic: DU2PR08MB7312:|AS8PR08MB6614:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6614A4CDC5D4E59B0F0BF8A3F7949@AS8PR08MB6614.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:404;OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GBER4iP26sAAGYRLHNU0fPflU/wMMTzGAZhFhemN0hP37EwG2gTSWbVm8/EbfNZ7so06R6dGvIcNeR8xVyMGLvTVKoPWopDENFc25JUBcGcYCDEs6TTByVQZ5QSZRXYVSdiBddkavUSPpgiwMqOa50hnWRweZkKFIgg9HGFO6/AiXZK1S4ecDlk03QrXTC80mYOeQQCV+qzdTX7Xt9yg1VGbXqDJjb6M2xnPIDc/YolbuC6Q+wPuMp4A3wTIXpWjE3IhwjfNw7PZuARpD5PBv77Ymx+QzVBObBmTJ3sQUXerThtSHnVAn1e+Boq4RGXomNqOhkhdhEMIkRJu+tDDBiXPqCMhyYr7uXiXhbnYiGJu6chfwusJMlEGjOKGNCb7GemFZ+GTVfP7Ssuchsj47tPMrkwj9oClDwAn19FV4Zc2WVFrui/cwQ4fSw5qjCJ7lIqE2WfxYFW4n4H9WVrdTH2rLWCewT40TklLqkZlqd8HGFyA34Xde4IdFCTwhz4SoU/wniEYlAezSBWDF6dZsSgDTtwx1Rv0gMe83wpni7hgtjYiuPqzIXpQcDMIJux+LV9/WCiWLCrtn9vqA8v89poPRjp5Ewrg+ab60rS0RPVtY1EckJuwUKXoYZ/8+5ZgcQAXhHQ9KH/R3h2lOKYiFNSsggBjP4kAi56tHmdh3COpNUE9ARv52VvnU1GoWqGyOIAnGZqOnSIJzsLrR0jlrQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(316002)(122000001)(186003)(86362001)(66446008)(66476007)(76116006)(110136005)(53546011)(6506007)(54906003)(66556008)(2906002)(71200400001)(66946007)(64756008)(26005)(55016002)(38070700005)(5660300002)(508600001)(33656002)(83380400001)(8936002)(7696005)(9686003)(8676002)(52536014)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7312
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	034b7208-0882-4cb6-5b08-08d9a4ecf4f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C3m7UIkP43Rp+bV4/T34q++YSRM8WkVJlGpXsZMnx8B0biso4G+nzW6FzgNnIGZhsVm4h8N6JBO43pGpWzsT/+sarrJqfcHRjJI/pdQ4XhueJuAaOVMYn4vfoDQk1tqGpEEWpEHOtb5f7cQMhnVZDQJVzQNh0t9To+fmfEXb4BvRCtGiaWQ57Un3EWCP2Mx+vts35KQauH8Svayb6trT4ehhFmBM5Vb3mXrjhOyfJjKGSrIIhMSUXFFIjZw6s/htwYac1prMHfBp73mE01gUzXO8kNzCchHkluDpI/OVSND0r1v5dgcPdJEfO6b+7deYe23fCPW8QnUrVN5yXxlSFFIXD4XIikOw/+7te5gliLzFYfeEMUkKWlMjEmV/mLeLGAttezF0m7Xm9/EfK9+vRbgyu8KQSwe53GS9jld9Vj2eHVqapQi1UlcosERyJ2Yh8suc8FlhVotWOG9SE4G8rk7wA1ie0+eBDwsELfA9/RG920J9sH8ht6Y6IoxFA45etKb+ydtgL6smZ5OBqNQGPUftc8CK26XoHu8xEAS2rvs3+60g/IQU9ld1/+xyeuc3bSY0/vVE+EzDnQdTutslQcsOx4EDUPlF2bS1cB4+QL2c9sEpVxBucpM2BMqwvd5eO8f6HYexNaLq5G7RalW92ykKhwzWwCnmfEUACozX80jsb1Qpiu1SI9Cmqxy+nj/j1AMFjc7Qc1wv3LZuUeG9yw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(107886003)(86362001)(7696005)(82310400003)(336012)(508600001)(4326008)(54906003)(83380400001)(70586007)(110136005)(356005)(33656002)(316002)(55016002)(81166007)(9686003)(70206006)(53546011)(6506007)(186003)(8936002)(26005)(52536014)(8676002)(47076005)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 08:26:36.4227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51871084-0460-4686-55c6-08d9a4ecfa20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6614

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Thursday, November 11, 2021 4:18 AM
> To: julien@xen.org
> Cc: sstabellini@kernel.org; Penny Zheng <Penny.Zheng@arm.com>; Bertrand
> Marquis <Bertrand.Marquis@arm.com>; Wei Chen <Wei.Chen@arm.com>;
> iwj@xenproject.org; Volodymyr_Babchuk@epam.com; xen-
> devel@lists.xenproject.org; Stefano Stabellini <stefano.stabellini@xilinx=
.com>
> Subject: [PATCH v3] xen/arm: don't assign domU static-mem to dom0 as
> reserved-memory
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> DomUs static-mem ranges are added to the reserved_mem array for
> accounting, but they shouldn't be assigned to dom0 as the other regular
> reserved-memory ranges in device tree.
>=20
> In make_memory_nodes, fix the error by skipping banks with xen_domain set
> to true in the reserved-memory array. Also make sure to use the first val=
id
> (!xen_domain) start address for the memory node name.
>=20
> Fixes: 41c031ff437b ("xen/arm: introduce domain on Static Allocation")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thx again for the fixing up.

Reviewed-by: Penny Zheng <penny.zheng@arm.com>
> ---
> Changes in v3:
> - move BUG_ON inside the loop
>=20
> Changes in v2:
> - improve commit message
> - improve in-code comment
> - update nr_cells appropriately
> ---
>  xen/arch/arm/domain_build.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9e92b640cd..dafbc13962 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -862,21 +862,25 @@ static int __init make_memory_node(const struct
> domain *d,  {
>      int res, i;
>      int reg_size =3D addrcells + sizecells;
> -    int nr_cells =3D reg_size * mem->nr_banks;
> +    int nr_cells =3D 0;
>      /* Placeholder for memory@ + a 64-bit number + \0 */
>      char buf[24];
>      __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
>      __be32 *cells;
>=20
> -    BUG_ON(nr_cells >=3D ARRAY_SIZE(reg));
>      if ( mem->nr_banks =3D=3D 0 )
>          return -ENOENT;
>=20
> -    dt_dprintk("Create memory node (reg size %d, nr cells %d)\n",
> -               reg_size, nr_cells);
> +    /* find first memory range not bound to a Xen domain */
> +    for ( i =3D 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
> +        ;
> +    if ( i =3D=3D mem->nr_banks )
> +        return 0;
> +
> +    dt_dprintk("Create memory node\n");
>=20
>      /* ePAPR 3.4 */
> -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[0].start);
> +    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
>      res =3D fdt_begin_node(fdt, buf);
>      if ( res )
>          return res;
> @@ -886,17 +890,24 @@ static int __init make_memory_node(const struct
> domain *d,
>          return res;
>=20
>      cells =3D &reg[0];
> -    for ( i =3D 0 ; i < mem->nr_banks; i++ )
> +    for ( ; i < mem->nr_banks; i++ )
>      {
>          u64 start =3D mem->bank[i].start;
>          u64 size =3D mem->bank[i].size;
>=20
> +        if ( mem->bank[i].xen_domain )
> +            continue;
> +
>          dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
>                     i, start, start + size);
>=20
> +        nr_cells +=3D reg_size;
> +        BUG_ON(nr_cells >=3D ARRAY_SIZE(reg));
>          dt_child_set_range(&cells, addrcells, sizecells, start, size);
>      }
>=20
> +    dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
> +
>      res =3D fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
>      if ( res )
>          return res;
> --
> 2.25.1

--
Cheers,
Penny Zheng



