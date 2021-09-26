Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141241880D
	for <lists+xen-devel@lfdr.de>; Sun, 26 Sep 2021 12:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196045.348890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUR90-00035M-Oc; Sun, 26 Sep 2021 10:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196045.348890; Sun, 26 Sep 2021 10:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUR90-000327-KX; Sun, 26 Sep 2021 10:12:26 +0000
Received: by outflank-mailman (input) for mailman id 196045;
 Sun, 26 Sep 2021 10:12:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ODXE=OQ=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mUR8z-000321-Ap
 for xen-devel@lists.xenproject.org; Sun, 26 Sep 2021 10:12:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5634ffb-a464-4df4-b4bd-dc5929300532;
 Sun, 26 Sep 2021 10:12:21 +0000 (UTC)
Received: from FR3P281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::8) by
 DBBPR08MB4821.eurprd08.prod.outlook.com (2603:10a6:10:d5::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.18; Sun, 26 Sep 2021 10:12:08 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::5) by FR3P281CA0009.outlook.office365.com
 (2603:10a6:d10:1d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Sun, 26 Sep 2021 10:12:08 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Sun, 26 Sep 2021 10:12:07 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Sun, 26 Sep 2021 10:12:06 +0000
Received: from 5caf25f83aa4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 321481F2-BD88-45DC-A39E-165477F68436.1; 
 Sun, 26 Sep 2021 10:11:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5caf25f83aa4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 26 Sep 2021 10:11:54 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4569.eurprd08.prod.outlook.com (2603:10a6:10:b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Sun, 26 Sep
 2021 10:11:52 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Sun, 26 Sep 2021
 10:11:52 +0000
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
X-Inumbo-ID: a5634ffb-a464-4df4-b4bd-dc5929300532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CHNZMW4X8CflWPGMqk3n/4C28ulPxVyey+BzhzUUyI=;
 b=SsWqcw5+ljmFcFAuh6bWC8WftMVyQ3BARfJUdACrFycJP4/TfWdBLPcERsZMWIKXATDA4Q2uWQhvbhnDVhv/DDXrzVM3qKQT5hmfsfmB2AN1/daDnYW3SXBZv1G/Z7x8eWe/fzGS5U8aNrnMdnTTPBGQkFPtSdOuqcCgXpMi1X0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evIq/tcA7CSHkkKc0NfjdrZx73WWXBu8Z48ztGYnXNlCGQFSsyRq1cM6qtZEJuwR26IvZAsY1E2ohn+xJIFFUqq6s3Di9UWc8I66dsGciUc2LWZtzza6K5H8YesZy5SgQdEAVrJWWYtLS58bpWY/3SqmvAp6MgVsk8eyBby+EzBMXPATWbEZ0xiMI4WfOQb34pfRAPJi8d0fCgUQ0z67YrhPvDVit5ADN0AURd/wnvj+l6jE3BfNDoq+8jSoTjH7NrIWeMaxT1bofb+ScbJTY/a+XDJYbhSYUUB0XWkMvC70j4ZWq5X9lqJ1pEBgTnhnuYlZdwSzf8jp9DzuoIqKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=2CHNZMW4X8CflWPGMqk3n/4C28ulPxVyey+BzhzUUyI=;
 b=GU4q8ByKuQ5htQCThQzmF9s/NJJrpcHAxsURY4wFg60VizOUtfGpz3nHni/6A7cNBW1lQgwaPun1Ese5aL+l6iP+wyyzfA+HQREh6cRj+nG4bbz1UN6y/nUVO/WrbJq46wv3JN6Gv8fMjm20rE/NhEL3FafYtTyEW0p07B1UvzXUaBPKgiTJFh+sD85ljv9jG1ZWyuAH3Ktu4LyoiSTD2o+CQOkC7cHtTOqHDZpp6EEQkZnlfcTUsp5S9fSO/Atr8/JIEFb1Y+fDqOP0CZ3Ptmawaq6vr89E5r0Wlmrd88KFZVVw2esLuTpGB18Ntwd5Cde4VTiOicEw81rN7fT1Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CHNZMW4X8CflWPGMqk3n/4C28ulPxVyey+BzhzUUyI=;
 b=SsWqcw5+ljmFcFAuh6bWC8WftMVyQ3BARfJUdACrFycJP4/TfWdBLPcERsZMWIKXATDA4Q2uWQhvbhnDVhv/DDXrzVM3qKQT5hmfsfmB2AN1/daDnYW3SXBZv1G/Z7x8eWe/fzGS5U8aNrnMdnTTPBGQkFPtSdOuqcCgXpMi1X0=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Thread-Topic: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Thread-Index: AQHXsHMRZjZ8eZQrbkW8SEq2x0f00KuyVH0AgABDnECAAQJ+AIACfOAg
Date: Sun, 26 Sep 2021 10:11:51 +0000
Message-ID:
 <DB9PR08MB6857A3176752B3E08EAE4D739EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-9-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231719410.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB686474BADD786E523EAC026B9EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109241244070.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109241244070.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B603888FD9C0314FBBF36B8F636AF508.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: be1c4e6f-30c8-4c2b-295b-08d980d618f1
x-ms-traffictypediagnostic: DB8PR08MB4569:|DBBPR08MB4821:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4821A63551ED8A9073AC8AE49EA69@DBBPR08MB4821.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u5gj0Xy/o5NWiz9a1QkbxlzwxBb6mocsFyIoCVGUNZ9DcOQZVo18sD/VIL/VWVSqiwU5862tlERi2XNXZiR/+VXr39X0q7ob9Vg/Mn3dUt/i8ipreBKH33Wg0zgFl5+AwRd9Env4iIw1RYXO+TzcH+y6AoJZQfwB/w/Oeph2K2hq6QjkKImvaBFtIxmlRObT18CrIiAh50bUl9vo8VrJ6kbQx6qQA7wBuTS++LupFJMgQNngTcBid+Ceoz4Mohye/9G3FFSMFQJ8blcC8TgKwJ27iL/pKoX1+y1wMRhrhLZzMfxU93zD+84xmF8PvjwAxXdt2wI8tdVODg37pESkKjJ9dl41fnVoZPn9kg58fNFU8lN2szLUpYLPCdgAd7TG/w5iLS8P5bIJfTAVvZpnisYYlQnypXZetgLw1XoEuR+OLFq9TGuU9XzjfmfuW8zYkDi/+8z+IqYhyRTcnu72LP71vsu69OpLbn7MPvAFvgJZ5VVJPDg3gXdMEsXEeKSLvQaPav6tZphWzkfz6wu2QutUmsa17d3PABvPC6PqXx1jdhviNPWZbDC21AcQSbwbjidKMVTwGZBMQzgoCuoMWsJsPtwj7mFkkSQWsiTbHb6pgPN31Jjcik4ZdfASJs9VOWBK4/V36icYorhbCyNM2ONWuj7SMB9h6WPHSfuGv7MGNHOK7exJUjscGRrCWhXIIrB3CnJjQuKKUQSFwxhzhA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(122000001)(4326008)(71200400001)(33656002)(186003)(8676002)(38100700002)(6916009)(83380400001)(5660300002)(508600001)(26005)(76116006)(8936002)(2906002)(7696005)(86362001)(64756008)(52536014)(66556008)(66946007)(66476007)(53546011)(6506007)(66446008)(54906003)(55016002)(38070700005)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4569
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0d94cb2-fa12-4f71-5bd6-08d980d60f87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+L/uXENvpxdUr1hjYDbvNdf4q4ETGqI9RTwbkozH2Ye3Uy5Uv5Zix7Rv/I/FZI+EW1OEbvB60XILzUmtDJSrnk5lhDbLw5LrTCO4eAXQFU9XNG8Cit31KST7MTKGmzVc3Y+OeczIUHFUm8E7lrjRm+jJfglwdc1DdfyVtulMWqZBQWhGMboXooMly/4cltEVCt3uIfim0CU/LtQWA/DXAP5Vqdo/6hqS/AY3/K98LSdvhjwPPAAOb/rqnwDTTJuBpDFa23j/zTqJGEISSfbWjHLtLDJt0LPLYiU+kmuARSiKeI+8e6ajR/FNA8YMH/VVg550gosAcmgASFp7UfV7ZB/32KyHvsKGURJ6uGeRYE3xXEWX+DsF23RCc5JPsj9IkSDqUi2RGYtpYnUCDBndnSMvAMFKjvVN/IneLbU/JLFz6eGsm3PzXiwXo0Dgc6HJWEf6N1fQiLp1B8PUouGfuy2LipT9m3PjWle1Uu3Ozoxi4qITJNO/CB4sW2SQDBsAiVtxonca/KEk7z3iEAWn43y2p9jvbqpWkZBS1aFdBQ0f95j+KZBYJG+8L987FDP8gBaM6k4uujYCizMUjupCNlUkstS2mbEOFiOjoykZHRPKi0TwUFdu8dBi/wm+PBT3GrX9C0JFoNNki/6VqCMw5qd45vhmEOIGxb8Xqbe117wZArztSl0DOS7OUG1sR8kfXR/HCRG7a8NCUSOt3RIhIA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(55016002)(7696005)(356005)(54906003)(83380400001)(52536014)(4326008)(8936002)(508600001)(47076005)(6862004)(53546011)(316002)(5660300002)(81166007)(6506007)(186003)(36860700001)(82310400003)(33656002)(70206006)(26005)(70586007)(86362001)(336012)(2906002)(9686003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2021 10:12:07.8051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be1c4e6f-30c8-4c2b-295b-08d980d618f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4821

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ5
5pyIMjXml6UgMzo1Mw0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tDQo+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBqdWxpZW5AeGVuLm9yZzsgQmVydHJhbmQgTWFycXVpcw0K
PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgamJldWxpY2hAc3VzZS5jb207IGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb207DQo+IHJvZ2VyLnBhdUBjaXRyaXguY29tOyB3bEB4ZW4ub3JnDQo+
IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMDgvMzddIHhlbi94ODY6IGFkZCBkZXRlY3Rpb24gb2YgZGlz
Y29udGlub3VzIG5vZGUNCj4gbWVtb3J5IHJhbmdlDQo+IA0KPiBPbiBGcmksIDI0IFNlcCAyMDIx
LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
PiBGcm9tOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4g
PiBTZW50OiAyMDIx5bm0OeaciDI05pelIDg6MjYNCj4gPiA+IFRvOiBXZWkgQ2hlbiA8V2VpLkNo
ZW5AYXJtLmNvbT4NCj4gPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc7DQo+IGp1bGllbkB4ZW4ub3JnOw0KPiA+ID4gQmVydHJhbmQg
TWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgamJldWxpY2hAc3VzZS5jb207DQo+
ID4gPiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tOyByb2dlci5wYXVAY2l0cml4LmNvbTsgd2xA
eGVuLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwOC8zN10geGVuL3g4NjogYWRkIGRl
dGVjdGlvbiBvZiBkaXNjb250aW5vdXMgbm9kZQ0KPiA+ID4gbWVtb3J5IHJhbmdlDQo+ID4gPg0K
PiA+ID4gQ0MnaW5nIHg4NiBtYWludGFpbmVycw0KPiA+ID4NCj4gPiA+IE9uIFRodSwgMjMgU2Vw
IDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+ID4gPiBPbmUgTlVNQSBub2RlIG1heSBjb250YWlu
IHNldmVyYWwgbWVtb3J5IGJsb2Nrcy4gSW4gY3VycmVudCBYZW4NCj4gPiA+ID4gY29kZSwgWGVu
IHdpbGwgbWFpbnRhaW4gYSBub2RlIG1lbW9yeSByYW5nZSBmb3IgZWFjaCBub2RlIHRvIGNvdmVy
DQo+ID4gPiA+IGFsbCBpdHMgbWVtb3J5IGJsb2Nrcy4gQnV0IGhlcmUgY29tZXMgdGhlIHByb2Js
ZW0sIGluIHRoZSBnYXAgb2YNCj4gPiA+ID4gb25lIG5vZGUncyB0d28gbWVtb3J5IGJsb2Nrcywg
aWYgdGhlcmUgYXJlIHNvbWUgbWVtb3J5IGJsb2NrcyBkb24ndA0KPiA+ID4gPiBiZWxvbmcgdG8g
dGhpcyBub2RlIChyZW1vdGUgbWVtb3J5IGJsb2NrcykuIFRoaXMgbm9kZSdzIG1lbW9yeSByYW5n
ZQ0KPiA+ID4gPiB3aWxsIGJlIGV4cGFuZGVkIHRvIGNvdmVyIHRoZXNlIHJlbW90ZSBtZW1vcnkg
YmxvY2tzLg0KPiA+ID4gPg0KPiA+ID4gPiBPbmUgbm9kZSdzIG1lbW9yeSByYW5nZSBjb250YWlu
cyBvdGhlIG5vZGVzJyBtZW1vcnksIHRoaXMgaXMNCj4gb2J2aW91c2x5DQo+ID4gPiA+IG5vdCB2
ZXJ5IHJlYXNvbmFibGUuIFRoaXMgbWVhbnMgY3VycmVudCBOVU1BIGNvZGUgb25seSBjYW4gc3Vw
cG9ydA0KPiA+ID4gPiBub2RlIGhhcyBjb250aW5vdXMgbWVtb3J5IGJsb2Nrcy4gSG93ZXZlciwg
b24gYSBwaHlzaWNhbCBtYWNoaW5lLA0KPiB0aGUNCj4gPiA+ID4gYWRkcmVzc2VzIG9mIG11bHRp
cGxlIG5vZGVzIGNhbiBiZSBpbnRlcmxlYXZlZC4NCj4gPiA+ID4NCj4gPiA+ID4gU28gaW4gdGhp
cyBwYXRjaCwgd2UgYWRkIGNvZGUgdG8gZGV0ZWN0IGRpc2NvbnRpbm91cyBtZW1vcnkgYmxvY2tz
DQo+ID4gPiA+IGZvciBvbmUgbm9kZS4gTlVNQSBpbml0aWFsaXp0aW9uIHdpbGwgYmUgZmFpbGVk
IGFuZCBlcnJvciBtZXNzYWdlcw0KPiA+ID4gPiB3aWxsIGJlIHByaW50ZWQgd2hlbiBYZW4gZGV0
ZWN0IHN1Y2ggaGFyZHdhcmUgY29uZmlndXJhdGlvbi4NCj4gPiA+DQo+ID4gPiBBdCBsZWFzdCBv
biBBUk0sIGl0IGlzIG5vdCBqdXN0IG1lbW9yeSB0aGF0IGNhbiBiZSBpbnRlcmxlYXZlZCwgYnV0
DQo+IGFsc28NCj4gPiA+IE1NSU8gcmVnaW9ucy4gRm9yIGluc3RhbmNlOg0KPiA+ID4NCj4gPiA+
IG5vZGUwIGJhbmswIDAtMHgxMDAwMDAwDQo+ID4gPiBNTUlPIDB4MTAwMDAwMC0weDEwMDIwMDAN
Cj4gPiA+IEhvbGUgMHgxMDAyMDAwLTB4MjAwMDAwMA0KPiA+ID4gbm9kZTAgYmFuazEgMHgyMDAw
MDAwLTB4MzAwMDAwMA0KPiA+ID4NCj4gPiA+IFNvIEkgYW0gbm90IGZhbWlsaWFyIHdpdGggdGhl
IFNSQVQgZm9ybWF0LCBidXQgSSB0aGluayBvbiBBUk0gdGhlDQo+IGNoZWNrDQo+ID4gPiB3b3Vs
ZCBsb29rIGRpZmZlcmVudDogd2Ugd291bGQganVzdCBsb29rIGZvciBtdWx0aXBsZSBtZW1vcnkg
cmFuZ2VzDQo+ID4gPiB1bmRlciBhIGRldmljZV90eXBlID0gIm1lbW9yeSIgbm9kZSBvZiBhIE5V
TUEgbm9kZSBpbiBkZXZpY2UgdHJlZS4NCj4gPiA+DQo+ID4gPg0KPiA+DQo+ID4gU2hvdWxkIEkg
bmVlZCB0byBpbmNsdWRlL3JlZmluZSBhYm92ZSBtZXNzYWdlIHRvIGNvbW1pdCBsb2c/DQo+IA0K
PiBMZXQgbWUgYXNrIHlvdSBhIHF1ZXN0aW9uIGZpcnN0Lg0KPiANCj4gV2l0aCB0aGUgTlVNQSBp
bXBsZW1lbnRhdGlvbiBvZiB0aGlzIHBhdGNoIHNlcmllcywgY2FuIHdlIGRlYWwgd2l0aA0KPiBj
YXNlcyB3aGVyZSBlYWNoIG5vZGUgaGFzIG11bHRpcGxlIG1lbW9yeSBiYW5rcywgbm90IGludGVy
bGVhdmVkPw0KDQpZZXMuDQoNCj4gQW4gYW4gZXhhbXBsZToNCj4gDQo+IG5vZGUwOiAweDAgICAg
ICAgIC0gMHgxMDAwMDAwMA0KPiBNTUlPIDogMHgxMDAwMDAwMCAtIDB4MjAwMDAwMDANCj4gbm9k
ZTA6IDB4MjAwMDAwMDAgLSAweDMwMDAwMDAwDQo+IE1NSU8gOiAweDMwMDAwMDAwIC0gMHg1MDAw
MDAwMA0KPiBub2RlMTogMHg1MDAwMDAwMCAtIDB4NjAwMDAwMDANCj4gTU1JTyA6IDB4NjAwMDAw
MDAgLSAweDgwMDAwMDAwDQo+IG5vZGUyOiAweDgwMDAwMDAwIC0gMHg5MDAwMDAwMA0KPiANCj4g
DQo+IEkgYXNzdW1lIHdlIGNhbiBkZWFsIHdpdGggdGhpcyBjYXNlIHNpbXBseSBieSBzZXR0aW5n
IG5vZGUwIG1lbW9yeSB0bw0KPiAweDAtMHgzMDAwMDAwMCBldmVuIGlmIHRoZXJlIGlzIGFjdHVh
bGx5IHNvbWV0aGluZyBlbHNlLCBhIGRldmljZSwgdGhhdA0KPiBkb2Vzbid0IGJlbG9uZyB0byBu
b2RlMCBpbiBiZXR3ZWVuIHRoZSB0d28gbm9kZTAgYmFua3M/DQoNCldoaWxlIHRoaXMgY29uZmln
dXJhdGlvbiBpcyByYXJlIGluIFNvQyBkZXNpZ24sIGJ1dCBpdCBpcyBub3QgaW1wb3NzaWJsZS4g
DQoNCj4gDQo+IElzIGl0IG9ubHkgb3RoZXIgbm9kZXMnIG1lbW9yeSBpbnRlcmxlYXZlZCB0aGF0
IGNhdXNlIGlzc3Vlcz8gSW4gb3RoZXINCj4gd29yZHMsIG9ubHkgdGhlIGZvbGxvd2luZyBpcyBh
IHByb2JsZW1hdGljIHNjZW5hcmlvPw0KPiANCj4gbm9kZTA6IDB4MCAgICAgICAgLSAweDEwMDAw
MDAwDQo+IE1NSU8gOiAweDEwMDAwMDAwIC0gMHgyMDAwMDAwMA0KPiBub2RlMTogMHgyMDAwMDAw
MCAtIDB4MzAwMDAwMDANCj4gTU1JTyA6IDB4MzAwMDAwMDAgLSAweDUwMDAwMDAwDQo+IG5vZGUw
OiAweDUwMDAwMDAwIC0gMHg2MDAwMDAwMA0KPiANCj4gQmVjYXVzZSBub2RlMSBpcyBpbiBiZXR3
ZWVuIHRoZSB0d28gcmFuZ2VzIG9mIG5vZGUwPw0KPiANCg0KQnV0IG9ubHkgZGV2aWNlX3R5cGU9
Im1lbW9yeSIgY2FuIGJlIGFkZGVkIHRvIGFsbG9jYXRpb24uDQpGb3IgbW1pbyB0aGVyZSBhcmUg
dHdvIGNhc2VzOg0KMS4gbW1pbyBkb2Vzbid0IGhhdmUgTlVNQSBpZCBwcm9wZXJ0eS4NCjIuIG1t
aW8gaGFzIE5VTUEgaWQgcHJvcGVydHksIGp1c3QgbGlrZSBzb21lIFBDSWUgY29udHJvbGxlcnMu
DQogICBCdXQgd2UgZG9u4oCZdCBuZWVkIHRvIGhhbmRsZSB0aGVzZSBraW5kcyBvZiBNTUlPIGRl
dmljZXMNCiAgIGluIG1lbW9yeSBibG9jayBwYXJzaW5nLiBCZWNhdXNlIHdlIGRvbid0IG5lZWQg
dG8gYWxsb2NhdGUNCiAgIG1lbW9yeSBmcm9tIHRoZXNlIG1taW8gcmFuZ2VzLiBBbmQgZm9yIGFj
Y2Vzc2luZywgd2UgbmVlZA0KICAgYSBOVU1BLWF3YXJlIFBDSWUgY29udHJvbGxlciBkcml2ZXIg
b3IgYSBnZW5lcmljIE5VTUEtYXdhcmUNCiAgIE1NSU8gYWNjZXNzaW5nIEFQSXMuDQoNCj4gDQo+
IEkgYW0gYXNraW5nIHRoZXNlIHF1ZXN0aW9ucyBiZWNhdXNlIGl0IGlzIGNlcnRhaW5seSBwb3Nz
aWJsZSB0byBoYXZlDQo+IG11bHRpcGxlIG1lbW9yeSByYW5nZXMgZm9yIGVhY2ggTlVNQSBub2Rl
IGluIGRldmljZSB0cmVlLCBlaXRoZXIgYnkNCj4gc3BlY2lmeWluZyBtdWx0aXBsZSByYW5nZXMg
d2l0aCBhIHNpbmdsZSAicmVnIiBwcm9wZXJ0eSwgb3IgYnkNCj4gc3BlY2lmeWluZyBtdWx0aXBs
ZSBtZW1vcnkgbm9kZXMgd2l0aCB0aGUgc2FtZSBudW1hLW5vZGUtaWQuDQoNCg0K

