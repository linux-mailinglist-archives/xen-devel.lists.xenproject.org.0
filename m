Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C14E2039
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 06:47:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292752.497116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWAsb-0000Bv-Db; Mon, 21 Mar 2022 05:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292752.497116; Mon, 21 Mar 2022 05:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWAsb-00009t-A4; Mon, 21 Mar 2022 05:46:57 +0000
Received: by outflank-mailman (input) for mailman id 292752;
 Mon, 21 Mar 2022 05:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7Ei=UA=arm.com=Hongda.Deng@srs-se1.protection.inumbo.net>)
 id 1nWAsZ-00009n-DK
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 05:46:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e526aa3-a8da-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 06:46:53 +0100 (CET)
Received: from AM5PR0201CA0019.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::29) by DB6PR0801MB1991.eurprd08.prod.outlook.com
 (2603:10a6:4:71::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 05:46:44 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::e0) by AM5PR0201CA0019.outlook.office365.com
 (2603:10a6:203:3d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Mon, 21 Mar 2022 05:46:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 05:46:43 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Mon, 21 Mar 2022 05:46:43 +0000
Received: from d13aef9ab63a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6038C986-7E7E-4D37-ADAE-7B6505D0F12D.1; 
 Mon, 21 Mar 2022 05:46:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d13aef9ab63a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Mar 2022 05:46:34 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 by DB7PR08MB3915.eurprd08.prod.outlook.com (2603:10a6:10:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 05:46:28 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::e961:6117:1b58:38e7]) by VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::e961:6117:1b58:38e7%3]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 05:46:28 +0000
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
X-Inumbo-ID: 4e526aa3-a8da-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSv8N45yjCaI/ZJNr3x2ORl1tzjC7C2Q9iCmCO1Bmto=;
 b=NiXKXj1l4Szl6xlekqeoOxeaWCosUPM8sw2ymdiYfKUovGl3Or43FzVT36U1jd+YcZMm2lPBXwkb8y9TKgkCnaHdpQkq+1prhlPz67G6yzW0ckxu1U1KyggOyAN7acu5uVuypn0Zj0PUPcyMjsogqgdPzcZ+gBoHGBKNK2ygvLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYcowtAbEsu5Rq3bnqkwDmp24iPt49s2S4+IJoZGNvG8/xHOQ65HNoQkYfrf4kEhUIXijYAmrtkgunk/g68ZJML4CFW3sff2d4yCp6/7se6sy5vrVwpB+Y/bI56v9DmpJQjuN8DN0ymu8Dhtk8lhw1rAYy83hbnT+nLy/ZHX05lBGPlgvzx5OJvkgCKe8W2lqnu7v5VQvQxwqiE13JK0hInoUBQ1yADsCXkqbFZzmJ9dQy6JK/akWsuLCltU/o2QtvfhaQe5Grdl0hD6eByDmDsfCkdiAAMKpuagQC8kskB9HtqFt/niQKy6tTH5Ie8JpVdC+saVQyKtrm61XCZHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSv8N45yjCaI/ZJNr3x2ORl1tzjC7C2Q9iCmCO1Bmto=;
 b=dfylF3dWl62w/fHT3PpAKrTAc9JkCAvD6onhul7M5hHro1PWytf0W5uRgxXVUxItab8o8LOltonv90204iFsMft8I9gA3bStuikTUr79zQGf9+9OYf58kwJhSyM+I9BL+9ppyHHq73OukCtoRO72541lnIeI51RJTH7E3BTLnQ9BjQdxu//MsK7kCPCcVyBdTLI93F401oN2You6ItUap9MzC4cOgcaWbAm68aXZuy+3RiCuAQoK7QqDSfiOl3ICDxV7QGAGIjXGGmgkvolMGf48KOwJxFpJMPJqyrrnbRGtpaaGE2lY5p0OIgZscGz32Z83h6vyUk/5PuPnh/Y9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSv8N45yjCaI/ZJNr3x2ORl1tzjC7C2Q9iCmCO1Bmto=;
 b=NiXKXj1l4Szl6xlekqeoOxeaWCosUPM8sw2ymdiYfKUovGl3Or43FzVT36U1jd+YcZMm2lPBXwkb8y9TKgkCnaHdpQkq+1prhlPz67G6yzW0ckxu1U1KyggOyAN7acu5uVuypn0Zj0PUPcyMjsogqgdPzcZ+gBoHGBKNK2ygvLM=
From: Hongda Deng <Hongda.Deng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v3 05/19] xen/arm: mm: Add support for the contiguous bit
Thread-Topic: [PATCH v3 05/19] xen/arm: mm: Add support for the contiguous bit
Thread-Index: AQHYJwz6gD61KYQGFkmKC0/u3eFrX6ymQHyAgCM9yoA=
Date: Mon, 21 Mar 2022 05:46:27 +0000
Message-ID:
 <VE1PR08MB567728BFC23E74CAC3652FB5E6169@VE1PR08MB5677.eurprd08.prod.outlook.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-6-julien@xen.org>
 <e8382df1-eb0c-9571-873f-848e2d6cf8fa@xen.org>
In-Reply-To: <e8382df1-eb0c-9571-873f-848e2d6cf8fa@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5FD63EAAEFC8384397E4C3B6CFFB6870.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7ec8e614-5c27-4ac7-0efb-08da0afe2dff
x-ms-traffictypediagnostic:
	DB7PR08MB3915:EE_|AM5EUR03FT020:EE_|DB6PR0801MB1991:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1991DB7A481D670EDB14826EE6169@DB6PR0801MB1991.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v5LGxvcTjjCGIuBbtQB9/kSrHLduzy/FqUzJfGzUTuWrrGInu6s/rBwlxDUrAbDT9KK8XXUt5+GcOzp+sD4LhYho8ixVZnRwji8TpbhaPDBMyUmEFwD2rjPhe/F2TPdhJpy6UDvGKtfzbSSrG/aPxuhVYyWAKrSp9HVAdSplbPwiQc13xjQclCpxbCBOwrls+/2uQzxtN78VjHlx97bo/0a6CBzahxQrE5CHBKVsR86NptmVpKII5BSBlN3LSNteVsniJ44FqaJaYdcxEg3k/moeAECu74WUkowBWCBayGRZ7kSBcemGe3JP4ecx8h3KYu1BaC4r/lcKhy3P+oyUGFPo4sow13b7G6dhhZW2EuokEItKAtuy9zEaOpzP3SbLExeXp34Vyn3cTl7aVr+fOj94e2gHyQTBAE09LLKi5Po7j7mUbAcnh2z4PH8t7nf6bs4QiAjAzKZhZKbgnkecGWkSRPBhVD7TF9JrfZmT5gi5qfYi69WMknXpFI++rJ9mjyx9tnkfJoonJlhHZVAlDtYy3fpjzWCr4tGJ4Z5wY9LaEJ/fFeC6Yc/nB3rofsvO02DzTjAqI8enB4jAT0GHQbqlfJlX3ku8yLXbrmSgPRL4JRfQO32elzIQkWdJelLDdg9TwVls2pOZALRvOr5wXB0sBDRkM0uMyGlgenyzAXbW/hyG0ZkdRcjSMm3a4uZkdZp7s6REsntgl3BXDWPHQw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5677.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8936002)(508600001)(38070700005)(52536014)(122000001)(86362001)(6506007)(53546011)(5660300002)(9686003)(7696005)(4326008)(71200400001)(8676002)(66946007)(76116006)(55016003)(64756008)(66446008)(66476007)(66556008)(26005)(110136005)(54906003)(316002)(38100700002)(83380400001)(33656002)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3915
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	667cc573-0f92-458a-0c58-08da0afe2519
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aJMuKILZdyhDXWr91av9DEJZZcpnFeTpOQGK1bQMlwppVWuwYb/vg2s1+g/F9av0u+xKEKBRplOkMxMlzM0wTLIgJkJ8d2yQn56nDtQ6pLjI+QPrZGzaDkGHko1AixV0/6JE8IHQwzg7Pg+fLo2WxuPOpwH4e4aB+uXAnnQaxZ7044HMJOXYKhiD2WGh+6lf5o8mOEFiQ+8frACDIFwoOnvDWk8Zz30QLokJ0oPS1SRpXHETY4ah/KMgzGhjGIa/HOO4qQOx0VHd1UDkRAyPg0eBzS+o+mtId3jK4Vg9EEddgPKUggC9/iJJcCHlWWJgF/eCxuU1lvUOXz231OmmJIC5x0Pmk31KeHNzL4BMQGPWpAFnkHgTFO9/3DCpxyS+9wLfMSC6etRDnbkQW4RcYrEskxLHWO6k5TcuFz1pABEy6kXAosFWylobq97b2/oxsA1F5UoF3huhgjwI4HoNmkOe2bINkgWKvNjvwekWXxCZhZb6L0OOQ1kUtEChlKxb6eDRoL/o238YaF6WeI/AEVqczyuxdahpGjDijpGjTffFKYVwsShPiPgcl+3WZmLbJL/THvu7ZFYzMYP/CaG8pISKdoWQOTyhRxwXEQG5DNLhCrjRRHzF33wnICLpiEICTwMj85yDKkBaPMhjFSct2w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(70586007)(4326008)(47076005)(70206006)(508600001)(316002)(83380400001)(33656002)(54906003)(9686003)(110136005)(356005)(82310400004)(81166007)(186003)(8936002)(107886003)(53546011)(55016003)(36860700001)(8676002)(7696005)(2906002)(6506007)(5660300002)(26005)(52536014)(86362001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 05:46:43.5382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec8e614-5c27-4ac7-0efb-08da0afe2dff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1991

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1k
ZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
ZiBKdWxpZW4NCj4gR3JhbGwNCj4gU2VudDogMjAyMuW5tDLmnIgyN+aXpSAzOjMwDQo+IFRvOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEp1bGllbiBHcmFsbCA8amdyYWxs
QGFtYXpvbi5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xv
ZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjMgMDUvMTldIHhlbi9hcm06IG1tOiBBZGQgc3VwcG9ydCBmb3IgdGhlIGNvbnRp
Z3VvdXMgYml0DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDIxLzAyLzIwMjIgMTA6MjIsIEp1bGllbiBH
cmFsbCB3cm90ZToNCj4gPiBAQCAtMTMzMywyMSArMTM4NiwzNCBAQCBzdGF0aWMgaW50IHhlbl9w
dF91cGRhdGUodW5zaWduZWQgbG9uZyB2aXJ0LA0KPiA+ICAgICAgIHdoaWxlICggbGVmdCApDQo+
ID4gICAgICAgew0KPiA+ICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIsIGxldmVsOw0KPiA+
ICsgICAgICAgIHVuc2lnbmVkIGludCBucl9jb250aWc7DQo+ID4gKyAgICAgICAgdW5zaWduZWQg
aW50IG5ld19mbGFnczsNCj4gPg0KPiA+ICAgICAgICAgICBsZXZlbCA9IHhlbl9wdF9tYXBwaW5n
X2xldmVsKHZmbiwgbWZuLCBsZWZ0LCBmbGFncyk7DQo+ID4gICAgICAgICAgIG9yZGVyID0gWEVO
X1BUX0xFVkVMX09SREVSKGxldmVsKTsNCj4gPg0KPiA+ICAgICAgICAgICBBU1NFUlQobGVmdCA+
PSBCSVQob3JkZXIsIFVMKSk7DQo+ID4NCj4gPiAtICAgICAgICByYyA9IHhlbl9wdF91cGRhdGVf
ZW50cnkocm9vdCwgcGZuX3RvX3BhZGRyKHZmbiksIG1mbiwgbGV2ZWwsIGZsYWdzKTsNCj4gPiAt
ICAgICAgICBpZiAoIHJjICkNCj4gPiAtICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAg
LyoNCj4gPiArICAgICAgICAgKiBDaGVjayBpZiB3ZSBjYW4gc2V0IHRoZSBjb250aWd1b3VzIG1h
cHBpbmcgYW5kIHVwZGF0ZSB0aGUNCj4gPiArICAgICAgICAgKiBmbGFncyBhY2NvcmRpbmdseS4N
Cj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBucl9jb250aWcgPSB4ZW5fcHRfY2hlY2tf
Y29udGlnKHZmbiwgbWZuLCBsZXZlbCwgbGVmdCwgZmxhZ3MpOw0KPiA+ICsgICAgICAgIG5ld19m
bGFncyA9IGZsYWdzIHwgKChucl9jb250aWcgPiAxKSA/IF9QQUdFX0NPTlRJRyA6IDApOw0KPiA+
DQo+ID4gLSAgICAgICAgdmZuICs9IDFVIDw8IG9yZGVyOw0KPiA+IC0gICAgICAgIGlmICggIW1m
bl9lcShtZm4sIElOVkFMSURfTUZOKSApDQo+ID4gLSAgICAgICAgICAgIG1mbiA9IG1mbl9hZGQo
bWZuLCAxVSA8PCBvcmRlcik7DQo+ID4gKyAgICAgICAgZm9yICggOyBucl9jb250aWcgPiAwOyBu
cl9jb250aWctLSApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICByYyA9IHhlbl9w
dF91cGRhdGVfZW50cnkocm9vdCwgcGZuX3RvX3BhZGRyKHZmbiksIG1mbiwgbGV2ZWwsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuZXdfZmxhZ3MpOw0KPiA+ICsg
ICAgICAgICAgICBpZiAoIHJjICkNCj4gPiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+DQo+
ID4gLSAgICAgICAgbGVmdCAtPSAoMVUgPDwgb3JkZXIpOw0KPiA+ICsgICAgICAgICAgICB2Zm4g
Kz0gMVUgPDwgb3JkZXI7DQo+ID4gKyAgICAgICAgICAgIGlmICggIW1mbl9lcShtZm4sIElOVkFM
SURfTUZOKSApDQo+ID4gKyAgICAgICAgICAgICAgICBtZm4gPSBtZm5fYWRkKG1mbiwgMVUgPDwg
b3JkZXIpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgbGVmdCAtPSAoMVUgPDwgb3JkZXIpOw0K
PiA+ICsgICAgICAgIH0NCj4gDQo+IEkgZm9yZ290IHRvIGFkZDoNCj4gDQo+IGlmICggcmMgKQ0K
PiAgICBicmVhazsNCj4gDQo+IFdpdGhvdXQgaXQsIHRoZSBvdXRlciBsb29wIHdpbGwgbmV2ZXIg
ZXhpdCBpbiBjYXNlIG9mIGFuIGVycm9yLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVs
aWVuIEdyYWxsDQoNClllcCwgSSBhbSBoYXBweSB3aXRoIHRoYXQuDQoNClJldmlld2VkLWJ5OiBI
b25nZGEgRGVuZyA8SG9uZ2RhLkRlbmdAYXJtLmNvbT4NCg0KQ2hlZXJzLA0KLS0tDQpIb25nZGEN
Cg0K

