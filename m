Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC54E6059
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 09:32:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294221.500162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXIsW-00071X-3j; Thu, 24 Mar 2022 08:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294221.500162; Thu, 24 Mar 2022 08:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXIsV-0006yT-Vy; Thu, 24 Mar 2022 08:31:31 +0000
Received: by outflank-mailman (input) for mailman id 294221;
 Thu, 24 Mar 2022 08:31:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eW/x=UD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXIsU-0006yN-Cy
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 08:31:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cce49a76-ab4c-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 09:31:29 +0100 (CET)
Received: from DB6PR0601CA0045.eurprd06.prod.outlook.com (2603:10a6:4:17::31)
 by VI1PR08MB4032.eurprd08.prod.outlook.com (2603:10a6:803:e2::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Thu, 24 Mar
 2022 08:31:25 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::54) by DB6PR0601CA0045.outlook.office365.com
 (2603:10a6:4:17::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Thu, 24 Mar 2022 08:31:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Thu, 24 Mar 2022 08:31:24 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Thu, 24 Mar 2022 08:31:24 +0000
Received: from b52bb298c80b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9667C638-A092-46D2-BD56-8D883BF18CF4.1; 
 Thu, 24 Mar 2022 08:31:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b52bb298c80b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Mar 2022 08:31:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0801MB1797.eurprd08.prod.outlook.com (2603:10a6:4:32::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Thu, 24 Mar
 2022 08:31:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 08:31:15 +0000
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
X-Inumbo-ID: cce49a76-ab4c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL8+C0DxIO2X9JEoO0P5jNQzjHBJ9Ntm6OSL0/ylPX4=;
 b=m1UlI5lnE7069DG4MmD0dXl5vtvhQcDUz4V7sPbNM9B51XxB2MfhlRMM3xzviirj3zkYNj2j/1JmPq58NQBoI/O3jKH/3qEn0Kr9XQos47KaXRocSFmEPobGp86AhXlLR8ZoM3E+3cMxq6IalfFMOEtILRp+HFOcT3OilkZU/5M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4280ec46f4a042a5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD+KkdG1gtXvwNlEYOR2Fng02VYkGCU1FUUaLh/SypMyvPK35vIfXJK/0thhnKYYqprEzKFBVcrV17nSiq6oocKBAagc3jxWwWDFzYVqccvhmIlOGDj9a6QVgIPeNLvnhPkrWWCZ0Ry+80wiJHM59pUGuhrdbegTqpYVVBwzc+ROmRmf6whJWdrkrCD5DmxodK8z3iSXbQGzrP+9xwZyfZwSe7jVAhoV1UWk0tFHLG/HsQRVITbJDD1kc33ihPQNXT5mLapZNQaA3HSb9A7fU2Pz5ma2P1KIH1TgrJBakZ6Fgt6YzL5PWmUXSAoFh9ZNfQj/PWcm5FdPi2nPpeeqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL8+C0DxIO2X9JEoO0P5jNQzjHBJ9Ntm6OSL0/ylPX4=;
 b=BC9kU7VtdoshVftVG4fpV7eDSDJNrR7sr6L6uzQnhWG5m1NK8HOd/UVJKegKaTjsM8DTdpKlKDIUPEmqCkcFVe7WX/qZtO+T2yfNIG2EtSkwhm6Bfu2HKyXh6/vjdMI15CSF2K6DFD6COBr1D8LOjxdd2EWdNgbchwQu3gso1EX19gNoZPC8utDypOUa1lwGm5Oa33WDI8CzpqmQF0G6zr/xCAJDSufGP//M8TSO4tcREtqfZOy9fPOl3BqOiFgdhntfMlDeenSVkbklzGkskbzWW/wNyVt8jyU3HYMOeFp8eO11McFBH31kZMuvta0892hVWuP0Wn/aStSyuPp1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL8+C0DxIO2X9JEoO0P5jNQzjHBJ9Ntm6OSL0/ylPX4=;
 b=m1UlI5lnE7069DG4MmD0dXl5vtvhQcDUz4V7sPbNM9B51XxB2MfhlRMM3xzviirj3zkYNj2j/1JmPq58NQBoI/O3jKH/3qEn0Kr9XQos47KaXRocSFmEPobGp86AhXlLR8ZoM3E+3cMxq6IalfFMOEtILRp+HFOcT3OilkZU/5M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Topic: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32 guests
Thread-Index: AQHYPittA0qvCk1VqUeT+Og+1zrr1azMqmOAgAEgdgCAAGvcAA==
Date: Thu, 24 Mar 2022 08:31:14 +0000
Message-ID: <484F678F-0918-407E-B8FE-55022CF22D7D@arm.com>
References: <20220322202825.418232-1-sstabellini@kernel.org>
 <E2220831-D72C-423C-A33F-453C8E851B8D@arm.com>
 <alpine.DEB.2.22.394.2203231844240.2910984@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2203231844240.2910984@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 47f02e93-0441-491c-71c3-08da0d70aeda
x-ms-traffictypediagnostic:
	DB6PR0801MB1797:EE_|DB5EUR03FT003:EE_|VI1PR08MB4032:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4032E1A11F50FACADDD9AB239D199@VI1PR08MB4032.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8YsKWBknlGQ7PCCtT5oVQEBbsSyqVICvjBgNiFzE8bFFD9aUWpD440zublaAXA/iTxL/oVeTcqDsPFnPRg90VdUpRRAzdbGwIsHpBj8tg4oxkrVzaZJLIMtWDjvrHFEqIX+cWjKG+ca7dqyrYUWuh4eMpoUPhv+qPp+eeBn5h+GWn/y+Vj06QtWkFNtEw64BpScvOdXAkWyVZG3DQHNUFOG4Z3Za/BgP7ivcjhnQAZKdlynTqspdkjC1QUK1vpzNamIUhTk0RwEasI2+1Pgz9Z0sjGx3L1WSNM6w6GCdTBK6brRPUOhti16/dct22E34rjPY0ad9A5Rt/uF6FKUp9iv1ctWXx9TGKJpCJyI/kfuvRGBi1bw1Xi9KHYhGoitY1SkDKAswGCijlyYI9rhCtmA3akAkX5l+gGqXYw7ERJ3eiWz298LDSYEigG/6TvQjhVPVSS1PUYubpLY7mSaoJza6WMAl8uunIDIpYtmdh2Z3UeerdyYasX7opwvj2uQSZ96vk0eNBJjhQrHzc1bfqB4FMkTAwKum3iSZG5p+c8IGLE4ZaeffrTWSKZyVKYwo3wKuxtxrH1hEojfqi8Iwcz67zggoZ4pHHxK6vuKr+9b5kUJ3t7/1vsFA2ICuBo+jxmBUwo4S2X0fwCNykv+ijgMenX2foFQsk0CPciok/zMW/9icpx50qsjj8YumyBDTlFSw1mvRF8MKJuynNCHLCH9HpXn/diIm58r7ls0qS8PHOci16UC/Yz6NYqddenm1L6o7eMMkTR9KQi5R2NOjguSbl+BSq3kQHN154TMZE21Jqu3JKIj2OMf4xfPf+kyX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(508600001)(6512007)(316002)(2616005)(83380400001)(6916009)(54906003)(71200400001)(966005)(53546011)(6506007)(26005)(186003)(6486002)(91956017)(4326008)(2906002)(8936002)(5660300002)(38070700005)(66476007)(66556008)(33656002)(86362001)(76116006)(38100700002)(66446008)(64756008)(8676002)(66946007)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ECD3B46ECA1FD845AFAD316E4ADE0CE9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1797
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	644d8d23-3afd-44c1-c3d1-08da0d70a959
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tNv5cd6Kzf6UqFRYAcNwNFHBzyACPBB/vlrKLE0s+/jCtxSI+ldDMl0eXZ3g5sbELwu+m3b+5GArcAUI4TzSWhiYb3O8s/aBBnB67QSf2BEZDhKDLnMdRgk9iGubkgm40DLSVdRNXjYFYY0wUQBKXFYEvSkVeaOmA5sABUyZShcLkrCvNTYnvqZKPrU2LWhwq7rJ0WC51YWr5KIofE8eWSPGxFZjpb2V2oOOBDt5cIpy73tMToOQPVACwE8qivrzR/M9Xwa79QTDU8mERoMX/mm2PIeHmpQV69NmQT5Of+v3CsjmqV+wQj89AfHnumdrABEg6TCTuIogyZkAvBvKV/M9v/R9BuPqjrt3nQOZnR3BzZVlELyWuamxehUdjcWErAB+PJVIWr5KQO5x5QyFwIu19219pPoiBEItcf8vcHp8IRssan6Ad5F2b1jnGJoFTtHgrCZPyoE4YawJlxsj2PB6CJPKt9qmieWd10ogSu2vXpv+tzp/FRtPK81j6H73m7+CflyQlxwK3w7yJLA8ZenbeJpnQVJnpMGFtXGJ6/2K3o0Yb8GwyvvCzV11XE5IWpNod29ilxYbzCcMZ2FyfmpK6K1FV+ip6iVcKHYRCXdv2qfg+ka9SKPNUoJCTz1d0mI8/SHOZaGTX42gNILHxrb1aaaINRNtm+Vb/9RY5FZ8Yk29aOjf4RvozArWuOG3/kj+1CtVBD78qFS0oS0zn8+NN1WHmUXMUkNYgDW0cQsFeqCDmTBjqZ3bZoLpSx9ELTdNdo5RdIdpP/SWtIb+Gw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(81166007)(36756003)(36860700001)(2906002)(47076005)(82310400004)(356005)(508600001)(6486002)(966005)(54906003)(4326008)(316002)(70206006)(8676002)(70586007)(336012)(83380400001)(8936002)(6862004)(107886003)(6512007)(26005)(40460700003)(5660300002)(186003)(6506007)(53546011)(2616005)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 08:31:24.7396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f02e93-0441-491c-71c3-08da0d70aeda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4032

Hi Stefano,

Thanks a lot for the detailed answers.

> On 24 Mar 2022, at 03:05, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 23 Mar 2022, Bertrand Marquis wrote:
>>> On 22 Mar 2022, at 21:28, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>=20
>>> The first 32 bytes of zImage are NOPs. When CONFIG_EFI is enabled in th=
e
>>> kernel, certain versions of Linux will use an UNPREDICATABLE NOP
>>> encoding, sometimes resulting in an unbootable kernel. Whether the
>>> resulting kernel is bootable or not depends on the processor. See commi=
t
>>> a92882a4d270 in the Linux kernel for all the details.
>>>=20
>>> All kernel releases starting from Linux 4.9 without commit a92882a4d270
>>> are affected.
>>=20
>> Can you confirm if those kernels are also affected when started natively=
 ?
>=20
> Theoretically yes, but in practice only booting on Xen is affected
> because:
>=20
> - the issue cannot happen when booting from u-boot because u-boot sets
>  the "Z" bit
> - the issue cannot happen when booting with QEMU -kernel because it also
>  sets "Z"
> - older bootloaders on native skip the first 32 bytes of the start
>  address, which also masks this problem
>=20
> Thus, in practice, I have no idea how one could reproduce the problem on
> native.
>=20
> This info is in the commit message a92882a4d270 on Linux and in-code
> comments in the kernel.

If uboot is setting we can consider that we have a behaviour equivalent to
a native boot.
Could you add something in the comment in your patch to state that the Z
flag is also set by uboot ?
This will help in the future to remember why it is ok to have that as the
current comment could make one think that this is something only done by
Xen.

>=20
>=20
>>> Fortunately there is a simple workaround: setting the "Z" bit in CPSR
>>> make it so those invalid NOP instructions are never executed. That is
>>> because the instruction is conditional (not equal). So, on QEMU at
>>> least, the instruction will end up to be ignored and not generate an
>>> exception. Setting the "Z" bit makes those kernel versions bootable
>>> again and it is harmless in the other cases.
>>=20
>> I agree with Jan here. This will never be set or should not be expected
>> to be set by anyone when started.
>> It feels to me that we are introducing an ack for a temporary issue in
>> Linux which will makes us derive from the behaviour that could be
>> expected on native hardware.
>>=20
>> Could you give more details on how blocking this is ?=20
>=20
> Without this change, none of the Debian arm32 kernels boot on Xen after
> Jessie (on QEMU).

Ok

>=20
>=20
>> Is the kernel update with the fix available on any of the affected distr=
ibutions ?
>=20
> None that I could find. I tried Debian Buster, Debian Bullseye, Debian
> testing and the latest Alpine Linux. Happy to try more if you give me a
> download link or two.

I think the list is long enough to justify the change.

>=20
>=20
>> Depending on the answers I think we could for example have a config arou=
nd
>> this to flag it as workaround for a specific guest issue so that this is=
 only
>> activated when needed.
>=20
> Also note that this alternative workaround also solves the problem,
> however it has other drawbacks as Julien described:
> [1] https://marc.info/?l=3Dxen-devel&m=3D164774063802402

Definitely setting the Z bit is better I think.

>=20
>=20
> My take on this is the following. PSR_GUEST32_INIT is not part of the
> ABI so this cannot be considered an ABI change.
>=20
> But in any case, given that without this change (or another change [1])
> most of the kernels out there don't work, is there a point in discussing
> ABI breakages? Basically nothing works right now :-D
>=20
> I think it makes sense to think whether this change could cause a kernel
> that used to boot, not to boot anymore. However, I don't think is
> possible because:
>=20
> - we only support zImage on arm32 and "Z" works well with it
> - both u-boot and qemu -kernel set "Z" so we would already now if
>  something broke
>=20

Agree so please add that both in the comment and in the commit message.

Cheers
Bertrand

>=20
>=20
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> ---
>>> Changes in v2:
>>> - improve commit message
>>> - add in-code comment
>>> - move PSR_Z to the beginning
>>> ---
>>> xen/include/public/arch-arm.h | 8 +++++++-
>>> 1 file changed, 7 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-ar=
m.h
>>> index 94b31511dd..81cee95f14 100644
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
>>> #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
>>> #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
>>> #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
>>> +#define PSR_Z           (1<<30)       /* Zero condition flag */
>>>=20
>>> /* 32 bit modes */
>>> #define PSR_MODE_USR 0x10
>>> @@ -383,7 +384,12 @@ typedef uint64_t xen_callback_t;
>>> #define PSR_MODE_EL1t 0x04
>>> #define PSR_MODE_EL0t 0x00
>>>=20
>>> -#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_=
MODE_SVC)
>>> +/*
>>> + * We set PSR_Z to be able to boot Linux kernel versions with an inval=
id
>>> + * encoding of the first 8 NOP instructions. See commit a92882a4d270 i=
n
>>> + * Linux.
>>> + */
>>> +#define PSR_GUEST32_INIT  (PSR_Z|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MAS=
K|PSR_MODE_SVC)
>>> #define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MO=
DE_EL1h)
>>>=20
>>> #define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)
>>> --=20
>>> 2.25.1
>>>=20
>>=20


