Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3204FF827
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 15:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304153.518719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedMD-0007wj-1f; Wed, 13 Apr 2022 13:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304153.518719; Wed, 13 Apr 2022 13:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedMC-0007u3-UI; Wed, 13 Apr 2022 13:48:28 +0000
Received: by outflank-mailman (input) for mailman id 304153;
 Wed, 13 Apr 2022 13:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0JnL=UX=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nedMB-0007tx-SW
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 13:48:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64299f15-bb30-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 15:48:26 +0200 (CEST)
Received: from AM6PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:f0::48)
 by AM9PR08MB7244.eurprd08.prod.outlook.com (2603:10a6:20b:433::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 13:48:23 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::13) by AM6PR04CA0071.outlook.office365.com
 (2603:10a6:20b:f0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30 via Frontend
 Transport; Wed, 13 Apr 2022 13:48:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 13:48:22 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 13 Apr 2022 13:48:22 +0000
Received: from e3cd7df54723.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9780A3A-7A70-487F-95BF-81B364D830CB.1; 
 Wed, 13 Apr 2022 13:48:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3cd7df54723.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Apr 2022 13:48:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR2PR08MB4746.eurprd08.prod.outlook.com (2603:10a6:101:23::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 13:48:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6%4]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 13:48:14 +0000
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
X-Inumbo-ID: 64299f15-bb30-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV4IBIpBa4dX2xqjgatPHaXMPaAyCwe4ek7jEDdMCIk=;
 b=cLCyNt7fktz15TOobdqlTlwCxC56kCWvl8q8Ym8c3eJ8yWWeEC+29Q9uTtSwzPgTj/Xz3xhmBnBMjRIQGqL/qwBZLLUaGaf1OQ881rgcHa2ee2Bu3f1Xghm9vCw1h25VWd+HF2tOCni6Fo+1n3p23DFefUJ0+GPSMChSr2lmAlI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3144488bbe50a734
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gM+5onBvvTKLzFwFyVpfDDHRfTNh29jT8VTkhzG4kXvf4Bt54Hc2ddmhHGiktVzZ++SzGqW/Dg9BSocRcXeNVMV8wgBMPpbpSCdjwqccacTAdMUkKciMJqtsuwEKGkK2kRK3eEGtFh50KxNqWg1XLkRpyqxTWu4TMu5dcWerG3uUwdI6dSz+TZwjWRqX55mhwlNniGmhjh0spQNorHLz8U1njkA3kO9rKd26d20mHpuBCxE3haO58SMzGcNuDxLd38CmYXYdIxuxpyD7+qEHgj+9PT2bRvTGDpyibnJIQwdKsBXzMWbmrYjbDajEgajSpC9tOX/Bek33J9lGCRX17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV4IBIpBa4dX2xqjgatPHaXMPaAyCwe4ek7jEDdMCIk=;
 b=ci3eX5Rz2fc/wQbLnW20ZBn1rAcCchJBCtE1FDPFtP7ZA0F63XdJhyg0tDfYdUDhOG3lWXjNfBh9MuG+1+C2b1I62Afr3axOQ4sOseEv6QDq3d6YVkcY41XJdrLcMDTRrbly5PjEcfE2ukAxM0yZ9V1m+4A4cBDlqWl830fqcx5TatbfvmbC1iV/sH91K61Nw0PHEp4tdRSOpwhDqykbD221yUVVlL4yXuPZMnsuSBBWYtHHd+E5SatNlUvVF355A05acKrR1BA0F/uIUTEdF71GE8FL9W7ndC4WCI2ERUTjHwu/JUY6Zv9u9TD/tKKU/ziZXHlsezT3McEZJinzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV4IBIpBa4dX2xqjgatPHaXMPaAyCwe4ek7jEDdMCIk=;
 b=cLCyNt7fktz15TOobdqlTlwCxC56kCWvl8q8Ym8c3eJ8yWWeEC+29Q9uTtSwzPgTj/Xz3xhmBnBMjRIQGqL/qwBZLLUaGaf1OQ881rgcHa2ee2Bu3f1Xghm9vCw1h25VWd+HF2tOCni6Fo+1n3p23DFefUJ0+GPSMChSr2lmAlI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Thread-Topic: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Thread-Index: AQHYTYhA4nLWVzOAC0uoUDkBvluxmqzt3yyA
Date: Wed, 13 Apr 2022 13:48:14 +0000
Message-ID: <6F9FAAD4-59FF-4D52-B08D-13E3920B3925@arm.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
In-Reply-To: <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 77ec27f8-225a-4bec-f82a-08da1d5446dd
x-ms-traffictypediagnostic:
	PR2PR08MB4746:EE_|AM5EUR03FT024:EE_|AM9PR08MB7244:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB72446173F174227583ACDF469DEC9@AM9PR08MB7244.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8JLPoaktotRm/DMyaq+dJx1amcxQ/WPOVPyQ/mlkk9NUxUNep7uepWbfYcPz0Oogvt/7/VB45ZFRhLpPo2Pi4My3Nk6cs6jIsnzMRb+RCHhdrt0gprwAP+/PaXJmL5HwSGwD2jSI2V++IJnrVJEUyYxLfjhJ7EcEsJEb60xuSmPUpYodEcdv+xXNa3cr4e2HuhGl12sJPsRutajhYW2LsTw7qYgOMrGSk3Yjr2CSKsQssrp0FKzdBIt0i7ciG8qLeZ6oUt0tA4yPyfNM+rx8EcwuIL30S5r7R4ISAbwqW5ZFCgPMebIpFxDWWwfeqxwRdTzOGy5n6G1dg6+B+Vn5FTy/oEzv25zY2DtxtuSJVa1jHqW6q+ZtBgq40Lg7mCwL8ifZXVYjB64vLEBkAuwklGoZSPMr2KS1s+veeDwMwbcLCVwVWweMXn6jMlPe3/tymlQb6v4EzKzUiuKaxWmyCxrdswnqU2saVBBW6VLnTJwykx8IG35BtWobXBfzqpF9FS0raWjjS5Cw5KQVeu0CVO+EG6Us2zj9kc9dDwPn1AViTtmx8wr9XVi7Zjpu0TRRmaPUadO7P5pO/3iawVOlwjTsWAszCpfPgKGWoAmMJYUaT1NrDzaFdBXF+hkUD9xJETTuVKkPZPUjoZs9gOksWd1YC3SNIIshUld5xUDs3chVbzpAINqIBsi/bql3YODOv4+iB5bODHC+6uVCCVYYNv3Lj+ZNDD5TrLBmdgaS5lHR8ZrNW3ZE3EqeoIGdKPKH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(6506007)(38100700002)(6512007)(2906002)(8936002)(71200400001)(53546011)(7416002)(6916009)(36756003)(2616005)(186003)(6486002)(26005)(54906003)(5660300002)(498600001)(64756008)(66946007)(76116006)(33656002)(66446008)(66556008)(8676002)(66476007)(4326008)(86362001)(91956017)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6E72DF8707022A48ADF7DCF4DF948A33@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4746
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a1ae2358-a2d2-4949-3271-08da1d5441a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R9M+AAiNgt81mY7WFNLjG/O19jWrOYgkbpVc8Q/LkGlJ3M6a0rNh+r9VheTMsHtffC20jgbLZXanApPq2VIFQpittrf0dcGxDZD3I9fc/c7m1cVPhzylhCkfHz5to5ip95kzq5QLIA/52zlKvKlR6QPFY2kLH8DMxgcrjsm4zf9ukwEc188HwFNfjgXqXZEUdeNuWTHibDVyx3iqq9MNfULEA7OyMmvb7eBhmk9YBHn6iNT33Ya8Oyzb9RLYVw4Apctm+fzz3ttDZ/75eGy4zP0NpAWoRHhnn14IMymcgigVvASv11tfyjm5smd+502eEsdzGbycbCJ8whQBJNlzp+VJzKldnwoFmlmG8g4WQcDuQfEnqloUNxlHtitM9lpmeMI/0WlCDsa6lOLU4o/S+Y7SMweN4u8jphYHsf2Dx36P1mZdyxbzCgQ3SVetP7LUTYj5we7WCl9ssDdxCk8vzVI/102YYmjo2+zLXnFa20O9K+9Fn1UOqjm6X0B9mhMM+TBsZUCIehRQiFMrwEYYFlanZCXGK8CEj8qPW6wu5jajJzAlvGx9uELU1DnkwDZrUKr4M7f6CCEg7995zq+0ndvWGKBDk9DGAHFy0xtenDU/osgbMo7xrdubDXjEhRmPzrCles/NnDIIY/ASWA7DVCVGAN6MutXS//4UfGGrW2uX6+UYFiHHERRKAbg7Q6MU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(498600001)(86362001)(2906002)(70586007)(6486002)(8936002)(40460700003)(33656002)(8676002)(4326008)(6862004)(36860700001)(70206006)(5660300002)(54906003)(82310400005)(107886003)(6512007)(356005)(6506007)(26005)(53546011)(36756003)(81166007)(2616005)(186003)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 13:48:22.9132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ec27f8-225a-4bec-f82a-08da1d5446dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7244

Hi Jan,

> On 11 Apr 2022, at 10:40, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> There's no good reason to use these when we already have a pci_sbdf_t
> type object available. This extends to the use of PCI_BUS() in
> pci_ecam_map_bus() as well.
>=20
> No change to generated code (with gcc11 at least, and I have to admit
> that I didn't expect compilers to necessarily be able to spot the
> optimization potential on the original code).
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note that the Arm changes are "blind": I haven't been able to spot a way
> to at least compile test the changes there; the code looks to be
> entirely dead.
>=20
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -28,8 +28,7 @@ void __iomem *pci_ecam_map_bus(struct pc
>         container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
>     unsigned int devfn_shift =3D ops->bus_shift - 8;
>     void __iomem *base;
> -
> -    unsigned int busn =3D PCI_BUS(sbdf.bdf);
> +    unsigned int busn =3D sbdf.bus;
>=20
>     if ( busn < cfg->busn_start || busn > cfg->busn_end )
>         return NULL;
> @@ -37,7 +36,7 @@ void __iomem *pci_ecam_map_bus(struct pc
>     busn -=3D cfg->busn_start;
>     base =3D cfg->win + (busn << ops->bus_shift);
>=20
> -    return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
> +    return base + (sbdf.df << devfn_shift) + where;

I think this should be sbdf.bdf instead (typo you removed the b).

Cheers
Bertrand


