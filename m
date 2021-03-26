Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A634ACFE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 18:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101975.195383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpop-0001At-Ca; Fri, 26 Mar 2021 17:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101975.195383; Fri, 26 Mar 2021 17:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpop-0001AU-8y; Fri, 26 Mar 2021 17:00:19 +0000
Received: by outflank-mailman (input) for mailman id 101975;
 Fri, 26 Mar 2021 17:00:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JnLO=IY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lPpon-0001AP-Ih
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 17:00:17 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd69a0ff-dd08-4df5-a31b-df06eca2871d;
 Fri, 26 Mar 2021 17:00:16 +0000 (UTC)
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
X-Inumbo-ID: dd69a0ff-dd08-4df5-a31b-df06eca2871d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616778016;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MWcAlWdFFN8K8jMCJnyDLu5RATWGrnt/HvG6DsLgAm8=;
  b=NWeqzGK6rjHAaT2drp03q1ZEq1sLypQeQCvct688G3L4FHUJ+zPZr4uS
   i628EV1Vw14N97JnPyzoW6reLTe9SXgEXDA7muGVg38ht/agp0R5Gm/TB
   KzQ+S9tnGMWSNdaIkqwgF46onKfeS9L/R0LOsKLHmUYkvxvA3r9zxadWL
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4LRYDLqQ//qE0GI79ZuUGU18YRmV70hadh+FsIzQsGZPSLMENlDm/4yVnLc73ZXwazY3JUUMog
 zScwnEnrVSH8Y9N9jYhsZ0dm1MiykwkIqStQbKZL9bYJTOcm1g/pwwsi8O9SLrnF0SKS/eCZOZ
 We11Bu/WYQpYmQYSQKTvYanUdxUAkYs4yuoOxZ33uWc5eh2t8G4O3hX9TRPPe9GspY1fiCNdZW
 irzkHJp95/PF22rAbbQaWGx92gi8/XYzzjC0sVSj8BCDQKa4NrXiqmTJTq8XlKgG4por1f6box
 cEw=
X-SBRS: 5.2
X-MesageID: 40596237
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:W2y4bawSNgayzs/uyfDJKrPx3+skLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr3//dOgbU5F7GkQQXgpS+UPJhvhLGSpQHINg/f0qpm1a
 lme7VjE9GYNzJHpOvz/QXQKbkd6fad9qTAv4nj5ldrCTpncqRxqzp+YzzrcHFeYCljKd4HGI
 GH5sxBzgDQHkg/SsigHHEKU6ziirTw5fHbSCULDRIm9wWC5AnAgNLHOiOV0RsEXzREza1Kyx
 mhryXD6ri+qPb+8xfA1gbohKh+osfryddIGaW3+6woAwjr4zzIWK1RH4eskRpwi+Gp5VYsnr
 D30mgdFvU20Vz9VCWYpRPs3iPpzToh7WTzoGXo/0fLkIjCax8RT+ZHmIJFYjvVgnBQze1U4e
 Zw8E+y87pREB/akyz267HzJmFXv3vxm1UOu6o3rRVkIPIjQY4Ul6Mz1gdpNa1FOyTA5IUuAI
 BVfbzhzccTS3y2RTTkpGV1qebcJkgbL1O9bWUpnNea6DRSlGAR9Tpl+OUv2k0N858wUPB/lp
 /5G5UtkLlPS/kfZr5mCNEARtOqCnfMTQikChPpHWja
X-IronPort-AV: E=Sophos;i="5.81,281,1610427600"; 
   d="scan'208";a="40596237"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jK+OE2+H/0PP1nRE1lAjp4H2OXkYZLjLdXXpDQlGiKpl0QTKjGiSR9+OpILvU4yFP0Xopilrmx7Il0TGUiWFDm1MhaT80m2NJBechwl9R8byoNfmKvwsuX3F0dwIm+tE40gDlOQpiZxANyprBIRPkfSYpS/Px8BmOizc57e7TctxWwbuSPEEN3/8fKRpF120quFXV/tooDcI4K9PGm7PXw04CDBvMHYQnlYG2O+wKtU1UG5IOp7t+IOraJYT/eOfF/bqb4npkhYQxONtjadGp2+zm8j9iufBgjovbzu/W6iD/upiisYqOkIKCLIcciLg0azZ0PtbfvbkUNbkgOst1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRmK3fvpBpmXjBaVeNBv5m1IhjGrK7YKyDWY5lkGwbk=;
 b=jbS02a/R/RtBRI9bEVvL8pFzKjen/gxJKnZfsXqXUt7m+ex1wi7tgr0RoybJ3p6zvJ3utQVa4i4Z2jrCrTlfKuyvDd3rNrCTyhljH7HuWdnNyrvbWXk4DV/sp0K1IGWdyxU/Qtp/iJgQdPrKw2BhTHx0+qtBJw5yymc5bP6LIJJlU5pAhNJvHaOFwvArophwUGPoXxvxtzwh22uQdwEcjyZhunEJbNKEzSErFmtcTK3+479yXELNpUqr2AoSKtLEsz3xbC0oOFZzhJ0gD/219ZLb+fNnaBj1kd+cBbuF5x9k6d6oVap/zMusVraB/d7LKBjR3DHnc/+gK9aB6XMqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRmK3fvpBpmXjBaVeNBv5m1IhjGrK7YKyDWY5lkGwbk=;
 b=I2K3aGymw+3l6R1sPS/qU5EEU3155FPlKay1UYHcYIduwNn3FPuZ/qlGBuq7LTPZEmhxRRIaz6uGGr1401IEvvNuyOTBeHziWftrcHv63qYv9lBwdp3Is4w4Q4Kk1FudkC3ECGMTLEbem6yndnpPfklz4nYR0ohPT7aeUeoP9bE=
Date: Fri, 26 Mar 2021 18:00:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH][4.15] x86/HPET: don't enable legacy replacement mode
 unconditionally
Message-ID: <YF4TFYYek9ypo0dQ@Air-de-Roger>
References: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
X-ClientProxiedBy: MR2P264CA0179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::18)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b1eaec0-9c22-4c32-85d6-08d8f0789dd0
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53562B1799F76EF550938BB08F619@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lKVDudruG8hdNYtdkmuktzLlWkidY4Kx/hhzYVXFAl+16hBiGWRJXgmwgy1Y9BgdHIbkr+RP0CtCe/5wY4UjGySv3Yt0tQeSgvNzs9VbqK/mbzuVBPlp9cT9JMRw5XCpZaYDH5yPq9ec62Vdn8uWanacRcYwoN97wlqmx3QkxXTUm5vbqU/wp7Q9D+mHtUplIfMcvg1kKfbbMplDC6RUPBKhzi69dpxTeCu/UCMkIjrVIie+mZA3Qkhy+20JE5rkIN9Ny8r7hIN9D+pryF+xWj4ciqYcL/JjhtofEDTVlYTyGs+ETl/LTIeSRzahVpeSrQcXd5DP22RbyjZjvV+znF/vugY/1GDlFcdBTnbvM7EvVlN2pOk14aqFk1XsunjBPuRx1W+RUUqzcblO9b5EpA4ZGiUesxvfvbfdRDHucV5W+JYv5EfKp6DTOOemBVFZL771Sc6EfHQJ6SsE+BKcbkvI+q9HmJ6chnYWp23VNlBkXR/th7/Velyo4OK1vXXxmxaKfKfeERmuc6p2OSawKuLGjmU1G9vLl1xJeRgpQRqJoWbUKgNE2AJpkSvTugbRB6PZZaE5HKB7MDq5EOasgL1R9LmDHV/7GD1n8txt2jbRWPfBf6q9RicCB5yizgh+tOdvoeR6tb8Rekj+Cm3X8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(6486002)(956004)(66946007)(33716001)(66556008)(66476007)(86362001)(6496006)(16526019)(83380400001)(186003)(4326008)(6666004)(85182001)(26005)(54906003)(9686003)(38100700001)(5660300002)(2906002)(316002)(478600001)(8936002)(8676002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MzYyelVDZk1seUFsVDB2UEZYM1N3RStQRkdJdy9za3ZmWGUzMUtkTjZ6dnRO?=
 =?utf-8?B?bExSaFJ1WkhLNlBVMnU3K1d0Q21xaWpXbWdQa2ovNEJpVHFqRW83N2NxaWU2?=
 =?utf-8?B?a0RmSDJjd0dJdU14WVZESThHdzdrMy9LTGc1RDJIODA5VUozNlFMb1RTV2d1?=
 =?utf-8?B?VzRMeVNMSlluNlUwZEc0dFdsZFE2Z0k1SjNRVHpCVDlQMDY0RTgxbVJQaGxk?=
 =?utf-8?B?LzhlWVNSUVhZcWd3VkpHZWRvdE05Qk5BRjdGbGFna1grMUQzYnkxMnd6dk9z?=
 =?utf-8?B?Nm9lK1E1am5qTXhseDBvSWN2R0Z0UDZVeU5FaU5WMEtMQ1lxUjRrSHhzbUoy?=
 =?utf-8?B?d2x5NkhEc3BzVnpQZVVaSzZjd3E1L0c2STI4bng1ZVBSRzdrOFRoU1BOd1Nr?=
 =?utf-8?B?YzAxTHNoM0xoWHFLSDFmaW9UdEg0TGU0YitDcFMvN0gwSGoxbjV4SFBtNC95?=
 =?utf-8?B?MDhyUTlMSmV3MXlscGZob0h3Nm5JdCs1MUVLalV1ZTFJZDcwbE9pVWhad2dR?=
 =?utf-8?B?am5kaytGV1N3d25xNWxoSi9BMFV5VlJrUnRMcnFHQlJHTlRla2VsYUV2V2dm?=
 =?utf-8?B?ejFQS2ZNMzBqSnBqdlZGZExIMElhelZvRG9JdmVNcWZxUjlIR24xbjNmZkJN?=
 =?utf-8?B?T1lNQWFQYlprODBza3hFQkthdGRycDdwdXQwSWRlamxDV25mWVNIbGU1QmpS?=
 =?utf-8?B?S3JSTTJobS82V3ppY3dNUXpZM3BqcFAxVitJUzFEb2ZUdFV4YkhmMjJQcHll?=
 =?utf-8?B?QVlNeW1hRTNpOUFQM2tJSkg5bHRxcDZJR1pNRHREUFhxZXZDYUpwSHNHT050?=
 =?utf-8?B?UlBDYzBrWnZhNVdWam1xQi9hdUZMVGJGNjhtVVBuWFFrTUpkZWtVZHFLdWNV?=
 =?utf-8?B?OXQ1STcvMzBSdDRJS2JRRmJiUlgxc1ByV0xOYVkzWmpDcUR0aEVHTExaSHlX?=
 =?utf-8?B?V1ZnWWI1cWhCQ1BLRGRBczFZUUYwV2V3bkxCRGpESUZPM2tqUWVDMURXZkhl?=
 =?utf-8?B?NEhyQ0d1ZXAxRHo5WHdqdlRmS0tWbGsxQWpIbGl0MDVKbis4RlAvcDlDUW1C?=
 =?utf-8?B?OWIvbk1QbWZyK3lMWVp5TmJMZEdWeHM2dHZWa0R5ZVpIVnZVTGdkSGJZMDhv?=
 =?utf-8?B?T0JwSS9MTjN4cFltREFWb09jRDI4cjlVMGpUMjl2bURVcGNZOFdiSncxVEhr?=
 =?utf-8?B?d2FFaGxxQmVhWThQVzl2NytzRFlSWHZQaFJRUUZ4SnM3dytPdHlFNVcydTgz?=
 =?utf-8?B?V28wbEQwUWQ4MG4zanJNR1NQSXJRd0V2eWRhRGV1L1ZTSlVCRVJ1OElKRUFH?=
 =?utf-8?B?eWtBRWJZcU5PQy9HTk43MGovR0loVVIrTWM3V2J6d0ZldDJza0d6Rkc0QzdW?=
 =?utf-8?B?bm5KLzNQclhWbEZmT2VSUm1PTWt0MU9RQWVjRzVqNGsxNk1vQlB4T0puL1Zs?=
 =?utf-8?B?YkxqMHYwNjVwTVNUdERGZFhCS282Sk1kdmlFMU5JdjJGQTkwb3BDR3p4dUVl?=
 =?utf-8?B?QkJ5OFd4TDk0eE1OVjNwRHVERGlnU2ZyVFNPdmJZN25QWVJUckZTQW9MOFY2?=
 =?utf-8?B?UTVZNXF1Wk9oVXE2VTYxdHIxeXpEbkVjc2FwRy8yaGROLzFvTkdHZjRJTnY3?=
 =?utf-8?B?RFBqalErSXJWY1dUYkxvUnZ5Ky9CYWN5MEtkbS9HRnNLVVZUOHlaVzZLdXRO?=
 =?utf-8?B?L0FXM2liRmkzWHF4b2NxNzlZaUF4aWhMdGxSSUY5RS82QnZCQ2ExbGVPSW82?=
 =?utf-8?Q?iVDYcPCqC68jbOWWnwewBogBSGSgVsav7suQGx/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1eaec0-9c22-4c32-85d6-08d8f0789dd0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 17:00:10.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwDJpm8GuCeuNozkjjQUjZs2BojDnh2gCTY8DSbp1Wq7u3if2oMbvrcQcdg0AQyzLYNY2hZjcqsK+USlusrBrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Wed, Mar 24, 2021 at 11:34:32AM +0100, Jan Beulich wrote:
> Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPRC
> static PIT clock gating") was reported to cause boot failures on certain
> AMD Ryzen systems. Until we can figure out what the actual issue there
> is, skip this new part of HPET setup by default. Introduce a "hpet"
> command line option to allow enabling this on hardware where it's really
> needed for Xen to boot successfully (i.e. where the PIT doesn't drive
> the timer interrupt).
> 
> Since it makes little sense to introduce just "hpet=legacy-replacement",
> also allow for a boolean argument as well as "broadcast" to replace the
> separate "hpetbroadcast" option.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think the commit does what it saying on the commit message, hence:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I would like to avoid such RB being seen as me deciding on which
option is best release wise.

Haven't followed the other discussion closely as I'm on PTO today, but
maybe it's an issue worth thinking over during the weekend?

> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1274,9 +1274,26 @@ supported. See docs/misc/arm/big.LITTLE.
>  When the hmp-unsafe option is disabled (default), CPUs that are not
>  identical to the boot CPU will be parked and not used by Xen.
>  
> +### hpet (x86)
> +> `= List of [ <boolean> | broadcast | legacy-replacement ]`
> +
> +> Default : `true`, `no-broadcast`, 'no-legacy-replacement`
> +
> +Controls Xen's use of the system's High Precision Event Timer.  The boolean
> +allows to turn off use altogether.
> +
> +`broadcast` forces Xen to keep using the broadcast for CPUs in deep C-states
> +even when an RTC interrupt got enabled.
> +
> +`legacy-replacement` is intended to be used on platforms where the timer
> +interrupt doesn't get raised by the legacy PIT.  This then also affects
> +raising of the RTC interrupt.

I think Andrew rework of the change moved the x86 tag to a field on
the description instead of being in the title of the option and
arranged the options to be in list format, we might want to use that
instead, but can be adjusted later I guess since that would be a
documentation change.

Thanks, Roger.

