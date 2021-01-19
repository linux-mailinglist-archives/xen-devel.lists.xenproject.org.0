Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0B2FB9D5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 15:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70442.126409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sOS-0001Pz-OH; Tue, 19 Jan 2021 14:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70442.126409; Tue, 19 Jan 2021 14:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sOS-0001Pa-Jw; Tue, 19 Jan 2021 14:54:04 +0000
Received: by outflank-mailman (input) for mailman id 70442;
 Tue, 19 Jan 2021 14:54:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FUmZ=GW=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l1sOR-0001OR-3J
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:54:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f74c46de-3e2e-46bf-b728-ac8b33f771d3;
 Tue, 19 Jan 2021 14:53:59 +0000 (UTC)
Received: from DB3PR08CA0021.eurprd08.prod.outlook.com (2603:10a6:8::34) by
 AM5PR0801MB1985.eurprd08.prod.outlook.com (2603:10a6:203:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 14:53:47 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::1) by DB3PR08CA0021.outlook.office365.com
 (2603:10a6:8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 19 Jan 2021 14:53:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Tue, 19 Jan 2021 14:53:47 +0000
Received: ("Tessian outbound 8418c949a3fa:v71");
 Tue, 19 Jan 2021 14:53:47 +0000
Received: from a923e0e60982.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BC806CF-F713-479B-8275-3D360FA9E4BE.1; 
 Tue, 19 Jan 2021 14:53:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a923e0e60982.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Jan 2021 14:53:32 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3755.eurprd08.prod.outlook.com (2603:10a6:10:77::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 14:53:29 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 14:53:28 +0000
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
X-Inumbo-ID: f74c46de-3e2e-46bf-b728-ac8b33f771d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyNHVUo81XnhzRvrSLB+Zb3AsbwqAGciR1IY1Xnxy28=;
 b=I87QyjEEvGi4A+1GhF3fxsYlpA/FH9yoCQ7V+9KOWIq8pLsmYHVFrOd7Y7inORUcH9OjYMG3LzS7v3GbrVSzlhYJwiHwkSCjRQwPgK09jw9SRKdjr6GRDOcO3JA7b0RGxq48sfDAMrNzn2G/LbFtkh+dGXQGtRJDxv1DwP8l+Io=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4c96af4d09c66452
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/IaDSCAgQQQdPt42M+Alsj3nL/RjIZ59yNEePINzPChJ9I+UMYqRkad3gdItcJbaIIiH6MJqWowV5gKFQwFXtLQIcvCdcpzYrONRUo3JlE/nJsQxd8MtnleEbdFG5BCVxI9QHUBiI2P4/qrSHKSAOIeF3uLLez3s2s6EJ8B6/Grns1HAloV/apLUXBliSb+MCaPY/Qq5YTHA8+em25Hn8U/ZJ7VBLdkO5MBv3t4N4bKhjGTeEGZUEi9vz8Fjfm9VRrs/pFU2iPKBl1RRoXK0sdqSeFddpFTSz53CZWipoz69f8ghokZcwIFim/Gpjk+mC8C0ZlXyTwnKTfUvAVQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyNHVUo81XnhzRvrSLB+Zb3AsbwqAGciR1IY1Xnxy28=;
 b=EKpm9ZA9Al4wzJmMn0mFJX8QFghMWysT/QsHcJCJM55R9+rJ1Y5J7ZIU67MJj5N1p1iB2x3WYcVQl9JF8O/FUgx7t740WcDGZ6FnC7CY8ZDnm7bcWtFAwsxkKQeY4Y8dx8JM7L6c/FWOXpHCx+axS4nNMI/aQ/grwsH/w7GkegHTBMtV6RAE/pU6wndMo8qz04dqicXc7HvBanNE9ekML8T/7ZlKhXlDmxRb7mPppydbzaXZFxIhKYEeZ5Af8nncSIPd3BrtA+0wI/At1Yl5kXDLZjSMdQNKipcHlhalmxtiBEE0Hx1ZNzKQGiVDaspiVLuB7gbcQnZlu1eT9Z2v6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyNHVUo81XnhzRvrSLB+Zb3AsbwqAGciR1IY1Xnxy28=;
 b=I87QyjEEvGi4A+1GhF3fxsYlpA/FH9yoCQ7V+9KOWIq8pLsmYHVFrOd7Y7inORUcH9OjYMG3LzS7v3GbrVSzlhYJwiHwkSCjRQwPgK09jw9SRKdjr6GRDOcO3JA7b0RGxq48sfDAMrNzn2G/LbFtkh+dGXQGtRJDxv1DwP8l+Io=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Topic: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Index:
 AQHW5c4BALh9w79bakGJi7B8FnwYpqoinLCAgAAIcQCACu3xgIAADRWAgAAKUwCAAWy/AIAAAtqA
Date: Tue, 19 Jan 2021 14:53:28 +0000
Message-ID: <02D62982-BA3E-4CEC-8378-1D459D9EADE7@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
 <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
 <81983272-f423-f24d-3094-1f4ba7568e1b@gmail.com>
 <5405ECAE-F22F-4893-B302-5D48C57A8847@arm.com>
 <03135a22-676b-6642-0fb3-4e3bb62cf014@gmail.com>
 <5D0E2A07-4299-41D5-BB72-4D2A59E897AD@arm.com>
 <56877cfc-b2fe-3445-404e-60ff84cee195@gmail.com>
In-Reply-To: <56877cfc-b2fe-3445-404e-60ff84cee195@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c13587e5-f3de-4d02-58b4-08d8bc8a068f
x-ms-traffictypediagnostic: DB7PR08MB3755:|AM5PR0801MB1985:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB198598EB4950210C3EDE5696FCA30@AM5PR0801MB1985.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 e6JFQ+Mk/dRRfy7qLaKWuuuhvQqCM2EdoDz6I0trs/Fu6Gakq/YXZ/etatcd6KlbH3rw8AZIFgPMEmvmNGMn8vqKghmkqgZKzfkKWcUv4IFCHeAsV8jmd7ooOCf8YUs8MjAf2IPHJg4uXdJZnqxuktn59qbE14Wyn7VadwpEoYhgc0rshBHpblcM1jSozupYmHYCx+WbKNaWq5SnjMge6RL061hIvIJSdKsZd+v3ONzy1EhY6HRqmMjthgp7WX9M2bWULyEiY0SlNsc0oGLP/4PPUGXy1s7AIZyFMn0SotkiwwD4NYcArfBI4hg2/QjJaIvOtBPvhWSlc6qEaQ42+dzFCd78zTU1UkHlnMMXRsFOQlGcrXXwrxsY72A+THy/vur2ndPnksjkN1TN93aIcO6sj34V8FwAJtwbZINQEEczrDgLNWro/PFG/xL2h5kvL9PjxkKpEf7vVh/9zW+6kWwmgd/jt3c1csH4S8t/nGw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(39850400004)(136003)(33656002)(5660300002)(8676002)(86362001)(66446008)(54906003)(91956017)(8936002)(66556008)(26005)(76116006)(66476007)(66946007)(53546011)(316002)(2616005)(2906002)(6512007)(71200400001)(6916009)(4326008)(186003)(64756008)(36756003)(7416002)(478600001)(6506007)(6486002)(83380400001)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?dmhqT01YUllwaURkTXBTSGRIalByYllHQU9OMDAyZTZDZjU2YlRTRDhzUkZ1?=
 =?utf-8?B?akg4NURxeEJ3bEN4bUhZbW01N090a2p6SXdrdHNzRStrMEV1SDJyMEdkbkNO?=
 =?utf-8?B?Qkh2RHlBQ1NKMXNjUWxJMUp6THVsd0liaC9nQ2UvZjJiL3pBdzJDRVFjNVZv?=
 =?utf-8?B?MFRKWnM1Q3ZQa2V3elhhREZVbHQvV3hmc0tZQ3JIVHB5dmdYREkvQ3BrdEk4?=
 =?utf-8?B?dit1b0hIRWM2dTlLTXdEZnNPdlJlOVhCbVhRMnhpUTlBRjJYd21zaXQwZWdj?=
 =?utf-8?B?TjlCVUF5QnpmQmlNRVBRRkdlRHJwdisybGJBcG82T05hcWVzdW9SZkZPOVpR?=
 =?utf-8?B?QXI4NWlNYkVCaUQ2NE5IWCtYRmlhSVRpTEEyVFhYYUwyb2hCWEpnTDJtR28z?=
 =?utf-8?B?RlFYbUdoTFV2RXc2QmFNQXQ4K3VhNWtUMmxnanlJdnZOOU1RRWw1a2VVa2E0?=
 =?utf-8?B?MnVtTGk4TW03dzZWVDVsZFhjS2phWXlCOXNCSnh1UkZ5WEEyeThpalBueHFt?=
 =?utf-8?B?WTBKbjlvdnZqb2IrR0xOSHhWbTEyaHNoamtTMEFSQVlDZHJkdVU2RG5jeHJ4?=
 =?utf-8?B?Yis4SFVzWHF4dmhvYWY0ZzJEVVRCSm1Kdzdra0w4ZEtoM2VCQkw1VlVnM3hh?=
 =?utf-8?B?aEQxanBFMTB3Q3M0VFU0UHJ3ai9FTGpnWDkxQkdNN2dlRE1zL05iQ25YWWVV?=
 =?utf-8?B?MllxMzlmQ2ptaSsxeGpTVk42UXlTM3d0MER5ZjI2ZXBPNWlXbnY5S1diQU9V?=
 =?utf-8?B?SFdwK2VvY0JtRmZaRHhxTEVzbGtkZnMzc1dVT0pMYVZBVEFPckZOeTdtTkJE?=
 =?utf-8?B?TmREcHJhL3VHYXNpQ1ZtYlZSNkJadEVaTEpPRDNwNFAzSGxCVjZYamhSd0tG?=
 =?utf-8?B?ZldDSERuM1d5ZlZSMU13OEIyZU40U2xxZ2hVWGtGeEhUWlVTYzJOc2ZpRUVr?=
 =?utf-8?B?d0Zwc2dESHJUR2RuZGpwb1hqY2k4N3RrdzFPMnlPMytSaXhHc3JDWU5BQVk5?=
 =?utf-8?B?bmRLNGdhc1RBT2VxMDlYNjlpMWtLWU9FU3hCYTFjRFNOUGNvREFFWjFRQmtq?=
 =?utf-8?B?bFNjRS9YWXhlQUMyZUNPaXhrdVJ4TFhjTy81TEtTUkorc05XamRTU2JSaEJC?=
 =?utf-8?B?SXhWbkZTMDdBcGMxSE5IMld0YVI2Y1VBbVFBbCsyL0xZVnIwRUwrR3VJWGJD?=
 =?utf-8?B?MHFZU0lVQTltdTBDODVmU1VHNFRQT2Njc2lnSURMWjc4UlNYZ2k4ME5hWDRz?=
 =?utf-8?B?QW9uLzJkS094Wko1S05KRnY0N1Bna0RWd3dzOExxNTBleTRsOEZXanMxWGli?=
 =?utf-8?B?OTRFQ3Z0L1c2Z1Z4S3N1bFpqbjdmRm9ONVQ5NVBhZGdPak5uanVUc1o4cDN2?=
 =?utf-8?B?eHBVdlNVWlJzcERZZFRKVUNPa05ZQUpxUGZ3VWtuQlRTcE1aNHJpNVlFZzBU?=
 =?utf-8?Q?V+WB+Lwh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD49E8BE58F9F6429A7844F9E0507532@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3755
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc93b568-5d93-4ca4-f1a3-08d8bc89fb90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sS9SwYzzzIo7c6vcDBjcQFUroQnl2Ng5wK7avh36bAYxwL/W1e2nl1ITR8esRUXk63OIAn21bHNOfFEihmDm077ShByLwybNfwxlXhTQ0KVoNsdFc+g/pg4uMaOsjEfpDZkxNBx1nlvducwnG4tIQmFFBOLsg1gbgsfeTvmwFAx73nOaSwVWL2qgu/EbFFop92MlkjBKKJSFkByoMYkYHjR8t/6yZkn5ksfC6WFsRobtSQTHGLgy1qqb8TZSI5nZ0KjfT05sh7fuEHHRC3D//Wi4tBmYnhhrTZPFACinJmIc2D0zzp3H8F9gNvFqKXjU8uTzJ9Tx2Ptw/SYiNHyacBpil2U/dEbC2QbfhrTlbprQiq+jmVYk/P4oyzTU924myp3ZslcKTk/Iikpn7Wat+FZBzTWDlVZnzE84q9fYvjM3lIHEeVy2ZlNbEQiDBhf1XXTSdsw7AXHmqKs8Oav7IXb1PxQh65zBbieSPD/2bzQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(46966006)(33656002)(82310400003)(6512007)(5660300002)(47076005)(8676002)(186003)(70586007)(478600001)(26005)(316002)(336012)(36756003)(70206006)(54906003)(2906002)(81166007)(4326008)(6486002)(53546011)(6862004)(8936002)(6506007)(2616005)(82740400003)(86362001)(107886003)(83380400001)(356005)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 14:53:47.4371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c13587e5-f3de-4d02-58b4-08d8bc8a068f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1985

SGVsbG8gT2xla3NhbmRyLA0KDQo+IE9uIDE5IEphbiAyMDIxLCBhdCAyOjQzIHBtLCBPbGVrc2Fu
ZHIgPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDE4LjAxLjIxIDE4
OjU3LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEhlbGxvIE9sZWtzYW5kciwNCj4gDQo+IEhpIFJh
aHVsDQo+IA0KPiANCj4+IA0KPj4+IE9uIDE4IEphbiAyMDIxLCBhdCA0OjIwIHBtLCBPbGVrc2Fu
ZHIgPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IE9uIDE4LjAx
LjIxIDE3OjMzLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4gSGVsbG8gT2xla3NhbmRyLA0KPj4+
PiANCj4+Pj4+IE9uIDExIEphbiAyMDIxLCBhdCA0OjM5IHBtLCBPbGVrc2FuZHIgPG9sZWtzdHlz
aEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IEhpIFJhaHVsDQo+Pj4g
SGkgUmFodWwNCj4+PiANCj4+PiANCj4+Pj4+IA0KPj4+Pj4+PiAtDQo+Pj4+Pj4+ICAgc3RhdGlj
IGludCBhcm1fc21tdV9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4+Pj4+Pj4gICB7DQo+Pj4+Pj4+ICAgICAgIGludCBpcnEsIHJldDsNCj4+Pj4+Pj4gLSAgICBz
dHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4+Pj4+Pj4gLSAgICByZXNvdXJjZV9zaXplX3QgaW9hZGRy
Ow0KPj4+Pj4+PiArICAgIHBhZGRyX3QgaW9hZGRyLCBpb3NpemU7DQo+Pj4+Pj4+ICAgICAgIHN0
cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXU7DQo+Pj4+Pj4+IC0gICAgc3RydWN0IGRldmljZSAq
ZGV2ID0gJnBkZXYtPmRldjsNCj4+Pj4+Pj4gLSAgICBib29sIGJ5cGFzczsNCj4+Pj4+Pj4gICAt
ICAgIHNtbXUgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnNtbXUpLCBHRlBfS0VSTkVMKTsN
Cj4+Pj4+Pj4gKyAgICBzbW11ID0geHphbGxvYyhzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlKTsNCj4+
Pj4+Pj4gICAgICAgaWYgKCFzbW11KSB7DQo+Pj4+Pj4+IC0gICAgICAgIGRldl9lcnIoZGV2LCAi
ZmFpbGVkIHRvIGFsbG9jYXRlIGFybV9zbW11X2RldmljZVxuIik7DQo+Pj4+Pj4+ICsgICAgICAg
IGRldl9lcnIocGRldiwgImZhaWxlZCB0byBhbGxvY2F0ZSBhcm1fc21tdV9kZXZpY2VcbiIpOw0K
Pj4+Pj4+PiAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+Pj4+Pj4+ICAgICAgIH0NCj4+Pj4+
Pj4gLSAgICBzbW11LT5kZXYgPSBkZXY7DQo+Pj4+Pj4+ICsgICAgc21tdS0+ZGV2ID0gcGRldjsN
Cj4+Pj4+Pj4gICAtICAgIGlmIChkZXYtPm9mX25vZGUpIHsNCj4+Pj4+Pj4gKyAgICBpZiAocGRl
di0+b2Zfbm9kZSkgew0KPj4+Pj4+PiAgICAgICAgICAgcmV0ID0gYXJtX3NtbXVfZGV2aWNlX2R0
X3Byb2JlKHBkZXYsIHNtbXUpOw0KPj4+Pj4+PiArICAgICAgICBpZiAocmV0KQ0KPj4+Pj4+PiAr
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+Pj4+ICAgICAgIH0gZWxzZSB7DQo+Pj4+
Pj4+ICAgICAgICAgICByZXQgPSBhcm1fc21tdV9kZXZpY2VfYWNwaV9wcm9iZShwZGV2LCBzbW11
KTsNCj4+Pj4+Pj4gICAgICAgICAgIGlmIChyZXQgPT0gLUVOT0RFVikNCj4+Pj4+Pj4gICAgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4+PiAgICAgICB9DQo+Pj4+Pj4+ICAgLSAgICAvKiBT
ZXQgYnlwYXNzIG1vZGUgYWNjb3JkaW5nIHRvIGZpcm13YXJlIHByb2JpbmcgcmVzdWx0ICovDQo+
Pj4+Pj4+IC0gICAgYnlwYXNzID0gISFyZXQ7DQo+Pj4+Pj4+IC0NCj4+Pj4+Pj4gICAgICAgLyog
QmFzZSBhZGRyZXNzICovDQo+Pj4+Pj4+IC0gICAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNl
KHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4+Pj4+Pj4gLSAgICBpZiAocmVzb3VyY2Vfc2l6
ZShyZXMpIDwgYXJtX3NtbXVfcmVzb3VyY2Vfc2l6ZShzbW11KSkgew0KPj4+Pj4+PiAtICAgICAg
ICBkZXZfZXJyKGRldiwgIk1NSU8gcmVnaW9uIHRvbyBzbWFsbCAoJXByKVxuIiwgcmVzKTsNCj4+
Pj4+Pj4gKyAgICByZXQgPSBkdF9kZXZpY2VfZ2V0X2FkZHJlc3MoZGV2X3RvX2R0KHBkZXYpLCAw
LCAmaW9hZGRyLCAmaW9zaXplKTsNCj4+Pj4+Pj4gKyAgICBpZiAocmV0KQ0KPj4+Pj4+PiArICAg
ICAgICByZXR1cm4gLUVOT0RFVjsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArICAgIGlmIChpb3NpemUg
PCBhcm1fc21tdV9yZXNvdXJjZV9zaXplKHNtbXUpKSB7DQo+Pj4+Pj4+ICsgICAgICAgIGRldl9l
cnIocGRldiwgIk1NSU8gcmVnaW9uIHRvbyBzbWFsbCAoJWx4KVxuIiwgaW9zaXplKTsNCj4+Pj4+
Pj4gICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+Pj4+PiAgICAgICB9DQo+Pj4+Pj4+IC0g
ICAgaW9hZGRyID0gcmVzLT5zdGFydDsNCj4+Pj4+Pj4gICAgICAgICAvKg0KPj4+Pj4+PiAgICAg
ICAgKiBEb24ndCBtYXAgdGhlIElNUExFTUVOVEFUSU9OIERFRklORUQgcmVnaW9ucywgc2luY2Ug
dGhleSBtYXkgY29udGFpbg0KPj4+Pj4+PiAtICAgICAqIHRoZSBQTUNHIHJlZ2lzdGVycyB3aGlj
aCBhcmUgcmVzZXJ2ZWQgYnkgdGhlIFBNVSBkcml2ZXIuDQo+Pj4+Pj4+ICsgICAgICogdGhlIFBN
Q0cgcmVnaXN0ZXJzIHdoaWNoIGFyZSBvcHRpb25hbCBhbmQgY3VycmVudGx5IG5vdCBzdXBwb3J0
ZWQuDQo+Pj4+Pj4+ICAgICAgICAqLw0KPj4+Pj4+PiAtICAgIHNtbXUtPmJhc2UgPSBhcm1fc21t
dV9pb3JlbWFwKGRldiwgaW9hZGRyLCBBUk1fU01NVV9SRUdfU1opOw0KPj4+Pj4+PiArICAgIHNt
bXUtPmJhc2UgPSBpb3JlbWFwX25vY2FjaGUoaW9hZGRyLCBBUk1fU01NVV9SRUdfU1opOw0KPj4+
Pj4+PiAgICAgICBpZiAoSVNfRVJSKHNtbXUtPmJhc2UpKQ0KPj4+Pj4+PiAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIoc21tdS0+YmFzZSk7DQo+Pj4+Pj4+ICAgLSAgICBpZiAoYXJtX3NtbXVfcmVz
b3VyY2Vfc2l6ZShzbW11KSA+IFNaXzY0Sykgew0KPj4+Pj4+PiAtICAgICAgICBzbW11LT5wYWdl
MSA9IGFybV9zbW11X2lvcmVtYXAoZGV2LCBpb2FkZHIgKyBTWl82NEssDQo+Pj4+Pj4+ICsgICAg
aWYgKGlvc2l6ZSA+IFNaXzY0Sykgew0KPj4+Pj4+PiArICAgICAgICBzbW11LT5wYWdlMSA9IGlv
cmVtYXBfbm9jYWNoZShpb2FkZHIgKyBTWl82NEssDQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQVJNX1NNTVVfUkVHX1NaKTsNCj4+Pj4+Pj4gICAgICAgICAgIGlmIChJU19F
UlIoc21tdS0+cGFnZTEpKQ0KPj4+Pj4+PiAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHNt
bXUtPnBhZ2UxKTsNCj4+Pj4+Pj4gQEAgLTI3NjUsMTQgKzMxMDEsMjYyIEBAIHN0YXRpYyBpbnQg
YXJtX3NtbXVfZGV2aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+Pj4+
Pj4+ICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4+PiAgICAgICAgIC8qIFJlc2V0IHRoZSBk
ZXZpY2UgKi8NCj4+Pj4+Pj4gLSAgICByZXQgPSBhcm1fc21tdV9kZXZpY2VfcmVzZXQoc21tdSwg
YnlwYXNzKTsNCj4+Pj4+Pj4gKyAgICByZXQgPSBhcm1fc21tdV9kZXZpY2VfcmVzZXQoc21tdSk7
DQo+Pj4+Pj4+ICAgICAgIGlmIChyZXQpDQo+Pj4+Pj4+ICAgICAgICAgICByZXR1cm4gcmV0Ow0K
Pj4+Pj4+PiAgICsgICAgLyoNCj4+Pj4+Pj4gKyAgICAgKiBLZWVwIGEgbGlzdCBvZiBhbGwgcHJv
YmVkIGRldmljZXMuIFRoaXMgd2lsbCBiZSB1c2VkIHRvIHF1ZXJ5DQo+Pj4+Pj4+ICsgICAgICog
dGhlIHNtbXUgZGV2aWNlcyBiYXNlZCBvbiB0aGUgZndub2RlLg0KPj4+Pj4+PiArICAgICAqLw0K
Pj4+Pj4+PiArICAgIElOSVRfTElTVF9IRUFEKCZzbW11LT5kZXZpY2VzKTsNCj4+Pj4+Pj4gKw0K
Pj4+Pj4+PiArICAgIHNwaW5fbG9jaygmYXJtX3NtbXVfZGV2aWNlc19sb2NrKTsNCj4+Pj4+Pj4g
KyAgICBsaXN0X2FkZCgmc21tdS0+ZGV2aWNlcywgJmFybV9zbW11X2RldmljZXMpOw0KPj4+Pj4+
PiArICAgIHNwaW5fdW5sb2NrKCZhcm1fc21tdV9kZXZpY2VzX2xvY2spOw0KPj4+Pj4gTG9va3Mg
bGlrZSB0aGF0IHdlIG5lZWQgc29tZSBraW5kIG9mIG1hbnVhbCByb2xsLWJhY2sgbG9naWMgaGVy
ZSBpbiBjYXNlIG9mIGVycm9yIGR1cmluZyBwcm9iZSAodGhlcmUgaXMgbm8gcmVhbCBkZXZtXyop
Og0KPj4+Pj4gDQo+Pj4+PiBpb3VubWFwLCB4ZnJlZSwgZXRjLg0KPj4+PiBJIGFncmVlIHdpdGgg
eW91IHRoYXQgbWFudWFsIHJvbGwtYmFjayBsb2dpYyBpcyBnb29kIHRvIGhhdmUgY2xlYW4gY29k
ZSBidXQgaW4gdGhpcyBzY2VuYXJpbyB3aGF0IEkgaGF2ZSBmb3VuZCBvdXQgdGhhdCBpZiB0aGVy
ZSBpcyBhbiBlcnJvciBkdXJpbmcgcHJvYmUgYXJtX3NtbXVfZGV2aWNlX3Byb2JlKCkgd2lsbCBy
ZXR1cm4gYW5kIFhFTiB3aWxsIG5vdCBjb250aW51ZSB0byBib290IChjYWxsIHBhbmljIGZ1bmN0
aW9uKSAsIGluIHRoYXQgY2FzZSBpZiB3ZSBmcmVlIHRoZSBtZW1vcnkgYWxzbyB0aGVyZSBpcyBu
byBtdWNoIGRpZmZlcmVuY2UuIFRoYXQgd2h5IEkgZGVjaWRlZCBub3QgdG8gbW9kaWZ5IHRoZSBj
b2RlIHRoYXQgd2UgcG9ydGVkIGZyb20gTGludXguDQo+Pj4+IA0KPj4+PiBYRU4pIEkvTyB2aXJ0
dWFsaXNhdGlvbiBkaXNhYmxlZA0KPj4+PiAoWEVOKQ0KPj4+PiAoWEVOKSAqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+Pj4+IChYRU4pIFBhbmljIG9uIENQVSAwOg0K
Pj4+PiAoWEVOKSBDb3VsZG4ndCBjb25maWd1cmUgY29ycmVjdGx5IGFsbCB0aGUgSU9NTVVzLg0K
Pj4+PiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+Pj4+
IChYRU4pDQo+Pj4+IChYRU4pIE1hbnVhbCByZXNldCByZXF1aXJlZCAoJ25vcmVib290JyBzcGVj
aWZpZWQpDQo+Pj4+IA0KPj4+PiBEbyB3ZSBoYXZlIGEgcmVxdWlyZW1lbnQgdG8gY29udGludWUg
dG8gYm9vdCB0aGUgWEVOIGlmIHRoZXJlIGlzIGFuIElPTU1VIGF2YWlsYWJsZSBpbiB0aGUgc3lz
dGVtIGFuZCBJT01NVSBwcm9iZSBpcyBmYWlsZWQ/IElmIHllcyB0aGVuIEkgd2lsbCBtb2RpZnkg
dGhlIGNvZGUgdG8gZnJlZSBhbGwgdGhlIHJlc291cmNlcyBpZiB0aGVyZSBpcyBlcnJvciBkdXJp
bmcgcHJvYmUuDQo+Pj4gWGVuIHdvbid0IGNhbGwgcGFuaWMgaWYgSU9NTVUgZHJpdmVyIHJldHVy
bnMgLUVOT0RFViBhbmQgd2lsbCBjb250aW51ZSB0byBib290LiBGb3IgZXhhbXBsZSwgaWYgdGhl
IElPTU1VIGlzIHByZXNlbnQgYnV0IGNhbm5vdCBiZSB1c2VkIGluIFhlbiBmb3Igc29tZSByZWFz
b24gKGRvZXNuJ3Qgc3VwcG9ydCBwYWdlIHRhYmxlIHNoYXJpbmcsIGV0YykNCj4+IFllcyB5b3Ug
YXJlIHJpZ2h0IGluIGNhc2Ugb2YgSU9NTVUgZHJpdmVyIHByb2JlIGZhaWxlZCBhbmQgcmV0dXJu
IC1FTk9ERVYgWEVOIHdpbGwgY29udGludWUgdG8gYm9vdC4NCj4+IA0KPj4gSSBhbSB0aGlua2lu
ZyBvZiBpZiB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCBjb25maWd1cmluZyB0aGUgSU9NTVUgSFcg
YW5kIHJldHVybiAtRU5PREVWIG9yICBmb3Igc29tZSByZWFzb24gaWYgSU9NTVUgaXMgcHJlc2Vu
dCBjYW5ub3Qgbm90IGJlIHVzZWQgaW4gWEVOIHdoeSB3ZSBhcmUgc2lsZW50bHkgYWxsb3dzIFhF
TiB0byBib290IGFuZCBtYWtlIHRoZSBzeXN0ZW0gaW5zZWN1cmUuDQo+PiBBcyBlbmQgdXNlciBt
aWdodCBtaXNzIHRoZSBlcnJvciBsb2dzIGR1cmluZyBib290IGFuZCB3aWxsIHRoaW5rIElPTU1V
IGlzIGVuYWJsZWQgYW5kIHN5c3RlbSBpcyBzZWN1cmUgYnV0IElPTU1VIGlzIGVpdGhlciBkaXNh
YmxlIG9yIGlzIHdvcmtpbmcgaW4gYnlwYXNzIG1vZGUuDQo+IA0KPiBCdXQsIHdvdWxkbid0IGVu
ZCB1c2VyIG5vdGljZSB0aGF0IGRldmljZSBwYXNzdGhyb3VnaCBpcyBub3QgZnVuY3Rpb25hbCB0
aGVuPw0KDQpJIGFtIG5vIHN1cmUgYnV0IG1pZ2h0IGJlIHllcyBhcyBJIHRoaW5rIGlmIGlvbW11
IGlzIGRpc2FibGVkIHdlIGNhbm5vdCBwYXNzdGhyb3VnaCB0aGUgZGV2aWNlLg0KPiANCj4gDQo+
PiAgDQo+PiBJIG1pZ2h0IGJlIHdyb25nLCBpbiB0aGF0IGNhc2UgYXMgcGVyIG15IHVuZGVyc3Rh
bmRpbmcgd2Ugc2hvdWxkIHJldHVybiBlcnJvciBhbmQgY2FsbCBwYW5pYyBhbmQgbGV0IHVzZXIg
ZGVjaWRlIGVpdGhlciB0byBmaXggdGhlIGlzc3VlIG9uIG5leHQgYm9vdCBvciBib290IFhFTiB3
aXRoIGNtZGxpbmUgb3B0aW9uICJpb21tdT1ub+KAnQ0KPiBJIGdvdCB5b3VyIHBvaW50LCBidXQg
SSBhbSBub3Qgc3VyZSBJIGNhbiBhbnN3ZXIgcHJlY2lzZWx5IGhvdyBYZW4gc2hvdWxkIGJlaGF2
ZSBpbiB0aGUgc2l0dWF0aW9uIGFib3ZlLCBJIHdpbGwgbGV0IHRoZSBtYWludGFpbmVycyBjb21t
ZW50IG9uIHRoYXQuIEp1c3QgYSBub3RlLCB0aGUgLUVOT0RFViBpcyBhbHNvIHJldHVybmVkIGJ5
IHRoZSBmcmFtZXdvcmsgaWYgdGhlIElPTU1VIGlzIG5vdCBwcmVzZW50IChwbGVhc2Ugc2VlIGlv
bW11X2hhcmR3YXJlX3NldHVwKCkgaW4gZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYyBm
b3IgdGhlIGRldGFpbHMpLCBlaXRoZXIgWGVuIGRvZXNuJ3QgaGF2ZSBhIHN1aXRhYmxlIGRyaXZl
ciBmb3IgaXQgb3IgdGhlIElPTU1VIEgvVyBpcyBub3QgYXZhaWxhYmxlIGluIHRoZSB0YXJnZXQg
U29DLCBldGMuIEkgYW0gbm90IHF1aXRlIHN1cmUgd2Ugc2hvdWxkIGNhbGwgcGFuaWMgaW4gc3Vj
aCBjYXNlcy4NCj4gDQo+IA0KPiBSZWdhcmRpbmcgdGhlIGNsZWFudXAgbXkgcG9pbnQgaXMgdGhh
dCBkcml2ZXIgc2hvdWxkIGJlIHJlc3BvbnNpYmxlIG9mIGRvaW5nIGl0IGlmIHRoZXJlIGlzIGFu
IGVycm9yIGR1cmluZyBpbml0aWFsaXphdGlvbiAoYW5kIGl0IGNhbm5vdCBjb250aW51ZSkgcmVn
YXJkbGVzcyBvbiBob3cgdGhlIGNvbW1vbiBjb2RlIHdvdWxkIGhhbmRsZSB0aGF0IChyZXR1cm5l
ZCBieSBkcml2ZXIpIGVycm9yLiBOb3cgaXQgcGFuaWNzIG9uIHNvbWUgY29uZGl0aW9ucywgdG9t
b3Jyb3cgaXQgd2lsbCBhY3QgZGlmZmVyZW50bHksIGV0Yy4gSWYgZHJpdmVyIGNhbGxlZCBwYW5p
YyBieSBpdHNlbGYsIGl0IGNvdWxkIF9wcm9iYWJseV8gYmUgaW4gYSBwb3NpdGlvbiB0byBsZWF2
ZSByZXNvdXJjZXMgdW5yZWxlYXNlZCB0aGVuLi4uIFRoaXMgaXMgbXkgdmlld3BvaW50IHdoaWNo
IG1pZ2h0IGJlIHdyb25nLg0KDQpZZXMgSSBhZ3JlZSB3aXRoIHlvdSBhbmQgIEkgd2lsbCBhZGQg
dGhlIGNvZGUgdG8gZnJlZSByZXNvdXJjZXMgaWYgcHJvYmUgZmFpbGVkIGFuZCB3aWxsIHNlbmQg
bmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBmb3IgcmV2aWV3Lg0KDQpSZWdhcmRzLA0KUmFodWwN
Cj4gDQo+IA0KPj4gDQo+PiBSZWdhcmRzLA0KPj4gUmFodWwNCj4+IA0KPj4+IA0KPj4+IC0tIA0K
Pj4+IFJlZ2FyZHMsDQo+Pj4gDQo+Pj4gT2xla3NhbmRyIFR5c2hjaGVua28NCj4gDQo+IC0tIA0K
PiBSZWdhcmRzLA0KPiANCj4gT2xla3NhbmRyIFR5c2hjaGVua28NCg0K

