Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C827F3F86F4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 14:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172965.315609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJE8V-0003FR-6n; Thu, 26 Aug 2021 12:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172965.315609; Thu, 26 Aug 2021 12:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJE8V-0003D8-3T; Thu, 26 Aug 2021 12:05:35 +0000
Received: by outflank-mailman (input) for mailman id 172965;
 Thu, 26 Aug 2021 12:05:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJE8T-0003D2-Q1
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 12:05:33 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e995707a-0665-11ec-a9ee-12813bfff9fa;
 Thu, 26 Aug 2021 12:05:32 +0000 (UTC)
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
X-Inumbo-ID: e995707a-0665-11ec-a9ee-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629979532;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UF5/bYvBMgEZ039AVS+SOwUWI7+x5rc+r6XAwf2ibKA=;
  b=X1XMeIK87NnBMzf7wNPHkxZ1t1rNoTaQF/eJe53K+DgFVQql6L8LCC1l
   h2+OUNhcTV/4UHvpOcjrYq5TgF07T5va1A00MkHDu7YkOADPhxbIyjTpH
   LurPzFkdfffj1XchdlivOLv29aPvqN3xfQ/itN31bilhgHcJH1ELGfHtw
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ty+41LiYL5WHjt0RJ2l3UyTtmP1nfE/iA9qi+SI4wRbJdrJQ7+46PA9SVX6Bb3EBWUea+QhhsW
 +Mm8nV/Y3pIPqStRB2zxloAIZmYaUivL+VCjISRz7KhMC9Zjo4JRty8SiNkNYvK9Lv9DgoJ003
 r0XyoSzU1sWTqFyVkEJah19zKylJXOTGwfZlYsYKjSbOHubW1L5U4cRdusXDqEvVF7YxebZhiy
 xCnDLADEq7OJeA+4sxeQDGzuQDfRBjf3kY7Nn1nNKM8cJFLQ57d8p3fDLqIvKi5aJrRH185PsG
 P6VexbVjJwRQGVpS8gVO02Cj
X-SBRS: 5.1
X-MesageID: 53091028
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+OXDgKEeXhQOolmmpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="53091028"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1cCOIAjBN5+h0hyz7bwtfLxP5k96fifONrg9ux12h75s3XyQ+UfIBYAzZS4sgpiu/zzu/G22PpOW+4T6P4QahIMaNIvyqZXudOaktG1SovHuGXMErxzS6bx75T9fH3SDNyNa3lZuZpgAyqek44aGiA55J+3NReb7WIJ8fdmcjB6cWHf3Jf5/0vsLbumTB5MhQv9MDcDRKMWy4rX+XonXl42sCFXunl6J7UIj33XyqxefgnMfzh9dDzjvc8Jmn697oUKKgMyZjSQb36vfqwYXJFg4zmdy4a9z9ZrYJiLCAX5R/tUwwWxXNLfOuUWNgOkuKBziQU4VO16u7E07PxKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW4zszwH+uMfb+wAtRh/cHck6dERhPvuR6MygtVQZZ4=;
 b=oMkOoVnaeA/rGVnAv2XkC6umfZ4G4r78eix/Tz4LdsFu2ay3AJXLst3LTl8IFVKPNWkrorxj/Cg6RQx5uqIhcXcE2G+UQU0mTQQHBEiPLWokNwuE1lfr6p0R3z/i2YCLvZ3ddGqXDktrpzxxAmPCNyvgTIIXVVz05um70jg4KMdRA5SfahhdyfUSdLQ3rhAap/JHvr+xO24EfAJu25CUZ39ZubsvJtCETS/vwojaWdiZyCa0y4tocLXPnkWcahirNzqN9dPSZ2BVqbR/VBNkMLEGe/1GupY1Pe+UKNcPiIe2JdbFUCTMHbHViVHX8jIN8c60Evv3AAAcFgLOzU+utw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW4zszwH+uMfb+wAtRh/cHck6dERhPvuR6MygtVQZZ4=;
 b=uApIKe7zRX5DJBrJUhVY9wbqI5FOlScXG9GJo5+vjY52MmhvnIqgSCn5wUx2HoofITU2zVAnQrrZuvhD721uaySU71pAU4K9DfQHbP+zRQ68jky3HpwFg6Q8zJMxAu5gB/cfHY7cxZ6sln0w7IKWsVbKba3Ku0jonI7BWUd3d7w=
Subject: Re: [PATCH 17/17] IOMMU/x86: drop pointless NULL checks
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e0092044-be36-800c-5909-6bd21de9b5e3@citrix.com>
Date: Thu, 26 Aug 2021 13:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <25ad2429-df7d-95c6-ec70-4b23e6a023a2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c4167da-e730-4a48-c4ca-08d96889cc1f
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5934:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5934AB9E47F0C8D78D04B21BBAC79@SJ0PR03MB5934.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pQmej5YzBFfeaIKCGJc7FPQbbIKC3FsQmPROCXSox3z1LMfSjIUFjuSFYVCVdZO1keFLmm2rlYdor7qoHlRfFfgpickAVm/Wj3jWbvTZS+Xkyknl/0wTEazcTcspRLkjWM7NVwX9AbVaRPQKoDamdOEdOl+mI4jB4gu8WQDKJKBV/dsdvRqK4BpbonGl/ZERZm+4WuFkJuyJztplW0hHxEdo4BBXycG/GdadoqAL8Cw3gIQwnbuy+rTP8fiwUBtmkwIrmrwyY7lfIYA3GkVn9yM3s2WbbVRvhw7YYS4r+PUXVfdP6mn6RTP8hWAq7Qarr6yYzzU0/gVlz5V9F9dhjZ+5gjNSlQscf5wq/BiZla9FMBVXaZBQwP3UNU/s2m7p5ZVFiroPoW7nf0lo4UbPhMNZ5JkMEsmreUTgB2R3GGu4P/8/5xGxiHV3nr6jbweZss+omEGPT25dsKeDC+tyj7diKBmH0EBLcZxwWYssdpo1N13TlSWbQciSAVhqeJNHyz0P1A7HpDDFGABl7djPIQd5jAHharwJzryOf5RNdTs5c0FwwCTlpXN8qSmIH/XJbtWWqKaJejDCgduoWNjLFb/oP11iIV89Cu3E1ThMoqJ1388pBGhhsl5ttuo3HsWVI/50bcxZRa0WyYcwylnhg44/zGJl5U/Ni5D5vV7vKpHimOK2Q8tkKQ34tWkDj75Q39UX+KKIst14Uafz0XzjTm92pI8IL5rx8DBRtOfVkzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(16576012)(316002)(5660300002)(38100700002)(2906002)(55236004)(86362001)(4744005)(53546011)(6666004)(110136005)(26005)(54906003)(186003)(4326008)(31696002)(8676002)(66556008)(66476007)(508600001)(66946007)(6486002)(956004)(36756003)(2616005)(31686004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkxFa0QveG1vb01uZzJwL0hjOXlBTmxqL1VLcTdDRGZpQkZPUTZQWGRxMzJJ?=
 =?utf-8?B?ZFg4UkR2NUVqbHRtOFZaeTBCb0p3Y2FhWG9TbWxUckt4QkN0eUtnTW9aK1Bk?=
 =?utf-8?B?WnZVUlBWQWU4M0l6T2VPSzd0WXI0SzRiYzkyenlKblVRSmk1aDBtb1d1YXVx?=
 =?utf-8?B?L1VUUWVpZ20vcy9ZQjgzYXp1L3hXbXdvQTdGQUZydWhjQ2dpemNGV2Y5L0I0?=
 =?utf-8?B?U1VRRGFIYkV4SkNWMU43ZGdoV0N1akh3bE4wQ3pqM3pOejd2ZzMwSjNaUmho?=
 =?utf-8?B?YUZBWHR1bkhPZEpCOTk5dnJtNWNZeDdidmJnZ1FhN3FlMTJEWFFJaHBzc3ZX?=
 =?utf-8?B?QnRPTTltaEp0bkx0NFFDL1dla290cnVUZ2c4QTZ4VTNrZ0RmdjIzRmhWOW1a?=
 =?utf-8?B?ZSs1OEo1S0xLdE1HRVErSXgzUlNBcFdWb3VWMXRRR0lIQ1gwZ1pWKy9HWDVU?=
 =?utf-8?B?amxScjVRYWR6dUF4dnJ4RzhEZ05MT1pGVVpycnNLR3FGRkJnSnRVS3hhejJQ?=
 =?utf-8?B?TENQVHk2RXUyL0RzazdLWTZsYkdOKzR4NHZBV2xTU0NtUlFNdWJESGFhNExE?=
 =?utf-8?B?aHUzS3dsdFlQMHlBcUdTUU1WNzJlOWxLMHo2VGkyZWM5NkRLdXZMTjNUODQ0?=
 =?utf-8?B?cmk2WGlSZ29keTlxZDhtMGlzQXU3SzJtTzRkY05PelowRUdKek5zdzhSdUhM?=
 =?utf-8?B?NlM5bkRLandKUUFJbVJyUGE5VG1QN2p5dWRZQkg2RnZucXk3WFlsY1VvdXNz?=
 =?utf-8?B?OTdudEo3b3M3ck9zVlFSaXg4dlFndlcwQ21Xdm5aZnU2V0wwblVNaWpEQTlU?=
 =?utf-8?B?eXpUeFdJcmxaVG1POU1rQ21CV09pT2pFdHYwZVRtTmN4TjhGdUsreWVHdHVW?=
 =?utf-8?B?VklmS245eEJmLzBYWjE1WHRJRm1CbG5PbUdWWGFnZkRGWFYvRnM1N2JVVVBS?=
 =?utf-8?B?em04Mk90OW9nRDh3YnZGc1NpVnlMN2kyMUVEYVJabWZSVk5XRG1WK216Vis4?=
 =?utf-8?B?TjBGUFBSVlZuMk0xbCtRNDhiYUFUWHdlTFg0NGRwcmNSaTF5SkExWWV3QzRX?=
 =?utf-8?B?d0d6Yzgzb3M2aExOVmRWcVpGWUVjcnVXQ3lZcjIvZjNUcE01U1YzZVZDVkts?=
 =?utf-8?B?MjFDVkpwZm5qc0loL3RjU2JpN2dNcnB3dThqbHNKYUtzRTFLenljS0RzVGhG?=
 =?utf-8?B?WEJ4dVZacHN3WFB3V0o3S1VUL0xmc1l5Y01Ub0JrTy93a05yVWdGRFRRUzlB?=
 =?utf-8?B?d0IrNlNUUnp6cGNtOTZ6dWtpUXd4cUdObkFHYU5PZ29wRVVGaWpucm1KMUxF?=
 =?utf-8?B?bmNhY2tmYVNkT3FnRDA0cjA5UkZqRFE5T0o0N2Z1S3VRVVZZdlpidTZMdHJu?=
 =?utf-8?B?MGs2L2NnZ1N1Rk1wTzQyZ1BmanZDN2pkUUJpeW9ubUJDeUpqbXVzWExKV3Jm?=
 =?utf-8?B?eExwRStSV1pVaUZRMHg2d2dVTXZ5ckxBUmlpcko1NGswVjVvRE04NEhRdHdx?=
 =?utf-8?B?U2NMMWtIb25ydjhTeHpacEh0M3RSQUo4eGVWeXVSc0VzN2kyYWV2QnFBcEZr?=
 =?utf-8?B?OU5UbjI1VitXZGVRZUFxaU0yenp0Ti92ZzJhRGgrT3d5VnpRc0UrcXk5OTZC?=
 =?utf-8?B?ajF6c2YwMDYvd3Zza0pnZmx1eHJ6bExMcEVyZE40akpZVzMrNmdWSm5IM3NV?=
 =?utf-8?B?NnNMTmFTRXBaUEkxOWRZY1dnbVNrTlpwUi9xNUlHTDl6dG5HN3YxdEZPVnRS?=
 =?utf-8?Q?ELJcCIJYFcaoUHoWIRlCEfPXZ5Acp0VPYYIkToD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4167da-e730-4a48-c4ca-08d96889cc1f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 12:05:29.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /01t2ieq99EwIpIzyoeUECKi3CBr16Edbm8++3RtQbHt9xLN9rPlvIlzCM5YQ+w3F45w6T44FxEzUifWXhtdE4WH7e+5t6S4Aazxk+gszqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5934
X-OriginatorOrg: citrix.com

On 24/08/2021 15:27, Jan Beulich wrote:
> --- a/xen/drivers/passthrough/vtd/utils.c
> +++ b/xen/drivers/passthrough/vtd/utils.c
> @@ -106,11 +106,6 @@ void print_vtd_entries(struct vtd_iommu
>      }
>  
>      root_entry = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);

Seeing as you're actually cleaning up mapping calls, drop this cast too?

Either way, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> -    if ( root_entry == NULL )
> -    {
> -        printk("    root_entry == NULL\n");
> -        return;
> -    }
>  
>      printk("    root_entry[%02x] = %"PRIx64"\n", bus, root_entry[bus].val);
>      if ( !root_present(root_entry[bus]) )
>


