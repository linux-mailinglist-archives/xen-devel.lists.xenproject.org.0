Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A5F4BD967
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 12:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276204.472311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6mX-0001Od-CV; Mon, 21 Feb 2022 11:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276204.472311; Mon, 21 Feb 2022 11:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6mX-0001MV-8r; Mon, 21 Feb 2022 11:23:05 +0000
Received: by outflank-mailman (input) for mailman id 276204;
 Mon, 21 Feb 2022 11:23:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vyL6=TE=citrix.com=prvs=04447c275=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nM6mV-0001MN-7m
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 11:23:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0298334-9308-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 12:23:01 +0100 (CET)
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
X-Inumbo-ID: a0298334-9308-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645442581;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=84dfLuUw48tLr8hcoJxS8VdICR95+uzTniCUobBpreA=;
  b=ACEHoPxAX4S/Sr2Gcb6fp6GssyNUbcnRn9FBaf6HmiqoLrJ8v6Fw1g6z
   Um0Jn/sDCr8CgweVuai8qy7I/mqH0QMnZ0wV4Nxs65KNjpQZKWegZgzfX
   8ymKMr/mKnTIXFPi5ErGem0cInnu+79jD0oViSnCY9iPaSZErymYFU7pc
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: None
X-MesageID: 64077880
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:khOvWaBfy9rTAxVW/4vhw5YqxClBgxIJ4kV8jS/XYbTApDpwhTQPy
 zMZUD2FO/zcYmqneNB3YIvnoB8F7MXTz9dhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rj29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhg1
 /hd7cy6ajsyJ4ORubg+TDt4M39XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgG9v2ZAeRZ4yY
 eIWNztKPEribSRuYHYHBqoQut32vUDgJmgwRFW94PBfD3Lo5Bx81v3hPcTYfvSORN5JhQCIq
 2Te5WP7DxoGctuFxlK4HmmE37GV23mhAcRLSeP+pqUCbECv+1H/wSY+DDOTifK4llS/S5RYL
 UkV8TAptq886AqgSdyVYvFyiCLsUsI0MzaIL9AH1Q==
IronPort-HdrOrdr: A9a23:JaXjj6wtnthYrfD1PhXAKrPxzuskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4yGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 L4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqVneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87heYAotd/lq
 H5259T5cJzp/8tHNJA7dg6MLmK40z2MGTx2TGpUB3a/J9uAQO5l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="64077880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqAgtywIm0AF8gV7aA6rNTR/JgiTqQIDRUFqb+tfk9D0FOrQX8uQzLsym3HCH6ZmGfGbPrRLGmv7i+ireoNOB85v/uYknxsPBZsrBs8an2G/+VHFQ6nXmWcy46KQumm1kz1iTd/pvvGnF5XLo3fL3U1jivqCWeUXjJpUJXa2ysJYbHApSgPMVLTUMEtpp/WRRkdU95lzQWM4EB6+UrjMu8x27JTqa2yOaxusR4Y2pEsvAdM9VM4qns1MOtPqOPySR9NqEZRt2V+PwY1/QBAVIdaf0IKT4BbisgCBp4VbB+xVEgdRqojDf/OGD0u8GNykeNgVP0dynxuipJW2cZm4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyP3NvFc2eA+7KphrckpEBLZXRPXgZnfmA/PNygsoJ4=;
 b=C1XGfx7tFo+auNFRuYyqS8M5jwqRE1odSGkSPGqrYuMY6ztdeIMfNgYGrDQgJ7rS2Q4YKBSpwHzH2jY/Gq1l4tak0oqpr+covBtUhpBG3sTfzvPcZbFmhDVtXc7cJfRFgmAOI+lAWWvu2bvhEfRo4T74FvSu5Ovuxlo+CjtLf4gRm8ZsICauGg0No0VlguoQ9vicrK3O1YLswX6dEExyyYhCuBB2cUJ5olydWMbYAMgKrktcfUugf7aH2or0kQYLyiBou847IseQcKS+e3kSO0qYlV/tYYZOVeDY1G5oxRnwOLSF7zjpz4ANzRNKbPyGPy0LdRxeY7NY6CrNpdXSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyP3NvFc2eA+7KphrckpEBLZXRPXgZnfmA/PNygsoJ4=;
 b=YlW+1cjeOSrZ+Y5EmQNaCv72kHDydJl0lBU2QrgrPkEj+Hy1fHeZ8HUnfPFUXdJiJrE08dOrY/jh73ECoOcFC4LBCAP+7b6HnELSgpJGS8u46OlCCNA4osfVYq1Sm3Gc4dBdNtYPkmngz7yOODahTCdvh4FtEV1pbiZ1jStXgmI=
Date: Mon, 21 Feb 2022 12:22:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] CI: Coverity tweaks
Message-ID: <YhN2C6flrMKJkrO3@Air-de-Roger>
References: <20220221100254.13661-4-andrew.cooper3@citrix.com>
 <20220221111454.2925-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221111454.2925-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO3P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 746cdbae-d255-47e5-e271-08d9f52c8209
X-MS-TrafficTypeDiagnostic: SN2PR03MB2238:EE_
X-Microsoft-Antispam-PRVS: <SN2PR03MB223839D40A27EEC92D7872A98F3A9@SN2PR03MB2238.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crx0d2qyx9v2xGH4m4A5oS92Y+wZOf26GVYMjZgfc0QfZkdxtyHuZdxLT+s+qexmM6FWs9dVDn3QiqfSIc29TTAWJIAb32jepgwCtZFp7eha0M8g2SBFsQYhiKhOh4dGMrVBvecqg1MCr2iPtZjXoHIuLzE9qjazWDkTJ9M+4TC3vWi1S53Y38rYvkG+8WdZG7+0fKy3B8rV0WUs5L15Qg4bTm39nDlVDxg99TMNb1beCGkquvXMxUmfB1FrNz+WIifAwooTYhV9GcnQfATa5efDtQ7fww62Qkv38ar0u9rtJrwaWsg6HOws7WSK/Ga+nZHYdf9LjyfseCukY4sdJQfsZBItrINYv+zAIUpDMok5Mqi5mZGY4FMwRMPbw9IPLiRieRobkIP63GJoiwH+V4gWaLIjGHOq+E0gpqdm4IzXQ+FzOQN1NErVe6jhuCpJMMXbmqWY40FEngOmIa/9rlp2fyTLOKZyKUxeeHhxdthQJzJhcE997QI5I94uJPvRrQ8HSpNphF/ashPQTPC7tUgPJ62ihTv8WJbpqpStth4xLxa9ZNtuZNTIOmB2QnMehHx02yro8kr8u7TcpGK19da1wrq5hAgr7Sr8MeQfq9iB2wIpkpBviEriOt2Eu0vPuFuT1BqITZr/cEJ7JrBuaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(6666004)(6506007)(4744005)(8936002)(85182001)(6636002)(5660300002)(186003)(508600001)(6486002)(8676002)(26005)(4326008)(6862004)(66476007)(66556008)(66946007)(38100700002)(9686003)(6512007)(82960400001)(86362001)(316002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmZ5Y0ozTTFVbFF6T0lndlpmU21weEpuQkcrSzZtdm1RYkRzYkNiRW5EV1lF?=
 =?utf-8?B?ZEtkR3crdTgyWENYMlpBdmpDSFVKOW40aUU5b1BFbzZsU0RyaWN3VFZpaDRh?=
 =?utf-8?B?anBjUmFHYktmUWoxKzZ0YzFldFRmYVZRTy8ySjZWSkE1MVRzRjRRSlVSTXdU?=
 =?utf-8?B?YXFITjhSNEMrR1Azdktua3lGSSsxdXBPeXJ2Vi9BYUt5SmN1N3NqUlhYUUIy?=
 =?utf-8?B?Rng3U0psY2JldW9CS3lWZlE3UXRvMEdsQTlWN1lpNTlsODdCU2N5RGZsUnB2?=
 =?utf-8?B?WnA5U0czSWwrNStDejZ6S3hzMHE0a3B4L2ZkcE5qQVJCeTZlTy9GTDFIMmkr?=
 =?utf-8?B?OU41V3RoTFlkRzZPQWJpN1UzOW0vS09McUEyMVppb2l3RlE5RDNPRER2c052?=
 =?utf-8?B?S3dqeHVmWjFKWTVoZmVCUXkxa3Q1aEEzRDBMNmFXVHN4eGNEZWFOWHRzV21F?=
 =?utf-8?B?ano5K3RxYTl0ZkZZMWRLR0FFeXJMMEhTdmNJOEZWNlVadmFoWk05QkR4RGp5?=
 =?utf-8?B?enc4NCtoNmJlSWpQK0V3dzJORDlPOHBmREFwYTdwcjFuRENveGQ4eU1nU3dt?=
 =?utf-8?B?VG9ML3plbzMzUnYxSkFvUW9ZWmRnK3ZBVTdJTXdFTlYxR1VyU0tRMU5mZEda?=
 =?utf-8?B?SzVHc1NWbWRWVnI5VUg3VHFBeUdSYlFWRnRGMmE0RzJ4SXBmcDBLNVZnWlF5?=
 =?utf-8?B?UjE4bGhGN3lVeGVhenlBajVFUTl0U2JUMXhwWmRFRXB3U1ZwdDBQR2JlM2p0?=
 =?utf-8?B?bUZXbnZDVXBrZXNBWFphY3lSY0pTV0FIajBPSHNwOFdqM2MwRU9zdmswVitI?=
 =?utf-8?B?eDlCZUdYS1d3d0tlNThRUG1lL1ZmN1I5ZVhCRUdnOFFjRGJXZk5mZXFZMWxz?=
 =?utf-8?B?bnNhdm1LUHh2V0o3czN5cHZzdkZLdVRBMFBHY3hJZjVRRVphM0tabW94a3Jw?=
 =?utf-8?B?d0xnZWUzQUlsSVdDajIvZCtTdlg0U1VrME0wdjdKTk01T2IraDgzdUx6U0ln?=
 =?utf-8?B?NEhhQ3JLdjMyeFpNcHdPTlJMaXd1QWZaTGRsdTgwMXo4UnBiS3k2NE5VaXdC?=
 =?utf-8?B?WlExdFlwaGxiMkh4Y3NiSi9DQnBGWEdVNWdkeGlsOTA3UkNFb2xqREQrTm9T?=
 =?utf-8?B?ZHpXRDBTKzFVMjZzaS9ucXo3eHczVmpkcG5XOUE4TVV6UHd4UkZmczhFbHEy?=
 =?utf-8?B?bStoTmJnTFIrb2UvN0hpdGd2VmE5azM1ZXBjTE44akFRYmhuTU0vcFFjeDJy?=
 =?utf-8?B?RTdZUUdWY3BBQVlGMXd3Tjl1dE91OGRaR21XL0p5TDIxWGlJVlV6dVN1dll0?=
 =?utf-8?B?QUFIaStCbW41OHdNZ3lVZVNHOS8rckJwOVJPZlp1c294Umw4TFptWDVWc0o2?=
 =?utf-8?B?Y0YvOEFtUGhSOE1lRGlYR2lHSVBBQjNqTUF4NTRrS3hvUncwdHRHS1pWY0NI?=
 =?utf-8?B?c1NVWktsRUFTZmt1MVVwMjBrUmxETXh6ak9PVGVzQ2Nlbkl1YzBMQjY0S2ty?=
 =?utf-8?B?WExudHVpSDRtMWVVUi9rMnJveUgzSEFrNGJicHc5V0ptZXBnQVhFN0V4eDBs?=
 =?utf-8?B?OW83Z05QdEgxY1VUSnZTQWdINGxqdERoT2F1Qm5Xb2NSaHZJVllSSVBkalhw?=
 =?utf-8?B?SWd4V3hhK0R1NzMxMUxvanRJZS9iQjNCWnplYlF4a2ZlRmJPM1RPV1gxVmFq?=
 =?utf-8?B?Q3MrSWgvb0E0dlY0emJKbXF1WStZVVJiOFZqMEFsdGk5V2ZaekpzcmZpZUll?=
 =?utf-8?B?OXpjMTAxR0dXVFNjL2xCMXc2ZXQ5QUZJM1lBTDlFN09SUjhSWFd4cXNiMHh0?=
 =?utf-8?B?cU82c0RINVZHMHd0VkxBWFkwZlNNSktBbmFVU2ZRRjVadkhyMmNXQW05M2Y1?=
 =?utf-8?B?SUFLT0VUUDUzdDBPSk80UTJJVE9NbjV6QlJ4S0VvM1lTblJNV01VWmNGRkFW?=
 =?utf-8?B?eEZUNWR1c3VaQ3dYZDNzVVR5REhGZEtURTRYdWJZVUo3UEFXa2IyeEpOUmh4?=
 =?utf-8?B?azM0c0RvWG5HdHBMUTFKUW1LNVhKcnNaTGJaczh0UlBJZHlVYXM0YjdHRDd1?=
 =?utf-8?B?bW1nUmFrcGNVZFRLVjZmVTZaRDUrUm8wNWs0dFpkWU5BQTlscVhnL1RnNnNG?=
 =?utf-8?B?bDdFOG1waHU3bGN3Z2pmenFiMjBpdENWOGNJazU0NFVhbWVBdWlvTzloZWtT?=
 =?utf-8?Q?VtjNtXUlEXw+9cpR91QnpOE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 746cdbae-d255-47e5-e271-08d9f52c8209
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 11:22:55.9312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lry29v/p8vKTfVoa7xABIPEzs9kXZpu00wGpEGhE6Xf+kyKeu8MisF1QesaVPeD11Td2RCT6v2aJhxYqv+MJQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2238
X-OriginatorOrg: citrix.com

On Mon, Feb 21, 2022 at 11:14:54AM +0000, Andrew Cooper wrote:
>  * Use workflow_dispatch to allow manual creation of the job.

I guess such manual creation requires some kind of superpower
credentials on the github repo?

>  * Use parallel builds; the workers have two vCPUs.  Also, use the build-*
>    targets rather than the ones which expand to dist-*.
>  * Shrink the dependency list further.  build-essential covers make and gcc,
>    while bridge-utils and iproute2 are runtime dependencies not build
>    dependencies.  Alter bzip2 to libbz2-dev.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

