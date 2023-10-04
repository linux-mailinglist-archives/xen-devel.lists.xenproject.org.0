Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32A07B7E4C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 13:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612504.952438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo0C8-0006fh-Rz; Wed, 04 Oct 2023 11:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612504.952438; Wed, 04 Oct 2023 11:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo0C8-0006cd-NZ; Wed, 04 Oct 2023 11:37:36 +0000
Received: by outflank-mailman (input) for mailman id 612504;
 Wed, 04 Oct 2023 11:37:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAsU=FS=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qo0C6-0006cX-Fa
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 11:37:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67ce93b2-62aa-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 13:37:32 +0200 (CEST)
Received: from DB7PR05CA0041.eurprd05.prod.outlook.com (2603:10a6:10:2e::18)
 by DU0PR08MB9933.eurprd08.prod.outlook.com (2603:10a6:10:413::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 11:37:28 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::ab) by DB7PR05CA0041.outlook.office365.com
 (2603:10a6:10:2e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Wed, 4 Oct 2023 11:37:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Wed, 4 Oct 2023 11:37:28 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Wed, 04 Oct 2023 11:37:27 +0000
Received: from 5afc1ff2ca3a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E854D204-F18A-428C-BA92-35C9729CE2D8.1; 
 Wed, 04 Oct 2023 11:36:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5afc1ff2ca3a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Oct 2023 11:36:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU2PR08MB10160.eurprd08.prod.outlook.com (2603:10a6:10:496::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 11:36:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 11:36:50 +0000
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
X-Inumbo-ID: 67ce93b2-62aa-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8pgFloB88RANj6yqCE5FF+UunPISxUmVvwfnG+W7Wg=;
 b=bQ8ib5WzostSPmL//cHbw/BUMSZAOjjk1aOho18AMngbcM0zSEFCKbfANZ6luhCskyqKMgcvH12L9aqiX8rB9toK4rbbdh1nagGfEEoqNCMf8vzAi7GNE4DSjOQODDlUenMsfwU5utJAH69SQFjxX8EHe7lG9gUZEUb18HcU6xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b1ddfe980661868
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAFfczb1kVHxKqNHWaE0ubnN3TIF6YANvG7ywzZn7ncaI2B0gA4egGY0K7KsnMidoRReExn7U5WAHaJUUMzYh3Mot+cdJpfDVLOMuLGTmbZsbRN74TIVEr8DcSMiGOSMfWT2XH+vSCnKtHQf5tujWvq2KCDVUNw/5UPJhgwQczhEBeXhJSYMoT/Wih8KqmvGKxAPHBu1qtJdbs/2OF/3Bp1u758rSfYEKbo8dDuwD0m2vFa4oWnIoOykXxBTTWOfwUE1SP783jU1W0+JhY1OP9ZlzzVsfLNgoCRf8mD6b/wmo8J/R1B8B17xGSW4LNBStp38pQd43P5YbkZuXTV9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8pgFloB88RANj6yqCE5FF+UunPISxUmVvwfnG+W7Wg=;
 b=ceLxCAL4DqREf5XL5SxUAbHM6ISECFbcDYBBv8YjhS+HWMo1TvKKpRq96rMVCWV8a1SH0I6Zoria+a2oPO76gzLsNHEbW4m0jM1fupLflmP6l6JTowCr4hYFNmvGRdp2isUrBT9woMSuIwZCRyA6EUO7DvukQR0+sOJ9XEURLwFcPUHw2amVb2eADYZBW2cvYNSu1NSJb0Li7valHcSDkKLDocqPKdJo4gIiIW0cSjVt4IcoUfxWZcaBRoOB+Es7+6R29FBg5W2r3hTk+V4tY+vH5FaAjP8i+i4eLSVdOn7naZmIP/cjmAfAIuzjewBDBKUlA/YzJYB/LjiLOrl+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8pgFloB88RANj6yqCE5FF+UunPISxUmVvwfnG+W7Wg=;
 b=bQ8ib5WzostSPmL//cHbw/BUMSZAOjjk1aOho18AMngbcM0zSEFCKbfANZ6luhCskyqKMgcvH12L9aqiX8rB9toK4rbbdh1nagGfEEoqNCMf8vzAi7GNE4DSjOQODDlUenMsfwU5utJAH69SQFjxX8EHe7lG9gUZEUb18HcU6xg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Topic: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Index: AQHZ9qj87vFsnMRst0ybMa+ffKOLU7A5Z4mAgAAGhgCAAAYzgIAABzIAgAAFTwA=
Date: Wed, 4 Oct 2023 11:36:50 +0000
Message-ID: <B58A790F-6C3B-41C9-8007-0443F0F71E83@arm.com>
References:
 <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <23802fca-7aaf-4792-a57c-2a3b2502ca70@citrix.com>
In-Reply-To: <23802fca-7aaf-4792-a57c-2a3b2502ca70@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU2PR08MB10160:EE_|DBAEUR03FT025:EE_|DU0PR08MB9933:EE_
X-MS-Office365-Filtering-Correlation-Id: ca555e36-51f1-4501-76ba-08dbc4ce49b1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VuACF1nOdUNo+UAwaTJBP1YfpImOOGed7WThBvR1hboK7MlYw0gpijG34gNgeXeCWXCr/cNPFGcW0KKocPwrqWnskSMkpiq1LyiQNMd/2pYf+1cFRmF0154JVaSQ04wQpSvla3+V7ACqk2aZjYjCw6Xjj9LTe7EUoVHC5AfuoVFx1BavRAW19sg4qkKWrPUszNXLmeE0XSvoMYNG581rkaFsXRnWwck4VZr6Xz5wfShd/Fphe7yFkwGzVK/t7W7KEE+KUlsF+nAtMaihAP4MghDGPgvGU+t5RrRZJKU8P7ZlYpTzZWknfZCqRNSaFnSJyoLEOM1/E7cRzuPt/xdU1pf3pHUwdW/3yAZCf+stbAcJk5KosiC/l4apqA32HL7d+bcKq/wvfaeTmZY58m0P2hxHRWBNEjmRP0QyvH6Gr/skOyRUTo025jqipxZC7n875iQdztqZl3vEfsr2pOXAI8R189QagjMlrDpXKmdZ/t10ONw9PqiZghIV++XSCdMVpW0WSzAG7Z7w7cV7/WcB3BacAQMTaEBcQ/BZPR9V8cDUgDob4qlAw6n8F4OEN5fy3kUaoG/rU+ifEh+ok9lbxLJdQ+r7YSRk+v4XkzbjlyKVonXHT58Epe3PUU6pmZ6emKxh4BYUWiQbK6gz2QYykg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(71200400001)(2616005)(36756003)(53546011)(478600001)(6512007)(86362001)(6506007)(122000001)(38070700005)(38100700002)(33656002)(26005)(6916009)(66476007)(6486002)(54906003)(64756008)(76116006)(4326008)(66446008)(66946007)(66556008)(7416002)(2906002)(91956017)(316002)(5660300002)(41300700001)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <12A124D2881E704DA3FDEAD77B927BEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10160
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48698a91-31f3-4564-f94c-08dbc4ce337c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k6+Vn0R6ZokCiF5XZMl3kC5a3G0RtJ4xnAxHZr//PevYYY0dt11E66s6XzuRomwuf1Myo7TTj/SktBClmNAXDGC/qzAgrSWYFUOTCPUC/K9pfAIRHIl4Kw0LmVKpbhZXW3tsRDNWn1AYz63ide5UnKlzHriufEMztU3hNrAJlcKrj08LLDBml5s7XS2Rra93OS4qKa2kPl1r84zmfXa+KkQ0Eoe0/OgA1bfqVSc7dYSQzK9hjyzaC3QspniFMAdpFz+F2iIM6iP9jlx+tzhF2AStmBO7bwcL8BZpgKX0Cye+HWT3s3XrhObp+d43PetP9kQWWupD9fIhV+L0gxWr4Aguv5CLpDA7X3HUG7HjSBDBkz5aNkAnuJ7bBXKwibEFKcWLwL6LWVBAmBJlfGhrTXNWesV6WTDs0gqBo1L0eLajTXeToZgcHRldYWahfDBV0rdPlgpMeU+B4D32X1E1B9rbIkaJyNRP/Ae8zH9oVZ1W0vudamoUwXfO2u0jQKbBfbEAqoFBH6MNt936yTR8xjZx7WBFqf5LekyCAtOH/567E79WTpQ9HRYGtMQpzCVEYUhYJhTn7GKgukSnWYTBHsM6PDJPCELf3xam2x0I6Rk0RaVwrSt/i4CMNOidbNgjcRVMBciPnZcBxeZ57U2QRxXm51PiSzP2oXMZ3dUgE8Ru/JGwRivoEIYYrZU+EQeCosNpQ7RukjIWJs7mh9o9JAtWnFTeqATAMFt2f7XOTd88YEFGVL+LU/vMXl0CPjrt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(26005)(5660300002)(6506007)(36860700001)(336012)(33656002)(2906002)(478600001)(36756003)(6486002)(53546011)(40480700001)(86362001)(70206006)(54906003)(2616005)(47076005)(316002)(6862004)(70586007)(8936002)(6512007)(8676002)(82740400003)(81166007)(356005)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 11:37:28.0793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca555e36-51f1-4501-76ba-08dbc4ce49b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9933

DQoNCj4gT24gNCBPY3QgMjAyMywgYXQgMTI6MTcsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMDQvMTAvMjAyMyAxMTo1MiBhbSwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+IA0KPj4gRnJvbSB0aGUgZG9jdW1lbnRhdGlvbjoNCj4+IA0K
Pj4gSW4gdGhlIFhlbiBjb2RlYmFzZSwgdGhlc2UgdGFncyB3aWxsIGJlIHVzZWQgdG8gZG9jdW1l
bnQgYW5kIHN1cHByZXNzIGZpbmRpbmdzOg0KPj4gDQo+PiAtIFNBRi1YLXNhZmU6IFRoaXMgdGFn
IG1lYW5zIHRoYXQgdGhlIG5leHQgbGluZSBvZiBjb2RlIGNvbnRhaW5zIGEgZmluZGluZywgYnV0
DQo+PiB0aGUgbm9uIGNvbXBsaWFuY2UgdG8gdGhlIGNoZWNrZXIgaXMgYW5hbHlzZWQgYW5kIGRl
bW9uc3RyYXRlZCB0byBiZSBzYWZlLg0KPj4gDQo+PiBJIHVuZGVyc3RhbmQgdGhhdCBFY2xhaXIg
aXMgY2FwYWJsZSBvZiBzdXBwcmVzc2luZyBhbHNvIHRoZSBsaW5lIGluIHdoaWNoIHRoZSBpbi1j
b2RlIHN1cHByZXNzaW9uDQo+PiBjb21tZW50IHJlc2lkZXMsIGJ1dCB0aGVzZSBnZW5lcmljIFhl
biBpbi1jb2RlIHN1cHByZXNzaW9uIGNvbW1lbnQgYXJlIG1lYW50IHRvIGJlIHVzZWQNCj4+IGJ5
IG11bHRpcGxlIHN0YXRpYyBhbmFseXNpcyB0b29scyBhbmQgbWFueSBvZiB0aGVtIHN1cHByZXNz
IG9ubHkgdGhlIGxpbmUgbmV4dCB0byB0aGUgY29tbWVudA0KPj4gKENvdmVyaXR5LCBjcHBjaGVj
aykuDQo+PiANCj4+IFNvIEnigJltIGluIGZhdm91ciBvZiB5b3VyIGFwcHJvYWNoIGJlbG93LCBj
bGVhcmx5IGl0IGRlcGVuZHMgb24gd2hhdCB0aGUgbWFpbnRhaW5lcnMgZmVlZGJhY2sgaXM6DQo+
PiANCj4+IA0KPj4+IC8qIFNBRi0yLXNhZmUgKi8NCj4+PiBpZiAoIG1vZHJtX21vZCA9PSBNQVNL
X0VYVFIoaW5zdHJfbW9kcm0sIDAzMDApICYmDQo+Pj4gLyogU0FGLTItc2FmZSAqLw0KPj4+ICht
b2RybV9yZWcgJiA3KSA9PSBNQVNLX0VYVFIoaW5zdHJfbW9kcm0sIDAwNzApICYmDQo+Pj4gLyog
U0FGLTItc2FmZSAqLw0KPj4+IChtb2RybV9ybSAmIDcpID09IE1BU0tfRVhUUihpbnN0cl9tb2Ry
bSwgMDAwNykgKQ0KPiANCj4gVG8gYmUgY2xlYXIsIHRoaXMgaXMgaWxsZWdpYmxlIGFuZCBhIG5v
bi1zdGFydGVyIGZyb20gYSBjb2RlIG1haW50ZW5hbmNlIHBvaW50IG9mIHZpZXcuDQo+IA0KPiBJ
dCBpcyBiYWQgZW5vdWdoIG5lZWRpbmcgYW5ub3RhdGlvbnMgdG8gc3RhcnQgd2l0aCwgYnV0IHRo
ZSBhbm5vdGF0aW9ucyAqbXVzdCogbm90IGludGVyZmVyZSB3aXRoIHRoZSBwcmlvciBsZWdpYmls
aXR5Lg0KDQpJIGFncmVlIHdpdGggdGhhdCwgdGhlIGNvZGUgYXMgYWJvdmUgaXMgbm90IHZlcnkg
bmljZSwgaG93ZXZlciBhcyB0aGUgY3VycmVudCBzdGF0dXMgaXQgaXMgdGhlIG9ubHkgd2F5IGl0
IGNhbiB3b3JrLA0KbWF5YmUgcmV3cml0aW5nIGl0IGluIGFub3RoZXIgd2F5IGNvdWxkIHNvbHZl
IHRoZSBpc3N1ZT8NCg0KRm9yIGV4YW1wbGU6DQoNCi8qIFNBRi0yLXNhZmUgKi8NCiNkZWZpbmUg
U0VOU0lCTEVfTkFNRV9IRVJFKGluc3RyKSAgIE1BU0tfRVhUUihpbnN0ciwgMDMwMCkNCi8qIFNB
Ri0yLXNhZmUgKi8NCiNkZWZpbmUgU0VOU0lCTEVfTkFNRV9IRVJFMihpbnN0cikgICBNQVNLX0VY
VFIoaW5zdHIsIDAzMDApDQovKiBTQUYtMi1zYWZlICovDQojZGVmaW5lIFNFTlNJQkxFX05BTUVf
SEVSRTMoaW5zdHIpICAgTUFTS19FWFRSKGluc3RyLCAwMzAwKQ0KDQpBbmQgdXNlIHRoZXNlIG1h
Y3JvIGluIHRoZSBjb25kaXRpb25zIGFib3ZlLCBob3dldmVyIHdpbGwgaXQgbW92ZSB0aGUgdmlv
bGF0aW9uIGF0IHRoZSBtYWNybyBkZWZpbml0aW9uPw0KDQpIYXZpbmcgbWFjcm8gd2l0aCBhIHNl
bnNpYmxlIG5hbWUgZXhwbGFpbmluZyB0aGUgbWVhbmluZyBvZiB0aGUgdmFsdWUgY291bGQgYWxz
byBpbXByb3ZlIHRoZSByZWFkYWJpbGl0eSBvZiB0aGUgY29kZS4NCg0KQnV0IHRoaXMgY2hvaWNl
IGlzIHVwIG9uIHlvdSB4ODYgbWFpbnRhaW5lcnMuDQoNCj4gDQo+IFRoZSBmb3JtIHdpdGggY29t
bWVudHMgb24gdGhlIGVuZCwgdGhhdCBkbyBub3QgYnJlYWsgdXAgdGhlIHRhYnVsYXRpb24gb2Yg
dGhlIGNvZGUsIGlzIHRvbGVyYWJsZSwgcHJvdmlkaW5nIHRoZSBTQUYgdHVybnMgaW50byBzb21l
dGhpbmcgbWVhbmluZ2Z1bC4NCj4gDQo+IH5BbmRyZXcNCj4gDQo+IFAuUy4gdG8gYmUgY2xlYXIs
IEknbSBub3Qgc2F5aW5nIHRoYXQgYW4gYWhlYWQtb2YtbGluZSBjb21tZW50cyBhcmUgdW5hY2Nl
cHRhYmxlIGdlbmVyYWxseS4gIFNvbWV0aGluZyBsaWtlDQo+IA0KPiAgICAgLyogJEZPTy0kTi1z
YWZlICovDQo+ICAgICBpZiAoIGJsYWggKQ0KPiANCj4gbWlnaHQgYmUgZmluZSBpbiBjb250ZXh0
LCBidXQgdGhhdCBpcyBhIGRlY2lzaW9uIHRoYXQgbmVlZHMgdG8gYmUgbWFkZSBiYXNlZCBvbiBo
b3cgdGhlIGNvZGUgcmVhZHMgd2l0aCB0aGUgY29tbWVudCBpbiBwbGFjZS4NCg0K

