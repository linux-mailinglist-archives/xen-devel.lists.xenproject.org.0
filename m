Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9E933F315
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 15:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98726.187431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXKa-0004U0-Jf; Wed, 17 Mar 2021 14:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98726.187431; Wed, 17 Mar 2021 14:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXKa-0004Tb-GD; Wed, 17 Mar 2021 14:39:28 +0000
Received: by outflank-mailman (input) for mailman id 98726;
 Wed, 17 Mar 2021 14:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MyhP=IP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lMXKZ-0004TW-Fd
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 14:39:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2bea3a6-d2be-4dc6-8a14-2d739f3df3ec;
 Wed, 17 Mar 2021 14:39:24 +0000 (UTC)
Received: from MR2P264CA0149.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::12) by
 PA4PR08MB6093.eurprd08.prod.outlook.com (2603:10a6:102:e8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Wed, 17 Mar 2021 14:39:00 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::d8) by MR2P264CA0149.outlook.office365.com
 (2603:10a6:501:1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Wed, 17 Mar 2021 14:39:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Wed, 17 Mar 2021 14:38:59 +0000
Received: ("Tessian outbound 10f3eddefbbf:v87");
 Wed, 17 Mar 2021 14:38:59 +0000
Received: from 38254fbcce4a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 86E0B9E1-0139-488D-89A3-F138C91A65A2.1; 
 Wed, 17 Mar 2021 14:38:51 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 38254fbcce4a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Mar 2021 14:38:51 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3021.eurprd08.prod.outlook.com (2603:10a6:803:47::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:38:49 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:38:49 +0000
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
X-Inumbo-ID: b2bea3a6-d2be-4dc6-8a14-2d739f3df3ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OIHF80mRt7tjGXqM/ku41ULBLVuIoHdxRWkfRd2rzw=;
 b=abOM1r9LEzdHLWkIuIlouP8eA/wOuXpNL8ebmcn4Jy/XEnHNhuuJ5Z4q2sFTMqFiGKK/STDy5ZIbmM5vopvMspUPElKb9Ke85s8c0H8OKnj0BDpkhpNTDHxezIeyA0vDXd/H9IZjIMevTXrQ3hgux62edeZs9mCuvZbBRfqhNsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3a82717172f382e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDUsYNyQfOCMS9PQVGzdCCHizpngc4n2YHO+H3GcrhDqrStGiPPM3SUnZJjIWXipjwYY8vnP2o0zzB9lk8hNbUud92/sl7FK9/49exbwRuJcxTShmlXO9vnb8FuqQjDeyQhzbwUEeR0RSKkyswkUCBUqqo3n3Bn+5pIM159X9nwgibzf4oZLnRo5Oiqt0uB1JHJ7zjgZ1o2mYn0Y/GhgNImJh5TjZfBZcL7NTOPnH0xIxmArS1rUGWcaw5UmOwERH+zmmiY/Tr/uB0stUPWiTwjbgWedCojZC41/tNfMVdkug1+ZR9irPU9xbMvSU4pWjg+shE9lC1FHixqOhCTYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OIHF80mRt7tjGXqM/ku41ULBLVuIoHdxRWkfRd2rzw=;
 b=OWGivg61zUUN+HD6lltObXhC41MhB5tzkUud+UFvwrscyfeDs7V1YX9zadubfNTqTeC7KZorFbmYX9Po0a6UUir2cTsXiVRoxcz4iFJBLJLLtGNCmQox1iAuya2t+ZrGBACoc5R4FPudn/fbjIW2+H7/hZBEFdaCfOk1n5c4vhSSsqXrXpi7HT6JFOJhbOSV5FAuyYEJsuXX66lr3kRmIo0Sk8WNU53pvcxgCw53o8lQaUnCLegtn7mzVlulYtVI5bg9SJW/f5UKfESMsgOi0vp8UqI0i/w40ov5SFebP8UVBDMVkbXvDgveLNn0kPtMDokq569HnWp99PAW/JKJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OIHF80mRt7tjGXqM/ku41ULBLVuIoHdxRWkfRd2rzw=;
 b=abOM1r9LEzdHLWkIuIlouP8eA/wOuXpNL8ebmcn4Jy/XEnHNhuuJ5Z4q2sFTMqFiGKK/STDy5ZIbmM5vopvMspUPElKb9Ke85s8c0H8OKnj0BDpkhpNTDHxezIeyA0vDXd/H9IZjIMevTXrQ3hgux62edeZs9mCuvZbBRfqhNsg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-next v2 1/2] xen/arm: Include asm/asm-offsets.h and
 asm/macros.h on every assembly files
Thread-Topic: [PATCH for-next v2 1/2] xen/arm: Include asm/asm-offsets.h and
 asm/macros.h on every assembly files
Thread-Index: AQHXGCLU4+TkVELU2EmVwv7bZbEE7KqIRjUA
Date: Wed, 17 Mar 2021 14:38:49 +0000
Message-ID: <2B11BB5C-EF9B-4CE0-8477-D94091DA0870@arm.com>
References: <20210313160611.18665-1-julien@xen.org>
 <20210313160611.18665-2-julien@xen.org>
In-Reply-To: <20210313160611.18665-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19e7f20b-3796-4352-8e57-08d8e952670b
x-ms-traffictypediagnostic: VI1PR08MB3021:|PA4PR08MB6093:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6093CFA9A3C56177BFD5EE899D6A9@PA4PR08MB6093.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uvTu5Icqoaa4OkrhORZ6J8GCHEneg4gJAfL9FRbntNfbz5f9FAgSJs5mK8T0oQFObWTi/o58cOTVmheMO88sGr6K9BdYV0ZSd/CUxNoQOxMcJLSxbqVlm/dObYWfAD83axqwCEYSQMn769aBwVCrc4EUvLbsmHwtCwa9rMwRnsF+OnLzdMhx4Q20QvHp5+Mu/DLw0ma4qLraFcU8m7jwdKJCkRVHVu2vTyKpertAUBQlwekC7C42oBrtl+lTNowOKbLGzyPkjEZ12w/p6r4TFqMQfTXsMQ8wN/06/0+w1ftZlcrF7neyjZnLxvm1FcrE+3Lya0SSJMUWBxqoQlR20FuHiCeb4mMQKMQX9mvpzp/NoiQ71v3sowqEZrFNbF/WE6jMSjbPiA3ceHwTnaAGw6K+uwB4oduLpKtBzIM60qoN8hQBfw2dDpfLooFRES9tsymB3H4eHYiLYj4vFM94i6PBpjSGNKLk58HK2e9q5RrtKgsh3+NlczvRtFUn1ZDIIeVqb0fewbwExGbDChzqkR9cE0Acuf2MQRPKh6v+OUnYN+1CKzxk2Jy7GXladDGb3nL3TeycEggbPdhmx0iHABS0MFAEKbpG0uVPiRlc3KiywGwzrsGZntQsg/DNLddn
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(478600001)(54906003)(76116006)(2906002)(5660300002)(6512007)(64756008)(33656002)(55236004)(316002)(2616005)(26005)(53546011)(6506007)(6486002)(71200400001)(66946007)(66476007)(36756003)(8936002)(66556008)(86362001)(8676002)(4326008)(186003)(83380400001)(91956017)(66446008)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?CAerU8tvcW57jP61IjV4UGSRpCIVSEPN94c4mUE2k9C4hOyY2SZjpFzKvU7D?=
 =?us-ascii?Q?owZZ0sXIToPHHP6gZmyUImcidas8kcm+NlbPkKSXOtnfknsxuRU3zjH6OGVi?=
 =?us-ascii?Q?EQr0woCiU8e2P7Gjhv1I0+RF9l+FckG3Zhq4ZsICc2iy1nP5l6cT+M6rTLdU?=
 =?us-ascii?Q?1fX66tjHdj8mSsMZC/crcnJXor1/nzib5LxYJHa50nGfvyBkC9lTjHNj/rH9?=
 =?us-ascii?Q?5pZVcozkerJHuU7A7+4UefUk08ldLLeWabxQyMY1BTQ5Y5I/vFeNz62kGDf5?=
 =?us-ascii?Q?oyl0keXvW7wcc0q8ADBTrJDVoqtohOC3r0zcXjQsbPjLvYx2grDPK3c55hVF?=
 =?us-ascii?Q?pV5vwtMGmgY1FdCoucujBRF9Hi4sdSxBd8tAOB+e64TgoK5+vlnk7DFtvmUr?=
 =?us-ascii?Q?YHrzZiy7SnTmJh58Q+EmEuJpZhl1q0/ETNb1VS9GBJ9cX89lJHKyLAE0IRWQ?=
 =?us-ascii?Q?xTbCFJ18Vbw9UALbpRmylCuZWh+vo+IJN8OMVCJnzqzXli6uIIUXJvIg/CuW?=
 =?us-ascii?Q?SvYDrRP53NcBK7wmzMHt2m1AaWpO5AKam9gePtIwmZZ3RNM+dVJM8wOoSikE?=
 =?us-ascii?Q?KZNUJ/e4qT80pgJNePjXrzzrWMUcM7fRXQ7jlRo3jh3HCOtlONqErf+M4z95?=
 =?us-ascii?Q?Y2Mv6hIq/eF90Wm8GE+/EuB81ug+OJbt6mzgU4bjj8IiyW7rGYF6CuZ+rbV+?=
 =?us-ascii?Q?Q1QY8AYDIIMDWBCrzWQQbBBTOC5glU4T6lglG+MMoLSG8ZAbBb0M2EbFK9Wc?=
 =?us-ascii?Q?00sZVbEgBAizgnxvYMEY5+KZcwO4/nNowphu0nufszef3TBndju3u1+vXEEA?=
 =?us-ascii?Q?+XufsV7lfeiPETz4N3LYvn1moFEkf3zLY8lNcdZvCzJIxy2Q/yBaQOjdqfVA?=
 =?us-ascii?Q?U+aRM/amn7iI+N2u/siF+OOHq3KOkTGyO+gwdXMfSmVfnRoldYTlYuTkRrCI?=
 =?us-ascii?Q?n/g0pZNb25sVRP4zBJlfl/eqfdGxRujpi3V7bt/kCqwl/oMS1itN2nb/j/Gq?=
 =?us-ascii?Q?2eGuD8AaGU1ART7YqLjDVck3IYeWJ6JzgX+2oTDBkHPBt7tkQ8NU+ABRNti+?=
 =?us-ascii?Q?VkcoDz5DQomEaL2FwZPXXKBg3Y51L1HB8suz7+tmgAmHiV96BhiFphHUSKd7?=
 =?us-ascii?Q?hvFBQW7xTMCh4EPKP89eYQ9xsSpF/b3f/HM0PMDtJBhOs+kjJbohwlMbsoVO?=
 =?us-ascii?Q?deBOtkmZmtr67v8+I0v/TuwWUyHxTiiFZIqDgY5nSjy8rIV/3l4ZGqM00ama?=
 =?us-ascii?Q?+aM6g2pjTNzScmaftfMXLY57OpEJzixI/Kbrsuupc+EelwuJzFl5dZT1Ap7+?=
 =?us-ascii?Q?J5TA7/7ReZTFwoaCqstgwsAH?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CC6C57A8A6F80B4E8B3E1F497EEF52C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3021
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c67bd563-23c0-4d1b-287b-08d8e95260e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1lZgr++LJ3yn5fvFtnS93wV3cp0xWA0F3mQ3wwmTC5o5bkEHHA/9tOVncHHW2AKwR5YRKFwCyucSCWyXtvluiqb1CKjlCt1Ifpz4RPNp5ES/ULeYE8Gd1b5WiR4zcdlO15yg49CjCO0j9KuqT2iGg+8Io8Vdd7CUPcOfuh0Dn6bpkhW9DF3JstO6BYaLvqZfzUe9eF7N6nbVkKVC9E4W362+lyAWUhT7+ucNKRL6nt0PuQMTTZOiQiBfxHxp9c8eURo0LxlJEO/0x8XbUZa6A/XKYM+NkIVBciuytH96z3752irqRYqDZ6XLUMrN8zdM4YpOs5xnPEJANUtREHFPkLYdE4xCLJSKG7/Se6DgXyzbXeDjL4YccLVzAkQWHZUUvBIrnE5Loi9XQTJKYhOnuSf7gZYAOeYSxkkLdieDspvwVxM6IRnUFV/rHmKz5XPtMKyJNPtSxvecXyx6yAhKbtxzYDWyx3thhSQ2lnz1MwNoj9AETY5He8DkEUXgkB3Jdz6eFuAcFSETnQz387SAYTT4hn+bw42Mnnnxm0WksMFBi2Zp+PurZt8sR56a09Z4x8YGnhmlVcNReBnjBMDfU66hG3HeR0c1SMLqYlo4lKzzZ3O+VyCU1lQveV5VnNytRISXuOlNotL/6a69P7/w98F56DQ0TAneRDLFh0YMVSM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(8676002)(55236004)(2906002)(6512007)(478600001)(107886003)(316002)(5660300002)(70586007)(356005)(70206006)(2616005)(53546011)(81166007)(54906003)(4326008)(8936002)(6506007)(6486002)(82310400003)(26005)(82740400003)(33656002)(36860700001)(186003)(86362001)(47076005)(36756003)(83380400001)(6862004)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:38:59.6366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e7f20b-3796-4352-8e57-08d8e952670b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6093

Hi Julien,


> On 13 Mar 2021, at 16:06, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In a follow-up patch we may want to automatically replace some
> mnemonics (such as ret) with a different sequence.
>=20
> To ensure all the assembly files will include asm/macros.h it is best to
> automatically include it on single assembly. This can be done via
> config.h.
>=20
> It was necessary to include a few more headers as dependency:
>  - <asm/asm_defns.h> to define sizeof_*
>  - <xen/page-size.h> which is already a latent issue given STACK_ORDER
>  rely on PAGE_SIZE.
>=20
> Unfortunately the build system will use -D__ASSEMBLY__ when generating
> the linker script. A new option -D__LINKER__ is introduceed and used for
> the linker script to avoid including headers (such as asm/macros.h) that
> may not be compatible with the syntax.
>=20
> Lastly, take the opportunity to remove both asm/asm-offsets.h and
> asm/macros.h from the various assembly files as they are now
> automagically included.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Everything is now building :-)

I could not find a better then your define as filtering out or undefining _=
_ASSEMBLY__
is actually not working.

So with the fix from offset to defns:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/Makefile                | 2 +-
> xen/arch/arm/arm32/entry.S           | 1 -
> xen/arch/arm/arm32/head.S            | 1 -
> xen/arch/arm/arm32/proc-v7.S         | 1 -
> xen/arch/arm/arm64/debug-cadence.inc | 1 -
> xen/arch/arm/arm64/debug-pl011.inc   | 2 --
> xen/arch/arm/arm64/entry.S           | 2 --
> xen/arch/arm/arm64/head.S            | 2 --
> xen/arch/arm/arm64/smc.S             | 3 ---
> xen/include/asm-arm/config.h         | 6 ++++++
> 10 files changed, 7 insertions(+), 14 deletions(-)
>=20
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 16e6523e2cc6..9ffc3f771c51 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -135,7 +135,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
> 	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
>=20
> xen.lds: xen.lds.S
> -	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
> +	$(CPP) -P $(a_flags) -D__LINKER__ -MQ $@ -o $@ $<
>=20
> dtb.o: $(CONFIG_DTB_FILE)
>=20
> diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
> index b228d44b190c..f2f1bc7a3158 100644
> --- a/xen/arch/arm/arm32/entry.S
> +++ b/xen/arch/arm/arm32/entry.S
> @@ -1,4 +1,3 @@
> -#include <asm/asm_defns.h>
> #include <asm/sysregs.h>
> #include <asm/regs.h>
> #include <asm/alternative.h>
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index c404fa973e9b..9084023a6ed9 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -18,7 +18,6 @@
>  */
>=20
> #include <asm/page.h>
> -#include <asm/asm_defns.h>
> #include <asm/early_printk.h>
>=20
> #define ZIMAGE_MAGIC_NUMBER 0x016f2818
> diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
> index 46bfc7a9074c..1efde2d72da0 100644
> --- a/xen/arch/arm/arm32/proc-v7.S
> +++ b/xen/arch/arm/arm32/proc-v7.S
> @@ -17,7 +17,6 @@
>  * GNU General Public License for more details.
>  */
>=20
> -#include <asm/asm_defns.h>
> #include <asm/arm32/processor.h>
> #include <asm/sysregs.h>
>=20
> diff --git a/xen/arch/arm/arm64/debug-cadence.inc b/xen/arch/arm/arm64/de=
bug-cadence.inc
> index 7df0abe4756f..0b6f2e094e18 100644
> --- a/xen/arch/arm/arm64/debug-cadence.inc
> +++ b/xen/arch/arm/arm64/debug-cadence.inc
> @@ -17,7 +17,6 @@
>  * GNU General Public License for more details.
>  */
>=20
> -#include <asm/asm_defns.h>
> #include <asm/cadence-uart.h>
>=20
> /*
> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debu=
g-pl011.inc
> index 385deff49b1b..1928a2e3ffbb 100644
> --- a/xen/arch/arm/arm64/debug-pl011.inc
> +++ b/xen/arch/arm/arm64/debug-pl011.inc
> @@ -16,8 +16,6 @@
>  * GNU General Public License for more details.
>  */
>=20
> -#include <asm/asm_defns.h>
> -
> /*
>  * PL011 UART initialization
>  * xb: register which containts the UART base address
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index 175ea2981e72..ab9a65fc1475 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -1,6 +1,4 @@
> -#include <asm/asm_defns.h>
> #include <asm/current.h>
> -#include <asm/macros.h>
> #include <asm/regs.h>
> #include <asm/alternative.h>
> #include <asm/smccc.h>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 5d44667bd89d..fa7a3ffd2926 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -21,11 +21,9 @@
>  */
>=20
> #include <asm/page.h>
> -#include <asm/asm_defns.h>
> #include <asm/early_printk.h>
> #include <efi/efierr.h>
> #include <asm/arm64/efibind.h>
> -#include <asm/arm64/macros.h>
>=20
> #define PT_PT     0xf7f /* nG=3D1 AF=3D1 SH=3D11 AP=3D01 NS=3D1 ATTR=3D11=
1 T=3D1 P=3D1 */
> #define PT_MEM    0xf7d /* nG=3D1 AF=3D1 SH=3D11 AP=3D01 NS=3D1 ATTR=3D11=
1 T=3D0 P=3D1 */
> diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
> index b0752be57e8f..91bae62dd4d2 100644
> --- a/xen/arch/arm/arm64/smc.S
> +++ b/xen/arch/arm/arm64/smc.S
> @@ -13,9 +13,6 @@
>  * GNU General Public License for more details.
>  */
>=20
> -#include <asm/asm_defns.h>
> -#include <asm/macros.h>
> -
> /*
>  * void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
>  *                          register_t a3, register_t a4, register_t a5,
> diff --git a/xen/include/asm-arm/config.h b/xen/include/asm-arm/config.h
> index 5c10c755db46..51273b9db1fc 100644
> --- a/xen/include/asm-arm/config.h
> +++ b/xen/include/asm-arm/config.h
> @@ -69,6 +69,7 @@
> #endif
>=20
> #include <xen/const.h>
> +#include <xen/page-size.h>
>=20
> /*
>  * Common ARM32 and ARM64 layout:
> @@ -190,6 +191,11 @@ extern unsigned long frametable_virt_end;
> #define watchdog_disable() ((void)0)
> #define watchdog_enable()  ((void)0)
>=20
> +#if defined(__ASSEMBLY__) && !defined(__LINKER__)
> +#include <asm/asm-offsets.h>
> +#include <asm/macros.h>
> +#endif
> +
> #endif /* __ARM_CONFIG_H__ */
> /*
>  * Local variables:
> --=20
> 2.17.1
>=20


