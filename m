Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767302CA1D4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 12:55:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41871.75372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4F4-00030J-Eg; Tue, 01 Dec 2020 11:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41871.75372; Tue, 01 Dec 2020 11:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4F4-0002zv-AK; Tue, 01 Dec 2020 11:54:46 +0000
Received: by outflank-mailman (input) for mailman id 41871;
 Tue, 01 Dec 2020 11:54:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Rbw=FF=epam.com=prvs=0604308a42=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kk4F2-0002zq-UK
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 11:54:45 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5922f9f9-0423-44a6-b126-bcc4d4af9889;
 Tue, 01 Dec 2020 11:54:43 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1BntaT022312; Tue, 1 Dec 2020 11:54:38 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0b-0039f301.pphosted.com with ESMTP id 355k5tgf0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 11:54:38 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB4976.eurprd03.prod.outlook.com (2603:10a6:803:bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 1 Dec
 2020 11:54:33 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 11:54:33 +0000
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
X-Inumbo-ID: 5922f9f9-0423-44a6-b126-bcc4d4af9889
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5SNM6fmejyPVD6OVxWywspVnP9kFaQjoVUam2hxTD+UjHYlfrVqdpmxhW6sTe8sYlwsF3kD4tCsZS9PNx8DCxDmOQZVXYEQjfHLPs7k0kJwBgICPvwK0Qa4kCvtiqLnHtoHy3e3lsNTc5ig4MgTtyiIN4JixapO6BW0oKw09Re9JUdbbgzzEnQmHJgbDH9CiHoYlrFineIZyDNXq4PlKs4sBpO4q4Vyhy0QahXobp9iaCIDuN+rrm70ddHj0sVHckJ6p1xWAM7xsMZjVwts0u3QuDs2VjTTcsuU/nOte+SMz1albRsI50AzxjRnjJdM9Qs6e9wFrbNKC1PptbMFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UibfmSkyUXppL87aTbqePgIkcgv0DZZYw3cYe+r93c=;
 b=enbz7ZS0twDHgyvStYQcIAwChoN4C6NOnngGokJ2e1OiP/GEi5C/QbnoFFOqSOENz+v1STGltIsO0jmNp+JE7cOrWsYTsxHhBiNIQfI3A5iEQkTv0jzScmPAyvrDj1Xl2338eVHIr1kZxDCelyM1a/jSzqNOIhDE5QVJEz6rJaENKvaXlBQs+3tSjZU6a97oZ6HWsFCvDkH/kmiUnDpRU9eYx/Y5Ph711MrM3CfM5L+NinaJnD05ILd7xYUXKJitV9yclYtjBo0NI/5pOee28mvOCbrKRXLPL1aoon4TfdCRuxoOrLbX3easynmbFaiBPRzw5pgBVRwxEubCp+/k7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UibfmSkyUXppL87aTbqePgIkcgv0DZZYw3cYe+r93c=;
 b=Jym2aoFI+rtt3ecsBfa/j3Zt6U+4tyWDUZVEn9GDc0YX+QJH8AzuasZLGKNGXerZi0F3VvPN4EICik0Jr/qr3HM1q2boNMmIyvV4uoroo/hGpvXya4DNjLqcCDeZdJ6ODXcnTeGqKIjdR4iIpeF6+oSEjit2eDvxxkr5ybr7cqCymQ5/sm1WzWNkMUo6EP06MrJNuDFcWLWj+qHopfwHQJh4z5Mty4PWXH1zGlinr7CpIspvpAXJF251iFD1VSq0oTa/8QEmosZmdot11zKZuXMs52FjsUAJ+57XIyB5ZH8TT8NVxZw273alalcsdtGYPoERj6UDcduZMCdrLZ2pXw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Topic: [PATCH v2 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Index: AQHWxyRRk7rRSvoRk02jzxNDTD03R6nhHqgAgAEBOwCAAANKAA==
Date: Tue, 1 Dec 2020 11:54:33 +0000
Message-ID: <87y2ih68sn.fsf@epam.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <6db611491b25591829b9408267bd9bd50e266fe2.1606742184.git.bertrand.marquis@arm.com>
 <87pn3u7fyp.fsf@epam.com> <C561BBE3-796C-4A29-B24D-188D792757CB@arm.com>
In-Reply-To: <C561BBE3-796C-4A29-B24D-188D792757CB@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4751b2c-fbf8-4822-d15b-08d895efdeb9
x-ms-traffictypediagnostic: VI1PR03MB4976:
x-microsoft-antispam-prvs: 
 <VI1PR03MB4976FFFE0306D2B304337F5AE6F40@VI1PR03MB4976.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aG5mMmXpN17V70nZiBsUxxHdfgDg4sntxen02yhwOafITcKhpqVH24OHcPIM2fLYdfZRj03l63TgSVnD3Bq70C+EztTM1VxNV5/BfIlOyJvH/uaJ1dOPqBZlIHoRiGQZ86hWmofu8TT5bTTW9EKC7jLcQfjAnaGzFrAhzHlxx/9ToZOpUYoJTG/cGVkVlDl6+PISe/VSNJ8gIyaroejJPFThkELJ8qf8Y9uHxtzTIXcDjIIvOk6nMyTpV9jJwB0kGJB7L+XT0g959h8SRXATmsx2bryL1ArlXcM9GtSs2NnDAhiL2cFi3RIu686JFlvLB55rKDb8ASMuoU0xKtPyKQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(6506007)(53546011)(71200400001)(6512007)(5660300002)(66556008)(2906002)(76116006)(91956017)(66946007)(4326008)(66476007)(2616005)(66446008)(64756008)(6916009)(26005)(186003)(83380400001)(8936002)(478600001)(8676002)(316002)(36756003)(6486002)(54906003)(55236004)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?jZQAi1UOqJyv7cA4kYeqXeTQ+VYgAtvygqgoTx2pu7hGrXMJtRkMEZIMYT?=
 =?iso-8859-1?Q?8MwL+bTAPd0ZsA8kaQcc+9NNnw1puQdJ+NzqAM8qEatr17lFHqIXQlkUBj?=
 =?iso-8859-1?Q?u4F5nepGwmqoilv7qP6V0oNhMebWOSn0D2fifRgbDvrRHuWhK3Up0dzQW+?=
 =?iso-8859-1?Q?sFfEOMM5reeNIbTexriE5cGv6CEflgZejx6LQiCO7TTrEw+zAUYFUROl0S?=
 =?iso-8859-1?Q?EvyP7znNs2RHRBJ1vv61rLSQ9Qg330Jg40Ngovcynjm48cCQgJh0VogLjG?=
 =?iso-8859-1?Q?fmUkqHEVI6fWedOMRahKG303nogdBAzSiEpxPGpeVx9PEbnz6hzqVxa3EV?=
 =?iso-8859-1?Q?QEfdNxStb8fDaksrMkalo6KshqIlpOwsm085imPHJucXVnSAq7tseZEq4V?=
 =?iso-8859-1?Q?hqlVW/ecbADIo6VG/gd87RbyaejhPLoyywFSwAK2OQnNwWcjSLBxZCqBoe?=
 =?iso-8859-1?Q?dLmf4xu0PBxE+z+TLBAFHsnr4PIPsELxXVyqzgbVbpxaxaitOz9gfTVlE4?=
 =?iso-8859-1?Q?StO+nAf1fOgsYDN8i+uBKf3lEplzlRrHh+5ghcr7NMeEocON/fGUYS5ozv?=
 =?iso-8859-1?Q?5k1KLAU6SxmY3pquaemdPD31xfF2p1h4F4vNSnbHVwnqTPGuaAY17Be1hB?=
 =?iso-8859-1?Q?KCZriupGCyIr9dCd0VEJM5N9vTu5pwliCiMjA1Q0obctwT0mqJXTloXhBY?=
 =?iso-8859-1?Q?houKCeTyE5FWWzR6kXBg6Xc6U8GPGon8FFa2yQOmbSVaJ6iSsksU36hmFb?=
 =?iso-8859-1?Q?Sa+oIgIqsuo0q5NID1EYrK7U8o6MUQs5JLxNyxXzP1dhuJhUYM6mfkC6hR?=
 =?iso-8859-1?Q?iRLXCUSr0WiPQCAKQFMVMJwJ6npNhSts9O811roUW/IrfF93cu0k9gnFKy?=
 =?iso-8859-1?Q?SA6HGyl2ra8oaC/avMoyJrgU+gBEe9XyRVXYietQOvVBbOttfr7g4N6a8i?=
 =?iso-8859-1?Q?aseoh2o1cIRNjR5qiZq9NfugrjdhTqvAB5RfcQLgI7//Di24axwpVvEZkz?=
 =?iso-8859-1?Q?2G+sbAPsaoLy8DWw7Jtk3x6dl0R7hzTevRsV21?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4751b2c-fbf8-4822-d15b-08d895efdeb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 11:54:33.7744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BoSN9Acdj2rTaGLkRq45ZM1fINGxiyrdtSS3r5T9Roydy4k+wkVMDZPru5uTrLIYGWRR54W88iVIhIGiPuu9f1R+Sw2xwMtFWGASxjhETpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4976
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_04:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=840
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010077


Hi Bertrand,

Bertrand Marquis writes:

> Hi Volodymyr,
>
>> On 30 Nov 2020, at 20:22, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>=
 wrote:
>>=20
>>=20
>>=20
>> Bertrand Marquis writes:
>>=20
>>> Add vsysreg emulation for registers trapped when TID3 bit is activated
>>> in HSR.
>>> The emulation is returning the value stored in cpuinfo_guest structure
>>> for most values and the hardware value for registers not stored in the
>>> structure (those are mostly registers existing only as a provision for
>>> feature use but who have no definition right now).
>>=20
>> I can't see the code that returns values for the registers not stored in
>> the guest_cpuinfo. Perhaps you need to update the commit description?
>
> You are right, i modified my code lately to handle all possible registers=
 so
> this case does not exist anymore.

You are covering all currently known registers. If I got reference
manual right, there are number of not assigned ID registers, that should
be RAZ. But with this patch access to them will trigger undefined
instruction abort in a guest.

> I will update the commit message to fix this.

I believe, you need to add cases for currently unassigned registers, so
access to them will yield 0.

> Cheers
> Bertrand
>
>>=20
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> Changes in V2: rebase
>>> ---
>>> xen/arch/arm/arm64/vsysreg.c | 49 ++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 49 insertions(+)
>>>=20
>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.=
c
>>> index 8a85507d9d..970ef51603 100644
>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
>>>         break;                                                         =
 \
>>>     }
>>>=20
>>> +/* Macro to generate easily case for ID co-processor emulation */
>>> +#define GENERATE_TID3_INFO(reg,field,offset)                          =
  \
>>> +    case HSR_SYSREG_##reg:                                            =
  \
>>> +    {                                                                 =
  \
>>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, =
  \
>>> +                          1, guest_cpuinfo.field.bits[offset]);       =
  \
>>> +    }
>>> +
>>> void do_sysreg(struct cpu_user_regs *regs,
>>>                const union hsr hsr)
>>> {
>>> @@ -259,6 +267,47 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>          */
>>>         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>=20
>>> +    /*
>>> +     * HCR_EL2.TID3
>>> +     *
>>> +     * This is trapping most Identification registers used by a guest
>>> +     * to identify the processor features
>>> +     */
>>> +    GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
>>> +    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
>>> +    GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
>>> +    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
>>> +    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
>>> +    GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
>>> +    GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
>>> +    GENERATE_TID3_INFO(ID_MMFR1_EL1, mm32, 1)
>>> +    GENERATE_TID3_INFO(ID_MMFR2_EL1, mm32, 2)
>>> +    GENERATE_TID3_INFO(ID_MMFR3_EL1, mm32, 3)
>>> +    GENERATE_TID3_INFO(ID_MMFR4_EL1, mm32, 4)
>>> +    GENERATE_TID3_INFO(ID_MMFR5_EL1, mm32, 5)
>>> +    GENERATE_TID3_INFO(ID_ISAR0_EL1, isa32, 0)
>>> +    GENERATE_TID3_INFO(ID_ISAR1_EL1, isa32, 1)
>>> +    GENERATE_TID3_INFO(ID_ISAR2_EL1, isa32, 2)
>>> +    GENERATE_TID3_INFO(ID_ISAR3_EL1, isa32, 3)
>>> +    GENERATE_TID3_INFO(ID_ISAR4_EL1, isa32, 4)
>>> +    GENERATE_TID3_INFO(ID_ISAR5_EL1, isa32, 5)
>>> +    GENERATE_TID3_INFO(ID_ISAR6_EL1, isa32, 6)
>>> +    GENERATE_TID3_INFO(MVFR0_EL1, mvfr, 0)
>>> +    GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
>>> +    GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
>>> +    GENERATE_TID3_INFO(ID_AA64PFR0_EL1, pfr64, 0)
>>> +    GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
>>> +    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
>>> +    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
>>> +    GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
>>> +    GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
>>> +    GENERATE_TID3_INFO(ID_AA64MMFR0_EL1, mm64, 0)
>>> +    GENERATE_TID3_INFO(ID_AA64MMFR1_EL1, mm64, 1)
>>> +    GENERATE_TID3_INFO(ID_AA64MMFR2_EL1, mm64, 2)
>>> +    GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
>>> +    GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
>>> +    GENERATE_TID3_INFO(ID_AA64ZFR0_EL1, zfr64, 0)
>>> +
>>>     /*
>>>      * HCR_EL2.TIDCP
>>>      *
>>=20
>>=20
>> --=20
>> Volodymyr Babchuk at EPAM


--=20
Volodymyr Babchuk at EPAM=

