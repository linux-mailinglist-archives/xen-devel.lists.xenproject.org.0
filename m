Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C815E2D413C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 12:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48168.85173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxoY-0005um-Js; Wed, 09 Dec 2020 11:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48168.85173; Wed, 09 Dec 2020 11:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxoY-0005uN-GF; Wed, 09 Dec 2020 11:39:22 +0000
Received: by outflank-mailman (input) for mailman id 48168;
 Wed, 09 Dec 2020 11:39:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kmxoW-0005uF-Rm
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 11:39:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 858938e4-3ed7-45cd-8624-c3dbaa3c58b5;
 Wed, 09 Dec 2020 11:39:19 +0000 (UTC)
Received: from DB6P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::11) by
 AM6PR08MB3510.eurprd08.prod.outlook.com (2603:10a6:20b:48::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Wed, 9 Dec 2020 11:39:17 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::2) by DB6P191CA0001.outlook.office365.com
 (2603:10a6:6:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 11:39:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 11:39:17 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Wed, 09 Dec 2020 11:39:17 +0000
Received: from b97061682d90.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE20DFE9-1925-41A5-B5E3-14C962CC0C21.1; 
 Wed, 09 Dec 2020 11:39:01 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b97061682d90.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 11:39:01 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4249.eurprd08.prod.outlook.com (2603:10a6:10:c6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Wed, 9 Dec
 2020 11:39:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 11:39:00 +0000
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
X-Inumbo-ID: 858938e4-3ed7-45cd-8624-c3dbaa3c58b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3BoWmywItlVr6Eflpd6/88DyyjdT9NO8dU6TUnBCDk=;
 b=e2mTMZqkSCrMtbq9/M8faY1QAR/OTf9YcHWJFY2t9l+ai/97M3uiHCkoabS5oj2JQFwJI0gPIUs6aPp9OCNLYJqcVptUjc+FQ7vl9i7aS/Rxt8g2OApEQyPt4mVZcGO+YjPP/3WPeZlYI6OPYis6qIZMxYcbzV46PVf3hy7ZPOw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5328e6b1c559be22
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms/w3Yx9qnayFBa39tWM3d5Dnh3hKVwvYiLGsIM0eMWJq500GHgYqCyl2gNt4zhSXyxN3HeqkAzELzdPPoCXHBUvlEARc6IDQxvEDx+n8XZ8VocHy+KOXBnhMVapFZVXjOEkiPioh7i+up5QkbKDYeydptqfgeXph1yocFC5Oc7a5snkdS0pER/clAAeCNT5dN/BQskdMFBG1xPo6AvF0LjAdpjlwSja3WX2fnfAvE8ijnlLeqSdiNxJFuPD0Co3WvoVR9s4YjBzrDKjQ3cqUNSRMregZ5Ka0X3adLB45294tyoSOZMDxELbFVyKWSBzahqI0ZbZwFUmT4Mv++bYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3BoWmywItlVr6Eflpd6/88DyyjdT9NO8dU6TUnBCDk=;
 b=nbfAy2edLYUFtxKO+xz4QBPuCSSq6yjIFmWsLBVcv2r6lG/rJgNITNV+nzKRnajDOuoPEZzv0SOZFjtnTpWKUwFRU7ojwTgMTg5aMfG04nE9qFNfi4oeOVRuI671w2o66e85cCgmLrAhlj0MbU53+f3zlXaiydvWiTfNRfG/fSvbNq1mwT+PpP++UHcNbV7qLhLdxiIszsq+l1UQIkenu1PKaenZElDzrXM5oSGejGyCVZImG3JJs3bio1A6e4cvBaE0OcJ4EHQPHfAoO/PjTFDIvemvxOgJi33UEdqfhUJKMbV60Ee1mStIGGuvrkC5sbUddepWU2Edg/7K8YOSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3BoWmywItlVr6Eflpd6/88DyyjdT9NO8dU6TUnBCDk=;
 b=e2mTMZqkSCrMtbq9/M8faY1QAR/OTf9YcHWJFY2t9l+ai/97M3uiHCkoabS5oj2JQFwJI0gPIUs6aPp9OCNLYJqcVptUjc+FQ7vl9i7aS/Rxt8g2OApEQyPt4mVZcGO+YjPP/3WPeZlYI6OPYis6qIZMxYcbzV46PVf3hy7ZPOw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/8] lib: move list sorting code
Thread-Topic: [PATCH v3 3/8] lib: move list sorting code
Thread-Index: AQHWwax1PUiQEQiqDESCXdsiG9mv36nuvGuA
Date: Wed, 9 Dec 2020 11:39:00 +0000
Message-ID: <1883EED6-2257-4B43-AD07-EA28601F6B96@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <9e855f2f-c654-6515-ae4f-9c69859c1c88@suse.com>
In-Reply-To: <9e855f2f-c654-6515-ae4f-9c69859c1c88@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 228589ee-aff9-43e4-f741-08d89c370faa
x-ms-traffictypediagnostic: DBBPR08MB4249:|AM6PR08MB3510:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3510C354E00F36FE32C7FA3D9DCC0@AM6PR08MB3510.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PqcO0MVi9opndKDECOSOsMSPE/0QRZ1TYauNVRE52YZR4UaCyiGhnSN/0qYRvckGIijUciT0iw7fxvSG3nwN40HfPg4FExi/ldYoJZMWPpd7bAQO9D13IjO9gRyzaOKLlrpzrKtn/29k2bl3TiCUW4eSt8pBdIW/jsxxgKVPHCiXOKyUBFzXS9MqQ1cgqJBBQssjVi8Cu1fjEj+P3BLw1tJC/1HWDZhWikIvDa2vjPp/qvMit0gPGRgnxsdUGaGrgkVubDmfrBGQhABADtaLL6zZ9bQDqMl5ZxUSQs+wLrAGPwDp+OjN6Hz+tCbE+o1feH3yPm07jKe/WQtesEmJIRGAHBIXqZXS41uY6jTgWFSxxCHy6LBP+2B69gHdcfGOqWo5/JVmfHhu+XWhpV0RBWncpmmqp8oLuGRNGk8YZj3AcB3AH1nVV9vzZg3ZAUmkSWaCd0kUorsMu24Io98+vQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(8676002)(26005)(8936002)(54906003)(33656002)(53546011)(6506007)(186003)(64756008)(4326008)(83380400001)(6916009)(36756003)(66446008)(66476007)(5660300002)(2906002)(71200400001)(6512007)(6486002)(66946007)(76116006)(91956017)(66556008)(2616005)(508600001)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?yH30vFNdvyPajsAZEV8IWPE0FE7AuPA1IZxwdJRSY6E7fefSGvBCKW/TAhyS?=
 =?us-ascii?Q?UU0qrR2Go88WRktkulBtOANy+nkxxjmAMZN/IzugxAkd3t5EpCJTYNspL9wb?=
 =?us-ascii?Q?IsOXLv7HdJkIFsitSbYHUb6OLSsPzaZ0tniMxz/tgdDndRWKYozJ3ErXaSbL?=
 =?us-ascii?Q?PNb4hN3n2x51WnSZkrnqqisvtrd4J9nm5vHsZPtA2TuWzQoX3gfvwq0B8FZx?=
 =?us-ascii?Q?cV8zuDHCybQYyNB7umcpaVLnENa5Aw9Ef19iVK/XNOjgNARbeJNMnwwk5euL?=
 =?us-ascii?Q?W1kkrP+w/AybATNOiZdJv5f4XD1RfYp5XxIIjzYTvfEEOxwAmU3EeP0UjkE0?=
 =?us-ascii?Q?YV3hLy8eSENtWOj2LbjGIneBMzSrp4oJjdkKOpJRi6hgigqJK/tyIt2M9LkZ?=
 =?us-ascii?Q?bs0oWDi8iTsAZ/4VjlS+9Y8R3uCCGqEfQsmoqi87SZDzMOq2PydzrDSCPmSr?=
 =?us-ascii?Q?kkN0XayfQzXhn5kxyzmvGduL+e87lwyi9fR8hneX2Ry7gs+r42akQeFFDqT9?=
 =?us-ascii?Q?WAWs/83MJuBKybbUSCTpPMuwrgt48RmhnGa1wmnNkoXLJBiRfAbfL6OQedtl?=
 =?us-ascii?Q?5OX7b/VtHB16m2dAxAv7RxPneMIL0t4nZ/x0WgxQfuM7+dNEOmLs5X5KlUcw?=
 =?us-ascii?Q?lJ3xsoV5EgBSA3LSWsPxyt5skIxsM/mKkACFVFJX31fZDdDVZQcpQqWZTFJR?=
 =?us-ascii?Q?p3TYP54MkhkZeVAQ8YJ/wzk3SXKEUgrpCMY95i4+2pHtoP0TeoR77woyqf6f?=
 =?us-ascii?Q?n2PZYRvTWYJLclvTy7bbryvUGlW0VVQGvGeZrnK44gY4El+MRRtNBeKoxvgm?=
 =?us-ascii?Q?mRW2hGoWCMqx4qBkMkf/tYdKqLzqkI1t8Ym+/1SlGgF4bOFhHG1XlUIu21c5?=
 =?us-ascii?Q?wRETXgW5s6y9IqN5dOrWZ/GdiLSiRoXeZG+r1ZDNkzB1/lRsv+jzBftpeF51?=
 =?us-ascii?Q?mPCL1oTby5nDvX3jWS3oyp41jZlg1UOURPL8M4zKn5ztO2spaznhb410OeRr?=
 =?us-ascii?Q?H7gS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <10CCACDF08CF7947B69F55AC2FD1DB79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4249
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3c823b4-5cd5-4dd6-572e-08d89c370572
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	en6BZbyaIu6bPv/cal06olGh7iOyCliVEYdqvrgBUEOfyKtbL++Tr5XKjnzE7dbikvJ8ptJ31JE6C4jTjfjt1PEGcpTN0t9BMp0cHiMu+DeUGR7A2b9XlcH09ad9z24M5EoJUuVOOko8lHZwDtjfYpe90JTlhR5IIqHc2b2JWhdZeqJtauQZTUdUv2KLZ1uwFHB5m0e2obyWuK6Vtu+uZGGZizYyKP6IHACMHzGCbKCpq0iS6HWSNImZJOsEA2cQ/w5NYW1S2wxKjXoolgBKRoHUbT0vmEaUN5Ldv8C0S+V6BmgiBKhrVd6BU0t3J4zxwZDBmnzmHJzUKz6jY6Pt+EIUKeN4jD6qObQDGr5F7NIqvEItksolsnkkWJnG3Dx8YUdcUKpqJXmK+2IaoZj8E+y6ixesVHi7ZnwKHh7Na3zqLk8rObFuCSLhGsxaHTWb4eRIF83WG6Wc+4W34CyI3HnugNwJafE0hYvR5PMxQs4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(2616005)(86362001)(82740400003)(336012)(4326008)(81166007)(107886003)(6506007)(6512007)(53546011)(26005)(316002)(6486002)(47076004)(36756003)(54906003)(2906002)(33656002)(478600001)(70206006)(5660300002)(70586007)(82310400003)(6862004)(186003)(8676002)(356005)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 11:39:17.2852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 228589ee-aff9-43e4-f741-08d89c370faa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3510



> On 23 Nov 2020, at 15:21, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Build the source file always, as by putting it into an archive it still
> won't be linked into final binaries when not needed. This way possible
> build breakage will be easier to notice, and it's more consistent with
> us unconditionally building other library kind of code (e.g. sort() or
> bsearch()).
>=20
> While moving the source file, take the opportunity and drop the
> pointless EXPORT_SYMBOL() and an unnecessary #include.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/Kconfig                        | 4 +---
> xen/common/Kconfig                          | 3 ---
> xen/common/Makefile                         | 1 -
> xen/lib/Makefile                            | 1 +
> xen/{common/list_sort.c =3D> lib/list-sort.c} | 2 --
> 5 files changed, 2 insertions(+), 9 deletions(-)
> rename xen/{common/list_sort.c =3D> lib/list-sort.c} (98%)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index f5b1bcda0323..38b6c31ba5dd 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -56,9 +56,7 @@ config HVM
>         def_bool y
>=20
> config NEW_VGIC
> -	bool
> -	prompt "Use new VGIC implementation"
> -	select NEEDS_LIST_SORT
> +	bool "Use new VGIC implementation"
> 	---help---
>=20
> 	This is an alternative implementation of the ARM GIC interrupt
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 3e2cf2508899..0661328a99e7 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -66,9 +66,6 @@ config MEM_ACCESS
> config NEEDS_LIBELF
> 	bool
>=20
> -config NEEDS_LIST_SORT
> -	bool
> -
> menu "Speculative hardening"
>=20
> config SPECULATIVE_HARDEN_ARRAY
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index d109f279a490..332e7d667cec 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -21,7 +21,6 @@ obj-y +=3D keyhandler.o
> obj-$(CONFIG_KEXEC) +=3D kexec.o
> obj-$(CONFIG_KEXEC) +=3D kimage.o
> obj-y +=3D lib.o
> -obj-$(CONFIG_NEEDS_LIST_SORT) +=3D list_sort.o
> obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o livepatch_elf.o
> obj-$(CONFIG_MEM_ACCESS) +=3D mem_access.o
> obj-y +=3D memory.o
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index b8814361d63e..764f3624b5f9 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -1,3 +1,4 @@
> obj-$(CONFIG_X86) +=3D x86/
>=20
> lib-y +=3D ctype.o
> +lib-y +=3D list-sort.o
> diff --git a/xen/common/list_sort.c b/xen/lib/list-sort.c
> similarity index 98%
> rename from xen/common/list_sort.c
> rename to xen/lib/list-sort.c
> index af2b2f6519f1..f8d8bbf28178 100644
> --- a/xen/common/list_sort.c
> +++ b/xen/lib/list-sort.c
> @@ -15,7 +15,6 @@
>  * this program; If not, see <http://www.gnu.org/licenses/>.
>  */
>=20
> -#include <xen/lib.h>
> #include <xen/list.h>
>=20
> #define MAX_LIST_LENGTH_BITS 20
> @@ -154,4 +153,3 @@ void list_sort(void *priv, struct list_head *head,
>=20
> 	merge_and_restore_back_links(priv, cmp, head, part[max_lev], list);
> }
> -EXPORT_SYMBOL(list_sort);
>=20
>=20


