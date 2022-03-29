Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A24EA62C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 05:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295646.503208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ2mX-0000xS-V3; Tue, 29 Mar 2022 03:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295646.503208; Tue, 29 Mar 2022 03:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ2mX-0000uU-Qf; Tue, 29 Mar 2022 03:44:33 +0000
Received: by outflank-mailman (input) for mailman id 295646;
 Tue, 29 Mar 2022 03:44:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5xw=UI=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZ2mV-0000uO-IO
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 03:44:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87352ef7-af12-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 05:44:26 +0200 (CEST)
Received: from AM5PR0601CA0057.eurprd06.prod.outlook.com (2603:10a6:206::22)
 by DB8PR08MB4106.eurprd08.prod.outlook.com (2603:10a6:10:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.20; Tue, 29 Mar
 2022 03:44:19 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::76) by AM5PR0601CA0057.outlook.office365.com
 (2603:10a6:206::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Tue, 29 Mar 2022 03:44:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Tue, 29 Mar 2022 03:44:18 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Tue, 29 Mar 2022 03:44:18 +0000
Received: from 0117725fb6a2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53105D26-4AD6-4E80-9B88-FA59D8AA1761.1; 
 Tue, 29 Mar 2022 03:44:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0117725fb6a2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 29 Mar 2022 03:44:12 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB4573.eurprd08.prod.outlook.com (2603:10a6:803:e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 03:44:05 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be%8]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 03:44:04 +0000
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
X-Inumbo-ID: 87352ef7-af12-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqtd8xn7AZLSi+YH/CWD439pPkIGyi3GhKSCwcsTKno=;
 b=dhhdwx8xR5kB6WLAttvr6IxcNxn9a46/BNh3MnDJ9pbFzX97rVTGNy4l2LNoDHvdkGLL+bmTUUg6lHUhrZWeyT2mErcyhOEMg61g5cqHcdem15qv+JWqNW+KhELv7W9lHyLwy19uC+v/VV0pPEWK3DT/l9YRObqRq+DZejd5t4U=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxm9h3rBrIgt4/cjupxMXSsdsfC2NEZJtf9mnhIYQyUr8AKW3Rjym15AyQ8R3vwchnIhPcsV799uVqc6izeLcKpQhEohB10XP+5l1sjfsLrGN8C3xq1Gsk4aGjp6lGzfvxVru51GVJ1Aak4mUHnc344EQxZ2nQHE7mLzjtW+sBPerEWvdL6wVFqYbq5XEsv367B1f1N3Rm+L3+7JUeYUyYNPTFus2VJRuscDV2sbe8BvbPYM3HxmHsNbe8C2bx7nl0kLFLwy5OKTh7GuzbmzVNMGv9L1Rgup8sezOkApAam1wafDJfroVLjDo019toqLOIYMDr4CvkmN4/8zvlrpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqtd8xn7AZLSi+YH/CWD439pPkIGyi3GhKSCwcsTKno=;
 b=ba5Rf+bl8Mdhsy8auFIR6Bxh+lvXVrqRrS8+ix7I8Qt4G9vqf3mbMCQ3S31hCag1R2IeNi9Y9ZI6z/unw8PHxh6w4IhmvxYtmDIsBVXgq8qTJ0vFg/XDqEw2cwRjohrsFjwp3nDWdqgPxRjAI47Agbqwz3yGdB9nt9YWon0+OAzEnd/hmzZ89bXTIigf0wg26LNBIDQyKSnDVU+7rFA55Ain1JDIZ91I4GblGj5JhZNLJp4gj7xLAVBX66RdZPJWeEFS7gdVSiUZ936vf5KhXodmYnYxM8YeNUOJDUJ/wdwIBE+wXURjS60EsE6NV8DFe1YloQmo90419Uo8CdzjHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqtd8xn7AZLSi+YH/CWD439pPkIGyi3GhKSCwcsTKno=;
 b=dhhdwx8xR5kB6WLAttvr6IxcNxn9a46/BNh3MnDJ9pbFzX97rVTGNy4l2LNoDHvdkGLL+bmTUUg6lHUhrZWeyT2mErcyhOEMg61g5cqHcdem15qv+JWqNW+KhELv7W9lHyLwy19uC+v/VV0pPEWK3DT/l9YRObqRq+DZejd5t4U=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd
	<nd@arm.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
Thread-Topic: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
Thread-Index: AQHYNQ8JUHwL/QpeQ0iCIDnkwGGL/6zEbaEAgBFckFA=
Date: Tue, 29 Mar 2022 03:44:04 +0000
Message-ID:
 <DU2PR08MB732540A4196E8634B4D8A579F71E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-7-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2203171744190.3497@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203171744190.3497@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E6B3E6C1F330384EB809B8AB265DA5A8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2d0dae2d-5787-4ee4-1595-08da1136675f
x-ms-traffictypediagnostic:
	VI1PR08MB4573:EE_|AM5EUR03FT060:EE_|DB8PR08MB4106:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4106A88C55BF42C3645ACE6AF71E9@DB8PR08MB4106.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ybeN9/pcquLEOgFCBQjzS3rC3XBQxUHgMXw8mrtcjX4Jy16Y5hZ5UUWgvdLeYxZZAZNa5IatcotZ/3n6lI+QHmtw+hlVOsgcDvTlK56u9ta0xZrmkmTVzIHZ73Nwt5hbGejJQLto0mGb/gxLYBbyJsB5r+DUzRod6Yl6pg++OIRrqemSuwnf2ptppITbGCTeR4RX7IAXCbIAIRwFht9iUBhg6SGctF8ojRHkJlIn6cAVriktpRzSJ095M4DPkhXi3mwPp6WFk7Cs1ik3qmIkzXVHyfHF9YEuHGfe9UwQY0vmOtmbszP4T/DGoPOm3wuuU/50X2ol47PN7FRyvZynCn5gm130phcg0YIQJGlbhGotK1xmnmSFviN9w+b2RlfZiF2OL38Riu1a6Iu2V7FyKQIkLa1nQlQmekm1Qw0xp0t8d1J/C3WNZCgdsIR4uptQBW/W1Adsw5uYhKaUVvWSaEMwenwDPWtTDYncDFHFEmN0Ox8soQLFTbrn2U827oNyrF1FJYIWzipLX2RzkHG3w4Hr7+uimnUhfcYVIt63XMJf7zTqyzf8cc4rhFMtzD0tIebmOBqyjbj+1d9RTYGdfWJm/f80W//Cc5UP0hUkq8MfJVYH6JX7yxWKX6m9fM884Mab/Wv3dfiqBQ2/15JiCqBoQFeqDepRTsvU5Ss5SZ7v1QpOV/S658bQJi/1z1Kv5fWIzCTHrriBffw+5YCuEQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(9686003)(53546011)(7696005)(2906002)(8676002)(71200400001)(66446008)(66556008)(66476007)(64756008)(316002)(6506007)(66946007)(6916009)(54906003)(76116006)(4326008)(5660300002)(508600001)(122000001)(52536014)(33656002)(8936002)(38070700005)(26005)(83380400001)(186003)(38100700002)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4573
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ad71210-c74f-41e1-cb78-08da11365f18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zW6MmM6XEf7u6sYFDrWwveAZcZ48og3UX+APNl9iJRJZKzZZuE2NJ5fSPaQUsjS1atWPIkEMjGveRMuRuEZmyPbAnWAdA8kbZQ7X0LLcGQ/BYV5nr6jaN5kPeqYVhy/tqXnnZdCWeUdRC7C3cyPgeoohGCnNUFyMuoF4TFeDnaScF5NLapfFnEPHddU+GDuGeLfBZSMucDLmiApTXZkRbS563itgOwNgtWV5B7ojIgy6ib6E5M1c2AUJ4obmbgZWuFQeePW+w9HC7H0sVkF3Xpi+xfO4sRHG1nbi5vAKCGJL7lhfKejL1kQoaDU1AHIsyS6BgzPafsYr1iyVFRa91k+K6JoZRUslOvk/pPyjoEmzy5Cwq7nSl44SdppQEzzPwvj2VXkKkMIi+yTzvBaPjIxVJ1N4Rww8QUbcLrQmyJ/E5rRu22gb/n6ru98FluSZ7utGkIG2+uYFAXgfNiYsT9BwiuSX0uM50zoI863VGf9dpXgyrxcGVDaNaS69qIv7ktppv4x3BMpJzNTLuN2/H2JhFMVeNW/6BTQkqmrZCB80Fj8nYz9/UUwzRbdrAC4oMelgzqmNtRqfcHEVJNS4J57qW7JK4jdOehVyjle7tqAYw852biI+eYS2ItSqi5n51pIJuZMHBVtURb9HCPJjbzBzOPnDO4ptwy6YTWGUGSSTyzdezDTpWCNgAVJ6EdyR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(4326008)(81166007)(54906003)(6862004)(70586007)(5660300002)(316002)(40460700003)(8676002)(36860700001)(70206006)(186003)(8936002)(508600001)(63370400001)(47076005)(2906002)(83380400001)(52536014)(82310400004)(9686003)(55016003)(26005)(53546011)(33656002)(107886003)(7696005)(63350400001)(6506007)(86362001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 03:44:18.5933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0dae2d-5787-4ee4-1595-08da1136675f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4106

Hi Stefano

Sorry for the late response, got sidetracked an emergency issue. ;/

> -----Original Message-----
> From: Stefano Stabellini <sstabelliHini@kernel.org>
> Sent: Friday, March 18, 2022 10:00 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: xen-devel@lists.xenproject.org; nd <nd@arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH v1 06/13] xen/arm: set up shared memory foreign
> mapping for borrower domain
>=20
> On Fri, 11 Mar 2022, Penny Zheng wrote:
> > From: Penny Zheng <penny.zheng@arm.com>
> >
> > This commits introduces a new helper guest_physmap_add_shm to set up
> > shared memory foreign mapping for borrower domain.
> >
> > Firstly it should get and take reference of statically shared pages
> > from owner dom_shared. Then it will setup P2M foreign memory map of
> > these statically shared pages for borrower domain.
> >
> > This commits only considers owner domain is the default dom_shared,
> > the other scenario will be covered in the following patches.
> >
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > ---
> >  xen/arch/arm/domain_build.c | 52
> > +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 984e70e5fc..8cee5ffbd1 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -798,6 +798,48 @@ static int __init allocate_shared_memory(struct
> domain *d,
> >      return ret;
> >  }
> >
> > +static int __init guest_physmap_add_shm(struct domain *od, struct doma=
in
> *bd,
> > +                                        unsigned long o_gfn,
> > +                                        unsigned long b_gfn,
> > +                                        unsigned long nr_gfns)
>=20
> They should probably be gfn_t type
>=20
>
=20
Sure, will do.

> > +{
> > +    struct page_info **pages =3D NULL;
> > +    p2m_type_t p2mt, t;
> > +    int ret =3D 0;
> > +
> > +    pages =3D xmalloc_array(struct page_info *, nr_gfns);
> > +    if ( !pages )
> > +        return -ENOMEM;
> > +
> > +    /*
> > +     * Take reference of statically shared pages from owner domain.
> > +     * Reference will be released when destroying shared memory region=
.
> > +     */
> > +    ret =3D get_pages_from_gfn(od, o_gfn, nr_gfns, pages, &p2mt, P2M_A=
LLOC);
> > +    if ( ret )
> > +    {
> > +        ret =3D -EINVAL;
> > +        goto fail_pages;
> > +    }
> > +
> > +    if ( p2m_is_ram(p2mt) )
> > +        t =3D (p2mt =3D=3D p2m_ram_rw) ? p2m_map_foreign_rw :
> p2m_map_foreign_ro;
> > +    else
> > +    {
> > +        ret =3D -EINVAL;
> > +        goto fail_pages;
> > +    }
>=20
> One idea is to initialize p2mt =3D p2m_ram_rw and pass it to
> get_pages_from_gfn. Then get_pages_from_gfn can return error immediately
> if any of the pages are of different type.
>=20
> This way there is no need for checking again here.
>

Right now, the memory attribute of static shared memory is RW as default,
What if we add memory attribute setting in device tree configuration, somet=
imes,
Users want to specify that borrower domain only has RO right, hmm, then the
Initialization for p2mt could be either p2m_ram_rw or p2m_ram_ro?
In such case, we could add another parameter in guest_physmap_add_shm to
show the p2m type...
Hope I understand what you suggested here.
=20
>=20
> > +    /* Set up guest foreign map. */
> > +    ret =3D guest_physmap_add_pages(bd, _gfn(b_gfn), page_to_mfn(pages=
[0]),
> > +                                  nr_gfns, t);
> > +
> > + fail_pages:
> > +        xfree(pages);
> > +
> > +    return ret;
> > +}
> > +
> >  static int __init process_shm(struct domain *d,
> >                                const struct dt_device_node *node)  {
> > @@ -855,6 +897,16 @@ static int __init process_shm(struct domain *d,
> >
> >              set_bit(shm_id, shm_mask);
> >          }
> > +
> > +        /*
> > +         * All domains are borrower domains when owner domain is the
> > +         * default dom_shared, so here we could just set up P2M foreig=
n
> > +         * mapping for borrower domain immediately.
> > +         */
> > +        ret =3D guest_physmap_add_shm(dom_shared, d, PFN_DOWN(pbase),
> > +                                    PFN_DOWN(gbase), PFN_DOWN(psize));
> > +        if ( ret )
> > +            return ret;
> >      }
> >
> >      return 0;
> > --
> > 2.25.1
> >

---
Cheers,
Penny Zheng

