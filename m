Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5060F7916F7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 14:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595125.928630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8W8-0007e4-DI; Mon, 04 Sep 2023 12:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595125.928630; Mon, 04 Sep 2023 12:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8W8-0007bO-9l; Mon, 04 Sep 2023 12:17:20 +0000
Received: by outflank-mailman (input) for mailman id 595125;
 Mon, 04 Sep 2023 12:17:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5g5r=EU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qd8W7-0007aj-8I
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 12:17:19 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd2ef1f1-4b1c-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 14:17:17 +0200 (CEST)
Received: from DB7PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:10:52::19)
 by DU0PR08MB7567.eurprd08.prod.outlook.com (2603:10a6:10:317::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 12:17:14 +0000
Received: from DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::8f) by DB7PR02CA0006.outlook.office365.com
 (2603:10a6:10:52::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30 via Frontend
 Transport; Mon, 4 Sep 2023 12:17:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT044.mail.protection.outlook.com (100.127.142.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 12:17:14 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 04 Sep 2023 12:17:14 +0000
Received: from 57a1ed950554.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C0B97AE-30A5-448F-881E-12324E97D118.1; 
 Mon, 04 Sep 2023 12:14:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57a1ed950554.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 12:14:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB8PR08MB5482.eurprd08.prod.outlook.com (2603:10a6:10:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 12:14:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 12:14:22 +0000
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
X-Inumbo-ID: fd2ef1f1-4b1c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RnS05jI6H3JpjPV5IefLl8NNzXrmBZZ1KhpgGvGT2k=;
 b=nOXEhcvS5JTmv1KVidUxjn1vIQ9X9pFTR3UMZ17qONiie/UwCjzMR9SklRYkAeOgb2Hhlrfw5ddR0XQLdF/CwmNGDYLf2Zq7yR9o6OYG9pHZUmvL6GP1+Rzl1n//maIdvU6QJhInVLFSZiDRMyAeUrU9AgWPNG6v3TzJlo1FVC4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15bd7a501e6755d6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+4mrTqPSJg9Xc2ykNqsSOaupkTEDbZlKP8xnNfN8y+cSo9Lv1m1zZZzCtw+Gxl0gKycv9EGPZnyaoJsOPoAZwKSq2jS7nHRkQpEa7G6z0fJNGqj4WOzR0fLhg1qHUgXHPt6dn6p4iWfN9PmYSScBNG8DaC4+4c6ZXRn4HnfdAu8SutRGZr3aPOIzLdk0vZY0+B77pSIxsa/sEy92NTS3sFMwO7AHEcW+J1WPMW4gAab0RPXBqy+eDUtGAU5k/cuRgBxrZn+z2Hzdiq/Wk6DJaV2GR+t7w0axvJ5lqkxMuHV5DpY8FdB2nvtwYnrCIRU+dL47GXP8CD8GFEWLLBHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RnS05jI6H3JpjPV5IefLl8NNzXrmBZZ1KhpgGvGT2k=;
 b=PoD2u3IwgGivQdRW0/keBBqmQ6UQ2VCaDMscHMFrC8uKeMcxWZHRzP1FqHxzr27DBMxR/sEmZXebjxSDIzhxcrfuSFAz2kO3qBVH8fnVAhdsxs1tehZyEPv2dOC7Me/Yi/JcgHFbSQhgn9qzJIy8wGdZJrhxFzTBcguCIqUmXKoD9BHBR2GMh7ciex3muiVpDnLC3YWRPHxxtD+6ny5oKvCkg300vJURv4/CikV9cb8DIDur0qXDDy8SKpfmjm1HehwrBpqcla8svBGnwhMnuIksLxUDeJsJ/NcQux79JydCfkC29dxrJDItq0nrbgpAHMvj0O0kl+TC95cRmamFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RnS05jI6H3JpjPV5IefLl8NNzXrmBZZ1KhpgGvGT2k=;
 b=nOXEhcvS5JTmv1KVidUxjn1vIQ9X9pFTR3UMZ17qONiie/UwCjzMR9SklRYkAeOgb2Hhlrfw5ddR0XQLdF/CwmNGDYLf2Zq7yR9o6OYG9pHZUmvL6GP1+Rzl1n//maIdvU6QJhInVLFSZiDRMyAeUrU9AgWPNG6v3TzJlo1FVC4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Michal Orzel <michal.orzel@amd.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: xen-analysis ECLAIR support
Thread-Topic: xen-analysis ECLAIR support
Thread-Index: AQHZ1tnZvpm8hZMDREGKKcjBarux3K/6q84AgAACt4CAD/ZmgA==
Date: Mon, 4 Sep 2023 12:14:22 +0000
Message-ID: <A4B0B048-9CBB-4F02-96F1-18D27AAD6EDA@arm.com>
References:
 <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop>
 <aec70a33-b5b7-0bcb-52db-15162407c8bb@amd.com>
 <906c34d2-4e62-7819-2ce3-e88caf7152b4@suse.com>
In-Reply-To: <906c34d2-4e62-7819-2ce3-e88caf7152b4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB8PR08MB5482:EE_|DBAEUR03FT044:EE_|DU0PR08MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 5830c507-a84e-40b9-a5ba-08dbad40dfb9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UoXrV5600Ji/gj8qt0XX+EOm8LJo6FXmT192XXe6YNti8n4gxdPv7R6nswqOp+thl+3sti0X1zn8SR/jUpEwzPOksafp9OWjMfprLLzlTwpXfFbfxbhuLeYGDXhcIg9dhwv17Wz8jRKsCK6p0tBbgQ/+Nr5WB5OftkXvaeDfX0v0925pD+bCYxll8g+8lwFxQtXZoV/dnOtECGFEWhvU2QcEwuXP3LlBhmDdR/a73ORXh7Wf6apwIHS0eyBF+74nT8EjN38T/urjBEBleG+WMIrAgL1aUiBo1HSiwte+Q3U+HvE0vOiPzpKrFEYFMJicT/l+iNLpu6rhPA8DkWs4eHcBZoYEDGYfiwv5FyYindJf/q7a4pLR6ZgDrSrgd1Fgca2aPHy0KoxFhDFbvLPyIAPJ/nZ0LWJkiv65bNj8ILQPXUWzziMLVt7uEKQL1sRwbf8ziu52etNdr+zEb4TPrdUn5Ks249Cc5vPdMfIEJtGeeLaYqfZHCkQbDr2VaN2d4ZpZbMpzAWHeiIbzzqx9PrdaVlw0mCXGHv0scI3sseV8ck6nb7No0lyWx8OvNhe01OTvWncBCK7s/DmSTYkfq4hl4t31nlV3EV4vxmwvCG/bIn1JoyPZy+Tuu2j6IP50q+0DQuBW8ld/bjV8skTP7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(3480700007)(38100700002)(122000001)(38070700005)(33656002)(41300700001)(5660300002)(36756003)(86362001)(66556008)(66476007)(66946007)(66446008)(76116006)(26005)(64756008)(478600001)(2616005)(91956017)(71200400001)(8936002)(8676002)(4326008)(316002)(53546011)(6512007)(6486002)(54906003)(2906002)(6506007)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DBF6E21305FBC64C99791A9C49D183EE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5482
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54962d13-74bb-464b-7df5-08dbad4078f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	innQl8N/hABoNIiVDvDZudqrA2zOnGLsiJ9y/yNZIFnFURa+rfq+MTVuzwpE1YS09SvtDll+EpbWQTmb1bl2Uqts2IN145F4KriugREvOJydMQqLftBOwf3KUClUPCkVSnKaNb/57dXoZyZIhkEoEyNe49U+eeXoOy3rNuxOmCTx1QqIZH/P56VBYdsnn0pJMv2//Xw9ehDa500XbpwkaU0S5RHZEVsQI5C2KrkgujE10GBPyeDZYX6AIV/REB7epKaMEKITV/UYC31bCf6Yq402afsenmn4ekSpyyYQmvfs6jOKxUksnuh7PZIorguWrPo7tJ2Bww9xjYgLq3UJVacb9PbmD6uLmTrv69ey8ih5cr4M2IA7y8vKTSFYvhZhxyGs+Y9ftp80h4IFMn75PACqewz36acO9OS5DYGsyZxHH2oECrgvY+u3SMSVaRozvbIFbg579x/dj8Zx3MxbGBBE+oklG+Lt1qXZQmO7JSBbH4rxrTvSqE+qi3ocJLjZTsZSOqLsgIgn2Vy2cfkXKjUcTQJfoeDLeEx2f37zpLZ2XEhGCBqsyXrmm9lUmM5kMKPYGBu8psfyyaZVNgtFQptAwc8WcyP1bSCGQPPdLrptB64Of1uHy0qqTz0F+rGFc/fZdvvkiYylMgkshr46M+BD/O1kCK6gCkTGuFo2xJuEmwKDu1hdPugNhAMbokiLEh0FgykLf4OhqEfVdaiLUGHA4zCWsPzUP7kW1X0R96d4N7p3/Dv4sA0P0Z2hocwc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199024)(186009)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(2906002)(36756003)(54906003)(86362001)(316002)(70206006)(70586007)(33656002)(40480700001)(5660300002)(4326008)(8936002)(8676002)(6862004)(41300700001)(40460700003)(107886003)(6512007)(3480700007)(47076005)(2616005)(336012)(26005)(36860700001)(478600001)(81166007)(356005)(82740400003)(6506007)(6486002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 12:17:14.5898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5830c507-a84e-40b9-a5ba-08dbad40dfb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7567



> On 25 Aug 2023, at 09:28, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.08.2023 10:18, Michal Orzel wrote:
>> Hi Stefano,
>>=20
>> On 25/08/2023 00:24, Stefano Stabellini wrote:
>>>=20
>>>=20
>>> Hi Luca,
>>>=20
>>> We are looking into adding ECLAIR support for xen-analysis so that we
>>> can use the SAF-n-safe tags also with ECLAIR.
>>>=20
>>> One question that came up is about multi-line statements. For instance,
>>> in a case like the following:
>>>=20
>>> diff --git a/xen/common/inflate.c b/xen/common/inflate.c
>>> index 8fa4b96d12..8bdc9208da 100644
>>> --- a/xen/common/inflate.c
>>> +++ b/xen/common/inflate.c
>>> @@ -1201,6 +1201,7 @@ static int __init gunzip(void)
>>>     magic[1] =3D NEXTBYTE();
>>>     method   =3D NEXTBYTE();
>>>=20
>>> +    /* SAF-1-safe */
>>>     if (magic[0] !=3D 037 ||
>>>         ((magic[1] !=3D 0213) && (magic[1] !=3D 0236))) {
>>>         error("bad gzip magic numbers");
>>>=20
>>>=20
>>> Would SAF-1-safe cover both 037, and also 0213 and 0213?
>>> Or would it cover only 037?
>>>=20
>>> We haven't use SAFE-n-safe extensively through the codebase yet but
>>> my understanding is that SAFE-n-safe would cover the entire statement o=
f
>>> the following line, even if it is multi-line. Is that also your
>>> understanding? Does it work like that with cppcheck?
>> Looking at the docs and the actual script, only the single line below SA=
F comment is excluded.
>> So in your case you would require:
>>=20
>> /* SAF-1-safe */
>> if (magic[0] !=3D 037 ||
>>    /* SAF-1-safe */
>>    ((magic[1] !=3D 0213) && (magic[1] !=3D 0236))) {
>>    error("bad gzip magic numbers");
>=20
> Or (perhaps more neatly):
>=20
>    /* SAF-1-safe */
>    if (magic[0] !=3D 037 || (magic[1] !=3D 0213 && magic[1] !=3D 0236)) {
>        error("bad gzip magic numbers");

+1 for this approach, I was going to suggest it

>=20
> Jan


