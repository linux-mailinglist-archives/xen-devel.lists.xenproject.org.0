Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC194E74E1
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:12:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294773.501368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkfQ-0008Jk-HW; Fri, 25 Mar 2022 14:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294773.501368; Fri, 25 Mar 2022 14:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkfQ-0008HV-EZ; Fri, 25 Mar 2022 14:11:52 +0000
Received: by outflank-mailman (input) for mailman id 294773;
 Fri, 25 Mar 2022 14:11:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXB3=UE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXkfP-0008HN-0H
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:11:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82faf074-ac45-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 15:11:50 +0100 (CET)
Received: from DU2PR04CA0317.eurprd04.prod.outlook.com (2603:10a6:10:2b5::22)
 by AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 14:11:47 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::b5) by DU2PR04CA0317.outlook.office365.com
 (2603:10a6:10:2b5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 14:11:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 14:11:47 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Fri, 25 Mar 2022 14:11:47 +0000
Received: from c8636f7e2f6d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B76D07EB-F507-41E1-BEE0-14B4A2D53251.1; 
 Fri, 25 Mar 2022 14:11:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c8636f7e2f6d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 14:11:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR0801MB1694.eurprd08.prod.outlook.com (2603:10a6:800:5c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.21; Fri, 25 Mar
 2022 14:11:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 14:11:38 +0000
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
X-Inumbo-ID: 82faf074-ac45-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoOJFWY+mFiigSVLrHLRDjNWKw2BsPFLUM2KpaD/Nn8=;
 b=jRGJqESgBncKjw6SutZ7pU5wlWCSLFHu2SwK346MJiuFsGDImFP5Ed6P8xwk16AcukfuF5WEQIyogTQYL1m1hwNDZMdYxCPW5vI04KujVocVWSBZoUkSuVlbzdm56I7ginhQzMTtSfj+mjPvFgJnVeCHivPfxJbs82KYEPi4yNc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5d1644729461cf85
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgUGHSgNp+uCd3/aWHV4niiY7aYmsTGX79m7A8hWIFwL78SuJe7ZG6p+w/nCUF9glDUT1hu2x6G1ZAgyP3TP1FXACx8MpCcshv27456MGqBFGjn/g6ZMU6+hWYhWV7ua7TW8d3O/qblBnENa3JlHL/2vVdBPVi9k8yYf2lvF/GEJiRBWQUbiX6Rj62Clvkp2ELtj/WV71xJzNjfKuTIZxrK7d9FCXYlI6tLC/5E0DeBHMt933BZkW2AzV0obM1dV6oYk628/OVTdscF95BkECyIp45jtecOtqJwCmv6Gv20ZGGCtKsIiFJuyI0zNz1Qxyoz2ZdpqCJ88sGmjGizmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoOJFWY+mFiigSVLrHLRDjNWKw2BsPFLUM2KpaD/Nn8=;
 b=iaNt4RKikrosLdZk0fi8+5NanZs9BV1PlL6vcPUrucrdPeBzJ79ulcQeqfIVFJpQhqUrFaaxXu1+8nZc9BcJZaS2eqEHEP5wPdhGJDFAfrYO2JFVamlV9GzS2GjculC1YNFuNwtDgWpyOwcjON5gWROLUQvbC0I5dcX5Kt4vaPYnMu1efHR8BIRn9kEgzwi4I0+rbVdrO5OFmXAZ8mH6d6qFkxKBiZhEWidP9UOATyRCROkuE2zpCEMcrTk8DaIRWDu975P8Q9abZfbMLB3QKiba+lUVC4BYcBcqbC+CwJcFlmLiISFOGhIT/zjsi8glm7AtMg6Y+ZqIfm+t6zI73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoOJFWY+mFiigSVLrHLRDjNWKw2BsPFLUM2KpaD/Nn8=;
 b=jRGJqESgBncKjw6SutZ7pU5wlWCSLFHu2SwK346MJiuFsGDImFP5Ed6P8xwk16AcukfuF5WEQIyogTQYL1m1hwNDZMdYxCPW5vI04KujVocVWSBZoUkSuVlbzdm56I7ginhQzMTtSfj+mjPvFgJnVeCHivPfxJbs82KYEPi4yNc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien GralL
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 3/5] xen/arm: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Topic: [PATCH early-RFC 3/5] xen/arm: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Thread-Index: AQHYM6fbg4sguhQUtUmDN0Bua8GsbazQMhkAgAAEnYCAAAZ1gA==
Date: Fri, 25 Mar 2022 14:11:37 +0000
Message-ID: <BFF09E22-6B43-4D34-B96E-79085705E605@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-4-julien@xen.org>
 <7A115ECF-66CD-4B9A-AD98-53A92F91269E@arm.com>
 <5a20f085-e4c6-54da-473b-4fcec6657450@xen.org>
In-Reply-To: <5a20f085-e4c6-54da-473b-4fcec6657450@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 57f91cd3-c5d1-4387-7482-08da0e69661a
x-ms-traffictypediagnostic:
	VI1PR0801MB1694:EE_|DB5EUR03FT011:EE_|AS8PR08MB6741:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB67418456AF038C50F3E92FBC9D1A9@AS8PR08MB6741.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cG940QzSoLr+Dc/vCIh3/w/hFlFWX2w5yeRv8eihqujHrG1Qj4eqK5JrTcOjD6ldYR4qRi85P/Mpc4cqfGOx9U9BYnklMOzlgiVnwi8aICuDXXlIRHzlCmesyx9yXaNhVlyHeo4LKM8cZ1KoV7Lg0Fguk4IYWKnjYiJGAYjex3etLHaUaIT7nQXkWdTlQnCP4uB+44aB1KTNrgKvNyNVgn3OOnkj1hogC9QAby9SSwRO7/6lSrurjcvnDXzt6wWkdXJ1bbHpSADGE3skLDXcdUuycqveQsf8N57CbGkoedJ1fWu86aCgmJr0BN87VCJvGUeVgIoZgDHXyIY/Z2QGd1h69C6ACs7LQylz9ulgqk4lwCiEnho9dkXbaiSoqa+gCPbRh0mAO9NMU8uWuAPX6w7Oq3gcPd8p1vnxF1xhffabamUdvmfFwAeTMuw8uhAik+aZRhmL7Q+9+36Egaud4UMhEPPKRlK3L3aS68O7SiG4o1GcJ+YIiVkD7DAAh0ZncyVJ68mkaCbk4vokn+XsMJ6+Xifq4o7koW+dRZkAVNvxqQ+9/Ewd3mKxxAz0AGXmTURzp6Ou8abofcjyu7o/eIBCMsPrf63+CuYdOzqAK22767FHps8Sp4ugjNSA5rtqDDWwF9nJAkig9U0ZTDYezcvGpX0SyCpwcDMLxDKQfmLblfj/2TNphLKAgcQB+i2rlHHAuVoxAOKoKD/HWh8UvR9NgneJA/u0MYfmA2/kSGnzbXzSsDnlqse+O3rjFvATQiD0HRE9vFhhDFEausIrSg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(54906003)(91956017)(122000001)(8936002)(38100700002)(38070700005)(316002)(6512007)(53546011)(33656002)(71200400001)(2906002)(66476007)(508600001)(6486002)(6916009)(6506007)(66556008)(26005)(4326008)(186003)(2616005)(76116006)(66446008)(64756008)(5660300002)(8676002)(86362001)(66946007)(36756003)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7A3105EC461BAD44B632041035C8F914@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1694
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3908e6c5-d00c-404d-4706-08da0e6960a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6U8JCqgW7s4KUoUzGIlgwhAq3SRLQJx13b/hi3iyIGAsWSFIWc+UUEe2Wa7F/tXPznL8DWM7ykQFoV7WICVfotqD/qclrCLtuQSoQO03E0CR15U4aaTGxrLISLZ0NrplUfqyrqCL6yyfiyaRGzZ9lvv6ZfvK9U2YAitx9BKA/+F57piyq0bD/qA8HiWnPvOBjizZFd3yCqgSLE/NEpiHRJ4y1k1Qh2EsE4VgWFbw9skG3b21uF0PfRSUe/9Z7DuZ71juixehjvSi/Ddk86PRE/z52wpHbMxpP4eL10VN5I0xRjcYpfJwLebliSZYsLga+zEDq0z42unzS+Ug0GdoLXjtosuYQG47vIDKHgzHAWIGAvqQFkUXW6h6j5jpOGAlSuoxiyMVdpuVkBbLR47/wrzltZe5eoGZl7a3l2zc6t1CJFdKXabwGf13REaz57dD3r0dB7Ahuu3cpB9qaEi211VtmveR6aXpAYiX5U8xzqnbwowhICVABbgTtm80oF/XHA6UZ1s6JWGR13i1IYjAwetn3r/39apZ2SgVDuY/OxIJT+3W+b6bkKnL7qLbvlIGuc6NqS6+dQLZfFl9Yhd00zmIbUDQlkq+5LQ8g7k0nZxxk4KEBUM+uYqvhFVi61D1pNaIC0MfDv2hNi+GevCnrslwBBXk8cZN4UjoYzaWSA3e5aFXnw1vjVw5dk3oym+zBccSjzln9z/zGS2R3IcxYA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(81166007)(4326008)(82310400004)(316002)(8936002)(83380400001)(70586007)(6862004)(54906003)(5660300002)(2906002)(53546011)(6512007)(47076005)(6506007)(356005)(70206006)(86362001)(2616005)(26005)(186003)(40460700003)(336012)(36860700001)(6486002)(508600001)(33656002)(36756003)(107886003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:11:47.3631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f91cd3-c5d1-4387-7482-08da0e69661a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6741

Hi Julien

> On 25 Mar 2022, at 14:48, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 25/03/2022 13:32, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi,
>=20
>>> On 9 Mar 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> From: Julien GralL <jgrall@amazon.com>
>>>=20
>>> In follow-up patches we will need to have part of Xen identity mapped i=
n
>>> order to safely switch the TTBR.
>>>=20
>>> On some platform, the identity mapping may have to start at 0. If we al=
ways
>>> keep the identity region mapped, NULL pointer ference would lead to acc=
ess
>>> to valid mapping.
>>>=20
>>> It would be possible to relocate Xen to avoid clashing with address 0.
>>> However the identity mapping is only meant to be used in very limited
>>> places. Therefore it would be better to keep the identity region invali=
d
>>> for most of the time.
>>>=20
>>> Two new helpers are introduced:
>>>    - prepare_identity_mapping() will setup the page-tables so it is
>>>      easy to create the mapping afterwards.
>>>    - update_identity_mapping() will create/remove the identity mapping
>> Nit: Would be better to first say what the patch is doing and then expla=
ining
>> the NULL pointer possible issue.
> The NULL pointer is part of the problem statement. IOW, I would not have =
introduced update_identity_mapping() if we were not concerned that the mapp=
ing start 0.
>=20
> So I don't think the commit message would read the same.

Somehow reading your commit message, the link between the first 2 paragraph=
 and the helpers introduced is not quite clear.

The NULL pointer problem is a consequence of the usage of an identity mappi=
ng and maybe this explanation should be more in documentation or in a code =
comment around this functionality.

>=20
>>> +/*
>>> + * The identity mapping may start at physical address 0. So don't want
>>> + * to keep it mapped longer than necessary.
>>> + *
>>> + * When this is called, we are still using the boot_pgtable.
>>> + *
>>> + * XXX: Handle Arm32 properly.
>>> + */
>>> +static void prepare_identity_mapping(void)
>>> +{
>>> +    paddr_t id_addr =3D virt_to_maddr(_start);
>>> +    lpae_t pte;
>>> +    DECLARE_OFFSETS(id_offsets, id_addr);
>>> +
>>> +    printk("id_addr 0x%lx\n", id_addr);
>> Debug print that should be removed.
>=20
> Will do. Note the "early-RFC" in the comment. I am not looking for a deta=
iled review (I didn't spend too much time cleaning up) but a feedback on th=
e approach.

I did read the code and it is easy to forget to remove those, so I just poi=
nted it :-)

>=20
>>> +#ifdef CONFIG_ARM_64
>>> +    if ( id_offsets[0] !=3D 0 )
>>> +        panic("Cannot handled ID mapping above 512GB\n");
>> The error message here might not be really helpful for the user.
>> How about saying that Xen cannot be loaded in memory with
>> a physical address above 512GB ?
>=20
> Sure.
>=20
>>> +#endif
>>> +
>>> +    /* Link first ID table */
>>> +    pte =3D pte_of_xenaddr((vaddr_t)xen_first_id);
>>> +    pte.pt.table =3D 1;
>>> +    pte.pt.xn =3D 0;
>>> +
>>> +    write_pte(&boot_pgtable[id_offsets[0]], pte);
>>> +
>>> +    /* Link second ID table */
>>> +    pte =3D pte_of_xenaddr((vaddr_t)xen_second_id);
>>> +    pte.pt.table =3D 1;
>>> +    pte.pt.xn =3D 0;
>>> +
>>> +    write_pte(&xen_first_id[id_offsets[1]], pte);
>>> +
>>> +    /* Link third ID table */
>>> +    pte =3D pte_of_xenaddr((vaddr_t)xen_third_id);
>>> +    pte.pt.table =3D 1;
>>> +    pte.pt.xn =3D 0;
>>> +
>>> +    write_pte(&xen_second_id[id_offsets[2]], pte);
>>> +
>>> +    /* The mapping in the third table will be created at a later stage=
 */
>>> +
>>> +    /*
>>> +     * Link the identity mapping in the runtime Xen page tables. No ne=
ed to
>>> +     * use write_pte here as they are not live yet.
>>> +     */
>>> +    xen_pgtable[id_offsets[0]] =3D boot_pgtable[id_offsets[0]];
>>> +}
>>> +
>>> +void update_identity_mapping(bool enable)
>> You probably want an __init attribute here.
> I expect this helper to be necessary after boot (e.g. CPU bring-up, suspe=
nd/resume). So I decided to keep it without _init.

Ok

>=20
>>> +{
>>> +    paddr_t id_addr =3D virt_to_maddr(_start);
>>> +    int rc;
>>> +
>>> +    if ( enable )
>>> +        rc =3D map_pages_to_xen(id_addr, maddr_to_mfn(id_addr), 1,
>>> +                              PAGE_HYPERVISOR_RX);
>>> +    else
>>> +        rc =3D destroy_xen_mappings(id_addr, id_addr + PAGE_SIZE);
>>> +
>>> +    BUG_ON(rc);
>>> +}
>>> +
>>> /*
>>>  * After boot, Xen page-tables should not contain mapping that are both
>>>  * Writable and eXecutables.
>>> @@ -609,6 +679,9 @@ void __init setup_pagetables(unsigned long boot_phy=
s_offset)
>>>=20
>>>     phys_offset =3D boot_phys_offset;
>>>=20
>>> +    /* XXX: Find a better place to call it */
>> Why do you think this place is not right ?
> Because the use in setup_pagetables() will soon disappear (my plan it to =
completely remove setup_pagetables) and this will used in other subsystem (=
CPU bring-up, suspend/resume).

Ok

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


