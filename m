Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD241BFEB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198647.352249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU1K-0004uQ-Id; Wed, 29 Sep 2021 07:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198647.352249; Wed, 29 Sep 2021 07:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU1K-0004rg-Eb; Wed, 29 Sep 2021 07:28:50 +0000
Received: by outflank-mailman (input) for mailman id 198647;
 Wed, 29 Sep 2021 07:28:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU1J-0004rA-BO
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:28:49 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e249a754-20f6-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 07:28:47 +0000 (UTC)
Received: from DB8PR09CA0029.eurprd09.prod.outlook.com (2603:10a6:10:a0::42)
 by DB7PR08MB3658.eurprd08.prod.outlook.com (2603:10a6:10:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 07:28:45 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::bf) by DB8PR09CA0029.outlook.office365.com
 (2603:10a6:10:a0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 07:28:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:28:45 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Wed, 29 Sep 2021 07:28:42 +0000
Received: from 4de97b46f34d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 492B0BBB-9F73-4B2D-B8BB-146672599C75.1; 
 Wed, 29 Sep 2021 07:28:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4de97b46f34d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:28:33 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5690.eurprd08.prod.outlook.com (2603:10a6:102:86::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 07:28:30 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:28:29 +0000
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
X-Inumbo-ID: e249a754-20f6-11ec-bcdf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGDZGitNYmmrPj9EmZb9g5FOxAHzyr9GPT7FF64YxAY=;
 b=0nuJSE0SzaWfz2og2qLWmC6yEhtE7SBYbgmHV+6x3lnRmIEFj8j2yCOV9eVNH9B6Q1PDYME1EiPvQHL5HRhiSQRRz89xrKNNxx1++jlfIekJUyfnc8z5Q8gj6Or9HKbSoTqxHfK/tswqkUUw0iyFwClCQFKf0JNVo5u9W8V843Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06e75e1dc0a7fb0b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzEQuje99Iw7gYf0ZT6sRlFErcEBCZo+TMUSONe5G5VVJXWZSbVebJ5fZo73XG3uOqqHFUtNJAjJ9idsXVAPqYzfHG9mROjDoOFq0+Zw2NYLttm9WSkAzI3T17Ya6xPVD0b7munMFcRzplK2fx1niD0+EeJCJ6dMaU/yV5LNh9yZqf92jCWPVhmqalheBP5gZFjB8VtDYuhVXvMuWjbxWo5RImeSCgBiRvt8FgQR+yZpJsSeKfytHxNxPxYqghjElJ7XBWZMOaBmJxE+nqRZQUZZ1C0XIZbPxVbav3CBdv/wsdmPMmdHDjwy8kj0HMWnTHVQaesjvC2mvqfvhmEdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NGDZGitNYmmrPj9EmZb9g5FOxAHzyr9GPT7FF64YxAY=;
 b=DqOGrK+oducbvaw2Hmb6fDdNdTqi3Et9Px9LoUSCHUQ1+T91FgvtuP3JZboey+EugPuNfcGRZVo6QJTam3HxGYiF0qSSeY1pMp3cCycA2ZanJolJskN+4wTDfZb181QlI2WenNRjc+4+VFXqPeFNsEtGU2KWyo0u8QkDot+6Ooqh8VIX2W6KihKyHtwENwJFtZ9VonrTh5gPCZIJvJ4RHnLOALLvb1zL3r6fB3xdUE8CfZpNLAouBIvcoKW0F7cYQT01BxHQe9+Lzt3cp3Xhfrp25g8aj5YAYdXmugK6v5kueU6oisPObAbOYKEJgh/kLLcmYbGbbpfG1zdQdEeKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGDZGitNYmmrPj9EmZb9g5FOxAHzyr9GPT7FF64YxAY=;
 b=0nuJSE0SzaWfz2og2qLWmC6yEhtE7SBYbgmHV+6x3lnRmIEFj8j2yCOV9eVNH9B6Q1PDYME1EiPvQHL5HRhiSQRRz89xrKNNxx1++jlfIekJUyfnc8z5Q8gj6Or9HKbSoTqxHfK/tswqkUUw0iyFwClCQFKf0JNVo5u9W8V843Q=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 01/17] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Topic: [PATCH v3 01/17] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Index: AQHXtJVlTSED9jePKUmBgpHXuYbHAKu6ngYA
Date: Wed, 29 Sep 2021 07:28:28 +0000
Message-ID: <10818773-E678-4704-8AA0-6953004FB62B@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <db3af270e884838cbde7c29c366740bb3f628725.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <db3af270e884838cbde7c29c366740bb3f628725.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cce10795-2a4a-45ff-52ff-08d9831ac59f
x-ms-traffictypediagnostic: PR3PR08MB5690:|DB7PR08MB3658:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3658D76B1A89A287355C9E129DA99@DB7PR08MB3658.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X8/jkeFHEM+aOq3MQX3SnxlgzHUrGY3VE2HvZPykJsrcxUXewCcwbBlwV6AGOn0yduEvRDVzslnpJHvv9oUYnr6pJukTN0AD86apapJxX3bFRiC3BSVHG3bR8IBA2vHqYHoq63jk+a8sM6w7ubh98LUDnQqY2obEHLeQeFBWf621A9McjptL+iVqkMbK4Mrx4aXp/OYAlNDcFnhR4bS905/LjZGmcgUpQ5XU8qqDcyE+eVnOdc8iYigwMpdnMzhm7VVB9Xxe4RW1K68d6NDQhI9fEyt9l9yB/L7U+oZwnsB6+fQuC82qnaJCCamHV/0YNzrbuU59PctP9kRejYOOmEvNoM7c31UH5LsH0eOXVEr0r4cuJUsfwWcQyP9J8MQQT/BBOA2RWEZ06WUcdQBWIuDhzXYdU6HpP7PRnzs+UDAOPlVKvvmltRagCg0xpMYQUHldNgxtYsXR0Hf6VBmoio66+GiF1C14v+ZWf+LKb933sAB1muvK84wP4JLWkjZzNZs/NZuhqBdHy5N6Zo15uokbcsCCD3WG3O2i/0vSHXS0W+B0BgzVRE4GarcERqd5V+XKLI8B4MNeIyb4lBdgCV6Ss2hj0Zh9ks7IAUN+o0IssTqSshsEm7UtZbAZZWiOlTv+mbc9W+QrEgOi767+A8muG+G2wTPGQbvidrix3uYpUVJ3CMwJE6kkc1OpxOcAb4BhpYKTHDVwNRCfn1ijU4zbqreZMFX1IrjS/uz4N3OX71vDejjcgrRF+UAreT0g
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(91956017)(86362001)(33656002)(26005)(66446008)(64756008)(66556008)(66476007)(66946007)(37006003)(5660300002)(6636002)(508600001)(316002)(71200400001)(4326008)(54906003)(6486002)(186003)(8676002)(6862004)(38070700005)(122000001)(7416002)(8936002)(2906002)(83380400001)(2616005)(6512007)(38100700002)(53546011)(6506007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F0C152C72C25B8418CC199D13569CB70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5690
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c22141a-5e18-4977-daa2-08d9831abbf6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3eQYQXYyhDzyBOl1Tq0wKGmfIlOJsu3eZWhj4jChho3h6c5hu2uKnvf3XMWty8grleuPVXaso84b4kim5UnPRAGoyukNY4pBQurMakmz9+xmexOotmb5qFo+zxMFWJUFANL4FkhRE+l3uzky1ItU+SL3oAKD4ewSqFjsRWu+MwHcrrSSn3uXq5lvZybPkn7bbu2NFnIQJTNk3CzJLcnESPyFhNRnusZhzXaFihH6QktgrhaAQjhvZYVsYx9kDuMeDD+JTNpRr4SchHuuiYLGKQ4U9Y1grxk6n7+2kNSeRY1dRg3/51RH7A4YSpZR6xKIHCLtJzIGIk5Y46OOfD479IzNz8dMVjH3FuBBewWARDoQi2k24g5ZEs7XycScVkKpy9eAFAVMniIUBHI7rxBcbsMgj7L2LdhoDHNFM0rZFfW360GSB5pXV3/p+6poYtBYoAfRbTDdpnvulazla1XYNeMIs6R3XeEubvetrwm2rfsPO/zo+s7/0dKEQm0CNvzUH+9TRp124+RueCiLP7bebNwWvhBp5udgj7I4Cd8QEwsfiTEOnlxAO0HUrEYPq3HyJjqUWXC4Ox/F9/10FWFrvq4Cx6yWsKOgVnr6/YKj6p89QtEGLTlkE/LmZZNblLHzjYGj1oVdDrxeGXtX77djhNTWZkX/L5oODLefnucFfbb7qIH4S91PirSFzuzcVcRaNVX/CFvZtwrZu3MAaAFKcA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(47076005)(70206006)(53546011)(4326008)(2906002)(356005)(8936002)(70586007)(83380400001)(81166007)(86362001)(82310400003)(26005)(2616005)(6506007)(186003)(6862004)(107886003)(5660300002)(6636002)(6486002)(6512007)(508600001)(37006003)(36756003)(54906003)(36860700001)(316002)(8676002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:28:45.7477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cce10795-2a4a-45ff-52ff-08d9831ac59f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3658

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> On Arm, the initial plan is to only support GICv3 ITS which doesn't
> require us to manage the MSIs because the HW will protect against
> spoofing. Move the code under CONFIG_HAS_PCI_MSI flag to gate the code
> for ARM.
>=20
> No functional change intended.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3: none=20
> Change in v2: Fixed minor comments
> ---
> xen/arch/x86/Kconfig             |  1 +
> xen/drivers/passthrough/Makefile |  1 +
> xen/drivers/passthrough/msi.c    | 83 ++++++++++++++++++++++++++++++++
> xen/drivers/passthrough/pci.c    | 54 +++++----------------
> xen/drivers/pci/Kconfig          |  4 ++
> xen/include/xen/msi.h            | 43 +++++++++++++++++
> xen/xsm/flask/hooks.c            |  8 +--
> 7 files changed, 149 insertions(+), 45 deletions(-)
> create mode 100644 xen/drivers/passthrough/msi.c
> create mode 100644 xen/include/xen/msi.h
>=20
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 1f83518ee0..b4abfca46f 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -20,6 +20,7 @@ config X86
> 	select HAS_NS16550
> 	select HAS_PASSTHROUGH
> 	select HAS_PCI
> +	select HAS_PCI_MSI
> 	select HAS_PDX
> 	select HAS_SCHED_GRANULARITY
> 	select HAS_UBSAN
> diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/M=
akefile
> index 445690e3e5..a5efa22714 100644
> --- a/xen/drivers/passthrough/Makefile
> +++ b/xen/drivers/passthrough/Makefile
> @@ -7,3 +7,4 @@ obj-y +=3D iommu.o
> obj-$(CONFIG_HAS_PCI) +=3D pci.o
> obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device_tree.o
> obj-$(CONFIG_HAS_PCI) +=3D ats.o
> +obj-$(CONFIG_HAS_PCI_MSI) +=3D msi.o
> diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.=
c
> new file mode 100644
> index 0000000000..ce1a450f6f
> --- /dev/null
> +++ b/xen/drivers/passthrough/msi.c
> @@ -0,0 +1,83 @@
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +#include <xen/msi.h>
> +#include <asm/hvm/io.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    if ( pdev->msix )
> +    {
> +        rc =3D pci_reset_msix_state(pdev);
> +        if ( rc )
> +            return rc;
> +        msixtbl_init(d);
> +    }
> +
> +    return 0;
> +}
> +
> +int pdev_msi_init(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    INIT_LIST_HEAD(&pdev->msi_list);
> +
> +    pos =3D pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->dev=
fn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSI);
> +    if ( pos )
> +    {
> +        uint16_t ctrl =3D pci_conf_read16(pdev->sbdf, msi_control_reg(po=
s));
> +
> +        pdev->msi_maxvec =3D multi_msi_capable(ctrl);
> +    }
> +
> +    pos =3D pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->dev=
fn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSIX);
> +    if ( pos )
> +    {
> +        struct arch_msix *msix =3D xzalloc(struct arch_msix);
> +        uint16_t ctrl;
> +
> +        if ( !msix )
> +            return -ENOMEM;
> +
> +        spin_lock_init(&msix->table_lock);
> +
> +        ctrl =3D pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> +        msix->nr_entries =3D msix_table_size(ctrl);
> +
> +        pdev->msix =3D msix;
> +    }
> +
> +    return 0;
> +}
> +
> +void pdev_msi_deinit(struct pci_dev *pdev)
> +{
> +    XFREE(pdev->msix);
> +}
> +
> +void pdev_dump_msi(const struct pci_dev *pdev)
> +{
> +    const struct msi_desc *msi;
> +
> +    if ( list_empty(&pdev->msi_list) )
> +        return;
> +
> +    printk(" - MSIs < ");
> +    list_for_each_entry ( msi, &pdev->msi_list, list )
> +        printk("%d ", msi->irq);
> +    printk(">");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.=
c
> index fc4fa2e5c3..8996403161 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -32,8 +32,8 @@
> #include <xen/softirq.h>
> #include <xen/tasklet.h>
> #include <xen/vpci.h>
> +#include <xen/msi.h>
> #include <xsm/xsm.h>
> -#include <asm/msi.h>
> #include "ats.h"
>=20
> struct pci_seg {
> @@ -314,6 +314,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pse=
g, u8 bus, u8 devfn)
> {
>     struct pci_dev *pdev;
>     unsigned int pos;
> +    int rc;
>=20
>     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>         if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
> @@ -327,35 +328,12 @@ static struct pci_dev *alloc_pdev(struct pci_seg *p=
seg, u8 bus, u8 devfn)
>     *((u8*) &pdev->bus) =3D bus;
>     *((u8*) &pdev->devfn) =3D devfn;
>     pdev->domain =3D NULL;
> -    INIT_LIST_HEAD(&pdev->msi_list);
> -
> -    pos =3D pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC=
(devfn),
> -                              PCI_CAP_ID_MSI);
> -    if ( pos )
> -    {
> -        uint16_t ctrl =3D pci_conf_read16(pdev->sbdf, msi_control_reg(po=
s));
> -
> -        pdev->msi_maxvec =3D multi_msi_capable(ctrl);
> -    }
>=20
> -    pos =3D pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC=
(devfn),
> -                              PCI_CAP_ID_MSIX);
> -    if ( pos )
> +    rc =3D pdev_msi_init(pdev);
> +    if ( rc )
>     {
> -        struct arch_msix *msix =3D xzalloc(struct arch_msix);
> -        uint16_t ctrl;
> -
> -        if ( !msix )
> -        {
> -            xfree(pdev);
> -            return NULL;
> -        }
> -        spin_lock_init(&msix->table_lock);
> -
> -        ctrl =3D pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> -        msix->nr_entries =3D msix_table_size(ctrl);
> -
> -        pdev->msix =3D msix;
> +        xfree(pdev);
> +        return NULL;
>     }
>=20
>     list_add(&pdev->alldevs_list, &pseg->alldevs_list);
> @@ -449,7 +427,7 @@ static void free_pdev(struct pci_seg *pseg, struct pc=
i_dev *pdev)
>     }
>=20
>     list_del(&pdev->alldevs_list);
> -    xfree(pdev->msix);
> +    pdev_msi_deinit(pdev);
>     xfree(pdev);
> }
>=20
> @@ -1271,18 +1249,16 @@ bool_t pcie_aer_get_firmware_first(const struct p=
ci_dev *pdev)
> static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
> {
>     struct pci_dev *pdev;
> -    struct msi_desc *msi;
>=20
>     printk("=3D=3D=3D=3D segment %04x =3D=3D=3D=3D\n", pseg->nr);
>=20
>     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>     {
> -        printk("%pp - %pd - node %-3d - MSIs < ",
> +        printk("%pp - %pd - node %-3d",
>                &pdev->sbdf, pdev->domain,
>                (pdev->node !=3D NUMA_NO_NODE) ? pdev->node : -1);
> -        list_for_each_entry ( msi, &pdev->msi_list, list )
> -               printk("%d ", msi->irq);
> -        printk(">\n");
> +        pdev_dump_msi(pdev);
> +        printk("\n");
>     }
>=20
>     return 0;
> @@ -1422,13 +1398,9 @@ static int assign_device(struct domain *d, u16 seg=
, u8 bus, u8 devfn, u32 flag)
>     ASSERT(pdev && (pdev->domain =3D=3D hardware_domain ||
>                     pdev->domain =3D=3D dom_io));
>=20
> -    if ( pdev->msix )
> -    {
> -        rc =3D pci_reset_msix_state(pdev);
> -        if ( rc )
> -            goto done;
> -        msixtbl_init(d);
> -    }
> +    rc =3D pdev_msix_assign(d, pdev);
> +    if ( rc )
> +        goto done;
>=20
>     pdev->fault.count =3D 0;
>=20
> diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
> index 7da03fa13b..c6a7bc8007 100644
> --- a/xen/drivers/pci/Kconfig
> +++ b/xen/drivers/pci/Kconfig
> @@ -1,3 +1,7 @@
>=20
> config HAS_PCI
> 	bool
> +
> +config HAS_PCI_MSI
> +	bool
> +	depends on HAS_PCI
> diff --git a/xen/include/xen/msi.h b/xen/include/xen/msi.h
> new file mode 100644
> index 0000000000..c903d0050c
> --- /dev/null
> +++ b/xen/include/xen/msi.h
> @@ -0,0 +1,43 @@
> +#ifndef __XEN_MSI_H_
> +#define __XEN_MSI_H_
> +
> +#include <xen/pci.h>
> +
> +#ifdef CONFIG_HAS_PCI_MSI
> +
> +#include <asm/msi.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
> +int pdev_msi_init(struct pci_dev *pdev);
> +void pdev_msi_deinit(struct pci_dev *pdev);
> +void pdev_dump_msi(const struct pci_dev *pdev);
> +
> +#else /* !CONFIG_HAS_PCI_MSI */
> +
> +static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pde=
v)
> +{
> +    return 0;
> +}
> +
> +static inline int pdev_msi_init(struct pci_dev *pdev)
> +{
> +    return 0;
> +}
> +
> +static inline void pdev_msi_deinit(struct pci_dev *pdev) {}
> +static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
> +static inline void pdev_dump_msi(const struct pci_dev *pdev) {}
> +
> +#endif /* CONFIG_HAS_PCI_MSI */
> +
> +#endif /* __XEN_MSI_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 25e87180b4..ea9a12bd71 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -21,7 +21,7 @@
> #include <xen/guest_access.h>
> #include <xen/xenoprof.h>
> #include <xen/iommu.h>
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
> #include <asm/msi.h>
> #endif
> #include <public/xen.h>
> @@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_=
audit_data *ad)
>         }
>         return security_irq_sid(irq, sid);
>     }
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>     {
>         struct irq_desc *desc =3D irq_to_desc(irq);
>         if ( desc->msi_desc && desc->msi_desc->dev ) {
> @@ -874,7 +874,7 @@ static int flask_map_domain_pirq (struct domain *d)
> static int flask_map_domain_msi (struct domain *d, int irq, const void *d=
ata,
>                                  u32 *sid, struct avc_audit_data *ad)
> {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>     const struct msi_info *msi =3D data;
>     u32 machine_bdf =3D (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
>=20
> @@ -940,7 +940,7 @@ static int flask_unmap_domain_pirq (struct domain *d)
> static int flask_unmap_domain_msi (struct domain *d, int irq, const void =
*data,
>                                    u32 *sid, struct avc_audit_data *ad)
> {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>     const struct pci_dev *pdev =3D data;
>     u32 machine_bdf =3D (pdev->seg << 16) | (pdev->bus << 8) | pdev->devf=
n;
>=20
> --=20
> 2.17.1
>=20


