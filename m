Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EAD3FD5E9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 10:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176108.320545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLwd-00060O-2F; Wed, 01 Sep 2021 08:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176108.320545; Wed, 01 Sep 2021 08:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLLwc-0005yz-UU; Wed, 01 Sep 2021 08:50:06 +0000
Received: by outflank-mailman (input) for mailman id 176108;
 Wed, 01 Sep 2021 08:50:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C3+8=NX=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mLLwb-0005uz-Uu
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 08:50:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.89]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae6bfd60-37f2-42fa-bcb7-403ad9f67df0;
 Wed, 01 Sep 2021 08:50:04 +0000 (UTC)
Received: from AM5PR0601CA0032.eurprd06.prod.outlook.com
 (2603:10a6:203:68::18) by HE1PR0801MB1771.eurprd08.prod.outlook.com
 (2603:10a6:3:88::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 08:49:54 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::bd) by AM5PR0601CA0032.outlook.office365.com
 (2603:10a6:203:68::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Wed, 1 Sep 2021 08:49:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 1 Sep 2021 08:49:53 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Wed, 01 Sep 2021 08:49:53 +0000
Received: from b9d613c93ab0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F7A21BAA-F4EF-4BC6-BE80-62232048294C.1; 
 Wed, 01 Sep 2021 08:49:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9d613c93ab0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Sep 2021 08:49:47 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6511.eurprd08.prod.outlook.com (2603:10a6:102:12d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 08:49:46 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 08:49:46 +0000
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
X-Inumbo-ID: ae6bfd60-37f2-42fa-bcb7-403ad9f67df0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRa8tMlNf0zznQ/c905c3juUaUd51nNqBn86dcAqfd8=;
 b=DPP1P4YyBTHLVgVytNxvUkFov7hexMFHLg3TJBl8SMQOfKgPrKC1hegVm17uwKpeWKXohrQixPsIKlqXFuwSWHva1t5JgNf+nAAMTDCmTlT5TqpMUyxm/vDATB/vy5gvGgujSSPbJpuVfNmRYRxMm+a3z+vk9briRkb5U79wGlk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e90d8ecbde44be80
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UI71hRW21G8Kqg8yAMeV8uXNMAAjl1KN3uP68UVFSsFuvbuHHvDvvYlHFxRmkdMckTa0KD7DdLLoSErd+psF/HAulUtcEwkuPtChbWwS5rTrCUDidwQPXRf8qxdmAf4jL3IW1opwedCHRpnq5021KW7rRhkuYi0rkCcZzyBnGmJ0ma46AcOCQb+JFbZG0caP0Ipnu49NmWQByGjsuWswnRyvbvQjaaknAD9QqepEwXOi1K2TS1PSiMBvIIPQVUefjuXdc+tzc+yQRokccyrYbE/d8QAl0o2HpzCe4GNVLxpQGJtZd6eOJg8tfSZqyYVyvjuDS5cdAac0K+XQsGkz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KRa8tMlNf0zznQ/c905c3juUaUd51nNqBn86dcAqfd8=;
 b=LT+wNyMLWe5lqo1LDTP3O3LWLhmj0zbDh4HVUyxhNTrYWDIEapZ6GHW3CB9TGjbVPdPU5n9fglpUCb+XnQWFG3D0/5CgHj9mgxjA7TRwCTCfyTX+TkLXF6OfA4qx5R+hnXQ/Nf4lKBVseMGRWfAq81AZbeD9K29BURTOor/RKTvMaANRj+4bCoUdrde+kMXt0giOC2zSBptYWnfAFq+9/atdWLr138wy0K40eIq+iGu/7lwLP7sSN+oqJ9i8inTRinwhHiUsvS2kfFBJufMdV4ZAwCIsEFp+bHy42Fk/lJYbeh2RvjNbvDREu+S/NRrvOFaTZ3xfLLLiaBL+h6x0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRa8tMlNf0zznQ/c905c3juUaUd51nNqBn86dcAqfd8=;
 b=DPP1P4YyBTHLVgVytNxvUkFov7hexMFHLg3TJBl8SMQOfKgPrKC1hegVm17uwKpeWKXohrQixPsIKlqXFuwSWHva1t5JgNf+nAAMTDCmTlT5TqpMUyxm/vDATB/vy5gvGgujSSPbJpuVfNmRYRxMm+a3z+vk9briRkb5U79wGlk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] domain: try to address Coverity pointing out a missing
 "break" in domain_teardown()
Thread-Topic: [PATCH] domain: try to address Coverity pointing out a missing
 "break" in domain_teardown()
Thread-Index: AQHXnw3T6W43IPECMEKENcWB9l+Su6uO3oGA
Date: Wed, 1 Sep 2021 08:49:46 +0000
Message-ID: <9FDBB4B2-9025-4F75-BDFC-0BECBBBEB7E2@arm.com>
References: <20e28e4b-c794-7435-5f5c-332e9a6c0433@suse.com>
In-Reply-To: <20e28e4b-c794-7435-5f5c-332e9a6c0433@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c405c1a3-d6a5-4398-774e-08d96d2577ac
x-ms-traffictypediagnostic: PAXPR08MB6511:|HE1PR0801MB1771:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB17714584A9E6B32937BE0B359DCD9@HE1PR0801MB1771.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a4liixixZHgl5BOPISpQc2TNxHRoEJbnwKzmC5FsbOvYr8TiusfqlknFbWcphTCmTejuAgzYwkAx9gqPq8swO99EIJdzBJ89XzHFnGWn3OM3BBCk0/Ibu/epsCha3EPlm3du0drDQvpugyZMsq6GkBDOSezJmFXC+3Dyws9u7QvEFllhvROAhEMSp+d3743zkyBhKQfgqxGXBLOEm+ZwQMNcpa/b6bpqQFS3NZb7A3bsmS+NHInigQXrybjn119BuDzVMAByRcUh0QtVF/ynpXJD+Y7uGRKCNGfT3Wuk6lh8hyK7n7j7NN6ABFuihdDEc/ZvTkZciBxsMVQcOiLiW9Yv5UFQxxHOLXlUbJhl8+m+hrHnq75/YrJNFrPNvFHOJk1pd2kfc1Ubs/REJKwSexJc5dw62cv7bRvEOBgLJCtcxiFs2EE/1qVSDbxAhwladLQXEomvpyJ5DyF39KyBQi4fPFoNpj35MZLG6bt+ysOXY60Psd7jvFVnitKSQCnLDsf2hrm6GHitftoJ0ECaRZ6jn3wKOzqIMTYnlQSXKb5PK8ncZc8Y7ymlHGeuH3e+RGDgOwehxgilN/3WpKMoYd4A59WssObKfXJ3ZC8m+UudLGBr8FxaAJvvsM/tmPq42PuzgP6tH8pN1zkzA9TVJ4+B4q/VGXrJwqxe88GFbRMrvxRpr1eWiiCLHQXSdneeA5BIpW9go50LsBCSdKUpsslRIeoyMjjoQ5rMc5Gk/R8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(38100700002)(6916009)(4326008)(38070700005)(8936002)(2616005)(91956017)(76116006)(66946007)(5660300002)(36756003)(54906003)(33656002)(6486002)(316002)(8676002)(66446008)(64756008)(66556008)(66476007)(71200400001)(122000001)(86362001)(2906002)(6506007)(478600001)(53546011)(26005)(186003)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?or1y6CDxGOMF4EGSwNPO0ruz04HAJVBSM9AoECLyeB7hLql9bPavIYzv6nN1?=
 =?us-ascii?Q?nQ4zohg2XAlFnwR9bPNdVb8HjAaKW3AamnATGi9NIB1MApU0IzQqpLtoXqiW?=
 =?us-ascii?Q?1Lq5jjooK5gt6MaXHtEX2QYysOOYVmTmMgERGzPQG95y8BtG5hw3WtNbfLsQ?=
 =?us-ascii?Q?MffdZM6nBgL1lT0VeTzKK09CPZ3QwFbLaqD/Cyu+XQgh0cLskrzjh8nS61me?=
 =?us-ascii?Q?69Qdvl8uj4+pNaaOTnrbFa8YEUSdRsyJCU0ar6TnBnf3Lwpm3Ek7U+Tu/UdV?=
 =?us-ascii?Q?4CxwShO0SWtIeoRIEok3V/ou9l26Tc9L2HvrtsdZfO6Da0/qxfeM6LtuheZK?=
 =?us-ascii?Q?OcaaWukik+g2/EmP/9pgNTgfx0fT0oTxBQuS98edLY+ySlS6nR5FILDxuKKs?=
 =?us-ascii?Q?cY2z0r9Ael0YJjLW4W3DECkYk+BTH9dcbApbFuyOC87zY6WxucnLZ30TprVP?=
 =?us-ascii?Q?hMsOTcWxe5oDKpAle6zE24SXf60LNyQc1avpvvBIB5e3Gko+TzBuJOcayLkg?=
 =?us-ascii?Q?xGJQon33d1tWcywQ4QGLB/lB29oM330IP1h1n7Xx9kT6vjhA8u+EL3+oOD+q?=
 =?us-ascii?Q?PZeGGMRImBMF2KtCN2IXiG7NYxpHLGP+1+MzpDpkoRUCWrOFtWymfb3ZOT+Z?=
 =?us-ascii?Q?vzmZZgohTuV94GcFxWfKsiinhfyKZ5ZzIucmBx9wRfbO1xadrP9whFZPjMeE?=
 =?us-ascii?Q?AVwg1bBR35pMw9wBcBqcIVbn12Mk8j79ihJKrKVYWYIVpRUf3iWvaBMG6YnS?=
 =?us-ascii?Q?6DeYUMKIZuMCviD4MeTRig78zX/oI8sfQFgIcBIj+Oldd2XkEWnf9GoROMzH?=
 =?us-ascii?Q?kvwc7XkX3Y7VTlwbc6lCCQGPvmjIco25OFN5Uu09mIEMbz2+Ejcr92HKR+/J?=
 =?us-ascii?Q?aKLkrm8qSxQ9O2yKdPUwae8PHQt4ckQOie2ECqUQrACANAUmhMPgsrljnWnv?=
 =?us-ascii?Q?IFPkRYoLuxQ2t8UoxAiFpcUjWI6UN3jWwwYIh+1j5DJZkZU+/W1wnGobALuT?=
 =?us-ascii?Q?8BYkJrwUg3alqg7Wjuqm70WeqE8S8ri3Uy0QK8q4/f/+sMJ3AWHkisikrvLS?=
 =?us-ascii?Q?yRa4rtA4Y/nPRtIqLuhufEJLiML9stljW3JYtGCjfqdyUBLSl/JyKypB9AMm?=
 =?us-ascii?Q?KRO+I+Gh5N9MS3l4lLqUxmIfEXN7hNnwYuj8ShREljeb/j9eNMDpBRTPRcSH?=
 =?us-ascii?Q?ox7wIiJMBWu+rrVIPkqZMgsaAwDiUzeskbV+5hJdiYnkGSehWxT9iogus/r5?=
 =?us-ascii?Q?DdNPB23UM48uMb8IF9RJji6ekdfl+FqHSitMgoQHIsjDbSWYkMLrnSjm90cL?=
 =?us-ascii?Q?ajqlHVsbg+OzQkd2S+P4uWcP?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6569E7965F64A44099542E5F69489ABE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6511
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7289598b-091f-4deb-48d0-08d96d257341
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VR2y68/b0zRLJYufOzKYD2vExvgRVyu9FRvHAHeENBMlKr6DdBjK0tltknXT+eJDwwJnRSnj3wOUsdhUqzzQWnmQi4a27OtzKSZ/5lquCgo0J2kkmdVby9bYGFd62SBOIxjJI7XU/7QjjovOOpvBtp+onozMUkUZN7HesyHTsAB51F59QLxzYR7JVkRBdmSILN8LA8CC4RdaHZ/4nTGcb9T06VmSkkTYInkYNEbGRZQXqxOAkcl/QGmhpi5x+0YSepvSndFhTDVxz01Xxx51tVQhaOLEzLuMZRfP/uKG9pgjNgiTYTxtOJcDc+kqN3w23+790E/ML/LNwXJMSBziBf7TzhIJNWnPzetYoWS6Btn6liUbUG5EpiCJFr9QkDLPc8BJAC8ieCqh2DMG6XvltuXOJvrRdfPAWgdUR2gAVL4DauKRB/kvpK6MikxBidjwJApyCIeci9vG70n/6u74BRyap0+gREW2nD/isT4gyGV9FCCc2uZv2oGMZ32zETAcohF0lbqNflqDPs4jbV2VjuqT2HdRY2tulEYM+IJ9zHItXYiUr4PC5PILC2EakPt3in97JIZJfjam+/QqKSrOrhzZvC9T3LXA40nV99cV9fakXdS4yMcVneEcVON/pkt/gup3xy5dGEZV/Sr6+DY4FbbmUnqb1dVPnhMXchFZsg0V3Szf0p93tn4AMHZuKz+B6UlFKgoM2s6N+wgf96abxA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966006)(36840700001)(8676002)(70586007)(36860700001)(2906002)(70206006)(6506007)(86362001)(8936002)(4326008)(6512007)(356005)(36756003)(26005)(2616005)(53546011)(336012)(6862004)(316002)(82310400003)(478600001)(186003)(5660300002)(33656002)(47076005)(54906003)(82740400003)(81166007)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:49:53.7601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c405c1a3-d6a5-4398-774e-08d96d2577ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1771

Hi Jan,

> On 1 Sep 2021, at 09:45, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Commit 806448806264 ("xen/domain: Fix label position in
> domain_teardown()" has caused Coverity to report a _new_ supposedly
> un-annotated fall-through in a switch(). I find this (once again)
> puzzling; I'm having an increasingly hard time figuring what patterns
> the tool is actually after. I would have expected that the tool would
> either have spotted an issue also before this change, or not at all. Yet
> if it had spotted one before, the statistics report should have included
> an eliminated instance alongside the new one (because then the issue
> would simply have moved by a few lines).
>=20
> Hence the only thing I could guess is that the treatment of comments in
> macro expansions might be subtly different. Therefore try whether
> switching the comments to the still relatively new "fallthrough" pseudo
> keyword actually helps.
>=20
> Coverity-ID: 1490865
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

A grep inside Xen code show that we have occurence of:
/* fallthrough */
/* Fallthrough */
falltrough

Should we actually fix all of them ?

Anyway this can be in an other patch.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> If this doesn't help, I'm afraid I'm lost as to what Coverity means us
> to do to silence the reporting.
>=20
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -401,13 +401,13 @@ static int domain_teardown(struct domain
>          */
> #define PROGRESS(x)                             \
>         d->teardown.val =3D PROG_ ## x;           \
> -        /* Fallthrough */                       \
> +        fallthrough;                            \
>     case PROG_ ## x
>=20
> #define PROGRESS_VCPU(x)                        \
>         d->teardown.val =3D PROG_vcpu_ ## x;      \
>         d->teardown.vcpu =3D v;                   \
> -        /* Fallthrough */                       \
> +        fallthrough;                            \
>     case PROG_vcpu_ ## x:                       \
>         v =3D d->teardown.vcpu
>=20
>=20
>=20


