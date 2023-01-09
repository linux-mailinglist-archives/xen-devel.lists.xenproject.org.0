Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B2661F73
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 08:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473342.733879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEmv5-0006ax-CW; Mon, 09 Jan 2023 07:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473342.733879; Mon, 09 Jan 2023 07:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEmv5-0006YA-9l; Mon, 09 Jan 2023 07:50:11 +0000
Received: by outflank-mailman (input) for mailman id 473342;
 Mon, 09 Jan 2023 07:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LgaK=5G=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pEmv3-0005jj-OU
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 07:50:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c1bc36a-8ff2-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 08:50:07 +0100 (CET)
Received: from DB6PR07CA0089.eurprd07.prod.outlook.com (2603:10a6:6:2b::27) by
 AM9PR08MB5889.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 07:50:03 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::3) by DB6PR07CA0089.outlook.office365.com
 (2603:10a6:6:2b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.10 via Frontend
 Transport; Mon, 9 Jan 2023 07:50:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 07:50:03 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Mon, 09 Jan 2023 07:50:02 +0000
Received: from b24ff69f56c9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DEA6985-949A-4C8F-BB54-5328AB1B1B6E.1; 
 Mon, 09 Jan 2023 07:49:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b24ff69f56c9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Jan 2023 07:49:52 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by DBBPR08MB6297.eurprd08.prod.outlook.com (2603:10a6:10:20b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 07:49:48 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 07:49:48 +0000
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
X-Inumbo-ID: 3c1bc36a-8ff2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBX0aIpnIUaKUAwZTfrn7DzcMpOI+YfOn9QeJP7C4fE=;
 b=SpuAgp8f2VDmS0Tj6scUTJ1KDdjikTZdVVof7ApKotQUzeoGrpWTUH6iN5BQX1z5ZxwIW5QmK4DTRNHevSMGB+TXDsXBFxFvjoGQ9ddCKF9tNazRJq18324SLkJvSbykS1fUDhFnS5NA4K7MZMJWB7yDA8QR6s0nbKoyPyuMaZ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+0zfIY1jde15/jbvQZfi6gVTFcZCdh+LeJuRTj8nqIM36iOyeNEz5lcSFF172wGvYxAWNoGrubSvf0IxZuE8S33dKI+r5QEeqcx8giGwsw6XKKAZbPsbqv9KKcevLLHhrRlJ2CicjGOEUxTuZPFzEpH8gtPB/Qc7dvKr6LCciH08f0csumWgtOQD8tFYL+9rNd+pfNMBMW4Rp8qg0r8HG/yLCP/CtMbZmfnYlGDIVZHL3v0xIhd6VvVu4IRQz1uqAkR1gU7NR6PNn7f4ZIJoow4dBrpXwjJXomujfpsxpPPamypQAC7VSsiVgoUnmlGZSy1aRvPRgeVd9Ti6TYyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBX0aIpnIUaKUAwZTfrn7DzcMpOI+YfOn9QeJP7C4fE=;
 b=Qftwo7inCgg2wuNTT8sVGUrgkK/iTZ0TC1LelOzm2n/LkXEJ17V2byGnmw0k6xBGzfOVXHMGc5IFZ91zB3WeYQbHChAv62rtFBiZn3tkpy/u94QmFm5WPqSs0ONSo6bDzZJPk53x/74mWJ6sY7G3oCC/uRxI/HBV+/SXts7aAZe24ifK5gfzJ1awHD4hWYYl+9uYKPZXenNmRfPNwjrf4Z1NI3pMKB3duTR4y9D/52MkT0HEfhkweUHzBifmFX6YHoVGG42n69fneIOd06Gq9wsO8K7o+nYL/Ue1LlusLBUR7vY8WYh4GK9ucM1b+I7zAUU+2dXuX+222/lJpqttHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBX0aIpnIUaKUAwZTfrn7DzcMpOI+YfOn9QeJP7C4fE=;
 b=SpuAgp8f2VDmS0Tj6scUTJ1KDdjikTZdVVof7ApKotQUzeoGrpWTUH6iN5BQX1z5ZxwIW5QmK4DTRNHevSMGB+TXDsXBFxFvjoGQ9ddCKF9tNazRJq18324SLkJvSbykS1fUDhFnS5NA4K7MZMJWB7yDA8QR6s0nbKoyPyuMaZ4=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 06/13] xen/arm: assign shared memory to owner when host
 address not provided
Thread-Topic: [PATCH v1 06/13] xen/arm: assign shared memory to owner when
 host address not provided
Thread-Index: AQHY+J1pmmYEajWz5UynKX+c5rdEZK6UzwiAgAEQoXA=
Date: Mon, 9 Jan 2023 07:49:48 +0000
Message-ID:
 <AM0PR08MB453041150588948050F718D4F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-7-Penny.Zheng@arm.com>
 <d7f12897-c6cc-0895-b70e-53c0b88bd0f9@xen.org>
In-Reply-To: <d7f12897-c6cc-0895-b70e-53c0b88bd0f9@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 346C653763857F478338C32F81DBCC90.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|DBBPR08MB6297:EE_|DBAEUR03FT043:EE_|AM9PR08MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: f06fa070-c870-43cd-c4ea-08daf2161de2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3CQWUNRbaIuJPXeSOGDKdCOwN3/TLoWtc1cRu+LGQrgiAYrjZq3GSayhx2aG7RVC938QSwLAvx4imlJlkmmNl2K1wQoseJIMN83sGt6LaA/ZVsI0QIa22oNiflF6jwiFEG76jEcfIzhr853CvTOb+bNGyTU0BNbq2Lyt+1Gp71L8bBONHQGRVQnEvJr7sRNfG/AsxayjQpLVSQSGAvgtv6Sr66lUmysEz6LmY66PIc7XnHhv73gMKViAJckJytOkti37Y8cYxG09m/DhhGIII+NUFL/0nIiRqgfv19Dw2ZOqfBV6plQhb5SkCuddGSFX/NYizfsPxo/0731hwzv9UT3EbT7nbf0dmRkOuu6jEkPCY0XF3Dau2SHUTWItB5kpAppmJ22Il9CYTEZbZbjQGd0A5zYQXRfdSJdp0GMyirkN2VVFffSkvlOVl/mI4/Jb3J9Ij/DTvypIa9K52udoLlKq2rxC3HsPJJVU2G1j9Gox9q7qJG9PImdCeOj1z7nNQVbaxp2fptIuwKE/lWY1pfcE2n3nytkYwf5zJiubUQNOvm3YOFCEhhWcBBjXrJ9I6ZT+aCV0P5LupHvQrNEaA3z61WLGS0lSXeA7PUjgFc8bVxDbobwADRQ8yArD1X+etYpNHyjDgQWvoHZNLvQJ/ry4XPgmHnKpNFFJEWaYwCIbUxRPRKN7At61jg7qxU5xbj0KU0bjqUTqAxgeUj8Feg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(33656002)(52536014)(41300700001)(83380400001)(64756008)(4326008)(76116006)(66946007)(66476007)(8676002)(38100700002)(66556008)(5660300002)(8936002)(66446008)(54906003)(110136005)(55016003)(9686003)(186003)(26005)(122000001)(7696005)(478600001)(38070700005)(53546011)(71200400001)(6506007)(86362001)(316002)(2906002)(66899015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6297
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d4f2de75-35b4-4ce7-c457-08daf2161539
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZWaYVQVRAFHk9cHwIouinG87iuoXAF6d06OCfVAMQahP/LHIzPVaHauoNYPbOODdAvyM5mhSaP9oPvHbzh6zeb6tuk2yZjA62YqzJcdi2n+OrYyqfhv3w0dHKPxWPeKFhqFab2yF2ymSKtl2NIDWjxk8Doj3+/COONt1SvoYMuPtCxMrGEYlFNAF4vPeX3D1nw4hprH+fQ9SqlBjUjZs8aCMwt4Os5TpQ/8USRXHP5s8hz8IwUahuzJCRSByGW0009lCiipt5KZYRSsVakiSPpoJlNgGHZkcLRlYMAFS+698Hj0EyWHbOVFN4Ia5rx+DPrcHBqnqa+qltvf0rfaLsPuLDgP/ZXUvC4aVOL6hZJM+7lhfVmUMQR2StG+i9dW44T8NSRWYoDXecc2tKsENL3JVCVIHnuhsPSqrbq2HirRr6r0bT6VVQqQ+JvlcFarC37Zh3ae9O5CRY2lnYthamB90cUZbLM3Gnv84zU2vqJP+UiSUxvGgF61C0G423Xf1VJqTU/XxEnJYKH3hvo49y/ChT0VjFvuez77agblp1Ic4udWGjy1/6PbHR5yJEnTeWIeQDkIHSGr8cpLyyJjNheb55sJbRQzkYnU1zms+Sd28auKNohiJOkPDCHYdxGy0FuyN2omqFLrAAMFkHdI3qfUoorjogFYQ7VXhpxlp73+zjLQTL1ArmHiqT2XhCn9rdDZUGCCBogPOpK6IaEGVNw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(33656002)(7696005)(2906002)(54906003)(110136005)(8676002)(70206006)(4326008)(316002)(70586007)(83380400001)(81166007)(82740400003)(47076005)(356005)(36860700001)(82310400005)(40460700003)(478600001)(9686003)(26005)(186003)(86362001)(40480700001)(55016003)(107886003)(6506007)(336012)(53546011)(66899015)(8936002)(52536014)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 07:50:03.0949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f06fa070-c870-43cd-c4ea-08daf2161de2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5889

SGkgSnVsaWVuDQoNCkhhcHB5IG5ldyB5ZWFyfn5+fg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFN1
bmRheSwgSmFudWFyeSA4LCAyMDIzIDg6NTMgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5a
aGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNv
bT47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MSAwNi8xM10geGVuL2FybTogYXNzaWduIHNoYXJlZCBtZW1v
cnkgdG8gb3duZXINCj4gd2hlbiBob3N0IGFkZHJlc3Mgbm90IHByb3ZpZGVkDQo+IA0KPiBIaSwN
Cj4gDQo+IE9uIDE1LzExLzIwMjIgMDI6NTIsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEBAIC05
MjIsMzMgKzkyNyw4MiBAQCBzdGF0aWMgbWZuX3QgX19pbml0DQo+IGFjcXVpcmVfc2hhcmVkX21l
bW9yeV9iYW5rKHN0cnVjdCBkb21haW4gKmQsDQo+ID4gICAgICAgZC0+bWF4X3BhZ2VzICs9IG5y
X3BmbnM7DQo+ID4NCj4gPiAgICAgICBzbWZuID0gbWFkZHJfdG9fbWZuKHBiYXNlKTsNCj4gPiAt
ICAgIHJlcyA9IGFjcXVpcmVfZG9tc3RhdGljX3BhZ2VzKGQsIHNtZm4sIG5yX3BmbnMsIDApOw0K
PiA+IC0gICAgaWYgKCByZXMgKQ0KPiA+ICsgICAgcGFnZSA9IG1mbl90b19wYWdlKHNtZm4pOw0K
PiA+ICsgICAgLyoNCj4gPiArICAgICAqIElmIHBhZ2UgaXMgYWxsb2NhdGVkIGZyb20gaGVhcCBh
cyBzdGF0aWMgc2hhcmVkIG1lbW9yeSwgdGhlbiB3ZSBqdXN0DQo+ID4gKyAgICAgKiBhc3NpZ24g
aXQgdG8gdGhlIG93bmVyIGRvbWFpbg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBpZiAoIHBhZ2Ut
PmNvdW50X2luZm8gPT0gKFBHQ19zdGF0ZV9pbnVzZSB8IFBHQ19zdGF0aWMpICkNCj4gSSBhbSBh
IGJpdCBjb25mdXNlZCBob3cgdGhpcyBjYW4gaGVscCBkaWZmZXJlbnRpYXRpbmcgYmVjYVBHQ19z
dGF0ZV9pbnVzZSBpcw0KPiAwLiBTbyBlZmZlY3RpdmVseSwgeW91IGFyZSBjaGVja2luZyB0aGF0
IGNvdW50X2luZm8gaXMgZXF1YWwgdG8gUEdDX3N0YXRpYy4NCj4gDQoNCldoZW4gaG9zdCBhZGRy
ZXNzIGlzIHByb3ZpZGVkLCB0aGUgaG9zdCBhZGRyZXNzIHJhbmdlIGRlZmluZWQgaW4NCnhlbixz
dGF0aWMtbWVtIHdpbGwgYmUgc3RvcmVkIGFzIGEgInN0cnVjdCBtZW1iYW5rIiB3aXRoIHR5cGUN
Cm9mICJNRU1CQU5LX1NUQVRJQ19ET01BSU4iIGluICJib290aW5mby5yZXNlcnZlZF9tZW0iDQpU
aGVuIGl0IHdpbGwgYmUgaW5pdGlhbGl6ZWQgYXMgc3RhdGljIG1lbW9yeSB0aHJvdWdoICJpbml0
X3N0YXRpY21lbV9wYWdlcyINClNvIGhlcmUgaXRzIHBhZ2UtPmNvdW50X2luZm8gaXMgUEdDX3N0
YXRlX2ZyZWUgfFBHQ19zdGF0aWMuDQpGb3IgcGFnZXMgYWxsb2NhdGVkIGZyb20gaGVhcCwgaXRz
IHBhZ2Ugc3RhdGUgaXMgZGlmZmVyZW50LCBiZWluZyBQR0Nfc3RhdGVfaW51c2UuDQpTbyBhY3R1
YWxseSwgd2UgYXJlIGNoZWNraW5nIHBhZ2Ugc3RhdGUgdG8gdGVsbCB0aGUgZGlmZmVyZW5jZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuDQoNCj4g
QnV0IGFzIEkgd3JvdGUgaW4gYSBwcmV2aW91cyBwYXRjaCwgSSBkb24ndCB0aGluayB5b3Ugc2hv
dWxkIGNvbnZlcnQNCj4ge3hlbixkb219aGVhcCBwYWdlcyB0byBhIHN0YXRpYyBwYWdlcy4NCj4N
Cg0KSSBhZ3JlZSB0aGF0IHRha2luZyByZWZlcmVuY2UgY291bGQgYWxzbyBwcmV2ZW50IGdpdmlu
ZyB0aGVzZSBwYWdlcyBiYWNrIHRvIGhlYXAuIA0KQnV0IG1heSBJIGFzayB3aGF0IGlzIHlvdXIg
Y29uY2VybiBvbiBjb252ZXJ0aW5nIHt4ZW4sZG9tfWhlYXAgcGFnZXMgdG8gYSBzdGF0aWMgcGFn
ZXM/DQogDQo+IFsuLi5dDQo+IA0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBhc3NpZ25fc2hhcmVk
X21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3Qgc2htX21lbWJhbmsgKnNobV9tZW1iYW5rLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IGdiYXNlKSB7DQo+ID4g
KyAgICBpbnQgcmV0ID0gMDsNCj4gPiArICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMsIG5yX2Jv
cnJvd2VyczsNCj4gPiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7DQo+ID4gKyAgICB1bnNp
Z25lZCBpbnQgaTsNCj4gPiArICAgIHN0cnVjdCBtZW1pbmZvICptZW1pbmZvOw0KPiA+ICsNCj4g
PiArICAgIC8qIEhvc3QgYWRkcmVzcyBpcyBub3QgcHJvdmlkZWQgaW4gInhlbixzaGFyZWQtbWVt
IiAqLw0KPiA+ICsgICAgaWYgKCBzaG1fbWVtYmFuay0+bWVtLmJhbmtzLm1lbWluZm8gKQ0KPiA+
ICsgICAgew0KPiA+ICsgICAgICAgIG1lbWluZm8gPSBzaG1fbWVtYmFuay0+bWVtLmJhbmtzLm1l
bWluZm87DQo+ID4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCBtZW1pbmZvLT5ucl9iYW5rczsg
aSsrICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHJldCA9IGFjcXVpcmVfc2hh
cmVkX21lbW9yeShkLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbWVtaW5mby0+YmFua1tpXS5zdGFydCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG1lbWluZm8tPmJhbmtbaV0uc2l6ZSwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdiYXNlKTsNCj4gPiArICAgICAgICAgICAgaWYg
KCByZXQgKQ0KPiA+ICsgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgIGdiYXNlICs9IG1lbWluZm8tPmJhbmtbaV0uc2l6ZTsNCj4gPiArICAgICAgICB9
DQo+ID4gKyAgICB9DQo+ID4gKyAgICBlbHNlDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcmV0
ID0gYWNxdWlyZV9zaGFyZWRfbWVtb3J5KGQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNobV9tZW1iYW5rLT5tZW0uYmFuay0+c3RhcnQsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNobV9tZW1iYW5rLT5tZW0uYmFuay0+c2l6ZSwg
Z2Jhc2UpOw0KPiA+ICsgICAgICAgIGlmICggcmV0ICkNCj4gPiArICAgICAgICAgICAgcmV0dXJu
IHJldDsNCj4gPiArICAgIH0NCj4gDQo+IExvb2tpbmcgYXQgdGhpcyBjaGFuZ2UgYW5kLi4uDQo+
IA0KPiA+ICsNCj4gPiAgICAgICAvKg0KPiA+ICAgICAgICAqIEdldCB0aGUgcmlnaHQgYW1vdW50
IG9mIHJlZmVyZW5jZXMgcGVyIHBhZ2UsIHdoaWNoIGlzIHRoZSBudW1iZXIgb2YNCj4gPiAgICAg
ICAgKiBib3Jyb3dlciBkb21haW5zLg0KPiA+IEBAIC05ODQsMjMgKzEwNzYsMzcgQEAgc3RhdGlj
IGludCBfX2luaXQgYXNzaWduX3NoYXJlZF9tZW1vcnkoc3RydWN0DQo+IGRvbWFpbiAqZCwNCj4g
PiAgICAgICAgKiBTbyBpZiB0aGUgYm9ycm93ZXIgaXMgY3JlYXRlZCBmaXJzdCwgaXQgd2lsbCBj
YXVzZSBhZGRpbmcgcGFnZXMNCj4gPiAgICAgICAgKiBpbiB0aGUgUDJNIHdpdGhvdXQgcmVmZXJl
bmNlLg0KPiA+ICAgICAgICAqLw0KPiA+IC0gICAgcGFnZSA9IG1mbl90b19wYWdlKHNtZm4pOw0K
PiA+IC0gICAgZm9yICggaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrICkNCj4gPiArICAgIGlmICgg
c2htX21lbWJhbmstPm1lbS5iYW5rcy5tZW1pbmZvICkNCj4gPiAgICAgICB7DQo+ID4gLSAgICAg
ICAgaWYgKCAhZ2V0X3BhZ2VfbnIocGFnZSArIGksIGQsIG5yX2JvcnJvd2VycykgKQ0KPiA+ICsg
ICAgICAgIG1lbWluZm8gPSBzaG1fbWVtYmFuay0+bWVtLmJhbmtzLm1lbWluZm87DQo+ID4gKyAg
ICAgICAgZm9yICggaSA9IDA7IGkgPCBtZW1pbmZvLT5ucl9iYW5rczsgaSsrICkNCj4gPiAgICAg
ICAgICAgew0KPiA+IC0gICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUg0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgIkZhaWxlZCB0byBhZGQgJWx1IHJlZmVyZW5jZXMgdG8gcGFnZSAlIlBSSV9t
Zm4iLlxuIiwNCj4gPiAtICAgICAgICAgICAgICAgICAgIG5yX2JvcnJvd2VycywgbWZuX3goc21m
bikgKyBpKTsNCj4gPiAtICAgICAgICAgICAgZ290byBmYWlsOw0KPiA+ICsgICAgICAgICAgICBw
YWdlID0gbWZuX3RvX3BhZ2UobWFkZHJfdG9fbWZuKG1lbWluZm8tPmJhbmtbaV0uc3RhcnQpKTsN
Cj4gPiArICAgICAgICAgICAgbnJfcGFnZXMgPSBQRk5fRE9XTihtZW1pbmZvLT5iYW5rW2ldLnNp
emUpOw0KPiA+ICsgICAgICAgICAgICByZXQgPSBhZGRfc2hhcmVkX21lbW9yeV9yZWYoZCwgcGFn
ZSwgbnJfcGFnZXMsIG5yX2JvcnJvd2Vycyk7DQo+ID4gKyAgICAgICAgICAgIGlmICggcmV0ICkN
Cj4gPiArICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4gPiAgICAgICAgICAgfQ0KPiA+ICAg
ICAgIH0NCj4gPiArICAgIGVsc2UNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwYWdlID0gbWZu
X3RvX3BhZ2UoDQo+ID4gKyAgICAgICAgICAgICAgICBtYWRkcl90b19tZm4oc2htX21lbWJhbmst
Pm1lbS5iYW5rLT5zdGFydCkpOw0KPiA+ICsgICAgICAgIG5yX3BhZ2VzID0gc2htX21lbWJhbmst
Pm1lbS5iYW5rLT5zaXplID4+IFBBR0VfU0hJRlQ7DQo+ID4gKyAgICAgICAgcmV0ID0gYWRkX3No
YXJlZF9tZW1vcnlfcmVmKGQsIHBhZ2UsIG5yX3BhZ2VzLCBucl9ib3Jyb3dlcnMpOw0KPiA+ICsg
ICAgICAgIGlmICggcmV0ICkNCj4gPiArICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAg
IH0NCj4gDQo+IC4uLiB0aGlzIG9uZS4gVGhlIGNvZGUgdG8gZGVhbCB3aXRoIGEgYmFuayBpcyBl
eGFjdGx5IHRoZSBzYW1lLiBCdXQgeW91IG5lZWQNCj4gdGhlIGR1cGxpY2F0aW9uIGJlY2F1c2Ug
eW91IHNwZWNpYWwgY2FzZSAib25lIGJhbmsiLg0KPiANCj4gQXMgSSB3cm90ZSBpbiBhIHByZXZp
b3VzIHBhdGNoLCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBzcGVjaWFsIGNhc2UgaXQuDQo+IElm
IHRoZSBjb25jZXJuIGlzIG1lbW9yeSB1c2FnZSwgdGhlbiB3ZSBzaG91bGQgbG9vayBhdCByZXdv
cmtpbmcgbWVtaW5mbw0KPiBpbnN0ZWFkIChvciB1c2luZyBhIGRpZmZlcmVudCBzdHJ1Y3R1cmUp
Lg0KPiANCg0KQSBmZXcgY29uY2VybnMgZXhwbGFpbmVkIHdoeSBJIGRpZG4ndCBjaG9vc2UgInN0
cnVjdCBtZW1pbmZvIiBvdmVyIHR3bw0KcG9pbnRlcnMgInN0cnVjdCBtZW1iYW5rKiIgYW5kICJz
dHJ1Y3QgbWVtaW5mbyoiLg0KMSkgbWVtb3J5IHVzYWdlIGlzIHRoZSBtYWluIHJlYXNvbi4NCklm
IHdlIHVzZSAic3RydWN0IG1lbWluZm8iIG92ZXIgdGhlIGN1cnJlbnQgInN0cnVjdCBtZW1iYW5r
KiIgYW5kICJzdHJ1Y3QgbWVtaW5mbyoiLA0KInN0cnVjdCBzaG1fbWVtaW5mbyIgd2lsbCBiZWNv
bWUgYSBhcnJheSBvZiAyNTYgInN0cnVjdCBzaG1fbWVtYmFuayIsIHdpdGgNCiJzdHJ1Y3Qgc2ht
X21lbWJhbmsiIGJlaW5nIGFsc28gYW4gMjU2LWl0ZW0gYXJyYXksIHRoYXQgaXMgMjU2ICogMjU2
LCB0b28gYmlnIGZvcg0KYSBzdHJ1Y3R1cmUgYW5kIElmIEkgcmVtZW1iZXJlZCBjbGVhcmx5LCBp
dCB3aWxsIGxlYWQgdG8gIm1vcmUgdGhhbiBQQUdFX1NJWkUiIGNvbXBpbGluZyBlcnJvci4gDQpG
V0lULCBlaXRoZXIgcmV3b3JraW5nIG1lbWluZm8gb3IgdXNpbmcgYSBkaWZmZXJlbnQgc3RydWN0
dXJlLCBhcmUgYm90aCBsZWFkaW5nIHRvIHNpemluZyBkb3duDQp0aGUgYXJyYXksIGhtbW0sIEkg
ZG9uJ3Qga25vdyB3aGljaCBzaXplIGlzIHN1aXRhYmxlLiBUaGF0J3Mgd2h5IEkgcHJlZmVyIHBv
aW50ZXINCmFuZCBkeW5hbWljIGFsbG9jYXRpb24uDQoyKSBJZiB3ZSB1c2UgInN0cnVjdCBtZW1p
bmZvKiIgb3ZlciB0aGUgY3VycmVudCAic3RydWN0IG1lbWJhbmsqIiBhbmQgInN0cnVjdCBtZW1p
bmZvKiIsDQp3ZSB3aWxsIG5lZWQgYSBuZXcgZmxhZyB0byBkaWZmZXJlbnRpYXRlIHR3byBzY2Vu
YXJpb3MoaG9zdCBhZGRyZXNzIHByb3ZpZGVkIG9yIG5vdCksIEFzDQp0aGUgc3BlY2lhbCBjYXNl
ICJzdHJ1Y3QgbWVtYmFuayoiIGlzIGFscmVhZHkgaGVscGluZyB1cyBkaWZmZXJlbnRpYXRlLg0K
QW5kIHNpbmNlIHdoZW4gaG9zdCBhZGRyZXNzIGlzIHByb3ZpZGVkLCB0aGUgcmVsYXRlZCAic3Ry
dWN0IG1lbWJhbmsiIGFsc28gbmVlZHMgdG8gYmUNCnJlc2VydmVkIGluICJib290aW5mby5yZXNl
cnZlZF9tZW0iLiBUaGF0J3Mgd2h5IEkgdXNlZCBwb2ludGVyICIgc3RydWN0IG1lbWJhbmsqIiB0
bw0KYXZvaWQgbWVtb3J5IHdhc3RlLg0KRm9yIHRoZSBkdXBsaWNhdGlvbiwgSSBjb3VsZCBleHRy
YWN0IHRoZSBjb21tb24gY29kZXMgdG8gbWl0aWdhdGUgdGhlIGltcGFjdC4NCg0KPiA+DQo+ID4g
ICAgICAgcmV0dXJuIDA7DQo+IA0KPg0KPiA+ICAgIGZhaWw6DQo+ID4gICAgICAgd2hpbGUgKCAt
LWkgPj0gMCApDQo+ID4gLSAgICAgICAgcHV0X3BhZ2VfbnIocGFnZSArIGksIG5yX2JvcnJvd2Vy
cyk7DQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcGFnZSA9IG1mbl90b19wYWdlKG1hZGRyX3Rv
X21mbihtZW1pbmZvLT5iYW5rW2ldLnN0YXJ0KSk7DQo+ID4gKyAgICAgICAgbnJfcGFnZXMgPSBQ
Rk5fRE9XTihtZW1pbmZvLT5iYW5rW2ldLnNpemUpOw0KPiA+ICsgICAgICAgIHJlbW92ZV9zaGFy
ZWRfbWVtb3J5X3JlZihwYWdlLCBucl9wYWdlcywgbnJfYm9ycm93ZXJzKTsNCj4gPiArICAgIH0N
Cj4gPiAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgfQ0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

