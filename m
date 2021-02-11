Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A3318F5A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 17:05:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83978.157318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAET9-00053g-Sf; Thu, 11 Feb 2021 16:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83978.157318; Thu, 11 Feb 2021 16:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAET9-00053J-P7; Thu, 11 Feb 2021 16:05:27 +0000
Received: by outflank-mailman (input) for mailman id 83978;
 Thu, 11 Feb 2021 16:05:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygeM=HN=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lAET7-00053E-9M
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 16:05:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::628])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b98b296f-58f7-4d78-bed0-77c64212676d;
 Thu, 11 Feb 2021 16:05:22 +0000 (UTC)
Received: from AM5PR0201CA0002.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::12) by VI1PR08MB5360.eurprd08.prod.outlook.com
 (2603:10a6:803:132::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 11 Feb
 2021 16:05:19 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::59) by AM5PR0201CA0002.outlook.office365.com
 (2603:10a6:203:3d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend
 Transport; Thu, 11 Feb 2021 16:05:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 16:05:18 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Thu, 11 Feb 2021 16:05:17 +0000
Received: from 57ded33c6e34.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6675330-DB1B-45B7-BDB5-60754596E4BE.1; 
 Thu, 11 Feb 2021 16:05:06 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57ded33c6e34.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Feb 2021 16:05:06 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3081.eurprd08.prod.outlook.com (2603:10a6:5:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 11 Feb
 2021 16:05:02 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 16:05:02 +0000
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
X-Inumbo-ID: b98b296f-58f7-4d78-bed0-77c64212676d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUM9B7FHmZa4CYsKFSzOmpSDQazT5R9dgCoCh2poy7c=;
 b=Iin1v89M/APodQSc/SpEymPadrkyYkac1VqhyRHrHhXJb3XFXTrcf7r99bWw1b/GB/OYiM59kZzHjo9fsPDbxN+C1IAUO7zOXZ4uVyfGgFbozyJ3sNaoQ5iwQP79gba8Sdpk+L54Aj+p0fpevgumTfsvrjiRmKbw4hfbd9Cog6Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d2d24650d570cb4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKqUZu/4xQn0Qoy/37XgFvnkIoBV+RJ5mhj2KMqX3iiydtxnZiAesPlEzNhmymT7im5BNtrXlQwyM8HQu+DA4G9ugrpUq4nRh4Ri0bQabZacpm3kUKqdoUeMzl0g4xFQN3j4K7NtNp8bKF2hjhZi8vQdQmq7VPRz3GZrF6eQthIKhFQJFgkuaNb6bZl/+VwvaL4TJZQ96iFpMpLSAhzzji7U4px0du2bnjWb8uaBNGcK9RR1uer0WoxPuoq4omBlo4C4r5bpX2G7b59SdmfaGDQPZeWn/YBW/cH3hQJ9g2B2lTTHliQNKojgDlzd8UQeBvfu8TcTYy9tdVXH8Ju+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUM9B7FHmZa4CYsKFSzOmpSDQazT5R9dgCoCh2poy7c=;
 b=eVkJxy80M0/sl+KJom7Hn8YDpaMQWjC8Q9kJNbgsdN/nyFGfmwCy8CJD6fzwkY5B14n7LtFJUv2syOvxkUOj68Px+1r6b1zhV/J8AQ0uv4dkvau6bgRHwD7CsPgT6uN5Ri0LLtChsPNSbBTF1DkiKxL7kOI+lG0QVfcMfWJvSeRJWlEt+0578OCSYoY+Wx1sI67NFdQzHYCF1JEStZ+8L5p3E609Pp37I9+DaO1YgISAq/svBmJwnmav448qSMydRXTrqAE7BIGiIm62pNsCc/9pVJirHyQP5CXmZCE9yBUlvVh7mWQuZwNjBJt+MuuuyumNskJ4ZLbOfiYgkxjYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUM9B7FHmZa4CYsKFSzOmpSDQazT5R9dgCoCh2poy7c=;
 b=Iin1v89M/APodQSc/SpEymPadrkyYkac1VqhyRHrHhXJb3XFXTrcf7r99bWw1b/GB/OYiM59kZzHjo9fsPDbxN+C1IAUO7zOXZ4uVyfGgFbozyJ3sNaoQ5iwQP79gba8Sdpk+L54Aj+p0fpevgumTfsvrjiRmKbw4hfbd9Cog6Q=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index:
 AQHW/ks46k4kUfhzpk6LTniK0S/PbqpPzhoAgAB7ugCAATYRAIAAKYkAgAAJgACAABz0AIABJMKAgAAJKICAACTqAA==
Date: Thu, 11 Feb 2021 16:05:00 +0000
Message-ID: <DC7F1705-54B3-4543-8222-E7BCF1A501F7@arm.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
 <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
 <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
 <4e4f7d25-6f5f-1016-b1c9-7aa902d637b8@xen.org>
 <ECC82E19-3504-4E0E-B3EA-D0E46DD842C6@arm.com>
 <c573b3a0-186d-626e-6670-f8fc28285e3d@xen.org>
 <BFC5858A-3631-48E1-AB87-40EECF95FA66@arm.com>
 <489c1b89-67f0-5d47-d527-3ea580b7cc43@xen.org>
In-Reply-To: <489c1b89-67f0-5d47-d527-3ea580b7cc43@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d5817d7-a936-4ffc-35d1-08d8cea6d3c2
x-ms-traffictypediagnostic: DB7PR08MB3081:|VI1PR08MB5360:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5360A3EC416DD0EB0AC3522EFC8C9@VI1PR08MB5360.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZXD6spk8Qhoe5X/GWgOKL0JYJauu2IjbXpMDCwXwJWdw2CrelziPpln2oAMt/Nm1iyqfFGDIkxVCcdahvrgpLn4Z47kqyz2DD6xrXZPS/FoHb8nK9+WrqUbcrfUonQVPmwxjfJcklQb9WVp0MGWQ+n8ZlswteD2u0YQKXa8QJm6sPxaCZNcvoM4TkYqt608zgVKQ9ckXAKc/stRXHcvgbdmeMzCxboQCcs9IAjkkQg92BPs6SYX7S9HAlnA4VuD9FI/g2zkcalGdfGQ+P5Y4aYf9wt2+TJi1qOJ3tBVmTKAzSxAI4CQdPvc68ebZj4kiDRPVAqrHNXVwmdOfwkyUz2BIqzB+R6qLTvj+Ml3du3A0GpRhL0jZ+voUoChWOcO71La9fSSrR8qT8/cWsoRl/3YtxS2+AZe+8RfQfqlWq6AxHVq/wXHr7GrmMDJ5t2rh/yyYrnW2CwbAIEaHpcSYWJoF136T9YwFU425eBhxTLuAQxtEWOi09YS4s7mHn7eUmoUnAa6KY+vsiJzSjfpAquT2E+SxGPViUBXVCj5xjd5diemmX0gZJ/HS1LzIaDKv2C1UYOHOeQ3qEmbIufv2F6PElGKxHNSsnFrWtzN44dMzTvelIO0cE8zSEYf76KSmP/b1XiZkf4HDRq2haxeIDvPgrNEsZxbtpdLfMDImFZM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39830400003)(376002)(346002)(396003)(2616005)(6486002)(5660300002)(83380400001)(91956017)(66476007)(66946007)(76116006)(86362001)(66446008)(66556008)(966005)(64756008)(508600001)(2906002)(6916009)(4326008)(8676002)(6512007)(33656002)(71200400001)(36756003)(8936002)(186003)(26005)(53546011)(6506007)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?UEp3ajdnU1V4N2lWa2cxeXNxS2FCWDA2RFhGZk5HMG5lRHdYZGhJYTlkU3c5?=
 =?utf-8?B?d1huL0JDL1AvRnM5NmxjazR2MUpPdG9UNHRObWhHZjMrMm9sSmdYUDRIM1N5?=
 =?utf-8?B?bERRdjdjU3lBc21Ecndlamp1SHprcUFwT2hGR1Y3eGRvenk1THhpU1p5SkFk?=
 =?utf-8?B?b21vUDhpVkNIalErZElNMGc0QVFpSzZnQ3JMNGNrbTFrU3RKOFZ6a2k0bWQw?=
 =?utf-8?B?UXlmZXFQRkxmd2NrY002SHZCdFE2T0FSd2ZDdTFqY0NuWENmWTFGa1JuR0lU?=
 =?utf-8?B?UXFoSVBLNmZiWG5kVk1qam5rVW9kaXJFbEVPMnJNM0ZUcWUycTFHZ3ZNc1VZ?=
 =?utf-8?B?Nk9CdWYrL2R6NkZGb2ZIcnZtKzdMRExTV20rL1JKREVxVG9jVnVOVWhrNkoz?=
 =?utf-8?B?ZlN2QUdIWElmZ1VFcUIreENjVTRZaFVtRXZJdTk4Y3ZZeXBUb243bS9PRk1N?=
 =?utf-8?B?a1I1SUREdjZWUitMeWU3ZUFVUHpYVnFQeHF1clZjQjFkOHp0ZGxOcXJmMGJJ?=
 =?utf-8?B?cFdyd3huZ244MjFFVm4wZElTR0pKNDBiN0xKT0tsem90RHJrUVN3WUlIZjVw?=
 =?utf-8?B?SkxJdUh3VW9RWkI1ai9GODNBV3hGeG5hTnZabE1CaTQ5TmpGZ1VOZVlNQmdw?=
 =?utf-8?B?ODB3dDk5Y1kwV1dlTDRGVGRRZ2UzTWZ0QWV2SEhmYU9CeHVhVG8xSmdjSGpM?=
 =?utf-8?B?TzBiMVFhMjI0d1R5NnZ3cUtKQ3VwL3lCSGxpdmdXZXVUR2FWQVBYTnFXRUIw?=
 =?utf-8?B?ZVdJOTNSbnAwRGdRd3NRN3lHck5DSTBjYWJLR0JadlVQTHZHOHFQeHFlb2xO?=
 =?utf-8?B?bDBLRWZsUG50Z2J2aHhBelZ6c2ZvTzhmUjY2aXBmaHlsOUhobmRnenRGam5G?=
 =?utf-8?B?Y204UzN5bHJPWWZTMmJnYWZVZTFNWStFdkExRmdIVEdieUdEVFVKWFM5Ymsw?=
 =?utf-8?B?TWlURTBjQW9IQXdjU0lEZjRReVVzRFlsZVRCZHh5UE9FWG5iTHByVmpFS2pl?=
 =?utf-8?B?NzRDcGt4cUNseE9oYjlHVzVqNGh0Szh0aXM3QXFqcEVQdm9WNkZ1cDJQQ21X?=
 =?utf-8?B?V1VNWUt1QkR6YXQrMUQzTnJRZWRuM2E4QWw1Qk11TDdPYTZQTHZHeHQ3RzA2?=
 =?utf-8?B?bjVDRUQ0RXgreHZGRlVqL3AzellVdXZ1dmwzaXlZRXpINW1salpVOElUekYv?=
 =?utf-8?B?akRyYUg1N1ErT3ZmU1R4MHBac2Y3RTUwTFBJNTNVUFV6UjB3N1lIMW0vcWdu?=
 =?utf-8?B?dWJ5ZGpVSVoyL0pFUjBMVCtXV3pCRHJ1RDhxTFBnQlB3UTc1T2RONmJtQVZR?=
 =?utf-8?B?RUFXUnFXelRYdk5OM3ovZDc0NmxjWUJ3WDdZaVRPUGdSTExNSGxSbEtDdTNY?=
 =?utf-8?B?MGVRbDZwVElpcTFtTUhGMmVPY0xTRXdiM3NMVVBROFRIK0VpdGlCVjBOQkpn?=
 =?utf-8?B?cXo1ckcrNS92VUpPZkF2QjFOMjAzbGhTYk0zZHJnUkFZVnEvTlR2Z1p2VWtn?=
 =?utf-8?B?c2hobSsxRnMwMVlBL1p2YjY5ZHI0NHVYak5lSmFxUWlJLzNDVHQxS1pNUUdt?=
 =?utf-8?B?aFBOMzZTL0YraFN6OFppTnZsQWtaRTRtQ0pqeEFWZk0rZXZLRHRHc1NtaVMy?=
 =?utf-8?B?bCtDbFQydm5TcGdwTEh5RkxQQVRNemxNY2gzYVQ4ME9La1VselQ1UkFnMUsv?=
 =?utf-8?B?RHhqNUdUMVNWa1lPZXRNYWVoOTB4K2RWUWExcElNU29nbjFNUWhZWTQ4NWMw?=
 =?utf-8?Q?TaVscb7rX4TTeyDVe5lUXVBxN2SdO4WoD+VJYqd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED3F552400FB73469284D781206D3F5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3081
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ecaa4b6-7c92-4ae7-b816-08d8cea6ca30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	byyxXGhQqhJRxmO64broU+gB7d2PDur5lFhwVdDEAltizP+OFUoao+sOiyHo1HLAdPGz6I+DMgJbsAyp3dp5BRyQpTKPiEtPzW4h3Xe3WSBNo7k0kZtYxwPQAb9TN9GL+T+kl8h2eCErrL9tHxeNoqZWYxVL1jdUzHfp3PlyH5jrHq+5rs491AO/sQ5QxyUxgIHq4InP8Ez8XllF1Q3wr2jYg5xIF93/QWd44m8+HPZOW5mpQOymocBmPx9k7z9x/t8jEVKDcqW20KurefpCl+R9xfB5FaMF4s/ULniopD+yCP5/hBhOFuli2wmieJwepca8EPyiedgnM75VqKKxM/qfH9T2Fi3KMx2p93viqXoTcW3ANVI/CwURKQP3y6L4VmMwRZml94HnE0gcFT0G1c4nMDqP4bV6dIqeEJYEGrSKELrFcExIeWFvZo75ZuGDwzChvdzyYwp5J5mfqxVu3F42/FIxqdECnImP6RuJ3X4GT/Vmdg6zo8HDdqNeUNJE0b1zZXeFbQAUBNaunpMCDTYNQQv0olRKuXer5Im9NErFH7BgpRI5V0BxvBBaaQJ2eHxTBIWTmE4ZACKQvRBqZXYRf/zSSKMV5S3HsW2ZaXtB/mJe1T66do8IV4GH9FdWdB81r8+6i/oLFIkSMKQitLZKmQ1AaDNMghDkJJyxryWWcSm3fElfcPJRjgWRcqeCu5rIO06ra+ChSFw8euGz7XZuk0QPuc6ioFyWWGjT1yk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(36840700001)(46966006)(5660300002)(2616005)(6512007)(2906002)(82310400003)(33656002)(107886003)(6486002)(54906003)(966005)(336012)(478600001)(36860700001)(36756003)(8936002)(6862004)(356005)(4326008)(47076005)(8676002)(53546011)(316002)(86362001)(70586007)(70206006)(186003)(81166007)(6506007)(83380400001)(82740400003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 16:05:18.4748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5817d7-a936-4ffc-35d1-08d8cea6d3c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDExIEZlYiAyMDIxLCBhdCAxOjUyIHBtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTEvMDIvMjAyMSAx
MzoyMCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIZWxsbyBKdWxpZW4sDQo+IA0KPiBIaSBSYWh1
bCwNCj4gDQo+Pj4gT24gMTAgRmViIDIwMjEsIGF0IDc6NTIgcG0sIEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDEwLzAyLzIwMjEg
MTg6MDgsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+PiBIZWxsbyBKdWxpZW4sDQo+Pj4+PiBPbiAx
MCBGZWIgMjAyMSwgYXQgNTozNCBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3Jv
dGU6DQo+Pj4+PiANCj4+Pj4+IEhpLA0KPj4+Pj4gDQo+Pj4+PiBPbiAxMC8wMi8yMDIxIDE1OjA2
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4gT24gOSBGZWIgMjAyMSwgYXQgODozNiBwbSwg
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IE9uIFR1ZSwgOSBGZWIgMjAyMSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+
Pj4+Pj4gT24gOCBGZWIgMjAyMSwgYXQgNjo0OSBwbSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBDb21taXQg
OTFkNGVjYTdhZGQgYnJva2UgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyBvbiBBUk0uDQo+Pj4+
Pj4+Pj4gVGhlIG9mZmVuZGluZyBjaHVuayBpczoNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiAjZGVm
aW5lIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcoZCkgICAgICAgICAgICAgICAgICAgIFwNCj4+
Pj4+Pj4+PiAtICAgIChpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSAmJiBuZWVkX2lvbW11KGQp
KQ0KPj4+Pj4+Pj4+ICsgICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICYmIG5lZWRfaW9t
bXVfcHRfc3luYyhkKSkNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBPbiBBUk0gd2UgbmVlZCBnbnR0
YWJfbmVlZF9pb21tdV9tYXBwaW5nIHRvIGJlIHRydWUgZm9yIGRvbTAgd2hlbiBpdCBpcw0KPj4+
Pj4+Pj4+IGRpcmVjdGx5IG1hcHBlZCBhbmQgSU9NTVUgaXMgZW5hYmxlZCBmb3IgdGhlIGRvbWFp
biwgbGlrZSB0aGUgb2xkIGNoZWNrDQo+Pj4+Pj4+Pj4gZGlkLCBidXQgdGhlIG5ldyBjaGVjayBp
cyBhbHdheXMgZmFsc2UuDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gSW4gZmFjdCwgbmVlZF9pb21t
dV9wdF9zeW5jIGlzIGRlZmluZWQgYXMgZG9tX2lvbW11KGQpLT5uZWVkX3N5bmMgYW5kDQo+Pj4+
Pj4+Pj4gbmVlZF9zeW5jIGlzIHNldCBhczoNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiAgIGlmICgg
IWlzX2hhcmR3YXJlX2RvbWFpbihkKSB8fCBpb21tdV9od2RvbV9zdHJpY3QgKQ0KPj4+Pj4+Pj4+
ICAgICAgIGhkLT5uZWVkX3N5bmMgPSAhaW9tbXVfdXNlX2hhcF9wdChkKTsNCj4+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+PiBpb21tdV91c2VfaGFwX3B0KGQpIG1lYW5zIHRoYXQgdGhlIHBhZ2UtdGFibGUg
dXNlZCBieSB0aGUgSU9NTVUgaXMgdGhlDQo+Pj4+Pj4+Pj4gUDJNLiBJdCBpcyB0cnVlIG9uIEFS
TS4gbmVlZF9zeW5jIG1lYW5zIHRoYXQgeW91IGhhdmUgYSBzZXBhcmF0ZSBJT01NVQ0KPj4+Pj4+
Pj4+IHBhZ2UtdGFibGUgYW5kIGl0IG5lZWRzIHRvIGJlIHVwZGF0ZWQgZm9yIGV2ZXJ5IGNoYW5n
ZS4gbmVlZF9zeW5jIGlzIHNldA0KPj4+Pj4+Pj4+IHRvIGZhbHNlIG9uIEFSTS4gSGVuY2UsIGdu
dHRhYl9uZWVkX2lvbW11X21hcHBpbmcoZCkgaXMgZmFsc2UgdG9vLA0KPj4+Pj4+Pj4+IHdoaWNo
IGlzIHdyb25nLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IEFzIGEgY29uc2VxdWVuY2UsIHdoZW4g
dXNpbmcgUFYgbmV0d29yayBmcm9tIGEgZG9tVSBvbiBhIHN5c3RlbSB3aGVyZQ0KPj4+Pj4+Pj4+
IElPTU1VIGlzIG9uIGZyb20gRG9tMCwgSSBnZXQ6DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gKFhF
Tikgc21tdTogL3NtbXVAZmQ4MDAwMDA6IFVuaGFuZGxlZCBjb250ZXh0IGZhdWx0OiBmc3I9MHg0
MDIsIGlvdmE9MHg4NDI0Y2IxNDgsIGZzeW5yPTB4YjAwMDEsIGNiPTANCj4+Pj4+Pj4+PiBbICAg
NjguMjkwMzA3XSBtYWNiIGZmMGUwMDAwLmV0aGVybmV0IGV0aDA6IERNQSBidXMgZXJyb3I6IEhS
RVNQIG5vdCBPSw0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IFRoZSBmaXggaXMgdG8gZ28gYmFjayB0
byBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIG9mIHRoZSBvbGQNCj4+Pj4+Pj4+PiBpbXBsZW1l
bnRhdGlvbiBvZiBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5p
QHhpbGlueC5jb20+DQo+Pj4+Pj4+Pj4gRml4ZXM6IDkxZDRlY2E3YWRkDQo+Pj4+Pj4+Pj4gQmFj
a3BvcnQ6IDQuMTIrDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4gR2l2ZW4gdGhlIHNldmVyaXR5IG9mIHRoZSBidWcsIEkgd291bGQgbGlrZSB0byByZXF1
ZXN0IHRoaXMgcGF0Y2ggdG8gYmUNCj4+Pj4+Pj4+PiBiYWNrcG9ydGVkIHRvIDQuMTIgdG9vLCBl
dmVuIGlmIDQuMTIgaXMgc2VjdXJpdHktZml4ZXMgb25seSBzaW5jZSBPY3QNCj4+Pj4+Pj4+PiAy
MDIwLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IEZvciB0aGUgNC4xMiBiYWNrcG9ydCwgd2UgY2Fu
IHVzZSBpb21tdV9lbmFibGVkKCkgaW5zdGVhZCBvZg0KPj4+Pj4+Pj4+IGlzX2lvbW11X2VuYWJs
ZWQoKSBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2YgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZy4N
Cj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBDaGFuZ2VzIGluIHYyOg0KPj4+Pj4+Pj4+IC0gaW1wcm92
ZSBjb21taXQgbWVzc2FnZQ0KPj4+Pj4+Pj4+IC0gYWRkIGlzX2lvbW11X2VuYWJsZWQoZCkgdG8g
dGhlIGNoZWNrDQo+Pj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+Pj4geGVuL2luY2x1ZGUvYXNtLWFybS9n
cmFudF90YWJsZS5oIHwgMiArLQ0KPj4+Pj4+Pj4+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2dy
YW50X3RhYmxlLmgNCj4+Pj4+Pj4+PiBpbmRleCA2ZjU4NWIxNTM4Li4wY2U3N2Y5YTFjIDEwMDY0
NA0KPj4+Pj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaA0KPj4+
Pj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaA0KPj4+Pj4+Pj4+
IEBAIC04OSw3ICs4OSw3IEBAIGludCByZXBsYWNlX2dyYW50X2hvc3RfbWFwcGluZyh1bnNpZ25l
ZCBsb25nIGdwYWRkciwgbWZuX3QgbWZuLA0KPj4+Pj4+Pj4+ICAgICgoKGkpID49IG5yX3N0YXR1
c19mcmFtZXModCkpID8gSU5WQUxJRF9HRk4gOiAodCktPmFyY2guc3RhdHVzX2dmbltpXSkNCj4+
Pj4+Pj4+PiANCj4+Pj4+Pj4+PiAjZGVmaW5lIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcoZCkg
ICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4+Pj4+PiAtICAgIChpc19kb21haW5fZGlyZWN0X21h
cHBlZChkKSAmJiBuZWVkX2lvbW11X3B0X3N5bmMoZCkpDQo+Pj4+Pj4+Pj4gKyAgICAoaXNfZG9t
YWluX2RpcmVjdF9tYXBwZWQoZCkgJiYgaXNfaW9tbXVfZW5hYmxlZChkKSkNCj4+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+PiAjZW5kaWYgLyogX19BU01fR1JBTlRfVEFCTEVfSF9fICovDQo+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+IEkgdGVzdGVkIHRoZSBwYXRjaCBhbmQgd2hpbGUgY3JlYXRpbmcgdGhlIGd1ZXN0
IEkgb2JzZXJ2ZWQgdGhlIGJlbG93IHdhcm5pbmcgZnJvbSBMaW51eCBmb3IgYmxvY2sgZGV2aWNl
Lg0KPj4+Pj4+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjQuMy9zb3VyY2Uv
ZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyNMMjU4DQo+Pj4+Pj4+IA0KPj4+Pj4+
PiBTbyB5b3UgYXJlIGNyZWF0aW5nIGEgZ3Vlc3Qgd2l0aCAieGwgY3JlYXRlIiBpbiBkb20wIGFu
ZCB5b3Ugc2VlIHRoZQ0KPj4+Pj4+PiB3YXJuaW5ncyBiZWxvdyBwcmludGVkIGJ5IHRoZSBEb20w
IGtlcm5lbD8gSSBpbWFnaW5lIHRoZSBkb21VIGhhcyBhDQo+Pj4+Pj4+IHZpcnR1YWwgImRpc2si
IG9mIHNvbWUgc29ydC4NCj4+Pj4+PiBZZXMgeW91IGFyZSByaWdodCBJIGFtIHRyeWluZyB0byBj
cmVhdGUgdGhlIGd1ZXN0IHdpdGggInhsIGNyZWF0ZeKAnSBhbmQgYmVmb3JlIHRoYXQsIEkgY3Jl
YXRlZCB0aGUgbG9naWNhbCB2b2x1bWUgYW5kIHRyeWluZyB0byBhdHRhY2ggdGhlIGxvZ2ljYWwg
dm9sdW1lDQo+Pj4+Pj4gYmxvY2sgdG8gdGhlIGRvbWFpbiB3aXRoIOKAnHhsIGJsb2NrLWF0dGFj
aOKAnS4gSSBvYnNlcnZlZCB0aGlzIGVycm9yIHdpdGggdGhlICJ4bCBibG9jay1hdHRhY2jigJ0g
Y29tbWFuZC4NCj4+Pj4+PiBUaGlzIGlzc3VlIG9jY3VycyBhZnRlciBhcHBseWluZyB0aGlzIHBh
dGNoIGFzIHdoYXQgSSBvYnNlcnZlZCB0aGlzIHBhdGNoIGludHJvZHVjZSB0aGUgY2FsbHMgdG8g
aW9tbXVfbGVnYWN5X3ssIHVufW1hcCgpIHRvIG1hcCB0aGUgZ3JhbnQgcGFnZXMgZm9yDQo+Pj4+
Pj4gSU9NTVUgdGhhdCB0b3VjaGVzIHRoZSBwYWdlLXRhYmxlcy4gSSBhbSBub3Qgc3VyZSBidXQg
d2hhdCBJIG9ic2VydmVkIGlzIHRoYXQgc29tZXRoaW5nIGlzIHdyaXR0ZW4gd3Jvbmcgd2hlbiBp
b21tX3VubWFwIGNhbGxzIHVubWFwIHRoZSBwYWdlcw0KPj4+Pj4+IGJlY2F1c2Ugb2YgdGhhdCBp
c3N1ZSBpcyBvYnNlcnZlZC4NCj4+Pj4+IA0KPj4+Pj4gQ2FuIHlvdSBjbGFyaWZ5IHdoYXQgeW91
IG1lYW4gYnkgIndyaXR0ZW4gd3JvbmciPyBXaGF0IHNvcnQgb2YgZXJyb3IgZG8geW91IHNlZSBp
biB0aGUgaW9tbXVfdW5tYXAoKT8NCj4+Pj4gSSBtaWdodCBiZSB3cm9uZyBhcyBwZXIgbXkgdW5k
ZXJzdGFuZGluZyBmb3IgQVJNIHdlIGFyZSBzaGFyaW5nIHRoZSBQMk0gYmV0d2VlbiBDUFUgYW5k
IElPTU1VIGFsd2F5cyBhbmQgdGhlIG1hcF9ncmFudF9yZWYoKSBmdW5jdGlvbiBpcyB3cml0dGVu
IGluIHN1Y2ggYSB3YXkgdGhhdCB3ZSBoYXZlIHRvIGNhbGwgaW9tbXVfbGVnYWN5X3ssIHVufW1h
cCgpIG9ubHkgaWYgUDJNIGlzIG5vdCBzaGFyZWQuDQo+Pj4gDQo+Pj4gbWFwX2dyYW50X3JlZigp
IHdpbGwgY2FsbCB0aGUgSU9NTVUgaWYgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZygpIHJldHVy
bnMgdHJ1ZS4gSSBkb24ndCByZWFsbHkgc2VlIHdoZXJlIHRoaXMgaXMgYXNzdW1pbmcgdGhlIFAy
TSBpcyBub3Qgc2hhcmVkLg0KPj4+IA0KPj4+IEluIGZhY3QsIG9uIHg4NiwgdGhpcyB3aWxsIGFs
d2F5cyBiZSBmYWxzZSBmb3IgSFZNIGRvbWFpbiAodGhleSBzdXBwb3J0IGJvdGggc2hhcmVkIGFu
ZCBzZXBhcmF0ZSBwYWdlLXRhYmxlcykuDQo+Pj4gDQo+Pj4+IEFzIHdlIGFyZSBzaGFyaW5nIHRo
ZSBQMk0gd2hlbiB3ZSBjYWxsIHRoZSBpb21tdV9tYXAoKSBmdW5jdGlvbiBpdCB3aWxsIG92ZXJ3
cml0ZSB0aGUgZXhpc3RpbmcgR0ZOIC0+IE1GTiAoIEZvciBET00wIEdGTiBpcyBzYW1lIGFzIE1G
TikgZW50cnkgYW5kIHdoZW4gd2UgY2FsbCBpb21tdV91bm1hcCgpIGl0IHdpbGwgdW5tYXAgdGhl
ICAoR0ZOIC0+IE1GTiApIGVudHJ5IGZyb20gdGhlIHBhZ2UtdGFibGUuDQo+Pj4gQUZBSUssIHRo
ZXJlIHNob3VsZCBiZSBub3RoaW5nIG1hcHBlZCBhdCB0aGF0IEdGTiBiZWNhdXNlIHRoZSBwYWdl
IGJlbG9uZ3MgdG8gdGhlIGd1ZXN0LiBBdCB3b3JzZSwgd2Ugd291bGQgb3ZlcndyaXRlIGEgbWFw
cGluZyB0aGF0IGlzIHRoZSBzYW1lLg0KPj4gPiBTb3JyeSBJIHNob3VsZCBoYXZlIG1lbnRpb24g
YmVmb3JlIGJhY2tlbmQvZnJvbnRlbmQgaXMgZG9tMCBpbiB0aGlzIA0KPiBjYXNlIGFuZCBHRk4g
aXMgbWFwcGVkLiBJIGFtIHRyeWluZyB0byBhdHRhY2ggdGhlIGJsb2NrIGRldmljZSB0byBET00w
DQo+IA0KPiBBaCwgeW91ciBsb2cgbWFrZXMgYSBsb3QgbW9yZSBzZW5zZSBub3cuIFRoYW5rIHlv
dSBmb3IgdGhlIGNsYXJpZmljYXRpb24hDQo+IA0KPiBTbyB5ZXMsIEkgYWdyZWUgdGhhdCBpb21t
dV97LHVufW1hcCgpIHdpbGwgZG8gdGhlIHdyb25nIHRoaW5nIGlmIHRoZSBmcm9udGVuZCBhbmQg
YmFja2VuZCBpbiB0aGUgc2FtZSBkb21haW4uDQo+IA0KPiBJIGRvbid0IGtub3cgd2hhdCB0aGUg
c3RhdGUgaW4gTGludXgsIGJ1dCBmcm9tIFhlbiBQb1YgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRv
IGhhdmUgdGhlIGJhY2tlbmQvZnJvbnRlbmQgaW4gdGhlIHNhbWUgZG9tYWluLg0KPiANCj4gSSB0
aGluayB3ZSB3YW50IHRvIGlnbm9yZSB0aGUgSU9NTVUgbWFwcGluZyByZXF1ZXN0IHdoZW4gdGhl
IGRvbWFpbiBpcyB0aGUgc2FtZS4gQ2FuIHlvdSB0cnkgdGhpcyBzbWFsbCB1bnRlc3RlZCBwYXRj
aDoNCg0KSSB0ZXN0ZWQgdGhlIHBhdGNoIGFuZCBpdCBpcyB3b3JraW5nIGZpbmUgZm9yIGJvdGgg
ZG9tMC9kb21VLiBJIGFtIGFibGUgdG8gYXR0YWNoIHRoZSBibG9jayBkZXZpY2UgdG8gZG9tMC9k
b211Lg0KQWxzbyBJIGRpZG7igJl0IG9ic2VydmUgdGhlIElPTU1VIGZhdWx0IGFsc28gZm9yIGJs
b2NrIGRldmljZSB0aGF0IHdlIGhhdmUgYmVoaW5kIElPTU1VIG9uIG91ciBzeXN0ZW0gYW5kIGF0
dGFjaGVkIHRvIGRvbVUuDQoNClJlZ2FyZHMsDQpSYWh1bCANCj4gDQo+IGRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXVfaGVscGVycy5jIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL2lvbW11X2hlbHBlcnMuYw0KPiBpbmRleCBhMzZlMmI4ZTZjNDIuLjdi
YWQxMzU5MzE0NiAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lv
bW11X2hlbHBlcnMuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXVf
aGVscGVycy5jDQo+IEBAIC01Myw2ICs1Myw5IEBAIGludCBfX211c3RfY2hlY2sgYXJtX2lvbW11
X21hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwgbWZuX3QgbWZuLA0KPiANCj4g
ICAgIHQgPSAoZmxhZ3MgJiBJT01NVUZfd3JpdGFibGUpID8gcDJtX2lvbW11X21hcF9ydyA6IHAy
bV9pb21tdV9tYXBfcm87DQo+IA0KPiArICAgIGlmICggcGFnZV9nZXRfb3duZXIobWZuX3RvX3Bh
Z2UobWZuKSkgPT0gZCApDQo+ICsgICAgICAgIHJldHVybiAwOw0KPiArDQo+ICAgICAvKg0KPiAg
ICAgICogVGhlIGZ1bmN0aW9uIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5IHJlcGxhY2VzIHRoZSBj
dXJyZW50IG1hcHBpbmcNCj4gICAgICAqIGlmIHRoZXJlIGlzIGFscmVhZHkgb25lLi4uDQo+IEBA
IC03MSw2ICs3NCw5IEBAIGludCBfX211c3RfY2hlY2sgYXJtX2lvbW11X3VubWFwX3BhZ2Uoc3Ry
dWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLA0KPiAgICAgaWYgKCAhaXNfZG9tYWluX2RpcmVjdF9t
YXBwZWQoZCkgKQ0KPiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiANCj4gKyAgICBpZiAoIHBh
Z2VfZ2V0X293bmVyKG1mbl90b19wYWdlKG1mbikpID09IGQgKQ0KPiArICAgICAgICByZXR1cm4g
MDsNCj4gKw0KPiAgICAgcmV0dXJuIGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoZCwgX2dmbihk
Zm5feChkZm4pKSwgX21mbihkZm5feChkZm4pKSwgMCk7DQo+IH0NCj4gDQo+IENoZWVycywNCj4g
DQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

