Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABDF52EC07
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334052.558024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1eN-0000gK-K0; Fri, 20 May 2022 12:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334052.558024; Fri, 20 May 2022 12:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1eN-0000do-Gl; Fri, 20 May 2022 12:22:35 +0000
Received: by outflank-mailman (input) for mailman id 334052;
 Fri, 20 May 2022 12:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns1eL-0000dY-Gt
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:22:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 845a2afa-d837-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 14:22:31 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 08:22:27 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB3253.namprd03.prod.outlook.com (2603:10b6:910:51::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 12:22:24 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 12:22:24 +0000
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
X-Inumbo-ID: 845a2afa-d837-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653049351;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WR4yy3JeEeqy9x+5BqS1xYw3IpQBa8MXbtJRIXiOWdo=;
  b=KejB0BzhkOdZgAc+B/HbX0rkQlhLks4PpvoNtc33uKGWanY5LCNTIHYT
   QEmcNUH6f9iz7D5DK2hPWNI5f8RyD5ueRfy/EXdydtz759hFvKbYoXmZp
   /Iolbp/y2eDAG+ftlsgAbSFtZ6Ibw0CqMbRwWmkU76D70V+l4zHpZO7ui
   s=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 71790984
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8qIII6nZqHlP0sqmacDQ6ujo5gz7J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWXm6FM/2IMDf1Lo0iPYzjphkPupWGzNBqGQBvqSoxECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWVvV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYe0AkDpDvmPkkDgBVKChyEoAY/KTBGC3q2SCT5xWun3rE5dxLVRlzF6tHv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOVvZkBhG9YasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8Q3E/ftnvwA/yiRyzOjAHf3KOeCUH+xojl/Jm
 SX30GDmV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUS9wWl2qfSpQGDCQA5oiVpbdUnsIo8Q2Ms3
 1rQx9fxX2U36PuSVG6X8aqSoXWqIy8JIGQeZCgCCwwY/93kp4J1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW3t3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:zRF1xKPlP8TtMMBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71790984"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ0sQOQXQ2I8ZjTSXpDTuBzAd59DuV93eeN86X5ePYZ4KLbGuW5AJi/+wGjcMuebgjoZOOtdECYhy+Nrjf/i3v5umLaoaaOWhtzr1E7JetnPHjx9hbinWEiQSR45IX6/FljNIrcoVmkM6CEsCV0piA7duhsOrTTwGhZUhMSHf43/NCiwV7kotTG+mof1jRM38CrbY7o1shvAi1j9FUzuZHXZE8A7Hi0xgYk2T8S9WEyraIhflUQFKLwD1W7TP8CjQAs/cBN0HBrX4bZLSpMTok7Jr20lPhViqxVvGOikh6IqcDbz91DfpMuHqGBFtoHqksKGZmDYc5+gq9loTsBUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/LA+0Gfb12hAYwy+8E0wEGgvXmIqfNUmIkMT/r8nYg=;
 b=VGbSCTuusj2Gq/PdJyQ5Q3k9lje5ihvlOPy1nkAUzIcDKekXw7yo21cLufVy0w09/aye11l6ElSFxZBc1HmDiK0xkxSli7Ann2ZjY4l+3xDNH4M2Fef4elorMOARxvB+TuuwFDlXMYlxejwcJPnnCH/vlFaAflb43PYHk1QXT8EImdGVdLhRFwav+ndSKMF7eCd+Uyo2FmTsWxxoT8fpy9bKM/bbQ2jYBy4THJuZNP/L8XSBS5qWBa66hWFFbu3slZJbMXHqXBfBQOf2uEy1Vk3WeQpvTIArx0cs4O+ubNdGIaELSpjUJdSvDMkinloKh7lx5sqtAXmEg+Em8rncUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/LA+0Gfb12hAYwy+8E0wEGgvXmIqfNUmIkMT/r8nYg=;
 b=TTXWWAQyxcerf5rqiJM9FErta1l2Z9dVbn2ichtMQH8Fgs5mnX1Smn9XGGJqjtLTZsTj0NxyuDcJUEBgHQaR/61dwaqc3418pOz4arHKqi15caUCztICC7FOVYXAcmCs34LVVGFOZof0c5ImZ6zkhsHMzwD48xk/QkzkcMEREG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 14:22:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Message-ID: <YoeH+9eMU0ui68Mn@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
 <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
 <Yodx21zhWtZCV2dY@Air-de-Roger>
 <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
 <7163fdba-c128-1226-e1cc-d210c5db06ad@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7163fdba-c128-1226-e1cc-d210c5db06ad@suse.com>
X-ClientProxiedBy: LO2P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be269eb5-3c5b-4b2c-67f6-08da3a5b651b
X-MS-TrafficTypeDiagnostic: CY4PR03MB3253:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR03MB3253BB6F803BE9988C0C0B918FD39@CY4PR03MB3253.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gY3poQkUa4JuBGEDooYq1gh4Su+WREddECfqly6WBKsjoGNKcUugJEZrye2DEqh3Gt0ye4eYasKNbmYyyvbDumslKvLZBb/fmUtI2HTixiqMZBubgkQs32zuiUJxKCH3wqp6A4BJHCOddfKbmxPsJbjUFU3MpqCsTyuTpyEZgnDUQIivJPl6lhHN824BGZSQFnkjQMLx/bWN1FuHD2t3imnswMkZSp1AhgAIX82jdVGOjKwqLORP6ixWKA9lXH37MSwLg7KHMa++jPoIBolCPUnJyBrpjCCXARouzi6ENyINAVcxb3CEG4fMydeHqa5O3yZQpOKC7T19ndicj6h7ZnudkoQSCotg+vtD6h38UcmOttIxz70Wsl0UaEcWupqBxlERvbqs0g7k7PHfrhzu+K9M88iHq5yy3j/k9deKEVwiUQ6RlHqvHAkKuNAwC+nnl3kHeiIt4Xg86PS8s3VXOGG/pspTZfSGWskH/mwx8tmEFqqFPlhO+bCiZ4+F45nbmuUkRm4ZGO29YNqQSLBdVVnl+yK2Xm0qY5jQ2yX9B3Oe/orc9Uap8OU6bpRBXNr3B4jCrukDbQinxdczYxDOXTZN+LRJeBCJ1bj66Gcej8j/IlsJK9hjVB6g1lezkzfCdH5TatHpH7CM7sl/CNcwwNHpi5qqVYJc/gya3jOU6NvtJVEuj2+O8nHlMJ0zAiaV944FGzSpLodJ+drd5gxQVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(5660300002)(6666004)(86362001)(82960400001)(8936002)(6506007)(9686003)(26005)(6512007)(53546011)(83380400001)(186003)(2906002)(38100700002)(85182001)(6486002)(508600001)(4326008)(54906003)(6916009)(8676002)(33716001)(66476007)(66556008)(66946007)(316002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXlHSklubWM5K0R0ZjRkMCs1VHZKS2dyV0VkamFhT2JMVkhHVGZYMk5RTEE4?=
 =?utf-8?B?ekVSY3F3UHpwZnRwazJxMG5zUnRUUUgzdXA5aUFuNTFKalQ0VXZZWnc4clF3?=
 =?utf-8?B?WDhDNCtta3dxcGd4NWQxdTI2ZTFGNTljZUJuaVlFZzFodWovak8wT3FsWWdR?=
 =?utf-8?B?bUF1MDlueUtKRlF6V3drZGFYTDlhUndZZGk1cDNDVDdGaS9PeHNQdnR0RmhR?=
 =?utf-8?B?WkhOSU9XbXJ5ald6dExFT2V4TmZGRXNtYUlCMis4VGxOanlnMDcyTTg0cU1K?=
 =?utf-8?B?b29FV0p1eEp2dndxZkJNa0FsRmtCOEM2MXZJOGR2V08rcndENUVhMnIwdnFE?=
 =?utf-8?B?NkpmV3N4Wm1TVG5SVGhBbGlvbmlVejBQUVJzRU42MEN2ZzlPemlwd3pONmty?=
 =?utf-8?B?S3d5amZJdklpME9XcXZFb0EwWHNLVkZoNkNZWDVnQ1BoL2tLN1F0dkpHWWVy?=
 =?utf-8?B?TTlReERkRmx6VWNmbmR0ek5NanppRnJCWUFYYUFIbm1FRlQ4b1RRWFJiemlZ?=
 =?utf-8?B?U25Ta0wycDFrblkyS2dMMzUyNGFuNjErWVlPSXFzbjk5Mk16cDdib0RVMnMw?=
 =?utf-8?B?MU0yYnFrVUpCbERMcnRlMGJnMGJRdkhxS21RYTE5Zm1FTXFhMzM1VVFucXpU?=
 =?utf-8?B?Zkc0L2haZ2x4eUNhd1drM09BUmpFdVZ1cHlTZmRXR2M5U1AyR21EY2lVMHE5?=
 =?utf-8?B?TlpPWDhhWVdnL3E1ZXFUSWtTQUNPNFNvZldKU0szb3I2WkZtYjdKby9FaTl5?=
 =?utf-8?B?eXZZVHo5WkFEemZBMnhaS0hOYXZXYlpobUhRTHRSRFh0Sjk5ZVl3WXl2RVV2?=
 =?utf-8?B?UVNVZWJFS2F5TGxnNDRXdHpVTjR3VGxibFhWZDNnOVM5THdPV2N2QVA1aTZ1?=
 =?utf-8?B?NzJMWU9EaGtjOFZJaks4aU9BTTdpaHdBbGxVZlpMZXp2S0M0OTgydWo4TlF3?=
 =?utf-8?B?T3VKRmlzL1pwejV6QnhYekJvZ01wNkdoK1VTSU1aRWllSDgxV25QUjh6dWRt?=
 =?utf-8?B?eUtWbVhwbkJhOWQrdUNHZVhOS3RCZi82WHhwQityWlFBV0Q3akVUcHoxUWJt?=
 =?utf-8?B?a2E5K29nT2ZMcHA5OURrZllEWFcwdW9sSDR1ZFFhRkRId0l2RHJtWFFWbVNX?=
 =?utf-8?B?eE94U1BwOEJQdUNSa0JuYTN6UkdBWVRzNnl4ZDA1L0tvSXdDcHI1YnlQMzVa?=
 =?utf-8?B?QWRiMWdVSk56Mnl1UDgxYVlzaGVTTElmbW1pWjI5ck15VlJHYU5HVU5nQjU5?=
 =?utf-8?B?b0o4aEVwNXRYWm9OUnNhaGtJR004NDQ4cUlMWHo0dU1JUnRtNm5KSnV5cjBO?=
 =?utf-8?B?NDIyUys1SjhSQ1BDT2xWK1VoSHR0dUdWKzZidkxjdThDRlFoQUhRRkkrMjZ1?=
 =?utf-8?B?cXRLY0xEdEVGOHNmeVZtM3BCQ3JIK1BYODJUVGFFUmN5RTdyamdOQ3FxdzJv?=
 =?utf-8?B?WVA5ZXBHeGVwODVrTWdyVkc2VmlFZ2JtdEVrTGZjbXMyRDRlNytTT0g0UVpK?=
 =?utf-8?B?WDdySU1zRVhGYXlramxQYnNwNzlOZHduc005aWlZanNEZVFVL2IrdFRnUk5D?=
 =?utf-8?B?S2s5SkdyODdWWTRZMGltZUhWOG1oL0VXa1JrVnRZWlFaZjR4L0dvSDlRaXhE?=
 =?utf-8?B?L0JldnVmdnd0Y2N4OE5QWTJ0TTRxMjBERHpPTHlrTFJBMTJPSUhRUjNGbTFi?=
 =?utf-8?B?SkRBaGwzTEpDbisyTE5kTkJxTCtsMXRjWWx2UTd0ajhsRXFFSnhYdHZ1eC9R?=
 =?utf-8?B?YlppSmdtdTJyeUNvalljK0I0c2FSSjdkNngwcFdVajBZWTJySUxHWEFKSThT?=
 =?utf-8?B?ZmcvTk0wVE9BNXBzZkxCVVFITXZqblE4aTdZMWlEYllpd0tQS2ZtRnUzZFB0?=
 =?utf-8?B?YlpudzlWLzQrejhDbS9OcWtmUEdCNW56MytRVXNyb2MwQlJpNm5QSHVBa1Vs?=
 =?utf-8?B?TWg3SnU2UHdCeHJLc0hnT3ZNdFlDZnhhbWk2R3R4bjRidVRXVVo4ZnpLR09V?=
 =?utf-8?B?WkJZVHZXOWYzOFE4TXR1Q09qUTV6T1hxM2VSaFFEWmxHRnRNZldlblRLbldn?=
 =?utf-8?B?VkVJa3ZoK0ZtbkJlUzdmWHp2dGIzVnI0WmZtSSt2a2FYVmczZ2Y2bTFOTUtE?=
 =?utf-8?B?aDBEOEhJVDVGNWVGRkNwa2hOdGw2dUQzZHRRVEV5eUo0SEFOVmxpaXVKcGk5?=
 =?utf-8?B?NnJodWhDeVJYNWhMYVdxc1RhdjE0dTVXL1ZtUlpuWDNiTElnd01nWXZJeUVi?=
 =?utf-8?B?SzB3Z3hUS0haSU5ZSmRRb0k4dUxidjkrWmw2KzVEUlpsTnJ4aXF3L0svbEkv?=
 =?utf-8?B?TWNWWkRNR1l5cFd1Z0ExdjRVYnhXY2RnQ2QwS09YaHJEb3lLT1l0Z0dSVkdO?=
 =?utf-8?Q?lrtUNlG1wPPZ/+8c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be269eb5-3c5b-4b2c-67f6-08da3a5b651b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 12:22:24.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3r4IG1F32W3BZ8hs7O5mDuzUeZCAqVCxZ2QapdJ+XgRdOdyVe2KX3RC8zVU66jZNLx3OSUqASAm+xM1/EXBykQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3253

On Fri, May 20, 2022 at 01:13:28PM +0200, Jan Beulich wrote:
> On 20.05.2022 13:11, Jan Beulich wrote:
> > On 20.05.2022 12:47, Roger Pau Monné wrote:
> >> On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
> >>> On 06.05.2022 13:16, Roger Pau Monné wrote:
> >>>> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
> >>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
> >>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> >>>>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
> >>>>>  
> >>>>>      while ( nr_ptes-- )
> >>>>>      {
> >>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> >>>>> +        ASSERT(!pde->next_level);
> >>>>> +        ASSERT(!pde->u);
> >>>>> +
> >>>>> +        if ( pde > table )
> >>>>> +            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
> >>>>> +        else
> >>>>> +            ASSERT(pde->ign0 == PAGE_SHIFT - 3);
> >>>>
> >>>> I think PAGETABLE_ORDER would be clearer here.
> >>>
> >>> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used anywhere
> >>> in IOMMU code afaics.
> >>
> >> Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm not
> >> sure what's the rule for declaring that PAGE_SHIFT is fine to use in
> >> IOMMU code  but not PAGETABLE_ORDER.
> > 
> > Hmm, yes and no. But for consistency with other IOMMU code I may want
> > to switch to PAGE_SHIFT_4K.
> 
> Except that, with the plan to re-use pt_update_contig_markers() for CPU-
> side re-coalescing, there I'd prefer to stick to PAGE_SHIFT.

Then can PAGETABLE_ORDER be used instead of PAGE_SHIFT - 3?

IMO it makes the code quite easier to understand.

Thanks, Roger.

