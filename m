Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6A78D7C2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 19:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593197.926145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOaX-00062i-SJ; Wed, 30 Aug 2023 17:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593197.926145; Wed, 30 Aug 2023 17:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbOaX-00060d-PA; Wed, 30 Aug 2023 17:02:41 +0000
Received: by outflank-mailman (input) for mailman id 593197;
 Wed, 30 Aug 2023 17:02:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwNt=EP=citrix.com=prvs=599f699f6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qbOaV-00060O-2a
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 17:02:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03e73117-4757-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 19:02:36 +0200 (CEST)
Received: from mail-dm6nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2023 13:02:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB7148.namprd03.prod.outlook.com (2603:10b6:806:33f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 17:02:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 17:02:24 +0000
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
X-Inumbo-ID: 03e73117-4757-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693414956;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y5bjWvkJMBAH9Hjr3KGpmR9NXDH38ht+rVotLhOIKUk=;
  b=Upc7oPirFUYzAEvigNASH2+aMzkPdOLMvgVYYw5OyLKt0UTZSi9q6MjY
   WBkZ7q7ZFv28B8dVh2wYyJjXzEqGA4Yy1y10+p5s3nE9JivFR3/nzZSG1
   CrBkblCrZtddp3yAUCFXjzxK3QQptsKajFjxHVAsjzlaVU9YiJTZPvVTM
   0=;
X-IronPort-RemoteIP: 104.47.73.45
X-IronPort-MID: 123859533
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8WsPOqu5LGb4ZEReRDXKMhmz4ufnVJNfMUV32f8akzHdYApBsoF/q
 tZmKTuFb/mPMzanL9wjaoq/oE9V6pTUyddqHFY+r38zFC0S+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A+FzyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFyI1aAueqeGM7JWkQLNe3uAGIvXUFdZK0p1g5Wmx4fcOZ7nmG/mPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oui/6xbbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TefjpqM73QbIroAVIBsQD2HmveaIsW6ddfwOI
 W408RB3jYFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebT4r0
 FiJ2dDgAzMps6e9RneU97PSpjS3UQAFIGlHaSIaQA8t59j4vJp1nh/JVsxkEqO+kpvyAz6Y/
 tyRhC03hrFWgctV0ay+pQzDm2j0+sWPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOrBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:Wultbq2Y2DVa/0C40tAtyAqjBSFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4exoS5PwOk80lKQFqLX5WI3PYOCIghrNEGgP1+rfKnjbalTDH41mpO
 9dmspFebrN5DFB5K6UjjVQUexQpuVvm5rY5ts2uk0dKD2CHJsQjTuRZDz6LmRGAC19QbYpHp
 uV4cRK4xC6f24MU8i9Dn4ZG8DeutzijvvdEFQ7Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl55+kr+qwxnbnpiLuBtVt6ZfcI+l4dYKxY/suW3TRY8GTFcRcsoi5zX8ISSeUmRUXeZ
 f30lUd1o9ImgnslymO0GbQMk/boX0TAjbZuCOlqGqmrsrjSD0gDc1dwYpfbxvC8kIl+Mpxya
 RRwguixu5q5D777VbADuLzJmRXv1vxpWBnnf8YjnRZX4dbYLhNrZYH9EcQFJsbBir15I0uDe
 ErVajnlYBrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRalHYd85A2TYVC+o
 3/Q9NVvaALStVTYbN2Be8HT8fyAmvRQQjUOGbXOljjHLFvAQO/l3c22sRE2AiHQu148HJpou
 W/bLpxjx9NR37T
X-Talos-CUID: =?us-ascii?q?9a23=3AxKKAlGoDpPBUBABrDM2do13mUf83SnvG0VnTGWO?=
 =?us-ascii?q?fFmwzeuWxbFGsx4oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AjdBkfw5h+4LoHIQTYsP6KVtpxoxu5f6UVVwSoK4?=
 =?us-ascii?q?mmOeqZCZSGzyn1RSeF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,214,1688443200"; 
   d="scan'208";a="123859533"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDSXPLGWTaPpfOKKi1Z2auoSmCYRCqtLOaFBYaOoYoGipERakh9xRGBJDMSSaX/1szwwtQEh30fnQiMiYr+b7JTGTTxIn+je1pPdoh6tJDlAOgXkyGGppVTk+sZnrAhzkFaAr64rRzxJO5EtKfznLJFv1J/PI+CbkfwrIOL3Os5SY/wi04+rY6UZ5taOyKBMlOXfbyafUGG72FI2mYSa23/gIptRVDpLg++R7OIV8Gi4c/7rOnIqlHgpnavnImb3QpRTWRR40PuSH/jBYWKyXeHlIQsR/zwcmEtF9sO3TriIcRBiUjvAgb1LTiuT4K3hcTIiPDnMfLepE1I4MxgbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58PVOSqatdBFDaeqyExbOczii39/eHey2SF3FJKeySg=;
 b=NJfBZR6moi3jOvPkg7hctypLdJXKT+44gZ7E29xRTFkqCzdjRPxlFTtEIGgYINdd1rhBphzxOsVoPzRXPcRLy280yV3WY3w9zzR3BvbU2PSSeeQB7P8Gn+CE5jgy4tSkzqkx2y1SIoJYWLe+aMUkkMBl044FJWxFFjTrBDDUD2G/DmcK2T0Xd3FAhWhIWr+C1l4/PWMKtLtPVKOjjLV5+pim1d+jhAkT9Z4AuaWErFdmS3P2ldwcMvHZpmXoBMxBS1OihCN4kftLOLI3kKXgLTUUibZ/5aP2JQX+1ddQoPB0mZJno7pG2aGoNtkbyA5TaFq2yo8LIUpfA0BGDWv8sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58PVOSqatdBFDaeqyExbOczii39/eHey2SF3FJKeySg=;
 b=ltI+52qGCjh1JOI7IshJWwJouamy+9C18x7kuLH2ucWoyae1LiPyb3bZzxAEG1EUWqN+vXX2AaftHkitowQsxhD3NkXmoLZSVy/OuFkP6WX7e/eoK8pjKAaGsYcYHLzKsk7VCjAa+l3OhCyjD9SnY6WIcpToSwJ3pc1nrz4O2M8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3e83abfe-266a-7b14-b84c-03eef5459dce@citrix.com>
Date: Wed, 30 Aug 2023 18:02:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest
 state
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-2-andrew.cooper3@citrix.com>
 <6217ca42-d5bb-40a0-53f0-ec543c8297a6@suse.com>
 <c86b8f1c-dffb-c850-3054-f31f584861c5@citrix.com>
 <0708d6fd-2672-a0f9-e782-83e6eb66dbeb@suse.com>
 <2ced7357-b8ec-e071-9ce5-c4d23b1a6a03@citrix.com>
 <57079660-acda-eca7-5a39-42463cbf64e8@suse.com>
In-Reply-To: <57079660-acda-eca7-5a39-42463cbf64e8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0547.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: e61abb5a-daf5-4cfa-560f-08dba97ae195
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ElyfPWQ4JIxxwLGrMPbsihunjreqrtF+o9Pw/1MRmqtKbYIM8GLfBf8HQBp+JDAYNM9I4Tgtxy5mNsUJV8TvcY7CvSunOtDh7oAT84h12XlZtnZ9P1TT4K5FOvt3PqflOYGwvBkw80V7Mwph+f4LRkAQQ+cwwVqtgNSuUgUzmfJQJpbtYjnu6FUvhr6FluFo++XMS0UgbQMock70S2uJkNogKf7LirOgK/LsiHWrqFF2oL1PJx+NVJlcYtsAWjGPLe5v5CPyt1WncahT5Fc7n0OawwFX7ribbxZtJ9tjBIFb0RnO8N6Yq9+7L46L7faxxdqcHwGoYO0mn+PAQk4Xz3C9UJNwzXyMwjlkneUUX2e2UnKBzXnwttNk2pGo+byADRcxHH8RKgRv/5zkNQ6k1YiYExVhxokN5wxfj5JCmgAvnPKvKfUzxHbSpQQsJZbEdn6+gY+sOxuouS13LJ9BNali8onBqF4zkJYziewbMEQ9AP0KLihBWifEUKoAqRwnsCCQG6LY7aVcZyQk9/DGx3V/9ZLgNsL/v7wiM0f5g3VYOZptFlIOp+eJkhVaF0xX12HS7xmg30gj8TeGFdl+F0AuZduYDkMlUA+SokL3w/t7RxM6HsIsaRYXSEY2HLaZWzlsz7NSP37wVHrDEf8g6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(39860400002)(376002)(396003)(186009)(451199024)(1800799009)(6486002)(6506007)(86362001)(6666004)(31696002)(36756003)(26005)(2616005)(83380400001)(6512007)(316002)(6916009)(53546011)(5660300002)(66556008)(66946007)(66476007)(38100700002)(54906003)(41300700001)(31686004)(2906002)(82960400001)(478600001)(8936002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUgycVZMMlM5M1UzRmFXY3drQXQ0U2gzVkxSTjdlVTRGNkMvZDQ1V2xvRzIw?=
 =?utf-8?B?cG1mYkhkMkxKK3dQSVJLVEZUbDZuL2l3SytwV3NiYkVJZ3N0VElCb2ZrUE5Z?=
 =?utf-8?B?VnFKMlBFdndjOElBVWNsdlMzWUdtMVEyYTZuTXMyUUtLTE1Xb0ZwZk50WXE4?=
 =?utf-8?B?Z1hqbFoxVnFsWG9FYzZhVVJla1Z1dVc3TUpBSXZmTGVOdVllUndkcnZhZWRp?=
 =?utf-8?B?bWFiYWtQYVNXaHNqY0hOK0Fhbkh1MzUxU2tvL2N5ZHlGUnhWT0VpUjRRY3hL?=
 =?utf-8?B?THdENno0aG8wTUp4VkhwaVMyQS9lN2xtcHpBUWllaTgvVjBXbGUrbHFwN0NZ?=
 =?utf-8?B?Qm8veFUvdjRHYTh1K01IU3NDUmVKd0dSNmRNMjliR0M5ZTQzZmJ5bG92WFFL?=
 =?utf-8?B?YmpnVEU3ZW55RjhUcWxYV3ArQW94Y0xlenl4ZkV0Q0RsNGg5d3FkcnM5cFZJ?=
 =?utf-8?B?SzEvZi9PVmJOYmZrVkFRWDVINVdkMnkzZzdqL1JUaEVaOVpwc1FkdTMzOHNM?=
 =?utf-8?B?dWpkNmdraWl2UUZ3R29mS1lXTUJTSnM3WDVHU01vaXdzUXJHcTM3T3RGNWsz?=
 =?utf-8?B?YTlKVzN5UzFCM0c4TmgyaXRvRVRLZWpaTzZuanFaUUlXRTFuZVgrV1MreXQy?=
 =?utf-8?B?N1NITFhqaHpYblNVRk11cis1ek1OeTNaN0Vxek9RVldEaklXUjRMZEp1WlFG?=
 =?utf-8?B?c0t4UWk2cVhkRVFMU0Y1RjQ0YW40elg5VmNLZlkvbERIZVJ4dkhXajNLM3NO?=
 =?utf-8?B?SUJmU2VqQkFnaXFPc3lYNlY1L1dpdlJlNXp0UHh3STFicGhaTkVnSGZqZnFy?=
 =?utf-8?B?MittR3Z2UVhSK251QkkzUENHUXozUjhLRFlaQTd0QlV3bEFlL25iQWtTKzll?=
 =?utf-8?B?bjkrMUVjZWdXZ0NpcExWYWEvSXdvT0xlNTNxZldGR1RrMUZnSWd6N2hURVF1?=
 =?utf-8?B?Y2dJNWYxZTFoLzNsYjhvc2JxUVRDd2FkN2xwNlBPUTBwa29KNEJidHRtY3pz?=
 =?utf-8?B?dU9VTFhBQVkxeTZ3eGV4Q3NKUVBQejc3dTF0bElqdUFBYnlpZzQ5VVB6dmc5?=
 =?utf-8?B?dW1DNSt0RkVrQW1IV0FWVTkrbkl6UFo4QUV1R3p6d0FWK2VhZUlLZy9yc1cv?=
 =?utf-8?B?Z1FrZmdiZXp4VFEwWXhnVHQ4ZzFKNDM1ZDFkN1RKc0ZROFQ5SlViaGpjN0F4?=
 =?utf-8?B?V2ZtOEwvSkdyU3NEVnlkK1hTT3c3SUN0OEFiaDBrUjBOTUJBVGNiM0RxaHJu?=
 =?utf-8?B?OU5UMVhDdHBMUnh6OWY3eHFJMDlNMnB6K0ZTdFYwTnlQcjEvQnBPcUZKRHho?=
 =?utf-8?B?RStua0JWZkIzbm9Ibnhiei9mcGpVNDdVMkttbEQyekZFV0wvcWxWbXdvVXRx?=
 =?utf-8?B?SXdwWUlaTlo3ZzFuMVV3dTlPbjE4NFNXM1pNajhzbVNhQnlqRnZwVWlpNnh6?=
 =?utf-8?B?eFhIWWUxNU5WZU11RHV1amt3bmRuby9WYm5OQ3lLdk1kVjNDdGNUbzc0Q2hx?=
 =?utf-8?B?OXZkZUx3RHVOS09LeFJrb2hxL2RyT01pRW52OVNkZE9zSUJmVDVJc0RqS3BN?=
 =?utf-8?B?T3lNeE9qMng5RGFEQU1SeDBHZmQ5V2J2akxzanRTRnFaNWNuZDkxM3VxNGNt?=
 =?utf-8?B?eDM3Ri9YQTdHcHNKK1Zwam4rL0xQckZOSUhIWE5MOUFVZnhQYUhNcFRIclBF?=
 =?utf-8?B?WDY0WVROTmVMTlRIWG9jTGdaOTE3aWEwVGwwekdDcGxTemt3amtMcG94Rnhx?=
 =?utf-8?B?Vzl4VWdsNWhXa25WSTNpaE5KczBKYkhEeWk5aVhRemRHZVBrM1Z2b21lSWQ0?=
 =?utf-8?B?YTNyclJxZ2Y3RjhIUnlUOGtIU1U2UVVSMzJZZEhUVkwvWGVycE5lcVRpdVJl?=
 =?utf-8?B?VlZidGdzWXB2SFVOZnhFY3JyWVhWOE0wUGNxazk3aXU5OEtWVEJub3dUN0dw?=
 =?utf-8?B?VUZMeDAyYlc0ZFNXSjhORHB3R05ob0NCWk9wV1ZDUTNabzlZRDBIWWVpNHJq?=
 =?utf-8?B?R2FJT3BKaFVKNU1IUk5jcjkwT3diQjM4Uk1ZVzRUNTQreGJ5UEIxWENqNWx2?=
 =?utf-8?B?ZU1vbkdKejhaNndpeERsRmN5dVZZeXMrN3pHcEJBQWxsdU1tc3JRTFdjbThX?=
 =?utf-8?B?YVhvUHlKQnBGTVB0b3ZQT3I2c0RIZFRwMG5nNEcrcTBydHFSR0RTczdJYkNB?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e5t6aTqnaIGvHcWM3NYo0ocriX6XsBE4LV91A0J+6AtHijs5W1A94mwafoFrwJiaNI2FhM1ZakZTkPOhZQ2S7do4xMb8fXRTMTzd66/N3xmqU2r6D8iR+fPP7gzbbXeg/R3bpZgn11GTCmTeO5drlGkS34UuZqXS+n739cSPEYuj4NEHsQ1wYqwVjI5cUU5j37MWoEpTkkJoDRg7Wly5DnGSmjzHOCWxjcfjaC34vuwKKTNeZyyARoiSQLP4WrW67/8jNhXfAT8eBlIR0Etjbpw89XbLlcn9zPOMYijEIx2WE+Neno1dzo2+ynDPJzkcomYwnwpRsIMFNQbzJ23+6jCefBTCLGBmCQJsx+ore0zypnbfv9B5X8UHLzUFB6oMYyOIMTFDt+KhF00pbHKSo8nqQiPzFmzKuxuf2bqL+mleBIoCAM6Nc3XjbcLDojK+WNuIWwExgYbQdRI/PnvwdlVZvlqphsYJUO0ykPLFAekYJkFGDGqZpE0N6AsP2vUWoYsihj5D3lh9/J9vQ+UZ4l3qYIxnxBNyxvv0YbaoSXFEXlmXKl9n601tqh62i3PT9FeGnePQtK2HUdqjzZZ1z6DnxTW1t0qgPRsdlNWfUVq+gS/xxNEldt+PZ5TGez3I1phpKdqsRC8DV4PBYmdfJTTQYv2PsDii6vQCu/w9DJkJs8dljOTeXJ0Kg8h11dB5sUIjiXYnAixppkElLEw/Z7lbEV3v/m88ZIUAxHd8xxKhXUeT760GMAwXwmi5m2JOXSIJ4PpQwAFc3qPGlF29MURGA1kh/NYtmvjqXsw+kQOfJURTV1fVuywgsvQst64lKpduTOHhTYvW0j6UZ8NMbieIhBrsVfBeXcBjXKwb6Wk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61abb5a-daf5-4cfa-560f-08dba97ae195
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:02:24.2202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oNfeGWvKTUV2S9YDhitLeme3PLZbb4LG/8gZMAvQmZspDh5uWpSeYGRqO5UmB52Rt2ohfFPFWD+KjrawJVE5JsMuawPolPnWS3Y7gGU6+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7148

On 30/08/2023 5:13 pm, Jan Beulich wrote:
> On 30.08.2023 17:28, Andrew Cooper wrote:
>> On 30/08/2023 4:12 pm, Jan Beulich wrote:
>>> On 30.08.2023 16:35, Andrew Cooper wrote:
>>>> On 29/08/2023 3:08 pm, Jan Beulich wrote:
>>>>> On 29.08.2023 15:43, Andrew Cooper wrote:
>>>>>> --- a/xen/arch/x86/domain.c
>>>>>> +++ b/xen/arch/x86/domain.c
>>>>>> @@ -1074,8 +1074,27 @@ int arch_set_info_guest(
>>>>>>  #endif
>>>>>>      flags = c(flags);
>>>>>>  
>>>>>> +    if ( !compat )
>>>>>> +    {
>>>>>> +        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
>>>>>> +             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
>>>>>> +            return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>>      if ( is_pv_domain(d) )
>>>>>>      {
>>>>>> +        /*
>>>>>> +         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
>>>>>> +         * subset of dr7, and dr4 was unused.
>>>>>> +         *
>>>>>> +         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
>>>>>> +         * backwards compatibility, and dr7 emulation is handled
>>>>>> +         * internally.
>>>>>> +         */
>>>>>> +        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
>>>>>> +            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
>>>>> Don't you mean __addr_ok() here, i.e. not including the
>>>>> is_compat_arg_xlat_range() check? (Else I would have asked why
>>>>> sizeof(long), but that question resolves itself with using the other
>>>>> macro.)
>>>> For now, I'm simply moving a check from set_debugreg() earlier in
>>>> arch_set_info_guest().
>>>>
>>>> I think it would be beneficial to keep that change independent.
>>> Hmm, difficult. I'd be okay if you indeed moved the other check. But
>>> you duplicate it here, and duplicating questionable code is, well,
>>> questionable.
>> It can't be removed in set_debugreg() because that's used in other paths
>> too.
> Sure, I understand that.
>
>> And the error from set_debugreg() can't fail arch_set_info_guest()
>> because that introduces a failure after mutation of the vCPU state.
>>
>> This isn't a fastpath.  It's used approximately once per vCPU lifetime.
> But fast or not isn't the point here.

No.  The point is no change from the existing code.

If you think it's wrong, it in a separate change and don't block this fix.

~Andrew

