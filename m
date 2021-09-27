Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DDC41A0F9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 23:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197188.350156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUxl2-0002br-P3; Mon, 27 Sep 2021 21:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197188.350156; Mon, 27 Sep 2021 21:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUxl2-0002Ys-LP; Mon, 27 Sep 2021 21:01:52 +0000
Received: by outflank-mailman (input) for mailman id 197188;
 Mon, 27 Sep 2021 21:01:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g88l=OR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mUxl1-0002Yi-1q
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 21:01:51 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b7949de-3884-48d0-b34e-f56c2d8194c5;
 Mon, 27 Sep 2021 21:01:49 +0000 (UTC)
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
X-Inumbo-ID: 3b7949de-3884-48d0-b34e-f56c2d8194c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632776509;
  h=to:from:cc:subject:message-id:date:
   content-transfer-encoding:mime-version;
  bh=T9zPLtDbhZa8cqsLzs9J9E7mUk9bKUS79E9/0KA/6kg=;
  b=AVVKh5Wz1BrPqri1fS3xxGjWNTVlrXgTBOAgHcyUPZVa7cLrUwtwrlq3
   dJ1Ca+f3acNXUe0aG6TE5JmQ8Ua8FUrJARcwtmPDWEctY3YC9H22K29wJ
   6G9OVHKs5QTzBlwSFnjL1pij6Cz7jicHy6/da1Mzbqz0ouYDNrgDCQyRu
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: POfzMSqZQxv3ibjBPQEmvpjMgroqr3ov2YT0WxncigJ1IL6SxRjyr86AFUQtDITMdgXho5P8Pm
 2/r0ZawD+aTJCcVC0gvI3h69bAmd135OsKsYc5m2KrFgA4bh2/kdosDHBE1rhLV4nB9UAUE/6Y
 Lv8h1DDCMQTMLLTVM9USHe+s4yxFSTjBKT9UsB9s1qvrsHV4R7oqPu5LU54UyK09cDA1ckXSyO
 OM81zBjCNzNUVvLORPGOgKGh4w38hYDZYsw5mdXU+LDQZdzFgw75MEaeXlKnQ642HlQiJrPfyf
 pf2SX+HvVTaDVSMfpsrTEvjv
X-SBRS: 5.1
X-MesageID: 53352501
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uCNQGKDcn+x2oxVW/8Pkw5YqxClBgxIJ4kV8jS/XYbTApDp2gTIEz
 GtJUT2CPqyJZ2CgfNklPYmw8k1T78PUyYUyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w0007wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jRqykslWm
 c525I2dFCo5AZyVht0fekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFh2xt3J0WRJ4yY
 eIHbyAzXS/kTCdUN05KNawMjMKqjWLWJmgwRFW9+vNsvjm7IBZK+LrnPcfRe9eKbd5IhUver
 WXDl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77nMXIA0bUx28u/bRolK/XvpPJ
 kpS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9imL5ZHZ+iHIHVNVXxMcRcwZhZYofD4Dg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNfvYC88dhbYgbnC4Y7SfHp3rUZDBmqm
 1i3QD4Ca6L/ZCLh/4u850yPpzuxqpXTQgcx6207tUr+tVghNeZJi2GygGU3DMqszq7FEjFtX
 1BewqByCdzi67nWz0Rhp81XQNmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hSJ5l0BvsYJYCLxBUOSX25XI59xpUQHPY65Ps04k/IUOsQhHON51HsGibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLsL9rxJYQDn3hkrUuKHMiT503+jdK2OS7EIZ9YYQDmRr1os8u5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BSJgWM+q+5AJLL7rz8gPMDhJNsI9CIgJIuRNt69Uiv3J7
 je6XEpZw0D4nnrJNUOBbXULVV8ldcwXQasTMXN+MFC29WIkZIrzvq4Te4FuJess9fB5zO4yR
 P4AIp3SDvNKQzXB2jIccZii89AyKEX13VqDb3i/fTwyX598XAiVqNXqSRTiqXsVBS2tuMpg/
 7D5jlHHQYAOThhJBdrNbK791Eu4uHUQwbogX0bBLtRJVl/r9Yxmd374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjCCv7isNCTc8m6y+qN6Ub6FLWLHSWf52KS+f
 uEJnfvyB+IKwQRRuI1mHrc1ka9nv4nzp6VXxxhPFWnQawj5EatpJ3SL0JUdtqBJwbMF6wK6V
 ljWp4tfMLSNfsjkDEQQNEwuaeHajaMYnTzb7PIUJkTm5XAooOrbABsKZxTc2jZAKLZVMZ8+x
 bZzscEb3AWzlx42P4vUlStT7WmNciQNXqhPWkv222M3Zt7HEm1/XKE=
IronPort-HdrOrdr: A9a23:9OqVB6oJTi6Ut7rs6mef10UaV5u/L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBThHO1OkPUs1NCZLXTbUQqTXftfBO7ZogEIdBeOjtK1uZ
 0QF5SWa+eAfGSS7/yKmTVQeuxIqLLsndHK9IWuv0uFJTsaFZ2IhD0JbDpzfHcGITWuSaBJb6
 Z1saF81kWdkDksH4iG7j5vZZm2m/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZuA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQPZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv2nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLbU5nghBgr/DWQZAV2Iv/fKXJy/fB9kgIm3UyR9nFohvD2xRw7hdQAo5ot3Z
 WNDk0nrsAWcie6BZgNc9vpevHHeFAldyi8eV56EW6XZ53vBEi93qIfwI9Frt1CK6Z4gafbpv
 z6ISVlXCgJChrTNfE=
X-IronPort-AV: E=Sophos;i="5.85,327,1624334400"; 
   d="scan'208";a="53352501"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlLiULX0gt1APS0lRbxARHJFUMUcrW+Ncn88jVSBXWHqGhyUUPrGp4ANu20TM3J2gDciiaD4TnvwnprZlX3KwyLglgSwhXzbeMX1MkzENDtY+0tVcjeiBMom27y2cRj0RTE1AvNvy6LMrGhYuqy7xXGRE3Z0/hH1DjlfxPtIeIddphABdnQBo7wKgYu6hULj6hWDMRwTLucDzytw+bEdXC8yleT8lHiPyc3lTnmn5gzXcxfzOnNRdAWIv2jcj4S7ptwHiHlPIbRVujqIBEIXFkF9ns1t14C1WGog2ohG7GmfgmzLEhTYz5V+9kje+YGVbj/pu5Axm46pz5K4Rh9q6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=T9zPLtDbhZa8cqsLzs9J9E7mUk9bKUS79E9/0KA/6kg=;
 b=iIwGhLZ3mhUTnHl1mr4/sKWgaXRy/uWBTATFhDPC4uuOigU03SpML9Dh0lPh9IEh/TvwMpBQ8o3Ixnw2KsqDwMOLLXHnCrXK3SPlW3dWBuZOSDLwLjBTQw5QISocqPQ0oOcwd+DF+HiD9eSHrLuUevIs9RpIroA5Yt7f0d/MJT/WfOjImqinyHyBz2JmBU3ODnupmAVpE2ru4iZMrMeTV7sDAASY97ZBxxqpWt3Km5uI6nQkv+p9tfoHwHsn8WbtAklc3w5YKHbcG/D8dWH+Q3m5P9K2/QOIUyfgoHHT8OswbIDzRWVAScrIjWG7KBJp3o9k4zwAIFRofkISIbKc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9zPLtDbhZa8cqsLzs9J9E7mUk9bKUS79E9/0KA/6kg=;
 b=fKTuiXN9zQp9IXYbHae1L0tVbcBT03zTA05bHptbrC9gqo1ybX+RkRlSW4Qg4Qv792hQ4h2HRxcCSNV+JkyAP8CJgKLGOSE9U7nlrA5GMkOx+ovy7MsBhSmYgoh+W4s0SgiEs8aefn2K/t2RDkeTrtUZ6Z2t5zFrSl+A9/rwUng=
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Semantics of XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION
Message-ID: <13e3368d-89e3-360b-36df-bc215227b7e3@citrix.com>
Date: Mon, 27 Sep 2021 22:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0386.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c556677a-0b7a-495e-b8bc-08d981f9f2c2
X-MS-TrafficTypeDiagnostic: BYAPR03MB4680:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4680C710006E96AA293E160BBAA79@BYAPR03MB4680.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9Qs1rI3QdeGLQb084h9L4U1bnzlqob9gQujo1EqQxwyPvGxWohhDiooGhMMPOH7m3mMTd4KfSxBswtO3CYmL+F9482pg3xxa4RqPSiVIDIR/omnI44wxpE2K1lZ60FLQrN1znJzPvS9vvuVSyiCTNx9ztymIAfWcmnOoj2m4wUP2qodq66uOz6y3RxIQs7X7GnckMUYTmM/m49BYitaJ7DgCtJpvylqtFx2NA/6bDNodBCXMeHBvkSccPQBc5AtVSSl15jO58WYQsAwUz6+1MLA6QSBLK8I89PzZ8kXRMXkvblvUZFFWwYcLIAaauaq3YV4wj7uy2Tf+hwO/T2VDWInoy5pzqnRdOGeUhfC8FiJPKI/gz09/jkiTbDCNA5OZivVFdaNpZLlxhCrR7GkKgKjA0xBmrN9AznLl2h8oBBb83kAQ4KdV4xiNvsa543irK4AnllugU/pJXwspx2uyd2JcOBpqXeGLDeyZ7S9wBsDmsStmTaGtzGDgFCG1cG9zmvl+6glgu+n7MBCNr+wcZtZMkx2w0v1zUhkHKmAaZIudS5CHRKYbUncwf7k/LRxNR1oOq5BKtQ2UCtTkBOo2dMsCYp/gkUz20Ird3hENT0jv4Ofj2xn/+XCaxouKXbgsIx8B/VMhGCav2RtImtu4bG783cQU0RwUUqzzWs4mYXSO9rAIoW2U76BpLa9ehsVHWJipVQ+p9MxGfloqISpLUnlxbRevq3JXw6Osl/+qhI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(54906003)(31686004)(956004)(6916009)(8936002)(86362001)(316002)(4326008)(83380400001)(16576012)(66556008)(66476007)(6486002)(66946007)(38100700002)(31696002)(186003)(55236004)(6666004)(5660300002)(2906002)(2616005)(107886003)(26005)(8676002)(7116003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExaM0NyZm1yUzZTYmhZUTN2aWdoU0NjUHB2ZmZoOEdVR1ZDeHNINE9HMmRr?=
 =?utf-8?B?TDRxdGNKRzZ6a2I3eTZuTXc3aDV2QVdha0s5bzF6RnQ5UjV5alhReW1oMk03?=
 =?utf-8?B?WnZuNXA1dlJPenJtV3VpVUVnK0d0Vi9Na0xuVHZyQmFMcU1GWHY3aE8zcWYv?=
 =?utf-8?B?MDZNTThBZkdXU0NRSllsRHovYWNnbVdtZHJudDlxbHlRckNBR1dnVHFGOXBU?=
 =?utf-8?B?aXpzdVZzRW40ckpIOVFmZFllRjhMTmIxVXlmdVRLL2Z2aTRKT0g0S1B3bmJP?=
 =?utf-8?B?K3NrSUR6TGlFaU0yclI0OXM5d0tZZExWZFBXTFRlellPUmQ1Ylo2a0RaTVMw?=
 =?utf-8?B?THV1cHdFUVd4U2FPcGV5aGdZc0xCUTFvcW1DNXMrMDJod1VmUmhFd3gvQWR2?=
 =?utf-8?B?Qno2Q2d5enhGUW1SZTBuTEU1a3A3VllXZWk1NERwWW1SM1BQZlAyQi9taFRn?=
 =?utf-8?B?dFE1VzQyQVU0OVAyN09yVm5Ld1lJVHJlYnZzSks1UVcrWWlJaEJvalhzSkY0?=
 =?utf-8?B?OHFxa2RFVGRGRWx0UkgwSmEzdlUyci9VSWoyV2o1ellVTm1BUDNib2pkYStv?=
 =?utf-8?B?aktTVzR5RVhGR3dwNEk0M0N6NVVlL1BQNDJwV1BlNzFBUVZUY283N3BvM1hK?=
 =?utf-8?B?WHo3VnZlM3k5SXRwbUhuRTBpeEEvNlJzYlFCVmlGQjZ6cmFJcEFGSy9EZEpp?=
 =?utf-8?B?UzVqMkdDZjNGbHBtbVVtSkU0L2lSOCtLNVc1ZjQ2dngwUkd0RzNYd0ZVaVd6?=
 =?utf-8?B?OHI4RGFrL0pwOFNnQWNvMVF1b2hhQk9xUkJET0IzM291Qng0OGx0dXJFOHB0?=
 =?utf-8?B?aC8yT0F1RjB0czZlelBmNGZRTC9CaVlwTWFMY1VqSjlJblJ5c283a1gyeVZI?=
 =?utf-8?B?aytscXRHMC9oWHNiUWdpbjBlanNGVnEyaWo0N2NObWd1Y3hIeFNod0JRV0xp?=
 =?utf-8?B?VDlvcHpLaFVObEp1YUJsMzZPTzd6TldFWXJIOEx5Qm9nN2I4dkw0cWJaNll0?=
 =?utf-8?B?U0M0WFNKa0lIdFFncGwyS1JhMGRGSW1FZkk1V1FNOXUrZHlZUlFQbUM5L1Q2?=
 =?utf-8?B?Y21BWHUxaGtJL3dSOVZnbnpaeGNGVGIydTFNb3p3d2x5UVRHTStuWXpTZGt3?=
 =?utf-8?B?QjZxQlU1VmVQV0xENVF1U05pbzM4QXZVV1FTZWhWd1d6OU90U1p2VDlVd0Jm?=
 =?utf-8?B?OFF2YlRZdDB3WlJoTlZtNDBmWWYyczJMZVcxOUhqM2ZoNGYzNm5BNWxmMysy?=
 =?utf-8?B?SXZEaTR1U2pOeHUwdHdlRUR6dkorSWQ3dWF4WHBrWW4ydVpZRWRXK2hSMWZa?=
 =?utf-8?B?UFJkbUExd1U2M043SEwwZ2xwZVROaDhWZVpmU3YrMzh2YWczZUExYnEyVGov?=
 =?utf-8?B?b1d6U2s1cEpmZStETzlESXJocVNIbzlqZmdLaUovRHk4REJWdUg4M0NZY3ZD?=
 =?utf-8?B?bzdIQVR2Skx3QnVid0lnbFZ4U0FxdTNpMS92Yy9MOFJ3bVpVc2NiV2VNVG1K?=
 =?utf-8?B?cmpiaVJPQlJzRGp2YnFWcjVRM3JlMVB0K2t1bUp3b1g2QWNWTWZKRGNlbFNC?=
 =?utf-8?B?VUduMjhkV1ZLU3M5Rk9uSTVIenhXQXQ2OEg3aGVZZkxnT1JRSFRXRWxERnBr?=
 =?utf-8?B?N1FCcmNJMDM5TWxLYUZ6NHU5d0VSTlJIRm5jbkU5WE1KU2daQ2gzWGVUcXR6?=
 =?utf-8?B?blk0aW50TjBkSytlUFFQb0w1VFZIYkhYbUdPRFR2YWJqZmY5eVVJNUhBdWdt?=
 =?utf-8?Q?3+tld0xhwJUJJXUd6lSbThaMV+BsO+xFrmXAU0i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c556677a-0b7a-495e-b8bc-08d981f9f2c2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 21:01:17.2271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUy1Xp6oQo9qLc/SSEveZTQ9EvJ4hvo7ZfScgPk2bgKDM5qri5anyrR+lBBAr6xnko0d0F17LE0VjZJD2wsP6rpY7syzMd+OpRQI4b11QQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4680
X-OriginatorOrg: citrix.com

Hello,

A recent ABI change in Xen caused a total breakage under the Xapi
toolstack, and the investigation had lead to this.

First of all, the memory pool really needs renaming, because (not naming
names) multiple developers were fooled into thinking that the bug was
caused by a VM being unexpectedly in shadow mode.

Second, any MB value >=3D 0x1000000 will truncate to 0 between
{hap,shadow}_domctl() and {hap,shadow}_set_allocation().


But for the main issue, passing 0 in at the hypercall level is broken.

hap_enable() forces a minimum of 256 pages.=C2=A0 A subsequent hypercall
trying to set 0 frees {tot 245, free 244, p2m 11} all the way down to
{tot 1, free 0, p2m 11} before failing with -ENOMEM because there are no
more free pages to free.=C2=A0 Getting -ENOMEM from this kind of operation
isn't really correct.


Passing 0 cannot possibly function.=C2=A0 There are non-zero p2m frames by
the time createdomain completes, as we allocate the top of the p2m, and
they cannot be freed without the teardown logic which releases memory in
the correct order.

In fact, passing anything lower than the current free size is guaranteed
to fail.=C2=A0 Continuations also mean that you can't pick a value which is
guaranteed not to fail, because even a well (poorly?) placed foreign map
in dom0 could change the properties of the pool.


The shadow side rejects hypercall attempts using 0 (but can be bypassed
with the above truncation bug), and will try to drop shadows to get down
to the limit.=C2=A0 This represents a difference vs HAP, and in practice 1M
granularity is probably enough to ensure that you can't fail to set the
shadow allocation that low.=C2=A0 There is also a reachable BUG() somewhere
in this path as reported several times on xen-devel, but I still haven't
figured out how to tickle it.


There is no code or working usecase for reducing the size of the shadow
pool, except on domain destruction.=C2=A0 I think we should prohibit the
ability to shrink the shadow pool, and defer most of this mess to anyone
who turns up with a plausible usecase.

~Andrew


