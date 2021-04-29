Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D5936EB35
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 15:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120000.226899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6WT-0001VX-4I; Thu, 29 Apr 2021 13:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120000.226899; Thu, 29 Apr 2021 13:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6WT-0001V7-0p; Thu, 29 Apr 2021 13:16:05 +0000
Received: by outflank-mailman (input) for mailman id 120000;
 Thu, 29 Apr 2021 13:16:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKuK=J2=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lc6WS-0001Uy-8B
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:16:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.62]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56d007e1-daa6-4c8b-b245-1526442588c4;
 Thu, 29 Apr 2021 13:16:01 +0000 (UTC)
Received: from AM5PR0101CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::14) by AM4PR08MB2772.eurprd08.prod.outlook.com
 (2603:10a6:205:3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 13:15:58 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::3d) by AM5PR0101CA0001.outlook.office365.com
 (2603:10a6:206:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Thu, 29 Apr 2021 13:15:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 13:15:58 +0000
Received: ("Tessian outbound 13cdc29c30b8:v91");
 Thu, 29 Apr 2021 13:15:57 +0000
Received: from 7d43fad22ac3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B323D4C7-101F-4003-9620-1F6876D80ADE.1; 
 Thu, 29 Apr 2021 13:15:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d43fad22ac3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Apr 2021 13:15:49 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3197.eurprd08.prod.outlook.com (2603:10a6:803:3e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 13:15:44 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4065.028; Thu, 29 Apr 2021
 13:15:44 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LNXP265CA0027.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Thu, 29 Apr 2021 13:15:43 +0000
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
X-Inumbo-ID: 56d007e1-daa6-4c8b-b245-1526442588c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8qhvCw39d1uUVtlEmSp51yR+Os6gWlJ4knARHVTV74=;
 b=jule1LUpdH8Q5u8q22muoIOCORtlTNlLQKpXv8Vr9dEc7Gvhkpi62fhbbHPs4CsaHasrDJLMV4OY0kcp/fAZkpbrr5vobN2mmwH0OLh6R847+lPyMytucVHrLaGCj9SBKhjHjJSDxKlpIIcxDoYq6Wsa7Lcr3MM3k3+3bXKy9Po=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac9cc124c855b25c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0R0gJ4xKyJeg9Nrdubn8dPqiWRke7CFJstgZXas1P4BWdAppMyL2jFgzIYqKnmQb1EMkE4kb0XLquysfthJ3/G6v7F/zRr74FHtqi4I6gAZON59tpk23BYS6VsUpsfoR220CmvL25pUwBvVtqMzH2JJJDHjoLCCkYNdzTGW1ioweKJbo5+OlMA31PprbPhZE2xPuUgIWYhsxpofCqB6S2qICRNMd/eS3xY2Ss5FJzGny/HzgQwpp+IuierOCbNwpGeTIPiRQsNyzW/Ie58cdeUfXBKEnXNQbm773K2ApR23zSz7+Xzpjd952FyxahAmKNUj2794dtpPIpXP1BpNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8qhvCw39d1uUVtlEmSp51yR+Os6gWlJ4knARHVTV74=;
 b=f6gC7OufDySpuTcQAYYGufsGkQdPyfzer6GWdAM3tVCs2aRhSKl956SpwzcTyEiyDTaNSdTMV4+/2pIUBn7+KdBBPObcX750DZpmgVrqderLxyxgRTGW9Pe6vGGAAKPOjJnMFrKA+0A/ZmgYIZixRxxAEyqdVg2+vnT7Opkp3byMez+SyCJXRMXhidETz2Tx0pHBMVHvJHNfxB/zARQ27d6i6r0N3IfQ6yng78MYM4CFWBPYnyPqaNUoU5RHMpZM9pdkJ99vOE/v11dQqxSEYLGlPK9GIt5a9R+PQmton0uCJBtD4nwcLUYU9LtvRlNx69bkDOFLVPDI/bgvpyDAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8qhvCw39d1uUVtlEmSp51yR+Os6gWlJ4knARHVTV74=;
 b=jule1LUpdH8Q5u8q22muoIOCORtlTNlLQKpXv8Vr9dEc7Gvhkpi62fhbbHPs4CsaHasrDJLMV4OY0kcp/fAZkpbrr5vobN2mmwH0OLh6R847+lPyMytucVHrLaGCj9SBKhjHjJSDxKlpIIcxDoYq6Wsa7Lcr3MM3k3+3bXKy9Po=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v3 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <843b7489-bf08-7313-767c-9c9f1c719736@suse.com>
Date: Thu, 29 Apr 2021 14:15:37 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9B01F170-25AC-4777-B913-C46358F49D28@arm.com>
References: <20210426153741.26904-1-luca.fancellu@arm.com>
 <20210426153741.26904-4-luca.fancellu@arm.com>
 <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
 <E47AFE69-CA75-468D-868D-182F78C6992C@arm.com>
 <d50b05f7-f644-0123-9994-d31668bd5b5f@suse.com>
 <38004B72-8F91-4B4E-843E-B80911DC48B3@arm.com>
 <843b7489-bf08-7313-767c-9c9f1c719736@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LNXP265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::15) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e163c04c-ef01-417d-1b12-08d90b10ed8b
X-MS-TrafficTypeDiagnostic: VI1PR08MB3197:|AM4PR08MB2772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB2772A66BA3EAE34CE7821E50E45F9@AM4PR08MB2772.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9kjZ/qB9DVMVkNWLKnZmskQNIQ0ib81DA4Y41NJRkAGXxuKaqenHu17R8T7OxfCmNBJ4YCiX+8tzKLZ6LtfJf7Xhfb2MBqRJUlC1iiN2/DavGbe3ld6ubwXzKL8gfxLYbHbEWAUQ+dlNGXY+h+JsYTRdKop3+ZHEuBG70viJIaMd76ebVAF/tpH995aSVy+2/aRct6jTA9Tm5R+/DOQ1MKm7RSMK73Mqu8rm8o89uinXflY6b1YQ/C0t1enLiZR32ZlvItwi1R9U/420MDFd5J41+79o5SRsrQRtYDY+951yR8b5hYHf954icJGhHqDva+u41JWO/lovNeX9xpGvj/ydNH0TJYTImOutfWkel+MIl8pdK3zKdHGHorm363Fp/CraZ2l6gbAthuu1JkNgrudE85iK4nSR5gUygjMR4LHMLCmrpSJII+SbA3B/GuTcfe9Z648e8eXxQAZLHuM4R35oLCJpcyd6RlbGherwcb+vKMvcR9Lq7efP2PClXlSas+wW+DTo/3CA++SzdsGVhFwgeDTlkbBMb25tKllpkYdDs71JmcXSOnNTmdpMuvLft6NECgqf8PoN5ZVMNH4Oadld6CwGfqoYa8lE3jbaBVAktm4nrEKo+j88nCPvoXAX0RgFDVqF8Sz/FAqH5cJ1h+q4R+Acovgvc6kmwgtZXsY3dUvaGBCmX1NmgFb3bFvX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39850400004)(53546011)(316002)(38100700002)(36756003)(7696005)(6666004)(6916009)(38350700002)(6486002)(52116002)(54906003)(26005)(4326008)(66556008)(8936002)(86362001)(5660300002)(2616005)(8676002)(2906002)(66476007)(66946007)(956004)(33656002)(44832011)(186003)(478600001)(16526019)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?TU5YNGJnbjdVWkZTYnQ5Sit5bHFHWVAvbFFDMkpWV0FWTnJWL2lUM1NDZEc4?=
 =?utf-8?B?WUpLN05raEZId0dEdG9pMFBzaUNyVHFvckdvRXovWGM5VVRnZ0htRk5KRm82?=
 =?utf-8?B?SHV4Q0FyQ2xwNGZ4NXIwRXNYMzdMMzNZUFB2bUk3ZVdzSWhMUXdPbnZ5NXZI?=
 =?utf-8?B?OElnWnpVQ2h0aTZ4UVFVZnp0aU04aDNHbUVkZHViK3ViYnFlZm5UK0o2L2No?=
 =?utf-8?B?cUVRV0c2ZkViRUFNcVd3V1ErbUJ3WmZTR0EvSWU3QzR1TVByQ3JMMFBYekdt?=
 =?utf-8?B?OUVhYWZiMFRqNWRnVkE2WHRreEFIbFczeGdHbEtsMkZ3bjd0dmc3eVV4eDRH?=
 =?utf-8?B?Tkl3WXhQcHZqK2p5bWpES2RlbHZDNlR1ei8xUlFqeE5PQlA0cFE3OUNBV0Vx?=
 =?utf-8?B?SW42b1JpVDRMVVcvdCsrMDdjYVFVODVyMEUzellOQ3ZPQi9Ha0FndXlXbGlU?=
 =?utf-8?B?c1JZZWQxb2FKMFVGYjFabndCaTIxYkFVZXc3dEd4TEtUUEJiMTJ6dEVoWElU?=
 =?utf-8?B?M1ZpWDFYTlJMVmFOSzNJRHBlOWkvbVBxclBHTU5QUkN0NUp0am1VWVg3SHZ6?=
 =?utf-8?B?aUlQVk1XUWRwbFBMdVEyVFR6SVFvVUMwb0IvQWxKUHVCU2J1Wi92Q25GcTBp?=
 =?utf-8?B?eWRZWnBFa1A2T1pQSXBCMWcrLzRyTEVtVTNxdlhjd2VYeW9JL0xRMUc1T3Yw?=
 =?utf-8?B?OGxOREhaalYzTTdlMHFwRXpVNERQKzRBdWRNRnN0a2U1My9ocU4xY0wxcUdQ?=
 =?utf-8?B?RnlhRnhiVDRiUmlWNkd2eUtHbk1lZElXWGZzVE0wSG92RDhuMkVQcDRGUHh4?=
 =?utf-8?B?YWJPS3BMTTlNY0UxZXorUmN4ZGxNQ3NDNGwrM25RQ3Z3ZElTL1hhanVkT0Nh?=
 =?utf-8?B?cWJFYXRvNWFVUGNOUkM1N2R6Z21ocDFHVjNVd0tLd3k0OW93QU1xUmJZbnFk?=
 =?utf-8?B?SjMvUms2R2VzNkY5c3dpSUdVNk52bmltZXNFYmVWOGIwdE1CZnhkc0NoK2Jw?=
 =?utf-8?B?NjVVaFJTQlgvWkpVb0ZVYVVyZnh3U3VjazhvMU9lWEd2Smw4Nk5McWVVOUFM?=
 =?utf-8?B?RUEya3dTUlIvWWhWM09UbTJNQmpvdG1YMjRXN2lmRHNCWHV2MFV1RXFWcVFP?=
 =?utf-8?B?MmRQWEJCT0xTdnJkY3NPOGViS293c2RyZE5GcjFJVWtBd1IrZ1pQTjlwbzFm?=
 =?utf-8?B?U1Ixc2NsN0tUeTRDL3pkaUduMXFkTWEzSFQ0Ylh3WXhYakFUdWpNcktUWUMr?=
 =?utf-8?B?dDBhNW56S3lqdHlTVGJlS3VwNHZIakhnMWdPZWlzcGdsRTJGQ1ErdGFUQlUw?=
 =?utf-8?B?dkF0ZDhGZ3dzRjNDS0wyK25OMlJ5em1RWSsrdFNJeGNieDVUY0lPQXFDT1da?=
 =?utf-8?B?aDVQZWxlcHVUQnh5QmRJUXAyeGNMeFUyOVc2YWJLdE5sdlU4VWt6ZjRqaXlo?=
 =?utf-8?B?YzlRMXZTajZZM0VTb0pSQlByVUV1c3AveXNaSmNJUnR6MUlZTG9GMlVrc1I3?=
 =?utf-8?B?YjBKL1hnTVovclBEdXhNbW15QzlBbXV3MkI2L2kyRktFejRIWFpySUdLekVM?=
 =?utf-8?B?TlM1anFFNzg5Ykw0Wm5iQXBLcVBUMCtpZk9mRU5URjBhaHYrZ0k1Y3RGUEhG?=
 =?utf-8?B?V2RyanhQc3pHK0tmcHdra0VSYVUxb2NNbkhHZ29TVW1aaW5SOERiRmxSWGxw?=
 =?utf-8?B?UlBxM0pnV0NTdVpkblppVHg2U3MrZU1yY0F4NG5GdVRXV3V6eTdqRXlJblNz?=
 =?utf-8?Q?VSakzISwwIFD9lEZsTdwWPaZ7hpyqfVpR+gQFy3?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3197
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc38df79-0ee6-40df-94c0-08d90b10e55c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	90yEb6psU15t3KBuFqV7vdlIZoHDoS2CP0qj8N+x7/YhLpWWKAQHfY4cFAvjcBxgFfLz8NAdkZmg1vrmypsGo5ZpvyCEXU7nGgLLWRKlKhiPW/Lr+/xcqxQDfu2XMtoI9j0WCG3fI/ZZglQwUJ3NWC2tKJlUwZ8JsQe8RE8YRJ0MeUMTUs5Z441AmkowiY20i42ABTzz/oCO3Hyt2pxB1u1ynnuGtc2bTK31/ltMHyDS1QiJwZiX8rzMNcYRcbgAINU1y2uoK9omrDYqhcjAAsfUN8pCJaM2UlFxrkeaaF6qzBudk7pbAxvIQNamWJgAbKPDCr8hrp9LtJ/JpNDZHIpgmALLWYGyrWr6r1mjzjSkSQgqGAKsmeM5SBq+KZ6W7JGQs1TyuleCR1Z3Hi966W3s1SNxo1BLZjbA6HKu7CO2mFMCfjRJnC2qoFI5NcSOoMWvUBUqSqZpuEGHcpwR9s2st5LPN2ycky6YaXUihpZ9tXgmMBi1phxLX4ncJH8jPoN98wF2owK+5bH7La28woKKE+G4twFDU250IjmNu5NTiSXjJZEu/MOAWQwfzY6ESYw14atRwzvlvXUV/sg/xK8Y5oRqXg5uyfWSnDECGjmvbScV8cV+amqEdcKIgK4dCZ8lHsZqDPPFYjWpOAst/eZRg3PxUx/u7as/vqiFu8XBdz1YKNY6s4oS9S0Aye6I
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(46966006)(36840700001)(336012)(4326008)(316002)(82310400003)(7696005)(53546011)(5660300002)(356005)(33656002)(6666004)(36756003)(6862004)(16526019)(54906003)(8676002)(47076005)(86362001)(6486002)(70206006)(81166007)(478600001)(2616005)(956004)(34020700004)(82740400003)(44832011)(8936002)(26005)(70586007)(36860700001)(2906002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 13:15:58.1715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e163c04c-ef01-417d-1b12-08d90b10ed8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2772



> On 29 Apr 2021, at 14:11, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 29.04.2021 11:50, Luca Fancellu wrote:
>>> On 29 Apr 2021, at 10:04, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 28.04.2021 16:59, Luca Fancellu wrote:
>>>>> On 27 Apr 2021, at 14:57, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 26.04.2021 17:37, Luca Fancellu wrote:
>>>>>> @@ -120,24 +132,26 @@ typedef uint32_t grant_ref_t;
>>>>>> * [GST]: This field is written by the guest and read by Xen.
>>>>>> */
>>>>>>=20
>>>>>> -/*
>>>>>> - * Version 1 of the grant table entry structure is maintained purel=
y
>>>>>> - * for backwards compatibility.  New guests should use version 2.
>>>>>> - */
>>>>>> #if __XEN_INTERFACE_VERSION__ < 0x0003020a
>>>>>> #define grant_entry_v1 grant_entry
>>>>>> #define grant_entry_v1_t grant_entry_t
>>>>>> #endif
>>>>>> +/**
>>>>>> + * Version 1 of the grant table entry structure is maintained purel=
y
>>>>>> + * for backwards compatibility.  New guests should use version 2.
>>>>>> + */
>>>>>=20
>>>>> In case I didn't say so already before - I think this would be a good
>>>>> opportunity to drop the comment pointing at v2. With v2 optionally
>>>>> unavailable altogether, this can't possibly be a generally valid
>>>>> course of action.
>>>>=20
>>>> Could you explain me better that? Do you want to get rid of this comme=
nt?
>>>=20
>>> Especially the second sentence is misleading. If new code used v2, it
>>> would not work on Xen with v2 support turned off.
>>=20
>> Can you suggest what to write here? I=E2=80=99m not very familiar with t=
his xen
>> Interface
>=20
> I've sent a patch myself just a few seconds ago.

Hi Jan,

That=E2=80=99s great, I=E2=80=99m going to push the v4 for this serie soon,=
 now that the comment is fixed,
I can include it in the docs too, do you agree?

Cheers,
Luca

>=20
> Jan


