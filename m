Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5757E3AE4B8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 10:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145375.267479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFCC-00036R-U2; Mon, 21 Jun 2021 08:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145375.267479; Mon, 21 Jun 2021 08:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFCC-00033v-Ps; Mon, 21 Jun 2021 08:22:16 +0000
Received: by outflank-mailman (input) for mailman id 145375;
 Mon, 21 Jun 2021 08:22:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvFCB-00033p-76
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 08:22:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a9c8d83-ded7-4a7a-9d5d-b75933a1e724;
 Mon, 21 Jun 2021 08:22:13 +0000 (UTC)
Received: from AM5PR0202CA0016.eurprd02.prod.outlook.com
 (2603:10a6:203:69::26) by AM6PR08MB4755.eurprd08.prod.outlook.com
 (2603:10a6:20b:c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 08:22:10 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::30) by AM5PR0202CA0016.outlook.office365.com
 (2603:10a6:203:69::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Mon, 21 Jun 2021 08:22:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 08:22:09 +0000
Received: ("Tessian outbound 2df94acd389f:v96");
 Mon, 21 Jun 2021 08:22:09 +0000
Received: from e755bfcd6e3c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC949530-64DB-4CDB-91F6-2D7BC8DD633A.1; 
 Mon, 21 Jun 2021 08:21:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e755bfcd6e3c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 08:21:43 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6093.eurprd08.prod.outlook.com (2603:10a6:102:e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 21 Jun
 2021 08:21:40 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 08:21:40 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0190.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 08:21:40 +0000
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
X-Inumbo-ID: 8a9c8d83-ded7-4a7a-9d5d-b75933a1e724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGMKo0qGWfo7XVnZRFqH37QHdgjMpcPpJ1kdhXswjsg=;
 b=4OYBmSKHoPLOjVVw+BYJ18GMB4mgFRL/Yt/LX6JuscXKUvKSlpwpDzXTUkKd5Q+cdLSuuYDHwA7S4KyjqisFNS0RQGYdiGiRXXghf01TVWFfngm6+KEevFUOPeJGhChOe04gsTHE4itx6GWt/5W52KGKx4iRzPYIO4xRwTXuWdA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: db4a638ceab793e1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0zcAhQoTCxKuggFpx2QzK+9ZFnQLHbn9gpE+32U4YSFoGPbFWQGme8DR2UHHKHRLcOq66AZZFdQXFNC5ov5wzBkzK6+SOXpjfBp1RC2EyP0mr57Ky+aPnBJkGN+6qwDLVCjmlxyZCSrvGmDRbqzShFSGY743nQPpLC72ba3uUUY+DCqHWZM9ZFgbGLS1gOheJKOwl0A+zYu/V1KRSsDgFpigSctLC+ghzc9nV4AtUGEGMARE2KuGO08QJGGvK//cZxh624KB552QITm6DT44Nl9jzPha+ZuSYOp0zBtHFTjCQTCgNblPPS+REl4Cn+EIBfudglO7ScRv0h4fUfmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGMKo0qGWfo7XVnZRFqH37QHdgjMpcPpJ1kdhXswjsg=;
 b=H5e5RuS+0LEB1+u5CdoJoXh58cFVb7rz6jqv+uIfBOobTd8SZsI8E0v4edm3Tj2dZE5D7wo/BFP2BaKL/HfWR78uCU/D6CJzyCEczXcFIcLTOkDPPbrD+19MGK8KvS0c1cc7f/fGibin52TWZh3+GAKc21kabj5XVRXtHQmifIawVxhkmXobaiuFWCXHeCHTnRpBeFgZ/TrcvEeu8bN0RzykpnWceYsYG2Q8N0G35rmVcuM9Br9SLUMg0Eof5GVHsESeI1w8HpR/rDJl00dJG4HYpxc4LFStjZo8429xSaa8fZ2NDHelL14YYZRE5GvbgRJqxOPAhafUhb7vf8H52w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGMKo0qGWfo7XVnZRFqH37QHdgjMpcPpJ1kdhXswjsg=;
 b=4OYBmSKHoPLOjVVw+BYJ18GMB4mgFRL/Yt/LX6JuscXKUvKSlpwpDzXTUkKd5Q+cdLSuuYDHwA7S4KyjqisFNS0RQGYdiGiRXXghf01TVWFfngm6+KEevFUOPeJGhChOe04gsTHE4itx6GWt/5W52KGKx4iRzPYIO4xRwTXuWdA=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 02/10] tools/xenstored: Introduce lu_get_connection() and
 use it
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210616144324.31652-3-julien@xen.org>
Date: Mon, 21 Jun 2021 09:21:34 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BB8C183A-23BD-4C58-AE02-5F63B6E1B0AD@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-3-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0190.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::34) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27779e85-331b-4a78-04d0-08d9348daa13
X-MS-TrafficTypeDiagnostic: PA4PR08MB6093:|AM6PR08MB4755:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4755EE6CEA564BC2A4444F78E40A9@AM6PR08MB4755.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:480;OLM:480;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WXp/+HrmDgerUhfVHmAgy0sPy6QPzNOL4hcU1JBdLgzANCxHZc7DRpU70cQpid8i1GZBIwE9pm4ecExmEOxDHeJkjq1Wdv2avVC2vbG18Dfq5j6WS3AoyOhXM7P/CsC9dER9yvs9k2f2XyLHMryr2Pec7rGUHWLbHdAQi5xkoPJs/Lao9EzrASm7oqb0OILAxDNbq/uePVLblPKaNbxoHXOXT/XSKXVx7nQT0oH8kBdIzFBnQsiQXC88mpjkvAastlFv8aSV/mKU5eWWK9XstdntzMnUMKm6TMfxBO1hTv5S6tASzQFdAbqZfjPKL84Na1ZthXVLn0GV5gMgE6ewNYmTOO9m/NNIHknSOyxRsbELoRdwCFuabaDSjUbguUuivAV7oqOVXsZB/CE10HEQhmZRZJeUUK0eJbdIsGoLyUGzvAbDDq7tqzsYTZg4VceVFkymtoG9YpCLCU00hrQSgmEAK6mXzSW8QImp+42Zevb9SG3mAUDZepuROazMnTwBEU/5a+Tz9RR0jmlqhBFzChkpw/zJtsdp4hy/UUoihskMZ/XJ/g6kkLQpNMCKd+36aMLLlu3AgiiBp+VHJX83/fJGur2f3AvyIIZS+8lbqElFQrS5niUU3DFe3rxg3zZojPyq06I1wtCfN7xpf1wK89mzqWYjEmm/cauCWAmRPbeDDV54YMhIm70/YtyM9I2F
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(366004)(54906003)(44832011)(5660300002)(4326008)(6506007)(6512007)(2616005)(956004)(26005)(33656002)(8676002)(6486002)(66556008)(52116002)(66476007)(6916009)(478600001)(53546011)(36756003)(6666004)(16526019)(83380400001)(66946007)(186003)(38100700002)(86362001)(38350700002)(8936002)(2906002)(316002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?l3Mn5ILU7AHfF4suYkdKC7ZAKFu0It5iznbEJsEfMEqUmUKWtIphK3kHOo2w?=
 =?us-ascii?Q?Da/WjMIA40vzo534a7hwizpkvkpm9/TZnWMRREfC8lY6KxoOh00pcjxSqcvN?=
 =?us-ascii?Q?xUJVTy4sWgHxvXAdLaDjlJFbHGOoYKH1Np8sg+swQpjEkqnl0jH9GGLPKgDK?=
 =?us-ascii?Q?3KxKzan/Gur7ufai30vshfB9AfsMM4+pPubiFeU/R3xWZHbZFloJ8EpGc5Oq?=
 =?us-ascii?Q?1siF2dspaiVkaoTptbFIkOqFzwT1FmitcTC4aQT+YL+aZA3KKAgJmV/vG2Uh?=
 =?us-ascii?Q?ckJtV/0zZ/So++qgum/xbJDSAkJ9mFR7PIC5RjgGlvxiyGUADGWbb30ZURQo?=
 =?us-ascii?Q?Nay7jfY6lvdWT3YCwwI9WsxnV5ouZ0K3oLi+Vi9RyFRk/TPrIqa6V/UoaYPZ?=
 =?us-ascii?Q?qZip8UzXuf2pvWq7ZeCJqxvUhQiFfKfqrfEp2Fx5lexvQM9SmbIslPaQB61D?=
 =?us-ascii?Q?gTvJ8a5DLuMINSwO9uALzooQ3PsOYI/jR8PKOc1DWHGcj8+BGdtJjMqV/q42?=
 =?us-ascii?Q?757Rmr4wwjvAYdVrpsXoE52zAgCByH/pUDjOisl5FPEzcfeHkzzhURmXE4KA?=
 =?us-ascii?Q?Y05pU3swOTDSqB26EWzBXPqoohnJQ1VJ6Yr9INx2+rKTn0VFQAaJSfvG7Hna?=
 =?us-ascii?Q?LJ7LwD30A7joK6owbAfE6crIcQVMv7Go27f9hHw070HojOz4oj6NuwtOWb1U?=
 =?us-ascii?Q?b9IPYCPoCf9+LDV7K5IF4vnDGufB3NXL1hLTDkRgBt/DA//MqI2hn6nDhyMp?=
 =?us-ascii?Q?3iwWGBQz4lfuEEoxJB3np2DJxwzumkLaUT6oaFQaYeoSR5Okk+1chVzh3/ca?=
 =?us-ascii?Q?c2o3Z3GBMLAdgOvxRcyTKzl1Gaa852Ekkd9uGbQqQ9tUELNEM6TW3Ksg95iW?=
 =?us-ascii?Q?/F1ujsdenlXZEEVeYzvEk6lXNGWQZAI/N3kc2vf+6zU9c2gm9Gwxp2vp+15K?=
 =?us-ascii?Q?KxXDcHohnfvhXBU+PCdLUC2xHiDNxa/iRh8f6idH9Y0SgAKFY53HdaKv/c0T?=
 =?us-ascii?Q?hKR8+AIbXAumi/YmeqQsLb2kChntY7lnVQoEpVNkJpUojzeDcjD1pW5ooQQA?=
 =?us-ascii?Q?6kbmhyhu72kLBBpEheNgBWmUejJ6nZX0I+QDpXnCReR+AWSYbiOGpMtexbJg?=
 =?us-ascii?Q?Yavl9PN9lStPr0CI9mzfAFXRLR8/+Hgz9gpUnb7JgFijsFdhiFuKv9Zh106I?=
 =?us-ascii?Q?ArYo6zD9SabzcsgLycDeRX7224EAo4lPDLTggbMoPRKlnEa/R0UjNa7acloq?=
 =?us-ascii?Q?/b6/6lAoRpkLFRymfaj6HT8yjHFIbumKJxeRduNiFpu+QLB3iR0vpWnWPjhd?=
 =?us-ascii?Q?Q+koc6j86zt2ZeRu7PFU7Vr8?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6093
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d16dead-7a04-4a3f-891a-08d9348d988a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vbsj8Vww0F8yLOAU+5cotxqfWDcVuNrr4qScW5xLbplM7u0g9yrmt+dO156UC6xyBFsAykoZq9cxoFe4cJg4mkyyv65aImlglf8eowD34IsR/kMLfbtyS8ONl/bjugG8+hWx9XDzlDU5UXj9FiyvQQyvMb4VFuTwfS7PK999LbZor85ha5lmdEN6mtweWnFW9iFE8okYMCGt4cbIZ6YzOYEAXwUxsBw30KH09YeruccH5tlWQ8o4eIAg2U1fz8Qun/mQPgTV++k9GTjkq/4BXx16XhUBTqxhSwIUwc6VppRu2sByEHBsfe1ip220hJ+t+TcqU7YVIjahemFGl6Z+T9LJOuFYoEucH3hk+MBCjlTWiDY/oGegdhsv3KoA0s49oNcVU6LQQE7PPEFBiIhoXsBSGUBoDgyDjBX+D/AyPT9LW0aRT0x107JyUA4TrpGTQqhEwjU28LN0CmyQjvVcrttMpAA5WUGCqT2ke/+yJmp29STFSUTTanQs8KkMDcNkClQ3kZJ9h6BfsNQ08C9PPleP1dL4/BZ7ZMl99xzbr8Ko2Ia0AnXD33SYEqvNEisW690g5WZ52RHki8UxXIiLNfQ4ArXS1QVYVCP55C2QCLaxOeU79BgvQAeHUS22m46EoPe3WtJud1r0atHIyt0w7NaYBD2jhX7wzdHVeh5axA0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(346002)(46966006)(36840700001)(70586007)(70206006)(44832011)(6666004)(36756003)(186003)(2906002)(336012)(82740400003)(6506007)(47076005)(16526019)(83380400001)(8936002)(107886003)(82310400003)(54906003)(356005)(36860700001)(4326008)(5660300002)(316002)(6512007)(6486002)(8676002)(33656002)(26005)(478600001)(2616005)(6862004)(956004)(81166007)(53546011)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 08:22:09.5943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27779e85-331b-4a78-04d0-08d9348daa13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4755



> On 16 Jun 2021, at 15:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, dump_state_buffered_data() is taking two connections
> in parameters (one is the connection to dump, the other is the
> connection used to request LU). The naming doesn't help to
> distinguish (c vs conn) them and this already lead to several mistake
> while modifying the function.
>=20
> To remove the confusion, introduce an help lu_get_connection() that
> will return the connection used to request LU and use it
> in place of the existing parameter.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> tools/xenstore/xenstored_control.c | 13 ++++++++++++-
> tools/xenstore/xenstored_control.h |  2 ++
> tools/xenstore/xenstored_core.c    |  7 +++----
> tools/xenstore/xenstored_core.h    |  1 -
> tools/xenstore/xenstored_domain.c  |  6 +++---
> tools/xenstore/xenstored_domain.h  |  2 +-
> 6 files changed, 21 insertions(+), 10 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstore=
d_control.c
> index 0d57f9f9400d..d08a2b961432 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -104,6 +104,17 @@ static const char *lu_begin(struct connection *conn)
>=20
> 	return NULL;
> }
> +
> +struct connection *lu_get_connection(void)
> +{
> +	return lu_status ? lu_status->conn : NULL;
> +}
> +
> +#else
> +struct connection *lu_get_connection(void)
> +{
> +	return NULL;
> +}
> #endif
>=20
> struct cmd_s {
> @@ -516,7 +527,7 @@ static const char *lu_dump_state(const void *ctx, str=
uct connection *conn)
> 	ret =3D dump_state_global(fp);
> 	if (ret)
> 		goto out;
> -	ret =3D dump_state_connections(fp, conn);
> +	ret =3D dump_state_connections(fp);
> 	if (ret)
> 		goto out;
> 	ret =3D dump_state_special_nodes(fp);
> diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstore=
d_control.h
> index aac61f05908f..6842b8d88760 100644
> --- a/tools/xenstore/xenstored_control.h
> +++ b/tools/xenstore/xenstored_control.h
> @@ -18,3 +18,5 @@
>=20
> int do_control(struct connection *conn, struct buffered_data *in);
> void lu_read_state(void);
> +
> +struct connection *lu_get_connection(void);
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index 883a1a582a60..607187361d84 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2369,14 +2369,13 @@ const char *dump_state_global(FILE *fp)
>=20
> /* Called twice: first with fp =3D=3D NULL to get length, then for writin=
g data. */
> const char *dump_state_buffered_data(FILE *fp, const struct connection *c=
,
> -				     const struct connection *conn,
> 				     struct xs_state_connection *sc)
> {
> 	unsigned int len =3D 0, used;
> 	struct buffered_data *out, *in =3D c->in;
> 	bool partial =3D true;
>=20
> -	if (in && c !=3D conn) {
> +	if (in && c !=3D lu_get_connection()) {
> 		len =3D in->inhdr ? in->used : sizeof(in->hdr);
> 		if (fp && fwrite(&in->hdr, len, 1, fp) !=3D 1)
> 			return "Dump read data error";
> @@ -2416,8 +2415,8 @@ const char *dump_state_buffered_data(FILE *fp, cons=
t struct connection *c,
> 	}
>=20
> 	/* Add "OK" for live-update command. */
> -	if (c =3D=3D conn) {
> -		struct xsd_sockmsg msg =3D conn->in->hdr.msg;
> +	if (c =3D=3D lu_get_connection()) {
> +		struct xsd_sockmsg msg =3D c->in->hdr.msg;
>=20
> 		msg.len =3D sizeof("OK");
> 		if (fp && fwrite(&msg, sizeof(msg), 1, fp) !=3D 1)
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_c=
ore.h
> index bb36111ecc56..89ce155e755b 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -269,7 +269,6 @@ void set_tdb_key(const char *name, TDB_DATA *key);
>=20
> const char *dump_state_global(FILE *fp);
> const char *dump_state_buffered_data(FILE *fp, const struct connection *c=
,
> -				     const struct connection *conn,
> 				     struct xs_state_connection *sc);
> const char *dump_state_nodes(FILE *fp, const void *ctx);
> const char *dump_state_node_perms(FILE *fp, const struct xs_permissions *=
perms,
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored=
_domain.c
> index 322b0dbca449..6d8d29cbe41c 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -1183,7 +1183,7 @@ void wrl_apply_debit_trans_commit(struct connection=
 *conn)
> 	wrl_apply_debit_actual(conn->domain);
> }
>=20
> -const char *dump_state_connections(FILE *fp, struct connection *conn)
> +const char *dump_state_connections(FILE *fp)
> {
> 	const char *ret =3D NULL;
> 	unsigned int conn_id =3D 1;
> @@ -1209,7 +1209,7 @@ const char *dump_state_connections(FILE *fp, struct=
 connection *conn)
> 			sc.spec.socket_fd =3D c->fd;
> 		}
>=20
> -		ret =3D dump_state_buffered_data(NULL, c, conn, &sc);
> +		ret =3D dump_state_buffered_data(NULL, c, &sc);
> 		if (ret)
> 			return ret;
> 		head.length +=3D sc.data_in_len + sc.data_out_len;
> @@ -1219,7 +1219,7 @@ const char *dump_state_connections(FILE *fp, struct=
 connection *conn)
> 		if (fwrite(&sc, offsetof(struct xs_state_connection, data),
> 			   1, fp) !=3D 1)
> 			return "Dump connection state error";
> -		ret =3D dump_state_buffered_data(fp, c, conn, NULL);
> +		ret =3D dump_state_buffered_data(fp, c, NULL);
> 		if (ret)
> 			return ret;
> 		ret =3D dump_state_align(fp);
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored=
_domain.h
> index cc5147d7e747..62ee471ea6aa 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -101,7 +101,7 @@ void wrl_log_periodic(struct wrl_timestampt now);
> void wrl_apply_debit_direct(struct connection *conn);
> void wrl_apply_debit_trans_commit(struct connection *conn);
>=20
> -const char *dump_state_connections(FILE *fp, struct connection *conn);
> +const char *dump_state_connections(FILE *fp);
> const char *dump_state_special_nodes(FILE *fp);
>=20
> void read_state_connection(const void *ctx, const void *state);
> --=20
> 2.17.1
>=20
>=20


