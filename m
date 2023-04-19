Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8676E73AD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523173.812976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1xA-0002Lj-IM; Wed, 19 Apr 2023 07:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523173.812976; Wed, 19 Apr 2023 07:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1xA-0002Iy-EH; Wed, 19 Apr 2023 07:10:08 +0000
Received: by outflank-mailman (input) for mailman id 523173;
 Wed, 19 Apr 2023 07:10:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+8i=AK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pp1x8-0002Cl-EB
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:10:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34916905-de81-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 09:10:03 +0200 (CEST)
Received: from DUZPR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::12) by DB4PR08MB9240.eurprd08.prod.outlook.com
 (2603:10a6:10:3f8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 07:09:56 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::39) by DUZPR01CA0038.outlook.office365.com
 (2603:10a6:10:468::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Wed, 19 Apr 2023 07:09:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 07:09:55 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 19 Apr 2023 07:09:55 +0000
Received: from f8277197a3a9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 934AAE71-0034-4042-82FC-187394D6FC55.1; 
 Wed, 19 Apr 2023 07:09:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8277197a3a9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 07:09:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6232.eurprd08.prod.outlook.com (2603:10a6:20b:296::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 07:09:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 07:09:46 +0000
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
X-Inumbo-ID: 34916905-de81-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxOb2ldTZDZMjSMYWyWXZMPpukECH1gEsHRfQ3OwtoU=;
 b=e+fGq9v7uNRSMQv9D1RrwfPe+3pZ0O4bb8F9JiezIsNKAOrdPtd4f8q15lE0mqANhhGYPzOa0hxLS/sHZD+PD3QyJ88avwOU6uNKu93kb9jXJatqkTUnQg/ITmO2rYBR5fu77aJW6R3eV6lINhi+xfdiTdtzel6S1U5iZ5sd5hE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc3a2528ca62d7d4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdP9rlMc0UaL3C4L8ZTZvt/eIPHPZbrMjA3GXOfnx5XDtXk/vk/DSF2ZJuaeUY+yPlenhRPl78fGUFJL9zTQwOp8J2Sqcm0TkzZgquw3cczWdfnKx04k1CV/ehsb4sRnXTcvHEF3aokoHvM3Eer/iOuVCmRLOgMOP7KxYmGIr9go7By3Lbrxph7FjL3jObLNk53JIH234S/Wy0owLcV5OftpVUgffEQe8+/CMGQbIzBCDjwwHn9PrCNWuTPHvJ72A8vNo2mP9KSr4cAJYhINTt641a6QRZ3tojpTFrn2ArI88QHAluMmvpOT++cE6UzeLdBDK8L+JKiqVKYIceTJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxOb2ldTZDZMjSMYWyWXZMPpukECH1gEsHRfQ3OwtoU=;
 b=jLRFPn84oqRSaZtSTmAdBWkY4cSHrCXKe6QM1UOlAZ2cCBmTYYxwxhyoTHKq7wkMw8NESt8DobEZa8VbPQa0zi7oknzFhG1vNxsmQGNXXx3DuLnWI+DD3Pdd9/o/6t+sur+/TqyuU9QKSFUQMG1lr16JiJnJGMZV1CjSs4aw87t8lLqI5botv936yGgP7oNFg3ecCCkmmiYj8rAPDaqPeSZRZMqV/WPbpVT4UlqIqk0A/poEkqT9tefXFUkGPVMsg18nCcx9rigBQuwdUHkFPzTOJaYKLRUtkbqYfdow0VV3fWkQMiQfwnbGwo8NN59EqLq+GWtjg4XgpeyD6Hvf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxOb2ldTZDZMjSMYWyWXZMPpukECH1gEsHRfQ3OwtoU=;
 b=e+fGq9v7uNRSMQv9D1RrwfPe+3pZ0O4bb8F9JiezIsNKAOrdPtd4f8q15lE0mqANhhGYPzOa0hxLS/sHZD+PD3QyJ88avwOU6uNKu93kb9jXJatqkTUnQg/ITmO2rYBR5fu77aJW6R3eV6lINhi+xfdiTdtzel6S1U5iZ5sd5hE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZbSQ26+FC1T02dEGoq+zimN/6Ra8xC6+AgAE104A=
Date: Wed, 19 Apr 2023 07:09:46 +0000
Message-ID: <C99DF25D-538F-4373-9F3A-F4E62B9C4E54@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-6-luca.fancellu@arm.com>
 <109F3491-6845-4A5F-9F77-F24D8970B1BE@arm.com>
In-Reply-To: <109F3491-6845-4A5F-9F77-F24D8970B1BE@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6232:EE_|DBAEUR03FT016:EE_|DB4PR08MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 387c9a26-6053-4075-793b-08db40a513f8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lL6H7xurtju3njEHw6H8Gg6l1q0qvKtHpFSYy8ccOKoraUtKN8HgmrOcQcgzgTY1RdPEevski6Qt1KPqyWnMfSjXRnLWzZmRh6AfoO2KiN4ObNGV2M7y7HNOa7RmPdi20dkk3/IL0i1JkEUId3jPZwyLJHhV8EaZnQSCleKdrEaab2fOZkuEtJJUDcSMuTGg00PLv7Mlk1OwYp0k//frDUWo1G6XgASzBLy7c4+wqDYm4E1XNiwU7l2XazCKbfoR05uKooNKPAgA/6b3+E0jFKVkMIGPyw1VrM+wogw9wwr/3D/55zKIb/MVMwL4Ei64eZsmuz5VyPonlonA4SbapWompM9JZ45JGnCKzKuExA5lH7szy6BT88qB05RNr4lXsLXvlHyjObYGtM9mkTsXseyS8aeVGNuF9euNeiOoxxqRsEohGk2pxLVgUaPxULQrF5Yv8mrehqfzHkZ+cqnUjLat2pcMkafLBRA65njPTOklv0OnnjSLw5TFx5LrLvcydqBDOs/svwx2F9s3h1AGzIy/gPGH4sMquUBObK7G5Wbp0Jvt5nqL5QzVYnw18Lcqe+T1aImRgJJKPM1ZVjRNKWbarfPNL+yL2UjWNsx/hVB4/6hUYgGM+oHYkonVlApwqWP/rALbFLujZKlWfT5elA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(186003)(71200400001)(6512007)(6506007)(53546011)(83380400001)(26005)(2616005)(38070700005)(6486002)(86362001)(2906002)(33656002)(316002)(5660300002)(76116006)(4326008)(6636002)(91956017)(6862004)(41300700001)(8676002)(64756008)(66556008)(8936002)(66476007)(66446008)(38100700002)(66946007)(478600001)(54906003)(122000001)(37006003)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46715C9128255D4F96508A79040EF3C9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6232
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f4e888cd-bd73-4632-3150-08db40a50e9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	antkDHpXvO8+N1lsWutVUCgsniB+jpcpdJ/WxRQv3ZpsytHLyIg3ocf4wJnk9zh66EtFwrk6JxDbAkBZh56gKXe8L6Aq5qWgmeZ0alUMB7t0gTRHZSRFpdutCBO8pS5Pufp7aUl2HjOS//FTqIEZiKZ+yCtv63husj+MRFRYhSL4lGPeuSqNgbUfEWHBUL2iV/PYRs7UYaAjRjX9xp+TIJvzLl50urMBijCeJSCGKmWYDBc2kqxPb7WyBQv1LsQ6jN5yZxr+oYoYLYt6QFf9DcROajfQ5b2z4XMJc0jee9TM+YMttO2i1N717+JF/eT4SU1O6+gkRQeQwuPtNG1VDzrOu8bDstXyjNIBgirR1Rrj/jzSnPs75jSgDy8RYW3E5PrlH2pEDswca6YS/OY9lKWLUQte8u/nUVbaUtcpyFxpCmrYoo2eRw5oCmue2yyGX8fdgp01JyJY06jSxbANhHFx3aBhI/MDH9YmfGvpLxSObJ796hDgAQfUqDBmU7cuNNGL1i9dkTwZ8o0UMZgM+qrR0NxdjMCWUfSY2kq1SeFLX6CvSPLwxop7yACBjKhc+JrNJjKhkTOB+uvd2xp+vL4qT1qOFQXpkiGl1cqeS6jtXQL1W4GE1Q0zn4YcMx2ozoR/+iltlotxlaF6tXS72+yN3ZK88/fFntAGDpxSs3s6n4Rpfd+WG9nron1LD0GT+wdWF/LCjzAGuCTI5g8ViQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39850400004)(396003)(451199021)(40470700004)(46966006)(36840700001)(478600001)(6636002)(37006003)(33656002)(54906003)(2616005)(336012)(107886003)(41300700001)(6862004)(8936002)(8676002)(6486002)(86362001)(186003)(2906002)(40460700003)(47076005)(83380400001)(26005)(6506007)(6512007)(5660300002)(53546011)(36860700001)(36756003)(70206006)(70586007)(82310400005)(316002)(4326008)(82740400003)(81166007)(356005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:09:55.1733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 387c9a26-6053-4075-793b-08db40a513f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9240

Hi Bertrand,

> On 18 Apr 2023, at 13:40, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Luca,
>=20
>>=20
>> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
>> index 78f7482619da..5485648850a0 100644
>> --- a/xen/arch/arm/arm64/sve.c
>> +++ b/xen/arch/arm/arm64/sve.c
>> @@ -5,14 +5,29 @@
>> * Copyright (C) 2022 ARM Ltd.
>> */
>>=20
>> -#include <xen/types.h>
>> -#include <asm/cpufeature.h>
>> +#include <xen/sched.h>
>> +#include <xen/sizes.h>
>> #include <asm/arm64/sve.h>
>> -#include <asm/arm64/sysregs.h>
>> -#include <asm/processor.h>
>> -#include <asm/system.h>
>>=20
>> extern unsigned int sve_get_hw_vl(void);
>> +extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_f=
fr);
>> +extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs=
,
>> +                         int restore_ffr);
>> +
>> +static inline unsigned int sve_zreg_ctx_size(unsigned int vl)
>> +{
>> +    /*
>> +     * Z0-31 registers size in bytes is computed from VL that is in bit=
s, so VL
>> +     * in bytes is VL/8.
>> +     */
>> +    return (vl / 8U) * 32U;
>> +}
>> +
>> +static inline unsigned int sve_ffrreg_ctx_size(unsigned int vl)
>> +{
>> +    /* FFR register size is VL/8, which is in bytes (VL/8)/8 */
>> +    return (vl / 64U);
>> +}
>>=20
>> register_t compute_max_zcr(void)
>> {
>> @@ -60,3 +75,46 @@ unsigned int get_sys_vl_len(void)
>>    return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
>>            SVE_VL_MULTIPLE_VAL;
>> }
>> +
>> +int sve_context_init(struct vcpu *v)
>> +{
>> +    unsigned int sve_vl_bits =3D sve_decode_vl(v->domain->arch.sve_vl);
>> +    uint64_t *ctx =3D _xzalloc(sve_zreg_ctx_size(sve_vl_bits) +
>> +                             sve_ffrreg_ctx_size(sve_vl_bits),
>> +                             L1_CACHE_BYTES);
>> +
>> +    if ( !ctx )
>> +        return -ENOMEM;
>> +
>> +    v->arch.vfp.sve_context =3D ctx;
>> +
>> +    return 0;
>> +}
>> +
>> +void sve_context_free(struct vcpu *v)
>> +{
>> +    xfree(v->arch.vfp.sve_context);
>> +}
>> +
>> +void sve_save_state(struct vcpu *v)
>> +{
>> +    unsigned int sve_vl_bits =3D sve_decode_vl(v->domain->arch.sve_vl);
>> +    uint64_t *sve_ctx_zreg_end =3D v->arch.vfp.sve_context +
>> +            (sve_zreg_ctx_size(sve_vl_bits) / sizeof(uint64_t));
>=20
> You do quite some computation here for something which does not change
> during the life of the VM.
> Could we save the context_end in the vcpu instead and just do this
> computation on init and free only ?

Yes sure, would you be ok to have it in struct vfp_state?

>=20
>>=20
>> #endif /* _ARM_ARM64_SVE_H */
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/inc=
lude/asm/arm64/sysregs.h
>> index 4cabb9eb4d5e..3fdeb9d8cdef 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -88,6 +88,9 @@
>> #ifndef ID_AA64ISAR2_EL1
>> #define ID_AA64ISAR2_EL1            S3_0_C0_C6_2
>> #endif
>> +#ifndef ZCR_EL1
>> +#define ZCR_EL1                     S3_0_C1_C2_0
>> +#endif
>>=20
>=20
> What about ZCR_EL2 ?

It was introduced in patch #1 because we use it in register_t compute_max_z=
cr(void)




