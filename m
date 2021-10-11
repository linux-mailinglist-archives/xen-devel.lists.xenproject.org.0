Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7A4428E8D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206026.361486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvdh-00035w-P2; Mon, 11 Oct 2021 13:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206026.361486; Mon, 11 Oct 2021 13:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvdh-000349-M2; Mon, 11 Oct 2021 13:46:49 +0000
Received: by outflank-mailman (input) for mailman id 206026;
 Mon, 11 Oct 2021 13:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZvdg-000343-H7
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:46:48 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 686020e6-ae60-4548-9b4e-0c6d0f24a50f;
 Mon, 11 Oct 2021 13:46:46 +0000 (UTC)
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
X-Inumbo-ID: 686020e6-ae60-4548-9b4e-0c6d0f24a50f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633960006;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=B8t0ixYVPVkaVzVY2VdPfDaRDmCt7M63oL1S89UzT2Q=;
  b=Ll8iRcPDFr1Dz2OcoHZXvJ14DMhHfVFjN5/dPfYPoQjFtnSR991W2M+M
   2cAk2wFRZEKGjySazz6rAFXK/SKscNCS0uMEO5BQGdA9m6BX9KUNI7wvS
   ZPjGmEv8LvGwBYLpne2l/djKg+HeXXHp/0kpkSRXm1aMzMt9k102ebZNt
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KRA2EFjecg4zrBHmsTtBDpvNIviIdVnpGnzZJyWF+uSursHHoPp5jqcxdXYVplI3ZzXG26MjtY
 WDK4ltzaCRPB4SlQs4bavmm/n0flk14whtxJb6nahqAW/RMHnyPGaFPpee1ZSEP2uvztmEv/0t
 UjrsE/W9R1qkryeiy8SFKF4Jy1YqGuKDzNHAA5KBEiy8UG+bE6zL7M46rOZHq66RTTu86BbKtD
 ChYW6kVAbTqzyxrlNUX/OLQpAiA1yWZMR+gUfSxGAiH24lR4mhKzjiqzTkSRaZgk9AYra5ptqF
 4hVnOEtfR/ix2VvMRXM9OGAa
X-SBRS: 5.1
X-MesageID: 54859522
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IZgBzaBtoujR8hVW/1flw5YqxClBgxIJ4kV8jS/XYbTApD0n1DUBn
 GVOCGmDPv6CazD8etogPNuw9kMGu5fcxoRrQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX550Es7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/tBG5u/dYw
 e525cKxThwPZaLNmMYPXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvmauI4Fhm1YasZmLcz6P
 +g0VDFWYT+RSR4WBU06OMN5g7L97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSjQ8lPkwCgv
 HDX4G3jCzkTLtnZwj2AmlquifXIhjjTQ58JGfuz8fsCqGOUwmsfGRgHT2yRqPOyilO9c99HI
 klS8S0rxYAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCm3w6rJ50CiB24LThZIctlgv8gzLRQry
 V2hj97vHSZosrCeVTSa7Lj8hTGvPSkYK0cSaClCShEKi/HJrZsvlBvJQpBGGbSsk9zuMTjqx
 naBqy1Wr6Uei4sH2ru2+XjDgimwvd7ZQwgt/ALVU2m5qARja+aYi5eAsAaBq6wadcDAEwfH7
 CNsd9WiAP4mMrW9sAukSd42TO+o4O2jazLdgXx9EMx0n9iywEKLcYdV6TB4AU5mNMcYZDPkC
 HPuVRNtCIx7ZyTyM/cmC26lI4Fzl/K4TIW6PhzBRoMWOsAZSeORwM15iad8NUjWm08wjbp3B
 56fdcu9ZZrxIfU6lGToLwvxPLlC+8zf+Y8xbcyrp/hE+eDHDJJwdVvjGAHTBgzexPnVyDg5C
 /4Fa6O3J+x3CYUSmBX//48JNkwtJnMmH53woME/XrfdeVE2STl+UqaNn+hJl2lZc0J9zb2gE
 paVAB4w9bYCrSefdVXiho5LOdsDoqqTXVpkZHdxbD5EKlAoYJq17bd3SnfEVeJPyQCX9tYtF
 6NtU5zZWpxnE22bkxxAPciVhNEzL3yD2FPRVxdJlRBiJvaMsSSSoYS6FuYunQFTZheKWTwW+
 uX6iFyAG8ZfHmyPzq/+MZqS8r94hlBE8MpaVErUONhDPkLq9YlhMSvqifErZcoLLH3+KvGyi
 2562D8U+rvApZEb6t7MifzWpoulCbImTEFbA3Pa/fC9MiyDpjivxopJUeCpezHBVTyrpPX+N
 LsNl/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0/WootaNLyFNdnLClkUIAZ5PO2P2etNwmvZ7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbslXthAArP9CKijFv216NdnFQAb86spw6AZPwjlZ5wF91fpGBWDT954uCaosQPxByc
 COUnqfLm59V2lHGLygoDXHI0OdQ2cYOtRRNwANQLliFgIOY1Po+3RkX+jUrVAVFiB5A1rsra
 GRsMkR0I4SI/itp25cfDzz9RVkZCU3L4FH1xnsIiHbdHhuhWWH6JWEgPfqAoRIC+GVGczkHp
 LyVxQ4Ji9oxkB0dCsfqZXNYlg==
IronPort-HdrOrdr: A9a23:gScBX6n722zTl3HxyMNouY/0jQzpDfO3imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8vgZQpENRGtldBm9Ce3mm+yZNNW977PQCZf
 6hDp0tnUvdRZ1bVLXwOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mIryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idmrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6PDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amIazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCT2B9vSyLYU5nlhBgs/DT1NU5DWytuA3Jy9fB96gIm3EyQlCAjtYgidnRpzuNKd3AL3Z
 WCDkzE/Is+O/P+VpgNd9vpd/HHfVAlcSi8QF56Hm6XZp3vG0i946Ifs49Fr91DRvQzve8Pcd
 L6IRVliVI=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54859522"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy0Q7qV0Lt08yPyZCzWD4yKAguiporv9nzckH0hzqVtS1PaiitDf8Qb1nzin/ntEwuQAtyuzJC0dtAN7jvnHSWbps0nTnBUBKvfeKgD8kdChiMl+3dGm39AfECRjkSAE0M3SXYCdG5MsvmHberdhNAobgidBvsemyAH9dgoMcmTYHvevUSEUyz0h3UcRopIBkoYZttTG0Z5/q6w+EAeQhtZllYTl9Ia4CqutciM9a87b3zAjoRfOTW9i+x8zAaUcXVpWeJJkYdsi3QFycMpU+8T6Sb5T/tkEGaUecvWdLr/3kwXD9+7tqN6ih81WnMOuZ3OMBYHiypsX+jnoRmLe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT7gJfsCPOMGqFHw1s6BZbpetYt+I7JHu1N0hi6eXdY=;
 b=hFk6mXGSCTvR4/qpaT4d3n0NpRaNcH7mymOAv0XIjiCmRWTNKqsnZutF3k5i8U8fwBB0vMQ2Ze1Siv5JUxFc+8RsfC+3afr4nSj4w3jiVS6LNgB2yoS+p+NetgjRFAB4P2ZW+wvJf1uqTR2Cf2aGQIYETRsht4PsSfOgGaFdqriX2GvffzXcY9K7pOITaIcc0GTgEZONT7VBl4SSHmkAhED3DDu9t7RzyMOS6RdbATCu56h0TmRgFRzhxNB/531RLsegHt+IUGGnBghnxIpsvwdvgoIXkK0Yy9UXZQkKtaI4oZ03uAZTzRJssaLjflbTlBYSy//F4GlX0xNAhODrMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HT7gJfsCPOMGqFHw1s6BZbpetYt+I7JHu1N0hi6eXdY=;
 b=ViZgAtKzhLpWk6pgyUPn6tc+jcG+OxFvDzJfsBAt0DVvhQ+bs3keozGMNJG9zgzu3KJFwXeAAESlL0FiPRBQtDHf/jXzzbAg13FCDpg57Rni94itNQv18HtFWC3mEkWnHflIQWHcaH8AiK2JIC8tatpk74Qmf3vZbOp04y/ztbc=
Date: Mon, 11 Oct 2021 15:46:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
Message-ID: <YWRALXliogoE/JTA@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
 <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
 <24926.53690.621007.507249@mariner.uk.xensource.com>
 <294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
 <24927.7235.736221.270358@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24927.7235.736221.270358@mariner.uk.xensource.com>
X-ClientProxiedBy: LO4P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f2c92a2-17d4-41b0-5960-08d98cbd85ec
X-MS-TrafficTypeDiagnostic: DM6PR03MB4970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB49705BA8AF3F881A35A13C3B8FB59@DM6PR03MB4970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xVwlIZfVIuJzfDUh93NKDwzhI/7cktNljz/BUSsIE9l81KndIri69urhiXR9xySblVc+dTcS4SjtJ4sLz+Zj3PBc40XMe7LlzZ8+PN0tDAXD4rF8t/nPuj5oLt9zRUBv1dls4dU0tmhwEfr/ya8MaZ4Yr/EKP2kA8yMFvlnDO6wjPDnL6FOWH+tO3ZGFJLw2FYwCvXamGPpQotgX42WOXC4qp15D7hL143M1mlzYCaaNDEyH32och5VnZ+PglKWDiyUS9p5qUUWIiiNOM+/1XalQfsQgCEqB8PoXp+iGHyboLXBbDUfY75Iu7PYl7s/c3/OYsSE9f0ZnBEET9iUIxnK+juBBhDjxdmrFByLxMPQ7ptTAtdVFErVxxd1LowBK2+WQ2shjqw4GlfC6roOPR6NlfBOUYpAWJhOnAsPOakX78H3uHVQPy3hFEVhtXursyU0AKNa6Xy7gvUj8y0jQi54M5dJI0V4c18X9YwHaIeLG1xEn3s79/h21SK27n8AaaQJkJUq7N4qyS3KC3txSTorb6YMlPQKgU+FtpqFSFweyYh0LuXQFDIaO/8Vp+UT75w7mT7RkeVRlBlGZN9hRjSkGuHRfYyAtCvg67mKG5MG0Z2Ve3quXf5mzOAYgVVG3BeIBtbMh4gaSh4xTnOFWAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6916009)(7416002)(86362001)(4326008)(26005)(66476007)(66556008)(9686003)(5660300002)(6486002)(66946007)(508600001)(38100700002)(6496006)(316002)(6666004)(85182001)(8676002)(186003)(54906003)(8936002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVU0c2pDT2lWZFhibThMU1NYeFZlUUVCaXFiaEpsWGJZcXRaNWFKdEVaN0p0?=
 =?utf-8?B?ZjE2RW04MnEzRlZHVURTVmo2RW1xclc2U2EramVLRG1mQ0QyQVFwUUNEcjFV?=
 =?utf-8?B?bllTdWJDWUFET2xJdUpNa1VNcEcrdXdhWDRnL1I2ekVJT1dtc0xSTW1tVFJr?=
 =?utf-8?B?U1gyRFpCSnF1bzZlVGJobVgrem41S09wQUcyZStOUTNKMlo5VElzeDArQlpu?=
 =?utf-8?B?WkdFMlY1YU5YRDhZa016R0lWOUNwNDZzVHhaQkZ1bDMzYXI5bmhnV01iR0NX?=
 =?utf-8?B?K2thVnFzWkVPaGU2TVdIdVdJZm9SME01Yk9lS2ZmUEpUakV5d29jVjlpZi9Q?=
 =?utf-8?B?LzRHZE5wY0VESTZEOWVXM2xtQ3lQZGJqaEZibnp6eGlaeVBPVXhNMzhlZFh6?=
 =?utf-8?B?bzNmTG4xWmZEa1RNYzFuK0F4dHFmKzdKWjJUczNXWkZyNHdhRmJINGRnZG1k?=
 =?utf-8?B?OWs4ck5rUVQyVHRQZjUyelUyS2l5blRpUXdZdDg2YnozQWQ5N3hOY3ZraHNK?=
 =?utf-8?B?ZXVEdVJwaHUrem5DVnJENXQ3eWNHdUVTMGhLOGduS1hNYmxDejYwQzJ2ajdi?=
 =?utf-8?B?VU1wS3lkV3VCYVhKei93Z2pabDRUd0ZON21YQXVBN20yRitDbHBOVzN4VXRQ?=
 =?utf-8?B?R0ZIVUJuL2xoTzJqajQzVzMxdEY3VFdHY1JvMGpmb0p5anBFQzNNdi9MTnNi?=
 =?utf-8?B?TXVQTlpHaUwrcXFuK0NRN0drbXZhWkZqUmhoc0JwaFNRMEhQYS9wUEpQVk01?=
 =?utf-8?B?SDhEejhhQkJERVIwclVZTktOY0RCNTB0S1l0d0dZY0xkZUYzcUtUcE1FWVRP?=
 =?utf-8?B?bDBkTTlCNFBSQmZRV3ZYMGtqV1d3SDJQdHB5VGkrc2ZkMUMvK2NmZUoySVQv?=
 =?utf-8?B?dUs5MjA4RndlYXA4SXJOUklYZlowbUMrcktOSGtsaktsZFpuNW9DUUVqY1dj?=
 =?utf-8?B?ZVZGWlRzanl5d0kreWRZWTE4SDV5RkdGRjFvRGpYNVR1WFlzWmx4dE1pVXV4?=
 =?utf-8?B?NDd4Z1N4dlZLSi92bHVjTU1FVFpHcG5jVTJQaXMxSEp1VGpsdUxnLzN0Njg4?=
 =?utf-8?B?dnFSU09JVGo0TU1YVGI3TlFMZklWdmtGNVJScHQwcTZselBaZDJyRkFhMHVJ?=
 =?utf-8?B?TjlZK1Z5QWRVRGhBdCtXbUhjcm5oZTRTZXYxZThSdW5JdHJ4UmxWMUE3VWVN?=
 =?utf-8?B?Q0FnS1FQR3dwTXkwOVdDWkRuZHZiZkt6SUtxVHpDSEpoMzlnWFNhL1BzdFVQ?=
 =?utf-8?B?dzhZVDRXSWNWaEQwZmplaHp6U0ZqakNkbXhQUjBCaFBZY1BYRkZMd3VlOWtE?=
 =?utf-8?B?bEp0MEVsMWt6YWxYejBFVmM4QnQvWUF2bmtNNW9mQUhxbDc1UU8vaGJPbjIw?=
 =?utf-8?B?YlZZZ3FETTFURGFweWtMUkN0YlhDcFc2WlVEWGxuZm1iWk1lQlpMWTQrZngr?=
 =?utf-8?B?OU1DeWhYQ1JRNkRVOUw1d3hWZHNrY2t6Zm5ZVlhpdnpTQWFQc3pkVTNDbGlF?=
 =?utf-8?B?Nk1mT2dxeXFGZmxFb29OenhwQ2VPNldnMkhPYjVvMVgwaWJnTnE0NE0xSmxX?=
 =?utf-8?B?dkpjbXExUzRUbmNmK2hpQTZqYlZuTUVic1M0Q3M2blZvK0c5bjFaZGJLNzY0?=
 =?utf-8?B?b0Nud2xjeERIL2ZDSGhRZ1pocVV6RDB5aGhITUJ5dTFJMVY2T3dZdlVwODlK?=
 =?utf-8?B?cmVTUFJZTkRMZXErSkZFRGRWZjFmWWVSS0xWRGY5K3BjeDVJdmlXRi9XV054?=
 =?utf-8?Q?Itbrfjh0CP3Vw8Dxw8w6VdavtHJYIPKMLP1Sl31?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2c92a2-17d4-41b0-5960-08d98cbd85ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 13:46:27.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFRhbVSU8K2+U1ozT+nba1+CQC0e/2Wjzccwj1vAX/lwN9m2DHTJktaT/VTMui2/FlYizpmnQDFxH10nNLmQeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970
X-OriginatorOrg: citrix.com

On Thu, Oct 07, 2021 at 05:11:47PM +0100, Ian Jackson wrote:
> Rahul Singh writes ("Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in libxl"):
> > As Stefano suggested in another email that we can remove the vpci
> > option, if we reach to conclusion that we need vpci option I will
> > move it to internal structure.
> ...
> > Yes I agree with you VPCI is necessary for hot plugged PCI device
> > and once we implement the hotplug in future we will use the
> > passthrough= option to enable VPCI.
> 
> So, to summarise, I think the situation is:
> 
>  * VCPI is necessry for passthrough on ARM, whether coldplug or
>    hotplug.  It's part of the way that PCI-PT works on ARM.
> 
>  * Hotplug is not yet implemented.
> 
>  * VPCI is not necessary on x86 (evidently, since we don't have it
>    there but we do have passthrough).
> 
> So when hotplug is added, vpci will need to be turned on when
> passthrough=yes is selected.  I don't fully understand the other
> possible values for passthrough= but maybe we can defer the question
> of whether they apply to ARM ?
> 
> I think that means that yes, this should be an internal variable.
> Probably in libxl__domain_create_state.  We don't currently arrange to
> elide arch-specific state in there, so perhaps it's fine just to
> invent a member called `arm_vpci`.

Seeing as we might want to also use this on x86, I wonder whether we
should allow to specify a backend to use for each passthrough device,
ie:

pci = [ '36:00.0,backend=vpci',
        '36:01.0,backend=qemu',
	... ]

In principle we should support different backends on a per-device
basis, albeit if not currently possible.

Iff we have to introduce a new struct member for vPCI it should be
shared between all arches, as it's likely x86 will also want to at
least have the option to use vPCI for passthrough.

Thanks, Roger.

