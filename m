Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA45B2F78
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 09:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403853.646106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWY7W-0007Z4-FG; Fri, 09 Sep 2022 07:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403853.646106; Fri, 09 Sep 2022 07:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWY7W-0007Vy-BB; Fri, 09 Sep 2022 07:08:10 +0000
Received: by outflank-mailman (input) for mailman id 403853;
 Fri, 09 Sep 2022 07:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VBhl=ZM=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oWY7U-0007Vn-GD
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 07:08:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26002259-300e-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 09:08:04 +0200 (CEST)
Received: from AS9PR06CA0620.eurprd06.prod.outlook.com (2603:10a6:20b:46e::18)
 by AM9PR08MB5876.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 07:08:03 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::33) by AS9PR06CA0620.outlook.office365.com
 (2603:10a6:20b:46e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.13 via Frontend
 Transport; Fri, 9 Sep 2022 07:08:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 07:08:03 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Fri, 09 Sep 2022 07:08:03 +0000
Received: from a83b8054adf7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F2CD8B4-226B-4371-A3B0-89DB15FB8C0F.1; 
 Fri, 09 Sep 2022 07:07:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a83b8054adf7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 07:07:57 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS2PR08MB8719.eurprd08.prod.outlook.com (2603:10a6:20b:55f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 07:07:53 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::85e5:3479:7350:9113]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::85e5:3479:7350:9113%6]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 07:07:53 +0000
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
X-Inumbo-ID: 26002259-300e-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Dkus3QtP95I8rjUi30GcnQnaQ8y2/H+Nhe3aE/t6ORKTbopfdJstgiTYcE4+zu6dz4Ecz+cjZkU0W9gJElz4L2ucVbMn1DOHFbdu1jqxjuLcVgScX7NdWP1MFEHHVAmwWh8MA83JdRE9cW21Owxix0iOLjCoX4ghAUQnPVPwfRdRhfytHCYH1eXtmGnsYRCeGqSZ+zmUksPa+91Wsds3pwtUaeO5uVuQ7zcQfOE+v5F9Ns0NUZmT0PGZw/IklxErcSz3JdEcBpp2eUW9Xtd4t3fGf0uArsr1sS/MxYk0HJf43PqdYv2GGhNW1uxK/UYf+BqvvEzgg2WTuimXkeVHJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvWkcognY6wSHcm/z9A0QIbFtyhFhg/zGkjoyp/W7gM=;
 b=b6zWkKmpR/7/Dq7PFkf4QSDytFZ8A6HfK53e2cDEFAHo+NjC9glJ5JEkgh/3kOz4b+Z95N8GDySE6yNYw9FKA7tEc18bdLCwFHbgbdKhA42aKRVfnQ0/S2zwISOncI3QEaOjZ7ayowEF6/rdkKF4lymbd0MVBiVigQKnsxQaVN0nxhHI+CFgynjql5J380gaYOp42skbhW2ZvBDuMEGBNHR5QVJvauQNAQhX6fJjRJmUn67N7ehPIX/bIDjd6nGLFGxaS0sgESncfbSfoLD6WKQSnWl+1st8z/lIDBuYlav6G+cOm8QaXa4xLAPKfMdzSSIMWp+4RgMOnrBfv3zOGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvWkcognY6wSHcm/z9A0QIbFtyhFhg/zGkjoyp/W7gM=;
 b=eK2PWITKgpNsTu0k0kCUer5CKo/WNRkuqi87N8S76qgNEykaVZSWRnQ9np+Cz2BMogIWKn8DbbIMmDiaXAnMKl8nnIZSTNutvR5NXVPJMAAwFA6bdoxTfHVDpU2y9+E9O90EO4w7jJiYKvzD098ewEPl9Uhp9nW6fD7oK/py08Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QonGTrs6H7OHcFh/a7uqD40DS0RwViVUUU65C/u6XWe5wNHUN4zXPsgYJrARhezO93HMmMIM86fdg82dHyhkJhL9Fqy9TVvQIBFhA0PxW22UYyXJobsnRrbFmXiHV51n97T54fhzvQPTezOVq1xIC4x73E3npQbdrfGqZ5NLeYzdSSiFewSwkt9BeCwXMju9UZBxZ7hvHlJw2r2DkRyIDML0ZFXGEWMBgVSAgBQYW6AiCBnFO4j8MNQPIhNRME7afV3p6B3vZ4ccfSfOWn3Ek5luEHtZZZOobNv7999vnseOI+D3xbIy42JficgD1z4OMMXYLJMea6b3eaBAvxSzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvWkcognY6wSHcm/z9A0QIbFtyhFhg/zGkjoyp/W7gM=;
 b=RDeiA6qVLQwXy8NiWoFFe3xQssLiQqxgrQO4Pp20YQBv8IzQOPvs10op/tFpXIHJlJroy6lrLabhshxtovm+Gy+Q2HQcjVGwYtwIcx//fKqWCbkb09EjofpdhB3NUwaEEau1xfHS8omJFEFyF326LcORJPbIGQduXe0amm/E987gdrMLWKE92I3CuAxXVNbdpNOhyt0ylEjt3U47CqUpIxlf13NUa6yN5W2mSXwwWJcj8/F+H6jretA1CEeykzWNca23JxnoZKlCnutBxe/uxz4qgYxaKEBR19ik9V+dmRgclEmT/vZHg4vRk5uIQ42qqSmhArkHLk3TdtjOvIF2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvWkcognY6wSHcm/z9A0QIbFtyhFhg/zGkjoyp/W7gM=;
 b=eK2PWITKgpNsTu0k0kCUer5CKo/WNRkuqi87N8S76qgNEykaVZSWRnQ9np+Cz2BMogIWKn8DbbIMmDiaXAnMKl8nnIZSTNutvR5NXVPJMAAwFA6bdoxTfHVDpU2y9+E9O90EO4w7jJiYKvzD098ewEPl9Uhp9nW6fD7oK/py08Y=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Topic: [PATCH v4 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Index: AQHYvnyUZh7WY/u61UisC2n0bZDyXq3ViaOAgAAfcVCAABKJgIAA/F0w
Date: Fri, 9 Sep 2022 07:07:53 +0000
Message-ID:
 <PAXPR08MB7420BBA2B8C7064ED41C23CC9E439@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-6-wei.chen@arm.com>
 <837f7b6d-0d73-a352-17e6-5c12e06dab95@suse.com>
 <PAXPR08MB742067502302D24B961B9CCE9E409@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <cb369beb-803d-c11b-37ed-7fce6c9e8988@suse.com>
In-Reply-To: <cb369beb-803d-c11b-37ed-7fce6c9e8988@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 62D8218B7F169F4DA69344CA9EF3109A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS2PR08MB8719:EE_|AM7EUR03FT027:EE_|AM9PR08MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee92b6d-8292-4875-2ba7-08da923209a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gEr/WohLPQsjGpJNPAqzFaeAY9XwC1TGjt8sidMXyb8tiKs7tmPFVJi9ZDl33l6TO9U2wr5yNYJDCfXICVWFrLGAeHgc1R0qO2x/hHXCJ04iXF29oIUAhQxsa6Sc8enwUjkcZBLq6l/SRbdtz0FTdDYha1DdSY8HntsOulTyMFkCjHHBnrQIYXNGf817nWpPzmCjtDS+Ml2jAshU6ZllNohAAl60z61nC6iRnqINcFZ2aUoydbgkTI6hFT/OiHVHj/bUKlooTUjVgHTb4uzyvnhVo7fIPsnLifWaJShj8IRlZ4R5NPwWid/gFbcathry4m6bzIA+9++19F42REgk0MAJOfod+HvVdAtcFxaXcKBDjvEpaHyv9FGJoi6ZW9tmZAB4ODgEsE8NQXhRNl7Poym3qb9EmBgvdfmeH6umZl0IOzfpE1Qg4HSsM7unqLxwPNpH4/1S7uloImPleO7HmvtewmdADAo8CCnlIVs9qz/jkvBi0ioe4lhtb+iiKIFvfBL5nTMdf0diXvKNz/5r5oxZvChQGBWVLXmY0JBGTpL7rI5oc0bvIn2WbMY9ZTyo8RoSESTdZJ96c22gV4Kb3cWDGN6ISuNSmEJBSFYSnb8H36q9KuiFbyc8Ok/sSMxDzZBUJO67NoJTQMtKZjyuJrx4dpEotwgSIjjovfDEGuBD5w+T1pd6cYOTCWWoj5MDMz7mhR4YEr/QyIjBF4J0ZNZm3U1YpxS51fBTiGJjfNZxTBqHd+mjQ1Db+1iBM3lopzqWa2/e+7jEpOoGmgYaKg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(66946007)(41300700001)(7696005)(38070700005)(122000001)(38100700002)(4326008)(8676002)(64756008)(76116006)(54906003)(66476007)(316002)(66446008)(6916009)(66556008)(2906002)(55016003)(9686003)(8936002)(52536014)(83380400001)(86362001)(478600001)(186003)(26005)(6506007)(53546011)(71200400001)(5660300002)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8719
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a2cc4a6-4f02-45c9-0609-08da923203b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RD1QlffMi+QBHuKUTvz20AyJCO8AQK01wfQrXuA794KdKHwMvVH6RgMBAvbSVx1K3S1uqBwo8UTdq8hGyujxgsml52zfIs30dMbXDkZKVFyosmn6PHJW+i2/KWb8kmlBNR3qi9mOUSMJjy/bBhfEwLMQS5L7heUFZ+DEof8BF9C7XBR6dGINv45hHqeNzI2nnKhYEkLZtyi1UnxttvhzRTUsBD/D46f3idEv/KO5jrPPZ+NihV70CHzidHTF3CHSvWYIVoUxgg7XqAVEoqT81CGVqoWEKC1sET6/PefFSHIGkBJ2n+ojnY+9tgb2nWSFwxlaqbrWXhd5IeAoweFlazMXq4KPR/JVegX2EnLSxJvCCZyq0TPB3CNCa2SRq3c4O8hko9+s0tdLed5p+IOnBcwG9UK/rJWTTBnsylTdFywm9c8kqT1FCtuCAph6vdlPv3nK9z5nNuiFoX9QPoA6MuI87yq7ZDtVYKXG/o+FwT+JoS9tQMeQq9RnUDpzcGDhiOgA7mQcFBAmnPQ/WpTfBzpLIRh0I7LqVd6daeJJRPmKeM3j/RDhc8CWUB9Q9OokoowmNbBYPeP6J5hhU6vLV8my0NVskqvnzsbWsYbqHEiJM9gefVNZ3EzGdbuENG/QnEsf9aLN3HHn3lL88KDVuhrANvPrAQKHZYv0K1hAG0ugdQjRW4o1YbzmIZzxOZOsphGSTQPSqJpGIqzOZg6Ror6diyLC/6wyWrZlGDhDHYbf/2UsNlhNerKbkv//tiebICFAAhWJCo9FlmLs5CvJ4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(36840700001)(46966006)(40470700004)(47076005)(186003)(336012)(5660300002)(8936002)(52536014)(2906002)(6862004)(70586007)(70206006)(4326008)(8676002)(26005)(6506007)(9686003)(53546011)(33656002)(7696005)(40480700001)(55016003)(41300700001)(83380400001)(82310400005)(478600001)(356005)(81166007)(36860700001)(86362001)(40460700003)(316002)(82740400003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 07:08:03.3233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee92b6d-8292-4875-2ba7-08da923209a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5876

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDnmnIg55pelIDA6MDINCj4g
VG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogbmQgPG5kQGFybS5jb20+OyBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgR2Vvcmdl
IER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY0IDUvNl0geGVuL3g4NjogbW92ZSBOVU1BIHNjYW4gbm9kZXMgY29kZXMgZnJvbSB4ODYNCj4g
dG8gY29tbW9uDQo+IA0KPiBPbiAwOC4wOS4yMDIyIDE3OjI2LCBXZWkgQ2hlbiB3cm90ZToNCj4g
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiAyMDIy5bm0OeaciDjml6UgMjE6MDMNCj4gPj4N
Cj4gPj4gT24gMDIuMDkuMjAyMiAwNTozMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiAtLS0gYS94
ZW4vYXJjaC94ODYvbnVtYS5jDQo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYvbnVtYS5jDQo+ID4+
PiBAQCAtNDEsOSArNDEsMTIgQEAgaW50IF9faW5pdCBhcmNoX251bWFfc2V0dXAoY29uc3QgY2hh
ciAqb3B0KQ0KPiA+Pj4gICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICB9DQo+ID4+Pg0KPiA+
Pj4gLWJvb2wgYXJjaF9udW1hX2Rpc2FibGVkKHZvaWQpDQo+ID4+PiArYm9vbCBhcmNoX251bWFf
ZGlzYWJsZWQoYm9vbCBpbml0X2FzX2Rpc2FibGUpDQo+ID4+DQo+ID4+IEknbSBhZnJhaWQgbXkg
cXVlc3Rpb24gYXMgdG8gdGhlIG1lYW5pbmcgb2YgdGhlIG5hbWUgb2YgdGhlIHBhcmFtZXRlcg0K
PiBoYXMNCj4gPj4gcmVtYWluZWQgdW5hbnN3ZXJlZC4NCj4gPj4NCj4gPg0KPiA+IFNvcnJ5LCBJ
IG1pZ2h0IG1pc3NlZCBzb21lIGNvbnRlbnRzIG9mIHlvdXIgcmVwbHkgaW4gdjMuIFRoZSBuYW1l
IG9mDQo+IHRoaXMNCj4gPiBwYXJhbWV0ZXIgaGFzIGJlZW4gYm90aGVyaW5nIG1lIGZvciBhIGxv
bmcgdGltZSwgYW5kIG5vdyB0aGlzIGlzDQo+IGFjdHVhbGx5DQo+ID4gcXVpdGUgYXdrd2FyZC4g
VGhlIG9yaWdpbiBvZiB0aGlzIHBhcmFtZXRlciBpcyBiZWNhdXNlIHRoZSBjdXJyZW50IE5VTUEN
Cj4gPiBpbXBsZW1lbnRhdGlvbiB3aWxsIG1ha2UgZGlmZmVyZW50IGp1ZGdtZW50cyB1bmRlciBk
aWZmZXJlbnQgdXNhZ2UNCj4gPiBjb25kaXRpb25zIHdoZW4gdXNpbmcgYWNwaV9udW1hLiBJbiBh
Y3BpX3NjYW5fbm9kZXMsIGl0IHVzZXMgYWNwaV9udW1hDQo+IDw9IDANCj4gPiBhcyB0aGUgY29u
ZGl0aW9uIGZvciBqdWRnaW5nIHRoYXQgQUNQSSBOVU1BIGlzIHR1cm5lZCBvZmYuIEJ1dCBvbmx5
IHVzZQ0KPiA+IGFjcGlfbnVtYSA8IDAgYXMgY29uZGl0aW9uIGluIHNyYXRfZGlzYWJsZWQgYW5k
IGVsc2V3aGVyZS4gSSB1c2UgdGhpcw0KPiA+IHBhcmFtZXRlciBpbiB0aGUgaG9wZSB0aGF0IHdl
IGNhbiBrZWVwIHRoZSBzYW1lIHNlbWFudGljcyBhcyB0aGUNCj4gb3JpZ2luYWwNCj4gPiBjb2Rl
IHdpdGhvdXQgY2hhbmdpbmcgdGhlIGNvZGUgb2YgdGhlIGNhbGxlci4NCj4gDQo+IFRoZSBkaWZm
ZXJlbmNlIGlzICJiYWQgb25seSIgdnMgImJhZCBvciBubyBkYXRhIi4gTWF5YmUgdGhhdCdzIGVh
c2llcg0KPiB0byBleHByZXNzIHZpYSB0d28gZnVuY3Rpb25zIC0gYXJjaF9udW1hX2Rpc2FibGVk
KCkgKGNoZWNraW5nIDw9IDApDQo+IGFuZCBhcmNoX251bWFfYnJva2VuKCkgKGNoZWNraW5nIDwg
MCk/IFdpdGggYSBzaW5nbGUgZnVuY3Rpb24gSSBndWVzcw0KPiB0aGUgbmFtZSBvZiB0aGUgcGFy
YW1ldGVyIHdvdWxkIGFsd2F5cyBiZSBjbHVtc3kgYXQgYmVzdC4gVW5sZXNzDQo+IHNvbWVvbmUg
aGFzIGEgZ29vZCBpZGVhIGZvciBhIHN1aXRhYmxlIG5hbWUgLi4uDQo+IA0KDQpZZXMsIEkgY2Fu
J3QgZmluZCBhIGdvb2QgbmFtZSBmb3IgdGhlIHBhcmFtZXRlciwgc28gYnJlYWsgaW50byB0d28g
ZnVuY3Rpb25zDQp3b3VsZCBiZSBiZXR0ZXIsIEkgd2lsbCBkbyBpdCBpbiBuZXh0IHZlcnNpb24u
DQoNCj4gPj4+IC0tLSBhL3hlbi9kcml2ZXJzL2FjcGkvS2NvbmZpZw0KPiA+Pj4gKysrIGIveGVu
L2RyaXZlcnMvYWNwaS9LY29uZmlnDQo+ID4+PiBAQCAtNyw0ICs3LDUgQEAgY29uZmlnIEFDUElf
TEVHQUNZX1RBQkxFU19MT09LVVANCj4gPj4+DQo+ID4+PiAgY29uZmlnIEFDUElfTlVNQQ0KPiA+
Pj4gIAlib29sDQo+ID4+PiArCXNlbGVjdCBIQVNfTlVNQV9OT0RFX0ZXSUQNCj4gPj4NCj4gPj4g
QXJlIHlvdSBzZWxlY3RpbmcgYW4gb3B0aW9uIGhlcmUgd2hpY2ggZG9lc24ndCBleGlzdCBhbnl3
aGVyZT8gT3INCj4gPj4gYW0gSSBvdmVybG9va2luZyB3aGVyZSB0aGlzIG5ldyBvcHRpb24gaXMg
YmVpbmcgYWRkZWQ/DQo+ID4+DQo+ID4NCj4gPiBZZXMsIHRoaXMgaXMgYSBuZXcgS2NvbmZpZyBv
cHRpb24uIFNob3VsZCBJIG5lZWQgdG8gaW50cm9kdWNlIGluIGENCj4gPiBzZXBhcmF0ZSBwYXRj
aD8NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhhdCdsbCBuZWVkIHRvIGJlIGluIGEgc2VwYXJhdGUg
cGF0Y2g7IGl0IGNhbiBzaW1wbHkNCj4gYmUgYW5vdGhlciBodW5rIGluIHRoZSBvbmUgaGVyZSwg
YWRkaW5nIHRoZSBuZWVkZWQgMiBsaW5lcyAocGx1cyBhDQo+IGJsYW5rIG9uZSkgdG8sIHByZXN1
bWFibHksIGNvbW1vbi9LY29uZmlnLg0KDQpPay4NCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0KPiAN
Cj4gSmFuDQo=

