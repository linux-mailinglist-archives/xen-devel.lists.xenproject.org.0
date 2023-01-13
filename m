Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC6669929
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477354.740040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKVK-0007YH-PO; Fri, 13 Jan 2023 13:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477354.740040; Fri, 13 Jan 2023 13:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKVK-0007Vt-KS; Fri, 13 Jan 2023 13:53:58 +0000
Received: by outflank-mailman (input) for mailman id 477354;
 Fri, 13 Jan 2023 13:53:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=irsc=5K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pGKVI-0007VX-Hq
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:53:56 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2066.outbound.protection.outlook.com [40.107.249.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7c37e1f-9349-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 14:53:54 +0100 (CET)
Received: from DB9PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:1db::27)
 by AS8PR08MB5928.eurprd08.prod.outlook.com (2603:10a6:20b:29b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 13:53:47 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::2c) by DB9PR06CA0022.outlook.office365.com
 (2603:10a6:10:1db::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 13:53:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 13:53:46 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Fri, 13 Jan 2023 13:53:46 +0000
Received: from caec6e40b2e0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 972D5A17-5443-4258-889B-4637368571EC.1; 
 Fri, 13 Jan 2023 13:53:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id caec6e40b2e0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 13:53:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB10072.eurprd08.prod.outlook.com (2603:10a6:20b:634::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 13:53:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 13:53:39 +0000
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
X-Inumbo-ID: b7c37e1f-9349-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpFEWSanXFdEVYh+Sv0tOwepH2BkicRhfafa+WZtzbg=;
 b=6RU5wBe5wfBNhf4UMOTZGpIJRQXPs3p//5TC33mZTUhHbmkG6RNzuq8hCgVrIyG/ZGMtWeXnPdRiP+h0Nx5udxq9qXPh72s5f2CKzZE3pDNAvG4GyxCME3C+wslVJa4UF1LBNjfbdilU5uh7jdRBQZTYqWv4/xhz8CIIhZUER18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyZwaEGf1tgUW9FdYNB0Iaq+J8WVCZsjZBjHKF0RIuPgkqZ2bBao1JNT8dhsp9KbTAmdM4PCruoVhwbTdAK00wcptm5jfQ+9fO6gdaC6DYCfETYsxKMALX8mQDEwtOrS3V1mMdMN+wE8hrfkAwGAbZBxrpp8e4jimg/J0oSDAPPsX2dllkPqBObefQ34hjQEFvGGCvyPSMBhaXzERUEgZRB0Iqq6hbDYjFBjXxzItvuJci8F8dTkDejSJTdqAQhQBS/xScKxfmLRSDhN6wU1Rq9itceE9//SxWgzdRpfaPphARJzozpBad5uxLo11z4mRx/luRO20rxlMtFkFuC5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpFEWSanXFdEVYh+Sv0tOwepH2BkicRhfafa+WZtzbg=;
 b=mgwRqjt+QNOBOVXJIAkFEB6OBHQDwOut+lIAtlmPeex16GLfh4PhotuXM/tewm5VP2WVCwL2Nsao1J16tzXp3IwuKBLmFoqTblWPFYrxMjUTPc3cimsE215oyZCb3fQLRwZ3U8dT3eEgHZG0Zuv1nl3WFCMYnD4WqSobgHVRC6Saj8DIFAm3eAAmAKK+YH4kGgXwaIQJxvlmIBOf7VlbClGS0yt0P+jAYQm5zBOcKBZsWxTc6GflAlvE/zSA1AmYCMyrGyNmGdDSF9JbaTfGlP1DavWCtVRAJXg9rQp+cAssvcTHQCDU9KIufvrWdW3thQGlOztxOw94HCQCx95JVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpFEWSanXFdEVYh+Sv0tOwepH2BkicRhfafa+WZtzbg=;
 b=6RU5wBe5wfBNhf4UMOTZGpIJRQXPs3p//5TC33mZTUhHbmkG6RNzuq8hCgVrIyG/ZGMtWeXnPdRiP+h0Nx5udxq9qXPh72s5f2CKzZE3pDNAvG4GyxCME3C+wslVJa4UF1LBNjfbdilU5uh7jdRBQZTYqWv4/xhz8CIIhZUER18=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: RE: [PATCH v4 04/14] xen/arm: flushtlb: Reduce scope of barrier for
 the TLB range flush
Thread-Topic: [PATCH v4 04/14] xen/arm: flushtlb: Reduce scope of barrier for
 the TLB range flush
Thread-Index: AQHZJzeBX/yRWyvkUk23hxgjDc8lvK6cV9vg
Date: Fri, 13 Jan 2023 13:53:39 +0000
Message-ID:
 <AS8PR08MB79910CD967147561A16F4A8692C29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-5-julien@xen.org>
In-Reply-To: <20230113101136.479-5-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D329D57E6119674DAB3ED3E7F9337EFE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB10072:EE_|DBAEUR03FT029:EE_|AS8PR08MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 6624ff04-e8f3-49ca-81f9-08daf56d976c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 H7ok0TmIkJiCNsOhR56x1LETt5435Ca2K4Any9bnXfvowdLRYOm6otNj1fEv6LH8AcXuFUrt/NvcXinxXCUXKI+sRWdsptR91LavMkaFPM0IgiiAoUfg19ELtZyp2HcLslKcq5PBtW63BJHbnTXeq3DPKa2SdilVmxBN/4osZERSaGgom00Pb1lTGtSPWfCgoTR1A8w/RwVxp2qnSoGLFmdS6yG8z0a5mLhTN0RwiiDHpU2SD4fybsRir7AfC/THykdm/MiA/lDbjX2YAjVGRRZNJ9xsB3VOKcJjaiIE1S8NgS1qt3ZfXgutC1gzilKNymszelkgViLZauFsTL9cEEa91kx5IIT0SZHpH1rUuJodBmIMVY/XwJ3CJrXSDjuFC63NW1mYixAiESknV56zj2265H55RRWb0eaBTq+9o1A7zKkvF6BTEL+7Tqj5TIxF4T0JYCkNNxw+n2k4m734mr+ndd0R1ftbcXYGHdNfsMOhwDew/52IqtAR3K0scuOCjI+Dwiz6Tf42BqpKUkqsIsjM/BBNC503ecC9VK+lQHBgOiaECjWsQFBQZchEieUpHgx60bbpARK8c356ENL2r+Jf3VrJ3kzRRfAbRs2xgvtN12Az+tpO/EFzblUmQr399cyJVTqxkXhIBA95cA5SrW+7oXR6utB09ILerW53M/0kqLSfsQ49+G9XMSlrAWhL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(8936002)(76116006)(66556008)(41300700001)(66476007)(8676002)(66946007)(66446008)(4326008)(52536014)(64756008)(38070700005)(54906003)(6506007)(2906002)(316002)(4744005)(5660300002)(33656002)(7696005)(55016003)(71200400001)(86362001)(478600001)(186003)(26005)(83380400001)(9686003)(110136005)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10072
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19a2fa18-c84e-47b6-0ab2-08daf56d933f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6T4A5Y8hbmS6r0hNHa5ylEOyvXHK9bU+gcda8v4ldXnap36cznaK0QKqw7OJH+TUyOzk9ERn+LjX+P0cdFSDp9/6/fobaHaVfw62qMpmpHJXpcLWNctFOjtGizZXJkV2BLfDL9wVo0GijP7p4+S7HjDbh1zOPMQpd+LXMIQx9Dd1bhBy9INsnXxtnaUa03YYxl7btYBMnysYarlgzolxC/Nr+dsiItUs7MpHXJ1Drv6VDEF0SrBxRO//nrxlm7OtdqohD4dgYrhqBfhIPxLI+Uy0FFV2JsVqzHUZtE0XepGGGqda8q35W8H4x8UcDF0VS0mdd8jqofrPCdMcZLESJJGTGzFRgqjhETYTteVRUVq9y8aF/2dDYxBdHkAl/osjSUuj10beztEt1s7goksjlL4SKFNB01N0rEvud/jVwHS2tbxCKwWtWBLxNqri3T18G+PVbVwE9+M6z+rtH+jhDkyX7eTo3EPoIBuQNZgbK3GOaHepIqa7WwIOCEUnlupwaNpaS+8LCyfbkIVQ+Jn5a4i3ePxkZTw5LJvO4p5h3BWWIPvmu3vh50p0i5rTqR3qsmax4NGth46quhwlKLiOMAPtu/btA1rUUNkUNi2M2dnaQQ/MEW+nrl/tO1s7cHYXErY2Y4pAILVyHv3bb+QXPlUX7zXbJcb+4d7lN3wsPU3Snd0MHlAAPuhESakSjTyk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(70206006)(52536014)(70586007)(4326008)(8936002)(36860700001)(8676002)(81166007)(82310400005)(5660300002)(4744005)(356005)(33656002)(86362001)(110136005)(26005)(2906002)(316002)(40460700003)(54906003)(83380400001)(7696005)(41300700001)(336012)(47076005)(478600001)(82740400003)(186003)(55016003)(9686003)(40480700001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 13:53:46.6901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6624ff04-e8f3-49ca-81f9-08daf56d976c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5928

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v4 04/14] xen/arm: flushtlb: Reduce scope of barrier for =
the
> TLB range flush
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, flush_xen_tlb_range_va{,_local}() are using system
> wide memory barrier. This is quite expensive and unnecessary.
>=20
> For the local version, a non-shareable barrier is sufficient.
> For the SMP version, an inner-shareable barrier is sufficient.
>=20
> Furthermore, the initial barrier only needs to a store barrier.
>=20
> For the full explanation of the sequence see asm/arm{32,64}/flushtlb.h.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

