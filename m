Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3427474EF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 17:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558484.872627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhc8-0006ks-HK; Tue, 04 Jul 2023 15:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558484.872627; Tue, 04 Jul 2023 15:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhc8-0006iW-EQ; Tue, 04 Jul 2023 15:06:48 +0000
Received: by outflank-mailman (input) for mailman id 558484;
 Tue, 04 Jul 2023 15:06:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGhc7-0006iQ-Hb
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 15:06:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64613b99-1a7c-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 17:06:45 +0200 (CEST)
Received: from AM6PR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::41) by PAXPR08MB7335.eurprd08.prod.outlook.com
 (2603:10a6:102:220::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:06:38 +0000
Received: from AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::c9) by AM6PR01CA0064.outlook.office365.com
 (2603:10a6:20b:e0::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 15:06:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT048.mail.protection.outlook.com (100.127.140.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 15:06:35 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Tue, 04 Jul 2023 15:06:35 +0000
Received: from c17341142ecd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06E7BC79-D510-41C9-8947-F1EAE4B343A8.1; 
 Tue, 04 Jul 2023 15:06:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c17341142ecd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 15:06:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB5961.eurprd08.prod.outlook.com (2603:10a6:10:203::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:06:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:06:24 +0000
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
X-Inumbo-ID: 64613b99-1a7c-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FU32I2cFGzf+P1C8PpjK9M/cr0oKEjt/SRWxHv1gNHI=;
 b=cBb/LtmpyO1l9kXjNxIUAnX+QiDXsRB3xNOvmvaf9LdMymGCmj0J78ghFhrMGUCj9I0OpiJFfXzcLXnOaKtN+YqRBxpbOZiaYMqM/P/LLtetCbWyiDba92Aj097j74xcwOzQDOBJ7CyNN4kQnfn4S4jh3tvriIwEF9EtrYR50M8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70e0c79b1e6a516f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bs6QHnMoLAGCEJgczTAZpxoMwNBi4QraMjQUFNff4a4ba7GyTSUhH/AsWDQaKpaRRiROjMt2Sqjp5rw7JZ4GIlxKVgAlf4jHqbivtXoP6csegLsam8BAtz6NKHXQxGGmXGX4cLgX9X20UReqC96Ne49fPcuVtKdv+dpgHHhprG1/g1Si3Ndz0E8iUfVygU3+6auM3mVUQOYQG8xKg8dNCjKGXIN2WN+Zx6O92CkC+s0eSUZittfjyKgmUp/WPo1J9sQNMVF2pIsMU2URt8sCXS0n/VHw+pASqtl4M1ag3DTQvA+wlEtfS8Vcnm068h1FikN+qwsY9ch2srjXCDEhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FU32I2cFGzf+P1C8PpjK9M/cr0oKEjt/SRWxHv1gNHI=;
 b=WB5Wayxadwfl/yZHtwhePJV6HRyg8NL/iUEFl3OaK8ZwXrIz+Ij78Xf8mHjo06sQ0hquldGiW34dWqQy70JpL+LN2S8ANO5fTJ92fxW/LyShlw3XuZJfJWyTY0YfQ7y/QmTDy0zTvF7wS9IfX4CmGWUtQqNdW7hulfFgps7JoqVm1PEefDW+bD6ABx6es+IeCh2CA7dahI1LSBG6yLR9Y1C8XjuYXAQ4Px2b8CwTytdiIK8lXWiVer6gNjHHJhoR7A5fiZntWWr498CzZ4bNGtPye6e1Z3WY3B9VE6X0LUu97DICikFTI2VcSnptmS0q3j29Zlfhn0xIDLJxWlQxMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FU32I2cFGzf+P1C8PpjK9M/cr0oKEjt/SRWxHv1gNHI=;
 b=cBb/LtmpyO1l9kXjNxIUAnX+QiDXsRB3xNOvmvaf9LdMymGCmj0J78ghFhrMGUCj9I0OpiJFfXzcLXnOaKtN+YqRBxpbOZiaYMqM/P/LLtetCbWyiDba92Aj097j74xcwOzQDOBJ7CyNN4kQnfn4S4jh3tvriIwEF9EtrYR50M8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Henry Wang
	<Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/7] xen/arm: page: Consolidate write_pte() and clarify
 the documentation
Thread-Topic: [PATCH 4/7] xen/arm: page: Consolidate write_pte() and clarify
 the documentation
Thread-Index: AQHZos+4vw3nnvONG0uaFwZBq/1j9K+pzIYA
Date: Tue, 4 Jul 2023 15:06:24 +0000
Message-ID: <49DB9A64-FB34-4EAB-9E6D-3C445B1790E4@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-5-julien@xen.org>
In-Reply-To: <20230619170115.81398-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DBBPR08MB5961:EE_|AM7EUR03FT048:EE_|PAXPR08MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c9ca3d-468e-4831-b9b2-08db7ca042ba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SP8Q72wI619PZqFV6foA1kqRtkC2B4KoRmS2c66OW6D+KI8mD7RAHLDjjfBfQw9ENcrs91z8jHwEWVCUiu4XNt4s6PY9POZtzbmquC9guEdXLPpd44k0Tb4fL7dmU3Magn58k1nh1qE9hwxNYQtbqveTH+QxrhUQEMChNWNYqG0FJW4Lqnwyerw9lwHKUrZTtjQzeOECsPCyJHTuQqJQW0AqQu2ULHTSsEThFu01r2ggfS7C+obBHM815x9SIfr5/BU5gljuBiD1RwSZLNGKfHKj47EShCeaP0oD1uDOm/H4vjRnZNVuPazEbaesnEaSZmlPPvfAwekavTrY9DflZsfjdcRmmjGLrT5P1ZkSpmNblsrff4b4yYI1Ki4H/X9qRtRbCefKEIhQhr6EdKZOD1H2gX8BlyBVBNoHgaPiC7xCyRi0Wql7gYQgZcZdmMlybqRRKnt1g1GRWg2mMGDNun2/tFuBCC5OXKUbX5TTuaWwf2h5W7XPZDnr4qGN3jCDijyIz5gFRiUfMqWansm4MYKGtSOnCHYi1Yq60ieRNFfoAEQcF9ie1VjWtrGISKiY7qyB2P6TJONAtJAKqOxwRCIiKrbDjw9z+7F+TwyhZTkZ4vMmHVfQeZXLuqPNas49LKwNvD4bpmMA39I3TGIUTg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199021)(38100700002)(33656002)(2906002)(71200400001)(6486002)(8936002)(38070700005)(8676002)(54906003)(36756003)(41300700001)(5660300002)(478600001)(76116006)(6916009)(66946007)(66556008)(66476007)(64756008)(53546011)(91956017)(66446008)(6512007)(186003)(6506007)(86362001)(4326008)(316002)(2616005)(122000001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D41CCCCF03F39A4FAA7DE7642910A424@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5961
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5429e24f-18a2-4d7a-16ed-08db7ca03c34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9y+fj45XcbaR58tqI+IfxeBRARnGhfgc5wNBiLuNcpgnbd/O129mn4k1+uh9EeFd2JiIkxrMi5tJ1P5BR0aV8mJm31duABdIjiwJyT0btNoUL9wYQMUysaKczpSQ5zFywnig48o7JEv31qIYSkAfPKmEctzgdAlspbnmvYHN2WIQcq2dMHsVLgVxKUcNY/ESruD9v9YJ7RPNb22pXXX54EolOcnZwuHRASirsnq5WCOksQxE1cq85iEv6sPId/j1cvuwWsgkCahOvyPIBfg8ik+J+uqEtMQaHlsyDla0X7mCB+RhjXWrVn+vNsX4H23snkfWudzlxQUorRPRbpWx9pBW5TgoZ6RlEsBHrfj7/aRcmMK+96znHNVJ2PKj++mJhfGztSFsaM7Ntj1xrDrWtfe//oclqSlmU82o+FyRf2j2bTFyzhpVmSvKuMgFIvtPeyNPtitbk84G2EHhEgVd2ovJjInTA+iNmHDSNNxA+RYl9Z2mqNowy678KY0cuM/C14gHkEyHdAvxe3aVVLlvB+Ims9n5vENs5wq0KMiJYxSkZGZwHctPxu4SqReanDccRhuO8XXoHuF8SSaHghW8fsC629QtvtdJR9SpBePbAR+Xn6yGW5e4n28BFizJwukcS1JfIqTsBi4XWtD7pD+67TMIPQ179FgOm5iglZMUq//1xDqVH6WV7MExGbtHegOUjDNfNcvtjKs3Fu/SXxNQW+iYNtFn2inLQ0xW+T6uCpUIP2K/w9YAlFGghyiADNOX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199021)(40470700004)(36840700001)(46966006)(54906003)(2906002)(478600001)(26005)(41300700001)(86362001)(6486002)(33656002)(6862004)(8936002)(8676002)(5660300002)(36756003)(316002)(40460700003)(70586007)(70206006)(4326008)(6512007)(53546011)(6506007)(82740400003)(356005)(40480700001)(81166007)(2616005)(186003)(83380400001)(82310400005)(336012)(107886003)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:06:35.8421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c9ca3d-468e-4831-b9b2-08db7ca042ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7335

Hi Julien,

> On 19 Jun 2023, at 19:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The implementation of write_pte() is pretty much the same on arm32
> and arm64. So it would be good to consolidate it as this would help
> to clarify the requirements when using the helper.
>=20
> Take the opportunity to switch from assembly to call macros. Note there
> is a difference on arm32 because the option was not specified. But this
> meant 'sy' (system wide).
>=20
> Futhermore, the requirements for the ISB is incomplete. Per the Arm Arm,
> (Armv7 DDI406C.d A3.8.3 and Armv8 DDI 0487J.a B2.3.12), DSB will only
> affect explicit accesses. So an ISB is necessary after DSB to ensure
> the completion. Having an ISB after each update to the page-tables is
> probably too much, so let the caller add the instruction when it is
> convenient.
>=20
> Lastly, the barrier in write_pte() may be too restrictive but I haven't
> yet find the proper section(s) in the Arm Arm.

I do not think we will find any proper section for that in the Arm Arm as i=
t
depends on use cases.
In ours we might have the page table shared among cores so I think system
is the way to go.

>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ----
>=20
> I am a bit split on whether we should add an ISB in write_pte(). It
> would make easier for the developper, but would likely force a pipeline
> flush too often.
>=20
> It might also be possible to drop the ISB (and even DSB) when updating
> stage-2 PTE (Linux already does it, see 120798d2e7d1). But I am not sure
> this is worth it in Xen.
> ---
> xen/arch/arm/include/asm/arm32/page.h | 16 ----------------
> xen/arch/arm/include/asm/arm64/page.h | 11 -----------
> xen/arch/arm/include/asm/page.h       | 17 +++++++++++++++++
> 3 files changed, 17 insertions(+), 27 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/arm32/page.h b/xen/arch/arm/include=
/asm/arm32/page.h
> index 715a9e4fef48..6d1ff0636ce3 100644
> --- a/xen/arch/arm/include/asm/arm32/page.h
> +++ b/xen/arch/arm/include/asm/arm32/page.h
> @@ -3,22 +3,6 @@
>=20
> #ifndef __ASSEMBLY__
>=20
> -/* Write a pagetable entry.
> - *
> - * If the table entry is changing a text mapping, it is responsibility
> - * of the caller to issue an ISB after write_pte.
> - */
> -static inline void write_pte(lpae_t *p, lpae_t pte)
> -{
> -    asm volatile (
> -        /* Ensure any writes have completed with the old mappings. */
> -        "dsb;"
> -        /* Safely write the entry (STRD is atomic on CPUs that support L=
PAE) */
> -        "strd %0, %H0, [%1];"
> -        "dsb;"
> -        : : "r" (pte.bits), "r" (p) : "memory");
> -}
> -
> /* Inline ASM to invalidate dcache on register R (may be an inline asm op=
erand) */
> #define __invalidate_dcache_one(R) STORE_CP32(R, DCIMVAC)
>=20
> diff --git a/xen/arch/arm/include/asm/arm64/page.h b/xen/arch/arm/include=
/asm/arm64/page.h
> index 0cba2663733b..4f58c0382adc 100644
> --- a/xen/arch/arm/include/asm/arm64/page.h
> +++ b/xen/arch/arm/include/asm/arm64/page.h
> @@ -5,17 +5,6 @@
>=20
> #include <asm/alternative.h>
>=20
> -/* Write a pagetable entry */
> -static inline void write_pte(lpae_t *p, lpae_t pte)
> -{
> -    asm volatile (
> -        /* Ensure any writes have completed with the old mappings. */
> -        "dsb sy;"
> -        "str %0, [%1];"         /* Write the entry */
> -        "dsb sy;"
> -        : : "r" (pte.bits), "r" (p) : "memory");
> -}
> -
> /* Inline ASM to invalidate dcache on register R (may be an inline asm op=
erand) */
> #define __invalidate_dcache_one(R) "dc ivac, %" #R ";"
>=20
> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/p=
age.h
> index e7cd62190c7f..ea96983ab976 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -126,6 +126,7 @@
> #include <xen/errno.h>
> #include <xen/types.h>
> #include <xen/lib.h>
> +#include <asm/atomic.h>
> #include <asm/system.h>
>=20
> #if defined(CONFIG_ARM_32)
> @@ -237,6 +238,22 @@ static inline int clean_and_invalidate_dcache_va_ran=
ge
>             : : "r" (_p), "m" (*_p));                                   \
> } while (0)
>=20
> +/*
> + * Write a pagetable entry.
> + *
> + * It is the responsibility of the caller to issue an ISB (if a new entr=
y)
> + * or a TLB flush (if modified or removed) after write_pte().
> + */
> +static inline void write_pte(lpae_t *p, lpae_t pte)
> +{
> +    /* Ensure any writes have completed with the old mappings. */
> +    dsb(sy);
> +    /* Safely write the entry. This should always be an atomic write. */
> +    write_atomic(p, pte);
> +    dsb(sy);
> +}
> +
> +
> /* Flush the dcache for an entire page. */
> void flush_page_to_ram(unsigned long mfn, bool sync_icache);
>=20
> --=20
> 2.40.1
>=20


