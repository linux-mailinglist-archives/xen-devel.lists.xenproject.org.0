Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7B338747B
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 10:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128948.242049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1livYI-00086i-Fh; Tue, 18 May 2021 08:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128948.242049; Tue, 18 May 2021 08:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1livYI-00083z-CZ; Tue, 18 May 2021 08:58:10 +0000
Received: by outflank-mailman (input) for mailman id 128948;
 Tue, 18 May 2021 08:58:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1livYH-00083t-1m
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 08:58:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06af0c4f-e17a-483a-9d7b-fdd9c496cddb;
 Tue, 18 May 2021 08:58:07 +0000 (UTC)
Received: from DB6PR1001CA0045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::31)
 by PAXPR08MB6751.eurprd08.prod.outlook.com (2603:10a6:102:136::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 08:58:05 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::54) by DB6PR1001CA0045.outlook.office365.com
 (2603:10a6:4:55::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 08:58:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 08:58:04 +0000
Received: ("Tessian outbound 3c287b285c95:v92");
 Tue, 18 May 2021 08:58:04 +0000
Received: from 2406e40d8dcc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC28B092-8DE2-4931-AF26-B91F9EED2F6F.1; 
 Tue, 18 May 2021 08:57:59 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2406e40d8dcc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 08:57:59 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB5616.eurprd08.prod.outlook.com (2603:10a6:800:1a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 08:57:56 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 08:57:56 +0000
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
X-Inumbo-ID: 06af0c4f-e17a-483a-9d7b-fdd9c496cddb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIudVAO9QCkK7W0L6n9pcEes+ogSsARVdoirSSecxg0=;
 b=MJJMW1O+kudhqBmGYSwWvFJugPGIxTCRPYm0X5j29/3Y2UWDcLPYVr63/cUhZQHNxx988bqZyi/EgFdDwN5T2Qr36lHgAPzcc3O+75oVZ+LU4yyfL4p+t9SVDHaU/COkOxvpqHETItN+PdbS6dJbzQmC+gyJ/w665bEPy9dUxNg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b13cvZZqvgU8GELv+TafYpGXW7fHdmVgGJJsWcO+m3UQLTFk708dw1H5/aZo0HZHxbXTFk5pC/nSPtdUQkBFXXr+xcT5mJkYxfWPt+jlWW2pYzEtJprHg7srTnWVBQRjIDIl6N+XQSJhnetR5wdfLw23/K4cKJNAdsd0anHeq3ZD9mQZ+OKS6+PmsGXF1sGud7fuafOmJKfo302UjiYD8zbOls3Tp+twRpH0vOOUA57SXcrAZjDjrWvFtXifXe0jthnDWsleIGPLwG5KxpUbgUzLXM3r5TkZvXTqh55lGhEeVTemVaOFjLhsVfwre3PNInuP5YQWjnDZBtP0/roc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIudVAO9QCkK7W0L6n9pcEes+ogSsARVdoirSSecxg0=;
 b=VS8tOm6VTh1Sjt6Bdm/NIo3XoS8VIUCVwCPOJvCIA6d+Ghretz+KOb5z2TCtzUrn8U4gQTbA6gvGlGw/qY9JEFctw6H2lWTY6znk1D4esjGwQ1eQa+QbeZROQlNR5cup/A7ArM/3kuPsvhjrDj3VXII81ICmTgVQDrlnv2KEZa6YLwZjzq9X59S1FTxHVuxDzv2J0S9hQ2gr+rwHxX4xguuhMT5Ud2fGC6UJi0etQltqKNwulbmCljs+PzERJEJzKNA5gYYDTNryxTXJZYb8sYk7scaUznR8jLUsxyuOjA/IIijWVW2nd2F74Sr0mRnPNS3YhZxxAlA7OKEsZwN3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIudVAO9QCkK7W0L6n9pcEes+ogSsARVdoirSSecxg0=;
 b=MJJMW1O+kudhqBmGYSwWvFJugPGIxTCRPYm0X5j29/3Y2UWDcLPYVr63/cUhZQHNxx988bqZyi/EgFdDwN5T2Qr36lHgAPzcc3O+75oVZ+LU4yyfL4p+t9SVDHaU/COkOxvpqHETItN+PdbS6dJbzQmC+gyJ/w665bEPy9dUxNg=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Topic: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Index: AQHXS6W/k/joZEkeaUiDjrfYH3jVEaro2ToAgAAR3sA=
Date: Tue, 18 May 2021 08:57:55 +0000
Message-ID:
 <VE1PR08MB521528492991FDFC87AC361BF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
 <7e4706dc-70ea-4dc9-3d70-f07396b462d8@suse.com>
In-Reply-To: <7e4706dc-70ea-4dc9-3d70-f07396b462d8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EDF81ACCB07B0F4184A6B29E9B8B3D72.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 50ab0eab-01e8-431e-f84a-08d919db0c83
x-ms-traffictypediagnostic: VE1PR08MB5616:|PAXPR08MB6751:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB675155C4F58AD3441F32D8E6F72C9@PAXPR08MB6751.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j+tu6uVVYALSzqOocqRNKx28vbpkZ/azerXvo6JXniwVYq6PPXMPS8twLm52oZeG4MW4qExZ7IsX5BWJfJ7HURu/vIxEaNwIVAFzvP1lx1joftoRLczdMUqLVTdI42LKbvzJepQIKH5za1ViFpRk7gbdw0ws3MwMM6FGEEBwQOK7sU6Dt947nJTKAbEZmKbGeqGtHEs+xMgvgwBaZ1/kwpC5cGtTothtk7350FYdOr/JrwRMwCC7QXQU3lQIsO4MN4OyDJEhlPW1I/Op9X+ygMIcfjbacjnxp+9mVSaYhGds4hJocxxWuTq9tXaAuAolvlcR+7jNL0CmcLo3fLorOM6M08GwGVftLfr74Syr2Hli5CCtmNYJbrch00BN83eiYAPWz6z1B0cQ0v1YpHPBjYevwf/GclkcWZNUVxFfG263AVqNNhFl7BfJ1cQDnWxqdZ8czrtCkq7mSvJ+XbCYy6Xy02jws/rXXEbJBzoWM2V/OSh65pqWcYulWx0uelajpluVWpQFdUAh4OC9lNYhTkRmLCo7/UhwWBUmHkCdi8evigeqlKURY905iJBEX0L9rt1V5nrVYMiTfwLk99IIXV5G3fl7/nA/gyuGR5Ivl3g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(83380400001)(8676002)(122000001)(6506007)(53546011)(52536014)(9686003)(5660300002)(478600001)(6916009)(7696005)(38100700002)(33656002)(86362001)(26005)(71200400001)(2906002)(55016002)(76116006)(66476007)(66446008)(66946007)(64756008)(66556008)(316002)(186003)(4326008)(54906003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?Y1dQazN6c2pBU201Qk9KM1BQYmYyak92MVAwRTF4bGlta3drNmxjdnRZc1VM?=
 =?utf-8?B?T1ZjOGFRYi9aeTlrKzVjUzEyN29MSWJ5MFhrQVQrODVtL0pPZU9xaXVQNUZn?=
 =?utf-8?B?dDRvQXpTUGgyMEtIL2cralB1TVg3RVpxVzZBbnZnUk84bFcvOEpCdDZOK1NG?=
 =?utf-8?B?dkxSaUhVVEY3c053dkhNSVJSQzJwVXdJYlBVWUt1WENrNTYzWTFjZ1NWUmlN?=
 =?utf-8?B?MUJxNnUxOFRPTjl1VFJoUzcrZXJBRXNFblRrSmJxNy8wdXRiSEIwQVVmUWln?=
 =?utf-8?B?S1RyTjBNYk9ORDNVT2FTRFpocFdXNUd4N3R3VEdIT2lrU0J1cTc0SXRKckty?=
 =?utf-8?B?K2ZsRVJ2dDNXU3ZVNmlRa3pUWWlDU1F6ZDZXOHBpWGVremZjNXMxaGtZb3pM?=
 =?utf-8?B?VTd4NzBrZW1GYTZzTXFSZlI5Rmw0dkpxY0lvNndQNDVkeTNaSEl2QWRDbE1Q?=
 =?utf-8?B?bll5SjlxTGlLNFdVVVpwVWRFY1pMZkV2Yk0yTkFPZlpwYmNDQnlHWFZtR2pU?=
 =?utf-8?B?bFB5NDRDcWlaR2g0aHViWkVKMEJFemRxK1FxYzhsanhwdXk0WmJuUnovWkk4?=
 =?utf-8?B?TUZTUCt2MmRBZEZvZUZFbVlveDVGQUhmd1FCcUorVTltN2I5UFFkSjFvOSts?=
 =?utf-8?B?YXpQMTJmbUpIOHJrSTBRamFBR3FiYkxSS2VCVTdsTm1QMkhnMGZ0ZVRzcElp?=
 =?utf-8?B?MmNwbVByNUU4eTVTZjlOMW1jNXUvSC9tQWtnaWpWeVVhbUw2Mm0wU0h1T0Zt?=
 =?utf-8?B?alhJdkY5OEdXWGhObHVFankxOEliUktoUHhUNDE2K014a2QwQ2RCL05Qd01H?=
 =?utf-8?B?VXpIM2RKckhaazE5MjcyYStvK0c3QzMwNW9Db25UYW81M0dqdmtkUGs5TGx6?=
 =?utf-8?B?bWM2MUY3Vmp6SHByemdsY3Vrc2FrMUJBTDFYeE9XTDk3dHFHVHNqUzVaWllK?=
 =?utf-8?B?TWZTMzZyMS92YkpubTg0ZjlNL2FJT0V2Rm1PQ0ZRbmYxTTNkN21SV0hSY3pD?=
 =?utf-8?B?ZEUzTU9UR3dSR2U5WTlPaXBMZlBKRWVRQVVaS21Od2lJSlZmcmNuR1BQYXVL?=
 =?utf-8?B?bmFuUE5LNm5tV29Ga0xXL0F5aWErSVV4azIyUXVqNjJrVG5OS3hSNzdDNlVC?=
 =?utf-8?B?MlNPd2RnUTFXUEdxckdMWnpQdWR2VEE5TWZNdllPWTExU1lzVnRjbjFsek84?=
 =?utf-8?B?RGQrazFZNWN2ZDdVV3JUQnFKT1ZBV1dwVkJObzFiTGxBWmdGMGU1Smdqa0x5?=
 =?utf-8?B?T0Z6UU1OZHd4U1JULzU5K1NvaDR1Vi9waEJlMXhxRmFlbi82Z3Z4MlZXbzI0?=
 =?utf-8?B?WkI2MEZVeTBpVjhDOFBNNVBnVGtPbEwwQ3Uxa2MxU1M5N3ozLy8yNE1aYk0x?=
 =?utf-8?B?UnZXNGNzSVlIa3pyLzRMZnNLT3VSVy9yamFuRXlsZVluU2JrNlYxdm9GNjlk?=
 =?utf-8?B?dGE4VS84eno5Tm1EQzI3dzdNYUVWUW1ZRHczSzNzSm5qMUlZcHdCWittTDlF?=
 =?utf-8?B?aE9ZbVBoWEZzTWtuYWQvdjZtVElORkdqTUw1TWY1NG9qeGdhc0FVYUJvU29R?=
 =?utf-8?B?TEx4TXJ1ajBzZVNxcWVnRmhwQ1F5SVk0YmRrbjMvV0dTYkxGYjVtN1lHS3lq?=
 =?utf-8?B?SGFyUDcvN3lvYWlRN0tud0RrclcvWE1ZSFVyN05BSk5BdEkyTDZ4d3JRanpn?=
 =?utf-8?B?NEtWMDNyNzNRNHZ3ZjJ6c1B3L2V3cTlHL1d4enNGOUUwNTh5Z0pXby8zM3ZJ?=
 =?utf-8?Q?3m3RJu3VQa76ESJWN93gMwTG5H/rM7dzFZfzrvt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5616
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	802aec0f-bbe5-4152-44d9-08d919db0745
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U0KvjyTawWd7YuDZY3nPsxVbEZZTmz0Jm6U/X+wh0U4TmFYwPTSFSxSZfmfY9QTdXUKXrGNkloOMGtVl5PeLCbiVXEYQQjRpkDAIP0VMh/ox7cnrLdVY1g4wzdpVWTnjQ1fTshyy9m7xzQrc+S4soQqIiny/w7Or/hVOarGI19fz0hV9dQg15FAaLVcO9+h8rMFtLm9+8MsGI4Os7P9EXgB0pgKXufj2OGHhzbv8IMVqTnjbf7AYorhP3kXv6lz09RGDEyRpiT41PxcrsrzVkdRiVyGDPmlOkvdEonJs8YjuNpLy+i12/B2cKfXs4VbQ3Bw9GUNDeXUUPui+8WKnSThpi2jtXBj47SqMVqt26IlIIzwt6lWvI8D5RiQY3QiisEHWsc5SY16KEVWqEgXskl5hLC4AM7DjtRFXI53oUIshNdNROxvKy7sAZuKjAySqkunDVkVc4mJIKbLoEAhxO8O2ldH0gzDMH99e7vQRk1Z73t3gwZKSgXlr2AoMn/WghsPlDQ9QFLMJswiFqEQuPgOJxE874M8CFBFt198BiSfV9c0gPLuiiZF2BXxGLmL2B++jDPrNODn9mIBmo5uEVZwtS262ki3PyLGo44y6FCx+qSG0EfbfH6XhZduu7Z0uYEZ+pkLiq+jdYavLJvk5peLRNgctFFMFw0/Bwto4tRs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(36840700001)(316002)(83380400001)(33656002)(7696005)(82740400003)(70206006)(53546011)(6862004)(86362001)(478600001)(70586007)(52536014)(36860700001)(6506007)(8676002)(336012)(186003)(55016002)(8936002)(81166007)(9686003)(47076005)(2906002)(356005)(54906003)(4326008)(26005)(82310400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 08:58:04.8078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ab0eab-01e8-431e-f84a-08d919db0c83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6751

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTgsIDIwMjEgMzoz
NSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2Vp
LkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDA3LzEwXSB4ZW4vYXJtOiBpbnRydWR1Y2UgYWxsb2NfZG9tc3RhdGlj
X3BhZ2VzDQo+IA0KPiBPbiAxOC4wNS4yMDIxIDA3OjIxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4g
PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jDQo+ID4gQEAgLTI0NDcsNiArMjQ0Nyw5IEBAIGludCBhc3NpZ25fcGFnZXMoDQo+
ID4gICAgICB7DQo+ID4gICAgICAgICAgQVNTRVJUKHBhZ2VfZ2V0X293bmVyKCZwZ1tpXSkgPT0g
TlVMTCk7DQo+ID4gICAgICAgICAgcGFnZV9zZXRfb3duZXIoJnBnW2ldLCBkKTsNCj4gPiArICAg
ICAgICAvKiB1c2UgcGFnZV9zZXRfcmVzZXJ2ZWRfb3duZXIgdG8gc2V0IGl0cyByZXNlcnZlZCBk
b21haW4gb3duZXIuDQo+ICovDQo+ID4gKyAgICAgICAgaWYgKCAocGdbaV0uY291bnRfaW5mbyAm
IFBHQ19yZXNlcnZlZCkgKQ0KPiA+ICsgICAgICAgICAgICBwYWdlX3NldF9yZXNlcnZlZF9vd25l
cigmcGdbaV0sIGQpOw0KPiANCj4gTm93IHRoaXMgaXMgcHV6emxpbmc6IFdoYXQncyB0aGUgcG9p
bnQgb2Ygc2V0dGluZyB0d28gb3duZXIgZmllbGRzIHRvIHRoZSBzYW1lDQo+IHZhbHVlPyBJIGFs
c28gZG9uJ3QgcmVjYWxsIHlvdSBoYXZpbmcgaW50cm9kdWNlZA0KPiBwYWdlX3NldF9yZXNlcnZl
ZF9vd25lcigpIGZvciB4ODYsIHNvIGhvdyBpcyB0aGlzIGdvaW5nIHRvIGJ1aWxkIHRoZXJlPw0K
PiANCg0KVGhhbmtzIGZvciBwb2ludGluZyBvdXQgdGhhdCBpdCB3aWxsIGZhaWwgb24geDg2Lg0K
QXMgZm9yIHRoZSBzYW1lIHZhbHVlLCBzdXJlLCBJIHNoYWxsIGNoYW5nZSBpdCB0byBkb21pZF90
IGRvbWlkIHRvIHJlY29yZCBpdHMgcmVzZXJ2ZWQgb3duZXIuDQpPbmx5IGRvbWlkIGlzIGVub3Vn
aCBmb3IgZGlmZmVyZW50aWF0ZS4gDQpBbmQgZXZlbiB3aGVuIGRvbWFpbiBnZXQgcmVib290ZWQs
IHN0cnVjdCBkb21haW4gbWF5IGJlIGRlc3Ryb3llZCwgYnV0IGRvbWlkIHdpbGwgc3RheXMNClRo
ZSBzYW1lLg0KTWFqb3IgdXNlciBjYXNlcyBmb3IgZG9tYWluIG9uIHN0YXRpYyBhbGxvY2F0aW9u
IGFyZSByZWZlcnJpbmcgdG8gdGhlIHdob2xlIHN5c3RlbSBhcmUgc3RhdGljLA0KTm8gcnVudGlt
ZSBjcmVhdGlvbi4NCg0KPiA+IEBAIC0yNTA5LDYgKzI1MTIsNTYgQEAgc3RydWN0IHBhZ2VfaW5m
byAqYWxsb2NfZG9taGVhcF9wYWdlcygNCj4gPiAgICAgIHJldHVybiBwZzsNCj4gPiAgfQ0KPiA+
DQo+ID4gKy8qDQo+ID4gKyAqIEFsbG9jYXRlIG5yX3BmbnMgY29udGlndW91cyBwYWdlcywgc3Rh
cnRpbmcgYXQgI3N0YXJ0LCBvZiBzdGF0aWMNCj4gPiArbWVtb3J5LA0KPiA+ICsgKiB0aGVuIGFz
c2lnbiB0aGVtIHRvIG9uZSBzcGVjaWZpYyBkb21haW4gI2QuDQo+ID4gKyAqIEl0IGlzIHRoZSBl
cXVpdmFsZW50IG9mIGFsbG9jX2RvbWhlYXBfcGFnZXMgZm9yIHN0YXRpYyBtZW1vcnkuDQo+ID4g
KyAqLw0KPiA+ICtzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19kb21zdGF0aWNfcGFnZXMoDQo+ID4g
KyAgICAgICAgc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBucl9wZm5zLCBwYWRkcl90
IHN0YXJ0LA0KPiA+ICsgICAgICAgIHVuc2lnbmVkIGludCBtZW1mbGFncykNCj4gPiArew0KPiA+
ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcgPSBOVUxMOw0KPiA+ICsgICAgdW5zaWduZWQgbG9u
ZyBkbWFfc2l6ZTsNCj4gPiArDQo+ID4gKyAgICBBU1NFUlQoIWluX2lycSgpKTsNCj4gPiArDQo+
ID4gKyAgICBpZiAoIG1lbWZsYWdzICYgTUVNRl9ub19vd25lciApDQo+ID4gKyAgICAgICAgbWVt
ZmxhZ3MgfD0gTUVNRl9ub19yZWZjb3VudDsNCj4gPiArDQo+ID4gKyAgICBpZiAoICFkbWFfYml0
c2l6ZSApDQo+ID4gKyAgICAgICAgbWVtZmxhZ3MgJj0gfk1FTUZfbm9fZG1hOw0KPiA+ICsgICAg
ZWxzZQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGRtYV9zaXplID0gMXVsIDw8IGJpdHNfdG9f
em9uZShkbWFfYml0c2l6ZSk7DQo+ID4gKyAgICAgICAgLyogU3RhcnRpbmcgYWRkcmVzcyBzaGFs
bCBtZWV0IHRoZSBETUEgbGltaXRhdGlvbi4gKi8NCj4gPiArICAgICAgICBpZiAoIGRtYV9zaXpl
ICYmIHN0YXJ0IDwgZG1hX3NpemUgKQ0KPiA+ICsgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4g
DQo+IEl0IGlzIHRoZSBlbnRpcmUgcmFuZ2UgKGkuZS4gaW4gcGFydGljdWxhciB0aGUgbGFzdCBi
eXRlKSB3aGljaCBuZWVkcyB0byBtZWV0IHN1Y2gNCj4gYSByZXN0cmljdGlvbi4gSSdtIG5vdCBj
b252aW5jZWQgdGhvdWdoIHRoYXQgRE1BIHdpZHRoIHJlc3RyaWN0aW9ucyBhbmQgc3RhdGljDQo+
IGFsbG9jYXRpb24gYXJlIHNlbnNpYmxlIHRvIGNvZXhpc3QuDQo+IA0KDQpGV0lULCBpZiBzdGFy
dGluZyBhZGRyZXNzIG1lZXRzIHRoZSBsaW1pdGF0aW9uLCB0aGUgbGFzdCBieXRlLCBncmVhdGVy
IHRoYW4gc3RhcnRpbmcNCmFkZHJlc3Mgc2hhbGwgbWVldCBpdCB0b28uDQoNCj4gPiArICAgIH0N
Cj4gPiArDQo+ID4gKyAgICBwZyA9IGFsbG9jX3N0YXRpY21lbV9wYWdlcyhucl9wZm5zLCBzdGFy
dCwgbWVtZmxhZ3MpOw0KPiA+ICsgICAgaWYgKCAhcGcgKQ0KPiA+ICsgICAgICAgIHJldHVybiBO
VUxMOw0KPiA+ICsNCj4gPiArICAgIGlmICggZCAmJiAhKG1lbWZsYWdzICYgTUVNRl9ub19vd25l
cikgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGlmICggbWVtZmxhZ3MgJiBNRU1GX25vX3Jl
ZmNvdW50ICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
aTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbnJfcGZuczsgaSsr
ICkNCj4gPiArICAgICAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8gPSBQR0NfZXh0cmE7DQo+
ID4gKyAgICAgICAgfQ0KPiANCj4gSXMgdGhpcyBhcyB3ZWxsIGFzIHRoZSBNRU1GX25vX293bmVy
IGNhc2UgYWN0dWFsbHkgbWVhbmluZ2Z1bCBmb3Igc3RhdGljYWxseQ0KPiBhbGxvY2F0ZWQgcGFn
ZXM/DQo+IA0KDQpUaGFua3MgZm9yIHBvaW50aW5nIG91dC4gVHJ1bHksIHdlIGRvIG5vdCBuZWVk
IHRvIHRha2UgaXQgY29uc2lkZXJlZC4NCg0KPiBKYW4NCg==

