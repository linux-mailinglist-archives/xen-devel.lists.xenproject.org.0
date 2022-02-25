Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7E4C497E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279496.477210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcoN-0000sf-My; Fri, 25 Feb 2022 15:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279496.477210; Fri, 25 Feb 2022 15:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcoN-0000pr-Ix; Fri, 25 Feb 2022 15:47:15 +0000
Received: by outflank-mailman (input) for mailman id 279496;
 Fri, 25 Feb 2022 15:47:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNcoL-0000pl-Uv
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:47:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31d9db39-9652-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:47:12 +0100 (CET)
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
X-Inumbo-ID: 31d9db39-9652-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645804032;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=loGFyJwM+XwR3P9i5ZVFpp7f5j+1dFNkkb9zZFsjBzw=;
  b=TR8+MSTBiVBKZKf8GvvgjigI0URJEJ9BwFYHMQK+d5hPSJNWcdOWFdM0
   lSZ3PW6hzK4rMptAYb4QDFKrf6txChyhpm8Y91kceoB3A/RyP4dC3jXRk
   eb81o6QV6noq50CsYX27WQLJae16qYPhiryXBVXsHL5AXiCYtDgTeNZjq
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67269168
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:poInTaKefz5aWqFUFE+R9ZUlxSXFcZb7ZxGr2PjKsXjdYENSgzcCz
 GMeCmCCOPeMY2X3L95yYd7g9EsHv5bRnN5mHgRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2NQ12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M1hm8KIWyASB6P3orpDejhdGWJOILITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glv3J4fRKiOD
 yYfQRl3XU7POQ1MAUlNCIBjlcPwtEfPcCIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfTnSLgHoMJUrTg8uVthnWcw2USDFsdUl7Tifuzh1O6WtlfA
 1cJ4Sdopq83nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILMzyjHPnojdQdPU+Z46uYXQDZp5
 kKWyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi8XBm74j/m/LnwElSEbrvpzu37qbEQQcujuk8djL0t1gpDGJJimHB1LQ60RqiBNrIJrVil
 CJd8yR70AzoJcvc/MBqaL9QdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 BKM5VoNuccLZCPCgUpLj2SZUZVCIU/IT4mNaxwpRoAWPsgZmPGvpkmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 r6zwePRkE4BOAA/CwGKmbMuwacidiBqVcir8JUMLoZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHB/6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:vMWk46oppDH6tC2+WJMByccaV5vHL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQMEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0BjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXd
 WGNPusqsq+TGnqLkww5gJUsZyRtzUIb127q3E5y4OoO2M8pgE786MarPZv60vouqhNCaWs3N
 60QpiApIs+P/P+UpgNd9vpYfHHfVAlEii8Rl57HzzcZdM60jT22tvK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67269168"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yqxjpxw8kDzv3/Gv2fNX9ZAU3ZigskmPF11lxlXE0nE4VlHpdvsl+v5uPLRnpi0mycaChifYO3RZKg4IBRmfIN82GHg6HXWQolCFDGlomp9hSWHHRs4KH+GcETMUfxFWHd93RBTsWOYZAMwE8xiu7FSdwFyegz4BVwgsCW4PpCBeiVgw61XXx56OhwMqDfWgzm0Q31otmHeqKXpWAY9zf7DxvwwgKgW8l8mElG7vYl0xQ4vphafXwYtWPRjdPXktkHwEnX+r+osEeJJNBX7s0nV8bTBeBhX2NMoG9BpnvtKSQf62gunV4H4w+V4vkYIREA6lOZx9O2n8kkDbqY4oGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMwwkm+CmVlz7ID6wMu0ZzsE4q/CT+KGXGDH/hWKlwk=;
 b=NUXZIFz+r9HlmJZAHNaSXfBiFFdaLNu2Ncu9mWXnqnMCNkK6rzWgnCpqo9W7oV3lKtAHiIgQEEU9+dUHwH6NWRranTwPse0/HchvIhIZLkEyQIbgoQv33OxBsdQYVlJRJrZWp8ObANeSvG4K/SvL+uD4Hob7/HyJYpCThXJXHz3vRTCt/ZEg/GjXtMvkKRDbIv5TUd0bep8HxpalJLd0vtIt1r8daHGGkd0P3e0gcjDsYhZwF9GMVUywNIiDBlDcc2HkXIEav/4fKC0T3/UD9WkpPXj8MZT/Tht3o4Y7Wh9qtZXCPzEbgHu/0l0JFwpvZ+fdYXVxA5B35pQHJ0iYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMwwkm+CmVlz7ID6wMu0ZzsE4q/CT+KGXGDH/hWKlwk=;
 b=ZR+38If7Ekb63IM4wml9nzFt+3Zf3QQzyt5Uo1Dw7rEQAK3Ll4sSsgPMDTwaLWZ8SHcQkICapvoHrWIr/7Ccd3g9MrH0/9teUYEL/F8FiTwylNJZbCCRhEJ1b1Tnmb2/ikO5UMeBUCiePC3IH0HpNKAmP4VoVBT0WhLjYyi9FYk=
Date: Fri, 25 Feb 2022 16:46:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: PVH dom0 and MSIX memory mapping issue
Message-ID: <Yhj58BIIN2p4bYJ8@Air-de-Roger>
References: <c33d1731b054a488974f96b8171b7b1b5aa61b4a.camel@gmail.com>
 <a96d555c-8540-1f83-f110-a47904e74b55@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a96d555c-8540-1f83-f110-a47904e74b55@suse.com>
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 081e39d2-e16a-4f91-51e7-08d9f8761083
X-MS-TrafficTypeDiagnostic: SN4PR03MB6718:EE_
X-Microsoft-Antispam-PRVS: <SN4PR03MB6718660E3CE40ED71C6F7ACD8F3E9@SN4PR03MB6718.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Ccnedb7w4sUUYg3dj217B+yLzlGCGUc3Hrxvilpd3Lz180iQbyDXbLh6wOnBMpJX8N93McwCebcsDQYT616L/NgYN5C4x0EkOMkGs19oDRDpeDbrjwDuBUwd1CJrSDD7XE47LYDBHM7zyqEy7vVtsOBeq3thNOyZA7h0iTTcQpinGYgaYgNcakyzuN8vjrL/qr5FUz9L2uarrGxCijtbPYI7HES++zXxecjvZB2VtCNOMqadOczDtMcRKIcIrH+RV1UqrJbTyK3IvtPSxL9csXygjKBIJHFpDY4OV0KLgEPOtDsKuxhEVI9ebBxXlHk2R5Lyj5IbrhOWGcWEwzJ/aMQfGGPDKEVecpuVUUNT47fcRGrL1plYADerPpAofMFCdzLLgueyR9kZMCUvldMQ45xuvy1cLnBltrv7mi2yAQ1DNCzFB5WAQSNN6TZ+O880DGOIfdmL8yW6UzAZvkcmdAwYdJyNF6VJjWUqCGOg0CXPC5ju38URtMEw3iKDesk4LBObxfG80IQL+QXxOhZU4JrRk+O/FK6wXWG1NP0jraEABbSDV/6a2gcBuHs/fsAIoy3nvY7xVuJ10DU+ysDxSPDMafAKGyTiStCeRxBL/aVyBoNnlok7lzkstbUYkiKW7TOnLFIEg1Firhd+9+tmbkCo/3GPgOdh7H+XX2hGVXggLDpoUGy4yUitLJ/cdNUInWNzDyJzz2iufOTSzs8p4vONDS/VhwZXxcInFpdeio=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6666004)(66946007)(8676002)(2906002)(9686003)(4326008)(66476007)(66556008)(6512007)(508600001)(8936002)(6486002)(966005)(86362001)(26005)(54906003)(85182001)(83380400001)(53546011)(82960400001)(316002)(6506007)(5660300002)(38100700002)(186003)(6916009)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE45N0lCZ09KM3FpTXYwa0NoQ1g2aXVOb21Fa2p3R04yMG41KzdvdmdIRFkr?=
 =?utf-8?B?U2cvaFpGQW1VVlhLb0lycmYyb0RGNHJTQnQyT2hySUduelJHenNCcGdZNW1t?=
 =?utf-8?B?aXFwOHY0QU5zWjJYR0gvcHJkSGJBTmdicktHaGNyYWpWNFZVTEdEVU1vZHhE?=
 =?utf-8?B?SjVFK3hhNEJsN3JqdGlLUDZOUTl5QXpDWlVlMm5CK2hFVjllN2k3OUJtVjdu?=
 =?utf-8?B?ZG1qZG1sU0t1YkozUElnWk5DT0Zrdml1dFd1K0ZEeExMYklUQzNMQXNVdmpL?=
 =?utf-8?B?QlNtUWw1K3JRZ3FtZWNzTWNUMXlEWnZGSm9aWlBNd0xzT3BMbGFIL3F6clZY?=
 =?utf-8?B?WmdUcjZDNFEzaUxuSDE1MU83Rm5jZStyVm5xa1BwanEzcU1jYnlzMVNPUk13?=
 =?utf-8?B?cFcxc0dObEk5d3JUWDFuVnJxajExbUFqd0p3V3Fpb1E2bnY5dmtzMzk1dFdy?=
 =?utf-8?B?U2dLWndqaGRaV2Q1akJWWjlUSUVWcFJ0TWhGMjNESDUwcTFxNjJockpEU3ZS?=
 =?utf-8?B?M2FDYURjZFRQdWs5TmxrbnlWRVRoTWFsUE5MeWtpYWZvZEVReVRlRGdTVU5J?=
 =?utf-8?B?SHh4NzhSSkNNbktaalVUMzdyLzlrTU9wVkE0UEI1MENpQ0g4MEcwR3lydENS?=
 =?utf-8?B?S1h0OEZLU3Q4MENlbHZPNjVBTXB2Y044bkxNOEZSNjBNTXc1a29BSjdJNjJU?=
 =?utf-8?B?c0xNWjVuRTVFWlVtNDUzVi93N1FVOXArU0kxV2QwWGZ4OHdVL1VJek0zSzJH?=
 =?utf-8?B?cFRMMzk2Q0lrdmF1czN0Y29rNktEdVliYzd4NTYzNlUzcnBKVkNDYWJVZVFI?=
 =?utf-8?B?eTMwaW96UEcwTkpUMEhONjdyaDFGVXFrUnlYa3RIZVpEeUI1dTJid2VwZU5u?=
 =?utf-8?B?U081SFJ6UHZqT0FxcS9rTjJoUStQR05ZZjFaY25kUWpMVXlHamdjY1Nsc0xC?=
 =?utf-8?B?amJqVEpjL01OMVRDODdUbGhzM1VrajhMSUl2T21jNWJENWJhMGxJbTFCbW91?=
 =?utf-8?B?NmgxSkErMW1tMnJWZW5sY2VYUGM5YVM1QkpZQ29vaWx1S2dQdVhtVUlzdUxN?=
 =?utf-8?B?ZG9RSmhzeVlyQmZ2d0FPaWIxVlpMcWlYMXRaWTBxaEFZcGhVVEJUMTdzVEdr?=
 =?utf-8?B?Y1pPNXZUUWF6NUhuVThHYUpWQ3dxSkdGczFnRWFmNTBTTUtMdVhjQi9Qb01x?=
 =?utf-8?B?YkpPZnl1YUZySVViV1FjbGdtU3RnZmNNQWMvSzREdjgvOTh6WG8wcExZZkVw?=
 =?utf-8?B?MEtFb2UrMWRiUUk3YVo1Ti8waHNSTTZMUHM1MWpWRUpLSDRqdlpNOEQ4RGkx?=
 =?utf-8?B?WEtLZGREbSs1MXQ2aGpaNU5mUUZRb2h1UVZCN3R3bEZ0TVhFTzBHN3JheHVp?=
 =?utf-8?B?aHJmYjBVOE9TaWRjZ2tvdWx1NVZLRWRYZDFBK1BEOXcxMStZWHBvT3Q5MmNi?=
 =?utf-8?B?ZzJCT3hiTHErWlkzZk9Rd041Yi9GbHN0VmFTT1E5Uys3WTVHeUx5b1RiUWdI?=
 =?utf-8?B?VEdyT2wrUFV3M0cxVCs2dHIzWTR1Y1cvd29ZRFR3ZERtRjJXTkE0eWFHc0Yv?=
 =?utf-8?B?Qi9yMVpTaHhTUkJ1ZzIxU3daWG1jTGV2S3ZZZGM5UHcyc3dobDF1RzEreTg3?=
 =?utf-8?B?ZFpSWWFIRSs3SWFsS1JiKzlVWFVjSmpVZHhvcU9EaU9VKzdLZmRkWlVJWmdv?=
 =?utf-8?B?UU9YVkxVL3h0ZVJ0YnJkeTVtUG15OSs4NWNodHdQbTltNjI5VnBXb0VxYSt6?=
 =?utf-8?B?ZS9iZWtueFpvNEhFMUR3TnJIMzdUbksyVmRyblFYeWpYR21LK056OGZHTk14?=
 =?utf-8?B?OTh1RHNjUHdvbnhIK1dhVnJqSTBQVWZCcnRNUjZMbWpEa052dzJUZmR1NmtQ?=
 =?utf-8?B?T2VYR0ZGWXBlNXl5YVFadGtiRy9CNzl0dFB5Lyt0ZjExM3FVMzFHQmQwR3lW?=
 =?utf-8?B?Zjdpd1RMZzA1NEtOSHhpK3hWSUJBVkhONWMwWWZ4TG54Qmg3bUpkUk1aeG42?=
 =?utf-8?B?Vlp2eFhPNFlFM01IeEQ4ODdsNFUvVzhFWi9xUDZncUhaT0ZzOGpzM1Nkbzlw?=
 =?utf-8?B?TzhzZEw3dC9ybkVBQ2hMYkd0d250ZzhRWHBKL2NkYkJHcEpEdDlKa09zRW9S?=
 =?utf-8?B?WGl3elFseXJTOU40bUsyTTk3YXlFaUVjaDRqZlprT3BiRVBBWGVNd2Nua2Q3?=
 =?utf-8?Q?dPM5grK2tjWefEAMHkX3r6w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 081e39d2-e16a-4f91-51e7-08d9f8761083
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:47:01.8537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roBUUEvuWXg4PGqGvreU/PTz77oUB3LQ5RJZHeVQLGY2Gg/fKRKL88nz9jzYvte2Hb7eel0ZOJI5n05AvAnYxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6718
X-OriginatorOrg: citrix.com

On Fri, Feb 25, 2022 at 03:22:59PM +0100, Jan Beulich wrote:
> On 25.02.2022 14:50, Alex Olson wrote:
> > I realize PVH for dom0 is still experimental, but was trying to see how well it
> > works in the state of "master".
> > 
> > I found one issue with MSI-X interrupts in dom0 -- a fatal page fault occurs
> > when the MSI-X PBA is accessed from dom0.  It looks like dom0 doesn't have an
> > identity mapping for the PBA of a PCI device --  intentionally caused by
> > vpci_make_msix_hole() ?   
> > 
> > I was also wondering, what is the impact of "existing mapping (...) at 0
> > clobbers MSIX MMIO area".
> > 
> > Is the purpose of vpci_make_msix_hole() to make MSIX table/PBA accesses trap to
> > the hypervisor?  Seems like the page-based granularity is too coarse since the
> > PBA can be much smaller than a page as well as not aligned... 

Page-size granularity is the minimum that we can do in the second
stage page tables.

I guess we could do with some logic to forward accesses outside of the
MSI-X table and PBA that falls into a valid BAR region that shared the
4K page.

> > I was able to get something potentially usable by adding a "ioremap" call in
> >  msix_read() and msix_write to deal with the access of the PBA.  Wasn't sure if
> > this was a proper way of handling things...  Was also wondering if it would make
> > sense to do the same for the "clobbers MSIX MMIO area" cases too.
> 
> You happen to ask just over two hours after a patch was posted:
> https://lists.xen.org/archives/html/xen-devel/2022-02/msg01657.html
> Since Roger didn't have an environment to test his change, maybe you
> could do so, offering a Tested-by if successful?

I had to post a new verison because I idnd't recall that for dom0 we
also allow writes to the PBA, it's here:

https://lore.kernel.org/xen-devel/20220225153956.1078-1-roger.pau@citrix.com/

Roger.

