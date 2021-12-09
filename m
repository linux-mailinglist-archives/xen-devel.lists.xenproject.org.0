Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC5946E67D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 11:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242887.420042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGXR-000345-3m; Thu, 09 Dec 2021 10:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242887.420042; Thu, 09 Dec 2021 10:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGXQ-00030f-WA; Thu, 09 Dec 2021 10:20:33 +0000
Received: by outflank-mailman (input) for mailman id 242887;
 Thu, 09 Dec 2021 10:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/Bx=Q2=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mvGXO-0002hL-Ot
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 10:20:30 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe09::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1c7821a-58d9-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 11:20:29 +0100 (CET)
Received: from AM6PR08CA0024.eurprd08.prod.outlook.com (2603:10a6:20b:b2::36)
 by PAXPR08MB6655.eurprd08.prod.outlook.com (2603:10a6:102:15d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Thu, 9 Dec
 2021 10:20:14 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::26) by AM6PR08CA0024.outlook.office365.com
 (2603:10a6:20b:b2::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11 via Frontend
 Transport; Thu, 9 Dec 2021 10:20:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Thu, 9 Dec 2021 10:20:13 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Thu, 09 Dec 2021 10:20:13 +0000
Received: from f3985fa16342.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A28806EB-F230-4D09-A2C9-783E02B26BB1.1; 
 Thu, 09 Dec 2021 10:19:58 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3985fa16342.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Dec 2021 10:19:58 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6405.eurprd08.prod.outlook.com (2603:10a6:20b:332::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 10:19:56 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e%6]) with mapi id 15.20.4734.024; Thu, 9 Dec 2021
 10:19:56 +0000
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
X-Inumbo-ID: a1c7821a-58d9-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXN8hJWdCy0TM2M9Ap9xBzUjFeqpvMZ2r4ODIIAjWOk=;
 b=pbDg7AoJS6IvhFayjT6RTqcdrws8xka7Vfw8GZgjLi95NWAXSQ6IDALhbLS7YtEFEyffH8DbpUtCzRVJWb89qCNpfL/ZhPdzpyow4nSrXnK3ok88qaCuKI3+f8ueluq5QZapJXUFpDRljNEIc5+zL1oli+/nKnDqP0NIEDgdQ/k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 749b127b722a2845
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brtuJCtZE6sUyelrBFQQDnaf1u2SQuMrgo3N3QoWjZvAWWfJapIPDVuLRCYurLv7gyoNwpsSxSplo1jvKQQW/2u33oc3sBO9fWgd3+8Hiih4zyxrFxW4RPWwspCfGXcdUv3C38vPogjklS/K7KuppM1NqFUa+GW+fPw2GQA+7pdX99HZz6N1++zvFxGLwH6vWt4Gc31K+0BjFcOttEQZLMbzmOF0WWTSRb8k57NgkvUhOghQwi4oB7c1XISfA59aGF18UqH6st/ma98qxV8JIWCWvPnDTdexvFr7rfzGJGX+QBEkk5GpalCh5sO3gApPqZHB3LoqLur6E2S7dEIUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXN8hJWdCy0TM2M9Ap9xBzUjFeqpvMZ2r4ODIIAjWOk=;
 b=m1k/czAmQun2G6TVzDyQqdVc4IbIopQ9GOgVAby2SF7iWNPGHG+en6h0IlxfmEISMlf5m3CjNeyqgtmqkNFdhdPrP0Km8qbHes1tqwVGnmfMxIbKZAjWW95O+4qjoEspcdqxydIkQWH3GBz8X+lbA72rgs0kbwxtyWBhFx0Dk7+/cTmq1bfziggtOhw8QD059/WKHlFmSCDAoI211LmQzyrzVf4gP7AM0EptUR/PGwNodj4SFiD66HKQ6Fo6QIiM0ufxw3qbxeGSTMsLQswdElbQxhofAycosE+DA3OBcvn5pDJpNrKTLZSbRIuBLpdUebBomoLKI4k7fbM25uwOVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXN8hJWdCy0TM2M9Ap9xBzUjFeqpvMZ2r4ODIIAjWOk=;
 b=pbDg7AoJS6IvhFayjT6RTqcdrws8xka7Vfw8GZgjLi95NWAXSQ6IDALhbLS7YtEFEyffH8DbpUtCzRVJWb89qCNpfL/ZhPdzpyow4nSrXnK3ok88qaCuKI3+f8ueluq5QZapJXUFpDRljNEIc5+zL1oli+/nKnDqP0NIEDgdQ/k=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "artem_mygaiev@epam.com"
	<artem_mygaiev@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PATCH v8 4/4] xen/arm: do not map PCI ECAM and MMIO space to
 Domain-0's p2m
Thread-Topic: [PATCH v8 4/4] xen/arm: do not map PCI ECAM and MMIO space to
 Domain-0's p2m
Thread-Index: AQHX7M6EjMHseeuB70ePU8gARpHGAqwp8wGA
Date: Thu, 9 Dec 2021 10:19:55 +0000
Message-ID: <53D00092-2D4E-4142-91DA-2D49FE58F0B3@arm.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
 <20211209072918.460902-5-andr2000@gmail.com>
In-Reply-To: <20211209072918.460902-5-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d04e3f4c-32f0-4dd5-553e-08d9bafd7d2d
x-ms-traffictypediagnostic:
	AS8PR08MB6405:EE_|VE1EUR03FT032:EE_|PAXPR08MB6655:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB665579E9AB10D58FD6B40AAEFC709@PAXPR08MB6655.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0HaM+9xjUg7+T1Tnfoyx5m6FHoAPPf1gwVhQFpW4xKWslBvVxSRdTI4UInJ002WMkvrbBUAcJC/ZvkforAF+DKuqetnQgne3oxVPGg7mAmJw4gMjpxT3R0nHv7Km4yP/rtYbjbFbSNDtrE97YBppirx3C0QHdLujwG5IRUi4smRcUFsEaivdKVh+WlrTv39z7/tg6ZivtNOVBkhcnzblbjLmH9mdkyhKwsI6+bKPRVFymZSxId+vtXX81xKItpVS9fm956V/fgLrftQV0CyeOs4ctxrG9Bnc6LbyhwC9JogbY/e8gYsQpfD3kVGONOeB8BAZS+ec+D/YtbKlyJU5WTv1xxlgKXYuJI+NXmzzDShfGdD3w/kr1lqnYYTijzgfdDMtumU5Vl+8kUhBDvlFFxkhTa0TKhKH1U05hqGKUbBS/4cp8Eykq2BrER3A3OfQdr41zssJHZBcgqVlXEmmfjhJfaq+Qwt25XcSXYLeA2ogtzjR7LH7XS2Sa+ok7wQRhuj/B1jTRQNeav/9RCJIdcHy9dNTfoaNm+LoU3qOGEoB21wFGFslCkYxKWDtpWDO04vq6o6rH3EzzhkupDV+ODnMQx7OxDr95+rzG02sHJcwjjQsoujACQf0fox7FMPYjqNSVasUao/EwhbsipzhPkFUhUZLgk+05Bz/Y4wkoGg5ivaM9BDc+YpMtBV1l9Idoss1f6t43iiUrBtMFOdcTUn0G4dU5qJMQeEHdHi1jLb6cdezyLmgEJ6QRLuNhtCPbWDUg8sJ8CIs3A0qLjoLLXK+/R4c23ClC+0CdRr9x8eAt8YyNEreniFshlya/L1xvbsm0knMzU97DsXuAG1rZghY/Xh2wz0Yqp2Pr6Hjxs8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(316002)(53546011)(26005)(71200400001)(38070700005)(66476007)(66446008)(91956017)(186003)(966005)(36756003)(4326008)(6916009)(508600001)(86362001)(8676002)(8936002)(6486002)(2906002)(5660300002)(6512007)(33656002)(54906003)(83380400001)(76116006)(38100700002)(64756008)(2616005)(66946007)(122000001)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <59241971179F774790FAD0F9FA2DD7C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6405
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86502276-c9cf-4d34-f92f-08d9bafd727f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wNQ4u6FNIbsul13vl+JmgwQU8w8v9of719CMZiSzPurxHEZSjw/S9IE0zUhEg1Nhr+D+DQl8FVzL30Z8uBqnHbLKHhWkFZHyfhd0fZRvn6s2anAKz1FfSx6RqFvzwnQrKRLqutbqwlI3tknt7uwbQAara1cXPE7wBDGv/757+ZOBcoEB0Pg7cmqLov3alAYPCHrcwetzW+HuwM5pYWMXQdQMXiJHCH7LMHtBM2HFRgCc4MSHccifMWCJSvTZQTvPeeajJivr5kA7YaQNfhrui9PJsnv8bEbcEY58i7uELK5u35uU6cLO8EJs2HykgjWvZysC3fFJp9xsDRwcLb5JPIsLAUuwB1MXiRRN5GBkXtwtFXqFPt91uaFF8hyhHsa47wwaitcrpDO3fXKKkt60PzXQ6+9zF5SQCR8ANdeck5dpbrCZHy/NEwbuyj1Qd0gquc8H+cVliOWh4niOI5KjWfWZsOJidhnZQ70nEuw7E433oY7JKO+Izc/XaJ5MaTMh8R7snkmG3Q38Blwhcl1G2xTl4GbZIjxm5/FiULDqLdJ1KsQnY28LL7+cbL+C6tAjIAfH8LX+s2yT5SIEUustVdLZdlMTomCFf3hpEXYC47VjrmhMW7jURmayrzkl9Sw8oePSBmPn7Pc/ns/Vu30WWnKQO5xtzxUO9zzHnzkpzOuNMYG+wym4QcJLg4uwJLo5BvA32JZfg6JvXSLXtg2fjAVcKt3hf1wptZoTiWhpv3+AvbptpuFvDwzlMYQHFRUYukFcVMzCMVFGPTw9xNfZG6dlBXWRZ5zLxXcD70eurGkGTSorChZEcbRhSRVsbz+nLkDmzm0D5suwWeRL/fw0dRRyG92OgmbFbJLxPz9ebPYOnYk6gxiCYJJg3nIf54QQlwlWwGj/z0yury/xSwIsWQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(6486002)(4326008)(36756003)(2616005)(54906003)(8936002)(33656002)(107886003)(47076005)(6512007)(6862004)(5660300002)(83380400001)(70586007)(8676002)(2906002)(70206006)(82310400004)(81166007)(40460700001)(53546011)(6506007)(356005)(316002)(336012)(86362001)(966005)(186003)(508600001)(36860700001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 10:20:13.8001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d04e3f4c-32f0-4dd5-553e-08d9bafd7d2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6655

Hi Oleksandr,

> On 9 Dec 2021, at 7:29 am, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> PCI host bridges are special devices in terms of implementing PCI
> passthrough. According to [1] the current implementation depends on
> Domain-0 to perform the initialization of the relevant PCI host
> bridge hardware and perform PCI device enumeration. In order to
> achieve that one of the required changes is to not map all the memory
> ranges in map_range_to_domain as we traverse the device tree on startup
> and perform some additional checks if the range needs to be mapped to
> Domain-0.
>=20
> The generic PCI host controller device tree binding says [2]:
> - ranges: As described in IEEE Std 1275-1994, but must provide
>          at least a definition of non-prefetchable memory. One
>          or both of prefetchable Memory and IO Space may also
>          be provided.
>=20
> - reg   : The Configuration Space base address and size, as accessed
>          from the parent bus.  The base address corresponds to
>          the first bus in the "bus-range" property.  If no
>          "bus-range" is specified, this will be bus 0 (the default).
>=20
> From the above none of the memory ranges from the "ranges" property
> needs to be mapped to Domain-0 at startup as MMIO mapping is going to
> be handled dynamically by vPCI as we assign PCI devices, e.g. each
> device assigned to Domain-0/guest will have its MMIOs mapped/unmapped
> as needed by Xen.
>=20
> The "reg" property covers not only ECAM space, but may also have other
> then the configuration memory ranges described, for example [3]:
> - reg: Should contain rc_dbi, config registers location and length.
> - reg-names: Must include the following entries:
>   "rc_dbi": controller configuration registers;
>   "config": PCIe configuration space registers.
>=20
> This patch makes it possible to not map all the ranges from the
> "ranges" property and also ECAM from the "reg". All the rest from the
> "reg" property still needs to be mapped to Domain-0, so the PCI
> host bridge remains functional in Domain-0. This is done by first
> skipping the mappings while traversing the device tree as it is done for
> usual devices and then by calling a dedicated pci_host_bridge_mappings
> function which only maps MMIOs required by the host bridges leaving the
> regions, needed for vPCI traps, unmapped.
>=20
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg00777=
.html
> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/host=
-generic-pci.txt
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/hisi=
licon-pcie.txt
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
 =

