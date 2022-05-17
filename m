Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319152A73A
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331186.554661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzM6-00041G-23; Tue, 17 May 2022 15:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331186.554661; Tue, 17 May 2022 15:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqzM5-0003yq-Ug; Tue, 17 May 2022 15:43:25 +0000
Received: by outflank-mailman (input) for mailman id 331186;
 Tue, 17 May 2022 15:43:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqzM5-0002k3-0R
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:43:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14ffca68-d5f8-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:43:23 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 11:43:20 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2765.namprd03.prod.outlook.com (2603:10b6:300:41::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 15:43:17 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 15:43:17 +0000
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
X-Inumbo-ID: 14ffca68-d5f8-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652802203;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=k6u3Q7tptojcXvdfl/2tQg7TVrPUhQ/12u0NRNEMigY=;
  b=ZLVov6fyNvUxoBwDAY5RZTWC9ARGaAX11rcxbhosqL6XkLZLl5LawOz6
   7L0a7eq0t1bKIkalcEBLXA6shn2UGkeD1GUb36FkE9osdlhSD/W2SsVdg
   COVIm0iR1WWc151OaB8s+vS08WMyzv4srXzBvASaLxZ+E1KsSuJH67u3o
   0=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 71522030
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kKyMPqs8gu1QE4+MeI/X3dCMkefnVGlfMUV32f8akzHdYApBsoF/q
 tZmKWyFMqqOYTOgKNBwO4+3/BlUuZ/dmt9jSVc//is9E3sQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17U5
 ouoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi94EZb3w+kHciNdTR8iEZUW1ZPMeyag5Jn7I03uKxMAwt1IJWRvZ8g037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IJmm5v3aiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3M+PBtuzOLpOB3+KeqDMv2Yf+tf+dyrEeot
 3PA+UrmJg5PYbRzzhLAqBpAnNTnnyn2RYYTH72Q7eNxjRuYwWl7IBgfT16yu/S6ok+4RdNEK
 kYQ9zYurK4970iiRJ/2WBjQiHyZuh8RXfJAHut87xuCooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/v2ARR/vbvTTmiSnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdszHuMTT5w
 jTPoC1ggbwW1JQPz//ioguBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHflrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:UvEIeavRn4JlTkSUFEadB9eO7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71522030"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POC56FAXBUKJjjIEB4Eiqu0KqC50W6lJSpp/ihBG7sz3l+vmvhjPAUnDBRaBNUckauuxhCJGoH4RB1B8JMuIVgHZsY67+rd/fKKRAqo5TrEkGF/GqsDdZs7BoPoTS38AMEU9D4IrNb+GUuB1iMVeh/JuhMcwAlBel/rFxwkwUX9BcjvPdu+LdgecO7XbSW6G9Ru5472V5bTFnjbuMW2txYAb8N1wQHbyh0pmi9jnmB4IRP35xVV066jItcDR0UqTSgy9xpoJAsG/ztzrDm01P4+uAdc0TKfCGv2A20Pdw43Qu/FkuDyaDAr2GHazlOFxkIYePOSfCvoiLG0hquWzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxSlUfvN6JeUVHl1k+RSb6917evB1uk3oZs7PfOeJ4A=;
 b=KpNUYgXQDc3clrbA+63U4QY5LRQfwMQOk5S+hh079njHr5PvBjbWXkLD5A8kSdDXSTO+Wn9nQsQMoHBrrpTUv2ztH4CbN7xWcarU1Pnm/0mpIDvODBgnRnikvGtI9b14b+gQlFC6VE/feO3jF8BS1S7Khsv8QkAWNHISsFqXbZYz64C9EZv0aJ4WVAiieim7BCmMhZvar7FJoegg7M+hi83v20wTlvnuuAC+LXJaiahysHBDKe877DNe9WUJuSlT0xxbMCZvWvk7x1iuYZmqMn2oQfeOuZqhSH0jg2lZZc/bJWY2TDNG457VyupJnqJUu40Ga9coVY+Dl/pEr1aWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxSlUfvN6JeUVHl1k+RSb6917evB1uk3oZs7PfOeJ4A=;
 b=rvy27KlawbnW7He6fr7eeVqmvJB2AZfefL/39+mvm8qx66Y+MmDc9G0yM5Cq04MvC3TF+OA42hIXLIr4a66JJFolXwi1ik7R+pbw1CR0udtYjLrlrdgWrneQ0oak5jVWnX+6EKGUisiU5K5yUVRaLrN6eYvjzH9kDcN3CjPWcLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 17 May 2022 17:43:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Message-ID: <YoPCkMah/Wv5KBj9@Air-de-Roger>
References: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
 <c8f95032-1417-adfe-3170-62b39ec0f6ca@suse.com>
 <YoO1wt6Wq1+XOXsK@Air-de-Roger>
 <9ad924ae-1a40-6ac4-55ec-a468dadf5dcf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ad924ae-1a40-6ac4-55ec-a468dadf5dcf@suse.com>
X-ClientProxiedBy: LO4P123CA0511.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e369dc-f309-4097-e8b3-08da381bf61a
X-MS-TrafficTypeDiagnostic: MWHPR03MB2765:EE_
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB2765C3B28AB93734E7D3E2F88FCE9@MWHPR03MB2765.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JZYnr4BGkLfvYp/8Gk2wwJK09fPXhWBY/2r8QrpKSemm4l/QYkxqZHyUYjcs3Wk+FTyv93hxcTdeU2BGnyoUnW4u96LKfghtKy+voegrc2xZ/MDMY1VmcHqUh9iJcKrsa6FhSgTpww6aU/61VPXb+TuGR04JkuO5iq1RXT/8xawqnrDX2P71AuGWBKxguxrX3W0i+yYtc+rLs4GrsllmTwq6rpln7k8rB0Tn+sz54akHOx2VYzQGqvSM1GueXn0UV/9qLZN+2wgiA8YOvFnRvJp1autDOcKlvaQ/S8pSLUZryIo9C75RBnz9FGD2uAfcsjhVnELaDTYElFOX/9xSSHmqQ84vU+BfFNeht29aXur+vnYSUu6KrV9GVCC/vNa5S6PHz10756GI8d2nMExyEaOI0pjABcCwJauWFGWfHXjnMmAB4dVOse8rjHvfzY2qVMNJmbMsFncTrdfwUrGQ65EJcVA2WcAXmE+R+n2ABikhCXARS3bIePjM0aI1rJIj8UkJ0D4+yT1efNcrFWzUYBiOqxCkumaaoHhyje3FVbFqFYjPTQ1yZ+rhpTvLqK2XfdjWxFPYfGDppJliUMWamlPFs333TQuUnY+FlvaCMeJ8HWb3+0v+ckIBlaYNP3pD/WeJ5soP7HxyJDc25Gvxag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(53546011)(85182001)(82960400001)(6916009)(2906002)(4326008)(66556008)(54906003)(66946007)(66476007)(6666004)(508600001)(6512007)(9686003)(8676002)(186003)(6506007)(33716001)(86362001)(6486002)(316002)(8936002)(26005)(83380400001)(5660300002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1NPVDBoRDRhWUxLK0RIbURQcUlJd3FXRTNYQzFncEp1Z2Y4Sk1FdkdyeXdQ?=
 =?utf-8?B?RFdHNUYralRWRFpBUHZTR0w5bGl1aGlIbW5lMWQ3TFZ5VGNKVE5VQkh5T1pU?=
 =?utf-8?B?MVpydm05VUNidXpwK0t5TGU2TFVNUWtaR2xBTnd3V3pYV0ZYOGI5RllBd0NZ?=
 =?utf-8?B?aFk2aHA3NUpOMTZNcmNOK2FnSXc3UmRXRkJ3Vmo3Q2d1eHJLd0lNNWo3Y1Vz?=
 =?utf-8?B?RE1VZUJ4enBOSGg5SGpMNnlqK0FOUnB2VktvMkhQWG5FVjZSTkFpM3R1VXFG?=
 =?utf-8?B?WHZnZy93amNyTnVCc1p2MCtEWjRNcTNmV0ZoSUpIdENidzk0WGhNWVlseUhj?=
 =?utf-8?B?K0R3TnUxYXpZR29Kd3NYOTdNa3kybXNaT2RGdHR1WXNnY1FZV1FraSs3Kys4?=
 =?utf-8?B?bTl5YUJ4OVh5c0prUmNSUnM2amdYdFFadFVQcHl1RU5EVFNlU08yaW5lcWZw?=
 =?utf-8?B?RU1KTVBUbVk2TTR0QXd0a2h3ZExJQU1nenQ4Q1VEN2Jwd1dkWDVRZFlpaWFD?=
 =?utf-8?B?OHJOU2xoSzkxY0JiZEY5NWI2dUxJZHJ5bERJSUNMcTdTR1VocEVGanVUenF3?=
 =?utf-8?B?ZU1DK0kxb2VxNndzOVN3Q3hPOUU2NU1kTzdYVWlrQzVmc090RG5zbjY1YXBp?=
 =?utf-8?B?NkxQNENlbDAveWlvRndvajl3MlhYWkFqSml6a2ZqNU5HTEJFMWZ5aXVMTHdJ?=
 =?utf-8?B?Yld2Y0NWUHJTOUJkbDFmYTI3U25kZmlGWkxFUE1xTGk3ZWdyR0Z0eFBRNkE5?=
 =?utf-8?B?OFZZNGpvWHZYWFRManFQVjhDdmVBeGN0QjY3QTNGN1E1NTNldHFDWkhXVDF4?=
 =?utf-8?B?bDY0SjFQOEZwbjVpQXhMVDNmUzh2dWdibHVsZjByTVVRRTJsVjNwaDFEZjhO?=
 =?utf-8?B?VHFCeTBhZTR1MGRDeDFneERuTXhCMm5wdVcrTVAzdlJjelhDYk02T0pMaHpn?=
 =?utf-8?B?UGE3MHkwdS9uYUN4K2htZWlvMUNtVjFZVDJwSC9TRmtvQTZRSHJIWXV2enlr?=
 =?utf-8?B?L2NxaEdZN3JGTytTVTRGUnhWMjR4bzJIWFNYd0k3aWJiNENEeGF6ay9BR1Mx?=
 =?utf-8?B?YTlEd2dNK2VMNGdmT2hLb0VPbUM2djJVcUFyZUNGaHQ5Qy9TUHQ4bVF4cjRZ?=
 =?utf-8?B?MjlLUEZPVjJEQkR3dDJybmV0enl4MTlkNEhUQnVYaUJQVTdSaUlmaGttQU5l?=
 =?utf-8?B?cFBuWFNkcE8wbFdoL0ZIWlYweTJMT09GZTFPM1pjejNqaGhZWnVZbGp3RS9Z?=
 =?utf-8?B?cGRpU05tc3RlcmVlaW13TnF3SVkrWEVuZTh1TkxXaFBkNU0rT0F3YkhKUFZm?=
 =?utf-8?B?UlRrTGdieEp1bEI0M2x1OTNoSVdnbzgxZVQ4c0RXaHVkY3ZqcUN2L1czRGJT?=
 =?utf-8?B?RXVsNXFUMHZtaHd6M09jSHBTemdLaTkzOUlGVHVZYmxIOHJ1STdOMEdPOUlu?=
 =?utf-8?B?NUJpcmR5N1orZlhPQUpBb0NZZXhtbmYwblQ4alpZSTZHTkdvM2xDdDdGTHM4?=
 =?utf-8?B?ekp5UWxzTFRGUWlsbWZEVWNQNllEUnI4cXVaQ3VsNnlwVHVQWW1vTHBUV3R3?=
 =?utf-8?B?eUNlVEVZbDlLLzRmUTJ3OE9kbnNBVXdEZ3RGc3hCWmtaRmFmb3p6UkdMa3R3?=
 =?utf-8?B?NmIrY1RWZWw4aU1Ldi9TeExrNEN3ajkwZDIwQzI2SEVrcThUT1Jzb05WclYy?=
 =?utf-8?B?bjFlMnhQOHFoZFNMU1h0cmZvN0Yzakc2Q1RGYmxMTXFQV2tkcjZmTjFqMG1a?=
 =?utf-8?B?cUFNbkErQldObHRSSFpmelFYaXhkNW9sSDVxaHY1cGlSQythQ2ovV2xZV0Zu?=
 =?utf-8?B?YnF3ZnZDYXJmU0xxbUpDMCswcER3dTRKaitBTXpLai9wVmZ2Uk04djVqb2N2?=
 =?utf-8?B?cDRZM2p5QjJXVGN4OW45djZjdkx1OTZkTElsYmIwWCtwaG01cEVuS2VGL0lN?=
 =?utf-8?B?V2tkZVhQVXRiQk5SU01jYk9MNlFpWVp2YXM2Sy92Y1FpeEpRMXJBVlpzcFpZ?=
 =?utf-8?B?UDR5Rnh6K3MyNUtmM3hzSklkYjUzeHpxbkRNU3BOVXZrY0lpOG5DczNhejJo?=
 =?utf-8?B?K1ppS1Vzbm45dEJuczZXMjNQU2ZsM05uMThKMXhLMUd4NmVnUUNvYnpGa1Ji?=
 =?utf-8?B?THkrZXJyZkovMnkrT1ZSOUh5K3F2c1JVVG4wMnJ3cE94U243VFg3TXpqOVZn?=
 =?utf-8?B?aC9uWjUvNXpCcVlOUXlvVmEzUG8rbG1YUjdQWFFvZkRBVGJvbDA0SUtiOWJx?=
 =?utf-8?B?WkJlOEJocmpoSVZabkhLNHJRMlMzcjFaTnJoNWFHMi9PZThCS1cvcHdIWGJr?=
 =?utf-8?B?WEo1c1o3UE5yUyt3Nmh4cDVDVjdPcTYvT3BxanN1UlpQT2w5V3ZvYXorSG9Z?=
 =?utf-8?Q?dkeaFslNSaaStkv4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e369dc-f309-4097-e8b3-08da381bf61a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 15:43:17.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCvHo/hrwjVeGlM2f59mVTtH/Mp4U4RDlQ3sbi2cebFLfoKF6UvYKlon4PT+3MMLLkhfIkW6HKmKvqiVVjOtYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2765

On Tue, May 17, 2022 at 05:13:46PM +0200, Jan Beulich wrote:
> On 17.05.2022 16:48, Roger Pau Monné wrote:
> > On Tue, May 17, 2022 at 04:41:31PM +0200, Jan Beulich wrote:
> >> On 11.05.2022 16:30, Marek Marczykowski-Górecki wrote:
> >>> --- a/xen/drivers/char/ns16550.c
> >>> +++ b/xen/drivers/char/ns16550.c
> >>> @@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
> >>>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
> >>>                                             PCI_INTERRUPT_LINE) : 0;
> >>>  
> >>> +                if ( uart->irq == 0xff )
> >>> +                    uart->irq = 0;
> >>> +                if ( !uart->irq )
> >>> +                    printk(XENLOG_INFO
> >>> +                           "ns16550: %pp no legacy IRQ, using poll mode\n",
> >>> +                           &PCI_SBDF(0, b, d, f));
> >>> +
> >>>                  return 0;
> >>>              }
> >>>          }
> >>
> >> While this code is inside a CONFIG_HAS_PCI conditional, I still
> >> think - as was previously suggested - that the 1st if() should be
> >> inside a CONFIG_X86 conditional, to not leave a trap for other
> >> architectures to fall into.
> > 
> > The CONFIG_HAS_PCI region is itself inside of a (bigger) CONFIG_X86
> > region already.
> 
> But that's likely to change sooner or later, I expect. I'd rather see
> the surrounding region be shrunk in scope. Already when that
> CONFIG_X86 was introduced I had reservations, as I don't think all of
> the enclosed code really is x86-specific.

My though was that anyone removing the CONFIG_X86 guard will already
have to deal with setting ->irq properly, as I expect this will differ
between arches, at which point the check are likely to diverge anyway.

In any case, I don't see an issue with adding an extra guard, albeit a
comment would also be acceptable IMO.

Thanks, Roger.

