Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93063428C5C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205876.361295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtng-0007NR-G3; Mon, 11 Oct 2021 11:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205876.361295; Mon, 11 Oct 2021 11:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtng-0007Kg-Ct; Mon, 11 Oct 2021 11:49:00 +0000
Received: by outflank-mailman (input) for mailman id 205876;
 Mon, 11 Oct 2021 11:48:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZtne-0007Ka-B6
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:48:58 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 374fc03a-2a89-11ec-80d5-12813bfff9fa;
 Mon, 11 Oct 2021 11:48:57 +0000 (UTC)
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
X-Inumbo-ID: 374fc03a-2a89-11ec-80d5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633952937;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UYeXidO8EF3rwVKC6m/mFqwzrz+ih/rfaq+LM8+JMtw=;
  b=UqPPk/k0b3TioHXvM0rrGVHNsOs+9IyH0wJqAiJmBn1gQm/LnRou5KdE
   3UQESFL58pQy9HJ4ky2gc+YztTMWeBAFOaFA3A+JckwbWWbJZUQP1jLl2
   7id0g6JxWZNIlpS4QEEhMa239skyJZfHH8D3dA5lbmJpNidcTbSVovXu1
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VHYKe+Js+BIl8+slH2mtqph754nPm1QhAtYLoQ0WS+BdAd3OuWAJcyFtqlVyfUrrGg3vgXeTlC
 Nake5yqAqbzDoInDy+AfOVkuorbNrn+nX7IfmxOxEg4oyjqRpTjasWK8svQ6X5TMVtobKj1QNR
 6BWnoZ5CcBShAAtlu9iyBAHcAM5RXsjZ/tmo3AC4K7dx83xUjh/7CnRRCs2Jo7zYzEdC9ZYuVL
 sL8ZDnSIpPjeIQncDIBO9V/dI4Q/RpoH3wySBzfToAE7ZhgpWR9nKoQodnJtLG/FNPssqLnx8r
 A/YhPOw2ifZORxQtlsiqnRmj
X-SBRS: 5.1
X-MesageID: 56737280
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:E3c1R6h8nRB4p+A6kfD2vSxAX161NRYKZh0ujC45NGQN5FlHY01je
 htvCD3TM6mNMWPxft5xaoW19kMGusSGydEwTANrpSoyQ34b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg29Yx2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1/hN/zd1slBJTGu/ovdDMGHyRfZ/VJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2J8VQqyOP
 6L1bxJyThbKcU19fWtJVpkQud+sg2fHfjtH/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mPZ/UzpDxcCLtudxDGZtHW2iYfnhjjnUYgfELm58P9Cg1CJwGEXThoMWjOTo/ajjVWlc8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLnINTiNFLscnssA2bTUw0
 xmCmNaBLRVpvKeYD0qH5KaLpCm7ESEPKCkJYipsZQEI+cX5qYc/yBfGVM9+EbWdh8fwXzr3x
 li3QDMW3utJy5RRjuPioA6B02nESoX1ohAd1DSUHVz54jlAbq27VauCt1TezKwYI9PMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gE3QcFwn9i50zv6J9oIuWAhTKt8Gp9cIWeBX
 aPFhe9GCHa/1lORZqhrf5n5Nc0uyaXxfTgOfqGJNoQQCnSdmQnuwc2PWaJy9zy9+KTPuftmU
 Xt+TSpKJSxHYUiA5GDnL9rxKZdxmkgDKZr7HPgXNSiP37uEf2KyQrwYKlaIZe1RxPra+16Fo
 o4AbpLWlU43vAjCjs//qtR7wbcidylTOHwLg5YPKr7rzvROSQnN9MM9MZt+Itc4zsy5Z8/D/
 22nW18w9bYMrSavFOl+UVg6MOmHdc8m9RoTZHVwVX71iylLSdv+t883KspoFYTLAcQ+lJaYu
 dFeIJ7eahmOIxyakwkggW7V9dQ4Kkvw317SZkJIolEXJvZdeuAAwfe9FiPH/ygSFCun88w4p
 ryrzATARpQfAQ9lCa7rhDiHlgrZUaE1lL0gUk3WDMNUfUmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8zvoO9p7JTwgl+Mm/MalCnVuFpLnWchJEdvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2CLv/ovIUj86Ctmx5a9UB1fb0uWlShQDLppK4d5k
 +0vj9Ebtl6kgR0wP9fY0i0NrzaQLmYNWrkMv40BBNO5kRIiz1xPbMCOCiLy553TOdxAPlNzf
 22RjavGwb9d2lDDYzw4En2UhbhRgpEHuRZryl4eJgvWxoqZ16FvhBABoy4qSgl1zwlc17MhM
 2dmAER5OKGS8mo6n8NERW2tR1lMCRDxFpYdELfVeLk1l3WVa1E=
IronPort-HdrOrdr: A9a23:D+xhe6hZTzi2kTLIZOr5Gk2TVHBQXzx13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykKsS+Z2njBLz9I+rDum8rE9ISurQYccegpUdAa0+4QMHfkLqQcfng+OXNWLu
 v62iIRzADQBkj/I/7LTEUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13zDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IXEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fi1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqsq+SWnqLEwxg1MfguBFBh8Ib1K7qwk5y4OoOgFt7TBEJxBy/r1aop8CnKhNPaWsqd
 60dZiAr4s+PPP+W5gNc9vpcfHHeVAlfii8RV56AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="56737280"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sxi+HveZMYOCT9jVpfGK8nYudFF/judnmLVYoL3o8l09CtdTmhTsapU/vUlOlpHkkH1wChndVSgAaGfdWr/06WiL2dcgZh9SWaM5SyhhymJBDKT1mfyksLKbc8tDi/loCxPIEbRxROL9MXX/PGgr9SYOYQMDG+F6v80vOh6lSIHfxYHWiwfUEuJDGTPT+YhSJqAmntI+M1DFV70jwWkEeSxSUe1ijJQYJGtIhchK4dB1t5kYvEgzKyLlzLNkPoSSuOKHiN8JMWVzdM/g+/q0ihnAzibyu3NLzTMCURwIKcgxSFO0XARdDwMK+v9V8kFPU9Lv2XzTvMzn+uLYqGUTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYeXidO8EF3rwVKC6m/mFqwzrz+ih/rfaq+LM8+JMtw=;
 b=Qv+uxFVH50PlT8iYsqpFXaTVRRW5N1fBPCfqfdfhUOpO69WWeZC5GpBlq6678uZNXPQ+0hQQBT3RDwdcif3cfYRc1YW623U9HTg1ju+kCCUzgExpUXKAyhmpPxwOYZ9jqmvvvulToyhWa55KE6wqy4X0vd5k3N63Ury9N5xpC39N1ZVVd9P+12yM9ly2r4dh+ykMKBRenRl0UraTktMAGgz1xpDhiNicQnJV+wF1xIYb8ufZbDFe2gsAp4g7+pbCNzrwaexgVguZyfS3SAG5nQXRUAE17s+2x4mgHDDf/Jt5H8c6LVmtpwUjeKFt/lZctb4kgwcpbsqO0JXI6GZVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYeXidO8EF3rwVKC6m/mFqwzrz+ih/rfaq+LM8+JMtw=;
 b=JyUWrj7t/RL53mV9u8nneaaup49hjzlqa9DfUswWI0oqdZQ4YMeMzNLPka6+JJqjYiWLauNdXw4ynwkCvs1sx1vN7g8MSEMXsnxarb82EKISk/e8swQuTHUEhzEu7sX+Lea/s6iKNpSxfuK1X0xgemOwBLdhZJd2WvmZGqLYoBM=
Date: Mon, 11 Oct 2021 13:47:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<Andre.Przywara@arm.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Message-ID: <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
X-ClientProxiedBy: LO4P123CA0298.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e50ad71-2e92-4bd9-79c4-08d98cacfb31
X-MS-TrafficTypeDiagnostic: DM5PR03MB3146:
X-Microsoft-Antispam-PRVS: <DM5PR03MB31463BCE90D9AB39E70483418FB59@DM5PR03MB3146.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vN4skJ4oKmJ0bx+P6Pua6cOSR4C0nmWcuzdjLrvq3uVGsTKfVYBejX3VHOx2OfRPfrirfW44UC38EMi/+0H4hTe2C2ru/G/07nvpt8byH3Gc307wyIFVh8gP6twzQI782dpFc0JQERHPGnOQ8l0djyEDRGHWb9i7izcKWoruh9WFbAGZo3LRAPgDp/Im+oQCQbacKrok9hPdbUZlgPoKJsiqLIP0yk8MFKXtwEBLB70j9nC3O5e4++Stq3wp/LNQKzV3vsn0h5E2aqMyC7jFrOdtDJUmw6rfizBZszULLnbBaKdmhP1jjnrm8zu/plPX244fHDdxYrxw+Cz86MbmFe/TYqoQse5HtLLvopHo9uLVfnOhGyR4im/wEAUJZGIgyhu1qyyYAJRtX9pPmIv5qG8PUafa9QgY2K0AUsxcFP+5MFI6XCBxJVAqe20Qj2hyh7ilCfoj5T/+t4aeS4y2r6MdNKIs2Y7NzOtLZ85Jl6+vX6b0XzFjFJ1fn0aBwEPoi5outg5znqOImPGFe1Y8JQlEXaZ08ne5umAWl/wTKrRDDS+vppfF9+Q5Y3j2sQqmHNS7FyD1QqDQiLE2hj0Zfvy1YOZGUxj1P9XsiuXQODGmyFQ6JVXVS2MT/BxqnSEdULTGlCLKUkx73RLfWMJSOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66556008)(66476007)(4326008)(6666004)(54906003)(6486002)(6916009)(5660300002)(4744005)(9686003)(956004)(8936002)(86362001)(6496006)(186003)(2906002)(508600001)(38100700002)(26005)(85182001)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU5mUXQ3K0M3Vi9sUTZWNjFTbysrQUNpN2RzV1BJYk1jWXpPNkVBVnVGWGly?=
 =?utf-8?B?MWZ5Z1BUb2FjM1JxdFZlU2h4UldHMGtOVUxTNUNKazAvUytTSkhPbDNiTzZy?=
 =?utf-8?B?QnNGSjBaWmplZ2h4WGpCenhEckp3ZDg2cHNhT0pVWmtNWTdJQXUzUWpTcnQr?=
 =?utf-8?B?S3VnNlJ6QUorVUFQdURSUGJMM0djZUw1RnVSak9jdFNtRlQybXhWWVBVeGlC?=
 =?utf-8?B?cmlZQ2JkMWxzV2dnbUZpNVk0elJ6WnRZQWhTVjVHL0FnUy9wUCszZDZ1TTd6?=
 =?utf-8?B?RnlwTDdtUVdOdG9EWm94bzF5L2lPWHFVUnpqWHhMN1NMQ0hWM0xORHRJWkIv?=
 =?utf-8?B?L2F1c3FCSm5VVHJ4YjNTb0QrZ1Fkb0ZYMTdMUWQvbC8yVkFMbXNqNkZVNDM3?=
 =?utf-8?B?MmR2SUpQQUQyWTlCU2RMSWZLQ1lpUldBdlJjN3ovSklPcnlBbGlpVVVmSTF2?=
 =?utf-8?B?NnE0OWhwZU5sL0FtTHZQSUtzVHVZS0ZYRWVUM0tWS1hYYzZuTUl2ZklXdGQ4?=
 =?utf-8?B?VGF3K0VnZmIwSGdtcU9VdEJIQTRDNlJsTTVpKzN3aVRKVnVsUlZZQzhyRnIv?=
 =?utf-8?B?dXdrZkJsQkdzQnRVUUV2UTFyVWlqalJ0LzU4cVhVMlRpM0hNUSsreEU4VXpN?=
 =?utf-8?B?QlRaTkdKQmQ4QUZmbzZ3aUlRMURBeEhLNnVhMFJBWEdCa3NWaDc3VXJyaDB6?=
 =?utf-8?B?b1M4R0FRNVBLNjAvUjM1YUhVVUlsdGhLMVB5L1JOV1d3WFIzT1ZnbmJnVmU0?=
 =?utf-8?B?dXFsNzFXcXBhWW9LSGN5TTRoSlJEdHQyZFJjWFYxOEV5QjBWOTJxcTlkbnM0?=
 =?utf-8?B?NWtKeGorVHd1Vlk1UVNnblhHWHJxbW9kcGFyUVlJRlFxREtTL01GY1A1Qnds?=
 =?utf-8?B?SHZ2bGhHZ3p2OHlTU3BxRzZEWHowT1VOYnlRKys1UmFzMkRSNUQxbW9uNHcy?=
 =?utf-8?B?NTgzVG96ZUtMZFVpeFU1QzJ0UGQxWGFQMXVIRTBmRXNWa2lDMXU2bnI4RWpY?=
 =?utf-8?B?MzVLVk0zUVZaUzhrN0JjQ3BlV2piQno0MEtnbjB3U1pEaXZEV1FXd2x2WGtC?=
 =?utf-8?B?NktuWjkyNUJQSEQxOG5OdkNQbC9ISnA2a3A2cC81d0pOS1RkRElZZ3M3WkxM?=
 =?utf-8?B?U1JSdUdYM0duWENKSHp1YUFRN05OdGZKcTE5ZnpaYTJFREw1cVZoYkE3YlN6?=
 =?utf-8?B?TGozekJLeElhY0MvSEMzaHlsM1JYL3hZQmo1VHdTYVhVSkhZaFFLWWdxd0Qr?=
 =?utf-8?B?b3ZRa1B4WU9MVFIwNzVTMmhKUFliRjg1L2k1ZFM5VW4yZm5DTnRkazY0NEdO?=
 =?utf-8?B?cnhDMm9BUE1TMGw5YjFrSVdsZDhScURuMWI5Y1NmN1Z2SFBPYStiN2hFNkNC?=
 =?utf-8?B?S1FFOEIwekRHd2xSbVJEQVg0QTFIc3RIZmRxVk53cE42UHJUd0xpc0NLUlJB?=
 =?utf-8?B?eGNWU1pqdU9LQVlqNzRQajlNb1BpVjl0aXpBTjV0YWU0WHArU2d2d080UkhO?=
 =?utf-8?B?SmtDc2FlMU1lUWZDVS8xN3B0NndnRXVHb1BUNWYwUkFKbTFHU3hlTkRBQzFG?=
 =?utf-8?B?b2JCVEwyV29QZVlOckNXeGNNTTZhdXNORGtCRDhwR1Jzd3FnMlIvdzlrNFJO?=
 =?utf-8?B?dVRCWUgrVXlDOXhBTkdTRlF6YkN2bjJTdDNRWS9Ub25CQWh5YUEwTEh5RGYx?=
 =?utf-8?B?NUJ1bXdIRkttZVhQQk1mWFFJNXFuOU9FLzY4TVcrVHhjWGJDM01GR3Uzb1Bp?=
 =?utf-8?Q?Vi7xQbEg5GgXXM0aK8i7mDk1vGyoXesfCibHJua?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e50ad71-2e92-4bd9-79c4-08d98cacfb31
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:48:02.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAM9nJyV7vLK8OCwcNP+eX4Rri51GCZgJLAmd1a7AgLHsz6wvCn2p37lTIShBhPYXGXHm5hlrwu41O82HhudkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3146
X-OriginatorOrg: citrix.com

On Wed, Oct 06, 2021 at 06:40:27PM +0100, Rahul Singh wrote:
> ARM architecture does not implement I/O ports. Ignore this call on ARM
> to avoid the overhead of making a hypercall just for Xen to return
> -ENOSYS.

What is the cal trace of this function actually on Arm?

AFAICT libxl will only call xc_domain_ioport_permission if there are
IO ports explicitly defined in the guest configuration, or if any of
the BARs of the PCI device is in the IO space, which is not possible
on Arm.

Thanks, Roger.

