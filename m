Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06467414823
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192657.343204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0kE-0008W6-3H; Wed, 22 Sep 2021 11:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192657.343204; Wed, 22 Sep 2021 11:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0kE-0008U7-0E; Wed, 22 Sep 2021 11:48:58 +0000
Received: by outflank-mailman (input) for mailman id 192657;
 Wed, 22 Sep 2021 11:48:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bMBL=OM=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mT0kC-0008U1-Mm
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:48:56 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::60d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df6f47f9-dcbc-47a9-a9ed-0f9b054c2ecb;
 Wed, 22 Sep 2021 11:48:54 +0000 (UTC)
Received: from AM5PR0402CA0004.eurprd04.prod.outlook.com
 (2603:10a6:203:90::14) by VI1PR0802MB2238.eurprd08.prod.outlook.com
 (2603:10a6:800:9a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 11:48:52 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::e8) by AM5PR0402CA0004.outlook.office365.com
 (2603:10a6:203:90::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 11:48:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 11:48:51 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Wed, 22 Sep 2021 11:48:49 +0000
Received: from ade55d5d6ad9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D546286-697E-4D74-8FAF-DE51AA90867C.1; 
 Wed, 22 Sep 2021 11:48:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ade55d5d6ad9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Sep 2021 11:48:37 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6365.eurprd08.prod.outlook.com (2603:10a6:102:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 22 Sep
 2021 11:48:36 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Wed, 22 Sep 2021
 11:48:36 +0000
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
X-Inumbo-ID: df6f47f9-dcbc-47a9-a9ed-0f9b054c2ecb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MmWJ7hHoqNYgOIHSmjWOBBxabBhm0rXpL0yo1/j+ps=;
 b=D+0NiW4VScqPtsfbbpP5jKWEW0TewfTiCgxpJhh6SAviyUREvyiWd7n4WGW7841j7SmZYchzKhu828CE47viIvda1tJTdCow3j3Qb6wyKR8JNMOMpcpeZ2mR3dG9zGZ9CCdZZ3uMq9JnIQzU3a8dpxux2D8mxxKKEDSqkdWDrV8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3deb535d217ff8a2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLF0bFFd12PyxY15R3FDcYtiR1XouFeCj8db92wYc/V/Va36cwYHX+YflkSuoawmqnT0yDVgVPb3TTWb2iKTFOZVKtgDgIXcuglm0oIlCNhm4bX6izQDeybiap/6keQVtsJzwCjvmYeuZEx2Kj1c/V8EdFjFmNhaSE7YMMwqfC5CtK9eemng05HP3vqB6QtEOLNFfnX9E8X4Kc4reZ6D0iSBh8K7ElcLjVZdA+ZJb6wh1ucjHh4AcX/PZineA1Mn0WkszfT28dvhXA8XvCRUevJqP/Ukbc8PA2F90GhMwYl2S5nUdfx27Ue+JzuG8+CHhUORq8HUEt1jYVW6JNp7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6MmWJ7hHoqNYgOIHSmjWOBBxabBhm0rXpL0yo1/j+ps=;
 b=QAXoVNQf9mEksLJioFuwB3cJX95b7m+SocDUtTmy1RDtmjioQJGYYJkknobJJlXnPB2xtXEwuH45ToHX8uosIuot3rqaVAR9t0i/D0xxYQOJYhBGd5FKMi8GOGy33g8ufBRcuJs5Vv4SflSyTc80IR8ZEtYGcOEG0xe95FEn0oBnsiXJ1uctpIQQw5auLsAT5cxaanTaCSXYcqVNO9FaL6TIP33IscMdXKTuxGI7cAr9ZsUHqVqSCqkvxIRNX778rNm6ojSlauQYSj2M56N0b+60rLugSm8uoDQHiXiqAsONs2yjYNBNebmTFiQ80AT6LICk9xnxq5QKAB4m8ctQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MmWJ7hHoqNYgOIHSmjWOBBxabBhm0rXpL0yo1/j+ps=;
 b=D+0NiW4VScqPtsfbbpP5jKWEW0TewfTiCgxpJhh6SAviyUREvyiWd7n4WGW7841j7SmZYchzKhu828CE47viIvda1tJTdCow3j3Qb6wyKR8JNMOMpcpeZ2mR3dG9zGZ9CCdZZ3uMq9JnIQzU3a8dpxux2D8mxxKKEDSqkdWDrV8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Penny Zheng <Penny.Zheng@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] xen: fix broken tainted value in mark_page_free
Thread-Topic: [PATCH] xen: fix broken tainted value in mark_page_free
Thread-Index: AQHXr6c/8OBwQWPrCkW/tzMAglitdauv8D8A
Date: Wed, 22 Sep 2021 11:48:36 +0000
Message-ID: <94F4D68E-DF7B-4613-B03B-05C1CB1154DB@arm.com>
References: <20210922114432.1093340-1-penny.zheng@arm.com>
In-Reply-To: <20210922114432.1093340-1-penny.zheng@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6388dc97-e273-40c5-f806-08d97dbef2ca
x-ms-traffictypediagnostic: PAXPR08MB6365:|VI1PR0802MB2238:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2238D2C69786DB6A5BE2437A9DA29@VI1PR0802MB2238.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2089;OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4onHY0jXekkQNAbjHNdN9dc04xxDFD21ln+0hRWiG+kRKBX2w1yu42gKdeCTBEx/7wb23TcWGovuUylwKLx1UxqE/21mZVa6vi6BHqU4FbTzKf8xeSoo6/1etdzFxfd1n8uusMK4cFbIENiiGkFrmpYEqk7LK7ParI9sC0DPtkwlH2MOtuPB3TaTfbwjOrXRzy2sD9ianZUGcqF/Og59Q0v928yupIeAT9q8t4o/4jjh1ktRmGAJgPpUEKY6wZBJ6Pxa0fgNvxlc1gvimf8F9aBt0a9wcVo7R1dDu83p3L5aZdV2MdVacqLAv8QeWjYnlTzt3Yia021tr/MXxIyzBLuEFyOuH8GAMcjUV8djcmrMaxPvoHPOazlJXDnJpzWda4AKptvxAPsN8Dz1ru3qY2h6NP2UG32fP7I3ExlVAS89riZeJNssTGds/XIAFicjh7f1d8uRU/aMLFkJ8lFst3fywtoAuD/NrtD7w9HDbDHk/v9x8e6ow0sxuNL42BIBtk2a6k9NyHrARM7jEkkQugeSShG+0DaLO+1seagYj7WcNmFOtgk7t/QODLmUEzUM4YIuBPsfrkzj5JfuOktvNOBA8OVGx8awEFJVwBh5kZBtsH37SnrcrsNNOfinTuzBtmdoWYJYnLFqKUkTkLa5EiRUWvFVUxrdYF4Bx8NkK9IkD9JsLczk2oyh6bkMBSdVFeQQL6etndfdWMm7Lw4BguRqGjFwAeMf997KN4Tgl1M+DKbuw/m4z460GFblyaT4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(2906002)(8936002)(53546011)(6512007)(508600001)(38100700002)(71200400001)(122000001)(33656002)(37006003)(316002)(8676002)(6636002)(5660300002)(186003)(83380400001)(6862004)(86362001)(76116006)(91956017)(54906003)(38070700005)(36756003)(66446008)(64756008)(4326008)(66556008)(26005)(6486002)(66946007)(66476007)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A7041D5C1EFAB246B21D4348596DA3B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6365
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70206c1c-cd39-4c6f-c3cc-08d97dbee99f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	19ems8BqEnw56FpvtO34DGYuq707XZbnDsPijwOlPTbbRUn2O9OnGm7SI8qm2H1xX60TaKx8DuT3H09Lfyeyrk2Q65ES6wkOMCaSF1qOPx5QER2anticwZVjKzws2Qdq6+nZPjDpEs3FkrD7Di+RSFzgRQDz1vwAt2K1r2mhkwlxf/ent7Ju+2BU1mLhBPrYGFBjmvPQX61dixTHdJPMhiLAmMw7edyMTjzFWMJ1sdm7gfaHWZgGqlFMCQZpIHiVjxk41S5O7GirxeN4ILtOR1pDvW64QjZkfqqMpJ6I65kMQVK7eijJHL3wDR9i3h6PLnlyUJXS3ydKRVXmLPQPFrQfQf94d8t6SP0qdVmqj4bi2/m4fjKuKUEhVuhPy5q9PEiD36pFmVhAfMXHlaKrWsI537zBDF2JqyL4NsT5Lym4lMPxAUns9ind3yvlf8uc1bFj7enAvUiSwxk7utJCRXXhx7PD8kz1UDGDCDPmeV/xrf3RKPdm9MUJZFbDZAKKcsKd7Gjvq3/nHp6IMoYiX7Vt/r9PpJoAkPgohhleTVZjSlWwOmnlxW/iCntJLU6LKj656ga7CO4x9wUavelP53HLd5zR/7mJUh1Vo4p2vbHDSryZTPFBX1cppTQ1NvOsyFWLxHy+oDziB03jYdjHcRR6LSzY8tnHH5IgVRbwS5m6p4Rr0ZS0HzB4vTCc3u30Wg+hjV5B8e/6jaL44iJJpw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(70206006)(5660300002)(70586007)(316002)(6636002)(82310400003)(4326008)(6512007)(33656002)(37006003)(2906002)(54906003)(83380400001)(36756003)(26005)(53546011)(6862004)(186003)(6486002)(6506007)(2616005)(47076005)(8676002)(8936002)(86362001)(356005)(508600001)(81166007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 11:48:51.9712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6388dc97-e273-40c5-f806-08d97dbef2ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2238

Hi Penny,

> On 22 Sep 2021, at 12:44, Penny Zheng <penny.zheng@arm.com> wrote:
>=20
> Commit 540a637c3410780b519fc055f432afe271f642f8 defines a new
> helper mark_page_free to extract common codes, while it accidently
> breaks the local variable "tainted".
>=20
> This patch fix it by letting mark_page_free() return bool of whether the
> page is offlined and rename local variable "tainted" to "pg_offlined".
>=20
> Coverity ID: 1491872
>=20
> Fixes: 540a637c3410780b519fc055f432afe271f642f8
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v2 changes:
> - rename local variable "tainted" to "pg_offlined", and make it bool
> ---
> xen/common/page_alloc.c | 15 ++++++++++-----
> 1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 6142c7bb6a..5801358b4b 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1380,8 +1380,10 @@ bool scrub_free_pages(void)
>     return node_to_scrub(false) !=3D NUMA_NO_NODE;
> }
>=20
> -static void mark_page_free(struct page_info *pg, mfn_t mfn)
> +static bool mark_page_free(struct page_info *pg, mfn_t mfn)
> {
> +    bool pg_offlined =3D false;
> +
>     ASSERT(mfn_x(mfn) =3D=3D mfn_x(page_to_mfn(pg)));
>=20
>     /*
> @@ -1405,7 +1407,7 @@ static void mark_page_free(struct page_info *pg, mf=
n_t mfn)
>     case PGC_state_offlining:
>         pg->count_info =3D (pg->count_info & PGC_broken) |
>                          PGC_state_offlined;
> -        tainted =3D 1;
> +        pg_offlined =3D true;
>         break;
>=20
>     default:
> @@ -1425,6 +1427,8 @@ static void mark_page_free(struct page_info *pg, mf=
n_t mfn)
>     /* This page is not a guest frame any more. */
>     page_set_owner(pg, NULL); /* set_gpfn_from_mfn snoops pg owner */
>     set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
> +
> +    return pg_offlined;
> }
>=20
> /* Free 2^@order set of pages. */
> @@ -1433,7 +1437,7 @@ static void free_heap_pages(
> {
>     unsigned long mask;
>     mfn_t mfn =3D page_to_mfn(pg);
> -    unsigned int i, node =3D phys_to_nid(mfn_to_maddr(mfn)), tainted =3D=
 0;
> +    unsigned int i, node =3D phys_to_nid(mfn_to_maddr(mfn)), pg_offlined=
 =3D 0;
>     unsigned int zone =3D page_to_zone(pg);
>=20
>     ASSERT(order <=3D MAX_ORDER);
> @@ -1443,7 +1447,8 @@ static void free_heap_pages(
>=20
>     for ( i =3D 0; i < (1 << order); i++ )
>     {
> -        mark_page_free(&pg[i], mfn_add(mfn, i));
> +        if ( mark_page_free(&pg[i], mfn_add(mfn, i)) )
> +            pg_offlined =3D 1;
>=20
>         if ( need_scrub )
>         {
> @@ -1517,7 +1522,7 @@ static void free_heap_pages(
>=20
>     page_list_add_scrub(pg, node, zone, order, pg->u.free.first_dirty);
>=20
> -    if ( tainted )
> +    if ( pg_offlined )
>         reserve_offlined_page(pg);
>=20
>     spin_unlock(&heap_lock);
> --=20
> 2.25.1
>=20


