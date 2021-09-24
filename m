Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E7E416AFE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194870.347216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcpo-0004OL-Ks; Fri, 24 Sep 2021 04:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194870.347216; Fri, 24 Sep 2021 04:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcpo-0004MX-GP; Fri, 24 Sep 2021 04:29:16 +0000
Received: by outflank-mailman (input) for mailman id 194870;
 Fri, 24 Sep 2021 04:29:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTcpn-0004MR-34
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:29:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5446baf4-4f36-4bab-a0a0-ae538cb50bde;
 Fri, 24 Sep 2021 04:29:12 +0000 (UTC)
Received: from PR0P264CA0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::16)
 by VE1PR08MB4766.eurprd08.prod.outlook.com (2603:10a6:802:a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 24 Sep
 2021 04:29:10 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1f:cafe::24) by PR0P264CA0196.outlook.office365.com
 (2603:10a6:100:1f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 04:29:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:29:09 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Fri, 24 Sep 2021 04:29:08 +0000
Received: from 5aecf7542546.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D925695-8B5E-4D6B-AEC4-205470F0A028.1; 
 Fri, 24 Sep 2021 04:28:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5aecf7542546.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:28:58 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com (2603:10a6:102:132::14)
 by PR3PR08MB5771.eurprd08.prod.outlook.com (2603:10a6:102:83::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 04:28:56 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be]) by PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be%6]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:28:56 +0000
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
X-Inumbo-ID: 5446baf4-4f36-4bab-a0a0-ae538cb50bde
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zs6oHfWBEU2Z7IZde4JkiH/HT8DfYr+zVd0B+TsJwyo=;
 b=n2mEaDSZB05RYq/cGVdS8f1NZZhOe5eTduP73g3dUR2K8oKzmtX+1r2ZNAJPhmXWCrHxu0NPDS+PTesYqjlUPscT+i/S/FY0d8/6h4w6jS5c2jYHKqC5rzp/RRyIj25HvoOUlV1xeMI7FSDtvkrzKGxvNjdYz9Hwvg6MzEW7qbI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEgI5zS7sM6fjcyyLWmvkyOSJbFA6UCc3F+wiB/MJNukOkpqkELNxiKBvkEpmxo8DpQK62GBkb1wzxKPqB9irHP4349HXxaeTi2fcaSCy15kdqLM8cG9E5i3n/JOMjxySw7H/xWPF1Wfmm2PW7kdzf1yA5cM3Ua/WY9MYuknJnpg8c7d6aZmLzX+O8OZdqk+ho2KnUt6ngbU/jIkXg7DWmo/4MeQUuL+IgtEdB1JZvb7fUqsHRHzQ+Cdi9sWziFxCoJosd5xul2OWkN0O40+934lsmLD4s5uH8HH9I2SlsTu/8xEhTxJ4mbtiIuIb9AvT1Gm6hsSfEJ8kEZ5s1MtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Zs6oHfWBEU2Z7IZde4JkiH/HT8DfYr+zVd0B+TsJwyo=;
 b=kOzmx8fWdXYiHh9XcsD6tRmWevlgUbVzNszd/LSEGtMhq58lvgQGXq58Io+44dpJJKjK4AForI8BMAUx78rntbGfVzMyuEtGvnJKdOaPLsSQj2kcCAVL2oIyOVxTrNcjpZLm5aVgucHzQlGLu6Ez3UNqEtA7Cxo7IMDfzb3ycl2Oi8TwpJAzDu2v+YwpDEtXY3clPzLesaf4sg3tXQDkpeOSKDnWztxgSRr6i0uthg1pQU7J0ghyxRoPd+CPtstJbQYvyE2GOquja3OLCSYu9WCybPsNHay58s0RXNFDctDflv97DXV09DPdsCaP2SbU9ZMBk6EfoWqWa8GeSFUxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zs6oHfWBEU2Z7IZde4JkiH/HT8DfYr+zVd0B+TsJwyo=;
 b=n2mEaDSZB05RYq/cGVdS8f1NZZhOe5eTduP73g3dUR2K8oKzmtX+1r2ZNAJPhmXWCrHxu0NPDS+PTesYqjlUPscT+i/S/FY0d8/6h4w6jS5c2jYHKqC5rzp/RRyIj25HvoOUlV1xeMI7FSDtvkrzKGxvNjdYz9Hwvg6MzEW7qbI=
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
Thread-Index: AQHXsHMRZjZ8eZQrbkW8SEq2x0f00KuyVH0AgABDnEA=
Date: Fri, 24 Sep 2021 04:28:56 +0000
Message-ID:
 <PAXPR08MB686474BADD786E523EAC026B9EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-9-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231719410.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231719410.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6F0A5B5F03ED554A8D509BC09F619A37.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b6d918df-5af5-4493-c17a-08d97f13da94
x-ms-traffictypediagnostic: PR3PR08MB5771:|VE1PR08MB4766:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB476607CCA25FCF4A508A69E39EA49@VE1PR08MB4766.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AFBGnggK6u1qWPSs7pzy72+o07Fg/ilxqV8xmK+c/k3TT+iyY+tY+QtQZLuC7lJ+JGsh6Vh9OLzZZ1QixXY8M8rz5hHWMCVc/gYnpXQ5ZiJ9yCduOJgHTvIkls93CuVyW7kk8UDXsQFM77tjPD8Lmnu7L3es6VTa+GMqPEmeb5SkDZhySE4WSkVOaDgdz0CaR3l6kOFCDOemTkZk7/YtOhHqYxbQohg+jHBJxYGOw6M6rxMigJALSiT8b36hXk5Gbzag6Eib/32VwtKCurrbZZg4+K4zqDpIFQARkT0fn1cbIkiBP7tAyh9jkR1fFj2n9zXHo1CgWsk6hctCWRnUUZzCo879vI8dq8Oeg2gPWkHy92ENfKcCziAR4Qdnki3vhR1CdtcSUsv8iNX5fSFHXqy9WahoZhd54cL4uX9cE3Iku5aW/8XHessB214UmhntH/rIRyYjwswPRB1rWeZbEPnjhXfO5B8Tf/LWZFQyjgr6IQkuMOhzrcTpygczM3NfaDvu0rXtwEI9cTsQqzJy0I5GEM5IuwSmIK2bItTD4DVMiw54OnWQgSmNtO3ByX6BasllNu+rs2oYp49FEgZ37R02cxKL77lHZ781l1PBczK1gScQyJT+Rtr1RNWcbgfad89wASx4WSzwoI+xtpANe9Bf3Q+oOR/4GQBmdrdIQl5irMzAH0jqrtS8wnlIjSoizcLv773TlnmEhqwkS+6VTw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6864.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(4326008)(122000001)(8936002)(55016002)(38070700005)(52536014)(9686003)(6506007)(53546011)(7696005)(71200400001)(186003)(66476007)(66946007)(6916009)(508600001)(66446008)(64756008)(38100700002)(83380400001)(76116006)(2906002)(5660300002)(33656002)(26005)(66556008)(316002)(54906003)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5771
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef41bee6-d68f-4028-a801-08d97f13d2aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DFuCruuKdSlGLoBvHYKZcR0U2pVoFxdnbMJSqqMzEK6vHtukiy7mGDKuu2OuGbEq2saihNhit9iFscbnrxzZq6gMfotlHcAwrV2OJzjR0ctmpFJ5jfqUVLoswLxExUZwqJ5k4Ttb9E8yCv56lJ+JIst3VOZPfFKu8N+0/hG76wclfNCvS6wRNYmOYRrPiLEb3vg3cEBPiigEq600glaeVqHVxBH8HZ0zvm7lYYMq4hVpSnG7qNFSlaScVieXhoDJmaqMPaplp4XVYexVeJhhqz/3o5O/R0B+ozg31AAlVIHB9AcyfNm0yJsE8Jj3RWcNd/IypQm7yUCB6+XpMUABaqpOYrThSqUurdhneKPHY8XP1545ei/0URD3nP+KEmXMmzgR+ZDeshoiRhpwunxhoiNYSI6GN1c4ebuFTCxxHrdxBbHrh2ptdk4cLgAv9ev68thw/HZEKsMvjBAtuf8lgGszpQXbICfWB/rSepl1aBxc8KHSFc+3WY55eSHr02gYFOaHijMmZU5zj0ANsjuC8CCwZxE3FYs9c+psCXkorvWY7PRMnROg4/iZq1he0ZMo8W4B1cdut2p76kY6tsrh/eWbqxs+MnuLt1AM4vpllTREllRtz59SudetEdWH2sHqp60FaLHVPtz3ut85aJ/1n15slyVtgERyXWkI9/FDtaFR5Twb+jozY5haEX3LTDZzRMfH/pGw8ps4QeeLreniIw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(336012)(86362001)(186003)(70586007)(8936002)(83380400001)(54906003)(8676002)(70206006)(7696005)(36860700001)(55016002)(52536014)(4326008)(33656002)(316002)(6506007)(356005)(47076005)(53546011)(5660300002)(81166007)(9686003)(2906002)(6862004)(82310400003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:29:09.6855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d918df-5af5-4493-c17a-08d97f13da94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4766

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDIxxOo51MIyNMjVIDg6MjYN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZzsN
Cj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgamJldWxpY2hA
c3VzZS5jb207DQo+IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb207IHJvZ2VyLnBhdUBjaXRyaXgu
Y29tOyB3bEB4ZW4ub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDgvMzddIHhlbi94ODY6IGFk
ZCBkZXRlY3Rpb24gb2YgZGlzY29udGlub3VzIG5vZGUNCj4gbWVtb3J5IHJhbmdlDQo+IA0KPiBD
QydpbmcgeDg2IG1haW50YWluZXJzDQo+IA0KPiBPbiBUaHUsIDIzIFNlcCAyMDIxLCBXZWkgQ2hl
biB3cm90ZToNCj4gPiBPbmUgTlVNQSBub2RlIG1heSBjb250YWluIHNldmVyYWwgbWVtb3J5IGJs
b2Nrcy4gSW4gY3VycmVudCBYZW4NCj4gPiBjb2RlLCBYZW4gd2lsbCBtYWludGFpbiBhIG5vZGUg
bWVtb3J5IHJhbmdlIGZvciBlYWNoIG5vZGUgdG8gY292ZXINCj4gPiBhbGwgaXRzIG1lbW9yeSBi
bG9ja3MuIEJ1dCBoZXJlIGNvbWVzIHRoZSBwcm9ibGVtLCBpbiB0aGUgZ2FwIG9mDQo+ID4gb25l
IG5vZGUncyB0d28gbWVtb3J5IGJsb2NrcywgaWYgdGhlcmUgYXJlIHNvbWUgbWVtb3J5IGJsb2Nr
cyBkb24ndA0KPiA+IGJlbG9uZyB0byB0aGlzIG5vZGUgKHJlbW90ZSBtZW1vcnkgYmxvY2tzKS4g
VGhpcyBub2RlJ3MgbWVtb3J5IHJhbmdlDQo+ID4gd2lsbCBiZSBleHBhbmRlZCB0byBjb3ZlciB0
aGVzZSByZW1vdGUgbWVtb3J5IGJsb2Nrcy4NCj4gPg0KPiA+IE9uZSBub2RlJ3MgbWVtb3J5IHJh
bmdlIGNvbnRhaW5zIG90aGUgbm9kZXMnIG1lbW9yeSwgdGhpcyBpcyBvYnZpb3VzbHkNCj4gPiBu
b3QgdmVyeSByZWFzb25hYmxlLiBUaGlzIG1lYW5zIGN1cnJlbnQgTlVNQSBjb2RlIG9ubHkgY2Fu
IHN1cHBvcnQNCj4gPiBub2RlIGhhcyBjb250aW5vdXMgbWVtb3J5IGJsb2Nrcy4gSG93ZXZlciwg
b24gYSBwaHlzaWNhbCBtYWNoaW5lLCB0aGUNCj4gPiBhZGRyZXNzZXMgb2YgbXVsdGlwbGUgbm9k
ZXMgY2FuIGJlIGludGVybGVhdmVkLg0KPiA+DQo+ID4gU28gaW4gdGhpcyBwYXRjaCwgd2UgYWRk
IGNvZGUgdG8gZGV0ZWN0IGRpc2NvbnRpbm91cyBtZW1vcnkgYmxvY2tzDQo+ID4gZm9yIG9uZSBu
b2RlLiBOVU1BIGluaXRpYWxpenRpb24gd2lsbCBiZSBmYWlsZWQgYW5kIGVycm9yIG1lc3NhZ2Vz
DQo+ID4gd2lsbCBiZSBwcmludGVkIHdoZW4gWGVuIGRldGVjdCBzdWNoIGhhcmR3YXJlIGNvbmZp
Z3VyYXRpb24uDQo+IA0KPiBBdCBsZWFzdCBvbiBBUk0sIGl0IGlzIG5vdCBqdXN0IG1lbW9yeSB0
aGF0IGNhbiBiZSBpbnRlcmxlYXZlZCwgYnV0IGFsc28NCj4gTU1JTyByZWdpb25zLiBGb3IgaW5z
dGFuY2U6DQo+IA0KPiBub2RlMCBiYW5rMCAwLTB4MTAwMDAwMA0KPiBNTUlPIDB4MTAwMDAwMC0w
eDEwMDIwMDANCj4gSG9sZSAweDEwMDIwMDAtMHgyMDAwMDAwDQo+IG5vZGUwIGJhbmsxIDB4MjAw
MDAwMC0weDMwMDAwMDANCj4gDQo+IFNvIEkgYW0gbm90IGZhbWlsaWFyIHdpdGggdGhlIFNSQVQg
Zm9ybWF0LCBidXQgSSB0aGluayBvbiBBUk0gdGhlIGNoZWNrDQo+IHdvdWxkIGxvb2sgZGlmZmVy
ZW50OiB3ZSB3b3VsZCBqdXN0IGxvb2sgZm9yIG11bHRpcGxlIG1lbW9yeSByYW5nZXMNCj4gdW5k
ZXIgYSBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiIG5vZGUgb2YgYSBOVU1BIG5vZGUgaW4gZGV2aWNl
IHRyZWUuDQo+IA0KPiANCg0KU2hvdWxkIEkgbmVlZCB0byBpbmNsdWRlL3JlZmluZSBhYm92ZSBt
ZXNzYWdlIHRvIGNvbW1pdCBsb2c/DQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4g
PHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9zcmF0LmMgfCAz
NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
c3JhdC5jIGIveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+IGluZGV4IDdkMjBkN2YyMjIuLjJmMDhm
YTQ2NjAgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiBAQCAtMjcxLDYgKzI3MSwzNiBAQCBhY3BpX251bWFfcHJv
Y2Vzc29yX2FmZmluaXR5X2luaXQoY29uc3Qgc3RydWN0DQo+IGFjcGlfc3JhdF9jcHVfYWZmaW5p
dHkgKnBhKQ0KPiA+ICAJCSAgICAgICBweG0sIHBhLT5hcGljX2lkLCBub2RlKTsNCj4gPiAgfQ0K
PiA+DQo+ID4gKy8qDQo+ID4gKyAqIENoZWNrIHRvIHNlZSBpZiB0aGVyZSBhcmUgb3RoZXIgbm9k
ZXMgd2l0aGluIHRoaXMgbm9kZSdzIHJhbmdlLg0KPiA+ICsgKiBXZSBqdXN0IG5lZWQgdG8gY2hl
Y2sgZnVsbCBjb250YWlucyBzaXR1YXRpb24uIEJlY2F1c2Ugb3ZlcmxhcHMNCj4gPiArICogaGF2
ZSBiZWVuIGNoZWNrZWQgYmVmb3JlIGJ5IGNvbmZsaWN0aW5nX21lbWJsa3MuDQo+ID4gKyAqLw0K
PiA+ICtzdGF0aWMgYm9vbCBfX2luaXQgaXNfbm9kZV9tZW1vcnlfY29udGludW91cyhub2RlaWRf
dCBuaWQsDQo+ID4gKyAgICBwYWRkcl90IHN0YXJ0LCBwYWRkcl90IGVuZCkNCj4gPiArew0KPiA+
ICsJbm9kZWlkX3QgaTsNCj4gPiArDQo+ID4gKwlzdHJ1Y3Qgbm9kZSAqbmQgPSAmbm9kZXNbbmlk
XTsNCj4gPiArCWZvcl9lYWNoX25vZGVfbWFzayhpLCBtZW1vcnlfbm9kZXNfcGFyc2VkKQ0KPiA+
ICsJew0KPiA+ICsJCS8qIFNraXAgaXRzZWxmICovDQo+ID4gKwkJaWYgKGkgPT0gbmlkKQ0KPiA+
ICsJCQljb250aW51ZTsNCj4gPiArDQo+ID4gKwkJbmQgPSAmbm9kZXNbaV07DQo+ID4gKwkJaWYg
KHN0YXJ0IDwgbmQtPnN0YXJ0ICYmIG5kLT5lbmQgPCBlbmQpDQo+ID4gKwkJew0KPiA+ICsJCQlw
cmludGsoS0VSTl9FUlINCj4gPiArCQkJICAgICAgICJOT0RFICV1OiAoJSJQUklwYWRkciItJSJQ
UklwYWRkciIpIGludGVydHdpbmUNCj4gd2l0aCBOT0RFICV1ICglIlBSSXBhZGRyIi0lIlBSSXBh
ZGRyIilcbiIsDQo+ID4gKwkJCSAgICAgICBuaWQsIHN0YXJ0LCBlbmQsIGksIG5kLT5zdGFydCwg
bmQtPmVuZCk7DQo+ID4gKwkJCXJldHVybiBmYWxzZTsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4g
Kw0KPiA+ICsJcmV0dXJuIHRydWU7DQo+ID4gK30NCj4gPiArDQo+ID4gIC8qIENhbGxiYWNrIGZv
ciBwYXJzaW5nIG9mIHRoZSBQcm94aW1pdHkgRG9tYWluIDwtPiBNZW1vcnkgQXJlYQ0KPiBtYXBw
aW5ncyAqLw0KPiA+ICB2b2lkIF9faW5pdA0KPiA+ICBhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5
X2luaXQoY29uc3Qgc3RydWN0IGFjcGlfc3JhdF9tZW1fYWZmaW5pdHkgKm1hKQ0KPiA+IEBAIC0z
NDQsNiArMzc0LDEyIEBAIGFjcGlfbnVtYV9tZW1vcnlfYWZmaW5pdHlfaW5pdChjb25zdCBzdHJ1
Y3QNCj4gYWNwaV9zcmF0X21lbV9hZmZpbml0eSAqbWEpDQo+ID4gIAkJCQluZC0+c3RhcnQgPSBz
dGFydDsNCj4gPiAgCQkJaWYgKG5kLT5lbmQgPCBlbmQpDQo+ID4gIAkJCQluZC0+ZW5kID0gZW5k
Ow0KPiA+ICsNCj4gPiArCQkJLyogQ2hlY2sgd2hldGhlciB0aGlzIHJhbmdlIGNvbnRhaW5zIG1l
bW9yeSBmb3Igb3RoZXINCj4gbm9kZXMgKi8NCj4gPiArCQkJaWYgKCFpc19ub2RlX21lbW9yeV9j
b250aW51b3VzKG5vZGUsIG5kLT5zdGFydCwgbmQtPmVuZCkpDQo+IHsNCj4gPiArCQkJCWJhZF9z
cmF0KCk7DQo+ID4gKwkJCQlyZXR1cm47DQo+ID4gKwkJCX0NCj4gPiAgCQl9DQo+ID4gIAl9DQo+
ID4gIAlwcmludGsoS0VSTl9JTkZPICJTUkFUOiBOb2RlICV1IFBYTSAldSAlIlBSSXBhZGRyIi0l
IlBSSXBhZGRyIiVzXG4iLA0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4NCg==

