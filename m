Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D2667177
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 12:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476067.738047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwEo-0000HY-Pp; Thu, 12 Jan 2023 11:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476067.738047; Thu, 12 Jan 2023 11:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwEo-0000EF-MQ; Thu, 12 Jan 2023 11:59:18 +0000
Received: by outflank-mailman (input) for mailman id 476067;
 Thu, 12 Jan 2023 11:59:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+83i=5J=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pFwEn-0000E8-JV
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 11:59:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88028134-9270-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 12:59:13 +0100 (CET)
Received: from DB6PR0202CA0014.eurprd02.prod.outlook.com (2603:10a6:4:29::24)
 by VI1PR08MB5357.eurprd08.prod.outlook.com (2603:10a6:803:12e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 11:59:10 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::32) by DB6PR0202CA0014.outlook.office365.com
 (2603:10a6:4:29::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 11:59:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 12 Jan 2023 11:59:09 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Thu, 12 Jan 2023 11:59:09 +0000
Received: from 1ec22c67a624.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F09958B-D486-4548-ABFF-F62E25853036.1; 
 Thu, 12 Jan 2023 11:59:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ec22c67a624.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Jan 2023 11:59:02 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB9662.eurprd08.prod.outlook.com (2603:10a6:102:2e0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 11:58:59 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 11:58:58 +0000
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
X-Inumbo-ID: 88028134-9270-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b04EwoN0FW7LGyusLHilN8gQmZ/uqEa7Olpc5LoLThk=;
 b=xcRhboPg/QbZ/qTZiDwo3418jUvNCChBM7sUxlS3dsSxwZjm5X9uVX75cHQLEPt3nmObOfcBbQNn+2VrwSrlLxplgiLNngWMLbMspM3hqEZolZy6KUYNaWUsvcNSx56wSffTkXP2QGJwmgAvWm5YPJ8dsBbvi6qXaG5R00pFblQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 413c25dcfd4db4d7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFM3f6U2kaE7sTxEq03FHGCSeM6+aLbBQStIl6dC7jVpGkq5EWvMJ89GvHnMWnDixVb+Uqvr+a7877iY2kD2G9Xuf+viBTX7MVmGCfHsQ4ULurKh8DHxws2vOolb0fUU6QTwRsjfkPXhi63r4R/geIaXCnNkTL6dsOk4LGWhCzOI7p2oJ3wl2UWBpIbf628b240BJ/6qDF5hpJd3PYq91OPzhYw0Fy+gobDUtl9tFO+sqqojjyRII8Z6FRoGM1aOpucNG8zTKcbfQcjjmnMCET/zUVPOYcshyfGaKNLE2wiQm3RnoQw2ACVFYOUk0OqBDOuX/PQgkV6vm7u3zg2KpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b04EwoN0FW7LGyusLHilN8gQmZ/uqEa7Olpc5LoLThk=;
 b=ASCSPYcB/N2HLZD/UCfmWMZWgk+Y09BRJ7iZw0xJG18av38atFkaGXq87r0dQIVGtVBdTQ+s/cmnpvWg82Ulcx9Da7X71AWyOrsQ7NBO3LWyzZ4WQZibQESvEpZzICRm5wdS0ec6esQ9OuIFpqMWAetruuWxCa91xaJxGiAR0jsfJQPinMWgxAz3PvyyneAGhANhjc44uzKOSJPkVX+ganiALp7wUpH/wwQ4DMvCBwD/pVuN8opUy22cKxI9+5nFuEEx7Onu9521t8NnV2Yp7Mgv2rmuUO/94a18lZ57daan1xf5PyN7VVxV8lD22NZRZirN9fZTO2u1DWxLloMZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b04EwoN0FW7LGyusLHilN8gQmZ/uqEa7Olpc5LoLThk=;
 b=xcRhboPg/QbZ/qTZiDwo3418jUvNCChBM7sUxlS3dsSxwZjm5X9uVX75cHQLEPt3nmObOfcBbQNn+2VrwSrlLxplgiLNngWMLbMspM3hqEZolZy6KUYNaWUsvcNSx56wSffTkXP2QGJwmgAvWm5YPJ8dsBbvi6qXaG5R00pFblQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 0/8] SVE feature for arm guests
Thread-Topic: [RFC PATCH 0/8] SVE feature for arm guests
Thread-Index: AQHZJcp9wvywjfWnlk+ZpWy3G+b6x66ZcImAgAE+VAA=
Date: Thu, 12 Jan 2023 11:58:57 +0000
Message-ID: <EB12FEDD-F3EC-401A-9648-77D7B28F6750@arm.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <3e4ce6c0-9949-1312-f492-913b7dd2cf18@xen.org>
In-Reply-To: <3e4ce6c0-9949-1312-f492-913b7dd2cf18@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB9662:EE_|DBAEUR03FT034:EE_|VI1PR08MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 261e2b72-f7d9-420d-4aa6-08daf49469f6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hrfVuMOki6+0+okyFsiT4iWZzu+BE5c/pjKIkEeZ8A2LIZvbnbh9jQw4EEJdvv/JrXq0dEbtxnc74YrbiAOYRQeY2jMim9Gp6os6d+yeui9VpgBwc22ZbuOY0Emi2WkMwJMhcPJ9tc+gv+tK4FQ1UUg+pMNM2BSIgCQxNxjSLPqJvX/ih70ig51z2ZVDTMXvq5XBhv4FaaO5c3ernuHQxiDeIk2r63NYIXnHWxBLy/pYMPJkR+Q1BLbi6J7nGqiFYNjsHA8Z/9z27wv2jt8BwFvs+egshKkEkxlzw87IqGh8aqYtTn3P1s4XEHbkbpwiNbVoGb15Ff5n4xTTY0y2JJxbRpjVeVPOxggbRwMoHAe59ui3cAeD8pCKGxOMTpK/XkSM0wnMthKhnqWqT78xRkieXKgn1OpKgulA0peaPv5js46D4ghg71iQ/Zw5hlySlmtEObUnvB/y2TfjRiATTvl5jafdFY9Y6MqpaIsqwPjjU+yZLN6hL6v5o2YgANpC1ybBamHMlNI4sz+a7Lb0VQOqNRXiT1I8YnOtS0OVPuBDTNjg6P4fdmfwJ4Hm5mejZzupTa/9tRG5OsYFdzR8zzApKNS/NhCuE2jK6UUNKOe9xEgV4m2Sq/6K69dBAyMWxyVi8gQZFkEtTThnlkNrmAbukuCjjpVLpnPcVCur/X1wBbxa1qDoey/wvLyV4rKsWCm/Edi2uhrBqvn7fGtl0MQfhrwLg+oW9NycKIronI4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199015)(36756003)(33656002)(38070700005)(5660300002)(86362001)(54906003)(6486002)(316002)(6506007)(71200400001)(6916009)(66446008)(7416002)(2906002)(478600001)(76116006)(64756008)(91956017)(66946007)(66476007)(8676002)(41300700001)(4326008)(8936002)(66556008)(53546011)(38100700002)(122000001)(6512007)(2616005)(26005)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BEEE4A712A1EC04C9C429B54D8A457AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9662
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb99040d-916e-4f58-0ef3-08daf49462e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AePsOndc3Qcq5slBXYbvF9RAM0RktP7k0LCxG5fqKhMNhbHReC10ypZMFB070ZYIFKEAvq6gnfvTj6v98/s9nXJ7FuMjDvcd4M3EWqxYeDCKaFBuDZGi7Lg3R/E5a8pRZ5BsF66KMLO0QNgFWNSaekeGX+1xrVRB7PD9oYpQq9ajdXp9fz1V9X2GHyViy4BXEmSaEhYteS//4LtAp2GuaN9GmDaA2LyC8zF6tUhsYeVLCRuVNPc74yRXkK91JQM7mWPYOBgl5et0OwslJ3KoMEQQYfzPHttmjdwhhCJnYgNPje8sZw9/n7SWX87BES96scNNQSquk4Abl32OQoWjSgSPxqW94k8IjkVHwlQUw8vZg9vubx+CQ2vPvVl9VH4jvf1U4YZB0uIAZ6b7ofgqPkOQpOIraJpQ0Yf4Qsjf/W7TzrYOkBEMOAwZu/zETBTuP9ZYsWZpKtFt8us0mnIrgbg2vj6kpi5o9NKdTjhkSWhnssx9D0tDTEjJvyi1CBzotgwqm+UqufidpxCi+fZN9fZr0seQcXzgg+j0QLLwEAqlOY1K6E7Rd40qZ7K/YN4P0C7bSvZLqqKdlCNBpPSToybV6zhmBNJZrXh844hZXYCdnT5IYy/kEdGRH9or5hAzYVuns+fHdr2oGs/Lr8Af1FN17kG1/LbH5zt9hs5UvY0eDliDQVLoMVtMmahammcNd2bVQ/flVRCL1ONTp+T+Eg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(70586007)(70206006)(8936002)(6862004)(6506007)(4326008)(336012)(82740400003)(33656002)(40460700003)(36860700001)(47076005)(8676002)(53546011)(41300700001)(86362001)(82310400005)(478600001)(40480700001)(316002)(6512007)(6486002)(81166007)(2616005)(107886003)(2906002)(54906003)(26005)(5660300002)(36756003)(356005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 11:59:09.6432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 261e2b72-f7d9-420d-4aa6-08daf49469f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5357



> On 11 Jan 2023, at 16:59, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 11/01/2023 14:38, Luca Fancellu wrote:
>> This serie is introducing the possibility for Dom0 and DomU guests to us=
e
>> sve/sve2 instructions.
>> SVE feature introduces new instruction and registers to improve performa=
nces on
>> floating point operations.
>> The SVE feature is advertised using the ID_AA64PFR0_EL1 register, SVE fi=
eld, and
>> when available the ID_AA64ZFR0_EL1 register provides additional informat=
ion
>> about the implemented version and other SVE feature.
>> New registers added by the SVE feature are Z0-Z31, P0-P15, FFR, ZCR_ELx.
>> Z0-Z31 are scalable vector register whose size is implementation defined=
 and
>> goes from 128 bits to maximum 2048, the term vector length will be used =
to refer
>> to this quantity.
>> P0-P15 are predicate registers and the size is the vector length divided=
 by 8,
>> same size is the FFR (First Fault Register).
>> ZCR_ELx is a register that can control and restrict the maximum vector l=
ength
>> used by the <x> exception level and all the lower exception levels, so f=
or
>> example EL3 can restrict the vector length usable by EL3,2,1,0.
>> The platform has a maximum implemented vector length, so for every value
>> written in ZCR register, if this value is above the implemented length, =
then the
>> lower value will be used. The RDVL instruction can be used to check what=
 vector
>> length is the HW using after setting ZCR.
>> For an SVE guest, the V0-V31 registers are part of the Z0-Z31, so there =
is no
>> need to save them separately, saving Z0-Z31 will save implicitly also V0=
-V31.
>> SVE usage can be trapped using a flag in CPTR_EL2, hence in this serie t=
he
>> register is added to the domain state, to be able to trap only the guest=
s that
>> are not allowed to use SVE.
>> This serie is introducing a command line parameter to enable Dom0 to use=
 SVE and
>> to set its maximum vector length that by default is 0 which means the gu=
est is
>> not allowed to use SVE. Values from 128 to 2048 mean the guest can use S=
VE with
>> the selected value used as maximum allowed vector length (which could be=
 lower
>> if the implemented one is lower).
>> For DomUs, an XL parameter with the same way of use is introduced and a =
dom0less
>> DTB binding is created.
>> The context switch is the most critical part because there can be big re=
gisters
>> to be saved, in this serie an easy approach is used and the context is
>> saved/restored every time for the guests that are allowed to use SVE.
>=20
> This would be OK for an initial approach. But I would be worry to officia=
lly support SVE because of the potential large impact on other users.
>=20
> What's the long term plan?

Hi Julien,

For the future we can plan some work and decide together how to handle the =
context switch,
we might need some suggestions from you (arm maintainers) to design that pa=
rt in the best
way for functional and security perspective.

For now we might flag the feature as unsupported, explaining in the Kconfig=
 help that switching
between SVE and non-SVE guests, or between SVE guests, might add latency co=
mpared to
switching between non-SVE guests.

What do you think?

Cheers,
Luca

>=20
> Cheers,
>=20
> --=20
> Julien Grall



