Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78740CA7D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 18:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187816.336809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQXwW-0007jQ-MJ; Wed, 15 Sep 2021 16:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187816.336809; Wed, 15 Sep 2021 16:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQXwW-0007h7-Ii; Wed, 15 Sep 2021 16:39:28 +0000
Received: by outflank-mailman (input) for mailman id 187816;
 Wed, 15 Sep 2021 16:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LStB=OF=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQXwV-0007gw-HX
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 16:39:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ff7f0ab-942f-4f5f-a451-31279a3a3a92;
 Wed, 15 Sep 2021 16:39:24 +0000 (UTC)
Received: from AM6PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:92::24)
 by AM6PR08MB4660.eurprd08.prod.outlook.com (2603:10a6:20b:c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 16:39:12 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::66) by AM6PR04CA0011.outlook.office365.com
 (2603:10a6:20b:92::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Wed, 15 Sep 2021 16:39:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 16:39:12 +0000
Received: ("Tessian outbound 71ebfb754289:v103");
 Wed, 15 Sep 2021 16:39:10 +0000
Received: from 6f41d67f0089.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93C8AB4B-236B-4568-9699-418FA6FC4820.1; 
 Wed, 15 Sep 2021 16:38:57 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f41d67f0089.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Sep 2021 16:38:57 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB5894.eurprd08.prod.outlook.com (2603:10a6:20b:23d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 15 Sep
 2021 16:38:46 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 16:38:46 +0000
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
X-Inumbo-ID: 1ff7f0ab-942f-4f5f-a451-31279a3a3a92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXA62+xMX11sxy88lI6BLc2NogFQu9Gt+R69UZkk75M=;
 b=6Xf1KV5c4HcBPTy9gQi4Kq8BLRA4e5zWLvxHcorCvrMW0YLSU3r9HsMinHTzC2TccrHMOeQXQJctF09TbbPWx53Q5RfRO/yJGN/sJsz+YiVnXdZxacw7r66Na4Ar3VzQ3IO7imU5n2LwDD8BeO+hIK00Fwe+2QtkBIN0CgAzcO8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 202d5656dff7d719
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VK1nn+Nd3PfZoTvsbno56pPfOrTKQWBG2Ce1/JR78fiF2uvBrawCX8ZOnNuJOiIwczcAK0SSBpMr7SMLw3Ju5KA+LFYGISAjJV5l7/JvzJIq5Q25BQGTWrn6HH/zSZk9B2ly72yo83bs9oiAfugWh8qgof+jCtrPg/ihHXaNL2KfRhanc9fVw4VrncW/sILQxxxvTWMLrD9ZdIcpCzmP1/HjxBS1W0yrPAWfclU1LSsdAtvM/MBluEe3BbRdJr/c8PWPPXCW65v0am6+B+66DTmM0wAjI6yEQM+yOFL4+a5q1E/ExW2SkmAMFTWepcrUkTARWP21TVPGWliukUIEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LXA62+xMX11sxy88lI6BLc2NogFQu9Gt+R69UZkk75M=;
 b=RsqB1tMsIyPD58DrIDVXVEPDcMQJ1JlfGHyDn0skhaQuu9lEXkVcyKmFOGDhiltfC8uQtx13LpK7bfGZNn7wKhUnxuEWf/1oK4cAkEpxZumQikCBh0p1UMv7pYplALCDdEErjg0vV586MTjmEz6AY2ZC3sNsTRabprCE1+r6WqVZ1mcfIVq5DGsg4pYhEWGwtiOVP3LhqBa7skI4Ym/iQaloZgddf7Nkt2Oef82WO5nQHkOar0mzE1PY+IzhDQwnbGwb/1/4patHzwXqnt9/VlzBwTW7HUBNpYr/dv1Byygl702WeKTU+4MIrMUz/8ZdOzkyVi/6GJvpp5RrI+M51g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXA62+xMX11sxy88lI6BLc2NogFQu9Gt+R69UZkk75M=;
 b=6Xf1KV5c4HcBPTy9gQi4Kq8BLRA4e5zWLvxHcorCvrMW0YLSU3r9HsMinHTzC2TccrHMOeQXQJctF09TbbPWx53Q5RfRO/yJGN/sJsz+YiVnXdZxacw7r66Na4Ar3VzQ3IO7imU5n2LwDD8BeO+hIK00Fwe+2QtkBIN0CgAzcO8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 06/14] xen/arm: Add support for PCI ecam operations
Thread-Topic: [PATCH v1 06/14] xen/arm: Add support for PCI ecam operations
Thread-Index: AQHXlPK6hMBa2cV9wU+RB+r01dTauquceRAAgAcQPwCAAMcsAIABJesA
Date: Wed, 15 Sep 2021 16:38:45 +0000
Message-ID: <8B84E0D6-70A7-4C8F-ACBE-D1773F6C8FAD@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <1dc8286db35ced8281587135cfa582ea44b0185f.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091607070.10523@sstabellini-ThinkPad-T480s>
 <B0EBC722-A74A-4742-9D93-904398FDDF1B@arm.com>
 <alpine.DEB.2.21.2109141543090.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109141543090.21985@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ca40c206-e276-4b30-6b19-08d978675936
x-ms-traffictypediagnostic: AS8PR08MB5894:|AM6PR08MB4660:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB46608D5C12F9F53547B675EEFCDB9@AM6PR08MB4660.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NJ24YsY2VSMvTVT9a4ig3Map/lkvxGHx2w7s2ekiYGXP2Y9kMo77J02X1+FhBxqOZk+M4hchQOB92OFPy6XN5hoGDnmRAyB6qqmuzuQcDTBbDDrDGLYbLCZHyQsSafCymrZ5Io6tvvdbCHrk1T2CaHDchqjRLpwdon3dm5gOyw/Zus8Mo9sfm1RPk2ITaQt3u5FumNSO7En0BUBNXZnBxJEyV4Dh1yUVyZItaTlNmNjgKnfMG6cg/cvxSeW530Uc17JkWEXIRQIGiNIVpNrSNLPXIl713II/4XkN1/up7YzzOXrUWG1waSoeDJkY6T4l3e47o+mHKJbqpkHjE+4kicTAEXEx2e7SpVfY3mp9qFNX5lZNU/jkUzAq7Her/ZxmHOAsPn6g/Rku2y2vgPjOPmPKJV2s+E6caBjEuD9vsSre54utb01zPtPGjoZ7ogoG/ovl5/FiYwm+coMAy9u9Zvv9zOedcFKbP0WpEos1/bvobvZ1vvldvbhnbKh77GDw7Vb3EDvkVWBIyCjZmwh+tinfMr2e1PE4vPE+fPxpMAnsjPPr5a9eVMKiDJTY3x1pASsAyMrl4U9ILz7p74hbC2svBFEguyQmgbj3w8lTBGlBQqrzAjG/QViz117FQNJXhLwugGjIGetBk4AbuHbxWEGaxdRr9W4Mxfb6B8SEHiMKhAFON1pRB0Y7evQHkIswFImSzxFG07vmd47p6TEdRMtLfwHQ/3x5JCVJ8cJaAl+n1cLMOmdRpCvyoPvM4mk0tkwlNIo0bvlyGFiziSrzs8FvfHp1OANMZYX47JlAC3MWAp0svcesU32vshTXhYPkOJkj0/YhOhp3T4U2BaEa56Xq1R8Jkd93BaK/Wb1Ue1ciHbAorGNjEEAlbnrJ9W8r
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(5660300002)(8936002)(64756008)(966005)(91956017)(6506007)(66556008)(66946007)(316002)(2616005)(76116006)(66476007)(478600001)(36756003)(38070700005)(122000001)(6916009)(2906002)(26005)(38100700002)(71200400001)(8676002)(53546011)(54906003)(86362001)(33656002)(6512007)(186003)(6486002)(4326008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF22CEC672FBC44BA10AD4625CC917DF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5894
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01cafcc7-fa5a-4f50-7b03-08d9786749a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jb2wEJzyXUP7DbOWVw8ZUDPXe9S8GoUnclD/g6rxfnvXLpuWXKZJeGj76HYIGNlzJvxGE+F4RgI9kq+LJTSRLCI3K1RpfJV9QtwYR7JdCQvCuMlUUbKhAb/nMunGOcqNouDmu8z6uSbsO20Sojw65EJQHo4SKxLzl7TUzVyswbiVI0TUQkN9yUi3B8XaxYJXT39oJn1nzYd2clWN2/6MUW9LJjSuq7mTG+omlyiQ9Bnnsm9zdkhcEYH+l1UhnT2JXD5jFurrwB/6Z6OM6TF0enicTAG1zT26chVQvTmHkCNTC9a4HkSZCftvSrGXegus7XRX9TUeMbwOCvzY7ctI4g7zElk1vLU5L6AqRJXgo68rD12gzmVoUxB8f1C3uYc5laYn4Jhb08eqWwBnYnubAwE+aNWLg1A8/9Q8gF88s1cpG7KL7sTGVJmB2Tbg82lvuqAzcDoSKoleAX1vChgUuJgXU60nbAlAdvOKNtjLQ1wp7hyKZNNcBYlHyk1PtzAkUQHWMre3GnlS2KgZMW2fHcKhKq42TIjyBq0Y0J+e80f0jVhYLXh6hQV170zNOBM6D0xQLlDLQ1VrYjgQqdl0SmCm2sQ32QeVrJfhYZD/LQHyU+mTNfh66/yG7VtaOAkJeHqc+w9p/aLxduBWcqJ7u/RLx9BPvhFe878IfD0tc9gs7LPcGkPcoUmhaPwQjrMj4qU7Gs/VK6e8q/7hb8Sqx/ce+4h4fr4IQ9pLMt1Ju3KQy1MF0IdDPpIPIAJ5Ufxbk+3F4c2VJr8W3Xy6mI9p2hlHQ3Y4l35uwae80825pcOJvjgfuiYj4MD3wJ8cgiLyCpS5mtxzjc4E28qGuF2hRg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(36840700001)(356005)(81166007)(36756003)(2906002)(70206006)(8936002)(6862004)(966005)(8676002)(5660300002)(54906003)(4326008)(478600001)(33656002)(26005)(316002)(107886003)(53546011)(6506007)(36860700001)(70586007)(336012)(6486002)(82740400003)(47076005)(186003)(82310400003)(6512007)(86362001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 16:39:12.2559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca40c206-e276-4b30-6b19-08d978675936
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4660

SGkgU3RlZmFubywNCg0KPiBPbiAxNSBTZXAgMjAyMSwgYXQgMTI6MDYgYW0sIFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIDE0
IFNlcCAyMDIxLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4gKyAgICAgICAgcmV0dXJuIE5VTEw7
DQo+Pj4+ICsNCj4+Pj4gKyAgICBidXNuIC09IGNmZy0+YnVzbl9zdGFydDsNCj4+Pj4gKyAgICBi
YXNlID0gY2ZnLT53aW4gKyAoYnVzbiA8PCBjZmctPm9wcy0+YnVzX3NoaWZ0KTsNCj4+Pj4gKw0K
Pj4+PiArICAgIHJldHVybiBiYXNlICsgKFBDSV9ERVZGTihzYmRmX3QuZGV2LCBzYmRmX3QuZm4p
IDw8IGRldmZuX3NoaWZ0KSArIHdoZXJlOw0KPj4+PiArfQ0KPj4+IA0KPj4+IEkgdW5kZXJzdGFu
ZCB0aGF0IHRoZSBhcm0zMiBwYXJ0IGlzIG5vdCBpbXBsZW1lbnRlZCBhbmQgbm90IHBhcnQgb2Yg
dGhpcw0KPj4+IHNlcmllcywgdGhhdCdzIGZpbmUuIEhvd2V2ZXIgaWYgdGhlIHBsYW4gaXMgdGhh
dCBhcm0zMiB3aWxsIGR5bmFtaWNhbGx5DQo+Pj4gbWFwIGVhY2ggYnVzIGluZGl2aWR1YWxseSwg
dGhlbiBJIGltYWdpbmUgdGhpcyBmdW5jdGlvbiB3aWxsIGhhdmUgYW4NCj4+PiBpb3JlbWFwIGlu
IHRoZSBhcm0zMiB2ZXJzaW9uLiBXaGljaCBtZWFucyB0aGF0IHdlIGFsc28gbmVlZCBhbg0KPj4+
IHVubWFwX2J1cyBjYWxsIGluIHN0cnVjdCBwY2lfb3BzLiBJIHVuZGVyc3RhbmQgdGhhdCBwY2lf
ZWNhbV91bm1hcF9idXMNCj4+PiB3b3VsZCBiZSBhIE5PUCB0b2RheSBmb3IgYXJtNjQsIGJ1dCBJ
IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGhhdmUgaXQgaWYNCj4+PiB3ZSB3YW50IHRoZSBBUEkg
dG8gYmUgZ2VuZXJpYy4NCj4+IA0KPj4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcgd2UgZG9u4oCZ
dCBuZWVkIHBjaV9lY2FtX3VubWFwX2J1cyguLikgYXMgSSBkb27igJl0IHNlZSBhbnkgdXNlIGNh
c2UgdG8gdW5tYXAgdGhlIA0KPj4gYnVzIGR5bmFtaWNhbGx5LiBXZSBjYW4gYWRkIHRoZSBzdXBw
b3J0IGZvciBwZXJfYnVzX21hcHBpbmcgZm9yIEFSTTMyIG9uY2Ugd2UgaW1wbGVtZW50IGFybTMy
IHBhcnQuDQo+PiBMZXQgbWUga25vdyB5b3VyIHZpZXcgb24gdGhpcy4NCj4gDQo+IEluIHRoZSBw
YXRjaCB0aXRsZWQgInhlbi9hcm06IFBDSSBob3N0IGJyaWRnZSBkaXNjb3Zlcnkgd2l0aGluIFhF
TiBvbg0KPiBBUk0iIHRoZXJlIGlzIHRoZSBmb2xsb3dpbmcgaW4tY29kZSBjb21tZW50Og0KPiAN
Cj4gKiBPbiA2NC1iaXQgc3lzdGVtcywgd2UgZG8gYSBzaW5nbGUgaW9yZW1hcCBmb3IgdGhlIHdo
b2xlIGNvbmZpZyBzcGFjZQ0KPiAqIHNpbmNlIHdlIGhhdmUgZW5vdWdoIHZpcnR1YWwgYWRkcmVz
cyByYW5nZSBhdmFpbGFibGUuICBPbiAzMi1iaXQsIHdlDQo+ICogaW9yZW1hcCB0aGUgY29uZmln
IHNwYWNlIGZvciBlYWNoIGJ1cyBpbmRpdmlkdWFsbHkuDQo+ICoNCj4gKiBBcyBvZiBub3cgb25s
eSA2NC1iaXQgaXMgc3VwcG9ydGVkIDMyLWJpdCBpcyBub3Qgc3VwcG9ydGVkLg0KPiANCj4gDQo+
IFNvIEkgdGFrZSBpdCB0aGF0IG9uIGFybTMyIHdlIGRvbid0IGhhdmUgZW5vdWdoIHZpcnR1YWwg
YWRkcmVzcyByYW5nZQ0KPiBhdmFpbGFibGUsIHRoZXJlZm9yZSB3ZSBjYW5ub3QgaW9yZW1hcCB0
aGUgd2hvbGUgcmFuZ2UuIEluc3RlYWQsIHdlJ2xsDQo+IGhhdmUgdG8gaW9yZW1hcCB0aGUgY29u
ZmlnIHNwYWNlIG9mIGVhY2ggYnVzIGluZGl2aWR1YWxseS4NCg0KWWVzIHlvdSBhcmUgcmlnaHQg
bXkgdW5kZXJzdGFuZCBpcyBhbHNvIHNhbWUuDQo+IA0KPiBJIGFzc3VtZWQgdGhhdCB0aGUgaWRl
YSB3YXMgdG8gY2FsbCBpb3JlbWFwIGFuZCBpb3VubWFwIGR5bmFtaWNhbGx5LA0KPiBvdGhlcndp
c2UgdGhlIHRvdGFsIGFtb3VudCBvZiB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgcmVxdWlyZWQgd291
bGQgc3RpbGwNCj4gYmUgdGhlIHNhbWUuDQoNCkFzIHBlciBteSB1bmRlcnN0YW5kaW5nIGZvciAz
Mi1iaXQgd2UgbmVlZCBwZXJfYnVzIG1hcHBpbmcgYXMgd2UgZG9u4oCZdCBoYXZlIGVub3VnaCB2
aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgaW4gb25lIGNodW5rDQpidXQgd2UgY2FuIGhhdmUgdmlydHVh
bCBhZGRyZXNzIHNwYWNlIGluIGRpZmZlcmVudCBjaHVuay4NCg0KSSBhbSBub3Qgc3VyZSBpZiB3
ZSBuZWVkIHRvIG1hcC91bm1hcCB0aGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGZvciBlYWNoIHJl
YWQvd3JpdGUgY2FsbC4gDQpJIGp1c3QgY2hlY2tlZCB0aGUgTGludXggY29kZVsxXSAgYW5kIHRo
ZXJlIGFsc28gbWFwcGluZyBpcyBkb25lIG9uY2Ugbm90IGZvciBlYWNoIHJlYWQvd3JpdGUgY2Fs
bC4NCg0KWzFdICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL3BjaS9lY2FtLmM/aWQ9ZWE0YWFlMDU5
NzQzMzRlOTgzN2Q4NmZmMWNiNzE2YmFkMzZiM2NhOCNuNzYNCg0KPiBJIGFsc28gdGhvdWdodCB0
aGF0IHRoZSBkeW5hbWljIG1hcHBpbmcgZnVuY3Rpb24sIHRoZSBvbmUNCj4gd2hpY2ggd291bGQg
ZW5kIHVwIGNhbGxpbmcgaW9yZW1hcCBvbiBhcm0zMiwgd291bGQgYmUgcGNpX2VjYW1fbWFwX2J1
cy4NCj4gSWYgc28sIHRoZW4gd2UgYXJlIG1pc3NpbmcgdGhlIGNvcnJlc3BvbmRpbmcgdW5tYXBw
aW5nIGZ1bmN0aW9uLCB0aGUgb25lDQo+IHRoYXQgd291bGQgY2FsbCBpb3VubWFwIG9uIGFybTMy
IGFuZCBkbyBub3RoaW5nIG9uIGFybTY0LCBjYWxsZWQgYmVmb3JlDQo+IHJldHVybmluZyBmcm9t
IHBjaV9nZW5lcmljX2NvbmZpZ19yZWFkIGFuZCBwY2lfZ2VuZXJpY19jb25maWdfd3JpdGUuDQo+
IA0KPiBBcyBhbHdheXMsIEkgYW0gbm90IGFza2luZyBmb3IgdGhlIGFybTMyIGltcGxlbWVudGF0
aW9uLCBidXQgaWYgd2UgYXJlDQo+IGludHJvZHVjaW5nIGludGVybmFsIEFQSXMsIGl0IHdvdWxk
IGJlIGdvb2QgdGhhdCB0aGV5IGFyZSBjb25zaXN0ZW50Lg0KPiANCj4gDQo+IA0KPj4+PiBAQCAt
NTAsMTAgKzUxLDQxIEBAIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2Ugew0KPj4+PiAgICB1OCBidXNf
c3RhcnQ7ICAgICAgICAgICAgICAgICAgICAvKiBCdXMgc3RhcnQgb2YgdGhpcyBicmlkZ2UuICov
DQo+Pj4+ICAgIHU4IGJ1c19lbmQ7ICAgICAgICAgICAgICAgICAgICAgIC8qIEJ1cyBlbmQgb2Yg
dGhpcyBicmlkZ2UuICovDQo+Pj4+ICAgIHZvaWQgKnN5c2RhdGE7ICAgICAgICAgICAgICAgICAg
IC8qIFBvaW50ZXIgdG8gdGhlIGNvbmZpZyBzcGFjZSB3aW5kb3cqLw0KPj4+PiArICAgIGNvbnN0
IHN0cnVjdCBwY2lfb3BzICpvcHM7DQo+Pj4+IH07DQo+Pj4+IA0KPj4+PiArc3RydWN0IHBjaV9v
cHMgew0KPj4+PiArICAgIHZvaWQgX19pb21lbSAqKCptYXBfYnVzKShzdHJ1Y3QgcGNpX2hvc3Rf
YnJpZGdlICpicmlkZ2UsIHVpbnQzMl90IHNiZGYsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90IG9mZnNldCk7DQo+Pj4+ICsgICAgaW50ICgqcmVhZCkoc3RydWN0
IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlLCB1aW50MzJfdCBzYmRmLA0KPj4+PiArICAgICAgICAg
ICAgICAgIHVpbnQzMl90IHJlZywgdWludDMyX3QgbGVuLCB1aW50MzJfdCAqdmFsdWUpOw0KPj4+
PiArICAgIGludCAoKndyaXRlKShzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsIHVpbnQz
Ml90IHNiZGYsDQo+Pj4+ICsgICAgICAgICAgICAgICAgIHVpbnQzMl90IHJlZywgdWludDMyX3Qg
bGVuLCB1aW50MzJfdCB2YWx1ZSk7DQo+Pj4+ICt9Ow0KPj4+PiArDQo+Pj4+ICsvKg0KPj4+PiAr
ICogc3RydWN0IHRvIGhvbGQgcGNpIG9wcyBhbmQgYnVzIHNoaWZ0IG9mIHRoZSBjb25maWcgd2lu
ZG93DQo+Pj4+ICsgKiBmb3IgYSBQQ0kgY29udHJvbGxlci4NCj4+Pj4gKyAqLw0KPj4+PiArc3Ry
dWN0IHBjaV9lY2FtX29wcyB7DQo+Pj4+ICsgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAgYnVz
X3NoaWZ0Ow0KPj4+PiArICAgIHN0cnVjdCBwY2lfb3BzICAgICAgICAgIHBjaV9vcHM7DQo+Pj4+
ICsgICAgaW50ICgqaW5pdCkoc3RydWN0IHBjaV9jb25maWdfd2luZG93ICopOw0KPj4+IA0KPj4+
IElzIHRoaXMgbGFzdCBtZW1iZXIgb2YgdGhlIHN0cnVjdCBuZWVkZWQvdXNlZD8NCj4+IA0KPj4g
WWVzIEl0IHdpbGwgYmUgdXNlZCBieSBzb21lIHZlbmRvciBzcGVjaWZpYyBib2FyZCggTjFTRFAg
KS4gUGxlYXNlIGNoZWNrIGJlbG93Lg0KPj4gaHR0cHM6Ly9naXQubGluYXJvLm9yZy9sYW5kaW5n
LXRlYW1zL3dvcmtpbmcvYXJtL24xc2RwLXBjaWUtcXVpcmsuZ2l0L2NvbW1pdC8/aWQ9MDRiN2U3
NmQwZmU2NDgxYTgwM2Y1OGU1NGUwMDhhMTQ4OWQ3MTNhNQ0KPiANCj4gT0suIEkgZG9uJ3QgZG91
YnQgdGhhdCB0aGVyZSBtaWdodCBiZSBicmlkZ2Utc3BlY2lmaWMgaW5pdGlhbGl6YXRpb25zLA0K
PiBidXQgd2UgYWxyZWFkeSBoYXZlIHRoaW5ncyBsaWtlOg0KPiANCj4gRFRfREVWSUNFX1NUQVJU
KHBjaV9nZW4sICJQQ0kgSE9TVCBaWU5RTVAiLCBERVZJQ0VfUENJKQ0KPiAuZHRfbWF0Y2ggPSBn
ZW5fcGNpX2R0X21hdGNoLA0KPiAuaW5pdCA9IGdlbl9wY2lfZHRfaW5pdCwNCj4gRFRfREVWSUNF
X0VORA0KPiANCj4gVGhlIHF1ZXN0aW9uIGlzIGRvIHdlIGFjdHVhbGx5IG5lZWQgdHdvIGRpZmZl
cmVudCB2ZW5kb3Itc3BlY2lmaWMgaW5pdA0KPiBmdW5jdGlvbnM/IE9uZSBpcyBkcml2ZW4gYnkg
ZGV2aWNlIHRyZWUsIGUuZy4gWnlucU1QIGlzIGNhbGxpbmcNCj4gZ2VuX3BjaV9kdF9pbml0LiBU
aGUgb3RoZXIgb25lIGlzIHBjaV9lY2FtX29wcy0+aW5pdCwgd2hpY2ggaXMgY2FsbGVkDQo+IGZy
b20gdGhlIGZvbGxvd2luZyBjaGFpbjoNCj4gDQo+IERUX0RFVklDRV9TVEFSVCAtPiBnZW5fcGNp
X2R0X2luaXQgLT4gcGNpX2hvc3RfY29tbW9uX3Byb2JlIC0+DQo+IGdlbl9wY2lfaW5pdCAtPiBw
Y2lfZ2VuZXJpY19lY2FtX29wcy5pbml0DQo+IA0KPiBXaGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiBnZW5fcGNpX2R0X2luaXQgYW5kIHBjaV9lY2FtX29wcy5pbml0IGluDQo+IHRlcm1zIG9m
IHB1cnBvc2U/DQoNClllcyBJIGFsc28gYWdyZWUgd2l0aCB5b3Ugd2UgZG9u4oCZdCBuZWVkIHR3
byBpbml0IGZ1bmN0aW9uLiBJIHdpbGwgbW9kaWZ5IHRoZSBjb2RlIGxpa2UgYmVsb3cuDQpEVF9E
RVZJQ0VfU1RBUlQgLT5wY2lfaG9zdF9jb21tb25fcHJvYmUgLT4gZ2VuX3BjaV9pbml0IC0+IHBj
aV9nZW5lcmljX2VjYW1fb3BzLmluaXQNCg0KUmVnYXJkcywNClJhaHVsDQo+IA0KPiBJIGFtIGhh
cHB5IHRvIGhhdmUgcGNpX2VjYW1fb3BzLmluaXQgaWYgaXQgc2VydmVzIGEgZGlmZmVyZW50IHB1
cnBvc2UNCj4gZnJvbSBEVF9ERVZJQ0VfU1RBUlQuaW5pdC4gSW4gdGhhdCBjYXNlIHdlIG1pZ2h0
IHdhbnQgdG8gYWRkIGFuIGluLWNvZGUNCj4gY29tbWVudCBzbyB0aGF0IGFuIGVuZ2luZWVyIHdv
dWxkIGtub3cgd2hlcmUgdG8gYWRkIHZlbmRvci1zcGVjaWZpYyBjb2RlDQo+ICh3aGV0aGVyIHRv
IERUX0RFVklDRV9TVEFSVC5pbml0IG9yIHRvIHBjaV9lY2FtX29wcy5pbml0KS4NCg0K

