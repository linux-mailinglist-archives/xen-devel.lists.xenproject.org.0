Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC6D54F3FD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 11:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351211.577775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2802-0008CO-0p; Fri, 17 Jun 2022 09:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351211.577775; Fri, 17 Jun 2022 09:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2801-00088w-Tn; Fri, 17 Jun 2022 09:10:41 +0000
Received: by outflank-mailman (input) for mailman id 351211;
 Fri, 17 Jun 2022 09:10:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWRj=WY=epam.com=prvs=81677805da=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1o27zz-00088q-UU
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 09:10:40 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59f26181-ee1d-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 11:10:38 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H8pNTt004309;
 Fri, 17 Jun 2022 09:10:32 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3grpfbr2fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 09:10:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM9PR03MB7268.eurprd03.prod.outlook.com (2603:10a6:20b:262::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Fri, 17 Jun
 2022 09:10:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::28d9:fd20:dee0:74ed]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::28d9:fd20:dee0:74ed%6]) with mapi id 15.20.5353.014; Fri, 17 Jun 2022
 09:10:28 +0000
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
X-Inumbo-ID: 59f26181-ee1d-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2unOd8An8tfZCjZ9O/2omr1tO6a1LH/68pOoUeVepD2i7cBTSAuKByKf+HVdJq9Nt5Rr8eqfjBwe0u4Elv4R+m9PSgRc2hltP4uQHvk2Pete3gtN+lIUPs7hPQIRVti/J9Ss6XCmxias4Xx4c5moJdExTFVeAw0gvhRI55crdMJ+HpIZjS1Io7usOriP5Uf0/S+QmvafOsSwdA9pjOpR8PJebzke9rj01d6k6KItT7WUBpfGk5XMMjglbFjYkaBsreS2AUF33k7nM2coEoJBICThUfhrt7UKyQSQLCctg0pmTKfCb3IsvWlCi3tI51+CFDTzbez42tylOhBCNF5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBt4BpruxuDW+3U+YaEMd/LSKPRuAhGP8rBevWZMe/U=;
 b=fTHsrHFfpj1NzJ8PNAswgFl+phgYpvy1T7K+fJPyWsfk/xJrEnCg4Bx4aMJUz7Hg5uHYdwumZWoEB89iPJybGz0hND7NHuSq/qMoSHuNBfRRWkoLMEdVaeZHGUo+smqxS/rNVhlhuAjXLJc4jyRJjvHSInO9sv0uQMbvgtDvtWocyJ4eNYejIX2AeAwsZrVB40MfDtYLzzdxrMFdpOObYcSZVUWTO69NbimZVxfIx9OiAwX2q3BsZIQX8JQuFKMxEbAHPsOjoO2J1enG/xeptj2Jzeyvh8YjFB0jvo9WapoROgiX+JyohXNJOeAp4Q4L4ys5SaqzsCC0B/kbM5Exvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBt4BpruxuDW+3U+YaEMd/LSKPRuAhGP8rBevWZMe/U=;
 b=UnQcBjrrgK52cesOgg2OzdzxASTGv3NsJDBwB//lSbUn8Eq2Heo+9yybsFdfbYDTjDnVeByIwePlPzrnlcV2qJnfw4lm/unNiXQ4VfzU4QRrhm0FC25NwdBhAStU+UNmrEehJNugASeptaH/Rk2vKBHnipnxinRqm4M9nxQvYql0f9TdHZzF0x8iFfhMbn6fR1iAD3wS8emFvkLUx/ceUq6QrFM5vCb1xAUsBpCrZg4AIrrOudU7zXhx/ERXYW0GW94z7Fj+UexE7RhVuU42n5fxUDRX+pI5eQ50Cb7AzDEH770jy6gvxPaiy0nO/CsTXx3hp4CaqQeLrxezDk3xOw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "dmitry.semenets@gmail.com" <dmitry.semenets@gmail.com>,
        Dmytro Semenets
	<Dmytro_Semenets@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
Thread-Topic: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
Thread-Index: AQHYgYkEncCZtJfZsEuchGWkwMivea1SI+UAgAA3C4CAAAs5gIAA5jKA
Date: Fri, 17 Jun 2022 09:10:28 +0000
Message-ID: <87pmj7hczg.fsf@epam.com>
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
 <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org> <87wndgh2og.fsf@epam.com>
 <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org>
In-Reply-To: <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 28.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 898b1721-97d8-48dd-0c7e-08da504138cd
x-ms-traffictypediagnostic: AM9PR03MB7268:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB72685330622F53A128A405FBE6AF9@AM9PR03MB7268.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wtD9zAUF+NPnKQ5VRuNg8N+7NCF0g6VdVYOvnp73ktP+PCj8aVpm9qFEreb99p9m90PQAr5cDZrTXne3cfAtR7RkCUFh31A5LDUt4CiyE7W3ZmzW8M7POQ0ZGf0xqZkyYibenwkBlxGp4HFEKWIeFCfS6LZDeouCQe0EUBTAVziRHm/sckEnoY+auvcti6FeDvJhm5I3gHGCdwvIPLMjvHV0TBUFlhO8wnbe/U8L+e2dpHiUEfExipMqoqNks4ktM7KKu/LZMDIbEoTCrMXbKjSriUyazDbPS21YHwLfjNqibJsPI5PPTb7UFNMYZHJNgvCTcp2a6fJ8EjnJyiZZVyqhbXzdQmzbAMBkFrpyOJ9A7PH60d63hnaUsVGuEqds66mn41cZrEfLArMtW5MFNo0dUclFlPfgC+g+VDfWc+jmkhAKgfnfwwudTHRxcM92/kduz6ZEh2VOGP4BnJYlcVI1m/4w8ejzXri1flZ0b4UhfeIOcNvVl/kJlwIIooOKGNCwVEt59OYYw6dKm3k3801NcJ2tc4tGZgw1Qw8KDo1u35ZRikg9XqwiU1h+JhAzUGPXz0RRTDRBhR8IS4hbL40KMlrZwMV8bMX1p+bMCXWHxqmw2tdZZ6l1DpxXTZzuP37HgjF0h+lLNnn1NouQXSi+hf9265HhUnzvlZ45LK1oD0Z5ygkNbMGc0TGqyDpCNBMg30I5tTL4r6qslXPWbA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38100700002)(55236004)(498600001)(6506007)(71200400001)(83380400001)(316002)(53546011)(186003)(2616005)(2906002)(6916009)(54906003)(86362001)(38070700005)(6486002)(66556008)(122000001)(36756003)(8936002)(64756008)(8676002)(66946007)(4326008)(26005)(66446008)(66476007)(91956017)(76116006)(6512007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?1o65He2Sueg7jjs+gaI5kqsSceWx4W4M1gabBABVn77zQAyUXdKVCIvZzt?=
 =?iso-8859-1?Q?IKU52oVHuu0zl3Wjj2rYFHRcNv3Bw2UrkyR6dIZ+N7BgedjnqW3YjwvaM4?=
 =?iso-8859-1?Q?B/QtNrbmCCmYdl0ZVPjeOsH4Y5kDAeExOj2z8m5rUN2LnA8YPMPz+280cy?=
 =?iso-8859-1?Q?ZJvJxoo4mhiyC/rEg2ZSGWJ8plaIV5ej0D/6h89EgIwncVe8bh+enmGEYB?=
 =?iso-8859-1?Q?ujG4AV7UCDB3XdDzZOfmChrAsd+r2t6+2QFHOZ8shnqoOuCK+YJF6Huw4Y?=
 =?iso-8859-1?Q?T6lxJlCoWXtgRiTXUOELgJWZpHso9DS8KQpUW1WHQ6HLSxULG2R3z6B8EN?=
 =?iso-8859-1?Q?c0JWk3axEH31d5W30R875E5FUWJmGCx916xqGAlndvD9iBxyWhAmX159SN?=
 =?iso-8859-1?Q?x9nPIpyEYQZI5B+cZeda03KP6hP/9YcpELzSf9WMkdICue4KWxZZdy975l?=
 =?iso-8859-1?Q?GbTlJJenRMLXmPTiLju2pDKFXbb2XICTFs9gRM7tLroBuPmg7EQXoBLs3D?=
 =?iso-8859-1?Q?TVEbjppCzbsy+BLeI7IjE8U/HUXRADqHJNqbnv07kobiBqJp2TNsReG7B8?=
 =?iso-8859-1?Q?7h+/IiHxDsYfySNq9Vsh2yl4XFwHKWDa5upsQvh5z5JTkZGjlspqXS/WYX?=
 =?iso-8859-1?Q?O1bcfLDwPncptpFcHNEAaLL+jDbDWQZ8vqykQ6Wc2zwwzOkwHB4r9oXBLb?=
 =?iso-8859-1?Q?SiD/ztPRmwg+7Zq8CaAnLkP9cl2EB2kfMGoD5eK9zDHVHXIIQHgoog+EKT?=
 =?iso-8859-1?Q?MQ9GFRwPh6buSYCVFOOLo5bjdxgD+8HmHRH7cweRSBdrU4FeYgqJQ+HkOF?=
 =?iso-8859-1?Q?+a+hUSpQWBAViaOoHk4wqDPJyP0Ne9+4NRam3GXSM4iFxCFGeBdDEZxbkm?=
 =?iso-8859-1?Q?yjvEGMdmc5iO0V519kHctqYUg8e57W9g9sqjKm5vWYoNJKe5bKpl2yNq1z?=
 =?iso-8859-1?Q?avDUNsAIanMMMLFDsy61YkiZn6+IpnDfd8mMkVWyZzOf1c6SQsoil20cHK?=
 =?iso-8859-1?Q?zh9DJyJSPiRwjVWe7uvfGi6DsNR+7zBTU0HhXn75K5YVEF3P+eOnUNDrE0?=
 =?iso-8859-1?Q?HkJgtmKnqPRNRHp45QRPCngEHJXOZSyx4Ng1BS+t8dPVoJHI+OrIf1d+ww?=
 =?iso-8859-1?Q?AoRTbgrCH+Is1byypWCgoWHP+kWl8mZdQF/j0s7Nl5Qj5CGbxucudqsa2o?=
 =?iso-8859-1?Q?HVxtYZ9+Zq0vwECMlaM4la8xlQnKykICI0NZSPp3A7r0CzM1qX0NVkI05Q?=
 =?iso-8859-1?Q?f+A3s06Q2Wu1+nTXi73QVFr6eBeh1J9O2kD20qRz2gYUx/Dg/eIqlXt2t5?=
 =?iso-8859-1?Q?Z2Qpi6DzQhlrWJrWvWboGhoeAbwRU2J4akFnnrZ2bkbTsda9slJ/OZbx4n?=
 =?iso-8859-1?Q?WkSTHXj5VNIPfp60cnv5N35iONoh57AWh+CJWkl98u2PYGoLVaA99CsDmE?=
 =?iso-8859-1?Q?vHYVlHtIxGHGi1f29pYzrM3Zuo2yrGnAWWcAKW3mqQ+UKeJHjMbqJDC/JJ?=
 =?iso-8859-1?Q?vcujsL4T6D/GnatVHW3/xRwCwFaGLUK7v0MdhuTEvU9NHMEi2E9IO8Ifd5?=
 =?iso-8859-1?Q?LoSEi19RW2pgsTH2SJytrVjmrke1eTXRR3UMpqNJCF/nvcW6+PanTt+lbS?=
 =?iso-8859-1?Q?MlmbIyHluhjoNXtj8jQeds4PcYznHrUI9bgQNwXMtEZ3zeIE/JfWdOqeq5?=
 =?iso-8859-1?Q?itfpC8T6I1hIqTxePhs+DBXvM/T6jS18aZGuy3XyOZFec5bl0x1JCvKKrn?=
 =?iso-8859-1?Q?gvy9qHeod4uY2mBdpwzb+8R1tE/M7LhdZHgsH095Vw0qSo38e5m1pHRprn?=
 =?iso-8859-1?Q?UHlJgxA23R8PeMygpXv0I6l/y/Air6g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898b1721-97d8-48dd-0c7e-08da504138cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 09:10:28.1936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8e4Wr9UTeCwt/BDrir8Nvyj5FHk4vX9R9FBLu9E7pjSqMgW5dbRcoBPkmw/zhLW2qIjCIwtAOYErkvUDHvOqwLllwz9knCr6/qXx7qqtkhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7268
X-Proofpoint-ORIG-GUID: G47x4be7OizfFGuwV3Vm2uT9BlGlY176
X-Proofpoint-GUID: G47x4be7OizfFGuwV3Vm2uT9BlGlY176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_07,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206170040


Hi Julien,


Julien Grall <julien@xen.org> writes:

> On 16/06/2022 19:40, Volodymyr Babchuk wrote:
>> Hi Julien,
>
> Hi Volodymyr,
>
>> Julien Grall <julien@xen.org> writes:
>>=20
>>> Hi,
>>>
>>> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
>>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
>>>> According to PSCI specification ARM TF can return DENIED on CPU OFF.
>>>
>>> I am confused. The spec is talking about Trusted OS and not
>>> firmware. The docummentation is also not specific to ARM Trusted
>>> Firmware. So did you mean "Trusted OS"?
>> It should be "firmware", I believe.
>
> Hmmm... I couldn't find a reference in the spec suggesting that
> CPU_OFF could return DENIED because of the firmware. Do you have a
> pointer to the spec?

Ah, looks like we are talking about different things. Indeed, CPU_OFF
can return DENIED only because of Trusted OS. But entity that *returns*
the error to a caller is a firmware.

>>=20
>>>
>>> Also, did you reproduce on HW? If so, on which CPU this will fail?
>>>
>> Yes, we reproduced this on HW. In our case it failed on CPU0. To be
>> fair, in our case it had nothing to do with Trusted OS. It is just
>> platform limitation - it can't turn off CPU0. But from Xen perspective
>> there is no difference - CPU_OFF call returns DENIED.
>
> Thanks for the clarification. I think I have seen that in the wild
> also but it never got on top of my queue. It is good that we are
> fixing it.
>
>>=20
>>>> This patch brings the hypervisor into compliance with the PSCI
>>>> specification.
>>>
>>> Now it means CPU off will never be turned off using PSCI. Instead, we
>>> would end up to spin in Xen. This would be a problem because we could
>>> save less power.
>> Agreed.
>>=20
>>>
>>>> Refer to "Arm Power State Coordination Interface (DEN0022D.b)"
>>>> section 5.5.2
>>>
>>> Reading both 5.5.2 and 5.9.1 together, DENIED would be returned when
>>> the trusted OS can only run on one core.
>>>
>>> Some of the trusted OS are migratable. So I think we should first
>>> attempt to migrate the CPU. Then if it doesn't work, we should prevent
>>> the CPU to go offline.
>>>
>>> That said, upstream doesn't support cpu offlining (I don't know for
>>> your use case). In case of shutdown, it is not necessary to offline
>>> the CPU, so we could avoid to call CPU_OFF on all CPUs but
>>> one. Something like:
>>>
>> This is even better approach yes. But you mentioned CPU_OFF. Did you
>> mean SYSTEM_RESET?
>
> By CPU_OFF I was referring to the fact that Xen will issue the call
> all CPUs but one. The remaining CPU will issue the command to
> reset/shutdown the system.
>

I just want to clarify: change that you suggested removes call to
stop_cpu() in halt_this_cpu(). So no CPU_OFF will be sent at all.

All CPUs except one will spin in

    while ( 1 )
        wfi();

while last cpu will issue SYSTEM_OFF or SYSTEM_RESET.

Is this correct?

>>>   void machine_halt(void)
>>> @@ -21,10 +23,6 @@ void machine_halt(void)
>>>       smp_call_function(halt_this_cpu, NULL, 0);
>>>       local_irq_disable();
>>>
>>> -    /* Wait at most another 10ms for all other CPUs to go offline. */
>>> -    while ( (num_online_cpus() > 1) && (timeout-- > 0) )
>>> -        mdelay(1);
>>> -
>>>       /* This is mainly for PSCI-0.2, which does not return if success.=
 */
>>>       call_psci_system_off();
>>>
>>>> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
>>>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>
>>> I don't recall to see patch on the ML recently for this. So is this an
>>> internal review?
>> Yeah, sorry about that. Dmytro is a new member in our team and he is
>> not
>> yet familiar with differences in internal reviews and reviews in ML.
>
> No worries. I usually classify internal review anything that was done
> privately. This looks to be a public review, althought not on
> xen-devel.
>
> I understand that not all some of the patches are still in PoC stage
> and doing the review on your github is a good idea. But for those are
> meant to be for upstream (e.g. bug fixes, small patches), I would
> suggest to do the review on xen-devel directly.

It not always clear if patch is eligible for upstream. At first we
thought that problem is platform-specific and we weren't sure that we
will find a proper upstreamable fix. Probably you saw that PR's name
quite differs from final patch. This is because initial solution was
completely different from final one.

--=20
Volodymyr Babchuk at EPAM=

