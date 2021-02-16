Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F022D31D079
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 19:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86030.161085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC5SV-00017k-H1; Tue, 16 Feb 2021 18:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86030.161085; Tue, 16 Feb 2021 18:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC5SV-00017L-Dm; Tue, 16 Feb 2021 18:52:27 +0000
Received: by outflank-mailman (input) for mailman id 86030;
 Tue, 16 Feb 2021 18:52:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdBD=HS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lC5SU-00017F-GY
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 18:52:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e61aa7c9-daef-48e1-a942-7c197774199c;
 Tue, 16 Feb 2021 18:52:22 +0000 (UTC)
Received: from MR2P264CA0159.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::22) by
 DBAPR08MB5688.eurprd08.prod.outlook.com (2603:10a6:10:1a0::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.28; Tue, 16 Feb 2021 18:52:20 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::7f) by MR2P264CA0159.outlook.office365.com
 (2603:10a6:501:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38 via Frontend
 Transport; Tue, 16 Feb 2021 18:52:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 18:52:19 +0000
Received: ("Tessian outbound e7cb4a6f0881:v71");
 Tue, 16 Feb 2021 18:52:18 +0000
Received: from cb8c037f6224.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6E9DABD-0376-438A-B165-DD5EC9082A4E.1; 
 Tue, 16 Feb 2021 18:52:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb8c037f6224.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Feb 2021 18:52:13 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2374.eurprd08.prod.outlook.com (2603:10a6:4:8a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36; Tue, 16 Feb
 2021 18:52:12 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3846.043; Tue, 16 Feb 2021
 18:52:12 +0000
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
X-Inumbo-ID: e61aa7c9-daef-48e1-a942-7c197774199c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NsScOyP/RjOMccIdFQRHi2n/MAzJVlLB32h7r44Nd8=;
 b=iNBRb4dCNkC/aqG/uV0NiUp7YgGWdqZoUrPdXrl0j4VTsgkZiJ1BNDcDQ3ElifniEU5CqGBmPzJElD9Pk1DEewTYmds0KcW7QIQptpgT+/MAteUJ2mirreDZsQLGGJGtS8HaPuOY64bILewxHXYNrgaC1BA2tftseg4AUieY9js=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1188f4d710f32df5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXZ+IHgEs58YwGZBm9ANnWUYgVknWz8R/fiEvtqAaCNeC1apNOp+YY7i2+N7f8e9i1iNvj1vl/urr9m3FbxnSblzVHo5yIBjNgsCDX48JpzqYLt6QxvCPMFyn286FtfnIXR94RedTqPb6CY9yQxFe9OyrskQBQgDeJ8CUPX2t6sKI9G4IedWEhSa01uFnqmnYkfRYJgkngBKT5+FcPL09eMs0x5MYzXbP33m2+fgEX7Qmo1L+JJXD3SQVkMKtr3LgDukMp9EqhBG2ft4OIq8r9Q0uMCXMjOG3Yjle8CFd7ua3/nhdr9KrJ4f3soIM1Ed3FCJTgzpBP0POSAgHCWhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NsScOyP/RjOMccIdFQRHi2n/MAzJVlLB32h7r44Nd8=;
 b=fL2y8/v1oz3JV5KLaoL6JnaQyxxSLWOUp692miXzHBAEYrtPgo9Y47jFKhufbB8YGSY1XoRFYpW23r7P2oJ2ybkcioREMxzRdwiLaoblbVn/EwhCw4jXd7dXwPVpWU0y4OXNnqfR+kSrH26ZzYcAAWUNiCwx59o4CGeISxPEKh/H6aklLmGLN0CgDPswWGlDu1TbsmTUBe8klV+gB6fqKz5SRXvtQIi7kfyKIRpRgfiWE8onJMKJjFVJjdB3yoFqfpwyb72jYb/iMBmIJ5jUTmrVe0vhYMiXfdJajII6PWYykPQoG6nRtSP68Brq/DtNxP4iMwZFtd7ZuFfNKDk6tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NsScOyP/RjOMccIdFQRHi2n/MAzJVlLB32h7r44Nd8=;
 b=iNBRb4dCNkC/aqG/uV0NiUp7YgGWdqZoUrPdXrl0j4VTsgkZiJ1BNDcDQ3ElifniEU5CqGBmPzJElD9Pk1DEewTYmds0KcW7QIQptpgT+/MAteUJ2mirreDZsQLGGJGtS8HaPuOY64bILewxHXYNrgaC1BA2tftseg4AUieY9js=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/iommu: arm: Don't insert an IOMMU mapping when the
 grantee and granter...
Thread-Topic: [PATCH] xen/iommu: arm: Don't insert an IOMMU mapping when the
 grantee and granter...
Thread-Index: AQHXAt6oFaIGN7XEykaD6M/rWzXvuKpbI+sA
Date: Tue, 16 Feb 2021 18:52:11 +0000
Message-ID: <E5D9902F-7105-4D6F-8CD4-F774EAE0821F@arm.com>
References: <20210214143504.23099-1-julien@xen.org>
In-Reply-To: <20210214143504.23099-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8af9af91-adac-4bfc-da1d-08d8d2abfcc8
x-ms-traffictypediagnostic: DB6PR0802MB2374:|DBAPR08MB5688:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5688A0238013B6504C8F5520FC879@DBAPR08MB5688.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RcbLZcAsCZuOQ3j/+8FY0iZ8rtkhvCjJUsZIG71tc4ifQjlpTzlS/QOxBF1FF1nS0C3YgpV5CPqLYG1tCyKqvns/YpMfNphg/ojM162SoCJPkza0re0rO0BFuYG4KJYbC6kgjcMctRQ9PkkWMXh4ZZtWIRdNOgMEkqWTXo6oIIMyfTCCVMqc9h7DWA2HYxfiHgVn+SOSMANsHPfnO6bPYv/d253jW1vUZZRzBWpvEStRAfwi4mGx3zX84o4eTX7R3j26bPuL2bCSm9+un4GSNcBP+L4IsafG7twKT/iybbk65t3r9dlXBvJwkphYK9UbgolAM+yCDoLs9ZIJ/cpyDdbWIo2e7SWrnuGtgC/bePI+qGVDS+SWGqADJ8OSmTOnNVM5nS3uzdXNZFWXlqhDwwP6Myu0vFwrzDrLs1VTf23h+Ar+dh1cbqIc4meAmkAhwWaqB6vajzL1YJ83wepiuZz4oz3tDkubMnZq4r6OKMnPmf3jIthVFtXGfZIZxv269XQgU5j7iCy6/5nf9BzcHX/vm58oq1ElJDfDkNAeKqEAQ8QgtE2Omv8oxMFLjsXIy5Uqf6GV+kxdsnveEMH5T1hdiQB0wboFnSqLMm1cXTM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39830400003)(64756008)(66476007)(66556008)(66946007)(66446008)(2906002)(71200400001)(76116006)(6506007)(91956017)(83380400001)(478600001)(33656002)(316002)(2616005)(26005)(5660300002)(6916009)(6512007)(186003)(53546011)(54906003)(6486002)(86362001)(8936002)(8676002)(4326008)(36756003)(6314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?c0g4GesZk4lQPbgU4Zl3Afd+gt2Txm8oitofNy8HsaV2Ozz5JmDlBJs4dIfz?=
 =?us-ascii?Q?wxc+usuceW3un7fB0cPoTXsZsi1cnQnI3F4pbdyYCFxBXR1neOz7ba/ZKpBu?=
 =?us-ascii?Q?5xBhRKvs9eIHAQ6qbRuawyiPObNgmgCcl1ts5WzlTTTAm2Cm1uL7XSCdTp7T?=
 =?us-ascii?Q?CjlQyQMnc0yTCDU6Gsbo7udDcPTbpHQfRxWqVfW+5PGR8XfsST+0ODhm90JZ?=
 =?us-ascii?Q?Np6QJp6uf/ku6P50wAiYHmDDakH5ZObX9SiU+wzn3z0FLuNrE632BgND+DYd?=
 =?us-ascii?Q?4ygLAlA/4HynTTMh4EtywqDJsHdTy+3IRzgAw77DgOs258AvjljP0G81RPND?=
 =?us-ascii?Q?kkddHcT8xMA2eQmpoPx2qeB64Sl1u05q1iFNvSX0WF/U/tSnjsqP9hPniHAC?=
 =?us-ascii?Q?cxhWDjRUq4S4o+HdkCzhxxDcTo58jHWx4xHso5UFHKVfcOvt0UFv6U9dgnag?=
 =?us-ascii?Q?B8zqp8H95hYHZ1bWBmro4U2PA0w4rzAxFwMXDDFka7h60WUdgEDMflsTWInM?=
 =?us-ascii?Q?rsi/IIFTDiOy5MA2P0+ByOI7wsUT2mVbgnPoyISPc2cGWQeFKB3Usn+0D3Qt?=
 =?us-ascii?Q?L0k06d6+Iipr8eXcFDjdsB6Mmq4c35Tl4cqMnsnJbzFYaYIDpDvtZUV1FYIE?=
 =?us-ascii?Q?dLqDOvOAbUxGJlDr//nNKkCsFH+vnqCVTWWllD1DpzDHcr5fxrZCciGMmxCW?=
 =?us-ascii?Q?rfoVOOQureRYtQLrPbnBxiRgbX6+yPgCy0U/73dJOC/5fujSvqc/3VrKPMZd?=
 =?us-ascii?Q?GvhdSl+F5cQARyHmkiJ12bOA/DnMz1fonr9iinieYDIbtVLbou/dkO1a6BUS?=
 =?us-ascii?Q?C0d5JEaRizEHsdm4tlA1Z6dR+aGEBq5tSwqtWNW62W+Np9x/YVaGLtyjbM4+?=
 =?us-ascii?Q?r/8ItLFC5snEVBod7tH5M4FURMOgGeFdPPe/KUNXHUhVt81Cr5knyo3Uyzn0?=
 =?us-ascii?Q?fvLnti4gH9TuwgfimcUo4JBAhaLmWZJWHFcYXTiTrv+JnXrWZM3f6tAxQ4Ew?=
 =?us-ascii?Q?b9aqboXUqJH7tUh0eke7bxY8rTAlizPYJ7Z6Wv0/oXWkRdQZV89DCmQYzRq5?=
 =?us-ascii?Q?17RbBKoUzSnBN78defveYh8YtbLr4Ae7y9UTXFfJux3JC8ZmvuX/FKs5NspV?=
 =?us-ascii?Q?xW+VpIotrES9k4++gV0PT1Inq0DWKNfEXMeaGwaKQDIFq7etUMlUmF3L9DSI?=
 =?us-ascii?Q?Nhg3+7NYmFZmNyGJMelouszXkD6HfFfj7qFgXwJx0d1mDq7blYoIlvBto6H3?=
 =?us-ascii?Q?B26DshNSmMFxjDVSbPOvZL5UrzXwohmjmG5KzvdENXBJz8PkKnRuFhnR741q?=
 =?us-ascii?Q?xnyNUP6eu892ZZV2LhFqvS8a?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DF969F0A8356449816588662CBBB96B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2374
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2414cea8-2454-4003-2fd4-08d8d2abf859
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ruH9fzDY61FXgORffw22pVl/eBmqO2DLGF8II86t1Nkpe6I048P31NubbhYpMLNj9sbZJ36dfZG/q5SZzxD27SO0cmVO+cbiqcrODPQGP7NHDlJkSHbXoMW1zMGnbT62qChAdlKasOhEnaV8yHMJB5QFj4sKMmpg1pU2cb7nUYxoZQ8lGDHdZ4QDNf37HZtYFUkiTTUXahtb4NrUS489uCZQKrT840v4YA5AdBFQS44OxXp1ftduEAp4KVLWBfEqiB7l2oXBxnuPbqkBbdt8GfK0R86tMR7HVGLLX6u0/t5ESI4egXo/tzUhfOMzSzPG7n4dXZzbqoi8eVNqlYVTw+TzmL23xEEWdwrc1kiKkvie6lXip8T5ppxSLHGc5r1DkuhGVXVFqRvDklIJ+FGIGXlaDclgNaVCHHEABL8ncBIntWv12HVOgj3+V26SNxyKDTmcJyAeRTmYWBOX0L1gkm3QpyDn9rb+eFwCB2LO4eskETwhZ732NwC5+vOJgZp9muTaECP038GgXyFOgGmP32ZkpKu8ESMd0cPErAAjNm29Ba6JLEKfbym01YxA8fBeWJyd6YvDCk60793CpT4lrkeAlK0A+3DtNsHXIIBRcqpgFPHDwVBlOwIrTxfYbsxwCQGDWdcoGJ3smu5lc3H/bLprV7xKu7UxSJ9DFHXlfwByAi8yp1K+LkeBzdl/xma
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39830400003)(346002)(46966006)(36840700001)(356005)(53546011)(6512007)(82310400003)(6486002)(81166007)(70586007)(70206006)(36860700001)(6506007)(186003)(2906002)(47076005)(54906003)(8936002)(4326008)(478600001)(6862004)(336012)(26005)(36756003)(316002)(107886003)(86362001)(2616005)(8676002)(5660300002)(33656002)(83380400001)(6314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 18:52:19.3907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af9af91-adac-4bfc-da1d-08d8d2abfcc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5688

Hello Julien,

> On 14 Feb 2021, at 2:35 pm, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> ... are the same.
>=20
> When the IOMMU is enabled and the domain is direct mapped (e.g. Dom0),
> Xen will insert a 1:1 mapping for each grant mapping in the P2M to
> allow DMA.
>=20
> This works quite well when the grantee and granter and

/s/and/are

> not the same
> because the GFN in the P2M should not be mapped. However, if they are
> the same, we will overwrite the mapping. Worse, it will be completely
> removed when the grant is unmapped.
>=20
> As the domain is direct mapped, a 1:1 mapping should always present in
> the P2M. This is not 100% guaranteed if the domain decides to mess with
> the P2M. However, such domain would already end up in trouble as the
> page would be soon be freed (when the last reference dropped).
>=20
> Add an additional check in arm_iommu_{,un}map_page() to check whether
> the page belongs to the domain. If it is belongs to it, then ignore the
> request.
>=20
> Note that we don't need to hold an extra reference on the page because
> the grant code will already do it for us.
>=20
> Reported-by: Rahul Singh <Rahul.Singh@arm.com>
> Fixes: 552710b38863 ("xen/arm: grant: Add another entry to map MFN 1:1 in=
 dom0 p2m")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With the typo fixed.

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
> ---
>=20
> This is a candidate for 4.15. Without the patch, it would not be
> possible to get the frontend and backend in the same domain (useful when
> trying to map the guest block device in dom0).
> ---
> xen/drivers/passthrough/arm/iommu_helpers.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
>=20
> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/pa=
ssthrough/arm/iommu_helpers.c
> index a36e2b8e6c42..35a813308b8c 100644
> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
> @@ -53,6 +53,17 @@ int __must_check arm_iommu_map_page(struct domain *d, =
dfn_t dfn, mfn_t mfn,
>=20
>     t =3D (flags & IOMMUF_writable) ? p2m_iommu_map_rw : p2m_iommu_map_ro=
;
>=20
> +    /*
> +     * The granter and grantee can be the same domain. In normal
> +     * condition, the 1:1 mapping should already present in the P2M so
> +     * we want to avoid overwriting it.
> +     *
> +     * Note that there is no guarantee the 1:1 mapping will be present
> +     * if the domain decides to mess with the P2M.
> +     */
> +    if ( page_get_owner(mfn_to_page(mfn)) =3D=3D d )
> +        return 0;
> +
>     /*
>      * The function guest_physmap_add_entry replaces the current mapping
>      * if there is already one...
> @@ -71,6 +82,13 @@ int __must_check arm_iommu_unmap_page(struct domain *d=
, dfn_t dfn,
>     if ( !is_domain_direct_mapped(d) )
>         return -EINVAL;
>=20
> +    /*
> +     * When the granter and grantee are the same, we didn't insert a
> +     * mapping. So ignore the unmap request.
> +     */
> +    if ( page_get_owner(mfn_to_page(_mfn(dfn_x(dfn)))) =3D=3D d )
> +        return 0;
> +
>     return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)=
), 0);
> }
>=20
> --=20
> 2.17.1
>=20


