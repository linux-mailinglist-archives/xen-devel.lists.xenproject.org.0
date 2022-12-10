Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55141648CF2
	for <lists+xen-devel@lfdr.de>; Sat, 10 Dec 2022 04:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458371.716277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3qiW-00086c-Ca; Sat, 10 Dec 2022 03:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458371.716277; Sat, 10 Dec 2022 03:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3qiW-00084r-80; Sat, 10 Dec 2022 03:40:00 +0000
Received: by outflank-mailman (input) for mailman id 458371;
 Sat, 10 Dec 2022 03:39:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VBnF=4I=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p3qiU-00084l-Jw
 for xen-devel@lists.xenproject.org; Sat, 10 Dec 2022 03:39:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 501af382-783c-11ed-91b6-6bf2151ebd3b;
 Sat, 10 Dec 2022 04:39:56 +0100 (CET)
Received: from DU2P250CA0023.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::28)
 by AS2PR08MB10208.eurprd08.prod.outlook.com (2603:10a6:20b:648::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Sat, 10 Dec
 2022 03:39:53 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::87) by DU2P250CA0023.outlook.office365.com
 (2603:10a6:10:231::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Sat, 10 Dec 2022 03:39:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.17 via Frontend Transport; Sat, 10 Dec 2022 03:39:52 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Sat, 10 Dec 2022 03:39:52 +0000
Received: from afdc606c7f22.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF0E69D1-E99E-4099-940B-496865859DA3.1; 
 Sat, 10 Dec 2022 03:39:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id afdc606c7f22.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 10 Dec 2022 03:39:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9723.eurprd08.prod.outlook.com (2603:10a6:102:31e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Sat, 10 Dec
 2022 03:39:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Sat, 10 Dec 2022
 03:39:32 +0000
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
X-Inumbo-ID: 501af382-783c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlsZnQec8HLWDOeAbpVHnGPpbrwJcDiXTvvj1z8NwSA=;
 b=8Ps3eDMPK20qyy6OP78WAHWM0l/iwMBxqiWsjxRfFGY+4oQ33J1hYEL9auYvz2jbZMt0gAkdcilCz1vMXkuJyrR2jXK4oVzSHteeFO2w5ORuQE/um0b/lhwLpN1mHA01fr2FgBgnRfN3t6cCeoMGyFHYB3lXxFFUah6IAhHZIjg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jb21g9Vhg43A34EALcriabuBAoDOnf3DynsvE+MDuyWOZgKu1dIRBlCnd2OSkFUovPYfXtIF/rYtPpqmG9n3gYtQy2Ne75tx9HevkQNRTtc9ZlvIIfyJUk3YhvXk21159bR1o52Ji9m2w2aQo3WAj785LiWrditfuycNZbtrLzhrPaFS3/pNxbb/fQ+CtWG/5xK3tKiUSXosRAyvlr10CmA6EKpEvI2lsq7sYNwwLOa6wPeBQnPP8fhAP/1Q7EZZj3GMjBzJMr63udsW25JMpJXW9+gP4R1hizawQneYmrjGAXqyQr1Ignlo6Pyjfvz6lq6rYaWdDaVBjAdJU2ZwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlsZnQec8HLWDOeAbpVHnGPpbrwJcDiXTvvj1z8NwSA=;
 b=HSB7myMxdp6iVZvWRXZ96QPGrDW0S+nFzI2BV6ptcQWxUVfY/kLQAnIQ8ymN2GStL3VVcX7ZTxYipmOsSmWTZKooURSJJGcISfP7/cYPOnsaFgGp/JY+uZ+qGjv8nF/wQeWerFunR2juum87JlnonaT3pQ24dV4rUgdseh2SCGJPZD+Eznqn2WZTEedDbLkxCDu4dN6wys9ss+bd4QnDDcYVU8cZRFDOeNnboPnwnL4jEcY/uBZUHoRXnf+iHvYShcrMO2aCVejYDQln8OJ4GRNLvZBmGk4UScda0Y4Vs6WRxThBErGr/u/I1y0fZ4ufPowkxiGl55ElJMvowwB+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlsZnQec8HLWDOeAbpVHnGPpbrwJcDiXTvvj1z8NwSA=;
 b=8Ps3eDMPK20qyy6OP78WAHWM0l/iwMBxqiWsjxRfFGY+4oQ33J1hYEL9auYvz2jbZMt0gAkdcilCz1vMXkuJyrR2jXK4oVzSHteeFO2w5ORuQE/um0b/lhwLpN1mHA01fr2FgBgnRfN3t6cCeoMGyFHYB3lXxFFUah6IAhHZIjg=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Thread-Topic: [PATCH 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Thread-Index:
 AQHZCFVpJ7Devc/hmEy35+ez8tCKHq5hqCsAgACqrwCAALLIgIAACnqAgAAL4ICAA2F/EA==
Date: Sat, 10 Dec 2022 03:39:32 +0000
Message-ID:
 <AS8PR08MB799135DFF656809F03039BE9921F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221205025753.2178965-1-Henry.Wang@arm.com>
 <20221205025753.2178965-2-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2212061716170.4039@ubuntu-linux-20-04-desktop>
 <8e635354-fdf4-a37f-0dba-c4b29063e152@xen.org>
 <alpine.DEB.2.22.394.2212071424060.4039@ubuntu-linux-20-04-desktop>
 <556d4b3f-3983-a336-f299-ce6b2b4a6e72@xen.org>
 <alpine.DEB.2.22.394.2212071534260.2730675@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2212071534260.2730675@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 29711793009868458E00CC9F2C9D80E8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9723:EE_|DBAEUR03FT012:EE_|AS2PR08MB10208:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c6b8b8-fdbf-45b2-5d2e-08dada603286
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VQaoul9TjRGFiKILeYhs1FaadClTwSD/J8oSOpYFfjHfYSyssGDWq0xadnQxPbnfOOsqWGIR6590LPAsyoNOgipU75nGOxohPY7XYWlwTKriI3vNlr1Y4osTXbpMIcIAfyGMvx1UfB1It9XVE5oShrbVlfgQQnQS/PQLc/wB2Gkd9n5c/RBBBQ5csDCD8l50tuo0X38Fi+dGY+mm1SannPNcwRtrylKkC+npfyCS9Xrenz7IM4K3mQJNTFKuwPljZL4aP8mblJZel/f8LhQoXBAynQ+viHBl/A+L6ntLuddisq4bb10aK09wIQA/Q/BPjtcfuR6a6blPf3mNuW+xhz4FGsM9eLxP5IubmCxZDDOH/4fRBIdo+xfAakBhf9H62OPkzoUGrK1PcdD31J25MvVi8/OTIgGGZ6KZCQtc6DbT/KTN2dARwGgBC1SadMPsFuH6dRWWw3fwhNUltM3FrZhx33RO/yX/FLigFz8P8jzu99/pnh7eMbvQWXxWatwNEhnVH1pCerVKobhpW4WspUegksGuEJBvQRjS8VoJURpxL8MLO8hhlgm8tkmyDfiLpmeXlggT2svHjBu1kWSq/16qTp+r005AohIbzL/tHUoBkJcK49gujXQunpRP64EBfUIk2XW5htUhJfCfX8UUsl6WRcLL4KSaO+4K8GgdzLZnVQNIKbxuE9mqCFHfCD2zEbVmCHQhdzDk3wilm6aj7KO+1KdGxsdiB6V2GVQ+meA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199015)(186003)(41300700001)(66476007)(66446008)(66556008)(66946007)(76116006)(478600001)(7696005)(9686003)(966005)(26005)(5660300002)(8936002)(316002)(38070700005)(6506007)(33656002)(86362001)(122000001)(2906002)(64756008)(52536014)(8676002)(4326008)(55016003)(71200400001)(54906003)(38100700002)(110136005)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9723
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9b458bf6-d233-4d50-f2e3-08dada602673
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QivIRqKVDBngDfUJaI0fsOvGdJ0mSzU1sstfG4wLR5LHTWSeLsrf8DlZLj2R217RaJcO1hL2lUK+XfkXdOIHOa6y6vKDupx2s1QODaCFQhKg/wqZe5I5pXdGVpIYB+z+SM/6Ok6extFQxKc6gwoP0Gkx4dGK19bcW0CkJ5x6VIGGNBgTqo7VNkHW0lOkBsBVZAxWchsp0eiHrauSKFtTkbtkTfmuvUrFS+fYxtxoZz0lfnSZgz8C4vU9G3Wybj18rmCfVbwArBTfkXEc5r0VZvSdJHSpqgo9YM7aMbTE/+x/FtRL0BqqUa5DV//b1WCcL2z6sdnpAVdbaHD6MeYnCH8yYB5LDFnJNTn1Z3U5dYJZm5IOBAIst8YBNcK4y56hMxQnBXxFeWqPazKwQHPNva6bo+8MgSal5Cae7wBgl3pfVm5duktxDsqKX75cuusSfxgmZ36SazZ7s/ET8MxCBeG4kQprVX9Mp7sa1+NWF1CKvbhdJWOL5CLq/81ShnlYZJYGzoYw1HZ6qs4/WGooys/tlTRexKuY1rd3Ie6Z8IpYqEnNMSlkLZ6jc68+G3Z0e9XVL31birp3G4SMDpXw7xnBJfRVw63FlUeoL0269m7zclv3lCA8eyGnlfVIWLmcwkwQbJ/JVxga0L/iDSJ+oe+nQpAdGFURRWLcyqBlxgtHLcX8767Ce0EfPGPg4HwxAUhkFGidtPHzKX8YxHp9opNXw6XOt75ATfWuNC+kgkk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(186003)(478600001)(8936002)(41300700001)(70206006)(36860700001)(8676002)(4326008)(70586007)(55016003)(52536014)(40480700001)(966005)(107886003)(47076005)(5660300002)(33656002)(83380400001)(26005)(54906003)(110136005)(9686003)(81166007)(40460700003)(2906002)(6506007)(82310400005)(316002)(7696005)(86362001)(356005)(336012)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2022 03:39:52.5728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c6b8b8-fdbf-45b2-5d2e-08dada603286
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10208

Hi both,

I was lurking around to see how the discussion would go. Thanks for the
discussions/inputs in this thread :)=20

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [PATCH 1/3] xen/arm: Add memory overlap check for
> bootinfo.reserved_mem
> > > It cannot be a single static inline function because the bootinfo
> > > arguments are of three different types, it just happens that all thre=
e
> > > have a "start" and "size" struct member so it works great with a macr=
o,
> > > but doesn't for a function.
> >
> > It is not clear to me what are the three types you are referring to. Lo=
oking
> > at the definition of bootinfo is:
> >
> > struct bootinfo {
> >     struct meminfo mem;
> >     /* The reserved regions are only used when booting using Device-Tre=
e */
> >     struct meminfo reserved_mem;
> >     struct bootmodules modules;
> >     struct bootcmdlines cmdlines;
> > #ifdef CONFIG_ACPI
> >     struct meminfo acpi;
> > #endif
> >     bool static_heap;
> > };
> >
> > cmdlines is something uninteresting here. So we have two types:
> >   - bootmodules for modules
> >   - meminfo used by reserved_mem, mem and acpi

Exactly, we need to check the given input physical address range is
not overlapping with any of the banks in bootmodules and meminfo used by
reserved_mem & acpi.

> >
> > Looking in details the code, now I understand why you suggested the
> macro.
> > This is far better than the checking what the array type (not very scal=
able).
>=20
> Thank you :-)

+1, I also thought this would be quite painful to extend in the future (onc=
e we
add a new member in bootinfo, for example what Penny did in [1], we need to
extend the overlap check as well), but I didn't think of using macro so tha=
nk you
Stefano :)

>=20
>=20
> > Personally, I think trying to share the code between the two types is a=
 bit
> > odd. The logic is the same today, but I envision to merge reserved_mem,
> mem
> > and acpi in a single array (it would look like the E820) as this would =
make
> > easier to find the caching attributes per regions when mapping the RAM.=
 So
> > sharing the code would not be possible.
> >
> > That said, if you really want to share the code between the two types. =
Then
> I
> > would prefer one of the following option:
> >    1) Provide a callback that is used to fetch the information from the=
 array
> >    2) Provide a common structure that could be used by the function.
> >
> > This would match other generic function like sort & co.
>=20
> I think option 2) would be the best but I couldn't think of a simple way
> to do it (without using a union and I thought a union would not make
> things nicer in this case).
>=20
> Rather than option 1), I think I would rather have 2 different functions
> to check struct bootmodules and struct meminfo, or the macro.

I personally don't have specific taste here. I think the option
is good one as long as we can (1) share most part of the code (2) make the
code easy to extend in the future. So as long as you two reach
a consensus here I will change to the agreed method in v2.

[1] https://lore.kernel.org/xen-devel/20221115025235.1378931-2-Penny.Zheng@=
arm.com/

Kind regards,
Henry

