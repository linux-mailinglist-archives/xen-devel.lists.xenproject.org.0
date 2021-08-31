Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4117E3FC838
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175746.320057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3o2-0003mB-75; Tue, 31 Aug 2021 13:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175746.320057; Tue, 31 Aug 2021 13:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3o2-0003k1-2Y; Tue, 31 Aug 2021 13:28:02 +0000
Received: by outflank-mailman (input) for mailman id 175746;
 Tue, 31 Aug 2021 13:28:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH2E=NW=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mL3o1-0003jv-DU
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:28:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42438355-0a5f-11ec-ad3d-12813bfff9fa;
 Tue, 31 Aug 2021 13:28:00 +0000 (UTC)
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
X-Inumbo-ID: 42438355-0a5f-11ec-ad3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630416480;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9UjyaBSsu4YPA52L+tWSmglh1o92FHJkd9WeFpo9ENg=;
  b=IigPse4JpshggWMVtoxpaCDCGBR/mo8+A1RhrGeMVZz1dJgQGDBjWkZi
   99GbpUOtqaxqpX2DpHLRcmX9LBAackbEw0cmaejO4Sa9cDn14fpsL7+JL
   ucsRhfcBACRm+BLQnZynxzXKkjqInQxHUnrCUgrdW7oAlIWG45ZeQ8Fne
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MwIa6lkkHwHt+hBFLgabAp+wWEZowpD1gk3/IynmNbXKg5e/KhRkarV4yR9AgkpHouCOgdasiM
 LEigp60vft4pyG1GF47e4332nwe74Wn6NEx+6+v76G5uxpFfAsM4lPct6n4RWbpqR95pg1CJMj
 cP0WoeagQEHHIjStoA50Dckr8bcxB+DlTr+A1Rx4ufm4VUfAHsZp8FTqkfAbcSF3IQnxTC/hR6
 Y/fuBrRjOU4SuGIBDFajUufsgKo26XVxhhU0/F9kpxNK5eUsK74wstNK9KV2tIUrq3ncbsn9de
 r6F8TF+p6vHLturd9c3/68XQ
X-SBRS: 5.1
X-MesageID: 51690677
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:z3tvuqr5+Qto7gtgs0kUAZoaV5ulL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBbhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFJSWTeeAd2SS7vyKkDVQcexQueVvmZrA7Yy1rwYPPHNXguNbnmNE426gYzxLrWJ9dPwE/f
 Snl6h6TnabCA8qhpPRPAh6YwGPnayFqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU811rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxz75xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwthrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGbgoBW+q3pYp0PJGbAfqBb0fbllQS+3UoJj3fw/fZv20vpr/kGOsB5D4
 2uCNUaqFlMJvVmJp6VSt1xGfdepwT2MGTx2VmpUCDa/Zc8SjrwQq7MkcAIDd6RCes1JbsJ6d
 n8uQBjxCIPk3yHM7zG4HQMyGGXfFmA
X-IronPort-AV: E=Sophos;i="5.84,366,1620705600"; 
   d="scan'208";a="51690677"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvSrDu75WliPtqyh2g3GAmDJx3HTqLu90ZmoKBDZdjpaugV9mGykOQLJpusCv2U1KD/SB4jIKKC5xLtDmYNQe6z9qSYwcF99nBBU+709Gfh8mXY8TBJpgzPpjmuY5cbdGBjurvUyUihIMmOFzVjLKIhdbqki6xJwrN6QQfETPtRk514wWeUxOodpiBwrUL8j5vAknhR3+fdEK+4T/9KnIiBmUEGaXVWl/n8wIgLbZ+7VZAU4u+fDjX/oBQb9cYtcWvF29TDzR/Clc00iQn1jhEytH/LerrdU2+q2ir2zPzulqjdljP6kwDcYBGTv0xvdaOhSGL7EW7N80dng5HWx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ia1kB0C85GHc1LlulK+3kx3ilzfPvMweUNMVqRuPZ9w=;
 b=c5+JkuRYcbEvfniyDhTBwreQ4eIZ0tqxVrtYqlBOZM3zFnA5XYVJKLT/lg1Axs4KodcZOeWea8iSAHPhVndcqWfGKVNnoMQLXSOzl6fY4JeGpuAXBeBcXZHHdXCgwM+ezSjcnaF1Mp2f7w/8JAOUAEBStI1/aGPZNIklM3acK9bw4/G5s8KRd0oL5K2Qm6BnHiwafVtipYiVxSm05S5YeaIVrRbGDgemzt/4PoN062+ZXbB5mTuqYFu36Y+wLNdZwi1PuhFvgHZwwApO8IjxmvD3pKzuKhQ3oudlesFwqI3MHmf2ikO4BuFLDOgz8fit8dSPe2t6cOi089Qd8kR7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ia1kB0C85GHc1LlulK+3kx3ilzfPvMweUNMVqRuPZ9w=;
 b=PS/lYVWY1SneTaChXQuvC0NZNJE8kubIeqC+oc8TCVQgvO4QL22iwb7wctJU60W760czC+YP7mP7XhgbDheIP0JGFYlTiYS2lo0e0UtHfncJ5YdygMINm7T9AJVpTh4BKutrBOP8s/OPQEvw5C3ychBF9AfV2Mz7Rjia0m/myHo=
Subject: Re: [PATCH 1/4] x86/PVH: de-duplicate mappings for first Mb of Dom0
 memory
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <013c49f5-7a14-9d9e-4d25-75934bf6349f@suse.com>
 <9cfc122f-dc4e-9dc0-0b57-48abf941025a@citrix.com>
 <866a3677-1f1a-e0e5-7ab0-10c210e25610@suse.com>
 <2265ca67-2a30-a858-38ba-a6343782929e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2ef761cf-e609-e0df-e360-9e904f5ad9a2@citrix.com>
Date: Tue, 31 Aug 2021 14:27:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <2265ca67-2a30-a858-38ba-a6343782929e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64fc5d37-e797-405b-6298-08d96c832524
X-MS-TrafficTypeDiagnostic: BYAPR03MB3495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB349551846528EE3753A994F0BACC9@BYAPR03MB3495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0XTPDUdfP57oSEX0mLZdwQ9vEwD8Vd+3NAW9oeS4nvdOzT6GH9c86SRmGoF2EkkGo7NSJxx2w/ZcL/FhXBE2+OAtfHwj7sBIVG3A3Md+rsCy4DNLErog1nuRdg2KejA5qauHL2+lESiX2JjQSmEidiNKlZG5MCBvTQx1uf01fXBHnsjQV05UlidAbQjguAQJ5R1Yi76SomNKUXkyT/bSdhYnG9D/Tr6F8z+jR/Vsnd6+jKn+3yKBSC1H8iGFVWcYCgip15FzJ5DDYQI7rSQWoOHvOXohOeAV98HDkA5mDiqUfc3+/vGWFN3JSBoMm7nN2e0MtKcRGhrkG2nSMRFd4j7f1u/irZdcDkPCxjK1gOIrg1Q64qd9oAY8KJboqh82E9s1lD1lSSbdpvohyutF2CT7OUCGwzHw4xmnotM+7eGRwCeyi2p3bAJZLMZ61jXntiAu0AXfaxztdP6ytqE27WDUGOXQLjPKGCLutJ0rWCJj6ANqVNXPP68RZP18Q53shq1Qr/fetmlVwQAXfwB07FJazOrZ+Lw7hQBL9kEj73sSujrITnVpnH02UerUjQa3SxFh76A58Y3nBF7pV179FxBLbuHTBsox5zarmUMTQqKBySnUUtuPaTxa4sd/QANK6GSgvsztCUU1lKVDGnoNwV2A8x9dgxiO2gUakOq42p4toFHNwtF9i/tARoEY90Ep52264EplceSUl68WGoHofBm0hiWd5nxsMw9TiowvqZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(31696002)(8936002)(86362001)(8676002)(6666004)(53546011)(55236004)(6916009)(2616005)(956004)(508600001)(38100700002)(316002)(16576012)(186003)(2906002)(31686004)(26005)(66946007)(5660300002)(4326008)(66556008)(66476007)(6486002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2FKSHFoVytHcTdwdUVHY1VPR1FrQnYvd1hreFBlZFVybEgzNlNuOEVOL0Uy?=
 =?utf-8?B?c2RVMU1VYnVZUUJJdUpSQXdpd1p4T1ZyT1JNSXh6ci9qclhTYUxzdUQvMEtN?=
 =?utf-8?B?akN4dG5wdzZTR2kxUzdPVmZHZGV0dWV3RC84eDNtMEVSbHNEdEszZmpsZWFk?=
 =?utf-8?B?a21JYkVhR3Z5VGRMWXBRdlJlR1h3SWtVQk84ZnR1VFFVeVU0LytzMzBZNFJo?=
 =?utf-8?B?RUhGZGc4Smx0VjFIVGZJT3VxN01TL0FiR1lQZ0FIL2Y1UlcvcVpwRi9qeFVM?=
 =?utf-8?B?b0txaklwZzdUbU45cG9uekJVZEhCMHJ2bFluVjFYWm1jZHJ4WlFWUC9HeEt6?=
 =?utf-8?B?dTV2R0cwcWx1K2dkbk5GdkhNd1NqRjIzd3RpR1dvRVYzZFE2S002UUY2M0Rm?=
 =?utf-8?B?TElucEFQRHBDUkhHSHdkV2VIWkVkQzFoOHpwYnpRaVFuZ1ZOeVhMWGdXQThM?=
 =?utf-8?B?WFVnOXR6Q3hwUGdwQlB3SHh3QlQ0QjczcWFVSE1FaVB3ZU5BU21uelFvMVp1?=
 =?utf-8?B?eDlzdUdzWWU4YWFjcmJibHc1M2RZSlM5Qm8yM0tKamRETlFYQmhCU09YcjYr?=
 =?utf-8?B?QjR2OGVOZnNZQ0JNRWc4NmtGZHJ1WkN0aFh5aDIvWjVoektvVllUMWFnWlYr?=
 =?utf-8?B?T1FjRzVkWWRiM0p3OWQ0RURyRFpzRGtFSXNLYnVFTy9OTzg5SlllTEhQOE80?=
 =?utf-8?B?Z2Y3YmpCSEhoQ01PdzU5RVluTXZYUGlraWdZVTA4YVhPeE91S2drcDdCaUtr?=
 =?utf-8?B?U2FJRkVWaDVKZno1dFpSRnMydFdSREdZUFhZT0J1dk1SYkZHajlKREhNSmor?=
 =?utf-8?B?eUNHVFVpUXFOKzVaRGU1LytwMFFPeHArTXVhSnM5SXV2ZGgzelBSYm9OYUNO?=
 =?utf-8?B?U3RjaU5VcWxaeHZIWitJNGtGcTlJc3ppSUJrUjRxeksyK1JsWUlyaXJNTng2?=
 =?utf-8?B?YUJWMDlFalZyOXpwWHl6RVBJZmx0Uy9PVjRUaUEzaWxCNjVLVmltUXdPeHJX?=
 =?utf-8?B?RFlYc2EyT0l4dC9LVjIyWkkrQlAxeWdQMUQ5THZqVUtzNU95RnFzcWRkUnlm?=
 =?utf-8?B?ZTBka3hZK0hTNlJJNHhqWENtVmlWOVM5eDNYblBHZkROQ1JRUWdyTVB5U1dk?=
 =?utf-8?B?Q2FuRWE2TnNpSFl1UTFUaXpFVXB2OWdMOThRN2RkY1BzTjFzODZvbFBZT09m?=
 =?utf-8?B?N09semQxczlDaFhTdmxGb20vVkdYd2NSK1I1UU8xbGNqRWIzQjNRM0hHUUxL?=
 =?utf-8?B?ZElaYWhsbjNDdnJMQlgyN1pVOXVBeWJMK1cyaG5YSW9YaWgva2xLOEtsTWxx?=
 =?utf-8?B?S3ZCdXQvUVY0Ym5wc0phOVpuYmd3cDFZZlRDdUo3VGNPOFZnVmswRUFQUy84?=
 =?utf-8?B?Zis4bytMQ0t3Slh0NU0zTTZXQzkzKzJDeFZ2aEZhN240cVZuTy9kOGwwZ3c1?=
 =?utf-8?B?MGFXdDd6a2FoT2pybzVNVEszNjk5NjU0enlCWDJoYXBNYlAzZVdZS0cyenZj?=
 =?utf-8?B?cElweXRPa0t1MWJtaTFkQmUvQjR3VGVmNDFQUzFCVklBM2Y0YVBjRDczajhm?=
 =?utf-8?B?Y1g1RFk2SE10d3dWVUxpRGtMY3JwZG5XNTdBSEswZUZianlyZnI5YjJhZW9y?=
 =?utf-8?B?ZURwa2lMZ1dBRGtBc284ZVJ3S3VRUENlMUVscXZJdUtuV0szaG90ekZ1NG1H?=
 =?utf-8?B?RXM3MWU5cVg1Qk5ZL0xqNUZ1eXVvODBFWFltZ0prUXlHQnpUSTROQlFDRlh1?=
 =?utf-8?Q?SXdi+9Np1PuEaQBrUSKvmbii8H+m9fQcuTHvCNo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fc5d37-e797-405b-6298-08d96c832524
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:27:57.0492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TMBd8KILGdqm9krhMf4hMXU/5vXbrO0Jcmc/5tmZk9ccQhgsFaFTGr6rVc7RGsX+QMeldd3xOucjAwH5YRX4HqqR5JCI6UF7LddfEH9W4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3495
X-OriginatorOrg: citrix.com

On 31/08/2021 14:19, Jan Beulich wrote:
>>>> @@ -1095,6 +1101,17 @@ static int __init pvh_setup_acpi(struct
>>>>          nr_pages = PFN_UP((d->arch.e820[i].addr & ~PAGE_MASK) +
>>>>                            d->arch.e820[i].size);
>>>>  
>>>> +        /* Memory below 1MB has been dealt with by pvh_populate_p2m(). */
>>>> +        if ( pfn < PFN_DOWN(MB(1)) )
>>>> +        {
>>>> +            if ( pfn + nr_pages <= PFN_DOWN(MB(1)) )
>>>> +                continue;
>>>> +
>>>> +            /* This shouldn't happen, but is easy to deal with. */
>>> I'm not sure this comment is helpful.
>>>
>>> Under PVH, there is nothing special about the 1M boundary, and we can
>>> reasonably have something else here or crossing the boundary.
>> As long as we have this special treatment of the low Mb, the boundary
>> is meaningful imo. I'd see the comment go away when the handling in
>> general gets streamlined.
> I should have added: And as long as Dom0's E820 map gets cloned from
> the host's, which will necessarily consider the 1Mb boundary special.

Not when you're booting virtualised in the first place.

~Andrew

