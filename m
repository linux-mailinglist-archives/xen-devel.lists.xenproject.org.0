Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDEB629EE2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 17:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444016.698783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouygv-0007z6-Ju; Tue, 15 Nov 2022 16:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444016.698783; Tue, 15 Nov 2022 16:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouygv-0007w6-Fv; Tue, 15 Nov 2022 16:21:41 +0000
Received: by outflank-mailman (input) for mailman id 444016;
 Tue, 15 Nov 2022 16:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7AFj=3P=citrix.com=prvs=311e0f190=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ouygt-0007w0-VW
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 16:21:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 924d44d8-6501-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 17:21:38 +0100 (CET)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 11:21:09 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by MW4PR03MB6990.namprd03.prod.outlook.com (2603:10b6:303:1b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 16:21:07 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 16:21:07 +0000
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
X-Inumbo-ID: 924d44d8-6501-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668529297;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MplvytQ/0P+vTrUB/Js1KPcOExHp+Rr+0ASILNrxPiI=;
  b=ffSyLTXvdfteqSCPu4OIpnmy5CNGqxV+MA7ZNRupGbBVTQyTH5hO63Se
   h8rl9qSaCbIx8xKmBVT44w0kiBu0Rg8yyIG78lSnilfJ5kgzjVTRiEkLN
   a0sgatfG6kOoPL67Rgm0RIK2kyZGNiFazos65R1aEHOM8rur5JlBBlQlQ
   M=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 87407914
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5dTmB6sp5cfIxESxovUe76DwoOfnVGhfMUV32f8akzHdYApBsoF/q
 tZmKWnUOf6Damumf9x2boy28B5SvZCAzdJiGVA6/nozFCkS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaHyiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCHMVVgGCue2P+b+edvJwnsgSEMixM9ZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4O9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3nqqY10QTProAVIBoJbRimmtygsRGvUvtNF
 2we3A08grdnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQK2
 1mTjpXWDDpgmLSPTDSW8bL8hTG4NDURLGQCTTQZVgZD6N7myKksijrfQ9AlF7S65uAZAhn1y
 jGO6SM53rMaiJdS073hpA+exTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTcKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:iSBmNaggI4hpBodSPWwMsHvpbHBQX/J23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXgTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp9KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wXh4SqbpXVd
 WGPvuso8q+QmnqKUwxeVMfmeBEa05DWituhHJy4vB9nQImx0yRhHFoufD31k1wiK7VDaM0p9
 gse54Y6o2nBKUtHN1ALfZETs2tBmPXRxXQdGqUPFT8DakCf2nAspjt/dwOlaiXkbEzvewPca
 76ISVlnH93f1irBdyF3ZVN/ByISGKhXS71wsUb45RioLXzSLfiLCXGETkV4oCdiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7X5VJM3ERXMAcp95+UVOTpcDALJHsq4XgAb7uDauoFSxhVnL0A3
 MFUjS2LMJc7lqzUnu9mxTVU2OFQD2KwXuxKtmuwwE+8vl/CmQXiHlltb2Q3LD6FRRS9qorYU
 B5PLTr1qumuGjexxe701lU
X-IronPort-AV: E=Sophos;i="5.96,166,1665460800"; 
   d="scan'208";a="87407914"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOzUZuimBL5jn0Qe50rpZV+EPwGQIS+M37d4mhbKiGIlRuyCSusOUQ92Bnpu+1sVov2WLtq01vWN3RiytZmKx9R50cxicLniTdTMugk87jhf/Vh8VSRJokug+mi4cvdamSJX9nuVu26qHbKJNxyLtOrIRaKFZ/mXQJZDiPgArSY5Y22Ipm7NAoR0jav6KeonJX4DWCl8Klg8wUcqF82jKezgIEPPiVgn1QDG+BbecBFP+MR16JrcoRzctx6x7Xh+d2QkmTqeLXcJI9hAGsIMVXjsVmt2fdNhvtybkSJCx49rkNp55T6Pn2Hi6RWw9Gkmi69kirjTicxlK7UcnNQmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MplvytQ/0P+vTrUB/Js1KPcOExHp+Rr+0ASILNrxPiI=;
 b=W/bfhsToHAPp1wPdavxEHqMOG5k1Jzp81IiW12M15N+UXq+7GT0a0xgi1E8XwzRL3T095oGJgW4BCMJgxUKSCfjpzOMA92cw17BqK4eaO4JEK/clh59f/JhbkoKZd+22fggoGpJDSHlmZDSptprlqOtboc8Gf8ze/n+wO7cj2eDXqmQ5oZ/aZPiFuYVqkJi3wTic8G1InyEEQSRfgrTWu3lpmF9x2yRiPLM1kqAhE2A+0rdX2O1reGIJuist7zEGeXx+BeupnY71cZh/O1yzW8NnXQzasWeqK+SE5IL5V4NY86/9/5Sj4tuedKul/KQBZWdPvGnKMUUd5O8DQp6wVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MplvytQ/0P+vTrUB/Js1KPcOExHp+Rr+0ASILNrxPiI=;
 b=d1STvG4cly0Iab097AFcD00KLu3lmYwPkIs3vvmZRG2QC1dornSXjoTehnJn6PHro/rlcpDuRl+cJeOemtmoiB5JcoOWbYKNHeRGXsS5HTYqdgoJkbhnkT6fYRJsadV741D893cBlCWehzZipNPGibE5yKom+ZS2PbAQ5eMXL14=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.17 v4 2/2] amd: remove VIRT_SC_MSR_HVM synthetic
 feature
Thread-Topic: [PATCH for-4.17 v4 2/2] amd: remove VIRT_SC_MSR_HVM synthetic
 feature
Thread-Index: AQHY+PYG7JqnYiwdr0usZ0w09l5ina5AKpoA
Date: Tue, 15 Nov 2022 16:21:07 +0000
Message-ID: <c698b1e2-c047-1197-9c26-2239ea56c30a@citrix.com>
References: <20221115132657.97864-1-roger.pau@citrix.com>
 <20221115132657.97864-3-roger.pau@citrix.com>
In-Reply-To: <20221115132657.97864-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|MW4PR03MB6990:EE_
x-ms-office365-filtering-correlation-id: 5488ad63-6d53-43bb-04d1-08dac72566aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WuD/xjXgSHKMp5V/lR31UgougEwdbR1p2kwOCXPjEG7+kX+h5K+AHOdL0b+aaCVpfNC5PgAOZpdkrdc+kX6MObI8WwsRaZc/25IIZN8jfAkiBSbJWgvKtABkLji0MVMWO3vsDEM8RBltdO9pUpGH5vIL1Pu1YxnMGxiBRS1LBNajL4u8GxWnsJWsZgXfJtQ94HLKhPlukyIFurBNmHGHQoacp+UHUy+jdnKNBI+9ZkmuVCqpV/aGQZD0yeK7s7XCVzo4ZysBHFtFoDHUfFK/mLaVFrPMdDBi6Ihs8TwuDbaAWKDw0EnsFVCGQtm7N31hTIU49OQ8wNkkRdlJhRG4vZvIKeX1+t5u/dWFbMRcvUhMx4hqbeg1TTFoh0odqh1eYy9Lrip4HXZc3nWfh/4jWB211ua54JpUyDQ6ukoiYFAfOzaHlLgheoJXSQm23RA931lpfplmgVkg9g5r9RKg5WISNhN6Le5ApI582i0HVzpOzqQXKLtMq3rQUrjycIBPT04avjGYN+yrdCUjRRKI7O0tKrYrjNfEF2JHMVOoGp3nilB9G1rYgPdSN/hf2IQp2yiQQhOj6HcJChnerf+vrLNmQPJKm2gMcdWD2h65zZmLxwuMEDO9aWJAWy+DUGmR1tomV8OtrG/89/+T3QxRbAWkqK7Pldk1zWPsgH4ByoR9TzQscPNmGHa5Ni7reFX6HM+RKVUBNtuZRdIahGPTSn/XjW2cHkis+wO6RkSYkYFf1amB2paQpFHubbLP+EuUidDmEzHuwYWnSRmAl9ZmNMUbGmvhZYOUunYPmep9MWTxgLPsP367ZP6Um1RbIgpV5B3AV1GjSdbjSUBej6IOhg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(26005)(6512007)(2616005)(6506007)(186003)(53546011)(122000001)(38100700002)(82960400001)(5660300002)(2906002)(66556008)(54906003)(6486002)(71200400001)(110136005)(478600001)(41300700001)(66446008)(64756008)(4326008)(8676002)(8936002)(316002)(76116006)(91956017)(66946007)(66476007)(86362001)(38070700005)(36756003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFhCM1pPQmc1TVJPc1BVZU9sNTJLdUFxcGRwL0o2ZE9hd1hNR1p0OGlackEx?=
 =?utf-8?B?REhzbVFLb3VtTEZwenRzVkxEUGxkQ1haMkJobFVmNzd4SDE4cnRtUmw3TGxS?=
 =?utf-8?B?YzVETkgyYkZXbEd6QTI4WWFMZjB4MCtrZGdKSUlFY3ZiKzhEQm1wMW1lY1NZ?=
 =?utf-8?B?Nmcxd2QrL1JKWTNhcTAybVB0d0p5OXBOSzRmMFVFYjAvNGlYMVJFVzZDNXFs?=
 =?utf-8?B?SEVMZ1duenJxS1VDdE5Jbm45Z1NFUnpTY2pVWDI2MVVWczhzTzhkQlgwM2Fq?=
 =?utf-8?B?NXJyWVdPRG5aMm8vTVlhNm1mVi93WVBXdHRkdXA1OW9oZ0xMM284Z2xZSi92?=
 =?utf-8?B?SC9sdC95SnJGZlVJN2dMb0VmR0h6d3FQQTBKSTVYalE3bXAxVTgxSUFXd1dD?=
 =?utf-8?B?a2twZUZ4dXFXdVlON1J2NHc1RWErUU5ML1BhZ3AxVFJ6TDZkRlMrTG5kdDdt?=
 =?utf-8?B?aEgzY0IzbitCZlBqWjNjV3o1M29mVlFSVFd4VEZYSER0OUF4T0RVTS9LRFZ2?=
 =?utf-8?B?OEJBc3RNaTdUVWsrbmVTZGFXMGVlSzZuTmpXNHk0enB3bUc1ZHR4SEdoRlJ1?=
 =?utf-8?B?U1JFeDBjMlZkTUQxY3pINStLZTc0ZkJJcVE2UWREdEZZOU1wZkVjdWdRbmJW?=
 =?utf-8?B?R2tNTHYwcWxuYmlBeUs5S3ZNMWFmNHRMOGpwTGQrdkpuQ1dtdnpoL3dPYTFp?=
 =?utf-8?B?T1pObkpzWm83dGJTcnpEdHdMZjY0YkJjUDYvUnNjZklMaGZ0UE5ySW4zZEhy?=
 =?utf-8?B?UllmdWhnUkNkMDJ5M0FyWWgzUnNYeitlOWlsWVBuRisvREpLNkRXYmU2OVZR?=
 =?utf-8?B?NUZKU2pvWW9JcWVPbnNXcU5kazlkMHFQdTNkbjZFUEE1SzFFOHpWZzZvSmhP?=
 =?utf-8?B?QmVoQUdMUlZtMkxlekU0N21rcTBaQnA0WDdqQXlUd1IwZkFXYjNxcFd4Uiti?=
 =?utf-8?B?RHptVWN4Yy9nQVYxRG9BMVN4V1phbGxHMlF3UWVmNE9OaklFRmxZeExCekhL?=
 =?utf-8?B?YlRuZlkxeGNKbG1vbmdjbEMxakhwNUMwUmtSL1hmTnRzTGhKTkVNRS9LaUdT?=
 =?utf-8?B?T0tLQXJwckZuVkc2QjNWWmZScloyNUNsUitXcFVzTWo0MnZmeGw1SUdsUHk4?=
 =?utf-8?B?VkpCbDVFc3h3cXNtN0thUTk0L0NvVjBTamppajNOcWhFbU1tYUtlV2xJZkZG?=
 =?utf-8?B?UFg3TEQ2V3JDRUJ6Q2t4K3drQWdaOHNqaHhXRFpNY0RoeUw0bVgxNWJhYnk0?=
 =?utf-8?B?MmxkSnU1dDA4QWsrRzV4dGhXM2N4VEowaXVlQ3R6ZGc3V3NhQ05Sa2hsZnYz?=
 =?utf-8?B?N1F5SGszY3JtUS9DRFJvRmRvd0hGeU9vdS9ISmxCMHZpRE9yTU56dVpMcmZ0?=
 =?utf-8?B?UkE1U1hTaVllYk1wdTRhbDM3V0VLNVdJa0tHK0crMlpRTjVaQVBRcVFmRW5G?=
 =?utf-8?B?UERCNlMwVnd3UmNjNk9tbUNLaHlOKzNxYkYxRFovQlVSOFFPODgvQkpmeE1N?=
 =?utf-8?B?eDlKSHlTSEZaOHRod3duTFRtWCswYTdpbk9TVkFIR1piNlNPMU1DcVVoWnVi?=
 =?utf-8?B?Znp0aEtoS1lrK2NtbzdMNmxtc3loTlhESGtkVDcvV2EzakRHY2tLSkt5S2JZ?=
 =?utf-8?B?aWpDdmNBTnJEcnRNYThFc1dmaDZ2UEcyNzc3MUpZRzQyUUR5YlNGNmhlMEsw?=
 =?utf-8?B?QlRBNHM4SEhISHJNVFJBcFdRRXI2OVRsL1VxSkh1bmJGbStDUkVYc3NiUW56?=
 =?utf-8?B?QUxleVd0UkZuc29tcXArbjVLZjZYL2lLN01iZFJFdjQzY2E1K2Q5bGkvNW0r?=
 =?utf-8?B?UWFRMlRjODV3MU5MOVU0SnEyWkRDMER0SDM4ZUJXM3gweHh6cVlTUGhTZ1FV?=
 =?utf-8?B?SG5PSEdKS1ZuZmM1L3NRTFJVNE5PczhneXovQ2hCODFkcXd0QnlxSXFLTFox?=
 =?utf-8?B?YzVReEo4NkgxbmRLMEo1d1pnQkpuNzdpNzZjUHRZai9rN2NCcDVVRy94Skh0?=
 =?utf-8?B?eHhFMFBxVFM5ZVM5N1Nod0xTUHVWWmZaK1VuUnB4SmRENDRaSUt0bWFXZlkv?=
 =?utf-8?B?WEJYRUlHZkdjbFVSNGRsVXh3NDVsMmlOZW55MkF0d2huemxmOVVJaEZNYUdy?=
 =?utf-8?Q?fq3hL6PctvPCZbRYgJIcLQP2D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE8AD4758B5FBF4F8804356CF49A0FC3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7liFHl3ShKQBMIsLVI1kbvat51Na8f4+l9mWHbN226SG4sLia7DHwNsgCs+xSuPn6dETf1PwYdUp8artuNHDIs5eVtNnV5I8G2w1MiKeOgMhw89tOPs5R6R8gnXZXZcDGBVTSvZEpxln8exHAkuDTpKXSmYAuozXcNdb36BDXV8L/ks6kFCAx/VzkeUARckgAciuxC51E3/2eSdQW5udzJJi/vzi3ANKgGxEyt+rV88w7uyqgHUtaMvI4tfnWivKlz/sBKIWGZRKmEyB+vg50m+V5ZONK/AOQzwAOihocBl40mW+QTVVtf3hp20B3+LKxXZtveIytH6EQQDPX011qx04VdX8WxaPkhuFZR7v/LtEu/GpgDu3h8jAIxdkG0sYrPK4g4EmGZC9B+YPdaqM01Wfk2zwi9QMc5HcbobKSSZc2Lz8Hsrm/YeDScweS7kdOUAG2OkTtZQmQcMEtnm6cAx+QqvaWzIgL6qLiGOmVQ2fQr2xlo8H+QUKiHXgi1za9ZvL6T12fH0YVtKwpJPStd/9JtS0x0aeaKlXSvlxQnRCo6nQ/XTRee/OSPnjbJ2b8sTugit+K4lqFDm35rDdUMOfv8LSS5fL7TjKUJEmF7Ksu85zuDqffyaPUJT4wVe7EbutoAitsjE6z5sNLJEmiySWOGD6jbxvU3gaIiLEOYcOQY/fvgPUQZ0CDD4wGVj9A8Eor0utA5QSn5D89rvJzyvvro/aiXqLLTEKBW5KV30Vez03F41JbNbn1w/AkbF4ykx9gmZoOd5xpCUtCQvzwmEndt7ov6LcYafHKgBs2WJ86hlptZ8R8cgjNrCC5N64rmP9daxf0jg32igSio01p77vzlYyyDVvl13giWLsYSQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5488ad63-6d53-43bb-04d1-08dac72566aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 16:21:07.6326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbWfNz1E756ZaBQvATwx69bfXJzz9wkPWbY+3oAS9ozcrF3XZG5miUPMqHgUT5NFGP5nnHG8MPrg3lCNc6UVcf9uBzVE/PNTsLqk1N5+uI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6990

T24gMTUvMTEvMjAyMiAxMzoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBTaW5jZSB0aGUg
VklSVF9TUEVDX0NUUkwuU1NCRCBzZWxlY3Rpb24gaXMgbm8gbG9uZ2VyIGNvbnRleHQgc3dpdGNo
ZWQNCj4gb24gdm17ZW50cnksZXhpdH0gdGhlcmUncyBubyBuZWVkIHRvIHVzZSBhIHN5bnRoZXRp
YyBmZWF0dXJlIGJpdCBmb3INCj4gaXQgYW55bW9yZS4NCj4NCj4gUmVtb3ZlIHRoZSBiaXQgYW5k
IGluc3RlYWQgdXNlIGEgZ2xvYmFsIHZhcmlhYmxlLg0KPg0KPiBObyBmdW5jdGlvbmFsIGNoYW5n
ZSBpbnRlbmRlZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+IFJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNv
bT4NCg0KVGhpcyBpcyBkZWZpbml0ZWx5IG5vdCBhcHByb3ByaWF0ZSBmb3IgNC4xNywgYnV0IGl0
J3MgYSBwZXJmb3JtYW5jZQ0KcmVncmVzc2lvbiBpbiBnZW5lcmFsLCBoZW5jZSBteSBmaXJtIGFu
ZCByZXBlYXRlZCBvYmplY3Rpb24gdG8gdGhpcw0Kc3R5bGUgb2YgcGF0Y2guDQoNCkdlbmVyYWwg
c3ludGhldGljIGJpdHMgaGF2ZSBleGlzdGVkIGZvciBzZXZlcmFsIGRlY2FkZXMgbG9uZ2VyIHRo
YW4NCmFsdGVybmF0aXZlcy7CoCBJdCBoYXMgbmV2ZXIgZXZlciBiZWVuIGEgcnVsZSwgb3IgZXZl
biBhIHJlY29tbWVuZGF0aW9uLA0KdG8gYWdncmVzc2l2ZWx5IHB1cmdlIHRoZSBub24tYWx0ZXJu
YXRpdmUgYml0cywgYmVjYXVzZSBpdCdzIGEgcHJvdmFibHkNCmJhZCB0aGluZyB0byBkby4NCg0K
DQpZb3UgYXJlIGF0dGVtcHRpbmcgYSBtaWNyby1vcHRpbWlzYXRpb24sIHRoYXQgd29uJ3QgcHJv
ZHVjZSBhbnkNCmltcHJvdmVtZW50IGF0IGFsbCBpbiBjZW50dXJpZXMsIHdoaWxlLi4uDQoNCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgYi94ZW4vYXJjaC94ODYvY3B1L2Ft
ZC5jDQo+IGluZGV4IGEzMzIwODc2MDQuLjllM2I5MDk0ZDMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9jcHUvYW1kLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYw0KPiBAQCAt
NDksNiArNDksNyBAQCBib29sZWFuX3BhcmFtKCJhbGxvd191bnNhZmUiLCBvcHRfYWxsb3dfdW5z
YWZlKTsNCj4gIC8qIFNpZ25hbCB3aGV0aGVyIHRoZSBBQ1BJIEMxRSBxdWlyayBpcyByZXF1aXJl
ZC4gKi8NCj4gIGJvb2wgX19yZWFkX21vc3RseSBhbWRfYWNwaV9jMWVfcXVpcms7DQo+ICBib29s
IF9fcm9fYWZ0ZXJfaW5pdCBhbWRfbGVnYWN5X3NzYmQ7DQo+ICtib29sIF9fcm9fYWZ0ZXJfaW5p
dCBhbWRfdmlydF9zcGVjX2N0cmw7DQoNCi4uLiBhY3R1YWxseSBleHBlbmRpbmcgLnJvZGF0YSB3
aXRoIHNvbWV0aGluZyA4IHRpbWVzIGxlc3MgZWZmaWNpZW50bHkNCnBhY2tlZCwgYW5kIC4uLg0K
DQo+ICANCj4gIHN0YXRpYyBpbmxpbmUgaW50IHJkbXNyX2FtZF9zYWZlKHVuc2lnbmVkIGludCBt
c3IsIHVuc2lnbmVkIGludCAqbG8sDQo+ICAJCQkJIHVuc2lnbmVkIGludCAqaGkpDQo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvY3B1aWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jDQo+IGlu
ZGV4IDgyMmY5YWNlMTAuLmFjYzJmNjA2Y2UgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9j
cHVpZC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jDQo+IEBAIC0zLDYgKzMsNyBAQA0K
PiAgI2luY2x1ZGUgPHhlbi9wYXJhbS5oPg0KPiAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPiAg
I2luY2x1ZGUgPHhlbi9ub3NwZWMuaD4NCj4gKyNpbmNsdWRlIDxhc20vYW1kLmg+DQoNCi4uLiAo
U3BlY2lmaWMgdG8gdGhpcyBpbnN0YW5jZSkgbWFraW5nIGxpZmUgaGFyZGVyIGZvciB0aGUgcGVv
cGxlIHRyeWluZw0KdG8gbWFrZSBDT05GSUdfQU1EIHdvcmssIGFuZCAuLi4NCg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5j
DQo+IGluZGV4IDRlNTMwNTY2MjQuLjBiOTRhZjZiODYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9zcGVjX2N0cmwuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMNCj4gQEAg
LTUxNCwxMiArNTE0LDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmludF9kZXRhaWxzKGVudW0g
aW5kX3RodW5rIHRodW5rLCB1aW50NjRfdCBjYXBzKQ0KPiAgICAgICAgICAgICAoYm9vdF9jcHVf
aGFzKFg4Nl9GRUFUVVJFX1NDX01TUl9IVk0pIHx8DQo+ICAgICAgICAgICAgICBib290X2NwdV9o
YXMoWDg2X0ZFQVRVUkVfU0NfUlNCX0hWTSkgfHwNCj4gICAgICAgICAgICAgIGJvb3RfY3B1X2hh
cyhYODZfRkVBVFVSRV9JQlBCX0VOVFJZX0hWTSkgfHwNCj4gLSAgICAgICAgICAgIGJvb3RfY3B1
X2hhcyhYODZfRkVBVFVSRV9WSVJUX1NDX01TUl9IVk0pIHx8DQo+ICsgICAgICAgICAgICBhbWRf
dmlydF9zcGVjX2N0cmwgfHwNCg0KLi4uIGJyZWFraW5nIGFwYXJ0IGEgc2luZ2xlIFRFU1QgaW5z
dHJ1Y3Rpb24sIHdoaWNoIG5vdCBvbmx5IGFkZHMgYW4NCmV4dHJhIGNvbmRpdGlvbmFsIG1lcmdl
LCBidXQgbm93IGhpdHMgYW4gY29sZC1pc2ggY2FjaGUgbGluZSBldmVyeXdoZXJlDQppdCdzIHVz
ZWQuDQoNCkNvdW50IGhvdyBtYW55IHN5bnRoZXRpYyBmZWF0dXJlIGJpdHMgaXQgd2lsbCBhY3R1
YWxseSB0YWtlIHRvIGNoYW5nZQ0KdGhlIHBlci1jcHUgZGF0YSBzaXplLCBhbmQgcmVhbGlzZSB0
aGF0LCB3aGVuIGl0IHdpbGwgdGFrZSBtb3JlIHRoYW4gMjAwDQp5ZWFycyBhdCB0aGUgY3VycmVu
dCByYXRlIG9mIGFjY3VtdWxhdGlvbiwgYW55IGJlbGlldmUgdGhhdCB0aGlzIGlzIGFuDQppbXBy
b3ZlbWVudCB0byBiZSBoYWQgZGlzYXBwZWFycy4NCg0KWWVzLCBpdCBpcyBvbmx5IGEgbWljcm8g
cmVncmVzc2lvbiwgYnV0IHlvdSBuZWVkIGEgZmFyIGJldHRlcg0KanVzdGlmaWNhdGlvbiB0aGFu
ICJ0aGVyZSBpcyBhIGdhaW4gb2YgNjQgYnl0ZXMgcGVyIENQVSB3aGljaCB3aWxsIGJlDQpub24t
dGhlb3JldGljYWwgaW4gbW9yZSB0aGFuIDIwMCB5ZWFycyIgd2hlbiB0cmFkZWQgb2ZmIHZzIHRo
ZSBhY3R1YWwNCjUxMiBieXRlcywgcGx1cyBleHRyYSBjb2RlIGJsb2F0IGJsb2F0LCBwbHVzIHJl
ZHVjZWQgbG9jYWxpdHkgb2YgZGF0YQ0KdGhhdCB0aGlzICJpbXByb3ZlbWVudCIgZ2VudWluZWx5
IGNvc3RzIHRvZGF5Lg0KDQp+QW5kcmV3DQo=

