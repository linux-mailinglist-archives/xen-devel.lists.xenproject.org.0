Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510675698F1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 06:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362726.592907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Ihu-0004BE-Gg; Thu, 07 Jul 2022 04:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362726.592907; Thu, 07 Jul 2022 04:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Ihu-00048d-Dd; Thu, 07 Jul 2022 04:01:38 +0000
Received: by outflank-mailman (input) for mailman id 362726;
 Thu, 07 Jul 2022 04:01:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTeC=XM=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o9Ihs-00048X-Qu
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 04:01:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7744f1-fda9-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 06:01:32 +0200 (CEST)
Received: from AS9PR06CA0544.eurprd06.prod.outlook.com (2603:10a6:20b:485::14)
 by DB6PR0802MB2551.eurprd08.prod.outlook.com (2603:10a6:4:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 04:01:30 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::c8) by AS9PR06CA0544.outlook.office365.com
 (2603:10a6:20b:485::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 7 Jul 2022 04:01:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 04:01:29 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Thu, 07 Jul 2022 04:01:29 +0000
Received: from 45ef77599f44.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48230E00-9F2E-4FCE-8EA5-FB8F9C4D4304.1; 
 Thu, 07 Jul 2022 04:01:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45ef77599f44.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Jul 2022 04:01:23 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM9PR08MB6849.eurprd08.prod.outlook.com (2603:10a6:20b:301::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 04:01:19 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%6]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 04:01:18 +0000
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
X-Inumbo-ID: 7c7744f1-fda9-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QGmKY5H+mdZFoWCA5CFlF4zOnUGsFzBxU1Vhj+edtAsjr0EMsJ58ZqfMkcDiF+bZb3Gv2UqG3Xem/g5LUdT8la+M4NxPwl2rsyTtDb7oy1OBuivfc3YuT6gohmxlz2TixzmKABDRRYTYnoirfln6J4BmVyU65c0GumsUi1dPWC2xbU2ZnpXmo2IxN990+58+d8YuKgstADiWF3/rKV/p0L23gGlHQdeCRyY8gCMKqSFfZ9I9/+EVE3SgCHbLCcgEtJGNPZy+5OsAORFSmi83s6wGbl13/MCgf9AdbshpaA+4w6kl8PwggibGyIiCpMZNlKkBAQm8yGQEVOkZWi2Y1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw1yN525yKkhsVbRuy1UxSu0d3aa02fU2gVk7Lvz1Ws=;
 b=lg1oyb2u3pLrG7XA3Wj+5W/NlHjoSS6b1RIFAQEYF5ciN32uvfMlUCmHNBDTuimUfWQP53K/lHCtr9zsjglotMUvmmwxwaCn7GGnO4Gv2MhhPV5SQqZgIW5m772YsdW87NIa+BuHmTIEe/cyQj6kx+pkiuG9xfyJBggUc5U1K+zBEdcT+KktI+9Dh1RQlzb6eTqE1MS6EDA1jIPuf6KbcUhOaZY7xgGSkDcei9Lpx43c4OWjkM22O6D/B9fJD/2R1zypoY9Eh0XykOCr2xcxecklhDPdAJeHOgpyfDKdOKZoHj8vTjO+NJMYuh1604VYmRCT7REBArzjXMdPiRuqCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw1yN525yKkhsVbRuy1UxSu0d3aa02fU2gVk7Lvz1Ws=;
 b=Blk2R5Wr9BHdbDncAP19HH6/9QHaNMhPkzC6NkCT20WoVtA8Tuu0ZPIGy3dI169+4DfoyHv+c672IkLMDD66m6g8tVdZPYpfp6lxK0K1l9zr7W+F0iEN0q7Ho5tQRjhgfy00B1X8vIzo8td5zuTgKp//D/GNOhl6eDZOMQkj2GI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaLvW58dp72jygXd1CLvGKGAiAVrjqqIUBZREhqR+SpjlRs1oIBA+pSHsmnIB4OVIMrQoyi7mG3y9vpUg4h3zhjFdGlVonMEHG/bn5Dj6TlC7KI8VGtOMcnQYVIrPACROgFt8lyx2oyQJGUFCJ+AtAnhkCmhg0/rSMdNY624uqZB+M8KVJL+jH7UOO1iiIIQVb0s7bti07EIOIzs/bUT9EsuUMX2zUvRZiVPEsrqkLQuMLu6XPEFo7IjMl0ornk5UbfOJ2t/ajFsHSABlz+bdUMnyPBu/jYjLqGuXskn+F91xGHzR5uf+XhYFbEwcK+WEibo6B5gZjfoQAK/l+78Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cw1yN525yKkhsVbRuy1UxSu0d3aa02fU2gVk7Lvz1Ws=;
 b=ASOQ4acl+4Xz7zh0ZK2BVFQaT74Jo8tT3cuznptW3NMq6LPvJ8iPZ6WLd22HkLAF5+/5iQOgkMt2vUtUxPdgnuPxQJG2wVVTCsm3+ZSgZ4lW+INoJRWkDW/ru5PZARqYMsjetFIS0DEIF1sGCpn2urBZdvDxydClads9IBRo6ww8IyY8l/TpBF+i+wEbpXEwg0P4TjtlaS5wGLkdyGOKaa3zmUqOtRI/VLoE+tiQN3o7lvHOJokG/+RHrzFzMGVpj0xFXF5zjGjj2fPLv/6G1GnbRrvvoSd2AwzVNyucYPVKvi6Askui7TzjbUcFjC+Mwcvk/2pAr7y7LUX/GHXubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw1yN525yKkhsVbRuy1UxSu0d3aa02fU2gVk7Lvz1Ws=;
 b=Blk2R5Wr9BHdbDncAP19HH6/9QHaNMhPkzC6NkCT20WoVtA8Tuu0ZPIGy3dI169+4DfoyHv+c672IkLMDD66m6g8tVdZPYpfp6lxK0K1l9zr7W+F0iEN0q7Ho5tQRjhgfy00B1X8vIzo8td5zuTgKp//D/GNOhl6eDZOMQkj2GI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
Thread-Topic: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
Thread-Index: AQHYhGRGiM2+sN9ON0uL+hMDdx46E61e+NuAgAApAYCADsZBcIAENhcAgAAuPSA=
Date: Thu, 7 Jul 2022 04:01:18 +0000
Message-ID:
 <DU2PR08MB7325C9A6011B877DDF09524FF7839@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-8-Penny.Zheng@arm.com>
 <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org>
 <alpine.DEB.2.22.394.2206241448040.2410338@ubuntu-linux-20-04-desktop>
 <DU2PR08MB7325CB781C338947D0576A19F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2207061647160.2354836@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2207061647160.2354836@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5801D63C32667D48A74DDFEB349B8CC7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e5fd3f23-96a7-4235-02b6-08da5fcd5f30
x-ms-traffictypediagnostic:
	AM9PR08MB6849:EE_|AM5EUR03FT017:EE_|DB6PR0802MB2551:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 viMFLsIGKfAhd8sIVYV7odOa5MwXtK56VeuElKZl0qu1w0OpajD7mOs8o8FewMLG7sg0v7bC2vUsYKgom/R5azXyVKs8sMS8XUmzUn5VHOB/nk5oFBl/bpHPsrSa4QWhfIsbCvKX1N/4P+GIIRBnq7RIppKdPLfFN9kqibhh2n98KFUap6oKx+lkIeTZ958yf7923zdojIlbZBRa8T9XikIcY00oFnnM7B9HTLZqRp39oy1yUjQnZZLxm3Ep0QvKs9S9eJlu9tT7YjKSp+cDw3gDDR04C3+IMTIRbMTUKe36dV8xpkzQYOOOpkq6ASNeb4y6COmXdpH5ojKT4H9ZbydKBayArEZKGZkufikox3FXlSUjfBIF7gINtKjatemoz/+BfWNzSfZEXTEbsl1ctXCM0R9hBi7fxummxEQ0naoDfQTF2iFozEt6HT/Xkd7hrwymTWkRTxtSJo9MCn5D+FNZ+wM0Zs5/UrN1vhKRBcwd5t2oHzaE9zj2jjDDatMPQU0lIAtOvxH1U2atCanWk45nRPOTbvhhTaYejAilI6L5SVlDiVBvWRz5m4JssmhzgiUVJwZ+K0q+xYQqCHnCS/Vfjrr7LC6HOKxu5nnGKchZdy++WpagHQGDe6NLH0XDV9YTsC6LPVGwKtcQ6UGxMMHQlCnwYhCzd5tULzpoSFCNsK6cC3QcViGwVDBApfHe/xGKIDtKdv/by9Eq38NpaaQZc+volEHgtpqOBQDkSkNvCiIxBGyHMRl1IhEveFV4h6K5hyh14jRQW/tc05cIrCP/PInmZ2uRCGS3eJHGkmVz0g2/w2EX9QzY1nyJZTaF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(9686003)(66556008)(66446008)(66476007)(5660300002)(64756008)(4326008)(8936002)(76116006)(8676002)(66946007)(186003)(55016003)(33656002)(52536014)(86362001)(7696005)(53546011)(26005)(6506007)(41300700001)(2906002)(478600001)(71200400001)(38070700005)(83380400001)(122000001)(316002)(54906003)(38100700002)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6849
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4f4c5b6-69e3-4418-e8a6-08da5fcd5870
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eM/jT2yrkcSxXFcQ1W+Z7ivJhdlXOUkH9k22/m5NlIvsrEAXiYd6f4l7ojiGqUs3Q1G1Gr76NZRpZoW8SyFh94Cycw/QINEXs9yoROWJgxJKRNGg9Lgh34KhHPJ+f5DYnAbSt7RD0qiDIFReDc81xk0y7kJz63C08GtZbEGJPf6e2N9JsJ/Q1nnswgFVw6lSLNTfJ+Btb2J2oB+R4k7hszJz3pbKHuZrEduObLjv3EwAVWuKahwMW02bsQWRuY2S3Qic23wiyfOJGmoBOU0thP+tmXI7BzxLYDEYCFwHevC15MLDxRXAK7kLu+YbTEazsU4M7QGuVe9aRk1BqOyrAg5CTzWF4UmsQ9yI6/rI/sg7kfhyeY6tyxBhfstkd+eo32/QNlnef9si6IGR2W3wZ2Ubd23cyUanZmQX88BN3tIYTTN1tS5duw0WJ9d91BKHQjj4IdTHqknokOX00oWPmTzh34F2NQAk3EACOyjsp3/CDwt0InIu09orNkDtjI1hKru/P8oPrJYvC9adjwx1tAgTbxGlcOtAioYa5TFD0sRx6uinYqzvr+eYckx/etuVK+sZs5gUuiMVTbv0hWIeCs0XOTltRLNhrqIKD8mX66XpX7kEQwiGXVISnQAROIAdk58Xqze8JiZxzZQZ2WxwwbZetoN4O6ZuI0dxwvIT6nVXbP7BwfCuC76eMu/4wmReaQxR6UnlLu8yecKcVvVeUcubTI6fgokAJI0GXf+NQ/g6pW0+x3OC29Xy4NJtUKHXQCqFyuAN6lBrkMkd9jY+HQ3QpAh5biEiUtWEnxs79zxzGiXWjdc6hhFSsyYguOxK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(40470700004)(46966006)(36840700001)(81166007)(8676002)(4326008)(107886003)(82310400005)(6506007)(186003)(2906002)(7696005)(70586007)(33656002)(83380400001)(82740400003)(47076005)(70206006)(336012)(41300700001)(55016003)(356005)(26005)(40480700001)(40460700003)(110136005)(54906003)(36860700001)(478600001)(9686003)(86362001)(53546011)(5660300002)(8936002)(316002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 04:01:29.5481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fd3f23-96a7-4235-02b6-08da5fcd5f30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2551

Hi Stefano and julien

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Thursday, July 7, 2022 7:53 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen=
.org>;
> xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>; Bertrand
> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>
> Subject: RE: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
> device tree
>=20
> On Mon, 4 Jul 2022, Penny Zheng wrote:
> > Hi Stefano and Julien
> >
> > > -----Original Message-----
> > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > Sent: Saturday, June 25, 2022 5:57 AM
> > > To: Julien Grall <julien@xen.org>
> > > Cc: Penny Zheng <Penny.Zheng@arm.com>;
> > > xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>;
> Stefano
> > > Stabellini <sstabellini@kernel.org>; Bertrand Marquis
> > > <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > > <Volodymyr_Babchuk@epam.com>
> > > Subject: Re: [PATCH v5 7/8] xen/arm: create shared memory nodes in
> > > guest device tree
> > >
> > > On Fri, 24 Jun 2022, Julien Grall wrote:
> > > > On 20/06/2022 06:11, Penny Zheng wrote:
> > > > > We expose the shared memory to the domU using the "xen,shared-
> > > memory-v1"
> > > > > reserved-memory binding. See
> > > > > Documentation/devicetree/bindings/reserved-memory/xen,shared-
> > > memory.
> > > > > txt in Linux for the corresponding device tree binding.
> > > > >
> > > > > To save the cost of re-parsing shared memory device tree
> > > > > configuration when creating shared memory nodes in guest device
> > > > > tree, this commit adds new field "shm_mem" to store shm-info per
> > > > > domain.
> > > > >
> > > > > For each shared memory region, a range is exposed under the
> > > > > /reserved-memory node as a child node. Each range sub-node is
> > > > > named xen-shmem@<address> and has the following properties:
> > > > > - compatible:
> > > > >          compatible =3D "xen,shared-memory-v1"
> > > > > - reg:
> > > > >          the base guest physical address and size of the shared
> > > > > memory region
> > > > > - xen,id:
> > > > >          a string that identifies the shared memory region.
> > > > >
> > > > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > > ---
> > > > > v5 change:
> > > > > - no change
> > > > > ---
> > > > > v4 change:
> > > > > - no change
> > > > > ---
> > > > > v3 change:
> > > > > - move field "shm_mem" to kernel_info
> > > > > ---
> > > > > v2 change:
> > > > > - using xzalloc
> > > > > - shm_id should be uint8_t
> > > > > - make reg a local variable
> > > > > - add #address-cells and #size-cells properties
> > > > > - fix alignment
> > > > > ---
> > > > >   xen/arch/arm/domain_build.c       | 143
> > > +++++++++++++++++++++++++++++-
> > > > >   xen/arch/arm/include/asm/kernel.h |   1 +
> > > > >   xen/arch/arm/include/asm/setup.h  |   1 +
> > > > >   3 files changed, 143 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/xen/arch/arm/domain_build.c
> > > > > b/xen/arch/arm/domain_build.c index 1584e6c2ce..4d62440a0e
> > > > > 100644
> > > > > --- a/xen/arch/arm/domain_build.c
> > > > > +++ b/xen/arch/arm/domain_build.c
> > > > > @@ -900,7 +900,22 @@ static int __init
> > > > > allocate_shared_memory(struct domain *d,
> > > > >       return ret;
> > > > >   }
> > > > >   -static int __init process_shm(struct domain *d,
> > > > > +static int __init append_shm_bank_to_domain(struct kernel_info
> *kinfo,
> > > > > +                                            paddr_t start, paddr=
_t size,
> > > > > +                                            u32 shm_id) {
> > > > > +    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )
> > > > > +        return -ENOMEM;
> > > > > +
> > > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start =3D start=
;
> > > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size =3D size;
> > > > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id =3D
> shm_id;
> > > > > +    kinfo->shm_mem.nr_banks++;
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static int __init process_shm(struct domain *d, struct
> > > > > +kernel_info *kinfo,
> > > > >                                 const struct dt_device_node *node=
)
> > > > >   {
> > > > >       struct dt_device_node *shm_node; @@ -971,6 +986,14 @@
> > > > > static int __init process_shm(struct domain *d,
> > > > >               if ( ret )
> > > > >                   return ret;
> > > > >           }
> > > > > +
> > > > > +        /*
> > > > > +         * Record static shared memory region info for later set=
ting
> > > > > +         * up shm-node in guest device tree.
> > > > > +         */
> > > > > +        ret =3D append_shm_bank_to_domain(kinfo, gbase, psize,
> shm_id);
> > > > > +        if ( ret )
> > > > > +            return ret;
> > > > >       }
> > > > >         return 0;
> > > > > @@ -1301,6 +1324,117 @@ static int __init
> make_memory_node(const
> > > > > struct domain *d,
> > > > >       return res;
> > > > >   }
> > > > >   +#ifdef CONFIG_STATIC_SHM
> > > > > +static int __init make_shm_memory_node(const struct domain *d,
> > > > > +                                       void *fdt,
> > > > > +                                       int addrcells, int sizece=
lls,
> > > > > +                                       struct meminfo *mem)
> > > >
> > > > NIT: AFAICT mem is not changed, so it should be const.
> > > >
> > > > > +{
> > > > > +    unsigned long i =3D 0;
> > > >
> > > > NIT: This should be "unsigned int" to match the type of nr_banks.
> > > >
> > > > > +    int res =3D 0;
> > > > > +
> > > > > +    if ( mem->nr_banks =3D=3D 0 )
> > > > > +        return -ENOENT;
> > > > > +
> > > > > +    /*
> > > > > +     * For each shared memory region, a range is exposed under
> > > > > +     * the /reserved-memory node as a child node. Each range
> > > > > + sub-node
> > > is
> > > > > +     * named xen-shmem@<address>.
> > > > > +     */
> > > > > +    dt_dprintk("Create xen-shmem node\n");
> > > > > +
> > > > > +    for ( ; i < mem->nr_banks; i++ )
> > > > > +    {
> > > > > +        uint64_t start =3D mem->bank[i].start;
> > > > > +        uint64_t size =3D mem->bank[i].size;
> > > > > +        uint8_t shm_id =3D mem->bank[i].shm_id;
> > > > > +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> > > > > +        char buf[27];
> > > > > +        const char compat[] =3D "xen,shared-memory-v1";
> > > > > +        __be32 reg[4];
> > > > > +        __be32 *cells;
> > > > > +        unsigned int len =3D (addrcells + sizecells) *
> > > > > + sizeof(__be32);
> > > > > +
> > > > > +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64,
> > > > > mem->bank[i].start);
> > > > > +        res =3D fdt_begin_node(fdt, buf);
> > > > > +        if ( res )
> > > > > +            return res;
> > > > > +
> > > > > +        res =3D fdt_property(fdt, "compatible", compat, sizeof(c=
ompat));
> > > > > +        if ( res )
> > > > > +            return res;
> > > > > +
> > > > > +        cells =3D reg;
> > > > > +        dt_child_set_range(&cells, addrcells, sizecells, start,
> > > > > + size);
> > > > > +
> > > > > +        res =3D fdt_property(fdt, "reg", reg, len);
> > > > > +        if ( res )
> > > > > +            return res;
> > > > > +
> > > > > +        dt_dprintk("Shared memory bank %lu: %#"PRIx64"-
> >%#"PRIx64"\n",
> > > > > +                   i, start, start + size);
> > > > > +
> > > > > +        res =3D fdt_property_cell(fdt, "xen,id", shm_id);
> > > >
> > > > Looking at the Linux binding, "xen,id" is meant to be a string.
> > > > But here you are writing it as an integer.
> > >
> > > Good catch!
> > >
> > >
> > > > Given that the Linux binding is already merged, I think the Xen
> > > > binding should be changed.
> > >
> > > We would be compliant with both bindings (xen and linux) just by
> > > writing shm_id as string here, but if it is not too difficult we
> > > might as well harmonize the two bindings and also define xen,shm-id a=
s a
> string.
> > >
> > > On the Xen side, I would suggest to put a clear size limit so that
> > > the string is easier to handle.
> >
> > I've already made the xen,shm-id parsed as a string too, seeing the bel=
ow
> code:
> > "
> >     prop_id =3D fdt_get_property(fdt, node, "xen,shm-id", NULL);
> >     if ( !prop_id )
> >         return -ENOENT;
> >     shm_id =3D simple_strtoul(prop_id->data, NULL, 10);
> >     if ( shm_id >=3D NR_MEM_BANKS )
> >     {
> >         printk("fdt: invalid `xen,shm-id` %lu for static shared memory =
node.\n",
> >                shm_id);
> >         return -EINVAL;
> >     }
> > "
> > The size limit is smaller than 256, just as stated in doc:
> > "
> > - xen,shm-id
> >
> >     A string that represents the unique identifier of the shared memory
> >     region. The maximum identifier shall be "xen,shm-id =3D 255".
> > "
> > Hope this fits what both of you suggested~~~
>=20
> Yes. I think supporting arbitrary strings like "my-shared-mem-1" would be
> nice-to-have but I wouldn't make it a hard requirement.
>=20

Oh, the example "my-shared-mem-1" really expands my mind, I think I underst=
and
what you and Julien referred as free form string, which shall not be limite=
d to only
numeric number... thanks!!!

You were suggesting a strict limit on the number of characters, TBH, I have=
 no clue
What the standard is here. Any suggestions?

If considering padding, maybe 19?
"
struct membank {
    paddr_t start;
    paddr_t size;
    bool xen_domain; /* whether the memory bank is bound to a Xen domain. *=
/
#ifdef CONFIG_STATIC_SHM
    char shm_id[19];
    unsigned int nr_shm_borrowers;
#endif
};
"

> "255" as a string would match Linux's requirements for xen,id.

I will use your example "my-shm-mem-1", I think its better for users
to understand, at least for me...

