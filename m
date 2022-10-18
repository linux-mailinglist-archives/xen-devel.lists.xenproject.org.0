Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59D602EC4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 16:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425072.672844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknti-0002dZ-8b; Tue, 18 Oct 2022 14:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425072.672844; Tue, 18 Oct 2022 14:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknti-0002a6-5d; Tue, 18 Oct 2022 14:48:50 +0000
Received: by outflank-mailman (input) for mailman id 425072;
 Tue, 18 Oct 2022 14:48:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+Ts=2T=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1okntg-0002a0-T0
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 14:48:49 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8181a1b-4ef3-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 16:48:47 +0200 (CEST)
Received: from AM6P192CA0026.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::39)
 by PAVPR08MB9505.eurprd08.prod.outlook.com (2603:10a6:102:315::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 14:48:39 +0000
Received: from VI1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::4c) by AM6P192CA0026.outlook.office365.com
 (2603:10a6:209:83::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Tue, 18 Oct 2022 14:48:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT032.mail.protection.outlook.com (100.127.145.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 14:48:39 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Tue, 18 Oct 2022 14:48:38 +0000
Received: from f29a7f7a9e30.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53FC1B54-5118-414C-B8B6-BFAB226C40B8.1; 
 Tue, 18 Oct 2022 14:48:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f29a7f7a9e30.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Oct 2022 14:48:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6373.eurprd08.prod.outlook.com (2603:10a6:20b:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 14:48:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 14:48:26 +0000
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
X-Inumbo-ID: f8181a1b-4ef3-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XMSzDbz50vWvUnViWt3WBqouhATQ3nXn+S4UiWQuSNd+EnPGgWjVnX3MrLWXoLERkwLLPzxt9tSiStWYWM3TcwFS6LfbodPmwuOG7cYzFLANSV7xkoKRF4ACRTtu7jdOY4J1qgHMUc8TejWQtYjN95KweT+KOWg4DniNrnPo9ejL/YAa4IunaVsarwZx2q2W25uolcN9xsvkm8YsrBjrfuoVVGYTK/2dbd1+pzGT7OM1venesMNmp3UGHqE1xOh6PjLcLfty0MXHGiyVTqJsr8ulHrOBSpsHeMgEwkJ9PrEg9gZ1HIotmIvcb1fW8DPReYPWy+ZrJazRuL7qGGHV8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yonvIVVAI+uAHvGelOtgqlT/jbY6Fp77ncSqyDsN0/M=;
 b=F05p4Ua5xKiQVhxPMEatOH/F4yjcUIm4Cn9nX7kTdzsrfVLuSY4nL790HVGvvCErSaWJlmqVww3FO8D/NQj93mrriZ2fMVH7g6lw6TjSuTsF0E+jGpWjO+AvyXG5r3+fnwVYi+3OdY6Cn8Nk18vOKPk36KoxdvQwcoRyFWefTNR2z4H7Yu0N1xZahmvoe+oA9IhG9t9GjlHWYkNRWEM+ZZVBpZGXLtJV1JoqRweaEntWa5Lcapg2GND5DiU4iSFjykXUbDACBuvaOMqfhPZ8x0S/6+U62LC3ftcy//WYV1Lj9edciFNEBPSktag7aa48M+dh8mQ1Ut0avpxLcuXWzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yonvIVVAI+uAHvGelOtgqlT/jbY6Fp77ncSqyDsN0/M=;
 b=BxQshHXGhNQ44eu4aVKaJ40FHGi0AnBlE51YioWlZmjCOhF3HYW5C+OueNTGN3sx2r9PPhyphXdaSTu1Bbh2gXHgVKJYcuw8A1ccErGiItksNLkdXZJ9btlH0JVfiYc+PhCN3KkvB18c1Cyp2ZKQuXIoj655FnGFH6m0GfOkMtg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTu6qNB6aLoM+CIwDbXY1iK/PZuWbhCObjOW9/5dD5hpRbueARtmq+k1kQszJs6Itz2jg7SqBFMOQVPwo8gux35liLGTcgKxZNLSPwzdDcSSof4XCaGzcPw5lBXFoWjqT6UPcsFtJGaRN6U/ZyMLKBgsoZfF0s27/xls/4/I5AUYuJPO7FYHt3Jrku/t55U22JhcR9I1HsumgVj2p6cEFfLe881Os0o6TqlSrb2T5QNQ3bu8xkIRHoUqiDs/RRi3TLucR7g+OyMzgCmdUHpA8fkmDUvwgHzpQA7LzxxpV6F2MEOXicms8mAuWlEm7biEhBfyBlMSk1GtqurxLBM7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yonvIVVAI+uAHvGelOtgqlT/jbY6Fp77ncSqyDsN0/M=;
 b=JRaKLMKwq/roIwKrv+WOuYcL9M4tmjPC3h9n2GAIJ/DzOvlooNcAmevT5aUpSr7Een3A7apxZbAu4rdwTY2C6jCqI93XTUvZOE+rm9CpWHEO9YN/a91F8r9UXWocWpnyaly8YPkiEleBzFCQMGPDTQhcH5viRSw9z82t6DM2TfnXwSYHI/bElakzcCchGYEidoK4wdBwNg/IZWXjKGdxMDwfwqlJPtYBQzBo4DZJ9tMaVnqi4f8DRCAwIGaKGRnzQK5SIzuTjagkRhphMD/blA4yl+qTJa076L+0upEu0aLzMlWGcDvh1M9jgrXrwX/2Q8tL9Hup1rwpALt1wb4wng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yonvIVVAI+uAHvGelOtgqlT/jbY6Fp77ncSqyDsN0/M=;
 b=BxQshHXGhNQ44eu4aVKaJ40FHGi0AnBlE51YioWlZmjCOhF3HYW5C+OueNTGN3sx2r9PPhyphXdaSTu1Bbh2gXHgVKJYcuw8A1ccErGiItksNLkdXZJ9btlH0JVfiYc+PhCN3KkvB18c1Cyp2ZKQuXIoj655FnGFH6m0GfOkMtg=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 1/2] arm/p2m: Rework p2m_init()
Thread-Topic: [PATCH v5 1/2] arm/p2m: Rework p2m_init()
Thread-Index: AQHY4v1ZlXAD3ap4t02LRXIwxIJsRK4UOW7Q
Date: Tue, 18 Oct 2022 14:48:26 +0000
Message-ID:
 <AS8PR08MB799176C6282EC985F9D53DD592289@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221018142346.52272-1-Henry.Wang@arm.com>
 <20221018142346.52272-2-Henry.Wang@arm.com>
In-Reply-To: <20221018142346.52272-2-Henry.Wang@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4277DE1931EAA84BBF014CAD9B3E1AE2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6373:EE_|VI1EUR03FT032:EE_|PAVPR08MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: 8405cceb-4288-4d02-86a8-08dab117d80c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zCdKpx8TKeWkY+nR51lWAHnG5lndjEDLyPLJrCZv7Icy8FTU5oj9IdaHoHPwgHJ9oC2YjNtH80f/1/PhIqymkV95iUvDiz8fjWE8472EX/PudtfDIxMKs++JOq/pmRiMDqVXp/nbIX5qJeTMbeVfAhkvMHnmosizctrO/r0pjGkdfYb+11J+SEkLX5kY2vjHMrTkq9R7qBDbb55Bkkj3uQ3cQctCcKIzcbslmvGJZHQefunJU7IS46S0EMcMmvDabUDmH7Ftf/31+RxgjZ090VjsReUNnX/xwttk/uEn58imQlh4T1+zKk22MAk/VcK9Bjywh68OcKJRtUGvD8MjHP0j6Ag6akM4BuqrXueezQXBIX07P+7oItC4FVlbp4NDHYQY23mOCEd8bxbl0b1Zueg8eix44+3/XobSP6OW7MoKw49lGTK4m1lddkT0bBIhGkov7UjPd0QnCQMSta7pg7vcakksmjfdvUeWcjtvL3Wtv8Me0JZNQ7VIkBlFNo0jXkblE6wm4P/uTkoDQUkChH6CORFox7Yh+tjjAOVnCufAvPLBKJ6/YrCSeY1AhQk9psDRirnuw8UNToSyg4eMsZ3X059Jl0hd0jasXuKRgx+kKzYBYBzRPMeIQ3pnCvDoEkpVddk9glDKrGVVdCJXmLhzly0qxLlhwVEQV8k+Rp2oY+cR6ureM5SHgYL6QkpCRXDCmN3IbMC+8mfk7oO2bHd6c2B5Djsp6jGQGip2gMPZ7/uioPAQN6nseVE6j646tln/iFfzuXvnM1iam3AGDg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199015)(38070700005)(71200400001)(38100700002)(478600001)(122000001)(9686003)(54906003)(33656002)(6506007)(7696005)(4326008)(6916009)(316002)(186003)(76116006)(66946007)(66556008)(64756008)(66476007)(66446008)(8676002)(4744005)(5660300002)(2906002)(26005)(55016003)(8936002)(86362001)(52536014)(83380400001)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6373
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	887dfa86-2cb0-4474-a73b-08dab117d064
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ccNcRAIAIO+HvlfD0rMkZJHBLamM9ACw+PEBU+DamNFdCvd0NWhQrdxt77Aym+YreC1x+mlpllQWukzDynqgS4un2krfWk2c1aLcoTXo6PwPDNnbb16zXSDsU2cNvE/OG7yUSxoOLvacJuJyDSyY0vXFyq3nD8bTFEJYESpgqYCv2mp5FZrWYc0icG1NRZSIwVCRiqW1DWDjDzGqXsaUSnj243eYtpw0Ied6Z48bern3uM7yLTqEFz7nvKQgxq+yL81Y0oAqs3Sc21qrFEEhPKBzmqyYik2O1K0TOlRMj/9nreWcTtNXFED9Ir3xvndm8QyvQ//8P2QI/PNgckWhFG/7QlH3wK6RcvX/xVLgtiF/WCumMp5x2T/j/+PwIKiu8+bkhR/hdLS3RKRi/HpBdzmkM9LgAFnU7Q8Tt/cqnXBDuu43F0TmNJY4wowWONmaJg+VFUaw61PDgo8ZILrGG68069+oyBMjA2wMiuw6GrWuBKrRv8zona1jGwXbDEwJTtpgk5Nsh3qTFZxB7vTYXLM67L+nXTMu8AVCnWkn8GuDS10tnlsj3mnNuYd593MgFLwEbXiG/qAP6qxi53nDBigDfnKoBa9WmqVKH96INxl9SCLT7TXQXQD7/HNyqT8VGgQV4NQ06oShKYS/8f/Ni9Kh8ueU8RK/S1mi2mbXAgQ9ELgztfa1dJgod06BNYTzIJ/kM3ugTRamYQdHASGD2PWxG8mbSgH4XDq04zRWs2UYfAKwRvmLmfW5gZjlfO/q9oCP/CV/3AEKSpgkTU+HGw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(47076005)(86362001)(40480700001)(82740400003)(36860700001)(33656002)(55016003)(40460700003)(81166007)(356005)(82310400005)(83380400001)(316002)(107886003)(478600001)(54906003)(6916009)(41300700001)(7696005)(26005)(8936002)(6506007)(5660300002)(52536014)(4744005)(70206006)(70586007)(9686003)(8676002)(4326008)(336012)(186003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 14:48:39.2316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8405cceb-4288-4d02-86a8-08dab117d80c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9505

> -----Original Message-----
> Subject: [PATCH v5 1/2] arm/p2m: Rework p2m_init()
>=20
> From: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> p2m_init() is mostly trivial initialisation, but has two fallible operati=
ons
> which are on either side of the backpointer trigger for teardown to take
> actions.
>=20
> p2m_free_vmid() is idempotent with a failed p2m_alloc_vmid(), so rearrang=
e
> p2m_init() to perform all trivial setup, then set the backpointer, then
> perform all fallible setup.
>=20
> This will simplify a future bugfix which needs to add a third fallible
> operation.
>=20
> No practical change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

