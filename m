Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBF02AF295
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 14:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24813.52244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcqZC-0005HJ-S3; Wed, 11 Nov 2020 13:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24813.52244; Wed, 11 Nov 2020 13:53:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcqZC-0005Gu-OI; Wed, 11 Nov 2020 13:53:42 +0000
Received: by outflank-mailman (input) for mailman id 24813;
 Wed, 11 Nov 2020 13:53:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcqZA-0005Gp-Fj
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:53:40 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ffca2e2-c609-4480-a404-f064441d832a;
 Wed, 11 Nov 2020 13:53:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcqZA-0005Gp-Fj
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:53:40 +0000
X-Inumbo-ID: 1ffca2e2-c609-4480-a404-f064441d832a
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1ffca2e2-c609-4480-a404-f064441d832a;
	Wed, 11 Nov 2020 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605102817;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=s7GADPMuX+5dnG3XHhS/bZMNGeV5Q+BVd7ateJZ9dIE=;
  b=gjjhBjcVdRyuweG5ROYFG8x+1vgxK/t1SMBlviujWbMKuwbonuqemtBR
   aWLDVe3xWvUXsxjeTOUC/aKyd1DiFx+ujvXK87844nksBB81i1sy/Y+aQ
   c5cNY6gsn1WuMHU+9q7ZD3xRvGQqw2R72lNSpZv//jKUuUEhKQKn0vjWv
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ArzrObgGqgom4xBXLD0HJo0NY9E0b/Qn2b8/+qcKqT8NDa46k38wD1/XF5TDu4Zku8VTSD+U5y
 FpXbTetvAef2I3tJINvtA3iT8aXJMhuLziKWU7fZMXKeWG9RfMRrS3YD1lQIMkRaYSQEIH/5Hs
 eD+NnF9oW/kgVblymbmoXvZhVpxvOCFKXEANLdsp2wEdXcI2dA8OszEQP+vdXxV2B+UAstR/HQ
 W2cefDc1BMyC1W3qhXTeyCu7iNMMNRolZyEYCst3K8sbcdQbXWbofye9lBSHvebxkoZAIX8DbJ
 Uog=
X-SBRS: None
X-MesageID: 30950451
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="30950451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewhhqSNFD4j6N5fZFDKOt8Cr5T3A1BlSNAstsFtP5yE76++Zu4ynlg+C23nLKza5c0PWVab7tNDrBtthqmoUSZ1+QZfvy6L9T63a8lFWSt8deg2S8BnnCicGiLM3kg8w+wK2J9ZZ78JYtdHMRaSBsUu4y9skGXhrtyOReMNW+fbK7CHetD85tC6ftABzO3NV0VoSZONmXVsz0KASWIJG95/23oJod4bOwF4j3LFx/isGaEhGampxFA6k0agnzc65/p40+EFYfqDtyRyMu3McW6+5COtCi2ePuWN63EpViogU+Lof9KJN6qNB7NCm3fOBbmB2dBXc+clHXoxHX3FaKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9cJz6XwcErQ0xHf7S8M9fazWnhdd+c0LFstrN7FQhU=;
 b=hNZ6Bfe7kLHYOiT5MvxQI2xMvvgwTFA3nKJqV+pwCwNo8wPMTlqrGnDnuqYzJ2OgKRfY3XGsNmTcd4fOjRKVOxY2fE23nryhw9w4sXEoMvcV69YVm8sqwhpsB2yboNfcPrRHk2FBpmSxSxYMg0vGotjoQW4Vj+8OIEc9Q/eEoMZrQI5w9A4mfRjNluPzg5qR1G4BcBdu/XqDwAslGmHcEVZ3QWESR34X/T57mGMMOHTjbBdEGNhld5pfEFWlLBuoShkkj64J63yWsPPzxIucDG2F5X2yDDK+hn8WI3kifDrhBJ6RiSeaiOY3Ia1TKVlSNm0X4XEcOcQ4vQ1dZ3zKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9cJz6XwcErQ0xHf7S8M9fazWnhdd+c0LFstrN7FQhU=;
 b=sja55hRu5T8An/IigONAQV9blt9D+jqyN+CCZhC1P16vNVluTNK85zoVOHhjEHT06xthAoN83QdSaW4+dYk0ads+ZDY4KdaYCMcdum2wtPp+18s+1SPhyVt3WSswjuuy3jLX9gqDvJAbdgebKBfINS5VTUQQJhRuJITPKobkE1w=
Date: Wed, 11 Nov 2020 14:53:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <Rahul.Singh@arm.com>, <Bertrand.Marquis@arm.com>, <julien.grall@arm.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 02/10] arm/pci: Maintain PCI assignable list
Message-ID: <20201111135311.6jhskiss2qswm3zp@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-3-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201109125031.26409-3-andr2000@gmail.com>
X-ClientProxiedBy: LO2P265CA0467.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 409dcb7e-5184-4593-b6b4-08d8864923e7
X-MS-TrafficTypeDiagnostic: DM6PR03MB4393:
X-Microsoft-Antispam-PRVS: <DM6PR03MB43930809E9D0CDC2D397C9AD8FE80@DM6PR03MB4393.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQ2jObB//qMYfiqExDyXwjkxV5RpTl/bHAko1s61KCTKOrt35XPEhpD8H6ey9GSBsl51zMhSN10pDS0NzWmbXnrUtBi27akvVQ9jN8g+J+5u0lVBOU5hAVzFfUPPCMCfOmgoduMLYN+AfLtYUz6//A/pgcuvKJ33lEZaiGq8PHbO7Nx9bi9eIRglnIzPK+EK563Zxwh1me+youZt/0gfZz94Wh5rxA7yFD7pcRQJILufNEhfOjdB4rgzKVYcuXXlEEaxYTsDafR4RyhewXfZE/GX6ZhjM2jKJ8TR5AU03qazVdTcfJMAoZ35aCGdcthLpaABqC2/CAqjLHU+KF2sUfwDVwD+s+1erPMGJ4QfyCEBh5XJEtU/OO5EILyEADAx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(8936002)(66946007)(1076003)(7416002)(6496006)(8676002)(316002)(83380400001)(6486002)(4326008)(5660300002)(30864003)(6666004)(2906002)(6916009)(33716001)(9686003)(16526019)(66476007)(26005)(66556008)(86362001)(186003)(956004)(85182001)(478600001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: tACZ8qX7+RinWfvFc5EHCJFvXt8uPKWabKjd7++k4WmqkoHQb4ic7dXLiIS5Qqow8v0+EvkD6c4lMQC0JfAYnIDnukUPUG1C4Qy93LQMkrT2ZWUNTFTgniqGb11jd69qAhgD2vrhU6moQL/XRrH/1n62Dud+vLmt5KpjBvkZhp/hnlmGmPmtmyO6MPlrLHW115HJ4ol042o/IcCuLH93KiOo5PS85NZN5f12oJ6HjXCuShUoXv3oxI9y8JxJivOlg7oI/bhjdI8Txy0wJ3SZUfFx1DyQ4aKFD0RjBpF+HeVTXFHZ89MA/TCl1diJBLx9p+ZvtDyUafuYUBRCI0ELVdKUaOEsQhaXRsvtTLmaIimm5p4monnhGvuIp+ZN1usQVtpMLvoxbi+/wbS9v39CziGhmBQWOIVzyDcz6rBNMj1AWgcrC1j6fNde04Hoa+t7KuU8cobNOUJrD4MKni+NaMDbrxxSITEmoIOJ+dlFWoVo2yaPpv/E0poeTN0rBy4Ae6m9QloOUKpME6BlIAc0b2v98cU+fgZzV49L29cstgSNyYioHc74pcFjOOTIuAaffAa3bg+uJCYn6mE60iG3ekidp7xetmoKAJuPenL3dc+fdmWaAUeFjV2vuHyD5oFx+i2+XJwdWfZIkH9pezdMvR30PT0W5xCdkcc/hM/t0E5Q4SX6h3iuacaO2agpivw0XL+EirFpgQtpBvdnyJM7YdM9X++MSajbt8wwRVzWgtJWicLMYvhxfgXefHRFpd3a6APiAf9ow5HlV1YvzVN1z9vyBHn2ZKdDTtYeD0vTFNZBMM7b6wRtilXPI+wNnPQkhFLZcYVo4Bt0SuN3HjhyJYjlfglGN3PWvbyBwwJZBlR2pc482FRRX2muCXMJxns5/VPPHbZ1TSQQr/ax+hLyPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 409dcb7e-5184-4593-b6b4-08d8864923e7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 13:53:16.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCd57n63qsyd/HwfLS1drd4057++KFMlcE5Y6J0bNLBO8MetUGo8cHYchp1IFrWMYr5sRsNdBQWP3Kaw1flPDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4393
X-OriginatorOrg: citrix.com

On Mon, Nov 09, 2020 at 02:50:23PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> The original code depends on pciback to manage assignable device list.
> The functionality which is implemented by the pciback and the toolstack
> and which is relevant/missing/needed for ARM:
> 
> 1. pciback is used as a database for assignable PCI devices, e.g. xl
>    pci-assignable-{add|remove|list} manipulates that list. So, whenever the
>    toolstack needs to know which PCI devices can be passed through it reads
>    that from the relevant sysfs entries of the pciback.
> 
> 2. pciback is used to hold the unbound PCI devices, e.g. when passing through
>    a PCI device it needs to be unbound from the relevant device driver and bound
>    to pciback (strictly speaking it is not required that the device is bound to
>    pciback, but pciback is again used as a database of the passed through PCI
>    devices, so we can re-bind the devices back to their original drivers when
>    guest domain shuts down)
> 
> 1. As ARM doesn't use pciback implement the above with additional sysctls:
>  - XEN_SYSCTL_pci_device_set_assigned

I don't see the point in having this sysfs, Xen already knows when a
device is assigned because the XEN_DOMCTL_assign_device hypercall is
used.

>  - XEN_SYSCTL_pci_device_get_assigned
>  - XEN_SYSCTL_pci_device_enum_assigned
> 2. Extend struct pci_dev to hold assignment state.

I'm not really found of this, the hypervisor is no place to store a
database like this, unless it's strictly needed.

IMO the right implementation here would be to split Linux pciback into
two different drivers:

 - The pv-pci backend for doing passthrough to classic PV guests.
 - The rest of pciback: device reset, hand-holding driver for devices
   to be assigned and database.

I think there must be something similar in KVM that performs the tasks
of my last point, maybe we could piggyback on it?

If we want to go the route proposed by this patch, ie: Xen performing
the functions of pciback you would also have to move the PCI reset
code to Xen, so that you can fully manage the PCI devices from Xen.

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  tools/libxc/include/xenctrl.h |   9 +++
>  tools/libxc/xc_domain.c       |   1 +
>  tools/libxc/xc_misc.c         |  46 +++++++++++++++
>  tools/libxl/Makefile          |   4 ++
>  tools/libxl/libxl_pci.c       | 105 ++++++++++++++++++++++++++++++++--
>  xen/arch/arm/sysctl.c         |  66 ++++++++++++++++++++-
>  xen/drivers/passthrough/pci.c |  93 ++++++++++++++++++++++++++++++
>  xen/include/public/sysctl.h   |  40 +++++++++++++
>  xen/include/xen/pci.h         |  12 ++++
>  9 files changed, 370 insertions(+), 6 deletions(-)

I've done some light review below given my questions above.

> diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> index 4c89b7294c4f..77029013da7d 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -2652,6 +2652,15 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
>  int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
>                           xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
>  
> +typedef xen_sysctl_pci_device_enum_assigned_t xc_pci_device_enum_assigned_t;
> +
> +int xc_pci_device_set_assigned(xc_interface *xch, uint32_t machine_sbdf,
> +                               bool assigned);
> +int xc_pci_device_get_assigned(xc_interface *xch, uint32_t machine_sbdf);
> +
> +int xc_pci_device_enum_assigned(xc_interface *xch,
> +                                xc_pci_device_enum_assigned_t *e);
> +
>  /* Compat shims */
>  #include "xenctrl_compat.h"
>  
> diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
> index 71829c2bce3e..d515191e9243 100644
> --- a/tools/libxc/xc_domain.c
> +++ b/tools/libxc/xc_domain.c
> @@ -2321,6 +2321,7 @@ int xc_domain_soft_reset(xc_interface *xch,
>      domctl.domain = domid;
>      return do_domctl(xch, &domctl);
>  }
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libxc/xc_misc.c b/tools/libxc/xc_misc.c
> index 3820394413a9..d439c4ba1019 100644
> --- a/tools/libxc/xc_misc.c
> +++ b/tools/libxc/xc_misc.c
> @@ -988,6 +988,52 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
>      return _xc_livepatch_action(xch, name, LIVEPATCH_ACTION_REPLACE, timeout, flags);
>  }
>  
> +int xc_pci_device_set_assigned(
> +    xc_interface *xch,
> +    uint32_t machine_sbdf,
> +    bool assigned)
> +{
> +    DECLARE_SYSCTL;
> +
> +    sysctl.cmd = XEN_SYSCTL_pci_device_set_assigned;
> +    sysctl.u.pci_set_assigned.machine_sbdf = machine_sbdf;
> +    sysctl.u.pci_set_assigned.assigned = assigned;
> +
> +    return do_sysctl(xch, &sysctl);
> +}
> +
> +int xc_pci_device_get_assigned(
> +    xc_interface *xch,
> +    uint32_t machine_sbdf)
> +{
> +    DECLARE_SYSCTL;
> +
> +    sysctl.cmd = XEN_SYSCTL_pci_device_get_assigned;
> +    sysctl.u.pci_get_assigned.machine_sbdf = machine_sbdf;
> +
> +    return do_sysctl(xch, &sysctl);
> +}
> +
> +int xc_pci_device_enum_assigned(xc_interface *xch,
> +                                xc_pci_device_enum_assigned_t *e)
> +{
> +    int ret;
> +    DECLARE_SYSCTL;
> +
> +    sysctl.cmd = XEN_SYSCTL_pci_device_enum_assigned;
> +    sysctl.u.pci_enum_assigned.idx = e->idx;
> +    sysctl.u.pci_enum_assigned.report_not_assigned = e->report_not_assigned;
> +    ret = do_sysctl(xch, &sysctl);
> +    if ( ret )
> +        errno = EINVAL;
> +    else
> +    {
> +        e->domain = sysctl.u.pci_enum_assigned.domain;
> +        e->machine_sbdf = sysctl.u.pci_enum_assigned.machine_sbdf;
> +    }
> +    return ret;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> index f3806aafcb4e..6f76ba35aec7 100644
> --- a/tools/libxl/Makefile
> +++ b/tools/libxl/Makefile
> @@ -130,6 +130,10 @@ endif
>  
>  LIBXL_LIBS += -lyajl
>  
> +ifeq ($(CONFIG_X86),y)
> +CFALGS += -DCONFIG_PCIBACK
> +endif
> +
>  ifeq ($(CONFIG_ARM),y)
>  CFALGS += -DCONFIG_ARM
>  endif
> diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> index b93cf976642b..41f89b8aae10 100644
> --- a/tools/libxl/libxl_pci.c
> +++ b/tools/libxl/libxl_pci.c
> @@ -319,6 +319,7 @@ retry_transaction2:
>  
>  static int get_all_assigned_devices(libxl__gc *gc, libxl_device_pci **list, int *num)
>  {
> +#ifdef CONFIG_PCIBACK
>      char **domlist;
>      unsigned int nd = 0, i;
>  
> @@ -356,6 +357,33 @@ static int get_all_assigned_devices(libxl__gc *gc, libxl_device_pci **list, int
>              }
>          }
>      }
> +#else
> +    libxl_ctx *ctx = libxl__gc_owner(gc);
> +    int ret;
> +    xc_pci_device_enum_assigned_t e;
> +
> +    *list = NULL;
> +    *num = 0;
> +
> +    memset(&e, 0, sizeof(e));
> +    do {
> +        ret = xc_pci_device_enum_assigned(ctx->xch, &e);
> +        if ( ret && errno == EINVAL )
> +            break;
> +        *list = realloc(*list, sizeof(libxl_device_pci) * (e.idx + 1));
> +        if (*list == NULL)
> +            return ERROR_NOMEM;
> +
> +        pcidev_struct_fill(*list + e.idx,
> +                           e.domain,
> +                           e.machine_sbdf >> 8 & 0xff,
> +                           PCI_SLOT(e.machine_sbdf),
> +                           PCI_FUNC(e.machine_sbdf),
> +                           0 /*vdevfn*/);
> +        e.idx++;
> +    } while (!ret);
> +    *num = e.idx;
> +#endif

I don't think the amount of ifdefs added to this file is acceptable.
If we have to go that route this needs to be split into a different
file, and maybe some of the common bits abstracted together to prevent
code repetition.

>      libxl__ptr_add(gc, *list);
>  
>      return 0;
> @@ -411,13 +439,20 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
>  libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
>  {
>      GC_INIT(ctx);
> -    libxl_device_pci *pcidevs = NULL, *new, *assigned;
> +    libxl_device_pci *pcidevs = NULL, *new;
> +    int r;
> +#ifdef CONFIG_PCIBACK
> +    libxl_device_pci *assigned;
> +    int num_assigned;
>      struct dirent *de;
>      DIR *dir;
> -    int r, num_assigned;
> +#else
> +    xc_pci_device_enum_assigned_t e;
> +#endif
>  
>      *num = 0;
>  
> +#ifdef CONFIG_PCIBACK
>      r = get_all_assigned_devices(gc, &assigned, &num_assigned);
>      if (r) goto out;
>  
> @@ -453,6 +488,32 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
>  
>      closedir(dir);
>  out:
> +#else
> +    memset(&e, 0, sizeof(e));
> +    e.report_not_assigned = 1;
> +    do {
> +        r = xc_pci_device_enum_assigned(ctx->xch, &e);
> +        if ( r && errno == EINVAL )
> +            break;
> +        new = realloc(pcidevs, (e.idx + 1) * sizeof(*new));
> +        if (NULL == new)
> +            continue;
> +
> +        pcidevs = new;
> +        new = pcidevs + e.idx;
> +
> +        memset(new, 0, sizeof(*new));
> +
> +        pcidev_struct_fill(new,
> +                           e.domain,
> +                           e.machine_sbdf >> 8 & 0xff,
> +                           PCI_SLOT(e.machine_sbdf),
> +                           PCI_FUNC(e.machine_sbdf),
> +                           0 /*vdevfn*/);
> +        e.idx++;
> +    } while (!r);
> +    *num = e.idx;
> +#endif
>      GC_FREE;
>      return pcidevs;
>  }
> @@ -606,6 +667,7 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
>      return false;
>  }
>  
> +#ifdef CONFIG_PCIBACK
>  /*
>   * A brief comment about slots.  I don't know what slots are for; however,
>   * I have by experimentation determined:
> @@ -648,11 +710,13 @@ out:
>      fclose(f);
>      return rc;
>  }
> +#endif
>  
>  static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pcidev)
>  {
> -    char * spath;
>      int rc;
> +#ifdef CONFIG_PCIBACK
> +    char * spath;
>      struct stat st;
>  
>      if ( access(SYSFS_PCIBACK_DRIVER, F_OK) < 0 ) {
> @@ -663,22 +727,27 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pcidev)
>          }
>          return -1;
>      }
> -
>      spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
>                        pcidev->domain, pcidev->bus,
>                        pcidev->dev, pcidev->func);
>      rc = lstat(spath, &st);
> -
>      if( rc == 0 )
>          return 1;
>      if ( rc < 0 && errno == ENOENT )
>          return 0;
>      LOGE(ERROR, "Accessing %s", spath);
>      return -1;
> +#else
> +    libxl_ctx *ctx = libxl__gc_owner(gc);
> +
> +    rc = xc_pci_device_get_assigned(ctx->xch, pcidev_encode_bdf(pcidev));
> +    return rc == 0 ? 1 : 0;
> +#endif
>  }
>  
>  static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pcidev)
>  {
> +#ifdef CONFIG_PCIBACK
>      int rc;
>  
>      if ( (rc=pciback_dev_has_slot(gc, pcidev)) < 0 ) {
> @@ -697,10 +766,17 @@ static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pcidev)
>          return ERROR_FAIL;
>      }
>      return 0;
> +#else
> +    libxl_ctx *ctx = libxl__gc_owner(gc);
> +
> +    return xc_pci_device_set_assigned(ctx->xch, pcidev_encode_bdf(pcidev),
> +                                      true);
> +#endif
>  }
>  
>  static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pcidev)
>  {
> +#ifdef CONFIG_PCIBACK
>      /* Remove from pciback */
>      if ( sysfs_dev_unbind(gc, pcidev, NULL) < 0 ) {
>          LOG(ERROR, "Couldn't unbind device!");
> @@ -716,6 +792,12 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pcidev)
>          }
>      }
>      return 0;
> +#else
> +    libxl_ctx *ctx = libxl__gc_owner(gc);
> +
> +    return xc_pci_device_set_assigned(ctx->xch, pcidev_encode_bdf(pcidev),
> +                                      false);
> +#endif
>  }
>  
>  #define PCIBACK_INFO_PATH "/libxl/pciback"
> @@ -780,10 +862,15 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
>  
>      /* See if the device exists */
>      spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
> +#ifdef CONFIG_PCI_SYSFS_DOM0
>      if ( lstat(spath, &st) ) {
>          LOGE(ERROR, "Couldn't lstat %s", spath);
>          return ERROR_FAIL;
>      }
> +#else
> +    (void)st;
> +    printf("IMPLEMENT_ME: %s lstat %s\n", __func__, spath);
> +#endif
>  
>      /* Check to see if it's already assigned to pciback */
>      rc = pciback_dev_is_assigned(gc, pcidev);
> @@ -1350,8 +1437,12 @@ static void pci_add_dm_done(libxl__egc *egc,
>  
>      if (f == NULL) {
>          LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
> +#ifdef CONFIG_PCI_SYSFS_DOM0
>          rc = ERROR_FAIL;
>          goto out;
> +#else
> +        goto out_no_irq;
> +#endif
>      }
>      for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
>          if (fscanf(f, "0x%llx 0x%llx 0x%llx\n", &start, &end, &flags) != 3)
> @@ -1522,7 +1613,11 @@ static int libxl_pcidev_assignable(libxl_ctx *ctx, libxl_device_pci *pcidev)
>              break;
>      }
>      free(pcidevs);
> +#ifdef CONFIG_PCIBACK
>      return i != num;
> +#else
> +    return 1;
> +#endif
>  }
>  
>  static void device_pci_add_stubdom_wait(libxl__egc *egc,
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index f87944e8473c..84e933b2eb45 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -10,6 +10,7 @@
>  #include <xen/lib.h>
>  #include <xen/errno.h>
>  #include <xen/hypercall.h>
> +#include <xen/guest_access.h>
>  #include <public/sysctl.h>
>  
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
> @@ -20,7 +21,70 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  {
> -    return -ENOSYS;
> +    long ret = 0;
> +    bool copyback = 0;
> +
> +    switch ( sysctl->cmd )
> +    {
> +    case XEN_SYSCTL_pci_device_set_assigned:
> +    {
> +        u16 seg;
> +        u8 bus, devfn;
> +        uint32_t machine_sbdf;
> +
> +        machine_sbdf = sysctl->u.pci_set_assigned.machine_sbdf;
> +
> +#if 0
> +        ret = xsm_pci_device_set_assigned(XSM_HOOK, d);
> +        if ( ret )
> +            break;
> +#endif
> +
> +        seg = machine_sbdf >> 16;
> +        bus = PCI_BUS(machine_sbdf);
> +        devfn = PCI_DEVFN2(machine_sbdf);
> +
> +        pcidevs_lock();
> +        ret = pci_device_set_assigned(seg, bus, devfn,
> +                                      !!sysctl->u.pci_set_assigned.assigned);
> +        pcidevs_unlock();
> +        break;
> +    }
> +    case XEN_SYSCTL_pci_device_get_assigned:
> +    {
> +        u16 seg;
> +        u8 bus, devfn;
> +        uint32_t machine_sbdf;
> +
> +        machine_sbdf = sysctl->u.pci_set_assigned.machine_sbdf;
> +
> +        seg = machine_sbdf >> 16;
> +        bus = PCI_BUS(machine_sbdf);
> +        devfn = PCI_DEVFN2(machine_sbdf);
> +
> +        pcidevs_lock();
> +        ret = pci_device_get_assigned(seg, bus, devfn);
> +        pcidevs_unlock();
> +        break;
> +    }
> +    case XEN_SYSCTL_pci_device_enum_assigned:
> +    {
> +        ret = pci_device_enum_assigned(sysctl->u.pci_enum_assigned.report_not_assigned,
> +                                       sysctl->u.pci_enum_assigned.idx,
> +                                       &sysctl->u.pci_enum_assigned.domain,
> +                                       &sysctl->u.pci_enum_assigned.machine_sbdf);
> +        copyback = 1;
> +        break;
> +    }
> +    default:
> +        ret = -ENOSYS;
> +        break;
> +    }
> +    if ( copyback && (!ret || copyback > 0) &&
> +         __copy_to_guest(u_sysctl, sysctl, 1) )
> +        ret = -EFAULT;
> +
> +    return ret;
>  }
>  
>  /*
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 98e8a2fade60..49b4279c63bd 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -879,6 +879,43 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      return ret;
>  }
>  
> +#ifdef CONFIG_ARM
> +int pci_device_set_assigned(u16 seg, u8 bus, u8 devfn, bool assigned)
> +{
> +    struct pci_dev *pdev;
> +
> +    pdev = pci_get_pdev(seg, bus, devfn);
> +    if ( !pdev )
> +    {
> +        printk(XENLOG_ERR "Can't find PCI device %04x:%02x:%02x.%u\n",
> +               seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));

Take a look at pci_sbdf_t, you should use it as the parameter and in
order to print the SBDF (%pp).

> +        return -ENODEV;
> +    }
> +
> +    pdev->assigned = assigned;
> +    printk(XENLOG_ERR "pciback %sassign PCI device %04x:%02x:%02x.%u\n",
> +           assigned ? "" : "de-",
> +           seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
> +
> +    return 0;
> +}
> +
> +int pci_device_get_assigned(u16 seg, u8 bus, u8 devfn)
> +{
> +    struct pci_dev *pdev;
> +
> +    pdev = pci_get_pdev(seg, bus, devfn);
> +    if ( !pdev )
> +    {
> +        printk(XENLOG_ERR "Can't find PCI device %04x:%02x:%02x.%u\n",
> +               seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
> +        return -ENODEV;
> +    }
> +
> +    return pdev->assigned ? 0 : -ENODEV;
> +}
> +#endif
> +
>  #ifndef CONFIG_ARM
>  /*TODO :Implement MSI support for ARM  */
>  static int pci_clean_dpci_irq(struct domain *d,
> @@ -1821,6 +1858,62 @@ int iommu_do_pci_domctl(
>      return ret;
>  }
>  
> +#ifdef CONFIG_ARM
> +struct list_assigned {
> +    uint32_t cur_idx;
> +    uint32_t from_idx;
> +    bool assigned;
> +    domid_t *domain;
> +    uint32_t *machine_sbdf;
> +};
> +
> +static int _enum_assigned_pci_devices(struct pci_seg *pseg, void *arg)
> +{
> +    struct list_assigned *ctxt = arg;
> +    struct pci_dev *pdev;
> +
> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> +    {
> +        if ( pdev->assigned == ctxt->assigned )
> +        {
> +            if ( ctxt->cur_idx == ctxt->from_idx )
> +            {
> +                *ctxt->domain = pdev->domain->domain_id;
> +                *ctxt->machine_sbdf = pdev->sbdf.sbdf;
> +                return 1;
> +            }
> +            ctxt->cur_idx++;
> +        }
> +    }
> +    return 0;
> +}
> +
> +int pci_device_enum_assigned(bool report_not_assigned,
> +                             uint32_t from_idx, domid_t *domain,
> +                             uint32_t *machine_sbdf)
> +{
> +    struct list_assigned ctxt = {
> +        .assigned = !report_not_assigned,
> +        .cur_idx = 0,
> +        .from_idx = from_idx,
> +        .domain = domain,
> +        .machine_sbdf = machine_sbdf,
> +    };
> +    int ret;
> +
> +    pcidevs_lock();
> +    ret = pci_segments_iterate(_enum_assigned_pci_devices, &ctxt);
> +    pcidevs_unlock();
> +    /*
> +     * If not found then report as EINVAL to mark
> +     * enumeration process finished.
> +     */
> +    if ( !ret )
> +        return -EINVAL;
> +    return 0;
> +}
> +#endif
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index a07364711794..5ca73c538688 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1062,6 +1062,40 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
>  
> +/*
> + * These are to emulate pciback device (de-)assignment used by the tools
> + * to track current device assignments: all the PCI devices that can
> + * be passed through must be assigned to the pciback to mark them
> + * as such. As on ARM we do not run pci{back|front} and are emulating
> + * PCI host bridge in Xen, so we need to maintain the assignments on our
> + * own in Xen itself.
> + *
> + * Note on xen_sysctl_pci_device_get_assigned: ENOENT is used to report
> + * that there are no assigned devices left.
> + */
> +struct xen_sysctl_pci_device_set_assigned {
> +    /* IN */
> +    /* FIXME: is this really a machine SBDF or as Domain-0 sees it? */
> +    uint32_t machine_sbdf;

I think you need to make it clear that when running on Xen dom0 (or
the hardware domain) should _never_ change the enumeration of devices,
or else none of this will work.

> +    uint8_t assigned;
> +};
> +
> +struct xen_sysctl_pci_device_get_assigned {
> +    /* IN */
> +    uint32_t machine_sbdf;
> +};
> +
> +struct xen_sysctl_pci_device_enum_assigned {
> +    /* IN */
> +    uint32_t idx;
> +    uint8_t report_not_assigned;
> +    /* OUT */
> +    domid_t domain;
> +    uint32_t machine_sbdf;
> +};
> +typedef struct xen_sysctl_pci_device_enum_assigned xen_sysctl_pci_device_enum_assigned_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_sysctl_pci_device_enum_assigned_t);
> +
>  struct xen_sysctl {
>      uint32_t cmd;
>  #define XEN_SYSCTL_readconsole                    1
> @@ -1092,6 +1126,9 @@ struct xen_sysctl {
>  #define XEN_SYSCTL_livepatch_op                  27
>  /* #define XEN_SYSCTL_set_parameter              28 */
>  #define XEN_SYSCTL_get_cpu_policy                29
> +#define XEN_SYSCTL_pci_device_set_assigned       30
> +#define XEN_SYSCTL_pci_device_get_assigned       31
> +#define XEN_SYSCTL_pci_device_enum_assigned      32
>      uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>      union {
>          struct xen_sysctl_readconsole       readconsole;
> @@ -1122,6 +1159,9 @@ struct xen_sysctl {
>  #if defined(__i386__) || defined(__x86_64__)
>          struct xen_sysctl_cpu_policy        cpu_policy;
>  #endif
> +        struct xen_sysctl_pci_device_set_assigned pci_set_assigned;
> +        struct xen_sysctl_pci_device_get_assigned pci_get_assigned;
> +        struct xen_sysctl_pci_device_enum_assigned pci_enum_assigned;
>          uint8_t                             pad[128];
>      } u;
>  };
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 2bc4aaf4530c..7bf439de4de0 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -132,6 +132,13 @@ struct pci_dev {
>  
>      /* Data for vPCI. */
>      struct vpci *vpci;
> +#ifdef CONFIG_ARM
> +    /*
> +     * Set if this PCI device is eligible for pass through,
> +     * e.g. just like it was assigned to pciback driver.
> +     */
> +    bool assigned;

You can see whether a device is assigned or not by looking at the
domain field AFAICT.

Thanks, Roger.

