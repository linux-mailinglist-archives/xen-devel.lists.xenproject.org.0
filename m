Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2151B64A
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 05:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321345.542322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmRoW-0003OG-Iu; Thu, 05 May 2022 03:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321345.542322; Thu, 05 May 2022 03:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmRoW-0003LA-Fd; Thu, 05 May 2022 03:06:00 +0000
Received: by outflank-mailman (input) for mailman id 321345;
 Thu, 05 May 2022 03:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1YwP=VN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nmRoU-0003L4-CF
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 03:05:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7d00::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 480b780a-cc20-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 05:05:56 +0200 (CEST)
Received: from AM6P194CA0026.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::39)
 by AM0PR08MB4579.eurprd08.prod.outlook.com (2603:10a6:208:108::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 03:05:54 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::cf) by AM6P194CA0026.outlook.office365.com
 (2603:10a6:209:90::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 5 May 2022 03:05:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 03:05:53 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Thu, 05 May 2022 03:05:53 +0000
Received: from 8e098e39ccc7.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91CC2C7C-1044-4C5B-8BAF-025743C9C347.1; 
 Thu, 05 May 2022 03:05:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e098e39ccc7.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 May 2022 03:05:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB6065.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 03:05:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d49:4e03:8569:a07c]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d49:4e03:8569:a07c%7]) with mapi id 15.20.5144.027; Thu, 5 May 2022
 03:05:47 +0000
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
X-Inumbo-ID: 480b780a-cc20-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m2MZ48G32ypJ89kPfrkYzTha0YP5d3dbkZlumJCuhSWA85z49e42l3aTHOC95DDb32m8EkAgJxtD9aumssaClWrx1HIGsWwX2Y9Iw09PULPMHnHkkendBur9nVIm+SNyT1ymrK1KjHS6lDmChkaE8M1KWJGChWUqd0E3fzOMf0tKWwV9gGgj6TifZQDcAj5q5/IcF3NxzCSBfDmwGsiScojTqxC+PEBCGy1227Rh1qMlfJE+HXJWJS100vbNHVUDJjiHf7JUBQLQDq8u2do0w2FTPlM8lG6v1VPyLWfuhos0jbQEkwPSoV6kvaZ4I0T8vr+EUJhdIxQz8ywNpWW2Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0camEZonS80+CVpXWAhWKiF8eJGcPHgNQwdL9gW0WjA=;
 b=I0j03R+tV65Hwx0e19Ya9TItyB+GKaFIQLipl5krm3JOdX5GAsYAEcKK6qKUWpnX0aJExQEbz3VuH7Hf9j0CvijuhwtcxLh3AQLqdNo7gSxTaguWLrcWj5IJiTp9OEnRdc8DEXOKnEds35qrk73gdln00msA6E06vYpb96Qv2vVxKSO9FfEwGqEKTBNmA+9Ri2IQ6Z7DImjWIo/m+0AExnyfVDIxRkcY3mhq4jhTXsi52PE2G2BLyp3Tp6WFILFlRM+LXASxMmLXJ3BAASa057TlRzjWzhBU0mZQsEgaKQ/9aTokF/M4KftfSrdPaeQdupXv/PFANxe74O7DXZnjuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0camEZonS80+CVpXWAhWKiF8eJGcPHgNQwdL9gW0WjA=;
 b=8WTP8A/pUzhhLwwHcmOv8Wvl2Xr+br+45o4DlmBPi5ZCWH9Aa6m2ln/7HDhuNRoqXDyVcX6CqqR59xJdGMKfeyTyAqPDESS8QwP6hbnhFH2pzoFw48a7gjXzZTYDVboWSAkfnQqJkHEFbiOcZRQDN8lWBWM3kKAWuuS4VtRKgbU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwfvWC51KH88JCmWExVWOz8polrWWg48wDeuoDIWJMlYx3Uaglb7G0ytbjotQ+DEOFvhIGvpBYC18KjMNaKYYrI8adyYkA5LEVdEWbgpCgdC7GNSOnarG9t3AvpN+/sJKtg+Ab13SIB1j+JdYQDhIPAVDpTujRV2ySczG8NNSHsH3qd12x+6CLNIppnOhNvVMN6aBlPET+L8Bld8mKLxv9U0pEDhuSz6dC8c95MRyKPbewymm/Ed4gpBLSbmae0SvMcn1DBoxMySTpdbKFbI6QTgvdF4U1EXYIExfyE6bf4wH6aXjMsz/bOoMWmwtUDMOqS4bwl2R/TA/0F1xRrT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0camEZonS80+CVpXWAhWKiF8eJGcPHgNQwdL9gW0WjA=;
 b=N9f9XISvJut/gyfeL0c9oW00vSdTJOcLrwuKUgtJ8RL+TNlcjI0oYwY/Gu5+vPZsn/Td6sj55c8JQt7GhzQwy4VFPzfxqI3Ag+xBrs27bMIuheAJqrXbmiit/OZyQNwTjY9BIa3A8RX814Tlsu3b+aF0t/4rYTRJvMygwGyZsjBYkgtVHzabAz+nZkBmhvTG3HFY0pyTZ9P1WTXdMtdnYl2CIZ3lb3gUeUlaPN82z7+AL7/3bhZfHVU004dWQqRCneRJdv5/CMGRfvJO+bP9wrum0tPRBIClby7r+elGRE8aJvEw4Eedt4b7P+7uLmRwiy//lGjJYNSybdZRWSdmdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0camEZonS80+CVpXWAhWKiF8eJGcPHgNQwdL9gW0WjA=;
 b=8WTP8A/pUzhhLwwHcmOv8Wvl2Xr+br+45o4DlmBPi5ZCWH9Aa6m2ln/7HDhuNRoqXDyVcX6CqqR59xJdGMKfeyTyAqPDESS8QwP6hbnhFH2pzoFw48a7gjXzZTYDVboWSAkfnQqJkHEFbiOcZRQDN8lWBWM3kKAWuuS4VtRKgbU=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH 1/2] xen/arm: Defer request_irq on secondary CPUs after
 local_irq_enable
Thread-Topic: [PATCH 1/2] xen/arm: Defer request_irq on secondary CPUs after
 local_irq_enable
Thread-Index: AQHYYCt6dq3rsqHdhkOYsjKIcgbjk60PmQ0w
Date: Thu, 5 May 2022 03:05:46 +0000
Message-ID:
 <AS8PR08MB799131E7B968FBA6CBF3571D92C29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220505025407.919988-1-Henry.Wang@arm.com>
 <20220505025407.919988-2-Henry.Wang@arm.com>
In-Reply-To: <20220505025407.919988-2-Henry.Wang@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0DE3494AD93B024D892B9E0F6314E6D6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: eb1ecf6b-0b76-4b77-e6cf-08da2e442acd
x-ms-traffictypediagnostic:
	AM9PR08MB6065:EE_|AM5EUR03FT021:EE_|AM0PR08MB4579:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB457974CF078AE5662794171492C29@AM0PR08MB4579.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QT3EuU8v/L15nia5LdAoeWxHZyMlJ+gSg5CUWOEkO2BSlf+dbzYxJQcpJf95tWXxxD+QvzDSONSor67kVpySHsEiIa0792OSGO+V54CT642cEIHNMINtBixwI1pnbEsSOnO7eqZCltAIL1cNAkYm6m2aMmZf/TZksIhFuPEDOqr7rTJL5aKhPCiIM3dg5mDPdgcN2ns0mqOdmOv/jR/V6M/IIs8Nn/0hQYE3ekhTR5kshJQFHVjOC11lBLjIrXBSzhNiuM+OjJl6r69LxdvFbBZlgq/av6txvTxgCUDCu7722xb3oMRILuKmVHke5Jel0ET8I+KozXx9QAarDb+YA3tRIpcRebevQEVIePNj5QRfjP3q0RCK4pyzehZGydxn535X4Pv24c5e5YL4eKo52+/oCDZLXnigWH8Gt2XKYRXbQ3v19Y/enubmByABZuXkVLHkOkraOqk7Sz9Tc9DNS1USgSLpGOVQIYUYkQBHlAapjXD0/xSwY/lPVvXkiMQbAgEM1RhLMgV2dlHIqjiQsQgQLCu4z6RxZ1n2Kej2eXQoSUmQYr9gYWh8ikVdcYIsKVPD5g8MR9Icwlr7gVmMoJeA8EPcVA7tqmRPltSSU9XvD0hE4LlN1y6BKbn22ydWVscaR/YISjnGpCTL+IfywbgFU73AxXgarmTBF5Z5QAagmKPFbf+BKfqo2Z6TwMd9zR3pkVh2OBBmCzjQt+NzkA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(508600001)(66946007)(76116006)(110136005)(55016003)(8936002)(86362001)(83380400001)(186003)(54906003)(71200400001)(7696005)(9686003)(6506007)(26005)(38070700005)(66476007)(122000001)(6636002)(66556008)(316002)(8676002)(64756008)(66446008)(52536014)(5660300002)(38100700002)(2906002)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6065
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1c1a778-4c85-4675-27df-08da2e4426d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6kp8m/Fn8254z7gL831jQf9E6IQyFXA87xzTHkafzFoRq/RkYkIGitB9wHc/uBRvKM+VQZy8cf8yULawaUFIHwvopXtLDi1MsuiDCyW3ksu/cqAGN/B8JacK2aJPG7ep9Fj3nM1/r2dO8bpS3P5O4glRqtMJfJFkpVhXHd7z7EqThLQec0501OWb0ripZbDTJd1QoThpRAM9xEZvbPqFBGkDl2/j23rlLe6oXWWHQ/h3x9I1obel9s4+LLcPGWPhVkEAbMc9/ch3QMYgrPyQwrrI5t2ykFrLZduNFBi//il9ZRSLWoJqtRhkAHfqv+r+02UABc33Tw21MSY0WQNb6efsTy275MEdxryR2nsgLb28hsFm4tg+M406dFEXDDsWbtm+9ViQxh4cy68nV/3MF6XrDqCmOX5hjXujm3iWTH17atQPsXDJcVuiQeo+3ER7a4vSOJN5an0ghdjykbyJEUMvayaZiOfuH0TtcqfOeSk+xrNlrjiwc+iYuWcNTirbX9BbxkFCNiOjiDtFdUGHZIaGRO/S2wxszboyImTtPabsSSUe2yGdasaYYWUcI1Ja+Y0h/SAsVUoFUfVpPxVwaEgFZMbpDAs6r7r7kSgYKj3jH6jzJyNsXvz1ummPV9UBzwvKx7x0frS6OFTPob7B6BGP2d4fe9DoSkwLyg+8YFlQgPVJDsWlZCYRds+sq6ah
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(107886003)(40460700003)(9686003)(7696005)(356005)(26005)(6506007)(81166007)(5660300002)(2906002)(33656002)(82310400005)(36860700001)(52536014)(8936002)(86362001)(8676002)(508600001)(4326008)(70206006)(70586007)(83380400001)(336012)(47076005)(110136005)(6636002)(54906003)(316002)(186003)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 03:05:53.6512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1ecf6b-0b76-4b77-e6cf-08da2e442acd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4579

Hi,=20

> -----Original Message-----
> Subject: [PATCH 1/2] xen/arm: Defer request_irq on secondary CPUs after
> local_irq_enable
>=20
> With the enhanced ASSERT_ALLOC_CONTEXT, calling request_irq before
> local_irq_enable on secondary cores will lead to
>=20
> (XEN) Xen call trace:
> (XEN) [<000000000021d86c>] alloc_xenheap_pages+0x74/0x194 (PC)
> (XEN) [<000000000021d864>] alloc_xenheap_pages+0x6c/0x194 (LR)
> (XEN) [<0000000000229e90>] xmalloc_tlsf.c#xmalloc_pool_get+0x1c/0x28
> (XEN) [<000000000022a270>] xmem_pool_alloc+0x21c/0x448
> (XEN) [<000000000022a8dc>] _xmalloc+0x8c/0x290
> (XEN) [<000000000026b57c>] request_irq+0x40/0xb8
> (XEN) [<0000000000272780>] init_timer_interrupt+0x74/0xcc
> (XEN) [<000000000027212c>] start_secondary+0x1b4/0x238
> (XEN) [<0000000084000200>] 0000000084000200
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 4:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() ||
> num_online_cpus() <=3D 1)' failed at common/page_alloc.c:2212
> (XEN) ****************************************
>=20
> on systems without a big enough pool for xmalloc() to cater the
> requested size.
>=20
> Reported-by: Wei Chen <Wei.Chen@arm.com>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Change-Id: Iebdde81f52785b0c6e037c981ff68922db016d08

Sorry about the Change-Id, forgot to remove it before sending the mail to M=
L,
will remove it in V2. Same for PATCH 2/2.

Kind regards,
Henry

> ---
>  xen/arch/arm/smpboot.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)


