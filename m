Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F960C64F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 10:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429647.680756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onFBP-0004al-Sk; Tue, 25 Oct 2022 08:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429647.680756; Tue, 25 Oct 2022 08:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onFBP-0004XV-P9; Tue, 25 Oct 2022 08:21:11 +0000
Received: by outflank-mailman (input) for mailman id 429647;
 Tue, 25 Oct 2022 08:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zbGC=22=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1onFBL-0004T3-B0
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 08:21:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f89c78b9-543d-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 10:21:06 +0200 (CEST)
Received: from AS9PR06CA0037.eurprd06.prod.outlook.com (2603:10a6:20b:463::21)
 by PA4PR08MB6093.eurprd08.prod.outlook.com (2603:10a6:102:e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 08:21:01 +0000
Received: from AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::1a) by AS9PR06CA0037.outlook.office365.com
 (2603:10a6:20b:463::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 08:21:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT024.mail.protection.outlook.com (100.127.140.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Tue, 25 Oct 2022 08:21:00 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Tue, 25 Oct 2022 08:21:00 +0000
Received: from 2941f3dcffc4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2408B5F9-B3D3-4252-9444-6C704A4EA44C.1; 
 Tue, 25 Oct 2022 08:20:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2941f3dcffc4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Oct 2022 08:20:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6294.eurprd08.prod.outlook.com (2603:10a6:20b:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 08:20:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 08:20:49 +0000
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
X-Inumbo-ID: f89c78b9-543d-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=E6dEfZn/+HYGBgimz9Fxo1Fq5PmKRudiNcyYO0DAxuhbtsM1e/0OHqGej4lkQYazEyRlUU0kNW8LNn99OfAStdhkY0fKsIkE4bkkh/FGA7JGPW9dsysowdJJTIXyChbwXexFJ2GzJ7cNrpB+OfX+z1zzXqHLxwKKZyre7woej6J5W2gFEU/Oq/oJmR1Mi06m8tRLh+SFlaYYQljrUmc7/dZMg6zwzqpcw4Bp+fs8lziu7+M885AjdxmAS8i4654HqZU+vz51e6bqu/GRcWEjqG+yGrjgqwH5PUrDo1mw8/81PzpJ6E9EoD6cD2XCuuwVjJR1gKdH2Pp5b6QAC0dyaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38omx4Mocmuhjo1i87Pr31pE5oY7c1xwekCIoTVk1x8=;
 b=E3vCAmQdP0l8Hiti+6nuZzXe7yPldanoJDRC/YFEEh8spZZyO7V6Q940BhXLya3U3zglRLUjuRhlpxrk6BlFwj+tXltm3bk5y2aVPHckuENTEhmF+/rRLjdYmCgkDJXbMPbgidALsdU1T3jPjJEyr5j19YClykAHXRczTdg82FKmLUruNdhGvkjVumAVCevwrwqjiUVFFtyzSEhFHx/E2Y3ieXaEY7syVBe7OTJO12wq8lvkS0SPBigQqbBgJ0R4snz3LndhOQGndiuMnI42WUNAlWStT496YDrrOXe3AWPbc5/Wsmwl+/AieA3DrnrujAmQLpOkw6ZRGIYEm5/SQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38omx4Mocmuhjo1i87Pr31pE5oY7c1xwekCIoTVk1x8=;
 b=bLBLFRCn0rHBKEK6CUUHn8qpf9YVhuKFLiuG4+WA7uM7qcEJoONXx08uS5QdMDOlwGdt7ua6R/ROrCRPvOu1qT9UFRXwiMJDWZlZlzgQq7JOOA8pAQu1554OyEVxfcOsPTszNQkmtxpsFHQhuJ0AnMMW1i61vOfpVOEvbolGKow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4132f68e086deea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4m8g6P8HMjhWKVTGMadHP60R5I5O8iD6i+bYyvP4HIfn1PvBrCrAKD9XSPQa04kEmNTnmz8Wy0EQ56Qd7Ly+Y1XN1dEpbpstbJRSoh1/qy4Y9jWm2jzkSFRQj+rev2066DJC7hwmpsP8WHL8X/IYfnpltC1T4PaEGoqKRemh2g4eCdZ8bV0vL/vE/IAiyrCI7T5awfCJ4V8i+WNfxmVdhLbPBNxmNFTG9B1hZCZmscyQqaTOacccSBttSag/DarNBtRjOZR/2V8OwLZ0WDtWs+kxPpM9sB3deObenQdCrHW/XFBbM/N1CmO8N7t5+3cE2BOUtLwmTaEyB0BZkVfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38omx4Mocmuhjo1i87Pr31pE5oY7c1xwekCIoTVk1x8=;
 b=Zj0MXGGEhe4MueWYECGIwWLfiFabMGeoWRDW+/E8uOVRIz2H+iaFEQ8uGfvFlHGqFr1VcCRiqsrT3amSj23LraPPDu1RV6QlVCOUVbuokpP3MCfC2bvnM1hN0GgKNBcIXeRvQRyBR4l231TXguJkX2tLUCaOJAuPYna08Lriym1Oe8lqmhWrbvLpcFZStrc7eJMhDxi519gnXQTBb0vAyfw5rQO3ukrOh5Jq3AoMK1eldLU81pIK72WTmZUBGEzCxgbIpOBotq9XCOvHNyJrZZgh9c2Hx4jz71ej09zhHqwmezfOZjmATrcLmruAVT1KT9GK7gq/iB6GDrUVdaxCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38omx4Mocmuhjo1i87Pr31pE5oY7c1xwekCIoTVk1x8=;
 b=bLBLFRCn0rHBKEK6CUUHn8qpf9YVhuKFLiuG4+WA7uM7qcEJoONXx08uS5QdMDOlwGdt7ua6R/ROrCRPvOu1qT9UFRXwiMJDWZlZlzgQq7JOOA8pAQu1554OyEVxfcOsPTszNQkmtxpsFHQhuJ0AnMMW1i61vOfpVOEvbolGKow=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Deadcode discussion based on Arm NS phys timer
Thread-Topic: Deadcode discussion based on Arm NS phys timer
Thread-Index:
 AQHY54gZ+lETtnfh9UiF8D+fGFbI5q4dXjCAgAANxICAAB5kgIAAySOAgABfjwCAAAmGgIAABfAAgAADzwA=
Date: Tue, 25 Oct 2022 08:20:49 +0000
Message-ID: <7C838BB9-E8FA-4239-B851-B179CB6B7A02@arm.com>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
 <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
 <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
 <aff58db0-646c-6699-48af-033e28c5626f@xen.org>
 <alpine.DEB.2.22.394.2210241819420.1151068@ubuntu-linux-20-04-desktop>
 <ed0bf3da-fe9f-e00c-9bc3-35e10840701e@amd.com>
 <06D2C614-0F17-4364-BE52-FB0DB51D097B@arm.com>
 <89ff9e50-be23-82c2-cd6b-81e05d339778@amd.com>
In-Reply-To: <89ff9e50-be23-82c2-cd6b-81e05d339778@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB6294:EE_|AM7EUR03FT024:EE_|PA4PR08MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb7bf4f-be10-4f84-6510-08dab661d9ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tiDYb3DBiqlDMSZG2tCCiOPoQtc7wpYGJBrfuEqctQjH4isIJd/VG2k5v5Y8zKwXZ+JN5FUUSQ+vpdf8FqxSGP2y7Dp6icrn2Uc3v6N1ncqG5GC7ixjhrFnsdp5uydHLR+9qwcENiKOIOOpnZyH7cN8GnSsfDaveZoeul0jCMQ6cvPXxTtAl6NjaPWiDH7b2Egem4E3Vpm4SAcM4NhyJyVG6H0yQnj2wVYPA3J5EDQX0GdXPA70ftMRQZDKTRLavZlGmfV7lcHUqOjuPr3zZByIy58ruh1WIqmFUyf6kvIxOlVnuoSoqr/W0CKrlyMeOhz3Vb3jiRAwYj0ipFB7wLxkmyEo0E4mP2D7KSZkFweZ5BvTYDBpOsgHRQpkdzAqCMb565nqY/Jp0uo+M52+WghHp5HGlG32sqJi4jZjCnfMD+kAXKd7H4thF7FII2SGa7lxDf7yUMW79dw7t+e6Dg3RKRSgMOPEEnk+zjtDyh8hSs48XV5e6YHcG33CxitSKm626pI2ctUl1BVgH1EAVXvH792d0tOf9ipHMy23NtYqQLAGI7yExeNWy+XuWTy4e7XdGWzBKXRK7IJW3QrGeXpjDcyltawvRabP3M7yur5YDMXSjrB597SQkhxdUielJn2heaFqmgGVldbclxGb491BpPKD4x9QepBa11mHpq39cRAUZsKFjVcV/4yGmPyZu39TVnuyQAk/V47b1ihyH5KowV3aacIOsd2+CgeFNwxY66wFBvxD9qK3/5XdGpz1fjxYBRMe0pxQ8DWrjxo2h1pr2U9zX4j7baUq1n2aJwMw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(2616005)(478600001)(53546011)(6506007)(6512007)(26005)(83380400001)(186003)(2906002)(316002)(6916009)(54906003)(91956017)(8936002)(5660300002)(76116006)(71200400001)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(6486002)(66899015)(86362001)(36756003)(33656002)(122000001)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5ECDA40BF9B7741AA05388A260C46AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6294
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65d166a7-af75-4d68-e711-08dab661d2e6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WWiqGrv5zecmxMnYGP396W8POaPWIfUW2KwRlo4uU5jbiOPPBafSqiFw+rYzrdGlmY16K5x4eZKLHrAt14vkSw4YtnNtBOkuZC15b5nCcNK01scMw3USAUupjn1COzz/ee24BkaYKbWEoN7TcOLBS77jaCsNN6VKpmF3wL1DakQ0kSz22pfjmr/doaTSV3pX4POw3iL+p8M3wg/0NoVemOByuAoWWK28QMNzOmW6nu5Xcgjhtz8mB5kVymLzJR4q81ObkQqJaWush3H4OsOpitSxuajpMHgTTsQl77XJLQm5DZDkkKYnXFYidl7t1iuVSn1PzBMJZ8Ayy5GbFEhjNh0vXKyX9xZ3Oh3q36s8CjHkwdjgwLU55VL1OsmeMLOdxnsYcyzYZQtuF9jOZEXO3tbGEGpP8vLSTGFpR/6olYvek9ugz/je3dQXGr/iDL6pUdbrWoXaJLxcS9MOH6U7nhd/y74Ly83rzVYubDUPGUgeNHVfFwqpslfSYl4MgENUKVDrdvpc7RMy8SacAQl8dfAzOm9lWDwoyOs104317H+Alx857HgdC7nu7sjEwTZULRKTP4N2vEbrX+v35y5sAqGT5jGwpt+sS2IZGwA2YfsjWiha37MgbNl0HRTVG/0m9ne0ZUOht122lEFfWbLefpsnKNSFdmuNrNdaSj1SMC9IwvOlvUKhfuEGVyIGUa5x6bvWPRicgoAPyqYTbM1IIvFaR4ygSEbueW3c/yOOSYjpP0wqhOoDT+KLK6rmEjWerv76tMdmBjCB6kJUcH4q4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(6486002)(478600001)(33656002)(4326008)(6862004)(8936002)(41300700001)(8676002)(2906002)(5660300002)(54906003)(40480700001)(316002)(70586007)(36756003)(70206006)(81166007)(356005)(83380400001)(82740400003)(36860700001)(26005)(53546011)(6506007)(86362001)(47076005)(2616005)(336012)(6512007)(186003)(40460700003)(66899015)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 08:21:00.5692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb7bf4f-be10-4f84-6510-08dab661d9ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6093

SGkgTWljaGFsLA0KDQo+IE9uIDI1IE9jdCAyMDIyLCBhdCAwOTowNywgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9u
IDI1LzEwLzIwMjIgMDk6NDUsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiANCj4+IA0KPj4g
SGkgTWljaGFsLA0KPj4gDQo+Pj4gT24gMjUgT2N0IDIwMjIsIGF0IDA4OjExLCBNaWNoYWwgT3J6
ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBIaSwNCj4+PiANCj4+
PiBPbiAyNS8xMC8yMDIyIDAzOjI5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+IA0K
Pj4+PiANCj4+Pj4gT24gTW9uLCAyNCBPY3QgMjAyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+
Pj4+IE9uIDI0LzEwLzIwMjIgMTI6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+Pj4gQ2F1
dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVz
ZSBwcm9wZXINCj4+Pj4+Pj4gY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNr
aW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gDQo+Pj4+Pj4+IE9u
IDI0LzEwLzIwMjIgMTA6MDcsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+Pj4+Pj4+IEhlbGxvLA0K
Pj4+Pj4+PiANCj4+Pj4+Pj4gSGkgTWljaGFsLA0KPj4+Pj4+PiANCj4+Pj4+Pj4+IFJlY2VudGx5
IEkgY2FtZSBhY3Jvc3MgYSBkZWFkY29kZSBpbiBYZW4gQXJtIGFyY2ggdGltZXIgY29kZS4gQnJp
ZWZseQ0KPj4+Pj4+Pj4gc3BlYWtpbmcsIHdlIGFyZSByb3V0aW5nDQo+Pj4+Pj4+PiB0aGUgTlMg
cGh5cyB0aW1lciAoQ05UUCkgSVJRIHRvIFhlbiwgZXZlbiB0aG91Z2ggWGVuIGRvZXMgbm90IG1h
a2UgdXNlDQo+Pj4+Pj4+PiBvZiBpdCAoYXMgaXQgdXNlcyB0aGUgaHlwZXJ2aXNvciB0aW1lciBD
TlRIUCkuDQo+Pj4+Pj4+PiBUaGlzIHRpbWVyIGlzIGZ1bGx5IGVtdWxhdGVkLCB3aGljaCBtZWFu
cyB0aGF0IHRoZXJlIGlzIG5vdGhpbmcgdGhhdCBjYW4NCj4+Pj4+Pj4+IHRyaWdnZXIgc3VjaCBJ
UlEuIFRoaXMgY29kZSBpcw0KPj4+Pj4+Pj4gYSBsZWZ0IG92ZXIgZnJvbSBlYXJseSBkYXlzLCB3
aGVyZSB0aGUgQ05USFAgd2FzIGJ1Z2d5IG9uIHNvbWUgbW9kZWxzDQo+Pj4+Pj4+PiBhbmQgd2Ug
aGFkIHRvIHVzZSB0aGUgQ05UUCBpbnN0ZWFkLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBBcyBmYXIg
YXMgdGhlIHByb2JsZW0gaXRzZWxmIGlzIG5vdCByZWFsbHkgaW50ZXJlc3RpbmcsIGl0IHJhaXNl
cyBhDQo+Pj4+Pj4+PiBxdWVzdGlvbiBvZiB3aGF0IHRvIGRvIHdpdGggYSBkZWFkY29kZSwNCj4+
Pj4+Pj4+IGFzIHRoZXJlIG1pZ2h0IGJlL2FyZSBvdGhlciBkZWFkY29kZSBwbGFjZXMgaW4gWGVu
Lg0KPj4+Pj4+PiANCj4+Pj4+Pj4gVGhlcmUgYXJlIG11bHRpcGxlIGRlZmluaXRpb24gb2YgZGVh
ZGNvZGUuIERlcGVuZGluZyBvbiB3aGljaCBvbmUgeW91DQo+Pj4+Pj4+IGNob3NlLCB0aGVuIHRo
aXMgY291bGQgY292ZXIgSVNfRU5BQkxFRCgpIGFuZCBwb3NzaWJseSAjaWZkZWYuIFNvIHRoaXMN
Cj4+Pj4+Pj4gd291bGQgcmVzdWx0IHRvIGEgbG90IG9mIHBsYWNlcyBpbXBhY3RlZCB3aXRoIHRo
ZSBkZWNpc2lvbi4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFNvIGNhbiB5b3UgY2xhcmlmeSB3aGF0IHlv
dSBtZWFuIGJ5IGRlYWRjb2RlPw0KPj4+Pj4+IEluIHRoZSB0aW1lciBleGFtcGxlLCBJIHRoaW5r
IHdlIGhhdmUgYm90aCBhIGRlYWRjb2RlIGFuZCB1bnJlYWNoYWJsZSBjb2RlLg0KPj4+Pj4+IEZv
ciB0aGUgcHVycG9zZSBvZiB0aGlzIGRpc2N1c3Npb24sIGxldCdzIHRha2UgdGhlIE1JU1JBIGRl
ZmluaXRpb24gb2YgYQ0KPj4+Pj4+IGRlYWRjb2RlIHdoaWNoIGlzIGEgImNvZGUgdGhhdCBjYW4g
YmUgZXhlY3V0ZWQNCj4+Pj4+PiBidXQgaGFzIG5vIGVmZmVjdCBvbiB0aGUgZnVuY3Rpb25hbCBi
ZWhhdmlvciBvZiB0aGUgcHJvZ3JhbSIuIFRoaXMgZGlmZmVycw0KPj4+Pj4+IGZyb20gdGhlIHVu
cmVhY2hhYmxlIGNvZGUgZGVmaW5pdGlvbiB0aGF0IGlzDQo+Pj4+Pj4gYSAiY29kZSB0aGF0IGNh
bm5vdCBiZSBleGVjdXRlZCIuIFNldHRpbmcgdXAgdGhlIElSUSBmb3IgWGVuIGlzIGFuIGV4YW1w
bGUNCj4+Pj4+PiBvZiBhIGRlYWRjb2RlLiBDb2RlIHdpdGhpbiBJUlEgaGFuZGxlciBpcyBhbiB1
bnJlYWNoYWJsZSBjb2RlDQo+Pj4+Pj4gKHRoZXJlIGlzIG5vdGhpbmcgdGhhdCBjYW4gdHJpZ2dl
ciB0aGlzIElSUSkuDQo+Pj4+Pj4gDQo+Pj4+Pj4gV2hhdCBJIG1lYW4gYnkgZGVhZGNvZGUgaGFw
cGVucyB0byBiZSB0aGUgc3VtIG9mIHRoZSB0d28gY2FzZXMgYWJvdmUgaS5lLg0KPj4+Pj4+IHRo
ZSBjb2RlIHRoYXQgY2Fubm90IGJlIGV4ZWN1dGVkIGFzIHdlbGwgYXMgdGhlIGNvZGUgdGhhdA0K
Pj4+Pj4+IGRvZXMgbm90IGltcGFjdCB0aGUgZnVuY3Rpb25hbGl0eSBvZiB0aGUgcHJvZ3JhbS4N
Cj4+Pj4+PiANCj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBPbmUgbWF5IHNheSB0aGF0IGl0IGlzIHVzZWZ1
bCB0byBrZWVwIGl0LCBiZWNhdXNlIG9uZSBkYXksDQo+Pj4+Pj4+PiBzb21lb25lIG1pZ2h0IG5l
ZWQgaXQgd2hlbiBkZWFsaW5nIHdpdGggeWV0IGFub3RoZXIgYnJva2VuIEhXLiBTdWNoDQo+Pj4+
Pj4+PiBwZXJzb24gd291bGQgc3RpbGwgbmVlZCB0byBtb2RpZnkgdGhlIG90aGVyDQo+Pj4+Pj4+
PiBwYXJ0IG9mIHRoZSBjb2RlIChlLmcuIHJlcHJvZ3JhbV90aW1lciksIGJ1dCB0aGVyZSB3b3Vs
ZCBiZSBsZXNzIHdvcmsNCj4+Pj4+Pj4+IHJlcXVpcmVkIG92ZXJhbGwuIFBlcnNvbmFsbHksIEkn
bSBub3QgaW4gZmF2b3Igb2YNCj4+Pj4+Pj4+IHN1Y2ggYXBwcm9hY2gsIGJlY2F1c2Ugd2Ugc2hv
dWxkIG5vdCByZWFsbHkgc3VwcG9ydCBwb3NzaWJsZSBzY2VuYXJpb3MNCj4+Pj4+Pj4+IHdpdGgg
YnJva2VuIEhXIChleGNlcHQgZm9yIGVycmF0YXMgbGlzdGluZyBrbm93biBpc3N1ZXMpLg0KPj4+
Pj4+PiANCj4+Pj4+Pj4gVGhlIGRpZmZlcmVuY2UgYmV0d2VlbiAiYnJva2VuIEhXIiBhbmQgIkhX
IHdpdGgga25vd24gZXJyYXRhIiBpcyBhIGJpdA0KPj4+Pj4+PiB1bmNsZWFyIHRvIG1lLiBDYW4g
eW91IGNsYXJpZnkgaG93IHlvdSB3b3VsZCBtYWtlIHRoZSBkaWZmZXJlbmNlIGhlcmU/DQo+Pj4+
Pj4+IA0KPj4+Pj4+PiBJbiBwYXJ0aWN1bGFyLCBhdCB3aGljaCBwb2ludCBkbyB5b3UgY29uc2lk
ZXIgdGhhdCB0aGUgSFcgc2hvdWxkIG5vdCBiZQ0KPj4+Pj4+PiBzdXBwb3J0ZWQgYnkgWGVuPw0K
Pj4+Pj4+IEknbSBub3Qgc2F5aW5nIHRoYXQgSFcgc2hvdWxkIG5vdCBiZSBzdXBwb3J0ZWQuIFRo
ZSBkaWZmZXJlbmNlIGZvciBtZQ0KPj4+Pj4+IGJldHdlZW4gYnJva2VuIEhXIGFuZA0KPj4+Pj4+
IEhXIHdpdGgga25vd24gZXJyYXRhIGlzIHRoYXQgZm9yIHRoZSBmb3JtZXIsIHRoZSBpbmNvcnJl
Y3QgYmVoYXZpb3IgaXMgb2Z0ZW4NCj4+Pj4+PiBkdWUgdG8gdGhlIGVhcmx5IHN1cHBvcnQgc3Rh
Z2UsDQo+Pj4+Pj4gdXNpbmcgZW11bGF0b3JzL21vZGVscyBpbnN0ZWFkIG9mIHJlYWwgSFcsIHdo
ZXJlYXMgZm9yIHRoZSBsYXR0ZXIsIHRoZSBIVyBpcw0KPj4+Pj4+IGFscmVhZHkgcmVsZWFzZWQg
YW5kIGl0IGhhcHBlbnMgdG8gYmUgdGhhdCBpdCBpcyBidWdneQ0KPj4+Pj4+ICh0aGUgSFcgdmVu
ZG9yIGlzIGF3YXJlIG9mIHRoZSBpc3N1ZSBhbmQgcmVsZWFzZWQgZXJyYXRhcykuDQo+Pj4+PiAN
Cj4+Pj4+IFRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIFdoYXQgSSB3b3VsZCBjYWxsIGJy
b2tlbiBpcyBhbnl0aGluZyB0aGF0IGNhbid0DQo+Pj4+PiBiZSBmaXhlZCBpbiBzb2Z0d2FyZS4g
Rm9yIGEgbm90IHRvbyBmaWN0aW9uYWwgZXhhbXBsZSwgYW4gSFcgd2hlcmUgUENJIGRldmljZXMN
Cj4+Pj4+IGFyZSB1c2luZyB0aGUgc2FtZSBzdHJlYW0gSUQuIFNvIGVmZmVjdGl2ZWx5LCBwYXNz
dGhyb3VnaCBjYW4ndCBiZSBzYWZlbHkNCj4+Pj4+IHN1cHBvcnRlZC4NCj4+Pj4+IA0KPj4+Pj4g
UmVnYXJkaW5nLCBub3QgeWV0IHJlbGVhc2VkIEhXLCBJIGRvbid0IHRoaW5rIFhlbiBzaG91bGQg
aGF2ZSB3b3JrYXJvdW5kIGZvcg0KPj4+Pj4gdGhlbS4gSSB3b3VsZG4ndCBldmVuIGNhbGwgaXQg
ImJyb2tlbiIgYmVjYXVzZSB0aGV5IGFyZSBub3QgeWV0IHJlbGVhc2VkIGFuZA0KPj4+Pj4gaXQg
aXMgY29tbW9uIHRvIGhhdmUgYnVnIGluIGVhcmx5IHJldmlzaW9uLg0KPj4+Pj4gDQo+Pj4+Pj4g
RG8gd2UgaGF2ZSBhbnkgZXhhbXBsZSBpbiBYZW4gZm9yIHN1cHBvcnRpbmcgYnJva2VuIEhXLA0K
Pj4+Pj4+IHdob3NlIHZlbmRvciBpcyBub3QgYXdhcmUgb2YgdGhlIGlzc3VlIG9yIGRpZCBub3Qg
cmVsZWFzZSBhbnkgZXJyYXRhPw0KPj4+Pj4gSSB3aWxsIG5vdCBjaXRlIGFueSBIVyBvbiB0aGUg
TUwuIEJ1dCBmcm9tIG15IGV4cGVyaWVuY2UsIHRoZSB2ZW5kb3JzIGFyZSBub3QNCj4+Pj4+IHZl
cnkgdm9jYWwgYWJvdXQgaXNzdWVzIGluIHB1YmxpYyAoc29tZSBkb24ndCBldmVuIHNlZW0gdG8g
aGF2ZSBwdWJsaWMgZG9jKS4NCj4+Pj4+IFRoZSBiZXN0IHdheSB0byBmaW5kIHRoZSBpc3N1ZXMg
aXMgdG8gbG9vayBhdCBMaW51eCBjb21taXQuDQo+Pj4+PiANCj4+Pj4+PiANCj4+Pj4+Pj4gDQo+
Pj4+Pj4+PiBBbHNvLCBhcyBwYXJ0IG9mIHRoZSBjZXJ0aWZpY2F0aW9uL0ZVU0EgcHJvY2Vzcywg
dGhlcmUgc2hvdWxkIGJlIG5vDQo+Pj4+Pj4+PiBkZWFkY29kZSBhbmQgd2Ugc2hvdWxkIGhhdmUg
ZXhwbGFuYXRpb24gZm9yIGV2ZXJ5IGJsb2NrIG9mIGNvZGUuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBT
ZWUgYWJvdmUuIFdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gY292ZXIgYnkgZGVhZGNvZGU/IFdvdWxk
IHByb3RlY3RpbmcNCj4+Pj4+Pj4gY29kZSB3aXRoIElTX0VOQUJMRUQoKSAob3IgI2lmZGVmKSBv
az8NCj4+Pj4+PiBJIHRoaW5rIHRoaXMgd291bGQgYmUgb2sgZnJvbSB0aGUgY2VydGlmaWNhdGlv
biBwb2ludCBvZiB2aWV3ICh0aGlzIHdvdWxkIGF0DQo+Pj4+Pj4gbGVhc3QgbWVhbnMsIHRoYXQg
d2UgYXJlIGF3YXJlIG9mIHRoZSBpc3N1ZQ0KPj4+Pj4+IGFuZCB3ZSB0b29rIHNvbWUgc3RlcHMp
LiBPdGhlcndpc2UsIHN1Y2ggY29kZSBpcyBqdXN0IGFuIGV4YW1wbGUgb2YgYQ0KPj4+Pj4+IGRl
YWRjb2RlL3VucmVhY2hhYmxlIGNvZGUuDQo+Pj4+PiANCj4+Pj4+IFRoYW5rcyBmb3IgdGhlIGNs
YXJpZmljYXRpb24uIFNvIHRoZSBleGFjdCBhcHByb2FjaCB3aWxsIGRlcGVuZCBvbiB0aGUNCj4+
Pj4+IGNvbnRleHQuLi4uDQo+Pj4+PiANCj4+Pj4+Pj4+IFRoZXJlIGFyZSBkaWZmZXJlbnQgd2F5
cyB0byBkZWFsIHdpdGggYSBkZWFkY29kZTogPiAxLiBHZXQgcmlkIG9mIGl0DQo+Pj4+Pj4+PiBj
b21wbGV0ZWx5DQo+Pj4+Pj4+PiAyLiBMZWF2ZSBpdCBhcyBpdCBpcw0KPj4+Pj4gDQo+Pj4+PiAu
Li4gdGhpcyBpcyBteSBwcmVmZXJlbmNlIGluIHRoZSBjb250ZXh0IG9mIHRoZSB0aW1lci4NCj4+
Pj4gDQo+Pj4+IEZyb20gYSBjZXJ0aWZpY2F0aW9uIHBvaW50IG9mIHZpZXcsIHRoZSBmZXdlciBs
aW5lcyBvZiBjb2RlIHRoZSBiZXR0ZXIsDQo+Pj4+IGFuZCBpZGVhbGx5IGFsbCB0aGUgbGluZXMg
b2YgY29kZSB1c2VkIGZvciB0aGUgY2VydGlmaWVkIGJ1aWxkIHNob3VsZCBiZQ0KPj4+PiB0ZXN0
YWJsZSBhbmQgdXNlZC4NCj4+Pj4gDQo+Pj4+IFNvIEkgdGhpbmsgMi4gaXMgdGhlIGxlc3QgdXNl
ZnVsIG9wdGlvbiBmcm9tIGEgY2VydGlmaWNhdGlvbg0KPj4+PiBwZXJzcGVjdGl2ZS4gRm9yIHRo
aXMgcmVhc29uLCBJJ2QgcHJlZmVyIGFub3RoZXIgYWx0ZXJuYXRpdmUuDQo+Pj4+IA0KPj4+PiAN
Cj4+Pj4+IElmIHRoZSBvdGhlciBkb24ndCBsaWtlIGl0LCB0aGVuIDEgd291bGQgYmUgbXkgcHJl
ZmVyZW5jZS4NCj4+Pj4+IA0KPj4+Pj4gSW4gZ2VuZXJhbCwgbXkgcHJlZmVyZW5jZSB3b3VsZCBi
ZSBlaXRoZXIgMy4zIG9yIDMuMiAoc2VlIGJlbG93KS4NCj4+Pj4gDQo+Pj4+IEkgYWxzbyB0aGlu
ayB0aGF0IDMuMiBhbmQgMy4zIGFyZSBnb29kIG9wdGlvbnMgZm9yIHRoZSBnZW5lcmFsIGNhc2Uu
IEZvcg0KPj4+PiB0aGUgdGltZXIsIEkgY2FuIHNlZSB3aHkgMSBpcyB5b3VyIChzZWNvbmQpIHBy
ZWZlcmVuY2UgYW5kIEkgYW0gZmluZQ0KPj4+PiB3aXRoIDEgYXMgd2VsbC4NCj4+PiBPaywgc291
bmRzIGdvb2QgdG8gbWUuIExldCdzIHN0aWxsIGdpdmUgQmVydHJhbmQgdGhlIGNoYW5jZSB0byBz
aGFyZSBoaXMgb3Bpbmlvbi4NCj4+IA0KPj4gV2UgbmVlZCB0byBnZXQgcmlkIG9mIGRlYWQgY29k
ZSBhbmQgcmVtb3ZpbmcgaXQgaXMgbm90IGFsd2F5cyB0aGUgYmVzdCBzb2x1dGlvbi4NCj4+IA0K
Pj4gSWYgdGhlIGNvZGUgaXMgb3IgY291bGQgYmUgdXNlZnVsIGZvciBzb21lb25lIHNvbWUgZGF5
LCBwcm90ZWN0aW5nIGl0IHdpdGggaWZkZWYgaXMgb2suDQo+PiANCj4+IEluIHRoZSBtaWQgdGVy
bSB3ZSB3aWxsIGhhdmUgdG8gaW50cm9kdWNlIGEgbG90IG1vcmUgaWZkZWYgb3IgSVNfRU5BQkxF
RCBpbiB0aGUNCj4+IGNvZGUgc28gdGhhdCB3ZSBjYW4gY29tcGlsZSBvdXQgd2hhdCB3ZSBkbyBu
b3QgbmVlZCBhbmQgY29kZSBub3QgYXBwbHlpbmcgdG8NCj4+IHNvbWUgaGFyZHdhcmUgaXMgYSBj
YXNlIHdoZXJlIHdlIHdpbGwgZG8gdGhhdCAoZG9lcyBub3QgbWVhbiB0aGF0IGJ5IGRlZmF1bHQN
Cj4+IHdlIHdpbGwgbm90IGNvbXBpbGUgaXQgaW4gYnV0IHdlIHdpbGwgbWFrZSBpdCBlYXNpZXIg
dG8gcmVkdWNlIHRoZSBjb2RlIHNpemUgZm9yIGENCj4+IHNwZWNpZmljIHVzZSBjYXNlKS4NCj4+
IA0KPj4gU28gMy4yIGFuZCAzLjMgYXJlIG9rIGZvciBtZS4NCj4gDQo+IFNvIHdlIGFsbCBhZ3Jl
ZSB0aGF0IHRoZSBjb2RlIGluIHRoZSBjdXJyZW50IGZvcm0gaXMgYSBubyBnbyBmcm9tIGNlcnRp
ZmljYXRpb24gcHVycG9zZXMuDQo+IFRoYXQgaXMgZ29vZCA6KQ0KPiANCj4gVGhlIHJlYXNvbiB3
aHkgSSBvcHQgZm9yIHNvbHV0aW9uIDEgYW5kIG5vdCB0aGUgb3RoZXJzIGlzIHRoYXQgaW4gdGhl
IGxhdHRlciBjYXNlIGl0IHdvdWxkDQo+IG1lYW4gaW50cm9kdWNpbmcgdGhlIEtjb25maWcgb3B0
aW9uIHRvIGFsbG93IHVzZXIgdG8gc2VsZWN0IHRoZSB0aW1lciB0byBiZSB1c2VkIGJ5IFhlbi4N
Cj4gVGhpcyBpcyBub3QgcmVhbGx5IGNvcnJlY3QuIEFsc28gaW4gdGhlIGN1cnJlbnQgZm9ybSwg
aXQgd291bGQgYWxzbyByZXF1aXJlIGFkZGluZyBtb3JlDQo+IGNvZGUgdG8gdGltZS5jIGNvZGUg
YmVjYXVzZSBhdCB0aGUgbW9tZW50IHVzaW5nIENOVFAgZm9yIFhlbiB3b3VsZCBub3Qgd29yayBv
dXQgb2YgdGhlIGJveC4NCj4gVGhlIGFyY2hpdGVjdHVyZSBkZWZpbmVzIHRoZSBoeXBlcnZpc29y
IHRpbWVyIGZvciBhIHB1cnBvc2UuIElmIGl0IGRvZXMgbm90IHdvcmssIGl0IG1lYW5zDQo+IHRo
YXQgdGhlIEhXIGlzIHByb2JsZW1hdGljLiBJIGFncmVlIHRoYXQgd2Ugd291bGQgd2FudCB0byBz
dXBwb3J0IHN1Y2ggdXNlIGNhc2UgYnV0IEknbSBub3QNCj4gcmVhbGx5IGF3YXJlIG9mIGFueSBp
c3N1ZSBsaWtlIHRoYXQuIEFkZGluZyBtb3JlIGNvZGUgYW5kIEtjb25maWcgb3B0aW9ucyBqdXN0
IGJlY2F1c2UNCj4gb25lIGRheSBzb21lb25lIG1heSBmYWNlIGlzc3VlcyB3aXRoIGEgbmV3IEhX
IGlzIHNvbWV0aGluZyBJIGFtIG5vdCBhIGZhbiBvZi4NCg0KSSBzZWUgMiBzb2x1dGlvbnMgaGVy
ZToNCi0gc29tZWhvdyBwdXNoIHRoZSBjb2RlIHRvIGEgZGlmZmVyZW50IGZpbGUgKG5vdCBxdWl0
ZSBzdXJlIHRoaXMgaXMgZmVhc2libGUgaGVyZSkNCi0gcmVtb3ZlIGNvbXBsZXRlbHkgdGhlIGNv
ZGUgd2l0aCBhIGNsZWFuIGNvbW1pdC4gRG9pbmcgdGhpcyBpdCB3aWxsIGJlIGVhc3kgZm9yIHNv
bWVvbmUgbmVlZGluZyB0aGlzIHRvIGxhdGVyIHJldmVydCB0aGUgcGF0Y2gNCg0KSXQgaXMgZGVm
aW5pdGVseSB0cnVlIGhlcmUgdGhhdCBhZGRpbmcgbW9yZSBjb2RlIHRvIGtlZXAgc29tZSB1bnVz
ZWQgY29kZSBkb2VzIG5vdCByZWFsbHkgbWFrZSBzZW5zZS4NCkFuZCBsZXTigJlzIGJlIHJlYWxp
c3RpYyBoZXJlLCBpZiB3ZSBuZWVkIHRoYXQgb25lIGRheSwgaXQgd2lsbCBub3QgdGFrZSBhZ2Vz
IHRvIHN1cHBvcnQgaXQgc29tZWhvdy4NCg0KQXMgc2FpZCwgZnJvbSBhIHB1cmUgY2VydGlmaWNh
dGlvbiBwb2ludCBvZiB2aWV3Og0KLSB3ZSBtdXN0IG5vdCBoYXZlIGRlYWRjb2RlDQotIHByb3Bl
ciBpZmRlZiBpcyBhY2NlcHRhYmxlDQotIGlmIDAgaXMgbm90IGFjY2VwdGFibGUNCi0gY29tbWVu
dGVkIGNvZGUgaXMgbm90IGFjY2VwdGFibGUNCg0KPiANCj4gSSB3b3VsZCBhZ3JlZSB3aXRoIHlv
dXIgc29sdXRpb24gdW5kZXIgdGhlIGNvbmRpdGlvbiB0aGF0IHRoZSBjb2RlIGlzIGFscmVhZHkg
cmVhZHkNCj4gZm9yIHRoZSB0aW1lciBzd2l0Y2guDQo+IA0KPiBJIGd1ZXNzIHdlIG5lZWQgYW5v
dGhlciByb3VuZCBvZiBzaGFyaW5nIG9waW5pb25zLg0KPiANCg0KSSBndWVzcyBzbyB5ZXMNCg0K
Q2hlZXJzDQpCZXJ0cmFuZA0KDQoNCj4+IA0KPj4+IA0KPj4+PiANCj4+Pj4gDQo+Pj4+Pj4+PiAz
LiBBZG1pdCB0aGF0IGl0IGNhbiBiZSB1c2VmdWwgb25lIGRheSBhbmQ6DQo+Pj4+Pj4+PiAgIDMu
MS4gcHJvdGVjdCBpdCB3aXRoICNpZiAwDQo+Pj4+PiANCj4+Pj4+ICNpZiAwIHNob3VsZCBub3Qg
YmUgdXNlZCBpbiBYZW4gY29kZS4gSU1ITyB0aGlzIGlzIHRoZSB3b3JzZSBvZiBhbGwgdGhlIHdv
cmxkLg0KPj4+IEkgc2hhcmUgeW91ciBvcGluaW9uIGhlcmUgSnVsaWVuLiBVbmZvcnR1bmF0ZWx5
IHdlIHN0aWxsIGhhdmUgcXVpdGUgYSBmZXcgZXhhbXBsZXMNCj4+PiBpbiB0aGUgQXJtIGNvZGUg
dXNpbmcgdGhpcyBlaXRoZXIgdG8gbWFyayBzb21ldGhpbmcgYXMgVE9ETyBvciB0byBjb21tZW50
IG91dA0KPj4+IHBhcnRzIG9mIHRoZSBjb2RlIHdhaXRpbmcgZm9yIGZ1dHVyZSBzdXBwb3J0LiBU
aGlzIGlzIG1vc3RseSBpbiBTTU1VIGNvZGUgdGhhdA0KPj4+IHdhcyB0YWtlbiBmcm9tIExpbnV4
IGJ1dCBhbHJlYWR5IGRpdmVyZ2VkIHF1aXRlIGZhciAobWF5YmUgc29tZSBjbGVhbnVwIGlzIG5l
Y2Vzc2FyeSkuDQo+PiANCj4+IERlZmluaXRlbHkgdGhlIFNNTVUgY29kZSB3aWxsIG5lZWQgc29t
ZSBjbGVhbmluZy4NCj4+ICNpZiAwIGFyZSBhIG5vIGdvIGZyb20gYSBjZXJ0aWZpY2F0aW9uIHBv
aW50IG9mIHZpZXcuDQo+PiANCj4+IENoZWVycw0KPj4gQmVydHJhbmQNCj4+IA0KPj4+IA0KPj4+
Pj4gDQo+Pj4+Pj4+PiAgIDMuMi4gcHJvdGVjdCBpdCB3aXRoIGEgbmV3IEtjb25maWcgb3B0aW9u
IChkaXNhYmxlZCBieSBkZWZhdWx0KQ0KPj4+Pj4+Pj4gdXNpbmcgI2lmZGVmDQo+Pj4+Pj4+PiAg
IDMuMy4gcHJvdGVjdCBpdCB3aXRoIGEgbmV3IEtjb25maWcgb3B0aW9uIChkaXNhYmxlZCBieSBk
ZWZhdWx0KQ0KPj4+Pj4+Pj4gdXNpbmcgSVNfRU5BQkxFRCAodG8gbWFrZSBzdXJlIGNvZGUgYWx3
YXlzIGNvbXBpbGUpDQo+Pj4+PiANCj4+Pj4+IEkgd291bGQgcHJlZmVyIDMuMyBvdmVyIDMuMi4g
My4yIHdvdWxkIGJlIHVzZWQgaWYgaXQgaXMgdG9vIGRpZmZpY3VsdCB0byBnZXQNCj4+Pj4+IHRo
ZSBjb2RlIGNvbXBpbGVkIHdoZW4gIUlTX0VOQUJMRUQuDQo+Pj4+PiANCj4+Pj4+IFNpbWlsYXIg
dG8gb25lIGlmIHRoaXMgaXMgdG8gbW92ZSBhbGwgdGhlIGFmZmVjdGVkIGNvZGUgaW4gYSBzZXBh
cmF0ZSBmaWxlDQo+Pj4+PiB3aXRoIHVzaW5nIG9iai0kKENPTkZJRy4uLikuIFRoYXQgd291bGQg
b25seSB3b3JrIGZvciBsYXJnZSBjaHVuayBvZiBjb2RlIGFuZA0KPj4+Pj4gd291bGQgYmUgcHJl
ZmVycmVkIG92ZXIgMy4yLg0KPj4+PiANCj4+PiANCj4+PiB+TWljaGFsDQo+PiANCj4gDQo+IH5N
aWNoYWwNCg0K

