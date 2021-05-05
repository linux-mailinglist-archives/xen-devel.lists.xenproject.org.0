Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E8373853
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 12:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122957.231962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leEOV-0005Sy-Jr; Wed, 05 May 2021 10:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122957.231962; Wed, 05 May 2021 10:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leEOV-0005PO-Gm; Wed, 05 May 2021 10:04:39 +0000
Received: by outflank-mailman (input) for mailman id 122957;
 Wed, 05 May 2021 10:04:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTpK=KA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leEOU-0005PI-7c
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 10:04:38 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03aaa212-772d-4033-8ee3-88a76aec57bb;
 Wed, 05 May 2021 10:04:36 +0000 (UTC)
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
X-Inumbo-ID: 03aaa212-772d-4033-8ee3-88a76aec57bb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620209076;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MxJ5VTvESIL5Fmj/E1Zd8IgpWtP592ks+pd4juYkTXU=;
  b=eNWfFhS3wCbE7Q2IpB16kW7ZVheu5kdpn+ULpf1IEx9j24W3Cqi3mSH+
   D7+wKtgbW56F0unbZoeC2Qci2MVkrJLxm1NhVCs2TZ0N8F/XbK45aHoT3
   ngLmVHAEylGfFFT5q7GCxPR6vG8H6ZYO8hgbxLAhUFygewOQITnosWOCA
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XvV3tTP5rZgjrQgr1z12BlG6GuSl4GTb3XU4D3iD4KqSSUz7UACumwnxRUzn7hGlKk38dEFW/P
 Kz/9j7+k0sAKVX6OelCmamMiC0yjbZuq8Wr7sKB8FwTWPLTde2ENoxyy8/Tu+ESCOrLfDk38hp
 5vhDKYjTJcmnUxpVaHcBf2fzFSRy5tMVXVjE0Sx/jHlbjKDv+6Cw6bTfRXKiWVC280hOLQszJE
 NoOlQkkPry3IveUXwRjMk/chYPz50r0RDtL0qsKdgfQxubYthU0rVv+pglNoksiYxcMbe1VLrn
 exA=
X-SBRS: 5.1
X-MesageID: 43211373
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:i621cK4EdA/bQNVdZgPXwdKCI+orLtY04lQ7vn1ZYRZeftWE0+
 Wnm/oG3RH54QxhP00Is9aGJaWGXDf4/Zl6/YEeMd6ZLW/bkUGvK5xv6pan/i34F0TFh5tg/I
 pDU4w7Mt3/ClBmkd33iTPTL/8MyMSKmZrY4Nv24GxqSWhRBZ1IyydcJkKlHlZtRA9AbKBJYK
 a0wsZcvTKvdTA2Q62Adx04dtPOrdHKi57qCCRub3VKhzWmty+i67LxDnGjvis2bjJVzb8utU
 jDngDpj5/T0c2T9x7G22ffq6lRgdvqo+EzZ/Ckt859EFTRozftQL4kerWZ+Bgpvemk6T8R4a
 DxiiZlG/421lT8USWepwD31wzpzTA0gkWSsWOwsD/dodfkXnYBAcJHgo5VGyG112Mw+NVnlK
 5b1WOQsJRaSRnJmSj76tDSEwtnjUq5uz4jlvQPh3tUXc8fZdZq3Pci1VIQFI0fWCH37I1iF+
 VxFsTR+etbajqhHgfkl3gqxsetUHQ1FgqHRUZHutX96UktoFlpi1YdgMQE2m4a8p8gQYQB+O
 jeW54Y6Y1mX4sKaeZ0HqMbTdGqD3Gle2OxDEuCZUniUKkcf27Wp4Wy6Kwt/+e0dJFN1pc0lZ
 jbOWkoy1IaagbyDYmHxtlW6BzXBG65Wz7uxswb/ZR/t7HmLYCbQBGrWRQyl4+7pOgERtfeRu
 /bAuMlP9bzaXbrEZxEmwn3RpNSJXQEUMB9gKdFZ3ue5t/OIpfn8vfWaurXOdPWYEYZc3K6H3
 8KRjS2O8la9ECsXRbD8WvsZ08=
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="43211373"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRbZU3493m6g4w8SVJ52ZnZpjCGivz0yTy0Gewzc0HAaHR4hi8z0NimI81OP6TSEv7pafVIUyQGRGQYLHhkxnaabjxBmVolWMvibJPt11xDADmRW52CzxAz9qZkR1f2YCVSvoj1IjHcMjMDEPiCB3skCxnD2Q7KJaoizVd0BorHtRv/AkN52qgnM46n0Z1KH0iq6z0qVJ+PxWYoTtBKg7dE1YHj7DwtxvlMk5i9axH+2TkzHdwOEXJSUbEtzLdqrNgmqDAK5bUfhgPeg6GRn747yv5/vE6jBy5cqGM8C4Wh8v+DQrXT1qhzsHLnqT8qgmTaZEtekG8wQKXRZoS3oig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GfCaZebeokF8HQp/UuL/ytllX9RZLsOLOzN+/++ny8=;
 b=Cx5KlGXDVUxNOKJ/mA+0RrkJ9oxnmH3cOySyAzScqmS0yKsNgmrSV1BFYxh08rS3QjQZY08yaBoD8i1nCYauIHqBXHVhgqtClHSvkqBO0e/UeTcUDTxFLX5dbP5Q6QBwHwxpLHIqVRUmIIBQOaGpx8aGYeJkHZ3bhG3C93NgnP+8tBT066iXcxxz5PrURL91kgSzNcd6+R9lavo1Qn+96ByUoXu7HcA/6gT/K7z3sqtY+HMmI4IRXn3xU6pwmkLwcv5mMvCaK/zozIJJMtmGDSfVEA69UEid46hpUlBg3zRa8EGJ6EtTw7xDqrBFlomIj73WQpVdbkvRRWy8SDcr0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GfCaZebeokF8HQp/UuL/ytllX9RZLsOLOzN+/++ny8=;
 b=ba5HITzsq8a4kvallJHWZgS7vmdDQLx2i/n6TxZXMg+3YncATqR090Zu856DthMCL6yIuc8DEUWGnZqnai40yUQG/ayTUpXaEL6dTN1YeifEqwHFFy3TFedOZS5DLOMcyioLw2MxNZlIe+GrVohM4qb7GW77VOZ1bslUVNgqO0Q=
Date: Wed, 5 May 2021 12:04:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
Message-ID: <YJJtqyDOIkMxjvxW@Air-de-Roger>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210504213120.4179-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PR3P193CA0050.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e0aa724-ada0-46ab-f7d7-08d90fad2e02
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2923BD86D3661EEA8792A94C8F599@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rTUB8auUVp4Fuoixo+pTirzFJhVhyZuWQLfiUgtYGJsfCbESGOmBOiT56wH20gZRs9Cuc7MKQQEahfm98PQ5OZK19QweIXrI7mGR4pLSXlUPCxQP93jh2VhcHh3n2vaPdfNk99ETzLaNtX6wm+uTQU5qC0o0oku+uskR8GJk+ta+5Zb0FP4iTivV2vmwiupbsgQUn8YlDMUWk1f2sy2OpLtL5vWzos8unwWpCWGzooUC8Pn7nKI++Y1DwLIAfAMSaFI8wrm4po3VIojjEJQ5eqacjUtPJl+UdMEo5rrGbJW9B7lxRUWG9lLUKO9BT7o9dTjbZH5xs4u5Lj9RlgesYBQQOwMg6zQTMJ7/gi6PondSMhQltuc4yTEnHCd1Gtmz2zyC5on1691YS/zOwM0MnjdtfjUDh4U4oDOfkKi76W5HxjZX4okoqzY/Fk6se1QaV+1S1Mq4l7S8WbVrA1tnuUFSSgunCzp9D27WzCjrZnw+oSUpFRr09hewVV9l+smvmPmgIgeU9pQcYu0BOFsZo24k8O+Pt7FwG2g+1Wgp6caYXsVXBgvBkxCioDC+VtrY4MgzsG9iyKaoa1TMtq8VXg3z/ODzFBKuME6IwexktI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(39860400002)(346002)(366004)(376002)(136003)(956004)(26005)(316002)(9686003)(38100700002)(8936002)(6862004)(83380400001)(6496006)(4326008)(16526019)(6666004)(54906003)(86362001)(85182001)(478600001)(66556008)(66946007)(66476007)(5660300002)(33716001)(2906002)(8676002)(186003)(6636002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckpjSUlhelZUaU5iL3lGN3ZyRWhqR1FMTzdDcGJCNW1kSjVHTVZTSVdlekVj?=
 =?utf-8?B?Vi9zWFhqM25SSUVTQ3Q2SGUrN0xyS1VlaEJuQ0VIUUovek5uSmNLMkk3MGd0?=
 =?utf-8?B?NHF6azFyS0dMRDJCRi9pdVFKRjhzNzd6STU3OEN3ZDNMN1cwaVZNOUNjcHNi?=
 =?utf-8?B?L3hMTitGWitDTURPODNoMGo4a0h4cVF0bXdTSm9FVjJMMEswT05TcklFcU5m?=
 =?utf-8?B?OWFuT1VtK2dCRmVzWVZ3T1J4UVpVQTZPQUZGa0ZaQldUMUp1MFRjeFI5RjJ0?=
 =?utf-8?B?WHFic05mYUkvbjhFN0RGM2xSMFhCVjBJL2Q0Nm04cDhEbml6QzZpWnJDUzVZ?=
 =?utf-8?B?MFJIUkJUVmdpbHFvYzRCM2tLU2grWDNyUkNVVERhditseVY3MVZ0bkl0bEpw?=
 =?utf-8?B?K1pwQmZZM0laSEhVdWVtZG51NG13UloxbkhwMUFGMDdka21jQkN1Rjh1bDRt?=
 =?utf-8?B?SFgzU2R2V2tHaFlkU3ZaUHA0OElTOTh1K1hXQUNacDRDaVhENGFrU2FzMkpB?=
 =?utf-8?B?c01VWnFreElGR0NYVnpkVkxuVThGZnVkVjdjdS9ha2hQQ3FRaWN0UDFmVmtz?=
 =?utf-8?B?K3QvNytpeVN4Y0VxK3VEb0NlRnJ4Tkw1UjlZYUl1K2M4R0tLYUM2REZSc2pG?=
 =?utf-8?B?b2ROSGp3SThRQWV2aDBEc3FzOER3anJKOURTcE5FUjNDeDk3QVpWbll6K293?=
 =?utf-8?B?WTFmSFhLNVJKaEVicFh2cXN3MWtaUGhPeW4zbkZOUWJrZStPRlBxb0FyT21B?=
 =?utf-8?B?SjNaMDJJTElDYTFRSFpxanc3Z2l5QnpUMXk2c2YwZmplR1JGMnY5b292MElE?=
 =?utf-8?B?NjRJNEhuU0V2NjM2cUpLOUh0d1kxWDJBWWh0V2E0eUVXam5PQzFqWjN3TGx4?=
 =?utf-8?B?eS9pcjhlOEExcGdpTnVGcmVtM29xK09VdjBMbFlNWk85dnlKdFZPNHlSMEMy?=
 =?utf-8?B?dVNCUEI2ZkxwYXVaV1lsZU5mMEdPVzJWUVpXeldScGV6Z2VnSDNvVFF3Njg2?=
 =?utf-8?B?WkpESWtnelExeHh1S2FweXlycUVyd1R1V2NPeThtakhVdEVuZzdZRm92N0xD?=
 =?utf-8?B?Y1M3OHdVdDJzSlN0VXRlSW1nbzBpY2J3aFZOS1BBMlBCZk9oRzJ0aEI2bjdY?=
 =?utf-8?B?ZmVRNTVtL29SSU1hVXRlMURtQXBsQ3JNS0dtcXlSaXhULytnQ051ZXBHYmdi?=
 =?utf-8?B?T0RPUDA2aXNFalhLbWpibnUyVkxYZXJ3YnVJazkvU1NocFUxbncxSEs5enVG?=
 =?utf-8?B?alVYYk03Z1hUWmorS1NWbXNRRFRaRTBUVytPVy9yd3pLMXJuOUttOFMweTJO?=
 =?utf-8?B?L3BKM0orSnpPWnhUY0lLeG9qZ01SNk54eHBRS0xBNVNiY3NKVVI4Rm5uU1Zv?=
 =?utf-8?B?MFRtMElLR0FQMjlpNWdrVU85ZCtnaXJFV3NBSnlnUys1RWNZNlY0THdhU2VQ?=
 =?utf-8?B?NkkxR3lncnc5VzhuSC9BUDlscjZsNzZNR0c2dHhWSmgyTUZ0cnJ6MmVsMFFY?=
 =?utf-8?B?TVRJdjJtZXlEd0RkclBxdUlrRks1bVVFdWEzK1BleHorenpLdlpvVkkyTDdM?=
 =?utf-8?B?Q3ZGMzFOajAzRFNFL2l1dFZ1RnpwZDFuRWFka3ZZYXkvTjI4OEhmYnM1RmY0?=
 =?utf-8?B?aUY3UjlnNFd5RGxRTktwUVA5VE1RejFxNndReTI3QVZobHB1am5vblN0Tlo3?=
 =?utf-8?B?dGxlL3FXK3hBL09MZFBuYlcyVERnT3F2TkVjWHJ4TXNWZkNJQ0tJdUFPYnhE?=
 =?utf-8?Q?5vAjhBAgIaGPEip1p+7+tJbRgK+0ZccxIKp3OkK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0aa724-ada0-46ab-f7d7-08d90fad2e02
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 10:04:32.7402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfUoE4FwaSbkbs0MA94AYI6g3cFGrgZIWtYEzrbARG9WySFyE7OXoZDPz7Tu2WXtrh656q1vqrUySlIf22V10A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

On Tue, May 04, 2021 at 10:31:20PM +0100, Andrew Cooper wrote:
> Just as with x86_cpu_policies_are_compatible(), make a start on this function
> with some token handling.
> 
> Add levelling support for MSR_ARCH_CAPS, because RSBA has interesting
> properties, and introduce test_calculate_compatible_success() to the unit
> tests, covering various cases where the arch_caps CPUID bit falls out, and
> with RSBA accumulating rather than intersecting across the two.
> 
> Extend x86_cpu_policies_are_compatible() with a check for MSR_ARCH_CAPS, which
> was arguably missing from c/s e32605b07ef "x86: Begin to introduce support for
> MSR_ARCH_CAPS".
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  tools/include/xen-tools/libs.h           |   5 ++
>  tools/tests/cpu-policy/test-cpu-policy.c | 150 +++++++++++++++++++++++++++++++
>  xen/include/xen/lib/x86/cpu-policy.h     |  22 +++++
>  xen/lib/x86/policy.c                     |  47 ++++++++++
>  4 files changed, 224 insertions(+)
> 
> diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
> index a16e0c3807..4de10efdea 100644
> --- a/tools/include/xen-tools/libs.h
> +++ b/tools/include/xen-tools/libs.h
> @@ -63,4 +63,9 @@
>  #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
>  #endif
>  
> +#ifndef _AC
> +#define __AC(X, Y)   (X ## Y)
> +#define _AC(X, Y)    __AC(X, Y)
> +#endif

You need to remove those definitions from libxl_internal.h.

>  #endif	/* __XEN_TOOLS_LIBS__ */
> diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
> index 75973298df..455b4fe3c0 100644
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -775,6 +775,154 @@ static void test_is_compatible_failure(void)
>      }
>  }
>  
> +static void test_calculate_compatible_success(void)
> +{
> +    static struct test {
> +        const char *name;
> +        struct {
> +            struct cpuid_policy p;
> +            struct msr_policy m;
> +        } a, b, out;
> +    } tests[] = {
> +        {
> +            "arch_caps, b short max_leaf",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 6,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 6,
> +            },
> +        },
> +        {
> +            "arch_caps, b feat missing",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 7,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 7,
> +            },
> +        },
> +        {
> +            "arch_caps, b rdcl_no missing",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +            },
> +        },
> +        {
> +            "arch_caps, rdcl_no ok",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rdcl_no = true,
> +            },
> +        },
> +        {
> +            "arch_caps, rsba accum",
> +            .a = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rsba = true,
> +            },
> +            .b = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +            },
> +            .out = {
> +                .p.basic.max_leaf = 7,
> +                .p.feat.arch_caps = true,
> +                .m.arch_caps.rsba = true,
> +            },
> +        },
> +    };
> +    struct cpu_policy_errors no_errors = INIT_CPU_POLICY_ERRORS;
> +
> +    printf("Testing calculate compatibility success:\n");
> +
> +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> +    {
> +        struct test *t = &tests[i];
> +        struct cpuid_policy *p = malloc(sizeof(struct cpuid_policy));
> +        struct msr_policy *m = malloc(sizeof(struct msr_policy));
> +        struct cpu_policy a = {
> +            &t->a.p,
> +            &t->a.m,
> +        }, b = {
> +            &t->b.p,
> +            &t->b.m,
> +        }, out = {
> +            p,
> +            m,
> +        };
> +        struct cpu_policy_errors e;
> +        int res;
> +
> +        if ( !p || !m )
> +            err(1, "%s() malloc failure", __func__);
> +
> +        res = x86_cpu_policy_calculate_compatible(&a, &b, &out, &e);
> +
> +        /* Check the expected error output. */
> +        if ( res != 0 || memcmp(&no_errors, &e, sizeof(no_errors)) )
> +        {
> +            fail("  Test '%s' expected no errors\n"
> +                 "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
> +                 t->name, res, e.leaf, e.subleaf, e.msr);
> +            goto test_done;
> +        }
> +
> +        if ( memcmp(&t->out.p, p, sizeof(*p)) )
> +        {
> +            fail("  Test '%s' resulting CPUID policy not as expected\n",
> +                 t->name);
> +            goto test_done;
> +        }
> +
> +        if ( memcmp(&t->out.m, m, sizeof(*m)) )
> +        {
> +            fail("  Test '%s' resulting MSR policy not as expected\n",
> +                 t->name);
> +            goto test_done;
> +        }

In order to assert that we don't mess things up, I would also add a
x86_cpu_policies_are_compatible check here:

res = x86_cpu_policies_are_compatible(&a, &out, &e);
if ( res )
    fail("  Test '%s' created incompatible policy\n"
         "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
         t->name, res, e.leaf, e.subleaf, e.msr);
res = x86_cpu_policies_are_compatible(&b, &out, &e);
if ( res )
    fail("  Test '%s' created incompatible policy\n"
         "    got res %d { leaf %08x, subleaf %08x, msr %08x }\n",
         t->name, res, e.leaf, e.subleaf, e.msr);

> +
> +    test_done:
> +        free(p);
> +        free(m);
> +    }
> +}
> +
>  int main(int argc, char **argv)
>  {
>      printf("CPU Policy unit tests\n");
> @@ -793,6 +941,8 @@ int main(int argc, char **argv)
>      test_is_compatible_success();
>      test_is_compatible_failure();
>  
> +    test_calculate_compatible_success();
> +
>      if ( nr_failures )
>          printf("Done: %u failures\n", nr_failures);
>      else
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index 5a2c4c7b2d..0422a15557 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -37,6 +37,28 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>                                      const struct cpu_policy *guest,
>                                      struct cpu_policy_errors *err);
>  
> +/*
> + * Given two policies, calculate one which is compatible with each.
> + *
> + * i.e. Given host @a and host @b, calculate what to give a VM so it can live
> + * migrate between the two.
> + *
> + * @param a        A cpu_policy.
> + * @param b        Another cpu_policy.
> + * @param out      A policy compatible with @a and @b.
> + * @param err      Optional hint for error diagnostics.
> + * @returns -errno
> + *
> + * For typical usage, @a and @b should be system policies of the same type
> + * (i.e. PV/HVM default/max) from different hosts.  In the case that an
> + * incompatibility is detected, the optional err pointer may identify the
> + * problematic leaf/subleaf and/or MSR.
> + */
> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
> +                                        const struct cpu_policy *b,
> +                                        struct cpu_policy *out,
> +                                        struct cpu_policy_errors *err);
> +
>  #endif /* !XEN_LIB_X86_POLICIES_H */
>  
>  /*
> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index f6cea4e2f9..06039e8aa8 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -29,6 +29,9 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>      if ( ~host->msr->platform_info.raw & guest->msr->platform_info.raw )
>          FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
>  
> +    if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw )
> +        FAIL_MSR(MSR_ARCH_CAPABILITIES);

It might be nice to expand test_is_compatible_{success,failure} to
account for arch_caps being checked now.

Shouldn't this check also take into account that host might not have
RSBA set, but it's legit for a guest policy to have it?

if ( ~host->msr->arch_caps.raw & guest->msr->arch_caps.raw & ~POL_MASK )
    FAIL_MSR(MSR_ARCH_CAPABILITIES);

Maybe POL_MASK should be renamed and defined in a header so it's
widely available?

> +
>  #undef FAIL_MSR
>  #undef FAIL_CPUID
>  #undef NA
> @@ -43,6 +46,50 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>      return ret;
>  }
>  
> +int x86_cpu_policy_calculate_compatible(const struct cpu_policy *a,
> +                                        const struct cpu_policy *b,
> +                                        struct cpu_policy *out,
> +                                        struct cpu_policy_errors *err)

I think this should be in an #ifndef __XEN__ protected region?

There's no need to expose this to the hypervisor, as I would expect it
will never have to do compatible policy generation? (ie: it will
always be done by the toolstack?)

> +{
> +    const struct cpuid_policy *ap = a->cpuid, *bp = b->cpuid;
> +    const struct msr_policy *am = a->msr, *bm = b->msr;
> +    struct cpuid_policy *cp = out->cpuid;
> +    struct msr_policy *mp = out->msr;
> +
> +    memset(cp, 0, sizeof(*cp));
> +    memset(mp, 0, sizeof(*mp));
> +
> +    cp->basic.max_leaf = min(ap->basic.max_leaf, bp->basic.max_leaf);
> +
> +    if ( cp->basic.max_leaf >= 7 )
> +    {
> +        cp->feat.max_subleaf = min(ap->feat.max_subleaf, bp->feat.max_subleaf);
> +
> +        cp->feat.raw[0].b = ap->feat.raw[0].b & bp->feat.raw[0].b;
> +        cp->feat.raw[0].c = ap->feat.raw[0].c & bp->feat.raw[0].c;
> +        cp->feat.raw[0].d = ap->feat.raw[0].d & bp->feat.raw[0].d;
> +    }
> +
> +    /* TODO: Far more. */

Right, my proposed patch (07/13) went a bit further and also leveled
1c, 1d, Da1, e1c, e1d, e7d, e8b and e21a, and we also need to level
a couple of max_leaf fields.

I'm happy for this to go in first, and I can rebase the extra logic I
have on top of this one.

Thanks, Roger.

