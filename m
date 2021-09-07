Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2414A4027EA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 13:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180848.327690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZMw-0004Ne-Fq; Tue, 07 Sep 2021 11:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180848.327690; Tue, 07 Sep 2021 11:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZMw-0004KU-CD; Tue, 07 Sep 2021 11:34:26 +0000
Received: by outflank-mailman (input) for mailman id 180848;
 Tue, 07 Sep 2021 11:34:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qx60=N5=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mNZMu-0004KO-Lu
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 11:34:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccfbc2d0-b984-4a6f-990a-a474e83ec3e9;
 Tue, 07 Sep 2021 11:34:21 +0000 (UTC)
Received: from PR0P264CA0054.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::18)
 by VE1PR08MB5775.eurprd08.prod.outlook.com (2603:10a6:800:1a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 11:34:07 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1d:cafe::d4) by PR0P264CA0054.outlook.office365.com
 (2603:10a6:100:1d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 11:34:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 11:34:07 +0000
Received: ("Tessian outbound 0ec886cb54dd:v105");
 Tue, 07 Sep 2021 11:34:06 +0000
Received: from eb989c4f2559.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8711F606-4838-4034-B687-C61EEADCF023.1; 
 Tue, 07 Sep 2021 11:33:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb989c4f2559.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 11:33:56 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6270.eurprd08.prod.outlook.com (2603:10a6:102:f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 7 Sep
 2021 11:33:54 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 11:33:54 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0050.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:152::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 11:33:53 +0000
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
X-Inumbo-ID: ccfbc2d0-b984-4a6f-990a-a474e83ec3e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCCMeL6Eftx+YuUav1pGAJzgOA0UT56Kr+WzuuB4RWM=;
 b=JJj7S3F0et2bfdOwiB5uOWCIPf/d6CAmCWTv9MYT3IrihaFF2lOTeMKYEbRwSmpVq05DLABkolHQn+hBpsSq03+onbb8o7bLDAjyffaCt/Z26xh5zu1DY/cDbjN1xvQsQRxzBu1AyjKrBtndX5SqawSaTq9FK9T28U9CwBqiLzU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35c017e931b65242
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FctFGljTKHwoIn+RkMW29m+bJRD25ctBnAZGlAnZ8q4S0yrH9O3pCruloZuPa1PmiBxzIOwd7nGy4tQi9tsiTcH6CHLwxt3Kof2BYlYvOvTIRjiYHd+tD1T6BkukXuVOF8qVsEFgYU+gbnaz+kF7A7ov4+UEefdat21XGEYeCbV4CHtwlY/lf1iHWEz3crkB7A/v2E4kLFoTOz5NFyzepXNKD1P/OT642Jf7LHAqfVEDB0pY+2l+7SahLRTrYBJrhzdQ3+NTca7LYtpEUSHHSksUHVhMb2kjScypJ1MD0VeAaoiKdTsVMSK/QRuS0fd6IyqnngTujc8qfE8Ub+UtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MCCMeL6Eftx+YuUav1pGAJzgOA0UT56Kr+WzuuB4RWM=;
 b=TxvVrqZSbtTtWbkjFK3Cnay1kB5MTmSqkFKu1BMz37EU4NebkEmeDvsxwY2f0oqRpqKk6lx98rxUOrh2NvEyj9h3L8sFobZTitwq7x24n1bbRA8zBH+t3RD20IJhCXJn5MQBEMCRMtSj0Aa6UnNH3OUgtv3hgjhd1Z3LXz3AwBBS5dQPIWytIHnfMiHu/FA+ZfA7ttDcTBT/DCG/cZAKoXIRfY6dXv1XM0UGwaeqxwYx0v0pa2yspK5vo73Vvf5Afwj3frug1rYZPddHANIGk+W0ncAN1WkOu+vHsJjPS65HXXuh6iMS0Iyq9EJo7QaXkRrOsGBeURwdIGJmCckdtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCCMeL6Eftx+YuUav1pGAJzgOA0UT56Kr+WzuuB4RWM=;
 b=JJj7S3F0et2bfdOwiB5uOWCIPf/d6CAmCWTv9MYT3IrihaFF2lOTeMKYEbRwSmpVq05DLABkolHQn+hBpsSq03+onbb8o7bLDAjyffaCt/Z26xh5zu1DY/cDbjN1xvQsQRxzBu1AyjKrBtndX5SqawSaTq9FK9T28U9CwBqiLzU=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <1b4eef88-78cb-7201-c326-551261f9e9ad@suse.com>
Date: Tue, 7 Sep 2021 12:33:47 +0100
Cc: Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1964F880-98C2-45BF-8CED-C34397F61F4C@arm.com>
References: <20210907065228.21794-1-luca.fancellu@arm.com>
 <ea736db5-e3cf-7eea-cffe-98ecb0290048@suse.com>
 <3222722f-b12e-3991-d0de-b455b9fca063@xen.org>
 <1b4eef88-78cb-7201-c326-551261f9e9ad@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::19) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59b135d2-57d4-42c1-0948-08d971f36755
X-MS-TrafficTypeDiagnostic: PA4PR08MB6270:|VE1PR08MB5775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB57757D3DA3474DDAA09E728DE4D39@VE1PR08MB5775.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qLZHWkisKTiCF3UoirOvktChV1mbtN1n+e90qMT4ejv+8KMVwGAAHcDn9CmZJ/AB4cE43D2WK+b6VkPXafesx3Lc0ecTPBFOKZZlXAZszx362euaGd25CjYQsDSUtOgY/WIlqdDt3y3/GKuv+FvmbFuBzVzzeV78E26rTq5jfqkDFsA3PvA5kTXKCXuu3lzBFIeZjBP/9k52VFddOxLUGkgxm6iH43pyGvoXaTEDDBYuy37zA8Setxxo+VMEREfPpXR6OZVxG+A3CEf1kaZBbPI8M/84C/t7o0aOSsp7X/m4U3hFeGnzohOIlsc+vkEjQcQgcTMTujC+mUO3wVulSSuIpdNWtE8tyo1JrMcTKT7Mgtf+amI1OHQUiuOe+Px+xl/UZ9abtt/mJcQK1apYbIV7aKopBit8UjnaItomn3vdlU8VtDkHNHoUSn/ZVf8zwmBrgPTKpToNqbPGJfi9Q55Y4s+xgj262pEP4kiYwpb7eER9Y6FMECYryPy6yHXwC1IuMdeL7YLHl7heO3wKpimNZqLSBqvbxqDrtfgRKEccCp0yAb1e7UOuK6wmZwNsmiQTgeJtZMuYHl2tMGyFeW6wCgoBSdCusEM6YE3FuT76Kx7d21MdoLUmGOKqFimVGAQ6iq19qmD5m8xonDESq4Q71yTXYROYINWMRoGN+2AGlOY8QAG4BeMqST9pKAZDcCxVFfOld34PMA38ykYESGvRvF/6ShZ8SCM0gR7kpL/6GHJ8eaw/Pg6Soxm4CSEl
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(6512007)(44832011)(53546011)(26005)(186003)(66556008)(6666004)(6916009)(2906002)(2616005)(66476007)(66946007)(956004)(6486002)(83380400001)(36756003)(33656002)(54906003)(478600001)(8936002)(4326008)(5660300002)(316002)(86362001)(52116002)(38100700002)(6506007)(8676002)(38350700002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6270
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f82f01f4-376b-40c8-a761-08d971f35f8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XBpNM0Z5UT5rHlSeTQ2/HllZHPA93gNWn+c1caRyE9qykexBfZ0476UQB3aSt8HCMBVARqqB/3ODpKX+hRgau6qNoSB/X8RgbvSbNvgskJMbD3YSfIA6I7GCyp08YEX8J6lm3JYFuk0t1Yk7ZKFLD9I4WR2og+kvrj6tSCUsrq6IztQ+6hN6bemuKpCogtrbzMYxrptKPGSxky3YRu+lBRnlrKSWlR7zTyORHKQvuAC+VCoHrdHah6QgFLjYTn9SYCTPd1GyanYegyXWzQQCpC48JABjFJ7QOe8Bga9qkjThHmI5JaX80Q4aLIYgA2/24ID+jiHA+8rld1i24+OAInhqEH6LHLB4FhqSfBKMPWJkJDNwWBjd8zXd7Fv4S2G96nlcumF2QlcvH5hjodzZWTO4sMWGd7B1e/FjUv4Gt0WfPYlsoGtXGHh5SC0QgoLurfSYRgcxjkklVQs4BzmsRjtCk03ptJeCqprf3ZODxbBPAUociOPmVbPMmYqaMgc78sGrZZBRfwH0EYOcS5c+DqJq63xjnFoBGtmZRayYbLF/wOF0jngk4sHhS4HPw/A1JT3Z7/odKPcBEmHHry/AfX9zv5ti+SCSC8+IrB7UndlvEe8MU8tPYwWk3faAi7pOexyIdvaLw39JMpUuHj1dqXn8mbXhaEpd2D/DE51z26k93Y+fKXrUCFBJzhU7Apwdn/EpDbQzcafOmWL1lL4rcoGxigjAdWTTmw7OWeBZhyc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(6666004)(5660300002)(8676002)(54906003)(83380400001)(44832011)(6512007)(956004)(70206006)(70586007)(26005)(6506007)(316002)(33656002)(53546011)(6486002)(36756003)(8936002)(508600001)(336012)(4326008)(356005)(2906002)(186003)(82310400003)(6862004)(86362001)(36860700001)(47076005)(81166007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 11:34:07.3144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b135d2-57d4-42c1-0948-08d971f36755
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5775



> On 7 Sep 2021, at 10:24, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 07.09.2021 11:17, Julien Grall wrote:
>> On 07/09/2021 09:33, Jan Beulich wrote:
>>> I'd like to suggest a different scheme, not the least because I expect
>>> the individual domains being independent of e.g. hypervisor command
>>> line options or Dom0 kernel versions. Yet varying sets of these are,
>>> for example, a reason to have multiple sections in the current scheme.
>>> Every dom0less guest would then require spelling out in every such
>>> section. Hence I think we'd be better off having a section per guest:
>>>=20
>>> [guest1]
>>> kernel=3DImage-domu1.bin console=3DttyAMA0 root=3D/dev/ram0 rw
>>> property=3Dcpus=3D1
>>> property=3Dmemory=3D0xC0000
>>> dtb=3Ddomu.dtb
>>=20
>> I much prefer the idea of the section. This is going to be easier to=20
>> parse the configuration file as we would not have to look for "domuX_"=20
>> and then distinguishing X.
>>=20
>>>=20
>>> These sections would then be referenced by other sections, e.g. by a
>>> new "guests" (or "domus", but this ends up looking a little odd for
>>> its matching of an unrelated latin word) keyword:
>>>=20
>>> guests=3Dguest1,guest2
>>>=20
>>> If it is deemed necessary to make sure such a section can't be
>>> (mistakenly) used to create Dom0, such sections would need identifying
>>> in some way. Presence of property=3D (or, as per below, properties=3D)
>>> could be one means (allowing an empty setting would then be desirable).
>>=20
>> I would expect dom0 to be described in the similar fashion at some=20
>> point. So maybe we should name the property "domains=3D...".
>=20
> Not sure - the order above doesn't mandate domain IDs, yet Dom0 needs
> creating with ID 0. IOW I was deliberately suggesting "guests=3D".

Hi Jan, Julien,

Thanks for your feedbacks, really appreciated, I agree with you that sectio=
ns
are easier to read.
I stand with the =E2=80=9Cguests=3D=E2=80=9C or =E2=80=9Cdomus=3D=E2=80=9C =
or =E2=80=9Cdomu_guests=3D=E2=80=9C keywords where
the references to =E2=80=9Cguest sections=E2=80=9D can be listed, separated=
 by commas.=20

>=20
>>> As to the properties, is there anything wrong with having them all on
>>> one line:
>>>=20
>>> [guest1]
>>> kernel=3DImage-domu1.bin console=3DttyAMA0 root=3D/dev/ram0 rw
>>> dtb=3Ddomu.dtb
>>> properties=3Dcpus=3D1 memory=3D0xC0000
>>=20
>> It depends on the number of properties for the domain, this may become=20
>> quickly unreadable.
>>=20
>> But... if we use sections, then I think it would be better to have:
>>=20
>> kernel=3D..
>> dtb=3D...
>> cpu=3D1
>> memory=3D0xC0000
>>=20
>> This would also allow us to create more complex setup (such as for the=20
>> static memory allocation).
>=20
> If that's feasible parsing-wise - sure. I was first thinking to suggest
> separate keywords, but then decided there was a reason this wasn't done
> in the original proposal (with respective dom#_ prefixes).

Yes I think it is feasible and easy to read, so given your feedback we can =
agree on
something like that:

[global]
default=3Dxen

[xen]
options=3D[xen command line]
kernel=3D[dom0 kernel file] [domain 0 command line options]
ramdisk=3D[dom0 ramdisk]
xsm=3D[xsm filename]
dtb=3D[xen device tree blob]
domu_guests=3Dguest1,...

[guest1]
address-cells=3D2
size-cells=3D2
kernel=3D[domU kernel file] [domU command line options]
cpus=3D1
memory=3D0xC0000
dtb=3D[domU passthrough dtb]

This won=E2=80=99t break the compatibility because on older version the dom=
u_guests keyword
Is ignored, the user needs just to check that a guest section is not specif=
ied as default=3D
argument because in this case it will be loaded as dom0 kernel (and probabl=
y won=E2=80=99t work),
but I think we can just update the documentation to highlight this thing.

Finally this example should load a dom0less system:

[global]
default=3Dxen

[xen]
# Xen boot arguments
options=3Dnoreboot console=3Ddtuart dtuart=3Dserial0 bootscrub=3D0
# Xen device tree
dtb=3Ddevtree.dtb
# domus to be started
domu_guests=3Dguest1,guest2

[guest1]
address-cells=3D2
size-cells=3D2
kernel=3DImage-domu1.bin console=3DttyAMA0 root=3D/dev/ram0 rw
cpus=3D1
memory=3D0xC0000
dtb=3Ddomu.dtb

[guest2]
kernel=3DImage-domu2.bin console=3DttyAMA0 root=3D/dev/ram0 rw
cpus=3D2
memory=3D0x100000
vpl011


>=20
> Jan
>=20


