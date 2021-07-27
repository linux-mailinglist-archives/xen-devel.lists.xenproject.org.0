Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892DE3D7518
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 14:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161154.295903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8MHV-00087V-7F; Tue, 27 Jul 2021 12:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161154.295903; Tue, 27 Jul 2021 12:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8MHV-00084D-1T; Tue, 27 Jul 2021 12:33:57 +0000
Received: by outflank-mailman (input) for mailman id 161154;
 Tue, 27 Jul 2021 12:33:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ggmi=MT=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m8MHT-000847-NZ
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 12:33:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e77b4946-eed6-11eb-96ea-12813bfff9fa;
 Tue, 27 Jul 2021 12:33:54 +0000 (UTC)
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
X-Inumbo-ID: e77b4946-eed6-11eb-96ea-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627389234;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3KZD9MndbUOCuhDKE94AcXNHku5zaU6RY8yubJC4w8E=;
  b=Cy55c0J0X8+R54mYTfaNCuUt4rwjoRQ6Yh0grlG53m5DdbW4V/Htyka0
   D9kgXgnBvXC/gs72ID9kxE8z+eW9rjDiD7vSrvLI1Kcbn5w1UwtZ2Y7gF
   /uiGxgZLivZ+VCWvqhgZHNOosi23Xm0zYkkphSchCoy2W59e8pDmbBU4I
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XKTbVGTCqsThzkdnFQH2VzmuBMFuvt6mdAaYggEQZ4Q1/oWrDBDJXtb8UleZLgQITtX6r1k3tY
 KqNFBB/YxafELaoibjwwd9uUxAn8Y6K8aVV0h4oGJZgqU2eRpfvqQPFEdmIdi48B2eVzTM/8Y3
 py6VqN+Kj4UpBcv+NuJnCbqjKWN48ycuuDaOnGfUo9A1Z9b/SOny7tyPXPJXpN+QnwpVvK+Rvu
 X64F8E5Pfip7AqcB1vI0y0wB5ycq2S1BjsXamUzM9CS+QjImgp/VgHIthg0NeJhOKp/scv3pcX
 8sOk6DE4LSeVYozmQbCvEmIA
X-SBRS: 5.1
X-MesageID: 49550866
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9oJWxKp/f5KAttw//t3KE0QaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.84,273,1620705600"; 
   d="scan'208";a="49550866"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWTCs2xVRRs/4fq6XrR7k6SsWfHPs2EqZYItkBSoYvcR4k7SFp7g8kSppBR9Tgq8CHiYa0c5d8qFOsBje+WYn+rWs62MacnS1L962crHY+/In1/534nvljPi4gCswq3+58lLLaVyrD4py/N5W3nWMK2vaiIWwaUXI+fVHlk6RMLoJ1JyWCNH1gXizzE4Us/kvJgRZf5IizvVCbjLEcR++2Q2vONSpNBUSHkcWdrGJ5/Sl0ipH+QE6NCy5DkH6ksgN9NSThCpaNDEvHMJPOgffvu+SD0DW90357x4fIBnk9R8avEDT7yiLqHgmaw2GXYwujYzBPFAaJSjYSUf0TR3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+v8daMtcYCJNQvFoXvV/YLBWeaOEW2XizQZEI/L3sE=;
 b=mFtHgXBTYX9Wp2C13KqeRegz/ZNDmRuHfF0IHdkk0uZiYhG/WS4SyfJ9APIu82MOAeWU+ORULtZhdBTh2955QDINZwWYyzO0xWwQOrcWH12cD0CNwslymU/dZ5iAE/Gbd2vdvaB7jN868l08thec8/xaw41BNfPpnjEhjzAiqHN7ytQajE2HnCOWta8XYu9qtFC9b1FgCouKFgyEEUeiGhl0/Dzm///SQBfgdpbKXKLb9zfJiCTwKYp7QPp/HT8MFXn4PNzCk/5KqvmRbo+JuhwQOB9imtx53DrtiUdza8ShR3AKrbvnBnoQRHtj1x/hJVgHuSXXSke8XIDMQyJi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+v8daMtcYCJNQvFoXvV/YLBWeaOEW2XizQZEI/L3sE=;
 b=EloGL2RacxojRgFdrHhzz3EEZlX4G/wkE0tgLrclE81p/i/uevnRI7aVDqHKkogm/GhBRgzTNQdT5HLDzQytxyVKXrcyhngmXHc8YFxGgV3Ytw5SxuJtuFd0Ut8e3t+wT/v2k/666u5nc4r2XGOScp3toR180VDPFnnl4Kyw7Fo=
Subject: Re: [PATCH] x86: work around build issue with GNU ld 2.37
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <2e0beb7e-022f-efb3-3adc-4877c60bfeba@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <69a34c1f-0df8-47c2-4c67-2b22abb9fd21@citrix.com>
Date: Tue, 27 Jul 2021 13:33:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <2e0beb7e-022f-efb3-3adc-4877c60bfeba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e1a78ce-f192-45cb-2730-08d950fac8f0
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5727616F2881F6F7548CC393BAE99@SJ0PR03MB5727.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:336;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcgfNr8dUD21US72pOIzgNr9qRBfwzTMW13K+9C2n5RaHfortPQN7QXjWqF79cO62ahxTiQiY8J7lwl+U8uZAJiAyeayS0uYhG1+gNEkJtfTcJqXvkYqmp5/UL0hzCqEgSZCe7baLEVp/23wpY9IH3mrJcwrFUauud2KitiHs6DQikxRzPLasXa5d47B8DA+eVk+Mhg3vuiF6hL+uzG4aWpRJUtE0rO6LBuPKy46QOsYoMuMWPBgOrL4pIYdc240cNxX6R0vF1EC1h14c4XzQ/6U/tsyfB8ySvE4cupHr9RcUH8Quqe4HYrYSJ2JVh6Ot8WJhL3kziL3kZTxZ9Ds99xdXEr0nnlLpXq2TeCYW7yLl/9H2Fd4CTkBR9NTbp75Gw4/f2uGMyeZSy05std1IWzoExMk53mK4rZ8vl1de1SUxwdYnprXjVr+eBPp4PP9WdT6/J581SPZyhQS8+SK/geMacVjdgJNhri601mZonmYb/zHrPs0HD/6TTTcrkLcepNvb1KLLPfylbf+5KTwgxI+cwo2TSgtvOHd0SLVDy6fuY18AA1CDERcKl6Jsy7hazv2UezwKlKo3V0yFbiQzhpO32OwnZJ1gn/UMY1jHPqOFasaqvDqld+yQMQ8D/rSVVELYv0U2L/fp83nHaKCiETw5gLLIjorin+CryAy2rkLrWgEzih6fsh7X4/ChD/CcW98KSY0bsHERUz8p71JaCzIFwq0+pJNdZGGjRqe7WqvXojT5AQeJFoKepgYHrEm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(107886003)(2616005)(6486002)(16576012)(2906002)(508600001)(316002)(956004)(8936002)(4326008)(53546011)(6666004)(36756003)(31686004)(38100700002)(5660300002)(8676002)(66946007)(186003)(66476007)(26005)(86362001)(31696002)(54906003)(66556008)(4744005)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHp2eVdoV3JGSmhGbWZIcTlrNzg5eDkyTHlBL2ZSMmJiK0czNTkwVHQ2SXh0?=
 =?utf-8?B?L0NKeFRTQzA5dGQ3NHBrb1ZLRWNvZmZGYk1iWFJmUjJvcHBPUmdLczNTNDB6?=
 =?utf-8?B?UzUreFJzNllpUFpSc0xnR1NqT0JwT3NwL1hWd2Zyd0hNb0pFME1HZDJLMjN2?=
 =?utf-8?B?N0JnQUNncXZMSWtyVzJEOGxGWkVRMmk5QlFlWWVPbmgwZlFIUGQ5T2ZtV1dW?=
 =?utf-8?B?emRwZ2FVNzdvUDdQTFJyeS9tVXkzb0xQeWNFcWZ2NHVzMW9NWENMaGs2d05Q?=
 =?utf-8?B?ZWFCQUk2TVBtNXZmNk5CWURGbDFuckU3ek5QL3dINU5WZ01qK1JsL1JHdkNC?=
 =?utf-8?B?MThxcTV2ZEk4Qmx1V0NoaEtCQU9hTlV3UGlHTERYKzhYTkwxV1ptek5NYnNt?=
 =?utf-8?B?c1hMRXlvTHMwR2tJRXdwWjVKNDFUVCtobTdNR25lUEtxcGF0TC82WWhLaUFM?=
 =?utf-8?B?NG52cW55SGwxRGlqU3N1N2hiemhTK1dqZHNaREtKaHprTjMySExUSm10Q3Ax?=
 =?utf-8?B?TGNLVFhKSmZXcTlpZnoveXdBcm5UZkhxK1o4dUxmVjY2MDh3dU0wZ2lQSU1h?=
 =?utf-8?B?YXlrRk43UnlMclE3U1B2TjcrWW9RODNuYk5jWXdBN1pGT2ppYmJUZFVxUVV2?=
 =?utf-8?B?UW1BU0ZXazdHUGJWbXRDSXhIaHlJWEx2TXlER3ZvR1VqZjNVN0dNa1liSmsw?=
 =?utf-8?B?eUNxeUg4eUFwR3gxL01kUlFNNVdPY0VQYnZaQ3E3cmRHMVdwRkxHckhtN2Vn?=
 =?utf-8?B?RlcvNEN6Z1FkU0ZUL0dFcW9Mc1BDWDVVYy9pODhGMEVhME1JOWFxajZyanI2?=
 =?utf-8?B?d0ZPOWwvTnM0NCtpRmw2bkpFd0xOODdrYTZya09xeGxwVkN6TTFYeDRCaEE5?=
 =?utf-8?B?bEszVW5jUkR3NE5aVTZSMjE2aUpPdlBTdnFiQUpYcW5LYW1Ma2JmbVNGQU5w?=
 =?utf-8?B?cmVMbDNtVjdVS1lhYlgxM1FsRHlHYytxSEdnSHBCM1hnVHVyTktSN01QS0dQ?=
 =?utf-8?B?dDZkMkxvWEM1dVVoMElOVmVDTUV1L2NueERXUlJaSEl0b3pUQkxKOG40Unhy?=
 =?utf-8?B?bXF1SE1hVSsvOU5UVnBKZEp1aytZZlFMN09RTE9LVnIvK2duU2tEMDhBbkNJ?=
 =?utf-8?B?N2lJYUdJTFltKzlhb3JiWVpab1lSMzk4WHBMRE9TdFEzSGZEeDlaMFh1bmFK?=
 =?utf-8?B?dUo2QlJUMEl4V1piYWVDM1g3QzV6UlhlTDE0V1NOaVZNL0o1Tys3Y0VwZjFw?=
 =?utf-8?B?ZkU0NHpJT2RDbzhpREl3ZllNb2tCUWNuaGVYRkJnUUp4UjdqQ3YwK0lFOE56?=
 =?utf-8?B?bmRtbDRNZ3l2MDd1a1lYWlRnUXN3MmwzS1lka2tzM3ZYUTdqOHRTRE9lRC93?=
 =?utf-8?B?LzBYbjF2a2c3bGJQYlBZWHNmYlBGV1JwSU5UUFYrNHpzZlljcGhQd3d4K0FQ?=
 =?utf-8?B?alphTzdpSzlYM2JqaGwxZllKcVlEWmxJZmtzYnpJcnBadmVMUUxyNHNUNlhw?=
 =?utf-8?B?bnVObXJRR1FWR29ZTnk4QXFTVU8vS0xjQ0dQNWxBeDV6UnhPYlpKajd1SlhW?=
 =?utf-8?B?SHZlcXM5bjd3OEt0MUxGYUNtV3BINFFtbUFTWmNSWERaeXhhWUUyOVJsTmty?=
 =?utf-8?B?dUJVVXgrRkJzV1pna0RPM004cHZyYjQweG1oSjhuZlk3V1FpdjJzV0J2NnVQ?=
 =?utf-8?B?T1BHcFJKTldoSGZNWmNUY3QzSDNISnRXN3Avd3FVRE1hdlN3MGlySXFBV2ZP?=
 =?utf-8?Q?uWswelX57ucEuFlc6fSI1/hUFc31FaawXO74tbI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1a78ce-f192-45cb-2730-08d950fac8f0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 12:33:49.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVQ/VJJYDU7vYXuJNjS5zpGjWbkVfC5/jjwosevguQIBK8z7rftRH9zdLJnlzILN7MfdjHClcmbqlt6Ks3nBB35WY0DkFdnbOO8IobIIEl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5727
X-OriginatorOrg: citrix.com

On 22/07/2021 10:20, Jan Beulich wrote:
> I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
> which broke the hypervisor build, by no longer accepting section names
> with a dash in them inside ADDR() (and perhaps other script directives
> expecting just a section name, not an expression): .note.gnu.build-id
> is such a section.

Are binutils going to fix their testing to reduce the number of serious
regressions they're releasing?

>
> Quoting all section names passed to ADDR() via DECL_SECTION() works
> around the regression.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I guess we've got no choice.  Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

>
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -18,7 +18,7 @@ ENTRY(efi_start)
>  #else /* !EFI */
>  
>  #define FORMAT "elf64-x86-64"
> -#define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
> +#define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
>  
>  ENTRY(start_pa)
>  
>


