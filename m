Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224C634DD0
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 03:25:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447363.703490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxfR7-0004fo-3h; Wed, 23 Nov 2022 02:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447363.703490; Wed, 23 Nov 2022 02:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxfR6-0004d8-Ut; Wed, 23 Nov 2022 02:24:28 +0000
Received: by outflank-mailman (input) for mailman id 447363;
 Wed, 23 Nov 2022 02:24:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYU+=3X=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxfR4-0004d2-RQ
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 02:24:27 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f165baa7-6ad5-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 03:24:23 +0100 (CET)
Received: from FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::16)
 by PAWPR08MB10089.eurprd08.prod.outlook.com (2603:10a6:102:365::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 02:24:21 +0000
Received: from VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::6c) by FR0P281CA0149.outlook.office365.com
 (2603:10a6:d10:96::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Wed, 23 Nov 2022 02:24:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT049.mail.protection.outlook.com (100.127.144.168) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 02:24:20 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Wed, 23 Nov 2022 02:24:19 +0000
Received: from 922f73f4658e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 39CB0E02-1254-48E0-85E7-F23B123741E1.1; 
 Wed, 23 Nov 2022 02:24:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 922f73f4658e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Nov 2022 02:24:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5776.eurprd08.prod.outlook.com (2603:10a6:800:1ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 02:24:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5857.017; Wed, 23 Nov 2022
 02:24:06 +0000
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
X-Inumbo-ID: f165baa7-6ad5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS6MrGISxmUoUC8YMa7jOn+bYFflz9JjmR9/AWtQ6FI=;
 b=GEOXSCVrmhe1fgvxtoauUltvahUjRIJpaGLHhF/jL6nd4Mfb/mf/jLrZZkAJcF6PIHduofSRjCQAf54gvQLJF9rkKnl9qLedn7miooYiOWrWYTb3NyRkryo3DiHp3s6DKLn3iQMKHAn4jLInO30qf4ugE538xq0awCj+4T21BUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMetFAqFg443VIVPTkOumcbsW33mkov9+RjY9y7q4Lprw0wJVpQmW4aQnXi+sQ7rjDejuvxT6jLVGi0eZutQf6M2v8LHi6QnDhoFtcRNFu9bJOw6b9fg9vrUG4NM705GloKMZQAoffBbMJ5s2tJoZ9d9BQni367aYyMKSiYTaKf2AN8NSs2Hzlnfga73id8Du6nwmc+B8BTHCxZlUiXUDELhLsKecmXn+25ZDQn1vHEmbp4K4BuBBS2R1+VFpPRYcdyjSGAjRIgLMb03NISv9MyeSDzoltuRQrKvsQGUM3HM3BwsoAYZ2AZPmXfCpbK8YLFABPGCDwrN58wcv1d5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS6MrGISxmUoUC8YMa7jOn+bYFflz9JjmR9/AWtQ6FI=;
 b=b2qb08pxd3Z+pgUdA18xe7TbGKp5MI8cQEoxOovuiKrPhH0ZCNZXS1MXduM7AEtymWAPCPjiEwmPs19+CyDNte2IQ1Ku6arw1I/V4B/7turc6QJe1JSx9vmDNb3m8vPnz3Agsulj2JvyGem4E/QDnEsUujXMcAO0wJCPoKBLFizBXeGt+GA/Xe3nugHyre0SsSdkUt8+2Z6RTc4NV4zdLc0/SEnmuhHiRzbOqkTlgIQAzLXw4c2k33G34yiM+6zP69LTPNlqnKYzhtoVzUK8sBnmklL5xWxsvq92oliSqH/h6BISNRhuPpnDySyOSM0WYfKVIn9+X4hbJf0UR2viTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JS6MrGISxmUoUC8YMa7jOn+bYFflz9JjmR9/AWtQ6FI=;
 b=GEOXSCVrmhe1fgvxtoauUltvahUjRIJpaGLHhF/jL6nd4Mfb/mf/jLrZZkAJcF6PIHduofSRjCQAf54gvQLJF9rkKnl9qLedn7miooYiOWrWYTb3NyRkryo3DiHp3s6DKLn3iQMKHAn4jLInO30qf4ugE538xq0awCj+4T21BUY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] docs/misc/arm: Update references to Linux kernel docs
Thread-Topic: [PATCH] docs/misc/arm: Update references to Linux kernel docs
Thread-Index: AQHY+0ODg1IOoey0002gCa5gqsUK/65Ep76AgAbDVQCAAGOFMA==
Date: Wed, 23 Nov 2022 02:24:06 +0000
Message-ID:
 <AS8PR08MB799172B5DE78D833879BF925920C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221118114554.20696-1-michal.orzel@amd.com>
 <31E1FFCF-F675-47D9-BCDB-5884F7360567@arm.com>
 <e04066c4-626c-8c7b-a9f9-8211869994eb@xen.org>
In-Reply-To: <e04066c4-626c-8c7b-a9f9-8211869994eb@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 593AD10C17C2BD42BC7B4AC57012CBBB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5776:EE_|VI1EUR03FT049:EE_|PAWPR08MB10089:EE_
X-MS-Office365-Filtering-Correlation-Id: cec2bfa7-b3a2-467a-6cc9-08daccf9d414
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0XZRtXJ4VE5TpTLnriqe83NBEVBZyONd7vi8YeM6J9kS+NyDw/Z+M2cNIo0opCf9iWDVkJV7PPGeDsX6iScDWEGZhXgkxMti+hf545mEYMErYZfQLLym6xmERMXhu7OXWUAMbSne4XFn2jUxuQ0Zx1ASxGP0C8BQZOZFjFOrep3jHBNrEvwn0vNFuaTK7LZE2CIa1Zq50xzAaNz4ipIifePV5MGY1AeMoEEzY6Uu2FZ14yc9Q/qSIdIMytf3UXeSJFwRPPoA+GOmmEa2oPV6td9PRY/5ISmvQC+zWE2GIAiTY+XbRbqefsTAXv44BxEAWZJNUDVbU7LFYHDTPe1rj7E0k0cq+Mi9ob9/oXr+EkakxrVi2E+xgFiovhuA4QWKK6S2xihzMwaFXgieKryDw5YnpvsrKRFtMSTyZhxlhgQj/NLVqCqPy0pdniSrawzdPW9Zd7et+GxDuwfgE5BqTc0h0NajlbD1kN8nwoU9R2UJrgKReElvymmDTGK+1uQpZxIO3r3pANhANfzLKpdJsm5D1DKhnvAQfgnS7HlcXSIS8gjL9M4zchmispuN1fexMSo4rx6o8QHF+zn5vOeQG0/nS5qO/W5Iy/oCHpQBEDaLM/ozrvNF0nbrlsoEZNrpwOe6MsJQIZJnqzoD6855jcgjaclNj7ooS7cP+6DXdPcX7IEicNjUEwAzikmu1R3hl1rOCZTTovqMRj47y5b2dw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199015)(41300700001)(76116006)(52536014)(8936002)(54906003)(316002)(15650500001)(64756008)(66446008)(66946007)(5660300002)(66476007)(8676002)(66556008)(4326008)(86362001)(55016003)(6506007)(71200400001)(478600001)(83380400001)(38070700005)(26005)(110136005)(2906002)(7696005)(186003)(4744005)(9686003)(122000001)(38100700002)(53546011)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5776
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4fe9e270-610f-46ee-1c0e-08daccf9cbe0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k2fAJznZBQTlUlNd0uPoHnSj7y9CAacvOAVjK53kAQ48Q/efn9cUjTaqakPSkMLrqnjIrKIHKCxPgfcCCjITLx1BItVuJKLlduq3YsNboTwNu6z8CIalXLZ7MWXpud3f3djRs4F6fulckmn1ntcyGl8/4MAiSLQpvHBq5wtsnrsbLLHX0qRraoEl0bsD+gn25oj1+bD6V9d3tvFnKN1gArg6WQCwm74h2VCck/uanjr57ZV56i563Lh8PaKc6Vsr4ogVG7aoaok4cKFyX18k9USUDahuR2E0vpv04Vr4pPty9sZIpLCKuR20XQP/3XCtqMhI2YfXR6Y04FG/rQVH/yB3YI4A/wQO7CFVwQVqfuoMS83MUjVTXDuxxFWFX1JGI1R9zd2PgoY9HsJr3ZqJ2ToMsmTsR4CE/cvJRk+kmkjrmGJmZB2rxUP2PitwhN7xjgMWLyV9XSIKbdyeZRd7RhGZMf+y7KFPaIXIfnzV6AjG0OCxDuvTr4szaQB53cLz9UlACTGUtF0lJkx/RIaQ2WR62b1/CN92ljxxHhlLbPYDk5wG7mjg++Wp/OlPK87K/XrpAwPq4+UJCnqXWrGmSx5XAHtH281X+oKg3wWRuRlV8uk/1QiyRY1XaYi14v1yU+/781FnDGEj9X2uOLMqY/YjnBvNvWlATUXIokEGTTj/iU2rnZrt7tHsJxUmSwMhIny6LjtU3ZYp/viIW20MlQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(83380400001)(86362001)(8676002)(41300700001)(81166007)(8936002)(4744005)(356005)(4326008)(15650500001)(2906002)(40460700003)(70206006)(5660300002)(82310400005)(40480700001)(316002)(52536014)(26005)(7696005)(107886003)(55016003)(9686003)(6506007)(53546011)(47076005)(336012)(110136005)(70586007)(478600001)(54906003)(186003)(82740400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 02:24:20.2284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cec2bfa7-b3a2-467a-6cc9-08daccf9d414
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10089

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRvY3MvbWlz
Yy9hcm06IFVwZGF0ZSByZWZlcmVuY2VzIHRvIExpbnV4IGtlcm5lbCBkb2NzDQo+IA0KPiAoKyBI
ZW5yeSkNCg0KVGhhbmtzLg0KDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDE4LzExLzIwMjIgMTM6MTAs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+ID4gSGkgTWljaGFsLA0KPiA+DQo+ID4+IE9uIDE4
IE5vdiAyMDIyLCBhdCAxMTo0NSwgTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4g
d3JvdGU6DQo+ID4+DQo+ID4+IFNvbWUgdGltZSBhZ28sIExpbnV4IHN3aXRjaGVkIHRoZSBmb3Jt
YXQgb2YgZG9jcyB0byBSZVNUIGFuZCB0aGUgZm9ybWF0DQo+ID4+IG9mIGRldmljZS10cmVlIGJp
bmRpbmdzIHRvIGpzb24tc2NoZW1hLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwg
T3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCZXJ0cmFuZCBN
YXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+IA0KPiBUaGlzIGNvdWxkIHBvdGVu
dGlhbGx5IGJlIGEgY2FuZGlkYXRlIGZvciA0LjE3IGFzIHRoaXMgaXMgY29ycmVjdGluZyB0aGUN
Cj4gbGlua3MgaW4gdGhlIGRvY3MuIFNvIHJpc2sgZnJlZS4NCg0KQWdyZWVkLg0KDQo+IA0KPiBJ
ZiB3ZSBoYXZlIG5vIG5ldyBidWcgZml4ZWQgcXVldWVkIGZvciA0LjE3LCB0aGVuIEkgY291bGQg
YWRkIHRoZSBwYXRjaA0KPiBhZnRlciBicmFuY2hpbmcuDQoNClNvdW5kcyBnb29kIHRvIG1lLCBp
ZiB5b3Ugd2FudCB0byBkbyB0aGF0Og0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxI
ZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

