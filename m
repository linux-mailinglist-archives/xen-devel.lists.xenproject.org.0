Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90364DD4D8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 07:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291879.495717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV6Kc-0001me-9z; Fri, 18 Mar 2022 06:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291879.495717; Fri, 18 Mar 2022 06:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV6Kc-0001k5-6J; Fri, 18 Mar 2022 06:43:26 +0000
Received: by outflank-mailman (input) for mailman id 291879;
 Fri, 18 Mar 2022 06:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qgOC=T5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nV6Ka-0001jz-Mx
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 06:43:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2f45601-a686-11ec-853c-5f4723681683;
 Fri, 18 Mar 2022 07:43:20 +0100 (CET)
Received: from AM5PR0202CA0006.eurprd02.prod.outlook.com
 (2603:10a6:203:69::16) by AM9PR08MB6642.eurprd08.prod.outlook.com
 (2603:10a6:20b:2ff::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 06:43:18 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::c8) by AM5PR0202CA0006.outlook.office365.com
 (2603:10a6:203:69::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18 via Frontend
 Transport; Fri, 18 Mar 2022 06:43:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Fri, 18 Mar 2022 06:43:17 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Fri, 18 Mar 2022 06:43:17 +0000
Received: from 83db22eb5d58.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2FB6038B-5531-4BE1-B1B9-2F1F2B254B4B.1; 
 Fri, 18 Mar 2022 06:43:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83db22eb5d58.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Mar 2022 06:43:07 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VE1PR08MB5022.eurprd08.prod.outlook.com (2603:10a6:803:114::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 18 Mar
 2022 06:43:04 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be%7]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 06:43:04 +0000
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
X-Inumbo-ID: b2f45601-a686-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8ExwDFMxG9xiBTlUCLmlFgP/hRbM8+NEqQ6Whkrhuw=;
 b=KYScTXH6ShJ6HvvlUV0+uYDml9YKjCfjecAOdlNufYJah8asOAMj9L0a6jMMc15wNj4dUYED+oHAFUlQgie/K3AFDoGaBQx/o8e307A/0YNj+fccBkMgv/Fww/YDloST+rwjE/EBTahevkWU9GEthn8SzJJP4RZGWo8poXOyGfQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOh8lWewG4ksTJXITuLB/Y98ZYeVwgXPjOaDT9SM2KDodYzw6ZD3cLjWxoOGYufyvva1wpfpS/d/p19y8HNWZKopgOvBfniTgXhY8n0WG3UIHUXsvhhlOVPqdlnKg91JuzNN7Gjs/P6dssX658a3vOPKjiskx9ZILQjpu38+Xgjuth9FnPw//trUlSuqkR4yDBIn96V9w/G9AhAaa4oh6pO5VwzuEh92bTIQdclvvMoJ2JR8hPeZ4MWI06YJJgrqhq44LsWQyOdSYBOub1sYL/oCPjQxTstwMTX04rloKNH53kde0wzmVtvjjyrsVxxpAyDJw5w+rCBbtQkiVI4IxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8ExwDFMxG9xiBTlUCLmlFgP/hRbM8+NEqQ6Whkrhuw=;
 b=LX8Bxl5vh/TMhevdn04eW62R6rJEAj+qOaxyU2GKZzZeT5fPT7RJ0vkSgtvdcEvAMxHGRppu8wi6ODGhjWof9tQ6Jo5zAgbhaNGjUOuGI7LWeZIpUjkFA3bpF20el0icNBufpVWobKiQLfZMWumDukvHNL7qSv/+g41PJ+X10EmJgrar+wCPchu3ZqfNq7pKCytURpGRRd0zM8SHMv5U//ihMFAraRsSVUnKmLmsYFplEkJZy/WK6Lp7d54hWdyf9Qgi6067eiQ48ntBTOGUBtdXKgWZ+6Lb/S8/dJyDHUfbOw549xdbWWLRic9vpn0x/x9AQB1EeV47cEvr8Jtz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8ExwDFMxG9xiBTlUCLmlFgP/hRbM8+NEqQ6Whkrhuw=;
 b=KYScTXH6ShJ6HvvlUV0+uYDml9YKjCfjecAOdlNufYJah8asOAMj9L0a6jMMc15wNj4dUYED+oHAFUlQgie/K3AFDoGaBQx/o8e307A/0YNj+fccBkMgv/Fww/YDloST+rwjE/EBTahevkWU9GEthn8SzJJP4RZGWo8poXOyGfQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd
	<nd@arm.com>, Penny Zheng <penzhe01@a011292.shanghai.arm.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
Thread-Topic: [PATCH v1 02/13] xen/arm: introduce a special domain
 DOMID_SHARED
Thread-Index: AQHYNQ8BtyFeP2p9kkWMo7TCkVRwI6zEbXYAgAA7vYA=
Date: Fri, 18 Mar 2022 06:43:04 +0000
Message-ID:
 <DU2PR08MB7325E5A3B5A9BC5DA76692C4F7139@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-3-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2203171645450.3497@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203171645450.3497@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A921EC0126553640AD330E84A4AA8460.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 899b51a5-5902-4e9f-1f13-08da08aa95e4
x-ms-traffictypediagnostic:
	VE1PR08MB5022:EE_|VE1EUR03FT033:EE_|AM9PR08MB6642:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6642BBFF39ED78F1FC803B91F7139@AM9PR08MB6642.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6EKoXkQkCziMl+uevjS6cwZ2UuHIzEAAJFIREyRdKZw3R5xICtJk/peVYZkrBdQaEV5al4jEzaBuoyCGKeVU6G+ssU0T1uCoCbrYdveL3Xj1qwew8NODnnkkgqnt5J1fI6oBY2XvTHgli14p9UAM4agTl3ZKa1h6VB052A3b9QbefH8q0SMLwi6uCyZiOW1PuA3LIvKoXXjB8XI6GFg3VMGSASvf9en3BwO74sm3eUaVDwjp/dvR7qqz5XU3wfe2IusWi/SO5hiM4Vm8FWuKcGdGpe/uq9QruEJ9JXY64BqBGS46tCNZCBIW3TJinSNU6wePbi3dFvFAMxK3N5+j5rf1ERwqlnK6EEQL9A3pT2nV2KVpWOMfueeSR/purMSh8fEf77J3nfY7WGi9dXXfN7Eh5vw8kOKbeersgCaZUNRWR+MJnH8dSvu+BMV/fk3lD8s1UYFRgKy9NmAQycNuQjMKVcnu8GxqfyYLfvNUi0nB5GjfnmtSbspNNXVwpMFkPcxIvBMAQBU6cH+5C4buxMzJinVxUhrIH2umpPc6RqMmEjiAEhfmqjqdkfyyfgBxU/v1g50KbGq/kUfEF+D0UEf+g/VGbU5SA35Xu/HPuseGqezlykK9fWzKunG/JoMKAAAzjb3jOSdiNyQw6HLw4qFb7wI2cycAD4MUmfc4Q/LllFBUYmRY2znvreli7iKGfBJssmrdKJ7ZVLQwinAQjn/ryCZNG7rR3YDBdlMSdNI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(26005)(186003)(5660300002)(8936002)(66476007)(316002)(53546011)(122000001)(76116006)(66946007)(71200400001)(6916009)(54906003)(55016003)(6506007)(7696005)(4326008)(64756008)(8676002)(83380400001)(2906002)(30864003)(508600001)(9686003)(66446008)(86362001)(38100700002)(52536014)(38070700005)(33656002)(396324004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5022
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c1854d50-baff-419d-4cb6-08da08aa8dd4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3W5p3krBiB51TIKrHr/X5pfyodauKZ4OKzVoAA5MJ/RcCsoFpLCLUXmvCHMUFTA83W4Iq/EIBVisnblc843LqgNIwhJVx/awObOVlYPKTfU8hu22ryVBap9p5w7c+gLI+VYboygsAMsi4Y4bUWkvXIU9lddRs2iAuxPzYLDWZhE2+5C0fiVSgYKblVGsCVpDfDZ65iUxoBoFkF40w8EPb1lbSKdZa6RW7znQ/sVGgiqcZz0iHs6P795Nzq8H6pfyQOFaH12lYVJMGuGK7LpvA6ekuFg8FFLxaxrUf7vE8YAgKHEutXb8fvKgmJVYxmDGEoSlaQ4w5iQeV8gb6GFxa4fJxvS0dYVEJVIV75rsmaKu+kJW31HSjsPoh1g+6lKo48ByxY6otZ9WigMXi73DWKLYovcVUUaEMd++EJ39C1ahrUMAjsU5j7yu82ZA6ep9cHR+s1fMtBhZvRWTx+X1rtytnGjAbDU0hhd4oYv0UCixhqRA4HhA7UT2Ou3rGQKlI6EYcKWpZTc82cy40rOpTJjmEk6x9RSZw2//YjfD20xG9FHpvoS8Tjb9kLnv1raO8n90G9Wen7MuGMoThveJlEFPAu8HkpBj432lOe3JbZRkV7p7ple1xTNEzgRNu4CjRSmWKlNKoN2VkvKeVCZuznHYQAHIr/svcImBtg7pGTVW5ChymJfzDtSTnqUiDHaVSMQ8ojk+wsX0fLjUjeKsMQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(5660300002)(316002)(70586007)(54906003)(70206006)(8676002)(4326008)(6862004)(30864003)(26005)(36860700001)(82310400004)(81166007)(55016003)(508600001)(86362001)(336012)(83380400001)(9686003)(47076005)(33656002)(6506007)(53546011)(186003)(2906002)(356005)(7696005)(8936002)(52536014)(40460700003)(396324004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 06:43:17.7158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899b51a5-5902-4e9f-1f13-08da08aa95e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6642

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Friday, March 18, 2022 9:59 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: xen-devel@lists.xenproject.org; nd <nd@arm.com>; Penny Zheng
> <penzhe01@a011292.shanghai.arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
> Jan Beulich <jbeulich@suse.com>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain
> DOMID_SHARED
>=20
> On Fri, 11 Mar 2022, Penny Zheng wrote:
> > From: Penny Zheng <penzhe01@a011292.shanghai.arm.com>
> >
> > In case to own statically shared pages when owner domain is not
> > explicitly defined, this commits propose a special domain
> > DOMID_SHARED, and we assign it 0x7FF5, as one of the system domains.
> >
> > Statically shared memory reuses the same way of initialization with
> > static memory, hence this commits proposes a new Kconfig
> > CONFIG_STATIC_SHM to wrap related codes, and this option depends on
> static memory(CONFIG_STATIC_MEMORY).
>=20
> Why does it depend on CONFIG_STATIC_MEMORY? This is a genuine question,
> I am not trying to scope-creep the series. Is there an actual technical
> dependency on CONFIG_STATIC_MEMORY? If not, it would be super useful to
> be able to share memory statically even between normal dom0less guests (o=
f
> course it would be responsibility of the user to provide the right addres=
ses and
> avoid mapping clashes.) I know that some of our users have requested this
> feature in the past.
>=20

I may find a proper way to rephrase here. My poor English writing skill...
When I implemented domain on static allocation, statically configured guest=
 RAM is
treated as static memory in Xen and I introduced a few helpers to initializ=
e/allocate/free
static memory, like acquire_staticmem_pages, etc, and all these helpers are=
 guarded with
CONFIG_STATIC_MEMORY.=20
I want to reuse these helpers on static shared memory, so CONFIG_STATIC_SHM=
 depends
on CONFIG_STATIC_MEMORY.

So I'm not restricting sharing static memory between domain on static alloc=
ation, current
Implementation is also useful to normal dom0less guests.
=20
>=20
> > We intends to do shared domain creation after setup_virt_paging so
> > shared domain could successfully do p2m initialization.
> >
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > ---
> >  xen/arch/arm/Kconfig              |  7 +++++++
> >  xen/arch/arm/domain.c             | 12 ++++++++++--
> >  xen/arch/arm/include/asm/domain.h |  6 ++++++
> >  xen/arch/arm/setup.c              | 22 ++++++++++++++++++++++
> >  xen/common/domain.c               | 11 +++++++----
> >  xen/common/page_alloc.c           |  5 +++++
> >  xen/common/vsprintf.c             |  9 +++++----
> >  xen/include/public/xen.h          |  6 ++++++
> >  xen/include/xen/sched.h           |  2 ++
> >  9 files changed, 70 insertions(+), 10 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig index
> > ecfa6822e4..c54accefb1 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -106,6 +106,13 @@ config TEE
> >
> >  source "arch/arm/tee/Kconfig"
> >
> > +config STATIC_SHM
> > +       bool "Statically shared memory on a dom0less system" if UNSUPPO=
RTED
> > +       depends on STATIC_MEMORY
> > +       default n
> > +       help
> > +         This option enables statically shared memory on a dom0less sy=
stem.
> > +
> >  endmenu
> >
> >  menu "ARM errata workaround via the alternative framework"
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c index
> > 8110c1df86..1ff1df5d3f 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -44,6 +44,10 @@
> >
> >  DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> >
> > +#ifdef CONFIG_STATIC_SHM
> > +struct domain *__read_mostly dom_shared; #endif
>=20
> This one should probably go to xen/common/domain.c to stay close to the
> other special domains.
>=20

Ack. Thx

>=20
> >  static void do_idle(void)
> >  {
> >      unsigned int cpu =3D smp_processor_id(); @@ -703,7 +707,7 @@ int
> > arch_domain_create(struct domain *d,
> >      if ( is_idle_domain(d) )
> >          return 0;
> >
> > -    ASSERT(config !=3D NULL);
> > +    ASSERT(is_shared_domain(d) ? config =3D=3D NULL : config !=3D NULL=
);
> >
> >  #ifdef CONFIG_IOREQ_SERVER
> >      ioreq_domain_init(d);
> > @@ -712,12 +716,16 @@ int arch_domain_create(struct domain *d,
> >      d->arch.directmap =3D flags & CDF_directmap;
> >
> >      /* p2m_init relies on some value initialized by the IOMMU subsyste=
m */
> > -    if ( (rc =3D iommu_domain_init(d, config->iommu_opts)) !=3D 0 )
> > +    if ( (rc =3D iommu_domain_init(d, is_shared_domain(d) ? 0 :
> > + config->iommu_opts)) !=3D 0 )
> >          goto fail;
> >
> >      if ( (rc =3D p2m_init(d)) !=3D 0 )
> >          goto fail;
> >
> > +    /* DOMID_shared is sufficiently constructed after p2m initializati=
on. */
> > +    if ( is_shared_domain(d) )
> > +        return 0;
> > +
> >      rc =3D -ENOMEM;
> >      if ( (d->shared_info =3D alloc_xenheap_pages(0, 0)) =3D=3D NULL )
> >          goto fail;
> > diff --git a/xen/arch/arm/include/asm/domain.h
> > b/xen/arch/arm/include/asm/domain.h
> > index c56f6e4398..ea7a7219a3 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -31,6 +31,12 @@ enum domain_type {
> >
> >  #define is_domain_direct_mapped(d) (d)->arch.directmap
> >
> > +#ifdef CONFIG_STATIC_SHM
> > +extern struct domain *dom_shared;
> > +#else
> > +#define dom_shared NULL
> > +#endif
>=20
> I think this should probably go to xen/include/xen/mm.h to stay close to =
the
> others (dom_xen, dom_io and dom_cow).
>=20

Ack, thx

>=20
> >  /*
> >   * Is the domain using the host memory layout?
> >   *
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c index
> > d5d0792ed4..f6a3b04958 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -855,6 +855,20 @@ static bool __init is_dom0less_mode(void)
> >      return ( !dom0found && domUfound );  }
> >
> > +#ifdef CONFIG_STATIC_SHM
> > +static void __init setup_shared_domain(void) {
> > +    /*
> > +     * Initialise our DOMID_SHARED domain.
> > +     * This domain owns statically shared pages when owner domain is n=
ot
> > +     * explicitly defined.
> > +     */
> > +    dom_shared =3D domain_create(DOMID_SHARED, NULL, CDF_directmap);
> > +    if ( IS_ERR(dom_shared) )
> > +        panic("Failed to create d[SHARED]: %ld\n",
> > +PTR_ERR(dom_shared)); } #endif
> > +
> >  size_t __read_mostly dcache_line_bytes;
> >
> >  /* C entry point for boot CPU */
> > @@ -1022,6 +1036,14 @@ void __init start_xen(unsigned long
> boot_phys_offset,
> >      apply_alternatives_all();
> >      enable_errata_workarounds();
> >
> > +#ifdef CONFIG_STATIC_SHM
> > +    /*
> > +     * This needs to be called **after** setup_virt_paging so shared
> > +     * domains could successfully do p2m initialization.
>           ^ domain
>=20
> I take you are talking about DOMID_SHARED rather than any domain sharing
> memory statically. Maybe it clearer if you say "so DOMID_SHARED could
> successfully do p2m initialization".
>=20

Ack, thx.

>=20
> > +     */
> > +    setup_shared_domain();
> > +#endif
> > +
> >      /* Create initial domain 0. */
> >      if ( !is_dom0less_mode() )
> >          create_dom0();
> > diff --git a/xen/common/domain.c b/xen/common/domain.c index
> > 3742322d22..5cdd0b9f5b 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -643,11 +643,14 @@ struct domain *domain_create(domid_t domid,
> >
> >      rangeset_domain_initialise(d);
> >
> > -    /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently construct=
ed. */
> > -    if ( is_system_domain(d) && !is_idle_domain(d) )
> > +    /*
> > +     * DOMID_{XEN,IO,etc} (other than IDLE and DOMID_shared) are
> > +     * sufficiently constructed.
> > +     */
> > +    if ( is_system_domain(d) && !is_idle_domain(d) &&
> > + !is_shared_domain(d) )
> >          return d;
> >
> > -    if ( !is_idle_domain(d) )
> > +    if ( !is_idle_domain(d) && !is_shared_domain(d) )
> >      {
> >          if ( !is_hardware_domain(d) )
> >              d->nr_pirqs =3D nr_static_irqs + extra_domU_irqs; @@ -663,=
7
> > +666,7 @@ struct domain *domain_create(domid_t domid,
> >          goto fail;
> >      init_status |=3D INIT_arch;
> >
> > -    if ( !is_idle_domain(d) )
> > +    if ( !is_idle_domain(d) && !is_shared_domain(d) )
> >      {
> >          watchdog_domain_init(d);
> >          init_status |=3D INIT_watchdog; diff --git
> > a/xen/common/page_alloc.c b/xen/common/page_alloc.c index
> > f8749b0787..e5e357969d 100644
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -2616,6 +2616,11 @@ struct domain *get_pg_owner(domid_t domid)
> >
> >      switch ( domid )
> >      {
> > +#ifdef CONFIG_STATIC_SHM
> > +    case DOMID_SHARED:
> > +        pg_owner =3D rcu_lock_domain(dom_shared);
> > +        break;
> > +#endif
> >      case DOMID_IO:
> >          pg_owner =3D rcu_lock_domain(dom_io);
> >          break;
> > diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c index
> > b278961cc3..a22854001b 100644
> > --- a/xen/common/vsprintf.c
> > +++ b/xen/common/vsprintf.c
> > @@ -359,10 +359,11 @@ static char *print_domain(char *str, const char
> > *end, const struct domain *d)
> >
> >      switch ( d->domain_id )
> >      {
> > -    case DOMID_IO:   name =3D "[IO]";   break;
> > -    case DOMID_XEN:  name =3D "[XEN]";  break;
> > -    case DOMID_COW:  name =3D "[COW]";  break;
> > -    case DOMID_IDLE: name =3D "[IDLE]"; break;
> > +    case DOMID_IO:     name =3D "[IO]";     break;
> > +    case DOMID_XEN:    name =3D "[XEN]";    break;
> > +    case DOMID_COW:    name =3D "[COW]";    break;
> > +    case DOMID_IDLE:   name =3D "[IDLE]";   break;
> > +    case DOMID_SHARED: name =3D "[SHARED]"; break;
> >          /*
> >           * In principle, we could ASSERT_UNREACHABLE() in the default =
case.
> >           * However, this path is used to print out crash information,
> > which diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> > index e373592c33..2e00741f09 100644
> > --- a/xen/include/public/xen.h
> > +++ b/xen/include/public/xen.h
> > @@ -612,6 +612,12 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
> >  /* DOMID_INVALID is used to identify pages with unknown owner. */
> >  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
> >
> > +/*
> > + * DOMID_SHARED is used as the owner of statically shared pages, when
> > + * owner is not explicitly defined.
> > + */
> > +#define DOMID_SHARED         xen_mk_uint(0x7FF5)
> > +
> >  /* Idle domain. */
> >  #define DOMID_IDLE           xen_mk_uint(0x7FFF)
> >
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h index
> > 24a9a87f83..2fb236f4ea 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -618,6 +618,8 @@ static inline bool is_system_domain(const struct
> domain *d)
> >      return d->domain_id >=3D DOMID_FIRST_RESERVED;  }
> >
> > +#define is_shared_domain(d) ((d)->domain_id =3D=3D DOMID_SHARED)
> > +
> >  #define DOMAIN_DESTROYED (1u << 31) /* assumes atomic_t is >=3D 32 bit=
s
> > */  #define put_domain(_d) \
> >    if ( atomic_dec_and_test(&(_d)->refcnt) ) domain_destroy(_d)
> > --
> > 2.25.1
> >

Cheers,
---
Penny Zheng

