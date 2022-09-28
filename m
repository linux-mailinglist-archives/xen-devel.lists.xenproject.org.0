Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6C65EDEC0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 16:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413395.657013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odY2M-00054Q-30; Wed, 28 Sep 2022 14:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413395.657013; Wed, 28 Sep 2022 14:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odY2L-00051R-Vg; Wed, 28 Sep 2022 14:27:45 +0000
Received: by outflank-mailman (input) for mailman id 413395;
 Wed, 28 Sep 2022 14:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG3S=Z7=citrix.com=prvs=2639d358c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odY2K-0004v7-3F
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 14:27:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b586b20f-3f39-11ed-964a-05401a9f4f97;
 Wed, 28 Sep 2022 16:27:42 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2022 10:27:39 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6105.namprd03.prod.outlook.com (2603:10b6:408:11a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 14:27:37 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 14:27:37 +0000
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
X-Inumbo-ID: b586b20f-3f39-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664375262;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Rhm3ITndz6MUI9g408ycInIprXWV5pr+9oDI2U4ykcM=;
  b=P0I4fokH3ygEWSts/7Q9LJzhiCzZcjdZZDv3j44YJ18kgMd9Bh/F/5G6
   TzoIupU41NVM2rKLVQqc/oC42s0Lcu+plEwtAPybMUEPU3WyhigHOXuyC
   UEnr2ZliEagL45PXWRT4nxwLsw2qfMA8BrQdTQrEGrds8nL5gtGocejaT
   Y=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 81542656
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ApxagTK2qOeT2scFI8/bDix16xaGdEXBdZcB5h?=
 =?us-ascii?q?TgEjSJ0oekyFxJjW3jMTdpVwLd93lHzZH0GQp7dh363NtgY4IeonlOzSydJq?=
 =?us-ascii?q?kFIdFgxvvF6P27LQMdqxhOGCWDKLHs+PL+iGdXUOwyzgpN9M1dKpV0qOwrp4?=
 =?us-ascii?q?+92L95NYKqU3o7LFLiOAhM16n+vet/sykZphI5LxjMAUSkF8wd3CjK6+l8aR?=
 =?us-ascii?q?1/gF4ogsHjoR4cswgkxh4Ngo8tQH4CcDBg59I7b/OS3hU1X0k+48bJXIeIze?=
 =?us-ascii?q?KNGXUr+nshSwtCULpDB80eNE4iM/oLf893ylNAQF07BLE6cbDpvzJWdLmNJ5?=
 =?us-ascii?q?UorqQWEkvHvGQIZxTQuFh5Geh3qPZ6zY531GV2QSx9UCGQMb80fMLrtmFwqO?=
 =?us-ascii?q?j7OiEyT4Gwbz68Mtt4uXNyijw9YhOeag1SP2snBUwHSinU/PIYFrHlS+M25T?=
 =?us-ascii?q?RSCea3gqma/Y7AdRvW02+Zm059WaPCaQgVgqSz0fNgHcbSgDs7qOqfQ/R9Yu?=
 =?us-ascii?q?Kuw9Bae7YINczaz0zv34t2i54XTm6YpopjET75ty2EKgFDUp16PrhpiobHXJ?=
 =?us-ascii?q?+vL15jdKii7/S69matWQlg2FJR42bN6zLBDXwnNk5gWFcOFEODpiAiCJZjQy?=
 =?us-ascii?q?Ge3oXEkt3fowjr0+qJ9cLddXOKuznXyhcRm7V2CPsQPmmDEtlTXAxfF3wNi3?=
 =?us-ascii?q?OgdQ5RfOqMcPA1irBAd0t0/6EKcK2uKyq+H/p8VUvjFysioaUixN9SlE4ZeF?=
 =?us-ascii?q?cZs+qN/zAEf8dG0Ql37y8PEpOBn4G2E6I9N8/NGeJQ9zgJEnM2Fjvhm6GR97?=
 =?us-ascii?q?T3xDcR15/oQxKxS5aYxyEjyFMfIYSC1EMBZJiokA+boANlF+ba7eLMb8repg?=
 =?us-ascii?q?90H5NUCPcF4uv9kqAhG1GcKM16GL1vPGR0SSJDgkshoToCcUM+Qm4wFhKlpI?=
 =?us-ascii?q?9AotwcYvh65gOj/9Ei2FPtLlC5I3ig+T56hNQQ7BhtBEsXURwaJgrKH0IELw?=
 =?us-ascii?q?smFwD/1SYJjUfSrFDWUyF05XPwH1s3Muy/q9Gggt4Pe9vQKMlFfjns7zX05u?=
 =?us-ascii?q?jKVsmyChg426OCwBuRJ/q9KY5qBrgrJF4cONTq0lWHEqgw3nk+TMpxzlPd2i?=
 =?us-ascii?q?knPwsF4FM82Mb09uQUNPGymMv/0eJMR0o+O7F67F7Fs8GlDUI2PeHG2hAr8k?=
 =?us-ascii?q?E6X/xBt0aZipJrNi1p/NtYk9z+HUaVBvIHBwV58SPDy84uNSafZScDoDbh8P?=
 =?us-ascii?q?W4f0/xr+4j29tsWXVmBLZnBgMf3f3zNdo2UwEcJ3LRhV00eQcoZQZ2d49KwL?=
 =?us-ascii?q?usZQaT+RNxYrt8Jz3wqWulvmdHWCkq2gquTHlcSxhaci79Zri8yoJsZwPWfK?=
 =?us-ascii?q?so+JNYS0uhtzo2v2JjzbH/7r0SzCxc3A5VM5uh8SxMzsWYzU0laRZi24/Xih?=
 =?us-ascii?q?SSosyW9SJMo1lDkD44N8HhQbMgxOe1sUg9zt/7Qs5+VyPwqLKBUqg7i6cLK2?=
 =?us-ascii?q?8E4hudANEt+uDv0lLJDjEl4GbYWOamwuTmVZ5KsiDSJnCiNUmRc1FQ59qzUx?=
 =?us-ascii?q?b4EaqdB2yoktxRz/it91EwSpmt6rZGtl0GvSpYWGI4lXUJYHkTWnvAoUv5wT?=
 =?us-ascii?q?tdeSL31CvTAITvQhNE93h47HhdZsLondOic5//qRRESEBpR8xetS6Evrawnk?=
 =?us-ascii?q?VfYCDN4iRerTkdwEwt+GjjMDqRWSSkhnqE6a58irmODGnjX20p8OS4FYC5GU?=
 =?us-ascii?q?vgWjYunIpf7FJzCgj32Y0gOIXr2w3HefO5IxUU5XpKqi9tyPDM87oWKY1RQ5?=
 =?us-ascii?q?TleKOdvWcJjAmOddSTj6RkkefjaaKnUZ0ungZE3//MAwRJpsn4qnw1liTy1K?=
 =?us-ascii?q?2uyFDzYTfo8GYFceWYZaQ5mAPpgOBmHK8qqlxyScisEcYhtNMqplts4KWZNS?=
 =?us-ascii?q?+9s7jipeveZ8R0Z6FW290tUsk0E9hI5u/cI67BpWHm5mPX+tXvamxDufezz9?=
 =?us-ascii?q?CX4lLbcsr+D7KYJKSpIsgRHY/tfY5Cr00ut191kuXHXfRl53/oJAO9HWGVV7?=
 =?us-ascii?q?1bYqe4aeVYjuVlyX2n5MpuZMCQYT0BG1X+Bd3wB7exG5FjjSZYLAOaEMGznb?=
 =?us-ascii?q?vrHVzzitdQ/FCbRgrYCoRU+j1GkagUmt8PJdtSGhnE77NW2XWy4lw+e4SDKk?=
 =?us-ascii?q?8rjwb2rO2f7vE3uzmhrFeVBwmHWwVdMN/SEg4usZWhO1WyvqGLCKtvR9CiCj?=
 =?us-ascii?q?ohGKRrqtw7H/US4xtnt5GoTeM3ArLBqWn2/YP5Jo9upgQ/Jjt6C28LzDIb78?=
 =?us-ascii?q?+oKpInckyI/zMeVMJeaelWMICvfM/PDI8Akc/hDRt+L8m9THWBLYSSKSVtH4?=
 =?us-ascii?q?f4o97Ua1kKbudjxFT4BpNKycBshT3x9N/Mn+ZmHHkcKPexy39elbDiqh5eaA?=
 =?us-ascii?q?IJeLLyF8EnGY6sacscXbUjJL+5drQzBDN2uPviNlJT69Ab/i5u1ElrrZBwLe?=
 =?us-ascii?q?Y+TOtnAbrqvNBxnotpYPpiMiOGbaZQqGhywF+KfcBXf3PbFlIgDix8=3D?=
X-IronPort-AV: E=Sophos;i="5.93,352,1654574400"; 
   d="scan'208";a="81542656"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjQwXbgShy9SXyMgk+kNv7yYzo3I7AUd8O4fAYPhzay5r2xp785XQCgeQq1YNv16k5+3YsKyPTCjbLBUfnNFmh0nxObJ1TnoaN0jH3o7QCK16xrZCVJub3h6WdCNiQMoI5UduDzerB5aKdJ2itGD8sUDTybRerCt7X/CxWG+0iwB5l2OR1n3ZS46FJSS9XrKNw947nTlBONNoTb5cGhry4GT5cq6RoiQWvKlA++a9tbnx/hM9MMXCcOk2T/IXJVAhliWiVhXwKD6ioL2bzmzbSxy924EtjExsboujBguTUR9PzUKu1xYCt8IZJu2dyW7WZpF0GjMvZ/91sCQFnJ9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yXpmNzie8LeUEtzFuMno5KC9eU6z0SNVvIdOvNWQ64=;
 b=GtX4FTyqem+Rl3AW0ku1/KizG15wtYVpj6b+FP7OWcqPBe1Z33WphzZmE5Rey78D9XKNlnWgBUOlGbsGJO5ZryGOrsE+upwhlTUkEJBJUaRZ6zzewNqAuCpbpcSbKfz5LGR8HyUA/xwvcaaUCOi3wVirxK9l29eUXxLyEY8twsFJAybUhf8NYLJNDpC0UQmyapM+vh+gnsv6swJKHhhj9z1uqgrrcGTNPBvF3b66OkeSy5h6wKyXDJiKE5tEPQ1KgrGZBYBkVwUwZpCsX4sQB5VxU6CakAB2cgnmwcjuAvKadZ128yXTsOrdMwsNFOA87WPcI+LVrSV2vopXucWPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yXpmNzie8LeUEtzFuMno5KC9eU6z0SNVvIdOvNWQ64=;
 b=pcV9vHCZYxou1dZWu+XBJh1Zzgs8/INgpF4hPI9oA14ds80SmMzmqKIskQCWFYIwoClGG+k6q8xxqpef6kE+7ERnrTBHHLQ7tg7oEvD6zkPB/+yLe4mpM+sLwtq2SPRzSM+m6lwBeot3/V1+PJybO8LcC1LHF7yoa6GWywDfg8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Sep 2022 16:27:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RFC] rangeset: mark a few functions pure
Message-ID: <YzRZ04X4G6f4i6Nt@MacBook-Air-de-Roger.local>
References: <a397e671-f93b-cd8f-9019-d005db7c7009@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a397e671-f93b-cd8f-9019-d005db7c7009@suse.com>
X-ClientProxiedBy: LO4P123CA0560.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca38c9a-7fa2-4c7d-f6fe-08daa15d9715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4SfpfvASWW/R5/c2aIzV2ntUsBFnUYr2uKuLlda0eLpKUa7if0mptpUMWniL5klfLbhtz4cjfQm7uuNWQrX6Zmw7hIO/GX+qjNlDy8N6Ygtnp+MQkvaibB16w0nyez/pEvdq5J4ats78yoRtJw0zuPbVUgUQK4VH7YKMyIlb/vbd1Igo66BKhUPwLa6XBWySc+qfjmgVKiG00QcGEVwpVHlsKQa6V75Xnz99jS5/pd4U8bYoPihfm0K4evizueO+tHM7m+ryvqvyJOuO6j1Jcayc94omsYmym/7u6fqDmJ0C052WSlU0buCulpHuzYn0VUefb/SJ8c0TFzzwCSwfycoPIcB6R/eK+MDU9q3vVTAG+FmBwuGDouipZjtOLQipQI51c8451QGm/Y86C63YKAFBxf4vdbquv17K+tsm3EnNs5Z9N9f8/w+/JvgNSZeEMU3X1ni64nwCQOxol2znT5905d16i5rOciaWsRgbDFcr+56KVj5vEcmw4VouwQOSytgvDuM3puLkGhF/IHIGmQU3MyE+1Z8I+z36eocZWAZg8vnzQU9+Mh5CMipB3c3iYLVxpBPja1uyzx95uBAlxJ/rOWzbve2yFfqr/nkwjIhuLKwMphLVTWzrsQXkbY0wMBp2wUwnfhbcWOQ59Q0kBm7CFX/J5ns/GIdU+xdxG/7P3CeljbGG3D7XX620jCxCMJDhc64vaNeDx9r1h9cGjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(6506007)(9686003)(26005)(6512007)(38100700002)(8676002)(82960400001)(316002)(54906003)(4326008)(66946007)(66476007)(66556008)(85182001)(6916009)(86362001)(6666004)(186003)(478600001)(8936002)(6486002)(4744005)(41300700001)(2906002)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0gycjFDM2ZNc1JwY2xjM0g3OWZ2V0ZETjNUN1pKeUZGWlBJcFFNZnI5UjB5?=
 =?utf-8?B?MCtLV2EwZWdGalk2RlBQWXhqTlRsMXRSQlBNb3pyWFVrS295aHVoRzNnSFcy?=
 =?utf-8?B?YzNwMUhtM0I0c21WdWl3NmgwODdvYUdrU0c5ZHZqdTNOcm5ra3hQS0h2SUhU?=
 =?utf-8?B?SFNURERDTmJuVVhTeDA2cDJMbTNHM0cxWWNKVXBCelVWN2RKaXNENzVtKy9N?=
 =?utf-8?B?OGpla1NjQ205NmVINm9aUS82cDA2UHpZYmU1V0FyMjEyb2g4VEhYWXlhdXVa?=
 =?utf-8?B?K1pZdzRBY1QzSlVEd2RuREZKR2dmOVhQb0YvbVAyZzduVDFpQ2Y1cmhvd1BF?=
 =?utf-8?B?dG1EYitPYUNXR3NydzR5Mi9UeHlYZFBTNHJ2Mzh6eE93QW5WN2dDYk9IK0Ew?=
 =?utf-8?B?SU5wSnlXZUVYNWZqeG1MSWhuNzF0blhIVVUwU3lVOU93enNOUDRHZUkrMHAz?=
 =?utf-8?B?bUpGa25xT3o2dUZSMW04czZPMVpYdXdmMzVkOHJEUmE5SFgrSERvQmFaWUNT?=
 =?utf-8?B?K293TDc4QWJ6YnhOeUxxWStMMXpoR1QvZ2UrYlZRYnZuMFpYYklMYnJUeUhq?=
 =?utf-8?B?T1VFVVdiVjFzU2NHcnpyRk9sem9McjBHODRwSG54bzNiak82QVVOWWVrQXNi?=
 =?utf-8?B?UHpuQ1gycDllNGFEMWNSTSttTEdPTlFnVmFuTkJtOVZnRUVFZkNBQ3grOCtQ?=
 =?utf-8?B?UkdYaFRSR0RrSlppbmNkT3RMTExYaVFmMEtjVXpVb1ZsOC9zcTFZYmVZanlo?=
 =?utf-8?B?Tms1aGNRTXVIKzg0TkNSVHduV1dsaTVTMjJrT2JnYTh5ZXhwM3dQMHFWcmwz?=
 =?utf-8?B?ZUhjdDVPOTdnS29LaUd1R0hCN2NZMTBtelg4eGM5T0o1aEZ5OGRIaDVjT3Mv?=
 =?utf-8?B?WHgwZUNoZEpacGVxS2F1dHB3R3ZWS3FRK2ZGeUtCQmR3Nk54Snc1YmllTjBC?=
 =?utf-8?B?TWxya0hwTGl4WTUyVmZWbmdLbTdZRlNNaUZHQUV6eXVJK29tQkVkREFvalhT?=
 =?utf-8?B?L21lYk9KYWIrRTQrY2wyay94R3R1ZU5Ua2ZPZllHSzJFYXVZVVFCMmt3TVVz?=
 =?utf-8?B?UVJvTVFHbmhIZ2JPL0FsTmpUdGUwbmdXd2JyYmR1aHhpSGhJVTNMQkpOdGhL?=
 =?utf-8?B?cTFqTHpUUEN6eVMvbERZbmhVdXI5eXZwbFlDWXpOa0ExRnBSTjl1ZUJRTFhq?=
 =?utf-8?B?NzlJQ2xUZDBKaXVUdkVWNzRTb2xNTldnYTd4Y3o3QjRhQW1qWU1oZVRQOGJ3?=
 =?utf-8?B?TEtNTDNRQlVVK1ZLdCtDZUdURS9DRkE0WnhmN1NxRTFoRWFzZ1dsQ0xEUGdr?=
 =?utf-8?B?Vml5dmJRd05ubncvUHdVWklXajdSR2lSdUZYSW5YWXg4bFVjcUFuR1c1QWFm?=
 =?utf-8?B?cTNFbjdLdTBLWXM4U3RIa3hFUkxrTStWTm4yemFFWHg0UW5ldXMvOTVTQWk4?=
 =?utf-8?B?eklKaW9QMmh4OW1oRDZOWVRKOXpRcnZwbkhsR1pHdHNWU2tzbmxoeTdCUnlT?=
 =?utf-8?B?bnNmcDFDOU96blYzbVlyQ0Q1NWM5UTZ5VTU5WWYyZWpBZE1Gdkhta0ErTXQx?=
 =?utf-8?B?bDcrRkp2Q05RK1VwbDZIWEJKOENVeVNMd0liSVg4UE9YMmZYYjBweFl4WEoz?=
 =?utf-8?B?eHYyUlBtMUhVaHNLMW0xamFTRUxmZm1NQ2JpdFJMZnNVbk1IM3RFTndaNVFa?=
 =?utf-8?B?V0JwUmx0cTlsR3dhdHhQcSthNWZjNnB3VGdXbktxVVNSaDVvS1ZPSGtTMldQ?=
 =?utf-8?B?TFQ1MWRXZ0JkL1QxUjlGdlMrdmtBZ1U4VTJOKytnYkxlbDhMMlhOWUlBOFVy?=
 =?utf-8?B?TGdRZW8wMUtkMXhJc2hnNytua1RuWE1XZkFiYVhtNW8wUnNQRi84OEg0ZThK?=
 =?utf-8?B?WWdGdnBDODVPV0lYV0d6dUVMUlR4b1VYMGdQRjJ1VldnRTlWdzRMRmk2ZDNQ?=
 =?utf-8?B?aUZaZWZqQ2FHWERxdXhnVGZiRE5sbm81RE1SQXBNVHdoQkpLT2pFSVRsR3Yv?=
 =?utf-8?B?dWNTUnpmcFA5VlFjNGdrdDFOZWtQN0FVVHZLdzRKQk1KWDk2U0NYNVg1NW4y?=
 =?utf-8?B?MVM3b0thQWJrZjc1V1ZFOSt1Y0thMlVoUDIzV3VZK1h1U3dYR2JSdnp3ZFVi?=
 =?utf-8?B?TWZ1SWZGTlNDNVY5aEhpY0JSTTVEUjUvRmJ0NFNJRlBnUlZHRGhGRU9Eeng1?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca38c9a-7fa2-4c7d-f6fe-08daa15d9715
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 14:27:37.0643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd5pdOKclFp6tVa3sLHDSZdWIU/G6XaxzdJyj145qTqnCfowE/uuxqeEo2gI3q/Drn3oKhaamo2uywZy6uj6vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6105

On Wed, Sep 28, 2022 at 02:12:30PM +0200, Jan Beulich wrote:
> While for some of the functions there's locking involved, the acquiring
> and releasing of a lock doesn't alter program state when comparing
> "before" and "after" the function invocations. Furthermore without
> (further) locking by callers, return values are stale anyway by the time
> they can be evaluated. Hence both CSE and DCE are okay to occur for
> invocations of these functions.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC for the (imo) ambiguous wording in documentation.

What happens if the contents of the rangeset is modified outside of
the scope of the function.  Ie: would for example:

while ( !rangeset_is_empty(...) );

Become an infinite loop then, without taking into account that the
rangeset can be externally modified?

It's not clear to me whether the elimination of repeated calls take
into account that the observed variable can be externally modified?

Thanks, Roger.

