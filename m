Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745E6E3EB7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 07:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521719.810528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poGxb-0006PF-6Z; Mon, 17 Apr 2023 04:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521719.810528; Mon, 17 Apr 2023 04:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poGxb-0006N5-2u; Mon, 17 Apr 2023 04:59:27 +0000
Received: by outflank-mailman (input) for mailman id 521719;
 Mon, 17 Apr 2023 04:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c4/u=AI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1poGxZ-0006Mz-Hl
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 04:59:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d1e6db4-dcdc-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 06:59:21 +0200 (CEST)
Received: from DUZP191CA0036.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::28)
 by AS8PR08MB9765.eurprd08.prod.outlook.com (2603:10a6:20b:616::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 04:59:18 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f8:cafe::32) by DUZP191CA0036.outlook.office365.com
 (2603:10a6:10:4f8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 04:59:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.19 via Frontend Transport; Mon, 17 Apr 2023 04:59:18 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Mon, 17 Apr 2023 04:59:18 +0000
Received: from b1c5637fe53e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2C2F4C3-F214-403F-AB01-4AAAF5BA9C0D.1; 
 Mon, 17 Apr 2023 04:59:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b1c5637fe53e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Apr 2023 04:59:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9472.eurprd08.prod.outlook.com (2603:10a6:102:2e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 04:59:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 04:59:05 +0000
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
X-Inumbo-ID: 9d1e6db4-dcdc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvyM8Kg5KuVKat3xlQd2xvzzWkgmOdbcC+vMlFnhZE0=;
 b=5V1RGV8mkjvvcpVOnVCkt4GcapyyILoPRBlBgx2kZgUTzpw5eGgrH2IBfBJJqiDjrusOFKNShiMZ+OPWDf+rOy97E3Zk5Q+OZRI4Ezu9A5+idNNI/ksiyphY2AnJrbykWmz3pDtKzdBPRTvh6cJfn2NAukjY7zAe+Oz9ggdVsQc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/I75oCxtchvJrylNTQXoPIw8fPRqFKGnZU19Mf5FfKk2POf/LT+4iTO+SVYug5rB4rKCQptptMtpZ+zAVrBZ8acs9vbnPxyU8GIZBdFtPLe2Q7ap9oAgObfiB9AbWfZpXqAfkbumf6VUm/c2OOHaNJEhqhaTchhaCRnoqBYJWVKAIBz3+ieXy07Dtd0cx34lZvhEkLCLvWrcCGGNzBhGUaFnVatSiF7hqEFQ/7zr9A9pJNHyBI7iYBg4TNhc6d8YEFmyq5itWCI1lSFzWxjSGUcdWKho9hHga4vlj3RgXdPgz9ogG3FIP4wrdxQj5AkdS2EiyhTl8nZDlFkxBBBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvyM8Kg5KuVKat3xlQd2xvzzWkgmOdbcC+vMlFnhZE0=;
 b=hN1qQWwpKffbOqWPPFCsE/kE3eduHoZQArVlRG8Qq6uMftAW1++PKzNa4tDvA07Rl42WJJsIJzy3USrubFtxwvHtgXpcS1/In3Xxa9TbFvkQuZm49a6+B+LjSEcWNAVwO4oKxzpawTXENoMR/uTjXm/LHaqC//Bv9H38SMpwj7tfyTRGROHL8euSNQcZkPKlZWNY7OiROuwUb5vC5PhdNFB5PaMVGFmkwXTg6lFElVYxPRkoKweVf4U8XugOSqxqxB4wkcqjmtTmciEla1q2at9jz6VbgzuqWjmOubeI0zwB2Gq4MsA8LRY9DZKONZtHuJjfdPGBPOAEKj7GV23YaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvyM8Kg5KuVKat3xlQd2xvzzWkgmOdbcC+vMlFnhZE0=;
 b=5V1RGV8mkjvvcpVOnVCkt4GcapyyILoPRBlBgx2kZgUTzpw5eGgrH2IBfBJJqiDjrusOFKNShiMZ+OPWDf+rOy97E3Zk5Q+OZRI4Ezu9A5+idNNI/ksiyphY2AnJrbykWmz3pDtKzdBPRTvh6cJfn2NAukjY7zAe+Oz9ggdVsQc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v7 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Topic: [PATCH v7 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Index: AQHZcHBWic1Wc8S7jkeT5KQNtFjvNK8uzxTw
Date: Mon, 17 Apr 2023 04:59:05 +0000
Message-ID:
 <AS8PR08MB799136F71E1FF28CED194666929C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-4-julien@xen.org>
In-Reply-To: <20230416143211.72227-4-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 803C644098294941A43ADD0D9D79C68A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9472:EE_|DBAEUR03FT049:EE_|AS8PR08MB9765:EE_
X-MS-Office365-Filtering-Correlation-Id: 477c7a75-9025-4ced-6286-08db3f008017
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YcDA3LP3RZ1SpjgB7dTPKjs6kzvzn88iICD4l/qaodYHlu1yBaMWyW7W189GS992AHg/G8Ni9P8t9PZAzT+GswTBIEOx4aad4Ghs3xcRI4JZNR4cFhBWJU4STCzhpWQ/hBTYHcko+8uo1sXJ1LPu9o24pvxuLXEA12WHxYa9NdLTVoN6rFJMk8qAi9Y0qtA3IxNc8Xp7yDWT2/gczrZx/zU1QF1Z1CiElxoIPnoHgJJCXsc/W5dyqdkPkZ+sEEb0NFx8j+Wl8RbY2auQCSunhhKlhPTBKsABqEySnLT0bDfrzUaRd35qcomSmMwoCjRMGinF6C85UOMfv5Ak+t6cbFEuR+A+KezZlkNxf90P/kWU/h3xS1IsEbdih/fDijxKhuftJ03UvskWE7DdyL13y9vp/FBPPDbVHNdL22gOmt06BUS42moR8c62yEy7gmF4+OOtvcNtUds/SJvWgZ8S0H4F76Yt3cdBjS4rrA0GVAqJsj8hvAqS5dVjs2FBdCFY1jhh4gpaeQky8AJkl/VTGeGy2ERT07p3iYeN5zHsoLpqwCQYQsLa6brW8ELuKxv444bzAmmZm5+ya3B3/vKHWTHa6gcrQVYpsPgYc/0nrhv4VVNeaAvLZnqZuKgelnSI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(54906003)(110136005)(9686003)(26005)(6506007)(478600001)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(83380400001)(316002)(7696005)(71200400001)(186003)(4326008)(8676002)(41300700001)(8936002)(5660300002)(2906002)(122000001)(52536014)(38070700005)(33656002)(38100700002)(55016003)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9472
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a18ea7f-f909-42fc-eb58-08db3f007886
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QYdQ5FCBe6+STQjb1o0U0zdhHNgF+Z7Lo+Gogw8NBZ1fwuq6ldHnWADAnK5a9a3IJPkG9NFi3duDob2PBKaUKB9ZE0uHjXVPwreQnaSgi6vFaxVEdF1BCgU+UIP8g+qthkGxbVZujM5jKLd+L13knnqkDeiGq1hxFcYHB1y4yXi1/m2bp6AQApOkvtgzmN056IY9qLvfAeGdPdOp3L+VglFwgUBK4jI+aEjs0O9KF6s+WWiZuxCByj16O+J0/3eyUVWu6y76QYpenbeRtNumnAMTTrbiTwVs0KGXsqEQHFahRJHSIL2/WyayGJlGdi/EJ9qURdMirfPdeUQUa8F46nZeNb6fZpQcNSj2cemkYOLzMpvVUXJj+KvWbJKKBWWKTx626uqP2TjYM5fQQ56kojIGuf3l2QO6q8tSHV+/V9qbWdMDHxSHqs/Rt+RnbUimVZGuQmHYCr6ht5TlI9fDQGRH2j7u82fWrR0Fd9a+M/+8fvOMMFhpcI5+60SEc9Bjnu+dk3SaUnWwCr0/QVj9JWAHXbie+BEaBYeJwd+TNE0Bj6BGb8EISukHi9npxcp3/Rytclz0duhdA3vUMAPD9bqWaIGL+G/+0VIP0l2RbbSuyXPzGkT7gO0fUcusa/2tOyStnxjloFZyZVuIl2KlTwVALgHsVz7j4AUUzE5NvKsMMIBIh8Krhb54f6uJJiX9kRjfk+SbFVQtNSVIklWlRQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(36840700001)(46966006)(40470700004)(4326008)(316002)(110136005)(54906003)(70586007)(70206006)(33656002)(186003)(9686003)(6506007)(26005)(107886003)(40460700003)(47076005)(36860700001)(81166007)(356005)(336012)(83380400001)(40480700001)(55016003)(5660300002)(41300700001)(82310400005)(8936002)(8676002)(478600001)(7696005)(86362001)(82740400003)(2906002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 04:59:18.4466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 477c7a75-9025-4ced-6286-08db3f008017
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9765

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v7 3/5] xen/arm64: mm: Introduce helpers to
> prepare/enable/disable the identity mapping
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
>=20
> On some platform, the identity mapping may have to start at 0. If we alwa=
ys
> keep the identity region mapped, NULL pointer dereference would lead to
> access to valid mapping.
>=20
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
>=20
> Two new external helpers are introduced:
>     - arch_setup_page_tables() will setup the page-tables so it is
>       easy to create the mapping afterwards.
>     - update_identity_mapping() will create/remove the identity mapping
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I used the test method described in my notes from patch#2, and this
patch passed the test, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

