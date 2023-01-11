Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A7E66587F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 11:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475185.736758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFXxj-0004R8-EV; Wed, 11 Jan 2023 10:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475185.736758; Wed, 11 Jan 2023 10:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFXxj-0004Nl-Am; Wed, 11 Jan 2023 10:04:03 +0000
Received: by outflank-mailman (input) for mailman id 475185;
 Wed, 11 Jan 2023 10:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EETQ=5I=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFXxh-0004Na-LC
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 10:04:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42f6c161-9197-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 11:03:57 +0100 (CET)
Received: from AM7PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:20b:110::30)
 by AM0PR08MB5524.eurprd08.prod.outlook.com (2603:10a6:208:181::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Wed, 11 Jan
 2023 10:03:51 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::bf) by AM7PR04CA0020.outlook.office365.com
 (2603:10a6:20b:110::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 10:03:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 10:03:49 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Wed, 11 Jan 2023 10:03:49 +0000
Received: from 6cc083741620.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3732E506-27AA-445C-AA94-DE92036D4E13.1; 
 Wed, 11 Jan 2023 10:03:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6cc083741620.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Jan 2023 10:03:41 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV2PR08MB8653.eurprd08.prod.outlook.com (2603:10a6:150:b9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 10:03:35 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 10:03:35 +0000
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
X-Inumbo-ID: 42f6c161-9197-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FdgGnzcTccqMF0pRyxh6JcyPPsUhfbZpJF0BWhSYwI=;
 b=TIxDaFxn7VrWvIsPdtNXfLZap/p1LryxhoEtS0b0pYQ2sGYoYSGQH7ALEJYdCsx8U0R+m08xGr0LZkkxx7LThfIdn7OVtbDHIrFDsKRCmRM1MKbfbUT1VgDB/aVTRoeIrjaY1VbKgUNF5wxUTSIscGAikQu0a0NmCYd4UgnbkjA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fj43aJZRLaybNAfMNbF/jQaIPxYGVlGrNgqjDJsyQ3Du3tAj+p29X8MH+HqvgxPrR1nKOkBedVNCszrWbcI1V6+LfEpEoxds+l2KuEmR8dBfIEs+pRzr+wRJcX6vc7W303i81weqkPFsrF9zubYR+IwWRfiRb6ofgfO+s9k7JoF7V6a8BFYcutCbvZXQ5tJdPzlkRQrMP5baK3XmGObrYT4NnTSVgrkKYIwmcEV5aRf5opkOXJYAtM2aIOyOCnfSXkxy1Jax+OoNmlT4njWubbuivBf0HU7UvJOBzGfGhKc7O2txv3WRl/Yoza5hIYJktDcv2DEw6eF1hMieO8pwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FdgGnzcTccqMF0pRyxh6JcyPPsUhfbZpJF0BWhSYwI=;
 b=gfmHqUAa46aNnLC+saUoy8i6SQWYTCafw2wqNSia3zdrbDetvj8QmtZniLlBECFJtSAh5qX0JuF3mUyEP3fxQV202wg/+4LAmp5DtNmBD5ZM1xtjMJcg+PjCdOp0QselRYoUF0jnntZmJDrLaAwZOJTkdrcnoTxWIrWOmxyxbcYEKUFXC1sPw6VvFp2v41dZG8qoh+u+gcHdGX8vYGwj2kMK4qIHs50ctIjgSzeqepb+XC7t2riggDkBEYh5XBfJQx4VJY5lamoYZKA8JZcLyVpse0tw6Xq+d/j+xq6BdZWsf38i6DlB8YproVABf91eGJbTUI0x19x2VUtsQB4Rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FdgGnzcTccqMF0pRyxh6JcyPPsUhfbZpJF0BWhSYwI=;
 b=TIxDaFxn7VrWvIsPdtNXfLZap/p1LryxhoEtS0b0pYQ2sGYoYSGQH7ALEJYdCsx8U0R+m08xGr0LZkkxx7LThfIdn7OVtbDHIrFDsKRCmRM1MKbfbUT1VgDB/aVTRoeIrjaY1VbKgUNF5wxUTSIscGAikQu0a0NmCYd4UgnbkjA=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 01/17] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Topic: [PATCH v2 01/17] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Index: AQHZJNEWABvs02i6OUO2BkMLi8xulK6XauOAgAGQmoA=
Date: Wed, 11 Jan 2023 10:03:35 +0000
Message-ID:
 <PAXPR08MB742006EF0342233FC0ADC5729EFC9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-2-wei.chen@arm.com>
 <3c664437-7184-d4be-63e2-335942bb6a46@suse.com>
In-Reply-To: <3c664437-7184-d4be-63e2-335942bb6a46@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 07CD7E887D4AC040B11786254DD652AB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|GV2PR08MB8653:EE_|AM7EUR03FT040:EE_|AM0PR08MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf160cd-4391-4129-9bb5-08daf3bb22ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lecE4T+77r6OoSinuaugkRy0Rv/nC0FnrUfQh4kyCqKd+qFXXuTWT9RbSugQsmnQMLesMekJqyHHsRAp+ttksMhsRWEAPzA0RyIiff9mrAMlRTC6Cjxp8nNtV1xVeyppWEFBr6rvabnbkmlGFd2tKBntBgIA5BKJbijoKBe6ibTE+c72XLYEtHsXw8YKGHLc3gMSMJW9t7coUQqGnC9VJaw2tAwaUW746lBnxwgw18002HFX6OjOSPERyZK/BG/OXXA9xUVg7oUKYWFSSZ4/ET6fsbuMkxMI4QCyvmi5tcrHPUElYriuqvqSIMpK6D0swEk5kt4F55hRglx9/dxYcvhdSwCT+KEXCPMfXJVg0xOhMEqV7Z0RIJE5UmfnYjbqBujZpxlhsXI505q2KHdo2DdTBREByJswFzWLDFPQ16WaQylOc+VqEcMawfXuOCV+xLulVZ1WKRKxcXmuVKv8QwFggua/swvRDITBS6EBwXcbIoF/hmnJpCRaZ8ImXpgbC4zh+G2BkYhV4FkxjnheVCeY7BzWaLTWHqVkTcQXXVqOiVM/zeIiXJtSCYvAEQndev4u+0lNFFKUpj9rsYkZuIaSZ8tkBbHd8K93GPurWH2iSeVWiRKrX5gBNsuYKXyW9hhE08TuBUnRSPi7K5GxZEr28eDo5MeNfIEh2W3XVS/qu0EEsmluri3/6HgCXxm49M8jtSGmtLL84OlvQyeA7tTaYZGdkEAiLa/oO7npCGA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(122000001)(83380400001)(86362001)(38100700002)(2906002)(52536014)(5660300002)(41300700001)(8936002)(53546011)(55016003)(8676002)(186003)(9686003)(478600001)(26005)(6506007)(66476007)(66556008)(66946007)(4326008)(76116006)(64756008)(66446008)(316002)(54906003)(966005)(6916009)(71200400001)(7696005)(38070700005)(66899015)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8653
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2fd47b3b-e22c-453f-8527-08daf3bb1a62
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5VSa6Voml4XuKjfhIJwQY6ynh+GtVYmcIGkZ8mhOdhhtSm1qLPBgiv4mDRCrH/LGqkzFKgilEYjuLEP745NTiNhCpFSwIZ7wkFRv8eZm/Rm83RuTJdnW61n/E845WD8H8iJie01glOqhOnqsAX6K+EQTPKntTODS8MQqzOIkVXIlGQuY4qUi1adoOfXaNI6Hvg9fStWT/NHXIfMdRf8tcN8CMC+HW0N1tFOLG+6G53vg+x2cEUGMV61uKypjdpzbXFI9OK3bSdGvhwMpsoQ4hrXhv1rQGr12t+n5LdSlbdeEMAIXD/6I3z7cIeJOwgGWKLJDqHz7upzyPsMxSf/PmI3GR4RNhvN/0PaSjVVEWgEpLLxOvciJzHfzGFQ63Ydjj15Zx0uLqR54x9t9GALmy45SPm0D6JkPv/AxDAtO13uIvDNXKH5kLKpHFF/QZRvx8/jsH0Dw1chYL2OWmAo15E4kYFAKsF+E3b14Be/BU0aKorqXsUTJPDgj7O5el4V0N7Gg2FBJiy8uwIwSdoBDTldh0CtxnMSJhfXxwjjj64uh03LhW+Njcq+aob9mVDCvTZ8wqCxejD//3GN7UWaxm0frNHdMMWBnYtFVjKGUiZZFWRNRIZWpmtYSESL2egzKxxEuXMFIIYosKcDPqpAubBrRjOhkIXUklATNs+jBY+REkuSwSuzSpJlzQSsh4fnI7f67Lr/fvR+v0NEtVXfi9FCsFjhGbuRNdu+oPVy+scM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(52536014)(186003)(8936002)(6862004)(82740400003)(26005)(9686003)(478600001)(82310400005)(966005)(2906002)(40460700003)(316002)(54906003)(70586007)(55016003)(40480700001)(5660300002)(336012)(7696005)(70206006)(8676002)(81166007)(33656002)(4326008)(356005)(6506007)(66899015)(41300700001)(53546011)(47076005)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 10:03:49.6152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf160cd-4391-4129-9bb5-08daf3bb22ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5524

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyM+W5tDHmnIgxMOaXpSAxODowMA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbg0KPiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgV2VpDQo+IExpdSA8d2xAeGVuLm9y
Zz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDAxLzE3XSB4ZW4vYXJtOiB1c2UgTlJfTUVNX0JBTktTIHRvIG92ZXJyaWRlDQo+IGRlZmF1
bHQgTlJfTk9ERV9NRU1CTEtTDQo+IA0KPiBPbiAxMC4wMS4yMDIzIDA5OjQ5LCBXZWkgQ2hlbiB3
cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbnVtYS5oDQo+ID4gKysr
IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL251bWEuaA0KPiA+IEBAIC0zLDkgKzMsMjYgQEAN
Cj4gPg0KPiA+ICAjaW5jbHVkZSA8eGVuL21tLmg+DQo+ID4NCj4gPiArI2luY2x1ZGUgPGFzbS9z
ZXR1cC5oPg0KPiA+ICsNCj4gPiAgdHlwZWRlZiB1OCBub2RlaWRfdDsNCj4gPg0KPiA+IC0jaWZu
ZGVmIENPTkZJR19OVU1BDQo+ID4gKyNpZmRlZiBDT05GSUdfTlVNQQ0KPiA+ICsNCj4gPiArLyoN
Cj4gPiArICogSXQgaXMgdmVyeSBsaWtlbHkgdGhhdCBpZiB5b3UgaGF2ZSBtb3JlIHRoYW4gNjQg
bm9kZXMsIHlvdSBtYXkNCj4gPiArICogbmVlZCBhIGxvdCBtb3JlIHRoYW4gMiByZWdpb25zIHBl
ciBub2RlLiBTbywgZm9yIEFybSwgd2Ugd291bGQNCj4gPiArICoganVzdCBkZWZpbmUgTlJfTk9E
RV9NRU1CTEtTIGFzIGFuIGFsaWFzIHRvIE5SX01FTV9CQU5LUy4NCj4gPiArICogQW5kIGluIHRo
ZSBmdXR1cmUgTlJfTUVNX0JBTktTIHdpbGwgYmUgYnVtcGVkIGZvciBuZXcgcGxhdGZvcm1zLA0K
PiA+ICsgKiBidXQgZm9yIG5vdyBsZWF2ZSBOUl9NRU1fQkFOS1MgYXMgaXQgaXMgb24gQXJtLiBU
aGlzIGF2b2lkIHRvDQo+ID4gKyAqIGhhdmUgZGlmZmVyZW50IHdheSB0byBkZWZpbmUgdGhlIHZh
bHVlIGJhc2VkIE5VTUEgdnMgbm9uLU5VTUEuDQo+ID4gKyAqDQo+ID4gKyAqIEZ1cnRoZXIgZGlz
Y3Vzc2lvbnMgY2FuIGJlIGZvdW5kIGhlcmU6DQo+ID4gKyAqIGh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMS0NCj4gMDkvbXNnMDIzMjIuaHRt
bA0KPiA+ICsgKi8NCj4gPiArI2RlZmluZSBOUl9OT0RFX01FTUJMS1MgTlJfTUVNX0JBTktTDQo+
IA0KPiBCdXQgaXNuJ3QgTlJfTUVNX0JBTktTIGEgc3lzdGVtLXdpZGUgc2V0dGluZywgd2hpY2gg
ZG9lc24ndCByZWFsbHkNCj4gbWFrZSBzZW5zZSB0byB1c2UgYXMgYSBwZXItbm9kZSBvbmU/IElP
VyBhcmVuJ3QgeW91IG5vdyBhbGxvd2luZw0KPiBOUl9NRU1fQkFOS1MgcmVnaW9ucyBvbiBlYWNo
IG5vZGUsIHdoaWNoIHRha2VuIHRvZ2V0aGVyIHdpbGwgYmUNCj4gbXVjaCBtb3JlIHRoYW4gTlJf
TUVNX0JBTktTIHRoYXQgeW91IGNhbiBkZWFsIHdpdGggb24gdGhlIHdob2xlDQo+IHN5c3RlbT8N
Cj4gDQoNClRoYW5rcyBvZiBwb2ludGluZyBvdXQgdGhpcy4gWWVzIE5SX01FTV9CQU5LUyBhIHN5
c3RlbS13aWRlIHNldHRpbmcsDQpidXQgd2UganVzdCB1c2UgaXQgdG8gZGVmaW5lIHRoZSBNQVgg
bWVtb3J5IGJhbmtzIGZvciBzaW5nbGUgbm9kZSwNCnRoaXMgZG9lcyBub3QgbWVhbiB0aGF0IHRo
ZXJlIGFyZSByZWFsbHkgc28gbWFueSBiYW5rcyBvbiB0aGVzZSBub2Rlcy4NCldoZW4gYSBzeXN0
ZW0gb25seSBjb250YWlucyBvbmUgbm9kZSBOUl9NRU1fQkFOS1MgZXF1YWxzIHRvDQpOUl9OT0RF
X01FTUJMS1MuIE91ciBpZGVhIGlzIHRoYXQsIGlmIHRoZSB0b3RhbCBtZW1vcnkgYmFua3Mgb2YN
CmFsbCBub2RlcyBleGNlZWQgdGhlIE5SX01FTV9CQU5LUywgd2Ugd2lsbCBidW1wIE5SX01FTV9C
QU5LUy4NCg0KQnV0IEkgYW0gb3BlbiB0byB0aGlzIHF1ZXN0aW9uLCBpZiB0aGVyZSBhcmUgbW9y
ZSBzdWdnZXN0aW9ucyBmcm9tDQptYWludGFpbmVycy4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0K
DQo+IEphbg0K

