Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB4053CB83
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 16:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341544.566780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8Iv-0008WV-Dj; Fri, 03 Jun 2022 14:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341544.566780; Fri, 03 Jun 2022 14:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8Iv-0008T2-AH; Fri, 03 Jun 2022 14:29:33 +0000
Received: by outflank-mailman (input) for mailman id 341544;
 Fri, 03 Jun 2022 14:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DOPF=WK=citrix.com=prvs=146533d13=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nx8Is-0008Sw-Vx
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 14:29:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91a752a9-e349-11ec-bd2c-47488cf2e6aa;
 Fri, 03 Jun 2022 16:29:27 +0200 (CEST)
Received: from mail-bn8nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jun 2022 10:29:24 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DS7PR03MB5400.namprd03.prod.outlook.com (2603:10b6:5:2cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 14:29:22 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 14:29:22 +0000
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
X-Inumbo-ID: 91a752a9-e349-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654266567;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=C1YfvhpoVF1QArp6lYztvg0+2OgZnVDBt/mm9h6AYow=;
  b=VYPw07H3Z8IqZZTH64XyPRNa8PkmUgGmFlQPx1JeD4gkCoW4GD/oS9Oy
   ebu/Cq9SuJdXQk/Yg3+LHFWCzOne7OanXSPWJDkJ1A/KPmNiuGyHaleoY
   GsxazvaGYECW+DQT3E/59W6ohUTTXHEXKYNcRsU9m4UPdRZolf5vzsbOO
   0=;
X-IronPort-RemoteIP: 104.47.58.177
X-IronPort-MID: 72813593
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RR0jJagNdRXw+3kaUMgoN3QYX161ehEKZh0ujC45NGQN5FlHY01je
 htvWjzTPvmDMGDxctF1Pd7k9EIAv5aGmtJjGwNrqn83Enwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVvW4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVcXAK79lb0jbxgCGnBEEbVn3ZnBA3fq5KR/z2WeG5ft69NHKRhveKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI8ehWhv7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wjF/PFqsjO7IApZ9LGwH9nnX822SswNp1i8i
 DPspj/mHURPXDCY4X/fmp62vcfNly7mXIMZFJWj6+VnxlaUwwQ7CgAQE12yovC7i0u3c9NZN
 0EQvCEpqMAa90G1T9+7QxyxplaFuAIRX5xbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoOS1sD6ty6+YUr1EuQEZBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPORENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:8mUfZam67xDbZpy83pNyMtzArR3pDfOlimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH4yG7j5vZZmxm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NToj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZqA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKfPZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv7nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLUU5nghBgu/DWQZAVxIv/fKXJy+PB9kgIm0EyR9nFohfD2xRw7hdcAo5ot3Z
 WxDk0nrsALciYsV9MNOA4we7rINoXze2O9DIuzGyWQKEhVAQOFl3bIiI9Flt2CSdgv8KYYvq
 jnfRdxiVMSEniefPFmmqc7vyzwfA==
X-IronPort-AV: E=Sophos;i="5.91,274,1647316800"; 
   d="scan'208";a="72813593"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD+0x/3JpLm2NC2cVypUbA1J1VSDzKLVhOyMQLWUHNac+gDyJ5vprfS8ke+vyuJA7fTOJWTnNsixAIqUvTFwXl6p0ZJQSVP99O/d3CVTCJjvgjqaxzpoIyEkzQStpvNMJRQ6WGl/b4PHNYPlOv6bL9YLT+NXvUuMHyfW2zrjKiyRjhmJNms/FCwpe9D+DM1TPfrxq/hXGJXfD7p+ul7sjJykQ6alLdfLiwwcm28F4EecmOKW0g9WVdRd1XKzCnfoo/UNZDStpY9wcWTn0uUNMlyRcCPlMKyLKX8F5U+a6hLVf/vxHqKyup+zZylld9p4FvmnUR2d/kHapxRG6W34CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAPsFEWd6e/1cHrxy5c/bDfyKaS9E1r6zvQaDUEcdfY=;
 b=Ybw1cxDXouBiDMvJ99rMYDSm9GbZsViW1pyuzOmIuPdKivZ2tQlHtoBnvuoA9L4pfPUtwODCjY7/3KJk1s2/p6EBPrBpKAW1NpRD6aQ5szY+6tyLhXpdeRUGrBpXzWLTRt0Y6IyEJ/4KV0hN4MsI4wrxGx9cEpoxeHIJd6T1HesGrx0AFBHMk8R6vCOp1tBsjto4pNv5UH5xLA8L2setxDAeSBSndoZZlBcNdogfLPb/oyT8BizI4k7fk1ASLQ1I7s5r1XDY16vb/2E1n4OHH5DhPaw2JcqWcWZuOoG9bAx3mErQPdXNG9tx1xv6WfgYOXV0ctsYE7I0reOLITudNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAPsFEWd6e/1cHrxy5c/bDfyKaS9E1r6zvQaDUEcdfY=;
 b=KHMEI5FC3KBedKJQm03reHjlhz55wSi3D1nsGlAAJXkPjxjayQhL+0mPiLH+8yOA8irANO3Mf++0Rdgdfo+Zf8cuiD84U+yezrdi8pu1z+sqsedRdl68suwy5re78MxmimHxMu4Khpgyvs+l1/w6Sub/VwXMAOVFwZ61oPqsEyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Jun 2022 16:29:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/3] x86/vmx: implement Bus Lock detection
Message-ID: <YpoavceqO238Q6Ld@Air-de-Roger>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-2-roger.pau@citrix.com>
 <3165a99b-3a91-2ca3-80a0-af88d87e9bb0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3165a99b-3a91-2ca3-80a0-af88d87e9bb0@suse.com>
X-ClientProxiedBy: LO4P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc170b7b-f69e-4016-e9e9-08da456d73e3
X-MS-TrafficTypeDiagnostic: DS7PR03MB5400:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<DS7PR03MB5400CB1F3447A3312C69045E8FA19@DS7PR03MB5400.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BEpcDReH7oWqtbLWFSTzefjU8Lv6wSy7UWP3gysNUPIMvPwJX8BzRy9TVxUsRqrZDJCF3L9utvmzurnBFTG9dZrIh18mzquOE7ww44c+yfCMwJLC+1UtKi8ZgdyYBy8RzuhgcOk3BvMhg9/YfDpxM5thYqaLQX7exDXr14NWhcnRZfqeqaaDMj3+1yxCrEh1+favvvpU/C36ASm06mp89NT9oSRYcZiCtF32t8jcWAaoOZePJlFluy/MO3SIDAz6Og7i479f+2kkM+aDwEyzUmpfSh2G3+ua7EoSPNKLT1UAa/ksWcF2Epv8ajxdrS7pNsxAdx3wNNHTFQl4O0j4SoG6rtWWxXuYqRx+d49GPW97eO+Qh4CuH7gIJWtmuIydwcvZHDO/GzVcJQXG1kMZqcOyTSGGJivSaBrigiELXS/Zw/vbtPp8CgaYcVjMPz8f9PfefsexopckUtcIh6ZXm4O9WHGhyKnAohh9/Q6iVf721SJG9oXkdhOiwbMBPpQhTJCMkLXATIV3Hua40I/zDXv9T/sg+0XT0ZwhWbNFF9IcY53nAIuu1881P+z2jRuBzGwgZotRNjSXCujY29pxb1CiieeUkURDI4LMxQRE10m42cWiyMsuD/o/w68SZoIEusJIQP3DcbnrmTwBF8WCbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(38100700002)(4326008)(66946007)(8676002)(66476007)(26005)(66556008)(5660300002)(85182001)(2906002)(6486002)(6916009)(83380400001)(54906003)(316002)(6506007)(6666004)(33716001)(82960400001)(4744005)(186003)(9686003)(6512007)(86362001)(8936002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2RPOGErM1BBejZnSVVDQmptUnN4M2MyODBRSm5WSngxcUlqeFpzVE5tWUZU?=
 =?utf-8?B?RXNSQ2ZaL1EyWEF6aDZNcXRLOW16aC9DcEtlQnBFaWdxRktFY1JTdjYreWtv?=
 =?utf-8?B?ZlNQV091T2wwRENtakJDUDE1Q0E4c1JKdnhvaHVTamxWSitIa1lhYkluTE8r?=
 =?utf-8?B?SE9CMnFaOUdlWklyY1loMDlpTnZOTmE2dDRyb0hOcnRoVFdqK3lsazhtY29N?=
 =?utf-8?B?LzNuVHFSbFo4T1AzTVZhQ0lpSzErYm83dDlJTi92VWxhZ243MmRaeHFWYkNC?=
 =?utf-8?B?cGZMQ05ncldweSswaWRBUlRYb21YT0dJa25XSWVybnNUYy90d1BtSUo2RFBU?=
 =?utf-8?B?ajZkbUxYekwxdXZlUCtDNU5pVzZIQlZIS2VoSnJvaFpSalllbElxRGhyWUlY?=
 =?utf-8?B?V0NLbTNucGFJVFd5VG0vaVVvbDdMS3ppcmtMdkxid1RBWEFuN2tvY3M3a1kz?=
 =?utf-8?B?OHE1YzRiNTF1M3dYUENlalNHMjBYWDRMd3MzVDZVbExFTTFCRE5STzd3NGJm?=
 =?utf-8?B?OHdHWitpUEZITjI1NGh2YjUxa2tHeFR6RFgxcmlYTjJCZEx0eVFvN1FkNk5H?=
 =?utf-8?B?SElycTRibEZycWxKaENpVGVxbTNnQitKODErRGFQUGV6eFdUMDFrM1FiY2RH?=
 =?utf-8?B?RHVoL1BnUVJrdWVza3U0ZDRleG1iK3l5TUJPa0lXbkpDSDVmdFdaZ2dIOEwz?=
 =?utf-8?B?SzRtQzA2Smh5TXhGeTE5THJNM2EwbW5nejhPV2YrTTdZaUtkaFA0MERCdklw?=
 =?utf-8?B?ZXJrM3FHS3RnNWE5d2w2TXpBMWN2NndPcHJqZ2E0d0E1TzhhbjJhYjhwUDlZ?=
 =?utf-8?B?MTRFZysyTTRnWFFkWnhUZlowMFhVVUlWWXVnckpSeEFIcVNZZ0dXUEcwQ3pC?=
 =?utf-8?B?SGZwTS9VVHI1aEI3T1NSeDlYcDZnSHY4b09nTVc0MHFGM1ZoTG1BdEpHdTMw?=
 =?utf-8?B?aXlrSkpNTCtKMGYrUUZsNy91dTJjNXI3ZjNZVWlPeS9MRS9mM2pHcjYrMWor?=
 =?utf-8?B?ZThYdDM3R0pKSkE2dlNYYm5QQ3JWRkVZMytBUEQvLzNmS3lIVGd1VzdMNlV0?=
 =?utf-8?B?TzJYMCtEaFhteWdjeGVyWVpQQkJFMEwrV2MzVTlvYWthakZTd1NmQ0VmNGdo?=
 =?utf-8?B?R3U5dzV2eitJWFVJL2JRZ3pkdXUzVjNLQitTSzlaeEp2amlxQVRweVBoSUJv?=
 =?utf-8?B?R29mN0xlSDMvZTg3K2ZGZjJkZURER2M5RHMybjBaU1BYZUFob0RiMjIvQnFq?=
 =?utf-8?B?QkZpcEVDZVhhcWQwN0pKWFdYTUNXV2Y5LytnUVljejNUUzhEcHNRWkFQb2FV?=
 =?utf-8?B?QkNCWlM2cmNGc3RhclZhTXVGQk9wOXVnWWh0NWhsUzBYTlFjWENGVy92NFJI?=
 =?utf-8?B?VDJ1bC9Ib25QWFJraHpTRkgrcnJOcnRoY1RmVVhTeDViN1l1UXN0QXVhbk1N?=
 =?utf-8?B?aFY4Q3dVRW9hMHppY3B2QkRnSlB4VGRnVm1zbU10bUcxSFprSEpkQ0pnbXhW?=
 =?utf-8?B?cndwcDdyVTBqZmNnNFhod005UUpOTm03OHF4VUlwWXoxNzQ4SWUwMk53ZE54?=
 =?utf-8?B?S3NnV2ZaVWRHcWU2RjlPcWJyTjRKbytsZnpHSTA3V3ZBSVdkdmNpNnBXT0N2?=
 =?utf-8?B?eUhaUHBZTEZvVmtoS3ZSZzlYZ05ROW5ZTjVNczVKWEFsNkVGbUx1VW1SSEVB?=
 =?utf-8?B?SXBvZ0dWVnJPdHpNWWVrZlhZUWZoc1Mvb2NVU1hMQVBUQTJqbytQS3VyaTE2?=
 =?utf-8?B?bDFWL2p3SXNFaWRrb1dJeXUzRnNxaVB0MmNGMkFZRnlwbVJXOHUvLy9RdmxN?=
 =?utf-8?B?OUVDWWhCWUMzV2V2eWk3Z2FrLytHLzhqUURxRkF0R1NIQ3dzU3hDTkk2dlBI?=
 =?utf-8?B?N0NnOTN3RXZ3alJQQWtVSGhKazNjT005WHZDa2FKMEIycGx3bHE1SWRQL0FY?=
 =?utf-8?B?UnFmcWZHdkdobWU1YVZlcVFCTTVaZnpKa08rVkg2VEhqOVlpc1FQVUltQWlu?=
 =?utf-8?B?aFp0cytNRlJyMVY4akV4VDRPVGRwVDAxMitTRHlyVGFCV3NpSGtVRVBHeVZq?=
 =?utf-8?B?M2paNW9oWVdIWWQ2bVBJUURmSHNQOGtVVEZJT0dVbzhmeXZES0NMZDhYM3Nj?=
 =?utf-8?B?WXMzMUVBRVd3Vlg5dERFOUxJK0Jia2pEMUc2T21KSXJFclVlT05RcUg3Nml6?=
 =?utf-8?B?RkxRZzVHQnAyR05paUU2akpocEttY09nVEU5eXpjOE9Cc3ExemNQbG1QaC9J?=
 =?utf-8?B?M2lkVWc2RGUvNW4ybno2aVNrU1QvZXN6NEZ2VERob0JlNVdjNExzV05aOE4x?=
 =?utf-8?B?dzZpdXpTbWg1Q3JTNUxMV1ZnMkhEeVAxQVowMHJwQWdPS2h5aGNpQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc170b7b-f69e-4016-e9e9-08da456d73e3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 14:29:22.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HV3Jj1QKXEPS2ATT6qQ0mJzEiWPU6gTSxhRUx7FnKeGUwfk+UAF/829wyL6caPz0NlxsatpczIH8wSi3Z88YBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5400

On Fri, Jun 03, 2022 at 02:16:47PM +0200, Jan Beulich wrote:
> On 26.05.2022 13:11, Roger Pau Monne wrote:
> > Add support for enabling Bus Lock Detection on Intel systems.  Such
> > detection works by triggering a vmexit, which ought to be enough of a
> > pause to prevent a guest from abusing of the Bus Lock.
> > 
> > Add an extra Xen perf counter to track the number of Bus Locks detected.
> > This is done because Bus Locks can also be reported by setting the bit
> > 26 in the exit reason field, so also account for those.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> This implements just the VMexit part of the feature - maybe the
> title wants to reflect that? The vmx: tag could also mean there
> is exposure to guests included for the #DB part of the feature.

Maybe:

"x86/vmx: add Bus Lock detection to the hypervisor"

Thanks, Roger.

