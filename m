Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26758341DFD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 14:20:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99244.188586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNF2f-0006iY-9S; Fri, 19 Mar 2021 13:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99244.188586; Fri, 19 Mar 2021 13:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNF2f-0006i9-60; Fri, 19 Mar 2021 13:19:53 +0000
Received: by outflank-mailman (input) for mailman id 99244;
 Fri, 19 Mar 2021 13:19:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0Gn=IR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lNF2e-0006i2-7f
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:19:52 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5eb267a-dd63-43a8-9215-d59a63c1594f;
 Fri, 19 Mar 2021 13:19:50 +0000 (UTC)
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
X-Inumbo-ID: f5eb267a-dd63-43a8-9215-d59a63c1594f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616159990;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0NcWoEzdbXhmf/cdxX1hw5z8CvUJ1kuG0SVKrxwSwAs=;
  b=cuAxaMJM1sP7yrKnSJSlG+3mII7ImAaO3oYeaL3iVTF+zcXkTc9w7K7I
   WMXaIpRAsoKSjPz5vw1AmJ43U9qHPo9CsQe+uJi4aY12r9VS4wi73UthB
   lbtaBcfIYcKt5V/Fb242Z/5j6YFgrITzQLK8/huRAg0eJnT1ZxWKczRzm
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SitBBHG6+155rW5S1rP+5eKp+FR2hVL7UL+5Kdx2ReUUUE3jEUe1cL1k8my2CfYPzb0cvf6rgY
 /wz5c4PVpCzHyCydjTQ7X/LLvb07DKllV7MRukuBZQz8/FdKnH96WWKi72Jk+SCbRgvwYSwYrm
 05qR8YSQuDcKM1jS7hvii3oC+L0//wLpZG+9iEArFhhhUSrU9bygda9/1DTQ4+ozpEazC44Pxp
 uunDYEqle4B9Pj0wHcqhO0+KY5GnQHX7AK+IcU2E/m17Jcsl7sr1U2QAqaPR+OUdcST7WQjxdG
 w1s=
X-SBRS: 5.2
X-MesageID: 39572767
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:te7oIKEsvPblY6rCpLqECseALOonbusQ8zAX/mp2TgFYddHdqt
 unm+4V2QSxpDEaXnwhnt7oAtjjfVr385lp7Y4NeYqzRQWOghrKEKhO5ZbvqgeNJwTQ7ehYvJ
 0OT4FbKPndSWd3ltz75g7QKadF/PCi/LqzjenTi1dBJDsFV4ha4w10ChmWHyRNLWEsb/cEPa
 GR+9ZdoH6YcWkXB/7LY0UtZfTJpNHAifvdASIuOhhP0mizpALtwpH7FgWVxVM6VTVXqI1Sll
 T4rw==
X-IronPort-AV: E=Sophos;i="5.81,261,1610427600"; 
   d="scan'208";a="39572767"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKYcTY3y6eZ3DaXkF7/OPvwCenDraTuPr+P4ds2At4Pe9A37o/OPP4FlHuHLWLlVEjaNmFrL1SVByzuhuEEaWySG4vRcFAAevkr+TTbaXVOV25tFVxGxSP2e0JNxXRvrxKvxbhQyCqxnS1f7sekn/5cLr3uneXVxc7NIERaF5AVq/bkQHNOg8bCFxikxC6MzHcwgcW43VXBiKFT8OVEnyZvVwV8cHwMTM57RBD6kXRVCmGxnRadcI/Gkm6BPPhkWTCqWZ1OREn831dMXkFnwEZy3EAnrah8fHVo84LVi09iDKUFlY1XmNfYgQsKnSOVl1cz1exLu/lJwQTs7vs0X/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5bDv9kfZkr+AU1/mzly39sY+NHjKP0bnPnEXb8xafA=;
 b=J01fgCgsa3WVud/vbQTfMWkAgD1d/v6ZB5/1Ss+zBDc/x2ko2Zg6X0M8ibJNDk0BzMzvwYFySVO1s7jQsJztgDutOYn0E2sZYpX+SKDYrrTZ7WNw9K0wycUPQSjhJ8eXn8cPAsn1XM49IWivm6B+Bk3KL0tmSawlsmBSFIh9zLODpkEdJsQgWwG4esg/JE2d39elgYbqTtCy5qFWmK+pZWf2MlJTJf5KIdcssIh1OiRfkYfrgps5CXtSGg3wubz2FjqQTZ3Upi0scnj6c0xNQrG/VGmbwuvpK6X+9WqUbZyLtXqAc7LD93hYYBd0K9YIkPeJyLElsLBRKrW3ynT/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5bDv9kfZkr+AU1/mzly39sY+NHjKP0bnPnEXb8xafA=;
 b=b3UdXkdAqbd5PC1o+KfLPrSYxOtZhEX/GD4LnpuBbkLrcY0aAhipKk7BL5BnloFSWsWg51lbX+oBR/KOOSmAe7+nVhD8EdDG6H8Ol7nP3ZvCsPyx/uF2LnuaTMdqRPYEBGjs1nLMnjLjwQaI86KgMRYDANGOE9wkyCfC5ABxap0=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-3-andrew.cooper3@citrix.com>
 <YFHDPISXNv6mnl+2@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/msr: Forward port XSA-351 changes from 4.14
Message-ID: <35b5b492-23f3-12d0-e7b5-363f23a52ccc@citrix.com>
Date: Fri, 19 Mar 2021 13:19:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <YFHDPISXNv6mnl+2@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::31) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9176e4e-c42f-47fb-2847-08d8ead9aaca
X-MS-TrafficTypeDiagnostic: BN3PR03MB2369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB236944E5C27CDB4636314D89BA689@BN3PR03MB2369.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUh8elPY+CF6sGanRvPDVydXVjEor8iAutH7s/OkjeZ04YNjr/9xaPbR4l2pgXHZRjffC0EArtZ7XnCHiywYoJwT9FWJoDcz2YmgwP7iHuzU0TfwWxGhigNKu5b3HRBwPKeIvBihKlrr2ABSyEyL8hG9nw9KfnttnxNWW4gsxPIIOCZh0Szg+AksMx+wC7+jsYVilQ/EzgJ8HnTxI3G/PANzRomMdOXV8wKQ3zTxw9dIyiIipdf4oUMHdbfuNQ7JthKN1w8O6obKi7nekYEgXsAgvS2Fbxws1Lk5A8WDYtyX9UFbFynynUuRn0TnlrP0fSIPYnGbt/aHLYEFsbVB7x70dG855lYZv7BhPPOidLiQ7Eogi6IM+bh1VgRS+qzdtzNBuLNoCWNl3oMFrjzei+m32nn35r27hexx3AErutnGf+GPSBCNyPvWr/WFELvFxaf/KW9ZcsH9nR781n/eWiNm+0FjVilw+DRvZQRVgC1wgLItuMgvEi/p7w29TItOB0FHyyM9obWveY0KFX8q2uBTgZtIpKYT3K/K2PyHDo6KrDSIRzLdapvNDeNB/QswPW3rPeN/HxR3hHUzGsOzHWzFlucBW0GhORA3YGMRDUzDUuNRm3xDxcKXTjAttSG+XmPCBp7e0DINOfz3vO6vxBBvU2RODfcrxKSnMxR1RV+kiJx57t5nIHzuynfNiEZg2cLObl35EmxpcFR5tm5oocK/Sx/rINoFzC3uujcv3NU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(38100700001)(66946007)(66476007)(66556008)(31696002)(5660300002)(53546011)(86362001)(6486002)(2906002)(6666004)(316002)(16576012)(478600001)(37006003)(54906003)(4326008)(26005)(8676002)(16526019)(186003)(36756003)(6636002)(31686004)(8936002)(6862004)(956004)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z1FJYURlMGtBODBrQ0VKWjBGdm5XNFI5dFYxWFYyS2oxcjcwU0wxeW10Q0Nl?=
 =?utf-8?B?NG9DTFpSSDhRMHpIR3NzNjU5UEFxV3g3cXBnSVpia1ZzRGM0VXlBNzlvZk9I?=
 =?utf-8?B?WVV1dTFaYjBMYzNNZ3dxRUtwT2F0TFRiSlhSdmU3TUlpUFgxYm96Q3pHemtN?=
 =?utf-8?B?N3ZJekRyWUFDWHBHUk5VRWZUNE1vZ09GK3JNL1hrUGVYWEM4WWdOcE9TZXJ0?=
 =?utf-8?B?bmQrMXV6YWJDWVZ2UC9naENveDU2QkdoZnpMN1REdzYwQWNqdGxxSHpSUkpK?=
 =?utf-8?B?ZmVvRjVrRDJjbW1BTWJ5cjY1L0FCMjE3YWovOFE1RFFYSUNCbnFUdUNXWUNt?=
 =?utf-8?B?d0FzVytoVGxGTEd0M1NkV3BOT2QwNDlqVXNTeDFPdWp2bmRvZ1VoY240VlVV?=
 =?utf-8?B?RGY5aGlTSHJiWEZBS2FsSE1jaDdSUjBSWnlqbVY3bE4rSmg5QU1Jdlg5aFJT?=
 =?utf-8?B?OXdqMXdWUzc5V1V2YlJYU1hEaHgzUnBNdm5uWllKT0JpRXV5WWZNZVZNTFNJ?=
 =?utf-8?B?RmJQa2NrNWkyVlpmcFZ3SXpNV1JFQmhvS05MOHBpY2lYQTZQYVAvRVBFYVhO?=
 =?utf-8?B?RUd2SnR3RXBmOGZRb05FZVRvd2krb0ZDN3YxTTJ1UWtub0pvejloNVZOMS9q?=
 =?utf-8?B?RE5Yd1dTUEIvUUllcVhvaW4zVnNEMmN4NlNxWlZLUGMyRERCOWsxeGV2eUcv?=
 =?utf-8?B?eHpnOUdPUWRUNklQSVZ5YVN2TmJITGVRaE45SkxWdDhtcURUdXdQNVBjbzZ2?=
 =?utf-8?B?SUoweTIvZEtFYlZLVWhTQXRUejR2a3QzV2VMRGFKRUxYSjFvR1pmZXpLc0di?=
 =?utf-8?B?bE1HbkovTi9qeFhhSjh0ODcweUoxKzFnWHFjc0s0RXppTTBjWEg3b2w5TzNj?=
 =?utf-8?B?SU0ybDViN0lLU3JvUlFRTms5QkVhMzZDMGJMMHMrZ05iTithUWxXM2h0dm5q?=
 =?utf-8?B?NHBONzNrN1lYY1N5UW9oVnVGU0EwU3duL2w4ZDk0eXM0NnQ5aHVoNE1iN2J4?=
 =?utf-8?B?ajBGeHA2b2lxVndwRUNYWUIxanB3UjJXSzh3WkVEVm9UNkdYdWZxWnU1Ly9L?=
 =?utf-8?B?czdhYTk4WVZKMnFVa2VSZ3h6N0tQR1pMbGhwYmF2bEdIRTJqaWd4Rmp4WDJM?=
 =?utf-8?B?d0E2My9vTmhWcU5LemdGem92bStSby9CM1hvU2F3M3ZJckNkTFZ0TjFGZmhY?=
 =?utf-8?B?MGZOMnpkS3pxVWtNL0NTWnFBaXAyd3dLT1hBaTNuZ1ZCSWFlb01IK01Fd2RS?=
 =?utf-8?B?aEZlMXovTEIvYnhpYWlqK0N4eWlVc3hYSnRhMUwyRWlrZ2Y3aVRET09FZU5R?=
 =?utf-8?B?YXBsWEF1ZWcyallERThuSVVqRkdaNnpVWDFDZlBER1ZuelFOUXYyMi9Gc2pa?=
 =?utf-8?B?MmZIZGc2VytjYWJjODYwTHpLbEtucjVRek5IQ3RydWJpbFp2SW05M0RiSVRK?=
 =?utf-8?B?eVUxbE5hcXFjVEFEd1c0TVBKNFFsL3pZa3QxT01OcGFDZmhWa0o5cFVEOXJI?=
 =?utf-8?B?eUp3RmRGMXRUZStpcUl4ZzhoT1FFWmpkZ3Y4aENadlB3UDQyU2JIcE16dUx0?=
 =?utf-8?B?MVlhRld6R0pVZWY2YkVYcklObXZJamhhZEo0b0JweVkvcGx6Umkxb0Fvb1Ft?=
 =?utf-8?B?blFhcjR1Nis1YUlHZ1dmYnpPenhpeElPY0NBeDQxS1VZeDJFUTFFRmJXcTd1?=
 =?utf-8?B?Z0h5bFY2UXY2YjlwOEVIMTQvcmFna2tONWJSeHJkM1NOSS9pNmdCVWpiOGRy?=
 =?utf-8?Q?PyK1dJZEaZfXNJImhsWUHCLsIO/f9KO5c9c0/J2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9176e4e-c42f-47fb-2847-08d8ead9aaca
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 13:19:46.9961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mq1QVt1u5kWBtsDMQgDWjbhDILCVCzVPbQdj8RaUELPCaGuTeRTgpR6EJAcpv90Pu8DUEWrO3LOrHjmhEk40WK8EtXoM5ub676RRxKI7OyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2369
X-OriginatorOrg: citrix.com

On 17/03/2021 08:52, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 16, 2021 at 04:18:43PM +0000, Andrew Cooper wrote:
>> staging was not impacted by XSA-351 at the time of release, due to c/s
>> 322ec7c89f and 84e848fd7a which disallows read access by default.
>>
>> Forward port the XSA-351 changes to make the code structure consistent b=
etween
>> 4.14 and 4.15.
>>
>> This removes logspew for guests probing for the RAPL interface.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> CC: Ian Jackson <iwj@xenproject.org>
>>
>> Technically this breaks Solaris/turbostat insofar as you can no longer u=
se
>> msr_relaxed to "fix" the guest.  The subsequent patch will unbreak it
>> differently.
>>
>> For 4.15.  Restoring behaviour closer to 4.14, and prereq for a bugfix n=
eeding
>> backporting.
>> ---
>>  xen/arch/x86/msr.c              | 19 +++++++++++++++++++
>>  xen/include/asm-x86/msr-index.h | 39 ++++++++++++++++++++++++++++++++++=
+++++
>>  2 files changed, 58 insertions(+)
>>
>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>> index c3a988bd11..5927b6811b 100644
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -188,6 +188,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint6=
4_t *val)
>>      case MSR_TSX_CTRL:
>>      case MSR_MCU_OPT_CTRL:
>>      case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
>> +    case MSR_RAPL_POWER_UNIT:
>> +    case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
>> +    case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
>> +    case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
>> +    case MSR_PP1_POWER_LIMIT  ... MSR_PP1_POLICY:
>> +    case MSR_PLATFORM_ENERGY_COUNTER:
>> +    case MSR_PLATFORM_POWER_LIMIT:
>>      case MSR_U_CET:
>>      case MSR_S_CET:
>>      case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
>> @@ -195,6 +202,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64=
_t *val)
>>      case MSR_AMD64_LWP_CBADDR:
>>      case MSR_PPIN_CTL:
>>      case MSR_PPIN:
>> +    case MSR_F15H_CU_POWER ... MSR_F15H_CU_MAX_POWER:
>> +    case MSR_AMD_RAPL_POWER_UNIT ... MSR_AMD_PKG_ENERGY_STATUS:
>>      case MSR_AMD_PPIN_CTL:
>>      case MSR_AMD_PPIN:
>>          goto gp_fault;
>> @@ -412,6 +421,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64=
_t val)
>>      case MSR_INTEL_CORE_THREAD_COUNT:
>>      case MSR_INTEL_PLATFORM_INFO:
>>      case MSR_ARCH_CAPABILITIES:
>> +    case MSR_IA32_PERF_STATUS:
> Should the MSR_IA32_PERF_STATUS addition maybe be part of the previous
> commit, as it's not related to the XSA-351 content?

It is XSA-351.=C2=A0 We sent out two patches in the end.

c/s 3059178798a (the PERF_STATUS/CTL fix in 4.15) was backported to 4.14
as one half of XSA-351, and gained the above hunk because it went
backwards over the #GP-default change.

In light of patch 1, it now needs reintroducing.

It doesn't really matter if this hunk is in patch 1 or 2, but it needs
to be present, and fits better here IMO.

>
> The rest LGTM:
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> I wonder whether we could squash this with 3/3 for staging commit, and
> then only backport 3/3 for older branches. But it's likely too much
> work just to prevent breaking msr_relaxed for Solaris for a single
> commit time span.

I did consider the bisectability, but the reality is that it has only
been a week or so with msr_relaxed working at all.

Splitting them apart is simpler to review.

~Andrew


