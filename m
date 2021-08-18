Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0573F0073
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 11:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168152.306987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGHtJ-00053Y-Hd; Wed, 18 Aug 2021 09:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168152.306987; Wed, 18 Aug 2021 09:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGHtJ-00051G-E6; Wed, 18 Aug 2021 09:29:45 +0000
Received: by outflank-mailman (input) for mailman id 168152;
 Wed, 18 Aug 2021 09:29:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkKE=NJ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mGHtI-00051A-EW
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 09:29:44 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07b1fc21-409a-49da-87d2-994a8a95f1ec;
 Wed, 18 Aug 2021 09:29:43 +0000 (UTC)
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
X-Inumbo-ID: 07b1fc21-409a-49da-87d2-994a8a95f1ec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629278983;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z6SJtrCkqSMu3nqmxxuydVlWb0XN+B2c5EeRIc6EKac=;
  b=SIE0FPXNpZXezaWRDv1lSNuqP6kNkX7RwGueMRjtfSXcb7NE5siYp1Gz
   jlhDAMBFc+X+1cd2gRn7k5C76cU8PI/8xFQE4Dh8IMpTJ7cTy0UdAKq2t
   3f39jGtb/21OxDYB9RKSiZvu0tJ7cLiXeBHCHkrtYjdmMQISkthrSEvnK
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sXVKpHVr8ELEqU/xHB5FgUn9U6CF7vt8ZuquoJxHby3axJKnPlWHzbyUzG5JnMFEU9KFupxZ17
 IuI4MSH4FWufZZ3BqaYuBKoRmY3+kW+eoBL9XxCJ9G8bMDX8CO6qD70VtPLzihmtQVMjtic5Fp
 /E6G7qzYtUm6dYbkDN+33y/75G14Msd0r2z+4mEI9+5LF6PQ4g6pYQFS46vhols3jBKZlSDlQL
 LsayTA+28lU50Bert5uZPD+0/nZ5Oj1hg4uXXzXGYOeWROUUvk3Nw3SPeNxhHsgouPxTjDLXcU
 T3+ayaloyWsohjxZPZw0y9lk
X-SBRS: 5.1
X-MesageID: 52432825
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IBr6k6nNgBbxZi9KBEwOVm8lZjXpDfLU3DAbv31ZSRFFG/FwWf
 rPoB1p726PtN9xYgBYpTnuAtjlfZqxz/BICMwqTNWftWrdyQ2VxeNZnOzfKlTbckXDH6xmpM
 RdmsNFebjN5C1B/L3HCWeDcurJ47G8nZxB2o/loEuEWmxRAZ1I3kNcJyy1KE15XiFKCJY1fa
 Dsm/av3wDQAUj+z6+AakUtbqz4vtXO0Kv8ZxQLHQQq5WC15g+V1A==
X-IronPort-AV: E=Sophos;i="5.84,330,1620705600"; 
   d="scan'208";a="52432825"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGM2WtPJeibjVC41XXfUJ668eNpuQwVqtrrSNsByW44dPiEW75GEoM0ZyK4+zK3+TiX1olyERHiO/OKTdHiGvJX3g8T/zET+1ePc+OgByyuvrZINtn6LUvGZUO77OTtHMknDbgmqt9c6SJDUqDwAbvumqxEeut7jdAbT8CVJd9eCTMM+kdVlygCW2f4ZjbZUliEM4Fs/ERr0X07jGgbDvQRdTdwYL9xwjEByRwnBO+ZNoVECODGzsj7nI2fwVp4P2wWZhz538jNiv5JgfxKpZtNLnKN99iagmIoJS72LP36asYUZZi0WUp4+CULGTXbnTdMyhMuyVbM3J2TOxsJJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOtWLspargJ1NTS/u4DojVlB4ecGVazEMObjBACD55g=;
 b=IXVeSVnSV2ngn5RSw6owg2HZ+C9Q8oWcdJDCAOpSW/svPfV8dy2/FnbdhikRIj+VzwZhhPQ2x/+oIvFQEsjTj1D1xvPEs5SyxmP7tWmzf6R3IYyH+22MmPBte2SMMwZW6wpe/1XpTWx5UXqGXColOlmyqXzPeMzczeia3P4myk93HYeFvjjlUbbxKCaADoCaRWVg+Kwn/EYtU0q7f5+rnJhW+RwtADWpqoVEVFBdcdhHX6YJdLpogG+FdA2VwX/jjVu388QIRG9NQocuXWpyxQ0mKqTYutV9lo4baBshUAxyl+c9uPZ7l0fxZfC5L3LH7K2Mpw8P1n2ef5ldGvtiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOtWLspargJ1NTS/u4DojVlB4ecGVazEMObjBACD55g=;
 b=t1G7+Y+7iimt9OJerL1tkSRECSe2gcZhHDqhBLMlUjGekcZHERUt1icJblALHbblP95E4PxlprNC8yA23D4X4tzRFfNMxGaG5C2WNhwFzCv0fiPvPpDqBcXQ0OUFanGCe2cxIVuqZqnHwvmBYDdaAGH9wBHzm3ZzPjYG2Fe2v6I=
To: Jane Malalane <jane.malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
References: <20210817151924.6674-1-jane.malalane@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libs/guest: Move the guest ABI check earlier into
 xc_dom_parse_image()
Message-ID: <51d8928b-34cc-d74c-4833-a7124d61a7cb@citrix.com>
Date: Wed, 18 Aug 2021 10:29:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210817151924.6674-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e945a25-0cc4-4a8e-f7c8-08d9622ab01e
X-MS-TrafficTypeDiagnostic: BY5PR03MB5047:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50478A6A52A3CDA2B54DC186BAFF9@BY5PR03MB5047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1vatGOvDLhReRMdCeGf4NEmaE+GqIwJ7aMAmPOwFzmePYp7ciN+/aermnFi0F6Kzz1vwH6teJr3YZXv7Oob1E0zsaPbFwJ2BOW4lLsN4sgA7xo/gXbgRMVzgVdNaWQIg9T/8TcKCmZrG5eK0gCd1JDP8AVkiFx8NWX8B/eZxEdfmhdpB9oL/qjYSwUSY9zpiPjw+p7giX5+aC4duAiqgl3hTxB82kLuYVTu6fuMUMxHCTkA9axSua22g7C4TUvIdAIMjhmkqgO+ixkWkoHIO8e7aA8fV6TtyMpDcOHjpgzvHv8PTJq3f8xSIeWYwSqzvFPfxvZTOe4UnFtrNGs0Bv7Be/hWXzBNREipgr7G0T1exWPnHzZhCGorLOIGHXBYWk9KItu0jNDegvGU80HsXP8jDj3C5H8Yf91WYzAtZvkBZr6/6kWfiJQdcnz83GIecbQnWbjXEcWvxAmFVCJMRxQYasYfdHCBYYaWpM2MJFwZMCS/Ttva4LGuyQZLrmkiI6tgnJLjqedg6aeBuH6MWByEDtm7TgnhOaP7IEeqPXW/FjLnIlhd+GtHtLVKKxUnj8nznlBbVHtGjLG+6sQv1kUgSuPwvncFnCvtlSijHqEQbmcpwMuiN/eTA1QqUAFursQkzq+Gbu/c1aP65c+N0l48buSPUdbT0pajIMTdiUDejV8UK1m7/0Gtr1iHwKujhXZbPgDoRQXCvAGOhXskf9N+HKn+9lx+bd4ehxu9bMsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(36756003)(66946007)(478600001)(8676002)(8936002)(110136005)(956004)(2616005)(38100700002)(6666004)(2906002)(83380400001)(31686004)(53546011)(186003)(86362001)(4326008)(54906003)(16576012)(316002)(6486002)(66476007)(66556008)(5660300002)(26005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?USt4ajdzbGs5WmRaUlppRFMyRTR1TkJpS2IxeEw2TmlTWVNjRzNaZDFNVVcw?=
 =?utf-8?B?YnpHc2pFNnNWcUpRMGlQL2hvR2VVbXVZL3RSVHhLZ3NLTzBxblcyaHRHZ1or?=
 =?utf-8?B?MEorb1lIYnAvTW5WeFdxUmxyM1pXUHMvZWN0S0JpTk1kT29DZHhCcGM3UE9u?=
 =?utf-8?B?Z2VIVGlvVmNSeFZieEFQNENUTkhWdkVOMEhQZnNLNTBnWTd5MjV2b2dOTTdv?=
 =?utf-8?B?QWNRNkNjMkd2OVZGYTRmd3pxWWxvbDNrY285cGNBb2toY2IwOUhNU2Z6b3JI?=
 =?utf-8?B?bWZONFRPV0RTa2htSXFCZG14ZnpwdlRhL0E3NE1ZUUQ4ZWM1MUplcGlQcWJ1?=
 =?utf-8?B?T3BjLzV3MWJ2MHdRUm1tRnhyZDhyVDNUUnFpZGdvUkduZ0ZYZHQ0RE5hcHo2?=
 =?utf-8?B?azFkQ0VQNXVVSmpoc3pkczRaM3hoUnB6UzlaYkt2THVPdjh6YkErQjFSczN1?=
 =?utf-8?B?eU5wa3VLS0lIWkZJTnZzeGswRkk4RDhqWHo1MXZaZjNmc21KN0tyRjZoc0lC?=
 =?utf-8?B?ZTdWSzFyODlkVGMyOXFKbGdBSFM3Qm9ZQkF6Q2VndTBGQzZRcHk4NHNEUEky?=
 =?utf-8?B?cUx3bW9uSjFzY0JMcklyUjZtdU9ZTEFYazg3Z1RnelltYXdDaWZwTHRTVzdO?=
 =?utf-8?B?dGRmM0pTZ1FFMGppZS8xZzlFaHBWZzhTRHF0V0grcnE3Q3dXOUJWcG1nOGMy?=
 =?utf-8?B?WEZ1b0JHUUM5YUdaNjNUcGZzRG8vUVNQcDZLOEYwVkFxYlBRZ2x2VmRRQSsy?=
 =?utf-8?B?ZjRpTGlJQmJHUTdRSTlqY1pUZUxBbFV4dUJRak81YXNaWk01TDQrYVc4a1cz?=
 =?utf-8?B?Ukx5YTI5cERublNKc3QxeGxNK3pVbVdMeHhmUmZVM1cxOUV3eUU3YmNUMU5y?=
 =?utf-8?B?b3ZxWVU4ZG4vY1NlVHUxTFcwTXVlZE9vRmZtRmNkbE85SDhqVHpYQ0RHWWtK?=
 =?utf-8?B?WWNGNmg0OXYwQk9BOG42aFJUMlNxK1pPRnR0ak5aWnNwbXBOQWlOUHhwYkRG?=
 =?utf-8?B?ZHhJQ3VpandPWlVzVjRZK0NQZTVuR3Z6eGgvRG9pRWx1d0tUbWtVUVZhQVR3?=
 =?utf-8?B?WlYza0ZZU3I5ekFEQllVWDFwTzNoVnFGRTFQYUVBV0NPYVVjTlhzVFdnV3BK?=
 =?utf-8?B?ZjhRNDFhd0ZpWU1pbXFERlJWdWhuTEtUT29YT1Y3UzhCbkwzWnR3RlVoSnpO?=
 =?utf-8?B?R1NVTDRUQzUyaFh4R2pPSzFiUVVwQWFtVTBZWnRXT1ZBekNyUTRrQmhxODlh?=
 =?utf-8?B?Z09oSG1IWW5mMGVKdms2K25DQTFUemxaK1hpVzY5TG5idWVmRllyVVduVVNX?=
 =?utf-8?B?SHZOWFRzbkFtUkJEWFFpZU1RSFB0aEJxZ0YyVGFyUGROQ29BbHFNZWk5NStZ?=
 =?utf-8?B?Vms2NXkwSktaRzN5NURFSUd3NGE5YzBDWktxQVZ4VUx5ZmRGbUVIbC9IdTVR?=
 =?utf-8?B?UFpYaG1La0tyUmNzWVRZRWhXUFg4QzBoeitRRU4wdmJmcW1YMFQzTTBGcXdl?=
 =?utf-8?B?QzJ0SUdiWU1EMWNZVVhhU1duVXFkdm53Um5uRjA0NXFobThMamRZRlJTNFdN?=
 =?utf-8?B?TmlReWRVZmxHamtJTzBaeEV0YngvQndyRWQ0T3hCdWR6d256YSt4VXN1QzJl?=
 =?utf-8?B?RGNSSkhNWWVXSjNzdzFVeUF1bHRqU1N0bWRna1NJMUE5NzBkQ1FFNVJlUzBp?=
 =?utf-8?B?QVdlUkU2dVltUXJFTW1qcElxbldOUlNPWitTZVdCRFFMQ2tXOEhJNENZT09m?=
 =?utf-8?Q?JjBhKy9zo3mgYkl8ipaPZAp+kVMx18dmfhRyzQj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e945a25-0cc4-4a8e-f7c8-08d9622ab01e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 09:29:33.4522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXEgf07LJ7b+KH9McVNDNJ6f3/lYIKfbTFk07ujtLkX9lF61pD7Lxhgd+36gB7x0I5P4mkqefAxI7jJXYjEko/aptIOTfiD6d5h+8CakTSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5047
X-OriginatorOrg: citrix.com

On 17/08/2021 16:19, Jane Malalane wrote:
> Xen may not support 32-bit PV guest for a number of reasons (lack of
> CONFIG_PV32, explicit pv=3Dno-32 command line argument, or implicitly
> due to CET being enabled) and advertises this to the toolstack via the
> absence of xen-3.0-x86_32p ABI.
>
> Currently, when trying to boot a 32-bit PV guest, the ABI check is too
> late and the build explodes in the following manner yielding an
> unhelpful error message:
>
>   xc: error: panic: xg_dom_boot.c:121: xc_dom_boot_mem_init: can't alloca=
te low memory for domain: Out of memory
>   libxl: error: libxl_dom.c:586:libxl__build_dom: xc_dom_boot_mem_init fa=
iled: Operation not supported
>   libxl: error: libxl_create.c:1573:domcreate_rebuild_done: Domain 1:cann=
ot (re-)build domain: -3
>   libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 1:Non-ex=
istant domain
>   libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 1:Una=
ble to destroy guest
>   libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 1:Destructi=
on of domain failed
>
> Move the ABI check earlier into xc_dom_parse_image() along with other
> ELF-note feature checks.  With this adjustment, it now looks like
> this:
>
>   xc: error: panic: xg_dom_boot.c:88: xc_dom_compat_check: guest type xen=
-3.0-x86_32p not supported by xen kernel, sorry: Invalid kernel
>   libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image fail=
ed
>   domainbuilder: detail: xc_dom_release: called
>   libxl: error: libxl_create.c:1573:domcreate_rebuild_done: Domain 11:can=
not (re-)build domain: -3
>   libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 11:Non-e=
xistant domain
>   libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 11:Un=
able to destroy guest
>   libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 11:Destruct=
ion of domain failed
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

FWIW, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

The net behaviour of `xl create` is still not great (the -3 in
particular is ESRCH looking for qemu which isn't remotely relevant), but
at least with this change, you get "guest type xen-3.0-x86_32p not
supported by xen" out of libxc which is the root cause of the failure.

~Andrew


