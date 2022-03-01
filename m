Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5974C8CA9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281437.479769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2a1-00027m-Em; Tue, 01 Mar 2022 13:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281437.479769; Tue, 01 Mar 2022 13:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2a1-000252-B3; Tue, 01 Mar 2022 13:30:17 +0000
Received: by outflank-mailman (input) for mailman id 281437;
 Tue, 01 Mar 2022 13:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNgs=TM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nP2Zz-00024q-4a
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:30:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9a7caf5-9963-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 14:30:14 +0100 (CET)
Received: from AM7PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:20b:110::16)
 by DB8PR08MB4571.eurprd08.prod.outlook.com (2603:10a6:10:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 13:30:11 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::9d) by AM7PR04CA0006.outlook.office365.com
 (2603:10a6:20b:110::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26 via Frontend
 Transport; Tue, 1 Mar 2022 13:30:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 13:30:10 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Tue, 01 Mar 2022 13:30:09 +0000
Received: from 9e6f22f12155.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2BE4B18E-70EE-446E-9ED5-6BB98E40787A.1; 
 Tue, 01 Mar 2022 13:30:03 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e6f22f12155.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 13:30:03 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by PAXPR08MB7245.eurprd08.prod.outlook.com (2603:10a6:102:210::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 13:30:02 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 13:30:02 +0000
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
X-Inumbo-ID: b9a7caf5-9963-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QJG6lUHRRR5Bx3rjh8fSAN00goQWZPELfVy7v1+b2g=;
 b=UH6MZl/7vnBdf6aVCu16GgQjyT+zxKhJay8+ci9v0n4HwmQ/eQj5URgn/9VOxuHqwfE533HUeRAEn5r67Ebb/FzvuW4cKGGCYQ+amPJ39jBbGMtLbswX/2gTBDA78+DwKj8WeAxGhlgQwISAW4fvsBNCXW7DjYGINGTeZAJjVqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 700619e766453692
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfdY3iVlxJxOxz1M/69x0h5civqz40qpLF7kjNK/dFl7xl4TDGfpEFdQQJyd5JUeHqZrt4I2vcTMrEpkq6XbnI2ETeEaChxF4uowJrG3wLM136sQ95DsXIIooZ8O3LQEjjczPAZ3vRbAuhx9kO8BHCpEj0ingg2fRnucMEC/6kOx2xwNtytStxKQi4cZNs/DD1KymRdmcb0g2ph7owgw6JRLmApyeAa2ZnCX5eeu/68SSx/gFM6BKa3BQ5zXM0vfx4lN4ME1qhzFaMki+biIs3OCb0cc+X7JyKz+XLaFwPnhxZCEMtKuZxsTc0ii+42NAQ1jXHCcR13AQEmtk1S+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QJG6lUHRRR5Bx3rjh8fSAN00goQWZPELfVy7v1+b2g=;
 b=g/wBM+R9+ZkxQuGJKz3t0XsQmgoqtv4unBhXtsDFuYVQOCtT6PoYIc8d+lDKLs1R/nzGmeI1sP+jS0qsrIc/wJ+Vn6gWbyhPbOE/g2QIyHPtN1srAUWlASiXOB9kDsaVH8kJVRzbcVxVKG//j0N/haM1FhMSvxOb53tkC6vHEUN9eus6m+AiwytXFUoX+Zz2Ra4gwa76jjRJrnH65CS0+/0t1Akro21zwKFzNUS9xDjuGhzgsiZIv5t1UhqscMMue+o8Ic4JnvZCIFNLqyq84xpTf4qDpn23baGPnv5EXmyo1ASPSu1YpxqdjfVBbK053eO8obraiLlP8a8S4bpOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QJG6lUHRRR5Bx3rjh8fSAN00goQWZPELfVy7v1+b2g=;
 b=UH6MZl/7vnBdf6aVCu16GgQjyT+zxKhJay8+ci9v0n4HwmQ/eQj5URgn/9VOxuHqwfE533HUeRAEn5r67Ebb/FzvuW4cKGGCYQ+amPJ39jBbGMtLbswX/2gTBDA78+DwKj8WeAxGhlgQwISAW4fvsBNCXW7DjYGINGTeZAJjVqs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: fold sections in final binaries
Thread-Topic: [PATCH] x86: fold sections in final binaries
Thread-Index: AQHYLUowkdMxBaiHpEebmldzPiiqI6yqOnQAgABL34A=
Date: Tue, 1 Mar 2022 13:30:02 +0000
Message-ID: <915C7BBD-AD0C-42B8-8459-C3BFDCDC0A11@arm.com>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
 <1a4bef81-d29e-97ae-098b-d1e582e5af28@suse.com>
In-Reply-To: <1a4bef81-d29e-97ae-098b-d1e582e5af28@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4ca02b7d-64c8-4a41-4abe-08d9fb879be1
x-ms-traffictypediagnostic:
	PAXPR08MB7245:EE_|VE1EUR03FT035:EE_|DB8PR08MB4571:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4571BD0B1CF594BD31F838369D029@DB8PR08MB4571.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A1QqoG3aaBOUuf4YgpBSZ+utEUR0jBmDrc3LuWEngNGLG6ID2n7w9MLdIj42I4OP+f9PINDNUYHk1KFBVVv4miGtp2csMu9PkWbeJWpfVrr4uZkcoCZ4eBjBSaJg5t0I1HYLy0QgtKR/xk4lvSDL9O3KcsXVrXomkRsxbx5PxDLCwC5+1AsE8XtvEUk3Or91v6AxwMev6t70ExzF/rzBO/sb81vi4ZlHmmSfR/Tw1dgUoEwdbi7EavrDeLWfdIdvFJVWQKLayMm4LgsSjX0N7QkBNScOdkfYJuDUT9K3IF9yvtTs6GfsiawEGwnoV7WIrnqUdvoaZdT8OSnqdhk6+Vw8uuexXXwMvcwtQY1gLw+RLiVVQkifYAxIR7uNd9EVrE5HFzIcoODjEAXhWnmXJeKySUVAS8kdTsfqWCX4qEfr9XEBs8jR1vzI4RvmLWoc0Uc9MisGrZ3hDWZSD4Fge3AHKPlNLU0MR0JD3MQ2biBkl7vXnVuPUJDm8gnvKXJRO6ODG5HeMki930EtU8fKy9Iw5+n3XekR2s3rxeayDi6q1fvfCbroacsVMjyIBO9vK9Zfl9ghAyIfLa1AQf5YD0vMu2asDFy72DLAgRgDlRLi7j5JhtCNYoMBAfLHVuVFu4vMGKE3QjjBIE3lo8y/Dr4eS3kA0Qx7OcLGgNrdL/EiogXHJ2Yu6OwcV9PrE78itf1w6UZSv6EJQZ0ne3do0HohXFP66NbdRdYz2V13SegamthCkh9kTcbCMzOvij8r
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(122000001)(83380400001)(2906002)(38100700002)(6486002)(8936002)(5660300002)(6506007)(91956017)(64756008)(6512007)(76116006)(38070700005)(66946007)(66446008)(66476007)(66556008)(4326008)(8676002)(33656002)(316002)(26005)(186003)(2616005)(6916009)(54906003)(53546011)(86362001)(508600001)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <980D511F3F5AE34189FA3120E4E260AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7245
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bef005c9-bb6c-48a9-3569-08d9fb8796f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xt5I6Ik8BZ2ciksmoBn7YvBvBp6ZTO6QfMWlfcvHtCCqz4/wCqYl2NSdDlT3p+0TmmWQPpNpPV1ABD2EV1huX8TlHV6qt5jkaUW7xtPGmFRbgnIlEq7D8KIJ6BzmqXu48ypgsgw07SnXoW9u7Lu4d7VYYM9x6/ByR/P5/6AoThw6pKSxBUHdEzxur/asiTVJ5CtuXS628J7CC1zXC1SM1dotFcDSFHGgwZ0WlQj1nczjlRGHNcKAUT7xUcW65YV/aOXSC+uLLfB5QoBMlHmTf8bWjTpfBbzZJ41MAi8MHJ00wlwkkwRtGqdzEou2n4VkF9dIS5W5l5LmP7l6HwhZYwuPdi7oBd67tEHqIsMM1FYsiafNPENewzABBlabcsBt8+1Ym37+q9ywqzKfAw7Zx6yEx/MhDfYPpVFqAWbH4ZV1irIB1gNQt36JiHnkO8+PzviOsKVMIyDJZ9GI+uDakyCvW9mtJ2s27bFOHT6DtD+1J2NcK0nW/YQvc4qIl39wyMu7BZp8qwbYKFNi2lXwVi1YgTJupKeD2VFFJPAoI7sO/2JdTEM37NupR/udaf0ZdCNbCw21XiFSd6avEWduKkVyz1Cx3CQXnOlk6IVf67Z4JNOOQVZMGuaCsdHobQ/yJGzsS3goTPrvLSghSaEO9uMKRJxUxuSndfHyBQiIEKiQ16YnovFKyYWZSev2YZcw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(8936002)(47076005)(5660300002)(2906002)(81166007)(356005)(82310400004)(40460700003)(6862004)(2616005)(6506007)(508600001)(8676002)(6512007)(53546011)(4326008)(316002)(70586007)(70206006)(54906003)(6486002)(336012)(33656002)(83380400001)(36756003)(26005)(186003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 13:30:10.2932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca02b7d-64c8-4a41-4abe-08d9fb879be1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4571

Hi Jan,

> On 1 Mar 2022, at 08:58, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 01.03.2022 09:55, Jan Beulich wrote:
>> Especially when linking a PE binary (xen.efi), standalone output
>> sections are expensive: Often the linker will align the subsequent one
>> on the section alignment boundary (2Mb) when the linker script doesn't
>> otherwise place it. (I haven't been able to derive from observed
>> behavior under what conditions it would not do so.)
>>=20
>> With gcov enabled (and with gcc11) I'm observing enough sections that,
>> as of quite recently, the resulting image doesn't fit in 16Mb anymore,
>> failing the final ASSERT() in the linker script. (That assertion is
>> slated to go away, but that's a separate change.)
>>=20
>> Any destructor related sections can be discarded, as we never "exit"
>> the hypervisor. This includes .text.exit, which is referenced from
>> .dtors.*. Constructor related sections need to all be taken care of, not
>> just those with historically used names: .ctors.* and .text.startup is
>> what gcc11 populates. While there re-arrange ordering / sorting to match
>> that used by the linker provided scripts.
>>=20
>> Finally, for xen.efi only, also discard .note.gnu.*. These are
>> meaningless in a PE binary. Quite likely, while not meaningless there,
>> the section is also of no use in ELF, but keep it there for now.
>>=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Some of this will likely want mirroring to Arm as well, even if xen.efi
> there isn't produced by the linker. Sections are better properly folded
> even for ELF, and constructors not ending up in [__ctors_start,__ctors_en=
d)
> can surely not do any good.

I fully agree with that and it would make sense to do both changes together=
 to
avoid differences between x86 and arm unless required.

Right now our discard section on arm is a lot shorter and I do not see why =
we
would need any of the sections that are discarded on x86.

As this needs testing and checking I do not think it makes sense for you to=
 do
that right now.
@Stefano and Julien: I am ok to create myself a task to sync with x86 in th=
e
 next weeks/months, what do you think ?

Cheers
Bertrand

>=20
> Jan
>=20
>> ---
>> TBD: We also use CONSTRUCTORS for an unknown reason. Documentation for
>>     ld is quite clear that this is an a.out-only construct.
>>     Implementation doesn't look to fully match this for ELF, but I'd
>>     nevertheless be inclined to remove its use.
>>=20
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -194,6 +194,7 @@ SECTIONS
>> #endif
>>        _sinittext =3D .;
>>        *(.init.text)
>> +       *(.text.startup)
>>        _einittext =3D .;
>>        /*
>>         * Here are the replacement instructions. The linker sticks them
>> @@ -258,9 +259,10 @@ SECTIONS
>>=20
>>        . =3D ALIGN(8);
>>        __ctors_start =3D .;
>> -       *(.ctors)
>> +       *(SORT_BY_INIT_PRIORITY(.init_array.*))
>> +       *(SORT_BY_INIT_PRIORITY(.ctors.*))
>>        *(.init_array)
>> -       *(SORT(.init_array.*))
>> +       *(.ctors)
>>        __ctors_end =3D .;
>>   } PHDR(text)
>>=20
>> @@ -404,16 +406,20 @@ SECTIONS
>>=20
>>   /* Sections to be discarded */
>>   /DISCARD/ : {
>> +       *(.text.exit)
>>        *(.exit.text)
>>        *(.exit.data)
>>        *(.exitcall.exit)
>>        *(.discard)
>>        *(.discard.*)
>>        *(.eh_frame)
>> +       *(.dtors)
>> +       *(.dtors.*)
>> #ifdef EFI
>>        *(.comment)
>>        *(.comment.*)
>>        *(.note.Xen)
>> +       *(.note.gnu.*)
>> #endif
>>   }


