Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A67AFED3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608754.947448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQ9W-00076a-DY; Wed, 27 Sep 2023 08:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608754.947448; Wed, 27 Sep 2023 08:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQ9W-000744-Ak; Wed, 27 Sep 2023 08:44:14 +0000
Received: by outflank-mailman (input) for mailman id 608754;
 Wed, 27 Sep 2023 08:44:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x8T5=FL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qlQ9V-00073y-5i
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:44:13 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07b76f1f-5d12-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 10:44:11 +0200 (CEST)
Received: from DUZPR01CA0129.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::12) by DB3PR08MB8987.eurprd08.prod.outlook.com
 (2603:10a6:10:431::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 08:44:08 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::38) by DUZPR01CA0129.outlook.office365.com
 (2603:10a6:10:4bc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Wed, 27 Sep 2023 08:44:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21 via Frontend Transport; Wed, 27 Sep 2023 08:44:08 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Wed, 27 Sep 2023 08:44:08 +0000
Received: from 23a30c9c77b2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1953A756-560E-4AEE-B9C7-8024DD98B2A8.1; 
 Wed, 27 Sep 2023 08:44:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 23a30c9c77b2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 08:44:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB10349.eurprd08.prod.outlook.com (2603:10a6:20b:57b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 08:43:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 08:43:58 +0000
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
X-Inumbo-ID: 07b76f1f-5d12-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=queAXpxFvEJvWHH2TYufzcn7w14nTe1pJDfXIHMkqV0=;
 b=eoKT/QDXKozJLqPjXm9lh7HI+w0Rwk5R2JGJ6LBuZd6fJ10AB2gLNfSRIMj2POypqiSuopb1nZiaJs2dqxoAQV0GMrqQpUwpzBtoOPB0NDCAGC+SHEA/ngqWAbtqBDZ7emy2fzPjWOvos2W182hIrsoOKCkne8xdvCPlz4UoAeU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3960adfbac5ac29e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZ8LO/5mTDGfkKfIbLmfmbm23a6PgEO5qiXnD+D5d9CZJ11zCR+jVuL1p7hWgQ+6fNB6hbgpjaNdIYpFZw1Bm7tKPAoMMPUhVLngJrYpr5C6H3D0VR5ICxsTJZzY7cBVOSQqUVYTW6RdssawapcoqKFF95x3kLORjial67MCbba/aQVUGXLiovFCr2zSHSGIgThkw8F2M33UkaMmaev2HpK8hpUUEyF4bXJUr3EbizcyLi3SfR2gSokftpCnQnB8BV0f8Q1FOIuHNq7E1TN7rXcBpkag7nK22n6HdMqhhSFXy+HWEwzIcQuANE427FOdwO/eXqRfwOoG1D9+GyOMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=queAXpxFvEJvWHH2TYufzcn7w14nTe1pJDfXIHMkqV0=;
 b=OXBaVxgnAzVY+jj06bHM0Tp2e8/vyMjy0DOs77WEItkD/pSL6QYIAdAc8sj2BSV32i+MXwNXd+IHfmgHQfL0liHHBGt/EOubMNIKek2/iXDV6foEg2z0S+89QRj7z3N9fXY6Ef5+SKCmcFHDKEr7fgS0Iofoix+u1/OkDn2Ym9zvjFvssh7y2p6FX4TBkQbnLmuHEfKoiG4oHF33SDa6pV3HsCC+xNRI95xVnMauN1WqJjUxeIcWNdz4yCKOdkZcxlBCmlwXvzSqTFvpeQC3rJoLmqNov1g5EcOFOyrB1BxmsG9TwGD2wijDgzl/qWQbEtdmX0ICesGtNB3Aj0wI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=queAXpxFvEJvWHH2TYufzcn7w14nTe1pJDfXIHMkqV0=;
 b=eoKT/QDXKozJLqPjXm9lh7HI+w0Rwk5R2JGJ6LBuZd6fJ10AB2gLNfSRIMj2POypqiSuopb1nZiaJs2dqxoAQV0GMrqQpUwpzBtoOPB0NDCAGC+SHEA/ngqWAbtqBDZ7emy2fzPjWOvos2W182hIrsoOKCkne8xdvCPlz4UoAeU=
From: Henry Wang <Henry.Wang@arm.com>
To: Federico Serafini <federico.serafini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru
 Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [XEN PATCH] x86/mem_access: address violations of MISRA C:2012
 Rule 8.3
Thread-Topic: [XEN PATCH] x86/mem_access: address violations of MISRA C:2012
 Rule 8.3
Thread-Index: AQHZ8R5ur38dz3PpMkONgvDlWV1gY7AuWziA
Date: Wed, 27 Sep 2023 08:43:58 +0000
Message-ID: <CEAFB237-C948-493D-A796-75BC04AA6D70@arm.com>
References:
 <98bfdda2d3aa12c68a4be86535a6f39e6167a8e5.1695803386.git.federico.serafini@bugseng.com>
In-Reply-To:
 <98bfdda2d3aa12c68a4be86535a6f39e6167a8e5.1695803386.git.federico.serafini@bugseng.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB10349:EE_|DBAEUR03FT009:EE_|DB3PR08MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: 07181798-f464-42ed-4bf6-08dbbf35ea28
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 238zDqPfuu7dmY/UdtQ8ZS9iqm+CCN4POY9bBdbBZCSkDyFn+LHKNAg2yIUo6EiXXCfG+QbXzGSbbgMllcgfNIv2yaxSNYksYsc4onBOiZfnRpMmP9HvtVz5vIHe5kSclW1JnI2EWxb9Fv8DPPmyIsCVu/gXGbgZzKq+jRBJQkg5Kqv5UhpntMVHMqWNRkZZ5A7x0cWzDply1gpa6UtVGcBo2GtehBAf774DvC90Nj5+cYvZckaQ7n2bULaIKz15DTKFMpp6ZCWOST/7KrSF0WNAnTzWL3lHQZRFSct51tvDzP2m2BqcpCNGC7xfVvHvKVr6/dO/gfO0qnn22meFxodKRLkYh1YN2LE6fJ1rmaKmltjUdtvNzdzc/Vzzm30dx9YU3ts3Uh6v9CynI49QggfE0C6DIZLAhYJcVX7ZN4ktvWPz9KoPEopfJQW3upVTAq3ZEsSef1Y5j2T3OPeg1/bRNFhm+knQurknOJCF11r7yPqo2udJRCzCRzmKKwBk/3DRAtROMjkD0wV++r3aiw/muTdHShx5Uf2XfUOf8jF+DygYM2qGnUdO4IrX4b6WGf7P5j/tiVPolKGvLF2spSPRTg4n6RT+mlXOqBjwBm3R8jqcrsASO0DzW4QJZpdWGkmvJbPGjqZiwMHbRB2Yhw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(186009)(53546011)(478600001)(6486002)(6506007)(71200400001)(38070700005)(38100700002)(122000001)(2616005)(7416002)(41300700001)(2906002)(26005)(6512007)(36756003)(86362001)(33656002)(558084003)(66476007)(6916009)(66556008)(316002)(5660300002)(91956017)(66946007)(76116006)(54906003)(64756008)(66446008)(8936002)(4326008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AE8D27A1DFAF4C4CBEEBA3CE47E968EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10349
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd326f7e-ab2d-4aa3-2454-08dbbf35e3e6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OOje7uhwOu6eBGr0VJHo7XHwXpySQGNEvIi5GsDmJROrgCiWnEHukATVDumGjr+k1/oor3qImgQALJubnEP9DVggtncW18H4j5qx/YlpcHYec8/M0C1tlwnuzMwMkrJMeezsAaIh5gDrKdZaGcW1IFwPwgxGt+x05dtBdNcpfw3Pj5FksCnUZ1u+uzEZ0mwIOKB9wPRf/JcwCDjs05+IKaLZ3BGO6Hdg0SVwsXVClSTU8pf/RsGQXj1oQPlLEClsJwGPJSa1GfE9pYMfOqApwE+V21mBqRrYUuksfdBB2ox1C+lGPMJUh4rx1wf8Onrm37adT4iO52llAMQRMAlcY5DzLmroJ2I9DbFwj6J3Dcyd2aH5RqHdBn1U4tpLq8n7WYL/aioyrVV1WLFxT2QlthoKigJjyVsKf5lxqNVEzrGxKs/nFRCw9d5lECb3ZGy2YmG9xwNTpNsgL9umJgZJMDvM00A9rMqy0fzaHVgC+UVbSDBIBOHUak0mP3Y01cUm+a2KdinRDqckxOvPfcIJlQZISE+WrGwbJ4w5c9DB3sv+/JaNZ2a+NjEUW5HVFDLdpSluYrDGklR4shSlCHpG62LTRi9inLRHweOzblr4VofBQUtQZxOHd+3eF0w1eCM+IUDcf7R3f9+xiBd9ZzidyRTeJ4eMGijm4psq785s0mUzI2Ae9HvVzbsInU7eerA4hnhp/kIyk2AXUCIwBHfcoHF9GRILP57Q7fg0JO+Yxvc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39850400004)(396003)(136003)(346002)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(54906003)(82740400003)(6512007)(40460700003)(336012)(5660300002)(2906002)(41300700001)(4744005)(316002)(40480700001)(36756003)(4326008)(8676002)(8936002)(6862004)(86362001)(33656002)(6486002)(478600001)(47076005)(26005)(36860700001)(6506007)(53546011)(2616005)(70206006)(81166007)(70586007)(356005)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:44:08.5426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07181798-f464-42ed-4bf6-08dbbf35ea28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8987

Hi Federico,

> On Sep 27, 2023, at 16:41, Federico Serafini <federico.serafini@bugseng.c=
om> wrote:
>=20
> Make function declarations and definitions consistent.
> No functional change.
>=20
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

This looks like a harmless change so with proper review:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


