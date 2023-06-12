Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEBD72C3BE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 14:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547100.854314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8gQj-0006Jj-7k; Mon, 12 Jun 2023 12:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547100.854314; Mon, 12 Jun 2023 12:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8gQj-0006HK-41; Mon, 12 Jun 2023 12:13:53 +0000
Received: by outflank-mailman (input) for mailman id 547100;
 Mon, 12 Jun 2023 12:13:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0UE=CA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q8gQi-0006HA-1L
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 12:13:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a7f788-091a-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 14:13:50 +0200 (CEST)
Received: from DB6PR0402CA0021.eurprd04.prod.outlook.com (2603:10a6:4:91::31)
 by AS8PR08MB9865.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 12:13:43 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::39) by DB6PR0402CA0021.outlook.office365.com
 (2603:10a6:4:91::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.32 via Frontend
 Transport; Mon, 12 Jun 2023 12:13:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21 via Frontend Transport; Mon, 12 Jun 2023 12:13:43 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Mon, 12 Jun 2023 12:13:43 +0000
Received: from 5710e0f37fb6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21470E53-6D58-477D-ACF9-4A190C747EC5.1; 
 Mon, 12 Jun 2023 12:13:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5710e0f37fb6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Jun 2023 12:13:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7418.eurprd08.prod.outlook.com (2603:10a6:102:2bb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 12 Jun
 2023 12:13:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6455.034; Mon, 12 Jun 2023
 12:13:32 +0000
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
X-Inumbo-ID: 96a7f788-091a-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rpsk8Y9Q0eievOy/GsfLaiZhzqL8MTX9O2C9JrlAnfI=;
 b=hiJMKQHfkwUzW5P4eyI+7UWwBR/W81Xn7a95/0pKI9Mp8ijQBDLjYbU6+mk+Aox4S+kmC0ZNtnR0E61fAnpf/clg7oCaFybow/6+XHjuJWNHv4lMjxA0rAKKOgQ7bW2SciCB64bYMMKlWwo1x0tVB63rdu2CRA+kPnF/GBMAtls=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18b561f2d98ae3bb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYy/xwWOq2e8SZl11mCsZus8tLGZKluiYfLF1V4MbJWVvcaGXMMNh2SWhmC2aBu2hEBdIsv8XbHUUxUbSO8FOn7IvwstE+DBYHHu+dv9XtI4Krxha/J5LqOldGf5xS9HISsjARgYwpfONDYEGNlSfExoghnBKO1Wuas7UwK27CB0PesHjHHTzD9bI3VpmVUKjHHNie+TDR6xrDv1R0weHjZtVCA0GuNjc+rJlEWAaIkCwMcH31SEBryNPEaKaE3p5HQP2weeDj/d9tdsAxTSWuxEasKk8+HzjVmZ/8xDm7Vzu7yMGSZ43nKuWdRsGazw/FCm/Xt5GpNulgRIeRgYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rpsk8Y9Q0eievOy/GsfLaiZhzqL8MTX9O2C9JrlAnfI=;
 b=a/cp8ewXr8FFPCWdxCbMivKE7bf97oSTBpx3etRf6fPiyW9i1GTDx3zKkoMP72RLYLNEts3xK40FXMhds2eferoryGfnIgJjrAUXsXNHhtLwZ/29S5UsxBtpTsADwaLoGYLczuKTmgM3TBrm7jx074O7RPbHYOseZn9ucsfJaVVGtwQ+HcdtVJ1gp6+Vph9Isx0QL9wGrFpPd1u8/w2nbm1x2XRB7yTzpqo1/trHNCdphbSaJ1I1mDKLGRLvVUSsibVKXjTLOaii80x059kvkkCpjZ+Og+Q3/EExBpPYliAkWFriiefktQASLVptmilFui1GElaca63yrX/WvVInJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rpsk8Y9Q0eievOy/GsfLaiZhzqL8MTX9O2C9JrlAnfI=;
 b=hiJMKQHfkwUzW5P4eyI+7UWwBR/W81Xn7a95/0pKI9Mp8ijQBDLjYbU6+mk+Aox4S+kmC0ZNtnR0E61fAnpf/clg7oCaFybow/6+XHjuJWNHv4lMjxA0rAKKOgQ7bW2SciCB64bYMMKlWwo1x0tVB63rdu2CRA+kPnF/GBMAtls=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: rename guest_cpuinfo in domain_cpuinfo
Thread-Topic: [PATCH] xen/arm: rename guest_cpuinfo in domain_cpuinfo
Thread-Index: AQHZmtRITNbkwbPefkCb2va33qE53K+G/lAAgAAalwA=
Date: Mon, 12 Jun 2023 12:13:32 +0000
Message-ID: <47AD0C1B-2715-4EE9-8231-694E631C8A56@arm.com>
References:
 <7e18eceb2fb2f4cac991773a8697e9bf50b89aaf.1686316358.git.bertrand.marquis@arm.com>
 <24566db9-e6da-0b2b-e7a3-5edef81d159c@xen.org>
In-Reply-To: <24566db9-e6da-0b2b-e7a3-5edef81d159c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB7418:EE_|DBAEUR03FT048:EE_|AS8PR08MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: 8adcc16e-7171-448e-59f6-08db6b3e770d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NCCTPH1CP7W4xDz16k9Bf8ndSx4MKcKlEqo+YP0lqvNjofgIbBaCgfQUM7na+OFi+DSV+lYpgZ6F8OhI8OtiT8JzFxd320y1Lwv/MwWrhMAYwL9NWHHC5lrG7kC1PxlIsyzEPoVaauCmwFkFDP4trc2yQeEv7h8BMQDAKnoV+LdwijbcaXm2try3g2Vmp2a1orFpv60hHb0q1WD9QokSJS5UB/Gh5zkpAfDmjOoDbcybPYV6lfQIARP5Ns4ydLO6GiJFqSktgPLytAQH/r2VLzR9SIdHYPYPaZqhL+SxUllkZXm+ALDIKuS9ytpex33wcCnYtT6UJ5J+rMTfmn+6dv5pxRl0sGLrGVkfufdzxAHk0qWHUkz3GaRNbSDETslkiCNGK1vM4n3PGzIesZXevAl8tJDc/ivpZmBN+p9kmHwNSxTQsin30stssEyE1sR2NuMDW6F2TSgPJm+NN6nRlo9GuUXoxQovznIdrfyDNQc/2NHuNtPQSGexqCQ5kN9PxJgT60kln3nTXwIpmPGmzDnhdo6kVVyP4UlE/9CK6HrhmBV/anLErA0B9yI+6J867cJa+Uxf4WfDrWKtPnS1e8GXixJYJJ2MSZa73NUp3z4/Wykax0kVQSmMOZFevQBItXL2fv9B4f/Bg3cdrKybXg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(83380400001)(122000001)(4326008)(33656002)(36756003)(38070700005)(41300700001)(38100700002)(316002)(6486002)(71200400001)(6506007)(6512007)(53546011)(64756008)(6916009)(66946007)(66446008)(66556008)(76116006)(91956017)(2906002)(5660300002)(86362001)(8936002)(8676002)(66476007)(478600001)(54906003)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8428E5FA5DAEC34D8D827D3AE2971C51@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7418
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e96dabdc-6b34-4e73-d83d-08db6b3e70d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l8GZhNr6E29uzIyLAoSrj0hLW+jZJNBA9k7R229PWfjc8TsO/Ij14VKuhgAvw1d9KozNzMMBZtbC7vmZjQzB3KIeb21ndpas/64XYbiSh2jHCuepIkp1jdomf3hu594evfyZLRX/hNjWV7SzgDYrrOfP1f0N3G3KuKNTdqPYM3Weum0dTrW/CmYCaBZpS7mkhe5pl3xg+IyjLZOA7Bg9EuAPnVdpY4WrVT7ffrvt6GSiIyd9dhq77yuAMNq67qBAOfwoiG2Zf3mIQT1cnzcroQeL+FQNzFFBSuVre5B1KAXyj58ekwNqqqC9L+5pTsOfQzu+DRq+llmPlE4AWnSfqNCXb3PgSuTL7+ZIvJfBBZwmfM6cHbMYCW5NvbhwZ0WawUgJOZk8Ouk54Jc2o5DzgH7Szc2R+JFkrh1AIrXiNMmiaSpEbFbW3tDobIoHE3hJf+1TayHFopok4EPxx4Z0apuP1irhSe+lblqxwbsneEa4EtZU98xNTNAAuad7SaucR8avzxZxzeWPQsKkKF9gRidm51qVN28jez8ytB6n+aAiBB/SXxC2XYzkQvxTPRnxK5dtXLBHLH4wNK9nWe8kbnuMZoZRx8wkCIQvkDYdDEMcK9aqXEowoGxdSPP2/QlDWqYyyFbLaldyuf3ITWWq9UX+uFiAKSi0SLPMoFK6KzBoZ93uTvEUAZ2RDAPLtGE5akQ2fjMeX4xc0wYzxcB3dd9AEzuUX7BWBGyVMM+h9mUWFrF/RxpQDn+LbfZJX6Bs
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(2906002)(478600001)(41300700001)(5660300002)(54906003)(316002)(8676002)(70586007)(8936002)(70206006)(6862004)(4326008)(6486002)(26005)(6506007)(40460700003)(6512007)(53546011)(2616005)(356005)(82740400003)(186003)(40480700001)(47076005)(107886003)(36860700001)(336012)(83380400001)(86362001)(82310400005)(36756003)(33656002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 12:13:43.2409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adcc16e-7171-448e-59f6-08db6b3e770d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9865

Hi Julien,

> On 12 Jun 2023, at 12:38, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 09/06/2023 14:13, Bertrand Marquis wrote:
>> Rename the guest_cpuinfo structure to domain_cpuinfo as it is not only
>> used for guests but also for dom0 so domain is a more suitable name.
>> While there also rename the create_guest_cpuinfo function to
>> create_domain_cpuinfo to be coherent.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/arm64/vsysreg.c          |  6 ++--
>>  xen/arch/arm/cpufeature.c             | 40 +++++++++++++--------------
>>  xen/arch/arm/include/asm/cpufeature.h |  2 +-
>>  xen/arch/arm/vcpreg.c                 |  2 +-
>>  4 files changed, 25 insertions(+), 25 deletions(-)
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index fe31f7b3827f..b5d54c569b33 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -76,7 +76,7 @@ TVM_REG(CONTEXTIDR_EL1)
>>      case HSR_SYSREG_##reg:                                             =
 \
>>      {                                                                  =
 \
>>          return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,  =
 \
>> -                                  1, guest_cpuinfo.field.bits[offset]);=
 \
>> +                                  1, domain_cpuinfo.field.bits[offset])=
; \
>>      }
>>    void do_sysreg(struct cpu_user_regs *regs,
>> @@ -300,7 +300,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>        case HSR_SYSREG_ID_AA64PFR0_EL1:
>>      {
>> -        register_t guest_reg_value =3D guest_cpuinfo.pfr64.bits[0];
>> +        register_t guest_reg_value =3D domain_cpuinfo.pfr64.bits[0];
>>            if ( is_sve_domain(v->domain) )
>>          {
>> @@ -336,7 +336,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>           * When the guest has the SVE feature enabled, the whole id_aa6=
4zfr0_el1
>>           * needs to be exposed.
>>           */
>> -        register_t guest_reg_value =3D guest_cpuinfo.zfr64.bits[0];
>> +        register_t guest_reg_value =3D domain_cpuinfo.zfr64.bits[0];
>>            if ( is_sve_domain(v->domain) )
>>              guest_reg_value =3D system_cpuinfo.zfr64.bits[0];
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index b53e1a977601..5f4644865505 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -14,7 +14,7 @@
>>    DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>>  -struct cpuinfo_arm __read_mostly guest_cpuinfo;
>> +struct cpuinfo_arm __read_mostly domain_cpuinfo;
>>    #ifdef CONFIG_ARM_64
>>  static bool has_sb_instruction(const struct arm_cpu_capabilities *entry=
)
>> @@ -191,45 +191,45 @@ void identify_cpu(struct cpuinfo_arm *c)
>>  /*
>>   * This function is creating a cpuinfo structure with values modified t=
o mask
>>   * all cpu features that should not be published to guest.
>=20
> I noticed you modified "guests" to "domains" below but not "guest" here. =
Is this intended?
>=20
>> - * The created structure is then used to provide ID registers values to=
 guests.
>> + * The created structure is then used to provide ID registers values to=
 domains.
>>   */
>> -static int __init create_guest_cpuinfo(void)
>> +static int __init create_domain_cpuinfo(void)
>>  {
>>      /* Use the sanitized cpuinfo as initial guest cpuinfo */
>=20
> Same question here.

Definitely should have been done, i will make a v2 and a path on "guest" wi=
thout extra s.

Cheers
Bertrand


>=20
>> -    guest_cpuinfo =3D system_cpuinfo;
>> +    domain_cpuinfo =3D system_cpuinfo;
>=20
> Cheers,
>=20
> --=20
> Julien Grall



