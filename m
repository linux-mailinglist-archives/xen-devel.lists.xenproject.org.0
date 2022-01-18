Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D67F492141
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 09:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258394.444908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9juv-0005hU-7s; Tue, 18 Jan 2022 08:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258394.444908; Tue, 18 Jan 2022 08:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9juv-0005fX-4d; Tue, 18 Jan 2022 08:32:37 +0000
Received: by outflank-mailman (input) for mailman id 258394;
 Tue, 18 Jan 2022 08:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2vFr=SC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1n9jut-0005fQ-MX
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 08:32:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7d00::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d80cda9-7839-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 09:32:32 +0100 (CET)
Received: from DB8PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:10:110::13)
 by VE1PR08MB5165.eurprd08.prod.outlook.com (2603:10a6:803:10b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Tue, 18 Jan
 2022 08:32:28 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::ac) by DB8PR04CA0003.outlook.office365.com
 (2603:10a6:10:110::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 08:32:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 08:32:27 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Tue, 18 Jan 2022 08:32:27 +0000
Received: from 7c2de0889281.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8340A0BA-2D47-4844-A21C-2B7C0E9C8D28.1; 
 Tue, 18 Jan 2022 08:32:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c2de0889281.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jan 2022 08:32:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 08:32:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4888.013; Tue, 18 Jan 2022
 08:32:19 +0000
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
X-Inumbo-ID: 2d80cda9-7839-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zui3mzrWowvP2UVkbklwW9uySkuwdYf62gqZKhMTkWU=;
 b=PSAdQ8Sk/cJ9HnxZcr46xC8RItylQ1DgvNMKjW61eZQo82FySL22ZLn/LL5MeouVvat4AIdvh1IwLwf5CI91lBL/qfsA7IbcMFkI2uL5tyfzbA9zk3Xs/pQfCpZ1Ps43zel/IKGiRyyQYcKn7+KxNuK6zJ6i5PevtXtv3fDXrhM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8c5bc42530f3efc0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMTZ6wS+3k4y32fbYIDx00ycp4cMpaa2npJca28TahnS8ZLeRmvlXB17Z5K1e5J0ZhjcKT3wO0VfJli0g34EIEibMY5M8Bg4B+XwdY5Cx5dqZOkP4Pjx/mVPvHpK/UrgrQBK1y6L4xiVwg4TVXxlNJ/dntHpYI718TJTpjChaR6xnSXp/fZP5pc7o4YgNm3qxK9yWbHQK8HRZtaymfIMXrbzaIETX1edbBkY+iRePAQsgHzHsgZtF/VPNX7a1brVvYpnSVihCe2T/C1MONcINx5tZ81XL3v6deyVXE2W2KDm/WkTTu73MTfBSvpTNoz6q3lc3PWmmpHeppSnnXli/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zui3mzrWowvP2UVkbklwW9uySkuwdYf62gqZKhMTkWU=;
 b=U4HUGQBc3Hs1LeFMe9YYMPltigb/h9rWzL/D4H+a0GidDqUlGyHoV/LFEQNXFFM+iwcXl1wlFGmgcsGUB3j775baKxN/mZXgI2MesyB8OkWKuj0reBY5DJRDmkwDiD+AXsR1F2ZXqQNqOoiGZe5gbvFKGKrg9sF66VE4DYfnNzHEnAS3fnQfRcRmzMLMnG408ZRRAD+uNcv87vUDwGzryknXEW/tNdJW3DXOH/C9nLCTNi396QshSCvFDXmeOhF2O3IR7MQnWGa2joXVq1TDoBzeHLixLEvyXwTlmqt+fN73QPrG9H74AOZA6xDXgTHLEaNPnJVczogWgd52D9Uufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zui3mzrWowvP2UVkbklwW9uySkuwdYf62gqZKhMTkWU=;
 b=PSAdQ8Sk/cJ9HnxZcr46xC8RItylQ1DgvNMKjW61eZQo82FySL22ZLn/LL5MeouVvat4AIdvh1IwLwf5CI91lBL/qfsA7IbcMFkI2uL5tyfzbA9zk3Xs/pQfCpZ1Ps43zel/IKGiRyyQYcKn7+KxNuK6zJ6i5PevtXtv3fDXrhM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Dongjiu Geng <gengdongjiu1@gmail.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Topic: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
Thread-Index: AQHYC20k2h7y374id02KJynAohV9hqxnQp6AgAEyVgA=
Date: Tue, 18 Jan 2022 08:32:19 +0000
Message-ID: <C744D1DD-9AF1-4CBA-96F1-1338A44F7C53@arm.com>
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
 <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org>
In-Reply-To: <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ee3b017a-d0c7-43bc-82ae-08d9da5d0f7b
x-ms-traffictypediagnostic:
	VI1PR0802MB2288:EE_|DB5EUR03FT058:EE_|VE1PR08MB5165:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB51657CC49272A466D90F734E9D589@VE1PR08MB5165.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mZF7K1Jjjpx60uuvZW4zcZIlDHJfmuNBz+x2sTnSOmkkGV4W7nfm5VYmmaN+VBlNoSkttslJtMwSc7aHEI7+EuuaGdkVNIuIZIrEFRHMcWnXg3jR0QvvmE+qb04oNJU9AgwamU+KrPOC44iJ9RbfxqJnqlHAdA1EBt3rvQXOFT7kVnr4I0uBl6MoyuV85X7w0CL15LdFPdwFWfQ4BYXC1QteGVz7JcJaavO0l0s4qgD6Z35VAWeStuRXVXedqfw+/N3oDH+kZM+1QWrDOasULlzL+rbC6HQro0xYThcW4or6U/EYZha9Yd3kN7m5iyoLi5xu2OkZzbga+ZmPiaAk6e9J77CJC+XLDirmVhEJSSGe+vUSkBNNvAbFkfy0O+i/p4SrWAdYDy7yBmEnRHsO6rLd4eQP76W8JT1556nVxWKqeunttQS+ZZvGgEUuWoyvFZ7BXrYTdGzalctSUmCxe1G3hUkW6b45Yl8qOqjApyrkXADJwO78YIW+I3bjiopZncen3+rXqiJ2gqsNBU5dQay6Ez5+t54xCV4wjxbAcZ3TTXug7g1IMYkzThJfVNl07co/38CIMl6MqN2GKgFiXQMZLNrYHI0HSQoBcOLY9PVxUAD8hY8L2Q2cZHCEH5LNlFWQdEv9vi5YEd8owsk2xPUcNoNA+h6Wg3X/9yv9rD9uyAcm7tPRRxaJPBpYwQcSviO649148wB3tA71qFaXbjboYsn4EFqJkCoeb2d8UMDsKIkxPcoRjrzOMD67ye9U
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(38070700005)(2616005)(5660300002)(66946007)(71200400001)(64756008)(66476007)(54906003)(8936002)(8676002)(6486002)(66556008)(76116006)(4326008)(66446008)(508600001)(6506007)(186003)(91956017)(33656002)(6916009)(38100700002)(122000001)(53546011)(316002)(26005)(86362001)(2906002)(83380400001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <56950A15704955458C3BAEC55B540D57@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9e48c4e-9912-4cfa-7244-08d9da5d0a89
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vrl7ppOiR0dCcqM3NpV9q/W/0lBL5F7EJxyHivisFav7mAJBYFJwFi6B3UNPDEhBpb6Bw8cIrAG3BpkWg1g8mqDwkRNM82aagzi5n52NAdHfuIaLq003CSOIXt8jPxrOUuM8BWpMayUlKQAZa2cOBsBX87Df385zFC3g2GPpXiU6Hu0y57wm7yJWgIcZAN/Pts1mxsAB7vnkVkQu3pZucdmqrNR4ur8UNWlypq7dBMc7t2C34NMOAf3V97+Wp86eUZjxtaBPZHvklRfLz9g9vELkpMC0WesPw15yuG7sRVX/Lqwly1nS+O0vZvZRpZF+rAP5TW93qw6gHVnUPd5accREjYnA4SDgBtRoiQlq7KQnyq20fUg1/cagIsrA2iP1ShEPBIYaty4zwMOTRI15GtODjMu19MhPuVQJzrUFrBFjC3CB5fvjQVoPJs1nJfXTR28zB4CEXtieAE6O2Q+YEm0vzwRFbmnmH1stVCLqLAlR9NG0w8rN5aYKS9t+F+WnNuJwB5RYH64K3ACzVaANLx7nFU44sYsgLcq3XirufnnJs12DFWDyhz9W3NVGeCSzZwbwp/WkFdFSkhaSrqatF0K1x8WnwM6kQS/fuxbs+RiXnijuFYZwkeX1kUWNLZaGYgjJxWbPHNQWjdAXCLE4X3HiQxu41QvtEMWET0YapFLZWGyH56tI4lVNaFUJUi6Q1rthJY6rLjkfRDBK100yBw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(186003)(82310400004)(356005)(36860700001)(5660300002)(26005)(336012)(6862004)(2906002)(4326008)(83380400001)(70206006)(70586007)(81166007)(33656002)(86362001)(36756003)(8676002)(6512007)(8936002)(6506007)(53546011)(2616005)(54906003)(6486002)(316002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 08:32:27.6045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3b017a-d0c7-43bc-82ae-08d9da5d0f7b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5165

Hi,

> On 17 Jan 2022, at 14:15, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 17/01/2022 10:40, Dongjiu Geng wrote:
>> It turns out that QEMU has been supporting GICv2 virtualization since
>> v3.1.0. So remove the dependencies on GICv3.
>=20
>=20
> Technically, the current form of CONFIG_QEMU allows the same binary to bo=
ot on QEMU with GICv2 or GICv3.
>=20
>> If we want to use GICv3,
>> we can select the QEMU_LEGACY configuration.
>=20
> AFAIK, GICv3 is not a legacy feature... So it feels a bit odd to name it =
like that (see more below).
>=20
>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
>> ---
>>  xen/arch/arm/platforms/Kconfig | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kco=
nfig
>> index c93a6b2756..41e82a42ee 100644
>> --- a/xen/arch/arm/platforms/Kconfig
>> +++ b/xen/arch/arm/platforms/Kconfig
>> @@ -13,7 +13,15 @@ config ALL_PLAT
>>  	automatically select any of the related drivers.
>>    config QEMU
>> -	bool "QEMU aarch virt machine support"
>> +	bool "QEMU aarch virt machine support >=3D v3.1.0"
>=20
> This is a bit misleading. A user may select this thinking that this will =
select GICv3. However, this will not.
>=20
> This also raises the question of what is the default GIC version in QEMU =
(i.e. if you don't pass anything on the command line)? If this is GICv3, th=
en I am afraid that this patch would be a no-go for me.
>=20
> Looking at overall discussion, you seem to push the patch only to allow b=
uilding a tiny Xen for QEMU and the new vGIC.
>=20
> The default Xen (i.e. make defconfig) will also work on QEMU. Given that =
the new vGIC is a still in development, I am seriously considering to say t=
hat if you want to try it then you have to use the default configuration.
>=20
> @Dongjiu, is there any reason why you want to use the tiny QEMU config ra=
ther than the default configuration?
>=20
> @Bertrand, @Stefano, what do you think?

I do think that the new Legacy option is very misleading and users will ten=
d to select Qemu instead of the legacy one where having GICv3 makes more se=
nse.
Using the new VGIC which is unsupported is not a standard use case so maybe=
 it would make more sense to create a specific Qemu entry for GICv2 using n=
ew VGIC instead and keep the default as is.
To sum up I am no in favour of a solution changing the existing QEMU. A sol=
ution creating a new one for the wanted use case would be better for me.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


