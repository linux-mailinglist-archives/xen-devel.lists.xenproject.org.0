Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDE5544C8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353599.580547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wMR-0000xe-Ja; Wed, 22 Jun 2022 09:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353599.580547; Wed, 22 Jun 2022 09:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wMR-0000uj-F3; Wed, 22 Jun 2022 09:09:19 +0000
Received: by outflank-mailman (input) for mailman id 353599;
 Wed, 22 Jun 2022 09:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yiMn=W5=citrix.com=prvs=16524ee06=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o3wMP-0000ud-4u
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 09:09:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbe05460-f20a-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 11:09:14 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2022 05:09:10 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB5124.namprd03.prod.outlook.com (2603:10b6:408:db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 09:09:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:09:06 +0000
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
X-Inumbo-ID: fbe05460-f20a-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655888954;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=c28WG6AR0lcD66mP1PvtxNQndEWSn+n1+OMLxmZNS2Y=;
  b=cIrIPqgQElmFunS3i8tiDf8Zd9BSB07/cybxmOOWmaEAcojLgkCELQtv
   OGoKO0M0+KBgLinyQPABFCcpM7SzAqmPs6q6FzYvE+sngF2U7ca14Yepg
   feJ8w+67OcceKCTEYO83/vustWRhkNLuR5wncgUK2LPfEyr5POvEY3STO
   k=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 73992485
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ctQGya37X+qe0J4ksPbD5c9wkn2cJEfYwER7XKvMYLTBsI5bpzdUz
 2YaXm2Cb67fM2Pwet5yYNyw9BtSuMLVydA1GwNqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tAy24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1vkZz3YiYnAZbdhesyWRlmNzxHD/VvreqvzXiX6aR/zmXgWl61m7BCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82TBfySuLe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutriakImwC9ALIzUYxy1GDwSVjyfv0CsOPc4bXX+lXsV2eg
 m2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqF+Owm0eDjUGWF39puO24malQM5WI
 UEQ/isorIAx+VatQ927WAe3yFabujYMVtwWFPc1gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHjVGOYXeU97PRoTbsPyEQdDcGfXVdFVZD5MT/qoYuiB6JVsxkDKO+ktzyH3f33
 iyOqy89wb4UiKbnypmGwLwOuBr0zrChc+L/zl+/sr6Nhu+hWLOYWg==
IronPort-HdrOrdr: A9a23:iny006xSsfOFQxXvzoLKKrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIF/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF8nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1rop5PzuN5d3B+3Z
 W0Dk1ZrsAxciYoV9MMOA4ge7rBNoWfe2O7DIqtSW6XZ50vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.92,212,1650945600"; 
   d="scan'208";a="73992485"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irRaTbhpNJH54YN3MzO+6tOHEwcwpanTs0OnBeH8joSDsHVvSvdjqkBB+ZwTZEVFQKoVInM5DTFSZkL4YJrLnSXmlfdb16wsnP9ARm6OzaiY+rQdIIEdrj/QQF8g770iTp/5gEoB9Q0N9+nrAZHSul9pEDJtRdn4I+33VqxMNypnjC3ASYXdAJ3bXr9BQCnte3K+zLcf76fiQURqKh3hU9+6wbAWIzVQ5gzqVrsp/HUHchY77YlpLJQtVXd85YQlGVWotYOppHcq90wPNW+jUZ8MADaVsvJ6tTc5zf6g/AdKqLVtz6Y8EF5ZAFnXHpCyu3JSixpWnXbQN4EGJGlGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2OTwPwlYSOyxYUZMM3ou862fvH/R2uq1iZS7krJxi8=;
 b=X1wCTiG56JvzQyCe06ZKfV9nZeFzBORJLsXRtbKO2bnSBlYY1+ZaJaNp7tVQz75dYy8jIhyEPSRqtnh/TouT74uynqxtsTH4bjrblUprSkTCwzgLr+v0lp8D/RE605nbbQrqiaw4Sq/sTSlj1cTBOKO5Sy/X3DlcVZAJ0/mbrMCAsIq3vFPjl2johahSnfGVNYYlLV5ft7UtrrPgJHxocmrG/bETEp2C8DS9V+j0gAq2oqxQvrilou3/oqtVFZpfxYVVzVp2q0epK5vl26JIYF6KtZjbXn1hT9HThD8txufQatS9gEjXS/t55ney4WmBFxpOKqxuyMDj1KVqez/FdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2OTwPwlYSOyxYUZMM3ou862fvH/R2uq1iZS7krJxi8=;
 b=vf6t3aPYUjjWVEox4YrdHQlR6GOBTvWuifYjcGSTS98Mu0xyVzc5VhkT6nnLEckkiU+ca3W8GWp+pcGK5GVjybT3zBsB6RH7ONOQVCialdKC6CSycYlXfDV77NwYOZz/0N1N7vRntR9eAROBFrsFUV7oJilrsFjDBRRwSmHHl50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Jun 2022 11:09:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <YrLcLpsd8hOcMOGI@Air-de-Roger>
References: <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
 <YqhHtetipYTG8tuc@Air-de-Roger>
 <72c94980-cbcd-d3b3-7aad-c9db58d9c4a2@suse.com>
 <YqhXFKMlIvkQzVoT@Air-de-Roger>
 <291bb0ee-06d7-af25-79bb-e099c7ff2fe1@suse.com>
 <YqsUfH763oSchRdW@Air-de-Roger>
 <8ee15e94-f4a9-69f2-4c57-2e0cc9df8746@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ee15e94-f4a9-69f2-4c57-2e0cc9df8746@suse.com>
X-ClientProxiedBy: PAZP264CA0175.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:236::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fc0d2b8-422c-4f58-3ce1-08da542edbe1
X-MS-TrafficTypeDiagnostic: BN8PR03MB5124:EE_
X-Microsoft-Antispam-PRVS:
	<BN8PR03MB51249DF5122E555E21C87F068FB29@BN8PR03MB5124.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t9JrC8p7HHIK6Gg/761CgV36hqebtScjasBcb3DtHNzjaoE5nGBfhGIbtXEiwNxWtVaa5jGMz3a0APqYGU9aqn9xCeq9X+7PzfNmSaoeF8j3iKTm7YcExIbzJjeBHgDAsiqp5KaGs0ooIgn7LzqEraTT8bZ/Tvd9GXb2+8S9F5/j1uD93QJU0yvvRKQH9vYD9v7Uc3ycn42IsDtBHsphNFtn8a8AmO526fYPK2TJMfVtin4PR6KMCxBpYlawGnfn/fF8s/NsWpotO7GgFiN/Ck03bKXEDsXIohBI08pzW+Dj0awznhYQgms7PEqe5m/deTSd72/9kKAMK00USzqlOOQ7y8EwV/znKlxPq3W7vWu/toRStsC5HsMPf9CNstExHW6lS0PsDIB93OWgFQNHk56z/SriqB2cLB5Sryiq6vKIwQR7Ik9PBGyNp7f1CDSPi4jqTpGTS0Q5RxNTj6Y1TbYEpbErNkfCiVJPLyW4AQm8nh0EGXSnyS9rx5JfJctLRvcOmYjgmLGx4Kf8XXTTyjrmJ1XhNuardLXg4JO2qHZRSyXwoZ4HQctnvU2TdY2YOn43haG1+VSICFTScYhsz6W420PCpVOD4q26ZHpdApVMLNVb7qiI+QVd3/b0U2RyukieWOFaviEKI1yfGEZ6B45eQDW5pbIs7GKTaoltKeetodl2Brc9lYR9R7S4NxOxMC/ErrMQ3+flGfmOWwvuUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(316002)(26005)(53546011)(86362001)(6506007)(6666004)(85182001)(2906002)(66476007)(6512007)(8676002)(4326008)(6916009)(66556008)(38100700002)(66946007)(54906003)(33716001)(82960400001)(8936002)(83380400001)(186003)(9686003)(41300700001)(478600001)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzRVYW9wWWRKdm1xWkU1MWFIVWJObHVxN2FrTUIva0UxTWtoWE1yWUhUUnpS?=
 =?utf-8?B?ZW9OQVdKUk1hdkRkWXNyeHUzeFAxYTcwejgrcENZTkg5cjE4OWwrQUFZVGJB?=
 =?utf-8?B?U0ZKa3ZLWWxQTXBySmY5OUpaSHZ5d3NCbmQ5NjF6Wmx4OXdWbnkvQzdHc2s1?=
 =?utf-8?B?R2dZdHFIOVBQY2dCT25DQWpaVDh4eThmZkJYdHdITVhMWFhJNlBWbWs1MGlk?=
 =?utf-8?B?dGpIWlhKQlp4RFlxSk0wdTV4S1lSaTVHV1hqbkxXTWMzblo0Vi9IS09zckU1?=
 =?utf-8?B?WC9tWVZIZysrZXZXeCtKN0Rmc3JQY2wwYkVpTUlMdFEvRWJkUjh0L0NhNXhK?=
 =?utf-8?B?QldpZmNnSzc4NHpLZmRBanNUa3l3RmxFWE5NcjFxWkFUQmdabkxZTHpNcE9H?=
 =?utf-8?B?OC9NMytUMklxWGFsQ0xKRFhQajErYVl1eE9oa3dSNFJUYnBrQlU4Q3FPbk4r?=
 =?utf-8?B?SGxLWit3RzRJc2VXcXBXOXJxdGt4WHkwWlI3QmRnTEhPalhMOWtqSjFyazVT?=
 =?utf-8?B?OStHc3NLK040eGl1VFNVR3MxSDR4YnM2NEt3dTJXSTYrUjV5MitCcDh3c3lq?=
 =?utf-8?B?V1cxZjlrT1ZTRnVjalFPeU5oMGFMYkVINklxYXdpcEI2SlU1aExSWFVaL2VY?=
 =?utf-8?B?UURIVXNlTnB4b2FkK01IN0F1YTVsZ1owN0xPSFFhNUpmWllNZXE5d3oxM0sx?=
 =?utf-8?B?amZpR2xZcmdnU3VRU3FibGE4YjVqQUs0STQvenZ6SXVvSTBNQ2QrVVdjRjZF?=
 =?utf-8?B?MHdicnkrbkJyTkphRXJBZm9uRHdRZ3huU3NzV3h6YzY3UHVqOFVXYmJOK0ZU?=
 =?utf-8?B?dExPRnAwd1p5bEN6SnhJQ013cVFIbWxpcnUwWWk1UXlNN2JBMlNzbGhhN0xV?=
 =?utf-8?B?R29CMXhkMkE4UTdWaDJWZVhKS1RjVWZLZUh0VjlkMEsrZ3BLSXcvTy9GMkZN?=
 =?utf-8?B?cnc2OFNma3ErdjdjK1pnTXRHMVNtYzlZSjVoUlhzWXFSblQ4NW9LUU95dTMy?=
 =?utf-8?B?UFBjREM5cjF6WmJxcDdvSUNNUzBvb1RCcFErbHBmMmoxWVRmaExoeUV3eGdw?=
 =?utf-8?B?VTBnQ3orVDdRdkkwUmM2RU5ES3ZqS004aUNMc0d3bm1FemljZDZLQ0xERkE4?=
 =?utf-8?B?bUU4bklaMGE4c0tMZGhsdWRaOWN5Q1pTYzgzd0F0SVBLYWtyM0dyb1BKSWVT?=
 =?utf-8?B?OHc4Rzk4L0FZRXNDTVVXMDNZdWF6MmtaTGp5OFhqR3RQT0VGYzR6WnRvUlVj?=
 =?utf-8?B?MU1NbFlCZXkrOHhKbW13UHI5cG8vUHFLTVVpYXJYRXM3b2VHK2VabFY1SENR?=
 =?utf-8?B?SVdScEFaYi9hZ0VnRUZGNjh2Y05ZNWxtb1pjZFVFbXM3cHg0dXpxdHFwbnNr?=
 =?utf-8?B?dnRyMjVHNmYwc05TTzk0ZEc0Vmg3cGtGNVArVmhqL1hIaUhZSlR6UnZXNmpL?=
 =?utf-8?B?U3UwbVJVSE4xN2l0K0RFaGFYYkZVNldSUDZGV2g2dEtyaXFXZWxtV0NoRGhm?=
 =?utf-8?B?eDNtRlBORGE1Y2ozeUdzTkJoQXRBMjRJRTVpbFZQSDR1ZVQyeXhabk5jMXB2?=
 =?utf-8?B?MXFXenc2TkhLa2J1SlNGdVNZN3Y2TzY5aTBGUHhReW1iSHgyRm5pUTBZRXlm?=
 =?utf-8?B?eFZxUGVFMzhEZERQNENENlVFV05GZHMrNWFKSmRVRE5nWDhjQjd6SGdWQVNa?=
 =?utf-8?B?VHhTdjg4TU5LSVA0K3BHTVBLWWhpM3JGS3R3c2hiVW5mcnNoRlk3bytTaHNX?=
 =?utf-8?B?TVVMdVQwdDBGVEN1emNScFFpSVN6a09KRzAyQlhuQnB3WHFrWGcwVEgvWFI0?=
 =?utf-8?B?eit2bVNKNldqeEt3bjdLMEY3TEdUVVVpWXUwOTN5dXRuc2JMMmtycit4cnRh?=
 =?utf-8?B?QWhMcDVuRjV6RTNPazc4NU02bXRXZWhIOTEzRGg5RFBSc1duMkdvejFpT3JI?=
 =?utf-8?B?SWdFSzZMYlY5Z1poOVR1RUhsaE5HSWUzZm1SamxncnRuZ0hKSFl3Q1U1Y290?=
 =?utf-8?B?MmxBRXYzUzBCOXVLK2dHT0lhR2NpL3lQNkIrTW9oWDd2YjhZM3IzNmwzNlRw?=
 =?utf-8?B?TEtUTXhsYVpPTnB1N1FYZFVrQ3dEK1NUajJVcWZHWWc1SUg1TEhtNE5lRU1N?=
 =?utf-8?B?cUtua2IvT3ZFZ1lxY3Y0NE9TMkgwTDNRRGZQeEpyenVETkY2czRQKzhDMkp5?=
 =?utf-8?B?ZENZNzgySFdZN0NDb0ZMWHN1SmU1WUFVUE1SMUJoRzIzVXNrbmlPd0luZWJI?=
 =?utf-8?B?c083TDRheUtFL0FlVFpjREdUNUdTMEpxR0Rlbk56Yld6ZUZQeWlacnBJQUtW?=
 =?utf-8?B?b1NsUUhqY1lQWGQzWkduSXJwMHJxdGs1SUx3eXR5UFdESC9EN0xKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc0d2b8-422c-4f58-3ce1-08da542edbe1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:09:06.2265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/KtpMwv2ar78DBj7LfCRuYYykFY1yYxlhpA/TkV379S/inKKsOdBgUP6reiMSYPgT9dablixsrwvElra2Bc/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5124

On Wed, Jun 22, 2022 at 10:04:19AM +0200, Jan Beulich wrote:
> On 16.06.2022 13:31, Roger Pau Monné wrote:
> > On Tue, Jun 14, 2022 at 11:45:54AM +0200, Jan Beulich wrote:
> >> On 14.06.2022 11:38, Roger Pau Monné wrote:
> >>> On Tue, Jun 14, 2022 at 11:13:07AM +0200, Jan Beulich wrote:
> >>>> On 14.06.2022 10:32, Roger Pau Monné wrote:
> >>>>> On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
> >>>>>> On 14.06.2022 08:52, Roger Pau Monné wrote:
> >>>>>>> On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
> >>>>>>>> On 13.06.2022 14:32, Roger Pau Monné wrote:
> >>>>>>>>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
> >>>>>>>>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
> >>>>>>>>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
> >>>>>>>>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
> >>>>>>>>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> >>>>>>>>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
> >>>>>>>>>>>>>>> Prevent dropping console output from the hardware domain, since it's
> >>>>>>>>>>>>>>> likely important to have all the output if the boot fails without
> >>>>>>>>>>>>>>> having to resort to sync_console (which also affects the output from
> >>>>>>>>>>>>>>> other guests).
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> Do so by pairing the console_serial_puts() with
> >>>>>>>>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
> >>>>>>>>>>>>>> important than Xen's own one (which isn't "forced")? And with this
> >>>>>>>>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
> >>>>>>>>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
> >>>>>>>>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
> >>>>>>>>>>>>>> not convinced we'd want to let through everything, but perhaps just
> >>>>>>>>>>>>>> Dom0's kernel messages?
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
> >>>>>>>>>>>>> this request is something that come up internally.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
> >>>>>>>>>>>>> limiting based on log levels I was assuming that non-ratelimited
> >>>>>>>>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> >>>>>>>>>>>>> triggered) output shouldn't be rate limited either.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Which would raise the question of why we have log levels for non-guest
> >>>>>>>>>>>> messages.
> >>>>>>>>>>>
> >>>>>>>>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
> >>>>>>>>>>> levels and rate limiting.  If I set log level to WARNING I would
> >>>>>>>>>>> expect to not loose _any_ non-guest log messages with level WARNING or
> >>>>>>>>>>> above.  It's still useful to have log levels for non-guest messages,
> >>>>>>>>>>> since user might want to filter out DEBUG non-guest messages for
> >>>>>>>>>>> example.
> >>>>>>>>>>
> >>>>>>>>>> It was me who was confused, because of the two log-everything variants
> >>>>>>>>>> we have (console and serial). You're right that your change is unrelated
> >>>>>>>>>> to log levels. However, when there are e.g. many warnings or when an
> >>>>>>>>>> admin has lowered the log level, what you (would) do is effectively
> >>>>>>>>>> force sync_console mode transiently (for a subset of messages, but
> >>>>>>>>>> that's secondary, especially because the "forced" output would still
> >>>>>>>>>> be waiting for earlier output to make it out).
> >>>>>>>>>
> >>>>>>>>> Right, it would have to wait for any previous output on the buffer to
> >>>>>>>>> go out first.  In any case we can guarantee that no more output will
> >>>>>>>>> be added to the buffer while Xen waits for it to be flushed.
> >>>>>>>>>
> >>>>>>>>> So for the hardware domain it might make sense to wait for the TX
> >>>>>>>>> buffers to be half empty (the current tx_quench logic) by preempting
> >>>>>>>>> the hypercall.  That however could cause issues if guests manage to
> >>>>>>>>> keep filling the buffer while the hardware domain is being preempted.
> >>>>>>>>>
> >>>>>>>>> Alternatively we could always reserve half of the buffer for the
> >>>>>>>>> hardware domain, and allow it to be preempted while waiting for space
> >>>>>>>>> (since it's guaranteed non hardware domains won't be able to steal the
> >>>>>>>>> allocation from the hardware domain).
> >>>>>>>>
> >>>>>>>> Getting complicated it seems. I have to admit that I wonder whether we
> >>>>>>>> wouldn't be better off leaving the current logic as is.
> >>>>>>>
> >>>>>>> Another possible solution (more like a band aid) is to increase the
> >>>>>>> buffer size from 4 pages to 8 or 16.  That would likely allow to cope
> >>>>>>> fine with the high throughput of boot messages.
> >>>>>>
> >>>>>> You mean the buffer whose size is controlled by serial_tx_buffer?
> >>>>>
> >>>>> Yes.
> >>>>>
> >>>>>> On
> >>>>>> large systems one may want to simply make use of the command line
> >>>>>> option then; I don't think the built-in default needs changing. Or
> >>>>>> if so, then perhaps not statically at build time, but taking into
> >>>>>> account system properties (like CPU count).
> >>>>>
> >>>>> So how about we use:
> >>>>>
> >>>>> min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))
> >>>>
> >>>> That would _reduce_ size on small systems, wouldn't it? Originally
> >>>> you were after increasing the default size. But if you had meant
> >>>> max(), then I'd fear on very large systems this may grow a little
> >>>> too large.
> >>>
> >>> See previous followup about my mistake of using min() instead of
> >>> max().
> >>>
> >>> On a system with 512 CPUs that would be 512KB, I don't think that's a
> >>> lot of memory, specially taking into account that a system with 512
> >>> CPUs should have a matching amount of memory I would expect.
> >>>
> >>> It's true however that I very much doubt we would fill a 512K buffer,
> >>> so limiting to 64K might be a sensible starting point?
> >>
> >> Yeah, 64k could be a value to compromise on. What total size of
> >> output have you observed to trigger the making of this patch? Xen
> >> alone doesn't even manage to fill 16k on most of my systems ...
> > 
> > I've tried on one of the affected systems now, it's a 8 CPU Kaby Lake
> > at 3,5GHz, and manages to fill the buffer while booting Linux.
> > 
> > My proposed formula won't fix this use case, so what about just
> > bumping the buffer to 32K by default, which does fix it?
> 
> As said, suitably explained I could also agree with going to 64k. The
> question though is in how far 32k, 64k, or ...
> 
> > Or alternatively use the proposed formula, but adjust the buffer to be
> > between [32K,64K].
> 
> ... this formula would cover a wide range of contemporary systems.
> Without such I can't really see what good a bump would do, as then
> many people may still find themselves in need of using the command
> line option to put in place a larger buffer.

I'm afraid I don't know how to make progress with this.

The current value is clearly too low for at least one of my systems.
I don't think it's feasible for me to propose a value or formula that
I can confirm will be suitable for all systems, hence I would suggest
increasing the buffer value to 32K as that does fix the problem on
that specific system (without claiming it's a value that would suit
all setups).

I agree that many people could still find themselves in the need of
using the command line option, but I can assure that new buffer value
would fix the issue on at least one system, which should be enough as
a justification.

Thanks, Roger.

