Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B546C4F13A1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 13:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298264.508037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKaf-0001mn-KP; Mon, 04 Apr 2022 11:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298264.508037; Mon, 04 Apr 2022 11:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKaf-0001kD-Gh; Mon, 04 Apr 2022 11:09:45 +0000
Received: by outflank-mailman (input) for mailman id 298264;
 Mon, 04 Apr 2022 11:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yWRt=UO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nbKae-0001k7-Q5
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 11:09:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1d629cf-b407-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 13:09:36 +0200 (CEST)
Received: from FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::11)
 by VI1PR08MB2815.eurprd08.prod.outlook.com (2603:10a6:802:19::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 11:09:13 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::1e) by FR3P281CA0062.outlook.office365.com
 (2603:10a6:d10:4b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.17 via Frontend
 Transport; Mon, 4 Apr 2022 11:09:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Mon, 4 Apr 2022 11:09:12 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Mon, 04 Apr 2022 11:09:11 +0000
Received: from d4730c1e2bc5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB1400E9-77F3-4907-BBBC-1276AB0EF08A.1; 
 Mon, 04 Apr 2022 11:09:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4730c1e2bc5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Apr 2022 11:09:01 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by HE1PR0801MB1849.eurprd08.prod.outlook.com (2603:10a6:3:89::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 11:08:57 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 11:08:57 +0000
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
X-Inumbo-ID: b1d629cf-b407-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQwH8IBEUrRZJ3j95Bvc2Gpye5E4DQUGIeWr5BA972U=;
 b=yac2UkcMLMCYLJ7yHGDx4e3gn8SbtLYzo4FkMRySFsfBKQCuT879+RGJqZjZ2B9WB9n1NBTZtuGmLVTAVTugdBWjEeEm3LrCgbNAwx24NYzHN6/8+6aWg7tY7m/02md2Vw2J5enHoYyRtrwM5srGg3jH/xP1H6Kvuef636Z4qoY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ca4555f78140d0b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh/2EMkdAKQjAaKJ2aaHVB8jnXrKD6YPF/S3j/ihl5STt1IE8/lWecg0bc3rNuQv5TYBhbf3/hTWhnz1XfpE6N6nOjp9w7K//FOkvFd9XqgetTGFTUQlq371nyn5uUf4OG9RtJVBw3du2P95Y5HjE1Kv/fcNZON+g56cUz2Nc/koV+WnAGb2gscJWfPsZp9EmX3NdEetIYezTnHmGUAoXhDr9I7zPVk3aUgc8HsT37zLwxOjNxJNOdzbQjzeZxIyjESTG0SG76/An0If4RRK0fM5ubUh4b5E09ild4/cmmff2OWfqmQHWwKY8NjRZgW1jSRuSukIA8BpeW5xUDYRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQwH8IBEUrRZJ3j95Bvc2Gpye5E4DQUGIeWr5BA972U=;
 b=EYXUud7uDoRWXUT5tIV0UCIqVxfiQmqtduWcicpuL7jW48y2EkX4+4U7yAAR4apMU6arhgXEloijzWtP2Zy0f0XPObbOG8S7JqvAppHvqybd7gMRnRampTlnLC7te+vGJ0ibXWgwDp0dlpvCHobC7NSujI96i2b+hxWn4wUrzW2XIA3TK18HgEL/CzvmvAAmk4pAKycfZibzxfPWuiCMxB2I532M8pDVZH0BXjUhYyIKQTMb87sQENFZFw4JnyozNMMhIrOvZ6Ku7kXe+W8Qs4cnbRSGmM4qT+VBHH0l9SLVRhvMvue+e8ZgnmdsETEfjo+5OtT0jzHcBZj6K68Pow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQwH8IBEUrRZJ3j95Bvc2Gpye5E4DQUGIeWr5BA972U=;
 b=yac2UkcMLMCYLJ7yHGDx4e3gn8SbtLYzo4FkMRySFsfBKQCuT879+RGJqZjZ2B9WB9n1NBTZtuGmLVTAVTugdBWjEeEm3LrCgbNAwx24NYzHN6/8+6aWg7tY7m/02md2Vw2J5enHoYyRtrwM5srGg3jH/xP1H6Kvuef636Z4qoY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it
Thread-Topic: [PATCH v2] Grab the EFI System Resource Table and check it
Thread-Index: AQHYRh5pIZEBfe5HzkWcQzrtRd3oyazfnIKA
Date: Mon, 4 Apr 2022 11:08:56 +0000
Message-ID: <989D1F80-2CAA-4432-8780-E0104B28A634@arm.com>
References: <YkeHXFvgB3MwXnuR@itl-email>
In-Reply-To: <YkeHXFvgB3MwXnuR@itl-email>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9677414a-63db-4188-2fc1-08da162b8c7b
x-ms-traffictypediagnostic:
	HE1PR0801MB1849:EE_|VE1EUR03FT045:EE_|VI1PR08MB2815:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB281555CE7B1DFADA0ECA53AFE4E59@VI1PR08MB2815.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2AmGNQM9pXRiAsrfBAXKFXuRbIiRtIvxbjKRvWwkBjudm3bhD5pkGY/Lc0tQ6UXi9LEj3LbyDdJaz4a/qSM4BdvLX9xe3Dr4BRENQSJzy02sDDYfmkABgHN65PwgqxAceX7VJqBu/lUh3o2aW/5WiiM1/67LBH1n7s5v8RXT7sYUZJW3oM9yXy3jQHsTzEhvGVqBfw1o10vKpZVUgztBHeGSbft99SLSOXFiTvxbt2YKaUnueLvZdC5B6p+U/swWFKMpQFV3tBMTRvuZlxGMtg/bKj6JGWsCN/a+6fLW/LI9i427yBdGUYvaz4nD52/Pbljxj8GxI86aZyb5W15Fdk62M5SeO0HF0sz1DMXe8kAOaVlSxlrWovyjNCgA6evSqGaZ/kZ9finwSHbargSK6R5HJ7wAqt5Ra/Byb7ghTe+yi6TahD+R34XzPN8zOAjupT90ykN1+I70xnAaMbBif6kalhbqnT/dLNHozqgcvqR5TJkQey7DT4vCtStP907NCYwKYocqCST9l8m46tP7tKH2jC880Y/c0CqMisbYhODjQALpuYzZGH5TvNdsQoLaFYa9RX0Uoy7+SjKQR3hFIvs1/aWXVkkD8gG56rABtdwF9Q5Sfy+rUYwxteEvfiqI86eWwn5ODPS+a29tAcwVhKF0kknq1VgwVxyTyOXUYojkGhOmgEvWjwIQr4LFSv4C5bEkAhbDjs4U9NjhegA+2sAgLyYvyX0AK3J4KgH4h6opA1UKEgYRjx7tcVaXVPkWesYXFx1koqRZpxmQzh8sFqdrsa73YFBzEfmf+2iQBpoi/dDZuQSGLXRVHYzBtAXwYdTWIsf8SoAWvnV4CvwiHQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(53546011)(83380400001)(4744005)(71200400001)(33656002)(6512007)(5660300002)(122000001)(36756003)(6916009)(38100700002)(54906003)(316002)(6506007)(186003)(8936002)(66446008)(966005)(66556008)(508600001)(66946007)(4326008)(66476007)(8676002)(91956017)(38070700005)(2616005)(6486002)(76116006)(86362001)(64756008)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <078E7B4C39A63244AFB5C4413DA4918C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1849
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4921b7d8-ec5d-48f1-7e77-08da162b836a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B2QfCLUjcy7xCN+bqxuvlSMp23D+aPwlnxoU5xHiWPYgvqmEB8ZJ7fRVa5PQ2HPqknJ4Bz1Ic+elCEMY4QmX9barE4iA8ZG8tlBYs1l37VJg1o1K+DW6wSgDhwP8lEPIJTSiEUR1HmQWiQLcjiN+k2fwJNeHvUU0RyRp/D5w9OnlQViGS3WKOPtAJT96m4O6qqLwWVxqpcK+rTdJq9F6kIu/ZHZM9pvNyXEg/ODMfpUpQe53uyzlzea4suLSGVgAgDT2JttyPfb19GRUlRiea7NoGk3vc5cVcQQgPNykDCEQklZWxTnqqqDjhMA/XXgzn6TnvTpUCZ1b0m21ipF+6jDDFz8JeKexC/inIK2f1eVVsJMXlMMw6FByGK+ll/40ns19kY8TnEnNEH5pcageHZwHAm+NsTwPhiHj/j9N9K3sfLEvhFHwQ5cm/JUszNqiKQDtIM8hmsNJjAVHYTYO/D6ZSamwYI/wb3klLD2k+OihlyFljOnBwOD2P0dhIbW1tTNtfd+5bEEDRwlgo9EOEIB0CSBrFFbQJVZQlJCI0rUWhnEyseN4zhuSLdWCjGMqdAYltIogLTdhpb1jfv2xXbZOgWbRvhcee2yxijsAFOj+SA/l8mWT336MubP6JlrzXzyNLfBH+QGzBOZq0wLG2c/6r3EZCoD2govKySaqx8bSrgexgIwLCt/yYcv5eiUaQhysW5GV+T1svqZxDj+959k0t/jAwwBCfT6xwCAazcT7kDqTNSdGnGfSmuqYjYvyF7eOHHKJVxfZXHZWWuhWog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(4744005)(36756003)(336012)(33656002)(53546011)(5660300002)(966005)(508600001)(6486002)(36860700001)(8936002)(6512007)(83380400001)(2906002)(40460700003)(70586007)(186003)(54906003)(70206006)(26005)(316002)(81166007)(6506007)(356005)(47076005)(8676002)(86362001)(6862004)(82310400004)(2616005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 11:09:12.1540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9677414a-63db-4188-2fc1-08da162b8c7b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2815

DQoNCj4gT24gMiBBcHIgMjAyMiwgYXQgMDA6MTQsIERlbWkgTWFyaWUgT2Jlbm91ciA8ZGVtaUBp
bnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToNCj4gDQo+IFRoZSBFRkkgU3lzdGVtIFJlc291
cmNlIFRhYmxlIChFU1JUKSBpcyBuZWNlc3NhcnkgZm9yIGZ3dXBkIHRvIGlkZW50aWZ5DQo+IGZp
cm13YXJlIHVwZGF0ZXMgdG8gaW5zdGFsbC4gIEFjY29yZGluZyB0byB0aGUgVUVGSSBzcGVjaWZp
Y2F0aW9uIMKnMjMuNCwNCj4gdGhlIHRhYmxlIHNoYWxsIGJlIHN0b3JlZCBpbiBtZW1vcnkgb2Yg
dHlwZSBFZmlCb290U2VydmljZXNEYXRhLg0KPiBUaGVyZWZvcmUsIFhlbiBtdXN0IGF2b2lkIHJl
dXNpbmcgdGhhdCBtZW1vcnkgZm9yIG90aGVyIHB1cnBvc2VzLCBzbw0KPiB0aGF0IExpbnV4IGNh
biBhY2Nlc3MgdGhlIEVTUlQuICBBZGRpdGlvbmFsbHksIFhlbiBtdXN0IG1hcmsgdGhlIG1lbW9y
eQ0KPiBhcyByZXNlcnZlZCwgc28gdGhhdCBMaW51eCBrbm93cyBhY2Nlc3NpbmcgaXQgaXMgc2Fm
ZS4NCj4gDQo+IFNlZSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMDA4MTgx
ODQwMTguR04xNjc5QG1haWwtaXRsL1QvDQo+IGZvciBkZXRhaWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogRGVtaSBNYXJpZSBPYmVub3VyIDxkZW1pQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQoN
CkhpLA0KDQpJ4oCZdmUgdGVzdGVkIHRoZSBwYXRjaCBvbiBhbiBhcm0gbWFjaGluZSBib290aW5n
IFhlbitEb20wIHRocm91Z2ggRUZJLCB1bmZvcnR1bmF0ZWx5DQpJIGNvdWxkIG5vdCB0ZXN0IHRo
ZSBmdW5jdGlvbmFsaXR5Lg0KDQpDaGVlcnMsDQpMdWNh

