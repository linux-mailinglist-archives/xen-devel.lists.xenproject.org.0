Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B1A35CEC1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 18:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109388.208825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVzpM-0007IC-Sj; Mon, 12 Apr 2021 16:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109388.208825; Mon, 12 Apr 2021 16:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVzpM-0007Hn-PX; Mon, 12 Apr 2021 16:54:20 +0000
Received: by outflank-mailman (input) for mailman id 109388;
 Mon, 12 Apr 2021 16:54:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKKJ=JJ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lVzpM-0007Hi-6d
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 16:54:20 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04c56907-8158-4c8d-9d64-994e6d4dbe30;
 Mon, 12 Apr 2021 16:54:17 +0000 (UTC)
Received: from AS8PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:20b:312::12)
 by DB7PR08MB3611.eurprd08.prod.outlook.com (2603:10a6:10:4d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 12 Apr
 2021 16:54:10 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::2a) by AS8PR04CA0037.outlook.office365.com
 (2603:10a6:20b:312::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Mon, 12 Apr 2021 16:54:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 16:54:09 +0000
Received: ("Tessian outbound 81a4524e9a48:v90");
 Mon, 12 Apr 2021 16:54:08 +0000
Received: from 3727ca823a09.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 738E888B-9FCA-4503-B055-F17C3B8D47CF.1; 
 Mon, 12 Apr 2021 16:53:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3727ca823a09.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Apr 2021 16:53:50 +0000
Received: from DB7PR08MB3626.eurprd08.prod.outlook.com (2603:10a6:10:4a::16)
 by DB6PR0801MB1735.eurprd08.prod.outlook.com (2603:10a6:4:3a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 12 Apr
 2021 16:53:47 +0000
Received: from DB7PR08MB3626.eurprd08.prod.outlook.com
 ([fe80::a05a:b249:56a2:c570]) by DB7PR08MB3626.eurprd08.prod.outlook.com
 ([fe80::a05a:b249:56a2:c570%4]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 16:53:47 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0488.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1ab::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Mon, 12 Apr 2021 16:53:44 +0000
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
X-Inumbo-ID: 04c56907-8158-4c8d-9d64-994e6d4dbe30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AA+l5JWYZXhPIhjxLbqP7ehHiFNbyvvrQkkk+vM3Vc=;
 b=FcMvBgYiJiiF5ws7JtCQZ8RMJhs3kiNuOiFMDmfLfr+Ywo2PZ+x2JSf2YdzZxsEsRCdSXXBEtxcK1QyyIjIfohrNVGlWAGxxvKnzvAgU4RUjVOcTLbnAEHrLhe1228ImUr/vmbT31AUCIkHPn5WbSaJ7yDZFNuFDZMMho6HLOvw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b8339d7e286823a5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuqmFy4j1EBOj9+aAmuoxfKVxteWKN/W0/lVGIwxeUAa1OeqruS8XAYmoP0rFtI9IL4rlcX4+46TeZY8CE36n1tZTseECj/u6gpL66qX3/IQrovRmmUN9/vk9xIg5Ot+f6y5KxWEsIIM9Touoh9tn9Uk4HqwPDguG++b05BBvge7Rt9gYu0ZGzL5spfesvqCT23/Td6lSRS82LpDJiJLzfRjHTwzOvI/tkqNhBeWt8oLsXskYiQCPcgbxQCWyLoiEDrTVkBAIYSilti7xVPvZRaY8i2Z8sy3YYuVExSaxfX68Y4ExOL/4VaMXbdBbQpiBJYRL4YnKLQSxJmeqmrugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AA+l5JWYZXhPIhjxLbqP7ehHiFNbyvvrQkkk+vM3Vc=;
 b=G7jIKhtOavt1vZEpk4Lgo5s6vbFyybzwRt4hx82rFsuFIUI5vM3+SVJeEy3fwNWNJFsuwfFA6FGieV5PrjBeg3rRjGbwFbx0Hifu1Rp0vfX5KoWCQR1YkA1jN6w9QlIAlkQHWFZe7vWvHyQQSGrsPuzw+3JdTtFjaoOerEVck7l4G7KeoO8nG3EId6kxW6egwn0AD0CVV0fBjDsIRFOv/usycF5bRzK5MlKxd+TY9Nm+KcDHiFwtONJavwnGz/r5ka2XIUjyHQjBlYKAoCwkKvoVIH47yIW3m2p0Ia/K2ye9n8z7un/vP/BGZUq+9bkGf2nlngvDFs1X2DJXg8AIGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AA+l5JWYZXhPIhjxLbqP7ehHiFNbyvvrQkkk+vM3Vc=;
 b=FcMvBgYiJiiF5ws7JtCQZ8RMJhs3kiNuOiFMDmfLfr+Ywo2PZ+x2JSf2YdzZxsEsRCdSXXBEtxcK1QyyIjIfohrNVGlWAGxxvKnzvAgU4RUjVOcTLbnAEHrLhe1228ImUr/vmbT31AUCIkHPn5WbSaJ7yDZFNuFDZMMho6HLOvw=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v3 2/4] xen/arm: Handle cases when hardware_domain is NULL
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <240cccb2-cf37-d01f-8861-1a5e8c21409d@suse.com>
Date: Mon, 12 Apr 2021 17:53:38 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B150907C-2B8D-46F0-8F51-AB8E83D842BF@arm.com>
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-3-luca.fancellu@arm.com>
 <b1242714-e5f3-1e6b-f1bd-e9e53326fda7@suse.com>
 <9A775115-36A9-418F-B945-A778DE98672F@arm.com>
 <240cccb2-cf37-d01f-8861-1a5e8c21409d@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0488.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::7) To DB7PR08MB3626.eurprd08.prod.outlook.com
 (2603:10a6:10:4a::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a344919-377d-4793-add5-08d8fdd39781
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1735:|DB7PR08MB3611:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3611FC34A9B03A4F8C0A68E6E4709@DB7PR08MB3611.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OwTKVmfp7MbAcL9XCbgbnxbEX5LumVqEd3lKu8fFbn6O5MkGEmK43r/edupbWf/E89oxPMuKH/pWmuSt8SOjV3HUP0Ure4aj5NoTvhFHiKU0GCPK5xczNC+D1NdpWI/VdOYjsklUZ6prQvKIeSUbHFyAh6woJCOfEpc+I58xkIXwC67JgOZza+Zt3VjkJ/4ECXAi1ceEKW3JvyxuZ54/Dy9AX4lg9nlYXkAphmfzCdEg+zykIWYMXxxtsUp/GgFcA03XKpSeNNkWbbFP6tZ5pp+dLrJRCZorGCPkPLN60M4eO90MQ29Rf8Ezzp+8SILLL3s0bUSkw9lduedqG3c8cQ0dH4e2r7qPnkgBUBZ+kKQBqMbuObvlP3BpjkmIA++TLAeLsXXnqrxEnO9uAUHNZLB6JdckyM3wlqSwQbJbmOL7Qbj8gECK5qyny3UqDw7H0thQ6PkO5NMrKyyu5PSINXhoRbGNwFs1dG5wtpbuJECtB8EKHBEOall/rdRZGAZYx+9dDjU6Sk+rdrX6JTRp/YJjuXJwM31fQoqzxmH/kxUGTBMHNFGb/CCKVw52vWlV0bfkv2PDMG21w39lZjhEhatMppkgAzAHU7+QJ97BLYBHVt8zzkE3hC8cJIRH40YYBqVxG8j1FerEb+eD9gzOVwtmk7BFGZsIFpiZ1uwmk1rg9KGtpp90TArl5JD9HZUM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3626.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(66556008)(66946007)(86362001)(8936002)(66476007)(7696005)(44832011)(8676002)(38350700002)(6666004)(26005)(316002)(33656002)(956004)(6486002)(2906002)(36756003)(186003)(54906003)(478600001)(16526019)(4326008)(2616005)(52116002)(38100700002)(53546011)(5660300002)(6916009)(83380400001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?K1l0eFIvWE1XSC9EM1E0U01FRGx2RW54MlBUaVlpS294eTYwYmYyanIySHNa?=
 =?utf-8?B?a2tCLzhBMHJHTVVYeG1rNHB5UkxZbW9yRjhXQk5SWjdwcTRqWDNoSFRFcEh2?=
 =?utf-8?B?eGwwY1FXNW0rYmxwV1E0UFFhQ1hjZWsxQWRza1Yydmx1VnpzL0FibDJSN3lK?=
 =?utf-8?B?NisxbDg4eHM3allZK093QTRoL3BnR015bWgrVlBUbW9ncm93RnFGR213L3BS?=
 =?utf-8?B?U0xROFczQUVBWWNzT0dKWUFLNlV0NldRU1E3WVRLKzVwZVR2NUVHWFZYSkZq?=
 =?utf-8?B?azhLRHpkaGNUZTdyWW0vUXpBZFRhNEk2OS9qT0pCSXlnK1piUjFxMHFyMHBy?=
 =?utf-8?B?L1NKVzR2cFFhOVh1SjlucGdaSFhkaGFlbDRGTWZzTXYrekN4VVF4blowOGFu?=
 =?utf-8?B?cmJ5S25QTTRMcVNzek84Mi9oRzR0SlhnOUhRV1luTmZma0cwWCs5WFlqcEt5?=
 =?utf-8?B?eHhxditOOWpOdUFaaWNlcUlDUWtYUko0c1dKVXVOSVRtOGVHZXkyTWQrNVhU?=
 =?utf-8?B?ZEpzRWlldmprRis4N1dnbFV5RVB4Y1lxWUlyajZySmwxeFMwMjVuWklzTDJX?=
 =?utf-8?B?ZkxUYkx3SDFzQ0hseWFITTBuRU1DOGVVcGZQZmdldGpUekJxOHphZi9LaFQv?=
 =?utf-8?B?TkVMaGJLT21sbnR2R251dzh4cHg4dlVHVGJCN2xPdkRHMFBMOSsxSHhYZlZr?=
 =?utf-8?B?N3QwUUtXM1pEM09qK2JYZytrazd2d24rcElGK0RxY0ZGNEI3VUNPUnlGVlRr?=
 =?utf-8?B?QUdPMEN1c2ovanRFWUY1a3I4Q2dMOEEwYllBWE9FdWxvNExrOXhLdmM1OUk5?=
 =?utf-8?B?TnFERUZwbnFobXFJcEdMQkpLY0puZ0Y2ODZtbGFNZDA3NnA0a0kzR3BLZjNX?=
 =?utf-8?B?STlVYVRPU2VZcTAvMEtKTWJRRVhaMzZOazRWU0Z5dm10cFlXWTBCaFFwUFN5?=
 =?utf-8?B?bm9GMDZzRE41cXlPUUJxUVE3Z2lSNGs2UEJzdGk2K3dqREwvdW5jUFZPM1NL?=
 =?utf-8?B?anZZdmowSFJ5VjNLalluSm5DOUpxeStNcUN6bk1JdUQ3ZENWblRieHloQUlE?=
 =?utf-8?B?eFJYU3RZMGhIaW5zNUtESmVUU1o5UFJoTHhOb0JFUHJsUW4xbjExOCsrMUtB?=
 =?utf-8?B?RVdKQ2JWcEZiV0h3S2RidmM5emN3WmI3VWVPcWdGYkEvdXdxTjk1RTR2VkE0?=
 =?utf-8?B?VUFXQXZJWjJJQmk5QW1jT0cwNEQyL1dCZlNBUTNEdkRETEpMcTA3a0p5cUMw?=
 =?utf-8?B?UUcxZy9hWUduYkt2MWwwY3RodGtNdXZXbmhmSTlUZFZTQjFENmh5cjJrYXdh?=
 =?utf-8?B?Y3lndWUzMm0zblJxU2dpWThCL2RwbUtHMjVUTFVzMmx6Q01VdnIvOVFrcjBC?=
 =?utf-8?B?V05jUktGRi9xQ0NLUlpKUTdHR3htcDNNaUpSUlZ4c0FiZDVReUJHZU9PeldX?=
 =?utf-8?B?ZlJHbnByRS80RnVQME4wVnBhWkpCbDEyNFdHeTZPSEszbE5PRWdheU9ONE1q?=
 =?utf-8?B?bGZiemd1TExDS2xZaFBhQ1pialVXQjhnbGpCODBPUmdaSGhneERoV3lyVXR5?=
 =?utf-8?B?aWhFS0RNaUJFWnh1Rkc5TGV5M0l5blZPMGF4VW90ZURiKzc0cVFtVW0zSEN1?=
 =?utf-8?B?ZkliTGtiWFhqMEpQYWhvZmx1ekxwVXVCWnJOV09pUFhoMWdVNy8rMm1VckNO?=
 =?utf-8?B?QjFIdmJodExNd3R0ZjJaL3JHcUhOM2xkSThCUldqdzRGVlBLSTZFclRrYVFO?=
 =?utf-8?Q?nXJ0nE6CWddFE4sKjitIq97EeSGR8E5hewc/mwF?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1735
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a06a732c-a77f-487c-1a79-08d8fdd388ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VO5U1g0EkWAQ5PipBWCjxrcLmkoC+SOTZ2uS2+vpXEXfti4IRIyKhgqGKjxXqbI9xlAPm53od+91tflG0YRvZ/Bth374gxMyk4ETLsBH5qdK8GmqVGL8C3Fi+PvvR4rYJC6zGz3ipbJ7Nj/bu4u4c9QKvpZXAgSXoYorBpaP2wx2z+8nLARLm8mC2HjDluQOOBV+hzv/Y8oAl/ipu5D1t6hBXCnXDutSpEUSm7lxpMm6gdKrcUhP70v3Wenr3gYZaslSHvpKLAOT8jNy33m38MbOrSDJzFKluvaGhrQAIu/kMhlDAe+zwlrPBI1eKM5Z67w3KwrXiz/7415lqixiM4PRe1Jd34waqHtnPVbX0QJkp3k0hJRKP+bKk7Cz38GlHsATuCl0Oe6+vLbRaIIERcx8Zw6Y0ROM4+eVnK088nmd1ed09sM6ThFoqSDQgDUUKlp2s+SlRECn8iT3qoYuOkEHiZfkzkBKf5Ako0kqx+MR8MQaEMehD9ea+iVpZ8qvlnh+nPrhv7kcT1e2+XN2rEWgNWx+WhjeYwgR5chPdV88uX+M0GnRcFcf9VfVDZoxQ8N0Yj4gx3YQoRQG0SBIzGP6wecUwdapB3ygBmPKPb5nmyUie2qB71FaqECrMlFsuH4dhU7cKNokI0WvTkqyqxnMCFIBSWSDlq1asNW9veA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(36840700001)(46966006)(53546011)(478600001)(6486002)(8676002)(81166007)(7696005)(47076005)(33656002)(82740400003)(16526019)(336012)(316002)(86362001)(44832011)(956004)(26005)(54906003)(2906002)(4326008)(70586007)(70206006)(8936002)(36860700001)(356005)(6862004)(2616005)(36756003)(186003)(82310400003)(83380400001)(5660300002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 16:54:09.4131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a344919-377d-4793-add5-08d8fdd39781
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3611



> On 12 Apr 2021, at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 12.04.2021 15:58, Luca Fancellu wrote:
>>=20
>>=20
>>> On 12 Apr 2021, at 12:03, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 12.04.2021 12:52, Luca Fancellu wrote:
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -1022,6 +1022,9 @@ static always_inline bool is_hardware_domain(con=
st struct domain *d)
>>>>    if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>>>>        return false;
>>>>=20
>>>> +    if ( !d )
>>>> +        return false;
>>>> +
>>>>    return evaluate_nospec(d =3D=3D hardware_domain);
>>>> }
>>>=20
>>> On v2 I did say on the respective code that was here (and my
>>> suggestion of this alternative adjustment): "Can you point out
>>> code paths where d may actually be NULL, and where [...] would
>>> not behave as intended (i.e. where bad speculation would
>>> result)?"
>>>=20
>>> Since you've taken the suggestion as-is, and since the commit
>>> message says nothing in either direction here, did you actually
>>> verify that there's no abuse of speculation possible with this
>>> extra return path? And did you find any caller at all which may
>>> pass NULL into here?
>>=20
>> Hi Jan,
>>=20
>> I=E2=80=99ve analysed the code and seems that there are no path that cal=
ls=20
>> Is_hardware_domain() with a NULL domain, however I found this
>> function in xen/arch/arm/irq.c:
>>=20
>> bool irq_type_set_by_domain(const struct domain *d)
>> {
>>    return is_hardware_domain(d);
>> }
>>=20
>> That is calling directly is_hardware_domain and it is global.
>> It can be the case that a future code can call irq_type_set_by_domain
>> potentially with a null domain...
>=20
> I don't think that a function being global (or not) matters here. This
> might be different in an environment like Linux, where modules may
> also call functions, and where guarding against NULL might be desirable
> in certain cases.
>=20
>> I introduced a check for the domain for that reason, do you think that
>> maybe it=E2=80=99s better to put that check on the irq_type_set_by_domai=
n instead?
>=20
> If there's a specific reason to have a guard here, then it should be
> here, yes. As per above I would think though that if there's no
> present reason to check for NULL, such a check would best be omitted.
> We don't typically check internal function arguments like this, after
> all.

Thank you Jan, so as you pointed out, since there is no actual path to call
Is_hardware_domain() with a NULL pointer, then I will remove the check
from is_hardware_domain() in a v4 patch.

Cheers,
Luca

>=20
> Jan


