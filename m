Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD284D3165
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 16:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287922.488238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxqR-0003yu-9q; Wed, 09 Mar 2022 15:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287922.488238; Wed, 09 Mar 2022 15:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxqR-0003wL-6i; Wed, 09 Mar 2022 15:03:19 +0000
Received: by outflank-mailman (input) for mailman id 287922;
 Wed, 09 Mar 2022 15:03:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRxqQ-0003wF-5p
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 15:03:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b4a7872-9fba-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 16:03:15 +0100 (CET)
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
X-Inumbo-ID: 0b4a7872-9fba-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646838195;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Rfkgl5pbtknnHgpCb817qfNCozg44OusL0wK0zpm8o4=;
  b=JogTApOnlPxZYLcjbJ9NOJdMCPw/iQpHw3DR85Q2pagG0lCx3JwJDbiH
   3QC3u03vLyU7sJxjb2BNoIoiRZycwUunGSVnae2vtePNzN5L25i40vMgZ
   IOfzTNA0aZ9MCSeOJyirJSnJcy5PB0BOOy03QMgE8UwTHc48q5pwtYsqO
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68179361
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WMjG06CHiWF5phVW/xfjw5YqxClBgxIJ4kV8jS/XYbTApG9x3jIPy
 mEaXT3SMqzeMGr2eowibYq080JQuZKAyNFgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhqi
 8Vvl5+zQDwMBYrnwMAXcyRzPzhXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGjG5v15sQRJ4yY
 eI1YBU0XSvxRiF0M3MxGsgUv/+0gCfgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ7eV2iVeewmgSDhw+Vlahp/S9zEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiHyZuh8RXfJAHut87xuCopc4+C7AWDJCFGQYLoV76olmHlTGy
 2NlgfvyRixNkr6WQEm4zZC/9Re4GRU+AXYrMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdu12PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnvNOzxjxpmGGeF6bKKI3XH327zk5JEVdoMiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SYq6CKyOPoYSPsYZmOq7EMdGPx74M4fFyhRErE3CE
 c3DLZbE4YgyUsyLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCX9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXm0Q3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJINU0wf4Kyr+Wo
 hlQmCZwkTLCuJEOEi3TAlhLY7LzR5dv63U9OC0nJ1Gz3HY/J42o6c8im1EfIdHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:a3bJ36ifCFgVuVc2UCBiZfasWXBQXzR13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykKsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JdDpzeXcGPTWua6BJc6
 Z1saF81kWdkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87heYAotd/lq
 H5259T5cJzp/8tHNJA7dg6MLmK40z2MGTx2TGpUB3a/J9uAQO5l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="68179361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6OuQV8TktSazQ6BFZDGYd3cujhd0ZD3pmuUu1cSuopx1BML87/gtoZky0StvRdOZ8einYzI8wDCzBENI2YzmsgjlIUClDUg1+j4Ll31hhqRiT0DNiuacja9Gk/sHxEyS7BUEQHXqIGfiQHTR2du/tyFrl+3hXecvw5TveeEKr4xc3bC/giiJc2XNl5iRRzW/Bc5reBURk6MZsVSa3GAa5id/keLheCjCQ1YlXj7M/KbrsMVh+QRgcMd/gDI5anAuahWKQjRjO4ihGs3SV+xng18Bhavnqtwx/auRvR3f5e7jh6fzDTWAAVGUF4tGftm3YZkuASD7boZasBeG/48BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+vAzNBy6urDMsrnB4U3tX+JhRiocWedB//5xLBc98k=;
 b=TCLgNvmK2Q+2pd80mIIbsujKqBqO09HwmFeztjRdaHpBDH08dmkjH0H0vGubqvKDNHW4CC2YFH7jdn4y4OvV8iAW2wP1p9RQdmk4YmVGp1z2NhuZzRBRIQz+aorXVjxr9LVnRuBmA6QJzpxQZQiYp1o/jWQilizDafTGyXfTqTt+WPTmhDkdqnhAi4CDAIc10yxALR4qd/GVfZldaatv1sVejheBDfMI466Evcao22oEd1t4YTHOTwBfxpKluZzemxB67XLwsCRw0nybeGi7eKvxrpjO1xZ6eI2Rh3DaESHBTBgIDzg5Df6TIedbn584EraoBPMapbvK/g7nUSAwYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+vAzNBy6urDMsrnB4U3tX+JhRiocWedB//5xLBc98k=;
 b=cyMTUSkRxAkTrjnmZH1IjFOFip9I65ds0HHwiLn8JXdRD5yRVJ/qvVgOxn+SFj9arK1Y0jYll5ndX87HPZuz5K6Sa7UFpgoB99aGSg+OpFenUY0WIKpB2Ef9n6+oM9GpQumyRzr9AbzzoSsWWEldxfoCt+2+bsAqC4GP76DN+pQ=
Date: Wed, 9 Mar 2022 16:03:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on
 top of SPEC_CTRL
Message-ID: <YijBpyOlmTA7tIUl@Air-de-Roger>
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-2-roger.pau@citrix.com>
 <8e7f3193-dee6-1ff4-0c68-081032e240d2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e7f3193-dee6-1ff4-0c68-081032e240d2@suse.com>
X-ClientProxiedBy: LNXP265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08e21687-8a77-49db-74dd-08da01ddec10
X-MS-TrafficTypeDiagnostic: SN6PR03MB3968:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB396863BD4AC7DCA4673C14958F0A9@SN6PR03MB3968.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g4aopYaLxv/9iQlhbAAJeCO8Yy44vpEkCupERwGLq4cO7aEuzVWStNlvoYT2VD0Jkq2PTNgrLu1ba+qvwJaVLZjD+lxxZNKHtcHr7ap+yB2LjiBAb9GpYhqR2lZpODf8fpkJRGs9CqTkPqK3GxlWXgVRVYG0aPtBnjgkmdNa+iyAmoHNkd6hZYG1RncFVChCsONubNFgMx3t1KYBKtS/VEZYB6Nii6H0vFVpkcJGIwPo0LZbmGeUuAbArnmFXRfURpwOaXiKTHAfH1OJPdR9fzhm4ZEQeejxD9ixWpbPrYy2ecFRtxpHgW6ShX7oCR2df9ani+5u2cJIBFa0jyp8DVr/GxOFQfbEzjiHXmGoknJ1wdIRcCS5wxC3K3aVTvOtKUETASKWvgkgQVwyLoCYpXtJO2hqwcI6kOfv1wdq/9osUqiGm3LFmFuJkcQe5iRBs6bcf6uq/sZmvxD2Ou1NkcxqrCRwY5W+XkPPLl1mLQelmZhLp7HJVHKKuD/K60Y6qKMF10k3qQz8zteY/5C2j3O4WuYNM09A9YkwQzpFEEkz2RLqCQ1awDd8U6xEyN4rNNcOLRwEAz0Y08kaQa7m0NZMsJMxez0EOa2ZhDE8OtzOJZfry8mBSsshHZ2khDscOzFQv3kA/nGHtQ836zBCrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(4326008)(66556008)(66946007)(8676002)(6666004)(26005)(83380400001)(86362001)(38100700002)(2906002)(66476007)(82960400001)(5660300002)(8936002)(6486002)(6916009)(6506007)(54906003)(85182001)(508600001)(9686003)(6512007)(316002)(186003)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjEvSnB3cGIwQ2pZWGs4L0ZuNGlwWHBMV3JLRm5PTC81M09vM2ZBaGNjQU1j?=
 =?utf-8?B?TVUzTGloWmhWbmVVQ2xtSk9BQUVIZkRuNmgvL3ZuaGpCTC84ZGh0cVNZejJU?=
 =?utf-8?B?OU5MNk9tT3I4SVNlWklySGh0OSsyV0dzeFArZlZiT1B0VkovSUpMUVlYTzhZ?=
 =?utf-8?B?bnZ3Z2VCYU5kVGRmUlN4TWozNTV1c0prWDFZaSs3Yit1RXRwVVlSZnFEQjZu?=
 =?utf-8?B?K0ZnbXNjakJuTmgwYnRaeWdaMFdMakViQUErOElaSk9RL3crY3VjeFdKNUlq?=
 =?utf-8?B?TlBzYStDd01CWTJmMlFPREVIUU1sSmhUM2JHM1Bhc2c1S283SHV6TlF4Ly9F?=
 =?utf-8?B?cVZDaHNzMVEzODVsQ2QvRERRN2ZWWDB3U0RHOWRNcmpkdkdacnorRmhHa0NN?=
 =?utf-8?B?TDFFZE5xcWVGOHZBVUluM2t6U3I4LzhJdTVCR212aTFHOURkaVN1dXo0TXZh?=
 =?utf-8?B?VC92Y0FrYVdRNUZuOVNXOWQ3VG5IcTF0WWdBNXdoeFBOYVNWYTJTZC9nN0pW?=
 =?utf-8?B?QXZLcGNIR2E3MDlyL053dTFCM1JYV1V6cG1zeTdxOEVjSFJSRXhDZ1NiN1lM?=
 =?utf-8?B?VUVmbDNlMzFOUnp0RjdNZWI4ZXJDL0xVOWhWUHQwakRBUHJzOSt2bHBGemVz?=
 =?utf-8?B?MDlIcHhkL2R6UFZLcVlvRnQrYzFuVVBEM0VxWkZ2Y29sQ2JrdmhDN2hhN1Jx?=
 =?utf-8?B?QmJLU3kwdmJhSVRIQjNvUGNKMVhTUHdLYkRneFZWMVd5bHZWL0tYbW15Z1VY?=
 =?utf-8?B?OVExTUxtaHBlSEVSZG9mU29xdjJnN0grYkhmbTM4aWNISEhrNTNVUHFhOEhv?=
 =?utf-8?B?WTlrVWNmbTN1YVBIVkc0T0o0aXBYR0Z2YlBidHBpaEdqTUhFRkF4WE5peVIw?=
 =?utf-8?B?VjN3LzZuNGlFRnJVck9heEFnZm9yNTFuMlY4cHNrK1RxRERpNi9VdURzRGhB?=
 =?utf-8?B?ZVVNbUxMSFI4SHpJSDRqa2ducUFEcVBmVUErSFNvWDBwUkJUT1FrNkxuSTZH?=
 =?utf-8?B?TmFpK0xkWCtBRHYrbWsxTVl3RkNtblVpZVVHZXJGV0Fta1hyZ0JDVUF2Rm9w?=
 =?utf-8?B?VUtXamc5YmMwenNqN0J2Qjc0TFJDeDVWNy83UmFMWTVxdWtRUlJCcVI1OW1J?=
 =?utf-8?B?THQ4TzR6VFhzZVNTVk1YOERORVdnalAwT3EwRzE1aUdKNTk2TFRieXNQZW9H?=
 =?utf-8?B?NXJHbVMyZTdSVHZjNmNVaExTdlJYQmgxRjd5N093TWJNYXRYcVpUUVdrNktI?=
 =?utf-8?B?aTBidmZ2N0xRT0MzRDlTTmZtWWM2ZE1IZTFxaTR5VVVwYnhmUUxnUzczL3Ex?=
 =?utf-8?B?eElUZTBTQk1QRTJFdnNBd0FNU05rbHpKbFkyUzRRc0w1WkYzODJweDIxd2c1?=
 =?utf-8?B?M0E1b2xBTlZNdm1ZZ2ttaWEwUFRZem5DQ01SNWliMFhwWXFoSzJ2d0RLSGZJ?=
 =?utf-8?B?UVpZT0FjQVVhN3BISHE0YXpEUXhSNGNSN1dyR2RVU082Y2szb21YVm1JZTRm?=
 =?utf-8?B?NXBaTzNVNHZXdHYydHhpblZ4SlpqM05RZC9xeUhwUER2cmtNdnQyU0s5ajlu?=
 =?utf-8?B?d0hVMjZlN2RTbTlFYUZzcUtSNE03QjUyK3dGRHVuNkpvZUFkVXloOEk0OXdR?=
 =?utf-8?B?U0cyamxuM2NRSGZ2T2RGdkprY1IwN1RvRmRKUVRVRG1ZYll2aEptYWFLU2Fs?=
 =?utf-8?B?dmc5QjRGclgvR2lMT2I3aFJWbUhyTWJiS0M1bzFEek9hNjB2NTNvUEVaU1Js?=
 =?utf-8?B?dEM4MFJGVXpDWFFiOXN3ckh6OThIR3V4a2tic3R0aE1OOUhzQ0Q2UXlOV1NE?=
 =?utf-8?B?ZlZTTFpqeEtkdWxRckhlcWd2a3FzWXBCbmhFRVZjRVExWnpQRnNxZ2NQTjky?=
 =?utf-8?B?cVBqVi92NUtHRWk1QVRMMDEwMXlyNGlhMnZFdE5XTWtYcDdOM3Z4dTdrUXNU?=
 =?utf-8?B?WHRlL0hPaWNXRmtXODFlRWJqQ001V09uVWZaK2RmaXY5aFF2RUFjUnZjTkda?=
 =?utf-8?B?bkM4SGhDWVd1UUs2UVJyYUwzWGJKMWVWdnBSMHV5eWpQZDJXN0lnZG1BODNB?=
 =?utf-8?B?VVFDdFVqK1BxZ2VYSFFPMko4UU1jaXNSVjk5TTB1T2YxTVAwV09sdDJ3YjBp?=
 =?utf-8?B?NEE4ZUlrTHBHM3VxeVBGM2lEckp3eE9ZcEdmY3Y5ZkJYTVI2NUtBSElGOWo0?=
 =?utf-8?Q?I7EUiQMPypudbuklagr5IoU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e21687-8a77-49db-74dd-08da01ddec10
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:03:09.2509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yShx9DOGh7hwx+dLooryfYoiZvlYQvvSva0M6b1gHwmr36Pjil9DxT6K5qtWpD2HB98A/UW3xSZOzWf1aTJ1AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3968
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 04:07:09PM +0100, Jan Beulich wrote:
> On 01.02.2022 17:46, Roger Pau Monne wrote:
> > Use the logic to set shadow SPEC_CTRL values in order to implement
> > support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
> > guests. This includes using the spec_ctrl vCPU MSR variable to store
> > the guest set value of VIRT_SPEC_CTRL.SSBD.
> 
> This leverages the guest running on the OR of host and guest values,
> aiui. If so, this could do with spelling out.
> 
> > Note that VIRT_SSBD is only set in the HVM max CPUID policy, as the
> > default should be to expose SPEC_CTRL only and support VIRT_SPEC_CTRL
> > for migration compatibility.
> 
> I'm afraid I don't understand this last statement: How would this be
> about migration compatibility? No guest so far can use VIRT_SPEC_CTRL,
> and a future guest using it is unlikely to be able to cope with the
> MSR "disappearing" during migration.

Maybe I didn't express this correctly. What I meant to explain is that
on hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
policy so it can be enabled for compatibility purposes. Does this make
sense?

> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -2273,8 +2273,9 @@ to use.
> >  * `pv=` and `hvm=` offer control over all suboptions for PV and HVM guests
> >    respectively.
> >  * `msr-sc=` offers control over Xen's support for manipulating `MSR_SPEC_CTRL`
> > -  on entry and exit.  These blocks are necessary to virtualise support for
> > -  guests and if disabled, guests will be unable to use IBRS/STIBP/SSBD/etc.
> > +  and/or `MSR_VIRT_SPEC_CTRL` on entry and exit.  These blocks are necessary to
> 
> Why would Xen be manipulating an MSR it only brings into existence for its
> guests?

Well, that's not exactly true. Xen does use VIRT_SPEC_CTRL (see
amd_init_ssbd).

I'm unsure how to express support for VIRT_SPEC_CTRL, as it does rely
on SPEC_CTRL when available.

> > --- a/xen/arch/x86/cpuid.c
> > +++ b/xen/arch/x86/cpuid.c
> > @@ -543,6 +543,13 @@ static void __init calculate_hvm_max_policy(void)
> >          __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
> >          __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
> >      }
> > +    else
> > +        /*
> > +         * If SPEC_CTRL is available VIRT_SPEC_CTRL can also be implemented as
> > +         * it's a subset of the controls exposed in SPEC_CTRL (SSBD only).
> > +         * Expose in the max policy for compatibility migration.
> > +         */
> > +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> 
> This means even Intel guests can use the feature then? I thought it was
> meanwhile deemed bad to offer such cross-vendor features?

No, we shouldn't expose to Intel.

> Additionally, is SPEC_CTRL (i.e. IBRS) availability enough? Don't you
> need AMD_SSBD as a prereq (which may want expressing in gen-cpuid.py)?

We need AMD_SSBD if we implement VIRT_SPEC_CTRL on top of SPEC_CTRL,
but we could also implement it on top of VIRT_SPEC_CTRL (if Xen runs
virtualized) or even using the legacy SSBD setting mechanisms found in
amd_init_ssbd, so I don't think VIRT_SSBD should explicitly depend on
AMD_SSBD in gen-cpuid.py.

> > --- a/xen/arch/x86/include/asm/msr.h
> > +++ b/xen/arch/x86/include/asm/msr.h
> > @@ -291,6 +291,7 @@ struct vcpu_msrs
> >  {
> >      /*
> >       * 0x00000048 - MSR_SPEC_CTRL
> > +     * 0xc001011f - MSR_VIRT_SPEC_CTRL
> >       *
> >       * For PV guests, this holds the guest kernel value.  It is accessed on
> >       * every entry/exit path.
> > @@ -301,7 +302,10 @@ struct vcpu_msrs
> >       * For SVM, the guest value lives in the VMCB, and hardware saves/restores
> >       * the host value automatically.  However, guests run with the OR of the
> >       * host and guest value, which allows Xen to set protections behind the
> > -     * guest's back.
> > +     * guest's back.  Use such functionality in order to implement support for
> > +     * VIRT_SPEC_CTRL as a shadow value of SPEC_CTRL and thus store the value
> > +     * of VIRT_SPEC_CTRL in this field, taking advantage of both MSRs having
> > +     * compatible layouts.
> 
> I guess "shadow value" means more like an alternative value, but
> (see above) this is about setting for now just one bit behind the
> guest's back.

Well, the guest sets the bit in VIRT_SPEC_CTRL and Xen sets it on
SPEC_CTRL in order for it to have effect. I can use 'alternative
value' if that's clearer.

> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -395,12 +395,13 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
> >       * mitigation support for guests.
> >       */
> >  #ifdef CONFIG_HVM
> > -    printk("  Support for HVM VMs:%s%s%s%s%s\n",
> > +    printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
> >             (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
> >              boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
> >              boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
> >              opt_eager_fpu)                           ? ""               : " None",
> >             boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
> > +           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
> >             boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
> >             opt_eager_fpu                             ? " EAGER_FPU"     : "",
> >             boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
> 
> The output getting longish, can the two SC_MSR_HVM dependent items
> perhaps be folded, e.g. by making it "MSR_{,VIRT_}SPEC_CTRL"?

OK, but further patches will add MSR_VIRT_SPEC_CTRL to hardware that
doesn't expose MSR_SPEC_CTRL to guests, at which point it could be
confusing?

> > --- a/xen/include/public/arch-x86/cpufeatureset.h
> > +++ b/xen/include/public/arch-x86/cpufeatureset.h
> > @@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
> >  XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
> >  XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
> >  XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
> > -XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
> > +XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!s MSR_VIRT_SPEC_CTRL.SSBD */
> 
> What is the ! intended to cover here? From guest perspective the
> MSR acts entirely normally afaict.

I've used the ! to note that VIRT_SSBD might be exposed on hardware
whether it's not available as part of the host featureset. It did seem
to me that using just 's' didn't reflect this properly.

According to my reading of the comment at the top '!' is not used to
signal that the feature might act differently, but just that it's
presence cannot be properly expressed with just the A, S, H flags,
which would be the case for VIRT_SSBD I think.

Thanks, Roger.

