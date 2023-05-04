Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B606F6403
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 06:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529547.824026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQVH-0002tV-CL; Thu, 04 May 2023 04:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529547.824026; Thu, 04 May 2023 04:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQVH-0002rR-9d; Thu, 04 May 2023 04:23:39 +0000
Received: by outflank-mailman (input) for mailman id 529547;
 Thu, 04 May 2023 04:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ABSM=AZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1puQVG-0002r0-Ck
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 04:23:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7d00::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ed1914b-ea33-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 06:23:34 +0200 (CEST)
Received: from AS9PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::13) by PAXPR08MB6672.eurprd08.prod.outlook.com
 (2603:10a6:102:137::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 04:23:30 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::ce) by AS9PR01CA0004.outlook.office365.com
 (2603:10a6:20b:540::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 04:23:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.25 via Frontend Transport; Thu, 4 May 2023 04:23:29 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Thu, 04 May 2023 04:23:29 +0000
Received: from f83775cd8bbe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2CC55D5F-6E59-4398-825A-921D5D0CAAED.1; 
 Thu, 04 May 2023 04:23:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f83775cd8bbe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 04:23:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5742.eurprd08.prod.outlook.com (2603:10a6:800:1a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 04:23:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 04:23:17 +0000
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
X-Inumbo-ID: 6ed1914b-ea33-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HYqL7xhkw9+WdB4I1aHYn7t4ZClm5rVJZUpNZxuLvU=;
 b=GGwvP4wRizwIhmXGXkRlDay4pfHwTO7J6ibCdRpkTq1lGKk966seetuNM41l5TxaqS/TlOQJxlll+RG/NzF7zgHCOX6mCbTkYkORunjtM3nsbeujLVh/+cXJ0GZ4SI029mOdhJfolx8+QcMLPgJb255oqCLmsNVDfjIvId9lVPo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QldMFTUaabUlA+KJ6xPGELEqViReWBaQt2iHFKymtJgzm6p8LxGn9J1OazTlbsCmVPVX25dWM2+dUoDH6ikVSGf5GMYF4ngXEwsJeT2pXGpLrVd267Rty020tRaaGMo0otVxqFwsW9KX6BkyzpyV+WvUj2tUGQT0+BezBWPK0naEHX3+ISlr6lmK5bDhsv4cScx6Byx2PojBQ+0WhSTubIBuq8EsSi98zOs84ft+2kVVPe5bGh9gYip64nwVX32Y5yC3nDAtuHvXqgJ1mP/OB7izm9n9WYwF+ur7i8QvzQxkmaabl02Rsrfe16ZNnawDHjIdbhKQ+x7/pMxnbog/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HYqL7xhkw9+WdB4I1aHYn7t4ZClm5rVJZUpNZxuLvU=;
 b=KC+SyAoSAaq1bonYkrT6FSLYodgAkOA7/JKTrcLMweOew+qXY3NQCWj0RvqYXuGDDhtPQ8HS1EPv7scFTK326IdFuXAgx2HxPChIT+n8WWPSkiV1G7bB+qezVjL72xr32sxufLuiLVvlnAJtKdYEnr1ytysN4yssFf5HffJLu3SJoSgWeG5QanLP3ZV7NjBSVuk61nmFOYEIWF7Pp31PF9lr92TuSyhK8q7QgMrZOY0ehR548hBhmUvsoUtV3ZT0fmHObKyvtuQ8Eoz/rvovNdrVhzoi7C4F0lAATXN/DQZ20IicN+wzBon3cA9zzDHmNKhXx9GQWm8DBJr/CpsQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HYqL7xhkw9+WdB4I1aHYn7t4ZClm5rVJZUpNZxuLvU=;
 b=GGwvP4wRizwIhmXGXkRlDay4pfHwTO7J6ibCdRpkTq1lGKk966seetuNM41l5TxaqS/TlOQJxlll+RG/NzF7zgHCOX6mCbTkYkORunjtM3nsbeujLVh/+cXJ0GZ4SI029mOdhJfolx8+QcMLPgJb255oqCLmsNVDfjIvId9lVPo=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: RE: [XEN][PATCH v6 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Topic: [XEN][PATCH v6 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Index: AQHZfU8kxczuWvlyd0qZ9yNYcQTG6K9JhHkw
Date: Thu, 4 May 2023 04:23:17 +0000
Message-ID:
 <AS8PR08MB79910CFF4439E503046660EF926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-9-vikram.garhwal@amd.com>
In-Reply-To: <20230502233650.20121-9-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9532491CA0CA444AB7D822D303AFE3B8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5742:EE_|AM7EUR03FT039:EE_|PAXPR08MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: a91a931b-0fbe-4635-9a75-08db4c575030
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NASxhxlVnZp8OrUzQvzGDhRAqRAm7P2N6GSaFDhGOQL5176YCoRo3lOqRp5XvePbVMxAlVsXB++76GDPSh5/qIdTWCiej5Vna7ms+jc5w9pRQ0c0QnxOkYT9ETZOXGHw/KbDOykWMFlSRrZvE/8nepliabffW0hsyTvi6/UvRBVMUmoyU4dMuRQPGtago72OmCScEsU7Wk96+HqGxNRJ/VbLsiQfwzXcSfx1VoLJ2YKOGeDt+Y3KF+N34cCZnKw6cHU3dS9ZIfu7nMnIoRZsCA4TDaXJFO5SImfT0HqGn0xKgk9Eyk29brd7D5zgm273QTwVvCiQN6K2p7d3PgCB+f8qNGFmORR53vYmb8SVd4YKdEqqF3OxR0J5qGWKHyppaehCpy6SXzRELTjOgkr4BampOi3uaPs07M0uy72/ldcBKkuNpcS3CPuOxg+rJXtBjBXLAI1iklGEHX5wUSiUYogiX6dUr9nruzt+V8eENgqXEUbYszMStNp31m+Npnfevi0FyMHkr2VrsrJCstNIf33nufDFQtDJuFQpPPDO4GcJS/ffELQZXd10LkWG04+LFEEE2wmXJeSQdUVEq4vB5/ZFrbYji7xgnFVZHitFKEQ7rjzkNz2jVlu+wBWa1t8MrX9gTS0Ke7oiOXoMlVqgsQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(376002)(366004)(346002)(136003)(451199021)(52536014)(8676002)(8936002)(55016003)(7696005)(86362001)(71200400001)(4326008)(316002)(33656002)(41300700001)(38070700005)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(122000001)(5660300002)(478600001)(38100700002)(2906002)(26005)(54906003)(110136005)(9686003)(6506007)(83380400001)(186003)(37363002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5742
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	762f33d9-5b21-4aad-bb9b-08db4c57494b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6ZY0uS7Jpe0PCPLFfA8Z+uuJOEdkixKYLR62d1AQ0Kr35rVRBr+cVeoFu25p5yiBEeTbfqvtdX+wTdepTG+el5GYg2IT052R2mw4YxaCSL+lTCSkymP49i++FEw+V6bffBZCfK08DT53VcMlj3nSAi5K/elFmy5Y4MTei/oPfGyIdxZV2cGHEg+fj1dPCHT4ruuPb2ejxyirQsk2T5WBQNilH7dFPVope07HPc8f5hJ1/6twybya1uMmAW1h0CZWs+pqnQ7WsQNl5OBLX46HGrPMCTE8hz3pcbglKAbRSGHAeqM8b0kVGLUyT3zIcbud7xVd5f3+NmO4ls2ipzx+i8WhKtsBvR9429aPlc9VrPsr3R24gWEFA6UZfVSrdZelTGS/FDbeqPPViUxEX1zksyrUvMjiMvpL7QUFlQ+ee/jJSTM7gmghZIJMCHFJhcKGyJya6CjCzlg9k1XZD4naCMl6zp8XLHDFqLkMTyNs+hF16P4mGgpeonrPLqRjciLkVmY5Vio24ktI2pkEvWFbSlUn93eh15UK3876JwMD/XrtbYmmPkAnA0L+2epS248qavWIePgj+LjgtKYy4ILXJFw91cv5rT3K8XoEm54N8QWWaVVM24MCuKAM/9XONhfFE+mfCEC5d96RQIONigE0TghKwSBykJw4WoDV2B53abNOoHqZ5X9mI1KPu3lyoFK364Qw1yNc1ogBdvGLXwDgrn3EyS+vl06XmwKspMJ1Lh/rVIp/mJkW/fBblz5Id0Dib6n0ngGNzICH9lfdlDOE2g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(52536014)(34020700004)(8676002)(55016003)(40480700001)(8936002)(82310400005)(4326008)(316002)(7696005)(86362001)(41300700001)(33656002)(70206006)(70586007)(356005)(81166007)(40460700003)(5660300002)(82740400003)(478600001)(336012)(83380400001)(54906003)(110136005)(47076005)(2906002)(186003)(9686003)(26005)(6506007)(36860700001)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 04:23:29.3816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a91a931b-0fbe-4635-9a75-08db4c575030
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6672

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v6 08/19] xen/device-tree: Add
> device_tree_find_node_by_path() to find nodes in device tree
>=20
> Add device_tree_find_node_by_path() to find a matching node with path for
> a
> dt_device_node.
>=20
> Reason behind this function:
>     Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>     device_tree_flattened) is created and updated with overlay nodes. Thi=
s
>     updated fdt is further unflattened to a dt_host_new. Next, we need to=
 find
>     the overlay nodes in dt_host_new, find the overlay node's parent in d=
t_host
>     and add the nodes as child under their parent in the dt_host. Thus we=
 need
>     this function to search for node in different unflattened device tree=
s.
>=20
> Also, make dt_find_node_by_path() static inline.
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/common/device_tree.c      |  5 +++--
>  xen/include/xen/device_tree.h | 17 +++++++++++++++--
>  2 files changed, 18 insertions(+), 4 deletions(-)
>=20

[...]

>  /**
> - * dt_find_node_by_path - Find a node matching a full DT path
> + * device_tree_find_node_by_path - Generic function to find a node
> matching the
> + * full DT path for any given unflatten device tree
> + * @dt_node: The device tree to search

I noticed that you missed Michal's comment here about renaming the
"dt_node" here to "dt" to match below function prototype...

>   * @path: The full path to match
>   *
>   * Returns a node pointer.
>   */
> -struct dt_device_node *dt_find_node_by_path(const char *path);
> +struct dt_device_node *device_tree_find_node_by_path(struct
> dt_device_node *dt,

...here. I personally agree with Michal so I think please fix the comment
to keep consistency.

The rest of the patch looks good to me, so as long as you fixed this, you
can have my:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


