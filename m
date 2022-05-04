Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9CA51A333
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 17:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320804.541739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmGao-000339-37; Wed, 04 May 2022 15:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320804.541739; Wed, 04 May 2022 15:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmGan-00030k-W6; Wed, 04 May 2022 15:07:05 +0000
Received: by outflank-mailman (input) for mailman id 320804;
 Wed, 04 May 2022 15:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmGal-00030e-QH
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 15:07:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8b27c3a-cbbb-11ec-a406-831a346695d4;
 Wed, 04 May 2022 17:07:01 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 11:06:58 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB3230.namprd03.prod.outlook.com (2603:10b6:301:47::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 4 May
 2022 15:06:43 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 15:06:43 +0000
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
X-Inumbo-ID: d8b27c3a-cbbb-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651676821;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/tDBmlUfkdgZedZn816TXJs6fQ2aaqtHWjaOnvFZZzM=;
  b=MUgjKSFHKHwkjCrHVbUR7uOvUMe8qxUfdNc18r5J5RR8Pyrd6r0tCmJv
   ltE0JISHuayPRFjJes+JKsN6kgkgn/awlO11fjq4rr2sOsdhCgJMh2rXT
   IvaVaGo8W8QnA/iAvlGS3QLtwBBmHNGyazk5dltB5pzuLrBbxSynp2EQs
   Y=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 70562892
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sZelU6z1fV98Wo2dQQ96t+dMxyrEfRIJ4+MujC+fZmUNrF6WrkUOx
 zYaWz2DPaqCY2LyKd1ybImx8x4P75CDzYdjQVY4qSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12YThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsaCyUFs3IarwiPk3dQZ+IjBgELd7weqSSZS/mZT7I0zuVVLJmq8rKX5seIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtadHeOWube03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrianLmMC+APPzUYxy07+7B5v4p3iDPPUe4ysQeFTkVSYl
 m2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVtDgWzWorXjCuQQTM/JPF8Uq5QfLzbDbizt1HUABRz9FLdk57sk/QGVw0
 kfTx4+1QztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjTxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:KoG7PKPZ0ZvQ8MBcT0j155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 DsrvZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolCs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REIGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUETA9OL8y7qvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WrAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 ZT5fnnlbZrmG6hHjPkVjEF+q3vYp1zJGbLfqE6gL3V79AM90oJinfxx6Qk7wM9HdwGOt15Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexrwqEH3QSuvyWqOLtB0B1v977jK3Z4S2MaGPLQ18bpaou
 W1bLofjx9+R37T
X-IronPort-AV: E=Sophos;i="5.91,198,1647316800"; 
   d="scan'208";a="70562892"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hzvs74yV/ag/Ej/V4Jxc2nIxfug9HdrYkM8y2HdgspyI8zpoEk4sPc8YquLBju4xIG0dHfJAOF99qDHDbRn6OLHor5PjStrDuRn6elwFyQSrjN8MwfX/F4PTHZMQwFbP6JyAhGPXb+2trjfRJlLjPjsxwevOsU9PYs9MIPq/tAvGcd+xMexiYNBisu94gNUh40f4hYI8bRWTVCnouCySTSO511RbBOQ3sGUiR86wQVUroteYyijONt49XcmOTbQkgzgBfyGBAGB+9S1oDmnjiA5/wM5byEnuc/+8Z6CSlKlDHyPRDvOlxay08JjLkg25u4VPeLthDsp4fzonu0S8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNCr8JtWNmzzkI4xTIFBx6uWfiaIOvJ4Yifm6zPjdcc=;
 b=AnGK9l8YO7yeTJ9IwMPTRofWs13H57NfwK2A+qT+zdLqNYl1TvkBxSvcpZun5itM2d3xpWkHhSq6BayjvuKZUEATv5S3L/lzrz0m0/sTtaO/icXW1g6osIWr9xL4KRqOc6DlgJuYphieYO+4+vB3PpzeIym6Bul2AR88dq+cmGnJ6WQxDWQE94iSKIx3oCTRIUsP4j7BHp5NETvU02htvey7ihPzizpyJ0+8NAyEjqmADBhijmDj5VV3pQh2ofdFTYT0oWAVDZS+rIfQca/1/LTV3xMPlte3kjMicXKUFBZ7ZYIABsUXOke6hs8a0beuWckVbtUy/Dxn+oQEcceaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNCr8JtWNmzzkI4xTIFBx6uWfiaIOvJ4Yifm6zPjdcc=;
 b=oIIn97RusZ2JEgDZq3cXXoX4UouCNfKcwFLTdL8rF66EfpwXj9+FMiHqCnDsbnWrJ3Gp5Kol+DJ+KKSGorfpKbvIfkirwbvHPaIg9J9b3xh1eHINwoG/Ped3j2QE8liz9lai7roRo0St+z4KnB9RqN/ZCOa4mu3w0c3X0G3FecY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 17:06:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 07/21] IOMMU/x86: support freeing of pagetables
Message-ID: <YnKWfTk2VjiXL67z@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <1389c785-ffe3-5d8c-36f1-a923ce5250cd@suse.com>
 <YnFWW4zenNq/SAt4@Air-de-Roger>
 <2d0d8aa9-1ab8-a505-e2df-c9b6446062cf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d0d8aa9-1ab8-a505-e2df-c9b6446062cf@suse.com>
X-ClientProxiedBy: MR2P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0961f478-510d-4062-d793-08da2ddfb2c7
X-MS-TrafficTypeDiagnostic: MWHPR03MB3230:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB3230C8A79493AAB660A8AE048FC39@MWHPR03MB3230.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MKrLMM206IO2irf183dvYGbBMP63De97ABSoORX1tvSs7+Xj1e+ZHC9L1R3zsvZp7Y5brVlVvpGDgAPFJ3S1hi7AAJgjWOVTpMyqov8bJJGJWwwpNIPZe8nSiVtl+h19YOgRHb5dK917Rz/aRjGz8DYwwbb+fQhppsF+R97ZVU+SZ49Rr50MDoHAIXGfVgZm42mKwAeApd2QJcZZsOueUee/KvJnsrecOWIRvQHuOAcF70LX4rObcZdvRb6wO0vqmV80hSscUHL8qa2/p039ahPCjYG9XYEGKeS/Xfx57uHSblFXQD5shcyGX7FSi3ahAfMdWbV/Ame7YK8/M76pBolzKd4TsR9p1gnvl9lXmx4LG5I9cjhl6ZMjpmIbWujizCJIrKqtCjREcnZ0675HgLpwALuDWBuVKivoeb1N0O6fYVml8+vcpb1ftZ06pvXQcDte9hoWMbCA4vo0SE8tz6tiA/GiUlGNVBe57/7Q3XpfPaw733EPLIfumxudjAHEyKUIrgsPDO0u323jOA/DlCV9EONAXHIZHAIQeJ7u3cWv1efAHJtQQS/i/F2uU9lwlUoo+U1/KOOcC+tPhfNblFujkBQoibdH1ggd8ihEPoYj6O4ugfbSqluU7xUU+xgJmhkVqDw6vq7mB0F1xX5wqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(26005)(5660300002)(186003)(86362001)(6512007)(9686003)(82960400001)(8936002)(8676002)(4326008)(2906002)(66476007)(66556008)(66946007)(53546011)(6506007)(508600001)(6486002)(33716001)(54906003)(6666004)(6916009)(316002)(85182001)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QURtTkl6YUQ1dHJJaHVPMTdENDQwcDcySDRaeWc3UFp3L0pPQTRzbHpWbUZR?=
 =?utf-8?B?ZGxNVTJZNzl0SzdIZjQ2UjFKTmRLZHNlMCtJTnBQK3h2SDNJWGMyN2w4WWNB?=
 =?utf-8?B?eUEvdDlYYlFiKyszeXJqd0hzcjRLaDVTTlorVzBIeHV5ZWc2TTVsaU5RY09w?=
 =?utf-8?B?YUd1QVhCbjNta3J1bkNCYjFZRXRpTVVxNVcwRjRqVGJNT0grNVovMUhkS2lN?=
 =?utf-8?B?NXByWlBSaDJqSCtQUjZNZXZwNU5lN3pXUTh4M29nREhzZnRxTVhCeXZ3NFNR?=
 =?utf-8?B?YmN4TjhDZmx2TGZEVSt0aVZpTnQ3OUMxa2lCZllYVC8xSCtXaUp6YWxpM0JC?=
 =?utf-8?B?R0lpUEtmQ2d6UzV2ZWREVXZycklDZGxZdHFUYTViazA5Mzc0b0c1c0t1Q1g2?=
 =?utf-8?B?OHJkZHh0c1ZsRllqK3dXbXlkbEhtMWtZOW5FNnVULzRsa0tPS3RTdkRkVjRr?=
 =?utf-8?B?bTV3NkhDbGo3T1FsV1lUSDJZR3l5MXJXdkZoNUkrNGlialY2RUpzeEpBMTBJ?=
 =?utf-8?B?MmpxZ2RvZGFFZUVhL2VoRW9NcllMSGxzNVk3dFpaMFJpSmh6WnpkV3JFbXBL?=
 =?utf-8?B?dWs3R0xJYk9oYUExR1lBYmYxdFp1T1U0Nk1UM2RvYlV2RDZDZnAzaWNVcGJ4?=
 =?utf-8?B?aUkxRzZoditkOTc2YWxaRkpwREg1enUweXFzRW9yNm5YOGlaUUFnRlhnVWNl?=
 =?utf-8?B?ZHVoSElJM2ZKNnpkZFBiOGRYQ2EwS0x6MWJuUmgrdkkvOExoYzM2b2w4N0o4?=
 =?utf-8?B?ZzNKNEpsZ1h4VWxZMFJ5elcrUjV1dytqNmZUb1BzVEtQbnFmVmlyNVhBZGsr?=
 =?utf-8?B?dGFvVmVJelVsbEczbVZTMklYa1d4VTJOZ1h6R081VnRkaG5HR0JLa21LSktF?=
 =?utf-8?B?c0E1VXJjalhiN2h4L3FUYmNTM3YzYnJmekJabVFXN2VLTGVYZkRZWFFxMmRa?=
 =?utf-8?B?ZEo0NkVMRmhUejA2Ujl3SXpvSFo1cVZqenJENTgvbnh4REd6TmRVWHhWMXFh?=
 =?utf-8?B?SXBMVXVaNEUvK0ZzWWxXZm5nYXc1YXY5bE41Y3hJbXJRV1BaRGIxTE1KZW16?=
 =?utf-8?B?SW5sdkppNXlUbkZxN1RsdjVIOTdITGZJdEFkMTcyYkFidHpKdFlJQ2JFdC9R?=
 =?utf-8?B?ektnVlVHODNMT3oyaGFHYk92WEdrRER4cjVXL0tCN3hpSmtjUk91K0dEbWhQ?=
 =?utf-8?B?TWFDMVRiZENyVXU4VUgwZ3FzaWJSNi9sVTgrQUw5dDdMYWxKc3VIa0ZVMExq?=
 =?utf-8?B?VTZoTTJqTnd3cmFVcXByVnRMM0M4NFpSQlJwL0RCQXV5SmJIeGFRQk9XMjNo?=
 =?utf-8?B?OFpXSE1vL1VJdE9RMi92eTFpRTd2UytMclRNQVpleWpIbUJjMlVsdXhxYTFn?=
 =?utf-8?B?WGs2N0toblJwVTRsbmFPRzA1SjRIS1QxZ1FPTnJKT3A1cnJreDFaVTFVd0ZD?=
 =?utf-8?B?VmxnVmRld0lwVGo0alVGZEJkZUhnL3p6dVBNM3AwdzFIQjc1cCtjR3FJMlZr?=
 =?utf-8?B?bUd1dzZXZU45TnVIcTNJdXRidTFRb1ErK1F2eHhFSHNQUGNwdlBIV3ZDUVIr?=
 =?utf-8?B?cU9COVkxYmZlVU5BR21RRitVdkdTeVVOM0JWRXRqOXV1azBKQnZySm5aRmF6?=
 =?utf-8?B?bmNjOFVQMlBmMVl5THdCWEMxc1JGN0pETjh2c2d1ci82RyswcnJrWWNzUHdU?=
 =?utf-8?B?WWJLMkNSMk5GdU1vYXJyUWYvWGpFRkJhZy92YzY2OEM1WCtqOW1iRDZmYjVi?=
 =?utf-8?B?RlBrcWw4cUtWNU41ZTRBWmtoU0ZHdzQ3N0lFWGtwNkRMNDZkdENlRkVzc2Nk?=
 =?utf-8?B?UzQ4WlJtaFhQU0FiOW9DZWlDMklBL3JlYUJXNjR6T210OVY0SnpsOGYweFFm?=
 =?utf-8?B?dHMzaEVLK2FvTDhJT0pKWUt4eGJaTjhERWdtZWlUc0VZdkk4a1FwVzlMMXdl?=
 =?utf-8?B?cjc4NlhjK2RYendLNTBEZXdJc0hNUTZiRHpLb1pCZ0lPeUV0T2lXWFU4UnRw?=
 =?utf-8?B?aG43QzVEOVlvL2s3SDB4RDlOc3B5VFJVdDJtRnNyWG1Md0gveXUrbWp3dVA4?=
 =?utf-8?B?Y24rSTV2c0dGeHMrVTZROFY2MytrRW1yT0tiNjhwOGd6ajU4QkY5ZU1hdkxw?=
 =?utf-8?B?TkVsdjJnWWFQY3VFdENDT3JuV3E4YkJGTHVuN3p2dmhZTFNvRU1EdGtHKzc5?=
 =?utf-8?B?bzBRM1J4TkNCblNYSUlHd1l5YU81aElPZHJBQVROMGFEZ2lXenJNcHdlbEJi?=
 =?utf-8?B?c2piR2xYc3NLc2o5blhMa0ZlaGVIaUovR05PUVBIMTRZalBFdXErYUhaeldS?=
 =?utf-8?B?VmRIbmRVOWVPdklET3VtUnF3MFhEYlJPbS9mc050SUlFVlJqYitPUmhVYVA5?=
 =?utf-8?Q?mT04IJjl4udWcGXA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0961f478-510d-4062-d793-08da2ddfb2c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 15:06:43.1431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/Uy/rr2O8jqdY63eaKxW8bXoAsHxX5+0oZISShJdsw0xKLPwYFGhAb96AswZxPD8a+CZ9lywBBcHz/lG3IVVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3230

On Wed, May 04, 2022 at 03:07:24PM +0200, Jan Beulich wrote:
> On 03.05.2022 18:20, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:35:45AM +0200, Jan Beulich wrote:
> >> For vendor specific code to support superpages we need to be able to
> >> deal with a superpage mapping replacing an intermediate page table (or
> >> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> >> needed to free individual page tables while a domain is still alive.
> >> Since the freeing needs to be deferred until after a suitable IOTLB
> >> flush was performed, released page tables get queued for processing by a
> >> tasklet.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I was considering whether to use a softirq-tasklet instead. This would
> >> have the benefit of avoiding extra scheduling operations, but come with
> >> the risk of the freeing happening prematurely because of a
> >> process_pending_softirqs() somewhere.
> > 
> > I'm sorry again if I already raised this, I don't seem to find a
> > reference.
> 
> Earlier on you only suggested "to perform the freeing after the flush".
> 
> > What about doing the freeing before resuming the guest execution in
> > guest vCPU context?
> > 
> > We already have a hook like this on HVM in hvm_do_resume() calling
> > vpci_process_pending().  I wonder whether we could have a similar hook
> > for PV and keep the pages to be freed in the vCPU instead of the pCPU.
> > This would have the benefit of being able to context switch the vCPU
> > in case the operation takes too long.
> 
> I think this might work in general, but would be troublesome when
> preparing Dom0 (where we don't run on any of Dom0's vCPU-s, and we
> won't ever "exit to guest context" on an idle vCPU). I'm also not
> really fancying to use something like
> 
>     v = current->domain == d ? current : d->vcpu[0];

I guess a problematic case would also be hypercalls executed in a
domain context triggering the freeing of a different domain iommu page
table pages.  As then the freeing would be accounted to the current
domain instead of the owner of the pages.

dom0 doesn't seem that problematic, any freeing triggered on a system
domain context could be performed in place (with
process_pending_softirqs() calls to ensure no watchdog triggering).

> (leaving aside that we don't really have d available in
> iommu_queue_free_pgtable() and I'd be hesitant to convert it back).
> Otoh it might be okay to free page tables right away for domains
> which haven't run at all so far.

Could be, but then we would have to make hypercalls that can trigger
those paths preemptible I would think.

> But this would again require
> passing struct domain * to iommu_queue_free_pgtable().

Hm, I guess we could use container_of with the domain_iommu parameter
to obtain a pointer to the domain struct.

> Another upside (I think) of the current approach is that all logic
> is contained in a single source file (i.e. in particular there's no
> new field needed in a per-vCPU structure defined in some header).

Right, I do agree to that.  I'm mostly worried about the resource
starvation aspect.  I guess freeing the pages replaced by a 1G super
page entry is still fine, bigger could be a problem.

> > Not that the current approach is wrong, but doing it in the guest
> > resume path we could likely prevent guests doing heavy p2m
> > modifications from hogging CPU time.
> 
> Well, they would still be hogging time, but that time would then be
> accounted towards their time slices, yes.
> 
> >> @@ -550,6 +551,91 @@ struct page_info *iommu_alloc_pgtable(st
> >>      return pg;
> >>  }
> >>  
> >> +/*
> >> + * Intermediate page tables which get replaced by large pages may only be
> >> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
> >> + * per-CPU list, with a per-CPU tasklet processing the list on the assumption
> >> + * that the necessary IOTLB flush will have occurred by the time tasklets get
> >> + * to run. (List and tasklet being per-CPU has the benefit of accesses not
> >> + * requiring any locking.)
> >> + */
> >> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
> >> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
> >> +
> >> +static void free_queued_pgtables(void *arg)
> >> +{
> >> +    struct page_list_head *list = arg;
> >> +    struct page_info *pg;
> >> +    unsigned int done = 0;
> >> +
> > 
> > With the current logic I think it might be helpful to assert that the
> > list is not empty when we get here?
> > 
> > Given the operation requires a context switch we would like to avoid
> > such unless there's indeed pending work to do.
> 
> But is that worth adding an assertion and risking to kill a system just
> because there's a race somewhere by which we might get here without any
> work to do? If you strongly think we want to know about such instances,
> how about a WARN_ON_ONCE() (except that we still don't have that
> specific construct, it would need to be open-coded for the time being)?

Well, I was recommending an assert because I think it's fine to kill a
debug system in order to catch those outliers. On production builds we
should obviously not crash.

> >> +static int cf_check cpu_callback(
> >> +    struct notifier_block *nfb, unsigned long action, void *hcpu)
> >> +{
> >> +    unsigned int cpu = (unsigned long)hcpu;
> >> +    struct page_list_head *list = &per_cpu(free_pgt_list, cpu);
> >> +    struct tasklet *tasklet = &per_cpu(free_pgt_tasklet, cpu);
> >> +
> >> +    switch ( action )
> >> +    {
> >> +    case CPU_DOWN_PREPARE:
> >> +        tasklet_kill(tasklet);
> >> +        break;
> >> +
> >> +    case CPU_DEAD:
> >> +        page_list_splice(list, &this_cpu(free_pgt_list));
> > 
> > I think you could check whether list is empty before queuing it?
> 
> I could, but this would make the code (slightly) more complicated
> for improving something which doesn't occur frequently.

It's just a:

if ( list_empty(list) )
    break;

at the start of the CPU_DEAD case AFAICT.  As you say this notifier is
not to be called frequently, so not a big deal (also I don't think the
addition makes the code more complicated).

Now that I look at the code again, I think there's a
tasklet_schedule() missing in the CPU_DOWN_FAILED case if there are
entries pending on the list list?

Thanks, Roger.

