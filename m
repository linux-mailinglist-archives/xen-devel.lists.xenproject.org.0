Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96441AF1C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 14:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197980.351253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVCIN-0004ou-Nh; Tue, 28 Sep 2021 12:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197980.351253; Tue, 28 Sep 2021 12:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVCIN-0004mx-KX; Tue, 28 Sep 2021 12:33:15 +0000
Received: by outflank-mailman (input) for mailman id 197980;
 Tue, 28 Sep 2021 12:33:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IxrP=OS=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVCIM-0004mr-Er
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 12:33:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0838a0c6-605f-4b3c-979a-9bfe50561f81;
 Tue, 28 Sep 2021 12:33:11 +0000 (UTC)
Received: from AS9PR06CA0268.eurprd06.prod.outlook.com (2603:10a6:20b:45f::19)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 12:33:09 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::91) by AS9PR06CA0268.outlook.office365.com
 (2603:10a6:20b:45f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Tue, 28 Sep 2021 12:33:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 12:33:09 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Tue, 28 Sep 2021 12:33:08 +0000
Received: from d8915662b8fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 695C1361-75E3-47B5-8277-5AFB596AE31E.1; 
 Tue, 28 Sep 2021 12:32:55 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8915662b8fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Sep 2021 12:32:55 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6528.eurprd08.prod.outlook.com (2603:10a6:102:15a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 12:32:54 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Tue, 28 Sep 2021
 12:32:54 +0000
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
X-Inumbo-ID: 0838a0c6-605f-4b3c-979a-9bfe50561f81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMe0gzp8UMKJoHftubjUl2uIKsSHCR1TAN8fJuJayb8=;
 b=7dY5aT5htLa/u4OpmTzEjLnCDkfQAMUwIBPO4z9mliiU+HZlO7OwIz6O/nvVPMo0+SrhxbPTIIJdRICs2GpIIqhMxk6yJtyAMiV5RShHOHMfvNV62o9SMHwMVhLOWfF1ccWl1W/SVnMMCBq2q4irfFQdsCthixCNyL1l2M2G1hc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c32aa90628cbd2ff
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc1KbGwYSQuS5L1/gHVcXXNgRO/wuoypKTKtK1NlxondqirTAQlJLY77FCtBP94NLaZ7ws8rWRHFJTyzBmnwerk87vYYK6avIlOsTfIzzCwaU49g1OLcSFY3LTU5+iGVG5FyL/BabEJieLHAHsuZb/w2Q7TpdlOybII+Shb+7TRIBWa50Kh0W+WyiFbNPS9lbs4Z86VySrlLMmp59wKuQocp5kbULhNNcGocXbbdNnb9GZHXzXDJA2cmpkCwFMWyeWZRYZQCSCcwaSYFsBrylZD241g66P+CVuUhBK7oVUpg5rURYAIVg/crSJtEGF3LZWPdVleybNj67KVX/FvwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kMe0gzp8UMKJoHftubjUl2uIKsSHCR1TAN8fJuJayb8=;
 b=fDWF+at0EBmfTK8i0LoX2A4o9bd3Ep0BDjB4nQ4igo4M6LY/TbBhWQizdbRE/RwfxHwiMSzC5+QjqTHRUfOpiCy5l3Sgofb6MkTWwYmHhzG6oGabYGNRzzNDoDttAwGsg1RnGutzSBmPogz8PaBV6V2/ePxyT+s8tEQJ+HGO9aIMzDa+Rdtj0BQD/puJsjLjs5gAdFWabZQnqHVwZgKGFBPp/iSrwfFjmapTiYZoNZNXDZol3+TzDv+iY9TaZiqw70kEzj9r0Uk8UgO+y6X26KsXepxcFvNEsj0eTKX60zIL+LB2WrD0oOD3+s0Fslam3CjiDHAbl2qGm96T16FoCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMe0gzp8UMKJoHftubjUl2uIKsSHCR1TAN8fJuJayb8=;
 b=7dY5aT5htLa/u4OpmTzEjLnCDkfQAMUwIBPO4z9mliiU+HZlO7OwIz6O/nvVPMo0+SrhxbPTIIJdRICs2GpIIqhMxk6yJtyAMiV5RShHOHMfvNV62o9SMHwMVhLOWfF1ccWl1W/SVnMMCBq2q4irfFQdsCthixCNyL1l2M2G1hc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "paul@xen.org" <paul@xen.org>
Subject: Re: [PATCH v2] pci: fix handling of PCI bridges with subordinate bus
 number 0xff
Thread-Topic: [PATCH v2] pci: fix handling of PCI bridges with subordinate bus
 number 0xff
Thread-Index: AQHXsSQXPb+dzbvL/kOUSxwoDVQ8/6u5Z6IA
Date: Tue, 28 Sep 2021 12:32:54 +0000
Message-ID: <9C3D662F-A902-4F6A-80FD-935D01C3786B@arm.com>
References: <1632474612-9940-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1632474612-9940-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 624dacb2-570d-4779-9241-08d9827c211d
x-ms-traffictypediagnostic: PAXPR08MB6528:|PA4PR08MB6127:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB61271519A175142DE67675E39DA89@PA4PR08MB6127.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bZzxZSh5w7wvB0+gukW8YPDqDT6xnpnYasD8rOj3u8XpDS/PBtyVFYGzONUib0VCbIkurU2AYOl8GYSqnN/JJLd6+CJI/rAmXhtwkXYnqpSghNpGXSzwDAr838yqIELevuZvKSY6bUA0vusHnCndLKI8Z9aNDBddDzrsnhWRs7eeV1ynNNH3xLCf8c+R+OIa2vDEjnFqmnLNOekrdWq3PA2dSiEAA0kb8FyHWW6e7JavQMWQ4ENStzGBmlUPxoXILQfjQJIz1FGpCRknaQQn67U3wzowNsM4AnQR89om6+gUfl2YkR9UYmZUuQ1tlDZ3BeO4NC5RrT21eAnHr+ZH+78vtRL1YQoQmi6uCrRefpSS9IvDVc1EUykMhr7Hc35xyCYplT64RZ2uuqNazeP0sfS64g7D8sIjEqyjTXmePtta0+1E5liwDsPBxNuxo7wPNAPjKn/cp6cvPwCWfNWxdBNtDLXzWnUZ7nGI/eL1DdndxGo2V9n3Ll+gklA4Jc/OPK0IQWjkj+42+JMoapsFcqjkPQ6O2WbIipGmTuKsGsSNxiZDuyYqBzTc5orNk8foUqa5oLBkaXbT4SbwBx2dJJxO6X7vCFqDvd+SWNrrCLLrjJxYMOidrern82YhJfyQHaUeUi0GYfx4EE+3ghWu1pEpvxAky8/AuOSRYtEs3gYsorT3b7R1lR8cJoChIL3bvMfOSoTLKjuHZZtuI9VEJ/JqT0dsVgayhF3jRUEmR7FhO7IdEnU/nnYZnRjilCxq
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(33656002)(66946007)(2906002)(316002)(66476007)(54906003)(508600001)(6512007)(6486002)(8936002)(8676002)(6916009)(5660300002)(53546011)(38100700002)(4326008)(86362001)(36756003)(76116006)(38070700005)(2616005)(6506007)(186003)(71200400001)(26005)(66556008)(64756008)(66446008)(91956017)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D4EA74420D02FC4BB00D8A69B7E9D991@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6528
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2327c71c-c787-48d0-b637-08d9827c1842
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UvB7/Fy3w5FkjGpBrmrh2GxQ5pr4KKOLubbFddUMc22T1DsOsgw6sRsoWzVOCzE8S5nm94yTKOb9Y2CcxU+eDPRY4h8PrkdrvFpvr7Kzei9sb+4Q/RExQk8u2bTvUWcbsHNwVMhjtT0w7C1uWqMO89PJxkhtacoROUl2elJELPN5sOuAy+uc/709Wz004Ha8XdP395MaC1ACoC3C9MKSt3xOb/ExUaJs+/UKOZ/cgsJ5/xRLA6GaMZNtCcpuXdIm6/7G0ylkVA/UPPhsmo5BFgrZ6myyK2GbOyVlpfSeBpg83EsY0wLv8YqdQLlFkG9jowAZbgkXBEKn8L9Ew9UTpK1hyLy/1V8XeBHK4Q7FxjuyhLE0a/d9M1gyb9HvSvbBkJ57i/VAqZ04IqLx+1dtQsV/Bpodk7BEv9FReRlloMfcji20Lur8qOuUc4DXitl/Ta3xBWqmw3QE9Rm7IfeyDLyJlJepSCkvUZuDyfIpb8HDyf80hcx3iD7PeUTbQGLtSvi+W0jsvvjDjKsxzkPoPoTgEbCLRuMLOcEvCm0uFe8f6kdp/pUisQdQYNJFUHlPMpOJh/CJgKBQ+akLleGdxx9xGfaPfW0+kpdiZAGf0H5Xo5lJ/paalZJoqxB4OxI8AKxak8IlHlQs5SGKjVDnDbcHsy+9FHYFSlaGf//lpbik+yjTbXAdH04SQ1HGktBj6Qzo4OVL6GyEKJRBwybO1w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(4326008)(508600001)(8676002)(26005)(6862004)(186003)(47076005)(83380400001)(336012)(81166007)(6506007)(53546011)(356005)(2906002)(70206006)(8936002)(6486002)(54906003)(36860700001)(5660300002)(2616005)(316002)(36756003)(6512007)(33656002)(70586007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 12:33:09.1708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 624dacb2-570d-4779-9241-08d9827c211d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127

Hi,

> On 24 Sep 2021, at 10:10, Igor Druzhinin <igor.druzhinin@citrix.com> wrot=
e:
>=20
> Bus number 0xff is valid according to the PCI spec. Using u8 typed sub_bu=
s
> and assigning 0xff to it will result in the following loop getting stuck.
>=20
>    for ( ; sec_bus <=3D sub_bus; sec_bus++ ) {...}
>=20
> Just change its type to unsigned int similarly to what is already done in
> dmar_scope_add_buses().
>=20
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> v2:
> - fix free_pdev() as well
> - style fixes
> ---
> xen/drivers/passthrough/pci.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.=
c
> index fc4fa2e..d65cda8 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -363,8 +363,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pse=
g, u8 bus, u8 devfn)
>     /* update bus2bridge */
>     switch ( pdev->type =3D pdev_type(pseg->nr, bus, devfn) )
>     {
> -        u16 cap;
> -        u8 sec_bus, sub_bus;
> +        unsigned int cap, sec_bus, sub_bus;
>=20
>         case DEV_TYPE_PCIe2PCI_BRIDGE:
>         case DEV_TYPE_LEGACY_PCI_BRIDGE:
> @@ -431,7 +430,7 @@ static void free_pdev(struct pci_seg *pseg, struct pc=
i_dev *pdev)
>     /* update bus2bridge */
>     switch ( pdev->type )
>     {
> -        uint8_t sec_bus, sub_bus;
> +        unsigned int sec_bus, sub_bus;
>=20
>         case DEV_TYPE_PCIe2PCI_BRIDGE:
>         case DEV_TYPE_LEGACY_PCI_BRIDGE:
> --=20
> 2.7.4
>=20
>=20


