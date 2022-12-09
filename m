Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807BB648443
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 15:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457991.715910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3emD-0003Ip-BX; Fri, 09 Dec 2022 14:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457991.715910; Fri, 09 Dec 2022 14:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3emD-0003GQ-8d; Fri, 09 Dec 2022 14:55:01 +0000
Received: by outflank-mailman (input) for mailman id 457991;
 Fri, 09 Dec 2022 14:55:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PKE6=4H=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p3emB-0003GK-P2
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 14:55:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.70]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72b5fb8c-77d1-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 15:54:57 +0100 (CET)
Received: from FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::8) by
 DU0PR08MB7413.eurprd08.prod.outlook.com (2603:10a6:10:351::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.6; Fri, 9 Dec 2022 14:54:25 +0000
Received: from VI1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::be) by FR3P281CA0117.outlook.office365.com
 (2603:10a6:d10:a3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.6 via Frontend
 Transport; Fri, 9 Dec 2022 14:54:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT042.mail.protection.outlook.com (100.127.144.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.17 via Frontend Transport; Fri, 9 Dec 2022 14:54:24 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 09 Dec 2022 14:54:24 +0000
Received: from 3f0252410883.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5691A364-8466-49D6-9EE7-64BB401DA299.1; 
 Fri, 09 Dec 2022 14:54:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f0252410883.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Dec 2022 14:54:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7907.eurprd08.prod.outlook.com (2603:10a6:10:3b1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.5; Fri, 9 Dec
 2022 14:54:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Fri, 9 Dec 2022
 14:54:15 +0000
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
X-Inumbo-ID: 72b5fb8c-77d1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78c1wG4uplDxYWQLr0+YBgFMcaN+fyaaegvG9XZy9dc=;
 b=JOZP+bwVB8HAsC8plAGkeUlnjRkBZj7WFNift7ODbTe/fQhyUCF+na23IM2u6fqf/WTsjpvsTDk0JtfD1S2bU9dnNlkj/mgnEPWrs3empD69W73Bs2yYQGAqiFZ71EU51LaYpt168KVFpv6y0xJAGRevWjMo0Htr+1du3peW+iw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmaArlC2T+hGeAzDuXUrZyEwt0AA02hQPEtBi7mCUDF6x58toXcfhSLe/de30vOMKp+/ALpSsU9cCkvR/xJ0xz0btYpF0gBdNgNk0DIZU/+wRu15+0uhoKHgUbZ8G+qz+Sbs5BtQU7MATZjnykbNcOzQotPlNiU7V+447YxQvjkmQlYm5dSWCP4U1jb9WaSgdlO2j7tY93eAhjgpcyySnz2UTZYS22GMkZGR6rVzdJpNsRxCZwI7CLvGkx6ba/BRGdC1dZ5Fh+R72i1BPxb4TmyF/YqcaUKyoDCCtDGkTj4HH2xqYIpZcYm4fRPeKPE1tV25Dk+zyQ1v5zzXqGOQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78c1wG4uplDxYWQLr0+YBgFMcaN+fyaaegvG9XZy9dc=;
 b=YWRIH/oW6shd9CGB+6MnNI+geT6KkoC3Jy86kP6+GaIkpMA3w6emAD+RGgL0u2+WTY5Bjm5L4nYlK0vyF+BgsfpDnRrJvXn1cCQZqVzh8Dg8AtcSVx+/LdqOm9U9LvXa8U0gCumgBJoVj0/+fhj728Cd8w5YmSltGJG4zbuRV9ECyWzXHGlEM6WDZIkFQTtbnH9MfonjfC4s7Su4JlJjmFnO1R1M9+wjK4D+na217K3u8ArS1p92yUfb2CANuQmbKG8u7zAoWgyNdLxn9pxwcljO4IajvJHuny9QzDJm33cBIRrArDzgIhp1R8+mR24facfXJ9dIvBxsV1q0UfuLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78c1wG4uplDxYWQLr0+YBgFMcaN+fyaaegvG9XZy9dc=;
 b=JOZP+bwVB8HAsC8plAGkeUlnjRkBZj7WFNift7ODbTe/fQhyUCF+na23IM2u6fqf/WTsjpvsTDk0JtfD1S2bU9dnNlkj/mgnEPWrs3empD69W73Bs2yYQGAqiFZ71EU51LaYpt168KVFpv6y0xJAGRevWjMo0Htr+1du3peW+iw=
From: Henry Wang <Henry.Wang@arm.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>, Julien Grall
	<julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Ard Biesheuval <ardb@kernel.org>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Thread-Topic: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
Thread-Index: AQHZCuISzshQ7NkOqUOBoTPM3AzEWa5jro+ggACa+wCAAOKJ4IAAXuWAgAAa1HA=
Date: Fri, 9 Dec 2022 14:54:15 +0000
Message-ID:
 <AS8PR08MB79916F9F373BAC3D805B63FB921C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <9c1e3cc3-e0b4-6ca5-087b-55117b45db80@suse.com>
 <AS8PR08MB7991E4EE490EC8B028BB1D2F921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <5ce98ff4-6b7d-2254-d755-a68fc3ac67b4@xen.org>
 <AS8PR08MB7991A81EEEC33451800CAF97921C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <Y5M1D4w44uIddxNn@itl-email>
In-Reply-To: <Y5M1D4w44uIddxNn@itl-email>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 20F23E320505CE448C4D3A413453AD19.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7907:EE_|VI1EUR03FT042:EE_|DU0PR08MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b9957b-fe60-4049-d587-08dad9f54343
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 b/jeSfqoKJtacdsjrR07brfm+IN1CBdcsupRA4zCgVXYiZeOFrHdTS26rhzwdx9lLK2fNg/Q1v1u7C0y84xPn8qH2w9mmOixFEhAWj5R+XhPrloqOQm+vK2Vnm5REhhyxKdaTdA65RL8xOFwa5fMTk/W2IvbXmcYxkFRBh4Z3c0Fquh3B5AgI2Sd+oabQnwkF2fP60/Tq06mG15HTsKwl1R8tUy+7LwHmnEj3lyW7Rzn/YkxbCYbdfK5khvczQDvZg5KTFknkcHPAUo7PmrpXvThWkLkjVXLFhxnqmxtEMZfssFXPZ0KxuYO6dcYjwWWkWvhl3F6hPuW+AyxJBHYudXyA8xRJXIELsgMKPUDvMQM8WRkxlZBhL8cXpKNclNQCmUGb2FipUwoOndXNvV31e1fRMl7p+Y8xnnERQcbFCfvUWO60QNSNinJG6dmcpso4Nqe9k9pbB+tfJq2zqy7bWV4uIxkBc0NXdS1ol45kjM8P89TdXaHi/z0HTzraiulBgdMYbtZNjAXhsOhbmDYhXeSUMnBjw9TGqoVBQ/ijDNcAkepcTp7lpfzpD5J0UATWufueci5LPhj8CROfQCo410ZzGA86yXzieWx5nGuRTfc3wSYp39VBc2oJo5CbGoPeTczyFhRZMsFi3utfj2eMgMsoRVNtH0D7ynMboXutXUInijDd8g0WESq7MEZ97pddp4+5Fmo886W2lteNVlLDQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199015)(55016003)(71200400001)(316002)(110136005)(54906003)(38070700005)(33656002)(86362001)(38100700002)(122000001)(186003)(26005)(7696005)(6506007)(9686003)(66476007)(66946007)(8676002)(52536014)(8936002)(64756008)(4326008)(66556008)(76116006)(2906002)(5660300002)(66446008)(478600001)(83380400001)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7907
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47bea45d-ec8d-4caa-8342-08dad9f53e1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MdpUcw1WDw/b1LxW8/V8SeqyNMaZ/xRGeRjysIQ8mR1039nNoRXmxdk+YEnUHDmAcsDLyXondKZBAW08HpfgtR7FAJ9XzCu8zO+5AMQEI3u2RJI5zXNep66G0E6EUtXwUVEt8CQxOB6PBL0atFHEuVt/wL1ogiHsPuon0IHJXN8auFNBZigt6VW1ldFJm2hZyJ0xzDWXO7WTC1bfZkadU36kc6SsSgmhxhupB2EhIqUlqcyMw30hRPJq/EajV0GIocoBmVsyEq3uFaXwOANDTBD4vo8DGVsxjZN/NvbcMnyzEf2o0Jts68AD/8Rq7NizQfsek4BCMEAYDvdASiT430m1uhIslEAd9Iswqdm/XeYutXHG2UakiXEGxRQ8+FelFevkAmFv7Q9YXVxmlYNRyZYi9SPN4JKxAVnBwP/irznDGsdbF5CppzmvgYjVMkd8dy7adyOmq4xBoErRRtxdEJmv58fzF6UTaOwJw/93EDSbqRSMYDvLSNmnmm+4lBtsu4LCVawArAafgWgHXE+J46Uck3iTfIkg11nVeCn9g4a241nxt8yEcCuCkb4woiCU9A9A4g+Z2dWGILg53BaOmL79lTzacskcgV98xrtj+or/kwr5nGyZyTidbTdnKtimtk/R1DSdCVfzuqcaEJdZ2yvxqdLkelZGa+QfK8u8kpuZtmWeTZlB4NzIAyHpbZRdgN2NU0Wz2iRuSK0iU3d+Wg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(2906002)(83380400001)(40460700003)(41300700001)(70586007)(70206006)(336012)(86362001)(55016003)(33656002)(40480700001)(81166007)(9686003)(316002)(186003)(26005)(356005)(82740400003)(82310400005)(52536014)(8936002)(47076005)(5660300002)(4326008)(8676002)(478600001)(110136005)(54906003)(6506007)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 14:54:24.3986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b9957b-fe60-4049-d587-08dad9f54343
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7413

Hi,

> -----Original Message-----
> From: Demi Marie Obenour <demi@invisiblethingslab.com>
> Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
>=20
> On Fri, Dec 09, 2022 at 07:37:53AM +0000, Henry Wang wrote:
> > Hi Julien,
> >
> > > -----Original Message-----
> > > From: Julien Grall <julien@xen.org>
> > > Subject: Re: [PATCH v3] Use EfiACPIReclaimMemory for ESRT
> > >
> > > Hi,
> > >
> > > >>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > >>
> > > >> Acked-by: Jan Beulich <jbeulich@suse.com>
> > > >>
> > > >>> Should this be included in 4.17?  It is a bug fix for a feature n=
ew to
> > > >>> 4.17, so I suspect yes, but it is ultimately up to Henry Wang.  T=
he code
> > > >>> is identical to v2, but I have improved the commit message.
> > > >>
> > > >> It may be too late now, looking at the state of the tree. Henry, J=
ulien?
> > > >
> > > > Like I said in v2, I don't object the change if you would like to i=
nclude
> this
> > > patch
> > > > to 4.17, so if you are sure this patch is safe and want to commit i=
t, feel
> free
> > > to add:
> > > >
> > > > Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> > > >
> > > > Since we also need to commit:
> > > > "[PATCH for-4.17] SUPPORT.md: Define support lifetime" so from my
> side
> > > > I am no problem. Julien might have different opinion though, if Jul=
ien
> > > object
> > > > the change I would like to respect his opinion and leave this patch
> > > uncommitted.
> > >
> > > I have committed it after SUPPORT.md. So if for some reasons we are
> seen
> > > any issues with Osstest, then I can tag the tree without this patch
> >
> > This is a great solution :)
> >
> > > (that said, I would rather prefer if we have staging-4.17 =3D=3D stab=
le-4.17).
> >
> > Looks like now staging-4.17 =3D=3D stable-4.17 now, with this patch pus=
hed.
> > So we are ready to tag.
>=20
> And it turns out that I botched the initial patch, sorry.  (I forgot to
> handle the multiboot2 case.)
>=20
> I understand if it is too late for stable-4.17, but it ought to make
> stable 4.17.1 as it was simply omitted from the initial patch series.

I don't think this patch will make it today so I would suggest we still fol=
low
what Julien planned yesterday. Also I think this is also consistent with th=
e
release management guideline.

Kind regards,
Henry


> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab

