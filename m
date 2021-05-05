Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD65373F43
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 18:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123201.232383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leK5P-0005vz-Sd; Wed, 05 May 2021 16:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123201.232383; Wed, 05 May 2021 16:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leK5P-0005t3-Od; Wed, 05 May 2021 16:09:19 +0000
Received: by outflank-mailman (input) for mailman id 123201;
 Wed, 05 May 2021 16:09:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0w6=KA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1leK5O-0005sx-02
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 16:09:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.79]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17c6c725-1c86-4272-bb2c-eac3eb68b099;
 Wed, 05 May 2021 16:09:15 +0000 (UTC)
Received: from DB6PR07CA0001.eurprd07.prod.outlook.com (2603:10a6:6:2d::11) by
 AM0PR08MB3378.eurprd08.prod.outlook.com (2603:10a6:208:dc::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.43; Wed, 5 May 2021 16:09:13 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::c2) by DB6PR07CA0001.outlook.office365.com
 (2603:10a6:6:2d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.9 via Frontend
 Transport; Wed, 5 May 2021 16:09:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 16:09:12 +0000
Received: ("Tessian outbound 13cdc29c30b8:v91");
 Wed, 05 May 2021 16:09:12 +0000
Received: from c60f44af36e3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3612E377-6165-49C8-ACA1-6B04A2EAF6D9.1; 
 Wed, 05 May 2021 16:09:06 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c60f44af36e3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 May 2021 16:09:06 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3816.eurprd08.prod.outlook.com (2603:10a6:20b:8c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Wed, 5 May
 2021 16:09:04 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4087.044; Wed, 5 May 2021
 16:09:04 +0000
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
X-Inumbo-ID: 17c6c725-1c86-4272-bb2c-eac3eb68b099
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHFEARos+GDi/KDwP4pXzymCjfeDMFFW90uUpGKgo5k=;
 b=MSX+MjneCUeYRWjRR43RN77ZfDZvZo6r7PBofOp/JEWwgT4Mj94JoVes0SR3P2Ua1AuM4OyfJfEH3WsNeEyDYG0811TNIIoS9Q+uPMV98MWB4MYhkqvhgLQw85KRgYZ4ZqbQQ03fvbxU53JLulCYfLyaAPrOURSY/YfbWcaFE04=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a7c459c7e0e62e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbYrVhW2tBUTx29sv/HakeewpQJ3W/LMY/aWgk/yfCalDS7XiGvKJvwpQtQEv6Ay72PUto6eaQmNFRZmE1hPXjhi6DrFiV1g0zFKGNPZEVA3tUHzZw8qgrLnUf/a99rIPBn9HSOD38BEmECPGClNsAOSFvGSH8az2D6io20arpDA5CQ/KZkZFaVXmvtfmFVGKbRdtj+KOcD0d0bDk3wvnBXESqoSzfWNGwyJ4NsmJitdtETa1yYvvDKYXF+0VmMPu8UcOuigIWRvLaCObk3jB4tukuxTuu1HerOTW6VqGkg21esofs9EzzjOHoY0xffLosijFujO8mvDgbD2VizvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHFEARos+GDi/KDwP4pXzymCjfeDMFFW90uUpGKgo5k=;
 b=ZFma4G12mfSBu0+cl3BdTi2sCYuacH365n2DiLl1AVX4LNGbMvZDZYWwJ/UdXLuSPnPIGF3XCNnrDO+nJcZyitzU1BsRNRyFdNO1fWShgodOZxe6vwwHm0Q/ubKu8+k1W32KrSsdQLnBM2bDkps7a4jASlolHZqnXXaMHfk45zrR5/C0En9cE2suRGVIPPCpMqtUtTQg1wrKmiBhbrNVeBHfPrGiwq7lChWfJU6P6n27wjM2Y/zQ6rhAWgqTcOfI9OLZFYjshSPvB1PgLrAKAGpouVz2LbCqUPCj8/yJXEucWljBQE23Y2Oz4rR+6j0a+QsAT5qmpVIa410UvAMhwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHFEARos+GDi/KDwP4pXzymCjfeDMFFW90uUpGKgo5k=;
 b=MSX+MjneCUeYRWjRR43RN77ZfDZvZo6r7PBofOp/JEWwgT4Mj94JoVes0SR3P2Ua1AuM4OyfJfEH3WsNeEyDYG0811TNIIoS9Q+uPMV98MWB4MYhkqvhgLQw85KRgYZ4ZqbQQ03fvbxU53JLulCYfLyaAPrOURSY/YfbWcaFE04=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 3/3] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Topic: [PATCH v4 3/3] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Index: AQHXPQazY/ZH45uzJE6do+Ec+TuCsqrR3C4AgAM7s4A=
Date: Wed, 5 May 2021 16:09:04 +0000
Message-ID: <95E9A7E3-D13B-4DFD-8423-5951BB6976BB@arm.com>
References: <cover.1619707144.git.rahul.singh@arm.com>
 <60b4c33fdcc2f7ad68d383ffae191e22b0b32f1c.1619707144.git.rahul.singh@arm.com>
 <bbc50008-da47-a5e2-501b-a9c06ce38335@suse.com>
In-Reply-To: <bbc50008-da47-a5e2-501b-a9c06ce38335@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 31485d97-8d1b-43ee-7ce1-08d90fe01fbc
x-ms-traffictypediagnostic: AM6PR08MB3816:|AM0PR08MB3378:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB33788AC69ED1153135C7C21AFC599@AM0PR08MB3378.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 baF3fzkpDjJ+qmAefegWwff084IQYz5OXkLoZKg/UZ2uFcnVyrL81mAhd+/P5+oywualXWLKSM0icJGalUqaQYmv7xC+4/dSfT45vsnqbpC/VayyDR+5WtpEYO/1Ihwn50Lwa1J0Hv8VvGj8HwWep+tW3K9uzKy5KamFp8jBpYw3P7TtWi7I6GAyGIHX0nDsdWovP8bfrs/wOnl51XHbAHRnHFTrP4E0xpjMtjbcfzV7wmlIhP7Nk+eaUlC9L60ugxdDRD1vrwKWtr++72hFU7p1PtGzPj2fmVDVpzB01n14UgiqERT8GRiIc5dW42FHqmOEa1wKB5bsqja7RqMCX0WdkANfblOGUGhIGrOEZ7ZAbqr0p4evjl6smuK8T5kTroSrTnv0cqCWfK5hww+Yma21KydnFwTW5H3Gz2bRpxhLLZREqQ05dz/RZPeUslRCrelSoamJCBSAqDP6R+6OnrtU5/Yozbsy5i3xiafXRONwiST/61toGSKy8+Y5BKkipnlKBItWuK6UOMMznr9B5CwEDz265KIS0jPYJCyue/DdY4hP4AJfGwAi2+jOPRBeh3HhzaYptSauDrXK7zUBrGQpX47t52LUQuhyqTQHtRpFzqKdl5LUl99yBaUUvwbr/OGmzuJw+prsppAbDY7yoDW8JYqg7yrfBeEMTwF7Urg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(8676002)(5660300002)(6512007)(7416002)(76116006)(478600001)(54906003)(66446008)(2616005)(53546011)(186003)(2906002)(8936002)(26005)(6506007)(4326008)(6486002)(6916009)(33656002)(38100700002)(66946007)(64756008)(66476007)(71200400001)(66556008)(36756003)(122000001)(316002)(86362001)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SCtMSGp2WWh1bUtCald1TWdJWWVqbGlWRGFrekd6ZzYwM0xHZFBOQUlrS2Jl?=
 =?utf-8?B?c3I3RlV5b2ZZU2FudzBYQTIwQmgxblVXQ3NMRUxrdkdId2dLVjlLOUxKZGd1?=
 =?utf-8?B?OE5YT2dSRFl1QXRIY0FMcEtSTFR3YlpiRU5OWjhJa0Y5cXpJMFN3T3BmQksr?=
 =?utf-8?B?eld4YThvNS9NcUJtejNXSndYZHdtVDQ3TVIvbmoxMmhHUjZvdFUvRjROTUFM?=
 =?utf-8?B?emFLbVBJRGVwR2VWM0ZjdnJDQUcycTVkSVJ6MmxyZnMxSjNBSDI2SkxhcE11?=
 =?utf-8?B?NEV2dGFjeXJnOU9SQ2g2M24vZzAwcnFQMkNTVHVvdjI3OEQrelVlQkZndUh4?=
 =?utf-8?B?U3JCTEhCNk1rSk9wNlAzeXdBWGwwTnlPczNhcTl3R1ZoVXg2S08zeFkzU2RD?=
 =?utf-8?B?Tkc1aXhCOGlLVnlZcDdTbDhsWEZqYmZ1TVErOWVzcEpucElXZ204QkVNZjJ3?=
 =?utf-8?B?V3ZNRU14OHFkWGFRVlhwdm94VXFoOE5Tek1nOU5TK0wzU2RtMTgxaXhUbWxB?=
 =?utf-8?B?Uk9XUjNTTDI5ejlsTGNoSWE0ZTN0eFpRcWZnVjZCQTdWSEVXdG0rQUxtL3Ro?=
 =?utf-8?B?V3gxNUFqcVgxelNkcDk0MW8ramFRY2dyakV4WUFudS9LOFYxUXBYZmNWUmsx?=
 =?utf-8?B?OWY5blBtUmJPYXBjMnREK2VGRVZ0bXl1SWROV1RqN0VQbkRRQzRURGVjaFBs?=
 =?utf-8?B?KzFzaHNRNmxjZXdubWMrbS9wUUdpOC9GblpEeks2NnllZzd6V05mM1NNWE1T?=
 =?utf-8?B?YUJpOGIxMFI4eWtCMTUzNDRPV256aElpWXlGQW5tbkRJbWluaWdyOWxTMkZr?=
 =?utf-8?B?clljRi9CT2lBSCtzY3lDQ1VJeDFFRnF5MVl5RXFTMnJwTkV6QWFlcDF6b0FB?=
 =?utf-8?B?NmE2N25oWVBOM01xSlJTbWtZRUtpY3NaSXBmODJLSEJjNTMvb0VJK2M1RzJF?=
 =?utf-8?B?RjhiRWlqMjE5WitiZkZReXlOVHJrZmNmUnlIbnlOc0VWRnI1ZjFKRUNsOVZT?=
 =?utf-8?B?NllHeTdudzVKU2hUNDM4YUpWN0VBSGkxZWlIL05LTHdYNFlaekRVWmVZbnN2?=
 =?utf-8?B?RWtkVXlGM2dyZVhPMXlFcmJLNjY0R2dyQ3VBNFpuUVhlUERkK3lQazRueFRU?=
 =?utf-8?B?NHRXU3c2V2UxbDlKUjE1TFRZZ2FkMG5JbmVqM0h1aWt6YkNjT0dxYTdSYzFk?=
 =?utf-8?B?bzdhQTFndDArclk0dFJTUC9pQWdYVHM3VjFFN3RmMkRzUUE4elcvSzhKN1RU?=
 =?utf-8?B?dmh2UDV2RlhjN1NMRk1WNGlmcXBZSG1LRWp3WVFYdURwN0VyRjFTdGhhYWlF?=
 =?utf-8?B?aVNlem5SRGV3QTZYTlVMLzlRcEszdlF3aTdkZnBrQUl4emRqSnNvVVR0Sjdv?=
 =?utf-8?B?SEpwNy9OQXA5Z1hrRm9BMVFPMkpVd1BnMlNzMlFreDlrZnltNk1kWmU2VHhx?=
 =?utf-8?B?Sm0rQWgvVStUc1ZITFJLQ1ErcEhnbmZHUVc3TE5PTFRzUWpDdGFDYTBYUU1B?=
 =?utf-8?B?M3J2SU82YjRzaFZHOUVVdllkNldJejJvREZxc0tET3FkQ1YvdWxvelBRMHpF?=
 =?utf-8?B?ZTR6aDhxaXNQOG1mVGxNQ3pZS3RFK2hrT0x5Wjl2Y3JWMDdreXlmazZiNVhU?=
 =?utf-8?B?VWdKSjRIYlpBem9va1FFT0xSYVdERUVnOHNzRC9KSmlJTlF6MVkxOWU3WHdk?=
 =?utf-8?B?Z0ZtNVYvdHFwcStwN01xOExPRGtMaXRNVDVRbFI3ZUhGelVnZkhVVnpaODVE?=
 =?utf-8?Q?YvwnTXXifroSW3stAuE456yR1x0jPgHhiuC32iu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29852C72184D584D90D4F2A9B3B4BD3C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3816
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8155924-7a2a-46a1-4f57-08d90fe01acd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+/t4Nqjtz0ydw/5dh/Yy8ics35mFnHcj0jP2Wr0CFUAs5WSpXUF9kaxX32Vfnmmr2xJxCDgWOtbrUABFfjm23Mb3f0n8Kz9Hd1WFeDzfu2ZewN8yjN+dXsj3tEHhaCE3Y4+0ukAkHORH/tMg0xtOMoEk+GeV5aNcAbdjxvm2XPIj8WfWme84sksST2auMpDsmO3TclH0a0xbkMQtRDeuDDCxs2EMAh8wktrPHE4R7Aac4BK2GztQHB4lUTG7zRFCZSJR3jNNwJ4ZFVC+g4TLC8P8LNqCYcBSe2FpAYWvPpKq0EQz4oHd/MbzP16CZXGohulBgJ+YR7WGnqO+ZM4FfQtlRQFP65tOjCYMBqTsBMez+zOd4mrRVJIFGsf6/+nNYw9oMCXNIAJ6sLEw2Vg8fLHn0TdRyzh/jKm8ht64MKU7JirRn9HghAiEnQxCAs6jJCsVCXyqXolC+FArvzNs1FhsKWaNgKSItA+MrAZU/eJPxTgMpYKHQy0umQ1DM9WwtvUB98z2q8hkGOpSfqkdoPe2gvMalWrs37OWQlcoXVo81fioMhKDwlTrI6sb6MUmKlCxqYEAktI3OSLB257JOhkoZuVzRWPaspvuTO7fEIykN8ey9LXPCP937NNL+Cn6fQdSAS7psjcjgGSwWKo78OBJhKv8/wLl/UwAbdKzzNI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(5660300002)(186003)(36756003)(33656002)(82310400003)(8676002)(54906003)(6862004)(336012)(36860700001)(26005)(356005)(2616005)(70586007)(81166007)(2906002)(316002)(4326008)(82740400003)(47076005)(70206006)(6506007)(53546011)(6512007)(8936002)(86362001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 16:09:12.9033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31485d97-8d1b-43ee-7ce1-08d90fe01fbc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3378

SGkgSmFuLA0KDQo+IE9uIDMgTWF5IDIwMjEsIGF0IDM6NDYgcG0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyOS4wNC4yMDIxIDE2OjQ2LCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+IE1TSSBjb2RlIHRoYXQgaW1wbGVtZW50cyBNU0kgZnVuY3Rpb25hbGl0
eSB0byBzdXBwb3J0IE1TSSB3aXRoaW4gWEVOIGlzDQo+PiBub3QgdXNhYmxlIG9uIEFSTS4gTW92
ZSB0aGUgY29kZSB1bmRlciBDT05GSUdfSEFTX1BDSV9NU0lfSU5URVJDRVBUIGZsYWcNCj4+IHRv
IGdhdGUgdGhlIGNvZGUgZm9yIEFSTS4NCj4+IA0KPj4gQ3VycmVudGx5LCB3ZSBoYXZlIG5vIGlk
ZWEgaG93IE1TSSBmdW5jdGlvbmFsaXR5IHdpbGwgYmUgc3VwcG9ydGVkIGZvcg0KPj4gb3RoZXIg
YXJjaGl0ZWN0dXJlIHRoZXJlZm9yZSB3ZSBoYXZlIGRlY2lkZWQgdG8gbW92ZSB0aGUgY29kZSB1
bmRlcg0KPj4gQ09ORklHX1BDSV9NU0lfSU5URVJDRVBULiBXZSBrbm93IHRoaXMgaXMgbm90IHRo
ZSByaWdodCBmbGFnIHRvIGdhdGUgdGhlDQo+PiBjb2RlIGJ1dCB0byBhdm9pZCBhbiBleHRyYSBm
bGFnIHdlIGRlY2lkZWQgdG8gdXNlIHRoaXMuDQo+IA0KPiBNeSBvYmplY3Rpb24gcmVtYWluczog
QWN0aXZlbHkgcHV0dGluZyBjb2RlIHVuZGVyIHRoZSB3cm9uZyBnYXRpbmcNCj4gQ09ORklHXyog
aXMgaW1vIHF1aXRlIGEgYml0IHdvcnNlIHRoYW4ga2VlcGluZyBpdCB1bmRlciBhIHRvbyB3aWRl
IG9uZQ0KPiAoZS5nLiBDT05GSUdfWDg2KSwgaWYgaW50cm9kdWNpbmcgYSBzZXBhcmF0ZSBDT05G
SUdfSEFTX1BDSV9NU0kgaXMNCj4gZGVlbWVkIHVuZGVzaXJhYmxlIGZvciB3aGF0ZXZlciByZWFz
b24uIE90aGVyd2lzZSBldmVyeSBhYnVzZSBvZg0KPiBDT05GSUdfUENJX01TSV9JTlRFUkNFUFQg
b3VnaHQgdG8gZ2V0IGEgY29tbWVudCB0byB0aGUgZWZmZWN0IG9mIHRoaXMNCj4gYmVpbmcgYW4g
YWJ1c2UsIHdoaWNoIGluIHBhcnRpY3VsYXIgZm9yIGNvZGUgeW91IG1vdmUgaW50bw0KPiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9tc2ktaW50ZXJjZXB0LmMgd291bGQgZW5kIHVwIHN1ZmZpY2ll
bnRseSBvZGQuDQo+IChBcyBhIG1pbm9yIGV4dHJhIHJlbWFyaywgcHV0dGluZyBkZWxpYmVyYXRl
bHkgbWlzcGxhY2VkIGNvZGUgYXQgdGhlDQo+IHRvcCBvZiBhIGZpbGUgcmF0aGVyIHRoYW4gYXQg
aXRzIGJvdHRvbSBpcyBsaWtlbHkgdG8gYWRkIHRvIHBvc3NpYmxlDQo+IGNvbmZ1c2lvbiBkb3du
IHRoZSByb2FkLikNCj4gDQoNCkkgdW5kZXJzdGFuZCB0aGF0IHRoaXMgaXMgbm90IHRoZSBjb3Jy
ZWN0IGZsYWcgdG8gZ2F0ZSB0aGUgY29kZS4gSWYgd2UgY2hvb3NlIHRvDQptb3ZlIHRoZSBjb2Rl
IHVuZGVyIENPTkZJR19YODYgdGhlcmUgd2lsbCBiZSAjaWZkZWYgaW4gdGhlIGNvbW1vbiBmaWxl
DQoicGFzc3Rocm91Z2gvcGNpLmPigJ0gdGhhdCBJIHRoaW5rIHdpbGwgbWFrZSBjb2RlIGhhcmRl
ciB0byB1bmRlcnN0YW5kLiBUaGUgb25seQ0Kb3B0aW9uIGxlZnQgaXMgdG8gaW50cm9kdWNlIHRo
ZSBuZXcgQ09ORklHX0hBU19QQ0lfTVNJICBvcHRpb24gYW5kIG5ldw0Kbm9uLWFyY2ggZmlsZXMg
KG1zaS5jLCBtc2kuaCkuIE1vdmUgYWxsIG5vbi1pbnRlcmNlcHQtcmVsYXRlZCBjb2RlIHRvIHRo
b3NlIGZpbGVzLg0KDQpBcyBJIG1lbnRpb24gZWFybGllciBhbHNvIHRoaXMgaXMgY29kZSBhbmQg
YXMgb2Ygbm93IHdlIGhhdmUgbm8gZGF0YSBvbiBob3cgTVNJDQp3aWxsIGJlIHN1cHBvcnRlZCBm
b3Igbm9uLXg4NiBhcmNoaXRlY3R1cmUgdGhhdOKAmXMgd2h5IHdlIGRlY2lkZWQgaXQgaXMgYmV0
dGVyIHRvIG1vdmUNCnRoZSBjb2RlIHVuZGVyIENPTkZJR19QQ0lfTVNJX0lOVEVSQ0VQVCBhbmQg
bGF0ZXIgcG9pbnQgaW4gdGltZSB3ZSBjYW4NCm1vZGlmeSB0aGUgY29kZSBvbmNlIG5vbi14ODYg
YXJjaGl0ZWN0dXJlIGltcGxlbWVudHMgTVNJIGZ1bmN0aW9uYWxpdHkgaW4gWEVOIGlmIHJlcXVp
cmVkLg0KDQpJIHdpbGwgbW92ZSB0aGUgY29kZSBhdCB0aGUgYm90dG9tIG9mIHRoZSBmaWxlIHRv
IGF2b2lkIGNvbmZ1c2lvbi4NCg0KUmVnYXJkcywNClJhaHVsDQo+IEphbg0KDQo=

