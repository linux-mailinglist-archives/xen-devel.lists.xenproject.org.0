Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F6F6D043B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 14:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516681.801206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqyF-0002nB-2q; Thu, 30 Mar 2023 12:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516681.801206; Thu, 30 Mar 2023 12:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqyE-0002kC-VN; Thu, 30 Mar 2023 12:01:34 +0000
Received: by outflank-mailman (input) for mailman id 516681;
 Thu, 30 Mar 2023 12:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phqyD-0002jU-9j
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 12:01:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b897c9a-cef2-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 14:01:32 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 08:01:25 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB6969.namprd03.prod.outlook.com (2603:10b6:510:12c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Thu, 30 Mar
 2023 12:01:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 12:01:18 +0000
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
X-Inumbo-ID: 9b897c9a-cef2-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680177692;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ann0kxqhGasPhK4krxEgDOZh6Ewe8gPgVvkkePhUrdc=;
  b=SEGjaghy4OxZFpu3+d86FQhETwocmyekm2D7668pseJbP7RylSN5h49g
   hVnLSNS8nSGA51IDmYu9SAvq3ZuBTv/hHbYqvC9++tUUKE8Lsw2ZtiqxM
   WQYJ9tHdfk8zUSQAjirKNJARH45OXvQPK0Kk+fHzXNpO+08XwXbFoiLt1
   I=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 106089955
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:I0lE16v4omuJ2IH1WA1ohHuOGufnVHtfMUV32f8akzHdYApBsoF/q
 tZmKT2FMv2MNDP3LdglOo608R5QvpOGytA1GQI5/ChkEigW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASFzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMgpRUBui27iMm6+dbvh0n98mHdTrFdZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4a9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqKY60QzOmwT/DjUOElS2oMKUg3KOePlvN
 xA3+goh8LgtoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSfSN9mSfSxloesRm22x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNbxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:jV+eA6qom1Yej/ukE/UeLAEaV5o8eYIsimQD101hICG9E/bo9P
 xG+c5xvyMc5wxhOk3I5urwXZVoLUmwyXcX2+ks1NWZMjUO0VHARL2Ki7GP/9SKIUzDH4Bmup
 uIepIObOHNMQ==
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="106089955"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gud/r0MFXyam+aK7eA2cDDNCfhj8mtNSE7nXM+Wz+lpnYZUtr59b/jbjJUujDTNPguaAHnOljWqdW73tGxxCtyks07DmVhtPnfZ8W3S7BqGUUEAhgpnsEfKi/JeMgylX8VqNSAM9y6Ccyh4a6DW1xH4KsiKgxn73D8sTkZm+Tg0D6auM973sLme4wenGDxcM/41LNXi+GNKq789vkPw5HcaOJKzvaixps1TebaeK+mP9BoYoJNWDuQKtpoXdPkkpMHBdwECslegeDKnaUGkrOTGwJxjgvkAzsLOwLAzm4KJLOrfsM1JZ+7M6nMlL93ExOluQble8LZaAE0JYzDn+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgt+4zNGwgPcQx4D49bppNj7A3bwzLoJnmF/d35Os+w=;
 b=Yn/82k5o5pdLyhbMXTKfCCRDPYw4k2aEu35/AuVRVkFFU/Tj2L2/h+wge4qIR2m0qYYPrRjWyipf2vJZDyDk96zI1aAeqfsFoT0WCJqjQDYRZtCK7HvEjKaRqwWYc3xjx7NTZ1c3q/mESadWdhaNxO6A08MvZKMD3MId/LiJRIXQDjsNwwdxM0NZAbbJdxbhPELj3m9iCK2d+YZ9uks+28QSAEEf0nSIlSffcPnxJKOtCZOUsObfJE03LgPu57U1JivKeB1uJ3iL+eewpQvpx6DZuvIxxCKk3ae9iTr7NqqSlwzowL8VmYeKdFeVqQ8l+KiKAGkajrPuu9r7ilgHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgt+4zNGwgPcQx4D49bppNj7A3bwzLoJnmF/d35Os+w=;
 b=tc8rMqku9gD59C43+4qHIUJrQSlY9o8WYt1IZyOXFTUzn26/Juj4uBWvUiNRb6P3gO3NpmTq6OBIiK0AlkATM8DW7zCFQhaDBTDH5rDIY4pe+OLKealxYjnja0TS2tMTSo+Yc4F9Sqql72tBVyqSgd5mT2J5hYHduURA4lmxcQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8b368b4d-8a10-eb82-f7cb-d20e406ed285@citrix.com>
Date: Thu, 30 Mar 2023 13:01:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 9/9] RFC: Everything else
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-10-andrew.cooper3@citrix.com>
 <758615c4-bee6-32fd-0475-0c3c3bb7debe@suse.com>
In-Reply-To: <758615c4-bee6-32fd-0475-0c3c3bb7debe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 540e1af9-1fb0-4a38-9c96-08db31167817
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VfvSVI50ox6hpNix89OEcGYD6N2C6uzUTSsAqmyX6angJWfFHOaLam5aD60t4QkWYfPoDDWMRUyvxuPRtSTAKC/TEANUWMSlM99Wf5doWQzGCAuKqPg6q+2Ko8EgVYyhR/lT3g8ZfFQhwTryc/qdTBUltIEnIEaLH+ZVHG+Wx5QQ7b41oCja+KOOqvffy+5NJT205r72ghj9Wv+X9CFpwvl98lNWJIZyjtNpLvtWpHzQHLfMzOJcsrui42XfZaZGQ8N+fAU7cwFBf3JkxeKnxsYUk8O65cPECrl7vXKhBkUl/2jf9cmZ41pS3NmkoodA1uP5ogtcfBo97YZKCnqCgPjpfk8DHDdfbR8g76DgUkhO9gBscStilzGkumfJf3L+6reqkaJamDBvY5X8/ypgGkB19IxY4txNYwtZcEVvoNKdcagtcARBMercdQJI8xy8cvYvlbbHD11dDVCh7YS+KtCIFvxoeGzeM0vjSzeWQqIawPc0ponmXunPZkkR8tgLw0WzTN02skCP/5rFMIw5BL1Bv9Hct4lG/DYPIN+yhgDQuRtlk0mWctbzdXH+zfHGcS/5m7M5JTo4+3nYBHMhN0kf4fyfelyjpU2is+3XSkqNXjU1W2raMUuDC+WbzOicmkD0YiYuq0sneOi9xbuDpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(6512007)(2906002)(2616005)(83380400001)(6916009)(66946007)(54906003)(8676002)(66476007)(4326008)(478600001)(66556008)(26005)(53546011)(316002)(6506007)(6666004)(186003)(36756003)(38100700002)(31696002)(86362001)(6486002)(82960400001)(5660300002)(41300700001)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0tvVlFUNU5leEI4Q2J1bEZOVTdrQnZiaXJXeUF6NGJXdXo5K3dFTTFkQ08w?=
 =?utf-8?B?V1NERlZLTEQrd25ocWdFT3I1a3prN0N2dVJsT2YxeiswbzZnRU92ekU4L3NO?=
 =?utf-8?B?OHRRS2pqdW9XaUc0Q2N3MWpzQ0FYWktNQmtIREsydmdkRU43Z2lPMVhHYXJC?=
 =?utf-8?B?K3BScklpK0t1aU5CbWY3WnE1dmZIRmNTaUVncHdCQVYyTk1UZkJhSDZxdFdR?=
 =?utf-8?B?SytHb0hYWkR4NENTNlg0N1RoMnlVMjJGaWJLWGcrcTdJbVRYQTl5RDgza2la?=
 =?utf-8?B?NERSL1dvQ04xSVVtMS9mL3FwN09RWFpBenZleEZ1UG85TGp6by94RmhaY0M4?=
 =?utf-8?B?d2FuaUxsSmZmWitQR29mOUVLbEFsRUgwbWxGMDd4ckZFL0ZYZFpucUZHdy9B?=
 =?utf-8?B?MG9KTWVxVWZKWFpja2w0eXhBOHl3RDBHbXhDUmI1KzIyZFhYMTBBSzJkd0Ex?=
 =?utf-8?B?U2ZPU2ZBeTBEK3dEaXNKTnViQmFEODhkVm9pRkU5bU03NGFmc0lFM252bHJv?=
 =?utf-8?B?QUIyQU5lbHFxM0EyZVZHUlhaWjk3YTl3c2dsa016WHN6Mk1EWU52M09GK2px?=
 =?utf-8?B?TWVBbGwwYzgwN3lnbnp0MGxtOE5CU3JaZ3pGb1NtdTU3dHJmNUUvUGd3QUVr?=
 =?utf-8?B?QXBKdHF6NVJGbTNrZ2RIa1RrWHV4RTRnMUluTU9yWWY1ZHdjZlg1Z3pNWGFY?=
 =?utf-8?B?QjNNZ1lKd3dSa1QyenpBRktyMHhaSXVNenM2eVVQNkpGeElGbXpOS1Jub3Ri?=
 =?utf-8?B?ZTNDMXVad2s5Y1IwaEZBdnVNbWpSem1xTmttM0VjWjRyeHBtZHlJRW5KUUxU?=
 =?utf-8?B?OURRR3JLV0d2a0V1S3dzZStiU2V3NVlTTFVRVElvdkZKMTdWbDZjejllWVcz?=
 =?utf-8?B?aWtTMW9uamYxZTNrc1JHcjlWd2NWR2xLRzhsU2RNVFQzL3hsdVMraTJIVVFB?=
 =?utf-8?B?U3pvNTVCMlpvS21OZ2N3SkFtL040YmF3eDJsbXllYTJMYmVEbFBSR2NDRmpL?=
 =?utf-8?B?a0hJNDBPcHJTT1d5WDVuRmhuNVh4eE16RU1rdmxHTkJVVG1veStFTkhOK05p?=
 =?utf-8?B?cmtYOFZHb1J0aXcrMHQ1RHNmQ09Kb0tQcEpIcks2NmFWY0hrU1lPQ0dRRTJR?=
 =?utf-8?B?QkNBVlVoV0NmOUNOanRPN2xnQmFHRkhObHptS1NZUnlkanlZYk9HdkM0WDJI?=
 =?utf-8?B?REsvMHlNNXhrRnNyMWFHdGFINmsrNEFIeStIblA2R0lBcmJSSGNFSitzOWVl?=
 =?utf-8?B?TlRpMG41NmdlUGRpWTFQV0hXajRuWVlnc2xMdnpzMERGMkFxS3BUZ1haRHBh?=
 =?utf-8?B?cVVjV2N3aEo0eWx0Z09Rbk1iank3T2NxNzdtUVkzRkJRL2ROM2ZPcFgwU0dP?=
 =?utf-8?B?R0RldlU0QzBWdmREUnJoM1hSNndTSyt2VnVxVStWRFRlVHhjUXJ1WjBEWTZw?=
 =?utf-8?B?RG9aWHhmUk0yVEh3b3dFYzRweTU1L2k3dytRbWwwbzdDYUxhYnl1VTRXM2U4?=
 =?utf-8?B?bjNRdlJMQ1RZSXBXR0xhVjU2NXhnaCtPMlEvbTNXQnY1SG5BOFFMNWNsOTRq?=
 =?utf-8?B?ZnRoaFJwT0UzWW1IYVZJVy9WS2xGWFBCS3FQZlMrVU9aeU9UQURWOFgzNDIw?=
 =?utf-8?B?Snc2N0JNOWxBS2p6SXdMcHZQOFozdnd2dXdkNm1ueHRlTURZeksvS1JNVkR6?=
 =?utf-8?B?czQ4b21mNVRkRXFCRlM3eWVBMFNlQSs3cHRwSWFVY3lmcmR0YnhyQUtWOEwz?=
 =?utf-8?B?MkxkYlRyL0d0MTFCa08vaitSOVlTREErNDNkdGhuUCtzd2VTTkQ4R0lkL1pJ?=
 =?utf-8?B?b3JHUlF6MjBoVzdBeC83WFVhT0FhdjR5RmtwWlZVRDkzNWw2dkRuR0ZEdlda?=
 =?utf-8?B?ZVhiaFZFbW52TEtVa3JUcmsxRjJ1SVdiVjQ5ZzZ3ejFqNm1aK2hiRnREMTNB?=
 =?utf-8?B?QnpOME1LVUM2bDBEOGhBMUlVK2Y5T3k3bUczZ0tyQ1oydXM4eUkrNy9TUFFj?=
 =?utf-8?B?aWdHZDBMMTBidlFEckwwckN3M3hheEt2YURySENtRXdrYVFUblZSNFd5d2t2?=
 =?utf-8?B?SklEV1kvY3VFcmlIb1NHcFRzOHVQVXd3VnBJQldXNS9rMHBGWVgrTDVMSXFM?=
 =?utf-8?B?ZEFlelFiMkZhRGQ0R0NZTDlsQTlhOXVtcjE3VHJuVytqaFJvcW0rckRzR2Zs?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fn8VSvqgC2hSIEhqBMtZwETiWQC0DTCvREdj0L6m0mN+E22nL6uj982o5Y+FKEM9ykmqP8M41eTi9MZJVR2Fv5XZZGUMJd3lPMoPNRRQrNTLAOW2vBnUG6fvMxrudMqxaYKLl1ZJdMFdBrRFXytgMe4hvQKeOhHTot0NwmH6AV4auSeXaq1j5AhJpHrB+3GhiaZnTZGAlvg6EH61mRF1TXVbJ0o3uCt/k1TeV24FnHqYOYGTlTLR5tL31QboDaIv12daB1cb4a/pYILOqHdEmKfQXxXpjy4EmpJSwiE9B/oReahJ6X/XwKllTqfXwKqneiLmlCKFMSZ1rzui9ADKIoIN6JMXBWvN5l9pCJtrZt1BPW7C0Oxb9+sebxN22Y1A/IAU9zWBQqOE2Kq7PFjy2AXGZCekehznATd4C55g2HbxlTlFUzS+zTZleQU3iYWRTh1HdeOwWMyon1lvBhggq+4+Ifi55axzlKZzp3aYW00zSb/bcRIjknm8Myka+hHUyQDNxJFjlZJo/GMhYfJR8f9o6Cgpyywq1Ymp1ciWfjyb025Cedrl7E//x9GUMIcZ4R9CUsbmI2iXQlor7vFDmaD7s5HaULEsZAN5bfI5uTyL71+WmQQInPHucXvuzzykJtUq3oIV2blU5u1o9Zr6vkbyfR/MxgmfqjggqoahoV6+ObR0zIv7xeUUWYuXFb9UurQGvi/4E/sXuDUVhBTpa0iW6Xei03gHJrbVvNS5lXmpnSYz4MCKrQSRfgLH17xHsK35k/blTJWsn0UOE+CgE2Q5wgvNTdqJljfl5AuuCYMxsjeTNZhvLcnPm29cHWOnEhzE9ortHpXAcymCRXjdhw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 540e1af9-1fb0-4a38-9c96-08db31167817
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 12:01:17.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFwgOWxu1Q9SLT6ux/zGpMP6Vj1EM2mli1TzN7ISpu5w6p4hIt1Wijnp2guy0KkhzkVG1Z3y9STNuxNXv63r+B8vI4mFwCBJ9cX4dE4T0Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6969

On 30/03/2023 11:16 am, Jan Beulich wrote:
> On 29.03.2023 22:51, Andrew Cooper wrote:
>> Looking at this diff, I'm wondering whether keeping
>>
>>     union {
>>         struct cpu_policy *cpuid;
>>         struct cpu_policy *cpu_policy;
>>     };
>>
>> permentantly might be a good idea, because d->arch.cpuid->$X reads rather
>> better than d->arch.cpu_policy->$X
>>
>> Thoughts?
> I'm not overly fussed, but perhaps yes.

If we were to do this, we ought to keep d->arch.msr too for the same reason.

(Honestly - I'm still undecided on whether this is a good idea or not...)

>  Nevertheless e.g. ...
>
>> --- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
>> +++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
>> @@ -893,7 +893,7 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p, size_t size)
>>      struct x86_emulate_ctxt ctxt = {
>>          .data = &state,
>>          .regs = &input.regs,
>> -        .cpuid = &cp,
>> +        .cpu_policy = &cp,
> ... this and ...
>
>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>> @@ -909,7 +909,7 @@ int main(int argc, char **argv)
>>  
>>      ctxt.regs = &regs;
>>      ctxt.force_writeback = 0;
>> -    ctxt.cpuid     = &cp;
>> +    ctxt.cpu_policy = &cp;
> ... this imo want keeping as you have it here.

Ok, so that's a firm "switch to using cpu_policy for emul_ctxt" then.

Which is fine - in fact it's one I'd already started splitting out of
this patch.

~Andrew

