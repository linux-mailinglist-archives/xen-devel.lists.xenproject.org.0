Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882522CA1B7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 12:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41863.75361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk47f-0001zu-Mz; Tue, 01 Dec 2020 11:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41863.75361; Tue, 01 Dec 2020 11:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk47f-0001zV-Ja; Tue, 01 Dec 2020 11:47:07 +0000
Received: by outflank-mailman (input) for mailman id 41863;
 Tue, 01 Dec 2020 11:47:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dt7S=FF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kk47e-0001zQ-AL
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 11:47:06 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [40.107.12.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cbdb628-1dc3-4c10-a7e9-de1968233740;
 Tue, 01 Dec 2020 11:47:05 +0000 (UTC)
Received: from MR2P264CA0151.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::14) by
 PR2PR08MB5225.eurprd08.prod.outlook.com (2603:10a6:101:1c::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.31; Tue, 1 Dec 2020 11:47:04 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::6) by MR2P264CA0151.outlook.office365.com
 (2603:10a6:501:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 1 Dec 2020 11:47:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Tue, 1 Dec 2020 11:47:03 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71");
 Tue, 01 Dec 2020 11:47:03 +0000
Received: from 9ea6a3bdfbf7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 486E2741-E33B-40F5-AA8E-6FEC46352DE6.1; 
 Tue, 01 Dec 2020 11:46:47 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ea6a3bdfbf7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Dec 2020 11:46:47 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4823.eurprd08.prod.outlook.com (2603:10a6:10:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 11:46:46 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.017; Tue, 1 Dec 2020
 11:46:46 +0000
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
X-Inumbo-ID: 9cbdb628-1dc3-4c10-a7e9-de1968233740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpsuuKKrdjNlgDZu3dJ7jgYdZsGAzGNwiG/CKgCrQhc=;
 b=GGyoi4xYnxTKlxWQs8f4XolZlo+vu03mlFZekSIUzjIEH9cOFDiWZbI/ERQ/wyUzg/6mUUAxHOKzyoKIe1bdttlOjWa4zL/EcMOuBR33BFZ//qCifAKyFIxtDLGa5/5EpIgb4N68QUcZf8qm9HeMX0NoMpcCkAaWyXaTl24Gh+0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5074c98d6ded5a5d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA9by4y8+VjnSTmREUN7H33aXuQ1WLnMqTjcDg8lh7AmmV+zSZFI8f6WRUvt04HMuyGoostdFBTIe5my6fypYuSL/epbFC42Rt84ruGEOR/5ad95dRrqBkrejk/uO26BsHcJcCg+IKjoPPRKjAN3niPcp3l2chZlGovKMZAgP0XDPDIC3kjbBG8xQWCnjECVolJbVmePpF69DEhCAiSplecjXbV2imLrzQWKhThVpu0b9V1XlpVhFal+S4rTQJkfaE8dsw1UYQbPGuMdZwipNxbWe0jTTyyDVsMlqWB3si/cAqhGLJ6x+S/FRwK75gUoBnOjqvEXJ1LUd7m4BsdSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpsuuKKrdjNlgDZu3dJ7jgYdZsGAzGNwiG/CKgCrQhc=;
 b=cYwIGdE47R/iY6uSxB3O0MzULpc8iCdQ8WrmGcfNuuGsioDYskXiQHKJmVWpFZ9Soue016ENMCnV9iRgtExB7F77Pkn50pNyE948lDDKwDgNmz9uXcswjvq99pfQ8s81+rujg6JqgfZV3sRyv0DOIAl93olOnPCvw22QYeklwrt9XhDBx1j7+BguRdyvljldYTpXFcUDVMSXE4aAXxobtCZtYC6VsBYERKLiE6TLzW1U+4xTfLpHsg8F/sHWmZbtVJAFqzT/ykDF57suo6BhlI80b1gtNE4LJ/UbeNMd6ShyQ1YkW+bqfu4hmFn1Z7L+1NnJfoF6VIGvzczizHJfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpsuuKKrdjNlgDZu3dJ7jgYdZsGAzGNwiG/CKgCrQhc=;
 b=GGyoi4xYnxTKlxWQs8f4XolZlo+vu03mlFZekSIUzjIEH9cOFDiWZbI/ERQ/wyUzg/6mUUAxHOKzyoKIe1bdttlOjWa4zL/EcMOuBR33BFZ//qCifAKyFIxtDLGa5/5EpIgb4N68QUcZf8qm9HeMX0NoMpcCkAaWyXaTl24Gh+0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Topic: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Index: AQHWxyRuchSNSGGKDEyJCEQqqd6Vw6nhIUWAgAD/ugA=
Date: Tue, 1 Dec 2020 11:46:46 +0000
Message-ID: <AB32AAFF-DD1D-4B13-ABC0-06F460E95E1C@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com>
 <87lfei7fj5.fsf@epam.com>
In-Reply-To: <87lfei7fj5.fsf@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa5590b5-d33f-47bd-a98b-08d895eed269
x-ms-traffictypediagnostic: DBBPR08MB4823:|PR2PR08MB5225:
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB5225FEB6B11F103DB5A24F569DF40@PR2PR08MB5225.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nunH9aSUDnIOAqWeNb6hAXx9a1Hdpl39crsx7ZjV+8VV6NI0D1TuM85L1ifPbOYiKJlEe98KOMLgqGNV0lH4nNK4H+6fu+VPDnIKkzUvGOnfeO1HfDlnTfAzyovrZbUA7Z5n5GgvqHP4Ht3FBrnzdVgiVSnf9//+TzqyNBN+iN4azBO7zN2/2p6TqNkXimHJ50f20ANMtUr0zK0qAC8Zu+msN435MvzMGgs93b1tX+2RKBD9q+2+T4oDIJ0+TIp+kLX/wyxqPEHlykkXgk/8Tkx9gS5aw+/buU2br7Ma6DKXzyF892EkhMOgCEaHq8RMQV3zxQiGAN/U9uK5saMmvg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(71200400001)(2616005)(6486002)(53546011)(6506007)(33656002)(5660300002)(478600001)(36756003)(66556008)(186003)(4326008)(66446008)(26005)(8676002)(66476007)(83380400001)(6512007)(2906002)(54906003)(86362001)(8936002)(76116006)(316002)(64756008)(6916009)(66946007)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?R1pOSWRueWVLMlk1elo5OXRrbkhWbEZ3N29SNVVpMlhQNmpZTkFhODdXRWw2?=
 =?utf-8?B?NTFtQ3lLRkJieEJXT3IxcUl3TkM3MCtRZllPL3JTR1p4TXY0K0NsdnFuWitS?=
 =?utf-8?B?c1hLRkxsZ29OYWdma25kdWpic0d5ZGMwUDg3RFArUFRaSnJDbkFsS29XRjhm?=
 =?utf-8?B?a1o2Sk4zakhXaGZwNStGWnpwS3NtcWc5MXJTVDVPZFBBN2xoQytHd0xhRy9y?=
 =?utf-8?B?QnRxbEpzRG9XNDBaN1ZVdFUvNWM0RDdUQm9za251S2oxMFIzdExzUndkSC96?=
 =?utf-8?B?MGVrb0VaUFkybUZQd3dCVVpnMEhsbzhBdHhod2ZINW5EVGR1MnZDZ25qaGpk?=
 =?utf-8?B?cEw5V2NuQUIzUUw3dzZCRU1kQlhzc3JXY2JVUTRSRWVjei9ocXlNUjZmQVhP?=
 =?utf-8?B?VlZBdWNIc2VFSTNIRUZVYzZPUU1oemJrYkJXSGorYThDV1piVE9VYmFvakRJ?=
 =?utf-8?B?NXRHQ0FPdTZ6UHBDdlhaTW9uT0lyR09ldVZ0MVJsV1NiZXJ4dy85MTdXRDY5?=
 =?utf-8?B?cktUVk1pYWwwSWQxKzdBL0VPbjNkbDVWanorS3NBQTlrSUpvc2RaRUlNNHNF?=
 =?utf-8?B?OFFlcXdOVlZZNldlVldnNWx5VWMraGNvYlJWSExMejhrTjFiWjdWNU11US96?=
 =?utf-8?B?VkNSZ0ZleFBoNzVRdndkTGdhT2VOUWpRZnBDaG00bmRTRXNOUnpVK3R5RHdh?=
 =?utf-8?B?UmNNNnltMkxMaHNET1ZraVMyOEpJMmFOZzZ1NzJPK01SRW5WblVRaEYrZE1H?=
 =?utf-8?B?MFRwSi9CU3MwdUw2ZU05MEc0cDA0Z0YyQkRBNWFCVVJTdmo0RVZhazgwdjhX?=
 =?utf-8?B?SUhuRER4RjZKN0luL21zZ1pHSFhYc3BjOXNMNUxjMldTL2JZcHFJN3cvelhi?=
 =?utf-8?B?VW13eVhDdTVDb09WWncvOWJBZ3ZnU2J1WHBqQlU1OHBiQnBpNHV1SEt3aHVC?=
 =?utf-8?B?S2pkU3AwVjMxaTdrTTh3YXJVTVgxZ3VwbzdwZFJGVktGN0pNYnE4WUlIcmkw?=
 =?utf-8?B?MDdkZ1VYaVViZGRPYnV2d09vanF5ajBSUkJaZURyVnQ1cnA3ZzFJb2NNcytR?=
 =?utf-8?B?VWcyMk5OOEw5UmZ5eERYQkozbTFGQ29QaEVzSDFvaFFiVDh0cFNQUG5WUW5E?=
 =?utf-8?B?OGRVSkhyMzdFUFlXUXRFVGwvTi9tTXIrUDIwamFDZmJ0UGRGV3NmZ1hDbTdh?=
 =?utf-8?B?ZVd1cTRvSDF1a00raDlqYWZLMHpaK2pXVXVsdGlHa29oajVqMGVBeDUvSklP?=
 =?utf-8?B?bDZFcGwyUThDTVhmeFpNSXZHL3hweXkxSGt6Nm5ZYStQcFB2L2FPVndDTTgy?=
 =?utf-8?Q?lKr3FuhrEtX0yGWRIoAtANiidTv36T6bxV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFCFA736C45C634386D284D83B6E23CB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4823
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa74e7f8-abe5-45ba-253d-08d895eec7de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1KX0CeHHq3MGQ5PeC+MaHstPz7OYykfFPoEfaBSa5cW8g6/50KVJG6oSWpu6fOgmbgsVwqVr1vdKLfLKOKAuvBsUbJ1+lbUSh17DlRHqwXxOTvoIgUcjyBurB3BHhmm2zC2nkHe5xqNJWGIzhTdgEmaadTugx6MhPpQtcKZ8m0+sx6Wx8Qv6OtAVV9v9Snaz0j26Gqb17Iwj7F42Sl6efGSirk3JlGS/u94R6pOrZ76s866luWAAyAyUEkgnfPns5yt/Ro493TYcVymDDHEo7sSHxMbRjXPBXXzXY2z4GLywps7/e+2W2BHFSgap85HtAt1oJXvhrWAljmGi3+Z7JAvBogU0SWS9ckGtUvQaTIfFwPBAkWNdLGbxw5P0rGjcw0IJb6JvSOWzVn3untjFWA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966005)(33656002)(8936002)(26005)(47076004)(70206006)(8676002)(336012)(6486002)(82740400003)(54906003)(82310400003)(70586007)(478600001)(186003)(6512007)(2906002)(86362001)(6506007)(53546011)(356005)(4326008)(2616005)(6862004)(81166007)(83380400001)(5660300002)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 11:47:03.6510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5590b5-d33f-47bd-a98b-08d895eed269
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB5225

SGksDQoNCj4gT24gMzAgTm92IDIwMjAsIGF0IDIwOjMxLCBWb2xvZHlteXIgQmFiY2h1ayA8Vm9s
b2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IEJlcnRyYW5kIE1hcnF1
aXMgd3JpdGVzOg0KPiANCj4+IEFkZCBzdXBwb3J0IGZvciBlbXVsYXRpb24gb2YgY3AxNSBiYXNl
ZCBJRCByZWdpc3RlcnMgKG9uIGFybTMyIG9yIHdoZW4NCj4+IHJ1bm5pbmcgYSAzMmJpdCBndWVz
dCBvbiBhcm02NCkuDQo+PiBUaGUgaGFuZGxlcnMgYXJlIHJldHVybmluZyB0aGUgdmFsdWVzIHN0
b3JlZCBpbiB0aGUgZ3Vlc3RfY3B1aW5mbw0KPj4gc3RydWN0dXJlLg0KPj4gSW4gdGhlIGN1cnJl
bnQgc3RhdHVzIHRoZSBNVkZSIHJlZ2lzdGVycyBhcmUgbm8gc3VwcG9ydGVkLg0KPiANCj4gSXQg
aXMgdW5jbGVhciB3aGF0IHdpbGwgaGFwcGVuIHdpdGggcmVnaXN0ZXJzIHRoYXQgYXJlIG5vdCBj
b3ZlcmVkIGJ5DQo+IGd1ZXN0X2NwdWluZm8gc3RydWN0dXJlLiBBY2NvcmRpbmcgdG8gQVJNIEFS
TSwgaXQgaXMgaW1wbGVtZW50YXRpb24NCj4gZGVmaW5lZCBpZiBzdWNoIGFjY2Vzc2VzIHdpbGwg
YmUgdHJhcHBlZC4gT24gb3RoZXIgaGFuZCwgdGhlcmUgYXJlIG1hbnkNCj4gcmVnaXN0ZXJzIHdo
aWNoIGFyZSBSQVouIFNvLCBnb29kIGJlaGF2aW5nIGd1ZXN0IGNhbiB0cnkgdG8gcmVhZCBvbmUg
b2YNCj4gdGhhdCByZWdpc3RlcnMgYW5kIGl0IHdpbGwgZ2V0IHVuZGVmaW5lZCBpbnN0cnVjdGlv
biBleGNlcHRpb24sIGluc3RlYWQNCj4gb2YganVzdCByZWFkaW5nIGFsbCB6ZXJvZXMuDQoNClRo
aXMgaXMgdHJ1ZSBpbiB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2ggYnV0IHRoaXMgaXMgc29sdmVk
IGJ5IHRoZSBuZXh0IHBhdGNoDQp3aGljaCBpcyBhZGRpbmcgcHJvcGVyIGhhbmRsaW5nIG9mIHRo
b3NlIHJlZ2lzdGVycyAoYWRkIENQMTAgZXhjZXB0aW9uDQpzdXBwb3J0KSwgYXQgbGVhc3QgZm9y
IE1WRlIgb25lcy4NCg0KRnJvbSBBUk0gQVJNIHBvaW50IG9mIHZpZXcsIEkgZGlkIGhhbmRsZSBh
bGwgcmVnaXN0ZXJzIGxpc3RlZCBJIHRoaW5rLg0KSWYgeW91IHRoaW5rIHNvbWUgYXJlIG1pc3Np
bmcgcGxlYXNlIHBvaW50IG1lIHRvIHRoZW0gYXMgTyBkbyBub3QNCmNvbXBsZXRlbHkgdW5kZXJz
dGFuZCB3aGF0IGFyZSB0aGUg4oCccmVnaXN0ZXJzIG5vdCBjb3ZlcmVk4oCdIHVubGVzcw0KeW91
IG1lYW4gdGhlIE1WRlIgb25lcy4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPj4gU2lnbmVk
LW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4g
LS0tDQo+PiBDaGFuZ2VzIGluIFYyOiByZWJhc2UNCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3Zj
cHJlZy5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IDEgZmls
ZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vdmNwcmVnLmMgYi94ZW4vYXJjaC9hcm0vdmNwcmVnLmMNCj4+IGluZGV4IGNkYzkxY2Rm
NWIuLmQwYzY0MDZmMzQgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdmNwcmVnLmMNCj4+
ICsrKyBiL3hlbi9hcmNoL2FybS92Y3ByZWcuYw0KPj4gQEAgLTE1NSw2ICsxNTUsMTQgQEAgVFZN
X1JFRzMyKENPTlRFWFRJRFIsIENPTlRFWFRJRFJfRUwxKQ0KPj4gICAgICAgICBicmVhazsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiAg
ICAgfQ0KPj4gDQo+PiArLyogTWFjcm8gdG8gZ2VuZXJhdGUgZWFzaWx5IGNhc2UgZm9yIElEIGNv
LXByb2Nlc3NvciBlbXVsYXRpb24gKi8NCj4+ICsjZGVmaW5lIEdFTkVSQVRFX1RJRDNfSU5GTyhy
ZWcsZmllbGQsb2Zmc2V0KSAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgY2FzZSBI
U1JfQ1BSRUczMihyZWcpOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4+ICsgICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgICAgIHJldHVybiBoYW5kbGVfcm9fcmVhZF92
YWwocmVncywgcmVnaWR4LCBjcDMyLnJlYWQsIGhzciwgICAgIFwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgIDEsIGd1ZXN0X2NwdWluZm8uZmllbGQuYml0c1tvZmZzZXRdKTsgICAgIFwN
Cj4+ICsgICAgfQ0KPj4gKw0KPj4gdm9pZCBkb19jcDE1XzMyKHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzLCBjb25zdCB1bmlvbiBoc3IgaHNyKQ0KPj4gew0KPj4gICAgIGNvbnN0IHN0cnVjdCBo
c3JfY3AzMiBjcDMyID0gaHNyLmNwMzI7DQo+PiBAQCAtMjg2LDYgKzI5NCwzMyBAQCB2b2lkIGRv
X2NwMTVfMzIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGNvbnN0IHVuaW9uIGhzciBoc3Ip
DQo+PiAgICAgICAgICAqLw0KPj4gICAgICAgICByZXR1cm4gaGFuZGxlX3Jhel93aShyZWdzLCBy
ZWdpZHgsIGNwMzIucmVhZCwgaHNyLCAxKTsNCj4+IA0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBI
Q1JfRUwyLlRJRDMNCj4+ICsgICAgICoNCj4+ICsgICAgICogVGhpcyBpcyB0cmFwcGluZyBtb3N0
IElkZW50aWZpY2F0aW9uIHJlZ2lzdGVycyB1c2VkIGJ5IGEgZ3Vlc3QNCj4+ICsgICAgICogdG8g
aWRlbnRpZnkgdGhlIHByb2Nlc3NvciBmZWF0dXJlcw0KPj4gKyAgICAgKi8NCj4+ICsgICAgR0VO
RVJBVEVfVElEM19JTkZPKElEX1BGUjAsIHBmcjMyLCAwKQ0KPj4gKyAgICBHRU5FUkFURV9USUQz
X0lORk8oSURfUEZSMSwgcGZyMzIsIDEpDQo+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9Q
RlIyLCBwZnIzMiwgMikNCj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0RGUjAsIGRiZzMy
LCAwKQ0KPj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfREZSMSwgZGJnMzIsIDEpDQo+PiAr
ICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9BRlIwLCBhdXgzMiwgMCkNCj4+ICsgICAgR0VORVJB
VEVfVElEM19JTkZPKElEX01NRlIwLCBtbTMyLCAwKQ0KPj4gKyAgICBHRU5FUkFURV9USUQzX0lO
Rk8oSURfTU1GUjEsIG1tMzIsIDEpDQo+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZS
MiwgbW0zMiwgMikNCj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX01NRlIzLCBtbTMyLCAz
KQ0KPj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfTU1GUjQsIG1tMzIsIDQpDQo+PiArICAg
IEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZSNSwgbW0zMiwgNSkNCj4+ICsgICAgR0VORVJBVEVf
VElEM19JTkZPKElEX0lTQVIwLCBpc2EzMiwgMCkNCj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZP
KElEX0lTQVIxLCBpc2EzMiwgMSkNCj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVIy
LCBpc2EzMiwgMikNCj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVIzLCBpc2EzMiwg
MykNCj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVI0LCBpc2EzMiwgNCkNCj4+ICsg
ICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVI1LCBpc2EzMiwgNSkNCj4+ICsgICAgR0VORVJB
VEVfVElEM19JTkZPKElEX0lTQVI2LCBpc2EzMiwgNikNCj4+ICsgICAgLyogTVZGUiByZWdpc3Rl
cnMgYXJlIGluIGNwMTAgbm8gY3AxNSAqLw0KPj4gKw0KPj4gICAgIC8qDQo+PiAgICAgICogSENS
X0VMMi5USURDUA0KPj4gICAgICAqDQo+IA0KPiANCj4gLS0gDQo+IFZvbG9keW15ciBCYWJjaHVr
IGF0IEVQQU0NCg0K

