Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590E1757843
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565067.882932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhCh-00088Y-04; Tue, 18 Jul 2023 09:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565067.882932; Tue, 18 Jul 2023 09:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhCg-00086s-SN; Tue, 18 Jul 2023 09:41:10 +0000
Received: by outflank-mailman (input) for mailman id 565067;
 Tue, 18 Jul 2023 09:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLhCf-00086m-4r
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:41:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7d00::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36dc2fe0-254f-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 11:41:05 +0200 (CEST)
Received: from AS8PR04CA0108.eurprd04.prod.outlook.com (2603:10a6:20b:31e::23)
 by DU2PR08MB10278.eurprd08.prod.outlook.com (2603:10a6:10:46e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:41:01 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::d) by AS8PR04CA0108.outlook.office365.com
 (2603:10a6:20b:31e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 09:41:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 09:41:01 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Tue, 18 Jul 2023 09:41:00 +0000
Received: from d981e9ea6945.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57A75E16-5699-4DD9-88C8-A4A01964C508.1; 
 Tue, 18 Jul 2023 09:40:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d981e9ea6945.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 09:40:54 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by DBAPR08MB5799.eurprd08.prod.outlook.com (2603:10a6:10:1b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 09:40:50 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:40:49 +0000
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
X-Inumbo-ID: 36dc2fe0-254f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDTHrnnzxsjF2Hi2xpDRiUukTviJjYC1+sFjJkHuKRE=;
 b=WN5ZNNFuMjb4v22A8ZDR3fXHInAox/Qa39DjpgRobKGaT+oCbigoY63xq82EA7MD2pXm9bbYykuXBEc2ZbeEDqIQeUvhCc7SEras8KOSDvmhOHDrcX+L4Dj9NQdH6c4bFHd7FdVDKKwfJ8gPVBMltijs+S0kS1iwZ1b7dPYE8Io=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4bfd6b6de167d627
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8F+IChycBnYiB277Tl9P7cpDx1fHfOQQTQHFDf+Ih38r1E5SQcePd8gnAr4M68z1lyb+4lnQVP4ZiToaA1VUB6OM1Ziwy97fPtXpLytHAYFgPZNygbmE+fawu41w3C+/pKMFSJy+wsFIZ/XzsOBxKuWwlEOTW6jskRrlPCcHmxPpkTS0k1aSJeJiKuBs8jK4wu0o2oRPdV8XU7zfysCY8HuRxDRufmjo7DJ4UbBryXYUCOopfqHcx0X7oSHHjYWH7l+7QFBfajOmyTI+I8SgeXdepqOZzc9wOJ7NbM6CCfa42konzfLaM+0coDSvHyDPvzJVsTBj8GBhyacdWI+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDTHrnnzxsjF2Hi2xpDRiUukTviJjYC1+sFjJkHuKRE=;
 b=UAa5XwJGgRIn+oFgZc5WHXum2d5S5abIHhqc17TOp87R3kCYpGO4wIOckR8mTLljMIhfVBonY5mn8LumzzIiCKcIOzdKQMMwwFXR91apljtngKWf+95grRWltaKiWy1FhJiCo4lsWZutRkQ5bZFSq3CJ4u6w5WTm9ux9QDqabrjt7WlD0ZOX7IEeRafgdw2ME9300nUyUfIcE8vuAYtsJ8V5YNz9OlpZxEWCDGCeLB0d2iI2nSZwMzCspE1a4q4WhfT7iuhHnFiTuts6OcCelVo6etccVqxmZSlJs5O4OcEqUvxvHmutDylVfwyFJE/l2DapmUHGxzslqVy2EZz/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDTHrnnzxsjF2Hi2xpDRiUukTviJjYC1+sFjJkHuKRE=;
 b=WN5ZNNFuMjb4v22A8ZDR3fXHInAox/Qa39DjpgRobKGaT+oCbigoY63xq82EA7MD2pXm9bbYykuXBEc2ZbeEDqIQeUvhCc7SEras8KOSDvmhOHDrcX+L4Dj9NQdH6c4bFHd7FdVDKKwfJ8gPVBMltijs+S0kS1iwZ1b7dPYE8Io=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v10 10/24] xen/arm: ffa: add direct request support
Thread-Topic: [XEN PATCH v10 10/24] xen/arm: ffa: add direct request support
Thread-Index: AQHZuH9YxaQWTIKBm0KO8pMFE2i5Wa+/RtOA
Date: Tue, 18 Jul 2023 09:40:49 +0000
Message-ID: <BA9E08C6-6379-4B21-A254-E68C8E71917A@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-11-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-11-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|DBAPR08MB5799:EE_|AM7EUR03FT028:EE_|DU2PR08MB10278:EE_
X-MS-Office365-Filtering-Correlation-Id: d6249f28-f608-45bb-9a6c-08db877318f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G4n9SFMGmlmFn5CdQ3FjrdLczIFiNjOgx16pLBAZ/eFHbjuUIVVzM/jZ6zL841OzuvltUQ2MQsjEjw3D2hgIjNNuLnpfvWq9pgJ8E59QyjaWD0rGZdaAxA7ZTO6ZVTzjAsVP90fflajNy0gn06oHDZazkqS5LNXjEywxjbAtE8zXgih3sn+velMQAaDBgZ9p4j8xMB3egaFNg9VrP0Jd5SlgIm8P/WHcwXkp7GRwIhLy655cxS2GZIFhbS7xw3X3PT7tOxdmaMexrqc+XDOm8bAjW5nCH7oRWh6ZkDsNWhOBuVPo9IBu3cC/bbDMRRZ7VsW5NJt7+cgPrTZ24XUQlGOcR7CSMGbtjeHjLlvh5J3BibzbzO3+aRZX1jx3YyJsWZdeSK1JajTWXSev2KZ8IfbXk9KuWLhWJZw/TkPLsEA/Xun7G2CFz2UPDqbSNGYg87W5SiZ2lXxylTcQN+1reUwgm90vmrsebDhzzBw30VFRolMixfWpLjKskeh0RF6aHVKFyD8C0I50FmcOiw364Ygw/rjKZVm+vXZmSTpDmIGEH/C0UDyROEG6BL8fGJ5N0U+74KrzMlAMxy8EGjJUBY5+C3llcxU84TndQtWN8t59P8Fu8uJC8x4eEGQ25lajaSPP0yqbTdWPQAJFJiv7bA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(64756008)(66446008)(66476007)(54906003)(86362001)(186003)(66946007)(76116006)(6916009)(4326008)(91956017)(478600001)(41300700001)(316002)(6512007)(6486002)(71200400001)(38100700002)(8676002)(8936002)(38070700005)(5660300002)(6506007)(83380400001)(36756003)(2616005)(2906002)(122000001)(53546011)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6FA0ED457BE30343BFE0DB2CDC3D221A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5799
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	30188c16-7ac1-44f7-4bf4-08db877311d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/NCIUy/RwQKh/dnAei6ByLZ3VFNrTTXffOHIYh4C3X9BpYVHQ7LwH6cqAEXdR4ywdrnMrAIT3lW7/Iw/lLauy8CTUSFQDAddB1ajSuRWhyUcbG1a0yntUmKF74MqTOfuUHqjajQeU9I+Qw7mDzIEwIn8JKv0ONsfgVnf15oXhNxG2MQMXpQGSeF49DCmATZWKS1Kr8AFD802DtzyqNQ2Y9R4YzN++kVwhRRJnzUdBdDlX5uZRNiYbBVQvVT5NLrrS0iu1ypZ6AqOhGvDteFNVhRIpByfvyF/qYIl94J/ZDEIxuGZ3r8zxQ7h1Wzoyq45eAkgWfj15yqtwJ+SAEY269AAtCrvHMcsaf5a84LByDimA82c8dJ7JWLDlcTvSw++fkir5tWhQ0un9s9CgKLzRBmAEJg5yrNutVaCjoSJhjYxDmVR37DuR/pbithEAN0y88fJX+CRhtG6bqsV+DjL8wMBAPzZ701xPA9sll9qGhbuKFPH/3gIFH3bW+Zux97ct70XXXDFH9jsuqx+/LpXpfvVOTnngNrciu58vAFV76FD6f1ix4/f/p4ph+HDFiOol7au0L+1NVETYxVWoBZKdFqjPfK/AsQHSSlGwQXrFqQmXayLnyCOS+zlqZZAD6hqbF6sr9PRUK3B+SNemoBCUD7jKjN5f5rpalPNwircxm3oLc1K1J4uxfRrWIN17kWkO8HjjVOHhJA+o7q8FIOLNfj+nm0njHONtaHVBivisfCbvQdkLEfR6YuvR9PtwKsh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(6486002)(54906003)(478600001)(82740400003)(36860700001)(83380400001)(47076005)(2616005)(33656002)(40460700003)(86362001)(40480700001)(70586007)(2906002)(186003)(6506007)(336012)(53546011)(6512007)(26005)(356005)(81166007)(70206006)(6862004)(41300700001)(4326008)(316002)(36756003)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:41:01.1751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6249f28-f608-45bb-9a6c-08db877318f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10278

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support for sending a FF-A direct request. Checks that the SP also
> supports handling a 32-bit direct request. 64-bit direct requests are
> not used by the mediator itself so there is not need to check for that.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> ---
> xen/arch/arm/tee/ffa.c | 113 +++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 113 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index e157ed20ad8b..e05d58cf7755 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
>     return true;
> }
>=20
> +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
> +{
> +    switch ( resp->a0 )
> +    {
> +    case FFA_ERROR:
> +        if ( resp->a2 )
> +            return resp->a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +        return FFA_RET_OK;
> +    default:
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a=
2,
> +                               register_t a3, register_t a4)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D fid,
> +        .a1 =3D a1,
> +        .a2 =3D a2,
> +        .a3 =3D a3,
> +        .a4 =3D a4,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    return get_ffa_ret_code(&resp);
> +}
> +
> +static int32_t ffa_features(uint32_t id)
> +{
> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> +}
> +
> +static bool check_mandatory_feature(uint32_t id)
> +{
> +    int32_t ret =3D ffa_features(id);
> +
> +    if ( ret )
> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: error =
%d\n",
> +               id, ret);
> +
> +    return !ret;
> +}
> +
> static uint16_t get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> @@ -222,6 +272,57 @@ static void handle_version(struct cpu_user_regs *reg=
s)
>     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> }
>=20
> +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint3=
2_t fid)
> +{
> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> +    struct arm_smccc_1_2_regs resp =3D { };
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst;
> +    uint64_t mask;
> +
> +    if ( smccc_is_conv_64(fid) )
> +        mask =3D GENMASK_ULL(63, 0);
> +    else
> +        mask =3D GENMASK_ULL(31, 0);
> +
> +    src_dst =3D get_user_reg(regs, 1);
> +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
> +    {
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    arg.a1 =3D src_dst;
> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    switch ( resp.a0 )
> +    {
> +    case FFA_ERROR:
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +    case FFA_MSG_SEND_DIRECT_RESP_32:
> +    case FFA_MSG_SEND_DIRECT_RESP_64:
> +        break;
> +    default:
> +        /* Bad fid, report back. */
> +        memset(&arg, 0, sizeof(arg));
> +        arg.a0 =3D FFA_ERROR;
> +        arg.a1 =3D src_dst;
> +        arg.a2 =3D FFA_RET_ABORTED;

Those instructions setting arg have no consequence as arg is not used
after. This is probably a left over from the previous loop.

You can either send this back using arm_smcc but I would rather return
a proper error back to the caller by setting properly resp regs.

What do you think ?

Regards
Bertrand


> +    }
> +
> +out:
> +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & ma=
sk,
> +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & m=
ask);
> +}
> +
> static bool ffa_handle_call(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D get_user_reg(regs, 0);
> @@ -239,6 +340,10 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>     case FFA_ID_GET:
>         set_regs_success(regs, get_vm_id(d), 0);
>         return true;
> +    case FFA_MSG_SEND_DIRECT_REQ_32:
> +    case FFA_MSG_SEND_DIRECT_REQ_64:
> +        handle_msg_send_direct_req(regs, fid);
> +        return true;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -331,6 +436,14 @@ static bool ffa_probe(void)
>     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>            major_vers, minor_vers);
>=20
> +    /*
> +     * At the moment domains must support the same features used by Xen.
> +     * TODO: Rework the code to allow domain to use a subset of the
> +     * features supported.
> +     */
> +    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> +        return false;
> +
>     ffa_version =3D vers;
>=20
>     return true;
> --=20
> 2.34.1
>=20


