Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5803747496
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558474.872607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhSy-0004bl-Bm; Tue, 04 Jul 2023 14:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558474.872607; Tue, 04 Jul 2023 14:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhSy-0004Z0-7m; Tue, 04 Jul 2023 14:57:20 +0000
Received: by outflank-mailman (input) for mailman id 558474;
 Tue, 04 Jul 2023 14:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGhSw-0004Ys-8D
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:57:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1174e8e7-1a7b-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 16:57:17 +0200 (CEST)
Received: from DB8PR06CA0042.eurprd06.prod.outlook.com (2603:10a6:10:120::16)
 by PAXPR08MB6480.eurprd08.prod.outlook.com (2603:10a6:102:155::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:57:12 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::1a) by DB8PR06CA0042.outlook.office365.com
 (2603:10a6:10:120::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Tue, 4 Jul 2023 14:57:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 14:57:12 +0000
Received: ("Tessian outbound c63645f235c1:v142");
 Tue, 04 Jul 2023 14:57:12 +0000
Received: from c98421ae3202.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A874FAA-909A-4BAE-A394-3CD879AC7C5A.1; 
 Tue, 04 Jul 2023 14:57:01 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c98421ae3202.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:57:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8452.eurprd08.prod.outlook.com (2603:10a6:150:84::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:56:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:56:59 +0000
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
X-Inumbo-ID: 1174e8e7-1a7b-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3zMTeCLUtM1cEkUBaoYNInhOtFMlJXgNjM4UM4FfTk=;
 b=Nj2sroJzc8K6gysG1kLxwg4ezx6aAaSC2ieRefuiBhJBwO4WgDzBuZkc+iR7Dqvr/b9X+c5H/7h2R5/pu2Ydqc+fm9Pe4ZoXtCJu7yzNr9jzztLpio/zmLTtRoW/ut6ryr6rjUzz+Ql8m0Ye/mbs+hy8ZIHMnOLBksABhRcyPgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b81cce9aab55068
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsQWswdpaTupvJYAxEHhIbDSgVfQBhlbaMZ+D7QI+kMhNTQ+4wqNrPzWTphtiprJqpYBG+0ZvPIf1GyQuaeXYwrnzCC/sYd/+SMJ39DiEMcsZW5UUu6nhv0UNyV2df8uACzKCYVPzYiWtQPJdWTroDeOqOwZT85Wx9ZZuCjTklwYw/+pak2rVrJOpeOdiwfOAJ96aU654hFKU9BqjdbYzMgCwZ8LHitv5J6EsqVeX4oKMWkqm4iCv5pFLvRGEX0NyEOv0Tv9RhzelMj/1l3vglCajfpo0p9u7K7LkTw7jFnKvVV7X4b3Mg4icJBkBHwEf/rX2y9hr0EYt6+6qqvQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3zMTeCLUtM1cEkUBaoYNInhOtFMlJXgNjM4UM4FfTk=;
 b=odFkFRYK56ovLcJlI8qE9TuDFsmi8d8OC4P4I9SMrzWqYlf9i3jA8Giszpw+1Ejl51ouZZAxVPGDJ3mRggFjgUVJZCJ5T6nCxYRiJhCEONBegg8+Em2B/Gq6nN5NrmhO1tgcc/YQmRcJEA0Wfnkg9LXmFv60bUHyh9N4HwKoqEwj+Ujqr9nrxCjIY3dTTYNT2OVvc+ikvPo9GdWWKGP5MXJZscHnsQcqNv5Z/s2kPLg3gxLYGDgqKeOIfaGjLnRcJ7T32PuZN+3IBt74EG4B37daVgai5ZL1MWoPBccp70KPjOIFvztsvahs5Cy/an/hBLEKzobB7UGIJdAwJM+l+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3zMTeCLUtM1cEkUBaoYNInhOtFMlJXgNjM4UM4FfTk=;
 b=Nj2sroJzc8K6gysG1kLxwg4ezx6aAaSC2ieRefuiBhJBwO4WgDzBuZkc+iR7Dqvr/b9X+c5H/7h2R5/pu2Ydqc+fm9Pe4ZoXtCJu7yzNr9jzztLpio/zmLTtRoW/ut6ryr6rjUzz+Ql8m0Ye/mbs+hy8ZIHMnOLBksABhRcyPgI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Henry Wang
	<Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 5/7] xen/arm: pmap: Add missing ISB in arch_pmap_map()
Thread-Topic: [PATCH 5/7] xen/arm: pmap: Add missing ISB in arch_pmap_map()
Thread-Index: AQHZos+1XQowzy5c7k+9HVrcbAjL6K+pyeQA
Date: Tue, 4 Jul 2023 14:56:59 +0000
Message-ID: <860295F2-1737-4D99-BFAC-C981ADA9AEB7@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-6-julien@xen.org>
In-Reply-To: <20230619170115.81398-6-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB8452:EE_|DBAEUR03FT032:EE_|PAXPR08MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9b2757-6f0f-4aec-24f4-08db7c9ef2be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +kkvgpOSEn2tkTJGOMrhssg1Fh5qJ4h9lw+OO5JB/7+mN76Eihd6CnsNh5mCQMZxumOQjPMWZqkydwk42o77pw+bv6Zoqq7JddLEGh6SrQmmZiA6xpgNLIuOmuSntd2uWW+sRycABl1GnUXIUofhzFpI6UZ1Wkd8ptn+RxA0T24WkR1RHwrGbkCXix9JM2at/RCW5s4qM0nZA8z3F2f5xoYfXd7g0mwusEfCKvJbfwlvwgcI+XX3CqZhPFkXbv0K9O2CYWvTUd0+4S/0Qj8docWm6ROw2D1+IgrQ+vXhNs0kDERfJiu1QXLevKT6wwA5r7iGgUszJ4q3QGjJm2u2VZaVb1ci7rhrYz0Df7adbijgIijVNQgQZVwGpCOtiP7+JQv1XCb3YxKx95V9hmHXI9tfYdiIRvR8a6UbqNHnXkEgnjd4WutJJaAz5B//hJYfNJXzkHx8pYVRTf3Vjn1esYH23adGdk6kCEObOXHGGNTI9Ns1zkNrQhiBZpdJ7GzRp2CIPLhwx+aIPYwPjpmpMCs5Ju/yHPWuHb8pkdHfBOWy9wU+WQLIFmXqTZOGJHCiOsdOtME1yNv6smnVeZO17LsDmP3rShmAhJ+eV7Tn/U+B4ccwzdN0rW55L/7YtsB5++AuDdCnTDeMS3uzsK97kA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(4326008)(316002)(66946007)(64756008)(66556008)(86362001)(91956017)(186003)(6916009)(76116006)(66446008)(6512007)(66476007)(6506007)(53546011)(83380400001)(122000001)(2616005)(2906002)(6486002)(38100700002)(33656002)(71200400001)(5660300002)(478600001)(8676002)(54906003)(38070700005)(8936002)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0DC7FE4CADB7DF40BFE413748AD632F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8452
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b711e9e1-8ab6-4519-e661-08db7c9eeaf2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o/xxChuR594HJEBm/Mwn30qpR7wMvDodaTCpuDXz8tdH42YQrm3auEA2OmyHFeiQ7qbkkTP5REw2dcqSktFZER4ZeJQoeJOTSDhhvGBC5GQTPMfNQdX1myeQsQZeCWbEHO+pMRPwZhdSbUcgrfk00lM7ZARzMNToAXz95vU1u3rQWZ506Qv1r+4/7ejaf0KxHgTo5/mxqoRElKJ9/06+6OKHA9b6mmzcznSqKfZMyI2DCDrohwbED3x1e5EKlL06uOjRefwaym2cRMAi0klKG3DqHPgKGu6FsUcCUz+opPlz20XhtUnnW3+hJbX6KhM3OMRl+erIcK2aS7BAfZ87TRxuUk0I4gWFAIjLGh6Auk7tEe9IRhKy8iVhZQ+gskLJLbwP4LHVoVjF6Hp10nlhhmKUb5hS1w7w1P59DxdDBTeypKswVTVUKI/AnEnfKN+G7Yr79k/sPCcngZp93hPrENFyf2GqCMMlnFuLgTFXrQBC44PDPLegEOjz9SzhZNkrpH3YpbhLwBOdVgjuFaaJGug5sBlRNK/3aUxeMBuRx5lj5z/9q8SLAc2aID49rLE0DF1HIv2H6SpzVxdJwuPoC1oIzDZAGgtazgossXmHiUZhpvdPJLS86VihCTi5oxLoT/7CT36N+oeWYO2IiWCBk37zRd2PGBjN3lG1eGVmnIRdRkbifle9eyOPSeNnq5lCCpBBZlh/B256deIHZPfRG+84R5xMFHRgeO2Qmf8njRnlxn1ZBgc/K9IIpkT5gSR+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(2906002)(41300700001)(6862004)(5660300002)(8676002)(8936002)(82310400005)(33656002)(36756003)(40480700001)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(82740400003)(6486002)(70206006)(47076005)(316002)(70586007)(4326008)(36860700001)(107886003)(53546011)(81166007)(54906003)(336012)(83380400001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:57:12.1969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9b2757-6f0f-4aec-24f4-08db7c9ef2be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6480

Hi Julien,

> On 19 Jun 2023, at 19:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm, (Armv7 DDI406C.d A3.8.3 and Armv8 DDI 0487J.a B2.3.12):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> Note that second sentence is not part of the newer Armv8 spec. But the
> interpretation is not much different.
>=20
> As the entry created by arch_pmap_map() will be used soon after
> pmap_map() returns, we want to ensure the DSB in write_pte() has
> completed. So add an ISB.
>=20
> Fixes: 4f17357b52f6 ("xen/arm: add Persistent Map (PMAP) infrastructure")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/pmap.h | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/pmap.h b/xen/arch/arm/include/asm/p=
map.h
> index e094d13dd282..bca3381796f3 100644
> --- a/xen/arch/arm/include/asm/pmap.h
> +++ b/xen/arch/arm/include/asm/pmap.h
> @@ -15,6 +15,11 @@ static inline void arch_pmap_map(unsigned int slot, mf=
n_t mfn)
>     pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
>     pte.pt.table =3D 1;
>     write_pte(entry, pte);
> +    /*
> +     * The new entry will be used very soon after arch_pmap_map() return=
s.
> +     * So ensure the DSB in write_pte() has completed before continuing.
> +     */
> +    isb();
> }
>=20
> static inline void arch_pmap_unmap(unsigned int slot)
> --=20
> 2.40.1
>=20


