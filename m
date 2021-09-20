Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02694112CC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190545.340350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGPo-0007XE-6A; Mon, 20 Sep 2021 10:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190545.340350; Mon, 20 Sep 2021 10:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGPo-0007V9-26; Mon, 20 Sep 2021 10:20:48 +0000
Received: by outflank-mailman (input) for mailman id 190545;
 Mon, 20 Sep 2021 10:20:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxQs=OK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSGPm-0007V3-9l
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:20:46 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69f176de-19fc-11ec-b869-12813bfff9fa;
 Mon, 20 Sep 2021 10:20:44 +0000 (UTC)
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
X-Inumbo-ID: 69f176de-19fc-11ec-b869-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632133244;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=NE1NDT0O1Vox6buW2I/yZnEzDajwQBpWzQjV2RO5tAw=;
  b=eGpj4zHMBE/bU7sEWnGpZ8uDGnNdQRpblNaQ8bwxAiXIz559uWW3Yik5
   gISqfdi6QM27/9945Z80xBaeOTyMTCigvv6SEguz/xyoO9WoQv4Pa1udY
   VzIBVwQCXJ4vEqh3s9cTV392BOyLEAIawd3MBe0BTOBJAoJPvXF7UzO6g
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zWt2k0TqsCvW4d7392peLDWF7Rlagt08/Id8JBGFKnWWhSTCujneDlwjFcd4VgZhBdoMx83DbD
 0BXRAlBUVjaMLqoHlw2X98FCwe3HKEk3vrZF0WrGR2N7yoSktUSI9i1c+T9ncC3Rw3NL14sBbw
 C64zNtGo/XaunasqZjGuylnWWc/3VXqTBGIgtEjYbHOQp1VdGmKUVDBR0X/fwQF17Ha/xgSi+g
 RzSLNAhwFwdIj6zl3RUn040/U5Bgh4opgshhCahnd1LJMMlitQQyg5oNNB9j043sYbMjfWF2kZ
 gXdLe5zAmcq3rrzIAPA2DDkW
X-SBRS: 5.1
X-MesageID: 54896941
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fVk8jK8V3Il3ht8Ew7jFDrUDbnmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 zEYX22GO/rfYmanKNt/Pdi/ph9X6sTdm9RiQQJt+Xw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79j2tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh3k
 /ths4WaTT0MEa7Lvro7Qj1cSjFHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgGdh2JESRJ4yY
 eJGVH1kNi74USdeBXQYNMI4x/6UiEjGJmgwRFW9+vNsvjm7IBZK+LrwNNvYfPSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoNEJWo+/gsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLV/ASxFmUCViRGatEtqIkxXzNC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBWlZSwMCVCEB2fzMo4YV0DTeatI6AJfg27UZBgrML
 yC2QDkW3utI1J5QhvTjpzgrkBr3+cOYFVddChH/Gzv/t1InPtbNi5mAtACDhcusOrp1WbVoU
 JIsoMGY8OlGJpWEjiXlrA4lTezxuqrt3NExhzdS83gdG9aFoCXLkWN4umgWyKJV3iEsI2SBX
 aMrkVkNjKK/xVPzBUONX25UNyjN5fO6fekJq9iONoYeCnSPXFbfoUmCmnJ8L0iyyRNxwMnTy
 L+wcNq2DGZyNEiU5GPtHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPFGN8tbQrVBshkvfzsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBhVMiq9JQIJrDcSuekcUl4Y8LsLXoaU9UNt4xel/vS/
 2H7XUldyVHlgmbAJxnMYXdmAI4Dl74lxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:Zk8AlaqPOluCcVG/poK17EYaV5u2L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QD5SWa+eAfGSS7/yKmDVQeuxIqLLsndHK9IWuv0uFDzsaEJ2Ihz0JdDpzeXcGPTWua6BJc6
 Z1saF81kWdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L52gkBrsA7ciYsV9MOOA42e7rANoX8e2O+DIusGyWTKEgmAQOHl3el2sR+2AmVEKZ4u6fa3q
 6xCW9liQ==
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="54896941"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+l/ff5Raoeomm5E1Q8LInZBD7tpPYZmHZH1XWqcGZJPUPYC05JX2j1LVoC5WjrwjLZwcAvduIlixmfQ0wZhvJx+gh9cx/eesU3R6ETYkNrGFc732WIGIY45BlTpEqO6IkDNFgyjpjqQVGWByXArHhL+k0e2Xid96Xn8maT29xjpIy+EYWpndWvcm9dVsrYCDh8nPm+5dxTr5qPQVzt1kkiDZPL3s65sqNpag9T3Vle8LegBDQF074y4ZahQ9czDKrCFlVJdtNbLtSN3y5QXE75+ptNkdozHwpHuJrX6h/glBi/uvYods64Ojl+61uJAUzDbdW3P5R5M1ItinLuotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QFjOZkC/+Er8C/QZmW2cSOtkDavmbprnYBIx9h1t/pY=;
 b=j7bp+WKv+w2TjBgXiQfPbDhrkhIBtNgV1fzb6lVo9mHhyR2LP7fq7hwz0gO/r3BBdL/jRSBwr9BcXq6fhOfbl/6nSff73wcpv653nd+DWFAx+6LO/pTJLSEYfzGK2dkNz0x5FUxl543r5u3YKYC219AENrH4Ij57bwELQWc3pcFFyHclNr39p/u9h4lfr912ltlAL/oKbMlXuOloi4aoeAJvdRfWBZ5EDj1Yngjf2kkcPRemXeZvopYxo82F2KBD9mpfqXlnR/mZgJX4F9bjbv9/WWv6tPeoLJTbKDu5JV5l0zrOVdW6HgQdbEQ4tdhxiqxGY5AHzOv+uvwqCb5Eyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFjOZkC/+Er8C/QZmW2cSOtkDavmbprnYBIx9h1t/pY=;
 b=Oh9oYRr7WVZ/M+PDCXEpjP42uBecac229rxetY7IDq/MUudcauVYzZL/VVIUbkdYt6Nv55UpaHnI+EGYzeuISuVe9Rrsi+qrkPXi6ru27Kks/s71s+mtrI26V+TEQ1J0wDCu4W7kRvh6JpOpHIpbysfXuOD1QCE/Wp+V8PykAVQ=
Date: Mon, 20 Sep 2021 12:20:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
Message-ID: <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1086f08-235c-4852-d090-08d97c204c23
X-MS-TrafficTypeDiagnostic: DM5PR03MB2554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2554B7E20A82A554F704337D8FA09@DM5PR03MB2554.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BY1xk59L0io8ikbMHRQcQsF4yQoR4iW0W67/Z/4U+Ru+cuquXBXiLNTpddTZsW5/7xwrQiRnNc0K68cJokJAyA5w1xExsvGsXDuCUiOJ3QPOB4kCVZ1yQpSd/k7f6T7VMF7jB3QcLYJwucPLAdabW60eq8m908w20BOmF7kFJJUPLYw4ljMjvV66oPNNy2Wu1Qg1eQrll5tmXzuXM3FGDmYgQOkE7/xHn42YTNsyU6NBx2nVu+iTODmbHbEhnKaUj++5X2hlm/CCJEGCnk5MjGNWGDa6R+yGK+gdoKVWVUuS8u2O6w9mLmiJM7CQyvuzrx3d/bywlxVhYxI6wkKcLfI83vilk+jJ9g7uWAfPE/WviUn5wPJFPEblZIdernNzBok0lj0f0OcdabS0l1IVmL0iRxAbeUw4JJCIOclqc4hKtsVZ1MbO4zmQr1AYVr/LO0Wu9Wqs7o78PrOGfxHbadIGlnpcBOQ5wCpPq6Vfufdr0jnKsBjycjWK892zZqsTU794GNl3bKrAyuJqi+gO6XNL7nfWfweXUrByQvoMS1IBfuD1QnMv15XhIzPMvVdy0bzwsG1S8vLTlwrasOXOgIJrFZLfZ6wzBT2PUXP/k6B3+uKsYOzYD+M4dFCYHN8tRY39/yvyXhc7tM9Bbzrtdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6916009)(54906003)(38100700002)(83380400001)(5660300002)(86362001)(8676002)(8936002)(9686003)(316002)(6496006)(6666004)(508600001)(66946007)(26005)(85182001)(66556008)(4326008)(66476007)(956004)(6486002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE9WdnA5RGhRQUw4ck1EZFBaSU1qRFp5MS93a21IY2k4TCtGMnV6Q2FmWnhB?=
 =?utf-8?B?M2lUT0JZb3h4YUtPa2kzZW9lc29mYlJWbitvTWVGeXlSUS9QaExEdXFnL2N4?=
 =?utf-8?B?akV4YjB4c1dWSmZjSkNYSzQ2S00weU16aFZDTUJqYnVSSUlpQUF0aFJTYTk3?=
 =?utf-8?B?cERjbkdpWndlWkRhSUdRR2NYd0t1N3pZbktpaGxrRVpMbVNaVWgwUmprKzBR?=
 =?utf-8?B?WXZqb2toc25QUmJhR1J0bmg5NTJQK2k5cmdLM09XZFdIYnNvVHR3V2hiUUhE?=
 =?utf-8?B?VWM0R0ppWlpCd2szYmx2ajV5UFRnekVQNTF6aHBkZjNKVXh0ZVlqLzI5cDhF?=
 =?utf-8?B?MmVmMjJzOUVGMFk4S0pscHM2TDhSVjNFRllkenpwMjV2R3lJckJySnkwalF6?=
 =?utf-8?B?NFdsRWUwVm9rSTRlRyt4MWRvdzVMbHJVOG5IUWlHVWw5bjIrcFZvbnYxa1ZE?=
 =?utf-8?B?Z0JrVkdLWnU0Tzl0WFNiUDZxQTRXczhUU2ZOZGJ6N2lZSzBmSWpxVmR6eUJs?=
 =?utf-8?B?cDlvVnAraUJSSlRTL3lsM3NEbVBnUFBjbHNaQWZsZkxaZ08vNEMvSXJ6Tmkr?=
 =?utf-8?B?MFNjejlnZk1MUEV5S2k5UDNTSXVMb3g3NDJvQkI4dzBERzdMdWc5QUxPSFcv?=
 =?utf-8?B?L0phWHdpMHpkdzhxNUlxU2pJVkpobkZLV1o0clhVeUJwVXZncWhXTE9BL1VC?=
 =?utf-8?B?WkF2VW14VmxwNjhURWdFVERkV2JFMXdKVU1HZjhtMUFYU1lEUWRIYkx3aVVT?=
 =?utf-8?B?UGhieGdqVmRlZXMwUWNBYkUrbEZJSzVRMTQrSFlqa0xrcXBCTExWVG1LQjNC?=
 =?utf-8?B?QUJLbDgxMnlBLzd0ZUs4QWlNUnBvbGtJTGlTODZablhtSkF1bjdFRCtLcjFU?=
 =?utf-8?B?alJZb1hWMXhnZmtxMldOTjVodlVPYjJnVEVveUpJWlpXMWUvODFjWS9OZkFC?=
 =?utf-8?B?S2pTcTRnVFdUUW0wRVZ0UDdtYmVKdXJQUlIxZE9EV0MvYW50ZGZYb2tVVVQ1?=
 =?utf-8?B?RC85bWZxSUZPUEpTa04rdE81cmlrN0N4Y0VkdWRqNHpaZGJvWlJoblBJaWxM?=
 =?utf-8?B?VlVaY1crdi9rcE53THNmMFhmTDhNN1lQdGJJTEVnVWFUbFphVm9pRWNsbThT?=
 =?utf-8?B?eGwzWFd4czhKNWdBTlVDVGlqZXp0YWxQQkZRZ2FpUjJUb0pCUHNaeVFpM2Yv?=
 =?utf-8?B?cTdFdHNVajJ1K2FRb1hXYUI0RmF6akl5ekJkbU81bHpkdFA0cmpjamRaMUd5?=
 =?utf-8?B?aTczMDM0WngzaFg5Yll0c1k3ZWpQUEd3S2FWRzV6Y1VCaUpqb2ErbVkrd2Ra?=
 =?utf-8?B?UWlQTTdTWllaWXBRRGpwUU1HcDFyNmsvWUtZY3NKdDF3ZFFjVDY2R2pzN2JG?=
 =?utf-8?B?am55RThTY1k5elBlODV1MFJnd1pGaE1iSm42cTBnMkN4REo4T2ZDVVgxdVFX?=
 =?utf-8?B?L24rUExRd1BISmR6Z203L3JrNGdEMll1R0hVbUxJL3F3djZjQlk5ejdEcFpS?=
 =?utf-8?B?WHdZTUkzNFVBZldLa20xLzQvaVd4aHNSc3g5MUhCdkVjUnIzRHR1ZHRyUWtR?=
 =?utf-8?B?amNOb3k0b3NCdHF4UVIzU3dMejFCMk9RdHV2ZkpqV3Ria054ZEN0NXhMNlV3?=
 =?utf-8?B?czZGUlNZaEJjV2QwMlBPU3lEa1dYZGZYc0tteHg5NTU3VHFvVE5oWGRYdUk1?=
 =?utf-8?B?UUlUWDlvOXVlTVZRb0I5d24rQVQzc0JNZ2xpNWJZam00OHAyQ3pJWkhoM0J5?=
 =?utf-8?Q?CMDRGUTviK2e8deOJ4sXUCfgZgok9pVnJE6MhTS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1086f08-235c-4852-d090-08d97c204c23
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 10:20:40.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjeYjm9J8l76UG+mnFZ9j0q+dku1B4kWz8ej/i15cxsLUR1XmNzhYx03koAG4W1MyJB6css/LIZgCaZvRvrzHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2554
X-OriginatorOrg: citrix.com

On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
> Without holding appropriate locks, attempting to remove a prior mapping
> of the underlying page is pointless, as the same (or another) mapping
> could be re-established by a parallel request on another vCPU. Move the
> code to Arm's gnttab_set_frame_gfn(). Of course this new placement
> doesn't improve things in any way as far as the security of grant status
> frame mappings goes (see XSA-379). Proper locking would be needed here
> to allow status frames to be mapped securely.
> 
> In turn this then requires replacing the other use in
> gnttab_unpopulate_status_frames(), which yet in turn requires adjusting
> x86's gnttab_set_frame_gfn(). Note that with proper locking inside
> guest_physmap_remove_page() combined with checking the GFN's mapping
> there against the passed in MFN, there then is no issue with the
> involved multiple gnttab_set_frame_gfn()-s potentially returning varying
> values (due to a racing XENMAPSPACE_grant_table request).
> 
> This, as a side effect, does away with gnttab_map_frame() having a local
> variable "gfn" which shadows a function parameter of the same name.
> 
> Together with XSA-379 this points out that XSA-255's addition to
> gnttab_map_frame() was really useless.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -92,7 +92,7 @@ struct grant_table {
>      struct radix_tree_root maptrack_tree;
>  
>      /* Domain to which this struct grant_table belongs. */
> -    const struct domain *domain;
> +    struct domain *domain;
>  
>      struct grant_table_arch arch;
>  };
> @@ -1795,8 +1795,8 @@ gnttab_unpopulate_status_frames(struct d
>          {
>              int rc = gfn_eq(gfn, INVALID_GFN)
>                       ? 0
> -                     : guest_physmap_remove_page(d, gfn,
> -                                                 page_to_mfn(pg), 0);
> +                     : gnttab_set_frame_gfn(gt, true, i, INVALID_GFN,
> +                                            page_to_mfn(pg));
>  
>              if ( rc )
>              {
> @@ -1806,7 +1806,6 @@ gnttab_unpopulate_status_frames(struct d
>                  domain_crash(d);
>                  return rc;
>              }
> -            gnttab_set_frame_gfn(gt, true, i, INVALID_GFN);
>          }
>  
>          BUG_ON(page_get_owner(pg) != d);
> @@ -4132,6 +4131,9 @@ int gnttab_map_frame(struct domain *d, u
>      struct grant_table *gt = d->grant_table;
>      bool status = false;
>  
> +    if ( gfn_eq(gfn, INVALID_GFN) )
> +        return -EINVAL;
> +
>      grant_write_lock(gt);
>  
>      if ( evaluate_nospec(gt->gt_version == 2) && (idx & XENMAPIDX_grant_table_status) )
> @@ -4144,24 +4146,18 @@ int gnttab_map_frame(struct domain *d, u
>      else
>          rc = gnttab_get_shared_frame_mfn(d, idx, mfn);
>  
> -    if ( !rc && paging_mode_translate(d) )
> -    {
> -        gfn_t gfn = gnttab_get_frame_gfn(gt, status, idx);
> -
> -        if ( !gfn_eq(gfn, INVALID_GFN) )
> -            rc = guest_physmap_remove_page(d, gfn, *mfn, 0);
> -    }
> -
>      if ( !rc )
>      {
> +        struct page_info *pg = mfn_to_page(*mfn);
> +
>          /*
>           * Make sure gnttab_unpopulate_status_frames() won't (successfully)
>           * free the page until our caller has completed its operation.
>           */
> -        if ( get_page(mfn_to_page(*mfn), d) )
> -            gnttab_set_frame_gfn(gt, status, idx, gfn);
> -        else
> +        if ( !get_page(pg, d) )
>              rc = -EBUSY;
> +        else if ( (rc = gnttab_set_frame_gfn(gt, status, idx, gfn, *mfn)) )
> +            put_page(pg);
>      }
>  
>      grant_write_unlock(gt);
> --- a/xen/include/asm-arm/grant_table.h
> +++ b/xen/include/asm-arm/grant_table.h
> @@ -71,11 +71,17 @@ int replace_grant_host_mapping(unsigned
>          XFREE((gt)->arch.status_gfn);                                    \
>      } while ( 0 )
>  
> -#define gnttab_set_frame_gfn(gt, st, idx, gfn)                           \
> -    do {                                                                 \
> -        ((st) ? (gt)->arch.status_gfn : (gt)->arch.shared_gfn)[idx] =    \
> -            (gfn);                                                       \
> -    } while ( 0 )
> +#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
> +    ({                                                                   \
> +        int rc_ = 0;                                                     \
> +        gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \

Newline maybe? Not sure whether we decided that macros should also
follow coding style regarding variable definition followed by newline.

> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \

I'm slightly confused by this checks, don't you need to check for
gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
guest_physmap_remove_page?

Or assuming that ogfn is not invalid can be used to imply a removal?

Also the check for ogfn == gfn is only used on Arm, while I would
assume a similar one would be needed on x86 to guarantee the same
behavior?

Thanks, Roger.

