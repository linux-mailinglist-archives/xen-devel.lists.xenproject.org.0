Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DDC42F049
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210420.367289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbM5d-0002Kv-B0; Fri, 15 Oct 2021 12:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210420.367289; Fri, 15 Oct 2021 12:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbM5d-0002IN-7I; Fri, 15 Oct 2021 12:13:33 +0000
Received: by outflank-mailman (input) for mailman id 210420;
 Fri, 15 Oct 2021 12:13:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbM5b-0002DJ-Bk
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:13:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9eefe415-3e72-4429-8a06-6ae4de107654;
 Fri, 15 Oct 2021 12:13:29 +0000 (UTC)
Received: from DB8PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:10:110::21)
 by DBBPR08MB6217.eurprd08.prod.outlook.com (2603:10a6:10:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 12:13:26 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::9c) by DB8PR04CA0011.outlook.office365.com
 (2603:10a6:10:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Fri, 15 Oct 2021 12:13:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 12:13:26 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Fri, 15 Oct 2021 12:13:26 +0000
Received: from 7f7a0db48bd4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E0FA01C-8B5B-4039-A71E-EC2888B9FB58.1; 
 Fri, 15 Oct 2021 12:13:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f7a0db48bd4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 12:13:16 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0801MB1863.eurprd08.prod.outlook.com (2603:10a6:4:76::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 12:13:05 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 12:13:05 +0000
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
X-Inumbo-ID: 9eefe415-3e72-4429-8a06-6ae4de107654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K0K0IGkCQcCOOaFasUKhPNp1jYbyhQEBdP2gn0ExBo=;
 b=m00JD27X5UAjUdpq1zoNyI8ecFSrdLkBWqXwkwvPjsusd2NIR0D5Jv4U+AXAgdADa7BEGdMitv7sSVKiAYEWl9QAWNCMZ3Wp2bi0jpF8kkR3WWu2G+05pOnp93pgchEUgwZUtcs2EH4d9IQBSQPOBtmVuTYiQu/vDs7R0KLSgJM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cec54b3d234ed6a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goDRff0lbISlBOdZWLlSyfuzZhIsNCUHx6MIO3Q5B3/V4GXtYDMGKotRGFSaMg8BzJWpJrYZBPd9fuW4B3Pgl0aAknhunFuB/+DCnOWRHB/ePvflVRDNFPh+TXlYxwC3qi+Ey3lyUl9CfOTWUkeiPs/GJRdFQ/XZ5YfgHDL3rlxoimcs+UjysZBrivjHZniNT2AkrtS3wOZl5SlOCkdHSFgch8R5z6FtkjvOMfbyu6iyR8eIHuT9/56D1McSF/fUlZTDx8hSiDf2jZnw/IRkCizKPGNf1hGFX7w7M8r/KYBl1XBa0OJ4hmj+hC+bh5yURNAsKDrnl+Sem6Kuc7MCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5K0K0IGkCQcCOOaFasUKhPNp1jYbyhQEBdP2gn0ExBo=;
 b=NkYdrdyzo1Scf0hyYWohCU6QtrKORbeIeMgjZ8NZ0hYgd0pKC8AV7ixzOeFmttXal0bduIOtsvVNChhLmehUO+yu7vn1RHt/scOW2IPb7qGw8ExB91jHsMpzifLLSfpY/dvVFXEqOBsDdEDV3o7+tEDNsAejYVAtqLGoyHT2ouSlnhG07UlWi4P8ts2QQNs9Ul+89O1KZbwf9Rq15sKB1DUuuXBUqeqQ1X96H/7IQUgZs3XTnNtj7buduC5jwj0z91aO/CXjUIp0jmhqaT3KQRwdiZA4HAydWctxxT2xTTzE/Q3V0NSsIpkZ2dAt+hD4vIwPDduQ0xcbARgg/JdcFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K0K0IGkCQcCOOaFasUKhPNp1jYbyhQEBdP2gn0ExBo=;
 b=m00JD27X5UAjUdpq1zoNyI8ecFSrdLkBWqXwkwvPjsusd2NIR0D5Jv4U+AXAgdADa7BEGdMitv7sSVKiAYEWl9QAWNCMZ3Wp2bi0jpF8kkR3WWu2G+05pOnp93pgchEUgwZUtcs2EH4d9IQBSQPOBtmVuTYiQu/vDs7R0KLSgJM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index:
 AQHXwQrjS6mPrKT7Q06z3N66FcsDAKvTs1WAgAAj+QCAAAF1gIAAAUmAgAAVT4CAAAqRAA==
Date: Fri, 15 Oct 2021 12:13:05 +0000
Message-ID: <A2AAD333-35A2-4250-891C-E8FB885D5660@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
 <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
 <24937.21631.538303.29471@mariner.uk.xensource.com>
 <b8fc68e6-2bba-ef11-4c4a-50c2046ecb04@suse.com>
 <YWlnc3b0sj4akUWa@MacBook-Air-de-Roger.local>
In-Reply-To: <YWlnc3b0sj4akUWa@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1a79e6b0-9513-4054-2285-08d98fd5313f
x-ms-traffictypediagnostic: DB6PR0801MB1863:|DBBPR08MB6217:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB621728CA88425C24E82B281E9DB99@DBBPR08MB6217.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZzoBfj3lJqSElnXEQ2roDXbzVwPerCZ9GwRztbecRm9RSSmNLUJzj7WNRonGiMx1KPajdair4BbLLZU0LWvcDIM7su5G6di0ddSGH0ynwtQ1kweaPd2YtVt4TNO+igFDFEI+m8aMvFM3k1dijnWdA7ccCWS/VEuCnrIQifhdHhGFjrP1rbBui7ISLOUQr8h6Du4sDduWNkm4w/nfyDmud5W8TbHrXMw9KX6D6NnISwAm9dpMemKlLIkQJ1CfhfiiPHq/nZ3/zWo0r664xETFZyFXidCNpq5uDzqHY+knZZldGHjItGWpXsjDqurdXvKWRfD53fraHAXgYOvLizChnCd8QFNETpF1qe6Jk7vgT5ZiE50pxZN82zWDTx7uXxnZ5tMqsU9QwS9ucj8YuzN2uMfl23x6UmhlewfeYniByTgsBUgGfx0Pzkuymuqii+L3cZxaUqXGrwtWW+1fZhZcaCGNArcoE1xZb7jEQEgeWmRI66HhUTYJ7/WWkoIFWxB1x1l34Jn1LlvHoL4JNGTPcSrSOHDJATO/k7lD9CkMz7qMuMtmIpyVS8cWy7Lvf9+Z91IvLY0IeDZmJhINjNtwM9K6aB8OPDeFGhx3jY7Y3km9U4XlBE9Vopc0WgTtZHU6xV8kPQ6dk4DdnvupRDl42+D7AZQ/oow2FV+Jyg3Wszvp2loPXvnDwBk0pVWOTv7qX38mvtVT2aEXpXMa9PnDerTe8ZC/MSsBo1xRpn55O+ba5Tn+KAY/cXJ8xh78K7I6Mt6Ifq62NwtV6cKVQ99nwmO0WigTlDkNC4fWvfpIdzsj7B9GpELkm6Y1Iw6qrTW7H7r0nhh4FaZEsSdCBUv6Rg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(66476007)(66556008)(8676002)(508600001)(66946007)(38070700005)(966005)(53546011)(66446008)(6486002)(64756008)(76116006)(26005)(6512007)(91956017)(54906003)(36756003)(6506007)(2906002)(5660300002)(83380400001)(186003)(86362001)(122000001)(316002)(38100700002)(6916009)(4326008)(2616005)(7416002)(8936002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <67551000D17B4A4F9D4BF1BBE2181FF6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1863
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6742e90c-34ef-4b21-519e-08d98fd52480
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/2VdfrM+bPf+IWq8J/dvxNyzZm5fIUPtQN3lIFuGdKIhTuNgx8A6gq7MRCefCK2KFGo8DBOqU1tZ2xCD+2yqjQn4dHKlWBTNBCsDOaNHmRTa0HaTPRyDwSZcCNtzDAVbu8YWofMf1YZHo3L1jsf8D5sf6/6cER1Z4pKQ9yQhg7yiITlsos3EPhjzUpcnrns71qyh/ycnFkNSUibPeJnnAncbSkYnblaot2d4+1hdDgo3eXBugGmPB1FzPXevfnhd5748kinitdS9zQSA7v5q/9ZbXJzwpzwqSv2XJ5bN2FwohrtY6EpdJBZWUcxl37ck7+uwo1MUKJFu2DxTkaLsid5l8IwXGZdd+3oYgelzWb3+9mqlFZZ1MOqN7lHUbbKA3GLl8GzHeiz/lj11jo1oOt3VHSWMefAYa8yV8aV9nJoaOOTU5S9GVE9NmUyHz6eBGHbdCvXlwVBK8QSE1u8PpA7YQwaicW7PKRJ/q4zxSWjWUx+UGiTKzZtHlbyfAkdOF73DfLW5azRMnwtpqVONJJhFuIYVXA0LezmilFVcygG0KPIZCR3wU+j6S1f2zfgXmupYNk2RGwoXUmaA2J5xVCzNvbM7uIXPyg5l9zjli1eTHiYVCkbX1abn0hOahDevzRmCojj9pNd3QOA5HFmXX3qUgYGbFaXRftpRfU87BBzvo3QbfohdHEk52qn49Jy3AeWpe1UrFjdZF/ayaEqX7fKv27rjOiHjnfcLrNUaCOj5MdfFvU5PEp/4OwGCt3XlL98XGea3KdFUDjmto52Cs9igswae8dGkz+ZiiGPTXOI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(8676002)(2906002)(53546011)(2616005)(26005)(508600001)(316002)(83380400001)(82310400003)(86362001)(8936002)(6506007)(47076005)(33656002)(54906003)(36756003)(966005)(70206006)(6486002)(36860700001)(186003)(70586007)(356005)(81166007)(6862004)(4326008)(6512007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 12:13:26.6593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a79e6b0-9513-4054-2285-08d98fd5313f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6217

SGkgUm9nZXIsDQoNCj4gT24gMTUgT2N0IDIwMjEsIGF0IDEyOjM1LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIE9jdCAxNSwgMjAy
MSBhdCAxMjoxODo1OVBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE1LjEwLjIw
MjEgMTI6MTQsIElhbiBKYWNrc29uIHdyb3RlOg0KPj4+IEJlcnRyYW5kIE1hcnF1aXMgd3JpdGVz
ICgiUmU6IFtQQVRDSCB2NiAyLzNdIHhlbi9hcm06IEVuYWJsZSB0aGUgZXhpc3RpbmcgeDg2IHZp
cnR1YWwgUENJIHN1cHBvcnQgZm9yIEFSTS4iKToNCj4+Pj4+IE9uIDE1IE9jdCAyMDIxLCBhdCAw
OTowMCwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IFRoZSBs
YXR0ZXIgaXMgZmluZSB0byBiZSBwdXQgaGVyZSAoaS5lLiBGVEFPRCBJJ20gZmluZSB3aXRoIGl0
DQo+Pj4+PiBzdGF5aW5nIGhlcmUpLiBGb3IgdGhlIGZvcm1lciBJIGV2ZW4gcXVlc3Rpb24gaXRz
IG9yaWdpbmFsIHBsYWNlbWVudA0KPj4+Pj4gaW4gYXNtLXg4Ni9wY2kuaDogSXQncyBub3QgZ2Vu
ZXJhbGx5IGNvcnJlY3QgYXMgcGVyIHRoZSBQQ0kgc3BlYywgYXMNCj4+Pj4+IHRoZSBidXMgcG9y
dGlvbiBvZiB0aGUgYWRkcmVzcyBjYW4gYmUgYW55d2hlcmUgZnJvbSAxIHRvIDggYml0cy4gQW5k
DQo+Pj4+PiBpbiBmYWN0IHRoZXJlIGlzIGEgcmVhc29uIHdoeSB0aGlzIG1hY3JvIHdhcy9pcyB1
c2VkIGluIG9ubHkgYQ0KPj4+Pj4gc2luZ2xlIHBsYWNlLCBidXQgbm90IGUuZy4gaW4geDg2J2Vz
IGhhbmRsaW5nIG9mIHBoeXNpY2FsIE1DRkcuIEl0DQo+Pj4+PiBpcyBtZXJlbHkgYW4gaW1wbGVt
ZW50YXRpb24gY2hvaWNlIGluIHZQQ0kgdGhhdCB0aGUgZW50aXJlIHNlZ21lbnQgMA0KPj4+Pj4g
aGFzIGEgbGluZWFyIGFkZHJlc3MgcmFuZ2UgY292ZXJpbmcgYWxsIDI1NiBidXNlcy4gSGVuY2Ug
SSB0aGluaw0KPj4+Pj4gdGhpcyB3YW50cyB0byBtb3ZlIHRvIHhlbi92cGNpLmggYW5kIHRoZW4g
cGVyaGFwcyBhbHNvIGJlIG5hbWVkDQo+Pj4+PiBWUENJX0VDQU1fQkRGKCkuDQo+Pj4+IA0KPj4+
PiBPbiBwcmV2aW91cyB2ZXJzaW9uIGl0IHdhcyByZXF1ZXN0IHRvIHJlbmFtZWQgdGhpcyB0byBF
Q0FNIGFuZCBhZ3JlZWQNCj4+Pj4gdG8gcHV0IGlzIGhlcmUuIE5vdyB5b3Ugd2FudCBtZSB0byBy
ZW5hbWUgaXQgdG8gVlBDSSBhbmQgbW92ZSBpdCBhZ2Fpbi4NCj4+Pj4gSSB3b3VsZCBsaWtlIHRv
IGhhdmUgYSBjb25maXJtYXRpb24gdGhhdCB0aGlzIGlzIG9rIGFuZCB0aGUgZmluYWwgbW92ZSBp
ZiBwb3NzaWJsZS4NCj4+Pj4gDQo+Pj4+IEBSb2dlciBjYW4geW91IGNvbmZpcm0gdGhpcyBpcyB3
aGF0IGlzIHdhbnRlZCA/DQo+Pj4gDQo+Pj4gSSB0aGluayBSb2dlciBpcyBub3QgYXZhaWxhYmxl
IHRvZGF5IEknbSBhZnJhaWQuDQo+Pj4gDQo+Pj4gQmVydHJhbmQsIGNhbiB5b3UgZ2l2ZSBtZSBh
IGxpbmsgdG8gdGhlIGNvbW1lbnQgZnJvbSBSb2dlciA/DQo+Pj4gQXNzdW1pbmcgdGhhdCBpdCBz
YXlzIHdoYXQgSSB0aGluayBpdCB3aWxsIHNheToNCj4+PiANCj4+PiBJIHRoaW5rIHRoZSBiZXN0
IHRoaW5nIHRvIGRvIHdpbGwgYmUgdG8gbGVhdmUgdGhlIG5hbWUgYXMgaXQgd2FzIGluDQo+Pj4g
dGhlIG1vc3QgcmVjZW50IHZlcnNpb24gb2YgeW91ciBzZXJpZXMuICBJIGRvbid0IHRoaW5rIGl0
IG1ha2VzIHNlbnNlDQo+Pj4gdG8gYmxvY2sgdGhpcyBwYXRjaCBvdmVyIGEgbmFtaW5nIGRpc2Fn
cmVlbWVudC4gIEFuZCBpdCB3b3VsZCBiZSBiZXN0DQo+Pj4gdG8gbWluaW1pc2UgdW5uZWNlc3Nh
cnkgY2h1cm4uDQo+Pj4gDQo+Pj4gSSB3b3VsZCBiZSBoYXBweSB0byByZWxlYXNlLWFjayBhIG5h
bWUgY2hhbmdlIChwZXJoYXBzIHByb3Bvc2VkIGJvIEphbg0KPj4+IG9yIFJvZ2VyKSBzdXBwb3Np
bmcgdGhhdCB0aGF0IGlzIHRoZSB1bHRpbWF0ZSBtYWludGFpbmVyIGNvbnNlbnN1cy4NCj4+PiAN
Cj4+PiBKYW4sIHdvdWxkIHRoYXQgYXBwcm9hY2ggYmUgT0sgd2l0aCB5b3UgPw0KPj4gDQo+PiBX
ZWxsLCB5ZXMsIGlmIGEgc3Vic2VxdWVudCBuYW1lIGNoYW5nZSBpcyBva2F5LCB0aGVuIEkgY291
bGQgbGl2ZSB3aXRoDQo+PiB0aGF0LiBJJ2Qgc3RpbGwgZmluZCBpdCBvZGQgdG8gcmVuYW1lIGEg
ZnVuY3Rpb24gaW1tZWRpYXRlbHkgYWZ0ZXIgaXQNCj4+IGFscmVhZHkgZ290IHJlbmFtZWQuIEFz
IGV4cHJlc3NlZCBlbHNld2hlcmUsIEkgc3VzcGVjdCBpbiBoaXMgcmVxdWVzdA0KPj4gUm9nZXIg
ZGlkIG5vdCBwYXkgYXR0ZW50aW9uIHRvIGEgdXNlIG9mIHRoZSBmdW5jdGlvbiBpbiBub24tRUNB
TSBjb2RlLg0KPiANCj4gVXNpbmcgTU1DRkdfQkRGIHdhcyBvcmlnaW5hbCByZXF1ZXN0ZWQgYnkg
SnVsaWVuLCBub3QgbXlzZWxmIEkgdGhpbms6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy94ZW4tZGV2ZWwvYTg2OGUxZTctODQwMC00NWRmLTZlYWEtNjlmMWUyYzk5MzgzQHhlbi5vcmcv
DQo+IA0KPiBJJ20gc2xpZ2h0bHkgbG9zcyBpbiBzbyBtYW55IG1lc3NhZ2VzLiBPbiB4ODYgd2Ug
c3VidHJhY3QgdGhlIE1DRkcNCj4gc3RhcnQgYWRkcmVzcyBmcm9tIHRoZSBwYXNzZWQgb25lIGJl
Zm9yZSBnZXR0aW5nIHRoZSBCREYsIGFuZCB0aGVuIHdlDQo+IGFkZCB0aGUgc3RhcnR0aW5nIGJ1
cyBhZGRyZXNzIHBhc3NlZCBpbiB0aGUgQUNQSSB0YWJsZS4gVGhpcyBpcyBzbyBmYXINCj4gbm90
IG5lZWQgb24gQXJtIEFGQUlDVCBiZWNhdXNlIG9mIHRoZSBmaXhlZCBuYXR1cmUgb2YgdGhlIHNl
bGVjdGVkDQo+IHZpcnR1YWwgRUNBTSByZWdpb24uDQoNCkF0IHRoZSBlbmQgbXkgcGF0Y2ggd2ls
bCBhZGQgaW4geGVuL3BjaS5oOg0KI2RlZmluZSBFQ0FNX0JERihhZGRyKSAgICAgICAgICgoKGFk
ZHIpICYgMHgwZmZmZjAwMCkgPj4gMTIpDQojZGVmaW5lIEVDQU1fUkVHX09GRlNFVChhZGRyKSAg
KChhZGRyKSAmIDB4MDAwMDBmZmYpDQoNCk5vdyBzZWVpbmcgdGhlIGNvbW1lbnQgdGhlIHF1ZXN0
aW9uIGlzIHNob3VsZCB0aG9zZSBiZSByZW5hbWVkIHdpdGggYSBWUENJDQpwcmVmaXggYW5kIGJl
IG1vdmVkIHRvIHhlbi92cGNpLmguDQoNClNvIGZhciBFQ0FNX0JERiBpcyBvbmx5IHVzZWQgaW4g
dnBjaV9tbWNmZ19kZWNvZGVfYWRkciB3aGljaCBpcyBvbmx5IGNhbGxlZA0KYmVmb3JlIGNhbGxp
bmcgdnBjaV9lY2FtX3tyZWFkL3dyaXRlfS4NCg0KRUNBTV9SRUdfT0ZGU0VUIGlzIG9ubHkgdXNl
ZCBpbiBhcm0gdnBjaSBjb2RlLg0KDQpEbyB5b3UgdGhpbmsgdGhlIGN1cnJlbnQgc3RhdGUgaXMg
b2sgb2YgdGhlIHJlbmFtaW5nICsgbW92aW5nIHNob3VsZCBiZSBkb25lID8NCg0KQ2hlZXJzDQpC
ZXJ0cmFuZA0KDQo=

