Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F8E64B7A0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 15:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460682.718634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p56Ub-0006kH-6J; Tue, 13 Dec 2022 14:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460682.718634; Tue, 13 Dec 2022 14:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p56Ub-0006hI-2u; Tue, 13 Dec 2022 14:42:49 +0000
Received: by outflank-mailman (input) for mailman id 460682;
 Tue, 13 Dec 2022 14:42:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeL=4L=citrix.com=prvs=339e21e18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p56UZ-0006hC-HV
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 14:42:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66f100ed-7af4-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 15:42:45 +0100 (CET)
Received: from mail-dm6nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Dec 2022 09:42:35 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6337.namprd03.prod.outlook.com (2603:10b6:806:1b4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 14:42:32 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 14:42:31 +0000
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
X-Inumbo-ID: 66f100ed-7af4-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670942565;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nvSwYXry0UQz2Mwe2g7tvvMgpZI9euZyt//lEWwO0+8=;
  b=en2nx5PLSFP+JT+1N3oibPevj/LtkKZpa3FX5UdXpmu7xlwlurRe9/Kb
   aTC6+8cy8HUj8Q0Zj+8rlnq5SvjthtHEizhG/YGl8M1fA9BkOC4eCIpH2
   +Y+ErnYn/nU9owkvRcIn//rxTuAaJNb1fzeTc66OEjKKgGun5LGttN1cm
   8=;
X-IronPort-RemoteIP: 104.47.73.44
X-IronPort-MID: 90624858
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/7DNV6m/anrjVYsyTEwtL/fo5gxLJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNUW+BPa7YNmCjcot/bYzi9h5Sv8DSytM3SQttqi5kEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5QSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 flbCT81UyibvsOZ/o7mQcZjj894M8a+aevzulk4pd3YJdAPZMifBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1c3jOSF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eexX2hBNJPRNVU8NZJuBqq1GM5EidRD1uyhdLmmEHvRP52f
 hl8Fi0G6PJaGFaQZtrwQRy+5mKFtxg0WtxMHul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8PGSpDC7OykQJEcDYzMJSU0O5NyLiKMZgw/LT91jOLWoldCzEjb1q
 xiVqAAuirNVitQEv5hX5njCijOo45TMEAg8412LWnr/tl8lIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF4n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:MqWWP6jrAZ/rT2m66ljrFXeDP3BQXhIji2hC6mlwRA09TyX4rb
 HSoB1/73TJYVkqNk3I9ersBEDCexPhHOdOkO8s1O6ZLXDbUQiTTb2Kj7GSuQEIcheWnoRgPM
 FbAtND4bbLYmSS4/yX3OD2KadC/PC3tI2lgOfAw2x8JDsaDp2JiG9Ce36m++BNNW177N4CZf
 2hz9sCoza7Y3wYYua2FhA+Lor+m+E=
X-IronPort-AV: E=Sophos;i="5.96,241,1665460800"; 
   d="scan'208";a="90624858"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBATAZk8xyBn1zeocQdq+GMZpnSMDM3hsBZBTPV+uohPSUY52kLPkTsfF26YHOeqcrXurELeAav+wSuhbu7YB5y7ZaD9VBwx69Q4f6WHOfHlY7qfm41/JIx8JHevD5RNOUW25PrSEyQTCGxt7vnTpeSV4B3kLoQgmJzZov+UedsFUyB5qtHG+sZDIJzSzJe2frAFQuATSOHcU6qQtRI51P3RhyjQD/c+JA/WavudhuFYNdglQLdhLwAx0CCixlWidbjPmzHwX1w3wB/jy+q1xu+ucz7ylssa7e3L6rCwhK1mTzYhpcCkLm2w7bXpulc5czmW6s/vJTD52llpjfa18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wi1FT+R79LLj6/DKLBVwhCjfsJ2N7DoGX0am970KiKw=;
 b=ieHRbFkSTyb4JINmdgMud7/nCmaQ5TphDxcjB1l/TqGCW8zTaYrqGgjQzu7uJE/XKCnFYkP4xNLvAb49KHBJx1JZmQ3EDUadKGHvWbrRmNNzDOwoTXPsEwpzcKd/t0eyC5pNRjylni2NsAughArDOUa+lnv3PKA4s5Dc3vqocN/9CoPmzzqJmIPiL11mzWuBkD2GK7MD44SwEf8NfVmdOvCqz6iDx2yoWKWSjAzu5DvT0pFyqyNKKNulXLn7lwdudZaPCSWjlfQYafCCrDckjkkmNF8YFI9Dsnue5xrEAWW8EfHk1D3GaAoYnZK5Fnkw0BAUsyNtd32IvfKDTKuGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wi1FT+R79LLj6/DKLBVwhCjfsJ2N7DoGX0am970KiKw=;
 b=A5+6fMBB/f6QM0aS4pJbMWKk/RRyA3wBvfjl8B3+mImMNO/LIW/VWgl6WEBoEYS8/ACOl1Gu6l2K8dUbFTX25d6A/RBjO6GsrF+ZgMYaKkt+f07y7a6dV7ZgCCgSqeB8LTyzKP7AG026NrOEBR6dwCRIulycs1KW0jGLIvBZFts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Dec 2022 15:42:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"Beulich, Jan" <JBeulich@suse.com>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/3] x86/vmx: introduce helper to set
 VMX_INTR_SHADOW_NMI
Message-ID: <Y5iPUN7TmLCiKWng@MacBook-Air-de-Roger.local>
References: <20220701131648.34292-1-roger.pau@citrix.com>
 <20220701131648.34292-3-roger.pau@citrix.com>
 <BN9PR11MB52763434820370E44457745D8C8F9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52763434820370E44457745D8C8F9@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: LO2P123CA0026.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::14)
 To SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 8160eb0c-d0c4-4581-b1d1-08dadd1843c3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yYeQR3atrq8/0ATv7cpUoPl9Xhba8urCLEwmD0GxYNzjAvxELEr2gn7XKiqA+V13JYs+c1v8DxW1FOZQSzXjomAmPURm9QPpIkPSatOf6ATYcXBcHH39qKc0wxkmCISSSk85D77WjnhIMWV/sNEP8ckcySHXIYMAQdl4rhZgxyx6OvBoTasKFSf3levhPTti7IXfpWUVNOwAGKw+E2iQh4+rMLUyyuBPm/+BtUXNsrq7D/oLaZlcsEtEoPxYyJIf40zulFjeRLqiXT1k/Y5iaprgvHZuLbg3j11ftxkjxk7+Q6gpQ2dFHmjMg3FoobXjtqZw3O1SlZlkg5mOmLmWVPW56c6zARDsKvp3U0l6nCT4H03F/bxbXZYd1DtHnd0JKjQ06vAGEzk/wBZH2VIWgVB7/3TEoeBX51SPpNSmh9bcYJSUxu+0Otpqkco6ZGTgA+kZ/XJxOpYMsFZHFP/YGntNoUCevu+lb6qjWgJGhj4Jwc9eSiVEx4szZf0s/GDn2cJBT1fCf6BfJH/AD+NhnvKNIthL3606GHK+j+UhGP8a3p9C8r1oMc6tO1xVHK5OlH1UXUVqDkHSv4EFNGdxB5wW3bMkKnPAql/o8KMr0KpcmbhR1fpgSDG+rZCIjx2C/8d4m7WU5MYGJ/UX2jRhlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199015)(85182001)(41300700001)(8936002)(6666004)(478600001)(38100700002)(86362001)(6486002)(82960400001)(5660300002)(6916009)(4326008)(66946007)(316002)(66556008)(8676002)(186003)(6512007)(26005)(66476007)(6506007)(9686003)(83380400001)(54906003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjgrK0RWSW5mRW56TVppT1JQbytad0Z1bWJPdFFSeGFtRk1LbkJOd1Q2STVO?=
 =?utf-8?B?RnJuLzZ0N2hmNytBTzBPNHJKbElTb3dPMHJLeldZL3R2NTBTNkN4OE84aE5T?=
 =?utf-8?B?Wjd2MXVWeGRQaC9pZk5HbWJHd2lmVTlVdjg0OGcrRFRZTnBPNTk0aFBMK0d6?=
 =?utf-8?B?UjI3akxJWWUxUitoSnNGcUtoenhpZngwbkFsbnZJWmgwOFZkaHVzTTlDYnZu?=
 =?utf-8?B?ZVFBbU5LR3VIaFpFVitFOXpGTUFRbTkzVkVnWUFSRHR6WDZZU3BzcUZ5YVFC?=
 =?utf-8?B?WTFkSEN4R2NxNzBQbmtLT3RVckpicGRLRjFqdFhPZnZBYjRLVkZ0aWZNMnFT?=
 =?utf-8?B?eEdzdFNDb09VdTd4TVlSL0lYK0FjTjhad0twbkN5aWZyejdUUjNsMXJ2ZjlI?=
 =?utf-8?B?R21EdS81SFZwNzR4TTdlcmllSHNDTVhiUjVrbWMvaW1nR29YeExTaUN1ZGRk?=
 =?utf-8?B?ZzBqZVBKZ0NzbFJmbkVhNDJDZ0N0WDJ0aU1HODV1eUlBcWdhR2drQTFUR3Fy?=
 =?utf-8?B?ZTZGVjJqc2pvY21Pa2NQdVZ5RHBMLzRBZGVlTzBQQWQwcU9DWUNwQ3NJRncz?=
 =?utf-8?B?MFpKQ0hrRHh4bSt6ZlRCaUwrQll4VUlEeDgycEZpalFGcFFpdjNyTXBZNVJY?=
 =?utf-8?B?dEpQbFZtTHA0a0ZHbHlsMTg2UjNsdkFSTk1vTVp2ckNpNGVBTGNaR2lCTmZZ?=
 =?utf-8?B?a2trUlNzeGlYNjNyc2Qzd2tGM2NaRzBPRkIvZHVKVXQ0SC9Ya3dmVnhjNk9B?=
 =?utf-8?B?aVE0cldiUFZ4ZlhpWlNJSms0VmRhTDJWTXg4UHg4V0w1WTM0ZnppTCtOSXRH?=
 =?utf-8?B?NlBTREl4S0xUa2ZNSE5rbW5wQnc0UUMwQmZMZjZQdEhMT2FEWmlkdG1HMm5p?=
 =?utf-8?B?dkRHc2d2dWtXcE9UK3dUajFQYk84Y0RMb1BsSmxHd0F3RmljcHhyZ05URytQ?=
 =?utf-8?B?L0ViamcrSk5JamRDZ2lqVlhhVXA3OXRwMWR0OHlncU50VUZ1Qml0Y2VxbVZv?=
 =?utf-8?B?SFNQUXgzTmlYR3ROMWdiYXBlYm84L290NDRTUEdFdVJLWlYrUjgzb0JxTE9n?=
 =?utf-8?B?dllvTm1Edk1PbTNxdyttZi9ZSXFIRmJHQUVrM2N1bGY5b0lMRXk4M0U1dkR4?=
 =?utf-8?B?U0pYQVZOVFZieDR3Zzlib0M1QlEzM1AxVk1CWWdoYzBQM0ZpR1FjWlB0aG1i?=
 =?utf-8?B?QkhPcys4RjBMTlIyM2h6VmdJalBsOTNBOHlkakxWL0FoWmFGWjFxUHp1ajl6?=
 =?utf-8?B?RVlvem92LzFBSXdycktCWHVhWVFIclU5b2ZtZjNLM2Mzb2lGc3BKYjBORGFP?=
 =?utf-8?B?QVRWMXEzUnNEV0ZHR2xxRGhOZ3FUNEZTYzRWdVVscldxYnA0K2Q3WCttL1hq?=
 =?utf-8?B?SUl1QzlzZmp0bUpSRnJNS1RhNGxpUGxKWEVVRUFHcHNsdVZiNGYxU0Y1S0hR?=
 =?utf-8?B?a1pQMkxWcVEwcXR1R01jdFl0VWpDUmhNWkFGUWRIQUM1V3hQWDgrR29nUTlo?=
 =?utf-8?B?MmRLUDJxb3dpZEVDYXJJeTVTdjVjdWdrY3gzVk9QRHhqUmp3cG1MVk42bjBx?=
 =?utf-8?B?dy9oaVZDaE5iak5mbVp0VWxwcFh3SnVDOFd6L3NRQmVjQi9PT25DcnhmNzVx?=
 =?utf-8?B?SGJaNGVuRHN4Vis1VFBESitXYjFaa0hmZDRJL1RhMUx0aklrWUc5WGFkWXM4?=
 =?utf-8?B?c3pGVFFDc1VQbjJjOS9IVFpXQU5ieDRwa1UwVjU5aDVIdmFUOG9kZFhBMEZP?=
 =?utf-8?B?T09kTlBEQTEwamF5eHlIVU9SUDNubk54VEFnblZTcjBxLzRidi9HUmFKNXFz?=
 =?utf-8?B?UGp0YWJjdW5BMXRNL2VrRnFlWVBybUt0dEtlcFAxSW45aUNWbnFURjlUNkVl?=
 =?utf-8?B?ZHI0b3BTWGZ2b2ZrdmU3RlJYUlZnVXk0ZHY0MWd2ZHJKMXZlb3ZPVk1hbytW?=
 =?utf-8?B?WXRpbjJkaEVHbU9lOVRqTzVGY2dnUkJUdEJBS0w1ZHhUSGlTcG9mckYyWXR2?=
 =?utf-8?B?YzEyVnVlSkdBYzNpYmhZb1ZjaCswYzdFdEIxZ2hYZmpWY01jbXpOb1d2WjUv?=
 =?utf-8?B?cWVLSk83bWswellISU5qb2ZDNXRjSi9PWDJoQTYwOFhyYlJKMDNzSURQdEVp?=
 =?utf-8?Q?Ehqjey1IDnh8dzb0c94AWhL/w?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8160eb0c-d0c4-4581-b1d1-08dadd1843c3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 14:42:31.6729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEBH1lsDZ4jEdQqeNeiiPEkyguh1R5pgTRslF9aNRfEbTNkr6KhZGJUTk1BF8bkSglN8AOrryYTMslsmgLwPjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6337

On Tue, Jul 19, 2022 at 07:33:47AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Friday, July 1, 2022 9:17 PM
> > 
> > @@ -225,6 +225,9 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
> > 
> >  /*
> >   * Interruption-information format
> > + *
> > + * Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit
> > Qualification
> > + * field under some circumstances.
> >   */
> >  #define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
> >  #define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
> 
> Overall this is good. But I wonder whether the readability is slightly better
> by defining a dedicate flag bit for exit qualification with a clear comment
> on which events it makes sense to...

I've expanded the comment to:

"Note INTR_INFO_NMI_UNBLOCKED_BY_IRET is also used with Exit Qualification
field for EPT violations, PML full and SPP-related event vmexits."

I leave the creation of the specific flag to a separate commit, to not
block the series on that.

Thanks, Roger.

