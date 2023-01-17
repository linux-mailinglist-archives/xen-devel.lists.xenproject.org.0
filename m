Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEAC66D833
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 09:30:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479084.742689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhM8-0008Fp-Rc; Tue, 17 Jan 2023 08:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479084.742689; Tue, 17 Jan 2023 08:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhM8-0008DQ-Oe; Tue, 17 Jan 2023 08:30:08 +0000
Received: by outflank-mailman (input) for mailman id 479084;
 Tue, 17 Jan 2023 08:30:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mnn9=5O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pHhM7-0008DK-4Q
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 08:30:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2542fa19-9641-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 09:30:06 +0100 (CET)
Received: from DU2PR04CA0152.eurprd04.prod.outlook.com (2603:10a6:10:2b0::7)
 by GV2PR08MB9256.eurprd08.prod.outlook.com (2603:10a6:150:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Tue, 17 Jan
 2023 08:30:02 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::5b) by DU2PR04CA0152.outlook.office365.com
 (2603:10a6:10:2b0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 08:30:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 08:30:01 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Tue, 17 Jan 2023 08:30:01 +0000
Received: from 294ef77e53ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC3C8195-D1D4-48DB-9426-881E47D6E3A0.1; 
 Tue, 17 Jan 2023 08:29:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 294ef77e53ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Jan 2023 08:29:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB5PR08MB10190.eurprd08.prod.outlook.com (2603:10a6:10:4a8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 08:29:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Tue, 17 Jan 2023
 08:29:48 +0000
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
X-Inumbo-ID: 2542fa19-9641-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obxlW2dDYeA7ayaxyUNGp6UxsW1h2hrE6LY/khFLDFY=;
 b=C4zTASyVoGhfjo+gYnF2I923KtnJcL9Lvi8DUTlU+fEUDdx++pDLzdCMOaHgHNtmbB4itFyGtpQ6nIk72/YP71m9lhZ/+//STT4iWaMwDfPRsBL9tNNlTbC3U1WRxScQIXunF35GodpobTevVEyMufJWgbcvJeSmHyPpFz5fcRs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofkaBzaRw9OEP+a21wmn61fPleztMMS6lygblzmaaRsegfTKT/4Q4TZNOTDJ16xXrI9mMMO+NVV56Qi/4x5ML3gB4Q8cnMxZxQAvcz0D2gMVZIssiZ9xGdYiH1jlf+YZZkLGDZ81sChRIbcv+apt2jtSDoS9ALw5crWeJejGIqAH/W68cQmIYEqI7JBZ0o/y7a42De3ynrB/CDNxwkrYKhOsTAIOuazIzpnA4GHDD8kPuffP3Jp/K61xZp19cbFiaKGtHNCwpPf5HNRA3Fnda6Ar2d53Iik1ZcEhYh++KLQwfQymirT/ipJlCYe7nKCS7gnS2YYflUsJDZrs9ZDqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obxlW2dDYeA7ayaxyUNGp6UxsW1h2hrE6LY/khFLDFY=;
 b=iJjBxNg7JNyKCTG79BqiA/cO4OSlDzSZJzKcozipqOSElR1FsIqnjkhq8EHQAse/Pg0PmdMYQqvi7/k7LzRqXuwrJKA5VCbyLOiLzYTWkrBZ9p/NqucLb/ZyqeB54j7v2zrvg9gd6pF5JtaEFsZclwleoKM+18GJ0IMjpazaqUl05pD3Kt/S2olmJLyKzObXTJYTmU4VyikGpfsSol2ad5q1KqOCfyfuJOox2NQx0wAYE55RwKQNAOyLgfQlEYbZpaVi+6SJ+tX7qqu655pXHGGzmtc9lgfDBmOyLnv1Tt2nr2vrNjOmxMhny81BiLawnifFA7evLAJq0mn+5XQdyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obxlW2dDYeA7ayaxyUNGp6UxsW1h2hrE6LY/khFLDFY=;
 b=C4zTASyVoGhfjo+gYnF2I923KtnJcL9Lvi8DUTlU+fEUDdx++pDLzdCMOaHgHNtmbB4itFyGtpQ6nIk72/YP71m9lhZ/+//STT4iWaMwDfPRsBL9tNNlTbC3U1WRxScQIXunF35GodpobTevVEyMufJWgbcvJeSmHyPpFz5fcRs=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Thread-Topic: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Thread-Index: AQHZKbkuhF2CydVKlkSWMcq+jFNCca6h0FvQgAB02YCAAABNQIAAAoXw
Date: Tue, 17 Jan 2023 08:29:48 +0000
Message-ID:
 <AS8PR08MB799156B911FFE773F86D577D92C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
 <20230116144106.12544-2-michal.orzel@amd.com>
 <AS8PR08MB7991378797D89AF18F735C7C92C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <f1db1e82-d6f7-5424-2925-d1c6d35fee11@amd.com>
 <AS8PR08MB79918757235E971524BD11A592C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79918757235E971524BD11A592C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9C6D63F2E4C8F949B79BEEE3E8675A2A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB5PR08MB10190:EE_|DBAEUR03FT025:EE_|GV2PR08MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8ba113-6a65-48f9-9136-08daf86506d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VantikBmsCOtsa15kJHlFJ2nmQkeo1mdkGRlCOO2Ol1vYlH6Sw+FM3ZicO8JKCDODFvwxDNA5sG2jLsc+TbhtS4y3JN5ScC17tYuxiDLhDgahKTb5ZkHK9LJFlvEuK1/pg+5mBzFGLr2ANen8asG9WTfQZomPioAhcge0Toaz4aA6iRdLZTszb/e7CI2+ElLuWF7hZBIPEh9cm5Je6rrPdv5nYou6ZFUtJoQB4x2+N6lpzQuwt4sGicHi3i9c5tjR2+g27OjeNy/dSjViAXZ4kE9D7ArpG03sbLvruHwCkeOjyeU9uvwRmvXrfcssL/Mh50EhoughYLKbc9iEDmQ8LIihBIEExdDXUyKueMFqKZTaMSBp3eq5tN1pvG7eXqYePTtNYAahSvBnU164peFLikMvvQ6C/2Iw1HIb7Ju6pNQd3yuhDwcO+JazibZm9KMx7dlgs32VwAPMkEKY4KXLXpQkpGuamP4tGg6PnyqR1ti3jpLECHF/JFEF099BGnoEqMVdq2581vbhLVJxVsOaGr0zSq/Bvo8GC7rR6uwM1ss1HL4iFZbVYaGtxAEOTd2yvg/IV3fOMLEIOQWE6/r2SPZQIplkRdQoHlG/ySpXsRX1gBLaxoVMDQUMorDLOmagVYDnkG6qI6MHCe1tHUAdjoF681Tj9r0ShT2vI8tilOVutsOqlvFNbuLy+3y83TVWe+NIWOKL8pK9pdKNbfwZA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199015)(55016003)(122000001)(52536014)(33656002)(478600001)(4744005)(71200400001)(6506007)(86362001)(7696005)(2906002)(83380400001)(186003)(38070700005)(110136005)(54906003)(9686003)(5660300002)(8936002)(76116006)(41300700001)(316002)(38100700002)(66476007)(8676002)(66446008)(64756008)(26005)(4326008)(2940100002)(66556008)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10190
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce350fce-438d-40e7-c87e-08daf864ff49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IgdEKUlzNWvxtaYNNVoYcPc5qAl/ypyORRXnlj71x9cPkByXLIIoSmZy3W2EXgbETaLKzS7pOzJVEWl+m/hQELkogC8nvL84B/abIrgJWoVk2U1TbbVkZqk7QPocj9xAUCqJGKii+OtGllvsFQO4ZPcoGkIHil2sLHU42peIuyoxiPuqa/3ZJYBJlgJk6YJJAtFMilg3rkDczYb0dvYKbpDOwHyFVTZka8UEfK+CDZuYqDF6NS8MqrJkd6C5OGMS1GCHoRjyYDnA1/Jdq4y2dEUEGFLWug162oAfVaJIU61pr/zisxzNGqK8FOiFwnlaesRTqHpTc0GpFJbupBAq2GOERFRTBR0EY/kcSqo0WsPQ3w+YPufWcVc8o/4sLRlc4qOESh1Gia7sU/G+sFyMT6JDAKN5uLN65YphR3CLydCCudd2CmlAUIQ8fTniMorUJYijgg7/TyMYvzPhtFyKcyJjW/QWxM+7QBX5kRU1TBR88RvGkhMIn+o3QRUuxP+V9C2eYdCc+/KKSX59655/BIfdgobFutpT0jHihwQS4JeLfe9PgRjJhNEB9O/CWbO8hc5Kg50T+dVGaow0xtbrW8tt6eTIAWKEXZuegO09pb9B8T6NKYeNG9UNaYn6ygdDK48X87xFhJcCHCXrZ+f+hMk0uNWApQFGhnuUoe/Hiq+nwragrZU0ATSKX6hFN0sm2nfXrGUB0RDQ1NmkBbmUFw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(316002)(336012)(41300700001)(70586007)(4326008)(70206006)(36860700001)(47076005)(8676002)(4744005)(5660300002)(8936002)(82310400005)(83380400001)(52536014)(2906002)(82740400003)(356005)(86362001)(186003)(478600001)(26005)(33656002)(107886003)(6506007)(81166007)(110136005)(54906003)(55016003)(2940100002)(40480700001)(7696005)(9686003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 08:30:01.6300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8ba113-6a65-48f9-9136-08daf86506d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9256

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJF
OiBbUEFUQ0hdIHhlbi9hcm02NDogRml4IGluY29ycmVjdCBESVJFQ1RNQVBfU0laRSBjYWxjdWxh
dGlvbg0KPiA+ID4+IC0jZGVmaW5lIERJUkVDVE1BUF9TSVpFICAgICAgICAgKFNMT1QwX0VOVFJZ
X1NJWkUgKiAoMjY1LTI1NikpDQo+ID4gPj4gKyNkZWZpbmUgRElSRUNUTUFQX1NJWkUgICAgICAg
ICAoU0xPVDBfRU5UUllfU0laRSAqICgyNjYgLSAyNTYpKQ0KPiA+ID4NCj4gPiA+IEZyb20gdGhl
IGNvbW1pdCBtZXNzYWdlICJMMCBzbG90cyBmcm9tIDI1NiB0byAyNjUgKGkuZS4gMTAgc2xvdHMp
IiwgSSB0aGluaw0KPiA+ID4gdGhlIGFjdHVhbCByYW5nZSBpcyBbMjU2LCAyNjVdIHNvIHByb2Jh
Ymx5IHVzaW5nICIoMjY1IC0gMjU2ICsgMSkiIGhlcmUgaXMgYQ0KPiA+ID4gYml0IGJldHRlcj8g
SXQgc2VlbXMgdG8gbWUgdGhhdCB0aGUgbnVtYmVyIDI2NiBsb29rcyBsaWtlIGEgbWFnaWMgbnVt
YmVyDQo+ID4gPiBiZWNhdXNlIDI2NiBpcyBub3QgaW4gdGhlIHJhbmdlLiBCdXQgdGhpcyBpcyBt
eSBwZXJzb25hbCB0YXN0ZSB0aG91Z2ggYW5kIEkNCj4gPiA+IGFtIG9wZW4gdG8gZGlzY3Vzc2lv
biBpZiB5b3Ugb3IgbWFpbnRhaW5lcnMgaGF2ZSBvdGhlciBvcGluaW9ucy4NCj4gPg0KPiA+IEkg
dGhpbmsgdGhpcyBpcyBhIG1hdHRlciBvZiB0YXN0ZS4NCj4gDQo+IFllcyBpbmRlZWQsIHNvIEkg
d291bGRuJ3QgYXJndWUgZm9yIHlvdXIgZXhwbGFuYXRpb24uLi4NCg0KU29ycnkgSSBtZWFuIGFy
Z3VlIGFnYWluc3QgaGVyZS4uLiA6KQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0K

