Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CD5362001
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 14:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111711.213626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXNlQ-0003rU-Ju; Fri, 16 Apr 2021 12:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111711.213626; Fri, 16 Apr 2021 12:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXNlQ-0003r9-Gb; Fri, 16 Apr 2021 12:40:00 +0000
Received: by outflank-mailman (input) for mailman id 111711;
 Fri, 16 Apr 2021 12:39:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kml=JN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lXNlP-0003r4-3Y
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 12:39:59 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6da3faa0-a645-43e0-8011-7c881d3f471f;
 Fri, 16 Apr 2021 12:39:58 +0000 (UTC)
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
X-Inumbo-ID: 6da3faa0-a645-43e0-8011-7c881d3f471f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618576797;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JYl/U9O+A3xqVq06iwolLVk7+Eq5sjB/GzqdOgXsDnY=;
  b=WwKmbYlgDmoDW4U/rtovSKhArz8aF/JXJV3bx8wM9KkOiCaQ2CvSeNty
   lA51mb0KaUS+PfqqcFhECkJL6SippIho7SdoxaqRWSihKgP/PoUDTT13d
   B8FlEOkwa7UMUzSrTMWHwJ/9BO8VLjbmq09Gg5IxukCoMfBYDOxVOOQ3W
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2L8maLC4Q1IDxkfK0SCKD7zwimL29WwBM8hv1yvs/6e6z+IGFqaQQgIkXKPFOwJIeIR3KtuKu6
 lYABoPYKHLwCLlsTSdryL01dN6pA5pEOKm4zWMjG5FjhPlnYbBX7H43scmbfycQFkqQ3l46Lj8
 1DW6l74GHUF9gO7zpQUTQ9ZqDv/9I5OtKZanvhHfZ4xOm/lVFMMPguTO20Dl8nv+AZoYgPqTe5
 GF5QPJH2+Y5sxp4UfXFtwY7immx+ESTfjUbXHjvHYRvthfLkr5GwBRyKF7tMT6j2WZu/6rkEms
 4yM=
X-SBRS: 5.2
X-MesageID: 41588383
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fdUJ+64G8x3CObArQwPXwE/XdLJzesId70hD6mlaTxtJfsuE0/
 20lPMA2hPuzBoXUncsmdePUZPwI0/035hz/IUXIPOeTBDr0VHYT71KwKnD53nbGyP4/vNAzq
 sIScNDIfD5EFQSt6fHySaiFdJI+ra62YSJocub8Ht3VwFtbMhbgztRLgqACEV5SE1nKPMCea
 a03cZMqzq+dXl/VK3SOlA/U/XevNqOrZr6YHc9dnsawTOThjCl4qOSKXil9yoZOgkg/Z4StU
 Xmsyi83KWstP2hoyWss1P73tBzop/A0dtYQOiBl8A5Iijl4zzDWLhc
X-IronPort-AV: E=Sophos;i="5.82,226,1613451600"; 
   d="scan'208";a="41588383"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUXJACR7dDhOPU6YwLx1XPmzPw/kzix6eB61WmpYEM+ZO1CytNl3UAjCTHJ910ekvc+EnQSLCO8Kx3jMkJ1zpwBvf3zuyZIb1jk59WmggMF0edtx8VNcnFdYg4LGeF5l6/kT5Ai6Hn9KbG+x2k1SqdZiwPgK9NO2qLHJk5JDEKpKiPOl3Pl7yWb2utcezeqR+F4cM5xEyNHd3xGIZO71sDtVkZxkbr1lzDTQBgtOUundfSiMD3beGuFc5mmvc7umvyn+dR253F331WO6a+GH6AeQhCFmwe0sPxHTwSkoLbFlnWICxUuxKvgAhwT5BfXjjo+xCRHJoIoKefbeotdhxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWT/WvE4NsIYkSJ0fpZlKaClUjGKSr0epflWnBbSMxY=;
 b=B9wTXBRM//Q9DlMLFL8GT13+szpQ/123rvljjwNs4HaCFGqKN7vwf7ici7w+4gnH8/teMLBfL69f3i9gWDZwyID56krImFq2xP8Mj/GnT9p5gHUJfMPDEQxAkpIoQVDxTVJMi7/ZZcUuCq4M+8OHFWIgI/mjboU2D0vh10jOoT6AbDPckZyAMUuur0n0UvIL6wIsCR7MK9QQnpJtbXQDIpO2pcIO+tIOAMqN5gp3Sq0Y/ycQe9O0hhEKw9iKS0MnsBVeeUmB8Qk5M3+eMnmP40xhaTXYUlnD/bxLEZihF5f5WdnTaC+DYD4vEW+YtIRUlmyPY6Iv+7wzavbrIt4G1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWT/WvE4NsIYkSJ0fpZlKaClUjGKSr0epflWnBbSMxY=;
 b=wlt4yQwWHXkwM7LEvE2jmHZHOdEdwIT/69Ct9RrvdvA4i6Bn5n3mF9qYf4cLDr4sjGrXLdyGjtX2e7vSD5hBYJtEF/O/DHCyYjByXjJ4WeTtI35ApCg+2bG1U9HvnYQvQmzR10yUgR9bg8dIGpKhGGfA7VKnfEU4iX6lUnsq9uw=
Subject: Re: [PATCH] x86/shadow: depend on PV || HVM
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <eee69a8e-36d5-b9eb-d8f1-1a7e1c3dfdc0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4cab02d4-121a-4898-d0af-7c992b157785@citrix.com>
Date: Fri, 16 Apr 2021 13:39:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <eee69a8e-36d5-b9eb-d8f1-1a7e1c3dfdc0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7d8cc5b-a5ef-477c-4949-08d900d4bb3a
X-MS-TrafficTypeDiagnostic: BY5PR03MB5169:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB51694E4E485770EDE5E5B6BDBA4C9@BY5PR03MB5169.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rqrE60qMdGB/eHBUY3XlKozksNysqZK4qxP8/04DyKE3H/ROJh76eedrncr3Ztd1YZXNM/EdQ8xJaVDlPFRuebA3+cQ0rshEKR9Jer+IiWjj7Gw3Z9xvtUbMtZiSHf/9pW6ZZnnfE7ED3qrqgCRvqCAfqiRK28dFgies3sn2P7WrNtnblwWU3MxzCGNQbJfqf+qRpL2g8/4gBD/7yKJVbsZc6YQ28Yxox0EuzkXp2Up8YCP9N7v//V4aIXaF7iplaW81ymv33xsav0L+li0P3axEfIujDdN4BWSP89sgjcnxXOncWplSUIRVLwO9GDyt0f+7o1pedefOPn2MeReUbrvh2+2D/QgDAQ7aXCuS5VkdIEUFZ8uouaS32F+xkqvbKe1O23lGwitki+lJzh0Pltkh3CXnUkJYgmuoDLjNvRXh5Yff4OZi35J/GhakhA88h+2F77CekqO8qwIChM689jgLsNLbkR8ipDJWRKw/ntywuP6e808PVqOj7nxTEEe1qosxDVvxJ6AE3TIEIZ6dYnuoXAYhMXs03zq6YsDEn37ufB6jCq76wfe2l6yCdyJtagiAhdEDrTMjsVEQQYBEv/eYPVTnXTLfWBf88gx4dkJWw2OJIizyOBtbI1CnOSo1AWx11UBmFGMnQYF3pimBq6Br1xldmqw1Osdo5ufy92+oXbDeu+ug+iYQMorbJzQe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(83380400001)(31686004)(31696002)(38100700002)(36756003)(16526019)(478600001)(86362001)(8936002)(54906003)(110136005)(66476007)(66556008)(316002)(8676002)(66946007)(6666004)(2616005)(186003)(6486002)(53546011)(2906002)(16576012)(4326008)(956004)(5660300002)(107886003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NUR6VWY2ZVRncjR6dU5nUkpoVDdiUmZqSUVjQXRjUzYxeWJTWXJGeU9NaWI3?=
 =?utf-8?B?bzdlSFBwN281TE5KU1pQNkNzazB4WTNjNDJGUXJBVzVUNFM3cnMveVY5V2ZM?=
 =?utf-8?B?RlhlVlhVekJuNzhiYmZxd1QyVWNHQVMxV29peXl3SHI5bU9udTdyclNOVUJG?=
 =?utf-8?B?TGtEckZWL0poYldqWDZSQUxUaDlVUnc2U0hRb2dnMTJSeDBhTXRJR1NobUlk?=
 =?utf-8?B?L3hUYjc1djN6MHFkQXQvYk1PMXozWmN4Sy9VVlJBM25WOXV0TklHQVFLUU9S?=
 =?utf-8?B?Z1JtL1N2Zk1XNlpSelpHOXVqcXYySWZ4OVpqczBobytjTnFsUW9nTmNUcWRl?=
 =?utf-8?B?RzlZUmZqZmZhTkhLYm80RDR1cklrSjRFek9xbWZKMWxUM0xJcEtSZTRGRkpR?=
 =?utf-8?B?QXJmK3UvcnhDUGVHTThVMUpFSGFiQWJlenRtNkIwUjlBTUJybGNBN3VkS0ti?=
 =?utf-8?B?VjR6K2dRTEFONnJCaWJWUFFFV25mNXF4eUdhVC80cFl5REtjRURvYUJLOEh3?=
 =?utf-8?B?V0VEeGV4T0hEQzVqd29oVjRDR2lMRE5zUkJMUGZubzF4TWVYSHZld0NVekQ4?=
 =?utf-8?B?M0R0d0RnTlhGL1ZUMzRKZjJNVzRpMUIra09mZE1GUUVuTTV4SFBGMWJqQmhz?=
 =?utf-8?B?ZTJMdHhMYllvNldSUzdTV3JGVDgyWkF1ZTRlZ04vaFd0UDgvcHN2Q01waW5C?=
 =?utf-8?B?UDlRV21VQWZ3MEVTbjlSemk3L29EQnpzUXF0SHdRZlRHYk45RWd2TEQyUGZz?=
 =?utf-8?B?Y3dJV0MwWGNBdllCVGtSZUJQOVJHOW14b1RVT0FEaGgrUFFjTDYzT0R4V0k3?=
 =?utf-8?B?YjV1U3Z3dm55dTlyT0EyWWxKandvWGhqV2NkRVN1WVBUTGt0R3I1QVlxN0F6?=
 =?utf-8?B?amZSRDc4aFNaWDczbjlzK0VvUXFTanJsN0xrSlFPc0RnMjcwOXk1MnJoMHZ3?=
 =?utf-8?B?NFNicFpNZGtlaTZNeDJ5RnU3YjZBb3kvNkdrN1prVEhCMEZwemJvMHFrVGJv?=
 =?utf-8?B?TUZ4bFRweFkvVzVmaTQ0RkFoRWRHZ1E2NExnaDFVUnV0cHM0MkFocVBaRzNG?=
 =?utf-8?B?US9qWWhlSTFqajIzbUE3UExRRjc4a282YkNtUnFyaGVKZVJjelFwTy8yZWsv?=
 =?utf-8?B?d3JSY3plbjl5RUd3YVo1YWwxWUdWK1Q4WWRLVDluYWQwR0R0bUsyYisxU0ox?=
 =?utf-8?B?R2pXNEZjUDA5UWg0VG14RzExWXVzZm1FaXg4aEltWG5JbGNGSnlaSU5WK0tn?=
 =?utf-8?B?SVFPQS80Rm11SkNYd0JIUC9IZE9JOXhObThzNVMrZW92dTkxU281bFVtd05I?=
 =?utf-8?B?VmY5b3BZd3FSSU1HUnBDNkl1Qmk5WXdlbXprbkM0MUtyWS9RRmpkbzYxM0ht?=
 =?utf-8?B?K1QwRFpZVDZRZDZKTXRKcjhkS2FQeWFzNFQ5VXdydzU1bTh6T3RLWDRqMWE2?=
 =?utf-8?B?eER0SzdKUkNzdSt3YWp5OGFEeUpBQTV3bytjTXEvaW5uazVmTjlBNGJhRFlu?=
 =?utf-8?B?Tng1aXdDdjVLZXdQUTdSazNjQ05KS3NGNVhNVkV2SW1vNjRrOXBsL2Y0Wjdu?=
 =?utf-8?B?aWVlWEUvZVdrR1pqV3hEZUl4M2piYWc3aUQvOWkwRVUxYjZZQnJFdHBzcWJT?=
 =?utf-8?B?bGsxU09QV3RtQUJSNCtBSHRhWXVIeWpxdzhmbEtSckE1a0J3RDJOZ3NsbDl1?=
 =?utf-8?B?YVVwWmw0a3NPOTlwTlR0VEwvM1N4bUp0ZE9HL244RG1sSEFadEdkK1BBQk9j?=
 =?utf-8?Q?ZI0Caas6tpAiBRvAIJ/5YwCjCa5aTFHnpmoewg7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d8cc5b-a5ef-477c-4949-08d900d4bb3a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 12:39:52.4961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wl9zWUrIeU1dtlpZ0y212bY5Z+V8JtwyA/RKH2aYXUSpr0rF2F8SITZ5p0gOHfGBn0/N6eO0JKz47JvwHfqX15sOTV7+v7eJHExL88Wv1Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5169
X-OriginatorOrg: citrix.com

On 16/04/2021 13:32, Jan Beulich wrote:
> With the building of guest_?.o now depending on PV or HVM, without
> further #ifdef-ary shadow code won't link anymore when !PV && !HVM.
> Since this isn't a useful configuration anyway, exclude shadow code from
> being built in this case.
>
> Fixes: aff8bf94ce65 ("x86/shadow: only 4-level guest code needs building when !HVM")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -121,6 +121,7 @@ config XEN_SHSTK
>  config SHADOW_PAGING
>  	bool "Shadow Paging"
>  	default !PV_SHIM_EXCLUSIVE

Hang on - this is bug, and is what needs dropping.

PV Shim uses Shadow, in default configurations, for L1TF protections to
keep userspace out of the guest kernel.  Without it, the shim'd guest
will be crashed when it writes an L1TF-vulnerable PTE.

OSSTest ought to have blocked this as a regression, but I suspect its
not running the XTF PV guests in shim mode.

~Andrew

