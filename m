Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A51BB5D9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 07:24:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTIiu-00022K-Rw; Tue, 28 Apr 2020 05:24:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g9hW=6M=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1jTIit-00022B-Dq
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 05:23:59 +0000
X-Inumbo-ID: 765c863a-8910-11ea-b07b-bc764e2007e4
Received: from sonic309-22.consmr.mail.ne1.yahoo.com (unknown [66.163.184.148])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 765c863a-8910-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 05:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1588051438; bh=IccE9zI+jOrXmKqMzxvR5CDxzXIxE/txvHbTNvRih9E=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=eplkXkbYo7bZMWXZmhQPEqM4FSPVGWHniJSNIo5IpNafsJZbU/GZKAL1xPEWuV5j/HtcwhOQ1cLVmHWuq5P7105iq8bvuX7p/Sp3UhEp3moJTnFhepAdSwO7ozXIF4qjlJMi/+FVxIfuiwEiLbB/cer2CMMuGu4LRj0PHQ9VGUaocmurSbrYGlnOLM27ZQanWTl3exh8kA+szGDcNA008QpTGCsxfURQwKqaAcXcxFmtxutepQiI9wcYcyF4cCHUsNdD7DI1J1+UfnH6HN1S4y5ZOz4GOZykEX21AwPFdlGYA7zA0bfjoNsip6SUBc0dXC+Tusp8ufhvsV3YKNcDkQ==
X-YMail-OSG: pUfwYCIVM1lj5kAFb91FVjcGeb2TUqP.RmXfA7Q1ZM1W9oq2qaRXvaYcLePsBNR
 epdP2uqD.1uHHvwmL9DVHHyGUzqoonWntpZ3tYSHJXf7c2Ef4lfGX0i2.cJ9NgmKCTrUETYjaaFW
 BY03BVoJ7l1sLkPDWmeOpoBSB7CglcQi5QKxYy8FimJqlW3xGRcdVLHQeeh5XrecMztvuHFligea
 y.AUMEbbr.BnWglG356nNBDVQe9fZKe6Man.IXrawg64BiBwnZRY3grU6JMo5.jf3LWE0O5U00uo
 zqZj6z22YAd_Ga7oVBAInpvvQf2r00MsfIKc8hBS_ZKPJKy5PFkJ_0vD_6HMkrD21fgSvNPndt9h
 XKRdX7XVyk7NCpexdWaxejlqFTHkpwkdvkgHOJylyuAqrmma3_HDN62gpmTcCi9OZxDRxj5mCdZk
 YQ09ttiM6Vj4qb9CGLFb5yTM7K5WEEvJ7H7i.09bBFGXM8alyaINxE7dHR86sO5SQeI4e0flWeKi
 ye7wE_LOWk2kvvhD_moAar6pbUJOqikLapcU3c.oKTgOKtAGZz3haJ4zN3VLtIqTNtN5w1c29_sa
 X0MFF0DcBvbN1Y78KJ3.lFdtlr935ps2MkeJFuUplni6OGawRV53DbBV31yufFPL1WVpk49e38gy
 o_9uaNLnIBenBozerUiR7H0T.6QkI98m8pM.0YOPh0zEDk0LPd54uceF_XIbIWJEbC90RgJaUPYS
 Ohr8.yBixAhDuHhrD__hVVrluOG1nQGTw6eJz740jvv5nKLmS1LuLep1YeJwQbIAbj6gfY3fEWUa
 HogGFNhGQ6zgEGzjrQbPNnHCrVNl1UJOJa4uSxftAjv2CsI3Uxt5TI0r0T6IkASQX1oh7uerAL3M
 x34QVMBY4VgATI6dz35by5I2Z1pDBsYDYj8q4Dx.WTooV85VDCST2Bt3U_p4Wefmer7B.1xT4q2U
 M2SR45cF2ZcKqUFlMmcoqQDTksil_Y7YJ_1S04SntT7KtGv5Iolzg_rjp9IpMyTb0gSalwoq8o79
 77RkuS8h5B00qxNqqwCyAp0FHO6cy6VsJ2uyT2OF2DsUomsK8vG31Ri9NcJAzq4v9pfZr0UvnSpo
 7Rr_oIa2FhwIAec84vPyjeMLZqgKeLQSse87s5SzpZETm1DwnC9Np8rDvSKfG5aoovoC9otj0acR
 YOSun6xNTqn7gSALXbR4wIdKWNfSiMXi4fEqfurGi5n1LCYsZQKZRvZ5yl6IeW7yrUXb9JE.F883
 qk18vStXOLui7JXDxyYxSUoSwv5LZ3jldPwPikArKP5PDL6aaUo4AdMzbT_ZEYdmvYWz7HV1NQsD
 lDqazezO5jQK2.l7rF3uKm0Mv1lBll8MWQKMDE1I-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Tue, 28 Apr 2020 05:23:58 +0000
Date: Tue, 28 Apr 2020 05:23:55 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <1693679742.27711.1588051435928@mail.yahoo.com>
In-Reply-To: <20200427070317.GL28601@Air-de-Roger>
References: <1359850718.562651.1587928713792.ref@mail.yahoo.com>
 <1359850718.562651.1587928713792@mail.yahoo.com>
 <20200427070317.GL28601@Air-de-Roger>
Subject: Re: Xen network domain performance for 10Gb NIC
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.15802 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64; rv:75.0) Gecko/20100101 Firefox/75.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Driver domains with passthrough devices need to perform IOMMU
operations in order to add/remove page table entries when doing grant
maps (ie: IOMMU TLB flushes), while dom0 doesn't need to because it
has the whole RAM identity mapped in the IOMMU tables. Depending on
how fast your IOMMU is and what capabilities it has doing such
operations can introduce a significant amount of overhead.

It makes sense to me. Do you know, in general, how to measure IOMMU performance, and what features/properties of IOMMU can contribute to getting a better network throughput? Please let me know. 

Thanks!

