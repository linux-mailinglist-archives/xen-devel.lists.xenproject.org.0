Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3741C6E67B3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 17:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522961.812646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pompW-0001eH-M4; Tue, 18 Apr 2023 15:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522961.812646; Tue, 18 Apr 2023 15:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pompW-0001c3-Iz; Tue, 18 Apr 2023 15:01:14 +0000
Received: by outflank-mailman (input) for mailman id 522961;
 Tue, 18 Apr 2023 15:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pompV-0001bx-2e
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 15:01:13 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da690723-ddf9-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 17:01:10 +0200 (CEST)
Received: from AM6PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:20b:f0::45)
 by GV2PR08MB8099.eurprd08.prod.outlook.com (2603:10a6:150:7d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 15:00:54 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::ab) by AM6PR04CA0068.outlook.office365.com
 (2603:10a6:20b:f0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 15:00:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.21 via Frontend Transport; Tue, 18 Apr 2023 15:00:54 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Tue, 18 Apr 2023 15:00:53 +0000
Received: from abf34ce5f805.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 03CED438-CB51-4EB6-B678-B52E6562299E.1; 
 Tue, 18 Apr 2023 15:00:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abf34ce5f805.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 15:00:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB7987.eurprd08.prod.outlook.com (2603:10a6:150:9d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 15:00:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 15:00:28 +0000
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
X-Inumbo-ID: da690723-ddf9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4sNW1PuzWecqMdLwH/QY3oViqeHefFf+DMTDFaJ+Z0=;
 b=fQ3wt3IXIdouOfGyphXcvqmbxCEQmAuCxpQUAl/lwiDVjA9H05yY4tzN6x+ziXRQ/7ntzJLzHJR3OdmYo+E4rKdGJ2q7kWD+bOgjKxi1Bn6X71H6s1sANz3gX3bibsune3HYxqVhaoLRCHuHIDjKdqjpdnVM5cYz91iepwKzUQc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9c74e18fbebfa02
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ma5y3N//Ruk0h4bk85FH3EBoDj9uxbu768xMtz2yET1z59MLn9Cf0HFMxwHRXxF2n1OXaTSoDWWouC/JreG4SzjwVA+t02yyNlH/fnakzlkiSB2kJLdL3MCN9NTpjRMeO6Zw+StqWDUKXeaWeQcvGa7m1lyV1fVhhdxetqhARhVgg6FrkS9yZ3e37cgLhydVxGjK0gbwzpvO3ROJyFVERB5nmdH/FCrhX2939rnRU4lE7m/aD4sPYI3BoJ3/C/p4ZH5icnDU3i8YGKA/2CLs+24M0MQyjddlmes7skbotGtZF1r9ZGaS6LFCD7M6y29i6VdGlZX1SwXbNrUERHAw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4sNW1PuzWecqMdLwH/QY3oViqeHefFf+DMTDFaJ+Z0=;
 b=WiW4lGkxvFk2pMLEyYR+syiW6Ws1Fh7XbVMG2vecmKZ6u7RO5SnA+Pk5FLtWXuWsa9nvKgenXE/+Ek86Lm3aXRVhlG8A08n26D2m8mUYZGx6XGvR1q2RfjZuO1lUER4hkXaiZDWkd4NoT2I3RW4UvHTcjeBGHG0eaAG/xWPScQ7eTEfamII5Bx+C/TkZIzSywXtNuXa6J0B3HW7ojPg++gG8fnuj3FHb7JfGmPRBcQFqlDitrtbACR2K7oZEhwuzDdUufhbrGZweA96VogSwUHPCRsQvqNnSxGHEBa5YZevpo2M4P+D7jpnEXEPuDaw5Q/x1yL1o2Z7/B5f0Oa4GPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4sNW1PuzWecqMdLwH/QY3oViqeHefFf+DMTDFaJ+Z0=;
 b=fQ3wt3IXIdouOfGyphXcvqmbxCEQmAuCxpQUAl/lwiDVjA9H05yY4tzN6x+ziXRQ/7ntzJLzHJR3OdmYo+E4rKdGJ2q7kWD+bOgjKxi1Bn6X71H6s1sANz3gX3bibsune3HYxqVhaoLRCHuHIDjKdqjpdnVM5cYz91iepwKzUQc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
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
Thread-Index: AQHZbSQqKlfgrZX3xkqta7+H+1gq3K8xFMoAgAAUHYCAAAOtgIAAAMGAgAAFWgA=
Date: Tue, 18 Apr 2023 15:00:28 +0000
Message-ID: <59A4EC98-2087-479F-B585-BDA1FF9B6B08@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
 <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
 <5D0FF62F-AA83-4A35-8A39-74A2F0D29603@arm.com>
 <36E824E5-B33C-4F98-8A29-9C642AC3F7D7@arm.com>
In-Reply-To: <36E824E5-B33C-4F98-8A29-9C642AC3F7D7@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB7987:EE_|AM7EUR03FT003:EE_|GV2PR08MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: 623834ee-6753-4bcb-b9f3-08db401db526
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sFx4q12vuqILI55H/8gobAk6UKuhS+gX3+68BCfRXPNAW+aHDXhW0mzB0W9x8CcQQlJkPqEBY/4eB/f3A+Z6506DRyxrViqO0eyTCPGnya4nvY3Z4rxf5+Rl0Bjttha4x0ItwZ0q0oaqENl2F58i+LE9aMHVFpwMD4f+UTLkQAYonu+sW+S+jb9t8An7MIz+JNBvlvwSZckE+80LJdaUjs67562XVhzIYX9Tnlwcb+NZjGj/47Lv4ntMRJsS41D1pdZqmBDKi/tQOE02+bHUOrqnHBkjWxQm4NVfC7MdjNPgwV49ePx3mSgw/dp83nTnjAfHAqABybGlFm/5QEVJJnxO6p0S19AdaZNLEHdtXw/mDmDFvhJ4xoFBvEUmFxwgIl8e2wr3i3ZS4ba4NYGb6knvnHZZ6n1wBEIwPZO2GsC52KlpX+8olEiQXBOgTqPq0NajS6JMOnW7hIHJX5LfHTy7oMdFgZDy3wjPgVbGQqiJlJqnSIIuoXZ1mxLBnvZ+iMKv0K97+7boWRqPv9hN0yOaeZZ7yDQOEcWzVvfeaua840YFlaE3OVQKvXYsH28dU7+barFJOWDDmZYfEGSN1lZQ6ZPdSUEeSvm8Nm8JPICmdYUkROPXlFkgjhaDmn/Fa9rYmlh8IoQ5YfNGdoPo2g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(5660300002)(37006003)(71200400001)(6486002)(76116006)(66556008)(66476007)(2906002)(66946007)(64756008)(66446008)(4326008)(36756003)(91956017)(7416002)(33656002)(86362001)(8936002)(38070700005)(122000001)(41300700001)(6862004)(38100700002)(478600001)(316002)(8676002)(54906003)(6636002)(6512007)(6506007)(53546011)(2616005)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <34C76A398557C8438D2BAA9CD332CFE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7987
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b14baaad-91fe-43f2-f48c-08db401da5f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aS8H6Rdgdf8DaifL3WpJxzv3cQKiLA1Jbm0woe01OJClO69VOs88Pwhrj8c8G+ltUhZKHfjDh8NgdUmm5G4fo5ohBbEpHCBoVJAyOcSIWQchAj1mvRNTKtspS4zeV5IlltsYyXTTjL8mTNJneAA6oq3/o0qV6aORXMgKSVRI2kyuPCx79VMu4zmTnPUNjMSVJlPg+uP25Uhdb8/oaDvZQKHKO5teBGSJA6WA0M9vWpUw9JsqWGkq6D0CuWPP4+NSqztp4AoymheM/C9WxqPFQFT6v5tyspow+kLiqz85YtZrIvIZQbHMQWxsghzyfd2fPzrIw5KKZuuQDW1d/RChsTFL+qPmky+qikbfv8ajwSsN2smTIOfbpymjxMGCQ/HjrbnV1kC0rk6OO0ZxFUhNBabWCqVDEg+HykSr/3ORPBFbkfgTAjPkY4oh4fxY3yr8hqVf6elIUzHzP+00wuIktpmcLhVOtHOWQ+oSyVGqFHqRSNpEaDAbQ7nJaPacBOL5Ma8xGOOWvtWyP4LCNOuMFHK+AwwBlvNFGhsJTTIASQf/RsBMG+Fejt/geB0v9T3mJqdu8hxkQWwVh8wblbOEC71m8HgSGjlRcVgpxwbkJmhWHA6Zd/ii6fFz68a41AjEt6eHj8O2L8gbMYzU9AeoSVKlCiYWdghlIRqanTN1nDP0jCxKgGt89Y5LcaypG1X4hixs7yIErZOrpEESuU2UHw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(36756003)(33656002)(6636002)(4326008)(37006003)(54906003)(316002)(70586007)(70206006)(478600001)(41300700001)(5660300002)(6486002)(6862004)(82310400005)(8676002)(8936002)(40480700001)(2906002)(82740400003)(86362001)(81166007)(356005)(2616005)(336012)(6506007)(40460700003)(26005)(186003)(53546011)(6512007)(36860700001)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 15:00:54.0031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 623834ee-6753-4bcb-b9f3-08db401db526
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8099

Hi Luca,

> On 18 Apr 2023, at 16:41, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
>=20
>=20
>> On 18 Apr 2023, at 15:38, Bertrand Marquis <Bertrand.Marquis@arm.com> wr=
ote:
>>=20
>> Hi Julien,
>>=20
>>> On 18 Apr 2023, at 16:25, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 18/04/2023 14:13, Bertrand Marquis wrote:
>>>> Hi Luca,
>>>=20
>>> Hi,
>>>=20
>>>> On this serie I would like to open a discussion on how to handle the v=
ector size
>>>> and the corresponding command line / configuration / device tree param=
eters.
>>>> In general the user must either give a vector size it wants or has a s=
olution to
>>>> just request the maximum supported size.
>>>> In the current implementation if a size bigger than the supported one =
is provided:
>>>> - we silently disable SVE for dom0
>>>> - we silently disable SVE for dom0less
>>>> - we do not create a guest when done through tools
>>>> This is not completely coherent and i think we should aim for a cohere=
nt behaviour
>>>> unless we have arguments for this status.
>>>=20
>>> +1.
>>>=20
>>>> Is there any good reason to silently disable for Dom0 and dom0less onl=
y ?
>>>> I see some possible solutions here:
>>>> - modify parameter behaviour to use the supported size if parameter is=
 bigger than
>>>> it. This would at least keep SVE enabled if a VM depends on it and cou=
ld simplify
>>>> some of the handling by using 2048 to use the maximum supported size.
>>>=20
>>> My concern with this approach and the third one is the user may take so=
me time to realize the problem in the xl.cfg. So...
>>=20
>> Good point
>>=20
>>>=20
>>>> - coherently stop if the parameter value is not supported (including i=
f sve is
>>>> not supported)
>>>=20
>>> ... this is my preferred approach because it would be clear that the va=
lue passed to Xen is bogus.
>>=20
>> I agree: we should not silently ignore configuration parameters or try t=
o "fix" them.
>=20
> Hi Bertrand and Julien,
>=20
> Ok I will update the serie to stop the domain creation if the parameter s=
upplied is wrong or SVE is not supported by the platform.

Thanks

Bertrand

>=20
>>=20
>> Cheers
>> Bertrand



