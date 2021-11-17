Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9DE45456E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:13:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226752.391959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIsA-0002Z4-55; Wed, 17 Nov 2021 11:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226752.391959; Wed, 17 Nov 2021 11:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIsA-0002WV-1m; Wed, 17 Nov 2021 11:13:02 +0000
Received: by outflank-mailman (input) for mailman id 226752;
 Wed, 17 Nov 2021 11:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwQQ=QE=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mnIs9-0002WN-CO
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:13:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53312be3-4797-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 12:13:00 +0100 (CET)
Received: from AS9PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:20b:46a::23)
 by AM0PR08MB5345.eurprd08.prod.outlook.com (2603:10a6:208:18c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 11:12:46 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::ef) by AS9PR04CA0058.outlook.office365.com
 (2603:10a6:20b:46a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17 via Frontend
 Transport; Wed, 17 Nov 2021 11:12:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Wed, 17 Nov 2021 11:12:44 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Wed, 17 Nov 2021 11:12:44 +0000
Received: from 8561a2652c49.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6C2297F-A134-495E-865A-35362CC52635.1; 
 Wed, 17 Nov 2021 11:12:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8561a2652c49.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Nov 2021 11:12:30 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM7PR08MB5318.eurprd08.prod.outlook.com (2603:10a6:20b:104::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 11:12:29 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%9]) with mapi id 15.20.4649.026; Wed, 17 Nov 2021
 11:12:29 +0000
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
X-Inumbo-ID: 53312be3-4797-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/wn3dXu4SX30oHC8l7SICYI+WWOaGiluZTY43P2S0g=;
 b=TAOjFQK2Ca6UXpDlpZd6MzDImUDY28ZdV4jwzIL+pfOfiu9pDMYduF3fuN914GUVa9ho8oYRuWJdh6ynwvUMFVvTSiH445UACo/a7bkJ1l2dHT0lI18ELOas8fl7qCjvPsRSb2/V/gCrD/qvv1bHvpB+EVy0NWS/VprZ9Lt8OMw=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ed4d5d1a3bed108
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqWZ28ULW5fJMTDAOPN1sulTpXTOrW/V/KN6WRB28iZJdWeVJ+nNdNb9iY9JlwIaghksjJr1eFuv+4qW/YVah7ur798jfn5K4oBrGHEUwz7jRhSPyRNCk36Tt6YzH4IvwZOsEIRzApugiGeUPSaQ0ppfPuZoHvT/4UFU/NP+aDoU4mw4mRr6iHwOfwy9rqF5ydmKps2F4UuIQqa0pvBJq3Gr8HGeDmObZzgzjbYr436H3H8c5vDjetE9SXbaKP56rutZTF1Rtjr3VS/VtSTHYVDGP1xkAtElwhDDGyJXCvcZrr47FTs1QwUoi6/oFTvSP3J0jUb6x+A8E7etUA+3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/wn3dXu4SX30oHC8l7SICYI+WWOaGiluZTY43P2S0g=;
 b=l4OjUjDoa6IBZkq2W6Rzp+TnIPPsY5ybd4MIBUBGoqPnWi67BDqVXHbjZXJdPP83yVBb9jms/m1j/Y9SCZUe0hbzCL14fTlmeStuumxCLinohf2oq7mmy3BgOoZkI74jMT+E+xI8TP+s+4LAfUQx/xAbrFrq6gXLdCgwWKXae3YFcUBLPBclMhRlxpT9NoOfwQ2t9JDNBL1b8o7+tKM54WuAnT93ARUaL+j/k36D1TNZZWrZsO1IXbdQ3OEA/tULJoUwzYyBpkiJmRVHb8p1I7YA4bz7fb6dg2sb+sR2kJbAGJ6up4T7g99tYdimagKCqA2aGvMqv9e7fT1fjUATZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/wn3dXu4SX30oHC8l7SICYI+WWOaGiluZTY43P2S0g=;
 b=TAOjFQK2Ca6UXpDlpZd6MzDImUDY28ZdV4jwzIL+pfOfiu9pDMYduF3fuN914GUVa9ho8oYRuWJdh6ynwvUMFVvTSiH445UACo/a7bkJ1l2dHT0lI18ELOas8fl7qCjvPsRSb2/V/gCrD/qvv1bHvpB+EVy0NWS/VprZ9Lt8OMw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v6 7/7] xen/arm: do not use void pointer in
 pci_host_common_probe
Thread-Topic: [PATCH v6 7/7] xen/arm: do not use void pointer in
 pci_host_common_probe
Thread-Index: AQHX0g8fEgwSC2QqkU2uFtSRWiduaqwHo+UA
Date: Wed, 17 Nov 2021 11:12:29 +0000
Message-ID: <96F5FCA2-D8EE-4DC3-8945-619887069C5E@arm.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-8-andr2000@gmail.com>
In-Reply-To: <20211105063326.939843-8-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bfb90236-7d2e-4a34-4c51-08d9a9bb2e2b
x-ms-traffictypediagnostic: AM7PR08MB5318:|AM0PR08MB5345:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB534508DD901A6C237A44EC72FC9A9@AM0PR08MB5345.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IrtEU5Qvp9Sk0cQlkrfqHjD5Nr/827K9yCBls0dBl5VhH75chvNcN4kPovBFOlDRnZ5o0N6u67elU+bAEdxNTox8RNMkxv+DtIJdmHtw2+1IuljlYmvthhAW2X2eJKC7lYh+2MbvaU1E3J701GFgX4in1KQtKOFIO9ncGsxJ25JgpNNIGfwNEW28moGux7jPXzbbBf/Jmx+CBFS/ujsOhc+LwJIy2epVlGmTF1wwl91kY/rvR0MVa+MfpXlrlRArsf+GnrbXH8YP47OjR2olHtcyFjozelLhgHXv9wUDkLaNYfUNMEanG1DtrMOx2+EIGB1ivgFcJmLe2FAzOMpMxYU0k6FxfbtX2zr7dCmVwbt3smHSvGgh9NsK5jjR1TC5sAv0QB7wr9BjQiBvDZpgd3/Xe/XP7PiecpUkao/MkhGQK7GeHz7aDIfOyovfSOWaF/Jb1O2RDYOV7DfAF+OICC7YQ+SgTIWTUz3o24FdVRj0qjXWYtqsip3GgNhbaoTYP3EW5Br657iWDH41nAhLCp2uXschh0FW8EFjl7VkN/BtqmaI3vQxMQyNo/rMuwcKezy7bOK38G3D+U2bLQNkZsgZySDLmvUE8FBNg0i74gEZxApDZJE2rCviSCXrXp/EOw8eBwNvk6XIN/Wu66XiFT1JUNXcVWUmvwHT8AENIOSPPpKVsHYFyqDFSTH7y7qXyxRiHRKwahT6JlyAodsKurOx0Wu01ErmdbizXf34/SGAJMctLOTXmibjhEdrcviv
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(8676002)(7416002)(26005)(122000001)(5660300002)(53546011)(508600001)(36756003)(33656002)(91956017)(6486002)(38070700005)(6506007)(66556008)(66446008)(64756008)(86362001)(66476007)(2906002)(2616005)(316002)(83380400001)(54906003)(6916009)(38100700002)(8936002)(71200400001)(76116006)(66946007)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA8BA0BFA9C32E41B2F544E9261301FF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5318
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57314f2b-04f4-4f2b-b495-08d9a9bb24f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9yrP/mPbS9brDEOklHbZtHb6NQ6fiUEz0RQYpEPBl2qI3BwGHw4HMXjJzBuaCS6oohTJIz6fpeD3kvSfH6Dqf9FXc2oW7X96w4VbEjFieuTqgEg8FTExPKWWsTVcUT7smq6fikU4yKXr2f6KcribbjX0TyZQUctgjdHiT3g8uQaDzXo8d7TZKX0zzacOopV+JMv8gGr/0wp3W1UEga4YGipkkK2u3jTA1cl5M+1kDtqNhyZr+9V+XuVy+ObZiEoNw5zJNHBkao7OiQ++BRkjfpS/VKTflPeLYNSyShETe7fXAIDNrIOur52guBAF0W9qb72Jtyil1LA1hHY/s+NoyKIOB+HFdJUJUQxR5i94VOtJJZkEGI6bC2RRzmqXD5fDs8zqgIa7TTF/loCKTh2gX5nsRVdCsEAGP9lUO1Sp9ZiXLZpyukKDRTu1kkZBHMDiQgDI4d/VGwBsmG6xnW2eHSa4P4+Q0CC1/cxC5sg79QrUBEYyDUe6PTDixA8xssS5XMe5QrvILLtpnQTOdoIIzjge2MZNhW4CMoliZiqvSHBdJLcIGFD2AhYPZMhpLEjdh5+RhZ0cr9GURRKHpWfRLgUw0380Ke8cPa70Q2YlBqBrfxY6Ygby2MafhgqQ61JBpg8lPjdnlyIIIlw3p1TeEixUkFH0Ldl3UderGJTKJPdzsKvk0hu7GDP5Ag/s0rN0wFtyiAkwShIL/pTblo1hECs3prUHhmNu5L4D6pW6bKE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(186003)(36756003)(6486002)(70586007)(356005)(8676002)(81166007)(33656002)(107886003)(82310400003)(5660300002)(6506007)(86362001)(336012)(8936002)(36860700001)(53546011)(63350400001)(63370400001)(83380400001)(2616005)(508600001)(6512007)(316002)(4326008)(26005)(47076005)(6862004)(54906003)(2906002)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 11:12:44.7644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb90236-7d2e-4a34-4c51-08d9a9bb2e2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5345

Hi Oleksandr,

> On 5 Nov 2021, at 6:33 am, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> There is no reason to use void pointer while passing ECAM ops to the
> pci_host_common_probe function as it is anyway casted to struct pci_ecam_=
ops
> inside. For that reason remove the void pointer and pass struct pci_ecam_=
ops
> pointer as is.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
> ---
> New in v4
> ---
> xen/arch/arm/pci/ecam.c            | 4 ++--
> xen/arch/arm/pci/pci-host-common.c | 6 ++----
> xen/include/asm-arm/pci.h          | 5 +++--
> 3 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
> index 4f71b11c3057..6aeea12a68bf 100644
> --- a/xen/arch/arm/pci/ecam.c
> +++ b/xen/arch/arm/pci/ecam.c
> @@ -24,8 +24,8 @@ void __iomem *pci_ecam_map_bus(struct pci_host_bridge *=
bridge,
>                                pci_sbdf_t sbdf, uint32_t where)
> {
>     const struct pci_config_window *cfg =3D bridge->cfg;
> -    struct pci_ecam_ops *ops =3D
> -        container_of(bridge->ops, struct pci_ecam_ops, pci_ops);
> +    const struct pci_ecam_ops *ops =3D
> +        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
>     unsigned int devfn_shift =3D ops->bus_shift - 8;
>     void __iomem *base;
>=20
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-ho=
st-common.c
> index 6af845ab9d6c..1aad664b213e 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -194,15 +194,13 @@ static int pci_bus_find_domain_nr(struct dt_device_=
node *dev)
>     return domain;
> }
>=20
> -int pci_host_common_probe(struct dt_device_node *dev, const void *data)
> +int pci_host_common_probe(struct dt_device_node *dev,
> +                          const struct pci_ecam_ops *ops)
> {
>     struct pci_host_bridge *bridge;
>     struct pci_config_window *cfg;
> -    struct pci_ecam_ops *ops;
>     int err;
>=20
> -    ops =3D (struct pci_ecam_ops *) data;
> -
>     bridge =3D pci_alloc_host_bridge();
>     if ( !bridge )
>         return -ENOMEM;
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 3d706fdd1d88..4199e0267d24 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -65,7 +65,7 @@ struct pci_host_bridge {
>     struct list_head node;           /* Node in list of host bridges */
>     uint16_t segment;                /* Segment number */
>     struct pci_config_window* cfg;   /* Pointer to the bridge config wind=
ow */
> -    struct pci_ops *ops;
> +    const struct pci_ops *ops;
> };
>=20
> struct pci_ops {
> @@ -94,7 +94,8 @@ struct pci_ecam_ops {
> /* Default ECAM ops */
> extern const struct pci_ecam_ops pci_generic_ecam_ops;
>=20
> -int pci_host_common_probe(struct dt_device_node *dev, const void *data);
> +int pci_host_common_probe(struct dt_device_node *dev,
> +                          const struct pci_ecam_ops *ops);
> int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sb=
df,
>                             uint32_t reg, uint32_t len, uint32_t *value);
> int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t s=
bdf,
> --=20
> 2.25.1
>=20
>=20


