Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AF651FCE5
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 14:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324493.546558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2Yl-0001PA-K0; Mon, 09 May 2022 12:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324493.546558; Mon, 09 May 2022 12:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2Yl-0001Lj-H5; Mon, 09 May 2022 12:32:19 +0000
Received: by outflank-mailman (input) for mailman id 324493;
 Mon, 09 May 2022 12:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11oC=VR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1no2Yj-0001Lb-Ox
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 12:32:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fbb18e6-cf94-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 14:32:17 +0200 (CEST)
Received: from AS8P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::35)
 by AM0PR08MB3155.eurprd08.prod.outlook.com (2603:10a6:208:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 12:32:13 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::87) by AS8P251CA0029.outlook.office365.com
 (2603:10a6:20b:2f2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 12:32:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 12:32:13 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Mon, 09 May 2022 12:32:12 +0000
Received: from 37d1078781b9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D0269610-5B13-4E96-9873-012BC9950D72.1; 
 Mon, 09 May 2022 12:32:06 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37d1078781b9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 May 2022 12:32:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB5488.eurprd08.prod.outlook.com (2603:10a6:803:137::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 12:32:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 12:32:03 +0000
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
X-Inumbo-ID: 0fbb18e6-cf94-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=N3T1qSrCsnviprb0jv0aumc2UVC3u2qmj6NHTYYHa0UNZuAAvKjQKABnAapKZcMKRtGDpBuGvzN62v3eL1gMzpkNexGoGOeGaDpKcIX2rCMJJ/lGl8jyG6wwNb3PzzCMOvn97bBW7WODccKAJ4+QrqPNYGBUMHwaXo0FTmAZ+kqHziHA8J2hDSPhFHyvvgoBwOSuqHQ7pqMgxtM5e9MJ7arqe/xB2Upvxwe/M0PZQpNSw5qGKx4vC4rMF1fQg4971jWTzKcQQT7b9nRppCVKvR9qIOyA65SPMztjLCYnurzFC8iKrK6cJ+XL6TREvgqm523xyzuZJ2n+oqQH0HM8rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypSRWaJX/Pb+aosoabiPX5Pz8E6HAGyWByGENQmagv0=;
 b=ItVMSeNZLCZAqLsc1zIe5Dr4o8LJxHE4NdMitCj7Fm0h/C/0Zl6Jsl3Z3vGxftGDLqVAzXzHJyoR44z3nvCNlqigCwPSX2tunvhTl0jzC0Vn0qigYS7dC9K+h6buFVubqkCb9C38ZfBB8qVxsZhLqUQUlubeN+9HsrjNflZHE1qKDeyQ7URWl5abYp6pgMTn9CNDcRBpb1BzUT8WDWMBol9tm5kUlWMLRU0deyURTgcROug8zruBDDLp9ty0k6e53wCbQCrvkkR+ufZMOidk6JTyLF/WHYs7QUs1H7I/4q4Nnfd6vOpn8YWeDgae0wTSDnA6Ht/tcwk8Y4EtyIZJCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypSRWaJX/Pb+aosoabiPX5Pz8E6HAGyWByGENQmagv0=;
 b=zjyjzetfnJ2PS6KEi8hGXte5QOlAPLlTV93oT6adr9aQ7Fuz0aEBKBvA9gASvZ4nO2Pc7pIa9V7y9RSCv2e97YzmzK+PwfWWA4wwuMsiDJVXc7qAE8cjYXZp66loXdoSM7bUsaLZCGLMl6vhmG/hudvgNbHIcnbyVNcaIogdTAQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3c2a32fb7850638f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9JHPBCyrDIZXxYvCm0RyO9qQRsQDXI65q/R5EiNiLpohuoCZWnXkOmWpHe/1Nid+9MN2Moe6APKhszYeTlN9bURrhYdC5QdtuBbYw7QaKIen+P2ZI7EU0FQsfOb2ZsMB7Cdz7v7FZC+qofpONtA1iBiHnq8D5nogatA3IMX4Q1zaynL1dlJPxUHaShOhYAINoCrA8mn/xdXQV/LC/ww4eLNYZbEdtgdQAxnAW3F9guNXWGu7gTUJhzj0luxiOX2rZF4uZjxRJ8UDUGwasWyqbPbi455jJs1UPDXGAOFZU90mE6WyYpPPa6QL/9GWGIE1nWheIxHI2U+z1RhyY0SaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypSRWaJX/Pb+aosoabiPX5Pz8E6HAGyWByGENQmagv0=;
 b=nJxsCAPjSD6vrhb4Mtfdv8fvIhNk+PmNGpQak8lGaKUoe/VRaL3UlYEHNuvVANuiy7SsWC04TofExxE3IcNu8j7mUcbG0jrKdvaNVBJcvpDgErg61m63wozYDx841Lrs//TWsAeDUGdg/Ehie8EfRGnZ8AM1lX7pxtAUSkwk55ZvzrD4jFqsZJFO3MyBiW4uLy+ERu59PvNVuJiwefdqYYwwK0eJnbrsl9EE8h9CJ1+IQEVGH0kS2X7oHqvjakE7RBHQN5RZYXcglLidiAkNl21BYnlUyBbWG+BoHTPc6aOnXMpzG55YDmK7x0/AH8VFOMSN56FnGOlnVAcCeuHKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypSRWaJX/Pb+aosoabiPX5Pz8E6HAGyWByGENQmagv0=;
 b=zjyjzetfnJ2PS6KEi8hGXte5QOlAPLlTV93oT6adr9aQ7Fuz0aEBKBvA9gASvZ4nO2Pc7pIa9V7y9RSCv2e97YzmzK+PwfWWA4wwuMsiDJVXc7qAE8cjYXZp66loXdoSM7bUsaLZCGLMl6vhmG/hudvgNbHIcnbyVNcaIogdTAQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] x86/p2m.h: Add include guards
Thread-Topic: [PATCH 1/3] x86/p2m.h: Add include guards
Thread-Index: AQHYY5/FNS5uiu9/s0usThGyJ8iSXa0WelEA
Date: Mon, 9 May 2022 12:32:03 +0000
Message-ID: <12981FF7-81B0-4CA3-8FF0-D1B870F402E2@arm.com>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-2-andrew.cooper3@citrix.com>
In-Reply-To: <20220509122409.14184-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1b185a41-f270-4564-8a4b-08da31b7f1c7
x-ms-traffictypediagnostic:
	VI1PR08MB5488:EE_|AM5EUR03FT012:EE_|AM0PR08MB3155:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3155537CC1AC791F42074ACE9DC69@AM0PR08MB3155.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OWzMOXqMe9LaY2WrboXtgJfJ6HpvLWET29AXfnqhWj1q/9+z6lD3RWsYOiFSO0jEWrckogYr0gfm2Y22iDG7Uc0P95soYynoFF50EGLMX9o2qIZEFsGVlahKXlHU7bCTEWI9rR2ICshty5eAdj1IVidPm6/msr8VTm/LxE1lHYNxd0xfViEKxb8NmEf+TB8bnm0ovZXx+YMPAn9gFQ1Xg8ohWwEXPptWTKlxrsJaKr35Nzt2UPN4lNsVr1el7nUuSGG5bQnTR679i8U34ISkKmFl+Utut25ZYAE4MxItgmKY1ZuUdqhDYepu7QWSXq9bLj1Xgy9HGMxwz+2njsZXyH+LPJPpyLUM9WKiyWbVRFluVNmolbzfY5p0a4QTAu6ZFZkeTY0XxJJhnoJ5wnNTfVVNl/Z5u/tSImV65KiXuraBhrB5cPJoiHR+FpP1/AuYhLwXk8djbzE47pKQWShIU+ijYFoS22PWpKtcfs+KkgRVO2MPrZt+JFuPug36UglxYRl2ojaoaUCJ4Y2z/tdmCBt4voOyDdoC7ob0Y1BW+3yCuDyjURlJ65T1lbOfD7jF5KQuplq11lG7CBfVYUTSWgYBaUxQMALI76j4Yr6lLgkyFNZ/XYVkIcjry2IpnwCvfCjgB/270CPFZP1PtUhXUJn+ji/Nlk4HogqXtn/o5Gn/3QB18WMp4k3CH213XjIry7oIhzobew6sjITEuGPbaBbGpxeZXBkKYuaZV4yy/wdn1df7JrpirnzAzaDbIVZv
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(6916009)(54906003)(8936002)(86362001)(316002)(53546011)(6506007)(6486002)(5660300002)(508600001)(36756003)(71200400001)(66446008)(558084003)(33656002)(4326008)(66476007)(2906002)(38100700002)(64756008)(76116006)(38070700005)(66946007)(8676002)(186003)(26005)(122000001)(2616005)(91956017)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <55F5EC3AD510284A9F64ECD0E294738D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5488
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	235fa1a5-177c-4bb8-e763-08da31b7ec20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WRLR4Ag7hLzzasqP34UP5RtQT8zL0Ryw28jFG2BrSUgPM1dmxW4kTobnbtEi73EHOQX7DvBSXpNuR7xlbUHLIZtc/G2NYYWNb9Tjd2Gmq2Unw5WEYLxI4+l3drOXJv3YWHMl81ktvQQpHtrcF1HjFIHy6F5HRlam2gfrHOvxvXockuodA5+1vpE05YxcgaTt67EtuTPV4P9mXuyV8bepPvu77Csw2jWhyDJV8PH6zhCAyFKAyKQbISzffgCugiL/azKtRzC4aj9+ifY2XHTMtYhWDiPBF9ZPwvtiVZwq97hd8o2fvAyXTqA/5ku/rOp2oqXhTsEh+4103E4C1w6jDi7XweyZqSYWMWEU6EKhLLajE1o1MK/GE+uXHSu4cu8/EIZ9g0IycbBUSNb5c4hWgDWGmFiYUphIe/xj/rs7w8JKn5ddzGOEFwKqf5XexRLAYFylGDnSk77p4CFYJ2sw1d6KgdDdgiMHPuG/Ulnxe67s89KN6EslVzZCTwz1BgphJFYoLQ/K2DFPiJvgWgzVbWCgGQjZ2tmTak4A7zRBaDpj5Km63mGJ7LpBiCJ9QfGb/S4OqSIAn+b+gyHLHPY66D2av+MDpgdzFhOcRH7JBQ1V2dzsf4Ekui2sCH9u7mBIIYPawzT833/kP2TkpYiYT55cseXuToNZW/kZA01JkYvHmMPAfMsunmyOHen5q2kS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(33656002)(186003)(36860700001)(107886003)(26005)(2616005)(2906002)(558084003)(6512007)(36756003)(336012)(40460700003)(47076005)(82310400005)(6486002)(356005)(86362001)(5660300002)(8936002)(70586007)(70206006)(54906003)(8676002)(6862004)(4326008)(81166007)(6506007)(53546011)(316002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 12:32:13.0883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b185a41-f270-4564-8a4b-08da31b7f1c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3155

Hi Andrew,

> On 9 May 2022, at 13:24, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> Spotted by Eclair MISRA scanner.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


