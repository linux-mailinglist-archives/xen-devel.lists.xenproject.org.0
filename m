Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56474025BA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180656.327393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWrp-0003ny-VK; Tue, 07 Sep 2021 08:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180656.327393; Tue, 07 Sep 2021 08:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWrp-0003lE-S8; Tue, 07 Sep 2021 08:54:09 +0000
Received: by outflank-mailman (input) for mailman id 180656;
 Tue, 07 Sep 2021 08:54:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xbzw=N5=arm.com=Henry.Wang@srs-us1.protection.inumbo.net>)
 id 1mNWro-0003l8-4g
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:54:08 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 656bb1bb-3465-4a4c-a600-cf12a2c49f3a;
 Tue, 07 Sep 2021 08:54:04 +0000 (UTC)
Received: from AM6PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:20b:b2::30)
 by VI1PR08MB5533.eurprd08.prod.outlook.com (2603:10a6:803:12d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 08:54:00 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::26) by AM6PR08CA0018.outlook.office365.com
 (2603:10a6:20b:b2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 08:54:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 08:53:59 +0000
Received: ("Tessian outbound b48d04bf8afd:v105");
 Tue, 07 Sep 2021 08:53:59 +0000
Received: from 157a9ae1b450.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F7A7C14-4190-4850-BC8A-D468F262965C.1; 
 Tue, 07 Sep 2021 08:53:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 157a9ae1b450.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 08:53:53 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PA4PR08MB6063.eurprd08.prod.outlook.com (2603:10a6:102:ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 08:53:52 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::e4b3:8a19:4478:2f6e]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::e4b3:8a19:4478:2f6e%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 08:53:52 +0000
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
X-Inumbo-ID: 656bb1bb-3465-4a4c-a600-cf12a2c49f3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YL8Pk4V+1+v3exfGE2oOhB0Xp/3yEFdKkhD+1Klxtig=;
 b=zPYfCHsrM4Rs27JP3pM/HrNedV1T+IzxAwRjYZ2bTWONiz8UXclKDYg3IiR7+mKdGhVCvmL7bS4lIlYNxro0EC2tDKRz7gU2avYQ8RYURZZX4VYOGSGkibBE2nTZja4XUfoIM22ARy5hDoVuUSlNSdtICdASJTWOh3t6ENbh4jw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e84oTZfk8Zcl52z7i4r7VtQBj4cOzj1kxmwZgyG+uJVoblQHNkfOeETP7+wccaonACmwpxXl1lZVqZVtA8x7a/fKiLCfNGKFo+P8VlNwLH9MKncFMoCADEcSfSFxL53TFPGAiXKfvMLZ2LzRv7U4rIuB/Nlb5VCV3O7wnsYNwc60Mb+WijLpxhF6GtrtDVssdtjw+W1+PkjRdL9Pt+LMeZiaBxTKe3PFETDmFXrx3UE107VCcnUrZE6qf3KPmXaL3x4PJS9LR6BJbBiai0kT8FDqaESKlNzr9HWYlhZziHF60tXdobsNk+hueCmRNCReWkHeUOznCw4u+b1v+8TxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YL8Pk4V+1+v3exfGE2oOhB0Xp/3yEFdKkhD+1Klxtig=;
 b=hooCY5EuNb25T0NPUd+eF++yCaNNNYH/xqruKxWv8p+siSd9U4xX9MX2REOfg5umSltAPEmqOoRWb7BhBWfKJ9C9tgJ2Iu++dzjVcmThgyVfLBqW6Q0899LOpJayQtWdaYReXyHTRKZMs72UPe7xrqRXfEDMrGb5r+QFLFzj5YSh3SdqHeF7Z5Y3vM85zvELBjR64rkq2MwtjzAxGRMCqdL4aXvABPS5GrGX/l6OPJ0S/mlnFaEuBzkS02SvLnob/Rl39cqT/U22MNtNQ0YEHJoCtWBTuxw2ptDU1hyGtfbqP0XwgOdm0Eet5wACS2HSQ7eb0POVM58le+alLVGWew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YL8Pk4V+1+v3exfGE2oOhB0Xp/3yEFdKkhD+1Klxtig=;
 b=zPYfCHsrM4Rs27JP3pM/HrNedV1T+IzxAwRjYZ2bTWONiz8UXclKDYg3IiR7+mKdGhVCvmL7bS4lIlYNxro0EC2tDKRz7gU2avYQ8RYURZZX4VYOGSGkibBE2nTZja4XUfoIM22ARy5hDoVuUSlNSdtICdASJTWOh3t6ENbh4jw=
From: Henry Wang <Henry.Wang@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: RE: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
Thread-Topic: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
Thread-Index: AQHXg8xFOJw2l6FsN06730YVyibR0auYgwfg
Date: Tue, 7 Sep 2021 08:53:52 +0000
Message-ID:
 <PA4PR08MB6253F59F4C63FFE50CC6ADBC92D39@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C01E3F5F0E5BE947987B72EC078054FB.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 998654e2-1ebe-4345-80a6-08d971dd08d6
x-ms-traffictypediagnostic: PA4PR08MB6063:|VI1PR08MB5533:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB55331C080D8AEDA5B9A8648A92D39@VI1PR08MB5533.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HfcNRZBTiqINTCcQVCKSjPv3AncExrg0PDIFEbSqqqbWcmhk9FJGydA1HNy8vNJ5mvg0MDO+dtOhKLOGoQGP/GHhXNBwFmzLk/fRcXpwD96QRBcqSQYiGc3qP/JLavW81FkSj539fDw6Xh6+hzqthmS7BvGTTYfgN3M55HurKb+Ybe1nY7E6dKJ3L4PtRJC5Ta1J7RhkT+MKIGzn2dpxf9fuTIpORA7VU3u9LNyzD0kRvzQ21ZxzeS/P012dd8/lA26EG2fuPmTDbzAsWSVnpuFYSzzu9b1i4neLn0iyuWKU7L+th721P8DhzOSc2UuIuQGkH1jAPleKdW15Icbq8WgqTP5MVjhsRit34eLY93MT40iVjkf2b0rxYPwGUZyLIwniGHt5V+P2c1mGh+Ecssh3I24/6rglQdOORUdHk6eM1i+2cNqmc5WVj5+MR1vzTMfCUexQvHJALAVeaENm7wtGT/jRU0ptE7eS26VoYhRYqb2TFBRbIHhCWqYuoelgtR35G2SNFVv0O8fmzVBiTPcJ1MMPIIXC9/aQbFU6lVgQCauLzZuNcNUbyoZi+36jb/p/GsQC7SfBu3AK4hluGn2deFl+2x5T/wJaS2c/oL46Y+pijv/yRPeto2bnh3pdcatT0v1Y9QdVip7rniSERXVRBkzssBtBp/iVZ7emBVFAhs88F8Y8XyboFvfcW0DQpYdxg9ejdQ50k9WvUUwkrVFiMurfzWt1l1JVCW9EbgBZsOjrBv0WN/FRz87D1DsCbG6mrO+igoBnwOFk/KC9BbzcJFPp5bmf32QFflaFH7cvzKk30p7mEvY0RET58cvx40Yh9lfVnTXWQ9eVBM3Zdg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(6506007)(53546011)(8676002)(316002)(5660300002)(83380400001)(7696005)(8936002)(7416002)(33656002)(55016002)(26005)(86362001)(2906002)(38100700002)(71200400001)(122000001)(30864003)(52536014)(966005)(4326008)(9686003)(64756008)(66446008)(186003)(66556008)(478600001)(54906003)(66476007)(38070700005)(76116006)(66946007)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6063
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8da9d086-81a9-473e-071e-08d971dd0442
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Yjuy6o/733GvZGxuCCoMVUP2Gr9cpzdEvggx+fkOv7AmH5RdCfQVP9Yb3M/hEaFHr2GGZJKhFGHyLnFqHoju+TVYe7xfSuO7Lw6Te3+b5aI+GsA4GmN3yyYZfJbEa2tKRJM0azMC3raQczmIZhcVslNWNwtBzEHL56l6XfmkfE5aTgrqdu2RbVu82c/S6I2ZaZkFYTC4Kq7hfm6kfkIaHvqRm/JO7kJGaFPQ78q18DSTjhTlZ+FXhebfr2aqi716+E/bO5pLRrxzUn1mrbNG/xLbi1B7QdL80jf5pu1ELv3yUGem1XYqXPyVWIi5h33+wwq2ljnHWatm3TFDenot3wdWF9c7GmA1u6c02jZRhvG26MuasgM2D8a+pj1/wQxjmPIlW0rZmR2YJuRmyURebWkaWCIj3p2/+gux9Ch/X0EV+VeAEGZrZ7semvO6+sKhIp74WmuahKpRgET2FOcL4a1sMT9LJaU6uC5OWQaptvGYzwbXu07mNGUj/olWqFhmVhkhXSFj4S7UJIMie/z5dJlmEO92n46eR2CaWEBejIY0nXl42JD4xvGF7HU8ChuA4HeHF/deRJqt0xGWIAiAvWsgz/+mITOsRR6n2ft22IcWRASfZMHXex0wqkPJh43cJ7GEMHhMPPCLzIYW/KgB1JETtJwwhhPm6KrmP8ZrGpnqW1FRx6myV+fKASD90W9GqZZwxw1Zgqff7Sc40ANS/XymoaYluygqFCQ7jvSkK+ZdqxzYodoRXbKH7YP87ItQe/sZ/L2SEX2ptpb0rf7CoKTerQPmJlVnBiZZ62LPKFxmc1ieLpdlhqvUCrHDGvBXu6I0SfpyxUQleBjw3p3Rg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(83380400001)(7696005)(86362001)(316002)(4326008)(70206006)(70586007)(82310400003)(81166007)(54906003)(966005)(186003)(26005)(33656002)(53546011)(478600001)(336012)(8676002)(47076005)(82740400003)(52536014)(110136005)(8936002)(356005)(6506007)(5660300002)(55016002)(2906002)(36860700001)(30864003)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:53:59.8852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 998654e2-1ebe-4345-80a6-08d971dd08d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5533

Hi Oleksandr,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Oleksandr Tyshchenko
> Sent: Thursday, July 29, 2021 12:19 AM
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Daniel De
> Graaf <dgdegra@tycho.nsa.gov>; Daniel P. Smith
> <dpsmith@apertussolutions.com>; Ian Jackson <iwj@xenproject.org>; Wei
> Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>;
> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org=
>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Roger Pau Monn=E9
> <roger.pau@citrix.com>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Wei Chen <Wei.Chen@arm.com>
> Subject: [RFC PATCH] xen/memory: Introduce a hypercall to provide
> unallocated space
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Add XENMEM_get_unallocated_space hypercall which purpose is to
> query hypervisor to find regions of guest physical address space
> which are unused and can be used to create grant/foreign mappings
> instead of wasting real pages from the domain memory for
> establishing these mappings. The problem with the current Linux
> on Xen on Arm behaviour is if we want to map some guest memory
> regions in advance or to perform cache mappings in the backend
> we might run out of memory in the host (see XSA-300).
> This of course, depends on the both host and guest memory sizes.
>=20
> The "unallocated space" can't be figured out precisely by
> the domain on Arm without hypervisor involvement:
> - not all device I/O regions are known by the time domain starts
>   creating grant/foreign mappings
> - the Dom0 is not aware of memory regions used for the identity
>   mappings needed for the PV drivers to work
> In both cases we might end up re-using these regions by
> a mistake. So, the hypervisor which maintains the P2M for the domain
> is in the best position to provide "unallocated space".
>=20
> The arch code is in charge of finding these regions and filling
> in corresponding array in new helper arch_get_unallocated_space().
>=20
> This patch implements common and Arm parts, the x86 specific bits
> are left uniplemented for now.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,

Henry

> ---
> Current patch is based on the latest staging branch:
> 73c932d tools/libxc: use uint32_t for pirq in xc_domain_irq_permission
> and also available at:
> https://github.com/otyshchenko1/xen/commits/map_opt_ml1
>=20
> The corresponding Linux changes you can find at:
> https://github.com/otyshchenko1/linux/commits/map_opt_ml1
> I am going to publish them soon.
> ---
>  tools/flask/policy/modules/dom0.te  |  2 +-
>  xen/arch/arm/mm.c                   | 18 ++++++++++++
>  xen/common/memory.c                 | 56
> +++++++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/mm.h            |  4 +++
>  xen/include/asm-x86/mm.h            |  8 ++++++
>  xen/include/public/memory.h         | 37 +++++++++++++++++++++++-
>  xen/include/xsm/dummy.h             |  6 ++++
>  xen/include/xsm/xsm.h               |  6 ++++
>  xen/xsm/dummy.c                     |  1 +
>  xen/xsm/flask/hooks.c               |  6 ++++
>  xen/xsm/flask/policy/access_vectors |  2 ++
>  11 files changed, 144 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/flask/policy/modules/dom0.te
> b/tools/flask/policy/modules/dom0.te
> index 0a63ce1..b40091f 100644
> --- a/tools/flask/policy/modules/dom0.te
> +++ b/tools/flask/policy/modules/dom0.te
> @@ -39,7 +39,7 @@ allow dom0_t dom0_t:domain {
>  };
>  allow dom0_t dom0_t:domain2 {
>  	set_cpu_policy gettsc settsc setscheduler set_vnumainfo
> -	get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy
> +	get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy
> get_unallocated_space
>  };
>  allow dom0_t dom0_t:resource { add remove };
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0e07335..8a70fe0 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1635,6 +1635,24 @@ unsigned long get_upper_mfn_bound(void)
>      return max_page - 1;
>  }
>=20
> +#define GPFN_ALIGN_TO_GB(x) (((x) + (1UL << 18) - 1) & (~((1UL << 18) - =
1)))
> +
> +int arch_get_unallocated_space(struct domain *d,
> +                               struct xen_unallocated_region *regions,
> +                               unsigned int *nr_regions)
> +{
> +    /*
> +     * Everything not mapped into P2M could be treated as unused. Taking
> into
> +     * the account that we have a lot of unallocated space above
> max_mapped_gfn
> +     * and in order to simplify things, just provide a single 8GB memory
> +     * region aligned to 1GB boundary for now.
> +     */
> +    regions->start_gpfn =3D
> GPFN_ALIGN_TO_GB(domain_get_maximum_gpfn(d) + 1);
> +    regions->nr_gpfns =3D (1UL << 18) * 8;
> +    *nr_regions =3D 1;
> +
> +    return 0;
> +}
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index e07bd9a..3f9b816 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1811,6 +1811,62 @@ long do_memory_op(unsigned long cmd,
> XEN_GUEST_HANDLE_PARAM(void) arg)
>              start_extent);
>          break;
>=20
> +    case XENMEM_get_unallocated_space:
> +    {
> +        struct xen_get_unallocated_space xgus;
> +        struct xen_unallocated_region *regions;
> +
> +        if ( unlikely(start_extent) )
> +            return -EINVAL;
> +
> +        if ( copy_from_guest(&xgus, arg, 1) ||
> +             !guest_handle_okay(xgus.buffer, xgus.nr_regions) )
> +            return -EFAULT;
> +
> +        d =3D rcu_lock_domain_by_any_id(xgus.domid);
> +        if ( d =3D=3D NULL )
> +            return -ESRCH;
> +
> +        rc =3D xsm_get_unallocated_space(XSM_HOOK, d);
> +        if ( rc )
> +        {
> +            rcu_unlock_domain(d);
> +            return rc;
> +        }
> +
> +        if ( !xgus.nr_regions || xgus.nr_regions >
> XEN_MAX_UNALLOCATED_REGIONS )
> +        {
> +            rcu_unlock_domain(d);
> +            return -EINVAL;
> +        }
> +
> +        regions =3D xzalloc_array(struct xen_unallocated_region,
> xgus.nr_regions);
> +        if ( !regions )
> +        {
> +            rcu_unlock_domain(d);
> +            return -ENOMEM;
> +        }
> +
> +        rc =3D arch_get_unallocated_space(d, regions, &xgus.nr_regions);
> +        if ( rc )
> +            goto unallocated_out;
> +
> +        if ( __copy_to_guest(xgus.buffer, regions, xgus.nr_regions) )
> +        {
> +            rc =3D -EFAULT;
> +            goto unallocated_out;
> +        }
> +
> +        if ( __copy_to_guest(arg, &xgus, 1) )
> +            rc =3D -EFAULT;
> +
> +unallocated_out:
> +        rcu_unlock_domain(d);
> +        xfree(regions);
> +
> +        break;
> +    }
> +
>      default:
>          rc =3D arch_memory_op(cmd, arg);
>          break;
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index ded74d2..99a2824 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -359,6 +359,10 @@ void clear_and_clean_page(struct page_info *page);
>=20
>  unsigned int arch_get_dma_bitsize(void);
>=20
> +int arch_get_unallocated_space(struct domain *d,
> +                               struct xen_unallocated_region *regions,
> +                               unsigned int *nr_regions);
> +
>  #endif /*  __ARCH_ARM_MM__ */
>  /*
>   * Local variables:
> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
> index cb90527..6244bc4 100644
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -652,4 +652,12 @@ static inline bool arch_mfn_in_directmap(unsigned
> long mfn)
>      return mfn <=3D (virt_to_mfn(eva - 1) + 1);
>  }
>=20
> +static inline
> +int arch_get_unallocated_space(struct domain *d,
> +                               struct xen_unallocated_region *regions,
> +                               unsigned int *nr_regions)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
>  #endif /* __ASM_X86_MM_H__ */
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index 383a946..040201b 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -739,7 +739,42 @@ struct xen_vnuma_topology_info {
>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
>=20
> -/* Next available subop number is 29 */
> +/*
> + * Get the unallocated space (regions of guest physical address space wh=
ich
> + * are unused) and can be used to create grant/foreign mappings.
> + */
> +#define XENMEM_get_unallocated_space 29
> +struct xen_unallocated_region {
> +    xen_pfn_t start_gpfn;
> +    xen_ulong_t nr_gpfns;
> +};
> +typedef struct xen_unallocated_region xen_unallocated_region_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_unallocated_region_t);
> +
> +#define XEN_MAX_UNALLOCATED_REGIONS 32
> +
> +struct xen_get_unallocated_space {
> +    /* IN - Which domain to provide unallocated space for */
> +    domid_t domid;
> +
> +    /*
> +     * IN/OUT - As an IN parameter number of memory regions which
> +     *          can be written to the buffer (maximum size of the array)
> +     *          As OUT parameter number of memory regions which
> +     *          have been written to the buffer
> +     */
> +    unsigned int nr_regions;
> +
> +    /*
> +     * OUT - An array of memory regions, the regions must be placed in
> +     *       ascending order, there must be no overlap between them.
> +     */
> +    XEN_GUEST_HANDLE(xen_unallocated_region_t) buffer;
> +};
> +typedef struct xen_get_unallocated_space xen_get_unallocated_space_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_get_unallocated_space_t);
> +
> +/* Next available subop number is 30 */
>=20
>  #endif /* __XEN_PUBLIC_MEMORY_H__ */
>=20
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 363c6d7..2761fbd 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -772,3 +772,9 @@ static XSM_INLINE int
> xsm_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
>      XSM_ASSERT_ACTION(XSM_DM_PRIV);
>      return xsm_default_action(action, current->domain, d);
>  }
> +
> +static XSM_INLINE int xsm_get_unallocated_space(XSM_DEFAULT_ARG
> struct domain *d)
> +{
> +    XSM_ASSERT_ACTION(XSM_HOOK);
> +    return xsm_default_action(action, current->domain, d);
> +}
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index ad3cddb..b01619c 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -180,6 +180,7 @@ struct xsm_operations {
>      int (*dm_op) (struct domain *d);
>      int (*xen_version) (uint32_t cmd);
>      int (*domain_resource_map) (struct domain *d);
> +    int (*get_unallocated_space) (struct domain *d);
>  #ifdef CONFIG_ARGO
>      int (*argo_enable) (const struct domain *d);
>      int (*argo_register_single_source) (const struct domain *d,
> @@ -701,6 +702,11 @@ static inline int
> xsm_domain_resource_map(xsm_default_t def, struct domain *d)
>      return xsm_ops->domain_resource_map(d);
>  }
>=20
> +static inline int xsm_get_unallocated_space(xsm_default_t def, struct
> domain *d)
> +{
> +    return xsm_ops->get_unallocated_space(d);
> +}
> +
>  #ifdef CONFIG_ARGO
>  static inline int xsm_argo_enable(const struct domain *d)
>  {
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index de44b10..45efadb 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -151,6 +151,7 @@ void __init xsm_fixup_ops (struct xsm_operations
> *ops)
>      set_to_dummy_if_null(ops, dm_op);
>      set_to_dummy_if_null(ops, xen_version);
>      set_to_dummy_if_null(ops, domain_resource_map);
> +    set_to_dummy_if_null(ops, get_unallocated_space);
>  #ifdef CONFIG_ARGO
>      set_to_dummy_if_null(ops, argo_enable);
>      set_to_dummy_if_null(ops, argo_register_single_source);
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index f1a1217..38a9b20 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1715,6 +1715,11 @@ static int flask_domain_resource_map(struct
> domain *d)
>      return current_has_perm(d, SECCLASS_DOMAIN2,
> DOMAIN2__RESOURCE_MAP);
>  }
>=20
> +static int flask_get_unallocated_space(struct domain *d)
> +{
> +    return current_has_perm(d, SECCLASS_DOMAIN2,
> DOMAIN2__GET_UNALLOCATED_SPACE);
> +}
> +
>  #ifdef CONFIG_ARGO
>  static int flask_argo_enable(const struct domain *d)
>  {
> @@ -1875,6 +1880,7 @@ static struct xsm_operations flask_ops =3D {
>      .dm_op =3D flask_dm_op,
>      .xen_version =3D flask_xen_version,
>      .domain_resource_map =3D flask_domain_resource_map,
> +    .get_unallocated_space =3D flask_get_unallocated_space,
>  #ifdef CONFIG_ARGO
>      .argo_enable =3D flask_argo_enable,
>      .argo_register_single_source =3D flask_argo_register_single_source,
> diff --git a/xen/xsm/flask/policy/access_vectors
> b/xen/xsm/flask/policy/access_vectors
> index 6359c7f..3cbdc19 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -245,6 +245,8 @@ class domain2
>      resource_map
>  # XEN_DOMCTL_get_cpu_policy
>      get_cpu_policy
> +# XENMEM_get_unallocated_space
> +    get_unallocated_space
>  }
>=20
>  # Similar to class domain, but primarily contains domctls related to HVM
> domains
> --
> 2.7.4
>=20


