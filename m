Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D92518562
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 15:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319655.539967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsVA-0008VM-HP; Tue, 03 May 2022 13:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319655.539967; Tue, 03 May 2022 13:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsVA-0008T6-EK; Tue, 03 May 2022 13:23:40 +0000
Received: by outflank-mailman (input) for mailman id 319655;
 Tue, 03 May 2022 13:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlsV9-0008Sw-Pu
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 13:23:39 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe08::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dff56a5-cae4-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 15:23:38 +0200 (CEST)
Received: from AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35)
 by AM0PR08MB3234.eurprd08.prod.outlook.com (2603:10a6:208:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Tue, 3 May
 2022 13:23:23 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::8b) by AM6PR08CA0023.outlook.office365.com
 (2603:10a6:20b:b2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Tue, 3 May 2022 13:23:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 13:23:22 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Tue, 03 May 2022 13:23:22 +0000
Received: from fdbafd277eb7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C2A5B8F5-9E59-4995-A3A7-B0448700FBC2.1; 
 Tue, 03 May 2022 13:23:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fdbafd277eb7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 13:23:15 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM0PR08MB3348.eurprd08.prod.outlook.com (2603:10a6:208:65::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 13:23:13 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 13:23:13 +0000
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
X-Inumbo-ID: 3dff56a5-cae4-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gzn1FncayiBuXhxcVuQN29gcEBQlizMHT51rAB5CAOcNWO0TuLHAJxEhRniwELK4/54S7a1h+wx9I+wkeafJeASemu/nOY1lRvF/eiP6W2wp5sddKVRLoVamnkopQkFwBtplefJbOk8Niiy3fFgUqQdYW1Ooj1jTa6hMC8uwBUz3HzTy3TxLsYkJFCh72aQbddurIt/ec0u54unCkhGI7GpP6j33ZLf2tYE0IGRqW+aSBALzpPLM/rtBXbID/CukCzWv6Pz65lIGRGqpXCiCFLwWp1TPAuCFEsQhRvb9Kvi8kArIm3iO0YlQqaXbiK/dfEoHQ3A8Y7rd4GansKGwUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9t+UUChBXOgJcqYKB+BpikrXXZ8Xac23COr5d9Phxc=;
 b=oT1R+4y8EFnGyi2xmXZ+8XTIN27giTMHumA4l/6AWI7oKK6F5qmVKeVAmjwHzCK0XD5+0CQny7wR4a3qmzAaUpWDqOygnlnSAmB1cBYQBYjGU0pHW8MbQNrAAIq3QRe2En1HjBqkTjYBh0vR8K4EonCGp2AIiDkn1zzGk3aIshZaDfVEJsqZDfkUxrZVtAkyFUXx0gv9+/RxiiCUY9m3cxQ1wn8pHuhkrY1YeMn43kwKVZE2Q9avA2/5CoTPXpzjhagKW6RvUGFmNQKURe0OOgt2yAxXpIAfG0PZMs0ntnDxgEBCGpgcXUQTQhS01PS1SBPSt7U4rSBtJNUyno5k/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9t+UUChBXOgJcqYKB+BpikrXXZ8Xac23COr5d9Phxc=;
 b=1jd7yRNyyGJs23ojxUXEEU2UTf6+Bm0L9YflY6/Hb1HD8Ya7dZItmGqZNysYfa2RvBfSCwDOaoq1kMynB6a2EUa7k6hQFjN2zsnvYlk/fQ8a90DwqC9dR8+TKTtgkKSHL+onHfoHOzTclZbO9zAtu4AwVJ+kBP5oUucmQZHYbE0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 458ec5c0e1f27750
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfewyVNs2WWPeAiYK5FGjcIxX3l5NjPjKGXGskZv8XwMCeqEUI0C/NLdjh2gQrxtzxohYPQhr+6GJCv+VZvZtaH81LcsD542j8FgcU8cuk4dfmhgMnBQKi/cKdO0Yn72K24kW2R8YKCjLUfKvyUqhDly8RAZcxcnnX9KNcYS/vJFRFZVUgR4MuWTZm2UkizKg6NS/TXzFU2c397Q2lTCMbXZeIobwosvUbyobAK5+tFYsz/WVPwoJs/3oI0PTdU9ZLW+w6qGZrAeGwwOCcZWaeMCYOnmvyxmWGnYGh4RLHU4ABt3PfYgldmKQ4au5WvBjcHmu7kKTQHgA9tX1h0WUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9t+UUChBXOgJcqYKB+BpikrXXZ8Xac23COr5d9Phxc=;
 b=dkRgy3ZuxPtLh7BeKQXcymnYaKBr1lwJSWPrrcorLaPxjlBY9MKnvyIJp2nMqVzIr647hftVsQfs/oG7ZDjNb2SY76ZWfRS+3oOdv7J4ORmxuAjFgcbhslC1Wd/sejflX0FQNzsPy+wLD1ZCyLJIuXYWgne3dl1KvDJFxqKQ4OM8w6c0IAP10Tyn+Qixr7Mb0w3j+jGiur+NqZDyMa1g1x7ua9Fh8miES3APrjjSKGp+92eLj0AOWX5cst3DPO3i7n31W9BEjxRe7S95qtrVV+tScWOzrXY3R6CymXUDaVepdh7gcd7jMR4pRUCwhrMPP4vL4/h4d401dKmwbmuC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9t+UUChBXOgJcqYKB+BpikrXXZ8Xac23COr5d9Phxc=;
 b=1jd7yRNyyGJs23ojxUXEEU2UTf6+Bm0L9YflY6/Hb1HD8Ya7dZItmGqZNysYfa2RvBfSCwDOaoq1kMynB6a2EUa7k6hQFjN2zsnvYlk/fQ8a90DwqC9dR8+TKTtgkKSHL+onHfoHOzTclZbO9zAtu4AwVJ+kBP5oUucmQZHYbE0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis
	<scott.davis@starlab.io>, "jandryuk@gmail.com" <jandryuk@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v6 2/2] flask: implement xsm_set_system_active
Thread-Topic: [PATCH v6 2/2] flask: implement xsm_set_system_active
Thread-Index: AQHYXt+hyRwwXvMDlUWMsukHHGStsK0NJCKA
Date: Tue, 3 May 2022 13:23:13 +0000
Message-ID: <6CFE9B37-7B81-4EF6-8214-15582C4EB8EC@arm.com>
References: <20220503111731.12642-1-dpsmith@apertussolutions.com>
 <20220503111731.12642-3-dpsmith@apertussolutions.com>
In-Reply-To: <20220503111731.12642-3-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 45956a98-bbd9-470a-afad-08da2d08190c
x-ms-traffictypediagnostic:
	AM0PR08MB3348:EE_|AM5EUR03FT056:EE_|AM0PR08MB3234:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3234ACF6698745880B677DD9E4C09@AM0PR08MB3234.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jf9HWh+7h0D6WFPQQqX8LTmvnqRyf2yZ+dTXBeC4y9DzzgEAS/vnsm3XuUCtRyU0GOQUdWa29MRCPR+2ejY4ucUSahdW18vToI7YjvRBz2wuL5C09Pj93inm7clpTJD6xuNLSU9UcDVTF5QXnbC0SIkrrgoIqK1Azn3fdGmqPR+Mb990PxoBypri23JUGrGKNSmA15GC5ofBlTXG9jstBJecjibn3++A/8H0VWfeIdQdSIlfAUPSYbd0XA66Lo5wXrYNXR9JDnFY9udCPghMPPZ9iHLmomkb9RIV6zPaejcrAsb5ln3xQheYIkFvuFqHXSbltMPDZVe64jIOzeYn0R3r3RqsFco9tf1z0veMhkr8VPkwQizCZSQTZ4po+UEazi4889LEKyuApa56PL6YZcID6zoLyTeEEArBDIbQWg0wN5JZ3Dz4Afq0w3AR1hWrqIikO7o9mlqSn7wX/X/TUiGU3q3ubgHoqazxnwKnTT9U/xpD5ud5QEhtrYLRL55nUKzKOjkLgyIcJiGEFfrsl2+m2q7e8ogBbv/ZiEGx2vpVpimWAksFIDNBloCvWI9pBOGZ34YRKPtYd1PS6FNkrspJmTmAdi0NKDDepyqVJdE9tDqA7VEhuJOtWSCDYFMmWkSIfGhd0d+3WY5/R6Jnji23yFjVh8tHcQIi9yclXMpv0WYX6VTScZF1wf7dd//3AzM0mb5xaBPiH9pyWsJYZr3FEvLlfzeZFFKquUkPYJbFhUtBRrX/7eYkQ6dJFIZ6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(38100700002)(53546011)(6506007)(26005)(122000001)(6512007)(316002)(86362001)(5660300002)(71200400001)(186003)(4744005)(36756003)(8936002)(4326008)(33656002)(8676002)(76116006)(6916009)(66556008)(64756008)(66946007)(2906002)(54906003)(508600001)(66476007)(66446008)(6486002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1408B071AAF6504294A7EEE82D9D2342@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3348
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b10c4f8c-8807-4347-7fb1-08da2d0813a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G/rZoKYKIAQIFZVdGNkE8MZMBxkoapV/iL8qNXoFCRnPkK/xbcQiNBLHZrXElq567rqdMlTsM6d9e4RiuMgrAJwaGGCJMhaB8cVvyf5njaDwj01bCZmtNtVD95rxW4znsynRDyGoq3Isv/5Vobzi1DzV4o/oWSL5Ts6g4k3sDGdJOq5BkjTJaF50FNqfJhQbB5ZjwLSTSjlBIbp2DJXMOVYVws5TD8oCYafV/F7lmgEw22qpXAwpeAxnrWozDszWAtHBkzl/rqiJ/xoKqGiHZ/22KeiP0RqoqnBAvURlfkX15gbXD7HJc7ZXySn3K36Iz961XZiJeoeha+KqKmAKtF9uCiVmqJv6RsPuU7vghgEk7lznCHgzhmEVmME9/TMjGrygoncHZZxL8J0ibCmKU+/3xrfx37qc2o17onxB1Ej8o5PQEcfEkcP95NToWoMvmV0VvOF9NPWZSMGj5uCFVG9ViSOG4xviLOgnAScl2EPlIuQqAaaEfi8GmRdtrxhX8s0gn5VC5g0fIgxBZl1MVn+xTC43KjuIm4lPLGOwK4bGQzF4KPTWx27E4Zvtekv1STFyuPQjZL4s23LDlpjhIQPdylAaz65si3++yCKQ+m3X4Bl+YXyeIKsUf+qUxvmDuTjtDYk84t/avSn3jnLvCrQh6bnuiko2FEh9s5EUxICd4c1AuS7gLBTJOxl0HOSi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(54906003)(4326008)(6862004)(107886003)(8676002)(40460700003)(356005)(81166007)(82310400005)(70206006)(2616005)(316002)(70586007)(36756003)(5660300002)(26005)(186003)(6506007)(2906002)(336012)(53546011)(47076005)(8936002)(508600001)(6486002)(6512007)(33656002)(36860700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 13:23:22.9127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45956a98-bbd9-470a-afad-08da2d08190c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3234

DQoNCj4gT24gMyBNYXkgMjAyMiwgYXQgMTI6MTcsIERhbmllbCBQLiBTbWl0aCA8ZHBzbWl0aEBh
cGVydHVzc29sdXRpb25zLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGlzIGNvbW1pdCBpbXBsZW1lbnRz
IGZ1bGwgc3VwcG9ydCBmb3Igc3RhcnRpbmcgdGhlIGlkbGUgZG9tYWluIHByaXZpbGVnZWQgYnkN
Cj4gaW50cm9kdWNpbmcgYSBuZXcgZmxhc2sgbGFiZWwgeGVuYm9vdF90IHdoaWNoIHRoZSBpZGxl
IGRvbWFpbiBpcyBsYWJlbGVkIHdpdGgNCj4gYXQgY3JlYXRpb24uICBJdCB0aGVuIHByb3ZpZGVz
IHRoZSBpbXBsZW1lbnRhdGlvbiBmb3IgdGhlIFhTTSBob29rDQo+IHhzbV9zZXRfc3lzdGVtX2Fj
dGl2ZSB0byByZWxhYmVsIHRoZSBpZGxlIGRvbWFpbiB0byB0aGUgZXhpc3RpbmcgeGVuX3QgZmxh
c2sNCj4gbGFiZWwuDQo+IA0KPiBJbiB0aGUgcmVmZXJlbmNlIGZsYXNrIHBvbGljeSBhIG5ldyBt
YWNybywgeGVuX2J1aWxkX2RvbWFpbih0YXJnZXQpLCBpcw0KPiBpbnRyb2R1Y2VkIGZvciBjcmVh
dGluZyBwb2xpY2llcyBmb3IgZG9tMGxlc3MvaHlwZXJsYXVuY2ggYWxsb3dpbmcgdGhlDQo+IGh5
cGVydmlzb3IgdG8gY3JlYXRlIGFuZCBhc3NpZ24gdGhlIG5lY2Vzc2FyeSByZXNvdXJjZXMgZm9y
IGRvbWFpbg0KPiBjb25zdHJ1Y3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgUC4g
U21pdGggPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+DQo+IFJldmlld2VkLWJ5OiBKYXNv
biBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+DQoNCkhpIERhbmllbCwNCg0KSeKAmXZlIGJ1
aWx0IGFuZCB0ZXN0ZWQgdGhlIHdob2xlIHNlcmllIG9uIGFybSwgY2hlY2tlZCBTSUxPIGFuZCBG
TEFTSyB3aXRoIGJ1aWx0aW4gZmxhc2sgcG9saWN5IGFuZCBJ4oCZdmUNCnRlc3RlZCB0aGF0IERv
bTAgaXMgYm9vdGluZyBmaW5lLg0KDQpTbyBmb3IgbWU6DQoNClJldmlld2VkLWJ5OiBMdWNhIEZh
bmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUg
PGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJzLA0KTHVjYQ==

