Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7758D49DC3B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261285.452215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzqM-0003YG-Cd; Thu, 27 Jan 2022 08:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261285.452215; Thu, 27 Jan 2022 08:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzqM-0003Va-9F; Thu, 27 Jan 2022 08:09:22 +0000
Received: by outflank-mailman (input) for mailman id 261285;
 Thu, 27 Jan 2022 08:09:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nCzqK-0003Kd-Ja
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:09:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d36fda1-7f48-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:09:19 +0100 (CET)
Received: from AM6P192CA0094.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::35)
 by DBBPR08MB5548.eurprd08.prod.outlook.com (2603:10a6:10:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:09:16 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::9c) by AM6P192CA0094.outlook.office365.com
 (2603:10a6:209:8d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 08:09:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:09:16 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Thu, 27 Jan 2022 08:09:16 +0000
Received: from cd9263645637.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 614BA2E3-7A0E-47F9-B108-5BDD865EDCD1.1; 
 Thu, 27 Jan 2022 08:09:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd9263645637.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 08:09:07 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB6410.eurprd08.prod.outlook.com (2603:10a6:10:262::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 08:09:01 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 08:09:01 +0000
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
X-Inumbo-ID: 6d36fda1-7f48-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQnSvIPrioYZfrjh5gO0/XMTtkGStO9qRsZqgT58GSg=;
 b=GhuMZRONKpydTHx4D06yq6pivRSEK9cG9vKqhbwL0awGQ+Ey5tOOsMRqWYyK7UObcFzs2FLdFqPq63otEqq/Sbn0ca6eYfP26/upp5Hon+paFPUJ43POB0FN4iAO798hTOFlGyOeLSrC3YXgtduBAHEp7+stMsGmua76R7QzLMI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDvcrXOz4puo8l6fMu47I5hVP5aDVkDM7R9dSR0HVmAKWml9M+IkB0PgVfvVem9+i9hqvU+1PgWUtQGBNDbpuUi1v+veKtxEttDcJh/KXZ4Yqze2XQvHR8QfAzg/LeXUTo4ryxIJOVVE6tXmZFxdvbUcXAANHDph1d+0iLTOQwNMEqHZLfmPkBZGHg4sANI19Z9+RCUKAemLcgBsr3tOQYSuSO+ZL/y76Ki1eEqLmPxj4FdkFQqij1I8xBk3L6jVoY14vzqnD04Yq8feg5w1QxKZ2mvlE10mZ26mSmti3FIGIhlNCwy+nFpVMSnl4B3sZPaxBcWCZEFg+SgKfZHVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQnSvIPrioYZfrjh5gO0/XMTtkGStO9qRsZqgT58GSg=;
 b=JYW5cL3MscFrv4OhqGdxDKdbLby+c07mnxr6Yueme/Xqll8IzuqOvJHi2jpnhLXucAa5o14DO9PsZapgQWgqHGOsvr+WOjSu+3blayZLoFNOu6hkx2Nzxx9fxGsQXzh4npd2Cc0oS4haNjvIolgAKBnQuzhFVwQzqRucR4OwPF7BhUo84NxjUPDZengzWOJ8u2QS+bBE+yrxSOxjSh10bYkGQn1zerCkQLPajv1Gn0iTyOxFRmTOEkHziUWvrr8RmedvYrIdrPb/4RjZk+WS7YlYBCe9rBDXsHDcT98FTP9hmt+eDplQJUD0Z9JNoLEvombZw6jGWfPCQnR4G8OMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQnSvIPrioYZfrjh5gO0/XMTtkGStO9qRsZqgT58GSg=;
 b=GhuMZRONKpydTHx4D06yq6pivRSEK9cG9vKqhbwL0awGQ+Ey5tOOsMRqWYyK7UObcFzs2FLdFqPq63otEqq/Sbn0ca6eYfP26/upp5Hon+paFPUJ43POB0FN4iAO798hTOFlGyOeLSrC3YXgtduBAHEp7+stMsGmua76R7QzLMI=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 14/37] xen/x86: use name fw_numa to replace acpi_numa
Thread-Topic: [PATCH 14/37] xen/x86: use name fw_numa to replace acpi_numa
Thread-Index: AQHXsHMTdEf6BAAAdE2ZG0NU313E1ax0R1uAgAMBfOA=
Date: Thu, 27 Jan 2022 08:09:01 +0000
Message-ID:
 <PAXPR08MB74204141BBEEADC83AC92A6E9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-15-wei.chen@arm.com>
 <74c249c9-4c49-0f46-2b51-cf76fe450b9f@suse.com>
In-Reply-To: <74c249c9-4c49-0f46-2b51-cf76fe450b9f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F6022C611A49304F87641678C8920CAD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fde38ef9-243e-470f-c239-08d9e16c4ff6
x-ms-traffictypediagnostic:
	DB9PR08MB6410:EE_|AM5EUR03FT055:EE_|DBBPR08MB5548:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB5548901AA7DDDD1EBBAB57649E219@DBBPR08MB5548.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZQ/fYO5vlLQEV//ygILeXZuATgx9MGcUYL5iNrRWoTrPHj3FOnye1tEIRlG+KxUr/Ffj+3ncEvzwrqmCXlpLKImQEjqEkFOiY/SQ0L8LwNlPGY9jSrhWyhooH1Ar5lglOqfXh9LRcUBmVOLa65L9ETrl3leER1l7QReAFlaB1Fix1plXCVY5DEuqfdaJnMFkgBDs3s0UZg5H+11HS/+Y3KfUAecHyndk2ByMcMOBVaYOBYiquGyS5OtkauMMZll/2j9gDWQh2pWs7wA68ZqMjiEMO98cjHhhz/fjNZWE7y4mwyQ9O2p1+4sX6RpljTYrAGJMPQV8G9iCK9fvjh49SKKb1OyJyv4D/owV1yJQeCcLUdbGVMwPECNmRDt2zqr8sQNx++1Uh6RPCsrj80+sfCy7NmPyuWXZ9IY0x1qq6iTHkbNYIU4yQLzEOxQzyEVZzeC7t5wiBNo2540rNkg9BbaAy8cz5qqx9ULqC97hSk0dSfZiQJqKVI/n1cFuj7mQXluAkODo/qMxMDV7mRsqMbWL1YSumnMGC0dAtQTQLNkNEAj6IYonWlNu79t52ikyucUaLCOblqOq2ojciRhSsAFu91RiwK31vO4ydq/C5xNAAjaCLVxesLIY64Rh0FwfNgo8I1KE9Lrb5Vj3Y03LMUc2KDw2PwDe8syPYwtoM9ZkpxUrum3O1ro64xe13wvnnjLi/0dvLIVYt0RMNZVGMbWAPcWfc+2a2MlaKX3rI52/FBNVh1a5DRFnqU2l9JT6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(33656002)(8676002)(55016003)(66946007)(66476007)(66446008)(64756008)(4326008)(26005)(316002)(122000001)(83380400001)(186003)(54906003)(66556008)(71200400001)(76116006)(8936002)(38100700002)(52536014)(508600001)(53546011)(5660300002)(9686003)(6506007)(7696005)(38070700005)(2906002)(86362001)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6410
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aac7ac4f-f231-4e3a-49f2-08d9e16c4718
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bKO5ZywFD/uWrUWHtAVTWilJIh4fZTpd59hbo1/uK8GrJJ2UHre5uTaA4+J2vApnd5dRvoXx53P9W+r50afWEY5B8rjApjXlVi1xeO8vyyPdeGD3IKAN/AZd8501W8RWtmpB9o/EaeXH7b9JGjnyTC9FcAR0myz+1CZ0k1R8zrb3GxoEt5GDc0ZLEPm76Mka6GicwhZkXVkkDD4WB9Zr1fOd9pdNdgEc0tuwmD7Wu8PewvmffOvjQVVNmH7O4NPTNaoxJCxZEgf1povehKNJ4uoS6y7R7eVWCG9NBhaecCkNLfE2gcPd3N5HxPXR9Jc3E39ntHFX+ZvH3TsGvTEkyIUXXhzuBxJtMAb8kdjOxHEkJZ21r2S9IC++4jT3jxy7vRAB1bBu4sK26JmbwnQ8UVLU2RDGwUa/pyy833XZ3lsObJfEljoXBHUgafS5LiLEXIEGZTIxVZeJaIuhSblmEdeWywcOnN2SIvaO6iTwyOZ01tktzBAwAQ5DBOvJfVzYxHoy7NIQ5poMsNwgWYxw0dGYl6KGxsfJ5kt7as9rDu9vQHeAWTDDbg4L1f/23JF6wpFIn/XxxdWIXQQr6lm0sIiM9shUlc6o7G/EapL8mTcgk4ypIefN+q774ij6Kkd3Txayowcp3SwS/jPWI9v37SCpqJ7yYZFNExjVfKk/+vd4BeudCzY6qwfN1eOm8gYy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(40460700003)(54906003)(2906002)(52536014)(53546011)(186003)(26005)(6506007)(33656002)(316002)(9686003)(508600001)(7696005)(86362001)(55016003)(83380400001)(82310400004)(6862004)(336012)(70206006)(70586007)(8676002)(4326008)(8936002)(47076005)(81166007)(5660300002)(356005)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:09:16.3306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fde38ef9-243e-470f-c239-08d9e16c4ff6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5548

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAxODoxMw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDE0LzM3XSB4ZW4veDg2OiB1c2UgbmFtZSBmd19udW1hIHRvIHJlcGxhY2Ug
YWNwaV9udW1hDQo+IA0KPiBPbiAyMy4wOS4yMDIxIDE0OjAyLCBXZWkgQ2hlbiB3cm90ZToNCj4g
PiAtLS0gYS94ZW4vYXJjaC94ODYvbnVtYS5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L251bWEu
Yw0KPiA+IEBAIC01MSwxMSArNTEsMTEgQEAgY3B1bWFza190IG5vZGVfdG9fY3B1bWFza1tNQVhf
TlVNTk9ERVNdDQo+IF9fcmVhZF9tb3N0bHk7DQo+ID4gIG5vZGVtYXNrX3QgX19yZWFkX21vc3Rs
eSBub2RlX29ubGluZV9tYXAgPSB7IHsgWzBdID0gMVVMIH0gfTsNCj4gPg0KPiA+ICBib29sIG51
bWFfb2ZmOw0KPiA+IC1zOCBhY3BpX251bWEgPSAwOw0KPiA+ICtzOCBmd19udW1hID0gMDsNCj4g
DQo+IEluIHg4NiBjb2RlIEknZCBwcmVmZXIgdGhpcyB0byByZW1haW4gImFjcGlfbnVtYSIuIElm
IHlvdSBuZWVkIHRvIGFjY2Vzcw0KPiB0aGUgdmFyaWFibGUgZnJvbSB0by1iZWNvbWUtZ2VuZXJp
YyBjb2RlLCBpbnRyb2R1Y2UgYW4gaW5saW5lIHdyYXBwZXINCj4gKHBvc3NpYmx5IG5hbWVkIG51
bWFfbW9kZSgpKSwgYWxsb3dpbmcgeW91IHRvIGRvIHdoYXRldmVyIHlvdSBuZWVkIGluIHRoZQ0K
PiBEVCBjYXNlLiBJdCBtYXkgYmUgaGVscGZ1bCB0byBmb2xkIHRoaXMgd2l0aCBudW1hX29mZiB0
aGVuLCBzZWVpbmcgZS5nLg0KPiAuLi4NCj4gDQo+ID4gIGludCBzcmF0X2Rpc2FibGVkKHZvaWQp
DQo+ID4gIHsNCj4gPiAtICAgIHJldHVybiBudW1hX29mZiB8fCBhY3BpX251bWEgPCAwOw0KPiA+
ICsgICAgcmV0dXJuIG51bWFfb2ZmIHx8IGZ3X251bWEgPCAwOw0KPiANCj4gLi4uIHRoaXMuIEFj
dHVhbGx5IEkgdGhpbmsgdGhlIHVuZGVybHlpbmcgZW51bWVyYXRpb24gY291bGQgZXZlbiBiZSBt
YWRlDQo+IGdlbmVyaWM6DQo+IA0KPiBlbnVtIG51bWFfbW9kZSB7DQo+ICAgICBudW1hX29mZiwN
Cj4gICAgIG51bWFfb24sDQo+ICAgICBudW1hX2FjcGksDQo+IH07DQo+IA0KPiBpcywgSSBiZWxp
ZXZlLCBzdWZmaWNpZW50IHRvIGV4cHJlc3MgdGhlIHByZXNlbnQgKG51bWFfb2ZmLGFjcGlfbnVt
YSkNCj4gdHVwbGUuIEluIHRoaXMgY29udGV4dCBJJ2QgbGlrZSB0byBwb2ludCBvdXQgdGhhdCB0
aGUgdHdvIHVzZXMgb2YNCj4gYWNwaV9udW1hIGluIHNyYXRfcGFyc2VfcmVnaW9ucygpIGFuZCBz
cmF0X2RldGVjdF9ub2RlKCkgc2hvdWxkIGxpa2VseQ0KPiBiZSBpbnZvY2F0aW9ucyBvZiBzcmF0
X2Rpc2FibGVkKCkgaW5zdGVhZCwgdG8gYWxzbyB0YWtlIG51bWFfb2ZmIGludG8NCj4gYWNjb3Vu
dC4gVGhpcyB3b3VsZCB0aGVuIGJlIGFkZHJlc3NlZCBlZmZlY3RpdmVseSBhcyBhIHNpZGUgZWZm
ZWN0IGJ5DQo+IHJlcGxhY2luZyBvcGVuLWNvZGVkIHVzZXMgYXMgd2VsbCBhcyBzcmF0X2Rpc2Fi
bGVkKCkgYnkgbnVtYV9tb2RlKCkgKG9yDQo+IHdoaWNoZXZlciBuYW1lIHRoZSBuZXcgaGVscGVy
IHdvdWxkIGdhaW4pLg0KPiANCg0KWWVzLCB0aGF0IHNlZW1zIG1vcmUgcmVhc29uYWJsZSwgSSB3
aWxsIHRyeSB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KPiBKYW4NCg0K

