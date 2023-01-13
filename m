Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A51966993F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477362.740051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKZQ-0008Ms-BB; Fri, 13 Jan 2023 13:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477362.740051; Fri, 13 Jan 2023 13:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKZQ-0008Jl-8L; Fri, 13 Jan 2023 13:58:12 +0000
Received: by outflank-mailman (input) for mailman id 477362;
 Fri, 13 Jan 2023 13:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=irsc=5K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pGKZP-0008JK-L8
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:58:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2053.outbound.protection.outlook.com [40.107.8.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f6524b5-934a-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 14:58:09 +0100 (CET)
Received: from DB8PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:10:be::23)
 by VE1PR08MB5646.eurprd08.prod.outlook.com (2603:10a6:800:1a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 13:58:04 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::10) by DB8PR03CA0010.outlook.office365.com
 (2603:10a6:10:be::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 13:58:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 13:58:03 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Fri, 13 Jan 2023 13:58:03 +0000
Received: from 663159713901.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1CC50B1A-AAEB-4ED1-BC6C-E4AFF7F9A264.1; 
 Fri, 13 Jan 2023 13:57:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 663159713901.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 13:57:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9867.eurprd08.prod.outlook.com (2603:10a6:20b:5ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 13:57:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 13:57:50 +0000
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
X-Inumbo-ID: 4f6524b5-934a-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/GM2z1yhQNqoAab/lYuXdYgVG6mkMHu1optzOZzNL8=;
 b=gnopeH7AD3VjeAl+wWfLAmRF/PrLAwWivDXRvsDIupPcV7yNT05YXTSF+OXgMpMDajHC6kneLNr2yOsodPkONBDhmc3CpijDR05eSQNmonMP8+L+fLQBbiwiyaoZkxTkDE6J7x+jlPWGO71jbtADrEwF7ixmGFqOy70C3z9R4AY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUmroZoJvpzTOeY4njWlqNRmS6BWAdqN4Lpsf8XNUzM3MfIAK7mX681P8oLQKbCXJf0HMp7sIbhKxkEBKrGiObrCWhfv4DPu1EDHlW+WKrJ0ERCYSVWTRZ8Of3TUCsUrmLZZ/lNrJERpY3YpQWllFsVoByaomCGsK9k/bZfODuFlvNGzNGGXrh9Lqi+th8JQtDsgVxxQrCgUiiOWIwyVYaxZCRtVRfOX2OCrnEGH+cW5ea+ECEmURcsqG/RPOvlp+Pgcfy8SJBeO1thPb9pORvFV2MU543fd/WmyiKPLyBK8dNPpba5CnnZN7/1xmRi4dMY35NMZsGdHzsIv9nJCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/GM2z1yhQNqoAab/lYuXdYgVG6mkMHu1optzOZzNL8=;
 b=OfREyhr203NLFQWKvLHII8CPV1puJDECQEYRdijCsaQNfqboDsIG2E2WVtQ7YrWfcRMIYtybk8/2FZUcuweeUYHQc6UikoskGC7JgEcNzAjMVKJ6jT10p2VQEmlSQSJLgrGlzCQE6erCUac6YlKJOLIp5aEoVImnfq0nETBPa0Ah8tKD+6hy9dSeM0gtE1hiICYr9aZXe0kBhSBz4ojdIY6KyFsqQZzPW8m6Klq0hrx1BOKbEcFUMHfC4YHQGcvuG+5BV+NGNmvlXA3aeFnNBxEghrRWuA1BI3sK/xsaF9fjS/63q4V0mgVOxoAvNDQke68auUI+2WBzNS7HZewDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/GM2z1yhQNqoAab/lYuXdYgVG6mkMHu1optzOZzNL8=;
 b=gnopeH7AD3VjeAl+wWfLAmRF/PrLAwWivDXRvsDIupPcV7yNT05YXTSF+OXgMpMDajHC6kneLNr2yOsodPkONBDhmc3CpijDR05eSQNmonMP8+L+fLQBbiwiyaoZkxTkDE6J7x+jlPWGO71jbtADrEwF7ixmGFqOy70C3z9R4AY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: RE: [PATCH v4 05/14] xen/arm: Clean-up the memory layout
Thread-Topic: [PATCH v4 05/14] xen/arm: Clean-up the memory layout
Thread-Index: AQHZJzeLCnyOeiX40USI61rJsfnYCK6cQS6g
Date: Fri, 13 Jan 2023 13:57:50 +0000
Message-ID:
 <AS8PR08MB7991F693573B0DF694104DD592C29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-6-julien@xen.org>
In-Reply-To: <20230113101136.479-6-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 058876024C00A441BEF41B750339BB1A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9867:EE_|DBAEUR03FT029:EE_|VE1PR08MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: b41d8795-cf71-4974-6d41-08daf56e30a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fgM6KzmEwM52yYF4j8RgJrvrwa2xWrSJaCAS/NE//l1jeLuRKuHn6nZtSl8PFivJBJ92ZOxh8G6gtAWcUh8DQ3GYqViEPbApc9zGT/UugAX8ONMhECk08cS3flzCiA1YunINNa7/cpIi7KsmsqFZrrdeanKFVXxLfvfm5f287sPU6i1jf5pZaUDay53b0ikMioLVt/i1bwrI+LpQK/1j2VZq5x/VZoK4nGoQ+ByAbGZui5PyBX+VZTENzO7KLAySwB3CMluN9N+T2XKuYilZ0sqyqneDaMxCc3gYffiDiOtJYkfONjxRx98VIOoFO0qtYVL6ZqY2/nJMlo01Stt4qeHVE3GVFLsb5JnuHTQ7rrIQ5ouJC/cSx1M/yjMVt9e5AdYIJCNdD6XOl2iNv42X+/Tpd9zJE9Sap0xfsqIOLPLAyX90mvXJ5dGZhbx62TRkIxPAodGfY9NETaPudft8ePbOBP2fSJ1WWbH+20+eUxSA+RUhKid1se+4sqTNGujq247AGRXsARsXN4IZDggrcYs+fX4r4X00SXk0Eylhn8dOZE85k6Qwidb8njmikKqL7uy2R+c9pffTvop0oISH4Beoz8sxGx5wpKLG/wbIczNHY89adb0tP7InV8QH/Yae/8GFil3jc58S4ScxJk52rl2M/P0xNquwvEjKPGnmTH3t3unHy+WMulJcNOmdgigM3/AYBNnFHhdPIO64tdX+lA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199015)(8936002)(66946007)(76116006)(66556008)(4326008)(64756008)(66446008)(86362001)(52536014)(41300700001)(66476007)(8676002)(5660300002)(4744005)(186003)(110136005)(478600001)(26005)(54906003)(2906002)(33656002)(316002)(71200400001)(7696005)(9686003)(55016003)(6506007)(38100700002)(83380400001)(122000001)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9867
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97997d2e-6f81-41f9-8e6d-08daf56e28b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vyu9pMYpZwFV2NgNcYvXdH/ETAeaDjtU0de713EfG4CJ8JEUqBxy/+ZiahUOWlBUoC/xglKnA8GxD8xX5kd+42G3/skYOJdEXFMG9c/2j/TLW3hY421fR7VBzKcWOn6ZN8nEM+Ni1KV6wZdpbz0YeOmx0mtymCMmHPW8H5L8esyOQGg8kvgX+LsCeWiwtrPT9vByW9pyzruVHCy4b6A+8b52tf9K8CrwScdmB+cK0IICIMgVw7KEUHgCnUY0R5Aki+U3Cvpy955O1y8UY9xWMY77MSWY7M1gJT9jS+kIrWsK2wwS8UikTnh0uSuAzUaE/cPjxEoeI+bzhypYMfpHpED++hcIi/4jeiSZV1e7yLeImmZ3u/p/0CamCfSfI8Q+gxpVW2QpyqTRGYu7kTw9PtO2oBwjhHUQLfZ76ViQ/proRKKOpTRzYq3Q37Ms7QeauVO/0SItlsZrA9JNdg2UOM5vdm6UcL2NN63Q7eUXgmZ5fOgnrGaLKTVDetcrN3n30BCEuExcboKd1F974pugcXUvYsO0+29J62xQYndW7mzsIhwj/5DIHKhIZt5mQvD2Ep+YrdW4VRoRq/12ggUZjGyg4boI0u7yI+qOKlXTMwr+fN8ohhlrWVYzMGnt4sRzIAfDpRczLIYWc4NMtY+kvtL4LJzkpmrrtvHjGVJg23BYNxUieYScnCwdctV4VSkLgbKcqv9iXgTq/Q21Dx8vJA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(82740400003)(2906002)(36860700001)(81166007)(6506007)(40460700003)(47076005)(33656002)(40480700001)(55016003)(82310400005)(110136005)(54906003)(7696005)(316002)(356005)(70206006)(70586007)(4744005)(83380400001)(4326008)(336012)(41300700001)(8676002)(9686003)(8936002)(5660300002)(26005)(52536014)(478600001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 13:58:03.7807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b41d8795-cf71-4974-6d41-08daf56e30a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5646

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v4 05/14] xen/arm: Clean-up the memory layout
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In a follow-up patch, the base address for the common mappings will
> vary between arm32 and arm64. To avoid any duplication, define
> every mapping in the common region from the previous one.
>=20
> Take the opportunity to:
>     * add missing *_SIZE for FIXMAP_VIRT_* and XEN_VIRT_*
>     * switch to MB()/GB() to avoid hexadecimal (easier to read)
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

