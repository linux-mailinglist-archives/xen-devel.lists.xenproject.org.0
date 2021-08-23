Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0064B3F4BCB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 15:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170446.311248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIA8r-0004VT-VS; Mon, 23 Aug 2021 13:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170446.311248; Mon, 23 Aug 2021 13:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIA8r-0004SR-SD; Mon, 23 Aug 2021 13:37:33 +0000
Received: by outflank-mailman (input) for mailman id 170446;
 Mon, 23 Aug 2021 13:37:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xpK=NO=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mIA8q-0004SL-Mh
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 13:37:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.46]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fa8e3da-5758-4978-beb3-95bf9c3344b3;
 Mon, 23 Aug 2021 13:37:30 +0000 (UTC)
Received: from DB6PR07CA0188.eurprd07.prod.outlook.com (2603:10a6:6:42::18) by
 AS8PR08MB6277.eurprd08.prod.outlook.com (2603:10a6:20b:23d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 13:37:25 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::82) by DB6PR07CA0188.outlook.office365.com
 (2603:10a6:6:42::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend
 Transport; Mon, 23 Aug 2021 13:37:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 13:37:25 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Mon, 23 Aug 2021 13:37:25 +0000
Received: from 1513162917ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70094AD6-195A-4C94-8C63-240ED70AC6CC.1; 
 Mon, 23 Aug 2021 13:37:18 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1513162917ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Aug 2021 13:37:18 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6141.eurprd08.prod.outlook.com (2603:10a6:102:f2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 13:37:16 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4394.023; Mon, 23 Aug 2021
 13:37:16 +0000
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
X-Inumbo-ID: 8fa8e3da-5758-4978-beb3-95bf9c3344b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDAY3uCWOIIsn7O7NSAGWtXEUQOoxP5EGUNrLlpqKEw=;
 b=1nPOq8X/d+V+QwGGX2iDh/rSJRTi1vXyZVVZ+lyNpW6VUKPczIUPrgIZ1+QvQu5JqgdJGYZYKkfMsll1FUqmjl87XKpkyHD9d4PEhrpT/OHjrbMCT/ZL/mq97L648tBtB5+MqDxUt9vJAWNsQTHiAXUk6x93/O/R3d08uXAtZl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6edcc558ac84e181
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAq1Y/pQaPzM1YrgP3g/lmQVCSjD5ysHB42uNJBVVqNDToQXpyTSTo3lR6V2kA44kzTrVugyDaSmNOaHXIbsUVYphvpis6oc8NtOBUAYVOONr8sh3tz1aqnOERuW4sJsz0hprWxp6agkMmpRPYSAxScCsoqcrXkf87J8OywLCzwui0foeSGaGpejoa48qc/RG0dz43B9osdLGhDLeenGXJUixmLqaF2N4y/BsfqRQTihzvQ1d8pKpmlx1IcpYE+gqpbxNXql1+NRki5I/wldh50INCaiy2TlTS0xOQeL4VuF1A+k62/45laZSZwnxSTV9ABwgdABTNqLGBgrRaf4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDAY3uCWOIIsn7O7NSAGWtXEUQOoxP5EGUNrLlpqKEw=;
 b=HvQe0u1TSrUUOHIcOS/obagbq7YKH7k1cc+Cm6LtqOx1KOpkjCF1h+1OtlEEupvL9hSdo8EUBH2iH8Lqs6iQ3PxC/2OtdXL7YPT4GyuJHqMzQuBCcEhCIzuZBiBK4WYsU0FSNXf5Kq9rj37GxMQ/UzpncU7r5ald6LtvrMkH3UJ28xn1fOwq4DJv43PfUIAnUVxy1Yth91NYBVGy2tTkJj9sjucx8oSj2IWV0J1nb2/sg01Dn7EpLeDhg+KYgbHO3nHXHI2vJDEka5AbrS1gTrH3y9bxfCFx1kJA/FGGXxZzc6GgJ7SW1lMD/qgO/m07tVhqu0FOX9vebcmLS6A8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDAY3uCWOIIsn7O7NSAGWtXEUQOoxP5EGUNrLlpqKEw=;
 b=1nPOq8X/d+V+QwGGX2iDh/rSJRTi1vXyZVVZ+lyNpW6VUKPczIUPrgIZ1+QvQu5JqgdJGYZYKkfMsll1FUqmjl87XKpkyHD9d4PEhrpT/OHjrbMCT/ZL/mq97L648tBtB5+MqDxUt9vJAWNsQTHiAXUk6x93/O/R3d08uXAtZl8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 5/7] xen/arm: Use sanitize values for p2m
Thread-Topic: [PATCH v2 5/7] xen/arm: Use sanitize values for p2m
Thread-Index: AQHXmApoMVB9cWExpU2kmUfkwXVwUKuA+VSAgAAOUYCAAAwVAIAABCmA
Date: Mon, 23 Aug 2021 13:37:16 +0000
Message-ID: <869CC2CC-0B99-4F9D-94BA-8D1B0911232A@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
 <b6d656bd249e85ef192a0bbddae1eb8492e51583.1629713932.git.bertrand.marquis@arm.com>
 <7c8684a1-a20f-0534-2a4b-3a778a80166b@xen.org>
 <D6083043-B649-43E1-9654-99BC1B8FEED5@arm.com>
 <1f16b3d6-8cb5-499b-6a9e-0bdc08368756@xen.org>
In-Reply-To: <1f16b3d6-8cb5-499b-6a9e-0bdc08368756@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 199fa4df-f02d-4c7b-7def-08d9663b24a3
x-ms-traffictypediagnostic: PA4PR08MB6141:|AS8PR08MB6277:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6277CCCBBE549197E0B67CF59DC49@AS8PR08MB6277.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mVVqkXU9zeCpQ6FPpok6TWyXYuBvZglasNuuYTZ9NEUVZ5RPUL46dAd40MvhTG9V45+1H9AqvuHBJIVj3zCW/BKxegWPm/lOmKIBBa5SKVQIYUYLHNW2I4R+cutHA+MdVO1YHairE+OxWXPSrukW4xLgpK1fjMA+nxw6Z8rwyjjYm+3RoLur/c29wQ7QAxEO2A7YcTgVJsZ8UCn9p6cwFnXHsLl5q1lN9TQY0Ll3zjcvpne0/gVssNBgqgljScpF4/XGXKeFVgM2fAfM6PiHLg1V1/RcVDccnS0PDBOHfmnLEXSHK/+piMQKwVI6LdTHbFm06SbygGqLk8czrs8E5WU39fMdw26qo72lqrnEptEuMElsOF16LBoAo2xTjy2Rb8S8MZjHgoQKCPY8fwEvKIsWZDCZzQXoRGP4qZsy1/k3KJ6V81xtZyZkdSekkIHso9n2A5D1SJH6HZckMRfUWLgJzN8HTYt9U+HfVo0jAo7g7BOz8fwAnz2dtuY5hHMtGVkaLnB19H7T/j1IU4i1iBGUateYK9gN6QzBNZ1I6t+kKGknsBDPse+guor1KJa+PqBTnKeRvebOdHkAQ0YNUPpz50PHbsvVuq9FCoJfO9v61JbVH0IXnncq5t6f5ezud7oHb2PNy2mOL8i0b1UOvMpJKWwHPCzpeQ7+5W88NVpKHYiokXXOqPKEX0EIrWUEiSAEprS9ljNBfxBBvbE3UePK0qneCAwJ9h92T4SBNoqOeSjpR/PHw7dzC7kcJbAB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(91956017)(6512007)(83380400001)(66946007)(33656002)(186003)(6506007)(36756003)(53546011)(26005)(508600001)(66556008)(8676002)(38070700005)(66476007)(316002)(6916009)(4326008)(86362001)(71200400001)(54906003)(8936002)(2906002)(122000001)(5660300002)(38100700002)(76116006)(64756008)(2616005)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yUSNAVIu/VCW9adMnbbExgNh3JX8e+CWJMjAIV9qEs5qgXYfx9+c/eNmmK7D?=
 =?us-ascii?Q?tr9coaA2HZGBkUELfKwY7eJSfA77aY8PzgZnKBgp11dBoKtLPu0AaEK8OSwj?=
 =?us-ascii?Q?85/vwsU/MR+IoTpvhaAdlAOi0lzvStT1bnSBLZDEEmGJ/FOU+BJepuzTVEGB?=
 =?us-ascii?Q?/rrUAyB4Ch9gEnSewBVjOtpWy3mtP8+RsrC1mvP0i7XwVKamq3+v8ZSDqtW2?=
 =?us-ascii?Q?VYnH8kd7t8yKQAuxiR+zHPd8tH7hMIwUivoAJrHBrFts1ujBBnWNMXi0eXPl?=
 =?us-ascii?Q?qEuDgvXM7fCJdHH14LgYEjml1UPJ3or03qtMtxaOrq/NkU4+Z8gV8OZSd6sy?=
 =?us-ascii?Q?LgRlQWnld8LiyO3bgAVm1shuKcbpWCHBuanlj2mW7MIcRjGZ+J6f+q5Z4mRY?=
 =?us-ascii?Q?8oVsuXsfyVV0jxHq+QyTF5eAH1e4ofN6UIQvihCEG282tolDxgk1QSK28C3j?=
 =?us-ascii?Q?tjrILLtEhmZuq5M9WE5fFSfNg//SsV+uurJLQsj4FnLfIWqzf7dlaS5ELaNw?=
 =?us-ascii?Q?8LabI4CXTu7ojG0Q42MbqxH4Iw6ZtuThXfGcOMbQuf9A1gy0zlDV6qCPZudH?=
 =?us-ascii?Q?mDUvRehLt5UdUwa2WmXaC33+SNb8Ppu6QbjK25MGvYcc2HX0xPdWi94amnpd?=
 =?us-ascii?Q?O+ahCJrje/xJQ5ifiNxvRBLx4fkg/K/yiuka6HEg8xkrm/09DunpzWuBoynF?=
 =?us-ascii?Q?bd7OR1qunZzht0EDWvBipUgNWNYQvPu4TgxMiBo9Tlh0hTDkbhFx1Td09jM1?=
 =?us-ascii?Q?JMWd0aShPRGDIE3zCKVjJhF7Gtj7+nfAYU1/8txu6RecvZE+OhEf6tYlRBD4?=
 =?us-ascii?Q?9PwefWRIGpDVraa21eNw9NhYYnFfCmYCpQZMaWJz7GyO+ZtXKXqv2sV01BS9?=
 =?us-ascii?Q?FFt5U9G1gkjQCgXK34mUOrwVY16ryXiB44CCzyJ8VieufNMlTDEzOaH1HyCl?=
 =?us-ascii?Q?mzvEcqjK7WvySOL6RhXFV7S2H9YO0wBrejsNSwhrFfhhHD+HFU4MJuasXmAD?=
 =?us-ascii?Q?QSQsBN/i3mwmJJQpM+RXg24XFTZYpvwJzxWCUjM5RsZoCiB2vFiJu3LuwliL?=
 =?us-ascii?Q?1/B7uEpMYpD3CV2+9xCW/iDIzzaflJOMQwfwxOYwyhYVlMQL40TR6Zj0wUyb?=
 =?us-ascii?Q?1iPniuVHGYMJ82EQFHCCMj7LlTMx+7KsBBB/uQbOC9ieltvFYDmfdn43qeat?=
 =?us-ascii?Q?ffTzE6RQZRCs5u9g44BpqV+CyhyMnvB4DhH3uINlOHwZcCgAI8v7HxOAvu33?=
 =?us-ascii?Q?RRbQbtbxsMBwS56WfE+nK+ANqRSvSKhMXXrcPKLCUI5tHri61MHCgi8yI5we?=
 =?us-ascii?Q?hssHTTbfSumIS5zNStIbjm1x?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <218505B56253204DAF20AF416B64787C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6141
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd50af96-1f54-4d53-231f-08d9663b1f38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bJMUuoxPtsyVl2hzlu5322u/4Hg3lgscINR164jPEuPvGmTivJypSuUDm5jdF5ZWkDJisnsQ2ehR7LjASI5I73ZVcj+ekuMft8wdVfbQLpKlUxP8tsTHzu9aMsiwVNceSAkA0WUVOfSkxL/JE03RSUdWyvZL0nNWY2JWieZp4FYp8qOs/8n4soINGqvXYi0vC1tWuvl1/ySx8sHZH6JJdKPq/v2++yzyN1tyrJcrDbt/2b4INZZGjgbdwoCWlGjc4L6patqVPqXAdCeyrqHJ1VC5y+UOxqG9DNZPedPnn7oHIsqqE7yQTj4l4ezr2IabUsnGXCCItxN2K9e1BYMw5isATttnQ8bcJP8s05HhjLLkfM7OnRpz4NMFBVRHnq7UBt34twe70YlnUMmdn3X0ak+tGRp9qncT+wco/qrVHU7CfxmQ4wWWHnV+cxhK+ACk5SW0yX94rT/XnwQAWrg+gqsTJ3FUW8PV2tCGiBj2VujZj9fv51WOHtgJeDRz8HFIZFvT6Av8FbYOeZaBHGV/CgfCkc6WhXswcjEQN9EhNCbNQka/Hq/hTMwlXkw4NTHT76OJVc6hPUst9olb3Mv6eCvLyfZH+WYUH5ayZMpzW9TCOPHgbTTwkhASg0IruFGQ3jzltS0jsh68teUmNRlsJAFqNKKVOMS8N7iqBpUZR2QndpwkO2tCvp/GUgb+GYLz28WwEEbH1lF6wkwevLXNnw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(36840700001)(82740400003)(356005)(70586007)(70206006)(2616005)(2906002)(186003)(8676002)(36860700001)(54906003)(336012)(5660300002)(33656002)(8936002)(83380400001)(26005)(6512007)(81166007)(6862004)(478600001)(4326008)(6486002)(316002)(47076005)(36756003)(82310400003)(107886003)(86362001)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 13:37:25.3363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 199fa4df-f02d-4c7b-7def-08d9663b24a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6277

Hi,

> On 23 Aug 2021, at 14:22, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 23/08/2021 13:39, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 23 Aug 2021, at 12:47, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 23/08/2021 11:32, Bertrand Marquis wrote:
>>>> Replace the code in p2m trying to find a sane value for the VMID size
>>>> supported and the PAR to use. We are now using the boot cpuinfo as the
>>>> values there are sanitized during boot and the value for those
>>>> parameters is now the safest possible value on the system.
>>>> On arm32, the system will panic if there are different types of core s=
o
>>>> those checks were not needed anyway.
>>>=20
>>> So the assumption is that if you have the same MIDR, then you must have=
 the same features. I understand this is what Xen assumes today but I never=
 viewed that check as the truth. It is more to limit the damage on most pla=
tform.
>> This was the assumption before, I did not change anything but just expla=
ined in the commit message why this was not possible to come to this code.
>=20
> Yes. This is not a new, however I thought I would mention it because I wa=
nt to avoid continuing to use wrong assumptions.
>=20
> However, this code is arm64 only as it is #ifdef right? (Sorry I should h=
ave looked at the code the first time) So ...
>=20
>>>=20
>>> So can you confirm whether this is something that Arm guarantees?
>> For a specific MIDR from Arm (ie a Cortex) the PAR is fixed and VMID siz=
e to.
>> But for an other Arm architecture processor I cannot say.
>>>=20
>>> That said, I am not against removing the code. But I would like the com=
ment to be amended if this is not a correct assumption.
>> Would the following be acceptable:
>> On arm32, Xen is not booting on systems having different MIDR amongst co=
res and it is assumed that cores with the same MIDR will have the same PAR =
and VMID size.
> ... I would just drop any mention of arm32 here.

Ok

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


