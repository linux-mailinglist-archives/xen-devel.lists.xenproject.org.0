Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7287BAF95
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 02:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613179.953534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoYkQ-0004mb-2G; Fri, 06 Oct 2023 00:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613179.953534; Fri, 06 Oct 2023 00:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoYkP-0004jr-VP; Fri, 06 Oct 2023 00:31:17 +0000
Received: by outflank-mailman (input) for mailman id 613179;
 Fri, 06 Oct 2023 00:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qoYkN-0004jl-QI
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 00:31:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6b62e74-63df-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 02:31:12 +0200 (CEST)
Received: from DU2P250CA0008.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::13)
 by AS8PR08MB8659.eurprd08.prod.outlook.com (2603:10a6:20b:563::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Fri, 6 Oct
 2023 00:31:09 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::20) by DU2P250CA0008.outlook.office365.com
 (2603:10a6:10:231::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37 via Frontend
 Transport; Fri, 6 Oct 2023 00:31:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.30 via Frontend Transport; Fri, 6 Oct 2023 00:31:08 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Fri, 06 Oct 2023 00:31:08 +0000
Received: from 4313ba9f991d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E927C25-9903-401E-9290-C36F80284D74.1; 
 Fri, 06 Oct 2023 00:31:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4313ba9f991d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 00:31:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB8PR08MB5308.eurprd08.prod.outlook.com (2603:10a6:10:f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 00:30:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 00:30:59 +0000
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
X-Inumbo-ID: a6b62e74-63df-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSnn/mF7Lfz6vch3eo+VA1RLiyHu6T4vUZy4MKXNENA=;
 b=azZwJQ6ha/E40lJmy5LvbnpDr5zb8qlLKAtSvY6M3M+7VgBw936ChA19qvYHAY4lunMy/5QEyvmeEQiPHQ/Z0PqLJtwsGjAz0Q6U4uzsWPna5/zaY1BetAWnqaTesy2AY7RA7fEeUrOcicJ6luR/V6jW3D9M8kYNKmQEQ6J3Ud0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f110b827ecb81f09
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4swr+WyQByA/aLX+LhpVDVs00V1B/k2OpnnbMGmUVNos2RzBCAtU1rryzaA8Pt5pM82Q+tEmdIqNeg/AfQEEYyqbF0wkhvPNbgxw/DSi+ZNOK6fB/7VwmurKYyGoM4g5LQCWpRDucxU9yMeteP79352XHlHeTTYwH0eOn0Ew9hteZQ4dlcyBroPwUrfHr/NX5LOw1szblNH+W4b30IAs8sjufoNErwnkmhr/JjU1VM7iboiJv10ykCI38rF14PZ+g5fg8pQpihiyNqElJaxQJFj7YpfkHXNcMgnHTON8sNnA0ZFEkERW1F+AImzq3UglWGRzg5Y8XvAJX0q5K0SlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSnn/mF7Lfz6vch3eo+VA1RLiyHu6T4vUZy4MKXNENA=;
 b=Mk/VDMQBNfVysEJyPtolCEC5IC6ARcXLTgBES6eJDJWs5LTdxWu+QonwdkYSbHFwwM8jn2mwmfF8NMgK/B1zwtELN7XHqIn84DzegKqExHtUyWwLehgtbPkEee5B+m5UbqkPaxeWWaDOQ711OeXQhgbK/YcMlsHJWbhncHTbP77JeuIfDej+6A58Z6n5D5Yk2EBxIXFeKtoGykvKPOoKn18gbl8l4k9F+mYI64nZGxa5Z6mr60ZWHRBZKBkksU7lxE2eDQIT00uDOzb65hVDC+HA85igYm3eQlNxmcUA/xARR6c6IIxWic6bvGFr5FjWtf44I+1+nCTDtB7v6IwhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSnn/mF7Lfz6vch3eo+VA1RLiyHu6T4vUZy4MKXNENA=;
 b=azZwJQ6ha/E40lJmy5LvbnpDr5zb8qlLKAtSvY6M3M+7VgBw936ChA19qvYHAY4lunMy/5QEyvmeEQiPHQ/Z0PqLJtwsGjAz0Q6U4uzsWPna5/zaY1BetAWnqaTesy2AY7RA7fEeUrOcicJ6luR/V6jW3D9M8kYNKmQEQ6J3Ud0=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	"dan.driscoll@siemens.com" <dan.driscoll@siemens.com>,
	"arvind.raghuraman@siemens.com" <arvind.raghuraman@siemens.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Julien Grall
	<jgrall@amazon.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vtimer: Don't read/use the secure physical timer
 interrupt for ACPI
Thread-Topic: [PATCH] xen/arm: vtimer: Don't read/use the secure physical
 timer interrupt for ACPI
Thread-Index: AQHZ96y2RbIZC50OnEi+VKpAsgAIM7A7zjiAgAAbIgA=
Date: Fri, 6 Oct 2023 00:30:58 +0000
Message-ID: <1EFC3B0B-B10D-48C0-96F7-6F0067DC0EA5@arm.com>
References: <20231005165454.18143-1-julien@xen.org>
 <alpine.DEB.2.22.394.2310051552570.2348112@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310051552570.2348112@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB8PR08MB5308:EE_|DBAEUR03FT012:EE_|AS8PR08MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 412ed139-23ee-44cb-6eb0-08dbc60388d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O0i2bXEOqbilhoU7ooz3mTK8gqWeoTTX+nF/IAm2fVd+d6o7XkoO5HZl2rX3itfl7vL/uPChQWRnz9YFuO6PZ17dOKEy8eaMt0I6PD4+NUR7VOBCezUifwPfZpgYYAv3U9izFq+M6iMRB2gEUxYRxU9cnOUliZSgncI0DZFKdZGW52Z/i5FtLzPlKE/oaU16TaKI59jIKUcuR320ftxhZ1tfjmphJ6tZk9yBPAyNqtqIwYbGOzRh3ZYSSNeY2+7ivOO8wlAL8EytfzZd8o/K7EqJqg2gcooUtvCRYbQ/MoyNQOLSGpzfGqdHFsZ2jzvlAmt//LsIXfvcdJPa//Ka3j2ppRNy+JP74+opyMbLbE9cbhtVp6Ee82nK1ktGC4kMCfjzReOyUsvUjKClBnYI5wOO9db1fOit332zs/kaCttFckNR5Rgi971fm4olyuUu2UrSeNBPs+Lw+9Xk7mzLq/4QR2Aobx+9L9uTyYqPbsmZuwJZ2+XEiIroxqWR5zblujLIlY89Zk9vhAzVsQx6w7u8wLJz0BiBVWyuHxUJEE0j8Kahsxqd09OKndAB/buTR1e2wwXxtEJ2e5T982SBBi5fMsjkkmVHSs8vHck8nPJR8cOSbxDgCurRiM75az9CkPxUcUum3C+jolqfm/32EA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(122000001)(8676002)(8936002)(4326008)(5660300002)(6512007)(53546011)(6486002)(6506007)(33656002)(2906002)(86362001)(38100700002)(38070700005)(478600001)(41300700001)(316002)(26005)(66476007)(66946007)(76116006)(2616005)(83380400001)(71200400001)(6916009)(91956017)(66556008)(66446008)(54906003)(64756008)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <68A01BC25A566947AA7EDCA8F1AF13B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5308
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3ca60870-130a-4c24-b425-08dbc6038309
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3+bVA8gjcFoU3/3JHvcGaniyg4wZNRiUv1hfge4w1++lohGrmj/u7swuvRl6A8IpBnNm8AFSC60br5VA1YctTGU3Q10LyAlmkuK5yQc+ksC+9k+Mh1FjSlM1HhrmY/Lgd7yY8pCNOW07/IefsaYGYjvSBIZs8+v4D6HocUG+rcp2fLhVd7uDeYno0hvosHmC7pRtMBIO63gU/F+VVqgbKqfd4arJ0dWLBw3nO/YXlngrbiN7qFUnmHrdSBoM+iV4DOhC8tImTvQrWWZj6mw3FH8vwT2Ag6VFXk2CeqBJDiCdIFL7JAY3vWVUXzrX3gPS4EEpRNa7IwVE5CGm1I2hVMgG33JdfGia0v6wtd68yBIQylTHP059GtjD4WG+f2FU9QFeP8jLNbQcVm6na/xXfzI1jIdh521AztKoX+BUDjKCnPvf6dLsUk5J2xuBCBRQ3pOJajungCz7rxGT1CSQv52ez1Vr2H37Z1D9WW8yNv1fIvGaok+v2vHPH8aJ06Lli1ybOEV/WY3OcyyB+89/pF9SA2qg0T12V/H3tBMP+QJoAI9Uh3iqDMSKUJfgqTlU6W7rslrEP9O+E8RKzZ58yk8L32JTS9wIqzIBxy3lit17fPTmPUkgiPZEIkNzxOY5vG9HOBG/jYBaEPGoVaKpzR/Ii9NmQ4cMr8QyGiJE6MHlXXPm1BflrjHSPpD4wWYqL61L/IjsR9JmSXNoOqmutWGPvuPwQWV1q96eGAw9BG3Zx3mvQzTYgN1jgVBo6CSi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(376002)(396003)(346002)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799009)(46966006)(36840700001)(40470700004)(6862004)(40480700001)(4326008)(33656002)(8936002)(86362001)(8676002)(5660300002)(40460700003)(2906002)(36756003)(26005)(356005)(81166007)(82740400003)(478600001)(6512007)(83380400001)(107886003)(6486002)(2616005)(6506007)(53546011)(336012)(316002)(36860700001)(70206006)(70586007)(54906003)(41300700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 00:31:08.5635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 412ed139-23ee-44cb-6eb0-08dbc60388d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8659

Hi,

> On Oct 6, 2023, at 06:53, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 5 Oct 2023, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>=20
>> Per ACPI 6.5 section 5.2.25 ("Generic Timer Description Table (GTDT)"),
>> the fields "Secure EL1 Timer GSIV/Flags" are optional and an OS running
>> in non-secure world is meant to ignore the values.
>>=20
>> However, Xen is trying to reserve the value. When booting on Graviton
>> 2 metal instances, this would result to crash a boot because the
>> value is 0 which is already reserved (I haven't checked for which device=
).
>> While nothing prevent a PPI to be shared, the field should have been
>> ignored by Xen.
>>=20
>> For the Device-Tree case, I couldn't find a statement suggesting
>> that the secure physical timer interrupt  is ignored. In fact, I have
>> found some code in Linux using it as a fallback. That said, it should
>> never be used.
>>=20
>> As I am not aware of any issue when booting using Device-Tree, the
>> physical timer interrupt is only ignored for ACPI.
>>=20
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>=20
>> ----
>>=20
>> This has not been tested on Graviton 2 because I can't seem to get
>> the serial console working properly. @Dan would you be able to try it?
>>=20
>> It would also be good to understand why 0 why already reserved. This
>> may be a sign for other issues in the ACPI code.
>> ---
>> xen/arch/arm/time.c   |  4 ----
>> xen/arch/arm/vtimer.c | 17 +++++++++++++++--
>> 2 files changed, 15 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>> index 3535bd8ac7c7..8fc14cd3ff62 100644
>> --- a/xen/arch/arm/time.c
>> +++ b/xen/arch/arm/time.c
>> @@ -78,10 +78,6 @@ static int __init arch_timer_acpi_init(struct acpi_ta=
ble_header *header)
>>     irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
>>     timer_irq[TIMER_PHYS_NONSECURE_PPI] =3D gtdt->non_secure_el1_interru=
pt;
>>=20
>> -    irq_type =3D acpi_get_timer_irq_type(gtdt->secure_el1_flags);
>> -    irq_set_type(gtdt->secure_el1_interrupt, irq_type);
>> -    timer_irq[TIMER_PHYS_SECURE_PPI] =3D gtdt->secure_el1_interrupt;
>> -
>>     irq_type =3D acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
>>     irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
>>     timer_irq[TIMER_VIRT_PPI] =3D gtdt->virtual_timer_interrupt;
>> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
>> index c54360e20266..e73ae33c1b58 100644
>> --- a/xen/arch/arm/vtimer.c
>> +++ b/xen/arch/arm/vtimer.c
>> @@ -8,6 +8,7 @@
>>  * Copyright (c) 2011 Citrix Systems.
>>  */
>>=20
>> +#include <xen/acpi.h>
>> #include <xen/lib.h>
>> #include <xen/perfc.h>
>> #include <xen/sched.h>
>> @@ -61,10 +62,22 @@ int domain_vtimer_init(struct domain *d, struct xen_=
arch_domainconfig *config)
>>=20
>>     config->clock_frequency =3D timer_dt_clock_frequency;
>>=20
>> -    /* At this stage vgic_reserve_virq can't fail */
>> +    /*
>> +     * Per the ACPI specification, providing a secure EL1 timer
>> +     * interrupt is optional and will be ignored by non-secure OS.
>> +     * Therefore don't reserve the interrupt number for the HW domain
>> +     * and ACPI.
>> +     *
>> +     * Note that we should still reserve it when using the Device-Tree
>> +     * because the interrupt is not optional. That said, we are not
>> +     * expecting any OS to use it when running on top of Xen.
>> +     *
>> +     * At this stage vgic_reserve_virq() is not meant to fail.
>> +    */
>=20
> NIT: minor code style issue that can be solved on commit
>=20
> Assuming it passes Dan's test:
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
>=20
>>     if ( is_hardware_domain(d) )
>>     {
>> -        if ( !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_SECURE_PPI)=
) )
>> +        if ( acpi_disabled &&
>> +             !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_SECURE_PPI)=
) )
>>             BUG();
>>=20
>>         if ( !vgic_reserve_virq(d, timer_get_irq(TIMER_PHYS_NONSECURE_PP=
I)) )
>> --=20
>> 2.40.1
>>=20


