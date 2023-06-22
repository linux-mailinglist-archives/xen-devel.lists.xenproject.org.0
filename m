Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718DB739E1A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 12:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553481.864064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCHJL-0002uc-79; Thu, 22 Jun 2023 10:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553481.864064; Thu, 22 Jun 2023 10:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCHJL-0002rn-43; Thu, 22 Jun 2023 10:13:07 +0000
Received: by outflank-mailman (input) for mailman id 553481;
 Thu, 22 Jun 2023 10:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nFZZ=CK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qCHJK-0002RG-I8
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 10:13:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6035c11b-10e5-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 12:13:04 +0200 (CEST)
Received: from AM6PR0502CA0064.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::41) by DU0PR08MB10366.eurprd08.prod.outlook.com
 (2603:10a6:10:40a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 10:13:01 +0000
Received: from AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::b1) by AM6PR0502CA0064.outlook.office365.com
 (2603:10a6:20b:56::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 10:13:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT011.mail.protection.outlook.com (100.127.140.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 10:13:01 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Thu, 22 Jun 2023 10:13:00 +0000
Received: from a986587a85b2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2AA197A1-0E77-4B2C-BD86-4E5F85896CB1.1; 
 Thu, 22 Jun 2023 10:12:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a986587a85b2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 22 Jun 2023 10:12:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PR3PR08MB5769.eurprd08.prod.outlook.com (2603:10a6:102:91::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 10:12:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 10:12:47 +0000
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
X-Inumbo-ID: 6035c11b-10e5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLknlhEza6pSoQOsSZg5HZmuUJaYWE/0deBbNcnWdjI=;
 b=5A4ZV0B/X+BHCbrz6Du16vH8JuW226tdJ/CxufumyfLC9Ivggd+2yCIAroH2iQAXu0gg0UsJHfOiu2TiXTdwBRlUWrX37yP3r5df0RO/stoelshyNd6+PHxRVKarJI/UKiuLHEmTWRqg4o2kStrY7RuUPbC1+7Bp11gg6P9TDm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2775960c48166d7e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKZBL0LK9r5nIqpsxnb5MW+wAzlTEir2/zLv1XKF/0SDqy+WUI0RlyATUniE4H7fPV4kCuY9X7hj6kcE4s+3C5gJXxWbTVvLSkJ+dmvl/vXonoTQlp34aGiP+J5P+uCz75McCU14EOiPblHChyisn+AKxKZCqke9GXocHo+r/rwchog7dH+Xa3m6X1+UOsKbizqM1/AgDLet5eTIWuasr2+vdWRrSuAXISC4MdFdz9gnMoOaYqo7gce+b+vBfFHtGbU9nDTTc3G525xO3QiR//ZFdd38YTU6p8LDwPJ5Yf3yqcEE+LjP/smcpcpDSwDtIJs6rp0Uy2LhwtwvnYsSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLknlhEza6pSoQOsSZg5HZmuUJaYWE/0deBbNcnWdjI=;
 b=alRhNhDUX2nUwUy4LQhRin+5EseyLqrrWMA44MOrwaF1cLJ+IfO6UeDZcKvSWlJZHj9R+lwPUz1o/ZKhDwEiZ4ZNq7RA2vxJMxSsvprsM4xWUuTkh0bbbI8SOIAuNro28YhO/TAKmnEJTr0DDwdcqs6AcvTeFxHkqVLRDldigDWNUy7gAdjpwfgUH11bJYKW/XI+CsEK5XJjmkFUfuRqR+OyYqkehK2bekPUgWcSBZ/CPA0abhe/YyWQCoumrtqqVkVqLZFvLGFHrWtEsSyUCBf2FpalTszp5CmR+rj8ovBQqs/zBIKBYNS9QpcseFqhZo5haXPhf6hDZMrKu2AUQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLknlhEza6pSoQOsSZg5HZmuUJaYWE/0deBbNcnWdjI=;
 b=5A4ZV0B/X+BHCbrz6Du16vH8JuW226tdJ/CxufumyfLC9Ivggd+2yCIAroH2iQAXu0gg0UsJHfOiu2TiXTdwBRlUWrX37yP3r5df0RO/stoelshyNd6+PHxRVKarJI/UKiuLHEmTWRqg4o2kStrY7RuUPbC1+7Bp11gg6P9TDm4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Peter Hoyes <Peter.Hoyes@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH 2/2] xl: Add escape character argument to xl console
Thread-Topic: [PATCH 2/2] xl: Add escape character argument to xl console
Thread-Index: AQHZpPF4K+MH8OHsUk+nQoVxITkfyq+WmkCA
Date: Thu, 22 Jun 2023 10:12:47 +0000
Message-ID: <8D59C7B7-8A52-4C6C-B765-F01246A8124D@arm.com>
References: <20230614074144.3505250-1-peter.hoyes@arm.com>
 <20230614074144.3505250-2-peter.hoyes@arm.com>
In-Reply-To: <20230614074144.3505250-2-peter.hoyes@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PR3PR08MB5769:EE_|AM7EUR03FT011:EE_|DU0PR08MB10366:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dfc2ae-8af9-444a-e5f6-08db7309427e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uHl8N0GvY8tGxL1R3LKesEjWSHwmecRO75rZxcXTwsyNjxwT0/dKflB8L1emEz2UI9+6tTVmdL3DXIozPIIesoSfNHaAuz6qSRZJwsSLvtVTw53p67WFQK45wAUYpTAkkg+UsJ3I40T6Kv+fcldFnW7i1VRYVTJ5EglVm6MEGct5LXfTfj6I4qorakK+kFY3JnkRZaIxlnTaktHGNLT1CMhx/cRIjMeQ+94N67LBQwKYwhrKLUjUkz7X+GZcfxD1u4OP2RRxXwIXmrUSiL4ztxCWnVISOZxcKogiLxQwRFTjIZYQKnkPK+7+Q+tbHsYL1q5iGnZuXE3QGgx0rV85ZThA0jUMkXJ5WQlFduAruR+nhzfEkWI5egYvO36tXXd9q/eX8uhwizGzAB+8/Gt+ZNY3q7E5gK0uvldH1ludSENM4UvdoVMnUdajkL8ScmblFe/8+/iv1rxKHVK5qN8yhBtHGgW5Z71ejh6afeYNF7mh6nE0FBWsmX19VFwg2/nLPxHiW2UwmtKgPgYpZ6RxC6YUQUVkxHYz0r1auNwWGYQ3bp/zxSEr9UhoJj2jLadYbnspLdwEZXbZv51kRcZkwtbvbGl/huusMPUzFMOVoSUGqBD5LjPbwNcXl3vV0viWOoz2XrhIRPY43A9Wf+lmkA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199021)(33656002)(6486002)(26005)(478600001)(71200400001)(54906003)(37006003)(83380400001)(2616005)(186003)(2906002)(53546011)(6506007)(66446008)(6512007)(6862004)(5660300002)(36756003)(66556008)(122000001)(76116006)(38100700002)(316002)(91956017)(6636002)(8936002)(66946007)(41300700001)(64756008)(4326008)(8676002)(66476007)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <07B6CD463198424D914DD8A7BC4C6E0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5769
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba2ae122-e70f-4bc2-065e-08db73093a86
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Vq1eE6lUHR8dpRTZ/6pMZ/SUKRN3i6YFTrnpmv+68neXKJ6uHb7HOwJtzeb4VIuvCsdLn8A4W87jlPsbVWaoYu3OlRKv0Sp0+RehC2rCJciIqcsqmp//n9xWvg/uq22XiMVRZMnE8xaJutENxSpAyF1ywPFnDj1m8xDKouqtQhvHpq76lo2YekXpQRG3iw9LQqoio8y3JM6bV+OKIEG7KUHVF7uc3XbKWJBqWvfnxqIUhfaTlW/NtnB87ZZkx9itauXbZQpwX6/FXyqk4mtfkUFpiESXbiXcmMALOe4fkXjST8iw7JJ9uRvc52MtagyA4Ygn06ISgnoIH1qCEa/EwhPv48cDQggWu8JezxDQZdyMqWgDEbtwQTTt6kF7W313FIy7rFga2bvxJVEceTOD/AJdDvlTHW04RahvHFncNgf5Fc+ABDXjzO3wTOG8u7pQRWGJMXLs+oKj0YOL36aa7FCIfWagcUEfYPvQNHO7SMzy7rDBI1cUGBgZRYy2f1d0FJFYINSQ51rYsDb+1TEShIEHXHWJWDqT4+81QGhe3Mk55owvyTfnWDqCNr8UjPf5izYXPk5c/8hVkVFW0ocVzXoa1M8ajBwUkpJpdnblmCf21iDQmK/YjyJ0cLu8BWYgjEgKyTQaohQnyiVEF69Zbns4Um9O5fP1M0cvRxwzPyykLoFmEkeHrVqOqb2jB+ufEasK+Obi2SRpQLYMI+PDGDGRNir+nllfNz2xTSn6gkK7GTRpd8Yaq5sD14ZwFlS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(8936002)(6862004)(2906002)(8676002)(5660300002)(54906003)(37006003)(40480700001)(316002)(41300700001)(4326008)(6636002)(40460700003)(70206006)(70586007)(336012)(36756003)(478600001)(33656002)(82740400003)(107886003)(186003)(82310400005)(356005)(2616005)(86362001)(81166007)(47076005)(83380400001)(26005)(6486002)(53546011)(6512007)(6506007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 10:13:01.0100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dfc2ae-8af9-444a-e5f6-08db7309427e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10366

DQoNCj4gT24gMTQgSnVuIDIwMjMsIGF0IDA4OjQxLCBQZXRlciBIb3llcyA8UGV0ZXIuSG95ZXNA
YXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBQZXRlciBIb3llcyA8UGV0ZXIuSG95ZXNAYXJt
LmNvbT4NCj4gDQo+IEFkZCAtZSBhcmd1bWVudCB0byB4bCBjb25zb2xlIGFuZCBwYXNzIHRvIG5l
dyBlc2NhcGVfY2hhcmFjdGVyIGFyZ3VtZW50DQo+IG9mIGxpYnhsX2NvbnNvbGVfZXhlYy4NCj4g
DQo+IEluIGxpYnhsX2NvbnNvbGVfZXhlYywgdGhlcmUgYXJlIGN1cnJlbnRseSB0d28gY2FsbCBz
aXRlcyB0byBleGVjbCwNCj4gd2hpY2ggdXNlcyB2YXJhcmdzLCBpbiBvcmRlciB0byBzdXBwb3J0
IG9wdGlvbmFsbHkgcGFzc2luZw0KPiAnc3RhcnQtbm90aWZ5LWZkJyB0byB0aGUgY29uc29sZSBj
bGllbnQuIEluIG9yZGVyIHRvIHN1cHBvcnQgcGFzc2luZw0KPiB0aGUgJ2VzY2FwZScgYXJndW1l
bnQgb3B0aW9uYWxseSB0b28sIHJlZmFjdG9yIHRvIGluc3RlYWQgaGF2ZSBhIHNpbmdsZQ0KPiBj
YWxsIHNpdGUgdG8gZXhlY3YsIHdoaWNoIGhhcyB0aGUgc2FtZSBiZWhhdmlvciBidXQgdGFrZXMg
YW4gYXJyYXkgb2YNCj4gYXJndW1lbnRzLg0KPiANCj4gSWYgLWUgaXMgbm90IHNwZWNpZmllZCwg
LS1lc2NhcGUgaXMgbm90IHBhc3NlZCB0byB0aGUgY29uc29sZSBjbGllbnQgYW5kDQo+IHRoZSBl
eGlzdGluZyB2YWx1ZSAoXl0pIGlzIHVzZWQgYXMgYSBkZWZhdWx0Lg0KPiANCj4gSXNzdWUtSWQ6
IFNDTS00OTU4DQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEhveWVzIDxQZXRlci5Ib3llc0Bhcm0u
Y29tPg0KPiBDaGFuZ2UtSWQ6IEk4MGZmYmI3ZmVjYzYzZTAyM2VjMWM3ZjFlNGFkNzk3OWNjZjhk
YTQ0DQoNCkhpIFBldGVyLA0KDQpIZXJlIGluIFhlbi1kZXZlbCB0aGUgcGF0Y2hlcyBzaG91bGQg
bm90IGhhdmUgSXNzdWUtSWQgYW5kIENoYW5nZS1JZCwNCnRoZXkgY2FuIGJlIHN0cmlwcGVkIG9u
IGNvbW1pdCBpZiB0aGUgbWFpbnRhaW5lciBpcyB3aWxsaW5nIHRvIGRvIHNvLA0Kb3RoZXJ3aXNl
IHlvdeKAmWxsIG5lZWQgdG8gc2VuZCBhIHYyIHdpdGggdGhlIHRhZ3MgcmVtb3ZlZC4NCg0KVG8g
bWUgdGhlIGNvZGUgbG9va3MgZ29vZCwgc3RpbGwgbmVlZCBhIG1haW50YWluZXIgcmV2aWV3IHRo
b3VnaC4NCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNv
bT4NCg0KDQo=

