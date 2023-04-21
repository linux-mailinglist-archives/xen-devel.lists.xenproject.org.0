Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219A6EA3BC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 08:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524448.815388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppk6w-0007m8-FN; Fri, 21 Apr 2023 06:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524448.815388; Fri, 21 Apr 2023 06:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppk6w-0007jG-CJ; Fri, 21 Apr 2023 06:19:10 +0000
Received: by outflank-mailman (input) for mailman id 524448;
 Fri, 21 Apr 2023 06:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slXh=AM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ppk6u-0007jA-Gw
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 06:19:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b483cba-e00c-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 08:19:06 +0200 (CEST)
Received: from AM6P193CA0107.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::48)
 by PAXPR08MB7365.eurprd08.prod.outlook.com (2603:10a6:102:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 06:19:02 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::8e) by AM6P193CA0107.outlook.office365.com
 (2603:10a6:209:88::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.27 via Frontend
 Transport; Fri, 21 Apr 2023 06:19:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.24 via Frontend Transport; Fri, 21 Apr 2023 06:19:01 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Fri, 21 Apr 2023 06:19:01 +0000
Received: from 14df61cd0fd9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D72305C-93DC-424F-A0A7-C0D7CB369AA7.1; 
 Fri, 21 Apr 2023 06:18:50 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14df61cd0fd9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Apr 2023 06:18:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB9689.eurprd08.prod.outlook.com (2603:10a6:20b:607::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 06:18:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 06:18:47 +0000
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
X-Inumbo-ID: 6b483cba-e00c-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZbSnU5Dj0hCxeLw/YUMLbImyl1A3Ia5b1rQ7yzBo1w=;
 b=C37k9z3hzeJY4dqoeWaYg0PjAHJE03XPMB354QfbW1AMaXIyoAdcZtaX7S7QezelCDvRGcl7GJHqTlBb3CZMBB2nPPlKeonZ8FmlGMEDrFtuLLbJYkXN4AR57uRHdBwYeq+RGkvjGF/B5RtXvyE1KkJD2oqAk49PXBa/ltSOfBk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6335a298667bd911
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4cTCIXohqYmd2dOqlM1AuwQ1EKzMR6x/NXRZL69VHCYok5IUSaOxRVhRgEhO07tUB2FY6k9a1fo6wjza1Tie/pTlAnXEf4ILgjTNOWG04b7Gge2bWB6csy3PRISFBs07NwQEtf+Sfy42wFzkDpa8p60TNRZlN/C9kz08puVvjyBZnUM+0aTBEh0D77VIg5a0YdDrPPzjy1Cjv6VTF4kBSIO75pmIWOXPL6ac5X9bGxW0kHwKSWKJvqMnnIBG5AnLlrEJGBFmlIeaJ/FYY0//LnFEp2nyD4GylPCK1/CygVLNLHOHEUNnd2JcHDvDJb8zQYp6WQOCCyk0FVJmd5PBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZbSnU5Dj0hCxeLw/YUMLbImyl1A3Ia5b1rQ7yzBo1w=;
 b=WeauND7aKFLCk+fFrW6bIpGFZWmQ1CYtDeK1AMGp/RAocIopuuW7fledtJZH3dJQeAyKLY187CHl2ICPxaNXohNoKKtIUeCrZDbzoblDElld+QbxY8kuimKlzBtSHiEEEa+tBuis/5T1Z1Ey6qoc5h11nFucDk1hYFwk1mBbIrpDLMbc4riHh7cAMKJZn4WwHU2mb3/Sc/NZj+IslacnCtLz3E6cIIcBdVc8PLrqPrMutM+XSmDeW/2d1HstJeAJ4FOhUnuFhSe3QWgguZIWwi04xdTPuI7NT3p/jlTumcz1zW/E57DdhifQo9nqBWCPOg75qN1pxRdbIC8twFXutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZbSnU5Dj0hCxeLw/YUMLbImyl1A3Ia5b1rQ7yzBo1w=;
 b=C37k9z3hzeJY4dqoeWaYg0PjAHJE03XPMB354QfbW1AMaXIyoAdcZtaX7S7QezelCDvRGcl7GJHqTlBb3CZMBB2nPPlKeonZ8FmlGMEDrFtuLLbJYkXN4AR57uRHdBwYeq+RGkvjGF/B5RtXvyE1KkJD2oqAk49PXBa/ltSOfBk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>, Julien
 Grall <julien@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <george.dunlap@cloud.com>, Juergen
 Gross <jgross@suse.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: Xen 4.18 release schedule update and poll (was: RE: Xen 4.18
 release: Proposed release schedule)
Thread-Topic: Xen 4.18 release schedule update and poll (was: RE: Xen 4.18
 release: Proposed release schedule)
Thread-Index: AQHZdACYcHm0T1gRME+oVIqMr2d2RK81SjQA
Date: Fri, 21 Apr 2023 06:18:47 +0000
Message-ID: <26AF44F7-A028-4737-9BF9-266CBAA83A18@arm.com>
References:
 <AS8PR08MB7991424A3167C70A9B29530C92929@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB7991EAA2EF0E381FAFB4C1FD92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7991EAA2EF0E381FAFB4C1FD92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB9689:EE_|AM7EUR03FT022:EE_|PAXPR08MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad40d74-2fac-4f81-21ca-08db42304ca2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5TcunEkh4Wkvov8ya0WS3YCFnyUdcg4KezEgpFEGdBY+gvrR4l+4n3w+W3oWgLtobdgZj4JaYOhlMBT1h/NZXo4xmtUwXPWnFH0Zc9Z7l++luQJD11Yx2I/HvDcqnoNZSleC5K9Kj2H86BszZF5/jXpUQFhpWfsxXvJ5FeZJaBcO5k3HzfMvlrD1h727AadIWv5gBi+L5FOmE1/clR6b9mrJEMrNb/W74VIQRm9yUFs48RZ2g2N0ozpHjTKkF2xdfvAfU6im7RNKSoAqa/Nw/QF7/CKFAhHVOUJjguyc3glSjxKfmi05xTs/jK+9+rWBYwZK7rn6XG66PTPtyn26YYVEpaOdpt3QvXPlO95NRcOwzwnNUcB8nBZ3a6+N7LuM1yyVHyQpxN58rOJHVlPU6IuO5fgdrOW8FzlSVbjKkVPi+xMEkkTyBZ8UrRdx+jq8JwoUacE0dnUJYSUOhR4V495EuqKpQ8xxBs+w1g4GrJ01x6fqkkuiExfhkzjkcWVT/Gl1hEJLC1g5adEmIfqC2W2e7PaAcjzSr2qRnARZg9dl9soPArQ4me4vMRhk7BJ2XAkGzSevRAxc/wiEH5/ApBY1FTus+Ap1rnUGSogt+/1+g1Kxh9u13xjtc4DB+CT5sz3I4CXlHZaNsAnDVUtZLA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(36756003)(7416002)(15650500001)(38070700005)(2906002)(38100700002)(8936002)(8676002)(5660300002)(6862004)(86362001)(186003)(33656002)(6486002)(71200400001)(6512007)(6506007)(37006003)(54906003)(6636002)(478600001)(2616005)(83380400001)(53546011)(66476007)(66556008)(66946007)(316002)(66446008)(41300700001)(122000001)(91956017)(4326008)(64756008)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F5E1E87777C1574CB4884FF0B18C589D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9689
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be51319b-2e82-4c63-aa75-08db4230443d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y5aokEdi++7nvbh2myNeiwgRr+C4BzwtBDlgWbMH/DWAKbZY8efSh4VaLo0VH8Fa6NZ/FXzBS6hPUXMLCtqE718Za9hsXQWtUGCmDhMh+JCiLfX8mlbrksZKSHRq/Tckl/y9TcA750x2GV5ASzsgHlQEVv33NJCBIuw+H+BfuvaK80J9mOPw+Mppb7R0iPNx955rw+WKbOSevZBBTpB4v3jK2X7K7YGo5KY+U6OEKIyd27B0Ald35FlWGRrXnoxPH4f5i+F2azoTms9ffGngJVeEV1+1fv3SURQlwgiQliDZhZIy76sgypOHdLpwVH63KaxkUnNkMXBOytZZ4wLTlGAKc3H+TmqTtd23d9pYwfwyS/B4j8Z3E2kmnGKlNVMCE5FKI578XnzSVyhm/mq51w9eicOqgY2oyu8TSOL1+MY3K1Lzp2ZomZ0b7uPbxUH3KzT/mJEFgJJKGQL9HpeK7dh33aqjoVJvLYJt4wt/rBWaTrYDwyfPlmSaCmSSBr0oMkDK52bLi8XH7kO1On+H2/+idtP3VyUQRTCoCBuhz56zaM8sgkJFB4IULc/9XxntZ6a8KqEpHvH34RmbUa1eJrYY37kwBgi11eH/D5KSY/3x97Hml+dF50P42BLobdxgRlIWPXwNSmkivdDNCX1Wa2fptgb6rgF2ty0BPvbmTuLdt9Dq28OZAm/kCDbfYLjiS5rftzzNff7wbTq7bkt++g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(36756003)(70206006)(40460700003)(15650500001)(2906002)(8936002)(8676002)(5660300002)(6862004)(40480700001)(86362001)(82310400005)(186003)(33656002)(6486002)(6512007)(26005)(6506007)(37006003)(54906003)(6636002)(478600001)(36860700001)(2616005)(83380400001)(47076005)(336012)(53546011)(316002)(81166007)(41300700001)(82740400003)(4326008)(70586007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 06:19:01.4145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad40d74-2fac-4f81-21ca-08db42304ca2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7365

Hi,

> On 21 Apr 2023, at 05:22, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi all,
>=20
> Following the discussion in April community call, here comes the two
> updated possible release schedule options that I came up with.
>=20
> Both of these two options will satisfy the requirements/concerns that
> I've received so far. But I personally would prefer the option 2 as we
> shouldn't expect there will be much progress happen in August due to
> the EU holiday season. I wonder if anyone has any objections or alternate
> suggestions.

Even if the release date is in september, all major deadlines will happen i=
n August.

So how about introducing an end of october possibility ?

Cheers
Bertrand

>=20
> Please don't hesitate to raise your concerns and opinions. I would
> encourage that the feedback collection is cut off by the middle of May
> (say May 19). If nobody will have anything better, then let's go option 2
> by "lazy consensus". Thanks.
>=20
> ** Proposed option 1: Wed Aug 30, 2023 **
> (+8 months from Xen 4.17 release)
>=20
> - Last posting date          Fri Jun 16, 2023
>=20
> Patches adding new features are expected to be posted to the mailing
> list by this date, although perhaps not in their final version.
>=20
> (Note that Xen Summit is Jun 24 - 26, 2023)
>=20
> - Feature freeze             Fri Jul 7, 2023 (+3 weeks from Last posting =
date)
>=20
> Patches adding new features should be committed by this date.
> Straightforward bugfixes may continue to be accepted by maintainers.
>=20
> - Code freeze                Fri Jul 21, 2023 (+2 weeks from Feature free=
ze)
>=20
> Bugfixes only.
>=20
> - Hard code freeze           Fri Aug 11, 2023 (+3 weeks from Code freeze)
>=20
> Bugfixes for serious bugs (including regressions), and low-risk fixes onl=
y.
>=20
> - Final commits              Fri Aug 25, 2023 (+2 weeks from Hard code fr=
eeze)
>=20
> Branch off staging-4.18.
>=20
> - Release                    Wed Aug 30, 2023
>=20
>=20
> ** Proposed option 2: Wed Sep 27, 2023 (or the first week of Oct)**
> (+9 months from Xen 4.17 release)
>=20
> - Last posting date          Fri Jul 14, 2023
>=20
> Patches adding new features are expected to be posted to the mailing
> list by this date, although perhaps not in their final version.
>=20
> - Feature freeze             Fri Aug 4, 2023 (+3 weeks from Last posting =
date)
>=20
> Patches adding new features should be committed by this date.
> Straightforward bugfixes may continue to be accepted by maintainers.
>=20
> - Code freeze                Fri Aug 18, 2023 (+2 weeks from Feature free=
ze)
>=20
> Bugfixes only.
>=20
> - Hard code freeze           Fri Sep 8, 2023 (+3 weeks from Code freeze)
>=20
> Bugfixes for serious bugs (including regressions), and low-risk fixes onl=
y.
>=20
> - Final commits              Fri Sep 22, 2023 (+2 weeks from Hard code fr=
eeze)
>=20
> Branch off staging-4.18.
>=20
> - Release                    Wed Sep 27, 2023
>=20
> Kind regards,
> Henry


