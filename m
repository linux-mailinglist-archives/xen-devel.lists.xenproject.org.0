Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56158C4EB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 10:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382294.617199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKy8E-00027S-2L; Mon, 08 Aug 2022 08:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382294.617199; Mon, 08 Aug 2022 08:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKy8D-00025j-RJ; Mon, 08 Aug 2022 08:29:01 +0000
Received: by outflank-mailman (input) for mailman id 382294;
 Mon, 08 Aug 2022 08:29:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Skl=YM=citrix.com=prvs=21225e93a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oKy8B-00025d-Q6
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 08:29:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 210f741c-16f4-11ed-924f-1f966e50362f;
 Mon, 08 Aug 2022 10:28:52 +0200 (CEST)
Received: from mail-dm6nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2022 04:28:53 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by CH0PR03MB5987.namprd03.prod.outlook.com (2603:10b6:610:e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 08:28:51 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::11be:5f36:d3fe:ba1e]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::11be:5f36:d3fe:ba1e%7]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 08:28:50 +0000
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
X-Inumbo-ID: 210f741c-16f4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659947336;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EeFgg0PZLXmc11B2lFa4DrrH8M4ggU2n2VlpXlpGeq4=;
  b=Bs9otyIy7/89uIboxBTlplZ48nT7B4WhH/z4EgZJhQXIww117HVkKzbd
   E7+KC4IEUrAPWpRhlVaJbfs/w+WUEXM09fE8E+RgOSDcmOPca4kBUhBto
   uuT6GdqhY8eZgmQ8FKopkvqnEQj0C2SmPJ14btmMi/HgaJKaMPd6UTqpC
   c=;
X-IronPort-RemoteIP: 104.47.73.48
X-IronPort-MID: 77582049
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AVW8AiarPhKgzGXiJzN6WB3HIVUdeBgzWbkVqE?=
 =?us-ascii?q?Vv9NTMMstF8BD8lAvKqVEvT01k6UjGKW5A0biNCDDI/1qKvmsqJXJeNWK6q+?=
 =?us-ascii?q?LhGXo7d3WT2RcH+5BKnk/E4X0tSYnEDQWceaIfoFnoXCksJESOgcm0Oz3D1Y?=
 =?us-ascii?q?+kN5KhljsjiHpHlXUVn/R3tPvtvdVdgfyOtjWz2P0tVE7Y2xybiJ0N3CMxzM?=
 =?us-ascii?q?eMAs6HjGDgXbFOZ7KfvMgMpNjmXZYwvSWDxIAzJB4/wzBt4Dui6+DDbAYR8D?=
 =?us-ascii?q?L+jYlIbcOTdRVFZUFuczWxRbWJDCz91PGKkjhmMb39DKX9A2CgnrJuPxz/Hl?=
 =?us-ascii?q?u2OHHb+KWexiKHyBvHIZAdzgGpu3IumGcwAzdwUYLt1tUQg7QbAkjQllJM6s?=
 =?us-ascii?q?5bzfzPEO2qpdUu6JKcDyCj4ttFzoXmcTKE6K1YfAgYnIIqMFu33kB9Xdmwkr?=
 =?us-ascii?q?cVFB/AwnQGpqSNJbm8FxyGFaI8yItJoet4Uvo+47tKNfsgi9UwEfz2rS/pM4?=
 =?us-ascii?q?bhy7ZBpbKAIq/Lr2iYDJqKV+KrfeRBZlxaLsn4g1Qn+QP7yJwi4CdN8zMb6x?=
 =?us-ascii?q?H7hiDrcLmGHc3akhEqiwOXqev40XXH0W5nX+H7UJvtyUjAx+0NDIQHgzJ+Bn?=
 =?us-ascii?q?3b4C309y9webcUmwsNVF84OjICBaB47nndWuK/lwmGr3iqQ0Ltyqx8h6yEsC?=
 =?us-ascii?q?EV90P2d+JIOT7+6hz+m5aLsWPWv39VCfmugM5X5RP8E0ugyx53VbzqtnzHN3?=
 =?us-ascii?q?2l13XCqkVUAOsfSOM/4xmLljbpbeyLm7ygXmu8kzD32dI87qKwRAkzgYHxLC?=
 =?us-ascii?q?bqI4ZZP+r1BRvjz9eX4b1a8xfiF6OOqYJliEsUcvi5uVN2xweroBMvLU9veN?=
 =?us-ascii?q?p4ONUnIEqqCDJEmFky5LHPB+7taTj+lwUPBgzNoxFBEq7WGoQnp+43plzDyJ?=
 =?us-ascii?q?I2oFJtPbroD0y8uYE4WF68JTXV5ABCu1Y3x3A2Cz7z8BhHOzieTyHtCZ3YXs?=
 =?us-ascii?q?vtZHBOTF6E813tPyEmtWZWFUGlAP8dGiI3Ix1kb48MeoLW4iISU/Wr5M9yLF?=
 =?us-ascii?q?qlXqnD7hV7SSCCZrSH5x7f6prIiUYCe+8xtMO5ZnEOavwJ0M6ADR/jH+ZoYD?=
 =?us-ascii?q?as7TnCU8LeIj+YUr0rH3V5E8kZiBdXZOd+0fg1gGt6J8CCbqXpsv0tra22dL?=
 =?us-ascii?q?yMZnS6UNifzY4KE0joZz5cYP0ZPOfxh5ptyeEaWiuRfN2zMst90/yekbn7/N?=
 =?us-ascii?q?z0usGAykXWXBPMtdKGvGTHw1tmAIs9ADXX4LC1NLyZgvZfmN+dOVMuMIRCN5?=
 =?us-ascii?q?MUoFC5hEW7+z8EsHZBVoHt+7BQL+i1Ul6ba2kLTG0nLTagDIQM5LqRDZI/dl?=
 =?us-ascii?q?gdYA+5jsvSyMjWsqyDWCsjseBwHAPpplmHaI0OMmMGxwgor0q8ArryIA/UF1?=
 =?us-ascii?q?kip9EcITRJOU0NyrxHaX08YMOhkuzs9cTQ5kfcvyoO9dout/51Uhy8ZspvIY?=
 =?us-ascii?q?rr/qPoajGjYIjqQZNtiAE74Zj1OkTxHL4ecn7Lp0dfaTiHbu/RFMyG4VvHKs?=
 =?us-ascii?q?SwBFW0rfBJ6yPm7WKKFT7ak+6IRzMYlqOSrttpimJREo4PUDk2a7P+8SGyLW?=
 =?us-ascii?q?Fu7I/+OnK8QAPC2VxarNoTl7cTgiY9M5FREudLKYEn5Fkhda49B6DZaJ3Lmu?=
 =?us-ascii?q?qNKTG7OaKNKb2RY9Oz1Hk39CGlHN2AUewJ/KdIkop9hbSjw1NtLEe8s4XPW0?=
 =?us-ascii?q?6ICIKfUPO+aNtdO4aP340pZzSvvqEjoBmtMbKBn8dvna36KXeT/YKsvJ+Xba?=
 =?us-ascii?q?O11q8LuATHb+iMiUETqBQKnsMsySEt/2RjjwFmKry2VGxNy13aJ6mGwtS9hr?=
 =?us-ascii?q?7OHGI3qwp6zu+MBqud7r2EXbSFIgaz/FUCfNLdtcA2K/4sN7VrhNrCBQfCWa?=
 =?us-ascii?q?2ZIDaMg598OzOg7J9LRF2LazmxbrFKxzMzyv5ugQhnaeBvM3k3fh+NmGaueM?=
 =?us-ascii?q?iKqxK99NHnUImlsKZtYNuIGGazrN3rTi8DYTL/hLHTG/EGvLvMLjJDH5dN9z?=
 =?us-ascii?q?19Fx0sPyOxUvBp43+7ih1uvuAEt5TYp9dZHWAcvfG4/r5YBSASwIamlzVtnn?=
 =?us-ascii?q?rbIYSnvUJJ192p6NAizLzw9bbOfjEWmhOMYFxXZH1EnIDMjmvNev0PrqJjAd?=
 =?us-ascii?q?n8JlU4WZ0PUJMINd7GzBUOvPe5+lD/J7KprO1vRPL11Rw6aqblQH4vd3Itzx?=
 =?us-ascii?q?+pX/j+py6hL1kba8fjIxoS5W+pht0WbyMYLYJguB0V53f0ZC8mlqkwkeoqdS?=
 =?us-ascii?q?yWayKYMvjXn9uOuLmgDYJXK/ogh/Ry/fTlA59+S7mCSlYh3x2+rDAfE26IWy?=
 =?us-ascii?q?J+WmKZGlsz+AiiMgBxe/ceGNXQbvaRw61/g941pzT4LgJ1/aT7mdY1twWcHE?=
 =?us-ascii?q?8fk1WTa8V1x4oFY?=
X-IronPort-AV: E=Sophos;i="5.93,221,1654574400"; 
   d="scan'208";a="77582049"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAOxjlm3BiU5MDAOt3z7relYO6pGn4CDLJharg+cVO6VJTiXRiauaBvzLtVbgM3yOJNUcDe7S9N/GXnCuiK9PWEpDXDS9/c6FzfKjQzdVbp0XHkOgsRh9Jj6hLYvoeHoN3m3Y0fxT4DMLtPdcPuZt9m8V4zsno2B58elPMRLgDjQ6lNNiL5w89N13ybsSeyQDVvbKBwKaU8yNVdI2uPjrhucHSLA0tHbWVQS1R6/Mt/LB3EgTq56olgvvPGReEOIXH9tc+lUZjtDt0VoDmqyflr/qpIFqoSv9rPZDPEpGP55lFpsYqigeF+9zWESF0K6tnJ0zpE9kjEZ0k3piIjAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeFgg0PZLXmc11B2lFa4DrrH8M4ggU2n2VlpXlpGeq4=;
 b=SZDSkwruBzErxyuipnYheSxXt+Ni9ljNr9v+WlnsoEnjOu4zvRGVeoze3b7EcnUj/3yPvbIYBpd8DCBA1KArHgwk+yqnbFdVUSPntxG96EDqr7E3kLQmQWTph0tNuDubMgGZjPpCPMv1igDTbdZp1HUEVXQMa3J4C6NvD89MD/yZW5z0p7GYD7Kw0z6GbVRJ7HC7bdOGCpJi1oR76JwngthLwRtUbvZlYNOlF1YXlxLkohuIXK9/fUjbfDptQedPh9zkhJ9fMMXg/IFOF9gtNaCQBAQV1wKa4b8YtQUzalAjEfl8BY616Itc//kC38AMmNKXZZzH7i10McZxEmCoCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeFgg0PZLXmc11B2lFa4DrrH8M4ggU2n2VlpXlpGeq4=;
 b=W/MasjRe2JCAj1Yy8xJEpdDvbjIscgCpBxWfJvd5/OEsS8gky3ZggzqvN/q9yQZOpo0ZVXXte6MHexoJydeme9fV6uH9gYsn9ZfltPZ4HDqj2BHRRjW9/5bkjO0WrouKFv+fy62svyXYx6+OM3lpkROJWTfmJeoVH/wtXDOahzQ=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 7/7] tools/ocaml/libs/eventchn: do not leak event
 channels and OCaml 5.0 compat
Thread-Topic: [PATCH v1 7/7] tools/ocaml/libs/eventchn: do not leak event
 channels and OCaml 5.0 compat
Thread-Index: AQHYo3Q0OnbES2PbE0uxc/5mBalu0q2gpUyAgAQVkQA=
Date: Mon, 8 Aug 2022 08:28:50 +0000
Message-ID: <404E8D81-3409-41FA-8DBE-3D4136D3938E@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <6e5fd9edfea379b69682fa538141298fc1bc3110.1659116941.git.edvin.torok@citrix.com>
 <cb9b9589-0d0d-d644-385a-eedcdb90f733@citrix.com>
In-Reply-To: <cb9b9589-0d0d-d644-385a-eedcdb90f733@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ad6279e-2fe3-418b-0883-08da791805ab
x-ms-traffictypediagnostic: CH0PR03MB5987:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Vb6UKzAuUVcVmP42CbIFAigXsRuW/y3Gj61TYNmYKRCewXtWHGqUjB+ymJ98nHFjRy17lt0sEEceAjzgBSpq32Nvasz1TJZJZJ+ixgagO4wqT935koY/d/pdj4Aq/Cdj/S9Q4Fp9cDP5TFIQdGQNsCtShFP32SQmmnu45qD6D4ZUP5sO+g5L3Et2nTfFVto5zr3ZpN55TbGJWMjrYEw7efa9Y4hzdgAEsM9dDAgrQx+DfcyFkHVzzUYmP5kDQJQ8OKMJbHXmPvAbLKLwkl7xXo2z+m7QSXKgMBJObDgnXunO6+StZGzFm8VAof5oxiQ31P2HdcM6+LfAlCUx/2FG3tKPBJC9W4U52PyNy5AQpwfzScy4Q3eFHqQlWBZ5icf7N/UZFt/KAjZDdec/8O5P4FWtXfD/yI7+kez5oj90O73v/pHZ7ag65fctk9mc9KyM5h7Soft8mFKgpOFVnu6p8s7WbhFM+cANcd7Pubej/E6G6BfowZuO/YcPpMjrAHKBlDtxNesrT3S6fUI4K3y4i8UGpDT64/cxBphw2J6ePw9XT1zAliINGVyTnZB3EgvBMzIsHU0Vam2KDd10xz/xR78WO/wXR1h4IeE+kTnIGw2dSiap7mMVRxUgJrX3pFxuKAUR+ss4r2GoAbycDrCgDpYeB4OzMrI1OgiMAV/BghPIoZqjSH/cFGia/iK9weAbK31GtRg4rGRl1uHkWl6ExoWSaSPYWCwJazlHJMuAocuIALJg7kN8uUfrH3imEdQuFE6l1jW+vF7fzZvAu5nnSdek+3qfj/DNYc0WKbiab3HVTAsi+CqBWP68pwmJAXE5HZvOtLGAdnvX21Xo8S6mTdy36Lyxi/i6sPCOhfng9CfuR6HYsKSQ1aPS2QXXJRAb9wa38qRbLQjPRBHbtHjA5w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(37006003)(54906003)(6636002)(316002)(6486002)(478600001)(966005)(71200400001)(41300700001)(2906002)(91956017)(66946007)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(5660300002)(76116006)(6862004)(8936002)(38100700002)(122000001)(38070700005)(82960400001)(36756003)(33656002)(86362001)(6512007)(66574015)(2616005)(107886003)(186003)(6506007)(26005)(83380400001)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmR1QVhHSWhnTjN5VmFIbE91RXBwWEsrOUtxdGorVjduc3BXQkdzVEZtcHlv?=
 =?utf-8?B?RFNJN0QvMjdLcWlEMHNtUXJLQWVUOTBhemtnS2pWUHZkSElxMExDTXVpYTB5?=
 =?utf-8?B?eFNmUWkxZTUxYWpvZW82cksrUHpuSmJZa0N6NjNrQnhuUEVrTC9yV3drN0x0?=
 =?utf-8?B?TituaGd5QmV3TGpLVE5BZU9pSUNUbVJvcmx1Z3VhQ3BNaWV0b2NBbElQbWU4?=
 =?utf-8?B?b2Z6YVAwRjJkOElVNHU3Q2p5RC94WlpKVG5BQTJqR1F6b2dCR2F6SG9rVHhP?=
 =?utf-8?B?OTdqcjBDaXJ3ZWg5MGMwTjdLK0cxSUtSMllpVlR1YTBTUThWK0ZpdHpGckxS?=
 =?utf-8?B?WlRzK0VqQnlrSENTYmNtWWc0MlU5dGV3OWVXdWkwUFdSeElQNWZWM0ZkRGhC?=
 =?utf-8?B?Mlk1b0cxQ3NwT3RLUmsvUkVTUGJibG90ZVNsTzNrSjhXSDBJaTd3T1NsSlNG?=
 =?utf-8?B?UE1Ic1hKYzYxYmN3Y2RlYkJsMnY4UEVZQjdZQ3dqczcvZ1piTzFBaDZvTUlY?=
 =?utf-8?B?Q3Jma2lVM09NKzZhQUczSUZkMzJpRjVTWmUxK3Eyd2hYZ1B3OGNadmFyRjNO?=
 =?utf-8?B?MldVQURkejdGRVllUWM3K0VXU3gwc24rZm1HSy94eTZYUjhyeGt3WGM0ZExX?=
 =?utf-8?B?aG5TS3hlMXhaMXpHb2Y0d3M2ZFg2Z25sa3UzSmdFVjg2VSszM0VkcUc3ajI5?=
 =?utf-8?B?RE1zQURzQ09FZmg4RHlEK0NZYmJBUDJjanhvSTdXeGdXbnc0eG1uRkp4QlVp?=
 =?utf-8?B?ZmxxaWcvQnVBanFEaXhVZjlGQThMelVCZ3ZwVFNHUzZKVVNDbDVTcXNvaFJv?=
 =?utf-8?B?c0lNeGFXV25VT3dvN0FmWHRiNUFyOEs3Qk1Da21wWnEwR3BmK1ZuRzF0Z0xj?=
 =?utf-8?B?cEMxNEdJelptdGJjYVFvZFJQZlY2L3pOdk1TNjkwS0lLNEVoTkt6b2cxVFlq?=
 =?utf-8?B?RzNnMnVONWZ1VXNYK1hNcUhzTVdaTFdLaStpcTExNklYUFRQTXRSdFM4WExV?=
 =?utf-8?B?b0NVbndKNGZjdC81VHZZNmpwRW5qY0dCNy91VkVZREJsREhmeGY4UW5IODRx?=
 =?utf-8?B?WFZEbThJUkExeVVRNXpSbGVqbVZ1cVpwOUVWc2E1eXY1NHJVbXZrSDJMS3M2?=
 =?utf-8?B?VWg4VUVvcU95YlorME9KellDaEEvZnJDRDg3R3RMbFRKazIwZU5MZ2pDVEM3?=
 =?utf-8?B?Y1lPL0toVGY3QTA1TUNNMk5DQlBybmR5R2xuSHhBVDJwNldXWHNYYzFkcS90?=
 =?utf-8?B?S1NMUmZLY0E1VkVBcEVSdW9jVEljYUpuOTFEK3V4TUM5OWlOVkdPWVpxcWRG?=
 =?utf-8?B?M1hTMEVxYzYrazVydFhTNHB4YythbU1EbVZUMnIxejVTMURTRGhGL0lrbjhi?=
 =?utf-8?B?R0xzam0xQ2RiVitIUUJFRFRNODBLazNjaEpmYU9JMzA1eDYyeDZoM09RN3ZG?=
 =?utf-8?B?RGRrSmlkazl0KzIxeW84YXloR2JQODNCTWlacklWUzlWZXJrR0pRTXVYZGho?=
 =?utf-8?B?bGhud1FYUG9jL3NvYUFITnNUSnVtaTJjcXpFcWhPcGNPbklLbXJUV3c1OFBs?=
 =?utf-8?B?a0NFaThkdlBmcmZqSGNoa1c0amp2eVVTYWg0QXprLzlMVHJvUjFsT2s3M3FJ?=
 =?utf-8?B?eG1XNlBVWm1VWTlLT3BEVGFpRk5ubjhQMFBlelpveWFoSFcwS0pJQjZKMy9J?=
 =?utf-8?B?cW45Yklxa0haSWsydFBnM2JYdnZWcU00NW90WnRScEl6bXc1bW5WcnJzbmdY?=
 =?utf-8?B?WTRQRVVyUnVmSzRlUk5VdmxFS25ieWxsU1FnNm9TZWVHbW92eE9GME81dVhz?=
 =?utf-8?B?TUkzc0FJeVFDcmFnODNKSnAzVUFhSGpvNFl5Y3dUZEJvRFJLUXk0WDJTSFdU?=
 =?utf-8?B?MGxReU1CRGhZZU5ydTdzUEFudnFCMk1odFV1dzkxUXAvN0w2ZzZDSmVGQjY3?=
 =?utf-8?B?UWhEeEQxN21jc0twUG1PcjhrdDZGWUN5SUtFcDVLUUVacHhFS0xpNWUwRVpn?=
 =?utf-8?B?Wko0MDc5R2FZOTE0U2hRUzV0V3UyNmVRanJyRHdDeDVUNS9XdEp0amJ6VTVq?=
 =?utf-8?B?TXVncEx5SmI0OFF5UnRTQ01CdDlLNHB5ZVE2UkdmRm9PaitJNE0vZTFuMXpQ?=
 =?utf-8?B?emxjRGdGaVVGWFpJaTJlcnBKUC9wUHVDelZMNFovYmp3M3FBZkZpeXZwNDlW?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C006C78A1F8C984ABC3DC58A56890C45@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad6279e-2fe3-418b-0883-08da791805ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 08:28:50.6991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEMTkDjPsAArxoWn+vz5ASsWjDPQ73dfjytain96s82XHlUw6ScInotKrWZZTBgUUK3FrTMo0xO4lmhQWTh9/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5987

DQoNCj4gT24gNSBBdWcgMjAyMiwgYXQgMTk6MDYsIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMjkvMDcvMjAyMiAxODo1MywgRWR3aW4g
VMO2csO2ayB3cm90ZToNCj4+IEFkZCBhIGZpbmFsaXplciBvbiB0aGUgZXZlbnQgY2hhbm5lbCB2
YWx1ZSwgc28gdGhhdCBpdCBjYWxscw0KPj4gYHhlbmV2dGNobl9jbG9zZWAgd2hlbiB0aGUgdmFs
dWUgd291bGQgYmUgR0NlZC4NCj4+IA0KPj4gSW4gcHJhY3RpY2Ugb3hlbnN0b3JlZCBzZWVtcyB0
byBiZSB0aGUgb25seSB1c2VyIG9mIHRoaXMsDQo+PiBhbmQgaXQgY3JlYXRlcyBhIHNpbmdsZSBn
bG9iYWwgZXZlbnQgY2hhbm5lbCBvbmx5LA0KPj4gYnV0IGZyZWVpbmcgdGhpcyBjb3VsZCBzdGls
bCBiZSB1c2VmdWwgd2hlbiBydW4gd2l0aCBPQ0FNTFJVTlBBUkFNPWMNCj4+IA0KPj4gVGhlIGNv
ZGUgd2FzIHByZXZpb3VzbHkgY2FzdGluZyBhIEMgcG9pbnRlciB0byBhbiBPQ2FtbCB2YWx1ZSwN
Cj4+IHdoaWNoIHNob3VsZCBiZSBhdm9pZGVkOiBPQ2FtbCA1LjAgd29uJ3Qgc3VwcG9ydCBpdC4N
Cj4+IChhbGwgIm5ha2VkIiBDIHBvaW50ZXJzIG11c3QgYmUgd3JhcHBlZCBpbnNpZGUgYW4gT0Nh
bWwgdmFsdWUsDQo+PiBlaXRoZXIgYW4gQWJzdHJhY3QgdGFnLCBvciBOYXRpdmVpbnQsIHNlZSB0
aGUgbWFudWFsDQo+PiBodHRwczovL29jYW1sLm9yZy9tYW51YWwvaW50ZmMuaHRtbCNzczpjLW91
dHNpZGUtaGVhZCkNCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogRWR3aW4gVMO2csO2ayA8ZWR2aW4u
dG9yb2tAY2l0cml4LmNvbT4NCj4gDQo+IFNvIHdoaWxlIHRoaXMgbG9va3MgbGlrZSBhIGdvb2Qg
aW1wcm92ZW1lbnQsIGRvbid0IHdlIG5lZWQgdG8gZG8gaXQgZm9yDQo+IGFsbCBsaWJyYXJpZXMs
IG5vdCBqdXN0IGV2dGNobj8NCj4gDQo+IEl0IGRvZXNuJ3QgbG9vayBhcyBpZiBPY2FtbCA1LjAg
aXMgdmVyeSBmYXIgYXdheS4NCg0KVGhlcmUgYXJlIDIgd2F5cyB0byBtYWtlIGl0IHNhZmU6IHVz
ZSBhIGJsb2NrIHdpdGggQWJzdHJhY3RfdGFnLCBvciBhIGJsb2NrIHdpdGggQ3VzdG9tX3RhZzoN
Cmh0dHBzOi8vdjIub2NhbWwub3JnL21hbnVhbC9pbnRmYy5odG1sI3NzOmMtb3V0c2lkZS1oZWFk
DQoNCih0ZWNobmljYWxseSBpdCBvbmx5IGV2ZXIgd2FzIHNhZmUgdG8gdXNlIG5ha2VkIHBvaW50
ZXJzIGZvciB3b3JkLWFsaWduZWQgcG9pbnRlcnMgcHJldmlvdXNseSwgYWx0aG91Z2ggbWFsbG9j
IHVzdWFsbHkNCiBlbnN1cmVzIHNvbWUgbWluaW1hbCBhbGlnbm1lbnQpLg0KDQpUaGVyZSBpcyBh
IG1vZGUgd2hlcmUgdGhlIHJ1bnRpbWUgY2FuIHdhcm4gb24gc3RkZXJyIHdoZW5ldmVyIG5ha2Vk
IHBvaW50ZXJzIGFyZSB1c2VkICh0aGVyZSBpcyBhbiBvcGFtIHN3aXRjaCBmb3IgaXQsDQpvciBv
bmUgY2FuIHNwZWNpZnkgYSBmbGFnIGR1cmluZyB0aGUgY29tcGlsZXIgYnVpbGQgdGltZSksIGJ1
dCBpdCBvbmx5IGRvZXMgc28gd2hlbiB0aGF0IGNvZGVwYXRoIGlzIGhpdCwNCm5vdCBhdCBidWls
ZC9saW5rIHRpbWUuDQoNCkEgcXVpY2sgbG9vayBhdCB0aGUgbGliczoNCiogbGlicy9tbWFwOiB1
c2VzIEFic3RyYWN0X3RhZw0KKiBldmVudGNobjogZml4ZWQgaGVyZSB0byB1c2UgQ3VzdG9tX3Rh
Zw0KKiBsaWJzL3hjOiBuZWVkcyBmaXhpbmcsIHN0dWJfeGNfaW50ZXJmYWNlX29wZW4NCiogbGli
cy94bDogdXNlcyBDdXN0b21fdGFnIChhbHRob3VnaCBpdCBoYXMgb3RoZXIga25vd24gaXNzdWVz
IChpdCBzaG91bGQgbmV2ZXIgdXNlIGNhbWxfY2FsbGJhY2tOIGRpcmVjdGx5LCBidXQgdXNlIGNh
bWxfY2FsbGJhY2tOX2V4biwgc2VlIGh0dHBzOi8vdjIub2NhbWwub3JnL21hbnVhbC9pbnRmYy5o
dG1sI3NzOmMtY2FsbGJhY2tzKQ0KKiBsaWJzL3hlbnRvb2xsb2c6IHVzZXMgQ3VzdG9tX3RhZw0K
DQpTbyB3ZSBuZWVkIGEgcGF0Y2ggZm9yIGxpYnMveGMuDQoNCj4gDQo+PiAtLS0NCj4+IHRvb2xz
L29jYW1sL2xpYnMvZXZlbnRjaG4veGVuZXZlbnRjaG5fc3R1YnMuYyB8IDI5ICsrKysrKysrKysr
KysrKysrLS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy9ldmVudGNobi94ZW5l
dmVudGNobl9zdHVicy5jIGIvdG9vbHMvb2NhbWwvbGlicy9ldmVudGNobi94ZW5ldmVudGNobl9z
dHVicy5jDQo+PiBpbmRleCBmODg5YTdhMmU0Li5jMGQ1N2UyOTU0IDEwMDY0NA0KPj4gLS0tIGEv
dG9vbHMvb2NhbWwvbGlicy9ldmVudGNobi94ZW5ldmVudGNobl9zdHVicy5jDQo+PiArKysgYi90
b29scy9vY2FtbC9saWJzL2V2ZW50Y2huL3hlbmV2ZW50Y2huX3N0dWJzLmMNCj4+IEBAIC0zMyw3
ICszMywzMCBAQA0KPj4gI2luY2x1ZGUgPGNhbWwvZmFpbC5oPg0KPj4gI2luY2x1ZGUgPGNhbWwv
c2lnbmFscy5oPg0KPj4gDQo+PiAtI2RlZmluZSBfSChfX2gpICgoeGVuZXZ0Y2huX2hhbmRsZSAq
KShfX2gpKQ0KPj4gKy8qIFdlIHdhbnQgdG8gY2xvc2UgdGhlIGV2ZW50IGNoYW5uZWwgd2hlbiBp
dCBpcyBubyBsb25nZXIgaW4gdXNlLA0KPj4gKyAgIHdoaWNoIGNhbiBvbmx5IGJlIGRvbmUgc2Fm
ZWx5IHdpdGggYSBmaW5hbGl6ZXIuDQo+PiArICAgRXZlbnQgY2hhbm5lbHMgYXJlIHR5cGljYWxs
eSBsb25nIGxpdmVkLCBzbyB3ZSBkb24ndCBuZWVkIHRpZ2h0ZXIgY29udHJvbCBvdmVyIHJlc291
cmNlIGRlYWxsb2NhdGlvbi4NCj4+ICsgICBVc2UgYSBjdXN0b20gYmxvY2sNCj4+ICsqLw0KPj4g
Kw0KPj4gKy8qIEFjY2VzcyB0aGUgeGVuZXZ0Y2huX3QqIHBhcnQgb2YgdGhlIE9DYW1sIGN1c3Rv
bSBibG9jayAqLw0KPj4gKyNkZWZpbmUgX0goX19oKSAoKigoeGVuZXZ0Y2huX2hhbmRsZSoqKURh
dGFfY3VzdG9tX3ZhbChfX2gpKSkNCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBzdHViX2V2dGNobl9m
aW5hbGl6ZSh2YWx1ZSB2KQ0KPj4gK3sNCj4+ICsJLyogZG9jcyBzYXkgdG8gbm90IHVzZSBhbnkg
Q0FNTHBhcmFtKiBtYWNyb3MgaGVyZSAqLw0KPj4gKwl4ZW5ldnRjaG5fY2xvc2UoX0godikpOw0K
Pj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgc3RydWN0IGN1c3RvbV9vcGVyYXRpb25zIHhlbmV2dGNo
bl9vcHMgPSB7DQo+PiArCSJ4ZW5ldnRjaG4iLA0KPj4gKwlzdHViX2V2dGNobl9maW5hbGl6ZSwN
Cj4+ICsJY3VzdG9tX2NvbXBhcmVfZGVmYXVsdCwgLyogcmFpc2VzIEZhaWx1cmUsIGNhbm5vdCBj
b21wYXJlICovDQo+PiArCWN1c3RvbV9oYXNoX2RlZmF1bHQsIC8qIGlnbm9yZWQgKi8NCj4+ICsJ
Y3VzdG9tX3NlcmlhbGl6ZV9kZWZhdWx0LCAvKiByYWlzZXMgRmFpbHVyZSwgY2FuJ3Qgc2VyaWFs
aXplICovDQo+PiArCWN1c3RvbV9kZXNlcmlhbGl6ZV9kZWZhdWx0LCAvKiByYWlzZXMgRmFpbHVy
ZSwgY2FuJ3QgZGVzZXJpYWxpemUgKi8NCj4+ICsJY3VzdG9tX2NvbXBhcmVfZXh0X2RlZmF1bHQg
LyogcmFpc2VzIEZhaWx1cmUgKi8NCj4gDQo+IFRoaXMgd2FudHMgdG8gZ2FpbiBhIHRyYWlsaW5n
IGNvbW1hLg0KPiANCj4+ICt9Ow0KPj4gDQo+PiBDQU1McHJpbSB2YWx1ZSBzdHViX2V2ZW50Y2hu
X2luaXQodm9pZCkNCj4+IHsNCj4+IEBAIC00OCw3ICs3MSw5IEBAIENBTUxwcmltIHZhbHVlIHN0
dWJfZXZlbnRjaG5faW5pdCh2b2lkKQ0KPj4gCWlmICh4Y2UgPT0gTlVMTCkNCj4+IAkJY2FtbF9m
YWlsd2l0aCgib3BlbiBmYWlsZWQiKTsNCj4+IA0KPj4gLQlyZXN1bHQgPSAodmFsdWUpeGNlOw0K
Pj4gKwkvKiBjb250YWlucyBmaWxlIGRlc2NyaXB0b3JzLCB0cmlnZ2VyIGZ1bGwgR0MgYXQgbGVh
c3QgZXZlcnkgMTI4IGFsbG9jYXRpb25zICovDQo+PiArCXJlc3VsdCA9IGNhbWxfYWxsb2NfY3Vz
dG9tKCZ4ZW5ldnRjaG5fb3BzLCBzaXplb2YoeGNlKSwgMSwgMTI4KTsNCj4gDQo+IFRoZSBtZW1v
cnkgYWxsb2NhdGVkIGZvciB4Y2UgaXMgdGlueSAoNDggYnl0ZXMpIGFuZCBpbnZhcmlhbnQgZm9y
IHRoZQ0KPiBsaWZldGltZSBvZiB0aGUgZXZ0Y2huIG9iamVjdCwgd2hpY2ggd2UndmUgYWxyZWFk
eSBlc3RhYmxpc2hlZCB0ZW5kcyB0bw0KPiBvcGVyYXRlIGFzIGEgc2luZ2xldG9uIGFueXdheS4N
Cj4gDQo+IERvbid0IHdlIHdhbnQgdG8gdXNlIHRoZSByZWNvbW1lbmRlZCAwIGFuZCAxIGhlcmU/
DQoNCkl0IGlzIG5vdCBqdXN0IGFib3V0IHRoZSBtZW1vcnkgaXRzZWxmLCBidXQgYWxzbyBhYm91
dCB0aGUgZmlsZSBkZXNjcmlwdG9yczogdGhvc2UgYXJlIGEgbGltaXRlZCByZXNvdXJjZSwNCmFu
ZCBpZiB3ZSB1c2UgdGhlIDAgYW5kIDEgaXQgbWVhbnMgdGhhdCB0aGlzIHdpbGwgYmUgZ2FyYmFn
ZSBjb2xsZWN0ZWQgdmVyeSBpbmZyZXF1ZW50bHkgc2luY2UgdGhlIGFsbG9jYXRpb24gaXRzZWxm
IGlzIHZlcnkgc21hbGwsDQphbmQgeW91IGNvdWxkIHBvdGVudGlhbGx5IHJ1biBvdXQgb2YgZmls
ZSBkZXNjcmlwdG9ycyBpZiB5b3Uga2VlcCBvcGVuaW5nIG5ldyBldmVudCBjaGFubmVscy4NCk5v
dGljZSB0aGVyZSBpcyBubyBBUEkgZm9yIHRoZSB1c2VyIHRvIGNsb3NlIHRoZSBldmVudCBjaGFu
bmVsLCBzbyBpdCBoYXMgdG8gcmVseSBvbiB0aGUgR0MsIHdoaWNoIGlzIG5vdCBpZGVhbC4NCg0K
VGhlIG1pcmFnZSB2ZXJzaW9uIG9mIHRoZSBldmVudGNobiBsaWIgZG9lcyBwcm92aWRlIGEgY2xv
c2UgZnVuY3Rpb246IGh0dHBzOi8vZ2l0aHViLmNvbS9taXJhZ2Uvb2NhbWwtZXZ0Y2huL2Jsb2Iv
bWFpbi9saWIvZXZlbnRjaG4ubWxpLA0KYWx0aG91Z2ggaXRzIGltcGxlbWVudGF0aW9uIGp1c3Qg
bGVha3MgaXQgKHRvIGF2b2lkIHVzZS1hZnRlci1mcmVlKTogaHR0cHM6Ly9naXRodWIuY29tL21p
cmFnZS9vY2FtbC1ldnRjaG4vYmxvYi9tYWluL2xpYi9ldmVudGNobi5tbCNMNDINCg0KQXJlIGV2
ZW50IGNoYW5uZWwgYWx3YXlzIGV4cGVjdGVkIHRvIGJlIHNpbmdsZXRvbnMsIGlzIHRoZXJlIGEg
dmFsaWQgdXNlIGNhc2Ugd2hlcmUgeW91J2Qgd2FudCBtb3JlIHRoYW4gMSBldmVudCBjaGFubmVs
L3Byb2Nlc3M/DQoNCkJlc3QgcmVnYXJkcywNCi0tRWR3aW4=

