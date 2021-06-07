Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B559539DA8A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 13:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137820.255282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqD1I-0001Kc-KV; Mon, 07 Jun 2021 11:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137820.255282; Mon, 07 Jun 2021 11:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqD1I-0001IL-Gq; Mon, 07 Jun 2021 11:02:12 +0000
Received: by outflank-mailman (input) for mailman id 137820;
 Mon, 07 Jun 2021 11:02:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Idvh=LB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqD1G-0001IF-53
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 11:02:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ced8439-481e-4ded-a2fe-3d12592aaf58;
 Mon, 07 Jun 2021 11:02:08 +0000 (UTC)
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
X-Inumbo-ID: 5ced8439-481e-4ded-a2fe-3d12592aaf58
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623063728;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nbNCw5kmhJpUcZUioKqMrVEUFjE5kfV9TfbEsYxh9SE=;
  b=NWwT+WO5zgIRXTzkY0e5PwMNUjdF+gr8hZmmRPGgYErFGTpQJyKqZTKF
   R5pqTfdeLSsgSl1e/415thFjePTcfksmhG8JsOQgeg0msc+nnMDDAiSYa
   gLlMIPIwd7jZxordoVlgvrn+WvwjKCM/dcHg8/LmE0+quSVBHI9dqPkUp
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7hCIVds1qMwOfdG7i2WITS8Ym/W2KT8XEYRKKHSQfqO/g0N6ohcewtw+sn9Sq6V3loMqmvhd0K
 bU6x3Sy1DLvCH/S0KiBWoH2ZSKPVpLKInVoNIez8rPsSPdIpC71V66VqvhjqeptIFhwwX3+a+A
 AXpwJKcOJUi3J3rnJiI+IHwsJRTVQecCr1wFE4o283nERTBqXqX4KkkPNHHNajsZ+rvOIsslGb
 1HtuH27to1WB/S26BFk41Uoy97WThx8kmb/AbVXeOpcALbmsImRm9Q4ZeicAziUof/t4QntDcW
 Gy4=
X-SBRS: 5.1
X-MesageID: 45588431
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:MlZoKq19NbtAmhUpHt2A7QqjBbVyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJk80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YYT0E6MqyMMbEYt7eJ3ODbKadZ/DDvysnB7o2yvhQdL3AfV0gj1XYeNu/yKDwEeOAsP+tdKH
 Pz3Lsim9PtQwVsUiztbUN1L9Qr6ue7264PDnU9dlAawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/stmgoyWslFP73tBzop/M29FDDMuDhow+MTP3kDulY4xnRvmroC01muey81wn+e
 O84yvIB/4Drk85Q1vF5ScEg2LboXETAj7ZuB6laELY0I7ErGlQMbsGuWoxGSGpnnbJv7lHoe
 h2NiyixsNq5Cj77VLADu7zJlpXf3qP0A0feNEo/jViuKslGfJsRN8kjQ9o+KlpJlOz1GlxKp
 geMCib3ocPTW+n
X-IronPort-AV: E=Sophos;i="5.83,254,1616472000"; 
   d="scan'208";a="45588431"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NR59DpeaHrH7qazNbVThGpVMkOub7m0BcWERUucNxF37SRWkldr9KWNvJJ2TuTWgFEeh3NNAivgzKyCPBz40qv1pC9J9inz5nuSC1F/tv6E2m4bEuYcj0esdyuKrFP6Go0ms4gqqt67NqguRnK1Q2LUDc8+fu5Iu3ByMS9gWI+Au/ibEXR4pIb9paaOBkKumEdRjcO2gJ5F0XZeZVPpE1ZZVznJimT4jrdDt1zulwlaU6la0E3GJ6Tl94ewVGEzgJu8JN2TqaLDbX1Iw5eIPH7Phgoq0YO3tdtcwOo4vBgvuJ/0VKih8zvv4ua/O4LC6LL038kOx7Fc+v6h1E2U1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksN3+G7bltMaVrUG7fsa6caqJWLsAeChIaYRABmDk8M=;
 b=F4yKkzNPXWuu7vr0MdsuFJidnSUuSemhs0g7WTakf59Zi+wGEmBCr484LrHzxKGp3pR4Oc3qgemGjJWuUB4wkLysPvwrD2EpHn8Qi9D4O8Uqbx9Mg0sZQP16DkOBafOX6ZHvUpdOQq7lkoolXN6gtyLVSt5LSd5/pLLM4ajgdYggXnqAZUOemcHy5VHLoa+qLZ5uUr69ACf558e+xgnKJadzuplUZKcRe9utZV9c1OZdw6aEX8DZBvi2i/ze2G6x31dXZMzauVRwDfVn69bjoKWQFY1zaveln/07RgHBlnRB0iGFV3D6femdpek+BgtDcTTsx8VfDFmpscNage3KcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksN3+G7bltMaVrUG7fsa6caqJWLsAeChIaYRABmDk8M=;
 b=U0pHfWxM6F/0yEOHT0es00xcir2Jw2C75x/7iRY1Bggj3tp6aLeaVgRJ4q/1ov5Iqa1RrMUmQ8Y3L28gU8iWcnUuQxt7joXLSBTVwNL03wzJR9Lc+uSAnZ+T+LXoH+brofvmjz1YtDQSAar8RlKrQ6noMSXgD63yeDwfNmqhguY=
Subject: Re: [PATCH] tools/libs/guest: fix save and restore of pv domains
 after 32-bit de-support
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210607090425.18277-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cd954aa7-ee43-1126-f97a-21c213ef053b@citrix.com>
Date: Mon, 7 Jun 2021 12:01:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210607090425.18277-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0239.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c87a2c6-f14a-4585-de43-08d929a3ae34
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5759:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB575978CFF04E7C9411D1E472BA389@SJ0PR03MB5759.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHGHGe708oLvqpPVIwHl7YfuyCiPLfbDiQ63Vtwu6wIwXwJcfwgRQlhU138n3gIOE0oH4jYNQjoN98F/se//7+KaSPUfsuWg/+PYcNlIwxtTneBGHAKg3l8d6zxzgw2jYCQNxS+RsOUWhr+zuf+Xb6FjRxQYONQa/2uyd+8GlfhFUcFdvORIw4mLfLcKfMjLoE4EwEFACeJUD6o7/0/iLhhlXwwIy6vTuhDP6Y5RzPZWFTuZFLXz51v1esY0VWj/TOB4JEusd1xSW/lM7yUqK98+yDZCtRPttsuRYayNRdDw2wg2kSBmYgzVmXqP6ZrBOUzfwAlZ3RgHRlAx7ZvWo2qlzEs9+69Yt+BDwJ7jvKfoVkcDMffx/LsZeFKcNhaIOIiMKQ4A/uGKiicUMo0n8vXFyWlbEljIREm7AWP9BeYFPE3shZhpAcWwhfIZ24AQLgmZQXpkP7SSGufE7X48afakwxNtu7KE2Vr8EGdJLvcmh7mN7Y12MinlL08z63PjRyl1gJGNKuPWC5pmhVQV9Ol4vqDLlg10tz24gRzu9X7O8JVFXI1T+/XiaenmXIhjnuI8qEWKnmx403keSj2MZfGlyw1MhCeYVBPDuPQQD1JBzdx0RAX+8V2S8JIkLj+TyO2RBV5K07Lh+6YYN+4ha0TKJlC0rBwNau09e7rYeg/llqzkDgOyzvtpOc5zTPWa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(2616005)(956004)(6486002)(8676002)(8936002)(86362001)(6666004)(83380400001)(2906002)(31696002)(54906003)(5660300002)(316002)(38100700002)(4326008)(66476007)(66556008)(16576012)(53546011)(186003)(16526019)(36756003)(26005)(31686004)(66946007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0Rvc0NEblpTR0JzSm9ONU1aWG5zWittWXg3ZG1LY2dFRVozNUFkYllOUWlx?=
 =?utf-8?B?Y0FTVncwYWRIdjRiKzFoamF3NnZZYmEyWEI1bmc2TTI4QUVXczFrVnhoKzZK?=
 =?utf-8?B?NStpZUVUVG5ScGc5Vng2bVZ6VzdCVTVxTFdWaC9NSjF3SDJYZHFRMCtTbnFa?=
 =?utf-8?B?MHlwa0VRbWJPSS9vRHZrQk85TEFvU1Z3anVwR3FHdDREdFZSNDFqS210Qnlm?=
 =?utf-8?B?OTB3RUs0QmljeUtXQlRiSXhqRnhkVU9jOHN0UmNtM3lheXo5NWhmZ0tIVU1H?=
 =?utf-8?B?Q3V1TEdoT2w0Q013Ry9FRjlFeVduT1pidHFreEtJTlFMeW9naWtnNnpSaFpZ?=
 =?utf-8?B?K3dQbzNnTStWNTRjcERvbWR6MmUzMFRma1oyOWw5WGYxaUV1N01zU290KytE?=
 =?utf-8?B?U3VuOTZZZ3ZiUGxiWXJYZC9yTk9ZMnlwUEpEQUZqR1FKZVBJV3BDOXA2Z0RH?=
 =?utf-8?B?YWJ3bU91anVQMEdzelZBT3Njamx5eFk1N0tUZFZmTitOUndkU1lVREFWVnBp?=
 =?utf-8?B?MWIxZWljTVE3a0lhYmV0Y2xtMXErQ2x4aEtmRGNzbDdyMUV3K2pKYS9FbWFk?=
 =?utf-8?B?WE1VQU1mdnpZSXZDVUZUN0pkVlFwb2N6aVYwbTBad2RQOGo4Z3lvQXJyZXA3?=
 =?utf-8?B?WERXZ0MrTmlILzRPVTRZOUpVbmV1Wi9vTkk4OHJnQ1N1MiswNmRyM0hqRXN6?=
 =?utf-8?B?ak50Z3dEekRwRVArVTZjdWVBN3pqZU5VSUY5akxGSHZPNmhjYk1nVzRGcm9h?=
 =?utf-8?B?THpGWVlLVVZTa0JqRFFXdkUrRjVrZnlqeUdTR1VBMWU2UWtjRXlCNjdvb1E3?=
 =?utf-8?B?bHNBbnRzNzZmNFBZMkhwVWRMZWtHeWZxdFIxYU9xWFEvaEdMcXZiR1lua2Y2?=
 =?utf-8?B?ZnVzT2NaQktWZ0cxQmdUWG4wRzFESy9LNlg4QjNDREgxYVh4VnowTkhmaGgy?=
 =?utf-8?B?T0MrNUpJTzR3VzF1NDlDb2ZadXdiZkZMbnJYSDVxZzAyeUtNZ2prSXZReFk3?=
 =?utf-8?B?U080enVCS3F0TjNhcHpETlZET2N2bXVCNjRvSDVvK0ZETFJTTmQ0c0YzUklX?=
 =?utf-8?B?UFU3bElqa0R6Rm1UNmN4MjlXS0NMR2hlUHNGb3E3aUNtM0RZWkZObUppV2xx?=
 =?utf-8?B?a1laaHFHK1BzejF2T3RXWDR5UmdER2RKVkFza04zRWs0YlowLzRVRWhqSll4?=
 =?utf-8?B?aXF6VGtmRm9tbFJrQ0F3bmtDcnNOU0txcUdEbkJmR09QMGpUbFFnc2R4cnh3?=
 =?utf-8?B?YUIyN3lmUTM3bElHMWN3MVVXbjQwZUtod2U5OGZOSGJUd3oyOU1xUk82OFZX?=
 =?utf-8?B?U3lZVzhFUm1qa29JS09TYnlydHlyaVVxTUliaUdFY2s0UVl5SnhGOVpreU5B?=
 =?utf-8?B?Z2wzQnkyV041ekFEaUZMWVF0ZytHb1d2RDZndFgyK0N2a1JvUXc0aitDblRR?=
 =?utf-8?B?aHhKY09qWjh4aHBYR1hQTldmeXBudjA5a1ZhQW1qTkRpSVZXcXpUKzBlbzlH?=
 =?utf-8?B?UDFZWndHQWY4czlJTmpaNml2dUNhU3kyQy9xU1BlUUZYdTl3V095MlFaMFc5?=
 =?utf-8?B?b2ZETmZORURuQkx3Um1vYlVwVFBhYy9SbkZkUHJnRVJ5QUc4cTBML3VxdzNQ?=
 =?utf-8?B?OG1OR0NSWUFhUjk4TDBpaFJobFU5UWRlaGZwWjZSWE1qSnpSZFZRY3RabVJZ?=
 =?utf-8?B?UlVwN2hmS3lKaHkyUFBPQmhaRVJoSzNlNGFqNGN4Q0p5K0pYZEVTRHFhS0Ns?=
 =?utf-8?Q?jxYS1Yq2PgfaVPERBGCWTQxnybboxbx89gReK7X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c87a2c6-f14a-4585-de43-08d929a3ae34
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 11:02:03.2432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88b9QOSBy5IHp3w/34zIDmU3JPQWtV9hHGcYCBQ8bre1tQWPQtsrK+8sBslk2bs3AY6If5d4AEAJNExVCcVzEm3VPuB7SWovkUx7T5e2Z+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5759
X-OriginatorOrg: citrix.com

On 07/06/2021 10:04, Juergen Gross wrote:
> After 32-bit PV-guests have been security de-supported when not running
> under PV-shim, the hypervisor will no longer be configured to support
> those domains per default when not being built as PV-shim.
>
> Unfortunately libxenguest will fail saving or restoring a PV domain
> due to this restriction, as it is trying to get the compat MFN list
> even for 64 bit guests.
>
> Fix that by obtaining the compat MFN list only for 32-bit PV guests.
>
> Fixes: 1a0f2fe2297d122a08fe ("SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/guest/xg_sr_common_x86_pv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/libs/guest/xg_sr_common_x86_pv.c b/tools/libs/guest/xg_sr_common_x86_pv.c
> index cd33406aab..ad20461e2e 100644
> --- a/tools/libs/guest/xg_sr_common_x86_pv.c
> +++ b/tools/libs/guest/xg_sr_common_x86_pv.c
> @@ -154,6 +154,7 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
>      ctx->x86.pv.compat_m2p_mfn0 = entries[0].mfn;
>  #else
>      /* 64 bit toolstacks need to ask Xen specially for it */
> +    if ( ctx->x86.pv.levels == 3 )
>      {
>          struct xen_machphys_mfn_list xmml = {
>              .max_extents = 1,

This wants to encompass the whole ifdef block, to avoid having differing
behaviour between compile widths.

Also the comment next to compat_m2p_mfn0 wants adjusting to say "only
set for 32bit PV guests".

~Andrew

