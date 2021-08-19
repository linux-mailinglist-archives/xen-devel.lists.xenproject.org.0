Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65AD3F1B71
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 16:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168857.308351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGirD-0007zn-Bq; Thu, 19 Aug 2021 14:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168857.308351; Thu, 19 Aug 2021 14:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGirD-0007wv-8f; Thu, 19 Aug 2021 14:17:23 +0000
Received: by outflank-mailman (input) for mailman id 168857;
 Thu, 19 Aug 2021 14:17:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mGirB-0007wn-RS
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:17:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e676985c-696e-43dd-ac71-1b2cf01533bd;
 Thu, 19 Aug 2021 14:17:19 +0000 (UTC)
Received: from FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::13)
 by AM6PR08MB4456.eurprd08.prod.outlook.com (2603:10a6:20b:b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 14:17:16 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::e5) by FR0P281CA0073.outlook.office365.com
 (2603:10a6:d10:1e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend
 Transport; Thu, 19 Aug 2021 14:17:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 14:17:16 +0000
Received: ("Tessian outbound 32695b2df2f8:v103");
 Thu, 19 Aug 2021 14:17:15 +0000
Received: from 13e9eb907c29.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8BB61E8B-443B-4165-9D95-3884CC4296C2.1; 
 Thu, 19 Aug 2021 14:17:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13e9eb907c29.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Aug 2021 14:17:07 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM7PR08MB5319.eurprd08.prod.outlook.com (2603:10a6:20b:dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 14:16:55 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea%3]) with mapi id 15.20.4436.019; Thu, 19 Aug 2021
 14:16:55 +0000
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
X-Inumbo-ID: e676985c-696e-43dd-ac71-1b2cf01533bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmbT6IoJ1AqhVmNkzwkZF7P+epA4Rhyp0PS77kuVJ/g=;
 b=nSGTYDszzfSp3PjV6tJBIz9MlyUMOkZvg7p1cu3jmdRGjytU8jbIN1euxn/JzFw+AWlTqpQnvX/ZQx96R4NBHcxkccRcJ+cZWD9kX1vhHLKKFzjxkYpjwyTHlVbmiT8RVFiOVrZPwgzJu0LncXJykzrFbhURuBZrx7UyZ1H5INI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d2a064346d90100
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqdxIO248kKtGMxJvpteQwBeD6K8r4AjJrooiPilaDM7KLvXF9UOYXoHVUdV10AjY2CDcS1l5OaUwJ87PNmQbnVRfsq8v8tBb00qMoIqnRWuFkQpDOTJzIiORbvu2GrWsuRwS+SAMxxJ2IIIQJwjfLNK2U2EMCBCJy6zmnKU0UBAoRFYHnlfTFjOz1JrbMIxbkYxEpwzY76TO0940+ny+PxkdQqPC25Co0l4T1JgFKUpIC0rCpcJPLZHfOMtLQk+eeDbqw9iXXyldNFvbZzoey3hrbWj2j1yY0CbSkIw8XjTIUYTQtWN7QDxGrdtBdQtxxFDtrLEgwjlD7Y9VRc4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmbT6IoJ1AqhVmNkzwkZF7P+epA4Rhyp0PS77kuVJ/g=;
 b=FesI2nvFF0MVqE7oz+P1qjcH3s6VayQQTQD6CUZOBf2ZQrC2gNmldfyPUgHywuzvoi+XXDrFEYhhsrWR7e1rXaCdoOcnC6wk6EQPyWNgOU640NipdUAmJrKdsqnR23YXdYvrHjo7AgwyFzg7v6IQtOrVDFKQFHT/oPLymlHxURZYT/FB6VOMntRe8jAJ3nkqnRJFtUR8Hvn2civIDkdQwukKuCKrVpcrCv+X1wJT7LeZZei/sYblbMDOASwYcpICiWB08h/qCzuMMFEFM5VoFQDFHJvZHLtuvWQ8BNm2ZnQ5JRs3rGvxR/H799GbjqpYOlT6Y8ZQ8hqD9l+1CkfDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmbT6IoJ1AqhVmNkzwkZF7P+epA4Rhyp0PS77kuVJ/g=;
 b=nSGTYDszzfSp3PjV6tJBIz9MlyUMOkZvg7p1cu3jmdRGjytU8jbIN1euxn/JzFw+AWlTqpQnvX/ZQx96R4NBHcxkccRcJ+cZWD9kX1vhHLKKFzjxkYpjwyTHlVbmiT8RVFiOVrZPwgzJu0LncXJykzrFbhURuBZrx7UyZ1H5INI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 01/14] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Topic: [PATCH v1 01/14] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Index: AQHXlPJtf5AaTUXmz0eDPPo+F/e1VKt6vqQAgAAhMYA=
Date: Thu, 19 Aug 2021 14:16:55 +0000
Message-ID: <4909CE53-15AE-4A6D-A32D-69B5E6AC6DDD@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
 <9022cf38-532f-05bd-d78d-50f46cdbd8f5@xen.org>
In-Reply-To: <9022cf38-532f-05bd-d78d-50f46cdbd8f5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b6f79e31-c4f2-44d1-94a6-08d9631c0c2b
x-ms-traffictypediagnostic: AM7PR08MB5319:|AM6PR08MB4456:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4456D2E5CB97C0B9AC8ECB4EFCC09@AM6PR08MB4456.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X0XwXUpYNHAB9pFxrsNtYD62J8C43Kn5Zq9OzIqDuw95jdwDiWsNjOvtfg1NFkIkNnkwzOgszMVsWiy19ebRMasg+R9024I9o13fWicBKAUYmO49F+b6OLBMpqAB3KaHU/3RHq0Vjc7/A5QbjqsM9JT1bN3UxgP+CZHPI6pVXLzQOc0vByBcWwE6u6u0vj9+DbxOxnccGMrF5Ql238G6HtEUayqM2CN+am6dlexs4TgzH15zmujC9F3G5LcrOuuYn54h3PG1GVIWdBnPjydW9vGGw+CZ1+feG53/JqSQLO/jjMVBxo9qL8p/leF3Mk5FNJj3l4w+Y/hBGNiRawbgDmn3N0GI8aqvbKgPguO5I7tS/IXAeGvnShVQpGLF48CSZJzi4EBfEQTb2Htp+gI4JPLaaxUGw4hMm6X4Qtv1nnL6tzWcUCInvGRKK5b9rFJEgde4WIxecdpzvTFEToC6W+hBqg5XaNmIpMLxetyokTd++0jJz4UN5hl0MqOaOufjR8cBRsCcQoVutHVx0HOVCkmcGJjHgiYmBZPt99rhk11AXqIPd/XlAs8mWxQMuLaP/hmrbQnr+3IiuUf7G74Pa3yyTgMW9skjjtXTc90NtLW1TdU26Gvelbqtf3pvTDLLL4Rh+CwyIOA8vBI9inPLsWoDzif0R09/4umSuSMgPWkLSfxquAURQSJ2y0aHmkCZM+dKAlZcibtVHJTZrV4+CXUWj4qibQtZ0QspAaP+H5C2jsEPQ1jKfiFt4QV+/eXp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39840400004)(76116006)(66446008)(5660300002)(66946007)(83380400001)(6486002)(71200400001)(6506007)(66556008)(53546011)(66476007)(2616005)(38100700002)(2906002)(6916009)(186003)(91956017)(6512007)(38070700005)(8676002)(7416002)(8936002)(316002)(4744005)(26005)(86362001)(33656002)(36756003)(478600001)(54906003)(64756008)(4326008)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JS6z2dZhEFCB/1+slbpP8j4oYRfcNJNA3ff9ryvCMnnBg9Ip+XMrCqVdi9?=
 =?iso-8859-1?Q?oY1HXSI0qAw9HJ8wO3ryTgNgdVh6wYfQsHgJxOn8B8PAPDEkKSVYrsEpez?=
 =?iso-8859-1?Q?yqNokXp20WXOkZTt3XL0vfucD+H8AXOhvHKkwgSDrpr9Rl6HZZn3BirYI0?=
 =?iso-8859-1?Q?hyRLMXlpMeWdNY34qTfalO6d8juH6i02rG6LEmyoFXbVKtIpeNfmeNVS7p?=
 =?iso-8859-1?Q?n9hl2KNN5GPfbusm5vO7RAPniVY1/TQojl95jR6Es9Xb9xfuC0lUfOaIQU?=
 =?iso-8859-1?Q?eSOzJdLrdCqNcKM7raNOU9nQRKIW74tsnz5UsxQOkjPPlJw66L5q6b+jBT?=
 =?iso-8859-1?Q?INUqxG0cZ2p7E4OnB910Uq+PQhUBhopGO2VsM0fp1FYTqkGDH92QhKlrWl?=
 =?iso-8859-1?Q?h6RowyzrjppmogDLiNzKQZcJLEff3cTQLfX5F1+ZoN3ebVHRSILOiv0v1/?=
 =?iso-8859-1?Q?z0AfTokpTjlOmUtOnlDg8W4YsyBANGGRivo+NO/C1WBB6wHE4caX6QOIiy?=
 =?iso-8859-1?Q?Rtnr8BuOKvvimPZGEoSpAuYiKqwbM3fXrRUg4zcXdAbDpPzl2RHd20Ge4g?=
 =?iso-8859-1?Q?MSz3Zjm9WCxV+joibcThOL5MCH+Lf/3as6Mgi3byoDIfrNWOBPffRUJ1Ri?=
 =?iso-8859-1?Q?cTw0FUwpe6cuQr/3piC6dw3i/FksQ8ytjr4L0zE0dgwPoz/NcfkBMvuULP?=
 =?iso-8859-1?Q?6czIHSZnR//cGyeEAdOKqhhxB4qTD9MkUsfpyQLTUodGDVH9opX/3BQzIi?=
 =?iso-8859-1?Q?+C1aBUMtImM70Ym/sdwRpk3j6ZToR5lLJfFZoz3uwpYxq158TrfuQzP6Ov?=
 =?iso-8859-1?Q?ULR7MPpzlyw4wVgY6mY5qalvzfCt3V/dBLyuL6Qeuqp0kf/6k+rRh+Qy9g?=
 =?iso-8859-1?Q?cYAZgA9MjrAa9EWojdXm0FurZkafn5PSaq4QSN9ZiHlKqGxba4lYd2CEqj?=
 =?iso-8859-1?Q?MGI9PcGYZfQFRJ8I2/bdafJD/kNapFGLfq+5OazuKcsVa0BUoTfjV6ma2x?=
 =?iso-8859-1?Q?kWNWhzibJ3R1g3Pcbtqh7hOQb0UPPndYrj0RmrWgwSzowaYhlSfad6dDW9?=
 =?iso-8859-1?Q?ROVYOyh4TXEzPePFePA9+KvfV2h8APcxJHJHYBf8vu1AsxocZk77pfdWIS?=
 =?iso-8859-1?Q?4P6E5FGek8YkMwxKLaHxeMzurq6Tek+Z3ya/YvGwLwCkYNzQSuL3tP7IWT?=
 =?iso-8859-1?Q?X/pz8YQl+N0kw85VqqVOYeaGl0/RgcOEa0nAdBQJqev4h/1qdcWAHjSbEK?=
 =?iso-8859-1?Q?c0IW7YQju9ywe/rK1xpV2026hF9Xfn1PKP+QUixU0Iy+9lIPGM91Dpf51s?=
 =?iso-8859-1?Q?LWkiVvdnFmb04Y1Akua8GkvGCX6F5jjPHHV1GqfwUNP7He8DtU14AMhF4+?=
 =?iso-8859-1?Q?sw/dBu83Rg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FED564671AB7284096D8F33B2114E7CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5319
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15f1a556-57fe-4895-8c4e-08d9631bffba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ynPkOqtP2jQ6/RNcC//9N0Fu7zzLES+ttwqF1MY3//XUEalUeTWEgOan4tV6chhcM1iwHPgsdTnMWSE26I8vgw+KRXzUY32W4+vpD3ecSjmvg1wzEVJEJK8OusmC1MLlIxUQEYsJk55WZ/UrTx5iWha7zfQ+9OKkRZZOlmLPfzcTs/FXAm1jGUCe4K8QcI4exMlv1RH4InET/jGz0E8De7BQmLlniai+7mqpN+/HkOEXH3MHnC5Job1NZcPPa52s352FzpsT1jo/Mh9SCS3a1BhxHeabyQ7eFCKSwhaLw+nFCRnN26fYMvv0VH9dB0VKKDKx4eszNR2FVdh37P3XskuAeeIYyWGT1/IlrIBKu3TdG/luUpkCWeFWN1Fgno1C0g6V4rYWwGT9ug8zijVuZWUQ1cY2yQl6sOk1kGGjVTCDktRi1tqxHLPialHm2F+0sTuxG42LuJ1avdTWRg7h95s59HEjKXWN6K/qaCkSqEBguIt+tmlyz6Sm1mPcExYFYeXAJEzjnYe7tyufX/ssxc2mTrtDwvT26w6Er3hFD27V07VguRL8fvyVw21u5b/l5nI2Clm4QelP76WJ9hxXKpmRRCYZTfn/YYio+zixNjqBNgjqg0AqRK+xDaQ+wmM2CTcjOPziJ8GBWzZuoyCdS7juUmkBicoTtU85UWh7rju4RYOxflbQJSjYqVt2HVjXFE810ySr5m6S2DSiV0drTQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(46966006)(36840700001)(478600001)(8936002)(54906003)(4744005)(5660300002)(6862004)(316002)(8676002)(6486002)(83380400001)(81166007)(356005)(82740400003)(107886003)(2906002)(36756003)(6512007)(4326008)(53546011)(6506007)(336012)(26005)(186003)(47076005)(86362001)(70586007)(70206006)(2616005)(33656002)(36860700001)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 14:17:16.2973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f79e31-c4f2-44d1-94a6-08d9631c0c2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4456

Hi Julien,

> On 19 Aug 2021, at 1:18 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 19/08/2021 13:02, Rahul Singh wrote:
>> MSI code that implements MSI functionality to support MSI within XEN is
>> not usable on ARM. Move the code under CONFIG_HAS_PCI_MSI flag to gate
>=20
> Can you clarify what you mean by not usable? Is it because we lack of sup=
port or we have no plan to use it?

We have no plan to use it. Code moved to CONFIG_HAS_PCI_MSI will only be re=
quired for ARM if we=20
decide to support PCI device access (PCI MSI interrupt support) within XEN.=
 As of now, we are planning=20
to add support for PCI device access for DOM0/DOMU guests not for XEN.=20

Regards,
Rahul

