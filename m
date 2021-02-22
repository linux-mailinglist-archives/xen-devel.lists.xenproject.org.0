Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDDD321951
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 14:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88081.165449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBaS-0005Vm-KH; Mon, 22 Feb 2021 13:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88081.165449; Mon, 22 Feb 2021 13:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBaS-0005VN-HE; Mon, 22 Feb 2021 13:49:20 +0000
Received: by outflank-mailman (input) for mailman id 88081;
 Mon, 22 Feb 2021 13:49:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ieRt=HY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lEBaR-0005VI-Bk
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 13:49:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::624])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 707b8b15-775d-4791-ab09-5d7b0f2bbfe5;
 Mon, 22 Feb 2021 13:49:17 +0000 (UTC)
Received: from DB6PR0801CA0048.eurprd08.prod.outlook.com (2603:10a6:4:2b::16)
 by AM9PR08MB6305.eurprd08.prod.outlook.com (2603:10a6:20b:284::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 13:49:16 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::62) by DB6PR0801CA0048.outlook.office365.com
 (2603:10a6:4:2b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 13:49:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:49:16 +0000
Received: ("Tessian outbound 2db1bbc8a1d2:v71");
 Mon, 22 Feb 2021 13:49:16 +0000
Received: from c58ce23b36f1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BED9DF4-0D4D-4AAE-9B58-32D923B10E61.1; 
 Mon, 22 Feb 2021 13:49:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c58ce23b36f1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Feb 2021 13:49:10 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB2861.eurprd08.prod.outlook.com (2603:10a6:802:19::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Mon, 22 Feb
 2021 13:48:58 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:48:58 +0000
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
X-Inumbo-ID: 707b8b15-775d-4791-ab09-5d7b0f2bbfe5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8m3exn3bRMvrS0WFhcJORaBO+3ZwcCWXcVBfe7b/LY=;
 b=qlDmVQxZBHxa+rolFXsHoLvA9cyRkTrFwBE8cfvQhl58aS4b6/Oz+rlZMnoqgVy9v9XNOPsWZtBwIpC2KLcWUKB3CIxtWiL4NlG08WCakEccG6zAqv+SdUqvm3FDUMD8z8HamihJS+VAgI8G12SWqEJeQF0KXMExzvfCk/A537Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5bf8335f4cbe4fd4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez+k5sFTWSftMQ7kmsOB9HTKSqegx+O9KeqkhW71kQtfxAgLQCs1PMAN1nbA79g1nnWSNPoYF36Pt0IH1tbVTQa8985ZsePbyD1tU3Q7XtiiKJvr6EpAqrmkLTYnYup0+CU6v7PmafEIbMETgGP9YBQoWviZaHQBBXEfYMhbJSd1KwB7Z8+jGEukMaW9+M76BPmYGHBB64Q5Cm73kXXEF6DiaHu2yJpXSJu0LaQ1i8f4i5ycM9H4wvhfp78ZUj8Fyt+k5ARyHbX42pkhH2OClyVE+AoMl6mbATUiGXvhVMSMN+XfOpGw/zzh5yepz0wT+QfQ00cNNWPkptkxYV89jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8m3exn3bRMvrS0WFhcJORaBO+3ZwcCWXcVBfe7b/LY=;
 b=M2IJ0cSmBudjC2HlfjVgrr7PUBFRFlWAtdwCzNdyCaP9I8QD0PFNmcBkT3yTQfJhyJDfVrc1y5zIBX+8S84yaTOwGoWk9zQjzkn8piQfpjy77snBQCW3bfF2bCzdX1LU7Xcsu4nI6zzdDHbAZuGhXkUbPAN4EIWa6YNwy2i2TuFRxsQr/wUXcZB0jDoMAkSe0lplanw0ZueIpYD9N42WH25dLZIjF7nxaxnlVE9vJutVgEmWl5V5gVgDZlBRYFPzoEMVaTgN3X1FPh+FWdxGvhSTyKmDQWBZbbaKhAH8/+7LlX0VQD14HjAsYAL4YJmcLyDmP7rHVLCJ8XsCmrTNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8m3exn3bRMvrS0WFhcJORaBO+3ZwcCWXcVBfe7b/LY=;
 b=qlDmVQxZBHxa+rolFXsHoLvA9cyRkTrFwBE8cfvQhl58aS4b6/Oz+rlZMnoqgVy9v9XNOPsWZtBwIpC2KLcWUKB3CIxtWiL4NlG08WCakEccG6zAqv+SdUqvm3FDUMD8z8HamihJS+VAgI8G12SWqEJeQF0KXMExzvfCk/A537Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-next] xen/arm: mm: flush_page_to_ram() only need to
 clean to PoC
Thread-Topic: [PATCH for-next] xen/arm: mm: flush_page_to_ram() only need to
 clean to PoC
Thread-Index: AQHXB7GCcUtPYwKMVk+6z4A6IyPFF6pkFLEAgAAbkICAAANLAA==
Date: Mon, 22 Feb 2021 13:48:58 +0000
Message-ID: <7ADEDCE0-4C50-47B5-AA15-C5DF841FA330@arm.com>
References: <20210220175413.14640-1-julien@xen.org>
 <FC521246-BD88-4D8C-82B7-6C3EFC8B00D0@arm.com>
 <45cd6455-3ad0-f052-65d8-37adb658f003@xen.org>
In-Reply-To: <45cd6455-3ad0-f052-65d8-37adb658f003@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1eb19402-80b1-41dc-7940-08d8d738a510
x-ms-traffictypediagnostic: VI1PR08MB2861:|AM9PR08MB6305:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB630591DA183AA622C48E2BAA9D819@AM9PR08MB6305.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gydjdHoVe69Y+yU1Kt2w2p82Z4orYohG1fU84hr7RxwKAegwp+tydsygHjJ6BbuOki5tBt1OUVXscJQ3NwJtwsGpuqjpWSJFaRaUG/Y1c2w3su2CqLMHcuWA3xKXLmRnWtTgkNo0z8T0BVQ4DSQHfNUP9QEBJUmUXlf825Z/b8yiz2L+XwYzgtE0GXgR8RISzUodBFFtYiDcIqPIGJzfMc2PTVOiVRZLyfjR1dy4L+1K73+FgzrGKrIyqQGNynquFEEJ8kxmnMQTZGC5ma1Rz3qb2maWTUELzYbWmXcDnKyw4Eusa8z54WiV5Tusoc+1l8f2irBacEeyAQJaL0ilBGsjKR0WwcLtEHV9EwOyamXhoZt044v6JXKqtgOjeVL1KuBh6MSGti6c5hw6mMu6s4xbnWk5gOiNu1BSn4AXGmvcXPsnBtH7Z7Ng10rpqYzEyJTrR9PCgfTtF3SNK/Ip69qtfMDVYAh/xO6skOwHRsApAmr4lJ8+QPb74I5Ji3hpj6qmRyJsZlASiTpYqeJMHhxbwr0qhLZckeWfSsywEh7mSi3fUw/RJkGPud8B4+3rWXbx/S3lYlx7lvcE5ZIdFA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(478600001)(86362001)(55236004)(6506007)(53546011)(186003)(6486002)(26005)(33656002)(8936002)(8676002)(2906002)(83380400001)(6916009)(6512007)(316002)(54906003)(76116006)(66946007)(64756008)(91956017)(36756003)(71200400001)(4326008)(5660300002)(66446008)(66556008)(2616005)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?LYr9h/yJ33lANlYYxCzjfk9pLjU5wGRdkrtplRpjBu2zbkh55Lzf0MfzPhJt?=
 =?us-ascii?Q?fjRGKxp7TY/Il5l+mTxv+lxmhUOshTLZFmPR91dO/0tef+nf165ftbIOmktA?=
 =?us-ascii?Q?VFOaCDyVyKn4Ry5AkD6ATTpZrCT/qQMpBq5WP+2aNjeT/Zag/w3vNTrxdE7X?=
 =?us-ascii?Q?U7XAuZtTexgEvT02+4u+yFisy6sq+gG+C2B8aD7GbLYymPZT4XQ4zippmDge?=
 =?us-ascii?Q?QsW9eCfuz5sNtqCL9t+CV8ERq70r8piSqJO1gnXneIkNbACAyye0e9ixs756?=
 =?us-ascii?Q?QMTSklGlbCkksn0Ki02yAiUxgEibpiEVOQmdF6AVwaFvVFCnCCMDrP7Bbmkn?=
 =?us-ascii?Q?NjC+R0H4UAX/SZWIOIlri2b19U7J9DUEZTl89p4OeAEtpGjxfhx/r9VuO4Uw?=
 =?us-ascii?Q?5CVuaqLuXXxHJMzJdu0FK2TIlN67hPEbLmXFbQeiTmhdljdQFzqAWIdYiVY0?=
 =?us-ascii?Q?BPtQW+sBuKiPeozPUWujkb11s/9TA8USlh+fxAkVI+SynO3GaVbYwxVZU8ia?=
 =?us-ascii?Q?LkE1Iu3eqMwTUYmzRjee9rc18axYqkOTYQFBM8M6NutTPiRnK8sOKpvJPvWM?=
 =?us-ascii?Q?sIArZ94nGQZ6MvNmOaSJU2b89t9s4KI2CrLo9Y2nBYSnEyWHwKXfF/D/Cvl9?=
 =?us-ascii?Q?/PtVyVyD/xk9xrt4NhJubLsj+go6S665yPdmIfnE9ggRUZ1itymtTVfeSdTW?=
 =?us-ascii?Q?tf//oKgoxqbD+t3OyYfHSJz7T/3F1W5sA9Hq7Lhr8iYlbdjGjQ5j2aWD8Dps?=
 =?us-ascii?Q?MERO8CyfBvRUxcHUOCIeF2UxENZUYNmeguvdTfuoxRE4jlR7qNiD1WhVB+JQ?=
 =?us-ascii?Q?RJWLMEEw9KvlUVsYQOqmK9RfE5LMzm1aLUTPCXOJrF6JA579m1FCkJH++XLV?=
 =?us-ascii?Q?mNPvrwx8tNvkaiy+81J7hHB1IVDmnsx+lhm+AseeWM5pA6s5WIq7P7Mn77pV?=
 =?us-ascii?Q?PBveAcldxulPf8yrOcBb6mw046MbUPKGS4yyBg/27ZTDd6d2DF7u3jyl4osK?=
 =?us-ascii?Q?qNHFzVF4OcoY1LYbwS7ZXtn6uF61XZqycSKrMvjkqxKphZt9q8HxbTYP80Hr?=
 =?us-ascii?Q?+882Ou1QLpMACUORue6dza/a9nqjiWhNc+vynLJDtAHNq6lS1wcAxLLg5bwQ?=
 =?us-ascii?Q?hG0XYMORSdmepjFlF8T4EWp4z3jZSY5M4PEC9K5uSVq+iZtXRaK057YdZGX5?=
 =?us-ascii?Q?+uuYh8z5oaAUKA/0jQLtZ+bPs++OF6v71Mz1a4vVcha++bCI0Aywlb/aLTmZ?=
 =?us-ascii?Q?czz5Gzqk32WX6oorva4ZOm9SCsccaDmWckZLOz8s1aHuz9Gb1wvlwBtB6h74?=
 =?us-ascii?Q?1BSy1f3t9adHatcfHrR1w/UN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <33F0E59B582856408D3941AAB6C886F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2861
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d693e6b7-65bd-4428-4176-08d8d7389ad1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1T89p4YaBifA/1AIzx2B1T66pMj1eXCLuSze4OYFTS2RkYm+HLrcuMYmsp98/ABYV8bkwnT+IpKKwksOa+/93uGHuFlLL12CloUPIyz/JUvnJ2tldoK3Cxu6dT7cM0qigCRXuG+l7+oCGao+h/EhPygwY5J8+7LPsxnn0ZtLfjQF6+HNnXqgghS0X8YK3yBIXw652CtaE+qGKSG9sdbFE9amHtUxl+x+cMQol+vcBn0IvhB2GsycRw1TS6OgiltovOgP2o6TJoXrHf4TDfvXR/c2F+cv6KefO55O+XV25NMVfwGHA1pBwp+MC15h6nQ1cZQurFGCa/49/qojeBtqvCuoVdr3qsFkR3C0XIpBOO1wtwYOpMEu38VhydNESsXQzY6/D6DXFYI4t4y31nslmsAFo6Wp+OF7nTGlCiRdIi+p5FViyf7INHz6z9Vw5yfRiIl1BW8GJsqWS+HRuSI9+WRFbyIX+GZinxEEHwIpxlgD4vfyHpJrJ8dgZBb0RYbzOQNfakQ5tbEQ0fI8KwFEIPLgCjS81XatfyTcfD0vOJHVt5cTfN0vt7rYFb+1NS6iDjWP3++8ONdJwTrO9XvAnCPu6jVdluIqOWG6Q8BzgRlugjtYbkloSOS42/7NSwrsa1eCAfAa6c0ZoSrguNn2FBDPBkjY7h3vBqM3CmU+wJs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(36840700001)(46966006)(478600001)(186003)(5660300002)(83380400001)(356005)(4326008)(2616005)(36860700001)(316002)(6486002)(6862004)(33656002)(54906003)(336012)(82740400003)(8936002)(55236004)(86362001)(8676002)(36756003)(6512007)(2906002)(81166007)(70586007)(47076005)(70206006)(6506007)(53546011)(82310400003)(26005)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:49:16.0325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb19402-80b1-41dc-7940-08d8d738a510
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6305

Hi Julien,

> On 22 Feb 2021, at 13:37, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 22/02/2021 11:58, Bertrand Marquis wrote:
>> Hi Julien,
>>> On 20 Feb 2021, at 17:54, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> From: Julien Grall <jgrall@amazon.com>
>>>=20
>>> At the moment, flush_page_to_ram() is both cleaning and invalidate to
>>> PoC the page. However, the cache line can be speculated and pull in the
>>> cache right after as it is part of the direct map.
>> If we go further through this logic maybe all calls to
>> clean_and_invalidate_dcache_va_range could be transformed in a
>> clean_dcache_va_range.
>=20
> Likely yes. But I need to go through them one by one to confirm this is f=
ine to do it (it also depends on the caching attributes used). I have sent =
this one in advance because this was discussed as part of XSA-364.

Ok.

>=20
>>>=20
>>> So it is pointless to try to invalidate the line in the data cache.
>>>=20
>> But what about processors which would not speculate ?
>> Do you expect any performance optimization here ?
>=20
> When invalidating a line, you effectively remove it from the cache. If th=
e page is going to be access a bit after, then you will have to load from t=
he memory (or another cache).
>=20
> With this change, you would only need to re-fetch the line if it wasn't e=
victed by the time it is accessed.
>=20
> The line would be clean, so I would expect the eviction to have less an i=
mpact over re-fetching the memory.

Make sense.

>=20
>> If so it might be good to explain it as I am not quite sure I get it.
>=20
> This change is less about performance and more about unnecessary work.
>=20
> The processor is likely going to be more clever than the developper and t=
he exact numbers will vary depending on how the processor decide to manage =
the cache.
>=20
> In general, we should avoid interferring too much with the cache without =
a good reason to do it.
>=20
> How about the following commit message:
>=20
> "
> At the moment, flush_page_to_ram() is both cleaning and invalidate to
> PoC the page.
>=20
> The goal of flush_page_to_ram() is to prevent corruption when the guest h=
as disabled the cache (the cache line may be dirty) and read the guest to r=
ead previous content.
>=20
> Per this defintion, the invalidating the line is not necessary. So invali=
dating the cache is unnecessary. In fact, it may be counter-productive as t=
he line may be (speculatively) accessed a bit after. So this will incurr an=
 expensive access to the memory.
>=20
> More generally, we should avoid interferring too much with cache. Therefo=
re, flush_page_to_ram() is updated to only clean to PoC the page.
>=20
> The performance impact of this change will depend on your workload/proces=
sor.
> "
>=20

With this as your commit message you can add my:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks for details

Cheers
Bertrand

> --=20
> Julien Grall


