Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D002341DD0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 14:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99240.188573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNEuh-0006OS-DM; Fri, 19 Mar 2021 13:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99240.188573; Fri, 19 Mar 2021 13:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNEuh-0006O5-AO; Fri, 19 Mar 2021 13:11:39 +0000
Received: by outflank-mailman (input) for mailman id 99240;
 Fri, 19 Mar 2021 13:11:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0Gn=IR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lNEuf-0006O0-OZ
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:11:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2969e72-26a4-494a-a1d5-ea8b4ce39c90;
 Fri, 19 Mar 2021 13:11:36 +0000 (UTC)
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
X-Inumbo-ID: b2969e72-26a4-494a-a1d5-ea8b4ce39c90
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616159496;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x9xzZdNEeMItWFRkbLmUULYsVemJFeq/wyAB1bQxplo=;
  b=FIkdQyOOW1RpgLndD58jHQsCBE8+zS64YcHF5MlqZBTw74ocFG7Krgd8
   1v8Ti9XtJHPhcfZLY6Odeyq1UKU9eNhnK03ejTSRvC1FC0PczsX/TaiWk
   p88fuKPksvnOqcEnlCmRDa9GCRVIgFEpc2x0AYSStmBitMOdB0sS3E1fg
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MrEMg0GOTf7pGvt5JzjoznEDeOFcIHheHcLas2l3Md0DDioUZc5VfxUCEE5veFy/Ykhsznjtyd
 ScvgaocgvlL6YOOYoBj/Tu646y1NwVb9LqYQ4RAXQEf+Z2Sr/5R/sNkIoZswq5zDfAZVia3/a6
 VMxRDGR9CDznHiZw/xn4BrWWU4HyFJjKPHXhXrHKhcnPzbieS43nYFjjo/CmtGVEklPSjj0G3d
 xFAyVy7wSQpBSO7RIy3Mq493tCoo1bITpun9RgDIAdHZMW/8/KnK0eqPmV4SQXePdvVoJ3SS4Q
 uqs=
X-SBRS: 5.2
X-MesageID: 40049230
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DwYNcKiDe/z3+Iq1JOG6WSaSNXBQXwh13DAbvn1ZSRFFG/Gwv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdy4N5B9efdSPhv3alK5wn0Jv6z1TbaknD38N+9Y
 MlSahxD9XsEUN35PyR3CCUG8stqePpzImGnuHbpk0CcShPS4VNqzh0ERyaFEoefngiObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPDSIuPBI79BKIyQqh9b+SKXOl9y0DWDBCy6pKyx
 mmryXF4MyY0s2T+1vn+EL4q79Xn9bgzdUrPr3wtuElbg/CpyztSIBoW7iptC04rue1+D8R4a
 XxiiZlBetfwTf8eXy0vAvM1mDboUkTwk6n83C0qz/CptH0Xz0zAcYpv/MmTjLpr3AOkfs59Y
 Aj5RP/i7NnSSnusQ642v3zEzZtrUawqWpKq59ps1VvFbEwRZUUkZYS5ypuYfE9NRO/0q8LOs
 90AvrR4f5HGGnqFUzxjy1UzNugUm9bJGb+fmEy/sic0z1hlHtk1UcvxMsGgnca9J4mIqM0n9
 j5Dg==
X-IronPort-AV: E=Sophos;i="5.81,261,1610427600"; 
   d="scan'208";a="40049230"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vy49PQcXlplBqhc+qBHIwlcuZ0CJLLS5NW5YxDfu3QbfiZzgPyeSS6B+Thr6joehFuffjKWqbHpPwrR8IibRJfTIpzAW7Q4CrKdncsEAFbAAUs3euJbs4ohri4hBTuoSTDVX72frhXU/tzkhehyKG6IPVDSUHea0jRSpNCVgl8Lv2TwFbUNibhIhgYOP27hNcQP8zVk2yFr13PT0aXMA1KLy7f8ZWfTTcnuq4cUglAi3yJWSy8OdCsqP/O3JEtCIFU8Wn7udtskZbMVNW/y6PTmXsIU5GU9z5fpcKuftnXv+oDyR97lUEOiqi7i1AhbxRsUO1qkz4eMWIL2VncvH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jM8qdwwfFOCDRt77RJ+JAWvBOuX8McM9bLag1QMCR4=;
 b=GbITMBmap9IB46VPPX6T/nTXHt6n6hjZLZh+KJRgdQl9kExNxkaassviP4aHJAs2Z+35KL4J1Myy2dEadj6+/WgQxauQ/qgOIj5poem5PL4x2Afjfn480nCOFL2ven0acBwtu0Chhc0yqHyMtHmkdaxsQp8fYXM1LSUSfyoWaP46CYoqBnuieejaXY3cgIlHt8kR2LaFVO7b1m6Fn2Us/sGdxngrH/+JnR9kX3edV/Sh5JN/anyUJAPI7J+k7cTKAJ/5UTTWcnrV3byMrB1bAUoowlgKmkL+Vlkd2VNPYVZRLmYVFhR7UdXncNJqYrp/gtGSjhmIDJ+KFbdIEdWcZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jM8qdwwfFOCDRt77RJ+JAWvBOuX8McM9bLag1QMCR4=;
 b=SiQ+Cn3jsl9P+0+Tp2A0Sz4GtiAnJlBwhuXbEZ/uGY0jJ9mQSMzMP4iTy3ujw9sLoPlb3itBfmoHY6yW1mGbMMqi/AeBBqxfLKxXidJLL984CPejLUgyYyyyX+RS+sVz8aD814KnEBATj27OdONJZaq04LPidz07JM937CEI3tI=
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
 <24658.1583.601613.903527@mariner.uk.xensource.com>
 <6eb6f686-d67e-6db3-6b4b-8c63e676e311@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cb123428-4840-ff21-9c3b-5b3a2f107b0f@citrix.com>
Date: Fri, 19 Mar 2021 13:11:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <6eb6f686-d67e-6db3-6b4b-8c63e676e311@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0307.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::6) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d6477d-7cb2-4758-c8ed-08d8ead8841f
X-MS-TrafficTypeDiagnostic: BN7PR03MB4386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB4386963E67F27841A93E1A5CBA689@BN7PR03MB4386.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wXT087dQMUCHb5kkCsZzALbT/7B77+TkeWFzDBvO8lOlGzNxoPD+FeMi8vOXqA/oQFyps9uGdSbDeSh9GGPfGcfwM7wHuxQpdZngYWBDuyTsqKaYPLlX6//Q/Av31clIPLiJLLmi/IwgGZlkcl60tXkul3ATmSatLppYJZhW0ag3ii3oFPSJID+pRh/x7yBlp1ISbsDZg6uN7BS0FDv0kn+pkejdFciB5d/TUdySuwJsPVAC16D1bnlwHsD+YYg7yjY/on2OnYdH7FCw5XYSDSLcJdHnULNHnhG+vc6GlUnhyf/4+tKog1L88Dz2yb4tlWaAFg9Az/KbTqC218sylJPl9c8o1HXJKT2bW/JPRKJXuru1PN1edH+BVNEhvVnsh5v9wTM/gWmggsp0frCcSd/C9X7xr9vC53GxXTXeF1NShpb8feMZIPN7W2MVLZ1elJvg+S6iihJC2LRt7psqxlo7HQCPmqlV9ZkSSvcbStMd3m/orkvxOjmpxU4SC3NDs8so4CX32Zb37Bpcs1OOGkx2pjVG+9EzFbrLb1Yf9GFHWaZv/c6SIsAXLjmBH16jXGjVpROx1EdFH8iEV4zonrk7kQ7FJhxrCswYVMbWIp1evJT7rcjo36tcvxukP7KAK3iiWHhBeWc+JOqVeptDmVHHeoZIurywoTPyIzuWNo7U+y6KTCklJUeC0tAtAs/O7viOK/X1vFhwoR2xpg2yWDjwnrOGDuuM2kA9rrKg77M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(186003)(956004)(16526019)(2616005)(66946007)(16576012)(83380400001)(66556008)(38100700001)(53546011)(316002)(2906002)(5660300002)(107886003)(31696002)(86362001)(8936002)(31686004)(6666004)(110136005)(478600001)(54906003)(8676002)(36756003)(26005)(4326008)(66476007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1kwVjh0NEw4SDRVWWNJOWU3UFlGKzArRXFyUm1qNjJ2UWZlVm5QU3V6TkxH?=
 =?utf-8?B?QUFHdUpkZ1Zocmdxa2owV28rcnhqaW15ME5nTWI4UkJGUll2Vlo0d2JYOEVE?=
 =?utf-8?B?bG5pUTNaRldpVXVCYUd3OUJFNGRzSGNKbTh0Q3puVE1udEVCekZGQmt3cldJ?=
 =?utf-8?B?MVkzeHJZUVA3UnlyeXZGSTJudW1Udms4Wk1KeUR6aGpjWEt1VUpYNWh4NjVh?=
 =?utf-8?B?cjNCSVAyL3JmcHdWYmI1WnJnaEZrTXpmWVl0a1R5SHM5amZEQW1ZU0FIYjNR?=
 =?utf-8?B?c29NMUs1YVlhK2xPcWJKczgrTTZJNms2K2NzbjAxeW1oaEN4Q2hpVEZKUTdD?=
 =?utf-8?B?WFNLVmJORnArZHo2Z1U2TldZL0RqOWJ0cmNXY3JEUDEyeERnVnNERHlCMFhv?=
 =?utf-8?B?M2twclU2TGNuejlaamM0RGJNaldIUWdhb2huVm15TldnZ2tTRFhPak96WVZI?=
 =?utf-8?B?c1FxOXliTk1lZ2h4WWJUSzFPaVh3R21pZGtseG5ObHhrOWxRb2NRSyt0Mndz?=
 =?utf-8?B?OW1GUTBUcUF2Lzc0QUgzWStCNW1nRFVGalE5UXl3UTVNZ1Z1aEI4VGVZOUpY?=
 =?utf-8?B?elRMc0FSK0I2dGJ1cGJETHhIaE1YejhoQXlyOVNtZU5GbXU1TmM4REpzbnBS?=
 =?utf-8?B?NVc1b2JHTW9QSUJqMnA5ZlArdTB4dURFVkVnUkxyR1RPTDF3empIK2JqczBl?=
 =?utf-8?B?NlpBd01qR1NxSEEwTExJMkplOHgxRmVxNTh0NjZ2NkpCVk1mSDgxdGZFZWU4?=
 =?utf-8?B?a1h0SmFoMHhaTmVrUHBaVnJEdUFVYlhycnBqc09wR2d4V2ZNenFZbFBoYzY5?=
 =?utf-8?B?UUZDRmNPY054c3ZUc3dESVVNZzNGdjl0T3d0dGFha2V0TVh3NHFXald1VEhI?=
 =?utf-8?B?KzR6cWwvcHRRbW1YL2kwQm00VnJVSnpMSWZWWHdPcGptY1djcXErYXl4KzZz?=
 =?utf-8?B?eE12OXRuQ2dQSzdUbzlUOFQ3cDBuVU5HYzFRRmVPRGw2RklzSnlRaTh6MGNi?=
 =?utf-8?B?ejBMK0N1NzZmT0xucHZmaG9mbUFDUXBiQjl0VHVQN2NxelFFMVBtbFRFK0tj?=
 =?utf-8?B?RXpPYi9pOGE4WVFJL1U5RFAxNUcwdi9rTGZWMUtBMy9sOHh6UElNS2Rta3Ex?=
 =?utf-8?B?RGVzN3VRZm1ySmJnZUV0dUlGcmNBOEZhakRzc3pIQWFveDlOT01vRzgza3FQ?=
 =?utf-8?B?eUhaak5FeURkY0phS0JFVm1uMUI0RHZMRnZpTkFld1hKeGt0MVpaSVV4V2xi?=
 =?utf-8?B?U00xWmhSYmtpL2xkVnc5TXFiVXdnNjdjR1pYWC9tUFQ4c0gzb1ZjTGtlemJU?=
 =?utf-8?B?N1RtZjcrVDB6RVBJL1N3dCtGZExraTAwNDNqNnB2OWpCcjROMVlxNVozN1V3?=
 =?utf-8?B?bWNHUHJrTHhkNEJFTSs2czVNbjZMT2YzeGZPVTJzcTJjb1hCamFWcU4yR08z?=
 =?utf-8?B?MkNtblBDeW9iZ3ZZTEplYXpJQjBiNU1ZWmVHRFZZaTlFNjdjNUtPNjZpaTV0?=
 =?utf-8?B?ak9rZGRGZ0Iwd0d1ZkVmdVp4WDY4TzN6M0c4NlpRcXBkWHVjSUg2Q3Jmcmh5?=
 =?utf-8?B?YjM5OTl5WTVERExkUlVhaE9lWEdmN2YyWXNvMFNLUGk2Mi9kcEtuMXJPekh6?=
 =?utf-8?B?di95UjlUVzBBYy9EYW9uUWIvQnpmVklaeG5rakdmRDl6SXNDd0l4RHo0dUlB?=
 =?utf-8?B?UHdENE1qM1IvTTFSSkExYzVaT1AzMFRJNWY5b2c2ME9aV2tOcUpmRDk4RXZn?=
 =?utf-8?Q?Vre+CWMXP3NSpxtExkUCVnik4qY6MgpAYuiErFv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d6477d-7cb2-4758-c8ed-08d8ead8841f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 13:11:32.5075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgCIoPlXPVxZuvpweyK8kUAUYzFskTWkzReTKNkHiS0TncpKNxxheLvGkSLDMix1yj08nwNomm9T5ZZcbpUmVe+TKh05Ap23rSQaVDvq+pI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4386
X-OriginatorOrg: citrix.com

On 18/03/2021 09:35, Jan Beulich wrote:
> On 17.03.2021 14:37, Ian Jackson wrote:
>> I have read this thread and with my release manager hat on I feel
>> confused and/or ignorant.
>>
>> Patch 3/ has a good explanation of what the problem is it is
>> addressing and why this is important for 4.15.  But then there is
>> Jan's most recent reply starting "I find all of this confusing".  Jan,
>> can you please tell me in words of one syllable what the implication
>> of that message is ?  In particular is any of what you say a reason
>> for me to withhold my release-ack ?
> Answering the last question first - I don't think so. Something may
> indeed want doing here beyond what we already have, and it may well
> be precisely what Andrew is proposing, possibly just with extended
> descriptions and/or comments. My confusion about patch 3 is that it
> (a) claims behavior in turbostat that I can't locate and (b) implies
> (describes) behavior of code that I find entirely unexpected (as in:
> not making sense to me).

Turbostat was discussed on the LKML thread where KVM fixed the same bug,
IIRC, but I'm struggling to find the reference.

~Andrew

