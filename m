Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A85F523547
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326948.549620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonDa-0003EA-5h; Wed, 11 May 2022 14:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326948.549620; Wed, 11 May 2022 14:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonDa-0003Br-2A; Wed, 11 May 2022 14:21:34 +0000
Received: by outflank-mailman (input) for mailman id 326948;
 Wed, 11 May 2022 14:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nonDY-0003Az-PU
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:21:32 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe05::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7b2a1d2-d135-11ec-a406-831a346695d4;
 Wed, 11 May 2022 16:21:32 +0200 (CEST)
Received: from DB6PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:6:2d::12) by
 HE1PR0801MB1739.eurprd08.prod.outlook.com (2603:10a6:3:85::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.23; Wed, 11 May 2022 14:21:29 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::c0) by DB6PR07CA0002.outlook.office365.com
 (2603:10a6:6:2d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 14:21:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 14:21:27 +0000
Received: ("Tessian outbound 9a0893f586e2:v119");
 Wed, 11 May 2022 14:21:26 +0000
Received: from 904b2bbc35ff.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC167DBE-5EF8-4CD8-A855-9390517EA89E.1; 
 Wed, 11 May 2022 14:21:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 904b2bbc35ff.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 14:21:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB5370.eurprd08.prod.outlook.com (2603:10a6:10:112::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 14:21:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:21:17 +0000
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
X-Inumbo-ID: a7b2a1d2-d135-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OxsH5CJT2qcBSBKQTJThH93ryCjHRRZFm4rqXg/WuMFmorvz0eh/7vzD/gLyhwmIvtlg6nSWGr15W9x8WjQO7ERgw1jNo/fl0ttOCepv3Ic0vmdZeQCNqjy8G873LMbipMyrfcg5ePwbzmXo+Vd7dvziDV2bDgGCtLqw25OQVhp2BNj8YmNPQ8+oKVRRK7c0ih52ZUrhPb0blQK70O9gLYVzQejjMcYnVrCqAe/ifHX5pOvIH1Dxbek18PQiqPUfupaBuq1WPXlmaGFX2UH5hVJsotSluD883UtV5nJHcbd8kDpHoDqzf/XKb1Mu18vrAFZgDJhzIaG22lQnkuFY9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzyET3GtCmHsu562TCVlWC4N8rKlh+0rW8RuRnsTTB8=;
 b=E+sBmCJ7sOzLx2IT8DX1OAnn+EDsLCa0QBWODjQxxmIRqjbbZgnPws6CmYodQOZ2ssQhicW5qQd/ghcuAssoto1ebIwabV5MtDIqqIqFZcVBi6TcB0igjLZcG4zK0/8l7TQGOrfwuJrQqszTehWsS38W4ALoDv0Y2W186GZzS60SizEv41YnYcqcvfboHZP2XCssriqtGr/KGm5dpUJ1k02TlGjAF+H5+mUddmeEGn5aNDfR6c94RPWVckkRHhOqa1NB/kH2IOKtuwoGeGKiJckZ/4nDiTxGSRr504ypH9qq9HlsN3utfGj45NHFLLwZ72KmtvcTWS8hq3KVztfiGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzyET3GtCmHsu562TCVlWC4N8rKlh+0rW8RuRnsTTB8=;
 b=cWL8nk7fSLpbjYpEZ5N4MneJkaAzmjbR1TJMr/NJrkQXY2cPCDs2ZA3oMVLm9qiMtn5OlcCtt2Zx3o+sWbyG9uGEYWvkYBp/hJHAR1FG42zYuoSqtXlUChJx5GblqweCU6tHOQ98yEnZ1i+rgNucorGrX4NViQtKJ//BnrNcdVo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2df19b6a6c9a6106
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRMbteddE0VrDqiijUKtR9YyU2Kbuw1+HCAR/xqzTyqZHaLaq7sM7hnzMZaitpF6FExXy1XRbIr+Pm+0VxXpWQuTx+abZHSSyGPel+LCqyBn9I80Ml6DgsnWXq4aSawT3B7AkTgRlfNTCLum6Zd4XMivUnUWEdp5ozYAw7cNVl1kBk9dXmj7u1tvbgZ7JtYfsiN6H1DoB56AE2Od0i4VT/2eVdBjuxdbOdDEnc45W3ryk/BhsITMALmM+Odvy27bLI/auLFW34oP7f+auPkruLkqr1mByjcvilSwnIQyVkXjoNjwYmqooy5mtv2NOK++Jsbqj3rC+dK+YPuBEUE1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzyET3GtCmHsu562TCVlWC4N8rKlh+0rW8RuRnsTTB8=;
 b=RkfHbDoj1InugFHiDcPYquITMYDYL1H/PF6K3lHY78oof+VkoY2a69XZkeC63P6gpmJGdvKq4gwbajnHpQgchH87twxPKmLqlysIkWORZNVSZG89IUl7OtvN3EZ9zFMSvaSVHrrU4mFMrKt8hTEoVVFcuycPeQsFfg02deQiraPX0qcE9YNi+HY5u23oCrVF3wqbVS3Jz1Qrrb7CdcwNJXnq0EM+SpDs5AiYoy/YopvN+IByN0DVF8E7LvLd0CPBtElwaCAmRIgI8oL9XmZPizDVvb7IDerTOoSqGaJxpNOilcCZc5RnyRjODK5Jktgryl3qZdn56BNDRQhJmomraQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzyET3GtCmHsu562TCVlWC4N8rKlh+0rW8RuRnsTTB8=;
 b=cWL8nk7fSLpbjYpEZ5N4MneJkaAzmjbR1TJMr/NJrkQXY2cPCDs2ZA3oMVLm9qiMtn5OlcCtt2Zx3o+sWbyG9uGEYWvkYBp/hJHAR1FG42zYuoSqtXlUChJx5GblqweCU6tHOQ98yEnZ1i+rgNucorGrX4NViQtKJ//BnrNcdVo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: George Dunlap <george.dunlap@citrix.com>
CC: Julien Grall <julien@xen.org>, =?utf-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?=
	<lin.liu@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Topic: [PATCH v3 4/6] xen: Switch to byteswap
Thread-Index: AQHYZFb+rXOikPJI0E2wxRXQiKvDPK0X7v0AgAFJfgCAACKxAIAAPIwAgAAkW4A=
Date: Wed, 11 May 2022 14:21:17 +0000
Message-ID: <C03D33C9-1E28-4119-989A-B7294F2E0CCF@arm.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <SJ0PR03MB5405E449B19691A916EA3FE79DC89@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <82e54293-926e-b7ee-7091-a85a9db8f6c5@xen.org>
 <6F5998A0-636F-4AFC-847D-F0CFAC5B624E@citrix.com>
In-Reply-To: <6F5998A0-636F-4AFC-847D-F0CFAC5B624E@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a8a981d1-2e26-4ec9-2301-08da33598905
x-ms-traffictypediagnostic:
	DB8PR08MB5370:EE_|DBAEUR03FT046:EE_|HE1PR0801MB1739:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB17393983A9F2A8B66FB3AA0A9DC89@HE1PR0801MB1739.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cgHIVeD30fGkhR5qzsbZvZXhougd5pV3CVMOsCdNpok+72/Qa3jZCSw51DNrXSdd8to7owIbAvs2/YuGjSXn11F+EnNbFZg3EI4HrLen2ZCX1HN2mBxFT+v8N8gtzJEfDS/g+o+v67Jqrxc1lXxmJbR/q2ITKZpC3L89Hc5LGjaSMBJQkCZ6l7v+os8i52AZMJoFnjy90e8T+tGiKL+slZnL5Eutw/j/jXqQ6Ooy6Lc4XkHY7zyfquXLTgtN9ABneNxkoo+BXxrbCBliNRerUxV5g26oE2gOyLBIU3jYu3CRg+GvXqxCSnGgQRn0FtwOyz53kJ1laqyfuMIrUKyqXujJwA0+7UcohpGXR1PdVe4n83OgRRYZf6C4TDBGzAjWMGi8JvO7DLNzLpPLwbFz11vuIF53WZddZSsuXu2VuT5chtrOAYmHY58i3AFcUNvRxA/zEPLQnjC5vKBYcdyqHTOciihMQNO8NVXMPdOF1BUnfGIBa8Tg4db/apmGbttpbxrlQcFcp8aK16choDomAJGoNW5dFbNkc9fqPMDbAEwBAPrUADfK9tPkzQ9DoXv64ZIan/sluTUxco6L0OCWLefH0ldiSKRuQ61mtd6lBLXeJGuJlr5M9pTYpo13Vv08sIgdB9lpOmA2RYDj8Z17CocAOWn8wX4TqKdjbKEsVKF4O34/YKkYWMaAap+fGBSagDlJRGAthM0gdW260Af2+zdwJKK65M4NES78+VwCMF4S35C/kADBo80QSawAiYry+RS+J4Xsl/T9M0vO+uLaITV4xF9Nmk6Kp5GUXFCbL7DfDWBhDscg4Vodt39kr6mCjG+lf6FquI3GuEgT4Quufw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(2616005)(122000001)(6512007)(38070700005)(26005)(4326008)(66446008)(36756003)(8676002)(64756008)(6916009)(186003)(66476007)(91956017)(66556008)(316002)(76116006)(54906003)(66946007)(2906002)(5660300002)(71200400001)(53546011)(508600001)(86362001)(6506007)(966005)(33656002)(6486002)(8936002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00E83691E1D2BC45994C83824462032F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5370
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dce079a5-bef3-40e4-e279-08da3359837b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z3LV0rJGk5ERkGH3nZ1W2aZqpKVBRjjjmDJIuGAdZ0/AL9IWnMbtKeS1WTIQvsBD6Kfg3LYCcvCcQRlhK1iA81Ab4ygvvcSgS79nN+U87nCgoj1Xi/s2xBN3zP6MHFT+ZW1C76JD1qz+hXzyJyuJoQ887InOTJm2Tm/1OBKpjWseotWkiu5YMdgZj4uAf0Bdiuzv+ZWSDV5u4E7a+Pi3W4sAHBG4qX3R+rCk5unkk0dT6AHkn6thOqplYgmJIj2CyJhEpPiokOfQlJOzxX3O0Wtvqs7jZ2Kfyclqptt7mnO/mRdzp+dI3mJAFMCgxL3DNGuTXimDnWnpQh6/I/UlzEXTujAX+lm6TPEnLJVoXTkqEnd8X46eGTrUrbGvtJwTxXXpfHJpfoUtCHw0NpQ4q15DIII3O+u8KQvmE9+vQHmE5BXrHXrPNlA5acvRXNk82sjzYTrvG4SqjE8XEkQ0A5Y45nl49PjxpHqC6kSMkHFbE1lg4RJ56p5BqfCB8vIYS3ael7t2MAHWIpF0L1h4yrwizfrITzsiGL532N9XJdQOlxMHXAMirdkzRbKllj9Oojo+lnLWz64plhpEciTLsTP3FIGHEc7Swqp6CKP6YprtrDD/bOnaoW7lmMcVhDYyWf1q9K2ZXLOSoqgsNmjlnxEe3MGCdxcX7ARHlHX+YC6aXQg3nkwfV+WZMgQLQV0wyfIiRPo0CSgNglYoyz7+vR8IMaBXSpZ4WkZgI4YVFOyaTlh2DKglzzi+uO9ApIP9kCKJ17cC60T2pCcdaQJv+g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(5660300002)(86362001)(6506007)(6486002)(8936002)(33656002)(966005)(53546011)(2906002)(81166007)(356005)(83380400001)(6512007)(26005)(2616005)(36860700001)(40460700003)(186003)(336012)(47076005)(54906003)(70586007)(70206006)(316002)(4326008)(6862004)(36756003)(8676002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:21:27.0267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a981d1-2e26-4ec9-2301-08da33598905
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1739

SGkgR2VvcmdlLA0KDQo+IE9uIDExIE1heSAyMDIyLCBhdCAxMzoxMSwgR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIE1heSAx
MSwgMjAyMiwgYXQgOTozNCBBTSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6
DQo+PiANCj4+IEhpLA0KPj4gDQo+PiBQbGVhc2UgY29uZmlndXJlIHlvdXIgZS1tYWlsIGNsaWVu
dCB0byBzZW5kIGluIHBsYWluIHRleHQuDQo+PiANCj4+IE9uIDExLzA1LzIwMjIgMDc6MzAsIExp
biBMaXUg77yI5YiY5p6X77yJIHdyb3RlOg0KPj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNC82
XSB4ZW46IFN3aXRjaCB0byBieXRlc3dhcA0KPj4+IE9uIDEwLzA1LzIwMjIgMTE6MTUsIExpbiBM
aXUgd3JvdGU6DQo+Pj4+IFVwZGF0ZSB0byB1c2UgYnl0ZXN3YXAgdG8gc3dhcCBieXRlcy4NCj4+
Pj4gDQo+Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPj4+PiANCj4+Pj4gU2lnbmVkLW9mZi1i
eTogTGluIExpdSA8bGluLmxpdUBjaXRyaXguY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+Pj4gQ2M6IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+Pj4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KPj4+PiBDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBj
aXRyaXguY29tPg0KPj4+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+
PiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4+Pj4gQ2hhbmdlcyBpbiB2MzoNCj4+Pj4gLSBV
cGRhdGUgeGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jIHRvIHVzZSBiZTMyX3RvX2NwdQ0KPj4+PiAt
IEtlZXAgY29uc3QgaW4gdHlwZSBjYXN0IGluIHVuYWxpZ25lZC5oDQo+Pj4+IC0tLQ0KPj4+PiB4
ZW4vY29tbW9uL2RldmljZV90cmVlLmMgfCA0NCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0NCj4+Pj4geGVuL2NvbW1vbi9saWJlbGYvbGliZWxmLXByaXZhdGUuaCB8IDYgKystLQ0KPj4+
PiB4ZW4vY29tbW9uL3h6L3ByaXZhdGUuaCB8IDIgKy0NCj4+Pj4geGVuL2luY2x1ZGUveGVuL3Vu
YWxpZ25lZC5oIHwgMjQgKysrKysrKystLS0tLS0tLQ0KPj4+PiA0IGZpbGVzIGNoYW5nZWQsIDM4
IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYyBiL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYw0KPj4+
PiBpbmRleCA0YWFlMjgxZTg5Li43MGQzYmUzYmU2IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vY29t
bW9uL2RldmljZV90cmVlLmMNCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jDQo+
Pj4+IEBAIC0xNzEsNyArMTcxLDcgQEAgYm9vbF90IGR0X3Byb3BlcnR5X3JlYWRfdTMyKGNvbnN0
IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbnAsDQo+Pj4+IGlmICggIXZhbCB8fCBsZW4gPCBzaXpl
b2YoKm91dF92YWx1ZSkgKQ0KPj4+PiByZXR1cm4gMDsNCj4+Pj4gDQo+Pj4+IC0gKm91dF92YWx1
ZSA9IGJlMzJfdG9fY3B1cCh2YWwpOw0KPj4+PiArICpvdXRfdmFsdWUgPSBiZTMyX3RvX2NwdSgq
dmFsKTsNCj4+Pj4gVGhpcyBjb2RlIGhhcyBiZWVuIHRha2VuIGZyb20gTGludXggYW5kIEkgd291
bGQgcmF0aGVyIHByZWZlciB0byBrZWVwDQo+Pj4+IHRoZSAqY3B1cCogaGVscGVycyB0byBhdm9p
ZCBhbnkgY2hhbmdlcyB3aGVuIGJhY2twb3J0aW5nLg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL3VuYWxpZ25lZC5oIGIveGVuL2luY2x1ZGUveGVuL3VuYWxpZ25lZC5oDQo+Pj4+
IGluZGV4IDBhMmIxNmQwNWQuLjE2YjJlNmY1ZjAgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi91bmFsaWduZWQuaA0KPj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdW5hbGlnbmVk
LmgNCj4+Pj4gQEAgLTIwLDYyICsyMCw2MiBAQA0KPj4+PiANCj4+Pj4gc3RhdGljIGlubGluZSB1
aW50MTZfdCBnZXRfdW5hbGlnbmVkX2JlMTYoY29uc3Qgdm9pZCAqcCkNCj4+Pj4gew0KPj4+PiAt
IHJldHVybiBiZTE2X3RvX2NwdXAocCk7DQo+Pj4+ICsgcmV0dXJuIGJlMTZfdG9fY3B1KCooY29u
c3QgdWludDE2X3QgKilwKQ0KPj4+PiBJIGhhdmVuJ3QgY2hlY2tlZCB0aGUgZXhpc3RpbmcgaW1w
bGVtZW50YXRpb24gb2YgYmUxNl90b19jcHVwKCkuDQo+Pj4+IEhvd2V2ZXIsIHRoaXMgbmV3IGFw
cHJvYWNoIHdvdWxkIGFsbG93IHRoZSBjb21waWxlciB0byB1c2UgYSBzaW5nbGUgbG9hZA0KPj4+
PiBpbnN0cnVjdGlvbiB0byByZWFkIHRoZSAxNi1iaXQgdmFsdWUgZnJvbSBtZW1vcnkuIFNvIHRo
aXMgY2hhbmdlIG1heQ0KPj4+PiBicmVhayBvbiBwbGF0Zm9ybSB3aGVyZSB1bmFsaWduZWQgYWNj
ZXNzIGlzIGZvcmJpZGRlbiAoc3VjaCBhcyBhcm0zMikuDQo+Pj4+IH0NCj4+Pj4gDQo+Pj4+IHN0
YXRpYyBpbmxpbmUgdm9pZCBwdXRfdW5hbGlnbmVkX2JlMTYodWludDE2X3QgdmFsLCB2b2lkICpw
KQ0KPj4+PiB7DQo+Pj4+IC0gKihfX2ZvcmNlIF9fYmUxNiopcCA9IGNwdV90b19iZTE2KHZhbCk7
DQo+Pj4+ICsgKihfX2JlMTYgKilwID0gY3B1X3RvX2JlMTYodmFsKTsNCj4+Pj4+IFdoeSBkaWQg
eW91IGRyb3AgdGhlIF9fZm9yY2U/DQo+Pj4gR29vZ2xlIHRvbGQgbWUgX19mb3JjZSBpcyB1c2Vk
IGluIGxpbnV4IGtlcm5lbCB0byBzdXBwcmVzcyB3YXJuaW5nIGluIHNwYXJzZSwNCj4+PiBodHRw
czovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy81MzEyMDYxMC93aGF0LWRvZXMtdGhlLWF0
dHJpYnV0ZS1mb3JjZS1kbw0KPj4+IElzIHNwYXJzZSBhbHNvIHVzZWQgaW4geGVuPw0KPj4gDQo+
PiBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgdXNlIG9mIFNwYXJzZSBpbiBYZW4sIGJ1dCBpdCB3b3Vs
ZCB0ZWNobmljYWxseSBiZSBwb3NzaWJsZS4NCj4+IA0KPj4gSG93ZXZlciwgbXkgcG9pbnQgaGVy
ZSBpcyBtb3JlIHRoYXQgdGhpcyBjaGFuZ2Ugc2VlbXMgdG8gYmUgdW5yZWxhdGVkIHRvIHdoYXQg
dGhlIHBhdGNoIGlzIG1lYW50IHRvIGRvIChpLmUuIHN3aXRjaGluZyB0byBieXRlc3dhcCkuIFNv
IGlmIGl0IGlzIHVubmVjZXNzYXJ5LCB0aGVuIGl0IHNob3VsZCBiZSBkcm9wcGVkIGZyb20gdGhp
cyBwYXRjaC4NCj4gDQo+IEkgdGhpbmsgbWFraW5nIHBlb3BsZSBwdWxsIGxpdHRsZSBjaGFuZ2Vz
IGxpa2UgdGhpcyBvdXQgaW50byBzZXBhcmF0ZSBwYXRjaGVzIGlzIGFza2luZyB0b28gbXVjaC4g
SXTigJlzIGEgbG90IG9mIGV4dHJhIGVmZm9ydCBvbiB0aGUgcGFydCBvZiB0aGUgc3VibWl0dGVy
IGZvciBiYXNpY2FsbHkgbm8gdmFsdWUuIFdlIGNvbW1vbmx5IGRvIGxpdHRsZSBjbGVhbi11cHMg
bGlrZSB0aGlzIGluIHBhdGNoZXMsIGFuZCBqdXN0IHJlcXVpcmUgYSBjb21tZW50IGF0IHRoZSBi
b3R0b20sIGxpa2UgdGhpczoNCj4gDQo+IDg84oCUDQo+IA0KPiBXaGlsZSBoZXJlOg0KPiAtIERy
b3Ag4oCYX2ZvcmNl4oCZIGtleXdvcmQsIHdoaWNoIGlzIG9ubHkgbmVlZGVkIHdoZW4gcnVubmlu
ZyB0aGUgU3BhcnNlIGFuYWx5c2lzIHRvb2wNCj4gDQo+IOKAlD44DQo+IA0KPiBJIGRvIGFncmVl
IHRoYXQgbWlub3IgY2hhbmdlcyBsaWtlIHRoaXMgbmVlZCB0byBiZSBkZXNjcmliZWQsIHNvIHRo
YXQgcGVvcGxlIDUgeWVhcnMgZnJvbSBub3cgaGF2ZSBzb21lIGhvcGUgb2YgZmlndXJpbmcgb3V0
IHdoYXTigJlzIGdvaW5nIG9uLg0KDQpJIGZ1bGx5IGFncmVlIGhlcmUuIFRoZSBlZmZvcnQgaW52
b2x2ZWQgYnkgc3BsaXR0aW5nIGEgcGF0Y2ggaW4gc2V2ZXJhbCBvbmVzIChib3RoIGZvciB0aGUN
CmNvbnRyaWJ1dG9yIGFuZCB0aGUgbWFpbnRhaW5lcnMpIG1lYW5zIGl0IHNob3VsZCBiZSBwcmV2
ZW50ZWQgdW5sZXNzIHRoZSBvcmlnaW5hbCBwYXRjaA0KY291bGQgbm90IGJlIHJldmlld2VkIGFz
IGlzIChwYXRjaCB0byBsb25nIG9yIHRvIGNvbXBsZXggdG8gdGVzdCBmb3IgZXhhbXBsZSBidXQg
dGhlcmUNCm1pZ2h0IGJlIG90aGVyIHZhbGlkIGNhc2VzKS4NCk1vZGlmeWluZyB0aGUgY29tbWl0
IG1lc3NhZ2UgdG8gZGVzY3JpYmUgYWxsIGNoYW5nZXMgaXMgZGVmaW5pdGVseSBtYW5kYXRvcnkN
CiB0aG91Z2ggKGJ1dCBjb3VsZCBiZSBkb25lIHdpdGhvdXQgYSB2KzEpLg0KDQpCZXJ0cmFuZA0K
DQo+IA0KPiAtR2VvcmdlDQoNCg==

