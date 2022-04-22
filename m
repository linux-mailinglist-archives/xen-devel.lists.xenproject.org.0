Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3890650B63E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 13:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310837.527788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrZK-0002Vr-7K; Fri, 22 Apr 2022 11:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310837.527788; Fri, 22 Apr 2022 11:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrZK-0002U3-41; Fri, 22 Apr 2022 11:35:22 +0000
Received: by outflank-mailman (input) for mailman id 310837;
 Fri, 22 Apr 2022 11:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYvr=VA=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nhrZI-0002Tx-5m
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 11:35:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4448505e-c230-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 13:35:10 +0200 (CEST)
Received: from AS9PR06CA0018.eurprd06.prod.outlook.com (2603:10a6:20b:462::11)
 by GV1PR08MB8036.eurprd08.prod.outlook.com (2603:10a6:150:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 11:35:08 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::fa) by AS9PR06CA0018.outlook.office365.com
 (2603:10a6:20b:462::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Fri, 22 Apr 2022 11:35:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Fri, 22 Apr 2022 11:35:07 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Fri, 22 Apr 2022 11:35:07 +0000
Received: from 5a8c6b6d45cf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9F9B9B6-80EE-47E1-A7F2-D80A0E526387.1; 
 Fri, 22 Apr 2022 11:34:57 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a8c6b6d45cf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Apr 2022 11:34:57 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by VI1PR0802MB2461.eurprd08.prod.outlook.com
 (2603:10a6:800:af::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 11:34:52 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 11:34:52 +0000
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
X-Inumbo-ID: 4448505e-c230-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY6klaSK2acOR58KRnVozDXSvrGRGDsosP9I1h8sdQg=;
 b=GWNcohEZTZ7asBZirDJucP27e1Ln7YshLPwBY+1Ul314rpSKoamBuA1bErv1BsyPoPiCqrSSlZ3oq+JTQ/kQUlZeZIugAkWMq/1fFhhrE0H0jzQGNuR1+0GaR+6f9feHCct+pPI8qZMJ+DvTlh4qMKlkPPewo/x6t0ARcaz8Plc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4eb68193c1ec48e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+RK5uw6C0MP+LCim52M7ECz7+Y5i493hKi4A1sUnSXE0am31B1RTQHabwOq2ayfrJlJGbiw8wDD+e983IQwTOPrM/nOuJh7rbc6sFS9SuRcls1dwagwg68zk8KjF+wa+HykUXSZVoi99YOsMVUjNQ5qNrLofb+1qevSzm6RjznPjneJjgpxUj8X+r7WU99BiZtYaD5ho/LLhRKYU3lMmV/1osUyURnoH6NzmQqOfmHtAOdAoLNEuS/jemFY47KLngUEpgJ2GVmDDBzS91mz9nTsTQYzdP2Exf5PNbM3n+GNpjTj6j1U9PVJdE9qFEPEqzcVbtAoTRMN9P9nO7VRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY6klaSK2acOR58KRnVozDXSvrGRGDsosP9I1h8sdQg=;
 b=AA8oBEy4PAMcaxHhCxC1WPVYVrs1ZiqmncQU00B9qmvJrgXRdLsYgIaMxWNcf4Rut1XxgfRwob9/EWm2RXtUGUzXG6KztaaR0Ce+shOd1sKslqUvz6SrgSQYX0X4OOskNp3KquCGVInpnBwO9ohMvgRItIVeiz4vL7+VfPDsWaIbc5VNQ31ckKt2hWA8YiQPP2d4fPJ5ujCS0moJ+zjIEDjuTjeIWLIGXhbIf92pslWAL2YYop7uZfOugDlILn8n0WI2RxA76BN59hWgMFCbSW2e8Jo7h/oHjezgqEm34ZMvjQYWCDSewNYJ1Iw2haeXPSUGg+4+CZ0G7Ll7R0aYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY6klaSK2acOR58KRnVozDXSvrGRGDsosP9I1h8sdQg=;
 b=GWNcohEZTZ7asBZirDJucP27e1Ln7YshLPwBY+1Ul314rpSKoamBuA1bErv1BsyPoPiCqrSSlZ3oq+JTQ/kQUlZeZIugAkWMq/1fFhhrE0H0jzQGNuR1+0GaR+6f9feHCct+pPI8qZMJ+DvTlh4qMKlkPPewo/x6t0ARcaz8Plc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Christoph Hellwig <hch@lst.de>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
Thread-Topic: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
Thread-Index:
 AQHYTzcUggEUWxM2006iot1qnYxlIKzuW0oAgAFU1ACAADDmgIAApv+AgAC5dQCAAp7ugIACQDIAgAEmAYCAANnhAIAAjguAgADEGACAAT4mAIAAR4cAgAB2D4CAAG0vAA==
Date: Fri, 22 Apr 2022 11:34:52 +0000
Message-ID: <105DB518-DB5B-47F8-852F-C997678BBCE6@arm.com>
References: <20220415063705.GA24262@lst.de>
 <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop>
 <4BC65913-EB0A-441C-A09C-4175697BDE9D@arm.com>
 <alpine.DEB.2.22.394.2204181225340.915916@ubuntu-linux-20-04-desktop>
 <49E3535A-5672-4047-AF86-05D5597C7019@arm.com>
 <alpine.DEB.2.22.394.2204191933450.915916@ubuntu-linux-20-04-desktop>
 <5C7EC3F4-9126-46E8-9321-60878357F939@arm.com>
 <alpine.DEB.2.22.394.2204201523390.915916@ubuntu-linux-20-04-desktop>
 <12279FAE-2141-469E-A424-9984348E84BB@arm.com>
 <alpine.DEB.2.22.394.2204211444190.915916@ubuntu-linux-20-04-desktop>
 <20220422050405.GA10195@lst.de>
In-Reply-To: <20220422050405.GA10195@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c2c6bdfd-be6e-4690-43a8-08da24542705
x-ms-traffictypediagnostic:
	VI1PR0802MB2461:EE_|VE1EUR03FT053:EE_|GV1PR08MB8036:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB80362FD6EEEC275F4ED03E44FCF79@GV1PR08MB8036.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dSPupamvBFJc/wsgEMfxjEE4KFwgA1j+yHmqqv71XrP1EJlm+pBo0hjd/CUPXdnc+rR4I71l7/7cYBhJCF2UIHgkg1kLOezI6z/QOCZZwcQSo+mnngOw+S/lYlsPpUEQ/kY78p1CihkaabQOlc/veK7igtwUEvabjHtW8aUkw46ugvaVfOaBAnY0VNMgSyzXcirtYxm3t47l6Oj+gboxp02+qmF7EcpwlhjIHProy1DRFt/v3XIZ8DT10QE1/GCasQEqRdgWJmB/qMQepWqMsdpJ0ygr9L0f9lkuebrGNqxiM7MT07MqLSOYuWywb9o3nODC97jgxJSOUFMFZ345aY6ysXzjDId2uKrr6devZwu/5BkISsOOC8vQBtaM9u/l0WWO+Z0v2lP3hrrxS63wpv/Pl4ZwnzZjwd01ht5g2PdHWCaRVDZ00Utc75aGg2zgBWCSGhziFDcC6jQDOnyU5QWa912jOMCgAZVfTJNUudtz3ih3y/pDRE4N+rjw1kIuVP8BquoqQykL4rMAUbpcxxmek+SB7vCbZ1B2dI6z7bKHjJPiBf5jwjCx/n5R86K9tijs9E0Q+z1puwQLjxCCrrNnyWnMXUzDs4jyHAWKBbX4I4jdNyDLkBuny41bnHmRPUih+SfAtQfvXoHPjlSVqXsaBqMLkE8zZdlUXCtqVyuLA0PJTXgiR5svQiNjWilmXeCc3wGzrb5F3qHuTkhNl5WSOd9rvuiMkuid+iN09pK7lsR3dentPAqKzH5oLXCX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(54906003)(2616005)(66446008)(5660300002)(6506007)(33656002)(508600001)(8676002)(6486002)(8936002)(36756003)(2906002)(38100700002)(38070700005)(6916009)(86362001)(4326008)(26005)(71200400001)(53546011)(64756008)(6512007)(186003)(122000001)(83380400001)(66476007)(66556008)(76116006)(91956017)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5C80E50A512A343AAB5312C84ABB9F0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2461
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	209d5f7c-ad11-4c5c-eba8-08da24541e25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bhJzDOka/nEz9x5RjgdNNTGl6Q2ngP08VXmm5aoZqkQD6tQGo4+L1ANW51etbc8bkmoigB99aiTr1kvrzrfhtsxRW0nBmqmJc84qNVVAJoT5BJzFDG1jAujvW9CS1a9jkykHk7iEP4QP9Rrr2Zg7gx7ELt3dLDQtBadOo6kvdmopuDfuKvtiSddL5yQNSqNAh7W9+D1NH8poLjZ/8iEyMBM6i2WBylrn4X5twzCT8mWK/NFbe3jrRG15wJT9dJISWA9ylkkf2FhRA+F6A47pReOYWggWGl6PdHtG/0J88ZK1TuPjsQSPaksKeklBa4zQfZtDvXLF6qpXdotDmTqiyIqcshVe6N3RTUPe4rPpeFT/SR7lGX2g7qTDQC01haL9NB0LgE6UW1thdAUitHjwYW1H+hCPB8Mj02ePeZ3XHvYkSCK6GNXhqywK3iLYgF79btlTBSIad+YFAWrD6AUo7Lp+HUwG4/DjAuNjXLdmcPEd4OIqANb66sGNghkLWhB/bNk6j31VX1ejaI+FXwT9PEi82ZJBhP1PniT40s020/HPW73jL7AWKk08G39jLZIxvVl9auCyvSgcheuYg15ZuZ+aZwL1MxfzeefxC9EmyIJOnuwPAWLqY8IgCIlH7kAVPIdesYnvlmwnesWwQFr7nOXT3YFitz1AjMWU4FSrNCN4Nl+D0G4JURQnOX7aYt63
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(81166007)(186003)(26005)(6486002)(8936002)(36860700001)(47076005)(2906002)(82310400005)(54906003)(70586007)(70206006)(36756003)(6506007)(316002)(86362001)(8676002)(4326008)(2616005)(83380400001)(107886003)(6862004)(6512007)(336012)(53546011)(356005)(508600001)(5660300002)(33656002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 11:35:07.5449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c6bdfd-be6e-4690-43a8-08da24542705
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8036

Hello Stefano, Christoph,

> On 22 Apr 2022, at 6:04 am, Christoph Hellwig <hch@lst.de> wrote:
>=20
> On Thu, Apr 21, 2022 at 03:01:32PM -0700, Stefano Stabellini wrote:
>> swiotlb-xen: handle DMA_ATTR_NO_KERNEL_MAPPING
>>=20
>> If DMA_ATTR_NO_KERNEL_MAPPING is set then the returned vaddr is a struct
>> *page instead of the virtual mapping of the buffer.
>>=20
>> In xen_swiotlb_alloc_coherent, do not call virt_to_page, instead use the
>> returned pointer directly. Also do not memset the buffer or struct page
>> to zero.
>>=20
>> In xen_swiotlb_free_coherent, check DMA_ATTR_NO_KERNEL_MAPPING and set
>> the page pointer appropriately.
>=20
> Something like that should work, but it makes swiotlb-xen poke even
> more into the opaque dma-direct internals.  I'd rather do something
> like the patch below that uses the dma_direct allocator directly for
> arm, and simplifies the xen-swiotlb allocator now that it just needs
> to cater to the x86 case:
>=20
> diff --git a/arch/arm/include/asm/xen/page-coherent.h b/arch/arm/include/=
asm/xen/page-coherent.h
> deleted file mode 100644
> index 27e984977402b..0000000000000
> --- a/arch/arm/include/asm/xen/page-coherent.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <xen/arm/page-coherent.h>
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index a7e54a087b802..6e603e5fdebb1 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -118,23 +118,6 @@ bool xen_arch_need_swiotlb(struct device *dev,
> 		!dev_is_dma_coherent(dev));
> }
>=20
> -int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
> -				 unsigned int address_bits,
> -				 dma_addr_t *dma_handle)
> -{
> -	if (!xen_initial_domain())
> -		return -EINVAL;
> -
> -	/* we assume that dom0 is mapped 1:1 for now */
> -	*dma_handle =3D pstart;
> -	return 0;
> -}
> -
> -void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int orde=
r)
> -{
> -	return;
> -}
> -
> static int __init xen_mm_init(void)
> {
> 	struct gnttab_cache_flush cflush;
> diff --git a/arch/arm64/include/asm/xen/page-coherent.h b/arch/arm64/incl=
ude/asm/xen/page-coherent.h
> deleted file mode 100644
> index 27e984977402b..0000000000000
> --- a/arch/arm64/include/asm/xen/page-coherent.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <xen/arm/page-coherent.h>
> diff --git a/arch/x86/include/asm/xen/page-coherent.h b/arch/x86/include/=
asm/xen/page-coherent.h
> deleted file mode 100644
> index 63cd41b2e17ac..0000000000000
> --- a/arch/x86/include/asm/xen/page-coherent.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_X86_XEN_PAGE_COHERENT_H
> -#define _ASM_X86_XEN_PAGE_COHERENT_H
> -
> -#include <asm/page.h>
> -#include <linux/dma-mapping.h>
> -
> -static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_=
t size,
> -		dma_addr_t *dma_handle, gfp_t flags,
> -		unsigned long attrs)
> -{
> -	void *vstart =3D (void*)__get_free_pages(flags, get_order(size));
> -	*dma_handle =3D virt_to_phys(vstart);
> -	return vstart;
> -}
> -
> -static inline void xen_free_coherent_pages(struct device *hwdev, size_t =
size,
> -		void *cpu_addr, dma_addr_t dma_handle,
> -		unsigned long attrs)
> -{
> -	free_pages((unsigned long) cpu_addr, get_order(size));
> -}
> -
> -#endif /* _ASM_X86_XEN_PAGE_COHERENT_H */
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 47aebd98f52f5..557edb9c54879 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -36,7 +36,6 @@
> #include <xen/hvc-console.h>
>=20
> #include <asm/dma-mapping.h>
> -#include <asm/xen/page-coherent.h>
>=20
> #include <trace/events/swiotlb.h>
> #define MAX_DMA_BITS 32
> @@ -104,6 +103,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, =
dma_addr_t dma_addr)
> 	return 0;
> }
>=20
> +#ifdef CONFIG_X86
> static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
> {
> 	int rc;
> @@ -129,6 +129,12 @@ static int xen_swiotlb_fixup(void *buf, unsigned lon=
g nslabs)
> 	} while (i < nslabs);
> 	return 0;
> }
> +#else
> +static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
> +{
> +	return 0;
> +}
> +#endif
>=20
> enum xen_swiotlb_err {
> 	XEN_SWIOTLB_UNKNOWN =3D 0,
> @@ -256,97 +262,60 @@ void __init xen_swiotlb_init_early(void)
> 		panic("Cannot allocate SWIOTLB buffer");
> 	swiotlb_set_max_segment(PAGE_SIZE);
> }
> -#endif /* CONFIG_X86 */
>=20
> static void *
> -xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
> -			   dma_addr_t *dma_handle, gfp_t flags,
> -			   unsigned long attrs)
> +xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
> {
> -	void *ret;
> +	u64 dma_mask =3D dev->coherent_dma_mask;
> 	int order =3D get_order(size);
> -	u64 dma_mask =3D DMA_BIT_MASK(32);
> 	phys_addr_t phys;
> -	dma_addr_t dev_addr;
> -
> -	/*
> -	* Ignore region specifiers - the kernel's ideas of
> -	* pseudo-phys memory layout has nothing to do with the
> -	* machine physical layout.  We can't allocate highmem
> -	* because we can't return a pointer to it.
> -	*/
> -	flags &=3D ~(__GFP_DMA | __GFP_HIGHMEM);
> +	void *ret;
>=20
> -	/* Convert the size to actually allocated. */
> +	/* Align the allocation to the Xen page size */
> 	size =3D 1UL << (order + XEN_PAGE_SHIFT);
>=20
> -	/* On ARM this function returns an ioremap'ped virtual address for
> -	 * which virt_to_phys doesn't return the corresponding physical
> -	 * address. In fact on ARM virt_to_phys only works for kernel direct
> -	 * mapped RAM memory. Also see comment below.
> -	 */
> -	ret =3D xen_alloc_coherent_pages(hwdev, size, dma_handle, flags, attrs)=
;
> -
> +	ret =3D (void *)__get_free_pages(flags, get_order(size));
> 	if (!ret)
> 		return ret;
> -
> -	if (hwdev && hwdev->coherent_dma_mask)
> -		dma_mask =3D hwdev->coherent_dma_mask;
> -
> -	/* At this point dma_handle is the dma address, next we are
> -	 * going to set it to the machine address.
> -	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
> -	 * to *dma_handle. */
> -	phys =3D dma_to_phys(hwdev, *dma_handle);
> -	dev_addr =3D xen_phys_to_dma(hwdev, phys);
> -	if (((dev_addr + size - 1 <=3D dma_mask)) &&
> -	    !range_straddles_page_boundary(phys, size))
> -		*dma_handle =3D dev_addr;
> -	else {
> -		if (xen_create_contiguous_region(phys, order,
> -						 fls64(dma_mask), dma_handle) !=3D 0) {
> -			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
> -			return NULL;
> -		}
> -		*dma_handle =3D phys_to_dma(hwdev, *dma_handle);
> +	phys =3D virt_to_phys(ret);
> +
> +	*dma_handle =3D xen_phys_to_dma(dev, phys);
> +	if (*dma_handle + size - 1 > dma_mask ||
> +	    range_straddles_page_boundary(phys, size)) {
> +		if (xen_create_contiguous_region(phys, order, fls64(dma_mask),
> +				dma_handle) !=3D 0)
> +			goto out_free_pages;
> 		SetPageXenRemapped(virt_to_page(ret));
> 	}
> +
> 	memset(ret, 0, size);
> 	return ret;
> +
> +out_free_pages:
> +	free_pages((unsigned long)ret, get_order(size));
> +	return NULL;
> }
>=20
> static void
> -xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr=
,
> -			  dma_addr_t dev_addr, unsigned long attrs)
> +xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
> +		dma_addr_t dma_handle, unsigned long attrs)
> {
> +	phys_addr_t phys =3D virt_to_phys(vaddr);
> 	int order =3D get_order(size);
> -	phys_addr_t phys;
> -	u64 dma_mask =3D DMA_BIT_MASK(32);
> -	struct page *page;
> -
> -	if (hwdev && hwdev->coherent_dma_mask)
> -		dma_mask =3D hwdev->coherent_dma_mask;
> -
> -	/* do not use virt_to_phys because on ARM it doesn't return you the
> -	 * physical address */
> -	phys =3D xen_dma_to_phys(hwdev, dev_addr);
>=20
> 	/* Convert the size to actually allocated. */
> 	size =3D 1UL << (order + XEN_PAGE_SHIFT);
>=20
> -	if (is_vmalloc_addr(vaddr))
> -		page =3D vmalloc_to_page(vaddr);
> -	else
> -		page =3D virt_to_page(vaddr);
> +	if (WARN_ON_ONCE(dma_handle + size - 1 > dev->coherent_dma_mask) ||
> +	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size)))
> +	    	return;
>=20
> -	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
> -		     range_straddles_page_boundary(phys, size)) &&
> -	    TestClearPageXenRemapped(page))
> +	if (TestClearPageXenRemapped(virt_to_page(vaddr)))
> 		xen_destroy_contiguous_region(phys, order);
> -
> -	xen_free_coherent_pages(hwdev, size, vaddr, phys_to_dma(hwdev, phys),
> -				attrs);
> +	free_pages((unsigned long)vaddr, get_order(size));
> }
> +#endif /* CONFIG_X86 */
>=20
> /*
>  * Map a single buffer of the indicated size for DMA in streaming mode.  =
The
> @@ -549,8 +518,13 @@ xen_swiotlb_dma_supported(struct device *hwdev, u64 =
mask)
> }
>=20
> const struct dma_map_ops xen_swiotlb_dma_ops =3D {
> +#ifdef CONFIG_X86
> 	.alloc =3D xen_swiotlb_alloc_coherent,
> 	.free =3D xen_swiotlb_free_coherent,
> +#else
> +	.alloc =3D dma_direct_alloc,
> +	.free =3D dma_direct_free,
> +#endif
> 	.sync_single_for_cpu =3D xen_swiotlb_sync_single_for_cpu,
> 	.sync_single_for_device =3D xen_swiotlb_sync_single_for_device,
> 	.sync_sg_for_cpu =3D xen_swiotlb_sync_sg_for_cpu,
> diff --git a/include/xen/arm/page-coherent.h b/include/xen/arm/page-coher=
ent.h
> deleted file mode 100644
> index b9cc11e887ed5..0000000000000
> --- a/include/xen/arm/page-coherent.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _XEN_ARM_PAGE_COHERENT_H
> -#define _XEN_ARM_PAGE_COHERENT_H
> -
> -#include <linux/dma-mapping.h>
> -#include <asm/page.h>
> -
> -static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_=
t size,
> -		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
> -{
> -	return dma_direct_alloc(hwdev, size, dma_handle, flags, attrs);
> -}
> -
> -static inline void xen_free_coherent_pages(struct device *hwdev, size_t =
size,
> -		void *cpu_addr, dma_addr_t dma_handle, unsigned long attrs)
> -{
> -	dma_direct_free(hwdev, size, cpu_addr, dma_handle, attrs);
> -}
> -
> -#endif /* _XEN_ARM_PAGE_COHERENT_H */

Thanks for sharing the patch to fix the issue.
I tested both the patches and both the patches work fine.


Regards,
Rahul


