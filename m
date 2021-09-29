Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99941C5D5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:39:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199141.353018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZna-0000ui-KI; Wed, 29 Sep 2021 13:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199141.353018; Wed, 29 Sep 2021 13:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZna-0000rZ-Gx; Wed, 29 Sep 2021 13:39:02 +0000
Received: by outflank-mailman (input) for mailman id 199141;
 Wed, 29 Sep 2021 13:39:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0G+=OT=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mVZnY-0000rN-Dp
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:39:00 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 835dd1c3-6b61-440e-9754-013d0a52bd2c;
 Wed, 29 Sep 2021 13:38:58 +0000 (UTC)
Received: from AS8PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:20b:311::34)
 by AM6PR08MB3510.eurprd08.prod.outlook.com (2603:10a6:20b:48::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 13:38:52 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::7b) by AS8PR05CA0029.outlook.office365.com
 (2603:10a6:20b:311::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 13:38:52 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 13:38:51 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Wed, 29 Sep 2021 13:38:49 +0000
Received: from 3149e8527a7e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F7A06962-3672-4EF0-9B6D-A51A16166D38.1; 
 Wed, 29 Sep 2021 13:38:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3149e8527a7e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 13:38:38 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6175.eurprd08.prod.outlook.com (2603:10a6:102:eb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 13:38:37 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 29 Sep 2021
 13:38:37 +0000
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
X-Inumbo-ID: 835dd1c3-6b61-440e-9754-013d0a52bd2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO0Txn4BRsm8uZRPy1N5W+Z3LVYl95tktEvtCP7jog0=;
 b=8auhBPQ9sK4ghnaIiNz8/Std0pU4tEIs70DuZ6BUp3YZcLzd4j5s/zF0OSTAbWO4B8XoxKwCIeDclZalcS69bwrN8k5zlI0Q79iIRfy34UIJi4POUX+Zo1v3zfO008J5tVhCBGMmXFyWQBcojfDoPuVEasUQqxpJvLkPwmVlJMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2118c24ba1a05354
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbhdshO9k9fLcbN2FWP+OiTWltjCcUwM59tT7fcbD1uTRD3DC8ML0X8fIAOlIYOSw44VXl/ejqS3iXfQHGbWD0jFeUSTdWr5WA8DL0BtJGE15Dpbzh7+GCXmzCBvRcQqYT6xIAFa5dXeuUqk4bmQ8/bIAxwD4jYIvygpyDCOXRALXx3bMZrS0hfHR9oLVX8wWeK1ttSmwLVj0jQ5CCzaP4TSFgIu/qMgRSo/Tt/BS5TIac3JhX1DO/PT1ckcCrxqsjbeYlzgv20Bu759UDuPyGI6bzvkNIDpA+Mr6G+OF3BElKwR+OAM2bxHmTR2lJQzuFMz/16BzZwOV7V2ZgExeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TO0Txn4BRsm8uZRPy1N5W+Z3LVYl95tktEvtCP7jog0=;
 b=I56pBUzOXMiqov1c4j6YD/uLyKS8ZI/MlsBKsaixlBvuMNO406i4H0tynDNjqYrGghEStvMFWXF1hgfW2+8Pknld1UxQDad9XvGf6P5NhGyAJ1h6/S3g3do2WKz/0Kj1K3S2cbaX0IywzDVgTdnKpozIu0s4QOKXqOXTx7MPeb53NSBBSpanMQ92H/9fbOSNdJSdhu1jXD1XEFJAmzOaC9y6LJl5HfZbusHt6quGW2YHiNqFOCv2MKAJyDJ+QPCQhaCv68ZPCZ3ms49xR/L8y+iNTYJqwoXXC673M+JU0IARDhLj4JbEko5OQDJPRri5s67NtTxfKT7miANpxbWYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO0Txn4BRsm8uZRPy1N5W+Z3LVYl95tktEvtCP7jog0=;
 b=8auhBPQ9sK4ghnaIiNz8/Std0pU4tEIs70DuZ6BUp3YZcLzd4j5s/zF0OSTAbWO4B8XoxKwCIeDclZalcS69bwrN8k5zlI0Q79iIRfy34UIJi4POUX+Zo1v3zfO008J5tVhCBGMmXFyWQBcojfDoPuVEasUQqxpJvLkPwmVlJMg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andre Przywara
	<Andre.Przywara@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Topic: [PATCH v3 12/17] xen/arm: Add support for Xilinx ZynqMP PCI host
 controller
Thread-Index: AQHXtJXiCWYoQi1XqkmiV/9wfpLCyKu7BW8A
Date: Wed, 29 Sep 2021 13:38:37 +0000
Message-ID: <02F22926-2A4A-4301-A975-4BB2EFD5653F@arm.com>
References: <cover.1632847120.git.rahul.singh@arm.com>
 <c40a520d289799e52234fb1865e7f3ef1fd27431.1632847120.git.rahul.singh@arm.com>
In-Reply-To:
 <c40a520d289799e52234fb1865e7f3ef1fd27431.1632847120.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 93d5e7cf-388c-49b5-0c6c-08d9834e7945
x-ms-traffictypediagnostic: PA4PR08MB6175:|AM6PR08MB3510:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3510AFB893553781A3C0D1FE9DA99@AM6PR08MB3510.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jaok1tnNMo0F73AGiGOYhAlL8tSF2OllJQCgAdEaTz1aUDStsK0gYSACF5aCLvvUf7B2hTo9nXm5RvNqiXFTg8+JYGEMYyTJ0ho3DUOjY06cgyNCwT+2pG4sWW+ilpRTkfTThPt0gV6GFeLYMeje/ZxzBjLotmaQfap1NeOeO6OVjPohtRxlh/Z7SvMc58xvnv9k2sQtvMd4zodM5+tEHmuuV22hFzkOJ9cboKuqy6a0hqHlve6oKe6bmLQEfhnJP7HH+nrqzEE+ZZubBurvaGEW5d+aGXwwhLoDN5vfPu6h6+bJfUG7APnad3pr/L7qcOI3Y0zccmFteuqSgXWlDe+5+4oOTYq6KTz8JjPPwDQkQdSIm/heZ2qAvE890lFCSYJKkiQjDxVYrx9/hvONQfbT+NK5uew1lfFxaMaIahC/kzXZspQPte+svGRaHidlSYrHUzjg7vE9nIHuZyDQm9T6EiTXr8TF4BdcgMDtSMEWCztbEMcV9njB9D6wlx9xJa1XkSPro/WpZwXPSA+s2uvVJS6JHCENeFoYXYwNCCTh2ELu8whC2hlY2L4Y6WdA4qmoyTzlN3G/cRQ5+7tPGqr0HKJKYYp5QB3AFGanGRox3kCpfZuN7/+qjcFNPctmH6aiRl8goRKi1DmOZXYCCMv9KQ4rOvOTk5oNXBHamHPxKfjUQEBdk0XKlUCpPT9ouamBc0V4ePkE0AJQLpsEG10dO0hiC4x/ql7oaazlPCGGkRGapWZgL5v6hvIgH8avx5Ttks4Wn2q5QlwKIpxK7R387Hf2AYjtnO2AGZ0EIEfmfMt4WgYSvifqr9e9OQ9tLjrIP9mGC7AJS0MwVKfOxtN9jSb/3JQuAkeD3+jJTCo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(76116006)(5660300002)(66476007)(54906003)(6506007)(6862004)(91956017)(2906002)(2616005)(6486002)(122000001)(66446008)(38100700002)(66556008)(64756008)(316002)(71200400001)(6636002)(37006003)(26005)(508600001)(53546011)(186003)(8676002)(33656002)(83380400001)(8936002)(36756003)(66946007)(38070700005)(6512007)(86362001)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2900C16C4B84BC43B5A6CDB0734622E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6175
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b761d401-08f2-4307-9c32-08d9834e70c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E0fsYqN1u0cYBb9nx7hYt+tAhYFKLkTmLcbGBWk3vpQSCRnZRNl4JqvF8RFnHG5NDj9EF0tb5NG4xLsy4sQvBfBo8cW2zq1d/NJuwZMVmm2RK64fUfzflQvPZDsG4NASv1kOvYQTI9uPPR2YZXLWnAtfSgigIL37+HrOvMckKNUNfRpsEAonr3YfvHokG3qMOwhMsYf7Eo9G39Oej8A/U7RDMM3yE91zNhjnka/5fWLoaXtifq8bozokdhmC/FbNZZHuXH6IhAjBucq7eoCwPnVvx0Kpz7G2yFwand0f8kOkctKnhLOhmxHEct/Sc3pxPsSUcMsoBSpYJe9ZbU3JKz8I6oWorWvZgGWjaIACxzB2C7nkQCusKJ6nIijrCqdC/R7PeHrzLlwqGGEv7GqWdDvdY1wn0MEvDRqEA46GWt06ZM5teHfq5HVGs8RZbGc0NN7UCyWrMyHGfcn8EXkoIsRiVQiBrF1kI/m/+1PmM/7gj/xeomum+n1kjEmZo6gyja0kWON2cRnzYeWhwQGIRr6IKzXXqew+pXtHSA7aYRcpYQPJw8tYa/G1H7RNTjLck8+D4VhcoGhOI27cqSTSNN3df9tS/6m+Sl+dpmCWJPMxpwLAi/nyYpo0nyGcixn4WIKApo4TRpXZjg1OJMbZDHTjjF7WXPB7cw2kBpVpxl5yep4JSwYD3ESeYrZvK3G62+7Bt7AYJBPc5SOb/k8CKh7GK5fc3ZuW659wUoDSZLeuud19BzRcQEKJj0XULVU+NwMdps+CJcnmvmc5nA3Ye1RpDtY4K4btIk8Npyn75Km7nO+ZhOvxof/NZwDiQqxh
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(5660300002)(83380400001)(316002)(6636002)(6862004)(70586007)(70206006)(36860700001)(4326008)(36756003)(186003)(2616005)(508600001)(81166007)(356005)(8936002)(107886003)(82310400003)(33656002)(54906003)(26005)(6506007)(86362001)(47076005)(8676002)(53546011)(37006003)(2906002)(6486002)(6512007)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:38:51.4242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d5e7cf-388c-49b5-0c6c-08d9834e7945
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3510

Hi Rahul,

> On 28 Sep 2021, at 19:18, Rahul Singh <rahul.singh@arm.com> wrote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Add support for Xilinx ZynqMP PCI host controller to map the PCI config
> space to the XEN memory.
>=20
> Patch helps to understand how the generic infrastructure for PCI
> host-bridge discovery will be used for future references.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

As you are submitting this patch from Oleksandr:
- if you modified it you should add your signed-off
- if not you might as well add your reviewed-by

Anyway:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Change in v3:
> - nwl_cfg_reg_index(..) as static function
> - Add support for pci_host_generic_probe()=20
> Change in v2:
> - Add more info in commit msg
> ---
> xen/arch/arm/pci/Makefile          |  1 +
> xen/arch/arm/pci/pci-host-zynqmp.c | 63 ++++++++++++++++++++++++++++++
> 2 files changed, 64 insertions(+)
> create mode 100644 xen/arch/arm/pci/pci-host-zynqmp.c
>=20
> diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
> index 6f32fbbe67..1d045ade01 100644
> --- a/xen/arch/arm/pci/Makefile
> +++ b/xen/arch/arm/pci/Makefile
> @@ -3,3 +3,4 @@ obj-y +=3D pci-access.o
> obj-y +=3D pci-host-generic.o
> obj-y +=3D pci-host-common.o
> obj-y +=3D ecam.o
> +obj-y +=3D pci-host-zynqmp.o
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-ho=
st-zynqmp.c
> new file mode 100644
> index 0000000000..6ccbfd15c9
> --- /dev/null
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -0,0 +1,63 @@
> +/*
> + * Based on Linux drivers/pci/controller/pci-host-common.c
> + * Based on Linux drivers/pci/controller/pci-host-generic.c
> + * Based on xen/arch/arm/pci/pci-host-generic.c
> + *
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
> +#include <asm/device.h>
> +#include <xen/pci.h>
> +#include <asm/pci.h>
> +
> +static int nwl_cfg_reg_index(struct dt_device_node *np)
> +{
> +    return dt_property_match_string(np, "reg-names", "cfg");
> +}
> +
> +/* ECAM ops */
> +const struct pci_ecam_ops nwl_pcie_ops =3D {
> +    .bus_shift  =3D 20,
> +    .cfg_reg_index =3D nwl_cfg_reg_index,
> +    .pci_ops    =3D {
> +        .map_bus                =3D pci_ecam_map_bus,
> +        .read                   =3D pci_generic_config_read,
> +        .write                  =3D pci_generic_config_write,
> +    }
> +};
> +
> +static const struct dt_device_match nwl_pcie_dt_match[] =3D {
> +    { .compatible =3D "xlnx,nwl-pcie-2.11" },
> +    { },
> +};
> +
> +static int pci_host_generic_probe(struct dt_device_node *dev,
> +                                  const void *data)
> +{
> +    return pci_host_common_probe(dev, &nwl_pcie_ops);
> +}
> +
> +DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
> +.dt_match =3D nwl_pcie_dt_match,
> +.init =3D pci_host_generic_probe,
> +DT_DEVICE_END
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
> --=20
> 2.17.1
>=20
>=20


