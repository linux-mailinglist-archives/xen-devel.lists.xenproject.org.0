Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3205697A5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 03:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362696.592871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9GZs-0008En-78; Thu, 07 Jul 2022 01:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362696.592871; Thu, 07 Jul 2022 01:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9GZs-00088l-0A; Thu, 07 Jul 2022 01:45:12 +0000
Received: by outflank-mailman (input) for mailman id 362696;
 Thu, 07 Jul 2022 01:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4MP=XM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o9GZq-00085j-VM
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 01:45:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ea49b62-fd96-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 03:45:09 +0200 (CEST)
Received: from DB6PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:6:2d::31) by
 AM0PR08MB5491.eurprd08.prod.outlook.com (2603:10a6:208:189::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.20; Thu, 7 Jul 2022 01:45:06 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::df) by DB6PR07CA0021.outlook.office365.com
 (2603:10a6:6:2d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 01:45:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 01:45:05 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Thu, 07 Jul 2022 01:45:05 +0000
Received: from ed51147882b1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD3F4EC1-F2CA-471F-AFD8-8427370D9656.1; 
 Thu, 07 Jul 2022 01:45:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed51147882b1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Jul 2022 01:45:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB3059.eurprd08.prod.outlook.com (2603:10a6:208:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 01:44:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Thu, 7 Jul 2022
 01:44:58 +0000
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
X-Inumbo-ID: 6ea49b62-fd96-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eOauibWfV4Os3tBCZXboWiUw4fvD41T7A4uK3OFHbE2laYMD1HY6U7jL2GzqaY2eZxlBTF8SXXvbpJ2IThzhJtRsXJZY8perXyJnGKTnMoPOwWx5Sxuti/yQ319Cbe/eTTqJfStUqDx2aBRgxiUtn3HLGR7x0SzZy3JgTyjdIE0Oe8mZE2CYD2L0qrTlzbUv2EOsspY50adqztZGDNx/tjgU56WWg29+q6HWWgyn5p2hhc7wcGUKd0T/NjWPDApSQT6b+KvlERoaT9VapZZZb7conEturku5QkbP7ChxicXt1LTTOgWNSpNl7tpS8MY1layppMJfLwvGWPyEzk4Smw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHSUDKdQ+BNUmxf4Xd0+SExpB+G5oGAX26VlJjENGtM=;
 b=buzD7kNDmZ0CLvik51algAcUxpH6sTIMWBPPetV2kcTJWsrvKyk2+QM7oBc6qGrtfgWzTOttKAMODCjoDAXrjRoPUATZDnR9QX0BdetBbSH8clEUAe7cIrBQNDfYDCnroixDij2Iw6XfJudjy017Xy91DmEH17UL74zlhRbRsazuPPPR+fMV8N/lPIVFz8ogI+SQ4SL76niL21fKl3YCcZuAIfV+2G6Atv0T4umN8+ktahFTHUeHlA48/i8CVifmxi8gd0c9PTbRhCyAB8UzadRYwviYCY79d+Z879FI0VFqEz8kV0UNTyczCXZA55ymFjRSTVdd79qEWhCHCSF+Rw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHSUDKdQ+BNUmxf4Xd0+SExpB+G5oGAX26VlJjENGtM=;
 b=7nLVpel9JB+MVrJf7rYWJZiDZM1TmrxHNKwYicI0iFitExU1bR0IrLkOawwTucTtKtQ/eWQ/pFEmxNyJcDcKNKke2SjgM4p4K4U+n658FOxzJaVPVchfAp/YBeR2cbWoB4H7ujyCYkMzUcmg2lBMlW3mvP3d8zGcCh3w0v+UB1c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNEwKDYGTiL6iG+04GTUZMvp7gfzX9DlBUy8o6IJGBEjA3CQgpjQ11vcQMwvi7Ml6+TbxunnAcin3EeVIvaL5U46k8Yq5PTYqP6W1oAPGBAdpmg2HPH9+isIOaaCkUuU2YoDgBXL62zogjDTUrzv4uiTOr1l1FHLkw7v+KJDE/dlcvztheM8UAZPaeAc8/dQ9jFZa3crqieqE4J0u0AK+Yrjrk1DUiKb+4WiphhdvwlPfcuu5pdaZWMgmFXRsY5gcHeLd53dEvgGeSBFG2SPGV51Yv0nLLa8PfUKAPHXO9zw9/htq2jX/Ram2RdZxSE+FaLRdkHb9en06xQopwC/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHSUDKdQ+BNUmxf4Xd0+SExpB+G5oGAX26VlJjENGtM=;
 b=dsuI55s2kA3luxxYu2/1zNM7QKZj0jQ47Rm+nuZmj28/u59a0jQXzftza02Xzynof5IaKup4iBs0D+c/KQcGKcwmVZXxAz5zPNXYJg5G15jxsGbtX9W1YA8Zn4m5BD2lOK0YJG7zZhRIIn3PIbXWEAVHfNLVJgLafn2jEgm46beatLk+5vwbD/jSWML0Fm7/5Dn382EusVf9L7PSsUJDmmcV4BrDXspwy8EPayKBPVfY+i9vu6jAsgVoR2iQplsRtC1LCJXKI4hkS1te7fin3mVCCizssjFURSzl4Rpw4LHHyub0br/tCz1Zvuo1GbxmEYZl7ZT0mtCbYzGjPQQGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHSUDKdQ+BNUmxf4Xd0+SExpB+G5oGAX26VlJjENGtM=;
 b=7nLVpel9JB+MVrJf7rYWJZiDZM1TmrxHNKwYicI0iFitExU1bR0IrLkOawwTucTtKtQ/eWQ/pFEmxNyJcDcKNKke2SjgM4p4K4U+n658FOxzJaVPVchfAp/YBeR2cbWoB4H7ujyCYkMzUcmg2lBMlW3mvP3d8zGcCh3w0v+UB1c=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v1 08/18] kconfig: introduce domain builder config option
Thread-Topic: [PATCH v1 08/18] kconfig: introduce domain builder config option
Thread-Index: AQHYkXyVpDe0H51uh0O21IzCAZjY4K1yIunA
Date: Thu, 7 Jul 2022 01:44:57 +0000
Message-ID:
 <AS8PR08MB7991DC947DAF6EAF4F7B817392839@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-9-dpsmith@apertussolutions.com>
In-Reply-To: <20220706210454.30096-9-dpsmith@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B74A75CBFA44B846A11B926FD888EFFC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b8f9c927-be2b-4cbd-f053-08da5fba514e
x-ms-traffictypediagnostic:
	AM0PR08MB3059:EE_|DBAEUR03FT058:EE_|AM0PR08MB5491:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 boq7Yc+mJuXk6ftHhuYrurb6BoBusiYM2uC78nv26FHxm8DZN2gkOyaBzwAQ84wzYGtm1bzmhoa1kmMc1KD/7ZYnvO5D/aMuCJFVQtqIyoJoeLJfhT3Lj3iNbOaoDq6GhmSbbzDOrnk6woW17Ib7RXXJLEuIwMBGFm+bBqvlckwyFNsHOJ3CZinXb8mZdKprEOfgwBoI0/LelZzozD7vkOr6qqAKQBFPTr7bA71q++0jlAnVtlALGIOmfPAcZyFUwL/GX+ulqrTukpk6qkv0gFiEKrSbD6WD4TdAWhRkknW7mfwUBbjXfg28yJRqRVtY2ACzIne2d1rAov+nAS95mRz6luPQSHMXtnKz0Z0dNPpZO5fM9ghsmMGRMl6Hgzo3PyjmKq0tPfsUPjndA4YEB5BI13kVvxY+wP+lD4JaD45Jnp1qUc6Pb5kFmB8i0rNK6l53sD7tlnZarDytEop2udOOwH9iHs7boRHWbMNBazECP8+Ppgab+or8w1j9NwQ/0qL5n3JADiNWcODkMUWdrb+UXa7tDj+jkt/ZV/PYXw/QEzalompIzQsE7fieVCQRp37y0rwdmPTdVy5OTMNUUQWQitdflyyxSJhJPFX+JfD9hOO30tlKFSKeKkv5AbUZqLpgwa1SS0adL9GQRQXNZOfMS5gz/8qKb1a86M6sRUNSNMUCys1xxqi3CQ32+iRDFYa7lnhruxRoh/GyBUHR/NirUFW4Dx+uEkZ/e9SucjDRG6jSV6ynamIxzifP/uwF6Sh0zvyCHX9ttQa/2mZ+mIaovNlxCIrcDO/p7pdSKktz3Bd0okLpmqsvPGdrhz0S
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(7696005)(6506007)(9686003)(26005)(38070700005)(71200400001)(186003)(83380400001)(55016003)(33656002)(2906002)(122000001)(38100700002)(66556008)(478600001)(5660300002)(316002)(86362001)(41300700001)(52536014)(8936002)(7416002)(4744005)(66446008)(54906003)(4326008)(66476007)(110136005)(64756008)(66946007)(76116006)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3059
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	386a646a-09dd-422b-4a41-08da5fba4c97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2CgeByeT2xqAOEFHi0MiyzKb2A0b52OcLvAnT1jRN47xy4iuOdjggwdJLBGeMu4+k/uO7l2lKGzkDMWoKOl1gLDi6CNhhu7k7GH113PmaJQcIeNZPr6oqttWlcaXrmzHlBookyYYiJVB8hFlge74kR5QPgJml7x/CBIjPzAZ0oh1/kX7lEI2xIGwvjmRMVp+OfEEjNfQPp6Q7eL2n6zaYIY+wNkfS+1kdC0B9nkuL+D4yEeeDXlMGNaj1d2eSh7Ajt7a0RoPpw7SaC6kR8kIqKD5k6UoL81px8E2cgOfkP1gEa9Jl6CkwXwMW+B4FHFy7Tjy+hQPq+BeW8OLChYhvwyZmsU4nqlsP8LDRiXRKQCTuZ/akdVCbwC9oqdLzuHov6hwa68x4jl096Jl54qmLHLQNm1UWweGYRheIoHJaIoYwZl/t/5MlE3UO9zvOuAbYnSOJAfmmka9VqOMSosuJRKCI/0EFE4/9L0U+fQVCcmC28Lox/l3cJSj4GF0sAubnrafLbbdwZGAyMq43WK8YJ7/HucAqeBCSduS2pBjlBqnDuhze+kNribd7myjEoFycRTMnv2gmdFOpXWKQVg6yk/Cy614EM0bnH1n4rsWaJIMpGFKB0tsr0Yv9Y0iSIqzCkjHo+dYPA1FZWE+GslIsgk4CzBi9q9GRmuwfix0MM4PZyMWjeh+1nQHJVu2HPk0VxyTUTNVD6ZJOVWhgCzlSD9/bxWM3emHJTZhhwbYp42DN0KG68cLph0KNBYnGKPbRCWLDcZ9mF1y8NWv8HYfqdzwFjU3nqB3yAFzbPLQNauMA0ykCTyL3HUXvnPUMEwm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(36840700001)(40470700004)(46966006)(33656002)(356005)(82310400005)(40460700003)(55016003)(110136005)(478600001)(8676002)(70206006)(82740400003)(54906003)(40480700001)(316002)(4326008)(86362001)(9686003)(26005)(83380400001)(336012)(70586007)(7696005)(47076005)(41300700001)(186003)(52536014)(6506007)(4744005)(2906002)(81166007)(5660300002)(8936002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 01:45:05.8873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f9c927-be2b-4cbd-f053-08da5fba514e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5491

Hi Daniel,

> -----Original Message-----
> Subject: [PATCH v1 08/18] kconfig: introduce domain builder config option
>=20
> Hyperlaunch domain builder is the consolidated boot time domain building
> logic
> framework.  This commit introduces the first config option for the domain
> builder to control support for loading the domain configurations via the
> flattened device tree.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
>  xen/common/Kconfig                |  1 +
>  xen/common/domain-builder/Kconfig | 15 +++++++++++++++


