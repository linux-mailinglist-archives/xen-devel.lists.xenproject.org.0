Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1362C8F6E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 21:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41456.74613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjq8u-0008RJ-T1; Mon, 30 Nov 2020 20:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41456.74613; Mon, 30 Nov 2020 20:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjq8u-0008Qw-Pp; Mon, 30 Nov 2020 20:51:28 +0000
Received: by outflank-mailman (input) for mailman id 41456;
 Mon, 30 Nov 2020 20:51:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBJD=FE=epam.com=prvs=06035e4899=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kjq8s-0008Qk-Nr
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 20:51:26 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff35b66d-cae0-4ef7-a91e-9623db490fab;
 Mon, 30 Nov 2020 20:51:25 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AUKfYwm001800; Mon, 30 Nov 2020 20:51:14 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 353dv2wxay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 20:51:14 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB2880.eurprd03.prod.outlook.com (2603:10a6:802:2d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 20:51:09 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 20:51:09 +0000
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
X-Inumbo-ID: ff35b66d-cae0-4ef7-a91e-9623db490fab
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5G95A4yQSj6Ic2y/ZmjOuT5ZhM3KkNdvrksELOCcMkqNVeXkhobGd2AwCOhKH2VYquJnHO98LeMdcnFFy7Cdjvz+kKlU7UTF0YReH4WE0nGPiquUOhAdhZBwXjKHxVYyoGlbMqzezXoAdat+tYr/TABoAvr+dhhbhfsXaDtFIrQAdEW7FMOoP92Iq19LWrRRbCDpaKa5SHnR9/Z+IYQfwd17MEra1w/JFYTwKtphw3e0XOt+CFs7sqmB3BUFR4Bfp5+F9wISXT3uBba2iAALHyrsCt6lyyllrzqnzunP53TstyC0BK0co3zv39t9E39aIEg/xZfr9RyKpwX3DlzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KArdJbSp/HmifNqXna5we7oWwJ7unOhPaZmPbRWmTe8=;
 b=i6v2xrFUUSI+wAW6qesgo1s5KJwYzGUYXN8JCVLova7ksXY6NzVNTbqdsm+FzbPKXUjjptAg++hqgNnlIhNjTdXfJhiyJjMvmqAnau1G2Nx3XV1Zd5DsuhfrwukVhijE6VDyOSJ4rSrP2T/FugIfzV5sK5sj4/LYSlHG/he5G8Vaowm5i/XHIevr1I3iuYgTo6HY71x303GMSFkR3XBCbk22s7/V0uSidybQr39txKDARCrgh1aHf8h1MrMQvDL92Tc4f42wwCzOpDEXJSbPE4sirRwl6w097DGTBXSmNqWKIXNjcitHbZjWxnKX/hEE/F/3WG0284Sab57vNacb9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KArdJbSp/HmifNqXna5we7oWwJ7unOhPaZmPbRWmTe8=;
 b=ilVz2Ur0ZRmJAhZQmjkTu2rhSWPzdjP5E5lw1K8Un29fJpBZlo3MZT9bPN/db4F5hsX2qxGQp9pmmFTgrthmeHcaDnVpmS5mr6OTSU76HaAeg0nh6yv/Wbv4BMfyC2Zf8KqWmkg5jHa+f162kv9kVHCQiRL9h9bCEs2fovVxbcja1FYk+d3Aiv5UeZtRc4xp/Us9+hzSZAowTHqkLFS7H1Q9KQpGG1H6dEoQoqxOR6ha9Z55K1C2PqmeIvw1BddoiSB0vwjuPDLXR16eAC8aHHzWK7y4bTRNsq6pnEEXvMLGqhtO8EoEaQjDrUmXv6D5i3Eh/YgO2NYH7XEi0UuTsg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>, Julien Grall
	<julien.grall@arm.com>
Subject: Re: [PATCH V3 15/23] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
Thread-Topic: [PATCH V3 15/23] xen/arm: Stick around in
 leave_hypervisor_to_guest until I/O has completed
Thread-Index: AQHWxwQMBbxecCO+BEuoRSAjYYX8W6ngeeYAgACtHwA=
Date: Mon, 30 Nov 2020 20:51:09 +0000
Message-ID: <87czzu7emb.fsf@epam.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-16-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1606732298-22107-16-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [85.223.209.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e062183-ff54-4456-2cf7-08d89571aa6c
x-ms-traffictypediagnostic: VI1PR03MB2880:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <VI1PR03MB2880202661A69C8948A15819E6F50@VI1PR03MB2880.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SJ8LyQ/Jf9sFTT2d36r6U0tcBqkTEmDB0IEfaRUqHSpyCv3qRVUTKH5up5qdLA52KAIZBDNpQE3n/YJ21dlPDxnbmBroUEofQn7kjrqZfVHnI0M8Wt8cEXtOsbE8lq4yv82F3M01QqO7/kLA39Pn++YTjT8lHb0M0esoEf5qXgwkJBzFwOMPvG0J0xZLPpmQQuSt5dwlP2ICGgDOGE7lasg8TkW3alS0/mvLdBrd+LKMyRCrXW9o0HfZSPyAEjuBJHsdOA2hLpaA3X6aM+rh2dOlnZngnsAopSelt7WY2OlTj4FKaKv0mRBqhpk/WTmu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(54906003)(66556008)(76116006)(6506007)(71200400001)(316002)(91956017)(66946007)(66476007)(36756003)(64756008)(66446008)(2906002)(186003)(4326008)(478600001)(26005)(6512007)(6916009)(8676002)(86362001)(5660300002)(8936002)(55236004)(6486002)(83380400001)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?LAov9b8xQ4IwYJDUhqhNfQnhBRYy/URrwr4AEef0qdBDxpDl/V/C5eWzI5?=
 =?iso-8859-1?Q?MkrYu4lRH8dPM84W9xTwA82bJySpahoHfMwsGpjFjN+/Xf53jMOXfF7BSt?=
 =?iso-8859-1?Q?sulV8nbB7HM6UCJ4JxDQ6jcuv1tmjIsn9P11mQ7zfnFPqPWM7D74Fmer7y?=
 =?iso-8859-1?Q?tzxyurniwFac3DlV6mhgn/rgC5LY1HZJLRiO09wkbUppmYZtvySbHfII9p?=
 =?iso-8859-1?Q?Z3RIoydBOTrJ7N94DEI3kxelcmXlOyMUAYedidFWQ82HW/NMsxL5Wkzswz?=
 =?iso-8859-1?Q?3dNMFV46TYs+WG0FxEC5WqWF50B772OESYCveIui+4NM77zF11t9PU06DI?=
 =?iso-8859-1?Q?t6u2LAR8pFrq8qofdcCg1pYe2PHCnOqBuKUF1T1HuSSDm1qBbgTddcXCLK?=
 =?iso-8859-1?Q?FKVCAPPY/FSUKzVK/eW8cNPI5hjA9gtMh+2RMGZttmGJ7CX69eI5JBXDR/?=
 =?iso-8859-1?Q?2WH09oY/sRXMoI3V6cSHZRTqwEL9GIgr08jOoefpp/6lnh7LFRbdLBABok?=
 =?iso-8859-1?Q?osUs5aB2jtMY3NvtzXtb7H0hpWaYgGWiVYMHL4nmTabp0rAv+PwHDJTUAn?=
 =?iso-8859-1?Q?C89puc/YTfrVRlntfdZNgiHHDzU749hb8gyONa70nLZCM8vNBnsrcV4+jd?=
 =?iso-8859-1?Q?ezLCjyqwiJ+iTVy/j8Eu4XpJ7MkZtyS/Dgvl8vFjunp/pKlP3lfa1C2/6f?=
 =?iso-8859-1?Q?09NHCrkLWVAGbw0lFqpXrgJ6trb0bvEJn0T2lVrUz7gy3GVWxRwsmz7m2V?=
 =?iso-8859-1?Q?Krttb2QSkAhidsRwvZrxJvN5foPnOoQVhau0mv15HD2335+n0Lz83fVcS/?=
 =?iso-8859-1?Q?LpErIFTidSF+R61hqasr6XFHeTN6U00druLHTU28ogNgBdm/i5YgJjHDTv?=
 =?iso-8859-1?Q?XdXJD9DqfPUlS005+UFUkFp6TXofi3lAGpjAaIbIMHnQazBYTShTGVLq6p?=
 =?iso-8859-1?Q?k2LZdSl7dqIK9zKWtpeX3zXyJpFqf0FxikEV3zvU0ll//9ke3tHPQdU0T3?=
 =?iso-8859-1?Q?vlU2Yql7uF3ELIldPKyAh7Vv3LmolfU26HtLOz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e062183-ff54-4456-2cf7-08d89571aa6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 20:51:09.5108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OACtJrydduIdWnZObGvULsvbNDTIv6omdmQmEqocGe3iQYo39vlWFuZN3W34MgYXCYdrE9v2RARHRJOsJfTSz1CKEzK4DKCz3etNsrmsq8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB2880
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_11:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300133


Hello Oleksandr,

Oleksandr Tyshchenko writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> This patch adds proper handling of return value of
> vcpu_ioreq_handle_completion() which involves using a loop
> in leave_hypervisor_to_guest().
>
> The reason to use an unbounded loop here is the fact that vCPU
> shouldn't continue until an I/O has completed. In Xen case, if an I/O
> never completes then it most likely means that something went horribly
> wrong with the Device Emulator. And it is most likely not safe to
> continue. So letting the vCPU to spin forever if I/O never completes
> is a safer action than letting it continue and leaving the guest in
> unclear state and is the best what we can do for now.
>
> This wouldn't be an issue for Xen as do_softirq() would be called at
> every loop. In case of failure, the guest will crash and the vCPU
> will be unscheduled.
>

Why you don't block vcpu there and unblock it when response is ready? If
I got it right, "client" vcpu will spin in the loop, eating own
scheduling budget with no useful work done. In the worst case, it will
prevent "server" vcpu from running.

> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
>
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>
> Changes V1 -> V2:
>    - new patch, changes were derived from (+ new explanation):
>      arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>
> Changes V2 -> V3:
>    - update patch description
> ---
> ---
>  xen/arch/arm/traps.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 036b13f..4cef43e 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2257,18 +2257,23 @@ static void check_for_pcpu_work(void)
>   * Process pending work for the vCPU. Any call should be fast or
>   * implement preemption.
>   */
> -static void check_for_vcpu_work(void)
> +static bool check_for_vcpu_work(void)
>  {
>      struct vcpu *v =3D current;
> =20
>  #ifdef CONFIG_IOREQ_SERVER
> +    bool handled;
> +
>      local_irq_enable();
> -    vcpu_ioreq_handle_completion(v);
> +    handled =3D vcpu_ioreq_handle_completion(v);
>      local_irq_disable();
> +
> +    if ( !handled )
> +        return true;
>  #endif
> =20
>      if ( likely(!v->arch.need_flush_to_ram) )
> -        return;
> +        return false;
> =20
>      /*
>       * Give a chance for the pCPU to process work before handling the vC=
PU
> @@ -2279,6 +2284,8 @@ static void check_for_vcpu_work(void)
>      local_irq_enable();
>      p2m_flush_vm(v);
>      local_irq_disable();
> +
> +    return false;
>  }
> =20
>  /*
> @@ -2291,8 +2298,22 @@ void leave_hypervisor_to_guest(void)
>  {
>      local_irq_disable();
> =20
> -    check_for_vcpu_work();
> -    check_for_pcpu_work();
> +    /*
> +     * The reason to use an unbounded loop here is the fact that vCPU
> +     * shouldn't continue until an I/O has completed. In Xen case, if an=
 I/O
> +     * never completes then it most likely means that something went hor=
ribly
> +     * wrong with the Device Emulator. And it is most likely not safe to
> +     * continue. So letting the vCPU to spin forever if I/O never comple=
tes
> +     * is a safer action than letting it continue and leaving the guest =
in
> +     * unclear state and is the best what we can do for now.
> +     *
> +     * This wouldn't be an issue for Xen as do_softirq() would be called=
 at
> +     * every loop. In case of failure, the guest will crash and the vCPU
> +     * will be unscheduled.
> +     */
> +    do {
> +        check_for_pcpu_work();
> +    } while ( check_for_vcpu_work() );
> =20
>      vgic_sync_to_lrs();


--=20
Volodymyr Babchuk at EPAM=

