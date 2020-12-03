Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E172CD62E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 13:57:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43436.78077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoAu-0007Xh-WA; Thu, 03 Dec 2020 12:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43436.78077; Thu, 03 Dec 2020 12:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoAu-0007XI-S0; Thu, 03 Dec 2020 12:57:32 +0000
Received: by outflank-mailman (input) for mailman id 43436;
 Thu, 03 Dec 2020 12:57:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lp8G=FH=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkoAt-0007XD-BF
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 12:57:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d420663-49d3-401a-bc84-1e510e77ee18;
 Thu, 03 Dec 2020 12:57:28 +0000 (UTC)
Received: from AS8PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:20b:310::33)
 by VI1PR08MB4224.eurprd08.prod.outlook.com (2603:10a6:803:bc::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 12:57:26 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::b1) by AS8PR04CA0028.outlook.office365.com
 (2603:10a6:20b:310::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 12:57:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:57:25 +0000
Received: ("Tessian outbound 6af064f543d4:v71");
 Thu, 03 Dec 2020 12:57:24 +0000
Received: from 24564b47310b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EBBF56B8-8F59-4D44-8175-956248CF8379.1; 
 Thu, 03 Dec 2020 12:57:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 24564b47310b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Dec 2020 12:57:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0801MB2119.eurprd08.prod.outlook.com (2603:10a6:4:34::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Thu, 3 Dec
 2020 12:57:05 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.032; Thu, 3 Dec 2020
 12:57:05 +0000
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
X-Inumbo-ID: 6d420663-49d3-401a-bc84-1e510e77ee18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glmXbc+pwXkEkBwx0IrBVP6cHdvjkgZ8tsP4AEr4lIc=;
 b=hFu4KpI++Qm2FS1G1v4gPGB1OBgmmG24sB645AEjuzzHOwTEOIhxwSY8vQzVJg12iRlaNXBJKlUH8O/XdkIya4/GW/+QwwU7pD7d1TAM7TyyuzY+CKa3yWtAiLPnz7QzQu0TebqvQ4Eqtm7bQwxB95jrjfi0m3M8dAeDDUiZxkA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 202d5570b031ef18
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTry7acv2usk0+sECMXUYVTbsK2dKplcguUlSGIPD3sjcRCLC9F9591c+hVoxCJPUDhwkBSWhbLJSr4PFGXnvmQvY27Osn9GAm6epmT6oIAmQzwFVXeKX/rhnvJniMvehKyffYbYrsxdhCgqravfwYEvh2v+If8XERfg809tdMmuJFqM+S6qZK3/x58Le+zxQjqxgUxnqatb0A33EVOY5qKlq78HdJwGM26phhmJtBwk6pIrz3qWvFCnFj+orMV2DwqFhpLtVXE4P2mIhQ4pa+Aaa6JvBbRxQQ9KImzfTroDiEBNflWSjvLeIbnU3pElznXHhl4cqHsf0q3DK6JjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glmXbc+pwXkEkBwx0IrBVP6cHdvjkgZ8tsP4AEr4lIc=;
 b=dw1dDliY07EHyiNZXFTATQ+yR1Z+Dq5DXdh6IeF9KXyjMcEw+iNgW1UK6tPZPOVt3OcHvSwY0QRVk+fKNZfe3NzGGZMmYRMNjVcah0TCgAhcNkzEMaAm++AAp+xsKhCizj/z8pRTRURk5P7fZ3Ebx9fqL71rBXPnWSbHZodJqUteYtoaLjp8wqRBz8DenvIMHcfH+pG1eQlgNSwHVUUM6yjXt09ErgV+3c0ewdM6SDMlrJX02BZUiorMXx7b6dK7S+JPuyTDqWrMCpFabyCwVA3o+woCr29cFNF/WZ3op3jgw9GwJXuuTMHVi/WvYqUMgHXhjPrsRYEOO70lDGbGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glmXbc+pwXkEkBwx0IrBVP6cHdvjkgZ8tsP4AEr4lIc=;
 b=hFu4KpI++Qm2FS1G1v4gPGB1OBgmmG24sB645AEjuzzHOwTEOIhxwSY8vQzVJg12iRlaNXBJKlUH8O/XdkIya4/GW/+QwwU7pD7d1TAM7TyyuzY+CKa3yWtAiLPnz7QzQu0TebqvQ4Eqtm7bQwxB95jrjfi0m3M8dAeDDUiZxkA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/8] xen/arm: revert patch related to XArray
Thread-Topic: [PATCH v2 3/8] xen/arm: revert patch related to XArray
Thread-Index: AQHWxBX3rCwwjKDJrkuX4ODVkz/db6nj2uAAgAGEjAA=
Date: Thu, 3 Dec 2020 12:57:05 +0000
Message-ID: <2B1A7090-F07C-4DF9-BDEC-6E5A2D715DB4@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <612c1adabc1c26a539abf0dc05ea20b51e66e85f.1606406359.git.rahul.singh@arm.com>
 <266b918c-b9c4-e067-b8dc-4e879c913af5@xen.org>
In-Reply-To: <266b918c-b9c4-e067-b8dc-4e879c913af5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 59d3e2e9-1b2d-4458-d15e-08d8978afb74
x-ms-traffictypediagnostic: DB6PR0801MB2119:|VI1PR08MB4224:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB42240F19F8CEBE19E1CB685EFCF20@VI1PR08MB4224.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mCLUFCUA6v+DZYPEWBQ7G7UxmtMvVp5B7SfXRxrDuCHpuCPlcevGsDlQv0DRmfG9R8xSbyvdeajhQjhBWFccBvYUoeUgl4eMSWMlyxlNNHTTpGX4hapDuMbU2YYksgUdXSfZRz4OIWNBDRPKwhFZJfl/qR4qTubmTRp4hZ8Y7KY4pNdLxaAEMVkXwOiscPvHaMD0gBtwvjgvrvOoQlgI+DB+OKFqGhRW9zQHVcyRzkkEVDGFCfoHU0fnjB91a75Ti0+iAFoZIn3LoAo3nHO28BqQ4QSf9fX0pe9DtDoh7K6gjpAM3FPrWf3YHXRHIXUY2fvrAkkI0A6xToTPYCDKn1lcuAhTxF+LAfZP8ux21ITb/on4N6Nfu/MYyfq0b0yS
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(86362001)(478600001)(83380400001)(36756003)(6916009)(4326008)(5660300002)(2616005)(8936002)(4744005)(8676002)(54906003)(71200400001)(2906002)(316002)(186003)(6506007)(26005)(6512007)(66446008)(64756008)(6486002)(66946007)(66476007)(91956017)(76116006)(66556008)(53546011)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?wXwMeKWl+u9CXa9j/BqWovsSrEjKiWRzz8yjYYNID1Ti6ijKOFZo46AgyroR?=
 =?us-ascii?Q?TQJ5u/f+LD/DH5UCt1qc+P+k9ssCsL6+rb8AUpM0IHxnlWvuNM5U3zMBQr9T?=
 =?us-ascii?Q?VNKIIHiBb8g9i+y+layFaQftGM7WGea3gwbZq17wrwFv5YzogfsaUggUUfOJ?=
 =?us-ascii?Q?Cw3DPeRm2IVHCjhYb5pYcsImiZ4rixW+LNm+PH1UWEjoPjj5gi0UUZsdzpTG?=
 =?us-ascii?Q?ju/xKIH6lgHSc6gaDFpPI5ofJ7GmcmhG3zJj/U/XW2ODDqG2h3R5DZeEzk5B?=
 =?us-ascii?Q?pvenGFTed2XJcgqGh5zDmUlfBZt9FbcxjoyviKvTf5Orj5C1U3LgTVt8zJKt?=
 =?us-ascii?Q?utnuzPpAVEcP5hdp/Mq99Bj9NA5Z8cpfBEC1AYmbMyochLHlgmP3YiFQ5iNw?=
 =?us-ascii?Q?FDiMJfG2TP8JmsbYgPFiR6KmX6UdXLOlOJi3hhnTLueq+g/2GRsNB0mvX+2Y?=
 =?us-ascii?Q?LWMCp0sCepzE+92OQlCwPH5tbWCBzb4uyqM+bvoVX4la/oGv/zz/zYAsFEqS?=
 =?us-ascii?Q?z8QYT8A+7xDf9SBc7itrJu/NDo1t9prjigIKI/XMAXFXV5DESx4LT7soe7vI?=
 =?us-ascii?Q?2bsdFS49jNjy6VzSz05g4Y5KxxPDzH8OMuWuwWBd7ngtsiEtM1EO3CSOvRyQ?=
 =?us-ascii?Q?yCvfdyw/z9giDfp7i7xI+mWutAHlW1Bcmjo+7MiikPK5oOctL9Wc9CGe/UqW?=
 =?us-ascii?Q?yKpYSeYOIgEfUYosbcBtNDTSaLzV/urmfUOXRmq8fRYm7olFl8P+B6COc7NH?=
 =?us-ascii?Q?FyDEc1Oda+38kbdJ7Y4EDUH836kt4WcrjoN5sBzJZKJBdvBEq7B1DY5WBOJ/?=
 =?us-ascii?Q?SGNogS4c86RlKyVuu+kDmQIYNH05twUSxX5tod0G5kAPBqDCU5wQghr4utgc?=
 =?us-ascii?Q?8LpMu1HB8kP+yV4pZOnCijab18QtoxugPzvcaNWou3surnStrGxtWmpVwkr7?=
 =?us-ascii?Q?IKsZtrV+OfKzBdjdPbBwRC5xzBiAROEu+g+44zqYOT5rxDoKsU6Sn5eA+uAZ?=
 =?us-ascii?Q?hMxk?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <553694E2A5AE774F84C8E786654269A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2119
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	745f7346-13c0-4949-ee3f-08d8978aef78
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4s/L8vUmUfb+8/QS+GFPYgvvRyokVTqxfx43T3TmnKFL375Lz0xrb5Fm2LXcjaIViQZO66O+qgfvPb+Rq9smdcViuQlCMLeg8svD21AxzxjLoZ+KDHwI5RjtoXW/W9CslZ5pjnEr7u7C4niOr0oVtAxNai59kneYXxM/JbxRHUb3m3DLzKTfBYEkXPRIcISLJnOG4tIAdogYV5sdkGF3+r7Ycp5BSDGDq4bDuRvRA85ATIdCiyQVSR5f/2Q/1UH7c8MFalbtVjtjQ3bqYBQvuQKxZo91CJU+diWDJ5GwypMle5UPiX7k1w2SG1DoFylts58y2gnBf51HziuGPWUm429n5lLL/TkJSBpikl8xTzfB39x+r3m1FZ/DOxquMxW09pTP7UYwXgRqfzvxAoQfEg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(8936002)(82310400003)(83380400001)(8676002)(2906002)(6862004)(478600001)(4326008)(107886003)(86362001)(186003)(336012)(26005)(53546011)(2616005)(6512007)(81166007)(6486002)(6506007)(47076004)(5660300002)(82740400003)(36756003)(70586007)(33656002)(316002)(70206006)(54906003)(4744005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 12:57:25.1473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d3e2e9-1b2d-4458-d15e-08d8978afb74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4224

Hello Julien,

> On 2 Dec 2020, at 1:46 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 26/11/2020 17:02, Rahul Singh wrote:
>> XArray is not implemented in XEN revert the patch that introduce the
>> XArray code in SMMUv3 driver.
>=20
> Similar to the atomic revert, you are explaining why the revert but not t=
he consequences. I think this is quite important to have them outline in th=
e commit message as it looks like it means the SMMU driver would not scale.

Ok I will add.
>=20
>> Once XArray is implemented in XEN this patch can be added in XEN.
>=20
> What's the plan for that?

As of now there is no plan for Xarray from our side. =20
Do we have requirement for Xarray implementation in XEN ?

Regards,
Rahul

>=20
> Cheers,
>=20
> --=20
> Julien Grall


