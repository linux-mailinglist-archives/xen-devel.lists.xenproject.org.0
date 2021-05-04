Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F018372B1E
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122409.230898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvB5-0004DV-Ij; Tue, 04 May 2021 13:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122409.230898; Tue, 04 May 2021 13:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvB5-0004D7-FJ; Tue, 04 May 2021 13:33:31 +0000
Received: by outflank-mailman (input) for mailman id 122409;
 Tue, 04 May 2021 13:33:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8884=J7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1ldvB4-0004D0-6M
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:33:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::60a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47bc4bf8-73f5-4d4d-9b37-b8835af71570;
 Tue, 04 May 2021 13:33:27 +0000 (UTC)
Received: from DB7PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:10:52::31)
 by VI1PR08MB5341.eurprd08.prod.outlook.com (2603:10a6:803:135::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 13:33:24 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::e7) by DB7PR02CA0018.outlook.office365.com
 (2603:10a6:10:52::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Tue, 4 May 2021 13:33:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 13:33:24 +0000
Received: ("Tessian outbound 8ca198b738d3:v91");
 Tue, 04 May 2021 13:33:24 +0000
Received: from 518802a104b1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 775F3061-7E55-434F-AF8B-6D4CF107A98A.1; 
 Tue, 04 May 2021 13:33:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 518802a104b1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 May 2021 13:33:13 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB4238.eurprd08.prod.outlook.com (2603:10a6:803:f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Tue, 4 May
 2021 13:33:10 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 13:33:10 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:197::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Tue, 4 May 2021 13:33:09 +0000
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
X-Inumbo-ID: 47bc4bf8-73f5-4d4d-9b37-b8835af71570
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCmY5xtt53UnXwyGAt02nSthVV0hK+IwmbNXSyzE5M0=;
 b=d8rz+cbzY6OUlA/LXGZW+6rqtLulFgqqj+9OH9zX1P7CD+av8fJowabmOUf5zMCOB6z5NqZdfOtX1MfT1qdIX8fODDejbIV/ifNqYNwNXJ+8PYzB19clhzoP+mdCboLhsvmStoomH899IntewPyE+BwBAR5hVTwz5YySATKkWZg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c72431353c9cc090
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNlp0Q6R4CZilrtfRqyos78CaP3Hc8j1ddR0gSXtswQWiM4x+9o3lSzUvHhtGckYOpZw40zvXwVRggZ9EGnSEc3Be+5gypey+mII3RpeAxUU/WmQjosrF4mxZYqQu3G328+hEb2oob1Y7bzLPuxmYLRw9HW6upj1pnObQsYu/o6h5GH7c0vjc0ztY7VwXrIR/zzX8YJ0/0/XpG91gkvR0zFlMOdTuq59c0CTpIE7UNYhOY0i0hJQm8obPu2Er2+FPSM4xPvFYmRum1NPVW5imBYFMFcEQdpTxuvyCImCJVUm/j1liHJ7eAs3IgponsmjySjhjP4YBVs/NlUp/Cozzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCmY5xtt53UnXwyGAt02nSthVV0hK+IwmbNXSyzE5M0=;
 b=BaOGmWNj9qn6a4A49KOekS4SMq8FBvpy6ySmce38hFBc9hVnPPvV/IL83hkEu/BcuZZRBhqnHNNMJc9PHzuIE2Yd+NiwtbS7uiqQKrIkjy+2DXwT/2NeXF7XI0Z0CyYPEqU4HJojp2pYstMSNby/laHJTPgUeAvYhZskmFy9sLtlh2DA97oBfC6cUe0dJV0/nuQLv6VAWWE3i7UKvCDhuuqUQT/9il3LqhjE7RUm60QH9wuAC7h40wN6sthhL6Qxg7gM1osirXiaQN6wJyNnETRwjv3G8zyG6cO5Vk+ibDHRWOnMFl2rXS5/ub4PLkPDWQVcProCxlq6E+vVc3F1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCmY5xtt53UnXwyGAt02nSthVV0hK+IwmbNXSyzE5M0=;
 b=d8rz+cbzY6OUlA/LXGZW+6rqtLulFgqqj+9OH9zX1P7CD+av8fJowabmOUf5zMCOB6z5NqZdfOtX1MfT1qdIX8fODDejbIV/ifNqYNwNXJ+8PYzB19clhzoP+mdCboLhsvmStoomH899IntewPyE+BwBAR5hVTwz5YySATKkWZg=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v4 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <e3f816df-a3ee-f880-ad6f-68c9cc2db517@suse.com>
Date: Tue, 4 May 2021 14:33:02 +0100
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
Message-Id: <5D19A76C-DBD5-463D-975C-65FBDA0297C4@arm.com>
References: <20210504094606.7125-1-luca.fancellu@arm.com>
 <20210504094606.7125-4-luca.fancellu@arm.com>
 <37e5b461-40fe-ac78-59b9-033ff8cdc6d1@suse.com>
 <1853929B-AC45-42AF-8FE4-7B23C700B2E2@arm.com>
 <e3f816df-a3ee-f880-ad6f-68c9cc2db517@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e29ac58d-ec28-43d9-4b1d-08d90f013156
X-MS-TrafficTypeDiagnostic: VI1PR08MB4238:|VI1PR08MB5341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5341163DB338410D4A13486BE45A9@VI1PR08MB5341.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7LSSm1EbNSXQBmTkAvsicCb8SXxeT7WqBOjeEHsqqOCSxvMVVoxSQlW5g4tJBDTfWTeF+SAy1cl0Vd0Uv7rEN/PsBntPwi5SwCQKoKid4xz4BC+FC9d/LV0Gi5je8KWcyGBBX4Rc2caMwRZyV8ecV0sUKyxaXSux4U9Uhp14TCUloYP6grYdAsT2h3QKFwZ/ONflPx3W5ouZ8dGMb4ed5j8cwV8Nwj2sflXADiKYWYEFp28udMFJcqg8o5G23DIFBvZEgzFh8AVhfQBD0CUQ++T1PueNo2d+AYuiOT+HkIqVdifLxCJnYK7W8Kd0R/u9QaQBOd+IymzjxG2KVSOVpopY50BqFwUsYB3/yXlMOazXJ00QdsIJ1NLEpoy1oAsGU8h53FxnYjECioDqWU5tNXcwxFT736sG1NKRCb6oUskzOX/ZkUejBbmKJ0gO8Onkw+XChmAed5bE3CzirrShZGe+TDhx5iAkaznD4JXkLVQSe+mL4+sAhOg2NLikvFu+tcnEtrZW7BX9q0TWfGVszzDPFZpZPftzCcUFcPGOj/iWi/+vWW8j2wUhLKhud4sU6SZR2KFT1Ml/YEilP0GnWdQn2PL7/0wuxF1DKv351mn55d02aNLvCmNz53QOref92t0jzxiETgwo8JhbyB5OYmYRWKXFggNY12e8RPWuI8g1Ciim82okQFOezzFt8Rbo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39850400004)(396003)(2906002)(2616005)(956004)(44832011)(8676002)(186003)(38350700002)(6916009)(16526019)(86362001)(6666004)(5660300002)(52116002)(4326008)(36756003)(54906003)(8936002)(33656002)(66946007)(66556008)(478600001)(316002)(6486002)(6512007)(66476007)(6506007)(26005)(53546011)(38100700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?UnRMVU1MUW9ZVEdQVmRDVnpiZFBBc0VHK0VTVnAxL1hrK3lscW5lcXVCSExZ?=
 =?utf-8?B?aFFXR0M0NFM4b05TVVh6Rm04bWVYTVR2Q3JrMGVROFZ4ZTJuQUhQVXJsU0Yy?=
 =?utf-8?B?TWpDb1R6SjJJekh4UktMZEZFUmxRcUxoZEY0ZEt5Rk5QbTE1MTZpMHRZYTVB?=
 =?utf-8?B?b0d4SndZckEzT0lPaEppTlU3MkYxcEd2MXZsSGNBVGJTTDUxYVBkTmFYQUZT?=
 =?utf-8?B?dDhucERzVndqNHpHbWNGNjVIeWVoVlpXNzY4VjZSQWNVR29sSk9uclAwOEFr?=
 =?utf-8?B?Y0xIV1djdG9icXI4c05NelJVbFFTMVUyN1pJU2NjUlFRcjFsdDRKRzd1MVAz?=
 =?utf-8?B?TURCemdzbm9YL2RNc0UzeUNLREpGRUNpb2FqZG5xYWtDR1YrTnR5Yy90TDJN?=
 =?utf-8?B?WGR1STRPQVhpckNhUm4zcnJvQURid1daWENyenZJRGthaC9wNHAxcWZZWHBK?=
 =?utf-8?B?SDY1RHR2ZmIwN2NSYXBIUGVva1I3YWFjTnp0RFByajIvc0FVUVk5VmV2Q2tr?=
 =?utf-8?B?YTVjSzVvNkxwdFlFVmhoa3U3dXBIOS9zQWw5bFBUaEJQOENyRHBzUEJKN3ZK?=
 =?utf-8?B?dm8yUEhBVkwvNzhEdktRUnl3MllEazl1dld1dWpENndhdS8ydHdONlI0UmY5?=
 =?utf-8?B?Y1pLaUNVdnE5dXRTaWxkdm51UlNHeDJlZnhYR2V4emVuMjYvdTE2aDQzVjMx?=
 =?utf-8?B?UzhTSXluaTNzc0dURnRoZFdHeXI2ZjQ0eXlHcUE5MUFVajF3M1N1WnJMT2Vz?=
 =?utf-8?B?bVNKeWprNVlXcU1SdGwxOFU2QjFIM3d0aE91U3E3ZC9EcnJCT2tZQ3ZzZjVH?=
 =?utf-8?B?cDdKcDR6bFBUUXFuVGM3azNkZWU2MnNrbFYwQXl1M2NZZjVMcnY3RTJmMHU5?=
 =?utf-8?B?OUVIV2g4UEJnRzUzTklTUDhsTFNEc09xaTJRY0FPUlJXWVhQckJ2b0ZqM1NU?=
 =?utf-8?B?aFR5djBnV01ZcWdYUWlBeXNKSGhEazhCd3I1VVNGTGM0NzNPT1hHRDk3N0Zo?=
 =?utf-8?B?SWRzMFQwbit6MG1lN3cxVXhIWVZnbXlRTUlpOFZsZW9QUmRTbTM1V1ZTR1lp?=
 =?utf-8?B?dmN4dk5uaFZPanZIOE9QTXFYYit0cmxjTnBxYUJQWkFyc0NpNHo1QkU4OHlD?=
 =?utf-8?B?TTE0UFZ3bTdUeU9lb2thMU95M3J2K2tmSGRtMTJmSDdnVHlaYTQ3OFVkZ2Jz?=
 =?utf-8?B?amlEUW45NTJmUXljOHJnMDF2b1ozRHc3RmI3Q0tNc2NBa0dLZkdhRkNFSEUx?=
 =?utf-8?B?enUvaEs3ZjlzMHF1ZnBGRjhQUDdEQU5nRXp6Z0hrS1IwTWRuL0VVajRqQVdR?=
 =?utf-8?B?VllQbW5BenZmbTBYb2wwU3ZpbDRaY0tWTXFINjJibGh2emh3NmhjQldlWjN5?=
 =?utf-8?B?NGErNk9BSzJxUVlnVXFwTDVRU1BwNzVVUlRPSVRKYzlKT3NvYlI4NzdZRHZW?=
 =?utf-8?B?dGNGVlRjRVRSOGhXYzE4RnMwbkhtelkyT3pJcHNmZHk1aHRxQ0lWOVg3SEhV?=
 =?utf-8?B?TmNnTCt2V0ZKVUtnbDFNOTFEOVpuSHduMm5pdlJBZVBmMW1JWUpGbWpxdnk0?=
 =?utf-8?B?eFlvUVNXeWRMUXBPdTB3eTR1OXpOdHZBNVE5NWR3NUp4bFlxSDlzZWpIWkZI?=
 =?utf-8?B?ZUpnbVBodlpXS1JtblFuZFR5K1JBR3A2NTlUaUFUL2dmWm16OGZJcDZIMFpQ?=
 =?utf-8?B?Z2FhZVFCNTFMYUFGeGR3VHlzUVdSM0tLYnQxdnh3UGl1N2kyZGx2WUo4NnNX?=
 =?utf-8?Q?SPODkr1F7ITCw/Qyg/rzEUotcq50Wx9I2xNgD1i?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4238
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80e855ea-4f70-444c-ad6e-08d90f012870
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IZ6uBNM1wOMLpaupbpG6gUABzVVU96HpYH9TpN6DagQb0BfXXqrPbzeDpe6yu3TZ6oL97BdcQB5BskhgDUCyP0dKhSu0TPEkpIgkQPuPF9qqABdWaPlEt4MVBegwctbD+qlm+nQpb07K5A5/VGfXynsfuu83s7+1O7t9Mo01JOVHABQ/4roxl2W+K81STcpZb9bJfZLOrceA4g+IJCJQ67Z4iVq7muiIZYjxn4Y3uL9+VOALVkWxUU3rMkAGg9d5zpO/e+qWZ8nQMnz47B8zPO2jpyNbvY/lCg8BdB5M7L/b/U9C/M2Dhs8kmQkkMfRg2izdhVVN2KziH+SYFCKVGmgeT0/7+wmOF90N8qMXxcwB2Ha0T2hcCJs+Z8QCLgbdGgGsKxBiVz4lXS7+Q5j0fFncCAtwMkSpXTmxGtUIeRU2ypCE6FVdBV6cyZoTwejqrISBZQwd+rAMafiyXjJGC3yH/ZXmNO0dTP8fiZoFoTs8YbmTTBZ0RtnNebOcDc0xQcSbPxM/oJgoj0xuFZNHArZqGKQ+5gEEp+58kj4GOPCdOgNkZ+ySQedkA8wkA4078rdS5+uN+9YGB2fX6dpo0Wopys0ruNpmeXrN3XnxRNwWpSM4VX1/QBEp7XZurR58wooDPAqAg0kSoDXDCHum24lFM1yiPV3U29qbPhoDfzQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(346002)(376002)(46966006)(36840700001)(4326008)(6862004)(336012)(82310400003)(5660300002)(53546011)(16526019)(36860700001)(36756003)(6666004)(6512007)(82740400003)(2906002)(86362001)(186003)(26005)(47076005)(54906003)(44832011)(316002)(478600001)(356005)(33656002)(6506007)(81166007)(8936002)(8676002)(70206006)(956004)(70586007)(2616005)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 13:33:24.6673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e29ac58d-ec28-43d9-4b1d-08d90f013156
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5341



> On 4 May 2021, at 14:28, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 04.05.2021 15:09, Luca Fancellu wrote:
>>> On 4 May 2021, at 12:48, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 04.05.2021 11:46, Luca Fancellu wrote:
>>>> @@ -451,11 +466,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>>> * bytes to be copied.
>>>> */
>>>>=20
>>>> -#define _GNTCOPY_source_gref      (0)
>>>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>>> -#define _GNTCOPY_dest_gref        (1)
>>>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>>> -
>>>> struct gnttab_copy {
>>>>    /* IN parameters. */
>>>>    struct gnttab_copy_ptr {
>>>> @@ -471,6 +481,12 @@ struct gnttab_copy {
>>>>    /* OUT parameters. */
>>>>    int16_t       status;
>>>> };
>>>> +
>>>> +#define _GNTCOPY_source_gref      (0)
>>>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>>> +#define _GNTCOPY_dest_gref        (1)
>>>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>>=20
>>> Didn't you say you agree with moving this back up some, next to the
>>> field using these?
>>=20
>> My mistake! I=E2=80=99ll move it in the next patch, did you spot anythin=
g else I might have forgot of what we agreed?
>=20
> No, thanks. I don't think I have any more comments to make on this
> series (once this last aspect got addressed, and assuming no new
> issues get introduced). But to be clear on that side as well - I
> don't think I'm up to actually ack-ing the patch (let alone the
> entire series).

Ok, at least would you mind to do a review by of the patches we discussed t=
ogether?

Cheers,
Luca

>=20
> Jan


