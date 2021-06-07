Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D839E2DC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 18:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138097.255728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqI4B-0008CO-1w; Mon, 07 Jun 2021 16:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138097.255728; Mon, 07 Jun 2021 16:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqI4A-00089h-UC; Mon, 07 Jun 2021 16:25:30 +0000
Received: by outflank-mailman (input) for mailman id 138097;
 Mon, 07 Jun 2021 16:25:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=32wv=LB=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lqI49-00089b-JO
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 16:25:29 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f007ef2-faf5-4807-bb42-97f35c593b91;
 Mon, 07 Jun 2021 16:25:27 +0000 (UTC)
Received: from AM5PR0602CA0004.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::14) by DB6PR0802MB2439.eurprd08.prod.outlook.com
 (2603:10a6:4:a0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Mon, 7 Jun
 2021 16:25:11 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::5e) by AM5PR0602CA0004.outlook.office365.com
 (2603:10a6:203:a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 16:25:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 16:25:10 +0000
Received: ("Tessian outbound f02dc08cb398:v93");
 Mon, 07 Jun 2021 16:25:10 +0000
Received: from 11fd2df6f8f8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1679FFA-C26A-44FB-960D-3CAD266C36CD.1; 
 Mon, 07 Jun 2021 16:24:46 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11fd2df6f8f8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 16:24:46 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 16:24:44 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7131:4f3f:625e:4b09]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7131:4f3f:625e:4b09%7]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 16:24:44 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LNXP123CA0005.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Mon, 7 Jun 2021 16:24:43 +0000
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
X-Inumbo-ID: 0f007ef2-faf5-4807-bb42-97f35c593b91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVELQqDgphU1RdD60IDap5BVEAlveswJ1hh4QFblv6Q=;
 b=mp/4983ucueSuErhL0Z5NaByPHrlJFyluWtZaK/jgSA6vDUwFh/YFh827jaFX9o0PvTow7cwD3oMqeHOnlIKIfe/klkZYtsyJnB9Dms3lLub1EsPAq3osWCRr+6j0LitxnkD7RvMloDbLJ5/smL+sh6Js0y2uYWMagJJ/xyLjzc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37e4d0fea065f90c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXcRJaprSa1vcfjOWX3VC2SMrNqZDWyAJt48CuhxyKDTW0WTrAfGs/vrVoWm0/8bbk3H0NvWORqVqAuXw5Gdx//+ORSspdTkK0pZfZSU0uFq5zr4LNuBduzqd131j+4OTPXpG66Pd/sucWvFFTE5eHlm4yq7eYHJx7YKQSFa13nNqpFHH1NKcsQTzGJHeVZPEataD/wiUopmBxeqSr0P3mKWwECzND5LSLeyizi19yq01QcnPONbGaKSKI3dX6fpJPIZiXnC9lgzwnRgPd6/ztinCXFnoLbwPkk08/82Pr6zmxaK0Lyh0cfclN3RQEgdEVLueixidtSoqSV6k0fOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVELQqDgphU1RdD60IDap5BVEAlveswJ1hh4QFblv6Q=;
 b=lhBU1dqJXv5HofwgoG8ZbREwXAqJ4fAp62hP5XdYkbUgvTuNEUShv3FqnK9VIbs4F0/yvjKKec3Hb9kCsE+qVD5oj7iL8YpOWoqOUNXFni42sV7K6obQqvN2Ao/isgSB8Ofh9YL4avMlQr+0vnPuhKZuEzYrM6BekO4qg8SWWw6JbaXH50AktmZ36Soi1HvW/qAVY6/H/FQmEQSVB6MT1PhhRbXvLqZJ3pX9rhm5AfiMNa+P+nBCsiInlkTTbD2EJufdHnu38nh+MdqCjUUi/tdk+rY+hZY76/3dqfvuHZpIn5g8MGm1TdWYIJRJdmZ/CGVyooK5/+0LGopqLWQPmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVELQqDgphU1RdD60IDap5BVEAlveswJ1hh4QFblv6Q=;
 b=mp/4983ucueSuErhL0Z5NaByPHrlJFyluWtZaK/jgSA6vDUwFh/YFh827jaFX9o0PvTow7cwD3oMqeHOnlIKIfe/klkZYtsyJnB9Dms3lLub1EsPAq3osWCRr+6j0LitxnkD7RvMloDbLJ5/smL+sh6Js0y2uYWMagJJ/xyLjzc=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v6 0/9] Use Doxygen and sphinx for html documentation
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210510084105.17108-1-luca.fancellu@arm.com>
Date: Mon, 7 Jun 2021 17:24:37 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7C830055-778A-4F1B-BCA2-6BDE40170BBA@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LNXP123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::17) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17115bbf-e062-4aee-06fc-08d929d0d273
X-MS-TrafficTypeDiagnostic: PAXPR08MB6766:|DB6PR0802MB2439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB24396A72FA863AF0D2C21FACE4389@DB6PR0802MB2439.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xoqRNDY6yYSGElcND1rHX2wnzB6uPec70/zHMKYRE0X+UuOdOoHoxrweA99Ntvez44i3yHDkNPgnP7OpUK1OGnIS3Vp2nnnV86FhMFWXaaCM8Cf4rbG9jwmaUVinIN/W1UyMGH3ddDxxJzyrEEgcWFTgQ7ozfbVmtEkGQd8R+PxlX2AnXMnn9tw1t6bZ3ZKkeCISK7LunyAbP3LjpowJN9HtPk5PmQw7w38IqNw//bBE3QAeCN4qa4h7zO14NVRkgYFTBal3McEQoEYsKqxzgww32YFQrUAevuzKuLxModLiUtK40wN53gkHll+G/TwJRY0KjjS7qGecASjcAFY7X0B8TXC0sPZerbCJ75xy1zDl0xjzuQEBBJlzJXFLrVEKhC18qnOkAsocYY0fOuI1PUmWRsI7WwL9l1aKHImxH13+CG002oob6wJjVMMCCCR6NH7AY999OSXBOs16QmZR2GwNx0e48sr8Z9b6nCpT5EAqsjp8c6ObT9qVLn1h42jUDvx0YPRjuBUIhcKSFrP0Man9kDWiL2709iFS3Bdjk5y+WHquZBGD4dHek5ZF7Bdo7mty3FheUrMgssh0kJc6jHBvbo+uaBP85V0n4J6zOnVS7PJ/7/tzjYTm/y4PvaCg8vmM0bDif3CQyEtLsIw42F8BPse1GtB6Cf2W062NksJGVBNJ97PUwhRIEDcPMFUI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(33656002)(6512007)(6486002)(2906002)(316002)(8936002)(6666004)(8676002)(86362001)(186003)(16526019)(478600001)(83380400001)(53546011)(6506007)(52116002)(38100700002)(38350700002)(36756003)(2616005)(956004)(26005)(66946007)(66556008)(66476007)(54906003)(44832011)(6916009)(4326008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?EXN4Tie9ii4cFy4e13Vout9iEVcScr1pfL2cIhj71/yIBOIqLh5uwBO9Fbux?=
 =?us-ascii?Q?ly1srcRmQHHEb45n6r5L/Fi/KXRBpVg1eqM9racRCTsssmcJr6QP9F3F9CNT?=
 =?us-ascii?Q?vVcpMczZ+JGkNh1XaROWE7J8ET87Nyd/2y9pIvfygnjK3RTmFhvbDPCMrlHT?=
 =?us-ascii?Q?/RBxYz2gDzhf/1k8vllbawGZTn4M5xHkLtjHcnRDk7kDKnUtBRANApq27oMn?=
 =?us-ascii?Q?g1E/Aw/A7nhZbkHOSgj15HEAFD3VYujWs2B7+qP1Axne9dHVqTL8Rw4LqFWd?=
 =?us-ascii?Q?l6KXFpUYEXIMlQ5DSHg7qfEA6fmsMcYzvetT52FSCKaYVhA9Y0lA3Lanw7Wy?=
 =?us-ascii?Q?fqHmPf8QRmVs5z6RjQr9Ocv60MPIZoTydGJeQhxDE+n0Fj/QjBdztzFN2a+a?=
 =?us-ascii?Q?bS+TR9XYtfwaIjlmkijhRKe0lLFJs/Msefg2ZL33sj6Jz5wj8kL709yoxhFQ?=
 =?us-ascii?Q?lHmghiTVi/4XgdiPZcO0MZcTYXVScKPbyrgms/qqkyYZ830kBdBjtE5rLwWi?=
 =?us-ascii?Q?AliOmVADpMOymgbdm4VZhfs1OHFIbbTQzvkt9qX3HrK3Ze+I/aNeMKFmVB2X?=
 =?us-ascii?Q?oK36sOJP6ykM8KzElwNBdFLfaAP5NOyKG1mY4oQG33VLSJXThUiGeIFn1hGO?=
 =?us-ascii?Q?Qx0bEiQ6CRsY8SnzclwSwGT2z4nK15iUvfRQGF42IH59pnGtuQxSaJrTnGCp?=
 =?us-ascii?Q?JcAzX0wQnHpE7Odw2vg+acUlvRJFJATn++g3bfmVOMfAxD4M8I4PVFtEtfds?=
 =?us-ascii?Q?0FPKZoUlx8azoJrQHlrr8K9A511t0y78b0dQ6KEcXEaXCnGH4cKjaWYcLTQO?=
 =?us-ascii?Q?zMaIKx0B0cisfg5++m0G+RPmvVh1BFTlWsYoL6HYiP7G/Tk31qlSg0WqmvSH?=
 =?us-ascii?Q?a0QzZC3fsKqL3esgR45hVjrr4lc4ji5fAnMLsKF0dlKiEkxYmorhj5bQwrGl?=
 =?us-ascii?Q?lsmv4/5IwSGHr4uDZOeOqy0Fnt8+I5s6USnYjZCUk0j0KczqLKbqbaiPFE4R?=
 =?us-ascii?Q?7CO/rSlI9c+i/uPB+VTWiiqVqcZFSDIbY3LsZ2GICgvDbyekqHjyY80Z9gRD?=
 =?us-ascii?Q?o/bUjmm2iGBEkex3aLcX0oY7EoCB8Ag2BrReShRzWYLl2rmkW8xD8jF3fG6A?=
 =?us-ascii?Q?xUPOfqDwew32j5ovmjkM4pom1BrqgsKktU66+E0FicT3O2ia+PCz/DjnQUIZ?=
 =?us-ascii?Q?NoSUUzrV/ylG1pKVVRiKgdUBRsnuQYgv5a2MV2hDCCTtHuvwqFrz1Arc0YgB?=
 =?us-ascii?Q?o9w4hF66Clmq96ctuKFj73JlKt3c626TeZVw8Fq9OE5Iq64zJJV+e4fGsWUT?=
 =?us-ascii?Q?3gcA+wm4CcIO4XozTgnDIhyq?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6766
Original-Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eaea3326-76d3-4f65-3c91-08d929d0c266
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fb4Gp7vCmtOI6HesvxtPyZnhqLx7B0Rhe4T/gJlFZ/3FDlDetKKJRBJuVU8LEm6GX45kfV41HDbAZbbo4Hr6WS1FJFvESd0brqVFjBKtsUgm1blNIreox6alr3lNBFjJk7q9/5tJ0uIq+XmxEUxi2IsSrEST0baXpOsyuu0gm6bdevZjmhVE/HNCgz4fyMAXgjLn56buXHn50IKkLfR0KI1CtMCpmLYwUus0LCUX4wZPMIWzzrtuL+B13O6rX30lOc7iNomjrO5k7eiSPkjZvszEPYQ7PmkBxAgoD3HQokqW9INtq0X9lQ3MxHbez9cgox08KDrgRkOyionjzOpxkMdKX+Ri/ZnLqMR+y6eXEgG0TCykmuiFRvHhGDJUQFCXeOc0zuIhgOdsSlQx+hlmqCZ7eAcB8Ykk9FnP3dA6FzxIhO6/VAJOLuZts4QgZ8v/38psmmFKQctZwr8qADTD4j8Y0sR7PXA49ic7KJBaoxjy1wbraR8fqtw32CeD13yk3yfek3oXUO6kw+WnSZGcqi4YA8yZultgCEJKsEkSnuc9m4UQjnD2HV+61u8aaRc/h7+CZFSd9wDgdGfyyJRiK7Gg032z/2V74dcraWwUDuzUGe30DK8z8Aau21LUnaWaCThr4fUMyWzul7Qx6m1sJg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966006)(36840700001)(44832011)(2616005)(6666004)(956004)(6486002)(478600001)(2906002)(86362001)(83380400001)(186003)(16526019)(26005)(6506007)(82740400003)(53546011)(33656002)(81166007)(336012)(36756003)(8936002)(82310400003)(8676002)(356005)(6512007)(5660300002)(6916009)(4326008)(70586007)(70206006)(47076005)(36860700001)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 16:25:10.9776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17115bbf-e062-4aee-06fc-08d929d0d273
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2439

Hello Xen community,

Can someone have a look on these patches? Some of them are acked but some o=
thers needs review.

Many thanks!

Cheers,
Luca

> On 10 May 2021, at 09:40, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> This serie introduce doxygen in the sphinx html docs generation.
> One benefit is to keep most of the documentation in the source
> files of xen so that it's more maintainable, on the other hand
> there are some limitation of doxygen that should be addressed
> modifying the current codebase (for example doxygen can't parse
> anonymous structure/union).
>=20
> To reproduce the documentation xen must be compiled because
> most of the headers are generated on compilation time from
> the makefiles.
>=20
> Here follows the steps to generate the sphinx html docs, some
> package may be required on your machine, everything is suggested
> by the autoconf script.
> Here I'm building the arm64 docs (the only introduced for now by
> this serie):
>=20
> ./configure
> make -C xen XEN_TARGET_ARCH=3D"arm64" CROSS_COMPILE=3D"aarch64-linux-gnu-=
" menuconfig
> make -C xen XEN_TARGET_ARCH=3D"arm64" CROSS_COMPILE=3D"aarch64-linux-gnu-=
"
> make -C docs XEN_TARGET_ARCH=3D"arm64" sphinx-html
>=20
> now in docs/sphinx/html/ we have the generated docs starting
> from the index.html page.
>=20
> Luca Fancellu (9):
>  docs: add doxygen configuration file
>  docs: add Xen png logo for the doxygen documentation
>  docs: add doxygen templates
>  m4/python: add function to docs_tool.m4 and new m4 module
>  docs: add checks to configure for sphinx and doxygen
>  docs: add doxygen preprocessor and related files
>  docs: Change Makefile and sphinx configuration for doxygen
>  docs: hypercalls sphinx skeleton for generated html
>  docs/doxygen: doxygen documentation for grant_table.h
>=20
> .gitignore                                    |    7 +
> config/Docs.mk.in                             |    2 +
> docs/Makefile                                 |   46 +-
> docs/conf.py                                  |   48 +-
> docs/configure                                |  258 ++
> docs/configure.ac                             |   15 +
> docs/hypercall-interfaces/arm32.rst           |   32 +
> docs/hypercall-interfaces/arm64.rst           |   33 +
> .../common/grant_tables.rst                   |    9 +
> docs/hypercall-interfaces/index.rst.in        |    7 +
> docs/hypercall-interfaces/x86_64.rst          |   32 +
> docs/index.rst                                |    8 +
> docs/xen-doxygen/customdoxygen.css            |   36 +
> docs/xen-doxygen/doxy-preprocessor.py         |  110 +
> docs/xen-doxygen/doxy_input.list              |    1 +
> docs/xen-doxygen/doxygen_include.h.in         |   32 +
> docs/xen-doxygen/footer.html                  |   21 +
> docs/xen-doxygen/header.html                  |   56 +
> docs/xen-doxygen/mainpage.md                  |    5 +
> docs/xen-doxygen/xen_project_logo_165x67.png  |  Bin 0 -> 18223 bytes
> docs/xen.doxyfile.in                          | 2316 +++++++++++++++++
> m4/ax_python_module.m4                        |   56 +
> m4/docs_tool.m4                               |    9 +
> xen/include/public/grant_table.h              |  387 +--
> 24 files changed, 3367 insertions(+), 159 deletions(-)
> create mode 100644 docs/hypercall-interfaces/arm32.rst
> create mode 100644 docs/hypercall-interfaces/arm64.rst
> create mode 100644 docs/hypercall-interfaces/common/grant_tables.rst
> create mode 100644 docs/hypercall-interfaces/index.rst.in
> create mode 100644 docs/hypercall-interfaces/x86_64.rst
> create mode 100644 docs/xen-doxygen/customdoxygen.css
> create mode 100755 docs/xen-doxygen/doxy-preprocessor.py
> create mode 100644 docs/xen-doxygen/doxy_input.list
> create mode 100644 docs/xen-doxygen/doxygen_include.h.in
> create mode 100644 docs/xen-doxygen/footer.html
> create mode 100644 docs/xen-doxygen/header.html
> create mode 100644 docs/xen-doxygen/mainpage.md
> create mode 100644 docs/xen-doxygen/xen_project_logo_165x67.png
> create mode 100644 docs/xen.doxyfile.in
> create mode 100644 m4/ax_python_module.m4
>=20
> --=20
> 2.17.1
>=20
>=20


