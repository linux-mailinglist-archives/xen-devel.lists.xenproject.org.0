Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87AA7AF6F1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 01:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608583.947169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlHmr-0004Ud-St; Tue, 26 Sep 2023 23:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608583.947169; Tue, 26 Sep 2023 23:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlHmr-0004Sv-Os; Tue, 26 Sep 2023 23:48:17 +0000
Received: by outflank-mailman (input) for mailman id 608583;
 Tue, 26 Sep 2023 23:48:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQH+=FK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qlHmq-0004Sp-6L
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 23:48:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2800d300-5cc7-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 01:48:14 +0200 (CEST)
Received: from AS9PR0301CA0021.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::11) by AS4PR08MB7502.eurprd08.prod.outlook.com
 (2603:10a6:20b:4e6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 23:48:01 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::3c) by AS9PR0301CA0021.outlook.office365.com
 (2603:10a6:20b:468::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 23:48:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Tue, 26 Sep 2023 23:48:00 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Tue, 26 Sep 2023 23:47:59 +0000
Received: from c9836be2fcf7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 01C13A87-18FC-4334-A088-2AE378D5CF86.1; 
 Tue, 26 Sep 2023 23:47:53 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9836be2fcf7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 23:47:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7539.eurprd08.prod.outlook.com (2603:10a6:20b:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 23:47:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 23:47:49 +0000
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
X-Inumbo-ID: 2800d300-5cc7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmKFjOyR+a+zxzq+ABjzXiX/32MJGrpCwnaIr/9KQk4=;
 b=zej+Yjx038WoHGGeXjgeuUNWO7OO+w4zrnjr4MJfVliM2FeJuZWbQ+JJf3PKP++WS+GKbXHVxK39R3lx6IhoMXpdBnkU1xjLZZkFoSaVpD+vc7/ImxbOlmttbPU57DXMTyYp6g99ACdFaqQiG6YvnhDJZqE2jswItPupaIIYVNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2fb828b5e5855cdd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HK4lUZ8W/pTzemjWZDEx4uA64yPp5Q6TgZGqnIeFoXJN1PW4jsQdl6FF4LK+fNJh/6KAdOldEN4YHfJ5YKXi1f9a319fXsg59mShwqOCqbH+69NIJtq8z9B+CPDKPY3Ch+3sMnAvfluXREgXHJGXFkvuID7ty0/FcnsguGOtQewBPFg1aD6k3N2rjI3tkvH51z2vzpCHnQJsLDHp6nIIGczNGniussL1JtH5UWjPt1sDDrpv5d5qVKEzD/RyXfQt+duyb4QI8huFh67B5pAB9KsGwF6b3y2MHONg/XqGtqWDIfw9H2CLeqIjPsKpgei8cHOB0gyPrpFf1fi3qacbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmKFjOyR+a+zxzq+ABjzXiX/32MJGrpCwnaIr/9KQk4=;
 b=UZC4ATzIrSrtZBBOI5KeuXvjmj1KV5Pl5scSTqhoi/1xa5DLGzbmcVtQ18CRdACA+e7Fszr76rl/prK2J51SN8JVMn30nkj4eiiLe8SuCWYjh3eg9B9rXouJ+FJ+/6fGjTCnXCSFo0MsFMColaicrySTr/BeeN3L2cqOJV+HCJoYBuSsvlth2q0/CoswxKA/6bF2hFsLi5QbYn7F4CNCpK67Yd5oLE9p+rko7uOMao36oi16AuaW0L2FFPu7l9v8aFYJJa3nUw4zC+01C4KiC23+MO4bL3xxDB6SwpWKEpAeoq9khyQRMMYcyk48kU+EYNXDaKe0wM8PzOA6aPJt5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmKFjOyR+a+zxzq+ABjzXiX/32MJGrpCwnaIr/9KQk4=;
 b=zej+Yjx038WoHGGeXjgeuUNWO7OO+w4zrnjr4MJfVliM2FeJuZWbQ+JJf3PKP++WS+GKbXHVxK39R3lx6IhoMXpdBnkU1xjLZZkFoSaVpD+vc7/ImxbOlmttbPU57DXMTyYp6g99ACdFaqQiG6YvnhDJZqE2jswItPupaIIYVNM=
From: Henry Wang <Henry.Wang@arm.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Thread-Topic: [PATCH v3 2/2] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Thread-Index: AQHZ8MpFWSy4Kouw2UKnWzY5oUxUlbAtxhQA
Date: Tue, 26 Sep 2023 23:47:49 +0000
Message-ID: <0D75C8E2-CB13-4523-852C-162845DD966F@arm.com>
References: <cover.1695767747.git.sanastasio@raptorengineering.com>
 <d16b2f8749b65e303f531776d303586336ef1729.1695767747.git.sanastasio@raptorengineering.com>
In-Reply-To:
 <d16b2f8749b65e303f531776d303586336ef1729.1695767747.git.sanastasio@raptorengineering.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7539:EE_|AM7EUR03FT059:EE_|AS4PR08MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ca0f9a-69d3-4947-aa95-08dbbeeb0445
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4rHWtYkm7rg0DMfBBEZe/bXCTncmJtNhRM+qMavh19gxW8J1umcMe549p4hfk4XX3feHJFUAP3PIj1q24LbDPdfNRDZD3NR/gfXEOLLbmI3tPm+KhQ9QRQa//66ReuPo9KIwpsJw1lFSIkl2bpT947n5bPDsNAKjP9M8NtIVYzbfU28JQuE6/udWX2XICzqbROU/29weL2SO78dmcrLrcmDIDy9ke0GP1pCtBdP3YBN5sRrW4f3VUkpVNq24v8sQ2wymCWsSVysMOdbxjE60H1K1jfmY1kxreOunSNArPQHy1GFmc6UZKTto3b5uddu6HFNuaYBxSGy4cHuANEMVGnIZ6gx6sDn7z+MFfubYe+b0x1lk3AZResL++bfjkGuEH2RD0/GkdyR+vSOmTJe/6eqAUSfF5TSJBw+NUMPsn5A5otTGlWTYlw/arVRukq09DAbzb02ji1dTaGo+NEk+y1Y/yLQVegY+irz+9aYQVAy8Tobuizah22FnRfTg97HjldJafTDdQvwHcHU2DB7vsgdj1xS71hFQR1Xq1LbLI9ZWtQvJZNuWM/otzPOJoGgG4vNqp7o0ubsGXZ+iUs9j3x6CFY9jFGNIFe87EoWKJGOZoD1kEuCaxY5cEFPqsmQv9b/n+vClYPIyKAMGjhh4zA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(451199024)(38070700005)(2906002)(83380400001)(38100700002)(6486002)(66476007)(6512007)(54906003)(66446008)(66946007)(64756008)(91956017)(66556008)(71200400001)(53546011)(76116006)(26005)(5660300002)(6506007)(8936002)(41300700001)(478600001)(122000001)(4326008)(316002)(6916009)(8676002)(2616005)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <851EE393CE931141855AD54FF2A5D84D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7539
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dbbbf579-890b-4eb9-72df-08dbbeeafdcc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8d4W2nhSTvuTGd9xcEibY844m2wnGYk3PmmznecyqJ6HZTSbmHBOn4Hl5kjmv9/I7JKPOTpgzaEu4BnW6xJ/Eyx3LJmcBGyXPDzyfAxKV9b7ITgyHxRNbcBiasRmSi9NxXc7L9WZeIADlGhel9wqtBzp3CN8Wv/b78gGfJM+ucCSwaYqLL1PUK9s1e3P1m1SzM/WecBRzifu+UaHMXXrBxDXHEcpBzEUH/cigmiLst0T1+ioA0AeyM5llqzAwsDrsGBhrfs56CkgMIfZXQPLSbI9QHkZJP6YjZR0PwJHBZJQlgM379rkZwLb/kzsXlc4xTrTx3JJcNenrkhnhz1zgIagjQNGXS8OoMkMpPZC75R2+6HNXN8XaWV/IH/1FGVFRGu2NV8YQlK7sRmkV9tKrZx/pfCrhGBd3OKbIJOagnhw/Yot7n15IxVuL+thet+fp2qQSdHh1aq/D4EU046IhovNioA8HsWDmxuZmSP/eTqQR443I7SGks4wW8GPnpuZKHOijlx2gAM3RX1BncgAbweQPfp22hbfSETM/fUYuQcPjEkU/ba3Pii2HF4b/vVE81i8GiEwGIJp0myMwKLhm5DPUAHEZsZfX9hfj/9JtbDEhmwfpeSFcykT/f9hlQwXbInkZNyXOLVWeiMC/8xh+26NjkPxf585lbFm+R7OEIYyg9L/b5/uhhQeJ79+CP5oPyB11xw5a1JDgL3mIWYmRELu7BYuYXm9zPV9wwNIab4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(46966006)(40470700004)(36840700001)(33656002)(86362001)(36756003)(40480700001)(6506007)(5660300002)(6486002)(26005)(53546011)(70206006)(70586007)(6512007)(2616005)(336012)(316002)(6862004)(54906003)(478600001)(41300700001)(4326008)(8676002)(8936002)(47076005)(2906002)(40460700003)(82740400003)(356005)(36860700001)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:48:00.0854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ca0f9a-69d3-4947-aa95-08dbbeeb0445
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7502

Hi,

> On Sep 27, 2023, at 06:37, Shawn Anastasio <sanastasio@raptorengineering.=
com> wrote:
>=20
> When building for Power with CONFIG_DEBUG unset, a compiler error gets
> raised inside page_alloc.c's node_to_scrub function:
>=20
> common/page_alloc.c: In function 'node_to_scrub.part.0':
> common/page_alloc.c:1217:29: error: array subscript 1 is above array
>            bounds of 'long unsigned int[1]' [-Werror=3Darray-bounds]
> 1217 |         if ( node_need_scrub[node] )
>=20
> It appears that this is a false positive, given that in practice
> cycle_node should never return a node ID >=3D MAX_NUMNODES as long as the
> architecture's node_online_map is properly defined and initialized, so
> this additional bounds check is only to satisfy GCC.
>=20
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I am seeing some discussions going on about this patch, but once this
is patch is ready for merge please feel free to add:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


> ---
> v2: Add comment to explain the bounds check.
>=20
> xen/common/page_alloc.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>=20
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 35d9a26fa6..9b5df74fdd 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1211,6 +1211,14 @@ static unsigned int node_to_scrub(bool get_node)
>         } while ( !cpumask_empty(&node_to_cpumask(node)) &&
>                   (node !=3D local_node) );
>=20
> +        /*
> +         * In practice `node` will always be within MAX_NUMNODES, but GC=
C can't
> +         * always see that, so an explicit check is necessary to avoid t=
ripping
> +         * its out-of-bounds array access warning (-Warray-bounds).
> +         */
> +        if ( node >=3D MAX_NUMNODES )
> +            break;
> +
>         if ( node =3D=3D local_node )
>             break;
>=20
> --
> 2.30.2
>=20
>=20


