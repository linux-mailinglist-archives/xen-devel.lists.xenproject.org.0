Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9316F6E2832
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 18:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521158.809515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnM7a-0004j5-4j; Fri, 14 Apr 2023 16:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521158.809515; Fri, 14 Apr 2023 16:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnM7a-0004fk-19; Fri, 14 Apr 2023 16:17:58 +0000
Received: by outflank-mailman (input) for mailman id 521158;
 Fri, 14 Apr 2023 16:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR8y=AF=citrix.com=prvs=4614ad092=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pnM7Y-0004fe-E2
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 16:17:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7fce995-dadf-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 18:17:53 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2023 12:17:51 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO6PR03MB6226.namprd03.prod.outlook.com (2603:10b6:5:354::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 16:17:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.043; Fri, 14 Apr 2023
 16:17:48 +0000
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
X-Inumbo-ID: e7fce995-dadf-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681489073;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jEZOa8afM7pe3p3pvBaKoGXqiXUTARSdTOf0VVwjX2o=;
  b=LpaHS1d6YNatkzxzkGpIQK9MDTSPYmwLZXbVPwwXDt3ahgMWQe0scIkf
   kYAmtnrU8yrij6FyHq1n+RcOoT4J0AJWiyAuUevwFTds6tAl7q92XiRHX
   8C6yf4vjOduLP/yln6DPnXKk6SdeN0DTah3BpT0X57etydpufX7Vw6GtO
   4=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 105450429
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jETZSq9Kj7dclMeJLKEfDrUDs3+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jNNXG+OO66JZTT2L9AlOoy1908C6sCHyddlGQdspH88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOakX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklEq
 tY6cCtSRymIoL7u/fW3Q7lr2MUKeZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUvgNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpPSODgqqQ76LGV7nUxIz4ZVUeZm+DjiECjfdVBe
 mMwpCV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0XTsr0
 1WOkvvzCDBvuaHTQnWYnp+XqjWoMCRTMm4GZgcDVwIO59Slq4Y25i8jVf5mGa+xy9HwRzf5x
 mnQqDBk3utDy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:uwxzfq0nPVxyfly5OkMGaQqjBVVyeYIsimQD101hICG9Lfbzqy
 n+pp8mPEHP4Ar5AEtQ/+xpOMG7IU80hqQFmLX5XI3SKjUO3VHEEGgM1/qH/9SNIUPDH41mpO
 5dmspFebrN5DFB5KqU3ODSKadC/DDzytHMuQ6o9QYOcegFUcBdxjY8LjzePlx9RQFAC5Z8Po
 Gb/NB7qz2pfmlSRtinB1EeNtKz7OHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoiy2
 7YiAb0j5/T+c1TiyWsmlM73a4m1+cJ+eEzSvBkv/JlZgkExDzYJbiJEIfyxAzd6Nvfk2rC1u
 O86yvIdv4Dlk84cgyO0GHQ8hil3zA053D4z1iExXPlvMziXTo/T9FMnIRDb3Limj8dVfxHod
 F2NliixuhqJAKFmD6468nDVhlsmEbxqX0+kfQLh3gaVYcFcrdeoYEW4UsQSf47bVXHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQ2TlLm3JyyVce2aUk7wM93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONEWsezAnyle2O9DItTGyWXKEgqAQOyl3es2sRI2AiDQu128KcP
X-Talos-CUID: 9a23:VsdqsmEMq9yPyaORqmJtq2Q2Qtt6W0TW6yuIHgi0ADZuFry8HAo=
X-Talos-MUID: 9a23:JFrFywo9gKBXD2e0KzsezyhAH+Rn47iMMllXk5sbnc6aZANUZTjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,197,1677560400"; 
   d="scan'208";a="105450429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSaa6kniLshVYGTCxCioV6nXhUPqC/RglUMZ8UFbbYAqx7gE+t/NfQhVb2iPPmZo/j/3wXRh/bwn1YFYm65zGGp5peMSTVT0p9pSWyqxp28s1ogrxaSVEjwGFjE/ZKgy52qwQTlki29c5Q2sLIzD+UxrrYP2/Z/d8L0OiyXYfiUtd5nsxNKnZesa25WvKeT0KPtRofW89g7P4Ya2ryEmlJ+YA55/DsQv0sxsdmuI2fr8wfvBoMGvlTL/j5ziCT/hJzIAfe9PzkqScyo8BTRkuxZmQggTVnRJVsphezyfM72YwozaggRDGzpPMvm5+/Gr18xlgouSGQ+a8nCCrt9gpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2cWvCC3TMiknbAQJ70yQk3bXAIp5XaHNtdnUXOvN9U=;
 b=hc2x5vLF0vH83rcA9kpQcULumJuhq5dzBTKITvkMsd5Y8u6ZEbj7joFo+ofm67rkaHfjr7c9sQjR+odhmdQe73/JSfHte2UrrdeH8vXKgfFJGpKPn34YKrIBFZX0ASH7JIT1PZYKbtERrqFWj7rrWNGg0IbKOlVHexGMhyFcI7sLUYFpo2/AzjEFEs374Gc2R7fS3EsPTjBiLeTOJeU2bA609EQWrGJaPUuukRfMMIEWvwuy/46XdG2n/8uZdnw7JywHYCYqQVEEbj7wl/t1omqHLme+ign7X1u+xH74G8ZUY+e9LOH14wYNBmLLXh2bm19MDs4xx2g/gpgiW+AxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2cWvCC3TMiknbAQJ70yQk3bXAIp5XaHNtdnUXOvN9U=;
 b=qIKEZniPG5KTLUN2Lfswd7j4WM6hl3yZJHfh72PIsy+35IaGVA3OZmmPkPFY6oTuPpPbeeEcMtrKC/w6QCbjUE8XrbBhA6N6N3B3HqV4YRvcs7XHISz3+cQ8NLOktLAni7TfBQvW44k+XZdITP/0EvBiFdiR/ZTL4/MB4qJTAsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1377fcd2-672a-687d-468d-ddc6d5b4be70@citrix.com>
Date: Fri, 14 Apr 2023 17:17:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] create-diff-object: handle missing padding at end of
 special section
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Josh Poimboeuf <jpoimboe@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20230414151933.53851-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230414151933.53851-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0272.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO6PR03MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: fffa0f9d-4941-413e-eea9-08db3d03c9e4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7q/+OKijDl13wzd91MpbgUwycnvO7fCwGW6bnaOsWs7AwTB18BV0Dk+boi7sJPK6UPgxzfgvxJ9KlIZJhT9fHnxQitpOTqE7fhgpyDUCsUhCBVQ1JTMkvzaMebftOkD8uPmdl8ofjnrym1wILIq5172C9iv84EDNdPNMgyezANeY8G2OVwh0cILyELgZZHjpfaypKPghCIh5y2NPe5liCMjax3xEYu129sh+sfwlqN3VNrOZUwKlYmKZ/mPBTdhTld8JU8HzAxcZSLXdyk6Zvx21EQSDYHe4y6Kn8h+KBWZylxZ6vQZhu8IRJCgG87iGFnGOtQv71En+qw3tm9zEl+eIgoR4giqlzRCvU1VfLpFJTbLyIH6osqttZUBae9CaJ8gulDXmQnVIbT9ftFZJqnfMY3n2v79brws27jikoqv46Oxj5fc2fNEGHsLfvgdq+7jYiK2T6bNS9HcmT2FRezjdwkiToRELSAsfWsy9gkfi3D1OBqJ2DWoXQ3YNepkFGQSm7BV/TIw8w1xKg8yDrs081+cQTw1VnAiUOaS5jLDC7D7II/7y9ROKdR7xvFZCnHj9zYpCQgvH4P2Uu/XvpEvibH5F5Io/DJj4qQE6Fmyxd84KrIC3HgpmHvGPmtFKeXLNGQ/Q2a5Ubg/Rx4VMqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(66946007)(31686004)(53546011)(4326008)(66556008)(66476007)(6506007)(26005)(6512007)(36756003)(31696002)(107886003)(2906002)(6666004)(6486002)(2616005)(186003)(86362001)(54906003)(5660300002)(8936002)(38100700002)(8676002)(478600001)(41300700001)(316002)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVBTVzZJM2pLbVMzV3gvYW5uN3J3WE9kNDRZcWpFY2IwZ0tpQXNpYU16WDZz?=
 =?utf-8?B?NkMvVy9rdE8yNXFXRzhzMmsrbDZJaURKTUVhUVpSWXpidFYvMkJPQXROQTJy?=
 =?utf-8?B?RXBnby80K1ZVRFNUbW04U3k3bndZSHRCS3dQOTRCNXFZTEdDNzVaQkF3TEVa?=
 =?utf-8?B?SCtML25QK2JjQ3JXb0ZvMm5yNHBzdzdXeXFpcVdsS3FRdy9NN09pRlJueC92?=
 =?utf-8?B?WVRGTGpqQ0QwMDkwZnlWLzh5ZjlHdkdCVDMwZXlxbURza1FoYVRJYU1mV21Y?=
 =?utf-8?B?b1JMYVNXYWV0Vy9RTVJuQitXaTRwN3JqekJCa2xkajl5N2QvWVNCYlN2bUQw?=
 =?utf-8?B?TVBPa3A2WDNhSERNRTlwckU5SzFpSzZJRWFFRE5KdFBleFpXYWVTMzJLMVRq?=
 =?utf-8?B?TDlWMFI0eWIyNXNCSUpNSXMyalVQbkl2a3J6dU9HanNrWk8yallrL1NMeFFk?=
 =?utf-8?B?eHg1ajZUTDJjYUdFZG9GRVpvcjB1aWhnUVRRRjZtNU5yR3RRL3l5amhSZm5L?=
 =?utf-8?B?Z3A1YnVFcmdtT0pFS3M4UlZnOEJvL1JXV3QvWk1IZnJMZDFFSm92Q1d6Mm9h?=
 =?utf-8?B?M1pxZVRVZzl5Z09VOEd0alVzUEZCYTNnTXhmQWhLRHZlMDN3cGdoQkxSYkk0?=
 =?utf-8?B?ZWYrZDFhSjN4bnNHL3ZvSTMrSHhuZ0RZMEVYZytmQmJkM3h2YlprajBSRENC?=
 =?utf-8?B?S0ZhYmxyWm1ycjYzV2pyVk12ekRrV3NBbkRCTk1ONGFzZmR6aG9pTldsRTlU?=
 =?utf-8?B?dUlpRzlwWjkxYmJpenJlYXladXBSVmFrbzRxK2wrMHMyUkRia2o0MmxsZjRW?=
 =?utf-8?B?TFNkcENJZ0RubEhiNEdtd3BULzdnRDVJTlFqRWVFTjRzMFJVVGp4a2dhaGdu?=
 =?utf-8?B?SkVkYzl0aW83NktjMFJhNWJxOVc5VjVORm9EUUdMM1VSd3crbkdCdVNtQXpL?=
 =?utf-8?B?R3ptZy90ckRpcG16cVcxK3VKM0RTSXpkSkVFU21lekpuWEpoT2hDdzRFc0dy?=
 =?utf-8?B?VzdpdmZUbnBkMHppN0M0cDR1QUhLaGhxVWc3NmZUN1I0SDVlZjByWVpaaGNS?=
 =?utf-8?B?UWNBUjFiVmZrZUNlNFpaZDRDcGlGd0hZd2N6UW43RE54VWxJTmhWc01sSFlU?=
 =?utf-8?B?Ym1ZY0pIaGtZVWJITlNmMmJBYkxRVjZpaUFvL0dFMHhUaHMvOXAxcjUyYnNC?=
 =?utf-8?B?Z0ZIOEtnMngzV3F4d1h5S1lJOVc2dUZDdWUzeCt3MkZPSGp1QlFaQmcwbUpF?=
 =?utf-8?B?elZVSm1RSlQwVWVoTFp3bUh6Q2JIRmFHa0N6SG5EZ0hVZXFPaWZnbjJQR0Vv?=
 =?utf-8?B?dHNScXJMZDU1aFN1V0lTLzJ4SklUL0J1V05IK01ma05iQ2lzcm4rYVdOYUdC?=
 =?utf-8?B?dlJlOG9meEhkRXF6NU15WFl1anpOS21qd2ZPQ2Y5L0JCNTdpa1BHaEFIWFJZ?=
 =?utf-8?B?N0FvMWc1MWRUM0VGMVZocElZU3NWenhoQ1FjV2txbTgrNC9xdFNKd05OejAv?=
 =?utf-8?B?MVVoVUM0WHN6SGlPQ212Vi9EZ2s0U3l4S3d2alhBTytUM0lQU3NHMlYvVWlZ?=
 =?utf-8?B?cHRZU200cUpxNjYwWnhLOWs3VFpEUTE0WE1KN1pNNFRuMWRZcGpCQzg0ekNn?=
 =?utf-8?B?bkcyNmRuZFpjZmEyT0hWR09pNmNHWXBqWFQyWG1XRzZyelNmOVlFc3MrK1hy?=
 =?utf-8?B?R1RwRk9XSWx3Uy9yM2p6LzVkUWtqRFI5a2c1Ujg4Y1VKeExoTGJvV1ROVFk4?=
 =?utf-8?B?Zzd2K1JJdWxUUnZrUkNra2NwTjZJVFVrM1VMRVQ3b1ZtSi91NnRTc282RGZT?=
 =?utf-8?B?RGUzbk1iL0h4MnVBUHZheEVqcmU4UGUzcU5hS0tjaVdTUHFYaFJaRXV1TkV2?=
 =?utf-8?B?Vk9ScUlmZHJ3cS9raUN4STMrWTVxVk5KdVNBL0dtemw0SSsyMm1IMzh2emYz?=
 =?utf-8?B?MmhzOGd3cWFnbWlwdGp4dTBsN3duamFsMjVVOHQ3K0VuUVkzYnc2R0wrcDNp?=
 =?utf-8?B?UjhoK2RCR1JGV055VTNzSTNNRm95RUlUUU1kT2lrUkp5bndrODlZMHRMcjRR?=
 =?utf-8?B?d0dPeEZnYnc1OTV4TklEOWE2cGVkL3RtRWUvVFREQ1d1eU9nOHRsZks0WTFo?=
 =?utf-8?B?RWoyeDlkekFVTitQZDFoRS9HcjJCbWFpSmcwL2NrVTc2OUU1QkxYOTRzV2pj?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XVEpAStNAWZFH8PfQ0r+GfgTDok5ilZrY+zeyV+V+GGUm3VnrhRmOgAyHXpY49qX/jzuW3nV9e21YMQHKyMcC6RdWKV7K9/xbp9ODSc7wLw5iZAqW64wR9+Db4i8gUcOPeUL1Phd2b9b5V4cxavOGWzuigVo5jmS4L2mqdFrQEjdKbG+/f8fY6YCcOd/a89U6pqq2gAuD4BjiSKctvgRBMxPxPcebfYOX/f+YMUZZhbCtJPy2yt6LoD1YjXB50e1NH1cBiMFT2zSYeXEWj3TNpZVGCcMRQDFlMxj4LuL2MQwLdxiKdBHAJ3PoAtFc7ps2lY6ifp+JXVkqzMZCWmMJ0GZOv4WNn19Bj/BYANpmDDMUOaBKOguZvhM5ZearwCSa41zPECTEaiwOeRUlBpK0YgLTRwBZVyYVXgS8TSgVBKxW+roUIa26ApxNfIdzwjs8Km+9YQ028h6lRalmsext2ClPey27E+MwnzG+vIBhqSdjGbsNtYgaVSty/8Aq6DGumH3rjiOHVjgmU/zLY+rhq9IXCSn5y5kGNa18fi1PckdM1ceFEDKY6HkQmcHGs/FsyXseNOr7xFgkD41RJSRG5oO2NFZ2fJWAApv877SCgMQi7C3cYAmymjsOl+BwGv5/ttmPKi2qs7NPN3zXImkS1casZQBkIWh9ZA1O+eGTaOA67uEPGj2Ngtr7+CvQN9B4n2d7UKVPY4PWr79H0aJytGfQXfSwcKvufJ5Osyyn7h7s5BUvPZk7sJMG1dtb1V3sM2FqKTsHp4vP0GB1BIbnzOk/qfODTcSuerLIajCUoUe49jlXSVd4qevPXLLe8s8B5RanwXmJrdS/tImjSkIow==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fffa0f9d-4941-413e-eea9-08db3d03c9e4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 16:17:48.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOrRAlw+nO46+k16VnZ2Eh3LJNnRry5zeIbi/dyETE5fH7fCpllYvGMnFMAa2YA9T/P3dwoTZNCvSD18xqEMqal4+abrhYgwcRVdxOzFq10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6226

On 14/04/2023 4:19 pm, Roger Pau Monne wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
>
> The paravirt_patch_site struct has 12 bytes of data and 4 bytes of
> padding, for a total of 16 bytes.  However, when laying out the structs
> in the .parainstructions section, the vmlinux script only aligns before
> each struct's data, not after.  So the last entry doesn't have the
> 4-byte padding, which breaks kpatch_regenerate_special_section()'s
> assumption of a 16-byte struct, resulting in a memcpy past the end of
> the section.
>
> Fixes #747.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
>
> This is commit:
>
> c2dc3836e862 create-diff-object: handle missing padding at end of special section
>
> In kpatch repository.
>
> I've seen the .fixup section get an alignment of 16 but a size of 81,
> which makes the error removed in this patch trigger.  Overall I'm not
> sure why the original alignment check was done against the size of the
> section, the alignment applies to the address of the section, not its
> size.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Seems like a clean backport, so FWIW

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

However, surely we want a correction to Xen's linker file too, to stop
putting out a badly aligned section?

~Andrew

