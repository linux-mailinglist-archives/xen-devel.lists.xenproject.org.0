Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FA7224DA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 13:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543681.848853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q68eT-0007eC-46; Mon, 05 Jun 2023 11:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543681.848853; Mon, 05 Jun 2023 11:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q68eT-0007bT-0A; Mon, 05 Jun 2023 11:45:33 +0000
Received: by outflank-mailman (input) for mailman id 543681;
 Mon, 05 Jun 2023 11:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xfSY=BZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q68eR-0007bN-MQ
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 11:45:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 787fedca-0396-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 13:45:30 +0200 (CEST)
Received: from DB6PR0301CA0076.eurprd03.prod.outlook.com (2603:10a6:6:30::23)
 by AS2PR08MB9368.eurprd08.prod.outlook.com (2603:10a6:20b:594::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 11:45:27 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::43) by DB6PR0301CA0076.outlook.office365.com
 (2603:10a6:6:30::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Mon, 5 Jun 2023 11:45:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19 via Frontend Transport; Mon, 5 Jun 2023 11:45:27 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Mon, 05 Jun 2023 11:45:27 +0000
Received: from 1050c9811717.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8881D90B-AB9C-43DC-A686-7FF44BB0CF53.1; 
 Mon, 05 Jun 2023 11:45:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1050c9811717.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jun 2023 11:45:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6080.eurprd08.prod.outlook.com (2603:10a6:102:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 11:45:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 11:45:19 +0000
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
X-Inumbo-ID: 787fedca-0396-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Su6FLpJqmLEU7icBPcSg5iWVodYTDkkbHrGjbmOZydQ=;
 b=STVtB8tsv0GTxCfd4N18acMZfjTj7wqEmJfu1pQz9HbKP4pMLW4IFwbLLQfu6sxIPw5M3CmHRgDqS1abY64+UEDyhIz8jvRjbX05SwJOyY6O/y6PQrs1mBpXV46EaMB/axakQD5iNrRxsYz08RvtZ8Q5jnIRKg1xCRRKdBOyDbo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a364e6aa6b72908
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOXM2PtwrruQbvKoQkNLyiMGuTb+g1ojuEhssQLZCzJASL/3DpqRV0JWVbwDiha7m4nqduUndmVhzu+ckG+EwJ0oURv5WWc3q3NzBvpVAo4DCTDtav3fK8wNhNIqbhm0kYY86ThrZTkAWUBgaQM4fzwKrIK57fYYUaNHmlGRwFh5EMGByZGAl4xipCV40NNRrdEeHb9q+xXdd2PnWWWIsgQEgOSnQyOZpkmh6FWQqfxyevrPfmTTY1AEhDjimqqyYfmzbeURcp3Idd2BZ4zt4WpeQQGOYr9vEHAcRGB5Dg+3wnAlkFPWVmjAByaOnsCxYjyOUE+jWJb5o+f977F3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su6FLpJqmLEU7icBPcSg5iWVodYTDkkbHrGjbmOZydQ=;
 b=L8pJiXgh+ZhBhlo+k5w4Wk9qs7NkLOvvY28c5rUoRGz1sJHTojSOahhWAQ+R8Q+muP1O5ocoY3wNHw0JH4Di+D9ID6YPMMjvDhD9ZFzVAbiAGWP6AiwVyYc8tBaSeq4Hu3s6kzA2XiDImG7R8iD38ACZBPgqxeSumYQyKGTJ9xxaj+FScxxxt4v514QXNAPaxJ4Na5rxIErfTaf0+HzjUuhzoLKIh+joyaWTR1Cf1P3197VSki/wLxOQFE7V+tQwbvSJXqfpP4tEgjJCjx4QW9+rcA5e22nMcB2VRt0XHTjTPE45WXFRhghla0CiXXGz8z7MV34EDzTPkO5Sy+2ung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Su6FLpJqmLEU7icBPcSg5iWVodYTDkkbHrGjbmOZydQ=;
 b=STVtB8tsv0GTxCfd4N18acMZfjTj7wqEmJfu1pQz9HbKP4pMLW4IFwbLLQfu6sxIPw5M3CmHRgDqS1abY64+UEDyhIz8jvRjbX05SwJOyY6O/y6PQrs1mBpXV46EaMB/axakQD5iNrRxsYz08RvtZ8Q5jnIRKg1xCRRKdBOyDbo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen: Fix incorrect taint constant
Thread-Topic: [PATCH v2] xen: Fix incorrect taint constant
Thread-Index: AQHZl6An0ZVCR8BjEkS3vk0sA5g2C698FxuA
Date: Mon, 5 Jun 2023 11:45:19 +0000
Message-ID: <1A2EBF4E-BA99-4B2A-95DF-96BCEE48EDBC@arm.com>
References: <20230605112303.1764183-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230605112303.1764183-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA4PR08MB6080:EE_|DBAEUR03FT019:EE_|AS2PR08MB9368:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3141e2-2060-407b-54cb-08db65ba5b36
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MZ6pRnpdu1YhOxAJRDGnwup0c6605wqh2/GhHPt3LW5cfz9rWpzH6eSeo/p4o6P6zmU8dtBHQeCsLJMEFhMgLv8s+ePBWeB9I2lcXlU/Rc9FUdYTljOj3PacP0hEZLzdLRGz5JV5DtJJZ3ye+QylbQO0Tmwl1O4iwsiTjwFyHnXcHe6KlUo2FV08qAGwIIVrR62VbtOtPDSRO3pHUS4fZ1/BS7KopuElOppNbV431/grs2cFeyq8Fj3S4HQu6XnMWe+OLSdXKT7/bTOzuSfzwHDVdQah4K+MWVW7bMFLoWHORYnA9LuOyv+NNTka3yNEs39gUczJ7MUgVOPZcbd3tYHUN/6MppWz/TyV05GcGBea4qJoh3UNZjyuU9drYH+096jLt+y631XA3f3tYgLEpJiBxKwhh9viy7cye7rNCwL5WWAgFMztcDy6jbEQDM4mcLv1VmbWYroShYaL7OzyXVDtQH3uh3JZIocdTzdcBFcl5cXTRel5PrJxM1YIYTXJbvjRvnV3DoQpEjQznofbm62mzsKN4CzOmjD767KCqbK22HaF2tHlDXlfJLofJUfN/4uKC6/NG6hJ0E0ej1q+BPRMBvu8SYxrhDFXoDAc4Aa79djHs1EmkDKTK7SyauSHD/bOlSsHq2+GK8zvbdJztA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(53546011)(6512007)(6506007)(26005)(2616005)(83380400001)(186003)(4744005)(2906002)(66446008)(64756008)(66476007)(76116006)(122000001)(66946007)(66556008)(6486002)(71200400001)(38100700002)(86362001)(38070700005)(8936002)(5660300002)(91956017)(54906003)(36756003)(8676002)(478600001)(41300700001)(33656002)(316002)(6916009)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C7BADBB2062003459E013F248C191DBE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6080
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80102a3d-9b5f-485c-a00b-08db65ba5686
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sm9I3zhjpV/0qMLwwiux745B/3mYsqr5CMvz+z17zaWP41I05UFSXRsl+2QIwjkNps4iFGpj4Y2VPUnWgZ/pWYWVHZf7ET/jNMGfFqe+A3U7HASQy42kgpBgbqCSx7sx9e+sHo7nvyS8SsH94wIzWSBDe8OwMro/N4pPU2QEPE2APd/B1e0QlJdl93u0uij9qPDDQj65FKdibl2b0CgX/4htcdWAVKIzXXpwhxv2VmS758auf/HTaM1Z6oNkuQl9vdcdfqL2vtPPxFov7/Mcle5f6/FeS8vZ3rMZMTbQJsUmY9XpJcw8ZWNapnyafDl0wUlwu7mdj4owsDGPgtnGHqRLz7KMlZcGWGdiKHvFGWkKe9oWqpQ5r+WC0owRnhvatWR4MNLlU/lfippcaPxUL94A5Dko6eE/RaImW7K/php1ASzkpuo/sueYG5D9kOML6CixUTuMqLA8EAWWnhI9ZcqhkLTnlFNFgLg2nM1Dv8jq/UiWLjKRDnRZIpwP7CT8sZLRZDRtDv9bLlvungcf7zhXQaTU6/KpW0qkH6EKSk308eNE7C4dZQ0LZuc0/XcMzXCu5bzqRA5WH26fqE8xQXPeRAVfdyl29VV+DUKGVSqEVx72MJVYdE6tVjYO3J90P/bgx5/ZCLWAjGPRmnvuDA1idV5YeaA90/JsgtO1gPcHVozgZtd2CEE8tweuGVoikoa0E7K1xAoxBP4IIbAfvblmtawxXl32ivbhUwhT6gRJEqhyKvDtWYfj9sL9KT8o
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(107886003)(6506007)(186003)(26005)(6512007)(53546011)(2616005)(336012)(83380400001)(47076005)(6486002)(36756003)(36860700001)(82310400005)(2906002)(4744005)(40460700003)(6862004)(8676002)(8936002)(40480700001)(82740400003)(54906003)(478600001)(33656002)(5660300002)(86362001)(4326008)(316002)(41300700001)(70586007)(356005)(81166007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 11:45:27.1666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3141e2-2060-407b-54cb-08db65ba5b36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9368

Hi Andrew,

> On 5 Jun 2023, at 13:23, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> Insecure is the word being looked for here.  Especially given the nature =
of
> the sole caller, and the (correct) comment next to it.
>=20
> Also update the taint marker from 'U' to 'I' for consistency; this isn't
> expected to impact anyone in practice.
>=20
> Fixes: 82c0d3d491cc ("xen: Add an unsecure Taint type")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


