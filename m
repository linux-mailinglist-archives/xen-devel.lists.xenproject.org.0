Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B492FF389
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 19:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72361.130239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2f2Q-0005h7-Ds; Thu, 21 Jan 2021 18:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72361.130239; Thu, 21 Jan 2021 18:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2f2Q-0005gi-AZ; Thu, 21 Jan 2021 18:50:34 +0000
Received: by outflank-mailman (input) for mailman id 72361;
 Thu, 21 Jan 2021 18:50:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUQ7=GY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l2f2O-0005gd-JZ
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 18:50:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.84]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fde60c71-10a9-46f3-b49b-ad2ccb469dcb;
 Thu, 21 Jan 2021 18:50:29 +0000 (UTC)
Received: from AM4PR0101CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::28) by PA4PR08MB6142.eurprd08.prod.outlook.com
 (2603:10a6:102:ee::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 21 Jan
 2021 18:50:27 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:41:cafe::fe) by AM4PR0101CA0060.outlook.office365.com
 (2603:10a6:200:41::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Thu, 21 Jan 2021 18:50:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 18:50:26 +0000
Received: ("Tessian outbound f362b81824dc:v71");
 Thu, 21 Jan 2021 18:50:25 +0000
Received: from 72f882026f1d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A055FC0-F810-4B42-B93B-5534D352C7CD.1; 
 Thu, 21 Jan 2021 18:50:20 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72f882026f1d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jan 2021 18:50:20 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3883.eurprd08.prod.outlook.com (2603:10a6:10:76::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 21 Jan
 2021 18:50:18 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3763.016; Thu, 21 Jan 2021
 18:50:16 +0000
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
X-Inumbo-ID: fde60c71-10a9-46f3-b49b-ad2ccb469dcb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHL36avwsNuzEv9vnMdnhuhgkgbK90SRejNh8onA764=;
 b=Bg+Iocu8nJAqM/Of8Zfc63zH6bFgYVNJZZjI7xF47gEjOtwoE21b5ZMxgLqOms9ohXTob5sOi6cuEN8DGxtpa6xfCe3vWjl6Up6ef8UEn8BMcuihIDGA9gTL9RpKVJVxpOGaNEzwk5hOw9JnY6B/1NzIP0kSdtU2cl3weDJ+i1w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ca94c126973b6e5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9rRuFfAHVWP/wFjex5V8FNIheaXEiZ/hmzGXJW8lSaPcUTF1AxlCgv9qyTnzv+Yke5bv8KDIuVfo+7NT9rgZmLnBxmOWWGFj7PuOf9nijWwUwCVqbpUrQfEYI9YWvjLW9lfuz0DE+ZX879aujzzkj/1CKse8j18YGXtn45xgBpkZrJbRE4dDWy2kPjSfB4dn7jlybbnwQ1yOdVY+C0yjs4CEe8Yig6ctTO5fJcIB4UT68iRKd1P/ewsgDq5xHLCJkY83NXwhb2UO00sSdWvY2vIoGGVvRFUYnKSbfgOON+tUQ8dwRXMsu13B1VLWnikxG3cBpJ1B/zGeU/mU+Ze3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHL36avwsNuzEv9vnMdnhuhgkgbK90SRejNh8onA764=;
 b=P2vfpUOtReUd2Vp5FjcVBOy5YxxVAfFJXVUv4ob57GtCr3Vrpk9i7Fl5h2F7cUev3FxBmi5v55W7ww3XdvabgFAWKuxdBVeYODbDwaIxfkupe2ULH3CSitgBohZjoxQZcs8avznL3NTI3AyZVdf5DjTmvXV4X/m1YsuRGBBynWU43YTljsOHn2Xxfp86m14Qw5rSutA9DigJ8YBENu//+h3af+gK1mdbqe+tLPyXqY16adJbepnYogdCVwcgzoEAtUZZw17kxcu2NhqqiEPvCq1ssUrpsOpu4L06YYVHtaoC3Oki8dqfqApex/fjl31XTI7DnsSYWJoq9EPUTUXaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHL36avwsNuzEv9vnMdnhuhgkgbK90SRejNh8onA764=;
 b=Bg+Iocu8nJAqM/Of8Zfc63zH6bFgYVNJZZjI7xF47gEjOtwoE21b5ZMxgLqOms9ohXTob5sOi6cuEN8DGxtpa6xfCe3vWjl6Up6ef8UEn8BMcuihIDGA9gTL9RpKVJVxpOGaNEzwk5hOw9JnY6B/1NzIP0kSdtU2cl3weDJ+i1w=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Topic: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Index: AQHW7zzXDLVfiB5hzUKpOAlBcRNn7KoxCUaAgAFLH4CAABRdAIAABUSA
Date: Thu, 21 Jan 2021 18:50:14 +0000
Message-ID: <35D8F2EE-8875-4941-8C5A-2BDB8B29F421@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
 <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com>
 <b35211f0-d523-aa5f-55a1-6afa5142617c@gmail.com>
 <F193260F-E4F0-4977-97ED-72505603C5F6@arm.com>
 <d5c1f75a-8e5c-a938-0d10-a0d276643052@xen.org>
In-Reply-To: <d5c1f75a-8e5c-a938-0d10-a0d276643052@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 293aec7a-612f-405d-7192-08d8be3d6ab4
x-ms-traffictypediagnostic: DB7PR08MB3883:|PA4PR08MB6142:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6142DC28E16E99BBD79C8835FCA10@PA4PR08MB6142.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2z1UJzzE40xZqLGycwR5PKCviWEFtDF2wJ0hTIWf9vMMFXS2BhvmAAefZRD24QnefWkJ8fSymHn2+yKCfkhLLecseMVG89VlO2HhaAUdqmixY7f2zugeNjzZzGPM/M7Wg4lmMyfLStjWjSfs19tyskpl0KbXbnWXr7xK/NzHldSsPxG4ikc4334wYo2r3uLSkryFfarAFdGMzOvQTmdlrxCITfirrMXhmSE0K2pN8J0cuz0KYf2snVdOpL04GsI80ayg/oUc992OTXqAT6dl/vIX1OJEVySKNFL4onWtGeuDsaseEw5PlVEgSuuXNAzYqtaB0qrcpkmd34jpHtR9ckCqSb225XlPeXZhWN/06t1jZQ6A+UfrNenMQTAIlMyedb2rBxSFO0oC94zI4fT+R2u0N0WDqnHZOBjgUs6lQlenOm/edR9s/pX68MpMVbhH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(33656002)(54906003)(316002)(2906002)(66556008)(66946007)(66446008)(64756008)(5660300002)(91956017)(76116006)(66476007)(86362001)(8676002)(36756003)(6512007)(83380400001)(71200400001)(7416002)(2616005)(6486002)(53546011)(6506007)(6916009)(4326008)(8936002)(186003)(478600001)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?RWY2YU9Ia1d3aWtxc004Zzc0YUFBSnBHTTB4TTE5WUUwSGk0U09XNXNpR3Z1?=
 =?utf-8?B?RC9DL2VyTzdma1FNS09xSEZWTFo3R0lsdC9wcjVpRkhhYmRYTFdvU1BDSjNR?=
 =?utf-8?B?QVJiVHBMRXE3aTQzWFhlZWJ3VEFaaW9lTlQ2QUVJUHFmV1lHM2RUd2JZTUJz?=
 =?utf-8?B?T2J6Y1lYNWhMdGNONk1IdFM2ckM3N2wvSXA1OFdXV2pyUnhtU1UxaVQ3eEY4?=
 =?utf-8?B?YWt6bDNZN2FVREd5NnlabUhySEdoZng1dWpLK04rWWRYVnlPNElUb3RyMGRy?=
 =?utf-8?B?TWNUQzVxUmhSQWgrckFVUlR2OWdqMENjaEJjYTVyNEQ3RUNkdlVTSWZVQ0xX?=
 =?utf-8?B?UzF5Yy9FY0xlT2p6Ky9YdXFONko0Y1I0MHM1cGovMlJEYVpDMUdLb01FZ2Fi?=
 =?utf-8?B?OTBFMUhMSU1zNmtNbjNvbVpXRUpTQXVnMTlTSkRNNmRTK3VTMTJ2RGltK1Ix?=
 =?utf-8?B?dHJ2M1NuaG9ITWdIblBFZUZzZXJIWDUwMDRVVDhXUDJTT0xvNmhVd0hXZzUx?=
 =?utf-8?B?T0tNU2lxOXZ3eU5RVzY5bGNaZk5FazNWbVlqdFVJNFl3ZHpreElJWk4vcEhv?=
 =?utf-8?B?L1luNUdxVmU2anFySWlRVCtudytRZ1V2MzE5bENCUnVFY0RwQ29SQ0pxQUFm?=
 =?utf-8?B?bGVJUnB6d2JoRGpxU2ljTllxZ003YVhZUkVGc0Y5aGo1SkRqMVpxcnhIWlNF?=
 =?utf-8?B?dE9OM1MyaWFHNU10dHdxYS9ab2hCKytvdGFvZk9qTmY2L2Q3dU5EUEE2b2Z1?=
 =?utf-8?B?ODRZUWlRQ3diNGpIRkRHeld0cXUxOUUwb3VocEVKVi9Yd0Q2c0FIUnFyL2p4?=
 =?utf-8?B?S0NLbEZWdy93YlFQT0FibU9wVFphV08vVmJBT0dyS0tnQkI1NitFTm10TDRB?=
 =?utf-8?B?UEErM0lSbHdIV3FJamhTdzRyZzNISTFzT3VINkZCaTc3ZktDNHdnVU5Yekd3?=
 =?utf-8?B?MEI4UDNDTTJnMzE0MkdFY1J4MTVoVmdEWDNOaUdxRFo4Ykh4RjFTVTIrcHBn?=
 =?utf-8?B?bFRyMTErMVUycXRENEx4c1VlOWtkR2lJb0h6VktCNkdnc2RxQU42VnRqazRv?=
 =?utf-8?B?SnRWZkxUMi90SjFyNXlIUU4xcnBXZjN6Qm41YWhTU0g2U0hmQ3FNRGxvancv?=
 =?utf-8?B?S1Jpc1o0UVBpSTB4OHRJREtMNDg3cXJTT1h0dTJiZHlZU0RQNVVmZ1lxc2dL?=
 =?utf-8?B?RVd0MHhzZTJObzJYNU1RVWhJVUxrbXlZMnFEOERXQ1pvdFg1M0NtdWF6SGYx?=
 =?utf-8?B?QTVzblBNNTF3VXpqeDAvTjhybCtlN3R1OFNjUnNLYTh2Z3hkWTM0M08yWGg0?=
 =?utf-8?B?SFQ3K0NGT2w4cGNmeUk3bXJuM2VGL2dVT1VITmM5akN3Z1Q0aEFOTnNHMXpr?=
 =?utf-8?B?b2grVVltVldBOGlFcFRBaFhFUEZUdlRJa1lxeEl6ZW1PMmMyaFgrd0NaZURS?=
 =?utf-8?Q?xRrdAzWy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5431E47A129AFF4CB37FFFD9A8DA38C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3883
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1db5834c-1b1a-4791-3ee7-08d8be3d6489
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VUfd5xlBA+XIhp/U69PuP7X5OnfFjAo2qhNmIMMFKcNaCQa914hHP7iHw6vDTaX2X3oPWxyFy+/tu/EzRvH6SNqj7JPQ3Gw8zg81Qt1qaVsD4EkNFAi+X2Afb4T6e+TyTVLv4/bIS5MQ02o8eUj+5d9IiK+EsEgGZvfRXrJQhBPFxuY6J3saJlpiKxVrRRMOVNKQZBVOgduY5oMDRfNZtSq02zQpAFgzR59MbZfl7sP5XlBA5Py/R39H/G0gz0TpnP88nG0VdIl7bsdI4eMf030EaThE1tYgQiKGR6BH9uut9GGvgWx/cE36Z3V78siFespdfRCYalKkmN6BecQDwG9nJU3EWAb/G9hNL8/ExX5VwWPi1ZMzLVw8KSQlkJrZ8JnlwQmfnA4+dRJt143dCb2a3UJAsagLGmxMFYhzOaZpmNdHgvYwtE2uFlYHiiGmIEPiXiigwmYO3Y4c5pN9yA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(46966006)(8676002)(82310400003)(36756003)(2616005)(86362001)(47076005)(316002)(186003)(336012)(70586007)(54906003)(5660300002)(26005)(6512007)(8936002)(83380400001)(6506007)(6862004)(33656002)(82740400003)(53546011)(4326008)(2906002)(478600001)(356005)(70206006)(6486002)(81166007)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 18:50:26.4608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 293aec7a-612f-405d-7192-08d8be3d6ab4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6142

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDIxIEphbiAyMDIxLCBhdCA2OjMxIHBtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IE9uIDIxLzAxLzIwMjEgMTc6MTgsIFJh
aHVsIFNpbmdoIHdyb3RlOg0KPj4gSGVsbG8gT2xla3NhbmRyLA0KPiANCj4gSGksDQo+IA0KPj4+
IE9uIDIwIEphbiAyMDIxLCBhdCA5OjMzIHBtLCBPbGVrc2FuZHIgPG9sZWtzdHlzaEBnbWFpbC5j
b20+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IE9uIDIwLjAxLjIxIDE2OjUyLCBSYWh1bCBTaW5n
aCB3cm90ZToNCj4+PiANCj4+PiBIaSBSYWh1bA0KPj4+IA0KPj4+PiBBZGQgc3VwcG9ydCBmb3Ig
QVJNIGFyY2hpdGVjdGVkIFNNTVV2MyBpbXBsZW1lbnRhdGlvbi4gSXQgaXMgYmFzZWQgb24NCj4+
Pj4gdGhlIExpbnV4IFNNTVV2MyBkcml2ZXIuDQo+Pj4+IA0KPj4+PiBEcml2ZXIgaXMgY3VycmVu
dGx5IHN1cHBvcnRlZCBhcyBUZWNoIFByZXZpZXcuDQo+Pj4+IA0KPj4+PiBNYWpvciBkaWZmZXJl
bmNlcyB3aXRoIHJlZ2FyZCB0byBMaW51eCBkcml2ZXIgYXJlIGFzIGZvbGxvd3M6DQo+Pj4+IDIu
IE9ubHkgU3RhZ2UtMiB0cmFuc2xhdGlvbiBpcyBzdXBwb3J0ZWQgYXMgY29tcGFyZWQgdG8gdGhl
IExpbnV4IGRyaXZlcg0KPj4+PiAgICB0aGF0IHN1cHBvcnRzIGJvdGggU3RhZ2UtMSBhbmQgU3Rh
Z2UtMiB0cmFuc2xhdGlvbnMuDQo+Pj4+IDMuIFVzZSBQMk0gIHBhZ2UgdGFibGUgaW5zdGVhZCBv
ZiBjcmVhdGluZyBvbmUgYXMgU01NVXYzIGhhcyB0aGUNCj4+Pj4gICAgY2FwYWJpbGl0eSB0byBz
aGFyZSB0aGUgcGFnZSB0YWJsZXMgd2l0aCB0aGUgQ1BVLg0KPj4+PiA0LiBUYXNrbGV0cyBhcmUg
dXNlZCBpbiBwbGFjZSBvZiB0aHJlYWRlZCBJUlEncyBpbiBMaW51eCBmb3IgZXZlbnQgcXVldWUN
Cj4+Pj4gICAgYW5kIHByaW9yaXR5IHF1ZXVlIElSUSBoYW5kbGluZy4NCj4+Pj4gNS4gTGF0ZXN0
IHZlcnNpb24gb2YgdGhlIExpbnV4IFNNTVV2MyBjb2RlIGltcGxlbWVudHMgdGhlIGNvbW1hbmRz
IHF1ZXVlDQo+Pj4+ICAgIGFjY2VzcyBmdW5jdGlvbnMgYmFzZWQgb24gYXRvbWljIG9wZXJhdGlv
bnMgaW1wbGVtZW50ZWQgaW4gTGludXguDQo+Pj4+ICAgIEF0b21pYyBmdW5jdGlvbnMgdXNlZCBi
eSB0aGUgY29tbWFuZHMgcXVldWUgYWNjZXNzIGZ1bmN0aW9ucyBhcmUgbm90DQo+Pj4+ICAgIGlt
cGxlbWVudGVkIGluIFhFTiB0aGVyZWZvcmUgd2UgZGVjaWRlZCB0byBwb3J0IHRoZSBlYXJsaWVy
IHZlcnNpb24NCj4+Pj4gICAgb2YgdGhlIGNvZGUuIEF0b21pYyBvcGVyYXRpb25zIGFyZSBpbnRy
b2R1Y2VkIHRvIGZpeCB0aGUgYm90dGxlbmVjaw0KPj4+PiAgICBvZiB0aGUgU01NVSBjb21tYW5k
IHF1ZXVlIGluc2VydGlvbiBvcGVyYXRpb24uIEEgbmV3IGFsZ29yaXRobSBmb3INCj4+Pj4gICAg
aW5zZXJ0aW5nIGNvbW1hbmRzIGludG8gdGhlIHF1ZXVlIGlzIGludHJvZHVjZWQsIHdoaWNoIGlz
IGxvY2stZnJlZQ0KPj4+PiAgICBvbiB0aGUgZmFzdC1wYXRoLg0KPj4+PiAgICBDb25zZXF1ZW5j
ZSBvZiByZXZlcnRpbmcgdGhlIHBhdGNoIGlzIHRoYXQgdGhlIGNvbW1hbmQgcXVldWUNCj4+Pj4g
ICAgaW5zZXJ0aW9uIHdpbGwgYmUgc2xvdyBmb3IgbGFyZ2Ugc3lzdGVtcyBhcyBzcGlubG9jayB3
aWxsIGJlIHVzZWQgdG8NCj4+Pj4gICAgc2VyaWFsaXplcyBhY2Nlc3NlcyBmcm9tIGFsbCBDUFVz
IHRvIHRoZSBzaW5nbGUgcXVldWUgc3VwcG9ydGVkIGJ5DQo+Pj4+ICAgIHRoZSBoYXJkd2FyZS4g
T25jZSB0aGUgcHJvcGVyIGF0b21pYyBvcGVyYXRpb25zIHdpbGwgYmUgYXZhaWxhYmxlIGluDQo+
Pj4+ICAgIFhFTiB0aGUgZHJpdmVyIGNhbiBiZSB1cGRhdGVkLg0KPj4+PiA2LiBTcGluIGxvY2sg
aXMgdXNlZCBpbiBwbGFjZSBvZiBtdXRleCB3aGVuIGF0dGFjaGluZyBhIGRldmljZSB0byB0aGUN
Cj4+Pj4gICAgU01NVSwgYXMgdGhlcmUgaXMgbm8gYmxvY2tpbmcgbG9ja3MgaW1wbGVtZW50YXRp
b24gYXZhaWxhYmxlIGluIFhFTi4NCj4+Pj4gICAgVGhpcyBtaWdodCBpbnRyb2R1Y2UgbGF0ZW5j
eSBpbiBYRU4uIE5lZWQgdG8gaW52ZXN0aWdhdGUgYmVmb3JlDQo+Pj4+ICAgIGRyaXZlciBpcyBv
dXQgZm9yIHRlY2ggcHJldmlldy4NCj4+Pj4gNy4gUENJIEFUUyBmdW5jdGlvbmFsaXR5IGlzIG5v
dCBzdXBwb3J0ZWQsIGFzIHRoZXJlIGlzIG5vIHN1cHBvcnQNCj4+Pj4gICAgYXZhaWxhYmxlIGlu
IFhFTiB0byB0ZXN0IHRoZSBmdW5jdGlvbmFsaXR5LiBDb2RlIGlzIG5vdCB0ZXN0ZWQgYW5kDQo+
Pj4+ICAgIGNvbXBpbGVkLiBDb2RlIGlzIGd1YXJkZWQgYnkgdGhlIGZsYWcgQ09ORklHX1BDSV9B
VFMuDQo+Pj4+IDguIE1TSSBpbnRlcnJ1cHRzIGFyZSBub3Qgc3VwcG9ydGVkIGFzIHRoZXJlIGlz
IG5vIHN1cHBvcnQgYXZhaWxhYmxlIGluDQo+Pj4+ICAgIFhFTiB0byByZXF1ZXN0IE1TSSBpbnRl
cnJ1cHRzLiBDb2RlIGlzIG5vdCB0ZXN0ZWQgYW5kIGNvbXBpbGVkLiBDb2RlDQo+Pj4+ICAgIGlz
IGd1YXJkZWQgYnkgdGhlIGZsYWcgQ09ORklHX01TSS4NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ2hh
bmdlcyBzaW5jZSB2MjoNCj4+Pj4gLSBhZGRlZCByZXR1cm4gc3RhdGVtZW50IGZvciByZWFkeF9w
b2xsX3RpbWVvdXQgZnVuY3Rpb24uDQo+Pj4+IC0gcmVtb3ZlIGlvbW11X2dldF9kbWFfY29va2ll
IGFuZCBpb21tdV9wdXRfZG1hX2Nvb2tpZS4NCj4+Pj4gLSByZW1vdmUgc3RydWN0IGFybV9zbW11
X3hlbl9kZXZpY2UgYXMgbm90IHJlcXVpcmVkLg0KPj4+PiAtIG1vdmUgZHRfcHJvcGVydHlfbWF0
Y2hfc3RyaW5nIHRvIGRldmljZV90cmVlLmMgZmlsZS4NCj4+Pj4gLSByZXBsYWNlIGFybV9zbW11
XypfdGhyZWFkIHRvIGFybV9zbW11XypfdGFza2xldCB0byBhdm9pZCBjb25mdXNpb24uDQo+Pj4+
IC0gdXNlIEFSTV9TTU1VX1JFR19TWiBhcyBzaXplIHdoZW4gbWFwIG1lbW9yeSB0byBYRU4uDQo+
Pj4+IC0gcmVtb3ZlIGJ5cGFzcyBrZXl3b3JkIHRvIG1ha2Ugc3VyZSB3aGVuIGRldmljZS10cmVl
IHByb2JlIGlzIGZhaWxlZCB3ZQ0KPj4+PiAgIGFyZSByZXBvcnRpbmcgZXJyb3IgYW5kIG5vdCBj
b250aW51aW5nIHRvIGNvbmZpZ3VyZSBTTU1VIGluIGJ5cGFzcw0KPj4+PiAgIG1vZGUuDQo+Pj4+
IC0gZml4ZWQgbWlub3IgY29tbWVudHMuDQo+Pj4+IENoYW5nZXMgc2luY2UgdjM6DQo+Pj4+IC0g
Rml4ZWQgdHlwbyBmb3IgQ09ORklHX01TSQ0KPj4+PiAtIEFkZGVkIGJhY2sgdGhlIG11dGV4IGNv
ZGUNCj4+Pj4gLSBSZWJhc2UgdGhlIHBhdGNoIG9uIHRvcCBvZiBuZXdseSBhZGRlZCBXQVJOX09O
KCkuDQo+Pj4+IC0gUmVtb3ZlIHRoZSBkaXJlY3QgcmVhZCBvZiByZWdpc3RlciBWVENSX0VMMi4N
Cj4+Pj4gLSBGaXhlZCBtaW5vciBjb21tZW50cy4NCj4+Pj4gQ2hhbmdlcyBzaW5jZSB2NDoNCj4+
Pj4gLSBSZXBsYWNlIHRoZSBmZnNsbCgpIHdpdGggZmZzNjQoKSBmdW5jdGlvbi4NCj4+Pj4gLSBB
ZGQgY29kZSB0byBmcmVlIHJlc291cmNlcyB3aGVuIHByb2JlIGZhaWxlZC4NCj4+PiANCj4+PiBU
aGFuayB5b3UgZm9yIGFkZHJlc3NpbmcsIHBhdGNoIGxvb2tzIG9rIHRvIG1lLCBqdXN0IG9uZSBz
bWFsbCByZW1hcmsgYmVsb3c6DQo+Pj4gDQo+Pj4gDQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyB2b2lk
IF9faHdkb21faW5pdCBhcm1fc21tdV9pb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQp
DQo+Pj4+ICt7DQo+Pj4+ICt9DQo+Pj4gDQo+Pj4gV2UgZGlzY3Vzc2VkIGluIFY0IGFib3V0IGFk
ZGluZyBzb21lIGNvZGUgaGVyZSB3aGljaCBhbGwgSU9NTVVzIG9uIEFybSBhbHJlYWR5IGhhdmUs
IGNvcHkgaXQgYmVsb3cgZm9yIHRoZSBjb252ZW5pZW5jZToNCj4+PiANCj4+PiANCj4+PiAgICAg
IC8qIFNldCB0byBmYWxzZSBvcHRpb25zIG5vdCBzdXBwb3J0ZWQgb24gQVJNLiAqLw0KPj4+ICAg
ICAgaWYgKCBpb21tdV9od2RvbV9pbmNsdXNpdmUgKQ0KPj4+ICAgICAgICAgIHByaW50ayhYRU5M
T0dfV0FSTklORw0KPj4+ICAgICAgICAgICJtYXAtaW5jbHVzaXZlIGRvbTAtaW9tbXUgb3B0aW9u
IGlzIG5vdCBzdXBwb3J0ZWQgb24gQVJNXG4iKTsNCj4+PiAgICAgIGlvbW11X2h3ZG9tX2luY2x1
c2l2ZSA9IGZhbHNlOw0KPj4+ICAgICAgaWYgKCBpb21tdV9od2RvbV9yZXNlcnZlZCA9PSAxICkN
Cj4+PiAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4+PiAgICAgICAgICAibWFwLXJl
c2VydmVkIGRvbTAtaW9tbXUgb3B0aW9uIGlzIG5vdCBzdXBwb3J0ZWQgb24gQVJNXG4iKTsNCj4+
PiAgICAgIGlvbW11X2h3ZG9tX3Jlc2VydmVkID0gMDsNCj4+PiANCj4+PiAgICAgIGFyY2hfaW9t
bXVfaHdkb21faW5pdChkKTsNCj4+PiANCj4+PiANCj4+PiBBbHNvIHdlIGRpc2N1c3NlZCBhYm91
dCBwb3NzaWJpbGl0eSB0byBmb2xkIHRoZSBwYXJ0IG9mIGNvZGUgKHdoaWNoIGRpc2FibGVzIHVu
c3VwcG9ydGVkIG9wdGlvbnMpIGluIGFyY2hfaW9tbXVfaHdkb21faW5pdCgpIHRvIGF2b2lkIGR1
cGxpY2F0aW9uIGFzIGEgZm9sbG93LXVwLg0KPj4+IEF0IGxlYXN0LCBJIGV4cGVjdGVkIHRvIHNl
ZSBhcmNoX2lvbW11X2h3ZG9tX2luaXQoKSB0byBiZSBjYWxsZWQgYnkgYXJtX3NtbXVfaW9tbXVf
aHdkb21faW5pdCgpIGl0IGN1cnJlbnQgcGF0Y2guLi4gUGxlYXNlIG5vdGUsIHRoaXMgaXMgKm5v
dCogYSByZXF1ZXN0IGZvciBjaGFuZ2UgaW1tZWRpYXRlbHksDQo+Pj4gSSB0aGluaywgZHJpdmVy
IGlzIGZ1bmN0aW9uYWwgZXZlbiB3aXRob3V0IHRoaXMgY29kZSAoaG9wZWZ1bGx5IGFyY2hfaW9t
bXVfaHdkb21faW5pdCBpcyBlbXB0eSBub3csIGV0YykuICBCdXQsIGlmIHlvdSBoYXBwZW4gdG8g
ZG8gVjYgb3IgcHJvYmFibHkgaXQgY291bGQgYmUgZG9uZSBvbiBjb21taXQgLi4uDQo+Pj4gDQo+
PiBZZXMgSSB3aWxsIHNlbmQgdGhlIHBhdGNoIHRvIG1vdmUgdGhlIGNvZGUgdG8gYXJjaF9pb21t
dV9od2RvbV9pbml0KCkgdG8gYXZvaWQgZHVwbGljYXRpb24gb25jZSBTTU1VdjMgZHJpdmVyIHdp
bGwgYmUgbWVyZ2VkLg0KPj4gSSB0aG91Z2h0IGFueXdheSBJIGhhdmUgdG8gcmVtb3ZlIHRoZSBj
b2RlIGZyb20gU01NVXYxIGFuZCBJUE1NVSBJIHdpbGwgdGFrZSBjYXJlIG9mIGFsbCB0aGUgSU9N
TVUgZHJpdmVyIGF0IHRoZSBzYW1lIHRpbWUgYmVjYXVzZSBvZiB0aGF0IEkgZGlkbuKAmXQgbW9k
aWZ5IHRoZSBTTU1VdjMgZHJpdmVyLg0KPiANCj4gVGhlcmUgYXJlIHR3byBwYXJ0IGluIHRoZSBw
cm9ibGVtIGhlcmU6DQo+ICAxKSBDb2RlIGR1cGxpY2F0aW9uDQo+ICAyKSBUaGUgU01NVXYzIG5v
dCBjaGVja2luZyB0aGUgY29tbWFuZCBsaW5lIGFuZCBjYWxsaW5nIGFyY2hfaW9tbXVfaHdkb21f
aW5pdChkKQ0KPiANCj4gSSBhZ3JlZSB0aGF0IDEpIGNhbiBiZSBkZWZlcnJlZCBiZWNhdXNlIGl0
IGlzIGEgY2xlYW4tdXAuIEhvd2V2ZXIsIEkgY29uc2lkZXIgMikgYSAobGF0ZW50KSBidWcgYmVj
YXVzZSBpdCBtZWFucyB0aGF0IHdlIHJpc2sgdW5pbnRlbnRpb25hbGx5IGJyZWFraW5nIHRoZSBT
TU1VdjMgZHJpdmVyIGlzIHdlIG5lZWQgdG8gYWRkIGNvZGUgaW4gYXJjaF9pb21tdV9od2RvbV9p
bml0KCkgYXMgcGFydCBvZiBhIGZ1dHVyZSBidWcgZml4IGZvciA0LjE1Lg0KPiANCj4gVGhlcmVm
b3JlLi4uDQo+IA0KPj4gWWVzIGlmIHRoZXJlIGlzIGEgbmVlZCBmb3IgdjYgSSB3aWxsIGFkZCB0
aGUgYXJjaF9pb21tdV9od2RvbV9pbml0KGQpIGluIGFybV9zbW11X2lvbW11X2h3ZG9tX2luaXQo
KS4NCj4gDQo+IC4uLiBJIHRoaW5rIGNhbGxpbmcgYXJjaF9pb21tdV9od2RvbV9pbml0KCkgc2hv
dWxkIGJlIHRoZSBzdHJpY3QgbWluaW11bS4gU28gcGxlYXNlIGFkZHJlc3MgaXQuIEFsdGhvdWdo
LCBubyBuZWVkIHRvIHJlc2VuZCB0aGUgZnVsbCBzZXJpZXMsIHlvdSBjYW4gb25seSByZXNlbmQg
cGF0Y2ggIzEwLg0KDQpPay4gSSBhZ3JlZSB3aXRoIHlvdSBJIHdpbGwgc2VuZCB0aGUgbmV4dCB2
ZXJzaW9uIHRvIGZpeCB0aGUgc2FtZS4gIFBsZWFzZSBzdWdnZXN0IGRvIHlvdSB3YW50IG1lIHRv
IGNoZWNrIGNvbW1hbmQgbGluZSBhbHNvIGluIFNNTVV2MyBub3cgYW5kIGxhdGVyIHJlbW92ZSB0
aGUgY29kZSBvbmNlIEkgd2lsbCBzZW5kIHRoZSBwYXRjaCB0byBtb3ZlIGR1cGxpY2F0ZSBjb2Rl
LiANCg0KLS0tDQovKiBTZXQgdG8gZmFsc2Ugb3B0aW9ucyBub3Qgc3VwcG9ydGVkIG9uIEFSTS4g
Ki8gICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgaWYgKCBpb21tdV9od2RvbV9pbmNs
dXNpdmUgKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0K
ICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgIm1hcC1pbmNsdXNpdmUgZG9tMC1pb21t
dSBvcHRpb24gaXMgbm90IHN1cHBvcnRlZCBvbiBBUk1cbiIpOyAgICAgICAgICAgDQogICAgaW9t
bXVfaHdkb21faW5jbHVzaXZlID0gZmFsc2U7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIA0KICAgIGlmICggaW9tbXVfaHdkb21fcmVzZXJ2ZWQgPT0gMSApICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgcHJpbnRr
KFhFTkxPR19XQVJOSU5HICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgDQogICAgICAgICJtYXAtcmVzZXJ2ZWQgZG9tMC1pb21tdSBvcHRpb24gaXMgbm90
IHN1cHBvcnRlZCBvbiBBUk1cbiIpOyAgICAgICAgICAgIA0KICAgIGlvbW11X2h3ZG9tX3Jlc2Vy
dmVkID0gMDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgYXJjaF9pb21tdV9od2RvbV9pbml0KGQp
Ow0KDQotLQ0KDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSAN
Cj4gSnVsaWVuIEdyYWxsDQoNCg==

