Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7176EA3E2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 08:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524458.815408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppkLK-0002Jy-4m; Fri, 21 Apr 2023 06:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524458.815408; Fri, 21 Apr 2023 06:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppkLK-0002Hd-14; Fri, 21 Apr 2023 06:34:02 +0000
Received: by outflank-mailman (input) for mailman id 524458;
 Fri, 21 Apr 2023 06:34:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ii9+=AM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ppkLI-0002HX-Qt
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 06:34:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f6d8e8d-e00e-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 08:33:59 +0200 (CEST)
Received: from AS9PR06CA0270.eurprd06.prod.outlook.com (2603:10a6:20b:45f::31)
 by AM9PR08MB5921.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 06:33:47 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::9f) by AS9PR06CA0270.outlook.office365.com
 (2603:10a6:20b:45f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.26 via Frontend
 Transport; Fri, 21 Apr 2023 06:33:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.14 via Frontend Transport; Fri, 21 Apr 2023 06:33:46 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Fri, 21 Apr 2023 06:33:46 +0000
Received: from 41676200c72b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DBAAE765-0658-4083-90BD-6BA3E169A8E9.1; 
 Fri, 21 Apr 2023 06:33:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 41676200c72b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Apr 2023 06:33:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB8022.eurprd08.prod.outlook.com (2603:10a6:20b:585::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 06:33:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 06:33:26 +0000
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
X-Inumbo-ID: 7f6d8e8d-e00e-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYzOEI2eF1FWNwl0npH+OXcAlyJMzXWHPO1EsCBi8u4=;
 b=d3hw0VVSLvFST2br9gVBViKAB/isdX+LlicSzVJNyqUvhv70OJzwIOTAgFiHzFWFBEvCk/TUSJDRwyTU0Vk3VBV67V6J9RBKFxcyiXoDhL1oIwsxO3FZFOonqrxyoaePziBGACm9drY0u23z39q3t3E3w/QnkO7SY/rUf6gvV/M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1iKJqegWuVQfXEeLcAIqXpt8hZDfiZZaqAyS1J6NHUBw/TnV6Vl/sABLaEiXog/b1R3sHOSwUgE/5dIxbbI0V/suVBU76Dc6/qjtEKv8yqLmm8RINRQ+wpngoTLGRBxYTR75smrDo7aseO5ZTspaXIk/FIDni9149ccIT5VFnakSTziUtBFC0uF533yCuvGuSzzmLMIYcp8bAo80Wzh3ie8Rs/YTflAhTVfS11xzBUC7ADv8R5mOpqUkhAwJBWOqxbTvSSPMDsNOVKPrgAgLTi+RcM0E3hb9QZm76ftjoeqA85mn2GwBeawGJSh0o55HyHuISTXBFZeHWgIzCEFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYzOEI2eF1FWNwl0npH+OXcAlyJMzXWHPO1EsCBi8u4=;
 b=SpxXF9Hn4fUR2UaEA+jfmWDo4+A38Xk7FgxWkr9joIlyTFuI4TIRuOiXzJSznUCqWKp7nbjUD4ZYCHDdFItHxYAz5kTdNZINqCdQDOP1xssYls9b7wJI1JWp4Ja15qVJIKaF1WKrhKy8NaDtpcK21VuMI2FieepwOlv+ya42R6vy6QaYhWf3kZKs5jfE+j81cLrS9nP16b4dKy3ABdPAovTyG192UNuJV04zJxNG7kGXL/hGG762wHvr8d3pzgYUVXC+9JVKa+KmNkg4M5yChlzrouhRbqAw05o8bCWfiFzsbv4vsje14Yeah/oDNKrg/aGKqP8h4k7q/iNp0Jghjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYzOEI2eF1FWNwl0npH+OXcAlyJMzXWHPO1EsCBi8u4=;
 b=d3hw0VVSLvFST2br9gVBViKAB/isdX+LlicSzVJNyqUvhv70OJzwIOTAgFiHzFWFBEvCk/TUSJDRwyTU0Vk3VBV67V6J9RBKFxcyiXoDhL1oIwsxO3FZFOonqrxyoaePziBGACm9drY0u23z39q3t3E3w/QnkO7SY/rUf6gvV/M=
From: Henry Wang <Henry.Wang@arm.com>
To: Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
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
Thread-Index: AQHZdACNvTYSYql02kern4BL0bR1K681SkGAgAAAU2CAAANQoA==
Date: Fri, 21 Apr 2023 06:33:26 +0000
Message-ID:
 <AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB7991424A3167C70A9B29530C92929@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB7991EAA2EF0E381FAFB4C1FD92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <26AF44F7-A028-4737-9BF9-266CBAA83A18@arm.com>
 <AS8PR08MB79918CB17D6E1C987B5F048992609@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79918CB17D6E1C987B5F048992609@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8C47D913FFD3B945863394E97D56FC7A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB8022:EE_|AM7EUR03FT034:EE_|AM9PR08MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: a32131dc-efb3-4529-e4d4-08db42325c57
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8mMGFoApNNgIDQBya5hTk3RzlHtq8y/1wHu0wTmh7I+T3aRdAAw1qogk3pIjO5DxluqpOSXl1kYP/vKwZbcYgURT6ftOw19W8Y9NyikSMIbQALZV3yQj8hPRQKX2WNFKXzAJttOyJQ4docE86+tPqxkJOXH3Rnmr5dJWk0lZFN0UnYvi3jLHGpyXx2hnfdStvirpUzaIB24JlUQDdIBWJrx/WoHyCo3EuwllwmH05c/3dkn+lNe/QdaH+KEvUJ8Ai43wfGqyeatIJNH64SJwMI4dQiai4e3cd9ZoYeJv9WXKO/Fe8iM6yoD8x3bDBujycxupjP6KkdG0YfUpGFwzGJxpx4ZoP83YiwocI3Zr1tnfo3ntn389wqX8GGSKBKhCABXIwHd6IUcNk9K7N6Dy55bOub5UoWmw2/M5KAJW7ve+4kxHR2R7N03R940zXN9ZAHWGOLwuS9PH4LWUUay3Tk+Awe3zrLHVOgl7ANFsRYgoZvSbZ9b66qIzC7SFI1kntjJaOmmHpTq/dcpZd1Ft2Bsn+caypxtCiXrinMK19za0WK6WlMPRLF6WYDCzoDAreY7C4fkINwX6zFDWaIEsw1vwQ0ZcsTKLmGfwCImry36fUhOcqu/ik+bBQMGZwIJc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199021)(186003)(6506007)(71200400001)(53546011)(9686003)(26005)(15650500001)(7696005)(2940100002)(38100700002)(5660300002)(41300700001)(52536014)(4326008)(8936002)(66476007)(76116006)(66446008)(66946007)(66556008)(8676002)(7416002)(110136005)(54906003)(478600001)(2906002)(316002)(38070700005)(64756008)(86362001)(33656002)(83380400001)(122000001)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8022
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a2823ec-af35-445c-8a2a-08db42325025
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AY/FyHoX48I5urUh4zyzWBiU4r1Zge3yiGYeOSNsRQ910nPgHiO397P0+f5xt/LFdL8/aW1Er2TfcqzIp8ngPiOoWer13NAXzfpivLJhbBdbwjg7lPP/XphdDp5KBtlj+uAIzRbf/kGf0RbnXW/AqhYS/XXzfQp4LSs+WcOSieAkVsF6Xu6/rBByVPTPkeqzjCOlVNj9FFKyua5gYwTijqGCDzL6tvOt1I8kMA9yw9AdzQS0Lj6fS5GXUYPZux4RKUaWxHw6c5BAAyXEaS4HKwp4ZAaeh1SwNwakvuWs+l2dIPxnLbxN6Bx4igyXuXzbQ2ds5HuldJLsX+lRX6HGBZmkQxgOfhM3iatKO9hRXHT7wN4Ijkv6p79PV5/+lKUPUsfUGUeU3jhIO1DcFY0993bltT/dZJOc1MdGokW3bH/RMbl33xDHZE7GcqZ+hLMnVeq++t4S5B80PHwj2XqrNTOhx0/1ylKICRHtqkuX2PsTAdJdAIFEznRpOxHb26qCFBN/bfp3rxnNTtXSslymN/tUCThIVhzcCcMdTJOdi5x0x3UmUkG3VXYeRhfKUyXW93bC63copjXlpgPcoaC9k9YL0jeJY+Oxbl37oaIr8PipNM6WFZtTggcE5xlLeGnnpqNQUu8NaBf1NV18PbQgY6xLTQnhCZq0CKcU5G6dESQOFCCUYmo2C65aerJh9ofOF4u0+JCgr4tPQjtMbkrwLA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(52536014)(40460700003)(7696005)(15650500001)(86362001)(83380400001)(36860700001)(33656002)(53546011)(40480700001)(47076005)(2940100002)(336012)(82740400003)(82310400005)(356005)(81166007)(9686003)(55016003)(8936002)(8676002)(26005)(186003)(6506007)(41300700001)(316002)(4326008)(70586007)(70206006)(2906002)(110136005)(54906003)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 06:33:46.7338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a32131dc-efb3-4529-e4d4-08db42325c57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5921

Hi,

> -----Original Message-----
> Subject: RE: Xen 4.18 release schedule update and poll (was: RE: Xen 4.18
> release: Proposed release schedule)
>=20
> Hi Bertrand,
>=20
> > -----Original Message-----
> > From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> > Subject: Re: Xen 4.18 release schedule update and poll (was: RE: Xen 4.=
18
> > release: Proposed release schedule)
> >
> > Hi,
> >
> > > On 21 Apr 2023, at 05:22, Henry Wang <Henry.Wang@arm.com> wrote:
> > >
> > > Hi all,
> > >
> > > Following the discussion in April community call, here comes the two
> > > updated possible release schedule options that I came up with.
> > >
> > > Both of these two options will satisfy the requirements/concerns that
> > > I've received so far. But I personally would prefer the option 2 as w=
e
> > > shouldn't expect there will be much progress happen in August due to
> > > the EU holiday season. I wonder if anyone has any objections or alter=
nate
> > > suggestions.
> >
> > Even if the release date is in september, all major deadlines will happ=
en in
> > August.
> >
> > So how about introducing an end of october possibility ?
>=20
> Thanks for raising this. I am personally good with this plan. If nobody o=
bjects
> this proposal then yes why not :-)

And here comes the option 3:

** Proposed option 3: Wed Oct 25, 2023 **
(+10 months from Xen 4.17 release)

- Last posting date          Fri Aug 11, 2023

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

- Feature freeze             Fri Sep 1, 2023 (+3 weeks from Last posting da=
te)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Sep 15, 2023 (+2 weeks from Feature freeze=
)

Bugfixes only.

- Hard code freeze           Fri Oct 6, 2023 (+3 weeks from Code freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes only.

- Final commits              Fri Oct 20, 2023 (+2 weeks from Hard code free=
ze)

Branch off staging-4.18.

- Release                    Wed Oct 25, 2023

Kind regards,
Henry

> >
> > Cheers
> > Bertrand
> >
> > >
> > > Please don't hesitate to raise your concerns and opinions. I would
> > > encourage that the feedback collection is cut off by the middle of Ma=
y
> > > (say May 19). If nobody will have anything better, then let's go opti=
on 2
> > > by "lazy consensus". Thanks.
> > >
> > > ** Proposed option 1: Wed Aug 30, 2023 **
> > > (+8 months from Xen 4.17 release)
> > >
> > > - Last posting date          Fri Jun 16, 2023
> > >
> > > Patches adding new features are expected to be posted to the mailing
> > > list by this date, although perhaps not in their final version.
> > >
> > > (Note that Xen Summit is Jun 24 - 26, 2023)
> > >
> > > - Feature freeze             Fri Jul 7, 2023 (+3 weeks from Last post=
ing date)
> > >
> > > Patches adding new features should be committed by this date.
> > > Straightforward bugfixes may continue to be accepted by maintainers.
> > >
> > > - Code freeze                Fri Jul 21, 2023 (+2 weeks from Feature =
freeze)
> > >
> > > Bugfixes only.
> > >
> > > - Hard code freeze           Fri Aug 11, 2023 (+3 weeks from Code fre=
eze)
> > >
> > > Bugfixes for serious bugs (including regressions), and low-risk fixes=
 only.
> > >
> > > - Final commits              Fri Aug 25, 2023 (+2 weeks from Hard cod=
e freeze)
> > >
> > > Branch off staging-4.18.
> > >
> > > - Release                    Wed Aug 30, 2023
> > >
> > >
> > > ** Proposed option 2: Wed Sep 27, 2023 (or the first week of Oct)**
> > > (+9 months from Xen 4.17 release)
> > >
> > > - Last posting date          Fri Jul 14, 2023
> > >
> > > Patches adding new features are expected to be posted to the mailing
> > > list by this date, although perhaps not in their final version.
> > >
> > > - Feature freeze             Fri Aug 4, 2023 (+3 weeks from Last post=
ing date)
> > >
> > > Patches adding new features should be committed by this date.
> > > Straightforward bugfixes may continue to be accepted by maintainers.
> > >
> > > - Code freeze                Fri Aug 18, 2023 (+2 weeks from Feature =
freeze)
> > >
> > > Bugfixes only.
> > >
> > > - Hard code freeze           Fri Sep 8, 2023 (+3 weeks from Code free=
ze)
> > >
> > > Bugfixes for serious bugs (including regressions), and low-risk fixes=
 only.
> > >
> > > - Final commits              Fri Sep 22, 2023 (+2 weeks from Hard cod=
e freeze)
> > >
> > > Branch off staging-4.18.
> > >
> > > - Release                    Wed Sep 27, 2023
> > >
> > > Kind regards,
> > > Henry
> >
>=20


