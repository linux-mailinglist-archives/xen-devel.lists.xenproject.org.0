Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D59F511B9A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 17:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315157.533562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjFE-0007i4-G3; Wed, 27 Apr 2022 15:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315157.533562; Wed, 27 Apr 2022 15:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjFE-0007fs-Ck; Wed, 27 Apr 2022 15:06:20 +0000
Received: by outflank-mailman (input) for mailman id 315157;
 Wed, 27 Apr 2022 15:06:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njjFC-0007fm-0b
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 15:06:18 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94075de6-c63b-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 17:06:15 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 11:06:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2878.namprd03.prod.outlook.com (2603:10b6:300:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 15:06:07 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 15:06:07 +0000
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
X-Inumbo-ID: 94075de6-c63b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651071974;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dVd7fsA4q9gi4YYePSS3oTcb1iKc6Nw3qj1KYjAIJxM=;
  b=KCZ02wJL3j4Nw9F+9p7lYFYIz8gqJZM/GUit0VIX9v0ZlxUxnGBYBexR
   7kHxasLd7SfN6tr+1Q4gQDWUpy39fyV7tDrQkjmRzAUjGCshTLEt84D6/
   ZdncVkQxtS7pvCPBaV+xPp1PFtHiVjwVbcni1y1SBBwhLIcqiqbep6DFN
   4=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 70050771
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8mKp6KjSbrHlePnnE+EwhjnvX161FBEKZh0ujC45NGQN5FlHY01je
 htvCjrQbviJYGb2LY1yYISx8k0F7JGGytRlHFRsqStjEy0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nS4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YScMbq+ThNxMaj1RNxBVF6JH04D9Hnfq5KR/z2WeG5ft69NHKRhueKc+paNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuocehW9v7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wrN+PJovDG7IApZyuTuFYr1fISzbMhRj1qXq
 D+B/jvDO0RPXDCY4X/fmp62vcfNly7mXIMZFJWj6+VnxlaUwwQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzWnpFaUsxhaXMBfe9DW8ymIw6vQpgyfWW4NS2cZbMR87ZdpAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obs5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:8NcYhKln22SkJRgsjPc87vXu6LHpDfO+imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH42GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 P4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR4Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqWneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpf1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY3hDc5tABKnhk3izylSKITGZAVxIv7GeDlOhiWt6UkZoJgjpHFohvD2nR87hecAotd/lq
 H5259T5cBzp/8tHNxA7dg6MLuK40z2MGXx2TGpUCLa/J9uAQO/l7fHpJMI2cqNRLskiLMPpb
 WpaiIriYd1QTOlNfGz
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="70050771"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNrAxurjs4jzFgWet+FieXyE/uMQsKoGjP9/K6Z52K671LNk5w0pmW9aecKER5ywR1q2TFGpc7LqWVP7jt9uxFzhS1YymczfJc/pTVw7o4JQanI5IA5Fn+emJmVKTZjCEbnb9KP3KO+26m4KN1r5ZXtOMnMkbyAMAWQTlvJ1rSLHmjrBiq9LNTsZ7ow4zurxnFJ7AGfyZS2DlHwJ1PKiK5VE692xwNLLQeBjrRQvlkD7PTvGQT/Q77jCxJqjHEkvznqQMbNdH0BBxtxXSqX6suojd343mfCO45F4pZwBvfbiNxezXR2i0BjmJAdeasDQcWxOtYtximzMI+mXWQp0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfNP0m9DqoUThoqo7gSB3LAmxV++NOd1on2h1xZxePM=;
 b=VGZiVyImU4G1mG7f0TcXfTZEcyuD28kx+nKtpsgdePuUi/4XTG4FYz5zZKvtqYzHY0fIZyy/DGc7vVzQj9DFZ2mbxxiUteTnH97FOdfqRTDR/c/+yzEPVlxkh1q2yckPwKos84g+oixSCfg+IyqLKZaPeS7gZ+I8bBaVe9w4y29hY2FYeg4+I1mzNe0FWfH87QfEHRO4pYQRx+5OGwuFGk8+gg2jl4KG3BUpJcG8djaormt0FNuUzfva6RvBjJZaSwxouY9CCbZQTmW+YZQ1bpcQs3dY/jNv+X1CLsQ6rQ+lI5DlDIA9E1B76oRrdKP/27rGf4maSC0sZKQSuv2b8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfNP0m9DqoUThoqo7gSB3LAmxV++NOd1on2h1xZxePM=;
 b=RjCco+VEkqAZEqFufxsl5h5WQvk8aXcy3Bd6nmV11i0uhg2BPVE6IHsYV9rqQutBCruIKjwHm0JBlFob4xRUtJSUoFipU4snOfBc+vqlYGPd0hLGy+Bj0w6bJxTXOwiozziRt8g0bKA4fmmKLR/gz+g6YoZ2qJoCQViCQydbBmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 17:06:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/4] mwait-idle: add 'preferred_cstates' module argument
Message-ID: <Ymlb2Wly25k9bF0z@Air-de-Roger>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
 <Ymk7BjXdyiMUGoc8@Air-de-Roger>
 <47b50c64-b8bd-df95-9de9-175780c50e0b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47b50c64-b8bd-df95-9de9-175780c50e0b@suse.com>
X-ClientProxiedBy: LO2P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da721a6a-ab26-4d0e-67b2-08da285f74b5
X-MS-TrafficTypeDiagnostic: MWHPR03MB2878:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB2878643EAD470963F5564E658FFA9@MWHPR03MB2878.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8aKLTsZaFpke9qrC5ZJ4cKc/OkIhhnayO0kTr9J069Kah0UUjOdafp/cXZlxQoTK+3jYxeYaWCcE5KOI+/XPU7vcKyTH9l6BBNFzzNux+t4VtAERi7j6yQh6rE+wYaNVHvgfbh+affzxWyoawW6BKAutGKeZLV8sbeKRMuQ5aTlEdcbVNxioqj0pdxoZhOBBDd1zUEs8wtDeDgstgZTDqfEaR3rm5OgtpsoQJNexOBOPmLwdmwVDWPq9YJil3YwcTJjtCE7E3O8Bpw1t6Pynofuww46a4vjyHkF7SeE+fE2n0XK6wpxns7FK4I/pPawb6ggdvMkxcMmlp2iD9Mvtrai60zKU9J4dNdSrTYiacP/r60AVDLwbi8LK3OpEhZukqv9uH7uAw2DAmLlqi8g3URQzpa6nkKOVkq1vHgQruWs+xfUk9yP1sc0fDlAbV46SVyur+dO7ZbdbtZ6S6f9rzvGf3iQ6xOGJyAk7qlkHUTjd85lxWRlRw3LLGsdLFFVNXSNSGtDCgUQYu8tSw9Ea2qgHU1ArfzRi2W5j3SHh1MROj3Uq88Y7v3GrOVHEgK9tF4Lr1lBYNHroTmIyDaTTMRGgoUD8Hh7caVoyqUVAdxUvuxT3FpdWynq+J8D+novW/OXP4bJuCX47mMk7ZXTaK7rsi15Fsu1vNZmOweC2DTaHBOA8TaaFfefBhs1w9ukZM38rjFpCvl7uxPURtpJsgxj1Oq1KKSdyg5k24hxcSwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(6506007)(6666004)(2906002)(53546011)(9686003)(84970400001)(6512007)(83380400001)(38100700002)(33716001)(186003)(26005)(8676002)(66556008)(66476007)(66946007)(4326008)(85182001)(508600001)(6486002)(8936002)(5660300002)(6916009)(316002)(86362001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnJxalBYUFk2VWZXaFlRR3BCbWN6WW5QS1g4L0NDNUtUUHN4OWxjL3orenBD?=
 =?utf-8?B?WUY2dXErRXVoUktuWk1IUEVrK2lUUmV5eVc0UExvdW5HMlEvRWpoRWlPdWRQ?=
 =?utf-8?B?ay9sR0NxOGtmUmNmQXpuZkJmME5KY0tlT2xsOE5xSjViVGY1SUs3UzduUmJr?=
 =?utf-8?B?dHdSdnY4Tk8wSVQzY3J3K2FiRjI3UGl1bGRVM0puQk5QVzY2QS9FbVZRb1g1?=
 =?utf-8?B?WXZOQW9jYmd1QTUwVlFrZlVaemFjSUJ1R1pxWW5hOGM1K3dJM2htS3Q0ZU8z?=
 =?utf-8?B?a2FwMThhd01hV052TDd6b21uSGx3OTJvbXNEbTduYno0YWdIemFYbTlIS0dR?=
 =?utf-8?B?cW9pVHMxeHFHQVNnbG4yODQ3c1Iwc25WOFNTbXh3K0FUUDVJMStkMGo5RXJ2?=
 =?utf-8?B?RWtZZGFpUWJrUzB4THhWN2lkcSt6eHJsM0VkOGpobnFDaFlIZ0VOcldqRkJH?=
 =?utf-8?B?Q2ZZY3NoTzdCTDRWUjBhMXNvMkg1NkJLbmdZVXZhUmZveTBiYzFOOVBmak5S?=
 =?utf-8?B?UGwyeGsvMEVnVTFqS3ovdXVCaW1JbjFML3IyRHErVUJTT3dtbWFjOCtlVjFs?=
 =?utf-8?B?NTRFak1VazNSRlc3dEpWcGl1dEtnM2RVcm9oQ1grcHZLRmpCazRzZEZPY2xu?=
 =?utf-8?B?RnQ5S1UzNmdkQ0tXcklWQmNndVRNQzB4cktiL1FFRWhXRlhhSnI4YjZ2YUg5?=
 =?utf-8?B?UlRudFBRYW9HWFR4dThiM3htaDhYUU5hK1VobUc1YWx5bEcxZlk5Y1lYTkkv?=
 =?utf-8?B?Q1NzenBxMU1JRElKRXhwcjlDYnB4ZzRNVVhUUFQvMkJNYTNnYzg5Yk1peVJY?=
 =?utf-8?B?NEVFeHM5MENJNDU2QVd0OSt3UWxuRnRtMElHOWVGaTVKczRDTGt6L0d3U1V5?=
 =?utf-8?B?VWt2WkRIbFNOaUZva3cyZmpaMFRnNmRoU2dRQzVmMENEZHpVWk9FcEd4c0Yv?=
 =?utf-8?B?NVVpNVB3SmNjNFM1K1dvVUZsQktYZEtpWWNGZHJtRFhCdEpRdnJyVUVIeTN6?=
 =?utf-8?B?V0RrSUJudllvL2xvNUdZQ015TDZON0VaSGVEOXJuTVZScnpielVoQVZ3TytB?=
 =?utf-8?B?RWhIeHV6bjVTSnVybHJ6VU9pRG9oOEEraTQ5eW1vWXVYNThXNmlyVDUyWDQr?=
 =?utf-8?B?a3N2TXRTbjMzK3JKejViclpBWUNOVXVEOXdkcXlNN1RmTzFUemNpWDBCYVU2?=
 =?utf-8?B?Vkh5bTNrOTdoaVVjalU0Y0IrazNVbi9VejRQQ2tzSkp0UnZwK1l6cy9idTdp?=
 =?utf-8?B?YVdRcEdZWGtOa01nV0J6MVQ0WGMybitTOGVTV1IrbmtveXZUd2dPeXBOTy9O?=
 =?utf-8?B?R0tOTmZrSEZQdm5lRUh5QXBWeTg0UFRiUGRVU2lVNStvUVF6Ymg4KzVpYitP?=
 =?utf-8?B?OUJZdHlhZ0RRaDdoNE9oNHR1aEZIcEJ5TzVXeUtpWmtMR0FwRE1xVXM2MGt2?=
 =?utf-8?B?M1dZcktpYnk4SFY0N3o1WDNXR2lGNldWdEw2Q0Y2L3pidEt5ekE1bVFzYm5K?=
 =?utf-8?B?RS94YTNINlErZERrREFpTmlLek9OL0VKd2JTQllZMllncmNZV24wclNvY3oz?=
 =?utf-8?B?b3RCTmhJY0ZRS3JPa3c4Zi9DaU81OWlTQy83cVFTcFBpS2VzY3liZ2ZkaUJZ?=
 =?utf-8?B?Mlg2Q2crQzl1RWRkVGc1T2REQk9jS2VXbGp2U0tJNHAwQkQxdWl0V3ZzSmlC?=
 =?utf-8?B?R281cmc2OEtxdk9ka1JMZ1NCUmtuOHZwT2NvUGxKOU11L3o4dk95NHRFejZz?=
 =?utf-8?B?VzFwakhTdDVpT0FaNGloWDZlVHpYVWJDclhNeEIzMURhK3NNMmgwNC92RHhh?=
 =?utf-8?B?NDZyblhNMGQwbDlxcmVPVWtDZ0plS3NMak0zUlplb0NYZ2ZhL2ZYVjRHUndZ?=
 =?utf-8?B?bXZyTVc4YTA3KzFXRmU4ZVBWUnN5YVpkU0xyVHRtaDZKeFlSZGZaUlFtN2U0?=
 =?utf-8?B?bWdIUDJwMnR2NzB5eE9XQU5zaUtabDg5UTVCSFUxSUwxNmdrM0hnL1R2cHlP?=
 =?utf-8?B?M1k3MXo5bFFpeDVjc0xRc05KWnMvSGJvSDFkdWxmUjJDRFZJWFYycG9UaFY2?=
 =?utf-8?B?djllaytYK0JnNm5kbU1CR2UxZlFtMGxkSHlTeTNDTDVsakZpTFdyM01oam9x?=
 =?utf-8?B?M1lzVHlHcXJWd0YvVXAyZWtQSGNuQTFONzA4V1YrL3g2K25PTVVZNS9xZEVz?=
 =?utf-8?B?b2pFWVBVYXdrMDlIb3p5V25KUjMxbURnT0psVjBnQ1RRVWV0VzJ0bnMwc2tX?=
 =?utf-8?B?Z2NaaWNsMVJiaVVVNEx4ZVNMdWFCay9UZHFScFh6VVVoWDFpNjVhQ2JZWmcw?=
 =?utf-8?B?VzJiR2dKS3hvd0VzQ29nSXhsMG95RVlNMmh3QVNxMzhQMURJd0VJZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da721a6a-ab26-4d0e-67b2-08da285f74b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 15:06:07.3284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2QiyZ+YOa7zwzvtackVt5zWiB24FrlYRRJkq77E+cLjYEiNBxLpVcZDkLyg+XxmU9MyjGUGZE15MAmXqNxCKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2878

On Wed, Apr 27, 2022 at 03:41:24PM +0200, Jan Beulich wrote:
> On 27.04.2022 14:45, Roger Pau Monné wrote:
> > On Tue, Apr 26, 2022 at 12:05:28PM +0200, Jan Beulich wrote:
> >> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >>
> >> On Sapphire Rapids Xeon (SPR) the C1 and C1E states are basically mutually
> >> exclusive - only one of them can be enabled. By default, 'intel_idle' driver
> >> enables C1 and disables C1E. However, some users prefer to use C1E instead of
> >> C1, because it saves more energy.
> >>
> >> This patch adds a new module parameter ('preferred_cstates') for enabling C1E
> >> and disabling C1. Here is the idea behind it.
> >>
> >> 1. This option has effect only for "mutually exclusive" C-states like C1 and
> >>    C1E on SPR.
> >> 2. It does not have any effect on independent C-states, which do not require
> >>    other C-states to be disabled (most states on most platforms as of today).
> >> 3. For mutually exclusive C-states, the 'intel_idle' driver always has a
> >>    reasonable default, such as enabling C1 on SPR by default. On other
> >>    platforms, the default may be different.
> >> 4. Users can override the default using the 'preferred_cstates' parameter.
> >> 5. The parameter accepts the preferred C-states bit-mask, similarly to the
> >>    existing 'states_off' parameter.
> >> 6. This parameter is not limited to C1/C1E, and leaves room for supporting
> >>    other mutually exclusive C-states, if they come in the future.
> >>
> >> Today 'intel_idle' can only be compiled-in, which means that on SPR, in order
> >> to disable C1 and enable C1E, users should boot with the following kernel
> >> argument: intel_idle.preferred_cstates=4
> >>
> >> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git da0e58c038e6
> >>
> >> Enable C1E (if requested) not only on the BSP's socket / package.
> > 
> > Maybe we should also add a note here that the command line option for
> > Xen is preferred-cstates instead of intel_idle.preferred_cstates?
> > 
> > I think this is a bad interface however, we should have a more generic
> > option (ie: cstate-mode = 'performance | powersave') so that users
> > don't have to fiddle with model specific C state masks.
> 
> Performance vs powersave doesn't cover it imo, especially if down
> the road more states would appear which can be controlled this way.
> I don't think there's a way around providing _some_ way to control
> things one a per-state level. When porting this over, I too didn't
> like this interface very much, but I had no good replacement idea.

I think it's fine to have this more fine grained control of C states,
but it doesn't seem practical from a user (or distro) PoV.  But then I
also wonder how much of a difference this will make regarding power
consumption.

> >> --- unstable.orig/xen/arch/x86/cpu/mwait-idle.c
> >> +++ unstable/xen/arch/x86/cpu/mwait-idle.c
> >> @@ -82,6 +82,18 @@ boolean_param("mwait-idle", opt_mwait_id
> >>  
> >>  static unsigned int mwait_substates;
> >>  
> >> +/*
> >> + * Some platforms come with mutually exclusive C-states, so that if one is
> >> + * enabled, the other C-states must not be used. Example: C1 and C1E on
> >> + * Sapphire Rapids platform. This parameter allows for selecting the
> >> + * preferred C-states among the groups of mutually exclusive C-states - the
> >> + * selected C-states will be registered, the other C-states from the mutually
> >> + * exclusive group won't be registered. If the platform has no mutually
> >> + * exclusive C-states, this parameter has no effect.
> >> + */
> >> +static unsigned int __ro_after_init preferred_states_mask;
> >> +integer_param("preferred-cstates", preferred_states_mask);
> >> +
> >>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
> >>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
> >>  static unsigned int lapic_timer_reliable_states = (1 << 1);
> >> @@ -96,6 +108,7 @@ struct idle_cpu {
> >>  	unsigned long auto_demotion_disable_flags;
> >>  	bool byt_auto_demotion_disable_flag;
> >>  	bool disable_promotion_to_c1e;
> >> +	bool enable_promotion_to_c1e;
> > 
> > I'm confused by those fields, shouldn't we just have:
> > promotion_to_c1e = true | false?
> > 
> > As one field is the negation of the other:
> > enable_promotion_to_c1e = !disable_promotion_to_c1e
> > 
> > I know this is code from Linux, but would like to understand why two
> > fields are needed.
> 
> This really is a tristate; Linux is now changing their global variable
> to an enum, but we don't have an equivalent of that global variable.

So it would be: leave default, disable C1E promotion, enable C1E
promotion.

And Linux is leaving the {disable,enable}_promotion_to_c1e in
idle_cpu?

I guess there's not much we can do unless we want to diverge from
upstream.

Thanks, Roger.

