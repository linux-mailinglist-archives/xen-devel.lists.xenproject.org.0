Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F287380D10
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 17:30:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127424.239503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZkx-0003P5-Se; Fri, 14 May 2021 15:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127424.239503; Fri, 14 May 2021 15:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhZkx-0003N6-PK; Fri, 14 May 2021 15:29:39 +0000
Received: by outflank-mailman (input) for mailman id 127424;
 Fri, 14 May 2021 15:29:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6p66=KJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lhZkv-0003N0-Al
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 15:29:37 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2bf1105-3341-430a-88b7-4bb53d427db1;
 Fri, 14 May 2021 15:29:36 +0000 (UTC)
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
X-Inumbo-ID: f2bf1105-3341-430a-88b7-4bb53d427db1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621006176;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=STgyva7vgqZVem9zpS5xBNz+MOG77T1myBWH2AZ2CMs=;
  b=VRYpEwN1BqbxxJ6lSijSZ/U0jj4F2c4F5vHTZ7lXtr7628gVfpWLupq/
   /osXBHquT2zqZjg7cwNQMidotScus1L3R+dXq0n804I7ORKuvWDNjlOU2
   JDiBtJJpkBOPch/xFL1UeygDRMjnhRnIdFD90A+Ib5Pvubj2+B2789+zw
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: h7FvfSEZxs5R2AYAtOsE+/Hf8DtokJBGi9Mkq1ObRdDQb11zLHDy62wYJq25bo3bPGh9CnBrqC
 SSfWX9m7/8113ICTj/OXXBugF2K8ZH4mef+VEaYUCGlzY+94wk3QX+EAyZBQv5Akb77RndTfqj
 yckfnePIQHZpbNlFfOghz71DjlbrdtvNUuQOOWMWiQbD6w2x5LzuR8R5pYPnCmuZhCYtJNgnei
 3/bVq6Qw2r8nEUgnhxwEn6cdA3Qc67qO8EszSr95pruQdBlSfTm6xkEm7SmYXqLRZdWsl1JCSh
 2u0=
X-SBRS: 5.1
X-MesageID: 43813597
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QQt3n6PwlZPx6cBcT8P155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80lKQFm7X5WI3CYOCIghrMEGgP1/qH/9SkIVyDygc/79
 YRT0EdMqyJMbESt6+Ti2PUYrVQoqj0zEnrv5ak854Ed3AaV0gK1XYBNu/0KDwQeOEQbqBJaq
 Z0q/A36wZJFh8sH4uGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJbiJY4fy/gzdndvfrWrDyL
 L30lMd1oVImj3sl1iO0FjQM1KK6kdo15eKomXo8kcKoqTCNXkH4oR69MRkmraw0TtXgDhG6t
 M+44uujeseMfrxplWJ2zH2bWAcqqOVmwtprQdBtQ0TbWMhAIUh5LD3q3klb6voWhiKsbwaLA
 ==
X-IronPort-AV: E=Sophos;i="5.82,300,1613451600"; 
   d="scan'208";a="43813597"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLz3LoK+wgIXGCHTA2kFBxdPo+qx5c45Qk5bw4AsdvBlHO2yp1yRxRpnswApneHTzyjwRGF3MqUrnX48qSerrAyhY7oaE77svuSbGOgWqAQYkO8RartMnTEQNtKApjc/TWFxOe+lv2dbbned4F3rIHHrOmjy4KfigqzgHoBXkIzx5gZprr6gvkTUJuU5CcmcfNIAooUIForx1W91ykHZQ89W/NMBybAFUmEmWWPorSosyzjJUJ6BhfBsgM5jXJZJ+V09ZwQ0lokedY7OlMIxz64IfE0liachHev9NlLusBJdYLhcA/X7q0BahXYv+F5ZH/uStrn105guzl5Bim6VpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRA4CqEJCMYhykLDIMrQjSRpyhy5yWsDo08vRAuyV4w=;
 b=BZMmItqawl8UdwEB0vY4ByjHjhjh7fyLEkQFDDg3VunRHfTHcDQ7pYrwyztURmhtHSW62aqH6w0PKykWnhs1mY1hDpVrKSZlFWVNNgS9/7NQ7HwYZ1FBviQRkX7AAWmJXSinNmQk6UjSpcKlTDxGu/GRJLmQL6c6LhqG4Zb2y6MgvL/PBFg2RiWHwjHOlIHwyNr143YEyBR74xjfGRrbdt+OfkAQqgzIxK7gFdtz17lwVUaE/rOIytPi9mNSBbI1QSHgeUJe+fNwajAhaUg90TorX5xTzSj3XweLYk20OCad6ZYQqb1TtohNBOAgfD/q1kzA23cJHwdYGYzy1al/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRA4CqEJCMYhykLDIMrQjSRpyhy5yWsDo08vRAuyV4w=;
 b=uUW52WiEf3hFQF8+EltBa4ON6Wamlo5R4d8HIADab+RpE7sd3fdJI9nu6jQNXQN7eYIW5rb6/Fev4Wb1yUl2Hrq/bllirwpvT6FyaB2/puJBeTTI1Mp2QDVt1/lEEEddT7vA5nBXCS4+hdlWhw8jaJqE9oOHyXVYXug53ksk2R8=
Date: Fri, 14 May 2021 17:29:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH v5 0/6] evtchn: (not so) recent XSAs follow-on
Message-ID: <YJ6XVmadaDbP3aUx@Air-de-Roger>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
 <d29fa89b-ea0a-bdbd-04c9-02eff0854d47@suse.com>
 <40e90456-90dc-7932-68ec-6f4d0941999f@xen.org>
 <0e19fb4c-4a87-ff80-fa98-fab623d6704f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0e19fb4c-4a87-ff80-fa98-fab623d6704f@suse.com>
X-ClientProxiedBy: AM3PR07CA0057.eurprd07.prod.outlook.com
 (2603:10a6:207:4::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f71d3951-39d1-4c6d-c459-08d916ed1268
X-MS-TrafficTypeDiagnostic: DM5PR03MB3148:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB31484672FB9FD5F0734F84728F509@DM5PR03MB3148.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dcto8rmolMrRhQDZKDa1r834PmqeirMiWuy9PNduBlGsBmuU2YkUhOJv/gw1v85JeVhtMRPAooAaJb7R08BPUIOpaKnP+3t3tAhHoahP0pXXKMo/xIWzif5401NrQoV7vDbX2ydU+7wEkAQxZxYmjGQ5oxcmoK0Uegzorof3VQ+6yJSn7MtXLrq+roq0clQDG7OxI1Stf9bA31qAdHpJI9ZlQN0gml/LkuKW0ghufmRIXpNlkgo1fk6l+9t9MvHbxRL8hzh+5gRTAbZJRSEf50b6aD7wg5KmgVdXD3T5XNS/Tiz/AMcRwpfSUss84EblcrSA8GsYeLPPBP74n6U3aGhlK22XbrF+DhoG46elQFf3JclZd2jqyY3NAgEIvJ5IAy4OQ/d+lgo/19DH53Lyp3jtf4Xv9M4XS+cB0U3bwZ6JszbksQeKS9kku70QADBvLm/LK5rZ8lJUiYmod+AzD1xJ8hKz32B9JVhzh93nMxF8Tt6WG7hBv4TZytkFeUteyzYOrayMOvo8EL1HuHYlnrf3lAd7slzRnvwaf5pz+5GCj5T7ZyvC4f/BHj5Es+x28+nwouaEzWH0JtFjWw/oNJE/Ci0zUWVwydCSinfu3UQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(366004)(136003)(396003)(346002)(376002)(83380400001)(85182001)(4326008)(956004)(2906002)(478600001)(33716001)(86362001)(6486002)(8676002)(54906003)(6496006)(26005)(38100700002)(53546011)(9686003)(66946007)(186003)(5660300002)(66476007)(6916009)(16526019)(8936002)(316002)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0JBNHR4MjVNbmtlc3hybUpFV1BMRXB1V3JpS2JNd2QrbWxISWQvT1lKcS9r?=
 =?utf-8?B?b0x5ZjJmK29pZHRudXcyUFdmWk9qbmtjd1RPeWFwQy9scFVURVpwVUcyeGEz?=
 =?utf-8?B?TTl1RmFsclN6Ky9UN0hKTW9LeFJmZGJVZm04UXlhQ2M4VXY0cWNjSFhuZzRC?=
 =?utf-8?B?OWVlRlhUcXlHejc1RmFIV0YvUnh4dlRDZk5YRERaWVdocE1Sc3FOcG8zdmV5?=
 =?utf-8?B?ZHFQK085NUU4WVEvZEg1S01PbmR6S0k4OGQwMVZKUlNBbTRnNEx4Rllqd3FU?=
 =?utf-8?B?Yk5SWnFVZGI4aGQvUkNXLytML2VOWTIvUFM3STVFUUJBY2ZZTFJKa2NRcEpB?=
 =?utf-8?B?Q3grZzJqbzBHWjNqQlF3WklBNm1XU2hpdnlOUVNneVJQNjc3VTIzaUxaN3Zo?=
 =?utf-8?B?UkcrQmRVNS91bEdiNUdhRU03TXIrSXM5bC9GYy95T0Y5Z1RnOWNTL0Vnb1Ro?=
 =?utf-8?B?dlBvTVhaRHJEd2wzcldkMkdtNmo2UzRqMlBhNEdpYWI1WnFSSzdrWFFITUcv?=
 =?utf-8?B?aU44NXo4c1FIWEtoZVJnK0dLTGY3c1VxZ0JwRm9vL1RQVGNjVHdPSy9ZR3pU?=
 =?utf-8?B?czdmR00rc3N2d2Z3NEhSYmxLMVh2bkdWYnYrR3lnM0VCb3ZhR0tGdTNMay91?=
 =?utf-8?B?NUZ4bHlXbFVRbTQ1TFQ3TmdXZ1UzOVRxRE1pSy9sUkxoUk1ydkw2Y1dnUzh0?=
 =?utf-8?B?SG1MN3JRamh3MzVvb05xbUxVaHA5bC8yaDNheFp1L2NnTERKSkhOY1l4d2dI?=
 =?utf-8?B?US9lVHNuT0ZyVzFmWUlmNjc2SGU4bjg5L20wZkYvTjZFQVoycHFFQk1sTGdi?=
 =?utf-8?B?cWE5TTl0SGQwOWVXS3RLSGZ1WlU2c3dMVW5DZGpKcXhLL2pMT0dPenBFNDND?=
 =?utf-8?B?MVZsc1hsRjZiZjh4dkNOZUoxNkhqbzJ6V0doN0Q0aWswNnNVdHZGQkVCbDR5?=
 =?utf-8?B?am90bXFpdFJUNG9iWDFmN3E2Tzd0bEFpWDREdU16RTFiWktUc1l3Vm8ya212?=
 =?utf-8?B?Z29mOUtRcFM3MGpzYkJXOW00QzdqNFFaRmlGZE5iVGZWLzUwR2Q5SWk5d0N6?=
 =?utf-8?B?R1BoK0tGTVhNcENYQnFoK1NsSVNoUHFwRlY5NU9SSDZ0VFJhaHVZeEpST0sy?=
 =?utf-8?B?bExSNStyYUloZm9Mb0dldnhsMHAzRFNlcTB0QkNoTXhRZzVOVDJRVjRzaEhQ?=
 =?utf-8?B?cDE2RWowNU5XMHAzaVhZZ1FSbGtpY1NLRC9MeHFpaUFyYysrOHk2Ty9LSVFt?=
 =?utf-8?B?UGtGMUFKTUMxZXlnOFFMc3BhcndoeXAxNXphdGFxUU9aZSt5bU5NQ1RRNlly?=
 =?utf-8?B?UzZNTmdTNlhtcURwNHFZVjAvb2xpYk5SZW9Db2lhVi9ZRFU0YVdLTDZLTEtN?=
 =?utf-8?B?L2YwaUE5bU9DTDh5aWs2UDVPWGU3LzBDMGNtUHZId0xZckVXL2d2T044Ri9a?=
 =?utf-8?B?UlFNYmJDOHhPMGVSNkRLaDZEdnZyRFNINVcvaW1VZVo3T0RmOE91WkZJY3hI?=
 =?utf-8?B?ZWJpMkJmeW15b0ZnU3VLWmdKK1BSRnBsd0NtVHZsLzJoSmRrSFM5ZXdiOVpL?=
 =?utf-8?B?VCs1UXE4MHRDYWNXYXY0cEdnczVDUW5najhYSlkzTUFhYUthMXRCUnFqM1Jl?=
 =?utf-8?B?MzM1blhFV0VSNFFGdWpBdnFNVk9vemRkZUdDc2JBVmx3M2FqM1o2bjhZVkY0?=
 =?utf-8?B?WjhDZmdaTFhLQ0FzVmo4SGU0SWFaVU5VRXg2MEc1VHBKYzZhVlV3N2tjNHZV?=
 =?utf-8?Q?l5skbV+8eMsH/iRGcINkuwcCtY6hutGpdiIJ41m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f71d3951-39d1-4c6d-c459-08d916ed1268
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 15:29:32.2836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNlHgLpzg4O8W5eIz9JXI43NNDY/XDVhpcbcPYPHdGqHQzHoLJ+jfIOyAs665+XeXRzgFX2r1xabdcuQnWrmsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3148
X-OriginatorOrg: citrix.com

On Thu, Apr 22, 2021 at 10:53:05AM +0200, Jan Beulich wrote:
> On 21.04.2021 17:56, Julien Grall wrote:
> > 
> > 
> > On 21/04/2021 16:23, Jan Beulich wrote:
> >> On 27.01.2021 09:13, Jan Beulich wrote:
> >>> These are grouped into a series largely because of their origin,
> >>> not so much because there are (heavy) dependencies among them.
> >>> The main change from v4 is the dropping of the two patches trying
> >>> to do away with the double event lock acquires in interdomain
> >>> channel handling. See also the individual patches.
> >>>
> >>> 1: use per-channel lock where possible
> >>> 2: convert domain event lock to an r/w one
> >>> 3: slightly defer lock acquire where possible
> >>> 4: add helper for port_is_valid() + evtchn_from_port()
> >>> 5: type adjustments
> >>> 6: drop acquiring of per-channel lock from send_guest_{global,vcpu}_virq()
> >>
> >> Only patch 4 here has got an ack so far - may I ask for clear feedback
> >> as to at least some of these being acceptable (I can see the last one
> >> being controversial, and if this was the only one left I probably
> >> wouldn't even ping, despite thinking that it helps reduce unecessary
> >> overhead).
> > 
> > I left feedback for the series one the previous version (see [1]). It 
> > would have been nice is if it was mentionned somewhere as this is still 
> > unresolved.
> 
> I will admit I forgot about the controversy on patch 1. I did, however,
> reply to your concerns. What didn't happen is the feedback from others
> that you did ask for.
> 
> And of course there are 4 more patches here (one of them having an ack,
> yes) which could do with feedback. I'm certainly willing, where possible,
> to further re-order the series such that controversial changes are at its
> end.

I think it would easier to figure out whether the changes are correct
if we had some kind of documentation about what/how the per-domain
event_lock and the per-event locks are supposed to be used. I don't
seem to be able to find any comments regarding how they are to be
used.

Regarding the changes itself in patch 1 (which I think has caused part
of the controversy here), I'm unsure they are worth it because the
functions modified all seem to be non-performance critical:
evtchn_status, domain_dump_evtchn_info, flask_get_peer_sid.

So I would say that unless we have clear rules written down for what
the per-domain event_lock protects, I would be hesitant to change any
of the logic, specially for critical paths.

Thanks, Roger.

