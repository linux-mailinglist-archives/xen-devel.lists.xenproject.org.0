Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DA1602F2C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 17:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425154.672927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okoCJ-0000pC-ID; Tue, 18 Oct 2022 15:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425154.672927; Tue, 18 Oct 2022 15:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okoCJ-0000n9-Dj; Tue, 18 Oct 2022 15:08:03 +0000
Received: by outflank-mailman (input) for mailman id 425154;
 Tue, 18 Oct 2022 15:08:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RnJu=2T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1okoCH-0000n3-UW
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 15:08:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8038f90-4ef6-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 17:08:00 +0200 (CEST)
Received: from AM5PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:203:90::18) by DB9PR08MB6490.eurprd08.prod.outlook.com
 (2603:10a6:10:25a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 15:07:57 +0000
Received: from VI1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::df) by AM5PR0402CA0008.outlook.office365.com
 (2603:10a6:203:90::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Tue, 18 Oct 2022 15:07:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT052.mail.protection.outlook.com (100.127.144.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Tue, 18 Oct 2022 15:07:56 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Tue, 18 Oct 2022 15:07:55 +0000
Received: from 68d07a9aec62.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 651D6B36-EB7E-44A0-8F34-3FB68BF76D74.1; 
 Tue, 18 Oct 2022 15:07:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68d07a9aec62.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Oct 2022 15:07:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6347.eurprd08.prod.outlook.com (2603:10a6:10:253::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 15:07:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 15:07:42 +0000
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
X-Inumbo-ID: a8038f90-4ef6-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m05hvVSrnetaqlSbheSuJesKOn84OawYLkEFdQrWyDC8NQwDQPnmlfdWWUcKuNrxeg/NbLUc5ZoyOZuCbM31r1Dh0v1nWfrubj0wKCvpfMWjhIBsFQyrNeBMl0v/+xNT8vtu4QW5dQutUCg+cMZ8Hlya8ZQhfN6KFMUpF3U/0IkthtlxO5wzQXp7PrDkLszJE/jgpJCGxthtdyvI6Zu+AiV8gpI07O25ovJrjUmW2ehyBo6R6tyJOKK6pBQNUZ/d2J6cwqIHkeaWpUMPX3+BdfcG86CxMstNRLnmhwr6AYHMZpVoQ1dhSjFkB5lBmYW5/Werz0JwcJ7TS5JJD8ksoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8h5zhdoolhHEZDPCk4VVAhcd7l812chy8Q6UHj2YS4=;
 b=cDFMhaDJf1okfq+2kyMa4QRbnZkafbONDGFGg0pBIj/e4M/307HHQzv7mlpDV1wqIp9KAoarCt/kBeNl4hBYl2A3Y/uzCTvc4Kzp0F1eYyy8lUiNyvLzvMgpY5F7/4p0kieho5C77X0Y/6UVEeNT40JwjOgSWncOE//Z2Hb+heQeOemK/ToKvqo7wNh/DquREnz2tZcuOOnuH5vv/GB5yYvfqrbLOa3umizUXmFP4OHQxY8lxuoHJIYiZkkPHVTUP6od59qSVfX47bsyGV5zDYS08YWITEEqVopFvOrOz0279QYI4K/BkENqWxTdcn9FcQZcRbfpGyGo2eJneTMGUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8h5zhdoolhHEZDPCk4VVAhcd7l812chy8Q6UHj2YS4=;
 b=QzvBryjkFNaj4/lQgMHewVKzVTeOQJMaZ8+Z58fBVpbuIYkvrDuiDyVtO6GTEAJXRd4DvS68PzGEeH+8bqYuPQ1iD5/2chJR79LSZwfnZUisld4zPpbK51XtGkqQ1KGnxs0+1TjGRMkxmmM0YCJX/+fZfJwOcb5x/JlyyQfdiA0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ca733ce53479071
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWm4hwSTweo9UMAKcHt/tIKGsHFx2KESIAPFCW9M4rfBjk6UM2EdJC3fZVE7ObBjDHoqWIfFUbxtBsQNkUcUAriNcxlppiBuXU277OFdrd08sJMeyuwE/zGQbZZb5bA6HmlQRSL47sGY5kzsYQNz3xJfP8lNYjgwh4GeExzfImMNnXuXd6VddbxtfiBhGK3waA02SVkcCmslTlCZXsy/B1ihRl855eKuSa72ZBkticJxkkezw4JJIH+6h78L7Vrf1xA5E057o1IYd3c2+bAnC0UGb9ADF+MrEvBINd1Lb81e+Hj3Ec1vk/VWaf0YxD2UAkkyYDLx21Eeq0PeI6WmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8h5zhdoolhHEZDPCk4VVAhcd7l812chy8Q6UHj2YS4=;
 b=NeGCKaAl5pYhnST3g2Xv2hoTma/2vh6HWV7ZlaBgBL43Ly3Wo/iuhXLXOKJx1tSxzOnChfFDzhIg6gbXeQa+rFI083xFSlWkK/f6NmqXyOK/nZh9UM5L2Ipy4N3VsmWMMAV0HArVwtVe6yT18wyTEI+OeyanF+CMV+Q+XvGbklRcyNKu2CkY+7wfOV+MZp0sNBCEJWPS9JpD4/Ga+PIVIF1vchq+niKn4Fg4wrT6+W3INlR41f4CYUM10EnahxrGoQR+k+BNNmqLaJF1EIMpZwCKSneN4SWt0Rxui17E1EpBbf4eIM/LQabiwNx1F1U8lUroyPEF11qkZWbhZlnRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8h5zhdoolhHEZDPCk4VVAhcd7l812chy8Q6UHj2YS4=;
 b=QzvBryjkFNaj4/lQgMHewVKzVTeOQJMaZ8+Z58fBVpbuIYkvrDuiDyVtO6GTEAJXRd4DvS68PzGEeH+8bqYuPQ1iD5/2chJR79LSZwfnZUisld4zPpbK51XtGkqQ1KGnxs0+1TjGRMkxmmM0YCJX/+fZfJwOcb5x/JlyyQfdiA0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v4] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY4kjE5QulsJtPN02L0AHtsxk0ra4S8tkAgAFPUgA=
Date: Tue, 18 Oct 2022 15:07:42 +0000
Message-ID: <3EAD681D-7B3D-4165-B9DA-04587D233386@arm.com>
References: <20221017165133.17066-1-Henry.Wang@arm.com>
 <fcb69acd-2985-1c84-07b4-94cff742a18c@citrix.com>
In-Reply-To: <fcb69acd-2985-1c84-07b4-94cff742a18c@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6347:EE_|VI1EUR03FT052:EE_|DB9PR08MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2d93c8-a80b-4e98-e01d-08dab11a89e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6tExFk0G3eLsl+Onz3NLXSQoMiVtW9wtgCemXS/QX0npp1N5gnStqs6l5L5ygmFEPR9oHUiBW7XrGGYstjehdj2MeAVdSHbAhhrLToAuWypDF7aekKgejc/xzebFRuAlOTtUupMBuMgW2Jb9jkdqlf8pmK3LyEsDOFxxCYQVDDHLeNLSe0M0uHFi1FgM8qG+Dye6C8+00fCBsxGUsifTcsAlcDFxMn4cF14R+H2/gQPc/XxmIMczNsjvyin5hOMnTQ7Z2f/JRHxhlAlDJ4tAeoucs5yhy+pqQqEM3B0yQbdVsUFyW5M4O6UYjqAlVn2B1JsLbGXOmwTjS03JQ+VMC/icyIBHY9f3yiCGT+Y1ctCgL10bdGF6jnykP//bjSLf6PgHx3V5b8MQk9cCu9zRwxhkNgn0PxeXDVyAwid3d+OPsd6wTKTKCIw8XDfvTkMwtcERlE1ynEBkotPzM8FJnEXxQZwYBg58HFetNqMFMUH+5Tk+gSu5/hon1e1WUhXuts6KzRso5kczpwRZI9UDVW2HRlbsmFrp9uGVXZt4tcjd0f2pZUagzy/d6PmuwaNnfULf0sZIqRgl+qk2jqIFuFKwPrYN/jNooGNxK6r13bh3ENXFWRD4Qrt25zB1/6Ttz+Spp52Ov8RdLDZjzlehp1XM4A+LtSz3qFv/gbb2J8TkLUlxhjSMXUoDNFjDY/HFwVTr8aYjSEJ8wAo71kLdG2Widh/rSWLbcKzicY3DpSa6k6afoAsMScMgri+qTne7mCVX9AcwgBQRqzMey33SupCmGsneUcieq/q7r4e90Lw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199015)(36756003)(33656002)(86362001)(4744005)(5660300002)(38100700002)(2906002)(186003)(2616005)(71200400001)(6916009)(38070700005)(26005)(6506007)(316002)(53546011)(478600001)(6486002)(54906003)(6512007)(41300700001)(66476007)(76116006)(66556008)(91956017)(66446008)(66946007)(122000001)(4326008)(8936002)(64756008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1285DAC713B58B47950B51C46C825DD3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6347
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc2e55b6-492f-44ce-fdcc-08dab11a8168
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dy3GbMr1APGo7NqKG7znVXJGS1BklvzpOVZyn6pAgIWfkR0fADsL4CxgmwNQj4tywjHpYYp619mR0kjpcLDv6aDF2jbRQ4Fz6uzEHCezDXSALO+OIzGgpq+DdmFDdtCCXYiVM7ETiZBAsGwo1cUlptKc/tDEj8PJR/fe3Gq3NfNF0vm8msgwqFqfGel9mfgtkkmIMa+gwRIB4AhizMtgIUzY2r0vkRt6FD0poBJPWWE/VXiANVv9hQMG31mBTs17cKo099hfBFqHgs9FfB5Z+L/iwO0oFnVQruaN6f2CSqh3yxMOZx+d6/uV2EcwGRo99dZktpBpQnJnEcOl6klsT+iafZFRG0Mbv0ML4qcCE98GIlnzzzjo+aTli7lnkY5fxYGw9Z4Jrbj6VOtYP1S6t9irft/ZR0lOKV3t5sv6Zkrtv/3wbu5HxK2AdKNqn8LCfqLBJZDpMOLllqHR413I1J+9ueuNJbV9w3oqosyRB1uRUYqZj0Qb6bh1qmywsYyUqA9epp1lz2YHILiQYeQl5gH24dLSPkh8VxXq2wajBvX4ErS2GSUNRZJoj9Jm+vevqi2TjQORUsNdHSBpb628olcXzj3WhydHicKb0jUxpN5JPmQgu7SOvhYYVWi4Qb6k5dmSiX98K+DBFqzal1L+Vjf8H49bSkOamcETPyoUPigZr9M/GB+w+JDKW20z/tb1M4QQiPKLmxY0O9aZj44xIhV1aPoRkDzjD0OLpzpQWaK0vr7CFUGmRRJuG2Q8OtMf1dYcbUNdNPRb/jFBjfGHUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(54906003)(4744005)(8676002)(316002)(478600001)(4326008)(53546011)(6512007)(6506007)(41300700001)(26005)(186003)(2906002)(6862004)(5660300002)(6486002)(8936002)(336012)(2616005)(81166007)(36756003)(82740400003)(356005)(82310400005)(47076005)(36860700001)(70206006)(70586007)(33656002)(107886003)(40460700003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 15:07:56.6324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2d93c8-a80b-4e98-e01d-08dab11a89e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6490

Hi Andrew,

> On 17 Oct 2022, at 20:07, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> On 17/10/2022 17:51, Henry Wang wrote:
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index f17500ddf3..0b4e24218e 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -1784,6 +1800,8 @@ int p2m_init(struct domain *d)
>>         !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
>>=20
>>     rc =3D p2m_alloc_table(d);
>> +    if ( rc !=3D 0 )
>> +        return rc;
>=20
> This error path now leaks the VMID.
>=20
> And to preempt the obvious change, if you simply move this lower, you'll
> introduce a path where p2m_teardown() falls over a NULL pointer.

Could you explain me the in which case we would end up with a NULL pointer =
?
If the list is empty we bail out so I do not see how this could happen.

Cheers
Bertrand

>=20
> ~Andrew


