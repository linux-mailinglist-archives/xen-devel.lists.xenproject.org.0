Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA12DE0E7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 11:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56452.98852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqCux-0004ep-UL; Fri, 18 Dec 2020 10:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56452.98852; Fri, 18 Dec 2020 10:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqCux-0004eQ-Qz; Fri, 18 Dec 2020 10:23:23 +0000
Received: by outflank-mailman (input) for mailman id 56452;
 Fri, 18 Dec 2020 10:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z90k=FW=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kqCux-0004eF-0G
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 10:23:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.73]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8dcfc25e-5a8d-400e-a8ff-590bd6ab85c7;
 Fri, 18 Dec 2020 10:23:22 +0000 (UTC)
Received: from MR2P264CA0171.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::10) by
 DB8PR08MB3977.eurprd08.prod.outlook.com (2603:10a6:10:ad::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.13; Fri, 18 Dec 2020 10:23:19 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:0:cafe::26) by MR2P264CA0171.outlook.office365.com
 (2603:10a6:501::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18 via Frontend
 Transport; Fri, 18 Dec 2020 10:23:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Fri, 18 Dec 2020 10:23:18 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Fri, 18 Dec 2020 10:23:18 +0000
Received: from 40cd507de730.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F0D5ABC-7D4A-456F-8E92-C7500751A286.1; 
 Fri, 18 Dec 2020 10:23:12 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40cd507de730.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Dec 2020 10:23:12 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2695.eurprd08.prod.outlook.com (2603:10a6:6:19::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Fri, 18 Dec
 2020 10:23:11 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 10:23:11 +0000
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
X-Inumbo-ID: 8dcfc25e-5a8d-400e-a8ff-590bd6ab85c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULsjm2pC5sW6JaNnxQ+RHklJd8Myk/6dIbweNZw0Lro=;
 b=naOLVEkK/Sdy6TrXWHIA6EMi91QOaUSL7H8gXbmh3AZIF2MuWgiwK+xchWpzwyThlh0dCy7a7O04QaZUF/xGvd/o5Tb9BvI1ipqn8jILJBzTd99gr46GYOS7+g5MT2Cqi4REGCqab/nNj5m/Nd5kyn488E/7K6GBHl9jLT+ixWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 26ca2215cdbffb87
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMgMQt67atPQ52K+N/QyqNDlTQrWKikU0GPVyx8ttQ6LRUeva0LVLQNI+HnH39jqezqCzzcVmGMqTBAwVOEq5Vk+iziNG+6VSh1o4HhC24ixHQhbN4tAEmagivnkO29KAvvh3A3/AX44jPHGlzR3nC/d+pbaqYY+ZSxh69t59zpTOkJXJFSeaTc/haAfXpiSDPkjQ6BaIPrMgBnUborJ34HrjtiBU7pXOIE+cHu9Dp0La+qwyxrbVk3861gZWvaMqU/XRYsRLUd2w357zLO+ijYLvMVOUdLh5A2Zvs2vHAMLYbisi89gLY5unxcT2Sbqn49LTeLctIQmfk5X7sst+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULsjm2pC5sW6JaNnxQ+RHklJd8Myk/6dIbweNZw0Lro=;
 b=jkyi0VgeUFn9IBz8eJW8QAqmT4rbWvYeX2g6FXhryA9rV9HAYgTjHJMKOD672RZDe1693zR1Cdo/ShBgfhaOvzt/WyWm5dLKyUTxMUZeyWLebb84jIXG1B78EJYJtOV+aO+lCiZOmMbTjV0OR0tzpXFibEbhRW/bQWqA6JUpq8lPdZaEJuyAKRa3h/b4r2P5PZd13aNmE2cqVc2bM34PtZ7w6BRJhlOY9m1ipTFCklHFFx635ZhipmdfjUx4mCUk+scH3NP5gx7QwWggpumMyZrNKphuIGyJ8FpLyW3b17fMZHe8X9B7DYx03CVYeBaWjbkmWnUtCpZKXpdP+9TYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULsjm2pC5sW6JaNnxQ+RHklJd8Myk/6dIbweNZw0Lro=;
 b=naOLVEkK/Sdy6TrXWHIA6EMi91QOaUSL7H8gXbmh3AZIF2MuWgiwK+xchWpzwyThlh0dCy7a7O04QaZUF/xGvd/o5Tb9BvI1ipqn8jILJBzTd99gr46GYOS7+g5MT2Cqi4REGCqab/nNj5m/Nd5kyn488E/7K6GBHl9jLT+ixWY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/8] xen/arm: Use READ_SYSREG instead of 32/64 versions
Thread-Topic: [PATCH v4 1/8] xen/arm: Use READ_SYSREG instead of 32/64
 versions
Thread-Index: AQHW1ItQykO1RG0fj0mzlL7TviPUeqn77F6AgAC6HAA=
Date: Fri, 18 Dec 2020 10:23:11 +0000
Message-ID: <51ACD417-8CC1-448B-81F3-BDBE7EDC4C61@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
 <75ab5c84ed6ce1d004316ca4677735aa0543ecdc.1608214355.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2012171505430.4040@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012171505430.4040@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8f650228-e225-4cef-2d3b-08d8a33ef03f
x-ms-traffictypediagnostic: DB6PR08MB2695:|DB8PR08MB3977:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB3977AA00E6F151FFDB785E4F9DC30@DB8PR08MB3977.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7Ed+zsPErzNNw1Uxj448OfrzYBtN1cr8nQ7Bi6eBvM0d/fntCqGkkP7udPjGbta+6iBhqy0RDUoIa9EgnfEZdwZ5UBFxtOwYKeRwbcRtAgoyLe6efFfxm4mHuBFDPvfvSZx6O83o20dpXR1xjY/N+uHr3Qf2Mv5sU9Pm9hXCbaRd3VpFiLkn3E2MHCoJfk68gqIfSqFZ937G3jtMH/Lb94ol5KFKtKM0MLUHKnyuPlXjfWLuDjrQYuOLfs5W5eUqRoYtCg1xm6IyTyGwmioJfWPRb/ZP9vRtIm3q64kp+wceccBGNczQEpBQBe0a7pf1o0wcfT5AYLsvMohLZd/mbeS8eU2dn4p1rWjjXXdlH/MS1Nf5TmlJ9UglZWyAIYov
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(2616005)(316002)(2906002)(33656002)(86362001)(83380400001)(66556008)(71200400001)(26005)(4326008)(66476007)(5660300002)(6512007)(64756008)(76116006)(6916009)(6486002)(66946007)(8936002)(478600001)(53546011)(6506007)(66446008)(54906003)(8676002)(186003)(91956017)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?ciDoslV63/MwVxyiNRHiJ+yg6OKDutvu77dh1LG9EXOvMC6HjT78BB9SsOoL?=
 =?us-ascii?Q?pQUbjyQVPYsg6WimDUSvz7ERoTywVQyV8Wm4FtgQ9Cd/v3b0roj5Oco0QY5Z?=
 =?us-ascii?Q?ATkBVRtTeXD/nMwFV1O+wdobygf0Cvw8MpOC0owaZtepiFvQmqoJO51T0Z51?=
 =?us-ascii?Q?+Mw8vpKWnx2TnknQ3PL/EhmHOBuR6V3yBowRCRvZZr8stv+zzR0e9Hn4f1nI?=
 =?us-ascii?Q?GL07odgb4w/gN1Y1gY3S5BRivZ2vT2tQJPuTj9mNoUruHUQLwPnuOHTzuP0O?=
 =?us-ascii?Q?ipELMzYmxEi154jvEyeiUo1WpwNCibMOS1kVS2xw668ps1JXkXSwuxdkHWYA?=
 =?us-ascii?Q?QIOo0cXQhCuTddH1laZ7Z0kw9VutaykbNbWUmSNwxm8oJ3/nCHZdPW330CA5?=
 =?us-ascii?Q?aCyKy2hqpyrRtYMYV1PnOXFpQHbD/Dr1tnqzV0eRbPGeh33F2Ya2ZnC61GrE?=
 =?us-ascii?Q?IobJLufM8kVx6+TXZyH8fGfekIJLDKjiyS4mI2ZWCVcV1CEu1tQvmdJ9uyeK?=
 =?us-ascii?Q?EgraABT/DTzWWPJEEgDMhi9clwblbcVVDvcJlHnBCZ2UxxVC8h5KesmAGWF9?=
 =?us-ascii?Q?lA6GwFHeCNkqx+hJaTzSZffOuek7WDeGu4dAZ9sVx2gGVc7/5fxGchiu/cRI?=
 =?us-ascii?Q?HYtnGHZ4iAlm7AbhAZPvj0Jf3j6S5JVhuaBgj6wimCuLzeBhzvx3ErOxczwq?=
 =?us-ascii?Q?sknlL6MZQW21TNR820OpDOv0wVv4p3t0pK1TdjOaV3Ckf9DsTKgAmand08bN?=
 =?us-ascii?Q?7kCIN2DLY6vjWgMBFI/KGjieVfe9QBnvk+s+t08d6VRIuNFxtb7To+Np1lom?=
 =?us-ascii?Q?TZK1UfqVTkA9v7goGHiopmKquh0y5b2nnkYFJFo4kM9Z6tddd1up+viCnP0L?=
 =?us-ascii?Q?gC3Gaj6jy/XLwHrvwBZyqh/5s3AchGtTEs+9PGaZatW1o7GyjtPDa5nR+Div?=
 =?us-ascii?Q?LkAiCh244o4G/M0DY6CitDi8KwpgnjGauIOAF1PzyYtNwLcskIyLHP8h9uBW?=
 =?us-ascii?Q?G0tw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9066B0001F91447AF1B98671D87EDBF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2695
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63e667e0-b856-4aba-3b80-08d8a33eebd8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nEtV2pcVugbW6UKSBIsxe0nwGubkS9Jr7v+bfoX/bKC6L7gnMagyJO8GLGhmqlJX9TPlG1AKcSinOGv2+LXWXcqRa8CK9LTO/X4UJKM+NmMcEhEiDiT+4KL77gVqbejAx/hX9PsEaC1+fgAuNolpj4agO2djtGoyKEjNBhAxxRzz2/KMoCXU7JOrbRKA5bNnzqJb0s4CmInQVx7McYfBRvXTlE1P5atevbdUSUX5xHs6lVbgsBL6rFwGJ0djCrF00RJ7O7PyO6MME7+LMv83HprawTIDFqw55xKsrU60IlBqC8mvp8+oGblGP4+4NHcZpYnjX+SGEHwVxURyb087pA3h2rf+Lm0wIKemWKJlVB2QUOKydUcLQJJhIb75GoeBeYXWUy5swttVGLmTEHWqZg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(136003)(46966005)(70206006)(356005)(8936002)(2906002)(6512007)(54906003)(316002)(107886003)(336012)(5660300002)(6862004)(36756003)(186003)(86362001)(2616005)(53546011)(6506007)(47076004)(70586007)(8676002)(26005)(33656002)(81166007)(83380400001)(82310400003)(478600001)(4326008)(82740400003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 10:23:18.5564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f650228-e225-4cef-2d3b-08d8a33ef03f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3977

Hi Stefano,

> On 17 Dec 2020, at 23:17, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 17 Dec 2020, Bertrand Marquis wrote:
>> Modify identify_cpu function to use READ_SYSREG instead of READ_SYSREG32
>> or READ_SYSREG64.
>> The aarch32 versions of the registers are 64bit on an aarch64 processor
>> so it was wrong to access them as 32bit registers.
>=20
> This sentence is a bit confusing because, as an example, MIDR_EL1 is
> also an aarch64 register, not only an aarch32 register. Maybe we should
> clarify.

You are right the sentence is not very clear.

Maybe the following would be better:

All aarch32 specific registers (for example ID_PFR0_EL1) are 64bit when
accessed from aarch64 with upper bits read as 0, so it is right to access t=
hem
as 64bit registers on a 64bit platform.

>=20
> Aside from that:
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20

Thanks

Cheers
Bertrand

>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>=20
>> ---
>> Change in V4:
>>  This patch was introduced in v4.
>>=20
>> ---
>> xen/arch/arm/cpufeature.c | 50 +++++++++++++++++++--------------------
>> 1 file changed, 25 insertions(+), 25 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 44126dbf07..115e1b164d 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -99,44 +99,44 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_cap=
abilities *caps)
>>=20
>> void identify_cpu(struct cpuinfo_arm *c)
>> {
>> -        c->midr.bits =3D READ_SYSREG32(MIDR_EL1);
>> +        c->midr.bits =3D READ_SYSREG(MIDR_EL1);
>>         c->mpidr.bits =3D READ_SYSREG(MPIDR_EL1);
>>=20
>> #ifdef CONFIG_ARM_64
>> -        c->pfr64.bits[0] =3D READ_SYSREG64(ID_AA64PFR0_EL1);
>> -        c->pfr64.bits[1] =3D READ_SYSREG64(ID_AA64PFR1_EL1);
>> +        c->pfr64.bits[0] =3D READ_SYSREG(ID_AA64PFR0_EL1);
>> +        c->pfr64.bits[1] =3D READ_SYSREG(ID_AA64PFR1_EL1);
>>=20
>> -        c->dbg64.bits[0] =3D READ_SYSREG64(ID_AA64DFR0_EL1);
>> -        c->dbg64.bits[1] =3D READ_SYSREG64(ID_AA64DFR1_EL1);
>> +        c->dbg64.bits[0] =3D READ_SYSREG(ID_AA64DFR0_EL1);
>> +        c->dbg64.bits[1] =3D READ_SYSREG(ID_AA64DFR1_EL1);
>>=20
>> -        c->aux64.bits[0] =3D READ_SYSREG64(ID_AA64AFR0_EL1);
>> -        c->aux64.bits[1] =3D READ_SYSREG64(ID_AA64AFR1_EL1);
>> +        c->aux64.bits[0] =3D READ_SYSREG(ID_AA64AFR0_EL1);
>> +        c->aux64.bits[1] =3D READ_SYSREG(ID_AA64AFR1_EL1);
>>=20
>> -        c->mm64.bits[0]  =3D READ_SYSREG64(ID_AA64MMFR0_EL1);
>> -        c->mm64.bits[1]  =3D READ_SYSREG64(ID_AA64MMFR1_EL1);
>> +        c->mm64.bits[0]  =3D READ_SYSREG(ID_AA64MMFR0_EL1);
>> +        c->mm64.bits[1]  =3D READ_SYSREG(ID_AA64MMFR1_EL1);
>>=20
>> -        c->isa64.bits[0] =3D READ_SYSREG64(ID_AA64ISAR0_EL1);
>> -        c->isa64.bits[1] =3D READ_SYSREG64(ID_AA64ISAR1_EL1);
>> +        c->isa64.bits[0] =3D READ_SYSREG(ID_AA64ISAR0_EL1);
>> +        c->isa64.bits[1] =3D READ_SYSREG(ID_AA64ISAR1_EL1);
>> #endif
>>=20
>> -        c->pfr32.bits[0] =3D READ_SYSREG32(ID_PFR0_EL1);
>> -        c->pfr32.bits[1] =3D READ_SYSREG32(ID_PFR1_EL1);
>> +        c->pfr32.bits[0] =3D READ_SYSREG(ID_PFR0_EL1);
>> +        c->pfr32.bits[1] =3D READ_SYSREG(ID_PFR1_EL1);
>>=20
>> -        c->dbg32.bits[0] =3D READ_SYSREG32(ID_DFR0_EL1);
>> +        c->dbg32.bits[0] =3D READ_SYSREG(ID_DFR0_EL1);
>>=20
>> -        c->aux32.bits[0] =3D READ_SYSREG32(ID_AFR0_EL1);
>> +        c->aux32.bits[0] =3D READ_SYSREG(ID_AFR0_EL1);
>>=20
>> -        c->mm32.bits[0]  =3D READ_SYSREG32(ID_MMFR0_EL1);
>> -        c->mm32.bits[1]  =3D READ_SYSREG32(ID_MMFR1_EL1);
>> -        c->mm32.bits[2]  =3D READ_SYSREG32(ID_MMFR2_EL1);
>> -        c->mm32.bits[3]  =3D READ_SYSREG32(ID_MMFR3_EL1);
>> +        c->mm32.bits[0]  =3D READ_SYSREG(ID_MMFR0_EL1);
>> +        c->mm32.bits[1]  =3D READ_SYSREG(ID_MMFR1_EL1);
>> +        c->mm32.bits[2]  =3D READ_SYSREG(ID_MMFR2_EL1);
>> +        c->mm32.bits[3]  =3D READ_SYSREG(ID_MMFR3_EL1);
>>=20
>> -        c->isa32.bits[0] =3D READ_SYSREG32(ID_ISAR0_EL1);
>> -        c->isa32.bits[1] =3D READ_SYSREG32(ID_ISAR1_EL1);
>> -        c->isa32.bits[2] =3D READ_SYSREG32(ID_ISAR2_EL1);
>> -        c->isa32.bits[3] =3D READ_SYSREG32(ID_ISAR3_EL1);
>> -        c->isa32.bits[4] =3D READ_SYSREG32(ID_ISAR4_EL1);
>> -        c->isa32.bits[5] =3D READ_SYSREG32(ID_ISAR5_EL1);
>> +        c->isa32.bits[0] =3D READ_SYSREG(ID_ISAR0_EL1);
>> +        c->isa32.bits[1] =3D READ_SYSREG(ID_ISAR1_EL1);
>> +        c->isa32.bits[2] =3D READ_SYSREG(ID_ISAR2_EL1);
>> +        c->isa32.bits[3] =3D READ_SYSREG(ID_ISAR3_EL1);
>> +        c->isa32.bits[4] =3D READ_SYSREG(ID_ISAR4_EL1);
>> +        c->isa32.bits[5] =3D READ_SYSREG(ID_ISAR5_EL1);
>> }
>>=20
>> /*
>> --=20
>> 2.17.1
>>=20


