Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9133B062
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 11:52:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97939.185722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLkpb-0005hD-JP; Mon, 15 Mar 2021 10:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97939.185722; Mon, 15 Mar 2021 10:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLkpb-0005go-Fu; Mon, 15 Mar 2021 10:52:15 +0000
Received: by outflank-mailman (input) for mailman id 97939;
 Mon, 15 Mar 2021 10:52:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/z0=IN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lLkpZ-0005gj-Oh
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 10:52:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::628])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3893d09-9167-46e6-a3ad-7966885ed812;
 Mon, 15 Mar 2021 10:52:12 +0000 (UTC)
Received: from AM6P191CA0072.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::49)
 by AM6PR08MB4069.eurprd08.prod.outlook.com (2603:10a6:20b:af::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 10:52:10 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::ea) by AM6P191CA0072.outlook.office365.com
 (2603:10a6:209:7f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 10:52:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 10:52:09 +0000
Received: ("Tessian outbound 520e67c3dd94:v71");
 Mon, 15 Mar 2021 10:52:09 +0000
Received: from 259595590960.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AFB84612-68FB-4149-BDB0-13682B591499.1; 
 Mon, 15 Mar 2021 10:51:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 259595590960.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Mar 2021 10:51:52 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4445.eurprd08.prod.outlook.com (2603:10a6:803:fb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 10:51:49 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 10:51:49 +0000
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
X-Inumbo-ID: d3893d09-9167-46e6-a3ad-7966885ed812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0XzOQVLvAUXQn3ZyykpaVnxCndQp3EHLcUANcPacHc=;
 b=YEke+q5b3zog4GcFmxv5uGKMCgo3UnKAjH0LXDCMNb7LHw8OREnk8oA0eT3YWXGjD07zQOSliJHbuyH6azmb/MPDFdOMVBat1ybEuHEr8mms0JTC6/9SVnX5KlndUnnqr2KxU/uUAZnW7dyItqACM8rsbezOqLv9iVPU59gsqy8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c44be2242d4fff11
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blt5uR2ayGHbPA4glO4P1jqWJ4d05XiWIys7p1TDh5VpeRb1RRcgZmxhhaM//gQN66mZhitjFhhmtH4uptGypegTbJ/DtaZQzjv8Jd99CBmHHvb6GisvBYZZJJGp/g1nB5OjRvP7/V/YPAgci60LOfkXliC+5s0Ecq57y5+sXfx17y3j8wbc97exLENfvzJY6wbje2v/wX/bVr3tuaHDcCEiK1wj17CnYP/W/2zTC01IumsHnB1b4ovQQfIPO7tuJsIFp9digbpp3ksCAF0kF/yRNeM1gQUT7Vs8/GcQ/ZR0uYFOSXIJdNX1QfXanPF7TURvo13KUk8LzS6fZGjPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0XzOQVLvAUXQn3ZyykpaVnxCndQp3EHLcUANcPacHc=;
 b=ikT8kTMW2WImROxRoi/WRA81TI1FRITW3Sav+2eiURSnHiJ8TsN3dBn1GX7UadNrCgjmgV636VzHtYLIwKQ61BmBQGYJIdL0wTujTjBL6KlqecmsFsNI8YoWINh0hMB1ti+HuRg8NOXf3A2vJzb888nrFqUiFGVoXXBUWFV7RPejSNPxFex+1eo46jmhYp5+ZnNUse56yIxPxFHXAyGpXyVyA4D7uQ3nqEFOoWtyktBzVs0wftDKmvm781PlcipfROFMu0kjortZYqHRCuN8sobDLk5KFjuAcs6Op/+PZgSXOrLG8Xu28MTGZziMZ0lRxuzH01h+8UFdiZWwd2M2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0XzOQVLvAUXQn3ZyykpaVnxCndQp3EHLcUANcPacHc=;
 b=YEke+q5b3zog4GcFmxv5uGKMCgo3UnKAjH0LXDCMNb7LHw8OREnk8oA0eT3YWXGjD07zQOSliJHbuyH6azmb/MPDFdOMVBat1ybEuHEr8mms0JTC6/9SVnX5KlndUnnqr2KxU/uUAZnW7dyItqACM8rsbezOqLv9iVPU59gsqy8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15 v2] xen: Bump the minimum version of GCC
 supported to 4.9 for arm32 and 5.1 on arm64
Thread-Topic: [PATCH for-4.15 v2] xen: Bump the minimum version of GCC
 supported to 4.9 for arm32 and 5.1 on arm64
Thread-Index: AQHXGA6vB6atKsiK0Ei5Zy66swOEN6qE4kaA
Date: Mon, 15 Mar 2021 10:51:49 +0000
Message-ID: <DE788076-4138-4493-A5B2-E40ACFC3AC93@arm.com>
References: <20210313134158.24363-1-julien@xen.org>
In-Reply-To: <20210313134158.24363-1-julien@xen.org>
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
X-MS-Office365-Filtering-Correlation-Id: 97fd3115-4c31-4415-1eae-08d8e7a0620f
x-ms-traffictypediagnostic: VI1PR08MB4445:|AM6PR08MB4069:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4069FD149B3020394DA1D71F9D6C9@AM6PR08MB4069.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mJNY9Yt4CB+0zHkT+1X/UNIlAjdr4rFCY7OGoIu9MyP0s2WoL3fLh8Cr8i679Y/vWeqhJ8aiLpnPaCijq9zW854oKy3WXJj9IUr1AkueLqDiIop3Q70MmTj3ZiQ9FxVlnEwJsYoguT8kIjvky0s4j7ZnhdxlVZKntqwAQpG9rSyaCHnWUCviIvk3xlvfkOVoqSdJwe6/XuXBgJb1wHK0Bx61uU4s76t4C2zv8ngsd3+1qbhF2vwdNtgyJe+DtwAFSuQYACAlIQyHqKYhYXvS0sc77Inmoe3MzP5YPfk2/Ii8Q8Aj3k0HBGsNmz2DikKYkPry4ogfm5HA17YE2parXPT1wyNE5eElZG+9EEyJBmyNWn98PHR5FNCzPkgZSBkGrXJABqxSW5fZ3cGC811t+pSdmRvwTi04RJllCd2u+5yXAlnG7l9b4MXsTIa7qV/uzATA/e/gPOR8lnF7pqtIySHWxHYI8KNoHNAJtG4T9upUWH4PEt1hFx9qGFUUPT/FYqyarT4+i0Sy/lDa4+P7JGzTpdrQrdD68Cigq7sojIDimGoTsQvvkA+323PiYPzsc1HWr1v+gRzLyOjpRb/9t8y1bSeZy6Zoc+2f0YftqPaln2fOc2w3Hh+9vbUTmmi/tcKtUgyrOvDVpmqI+45o5co+Y3MHHschspg8P0FpZbafiskEu4c69lfGatBm5PAA/UtplYG9SnpmrME4VnmgPA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(7416002)(33656002)(2616005)(5660300002)(2906002)(83380400001)(4326008)(76116006)(6916009)(6486002)(71200400001)(66946007)(53546011)(66556008)(55236004)(6506007)(8676002)(8936002)(36756003)(86362001)(66476007)(26005)(66446008)(478600001)(316002)(186003)(6512007)(54906003)(91956017)(966005)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?leG63lO/we4kQFapDEBXLNoRKzOsi/KRGIJRq8IYMatN+FtAJrZib+l0RxIh?=
 =?us-ascii?Q?S9gAwPhdJy5TG32vRxpeJVVuY6buh1xQ+o/P9gYmSh+Vlq26rG1OYTAFZWL6?=
 =?us-ascii?Q?VOQ0Y0RTgD+F9J+gwNNa6hGt49LyubHw3r/Nf0aFin36OfCAi+SZv1PotHuJ?=
 =?us-ascii?Q?sSyaIHeMxV6aiMYydiurhc656/ZsvkvkikqW8RDeaOAP+RHCSee3huUHG8DP?=
 =?us-ascii?Q?MJjTmkkriUoIhhWrCGlLlJ3ima26UDCv7AoAXO0FAwv8oVtwio35qx1vausR?=
 =?us-ascii?Q?06IYoUFwHFh/EMJiSMW8Z+I5qGOKq0Auy1b8pD/jR4mYqb3Pix+gv4rhhamh?=
 =?us-ascii?Q?uUwItSAuEjFhbool4Ncn3elERbopm+MKHFP5s2N+X0dIsKk1AREIbHdk3TBc?=
 =?us-ascii?Q?uolXDE4ToRcsELK8zh4rG1m++g/jlqkAMdZ1S7vQOOpDQ0rGBjq64mAH3i16?=
 =?us-ascii?Q?5juhuVqTVsVdq7QqcF0wh81ETlvBFi6M9nUDx0O0nGXjxxNUs/9Yt+sdiIxX?=
 =?us-ascii?Q?dJ3XGpoU32CeL/A/xqLByjPvz12ipujfmdM+4OskT9S/zTOl6TeIkQA+/hRC?=
 =?us-ascii?Q?RsGlb7m8a5I/iNR5KJf5bKXWwOqesxf8sb9EGxZK7lCxxK9tpmQAydTuuxaM?=
 =?us-ascii?Q?4rIi+bTzj+bfsS8EO+1s1Tcqgkfp4G5fYEuWI76DL/QfopSpvQ5YuBgJIDUH?=
 =?us-ascii?Q?HFbl2q0BIqoPSCD/t/AdAGfaDaXb47a1UOkeyUSa3O/5qW13wh9EV/DnyhYP?=
 =?us-ascii?Q?9Lq6y9RrXM0yclTJQ9W5+jkiUFTazzIMQ5vKmAau8YS9h+PH1AlWkVISQfV3?=
 =?us-ascii?Q?sD0n467WskpbOt5siJAhwmej6usBAqdUzmj44cbB4oW79BveZdVfZgf7zph3?=
 =?us-ascii?Q?NWrPX6TaD5g2RimaHULaTOm0eXOqUhDakCAm9rrUfiOKKiouSPjI1Ej8St41?=
 =?us-ascii?Q?H8b00XHsj3qFzl9TPzs/hXWNuNHEar39bhuR5uj0WiIcPnXJvvRumR4t7oIl?=
 =?us-ascii?Q?wemdbAddY/1Cau/jS6lvNkhoaCvn9sSL21QPxR+yTVmmuwwQvTjcf4xHMWwb?=
 =?us-ascii?Q?ijkNRed9Yo6XJ/AnLHPOc3y6xshZwIIuEYDuJ9a7N2CUj5wgY5aXQNJM9qI8?=
 =?us-ascii?Q?+950nmSV/KaxpUE+hAFsa1qJUy2yShAJJqZ4JOsAa20kpae9zWGHHHjM8a4z?=
 =?us-ascii?Q?2k7r9y8LpQaxHmyuqbuwEZcDzBGPsnWC6kLgWyyvKXVbv1cNa94cxSMyA8e3?=
 =?us-ascii?Q?Z85rYPB+lhKc5MY6rbKhobecdHerNcX+XYSW3bWwW69lNa4Rp9OZ/OyMMn+S?=
 =?us-ascii?Q?8TQm5u7Frk0io6JVFEsxcQEn?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <276765872F5F3D4393A3FBA4F4A44B14@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4445
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92d58005-0c1a-4d8c-a0ad-08d8e7a055f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QvelMp/FhN09xOyErEvyQmi/2WFCPN+RtmDhIQ8G0ctvoyroOizcEZ45e5JXh/FHn9IUnOe0DDuKoV95sGuiWxOXkMb/eXEXppy3yoQemQGKFtIIj5Uap69aNceVC3cV4mHIA0gv4nadUjcpXEtZ9xbLy6aRH2znE5zFrD2LH2HX0ke3DPyi4IxupgD8XgeSVnSbELMklvIp8Pas+aCh0XIB0JI0eIT1reUAB0GJFHbVGLjTQK74lyNM7IfSh1mFH/Wn8KfvoSbBWtioBmJuFJaHHfXjndTcQkE/LEECwJVGz+qkMNLin+dwYG0O//WHOIwjjUSGp9dbT+0kuyUprYqQD2obVLe+EO+iHEUT301fDDVdzkwrpoazhCRirtT+fTGq0r+2fM16VVNuLgQjzyvOrVxuQGXSTYO9uELlDJfKI1vFBh1552wFKlaNwdnwYEk8K1jloU6LFYcQx9Z/LEBZ+gQHREPzhqHJrc72Ta+A6dRcG11NRWhcVPJNEE0gkApHhKJFbyadjrYq23v4jibADeEel1Umr60i/FKJRcV908dUCb78wiW/KKbo/VCgNuQKy2XIcd4Mt/MKPpADHQVhNw8HubJY36OQU1iQ5W+4YiZos2gv6r9WMZn2sTJnNJgT84oYBSYWU9vdxuzc8YZl6g7JxQ0BCexHNDlLmVebR6v/svSQNl5fhtsEU66qKGTspWpF6pbrTsRJL35l87M+fMk0KkgxsQGDMR3+Kr0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966006)(36840700001)(336012)(26005)(8676002)(54906003)(70206006)(4326008)(8936002)(36860700001)(86362001)(186003)(5660300002)(6862004)(53546011)(55236004)(6506007)(70586007)(356005)(966005)(6512007)(478600001)(316002)(81166007)(83380400001)(47076005)(36756003)(2906002)(82310400003)(2616005)(82740400003)(33656002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:52:09.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fd3115-4c31-4415-1eae-08d8e7a0620f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4069

Hi Julien,

> On 13 Mar 2021, at 13:41, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Compilers older than 4.8 have known codegen issues which can lead to
> silent miscompilation:
>=20
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D58145
>=20
> Furthermore, pre-4.9 GCC have known bugs (including things like
> internal compiler errors on Arm) which would require workaround (I
> haven't checked if we have any in Xen).
>=20
> The minimum version of GCC to build the hypervisor on arm is now
> raised to 4.9.
>=20
> In addition to that, on arm64, GCC version >=3D 4.9 and < 5.1 have been
> shown to emit memory references beyond the stack pointer, resulting in
> memory corruption if an interrupt is taken after the stack pointer has
> been adjusted but before the reference has been executed.
>=20
> Therefore, the minimum for arm64 is raised to 5.1.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


>=20
> ---
>=20
> This patch is candidate to 4.15 and backport.
>=20
> This is only a build change and will be low-risk for anyone using newer
> compiler (5.1+ for arm64 and 4.9+ for arm32). Xen will stop building
> for anyone using older compiler. But it is better than fighting
> with codegen issues.
>=20
> Changes in v2:
>    - Only bump the GCC version for Arm.
> ---
> README                     |  7 +++++--
> xen/include/xen/compiler.h | 10 ++++++++++
> 2 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/README b/README
> index 8c99c30986c1..aa8b4fe126a8 100644
> --- a/README
> +++ b/README
> @@ -42,8 +42,11 @@ provided by your OS distributor:
>         - GNU Binutils 2.16.91.0.5 or later
>         or
>         - Clang/LLVM 3.5 or later
> -      - For ARM:
> -        - GCC 4.8 or later
> +      - For ARM 32-bit:
> +        - GCC 4.9 or later
> +        - GNU Binutils 2.24 or later
> +      - For ARM 64-bit:
> +        - GCC 5.1 or later
>         - GNU Binutils 2.24 or later
>     * Development install of zlib (e.g., zlib-dev)
>     * Development install of Python 2.6 or later (e.g., python-dev)
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index 0ec0b4698ea7..17cf00e1ec92 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -3,6 +3,16 @@
>=20
> #if !defined(__GNUC__) || (__GNUC__ < 4)
> #error Sorry, your compiler is too old/not recognized.
> +#elif CONFIG_CC_IS_GCC
> +# if defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900
> +#  error Sorry, your version of GCC is too old - please use 4.9 or newer=
.
> +# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
> +/*
> + * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D63293
> + * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> + */
> +#  error Sorry, your version of GCC is too old - please use 5.1 or newer=
.
> +# endif
> #endif
>=20
> #define barrier()     __asm__ __volatile__("": : :"memory")
> --=20
> 2.17.1
>=20


