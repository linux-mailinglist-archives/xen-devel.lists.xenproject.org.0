Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBA24D8018
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 11:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290110.492038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTi9u-0006CC-3k; Mon, 14 Mar 2022 10:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290110.492038; Mon, 14 Mar 2022 10:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTi9u-00069Q-0P; Mon, 14 Mar 2022 10:42:38 +0000
Received: by outflank-mailman (input) for mailman id 290110;
 Mon, 14 Mar 2022 10:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knG6=TZ=citrix.com=prvs=0654505ba=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nTi9s-00060M-EW
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 10:42:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70426cb3-a383-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 11:42:27 +0100 (CET)
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
X-Inumbo-ID: 70426cb3-a383-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647254554;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oek5U41y4/vRcEsYQ5GGW8iFpxrIbmE4AvxhxqQRSBE=;
  b=Pncjc8v9ctiGGi9cgRjBdyNXdJn9JsFp14DK1aqhuephBzAdap1wzFuE
   lM0nw0onyJtCuwdvbm+u718pHFFT5Ir16D5GJVN7g5YwFRRAyhOxTdkF6
   HJOQXdVHa/Uh9jGnOpBjtsAhUMBaGXzJ/m08nLJxa9FyRYjXtbMhsVZyy
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66086240
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:U+nlt6NFrvV/whfvrR1Ml8FynXyQoLVcMsEvi/4bfWQNrUp0hDQHm
 DZNXj3UbK2MMGT9ed0kaI3l8xhS6sXTytJiSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 tpsm7fuQigSfajShuczVB9kMH1eMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmlo1p4UQa62i
 8wxbGJJMyT4Tz52K3QKT60Ukdy6qXrybGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSd1D6E/3SEluLJ2yThV+o6Krq88fJ7hUyJ8UYaAhYWSFiTrOGwjwi1XNc3A
 0Ad5CcGt6U5802vCN7nUHWQv3qsrhMaHd1KHIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRturCITXOW9p+PsCi/fyMSKAcqZyAeShAey8L+u4x1hRXKJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2d8nHpqGyniaOKSxAr5SvQWF6GsiN2MdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFoSbLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6q8gjlmOMEZmOq7EMZGPxL44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2PGsmqkE7/juXHPBZ5rIvp13PUMogEAF6s+l2Jo
 76zyePXo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2reWJb9JUaI6aJm9sJItU994wMz7ug1
 iztCydwlQuk7VWaeFriV5yWQO62NXqJhSlgZnJE0JfB8yVLXLtDG49ELsppJ+Z7rLI/pRO2J
 tFcE/i97j10Ym2v0xwWbIXnrZwkcxKuhAmUODGibiR5dJllLzElMPe9Fucz3EHi1haKiPY=
IronPort-HdrOrdr: A9a23:/IMwJ63hEheAEKG9qcP01gqjBV5yeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvoRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIF/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF8nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KNoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFrLA
 BXNrCT2B9qSyLaU5iA1VMfgOBEH05DVCtue3Jy9fB8iFNt7TNEJ0hx/r1rop5PzuN+d3B+3Z
 W1Dk1ZrsA+ciYoV9MPOA4ge7rBNoWfe2O7DIqtSW6XZp3vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.90,180,1643691600"; 
   d="scan'208";a="66086240"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiwLDzQZDW7eaSGis+XaOtLssI6S8CimRKQbNJMw/4OeYyx3Bqs7DMZZxRvfHXXUnNx2XEMxIFXXBrW1Y4oHDjN/hvIpotWaWshVj9ekhIlAoZTdDonq2cHpBqFGdzlw8rYB4gqKOq1SMcgtCuIksWSZZN+6be+wkxKA7KbJbV44bcbifdWdGp/wbH0mCFKKoOrhYw1HjCLIR9RSXexK8nuXkZLcyqpePgmK8VdzykO4eGiQJyXW2ltL6I0E1jN8DyNU64wsomyi6Qxic9tiYEgc9AG7QJNnu5DxthuigCBER6REeJKxbuQaxqlDyay4IeFn8TNwnIEI+sy+eI980w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54YlXkTlmBA8Eqmdazo/ysd/STr03vF7a/Sa5wn0D5c=;
 b=ev8Ubvkop0sppOJqics+EvpCrEVwOh35F7IsZPZy2dupGAb1GU1nJHs3sY5X2UWsF81mUWwXB3Ca0R12HNcnDB/qnkl3tFvIc0TCKLJPkXuwWG3Um5PVRhDNOMxyHu1x42BGdVW3NezZd9c4Kcf2amCoPWUodVBP7+pA/wbwa3ovq7JU0Gk6Vu/2SNVVPwKLeJBe0vXQmNiMNGM4JDHnm32t5DO+XtlyjyhipBu34C9Ohh94uQdukHp+HDrz8iFrCwHWyOrmErNJyYLPsQi4JSMzNE0retYovvW2iGKFNgFEQGd1hWlCN1qd6dAUFslH5XQpcOoQJz71u/4CIPdBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54YlXkTlmBA8Eqmdazo/ysd/STr03vF7a/Sa5wn0D5c=;
 b=SdFVfehqZesUcN11U1vPQgttuAIxPEUizHqJisGmsEMNWGVLOems8dmIIZxjiZTq5z5WQew6M0bQdkN8v6aPXrvgwdTYpVRUu73oPXiIdgRE3YHdPTTuQh061JklQriI3cyPD7Wc8WZZLgiIePWQOIQjBikZyGxPKa4I94xOs30=
Date: Mon, 14 Mar 2022 11:42:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <Yi8cD6rFvLxmz8en@Air-de-Roger>
References: <20220311152107.2918-1-jane.malalane@citrix.com>
 <20220311152107.2918-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311152107.2918-3-jane.malalane@citrix.com>
X-ClientProxiedBy: PAZP264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 414cbf30-0065-4bdd-015d-08da05a75606
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6731:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6731FD6E6DBEC2F4AAB464858F0F9@SJ0PR03MB6731.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pC3wY/axmL17LlzV3gr9Wef+37791ZmVhq74jzL6eFIoMPcuWC5elhq2jBEXvn5uJjrnrhAzObvyzdEXUOBxLTPxBN8Lh+n+sVhuowcFKSaPq76Pc7Ay6JIIEjDlN1H+JdJVswI3s06gopG+O+0Jk7CqOf+ba9SyBAPCMGnHNDpmo/0SVLJA+Z2dnYjX6dzpte5wveSpzfMR4AQV+9Jhx+RtFzELgns1ViVUjEh4kwTlKaP1fs/KDyFnN/fDlFVJ9xl+8w8RNptU2AuraoydVnLivYjxrmExy/eZP+mj/Bzzw69opWKD756Jaz1GcxsZr+sZyvHfZ6XBFQCfu3QpDGP8MSQuyFimtDSki2a+pFsVXJYGMH/Vk0tyXEPcFYQZPc4snZQn0bO0K+kH1ZvvSVLD9S+iNPFPMvv8SxXizkpglMmWGXrVTJu+ZwfEAuwEkq7v6uONWOHxp5gz9cP2QZKrD2a8wNvRuDGmFsnJTXQXYA3Z4aC96cAT+KxULbsAY0hi/7DuxRfiychkpfk8rbfJJNb/IR7shJoJjbyoBLMuSxXkQuJbOQfEHlV4horO0mqv5pYpBcC0hSIZgO7Fhl6KRBSOMPYApdFrT6Duqj09WpGPRBVwKO2yv2NIV6dIvIl3pSyagR4N359b5oz96A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(54906003)(316002)(6636002)(6486002)(85182001)(5660300002)(508600001)(86362001)(8936002)(8676002)(38100700002)(66946007)(66556008)(6666004)(4326008)(6862004)(9686003)(66476007)(82960400001)(6512007)(6506007)(186003)(26005)(33716001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUpDbkFSN1BIV3lkQW9oekxNOXhIcUZvbmREQ0lUb2k3M0dzSGpiM1pFTnBx?=
 =?utf-8?B?MTVzeU40cFg1MGc4R1pTWjd2SGNPQjRLUW1xWjZoR2JndkZyM1ZiZEhETnMy?=
 =?utf-8?B?MTF1MHJqZWFVWFFMTW9aSVhNTVFLWmNVakVjRlFhZ1FlYVg0TGttWWxUQnU5?=
 =?utf-8?B?b016NzJxVTNRbzRwYVo0NkF2TEMzczBZSU5OOWxFdTF2SlkyM2w4VnowNFpQ?=
 =?utf-8?B?TFdxclhpZ3B3ZllJUGNLRkd5ZGJnR0crSlY0RW83aUhRcnlzbXIvUWlpUHZO?=
 =?utf-8?B?a1NUTEowb0RhOE51NVNoTzJDTCtkdTJjVllJWlpzYVQ0SzlLREgra1RjaWk3?=
 =?utf-8?B?VTZma0xtbmlwTGMvRVk1MmpHVWtsUXhDTCs4YjRWMVhMUzdXK0dhUkMvSkpO?=
 =?utf-8?B?L3UyVmRPSjZQLysrMU1kR1BUcTFxOVpnZ2FjSU4rLzBWNzh6T0dDKzBUd1Bz?=
 =?utf-8?B?ajM5N3I5aXNacVJxNTNlSkJrVTBnSUFJZldaUHpqODdWQVRuQkFsdnhwcUFB?=
 =?utf-8?B?ZDhZdXY4ODBic2lnNDBuNi9LcDRPK2lpRWQrd3NoMS9uL21rNzY4TzU0eWRw?=
 =?utf-8?B?SkRkajF5aFJTcjdDUFlxeWxNVDJnNC9ibzVlTitFTzlKNTVpWXEwenlEdDlI?=
 =?utf-8?B?RFR6OEFZc1R6K1JHNVg3dC9mSVYzNWQ1UXAyMlJtZEo2L0JYYy9sZHdRTWJE?=
 =?utf-8?B?SzAyVVNENmlyS2RKTGJpZXQ4SXZJY2NONStYQ0Y2c1o4L0hUVGRkNWpmVnNX?=
 =?utf-8?B?Mi8xODQ5bU5PSGRJSXdVZGJ2TVhzRjQrMWxyWjhhZUZSbUpKQ3ZWcWZRNUQx?=
 =?utf-8?B?MUlUdTFsSytlV1N0RnVoTFh6dTMwQ09JUTEzbDFBTWMxTFpwNVluTUkrVStM?=
 =?utf-8?B?dVdCT1JYOTBJcWk4c09YWEVHSDBpSWJxNVpScEQyNEtJU1psU2JOL1JSOVZ6?=
 =?utf-8?B?ckNkaHlZS0FLK1pkem5wc0pPOFBZdlB1aWZ3ZzJ6TFVKY0NnL2p6QVVnN0hK?=
 =?utf-8?B?dTNHVG5OVlRDOFJteTFGR0diN0pKeTIxVjJ3Tzd2UllRRlpHNnhhMHZmZFp4?=
 =?utf-8?B?TzNCdEpYb3RBbTZBWFNNQzJBZmRnYUNMRDhFUEdlU0NiZXB1V093Kyt2bUZ6?=
 =?utf-8?B?RVFwemFWNnZrMmc0bU9OTEY5YU9LY0dxdm53Q3ZMd0ZKQ1hSVDJVenAxYk5q?=
 =?utf-8?B?U20vMnRrWEJZQkxubVVDZFZhY0lFMVNSRVFNWmIyQlJyQWxGTzRBcEFpUUJ0?=
 =?utf-8?B?NGY0Vk53ZDlVY1hTa0RxSk5HYVRzM1Zha2lkVzNicVVHZUxFMlZnbHpkQTRr?=
 =?utf-8?B?MldOMFNPbElSKzY3TG94UDQ1ZEthU2h0a0NIQjdIKytWNXVHb2NHMXlzcUNZ?=
 =?utf-8?B?ZGYwNE1aVFBVQUJkRUpDWnhqU1hZbFZjZ0lZUmxqNk5XNEV1c0h2dEY5K1Ba?=
 =?utf-8?B?Z2pJNWpiRThGbm9wMTk0VkJ4bTRIMlR5OGM3SkVnWXdadHJoOUFZWnhKbjJa?=
 =?utf-8?B?cUxrc1J1aC8wQnVWWDdaYjEvTjhSZGRlaG5STExZOHhZenpYTVcxbkRtS2cv?=
 =?utf-8?B?Rm1weERmNmJlTUcvV1ZoQ1NPN0NBd3hpTEdHQUJ5Q1J5ZXlKV1paQmRJc09C?=
 =?utf-8?B?eXA2YkliaEJ6YllrZysrSm0xaUVFUW9VNkwwaVJpZ3I1b0N2K1RnK1BOMXZY?=
 =?utf-8?B?ZzUyRkd2NmRzWU5aR1drRnFUOFp1YTVzaWU4eEwrVHVIWmJrdS9nMHdBVjJi?=
 =?utf-8?B?WUdXTUc4QlU4aGg0UmxhYy8rY29QYnlERDBxakJ3VE5rNFlSQnladUxTMStE?=
 =?utf-8?B?Rkkzc0FsWnc2NHlFZXorSGtWOVp6MUdLMlp4ZEkyMjQyVlBBSC9ZSVhIODFD?=
 =?utf-8?B?d1VaRjJEY1NtUlhKbHZwNzhtSGFaT1FKQ1JWTmovbGhKRnNpcmtSdWwzQTUw?=
 =?utf-8?B?OW0wNGxGRlI4ZnU2azFVOW5qdWJ5Wkl5eWNDakJZYzFDL3ViUFZDRXV2d1lM?=
 =?utf-8?B?RFExbTZhcE9nPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 414cbf30-0065-4bdd-015d-08da05a75606
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 10:42:28.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWygmQAlB3JKFU315/p74oEJDamfaaVKcqjYExgdCE9PVF/TNeaCBKbmcur8qz4Og6u6aEuFf7F6b4JLxweV7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6731
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 03:21:07PM +0000, Jane Malalane wrote:
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 117fcdcb2b..0ab9b145fe 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1681,6 +1681,22 @@ void parse_config_data(const char *config_source,
>          xlu_cfg_get_defbool(config, "vpt_align", &b_info->u.hvm.vpt_align, 0);
>          xlu_cfg_get_defbool(config, "apic", &b_info->apic, 0);
>  
> +        e = xlu_cfg_get_long(config, "assisted_xapic", &l , 0);
> +        if ((e == ESRCH && assisted_xapic != -1)) /* use global default if present */
> +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
> +        else if (!e)
> +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, l);
> +        else
> +            exit(1);
> +
> +        e = xlu_cfg_get_long(config, "assisted_x2apic", &l, 0);
> +        if ((e == ESRCH && assisted_x2apic != -1)) /* use global default if present */
> +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, assisted_x2apic);
> +        else if (!e)
> +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, l);
> +        else
> +            exit(1);

I think the placement here is not fully correct, as this is a
LIBXL_DOMAIN_TYPE_HVM only code section. We need this also for
LIBXL_DOMAIN_TYPE_PVH (or for !LIBXL_DOMAIN_TYPE_PV if that's
easier).

The rest LGTM.

Thanks, Roger.

