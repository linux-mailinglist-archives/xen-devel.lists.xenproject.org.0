Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041092CA573
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 15:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42107.75690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk6XU-0002rN-G7; Tue, 01 Dec 2020 14:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42107.75690; Tue, 01 Dec 2020 14:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk6XU-0002qx-CK; Tue, 01 Dec 2020 14:21:56 +0000
Received: by outflank-mailman (input) for mailman id 42107;
 Tue, 01 Dec 2020 14:21:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dt7S=FF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kk6XS-0002qr-Lg
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 14:21:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 726b9e24-0006-45e0-aaaf-dbc24389865b;
 Tue, 01 Dec 2020 14:21:52 +0000 (UTC)
Received: from AM6PR0202CA0054.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::31) by AM0PR08MB5089.eurprd08.prod.outlook.com
 (2603:10a6:208:15b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 14:21:50 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::3c) by AM6PR0202CA0054.outlook.office365.com
 (2603:10a6:20b:3a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Tue, 1 Dec 2020 14:21:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Tue, 1 Dec 2020 14:21:50 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Tue, 01 Dec 2020 14:21:49 +0000
Received: from 966c964ae05d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A7EDA45-3AA0-4ECC-9DE8-EA304DA7DB5C.1; 
 Tue, 01 Dec 2020 14:21:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 966c964ae05d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Dec 2020 14:21:12 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2694.eurprd08.prod.outlook.com (2603:10a6:6:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Tue, 1 Dec
 2020 14:21:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.017; Tue, 1 Dec 2020
 14:21:08 +0000
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
X-Inumbo-ID: 726b9e24-0006-45e0-aaaf-dbc24389865b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoUAKAInsUuNczKwoDejNvXT3psocXhURQC81Mb6Sdg=;
 b=ViAgHL3+rZKxV+ZoGfAxwX1F7nl3XvM5pLVG6o9+9E/H6IKn6riVnie5k9tQZj77wYQEuGf/PD36sYuYhzBoVr0pFMoHSQUNuZJyaYEdJHreTjnya6WU3sxSeSSt0fmGvDoM5ju8JGyeTGJlKdJJ1W4qzEHG+xMYaEha8sTkVk8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4536d92f1525444
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV9Co6uxuiwV3egg9Y0ov7f398nofJLdQAIXS7Z4gZDFfFDxzZOT6oRESu4Rs6jJPccwvFI5yhTpTIaelEvZmWNwajJRLs0Mbwd6z1AkiyZS9YAVr/dz4ZzpdYUd8zPjAqBwES8LZtyqIJSQOp5wrm6qkpMaFuSq8J0tXekSNt10hD5mE+1oAWk/nZRpiZdkgJ7te0qZCPpKneCGpEsCDbTGTFQxdAjOO8MBnnBPYpqoOhoBqgR24iAaEz7efm3rwVAMLgQf3pSN2NpB/G/o4VuntbSCaq7Krd0wAGEMyzhVP6uUvw0/lTETe7ueThq6JGKhosLw0+rYEmq8R/vmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoUAKAInsUuNczKwoDejNvXT3psocXhURQC81Mb6Sdg=;
 b=SuHaEJ6NvwKtlVQLvcAPuPlQKbcw69V5jnchBK8CFUB/RVd8qATn6ZKBuAk3ZaHKDF4evkGao1TSl6rUtL9t9yWrDfNu+S3s6Zk//1nRTeOMh0cj0z+2pHMCMTsQeqB5gJjK5aRAttMnfCgEgd2AGU4ylh2AQwhE/t2xi0FGG2OzlKU3QxLQa1hpjG+tHKw7arsdX6oUkt8coFDb6yorvBXx/NVPeWUerjH/JA9LtA8SSiNI49NUnm14d7D5jrVXK9XbAYnIvSSbjtFMyLaef/ij3p0oGnmkpw6eLlcr5EcpBHmIecrgzpD/jBbjklsOKz7T/C18NSbONxKt1SnMLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoUAKAInsUuNczKwoDejNvXT3psocXhURQC81Mb6Sdg=;
 b=ViAgHL3+rZKxV+ZoGfAxwX1F7nl3XvM5pLVG6o9+9E/H6IKn6riVnie5k9tQZj77wYQEuGf/PD36sYuYhzBoVr0pFMoHSQUNuZJyaYEdJHreTjnya6WU3sxSeSSt0fmGvDoM5ju8JGyeTGJlKdJJ1W4qzEHG+xMYaEha8sTkVk8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Topic: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Index: AQHWxyRuchSNSGGKDEyJCEQqqd6Vw6nhIUWAgAD/ugCAAAW5gIAAJWmA
Date: Tue, 1 Dec 2020 14:21:08 +0000
Message-ID: <87243486-2A58-4497-B566-5FDE4158D18E@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com>
 <87lfei7fj5.fsf@epam.com> <AB32AAFF-DD1D-4B13-ABC0-06F460E95E1C@arm.com>
 <87sg8p687j.fsf@epam.com>
In-Reply-To: <87sg8p687j.fsf@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1fa62a3d-1938-4aac-45b7-08d8960471ae
x-ms-traffictypediagnostic: DB6PR08MB2694:|AM0PR08MB5089:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5089F0E7D75E5335B1192A099DF40@AM0PR08MB5089.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5Wxthw4tqc9Qt+HWSLyNswoNnY4Vc87C3zekit3/hn9NV1q5dWeeJWdVxxDSO6Ex6oV/H4+rKsArMeKyZ1+IjIMp4NebsEVnwbzf3c/dj6KGf+GQb5vrmhK1piVXooSoH0D6IdyyjxQtsV9CG4ccyz1oMOthRvx5Dr8BtTJ7h0rJS+JEz492rbolupHIjZ8ZbdYMLiEsj8G6xA3A6KC2Sarpj0WXXaHw0ShTXnUfwQcb+X93rBBX96KMAY0RQ7vzyyJYcRi7tNhaRJ+iN2yRhB8o6ytThPCRYOFcyROfmG/oPk8ZvDgHZgx8XHZurnbGFr+2l8YMk8cxdDSD04IgcQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(54906003)(186003)(91956017)(76116006)(6512007)(33656002)(66556008)(66446008)(64756008)(53546011)(83380400001)(6506007)(66476007)(71200400001)(66946007)(478600001)(26005)(86362001)(2616005)(6486002)(316002)(36756003)(6916009)(2906002)(5660300002)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?TSsxOGF1cnM0ZkhDUFdFd0tBbTJZbVVmcUpuamROMUVMcjJ2Tkt5Qzd4Qlcr?=
 =?utf-8?B?em5pNUdwM3dSVjRpUEw5ZXFET0szZWJ0aG0rc3hCenJ1bjljSmcwV0J0Z2Vm?=
 =?utf-8?B?aFlTWW1KTUFLcjdpWkM3SWg2RHV4RTJQTHpHMTZ5SEhjdjBOVXhvOTFXd1ZR?=
 =?utf-8?B?em1UNWVrTCtNU0E1VHo2R0NKYXVhTG53UDFXZHBUaDZWaU1kL1pkcGp3UWZF?=
 =?utf-8?B?b1A1NHgvMjFVeDcyOTJEUVZ5UDcyN05ZQk9HMkZRV2p2UEZFeVNwNHJJeWhC?=
 =?utf-8?B?L2dTcmphZjQ5RWF5MWJpT0xTbUZ4eU5zZ1RCa2R5VkNNbUFoNWU3U01vclAv?=
 =?utf-8?B?aGZlMmY4RVg2MTA2VHZ4WkFvZVBWbWdoYlZWZmdFd1o0dE4vQ29YcDZwZXMz?=
 =?utf-8?B?cGZ6YytYS1dtNWZFa1NuTUdLMmhnOStYR3duYTB1WFZkSjNtWFh4bjM5Q2o0?=
 =?utf-8?B?eW00eFZRMW0zTEJlMmNSYldrdzdkSWdzbndXbW02My9JZ1pabmFrNmJDc2du?=
 =?utf-8?B?RE9ic0d2ZFFRZG5lbFJ5MnZTNTZIeEdneUtoWml3ZTQyVG51NW1UaHRXdFRW?=
 =?utf-8?B?aWxYa291R3JiUkVpeityQ0FJV2hmbitWZGg1TFhKQUdzQjNBcWFVeWpvQlVy?=
 =?utf-8?B?c1o3aXVkR1lPYkE2eVhwRnFtVmVSZFI4R3puTWplRk1SZGM4QXhEVmh5b1Uy?=
 =?utf-8?B?dkdQUG81cW5oSk0vbStCWHorYkoyNlFwcmFXZGVmK3pUSEpsa1BOOVlhWEFU?=
 =?utf-8?B?djlnZ2V5M21OMDcxRkNSQUtlemdVQXFXMFByOC85R3RCVUlGUm05SHlCbHhp?=
 =?utf-8?B?RU1TK1NlM2ZKcXBMcWtLODN5d0JETWNLMjcyNXFncjI0dFFWejNCeiswNzRr?=
 =?utf-8?B?MnlhZEFIZGVhajlJbkZheEpTTzhlWGhrWG9ua3NBWlU3dmRZYldYQThHa0hN?=
 =?utf-8?B?SWdBZTdzcjBLV014c0J5NGVoUEx1bWJhNEZCTUtUTnIwSXM1Z0RrMm92RGFt?=
 =?utf-8?B?OTc0VXhyeWVtejNySitTeXVRNkJSSkIyakE0c2VsYzgxTUc2N2ZYZWdxUnRR?=
 =?utf-8?B?UElsc0lZUzJXeFpzampvdm9uRjhGd05EQWpTUkJGeUlySUNBdDMra2F5UURr?=
 =?utf-8?B?MFErcDdlUEhUZDBPSXJJbDY0aDVsc0pYUkpTdEpjOE9iREQ1T2dlZ2QxSUwx?=
 =?utf-8?B?TGNiRTM4aEh1V0d5TGdZM2ZBQTcrSkxYdGJ5ODJ5VE9rbHRGMDFqUW1OcEEz?=
 =?utf-8?B?bHZVdmtMaG5kOHk3T29oSk5nSHVrVVlpZXAyUWhJWkRDaU1YVStrc05xcUJ6?=
 =?utf-8?Q?m7OR66tVPcw7+vwUKFAgc9JUBIEayngNmI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <65A0948A7F05F241A4EA2C66F76890D6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2694
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81c3533a-e1a0-402c-1441-08d89604587c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	McR72uEb3RJpxNbZ66ThPuWTK5YIDE/TN818wMRIgXpKzudeEhSbTd8XM2foiTv4fh+RYasdI9dNC21UEDHbrhkZ0dkNyuf6wkYMdlCzHdTqjiqqWnH+fXxDrpQK8ER8FQsY+ChHEKeyYGuMo1eY/t0itPOeIaH0iZfLFZh5TfHvTyIRCyTtyH/r1KLE4i5cvbu8AvurxIZFXMupPBo5Bjg9D9ElDPr/5IC8DH7k8EINgB144ugqFAWXxaYxsQvrFT5MZKwlz6x1prXhwtoOpZfHvP9x6i0yDRWsZE7R/dQUzMkl/JTuW6Tqexnlw5Ig03g7K0mbIBtb/jygYyVaGQLoVmIC7Kn6JNZ1VrdmArCTQxPT0hpXjgFTa57EFjjeTb86dbBTH8JB/jc6pMVw9w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(336012)(33656002)(186003)(6486002)(54906003)(316002)(86362001)(6512007)(26005)(53546011)(6506007)(70206006)(6862004)(36756003)(70586007)(47076004)(82310400003)(81166007)(8936002)(5660300002)(4326008)(82740400003)(478600001)(8676002)(2906002)(356005)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 14:21:50.2485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa62a3d-1938-4aac-45b7-08d8960471ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5089

SGkgVm9sb2R5bXlyLA0KDQo+IE9uIDEgRGVjIDIwMjAsIGF0IDEyOjA3LCBWb2xvZHlteXIgQmFi
Y2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IEhpLA0K
PiANCj4gQmVydHJhbmQgTWFycXVpcyB3cml0ZXM6DQo+IA0KPj4gSGksDQo+PiANCj4+PiBPbiAz
MCBOb3YgMjAyMCwgYXQgMjA6MzEsIFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1
a0BlcGFtLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gQmVydHJhbmQgTWFycXVpcyB3cml0
ZXM6DQo+Pj4gDQo+Pj4+IEFkZCBzdXBwb3J0IGZvciBlbXVsYXRpb24gb2YgY3AxNSBiYXNlZCBJ
RCByZWdpc3RlcnMgKG9uIGFybTMyIG9yIHdoZW4NCj4+Pj4gcnVubmluZyBhIDMyYml0IGd1ZXN0
IG9uIGFybTY0KS4NCj4+Pj4gVGhlIGhhbmRsZXJzIGFyZSByZXR1cm5pbmcgdGhlIHZhbHVlcyBz
dG9yZWQgaW4gdGhlIGd1ZXN0X2NwdWluZm8NCj4+Pj4gc3RydWN0dXJlLg0KPj4+PiBJbiB0aGUg
Y3VycmVudCBzdGF0dXMgdGhlIE1WRlIgcmVnaXN0ZXJzIGFyZSBubyBzdXBwb3J0ZWQuDQo+Pj4g
DQo+Pj4gSXQgaXMgdW5jbGVhciB3aGF0IHdpbGwgaGFwcGVuIHdpdGggcmVnaXN0ZXJzIHRoYXQg
YXJlIG5vdCBjb3ZlcmVkIGJ5DQo+Pj4gZ3Vlc3RfY3B1aW5mbyBzdHJ1Y3R1cmUuIEFjY29yZGlu
ZyB0byBBUk0gQVJNLCBpdCBpcyBpbXBsZW1lbnRhdGlvbg0KPj4+IGRlZmluZWQgaWYgc3VjaCBh
Y2Nlc3NlcyB3aWxsIGJlIHRyYXBwZWQuIE9uIG90aGVyIGhhbmQsIHRoZXJlIGFyZSBtYW55DQo+
Pj4gcmVnaXN0ZXJzIHdoaWNoIGFyZSBSQVouIFNvLCBnb29kIGJlaGF2aW5nIGd1ZXN0IGNhbiB0
cnkgdG8gcmVhZCBvbmUgb2YNCj4+PiB0aGF0IHJlZ2lzdGVycyBhbmQgaXQgd2lsbCBnZXQgdW5k
ZWZpbmVkIGluc3RydWN0aW9uIGV4Y2VwdGlvbiwgaW5zdGVhZA0KPj4+IG9mIGp1c3QgcmVhZGlu
ZyBhbGwgemVyb2VzLg0KPj4gDQo+PiBUaGlzIGlzIHRydWUgaW4gdGhlIHN0YXR1cyBvZiB0aGlz
IHBhdGNoIGJ1dCB0aGlzIGlzIHNvbHZlZCBieSB0aGUgbmV4dCBwYXRjaA0KPj4gd2hpY2ggaXMg
YWRkaW5nIHByb3BlciBoYW5kbGluZyBvZiB0aG9zZSByZWdpc3RlcnMgKGFkZCBDUDEwIGV4Y2Vw
dGlvbg0KPj4gc3VwcG9ydCksIGF0IGxlYXN0IGZvciBNVkZSIG9uZXMuDQo+PiANCj4+IEZyb20g
QVJNIEFSTSBwb2ludCBvZiB2aWV3LCBJIGRpZCBoYW5kbGUgYWxsIHJlZ2lzdGVycyBsaXN0ZWQg
SSB0aGluay4NCj4+IElmIHlvdSB0aGluayBzb21lIGFyZSBtaXNzaW5nIHBsZWFzZSBwb2ludCBt
ZSB0byB0aGVtIGFzIE8gZG8gbm90DQo+PiBjb21wbGV0ZWx5IHVuZGVyc3RhbmQgd2hhdCBhcmUg
dGhlIOKAnHJlZ2lzdGVycyBub3QgY292ZXJlZOKAnSB1bmxlc3MNCj4+IHlvdSBtZWFuIHRoZSBN
VkZSIG9uZXMuDQo+IA0KPiBXZWxsLCBJIG1heSBiZSB3cm9uZyBmb3IgYWFyY2gzMiBjYXNlLCBi
dXQgZm9yIGFhcmNoNjQsIHRoZXJlIGFyZSBudW1iZXINCj4gb2YgcmVzZXJ2ZWQgcmVnaXN0ZXJz
IGluIElEcyByYW5nZS4gVGhvc2UgcmVnaXN0ZXJzIHNob3VsZCByZWFkIGFzDQo+IHplcm8uIFlv
dSBjYW4gZmluZCB0aGVtIGluIHRoZSBzZWN0aW9uICJDNS4xLjYgb3AwPT0wYjExLCBNb3ZlcyB0
byBhbmQNCj4gZnJvbSBub24tZGVidWcgU3lzdGVtIHJlZ2lzdGVycyBhbmQgU3BlY2lhbC1wdXJw
b3NlIHJlZ2lzdGVycyIgb2YgQVJNDQo+IERESSAwNDg3Qi5hLiBDaGVjayBvdXQgIlRhYmxlIEM1
LTYgU3lzdGVtIGluc3RydWN0aW9uIGVuY29kaW5ncyBmb3INCj4gbm9uLURlYnVnIFN5c3RlbSBy
ZWdpc3RlciBhY2Nlc3NlcyIuDQoNClRoZSBwb2ludCBvZiB0aGUgc2VyaWUgaXMgdG8gaGFuZGxl
IGFsbCByZWdpc3RlcnMgdHJhcHBlZCBkdWUgdG8gVElEMyBiaXQgaW4gSENSX0VMMi4NCg0KQW5k
IGkgdGhpbmsgSSBoYW5kbGVkIGFsbCBvZiB0aGVtIGJ1dCBJIG1pZ2h0IGJlIHdyb25nLg0KDQpI
YW5kbGluZyBhbGwgcmVnaXN0ZXJzIGZvciBvcDA9PTBiMTEgd2lsbCBjb3ZlciBhIGxvdCBtb3Jl
IHRoaW5ncy4NClRoaXMgY2FuIGJlIGRvbmUgb2YgY291cnNlIGJ1dCB0aGlzIHdhcyBub3QgdGhl
IHBvaW50IG9mIHRoaXMgc2VyaWUuDQoNClRoZSBsaXN0aW5nIGluIEhDUl9FTDIgZG9jdW1lbnRh
dGlvbiBpcyBwcmV0dHkgY29tcGxldGUgYW5kIGlmIEkgbWlzcyBhbnkgcmVnaXN0ZXINCnRoZXJl
IHBsZWFzZSB0ZWxsIG1lIGJ1dCBJIGRvIG5vIHVuZGVyc3RhbmQgZnJvbSB0aGUgZG9jdW1lbnRh
dGlvbiB0aGF0IGFsbCByZWdpc3RlcnMNCndpdGggb3AwIDMgYXJlIHRyYXBwZWQgYnkgVElEMy4N
Cg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KDQo+IA0KPiANCj4+PiANCj4+Pj4gU2lnbmVkLW9mZi1i
eTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gQ2hhbmdlcyBpbiBWMjogcmViYXNlDQo+Pj4+IC0tLQ0KPj4+PiB4ZW4vYXJjaC9hcm0v
dmNwcmVnLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiAx
IGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS92Y3ByZWcuYyBiL3hlbi9hcmNoL2FybS92Y3ByZWcuYw0KPj4+PiBpbmRl
eCBjZGM5MWNkZjViLi5kMGM2NDA2ZjM0IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
dmNwcmVnLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3ZjcHJlZy5jDQo+Pj4+IEBAIC0xNTUs
NiArMTU1LDE0IEBAIFRWTV9SRUczMihDT05URVhUSURSLCBDT05URVhUSURSX0VMMSkNCj4+Pj4g
ICAgICAgIGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4+Pj4gICAgfQ0KPj4+PiANCj4+Pj4gKy8qIE1hY3JvIHRvIGdlbmVyYXRl
IGVhc2lseSBjYXNlIGZvciBJRCBjby1wcm9jZXNzb3IgZW11bGF0aW9uICovDQo+Pj4+ICsjZGVm
aW5lIEdFTkVSQVRFX1RJRDNfSU5GTyhyZWcsZmllbGQsb2Zmc2V0KSAgICAgICAgICAgICAgICAg
ICAgICAgIFwNCj4+Pj4gKyAgICBjYXNlIEhTUl9DUFJFRzMyKHJlZyk6ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+PiArICAgIHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+ICsg
ICAgICAgIHJldHVybiBoYW5kbGVfcm9fcmVhZF92YWwocmVncywgcmVnaWR4LCBjcDMyLnJlYWQs
IGhzciwgICAgIFwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgMSwgZ3Vlc3RfY3B1
aW5mby5maWVsZC5iaXRzW29mZnNldF0pOyAgICAgXA0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+
PiB2b2lkIGRvX2NwMTVfMzIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGNvbnN0IHVuaW9u
IGhzciBoc3IpDQo+Pj4+IHsNCj4+Pj4gICAgY29uc3Qgc3RydWN0IGhzcl9jcDMyIGNwMzIgPSBo
c3IuY3AzMjsNCj4+Pj4gQEAgLTI4Niw2ICsyOTQsMzMgQEAgdm9pZCBkb19jcDE1XzMyKHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzLCBjb25zdCB1bmlvbiBoc3IgaHNyKQ0KPj4+PiAgICAgICAg
ICovDQo+Pj4+ICAgICAgICByZXR1cm4gaGFuZGxlX3Jhel93aShyZWdzLCByZWdpZHgsIGNwMzIu
cmVhZCwgaHNyLCAxKTsNCj4+Pj4gDQo+Pj4+ICsgICAgLyoNCj4+Pj4gKyAgICAgKiBIQ1JfRUwy
LlRJRDMNCj4+Pj4gKyAgICAgKg0KPj4+PiArICAgICAqIFRoaXMgaXMgdHJhcHBpbmcgbW9zdCBJ
ZGVudGlmaWNhdGlvbiByZWdpc3RlcnMgdXNlZCBieSBhIGd1ZXN0DQo+Pj4+ICsgICAgICogdG8g
aWRlbnRpZnkgdGhlIHByb2Nlc3NvciBmZWF0dXJlcw0KPj4+PiArICAgICAqLw0KPj4+PiArICAg
IEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9QRlIwLCBwZnIzMiwgMCkNCj4+Pj4gKyAgICBHRU5FUkFU
RV9USUQzX0lORk8oSURfUEZSMSwgcGZyMzIsIDEpDQo+Pj4+ICsgICAgR0VORVJBVEVfVElEM19J
TkZPKElEX1BGUjIsIHBmcjMyLCAyKQ0KPj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9E
RlIwLCBkYmczMiwgMCkNCj4+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfREZSMSwgZGJn
MzIsIDEpDQo+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0FGUjAsIGF1eDMyLCAwKQ0K
Pj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZSMCwgbW0zMiwgMCkNCj4+Pj4gKyAg
ICBHRU5FUkFURV9USUQzX0lORk8oSURfTU1GUjEsIG1tMzIsIDEpDQo+Pj4+ICsgICAgR0VORVJB
VEVfVElEM19JTkZPKElEX01NRlIyLCBtbTMyLCAyKQ0KPj4+PiArICAgIEdFTkVSQVRFX1RJRDNf
SU5GTyhJRF9NTUZSMywgbW0zMiwgMykNCj4+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURf
TU1GUjQsIG1tMzIsIDQpDQo+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX01NRlI1LCBt
bTMyLCA1KQ0KPj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9JU0FSMCwgaXNhMzIsIDAp
DQo+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVIxLCBpc2EzMiwgMSkNCj4+Pj4g
KyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfSVNBUjIsIGlzYTMyLCAyKQ0KPj4+PiArICAgIEdF
TkVSQVRFX1RJRDNfSU5GTyhJRF9JU0FSMywgaXNhMzIsIDMpDQo+Pj4+ICsgICAgR0VORVJBVEVf
VElEM19JTkZPKElEX0lTQVI0LCBpc2EzMiwgNCkNCj4+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lO
Rk8oSURfSVNBUjUsIGlzYTMyLCA1KQ0KPj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9J
U0FSNiwgaXNhMzIsIDYpDQo+Pj4+ICsgICAgLyogTVZGUiByZWdpc3RlcnMgYXJlIGluIGNwMTAg
bm8gY3AxNSAqLw0KPj4+PiArDQo+Pj4+ICAgIC8qDQo+Pj4+ICAgICAqIEhDUl9FTDIuVElEQ1AN
Cj4+Pj4gICAgICoNCj4+PiANCj4+PiANCj4+PiAtLSANCj4+PiBWb2xvZHlteXIgQmFiY2h1ayBh
dCBFUEFNDQo+IA0KPiANCj4gLS0gDQo+IFZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0NCg0K

