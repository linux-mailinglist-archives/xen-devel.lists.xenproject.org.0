Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF168C061
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 15:43:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490511.759242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2iE-0004Jc-FE; Mon, 06 Feb 2023 14:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490511.759242; Mon, 06 Feb 2023 14:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP2iE-0004Gz-CV; Mon, 06 Feb 2023 14:43:18 +0000
Received: by outflank-mailman (input) for mailman id 490511;
 Mon, 06 Feb 2023 14:43:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzyl=6C=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pP2iD-0004Gt-Hp
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 14:43:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9644f2dd-a62c-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 15:43:15 +0100 (CET)
Received: from AS9PR05CA0074.eurprd05.prod.outlook.com (2603:10a6:20b:499::28)
 by GV1PR08MB7873.eurprd08.prod.outlook.com (2603:10a6:150:5c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Mon, 6 Feb
 2023 14:43:03 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:499:cafe::31) by AS9PR05CA0074.outlook.office365.com
 (2603:10a6:20b:499::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 14:43:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 14:43:02 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Mon, 06 Feb 2023 14:43:02 +0000
Received: from 94d604d77588.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C15BF40-307F-46BE-A817-52CC592F00A5.1; 
 Mon, 06 Feb 2023 14:42:55 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 94d604d77588.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Feb 2023 14:42:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6373.eurprd08.prod.outlook.com (2603:10a6:20b:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 14:42:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 14:42:52 +0000
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
X-Inumbo-ID: 9644f2dd-a62c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slih/Dexk80MELkkF/r4v8l/LA9gWjYcjwUklT2awqU=;
 b=YCCd6omlmvbioAlECt0eIaOFPJs5V67ZFjaZzJvVdjwwGTAMG8UnTolAqePFIqfgVUOEUk+ncz9S2zjRxpJv9PfbKSpUDMuG+eIHzKLZNNn9hJg51SbuKgf+IlaxdBGUrCUUUzMWSbAqxQ2pHKQtqZaCz5MW5L3ZVZUxpDTnPdo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 66e4f3a2101329fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5/lJLJkRmtoyrtRL5GDd6fZ7ubtAYriZ4uxeLLOXgpXsFPnqYZj0M3s07YMcemeGT1FJso3cI0+r+dEzU43nDy1Deke3xKvJmEOLHDaiVvb38Ld5ux8tz+gYpp9g0lPElCzH8vp/qsW8TJIctvVZW6mMi6khrnUxqFp8r8INokn9MeFg1ZJCHO1ByJc7PuK6dp9uk/RkWqE3T8d4tijhenEP0oqyg0AE8Lq2hjvA7uAq+n6RN+7WK3Dj1MCFS+TMf8Vz1uRQiLWO/wnavsE3WFMQEC1U+JgNVmh3lSXB41iU2rC7rH2HoiK0C+XQAfTsewypqLH/aqBWD8yALfXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slih/Dexk80MELkkF/r4v8l/LA9gWjYcjwUklT2awqU=;
 b=QzdzyfRFbgDalF0kZhzbfk2jHZO6cuJ9qZCeYcr2BFi9oTF94cg5eppATIqjpvlqwX3g+KWmN1Jir4RUKOkFC4ivdjnc40KSq46EVLWICHn9qLUpstWdWpaF8HRIROsaGvjdo77DRKqPMMD23BdKl9rbYMPGCFk8gyBtr61DQjb5dZDdT0nyvM41jpJ7WomyFvFlVsnMGZ+g9/J6I4J/o1jSO+NJb5Zxi9eDNgmpV7QMHIMkGx3CjI3krTJLrdOBSa9w3HkIjI0m6xSYYMPdLFOViD7tf/l3TnBdok/n9zZtS1PTEVGdKFzwUof7broAIYKZ+WX2A4nD/e8QGNKiEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slih/Dexk80MELkkF/r4v8l/LA9gWjYcjwUklT2awqU=;
 b=YCCd6omlmvbioAlECt0eIaOFPJs5V67ZFjaZzJvVdjwwGTAMG8UnTolAqePFIqfgVUOEUk+ncz9S2zjRxpJv9PfbKSpUDMuG+eIHzKLZNNn9hJg51SbuKgf+IlaxdBGUrCUUUzMWSbAqxQ2pHKQtqZaCz5MW5L3ZVZUxpDTnPdo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 2/2] xen/device_tree: remove incorrect and unused
 dt_irq() and dt_irq_flags() macros
Thread-Topic: [PATCH v3 2/2] xen/device_tree: remove incorrect and unused
 dt_irq() and dt_irq_flags() macros
Thread-Index: AQHZOAMXy1ML+LQFIECFNoctrCf/pa7CAoAA
Date: Mon, 6 Feb 2023 14:42:50 +0000
Message-ID: <C6297387-8616-43BE-9640-3AE99BE164D6@arm.com>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-3-burzalodowa@gmail.com>
In-Reply-To: <20230203190908.211541-3-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6373:EE_|AM7EUR03FT040:EE_|GV1PR08MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f3c0f1-98b7-477a-9fe9-08db08507337
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IEOmcTsfTyGjQETk+ttWvy7kevVsWzZTyAVPRqEU6sDKd4Dbob+93LsNR7mbXYxGAGraTlY7VeJoSTKCaxWtejNuP1kkvkOuEf5jspAGlnDiiaKlf48477z7lKTbnZZMBjKpj1c5e4TJ9sC6ziaCo7Blit61kFGnWzFyOBgb7Qlmjo/vmQS7cDnKW6lb9dkCgWqgR/IDwZBf5/D9uIddDAelHmwQrCgbzJS0IAioEfdjkJEY1aJArAw4CRnOhy45Sw8gjxSWkFwZiQrKSsXORNuUYOyfAz6EAUduuAKerH1o45hUYCGQrm483Sx5sf5xWCK2jF8ALVpNdGMrLI4yEhyltNgL9PCrvotP/JwPZ6mya7VqySxjvHDELQ3tTW7rVPPHRU75uHpzO+4wEvQp8Ss3rWJf58SH68aCsVScSBp25jA/qvPbiQMaLK0SAcTPCPXhd7vT8l6l1cgcWuDZRnpZ0Ko8OZr+PMXZypgUNHN/MmY8xvFG7XwlKLclFT7O1feNVCrzVTdyxUVGfhBUt3VS3nxMGnkZem1EeVfkekeaRxiO+s5nSOplIABxq1hZazcyyWbYUHkMjsJH7n0OHzQ7mDxpQsxSkZuopybvRvXBEZLpLkBz8TArnDEJYca6eUzGyWjf4mzP+xWs/Od+PemTjB4kxmX5Lm58n91vHFI4MuMxDO2sri2ttpCP9zsyp/uLsZeIGZvtHDroyCo8TAuS9xbLTCewshV3mYIHmtY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199018)(478600001)(38100700002)(122000001)(38070700005)(36756003)(53546011)(6506007)(33656002)(186003)(6512007)(26005)(6486002)(86362001)(4326008)(76116006)(83380400001)(66946007)(91956017)(66556008)(2616005)(8676002)(6916009)(66476007)(64756008)(54906003)(316002)(66446008)(71200400001)(2906002)(41300700001)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE7D7CDCC50939428C836D2B3C2BA551@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6373
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d1b8189-7b53-4f4f-5db2-08db08506c2a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8xBIwY/YL1JQcnYzGe4FH4AnR1MeNKJnKKwEA/++lUb5d7M3a8Qbswdo8GAM2ppLIQSCeMaGuAXqx8fl4ivcK4hl2QF/PuUmxTBbVyhQMhfxMb7Y3XNLb+/QkK2BT6xhkPIzDiRd2Z+HzCqi8UJrzn8o4t5sZNWD3/noGQcXizBhycSnF6fcHQezBa1L2MS8Ne7sLXGtDafAkGhqfWA4/6gdPhWypoc/xrCa5+9N08VtPljvUc7y9ScCh2/dG67lvzJknWTbMC0DB1IrWX3nM4cv/7LfnbS8HSWqILxD3rSZ4UDqTyDnwrL/s7kpFnxvALNc+4JEwO/bolHoNur14qQNOeTVz+2pJVGX8fTDDydL86nEgeJCBRX+qjCa1IYq0xPYBWc83aRWd7ITr9aPH4Lov/8DluVY91u0Yr4OK02bnlCvEboMTwlBL8SNPXnGAgy5A39B3BSeLeips4fH7UaZb+A371OWhoNHz7QpPiYZsb/KUpgfs1NpU1fdN0/R4UOQ605mIH9vuxqKruUlIOH019fi0Jp0Hk1+yNmXDIXD+W2tBYFam4SUhsBQZyXB4zVUx06luryPDQoXyjtfpo+5ovbPQZoK555cqGFl1WgGCgERazZCzpJONZ0o7QqWhAr3twfj+k+zA0yAxhltHXQXmdZFc5FEG6J3F1edKuCRZez60VN3JVPMz5hRtPxSN0lqfnCiHNBeLJ73b3QXqw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199018)(36840700001)(40470700004)(46966006)(26005)(82740400003)(186003)(6512007)(36860700001)(5660300002)(81166007)(53546011)(336012)(8936002)(2906002)(6862004)(6506007)(33656002)(356005)(41300700001)(82310400005)(36756003)(2616005)(4326008)(316002)(6486002)(478600001)(70206006)(70586007)(8676002)(40460700003)(86362001)(54906003)(47076005)(83380400001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 14:43:02.5863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f3c0f1-98b7-477a-9fe9-08db08507337
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7873

DQoNCj4gT24gMyBGZWIgMjAyMywgYXQgMTk6MDksIFhlbmlhIFJhZ2lhZGFrb3UgPGJ1cnphbG9k
b3dhQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBNYWNybyBkdF9pcnEoKSBpcyBicm9rZW4gYmVj
YXVzZSB0aGUgbWFjcm8gcGFyYW1ldGVyIGhhcyB0aGUgc2FtZSBuYW1lIHdpdGgNCj4gdGhlIHN0
cnVjdCBkdF9pcnEgbWVtYmVyICJpcnEiLg0KDQpJ4oCZbSBub3Qgc3VyZSBhYm91dCB0aGUgd29y
ZGluZyDigJxicm9rZW7igJ0sIGl0IHNob3VsZCB3b3JrIGFueXdheSBvciBhbSBJIHdyb25nPw0K
DQo+IE1hY3JvIGR0X2lycV9mbGFncygpIGlzIGJyb2tlbiBhcyB3ZWxsIGJlY2F1c2Ugc3RydWN0
IGR0X2lycSBoYXMgbm8gbWVtYmVyDQo+IG5hbWVkICJmbGFncyIuDQoNClllcyB0aGlzIGRlcGVu
ZHMgaWYgdGhlIG1hY3JvIHdhcyBtZWFudCB0byBhY2Nlc3MgdGhlIHN0cnVjdHVyZSBkdF9pcnEs
IEnigJl2ZSBoYWQgYSBsb29rDQpvbiB0aGUgY29tbWl0IGludHJvZHVjaW5nIGl0IGJ1dCBJIGNv
dWxkIG5vdCBmaWd1cmUgb3V0IHRoZSB1c2FnZS4NCg0KPiANCj4gU2luY2Ugbm8gb25lIHNlZW1z
IHRvIGhhdmUgZXZlciB0cmllZCB0byB1c2UgdGhlbSBhbmQgZXZlbnR1YWxseSBzdHVtYmxlIHVw
b24NCj4gdGhlIGlzc3VlcyBhYm92ZSwgcmVtb3ZlIHRoZW0gaW5zdGVhZCBvZiBmaXhpbmcgdGhl
bS4NCj4gDQo+IEZpeGVzOiA4ODZmMzQwNDViZjAgKCJ4ZW4vYXJtOiBBZGQgaGVscGVycyB0byBy
ZXRyaWV2ZSBhbiBpbnRlcnJ1cHQgZGVzY3JpcHRpb24gZnJvbSB0aGUgZGV2aWNlIHRyZWUiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBYZW5pYSBSYWdpYWRha291IDxidXJ6YWxvZG93YUBnbWFpbC5jb20+
DQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gIC0gbmV3IHBhdGNoDQo+IA0KPiB4ZW4v
aW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCB8IDMgLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAzIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJl
ZS5oIGIveGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmgNCj4gaW5kZXggNzgzOWExOTllMzEx
Li4xOWE3NDkwOWNlY2UgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJl
ZS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oDQo+IEBAIC0xNTksOSAr
MTU5LDYgQEAgc3RydWN0IGR0X3Jhd19pcnEgew0KPiAgICAgdTMyIHNwZWNpZmllcltEVF9NQVhf
SVJRX1NQRUNdOw0KPiB9Ow0KPiANCj4gLSNkZWZpbmUgZHRfaXJxKGlycSkgKChpcnEpLT5pcnEp
DQo+IC0jZGVmaW5lIGR0X2lycV9mbGFncyhpcnEpICgoaXJxKS0+ZmxhZ3MpDQo+IC0NCj4gdHlw
ZWRlZiBpbnQgKCpkZXZpY2VfdHJlZV9ub2RlX2Z1bmMpKGNvbnN0IHZvaWQgKmZkdCwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBub2RlLCBjb25zdCBjaGFyICpu
YW1lLCBpbnQgZGVwdGgsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
MzIgYWRkcmVzc19jZWxscywgdTMyIHNpemVfY2VsbHMsDQo+IC0tIA0KPiAyLjM3LjINCj4gDQo+
IA0KDQpUaGV5IHNlZW1zIGluZGVlZCB1bnVzZWQsIHNvIGZvciBtZSB0aGUgY29kZSBsb29rcyBn
b29kOg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29t
Pg0KDQoNCg==

