Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D12AFCE8B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 17:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036786.1409233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ9uZ-0005AR-I1; Tue, 08 Jul 2025 15:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036786.1409233; Tue, 08 Jul 2025 15:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ9uZ-00057j-EJ; Tue, 08 Jul 2025 15:07:11 +0000
Received: by outflank-mailman (input) for mailman id 1036786;
 Tue, 08 Jul 2025 15:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9jj=ZV=boeing.com=matthew.l.weber3@srs-se1.protection.inumbo.net>)
 id 1uZ9uX-00057d-NG
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 15:07:09 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35a3e6f9-5c0d-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 17:07:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 568F6tAo020792; Tue, 8 Jul 2025 11:07:04 -0400
Received: from XCH16-08-09.nos.boeing.com (xch16-08-09.nos.boeing.com
 [144.115.66.117])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 568F6s6u020771
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Jul 2025 11:06:54 -0400
Received: from XCH16-07-11.nos.boeing.com (144.115.66.113) by
 XCH16-08-09.nos.boeing.com (144.115.66.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Jul 2025 08:06:53 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH16-07-11.nos.boeing.com (144.115.66.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Jul 2025 08:06:53 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.147)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 8 Jul
 2025 08:06:37 -0700
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by BNZP110MB2336.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:4ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 15:06:35 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519%6]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 15:06:35 +0000
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
X-Inumbo-ID: 35a3e6f9-5c0d-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1751987224;
	bh=Z67U3CI7S60FxfHOYMIZmpf6+WLevAup1s/3JnCGBiw=;
	h=From:To:CC:Subject:Date:From;
	b=kNrr90RLpnH8Lnap2t8v6LLGrGCdXnmZbqCBHmlEHEoPHm1D9e7S8GyQrrD8oAdN/
	 BlpHJZ2whTIHb/yGViXQS3BNmabG9x0y1RRoZFFZ3FyiLzD9ZfD8LWP6yrK2U37Flx
	 TZKQtD8A6kcAYOH4xwkOcEPfn9e+JMZ3K84v3vqXEptfRcduPd5WJLCNc83D9np97/
	 WrcEVebB3+RYsFpY91sF0LiCGVbQDHBsUffyuRDtjgv7uQXFEOCwoZzmtQYThDN9At
	 /fqKdKeOBa/gmQ+PNX+sPHcA+TKvo2ECqKXc0jj/+htiSQXOjchRE5G/6/EHP9tkwX
	 OyvXA5gqalMqA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=V518ae5MSAv/RDaiAabMDfI++2oOVqt7CeuXC16ISJezlRY+0P9jVu4NWAx5QG3BS+pjL6omMKUxlHdaoIe0AwqsJkKs9eVDPBvUI6AnWt076yqDqOG5kDKwl+G6HlG24unhm0UIgGjJ5uDePF6esvLnExa6a/IneXVuc9UUaKS0fk6LsDHHe5zfOX2HDZ+gvLe+IQ4oNTRh6YYZ4Nwjioqukfp7JpwYOy9nG4rf5UYgoedYeVgIcH36H+EdzfCgv81J1BJjrH2E9EfZL5CSzc1Mtcps4uuYvXjtXGyMeJ/dfIV+n13PhQjdJdYHeM7EBCeJ79NXUz7Io8Q5uPw1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z67U3CI7S60FxfHOYMIZmpf6+WLevAup1s/3JnCGBiw=;
 b=jcKZZktQv2ge1BxGe1udVnM3b+pqqe60Pt4AY43pqqjD7Ljcfr5r/XD9rw6x6QxDBnC33WUeD01GNWIkdEUE9xWgTSKq2y/cAxAJHAjbVzVke8xV0wrGAM/0t0ycKCA5nBZEmVgGnl9jzY0bNgXAtkR9YUp3wtjTRiM5LEhFWRIxLTu8xr2CFd11W5g+tHpF+58sdv9T6O1h6fc7uBovIWZJaj+Q23DGOulVXI8KCGz5h98zT3JY6+J0eQjg3sxBkhlcoY+p3CBCogHCdOTKUARWy++Wo8bvGHiXP4RfLsGCto5UWOtKx+bS2t6HRaFPhaex59hLtRjYgHuy9v/QUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z67U3CI7S60FxfHOYMIZmpf6+WLevAup1s/3JnCGBiw=;
 b=C6c6wi3qJ6PPVjf8xGGmGnETOb+Wg0cNlwMAJ2kPH0EDo6jOXVWmHsTYcBCGQMeIxp2K50TOyrWB8vyi4Go5u+2WT2mVCZRNGhqMyC8ck/pQZIDIktEI6t9XskUFBORKJEqUyAxF3lsF+Xf6EiIicSqrzNS2EWdjYhWwIMuoPn4=
From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
To: "Halder, Ayan Kumar" <ayan.kumar.halder@amd.com>
CC: "Wood (US), Brian J" <brian.j.wood2@boeing.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: FuSA configuration
Thread-Topic: FuSA configuration
Thread-Index: AdvwGXOLL/mEttfGQoW/yUUmtzrz7w==
Date: Tue, 8 Jul 2025 15:06:35 +0000
Message-ID: <BN0P110MB2067173E38889AB2801397F3F34EA@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|BNZP110MB2336:EE_
x-ms-office365-filtering-correlation-id: 9bacbd71-a6a8-4dd2-d7e9-08ddbe310804
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|8096899003|4053099003|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?STHfyhUUEOP0PyrXM4IOArRmb6CJXZiMB8t12aW4s1vvG0wk7uIqU7OEoNDI?=
 =?us-ascii?Q?3UAcwVN5pn96VxBHdmMNT3liayu2SwlzLcWpl3wyzYS0GOZPZ0HXCaYcC4Y1?=
 =?us-ascii?Q?MWS7oIRauGKEGa2FEfJbhzahuNxyIUg4Wldo0uM3NxaFFWp2PbeGDaIXh2Al?=
 =?us-ascii?Q?4fnaJlymFJY4XsIBHLpYk31D/8i4cLkixba0Z+c9bmuc6LvLyAchF4HRxhep?=
 =?us-ascii?Q?N9J885oJ+m0lf5o0h5mtoNGn1b2dLxNYMzZi0HJKwqJjqFBJCEdCiO7Dyc9u?=
 =?us-ascii?Q?su4DGbWpzEgvESWrcCoffWhFeJuhN0H3vfD0u5i6GzZGYinoMpNJRIokHLtk?=
 =?us-ascii?Q?hhNEKh0mLWRa/nudtNl041u2u1NZRtJYAeCalZ7gzNitLvw+OgCtZgT7xFXe?=
 =?us-ascii?Q?/N8JfVsRh/W44otgNEAk5mxg5F7WGPhPjc/NvlZUUHI538VaOzcNkzVTLh5H?=
 =?us-ascii?Q?SkD/6cWkXWro9m3gFZBh71wg7PdGLwxW2w+Q5qCDBP4MTivHTj56F3+o/QO0?=
 =?us-ascii?Q?ZNVQgVcRoudhyX/h8j6lOY2f/kUcO5XJJtpDb4h8z/ZIAXr3RMbRTiFLVrDa?=
 =?us-ascii?Q?0E/CJM07R5859m3HKckA3yroDCP66JL96t13RzRY9OjFHxV6uodUMwF7D1j4?=
 =?us-ascii?Q?Gan+HaqXFn+RbelkcjR/09EpGI3ebBAMnfQFhZFlc9OaFAM+qWCe7qnq0qN+?=
 =?us-ascii?Q?FKCuJlqdnTVvZ3fgjaOPMvp+qNjVY/fBa2sbMXB7hCJ6CJm+yvoGjjz/IR2z?=
 =?us-ascii?Q?EOz225swHBjwr5HjwH8+o+wAzu4b90UnvA7BqBJKBdy4SDBRot0FPz1lHgmZ?=
 =?us-ascii?Q?flnmJ6FUTw/DgyyGRrdhUQtyS3l4BVnx48FQUdVlFXTmtbGFop7KW5taUIkO?=
 =?us-ascii?Q?/c7F8ezigg25RpUQOlLzTgxPBKaH4NLZrmQZOHYbEsLQD4nPNUiFRTtP20P1?=
 =?us-ascii?Q?5CDD+9kbJ3T9Kh9qrWVMxjzpmx+v0JoyrBnxQS88Pf8vWPKa1UNHOnGbQBPg?=
 =?us-ascii?Q?0H4flGBFG7VYTXkKOq/JC3Vy7OM8LjKSdjw8WuZ97n5eWfne0QMBz7WRYWUJ?=
 =?us-ascii?Q?JUDuObuWqfy0rdQgnDN1RJwSd3JU0HQoQ4rlhxz1WKTieK8Ub70TcuTl8ssN?=
 =?us-ascii?Q?VViDuAenVcO6Doq8UIK47ULRFfRCahfoWXRLKPR+PIcViqElWErnqbuN78OB?=
 =?us-ascii?Q?lHlXcYF5DfZfJ40lklvCZRACKafM04nV/8Qpp+qlIktZ3LSYv/n7bYy8FzmG?=
 =?us-ascii?Q?MFN/GBkMsIdftKAz2H4x+RAFqYdlqDMV6SyMvtaijC3wWnDDmRV5ZDceRn1x?=
 =?us-ascii?Q?Ylb6UnRR1XAmWCUisXqTEgKt0wa8Aldsufab5d+dQBIgaKGo7qP5Fl9C7UXD?=
 =?us-ascii?Q?ocnFyONpHky3yTAj3an7IFgIUvIOOixujS8aYb0nVsCjXgq+Z4nCqNcexYNM?=
 =?us-ascii?Q?cEzdllrsXKQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(8096899003)(4053099003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?edoFn4oDML9GK8xxzRDSel/k0wDg7fznoTUhT3tqSliN5iW0LhedtqJ+i1A+?=
 =?us-ascii?Q?xRc2JVXIcOW+VXcWB+CCa9vNHKzBMxcvfF4ebIyY6hoPa14MSjkGCMNtdKN+?=
 =?us-ascii?Q?glAzlYFXjGxT1pJi4sgxRdPKmPZcHLv2FBYEAPDil81QMrWcOn3ajE0bqQxO?=
 =?us-ascii?Q?SD0DO7aCbv/WMNmmgAdJYodfMomguFsJGMPGClPPKQMwGHFIep73VsjKIL8G?=
 =?us-ascii?Q?XZRXlaC5tgxdEbwtmvD+NIUmHLCuc8fuNt4EiL6Qj4/8Rg3xL4YYdnx5zdty?=
 =?us-ascii?Q?XOVwF4baEYJGu40y0Oug1cg6CQf2NUti5HZgGFojROMSWCVjAMyba+lfHn4H?=
 =?us-ascii?Q?TIN10kdTkEFHdobx5BO4n9z9S7TcLK09XnH04EeA7w7BeUTX3h8UCrs2rWCE?=
 =?us-ascii?Q?/crCbN0bf2y/z0hRcHWP7ufaU2smGqEOKAW+O/NMVFXOc6uTpWROuDnoCyAa?=
 =?us-ascii?Q?2HWVSe8hzSLdPPcPt1cunS86QbpVruMtcHNxJ4HWPjUU6DeajciQyF7fiCmh?=
 =?us-ascii?Q?yZSDeLhSeHk6pauonvrvkCT/s1rKMATG7feEekp22dcVAQ4P45PKxK8hNadl?=
 =?us-ascii?Q?twVZjW3jZQFv+vRIZbyEZ1kew8BZywkc4cIVOO0GIDPhn7h+CB/N2Jf1H/KY?=
 =?us-ascii?Q?8yR6imwjh76qheW6gwaYz3UoCzgte2J9Fb7TinRjQyBjXXsIvRqFv8/ZrcwF?=
 =?us-ascii?Q?orMUJWPQoprHXogLNAOPQIP2Fn19YyZ3kd06yNkZ7lXPlBGIwaEsPT7Wa+hj?=
 =?us-ascii?Q?WkYWpZqvhKyql7iYx+RwEsoQSc0bZMpqIjs3oge/BPqAVv2mxMd2HjYF5A+a?=
 =?us-ascii?Q?WlXt0Ixdd5NdLtO60S3Ft+qJZTEbECJstmHin8FeLDh54DMOHpk1xoja5uCN?=
 =?us-ascii?Q?1HHD9lNKWpFxEMYpKz20ir7Ff3Suni7yAa7JU/llHlD6eitLZufOyj0cuwvA?=
 =?us-ascii?Q?8O8UI97cNHdz2i7bRiABNBn5jRfZpSZPN17Tun7PZfybKdWusSL5x+pJJC5n?=
 =?us-ascii?Q?sCAeUqWtqJgPMkjcCrqbK5qNKyN1wuyTLGFKJ6nOSE65cBsiQIYcoRB9TLrR?=
 =?us-ascii?Q?yWDEU8vCZTJK0rB4hu8LuE4nPBkfo0LNdvX92YQ6XpQ/NtytCgQ4AwR8rVzW?=
 =?us-ascii?Q?4CD4I4Rz7qs3KADwRtW4+AW/7q/oHyQWb5cBZ9rTZdt2xxyS5ecosgtoQF+5?=
 =?us-ascii?Q?MDM1j9NBvYqJx2WCC09JRTBvI5ks0IOxbyNPU83ucfYi5ue11HJqF4yA5fKI?=
 =?us-ascii?Q?XJKecPnqmqqu23aaTi3Ko633yDMMvQ9AsSU1IDlDlz9Iscpe6J+au4AiCKIS?=
 =?us-ascii?Q?vqeqc4slVsUNnDIYpd9pPWnJZBYu3mEBAHAsYxQfKk3nYXB18Y8d4GGcSiuo?=
 =?us-ascii?Q?8VqRt10wfDW4BShlnyODTJiU51gIUUuGArO3vayaSqV8Fo6B+aa8r4OLb+XV?=
 =?us-ascii?Q?zB/tgFn4BZABwgjcriSxm4UMlE+SwmQ5lM7LHBhKkdXtok8qgUlDYA+Wxe8J?=
 =?us-ascii?Q?UhoTCF6+WEDZb/Icc9uPBqt2A+pgiUrz/xrB?=
Content-Type: multipart/related;
	boundary="_004_BN0P110MB2067173E38889AB2801397F3F34EABN0P110MB2067NAMP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bacbd71-a6a8-4dd2-d7e9-08ddbe310804
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 15:06:35.3191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNZP110MB2336
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

--_004_BN0P110MB2067173E38889AB2801397F3F34EABN0P110MB2067NAMP_
Content-Type: multipart/alternative;
	boundary="_000_BN0P110MB2067173E38889AB2801397F3F34EABN0P110MB2067NAMP_"

--_000_BN0P110MB2067173E38889AB2801397F3F34EABN0P110MB2067NAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ayan,

I didn't get a chance to ask in the FuSA call today about build time config=
urations.  Is there a configuration that's been "ifdef" on the original cod=
ebase to put it into a certification configuration?  Wasn't sure if there i=
s a working/staging branch separate from the main project repository with t=
hese sort of changes.

Brian and I are working on some reference configurations of Linux and/or Xe=
n for the ELISA project and wanted to narrow the build focus on the FuSa co=
nfiguration.

Best Regards,
-
Matthew L. Weber
Associate Technical Fellow / ELISA Aerospace WG Chair
LinkedIn<https://www.linkedin.com/in/matthew-weber-a171527/> | GitHub<https=
://github.com/matthew-l-weber> | GitLab<https://gitlab.com/matthewlweber> |=
 LXF Open Profile<https://openprofile.dev/profile/matthew.l.weber>

[cid:image001.gif@01DBEFEF.FC028F50]


--_000_BN0P110MB2067173E38889AB2801397F3F34EABN0P110MB2067NAMP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Ayan,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I didn&#8217;t get a chance to ask in the FuSA call =
today about build time configurations.&nbsp; Is there a configuration that&=
#8217;s been &#8220;ifdef&#8221; on the original codebase to put it into a =
certification configuration? &nbsp;Wasn&#8217;t sure if there is a working/=
staging
 branch separate from the main project repository with these sort of change=
s.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Brian and I are working on some reference configurat=
ions of Linux and/or Xen for the ELISA project and wanted to narrow the bui=
ld focus on the FuSa configuration.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#5B6770">&#8212;</span><span st=
yle=3D"font-size:11.0pt;color:#5B6770;mso-ligatures:none"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,sans-serif;color:#5B6770">Matthew L. Weber<o:p></o:p></span></=
b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:#5B6770">Associate Technical Fellow / ELISA Aero=
space WG Chair<o:p></o:p></span></p>
<p class=3D"MsoNormal"><a href=3D"https://www.linkedin.com/in/matthew-weber=
-a171527/"><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sa=
ns-serif;color:#467886">LinkedIn</span></a><span style=3D"font-size:10.0pt;=
font-family:&quot;Arial&quot;,sans-serif;color:black"> |
</span><a href=3D"https://github.com/matthew-l-weber"><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#467886">GitHub</=
span></a><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans=
-serif;color:black"> |
</span><a href=3D"https://gitlab.com/matthewlweber"><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#467886">GitLab</sp=
an></a><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-s=
erif;color:black"> |
</span><a href=3D"https://openprofile.dev/profile/matthew.l.weber"><span st=
yle=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#467=
886">LXF Open Profile</span></a><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Hel=
vetica&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><img border=3D"0" width=3D"142" height=3D"32" style=
=3D"width:1.4791in;height:.3333in" id=3D"Picture_x0020_1" src=3D"cid:image0=
01.gif@01DBEFEF.FC028F50"><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN0P110MB2067173E38889AB2801397F3F34EABN0P110MB2067NAMP_--

--_004_BN0P110MB2067173E38889AB2801397F3F34EABN0P110MB2067NAMP_
Content-Type: image/gif; name="image001.gif"
Content-Description: image001.gif
Content-Disposition: inline; filename="image001.gif"; size=3118;
	creation-date="Tue, 08 Jul 2025 15:06:35 GMT";
	modification-date="Tue, 08 Jul 2025 15:06:35 GMT"
Content-ID: <image001.gif@01DBEFEF.FC028F50>
Content-Transfer-Encoding: base64

R0lGODlhjgAgAPcAAL/N6Z+03v7+/z9pvd/m9A9Erfz9/gI6qQk/q/j6/QE5qLLD5Yeh1hdKsPn6
/QY9qiRUtOfs9wM6qRFFru7y+RtNsfP2+/f5/PDz+khwwYii1pWs2wxBrMDO6uLo9f39/iBRs1N5
xDlku/b4/Ctat56z3uzw+Q1CrBZJsJeu3D5ovY+o2RlMseDn9GiJy+nu91B2wx5PsgU8qurv+HKR
z/v8/hBErQpAqzVhutjh8sbT7O3x+SJTtBJGrs/a79Td8AQ7qdLc8NPd8PX3/LDB5G+Pztzk8ylY
tipZtouk12qLzH2a0/r7/aO34KG23/L1+7zL6Jmv3GyMzcrW7cvW7XqX0tHb70xzwh9Qs6q94gg+
q9fg8ai74eHo9V+CyBxOsu/z+ll9xidWtRRIr67A46u94sPQ67XF5mCDyURtvyxat3ST0M3Y7rvK
6HWT0EBqvmGEyRhLsJSr2pat20pywVp+x7fH5jRhurTE5evv+AtBrEFrvqK2352z3snV7TFeuTpl
vNri8uXr9k10wrbG5kVuwE51w9Da79Xe8ePp9Zyy3R1Psr7M6RVIr/H0+gc9qrrJ5+br9tvj8zBd
uH6a01F3xImj1y1bt0dvwCNTtM7Z7kNsv2uMzczX7tbf8VR6xV6ByFZ7xYSf1d3k81h9xsTR6xNH
rsfT7Nnh8t7l9HyZ0vT2+4qk14Oe1WWHymeIy3OSz46n2Dhku+jt9zJfua2/46m84qC130ZvwCZW
tT1ovW6OznuY0kJsv7HC5EtzwrPE5ZCo2Zux3Yyl2CFSs1t/x6y+4zZiuniW0Yah1k92w8LP6m2N
zcHP6jtmvJOr2pqw3YCc1JKq2pGp2X+b03CPzmKEyVJ4xOTq9nGQz6e64QA4qP///wAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94
cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1w
bWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4z
LWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4
bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8
cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5j
b20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0v
IiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNl
UmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1w
TU06SW5zdGFuY2VJRD0ieG1wLmlpZDozQUU2MjY4OEE2NEUxMUU0ODY0NkMwM0ZCMjJGNkY4QSIg
eG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozQUU2MjY4OUE2NEUxMUU0ODY0NkMwM0ZCMjJGNkY4
QSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjNBRTYyNjg2
QTY0RTExRTQ4NjQ2QzAzRkIyMkY2RjhBIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjNBRTYy
Njg3QTY0RTExRTQ4NjQ2QzAzRkIyMkY2RjhBIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpS
REY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s
6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSz
srGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6
eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JB
QD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkI
BwYFBAMCAQAAIfkEAAAAAAAsAAAAAI4AIAAACP8AuQkcSLCgwRoL8hhcyLChw4cQI0qcSLGiD04m
KmrcyLGjR44fGIS58LGkyZMoBxLIEkvUszYYBM4oVMxAyps4czK8IA3Jtm0ICkjYBuRXgBguBOhc
yhRlB2IKrnARJLCGkGEotqGY0bSrV41RDtw5tDDFgQwFFuXw6AeA27dw3bJRWpCAmbhxZxXsghdv
F4ECmsVNpRKukIKe3gYhOMJK37c6mAjksw2Ug4UMtlUyIClTg0Qcy/wcTbr0LoJEfJZejeCwwB1Y
VpduEEFgZtIT/nJ7wYL0EYI/bvyU0EGghWonZJdOw22LFhg2DWZWkUBgiwaAPmgMxEH5ajUDLXn/
Xy0MMJ3x2w4AENhhKOkzAg1sWp2Rm4UjozUIxKAG/Wgg3GRQgSMLabCNGBQQhMc2JVQ0wiWlheDW
Gqv1IdAZpR1giVs8lPbFDgIlU1oPhMSliUARxFFaFQMtIZsvAoUx2iBKCQBDaSQsAEAKq9HABoML
KbJND5IYhAkEdEmERmliPMENBaqN5oV1E5TGgEBklCaDDgIBcABpChDCkAFvlLZHdHYoIJsb3Gww
GggJcpNEaTaMIpAGA+SZZxhM0GBDdQXhccABUCy0wDZTTNTHahAMoMIYpWVwmQM4lHaFUkYUUNoK
KDZQGgd65umFdtxUUVoctXHjgSnKiTDFAz89/0CFQGa4NxoRD9HyiUE/JJfETkCwIpEVWvi3jRrQ
RMdJaXByc8EkEcanAnoy+HFhacQJ5IAso2lKmgwgjDaHQLyVxiY3jNhQwLrsVsINAq0UBEaHNDZE
gjUROQIBjnkiUBooA3FR2gOJcuNKaRA4yQ0yI4aapyJUlqafQEWM5owT3tURXy+l6VIDN5F4WhoL
tW2zAUE2blNBfQwNAANEAoRQ2iQkUdAbabwItEV3pJ3MDcakabEYN8BguwxDlFpKl2g/NZKIB8od
YYFALpLWAFU1TEvaHUVwyY0CEwskx0+FEkQSQSKQAtEKA0NBQBB7lIbDZUOQUBoPBBBQhnCkNf/I
DQFVkiZF3oSDKJAUzMYZSHLpQSJQDKvp8YNAaZZGCQGowFFaBS8QtIgSA+XgL+gFYRNMkg2s8ZAO
QBirsgcCleD6NlIIlECl490wOTcCkyarQA+OFs1AdazWxEAiuI7AKQWFQAJggGzzxdQG0ZCGEdzk
sI0tDuXxhbEKKAO7QKUYO8EKdCnhnxM68zyaz9xo/lMhpHLDI2mvEOSFscf4YFAT25hVFH5CBobs
oAAPKIILHgEGh1ghABCMoAQjSIQWGKQTE5wgHxgBKG4MIYMZLCCtJpiFgTxBgizjRgQkeIsOciMB
tQBhBLPgCYaMYAyGwACkNuGQ22wDCwtw4VfthvgVHiVPAWRpyAgqQBoOhCIKiEgSEaeYEwFk4CfX
gEgolGODAbhgGgvQxAukSMUycoQSP1kCGQligSXpYTwn6AEWQPCHNLhAFdrgihn3GBEmZMVfb4AE
GS0whwo8QA6d2EATFtABHxjBA2AQIh8nSZFDbWMFxsiFVj6xBmpkAxf+ogMiKEnKlCxpGwTghgDa
AAsR8GACEMCEKNZSylqaBHKNMMgqYmLLXpYEAz+BQEF88CtfGrMjBPiJDCKxnypI6pjQ1MgMRpMJ
GoTgBoYYQjS3SZE/kOYRDKgfN8fpEDaIYRsxYEYqycnOhgQEADsAAA==

--_004_BN0P110MB2067173E38889AB2801397F3F34EABN0P110MB2067NAMP_--


