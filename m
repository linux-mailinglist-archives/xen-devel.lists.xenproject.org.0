Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871D46698F8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477344.740018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKOX-0005cy-Pw; Fri, 13 Jan 2023 13:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477344.740018; Fri, 13 Jan 2023 13:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGKOX-0005Zs-N7; Fri, 13 Jan 2023 13:46:57 +0000
Received: by outflank-mailman (input) for mailman id 477344;
 Fri, 13 Jan 2023 13:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=irsc=5K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pGKOW-0005Zj-NW
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:46:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2078.outbound.protection.outlook.com [40.107.13.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd8a9d02-9348-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 14:46:54 +0100 (CET)
Received: from AM5P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::34)
 by AS8PR08MB7864.eurprd08.prod.outlook.com (2603:10a6:20b:52f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 13:46:45 +0000
Received: from AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::cf) by AM5P194CA0024.outlook.office365.com
 (2603:10a6:203:8f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Fri, 13 Jan 2023 13:46:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT010.mail.protection.outlook.com (100.127.141.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 13:46:45 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Fri, 13 Jan 2023 13:46:45 +0000
Received: from 11c847f2dc50.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8FAE6EBE-B0C7-44EB-89A7-FDCA57500A0F.1; 
 Fri, 13 Jan 2023 13:46:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11c847f2dc50.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 13:46:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB6529.eurprd08.prod.outlook.com (2603:10a6:20b:354::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 13:46:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 13:46:31 +0000
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
X-Inumbo-ID: bd8a9d02-9348-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAEK+RqGvxPVZAACK1CWck7z0+Hezw0Fa0EVFz32+os=;
 b=lb++dB6IqYIcRSDLPYg9mKOYc0kxY08iomH+MXnIhlY1GeFg5YHc3xdMaB/Ck4EJzCb3wI3PbeiAnJH9KPmiN7/5AKCRBwvuFvdOMYOf1X1ltyikj9vhI+PCoBl7dhrgG9iVtDxfLyXiOts8BfioanQkdCswFcRdxIO16dt9cwY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWNQwsRg/GOr5bGVWWnRpiinWAuRSulfnSR9HsX7M1EJdx7URHw9xpOBQxu1kkuWoEjIfVccv0Fmk1zE3C98OjVlfl2VOB30C1r0xaYOX7JfDhaRyclDQzwHChUqVqY2/KoAPm2wvehpE0cZoz/s1NgKEzCOGwL/3gWdzL6RKy5AqXXplxRCB7ftQmuVrVhnYnsFU60BzZLOKJWXNYJ0iclNXyrMDx5V/ImbtRLHu0k+H0GZ8zuDT6YqXrz2hAW4rEM9yX0G63436/dNsa7/ktAVYfIicXs7auYk09a/+WX03pQSQyX27n4SNYOESfca6k9OoEeb+n9EyJpRL/zToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAEK+RqGvxPVZAACK1CWck7z0+Hezw0Fa0EVFz32+os=;
 b=jQ+iNa4jmfmGlKhVMdNFDLlVs3jQGq76B6x9ckclbHJ1yJGzGY4EG2et/uI0YdS4GMBXYoslsREzVBEk1eNPAC3uHUAxLPZHl4lE5EWRLAowoeZWeChiq6NsFOJeSFV9SnVbk+RK6343m0XCaigB8ibscUHKsxNbPvyTqtKYCqkxTf8dw6MfI7r3ccVFnzwrOZQSh0Q4r8fHRxVN0C7NcRkSL6RlZgnCJjSMcw+pIiXG9UP1AZxYxs9tU5UykKbMx24fAGaAHBK32vkDh5EPZyQiiePVRz8+gsc+JSmt+9/Km3qmKJURApCAv+Ajc4+DWCF9cxXwPICs2lHQAFME7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAEK+RqGvxPVZAACK1CWck7z0+Hezw0Fa0EVFz32+os=;
 b=lb++dB6IqYIcRSDLPYg9mKOYc0kxY08iomH+MXnIhlY1GeFg5YHc3xdMaB/Ck4EJzCb3wI3PbeiAnJH9KPmiN7/5AKCRBwvuFvdOMYOf1X1ltyikj9vhI+PCoBl7dhrgG9iVtDxfLyXiOts8BfioanQkdCswFcRdxIO16dt9cwY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: RE: [PATCH v4 03/14] xen/arm32: flushtlb: Reduce scope of barrier for
 local TLB flush
Thread-Topic: [PATCH v4 03/14] xen/arm32: flushtlb: Reduce scope of barrier
 for local TLB flush
Thread-Index: AQHZJzd7+kqmWE84JkGI+nHeBx9+r66cUqgQ
Date: Fri, 13 Jan 2023 13:46:31 +0000
Message-ID:
 <AS8PR08MB7991982E6F5F7AA43820997492C29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-4-julien@xen.org>
In-Reply-To: <20230113101136.479-4-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C468B3F3EA06A44FB4C928D8C493E1D8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB6529:EE_|AM7EUR03FT010:EE_|AS8PR08MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b25347-dd02-4815-2ab5-08daf56c9c63
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TA5FRyu8TSfsa5didhA3+9j0E9kkVAlt0fkTJIApyKb9PBBJ2wK7v3TzwP5xwjw+d3ToLnzLyfRsPYdvW+4SKOF9biH+EOMPPECPAoiw/pWzEFZCe7g5x7FRntVYJPdCkG0rf6ziU4lpsMrNzimZ+5LiwU+OhKvooYS+Rl5BjwpbC9LmJdKAllKcNp4yiNQVvX6NQHqsELvFQU/t/bijqY9VrAw94X1EqMwbXR0xEjY4wZlOGpAxc2Q271hkp2RHqznq17oMsVayvloWlKqUx065bZ2jseWdoqs4twabspzbYtQ4HAhZcxA/+5x9mhWzu92tOIzwZ+GVd7tKn7uHVKhF2XtVGktpXcrB3AlR9vWop/fyLiXLNl0UfioXTip6d2vAV4gV/MrR0DWBwaht0XScITDZBSA8xyhK9PvMOduyxOVpOjSEq8Ig0m0sv+pIa/oydag/I49kbHQNEwUHp9teJ6CyNEgrEjlWvziOBkOcCYIzo0+x3vCWGoRsNPscX9dt4/r3bGQE6cCoouvU0on/ko3ZevFDPWFUGlkhQXmp61OVGoyST6ECsMVkZmE3zONkNLAS04gnrMHjRkfV9LKdT9lsz7SG7lyL56NXQqVyvZaF6qLvW6pIyszoNJAMMKppKzHDQKhcOyKnqUdWKUugTSze6JvPxndgd8l316wM+s0qMNxCZqRPFb+ulkHlJNLTEJLyUGGPL3bs4a209g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199015)(38070700005)(86362001)(2906002)(5660300002)(122000001)(38100700002)(33656002)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(9686003)(66946007)(6506007)(186003)(76116006)(26005)(55016003)(71200400001)(7696005)(316002)(54906003)(110136005)(478600001)(8936002)(52536014)(41300700001)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6529
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	896964f0-74bd-47bc-7023-08daf56c942d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	db/lHVoEpw/tcbkNXW6IXsAuiMxYaILbqNFHVVvGOoktGcXafw0cJW+4Xq1PxP9h6sMpdWuo5/eWL1yHFEBE3NUDm/zWCMNE4q83Hu72kltLVmOYULQyLvpqojf2tNSiJOYygS88APw5jV/JTkNT7vvBRRQsgU2LF+NUkbC9M0WLojdCUldUZ4YdYpJ5HCsiRz9fHua6+R2oh2KzPUXRyS3rmYfyqCMdDtz3i04rbzYz9iBIXpEnc1T9mE9icE49z2kNJOWq4nKSC/J4jGI1YGlhf5GeNju9Bvd1TF4kI3cRXU97b2RCJTNn8Oh0sTW2OyhT9fMhwCl/3mIk8iO1f9uHdW/ia2c3YMdu5W0SDlUCfWtnAbfaI8AEu5aE5gvAoJXgrx+k9M71OfWlGcPqvf6oEx7jZiXIlTM+QiCxJEv7c2/KGAeQAm4LCYcvGno5Zl42Kyu5lWNe1ak0cUBmd6DG35+Q9Tc6/sb+G75QT1RgJe5FT9BPHpScaqv048H8dgAMUKdizbOLBpneI69ZT0D0uQHJ7NOPrO2hf2Fkczg3agmvzFZaMx7zcBC8DJFLqOdVmJq/n3vPuCfd5WnfacVHFmAlT++zYnxt/Db+I8YCUv5NKxmaJz/Z4/VMMwnWbFLV69kLZbQxcUJ0vKGlLjtHx1HxMpSQjL+KxikTz13dcD53Ogk4VdhlxoIzXByFTZEuFR2xJbdFEpM2ngERgQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(8936002)(70206006)(70586007)(41300700001)(8676002)(4326008)(52536014)(54906003)(6506007)(2906002)(316002)(82310400005)(336012)(40460700003)(36860700001)(5660300002)(33656002)(7696005)(55016003)(82740400003)(86362001)(478600001)(186003)(26005)(83380400001)(9686003)(81166007)(110136005)(356005)(47076005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 13:46:45.4739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b25347-dd02-4815-2ab5-08daf56c9c63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7864

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v4 03/14] xen/arm32: flushtlb: Reduce scope of barrier fo=
r
> local TLB flush
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per G5-9224 in ARM DDI 0487I.a:
>=20
> "A DSB NSH is sufficient to ensure completion of TLB maintenance
>  instructions that apply to a single PE. A DSB ISH is sufficient to
>  ensure completion of TLB maintenance instructions that apply to PEs
>  in the same Inner Shareable domain.
> "
>=20
> This is quoting the Armv8 specification because I couldn't find an
> explicit statement in the Armv7 specification. Instead, I could find
> bits in various places that confirm the same implementation.
>=20
> Furthermore, Linux has been using 'nsh' since 2013 (62cbbc42e001
> "ARM: tlb: reduce scope of barrier domains for TLB invalidation").
>=20
> This means barrier after local TLB flushes could be reduced to
> non-shareable.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I've tested this patch on FVP in arm32 execution mode using the same
testing approach for patch#1, and this patch is good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

