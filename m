Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FEF5F40EC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 12:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415378.659939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offJn-0004yg-MY; Tue, 04 Oct 2022 10:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415378.659939; Tue, 04 Oct 2022 10:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offJn-0004vj-Jb; Tue, 04 Oct 2022 10:38:31 +0000
Received: by outflank-mailman (input) for mailman id 415378;
 Tue, 04 Oct 2022 10:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1offJl-0004vc-Uf
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 10:38:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id add9523b-43d0-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 12:38:28 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 06:38:23 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6091.namprd03.prod.outlook.com (2603:10b6:408:11c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 10:38:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 10:38:23 +0000
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
X-Inumbo-ID: add9523b-43d0-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664879906;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Y8fvgDeeqM22JGqYI8DrMQ0QztqjRYjUuYOc8w7oh78=;
  b=Jgjv6xtl+785EEPovx6/rC5WCX5CcnPHHsgUhCbSLj19n+M6boP/3LT8
   3Fzq3A2gm45whoW4kFaTiCNrNbvVpT9gyzVrkmGuay9MdoqprsPJrnT4x
   OpI/FHDkhB3lRZzRRCnyz46EiCFGSm5469M0zCyUfU95E5a7nleIkdlbP
   g=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 81940977
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ALqBL2KPXOWFJ4J3vrXNrnJZSyEGnJRDYMC5Ae?=
 =?us-ascii?q?xGJyHHeKWpRNYcDrMm2QDDCkKbTWXua21jbuHuAQz0ke00KzI+dpJEvOOBVE?=
 =?us-ascii?q?mRPbh97t9r6cUfyeUPzHnKaejJW8QDgsTH/oe4x4zukpFQelCOLjCbDSROX0?=
 =?us-ascii?q?i7yRpo+PX5d4x/iMG0RDxQ3LJXfMiKuHW1N0epPiCCrevLahTuUeA+F7+BYl?=
 =?us-ascii?q?r8Xq0miRg5pxpj+T6U7xi7RaPaTIeXnurLgSb80cL08RZWnozRrw9nfjjClS?=
 =?us-ascii?q?p7m9YeyWMrRcwpfjEAZ82IQfwfnEzRK0ThLAwWN4mjfh5ADaweceLhSewybT?=
 =?us-ascii?q?7Z9axOdsYViNCJnHVPP2ZjEi6qaVeMAJp57WpzPZoiZpTO3iI40rk4iL1CRN?=
 =?us-ascii?q?smuScf5gToqWhAJuUtZF0qSOtZAuf+0h0/cCnU4OVomadjklRI2CUy05Rl01?=
 =?us-ascii?q?gjXc9P3xoWdZTebAIhg7xEv5eAQpMim1gugiNBSReSOn+BRVEiY7L3GZIr3R?=
 =?us-ascii?q?DgQTfL5xRJT8Bs/X/j3A9oepMPNFP7OEtsVeXIH+NP4LM3Yv4sIwGqBu5u9/?=
 =?us-ascii?q?QY4pUksK9SifM+uGi3s3Vhl8kwqb/lnQ8RwyptIUPb0fluYLKDiinUaZ7Uqk?=
 =?us-ascii?q?vTI6buTu7oZ+KwPWZ6L9atwtA65Vu63wmKzpZ0C94e9k+WuNoEj+5MjGdDO3?=
 =?us-ascii?q?3Sxz8FWDa2wR/ezEoFY4YQqPbMn7hpnsZubaL01s1nPUvXSE3K1tpOvgaEIe?=
 =?us-ascii?q?X+wKOSOwxqRdR38Zl7CMsIUBRfg4w3Y+I98iyvVvr+2zAlTjEmYiqNT+D0Vv?=
 =?us-ascii?q?0DhCPflpeOeoL6EdDAP9zc11ZFdvqOnSvGyRxyoU/RTxwW2RehW3YC+RMs68?=
 =?us-ascii?q?PY5CzBBfoQK41PvzpXVxoYX8Y0pxBU85lAUyIceR0wCPeBLNEzArmbUUQoJl?=
 =?us-ascii?q?bmOwAQ3jrvZIKkfN8w+gDbNoech5E2Vbj8TSsIiRopdJM+WbjAc63F1ZRb/W?=
 =?us-ascii?q?aAKry/4+a0m0uGOpeh1YbltU+UNQnN2mUl19I1d4aVefkDwwwUwzbB+0y9Rl?=
 =?us-ascii?q?BDNOOvNhc19bgCqv7uH1epSeg+VtUv60jlG7rDa6m7HPavI0LDMka/hEYBa7?=
 =?us-ascii?q?J+bI/5f7SN5hltJ9PC13q9UBfe123xHekQs5CzJeLJZ6IZfiCu34ezE8lwho?=
 =?us-ascii?q?uGpZzKovlzhLr7M4RmMNMjWbTIoysg1j+m6/kB6d8S0o/JMAO+mEWxNDAOj5?=
 =?us-ascii?q?JpiKYfbuZOVZMpo8mX+DZGn1Ap7vQuiFRHYJchI3cCTGU64jjxS0QadS26bz?=
 =?us-ascii?q?sE73ikwCfYemgjnNCwxwZi7Pwgt0fv+bdXGf42uQFXwySIiHoAbRV0BWa2cQ?=
 =?us-ascii?q?S4fL3zyf6dy8z/tfEc5s2QEqjc2gJovh6HmGP9M9vMsR/VLJ5blEIeOYsUNb?=
 =?us-ascii?q?1/qsh41omnTkOI2R261B6axyyeEQVJw/txk/sDJcR+n+35W5norVnKPfp2FI?=
 =?us-ascii?q?/3hPFWjK9YvHD8up7rpdaqJfx3ulowRVQc/MGAwp5MuWrFoyA75JjilzdDn4?=
 =?us-ascii?q?ofw7tuRrv19Wwi2iFonz8zhWZRV/hMrbC5wSxvY31nzwlEePbKVmjN+afJuB?=
 =?us-ascii?q?UsA/ds+3AQK7Z/yvH9tpbfLgsYR+X/vc3XN8ha6WFMFu76bHTlsEA6VOaalj?=
 =?us-ascii?q?6G7OH4+JqseZJ/VKG1UbEwKheqSYml2VXLZ0k+DKZGtrYWvBYMnxcSZ8uIsP?=
 =?us-ascii?q?0PoLqrjNR8txvYS5PTYEZ9KTpVc3+d2Ai32G6pzQVcPu3RqTnPRI8OnFHH/A?=
 =?us-ascii?q?XtkPFjk2hmgyb++fs8kjJqmCN4dSxvxlUNsojn8kxQKqzKaMc8RWLExJzi+o?=
 =?us-ascii?q?910PTrUgjQlGNplE/Zg93NyWooGmH2KqDTfklGUTHymcw9C1KlFc4UlgiBWj?=
 =?us-ascii?q?cK0S9ImXQ1Q3dZt7Tzg0GsMJnRKizWpklgi0CcoQiHYzdMECDN5hSJjQGqCc?=
 =?us-ascii?q?/elvgTrKvXdPCjGGLBOKahTEbZ6q4Z729pUoVFLLpeH7TXXKRSeGsjAPX3TO?=
 =?us-ascii?q?/JD1XUEvkR3U73uAPIZe/SJjFNcMkj2oJ8icuNi8MsC0ZbMfR4je5qWUjj3a?=
 =?us-ascii?q?F6WVFgcFvxA/orQXlIkymBgUHCwoMvEKiLh5DZYO0FdWHQ276PsqiKJjnTJZ?=
 =?us-ascii?q?VUle3uzDUVdCqbCKeWrgK8+3RXvgKJdpsXmCF7wUVutG/RGL4y03sk03dWAF?=
 =?us-ascii?q?JZXthAYpG5NQco2QplBU0TnIvmQxXK4pgSD+s/piuXbg02o+WBf0sySu0bMb?=
 =?us-ascii?q?6CKrdLKpHex7LhRn6l8ck7e1JxOt563Ou9X8EBmsDrAg/68YHh6REndBxuaS?=
 =?us-ascii?q?QfR9FpWCEcUcHkAbIQmYUyRQj0XOgQ9vh4D32FhaAeqJB0JYyAcVbdnx3fkD?=
 =?us-ascii?q?2jT84p/GjOyqEIzYsyRqU7WhvfHS2i/Z0aEehNqJaBi8/0NRq87ujKCHKAnm?=
 =?us-ascii?q?Q1OBZ3rAzBfyWPpWHOPr8MJiSNaSsYvTKUZUexxOFzTsUdbEUS+Ss12vp5bw?=
 =?us-ascii?q?LAEOGiZ/DCmuxMmS/y4QTT9L9fiRXbaBW0km/lyi7UQ1z/7+c4EEkR+J0tQ1?=
 =?us-ascii?q?iXt1+o26RiQRR+kFzIehaaFy1Csy1/1SvCqCEGIHbL1YOYqf3TTmBo1wBgrE?=
 =?us-ascii?q?9tiTOdylM9O/NdtUpUGn87ZNMqMlkrICENSoBNfysNZXz9uudlaxMARYZo=3?=
 =?us-ascii?q?D?=
X-IronPort-AV: E=Sophos;i="5.93,367,1654574400"; 
   d="scan'208";a="81940977"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmMJI82xP7svNC12G/xbAgpPv+yvsG5ZBHPcY25Qlj7WsNmI+9vfsUujkYkAd3XSy6hWv9hcbufuAngqS+MhlhhEn9Vq1DY5fPkSpAFO6AayQjIr7DJMgjx2coazWsWtqR8SGaRUtHWIX29l2LaGRoQjCFx0J5J+ET3uL54ePyjYMCXYIDRymQW4BF7GEZvll7VQWUjdPmnW/w1nJKGRVvLsVPpJAVbw88siIXHe1vIk5VaXxb3NwFMuGxglGCb9gUxo1lPIaztA0BWF0W7P7gaXgKautMsojzlHGqM0Keubc4ftuILi+S23ha8uJfJB7pprVZ1hTQgncckgWhHLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTIzh/cGfSG7Jmx5cM7EaLBMIQDJ9e6y/xf0WHT4DwM=;
 b=ftOVBiqOd0ZmWTYwVgC79V+jtSF7IgVEjYJ07fcjkIwy4/mdJSI/nsEaBwhuevv6bFoDHU2dKFkX3Ptvkd7/gfpmhF/cOqT1Bt6M/R/OGFpdVYYviNR60RdaF8HEY7IJc6gkh9wzBJ4sLRAw/16gL84aUT5EdDHk1TZgsEB16/KOUZhhXu1Hgv4bU0VQiDhUfcf9u/D8MrfMKzUL/OKGg+vtIshbEyg15CmnIARUTtG7M3a1rzYe2hnMgF1cfXK+bIbDcXenNB68vX7o9G2i480l7ILU7VkSJ80nXd1UjwmZy/xnIrCvW70AST7LwPrIgNPf0yJMgMqQtvEmaGXRnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTIzh/cGfSG7Jmx5cM7EaLBMIQDJ9e6y/xf0WHT4DwM=;
 b=kE8+AUW0kDgTwwjUE1ngTRW+M8te0aGBuVFaLgqMEWKsVI5YAs8dPL92AWIzyUypJ+L6FmYS/DlDjIvGWOVE0PNdNmJNFc6fSQy2lUzeILvoixJpduGWxdTZoyKS0/abq+tUO/YeBL1zhlr87Tr2/NDBu8O0Hvca3/32EOgR1iE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 12:38:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Message-ID: <YzwNGd0wiAbhDR9e@MacBook-Air-de-Roger.local>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
X-ClientProxiedBy: LO4P123CA0561.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: afa0a8d8-1838-48ef-0c3b-08daa5f48fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M/InS5t0FLI3EC6+dIJ3SOJFW6h5sUEYGQk4v2Eu+RTRyyrf4x+XtsZ5LtkR6tsGFX/nabsTXtNtvyrJdZI6Na1ed24VOVZbWthQn0gwDM4WkA5N9ZllC2543PiIgd/yygCdwliXBG8FkX3s/naHHFfbvhnJ5vaUdcT7hh7nVNjvQ2JBF/E2iuQu2kaJ7QFYu86hfwgvz9l86a/FODfaH7zGt3fYCiabrSQ2feIj+bBPJie/oa0MJ0xHKpNj8cq7O2TVW0oPM64dCSuwwWrkZAbAzXI9CdUoKpj2SyDhg/RQw0TI2m719mI+1QRprFy8vWmHUxwHfN6tgV5xwq3XN2EcV3/CETjnKYO7N5/gliV0qN0FFofUKkZJ7vRNXsKBJA9b3EhP2EaMG3jBdDGsbQSh7hp00K29KgRRvgM3jntgnIChks3t4lR8uapGgeifIvfo53grbcNV97/8OCcoi4oAHFWcIwxF1j12NAafxn/+AEQzYjPRev0+sdSPKRWl04CoWCCzKWIBhVnTJlEEpPQXlC7KFc/FGGH+8An+APoti9TpmR+yBgGuYoUIN1FIfBqWVHBfXCBsEoVx/TZUZ0WSopk/8vh6bAIU+xWokIGxCUw6IkMrh/iA0avCskHSNbTDUhZFE5b+sDDZ100O+xpFE/MfpgnqYkL/3lOyUrK0a9GjMopJWGQzEqcmmgsyIN6WfmFOO9T85YJhrOFcyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199015)(316002)(66476007)(82960400001)(478600001)(8676002)(66556008)(4326008)(38100700002)(186003)(6486002)(66946007)(6506007)(53546011)(6666004)(6512007)(9686003)(6916009)(54906003)(26005)(85182001)(83380400001)(86362001)(8936002)(5660300002)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHJFZk9kZ0pJVlpiQzl0NHYxamZGWkZHMnR1ZTVQaE10QktJd2t3ZHo3ZDFD?=
 =?utf-8?B?cGVSRVZsSU1Yb3BoOFcvMU1Pdis3RlRPOTR5ektONkJaUFJHNzJLcXJnQllN?=
 =?utf-8?B?Wnk5YnYrWWF3U05SRE9mUzd3bmptalRVNExsNmFnTHJwOU8yWXB4N2FnMFFX?=
 =?utf-8?B?S2VlQWhnUlRxR1gvT1pIZURFaGp4SlhRb3VaVUdUVyt6UTIwOGVPeEY4clJy?=
 =?utf-8?B?aU1ISUFBVjZhRzBOa2VJLzdpOXhlU2NuQ3g0blZZbjljRllaZ1NjRnpOS3BP?=
 =?utf-8?B?U0FsNVBUSWJxMlBpV0xQMjhXYWllV0wxdnJsK0JwVzV3SklhSWdVQUloQ0NX?=
 =?utf-8?B?WFBQM2lzK0hGay9kazE3N01uclozKzdOVHZYVWlxaXRicmNtVUpLMTFzblZG?=
 =?utf-8?B?UURFclpoVWZGcXRHSmFrVUVtL3NZNUhhOXc2dDlBNzA1Z0YvNTBEclgrcHkx?=
 =?utf-8?B?ZHkwMWlvVnUzdzVZL2lIMmNiK3hNWVJCSkJHY0RtOWFEeHFqK1YrYytMOFV4?=
 =?utf-8?B?KzhDL1ljdTJnMFY2OWFFdFpPSWlCTXdIVkswby9uVzZTZkxHYld0Uk1yak5k?=
 =?utf-8?B?Zm9YSFJGRDBsWjB1VnQrUkZQcitOcHZhVkxKNEhDUGZuVitjd01QNThhUjNQ?=
 =?utf-8?B?TE1EdjE5RmRhc3hoTDVmeGc5aExqV05mZWlqTUVlVGY0VE5jV1V5bHduYzdY?=
 =?utf-8?B?KzZyT1I2d0Q2d2FhRFUxb0pKbkhYQ0REb0liSVZJalJwTlhpQi9XZVNQdlFj?=
 =?utf-8?B?cmJtYkJiOG9uRWF0YS9HeUdOQTBLbnlqZDV2V294SUhTY1J4ZUVaTkFsSjZZ?=
 =?utf-8?B?NmxqN0tuUjFLSzgyWjNtUjk1WWk1bDgrZHZTUzFwbUt0K0UxTFBpMStHTEIw?=
 =?utf-8?B?WE5DMnZDMFVXb0ZWKzNUZkY2aG9tMjZaZ1N4ZUN1ODJPTUx6SS9kdG1WMDRC?=
 =?utf-8?B?UUQ2V285ajFsSGhCaE5lR0JxdjZOYmRpWHp4NkxBNnlGWjVRcHZCZ3huWHZE?=
 =?utf-8?B?LzRoc1dZWUdza2pvZm5QQjh1NlN4VlRtVmlYTTlRVEJqL2NJa2hGVjRyTjhj?=
 =?utf-8?B?dHo3dWd5bG5ycjhkOHBBcVJFcjgwT2RkWGRzc0NtTDBUN2Zsa0lUQWtRYWZx?=
 =?utf-8?B?SHYzWWY4ZjA1MlhHN1VtR1B4R2NpNTNxcXQwRk1kZmQrTG5ERnZGWm8wQ2Ro?=
 =?utf-8?B?aWxWMi9BckdSc0NEMzZjaUkzWDZad3czSGdjS0JCK1BwWTdNeDAyTnU4OEdi?=
 =?utf-8?B?YkRYR2wvUVEvVEJWY2FnTkw5d0tqRC9EM0xXQXU2TVNkRzhUTzk5V2xMNnVm?=
 =?utf-8?B?c2hkaFdaZi9jU09Wbk0ybVFOb0hTQlZkMXVRL2ZhWTVJMmJFTWRtRk02QzFx?=
 =?utf-8?B?elRKdDhrWkxFaFE2NDc5ZTlOWkdNaHRURVhNWkhJSDBHRm4zNU8vVVowbFhW?=
 =?utf-8?B?N2NTL0xOTWNvRFF4d05vUFFYbkZqV21CNURPR0JwcnFrQVNLb2h5Q1RZRzVR?=
 =?utf-8?B?Vk5qMjQrWE9iSnZYZjRHcUFYbzBWbzJIZVJXcTdDS25MK0E2YVVuQno0M2hG?=
 =?utf-8?B?MmJYNXNXV2c2d2ZtNS9NQllhN3FQb3ZCRXRycG4zZFp4eXBCZ3VMdGU3bm5J?=
 =?utf-8?B?TmVEL1k1VHI5Vmt4aEkxUUJOcjlHZzZLWFg4Q0pkS05Hd2NRQlJiR3BMc2hs?=
 =?utf-8?B?ZlZ1akZzc2R1NktqR1RuenllL0FhYUc2eTUwbVRkUG1ucmxTWGJRYVRPWFps?=
 =?utf-8?B?aExSeVRLUHVkVFV2VGJML3ZONE10eTNSNHB4b0N1dytwajVhdXVDenRMcFRC?=
 =?utf-8?B?cE9QdzhPZG9xL1laU0w3MlNhV0xrNUNiQStudURGa0ZoajRXaURna0JIbXFs?=
 =?utf-8?B?OTJ1WnBQRGRKQVZpbkxGdkZBVDBYWFlaQ0I0YnQ1aFAvakJtL0ExVVVNR01H?=
 =?utf-8?B?VDhmdVpXaVNEWlBSQkt5ZndkVlNMZjNUTGx5ZVJWK0NmaXNEZWp5dDU4OHlw?=
 =?utf-8?B?NkRiL0lrL3A3NFozbjdIZFdVUHpGWVJZWHRpVjR6Vzk0WHZsb1Z5ZUQ2bXVZ?=
 =?utf-8?B?NHlQUER4MitZeVZiU1R2V0wxRXd1RkFqZ2xUc09ZdmpaMUZaM05xRE02UkRB?=
 =?utf-8?B?SjJRelkxbnI3WmpJUWlJTkxPcUdVZDFsTFdnR2w5c0phM3lLUTUxMHJTcnBL?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa0a8d8-1838-48ef-0c3b-08daa5f48fc4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 10:38:23.1283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAWAdDo9S2+zh6UoQ+PHcvjoVpNyf7Dm6TXMWsEmwpzwVHmmpATNYI0FZPISMX1H4JdiPgGAgQHzfYeFVha3lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6091

On Tue, Oct 04, 2022 at 12:23:23PM +0200, Jan Beulich wrote:
> On 04.10.2022 11:33, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
> >> On 30.09.2022 16:28, Roger Pau Monné wrote:
> >>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
> >>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> >>>> higher priority than the type of the range. To avoid accessing memory at
> >>>> runtime which was re-used for other purposes, make
> >>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> >>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> >>>> E820_ACPI memory there and hence that type's handling can be left alone.
> >>>
> >>> What about dom0?  Should it be translated to E820_RESERVED so that
> >>> dom0 doesn't try to use it either?
> >>
> >> I'm afraid I don't understand the questions. Not the least because I
> >> think "it" can't really mean "dom0" from the earlier sentence.
> > 
> > Sorry, let me try again:
> > 
> > The memory map provided to dom0 will contain E820_ACPI entries for
> > memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
> > map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
> > overwriting the data needed for runtime services?
> 
> How would Dom0 go about doing so? It has no control over what we hand
> to the page allocator - it can only free pages which were actually
> allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
> DomIO - Dom0 can map and access them, but it cannot free them.

Maybe I'm very confused, but what about dom0 overwriting the data
there, won't it cause issues to runtime services?

If the memory is reported in the memory map provided to dom0 as
E820_ACPI dom0 is free to reclaim the region for it's own usage.

Thanks, Roger.

