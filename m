Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEC15B12D9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 05:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402480.644437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW86Z-0000IN-NG; Thu, 08 Sep 2022 03:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402480.644437; Thu, 08 Sep 2022 03:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW86Z-0000FH-JV; Thu, 08 Sep 2022 03:21:27 +0000
Received: by outflank-mailman (input) for mailman id 402480;
 Thu, 08 Sep 2022 03:21:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fLS5=ZL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oW86X-0000FA-Kn
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 03:21:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150043.outbound.protection.outlook.com [40.107.15.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5032df7d-2f25-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 05:21:23 +0200 (CEST)
Received: from DU2PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:10:234::19)
 by GV1PR08MB8213.eurprd08.prod.outlook.com (2603:10a6:150:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Thu, 8 Sep
 2022 03:21:20 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::18) by DU2PR04CA0044.outlook.office365.com
 (2603:10a6:10:234::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15 via Frontend
 Transport; Thu, 8 Sep 2022 03:21:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 03:21:19 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 08 Sep 2022 03:21:19 +0000
Received: from 020fb09ef794.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7DF9D7D-BFF0-41FF-8535-315F93B7A91B.1; 
 Thu, 08 Sep 2022 03:21:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 020fb09ef794.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 03:21:09 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by VI1PR08MB5440.eurprd08.prod.outlook.com (2603:10a6:803:134::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 03:21:06 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::b46b:79f8:a3a1:4447]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::b46b:79f8:a3a1:4447%4]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 03:21:06 +0000
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
X-Inumbo-ID: 5032df7d-2f25-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MCbkN2ky87FE8tHkikPT+Zn2PSSIaIGWoeEwkd+36zT4O8rBRJWUtGbsh/vqfPI1VG4L46qLgqTpxS5zCdAErunx1IyKHRXcv4/eKksvmjDR3w1Yr81ff62pohhXNdxFfqgPtPDllHBFcbwhtIthInjZ+5Azsx7mbUMdjIdFHdh5Da8mq/HVWEhQScLHG8b6kud9aN88PawEJ+brybSvabuoIGW+ZGEx9/1AE0K9KC1bLl6CMKaY7XHq2XH7cZJNnBc2eiVIvW+GpEXlaIi6mQp5wZQxQngMRhFmBum6n54D4ntGPGTd6LXsVvHboiNmvmUEnKGbR/fOSWzSk2FHJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/U9476IZa6u7fPevpiXhRXPuEl/tX5jEKvw3hV00AQ=;
 b=hK+A0plFKOtCsdGL8pwMriyscXdWD8Cue6Ag6Z4lt2IG+vlAMGs4sWTrhAjsNiefb/pmqofzVO0T8wx7NNYAueEx2gEILlP2liw8hgrmbLl+6JxAttBApkrR2VkwScLJ8Zl5GzLPGvKCMMfeIHK6GAjLyPvoCbDMi3X8z/iFyZtK+A47NnbjPsoxF+HEXp0e/d4X/wLKIqklBucY/SCmndvW05IDVFc8LvgPdTVjqUH09ok8oob8YF1MFFLGGgetevE5QSEnvoH9wxLVAa+jOHPi+804PVPZXA9WMl60VaAwBvwHQqJYBtmONy1P0E/abXkXyeIZuFYFQNzzautjqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/U9476IZa6u7fPevpiXhRXPuEl/tX5jEKvw3hV00AQ=;
 b=FTJALm0LzMOhdOMKQ4OVnnISnFCq3H3F5MLyB7LE+Omljm2XEGYJPF/vDDqbndUxpu6eo4OOsM+obZQNQdSrfZ+gpeVnpgAKDrbw19jb8MpD7m3rFVGGh5kmvTgK2aPneMh9q6HTBA+TJ+GGL7pK9xwPuLnatODbRc2cY47d298=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSNe3tONmhn8yNT1LgakwOIRp8VkyPh96xTRMrKOB0I6AbGMNZhlLd9Da/7vpqbx2W4kpYpZtIe0gjbj/fZjk/inJdZ4aBFiEUQpQnQATOcKASmT6+R05PqH4Q554+2cQqrQQuY3DztQPt8s/bQpjniFmZdH0fD5PN8i2ga5zWvwlR9y22O/bQuUAaWu0UySvNDRp3RE07V7DmiKrH3MNNbdjPrljWGuf22xvvfpH9AZ5jEBfYZNPeXhLi6toAf16o7UVivwb96SmToR0vGVtcDytNIwhSYNZbVmAJZ/8hnEwwbsr7vJLQyRUWC2IeyX+BfTCnB+HhmXVsDMozWviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/U9476IZa6u7fPevpiXhRXPuEl/tX5jEKvw3hV00AQ=;
 b=lHnz9j15+MY45IZNgI8S0lYclQKKywv5w6a630s0t8bBY7mftAh5jtfoVLn4OU8L0Da5sN/iJ2aV4Oi5/o7+7xEQT2ZWxkOJ0qUGP9gNpKT+S+cEgGbG1WkyldKn7IfsI78TtLMbqFzvxSWQWOB6eoL4+ox5iVBqma8847Lc/pVPa4Nv5b+bcqSNj121HsaDaSIpSIAm7c21wfMqbK74gdQmJ60zpzgTJGnwz4d6dSiczhTTVo/ESQU0tpLgFSuwH03sgO9xMTZlt++IRXaTsHPIVj0YviVvErTQGwLyvi/wNbA+vgP3A7xMy9w0CKUfJjEG2RKWh+57A84nCMjAKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/U9476IZa6u7fPevpiXhRXPuEl/tX5jEKvw3hV00AQ=;
 b=FTJALm0LzMOhdOMKQ4OVnnISnFCq3H3F5MLyB7LE+Omljm2XEGYJPF/vDDqbndUxpu6eo4OOsM+obZQNQdSrfZ+gpeVnpgAKDrbw19jb8MpD7m3rFVGGh5kmvTgK2aPneMh9q6HTBA+TJ+GGL7pK9xwPuLnatODbRc2cY47d298=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v7 7/9] xen/arm: create shared memory nodes in guest
 device tree
Thread-Topic: [PATCH v7 7/9] xen/arm: create shared memory nodes in guest
 device tree
Thread-Index: AQHYwc8kvpCr5kBYNkK7uFgrNrDZ3a3T+1kAgACxgYCAACtxoA==
Date: Thu, 8 Sep 2022 03:21:06 +0000
Message-ID:
 <AM0PR08MB4530B8CC3BFA44FF638BB38DF7409@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
 <20220906085941.944592-8-Penny.Zheng@arm.com>
 <ca8eeff8-f40f-0cf9-bde3-a733b61e3712@xen.org>
 <alpine.DEB.2.22.394.2209071710470.157835@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209071710470.157835@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DA9C9E622DE3B048AA34485FA936D7E6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|VI1PR08MB5440:EE_|DBAEUR03FT051:EE_|GV1PR08MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: f77bf9fc-279d-48f2-afe9-08da914932df
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X2DwjzBZt8qqwf+DYDo2kddIzxMASX5xF/xt5BhI7iOhwMMeunxg6/w/4YBy5Atsgub6tNnnSJ2fQlpzguXRNx3ZhI/Jx/JicN7eXsADY3HdTasX0Zksq5aYUpkWOso0jqwg1n3sXoy+fYBl6jrUw1G50EWufmOMz+xig4yxGD2Irj35qAhKtK/NXECRYMDRF3HqgT3NRPi0RMdsv3FWqomem+HetPNbmUXCdy7tvfiKINCV9cWRVeMjB1CfM9qhOWY+JJlZpXlYrAx+xfydGH36CyfGKfOVV8+gATAZXJSOvlHb6PDu6mCOaM8AWT0B0pHd8Exg4+dqOcSfgpfZWOl6UAthT0X00ZaZ0AXRxYP+Sl8JA/aW2M9WNEafhSX5QWjKE00XkmlIFb/TitkEEem3zlcZURU9B6Uj4BGOfDTYyTABB6H62wMeSdiDogGiTWDzIJLKqjsTaQQpTUpEz2Mbc/ejS/TiooKENdmn0YKldVhJ2yANRTWR8FHYOHkdBWpqxygrzKEfVr4pfrQtywL98+kQ8ndgxcp1tBe28gJiDVfYPEmFpu8DXuKUwyu+duvZXjmd60Xt2t3b+ZnsFknQy0yUQEOxvx5KfIIiuXIz9VTMzokk7oDpuHrzV3h0u1FLN9DU9J+iB+MQ0PTbGQYRLZmWXVYyJYNDc2xkI1sPoLDVsIzkXfhk8VdR4oMEPxYeq6vDCEfHcDTkRjf5BRYVDe9Mv0pOq9bAwiARS/yeBgF0WNIpOcD51nLUyCZoZ4PHc64Hw4e6iCa5FkNsxfU79OcG9MYV9TE08IZ7kiI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(66946007)(186003)(66446008)(33656002)(66476007)(54906003)(5660300002)(64756008)(83380400001)(8936002)(66556008)(8676002)(76116006)(52536014)(966005)(26005)(6506007)(4326008)(53546011)(7696005)(478600001)(71200400001)(41300700001)(316002)(86362001)(38100700002)(9686003)(2906002)(55016003)(110136005)(122000001)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5440
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81617ae3-8665-4f86-3c16-08da91492ace
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n5bDpa1/D15yizsJHBOSzfGM6N1udpTdckmrpB4imHuR9h6PdJZQ1/zSY6Um4drlagU5Na2khiKPeQXZi8xJbqQ+bXFqxbCvVYc8KB0Bq4Ub8YX3WueQev3hbKCeg5fgbP/hLa2JBPQGBROAsk1sho7S4AtBWKyqbbJQnSIxBAejcKQRtffO8x8MaET2bfa6EXDb5m7G1yqjHlyV11WxlqWh5rSAemBHwm1Bzvpa1q4tZuQY1eN/DaEMVNUKHEhdT1CT+l12WWzwdyQ9oOZAP+uelugeW+d9PrWADJEyXdHxhJV/toMrBt0DwNlEC0PVmtv1RyRz4gQJZlEarR9ph6+1WFvz18IDOIEtraD/fQRULEfSIjXlF6p3enCSMoYQ1fECJ5qallC/zxgtlNlowTl0o18B8sxOSwshLJ7CqHynpSf66PaEORjMubStDev8lw4da/QfM8iO7DNWdd3yoZ2PuMU7sI0winnI9ZJx/sl9DoGgi8vRkKbvIQtGyw9FKPJOKbs8e8AWv1XtOrax9iiCCgUgKpzYkso2295p/zWP2Dq0aYefQeg8fjsGRnV4z3mKrRvo206YmSLO0PhbQVT8HY2N6QnjbYqEkHcp+5MKnNjnZbpbGZUfFzET5Sel3ldIh60XuKBGbeXiVDbezzL3efHLKJMyhFWYig4I3xPuNKvxwSiT/99wur9t/ZmrGC3ymr7l/p8ihpRfExWktQ0MYnP4ZfZN5tEzBWFr+e4c696hPBaOFdFdNjGKNRgnxwpMlDWMYWdUaKLhFC2eDHYTxkyGPd5Ow01PORzGyOU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(376002)(36840700001)(40470700004)(46966006)(47076005)(107886003)(53546011)(336012)(6506007)(26005)(36860700001)(9686003)(8676002)(40460700003)(83380400001)(5660300002)(8936002)(52536014)(7696005)(41300700001)(4326008)(82310400005)(55016003)(40480700001)(186003)(54906003)(2906002)(966005)(81166007)(70586007)(478600001)(110136005)(316002)(82740400003)(356005)(70206006)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 03:21:19.8506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f77bf9fc-279d-48f2-afe9-08da914932df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8213

Hi stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Thursday, September 8, 2022 8:16 AM
> To: Julien Grall <julien@xen.org>
> Cc: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
> Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH v7 7/9] xen/arm: create shared memory nodes in guest
> device tree
>=20
> On Wed, 7 Sep 2022, Julien Grall wrote:
> > On 06/09/2022 09:59, Penny Zheng wrote:
> > > We expose the shared memory to the domU using the "xen,shared-
> memory-v1"
> > > reserved-memory binding. See
> > > Documentation/devicetree/bindings/reserved-memory/xen,shared-
> memory.
> > > txt in Linux for the corresponding device tree binding.
> > >
> > > To save the cost of re-parsing shared memory device tree
> > > configuration when creating shared memory nodes in guest device
> > > tree, this commit adds new field "shm_mem" to store shm-info per
> > > domain.
> > >
> > > For each shared memory region, a range is exposed under the
> > > /reserved-memory node as a child node. Each range sub-node is named
> > > xen-shmem@<address> and has the following properties:
> > > - compatible:
> > >          compatible =3D "xen,shared-memory-v1"
> > > - reg:
> > >          the base guest physical address and size of the shared
> > > memory region
> > > - xen,id:
> > >          a string that identifies the shared memory region.
> >
> > So technically, there is a property "xen,offset" that should be
> > specified for the borrowers.
> >
> > TBH, I don't quite understand what this property is used for. So it is
> > not quite clear why this is skipped.
> >
> > The Stefano is the author of the binding. So maybe he can explain the
> > purpose of the property and help to document it in the commit message
> > why this is ignored.
>=20
> It looks like it is something we introduced to handle the case where memo=
ry
> from the owner is shared with multiple borrowers. Each borrower would
> have its own offset within the region shared by the owner:
>=20
> https://marc.info/?l=3Dxen-devel&m=3D154110446604365&w=3D2
>=20

IMHO, "xen,offset" more fits in the xen dts? We configure it in borrower me=
mory node,
then later we shall only set up foreign memory map starting at the offset?
'''
        domU1-shared-mem@10000000 {
            compatible =3D "xen,domain-shared-memory-v1";
            role =3D "borrower";
            xen,shm-id =3D "my-shared-mem-0";
            xen,shared-mem =3D <0x10000000 0x50000000 0x10000000>;
            xen,offset =3D <0x0 0x01000000>;
        }
'''
For borrower domain, only [0x11000000, 0x20000000) need to get mapped...
Of course, we could limit the memory map in related Linux driver, but for s=
afety,
it should be at Xen?
=20
>=20
> The use-case is a bit of a corner case but it looks valid. If I had to do=
 it now, I
> would at least mark "xen,offset" as "optional".
>=20
> I think we have two options here and I am happy with either one:
>=20
> 1) we add xen,offset =3D <0x0>;
>=20

I will let v8 stay with this configuration, and a TODO for actual implement=
ation.

> 2) we do *not* add xen,offset and instead send a patch to the LKML to fix
> Documentation/devicetree/bindings/reserved-memory/xen,shared-
> memory.txt
> so that it clearly states that xen,offset is optional. I don't know if Ro=
b would
> accept such a patch without changing the version in the compatible string=
.
>=20
> Given the release deadline, I would go with 1). We can always remove it o=
nce
> it becomes clearly optional.

