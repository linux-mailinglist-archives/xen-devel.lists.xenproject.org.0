Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477FD2FF19D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 18:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72278.130008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2dbb-0002cr-CF; Thu, 21 Jan 2021 17:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72278.130008; Thu, 21 Jan 2021 17:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2dbb-0002cS-8G; Thu, 21 Jan 2021 17:18:47 +0000
Received: by outflank-mailman (input) for mailman id 72278;
 Thu, 21 Jan 2021 17:18:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUQ7=GY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l2dbZ-0002cN-To
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 17:18:45 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.58]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c63c180-a8f7-4f60-9a58-09ffc62596c5;
 Thu, 21 Jan 2021 17:18:42 +0000 (UTC)
Received: from AS8PR04CA0251.eurprd04.prod.outlook.com (2603:10a6:20b:330::16)
 by AM6PR08MB4261.eurprd08.prod.outlook.com (2603:10a6:20b:b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 21 Jan
 2021 17:18:39 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::9) by AS8PR04CA0251.outlook.office365.com
 (2603:10a6:20b:330::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Thu, 21 Jan 2021 17:18:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 17:18:38 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Thu, 21 Jan 2021 17:18:38 +0000
Received: from f0e45adb2fd1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6EBCF6A3-0BEB-436E-8E04-2EC3B59D608B.1; 
 Thu, 21 Jan 2021 17:18:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0e45adb2fd1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jan 2021 17:18:33 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (20.177.120.74) by
 DBBPR08MB5884.eurprd08.prod.outlook.com (20.182.200.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12; Thu, 21 Jan 2021 17:18:30 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 17:18:30 +0000
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
X-Inumbo-ID: 2c63c180-a8f7-4f60-9a58-09ffc62596c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HizH60qX4bvEdG5ahpydQe3GuW0tpIwgjFD5ZfVyXz4=;
 b=vUbhkO/FWHe6aACtYU7lyOP8qcOCoYuxvmdQpEomnDayv0mATPeaDrII73VrE4JFRI/8TSLEIr+VwZupC5ziAMf8i0FYGiqezaoBDDXn0aQrYqWt6pQdTEKbmOo8RSKYaZ/3zFxzLrqh2QjzCo3ogLMKQH8+TzFYl+XoRvVxdbM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2cf8cb9c18f91d38
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek2L+u5WJWLAZyc9WFx7LBenn0+n+DanpkrS33FGSPbISW+5Kw8XW3uKkqEiJ/d9VNhRKmNIwGN99I26fB0iPLS8325LX4CxiaH2a3D13QwDomoAPAk4Oj2kM//drwjAAUM+RI6Rg08a5X5LuBQN6ltridj1UPaaNDyj90PJw0PuTq9CN94jV4fkf7QLFqm7juwYWHhg7/yZ1UlfdjdGJ+aKM4zSAg3n8q7n5f8bvUNt0SCm4/ZJZ3kPRoYDyCwxc5dD3uWLsrnzQus4ZyW0Nb+91diU5uEgKyfwYIiXRRKGIJCZQmH0Z1kJO7Tc6QFtYt1QftZR66flXovec8S6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HizH60qX4bvEdG5ahpydQe3GuW0tpIwgjFD5ZfVyXz4=;
 b=gl65K9KafpAJAE7TOAZyi123leTEUYJCv4GbOv8b3Df+iRdYlR5CMOOp+tBARG1WFemKt511hQ1xPwrpoRNU87+BKmQRlvaoBvELv40sTowu4ckHeumjxpJCMn+Nu40Q7gQZ6RHWaCZG20IWpHWGP+N0XV2fERSK3K0VYNoNCdSgzhqwP+bGzC6FgqeBTVMduSFDcq2fGMRapUmlZbFwjCG8wOGkwp+CFs490EoPTIkHfqXbgJl4k+72VC5zLg3YuzoQCJVrSKRqBLwpNy/3TpIeksMelgnZ9ZfLvlFw0TZ0C1j5dYBhBhMIOByVkVlarCUErkPK11BDdwqiQBf6yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HizH60qX4bvEdG5ahpydQe3GuW0tpIwgjFD5ZfVyXz4=;
 b=vUbhkO/FWHe6aACtYU7lyOP8qcOCoYuxvmdQpEomnDayv0mATPeaDrII73VrE4JFRI/8TSLEIr+VwZupC5ziAMf8i0FYGiqezaoBDDXn0aQrYqWt6pQdTEKbmOo8RSKYaZ/3zFxzLrqh2QjzCo3ogLMKQH8+TzFYl+XoRvVxdbM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Topic: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Index: AQHW7zzXDLVfiB5hzUKpOAlBcRNn7KoxCUaAgAFLH4A=
Date: Thu, 21 Jan 2021 17:18:30 +0000
Message-ID: <F193260F-E4F0-4977-97ED-72505603C5F6@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
 <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com>
 <b35211f0-d523-aa5f-55a1-6afa5142617c@gmail.com>
In-Reply-To: <b35211f0-d523-aa5f-55a1-6afa5142617c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5f1e9d5-157d-405a-1dd5-08d8be3097cd
x-ms-traffictypediagnostic: DBBPR08MB5884:|AM6PR08MB4261:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4261B4832A1753210B6435E8FCA10@AM6PR08MB4261.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZVQxeR0w33ZBLPAwJpJYVN4lmnuTqvG1DLO1Uxl/Eta218rWWUWsHHRDhHJ+BtNTlX11QEgNEyphPCE/qLrYfauoufyYVRRCKQlfIsSgW2hfDeAhQ5t3pytU8wlxii8eFWODRy95y55/D0GpD0DVXIZ54ioAfBhn7Cj6PGC2eDmo0OmMWNgEKuFbw0XoOlvrU+BgnqB0Z2aDu2jkrRMe4JYsRmxFUBVfyYGnvu8EI+iHFKNs7b/QzMYvjomsS5gGOS0XPzyPvweLYKdJVnmjCyg1Zxoy5t0aZQjT8jn/eEmKgh4qHs0QzYPD8CR1XnEP5JLWbI0yGeGe8KOhC3kqQTctDzR8nhr1HANhAHnXKQBIfupetiHVsf0Pf0jUHPOZTpKnuex/UDqmEI5wNO5Yyv/ejH5nxWodyAB5iac0lTtlfSq656ONoN0HEoLHMB4PrV+qhqdWGCPYt6ZrbPD3jhGM1Jar726/V0i9tG2xgGIaL+wIXWjb0SXMTjLe3RVAv7C1q4XykMfD1OIziyqOf9brHXGM1cPcHjQJXjUPaGRRSc25rn02Z5Yr888vCHlZPzs5J0VDkp65PiOtE8vJpg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(66446008)(66556008)(66476007)(54906003)(91956017)(33656002)(76116006)(26005)(64756008)(2906002)(316002)(66946007)(6512007)(71200400001)(7416002)(6916009)(83380400001)(8936002)(6506007)(8676002)(36756003)(186003)(86362001)(2616005)(478600001)(5660300002)(6486002)(4326008)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?VlN1bTRuOVV6WWdLaEtlajhsS0FTaFFZMXRKT1MrT3FTZHZvU3kwL2dZc1Iy?=
 =?utf-8?B?SXpEN1BBaERuQUQxUC9nT1ZqYnVJaEIvN0dQdmhtWmV4WnFBSmJKbHk0Vy8v?=
 =?utf-8?B?eHAxSk03bFd5a3hxZnBhY1RZREFkR3dmQVBMckZPZ21RbkRzRHFjdTgyc1Y2?=
 =?utf-8?B?cUoybWdPQVhnWjhScG82TkdNRTVkUGRMQUx1Yi90bHRCbk5mREFuM2hhNGlY?=
 =?utf-8?B?S3oyc0JxcjBrY21UWTZBZU1CSFpHdFk2YXZoOFZwQVdZVnNuVU9idmJqazE4?=
 =?utf-8?B?c2pQWXdMbFEvQWZIbWlrMVJXeWRFMEJyWjViOHR4YzZHRm0wbVlNMWJBZ1ps?=
 =?utf-8?B?dWNYY3VmVVRuZStTNGlPY0pGSWg5K09FWnVRaEV4emtkOGFNdU5xdU5tN1U4?=
 =?utf-8?B?bUI0VzRmM2xmNVc3U0ROaUxjK1VDcUxkajlnMVpNN0k0bWg0OTZJeG1ZdkRv?=
 =?utf-8?B?QWFpZ1lMUUhkN3ptS0piUnlJQlhTM0hKRUxQSW4rTXhGcUhDQ1VZaHlvbW8w?=
 =?utf-8?B?dEFYc0NscTV6TGY0Sy9ZOW10ZXZ4U040OTNLalFIZktYMVpPTy9tYmliRkxo?=
 =?utf-8?B?ZklIZzlCSzJBMjV6d0NydDJETmlHelJoM1FCSTF1UjhPWTQreXBGOFl0WUtZ?=
 =?utf-8?B?b0ZKL2NKcVkzZExYNTcrZ1pOUW9WckEyM2FEdzdrVFVHa3NVNjNpMmdFaExY?=
 =?utf-8?B?bVZIenk4WHRBaTBvMGlKUUFyTko3OVJjVGtXeW9sWjkzTWIzTEt0YWVkMEJ3?=
 =?utf-8?B?RkRpTnBKYmRjd21GT0N6V0J6SzREWjNqTmYzWk5JVjA0UTZiaXM0cCtsbGZM?=
 =?utf-8?B?V2YydzNYYm8wUGJYY3FlYTZiTGhLcWswT0tNWk1wVi96bVFHQlE4UENKMVhP?=
 =?utf-8?B?SXdxL0NtblpUUW9DT2RNUFVjQWVKV0VnSDVpb0FSeFlzV2JwU2VKVWoyYzFp?=
 =?utf-8?B?OUkyU0lOZ3JzUGpia3dJZUk2Y1ZaVEtFa2p3VHVadEY4VVdETEsxMzBnYjlM?=
 =?utf-8?B?SUs2aEhKRktzazFqYWsvNWx5aGJKT01sczRVZ1Zsa05CbWZOV1N0L2JyZUdS?=
 =?utf-8?B?a0dERHJKaWxscGlzemdCNy8rSzhTeVNqQ21nK1Bqa0lRaHRWMnR3SXNEbXRy?=
 =?utf-8?B?YSs3a3VpcEVoWWJrRk1haGxCbG81LzJiOTdXWmE1VkxPOEkwU05oYnNhV0dV?=
 =?utf-8?B?Ulk2T0NPUWRpM0F6Ry8yK1VRMG0wS2hMOWFoWUIraHRxR1ZsRlZlSi9kcVVv?=
 =?utf-8?B?L09ITFhLTHV2UFZYYXZFZ1JlcnFrOGpQTFZHUTE2bmRESnNDdExCWnpyZzhN?=
 =?utf-8?B?d1ZZbitoQmF2QnBiVmRydTN1VXNySkN6K1dXTHovSFlZcDRkc3ZSUnFxWUJM?=
 =?utf-8?B?ZUFkTVRRMnlsMS8wTmRqMCs2UjlVNnAwN0hqMGIrdEhxYitCQmk1aTUvTGVK?=
 =?utf-8?Q?wAgeFGdM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29E5FD3F6119C0439AC2458088050699@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5884
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f6deb38-36b7-4e5f-092b-08d8be3092e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gvIu7AQrKKhejgiX/APGKWIWO1McBDhcSrqUGEm97svqpFwgCSpOy/hNXk35w3LorpuoR0qF/voTf5qIkyhAMdQpeGPMtJ58kCQdqzxBKUrh6CXeswHvKBxW0Ti3uU4dYsuDD8dsDV/B4Ey5yD0xZVlZRrNJoQqjZ5mdNK4qd1nPoJGQtEo9uWDJlDax2QA7+HSIencpGfrwWm3wKjhI1FaoKL58eHW/bflqWz+V1tgyrgO7kzgk72AnsSQzfMVMtXOwjtM3kx518HiBWdz+lS8GMuf75txZUTIb+TquxsGPTjeoTqDDCqwRMevXKU6ul+TQJ7NH/3QW5Zr2QQORx0fY7RMMcGjY55Vl3bCWK0GbUfvVVKZ6P4a3ik370z/22xvPTI5FUnUh7n9hV7LCzPg/+RJ+lJOiDw21YXteunji9i6bxjt6EojEix8pj9VxTTlYCxUuttRmkPbIkvP5KQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(46966006)(186003)(8676002)(81166007)(6512007)(82740400003)(86362001)(107886003)(2906002)(2616005)(356005)(336012)(6486002)(5660300002)(478600001)(8936002)(316002)(4326008)(82310400003)(47076005)(33656002)(54906003)(26005)(70586007)(36756003)(83380400001)(6862004)(70206006)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 17:18:38.6566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f1e9d5-157d-405a-1dd5-08d8be3097cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4261

SGVsbG8gT2xla3NhbmRyLA0KDQo+IE9uIDIwIEphbiAyMDIxLCBhdCA5OjMzIHBtLCBPbGVrc2Fu
ZHIgPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDIwLjAxLjIxIDE2
OjUyLCBSYWh1bCBTaW5naCB3cm90ZToNCj4gDQo+IEhpIFJhaHVsDQo+IA0KPj4gQWRkIHN1cHBv
cnQgZm9yIEFSTSBhcmNoaXRlY3RlZCBTTU1VdjMgaW1wbGVtZW50YXRpb24uIEl0IGlzIGJhc2Vk
IG9uDQo+PiB0aGUgTGludXggU01NVXYzIGRyaXZlci4NCj4+IA0KPj4gRHJpdmVyIGlzIGN1cnJl
bnRseSBzdXBwb3J0ZWQgYXMgVGVjaCBQcmV2aWV3Lg0KPj4gDQo+PiBNYWpvciBkaWZmZXJlbmNl
cyB3aXRoIHJlZ2FyZCB0byBMaW51eCBkcml2ZXIgYXJlIGFzIGZvbGxvd3M6DQo+PiAyLiBPbmx5
IFN0YWdlLTIgdHJhbnNsYXRpb24gaXMgc3VwcG9ydGVkIGFzIGNvbXBhcmVkIHRvIHRoZSBMaW51
eCBkcml2ZXINCj4+ICAgIHRoYXQgc3VwcG9ydHMgYm90aCBTdGFnZS0xIGFuZCBTdGFnZS0yIHRy
YW5zbGF0aW9ucy4NCj4+IDMuIFVzZSBQMk0gIHBhZ2UgdGFibGUgaW5zdGVhZCBvZiBjcmVhdGlu
ZyBvbmUgYXMgU01NVXYzIGhhcyB0aGUNCj4+ICAgIGNhcGFiaWxpdHkgdG8gc2hhcmUgdGhlIHBh
Z2UgdGFibGVzIHdpdGggdGhlIENQVS4NCj4+IDQuIFRhc2tsZXRzIGFyZSB1c2VkIGluIHBsYWNl
IG9mIHRocmVhZGVkIElSUSdzIGluIExpbnV4IGZvciBldmVudCBxdWV1ZQ0KPj4gICAgYW5kIHBy
aW9yaXR5IHF1ZXVlIElSUSBoYW5kbGluZy4NCj4+IDUuIExhdGVzdCB2ZXJzaW9uIG9mIHRoZSBM
aW51eCBTTU1VdjMgY29kZSBpbXBsZW1lbnRzIHRoZSBjb21tYW5kcyBxdWV1ZQ0KPj4gICAgYWNj
ZXNzIGZ1bmN0aW9ucyBiYXNlZCBvbiBhdG9taWMgb3BlcmF0aW9ucyBpbXBsZW1lbnRlZCBpbiBM
aW51eC4NCj4+ICAgIEF0b21pYyBmdW5jdGlvbnMgdXNlZCBieSB0aGUgY29tbWFuZHMgcXVldWUg
YWNjZXNzIGZ1bmN0aW9ucyBhcmUgbm90DQo+PiAgICBpbXBsZW1lbnRlZCBpbiBYRU4gdGhlcmVm
b3JlIHdlIGRlY2lkZWQgdG8gcG9ydCB0aGUgZWFybGllciB2ZXJzaW9uDQo+PiAgICBvZiB0aGUg
Y29kZS4gQXRvbWljIG9wZXJhdGlvbnMgYXJlIGludHJvZHVjZWQgdG8gZml4IHRoZSBib3R0bGVu
ZWNrDQo+PiAgICBvZiB0aGUgU01NVSBjb21tYW5kIHF1ZXVlIGluc2VydGlvbiBvcGVyYXRpb24u
IEEgbmV3IGFsZ29yaXRobSBmb3INCj4+ICAgIGluc2VydGluZyBjb21tYW5kcyBpbnRvIHRoZSBx
dWV1ZSBpcyBpbnRyb2R1Y2VkLCB3aGljaCBpcyBsb2NrLWZyZWUNCj4+ICAgIG9uIHRoZSBmYXN0
LXBhdGguDQo+PiAgICBDb25zZXF1ZW5jZSBvZiByZXZlcnRpbmcgdGhlIHBhdGNoIGlzIHRoYXQg
dGhlIGNvbW1hbmQgcXVldWUNCj4+ICAgIGluc2VydGlvbiB3aWxsIGJlIHNsb3cgZm9yIGxhcmdl
IHN5c3RlbXMgYXMgc3BpbmxvY2sgd2lsbCBiZSB1c2VkIHRvDQo+PiAgICBzZXJpYWxpemVzIGFj
Y2Vzc2VzIGZyb20gYWxsIENQVXMgdG8gdGhlIHNpbmdsZSBxdWV1ZSBzdXBwb3J0ZWQgYnkNCj4+
ICAgIHRoZSBoYXJkd2FyZS4gT25jZSB0aGUgcHJvcGVyIGF0b21pYyBvcGVyYXRpb25zIHdpbGwg
YmUgYXZhaWxhYmxlIGluDQo+PiAgICBYRU4gdGhlIGRyaXZlciBjYW4gYmUgdXBkYXRlZC4NCj4+
IDYuIFNwaW4gbG9jayBpcyB1c2VkIGluIHBsYWNlIG9mIG11dGV4IHdoZW4gYXR0YWNoaW5nIGEg
ZGV2aWNlIHRvIHRoZQ0KPj4gICAgU01NVSwgYXMgdGhlcmUgaXMgbm8gYmxvY2tpbmcgbG9ja3Mg
aW1wbGVtZW50YXRpb24gYXZhaWxhYmxlIGluIFhFTi4NCj4+ICAgIFRoaXMgbWlnaHQgaW50cm9k
dWNlIGxhdGVuY3kgaW4gWEVOLiBOZWVkIHRvIGludmVzdGlnYXRlIGJlZm9yZQ0KPj4gICAgZHJp
dmVyIGlzIG91dCBmb3IgdGVjaCBwcmV2aWV3Lg0KPj4gNy4gUENJIEFUUyBmdW5jdGlvbmFsaXR5
IGlzIG5vdCBzdXBwb3J0ZWQsIGFzIHRoZXJlIGlzIG5vIHN1cHBvcnQNCj4+ICAgIGF2YWlsYWJs
ZSBpbiBYRU4gdG8gdGVzdCB0aGUgZnVuY3Rpb25hbGl0eS4gQ29kZSBpcyBub3QgdGVzdGVkIGFu
ZA0KPj4gICAgY29tcGlsZWQuIENvZGUgaXMgZ3VhcmRlZCBieSB0aGUgZmxhZyBDT05GSUdfUENJ
X0FUUy4NCj4+IDguIE1TSSBpbnRlcnJ1cHRzIGFyZSBub3Qgc3VwcG9ydGVkIGFzIHRoZXJlIGlz
IG5vIHN1cHBvcnQgYXZhaWxhYmxlIGluDQo+PiAgICBYRU4gdG8gcmVxdWVzdCBNU0kgaW50ZXJy
dXB0cy4gQ29kZSBpcyBub3QgdGVzdGVkIGFuZCBjb21waWxlZC4gQ29kZQ0KPj4gICAgaXMgZ3Vh
cmRlZCBieSB0aGUgZmxhZyBDT05GSUdfTVNJLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1
bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBzaW5jZSB2
MjoNCj4+IC0gYWRkZWQgcmV0dXJuIHN0YXRlbWVudCBmb3IgcmVhZHhfcG9sbF90aW1lb3V0IGZ1
bmN0aW9uLg0KPj4gLSByZW1vdmUgaW9tbXVfZ2V0X2RtYV9jb29raWUgYW5kIGlvbW11X3B1dF9k
bWFfY29va2llLg0KPj4gLSByZW1vdmUgc3RydWN0IGFybV9zbW11X3hlbl9kZXZpY2UgYXMgbm90
IHJlcXVpcmVkLg0KPj4gLSBtb3ZlIGR0X3Byb3BlcnR5X21hdGNoX3N0cmluZyB0byBkZXZpY2Vf
dHJlZS5jIGZpbGUuDQo+PiAtIHJlcGxhY2UgYXJtX3NtbXVfKl90aHJlYWQgdG8gYXJtX3NtbXVf
Kl90YXNrbGV0IHRvIGF2b2lkIGNvbmZ1c2lvbi4NCj4+IC0gdXNlIEFSTV9TTU1VX1JFR19TWiBh
cyBzaXplIHdoZW4gbWFwIG1lbW9yeSB0byBYRU4uDQo+PiAtIHJlbW92ZSBieXBhc3Mga2V5d29y
ZCB0byBtYWtlIHN1cmUgd2hlbiBkZXZpY2UtdHJlZSBwcm9iZSBpcyBmYWlsZWQgd2UNCj4+ICAg
YXJlIHJlcG9ydGluZyBlcnJvciBhbmQgbm90IGNvbnRpbnVpbmcgdG8gY29uZmlndXJlIFNNTVUg
aW4gYnlwYXNzDQo+PiAgIG1vZGUuDQo+PiAtIGZpeGVkIG1pbm9yIGNvbW1lbnRzLg0KPj4gQ2hh
bmdlcyBzaW5jZSB2MzoNCj4+IC0gRml4ZWQgdHlwbyBmb3IgQ09ORklHX01TSQ0KPj4gLSBBZGRl
ZCBiYWNrIHRoZSBtdXRleCBjb2RlDQo+PiAtIFJlYmFzZSB0aGUgcGF0Y2ggb24gdG9wIG9mIG5l
d2x5IGFkZGVkIFdBUk5fT04oKS4NCj4+IC0gUmVtb3ZlIHRoZSBkaXJlY3QgcmVhZCBvZiByZWdp
c3RlciBWVENSX0VMMi4NCj4+IC0gRml4ZWQgbWlub3IgY29tbWVudHMuDQo+PiBDaGFuZ2VzIHNp
bmNlIHY0Og0KPj4gLSBSZXBsYWNlIHRoZSBmZnNsbCgpIHdpdGggZmZzNjQoKSBmdW5jdGlvbi4N
Cj4+IC0gQWRkIGNvZGUgdG8gZnJlZSByZXNvdXJjZXMgd2hlbiBwcm9iZSBmYWlsZWQuDQo+IA0K
PiBUaGFuayB5b3UgZm9yIGFkZHJlc3NpbmcsIHBhdGNoIGxvb2tzIG9rIHRvIG1lLCBqdXN0IG9u
ZSBzbWFsbCByZW1hcmsgYmVsb3c6DQo+IA0KPiANCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBfX2h3
ZG9tX2luaXQgYXJtX3NtbXVfaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4g
K3sNCj4+ICt9DQo+IA0KPiBXZSBkaXNjdXNzZWQgaW4gVjQgYWJvdXQgYWRkaW5nIHNvbWUgY29k
ZSBoZXJlIHdoaWNoIGFsbCBJT01NVXMgb24gQXJtIGFscmVhZHkgaGF2ZSwgY29weSBpdCBiZWxv
dyBmb3IgdGhlIGNvbnZlbmllbmNlOg0KPiANCj4gDQo+ICAgICAgLyogU2V0IHRvIGZhbHNlIG9w
dGlvbnMgbm90IHN1cHBvcnRlZCBvbiBBUk0uICovDQo+ICAgICAgaWYgKCBpb21tdV9od2RvbV9p
bmNsdXNpdmUgKQ0KPiAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gICAgICAgICAg
Im1hcC1pbmNsdXNpdmUgZG9tMC1pb21tdSBvcHRpb24gaXMgbm90IHN1cHBvcnRlZCBvbiBBUk1c
biIpOw0KPiAgICAgIGlvbW11X2h3ZG9tX2luY2x1c2l2ZSA9IGZhbHNlOw0KPiAgICAgIGlmICgg
aW9tbXVfaHdkb21fcmVzZXJ2ZWQgPT0gMSApDQo+ICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FS
TklORw0KPiAgICAgICAgICAibWFwLXJlc2VydmVkIGRvbTAtaW9tbXUgb3B0aW9uIGlzIG5vdCBz
dXBwb3J0ZWQgb24gQVJNXG4iKTsNCj4gICAgICBpb21tdV9od2RvbV9yZXNlcnZlZCA9IDA7DQo+
IA0KPiAgICAgIGFyY2hfaW9tbXVfaHdkb21faW5pdChkKTsNCj4gDQo+IA0KPiBBbHNvIHdlIGRp
c2N1c3NlZCBhYm91dCBwb3NzaWJpbGl0eSB0byBmb2xkIHRoZSBwYXJ0IG9mIGNvZGUgKHdoaWNo
IGRpc2FibGVzIHVuc3VwcG9ydGVkIG9wdGlvbnMpIGluIGFyY2hfaW9tbXVfaHdkb21faW5pdCgp
IHRvIGF2b2lkIGR1cGxpY2F0aW9uIGFzIGEgZm9sbG93LXVwLg0KPiBBdCBsZWFzdCwgSSBleHBl
Y3RlZCB0byBzZWUgYXJjaF9pb21tdV9od2RvbV9pbml0KCkgdG8gYmUgY2FsbGVkIGJ5IGFybV9z
bW11X2lvbW11X2h3ZG9tX2luaXQoKSBpdCBjdXJyZW50IHBhdGNoLi4uIFBsZWFzZSBub3RlLCB0
aGlzIGlzICpub3QqIGEgcmVxdWVzdCBmb3IgY2hhbmdlIGltbWVkaWF0ZWx5LA0KPiBJIHRoaW5r
LCBkcml2ZXIgaXMgZnVuY3Rpb25hbCBldmVuIHdpdGhvdXQgdGhpcyBjb2RlIChob3BlZnVsbHkg
YXJjaF9pb21tdV9od2RvbV9pbml0IGlzIGVtcHR5IG5vdywgZXRjKS4gIEJ1dCwgaWYgeW91IGhh
cHBlbiB0byBkbyBWNiBvciBwcm9iYWJseSBpdCBjb3VsZCBiZSBkb25lIG9uIGNvbW1pdCAuLi4N
Cj4gDQoNClllcyBJIHdpbGwgc2VuZCB0aGUgcGF0Y2ggdG8gbW92ZSB0aGUgY29kZSB0byBhcmNo
X2lvbW11X2h3ZG9tX2luaXQoKSB0byBhdm9pZCBkdXBsaWNhdGlvbiBvbmNlIFNNTVV2MyBkcml2
ZXIgd2lsbCBiZSBtZXJnZWQuDQpJIHRob3VnaHQgYW55d2F5IEkgaGF2ZSB0byByZW1vdmUgdGhl
IGNvZGUgZnJvbSBTTU1VdjEgYW5kIElQTU1VIEkgd2lsbCB0YWtlIGNhcmUgb2YgYWxsIHRoZSBJ
T01NVSBkcml2ZXIgYXQgdGhlIHNhbWUgdGltZSBiZWNhdXNlIG9mIHRoYXQgSSBkaWRu4oCZdCBt
b2RpZnkgdGhlIFNNTVV2MyBkcml2ZXIuIFllcyBpZiB0aGVyZSBpcyBhIG5lZWQgZm9yIHY2IEkg
d2lsbCBhZGQgdGhlIGFyY2hfaW9tbXVfaHdkb21faW5pdChkKSBpbiBhcm1fc21tdV9pb21tdV9o
d2RvbV9pbml0KCkuDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo+IA0KPj4gKw0KPj4gK3N0YXRpYyB2
b2lkIGFybV9zbW11X2lvbW11X3hlbl9kb21haW5fdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkN
Cj4+ICt7DQo+PiArCXN0cnVjdCBhcm1fc21tdV94ZW5fZG9tYWluICp4ZW5fZG9tYWluID0gZG9t
X2lvbW11KGQpLT5hcmNoLnByaXY7DQo+PiArDQo+PiArCUFTU0VSVChsaXN0X2VtcHR5KCZ4ZW5f
ZG9tYWluLT5jb250ZXh0cykpOw0KPj4gKwl4ZnJlZSh4ZW5fZG9tYWluKTsNCj4+ICt9DQo+PiAr
DQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgYXJtX3NtbXVfaW9tbXVfb3BzID0g
ew0KPj4gKwkuaW5pdAkJPSBhcm1fc21tdV9pb21tdV94ZW5fZG9tYWluX2luaXQsDQo+PiArCS5o
d2RvbV9pbml0CQk9IGFybV9zbW11X2lvbW11X2h3ZG9tX2luaXQsDQo+PiArCS50ZWFyZG93bgkJ
PSBhcm1fc21tdV9pb21tdV94ZW5fZG9tYWluX3RlYXJkb3duLA0KPj4gKwkuaW90bGJfZmx1c2gJ
CT0gYXJtX3NtbXVfaW90bGJfZmx1c2gsDQo+PiArCS5pb3RsYl9mbHVzaF9hbGwJPSBhcm1fc21t
dV9pb3RsYl9mbHVzaF9hbGwsDQo+PiArCS5hc3NpZ25fZGV2aWNlCQk9IGFybV9zbW11X2Fzc2ln
bl9kZXYsDQo+PiArCS5yZWFzc2lnbl9kZXZpY2UJPSBhcm1fc21tdV9yZWFzc2lnbl9kZXYsDQo+
PiArCS5tYXBfcGFnZQkJPSBhcm1faW9tbXVfbWFwX3BhZ2UsDQo+PiArCS51bm1hcF9wYWdlCQk9
IGFybV9pb21tdV91bm1hcF9wYWdlLA0KPj4gKwkuZHRfeGxhdGUJCT0gYXJtX3NtbXVfZHRfeGxh
dGUsDQo+PiArCS5hZGRfZGV2aWNlCQk9IGFybV9zbW11X2FkZF9kZXZpY2UsDQo+PiArfTsNCj4+
ICsNCj4+ICtzdGF0aWMgX19pbml0IGludCBhcm1fc21tdV9kdF9pbml0KHN0cnVjdCBkdF9kZXZp
Y2Vfbm9kZSAqZGV2LA0KPj4gKwkJCQljb25zdCB2b2lkICpkYXRhKQ0KPj4gK3sNCj4+ICsJaW50
IHJjOw0KPj4gKw0KPj4gKwkvKg0KPj4gKwkgKiBFdmVuIGlmIHRoZSBkZXZpY2UgY2FuJ3QgYmUg
aW5pdGlhbGl6ZWQsIHdlIGRvbid0IHdhbnQgdG8NCj4+ICsJICogZ2l2ZSB0aGUgU01NVSBkZXZp
Y2UgdG8gZG9tMC4NCj4+ICsJICovDQo+PiArCWR0X2RldmljZV9zZXRfdXNlZF9ieShkZXYsIERP
TUlEX1hFTik7DQo+PiArDQo+PiArCXJjID0gYXJtX3NtbXVfZGV2aWNlX3Byb2JlKGR0X3RvX2Rl
dihkZXYpKTsNCj4+ICsJaWYgKHJjKQ0KPj4gKwkJcmV0dXJuIHJjOw0KPj4gKw0KPj4gKwlpb21t
dV9zZXRfb3BzKCZhcm1fc21tdV9pb21tdV9vcHMpOw0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+
ICt9DQo+PiArDQo+PiArRFRfREVWSUNFX1NUQVJUKHNtbXV2MywgIkFSTSBTTU1VIFYzIiwgREVW
SUNFX0lPTU1VKQ0KPj4gKy5kdF9tYXRjaCA9IGFybV9zbW11X29mX21hdGNoLA0KPj4gKy5pbml0
ID0gYXJtX3NtbXVfZHRfaW5pdCwNCj4+ICtEVF9ERVZJQ0VfRU5EDQo+IA0KPiAtLSANCj4gUmVn
YXJkcywNCj4gDQo+IE9sZWtzYW5kciBUeXNoY2hlbmtvDQoNCg==

