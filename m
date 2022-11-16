Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F257462C760
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 19:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444380.699525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovMwA-0005vm-QR; Wed, 16 Nov 2022 18:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444380.699525; Wed, 16 Nov 2022 18:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovMwA-0005sM-MZ; Wed, 16 Nov 2022 18:15:02 +0000
Received: by outflank-mailman (input) for mailman id 444380;
 Wed, 16 Nov 2022 18:15:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCFo=3Q=citrix.com=prvs=3126b6494=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovMw8-0005sG-FV
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 18:15:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93515e2f-65da-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 19:14:58 +0100 (CET)
Received: from mail-bn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 13:14:48 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by CO1PR03MB5666.namprd03.prod.outlook.com (2603:10b6:303:9c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 18:14:46 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 18:14:46 +0000
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
X-Inumbo-ID: 93515e2f-65da-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668622498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=g+hRlQytNeCZeQzkEk5yFfWTEVJr/nGEkP1sfutSjtE=;
  b=h84Zq3usNeyPsOmsLxzocNtGMXp4FqfZKxcclDGxohUcw41Y4QP60G58
   14LKHtYZf4kTDjtdIpwAahFvU0RhrBQIu92M2cxRHWkBsumQkWH30Ptb7
   6dJMPzInsDx4to/frIHAf9C0H8WW5Jc5KDWMfBJ7oFb/aIQEIVddGTrN0
   Y=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 84550894
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9gU8z6sqr+rmCAyw9EUxdDUXvefnVGlfMUV32f8akzHdYApBsoF/q
 tZmKWuGPf6LazSjL49wOYTi8UwFu8KAmtNkGVQ5qCozFi1E+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaHySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNz0NKRqjltmK/o2RVfRu19oeAOn6FdZK0p1g5Wmx4fcOZ7nmG/+Pz/kBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osif6xbbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ROHlq6Y60QH7Kmo7Mzw6aGWyucmDyUuEQeBCN
 nAk2y4jsv1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceZTEsz
 E7PoNrvChRmqrjTQnWYnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdszHuMTT5w
 jTPpi5ngbwW1ZQPz//joQ2BhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHXlrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:fZedW61OsgmhGUxBy99/oAqjBZpxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkfd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nF6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklUqvoXRiKrbzPIt
 MeS/0018wmN29yqEqp51WH9ebcGkjb2C32GnTq9PbliAS+10oJsnfwjPZv4kvosqhNC6Wsrt
 60TJiB3tt1P7ArRLM4C+EbTcStDGvRBRrKLWKJOFziULoKInTXtvfMkfwIDcyRCes1JaEJ6e
 L8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCozs1F/ZB2trD1WbKuaES4ORsTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQsNcmXFCFpN7NN+TRx6TmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuQXP8iAi5YQKYRqU+x+MELEH3xZlh9GFWDPw8juE8syXI2uibbTtfr6cxYE
 xyZLv6j6LTnxjFwVr1
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="84550894"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBUSmWqV88oFV5CpUi39w7j5Fb/iJEhkwYQzi4FtqiKLT8BKotP0VaMHzqU+IU2XNQBST8BFzEci71/tZ469vMTtccESoGT1YfHAM6vFQaS0u7hQi8o1lxIbAeIu4IhrrECjQsYsHGMqHoNgis/SD4vfjmCLHzxYIC3fuKRToecp5Wmga/ni+zBSgdfedlpJ/7tYEDPZ7BzwGprUWl93GoqKoPMYRTDxVEMDyNun7lDjbS7YrbGn/A+s1CF/NXT7m4DpFcfVZpNOl8XvR5yaAeT7jzpL9g5SV5tPL84p4YyayGVUh7Fnq2BEko5XNjPbXCJkF9oZ3sTNWESTK7oIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+hRlQytNeCZeQzkEk5yFfWTEVJr/nGEkP1sfutSjtE=;
 b=nEoy/f7ZGmwIPRza5Li7WxP07XTMBa1JlqKPIEuvXEvkpQhlUBEdypEnSqXcLINaAAaEjWqhEsRI5vBRLw6J1vYzHgPD+01eaJSQLfNzQbb5gTlzkJzZLnGdWLFMPKX+iDaEqf58NLlonq+YvDbj37jv+K2wHVNnmHHeklCxb+NLtYgEJ7w2pCmYmsU+PgvZFFxL3Qes6LfvUPqf/fcm5y5V/OTjKv7haydALX6ED9MUVSQzSLVUh9j83RNE4qdVA+pUMm/9/EU4YYy7CnKq27yXuhUnd7T9PMPpXzyQdy0kf9yaI9P2id7XvkryPuHz5h0AsNM+i7pEDg4MmW3wXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+hRlQytNeCZeQzkEk5yFfWTEVJr/nGEkP1sfutSjtE=;
 b=Lz0TbvvqMMc9KBQK/q8sup059Js/EEFc3DEvg6rX5HM9VTekRfl5ifUHwctpXRnp9fE8TCEXjXibsyYpSaurGGowFc+E++1MwED7xKq7Sap8rnGg2H3Vgprkq4u9ZbtdhTyolVceuS7MDCQc8laS68exyeIsW0MH9AAVbIUIKF4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration
 support
Thread-Topic: [PATCH for-4.17] x86/hvm: Revert per-domain APIC acceleration
 support
Thread-Index: AQHY+Io3ygoaE+gKUU+QEYfs8WRTZ64/rWQAgAIwI4A=
Date: Wed, 16 Nov 2022 18:14:46 +0000
Message-ID: <2334ba7c-d744-c1ca-8f67-b2013e9c5fe4@citrix.com>
References: <20221115003539.19502-1-andrew.cooper3@citrix.com>
 <29469c16-856c-bce7-c556-66622e349f1c@suse.com>
In-Reply-To: <29469c16-856c-bce7-c556-66622e349f1c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|CO1PR03MB5666:EE_
x-ms-office365-filtering-correlation-id: ca452f7a-947e-412f-9064-08dac7fe7133
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 so8JZBqRH+EjuNno5sBmtfivInkNHQ1HHnsbfx+0PkhSU3ABjMaVZoABBHUvUr34tdwI4QA9VJIjmU0wS4+oXI/WglrftZRiFjQgTLBFjBUEaf6P+3l92MiKgSbDvL28cgxhTaGx5ALXUxS8yjDVv9uDYRTiWxUgG5xaMvixZP04URnELRS5ZUkW0pArdgS/xmsA4xkE00vhtKfROAL/BrLeH3WB6/UYm9kTI14F7a4gM7m9C+v+6Jq8dlss3kHt7ZkmCmFj+Y+3HtYwwtVRLMKmeDazdkBrfzVZX8iaSxI9H4604MNnC8K7KWjfQwDlhnR56Xm9iZo0yDqDcH8fXyc/Qh4qJeypn29BjCfvh5BiEvR5W0lCpUXuSXtH5D6RCB0nXRaVDyEBvdDaWJG1ke8dSsu6jLb0vNiCKR+JCp8nDSJfygeLwm5DMnWmd9/HTErXxndPrwpGPtGSOzY+dQD8V+n4TbzoQb6kw8CZnL8qtL0Mx+ieh3aArQNMnq1Wuy4iXvne3EdyOD7hsCM+O00nVfHMDh5vDHH1m/+yQ1pVEkWHzfgD4RdWspQBeR+CAXhJlmlWuEQWcggCle0DtgIK1qvqrEzwMP1KnhQscvt/mXWlTUxtujrtt7+jHqs3WxN/F0/P0ZKv0dQcyIG4VuWKrgdmp5zsOt9qn8xg2nX9NH60V7WxBuxqh67iiI3HHfQnqtlRUxq8/Yek/3bmopnPUxLvTr0tvFBO7lda9yVu0WXbDCUtpILnQfkblvmkkGu+mMaYpaXxoOfH2H8JcPkC0oQ8L/Rx0EUAe/qRr04smV4jIU07bRchNDOSwobudT2xcSfDvE/15dTBLETC4g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(38100700002)(82960400001)(31686004)(122000001)(36756003)(316002)(91956017)(66556008)(66946007)(66476007)(6916009)(8676002)(66446008)(64756008)(76116006)(54906003)(41300700001)(6512007)(5660300002)(71200400001)(2906002)(2616005)(4326008)(8936002)(6486002)(86362001)(31696002)(38070700005)(26005)(6506007)(478600001)(53546011)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXpmaWQ3UXExOTl6eWl3c0RFQ0MwZ25iMVQ5b3NWWTU3U1I0ZElYelo0S2hj?=
 =?utf-8?B?RXhhQ1NOUlRQa1VTejVPUUVza0FHL3NBSDBZMTNaYnRWVEtQK2h0YThrNDZu?=
 =?utf-8?B?dlVsK0ZtT20vUVhFR2VFUVhnM3VORjEyNk5jai9NeWxzcWt6aXRMM1NsR05I?=
 =?utf-8?B?eWNtMjVlR1kwL3BUeTlqaWhsQll4Zm8vRFB6ODNpaHlya3VFTkQ2Q0NpS3lH?=
 =?utf-8?B?cnBCYXZNYW1NNUxlSW9OaGtFZWI5Um1BOE5UNTZxUjdBSUt5TVpUYTJFdHls?=
 =?utf-8?B?UmoyQWt1ek1qWFZmWXc5M2xMdVJzSUoyc2xmbWhKQjR6RGpQOTVzOTBOVWVr?=
 =?utf-8?B?b04ycE5XTzlxazV6My9EUURvWEZnTUM0OC82eTdyd2JpVUtvb1NqK2dreGU3?=
 =?utf-8?B?RmJxM2ZWbkl0ZzBBRkpHZWpQUWQ2c1Y3M2VXUnc1VWRGZE5qazg1eE1SeVJK?=
 =?utf-8?B?Q0ZHS0VkbUpZZWVkb0xSTkVKZnk1M0FRSkVxYkM0N1I5Q2VZRDFtNDM3ejdr?=
 =?utf-8?B?cGpnenRaQlBVZFZaUHUyOERWWHNmRFhla3VYYTBCdzN1V0FBL0VNM2RrSk1E?=
 =?utf-8?B?T3pjeGdTNWxlRFdqWmoxSzdXQ2tzWDJELzhqLy9wNEF1dmRqb2syN011MWxp?=
 =?utf-8?B?YkE3cWo4SWZ4M1djK0dUcVR6Sm9GdThXMk5qNU5sZEI1bjVESjZySnRpb3dY?=
 =?utf-8?B?Z0tjbCszam5uNVI4TGNhbmNjMTN0SGsxU1hnRHYwT0JYeEFwNjFjTkszeVh6?=
 =?utf-8?B?TGIwVVNPWE9YRG9Ld3MwSXRvaGoyMEcrcXlYWlMxZG9jZk1TZkdzOGpKZDBx?=
 =?utf-8?B?TnVXUzErZXhlUjdpNUF5ZEM2Wk9zZ1Z0cVRBd0RielRHdXVGSFc0VU9CcjlQ?=
 =?utf-8?B?a0RkRkF4bTkwbTBVVEI4KzdoQlVnREU5a0o0ZGh4d01aNCszd1FhWjNJbjdy?=
 =?utf-8?B?VTlMTjNlWEI2SkxPTnlIem8rOXZ1T2x5V3ozcWtYZHA5M080WXFuWXNVSjNJ?=
 =?utf-8?B?L0xOTWoxQ1JzT29RN0o0MmNidnVKOHZsWldEQ3l5K25SNTc2dDJSMjIxMkJ0?=
 =?utf-8?B?U1ZKRkJXWTExdzk5enFOZ0FreTBmdWJRZHFDNlVrWDg1TzhzZzliR29iUVh6?=
 =?utf-8?B?amVaRk1XVXU5bmRrZkNVZDNCNFhxb1RYSWtXbGhybXV2bG01YUppbzRYbnVY?=
 =?utf-8?B?U0k1dE5XdmRRbm1US1g0TUdDS2g2ZFF1U1YzUk9obm9LbXZScktLQzNkRTVS?=
 =?utf-8?B?cnBsdHYxaWY2RVVMbTVVTzZJSk1yUXNBaFp5S2pNY083K01YbXZldEFoS3Na?=
 =?utf-8?B?Yk9zMXdoMTlxcVNzMlVGa0gvVkVTTlladmQwUEh1QXo2a25ObXltbHhvYlY1?=
 =?utf-8?B?ZDNqck41WGpZcGJ4enVlY1NHNVc0d3U1d1V0S0dTSHROUm9EeXRRNHVWQ21j?=
 =?utf-8?B?TFhZMGViajhkZEVNZHVhY0EyREtaQkUrc0F0RVkrdWVXZlgyQ2xFSG45cmk3?=
 =?utf-8?B?bU12UFhnQUxodFczc3pDM0xMNm1sWTF4YXM5SmhvNUxYb2hPOEZKVG1TYWUv?=
 =?utf-8?B?OG5NZUNoczJTcnBSdkVSU000LzNYVGxnd1V1dy9HVnA3aWYrNEZFc2kwR05X?=
 =?utf-8?B?dzE1Q295YWt0em43OTUvRFlTK0ZrK2pDMEd4dGM0SEdVNThFYVZhQUN4U1dJ?=
 =?utf-8?B?UjJRQUtVb1ZrRnN3dUJBeWpDMWhzTjFjR0cyWEk5QUc5R3dpRSsvQklPN3dG?=
 =?utf-8?B?OHRLWkZuZXFCNXVtTU5IN2g5b3h0Snlua1BoUFpUNUpObk9mZU90M1c3ZGhG?=
 =?utf-8?B?NXREYjUzRi9EVVRLN0MrOWRLbm5wQStlWkU2ditwQW0wT1d4U1BMSXEyYUlk?=
 =?utf-8?B?R0prZnJzSUd1SnNnd3FlODRyRFMyMmpCSkhqdnVDanY0REQvWUU3dFVpclZW?=
 =?utf-8?B?NERyWkUxeUhFdGd5TExwaXg0ZXR2U1poaFF1Q0k1eFZQTkJWR3VTNU1xK2hI?=
 =?utf-8?B?Qms4ZlhPcmVXdWk0Q1E0Yk9YU0t2aTluOW1Md05kUkV6N05RV0pSVFhUbjlQ?=
 =?utf-8?B?a3NMdTI5c3RCMUFlbWFKUDN6WGE2cEo5RlhnZjBQYnRPMVFvV2FNMEpJM2Qy?=
 =?utf-8?B?SjFSSExaVjhZUXl6OHNGTFJFQk9GQW1WMklqbDlVSUM0NkluMWQ1TDZJRFJw?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <912C80D9CBB66D459946E261A1D105C0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wPWIRw7Bt8u9mfB/oYG5uj5keiVx+sZ/EgQRQcyaoCwmmOMsfD4wLUOs40rge+MG4sdcDd1YExaN2nxGcc8HfO59op4DGAWXrNJIHgvdY/veMgpzmjNu+iYt68hX/1lc9jHOdc3iSGasO4RivRK1sbmD990YDjzHu7S01kef4buCXVtFiSE3FxB5yCSr2827G+oVwKVUagaPxJfvauwuFOLohuaru0UUpuwJIGnGCVESNEBfPXuvarVHwX5ovgY034TouStglvL79VvlE4t18cgEx5dHsU8k1gaas/st5PtjlntotreoaM/bQDWdelUE7bIQaqvK8Czts2ImAdUPa1D4WObFvjnXmkouB3NO4MnJ+6HENk3LnquV9Tr+QJdc31OMdlwzdxRJ9mxIFgR2wb3ubokPKx6R1g22VpAmAT7hzjepDt6whMUaAmJRoKDSJRY9sJrK5KaYooZoE8qrlll+tjOOdadhS79q0mMeZ5ThOEhTPCg7R73pX8IERDyXvaQvsA6aExIfh/IKTIVr7ImE4swGi/QoQBeKdRqmGiQMYA29aF5vaxte3RQX2vsw//1DI2kZyLHTAzq/3nuEXKzkagatxTNh/1Ov/D3LzFdg7MqBFzTWrMaSSpr5o5a8rQnvwdeefWZ0oLd8jv4tA6FSnno5hqTxVb13r9cBx26hqV04EQEJH+/y0eQp9yr9QohTVlbF96ogPKSLq623ugB/bCX5LRpAwokwXvg7f4QOI4Uai67cv489DQgd1dJ+UZBOSNuL4uT75U+4J/72t6KC8p83/Sgzm95Xbvzmtuq0363GeT3ilGs7c5zVruTN8pAbQdap+RH07d/EYCBfuvcWCuqejW6ldWQmnfc4XFA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca452f7a-947e-412f-9064-08dac7fe7133
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 18:14:46.0703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRf8y9V74DZj0of0GTslfuRd1q6T8x8qSOC0tuz0ljDiQY7QnKkHQYs5SnXEdQ0sjmwHwxloHYkkqqcsWKZKUx3nkC09GL4D7hKKUVYVeG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5666

T24gMTUvMTEvMjAyMiAwODo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE1LjExLjIwMjIg
MDE6MzUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBJIHdhcyByZWFsbHkgaG9waW5nIHRvIGF2
b2lkIHRoaXMsIGJ1dCBpdHMgbm93IHRvbyBsYXRlIGluIHRoZSA0LjE3IGZyZWV6ZSBhbmQNCj4+
IHdlIHN0aWxsIGRvbid0IGhhdmUgd29ya2luZyBmaXhlcy4NCj4+DQo+PiBUaGUgaW4tWGVuIGNh
bGN1bGF0aW9ucyBmb3IgYXNzaXN0YW5jZSBjYXBhYmlsaXRpZXMgYXJlIGJ1Z2d5LiAgRm9yIHRo
ZQ0KPj4gYXZvaWRhbmNlIG9mIGRvdWJ0LCB0aGUgb3JpZ2luYWwgaW50ZW50aW9uIHdhcyB0byBi
ZSBhYmxlIHRvIGNvbnRyb2wgZXZlcnkNCj4+IGFzcGVjdCBvZiBhIEFQSUMgYWNjZWxlcmF0aW9u
IHNvIHdlIGNvdWxkIGNvbXByZWhlbnNpdmVseSB0ZXN0IFhlbidzIHN1cHBvcnQsDQo+PiBhcyBp
dCBoYXMgcHJvdmVkIHRvIGJlIGJ1Z2d5IHRpbWUgYW5kIHRpbWUgYWdhaW4uDQo+Pg0KPj4gRXZl
biBhZnRlciBhIHByb3RyYWN0ZWQgZGlzY3Vzc2lvbiBvbiB3aGF0IHRoZSBuZXcgQVBJIG91Z2h0
IHRvIG1lYW4sIGF0dGVtcHRzDQo+PiB0byBhcHBseSBpdCB0byB0aGUgZXhpc3RpbmcgbG9naWMg
aGF2ZSBiZWVuIHVuc3VjY2Vzc2Z1bCwgcHJvdmluZyB0aGF0IHRoZQ0KPj4gQVBJL0FCSSBpcyB0
b28gY29tcGxpY2F0ZWQgZm9yIG1vc3QgcGVvcGxlIHRvIHJlYXNvbiBhYm91dC4NCj4gTGlrZSBS
b2dlciBJJ20gc3RpbGwgaGF2aW5nIHRyb3VibGUgc2VlaW5nIHdoYXQgQUJJIHlvdSdyZSB0YWxr
aW5nDQo+IGFib3V0IGhlcmUuIFllcywgdGhlcmUgYXJlIGludGVybmFsIGhhbmRsaW5nIGlzc3Vl
cywgYnV0IHRoYXQncyBoYXJkbHkNCj4gIkFCSSIuIEFuZCBhcyBSb2dlciBpbmRpY2F0ZWQgYmVm
b3JlLCBhbnl0aGluZyBkb21jdGwvc3lzY3RsIGlzbid0DQo+IHN0YWJsZSBhbnl3YXkuDQoNCkl0
IGFic29sdXRlbHkgaXMgc3RhYmxlIHdoZW4gaXQgaXQgZXh0ZW5kcyBiZXlvbmQgZG9tY3RsL3N5
c2N0bCBpbnRvIHRoZQ0KbGlieGwgQVBJLCB0d28gZGlmZmVyZW50IHhsIGNvbmZpZyBmaWxlcywg
YW5kIFhlbiBjb21tYW5kIGxpbmUgKGZvciBQVkgNCmRvbTApLg0KDQpkb21jdGwvc3lzY3RsIGFy
ZSB0aGUgdmVyeSBsZWFzdCBvZiB0aGUgcHJvYmxlbS4NCg0KPj4gVGhpcyByZXZlcnRzIG1vc3Qg
b2Y6DQo+PiAgIDJjZTExY2UyNDlhMzk4MWJhYzUwOTE0YzZhOTBmNjgxYWQ3YTQyMjINCj4+ICAg
NmIyYjliMzQwNTA5MmMzYWQzOGQ3MzQyOTg4YTU4NGI4ZWZhNjc0Yw0KPiBwbHVzIChhcyBwZXIg
Rml4ZXM6IHRhZ3MpDQo+DQo+IDM5OWJjYmYyODFiZDkzNmQxZWZmN2Y3ZDEwNTRhYjQ5MTE1YzNh
NDQNCj4gMDgyM2Q1N2Q3MWM3MDIzYmVhOTRkNDgzZjY5ZjdiNWU2MjgyMDEwMg0KPg0KPiB3aGlj
aCBJIHRoaW5rIHdhbnQgbWVudGlvbmluZyBoZXJlIGFzIHdlbGwgZGVzcGl0ZSwgbGlrZSBzdGF0
ZWQgZm9yIHRoZQ0KPiBtYWluIGNvbW1pdHMsIHBhcnRzIGFyZSBsZWZ0IGluIHBsYWNlLg0KPg0K
Pj4gbGVhdmluZyBpbiBwbGFjZSB0aGUgbm9uLUFQSUMgc3BlY2lmaWMgY2hhbmdlcyAobWluaW1h
bCBhcyB0aGV5IGFyZSkuDQo+Pg0KPj4gVGhpcyB0YWtlcyB1cyBiYWNrIHRvIHRoZSBiZWhhdmlv
dXIgb2YgWGVuIDQuMTYgd2hlcmUgQVBJQyBhY2NlbGVyYXRpb24gaXMNCj4+IGNvbmZpZ3VyZWQg
b24gYSBwZXIgc3lzdGVtIGJhc2lzLg0KPj4NCj4+IFRoaXMgd29yayB3aWxsIGJlIHJldmlzaXRl
ZCBpbiBkdWUgY291cnNlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFByb3Zpc2lvbmFsIHVwb24gUm9nZXIgbm90IG9i
amVjdGluZyAoaS5lLiBoaW0gYXQgbGVhc3QgcmVtYWluaW5nDQo+IG5ldXRyYWwpLCBhbmQgcHJl
ZmVyYWJseSB3aXRoIHRoZSBhYm92ZSByZW1hcmtzIGFkZHJlc3NlZDoNCj4gQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtzLg0KDQp+QW5kcmV3DQo=

