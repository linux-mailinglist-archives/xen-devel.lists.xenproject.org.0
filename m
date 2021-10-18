Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D970C431459
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211939.369637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPck-00059D-Jv; Mon, 18 Oct 2021 10:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211939.369637; Mon, 18 Oct 2021 10:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPck-00056g-Fi; Mon, 18 Oct 2021 10:12:06 +0000
Received: by outflank-mailman (input) for mailman id 211939;
 Mon, 18 Oct 2021 10:12:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J+Bz=PG=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mcPci-00056Y-NT
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:12:04 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a57b5db-03e4-41ef-9ee0-923736e4d26d;
 Mon, 18 Oct 2021 10:12:02 +0000 (UTC)
Received: from AS9PR0301CA0040.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::26) by AM8PR08MB6562.eurprd08.prod.outlook.com
 (2603:10a6:20b:355::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 10:11:59 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::36) by AS9PR0301CA0040.outlook.office365.com
 (2603:10a6:20b:469::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Mon, 18 Oct 2021 10:11:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 10:11:59 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Mon, 18 Oct 2021 10:11:59 +0000
Received: from 78425616ff20.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8641D81B-8312-46D6-B525-9273C9EA7A63.1; 
 Mon, 18 Oct 2021 10:11:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 78425616ff20.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Oct 2021 10:11:48 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB4604.eurprd08.prod.outlook.com (2603:10a6:10:34::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Mon, 18 Oct
 2021 10:11:44 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 10:11:44 +0000
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
X-Inumbo-ID: 2a57b5db-03e4-41ef-9ee0-923736e4d26d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7LgqLdTNDEDiVDBQehlXhP6YASeoTWOaWwPp34w2Ls=;
 b=WXefGkkz31y21dJynhvEsOXJkyWzR5CSSrFEgTur4wzUv1mFPY7j4Om5QR3Sh1zT8sIPcmbQc1qAKwRAO3JGX9KPNPdWYKg/hMjgwyjj3AeX8BLZSCfO+rt6LTWyCSsw8US+iKMTZDun5u0S/9KmMngWn9eVkLTQXZ3KUGeg/xw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b49b5daeddc9e32c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAptvQcsXVIIaz4JLbk8pCvuNcqUcZ2Dp4DrsILIPn5ilKa71IWBpl2CdBX/NoPbu4aEr8Q3wQRalgn5yzLmLsFqAikgRNB/WU8spvpcoPJ36RNLhrCmzntQywhN/zA2Y1a5TXwyR56fYwyrGPdTgKD8lc4gQUBDST2MyMVwmz7mf6rYMvIT18WznKJzo9WzF7soEjxv2Ans4Vi43XdIKxe3EP1KHHn61RzcvHz1aYwh9sFAGhEf7+A38YLr2+2VcWS64eSnK7/CqDFoDhe4bYnTQPZfoe6oQ6LNQjdo9Z2qgq55X/BAy98uVQ9J6rF/6UtkTkAW2/aix83NDuShWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7LgqLdTNDEDiVDBQehlXhP6YASeoTWOaWwPp34w2Ls=;
 b=bp7k1sO+uUWs06hfIuoSIQmg1+E/Gou1HrDL0POiAPMky+0hYov2JVBo3MmwZIny46WBu6YiHUVjRRZqILwu/r8ujpu03hyXYzjjfL+FG0ZtDjXmxpf7HoqtVVTG9hp+XJTfhblVKCS7/wEhriXOAJRxCADYX7P6lXkeN3F28M/QGvvDdnXju339x+mLRXBbFyLWquBEcJKluMMg4kcxah1CZP+thtteMcVBu0MjlEmLo0iknGt5kWMQs3+N0rYTg6mTRVkuYGZ0Za8lacoG6sUFVPIDncGMcAwdYDyHQzcvDZmqJn20aXU8gN4oqxFIrlWwyHywh4PNDnu2kWaXfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7LgqLdTNDEDiVDBQehlXhP6YASeoTWOaWwPp34w2Ls=;
 b=WXefGkkz31y21dJynhvEsOXJkyWzR5CSSrFEgTur4wzUv1mFPY7j4Om5QR3Sh1zT8sIPcmbQc1qAKwRAO3JGX9KPNPdWYKg/hMjgwyjj3AeX8BLZSCfO+rt6LTWyCSsw8US+iKMTZDun5u0S/9KmMngWn9eVkLTQXZ3KUGeg/xw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXweULx+Lzp09rU0elFmx0jxVt5qvYZOcAgAAoaQA=
Date: Mon, 18 Oct 2021 10:11:44 +0000
Message-ID: <FBC4FA6D-AF07-437A-BD81-52708B139070@arm.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
In-Reply-To: <ca5558b2-25c6-90d2-284b-03cbbb02691f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d9ddf5d6-9988-4960-ef2b-08d9921fb932
x-ms-traffictypediagnostic: DB7PR08MB4604:|AM8PR08MB6562:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB65622918F2E2484E3C6CDBBB9DBC9@AM8PR08MB6562.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /Y0zFDS/K6cTyN6LnQeIxqRecqwC/hFVMxt3uxu3hyBjqvzQ7jyo1XMjJd5RcP5/+DtH4J0DXDKKO7LsijWqUTIIAWadUVksNZmngiHjlVyLDAa56sGcxPhPG3AFcf1SF84iTPKQ6aM2CesoEqzyH9g/nvWAi3vgHPDmCCzfUbtATH5UvvAhRV6iiXdP92tVjbwj+qWrxAr03hbcVEfIgacSXdeCPREOgXV3bfe3xKel8PQHS8QXq3l3v63P4xvBBVvki4iSxUe+xfgJ6THevv86MBQKXKvwSYVjLkbTSedinM9exd0AWpMu7PXZrEoWObFPKoFtZR6lSLng9UaXJdHu4cSAE0IlbhWxlnSrAzbJLZCqE9U2ZtkBaGEqlFjFG/zSgp8RVk9+KpjvyKRH2psMsqQrb9DWo2CSKwjceBJhO9xBNehAWBX4A1GZOUmI/3QcfPXUzbDmTmFMy1v+GPJNBoozxBdr5CJihlNczJMR2mheIYOvYSi49stbw5dg7P85SC9vNyWiWojOTwDnoilbILoM32Q02fUFJKQyaFgey8p3EsooYqKP7I5cx2hrKhy6S+3B9ty2r7gdq+0XAh3d6MZpzzCdVe7N/740ePBqbavQhwqgJfvgQYiqCD+JtjBF/TPBEUlyW0qvoEKkNxtxTnQdjys8s+n08mjVn12ktatmV1LCTWa6nI5T0aZ24MMBTI11ocTEAnDz6rZPEJQIlwDgCpZGyxQQ0m+XkP9k6wKYcbsAzyeAx3hguRQ+Bb7MtEsn9qTyRURttbUkPA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(38100700002)(122000001)(316002)(4326008)(6506007)(38070700005)(66946007)(66476007)(6916009)(53546011)(7416002)(26005)(83380400001)(36756003)(2906002)(64756008)(76116006)(91956017)(186003)(508600001)(5660300002)(8676002)(2616005)(66556008)(66446008)(71200400001)(6486002)(6512007)(86362001)(54906003)(8936002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E72AE75A5CE81147AF279F12B82DE16B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4604
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eb21536e-d583-42ed-88a8-08d9921fb030
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iucLUbjV4Wx5IkWR50fDFccnJmfSmDv9aqTItWLUAvz9eAMMb74zPROlzNZekTbAFSVPxvz+mu8R6QvExpbkRA+v8EWfXyn3B7zHLZLzXfC0HenIcxfSrdTo2cKxoaXzsHHSeVMCv+ybf1LDvnNRV/Gti1hAdByNL84/AQbB+XQhoawVCP/BOcIc5+VyOgZX28r2tvktsruOVXRbbi8zpLa/bJEZFO1UdyEu01Wb0opUbwULvtCDTvWyBcOxFAhhOzQ0mP7BTeND8lMwgvRbES4+FkSVpk0hX9tF+YnaM69bQnE35JmdQ+vYww3Ofcy5NYC9gp3JvuNpJNbkDhmNvghcdwcAnZW7a54JYZEPMfInNYJNTqMkF5b+wBapScg06QcU7NpQt6JjvtlEAOrt3pyIQxQTv0H2CySFwR9s/1RQllY6ej5huT7KbcI7zAO5/CdyaNEJNE6SligvSOmj3VBhHO5XgwF7QYsnKkUTyB+u/c2U3I+HQ1uvwKIyJ0iHNTOkMRsXsxIpSRiIdKZ8dR9FPDzkrf7Qak4ZP0C4iK9sLTB8ey0BX0wiyrb9mpa3YDvGTV3r3OmulxJ3Pz086RllyJYQqAVOCEHZgwnKmrGeLR9AHDUgz7eqFgqiwK69AfV6eBexv9ucNVWzIfjLyv6orENezacmJjM+0MmnCgbM/3G4eipZuWcUKyunPOBxo800nUlYIZRQ8WFoLFcZxiu+ycy+XzeyVyR+1drxYjQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(6512007)(82310400003)(5660300002)(6486002)(2906002)(36756003)(356005)(26005)(81166007)(53546011)(186003)(6506007)(70206006)(83380400001)(36860700001)(8676002)(6862004)(508600001)(316002)(86362001)(47076005)(336012)(2616005)(33656002)(4326008)(70586007)(54906003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 10:11:59.7790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ddf5d6-9988-4960-ef2b-08d9921fb932
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6562

Hi Jan,

> On 18 Oct 2021, at 08:47, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 15.10.2021 18:51, Bertrand Marquis wrote:
>> --- /dev/null
>> +++ b/xen/arch/arm/vpci.c
>> @@ -0,0 +1,77 @@
>> +/*
>> + * xen/arch/arm/vpci.c
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +#include <xen/sched.h>
>> +#include <xen/vpci.h>
>> +
>> +#include <asm/mmio.h>
>> +
>> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>> +                          register_t *r, void *p)
>> +{
>> +    pci_sbdf_t sbdf;
>> +    /* data is needed to prevent a pointer cast on 32bit */
>> +    unsigned long data;
>> +
>> +    /* We ignore segment part and always handle segment 0 */
>> +    sbdf.sbdf =3D VPCI_ECAM_BDF(info->gpa);
>> +
>> +    if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>> +                        1U << info->dabt.size, &data) )
>> +    {
>=20
> Here it is quite clear that the SBDF you pass into vpci_ecam_read() is
> the virtual one. The function then calls vpci_read(), which in turn
> will call vpci_read_hw() in a number of situations (first and foremost
> whenever pci_get_pdev_by_domain() returns NULL). That function as well
> as pci_get_pdev_by_domain() use the passed in SBDF as if it was a
> physical one; I'm unable to spot any translation. Yet I do recall
> seeing assignment of a virtual device and function number somewhere
> (perhaps another of the related series), so the model also doesn't
> look to assume 1:1 mapping of SBDF.

This question was answered by Oleksandr I think.

>=20
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>     if ( !pdev->domain )
>>     {
>>         pdev->domain =3D hardware_domain;
>> +#ifdef CONFIG_ARM
>> +        /*
>> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci =
handler
>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>> +         */
>> +        ret =3D vpci_add_handlers(pdev);
>> +        if ( ret )
>> +        {
>> +            printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>> +            pdev->domain =3D NULL;
>> +            goto out;
>> +        }
>> +#endif
>>         ret =3D iommu_add_device(pdev);
>>         if ( ret )
>>         {
>=20
> Upon failure, vpci_add_handlers() will itself call vpci_remove_handlers()=
.
> What about iommu_add_device() failure? The device will have ->domain
> zapped, but all vPCI handlers still in place. This aspect of insufficient
> error cleanup was pointed out already in review of v1.

Yes a call to vpci_remove_device should be made on the error path out if
iommu_add_device is failing. This should also be done in fact in=20
pci_remove_device before cleanup the msi.
We will push a patch with a proposal for a fix for this.

>=20
> Furthermore already in v1 I questioned why this would be Arm-specific: On
> x86 this code path is going to be taken for all devices Xen wasn't able
> to discover at boot (anything on segments we wouldn't consider config
> space access safe on without reassurance by Dom0 plus SR-IOV VFs, at the
> very least). Hence it is my understanding that something along these
> lines is actually also needed for PVH Dom0. I've just checked, and
> according to my mailbox that comment was actually left unresponded to.
>=20
> Roger, am I missing anything here as to PVH Dom0 getting handlers put in
> place?

From Roger answer I understood that it will be needed (in the future).=20
When and if this is needed, the ifdef CONFIG_ARM can be removed
but this would change x86 code behaviour so I do not think it would
have been right to do that in this serie.

>=20
> Of course as soon as the CONFIG_ARM conditionals were dropped, the
> __hwdom_init issue would become an "active" one.

We will push a proposal for a fix for that.
If I understand Roger right, vpci_add_handler will also be needed in runtim=
e
on x86 in the future so maybe it would even be right to remove the flag alt=
ogether ?

Regards
Bertrand

>=20
> Jan
>=20


