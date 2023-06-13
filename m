Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1A72D78E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 05:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547747.855309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8uFs-00085P-Ry; Tue, 13 Jun 2023 02:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547747.855309; Tue, 13 Jun 2023 02:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8uFs-00082u-OZ; Tue, 13 Jun 2023 02:59:36 +0000
Received: by outflank-mailman (input) for mailman id 547747;
 Tue, 13 Jun 2023 02:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeqv=CB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q8uFr-00082o-Eq
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 02:59:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe13::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 507d843b-0996-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 04:59:30 +0200 (CEST)
Received: from DB6PR0402CA0018.eurprd04.prod.outlook.com (2603:10a6:4:91::28)
 by DB9PR08MB6409.eurprd08.prod.outlook.com (2603:10a6:10:23c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 02:59:27 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::36) by DB6PR0402CA0018.outlook.office365.com
 (2603:10a6:4:91::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.33 via Frontend
 Transport; Tue, 13 Jun 2023 02:59:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21 via Frontend Transport; Tue, 13 Jun 2023 02:59:27 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Tue, 13 Jun 2023 02:59:27 +0000
Received: from 796c741726b0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9532FEE5-2FD1-4711-B127-26458CC287C4.1; 
 Tue, 13 Jun 2023 02:59:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 796c741726b0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Jun 2023 02:59:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7782.eurprd08.prod.outlook.com (2603:10a6:20b:516::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 02:59:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 02:59:18 +0000
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
X-Inumbo-ID: 507d843b-0996-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2CnNMhr8lQ2oX0Xq5VD+L9NO9J+jxzzrtdxVYQyL9s=;
 b=aOKMS3M2f2Yfni3zznxOxhpVU76Pifvy4MphaCuX0zo0tgTvu7JAH50kVXt3j5pKD+WZBgTifubukUUox1rVUx0ec/m1bfNhJTuIHRB+O0mrKYd3sFUNjOZohXJFAncmv1AnktUUjZaYiAAv9g6oMNaC7T5wTMtfcbqdcm9RAYY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkWmThw3t81/LC1sqCXSSTcxYIB+CY3n1C0mH+0Pc3D+kfYDLFVRgFsTE+EUn80RVRgtXrR0lXlnbJbU6ih2ZeGakXrArLWb46hR4hIv62bs0Zfr/ri9Ukntd9JPorCxu7qIiRe2VecneVER9so1AlYoiHckZ+9v8dh4Oxo5cbg1NAsnKOALByS3et2h+GWbWIKpRMixHmBr9flN8i3gRETW9YxvNNJvOb4Ewua7qAR+s62VZDRX/aZyQZ8eC1WGZtj9znRhaZmu6bGW1K9dWji6uIqvdUc2pz4L6HknRaznusNuFoMuy9gr/o8Tw2E5fwnO6s2+8uFMrWSwX99V6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2CnNMhr8lQ2oX0Xq5VD+L9NO9J+jxzzrtdxVYQyL9s=;
 b=TE/gJxAnnvMYZlGHD7G9dRG3WOzNdabkk/fNExskrHR6LZc/M9sfW7o66jVOyPFMpbejKqu6+vaQOlxoXjtZC+9U4FOgWWYs2SvxCrFFA6OIqlrezJYoQPd58mcUMpGyrU5kQ0kRGCNttaU3Xddq1PJCelaWby4L5o4XCDqKsE80qPW2jhk5ZufVqU37jwAWrAA40Jx87QVz1skCB5LQPfQrEk6lzKPzYnmjFl7mtn7O4Rosa1QgLzx6fEJky6UiZxvKJQy2QPlWR2yNOnnvYS4a159alChOISFLL8Cm+hxwabOR5/zV7959AKaXdLPPtccqQtrElNsxIzU8T3PccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2CnNMhr8lQ2oX0Xq5VD+L9NO9J+jxzzrtdxVYQyL9s=;
 b=aOKMS3M2f2Yfni3zznxOxhpVU76Pifvy4MphaCuX0zo0tgTvu7JAH50kVXt3j5pKD+WZBgTifubukUUox1rVUx0ec/m1bfNhJTuIHRB+O0mrKYd3sFUNjOZohXJFAncmv1AnktUUjZaYiAAv9g6oMNaC7T5wTMtfcbqdcm9RAYY=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/4] xen/arm: debug-pl011: Use correct accessors
Thread-Topic: [PATCH 1/4] xen/arm: debug-pl011: Use correct accessors
Thread-Index: AQHZmSJjbSuJb96sHUqL7cP2ByEXha+IAkwQ
Date: Tue, 13 Jun 2023 02:59:18 +0000
Message-ID:
 <AS8PR08MB799105E01AD4C8FDACB084F79255A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230607092727.19654-1-michal.orzel@amd.com>
 <20230607092727.19654-2-michal.orzel@amd.com>
In-Reply-To: <20230607092727.19654-2-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A341C5A7383BC642AD386E1AFEC58ADC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7782:EE_|DBAEUR03FT049:EE_|DB9PR08MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f8230a-f065-4431-4eff-08db6bba334b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 b4B9qpXdtGQ0SxFFf2quRifmXT2m6ukoaVtUTbTtDk4gaSut4lbP7OWkTPpfaJ/F0wGPOwrDktXn8nXbbAkuannxXVO/z02Ood+JdcnevaerWXdDNW6Hh5fUbmcJ0+Sh74bmMpFCDNmO4ZmpHqNjZ/cWEL2zOqKWCyMFhml4dOPyIHXr6pHtUG5vync96Y9VvOcwyt/kVA3hSdRqAcMTgqr0Osak8Mb4XdW9b9DKv1oSY9sBeb1zhWpdNfHkuN5DnSBmhkt3aWSgmKPtpCU89pUZecPP5TAN+lgiU2JwJfT/sbcMiL6wGzx7E6eGPtQVrrZW7VwXeNCsPRCElnMbM5h2GNaUUFU+1VO4D3v5M6cRaNBhKXfa3Lg4PF6HBn5TBpXyEVnZkdpRNGOYt5aw4zj88Xw3Lml/MEDveqxKKrw2uXmWJQqYx24Fbjl+lARi2OeW4IQlkt92rlxWwZmIPjJPv9T3PwZSFJ0Y3iETcKYbRgdJqEZoYGubo2eAAYdbN/JwTYNYy1aKrzUD0R/pODbgCpRbw4xjpyjs3lWN46+pglNi5iU2iVn0LESd2MqftDVt0KlWzyOFg/2etIUKqdPhYK5t/klfjap4Yl1PhVT65PHI4/MhqsQ3GkYzp/N7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(186003)(9686003)(26005)(6506007)(83380400001)(71200400001)(7696005)(478600001)(2906002)(4744005)(55016003)(8936002)(8676002)(110136005)(54906003)(33656002)(41300700001)(86362001)(38100700002)(122000001)(5660300002)(52536014)(4326008)(64756008)(76116006)(66946007)(66446008)(38070700005)(66476007)(66556008)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7782
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b50cccf2-f7e1-486f-31b9-08db6bba2e54
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Dl8MiVPq4g2Pr+QdwpkSIwGV5ETZeT73hUfYhcmUaJtinCOX6U04l5JLTrfJsZzOQ5vcGY2HT4nbqS4HW+DxKfutQWPBM30l9AjH//kYdJKohKKQH/mghFQEhj1y/7m7T8yaBNO5UeGj9OkAYIOXIBueMiA/5qoVhLRr7ydrpo1U3Cxfw9N6ggt7VEB1u8x5XA+c3pNsiuC6RpDOL8DomYyNrOnlKJsaFjMA0dxlkjEgZkfNS78y9rd7GqztJqGi6R4LZ9o1mMP6DFQGUjWBn7WZC4Nd6hHnbfbae04nwiM2jYhrRQOBEpKcojWZCO+D8UjwPIoSDNHR/FMVXJ/6I3brIQ+LHAcgdxR+kltPzXbda4oby1yGSO0ZkftGDU4k42xY/GPYiWGu69aF/flnVw/kmwVHrDPsmaNRvh6RKzS+r9PXoE8dXMa0PTeYX5L1GN21DlWnGXqfUIvuIHUr3ggsYkf4HuwhB390YKRXraWHXQiKOzt98WOWOVCiPUixjzgWFviNUqZFDEblnhujuoOL50DhWaZtczY+pIZ6uLALFQaEXdYM7xJmZ7KzD9UkMtRj4/0njlL9Dy4x1Bc+4sWwH1ip6oey0t8oQSeMmTY94nVQP649Prhr366MFUoUs1eJvz+zO2j4LtKevYKsAwnrtgm0V4qx8Thf+W4opZ6DS+FJfdTI+mkFsVMHWYIIBVLzu6f14RJ3SLdsyvYDsYx4+UzFG/bMcoHi2h6Iz/dihLnKYbiQlvaWda9HloY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(4744005)(2906002)(86362001)(33656002)(82310400005)(52536014)(40480700001)(55016003)(7696005)(186003)(336012)(83380400001)(36860700001)(26005)(6506007)(9686003)(107886003)(82740400003)(81166007)(356005)(40460700003)(110136005)(54906003)(70586007)(70206006)(4326008)(316002)(5660300002)(47076005)(8936002)(478600001)(8676002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 02:59:27.1563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f8230a-f065-4431-4eff-08db6bba334b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6409

Hi Michal,

> -----Original Message-----
> Subject: [PATCH 1/4] xen/arm: debug-pl011: Use correct accessors
>=20
> Although most PL011 UARTs can cope with 32-bit accesses, some of the old
> legacy ones might not. PL011 registers are 8/16-bit wide and this shall
> be perceived as the normal behavior.
>=20
> Modify early printk pl011 code for arm32/arm64 to use the correct
> accessors depending on the register size (refer ARM DDI 0183G, Table 3.1)=
.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

I've tested this patch on top of today's staging on FVP arm32 and arm64 and
confirm this patch will not break existing functionality. So:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

