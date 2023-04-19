Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC356E73C0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523183.812996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp21C-0003ao-DL; Wed, 19 Apr 2023 07:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523183.812996; Wed, 19 Apr 2023 07:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp21C-0003Xz-AW; Wed, 19 Apr 2023 07:14:18 +0000
Received: by outflank-mailman (input) for mailman id 523183;
 Wed, 19 Apr 2023 07:14:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pp21B-0003Xt-3B
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:14:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb4aa338-de81-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 09:14:16 +0200 (CEST)
Received: from AM6PR10CA0049.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::26)
 by AS8PR08MB9503.eurprd08.prod.outlook.com (2603:10a6:20b:61d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 07:14:14 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::2d) by AM6PR10CA0049.outlook.office365.com
 (2603:10a6:209:80::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20 via Frontend
 Transport; Wed, 19 Apr 2023 07:14:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 07:14:14 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Wed, 19 Apr 2023 07:14:14 +0000
Received: from f7c348952fff.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7347220-EE19-4D83-9924-94F6E8012A94.1; 
 Wed, 19 Apr 2023 07:14:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7c348952fff.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 07:14:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB5876.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 07:13:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 07:13:47 +0000
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
X-Inumbo-ID: cb4aa338-de81-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qabZrQ2wjO5kr9XBBY2OyNobnlg9Rn35ZXmKMpR4CNI=;
 b=glVYZvqOyvTRgcPJVAPUSeBB9XYmSsZ85I8Mz14LuHV0m7SgyQmpYkeoUHFl45T/QOifmK2Gmet57u9zOVep6uM1iMK312vekNnyh5wxtCwGHMe/jfuyiEvrTINVZJ9K4cOyx+jH5E/LL9i9i2lH1PRU0rPtsNSYFVCADLFs5Eo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b51d2e3333e6b565
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNBXoRfHZyQ/7p5jICL6K8Ea9JDBZ2wc6gmwWbjbjkEjxDegSfh9q0OsuTfU24V/OrwexcwGefOt8mezrBOxyFcR+kJ+n22H0Y9b5wo2EvxoSl5j/Ki3lZKGKu1An8GdAZeV+bycYMFobSixXY5RQPL0ZnkLXK9I6E/gGtDe4KUTe50BSFEj/1DHkN6GKbZ9S7NXb/VPiKz1hc/Ua0KY3GjVa87tsFjKj8zzx67vfoK0bjibmqE+evc34hmoUC98b9yBcrdLGHGpBReqD80CebBsa2KJ7IIIgk+lQPZrNW7dB6EOoD7iZ7YMA6REByPrUQt6MO/6KlBfVsVK/hn6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qabZrQ2wjO5kr9XBBY2OyNobnlg9Rn35ZXmKMpR4CNI=;
 b=cvynrUhbNJNFCc3LbExaN3Wb8Tb7BqAjq5cnyO5Y9UTWcffP72+9kiwuD5GFRY7CirQ2vwkj6ZsJVYVTa9wxUKxPclvnrgiyl6cHOfUERblFe7pYeeikhIX8hJ8W6LuRu8GCDOYbn0uD4k9+t9PpXcQOlum3fsnu1hdIuMZ09774kF79sGMP1wiKAL7Od24xWG/GdkKhK4Nq+n5QWJ7lPNQF1wcU3w3tR8sT4rWvssQ3kg3gMelyXldvAw4+m9GFVTtAA485uKiv1vN7BXOaR12+UWF8QNWMeW0CV6utLVSusi6mP+vPiKf5LlqncwAdDjq+JOce745g8z0S7u7LgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qabZrQ2wjO5kr9XBBY2OyNobnlg9Rn35ZXmKMpR4CNI=;
 b=glVYZvqOyvTRgcPJVAPUSeBB9XYmSsZ85I8Mz14LuHV0m7SgyQmpYkeoUHFl45T/QOifmK2Gmet57u9zOVep6uM1iMK312vekNnyh5wxtCwGHMe/jfuyiEvrTINVZJ9K4cOyx+jH5E/LL9i9i2lH1PRU0rPtsNSYFVCADLFs5Eo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZbSQq1oowf9vRd0a2ZPNGYXQmqK8xC64AgAE14QCAAAESAA==
Date: Wed, 19 Apr 2023 07:13:47 +0000
Message-ID: <2B510623-0438-4D01-A916-14A8DE8D0A8C@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-6-luca.fancellu@arm.com>
 <109F3491-6845-4A5F-9F77-F24D8970B1BE@arm.com>
 <C99DF25D-538F-4373-9F3A-F4E62B9C4E54@arm.com>
In-Reply-To: <C99DF25D-538F-4373-9F3A-F4E62B9C4E54@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM9PR08MB5876:EE_|AM7EUR03FT032:EE_|AS8PR08MB9503:EE_
X-MS-Office365-Filtering-Correlation-Id: ac79462d-7d56-430a-7080-08db40a5ae66
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 i+tdrDFi/OSfQ9iNpZ7PMN4WHq8H1aKriFdXysPa6nmaJjcad4EKWhXmOVD78PiYi/zDTEWM+tFoWo6KB0gcKlhMsDZuLtv/PQPhxUoEYe3JvFbOTlZ7CXuBXLojIRpXN5/mR7VBpipKHLw35CSWnwRYpLd5DR4FkpkUrtZsFAI8TgXXGfaksqvoslaN2QgiDdPdSCOhfMbaDoUEBt9OrzhfPMcfgYrnBynDfB70Ih8/nIsCUd6eINHMRKISfMW1XCxszhyZgo/gfdc0/mHX15+oWvt12TB7/h6ek/3ZRxhy6nhMdZqD0HnOxoO5+8qrPBUXhL3UNLhi97dlwsnaF2bpboSRdeQnVczv0HMQVQcSsXCidwclhib87jW/OpL/wDYVl1aAgIVsbS/g9s0mDxFbf0sq2gIQjLIepr0M776yBnXxzBvoSio5URjd9DQk42AzoawbR3/wDmW6iF9YrZrSrthhpURhC+m9iacpy04VDgs62UN+6iB+3t5kpYDSyZs08PzR6eu9XvGMx48TkgePidHNV6R1hN+FruMr48C0kRaOt5R4a/HnmHeg6D5BEhifELjseIRyF7TK2p/Bh8gLIlPCJ3KgqLNr+HHs0TmrlxafQduZ+3CsSOLmxhRAbuP4mlZCZDUFvGk9K+x6aQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(83380400001)(6512007)(6506007)(53546011)(41300700001)(122000001)(71200400001)(6486002)(2616005)(91956017)(186003)(478600001)(33656002)(316002)(66946007)(4326008)(6636002)(64756008)(66446008)(66476007)(66556008)(76116006)(5660300002)(37006003)(54906003)(36756003)(38070700005)(86362001)(2906002)(8936002)(6862004)(8676002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5DB8A14516F7D64DB9BEFBB583FF57FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5876
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23aa60d8-ca38-4769-b42c-08db40a59e5e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LhPgKBFuQQ/UfzCjuyG5YR3bZTHTFe+33E+BZ/AD1Ob1oJpoAb38AvUsfk4rAHwGChYQpdME8TqPr4gxbRhPdTNGW/+04bDUXq3I3Va3HaZJEmsaC1EToAF7kRnPzr8NurCkqFmSzGSv2QnkUiWehR6xNEDXMLmIt5FPM3fFR+Do3etGRv+cdvZU9jGmRZQnWUVFzCEHdJ36RW7MDybOMGzv3Z6j4hiq4cQ1pDKJTyOszrUjcE0S8LZ9rNGlSJRckNJXo2GupfYr1R1lflUOWLLL6rPpjaoUzo/Z7IS/95NFlilzeMIa5raE+v5iSfYoJiJFBeLJJf1cIzpcAEj+XL5C5JbAP9PBG7gyfuWSe62p5k9IvqJdZY32aMmiDYZSx/lWEl/o8Na7vD8S+qKIedwLcBd4OZjuu8xHeQNMCsy9IKhsaKH8vlDc38cHn0PR2tOKy4I5mzmtDzs+g9hpCi1Nwq444yOiqPz1srCxputObvnlBG6NZD2u5wJx2D8v8BN5SR0HTiQdKGCYDD9bLxkZ0KbiDzVaX9mQj0as+wpyvF0+6yKFrswjV0tuoqiBVF/5ZGhzOH83bakkji8Re8fsf9qBS+EafP+TmQaBoyqFwUBmP1dkTvnFSu2UzsrHe27VM0uMqQXZ0jamXKhWbSMXnXT9Jz1GRUabZJScBQrtXWbJjkpXTBrT0DLdcwXy4Uzgt4UdK2AWe5MkAPPJRQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(36860700001)(2616005)(37006003)(107886003)(6506007)(26005)(6512007)(40480700001)(86362001)(54906003)(478600001)(316002)(6636002)(4326008)(83380400001)(336012)(186003)(6486002)(53546011)(70586007)(47076005)(70206006)(356005)(82740400003)(41300700001)(81166007)(5660300002)(40460700003)(2906002)(6862004)(8936002)(8676002)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:14:14.2319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac79462d-7d56-430a-7080-08db40a5ae66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9503

Hi Luca,

> On 19 Apr 2023, at 09:09, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Hi Bertrand,
>=20
>> On 18 Apr 2023, at 13:40, Bertrand Marquis <Bertrand.Marquis@arm.com> wr=
ote:
>>=20
>> Hi Luca,
>>=20
>>>=20
>>> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
>>> index 78f7482619da..5485648850a0 100644
>>> --- a/xen/arch/arm/arm64/sve.c
>>> +++ b/xen/arch/arm/arm64/sve.c
>>> @@ -5,14 +5,29 @@
>>> * Copyright (C) 2022 ARM Ltd.
>>> */
>>>=20
>>> -#include <xen/types.h>
>>> -#include <asm/cpufeature.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/sizes.h>
>>> #include <asm/arm64/sve.h>
>>> -#include <asm/arm64/sysregs.h>
>>> -#include <asm/processor.h>
>>> -#include <asm/system.h>
>>>=20
>>> extern unsigned int sve_get_hw_vl(void);
>>> +extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_=
ffr);
>>> +extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *preg=
s,
>>> +                         int restore_ffr);
>>> +
>>> +static inline unsigned int sve_zreg_ctx_size(unsigned int vl)
>>> +{
>>> +    /*
>>> +     * Z0-31 registers size in bytes is computed from VL that is in bi=
ts, so VL
>>> +     * in bytes is VL/8.
>>> +     */
>>> +    return (vl / 8U) * 32U;
>>> +}
>>> +
>>> +static inline unsigned int sve_ffrreg_ctx_size(unsigned int vl)
>>> +{
>>> +    /* FFR register size is VL/8, which is in bytes (VL/8)/8 */
>>> +    return (vl / 64U);
>>> +}
>>>=20
>>> register_t compute_max_zcr(void)
>>> {
>>> @@ -60,3 +75,46 @@ unsigned int get_sys_vl_len(void)
>>>   return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
>>>           SVE_VL_MULTIPLE_VAL;
>>> }
>>> +
>>> +int sve_context_init(struct vcpu *v)
>>> +{
>>> +    unsigned int sve_vl_bits =3D sve_decode_vl(v->domain->arch.sve_vl)=
;
>>> +    uint64_t *ctx =3D _xzalloc(sve_zreg_ctx_size(sve_vl_bits) +
>>> +                             sve_ffrreg_ctx_size(sve_vl_bits),
>>> +                             L1_CACHE_BYTES);
>>> +
>>> +    if ( !ctx )
>>> +        return -ENOMEM;
>>> +
>>> +    v->arch.vfp.sve_context =3D ctx;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +void sve_context_free(struct vcpu *v)
>>> +{
>>> +    xfree(v->arch.vfp.sve_context);
>>> +}
>>> +
>>> +void sve_save_state(struct vcpu *v)
>>> +{
>>> +    unsigned int sve_vl_bits =3D sve_decode_vl(v->domain->arch.sve_vl)=
;
>>> +    uint64_t *sve_ctx_zreg_end =3D v->arch.vfp.sve_context +
>>> +            (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
>>=20
>> You do quite some computation here for something which does not change
>> during the life of the VM.
>> Could we save the context_end in the vcpu instead and just do this
>> computation on init and free only ?
>=20
> Yes sure, would you be ok to have it in struct vfp_state?

Yes definitely i would store it instead of the current sve_context.

>=20
>>=20
>>>=20
>>> #endif /* _ARM_ARM64_SVE_H */
>>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/in=
clude/asm/arm64/sysregs.h
>>> index 4cabb9eb4d5e..3fdeb9d8cdef 100644
>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>> @@ -88,6 +88,9 @@
>>> #ifndef ID_AA64ISAR2_EL1
>>> #define ID_AA64ISAR2_EL1            S3_0_C0_C6_2
>>> #endif
>>> +#ifndef ZCR_EL1
>>> +#define ZCR_EL1                     S3_0_C1_C2_0
>>> +#endif
>>>=20
>>=20
>> What about ZCR_EL2 ?
>=20
> It was introduced in patch #1 because we use it in register_t compute_max=
_zcr(void)
>=20

Sorry i missed that.

Cheers
Bertrand

>=20
>=20


