Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E31E77DDBA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584265.914773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD9q-0003Wq-94; Wed, 16 Aug 2023 09:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584265.914773; Wed, 16 Aug 2023 09:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWD9q-0003UU-5f; Wed, 16 Aug 2023 09:49:42 +0000
Received: by outflank-mailman (input) for mailman id 584265;
 Wed, 16 Aug 2023 09:49:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qWD9o-0003UM-Rq
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:49:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 371d1242-3c1a-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 11:49:38 +0200 (CEST)
Received: from DU2PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:10:234::28)
 by AS2PR08MB10012.eurprd08.prod.outlook.com (2603:10a6:20b:64f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:49:09 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::43) by DU2PR04CA0053.outlook.office365.com
 (2603:10a6:10:234::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 09:49:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 09:49:09 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Wed, 16 Aug 2023 09:49:08 +0000
Received: from f6ef817e9f6e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3004EC43-2F1F-4B82-84FC-744B2D653C1A.1; 
 Wed, 16 Aug 2023 09:49:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6ef817e9f6e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Aug 2023 09:49:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB5976.eurprd08.prod.outlook.com (2603:10a6:20b:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 09:49:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:49:00 +0000
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
X-Inumbo-ID: 371d1242-3c1a-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaXkKphKU9/8OL0KUl8QhLizANHJfvy2X5/gVs5CEK0=;
 b=e0DVw4pN0l/MnJunVcsOyAeJliDZgm3cdLeZaOipS+9Y3r/zh2NeE6J1YfERZDigr3ujDHPukR+vipIINQE3WLlvLo9YERK5F7hxsYDenvH5D/0l5ZL2V/mX4z0tZoC9sj5qW2vGs4xwZfPitaiyL+hC9fqpact8So9K879o/Io=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 380899ca6fc7bc0a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnOaM3HuXUK83JOoQR5thnwXQK60sAUsr1V+085L+PlWOq7Q0w8Wa6rfCRErU1y6lStMAEHEF+ZoXIL2pB3s6pxBQ7F9BM5WpfWn+mJ19VhrzkYUpKmlI/dPxVMQ8YciOmBmBxUXpBCF+tM/fhg0F6xHb168GJskiVM7FdbV7UMvatOiP8zrIYE1usCIJ0zDwiKL06E9NMTyYos/BnvPAskBAwqKyVE15qtKaxhYLWcUoPieTujExY8ivuMTDp91J6b1wnTBtuqq/xb55pLpPdV/sMO4i6c1imx9rMaFQISIcTnlhMJOSruEg7DRlqe24utWrCJ8/GxTM1C+YMIxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaXkKphKU9/8OL0KUl8QhLizANHJfvy2X5/gVs5CEK0=;
 b=B6PwQXmtgO8ow6EOy6VWtWSQUTmuib2A4cETuCwQOLOs14ZkOfUmMSvJU6vhdGQGBxF8nTCqoWfINGuGRw61IIxzIH2cyGDqjNeXAotZdmE8uD/sOv46qnabswulASeDOkcMBc/zx2tprCg3NAmMporzR6waQzuZPJRSj9UBWZQ6NeXnf7n8tXU4dVu7c4IryeIC4bI0BVJBgruU0/DJBgWgA7Iafh3vo1/1qUV2GJoXL4J/37BwqT3/oKGA0R/7lF9YY9Scm2T1ivx3N+uGBLWGHIWP8lyMpgE0tB3kwua1mnV2oo0zGz3Vn5ZVhqDV4wtvbzOviko79WV0S9gjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaXkKphKU9/8OL0KUl8QhLizANHJfvy2X5/gVs5CEK0=;
 b=e0DVw4pN0l/MnJunVcsOyAeJliDZgm3cdLeZaOipS+9Y3r/zh2NeE6J1YfERZDigr3ujDHPukR+vipIINQE3WLlvLo9YERK5F7hxsYDenvH5D/0l5ZL2V/mX4z0tZoC9sj5qW2vGs4xwZfPitaiyL+hC9fqpact8So9K879o/Io=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v11 12/14] xen/arm: ffa: list current limitations
Thread-Topic: [XEN PATCH v11 12/14] xen/arm: ffa: list current limitations
Thread-Index: AQHZw6jH5M+sc3fVMUebNCU8zLjNxq/sxmSA
Date: Wed, 16 Aug 2023 09:49:00 +0000
Message-ID: <08874731-544D-4893-B93D-5F478DE195C1@arm.com>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-13-jens.wiklander@linaro.org>
In-Reply-To: <20230731121536.934239-13-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB5976:EE_|DBAEUR03FT040:EE_|AS2PR08MB10012:EE_
X-MS-Office365-Filtering-Correlation-Id: f05b4c50-d6ec-4d5b-f238-08db9e3e09b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XVHXyEA/YAKQoqs2Fph3n5WYVqkBP0nh6yxerH+pK3dg5uSHo0l7DYesZ/WsiydEiKhqbv0MxKmL/W2/L3pF3eUOJEn/E3zjSXAoHLOD7H67M5NZ8C67Us/pQIu0r6C/BzIcTWqk9OxB0/h+k1/W7oLTC1E+PsFNi1TEaRDLi2PGhSZHcM1UYWiMMv9kiAbSFJXzgQQ1Nm7tJ1mayTzKg2t1aU17UiEK36OieQo20Bbty7V00dKZ9BExd7wdA5yzk6FPqliNp+9OfSADV23fl3b4cuZj5f2B5tXGKV3IJIV7ha0twigr64ApT17oc0XjdPwNSQgBkTAENMXkJXMZNrFxcgFxVRWJJV9acq2al4dUqSLnOFvhvXiL/Lkf0ZT9Fv0rn9es1WiaGQc3CALDqaVnOfJpRVDJMt8m+T+0yCFdlzajiIj9KyFANhCnLh4412vCekm9FP6+Q9v5pPJgFrMcSahiRnLFXiq1z1VFHW1+s+U2Z7ggJu8U//C/Zec72oSMq2BZqydPi46HtCQsr3ntyjmIug1m4cyrfXHyJsnanzXL6CS/I5zyETMNW7CGNObymv+1aqAIRoU9Cma7RE4scWQ5uCpbAByWZ3Xq1vE2q7PzrVsFgPqQqgXgXaLlaxYl4p1aIQUyFgVXFNvG9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(71200400001)(64756008)(54906003)(66446008)(76116006)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(966005)(91956017)(6916009)(5660300002)(2616005)(83380400001)(41300700001)(316002)(53546011)(8936002)(4326008)(8676002)(122000001)(38100700002)(38070700005)(33656002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D87B94664253E1499D80ADA13ABF33A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5976
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	58a97235-9778-451a-e94d-08db9e3e044c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JUQhyw/IIC1mKDGCuH+du8kHZJuSXFxU3Z+3KOUqwRodvvg5/Ve/0b6g/RE6QsrvHNumraA96jxHfkvQM01+qX3KQCDR3KZxxbvcgWxaKla9xF5nuMt5gL9kInd9f9CMND8D1ujz9Gp8UEd8JjuMHoGdtm64+H1wJmOY4SLzlE5A0bV1lR0wR/HTmcY/WWjp1vXoRjsn0w2sce4hse1HsvmTHh7ma5tBi7vX4CiykXWuVHDZAB/aq2IeB2IVL6XJMP+aBIEhiXArwjEk4x8FZa7tCnTajowLXW09NcO9mC4BoW7jk51Rd5ucgGZpi8yBPjUIlhSXqrE2ARAgvPXN808/xBUSovbu/F/8LhSIg+YL1sqZ90YpVE6o4wxntYYYhr6JpeB3NZfJICdss6O/o+34S3XzCDVr5QgwAjXvdyW0ozThk6DpqWsCLtsNABJ7tmOtGrjR+TzpeEZpBgus33SB6jwZOQkTBYGywZxTo5hjsAZk2U1gKYcb1brzhJxdU82S85kYEUXK2855FeKkEPRJLlGQ843zGcLQG1nwPZIk2a+oiL4M3q603YF027z1XhBsjko4103VgC/H5z/TvqghsLiw9wMw6+RO1nRQKl5lXaP4WrUzWvmrz9PwAWwIdK8HDu4Ad0GpKjjyzjxQxOQkcf58HXm026EacnwpnYYREOM7mphNX3e2Q1QUfdRhCSGnSVBdQiw6hp3LWazI9lfvFKR4GFtCk81+jyAl4RU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(1800799009)(451199024)(186009)(82310400011)(46966006)(36840700001)(40470700004)(54906003)(316002)(356005)(82740400003)(81166007)(70586007)(70206006)(966005)(36860700001)(41300700001)(5660300002)(47076005)(8936002)(6862004)(4326008)(8676002)(2906002)(40460700003)(83380400001)(26005)(40480700001)(478600001)(336012)(86362001)(6512007)(53546011)(33656002)(6506007)(36756003)(6486002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:49:09.0955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f05b4c50-d6ec-4d5b-f238-08db9e3e09b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10012

Hi Jens,

> On 31 Jul 2023, at 14:15, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds comments with a list of unsupported FF-A interfaces and limitations
> in the implemented FF-A interfaces.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> v10->v11
> - No changes
> ---
> xen/arch/arm/tee/ffa.c | 31 +++++++++++++++++++++++++++++++
> 1 file changed, 31 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index eb4a58fec470..cfbabec81dd2 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -13,6 +13,37 @@
>  *                https://developer.arm.com/documentation/den0077/e
>  * TEEC-1.0C: TEE Client API Specification version 1.0c available at
>  *            https://globalplatform.org/specs-library/tee-client-api-spe=
cification/
> + *
> + * Notes on the the current implementation.
> + *
> + * Unsupported FF-A interfaces:
> + * o FFA_MSG_POLL and FFA_MSG_SEND - deprecated in FF-A-1.1-REL0
> + * o FFA_MEM_RETRIEVE_* - Used when sharing memory from an SP to a VM
> + * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring ownersh=
ip
> + *   or access of a memory region
> + * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
> + * o FFA_MSG_YIELD
> + * o FFA_INTERRUPT - Used to report preemption
> + * o FFA_RUN
> + *
> + * Limitations in the implemented FF-A interfaces:
> + * o FFA_RXTX_MAP_*:
> + *   - Maps only one 4k page as RX and TX buffers
> + *   - Doesn't support forwarding this call on behalf of an endpoint
> + * o FFA_MEM_SHARE_*: only supports sharing
> + *   - from a VM to an SP
> + *   - with one borrower
> + *   - with the memory transaction descriptor in the RX/TX buffer
> + *   - normal memory
> + *   - at most 512 kB large memory regions
> + *   - at most 32 shared memory regions per guest
> + * o FFA_MSG_SEND_DIRECT_REQ:
> + *   - only supported from a VM to an SP
> + *
> + * There are some large locked sections with ffa_tx_buffer_lock and
> + * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> + * around share_shm() is a very large locked section which can let one V=
M
> + * affect another VM.
>  */
>=20
> #include <xen/bitops.h>
> --=20
> 2.34.1
>=20


