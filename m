Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8B40438C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 04:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182560.330176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO9gM-0005Aw-8s; Thu, 09 Sep 2021 02:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182560.330176; Thu, 09 Sep 2021 02:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO9gM-00059B-4V; Thu, 09 Sep 2021 02:20:54 +0000
Received: by outflank-mailman (input) for mailman id 182560;
 Thu, 09 Sep 2021 02:20:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJWR=N7=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mO9gJ-000595-UZ
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 02:20:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83b89824-7c2a-48c8-91a5-33aa97d6b8e5;
 Thu, 09 Sep 2021 02:20:49 +0000 (UTC)
Received: from AS9PR06CA0240.eurprd06.prod.outlook.com (2603:10a6:20b:45e::9)
 by AM6PR08MB3320.eurprd08.prod.outlook.com (2603:10a6:209:48::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 9 Sep
 2021 02:20:37 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::ec) by AS9PR06CA0240.outlook.office365.com
 (2603:10a6:20b:45e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 02:20:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 9 Sep 2021 02:20:36 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Thu, 09 Sep 2021 02:20:36 +0000
Received: from 889472a1c476.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04B3ABDE-7AEE-486F-B949-01532FF30FFB.1; 
 Thu, 09 Sep 2021 02:20:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 889472a1c476.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Sep 2021 02:20:25 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4510.eurprd08.prod.outlook.com (2603:10a6:803:fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 02:20:23 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4478.026; Thu, 9 Sep 2021
 02:20:23 +0000
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
X-Inumbo-ID: 83b89824-7c2a-48c8-91a5-33aa97d6b8e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nynvBABngUwOW1F6uuWXjRTaGIbbj4LSXRhrLUHPG6o=;
 b=GF1FNwGhLpiZyRcfYE6ToFJFUohl2pSnfULbBpXllZNx8LyValGNMob1YNDaL7l+TSVUkt71RbFSXfNEhMYxdXvNBh4xaYDTpu7ZEiHqKI1OwA2zbV9GXAVegsN6Jo7/3hXuTVUC0iaZhlEZo0EftOGUL5TyYbHbCgPAnnG3i1Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmEKAMHB4Jt+BpvIveYKcR0Kg61UQ3KWWlHjhxIVE4neNwSMM+pesTH8gBrhmbp8/rtYo7uA50EHQ3QJuxNE9b1euBbdt7JK5yUoNdU1lrfsvK9Nxpu7jJ2/SXyKp2OnKNXfsNm5KTBK+aqFG987nE9ucp87h1sWzVR7JZqnMjP6BW2RXYm0OBhaAbnfJiNJzXnzgFhzqRQ5+5ZM+cOJwO8LgpFbtfRbOcyxeVZ3V6sl6IUkiwIbs64xYTj/YOvy4y61OlyDip6o9RkV0erdTFfDkUEsasj6ldUt5YmYDf3HUuUxIHfDFhRxaZiBe6T4Fe0x7mbPIb+dyUKH5IEd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nynvBABngUwOW1F6uuWXjRTaGIbbj4LSXRhrLUHPG6o=;
 b=jWLZextee5GhuNRz/Xwxifg1M78o7GQovja4uSmlpFd6gazee9I/OukQIrOAHNu5wJ7vY1ulORooudlIb6FAI1ejHVPK8BbICRC1Ol0TalCyehUxaql28IgNYzl2SqO0/m19zFkSZk6wCjZ+lvMoZW7ZVSQAEotJxWr7zR+yYst6Bp3l9cTpdgehtRgZ/UKHIjl11FOJBqX3JabISMmdPm7VB3nNRVjti8tNs9xVqY+fukkMLVm/UetkS1z0S90VisnOA019DHsMONzE3bgabit5LwRwrTjT9rU5Rz4BQl66xQ/55U+md5ZIpFvu2XeUhqzPe4PsJn149lMoXFtbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nynvBABngUwOW1F6uuWXjRTaGIbbj4LSXRhrLUHPG6o=;
 b=GF1FNwGhLpiZyRcfYE6ToFJFUohl2pSnfULbBpXllZNx8LyValGNMob1YNDaL7l+TSVUkt71RbFSXfNEhMYxdXvNBh4xaYDTpu7ZEiHqKI1OwA2zbV9GXAVegsN6Jo7/3hXuTVUC0iaZhlEZo0EftOGUL5TyYbHbCgPAnnG3i1Y=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "jbeulich@suse.com"
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH v6 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
Thread-Topic: [PATCH v6 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
Thread-Index: AQHXpQ1TrWpL2DewC0y7cp371PcYX6ua9x7w
Date: Thu, 9 Sep 2021 02:20:21 +0000
Message-ID:
 <VE1PR08MB521580BE54919E53282AE691F7D59@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210908095248.545981-1-penny.zheng@arm.com>
 <20210908095248.545981-6-penny.zheng@arm.com>
 <alpine.DEB.2.21.2109081654290.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109081654290.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 00451682A6507C4CBB9A8C033ED51150.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e74e92b9-5c60-46b7-175d-08d97338693d
x-ms-traffictypediagnostic: VI1PR08MB4510:|AM6PR08MB3320:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3320111A92A6B3C5E577DC00F7D59@AM6PR08MB3320.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:142;OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5B91eR3oVmGWyYk4hIpBpc+gJkLqupHZd/QbU0eNDAD8d2o/cg/6HQnSyRba6iEgTd0IEk/tchWXEakbSnXz2myBFZfY8De5Bu4ein5l6WL5nTJKNpdyXypVcyStAUm/VCLmz8BFpTstoIuGS1L6NHbHeeXEgQACOf//Sw9JQFoaBUvXztjH9m98qN6Bs9qHm8wMU8cmtjoc0i2eBGjTD37XboatqKnmUo0O500RtbOeBdXjSUKuxYHFMIvjJPVI6shQwJ3oI+FJIOlp31N9EyFE/00AtVQBLikU9RmlcbmDDlHT5v1fdHVPXBqKlGIK/oLeQGmRAh9wUXMQwM5sDL//1IX33QDWgGafFzWMUkZtAJ9mjLaCIzH5UgVhzaMCd9y683o5pPQPZukgSvbCQ05r3OnUxXqAlXoZG+/K9RvhRaXs6zCc8IJ4UABGNj8w1emfRB8WJKzejg0cCbTZi0CyIteuQHmrkTaAWmHvk6ZAmAJGiV89t7vtSbEVgitw6gg0q4McpYtRESXw8JriEQ6ysVUbEiGaIiMJMls3mCQGhu6xEYjeXvluM1dcvz7UsAqWnBuKExxSw9DqjvUgCyFc1KMbQV4nupxiKxvz7HJmz/aKEShWTNeHXSyjnafvTDzTUD3W4pPxFR4h24rJMCZVaGENLPzvHuubX/19Dplfo316nycBK1XYI90vkgfvEI44RLDR4D9AWX0PtDXl4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(9686003)(86362001)(52536014)(83380400001)(5660300002)(4326008)(33656002)(55016002)(478600001)(71200400001)(2906002)(66446008)(26005)(53546011)(6506007)(8676002)(7696005)(64756008)(66946007)(76116006)(66556008)(66476007)(8936002)(110136005)(122000001)(38100700002)(38070700005)(316002)(186003)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4510
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f3231dd-d2af-4e70-2964-08d973386100
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kR3QifmV0V/JqrFbzsxsZLdw3TfOyc4j9vmi/rwKPU6E7glTLb0lXwzDM2evZDAiNi/4uYEXNBUdB3fevctrJ0c5qlgff64w+0Z/vCMYVOcb6hu2SmY1T00KXg8Yfk2oxZ5MAHMa1VeKLS11OIoUZg7HjJhCiB1v15Bq2igHYwfm7UTebdNYM+ccJJG0HIQnHAfwRVZucGvVIfqBPPkOXWRJf1GQG+cYmXCUMyl9vfOOVAoRR5ABI+QuWsX8J0KrahrMfwI/XA0mk/Hfx8jDSfsI5t/06iy38ue0bE0YKyyIghCbDRSQXYW9T8/CBqv3tuWm9hQGtsT9GznrtOe82ga+yeFzOjyQBrzJwDWX0iyVErhr7g54w4TMk9WsjoCZjZOVgDODWFv8GZohoNmdiavVELu4+13mOZt8FCF/gQs0xX2e0rjuZPkHaMi/IHjca4nYtro+FNkGpGn6+9P6UvJ1sJou/BN/RzSEUkSr3o4jTnLQZR5bctnvkNo42DrRWY97Z7JjD/T2n3Ajt48X3Zt2WusEvDn3OfAl/QvJXWULW5eG32+SOSyTPFSCYjQt0OBXEvHdkRwyh2Jzxg/K+lVhH2clpnSP8JghHgNyFTcK2qIAxyPUV+gd6VP+7+E+Utqix0k2CTsJY/MtQaDKSYhTpMklLHx036mQhFtViixj70J69ZwcTSkeXhk0MXdhPj5vTsppHjtg8VRKopBIqg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(36840700001)(46966006)(82310400003)(26005)(8676002)(2906002)(4326008)(70586007)(186003)(5660300002)(70206006)(81166007)(54906003)(478600001)(6506007)(8936002)(55016002)(52536014)(356005)(336012)(53546011)(9686003)(82740400003)(110136005)(47076005)(86362001)(83380400001)(316002)(36860700001)(33656002)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 02:20:36.9880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e74e92b9-5c60-46b7-175d-08d97338693d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3320

Hi Jan

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Thursday, September 9, 2021 7:58 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.or=
g;
> Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
> <Wei.Chen@arm.com>; jbeulich@suse.com
> Subject: Re: [PATCH v6 5/7] xen: re-define assign_pages and introduce a n=
ew
> function assign_page
>=20
> On Wed, 8 Sep 2021, Penny Zheng wrote:
> > In order to deal with the trouble of count-to-order conversion when
> > page number is not in a power-of-two, this commit re-define
> > assign_pages for nr pages and introduces a new helper assign_page for
> original page with a single order.
> >
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>=20
> The patch looks correct to me, however I don't think I understood Jan's
> request to the previous version of this patch, so I can't tell if you add=
ressed his
> concerns.
>=20

Would you like to take a look at whether I address your concerns in this ve=
rsion? Thx.

>=20
> > ---
> >  xen/arch/x86/pv/dom0_build.c |  2 +-
> >  xen/common/grant_table.c     |  2 +-
> >  xen/common/memory.c          |  6 +++---
> >  xen/common/page_alloc.c      | 21 +++++++++++++--------
> >  xen/include/xen/mm.h         |  6 ++++++
> >  5 files changed, 24 insertions(+), 13 deletions(-)
> >
> > diff --git a/xen/arch/x86/pv/dom0_build.c
> > b/xen/arch/x86/pv/dom0_build.c index d7f9e04b28..7787cc8fca 100644
> > --- a/xen/arch/x86/pv/dom0_build.c
> > +++ b/xen/arch/x86/pv/dom0_build.c
> > @@ -568,7 +568,7 @@ int __init dom0_construct_pv(struct domain *d,
> >          else
> >          {
> >              while ( count-- )
> > -                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
> > +                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 1, 0)
> > + )
> >                      BUG();
> >          }
> >          initrd->mod_end =3D 0;
> > diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c index
> > ee61603a97..50f5f83023 100644
> > --- a/xen/common/grant_table.c
> > +++ b/xen/common/grant_table.c
> > @@ -2358,7 +2358,7 @@ gnttab_transfer(
> >           * is respected and speculative execution is blocked according=
ly
> >           */
> >          if ( unlikely(!evaluate_nospec(okay)) ||
> > -            unlikely(assign_pages(e, page, 0, MEMF_no_refcount)) )
> > +            unlikely(assign_pages(e, page, 1, MEMF_no_refcount)) )
> >          {
> >              bool drop_dom_ref;
> >
> > diff --git a/xen/common/memory.c b/xen/common/memory.c index
> > 74babb0bd7..9cef8790ff 100644
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -728,8 +728,8 @@ static long
> memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t)
> arg)
> >          /* Assign each output page to the domain. */
> >          for ( j =3D 0; (page =3D page_list_remove_head(&out_chunk_list=
)); ++j )
> >          {
> > -            if ( assign_pages(d, page, exch.out.extent_order,
> > -                              MEMF_no_refcount) )
> > +            if ( assign_page(page, exch.out.extent_order, d,
> > +                             MEMF_no_refcount) )
> >              {
> >                  unsigned long dec_count;
> >                  bool_t drop_dom_ref;
> > @@ -797,7 +797,7 @@ static long
> memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t)
> arg)
> >       * cleared PGC_allocated.
> >       */
> >      while ( (page =3D page_list_remove_head(&in_chunk_list)) )
> > -        if ( assign_pages(d, page, 0, MEMF_no_refcount) )
> > +        if ( assign_pages(d, page, 1, MEMF_no_refcount) )
> >          {
> >              BUG_ON(!d->is_dying);
> >              free_domheap_page(page);
> > diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c index
> > ba7adc80db..bb19bb10ff 100644
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -2261,7 +2261,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
> > int assign_pages(
> >      struct domain *d,
> >      struct page_info *pg,
> > -    unsigned int order,
> > +    unsigned long nr,
> >      unsigned int memflags)
> >  {
> >      int rc =3D 0;
> > @@ -2281,7 +2281,7 @@ int assign_pages(
> >      {
> >          unsigned int extra_pages =3D 0;
> >
> > -        for ( i =3D 0; i < (1ul << order); i++ )
> > +        for ( i =3D 0; i < nr; i++ )
> >          {
> >              ASSERT(!(pg[i].count_info & ~PGC_extra));
> >              if ( pg[i].count_info & PGC_extra ) @@ -2290,18 +2290,18
> > @@ int assign_pages(
> >
> >          ASSERT(!extra_pages ||
> >                 ((memflags & MEMF_no_refcount) &&
> > -                extra_pages =3D=3D 1u << order));
> > +                extra_pages =3D=3D nr));
> >      }
> >  #endif
> >
> >      if ( pg[0].count_info & PGC_extra )
> >      {
> > -        d->extra_pages +=3D 1u << order;
> > +        d->extra_pages +=3D nr;
> >          memflags &=3D ~MEMF_no_refcount;
> >      }
> >      else if ( !(memflags & MEMF_no_refcount) )
> >      {
> > -        unsigned int tot_pages =3D domain_tot_pages(d) + (1 << order);
> > +        unsigned int tot_pages =3D domain_tot_pages(d) + nr;
> >
> >          if ( unlikely(tot_pages > d->max_pages) )
> >          {
> > @@ -2313,10 +2313,10 @@ int assign_pages(
> >      }
> >
> >      if ( !(memflags & MEMF_no_refcount) &&
> > -         unlikely(domain_adjust_tot_pages(d, 1 << order) =3D=3D (1 << =
order)) )
> > +         unlikely(domain_adjust_tot_pages(d, nr) =3D=3D nr) )
> >          get_knownalive_domain(d);
> >
> > -    for ( i =3D 0; i < (1 << order); i++ )
> > +    for ( i =3D 0; i < nr; i++ )
> >      {
> >          ASSERT(page_get_owner(&pg[i]) =3D=3D NULL);
> >          page_set_owner(&pg[i], d);
> > @@ -2331,6 +2331,11 @@ int assign_pages(
> >      return rc;
> >  }
> >
> > +int assign_page(struct page_info *pg, unsigned int order, struct domai=
n *d,
> > +                unsigned int memflags) {
> > +    return assign_pages(d, pg, 1UL << order, memflags); }
> >
> >  struct page_info *alloc_domheap_pages(
> >      struct domain *d, unsigned int order, unsigned int memflags) @@
> > -2373,7 +2378,7 @@ struct page_info *alloc_domheap_pages(
> >                  pg[i].count_info =3D PGC_extra;
> >              }
> >          }
> > -        if ( assign_pages(d, pg, order, memflags) )
> > +        if ( assign_page(pg, order, d, memflags) )
> >          {
> >              free_heap_pages(pg, order, memflags & MEMF_no_scrub);
> >              return NULL;
> > diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h index
> > 8e8fb5a615..a74e93eba8 100644
> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -133,8 +133,14 @@ void heap_init_late(void);
> >
> >  int assign_pages(
> >      struct domain *d,
> > +    struct page_info *pg,
> > +    unsigned long nr,
> > +    unsigned int memflags);
> > +
> > +int assign_page(
> >      struct page_info *pg,
> >      unsigned int order,
> > +    struct domain *d,
> >      unsigned int memflags);
> >
> >  /* Dump info to serial console */
> > --
> > 2.25.1
> >

