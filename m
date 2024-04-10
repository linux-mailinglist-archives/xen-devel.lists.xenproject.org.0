Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8858F89F042
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 12:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703006.1098771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVdM-0007wq-3Q; Wed, 10 Apr 2024 10:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703006.1098771; Wed, 10 Apr 2024 10:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVdM-0007vD-0p; Wed, 10 Apr 2024 10:56:52 +0000
Received: by outflank-mailman (input) for mailman id 703006;
 Wed, 10 Apr 2024 10:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ruVdK-0007v6-K0
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 10:56:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06dc4c20-f729-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 12:56:47 +0200 (CEST)
Received: from AM0PR10CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::18)
 by VI1PR08MB5359.eurprd08.prod.outlook.com (2603:10a6:803:12f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 10:56:44 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::c1) by AM0PR10CA0038.outlook.office365.com
 (2603:10a6:20b:150::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.33 via Frontend
 Transport; Wed, 10 Apr 2024 10:56:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 10:56:44 +0000
Received: ("Tessian outbound e26069fc76b9:v300");
 Wed, 10 Apr 2024 10:56:43 +0000
Received: from 12f8e26cb141.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55BF8784-2B57-47D6-9C22-4A8E05821181.1; 
 Wed, 10 Apr 2024 10:56:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12f8e26cb141.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 10:56:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA6PR08MB10596.eurprd08.prod.outlook.com (2603:10a6:102:3d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 10:56:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 10:56:31 +0000
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
X-Inumbo-ID: 06dc4c20-f729-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cnYZa4BYZXSZe0evdslpCYqT4PIjsGXqiFnLqQXS0Y1bEbQmosTXfpown9CF0FcbYUrUGy3jfkQ7cBoCPMJMsfrcIoRgMnfgi+q6ESBOY4Ngk1copiWtf9fwwqsNbpmP3Bnrr3I05hc3GojMrsJUYdrseLSWM/onYNUuuRXVUpRqQwBKCMPOokY3PTLyMDtx7JBFGrHlVUZ7u0wmF4gBen6DRQyRoWl/aQpnY0HlNDW6V2i+E/xGcXck8ugINjDnX1uMl6og8baR01FlVpg1IkJ5FC3JDIWqQXCxTkxoHJmFDbMMlkt7CAVcgaa0kdHC9+rNaxJyTp6eJOQeo2RlsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fsC73++81eeedQtknHK4B8IVXnjeiza5AogDnYS240=;
 b=FZwPquNxfQp8ZarZhY3YAZMD07SsFKnzcad+k2zUpPgDeYDsreY+xIoiW4jWzkcGUUATc9yABAArHhfUXRlbTINjH3LsBcpfDkU/1My7QGff+NgtMSysyJz4bvK3prDGAJ+7xyOeSlPdmdhqN14YF+QJu25JA21YCCl+RXPipGOsqwpEH4FDB+ylq5nDI6bSHswpStyiW0s0vgMyBvYME3oywKs5sDi5L71eaDz6rFYgElilCvQH1qFl9tDkOgO8qt0//HlwP387DcBBeEnPd7RQDb56/eg/npWWvdyROQjIJqcVdi6PdroKXKhaoHXVMjYgtIpfcTa5YIAd9jSi2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fsC73++81eeedQtknHK4B8IVXnjeiza5AogDnYS240=;
 b=6J7vnKHaUL0QLE4G88qB5OK0Z2YJd5LMPy8jPSxA2hyGJzKtvFyZdw00aYhWJhRkEHJUVuuKQXRwCl+gqDpZ/NeB9DMSgMxjg/hdRpZRwOI0XY28jAYiiUxNnTB/3u4OfIvFMnZX2mH4/9DhzNRPrK7Bc+S9TxiuNl3fghC4s3A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee2bc378b9cc49fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrgmxmP43lBS5JzgLXiO/mI8/RmNNAgY0EJCsMJ4vlpQXJhB6xeKENlpuwEgpWatWjF53PWRjMGRG2oNEjg53YdVQBuh+uSsCir6T5fn7n9RXJtwNSaGndvZR+lsEfFchEvuyZf8JuQ4imQ/uI93j7pUDJrVPze/k9F08ql3s+6+gBCoJzx1GKqKJk7+0QECzzfhP6Wgm3HBCKFuhTe9MIYLVlfqlXQDr2k0tPQE4ULyIKcmuG/nwaZ0DL0YUN0NNxagZBSmhHyO51IDUeMsls+nyXuch4b2oP3oW4x72YbwiRdl0lxoINPq4lZDywHTSIA8pe4jbfKm3mf0PDNK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fsC73++81eeedQtknHK4B8IVXnjeiza5AogDnYS240=;
 b=XB539sxIVTKa8wCCJm3F6FWE+Ff8FND+qtvz9ghLlHMo90T8wKLFqmMJ3Q/t4+ZMRSw0lY4xDXPm/YvUBVQCEsJvZJEmsmYwso74eALiSWD0F6uFsEgQ8EaWf4hj9bmPeVeb4soOrwXsREtT+h/ruKANMqFwNTDGC7/ddN0Rd2FbpEws66c0i/2tqumjbJF7pZHoy7Tmq7OkVW4DQCo2BRaa2bpPjlQNvLxENh+Xg6Zo5n0PRGKot4CtO9VPvHzSawYnGp8thbL2UmVe8QnO5wQtwo70z6aPMj9yiWnVDmn5pVS6SGv9ww+KPI++C1JZ7hZ0TYiopszrF8Pvopvo9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fsC73++81eeedQtknHK4B8IVXnjeiza5AogDnYS240=;
 b=6J7vnKHaUL0QLE4G88qB5OK0Z2YJd5LMPy8jPSxA2hyGJzKtvFyZdw00aYhWJhRkEHJUVuuKQXRwCl+gqDpZ/NeB9DMSgMxjg/hdRpZRwOI0XY28jAYiiUxNnTB/3u4OfIvFMnZX2mH4/9DhzNRPrK7Bc+S9TxiuNl3fghC4s3A=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 09/13] xen/arm: Reduce struct membank size on static
 shared memory
Thread-Topic: [PATCH v2 09/13] xen/arm: Reduce struct membank size on static
 shared memory
Thread-Index: AQHainOQqOQ8ACmqS0SD80lqrmS1tLFhR1gAgAAPMQA=
Date: Wed, 10 Apr 2024 10:56:30 +0000
Message-ID: <045818A6-3E13-465B-8DB6-067877B8A035@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-10-luca.fancellu@arm.com>
 <36108be2-d950-4839-a2a6-06462de7e952@amd.com>
In-Reply-To: <36108be2-d950-4839-a2a6-06462de7e952@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA6PR08MB10596:EE_|AMS0EPF000001B5:EE_|VI1PR08MB5359:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LkOpEdzBAk36EWP7tURIrry8bMPVhv2uo6h3gqNfmHhYm7Vk2vvXCQ3mQ5R5VlyVU+2zM8T7GF+R1mptr5jBJqn6kZMhX8KMYXTbX43FW0v3dV3p//Xoz4XDluKAXaLAqWSnseMaTCGAIfwTeTvNWqrlPEiDv3ggydDykVHfSFDD7AT73Fkec/BtgdsgwvTYYD62rjHiZkiBEc5PO77dpFb/YR1yG3RMX9SdMlpGNnhpAZgqtsc9tfX0NOPKrhA6/1cWQwFF7IGvlvi1OX6g58PuyDDFvpm1WSvSRKm/TJh9eNfv+6HvACAuY8ob2bNnFMZBznJTQusHSk6W3WJwQtGJ52tAyBhcK0pSsmO0M/Vrvscgh3ZeApvLo9uQKES0GdPSdyQsXqcvcLRxw6mWZS7fqGKYnAV/zvqLArutY+pCKLRy9RtJ+gxHSo/XL1T5ix5mxGFuoYtYOjsicDL4BrjOPoY3d1T9wPdcfwBsGnVA9sEkDKT3CzXr0AFha93z+x6bfSKR49eBy76mefhWXgscLadmRWisdsmY5svOWK0WQexQCUAkPcz/qcSBrnRhoAnmNRUvaIXf30zoNatTgOQYZq+25sImz8qEbcl2RAvBdpmi5vOMa/TAf0bLYP+ozF/wkplJVr3wlIOtlyHjZ9t6xFUPId0Hbcg1PZkxQrg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D556A5458149D045875A8630627BFBEB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10596
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b570dba9-950e-4c72-fb9b-08dc594ce912
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	slEtdFAZf8fIEul8LP5Ymmn28GPnM/HmT1+CxnuvACg+wNTVpRe+cZZjDtTccqSBfg0NBZfDJgcePB8+nHqHULFT5gKmldznxUU7vYLwRqmst3a1rUUn52fGP3abvAHtZ+u0yum3IBLFNUNEEonTRfT8KiEgJBA5uPmZ9wpKCMHM1VoWUoEs4PilwzWaUUToVXMRmV7D3UoXRl6X9euqFZmCMDovRvV4+oSLbmSPRLH2uvigVhnaKPtG/xhk2zUKlVEIgcdJ+7goQZgJFCkbgT0y4zNFuzyaCMdGLwsAGWLVDfUh0cdtYWBhR6DEjmUcK29grRMtVcYg46CgEBs9JCLTxarGomxcDGDtCSOvnWU2aW+kQHEE6u5DmfqavL4wZb9inLTyjJqhLQ2uiz9uiMv0tSr/2aOkVIdUFyWTexnOVOZRCc23oC0AKFhc79Tj2JT0gD5qlO4kXPfuDgASS1mlt2KphBFZ2pKSSB7KTccO9SqLKuFJmp9YMPx/3mjGHnSuejLz3O3dCEssi4Yi7dCSa5UKyn1S9Tx8/ZelmQP+p/F4P0+1x4uyTxACKKCUWIagq7AGNvEjfJmMZlWsJu1NcgdTHNZGw18kpQt/0lOaIvw4Px8nJ0dKQiaBUScnbxxl62mUPDHchqo/qeO95VJI7buLESg7yYxR8I3L7tTzXvUjMpIUev9AVLe1+H9WJaLNNLwGMJaX6jApJB3/woj67QlwrVCeqe1Y/JTnFkSgkxbpDyWEMJQuAfht34MN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 10:56:44.2021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b570dba9-950e-4c72-fb9b-08dc594ce912
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5359

SGkgTWljaGFsLA0KDQo+IE9uIDEwIEFwciAyMDI0LCBhdCAxMTowMSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMDkv
MDQvMjAyNCAxMzo0NSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IA0KPj4gDQo+PiBDdXJyZW50
bHkgdGhlIG1lbW9yeSBmb290cHJpbnQgb2YgdGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGZlYXR1
cmUNCj4+IGlzIGltcGFjdGluZyBhbGwgdGhlIHN0cnVjdCBtZW1pbmZvIGluc3RhbmNlcyB3aXRo
IG1lbW9yeSBzcGFjZQ0KPj4gdGhhdCBpcyBub3QgZ29pbmcgdG8gYmUgdXNlZC4NCj4+IA0KPj4g
VG8gc29sdmUgdGhpcyBpc3N1ZSwgcmV3b3JrIHRoZSBzdGF0aWMgc2hhcmVkIG1lbW9yeSBleHRy
YQ0KPj4gaW5mb3JtYXRpb24gbGlua2VkIHRvIHRoZSBtZW1vcnkgYmFuayB0byBhbm90aGVyIHN0
cnVjdHVyZSwNCj4+IHN0cnVjdCBzaG1lbV9tZW1iYW5rX2V4dHJhLCBhbmQgZXhwbG9pdCB0aGUg
c3RydWN0IG1lbWJhbmsNCj4+IHBhZGRpbmcgdG8gaG9zdCBhIHBvaW50ZXIgdG8gdGhhdCBzdHJ1
Y3R1cmUgaW4gYSB1bmlvbiB3aXRoIHRoZQ0KPj4gZW51bSBtZW1iYW5rX3R5cGUsIHdpdGggdGhp
cyB0cmljayB0aGUgJ3N0cnVjdCBtZW1iYW5rJyBoYXMgdGhlDQo+PiBzYW1lIHNpemUgd2l0aCBv
ciB3aXRob3V0IHRoZSBzdGF0aWMgc2hhcmVkIG1lbW9yeSwgZ2l2ZW4gdGhhdA0KPj4gdGhlICd0
eXBlJyBhbmQgJ3NobWVtX2V4dHJhJyBhcmUgbmV2ZXIgdXNlZCBhdCB0aGUgc2FtZSB0aW1lLA0K
Pj4gaGVuY2UgdGhlICdzdHJ1Y3QgbWVtYmFuaycgd29uJ3QgZ3JvdyBpbiBzaXplLg0KPj4gDQo+
PiBBZnRlcndhcmRzLCBjcmVhdGUgYSBuZXcgc3RydWN0dXJlICdzdHJ1Y3Qgc2hhcmVkX21lbWlu
Zm8nIHdoaWNoDQo+PiBoYXMgdGhlIHNhbWUgaW50ZXJmYWNlIG9mICdzdHJ1Y3QgbWVtaW5mbycs
IGJ1dCByZXF1aXJlcyBsZXNzDQo+IEkgd291bGQgZXhwZWN0IHNvbWUganVzdGlmaWNhdGlvbiBm
b3Igc2VsZWN0aW5nIDMyIGFzIHRoZSBtYXggbnVtYmVyIG9mIHNobWVtIGJhbmtzDQoNClNvIEkg
aGF2ZSB0byBzYXkgSSBwaWNrZWQgdXAgYSB2YWx1ZSBJIHRob3VnaHQgd2FzIG9rIGZvciB0aGUg
YW1vdW50IG9mIHNoYXJlZCBtZW1vcnkNCkJhbmtzLCBkbyB5b3UgdGhpbmsgaXQgaXMgdG9vIGxv
dz8gVGhlIHJlYWwgaW50ZW50aW9uIGhlcmUgd2FzIHRvIGRlY291cGxlIHRoZSBudW1iZXINCm9m
IHNoYXJlZCBtZW1vcnkgYmFua3MgZnJvbSB0aGUgbnVtYmVyIG9mIGdlbmVyaWMgbWVtb3J5IGJh
bmtzLCBhbmQgSSBmZWx0IDMyIHdhcyBlbm91Z2gsDQpidXQgaWYgeW91IHRoaW5rIGl0IG1pZ2h0
IGJlIGFuIGlzc3VlIEkgY291bGQgYnVtcCBpdCwgb3Igd2UgY291bGQgaGF2ZSBhIEtjb25maWcu
Li4NCg0KPj4gDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFu
Y2VsbHVAYXJtLmNvbT4NCj4gV2l0aCB0aGUgZmluZF91bmFsbG9jYXRlZF9tZW1vcnkoKSBpc3N1
ZSBmaXhlZDoNCj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5j
b20+DQoNClRoYW5rcywgSSB0b29rIHRoZSBvcHBvcnR1bml0eSB0byBpbXByb3ZlIHRoZSBjb21t
ZW50IGluIHRoYXQgZnVuY3Rpb24gaW4gdGhpcyB3YXksDQphZGRpbmcg4oCcICh3aGVuIHRoZSBm
ZWF0dXJlIGlzIGVuYWJsZWQpIjoNCg0KICAgICAqIDMpIFJlbW92ZSBzdGF0aWMgc2hhcmVkIG1l
bW9yeSAod2hlbiB0aGUgZmVhdHVyZSBpcyBlbmFibGVkKQ0KDQpQbGVhc2UgdGVsbCBtZSBpZiB0
aGF0IHdvcmtzIGZvciB5b3Ugc28gSSB3aWxsIGtlZXAgeW91ciBSLWJ5DQoNCkNoZWVycywNCkx1
Y2ENCg0KPiANCj4gfk1pY2hhbA0KDQo=

