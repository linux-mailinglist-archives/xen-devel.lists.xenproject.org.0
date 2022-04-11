Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0AF4FB5FD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 10:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302739.516463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndpRQ-0004Z8-4L; Mon, 11 Apr 2022 08:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302739.516463; Mon, 11 Apr 2022 08:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndpRQ-0004Vr-18; Mon, 11 Apr 2022 08:30:32 +0000
Received: by outflank-mailman (input) for mailman id 302739;
 Mon, 11 Apr 2022 08:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfOQ=UV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ndpRO-0004Vl-S6
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 08:30:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4a8b4d5-b971-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 10:30:28 +0200 (CEST)
Received: from AS9PR06CA0044.eurprd06.prod.outlook.com (2603:10a6:20b:463::35)
 by PAXPR08MB7394.eurprd08.prod.outlook.com (2603:10a6:102:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 11 Apr
 2022 08:30:18 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::bd) by AS9PR06CA0044.outlook.office365.com
 (2603:10a6:20b:463::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 08:30:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 08:30:16 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Mon, 11 Apr 2022 08:30:16 +0000
Received: from b4f665cdc745.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5545757A-54E4-4A1B-950C-330A1203336B.1; 
 Mon, 11 Apr 2022 08:30:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4f665cdc745.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Apr 2022 08:30:10 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AS4PR08MB8071.eurprd08.prod.outlook.com (2603:10a6:20b:58a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.29; Mon, 11 Apr
 2022 08:30:00 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 08:29:59 +0000
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
X-Inumbo-ID: a4a8b4d5-b971-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYzB2WdYhMpuT0nWJ3euzQTltacZT0SP8w2JBh/xavI=;
 b=2fCiWLnhuK1O/10dar8WzL8XSgsnTYMir7KkYk9F0zjldWNbcz3nOVhqRrdsBs+HM2D92GcJ2RHEUqoggo4u4Q4pV1H/xI9PVQ8xjGjNuF5zPlLwYdOfXr57hW24/DUhhYWO7zsujyqI4Fxsw4GT0fskBlJq5QvUXuGNi6uYhaY=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4c77bc69ba576d3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOJvrJ7JbuPZYQN0qJLHUWOjZZ64pYmcXqlVONFiaJZT56TOhM1EMELsgMVxATMUDUQgHu9MGnLdiIWNgp53vwxEzQKovds7NTjd6UVWdjeqwfZGPS8GLXvyevqm28Edun1DobVoqvQBy52ykNcMzqTx8tikSMRDQXdzshQHL9Y0HwRdHNI9zOzcwg8IyIXW48IXiodiLCr0MRHqI9O1Nm+Fe+q7lzm5dB13QpeWWsfnIoMN13Uo/G4FykVVpdAi6cNqRNlucA5QHDsVgGWEWW3nVSDzGyOoAl2QbUWZUDA4LXok1+6HWLK+AcOBeCeWOBV2CD8W2dMpM6PjD+cXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYzB2WdYhMpuT0nWJ3euzQTltacZT0SP8w2JBh/xavI=;
 b=brmBajrNYJNjaGLxhPiZxqJxjN5oObajvIkp6KD+rwpa/1NCYzCiSWl12jhjhz1mRdB93twS9c2VFhLvP5TQ9pMeA6U40fzjiURhaEBqLvlgx4t+Qdd3QfHybLvd0ifjXVeyo8hH1AoFKp/J3ZTolrT7qI1CjefOLLElvBoUrG7uTVpJMKQAZ/RgZwZUEJsmaApTL/C/mkiUTORPA9lQ1ZyO5OMIGZBM95bM3NpxxlWu0hc6BOxjD5AlV1TVAERmxrK4psRHjRu8EstXSGaBhHQEAiw+zFC+ciroKmhBw5JyjDifB/0Z9VhVSJ7I0M1O+aBCyP676VGBN9B206Z+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYzB2WdYhMpuT0nWJ3euzQTltacZT0SP8w2JBh/xavI=;
 b=2fCiWLnhuK1O/10dar8WzL8XSgsnTYMir7KkYk9F0zjldWNbcz3nOVhqRrdsBs+HM2D92GcJ2RHEUqoggo4u4Q4pV1H/xI9PVQ8xjGjNuF5zPlLwYdOfXr57hW24/DUhhYWO7zsujyqI4Fxsw4GT0fskBlJq5QvUXuGNi6uYhaY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index:
 AQHYSyUg2T6WkJDiXECW3myZV3L//qzluEIAgAArbICAAAYSgIAAjXIAgAPJp4CAACWEAA==
Date: Mon, 11 Apr 2022 08:29:59 +0000
Message-ID: <CE2F688A-70F2-40C2-8B8F-A3694EF8F395@arm.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-5-luca.fancellu@arm.com>
 <93aac581-8105-c8e5-f7c9-fca850667f33@suse.com>
 <4F1CCE02-DC8C-478C-AFFC-A67290188ECB@arm.com>
 <511b60be-c6c6-d13a-b9aa-40e67e5a1b1c@suse.com>
 <alpine.DEB.2.22.394.2204081320210.3066615@ubuntu-linux-20-04-desktop>
 <1be2f46c-700b-6af1-a74a-d090196c9f5f@suse.com>
In-Reply-To: <1be2f46c-700b-6af1-a74a-d090196c9f5f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 298d36d9-77f1-4bd5-bdec-08da1b9581e2
x-ms-traffictypediagnostic:
	AS4PR08MB8071:EE_|AM5EUR03FT029:EE_|PAXPR08MB7394:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7394F634DEC1883FEDB49700E4EA9@PAXPR08MB7394.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IjyTCLrZLctADo3yQsLBfJenac/HCxec5Qo713ul7uzaj+TzhmNrKI5+jhAH4deGa59Rgu+F9bwPxY3WqWopamF6MJQn3N7YR8hniqf62Px1/TwN4+0iBzrrtexOHi0cbp6JkX6ov16AMT41abTk2zjyMfPssIx9IP4z7y++m87+Qyojn7DCyGkuePuh5AgxUf+76r75frjaPiC2ombpA5jj+ErnyfKHzU8w68Qviy8wiuDFOMmmWYZiVKDyV1jm+ACQ0L/vw0pCp+RfraabsSon5YzVrFpm4ptfcPZaAPWHQ74p0B6si3GpP+bn0S8Tfy/esknaWN7+6efMJ5l5jZZjiT9vq4YZPTFhC5+r3JKPz8OiClMkX7WgtpOkClngTTqD+Xr0GBUQt1o3G6SRUy3WSiyocibHBg/tL5nS3bqF3IDdzP52wP+n+MkkujYMY3FMPqwirv1xZGuTd84rfdLLSz3esxvANUECmN/XBPgMX+i2X02uCRa8Vg+dnteduMAH3oG2jEldfla0DA3msLZlbMckY3fSWH/3pI7VWOBz9WVAuaeZ6na4D6uPeBH4LBK1D7RJgM4yEg6AKH7x9cJ6rk5gyNL7Q8wX8bok9nW78VW/dX+1mE9dI3ayU3/aYvU+I9zl179aBUZI2FD6ITb7agujG+PYrrRveAq04BNqcIo8EYIXOvAyFeqgOC+smA2ejGXXZFitiMTQlAxZXRvS73TbqLx/cleiUOp65zY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(6506007)(186003)(26005)(53546011)(8936002)(2906002)(36756003)(6512007)(38100700002)(2616005)(71200400001)(38070700005)(66446008)(64756008)(508600001)(6486002)(66946007)(66556008)(86362001)(33656002)(8676002)(316002)(76116006)(5660300002)(91956017)(4326008)(6916009)(83380400001)(55236004)(54906003)(66476007)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D9FDBE68A46B3149812ECAB38868194A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8071
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99e7f68f-0a7b-4168-8e73-08da1b9577a3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IoxZwPMoRVO7+0OnvMICTbTLtLLCrRCpqA1VlH2qQfm4YhIOtkiN4wINWI1Z79MzD+brgVKcOUBvP2iZso532eCseqegZwWHu1r7GiHLGN+8UJJWGSkrsU80ZfEJg97WTB/3R66f1qmiTX6xM0uiL3vpdOJg5skWV8uNnsg/tDOpKsB85Dx1e1C1CEYxSCXjBx7PtDfX/qXkruSTzOXiigbhDh99CCiQDQcc07Bx1K58yohlEO/L1rE97Qy8KAiW5ctD22hovX/0aQPK+ZjmUaJxLOigDuY10CyFANhpsP/DXFYJnQDJyS6VD6opo7Xf8bsbwKSZp9p/NeHyAFaPdD6jyLHBzYqEx8k3WA0eZYfbpRByn1KZeeixIz+/4DDG780ex653nam8FYFG4j5uTGt0YGCD/yhLMLgY/O5Zxqt/WAmp3JcR0dAt0mrEuNc/7IQczSEEAUutyANdlJ9xJKFp9RqEpQLjC6t+0JNXnFsJZCgBGLRMO7HHNLM2rCHaNAl2/rR7h2A0/BZu6mLcPWVl0EOx9RMAc8i7OKCRZvJUExeEP1J4QZ0QkiO8Y1TdAYt/ccdFmTFPfLoOQPYWoCEqjOoB89MlCcc/+qe2cSONtX9Cfd9W6dcaOKyr6uClBh+5tcrrAPo8JJzneN4ROiFibUogwpuZyxWMp3x+VAAqSY7KGNZH/FMdvsymFCcnd71vBmxc9F9hVSuw0jTt3P4MltMALfV+zX45DeJf7Ec1aQ9aWQKoLS6xHpVlEkMv0KQd7RuRen89u5bX3/xw5A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(336012)(54906003)(8936002)(6862004)(6486002)(82310400005)(6506007)(36860700001)(316002)(2616005)(83380400001)(5660300002)(6512007)(508600001)(81166007)(26005)(63350400001)(53546011)(356005)(47076005)(63370400001)(186003)(36756003)(8676002)(86362001)(70206006)(40460700003)(2906002)(33656002)(70586007)(4326008)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 08:30:16.9075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 298d36d9-77f1-4bd5-bdec-08da1b9581e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7394



> On 11 Apr 2022, at 07:15, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 08.04.2022 22:25, Stefano Stabellini wrote:
>> On Fri, 8 Apr 2022, Jan Beulich wrote:
>>> On 08.04.2022 13:37, Luca Fancellu wrote:
>>>>=20
>>>>=20
>>>>> On 8 Apr 2022, at 10:01, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>=20
>>>>> On 08.04.2022 10:45, Luca Fancellu wrote:
>>>>>> ---
>>>>>> docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
>>>>>> xen/arch/arm/include/asm/smp.h | 3 +
>>>>>> xen/common/Kconfig | 7 +
>>>>>> xen/common/Makefile | 1 +
>>>>>> xen/common/boot_cpupools.c | 207 +++++++++++++++++++++++++
>>>>>> xen/common/sched/cpupool.c | 12 +-
>>>>>> xen/include/xen/sched.h | 14 ++
>>>>>> 7 files changed, 383 insertions(+), 1 deletion(-)
>>>>>> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>>>>>> create mode 100644 xen/common/boot_cpupools.c
>>>>>=20
>>>>> Under whose maintainership is the new file to fall? Without an
>>>>> addition to ./MAINTAINERS and without the file being placed in
>>>>> xen/common/sched/, it'll be REST maintainers, which I think would
>>>>> better be avoided. Would it perhaps make sense to have this as
>>>>> xen/common/sched/boot.c, allowing other boot-only code to
>>>>> potentially be moved there over time? This would then also avoid
>>>>> me asking about the underscore in the file name: Underscores are
>>>>> a somewhat artificial thing for use in places where dashes can't
>>>>> be used. Yet in the file system dashes are fine, and dashes are
>>>>> (slightly) easier to type.
>>>>>=20
>>>>=20
>>>> Ok I can put the new file under xen/common/sched/ as boot.c, should th=
is new
>>>> file be under this section?
>>>>=20
>>>> CPU POOLS
>>>> M: Juergen Gross <jgross@suse.com>
>>>> M: Dario Faggioli <dfaggioli@suse.com>
>>>> S: Supported
>>>> F: xen/common/sched/cpupool.c
>>>> + F: xen/common/sched/boot.c
>>>=20
>>> If it's to hold general scheduler code (which this shorter name would
>>> suggest), it shouldn't need any change to ./MAINTAINERS as the
>>> scheduler section would already cover it then. If it was to remain
>>> CPU-pools-specific, then you'd need to stick to the longer name and
>>> put it in the section you have reproduced above.
>>=20
>> In my opinion it is best if the maintenance of boot_cpupools.c falls
>> under "CPU POOLS". Luca, you can retain my reviewed-by when you add
>> the change to MAINTAINERS or rename the file.
>=20
> Yet even then, with cpupools.c living in sched/, ...
>=20
>> I don't have an opinion if it should be called
>> xen/common/boot_cpupools.c or xen/common/boot-cpupools.c
>>=20
>=20
> ... this one may want living there are well.

Yes I agree with you all, I will rename it to xen/common/sched/boot-cpupool=
.c
and add it in MAINTAINERS.

>=20
> Jan


