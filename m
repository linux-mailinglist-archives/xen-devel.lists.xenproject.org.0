Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8A62EE47
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 08:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445448.700607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovvjS-0000LU-5y; Fri, 18 Nov 2022 07:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445448.700607; Fri, 18 Nov 2022 07:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovvjS-0000JA-3C; Fri, 18 Nov 2022 07:24:14 +0000
Received: by outflank-mailman (input) for mailman id 445448;
 Fri, 18 Nov 2022 07:24:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nf+F=3S=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ovvjR-0000J4-0m
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 07:24:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe6bbaf6-6711-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 08:24:10 +0100 (CET)
Received: from DB6PR0402CA0010.eurprd04.prod.outlook.com (2603:10a6:4:91::20)
 by AS8PR08MB6229.eurprd08.prod.outlook.com (2603:10a6:20b:295::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Fri, 18 Nov
 2022 07:23:59 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::b8) by DB6PR0402CA0010.outlook.office365.com
 (2603:10a6:4:91::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 18 Nov 2022 07:23:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 07:23:58 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 18 Nov 2022 07:23:58 +0000
Received: from 3390b3204ecb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C681113F-00C2-46B5-A530-4F516327FBEC.1; 
 Fri, 18 Nov 2022 07:23:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3390b3204ecb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 07:23:51 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAVPR08MB9083.eurprd08.prod.outlook.com (2603:10a6:102:325::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Fri, 18 Nov
 2022 07:23:49 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::f1f:9833:4db3:45a5]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::f1f:9833:4db3:45a5%5]) with mapi id 15.20.5857.008; Fri, 18 Nov 2022
 07:23:49 +0000
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
X-Inumbo-ID: fe6bbaf6-6711-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njh4Ebq0MieMmAh+x0JIcpyOp86UX3Tu/y5PfSFeCHA=;
 b=MFO5r4LIc4knEBedY3bPb5FB6x4tYZZaBygxXw6DynUGiU6U0qOxMurw0KjLXYkiMsqz+wwNnKtME0cERxA/1ZhrW7HZEIhls71C2enuaK9uGDqeFqskUn0gEakdMjL0rr6Qi4rdIa3YC1eq2II3qESlPJLU9jYuTlzGFrTE+LU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1pAEocPjQGvTFIw1SclwIdYz3XEQCOdj1lIzB9J4yy3s1XKvIYJF8FQjI6R9yABOBW39YILWyzPj+Q+GMgi0mILVJxRL7sbXRYgmkMI6MHspjGWlaCeXL49E4dIEXZ/r10WBgbALiXb+lW/sJsvrFacfZG0Beb2Oo1hE2yBHJlYjNYImsif5qBxuMp2JT0kuxn7ylq2RbWS2bW5TCoAq8f9HVPRJhDFXzy9zhcZiSE68j5Nejr9b0PXLl7JW+HNfPtx1ASoWMhV1+O8khsoiv53ifiILyHH4wSwe+xYeN8je+ce5l55OL8qLqVAegx0BRUnErbk5JY6KJ9IGyhCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njh4Ebq0MieMmAh+x0JIcpyOp86UX3Tu/y5PfSFeCHA=;
 b=QacOTd6b7kwLHhCBuutAMn1/N+PuB1KA+wvw5j60NZiCNtM7viTJBifBg9m21DRmtf3htXN0gDPyMWXPhGWMO+7YqFYCe5KC9FZFwnkjfhry5xLOJgTFynEiERPgCWnAQyuT/n0dI+f4ZcigfXD0Gupd9DmrLPb8AAsJE1gG9m5zZC5MWTeoLgL1ynASC03UFv7AegdKeIJrlwZf5X7xxtdk4Bq6x1fKKsC+k6boDGccSfgbNzldtZ6JVEvCMazYfBwKu0EaUUR7HzekbsNoNLRlBJ2HsVgR+wcy4vyLQjAJM+55FIU1nwAl0g63txMfDQTpV3HzaEbILXc4wLkawQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njh4Ebq0MieMmAh+x0JIcpyOp86UX3Tu/y5PfSFeCHA=;
 b=MFO5r4LIc4knEBedY3bPb5FB6x4tYZZaBygxXw6DynUGiU6U0qOxMurw0KjLXYkiMsqz+wwNnKtME0cERxA/1ZhrW7HZEIhls71C2enuaK9uGDqeFqskUn0gEakdMjL0rr6Qi4rdIa3YC1eq2II3qESlPJLU9jYuTlzGFrTE+LU=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Thread-Topic: [PATCH v8 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Thread-Index: AQHY9/NJEyK+3mrs5EOr3Uxa6OTCSq5DRUeAgAEC0+A=
Date: Fri, 18 Nov 2022 07:23:49 +0000
Message-ID:
 <PAXPR08MB7420900BB3104ABEAD330F6A9E099@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221114063451.473711-1-wei.chen@arm.com>
 <20221114063451.473711-6-wei.chen@arm.com>
 <4e961ee5-2b4e-721a-9406-9dde7ba5e672@suse.com>
In-Reply-To: <4e961ee5-2b4e-721a-9406-9dde7ba5e672@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4B190D9D5272844C89EE8236B5E56ACA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|PAVPR08MB9083:EE_|DBAEUR03FT019:EE_|AS8PR08MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: fb00cdc1-0892-4613-5d7f-08dac935dbdc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lmqsTE+YDA2ROq3+32tvzCA6IksP9L0UvQ5Dm7bjs3vwe93QurIB1mYw8lU3j5yxrZWU7p070ilzrGjdycZDbGnyp1+t9ffb4LC0gAqYTlcL0uTr5brqYSKccS2xBIzHAWtDFT9kP149AmY6+eUAxAknqKFmB5XpUlrokZYa/UKioVtOgXNEfMQrC9gWxhF6uF9MwjnrCoA3mqDsKUjkeoCSZVIEl8YA+/pzffHRKlmSJfPK0VRIX5zoHbaPo4hKb7CmGrml8peWq2dnCsr+I+BS3iPYQPAGI9XtaPb6Wq9A2xynZQZWvfsmAGHwF/np8AbG9jzI+fqMZ61S+D4TdI3P8TW4uuhJGtDY0sBG6i4iNsJrZXR32dv4fDRZMPJsoDrrKCAGcuGU5JNtrB+CyZ5VO6DdlvmEO4gR28rWlCYM8vw1GMV7JiEKDY9jWg+WBBsJJpC3tm/wS1E/y+nvrd0IHJL+EEgW1aq4hsXrxT1wcLVyb7SLTdzYzULizXmk2AJNbJEwRZ+zHbhw+F99B1Xy2LzhLWKMDvDeaIDRk5ziW92C10C1hOx1EeuOhf5rr3GXWFWlsE0yp1+i6fhZZ8GZoweezQ+yUxU8aZWsz0hIU6qCuJ2ORAck7ak5GU2Q6uXhpea5q0iWjlPF3qFdkA7HKEQTIy+Y2j3TbAZijfoC7hBGVVlgfZFkIeYGjp1aB+QjZgn6GVKoPkDURG64GA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199015)(2906002)(86362001)(26005)(71200400001)(6506007)(7696005)(9686003)(52536014)(66946007)(64756008)(76116006)(5660300002)(66476007)(8936002)(66446008)(4326008)(8676002)(66556008)(41300700001)(33656002)(55016003)(316002)(6916009)(38070700005)(478600001)(38100700002)(122000001)(83380400001)(54906003)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9083
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eee93844-7fe1-4f91-312d-08dac935d687
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FkPYAobq5CchxrVtiIaAwxqU6klb0cS4n0sWUtq4YRpMciIy/yfSdzOGZsGn9FyEP0EMAiW1OpF9W46+5bYZ51PmpL2LxUjYlQRjW+jdtUMnfmZhbkIXyqexHLW/C/eZmgvQZcQiViBSCFwqq7vwbbn0nzJc7qwiaF5r3PDckMAEyuciPRiC9+WkNJr1dT0x3kdGVlWALC4WoIuIL2Iw0BsiiDbpChTUCZRUj5S6VQkGfN6w2udEPOE8Ou/tn2bNw85+A764o6YdJ601f+WK1jDckBsgFjh429UoqLUpuEOPsAkzAYydN60BVvLG6Onif4saxmeAmCNiWfWIgM6TiuAaAoNdDPYR6mR+KE3Ah6UcDqJx7EaVOfk6eOSxcuwdwO2YVCSQaIi+Sj9YFnmkTOPhKm+1ustrpgHq2ERchIXy6r36do5zNAJDTrmrFLXW1T+HOhmZdTkdSgMzA+qqdkRbDkroLWQKBCFQkPr3jow6adC3dd/UFjEH2ejqoeGHELfsBtmJvRiKMyJJqTvD92Mb0LddTDMwz49lMnDMCktsfkFk1Kas61HZjpNprpmJdgNk69FsTdetMLM7NVAvcJb9pUIrYpwbA6X2HOo/0pmw2zqbnS//8oSeefxIDMyVIJWXIy04Wiyjd1+R1Nn7RoYUmbmT8IxT7hi92B4JStzDwfqJSyjySlh4x0pKwNQXW1xEGS+GjzAmwTHBViiDdw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(52536014)(82740400003)(8676002)(4326008)(40460700003)(70586007)(36860700001)(70206006)(47076005)(336012)(8936002)(186003)(40480700001)(33656002)(55016003)(2906002)(54906003)(316002)(6862004)(83380400001)(26005)(6506007)(7696005)(86362001)(9686003)(41300700001)(82310400005)(81166007)(478600001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 07:23:58.5448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb00cdc1-0892-4613-5d7f-08dac935dbdc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6229

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gdG8gcmV1c2UgdGhl
IGZ1bmN0aW9ucyBuYW1lcyBpbiBjb21tb24gY29kZSwgd2UgaGF2ZSByZW5hbWUgdGhlbQ0KPiA+
IHRvIG5ldXRyYWwgbmFtZXMgYXMgd2VsbC4NCj4gPg0KPiA+IFBYTSBpcyBhbiBBQ1BJIHNwZWNp
ZmljIGl0ZW0sIHdlIGNhbid0IHVzZSBpdCBpbiBjb21tb24gY29kZQ0KPiA+IGRpcmVjdGx5LiBB
cyBhbiBhbHRlcm5hdGl2ZSwgd2UgZXh0ZW5kIHRoZSBwYXJhbWV0ZXJzIG9mDQo+ID4gbnVtYV91
cGRhdGVfbm9kZV9tZW1ibGtzLiBUaGUgY2FsbGVyIGNhbiBwYXNzIHRoZSBQWE0gYXMgcHJpbnQN
Cj4gPiBtZXNzYWdlcycgcHJlZml4IG9yIGFzIGFyY2hpdGVjdHVyYWwgbm9kZSBpZC4NCj4gDQo+
IFRoZSB1c2Ugb2YgInByZWZpeCIgaGVyZSBtdXN0IGhhdmUgYmVlbiBzdGFsZSBmb3IgYSB3aGls
ZSwgcGVyaGFwcw0KPiByZXN1bHRpbmcgZnJvbSBhbiBpbmNvbXBsZXRlIHJlLXdyaXRlIG9mIHdo
YXQgd2FzIGhlcmUgZWFybGllciBvbj8NCj4gDQoNClllcywgSSBmb3Jnb3QgdG8gdXBkYXRlIHRo
aXMgZGVzY3JpcHRpb24gd2hlbiB3ZSdyZSBjaGFuZ2luZyB0aGUNCm1ldGhvZCBmcm9tIGV4dGVu
ZGluZyBwYXJhbWV0ZXIgdG8gdXNlIG51bWFfZndfbmlkX25hbWUuIEkgd2lsbA0KY29ycmVjdCBp
dC4NCg0KPiA+IC1zdGF0aWMgaW50IF9faW5pdCBub2Rlc19jb3Zlcl9tZW1vcnkodm9pZCkNCj4g
PiAtew0KPiA+IC0JdW5zaWduZWQgaW50IGk7DQo+ID4gLQ0KPiA+IC0JZm9yIChpID0gMDsgOyBp
KyspIHsNCj4gPiAtCQkJCX0NCj4gPiAtCQl9IHdoaWxlIChmb3VuZCAmJiBzdGFydCA8IGVuZCk7
DQo+ID4gLQ0KPiA+IC0JCWlmIChzdGFydCA8IGVuZCkgew0KPiA+IC0JCQlwcmludGsoS0VSTl9F
UlIgIk5VTUE6IE5vIE5PREUgZm9yIFJBTSByYW5nZTogIg0KPiA+IC0JCQkJIlslIlBSSXBhZGRy
IiwgJSJQUklwYWRkciJdXG4iLCBzdGFydCwgZW5kIC0gMSk7DQo+ID4gLQkJCXJldHVybiAwOw0K
PiA+IC0JCX0NCj4gPiAtCX0NCj4gPiAtCXJldHVybiAxOw0KPiA+ICsJbnVtYV9md19uaWRfbmFt
ZSA9ICJQWE0iOw0KPiANCj4gSSBndWVzcyB0aGlzIGNhbid0IGdvIHdpdGhvdXQgYSBjb21tZW50
LCBub3cgdGhhdCB3ZSBoYXZlIC4uLg0KPiANCg0KT2ssIGhvdyBhYm91dCBmb2xsb3dpbmcgY29t
bWVudDoNCiAgICAgIC8qDQogICAgICAgKiBJbiBhbiBleHRyZW1lbHkgdW5saWtlbHkgY2FzZSwg
c3JhdF9wYXJzZV9yZWdpb25zIG1pZ2h0IG5vdA0KICAgICAgICogYmUgY2FsbGVkLiBTbyBzZXQg
IlBYTSIgYmVmb3JlIHRoZSBmaXJzdCBjYWxsZXIgdG8gdXNlIGl0IHRvDQogICAgICAgKiBtYWtl
IGl0IG1vcmUgc2FmZS4NCiAgICAgICAqLw0KQW5kIC4uLg0KDQo+ID4gKwlpZiAoIW51bWFfdXBk
YXRlX25vZGVfbWVtYmxrcyhub2RlLCBweG0sIG1hLT5iYXNlX2FkZHJlc3MsIG1hLQ0KPiA+bGVu
Z3RoLA0KPiA+ICsJCQkJICAgICAgbWEtPmZsYWdzICYgQUNQSV9TUkFUX01FTV9IT1RfUExVR0dB
QkxFKSkNCj4gPiArCQludW1hX2Z3X2JhZCgpOw0KPiA+ICB9DQo+ID4NCj4gPiAgdm9pZCBfX2lu
aXQgYWNwaV9udW1hX2FyY2hfZml4dXAodm9pZCkge30NCj4gPiBAQCAtNTM0LDYgKzI5NSw3IEBA
IHZvaWQgX19pbml0IHNyYXRfcGFyc2VfcmVnaW9ucyhwYWRkcl90IGFkZHIpDQo+ID4gIAkgICAg
YWNwaV90YWJsZV9wYXJzZShBQ1BJX1NJR19TUkFULCBhY3BpX3BhcnNlX3NyYXQpKQ0KPiA+ICAJ
CXJldHVybjsNCj4gPg0KPiA+ICsJbnVtYV9md19uaWRfbmFtZSA9ICJQWE0iOw0KPiANCj4gLi4u
IHRoaXMgYXMgd2VsbC4gT3RoZXJ3aXNlIHNvbWVvbmUgbWF5IHNwb3QgdGhlIHJlZHVuZGFuY3kg
YW5kIGVpdGhlcg0KPiBwcm9wb3NlIHRvIGRyb3Agb25lLCBvciBpdCdsbCB0YWtlIHRoZW0gcXVp
dGUgYSBiaXQgb2YgdGltZSB0byBmaWd1cmUNCj4gd2h5IGJvdGggYXJlIHRoZXJlLiBJIHRob3Vn
aHQgdGhpcyB3b3VsZCBnbyB3aXRob3V0IHNheWluZywgc28gSSdtDQo+IHNvcnJ5IGZvciBub3Qg
bWFraW5nIHRoaXMgZXhwbGljaXQgZWFybGllciBvbi4NCg0KLi4uDQogICAgICAvKiBTZXQgIlBY
TSIgYXMgZWFybGllciBhcyB3ZSBjYW4gZm9yIHRob3NlIGZ1bmN0aW9ucyB3aWxsIHVzZSBpdC4g
Ki8NCj4gPiArCW51bWFfZndfbmlkX25hbWUgPSAiUFhNIjsNCg0KQ2hlZXJzLA0KV2VpIENoZW4N
Cg0KPiANCj4gSmFuDQo=

