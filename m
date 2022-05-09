Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870D51FD01
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 14:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324504.546580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2b2-0002Yt-9s; Mon, 09 May 2022 12:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324504.546580; Mon, 09 May 2022 12:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2b2-0002VM-6i; Mon, 09 May 2022 12:34:40 +0000
Received: by outflank-mailman (input) for mailman id 324504;
 Mon, 09 May 2022 12:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11oC=VR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1no2b0-0002Ja-Ng
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 12:34:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe02::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a2262e-cf94-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 14:34:38 +0200 (CEST)
Received: from AM0PR04CA0104.eurprd04.prod.outlook.com (2603:10a6:208:be::45)
 by DB7PR08MB3001.eurprd08.prod.outlook.com (2603:10a6:5:23::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 12:34:35 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:be:cafe::f5) by AM0PR04CA0104.outlook.office365.com
 (2603:10a6:208:be::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 12:34:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 12:34:34 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Mon, 09 May 2022 12:34:34 +0000
Received: from 5cc2941eca59.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4E30F407-528B-4A77-91C6-66432A985CBD.1; 
 Mon, 09 May 2022 12:34:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5cc2941eca59.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 May 2022 12:34:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3718.eurprd08.prod.outlook.com (2603:10a6:20b:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 12:34:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 12:34:25 +0000
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
X-Inumbo-ID: 63a2262e-cf94-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dDwKZ6UWDbmVV5IJv2anZ+KHkre23ViMUSN4ETgK38Sz10INpSEhD80/u26tsTX3tbwCXK88DM/zjeoxdiO0ronPvA+0O1AZCzXtf+c2CchNAsf4UTD4xG2OoXMtdEfsB3jnVhYswl3vzKQpFBYkvl+Jz8qWo1uLNI87liVm6TubXFQT5DvUCYtN2guixLpWNvkvmbMC2gzYyzcf3Ef0KZhuy9kzt/E2HSvz36dTm7Pr8kM65gj5bWpn2ifwknytLCltlk+JGbqciCQw6xd3Qqn7CslQenDXzKpKKy9anpOGy3gQ/+bOjQxI3jXRf/heN4ZNQnNPf4XuUL3D1oQgIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we7cYj+zv6onSLWc1euP+JGCeVSw8yIc2+ETd7AdoFk=;
 b=RmlkOe41i+i1qghWLExrk8gbf6m8QxiLLy0thKzeSqS263JNX5rZ+uakQJzispGvlAYLlH6efH9C8E8Mip6FlPhLQ89BmLRosFGPkkEmIyMEoTNzqRDM9GRvRU7UQo9AeeUwZEkkDXE9uC/OP8aoCIIZ2Y/lAD8UV/T+MwAToKO7Pf3Nt/iVxk9z4ayfaMQ1vzHR8QaQsapVy+JKMR8SfDB8ISQEV1116qR/3Z/wV31vSLllmTBdbqCfbRzaHOONKTZQN3uP8CLWeHXm9UFrCVJv6MECOrqq7zEF6dLmJJBYDNyDVLGkruBlLErrwU2Qtg2VBrfyWIpF1JxEfrgGmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we7cYj+zv6onSLWc1euP+JGCeVSw8yIc2+ETd7AdoFk=;
 b=2Iu+Bbxxa/lrSU1uEkx4EwCnSwKThFFAogWXt2xqv5AgQw4xkWWlQ3N6e2YbDYs5HDii5IBchTyFh6xmhHELV84ma4BLOQS5/WfmG3YjrUfXCMXaV4rwfOs6dbL4PQhFTmV9AP58yV7HJt034nNbgbSLAzHAH4vzsDT6yx07hM8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e06dda47a7405a9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cgs8++dEF7JJ8dfFcHcIUI7piw6CzjLXqYi0jbJxkWsWj8aGg97xZ7+Cpe1rUFC0MJ6KkXaQzoTPWQZwJkK/KQtysdsNThKlfYqwkOgwK8mpwDckrocGpSTbBPKzFfifaOjadwSGSwPrxDI9hz1/CFFvMw9lA5dsgIgR0YY/Kmmmu0qabDDzn43aS68AwnLtKAkPq6vKMPE1I6Dyrs30DpmyFIknLvt69+eM5JVkpFmjUGVNdAn7iMTxN32UVwLU4s57d6HHJ8U7Gv+bMiKT1g7EwBuoHPowHyUZ1OcjwFDMUmgxNZMWawADJw5/h3kV6u9XbUn8Y2kKFP4e9dJmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we7cYj+zv6onSLWc1euP+JGCeVSw8yIc2+ETd7AdoFk=;
 b=B65DuZgOY6UEm8TNoPS8C3MLv6CnYXUaPtBH2iN0vC2v9ZLBtXdtv6UjYtEJPieMu+fVlvIdsIaoGpYfamda7pQmqopx0rAfFzBMCd4iEyjspotHKF0BIsa0XDpWkFYoR6l1QgPcY4Pg52sPbjs4Salf9nPndLXS/OF+42X0LhPhgDtxnzULDN24Yq33OqFNIVEfQJemXTH+ZilR/wEMeddoJNBNdiIux2XLv5vj67OEX1UhWKCObP87xBc5aHf2xuDPp6rY7Vgg0xU44Iv5Rz/St3ZZ2xnoEwOYGfd6w67lJ0BYzpNG1cVexNL2iPQBULsMdXy1EivVLzwcnQG7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we7cYj+zv6onSLWc1euP+JGCeVSw8yIc2+ETd7AdoFk=;
 b=2Iu+Bbxxa/lrSU1uEkx4EwCnSwKThFFAogWXt2xqv5AgQw4xkWWlQ3N6e2YbDYs5HDii5IBchTyFh6xmhHELV84ma4BLOQS5/WfmG3YjrUfXCMXaV4rwfOs6dbL4PQhFTmV9AP58yV7HJt034nNbgbSLAzHAH4vzsDT6yx07hM8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] common/spinlock: Drop inline from _spin_lock_cb()
Thread-Topic: [PATCH 3/3] common/spinlock: Drop inline from _spin_lock_cb()
Thread-Index: AQHYY5/GrhlUL/nSv0SXN7TEruaNTq0WevsA
Date: Mon, 9 May 2022 12:34:25 +0000
Message-ID: <02D177BE-0299-4D32-9A21-2CDCE24006AB@arm.com>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-4-andrew.cooper3@citrix.com>
In-Reply-To: <20220509122409.14184-4-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: eea6169c-4de0-4557-6d45-08da31b84625
x-ms-traffictypediagnostic:
	AM6PR08MB3718:EE_|AM5EUR03FT030:EE_|DB7PR08MB3001:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB30018C87D499E9BF25A618559DC69@DB7PR08MB3001.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KVvYIqPdgkuVya4tnLxjEWcLSjjiP/PG5zTnaYQWPS7OWHuPBO7xt2b3iPHuYLtXuMjqwk2Up5+8d4BkkzySFL4okQ4rJsow9PoP9xQCSlg/TMgr+EOgghKaI8FQDHUnxBpp/pYiKkhjJk/iCLz7++M9yOuSwTBGE8mfYZDH9Kzu57hfOmJe4m7YN7tX7Opu8L8Snh7r/FUP4yhLBT24ep2vM+SwChNLcLH/q4FIl4vJo0ViCNg/v23J/e39/JQVNXYtBO8wsuq56JQm77fJXpsIorL1/ujrvrLeoUi9JO24I82cOw8E3QXh/Gq/IVhUXGTWpTz+Cx/Nsjcw5ZJRkFaBVNH3CaDWCMdhTiv542p4EdJQXym/MUnSn0qjE1yqlmS3FEU+BrH4KgpkotKxCKzJGi/JYXIc55AXGh/XQ1MyukzBFADtKmC3vD+bckN9Jqz2ei1FhH/eU+NGHQJ/I8JBZhSYrUkoSqe/yzcfUFt0W3xPxINeGPRmKjpSCAseIS/l6YNlVNhfQFKydYJwnkaYq6VQiIkuZIELJRtAnVJRtrBymW5nTDdqzXZPpBiotS/Cb9zO35FaA2mjHw6IJlp0ZR0Zz8CSmWQyPS4fZND5PBmjHxTJ4QeTEHIZZ0dA9FHBsmSAm2MXRo10yMkINuOu7ziR1Oj3iGc/RFh4thQId8Xud/enM0PHX7/ZqyQkyW9WPgPCuAoeZ3OPv+4/Fddq87fEe8m36f594bLm72VWDlURJCVlzTdZdk3HPiYA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(508600001)(5660300002)(38070700005)(33656002)(38100700002)(8936002)(76116006)(91956017)(66556008)(54906003)(66446008)(64756008)(66476007)(186003)(36756003)(66946007)(26005)(4744005)(6512007)(2616005)(86362001)(8676002)(4326008)(122000001)(2906002)(83380400001)(6486002)(6506007)(53546011)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <EAF3D7BA08BD67489D48C6E25FDE2D53@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3718
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5d3df5c-6119-4165-3009-08da31b840e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	efZqLVM35lZOmoKa65LcFwN/cExYV9NidOPwVIY5hhPnmBjw2SgBJjEWuxIuVGxBuVyje0mFyAkCz/oBPVnlf+3i2fNXyotA2kgydCIIb+7W8d4Hgv9bMyMvr9VbWxp8eprKZLdM4AMHVRlhd6oe8TonRvOD6wj/x2zATAYXDBksUJQDDlQK2wCUTUIcN91LgrMpYcEsnF0kQo4vKvZiXbA2lU75AjnI31W9sMEraUDIU+QZVuDhWASB2DnoaZxRo3YyKA4o7MwvYiodK6YwBOBDGaIv7IzjSVHiOxH0ji4khU3zURNIg4ppXrBT5tJo7GeAyHPnUbXG3KtIZMZBYUabKFoEJLNx9+TzM8vFnHzqdYk5JZsID67IMj0iPXXKK6NqyB5xeff9J2FyQrjOdpDRL5gAUaKwmh5RbUxcXJek2fNtvyXdTixT+iut4bIfJZBIufDXVqwP1IkgyAuJCqwl/xpNzDaa6QYtEMlhGxd+mOPavzKbHwrV2NBfX1XjBBG28FgSKm6nLIXmvriRGsZPI0Rm9AeFxjxcyflE5KKHvHzW5oCs/BIwzk2Rx5NyJd8LQbjiwDLBh3PrSCS/UFpkTWKd38uaTePY7RHoTf3VR5EvmWB9pYv2xXn4d9EiwWxzQeYJcMDnVGxzr0P5LVwgItJuq1tMsydtyqZSq69tny8bvobId5EpHUvOEhOH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(6512007)(53546011)(6506007)(54906003)(26005)(8936002)(36756003)(356005)(2906002)(186003)(47076005)(336012)(107886003)(82310400005)(4744005)(83380400001)(36860700001)(6486002)(33656002)(508600001)(4326008)(70206006)(70586007)(86362001)(316002)(2616005)(8676002)(81166007)(6862004)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 12:34:34.6322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eea6169c-4de0-4557-6d45-08da31b84625
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3001

Hi Andrew,

> On 9 May 2022, at 13:24, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> This is undefined behaviour, because there is no _spin_lock_cb() in a sep=
arate
> translation unit (C11 6.7.4.11).
>=20
> Moreover, MISRA prohibits this construct because, in the case where it is=
 well
> defined, the compiler is free to use either implementation and nothing
> prevents the two from being different.
>=20
> This function has external users, so drop the inline.
>=20
> Spotted by Eclair MISRA scanner.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


