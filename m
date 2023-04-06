Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D076D94C2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 13:11:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518836.805750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNWU-0007rk-F2; Thu, 06 Apr 2023 11:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518836.805750; Thu, 06 Apr 2023 11:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNWU-0007pW-CB; Thu, 06 Apr 2023 11:11:22 +0000
Received: by outflank-mailman (input) for mailman id 518836;
 Thu, 06 Apr 2023 11:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkNWS-0007pP-Gs
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 11:11:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c099e94a-d46b-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 13:11:19 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 07:11:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6957.namprd03.prod.outlook.com (2603:10b6:303:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 11:11:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 11:11:10 +0000
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
X-Inumbo-ID: c099e94a-d46b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680779479;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TmztV2nZ2906F86lRQAVOyoiRJRaRw4XaZyzs5XVePg=;
  b=AxmY37PULemvRcvo/E2P7Aew/7tZfwk/sP3lLDImmADbIj1nBTBhWDHQ
   NIPk7/H4ieRge5QAZcFVn1yercszPsFDgXP2A0N+uZ3nk7W7lxymhytox
   fEJxLxHBy9+/V9iRicR2XUB+Zi/uGYlkGjRV294lPHNfBFimG2cR3emHF
   o=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 104460191
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xCpjjq15o/4hWcSlqfbD5fFwkn2cJEfYwER7XKvMYLTBsI5bpzwPn
 TMWUWCPMv/eamr2e9xwbNjno0JQucXRy4VmHVRspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gBmO6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOUFkp
 NE9Dnc0SlOEueWQmJ2Zdtldr5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PlWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHunBNxKTezhnhJsqFiJ3GJDLT5GbAuEneC0rROBSd9iE
 VNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4A/IPlqYRq1BbXFI4/Seiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:R4phR6lC+bGxeq8A23G/hkkMlNLpDfLz3DAbv31ZSRFFG/Fw9v
 re+sjzsCWftN9/YgBCpTntAtjjfZq+z+8T3WByB9eftWDd0QPCQe0Mg+rfKlbbaknDH4BmpM
 JdWpk7Mcb3C1dii8b8/U2XL/YMqeP3iZyAtKPm1HFqQhhta6Z8qyFDKijePHFXaWB9dOIE/L
 z13Ls8m9NlQwVtUviG
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104460191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDpSdODRKyZeIayjbLGbOl2YxFR+Can9uLFAnM8ovDpjuknCuICkjiVKv+/vnCbxMfjSeblEHi36T4sZISu31DAXGuXkBrmL6pkQgToNV4QZcxHduO0/WSVPQNUqd/8fNIJSZ9aSdedTiJRnUDZOc6msmrcwY3SeoTj7ZD+PYc+YSy6e6WMVK0d4ivoC7vWr3RwdByA6cvrzlxb74CGyWW+drWIsqNh8L1qpFj3Vy4z6f9D2OT973ftamxJqx7El17fv8+UGcjNYB12puaJjpAzVteNjRJN3ffiur+dFmE7WKTvy9zLVQCXWQONXxRHTJxAzKkBuTZTYy3/qxPVVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQYGpsCo7B1mDdak5WQS3B5OG7n7X0XtcLMqpUqH6mM=;
 b=IXUG2dtEzk9e3WNEmqcfENSfCI77cb6tSAHs2EL5eXUC5HjgK66SSA4qNHVHHFhK3OYkjm+FqaTVGyBJo1ZiNokRaVXfYQJHzSgYiE+dfhXsAUIVoLie+LLgZWaNmfQKhXUTxXZbyXb4yIVUo+runGoHmLwYZnid5DtUwxHe6n1Gzd2LingC4Hc5TQCUvj6qDpaMipZjUk/5xOuY5v4Ar2rmt1hJH2YYNyBQ+T+taLTP9X9Sl4Hlr66bRA9RBGJ+C4TctF87wjqQp+6iYn6QSBS0brwFvNPI9ya04VHF+IPHxixMlaQ/aCrwfdq/q+hLMMjV82cYkRpyk0VMhtfmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQYGpsCo7B1mDdak5WQS3B5OG7n7X0XtcLMqpUqH6mM=;
 b=aYPg8BZkgDjXhNLJLmzj3tL8fCLwb2kA5L5aAnQBhRnAILLKW7h+8sPE2Lj+xoTM4hlP1/k4IMUUvFqbA5mlz55IAkz9HKxjxnn4cxeC3A6Dnf4UM/eUsE2yUdLSd0qOHACRf7TcLtL1zI/nkTlT/v72SLEvLb/AMP55V5aNKpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0a5ce571-bd1e-e25a-fb76-a3a2ec6de201@citrix.com>
Date: Thu, 6 Apr 2023 12:11:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: Provide EXITINFO decodes for MOV CR/DR
 intercepts
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230405204423.2113418-1-andrew.cooper3@citrix.com>
 <313a2a18-020c-ca76-f620-f5694a74efeb@suse.com>
 <24133c6e-3e66-7be9-41af-daa3db4fa961@citrix.com>
 <e9bedb21-c081-9a00-e147-7528c28fc3f8@suse.com>
In-Reply-To: <e9bedb21-c081-9a00-e147-7528c28fc3f8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0688.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW5PR03MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b7386a-2252-4be2-d6ae-08db368fa07e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xujIu/OY3USW7avdhhbiWs/ktO9Sc9w0SjI2vS2WtbQwxQA22kxHZdujwDX1iJHgR5LRy85dbtDi5B8Og0B1qb0lof63rPOTAfmENskd1zE5g8V+T1rv6e4jsAnB/PiZAViBYrmNcvHiojJh2jixbT3lkrZ+FEoGrj50Rqaw/xRFU6B70YFnkpLnaKisfsOy5iUs7JbwZc/ktMLg5UKSeTpPtCrEXKzWVLF+urTzQPAoXuwhXZ5HFI3MU3acPZW+zcihzjVOKeptNfwNbKCppoOC5uR3K0pvuvaeNMvvVnO+0VcxkZiH+pA/R9XnnopqBshq6btsavKGCiAMKx3UB9wOxPHKqRu58Voe18c46s9Itun3yxsnAPSrNVbit47oy52l6lPdvxH5a1dUWof3taSkKrSeE7iJUHTayTTSzha8bdBANTP5pO7srMBJO1sFY+APODc2HavGqbh12/kcD2UIRJs+VNacCicDXM0/V0bb0scuOOdRrI4ke2zZPUKNiR36XseXvaAN9uqU725/MRTO7QWtJUHNi93kzjjVD/cIPHCtWaotJEBnjMeV9eghTHYP5NHT5dtFyso89sKaFlWbTs9lIv7KtHqKI0j7gysw2LTYTQhJaSftA9SiJAb3o5LmxXaQ3Nq9m6Nynxyx0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199021)(31686004)(41300700001)(82960400001)(38100700002)(2906002)(5660300002)(8936002)(4326008)(6916009)(8676002)(66946007)(66556008)(66476007)(316002)(31696002)(54906003)(478600001)(86362001)(186003)(6666004)(36756003)(83380400001)(6486002)(53546011)(6512007)(6506007)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnU0WENScGNPUDB5YjBoSWFTZldZMU5TTjMybzZod2I4QTcwcVRHdW1pY0s3?=
 =?utf-8?B?WUlmampUQnIyVmQrMU1jb2pPcWtaZGw0NjdyMGVPNzV6Y29sNi9rOUhOVWRn?=
 =?utf-8?B?ckZ5MEd1MjZ1K05FSndmd0pqRWZNQ3lua1o1cm1aV09sekZrNktXa0J5TnhB?=
 =?utf-8?B?djYvVVJ6YWpJN2xnMGt4YTI4cGxLU0p3SmNXRVNwUFUrY2d3K0l0Z1FpZ3VV?=
 =?utf-8?B?blUzZVJCeHROamRzcituMGNXM0UwYkFUY0ZDWVJaS280Vms0SFBtNFNHMUpz?=
 =?utf-8?B?dUJwMVpwT3A5ZEFXMEVocUhud0VYVCs2clFuOHZLSTJvR3Z5dTYrMGN4bmZt?=
 =?utf-8?B?aUdiYVBwQ3hlK0RUOHVONXZ3Z2k5ZVZBaWhWcXZHNlJkaHVvNTQ3cS9scUVr?=
 =?utf-8?B?eHVhV0VRdE15QXpJY2RjVVRQaXY1T2hPRUdCMUk1UnBUbEVGZjVmRDVCL0dR?=
 =?utf-8?B?Yk9qQTlyWjB0dlVYTGdvQWM2cGlVVHlLaHAwYnpTSERwR2VlL21MbktYNXVE?=
 =?utf-8?B?WGczbUFkUG0vTEJ1RDNCeVVIcFRmbFV6eHJoYW5vTkZUMXJUekhpb05mUld1?=
 =?utf-8?B?L2p3UGI1OFpYalRUb0VjREdlR3ludkEzWFB2cjJlRGhLQ0xrTERjcEp3MWlQ?=
 =?utf-8?B?Tms4VG1XZVVxRjRXSnR0djBKcGtqaDE4ZlZWM2oyVXU5UENkb21GOGR4c1Br?=
 =?utf-8?B?OG9BR2JaZ0t1NTdIbHdjTUFJcTVaZ09NQmhYWERvL3h0ejF2K043UHJFcnNG?=
 =?utf-8?B?eG9aRURIeWR2aWFueDV4SXRrU2hXbHVjNW8xTXUzcVZKd2c3UUczREQ2aHZa?=
 =?utf-8?B?ZUZOZmYxL1ZERzZzZFBHaU9SN0tGQUhyNmVZN0NUL3dQV2VTZmtkbVFnMTNn?=
 =?utf-8?B?Q1V1ZzFYb1lBMDh2aTQwVWM2dEZjU2F4N3BKdjF4aTVPZ1hyeGhGcmk4VGhl?=
 =?utf-8?B?aFltTCt0eFRnMHE3cDVUcU5ERjUzTmNJNGxncVZYRmIxaE9zS3Z3WlpJRkdM?=
 =?utf-8?B?N1NpRU1RenNZZzRJU281OCtqSnZHcWtCbXRHdE9MN2pwbzNCcUJ2bFN2Vklx?=
 =?utf-8?B?cnl5bmpJbXlFVS92SnVYbmVGckpHNXZUaG1DSGxKODMxSkF5TUVkUG1FYmtn?=
 =?utf-8?B?SXVWRFBtRU5UWWdKaWo4Y0tZYzBBTzh0Q3VIbGJGcXE5aDdSVXl1bkJMUmMv?=
 =?utf-8?B?VW14OGlXM1dYenNqdWNEZVhJUUtsclJFYlNDekEvSy9yZE4ySHkvcXdyZXRL?=
 =?utf-8?B?WUxUbENKQnpGcVFhRkx1c2s4QkVTOHlKV3lvanRPcUtCUXB2b0NIMWtPUjBo?=
 =?utf-8?B?S1UyZ0tkR2p2SXd3Znlkb1JtZmFiaGE0MWk4WGtqdndGVWV2U3A2WkM1dXF4?=
 =?utf-8?B?cDNWNWpFb2NYOWc1MGFkcmJGQVFTKytXT3pvMDFnME9yUHRzNU4zeitIc3hw?=
 =?utf-8?B?cGY5MWM5RmdjbHg3b0x4REFtTERhSW9Oai90ejE2a0pIZ3hVS1NyTy82VTVa?=
 =?utf-8?B?TkVIUWlDTW9NNTAwZjRVNlkwQ1Jxd2ZrZ3I5cEo2V1VkN2t5TnFVTWZMdXRk?=
 =?utf-8?B?NHQxanIwMHFwMEpkZUFXbHoyZDFiK2FnUGNmaEpOYjJaeTdNWkNLeHk1elYx?=
 =?utf-8?B?dXVETTlsK0k3YVgvQ1RWQUIxZy9McUVXS2RYdUlrZ05zMXgxcXVtZWx4bTc1?=
 =?utf-8?B?S1FUdW4vdWtMQmFIKzlscGhvSlU0VjZ1R2JEREt6T0xOc0d4bXJBV29tVkFu?=
 =?utf-8?B?OEZKOUtzOUMyaTJhQ0oxaU9BdHJtdFZPd1czZWZROTRBVmJJZmxTV1BsVmJU?=
 =?utf-8?B?OCt1c3ErZzVmd2hXS1FVRmpSZDc5cE92SUdyM3dEMXpwMzRuNWlhd1gxTkVw?=
 =?utf-8?B?c1hKY1ZvdDQzOGlVaEI0MFBCdWFxOUVycENBZmJxeXRVNU9XTkRHSHJwSGRz?=
 =?utf-8?B?YmFzNmdTMG1vQjlYYjZISVZLTVREMk5hekttdytBWUlhZnJCenF3aHl2YnFv?=
 =?utf-8?B?aU1pYUZQTnlUcndCTXU1N0R3eUliVmsrb1pvK3NzUEZrQW56QlJFT2VHRVVQ?=
 =?utf-8?B?c1BxNFdpQXIybk5sdVhkSUphZXhqSWxKeTEvRFB3OFhyV0NSNmprTWs2aGJW?=
 =?utf-8?B?RG1DRWcweHRIZ0VBd0lHVVZYNEthTnM2UnhkS2EzTW84ekg4ZTlabkQ4WEMv?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TENWvx0F89HuKBz38DFDmbeHpybdKIjV3ixUgBt4rU6LsNDq4tM5rpQozRrkw3Q3yDgIl/pbzUdigMDMuYRZxquxL5mBKMruVhKFQG5OQpmlxJXmLVqNcro4v/FEbPevFJi6iFgZxCQaXgGiRS619v8QFcKEWB7gFqVyLqbYMWnu2lo4IMAmy4T+cptJ6Q0ImNnih0bdgW9IhQEZFUZaWq2UTS8y8SPDlS+NZQvauVDO7xJZkTskbitKQrFCkON7ZUdTceeWRbxp8njK70Iz9zWKiDslIPZkXo7924FJGmv81fDsSfDHhPqlYZUZL2+tXhR1yzgZTeFX7FSuSOf1zgwzd/C0RdqRD/wFOqK43Svj5vkrDHf9L0s/CGa6hWcc9Z3pljwKTWUZHFWaiXlZEZGbHMj6kInTmooub4HwpQCQhsqKcjdEfTFbL+hRxAGtFPd8PTVCJ1g56nQI6HcynBpsfP5qnXQROeNHPm5CNH9iTJLosox6CAjPaivTtxGDhdrmFo5bfNqxLaPGcQG248Qnxz0sS+441MGuhGOcoz48leLTkv0k+ZmeXiDo6D6CO8DWTEUgXKBULtQw3DdhaPS9wp3RJlTv9VGCom0t+3dPiXrO0wRTBIVXWo9kxE5mb/5FfemvvQfc00E2Ls0g4nuohWsej9o88oRAgFthqmFqDNAIgJIVQsBQoGksXx/IZ309X8rAJiPHiiwDgwkF1LDY+tngjyNHxNZRKIU8iezXQurNwv3oPNEReEnAV5bButhucwOhy2f6yviw5JHT8lWpm8/TxuGKr6yeCtg1TXsKEoIXHcGp+mxZRYdevvtD
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b7386a-2252-4be2-d6ae-08db368fa07e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 11:11:10.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLVHbDiqla27d1ZqKGQoeUt4+0nmrr1vlQ6Dujn9q49RL34ggM92aIHzBl81tDu6gfdg/x9woDiruKN7YtQk0xDeSpBS80LY4T9LRnllVqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6957

On 06/04/2023 10:59 am, Jan Beulich wrote:
> On 06.04.2023 11:52, Andrew Cooper wrote:
>> On 06/04/2023 10:31 am, Jan Beulich wrote:
>>> On 05.04.2023 22:44, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>>> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>>> @@ -450,6 +450,11 @@ struct vmcb_struct {
>>>>  
>>>>                  uint64_t nrip;
>>>>              } io;
>>>> +            struct {
>>>> +                uint64_t gpr:4;
>>>> +                uint64_t :59;
>>>> +                bool     mov_insn:1; /* MOV, as opposed to LMSW, CLTS, etc */
>>>> +            } mov;
>>> The field being named just "mov" makes it apparently applicable to DRn
>>> moves, too (and the title supports this), yet the top bit doesn't have
>>> this meaning there. So perhaps say "MOV-CR" (or alike) in the comment?
>> Hmm - I'd not spotted that distinction.
>>
>> Xen never decodes the exitinfo for a DR access - we just resync dr
>> state, drop the intercept and reenter the guest.
>>
>> Therefore I think it would be better to rename "mov" to "mov_cr" so you
>> can't use the mov_insn field in a context that plausibly looks like a dr
>> access.
>>
>> Thoughts?
> That was my other thought; it merely seemed to me that updating the comment
> would allow future (if ever) use with MOV-DR. So yes, if you prefer going
> that route: Fine with me.

Will do.  I don't foresee us ever needing to inspect the dr decode
information.

~Andrew

