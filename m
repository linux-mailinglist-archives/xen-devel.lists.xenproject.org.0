Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E096327B0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 16:19:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446717.702470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8Ze-0007HA-35; Mon, 21 Nov 2022 15:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446717.702470; Mon, 21 Nov 2022 15:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8Zd-0007E3-SW; Mon, 21 Nov 2022 15:19:05 +0000
Received: by outflank-mailman (input) for mailman id 446717;
 Mon, 21 Nov 2022 15:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQtr=3V=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ox8Zd-0007Dx-5P
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 15:19:05 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe13::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d57a52cd-69af-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 16:19:04 +0100 (CET)
Received: from DB6PR07CA0111.eurprd07.prod.outlook.com (2603:10a6:6:2c::25) by
 PAXPR08MB7442.eurprd08.prod.outlook.com (2603:10a6:102:2b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.15; Mon, 21 Nov
 2022 15:19:00 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::3c) by DB6PR07CA0111.outlook.office365.com
 (2603:10a6:6:2c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Mon, 21 Nov 2022 15:19:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Mon, 21 Nov 2022 15:19:00 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Mon, 21 Nov 2022 15:18:59 +0000
Received: from 428a4cd0406a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B0A2E9CB-C69E-4789-9399-D7138E766704.1; 
 Mon, 21 Nov 2022 15:18:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 428a4cd0406a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Nov 2022 15:18:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8456.eurprd08.prod.outlook.com (2603:10a6:20b:55c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 21 Nov
 2022 15:18:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.013; Mon, 21 Nov 2022
 15:18:52 +0000
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
X-Inumbo-ID: d57a52cd-69af-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByFzQziCz3y6P3c0BnRBWFklGTm45bgQ7b8bEMxa1ck=;
 b=zysAjg1TL4O0ipkb2EmN4+c71gaqGg/obPrOO8/j4Ey940i3oX6Z/uSwmtrgQrUAcR0g0pn7WTBeWjEwM98nYoJzt4u+jnw+fG0tNChTE6Ph6vGqoBLqGnhuXhgF/QTWwJefUTHmOBQIl1hlFhg4s5pDCHhc3wjf3K8IRe3Lrdw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVdoHu6X/zaDiV0IGy3a7mDBZY1JFY62NJxQg0ZH/GTMVqIp2qCIfP3EI5WXhKtGHdKU5TPkYQv5o/ZxznohbZNjDAsbBojJEVrGk2zfYTbymgNZo0nYFV0Pc7IH+vDYyApOYhMpBLJq2oiapvCoI95aYR5fCdWOvm/Ht/L7/oVxYOT8pN9exDLMHtHM5zX+DzYvy8pANQ+Bau52dxmxX96xGytdYjpTWW4LsHZjJzG8xG3licDg9WrC4TfVGFOzq8GN/u+PRY3vP1y3LkNhzMnx+DKdcGZDHoV1w/hmXNit5F1MaYFsrmmp11fl7rQDVRpOPw/AkC9SVwZwqdPERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByFzQziCz3y6P3c0BnRBWFklGTm45bgQ7b8bEMxa1ck=;
 b=IibjyPWLbhk7qm3/NAdI+MEzCZHBIUOgt558pAlW4K4HQBxFbz1tVlGFatRf+/kSQj2nwl1tl8b3ylhluHFiDvfzQc9kUVJBno5XQ17X0oGY9vCt9p7YRBYlBDnicQREPBsYTnSAF1mXrKwxDW8WCoUK52msEjOhaMdJ8jxgxmkezOlL6Y1pwFdI1gnmlDod3NUBbu067jUBd3WJ5J1WTSeuawd1Abb4ta5wE+Sos6p+kEE6x2H/o6rvRQ35CzXG1E3CKYNrncihMQSvwb0PzqB1b2DjUS8ifGtNJ4/UKIhdtrK2XxYq2vYK1UaPBJDLLQzR69e59ZBQqf077Cy+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByFzQziCz3y6P3c0BnRBWFklGTm45bgQ7b8bEMxa1ck=;
 b=zysAjg1TL4O0ipkb2EmN4+c71gaqGg/obPrOO8/j4Ey940i3oX6Z/uSwmtrgQrUAcR0g0pn7WTBeWjEwM98nYoJzt4u+jnw+fG0tNChTE6Ph6vGqoBLqGnhuXhgF/QTWwJefUTHmOBQIl1hlFhg4s5pDCHhc3wjf3K8IRe3Lrdw=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Daniel Smith
	<dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>
Subject: RE: [PATCH 2/2] xen/flask: Wire up
 XEN_DOMCTL_{get,set}_paging_mempool_size
Thread-Topic: [PATCH 2/2] xen/flask: Wire up
 XEN_DOMCTL_{get,set}_paging_mempool_size
Thread-Index: AQHY/bbVX0GSNM/JZUeuvzit/8P6fK5JfROQ
Date: Mon, 21 Nov 2022 15:18:52 +0000
Message-ID:
 <AS8PR08MB7991817601616B9D5248E5B5920A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221121143731.27545-1-andrew.cooper3@citrix.com>
 <20221121143731.27545-3-andrew.cooper3@citrix.com>
In-Reply-To: <20221121143731.27545-3-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 66F8555E4AE86046BCBAAE755912140D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8456:EE_|DBAEUR03FT007:EE_|PAXPR08MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: f12ba5b7-7d11-4a39-adbb-08dacbd3b752
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 anuxUr4Rrjdjq9g+LWC4V8ZesFIhC/g41jkEZtPV+bwqYxNO9mdTIvQzirXzaVJ4ruVLvWSAUnMENjtvZc6l1Pu8yQVJsukYQQZOBv2Zz+S3ZAJXvX5kjo2IG0V93eRPO+zj595Kkatih2fxwnUGMdflptWEjy8R19wHQWhqh2JyMGYy+QRid/mlwY+F3Ex+RQMVc9GcQx1URePmNl4G95geyxiyJg5ekLZJmjygfeF/5gAuvp7g8hCWYHHj2qUh4W7hRCjYiRgGr4zs3XEK1K+a0601KKFdcGJuYZSSD3n4sCKJSqTMp1csDcD53uP4FetPRPBRLfuCiMDHSVyyCg9FL4QCFYWCWsc5hx7qT3FUzDWeQNwHUWmmyjCGxFi6foQGes6DaJw2FxVRZpWrMbHMdz5Zcso16XB7TIOVUmRWCVEcBVNOfhUKdevncDUGeeyjwYisWnnt6sftJRtThnR8beJqXS1fZjS9+oFwO+Wgxv+7P/uJFN7sruEXcdaiufXyh2KAvXycIZQ2I8mY7nbYOq8/RgZ083qBEbSOhD0LlRBmNKjzyEoviHr5KayM8FnlXv6rbe3ygiwqfNBI1PNfUAfFwdkdpWXYyLvmHo828tHfoBzWvBm8/i2dKirR3COMsd7zDONztoqMG1zhPbOpiCzDswqG/Ph4JYvbtk8kour0X+8mgJLhEoLw/izf+bAg9R4s8R3xqcd9L8POjA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(86362001)(66446008)(4326008)(33656002)(53546011)(55016003)(41300700001)(76116006)(66946007)(66556008)(66476007)(4744005)(52536014)(186003)(5660300002)(8676002)(8936002)(64756008)(71200400001)(478600001)(26005)(9686003)(316002)(110136005)(38100700002)(122000001)(54906003)(6506007)(7696005)(38070700005)(83380400001)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8456
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b93b36bc-0948-40f9-2927-08dacbd3b295
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JH8rskIDBeTRyvsTuA9/qqFx8psaVZRrOJTUYP6jIsTr2fz8CYd0UU0WgkzhH+KpaYikBCYkZIceUudCZI9oqHAOhetvnSlD4MOg4qM9WAUslAToETD42cjd/NXr9AdauuNPeiWZgW3kh9DQi+9T0+eU0+LgbfgZ+IV04jPPjdPk7AJCuEv7h2McmG+PrlWqfkgTG9hbRXucODhBEB8omuE3cm7Dz+o1R82hXoncJ6lwdKlzC4CBHQgVmJ2paEwqXj+kiS+ZJvEoGy8Fe8+LBrBxmCY7m/bA5n8GLG25FS8BLko+jP+G6WX+7AaGH5AlKmavJRVJ7+tKRJpRztPxsufG0k5KoAxCyRgefR6JqL9OvklkMj5PW5zxJtDAy99w0XrLuKkfliOPFbiwJc99AK87Ibl8lDN4Z2iKKedpTqUl14iqguMzoJBTD8abbmiUuCT1oIrMxeyfPjCgXQ5zRX9oDK/jX3+ma/FGZua4AKiph5HGw2jgMoHmYYp3YUp2XcUFaW8R++j1pTYabLe9x+NpITURGwjXrGvyYqRW7rCg6giyAa3nXtWxKjzwMxXMc1gUrW8ySGHhpOets54TkACceCSwXDtzJKynU7cr/Ia5cUYZrBig9DxnGLn/fGQDuMn/+WSNlRSzDuzzYHEifVkTmd2DRN9QaID4NmCRsWEKU3MtH3B5iUlHxzvRtszoTUOzouEOyuz4D7sPWW0zAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(8936002)(4744005)(54906003)(4326008)(5660300002)(316002)(70206006)(70586007)(52536014)(8676002)(478600001)(2906002)(107886003)(47076005)(336012)(6506007)(186003)(110136005)(9686003)(53546011)(7696005)(26005)(36860700001)(82310400005)(40480700001)(40460700003)(33656002)(83380400001)(81166007)(82740400003)(86362001)(356005)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 15:19:00.0533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12ba5b7-7d11-4a39-adbb-08dacbd3b752
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7442

Hi Andrew,

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: Monday, November 21, 2022 10:38 PM
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Daniel De Graaf
> <dgdegra@tycho.nsa.gov>; Daniel Smith <dpsmith@apertussolutions.com>;
> Jason Andryuk <jandryuk@gmail.com>; Henry Wang
> <Henry.Wang@arm.com>
> Subject: [PATCH 2/2] xen/flask: Wire up
> XEN_DOMCTL_{get,set}_paging_mempool_size
>=20
> These were overlooked in the original patch, and noticed by OSSTest which
> does
> run some Flask tests.
>=20
> Fixes: 22b20bd98c02 ("xen: Introduce non-broken hypercalls for the paging
> mempool size")
> Suggested-by: Daniel Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

