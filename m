Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8935172D78F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 05:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547749.855328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8uGJ-0000dg-Ef; Tue, 13 Jun 2023 03:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547749.855328; Tue, 13 Jun 2023 03:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8uGJ-0000ZZ-BQ; Tue, 13 Jun 2023 03:00:03 +0000
Received: by outflank-mailman (input) for mailman id 547749;
 Tue, 13 Jun 2023 03:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeqv=CB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q8uGH-00082o-6J
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 03:00:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe02::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61e052bc-0996-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 04:59:59 +0200 (CEST)
Received: from AS9PR06CA0403.eurprd06.prod.outlook.com (2603:10a6:20b:461::33)
 by VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Tue, 13 Jun
 2023 02:59:54 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::be) by AS9PR06CA0403.outlook.office365.com
 (2603:10a6:20b:461::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.34 via Frontend
 Transport; Tue, 13 Jun 2023 02:59:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.22 via Frontend Transport; Tue, 13 Jun 2023 02:59:53 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Tue, 13 Jun 2023 02:59:53 +0000
Received: from 1342dcd6ff4a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F86AFD3-F2EA-4590-A4DB-D29AE0F0EA35.1; 
 Tue, 13 Jun 2023 02:59:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1342dcd6ff4a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Jun 2023 02:59:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7782.eurprd08.prod.outlook.com (2603:10a6:20b:516::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 02:59:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 02:59:40 +0000
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
X-Inumbo-ID: 61e052bc-0996-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3uBn8S0Esx4+dT0ProAKDdgpAMgBMpc3eeOF3cyeJI=;
 b=8gpgQxQ5WHZIihr6/qtTFoHYQbvNfyj8bDpvKLcvf16NEQTKe1zHyD4W2sNBYB4rLWl5DWIGNhKGWrz5akUYT3al9a82P2X2oxokHXr1/6Pa/gGcSCL1vGVygPtLuRUXezG3MsIjglzM27DQzKDZMy+dOZQlgO7XjnHLEvVg8Ls=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITCv4ph7hq6QWpl6rz8WnOT/bo9desOV2UGz96G6vTOBNOVLqIauCsSRezePRvZuveXOXLfRsr3LZ/CdSXDugCm/XKQ9O0OVm7Tcs2oHo92ydNd8J5jjUHNBHBek9OfNLzlWkhCq6hbE0K/0qiZnFD2tT14Fr0+d30M6me3AZNGLn+1alegd8varvXQ1JheQc8+hjILIY4klkrl5TmiTUc2D2ei8i455MxM0lncoS9qtM/StSMOcNFYT89QZ/gXwIWkwOpK9PIn87/bzB4NATTyivZxHdBckqat9Ta98xGe5nHUeZGG3bI2AmVeyRzDIbqRRAakx30Lc1Lzya2GTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3uBn8S0Esx4+dT0ProAKDdgpAMgBMpc3eeOF3cyeJI=;
 b=kA8TgJhSLIA4duiwK3h/TBQTjiu/uVFlWGUd9qUpH6zq3OuNH0Et3kjb3guCdmfXdng2mFjTjfQHFz7eJtLDwG6OUJGtjeyvPKX9vI+sfZLpyUhyG/02Z1vmNvn3H3gKWt7nsnXE0qQ9Sz++vH3daPBmcjOLhNXhK4itBHIZ7dN/7oH0hh9y97UdVVStlzlvi/eJeiOfKvUcIGkxYeDJIQb/F2NNGzmLw/aMcdsWvAGBDIvWEEwFpMXrt3qXsy7SQ3cO6hIQ3y9miBhykse7Ldcsg6HQOIfqdIEH1UASHwVRWWQoAD3gLvTSNQreQptpH/tQojsbPLSiBGbRXr2fiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3uBn8S0Esx4+dT0ProAKDdgpAMgBMpc3eeOF3cyeJI=;
 b=8gpgQxQ5WHZIihr6/qtTFoHYQbvNfyj8bDpvKLcvf16NEQTKe1zHyD4W2sNBYB4rLWl5DWIGNhKGWrz5akUYT3al9a82P2X2oxokHXr1/6Pa/gGcSCL1vGVygPtLuRUXezG3MsIjglzM27DQzKDZMy+dOZQlgO7XjnHLEvVg8Ls=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 3/4] xen/arm: pl011: Use correct accessors
Thread-Topic: [PATCH 3/4] xen/arm: pl011: Use correct accessors
Thread-Index: AQHZmSJrAg4IoVREJkadpE/KogPaxK+IAcpw
Date: Tue, 13 Jun 2023 02:59:40 +0000
Message-ID:
 <AS8PR08MB7991D60E620CF7417E33CDB89255A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230607092727.19654-1-michal.orzel@amd.com>
 <20230607092727.19654-4-michal.orzel@amd.com>
In-Reply-To: <20230607092727.19654-4-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4F3F1BF366F78D42B6F3ABDA06696AC6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7782:EE_|AM7EUR03FT009:EE_|VE1PR08MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: c17f816c-218b-4a10-caf6-08db6bba42f3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4Ojkzdv5Kgwnp4epvjugnH4fTdWNfb8nxCbzwnYvNE2PvQGErUca0ShWRvI1DeJQhPwjJFepyU4ekTEIQZUDbPWWewsL7qN5PNU/nKudMqW2U4R2sx9kGjlw0iwW+qHhUNi4EXT9NAYf9jOySC/eLQv6i/uw1b1tX0cbJn64K5jkDWD2cbvDV4R4Dwrs6Ha1HlBZrC//5osMHekJKKooDq7HH9AyfPtz2WARdc4fvUTx2ZQHek7qctLhIAz4A7sPm2TdU+u0p6jDJBwE+q9pCvTtbTtuvSI0lY7eavo+0DAXxhBmz4PRvHlV2S6wuL/sW1Glt81BgyaEYFyY+vjxxf9M8E2j8ptrqL4uA6hChFStqUdWVTG5NPa2IE/QSo4U8zwPlzDV3Iua/ba4qQ+xM/p06sMa9GSnTR4/Bbam5eu2Tel6SFa7ty8UzA+LcsUA9rWjxDX6Ak5pTPxLQMZ74kIpiVRphsWhu00i0lV5JOvng2rH/ZT8WG/2WRzp/y9bSestPTc9saOh99nUc+o1ZjW8LRBFPcsvtX8o8aV+PGJMkCXf7EawsB10Kf+ktphYSbE3e0eZw3GtllIbxNmVqlxcMhMAgI133V2QBeol+HeuksgNElyzsCPzBNzKAogm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(186003)(9686003)(26005)(6506007)(83380400001)(71200400001)(7696005)(478600001)(2906002)(55016003)(8936002)(8676002)(110136005)(54906003)(33656002)(41300700001)(86362001)(38100700002)(122000001)(5660300002)(52536014)(4326008)(64756008)(76116006)(66946007)(66446008)(38070700005)(66476007)(66556008)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7782
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c452f361-2a48-4284-5908-08db6bba3b69
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bsv8degUI3AY/PoXNmHc8YrSmfelXNrldKWrjviyiDB2zEVN4p1kvBx2HZiMAWGz0E77rqOLqrdag9ivf78xyObDGwygV+F+WV30sqOuxK/GmIe/QyV6nuuzZcwJDib1rIKnRwJknn/3K8FCw7DBeP9ZgegUXkK8kLnBP3Iy+oB8Iodqj5crTW75sw4O+xqRpKvNmVYHupNZo1dZP8AGU8aCNKpHTUoWgEaBeMiwD6yOK4QSYX50LcdQj3Rqbdc9R047c6WnPX2vmChhRrSRf2KsReggL2ycugurTkhIb5P6OObTHYThq/T5fzbKxB7MeyKhQGM00r6IW+RgkpTJ23Zhh601F/zXdfP9kQ5BiW7QNHlRaLwUTwGgOuvhj2DQArBcNSDKlm+4Iu8Tm5HUzbeuYtE65v1kXtMx3Ie3XpDNf2XO1uJ5DiLVgWUaP4QKf6OuYGPM2JHlsZQWroexnAD+rWr3JJpGD+uO3+LNo6sN4KTsDmNQ3TJoyVIcAbCmIO50RhBMjJcaD4xoeqvrsFadcssKcLylQ5lzMlwrWIG/DnoUx0fUyo+qO3gYMFbZ3nUYi+ZsYBwTJoZ/S3ism+AHno4nAx6yVhmH71a3wz2SiolKynXFpL20ZNK+pWg2Wh9s4u59VFaLHaYu6sTw5i9E8MxlW9moMmrtQ8BHNE3Rx2zNB3o34WSmjXDQCAf+SFxuJXJCrqsu1GnE/vGyPuf4QxShip8OZkE+vtb+h2o=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(41300700001)(40480700001)(5660300002)(8676002)(8936002)(52536014)(54906003)(70206006)(70586007)(110136005)(4326008)(316002)(478600001)(2906002)(40460700003)(55016003)(7696005)(36860700001)(107886003)(336012)(33656002)(186003)(9686003)(6506007)(83380400001)(47076005)(82310400005)(86362001)(81166007)(26005)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 02:59:53.3950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c17f816c-218b-4a10-caf6-08db6bba42f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5677

Hi Michal,

> -----Original Message-----
> Subject: [PATCH 3/4] xen/arm: pl011: Use correct accessors
>=20
> At the moment, we use 32-bit only accessors (i.e. readl/writel) to match
> the SBSA v2.x requirement. This should not be the default case for normal
> PL011 where accesses shall be 8/16-bit (max register size is 16-bit).
> There are however implementations of this UART that can only handle 32-bi=
t
> MMIO. This is advertised by dt property "reg-io-width" set to 4.
>=20
> Introduce new struct pl011 member mmio32 and replace pl011_{read/write}
> macros with static inline helpers that use 32-bit or 16-bit accessors
> (largest-common not to end up using different ones depending on the actua=
l
> register size) according to mmio32 value. By default this property is set
> to false, unless:
>  - reg-io-width is specified with value 4,
>  - SBSA UART is in use.
>=20
> For now, no changes done for ACPI due to lack of testing possibilities
> (i.e. current behavior maintained resulting in 32-bit accesses).
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

I've tested this patch on top of today's staging on FVP arm32 and arm64 and
confirm this patch will not break existing functionality. So:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

