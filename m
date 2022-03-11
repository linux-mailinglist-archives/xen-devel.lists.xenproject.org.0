Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC14B4D6361
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 15:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289090.490446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgBq-0002Uu-Nw; Fri, 11 Mar 2022 14:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289090.490446; Fri, 11 Mar 2022 14:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSgBq-0002Sh-Jl; Fri, 11 Mar 2022 14:24:22 +0000
Received: by outflank-mailman (input) for mailman id 289090;
 Fri, 11 Mar 2022 14:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSgBp-0002SX-7h
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 14:24:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef77a203-a146-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 15:24:19 +0100 (CET)
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
X-Inumbo-ID: ef77a203-a146-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647008659;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vDV4ZFsa/MHQQwbGO+Q72XYhvRSZ0LfS+jmzzRN+65Y=;
  b=ZGqLBxnD0iYDX+iCAo7aFZ5J+XnevQHgXcabkmQQF/koX/iesnP+2sqj
   YMg27cpuEOYv4Diduzs70VTlFs+SJPf3C1GSF44Pfpo4tAFoUYr1WZh+v
   nhCxx6O56qzM9ILv+9Jq8+aweu20LFQ+04aeW2JeOkY6hvfoTroZvDCtF
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66414387
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ghsvmqjjdvVhdUqXnQWAJkUYX161dhAKZh0ujC45NGQN5FlHY01je
 htvCzrUOfjfYzD0Lo91OoXnphkDvZHQmNBqQFc6pHwxHy8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFrU4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YR4PG4Prlvwtbz1zP35fBK9a1+WbClHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiAO
 5NFMmowBPjGSyRBKFgYCqAZp/uTrEnQKwNJt3GxpbVitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4CssfxiaD0proxy21WUk9TCJuMoANnZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uDA3Dt4ade51q2VtW
 lBdyqByC8hUUfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs3Y51bJm+xO
 BaN0e+02HO1FCL7BUOQS9jsY/nGMIC6TYi1PhwqRoYmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKOoNBJcgxScyRT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:WI4kQaN/Cc2DXMBcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvpRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIE/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF/nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvmOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1qop5PzuN5d3B+3Z
 W2Dk1ZrsA/ciYoV9MOOA4ge7rANoWfe2OEDIqtSW6XYZ3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="66414387"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJBnvwwVvhoDXnd5nxTzEGib71IU1pF77hAOgN/T8/vgmKLvMtr79lO78die89g5wNeWTWa48NSQl8V9EXpJlPinDbsmsDN/KE5ZzT97unpcWP+Ebqu6SmpI2sxniLQYL3fClxAdr0q2QU763J6/SaWXMakC75dcQBEhNyOBeEOpmnuZHjpYWk9L2ERv485Kc2qTgz+uwCaODn2z+Ld878QRa3CotjSdtgM7nQBQDx+w5N5gnd6vf4jzvvCxquxmEW42jGVj6MQXe0Ezs+Ruxe25mQKls+5O1aJu1bCcZ4OvOwoWkXr4wg58LLzC5ueU75aSh7UAjExm6HWeLV0D+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUVoz5ZnjPVv6WWPECj6Ql/c7yrOmuO1pB7PGRJOqEA=;
 b=KogsRDgIH0xkfpQrmx7hdwSMTeg/dLq/JiHeeSS5sCPOHyNNCgINcf9KQ1Zw0slZI93AH4k+YDoY6X3U6o3sPDOiobsquDV5DvnBUMuoPXtgKCDFlMQzIRs0rBBc5HZLMDKYxR8OTS3oXqUoPmTMUxk4gv5sDXC78FyzIxWKIAVUmZVPhNb2XErYeMAfIosV6R3bvV/8CGX6Lci1JTqyP/jcWJcs4/V5BMww8/f7Roiu+y8ntemLk7SoyZfekGUvE1MculTzONtB4UbFb1wF6umG+CS3P1ZFPGgrBrjnbohy/FPzLje1HY0X3qpcgAGRAZIQ337ucNC31Eywyv1CuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUVoz5ZnjPVv6WWPECj6Ql/c7yrOmuO1pB7PGRJOqEA=;
 b=Dr6U4dddh+ar4P6PxIpJc5mcztfHzKtGHaHFUM/xjxs90xsO9LL24F7zkBY3U7JN9jjfqNShOGd4WoTqbY5fBKsvr1yz4d5RAK8+xfx5ElUok6lEJWmYrdzg02ssPVkqGhInQu2vgBf4VfE3c/uP/mLklHcKrYf9VLLCdmSupXs=
Date: Fri, 11 Mar 2022 15:24:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 4/4] x86/APIC: make connections between seemingly
 arbitrary numbers
Message-ID: <YitbhmgGy4Yh8PoP@Air-de-Roger>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <123a9ae8-caab-01ae-5bea-8c590bd8f9d9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <123a9ae8-caab-01ae-5bea-8c590bd8f9d9@suse.com>
X-ClientProxiedBy: LO2P265CA0233.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5d014b6-caca-4865-80f2-08da036ad181
X-MS-TrafficTypeDiagnostic: SN6PR03MB4447:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4447D78878F6EA9DC0EB8C0B8F0C9@SN6PR03MB4447.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +gMeVlKXKDgtYRMlVbnU9C7MbolndYoY1q9wtKgAAvyujqNgCfX/dnr6gCI/JA+OVyL8GlbFLV5S3wsz4rDS22ZGwVKp/KZNONXhabwF5QaaYehNcK8QeiHF28EQ1tSm8wxFmGQjt29UVYh6WL7RDNnUv1lqwrVbT8/Lvcegkcio9mla4M0QO9M5LnWLyOsxYeIaGotX3TfeUTh6QVlYhTnV+DZ2jpqY+RVwrGpzjzhRuyBBfKMV5bWnImSz6lUXC7mlpI41eEZACEUTya/ILrb2Jt9vr4F8gy5Ap16Lj/XPv0PA7rKwVeHpCMo1mIBt+XD2104O+kZRp3a9Bm86PzYmFEBI8wexnw/OYRSCZXempE2UTJrbwXneC5iMVv3PVJt59jXwDZje77ivH7cKLUwjfw6BiFJnIGT+eJFMAhZ34yh0z1X46O8vmWZUn09AUt9wnarg+ALWMC8c2eK4yzLs5jcOV7qVEq8f2lDFDq0DveXB6aOHrHYZChdy5CraONCbCVD6MoZdot8JW0Xm05QSGHSR0hYkNaV16GTQjAf8OaCFR9YMUTZ34a+fpNo55DgIEARiWq7o3YVoDLBrAXCh6AbSUTMT4rrHs6iv/gAukt1Bj5iA37YL19eXewYnfDJtMkkFMhdWtyi4zfJdtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(2906002)(66556008)(9686003)(6506007)(66946007)(316002)(6486002)(8676002)(186003)(66476007)(4326008)(8936002)(86362001)(508600001)(6666004)(5660300002)(85182001)(26005)(83380400001)(33716001)(38100700002)(54906003)(6916009)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzJ2dVdDd0N5WUFkamJDZFduUFFEU2Vvd0V6U1pLdWd6a0dSVGhVYS90bUdB?=
 =?utf-8?B?Y3hUMm1aemJQbkEzWHNTbmlHWlNkb3pHTnpCUHdnSEYwR2xOdzdKWVpPbGlM?=
 =?utf-8?B?c3djZmVuTkFhNFJ2R3FySi85TS9qTDBFbGRwUjVob2F2MXZCNFVjUGVJaFhj?=
 =?utf-8?B?Z3RKeHV4eU0xYjJORUtwaXZRalM5NUQ1eG5hODArdGVZcWNxRSsxa2FOOEpZ?=
 =?utf-8?B?a2l4T3YvUDBFLytjeG5EV3NyaVkzaElFS0o2TUpmaXpWMG14U1UvLzU4Y1I0?=
 =?utf-8?B?d0FwOFJrSVVHL096TmNuZGdOb0g2d3Z4QWV5b0sxQ05QQURmbTB6OEZjZSs0?=
 =?utf-8?B?aklKb20zdk9nV1pNTlAyb3hxSnM1UC9Ma0k5LzU3d2o5TzA3WHAzZVhJeWRl?=
 =?utf-8?B?T2J3K1hyRzg1dWNyWnYweFp5a3hiM2FNN1dmYjMzaUhtbG5SRHZ6WDBjdGdK?=
 =?utf-8?B?aGZZb0xYMm9COFhPR1pQUW9CNkV2SFl5OWhIc1JxWllYa0FPdlpjRlovQXVs?=
 =?utf-8?B?Tk9JRGNoa0NPam45VmlkQXA0N3FXWEprbHhJYnByYzIrUVBHdm9QY283QkxF?=
 =?utf-8?B?YXBQLzkyT281R0hBUlJLbnlaWEZ1RUNuUzJnNnlhQW1wSUtCMnFMZUVCcDIx?=
 =?utf-8?B?dHovajZTYllIdDBNaWhHS3hMajZtWmZVWVBHM015OCtjR1pNTkFWTzlPYWsv?=
 =?utf-8?B?RzBUdXBMQWFQeG85VWxLd1VZQVh3RkY3YWJralQzZEtkaFFZeGltUXFrd3lm?=
 =?utf-8?B?ZFlrS3lhUHg1eE4vM1Y5ekRmU3AwR1pRMHpYMndXSERNR2J2UFFKNVNseUVh?=
 =?utf-8?B?UzV5Rm40WmFBT3RGNWpuNk9yampVZ0N0NkVJTmVFOWFhSXFMMEc2ayt3MS84?=
 =?utf-8?B?alZhUHczT1RzWkY2K01hQWFwd3FyVzd4YlZXbFUySzRnNWJ4Ym43cmpJZ0Ja?=
 =?utf-8?B?QXg5Z3VESzZ0MGYydkx3cENCWVVpVFJKSTJBclR2SE9ndGVaR056TEJhSy9S?=
 =?utf-8?B?b0liQWFycGI4M2pRRExPZDNhZ0RCcVlmVks4MC9BVER6d2NPVEhlYmluSU83?=
 =?utf-8?B?Rlk4TU1vSFFGTlhWYkk1NmFGb1NzWGdodWU1Y2tGMHVtRmxJbm9XcGF0T0xa?=
 =?utf-8?B?dzZmcDBiT05PU3pkbm1FK1hWWkJBcUcwNm94YlJIK3JOVlBPdjZiNzNlNDN6?=
 =?utf-8?B?RnljbkpKWHJWTUpGRFNOOHBYWG1mSUZqWVJLNXFYUElKNDh2RXpMSE9HcWtL?=
 =?utf-8?B?WHpCblVQRFNOQ21ONXBnYUdaSkRMQjUvZUlWeWVjeXlYWDkwK2h2U0xuekdx?=
 =?utf-8?B?SU1nR3d3UkZLOXJ2cGFiYkJBUUJMWEkxT3JXVXFjUzhUcHNadDNjSzRuNWg0?=
 =?utf-8?B?eUMrdUVISzRkZ0l6NmhwQzM3VkRaVVNEcjBmcDllRXNyUzBmSDVlOEw0cy9v?=
 =?utf-8?B?L3kxWFMreXYrWGZVZkVXWUNtVVhEVW1HSWNySmtJQ0U4ZTljSmM1M3llbjFP?=
 =?utf-8?B?QUtVdURtQTlXYTV5dGQzSUc5aDNIY1Jkd0tIQSt6N0h3TEg2MHhCS2laRCsr?=
 =?utf-8?B?NzBkQUtjYVF1UVpkdGloZTZqR1pnYWhiZFo5ZVFSS3RiUWtMaUNReGp3MVcx?=
 =?utf-8?B?b3hVUlM4OFdPdWp5bk5SeC9CSEluSld4MmEySUVUSlh0aHpXRXhqQURyVFo2?=
 =?utf-8?B?V0ZZOERQRk1ER0JrV2xIVGF1OTVveHUrSHpwekZpcEtPOGVkSUJsWTBOM0Z3?=
 =?utf-8?B?cm0zQW9JRXhaeDJMUHVXTXRJa0h4UWFiNXhHQUhza21Wa1AwV055T0NEYlhq?=
 =?utf-8?B?OXlCekRsaWxJQ1U0cG15TU1SelZFTjZvZlBSYjZMb25mc1FudmNxNDZ3UDh4?=
 =?utf-8?B?S0lvblZiRXowcUhTMytwdkY5TkhJUFhzYzZEQjN6MExSU3VwZWNpVW5PV0l3?=
 =?utf-8?B?Y0VkYXdCcUtzcmV6NVlkMm16Zk5iNXJHYi9lTXNONXhkOXlERXhTa3lMS1p4?=
 =?utf-8?B?TWU5SmlUbmFRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d014b6-caca-4865-80f2-08da036ad181
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 14:24:14.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vm9kz+FT9oQej/oXrf1mW2bvJ2844o1G5KriNg2F11WotjL9biIy44+3svPDLpZjzfNC4L3qwUtBUvPnUoJVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4447
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 10:25:57AM +0100, Jan Beulich wrote:
> Making adjustments to arbitrarily chosen values shouldn't require
> auditing the code for possible derived numbers - such a change should
> be doable in a single place, having an effect on all code depending on
> that choice.
> 
> For one make the TDCR write actually use APIC_DIVISOR. With the
> necessary mask constant introduced, also use that in vLAPIC code. While
> introducing the constant, drop APIC_TDR_DIV_TMBASE: The bit has been
> undefined in halfway recent SDM and PM versions.
> 
> And then introduce a constant tying together the scale used when
> converting nanoseconds to bus clocks.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> I thought we have a generic "glue" macro, but I couldn't find one. Hence
> I'm (ab)using _AC().

I would be fine if you want to introduce something right in this
commit to cover those needs, using _AC is not overly nice (or
clear) IMO.

Thanks, Roger.

