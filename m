Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E006E0E72
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520730.808643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwsh-0003qN-SN; Thu, 13 Apr 2023 13:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520730.808643; Thu, 13 Apr 2023 13:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwsh-0003o7-OW; Thu, 13 Apr 2023 13:20:55 +0000
Received: by outflank-mailman (input) for mailman id 520730;
 Thu, 13 Apr 2023 13:20:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73wY=AE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pmwsg-0003o1-Op
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:20:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0347dfc0-d9fe-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 15:20:52 +0200 (CEST)
Received: from DU2PR04CA0188.eurprd04.prod.outlook.com (2603:10a6:10:28d::13)
 by VI1PR08MB5343.eurprd08.prod.outlook.com (2603:10a6:803:12d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:20:49 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::6a) by DU2PR04CA0188.outlook.office365.com
 (2603:10a6:10:28d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 13:20:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Thu, 13 Apr 2023 13:20:48 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Thu, 13 Apr 2023 13:20:48 +0000
Received: from 64e2bc829647.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 404CC043-21C9-4D8E-B634-03A4DFB41E67.1; 
 Thu, 13 Apr 2023 13:20:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64e2bc829647.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 13:20:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB10210.eurprd08.prod.outlook.com (2603:10a6:102:367::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 13:20:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 13:20:36 +0000
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
X-Inumbo-ID: 0347dfc0-d9fe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkSsLVJWM0/MxcpvXmJ6fWZcYRv/ReE4568KPGnB7Lg=;
 b=BSUvBrfaXzcfVlZrwgky4C7LeceN3x7jwh3z68/hcGXhsRsFhVxgyrQaLTcmU/pt6WshuuwkkvUs8sAh/G8x40MwgJndc20dGbm6kWJP8SA8B2DsXLy6jPEIr1qJmHNrCc5VlGI3YAHsQIlmVbSJl4MUzLmByOXw9pOwkx1j2r0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 755511fa65ce1425
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jcgplabmw/+th2YDJPZJFubTQKp7mQIcKduKxKFNNawzOcIBCEdlfEKiP169wd7SM33PYP/K7F6A7fQVYaokRpGhfqKP/oGu4nDwP6bEONeTJnqn3G8YIMU2s7lCdFDIBIb5pfwcb5h36QJAU4sDAurwDXK3s43S8xkOkE1Ohz+BjtBQrHkx55jr/Dr44eEHVp9MPhtpxTAtVrRrJZbuKdwsBdyvgOOkcRRjAZbRfo4XK3WZzBb335ToLY6DAYIbq5B+88ydC9/Wal5DSStsqM4HDPkfkTDr7zutT5DWG8f4LhS63A5WgdXtuu2GL/jT+C7XXEG+i0QjGHm4rl2kdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkSsLVJWM0/MxcpvXmJ6fWZcYRv/ReE4568KPGnB7Lg=;
 b=guz8JirCqbygg1zTMKQB80umcfTLDJaUZHPYxAMGO5vQPCU4+L8+nNjzqG2F6HThAfElqqNh8yq88qo7yC95itWRpZFxIYfniVlNNgzSHv3zFU3z1wD79+Msw2z47PnEW6efiUTly54GbAFX/XAH/gFS6ZQ995/4yZ9Cq2Kp1MeGaz3EBOiGDatMnIngtG7HY2EqlV5ypTPo6djFV5VVG/wYgID3bVpKSIBPsOzVc9WDeYtlTx2zUF4fcKPZ/w/IzM/CnRPGNLfbREN5G46j1poEfl0zivxk4N/Ea/e0zJ4YNs/FHPzVg1+Kr3YwStLvDiRHrTVeRIIC9/MFBpU13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkSsLVJWM0/MxcpvXmJ6fWZcYRv/ReE4568KPGnB7Lg=;
 b=BSUvBrfaXzcfVlZrwgky4C7LeceN3x7jwh3z68/hcGXhsRsFhVxgyrQaLTcmU/pt6WshuuwkkvUs8sAh/G8x40MwgJndc20dGbm6kWJP8SA8B2DsXLy6jPEIr1qJmHNrCc5VlGI3YAHsQIlmVbSJl4MUzLmByOXw9pOwkx1j2r0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, Achin
 Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
Thread-Topic: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
Thread-Index: AQHZbdfL0AxH2Xu3t0igFa2jZHjA9K8pOEIAgAABeIA=
Date: Thu, 13 Apr 2023 13:20:36 +0000
Message-ID: <916BB708-3028-4AAB-BD6A-BCABAFBD7C45@arm.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-10-jens.wiklander@linaro.org>
 <2359695e-f8f8-cf51-27f9-5f0c776feca5@xen.org>
In-Reply-To: <2359695e-f8f8-cf51-27f9-5f0c776feca5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB10210:EE_|DBAEUR03FT010:EE_|VI1PR08MB5343:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc6ec32-3680-42b3-f96b-08db3c21e5c6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vw73FFR3gv+vpynZa1wljssxFfhiMjE/wIcoqPjOYlLlTl1P1ugdu0AzQkcfXorXeM2UVsIe9Daoe/6y1Xb1fKDver+uLoEWvRtftdeK6h/pQN/+p9d2BnGpEXExAXDEeQz90QM28LeOSUVxLgKpZMNoqfwWgPWYsIL5DtAjNdbkUPaBs1buLhpLN8GwZnasJUjylQ+FASs86AbSaZ8vFZFfhcHe4Su3FXKkSSwSI5hpHeZWAbQl+PuE2AttyknSWebVRyeK5Uv+rb3DNfC1rpgieyPdJhJiL6ifo0wzfshnE+NIdGdzpKWcy1U0Os5ParISv/7ramsILeptVk3E9C9R5WkZIEpURxf53MfE/IliS6rbWYaKNhtDNQP8NqVDJSqpwBhqOSY4c/002xc5T3rDXRHelEt4Wtz6NOtprQXYot4fHPkHBp7A+yikEYl3crcCQ9k77g31l9DLIgtEOFO2nKfdIk2xG4ylANtAQsVan9xF5k75nGg4pvAy8FaD8Vyq8IFlm+R5XM065wZYwm9HyfxdaT1K5gZAwBNsVDYNSnn5VTr/77EwDvmHObXTwr18UtBQPak75CSATrVWL31IlSdeK3Man0oQCBxCvep7nBdQw5D8rEiPESJzsrOgm1UYPyFSNtUFtRnvAzCEkg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199021)(71200400001)(33656002)(38100700002)(122000001)(5660300002)(36756003)(2906002)(316002)(38070700005)(8676002)(8936002)(86362001)(66446008)(66556008)(64756008)(41300700001)(66946007)(6916009)(66476007)(4326008)(91956017)(76116006)(2616005)(83380400001)(54906003)(6506007)(186003)(478600001)(26005)(6512007)(53546011)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FB4E54CB59B9C47AD3A69B6CDAC874F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10210
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ebe6749b-fefd-469e-2c46-08db3c21de22
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tYygeYU2C2hHpMFoFSe52WQGrdu0LQIPt5IK0lgDts7Vb0FlFdciImMCcsImldxCV7iNqI2QJBDIFEOxlAS3Zo3psITJ12T5F2Pm/19BZmQ1SEPFoh8WESInqbRQ6pgeBaqGEhJkanpFT+1ipCTXUJAtG2NLNChC1znDy7qBCA5x/VYrGh81Km3Rwi+6JaFZxvHynvLLqpV/j8dfnyS5R170ADMEXee1ro1LIrphtRWXoml5k1c9MeKwmCvttR7x7N8vVrpnmbXDUkFxMYZnzfrU20AW6uPIIMmHsFeqW/OMxfY2o4gMbwHoCSBkV7x8rqSX2xwkWks+rhchPSRMhsf4VocH1EDIR63VMkB0n2+ZALG3prISeDqP7FuK7zc1guzJxdF/9PDMYe/3Qgvie39+Y2U4UMOyNiP3X7CgKPSuCwpJ8NDWIOs11KnLtosEqvL6ksJOSPjOOkHp8PKLCTIHmcnXmTzfJnYONFXtm5ELXIbs3VcYEdsBbvcbMiL0D3s/DAHwkN+XAK1gr4rF34eWvhIAstV/nBUAmay/lN6alAH3gBK3pJUudwkmG9uPR+htoG45KpzAQVIk+JTPh84cGC9DLqY0bK6DHfdDmeTNfpnMNYNC7DLzxvXFnRu3krUlOW56exVWewCBUlp5vXQWluhIcS2H5wUkiBA54r3rln4MPrQeG/2GNJ3wBbKzP0ziXvh5GBNKJxooc827Lw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(5660300002)(41300700001)(33656002)(82740400003)(40460700003)(36756003)(2906002)(6862004)(8676002)(86362001)(40480700001)(356005)(4326008)(8936002)(70586007)(70206006)(81166007)(82310400005)(316002)(107886003)(2616005)(83380400001)(336012)(47076005)(6506007)(54906003)(6512007)(26005)(53546011)(186003)(478600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:20:48.9510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc6ec32-3680-42b3-f96b-08db3c21e5c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5343

Hi Julien,

> On 13 Apr 2023, at 15:15, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 13/04/2023 08:14, Jens Wiklander wrote:
>> Adds support for sending a FF-A direct request. Checks that the SP also
>> supports handling a 32-bit direct request. 64-bit direct requests are
>> not used by the mediator itself so there is not need to check for that.
>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>> ---
>>  xen/arch/arm/tee/ffa.c | 112 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 112 insertions(+)
>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index f129879c5b81..f2cce955d981 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
>>      return true;
>>  }
>>  +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
>> +{
>> +    switch ( resp->a0 )
>> +    {
>> +    case FFA_ERROR:
>> +        if ( resp->a2 )
>> +            return resp->a2;
>> +        else
>> +            return FFA_RET_NOT_SUPPORTED;
>> +    case FFA_SUCCESS_32:
>> +    case FFA_SUCCESS_64:
>> +        return FFA_RET_OK;
>> +    default:
>> +        return FFA_RET_NOT_SUPPORTED;
>> +    }
>> +}
>> +
>> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t =
a2,
>> +                               register_t a3, register_t a4)
>> +{
>> +    const struct arm_smccc_1_2_regs arg =3D {
>> +        .a0 =3D fid,
>> +        .a1 =3D a1,
>> +        .a2 =3D a2,
>> +        .a3 =3D a3,
>> +        .a4 =3D a4,
>> +    };
>> +    struct arm_smccc_1_2_regs resp;
>> +
>> +    arm_smccc_1_2_smc(&arg, &resp);
>> +
>> +    return get_ffa_ret_code(&resp);
>> +}
>> +
>> +static int32_t ffa_features(uint32_t id)
>> +{
>> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>> +}
>> +
>> +static bool check_mandatory_feature(uint32_t id)
>> +{
>> +    int32_t ret =3D ffa_features(id);
>> +
>> +    if (ret)
>> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: error=
 %d\n",
>> +               id, ret);
>> +
>> +    return !ret;
>> +}
>> +
>>  static uint16_t get_vm_id(const struct domain *d)
>>  {
>>      /* +1 since 0 is reserved for the hypervisor in FF-A */
>> @@ -222,6 +272,57 @@ static void handle_version(struct cpu_user_regs *re=
gs)
>>      set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
>>  }
>>  +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uin=
t32_t fid)
>> +{
>> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
>> +    struct arm_smccc_1_2_regs resp =3D { };
>> +    struct domain *d =3D current->domain;
>> +    uint32_t src_dst;
>> +    uint64_t mask;
>> +
>> +    if ( smccc_is_conv_64(fid) )
>> +        mask =3D GENMASK_ULL(63, 0);
>> +    else
>> +        mask =3D GENMASK_ULL(31, 0);
>> +
>> +    src_dst =3D get_user_reg(regs, 1);
>> +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
>> +    {
>> +        resp.a0 =3D FFA_ERROR;
>> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
>> +        goto out;
>> +    }
>> +
>> +    arg.a1 =3D src_dst;
>> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
>> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
>> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
>> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
>> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
>> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
>> +
>> +    arm_smccc_1_2_smc(&arg, &resp);
>> +    switch ( resp.a0 )
>> +    {
>> +    case FFA_ERROR:
>> +    case FFA_SUCCESS_32:
>> +    case FFA_SUCCESS_64:
>> +    case FFA_MSG_SEND_DIRECT_RESP_32:
>> +    case FFA_MSG_SEND_DIRECT_RESP_64:
>> +        break;
>> +    default:
>> +        /* Bad fid, report back. */
>> +        memset(&arg, 0, sizeof(arg));
>> +        arg.a0 =3D FFA_ERROR;
>> +        arg.a1 =3D src_dst;
>> +        arg.a2 =3D FFA_RET_ABORTED;
>> +    }
>> +
>> +out:
>> +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & m=
ask,
>> +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & =
mask);
>> +}
>> +
>>  static bool ffa_handle_call(struct cpu_user_regs *regs)
>>  {
>>      uint32_t fid =3D get_user_reg(regs, 0);
>> @@ -239,6 +340,10 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>>      case FFA_ID_GET:
>>          set_regs_success(regs, get_vm_id(d), 0);
>>          return true;
>> +    case FFA_MSG_SEND_DIRECT_REQ_32:
>> +    case FFA_MSG_SEND_DIRECT_REQ_64:
>> +        handle_msg_send_direct_req(regs, fid);
>> +        return true;
>>        default:
>>          gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
>> @@ -326,6 +431,13 @@ static bool ffa_probe(void)
>>      printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>>             major_vers, minor_vers);
>>  +    /*
>> +     * TODO save result of checked features and use that information to
>> +     * accept or reject requests from guests.
>> +     */
>=20
> I am not entirely sure I understand this TODO. Does it mean a guest can c=
urrently use a request that is not supported by FFA?

In fact this is a bit the opposite: in the following patch we check that al=
l features we could need are supported but if a guest is only using a subse=
t we might not need to have all of them.
Idea of this TODO would be to save the features supported and refuse guest =
requests depending on the features needed for them.

Cheers
Bertrand

>=20
>> +    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>> +        return false;
>> +
>>      ffa_version =3D vers;
>>        return true;
>=20
> Cheers,
>=20
> --=20
> Julien Grall



