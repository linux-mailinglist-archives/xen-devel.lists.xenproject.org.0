Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E113D5A996D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 15:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396634.636847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkcg-000843-IL; Thu, 01 Sep 2022 13:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396634.636847; Thu, 01 Sep 2022 13:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkcg-00082G-F4; Thu, 01 Sep 2022 13:52:46 +0000
Received: by outflank-mailman (input) for mailman id 396634;
 Thu, 01 Sep 2022 13:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjVP=ZE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTkce-00082A-Lr
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 13:52:44 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00071.outbound.protection.outlook.com [40.107.0.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 588db6cb-29fd-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 15:52:43 +0200 (CEST)
Received: from DB6P18901CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::21)
 by GV2PR08MB8100.eurprd08.prod.outlook.com (2603:10a6:150:7a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.23; Thu, 1 Sep
 2022 13:52:30 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::f6) by DB6P18901CA0011.outlook.office365.com
 (2603:10a6:4:16::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 13:52:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 13:52:30 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 01 Sep 2022 13:52:30 +0000
Received: from c9f64277024a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ED7C3890-DEBA-47FF-83C5-1AFB85A2B5AB.1; 
 Thu, 01 Sep 2022 13:52:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9f64277024a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 13:52:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5536.eurprd08.prod.outlook.com (2603:10a6:803:13b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 13:52:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 13:52:16 +0000
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
X-Inumbo-ID: 588db6cb-29fd-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hZOhYPssheq99qoZf4F2PCQfcDzd5N8+xHbQKg/OOtIOW1G/4PBt9rgK7PKZlrJ2tIdx0IUrAGx8OGac6fIx2owUDZbCXhKWHZUTFyMqyC7gl7BJhqGajRE4dnhibnvpz6BvmsM9yoj8IV0T1gN9lV6O8QOxNkRR481QFI8VTlZw8WKn62d4i/P/cdkDlfgU4CsgJgEJewKv/Ok8L9hGu7UK0XNpOelEHB6jOw/i/hAnCxUIibhEXOapjMtlqP2C2u9/d1Mj7K/jp6hz/jPgH+GSw0nPy88wwiskY6Tn562KnOvUy1qhBquSw868mCrZkE5FjxsHCmS/nghYBUKwiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IrGcB7LR9nYX8o1o0wOpvZ9jGcCckMW0Z3W7YPZ/Wk=;
 b=Q2M5v5C26Jwz8+yrep4kC7Pidk7ixLw1DvFrZaJ9DjamWgR4bKtKImVFcUgJ65IFluJP9dU0Xfk2QwO4ljFL9FAi0kX/j6FCD4r5Qqe5ZW8CyntZb1HMXjeJ//ntsVppgocyCSvlb6/Zf/Ve6LiX4S0EU7DDf8Zf3oRNI+hMBNFyvZg9RZtSFAbWBeEiT78PiEM9vqu6/pz/it4zKIDSYLuGWf0RxUQx+nZNHcRJIMOcQQSCxKBhR1FHGVOSDVktdQ8xkX0MtEW+BIkmFOGP+gMNQLgcRM5TAhb1KUjr5edFDC2nPdxgQy4/rT8mdrbtyEKnsjcJ3wNXDu0ACiO6rw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IrGcB7LR9nYX8o1o0wOpvZ9jGcCckMW0Z3W7YPZ/Wk=;
 b=03TpI/OFpCnLHFZrZqRGyQVcGvRqlvZV5kP/N8MBkn5rK0lh7TvQtxHn86sdoanx/DafdchBMQSh11Nb1w0EwK21lq2fjdLpPAjf0CdteVO1GoyaCihhFyNseqn/1Xsu/6/M9v3TWYlYn668xuANaSnktyAcLkfZqevknT5LRc0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8F+OC8lpLQN9Gijfrvf4k1unIY5wxBgqfR8g8HFDMx/9rSPEEjB633Z7N4t1uA9C1OEiWoiTYZZzpi2ChITdUVbWegk//P51DaycUswSk/G4JGF7M3+moUYyraWJbBA2qeqqRNbFItBrGb/TIl+mZoC0n68odGJmJLHk8Gxd6xirfVPj7FMVkNhVYNml61xUKLnl30S4QZxfml4H6EphPTd9Ep4HP/kieCuprMZZyzkr0q2w7V7QyRQD+Q3mX8yaGX8N8IduDqsZmqyRZuFIc20qrlqpE6ppQd50c8dlLCZAsViRHMvWfcmwXSQKy4wwiPZCXwgCofLRyvMqrpVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IrGcB7LR9nYX8o1o0wOpvZ9jGcCckMW0Z3W7YPZ/Wk=;
 b=STtGODAGikB+49bpOscgZyt61tBtZxSV+PGW1Oxx8rba0JHFCB0tUfyeEH/kvdwXuEsDYpo+Iiv+dlCb40MtYUbHpVawwyN1T9wK3tkQY/+gs8qRzqFN0kzGn91A2iVHtaOcdioq282+czCKUY4EPOwaPEMplXKi2/WV2T/kHcQQ7UESuVOfhiGr3FX9uD8aOmKhvqVAuUQesGMs3RZxKYa7IY3+f5rOoW8BOhrvxVXDiO3pTUnSN45HlX0ZK1IsFr6EWqKblrK1+3kgqCqKkihxt9TsiSge2ud3EZVbWN3jUhgcBaNavI1uv2obcYX6EI5B7YynbvMJJi/jjmOfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IrGcB7LR9nYX8o1o0wOpvZ9jGcCckMW0Z3W7YPZ/Wk=;
 b=03TpI/OFpCnLHFZrZqRGyQVcGvRqlvZV5kP/N8MBkn5rK0lh7TvQtxHn86sdoanx/DafdchBMQSh11Nb1w0EwK21lq2fjdLpPAjf0CdteVO1GoyaCihhFyNseqn/1Xsu/6/M9v3TWYlYn668xuANaSnktyAcLkfZqevknT5LRc0=
From: Henry Wang <Henry.Wang@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index:
 AQHYt4ugTfbCAM/WyEil7pMplK0r3q2/e0SAgAeAsxCAABaogIACundAgADR+ACAAAOZ4A==
Date: Thu, 1 Sep 2022 13:52:16 +0000
Message-ID:
 <AS8PR08MB79914FF03A211B1DE5E127F7927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
 <GV2PR08MB800143A62FFD20D318D66947927B9@GV2PR08MB8001.eurprd08.prod.outlook.com>
 <FC0864E7-C6A7-48EC-99F1-FD2881377534@arm.com>
In-Reply-To: <FC0864E7-C6A7-48EC-99F1-FD2881377534@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 26C6BA4B7919314DB9967C9C707CE476.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2ad7b6da-eb8b-4b74-9461-08da8c213674
x-ms-traffictypediagnostic:
	VI1PR08MB5536:EE_|DBAEUR03FT035:EE_|GV2PR08MB8100:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Al0wzQ5i+3Na9TVn+IKR3cfYtT9aK4c6GFbRlTKgJAvPT0bTJYOHs6TmfyRx81l/9UjdFVquNemlGEvSycMIlKGSMSd/S6oQmw3IEwpq4kkLsySzQSoMU62jCKIma/0e+HDWVPGbcn0X5nvg+WrdEmZrucjVvQ73Afa6s39KiTTLuiBCl3xJAN42ucG47Zr1AxwYFqGoP19AVmpgmSEMQ2+YLcPDumc6N/10yadFtRCKzFNiO3iARMrtc0auKFaV6wPOJ1vly8IitP0jC31u8V5J+LSdCY+eG+4QWDLM6zWdh9BrezOIna4acfM0F1f4gzPQItwIw91goxJ0J6BDrGv8hJXlk+/aLhE183ljy75eR7HNmfn1qnNeQe6m3XmODsk6SOwSw1++UZI5ijtf/4vOkoV21Y0ycTiEESx3hiqc9F0AiaeD+npgcrDpM58Hs1ELoHGw6XyLBuWyDNIwomlrSyJ4BNo3FA1K+udxxrhwqQuF5e6uj5cDCuLtvN1z2Dz9YxHNO6adCNjnsHjz1dQcqK9VNwSI81Pe3/jqs38G3a304OM3T1MIcCh8G42BMnw2MpTefGvem2vIH9WHakq2zr7iIeEkNX1BlLzFfniiNccqL3rkVwzMNZov9Uh9I9GlmP1nq8q8wxPwwu9++7mrJgLycvekLMOyW2M9cYod2TzEN38RiXZ7HXF4IeznAieqnQ194Im3vbN/7XTD5ngLhQlsaz77z7QAnSfCzOaG4MK2qgItsqmJdAEZysIOwkEi6y8v2rMqomjHufdZgQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(76116006)(66946007)(8676002)(64756008)(66476007)(66446008)(55016003)(66556008)(4326008)(52536014)(33656002)(6862004)(5660300002)(8936002)(71200400001)(54906003)(6636002)(316002)(2906002)(478600001)(83380400001)(6506007)(7696005)(41300700001)(26005)(53546011)(9686003)(86362001)(186003)(38070700005)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5536
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	417a0c0d-0049-46fd-b987-08da8c212e74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PuQcV/aAbDn3lUvyVWgkn59rZFKG8klPv3ecfp6IImOts2F2Yx4N4NGCt4ixJrRNx3gmmDp72rILG5ltF7QWzcAY2l7i5Vp/iWGSpLyHvLudpXR9lTtVrusD4ae/JY+r8yHVcOcbY1y6fqUR4yXF3CrCQibruF5Alu1jWRt4jUx/TPrdkfu0GBxz93UNGUFfocuRQu++sS5wDy7xV67pPyn3JJen4boP1osUZV1KzmDCuANNnOknRoKormFEu5FJGHpcEbPbvkQ3Djjom321CQcFXjWfp55P3sLOSAhR2djhoXo47ui6NbW8kI47GBcIf/QBD+q94szDmZhK7jE/AcRzYBvFOGKcQZONXhzyAMMLmvxLfvasS+vu9CZ8QihIpX2R5ShpGjgE0Z/UNyIJWF60yWpXKF9HmTePm+o8D6HbBuqzKmOIqpcuzqbqyJRxboCSLw40YDqBW3opnCnNBRupmQfJkb7MM/SQxT3zWDmZATjRQ/FS/kmVWdHwFc2P/XvdIYjUR0eYH+d6L1Ln5tIpx+slUSBovul4bKzcm0l57sRwkSKLJnvRub2m7sFa196dtv5hkxvzmMs8bi/paeUfPASTCn4kl5WsVsfuhiPVvLRA3oENW/cSu2FCFhLyYbGkgy69aufzEcrMRkBAmDs2LhThrcMroVQW9kN+QO2MSQ5Ca+v2TFT2BTgMJzGCSYsA0VpU+gmcTIQZsISi5KEZ+nAGsY0ezqYXcxQd+bLdgmY/hHIqKiZWjDDdO9oXh5TaBX9Rbuyjc/UduKh29w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(36860700001)(82740400003)(8936002)(2906002)(52536014)(86362001)(40460700003)(7696005)(81166007)(41300700001)(40480700001)(55016003)(478600001)(53546011)(26005)(6862004)(54906003)(316002)(6506007)(6636002)(356005)(83380400001)(47076005)(82310400005)(70206006)(70586007)(4326008)(8676002)(186003)(336012)(33656002)(9686003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 13:52:30.1609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad7b6da-eb8b-4b74-9461-08da8c213674
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8100

Hi Bertrand,

> -----Original Message-----
> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> > On 1 Sep 2022, at 02:03, Henry Wang <Henry.Wang@arm.com> wrote:
> >
> > Hi Arm maintainers,
> >
> >> -----Original Message-----
> >> Hi Henry,
> >>
> >> On 30/08/2022 08:11, Henry Wang wrote:
> >>>
> >>> Hi Michal,
> >>>
> >>> Sorry about the late reply - I had a couple of days off. Thank you ve=
ry
> >>> much for the review! I will add my reply and answer some of your
> >>> questions below.
> >>>
> >>>> -----Original Message-----
> >>>> From: Michal Orzel <michal.orzel@amd.com>
> >>>> Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot
> >> and
> >>>> heap allocator
> >>>>
> >>>>> This commit firstly adds a global variable `reserved_heap`.
> >>>>> This newly introduced global variable is set at the device tree
> >>>>> parsing time if the reserved heap ranges are defined in the device
> >>>>> tree chosen node.
> >>>>>
> >>>> Did you consider putting reserved_heap into bootinfo structure?
> >>>
> >>> Actually I did, but I saw current bootinfo only contains some structs=
 so
> >>> I was not sure if this is the preferred way, but since you are raisin=
g this
> >>> question, I will follow this method in v2.
> >>
> >> This is what I think would be better but maintainers will have a decis=
ive
> vote.
> >
> > I think this is the only uncertain comment that I received during the l=
atest
> > review of this series. I agree that Michal is making a good point (Than=
ks!)
> but we
> > are curious about what maintainers think. Could you please kindly share
> your
> > opinion on the more preferred approach? I will do that in v2. Thanks ve=
ry
> much!
>=20
> I think it does make sense to put this in bootinfo.

I am good with that, then I think I will move this to bootinfo in v2 unless=
 other
objections. Thank you for the input.

Kind regards,
Henry

>=20
> Cheers
> Bertrand
>=20


