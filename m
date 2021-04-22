Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B653682D9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115572.220542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZalJ-0006Y7-RI; Thu, 22 Apr 2021 14:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115572.220542; Thu, 22 Apr 2021 14:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZalJ-0006Xi-O1; Thu, 22 Apr 2021 14:57:01 +0000
Received: by outflank-mailman (input) for mailman id 115572;
 Thu, 22 Apr 2021 14:57:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZalI-0006Xb-T6
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:57:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72d60992-0aa8-4f55-b939-c82347c7bfbd;
 Thu, 22 Apr 2021 14:56:59 +0000 (UTC)
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
X-Inumbo-ID: 72d60992-0aa8-4f55-b939-c82347c7bfbd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619103419;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/TtcPr1q7OgogiwNd9oYjW0Oms0v//WRtnl9UDXq2Lg=;
  b=GOm9D+qBQCz9jnDzSC1ZDM8qIOC9WqDI//ddpmK6Ir3bgR3eIv/5Kkpi
   P33xAAJ8VqAD20IMHcwU4UlAtP0AztK0Op2XQ9smJfuau0dIWdkxfL3y1
   YOIpLWKBBFxzgWCI0cI36C8EhUW+YgecnIS1PzCZXmU3r/1b+WogOz4vK
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 34x5A2WcSaFLPQHoUtPeg9nY7M0CYC+Hpqq4qx0IrnSA2hGOIKx0wIZybVIiEYOwY5bPUxClL3
 WqZwO3NvDEvq/z6BNww9RpBuAzNUmKOGitAosjHzgImWtYyG/OCXeV5rSmZL3khpP0nmex7ZNj
 jj8ELO2BqoPkPVRSxRCwV3Fv3qxH+DXzYTwQx3hhbAPYKfV33wL21ZuA44u4aRqgUjRlCdALy2
 /dagAvx6t3PwESXRRumwylzMBKXcDLV0tXlcV6dStKHSXuwPAx5bXSnjCf8xEFcSj7mT/dkb5j
 OoU=
X-SBRS: 5.2
X-MesageID: 42190155
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:E4jUya/RaNm1NTT9jqNuk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="42190155"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNr9u6RcDFrMhg7DMAxmZTrYD8j1eEBD10zQScLxzoyjljAZsjb+MPWh45652gD1JDqC5Zc3a95eed0Iz3ZGJMroGZ/8Eu0Z2my6fiMyDUHlK6zX2fcJ6zS5n9eVaNAGG6+cjKLY2+DLgrjg1OmdGXV9zZieYCBdu9ktlG9lFX6N9oZChsUGHRb5OncHNyC85d2E/TpFpcuAS480hTxuLLpP886XwHgEgrAdzL8bUNaNE31kh4Ya43oqFtlhFP80fbl52dAY+1LG8Fu1H1fv0qlD12fBYT1ncNM9Aa6PKI1Fmm31DHIDaMDbJpHElfrnqRF1W89iyvbK/mDwtl1k6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkRbo7Btuf6OptzIMrsyMrsHpwkQPM24A5LsXU73zhg=;
 b=kEh2YJ2+Dy54Oh5Jnd4oBNA/f8e0LnUgVpO3h4ZIRglhGEpZ9CQ9huOW2qgk1XXUejxAyf1v1M2cC6YPk4k/GYbGPhWL5RkltBTKJApsvcMK46esLDOC5djxCdpUKxadAoA7rAk0HRtNyJRz901OaEfpNYoV5ClpDPhgTZqoEqUd0VIwk60fu1up7BkDvFGFkWea6XtYXEhzfwekT+6xnICWdqAhYeqF7Z6lY7XRwi3J2zBaauajpPdUY5gZ1ZVofVe4uwyU73XvLj6XNYGJeGI2eHc/rswpZZZybG+qlwRtn+l3WUdfKodfZDT1mRfl9AgIX7OtlYH7hTgahIK2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkRbo7Btuf6OptzIMrsyMrsHpwkQPM24A5LsXU73zhg=;
 b=Yiowzzr+Obh911GEKfWpAaNixWC/9C3chofnViL3Ml+KxYDA7WZJ0deDloocPCEOqaMC/WwPBIqJD2gALsLuqXc5T9qIXKx8jkEiOdQ7uSPAN+/V1yTExE53hR43Z3F0oDgE3iaSHyaacjqSZHNQcwRzLAqemyBNlYpjio/MZ8I=
Date: Thu, 22 Apr 2021 16:56:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
Message-ID: <YIGOrOL+pKGaHqwX@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <96cb4039-5f43-8eac-d855-c9f1587ed2d0@suse.com>
 <YIAJP0SCq0nOKZVL@Air-de-Roger>
 <6023c1d3-4f50-d207-1ea1-30dd1d5f68d2@suse.com>
 <YIBFD4i6bLaeaXdE@Air-de-Roger>
 <3cda296d-e88e-5fe0-4924-4cf974c4f909@suse.com>
 <YIEwW3HQuTtgWH5M@Air-de-Roger>
 <a00cfe95-06bd-4999-05ab-cae737ab6f4c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a00cfe95-06bd-4999-05ab-cae737ab6f4c@suse.com>
X-ClientProxiedBy: MR2P264CA0147.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7b55825-8c57-487b-edf6-08d9059edc5b
X-MS-TrafficTypeDiagnostic: DS7PR03MB5605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB56053A1386125520E2B533158F469@DS7PR03MB5605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CqUwWKU5UMucPjRzOLk35I2Br7Y+0MSSbDqy8PGhDvLHw8Ad0jHiP6tmm8ooXqMc8kpr5x24fexEH84/8v8Nwh05GxTaWHb32Ra9D3FSidVUQRlH3AdmIIHQmmXfpvEJiBXh1Z1QD3bIp5dZ9fH+wRioeUMj2hnzJ/RCtyflfgEy74cmkNqBa1k1HMHGJ4aGmCtcPEmByyG4r2tTnfBWfKWNUpAldnL5qo3XgyQz6AZxOHYTm+iON0GH1jD8Tpf6AhErTkb8859KJEY0BOnlXG66cI1xTY+EX90GcmvUQTaAdi1dAm+74sdxT751KfsTmNwG0dS4OLGxWlX9mJTcL/ZBenSDUDkEad9yWpzVeJ47FEYm317CaG8W4OqzSM1YbvR+paoeQDmKjnVwlbLjezb/Q8o3qH/oZ/r43rm5U5j1QHK+gSH2ffP9kRR4BPSYMxwTQNQuZRuLZAVMc0wRMSrTbkEjBhgT3UwtySEuJ356Hwtw7Ht4Ct2aQVvNuBpGqy2UxW9S/rkJNKEmFFrntgFiEDXVnuVO0UIClLcez28+RaVQXnRCdJyWqRklbQliKq7rcI56HaUQQe9vMAA3302OaD3PBe3faOWO/9C6g5vCZ+84agmaQJl6XOYfy54IFQhkjyQN1cZXWyeqVBjEYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(26005)(53546011)(66556008)(8676002)(16526019)(2906002)(66946007)(9686003)(85182001)(54906003)(6496006)(4326008)(8936002)(6916009)(316002)(38100700002)(956004)(86362001)(6666004)(83380400001)(6486002)(5660300002)(33716001)(66476007)(478600001)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nkd3eGp2TGZOUDh2anVnNmxxSzZEREN2YTZBMFRzdFFHRjVSUC8xRExNdTd4?=
 =?utf-8?B?dmlCMVlvT05EbmZxd2dRcGQ3b2NGVExwRkdWbFA0ZEpITWQyOFJIQW5oNkh1?=
 =?utf-8?B?MDZZelFLaSt4aWNRSmJSbHYxTFlvTzZQenF0UTN1bktHdnZFd2UzTXFyMUQy?=
 =?utf-8?B?QnRIV2p0Ri9pcGdIYnJGd25ScFdSS2EwWDVDN1BobWF4cjQwbTdjc1dPTWs2?=
 =?utf-8?B?TnNvTTBNMWdnR3lKWE9WRXJ0RFJFNWxjc3RyalpXUndneGFkazArd3RRVnY0?=
 =?utf-8?B?OE4wb1V3TXN3QUdQZ0NOUjB4QUtkTnBveHJ1Q2tqSEp6K3VJK0c0bnN0Smp0?=
 =?utf-8?B?QTVUdlZjZGJ2dmJCN2VNRXZSSHlIUlRMb0EyUVgyOWtoRC9wMHRSMDZWMUZC?=
 =?utf-8?B?SUlJUXk3SGE1eDFRRlMyNHI0ZXBiSXhDa2ZVazNkUm9DejhITGVNSGQ3WWxS?=
 =?utf-8?B?T0VXamVyVTVYUURwdEswYkxUZGpxbTZ3UnVOV1pTTFBENEFGcG9VK3lHNUll?=
 =?utf-8?B?cXg3Q05IVEFJVG1lSkNpOGVuV2k0RkU1WWpFcTdCelVkNTQ4T3NWUkJJT2FB?=
 =?utf-8?B?NnlBYXdwdlBRcWMvS2U4ZnpCR1cvL296ZTk5SDJpKzU4cHloK2FwY2swQnM0?=
 =?utf-8?B?czdlY1dlUExTV3d4U21iWWVzYkIyQmhoSGlrTWxXRXVUb0ZsRWZPVzhWZllG?=
 =?utf-8?B?cURKRGppbWJIT0pteTVDRGwxRE5jQVhjWEcrZEp4UlVJMXl4ZTlNVmdmN3hj?=
 =?utf-8?B?YWJIZ0dzR2szbWFmaDdLYVlpemxDVkh3RHYrV2xVMWlvaDlzM0haTlhJaHpy?=
 =?utf-8?B?M2ErU01YbXRoSkhkcHJUMEg4UnY2NXBoR3E3SVlaKzBJYkdyWDl1MGtGUUlm?=
 =?utf-8?B?eWsvazRVbFJFeTg5dXN6VDQ4MHBBRGIvalk0THFCY05DdnJ1RmFDU3B0aE1S?=
 =?utf-8?B?UkNSMGpzeUFFWGxQTG1SZDU4OGZ5TUFKbzVROHdWMUp0VWNmc2VXR3p6UGFr?=
 =?utf-8?B?TEhIMUVLaUZ2MTAwWGJUb2NWNzhqZG9nT2NCK2NSY1VQWDBDK2k5bkxhMENo?=
 =?utf-8?B?L284SHFWT0JXQlZVZWFVTi9lT1NvSFByOWF5dmNQcld1TU80V3owQUU0Wlg3?=
 =?utf-8?B?b2VqbGQrcGhzRTU5MUtnZ2J0b0JsckdRd3lSSjZnUmgxclRnTUNUZGZ1Vzhs?=
 =?utf-8?B?dHVtOXNpdWViajZ5MUZRQ1Z1bEludzBGR0ErWVc4S3k3RjdheHBiL0hLdEla?=
 =?utf-8?B?MGU3Y05rcm5oN1FZL0p2UERUbWxJZThWVC96UllFbjNRMlBYT3RObVk4UGVl?=
 =?utf-8?B?cUJld3dleWFiSVRBbm9IZjlzTHh1d2tQQndlNVIyekRiNkhIWTFpMDBUdlJF?=
 =?utf-8?B?Y3lIZUpjazQ5R2N0ZkRKK3NUYkphSlZFdTBUdzhuUUdpS3dETmNac291cHJQ?=
 =?utf-8?B?bTJrd1VXNlR6WVhDQm9YVjN2NGNLc1BRK1ZQL1NkQkJKa0pMRXBLZHdCcjNL?=
 =?utf-8?B?RUM1dm9HcGh6Um55MHdjN2c5R2ZERHM3WTNaTS9sRTl0b0VJVWpBRERRRktT?=
 =?utf-8?B?SmJMczliTzlFUmQ1SWhqYkxSVkYxdXpXQ2RXMnJob0cxTWZ4RnZKZXpnMTY4?=
 =?utf-8?B?M0VsbHZXZXIrNlkrcGFkc0JRYVExdERCcGdSOUFZYUpha2ZaMk11RHFMZVI1?=
 =?utf-8?B?dFpYWFE2RjRqcThaQ3doN0MrZlNWSXIxUmlObS9DOUpKQmU3dEFFOFJXQVpi?=
 =?utf-8?Q?Zx0jvY1XVSJljTT/v3QWLnpBd9Nm6ZK95csKnwh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b55825-8c57-487b-edf6-08d9059edc5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 14:56:51.1680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jv/XJiopRAE3E8pgXU4l6x/3H33BFku2U2tRk+zOcTt+oQIZi0d7PphCqBWKB3AgLkmySAA6LFkKA7ZIJVfbmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5605
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 01:03:13PM +0200, Jan Beulich wrote:
> On 22.04.2021 10:14, Roger Pau Monné wrote:
> > On Wed, Apr 21, 2021 at 05:38:42PM +0200, Jan Beulich wrote:
> >> On 21.04.2021 17:30, Roger Pau Monné wrote:
> >>> On Wed, Apr 21, 2021 at 03:06:36PM +0200, Jan Beulich wrote:
> >>>> On 21.04.2021 13:15, Roger Pau Monné wrote:
> >>>>> On Thu, Apr 01, 2021 at 11:47:03AM +0200, Jan Beulich wrote:
> >>>>>> --- a/xen/arch/x86/xen.lds.S
> >>>>>> +++ b/xen/arch/x86/xen.lds.S
> >>>>>> @@ -312,10 +312,60 @@ SECTIONS
> >>>>>>      *(.reloc)
> >>>>>>      __base_relocs_end = .;
> >>>>>>    }
> >>>>>> -  /* Trick the linker into setting the image size to exactly 16Mb. */
> >>>>>> -  . = ALIGN(__section_alignment__);
> >>>>>> -  DECL_SECTION(.pad) {
> >>>>>> -    . = ALIGN(MB(16));
> >>>>>> +  .debug_abbrev ALIGN(1) (NOLOAD) : {
> >>>>>> +     *(.debug_abbrev)
> >>>>>> +  }
> >>>>>> +  .debug_info ALIGN(1) (NOLOAD) : {
> >>>>>> +    *(.debug_info)
> >>>>>> +    *(.gnu.linkonce.wi.*)
> >>>>>> +  }
> >>>>>> +  .debug_types ALIGN(1) (NOLOAD) : {
> >>>>>> +    *(.debug_types)
> >>>>>> +  }
> >>>>>> +  .debug_str ALIGN(1) (NOLOAD) : {
> >>>>>> +    *(.debug_str)
> >>>>>> +  }
> >>>>>> +  .debug_line ALIGN(1) (NOLOAD) : {
> >>>>>> +    *(.debug_line)
> >>>>>> +    *(.debug_line.*)
> >>>>>> +  }
> >>>>>> +  .debug_line_str ALIGN(1) (NOLOAD) : {
> >>>>>> +    *(.debug_line_str)
> >>>>>> +  }
> >>>>>> +  .debug_names ALIGN(4) (NOLOAD) : {
> >>>>>> +    *(.debug_names)
> >>>>>> +  }
> >>>>>> +  .debug_frame ALIGN(4) (NOLOAD) : {
> >>>>>> +    *(.debug_frame)
> >>>>>> +  }
> >>>>>> +  .debug_loc ALIGN(1) (NOLOAD) : {
> >>>>>> +    *(.debug_loc)
> >>>>>> +  }
> >>>>>> +  .debug_loclists ALIGN(4) (NOLOAD) : {
> >>>>>> +    *(.debug_loclists)
> >>>>>> +  }
> >>>>>> +  .debug_ranges ALIGN(8) (NOLOAD) : {
> >>>>>> +    *(.debug_ranges)
> >>>>>> +  }
> >>>>>> +  .debug_rnglists ALIGN(4) (NOLOAD) : {
> >>>>>> +    *(.debug_rnglists)
> >>>>>> +  }
> >>>>>> +  .debug_addr ALIGN(8) (NOLOAD) : {
> >>>>>> +    *(.debug_addr)
> >>>>>> +  }
> >>>>>> +  .debug_aranges ALIGN(1) (NOLOAD) : {
> >>>>>> +    *(.debug_aranges)
> >>>>>> +  }
> >>>>>> +  .debug_pubnames ALIGN(1) (NOLOAD) : {
> >>>>>> +    *(.debug_pubnames)
> >>>>>> +  }
> >>>>>> +  .debug_pubtypes ALIGN(1) (NOLOAD) : {
> >>>>>> +    *(.debug_pubtypes)
> >>>>>> +  }
> >>>>>> +  /* Trick the linker into setting the image size to no less than 16Mb. */
> >>>>>> +  __image_end__ = .;
> >>>>>> +  .pad ALIGN(__section_alignment__) : {
> >>>>>> +    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
> >>>>>
> >>>>> I think this is inside an ifdef EFI region, since this is DWARF info
> >>>>> couldn't it also be present when building with EFI disabled?
> >>>>
> >>>> Of course (and it's not just "could" but "will"), yet the linker will
> >>>> do fine (and perhaps even better) without when building ELF. Also
> >>>> note that we'll be responsible for keeping the list of sections up-to-
> >>>> date. The linker will recognize Dwarf sections by looking for a
> >>>> .debug_ prefix. We can't use such here (or at least I'm not aware of
> >>>> a suitable mechanism); .debug_* would mean munging together all the
> >>>> different kinds of Dwarf sections. Hence by limiting the explicit
> >>>> enumeration to PE, I'm trying to avoid anomalies in ELF down the road.
> >>>
> >>> Right, so we will have to keep this list of debug_ sections updated
> >>> manually if/when more of those appear as part of DWARF updates?
> >>
> >> Yes.
> >>
> >>> Do we have a way to get some kind of warning or error when a new
> >>> section not explicitly handled here appears?
> >>
> >> ld 2.37 will start warning about such sections, as they'd land at
> >> VA 0 and hence below image base.
> > 
> > That seems like a bug in ld?
> > 
> > The '--image-base' option description mentions: "This is the lowest
> > memory location that will be used when your program or dll is
> > loaded.", so I would expect that if the option is used the default VA
> > should be >= image-base, or else the description of the option is not
> > consistent, as ld will still place sections at addresses below
> > image-base.
> 
> ld's "general" logic is pretty ELF-centric. Hence debugging sections
> get placed at VA 0 by default, not matter what the (PE-specific)
> --image-base says. Whether that's a bug though I'm not sure: There
> are no really good alternatives that could be used by default. Doing
> what we do here (and what e.g. Cygwin does) via linker script may not
> be appropriate in the common case. In particular it is not generally
> correct for debug info to be part of what gets loaded into memory.

So with this change here you placate the warnings from newer ld about
having a VA < image base, but the end result is that now the debug
sections will also get loaded when booted from the EFI loader?
(because the NOLOAD doesn't have any effect with PE)

Thanks, Roger.

