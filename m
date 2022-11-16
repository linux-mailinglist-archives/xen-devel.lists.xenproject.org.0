Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC862BE8C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 13:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444291.699337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovHoB-0007VS-8H; Wed, 16 Nov 2022 12:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444291.699337; Wed, 16 Nov 2022 12:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovHoB-0007T2-4I; Wed, 16 Nov 2022 12:46:27 +0000
Received: by outflank-mailman (input) for mailman id 444291;
 Wed, 16 Nov 2022 12:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l+LD=3Q=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1ovHo8-0007Sw-VP
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 12:46:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac06818a-65ac-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 13:46:21 +0100 (CET)
Received: from DB6PR0301CA0098.eurprd03.prod.outlook.com (2603:10a6:6:30::45)
 by VE1PR08MB5775.eurprd08.prod.outlook.com (2603:10a6:800:1a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.8; Wed, 16 Nov
 2022 12:46:19 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::71) by DB6PR0301CA0098.outlook.office365.com
 (2603:10a6:6:30::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Wed, 16 Nov 2022 12:46:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 12:46:18 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Wed, 16 Nov 2022 12:46:18 +0000
Received: from 908ce9058240.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A29A6911-F06E-4817-A108-11D6E13AAF22.1; 
 Wed, 16 Nov 2022 12:46:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 908ce9058240.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Nov 2022 12:46:08 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by AS2PR08MB10128.eurprd08.prod.outlook.com (2603:10a6:20b:644::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Wed, 16 Nov
 2022 12:46:03 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f%3]) with mapi id 15.20.5834.006; Wed, 16 Nov 2022
 12:46:03 +0000
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
X-Inumbo-ID: ac06818a-65ac-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dLhTdJBSaGlTC9SPbG4miWt1tmd9z3Pv/nDZiX0/JU=;
 b=xcrdmTA8WhUkWzGX0smlkZChGUwCGYroe/GDvTQ4yjqYH45dfGOnM9HdWaPxUlIZAhm9qfSsi99PnG9e9A/qoZySaetvQjEI4r5E4aOT7GiPo9334BRg4A5HhRt2QhgqJLKNK3a9PJBNCpHUPktgn0gV0ai8Yd8Dw9VplyRA/YU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4529cfbc7e71ccb1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/OGiet2Vd/5Nk4cRQLDy7qY3BYVoHtrX7b4chBg7vBXXhyBvBDiYR/1YTHnV4Bp0fdUGaq60FTeyVaKbSH3tkD9uAWILFOfrzBdxSUdrZjtbXQxUt2m6ys0fomzyUslyyh5uLMUwU+PGYi8pzBdeUyfyOLceG2xxNbQHuWfcVXTSb8RwbN2byO5yGDrbpBKeU1DxNWlA5/ngMhWWeVVawKqmO90AxzIWdtFd4PwUT5cWKLFxtLPwy78pGkdaQJzUPz9cVc52d+I4yf6ecqRfGdX+DNIxkN+Tz821HpoZ2qJsJhBhCAdbK+IJ3BokcANd724XxdsAXsr8MJzrn6e0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dLhTdJBSaGlTC9SPbG4miWt1tmd9z3Pv/nDZiX0/JU=;
 b=kCOoraC8rkqd08H5wmd44AUwARfKlf/rRyWzgk4cMvPNMiPv25Vgz9ZpmeUJz8iyXyCYaBObnEyYmXqNxoGomkUpb0u5BGc4vT14caY63Va0bjTRiNj9RoQd47krCWmWdg39KKp+I2vJ9q81WVV+3AhTekbOzBZErYFifzbhKB5xe07qweOSJyXdvP5a+4ZTNKNT3+XzezPH9ibXyrjl1XqUi+HuZj1wf8tDF5zwXcrixqIIgD1zsa3ujtbnnBH7ffUbJ95HBzVnEqOj4mbbUEQkJsnAT5EDXByDP9Ckj/Mcmwz06AxHcEDyr6OgCThpeZTvImijpqPAPLx4lEFGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dLhTdJBSaGlTC9SPbG4miWt1tmd9z3Pv/nDZiX0/JU=;
 b=xcrdmTA8WhUkWzGX0smlkZChGUwCGYroe/GDvTQ4yjqYH45dfGOnM9HdWaPxUlIZAhm9qfSsi99PnG9e9A/qoZySaetvQjEI4r5E4aOT7GiPo9334BRg4A5HhRt2QhgqJLKNK3a9PJBNCpHUPktgn0gV0ai8Yd8Dw9VplyRA/YU=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Jiamei Xie <Jiamei.Xie@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>
Subject: RE: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Topic: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Index:
 Adj0C3U97KqJOGXWTaWwFEv08mPlLwAAvb+AAAFgduAAAlWjgABJlSiAABB0itABDLR9UA==
Date: Wed, 16 Nov 2022 12:46:03 +0000
Message-ID:
 <AS8PR08MB7696C0DBCEF8A096F84DAFBB92079@AS8PR08MB7696.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com>
 <AS8PR08MB7696950216E688E67644CBDB923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <f650683a-c2e6-e282-b32c-52151341ecfb@amd.com>
 <alpine.DEB.2.22.394.2211101231210.50442@ubuntu-linux-20-04-desktop>
 <AS8PR08MB76964D9E2CF5FD8D1BB1A60592009@AS8PR08MB7696.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB76964D9E2CF5FD8D1BB1A60592009@AS8PR08MB7696.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2F0EE120B6997D46B744967F00500474.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|AS2PR08MB10128:EE_|DBAEUR03FT046:EE_|VE1PR08MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 947bb86a-922c-4856-fbba-08dac7d08eab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ii9Q5iJAHlpKZ0A8KxHPGLcygbpVuneBijuNqdSzPdit3aE4BBIjA451sApEjRiN7H0Tb/yBufI3rTAezSQj4JNUUYbJRwy2E6IYeLPkuSBdi03c9gWCvocd6dlheg2PWuFPVo9aO9z9v4lDky8AqTsubgin/D/ah7qg4AYiGTaEWyewdCXROz6niCmh7f55Tt0XskEfox0MmLYlkTINK/pS6G3VRbT1Ao8QR450nE3D+oQ15QJodz8VzG8vxSNahP8ILc4eJeLyk2PQIjezDCGiahKlXcJ0oH0KAAW5xVf1hoFRlt5TTsQoqYEQAzMszoTiNZO/1qZgpgdSPo++0eXmTigChctP/vFQihMq+mCoEqbzb7hrjfZoI1G/VtOET7Zoz0fK+0evIkUV8SdNcCkHb232yuk8APKda/MSE6n58JX19F/rn/dX98UDe6uSjpR1r8rv6juXcEyXEFzFpk9uHtLAfMe5Tl3ZD/rwTAOAFbwF8pLhyJpujvoutG80qICznsCg/AYwYKAOIA076L2KNucjCoJSytRrwi2tk1DVVhQVdGxBo5dtuJshc6E+9UDBzZcTAT+3e2BIM65rK7lkWYJiYV5qjiY7Sx5Caxk+PaWclFnhD1MEUIh2SSM7g0WEUli2Ufzr1Z4oaGbkN5MsIP+TCJfQNFkPGibWbfzyRnSFgigQn4VaNKY4lD93A6LJB6RrBdNr61DBd9UluwqwNxlLW8H0ADOY+L9qjEafD0/wv0YWWBBrWIf+F3FDSVOM+8ItJYoXw++BTXzWvQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199015)(41300700001)(52536014)(4326008)(66446008)(64756008)(66476007)(66556008)(5660300002)(38100700002)(76116006)(122000001)(71200400001)(7696005)(6506007)(26005)(53546011)(66946007)(478600001)(8676002)(110136005)(186003)(316002)(55016003)(45080400002)(54906003)(86362001)(9686003)(33656002)(8936002)(2906002)(66899015)(38070700005)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10128
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1afcb09a-c395-44b6-ada7-08dac7d085be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JEpM76Pi2SeYpXt/n1jH8ZcOFbFPeRLYTTdnUPanLomhVaqKs2Z2tjbFZ5OvE13FNQxG6LtnjHXbL31svnu7Wqy/8CaX0xnmFo2KITvUKo2IWdCp7vdo6wp8VGapo7PbmWQulYBA5+Py0uUdFEZ22RWMHoSsgDIZyxnISO+7pPwi8/utPwY6PXtKGZuUR1Au7otVHl/zvgDhe9yTZbE8ql7CklDqRrswyn9jllSpTI17Ku3ci8TzECjXc7B7/DomKXWjzWkb3uh9CfOtMmF09+WEV5wq7mWsQAEm2zVZw6K77MACndO1+m/zpfQCCk3p4rogFcN1CvF42sPzO4H37YxbgHsUTwuGiu/15RrqjO9I81MVtM6qW4hCMjP9+/VzfDYoOTH+qvFBGw9Uh+2I+l7fNPfKRF79uZ/WNT8rq4yPZYEtMlH7FNMG7lQ3OuzN6+/Oe+KCVRJW+/r7opchoWW6m8fkwSrdulOSih1Q05nrXj+8vVz+Fwjdo02pFrv5LRrJCNHFPcJop3uwJb6AfUwlXyO625NcfxvqUuEE5BWDEZY6MNWXJcDByPzZCBwp80ItQvx0hV+Hp5p7zHRPaI1eMHjqRVWqpzqqKOL4gQpBrNahM+bIvARtlm+WScUz/tP1luP7NQwCoehREE6xZfTtIR2EUIkxgkn1uGHra9TMGHW3lvPdX/lWktxVaz8Rj9izAPYhpsjt1JTk/UegmPbH2CG3Lajj9Usr2wNZtrseFhKg2idtX5Pm/QukvdHB4cImnyKJ1/K88RivjQ0dDQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(81166007)(66899015)(356005)(2906002)(40480700001)(8936002)(5660300002)(55016003)(52536014)(4326008)(70586007)(8676002)(53546011)(41300700001)(83380400001)(336012)(186003)(6506007)(70206006)(7696005)(9686003)(26005)(82310400005)(47076005)(86362001)(36860700001)(54906003)(316002)(478600001)(45080400002)(40460700003)(110136005)(82740400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 12:46:18.7107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 947bb86a-922c-4856-fbba-08dac7d08eab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5775

SGkNCiANCiBJIGhhdmUgd3JvdGUgYSBrZXJuZWwgcGF0Y2ggdG8gZml4IHRoaXMuIEFuZCBJIGhh
dmUgdGVzdGVkLiBJdCB3aWxsIG5vdCBoYXZlIHNlZ21lbnRhdGlvbiBmYXVsdC4NCg0KQmVzdCB3
aXNoZXMNCkppYW1laSBYaWUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBC
ZWhhbGYgT2YNCj4gSmlhbWVpIFhpZQ0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDExLCAyMDIy
IDEyOjMxIFBNDQo+IFRvOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBNaWNoYWwgT3J6ZWwNCj4gPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47DQo+
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IGp1bGllbkB4ZW4u
b3JnDQo+IFN1YmplY3Q6IFJFOiBYZW4gQXJtIHZwbDAxMSBVQVJUIHdpbGwgY2F1c2Ugc2VnbWVu
dGF0aW9uIGZhdWx0IGluIExpbnV4DQo+IGd1ZXN0DQo+IA0KPiBIaQ0KPiANCj4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4NCj4gPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDExLCAyMDIyIDQ6
MzMgQU0NCj4gPiBUbzogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gPiBD
YzogSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOyBXZWkNCj4gPiBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQmVydHJhbmQgTWFy
cXVpcw0KPiA+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBqdWxpZW5AeGVuLm9yZzsgc3N0
YWJlbGxpbmlAa2VybmVsLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBYZW4gQXJtIHZwbDAxMSBVQVJU
IHdpbGwgY2F1c2Ugc2VnbWVudGF0aW9uIGZhdWx0IGluIExpbnV4DQo+ID4gZ3Vlc3QNCj4gPg0K
PiA+IE9uIFdlZCwgOSBOb3YgMjAyMiwgTWljaGFsIE9yemVsIHdyb3RlOg0KPiA+ID4gSGkgSmlh
bWVpLA0KPiA+ID4NCj4gPiA+IE9uIDA5LzExLzIwMjIgMDk6MjUsIEppYW1laSBYaWUgd3JvdGU6
DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IEhpIE1pY2hhbO+8jA0KPiA+ID4gPg0KPiA+ID4g
PiBCZWxvdyBsb2cgY2FuIGJlIGdvdCB3aGVuIHN0YXRpbmcgdGhlIGxpbnV4IGd1ZXN0LiBJdCBz
YXlzIDljMDkgaXMgc2JzYS4NCj4gPiBBbmQgOWMwOSBpcyBhbHNvIG91dHB1dA0KPiA+ID4gPiAg
aW4gYm9vdGxvZ2QgZXJyb3IgbWVzc2FnZToNCj4gPiA+ID4gU2VyaWFsOiBBTUJBIFBMMDExIFVB
UlQgZHJpdmVyDQo+ID4gPiA+IDljMGIwMDAwLnVhcnQ6IHR0eUFNQTAgYXQgTU1JTyAweDljMGIw
MDAwIChpcnEgPSAxMiwgYmFzZV9iYXVkID0gMCkNCj4gPiBpcyBhIFBMMDExIHJldjINCj4gPiA+
ID4gcHJpbnRrOiBjb25zb2xlIFt0dHlBTUEwXSBlbmFibGVkDQo+ID4gPiA+IDljMDkwMDAwLnNi
c2EtdWFydDogdHR5QU1BMSBhdCBNTUlPIDB4OWMwOTAwMDAgKGlycSA9IDE1LCBiYXNlX2JhdWQN
Cj4gPiA9IDApIGlzIGEgU0JTQQ0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IFhlbiBiZWhhdmlvciBp
cyBjb3JyZWN0IGFuZCB0aGlzIHdvdWxkIGJlIExpbnV4IGZhdWx0IHRvIHRyeSB0byB3cml0ZSB0
bw0KPiA+IERNQUNSIGZvciBTQlNBIFVBUlQgZGV2aWNlLg0KPiA+ID4gRE1BQ1IgaXMganVzdCBh
biBleGFtcGxlLiBJZiB5b3UgdHJ5IHRvIHByb2dyYW0gZS5nLiB0aGUgYmF1ZHJhdGUNCj4gKHRo
cm91Z2gNCj4gPiBMQ1IpIGZvciBWUEwwMTEgaXQgd2lsbA0KPiA+ID4gYWxzbyByZXN1bHQgaW4g
aW5qZWN0aW5nIGFib3J0IGludG8gdGhlIGd1ZXN0LiBTaG91bGQgWGVuIHN1cHBvcnQgaXQ/IE5v
Lg0KPiBUaGUNCj4gPiByZWFzb24gd2h5IGlzIHRoYXQNCj4gPiA+IGl0IGlzIG5vdCBzcGVjIGNv
bXBsaWFudCBvcGVyYXRpb24uIFNCU0Egc3BlY2lmaWNhdGlvbiBkaXJlY3RseSBzcGVjaWZpZXMN
Cj4gPiB3aGF0IHJlZ2lzdGVycyBhcmUgZXhwb3NlZC4NCj4gPiA+IElmIExpbnV4IHRyaWVzIHRv
IHdyaXRlIHRvIHNvbWUgb2YgdGhlIG5vbmUtc3BlYyBjb21wbGlhbnQgcmVnaXN0ZXJzIC0gaXQg
aXMNCj4gaXRzDQo+ID4gZmF1bHQuDQo+ID4NCj4gPiBZZWFoLCB3ZSBuZWVkIHRvIGZpeCBMaW51
eC4NCj4gPg0KPiA+IEZZSSB0aGlzIGlzIG5vdCB0aGUgZmlyc3QgYnVnIGluIExpbnV4IGFmZmVj
dGluZyB0aGUgc2JzYS11YXJ0IGRyaXZlcjoNCj4gPiB0aGUgaXNzdWUgaXMgdGhhdCB0aGUgcGww
MTEgZHJpdmVyIGFuZCB0aGUgc2JzYS11YXJ0IGRyaXZlciBzaGFyZSB0aGUNCj4gPiBzYW1lIGNv
ZGUgaW4gTGludXggc28gaXQgaGFwcGVucyBzb21ldGltZXMgdGhhdCBhIHBsMDExLW9ubHkgZmVh
dHVyZQ0KPiA+IGNyZWVwcyBpbnRvIHRoZSBzYnNhLXVhcnQgZHJpdmVyIGJ5IG1pc3Rha2UuDQo+
IA0KPiBUaGFua3MgZm9yIHlvdXIgY29uZmlybSBhYm91dCB0aGlzLiBJbiB0aGF0IGNhc2UsIEkg
d2lsbCBjaGVjayB0aGUgTGludXggY29kZSB0bw0KPiBzZWUgd2h5IHRoaXMgaGFwcGVucyBhbmQg
aG93IHRvIGZpeCBpdC4NCj4gDQo+IEJlc3Qgd2lzaGVzDQo+IEppYW1laSBYaWUNCj4gPg0KPiA+
DQo+ID4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPj4gRnJvbTogTWlj
aGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gPiA+ID4+IFNlbnQ6IFdlZG5lc2Rh
eSwgTm92ZW1iZXIgOSwgMjAyMiAzOjQwIFBNDQo+ID4gPiA+PiBUbzogSmlhbWVpIFhpZSA8Smlh
bWVpLlhpZUBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4gPiA+
PiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+ID4g
PiA+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsganVsaWVuQHhlbi5vcmc7DQo+IHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmcNCj4gPiA+ID4+IFN1YmplY3Q6IFJlOiBYZW4gQXJtIHZwbDAxMSBV
QVJUIHdpbGwgY2F1c2Ugc2VnbWVudGF0aW9uIGZhdWx0IGluDQo+IExpbnV4DQo+ID4gPiA+PiBn
dWVzdA0KPiA+ID4gPj4NCj4gPiA+ID4+IEhpIEppYW1laSwNCj4gPiA+ID4+DQo+ID4gPiA+PiBP
biAwOS8xMS8yMDIyIDA4OjIwLCBKaWFtZWkgWGllIHdyb3RlOg0KPiA+ID4gPj4+DQo+ID4gPiA+
Pj4NCj4gPiA+ID4+PiBIaSBhbGwsDQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBXaGVuIHRoZSBndWVz
dCBrZXJuZWwgZW5hYmxlcyBETUEgZW5naW5lIHdpdGgNCj4gPiA+ID4+ICJDT05GSUdfRE1BX0VO
R0lORT15IiwgTGludXggQU1CQSBQTDAxMSBkcml2ZXIgd2lsbCBhY2Nlc3MNCj4gUEwwMTENCj4g
PiA+ID4+IERNQUNSIHJlZ2lzdGVyLiBCdXQgdGhpcyByZWdpc3RlciBoYXZlIG5vdCBiZWVuIHN1
cHBvcnRlZCBieSB2cGwwMTENCj4gb2YNCj4gPiBYZW4uDQo+ID4gPiA+PiBYZW4gd2lsbCBpbmpl
Y3QgYSBkYXRhIGFib3J0IGludG8gZ3Vlc3QsIHRoaXMgd2lsbCBjYXVzZSBzZWdtZW50YXRpb24N
Cj4gZmF1bHQNCj4gPiBvZg0KPiA+ID4gPj4gZ3Vlc3Qgd2l0aCB0aGUgYmVsb3cgbWVzc2FnZToN
Cj4gPiA+ID4+IEkgYW0gcXVpdGUgY29uZnVzZWQuDQo+ID4gPiA+PiBWUEwwMTEgaW1wbGVtZW50
cyBTQlNBIFVBUlQgd2hpY2ggb25seSBpbXBsZW1lbnRzIHNvbWUgc3Vic2V0DQo+IG9mDQo+ID4g
UEwwMTENCj4gPiA+ID4+IG9wZXJhdGlvbnMgKFNCU0EgVUFSVCBpcyBub3QgUEwwMTEpLg0KPiA+
ID4gPj4gQWNjb3JkaW5nIHRvIHNwZWMgKFNCU0EgdmVyLiA2LjApLCB0aGUgU0JTQV9VQVJUIGRv
ZXMgbm90IHN1cHBvcnQNCj4gPiBETUENCj4gPiA+ID4+IGZlYXR1cmVzIHNvIFhlbiBjb2RlIGlz
IGZpbmUuDQo+ID4gPiA+PiBXaGVuIFhlbiBleHBvc2VzIHZwbDAxMSBkZXZpY2UgdG8gYSBndWVz
dCwgdGhpcyBkZXZpY2UgaGFzDQo+ICJhcm0sc2JzYS0NCj4gPiB1YXJ0Ig0KPiA+ID4gPj4gY29t
cGF0aWJsZSBhbmQgbm90ICJ1YXJ0LXBsMDExIi4NCj4gPiA+ID4+IExpbnV4IGRyaXZlciAiYW1i
YS1wbDAxMS5jIiBzaG91bGQgc2VlIHRoaXMgY29tcGF0aWJsZSBhbmQgYXNzaWduDQo+ID4gcHJv
cGVyDQo+ID4gPiA+PiBvcGVyYXRpb25zIChzYnNhX3VhcnRfcG9wcyBpbnN0ZWFkIG9mIGFtYmFf
cGwwMTFfcG9wcykgdGhhdCBkbyBub3QNCj4gPiBlbmFibGUNCj4gPiA+ID4+IERNQS4NCj4gPiA+
ID4+IE1heWJlIHRoZSBpc3N1ZSBpcyB3aXRoIHlvdXIgY29uZmlndXJhdGlvbj8NCj4gPiA+ID4+
DQo+ID4gPiA+PiB+TWljaGFsDQo+ID4gPiA+Pg0KPiA+ID4gPj4+IFVuaGFuZGxlZCBmYXVsdCBh
dCAweGZmZmZmZmMwMDk0NGQwNDgNCj4gPiA+ID4+PiBNZW0gYWJvcnQgaW5mbzoNCj4gPiA+ID4+
PiBFU1IgPSAweDk2MDAwMDAwDQo+ID4gPiA+Pj4gRUMgPSAweDI1OiBEQUJUIChjdXJyZW50IEVM
KSwgSUwgPSAzMiBiaXRzDQo+ID4gPiA+Pj4gU0VUID0gMCwgRm5WID0gMA0KPiA+ID4gPj4+IEVB
ID0gMCwgUzFQVFcgPSAwDQo+ID4gPiA+Pj4gRlNDID0gMHgwMDogdHRiciBhZGRyZXNzIHNpemUg
ZmF1bHQNCj4gPiA+ID4+PiBEYXRhIGFib3J0IGluZm86DQo+ID4gPiA+Pj4gSVNWID0gMCwgSVNT
ID0gMHgwMDAwMDAwMA0KPiA+ID4gPj4+IENNID0gMCwgV25SID0gMA0KPiA+ID4gPj4+IHN3YXBw
ZXIgcGd0YWJsZTogNGsgcGFnZXMsIDM5LWJpdCBWQXMsIHBnZHA9MDAwMDAwMDAyMGUyZTAwMA0K
PiA+ID4gPj4+IFtmZmZmZmZjMDA5NDRkMDQ4XSBwZ2Q9MTAwMDAwMDAzZmZmZjgwMywgcDRkPTEw
MDAwMDAwM2ZmZmY4MDMsDQo+ID4gPiA+PiBwdWQ9MTAwMDAwMDAzZmZmZjgwMywgcG1kPTEwMDAw
MDAwM2ZmZmE4MDMsDQo+ID4gcHRlPTAwNjgwMDAwOWMwOTBmMTMNCj4gPiA+ID4+PiBJbnRlcm5h
bCBlcnJvcjogdHRiciBhZGRyZXNzIHNpemUgZmF1bHQ6IDk2MDAwMDAwIFsjMV0gUFJFRU1QVCBT
TVANCj4gPiA+ID4+PiBNb2R1bGVzIGxpbmtlZCBpbjoNCj4gPiA+ID4+PiBDUFU6IDAgUElEOiAx
MzIgQ29tbTogYm9vdGxvZ2QgTm90IHRhaW50ZWQgNS4xNS40NC15b2N0by1zdGFuZGFyZA0KPiA+
ICMxDQo+ID4gPiA+Pj4gcHN0YXRlOiA2MDQwMDBjNSAoblpDdiBkYUlGICtQQU4gLVVBTyAtVENP
IC1ESVQgLVNTQlMgQlRZUEU9LS0pDQo+ID4gPiA+Pj4gcGMgOiBwbDAxMV9zdG9wX3J4KzB4NzAv
MHg4MA0KPiA+ID4gPj4+IGxyIDogdWFydF90dHlfcG9ydF9zaHV0ZG93bisweDQ0LzB4MTEwDQo+
ID4gPiA+Pj4gc3AgOiBmZmZmZmZjMDA5OTliYmEwDQo+ID4gPiA+Pj4geDI5OiBmZmZmZmZjMDA5
OTliYmEwIHgyODogZmZmZmZmODAyMzRhYzM4MCB4Mjc6IGZmZmZmZjgwMjJmNWQwMDANCj4gPiA+
ID4+PiB4MjY6IDAwMDAwMDAwMDAwMDAwMDAgeDI1OiAwMDAwMDAwMDQ1NTg1NDAxIHgyNDoNCj4g
PiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPiA+Pj4geDIzOiBmZmZmZmY4MDIxYmE0NjYwIHgyMjog
MDAwMDAwMDAwMDAwMDAwMSB4MjE6IGZmZmZmZjgwMjFhMGUyYTANCj4gPiA+ID4+PiB4MjA6IGZm
ZmZmZjgwMjE5OGY4ODAgeDE5OiBmZmZmZmY4MDIxYTBlMWEwIHgxODogMDAwMDAwMDAwMDAwMDAw
MA0KPiA+ID4gPj4+IHgxNzogMDAwMDAwMDAwMDAwMDAwMCB4MTY6IDAwMDAwMDAwMDAwMDAwMDAg
eDE1Og0KPiA+IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4+PiB4MTQ6IDAwMDAwMDAwMDAwMDAw
MDAgeDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjoNCj4gPiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4g
PiA+Pj4geDExOiAwMDAwMDAwMDAwMDAwMDAwIHgxMDogMDAwMDAwMDAwMDAwMDAwMCB4OSA6DQo+
ID4gZmZmZmZmYzAwODcxYmExNA0KPiA+ID4gPj4+IHg4IDogZmZmZmZmYzAwOTlkZTI2MCB4NyA6
IGZmZmZmZjgwMjFhMGUzMTggeDYgOiAwMDAwMDAwMDAwMDAwMDAzDQo+ID4gPiA+Pj4geDUgOiBm
ZmZmZmZjMDA5MzE1ZjIwIHg0IDogZmZmZmZmYzAwOTQ0ZDAzOCB4MyA6IDAwMDAwMDAwMDAwMDAw
MDANCj4gPiA+ID4+PiB4MiA6IGZmZmZmZmMwMDk0NGQwNDggeDEgOiAwMDAwMDAwMDAwMDAwMDAw
IHgwIDogMDAwMDAwMDAwMDAwMDA0OA0KPiA+ID4gPj4+IENhbGwgdHJhY2U6DQo+ID4gPiA+Pj4g
cGwwMTFfc3RvcF9yeCsweDcwLzB4ODANCj4gPiA+ID4+PiB0dHlfcG9ydF9zaHV0ZG93bisweDdj
LzB4YjQNCj4gPiA+ID4+PiB0dHlfcG9ydF9jbG9zZSsweDYwLzB4Y2MNCj4gPiA+ID4+PiB1YXJ0
X2Nsb3NlKzB4MzQvMHg4Yw0KPiA+ID4gPj4+IHR0eV9yZWxlYXNlKzB4MTQ0LzB4NGMwDQo+ID4g
PiA+Pj4gX19mcHV0KzB4NzgvMHgyMjANCj4gPiA+ID4+PiBfX19fZnB1dCsweDFjLzB4MzANCj4g
PiA+ID4+PiB0YXNrX3dvcmtfcnVuKzB4ODgvMHhjMA0KPiA+ID4gPj4+IGRvX25vdGlmeV9yZXN1
bWUrMHg4ZDAvMHgxMjNjDQo+ID4gPiA+Pj4gZWwwX3N2YysweGE4LzB4YzANCj4gPiA+ID4+PiBl
bDB0XzY0X3N5bmNfaGFuZGxlcisweGE0LzB4MTMwDQo+ID4gPiA+Pj4gZWwwdF82NF9zeW5jKzB4
MWEwLzB4MWE0DQo+ID4gPiA+Pj4gQ29kZTogYjkwMDAwODMgYjkwMWYwMDEgNzk0MDM4YTAgOGIw
MDAwNDIgKGI5MDAwMDQxKQ0KPiA+ID4gPj4+IC0tLVsgZW5kIHRyYWNlIDgzZGQ5M2RmMTVjMzIx
NmYgXS0tLQ0KPiA+ID4gPj4+IG5vdGU6IGJvb3Rsb2dkWzEzMl0gZXhpdGVkIHdpdGggcHJlZW1w
dF9jb3VudCAxDQo+ID4gPiA+Pj4gL2V0Yy9yY1MuZC9TMDdib290bG9nZDogbGluZSA0NzogMTMy
IFNlZ21lbnRhdGlvbiBmYXVsdCBzdGFydC1zdG9wLQ0KPiA+ID4gPj4gZGFlbW9uDQo+ID4gPiA+
Pj4gSW4gWGVuLCB2cGwwMTFfbW1pb193cml0ZSBkb2Vzbid0IGhhbmRsZSBETUFDUiAuIEFuZCBr
ZXJuZWwNCj4gZG9lc24ndA0KPiA+ID4gPj4gY2hlY2sgaWYgcGwwMTFfd3JpdGUgZXhlY3V0ZXMg
c3VjZXNzZnVsbHkgaW4gcGwwMTFfZG1hX3J4X3N0b3AgLiBTbw0KPiA+IHN1Y2gNCj4gPiA+ID4+
IHNlZ21lbnRhdGlvbiBmYXVsdCBvY2N1cnMuDQo+ID4gPiA+Pj4gc3RhdGljIGlubGluZSB2b2lk
IHBsMDExX2RtYV9yeF9zdG9wKHN0cnVjdCB1YXJ0X2FtYmFfcG9ydCAqdWFwKQ0KPiA+ID4gPj4+
IHsNCj4gPiA+ID4+PiAgICAgICAgIC8qIEZJWE1FLiAgSnVzdCBkaXNhYmxlIHRoZSBETUEgZW5h
YmxlICovDQo+ID4gPiA+Pj4gICAgICAgICB1YXAtPmRtYWNyICY9IH5VQVJUMDExX1JYRE1BRTsN
Cj4gPiA+ID4+PiAgICAgICAgIHBsMDExX3dyaXRlKHVhcC0+ZG1hY3IsIHVhcCwgUkVHX0RNQUNS
KTsNCj4gPiA+ID4+PiB9DQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBJIHRoaW5rIHdlIHNob3VsZCBw
cmV2ZW50IHN1Y2ggc2VnbWVudGF0aW9uIGZhdWx0LiBXZSBoYXZlIGNoZWNrZWQNCj4gPiB0aGUN
Cj4gPiA+ID4+IFBMMDExIHNwZWMsIGl0IHNlZW1zIHRoZXJlIGlzIG5vdCBhbnkgcmVnaXN0ZXIg
Yml0IGNhbiBpbmRpY2F0ZSBETUENCj4gPiBzdXBwb3J0DQo+ID4gPiA+PiBzdGF0dXMgb2YgUEww
MTEuIFdlIG1pZ2h0IGhhdmUgdHdvIG9wdGlvbnM6DQo+ID4gPiA+Pj4gMS4gT3B0aW9uIzEgaXMg
dG8gYWRkIERNQSBzdXBwb3J0IGZvciB2cGwwMTEsIGJ1dCB0aGlzIGlzIG5vdCB0cml2aWFsLg0K
PiA+ID4gPj4+IDIuIE9wdGlvbiMyIGlzIHRvIGlnbm9yZSB0aGUgd3JpdGUgdG8gRE1BQ1IsIGFu
ZCByZXR1cm4gMCBmb3IgRE1BQ1INCj4gPiByZWFkDQo+ID4gPiA+PiBpbiB2cGwwMTEuIEJ1dCB0
aGlzIG9wdGlvbiBuZWVkIGNvLXdvcmsgd2l0aCBrZXJuZWwsIGJlY2F1c2UgY3VycmVudA0KPiA+
IExpbnV4DQo+ID4gPiA+PiBQTDAxMSBkcml2ZXIgYXNzdW1lIHRoZSB3cml0ZSBvcGVyYXRpb24g
d2lsbCBuZXZlciBiZSBmYWlsZWQsIGFuZCB3aWxsDQo+ID4gbm90DQo+ID4gPiA+PiBmYWxsYmFj
ayB0byBuby1ETUEgbW9kZSwgd2hlbiBYZW4gcmV0dXJuIDAgZm9yIERNQSBlbmFibGVkIGJpdCBp
bg0KPiA+IERNQUNSLg0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gSG93IGRvIHlvdSB0aGluayBhYm91
dCBpdD8gIEFueSBzdWdnZXN0aW9uIGFib3V0IGl0IGlzIHdlbGNvbWUuDQo+ID4gVGhhbmtzLg0K
PiA+ID4gPj4+DQo+ID4gPiA+Pj4gQmVzdCB3aXNoZXMNCj4gPiA+ID4+PiBKaWFtZWkgWGllDQo+
ID4gPiA+Pj4NCj4gPiA+DQo=

