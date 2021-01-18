Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD92FA4CC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69760.125009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WWg-0003Jn-Qm; Mon, 18 Jan 2021 15:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69760.125009; Mon, 18 Jan 2021 15:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WWg-0003JO-NU; Mon, 18 Jan 2021 15:33:06 +0000
Received: by outflank-mailman (input) for mailman id 69760;
 Mon, 18 Jan 2021 15:33:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECrn=GV=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l1WWf-0003JF-9I
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:33:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [52.100.19.23]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdaf88b3-2e2d-4b23-8bc9-12ca4413d6a6;
 Mon, 18 Jan 2021 15:33:02 +0000 (UTC)
Received: from AM6PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:20b:6e::21)
 by VI1PR0802MB2510.eurprd08.prod.outlook.com (2603:10a6:800:ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 15:33:00 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::c4) by AM6PR02CA0008.outlook.office365.com
 (2603:10a6:20b:6e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Mon, 18 Jan 2021 15:33:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Mon, 18 Jan 2021 15:33:00 +0000
Received: ("Tessian outbound f362b81824dc:v71");
 Mon, 18 Jan 2021 15:32:59 +0000
Received: from 7c0a75c83102.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66EC856F-D3D9-4800-B93F-8289712F097E.1; 
 Mon, 18 Jan 2021 15:32:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c0a75c83102.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jan 2021 15:32:52 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB4027.eurprd08.prod.outlook.com (2603:10a6:10:a7::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Mon, 18 Jan
 2021 15:32:50 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 15:32:50 +0000
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
X-Inumbo-ID: cdaf88b3-2e2d-4b23-8bc9-12ca4413d6a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9IV17zDZ3uWL9C1HTgT5oVAx4b3rKnMV9VVqEWS0l8=;
 b=fuB6Im/6QEK+kDW819IQFKW2wS/HOXU/3QLp1bLC4VAm7L10cAjZtPVf3Zk64LdrBE33txzXhWKBNt/BoJp9RcQaWEBCjSo2EdDTD0u4TtnBhXo0mWFhUFMp0Ug1EWYtqt1+jDRJY7PCNZig+6cYBuWE/M2mpwDXshjx7hf7OJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d54b796ac753844
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NM3GDaKYbJMwqIo59d9ctt1BbmOvvpCUTP6NSJtTZIMDR54kKLnkL2sNkFLVX64zrtDBGxJ7wuh0/qrwoP+sMZk3Gnrybry9yoO2WT5M8r2kHxWrao1dQT/+cLxsVW/UzFMNVA4YKIhKaBRkUb2d1Bh14+9TLMex0J/GCJTvqka5m+GrsaNRbUBdzuRqSOM2oXdXrtWLooT0k3VdqOI0w84RvCvZtlp9lgiUvvxFWTMuToeJkCe9HAaTcqXFJ5gB3UhAABcwoiMZbEZWuo4sbTwJGhgaF8yn8chmkUOxqchbrfbUnFL6/bKLWuW3L+tFS48D/3QZir7FKwla+jNJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9IV17zDZ3uWL9C1HTgT5oVAx4b3rKnMV9VVqEWS0l8=;
 b=WwScBb1q8xpL1DieaO+u9SfxoYKpDsmGaObURKfjc7+u+fKaxfez2smu4Rb3f9fFbt5A2oPQ9i5uASzqR9kx+h2I2SAbXn0YS4NNUSXnu9cOuIrIyGXD6lnTe5xWS/Gvn2BR1lymLfs40Wxwh73eXfWNFUNKSQ+L7ZtrX2F2wV80hrDP14bfKuSC5+jHeEKg64LhuLHjjw+hMgIXl6uF/gY/5t0n4l+wq1JhH1Hh8IxpoVrmqDO40/PC5esFQtU9KnjM/se01Vuw7DnlvEUNjRxAagQWfw11SiqNUVlXTGBB3To3Y1Cc3cA92/RGFpbrPKkKC5wVW5VpgGayYU3KfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9IV17zDZ3uWL9C1HTgT5oVAx4b3rKnMV9VVqEWS0l8=;
 b=fuB6Im/6QEK+kDW819IQFKW2wS/HOXU/3QLp1bLC4VAm7L10cAjZtPVf3Zk64LdrBE33txzXhWKBNt/BoJp9RcQaWEBCjSo2EdDTD0u4TtnBhXo0mWFhUFMp0Ug1EWYtqt1+jDRJY7PCNZig+6cYBuWE/M2mpwDXshjx7hf7OJE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 07/11] xen/arm: bitops: Implement a ffsll function
Thread-Topic: [PATCH v4 07/11] xen/arm: bitops: Implement a ffsll function
Thread-Index: AQHW5c2vjMAKQ6hzhEO4om3zctrksqoopM6AgATt8YA=
Date: Mon, 18 Jan 2021 15:32:50 +0000
Message-ID: <A774E485-7DD6-4D6C-8753-7B8C1C33CCA0@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <7c0410f150d78bae49c1d8ae0d918b56c2b0c7de.1610115608.git.rahul.singh@arm.com>
 <0dc36eca-9fec-2e1d-7904-137b427a74bb@xen.org>
In-Reply-To: <0dc36eca-9fec-2e1d-7904-137b427a74bb@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79c6a33d-3ad3-43f4-f336-08d8bbc65685
x-ms-traffictypediagnostic: DB8PR08MB4027:|VI1PR0802MB2510:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2510520BBF1905ECCD39C70FFCA40@VI1PR0802MB2510.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ioxOrOxN4STGTtAIgaGECx/jjISRmg+uO/7lHNo5UTguHxt2Bi4VP6LofnDIIxghc9QyTN/oSntj1qpV5FKU7JOhT4FZWWKsTcyopq8Pc8/Zx8ei6Yr/sBY8HgrTzONS/Sl5/jTJt0VmF68cAW5ennTlL6sf5Ghs1RzvnEDtGW6ADuZxD0/qncXeTHE+41Y2SNbXk1h0RjIfmwx3wGv8dUHdwT8LxshVTFzDRKHoR+Hl5+ZZXgTQ+l185qJKNFib5P7j9n8s6iPfhwanzzkqvpvUtRY4DKmIHv/jUJxYlFN83ruZmFg7PJn14SrCJf5TS/GyYdZdwvR/aL7vR01L1PyMZy6uNL2WEGBKi1tT/0PaLdEj/t58JbI86/g7qMmxkYNqIIXQ+OxptcQReS7sFojsoRlsYMZoCi/VQACtLWkNcPu2AGGsCUKRqQMGN2AStWXQ62iG2lACIxhHsrQCcJX+CLdsIKEF85VDJ2zjHn7KXtCfWOttNi1PV9f1TPqkV0vpFPqUT7xHZ5ODeqwvKq+Eg/BdsrjmFk+Pie+upw4KeOUPX/dLUroXjwl3mknWqMgwtgq85LTH9+3mcrS5gg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(91956017)(53546011)(6506007)(5660300002)(66556008)(66446008)(64756008)(66476007)(76116006)(26005)(186003)(66946007)(86362001)(478600001)(6916009)(2616005)(8676002)(8936002)(4326008)(6486002)(2906002)(33656002)(316002)(71200400001)(6512007)(36756003)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?EHelLILBsyg5JrY4Gy7Ptp7cgnR7KO3ao4a4/sG77qFKJw080HanR+FPqg5V?=
 =?us-ascii?Q?Lby6lT+IuTcjXWoGFuMw2CAdg6Icf2J1TeZowt290N0fhf+Pm1ZHm/fjL7vP?=
 =?us-ascii?Q?Jbaj1LajwGjs3s+OxrRWE2nrV0eFJYb0Bpi+sNWu3O9jPYD6bQAlHjml9p4N?=
 =?us-ascii?Q?mJh2TtLwUzpBwOXqoeTA/2YLjmOojQ/brrIxTtZ8GTeCqhUTeSLn+4URtF57?=
 =?us-ascii?Q?eDCo9Xsx/WRAO6TXAOnVItYjUKuLpwQbYa2kG6RG5C1+voCUO8TaXH6RspE7?=
 =?us-ascii?Q?AQEDs5SVlYpBWfh4kbsrKVjzPtFl7G+5vWk+H9PyyKD1Ss+52+CYRJgyjfYG?=
 =?us-ascii?Q?zA2pTETRdP4lSYI/V5IBJHBMdzgImN1Cvs37Dl612SZgL/V+n4ajVPKMJcjg?=
 =?us-ascii?Q?6xcx9ooiDRKMfk3MLiZvCjjoSlKA1inKKVq/x3qRHNHT0bRgvhQwa7q39Lrs?=
 =?us-ascii?Q?18XvAjusSxwPaiic84LOKlK8bbX5TGY/F5P7U7OncrrCkN3ufvcWLXa6PjKc?=
 =?us-ascii?Q?Kpzm2/WoREan46qgPH3hZzO/CZKuA7K/8YEZOTiypLnXMaY/fkVs+fTSpQj9?=
 =?us-ascii?Q?th61e5JaHe1UW8fL6A+NTunha9h3DH1WlBgoRVdF6kuFu3TVsVYMcT4gPDbu?=
 =?us-ascii?Q?rdeGIa45RiEoMAMy99qB6JeYFceqqv5LSvs7S4KL3PT77T71RHnFLftjc+HG?=
 =?us-ascii?Q?/Z+yKWhYeeDV3WGz7lM6mQnN6pkXXLs8PbjbWvzUPCPP1oQ4U93RuXTZoSJ3?=
 =?us-ascii?Q?TjRPALtMtp9WQ/6fuuaKIy602MgYQJtm+VlQAjUakCSirAMEBnlswKIm2Cvc?=
 =?us-ascii?Q?P/+/aquaOl9ux3reRQzgT7Righ6XHhkoA2fvQdiZkwtYyfNY6Sx7pE6BRiy0?=
 =?us-ascii?Q?Be0Jdz0xKfFuv5pTMCFb53Oldml8iJ9gZfVYQd29psfPIVg06dgSqdGRCu9M?=
 =?us-ascii?Q?E0gudmy74PXzIyuuYkLT6xGUbGlDBHjYVvbFXJGkfWCvyCt0aWlZXVY+5NNG?=
 =?us-ascii?Q?VgX9kfotpSaWYk9ji9ZHZRmEDmw33R4pd87NV1Tdy5F4tYQFkyAf3eFPodRn?=
 =?us-ascii?Q?OC7ai+b8?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F8A612CF0D1C4E4292BF1A9227B01BAF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4027
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2518568b-8627-48d7-491a-08d8bbc65085
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7y0YQLPUlXkSu1oOxqNU4RkjmuF0NuxEL94dZYf2T07hBLk3lAV8qECTL0XYnCIQWrAofAvJUP1GMkW5EgfgqGuEAUpgPRf4tP7vd9GhRITJFhJhUg/L0oGYzbU2M9VTQKwYFXGluCU4ygreUehXsQa3JTEXRZeu3a0zJTyFYxQUujB2mt+Zy+q/lgk6uNkO26/ArJROpxvJbaxV6LPC161O1D8w6bxAr/vNg2xBGa/5Yw+iNhonyK2AZJ+Bz4+h0IIH5cwnen4dGSbpai9SB32r9ganht7lSUiu9sIH7bMGzKAxMZZFt6FMrD5ciKNW9Bfglu+AoVzzoh8rmpaYDuJQLnFH/f/hieLeIvxireR09c7kmPAy/AlR/c5wNZxg+rzPLBebjCTjwakAwNMXBHhDiL4QYpjTckC3sQWkI31+FN+RqPw/ZqczzO1+dbsxKwYjQN1dxXFV3IzlSGGjYOw2cxQzD7hYuMuZmtPhTcWORhfm0BgeTfT6LQAJbInywBj9uDYxFTpvxcUqt8Md9dZ0xPdcgTshUTCUDbbDQkCqb/M7IGd1v++3QfaryPF5W0Lv6foVfSWrwOlk4NefmQgr3+rUQfXJF6gbDQ0MdKI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(8676002)(33656002)(316002)(6506007)(4326008)(8936002)(2616005)(82740400003)(336012)(70586007)(47076005)(54906003)(53546011)(478600001)(26005)(86362001)(5660300002)(186003)(70206006)(107886003)(2906002)(6486002)(81166007)(6512007)(34010700045)(356005)(36756003)(82310400003)(6862004);DIR:OUT;SFP:1501;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 15:33:00.1133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c6a33d-3ad3-43f4-f336-08d8bbc65685
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2510

Hello Julien,

> On 15 Jan 2021, at 12:16 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 08/01/2021 14:46, Rahul Singh wrote:
>> Implement the ffsll based on built-in function "__builtin_ffsll()"
>> ffsll will return one plus the index of the least significant 1-bit in
>> doublewords or if doublewords is zero, returns zero.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in V4:
>>  - This patch is introduce in this verison.
>> ---
>>  xen/include/asm-arm/bitops.h | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>> diff --git a/xen/include/asm-arm/bitops.h b/xen/include/asm-arm/bitops.h
>> index 71ae14cab3..7f83ee1828 100644
>> --- a/xen/include/asm-arm/bitops.h
>> +++ b/xen/include/asm-arm/bitops.h
>> @@ -170,6 +170,18 @@ static inline unsigned int find_first_set_bit(unsig=
ned long word)
>>          return ffsl(word) - 1;
>>  }
>>  +/**
>> + * ffsll - find the first least significant set bit
>> + * @doubleword: double word to search
>> + *
>> + * Returns one plus the index of the least significant 1-bit in @double=
word
>> + * or if doubleword is zero, returns zero.
>> + */
>> +static inline int ffsll(long long doubleword)
>=20
> If I am not mistaken, we already have an helper doing exactly the same (s=
ee ffs64() in xen/bitops.h).
>=20
> Can you check if it is effectively the case and use it?

I checked we can use the ffs64() for SMMUv3 driver as it is doing exactly t=
he same as ffsll().
I will modify the code to use the ffs64() in place of ffsll().

Regards,
Rahul
>=20
> Cheers,
>=20
> --=20
> Julien Grall


