Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21599416177
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194357.346235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQ6i-0003WL-Je; Thu, 23 Sep 2021 14:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194357.346235; Thu, 23 Sep 2021 14:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQ6i-0003Ss-Fs; Thu, 23 Sep 2021 14:53:52 +0000
Received: by outflank-mailman (input) for mailman id 194357;
 Thu, 23 Sep 2021 14:53:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTQ6h-0003Sk-7r
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:53:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f7864fe-1c7e-11ec-ba4d-12813bfff9fa;
 Thu, 23 Sep 2021 14:53:49 +0000 (UTC)
Received: from DB7PR05CA0055.eurprd05.prod.outlook.com (2603:10a6:10:2e::32)
 by VI1PR0802MB2478.eurprd08.prod.outlook.com (2603:10a6:800:bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 14:53:42 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::e0) by DB7PR05CA0055.outlook.office365.com
 (2603:10a6:10:2e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 14:53:42 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 14:53:42 +0000
Received: ("Tessian outbound 173d710607ad:v103");
 Thu, 23 Sep 2021 14:53:41 +0000
Received: from 35598c80bba4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B25BBD46-064C-4A2A-99CD-181970BD9539.1; 
 Thu, 23 Sep 2021 14:53:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35598c80bba4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 14:53:30 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0802MB2385.eurprd08.prod.outlook.com (2603:10a6:203:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 14:53:28 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 14:53:28 +0000
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
X-Inumbo-ID: 0f7864fe-1c7e-11ec-ba4d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElhrFnB5ab2oZRXsVLBHtVJqO97uKi/ogzrBE4TU2+w=;
 b=rglkXaBGN/RukX8Yg7rZRaKWILbKTAaMIstx6ZH3nc2gh0w5Aj0rOmXg9bFvaf4ZXCdVuTM4+wxtT9VvnxTUUWqzvg8PSJyUexbtsRjwAdxTV/CRNulwez61060Qhif/0P7OUa+PN+bNYdDCE2IOkqiL72vWbL9oQ8j7PDxON+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7da530717aa57a53
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZg3Q4o6eshRLEp1G5yI8Yf5v9vOsRSKHNX7NbJgH93A1RreL8HTWgvxwlzVVVyBvOAxECwib45tO6BvBy8MX3dwTrj4I3++gpJNMHf1S8+gjRrJJGSX63uiPHvRyMA9PtAQx6Y+kbvEJVlJY2WosQgPg91FIpYZlC2MHOl+PcuVbqMlbBA9eH/ckn5oF33MpQGYUKFSobpNURyyihHc3BINmFCgMn1IsD+wvNeLUMQVYV12ODd+cRjkphzN5v7dJ+NS4C8Bpt5Kv2OlAFB8FDd7xmCbWF5fF3blahNmMN+DiGPxXeUcd+dY+KnUfJ0s2kFpFsFgRaN+EqE/QbP6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ElhrFnB5ab2oZRXsVLBHtVJqO97uKi/ogzrBE4TU2+w=;
 b=O0b89N6PrZnwjIartnjIGXbRZsIVQoP95iqfGIedjwggMSPM6jgWf97SdySqIvKFDMkNsTQezp5hW7Bt5P+kiGCiyWaVE5Sues39IOlOjoUZwxGMsrsPcZTeFuFUHbiIGVcxrWggb0T9j9hZ5x5rtnWh7x/Z5MsDHxUZP5U3g3fmO2+MR1SoCJkTFBLMrwfSx+waa4qtOK04s54l8KpL5YuCR1pKZxFr2J2YzxAZGDQLgf2LhUBBJRAAevlpBaPtUUrgoabVpNBhwLAxAdHe/ZQI8/6bz0TFE4EPkGRoFczvmqYv5zBddPSljzmRZbNtwEtDg4uwUdZQQzDsHglqKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElhrFnB5ab2oZRXsVLBHtVJqO97uKi/ogzrBE4TU2+w=;
 b=rglkXaBGN/RukX8Yg7rZRaKWILbKTAaMIstx6ZH3nc2gh0w5Aj0rOmXg9bFvaf4ZXCdVuTM4+wxtT9VvnxTUUWqzvg8PSJyUexbtsRjwAdxTV/CRNulwez61060Qhif/0P7OUa+PN+bNYdDCE2IOkqiL72vWbL9oQ8j7PDxON+M=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 09/17] xen/arm: Add support for PCI init to initialize
 the PCI driver.
Thread-Topic: [PATCH v2 09/17] xen/arm: Add support for PCI init to initialize
 the PCI driver.
Thread-Index: AQHXr6Z0kesRmMgn3UWCiz/08WLEoauwvZ2AgAD4nYA=
Date: Thu, 23 Sep 2021 14:53:28 +0000
Message-ID: <7A85434E-D15E-4DBE-8FE4-403F1E9228F2@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <000832623dc7fb429db4b4517583f16affdba35b.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221657080.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221657080.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ca394ab5-2181-4226-5409-08d97ea1ef7f
x-ms-traffictypediagnostic: AM5PR0802MB2385:|VI1PR0802MB2478:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2478AF4E0A9E5E508DE5C99FFCA39@VI1PR0802MB2478.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IRl3HUayaqf86YyQrZfUcFbTM17CkLzqpHU1celpBKn32bJb2s0eOq6kGqnhcuxb34hR4iZb0hh5X1Med8wzk9aXtedqq3gfr+38bEWYFJXDB5KYUOHjpEhBhGcbAQsqqy82TxdNy3IPcLP+4oTD/q4wILQ5/m22vZZ8xO0UquwtJjSZGAwxFCVKw1hOYAhLc8OHbfoM3PC1zsUCy8CpkucENYqhWW3eXk7yWUjZk8zEVZjxvcisGCd8zNtfCxLpjygYhEVT2D8DmrUv1DXZ+GazzFBI7YHJz4FVFHRwxe45uNaCxT9B2LTzV2FlD9AakR4Lpwa9jyr3QIcVkg9sdgl1kpcYfACZ/d/AvV3JzCWjZEBOGmNZHzU8k4SGp0GtMFcS7X52onLUM42ym7LHx+pkz7iriZ8x7JhaIrAV0rJ/3FLxc0g3+jNyPlPOlqbyCYkSTHBm0jCKbpYeJb4EwIobvQDu9N3dK05TWt6zNt8j4IqyttDHske4bez4JxV4Buuyn4Kk+5vqa0IiSStqwrTBxkG4UFKllToz8dZ6CZ5x82G2yYz93pPdJ1Fb+tccteJdSU3ZKW+GZXk2aiVt3Qeub8jhgfV4UW6uLEvRIHeb4EV+i449hg5OZUnr0Qp6hqUgBK9sPvC4LzhyP2gpTp6Rs0b7ok/cZcyQsq2m76m9YUhGrw38IXjMTzHXEpPS1/xT2kscuWy50MGJbZK2REhzWOkKX36yuzZyqnwrAJAgZXJvf2Nrv5KhOjT23Kis3IufdUj/H5h3WAiFqJto61yAW+9YsVepLSpHIF27ogJZG9BuDKLKbeBetlkf18ZnO8F6QqSeufdAsUKXICcFKQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6512007)(83380400001)(38070700005)(86362001)(91956017)(6486002)(8936002)(122000001)(64756008)(38100700002)(5660300002)(2906002)(186003)(8676002)(6506007)(71200400001)(316002)(33656002)(76116006)(53546011)(66476007)(36756003)(2616005)(66446008)(6916009)(54906003)(66946007)(26005)(4326008)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <466D6902CD2425468EFE7624F66E4FAA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2385
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb032813-d932-48bc-6cd9-08d97ea1e70e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JEDcKUPGvQ7Pgj+pozya6E1YOWqKpM84mDRlF5PGn3sosnTmwUyI42GKxCaZnlRW/c6rC95Dmc80d0Vw3m+f4kErTec1Z203l3pdi275XfHhQ887arc7FTrFpnp69sPpyYvoC3O3ymFJL9mqlwObHQjcgu/j/s+u045ErW8j8D+sBj6z/CHQJjbzSLFDpVviv56PQ+3iKL3x6JjibFQn4SpqP1L6/cmn6zhD+fnYmUeNaOwZkHnmVyF5pWMDkGBjyhlTNGv1xr5/Vxv/AJGamaHwubo2AmO2VO6b9FtdYz/5CcPt18flewcHxyvPMDlIvdWlCs67FIiNZdPAcH/UhHDF2T9Vovif3okUtNt+1BPv6pDJUTMGSeJcXHh7Lg6t9QmJ5frLFndRKaugMgMZ8FPm2yiOsh5i/nlTSUe4qXjkewrn66rTYRdnlgeYo2XV7FT4OB+rdiEfxCpYOfmvHFsyxIyOx3dlWasQe9W2/YOGay4BXwUE/KXj/5/n3jJZvtI5LXCjXN5pmpwMZr3t7aTFngZg6K6ZfxExUv+Gzppx1GMSkJCduwLAv/Y+lqAP7v7o9VjjiEoYMx60h13nh0Z0U7jMglQlU7h+USSIS8zcBpptt7eq4Q458ZqBiJxg0aCDrQxWj7VXxWiInwj42WfUszBbmwcMGUbxrOyQLwad5rNhwP9/CCfbw4f9ymLc0Il6Wo9S5pAR0H8Uxaw6Hx5+WTbBa87GEsbqmAoJwuHQICJzkvQqi3h+oZgufZdgZQPUbxPWKrun+J8fcNb0safHF/BzUug1Cn0VgtKgmVM=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(8676002)(70586007)(70206006)(82310400003)(8936002)(83380400001)(336012)(4326008)(2616005)(2906002)(6486002)(33656002)(36860700001)(186003)(6512007)(53546011)(6506007)(356005)(47076005)(54906003)(5660300002)(36756003)(107886003)(316002)(6862004)(81166007)(508600001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:53:42.2509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca394ab5-2181-4226-5409-08d97ea1ef7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2478

Hi Stefano,

> On 23 Sep 2021, at 1:03 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> pci_init(..) will be called during xen startup to initialize and probe
>> the PCI host-bridge driver.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v2:
>> - ACPI init function to return int
>> - pci_segments_init() called before dt/acpi init
>> ---
>> xen/arch/arm/pci/pci.c       | 54 ++++++++++++++++++++++++++++++++++++
>> xen/include/asm-arm/device.h |  1 +
>> 2 files changed, 55 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
>> index a7a7bc3213..71fa532842 100644
>> --- a/xen/arch/arm/pci/pci.c
>> +++ b/xen/arch/arm/pci/pci.c
>> @@ -12,6 +12,10 @@
>>  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>  */
>>=20
>> +#include <xen/acpi.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> #include <xen/pci.h>
>>=20
>> /*
>> @@ -22,6 +26,56 @@ int arch_pci_clean_pirqs(struct domain *d)
>>     return 0;
>> }
>>=20
>> +static int __init dt_pci_init(void)
>> +{
>> +    struct dt_device_node *np;
>> +    int rc;
>> +
>> +    dt_for_each_device_node(dt_host, np)
>> +    {
>> +        rc =3D device_init(np, DEVICE_PCI, NULL);
>> +        if( !rc )
>> +            continue;
>=20
> This is a NIT, so feel free to code it as you prefer, but I would write
> it as follows for simplicity:
>=20
>=20
> /* comment about EBADF and ENODEV */
> if ( !rc || rc =3D=3D -EBADF || rc =3D=3D -ENODEV )
>    continue;
> return rc;

Ack.=20
>=20
>=20
>> +        /*
>> +         * Ignore the following error codes:
>> +         *   - EBADF: Indicate the current is not an pci
>                                             ^ device ^a   ^ device

Ac.
>=20
>=20
>> +         *   - ENODEV: The pci device is not present or cannot be used =
by
>> +         *     Xen.
>> +         */
>> +        else if ( rc !=3D -EBADF && rc !=3D -ENODEV )
>> +        {
>> +            printk(XENLOG_ERR "No driver found in XEN or driver init er=
ror.\n");
>> +            return rc;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +#ifdef CONFIG_ACPI
>> +static int __init acpi_pci_init(void)
>> +{
>> +    printk(XENLOG_ERR "ACPI pci init not supported \n");
>> +    return 0;
>=20
> Should return ENOSYS or EOPNOTSUPP?

I think EOPNOTSUPP is right choice.

Regards,
Rahul

>=20
>=20
>> +}
>> +#else
>> +static inline int __init acpi_pci_init(void)
>=20
> Not sure I would inline it but OK either way
>=20
>=20
>> +{
>> +    return -EINVAL;
>> +}
>> +#endif
>> +
>> +static int __init pci_init(void)
>> +{
>> +    pci_segments_init();
>> +
>> +    if ( acpi_disabled )
>> +        return dt_pci_init();
>> +    else
>> +        return acpi_pci_init();
>> +}
>> +__initcall(pci_init);
>> +
>> /*
>>  * Local variables:
>>  * mode: C
>> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
>> index ee7cff2d44..5ecd5e7bd1 100644
>> --- a/xen/include/asm-arm/device.h
>> +++ b/xen/include/asm-arm/device.h
>> @@ -34,6 +34,7 @@ enum device_class
>>     DEVICE_SERIAL,
>>     DEVICE_IOMMU,
>>     DEVICE_GIC,
>> +    DEVICE_PCI,
>>     /* Use for error */
>>     DEVICE_UNKNOWN,
>> };
>> --=20
>> 2.17.1


