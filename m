Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A36EA3C8
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 08:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524452.815398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppkAL-0000kO-U7; Fri, 21 Apr 2023 06:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524452.815398; Fri, 21 Apr 2023 06:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppkAL-0000iC-Qy; Fri, 21 Apr 2023 06:22:41 +0000
Received: by outflank-mailman (input) for mailman id 524452;
 Fri, 21 Apr 2023 06:22:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ii9+=AM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ppkAJ-0000i4-Gi
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 06:22:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8818e4f-e00c-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 08:22:37 +0200 (CEST)
Received: from ZR0P278CA0185.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:44::18)
 by GV1PR08MB8449.eurprd08.prod.outlook.com (2603:10a6:150:81::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Fri, 21 Apr
 2023 06:22:29 +0000
Received: from VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:44:cafe::e2) by ZR0P278CA0185.outlook.office365.com
 (2603:10a6:910:44::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.28 via Frontend
 Transport; Fri, 21 Apr 2023 06:22:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT007.mail.protection.outlook.com (100.127.144.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.25 via Frontend Transport; Fri, 21 Apr 2023 06:22:28 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Fri, 21 Apr 2023 06:22:27 +0000
Received: from da8bee436a8d.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A698BBFB-E192-4B00-AF60-D88F24204446.1; 
 Fri, 21 Apr 2023 06:22:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da8bee436a8d.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Apr 2023 06:22:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB8PR08MB5321.eurprd08.prod.outlook.com (2603:10a6:10:11c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 06:22:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 06:22:14 +0000
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
X-Inumbo-ID: e8818e4f-e00c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq670Mv16OR02ZgYB5RB2WKv6GaLRrEMgFvHvz1JLBo=;
 b=QAYrWTbcaCXBUjY4KO+T8Mu4K9bZxdW0D32PyyrnoOJy7i/iqMDapQkt5JUlyz+gDE2zWoGBz/AGJMMWzZDbXPBGsAwaDrUOnjVS7sKhE6+831yNBhiLCmaVpZvwrzGYXk5abS8/8ONS8385RyD/AoUiUjXM/+xHjqBSTwA1hn0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQzK3tvoh89hTJvrWn1T0Tfxv/ebSZbjY+HZxl0E8qawlFAHGp40+fA5ZsfuncUGQc2xRcirmAfhtvbbSZY5u1Vl2uHtA4fxFlgMpkNrze+zWsQXPV9IUxxCGM2/Mz/mwqzApYKBzKDk+GDXn7QZgG7XfRZPe7dOR9mtGR2axL76gP99bEgoPjJFMO2R34j2RBw9b19p1+0hni/cG56tf1RVycg0VpjzdfmeALJ9NcYdYvHLbEXGtB8fDTgZOb75ddkhHpWBB4IsMg4ZRajHC5wR3SSy67emcfSKZN56BUizjC8aJuSN4JVoIg3Vc7VkXRksuIXNGzFGRje3wFhEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fq670Mv16OR02ZgYB5RB2WKv6GaLRrEMgFvHvz1JLBo=;
 b=LIePveZGC9eLMi4CsFmY2tRdV+IlVfTYtTZx+wbR8Es6xRODdl5J2Sr8JA2CwV2WiDFLNswj3ODiPx4+WUQql/rDw4i+OZzwV/a9cWlHC92cTJu2Iz5YiEf7/C3O9XGkReFz0WVnN1IA2qSlbPyQbVWW6EtOFf7bfdWRQghhgxcm5lfEWLXP63coGSLRmaNQzJ0Y0U2LYfgsH/WcR3Gj8fcxBtgxAg8bbqGRS4A8TNUNN1kVI3JDl50ysM9J1ujY+18+z5kWSMNySMWEAn5Lb4yTbvzKGL39EqabdfsSPPvrWtUseHQ5CDtq6SWVH5Jj3DteAfEDtqEG71BJ9wBGMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fq670Mv16OR02ZgYB5RB2WKv6GaLRrEMgFvHvz1JLBo=;
 b=QAYrWTbcaCXBUjY4KO+T8Mu4K9bZxdW0D32PyyrnoOJy7i/iqMDapQkt5JUlyz+gDE2zWoGBz/AGJMMWzZDbXPBGsAwaDrUOnjVS7sKhE6+831yNBhiLCmaVpZvwrzGYXk5abS8/8ONS8385RyD/AoUiUjXM/+xHjqBSTwA1hn0=
From: Henry Wang <Henry.Wang@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "community.manager@xenproject.org" <community.manager@xenproject.org>,
	Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, George
 Dunlap <george.dunlap@cloud.com>, Juergen Gross <jgross@suse.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: RE: Xen 4.18 release schedule update and poll (was: RE: Xen 4.18
 release: Proposed release schedule)
Thread-Topic: Xen 4.18 release schedule update and poll (was: RE: Xen 4.18
 release: Proposed release schedule)
Thread-Index: AQHZdACNvTYSYql02kern4BL0bR1K681SkGAgAAAU2A=
Date: Fri, 21 Apr 2023 06:22:13 +0000
Message-ID:
 <AS8PR08MB79918CB17D6E1C987B5F048992609@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB7991424A3167C70A9B29530C92929@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB7991EAA2EF0E381FAFB4C1FD92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <26AF44F7-A028-4737-9BF9-266CBAA83A18@arm.com>
In-Reply-To: <26AF44F7-A028-4737-9BF9-266CBAA83A18@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 16DB2E1EA8C83F4F9A8AE6F489B8CAE7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB8PR08MB5321:EE_|VI1EUR03FT007:EE_|GV1PR08MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd88e59-418b-4f78-8593-08db4230c7fa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IvucoydqHLTpMM7mz8EUQlwTjEgaMZYv8olBCHC312xU+88DoezEv0mcpYH0kNoUxJujpx+uwDVx2oT2nFEWh1zUNR4dhpoXSxI0WyYNPd2fszzK7LJDMUV4V4akTLQsBjfJWMCxpjulqg97CVhT/lOZ91kZeKNaCZqMJgJtpDqu9PSrzBERtX1/zepDf2cUy+keA5uqVjjnnUhZXbmpRDMI7ZVMxzBgBW3xT7oD5iYxwO+jVrqtf1q7DIM0xwQUVQU5Ql0RciCaBqlvoeoqb6hTSurgQVPisGeFsRqPDoj1qlCHTzKbL/RO0LCJhHXvXmeJwXegvCjNeCSGaSGtg9r04nYGxapWmzw9dxjc0JCN60JrtefOlG43TqKDcfkEg75FEsnk8t4JMK8RYeKVFab01rrBRXHsiBeai3OiudFzi+ndF2w4uukm7s9J4GmEFDSgJnQyEOKI8QGjlVth+ItjBF91j29Q/aKGkmusnF8gWfz+ndwj1VemSLKwmQJ6VGkbTtb2pKhfkzUNsENg/mfvA1nQanBSSpVIVWevBvNCXX9rLkweqZCXwSeXI2DhwT56485fmi/0Mj22qkeCsEb6VbNmOHAzcb/pAqziZU9+8DNFjSE3JOqwp/y0WB+7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(86362001)(54906003)(83380400001)(478600001)(55016003)(7696005)(6506007)(26005)(53546011)(9686003)(71200400001)(4326008)(64756008)(76116006)(66946007)(110136005)(316002)(186003)(66476007)(66556008)(66446008)(122000001)(41300700001)(52536014)(5660300002)(38100700002)(38070700005)(15650500001)(7416002)(8676002)(2906002)(8936002)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5321
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0527b59a-3d27-4c03-6190-08db4230bf63
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KEvsgpXsAUo3s4idUPyU0Gk5AKvkPI5Gnb2RZi1z70x0QgFkOgQ1V2GCIVEBWEL7x4oALErmX+X4sLO6UXUKjIWDVCM331PZN7KzMCxM40qUWbG/INVMbieAzyShSUR0YXNvuMyx2NfILNoRPtHwwtat6jXFveVaYl4qIh8CLhBgNCw4W9Y1CjznoHHneVTjKS6BvVDxOVBkuYtZUWhzb2iJ2F7HJ+DGsHK+C6diIpG4ZwsTElVbLMf8xcGox5upMOvqT5eOrlMr1Vt3fAAz/paWXINdPEUHDVq7wt4fTk8KPeQ/+e7GmMRpx+Aw/TurzWqbtuexRPaVH3qDuQtJiY7+6PkNE24ByUwv1bTf8t6wS7b2ROSlmfjsWQkeyVUtuNOvfCiyxh7XYJYIfVobHO5P6s469AWmYI4L25Rw8H3ULCCX6wewEIL3cy0YnssiNEmNXYb5tjtFmFdd/fg3Yhr8n4E6l8N+ra5dVTsEtl0jaWIYCx8NhXdwKYOyKJHdC5GH4ZWGRYMPZmuxBoRAMIwFZLTIv1jGsXIEQ41/+lJqMMoMz6sMt3joQHbM78OzayqyLnEm8Z4SpdImewSZp4pP2KImtNK6DhgaoMloL31tKz/DG23si1L/JBpRQf3nBvACDgj8rlMP3jbPy7oYJFS88loT/oK6zqIruga1WuoR9vBzaWhOLPL4lo31tkeqUIuCkewrexIKlquqPLqTBg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(26005)(6506007)(186003)(7696005)(9686003)(15650500001)(53546011)(2906002)(336012)(47076005)(40480700001)(316002)(70206006)(41300700001)(5660300002)(4326008)(70586007)(52536014)(8676002)(8936002)(478600001)(54906003)(110136005)(82310400005)(86362001)(40460700003)(36860700001)(33656002)(83380400001)(55016003)(356005)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 06:22:28.2911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd88e59-418b-4f78-8593-08db4230c7fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8449

Hi Bertrand,

> -----Original Message-----
> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Subject: Re: Xen 4.18 release schedule update and poll (was: RE: Xen 4.18
> release: Proposed release schedule)
>=20
> Hi,
>=20
> > On 21 Apr 2023, at 05:22, Henry Wang <Henry.Wang@arm.com> wrote:
> >
> > Hi all,
> >
> > Following the discussion in April community call, here comes the two
> > updated possible release schedule options that I came up with.
> >
> > Both of these two options will satisfy the requirements/concerns that
> > I've received so far. But I personally would prefer the option 2 as we
> > shouldn't expect there will be much progress happen in August due to
> > the EU holiday season. I wonder if anyone has any objections or alterna=
te
> > suggestions.
>=20
> Even if the release date is in september, all major deadlines will happen=
 in
> August.
>=20
> So how about introducing an end of october possibility ?

Thanks for raising this. I am personally good with this plan. If nobody obj=
ects
this proposal then yes why not :-)

Kind regards,
Henry

>=20
> Cheers
> Bertrand
>=20
> >
> > Please don't hesitate to raise your concerns and opinions. I would
> > encourage that the feedback collection is cut off by the middle of May
> > (say May 19). If nobody will have anything better, then let's go option=
 2
> > by "lazy consensus". Thanks.
> >
> > ** Proposed option 1: Wed Aug 30, 2023 **
> > (+8 months from Xen 4.17 release)
> >
> > - Last posting date          Fri Jun 16, 2023
> >
> > Patches adding new features are expected to be posted to the mailing
> > list by this date, although perhaps not in their final version.
> >
> > (Note that Xen Summit is Jun 24 - 26, 2023)
> >
> > - Feature freeze             Fri Jul 7, 2023 (+3 weeks from Last postin=
g date)
> >
> > Patches adding new features should be committed by this date.
> > Straightforward bugfixes may continue to be accepted by maintainers.
> >
> > - Code freeze                Fri Jul 21, 2023 (+2 weeks from Feature fr=
eeze)
> >
> > Bugfixes only.
> >
> > - Hard code freeze           Fri Aug 11, 2023 (+3 weeks from Code freez=
e)
> >
> > Bugfixes for serious bugs (including regressions), and low-risk fixes o=
nly.
> >
> > - Final commits              Fri Aug 25, 2023 (+2 weeks from Hard code =
freeze)
> >
> > Branch off staging-4.18.
> >
> > - Release                    Wed Aug 30, 2023
> >
> >
> > ** Proposed option 2: Wed Sep 27, 2023 (or the first week of Oct)**
> > (+9 months from Xen 4.17 release)
> >
> > - Last posting date          Fri Jul 14, 2023
> >
> > Patches adding new features are expected to be posted to the mailing
> > list by this date, although perhaps not in their final version.
> >
> > - Feature freeze             Fri Aug 4, 2023 (+3 weeks from Last postin=
g date)
> >
> > Patches adding new features should be committed by this date.
> > Straightforward bugfixes may continue to be accepted by maintainers.
> >
> > - Code freeze                Fri Aug 18, 2023 (+2 weeks from Feature fr=
eeze)
> >
> > Bugfixes only.
> >
> > - Hard code freeze           Fri Sep 8, 2023 (+3 weeks from Code freeze=
)
> >
> > Bugfixes for serious bugs (including regressions), and low-risk fixes o=
nly.
> >
> > - Final commits              Fri Sep 22, 2023 (+2 weeks from Hard code =
freeze)
> >
> > Branch off staging-4.18.
> >
> > - Release                    Wed Sep 27, 2023
> >
> > Kind regards,
> > Henry
>=20


