Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2FE4CEF80
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 03:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285592.484800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR2ra-0006ak-DU; Mon, 07 Mar 2022 02:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285592.484800; Mon, 07 Mar 2022 02:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR2ra-0006ZK-94; Mon, 07 Mar 2022 02:12:42 +0000
Received: by outflank-mailman (input) for mailman id 285592;
 Mon, 07 Mar 2022 02:12:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PzSx=TS=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nR2rY-0006ZE-Ak
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 02:12:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dd2f10d-9dbc-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 03:12:36 +0100 (CET)
Received: from AS9PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:20b:50e::10)
 by VI1PR08MB4543.eurprd08.prod.outlook.com (2603:10a6:803:f4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 02:12:27 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::2f) by AS9PR04CA0085.outlook.office365.com
 (2603:10a6:20b:50e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Mon, 7 Mar 2022 02:12:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Mon, 7 Mar 2022 02:12:26 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Mon, 07 Mar 2022 02:12:26 +0000
Received: from 3324ac1cb578.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 14B29D45-9A4C-429A-8013-1E3225C146EE.1; 
 Mon, 07 Mar 2022 02:12:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3324ac1cb578.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Mar 2022 02:12:20 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB5882.eurprd08.prod.outlook.com (2603:10a6:10:200::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 02:12:09 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 02:12:09 +0000
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
X-Inumbo-ID: 0dd2f10d-9dbc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g8yivnvx85CDEKooahcFOCx+7K/iJEV17lk+KBSg5s=;
 b=6OgXsrocnWciHljh6rGPZ5gnthwMPblapJHH6GbKOnXLDhVXUoaEU88lpyhH4RMAC6Dy3DEWiicUO8CKxtnjOzRc2Tmbifn4/XSjgzAJHDgn3kz0iE43w4yNuqw3EwUDLF41naKNxzAm2SAFgQzPONCBXE3ItlsPFP+DXPRlDSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUz6UEMnDCO8ILbjxNthzOJ/nGh71OnpO/Mdlz/Gq3kMXQvWh63+oJs8XGnmxx0PPHtQNYETDdxwbJJKyuIyxqyWbUXcb7azPMjC2hyQQV9JiBQS54Kh6BVd4TX9tKfRUsM5TQxixGMtYGfER3X1IKikj7Izbn8wvsq4bGnAwPVhoED+C+THih4ZdyErxfEX0SrQC2UxXO3cY2D/+N10MeoOoYBA79UzWefbopuu4KeN2R3mTYO6DrGsUFvgJ+ruDgyxvSGhSXx8JHJacEZWWWkPqK3A6DYCC6KYlpkW1XmGjJmXXl0PAVff5yLOOQ+pziXtCEr5tB0rLNAVHmh5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g8yivnvx85CDEKooahcFOCx+7K/iJEV17lk+KBSg5s=;
 b=PZrw7sQcq7psiZOw1gekvpgIxlGzZkq8eWmvVsrayQYbw54y7P3c602sP0+UfB5z0UHZyYkohLCjQAtQfaxqGyrxS4aKV7MjPGnoGOhpQs11cKnGBTdYORS42WIpEht0r1wkHv6rSUVXBupX0rp0D/7Az2/Fh9PNiGikX5muSyoIO6O7FVtW9WqLT1FOwxRW6CXW4HbZjndBgL1qrWS/KgRx4gNaHaT1PD6UBPJNVaZk/799mtctdMqu7mR29/5/txhohdjd7ylf9fLodXX0/dN9pbDBA4qd3kf31nTICGVWDp4kWvMODuGM76tI0DHI76KSzSOOg7juTwPCgyhb9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g8yivnvx85CDEKooahcFOCx+7K/iJEV17lk+KBSg5s=;
 b=6OgXsrocnWciHljh6rGPZ5gnthwMPblapJHH6GbKOnXLDhVXUoaEU88lpyhH4RMAC6Dy3DEWiicUO8CKxtnjOzRc2Tmbifn4/XSjgzAJHDgn3kz0iE43w4yNuqw3EwUDLF41naKNxzAm2SAFgQzPONCBXE3ItlsPFP+DXPRlDSQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index: AdgpQxtXwh7LkfydTgiYk9bhMgU+ogBRt1sAAKse4VAAPag1gAAckyvAAMo7i2A=
Date: Mon, 7 Mar 2022 02:12:09 +0000
Message-ID:
 <PAXPR08MB7420827063D47932F428CEC89E089@PAXPR08MB7420.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <04db7e8b-2f04-41d7-1deb-d8bda3625c04@xen.org>
 <PAXPR08MB7420BF1299A1577B98211C1A9E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <1f0bba54-158b-d171-6f99-0c29e0547f8a@xen.org>
 <PAXPR08MB742067028155B11528C5CCA39E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
In-Reply-To:
 <PAXPR08MB742067028155B11528C5CCA39E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BBF7EB49631EB449A488D1A77FB1DFFA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 96cf3465-a978-40a7-4cdb-08d9ffdfecf7
x-ms-traffictypediagnostic:
	DBBPR08MB5882:EE_|VE1EUR03FT049:EE_|VI1PR08MB4543:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4543B865EE1DF21B42082FDE9E089@VI1PR08MB4543.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x4Q0oNmR7VHxVNz0c1cxNGrmLrI456QmpRrT6ljrlzpqogvTycqK9uyaCCfAyhBVz8wWibkoqe8UPhNBBbYFtZmWpjJo8VELA9fAlzuEZCpZzO4blrEtZsJgTsR8BPIuGc6tXDb9w/U0yVkE6Sg1l/m2gey9dJkIm1KWl8m4W8R9T9PZuJcsV6nUfBWloPEHQX8Q6MmZf2S/gNqwn/2/mxBK84fTQILaBtJLG0RgoSmfnQGmzQkxPKc1LTGy6m8pC7RCRh2r8mlnRaxiLzPZNHwqlmRu+99I/vQ55B5Ea8BJRcpWI9MPocrzX7Jx/blugEhDPwIKrtGqJKQGnkixCGqMw2TR1PCZ3coOOobqa7o1Hff6LAK4uvOCsrm3JNvcpUAOl0130sIy00UsJMRq1l9tvnRx9F+VZrCKaOc0tLI1ZFQTMC3k3hsEN+DOQKVgrBIhMWaWf0Ax2PgFcVD0LbopAqxGjGr8F2FZ09/Fq+5GnWDlRRdgumjIOKrlIb6jUjvHzUq8bc3iINpU/iwNSa2eimPwuuyJDqfJfNAscHDvGeZXMduZcah1m3TbypFBl/kVcP0Vzm1aq8xg4jHmUpmsIQI+FgwaxgmPm/9ZTGHx29gkAah6cHFLpxgxJYjDuBdKVAwjXME1yC+a86lqeEkp5nyaiZhPSMHDRL2f+B3yUhQX3MthBuyDa5MNhM+MaQSpQZ+vrgR269TaKZVncg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(508600001)(38100700002)(52536014)(110136005)(71200400001)(55016003)(54906003)(122000001)(38070700005)(7696005)(6506007)(66476007)(66556008)(66946007)(76116006)(4326008)(316002)(66446008)(64756008)(8676002)(9686003)(186003)(33656002)(83380400001)(53546011)(8936002)(5660300002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5882
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd335dee-f162-430f-5dd6-08d9ffdfe2b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wN+e7zd/e5QD2ZRTszvIe6IYyoYgv/7uVLD06YBKcW9DN9u093zv5yjLILLUePtbyrTFdLNQc/eIHq1lxbE6UKTvWFzsbTJGFDHJ6qdTfS2XTbVjZgMR7V+eBPmRGBtTiZRVgvUZKCNq9fcr1Rct+n2SQVyHrRcJzS8H/9Y1dgevgGCWko0yZeRjZ+AypbZjjvNj6qjUaZlLp2Asvmks8vU1mkQmKl4I+xJFRvaDEHJiapetKl4ERsbPzT0uJnSt9VUCbHWyjbZtDxh0GxMKKZWL1WuG6rSpBoR2n7HdKRnih+WEbHfBTN15jE1ZiVYfztvzXhg6yhRbS9PztHrlCnn2mq2cBqh8rT5UDSlUoadAa4YBMYe67ZQCINMy9SAsvCI7UPjn7TZdHfIf6B22OyjK9k2JDAIhZLYcjmA+W+oWeV3euAQLYRIfcTIQxKc9i3f1c1GSJQBVGwz1TqZsXkI7NhQsRCEExASfgYqPgiu3KukY5yEkKe8ZDVk8F8Lz/bTbeDNnYHDGkmKgOYtzGU/0ddVSsWZTE8ieM3Q4G3iDkLOwB4sWXvykxJAoEkenr2HJuPm4x5+0M2ULguX099Uz1gDTOBA26iaYnEh9zaeGxM2HQpYFuHKEAU25LWcojnd/T9DtpGeCWU4CVuboww==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(110136005)(83380400001)(55016003)(356005)(36860700001)(86362001)(54906003)(186003)(26005)(33656002)(336012)(316002)(5660300002)(8936002)(52536014)(2906002)(8676002)(508600001)(4326008)(70206006)(70586007)(9686003)(82310400004)(6506007)(7696005)(53546011)(47076005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 02:12:26.6649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cf3465-a978-40a7-4cdb-08d9ffdfecf7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4543

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4t
ZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYg
T2YgV2VpDQo+IENoZW4NCj4gU2VudDogMjAyMuW5tDPmnIgz5pelIDEwOjA3DQo+IFRvOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBQZW5ueSBaaGVuZw0K
PiA8UGVubnkuWmhlbmdAYXJtLmNvbT47IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT47
IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSRTogUHJvcG9zYWwgZm9yIFBvcnRpbmcgWGVu
IHRvIEFybXY4LVI2NCAtIERyYWZ0QQ0KPiANCj4gSGkgSnVsaWVuLA0KPiANCj4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+DQo+ID4gU2VudDogMjAyMuW5tDPmnIgy5pelIDIwOjAwDQo+ID4gVG86IFdlaSBDaGVuIDxX
ZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW5v
DQo+ID4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPiBDYzogQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgUGVubnkgWmhlbmcNCj4gPiA8
UGVubnkuWmhlbmdAYXJtLmNvbT47IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT47IG5k
IDxuZEBhcm0uY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBQcm9wb3NhbCBmb3IgUG9ydGluZyBYZW4g
dG8gQXJtdjgtUjY0IC0gRHJhZnRBDQo+ID4NCj4gPg0KPiA+DQo+ID4gT24gMDEvMDMvMjAyMiAw
Nzo1MSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gPiBIaSBKdWxpZW4sDQo+ID4NCj4gPiBIaSBXZWks
DQo+ID4NCj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4gPj4gU2VudDogMjAyMuW5tDLmnIgyNuaX
pSA0OjU1DQo+ID4gPj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+IFN0ZWZhbm8NCj4gPiA+PiBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+ID4+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+OyBQZW5ueSBaaGVuZw0KPiA+ID4+IDxQZW5ueS5aaGVuZ0Bh
cm0uY29tPjsgSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPjsgbmQNCj4gPG5kQGFybS5j
b20+DQo+ID4gPj4gU3ViamVjdDogUmU6IFByb3Bvc2FsIGZvciBQb3J0aW5nIFhlbiB0byBBcm12
OC1SNjQgLSBEcmFmdEENCj4gPiA+Pj4gIyMjIDEuMi4gWGVuIENoYWxsZW5nZXMgd2l0aCBQTVNB
IFZpcnR1YWxpemF0aW9uDQo+ID4gPj4+IFhlbiBpcyBQTVNBIHVuYXdhcmUgVHlwZS0xIEh5cGVy
dmlzb3IsIGl0IHdpbGwgbmVlZCBtb2RpZmljYXRpb25zIHRvDQo+ID4gcnVuDQo+ID4gPj4+IHdp
dGggYW4gTVBVIGFuZCBob3N0IG11bHRpcGxlIGd1ZXN0IE9TZXMuDQo+ID4gPj4+DQo+ID4gPj4+
IC0gTm8gTU1VIGF0IEVMMjoNCj4gPiA+Pj4gICAgICAgLSBObyBFTDIgU3RhZ2UgMSBhZGRyZXNz
IHRyYW5zbGF0aW9uDQo+ID4gPj4+ICAgICAgICAgICAtIFhlbiBwcm92aWRlcyBmaXhlZCBBUk02
NCB2aXJ0dWFsIG1lbW9yeSBsYXlvdXQgYXMgYmFzaXMNCj4gb2YNCj4gPiA+PiBFTDINCj4gPiA+
Pj4gICAgICAgICAgICAgc3RhZ2UgMSBhZGRyZXNzIHRyYW5zbGF0aW9uLCB3aGljaCBpcyBub3Qg
YXBwbGljYWJsZSBvbg0KPiA+IE1QVQ0KPiA+ID4+IHN5c3RlbSwNCj4gPiA+Pj4gICAgICAgICAg
ICAgd2hlcmUgdGhlcmUgaXMgbm8gdmlydHVhbCBhZGRyZXNzaW5nLiBBcyBhIHJlc3VsdCwgYW55
DQo+ID4gPj4gb3BlcmF0aW9uDQo+ID4gPj4+ICAgICAgICAgICAgIGludm9sdmluZyB0cmFuc2l0
aW9uIGZyb20gUEEgdG8gVkEsIGxpa2UgaW9yZW1hcCwgbmVlZHMNCj4gPiA+PiBtb2RpZmljYXRp
b24NCj4gPiA+Pj4gICAgICAgICAgICAgb24gTVBVIHN5c3RlbS4NCj4gPiA+Pj4gICAgICAgLSBY
ZW4ncyBydW4tdGltZSBhZGRyZXNzZXMgYXJlIHRoZSBzYW1lIGFzIHRoZSBsaW5rIHRpbWUNCj4g
PiBhZGRyZXNzZXMuDQo+ID4gPj4+ICAgICAgICAgICAtIEVuYWJsZSBQSUMgKHBvc2l0aW9uLWlu
ZGVwZW5kZW50IGNvZGUpIG9uIGEgcmVhbC10aW1lDQo+ID4gdGFyZ2V0DQo+ID4gPj4+ICAgICAg
ICAgICAgIHByb2Nlc3NvciBwcm9iYWJseSB2ZXJ5IHJhcmUuDQo+ID4gPj4NCj4gPiA+PiBBc2lk
ZSB0aGUgYXNzZW1ibHkgYm9vdCBjb2RlIGFuZCBVRUZJIHN0dWIsIFhlbiBhbHJlYWR5IHJ1bnMg
YXQgdGhlDQo+ID4gc2FtZQ0KPiA+ID4+IGFkZHJlc3MgYXMgaXQgd2FzIGxpbmtlZC4NCj4gPiA+
Pg0KPiA+ID4NCj4gPiA+IEJ1dCB0aGUgZGlmZmVyZW5jZSBpcyB0aGF0LCBiYXNlIG9uIE1NVSwg
d2UgY2FuIHVzZSB0aGUgc2FtZSBsaW5rDQo+ID4gYWRkcmVzcw0KPiA+ID4gZm9yIGFsbCBwbGF0
Zm9ybXMuIEJ1dCBvbiBNUFUgc3lzdGVtLCB3ZSBjYW4ndCBkbyBpdCBpbiB0aGUgc2FtZSB3YXku
DQo+ID4NCj4gPiBJIGFncmVlIHRoYXQgd2UgY3VycmVudGx5IHVzZSB0aGUgc2FtZSBsaW5rIGFk
ZHJlc3MgZm9yIGFsbCB0aGUNCj4gPiBwbGF0Zm9ybXMuIEJ1dCB0aGlzIGlzIGFsc28gYSBwcm9i
bGVtIHdoZW4gdXNpbmcgTU1VIGJlY2F1c2UgRUwyIGhhcyBhDQo+ID4gc2luZ2xlIFRUQlIuDQo+
ID4NCj4gPiBBdCB0aGUgbW9tZW50IHdlIGFyZSBzd2l0Y2hpbmcgcGFnZS10YWJsZXMgd2l0aCB0
aGUgTU1VIHdoaWNoIGlzIG5vdA0KPiA+IHNhZmUuIEluc3RlYWQgd2UgbmVlZCB0byB0dXJuIG91
dCB0aGUgTU1VIG9mZiwgc3dpdGNoIHBhZ2UtdGFibGVzIGFuZA0KPiA+IHRoZW4gdHVybiBvbiB0
aGUgTU1VLiBUaGlzIG1lYW5zIHdlIG5lZWQgdG8gaGF2ZSBhbiBpZGVudGl0eSBtYXBwaW5nIG9m
DQo+ID4gWGVuIGluIHRoZSBwYWdlLXRhYmxlcy4gQXNzdW1pbmcgWGVuIGlzIG5vdCByZWxvY2F0
ZWQsIHRoZSBpZGVudGl0eQ0KPiA+IG1hcHBpbmcgbWF5IGNsYXNoIHdpdGggWGVuIChvciB0aGUg
cmVzdCBvZiB0aGUgdmlydHVhbCBhZGRyZXNzIG1hcCkuDQo+ID4NCj4gDQo+IElzIHRoaXMgdGhl
IHNhbWUgcmVhc29uIHdlIGNyZWF0ZSBhIGR1bW15IHJlbG9jIHNlY3Rpb24gZm9yIEVGSSBsb2Fk
ZXI/DQo+IA0KPiA+IE15IGluaXRpYWwgaWRlYSB3YXMgdG8gZW5hYmxlIFBJQyBhbmQgdXBkYXRl
IHRoZSByZWxvY2F0aW9uIGF0IGJvb3QNCj4gPiB0aW1lLiBCdXQgdGhpcyBpcyBhIGJpdCBjdW1i
ZXJzb21lIHRvIGRvLiBTbyBub3cgSSBhbSBsb29raW5nIHRvIGhhdmUgYQ0KPiA+IHNlbWktZHlu
YW1pYyB2aXJ0dWFsIGxheW91dCBhbmQgZmluZCBzb21lIHBsYWNlIHRvIHJlbG9jYXRlIHBhcnQg
b2YgWGVuDQo+ID4gdG8gdXNlIGZvciBDUFUgYnJpbmctdXAuDQo+ID4NCj4gPiBBbnl3YXksIG15
IHBvaW50IGlzIHdlIHBvc3NpYmx5IGNvdWxkIGxvb2sgYXQgUElDIGlmIHRoYXQgY291bGQgYWxs
b3cNCj4gPiBnZW5lcmljIFhlbiBpbWFnZS4NCj4gPg0KPiANCj4gSSB1bmRlcnN0YW5kIHlvdXIg
Y29uY2Vybi4gSU1PLCBQSUMgaXMgcG9zc2libGUgdG8gZG8gdGhpcywgYnV0IG9idmlvdXNseSwN
Cj4gaXQncyBub3QgYSBzbWFsbCBhbW91bnQgb2Ygd29yay4gQW5kIEkgd2FudCB0byBoZWFyIHNv
bWUgc3VnZ2VzdGlvbnMgZnJvbQ0KPiBTdGVmYW5vLCBiZWNhdXNlIGhlIGFsc28gaGFzIHNvbWUg
c29sdXRpb25zIGluIHByZXZpb3VzIHRocmVhZC4NCj4NCg0KQ2FuIHlvdSBoYXZlIGEgbG9vayBh
dCB0aGUgUElDIGRpc2N1c3Npb24gYmV0d2VlbiBKdWxpZW4gYW5kIG1lPw0KSSB0aGluayB3ZSBt
YXkgbmVlZCBzb21lIGlucHV0cyBmcm9tIHlvdXIgdmlldy4NCg0KVGhhbmtzLA0KV2VpIENoZW4N
Cg0KWy4uLl0NCg==

