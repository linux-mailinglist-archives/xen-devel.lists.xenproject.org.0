Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B574233F3BE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 15:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98735.187467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXbF-0006S6-Iq; Wed, 17 Mar 2021 14:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98735.187467; Wed, 17 Mar 2021 14:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXbF-0006Rh-FM; Wed, 17 Mar 2021 14:56:41 +0000
Received: by outflank-mailman (input) for mailman id 98735;
 Wed, 17 Mar 2021 14:56:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MyhP=IP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lMXbE-0006Rc-9P
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 14:56:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.60]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f17cd48-49aa-4500-892f-2ccfecd364da;
 Wed, 17 Mar 2021 14:56:37 +0000 (UTC)
Received: from MR2P264CA0172.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::11) by
 AM6PR08MB4600.eurprd08.prod.outlook.com (2603:10a6:20b:84::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Wed, 17 Mar 2021 14:56:34 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:0:cafe::5) by MR2P264CA0172.outlook.office365.com
 (2603:10a6:501::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Wed, 17 Mar 2021 14:56:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:56:33 +0000
Received: ("Tessian outbound 26664f7d619a:v87");
 Wed, 17 Mar 2021 14:56:33 +0000
Received: from 57935c781b62.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6B8F8D6-3D09-4F18-A609-951C8A2207BF.1; 
 Wed, 17 Mar 2021 14:56:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57935c781b62.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Mar 2021 14:56:26 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 14:56:25 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:56:25 +0000
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
X-Inumbo-ID: 6f17cd48-49aa-4500-892f-2ccfecd364da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlbL7v8bpY9VAQR/1LAtAHwMNa+Ynp8uqeKiEXogAXo=;
 b=9fwFWgk1qfGZ6bMZ+IluecLPu5TZ7HhenWJscrTU8vKlV37YjB7y6NObKK4vAkjHDJRuUD8D+6n7S1+EEWJoFzf3XRB906HFv4dCA4HURkzx68B3M0LnQWTOGpw1pJTy9Z0rakT8i45obZsoY4kEBPSy6+cLZWMpK33+qmE9378=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d245bf465aaa8ea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3oac2ajcMGQygxs8Vdi2pMuovluolsT+nJbKUeGLtSkCWmFvZfKTjU5DZwh/WxuKFvN8e9QRvWK+0QiqCsP3hCaF4O+9/4JbN5MD25NbdbEu1xboFFgLafCckEfX5FWlgxvfrxNiKTxlAJ2QHMj1Os9w411hGvRob9K3hzODlc2kxVMXBPysvjvZTnj+Y38Y1P9s1LjCWgGT79sRlVh9MvJNOO1oRS9bTyheZMZXFPxnINuvMNGOrKREE8OivbuNrTBXQCL+i2uycOZv6aYbWwkKJnlWJ9OVIoCFCYcB3VU5pzbZBCq0dBL+n1t534woQNCybSOBUeyw24LAJNMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlbL7v8bpY9VAQR/1LAtAHwMNa+Ynp8uqeKiEXogAXo=;
 b=J4ddzLOeIrVvLqwr2XMrI1S2fRy1KA4bA6HbuyIDik5SIns9xkCljgDvHljjsyMS1P17ugqmQk482yg4WoexCjMPM1B4uZWeU9AUp8dvlCMGeu4y0z/4tgWiCNbbZgyph9lDzxg/wExeSEcJRiTmprbcOn8uRiv3W+XtBattRLc7Ea9y/EqBN30sCJECfdCj1KOYXWm8exkI3Di/VlvZMQtcgO871bd1qmlzphWmu/9lxbq7UalgRcuT9gpCQblo4u/tHVyxXfc5NbqB9GUi1X6z6H+Nq77W4RGFnmTtSxOfWEIK2MGR3AWTyKQh69YhBi6FRR+vw9Mgfg2R3TopRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlbL7v8bpY9VAQR/1LAtAHwMNa+Ynp8uqeKiEXogAXo=;
 b=9fwFWgk1qfGZ6bMZ+IluecLPu5TZ7HhenWJscrTU8vKlV37YjB7y6NObKK4vAkjHDJRuUD8D+6n7S1+EEWJoFzf3XRB906HFv4dCA4HURkzx68B3M0LnQWTOGpw1pJTy9Z0rakT8i45obZsoY4kEBPSy6+cLZWMpK33+qmE9378=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-next v2 2/2] xen/arm64: Place a speculation barrier
 following an ret instruction
Thread-Topic: [PATCH for-next v2 2/2] xen/arm64: Place a speculation barrier
 following an ret instruction
Thread-Index: AQHXGCLUePNZXth41EOpDgjR62uDxqqISyAA
Date: Wed, 17 Mar 2021 14:56:25 +0000
Message-ID: <C0FD2269-4D00-480A-94AC-61663E0C9E94@arm.com>
References: <20210313160611.18665-1-julien@xen.org>
 <20210313160611.18665-3-julien@xen.org>
In-Reply-To: <20210313160611.18665-3-julien@xen.org>
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
X-MS-Office365-Filtering-Correlation-Id: 671c925a-e118-446c-d86d-08d8e954db68
x-ms-traffictypediagnostic: VI1PR08MB5501:|AM6PR08MB4600:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB46005360A24801EE27F6D89D9D6A9@AM6PR08MB4600.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GvVRwn7qDlYf3D0hEvnlLwYmLrwW4+9KYNQMnfojlFa1nN3K6s9z1hmMEyKl9Ou5A2KijaOBajVUpzKUmg9NnFnWQoRLLMEsfWvULbJggosx5pQP9jR9K4ZiZsAzhU8fK2gji3N1jAzQilEOWSyO4g/Q+ovGvHxdEGkJaF8eEMII2wnT+Ewp3d7VQo6JA5IRfueXDC+v1QN19jDgbWcVzPiXL6HdBE/aa8DfL7Q6msa8syy93VqcXG9tsE1EkYOM+mUDyGWXDKu70+lVSWZMVWtvT4tN8wu9hnrNwybVnDNoboTK8iMqflnSLgj0Euizl8fB2BBInnl4oWwdtpssiJFE13sUauzNbPaFSeUC6qfPKkmFUg4PvxS5QR1VL8c8dbbOXKtwCxIsF+l/z7OKuA4BsndK12PSUJb+TUpuQ5XSOGAp9hkBUoaTsGCDWqUbQ7sboT2Taw9pylAvn81jRj1brULpKYepgxg6fpLQEddJs3BSSpdTqjrVJIZpXbU/sWFXioCIsMqpPIpjQyOAW6EkonuT5/u3PKwmQG88e8ZSnEt7MVxuiEPocRJBIWOk9x8+gIOReiXInnYB78zGLS7k2xqyv3F85VJaAWF0AuVhVnH5A8QHRtdRlIoP773WsJrxPSGh4zOs95uGzd9jcA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(8676002)(26005)(6506007)(8936002)(54906003)(53546011)(2616005)(33656002)(2906002)(478600001)(186003)(86362001)(4326008)(83380400001)(6916009)(316002)(55236004)(71200400001)(6512007)(5660300002)(36756003)(66946007)(64756008)(66446008)(66476007)(66556008)(76116006)(91956017)(6486002)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?DpOJVkwQ3JtIUq1fy0ST/xXsPl2P6Z0c2H4EF26GZ7joXofjPbH4SyBZrnCg?=
 =?us-ascii?Q?f7Z8c9CnYGH8nlZdQ1BvY42QFpV5fCIhRgxP7Mpzeb/gAdrIUU5LoflqW34x?=
 =?us-ascii?Q?PJIxW1nXnlvssKSjuwVFdTbw9nBFK4qC3txfTFQWzOXuPH9HrLI2qVMXRPid?=
 =?us-ascii?Q?tQu0rTjty+tlSkvWURvp+GSprgfKTBEoeDvwXRlRa+9Vg/P0XcxQJRB0TVFs?=
 =?us-ascii?Q?DOEw2VE12J8z6/0/DBj9mhJ1sJXVgzKxTven/bNeJ/rngBQ7ddZWYchE95WP?=
 =?us-ascii?Q?JrwPvx4cHMp3pE3Nq+klWGcHNO1GywOCd8UEW9rm1k5tK5VNRI3IIPXvQ4pi?=
 =?us-ascii?Q?xTbg/uVgFSyD/9Ep8yxElawZxgcxkE5S1sSfpfIn/kcQJ6QrjULK68/xXxbh?=
 =?us-ascii?Q?Ky/0aM/lZktPUS8GxBGmD2xLTPw1UVQU2hDb/ezo3UpJGS1MJpacV8HdPAMh?=
 =?us-ascii?Q?2jJ2B908FNTWcgrC62XGi9yawEIaV4RGucniq/Srop8Dh1lE1UryV5mYPTT3?=
 =?us-ascii?Q?kIN+KLG1qtJTXHeG61BGlwvmolnvqMA/yrpBrbMolQnvUelMI0ylXpa98Smq?=
 =?us-ascii?Q?eN11BkvkSrKOx/1ZGzgxMA1NVnzL5cK/6Teiza7eD0FD0SdpRLGCnj4W62jt?=
 =?us-ascii?Q?5NXG0kem+B2vBAoCOCPVkjqgvc49T0p8ffz4Ea8fjEBznYH6N4sL4mUTPbWR?=
 =?us-ascii?Q?Xvj7ZjJLsKOZIRyx8WVBEK1sFXpM7ne3AK065Dzaq89ALDw6JZ5t7WCIblUv?=
 =?us-ascii?Q?wo9yttuBkKa4vRynaAdZGAEDILYoIgDa0pSyfnion+VPcbZThWbTx0xBIoTp?=
 =?us-ascii?Q?oDbFkL14IKFXAKcX585jcQN93rIJItKBbuFziARo7laCNNug8n2QC6pCXCaK?=
 =?us-ascii?Q?1jMKkUQg5e0AxADLb85tVxxRni3awaUj/1+hKk3mQlRMwBQE05gr2SeA31rj?=
 =?us-ascii?Q?BYeyOOcrl7rQ1jhAvYaFPNNuku7s6dtKE4wHo3OoLcrQjnnwiGmZzhJB61PI?=
 =?us-ascii?Q?nQZ4n6foiHt/LAjZlhuSejuxC1tvi54qQlweHDPfPRkAcCk29O5EnLCaV3SZ?=
 =?us-ascii?Q?hTVPKD11wY/tgpimbN0ByNM0iUtIwYSN/Z1SN3+dCwULHQ5sT16z5OPTw5xI?=
 =?us-ascii?Q?Q/tRVGWTKLmMPQkJ4OJE5EwI4yIzJWcvCV3aenvbs+6ABF+C8peHs3la/har?=
 =?us-ascii?Q?XlHjxvS1O4rhuK7psvofClsfgLMvEYhS56hiz29rvJ2rwRIeEFqzPBgWrDF/?=
 =?us-ascii?Q?Kts5gCXoYr920iKh3o4G2yJajXGr1HuaSPJqdZ15UsQetY3U5wskS0qIOnZk?=
 =?us-ascii?Q?r2HLwoiPg6+ZwKyqmUHmKMYW?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0FB0C4D73A0D384AB3CD92959E787F3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34d1c221-cebb-485c-cce6-08d8e954d66d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ga61WpWIPQZYWo/RBEvxZcD/YIU27pllrTyC7Hd8IKi6CjOQ2NSaGuAo1hpiL/H2IhdcuOsJZp/3PM9LEjef7bTIcUPTdez5Dzp90RJfGjD0rd34uohg3zvvOZYm8HG9Hrp5Ro3jdDKfgZq8v8FeaNRBbxCtuQyJwGPNNG+QbGiY5QvGH348W1nzJbIZZ+o+ZByBUwW6T12oxIzEExfjp4zImbIoSms57JnGpqH/gRG8fDSUSQ/9vDCS3Nbt+vaZbTjUXqTHuaMtdwobNZPqCPJUDvC0zc0uiAsXhQ8nbdyPzUz5jB6+fGU2QQDSNw4Z370K9Qx6hgWHoR5cGmVaeCKSQKpMDfsU1mMho+dzN0DuCxyWK5B6aJ5zvlNbiMoz8XryNx9fMWKiAvj+s/sTVxdLLbvn1qBOaczjQOpALrUxwpNcSAIxI3fhAkke7JvVXLF1Ju9pJVJ1AMivDuDO5rcxJ8FLG/XadJdApjyzggrRZ90WV30WPYSTXYmDZYDJ4IfLAYGpc5625cKLoMiNw+qRucP0BmpIXCTBv+2hhe5LKfh/uqhSwa4nnzoY/njA2KNWUuP2zBCkeKlHC53b/1CK717zTOZE1JJy+j1c06P3uNY2CdWitwa6UC7YhCKUcaQROJFari/SKW/ZruU5Mv8LsxYWlr3LfuoGLwAXBIzgqXUsQCWBz7wKDJPeIex5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(36840700001)(2616005)(70586007)(6506007)(55236004)(82740400003)(54906003)(2906002)(5660300002)(53546011)(70206006)(33656002)(81166007)(83380400001)(8936002)(8676002)(6512007)(6486002)(36860700001)(26005)(47076005)(82310400003)(356005)(316002)(36756003)(86362001)(107886003)(478600001)(6862004)(336012)(4326008)(186003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:56:33.9261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 671c925a-e118-446c-d86d-08d8e954db68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4600

Hi Julien,

> On 13 Mar 2021, at 16:06, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Some CPUs can speculate past a RET instruction and potentially perform
> speculative accesses to memory before processing the return.
>=20
> There is no known gadget available after the RET instruction today.
> However some of the registers (such as in check_pending_guest_serror())
> may contain a value provided by the guest.
>=20
> In order to harden the code, it would be better to add a speculation
> barrier after each RET instruction. The performance impact is meant to
> be negligeable as the speculation barrier is not meant to be
> architecturally executed.
>=20
> Rather than manually inserting a speculation barrier, use a macro
> which overrides the mnemonic RET and replace with RET + SB. We need to
> use the opcode for RET to prevent any macro recursion.
>=20
> This patch is only covering the assembly code. C code would need to be
> covered separately using the compiler support.
>=20
> This is part of the work to mitigate straight-line speculation.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

The macro solution is definitely a great improvement compared to v1 and I c=
ould
confirm the presence of the sb in the generated code.

I also think that the mitigation on arm32/v7 would be messy to do.
Shall we mark v7/aarch32 as not security supported ?

Apart from this global question (which does not need to be answered in this=
 serie):

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


>=20
> ---
>=20
> It is not clear to me whether Armv7 (we don't officially support 32-bit
> hypervisor on Armv8) is also affected by straight-line speculation.
>=20
> But the mitigation is a lot messier because opcode can be optionally
> executed. So this Arm32 is left alone for now.
>=20
>    Changes in v2:
>        - Use a macro rather than inserting the speculation barrier
>        manually
>        - Remove mitigation for arm32
> ---
> xen/arch/arm/arm32/entry.S         |  1 +
> xen/arch/arm/arm32/lib/lib1funcs.S |  1 +
> xen/include/asm-arm/arm64/macros.h |  6 ++++++
> xen/include/asm-arm/macros.h       | 18 +++++++++---------
> 4 files changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
> index f2f1bc7a3158..d0a066484f13 100644
> --- a/xen/arch/arm/arm32/entry.S
> +++ b/xen/arch/arm/arm32/entry.S
> @@ -441,6 +441,7 @@ ENTRY(__context_switch)
>=20
>         add     r4, r1, #VCPU_arch_saved_context
>         ldmia   r4, {r4 - sl, fp, sp, pc}       /* Load registers and ret=
urn */
> +        sb
>=20
> /*
>  * Local variables:
> diff --git a/xen/arch/arm/arm32/lib/lib1funcs.S b/xen/arch/arm/arm32/lib/=
lib1funcs.S
> index f1278bd6c139..8c33ffbbcc4c 100644
> --- a/xen/arch/arm/arm32/lib/lib1funcs.S
> +++ b/xen/arch/arm/arm32/lib/lib1funcs.S
> @@ -382,5 +382,6 @@ UNWIND(.save {lr})
> 	bl	__div0
> 	mov	r0, #0			@ About as wrong as it could be.
> 	ldr	pc, [sp], #8
> +	sb
> UNWIND(.fnend)
> ENDPROC(Ldiv0)
> diff --git a/xen/include/asm-arm/arm64/macros.h b/xen/include/asm-arm/arm=
64/macros.h
> index f981b4f43e84..4614394b3dd5 100644
> --- a/xen/include/asm-arm/arm64/macros.h
> +++ b/xen/include/asm-arm/arm64/macros.h
> @@ -21,6 +21,12 @@
>     ldr     \dst, [\dst, \tmp]
>     .endm
>=20
> +    .macro  ret
> +        // ret opcode
> +        .inst 0xd65f03c0
> +        sb
> +    .endm
> +
> /*
>  * Register aliases.
>  */
> diff --git a/xen/include/asm-arm/macros.h b/xen/include/asm-arm/macros.h
> index 4833671f4ced..1aa373760f98 100644
> --- a/xen/include/asm-arm/macros.h
> +++ b/xen/include/asm-arm/macros.h
> @@ -5,6 +5,15 @@
> # error "This file should only be included in assembly file"
> #endif
>=20
> +    /*
> +     * Speculative barrier
> +     * XXX: Add support for the 'sb' instruction
> +     */
> +    .macro sb
> +    dsb nsh
> +    isb
> +    .endm
> +
> #if defined (CONFIG_ARM_32)
> # include <asm/arm32/macros.h>
> #elif defined(CONFIG_ARM_64)
> @@ -20,13 +29,4 @@
>     .endr
>     .endm
>=20
> -    /*
> -     * Speculative barrier
> -     * XXX: Add support for the 'sb' instruction
> -     */
> -    .macro sb
> -    dsb nsh
> -    isb
> -    .endm
> -
> #endif /* __ASM_ARM_MACROS_H */
> --=20
> 2.17.1
>=20


