Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665454E99A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 20:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350824.577238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1uQa-0008T9-Nl; Thu, 16 Jun 2022 18:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350824.577238; Thu, 16 Jun 2022 18:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1uQa-0008Rh-JL; Thu, 16 Jun 2022 18:41:12 +0000
Received: by outflank-mailman (input) for mailman id 350824;
 Thu, 16 Jun 2022 18:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dRx+=WX=epam.com=prvs=81664c6ed3=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1o1uQY-0008Qj-MQ
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 18:41:10 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1492293-eda3-11ec-ab14-113154c10af9;
 Thu, 16 Jun 2022 20:41:06 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GFhGeI026262;
 Thu, 16 Jun 2022 18:40:54 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3gr5fvh0yt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jun 2022 18:40:53 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB3088.eurprd03.prod.outlook.com (2603:10a6:802:2f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 18:40:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::28d9:fd20:dee0:74ed]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::28d9:fd20:dee0:74ed%6]) with mapi id 15.20.5353.014; Thu, 16 Jun 2022
 18:40:48 +0000
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
X-Inumbo-ID: e1492293-eda3-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHz54CRX5mX1Xy1bsi+FOV6QOF91SEnNwBTU4X6fTto1ruQHEjReDO4mjsiS71O0bMg7BT78vhevHnl6bAqbtHJlvOnCtVoB/cwySCW4nOKym5Hxa931jxVfiiv8qdHh4jw1zuzCijJ+ED3IsZEKCWHnzMq3sQCDJfD2LQA5TZcgDA9CWsUFJVDwHf2gECJyHZXo5sLYclDe9IxfvjgeQp1Tf2mBQvfIC7ouv4bfpMCvj5ntgHbz/uCg0jCikD1ZASMVBzSZ/62UaAWq3QhnN3cgbY/kC3QjKME97Xdxh7iwB5e9TaZk34YCXZb0QEgut2ZvUrnKp9PBri0OIbQCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDyLX7om2MyjGJk9+xTC4wtbGOCibzdWb5XkaS4LBcE=;
 b=NaXqodNt8QRmOzdg0LHUKXqjd9UvbE2cPy2PP79Ryyd05V2zHJPfjnVhhT6XSCw3NZMtgmvn351xVAby72M6wXmLACVrnuKGEQOy8r7vrfNA7IGubQ0xkJ+g8bLFZTYkwknq7KULXVyP7IBexafYk6dZN6aZ7VnaftLPqH9q3hxnvY6FLIbHYFYrV0BHGYLaLVqZjQ2zRhztPoyH5O0uW9h7RygQ8kL1Y+XURVVcJ/FRtXI56DpfZITBxi/2Jht/xrRCbjbZDcjFvg8RlOJQzIcOXKN1Oz1Q+X/WpfY+27xzp5tLnnm644WabI1UWUG2nNM8MqcVOXpxScrIHOfx4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDyLX7om2MyjGJk9+xTC4wtbGOCibzdWb5XkaS4LBcE=;
 b=jANm5jFsNclOcgEt6eKEjwYP9tTjjr6ICTjMPE3ZN2wmCum7N+Kd52ALmeLUVDkilIAw05g+42mlL5ZqVrOQpDTz3Pn00RZ48y9dfGkCHMDDIqZ6uB7GeNVqCJw3mD/far9dGszXoTkzuzh9i/w0qEwNe3TKlnZxdNzXfeVKFJhfgw9i097K2FLNUPpalY+29UYoDSOGvDzUStPCso/QZvxQ9wma5aHCWytD7PNl4pJL0DAzNqre8gMVdJeMRHgqbwk6kvJ+8duj2il+wm5oqoKe737AeZWQCW9vWXDL5A5cqwT83Rk+70NWhGhowXmddf//EoqCcag1KL+akwJ/cA==
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
Thread-Index: AQHYgYkEncCZtJfZsEuchGWkwMivea1SI+UAgAA3C4A=
Date: Thu, 16 Jun 2022 18:40:48 +0000
Message-ID: <87wndgh2og.fsf@epam.com>
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
 <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org>
In-Reply-To: <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 28.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c177d0f6-b564-436a-718b-08da4fc7bb51
x-ms-traffictypediagnostic: VI1PR03MB3088:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB308856C96230DF2581EA10C8E6AC9@VI1PR03MB3088.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fzHc5BakdqgW6/BBwrcXfaBMfl/9P7rlXEM7Uxq2jwGu66/5RuorNcVRwI22H9m1FSoSxyzCIRUeFsiojlQpkj1CxeP2i+rXF6OqM4jGSNjdf8dbFJ9napo4vaDHRHOauTIHhF5g7wceEjrWN6qSGcBHiVfOQquc58hmfdnuiGv9agTI7pskt/3Fe4VIITBuO1KgW5L72eW1xXWyMHC0BZmjDSrd6Ka9jBcjRlOXDMEj2C7Js/GlgHiAWFr7EbZBqa03nCZa8DCDxauzGm33WUS3P6mndJJQtLzRYK8ALKW53VYOZ+LS0s+Jg8t6vANIo4pm9dPZSJE9RsScHvjL8+uJGBQ5suZkgiZI+E6JAJESrlYMqXUOpEEaoV4zpfaqG5LsW9bXKw/gPY6NEGb6RD2hWQ4TBx9iT04fQS4DhAwmWUK7m16xvj3veQfdyrSU1VXo+W5hkYrc+M078vSyuJBda5kiASOZLel2wkEEa84VffrG+CtPPlAM6UDIC6/0IN4fbj7JmmElpI7QTq5Dd6jeg8rC9hizF370aRno7zTTQSm+5GRn8aW/qSPC7edBzB30IZf0isZdnY1er2gsuopxqnrsl3L8xIZVGbur0W9BOY6SFMbQYJyQ6JClQ9CvhCsT1P2KbU9OftW7SiT36RPyRgbSoroTEQG9+ooc27I3p0ZXIHEGlAt/Iomm+y+mULrafYaTYWFbBQWds7xVNCNMsjA9gklY2uv7zcqjfAE7H+M2HNcPbp5HAP5DAieXssBMQoTihsSyJ43rP8rt/2IHFBqCk4ReS4QUXQeAr78=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(86362001)(64756008)(66476007)(4326008)(8676002)(66446008)(54906003)(66556008)(71200400001)(38070700005)(6916009)(122000001)(508600001)(76116006)(316002)(966005)(91956017)(186003)(83380400001)(6486002)(66946007)(6506007)(6512007)(55236004)(53546011)(38100700002)(2616005)(36756003)(5660300002)(8936002)(2906002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?CTSLBN4r7rj5XbmcNf8qXwewoQBXbh6vCfGS6hh1OnfC/JvWxaogk0959s?=
 =?iso-8859-1?Q?fiG4SSJpvCvWLwPhSTbMa6L0r5xh4YoW+RLi0VJoAGXKPMsW9wVcopzsoF?=
 =?iso-8859-1?Q?ZOUgm3gl593fyPT/CW9G68OmnhxNNVOmoy2Q6zErkl2KBSrB9jGBlUHnh+?=
 =?iso-8859-1?Q?GJgaomZv2C69sdeYBXJcccThB3KQu2gTD/5Pa3wWD7TI2WfyK0zPGvJm61?=
 =?iso-8859-1?Q?UifL9HB9nDNu6QywrjEtIC1RZlBai/EcBqnwl+I99hUwQMN4vyT+982oy3?=
 =?iso-8859-1?Q?h3MIc3FjDaqlhCZrIA6GqKDTq5uRSeeIMynEufr+jqiPYkjaKCPD+W4jPS?=
 =?iso-8859-1?Q?8mIy5z1Ec/ie4Bu9cYncd262n/YQW2e968dp8gI9JVZG8c0SmzKBkahrOS?=
 =?iso-8859-1?Q?3VlqjC+vS5c6iyXvyloj3UWIV64F84gRsz3BJuMnXwSoQFPY6D+nw96+D1?=
 =?iso-8859-1?Q?AXGj44rpUWg5A0040iUkWy/ZexV5KdVnrU8aVwAkuedQy46wxgH4G6M08I?=
 =?iso-8859-1?Q?hGKis0FB+9m4RhGnUdk8/rtIgF+vgU1dfrdS6sn9gwdep1WfWklXGpxG3H?=
 =?iso-8859-1?Q?rrWk6nh0sDZFYgHppwlUj6El9DVPeraerGETiMQJhw0UdEQS9zA1SJdjXC?=
 =?iso-8859-1?Q?UzvOJhBRLgJAFBuz4OzLSx03mrXVCqWT2RocmQs3iYAoLPAuco66Kjdvyq?=
 =?iso-8859-1?Q?7xMWfRm/sqhcvCe7aUYHhjg8AKHCJcDyYFcFAEILibm4U8d27gzJsrS8zt?=
 =?iso-8859-1?Q?hybA4TRs6xp1jfW32DOYKmER9K+bptm5kyuXkih1cEiSJfT0sZyZnOykTP?=
 =?iso-8859-1?Q?B1fSfYzq7GFhZpU0AcCdIV9qVWssb414ndM54/RNQezKj0/o8xXsdM7Wrw?=
 =?iso-8859-1?Q?yuaRV1b5L7/OeVksv/bvgtcA3AD5MK5I1ST36i4NaCHDEY+h9PYkmeEn4p?=
 =?iso-8859-1?Q?24jMRjqmHuI2IQyG05nPeyaFVK/LWjKzqHUbTdUcBxEYeDD1VST+yRF57T?=
 =?iso-8859-1?Q?ZEd4sLKvIM4C/yY1YTepiFpZCW5wia0bz72RGZxxduDsNVg2+wcfHQflgo?=
 =?iso-8859-1?Q?ibs9deU1W8DIEh2O+J4DcSRy68Ko3V0SnLWccMvuxSkB2P0vkGIPrcC9JR?=
 =?iso-8859-1?Q?KRFxg5wH4XmyYuIX5dI65TkqXIT8ABXmEzabDTVzCO79D5VH/EzmLQ8Y6c?=
 =?iso-8859-1?Q?jKcww0LhEhNOI2xj9znkBi6gHrjq7clve3D2QzC1GNiBGzpMugYfvzvUoH?=
 =?iso-8859-1?Q?0cdivMUdWMr5Qb6hpxA5zl2a4TGeYM4/Os6CAW4AnRs/ZUp48B8w+GA+vy?=
 =?iso-8859-1?Q?x2i6IhMdyI76fPqwA5R2/hcLwQ+rJxCOWMaWYtwfzCksA9eLyDDDA7BSQv?=
 =?iso-8859-1?Q?aAfurgaDl2cVj/Gb8aqQmKPM61Q6nwrqeo7LSjYS82z+wUMVERI0J2S/C3?=
 =?iso-8859-1?Q?VSLz46SeYwfSUD9cbIaStVcQq2Lua2Lwmlun2eg/lcZTP5GmU7NHXCEvqI?=
 =?iso-8859-1?Q?fNQePAzacxw2+ddhgAmua8QRdegok4eEiSs2NkMjtHE1u3ui2PyQ7xH48k?=
 =?iso-8859-1?Q?pWD/zQcU8Uns32RDUmEsydy1ssaZAjP6HQ7dzh66Wf8IXKq4WrDtvHyKfg?=
 =?iso-8859-1?Q?cMHYY4m8U7iZ46FnqAoxldR4NdMtbwk07SZzAx57lQk0DJfczLDqxXlKSV?=
 =?iso-8859-1?Q?b0rQXUR7APnksne01o03bQn89hoFKF1CvIjr5umKDkjif0gAcEjJjbwQjB?=
 =?iso-8859-1?Q?IkVquRCotKQ/a1/L9tyXW/wB8jUeY/JgoOnTSWIB3+Z5eegL+6Tq68d6tT?=
 =?iso-8859-1?Q?4JYYuRSePJC3bsJ5TwVeUWTlZqt1dmw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c177d0f6-b564-436a-718b-08da4fc7bb51
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 18:40:48.5640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pVH2XEklDmwpFLXjW/KqyvVT2psdRASAumsxqI1/p7gOUnBe+Mzw8ffwsB+Kmj4qljQyUQUAwYH3h4NZHqxJU0ikLPfFWcF7tk3+R3iM5OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3088
X-Proofpoint-ORIG-GUID: RRjKJQePBFrtxLH0hAFsxpPKEYNj6PDI
X-Proofpoint-GUID: RRjKJQePBFrtxLH0hAFsxpPKEYNj6PDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_16,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=901
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160075


Hi Julien,

Julien Grall <julien@xen.org> writes:

> Hi,
>
> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
>> From: Dmytro Semenets <dmytro_semenets@epam.com>
>> According to PSCI specification ARM TF can return DENIED on CPU OFF.
>
> I am confused. The spec is talking about Trusted OS and not
> firmware. The docummentation is also not specific to ARM Trusted
> Firmware. So did you mean "Trusted OS"?

It should be "firmware", I believe.

>
> Also, did you reproduce on HW? If so, on which CPU this will fail?
>

Yes, we reproduced this on HW. In our case it failed on CPU0. To be
fair, in our case it had nothing to do with Trusted OS. It is just
platform limitation - it can't turn off CPU0. But from Xen perspective
there is no difference - CPU_OFF call returns DENIED.

>> This patch brings the hypervisor into compliance with the PSCI
>> specification.
>
> Now it means CPU off will never be turned off using PSCI. Instead, we
> would end up to spin in Xen. This would be a problem because we could
> save less power.

Agreed.

>
>> Refer to "Arm Power State Coordination Interface (DEN0022D.b)"
>> section 5.5.2
>
> Reading both 5.5.2 and 5.9.1 together, DENIED would be returned when
> the trusted OS can only run on one core.
>
> Some of the trusted OS are migratable. So I think we should first
> attempt to migrate the CPU. Then if it doesn't work, we should prevent
> the CPU to go offline.
>
> That said, upstream doesn't support cpu offlining (I don't know for
> your use case). In case of shutdown, it is not necessary to offline
> the CPU, so we could avoid to call CPU_OFF on all CPUs but
> one. Something like:
>

This is even better approach yes. But you mentioned CPU_OFF. Did you
mean SYSTEM_RESET?

> diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
> index 3dc6819d56de..d956812ef8f4 100644
> --- a/xen/arch/arm/shutdown.c
> +++ b/xen/arch/arm/shutdown.c
> @@ -8,7 +8,9 @@
>
>  static void noreturn halt_this_cpu(void *arg)
>  {
> -    stop_cpu();
> +    ASSERT(!local_irq_enable());
> +    while ( 1 )
> +        wfi();
>  }
>
>  void machine_halt(void)
> @@ -21,10 +23,6 @@ void machine_halt(void)
>      smp_call_function(halt_this_cpu, NULL, 0);
>      local_irq_disable();
>
> -    /* Wait at most another 10ms for all other CPUs to go offline. */
> -    while ( (num_online_cpus() > 1) && (timeout-- > 0) )
> -        mdelay(1);
> -
>      /* This is mainly for PSCI-0.2, which does not return if success. */
>      call_psci_system_off();
>
>> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> I don't recall to see patch on the ML recently for this. So is this an
> internal review?

Yeah, sorry about that. Dmytro is a new member in our team and he is not
yet familiar with differences in internal reviews and reviews in ML.

If you are interested, we had internal review at [1]:

[1] https://github.com/xen-troops/xen/pull/184

>
>> ---
>>   xen/arch/arm/psci.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
>> index 0c90c2305c..55787fde58 100644
>> --- a/xen/arch/arm/psci.c
>> +++ b/xen/arch/arm/psci.c
>> @@ -63,8 +63,9 @@ void call_psci_cpu_off(void)
>>             /* If successfull the PSCI cpu_off call doesn't return
>> */
>>           arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF, &res);
>> -        panic("PSCI cpu off failed for CPU%d err=3D%d\n", smp_processor=
_id(),
>> -              PSCI_RET(res));
>> +        if ( PSCI_RET(res) !=3D PSCI_DENIED )
>> +            panic("PSCI cpu off failed for CPU%d err=3D%d\n", smp_proce=
ssor_id(),
>> +                PSCI_RET(res));
>>       }
>>   }
>>  =20
>
> Cheers,


--=20
Volodymyr Babchuk at EPAM=

