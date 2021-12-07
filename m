Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F246B6A4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 10:06:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240755.417463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWQH-0007gm-Qu; Tue, 07 Dec 2021 09:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240755.417463; Tue, 07 Dec 2021 09:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWQH-0007eC-Nf; Tue, 07 Dec 2021 09:06:05 +0000
Received: by outflank-mailman (input) for mailman id 240755;
 Tue, 07 Dec 2021 09:06:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCv=QY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1muWQG-0007e1-8l
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 09:06:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e679b9d3-573c-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 10:06:03 +0100 (CET)
Received: from AS9PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:20b:46c::7)
 by AM7PR08MB5429.eurprd08.prod.outlook.com (2603:10a6:20b:107::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Tue, 7 Dec
 2021 09:05:55 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::71) by AS9PR07CA0006.outlook.office365.com
 (2603:10a6:20b:46c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.10 via Frontend
 Transport; Tue, 7 Dec 2021 09:05:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 09:05:55 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Tue, 07 Dec 2021 09:05:54 +0000
Received: from 40c1921baeb0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C40CF705-44DC-4F8E-9927-B4323BF2E7CE.1; 
 Tue, 07 Dec 2021 09:05:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40c1921baeb0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Dec 2021 09:05:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6488.eurprd08.prod.outlook.com (2603:10a6:20b:33b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 7 Dec
 2021 09:05:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 09:05:36 +0000
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
X-Inumbo-ID: e679b9d3-573c-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEVkiamDVoDRwfudyT0jX18QfFxCRyHFQ/tZDB0terA=;
 b=GKctq2/n5J4ecHq9pEB2Apg6Z893HWHOv1uluuWoiB1SIIkhtB8ocqZQxuhYSpPcW9xH8WQXV38NPVeAKyKbKm5uTqV2HbiHeRxDBxx+cCX30A+n1G+AabOUrjww+3T3O/xg9sH+wjd2V3PAFk5MRVGdiDvoRC99mMkexj4F+ew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4bee03f595b99f2c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cON0Cetcx0Mq+9Tmm13DCPnrPubDZDiLoALRku2pnEdq50ExgM/oZp7s1rdC/fGMt32rEQqpmUD2c/bZxqQxwSq/Ko/d8/nJbfcA4wl7kCIoo54v7l6NVJIJM7+bc1gypqqnvdODwHv+D7VbiK6soHf0cdOCfJs6+azB05DgTtdH9evYjaHrkKyIAy+c0ZX3qbN8VI9dGPYMRPh4W4C6b8MYbGbljKbHppcPnSmElF8etPiAHEqBGnUSQkPwcIzk4Feub0HB+6p2Unvq8YVebkiGf/WkZa9SKmNgTRo8Th6poIiMVP8KX5aUFdYFg8tmw+a59tF2GJ0Edrh2658ZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEVkiamDVoDRwfudyT0jX18QfFxCRyHFQ/tZDB0terA=;
 b=Xko1+Ba5GKrS8im3WvfPdC+tQG6OElKWZ/sREbQqtR7GeTi1tOYMdslRaVuP41qE8XKxmB+e5I8Oxho5/mtmqr0gMA36+4UspfgqRa/GQq43h6IGpu8Wod8LuhNk18ym3mWuqtimo/+Fpra4SAqfr5jXa2EWjlSxlJrYxoLW4Bxz2P8cj47kzw1zI3Xoz1ABV20Y2IkJzBjQ93G52vCeWgRbRXViy+evTp3QhjswF+xh44qTTVPEuzc2cGH0VWU8SwcRmjjIJI93dNiM5yqoGwLtZSnNwtPcWJmYhgzVzMF2uAZHpLnlAUy5ckY2B3dcZvFHvI5fecJgEVC81PhUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEVkiamDVoDRwfudyT0jX18QfFxCRyHFQ/tZDB0terA=;
 b=GKctq2/n5J4ecHq9pEB2Apg6Z893HWHOv1uluuWoiB1SIIkhtB8ocqZQxuhYSpPcW9xH8WQXV38NPVeAKyKbKm5uTqV2HbiHeRxDBxx+cCX30A+n1G+AabOUrjww+3T3O/xg9sH+wjd2V3PAFk5MRVGdiDvoRC99mMkexj4F+ew=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Thread-Topic: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
Thread-Index: AQHX6qyDTBkoC5USbUmFbZl4CKl6k6wllqcAgAEfZ4CAAAfKAA==
Date: Tue, 7 Dec 2021 09:05:36 +0000
Message-ID: <286D9F99-A264-4BED-89FD-8562A1B96133@arm.com>
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
In-Reply-To: <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1dd77c67-7408-4be1-1d71-08d9b960c6be
x-ms-traffictypediagnostic: AS8PR08MB6488:|VE1EUR03FT017:EE_|AM7PR08MB5429:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB54293B63FC97C244A0C1E9039D6E9@AM7PR08MB5429.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jPv/9OzLIUV/dTE/LFKO4/81d42l2cpcsubH0gSSG05JUD9XvhTSQpZUIZ94XaiBdwYtnfpgOIHdaYq7RbfgHJU/aSfmnTEZYdEOKXd1m8/DYYivqSrBjn9w2TJi0y8zDpC2T+RTWyN8BHmrEPwkGW7ULj+kfwmtXGo6UIGJf3whXDY0Gbmk2klZzfel1/UdEfDBMIbVhioEe5AyS64Rbd6YUpgMNBqm3PiPNT+ryQQaumGvsuRUxqytS98gkIIKrFQVtsqLXjAYy111sGQPBQ/HP97xuRZdidWUXSIgGw4oglJnypR0llJLnqWOrlLFdACaErKenWFq99f4i+PGmZw/UiI/oqgJGEKlJLloEFw+61ikpLQwofSwpyTVI+W4Oaq2ARpOOzBEVWZJdECQgerqD7WTUIvCU8cfb+7iKdA+NDwOGgjedLSLOwnjv3nbdr+iymH9zTDhsaUJEuorDQWzCcjkAUw9wTV8JdtFobTpf2jR/we+cCorJYknXw5RdQtSeOR3yG2CFP/YTl33gn8u3StebL+BvrAYfx7oGCoxZ7m4tZl1E41tGm9wgMCCPFe5vvpSQzT42HQdn8XcVP39vY3cKe5SMJBniSzNDJ03PIE9RUHalc69iy79kqqaa2jPz/pvbZPU0edIF8urX/hS/rilMSPWCrBePJxigPH4ayR1oVo9vBJpHG4e4cA+geLeYV8hrlYMdiE37V5ctVEeznMvMTJE9Y0GkDa/PtGqsmkx2hD4RYyR+aBWGw5S
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(6506007)(66556008)(71200400001)(66476007)(508600001)(5660300002)(83380400001)(2906002)(53546011)(8936002)(6486002)(8676002)(4326008)(64756008)(316002)(36756003)(54906003)(6512007)(91956017)(122000001)(66946007)(6636002)(86362001)(66446008)(186003)(38070700005)(6862004)(76116006)(2616005)(33656002)(37006003)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AC44F8092712194E9D60263E249C2B00@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6488
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4903412e-e72e-4495-9830-08d9b960bbdf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TFgueXYnG/sRXXnO33KvKI1egRELmAIJWDQNdzA2F9UL1QM1yEG7j5y/PUk3fW/b5eVUfSTTXPD+PkLX+nqHjtBuvJVJoWZUWwd4k/UPV5S76MUVa1w/IVClJQoQ79fXU7WGl+HrHr4xxm9Tbc2Qnr6C8T7W6h8EZQfCEqPmCXrl/3UqbnRePFcaEqoKkwllPeKe0qnHOhkGPn24T8Q3d9o8igAvFlQ1G30pnyCmtwwMjQpIpo1LKk9/Ks1xaUkSlhimaYJYAdVFDEQdhfbDxaUVOPo/Thde5MAxqhzVPgO7bRXTbplrokq3TftK8mxgG2hm/iPp9U7RbDvMPIlmzawWcQALh9cAlVU4T51yuX9rjdiEgntsKjG83FbPeC23j66tFmR0gH+4AEW+hhUcp8p85IpV1YkVMzZfbWywBW8qN51GJhspiEc1eoXNS0EIHvomDalFtygTqTt6kFi7TNNv3nKbTUnnsZkw6J/IGqC9YxwvJAw/aNgBph1xjxR+nmF3snBm5rxbZiAWCEvDbRk8rEvXpB7c+cqpH0t35zDMflCf6njcldzTNijkmHOZwJt4BTA4kZrG2QbfUNRpMb7j7J9xxN2NligCqy7eI5OA0cJNcdxziCcu7urWYd1QcLgtH27V83V6e13zKrcAOLcE/d0bB98Bw6ZjzX2gwEMR1O9n4pKDRaojuBJWAAbYrulLDrRJVw/lC+hoaQV1RA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400004)(53546011)(6506007)(47076005)(26005)(186003)(83380400001)(70206006)(508600001)(6512007)(2906002)(6486002)(107886003)(316002)(37006003)(54906003)(6862004)(70586007)(4326008)(81166007)(336012)(356005)(5660300002)(33656002)(8936002)(8676002)(2616005)(86362001)(6636002)(36860700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 09:05:55.0889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd77c67-7408-4be1-1d71-08d9b960c6be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5429

Hi Michal,

> On 7 Dec 2021, at 08:37, Michal Orzel <michal.orzel@arm.com> wrote:
>=20
> Hi Julien,
>=20
> On 06.12.2021 16:29, Julien Grall wrote:
>> Hi,
>>=20
>> On 06/12/2021 14:20, Michal Orzel wrote:
>>> to hypervisor when switching to AArch32 state.
>>>=20
> I will change to "from AArch32 state".
>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>> "If the general-purpose register was accessible from AArch32 state the
>>> upper 32 bits either become zero, or hold the value that the same
>>> architectural register held before any AArch32 execution.
>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>=20
>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>=20
> Ok.
>>>=20
>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>> needs to be fixed.
>>=20
>> Can you outline why this is a problem and why we need to protect? IIRC, =
the main concern is Xen may misinterpret what the guest requested but we ar=
e not concerned about Xen using wrong value.
>>=20
> I would say:
> "
> The reason why this is a problem is that there are places in Xen where we=
 assume that top 32bits are zero for AArch32 guests.
> If they are not, this can lead to misinterpretation of Xen regarding what=
 the guest requested.
> For example hypercalls returning an error encoded in a signed long like d=
o_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
> if the command passed as the first argument was clobbered,
> "
>>>=20
>>> Fix this bug by zeroing the upper 32 bits of these registers on an
>>> entry to hypervisor when switching to AArch32 state.
>>>=20
>>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>>> when not passed.
>>=20
>> Which error do you see otherwise? Is it a compilation error?
>>=20
> Yes, this is a compilation error. The errors appear at each line when "en=
try" is called without passing value for "compat".
> So basically in all the places where entry is called with hyp=3D1.
> When taking the current patch and removing default value for compat you w=
ill get:
> ```
> entry.S:254: Error: ".endif" without ".if"
> entry.S:258: Error: symbol `.if' is already defined
> entry.S:258: Error: ".endif" without ".if"
> entry.S:262: Error: symbol `.if' is already defined
> entry.S:262: Error: ".endif" without ".if"
> entry.S:266: Error: symbol `.if' is already defined
> entry.S:266: Error: ".endif" without ".if"
> entry.S:278: Error: symbol `.if' is already defined
> entry.S:278: Error: ".endif" without ".if"
> entry.S:292: Error: symbol `.if' is already defined
> entry.S:292: Error: ".endif" without ".if"
> entry.S:317: Error: symbol `.if' is already defined
> entry.S:317: Error: ".endif" without ".if"
> ```
>=20
>>>=20
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>> ---
>>>   xen/arch/arm/arm64/entry.S | 10 +++++++++-
>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
>>> index fc3811ad0a..d364128175 100644
>>> --- a/xen/arch/arm/arm64/entry.S
>>> +++ b/xen/arch/arm/arm64/entry.S
>>> @@ -109,8 +109,16 @@
>>>    * If 0, we rely on the on x0/x1 to have been saved at the correct
>>>    * position on the stack before.
>>>    */
>>> -        .macro  entry, hyp, compat, save_x0_x1=3D1
>>> +        .macro  entry, hyp, compat=3D0, save_x0_x1=3D1
>>>           sub     sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP,=
 LR */
>>> +
>>> +        /* Zero the upper 32 bits of the registers when switching to A=
Arch32 */
>>> +        .if \compat =3D=3D 1      /* AArch32 mode */
>>> +        .irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,2=
1,22,23,24,25,26,27,28,29
>>> +        mov w\nr, w\nr
>>> +        .endr
>>> +        .endif
>>=20
>> So Jan mentioned, the x0/x1 may have already been saved. So you may need=
 to fetch them from the stack and then clobber the top 32-bit.
>>=20
> So I would do the following:
> -fetch x0/x1 from the stack
> -clobber them
> -store them again on the stack
>=20
> /*
> * Zero the upper 32 bits of the gp registers when switching
> * from AArch32.
> */
> .if \compat =3D=3D 1      /* AArch32 mode */
>=20
> /* x0/x1 have already been saved so fetch them to zero top 32 bits */
> .if \save_x0_x1 =3D=3D 0
> ldp     x0, x1, [sp], #(UREGS_kernel_sizeof - UREGS_X0)
> .endif
>=20
> .irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,=
25,26,27,28,29
> mov w\nr, w\nr
> .endr
>=20
> .if \save_x0_x1 =3D=3D 0
> stp     x0, x1, [sp, #-(UREGS_kernel_sizeof - UREGS_X0)]
> .endif
>=20
> .endif

This solution looks ok. X0 and x1 when they are used is as scratch register=
 for x1 or using w0 for x0 so it is ok to clean them here and not earlier.

Cheers
Bertrand

>=20
>> Cheers,
>>=20
>=20
> Cheers,
> Michal


