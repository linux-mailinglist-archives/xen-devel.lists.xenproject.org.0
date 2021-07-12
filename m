Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E421B3C5A7E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 13:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154514.285512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tjF-0000Re-K9; Mon, 12 Jul 2021 11:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154514.285512; Mon, 12 Jul 2021 11:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tjF-0000Pa-Fz; Mon, 12 Jul 2021 11:04:01 +0000
Received: by outflank-mailman (input) for mailman id 154514;
 Mon, 12 Jul 2021 11:04:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SUz8=ME=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m2tjE-0000PK-36
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 11:04:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbb09620-e300-11eb-86e4-12813bfff9fa;
 Mon, 12 Jul 2021 11:03:59 +0000 (UTC)
Received: from AS8PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:313::16)
 by DB9PR08MB7132.eurprd08.prod.outlook.com (2603:10a6:10:2ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Mon, 12 Jul
 2021 11:03:56 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::1e) by AS8PR04CA0071.outlook.office365.com
 (2603:10a6:20b:313::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Mon, 12 Jul 2021 11:03:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 11:03:55 +0000
Received: ("Tessian outbound 8b91ad1fd5d8:v98");
 Mon, 12 Jul 2021 11:03:55 +0000
Received: from 6819bb5c397f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F23ED7BB-39CD-42CC-BB0A-FCFBFE741ECE.1; 
 Mon, 12 Jul 2021 11:03:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6819bb5c397f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Jul 2021 11:03:17 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6704.eurprd08.prod.outlook.com (2603:10a6:102:130::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 11:03:09 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%8]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 11:03:09 +0000
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
X-Inumbo-ID: dbb09620-e300-11eb-86e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGC+gAuQ2833ltizTLXI9PJzrLPwP/h70LyoK5EiFCc=;
 b=Rkk/gEOXqMBtU/SB9YYXxelnAI2hNeQsVuuPPMnwWRqyKk43s+JhzevC57s5L45XgPjJGaI01X8j3lXCItoZy0LGeJZHphbo88Wbb24LfpvdRu+IkIEOM+B4RRbJ0H81nMUMLZlr3y0hDdvh1h91TOTGztl73sIHRKd6i0HffpE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6c66003bacc61d3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfS6IwpB8tZ+9Bx+xqZMr37o9qMbFkEfBL3wfWtwQgAPdlybeMFd1nXxnHjs67qilqwXaoXXVjtLNw1/fE1mEtTTgRBJS63f/5jPuZlxKeaFiGyYQfMI8qT5+OGnq8Ka4ha6D8f9cXs0A2sJbM0PafkTXwmTA+H+GDdFirXC6NTPLZ6GfECS3zCVH0U4jVuRomxxa3eMPBMlLlrlP/5qGCIhjtmi5K0rTfrgPrrsSRh4mc2RGKn5VqOO6kDWoMmGxsFk1tBE/C9n6a4ifWUaJafpIy7w3VkDkRiqwwpTMMv8s4mSiv8KkHRZ/F40Q6W7MCCHOHcGfwsw9ePrAsliQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGC+gAuQ2833ltizTLXI9PJzrLPwP/h70LyoK5EiFCc=;
 b=GoyOHT0AAWTiS20yMgEIKBOAgYr1Z1T8XoA7xPEbfOvyoQmuebxvKRwUeGZnJOd8Oy76p5eAN4Qep2ULkZOmpY0pVsZx31ANqNEif8SvWml7N4TnzdY/EL7PVzHDafTw1fXu9H3dOWNlZ+A/fcOlsOeSFReZKzVfMrlpBh9v4LHtbmDxvyh0urSnSb2nKbo0TwG3LrSxPerSXVOZAXjtA2gd0BPnuBRmvWAJPrF+/um/prrvyboSxeB+u5vgU94vVd733AnXdZrFEPamFYrImgzirB6VmFxudNxwlrD/pLQvm6cDqli75QqvTakK/5R4laXSaeD61m/mqabdfjQwiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGC+gAuQ2833ltizTLXI9PJzrLPwP/h70LyoK5EiFCc=;
 b=Rkk/gEOXqMBtU/SB9YYXxelnAI2hNeQsVuuPPMnwWRqyKk43s+JhzevC57s5L45XgPjJGaI01X8j3lXCItoZy0LGeJZHphbo88Wbb24LfpvdRu+IkIEOM+B4RRbJ0H81nMUMLZlr3y0hDdvh1h91TOTGztl73sIHRKd6i0HffpE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Topic: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Index: AQHXbQmqqZ2dUoMblUy//wgHf+AX8qs/M8QAgAANJgA=
Date: Mon, 12 Jul 2021 11:03:09 +0000
Message-ID: <EE203ED0-5FB9-4597-878B-7261C989763F@arm.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
 <b9c86a28df2bddca095ae02511ced09585dce164.1624974370.git.bertrand.marquis@arm.com>
 <4014ca20-b3b6-cd39-9b26-d1dd8e9b568c@xen.org>
In-Reply-To: <4014ca20-b3b6-cd39-9b26-d1dd8e9b568c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c47d82f7-cd03-45af-2074-08d94524bde7
x-ms-traffictypediagnostic: PAXPR08MB6704:|DB9PR08MB7132:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7132024341B833F5E1DEA2F59D159@DB9PR08MB7132.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MIdjqWuiPc6CRSmyYxapSWB760w9L12U97uRJUFyftAq+t9vVB4NIw4kTqjbOSwogjUcnxbqaEzAuXjnpnek+81bdYibwDLdPpQUu1QPmqkSEtLbq9JrBGL3sfITbivAjtP4SNjscLusUgDGp8VvOAdxjKBy5HbWue1GW5YV0VRP7pUkufqYrQPhcDpphYIewxNZyWpHRe1e52HW2Alpx1PlVEuo4FwyNJobDkyvmdHuIUQQGMJ2Ef0b/rSVNUYy1CffN9H0TaxpG3rdWiFi/XmvkV1F2bpJYynKDtjIzTFFBqpHCwB9qCR7puyt2r9o0e/nsNPDbu6BgHIWvQOY9SsgsexybvZgZ0x9VbzjQlD476EV5bLB+ddSG1qdsi/tGofsSGv+rMZZaU5QfY7aMYAz/6Y9SW8F0Tm41CJpWIECDyvRc5mKLI2zRsYShj9Ab/83VwlUoOUW11mmdN5egdE231ypUnlIVDVvHOetS8xp+gmoAiZqEUAxcBkaq6XD4Xfz01ReS+D5dkf/FyzDAK2KsVIGYEZf6OKYf/jHTJcAegyEjAf6+J8TgZPVNT6JwwKf/YxmCP8m93jqkQ+BF7UwrbraR4rdcF3qKcNUupM4Zo0jfpxCizs9hZOA1sfjtSqCr5skYhK5F7/097cPCt8ZI0Es9Lw0+LFa/EvM+DPfgJvzZI+5TRuS2ACsgcBnum2/cjcSlQU/YpgBtUiy9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39850400004)(36756003)(8936002)(186003)(5660300002)(6916009)(6506007)(38100700002)(6486002)(54906003)(2616005)(8676002)(76116006)(30864003)(53546011)(316002)(478600001)(64756008)(33656002)(66556008)(66476007)(6512007)(26005)(66446008)(122000001)(83380400001)(2906002)(66946007)(86362001)(91956017)(4326008)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AeiMUlhWuPmqsCvTpzmYeYVfFoE+wsybiggxxUOyimb4uHQoud/fOhz2gTI6?=
 =?us-ascii?Q?Qodk9efP7foI883RXGhvBLNuutvbiftzmumXVCnhx46fjjd0i6rwdiqeJtT5?=
 =?us-ascii?Q?1aBfelzSIdGpQJGSPFx+/8auCfDhI8t3R3yqwSBt0LnbVyOO7Kll2VZ/s194?=
 =?us-ascii?Q?f5WVKke574jnRCk2z1xFJYewe4ses1b+o4raao2FDPZLa0q79sk4kPSoSeOq?=
 =?us-ascii?Q?Uc0A6IbW8EJ8gqxH6NCzs/oQ1xNEOpiAyXbGdc2e3uTW8GV6TmUQkcglEhEk?=
 =?us-ascii?Q?+yxf6gWC/usR+wxT3Ov+vOImRbR7dwghlHvGdvkbtorG41dh/+CqcMBL3lOG?=
 =?us-ascii?Q?P1Aqw1xOYBMObSM1/gP/x3OnzWcLuh+k0dpvQJv+CMWDtEgs52q8xppwSikg?=
 =?us-ascii?Q?hble/tshY5+mhRd79qKTjFACpnCaXMnEqdNEPrlOicw+VFoSnxs1nEB0stmb?=
 =?us-ascii?Q?wAYLA2O8y6sUS3AnU6keDyB/QLMc3afqmAcSJ1Oi4Ku7/WzZnnOwRKtLabwX?=
 =?us-ascii?Q?dcnPajUyWJmFjfJ1MsdPNqv4VdfZ4ir6nbacu2kRUsTZdYR54eaS6pi0ql67?=
 =?us-ascii?Q?vv+vsykTqbPfX4H0GMuA7wxWTXGifyxI5xuJyPy0cFv1D/1sJUh5mRF5zt7I?=
 =?us-ascii?Q?kUwneJGMqSEcNXebR+JVJgXgF0h73oh41pWAuCFwewUY3YLxrOs7b0c505hl?=
 =?us-ascii?Q?6hF7x+oc53CCVO04npLE7hieZF9z1EiR6H0dQjvY8Wi5BjQl5Gni5Ciqsqp3?=
 =?us-ascii?Q?S7R1EgIfoWjOLQV7uehGpR1R+wmMLs+8SYAW0iaoKGvdaB/wEzxfM9HWOVcT?=
 =?us-ascii?Q?Mxd1vCp9uEHMquz5jSSsWNRK4n/aeTHN19b+wmbEBII6pqawYio2xCwnZEDh?=
 =?us-ascii?Q?M6nAuUHJmHRgJSAmPzcCbGuMlx27XFp8tyV9jIoxYMexc2K/zR+FMV/cu9xp?=
 =?us-ascii?Q?DwBOo+5ilg/RXbenuuksL4kZdQvF4kZd8vz2B+o0PdHKD5K+sTV77YrAiUKD?=
 =?us-ascii?Q?8iWnt+piyv1nZmz7LIUTN7uemYqpRQugKhy6ZPSD3cSL311QuibGmOzzf8CQ?=
 =?us-ascii?Q?NBlp7ACHXStj6Am8Nn5h3e1QTL6zL/1nlb65Tv0RAPpJG2YOA7sik6zUQCzS?=
 =?us-ascii?Q?bLLE3uSzAkXJ/PhrPuWwFsiJ8txRDaszpSC87sG16JTRLVeU3C/pDH+dXjmq?=
 =?us-ascii?Q?7LQqiH30ZxegsIDfK8LncWVuXz9+oEfYx5sJICYoW0tE9pLYabWFjrt2LlFn?=
 =?us-ascii?Q?rbMtdjrcXLfPm+bhxVKz+Vr3vy+j1Jh5kypdDLpx6B5JISYJWWZZw2fLKXAa?=
 =?us-ascii?Q?biReNEUvZT7Pz7QJHOi5odC5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7B07CF8EB04D1F4486B952439B35BAFE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6704
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6157a3d7-ba97-45fc-e584-08d94524a277
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QrMGfbudJ52n0ZAk3tBcy76RhuIIzXhKozFDUcreozWZ3iONLGnKUHba4BEYOgZEK17YYwJq/CZHbfNyVcIm0Fnov3URpKRu1PprHCQhaA+cQ0gOKeKui7uW2lbjpFfi1mbXapYuEfxN13Iu+KGzD5DrBJd9XcI4b6VqHig35qlQ/AY0XVkVmJ7xqC2w9iVhabGA9urjfAkfYLAuJVpCpjsVEPuSWkBmC0HFfklRURfkh0BTHUX2L6GGw3fBzycNbWzfw4OdsMNFX9zSg254GiJWzhdXWg4AjoFB/fQDtGxh+XKgQEe9KxzJ2cV2YWKWL8n+QiBoDIVorTZde+b06BJehevTeMlDVLSEpg5HpCccVIYRvV7mHC9GpUq2z7lORLDs3kun6U4oGK/qjikUQ8DaHIjbGrBJy4BaktT2loYRo+VD2naO0yLMNQe4dMBljht6jPPNvhCbrP+oDHt5T2YK2RviICKBsllYKsCPMMy/KkqTXj8WRgw2gMSVloN/MPj6E9pMt/xPOAmwj4VSCTZjAZIvWWnmxhDPxvCWCXnvfXdPKMytTYSifsoNH+nrN7tR99jKBKa19dR6dy8ZNFzYqJG7WlL0cD4yvKfFYHeNJAw7pKqKRYcjCmwcE4SlRHRCx0k46xaxOutWjhtHpeHPe/uASBjtcIY3d1N5gZSYRQwGOVONmIxdH33VUVsjabYX5ntFwSWDEm7uyyqiLw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(46966006)(70206006)(2616005)(336012)(36860700001)(82310400003)(54906003)(53546011)(6486002)(6512007)(6506007)(33656002)(70586007)(478600001)(4326008)(8676002)(5660300002)(8936002)(2906002)(316002)(6862004)(26005)(36756003)(186003)(83380400001)(30864003)(47076005)(82740400003)(81166007)(86362001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 11:03:55.5266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c47d82f7-cd03-45af-2074-08d94524bde7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7132

Hi Julien,

> On 12 Jul 2021, at 11:16, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 29/06/2021 18:08, Bertrand Marquis wrote:
>> Define a sanitize_cpu function to be called on secondary cores to
>> sanitize the cpuinfo structure from the boot CPU.
>> The safest value is taken when possible and the system is marked tainted
>> if we encounter values which are incompatible with each other.
>> Call the sanitize_cpu function on all secondary cores and remove the
>> code disabling secondary cores if they are not the same as the boot core
>> as we are now able to handle this use case.
>> This is only supported on arm64 so cpu_sanitize is an empty static
>> inline on arm32.
>> This patch also removes the code imported from Linux that will not be
>> used by Xen.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/arm64/cpusanitize.c | 236 ++++++++++++++++++++++++-------
>>  xen/arch/arm/smpboot.c           |   5 +-
>>  xen/include/asm-arm/cpufeature.h |   9 ++
>>  xen/include/xen/lib.h            |   1 +
>>  4 files changed, 199 insertions(+), 52 deletions(-)
>> diff --git a/xen/arch/arm/arm64/cpusanitize.c b/xen/arch/arm/arm64/cpusa=
nitize.c
>> index 4cc8378c14..744006ca7c 100644
>> --- a/xen/arch/arm/arm64/cpusanitize.c
>> +++ b/xen/arch/arm/arm64/cpusanitize.c
>> @@ -97,10 +97,6 @@ struct arm64_ftr_bits {
>>  		.width =3D 0,				\
>>  	}
>>  -static void cpu_enable_cnp(struct arm64_cpu_capabilities const *cap);
>> -
>> -static bool __system_matches_cap(unsigned int n);
>> -
>>  /*
>>   * NOTE: Any changes to the visibility of features should be kept in
>>   * sync with the documentation of the CPU feature register ABI.
>> @@ -277,31 +273,6 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2=
[] =3D {
>>  	ARM64_FTR_END,
>>  };
>>  -static const struct arm64_ftr_bits ftr_ctr[] =3D {
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 =
*/
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT,=
 1, 1),
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IDC_SHIFT,=
 1, 1),
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_C=
WG_SHIFT, 4, 0),
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_E=
RG_SHIFT, 4, 0),
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DMINLINE_S=
HIFT, 4, 1),
>> -	/*
>> -	 * Linux can handle differing I-cache policies. Userspace JITs will
>> -	 * make use of *minLine.
>> -	 * If we have differing I-cache policies, report it as the weakest - V=
IPT.
>> -	 */
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_EXACT, CTR_L1IP_SHIFT, =
2, ICACHE_POLICY_VIPT),	/* L1Ip */
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_S=
HIFT, 4, 0),
>> -	ARM64_FTR_END,
>> -};
>=20
> I don't think this is should be dropped. Xen will need to know the safest=
 cacheline size that can be used for cache maintenance instructions.

I will surround those entries by #if 0 instead

>=20
>> -
>> -static struct arm64_ftr_override __ro_after_init no_override =3D { };
>> -
>> -struct arm64_ftr_reg arm64_ftr_reg_ctrel0 =3D {
>> -	.name		=3D "SYS_CTR_EL0",
>> -	.ftr_bits	=3D ftr_ctr,
>> -	.override	=3D &no_override,
>> -};
>> -
>>  static const struct arm64_ftr_bits ftr_id_mmfr0[] =3D {
>>  	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNE=
RSHR_SHIFT, 4, 0xf),
>>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_FCSE_S=
HIFT, 4, 0),
>> @@ -335,12 +306,6 @@ static const struct arm64_ftr_bits ftr_mvfr2[] =3D =
{
>>  	ARM64_FTR_END,
>>  };
>>  -static const struct arm64_ftr_bits ftr_dczid[] =3D {
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1,=
 1),
>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT=
, 4, 0),
>> -	ARM64_FTR_END,
>> -};
>=20
> Why is this dropped?

Same I will keep that with #if 0

>=20
>> -
>>  static const struct arm64_ftr_bits ftr_id_isar0[] =3D {
>>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE=
_SHIFT, 4, 0),
>>  	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DEBUG_=
SHIFT, 4, 0),
>> @@ -454,12 +419,6 @@ static const struct arm64_ftr_bits ftr_id_dfr1[] =
=3D {
>>  	ARM64_FTR_END,
>>  };
>>  -static const struct arm64_ftr_bits ftr_zcr[] =3D {
>> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
>> -		ZCR_ELx_LEN_SHIFT, ZCR_ELx_LEN_SIZE, 0),	/* LEN */
>> -	ARM64_FTR_END,
>> -};
>=20
> At some point we will support SVE in Xen. So any reason we would not want=
 to keep the code?

Same I will keep that with #if 0

>=20
>> -
>>  /*
>>   * Common ftr bits for a 32bit register with all hidden, strict
>>   * attributes, with 4bit feature fields and a default safe value of
>> @@ -478,17 +437,192 @@ static const struct arm64_ftr_bits ftr_generic_32=
bits[] =3D {
>>  	ARM64_FTR_END,
>>  };
>>  -/* Table for a single 32bit feature value */
>> -static const struct arm64_ftr_bits ftr_single32[] =3D {
>> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, 0, 32, 0),
>> -	ARM64_FTR_END,
>> -};
>> -
>> -static const struct arm64_ftr_bits ftr_raz[] =3D {
>> -	ARM64_FTR_END,
>> -};
>> -
>>  /*
>>   * End of imported linux structures
>>   */
>>  +static inline int __attribute_const__
>> +cpuid_feature_extract_signed_field_width(u64 features, int field, int w=
idth)
>> +{
>> +    return (s64)(features << (64 - width - field)) >> (64 - width);
>> +}
>=20
> Please avoid to mix Xen and Linux coding style in the same file.
>=20
> Also, this function and some others below seems to have been taken as-is =
from Linux. So this should at least be mentionned in the commit message.
>=20
> I would also consider to import them in a separate patch (or maybe in pat=
ch#2) so it is clear this is not "new" code.

I will move those in patch 2 and keep Linux code.

>=20
>> +
>> +static inline int __attribute_const__
>> +cpuid_feature_extract_signed_field(u64 features, int field)
>> +{
>> +    return cpuid_feature_extract_signed_field_width(features, field, 4)=
;
>> +}
>> +
>> +static inline unsigned int __attribute_const__
>> +cpuid_feature_extract_unsigned_field_width(u64 features, int field, int=
 width)
>> +{
>> +    return (u64)(features << (64 - width - field)) >> (64 - width);
>> +}
>> +
>> +static inline unsigned int __attribute_const__
>> +cpuid_feature_extract_unsigned_field(u64 features, int field)
>> +{
>> +    return cpuid_feature_extract_unsigned_field_width(features, field, =
4);
>> +}
>> +
>> +static inline u64 arm64_ftr_mask(const struct arm64_ftr_bits *ftrp)
>> +{
>> +    return (u64)GENMASK(ftrp->shift + ftrp->width - 1, ftrp->shift);
>> +}
>> +
>> +static inline int __attribute_const__
>> +cpuid_feature_extract_field_width(u64 features, int field, int width,
>> +                                  bool sign)
>> +{
>> +    return (sign) ?
>> +        cpuid_feature_extract_signed_field_width(features, field, width=
) :
>> +        cpuid_feature_extract_unsigned_field_width(features, field, wid=
th);
>> +}
>> +
>> +static inline int __attribute_const__
>> +cpuid_feature_extract_field(u64 features, int field, bool sign)
>> +{
>> +    return cpuid_feature_extract_field_width(features, field, 4, sign);
>> +}
>> +
>> +static inline s64 arm64_ftr_value(const struct arm64_ftr_bits *ftrp, u6=
4 val)
>> +{
>> +    return (s64)cpuid_feature_extract_field_width(val, ftrp->shift,
>> +                                                  ftrp->width, ftrp->si=
gn);
>> +}
>> +
>> +static s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 =
new,
>> +                                s64 cur)
>> +{
>> +    s64 ret =3D 0;
>> +
>> +    switch ( ftrp->type ) {
>> +    case FTR_EXACT:
>> +        ret =3D ftrp->safe_val;
>> +        break;
>> +    case FTR_LOWER_SAFE:
>> +        ret =3D new < cur ? new : cur;
>> +        break;
>> +    case FTR_HIGHER_OR_ZERO_SAFE:
>> +        if (!cur || !new)
>> +            break;
>> +        fallthrough;
>> +    case FTR_HIGHER_SAFE:
>> +        ret =3D new > cur ? new : cur;
>=20
> We have a macro max() defined in kernel.h.

Right I will use that instead.

>=20
>> +        break;
>> +    default:
>> +        BUG();
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void sanitize_reg(u64 *cur_reg, u64 new_reg, const char *reg_nam=
e,
>> +                        const struct arm64_ftr_bits *ftrp)
>> +{
>> +    int taint =3D 0;
>> +    u64 old_reg =3D *cur_reg;
>> +
>> +    for ( ; ftrp->width !=3D0 ; ftrp++ )
>> +    {
>> +        u64 mask;
>> +        s64 cur_field =3D arm64_ftr_value(ftrp, *cur_reg);
>> +        s64 new_field =3D arm64_ftr_value(ftrp, new_reg);
>> +
>> +        if ( cur_field =3D=3D new_field )
>> +            continue;
>> +
>> +        if ( ftrp->strict )
>> +            taint =3D 1;
>> +
>> +        mask =3D arm64_ftr_mask(ftrp);
>> +
>> +        *cur_reg &=3D ~mask;
>> +        *cur_reg |=3D (arm64_ftr_safe_value(ftrp, new_field, cur_field)
>> +                    << ftrp->shift) & mask;
>> +    }
>> +
>> +    if ( old_reg !=3D new_reg )
>> +        printk(XENLOG_DEBUG "SANITY DIF: %s 0x%"PRIx64" -> 0x%"PRIx64"\=
n",
>> +               reg_name, old_reg, new_reg);
>> +    if ( old_reg !=3D *cur_reg )
>> +        printk(XENLOG_DEBUG "SANITY FIX: %s 0x%"PRIx64" -> 0x%"PRIx64"\=
n",
>> +               reg_name, old_reg, *cur_reg);
>> +
>> +    if ( taint )
>> +    {
>> +        printk(XENLOG_WARNING "SANITY CHECK: Unexpected variation in %s=
.\n",
>> +                reg_name);
>> +        add_taint(TAINT_CPU_OUT_OF_SPEC);
>> +    }
>> +}
>> +
>> +
>> +/*
>> + * This function should be called on secondary cores to sanitize the bo=
ot cpu
>> + * cpuinfo.
>=20
> Can we renamed boot_cpu_data to system_cpuinfo (or something similar)? Th=
is would make clear this is not only the features for the boot CPU?

Ok I will do that.

>=20
>> + */
>> +void sanitize_cpu(const struct cpuinfo_arm *new)
>=20
> How about naming it to "update_system_features()"?

Ok

>=20
>> +{
>> +
>> +#define SANITIZE_REG(field, num, reg)  \
>> +    sanitize_reg(&boot_cpu_data.field.bits[num], new->field.bits[num], =
\
>> +                 #reg, ftr_##reg)
>> +
>> +#define SANITIZE_ID_REG(field, num, reg)  \
>> +    sanitize_reg(&boot_cpu_data.field.bits[num], new->field.bits[num], =
\
>> +                 #reg, ftr_id_##reg)
>> +
>> +#define SANITIZE_GENERIC_REG(field, num, reg)  \
>> +    sanitize_reg(&boot_cpu_data.field.bits[num], new->field.bits[num], =
\
>> +                 #reg, ftr_generic_32bits)
>> +
>> +    SANITIZE_ID_REG(pfr64, 0, aa64pfr0);
>> +    SANITIZE_ID_REG(pfr64, 1, aa64pfr1);
>> +
>> +    SANITIZE_ID_REG(dbg64, 0, aa64dfr0);
>> +
>> +    /* aux64 x2 */
>> +
>> +    SANITIZE_ID_REG(mm64, 0, aa64mmfr0);
>> +    SANITIZE_ID_REG(mm64, 1, aa64mmfr1);
>> +    SANITIZE_ID_REG(mm64, 2, aa64mmfr2);
>> +
>> +    SANITIZE_ID_REG(isa64, 0, aa64isar0);
>> +    SANITIZE_ID_REG(isa64, 1, aa64isar1);
>> +
>> +    SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
>> +
>> +    if ( cpu_feature64_has_el0_32(&boot_cpu_data) )
>> +    {
>> +        SANITIZE_ID_REG(pfr32, 0, pfr0);
>> +        SANITIZE_ID_REG(pfr32, 1, pfr1);
>> +        SANITIZE_ID_REG(pfr32, 2, pfr2);
>> +
>> +        SANITIZE_ID_REG(dbg32, 0, dfr0);
>> +        SANITIZE_ID_REG(dbg32, 1, dfr1);
>> +
>> +        /* aux32 x1 */
>=20
> What does this comment mean?

Leftover during dev that I should turn in proper comment.
It was there as I am not sanitizing one aux32 register.
Same goes for the comment before for aux64.

I will remove them.

>=20
>> +
>> +        SANITIZE_ID_REG(mm32, 0, mmfr0);
>> +        SANITIZE_GENERIC_REG(mm32, 1, mmfr1);
>> +        SANITIZE_GENERIC_REG(mm32, 2, mmfr2);
>> +        SANITIZE_GENERIC_REG(mm32, 3, mmfr3);
>> +        SANITIZE_ID_REG(mm32, 4, mmfr4);
>> +        SANITIZE_ID_REG(mm32, 5, mmfr5);
>> +
>> +        SANITIZE_ID_REG(isa32, 0, isar0);
>> +        SANITIZE_GENERIC_REG(isa32, 1, isar1);
>> +        SANITIZE_GENERIC_REG(isa32, 2, isar2);
>> +        SANITIZE_GENERIC_REG(isa32, 3, isar3);
>> +        SANITIZE_ID_REG(isa32, 4, isar4);
>> +        SANITIZE_ID_REG(isa32, 5, isar5);
>> +        SANITIZE_ID_REG(isa32, 6, isar6);
>> +
>> +        SANITIZE_GENERIC_REG(mvfr, 0, mvfr0);
>> +        SANITIZE_GENERIC_REG(mvfr, 1, mvfr1);
>> +#ifndef MVFR2_MAYBE_UNDEFINED
>> +        SANITIZE_REG(mvfr, 2, mvfr2);
>> +#endif
>> +    }
>> +}
>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>> index a1ee3146ef..8fdf5e70d3 100644
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -307,12 +307,14 @@ void start_secondary(void)
>>      set_processor_id(cpuid);
>>        identify_cpu(&current_cpu_data);
>> +    sanitize_cpu(&current_cpu_data);
>>      processor_setup();
>>        init_traps();
>>  +#ifndef CONFIG_ARM_64
>>      /*
>> -     * Currently Xen assumes the platform has only one kind of CPUs.
>> +     * Currently Xen assumes the platform has only one kind of CPUs on =
ARM32.
>>       * This assumption does not hold on big.LITTLE platform and may
>>       * result to instability and insecure platform (unless cpu affinity
>>       * is manually specified for all domains). Better to park them for
>> @@ -328,6 +330,7 @@ void start_secondary(void)
>>                 boot_cpu_data.midr.bits);
>>          stop_cpu();
>>      }
>> +#endif
>>        if ( dcache_line_bytes !=3D read_dcache_line_bytes() )
>>      {
>=20
> Any plan to drop this check?

Yes this should be done as a next patch in the serie once we valeted
The way to go for the base.

>=20
>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpuf=
eature.h
>> index ba48db3eac..ad34e55cc8 100644
>> --- a/xen/include/asm-arm/cpufeature.h
>> +++ b/xen/include/asm-arm/cpufeature.h
>> @@ -330,6 +330,15 @@ extern struct cpuinfo_arm boot_cpu_data;
>>    extern void identify_cpu(struct cpuinfo_arm *);
>>  +#ifdef CONFIG_ARM_64
>> +extern void sanitize_cpu(const struct cpuinfo_arm *);
>> +#else
>> +static inline void sanitize_cpu(const struct cpuinfo_arm *cpuinfo)
>> +{
>> +    /* Not supported on arm32 */
>> +}
>> +#endif
>> +
>>  extern struct cpuinfo_arm cpu_data[];
>>  #define current_cpu_data cpu_data[smp_processor_id()]
>>  diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
>> index 1198c7c0b2..c6987973bf 100644
>> --- a/xen/include/xen/lib.h
>> +++ b/xen/include/xen/lib.h
>> @@ -192,6 +192,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c=
);
>>  #define TAINT_ERROR_INJECT              (1u << 2)
>>  #define TAINT_HVM_FEP                   (1u << 3)
>>  #define TAINT_MACHINE_UNSECURE          (1u << 4)
>> +#define TAINT_CPU_OUT_OF_SPEC           (1u << 5)
>=20
> You want to also update at least print_tainted().

Oh yes I will fix that in the next version.

Cheers
Bertrand

>=20
>>  extern unsigned int tainted;
>>  #define TAINT_STRING_MAX_LEN            20
>>  extern char *print_tainted(char *str);
>=20
> --=20
> Julien Grall


