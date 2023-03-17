Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151466BDE3E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 02:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510867.789382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcz7W-0004JR-S6; Fri, 17 Mar 2023 01:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510867.789382; Fri, 17 Mar 2023 01:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcz7W-0004Gz-OQ; Fri, 17 Mar 2023 01:43:02 +0000
Received: by outflank-mailman (input) for mailman id 510867;
 Fri, 17 Mar 2023 01:43:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYoT=7J=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pcz7U-0004Gt-MA
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 01:43:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a7961aa-c465-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 02:42:57 +0100 (CET)
Received: from DB6PR0301CA0019.eurprd03.prod.outlook.com (2603:10a6:4:3e::29)
 by DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Fri, 17 Mar
 2023 01:42:54 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::33) by DB6PR0301CA0019.outlook.office365.com
 (2603:10a6:4:3e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31 via Frontend
 Transport; Fri, 17 Mar 2023 01:42:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.18 via Frontend Transport; Fri, 17 Mar 2023 01:42:52 +0000
Received: ("Tessian outbound 55ffa3012b8f:v135");
 Fri, 17 Mar 2023 01:42:52 +0000
Received: from b3f905e1a44f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09D02F79-E2F6-470A-AB35-8EC4F2F0D461.1; 
 Fri, 17 Mar 2023 01:42:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3f905e1a44f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Mar 2023 01:42:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB10073.eurprd08.prod.outlook.com (2603:10a6:800:1bc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Fri, 17 Mar
 2023 01:42:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::f80a:7d16:3c36:8a03%4]) with mapi id 15.20.6178.026; Fri, 17 Mar 2023
 01:42:38 +0000
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
X-Inumbo-ID: 0a7961aa-c465-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUUjjYjQeTNC7RSh18xsAaF0/ifWJzYGK9Z81WF00o4=;
 b=7PehXko20HywjdAtq6vYkr7z4R5oqXpmOGKpPxReT2x7GyZ0pdvSjrm0bnHcLOPprP+UicghpCVs8zDjWRq2bnaMZopgb+REQHjxF3GcPAqUcJ374bSwH6TnuSuFamQNI3XF2Ztf+yWiEwCGZAyrl6FWaJZHhcYs0mgDFQHd6LY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zx+bEOTve3X/DKRQY2sEALFVm1qvoKAcKFwXX5W+Ih/a07RcqzYE75+ouoTZNpT59Lq8FKmq2D0uU0fPl2PzoQi+yY60Pq7OwmKkQWYT9b7OuYDzzQtQ4V74jHLgKqij4z+4cWRJ+uYyhVhRYdxgBSWY9wzop3QdGs5l190Lp+yIRxlkLXhqiptxMiVIBRWR/GEmnVIIJFwTxWmkm4SVJd899Lb8LiHpTu4c/RT5ej44kjObeYd+xLtN5c0ZYFCBP5ZeYtJQfX8ZpGsuD6qO/eSaUrichNFdEtEvJG3NVHbBP6eZizJgjrs5/ggjW61ffNo5HKSExYIAvwOjK8A+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUUjjYjQeTNC7RSh18xsAaF0/ifWJzYGK9Z81WF00o4=;
 b=KS/fcbo/iwuBucMDiBfjSIsvX23VcCa3wP19d0MRtc/W9qM3LAWSL8gBot3t5tflEKF9aIPO1Cd1omX+CadLQB02T+m62d29v4hLqbYQYimnq/iwlrs8GBG1OU4AKg1f6WLfCcsIgvRdX1PlrbddrSjASkX+ehy7/Ls7ZF1RUF7VYwTFiqc663oQx7ZPBxAWzGUx+eQr5fMvwniVoNX60cmRC2fHbP4Z4t8LVaELOb831FinMEPjYF8H+kaZEED/JLIPxF+x22b/Mk/LMXEB1bwf0fuKnbbLuKQFYsz1gCo2ohyBwA/ZJY+nJguVUVLhdHxf+/KDGBzYeHOsGMmAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUUjjYjQeTNC7RSh18xsAaF0/ifWJzYGK9Z81WF00o4=;
 b=7PehXko20HywjdAtq6vYkr7z4R5oqXpmOGKpPxReT2x7GyZ0pdvSjrm0bnHcLOPprP+UicghpCVs8zDjWRq2bnaMZopgb+REQHjxF3GcPAqUcJ374bSwH6TnuSuFamQNI3XF2Ztf+yWiEwCGZAyrl6FWaJZHhcYs0mgDFQHd6LY=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 0/4] P2M improvements for Arm
Thread-Topic: [PATCH v2 0/4] P2M improvements for Arm
Thread-Index: AQHZNGBDjsZ+/rBSpUasyS1gMA6ceq7+eOEw
Date: Fri, 17 Mar 2023 01:42:35 +0000
Message-ID:
 <AS8PR08MB79913BA592A3419A17869FD792BD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
In-Reply-To: <20230130040614.188296-1-Henry.Wang@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E1F3D1BBEBDAC54D868EE0A8781A29C2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB10073:EE_|DBAEUR03FT035:EE_|DBAPR08MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: 7050e091-34be-42f3-bf19-08db2688ec68
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vWtP7WBJbAgVxYSe+o7imacRN9GTub4s2/ZQ5ECO/mFXdnqpK7FAA70ZFew7yoWMo8r/mD9BeRBXsSfeUMD+DJTdtHBYI71M09/pVAmd/vZKawnAcFp4Xrb2TlNOvcnDEvTm5JBb2wpDJYtg56mCwzGvNjZNPfyW9zupu0jPvwSb1TiEfN1XherFRn6rAErlCvOq1BgUH8HlImTSeuBvLty5ozqw69VUXmY/KGkb8IwaB0jnt60moHNqY0St27pKhD7M4ZuEqcxKm9nb65ojt2L49gsd6D65i2fkOhpvx9HAcvA/fIL6RYWPtYWmEkCLYgqnP62kZ90MyAlkgu6oDwMOBJTWgV4MhubSUSClZ634VSjwUpN7KwkcZFXnRSL1P5Je3rYji4SecIJM+Cf+PVGiRzslB07RIrKpM0Ky9GM8DbbkulfWT2CxkXJIt5+0ozxoNU00DmQxWdprULON5Pih6qdOCVM2IOIMPkdpFj4TWt7NakN+8uvsyFjZnE5ioHaS5oyP2eWHTpEyel8wUt5qHH+wDD1yZthy1LszQPcV8iQM7XCztPs5cMkwJP4h5D9j2Xsnv+A5abvx70HYIjlYtirsEjKhTQVwUcL1QAdVzCV3Cx6IUjk+Q1QQkex4FkF4medCmSHJ6N+Xaa9BAOuAmYnZErZmk32139SjX5ogMFqVoUs309jZo2iNzf/RFP5VD7hFIU2+WmV9kULTmYMKMjC6xYVZ7llO2oPz2vI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199018)(9686003)(6666004)(7696005)(966005)(186003)(6506007)(86362001)(26005)(38070700005)(83380400001)(71200400001)(5660300002)(2906002)(478600001)(8936002)(52536014)(54906003)(316002)(6636002)(110136005)(38100700002)(33656002)(66556008)(76116006)(66946007)(66476007)(8676002)(122000001)(41300700001)(64756008)(66446008)(4326008)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10073
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9cb60d5-ab72-4e1b-ee74-08db2688e26c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	47C54JbpK8VkaydFTkssoG5cjxpEQZqyeIYQDD3VdukSnI4BbeYrsVcacgkDYWHK3AOSo35Q6LBZJexP/HlxtWcqwEHuIx/vXkVtyhZNhWeY45n//LOGBNMn3LL4EgbzStx51L4va/eAyxUIlitNlvMaJwEyIIdRMgQM1qrG3MbcRLoS7mtykDyxsuyZAJSFBxQU4XLMdDF4VDUnAakXUJu5hN8mXx62uARKlpLtWFQBo9U9jPimAEuaViE8qeBcG/FsYQ8UNfuTEjuFUFXU/qkVh1gPNJ2Ku64HxXXOqIVw1rA18f5JiIKphxqGo1PAuTX47ke/SJKfhnvu/v2wub836VRQ03XAiBw5MgEhS2ErHvAJQjdRGcByAEOziCybY1hTYFwJDITr+QOWn+aJI/BRlPjh75PegREe48zWF+KPNPCIkL+tZ1T6suoCEdOUrlBvGm1I0ekw8cznAygAcHyWMo59iKP0cGRO93ErrVNwC3ovks7RVA33Mke8nlIpZaNUoQqRfFGo7YUZMIzXpm2OW1kubG+TqrSy61mEdh4S/Ezsw3dkuqCYuSBvIgMqLXzVxqkjZgT9sDbtio5lhGfEGJl2e4+w4WEdUq1fobH1s9vV4TfBes23jaJdEIHdyy1137CQjHFb2/BAC4IEB4GUjrSYnkwS1lMpVZjlNm+6i3a1tMjszS9D/z2IP9duiE1wNGbw/MeZE5b7cFDCdradqxMkEW9Iz6/UCrVtm1M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199018)(36840700001)(40470700004)(46966006)(86362001)(36860700001)(82740400003)(81166007)(33656002)(7696005)(2906002)(356005)(52536014)(4326008)(41300700001)(5660300002)(8936002)(40480700001)(82310400005)(40460700003)(55016003)(9686003)(186003)(26005)(336012)(83380400001)(47076005)(110136005)(316002)(6506007)(54906003)(6636002)(107886003)(8676002)(70586007)(70206006)(966005)(6666004)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 01:42:52.6596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7050e091-34be-42f3-bf19-08db2688ec68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5590

Hi everyone,

> -----Original Message-----
> Subject: [PATCH v2 0/4] P2M improvements for Arm
>=20
> There are some clean-up/improvement work that can be done in the
> Arm P2M code triggered by [1] and [2]. These were found at the 4.17
> code freeze period so the issues were not fixed at that time.
> Therefore do the follow-ups here.
>=20
> Patch#1 addresses one comment in [1]. It was sent earlier and reviewed
> once. Pick the updated version, i.e. "[PATCH v2] xen/arm: Reduce
> redundant clear root pages when teardown p2m", to this series.
>=20
> Patch#2 is a new patch based on v1 comments, this is a pre-requisite
> patch for patch#3 where the deferring of GICv2 CPU interface mapping
> should also be applied for new vGIC.
>=20
> Patch#3 and #4 addresses the comment in [2] following the discussion
> between two possible options.
>=20
> [1] https://lore.kernel.org/xen-devel/a947e0b4-8f76-cea6-893f-
> abf30ff95e0d@xen.org/
> [2] https://lore.kernel.org/xen-devel/e6643bfc-5bdf-f685-1b68-
> b28d341071c1@xen.org/
>=20
> v1 -> v2:
> 1. Move in-code comment for p2m_force_tlb_flush_sync() on top of
>    p2m_clear_root_pages().
> 2. Add a new patch as patch #2.
> 3. Correct style in in-code comment in patch #3.
> 4. Avoid open-coding gfn_eq() and gaddr_to_gfn(d->arch.vgic.cbase).
> 5. Apply same changes for the new vGICv2 implementation, update the
>    commit message accordingly.
> 6. Add in-code comment in old GICv2's vgic_v2_domain_init() and
>    new GICv2's vgic_v2_map_resources() to mention the mapping of the
>    virtual CPU interface is deferred until first access.
> 7. Add reviewed-by and acked-by tags accordingly.
>=20
> Henry Wang (4):
>   xen/arm: Reduce redundant clear root pages when teardown p2m
>   xen/arm: Rename vgic_cpu_base and vgic_dist_base for new vGIC
>   xen/arm: Defer GICv2 CPU interface mapping until the first access
>   xen/arm: Clean-up in p2m_init() and p2m_final_teardown()

Gentle ping of last 3 patches of this series as it has been a while. I
understand since we lost all arm32 boards in OSSTest so it is not likely
for a GICv2 series to progress, but this series passed our internal CI on
all GICv2 boards and it would be good to have some feedbacks so that
I can make the series ready to be committed before the arm32 boards
are re-added to OSSTest.

Thanks very much!

Kind regards,
Henry

