Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17D16E674F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 16:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522950.812626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pomWP-000714-Qa; Tue, 18 Apr 2023 14:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522950.812626; Tue, 18 Apr 2023 14:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pomWP-0006z0-Nb; Tue, 18 Apr 2023 14:41:29 +0000
Received: by outflank-mailman (input) for mailman id 522950;
 Tue, 18 Apr 2023 14:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfss=AJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pomWN-0006yr-QG
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 14:41:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 190f9c30-ddf7-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 16:41:26 +0200 (CEST)
Received: from AM5P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::34)
 by AM9PR08MB6243.eurprd08.prod.outlook.com (2603:10a6:20b:2db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Tue, 18 Apr
 2023 14:41:24 +0000
Received: from AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::ba) by AM5P194CA0024.outlook.office365.com
 (2603:10a6:203:8f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 14:41:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT048.mail.protection.outlook.com (100.127.140.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 14:41:23 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Tue, 18 Apr 2023 14:41:23 +0000
Received: from dedf6fc7baa9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A2F59C6-7F54-4FA7-945C-81FA4E8F67CF.1; 
 Tue, 18 Apr 2023 14:41:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dedf6fc7baa9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 14:41:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB7350.eurprd08.prod.outlook.com (2603:10a6:102:227::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 18 Apr
 2023 14:41:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Tue, 18 Apr 2023
 14:41:07 +0000
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
X-Inumbo-ID: 190f9c30-ddf7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsp22NfGzXzD44WrV/+zmGyqXZdAYS8nZklEHUQMunk=;
 b=mRonGje7rSyQAfh27uaTE7Mwx7aftK+ZLgr2t0rmfd6KhRgFISpNNsMRdIQH9SqfG2984oHsWPCCpl4k3PB36uguzaklVdWnnIxTDuP69lPEorqm2ENgkucwJ4tikbtUtvGRMPfm24Vsd1ymekiUQ04TSjhCjso9e/2a8RNcqzg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61c031df18f2d4e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1NbIkEubXdk8EMT2IhGtnjmbBLlmY2RW99NtSuvAMdYG6uLn/fsKNtcNSmkWxlPXl3wZOOFtbgE8wUZkHl+Ca1NnQ8Ww9Rg3yH0uBWnIWnRPy1M1CZp+kdFyHcB2UcIHXHiv+ts+tFWIf+LQVSMASnm2xq9+wr+cgRnw1uzUH0rZB8WnFfI7RAQJCihkSq2eMTkZM31dSUa/L3WkoeSGoDquqLzOZPZUD/Gil01VuqN1HpMVJo7D85Hrs5w3oPc6TxiGKx5sHDTokZcN+lXCtPVnQVWs6Pj8rjiQBKqBjzatXdmplQas5YUSsCplE3QXx87Gq/yqCWbbIvkRhxmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsp22NfGzXzD44WrV/+zmGyqXZdAYS8nZklEHUQMunk=;
 b=hdAO99smMOoe/uyWZp3Y230DVwlcArLhWPgz2+eE/XMdMuLYep1DboDgA56dp4IexCJb6IAKAk1TfBl17OOJ51DE4/XrF1859TXZZECPZi/c92UgX8b96MBKmkdzrSKwknXuuhoF7RVHpC5r+xL04I7XzoADmhEbgHQGIbaU0zxb1lyXGApk7Yi22G6hoYnbrUaZH6YVPsZtzeTlqUOSQQ5P4Y9qU0f3P9FOZltxebu/x1J/0l7jSUDt0pG1gkDv9hfJ4cjJR8QDdW10qfBvCvWvnZx1a9rRmDItCXaRgq4tbDf5YTdPiZhbOXmXv2tDclghnhEzF0Q+aKnbxr/KDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsp22NfGzXzD44WrV/+zmGyqXZdAYS8nZklEHUQMunk=;
 b=mRonGje7rSyQAfh27uaTE7Mwx7aftK+ZLgr2t0rmfd6KhRgFISpNNsMRdIQH9SqfG2984oHsWPCCpl4k3PB36uguzaklVdWnnIxTDuP69lPEorqm2ENgkucwJ4tikbtUtvGRMPfm24Vsd1ymekiUQ04TSjhCjso9e/2a8RNcqzg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>, Community
 Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v5 00/12] SVE feature for arm guests
Thread-Topic: [PATCH v5 00/12] SVE feature for arm guests
Thread-Index: AQHZbSQ8i9h7etA7H0yQyBJ8Cc6LPa8xFNYAgAAUEICAAAO7AIAAAKcA
Date: Tue, 18 Apr 2023 14:41:07 +0000
Message-ID: <36E824E5-B33C-4F98-8A29-9C642AC3F7D7@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
 <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
 <5D0FF62F-AA83-4A35-8A39-74A2F0D29603@arm.com>
In-Reply-To: <5D0FF62F-AA83-4A35-8A39-74A2F0D29603@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB7350:EE_|AM7EUR03FT048:EE_|AM9PR08MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d7a528-51ad-4b1c-b625-08db401afb83
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2oNkQBuzhWuwhvneJifpjk28kkh6m/zbwikhUPNnqHP7VVGkjU/h1dg6d29l6eWrwEyqcviBTuy6qtgV3VLJt/fRJuXmtywGb/Co2LVOgucOnsdY2OQ3R5wsVHDM3gV37QpKsKdTMRG/tYRY1r/OfBLMqYrkYZiLy88OcTjtIl6x8Pnahe5N4mw9Dsehao8ZV01oxGecYP/WF+whCvMbKifOc1Vba8uvo9E9quzUOJTWknVJyivapwh+xlFbWEGKXloeLouWJRbsiZZ+ch/jd4/H5pzW9SzVo1XYDwy4jrqLcmbNnQF3H1wRswdHVJ2IahGNREUtCB0UPkM3DiM4FBsQF2mcZ65d6dI7f7mSHZA9OEKjXlitS2KFdF5Y5y0bUJ5QgBPD4X8ijxDGa1vdCum3/HdsGqTcZ8eb/dLFwt0YKx3a2ALkEkbhYOMvVSZw8uHBTB6uAwp1cFI0gEgX95bNO1pR5SmxnH5jUdMVKG23ph3gfNWgW/oRQ9L6CgX+9VEfq6q/jNElMs/pgfa8ple3iSTCcg7Q0MdsRb345WFlrAwKPFdESCjWFoNRuxrZ1jH6beuIQzpohu/bNR+2s6uqVpN1VSqbIVK4yU3LoYHgzCmXm0C11MP8pcFa9eat8IULvsZB3dACm7lFrAVlhA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(86362001)(33656002)(36756003)(91956017)(37006003)(316002)(76116006)(66946007)(66556008)(66446008)(64756008)(8676002)(4326008)(66476007)(6636002)(54906003)(6486002)(71200400001)(41300700001)(478600001)(6862004)(5660300002)(7416002)(8936002)(2906002)(38070700005)(38100700002)(122000001)(186003)(53546011)(6512007)(6506007)(26005)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9ACA37321D0E9347A807BBC503019724@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7350
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7941076f-359f-4102-f237-08db401af1d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wr+gEXcR9YCuaM7Anbot1mABjDk4DqRAHIY3Rv+Ojs0Dv0krJczc23OtgihDINj3OhOK4qe9/s3zwd4x6Ii1u0YTlNSiPQ3jA57xP05hQBinpQdK3r/5M3D+449iPvRKQePT6MPzgjSmHWeT3amrTEaD4ITlK5rJjYWgcu2LGZa6+i4gL801Wq8xoy+sAhGmDpAzO3I29ijh3oQ7ebjOXAxa/3T3/fTIQiVLwSsmLm8ZhYu8z1q5f2O0gZ00brCXyDex2AtVudClQia44mSzOguskG32b68E+uuj0R+KsXKJAOzPUiMjkgfpn5f70GfGAKEHofW2/kGanulKMH1YRU3/Gl+tIcnmEv3dCXKawCuh3+J7VYDmQ35tTutqC78SToav/nGgEM0u3X3PhuMNv83qEIZAoNHS7oeyc13AMDJpD+x6nnyFnplsA514dAZdkg1RqNs3Gcq6rMsr5Z3p2cup7vkFPUMgOc7Psib3Gi9d/YMzPuKWf20bY2/KVe8dF+2W4i7TGJKTnNnXnd8/68iHVyMQs1W+GXvoZ2Xi12cTB8hab9n+gsKqIkw5J0e6iG/H8Ec/79l1kEFz/YMBPE8UQcZSUVF5PDbXWif0SBSaKAiqnBdFXzbvsuTTJEg//xuYicKEqyv4dpWWtG88OuV7MCt2NbMW0JyYGz6dNl6Oh+/3zZYk/lPhH0YD6H6T4LO13pm93kRzmTXhxPgTTg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(6486002)(478600001)(86362001)(36860700001)(36756003)(47076005)(2616005)(336012)(33656002)(83380400001)(40480700001)(186003)(6506007)(6512007)(26005)(53546011)(40460700003)(82740400003)(82310400005)(81166007)(356005)(316002)(4326008)(70206006)(70586007)(2906002)(8676002)(8936002)(5660300002)(6862004)(41300700001)(37006003)(54906003)(6636002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:41:23.5316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d7a528-51ad-4b1c-b625-08db401afb83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6243



> On 18 Apr 2023, at 15:38, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Julien,
>=20
>> On 18 Apr 2023, at 16:25, Julien Grall <julien@xen.org> wrote:
>>=20
>>=20
>>=20
>> On 18/04/2023 14:13, Bertrand Marquis wrote:
>>> Hi Luca,
>>=20
>> Hi,
>>=20
>>> On this serie I would like to open a discussion on how to handle the ve=
ctor size
>>> and the corresponding command line / configuration / device tree parame=
ters.
>>> In general the user must either give a vector size it wants or has a so=
lution to
>>> just request the maximum supported size.
>>> In the current implementation if a size bigger than the supported one i=
s provided:
>>> - we silently disable SVE for dom0
>>> - we silently disable SVE for dom0less
>>> - we do not create a guest when done through tools
>>> This is not completely coherent and i think we should aim for a coheren=
t behaviour
>>> unless we have arguments for this status.
>>=20
>> +1.
>>=20
>>> Is there any good reason to silently disable for Dom0 and dom0less only=
 ?
>>> I see some possible solutions here:
>>> - modify parameter behaviour to use the supported size if parameter is =
bigger than
>>> it. This would at least keep SVE enabled if a VM depends on it and coul=
d simplify
>>> some of the handling by using 2048 to use the maximum supported size.
>>=20
>> My concern with this approach and the third one is the user may take som=
e time to realize the problem in the xl.cfg. So...
>=20
> Good point
>=20
>>=20
>>> - coherently stop if the parameter value is not supported (including if=
 sve is
>>> not supported)
>>=20
>> ... this is my preferred approach because it would be clear that the val=
ue passed to Xen is bogus.
>=20
> I agree: we should not silently ignore configuration parameters or try to=
 "fix" them.

Hi Bertrand and Julien,

Ok I will update the serie to stop the domain creation if the parameter sup=
plied is wrong or SVE is not supported by the platform.

>=20
> Cheers
> Bertrand



