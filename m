Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF612FA4CD
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:33:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69762.125021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WWw-0003Oh-6Z; Mon, 18 Jan 2021 15:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69762.125021; Mon, 18 Jan 2021 15:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WWw-0003OB-0J; Mon, 18 Jan 2021 15:33:22 +0000
Received: by outflank-mailman (input) for mailman id 69762;
 Mon, 18 Jan 2021 15:33:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECrn=GV=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l1WWu-0003Nu-JI
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:33:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca537196-6537-4891-9029-eb2c99daa1db;
 Mon, 18 Jan 2021 15:33:18 +0000 (UTC)
Received: from DB6PR0802CA0048.eurprd08.prod.outlook.com (2603:10a6:4:a3::34)
 by DB6PR08MB2870.eurprd08.prod.outlook.com (2603:10a6:6:20::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Mon, 18 Jan
 2021 15:33:16 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::80) by DB6PR0802CA0048.outlook.office365.com
 (2603:10a6:4:a3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Mon, 18 Jan 2021 15:33:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Mon, 18 Jan 2021 15:33:16 +0000
Received: ("Tessian outbound 8418c949a3fa:v71");
 Mon, 18 Jan 2021 15:33:16 +0000
Received: from 34c1e9e3be88.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A6E80A1-8404-451F-B03A-9734646F7F90.1; 
 Mon, 18 Jan 2021 15:33:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34c1e9e3be88.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jan 2021 15:33:03 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB4027.eurprd08.prod.outlook.com (2603:10a6:10:a7::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Mon, 18 Jan
 2021 15:33:01 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 15:33:01 +0000
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
X-Inumbo-ID: ca537196-6537-4891-9029-eb2c99daa1db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SFjX0RwUsGzeW8ICnnntUnMxpex91KNhueK7gliXHg=;
 b=ZvPHKoB+Fe1dcojTOOZJ3sCx1yTGtWGE57ezZeBFGw45qnKyX7pRzVZ9vatNBUfz77lV7RnmG9FRH+rWImRCIVTc1JmaRwPFwcTfrEr+CnkBOB+TDDN7AH+Ui17+mLYt0GhcZp3Q+64X4qBq1aa7INtUrhkgAraQjblmTPIsSI8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c84b2582ecb13826
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDOSGTtSTn0hkTT2C0JFBPdOuyA6psFfigtFWXYNyan7KZ48vmiEehtDOoJIluCZeaJNBrjzLliQikDBvPFFLLyqGXWOFwBXIKUy+TqBUyh73FUyckbk01vS5okpVe+oLeHsOOQZJLdZ3lDeCfMWGuvmqS/3yb/tVxjWGNTMPyvFPuGXJ15lkkuTqEgjglgkOev+qZ40yJt0uklkY52bVmP6TDw0UtKSIWlciOw8cqOYdU/A1zrDYZR8rxLUt3ROuneo/J7TXGTKiHJ8GJj+aYmC7eXHPikoD3nHh9UvqiqEChjzOloyiX0pLmgUvN689CvQi7ftefdh1d8rg1G0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SFjX0RwUsGzeW8ICnnntUnMxpex91KNhueK7gliXHg=;
 b=eZf/5sIg4NnJe4nnngtLzCk6/8Y3VCUaNx5FbKxariAaHa0YbPwydl7A18khtdibXUmpW8+kfs4rGQL2Y6kEyWcSRuu0CaBL2p+pbaSUeu7aN4Mq0dZntZwCk5GSkXFE8c/20fPR1CsXBWqQZfZ+tAGe0awxk9AL732O3+mifYyXrnhECMIjl8jS7OmnmtDj8vGq4fq76/HeemMzmbIt/b9QdlT5aXhpHONSeTkO9ZdM9EOO8Es6nbNDFjHyobnsDmd8z/6J2Zq9VfrHdts4lg1BhFAw9knvNNgOnu/CVQefIa/CPZhOl8/YuKzuzwqpUp16W3AxeoaTwpCOVSVayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SFjX0RwUsGzeW8ICnnntUnMxpex91KNhueK7gliXHg=;
 b=ZvPHKoB+Fe1dcojTOOZJ3sCx1yTGtWGE57ezZeBFGw45qnKyX7pRzVZ9vatNBUfz77lV7RnmG9FRH+rWImRCIVTc1JmaRwPFwcTfrEr+CnkBOB+TDDN7AH+Ui17+mLYt0GhcZp3Q+64X4qBq1aa7INtUrhkgAraQjblmTPIsSI8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 09/11] xen/arm: smmuv3: Use fallthrough pseudo-keyword
Thread-Topic: [PATCH v4 09/11] xen/arm: smmuv3: Use fallthrough pseudo-keyword
Thread-Index: AQHW5c3lM8m+gSvX8UGq06ErkkqKrKoopZQAgATtOYA=
Date: Mon, 18 Jan 2021 15:33:01 +0000
Message-ID: <52BC783B-F082-462A-8B2B-58EFFC27113A@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <36f9a1e88eea2f2c4cc413688c7210583a3433fe.1610115608.git.rahul.singh@arm.com>
 <362be46d-863b-f6e4-a40d-932c2db5a41f@xen.org>
In-Reply-To: <362be46d-863b-f6e4-a40d-932c2db5a41f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5f9aa17b-06a7-4638-0bae-08d8bbc66047
x-ms-traffictypediagnostic: DB8PR08MB4027:|DB6PR08MB2870:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB287011E8492D82C30B7DB8BBFCA40@DB6PR08MB2870.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1122;OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hiSTqMEG0y9T7nNj9YIt2xc/952E6AtZAIzQTSumzf3zG8V8A/a14Smq749cw3kzI0bUmz0/NgtOTx6QS9DAlGSh61iOSpDoz+gSI6CQ+l9UiIu9INElv4/vfgPDpnqcne3TfXi1XnLET4q2mD6mi2Bw+kxYULsbjarrav+u7277EMWbgscLN9FYGmD4VQ+gHr/fWF/CSVDaFdYvycgU+0KROb3fGIcv8LopSHyJPZ2d3BdfTAXRThJHzpPuy4DZsbtxQ2wMbXX0vOb9IK326mM7VdRPI4JilAm4XWa71/fEF9+nFOJ2u61erfUegiwxY+A/i23ytxqxpWXf7q+uqmxCOKaJO1QZmxY/XTMCncrb4MFI+NgEnpXsqUu9D9Tfxv2XOrleQ3gp4sEwZmpdtaUxjfPpfwdVk4zJK7fzJBfprN1tt6xKbaF7Vu3AJk+qBeEoeheLuB9/NNJJRaLTJItrCdIui+sVTpmGqzlwFxbIJc6tYJxAZ5HO0PxIjOExpbXTVJZcZm9hwdORftjhOcaLBTVKAwQs/swJXnOPdBFlhg2JX9lCemEAUJGNodiNbKN4xP+4Yds0CRWeQ2fScb1I9RYiHINd94q6SihAQFt+JPI4q2oTUlwdPZHZQvDGZnhsNy5kHQEuhDOKwhsiy51LwCgtbOX1JZtEi0SckzQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(91956017)(53546011)(6506007)(5660300002)(66556008)(66446008)(64756008)(66476007)(76116006)(26005)(186003)(66946007)(86362001)(478600001)(6916009)(2616005)(8676002)(83380400001)(8936002)(966005)(4326008)(6486002)(2906002)(33656002)(316002)(71200400001)(6512007)(36756003)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?8bFFJ4BBqTCVDsHklFwTe3srRmcs5ska3uy9wLsUhPOF30UToZ+WSa5ZNa2p?=
 =?us-ascii?Q?yle5cP9ycRoOIPLU8OHK5OTI8/LyN1E1r3tP6o/NTXjzKXWuMsh+sk98Pdfk?=
 =?us-ascii?Q?2V+/BCc6YvDmYDPfyhy2VSqqrVDpzaZFlrAYCcR6TRcj0RirelR2r5tDujly?=
 =?us-ascii?Q?y2YOKyJWDIboypgYg9C8d4bOxjxLIcZi0Y4/896Ho6h3ocWawmnHJ4YpWNuN?=
 =?us-ascii?Q?yVOsGpnk8QkbeSyQ7189YXESKp8KCg5kSa9ghbkQyGLpUgNBIqvVybLX041M?=
 =?us-ascii?Q?jfnfglndHPLndFERGPIm9eLXeNQr2Rqs16yW2jds6gXZ3QqUr1BjR9fJxAWu?=
 =?us-ascii?Q?BlAd+TwVg7cjzpOZ5bplJzB54Y+C6XQehHhqFVOVr6iFDNVN9ThITVe6YXbm?=
 =?us-ascii?Q?+aImWGMU4l+5odYJj4dpW30bVZEXxyMYjNabwW7RaQqS0pikUWMOpjJUDGlp?=
 =?us-ascii?Q?snDt9CTa4PZ+iTVnkEjCphTavUmvyLtyfEgwEs2U20UUI0VH1INJGKv62IzS?=
 =?us-ascii?Q?BciVblk56DXLON8f4x41pJf02+VscJA8sDHOR1KMtry7FZYmFh6wQbNLZdRo?=
 =?us-ascii?Q?zgW99if+mXxJ5aE8DF0pt8exbFqhkCiLCgn8hxShwJapZ2cP8RGHWHDUi5yu?=
 =?us-ascii?Q?/5ZK3WVh7pi6lStpl04Woz9swlfEXBGUdrhMOPTRGF+Bh3i9R+U2V4wxvSeD?=
 =?us-ascii?Q?3i1y/ugkQrXQpKfM3RpydtvbtaFcFQ4gQJ3k65ddE+7sj+50YzCDvu+Ae6YU?=
 =?us-ascii?Q?QXYs1jK++SnH7dAdOn8CU3kk/1tKxNHKQ8PlTt6yyIGDtqEpGkzngqlSzMKm?=
 =?us-ascii?Q?5b+YJ3JSlm9vJDfduOiB+efZMDzwglaFzerC4/zopnm96p0lDrHQPJnk+s4l?=
 =?us-ascii?Q?PjzJhEk+M8GzFOb442P0Fbm27kJqFLDKNB+dhcGqcwuzSkhtOoVLYOqeXAsh?=
 =?us-ascii?Q?UXXcpb96Re1mJLmRxLrJoSMpsl76A2svFMlYjXBsC5gjJUDoRgGw3pCLkLY7?=
 =?us-ascii?Q?M/DsbsNTlKOTWflee8vxuH/+zNpOqURR8VFqWt5KtcCM3JwXxUs6Eml6m5/p?=
 =?us-ascii?Q?ZPaDocg3?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9EBD8018DCA72F4DBADC66F0EE03F9E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4027
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	110f1ba6-d4ee-4df3-7f5f-08d8bbc6576f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LiNk1R6YccR5GtBvHgQ8+BbWL1rNBH7YOcH8D8Jc8ZgURGXFPunMxJ24T4RyLlkUdttUbE1arfbyyfc9BjVN7QhxZ5jIey2KqcjfsNJsU0iaSK9N2DZmehbjKgLuh2Nlo8AhHqLzfWJI7LoNe7sZsj4N6EU6E/puXj23dYy+tn4i7abTjEezYn12BWmSv+ZUMl/z25IUHf9SJ6a0jLQ4vjr677qPQuI55LxDp4OURI8Y4/Fu/PkiZN7X68f6cBmljHugHogKzYZ//qTfr9ymwULBnUI1JXJMUfqS28vTirJ/4+BRU+eSKhMRTgN8Q48kwPos6IkQKG2OWau/aZM5m7dsZBX+HHR3sx+tMdJ5+o6vusVojrYvrj1WMNqpf4Roxqzu4ewi+L2Jo6EQv0VQp9gjaLzM37/mRX2ne5QM1Fdsk/LHBsrNWbygzZI/o9EyTr3ZA0k1qNValwrE13GRm4azOHciEJ/j/KFeVjIhf+ZJX98XfJSjs41n/nurq1XzrePPrUiWnigWXPeIWGKbfPszTClzcmMzrK+ubgBJrD8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(107886003)(4326008)(8676002)(8936002)(966005)(6512007)(2906002)(478600001)(26005)(83380400001)(336012)(81166007)(356005)(36756003)(86362001)(6486002)(6862004)(82310400003)(47076005)(6506007)(316002)(5660300002)(2616005)(70586007)(186003)(70206006)(33656002)(53546011)(54906003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 15:33:16.5982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9aa17b-06a7-4638-0bae-08d8bbc66047
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2870

Hello Julien,

> On 15 Jan 2021, at 12:18 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 08/01/2021 14:46, Rahul Singh wrote:
>> Merge the patch from linux to use fallthrough pseudo-keyword.
>=20
> Please add more information about the patch you are backporting. Is it a =
clean backport?

Ok . I will add more information about the patch. Yes I think we can say it=
 is clean backport.

Patch merged is :
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/dri=
vers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c?h=3Dv5.9.10&id=3Ddf561f6688fef775b=
aa341a0f5d960becd248b11

Regards,
Rahul

>=20
>> Replace the existing /* fall through */ comments and its variants with
>> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
>> fall-through markings when it is the case.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in V4:
>>  - This patch is introduce in this verison.
>> ---
>>  xen/drivers/passthrough/arm/smmu-v3.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index 5ce14850b4..f5f8b4c981 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -932,7 +932,6 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_d=
evice *smmu)
>>  		 */
>>  		return;
>>  	case CMDQ_ERR_CERROR_ILL_IDX:
>> -		/* Fallthrough */
>>  	default:
>>  		break;
>>  	}
>> @@ -2488,7 +2487,7 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
>>  	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
>>  	case IDR0_STALL_MODEL_FORCE:
>>  		smmu->features |=3D ARM_SMMU_FEAT_STALL_FORCE;
>> -		/* Fallthrough */
>> +		fallthrough;
>>  	case IDR0_STALL_MODEL_STALL:
>>  		smmu->features |=3D ARM_SMMU_FEAT_STALLS;
>>  	}
>> @@ -2505,7 +2504,7 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
>>  	switch (FIELD_GET(IDR0_TTF, reg)) {
>>  	case IDR0_TTF_AARCH32_64:
>>  		smmu->ias =3D 40;
>> -		/* Fallthrough */
>> +		fallthrough;
>>  	case IDR0_TTF_AARCH64:
>>  		break;
>>  	default:
>> @@ -2589,7 +2588,7 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
>>  	default:
>>  		dev_info(smmu->dev,
>>  			"unknown output address size. Truncating to 48-bit\n");
>> -		/* Fallthrough */
>> +		fallthrough;
>>  	case IDR5_OAS_48_BIT:
>>  		smmu->oas =3D 48;
>>  	}
>=20
> --=20
> Julien Grall


