Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D7B64A4C4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 17:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459843.717622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lhr-0000Ei-Qe; Mon, 12 Dec 2022 16:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459843.717622; Mon, 12 Dec 2022 16:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lhr-0000B4-NW; Mon, 12 Dec 2022 16:31:07 +0000
Received: by outflank-mailman (input) for mailman id 459843;
 Mon, 12 Dec 2022 16:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4jqX=4K=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p4lhr-0000Ay-4Z
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 16:31:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2058.outbound.protection.outlook.com [40.107.249.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ff25534-7a3a-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 17:31:05 +0100 (CET)
Received: from DBBPR09CA0042.eurprd09.prod.outlook.com (2603:10a6:10:d4::30)
 by AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Mon, 12 Dec
 2022 16:31:03 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::16) by DBBPR09CA0042.outlook.office365.com
 (2603:10a6:10:d4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 16:31:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 16:31:03 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Mon, 12 Dec 2022 16:31:03 +0000
Received: from 32c22159cb96.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA861A72-E22E-489D-AB21-20071F6F8D93.1; 
 Mon, 12 Dec 2022 16:30:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32c22159cb96.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Dec 2022 16:30:55 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PAWPR08MB9711.eurprd08.prod.outlook.com (2603:10a6:102:2ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Mon, 12 Dec
 2022 16:30:47 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5924.009; Mon, 12 Dec 2022
 16:30:47 +0000
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
X-Inumbo-ID: 5ff25534-7a3a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7v0H9dM0cYnw02ADRWPxuNzWqTPlELM43gCakoW97A=;
 b=OJEzABvLwganX2MwCPaRhv9ZEdBq9b7jFMfCxaxgscgAUaSHfIBQEHhnI86dZ+CAaGo7lq4Mb9kG4pFXBfjBGqXGP28o3iBN8pAuJY2Z1JkBlRdHNLUpMwWQv+tFJbKH+cdZ2bu937bcsb6Cze6jqVMyrY4rXIzbEt1SpRfM3Wc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e255d7a5928ccdea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFJIhIiV9RK/9Xz/q/rL8KXz3EwjssS7U+vDYnzh14z9hkimmzfxcnyhEfb0RK1khgzYJ+JwrnFK0EQhDu5jGPxVeZLGk6C6tNaBIChSxzpvSGzR/wrDmUXliHgJXdHEgUqgmNHhKV+nFeumoTFKAo1s2O3V+bvHsi5n6K+vgPEoJ6o6nesAoFKbDX7okR4gbAyWZCZ6Tyo65dVd4H0HuO4uKtK5CChzfQjHbnvsIkEZvv/ESf9TTRM9ukwD1CIs1cwzcXOp2FHLzMs7S7ttWeFLq9ExtU8hWbsGGPRSIzOWIbUTynqsXmf4cwdFfeSPK+rG2dnCYpgBdOE55VYmHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7v0H9dM0cYnw02ADRWPxuNzWqTPlELM43gCakoW97A=;
 b=GCvbOF6WPmjNFSAmpzMrRM/YnT8wulbGml3avoKV/UNzMqoJKgjOhs+Urm68SLjFCPi94AMJJo+8pbQ4bDVJe4N4zADyluXDoIr8UqidV7s7wNDXHTIqfMVHLwKf0ZnT8Ajszi2u240LOzW8j9GzTOB9/q43zfvNk3o6Z0+mWfUDM6eviIZwNwbUq6TUqwzTCV92kc54SyJIUKsn5uQa1J43Y/gNnNKROvYda1B9JcGlN8n1QfUH88pHcQ/sIy1NVf/tQnKqIdbSpIxoqGC2Vc98C/p1IpK8Lz/8JtWxQn2aFNbUUpuV9G74X+DkGy1qmh8dH0PtLEkQrrrBlz7tYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7v0H9dM0cYnw02ADRWPxuNzWqTPlELM43gCakoW97A=;
 b=OJEzABvLwganX2MwCPaRhv9ZEdBq9b7jFMfCxaxgscgAUaSHfIBQEHhnI86dZ+CAaGo7lq4Mb9kG4pFXBfjBGqXGP28o3iBN8pAuJY2Z1JkBlRdHNLUpMwWQv+tFJbKH+cdZ2bu937bcsb6Cze6jqVMyrY4rXIzbEt1SpRfM3Wc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: sisyphean <sisyphean@zlw.email>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [BUG]Add PCIE devie to SMMUv3 fail
Thread-Topic: [BUG]Add PCIE devie to SMMUv3 fail
Thread-Index: AQHZC5XCObk04ipFEE+2cKVjhEnU1a5lUAQAgARztoCAALM7gA==
Date: Mon, 12 Dec 2022 16:30:47 +0000
Message-ID: <5BCFEC7E-85B6-4464-A2B1-EA08C6E2EB20@arm.com>
References: <793eb471-e68b-c3ff-52e8-20d77252c0bf@zlw.email>
 <A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com>
 <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
In-Reply-To: <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|PAWPR08MB9711:EE_|DBAEUR03FT026:EE_|AS8PR08MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d90c19-7e48-4b70-6fdf-08dadc5e42b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AtB00ZBnNlM0YR82sJZZClbvPngc1ifC3PTWjbRzgxu2E23MliA6p1/TJjZlcxIpPMRzAD5b7lDe0LH/EMuLWyU1UdSVJPCB+IBa6EIzrHfFYDa3IlRONQWZXVI2faiCaGGhxjr0MbA9uNws+gQ/6X2yxygybl6/x/NubI5n3UXBcsYyAUjrYI5pDVXbso6gF6D+Oys+lK+8qAlMsOCtsQCk1hoUxd8mJwrFgQXaf+xQvBaFGBdg3tWkxvv75Kkuo6aYtYXWkiYGgMQtJfGd/apUFIzhCbOjh3bk1aEocmkOZtkMqFehaXFINGtUrDSd64Bu095cKJhU9oUvPoendNd4klbeOhBLu+8JeQdJy0Vw0zSv7PTj8wosj4FDfqSIDgySy3cqvGgsohthH96aFaB+x6bpiKPK7C6IpPf+LzNhf1ZEQpQXQStpktCqwmB7BaEtu81hd/KygKP/CEtrvyUphhAD0hTuC5TJJqsGh7zrcxnVxg4VCAu695ZlfF9mONDXb9rTyzonJDNxqCKE8CA+eZ+ztFxWg3b+szyLB69UHF4PWjnzHyNrWDRYXKctXkzCCYz74edqXSrV6KB6SxylCS7+hmU7JNngavlwHMeS39VgwbRyfLRNHtzJzkd6lIIJOywXXjPO7c7MowbJCgTS37d2xb1Um81P/KlPki1p1P/+FpS2abxT32jAdMbt+Q9RXIt4n4PbklX14tSRjXHi2XAgydUgdfpcSRb60aup0fXHuWcS+qATtCsw+5sfnUR6x6yu46qAlHIcVbUSSQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199015)(966005)(86362001)(33656002)(83380400001)(6506007)(316002)(6916009)(53546011)(186003)(6486002)(26005)(6512007)(38070700005)(71200400001)(478600001)(41300700001)(2616005)(8936002)(2906002)(5660300002)(91956017)(66446008)(64756008)(66476007)(8676002)(4326008)(38100700002)(66556008)(76116006)(122000001)(66946007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF797266F23F0B429425A6DE66D2ABF7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9711
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87c3cead-0786-402b-a853-08dadc5e3995
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FiPWWYExBm9UzFIFONDiWFuHQWMrGSnyerUbM/D7gva6nWe/bDwi5wZ6b9TaC7xUeXQsSFSeDzuT1IOBebdGvy6ogNVKDymfCpg4WPFRkXY5yMqsb8rUD+vFbPLOkZJS5F7LsQ7RUHtrLhXEwkaenDTKWBtodbKwpbkTn0mBxdQLpeot5tW60vjVy28tLhv8sEPct41iq8u8AEaig9CdDKL0zSD1k5gLIyLKku3HoY3wmKOBtittMPTBAuo/txG+y5ETmGNgLamJHIKUgyAqveMQF3sNePqHOf3Z4k6b4+AywXQHsUMuM4KbauLq8GCJeOraYIJGzYEo2WukewZU+EVVAaH1IVVV4WVGUlDuGnSWNDi/ZG7dlQ3lSF+N993bGFbXuzgaRUIw9FTcNIDe8gschr5hHwENbhRTAtc5sD1ICijo2aHAn3uzMRiTG+5ECsGdRvsHECb3BulThr27lz0SySqO0rC58+V7B5boOvtJwFp9F4At13yfrJiqpGCAprimzx91RtLrd8sUJ/Lbzjfc79fH+nYJj+MQ537uwQ9OHBnFU4Q45YXwNJ7TbSLtImWQ8nGyA4AGNI7lib2xoYJoeG9YQGWuYMYrpR0lafc1x7TM37/mWzMXIBt2nTc38Eit6pXZ0mAbx+hIYhj3bn1Ph6RPv3Gd5S8PO2Qx/AD4CS35TLEDOSoJIkrlo6XvdY5Dgk8HEx1SUrjAZVCO4pSA7t6u5oHTHLC9xKDWbF4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39850400004)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(33656002)(40460700003)(2906002)(6486002)(478600001)(966005)(86362001)(40480700001)(36756003)(356005)(2616005)(36860700001)(82310400005)(81166007)(47076005)(82740400003)(336012)(8676002)(186003)(5660300002)(6506007)(26005)(53546011)(6512007)(8936002)(6862004)(316002)(4326008)(70206006)(41300700001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 16:31:03.0701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d90c19-7e48-4b70-6fdf-08dadc5e42b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7696

SGkgU2lzeXBoZWFuLA0KDQo+IE9uIDEyIERlYyAyMDIyLCBhdCA1OjQ5IGFtLCBzaXN5cGhlYW4g
PHNpc3lwaGVhbkB6bHcuZW1haWw+IHdyb3RlOg0KPiANCj4gSGksDQo+IOWcqCAyMDIyLzEyLzkg
MTc6NTAsIFJhaHVsIFNpbmdoIOWGmemBkzoNCj4+IEhpIFNpc3lwaGVhbiwNCj4+IA0KPj4gPiBP
biA5IERlYyAyMDIyLCBhdCA2OjE1IGFtLCBzaXN5cGhlYW4gPHNpc3lwaGVhbkB6bHcuZW1haWw+
IHdyb3RlOg0KPj4gPiANCj4+ID4gSGksDQo+PiA+IA0KPj4gPiBJIHRyeSB0byBydW4gWEVOIG9u
IG15IEFSTSBib2FyZChTb3JyeSwgZm9yIHNvbWUgY29tbWVyY2lhbCByZWFzb25zLCBJIGNhbid0
IHRlbGwgeW91DQo+PiA+IG9uIHdoaWNoIHBsYXRmb3JtIEkgcnVuIFhFTikgIGFuZCBhZGQgUENJ
RSBkZXZpY2UgcGFzc3Rocm91Z2ggdG8gRG9tVS5CdXQgYW4gZXJyb3INCj4+ID4gb2NjdXJyZWQg
d2hpbGUgYWRkaW5nIHRoZSBQQ0lFIGRldmljZSB0byBTTU1VdjMuDQo+PiANCj4+IFBDSSBwYXNz
dGhyb3VnaCBzdXBwb3J0IGlzIG5vdCBmdWxseSB1cHN0cmVhbSB0byBYZW4gb24gQVJNLiBXZSBo
YXZlIHdvcmtpbmcNCj4+IFBDSSBwYXNzdGhyb3VnaCBicmFuY2ggdGhhdCB5b3UgY2FuIHVzZSB0
byB0ZXN0IGl0LiANCj4+IA0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L2Z1c2Ev
eGVuLWludGVncmF0aW9uLy0vY29tbWl0cy9pbnRlZ3JhdGlvbi9wY2ktcGFzc3Rocm91Z2gNCj4+
IA0KPj4gPiANCj4+ID4gVGhyb3VnaCByZWFkaW5nIHRoZSBjb2RlIGFuZCB0cmFjaW5nIGRlYnVn
Z2luZywgdGhlIGVycm9yIGlzIGZvdW5kIGluIHRoZSBmdW5jdGlvbg0KPj4gPiBhcm1fc21tdV9h
ZGRfZGV2aWNlLCB3aGljaCB3aWxsIG9idGFpbiBhbmQgZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGZ3
c3BlYyBvZiB0aGUNCj4+ID4gZGV2aWNlIHRvIGJlIGFkZGVkIHRvIFNNTVUgZXhpc3RzLkJ1dCBm
b3IgdGhlIFhFTiBvZiBhcm0sIHRoZSBmd3NwZWMgb2YgdGhlIGRldmljZSBpcw0KPj4gPiBjcmVh
dGVkIGFuZCBhZGRlZCBieSBqdWRnaW5nIHdoZXRoZXIgdGhlIGlvbW11IGZpZWxkIGV4aXN0cyBp
biB0aGUgZGV2aWNlIG5vZGUgd2hlbg0KPj4gPiBYRU4gcGFyc2VzIHRoZSBkZXZpY2UgdHJlZS5I
b3dldmVyLCB0aGUgUENJRSBkZXZpY2UgZG9lcyBub3QgYXBwZWFyIGluIHRoZSBkZXZpY2UgdHJl
ZSwNCj4+ID4gc28gdGhlcmUgd2lsbCBiZSBubyBmd3NwZWMgZm9yIGFsbCBQQ0lFIGRldmljZXMu
IFdoZW4gYXR0ZW1wdGluZyB0byBhZGQgYSBQQ0lFIGRldmljZSB0bw0KPj4gPiBTTU1VLCBhIEVO
T0RFViBlcnJvciB3aWxsIGJlIHJldHVybmVkLg0KPj4gDQo+PiBBcyBvZiBub3cgWGVuIGRvZXNu
4oCZdCBzdXBwb3J0IHRvIGFkZCBQQ0kgZGV2aWNlIHRvIElPTU1VIG9uIEFSTS4gDQo+PiA+IA0K
Pj4gPiBJbiBhZGRpdGlvbiwgdGhlIGNvZGUgYXQgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmMgYWxzbyB2ZXJpZmllcyB0aGUgYWJvdmUgdmlldy4NCj4+ID4gRm9yIFBDSUUgZGV2aWNlcywg
cGRldiBpcyBhbGxvYyBpbiBmdW5jdGlvbiBwY2lfYWRkX2RldmljZSBieSBhbGxvY19wZGV2Lkhv
d2V2ZXIsDQo+PiA+IHRoZSBmdW5jdGlvbiBhbGxvY19wZGV2IGRvZXMgbm90IGNyZWF0ZSBhbmQg
YWRkIGZ3c3BlYyB0byB0aGUgUENJRSBkZXZpY2UuVGhlcmVmb3JlLA0KPj4gPiB3aGVuIGZ1bmN0
aW9uIHBjaV9hZGRfZGV2aWNlIGV4ZWN1dGVzIHRvIGlvbW11X2FkZF9kZXZpY2UsaXQgd2lsbCBn
ZXQgdGhlIGVycm9yDQo+PiA+IHJldHVybiBvZiBFTk9ERVYuDQo+PiA+IA0KPj4gPiBIb3cgY2Fu
IEkgcmVzb2x2ZSB0aGUgYWJvdmUgZXJyb3JzPw0KPj4gDQo+PiBJZiB5b3Ugd2FudCB0byB0ZXN0
IHRoZSBQQ0kgcGFzc3Rocm91Z2ggcGxlYXNlIGZvbGxvdyBiZWxvdyBzdGVwcy4NCj4+IA0KPj4g
WGVuIHNldHVwOg0KPj4gICAgIOKAoiBBIGNoZWNrb3V0IG9mIHRoZSDigJxpbnRlZ3JhdGlvbi9w
Y2ktcGFzc3Rocm91Z2jigJ0gYnJhbmNoIGZyb20gdGhlICBnaXRsYWIgaHR0cHM6Ly9naXRsYWIu
Y29tL3hlbi1wcm9qZWN0L2Z1c2EveGVuLWludGVncmF0aW9uLy0vY29tbWl0cy9pbnRlZ3JhdGlv
bi9wY2ktcGFzc3Rocm91Z2gNCj4+ICAgICDigKIgUGFzcyBpb21tdT15ZXMgIGFuZCBwY2ktcGFz
c3Rocm91Z2g9b24gdG8gWGVuIGNvbW1hbmQgbGluZSB0byBlbmFibGUgUENJIHBhc3N0aHJvdWdo
Lg0KPj4gDQo+PiAgTGludXggS2VybmVsIHNldHVwOg0KPj4gIA0KPj4gICAgIOKAoiBTb21lIGNo
YW5nZXMgYXJlIHJlcXVpcmVkIGZvciB0aGUga2VybmVsIHRvIHdvcmsgd2l0aCBQQ0kgcGFzc3Ro
cm91Z2guIEZpcnN0IGFyZSBzb21lIGNvbmZpZ3VyYXRpb24gb3B0aW9ucywgZW5hYmxlIHRoZW0g
aW4ga2VybmVsIGNvbmZpZy4NCj4+ICAgICAgICAgIENPTkZJR19YRU49eQ0KPj4gICAgICAgICAg
Q09ORklHX1hFTl9CQUNLRU5EPXkNCj4+ICAgICAgICAgIENPTkZJR19YRU5fUENJREVWX0JBQ0tF
TkQ9eQ0KPj4gICAgIOKAoiBUaGVuIGEgcGF0Y2ggbmVlZHMgdG8gYmUgYXBwbGllZCBmb3IgZW5h
YmxpbmcgdGhlIHBjaWJhY2sgZHJpdmVyLiBQYXRjaCBpcyBhdHRhY2hlZCBpbiB0aGlzIGVtYWls
Lg0KPj4gIA0KPj4gVXNpbmcgUENJIHBhc3N0aHJvdWdoOg0KPj4gIA0KPj4gICAgIOKAoiBJbiBv
cmRlciB0byBwYXNzIGEgZGV2aWNlIHRvIGEgZ3Vlc3QsIHlvdSBmaXJzdCBuZWVkIGl0cyBQQ0kg
YWRkcmVzcyhTQkRGKS4gWW91IGNhbiBlaXRoZXIgZ2V0IGl0IGZyb20gYSBiYXJlLW1ldGFsDQo+
PiAgICAgICBMaW51eCBydW5uaW5nIG9uIHRoZSBwbGF0Zm9ybSBvciBieSBoYXZpbmcgcGNpdXRp
bHMgIGluc3RhbGxlZCAoaWYgeW91IGFyZSB1c2luZyBhIHlvY3RvLWJhc2VkIGRvbTAgb3IgaGF2
ZSBhcHQgYXZhaWxhYmxlKSwgd2hpY2ggcHJvdmlkZXMgbHNwY2kuDQo+PiAgDQo+PiAgICAgIEZv
ciBleGFtcGxlLCBsZXQncyBwYXNzIG9uZSBldGhlcm5ldCBpbnRlcmZhY2UgdG8gdGhlIGd1ZXN0
LiBSdW5uaW5nIGxzcGNpIGdpdmVzIHVzIHRoaXMgb3V0cHV0ICh0cnVuY2F0ZWQpIDoNCj4+ICAg
ICAgICAwMDAwOjAwOjAwLjAgSG9zdCBicmlkZ2U6IEFtcGVyZSBDb21wdXRpbmcsIExMQyBEZXZp
Y2UgZTEwMA0KPj4gICAgICAgIDAwMDA6MDA6MDEuMCBQQ0kgYnJpZGdlOiBBbXBlcmUgQ29tcHV0
aW5nLCBMTEMgRGV2aWNlIGUxMDEgKHJldiAwNCkNCj4+ICAgICAgICAwMDAwOjAxOjAwLjAgRXRo
ZXJuZXQgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gRXRoZXJuZXQgQ29udHJvbGxlciBY
NzEwL1g1NTctQVQgMTBHQkFTRS1UIChyZXYgMDEpDQo+PiAgICAgICAgICAgICAgICBbLi4uXQ0K
Pj4gIA0KPj4gICAgICBXZSB3aWxsIHBhc3Mgb25lIG9mIHRoZSBldGhlcm5ldCBmcm9tIHRoZSBQ
Q0kgbmV0d29yayBjYXJkIDogMDAwMDowMTowMC4wIC4NCj4+ICANCj4+ICAgICDigKIgQWRkIHRo
ZSBmb2xsb3dpbmcgbGluZSB0byB0aGUgZ3Vlc3QgY29uZmlndXJhdGlvbiBmaWxlIDoNCj4+ICAg
ICAgICAgICBwY2kgPSBbJzAwMDA6MDE6MDAuMCddDQo+PiAgDQo+PiAgICAg4oCiIFJ1biB0aGUg
Zm9sbG93aW5nIGNvbW1hbmQgYmVmb3JlIHN0YXJ0aW5nIHRoZSBndWVzdCA6DQo+PiAgICAgICAg
ICAgIHhsIHBjaS1hc3NpZ25hYmxlLWFkZCAwMDAwOjAxOjAwLjANCj4+ICAgICDigKIgU3RhcnQg
dGhlIGd1ZXN0LiBUaGUgbmV0d29yayBpbnRlcmZhY2Ugc2hvdWxkIGFwcGVhciBhcyAwMDowMC4w
ICBpbiB0aGUgZ3Vlc3QgYW5kIGJlIHVzYWJsZS4NCj4+ICANCj4+IFBsZWFzZSBsZXQgbWUga25v
dyBpZiB5b3UgbmVlZCBtb3JlIGluZm8uDQo+PiANCj4+IA0KPj4gDQo+PiBSZWdhcmRzLA0KPj4g
UmFodWwNCj4+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQo+IEFmdGVyIHNldHRpbmcg
WEVOIGFuZCBrZXJuZWwgYXMgYWJvdmUsIEkgdHJpZWQgdGhlIGZvbGxvd2luZyB0d28gbWV0aG9k
cyB0byBhZGQgYSBQQ0lFIGRldmljZSBwYXNzdGhyb3VnaDoNCj4gMS4gQWNjb3JkaW5nIHRvIHlv
dXIgc3VnZ2VzdGlvbiwgdXNlIHRoZSBjb21tYW5kIHhsIHBjaS1hc3NpZ25hYmxlLWFkZCAwMDAy
OjIxOjAwLjAgdG8gc2V0IGluIHRoZSBEb20wLiBCdXQgaW4gZnVuY3Rpb24NCj4gaW9tbXVfZG9f
cGNpX2RvbWN0bCwgIGFmdGVyIGRldmljZV9hc3NpZ25lZCBpcyBjYWxsZWQsIEVOT0RFViBlcnJv
ciBpcyBvYnRhaW5lZC4NCj4gMi4gQWRkIHhlbi1wY2liYWNrLmhpZGU9KDAwMDI6MjE6MDAuMCkg
dG8gZG9tMC1ib290YXJncyBpbiB0aGUgZGV2aWNlIHRyZWUsIEkgZW5jb3VudGVyZWQgdGhlIHNh
bWUgcHJvYmxlbSBhcyBiZWZvcmUgDQo+IHdoZW4gaW5pdGlhbGl6aW5nIHRoZSBrZXJuZWwuIElu
IGZ1bmN0aW9uIHBjaV9hZGRfZGV2aWNlLCBQQ0lFIGRldmljZXMgY2Fubm90IGJlIGFkZGVkIHRv
IFNNTVV2My4NCg0KSXQgaXMgaGFyZCB0byBmaW5kIHdoYXQgaXMgaGFwcGVuaW5nIHdpdGhvdXQg
bG9ncy4gQ291bGQgeW91IHBsZWFzZSBzaGFyZSB0aGUgWGVuIGFuZCBMaW51eCBib290IGxvZ3Mg
c28gdGhhdCBJIGNhbg0KY2hlY2sgd2hhdCBpcyB0aGUgcm9vdCBjYXVzZSBvZiB0aGlzIGlzc3Vl
Lg0KDQo+IFRoZSBrZXJuZWwgdmVyc2lvbiBJIHVzZSBpcyA1LjEwLiBEb2VzIHRoaXMgaGF2ZSBh
biBpbXBhY3Q/DQoNCkkgYW0gdXNpbmcgdGhlIExpbnV4IHZlcnNpb24gNS4xNS40NCBidXQgSSBk
b27igJl0IHRoaW5rIGlzIGJlY2F1c2Ugb2YgTGludXguDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo=

