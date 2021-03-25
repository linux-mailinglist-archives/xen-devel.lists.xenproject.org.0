Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D316434977F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 18:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101495.194215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTM2-0001LT-Ba; Thu, 25 Mar 2021 17:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101495.194215; Thu, 25 Mar 2021 17:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTM2-0001L4-89; Thu, 25 Mar 2021 17:01:06 +0000
Received: by outflank-mailman (input) for mailman id 101495;
 Thu, 25 Mar 2021 17:01:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSM8=IX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPTM0-0001Kz-Ks
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 17:01:04 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f147eaf-7df5-4199-a5c4-4d9d2014dff9;
 Thu, 25 Mar 2021 17:01:03 +0000 (UTC)
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
X-Inumbo-ID: 7f147eaf-7df5-4199-a5c4-4d9d2014dff9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616691663;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=of9uTjYXa2KnwTP7U3XcP7cO9GuPetoBzf4Bucsvx5E=;
  b=FoejQrJ/OwJUNhX0g1b5PKeIeahuVk4wwh+SPomOdQyIGB2nCQqrrsaV
   aYf7SN9Mvz9gKjKzb30iZBbn7wId4oyjzgSH3mS/XZJYF/lIrzDWg86fL
   yhBgBfXom+VkSkvnuP6f/efqSTjymbEVUcOT1uZs6vo8dN0g1BzO/72bK
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4kLbUBEMymQvmuh5kHi2WnKYKlhl+UQQWhAXtj9X7Ee+InWBQXY9H+aAyl0z3mFhATbyb+UoPE
 yszODfQhcek7ThwxoftrRE2h076LJmrevhQu4MoSRTFsvJYhGwyI1kQDq8tFmjH72H6gKL77P3
 oo9sXDuhTFZoFBGmn616S9MmwmNCnbyyUZiqupbLH4GJI5fUFaZBs8YYdanZel3ze5j7wqu7lu
 S6KU2ktq92DZASM9+6izs2BAYy3ided616F5x+1VBKX06/DYZTywzKZ8HnT7so+BoWF63CXRVV
 OBE=
X-SBRS: 5.2
X-MesageID: 40508281
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VmQcRarhom+7SFMXhcxCy+oaV5vYL9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyHJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFbQYvUK146hc8NwDzKDwVeCBjJb4UUK
 WR/dBGoT3IQwVxUu2eCmMeV+bO4/3n/aiWAiIuPBIs5AmQgT7A0teTfySw5RsQXyhCxr0v6w
 H+4mnEz56uru2hzVvk33LThq48pPLa1tBBCMaQ4/JlTgnEtwDAXuVccozHhh8ZiqWF6FEmkN
 7Dyi1QQPhb2jfqUUye5Tfo0wnk+j4y53Hl0k/wuwqcneXJAAgUJuAEqYVFcgbIy0dIhqAM7I
 t7m1i3mrASLRTckD/z79LFPisa5nackD4ZvsM4y1l8OLFuEYN5nMgk025+VKokJmbc7rsqFe
 F/Zfusmcp+QBehQF3y+lV0zMfEZAVKIj62BnIsl+ayyDZskHVw3yIjtbAit0ZFzp47RpVejt
 60SZhApfVLRs8SW6p3GP0Md8uxEnDMWhLBKgupUC7aKJ0=
X-IronPort-AV: E=Sophos;i="5.81,278,1610427600"; 
   d="scan'208";a="40508281"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgI5tVdC+N5xe70hD/0W3p4+19VJUM6PE5UXVHygNC2lUevSSEUeqRFNYxovYtxPdBNc4a0a9Dw0D49yFIfxzcPCxmETFt3UZJQu/Q1OOob9rw1Gym020G+hnEOgXfVxv+a9bMJ/3JlKJN4p2jzOfApUyoljOg+7bDz9u+uWUib3Pd4oUgTfcfdRL0cMoV8kM/csHFFagjjM77ic/kPvvcO25BOqXcXu5OwYqpKdvfSKG43Qo7g3gR31qAQkOJpnWmZBGRix//X6ig2hHKwWpXg/CZCOX4SlgEi5mbikYXZqPqrCoToVne0gB10PZHhtAN1bqMhwUDi08JJ/Gmd6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux+DkcVLmnAoFtLq5LB3V6huJv5fnM7DaMb63yfG/v0=;
 b=OEfpORitd/JeX21uodOQioOurV5vUdxzNHT4jLBs4v9Tbvd/WHUrm4bJE79KxprXeEjf2BDvFa2k84W2TDnQHL7nrWEwpPUk+ESGUh1PeNEjLOle9iAQzaIu4yod+Ces60PKhZOmEjANJPSSXbxXgiq6rBw4QXtErEb18aTPfTrrYkGWwceWQqfwIhfWTFBqrd7We+G73PmGtJZbe+zWOfhigfI9RiW5hZ3rLFBEBUS+QlJvlshtHH5KCd1JQS4AGvIEohLjjngakj6WU5+gEzBkX6+O0xNoed9RVjOn9ItbZHTA4kItzwKiyn/4//8WEVjx5skUakeaRa/h/ciwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ux+DkcVLmnAoFtLq5LB3V6huJv5fnM7DaMb63yfG/v0=;
 b=GSMX3Ug1mQvNcrhARvlI2cU5S5RQuH7fKw5KROqLa2JS/3Ww7tWIl1zXhm3KbvOC2aD/gewmToU4S0BdgABNlagIXXUqBEMuUoTNMOeIZMOEZ3a3QX4xz2J4XcUTqZOISrf2BFfP98DgjtVJj0r38se7qTS4WvbZ959GfR5QGCA=
Subject: Re: [PATCH 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?=
	<frederic.pierret@qubes-os.org>
References: <20210325165224.10306-1-andrew.cooper3@citrix.com>
 <20210325165224.10306-3-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8e8d8fe6-afb1-eb2a-adad-912b857670fd@citrix.com>
Date: Thu, 25 Mar 2021 17:00:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210325165224.10306-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0506.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::13) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 720e2e45-6c09-4323-f949-08d8efaf90fd
X-MS-TrafficTypeDiagnostic: BN6PR03MB2515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB251582CFA6D2F1ED9E3430E4BA629@BN6PR03MB2515.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L6Og2lbgPlR0F8GOiIcMLRm7HI4cTyDEtYUvQs3EEEAk9fFvQvXFNaTZy2/pVxcEOr/rTWwm3XQfhOQgJhnJN477hTYXawokUvUnX/lw62uRjFPrAagoK2I8kASq46Gwq4oWDK4muq4c2fClDtYIJHEKeyqkWvHUljchZqtaV5NImnEXx4bnNF2+kRv2zm/+HAVITelgTAOsLKvvwiXLUz2EZey2C/pxClwngwVAn+2csBXrc1nIzsseLCII4KXuXEbGvlBTNM8IqF+xHL8lozL17Hsi5ILg+bUsWvsuPwRFj48nxeiMVmG42S29RXoMrnSdWEhuAP5/4fsbATq8K5XqC23AGL1/mg//N3600weQ2hTU0Q6o4Hw79tHvRccb52tolRbjTpPago/ybLl10vlVJl2KUH9cuEjNk6FDqG5UAGCuLift8bk3iHvX8B4Ltsyk5EUxt8jR2cVXKDFPX7uliaEhA5/yjHY9ecnVaB0EP9dpmAvEGNrQp4iGu9Hpm01p5xZ4HS0doxTt+DM0xK7rz/rp3qwOQCSCT7QLVQIRMo/x7OoiTQ5K+BXrkFeaoO6wOKCVtA/gMSSUhUUwwtzMz1GEp+mm7vXlDVom9pV8qtgwt7LliP6ZRcDV/9pIq504hE05JVX/7Fxim+4CqtfECmPSECERxSCycPoP8tdn2fVvi2GN8WwSXRBNCRriZifPxZWlPd8N73e8yGO14g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(66476007)(86362001)(66946007)(66556008)(2616005)(38100700001)(8676002)(8936002)(83380400001)(36756003)(31686004)(5660300002)(31696002)(956004)(4326008)(53546011)(6916009)(26005)(16576012)(478600001)(2906002)(316002)(16526019)(6486002)(54906003)(186003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2p1NmUrTnpGOHAyMGVOcHhudVpVeDJzek9VRjJoZmFrcDVSaVRMQmcyYVJm?=
 =?utf-8?B?QXVEYlB3K2FJYnI1T3p0RkQ3UlVsbThhaXp4MkE1NzVET2FnZVJBTm55S1pM?=
 =?utf-8?B?bmVNODVQR0owTzFtc3RLTFlsYmNzc0tncHBPMTY0RzMyUlVtNXF5YTh1bFBW?=
 =?utf-8?B?NHgwZGhSV0R1c1RBZE9uZUhkYkRSZkc4aUtGaUc2T0RTeVFvcHJ6RVRBNmt1?=
 =?utf-8?B?VG50SlpuWndoVDFyS0I5LzV2bTFFSEhsN2dhQ2F6ekd4VlZVNzMrTGRWcjNp?=
 =?utf-8?B?eTVreDVsTUYwb1lJc3lDMUQwR2h0YzZtK3lhU2d1SDNwVHQyOTBuMXZNcUFq?=
 =?utf-8?B?bWw0Y3lmWElrdDd1NzZWMG5CZnlnOVdRb1hhZjZTTVVHdmlqRldIdk90TlRD?=
 =?utf-8?B?QkZsZVplNXQ0MmVwVjRZeE9ZNXRtQzMyUVoreFRDZkFiTU1rR3ZaT3hCc2t5?=
 =?utf-8?B?clV2N1JBK2FvZU81cFFiUjF0TklMUFUxT1d4OUpKdG5iVVdEbDdFc2FhZlNS?=
 =?utf-8?B?NXhVMGVDeFdBVnpVeTdzd2tzRG15dU1TVTRBbkpEV1ZJWHErVk0xekNoRGpq?=
 =?utf-8?B?VEp5Q1Q5TTU3V0pVYUVyNzBuN2ZnbkJWNjhYTTJDblRkRDZsTDVSamZmUisz?=
 =?utf-8?B?dy80NGZ2NGxrbDJFbWY1TlZMVnBvUzdNKytlcnFnTHB6SDNnOWsrVzQ3QUt6?=
 =?utf-8?B?akxGOW16Q1JSbnFxRCtCSzQ2cERhUHZVNnFCUUVpT3AyWmt5UVZnNmxVeW1u?=
 =?utf-8?B?YXJsNFhCcVptVkJ4WU9TKy8yYWUzYVVLSU8wN0J1Qy9KSHFPZjlwalhCeWhh?=
 =?utf-8?B?SzByTFk4MGZhS2pBYnROTnk0SFl4cUdYb05rTDhhVjlVT3kyd0RIT0RQQ3ZG?=
 =?utf-8?B?SU9tVFFIbVF6cC9OOW44RnhnUVdwM0VtYldhNElTQXhrNkNPUEI0NG94V0xz?=
 =?utf-8?B?QllxY0pVcnFIVjY1MCtPTUpZTkgzQS9UUXhCT2c0V3RrcjJkc0xEMFRTY2o0?=
 =?utf-8?B?L1YwUE5mb1AyZmc4NlZQdEZieVhlbVZZTy9qU3FTWEh1c2NRWHZ6UVAxZ3BI?=
 =?utf-8?B?VTlEOE1sK1g4dGhCMHQ4cVhkZ2NLdTNoMXlyeWZYbFNUU1VNVnJJNFhGWHlG?=
 =?utf-8?B?T0RCVVNzeVA4Y0xJVERpWll6UW96L1BYNDdGWkxTVjh6Y2l3a1RmcDVFbzln?=
 =?utf-8?B?dG5hSUMyWk1YM295K2xsRis1Qk1tOW45ZnJwMjRseXhWbHJ1eWo2OGRrK3ps?=
 =?utf-8?B?SlowcHlUejBVKzYxeFpQdkpvTjIwemMyTDcrZHExTUcvanVFRWNaQkpUSE9w?=
 =?utf-8?B?QTVCaWV2QXgyZFJxQkVRMCtYaUEwQXBYMmUyNlpQM2lFSSs0eW1uTE5tVzFH?=
 =?utf-8?B?VXdGMVp5dWpsMlNLLzRsN0o2OE5KMzhidjU3WEc4cTFoOWJUaWFyWVI1VSt6?=
 =?utf-8?B?UDNjZmYyZkxmNW1qTlRjSkg3WkJ1RStLWHBMeEhlNXdkWHhzQ1I1MnFzQ1F1?=
 =?utf-8?B?aHMyZkRYRmk4dC9NTXdkWkszTm1qMm1reUpwS2tUUlpYbm1ocEdlZWg2SUo0?=
 =?utf-8?B?T29RdnN4M3dqUTd6UmF0cXpFRTJydGhwMVA4QVlZUUh3ZElFQVZUbExnMXNz?=
 =?utf-8?B?WVp4Z05UTnhPbzJEKzZmbXJVMGg2VktVMU42K0VUOVNNZDdJRmpYUzNMYkN3?=
 =?utf-8?B?K0NTK1VETW5Zei9MelZacWdLM1Y3QmRBOGJzZjRyYVZpdjB6ZDZ6ZVVrRjkx?=
 =?utf-8?Q?TjSRoFDNsQeSu+No5lo4LUD8BJsJPRRDxvHgoXg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 720e2e45-6c09-4323-f949-08d8efaf90fd
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 17:01:00.6812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1A7tNm6zlieLEUgc0KPhlUQQfm4kqLJ1mb0xDsOSVTeEju1D+Q8nmLHkV2QGZbeR2J+m7387FGvXCwpKjvLPGxvfM6XK6LG4g60uxi2/VI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2515
X-OriginatorOrg: citrix.com

On 25/03/2021 16:52, Andrew Cooper wrote:
> From: Jan Beulich <jbeulich@suse.com>
>
> Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPRC
> static PIT clock gating") was reported to cause boot failures on certain
> AMD Ryzen systems.
>
> Refine the fix to do nothing in the default case, and only attempt to
> configure legacy replacement mode if IRQ0 is found to not be working.
>
> In addition, introduce a "hpet" command line option so this heuristic
> can be overridden.  Since it makes little sense to introduce just
> "hpet=legacy-replacement", also allow for a boolean argument as well as
> "broadcast" to replace the separate "hpetbroadcast" option.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Frédéric Pierret <frederic.pierret@qubes-os.org>
>
> For 4.15: Attempt to unbreak AMD Ryzen 1800X systems.

Sorry - lost a hunk during a rebase (the one to cope with hpet=0).  I'll
fold that in and post a v1.1 in due course.

