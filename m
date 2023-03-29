Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7A6CD8BF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 13:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516223.800011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUIM-0002LP-OM; Wed, 29 Mar 2023 11:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516223.800011; Wed, 29 Mar 2023 11:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUIM-0002Ij-L6; Wed, 29 Mar 2023 11:48:50 +0000
Received: by outflank-mailman (input) for mailman id 516223;
 Wed, 29 Mar 2023 11:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTc=7V=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1phUIK-0002IY-Sj
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 11:48:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe02::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e58f50-ce27-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 13:48:46 +0200 (CEST)
Received: from AM6PR04CA0067.eurprd04.prod.outlook.com (2603:10a6:20b:f0::44)
 by AS8PR08MB9791.eurprd08.prod.outlook.com (2603:10a6:20b:614::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Wed, 29 Mar
 2023 11:48:44 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::2) by AM6PR04CA0067.outlook.office365.com
 (2603:10a6:20b:f0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Wed, 29 Mar 2023 11:48:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.20 via Frontend Transport; Wed, 29 Mar 2023 11:48:43 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Wed, 29 Mar 2023 11:48:43 +0000
Received: from 12a423fb647e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CFFE4DDC-03BB-4254-A669-C62A61ACA1FE.1; 
 Wed, 29 Mar 2023 11:48:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12a423fb647e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Mar 2023 11:48:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9903.eurprd08.prod.outlook.com (2603:10a6:10:470::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Wed, 29 Mar
 2023 11:48:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 11:48:30 +0000
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
X-Inumbo-ID: a9e58f50-ce27-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16LBxrFWbEOsifnLrlm2xHFtmhZ3sqRJp2TVWGLNEng=;
 b=UdsilF+THFS3y8pPAjCGibJtPuyj/LEW8zza1kyd0TYGJe15Pw0JFOjeuEefgeMPsqISRojRwQiRSoEFjM6/NuoyDiQaoiTQOWJhY1V9zL/1MzS/QMCma4oMgy+ATxXoLZqAmNA+LRxByAJ5IkmG3c41e3pAmTNYFTJg58jYJOM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5391c22564e8c9d6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGC2WSSY5fYfBs28XkSs7Jrwi1/Qo76ptfYous805s6PE4iR4Skeu9SOeg/vN8Zlj9KL40Mz2kM4gYgZ8BwGbzwEXdLsi7SsAMNRU88zd5ga9ZUtCJPsvbj+k46Um0k5/SEFJiyl1cdmY2NeSnEoARewCeV1JMkTDCzwk+oM2OOLfpAyHN38a/oAPGvEaygC+JJn6u5ltHN0bQYQ75gwbE7XnH1FzzfmjX53u3PPxMzoVlb6BTzSsF832Iq1swbntNdjwuMzv/kTa7soxnwlfzRj9SRgbBJICNF/WjAbB0QHxPp8t3dYChFXBP9jiyNC/yuUqibTVgNsT639Ya0cYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16LBxrFWbEOsifnLrlm2xHFtmhZ3sqRJp2TVWGLNEng=;
 b=MCl958a6qk+2O8C526aNcs8bOrgFD8ttfm2Fxpfo4xB7y2yEan+wX6DIMEnxBZQ7hxxAzHqDYQCYjlCn1B1bUXaxICFjVsZ9gFZQwQoHqkCarZLqOdNLi2Z5xHzcYc5ubUzInlIZNDUKggDBx4w1aLSwHumLXcgwuVxLYiy4x4xBqlJokobt1G+b65vXCpz4PzkmfOVwzduSPvOBQdPs9sq0MVi91PKYbBttt63XLOfrtF4/9aAjI2SKhB6J+n+l96BwfwkpUwVywFrtaNIks+D+sd+QGop7WPgH47cvN6+M278OLMjs4cZ6jWaZJ+CPjo/a/IgilAuE1DyCkphyng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16LBxrFWbEOsifnLrlm2xHFtmhZ3sqRJp2TVWGLNEng=;
 b=UdsilF+THFS3y8pPAjCGibJtPuyj/LEW8zza1kyd0TYGJe15Pw0JFOjeuEefgeMPsqISRojRwQiRSoEFjM6/NuoyDiQaoiTQOWJhY1V9zL/1MzS/QMCma4oMgy+ATxXoLZqAmNA+LRxByAJ5IkmG3c41e3pAmTNYFTJg58jYJOM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZYJtnVirGlcet3UaNyqwRESxZda8P+VUAgAGuKwA=
Date: Wed, 29 Mar 2023 11:48:30 +0000
Message-ID: <00BD9D2D-AB18-4D23-8F01-7C8151E6F975@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-8-luca.fancellu@arm.com>
 <2846794b-8057-2f41-3082-4d6c6fcd3f50@suse.com>
In-Reply-To: <2846794b-8057-2f41-3082-4d6c6fcd3f50@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9903:EE_|AM7EUR03FT062:EE_|AS8PR08MB9791:EE_
X-MS-Office365-Filtering-Correlation-Id: b76164d6-6dee-4271-d297-08db304b8c2e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +OGU4gqbXG+wJdhZRTA5KwOhW4HttF0Mx7PDZG6xV5nuUXx5kuetvUq6jtt6IlNZgCilOkG2yh+L1i6lT4K8/zKd704hi/3TrhG0bKtBmyyFj5KMPo2Xm7M04tCqCvYGS9FqeTC0IFYwWIMKihpnfBi3PqlbBjqXxNPkOa0b7T5tbKSnrKoSe4TpnRgwKSD3zlQ6gkCpCCEzdpdQ9lvhFyWxUZINphSGYSgDnWqLz5oRwVvQzXwFc7Gt5BWv8otZcvl6bcZC3ffqW6Zff5vdD7jSQ5P7XnAkPvcqrtKxdYZ/QDn+FJZDhiM9lgwVeZX9eJniqp9RHrC+Eb6p/GzLko7HWbP4XAHzHhujis+b56hcR8/Fd8877Up3X5Tpm0cimSnWyYXUZCOsXp0FADOv40nAW53AVQurwVqchBkvlPpaBY91lX+m4/KMlpob5V30pbrZ1fsTI7fYVV5l5/N7L6dKqn+9zzInIBkGdXughZEYHKxj5tYZE/EDAmYYoEK5VebFLlGAQIGVHgJWLBRx5vVg//SFQstOP3uJXwRkezIdHy5JiNmAV03Scmdy1Y7oOc35kCHN8IS330ZGc/UVl+ARt6kHk5Smc8piEE9KAs9GAb/MJrwENbeRQJ/EWWL5Y3Rb8Wp6veGPVM8AU3Knww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(316002)(478600001)(54906003)(86362001)(122000001)(8936002)(36756003)(38070700005)(5660300002)(66556008)(76116006)(91956017)(4326008)(66446008)(38100700002)(66476007)(66946007)(2906002)(8676002)(33656002)(6916009)(6506007)(41300700001)(64756008)(186003)(53546011)(6512007)(26005)(2616005)(83380400001)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <80AEFAF5A1AEA443A57FE6F94C13803E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9903
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21b3c339-1280-4a02-8f85-08db304b848d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0WYU9MtzHXM9f1D7Q2M6eJhViXAZTZoSb00axlrmmt1U5XGN2cm3GOIy1yw/Y1wy1HzgEeQjgRjYqEjonMwYIuc4PIk4O2VhAEejGxNwxYkw90spaeDmVgfPbh85nQrTf5KhGU2XnWKEkh5NyJ4jv/6djUcIot2ANLnDoVfkdTmb80ZK28iuyragwmdSxIwnFQYoKTn+1zaGGVpllKnAL1cu/2nFbrFhQJXMdCUc66Fc4l+l8vOCqPAPRf/SinQ6KIsM5Ly91oCFutWiTVen5yUUn+uH/52BuBzuFHlsqGFo+CHYY9DW7cq29QazYf4uGWKncYt+t7Pb90oTuuGdIa5X6ppdxjRZyt36zEovKwWU7fmCrtfbPNLYKzDIdm1Y+Xp3uNvgDgNbeYbv/FSqteeno38OK1zz/yij5eeVGEsg4ecw93+6L8rGBsYsRXineGWeedcPUzL4UwNG9s64blnpU4ZlY2nZfZMcWmc04VKEST/W8cfetKhL7u1fmxgS08nICPrQpUb9MpcXKNX5BnU4aGwij/FhH821mGFjHZiBlt6BAI3MCUnXZ0QgSRVLNNw2OKhWmwTlxn3hFsfmArtO4SIUP1icccLN1m4cRJdlQJCKs3vU07i+3Zh1wzIY5fgLlSBQLPGPURr6yqpAQBnnsZE7GlzlEqSZo1Ag4d9jdiX2lTPNcLtGbslUsidNvA9Z8nhv2nlxEv+/61hE5A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(47076005)(2906002)(2616005)(83380400001)(336012)(6512007)(8676002)(4326008)(70206006)(70586007)(478600001)(54906003)(53546011)(316002)(26005)(6506007)(82310400005)(186003)(36756003)(36860700001)(86362001)(41300700001)(81166007)(82740400003)(5660300002)(6486002)(356005)(40480700001)(40460700003)(33656002)(8936002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 11:48:43.4835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b76164d6-6dee-4271-d297-08db304b8c2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9791



> On 28 Mar 2023, at 11:08, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 27.03.2023 12:59, Luca Fancellu wrote:
>> @@ -838,6 +838,18 @@ Controls for how dom0 is constructed on x86 systems=
.
>>=20
>>     If using this option is necessary to fix an issue, please report a b=
ug.
>>=20
>> +Enables features on dom0 on Arm systems.
>> +
>> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain a=
nd sets
>> +    the maximum SVE vector length.
>> +    Values above 0 means feature is enabled for Dom0, otherwise feature=
 is
>> +    disabled.
>=20
> Nit: "above" suggests negative values may also enable the feature, which
> I'm sure isn't intended. You may want to consider using negative values
> to signal "use length supported by hardware".

This is a very good suggestion, do you think I should restrict only to one =
negative value,
for example -1, instead of every negative value?

>=20
>> +    Possible values are from 0 to maximum 2048, being multiple of 128, =
that will
>> +    be the maximum vector length.
>=20
> It may be advisable to also state the default here.

I will add it

>=20
>> +    Please note that the platform can supports a lower value, if the re=
quested
>=20
> Maybe better "... may only support ..."?

ok

>=20
>> +    value is above the supported one, the domain creation will fail and=
 the
>> +    system will stop.
>=20
> Such behavior may be acceptable for DomU-s which aren't essential for the
> system (i.e. possibly excluding ones in dom0less scenarios), but I don't
> think that's very nice for Dom0. I'd rather suggest falling back to no
> SVE in such an event.

I guess that with the introduction of a negative value meaning max supporte=
d
VL, it is ok to stop the system if the user provides a custom VL value that=
 is
not OK. I remember Julien asked to stop the creation of Dom0 in such a case=
 on
the RFC serie.

>=20
>> @@ -115,3 +119,8 @@ void sve_restore_state(struct vcpu *v)
>>=20
>>     sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
>> }
>> +
>> +int __init sve_parse_dom0_param(const char *str_begin, const char *str_=
end)
>> +{
>> +    return parse_integer("sve", str_begin, str_end, (int*)&opt_dom0_sve=
);
>=20
> Please can you avoid introducing casts like this? If you're after an unsi=
gned
> value, make a function which only parses (and returns) an unsigned one. A=
lso
> why ...
>=20
>> @@ -61,7 +62,12 @@ custom_param("dom0_mem", parse_dom0_mem);
>>=20
>> int __init parse_arch_dom0_param(const char *str_begin, const char *str_=
end)
>> {
>> -    return -1;
>> +    int rc =3D 0;
>> +
>> +    if ( sve_parse_dom0_param(str_begin, str_end) < 0 )
>> +        rc =3D -EINVAL;
>=20
> ... can't you call parse_integer() right here? opt_dom0_sve isn't static,
> so ought to be accessible here (provided the necessary header was include=
d).
>=20
>> --- a/xen/common/kernel.c
>> +++ b/xen/common/kernel.c
>> @@ -314,6 +314,30 @@ int parse_boolean(const char *name, const char *s, =
const char *e)
>>     return -1;
>> }
>>=20
>> +int parse_integer(const char *name, const char *s, const char *e,
>> +                  int *val)
>> +{
>> +    size_t slen, nlen;
>> +    const char *str;
>> +    long long pval;
>> +
>> +    slen =3D e ? ({ ASSERT(e >=3D s); e - s; }) : strlen(s);
>> +    nlen =3D strlen(name);
>> +
>> +    /* Does s start with name or contains only the name? */
>> +    if ( (slen <=3D nlen) || strncmp(s, name, nlen) || (s[nlen] !=3D '=
=3D') )
>> +        return -1;
>> +
>> +    pval =3D simple_strtoll(&s[nlen + 1], &str, 0);
>> +
>> +    if ( (str !=3D e) || (pval < INT_MIN) || (pval > INT_MAX) )
>> +        return -2;
>=20
> Like its counterpart in parse_boolean() (which I understand you've
> derived parts of the function from) this if+return wants a comment.
> Also - why strtoll() when you're only after an int? Yet then another
> question is whether we really want to gain parse_long() and
> parse_longlong() functions subsequently, or whether instead we
> limit ourselves to (e.g.) parse_signed_integer() and
> parse_unsigned_integer(), taking long long * and unsigned long long *
> respectively to store their outputs. (Of course right now you'd
> implement only one of the two.)
>=20
> Finally, for the purposes right now the function can (and should) be
> __init.
>=20
>> --- a/xen/include/xen/lib.h
>> +++ b/xen/include/xen/lib.h
>> @@ -94,6 +94,16 @@ int parse_bool(const char *s, const char *e);
>>  */
>> int parse_boolean(const char *name, const char *s, const char *e);
>>=20
>> +/**
>> + * Given a specific name, parses a string of the form:
>> + *   $NAME[=3D...]
>> + * returning 0 and a value in val, for a recognised integer.
>> + * Returns -1 for name not found, general errors, or -2 if name is foun=
d but
>> + * not recognised/overflow/underflow value.
>> + */
>> +int parse_integer(const char *name, const char *s, const char *e,
>> +                  int *val);
>=20
> The comment wants to match function behavior: The '=3D' and the value
> aren't optional as per the implementation, unlike for parse_boolean().
> Also please be precise and say "... and a value in *val, ..."

Ok I will address all the comments above

>=20
> Jan


