Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A985B1AB1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 12:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403112.645100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFBD-0007Hv-Cf; Thu, 08 Sep 2022 10:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403112.645100; Thu, 08 Sep 2022 10:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFBD-0007ER-9C; Thu, 08 Sep 2022 10:54:43 +0000
Received: by outflank-mailman (input) for mailman id 403112;
 Thu, 08 Sep 2022 10:54:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWFBC-0007EL-1v
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 10:54:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80042.outbound.protection.outlook.com [40.107.8.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a329ba1d-2f64-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 12:54:40 +0200 (CEST)
Received: from AM6P195CA0075.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::16)
 by DB9PR08MB9489.eurprd08.prod.outlook.com (2603:10a6:10:458::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Thu, 8 Sep
 2022 10:54:30 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::71) by AM6P195CA0075.outlook.office365.com
 (2603:10a6:209:86::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Thu, 8 Sep 2022 10:54:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 10:54:29 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Thu, 08 Sep 2022 10:54:28 +0000
Received: from 0bd0f3220f62.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 754F1DF7-C4DA-48DC-860E-1828D5D97C10.1; 
 Thu, 08 Sep 2022 10:54:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0bd0f3220f62.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 10:54:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7497.eurprd08.prod.outlook.com (2603:10a6:20b:4de::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 10:54:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Thu, 8 Sep 2022
 10:54:15 +0000
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
X-Inumbo-ID: a329ba1d-2f64-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Fc6rO9REIzcrfrGAlO4OFUBuy+lGy3Pd63fNz0+w9ndN2dz9PYhNYApEMx8JJpk7ujfnEzaUYCxqeWSN9+Zr3hyeu25bWdLJBuHYTL4K1nh+zV77l8cDIwjNfAPtDkP/X47ovvP2Moie0tdyjNweNGA8b5kSukZ9/JECZsKm0bHebgSxtYMAGOFmAVU9IOTpVDrgQFcShC8DRA5N7c9nASuT25IurN+98Y0rPJCpKqUT6i3GoY7N4yetEwmSJ6OduJl0y/jpJJImQosVNA5L2+pfm9AxPg22OOFgY1wiPrgYR4lK4LFwMyzj1lToaGGX6F4Nt7zDjzTRLWmwWmQPQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zd0IC8Y2iehB1yUyrT6crDSgwo/gPRk5TFCVmLD/Ee0=;
 b=BzSIHiHv3y5KD/g6CRGdLon8xHMdSIm+6bfrZ0ns8F5qItJI9YUrEKnGWNadmmpAAvupqVfEF40MeIJMqBHHClCASKhmcIrkD6OCd4roXKAhx+WuT9naWaP2lmRKBQbH5HnZ1X5OEwmT9z5tgHUn2rtHN9MrR2Jqy1Zlqcw2ZnI1No3SwNpJDcz4Lylyg1FbiHhNX5booO0uKrfc7LoXlBlnAcQwHSzLsTeMWWYJUMB71MbpWAOZoNLMA6za6Tl6WNw+cmrotG+LT4IYvvfy5PrLCk1W0TLt7FdXQjvHmMi4cWJVQlz5fLKRkC5k4Rtiv/1orGXpVlJYAsCq1uAveA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zd0IC8Y2iehB1yUyrT6crDSgwo/gPRk5TFCVmLD/Ee0=;
 b=9piqutcJHT8m8AVlGE1z+dPX0Rxz9F24HtGJFikAIrWFj1Y6cZEWCm1uBWcTbYrgnhHbYf1zjMoGwsAx4mInBksfImW2AsXpSvIvcLgCKh72DKoRt6QA1b9U7/8p7ChTekLYJ/1DD2geuFi5rbXmhzQrcDVXj7MCUPlomBVQW6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnGQjZ075hxPEAAdebVsMEbDUP6wsS752hCTo6m0mMf3MPsNtt7C+tn5i33EtR1Tk8i+eK8o55veroNBpQkX/PlQVgWUxNSdCpcnmDGplk11Vj1X8gfwcoHtqR+2WM5Zuug53ee9Q4WdIZO6qur1xDdPju7ZVdkdaPL+e+fIgwYOo+ia52iDbNT48pfOy15A3v5GTbpA0kHi6B+wEJjNI41hWi3jIXYak/oS5sPCtbHdEv8dzLB31zCI/jBjOqFNzabThwzczrMkP69WyrDg2i3L9X/Jf9FH6xxyKdJbwPWdTxFyWIcv6fnspqzh3AVG+CPp0KtlwzS1kdpnu0S9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zd0IC8Y2iehB1yUyrT6crDSgwo/gPRk5TFCVmLD/Ee0=;
 b=Xa8a5gmqr3LrRxt1dCvX/Sw4Oql4omSF+6RmGY7oLxylkI+Qvrx5LXVopn6wcQsGkU+ukvHsl08r/M6x67kVboPz5wWN8qJfmm8cojcY26mhHuopLH4pDwkYzQujFvdbvdfFOEE0OrN8TGzk/3Q9yVa615cyD+qwT69+K1Bsqdrxkhfyvw3UjzZkE6MJiegvY9TjLbWSbBheHBfZGFhpXJHNCpMHn6UT4R+iVvswd2WdY9NL6zZ+z0BL7jHCdo4YPk9hOz7WrTeQ3Q5vwa9/Pg/ncoOn2naqf7VxUUSCzcMK+UW9tQQfvsrf20by0FgM30pRjKXLdJ9NEL2f6YV7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zd0IC8Y2iehB1yUyrT6crDSgwo/gPRk5TFCVmLD/Ee0=;
 b=9piqutcJHT8m8AVlGE1z+dPX0Rxz9F24HtGJFikAIrWFj1Y6cZEWCm1uBWcTbYrgnhHbYf1zjMoGwsAx4mInBksfImW2AsXpSvIvcLgCKh72DKoRt6QA1b9U7/8p7ChTekLYJ/1DD2geuFi5rbXmhzQrcDVXj7MCUPlomBVQW6w=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
Thread-Topic: [PATCH] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
Thread-Index: AQHYw2XP4kTWxhuEi0Wfg39PE1aR463VV3SAgAAAWqA=
Date: Thu, 8 Sep 2022 10:54:15 +0000
Message-ID:
 <AS8PR08MB799177FFC8C90D870DED79B792409@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220908093129.30124-1-Henry.Wang@arm.com>
 <f9874353-6060-61b1-3faa-9698f85c7ac4@amd.com>
In-Reply-To: <f9874353-6060-61b1-3faa-9698f85c7ac4@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6F5F84FD08CAC64595488D125C5F0A1F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 10627ba2-78eb-4721-0726-08da9188811c
x-ms-traffictypediagnostic:
	AS1PR08MB7497:EE_|VE1EUR03FT010:EE_|DB9PR08MB9489:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eQosKji2r5S01C5Bb7a5RLMJstZOws/v/4nr0F1lMdVQ+qtWsu8PBEVfqURqjvA0ESSh0svZcTvnAwCv2rB7jfc9DeBa6xrcGKOUVzQ2NQ/7SaMmNHMieoi4N4RtTwPo41DQ+1giryxQUsbeNZAQRqgvHGhQwn2XAENgGjn91pe9h/iHwK5HTD7ltQ6e3lBa/wRuoPLyoS9sb1Qkzhr8b96s+gj4bJvn2WnW6KtOsgDYzK0gcbPGM6fAnZFrSTMLXAfs98JL1pLVSYmEOTS8DowcrZvB87RZksO12a/RC+rm9rdviIS/hH9YVryKgIyPuAt9wP1uHBLhxuD28HRqNFj3wNr6aaMFAJrTTFEogqa2E+8Idx/97Usl6hoRFs2qLy6RPRNqPBBxp0N28veglSdgERASPSXtt0CEbZyOVSTWuAorJcB4qepWoQPs1ukW8ooigBa3/ignKkV36EYbdS6TzC0vaofr3TnGZs3Peqh2U61idIDHAb+csHez1e5/n9arbVJ5QsbnMeQnNkkloAu7kW7pIikijjtNSZlok04M1AG6u9fuQ56cbHUfZOfTVMQbii8Y1eYxTVrCVxi1A9eaLde2MgXTPWJK5m5FVQGr4gIEmJPMvRXEnXB17UVZFoPALQswVP4W1nCKNPJF9D02Egxvp1gNX3Lc1Ozmi44yVSNPIgSfId/yaeoAp9FI1DBQkICNuczFIeDBRqfc47oifto+zyxZXnzh5C8ot0d0P14oP8JTMyaja/9DJBrMUfoPHOZY/d2rOLX7zcBKqw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(83380400001)(38070700005)(71200400001)(54906003)(186003)(122000001)(86362001)(110136005)(316002)(52536014)(8936002)(5660300002)(478600001)(66446008)(76116006)(66946007)(66476007)(4326008)(41300700001)(8676002)(64756008)(9686003)(55016003)(38100700002)(26005)(66556008)(2906002)(33656002)(6506007)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7497
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	186d1531-f3cc-4d7c-ed44-08da918878b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aDmqfiYB7bP1nOW7d4JbNyJ76akV70d1UvP3ww2lZ7KWZuOMEs9epvgpgYwuCUS1bxkcOaU1ty5kkVrHO/aMqO4cz1W0jKi3P88C+JxBtxlacOTdRtRFdPVCYOy+IXkNx8aBqo+YefLAs+/4do17GFbxVJsMy9bE8DNdDoW8/ExsAIspSbQHZ5Rz5Hd4hb9piUnppofofnAG1Hr6NyEWgxtjwX7j7TddaYjFzWDfPLhwsvECrdxQ6eVDORxQrl1hAHaaUPuOiHPjjMsgw1lKoZiNkYrveqq/TqQM4jt53gN8it7GdJ0agYoFO8mqpHAm7eDNfFaqkdfmP/s+Em7n59ve0ncqU6DMgI0IIny1f+gW/KP0SeXgW/EgKqxQ899qOOhr1kTfVKpS7cV3fkRfFg1LR3ZI65BrG4uJLJhiBObZ16qTAVC/Q8N1mlG3W0t79BmBq/tR4pbYKBs2ouCW8H8GRKz+AKDfNWKgKlPED4B2T5wXYFmZaK/7a417eq4d6MHeJPxyYT/mtOVkk1AcqERQuZBi3pBAN6w9fyYTiCLj5SkkWBxxHDx89qUIX98WhAmm62neiHsCZ6h5Jd8g88EMD20tu8wQLG36lJiN1Krgt+T6MffmMaXcMZdJrbbs8VqzeCLc9KtiDzKRwMpgq/uonnJKY8aU+BRZJJ7bRDP1k6w/jWT1C73gUAFglCWlabCHGUqZ6MEMKQ1IDYylgCmWZuvHbUBy0D8lgjTTplT4rNVYWtblFCPumOv8rfaj7bG7fgSsZMgy+a+33Txhdg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(36840700001)(40470700004)(46966006)(26005)(7696005)(478600001)(9686003)(186003)(107886003)(41300700001)(6506007)(83380400001)(47076005)(2906002)(336012)(54906003)(52536014)(5660300002)(40480700001)(8936002)(55016003)(110136005)(40460700003)(70206006)(4326008)(8676002)(70586007)(82740400003)(316002)(81166007)(36860700001)(82310400005)(356005)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 10:54:29.2461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10627ba2-78eb-4721-0726-08da9188811c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9489

SGkgTWljaGFsLA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJldmlldywgYXMgYWx3
YXlzIDopKQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hhbCBP
cnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4gQEAgLTM2MiwxNCArMzYyLDEzIEBAIGRl
dmljZS10cmVlOg0KPiA+DQo+ID4gICAgICAvIHsNCj4gPiAgICAgICAgICBjaG9zZW4gew0KPiA+
ICsgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDE+Ow0KPiA+ICsgICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwweDE+Ow0KPiA+ICsgICAgICAgICAgICAuLi4NCj4gPiAgICAgICAgICAg
ICAgZG9tVTEgew0KPiA+ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sZG9tYWlu
IjsNCj4gPiAtICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4Mj47DQo+ID4gLSAg
ICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDI+Ow0KPiBXaHkgZGlkIHlvdSByZW1vdmUg
dGhpcyBzZXQgaWYgaXQgcmVsYXRlcyB0byB0aGUgY2hpbGRzIG9mIGRvbVUxIChlLmcuIGtlcm5l
bCwNCj4gcmFtZGlzaykgYW5kIG5vdCB0byBkb21VMSBpdHNlbGY/DQoNCldlbGwsIEkgdGhpbmsg
aGVyZSB0aGUgZXhhbXBsZSBpcyBqdXN0IGhvdyB3ZSBzZXR1cCB0aGUgc3RhdGljIG1lbW9yeSwg
c28gd2UganVzdA0Kd2FudCB0byBlbXBoYXNpemUgdGhlIHJlbGF0ZWQgcGFydC4gSSBhZ3JlZSB1
c2VycyBjYW4gYWRkIGFub3RoZXIgI2FkZHJlc3MtY2VsbHMNCmFuZCAjc2l6ZS1jZWxscyBmb3Ig
ZG9tVTEgbm9kZSBmb3IgdGhlIHBhcnRzIHRoYXQgeW91IG1lbnRpb25lZCwgYnV0IHRoYXQgaXMN
Cm5vdCByZWZsZWN0ZWQgYnkgdGhlIGN1cnJlbnQgZXhhbXBsZSAoSSBjYW4ndCBmaW5kIGFueXRo
aW5nIHJlbGF0ZWQgdG8ga2VybmVsLA0KcmFtZGlzaywgZXRjLiBpbiBjdXJyZW50IGV4YW1wbGUp
LiBJIG1pZ2h0IGdldCBpdCB3cm9uZyBidXQgaGF2aW5nIHR3byAjYWRkcmVzcy1jZWxscw0KYW5k
ICNzaXplLWNlbGxzIGluIHRoYXQgY2FzZSB3b3VsZCBiZSBxdWl0ZSBtaXNsZWFkaW5nIGZyb20g
bXkgdW5kZXJzdGFuZGluZy4NClNvIEkgZGVjaWRlZCB0byByZW1vdmUgaXQuDQoNCkJ1dCBJIGFt
IG9wZW4gdG8gb3RoZXIgb3BpbmlvbnMuIFNvIHNoYWxsIHdlIGxldCB0aGUgZGlzY3Vzc2lvbiBn
byBvbiBmb3IgYSBiaXQgbG9uZ2VyPw0KSSB3aWxsIHJldmVydCB0aGlzIGNoYW5nZSBpZiBtb3N0
IHBlb3BsZSB0aGluayB0aGlzIHJlbW92aW5nIGlzIHVubmVjZXNzYXJ5Lg0KDQo+IA0KPiA+ICAg
ICAgICAgICAgICAgICAgY3B1cyA9IDwyPjsNCj4gPiAgICAgICAgICAgICAgICAgIG1lbW9yeSA9
IDwweDAgMHg4MDAwMD47DQo+ID4gLSAgICAgICAgICAgICAgICAjeGVuLHN0YXRpYy1tZW0tYWRk
cmVzcy1jZWxscyA9IDwweDE+Ow0KPiA+IC0gICAgICAgICAgICAgICAgI3hlbixzdGF0aWMtbWVt
LXNpemUtY2VsbHMgPSA8MHgxPjsNCj4gPiAgICAgICAgICAgICAgICAgIHhlbixzdGF0aWMtbWVt
ID0gPDB4MzAwMDAwMDAgMHgyMDAwMDAwMD47DQo+ID4gICAgICAgICAgICAgICAgICAuLi4NCj4g
PiAgICAgICAgICAgICAgfTsNCj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9wYXNzdGhy
b3VnaC1ub2lvbW11LnR4dA0KPiBiL2RvY3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gtbm9pb21tdS50
eHQNCj4gPiBpbmRleCAzZTJlZjIxYWQ3Li42OWI4ZGUxOTc1IDEwMDY0NA0KPiA+IC0tLSBhL2Rv
Y3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gtbm9pb21tdS50eHQNCj4gPiArKysgYi9kb2NzL21pc2Mv
YXJtL3Bhc3N0aHJvdWdoLW5vaW9tbXUudHh0DQo+ID4gQEAgLTMzLDE0ICszMywxMyBAQCBvbiBz
dGF0aWMgYWxsb2NhdGlvbiBpbiB0aGUgZGV2aWNlLXRyZWU6DQo+ID4NCj4gPiAgLyB7DQo+ID4g
ICAgICAgICBjaG9zZW4gew0KPiA+ICsgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDww
eDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDE+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAuLi4NCj4gPiAgICAgICAgICAgICAgICAgZG9tVTEgew0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAieGVuLGRvbWFpbiI7DQo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgyPjsNCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDI+Ow0KPiBUaGUgc2FtZSBoZXJlLg0KDQpTYW1l
IGFzIGFib3ZlLg0KDQo+IA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNwdXMgPSA8Mj47
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbWVtb3J5ID0gPDB4MCAweDgwMDAwPjsNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAjeGVuLHN0YXRpYy1tZW0tYWRkcmVzcy1jZWxscyA9
IDwweDE+Ow0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICN4ZW4sc3RhdGljLW1lbS1zaXpl
LWNlbGxzID0gPDB4MT47DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgeGVuLHN0YXRpYy1t
ZW0gPSA8MHgzMDAwMDAwMCAweDIwMDAwMDAwPjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBkaXJlY3QtbWFwOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIC4uLg0KPiA+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0K
PiA+IGluZGV4IGVjODFhNDVkZTkuLmNkMjY0NzkzZDUgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2Jvb3RmZHQuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMNCj4gPiBA
QCAtMzUyLDExICszNTIsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBwcm9jZXNzX2RvbWFpbl9ub2Rl
KGNvbnN0IHZvaWQNCj4gKmZkdCwgaW50IG5vZGUsDQo+ID4gICAgICAgICAgLyogTm8gInhlbixz
dGF0aWMtbWVtIiBwcmVzZW50LiAqLw0KPiA+ICAgICAgICAgIHJldHVybiAwOw0KPiA+DQo+ID4g
LSAgICBhZGRyZXNzX2NlbGxzID0gZGV2aWNlX3RyZWVfZ2V0X3UzMihmZHQsIG5vZGUsDQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiI3hlbixzdGF0aWMtbWVt
LWFkZHJlc3MtY2VsbHMiLCAwKTsNCj4gPiAtICAgIHNpemVfY2VsbHMgPSBkZXZpY2VfdHJlZV9n
ZXRfdTMyKGZkdCwgbm9kZSwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICIjeGVuLHN0YXRpYy1tZW0tc2l6ZS1jZWxscyIsIDApOw0KPiA+IC0NCj4gPiAgICAgIHJl
dHVybiBkZXZpY2VfdHJlZV9nZXRfbWVtaW5mbyhmZHQsIG5vZGUsICJ4ZW4sc3RhdGljLW1lbSIs
DQo+IGFkZHJlc3NfY2VsbHMsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZV9jZWxscywgJmJvb3RpbmZvLnJlc2VydmVkX21lbSwgdHJ1ZSk7DQo+ID4gIH0NCj4g
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jDQo+ID4gaW5kZXggYjc2YTg0ZThmNS4uMjU4ZDc0Njk5ZCAxMDA2NDQN
Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiArKysgYi94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiBAQCAtNTYzLDIxICs1NjMsOSBAQCBzdGF0aWMgaW50
IF9faW5pdCBwYXJzZV9zdGF0aWNfbWVtX3Byb3AoY29uc3QNCj4gc3RydWN0IGR0X2RldmljZV9u
b2RlICpub2RlLA0KPiA+ICAgICAgY29uc3Qgc3RydWN0IGR0X3Byb3BlcnR5ICpwcm9wOw0KPiA+
DQo+ID4gICAgICBwcm9wID0gZHRfZmluZF9wcm9wZXJ0eShub2RlLCAieGVuLHN0YXRpYy1tZW0i
LCBOVUxMKTsNCj4gPiAtICAgIGlmICggIWR0X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICIjeGVu
LHN0YXRpYy1tZW0tYWRkcmVzcy1jZWxscyIsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBhZGRyX2NlbGxzKSApDQo+ID4gLSAgICB7DQo+ID4gLSAgICAgICAgcHJpbnRrKFhF
TkxPR19FUlINCj4gPiAtICAgICAgICAgICAgICAgImZhaWxlZCB0byByZWFkIFwiI3hlbixzdGF0
aWMtbWVtLWFkZHJlc3MtY2VsbHNcIi5cbiIpOw0KPiA+IC0gICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiA+IC0gICAgfQ0KPiA+DQo+ID4gLSAgICBpZiAoICFkdF9wcm9wZXJ0eV9yZWFkX3UzMihu
b2RlLCAiI3hlbixzdGF0aWMtbWVtLXNpemUtY2VsbHMiLA0KPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2l6ZV9jZWxscykgKQ0KPiA+IC0gICAgew0KPiA+IC0gICAgICAgIHBy
aW50ayhYRU5MT0dfRVJSDQo+ID4gLSAgICAgICAgICAgICAgICJmYWlsZWQgdG8gcmVhZCBcIiN4
ZW4sc3RhdGljLW1lbS1zaXplLWNlbGxzXCIuXG4iKTsNCj4gPiAtICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gPiAtICAgIH0NCj4gPiArICAgICphZGRyX2NlbGxzID0gZHRfbl9hZGRyX2NlbGxz
KG5vZGUpOw0KPiA+ICsgICAgKnNpemVfY2VsbHMgPSBkdF9uX3NpemVfY2VsbHMobm9kZSk7DQo+
IFRoZXJlIGlzIGEgdHlwZSBtaXNtYXRjaCBoZXJlIGFzIGUuZy4gYWRkcl9jZWxscyBpcyB1MzIg
YW5kIGR0X25fYWRkcl9jZWxscw0KPiByZXR1cm4gdHlwZSBpcyBpbnQuDQo+IEJ1dCBJIGRvbid0
IHRoaW5rIHRoaXMgY2FuIGJlIGhhcm1mdWwgYW5kIGFsc28gaXQncyBzdHJhbmdlIGZvciBtZSB0
aGF0DQo+IGR0X25fYWRkcl9jZWxscw0KPiBpcyBkZWZpbmVkIHRvIHJldHVybiBpbnQgZ2l2ZW4g
dGhhdCBpdCBlaXRoZXIgcmV0dXJucyAyIG9yIGJlMzJfdG9fY3B1cCwgd2hpY2gNCj4gbWVhbnMg
aXQgc2hvdWxkIHJldHVybiB1MzIuDQoNClllYWguIEkgYWdyZWUuIEkgZGlkIGEgZ2l0IGJsYW1l
IGhlcmUgYW5kIGZvdW5kIHRoaXMgZnVuY3Rpb24gaXMgaW50cm9kdWNlZCA5DQp5ZWFycyBhZ28g
aW4gImRiZDEyNDMgeGVuL2FybTogQWRkIGhlbHBlcnMgdG8gdXNlIHRoZSBkZXZpY2UgdHJlZSIu
IFNvIEkgdGhpbmsNCnByb2JhYmx5IGl0IHdvdWxkIGJlIGVhc2llciB0byBhc2sgdGhlIGF1dGhv
ciBmb3IgdGhlIGZvbGxvd2luZyBhY3Rpb24gZGlyZWN0bHkgOikpDQoNCkBKdWxpZW4sIHdoYXQg
ZG8geW91IHRoaW5rPyBTaGFsbCB3ZSBtb2RpZnkgdGhlIHJldHVybiB0eXBlIG9mIHRoZXNlIHR3
bw0KZnVuY3Rpb25zPw0KDQo+IA0KPiA+DQo+ID4gICAgICAqY2VsbCA9IChjb25zdCBfX2JlMzIg
Kilwcm9wLT52YWx1ZTsNCj4gPiAgICAgICpsZW5ndGggPSBwcm9wLT5sZW5ndGg7DQo+ID4gLS0N
Cj4gPiAyLjE3LjENCj4gPg0KPiA+DQo+IEFwYXJ0IGZyb20gdGhhdDoNCj4gUmV2aWV3ZWQtYnk6
IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQoNClRoYW5rcyENCg0KS2luZCBy
ZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gfk1pY2hhbA0K

