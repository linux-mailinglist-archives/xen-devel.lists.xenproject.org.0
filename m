Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879906EED93
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 07:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526464.818223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prXmw-00049j-DJ; Wed, 26 Apr 2023 05:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526464.818223; Wed, 26 Apr 2023 05:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prXmw-00047R-AJ; Wed, 26 Apr 2023 05:33:58 +0000
Received: by outflank-mailman (input) for mailman id 526464;
 Wed, 26 Apr 2023 05:33:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNUB=AR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prXmu-00047L-Mm
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 05:33:56 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eea6aa83-e3f3-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 07:33:54 +0200 (CEST)
Received: from DU2P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::15)
 by DU0PR08MB9370.eurprd08.prod.outlook.com (2603:10a6:10:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 05:33:47 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::2b) by DU2P250CA0010.outlook.office365.com
 (2603:10a6:10:231::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Wed, 26 Apr 2023 05:33:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 05:33:47 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Wed, 26 Apr 2023 05:33:47 +0000
Received: from 067581ce04cc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12E96CDC-DFC1-43BA-AE7D-D67BA066C3D7.1; 
 Wed, 26 Apr 2023 05:33:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 067581ce04cc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Apr 2023 05:33:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB10348.eurprd08.prod.outlook.com (2603:10a6:20b:57c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 05:33:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 05:33:39 +0000
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
X-Inumbo-ID: eea6aa83-e3f3-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HEs9Tlm6pz/CzNAbKA9WmPCBPTsr578UbZpamE1/rY=;
 b=c96dHdgMKujEpOo42hoGqhPiCTJtetSwnfW88+hFab1KUuqB3FSMfhzcD4jKVadtkC+HQy0nDXgnhZEq5q9x+L9P4PjzsqCh7sf7BzXeYtngy/GdnGjo0/1FMhT9P7QiBZZAVJbh36cOCeIiiso2g0mkXx43dLLj2wczY6MMIoQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9xXODhmXnXnVugNt6gS7Un44U5Th1E45pAKOXxt2e/xrNC36uyMIHKWzQTMI2rNJ7+xG20psq/KdO3a8JqBc9tP9+SBohLPe+G7q/wJei8uq78Zrik2BurZZ8qWSYjP1OOZ9x37b8/MBZ0znYhT3HyEMIdsvj8gvKFX9VVXg3luzv95P6bRlrDIVqchOfut1uM85usOTWNT4WrPHJ31JOCrYKdnk2dH4pB5j/Q++MNRaCHFvSSzEExajmJKcWyLalihHeRVaWtVFcEPceWuJQyUm05Xh3m+dsU7KgXMq1h9qkr4r2S77owSO66+KYTTIxB+7khIIAJLJHIG/OZtgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HEs9Tlm6pz/CzNAbKA9WmPCBPTsr578UbZpamE1/rY=;
 b=fMv2sD/YKpxAiIqiDLUKlVOQzeD6Ebu2Z5lEGkkhI6yEmw75jGL1U6nTjITafIMJRTHwBPNmZwExnym/WtjbDWXbYLKvG6jN6AiOlfhmNaCzzB+U+WCTEwBMV1HVybqAG3NS/ackREEjtPFEhhIMBUEytEdzHOqQURyin1I4+Mf2Oy+N+oFx5HzC3BlR/TaGBkzPj29R6NK2nUi7ChAtdA77GDxt7fm0J8JbWJpKNS0JG0nop4gbuPJu6/9WSeU65TTzMVJLeaLDmr391EL/hB2QIJ7dOvj2xmOHlQPyaMCcrh9i2ZKUaVy5vcW5PuKZuVutzvwusV+k7ZoNDn7DAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HEs9Tlm6pz/CzNAbKA9WmPCBPTsr578UbZpamE1/rY=;
 b=c96dHdgMKujEpOo42hoGqhPiCTJtetSwnfW88+hFab1KUuqB3FSMfhzcD4jKVadtkC+HQy0nDXgnhZEq5q9x+L9P4PjzsqCh7sf7BzXeYtngy/GdnGjo0/1FMhT9P7QiBZZAVJbh36cOCeIiiso2g0mkXx43dLLj2wczY6MMIoQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Index: AQHZd0ulMpqFICe/LUiDVq6+aDsW9687sveAgAFTkCA=
Date: Wed, 26 Apr 2023 05:33:39 +0000
Message-ID:
 <AS8PR08MB799117EDD6BAB892CAB870A192659@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
In-Reply-To: <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6B56B7C6B8EF6E49B2BD95D9754F6A85.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB10348:EE_|DBAEUR03FT060:EE_|DU0PR08MB9370:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e57fdc-6d65-4662-4001-08db4617cf0d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qk/22EgQDhnijF9h5pAO+4EqwfcVhHt4g5J22SW41s6Uv9UfF8n9XTn9xYqQMPR+55kW+2Ozyau8ldNLovVucCHXp37rOB/98OLG6DefO8buo5KVlhuytGXAe/G8Lp6dkjBg1zBMWeNa3obQVs6g3zIiUdbs3EB78NRw4xBlccT1itTdmKnyFxEyy19B2ejy8At5UyqSAfM38CftZz6lo3CvrpkcPADPkZQNsZhQ7kZ/1HiAg4ScqoSHOfdaeV3IWNoY7ZrSnejbRt5BDqRn9by+INCJbUMa/pYJQKjE+5d0pHVLuEhX9ppUYunbyKLgEp2JTPge91F3rmMOT9FDiDVgKjVpkGXRRdmJIFpd+KdqU2dX2Ym9W9HE0jwrSlsQ4iruAVq6AH0yVq1QdX9rwCOHKSTmYB6KGYIrL2HMsZs5qBQAAPvjPihMZ6A+zCP3RT5hdW8e8Rr8pSOFcSxtGSixCAg7ONN/kV6EO1LHUHv0B0T/vxi9ymRHkC+cEXdRnFl5V8g7Q9e/BCbyRl5C1E/m9s6zmuzjlrEOTsO9SCWfdblUSA6RlUU3V4iONQIr/lJvh9L2awFgFDxKA67vEDEcXJGy/L30OCB+IIRIZ2s2uKZGfZPE2Rd+0povnIZ3Aeemh5VrWviJl27HiOqg5g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(966005)(71200400001)(55016003)(2906002)(7696005)(83380400001)(86362001)(33656002)(66556008)(66476007)(8936002)(66946007)(316002)(478600001)(26005)(64756008)(66446008)(76116006)(6506007)(41300700001)(6916009)(9686003)(186003)(4326008)(38070700005)(122000001)(38100700002)(54906003)(8676002)(52536014)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10348
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c87df224-920d-445b-d42d-08db4617ca52
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JYeAUcf+QBxPJQ9NnZiljMUBShPZNCFEbeW8IZtdBf2w+uWINY9RGY3FVvb+pGkjjV/ndSfIFmHelylaOH5SzwnCqjgRsThJQMU7v8wpVS5/az+euEj+SrC0Cgu1WWOj54GnF5QHYKckUIqVBLO7wpiPL+A8g4WQ0VjabeVc3xSX2pMjK9DWulsK/J0l4ZRm3hS6re8noixSCLMfApcjAUE+TwLjvPNXIcy/Lv4hgdlP8IJ4fUdS71OJ/6lEU+5VACp/7IQGYAP+eHt1st8kcEceEnVWcIYWfoMY0SHFDnND7+NLbYpgtTwtVSEJwgY62YgTKLuE/xfxDync6AQfcY3VotPVUNiAaezrxVpOZENLBxwfiZwXAVOYVIcew04WkZVlAuMmbxcrok3GYZJ2ax0IIjuTrHWLz7xth1M7LXolS+1etXfJpx5oGdeEcBN2UwpM0Av+5FyOOKYUL2KpblMG9ckSm2gojmCcZHk2tEp1h/2AEJPFGVMIOKBWYvfwhJBSGBUK98C5JNT0Q+KtdjksS1PwOyOuF9DsZnBWQ10Mz3gvFNkpxVGpsYb1d+UNIED/1qTa9Kb6d4GZOGXeoBCPl8eJaRL2TF4/G2bc1wWwaHrGOYYftDQ+eB9Nw6H6hU4+9ExSC/RmrZMDOkQH4Se448kxAHul12qNmxrd6e1p8VT810HeAO6FgFPd4kGmRceJknsgi7O+R7pJkY0/vFC1DVkDLA9dh6DHf6mY9zmxIbDctnDPEQIRLEuWXFj4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(36860700001)(81166007)(40460700003)(33656002)(6862004)(356005)(52536014)(5660300002)(55016003)(8676002)(40480700001)(316002)(8936002)(70586007)(70206006)(82740400003)(41300700001)(86362001)(4326008)(82310400005)(2906002)(966005)(83380400001)(47076005)(336012)(34070700002)(186003)(9686003)(6506007)(26005)(54906003)(7696005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 05:33:47.4845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e57fdc-6d65-4662-4001-08db4617cf0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9370

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwOS8xN10g
eGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRldmljZQ0KPiB0cmVlIE5VTUEg
ZGlzdGFuY2UgbWFwDQo+IA0KPiA+ICsgICAgICAgIHVuc2lnbmVkIGludCBmcm9tLCB0bywgZGlz
dGFuY2UsIG9wcG9zaXRlOw0KPiANCj4gV2l0aCB0aGVzZSAuLi4NCj4gDQo+ID4gKyAgICAgICAg
ZnJvbSA9IGR0X25leHRfY2VsbCgxLCAmbWF0cml4KTsNCj4gPiArICAgICAgICB0byA9IGR0X25l
eHRfY2VsbCgxLCAmbWF0cml4KTsNCj4gPiArICAgICAgICBkaXN0YW5jZSA9IGR0X25leHRfY2Vs
bCgxLCAmbWF0cml4KTsNCj4gPiArICAgICAgICBpZiAoIChmcm9tID09IHRvICYmIGRpc3RhbmNl
ICE9IE5VTUFfTE9DQUxfRElTVEFOQ0UpIHx8DQo+ID4gKyAgICAgICAgICAgICAoZnJvbSAhPSB0
byAmJiBkaXN0YW5jZSA8PSBOVU1BX0xPQ0FMX0RJU1RBTkNFKSApDQo+ID4gKyAgICAgICAgew0K
PiA+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAg
ICAgICAgICJOVU1BOiBJbnZhbGlkIGRpc3RhbmNlOiBOT0RFIyUiUFJJdTMyIi0NCj4gPk5PREUj
JSJQUkl1MzIiOiUiUFJJdTMyIlxuIiwNCj4gDQo+IC4uLiB5b3UgZG9uJ3QgbWVhbiBQUkl1MzIg
aGVyZSBhbmQgLi4uDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgZnJvbSwgdG8sIGRpc3Rh
bmNlKTsNCj4gPiArICAgICAgICAgICAgZ290byBpbnZhbGlkX2RhdGE7DQo+ID4gKyAgICAgICAg
fQ0KPiA+ICsNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX0lORk8gIk5VTUE6IGRpc3RhbmNl
OiBOT0RFIyUiUFJJdTMyIi0NCj4gPk5PREUjJSJQUkl1MzIiOiUiUFJJdTMyIlxuIiwNCj4gDQo+
IC4uLiBoZXJlIGFuZCB5ZXQgZnVydGhlciBkb3duIGFueW1vcmUuIFRoYXQnbGwgYXQgdGhlIHNh
bWUgdGltZSBzaG9ydGVuDQo+IGFsbCB0aGVzZSBsaW5lcyBxdWl0ZSBhIGJpdC4NCg0KSSBkaWQg
YSBsaXR0bGUgYml0IGFyY2hlb2xvZ3kgdG8gY2hlY2sgdGhlIGRpc2N1c3Npb24gYmFjayB0byAy
IHllYXJzIGFnbyB3aGVuDQpXZWkgb3JpZ2luYWxseSBzZW50IHRoZSB2MSB0byB0aGUgbWFpbGlu
ZyBsaXN0LiBDaGFuZ2luZyAldSB0byAlIlBSSXUzMiIgd2FzDQpvbmUgb2YgdGhlIGNvbW1lbnQg
YXQgdGhhdCB0aW1lIFsxXSB3aGVuIHRoZXNlIHZhcmlhYmxlcyB3ZXJlIGRlZmluZWQgYXMNCnVp
bnQzMl90LiBCdXQgbm93IHdpdGggdGhlc2UgdmFyaWFibGVzIGJlaW5nIHVuc2lnbmVkIGludCBJ
IHRoaW5rIG5vdyAldSBpcw0KYSBtb3JlIHByb3BlciB3YXkgaGVyZS4gSSB3aWxsIGRvIHRoZSBh
Y2NvcmRpbmcgY2hhbmdlcyBpbiB2NS4NCg0KPiANCj4gPiArICAgICAgICAgICAgICAgZnJvbSwg
dG8sIGRpc3RhbmNlKTsNCj4gPiArDQo+ID4gKyAgICAgICAgLyogR2V0IG9wcG9zaXRlIHdheSBk
aXN0YW5jZSAqLw0KPiA+ICsgICAgICAgIG9wcG9zaXRlID0gX19ub2RlX2Rpc3RhbmNlKHRvLCBm
cm9tKTsNCj4gPiArICAgICAgICAvKiBUaGUgZGVmYXVsdCB2YWx1ZSBpbiBub2RlX2Rpc3RhbmNl
X21hcCBpcyBOVU1BX05PX0RJU1RBTkNFDQo+ICovDQo+ID4gKyAgICAgICAgaWYgKCBvcHBvc2l0
ZSA9PSBOVU1BX05PX0RJU1RBTkNFICkNCj4gDQo+IEFuZCB0aGUgbWF0cml4IHlvdSdyZSByZWFk
aW5nIGZyb20gY2FuJ3QgaG9sZCBOVU1BX05PX0RJU1RBTkNFIGVudHJpZXM/DQo+IEkgYXNrIGJl
Y2F1c2UgeW91IGRvbid0IGNoZWNrIHRoaXMgYWJvdmU7IHlvdSBvbmx5IGNoZWNrIGFnYWluc3QN
Cj4gTlVNQV9MT0NBTF9ESVNUQU5DRS4NCg0KTXkgdW5kZXJzdGFuZGluZyBmb3IgdGhlIHB1cnBv
c2Ugb2YgdGhpcyBwYXJ0IG9mIGNvZGUgaXMgdG8gY2hlY2sgaWYgdGhlIG9wcG9zaXRlDQp3YXkg
ZGlzdGFuY2UgaGFzIGFscmVhZHkgYmVlbiBzZXQsIHNvIHdlIG5lZWQgdG8gY29tcGFyZSB0aGUg
b3Bwb3NpdGUgd2F5DQpkaXN0YW5jZSB3aXRoIHRoZSBkZWZhdWx0IHZhbHVlIE5VTUFfTk9fRElT
VEFOQ0UgaGVyZS4NCg0KQmFjayB0byB5b3VyIHF1ZXN0aW9uLCBJIGNhbiBzZWUgeW91ciBwb2lu
dCBvZiB0aGUgcXVlc3Rpb24uIEhvd2V2ZXIgSSBkb24ndCB0aGluaw0KTlVNQV9OT19ESVNUQU5D
RSBpcyBhIHZhbGlkIHZhbHVlIHRvIGRlc2NyaWJlIHRoZSBub2RlIGRpc3RhbmNlIGluIHRoZSBk
ZXZpY2UNCnRyZWUuIFRoaXMgaXMgYmVjYXVzZSBJIGh1bnRlZCBkb3duIHRoZSBwcmV2aW91cyBk
aXNjdXNzaW9ucyBhbmQgZm91bmQgWzJdIGFib3V0DQp3ZSBzaG91bGQgdHJ5IHRvIGtlZXAgY29u
c2lzdGVudCBiZXR3ZWVuIHRoZSB2YWx1ZSB1c2VkIGluIGRldmljZSB0cmVlIGFuZCBBQ1BJDQp0
YWJsZXMuIEZyb20gdGhlIEFDUEkgc3BlYywgMHhGRiwgaS5lLiBOVU1BX05PX0RJU1RBTkNFIG1l
YW5zIHVucmVhY2hhYmxlLg0KSSB0aGluayB0aGlzIGlzIGFsc28gdGhlIHJlYXNvbiB3aHkgTlVN
QV9OT19ESVNUQU5DRSBjYW4gYmUgdXNlZCBhcyB0aGUgZGVmYXVsdA0KdmFsdWUgb2YgdGhlIGRp
c3RhbmNlIG1hcCwgb3RoZXJ3aXNlIHdlIHdvbid0IGhhdmUgYW55IHZhbHVlIHRvIHVzZS4NCg0K
PiANCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIC8qIEJpLWRpcmVjdGlvbnMgYXJl
IG5vdCBzZXQsIHNldCBib3RoICovDQo+ID4gKyAgICAgICAgICAgIG51bWFfc2V0X2Rpc3RhbmNl
KGZyb20sIHRvLCBkaXN0YW5jZSk7DQo+ID4gKyAgICAgICAgICAgIG51bWFfc2V0X2Rpc3RhbmNl
KHRvLCBmcm9tLCBkaXN0YW5jZSk7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgICAgIGVsc2UN
Cj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICAgICAq
IE9wcG9zaXRlIHdheSBkaXN0YW5jZSBoYXMgYmVlbiBzZXQgdG8gYSBkaWZmZXJlbnQgdmFsdWUu
DQo+ID4gKyAgICAgICAgICAgICAqIEl0IG1heSBiZSBhIGZpcm13YXJlIGRldmljZSB0cmVlIGJ1
Zz8NCj4gPiArICAgICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAgIGlmICggb3Bwb3NpdGUg
IT0gZGlzdGFuY2UgKQ0KPiA+ICsgICAgICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICAv
Kg0KPiA+ICsgICAgICAgICAgICAgICAgICogSW4gZGV2aWNlIHRyZWUgTlVNQSBkaXN0YW5jZS1t
YXRyaXggYmluZGluZzoNCj4gPiArICAgICAgICAgICAgICAgICAqDQo+IGh0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udW1hLnR4dA0K
PiA+ICsgICAgICAgICAgICAgICAgICogVGhlcmUgaXMgYSBub3RlcyBtZW50aW9uczoNCj4gPiAr
ICAgICAgICAgICAgICAgICAqICJFYWNoIGVudHJ5IHJlcHJlc2VudHMgZGlzdGFuY2UgZnJvbSBm
aXJzdCBub2RlIHRvDQo+ID4gKyAgICAgICAgICAgICAgICAgKiAgc2Vjb25kIG5vZGUuIFRoZSBk
aXN0YW5jZXMgYXJlIGVxdWFsIGluIGVpdGhlcg0KPiA+ICsgICAgICAgICAgICAgICAgICogIGRp
cmVjdGlvbi4iDQo+ID4gKyAgICAgICAgICAgICAgICAgKg0KPiA+ICsgICAgICAgICAgICAgICAg
ICogVGhhdCBtZWFucyBkZXZpY2UgdHJlZSBkb2Vzbid0IHBlcm1pdCB0aGlzIGNhc2UuDQo+ID4g
KyAgICAgICAgICAgICAgICAgKiBCdXQgaW4gQUNQSSBzcGVjLCBpdCBjYXJlcyB0byBzcGVjaWZp
Y2FsbHkgcGVybWl0IHRoaXMNCj4gPiArICAgICAgICAgICAgICAgICAqIGNhc2U6DQo+ID4gKyAg
ICAgICAgICAgICAgICAgKiAiRXhjZXB0IGZvciB0aGUgcmVsYXRpdmUgZGlzdGFuY2UgZnJvbSBh
IFN5c3RlbSBMb2NhbGl0eQ0KPiA+ICsgICAgICAgICAgICAgICAgICogIHRvIGl0c2VsZiwgZWFj
aCByZWxhdGl2ZSBkaXN0YW5jZSBpcyBzdG9yZWQgdHdpY2UgaW4gdGhlDQo+ID4gKyAgICAgICAg
ICAgICAgICAgKiAgbWF0cml4LiBUaGlzIHByb3ZpZGVzIHRoZSBjYXBhYmlsaXR5IHRvIGRlc2Ny
aWJlIHRoZQ0KPiA+ICsgICAgICAgICAgICAgICAgICogIHNjZW5hcmlvIHdoZXJlIHRoZSByZWxh
dGl2ZSBkaXN0YW5jZXMgZm9yIHRoZSB0d28NCj4gPiArICAgICAgICAgICAgICAgICAqICBkaXJl
Y3Rpb25zIGJldHdlZW4gU3lzdGVtIExvY2FsaXRpZXMgaXMgZGlmZmVyZW50LiINCj4gPiArICAg
ICAgICAgICAgICAgICAqDQo+ID4gKyAgICAgICAgICAgICAgICAgKiBUaGF0IG1lYW5zIGEgcmVh
bCBtYWNoaW5lIGFsbG93cyBzdWNoIE5VTUEgY29uZmlndXJhdGlvbi4NCj4gPiArICAgICAgICAg
ICAgICAgICAqIFNvLCBwbGFjZSBhIFdBUk5JTkcgaGVyZSB0byBub3RpY2Ugc3lzdGVtIGFkbWlu
aXN0cmF0b3JzLA0KPiA+ICsgICAgICAgICAgICAgICAgICogaXMgaXQgdGhlIHNwZWNhaWwgY2Fz
ZSB0aGF0IHRoZXkgaGlqYWNrIHRoZSBkZXZpY2UgdHJlZQ0KPiA+ICsgICAgICAgICAgICAgICAg
ICogdG8gc3VwcG9ydCB0aGVpciByYXJlIG1hY2hpbmVzPw0KPiA+ICsgICAgICAgICAgICAgICAg
ICovDQo+ID4gKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAiVW4tbWF0Y2hlZCBiaS1kaXJlY3Rpb24hIE5PREUjJSJQUkl1
MzIiLQ0KPiA+Tk9ERSMlIlBSSXUzMiI6JSJQUkl1MzIiLCBOT0RFIyUiUFJJdTMyIi0NCj4gPk5P
REUjJSJQUkl1MzIiOiUiUFJJdTMyIlxuIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBm
cm9tLCB0bywgZGlzdGFuY2UsIHRvLCBmcm9tLCBvcHBvc2l0ZSk7DQo+ID4gKyAgICAgICAgICAg
IH0NCj4gPiArDQo+ID4gKyAgICAgICAgICAgIC8qIE9wcG9zaXRlIHdheSBkaXN0YW5jZSBoYXMg
YmVlbiBzZXQsIGp1c3Qgc2V0IHRoaXMgd2F5ICovDQo+ID4gKyAgICAgICAgICAgIG51bWFfc2V0
X2Rpc3RhbmNlKGZyb20sIHRvLCBkaXN0YW5jZSk7DQo+IA0KPiBJdCB0b29rIG1lIGEgd2hpbGUg
dG8gdW5kZXJzdGFuZCB3aGF0IHRoZSBjb21tZW50IGlzIHRvIHRlbGwgbWUsDQo+IGJlY2F1c2Ug
aW4gdGhpcyBpdGVyYXRpb24gdGhlIG9wcG9zaXRlIGVudHJ5IHdhc24ndCBzZXQuIE1heSBJDQo+
IHN1Z2dlc3QgdG8gbWFrZSBtb3JlIGV4cGxpY2l0IHRoYXQgeW91IHJlZmVyIHRvIGFuIGVhcmxp
ZXIgaXRlcmF0aW9uLA0KPiBlLmcuIGJ5ICIuLi4gd2FzIHNldCBiZWZvcmUsIC4uLiI/DQoNClll
cywgdGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4gSSB3aWxsIG1ha2UgdGhlIGNvbW1lbnQg
bW9yZSBleHBsaWNpdA0KYXMgeW91IHN1Z2dlc3RlZC4NCg0KPiANCj4gPiArICAgICAgICB9DQo+
ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICtpbnZhbGlk
X2RhdGE6DQo+IA0KPiBOaXQ6IFN0eWxlIChsYWJlbHMgdG8gYmUgaW5kZW50ZWQgYnkgW2F0IGxl
YXN0XSBvbmUgYmxhbmspLg0KDQpTdXJlLiBXaWxsIGFkZCBhIHNwYWNlIGJlZm9yZS4NCg0KWzFd
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAy
MS0wOS9tc2cwMjA2Ni5odG1sDQpbMl0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDIzLTAxL21zZzAwNjkwLmh0bWwNCg0KS2luZCByZWdhcmRz
LA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

