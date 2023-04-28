Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810366F1C99
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 18:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527422.819982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psQyL-0004Ak-FA; Fri, 28 Apr 2023 16:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527422.819982; Fri, 28 Apr 2023 16:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psQyL-00047h-AI; Fri, 28 Apr 2023 16:29:25 +0000
Received: by outflank-mailman (input) for mailman id 527422;
 Fri, 28 Apr 2023 16:29:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psQyJ-00047b-0N
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 16:29:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1e947e6-e5e1-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 18:29:18 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 12:29:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4996.namprd03.prod.outlook.com (2603:10b6:408:7e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 16:29:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 16:29:13 +0000
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
X-Inumbo-ID: d1e947e6-e5e1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682699358;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mVXk2JvhTVmbrxmBGwfrJ9NN+eP9NWyG/G563xcBgqs=;
  b=fJ+1f3bJsTyJ96Vhj5NN2ueic1Lmqn0hnff8Ou4Wf0Bdamp3dSnffXUL
   9gkYy85cjyIxFVIcoKAoyTYbrANEzVml52OZiRRnf1L6uvaoCM5mOrj1l
   SQzgTDUfP7IdDnmgzfaMEUHrhTGh6KrlD38Yfv1TmJU81Rq4uJU/6f8q/
   Y=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 107651768
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Y1ByMKOwAz8C9MvvrR1wlsFynXyQoLVcMsEvi/4bfWQNrUog1WYHm
 zRNWGvXP/6JZTagf9glPdznoU8A7ZCHz9Q3SAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5AxmOJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0stzLmB1r
 fMpET9TQiCe3emyz7y2b/Y506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujeLpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXylBdtNSu3QGvhCgmWMxDMrKTkqZQG34tuduFeDfsBgN
 BlBksYphe1onKCxdfH0WxC6qXiIpBlaRdNUF+A47ymGzq3J70CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaJiw9PWIEIygeQmMt/9jmiJE+iFTIVNkLOKy6lNruAhnr3
 iuH6iM5gt0uYdUj0qy6+RXMhGuqr52QFwotvFyIBiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:q1ZQka1gruN0g4f3vGRz1QqjBKUkLtp133Aq2lEZdPUzSL37qy
 nOpoV56faQsl16ZJhOo7290da7MBbhHPJOjbX5X43NYOCWgguVxehZhOPfKlbbehEWmNQz6U
 5oSdkbNOHN
X-Talos-CUID: 9a23:PmO5VmE8bn37Xdr7qmJK8GEVIZgqQ0TSklvgPhWzDWlnRZiKHAo=
X-Talos-MUID: 9a23:ydUFuwgiAYT4pq+Ymx5JW8MpNv934fuWKWQxoc8K+OugBzVNHiWik2Hi
X-IronPort-AV: E=Sophos;i="5.99,235,1677560400"; 
   d="scan'208";a="107651768"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjfWmV4wpdm/nF/hJDvkgOMxCyGaCwmTAKnxe5Xi0PyxirSlW/RMlKf193RT48IZOoqe3loO9EUZoH9N5LPi+uAyCprmZMTFP2vrIhJk0dco+5yCPeVJPaa6gUSXwX28PDWbaqs6OZh8NVKI5z4YhOzFbk0tRZjuS31tFoH2mYFnZeYm05+4w2Z8ptOoYaxLltdJhvOgPVH2B3uwk+yGUAt7d6b5+PikRxabuW6lpssbYa1xug8HO0bAGTJsXyUo19zCg4/f/gGF3fncTPZLKsfEWmVo2Gq8NJX7RZD5X2llnmXeIZY0KBFdhbe679sCLwSA+mB7wf1KRhbT1zoykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxCCJDFIlnfu1ie0kTBSfHr4JZQgZ2HEEvmCizB2PXI=;
 b=dTcnaWULBmntr5HDMKaSSOoBEc4UF55VJ2vw0i4lzmdL6ozWL1FgB+HEeurXd/Idt/nWXGVnPmntQtB4o+FugDFWjLFXdB1HPjuMM7nqqg/rj7176Zi50AAkVCFIBva1s4s371DQs28v4uDS9LVp7evRwLv/+UiuLuAZtJwhIWiaIJAA49/IjTiWCAc/AdOnr+Zgt9bjr615FpYxKZqxcCUMMTgIZlrm2DY3vOu1JtmnNF1xZ3BmWihHoAIuEoxMX0Go3amTTpzq3YLqDxhFojPa58KMkWOv8FCskgHwHQlROr4RBdGDO0jr507xHwny2KZORZIq06uK30x2xs7eNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxCCJDFIlnfu1ie0kTBSfHr4JZQgZ2HEEvmCizB2PXI=;
 b=Nzh8B1Qbhy6A+aavvfyrEGPmTFS6UXsVcWpdvP4fg3Xr/IpIlXC7g+3b2AjjrLZmY0L4p6HbKWy9GraHMh477cE6H1se5sSMG1KDa6JBT6bFPK/ibG5FVM7wuDxH4XMwodP8wNAD78OY//WsrhCH7+psjCGXkPzpBZ53rFu910I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <13e96e00-85e8-03d9-86e6-7692ca0f8bdd@citrix.com>
Date: Fri, 28 Apr 2023 17:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 6/7] tools: Use new xc function for some
 xc_domain_getinfo() calls
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-7-alejandro.vallejo@cloud.com>
In-Reply-To: <20230428104124.1044-7-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0547.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e6eadb-915d-4ca9-e032-08db4805b39a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fP2ykMGNx7+KtNtWkU2mtwukad0m1R6cAAH5A1sQzxBEGbIZcneLITWY6M/9aGvjTKY5IGEpKwl3D0WWv2R1olmK6BxdEhQL5edxAqKbkbvcJ2JesWDJOkD/2NmCsS8hZIZdbetN7eBGP3MNHjXhEUXdwcIV0Me8jaCh2RyaPJ0wK1rDGnJSrap54Dllp9D3P23AdbFTMDCOg0FtlfpSpEs5kEDq8vdBMfZJ1n7h1Ej4FL0nUZERTjyUFe9qNEOx6ei4e6OkInZwWos+3pBsJkPcF/YlcDTgs0eHl/8CkoLtkDn15fKidv1Lps5Y2McSPAklMbHVzWV9NdksvCo7cVY3PHoeg219bojhMCtTOUVJwTOK3Ubqbf63p65kAD5y3DA9xD3Nnm1rLYy1vXYXUEhkqKIp6zaCKj4YDIHZDbsUTQpUVvxJdtLyQqa9gdwISpoNu5SZr+cnXUks6FLgvyQGUo+e+9Q+D5K4Gmz+MbCKE9aMMNjQRV6NYSdLi2n9XWCOJGNlzZTL1mZslY54y/JE+QxYGq1koEhzHOViDHw+ptoX7FsKdRVcZzOxjswkOwNC770vb1IpB/q0McT2VBcpL4PVTyz1P29RY2L1YEDV586M0+iR8sIKZS96BdGZ0rx15dT/zhHzgz8LM++01g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(86362001)(53546011)(26005)(41300700001)(6512007)(6506007)(2906002)(5660300002)(8936002)(36756003)(8676002)(31696002)(83380400001)(38100700002)(186003)(478600001)(54906003)(6486002)(110136005)(6666004)(82960400001)(31686004)(316002)(66556008)(66476007)(4326008)(66946007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWNZSlJva3VocXVmV1pMVjIzNFBSZ0RBM3R3RDBDSFVQNGd2YXJTMm1VSDdp?=
 =?utf-8?B?Q1hGVEFWQmF3SmhRa0lMSTZ2RC83ZFMwbG8rRDEwV0V4WHU2MlpRbWFUYnIy?=
 =?utf-8?B?SUFNMHp4RkpQUlVXd2c0UlUvNVBQZEJ0bTJlQXNOSW1tYmRxTlkxa0s4RWhR?=
 =?utf-8?B?dU91Q1RIb01WcmprcmxGUDYvdUZBeGVROXFaOGxyRHp6ZkdqYUpSU211djRl?=
 =?utf-8?B?dXFSYzZIRzlKYmpGd0FIYWd5L3N0R2V5VnR6ajY5YjV6V1EyV0FJdC9zRit2?=
 =?utf-8?B?aHJnL1l1YlJZek9PeFdiZ2tudSt4bko5MHhiQUxaK2FFSi9pMG93Rk9oZnVv?=
 =?utf-8?B?dDFvRUdkU21aTFJzSjdSY1FtaitDeXpZbkp3akFIbG5JdlhjTklqdEhsYWFJ?=
 =?utf-8?B?WDZMRnRBM3ZiNE9yWU02aUYvMU9JOVpRWFNZK2ZudU81OGp4enVzU0toL2to?=
 =?utf-8?B?TmtucFZWOFBZVkQ5RUc5eEJSTUwycGJ1b3BmaWFsMnhZZkRoU044VmExYmcz?=
 =?utf-8?B?c1pNVFlLZTVHMHB6N0lLN0RYRnlSaTFZYlRZdFhtUWNaVjNXNVlGT2NZWEdM?=
 =?utf-8?B?OHY0ZXlSdStQL2hTMmttOEdZT01uMjVGS0VENFlxbSt0U2lldSswa2syR0Q2?=
 =?utf-8?B?d0haRnorMS9NUmc4ZkdMejN3aUdyeERUaFd1N2FzNXRjbHJXUVVERHNDTGNQ?=
 =?utf-8?B?Vll6NmJka0YrVnU2NXYwN0VSTkNLWm9rTTE0Q01RWlJYRHVUVEh3bHY1TEhO?=
 =?utf-8?B?MzcvOXRYTlIvUS9pdTlCbG1nR1RBN1BFUnR4dnNiNml0TmJTcEtGLzEwejBz?=
 =?utf-8?B?SGVVT1RRQ1FLUWhEdFdOOVp1Mmp0SnpxaCtUTzJqZ3RzN3B1bC9XK0IvUkpG?=
 =?utf-8?B?dWtUUWhRMEkrZHFUTTlSZ2FnZXJxMXVsY2pEeWxkaWM3L1p2SGE3Nm5yQjVT?=
 =?utf-8?B?SXFaZVdRNXdaY1FrTnhyVloxVWN2dU5ISTJRNlNEaVcxWGd5bENvK1MyLzV6?=
 =?utf-8?B?REhvajRjeTBKM0grQk5hcmlkNnFmRHV6MXZNNW1XakNMZS9sdyszL1hlcUFU?=
 =?utf-8?B?LzdPSGgwakJiNGdLYVU3cU1sSUlodU84aGNhWDdoMUZQS1YrSUFmQlNlK29J?=
 =?utf-8?B?eHNlYWJ3ZVNyQVFxRU50bzUxY2pIdE9lYUQxSE0wSWxzWEJON25sSVl2R1hs?=
 =?utf-8?B?NzI3MmpxdFpsRGxhVmd5QnNPaWc3aEUyMmlndDZpVlEwNDluc0hVV2NobEJo?=
 =?utf-8?B?L1FwbVhoeUZ1NlF3RXhja1hIbFZBZmh2d3g0QUFYYUd6S1p2TDA4WkE1NTAy?=
 =?utf-8?B?M1pQN3B4Z2lNRW12TlJINWtLTG1RbVhqT05NTTJnTlMzNTN5RXFreTBYM2FS?=
 =?utf-8?B?VkkwTjR5aVkvWXlWSk1JVExHdWFhWUxYQVd1OXoxdDk4dnZtYmNYOVVsTWtC?=
 =?utf-8?B?YWdRMC9IdU1mZFZPUnYwUDduRStDMGR4b09WR2k5UElLaXpFMG9qaHpUd25J?=
 =?utf-8?B?Tkh2dzFGVXF1OVJRVEV2QVFiOUVWUlRzdkhpQ0h4WlVtSlBZak41cGFnaThT?=
 =?utf-8?B?SWVqNEk3MWpGSFduV3pjZmFoOHlmeFhPNk1QdE9CVGhSWXZGYjNlSWdsc3k3?=
 =?utf-8?B?VVJ4c2JPTmhMT2V3TWpqVHBIZklRWjBYbHNaWXB1M2xKZWd3MDVnMjRvejdW?=
 =?utf-8?B?OVpRbkhMcURDSDZMUHBGTUVFNm9JNkExVUxoUXB3NEpvMklwd0YwV1V3NHhz?=
 =?utf-8?B?b3RPVWlpV2FncVMvK1BaaG0xSzFMWkR3VitZYXRPZjYwd3Nnd2VsUmpzMlQy?=
 =?utf-8?B?aGZiejRwYWlDMmpkUThXVC9FZHFSaUJyNGFHU01GblA4eU9DTERucmIxempW?=
 =?utf-8?B?VEpuYzFUVmlmZFV1TFBRelFFcS85OG1xVDFZeVBETmV4bk9vcDNUbkJJSVdN?=
 =?utf-8?B?cjgvTkhHQ0RHQXNySGNsVGhyODhmem9NWUxFTmF6dXMzSDF3MmVXbk40WWlK?=
 =?utf-8?B?SkhNUFhCN1BleWY5bzlmSi90WGxySDlYUEZUOGtJVmVyMEpsR0FtRERzR1E4?=
 =?utf-8?B?K3JzVHpNYUR1cDJkdXpSWU1rSnFKbk11M3NtUW51aHFRUGh5cEF1NkNZZ0p4?=
 =?utf-8?B?aG1yVWFSZUlBZ09Sb1dqRzlzL0tkakJyMk8zWG9ScUVFK2wwOWJaSnRiODli?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4aW6XcyVnGi+Eb7ja/rf8lhD5v3HZzMq7jB7QiqhOP3t3g/JFFs32y1xs+Rn20DfLGZx7bWmXGn1DRqaTubrH1REKU/STCftJITokiE410kQAcGyM3epAmldB7uM+v+yqlnE3ydfleMhjtU6k3FCJGAt4YDFzvJLHuOFfquDL/uuhVNNfcSQ6QD9l16b5mJGsqcdjQGcHVeKJA5n3BaTPaUJSeDqoPALMC7oq8Z7zGhWWokq4IBJ9JF0EeBwnFnmlCLyLwt7BFXtnvwrXqFlazF5czhaD6b4/uMnb30e8ispuSdCKyRZttQHwh5EIH7rOdp5ba9Jn9Y2UNssSFn8royq5DRPCucGyFZDnLnbwznGAobsN3xIKHbQG+WZOBFT+tWZVhgyvCRe9d3FTnoI6WN+oA/gZy8JNh/WOBTHBmuaXrw4azAFrl6uLtzt62edlaUC5J1EWYbSteNTT6W5TlsoOxoMnUeJYn6INB1Y3ePMcrVgEWsW+3aEIuNFuInGOcZYYVDyiGa7njRQXHyCR3fERae6bsUZ/+B9/c2Vt+KDdpP5Of8R2bdJugh/yu1W109wPOyWtXV8QTiSQFScVZLUV6iRcU+weZznZ6ZSX2fHkXTnHwMyf9ASZneqmoUP4tS5EaY4H3ZmYnE9vlKlR+t76Ky4wVAuCW7erfhT8ALGF/AbOUMqs82eAG0wI8hcqTPOcuvWAFK3vg1dgkKkgDIPH1uWKtgyR5vcxtoozQ1Y1kGlYUUF2eUC4fi6rYzZMdZC3PbEVOaX9oYlLsgWhvywwRvtr0l2zYrEwlnc6Bhf8CeMf9irMO1zGvnmqFNKSjP3NYyWK/TDuVkiNc92LB5ms5YjpFXZIJEIf3X+K0Y=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e6eadb-915d-4ca9-e032-08db4805b39a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 16:29:13.2088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYJh1OhhQzQphOKwUSFUpJZ8rfn0jKFriisiADIz695bUkI2KjvsEbIH4GmyHBAq0RXH8rUJtPvjeRQh+Jw5AqxHBpck2oBNiDuEtOLnwoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4996

On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 6b11775d4c..533e3c1314 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -1959,15 +1959,14 @@ int xc_domain_memory_mapping(
>      uint32_t add_mapping)
>  {
>      DECLARE_DOMCTL;
> -    xc_dominfo_t info;
> +    xc_domaininfo_t info;
>      int ret = 0, rc;
>      unsigned long done = 0, nr, max_batch_sz;
>  
> -    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
> -         info.domid != domid )
> +    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
>      {
> -        PERROR("Could not get info for domain");
> -        return -EINVAL;
> +        PERROR("Could not get info for dom%u", domid);
> +        return -1;

I think this needs to be "return -errno" to have the same semantics as
before.

> diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
> index 2f99a7d2cf..8dcebad401 100644
> --- a/tools/libs/ctrl/xc_private.c
> +++ b/tools/libs/ctrl/xc_private.c
> @@ -441,11 +441,10 @@ int xc_machphys_mfn_list(xc_interface *xch,
>  
>  long xc_get_tot_pages(xc_interface *xch, uint32_t domid)
>  {
> -    xc_dominfo_t info;
> -    if ( (xc_domain_getinfo(xch, domid, 1, &info) != 1) ||
> -         (info.domid != domid) )
> +    xc_domaininfo_t info;
> +    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
>          return -1;
> -    return info.nr_pages;
> +    return info.tot_pages;

As we're modifying every line in the function, take the opportunity to
add two extra blank lines to improve readability.

> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index bd16a87e48..1519b5d556 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -281,7 +281,8 @@ static int xc_cpuid_xend_policy(
>      xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
>  {
>      int rc;
> -    xc_dominfo_t di;
> +    bool hvm;
> +    xc_domaininfo_t di;
>      unsigned int nr_leaves, nr_msrs;
>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>      /*
> @@ -291,13 +292,12 @@ static int xc_cpuid_xend_policy(
>      xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
>      unsigned int nr_host, nr_def, nr_cur;
>  
> -    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
> -         di.domid != domid )
> +    if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
>      {
> -        ERROR("Failed to obtain d%d info", domid);
> -        rc = -ESRCH;
> +        PERROR("Failed to obtain d%d info", domid);
>          goto fail;

Sorry, I gave you bad advice last time around.  We need rc = -errno to
maintain behaviour here, and that is a pattern used out of context too.

Same in related hunks too.

> @@ -330,12 +330,12 @@ static int xc_cpuid_xend_policy(
>      /* Get the domain type's default policy. */
>      nr_msrs = 0;
>      nr_def = nr_leaves;
> -    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
> +    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
>                                             : XEN_SYSCTL_cpu_policy_pv_default,

We like to keep the ? and : vertically aligned if possible.

> diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
> index 263a3f4c85..1dea534bba 100644
> --- a/tools/libs/guest/xg_dom_boot.c
> +++ b/tools/libs/guest/xg_dom_boot.c
> @@ -174,19 +174,11 @@ int xc_dom_boot_image(struct xc_dom_image *dom)
>          return rc;
>  
>      /* collect some info */
> -    rc = xc_domain_getinfo(dom->xch, dom->guest_domid, 1, &info);
> -    if ( rc < 0 )
> -    {
> -        xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
> -                     "%s: getdomaininfo failed (rc=%d)", __FUNCTION__, rc);
> -        return rc;
> -    }
> -    if ( rc == 0 || info.domid != dom->guest_domid )
> +    if ( xc_domain_getinfo_single(dom->xch, dom->guest_domid, &info) < 0 )
>      {
>          xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
> -                     "%s: Huh? No domains found (nr_domains=%d) "
> -                     "or domid mismatch (%d != %d)", __FUNCTION__,
> -                     rc, info.domid, dom->guest_domid);
> +                     "%s: getdomaininfo failed (errno=%d)",
> +                     __FUNCTION__, rc, errno);

Ah yes, this is where your stray hunk from patch 7 wants to live.

> diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
> index 7314a24cf9..6767c9f5cc 100644
> --- a/tools/libs/guest/xg_sr_restore.c
> +++ b/tools/libs/guest/xg_sr_restore.c
> @@ -887,20 +888,15 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
>          break;
>      }
>  
> -    if ( xc_domain_getinfo(xch, dom, 1, &ctx.dominfo) != 1 )
> +    if ( xc_domain_getinfo_single(xch, dom, &ctx.dominfo) < 0 )
>      {
> -        PERROR("Failed to get domain info");
> -        return -1;
> -    }
> -
> -    if ( ctx.dominfo.domid != dom )
> -    {
> -        ERROR("Domain %u does not exist", dom);
> +        PERROR("Failed to get info for dom%u", dom);

This is somewhat ambiguous, because "info" could be anything.  "dominfo"
would be better.

> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index 9853d8d846..b0b30b4bc2 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -336,19 +336,17 @@ static int suspend_domain(struct xc_sr_context *ctx)
>      }
>  
>      /* Refresh domain information. */
> -    if ( (xc_domain_getinfo(xch, ctx->domid, 1, &ctx->dominfo) != 1) ||
> -         (ctx->dominfo.domid != ctx->domid) )
> +    if ( xc_domain_getinfo_single(xch, ctx->domid, &ctx->dominfo) < 0 )
>      {
>          PERROR("Unable to refresh domain information");
>          return -1;
>      }
>  
>      /* Confirm the domain has actually been paused. */
> -    if ( !ctx->dominfo.shutdown ||
> -         (ctx->dominfo.shutdown_reason != SHUTDOWN_suspend) )
> +    if ( !dominfo_shutdown_with(&ctx->dominfo, SHUTDOWN_suspend) )
>      {
>          ERROR("Domain has not been suspended: shutdown %d, reason %d",
> -              ctx->dominfo.shutdown, ctx->dominfo.shutdown_reason);
> +              ctx->dominfo.flags & XEN_DOMINF_shutdown, dominfo_shutdown_reason(&ctx->dominfo));

This likely wants wrapping onto the next line.

> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index bd5d823581..94fef37401 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -34,7 +34,7 @@ libxl_domain_type libxl__domain_type(libxl__gc *gc, uint32_t domid)
>  
>      ret = xc_domain_getinfo_single(ctx->xch, domid, &info);
>      if (ret < 0) {
> -        LOG(ERROR, "unable to get domain type for domid=%"PRIu32, domid);
> +        LOGED(ERROR, domid, "unable to get dominfo");
>          return LIBXL_DOMAIN_TYPE_INVALID;
>      }

Ah, this is the answer to my review on patch 5.

Quite a few of the following hunks look like want to be in patch 5 too.

Everything else looks good, best as I can tell.

~Andrew

