Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65223478E9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 13:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100990.192785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP31u-00017v-TE; Wed, 24 Mar 2021 12:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100990.192785; Wed, 24 Mar 2021 12:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP31u-00017W-Oe; Wed, 24 Mar 2021 12:54:34 +0000
Received: by outflank-mailman (input) for mailman id 100990;
 Wed, 24 Mar 2021 12:54:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bG9m=IW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lP31s-00017O-N6
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 12:54:32 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a22205c-1459-42b1-88c7-869de70bf78b;
 Wed, 24 Mar 2021 12:54:30 +0000 (UTC)
Received: from AM6PR10CA0097.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::38)
 by VI1PR0802MB2240.eurprd08.prod.outlook.com (2603:10a6:800:9d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 12:54:28 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::45) by AM6PR10CA0097.outlook.office365.com
 (2603:10a6:209:8c::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 24 Mar 2021 12:54:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 12:54:27 +0000
Received: ("Tessian outbound 2220e7a8bae2:v89");
 Wed, 24 Mar 2021 12:54:26 +0000
Received: from 9cee1872acd1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4ABC8996-727E-4071-9794-78F42A5EDDB6.1; 
 Wed, 24 Mar 2021 12:54:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cee1872acd1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Mar 2021 12:54:05 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5662.eurprd08.prod.outlook.com (2603:10a6:800:1a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 12:53:55 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 12:53:55 +0000
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
X-Inumbo-ID: 8a22205c-1459-42b1-88c7-869de70bf78b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NQcrkwC6CPrYtHLlPpCEUD/a5LH2ZnCrKQ5P7DKsNE=;
 b=rLlttQbQbcwjakVPmstk+A5ZQEdIv0LtbL2QlTuuOr621KcNe3xwZ63wcpbjxevTp0goDeLJHObGlT4vsxQ357jWfsxg23Bwq7hqIS2JJrL4FNkMqiJdpr/EWMxe9cJ73yUxH2Fq41zc9+yMRHJYo++mWnjXDybEqnswL8D5x0g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 02885b6c30510492
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpJDHF3cGgEaYt0E3E9OBHYWaTNFE/FWuGOFChYZZmQ4LQ3ZJj0vBF937m4Qh0e7dGXfUHQRDeAPh566+YSkefOf898ecnapF/wvCLrWauj620SrUHNfRGUaDSrk9hQQBpDuuaNwQhvEPGmNXgLiL26xqCa6kMSZ1prBOEJYnZeQrUamzFn0niLFkqlrar3Lh5Q5MD3SawNuzsc0inGvk5D4dzf7NTnP4kcHBdpQYt4ud07iHA8vsnS5KQpq8Jvq5joHxjwz23gU4V1w4fHkzpO00lJ4NFBeCvYWxEePKMdRtBKcjve+QgPTaE5Z56RgMtG4TucQDMXOKMzd4x32Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NQcrkwC6CPrYtHLlPpCEUD/a5LH2ZnCrKQ5P7DKsNE=;
 b=SAswN4RixzAK1Od/z/Zu5udtT1nxllP1zAcAwhIgaibnEs6JFa8EIklYgAINF7Uv3uH3WKuT1bHpqmR4V7Dr28tVls8aBVtvsf4xuPmTAz7jN4edhq21pjDKacOTxDFwu6h//n2W3ZmhWdEba8AYYJcTZHf2g3z2cFaGKJR5vEE4e4y5eKX5wNjvPWRKvwA9QAXYBX7g4o/CBAkltq1e4y3w0im3YhBGA4ZJUZstUt2XHEhIgifxzbqlVVxt//bqMx+C3eu2TkvU8G3RRqHB5e42BAaKPAbJJX2oN7tBAhx41bDlMuTlK2+6A02yhtAX2v8R2U4qONsWgPHLWlvsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NQcrkwC6CPrYtHLlPpCEUD/a5LH2ZnCrKQ5P7DKsNE=;
 b=rLlttQbQbcwjakVPmstk+A5ZQEdIv0LtbL2QlTuuOr621KcNe3xwZ63wcpbjxevTp0goDeLJHObGlT4vsxQ357jWfsxg23Bwq7hqIS2JJrL4FNkMqiJdpr/EWMxe9cJ73yUxH2Fq41zc9+yMRHJYo++mWnjXDybEqnswL8D5x0g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v8] arm: Add Kconfig entry to select CONFIG_DTB_FILE
Thread-Topic: [PATCH v8] arm: Add Kconfig entry to select CONFIG_DTB_FILE
Thread-Index: AQHXHvPNGm7G4VbcVEWYk4Cj6NIQRqqTG5YA
Date: Wed, 24 Mar 2021 12:53:55 +0000
Message-ID: <15558681-7F3E-4311-B346-DCE63C2A644E@arm.com>
References: <20210322081715.26175-1-michal.orzel@arm.com>
In-Reply-To: <20210322081715.26175-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ce4ac2f-24b0-4b24-1404-08d8eec3f546
x-ms-traffictypediagnostic: VE1PR08MB5662:|VI1PR0802MB2240:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2240A3A99CA3D4B65AC78E9E9D639@VI1PR0802MB2240.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EGDtzl49GFjNdYv1rrUj8tW8R72kJ0AJFzCK/oBmbDhIsKdLK4JglNDVd6W9zi3UmYg5y6oIS7+MOr26YIq+7KJOjrFd0sdLDLSV1wyLxYwjVFel4WD2QaMx+Qh5p/obHThAlt/T+FccJFBeRmzkzQ4tSXj1V9C8Ec0siGbY9mn9bYZBApC2drXaVykgdk25DNTU3GBMae2+gyRqHCxQWZza+hahMSLPs9xoLvyjvjMlqluJY75D8TsGQX8TW64PG0G+l+F6AquyKAG7AHbNca0KX2vpME7y0wsdFXVBw8zt+vb6whEod+o+JEi1JVyJ8ow2vDn6OkjbcCQAZd3I1x9irYIHyK49dbez11Z0n43nViP4OfV/I68t5RcD4NHjaHQIrlrfLmKTSGeZtOeuYaahulqpqla04zyE21lV/dT35OYXLlsI4iXdSC2KLWGHyaph9RciSifax6FltH0PPdTIGfYiDhujQ9UXb1ows+Vx7DcTuni7vHg+ZXsUIRrYghEXnR8i23v89bSk3CyITSvPX2CKUNVmcN3a2ahRHhGP8QwgWca1uywtggxpgZbCcoOFVv0S332+ywjggpB5P3t/Ca+cJzQlFqlP7gWcXeOwK6+Zc3kL8KaSCrVDRqCa+BUXJ8iUlRBHbSS4IjGmU/RGHZVNi4GX2ptq6Z5omgzmDpg+RNJ39gGrUXUJ38/X
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(6862004)(54906003)(66446008)(37006003)(53546011)(8936002)(8676002)(6506007)(26005)(186003)(6486002)(316002)(38100700001)(6636002)(66946007)(66556008)(66476007)(64756008)(55236004)(76116006)(5660300002)(6512007)(36756003)(33656002)(86362001)(2616005)(91956017)(83380400001)(71200400001)(478600001)(2906002)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?pAC/eWyZWFLIZG9LvRwvUym9Dcx5LtoY+YbR9LFsnXjuIVtWFVHmCr6i+J4f?=
 =?us-ascii?Q?b+ZwqWTr7priHFEGecZUgW8PYVCAkNLfI/tZk1U3yLqoWDoVCYq9VhyOKPQe?=
 =?us-ascii?Q?6MLVed6HdcNG4vcURswtVBEoM0lgpcDe717dvFz0n5UECrtrbHRGCs3svJsY?=
 =?us-ascii?Q?9AbbRVXVYs/K3eiMeVGjB0+Z8vSKy2G3hXpZgtMJmdFLxY1efNunb44eVJ/H?=
 =?us-ascii?Q?8YWUISHP2OgpvI2ItwoizfOZ90FNsD9STNRnUij36drhfxcfgJgP5IkDrWBy?=
 =?us-ascii?Q?+4bg7e16zOmQHqxDLWvLpqW52/bGVHHlSuwnTDJfYkXEYHyy4JtORRGk7mMB?=
 =?us-ascii?Q?rssEaQFGajISmpqSkl9KTS7VwUSabrUEls1QIU1p65MM0CqVCUuzuhpGpPls?=
 =?us-ascii?Q?dOXWplNp+ATD6Uek+7zuFng57mkWHqQV24DkwECDkTronI7QnpW4HAqAMIjA?=
 =?us-ascii?Q?LN2m6zTvG+UVpcwGE99dDnqho5l9UOdGj/WzsfNIinGa6QGNk0VJaGY1befw?=
 =?us-ascii?Q?2yu3msvVQyGxTAooyvnP7OjbH67BFQisSZNJjXm5vh3Cvq3oX2ZeKs5OChbg?=
 =?us-ascii?Q?lEvn27dZO0a0xFVYFkmliQ07kU6BObOTzG7n1OAzr59sXKjP2mU4PzRowxJn?=
 =?us-ascii?Q?cbKiZ3bMTZXPumOja4hkyinl4i3t8Cqv7/NFI4uAxMVRAwwb0Z1lnbP4eBsY?=
 =?us-ascii?Q?lYN9q11qEzuurtQNp1FQdGOr17U/jAA0lIGUcJQgU2Z7XUckop1rXjmXr097?=
 =?us-ascii?Q?6P0Q6ae0RvEePRCon6SEL1G5nOZXGBmAGtni5I9v1Gvoh864YVtEKeS2yz28?=
 =?us-ascii?Q?Nu2vjW1KNKYnzp/TCNX8vn+cmUIa5jXqp4CI1HSyoCecilTThvosVMVlk/Vh?=
 =?us-ascii?Q?0dVM8EpNWTZu+J6qklR7hav8cWeSw8UOWanOmUsqE48x9y+9FAdCdKwDs/U0?=
 =?us-ascii?Q?onJX5mIm4UvwA6W2j+2F8sTm4Q/ne+IdPUp61La0O/Sq/u7xXc9ERsJ83d+/?=
 =?us-ascii?Q?vm5LPtLWCmPZhJvtei47bIW2RJoBZb4pH12bh//Ig3x3C7AOQzD7uvxs3Qpt?=
 =?us-ascii?Q?5A18zCUJDu+PJrgy4TQai6eFzfLrcZ0gz9dBcKKZYlQlYYUPDCKwE76iy7QE?=
 =?us-ascii?Q?lzpqcnVfe7qapXVFsruq2glnreHgIx7Vtjc7U8ckFw70DVhee1nttr/IbQ98?=
 =?us-ascii?Q?L1UAJ2lLZKkIj24OyjbhiHkp06mkvidxiNEz2gsUeQcJJN3grzzP/JKO1BU3?=
 =?us-ascii?Q?XejvK2aabXnwzcZDnApGqMlbDTRHUnoT5hm/2VqYB43fF63I8rgINx2wQ1D/?=
 =?us-ascii?Q?pulMWCzCeLWTiOzZJ8OaASGh?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A5436395E6754444BD300A9FC1023CD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5662
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	196817d0-9e47-4c15-2fdb-08d8eec3e257
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BxYGHljjsPZnqeTp9zDkMfFbkLwuIxDhhIIY/QGfYhW82+8A9Ud9+sG8mOuNvaRyThyqAlvOugD+k30WuJi00YlkwlMbyaciNrnL+FndJXpp9dtnG+NmmgrO7sxra3dAVdnPUEuAfA7FVs2D3fsP6m0B+lQJubFcjFjsNm/ShTtA3ggAguP8OmgITu8Q2GGNRo2xK+eyxtZ6qM1KXY7eLs373yjrBKmLqSxg4OcLPoq0tCl3+05iUwLVKa5xiEEksyux0NhNmVNSH1yGAyGCPuD92cWtZARtsSEWvl0IMKdMU45DLNOmbepkBHYk+hF8Qo63VVczWI1R+a3aIiGcVFJPil7GOpL+ZKVuy6+VPs3awFPK1RW4j1CL8puuXlqY1u/wjC77sv7U+dIdyxGl3WKpAtn6NnHetZJGwyUyP4ZL6ET3O+lqAu9aG4/GmFQOs+5Ls8d71IOtUw6rHrsaw+9dcRgLi9KKR61wu65qKrnDx5ggufGI46V6thhk2ygOL0oXJM1PK3Uq/AGz06EXbCg22myQXigOJkeTBlnlTcePRUkn51cqsfuHhJTUQ0Baqs7No8J0lVo3MF+f3PcLV8qYc1p8uEJ9llb+T5rEhKRJh8DxzBf5WREii85527PXLIz5mzybSpK6rqBuO5e7wQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(36840700001)(8676002)(2616005)(8936002)(70586007)(33656002)(316002)(81166007)(83380400001)(54906003)(356005)(4326008)(36860700001)(37006003)(47076005)(70206006)(6862004)(82740400003)(36756003)(5660300002)(6506007)(82310400003)(55236004)(6512007)(6636002)(186003)(26005)(336012)(53546011)(86362001)(478600001)(6486002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:54:27.3405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce4ac2f-24b0-4b24-1404-08d8eec3f546
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2240

Hi Michal,

> On 22 Mar 2021, at 08:17, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Currently in order to link existing DTB into Xen image
> we need to either specify option CONFIG_DTB_FILE on the
> command line or manually add it into .config.
> Add Kconfig entry: CONFIG_DTB_FILE
> to be able to provide the path to DTB we want to embed
> into Xen image. If no path provided - the dtb will not
> be embedded.
>=20
> Remove the line: AFLAGS-y +=3D -DCONFIG_DTB_FILE=3D\"$(CONFIG_DTB_FILE)\"
> as it is not needed since Kconfig will define it in a header
> with all the other config options.
>=20
> Move definition of _sdtb into dtb.S to prevent defining it
> if there is no reference to it or if someone protects
> _sdtb with #ifdef rather than with .ifnes. If the latter,
> we will get a compiler error.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/Makefile     |  5 ++---
> xen/arch/arm/arm32/head.S |  4 ++--
> xen/arch/arm/arm64/head.S |  4 ++--
> xen/arch/arm/dtb.S        |  1 +
> xen/arch/arm/xen.lds.S    |  3 ---
> xen/common/Kconfig        | 10 ++++++++++
> 6 files changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 16e6523e2c..46e6a95fec 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -68,9 +68,8 @@ extra-y +=3D $(TARGET_SUBARCH)/head.o
>=20
> #obj-bin-y +=3D ....o
>=20
> -ifdef CONFIG_DTB_FILE
> +ifneq ($(CONFIG_DTB_FILE),"")
> obj-y +=3D dtb.o
> -AFLAGS-y +=3D -DCONFIG_DTB_FILE=3D\"$(CONFIG_DTB_FILE)\"
> endif
>=20
> ALL_OBJS :=3D $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
> @@ -137,7 +136,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
> xen.lds: xen.lds.S
> 	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>=20
> -dtb.o: $(CONFIG_DTB_FILE)
> +dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
>=20
> .PHONY: clean
> clean::
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index c404fa973e..50f019ed98 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -156,10 +156,10 @@ past_zImage:
>         sub   r10, r9, r0            /* r10 :=3D phys-offset */
>=20
>         /* Using the DTB in the .dtb section? */
> -#ifdef CONFIG_DTB_FILE
> +.ifnes CONFIG_DTB_FILE,""
>         ldr   r8, =3D_sdtb
>         add   r8, r10                /* r8 :=3D paddr(DTB) */
> -#endif
> +.endif
>=20
>         /* Initialize the UART if earlyprintk has been enabled. */
> #ifdef CONFIG_EARLY_PRINTK
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 5d44667bd8..f38a8dfca7 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -296,9 +296,9 @@ real_start_efi:
>         sub   x20, x19, x0           /* x20 :=3D phys-offset */
>=20
>         /* Using the DTB in the .dtb section? */
> -#ifdef CONFIG_DTB_FILE
> +.ifnes CONFIG_DTB_FILE,""
>         load_paddr x21, _sdtb
> -#endif
> +.endif
>=20
>         /* Initialize the UART if earlyprintk has been enabled. */
> #ifdef CONFIG_EARLY_PRINTK
> diff --git a/xen/arch/arm/dtb.S b/xen/arch/arm/dtb.S
> index c703aef12b..c39f3a095c 100644
> --- a/xen/arch/arm/dtb.S
> +++ b/xen/arch/arm/dtb.S
> @@ -1,2 +1,3 @@
>         .section .dtb,#alloc
> +        GLOBAL(_sdtb)
>         .incbin CONFIG_DTB_FILE
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 004b182acb..fc1d39a886 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -220,11 +220,8 @@ SECTIONS
>   } :text
>   _end =3D . ;
>=20
> -#ifdef CONFIG_DTB_FILE
>   /* Section for the device tree blob (if any). */
> -  _sdtb =3D .;
>   .dtb : { *(.dtb) } :text
> -#endif
>=20
>   /* Sections to be discarded */
>   /DISCARD/ : {
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index eb953d171e..a1755cd380 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -400,6 +400,16 @@ config DOM0_MEM
>=20
> 	  Leave empty if you are not sure what to specify.
>=20
> +config DTB_FILE
> +	string "Absolute path to device tree blob"
> +	depends on HAS_DEVICE_TREE
> +	help
> +	  When using a bootloader that has no device tree support or when there
> +	  is no bootloader at all, use this option to specify the absolute path
> +	  to a device tree that will be linked directly inside Xen binary.
> +
> +	  This is an optional config. Leave empty if not needed.
> +
> config TRACEBUFFER
> 	bool "Enable tracing infrastructure" if EXPERT
> 	default y
> --=20
> 2.29.0
>=20


