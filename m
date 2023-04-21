Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F216EAA09
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 14:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524562.815590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pppas-0002t3-T9; Fri, 21 Apr 2023 12:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524562.815590; Fri, 21 Apr 2023 12:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pppas-0002r0-Pv; Fri, 21 Apr 2023 12:10:26 +0000
Received: by outflank-mailman (input) for mailman id 524562;
 Fri, 21 Apr 2023 12:10:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slXh=AM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pppar-0002qr-RL
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 12:10:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e2f6de4-e03d-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 14:10:23 +0200 (CEST)
Received: from DB6PR0301CA0003.eurprd03.prod.outlook.com (2603:10a6:4:3e::13)
 by PAVPR08MB8941.eurprd08.prod.outlook.com (2603:10a6:102:328::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 12:09:52 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::ac) by DB6PR0301CA0003.outlook.office365.com
 (2603:10a6:4:3e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.50 via Frontend
 Transport; Fri, 21 Apr 2023 12:09:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.25 via Frontend Transport; Fri, 21 Apr 2023 12:09:52 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Fri, 21 Apr 2023 12:09:52 +0000
Received: from 0df0928c19f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5ECF5D2-554D-483E-BAB6-D7D14D75FF66.1; 
 Fri, 21 Apr 2023 12:09:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0df0928c19f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Apr 2023 12:09:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8253.eurprd08.prod.outlook.com (2603:10a6:10:413::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 12:09:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 12:09:34 +0000
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
X-Inumbo-ID: 7e2f6de4-e03d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5bCnPNWe3lt9sU/fYTluRNEZvBLnz3+AKGxarQoOI0=;
 b=n3phtROk1HDi8gosupPeF8zLPrcogXXvDGdsQtg0qcZWz7g6zt0dRIT7fX8YneTmAijOQh3pcCNIOjMRDeF2Hq3vCkLPKLSv3Ce+eTstvSqvn4lgEH9Xq61ERZ/Eu6xxXaPbLI8982QSqKXgzSfDAM3EEa9Xqt3V1975so0hH9s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4ddd18dab9402fce
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaKGzQsupkv/78zUwuYQgkti7brv8559KBtXEmOSn/xX+VxwPA3OyXebYfW8PXeYE1dbi2Qax+Po9nXNbXgPUGpereptA/Scr6aWue/F8zsgw10fVFIdDNB0Y6yVpWIhvSPVvHOhSipKaw1N6/DzW5HnLXIiPWxb25zFpf6Udli59G/31rI09IAwbTayIO15pNxjwiAI3DFsjPtYeFC+0czukYl5JJzfdac8UQheduVedFFGEMElFiznOFPswj6viwrCQ3sdJA8jqmm7oedmdVj3p2d2nrlozX6fmPJr1jJX7yebPhby8RF9z+9xa4XMES4wHwqAV45tTDAgSKpkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5bCnPNWe3lt9sU/fYTluRNEZvBLnz3+AKGxarQoOI0=;
 b=UAT34el/0T4jg6MxgvYJCc4RaUSni3A72RRkfXrHLeWnqamYH286D6uKZs0NI2MNQipHN3cqX94Bd3lZju2HLgRa2x6QV0NZw012rJffNniXk26p0WdWmklhYm4hepP/CrLyW0Jz01/Kog7vLK9os72g5mFBhJ4LU+IYP1kxg322ZIMrxpx+s+DObj5t8wERM1C/rQh4FnRZBCTTO5EqdqmtCXqgZIbagw/X7B3aQ27R78bpH5e1ZW/oXOVDYEKOm0AcEwzPdVozxuZ8r99WUNd8XbXMBA0xp2ykC6KGItpdJ9i5to2ZxCEq130FL27fMjWYSxuohOshgF6URir+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5bCnPNWe3lt9sU/fYTluRNEZvBLnz3+AKGxarQoOI0=;
 b=n3phtROk1HDi8gosupPeF8zLPrcogXXvDGdsQtg0qcZWz7g6zt0dRIT7fX8YneTmAijOQh3pcCNIOjMRDeF2Hq3vCkLPKLSv3Ce+eTstvSqvn4lgEH9Xq61ERZ/Eu6xxXaPbLI8982QSqKXgzSfDAM3EEa9Xqt3V1975so0hH9s=
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
Thread-Index: AQHZdACYcHm0T1gRME+oVIqMr2d2RK81SjQAgAABA4CAAAMiAIAAXd4A
Date: Fri, 21 Apr 2023 12:09:34 +0000
Message-ID: <8E2CF14D-9675-439B-A157-AA18EE4CBD04@arm.com>
References:
 <AS8PR08MB7991424A3167C70A9B29530C92929@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB7991EAA2EF0E381FAFB4C1FD92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <26AF44F7-A028-4737-9BF9-266CBAA83A18@arm.com>
 <AS8PR08MB79918CB17D6E1C987B5F048992609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8253:EE_|DBAEUR03FT020:EE_|PAVPR08MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 40311f96-e6a1-4229-53d3-08db42615008
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CUVSon8G0U6IfX5eKJMRXvTeLfUBzkQ4Z5ol3gIUCq1V/D03ps7O88AJ1yVVgCzeOYAuXP8qAlI2XAC1y0h6hoNdRa8ItnjCcheneLRfhb5vxYx6yzb2B1jwpwkL7ZRVjGi4PfPRhRoUm6TTxuutPoHqKnGp+VXGVn/nGKRKbePftl1j0yxKVoIMbD7zxQ+NWqqHr/I7XGUIOw/iZnTUg9f9FfQlaNbXGmsZN2cSreXq2Wx6A+ady44eMtT+UGhg451l64OrTuhb5L83VVMRnSdv7Ql0ylAe4c3XrAr9usBKW7AW83F8vmWA1IJKNPri3UcqpqqDOPGfX7nR6fvM0ZJP0r9iSpiX9VWmP+C/atic3FfKk1OJchgPTmsGVaaLNWmZ7MUpdAJXXJEqV5Uu2T//6TUnQgQlATAa0kcKG/5UtvnEQtX0QGcYUVcowp4o7K95l5wHvg7Wl5LfUgjxDkXmTFL6hcWWNoU+7TydTdk/htTB3Wy/91wJWYESMYZ9/sDoodY2u9FFCatSwbVhCTLGuIYTefcAUQr2u61CBFfSgaNCsc2gAC1Tx7bpNgWCEi7gt2yQed4AhlvnX8iIbAuKgCPvSbCRk6Nf09LIcxKTaSovYYZV+FwepZec1MG8iEXHgB+WRur3dRcwGkKvVA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199021)(2616005)(76116006)(316002)(66946007)(37006003)(64756008)(4326008)(83380400001)(6636002)(66556008)(71200400001)(6486002)(478600001)(54906003)(6862004)(41300700001)(8936002)(8676002)(122000001)(38100700002)(91956017)(66446008)(66476007)(2906002)(15650500001)(38070700005)(5660300002)(7416002)(53546011)(6506007)(6512007)(186003)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9BFE98376EB8D14D8B39B1E343D360EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8253
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf6a4db4-00ab-41df-1d3e-08db42614554
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NWCj762zwxs+wUiDVQX+68mNr9+oF4U5QFavyE5JDBCKoMA1rtVqM022YWLowKX0PPQQfUDnI5rzuOBMtrmPs8AvKD/+2dtZjX2Mx3yVdFGaDpP1zwbQI1GYsiVbCfdb+ovtctMq8ZCHq4JhE4x4aO5HzLAeVmPmhQhgv2Tl/yJlzRqVuuHramJDsamqhzkONF6GgGbMA5kPXY7ZbNsK5LEVSPiQpmohWlt72tz3mfrWHIFoOfHP7DSBVQUljRnOVb5bshdgosCqgbjVm4j6SDlrH9BAGVLRdYXO9Zvi2zFrGUM6eXRLE9r58FjbdDc8HyIZAh7KNdOE0j4sWYKC4ORdxgQabSfD+7a2AqzbWUuptncddBhCiOQZXelYWD0EdnYaQLy299l7HF9jkWYpQpFqQrhVOyFjkkLJOJHQOaRdpZSi723d5mKxndBzgwpu7wHT3DdiRGaDOElsxLdHehBr7ZJfAaMWxhbr1ls/kDvdZ9o9sU84SlGdD3OAm40nftkBY4nXt0Y8UUU9/cHtHseXeBrTo+2s/+bOMg6scCOBFCJS5c2qjBmrRHrVtnrRQeDffd4ayDV9cHWyIoWGhoz/Vq/Fyfw6uHc7XGTbxQd/qWjpjQ6+ksWEfo2bSjm+2cg6tns5pCMM1Lz8oXMdP+V+z+zQfWkihuVsy1Bo1OWZP00sFpd3hcyVWcBJZqNWqq25Ol6klTNDLEmNALJ1nA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(6862004)(8676002)(8936002)(316002)(81166007)(356005)(41300700001)(4326008)(82740400003)(86362001)(40480700001)(40460700003)(15650500001)(6512007)(2906002)(6506007)(53546011)(33656002)(26005)(82310400005)(6486002)(36860700001)(2616005)(83380400001)(47076005)(336012)(186003)(36756003)(70586007)(70206006)(37006003)(54906003)(6636002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 12:09:52.4728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40311f96-e6a1-4229-53d3-08db42615008
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8941

Hi Henry,

> On 21 Apr 2023, at 08:33, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi,
>=20
>> -----Original Message-----
>> Subject: RE: Xen 4.18 release schedule update and poll (was: RE: Xen 4.1=
8
>> release: Proposed release schedule)
>>=20
>> Hi Bertrand,
>>=20
>>> -----Original Message-----
>>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>> Subject: Re: Xen 4.18 release schedule update and poll (was: RE: Xen 4.=
18
>>> release: Proposed release schedule)
>>>=20
>>> Hi,
>>>=20
>>>> On 21 Apr 2023, at 05:22, Henry Wang <Henry.Wang@arm.com> wrote:
>>>>=20
>>>> Hi all,
>>>>=20
>>>> Following the discussion in April community call, here comes the two
>>>> updated possible release schedule options that I came up with.
>>>>=20
>>>> Both of these two options will satisfy the requirements/concerns that
>>>> I've received so far. But I personally would prefer the option 2 as we
>>>> shouldn't expect there will be much progress happen in August due to
>>>> the EU holiday season. I wonder if anyone has any objections or altern=
ate
>>>> suggestions.
>>>=20
>>> Even if the release date is in september, all major deadlines will happ=
en in
>>> August.
>>>=20
>>> So how about introducing an end of october possibility ?
>>=20
>> Thanks for raising this. I am personally good with this plan. If nobody =
objects
>> this proposal then yes why not :-)
>=20
> And here comes the option 3:
>=20
> ** Proposed option 3: Wed Oct 25, 2023 **
> (+10 months from Xen 4.17 release)
>=20
> - Last posting date          Fri Aug 11, 2023
>=20
> Patches adding new features are expected to be posted to the mailing
> list by this date, although perhaps not in their final version.
>=20
> - Feature freeze             Fri Sep 1, 2023 (+3 weeks from Last posting =
date)
>=20
> Patches adding new features should be committed by this date.
> Straightforward bugfixes may continue to be accepted by maintainers.
>=20
> - Code freeze                Fri Sep 15, 2023 (+2 weeks from Feature free=
ze)
>=20
> Bugfixes only.
>=20
> - Hard code freeze           Fri Oct 6, 2023 (+3 weeks from Code freeze)
>=20
> Bugfixes for serious bugs (including regressions), and low-risk fixes onl=
y.
>=20
> - Final commits              Fri Oct 20, 2023 (+2 weeks from Hard code fr=
eeze)
>=20
> Branch off staging-4.18.
>=20
> - Release                    Wed Oct 25, 2023

I will vote for 3 :-)

Cheers
Bertrand

>=20
> Kind regards,
> Henry
>=20
>>>=20
>>> Cheers
>>> Bertrand
>>>=20
>>>>=20
>>>> Please don't hesitate to raise your concerns and opinions. I would
>>>> encourage that the feedback collection is cut off by the middle of May
>>>> (say May 19). If nobody will have anything better, then let's go optio=
n 2
>>>> by "lazy consensus". Thanks.
>>>>=20
>>>> ** Proposed option 1: Wed Aug 30, 2023 **
>>>> (+8 months from Xen 4.17 release)
>>>>=20
>>>> - Last posting date          Fri Jun 16, 2023
>>>>=20
>>>> Patches adding new features are expected to be posted to the mailing
>>>> list by this date, although perhaps not in their final version.
>>>>=20
>>>> (Note that Xen Summit is Jun 24 - 26, 2023)
>>>>=20
>>>> - Feature freeze             Fri Jul 7, 2023 (+3 weeks from Last posti=
ng date)
>>>>=20
>>>> Patches adding new features should be committed by this date.
>>>> Straightforward bugfixes may continue to be accepted by maintainers.
>>>>=20
>>>> - Code freeze                Fri Jul 21, 2023 (+2 weeks from Feature f=
reeze)
>>>>=20
>>>> Bugfixes only.
>>>>=20
>>>> - Hard code freeze           Fri Aug 11, 2023 (+3 weeks from Code free=
ze)
>>>>=20
>>>> Bugfixes for serious bugs (including regressions), and low-risk fixes =
only.
>>>>=20
>>>> - Final commits              Fri Aug 25, 2023 (+2 weeks from Hard code=
 freeze)
>>>>=20
>>>> Branch off staging-4.18.
>>>>=20
>>>> - Release                    Wed Aug 30, 2023
>>>>=20
>>>>=20
>>>> ** Proposed option 2: Wed Sep 27, 2023 (or the first week of Oct)**
>>>> (+9 months from Xen 4.17 release)
>>>>=20
>>>> - Last posting date          Fri Jul 14, 2023
>>>>=20
>>>> Patches adding new features are expected to be posted to the mailing
>>>> list by this date, although perhaps not in their final version.
>>>>=20
>>>> - Feature freeze             Fri Aug 4, 2023 (+3 weeks from Last posti=
ng date)
>>>>=20
>>>> Patches adding new features should be committed by this date.
>>>> Straightforward bugfixes may continue to be accepted by maintainers.
>>>>=20
>>>> - Code freeze                Fri Aug 18, 2023 (+2 weeks from Feature f=
reeze)
>>>>=20
>>>> Bugfixes only.
>>>>=20
>>>> - Hard code freeze           Fri Sep 8, 2023 (+3 weeks from Code freez=
e)
>>>>=20
>>>> Bugfixes for serious bugs (including regressions), and low-risk fixes =
only.
>>>>=20
>>>> - Final commits              Fri Sep 22, 2023 (+2 weeks from Hard code=
 freeze)
>>>>=20
>>>> Branch off staging-4.18.
>>>>=20
>>>> - Release                    Wed Sep 27, 2023
>>>>=20
>>>> Kind regards,
>>>> Henry



