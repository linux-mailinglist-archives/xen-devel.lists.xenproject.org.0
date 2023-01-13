Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6566986B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477324.739985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGK0x-000214-6b; Fri, 13 Jan 2023 13:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477324.739985; Fri, 13 Jan 2023 13:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGK0x-0001yZ-3f; Fri, 13 Jan 2023 13:22:35 +0000
Received: by outflank-mailman (input) for mailman id 477324;
 Fri, 13 Jan 2023 13:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=irsc=5K=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pGK0v-0001yT-Qn
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:22:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55bf7214-9345-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 14:22:32 +0100 (CET)
Received: from DU2PR04CA0183.eurprd04.prod.outlook.com (2603:10a6:10:28d::8)
 by AS2PR08MB9785.eurprd08.prod.outlook.com (2603:10a6:20b:606::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 13:22:30 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::53) by DU2PR04CA0183.outlook.office365.com
 (2603:10a6:10:28d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Fri, 13 Jan 2023 13:22:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 13:22:29 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Fri, 13 Jan 2023 13:22:29 +0000
Received: from 25f775ffcf63.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB7B6E75-2B01-4AC5-9ACB-84FE2FEA166A.1; 
 Fri, 13 Jan 2023 13:22:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 25f775ffcf63.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 13:22:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7938.eurprd08.prod.outlook.com (2603:10a6:150:8d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 13:22:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 13:22:16 +0000
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
X-Inumbo-ID: 55bf7214-9345-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujhcm3PSPgw4bvKyeCbe7lP+sd7EjCAeMcV73gd2RxQ=;
 b=OAkpaPAqe9C2muUIw4bn/gpjSUoOj9fqpeekAptVpAlYsAGCeYOrAG42smCP74+jyXyvrLlv1nTRHY/5W3x52bdB/L2RFTmEHhjX67yFKoXRZKevbaZ9rlDPgZN3bOvqIWvCduhO1g8NqIB1OVVn1fWKzLw6zBL5M7hzznAhngE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfSwjdbhX1FGjdaz/3KXOzoyJc4ho119BvbgiWJ4VTFDVTw6cm30r/g8hEfjds6swWuRiTuGtnm2bB4MDE/YiuRtzKCkSpzW9eJtLF5OKxbzXvqvJjDBu2QOuYDt4K6lwCT95SnGouslDzOXC051Zx5lTs5MQYaPD2PVEADn3qN0Xs5ojbs0q7gule3dDMJPm2V5OG5/WICjntUmU9F+KIMJU8AUBchTa5E/mWP7L7vYLBdwnATPnKhelUm0IeSEwTUXBPnmMPJR4u0IhLjAo0ld8xm5E2wsRqxzFb0+ORkmdnOGZTMsjSA0Non9o9NmmLDrY3pNhIigaaiLxK99PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujhcm3PSPgw4bvKyeCbe7lP+sd7EjCAeMcV73gd2RxQ=;
 b=SnkbN1hNgDJWuXeVDH831fGbzl5ek9NzQZ5/qufITTCHJRPyrFUzii2nuOs8k5fa2/EkxXv9QxMtTyfuuUfB+VklkDAe2RttEoui8dOrDACHTeewOPBiMHYlGoQ0gRtcKtSQP9I0ntykQ5phJd+94ijS8ZEs8X8wbooZ8Nzg4zPHp9iu9oELr8nxm6RXalOFCrNX3x8rli8F2r7Mm06uRa6Y9I9+W++oAIO4+FnmHtXrV0Y9JOpxqyztDTdfc6Oa1iDkhVJSlpgYA4ibNRGW2HmHPf4J5bSTLwL9usgEPq0bBi9ICLsfUAI4CBVfyA1kA7VT4WGmkBnQxRUp6Sn/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujhcm3PSPgw4bvKyeCbe7lP+sd7EjCAeMcV73gd2RxQ=;
 b=OAkpaPAqe9C2muUIw4bn/gpjSUoOj9fqpeekAptVpAlYsAGCeYOrAG42smCP74+jyXyvrLlv1nTRHY/5W3x52bdB/L2RFTmEHhjX67yFKoXRZKevbaZ9rlDPgZN3bOvqIWvCduhO1g8NqIB1OVVn1fWKzLw6zBL5M7hzznAhngE=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: RE: [PATCH v4 02/14] xen/arm64: flushtlb: Implement the TLBI repeat
 workaround for TLB flush by VA
Thread-Topic: [PATCH v4 02/14] xen/arm64: flushtlb: Implement the TLBI repeat
 workaround for TLB flush by VA
Thread-Index: AQHZJzd61qXKtXVMLEiNLp0lWxtmx66cPDEA
Date: Fri, 13 Jan 2023 13:22:16 +0000
Message-ID:
 <AS8PR08MB79914FDE4B386F24E1CBA40F92C29@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-3-julien@xen.org>
In-Reply-To: <20230113101136.479-3-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8F0A0EC6757B484497BFC0E9F2601A84.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7938:EE_|DBAEUR03FT051:EE_|AS2PR08MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c282c4-6004-496c-dd18-08daf56938b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K9rsg6DQs6OWoAP8usFBVmoBKlt71otmS+eAMdWvIsuwtFKeMTOlBlJhvfxaXVhrOKUn0HxN3HSIofNZ/TtGEWcqdkXkxgQS2jeri/umBSjJENQ0XcTHSxzGnZz+I+F+qNzUV61E+Nbo08VTi5cp+YQ+cznNY42eLmzhhdS7B7ndaPE9UHclWmWw9KQF3swg8N1jBnBaZHq+BRoJSeXrEU4pqVGRcAK6/RxlJBurwSkXs76OrhMJo5teu7EykOhVmAy2etyd3lGl1ztlOKFmaWw2QKCaAqYeMMlyJkpG6N8oVzWJm30vFwUm1hAH1PtWKeAps9kgkBXewLjpjymhEBMG6M/4ewmJQGYX7MvGg+ddYKnhsVOZ07cYlLTiJ9tXJhPHoGOVe2M2e8xaIbwrTxUrAyfpKqWYavxT8qssICMlDLxUpD900PHs1NX1dwLXBBGJuK2AfatqdAB+qnncK4kN2LVb22F19Qly9kSsJMhOXsmNcYnKDb0NUZwJSrcsGn48O5J9n5vT+TD/3COJaFfwJizbTRP8ashXigRViEzDBGaDGANyHuZs13mQMwUh/kjK/lxhmr7EVOjrlDR82HJqdbhJi/7BIVqODtNBAa+BOS4L8R2AC4uxdxZxJBZ38p0/MCsqfiZc8MCF7f7O71Uk4o9c21Mx5Kssx8Pn9T1+uhwYrXAyzkl4/DlSAxK61gl1Nzt4UyghmbA3hUzuMg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199015)(86362001)(2906002)(4326008)(5660300002)(66446008)(41300700001)(8936002)(66556008)(66476007)(33656002)(52536014)(8676002)(64756008)(66946007)(76116006)(38100700002)(83380400001)(316002)(55016003)(54906003)(110136005)(26005)(9686003)(6506007)(186003)(71200400001)(478600001)(122000001)(7696005)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7938
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	24075649-f11a-41e6-adb2-08daf5693098
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	78y2ERMqdB6sDNR0U4509xItZx9p3HvrkSALFAWcXdy6izxretdaXsXvoO8Ph4/IwkdEec8DZhbmnHFeNc6uPMXoIW39GZqBQi45utDeupjt6g27R3TrkecOL1EBjg2gXg18jqiv4utE1d+0eT21cldQ+RpdVoJi+UYhz4az0AfB1hTT/JcdYL8+/1fb2jQS8hqWlVYKtBg+J4SOShICpMTqsj83bKs+4wBW7G2trZfm0DWn1CWJn2bRcv3Pp0sFVCxbxXlBKu9IOB7s8KX4yHgl1qslRdPU5JMhPazpBxY/rqrS6fKY8mepxuQiZSZEno4RjLudi+vP0VtX0NpMG8ri0ujm5M5Ps/hXhERxxKccaeSlZXNeRBcCTnzHZJKB1vmWnql7FJoWbqvsSNpqOPyyl1jleiNWDlGi72cdn0lSYSXKxpZrOf0fgZDib+lCFchko46sf3393vEX2cOeqmI5Hz8864P9muR4tEfNwMUJLY9vYutLBuK3V6SwHA1rE4QM71ZMjYkP6nZCEWpEH70bBcnzhVEy6mZhuZRZcQIL6OEnE1kTJei7eCOWLhGe49eYOJIYZPR+lnnI9GFRpxCnqqrXlFdrkOblQrkrTEuAlLkhWVKNKYs7HDJvAjC9wvkZA/7b+Ery/Z2gsU89KE00bsfS/Hq/lXwq9f08L5a1GR2npfepzFkKYBJ8LGeJUdb/TK4fNpOtE5esJBNyQw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(81166007)(55016003)(82740400003)(316002)(40480700001)(54906003)(110136005)(356005)(336012)(36860700001)(186003)(47076005)(26005)(9686003)(33656002)(40460700003)(83380400001)(6506007)(7696005)(86362001)(478600001)(82310400005)(8936002)(52536014)(41300700001)(2906002)(70586007)(5660300002)(4326008)(8676002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 13:22:29.8200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c282c4-6004-496c-dd18-08daf56938b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9785

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v4 02/14] xen/arm64: flushtlb: Implement the TLBI repeat
> workaround for TLB flush by VA
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Looking at the Neoverse N1 errata document, it is not clear to me
> why the TLBI repeat workaround is not applied for TLB flush by VA.
>=20
> The TBL flush by VA helpers are used in flush_xen_tlb_range_va_local()
> and flush_xen_tlb_range_va(). So if the range size if a fixed size smalle=
r
> than a PAGE_SIZE, it would be possible that the compiler remove the loop
> and therefore replicate the sequence described in the erratum 1286807.
>=20
> So the TLBI repeat workaround should also be applied for the TLB flush
> by VA helpers.
>=20
> Fixes: 22e323d115d8 ("xen/arm: Add workaround for Cortex-A76/Neoverse-
> N1 erratum #1286807")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
> ----
>     This was spotted while looking at reducing the scope of the memory
>     barriers. I don't have any HW affected.

Seeing this scissors line comment, I tried to test this patch using basical=
ly
the same approach that I did for patch#1 on every board that I can find,
including some Neoverse N1 boards, and this patch looks good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


