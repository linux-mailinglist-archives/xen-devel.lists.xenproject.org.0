Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817941BFEC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198658.352272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU1r-00060j-Ch; Wed, 29 Sep 2021 07:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198658.352272; Wed, 29 Sep 2021 07:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVU1r-0005y9-73; Wed, 29 Sep 2021 07:29:23 +0000
Received: by outflank-mailman (input) for mailman id 198658;
 Wed, 29 Sep 2021 07:29:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVU1p-0005x4-5G
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:29:21 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 902985fd-efbb-4d6a-a0a4-7b00f1dd974f;
 Wed, 29 Sep 2021 07:29:18 +0000 (UTC)
Received: from AM6P192CA0034.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::47)
 by DB8PR08MB5276.eurprd08.prod.outlook.com (2603:10a6:10:bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.21; Wed, 29 Sep
 2021 07:29:16 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::f6) by AM6P192CA0034.outlook.office365.com
 (2603:10a6:209:83::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 07:29:16 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 07:29:15 +0000
Received: ("Tessian outbound ac52c8afb262:v103");
 Wed, 29 Sep 2021 07:29:13 +0000
Received: from 01c892c53fc1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF670FE8-1CE6-4F24-9F8C-135413F8525F.1; 
 Wed, 29 Sep 2021 07:29:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01c892c53fc1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 07:29:00 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB5901.eurprd08.prod.outlook.com (2603:10a6:102:ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 07:28:55 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 07:28:55 +0000
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
X-Inumbo-ID: 902985fd-efbb-4d6a-a0a4-7b00f1dd974f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgvSnB62SJlV8IRf/y5r+hJoxiTMPzmggENzWdc/40s=;
 b=b9RooUGf+1saYThjIEJ6ciDcIRPbPfZNeh9y6mggV4OsSqENgB2r7agLqEtPfqVnzlKsJFWls9yTkLL/xSXiySWqeHVIjebr53yoCIuOXSUiMoXHVFjiig/Yhu4fDKQ51axBrXyOyNEWHfoYM32FzmyrQZAwd9Ii1Up1U1KrUh4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 018ebaf0476903df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD13/0dwn6Owem4k2joJGEC8AzuQE8/b57zU1I2vLtjkCQxFM7qwyjwbMFIwkOYGxcm3MLRU17SoZpc+p/KitV3OjIByJFBip30SeYrLrCQ6Pcbb4XDXV2EhORsPfBZAdhlBXxajGofWL7mXbQJqGA3ArzWQhCKc19eE7PV5NV0hEjX1XhlTLAkH1TxVPNZIIbwn1smDGDACvBvaGlLY2nJqv4bwhSETH3fP5rOTkuHFpQDUEazKmxlJw+g2LEFBSt6eczDt01wcEadsmbtYzLTSY6tvJn97jcb4SkMt3QkcDW0bXLuNVq8XvtoatnLKNUCyVG/aRAnrHqUkd4+Z8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JgvSnB62SJlV8IRf/y5r+hJoxiTMPzmggENzWdc/40s=;
 b=U76UOX/8Rja9aYjySukR9WKeU+7K+5aae44TRKNdPpPA66ui7TvhrHPjduehK7oZzx7cslPvBG/FqMkzB6Rib9pwceiu/I9CqzRlqLl7MTEfl0LIY+9B7s/qWUdUYfgZHyfAgczYAm1rlExq0MlC1XROLk3MouTmOhx2K3sh+vpSub0ZR/BUlx6GSm69O2m0eJUnuql55lL3IUm1YTn+CylTzDpbETK7AbNPYr0MnQHHHIpvC5e3jIo7B6uA2neWkDmg/rLo2tjEc3Ch2SdrdROZL9BPAPks4YrZA/Atlf/uh7I7PMfYvVeDIqsM7BRewjGQeYr2v0jZc7C9fg67AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgvSnB62SJlV8IRf/y5r+hJoxiTMPzmggENzWdc/40s=;
 b=b9RooUGf+1saYThjIEJ6ciDcIRPbPfZNeh9y6mggV4OsSqENgB2r7agLqEtPfqVnzlKsJFWls9yTkLL/xSXiySWqeHVIjebr53yoCIuOXSUiMoXHVFjiig/Yhu4fDKQ51axBrXyOyNEWHfoYM32FzmyrQZAwd9Ii1Up1U1KrUh4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 02/17] xen/arm: pci: Add stubs to allow selecting
 HAS_PCI
Thread-Topic: [PATCH v3 02/17] xen/arm: pci: Add stubs to allow selecting
 HAS_PCI
Thread-Index: AQHXtJV0mB13hzAW+EyNCJ6p2ZFT7au6niUA
Date: Wed, 29 Sep 2021 07:28:55 +0000
Message-ID: <D938C740-9BBD-4D01-B26F-F4112A186983@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <c752df37298c75f2f1872565d2272fc59063547f.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <c752df37298c75f2f1872565d2272fc59063547f.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: abb1e648-d5cd-4262-0806-08d9831ad790
x-ms-traffictypediagnostic: PA4PR08MB5901:|DB8PR08MB5276:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5276D2AB61A19CF30BB2EA3D9DA99@DB8PR08MB5276.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:317;OLM:317;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A98c7V5YK+3SI/2HUmqgH4IH/KmnUKBBM9REkFpLXl9jyoWit/kcpZdVScX1rRLkSQ+Aa853y5/y/m8xv6x3JBDGAaJn05oAeuuTg24qrePkFwk1ZO6Ki0N+gE1O+EwSmuAjL8TTXlwS95Jr3dfsC3+nni/UzJDZqw7n9g51AtzxT30cJPYfBpX7vlUQ09NhLbWqWWPSW/ePGqCMeaJvNkxS/6xVhLo9kZswVIdyAfzVytHhGXM6gYY3tjHtZsf4mp1E7kdbrs7xmmRdzttuZvAOJBv3gg+6cJzlm3/Y+zjY4qO9/v9UhHs2JvlUHXn9DMY7RoYbqZzi0E8PMOR9J1FsEHxOkmr/FRoAy6crVCrQBB2rZhR14xz78K1g+gMPX1fXICXNAforLKIXcUlLL1LuSkmUIw431OB8+GOVKlHbS2uj3UOpJ8LUiFfHzQELu3HKhKeA6LdJygCro5zGnd3CeMIrgaY9t2UH0chgluEGUizyEzm882T1MVRLwW8kkJI7svugKoq7gO71IhLOZv01rH/zTjZDU933wU3bIeEW3ahrvdSSi5NBe4jKTboVxBGdW91/PaUkGjlfHb2dC6ljB4MDkpTP91VA64m6Negx/H9bto85I6P2GGGgzd++OK+yHaKfPB3oum2hW04WNGg3VtZA4jsVXv3BqCN+NqNkfBuJHzCd3JaOwX7/tDKxvEKtu0f8biTN5QNlxMJodeSRQtBcsJqQkJy2+66SzvSJ5zZVuRhQRRTtbaElWLiD2EB+4tYrSUaT7IdHg9hZ3qctS6dRxO0ni+UVVyy0DEo5GSnlSCs8Sz3sCTpL/flOKfEGbkKi4Eyuxe3H2YIh5WB7nDrOGd9cYqnqItdVlW0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8936002)(6862004)(8676002)(64756008)(36756003)(186003)(122000001)(38070700005)(71200400001)(66556008)(66446008)(66946007)(33656002)(91956017)(76116006)(2616005)(66476007)(83380400001)(38100700002)(86362001)(6486002)(37006003)(6636002)(26005)(6506007)(53546011)(54906003)(2906002)(316002)(508600001)(6512007)(5660300002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <928CF9AA34A5114383BF295891501434@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5901
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04b3c901-69f9-4296-cb4a-08d9831acb5f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cI7YXuSpvFt1Ed6Pz9YHp1qqnHrRdIGHFbtsRkA1YbQL82IRxfdthouFESFuY7W/i2d6sYLf3LHDM/OIC9tO3WAszyeU0eyhHWgVDX4vc5k141DzxzmFAIRTOD76TQSF7dJPoNvI+cFK3KrVkHReSQU36+4HeyITk7x3TwuXSp7yTw3HjmSzKwm0gBy0BaWEK88VakWJyBIOAXSTAP9heZ+BaL/SiWEUMsPfJGxDq3ICfpbQkmIauLfjEslnd2RAZ7z8OjJbYc3/25/3h+L/Y79Aao6PKmdyiHDyU8FdxGwazqXZtc1JYqnozmMrOoijGwqRcUJTzd8HWZmoSTPhC9g6KXkY7LNiHRhxP1bPic6RzU8oh/v7ma/U9E53VAbNnBNnEXTIH5vESYPlUZ/ngGPMjTTKijbKHc7QmAuxJxBl+jJdWmepWJzhC4kWoreGIKwrKnC8WQYgb17bw4NxPTK86tJevv8kFGH9wvYvxGchuH0PhV4yFpOamv7gIpYjXX+79C2MdEBC7gxeShgshzT+BprUKp8vCHeqhEhHj6bb5ayl6gRh51NkBowoBcjYJV2IYVxBuXHrd6fOjWZL5Of9PFZldJlB5FNNHLqEVuqqLSfRdLu0JlwMH3CBU9uqypO46TLQE8tZt6uGh3owJGdgXR+vaNhRwlHa8pzU8LRqCbL1uxDF0eRiVCyQR2VdHVT9W9SUntANhm7RKgDrs5Bj4mwbwgIFVkKj51YpHu7I2Irk6gnLHTNb/g0TLzYsxFHHs+OggvbUJZFCXRSHJuQijeUB32pQa6JAB+ZOPqJ0hWvJpZxGXdLCB+D+ROAl
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(4326008)(53546011)(6506007)(36860700001)(47076005)(6862004)(6636002)(5660300002)(8936002)(186003)(70206006)(70586007)(356005)(81166007)(8676002)(83380400001)(33656002)(2616005)(336012)(107886003)(36756003)(508600001)(6512007)(82310400003)(54906003)(86362001)(6486002)(2906002)(316002)(37006003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 07:29:15.7515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb1e648-d5cd-4262-0806-08d9831ad790
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5276

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> In a follow-up we will enable PCI support in Xen on Arm (i.e select
> HAS_PCI).
>=20
> The generic code expects the arch to implement a few functions:
> arch_iommu_use_permitted()
> arch_pci_clean_pirqs()
>=20
> Note that this is not yet sufficient to enable HAS_PCI and will be
> addressed in follow-ups.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - Modify commit message.
> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Change in v2:
> - Remove pci_conf_read*(..) dummy implementation
> - Add in code comment for arch_pci_clean_pirqs() and arch_iommu_use_permi=
tted()
> - Fixed minor comments.
> ---
> xen/arch/arm/Makefile               |  1 +
> xen/arch/arm/pci/Makefile           |  1 +
> xen/arch/arm/pci/pci.c              | 33 +++++++++++++++++++++++++++++
> xen/drivers/passthrough/arm/iommu.c |  9 ++++++++
> xen/include/asm-arm/pci.h           | 31 ++++++++++++++++++++++++---
> 5 files changed, 72 insertions(+), 3 deletions(-)
> create mode 100644 xen/arch/arm/pci/Makefile
> create mode 100644 xen/arch/arm/pci/pci.c
>=20
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 3d3b97b5b4..44d7cc81fa 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -2,6 +2,7 @@ obj-$(CONFIG_ARM_32) +=3D arm32/
> obj-$(CONFIG_ARM_64) +=3D arm64/
> obj-$(CONFIG_ARM_64) +=3D efi/
> obj-$(CONFIG_ACPI) +=3D acpi/
> +obj-$(CONFIG_HAS_PCI) +=3D pci/
> ifneq ($(CONFIG_NO_PLAT),y)
> obj-y +=3D platforms/
> endif
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> new file mode 100644
> index 0000000000..a98035df4c
> --- /dev/null
> +++ b/xen/arch/arm/pci/Makefile
> @@ -0,0 +1 @@
> +obj-y +=3D pci.o
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> new file mode 100644
> index 0000000000..a7a7bc3213
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci.c
> @@ -0,0 +1,33 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/pci.h>
> +
> +/*
> + * PIRQ event channels are not supported on Arm, so nothing to do.
> + */
> +int arch_pci_clean_pirqs(struct domain *d)
> +{
> +    return 0;
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
> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthroug=
h/arm/iommu.c
> index db3b07a571..ee653a9c48 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -135,3 +135,12 @@ void arch_iommu_domain_destroy(struct domain *d)
> void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> {
> }
> +
> +/*
> + * Unlike x86, Arm doesn't support mem-sharing, mem-paging and log-dirty=
 (yet).
> + * So there is no restriction to use the IOMMU.
> + */
> +bool arch_iommu_use_permitted(const struct domain *d)
> +{
> +    return true;
> +}
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index de13359f65..7dd9eb3dba 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -1,7 +1,32 @@
> -#ifndef __X86_PCI_H__
> -#define __X86_PCI_H__
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
>=20
> +#ifndef __ARM_PCI_H__
> +#define __ARM_PCI_H__
> +
> +#ifdef CONFIG_HAS_PCI
> +
> +#define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
> +
> +/* Arch pci dev struct */
> struct arch_pci_dev {
> +    struct device dev;
> };
>=20
> -#endif /* __X86_PCI_H__ */
> +#else   /*!CONFIG_HAS_PCI*/
> +
> +struct arch_pci_dev { };
> +
> +#endif  /*!CONFIG_HAS_PCI*/
> +#endif /* __ARM_PCI_H__ */
> --=20
> 2.17.1
>=20
>=20


