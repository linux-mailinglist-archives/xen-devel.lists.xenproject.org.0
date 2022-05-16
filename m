Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAF55282AB
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 12:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329781.553043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqYNP-00014J-1T; Mon, 16 May 2022 10:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329781.553043; Mon, 16 May 2022 10:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqYNO-00012X-UX; Mon, 16 May 2022 10:54:58 +0000
Received: by outflank-mailman (input) for mailman id 329781;
 Mon, 16 May 2022 10:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LrNQ=VY=citrix.com=prvs=128f89ae0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nqYNN-00012R-Pa
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 10:54:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e6ca8ae-d506-11ec-b8b8-f95467ff1ed0;
 Mon, 16 May 2022 12:54:56 +0200 (CEST)
Received: from mail-bn8nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 06:54:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CY1PR03MB2330.namprd03.prod.outlook.com (2a01:111:e400:c615::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 10:54:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 10:54:49 +0000
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
X-Inumbo-ID: 9e6ca8ae-d506-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652698496;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BRWcQV2OE8rpcwvZZzfT3j8Wjzpj6qxsNnZV21lWxBI=;
  b=GCsS6nvajn56pYOj3kOZYwiXlqE7MnnIpZf6besAdkaluZ9RQqTwyAn9
   /wnMBHLnGTa/MRkrTpSm84S2SxSAmqwvjx08MBO7WTkM96b0qbU9cUBBV
   zPIdFie8tzaht0u9srgZTSkBukkVNvaggn1BNDI3tgtVxkCRDOGWnjkUb
   c=;
X-IronPort-RemoteIP: 104.47.58.170
X-IronPort-MID: 71786867
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZLKl46uD1tqQpYlwxQ9Z47Q5V+fnVCVfMUV32f8akzHdYApBsoF/q
 tZmKW+PPP7ZYDD2eYgjbNvn8UlQuJLSmINlSQBo+CowRioW+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17U5
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8IMa2PscMESCJYNAJjDY9X1OSWJVeg5Jn7I03uKxMAwt1IJWRvZMgy3LYyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IImm5v3qiiHt6HD
 yYdQRNpYA7NfFtkPVAPBYhltOypmmP+Y3tTr1f9Sa8fvDGMnFIhjueF3Nz9cMDVa4J7wE+iu
 Embpz3FBR8Vatin1m/Qmp6rrqqV9c/hY6oCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYDX/JAHut87xuCopc4+C6cD2kACzRHONovsZZvQSRwj
 wDR2dT0GTZorbuZD2qH8auZpi+zPi5TKnIeYSgDTk0O5NyLTJwPsy8jh+1LSMad5uAZ0xmpq
 9xWhEDSX4kusPM=
IronPort-HdrOrdr: A9a23:tKheeK9tQzAjbeSFNEpuk+GBdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrbX5To3SJjUO31HYY72KjLGSjgEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpgdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1cjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3bRY0eTFcZcso+5zXQISdKUmREXeR
 730lEd1vFImjbsl6eO0ELQMkfboW4TAjTZuCKlaDPY0LDErXQBeot8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0WbWIyUs4mkWUkxjIdLH7AJlOJ1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEy82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBNB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+q6GjMiq9NFlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmdsPeEQ==
X-IronPort-AV: E=Sophos;i="5.91,229,1647316800"; 
   d="scan'208";a="71786867"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT2ZxZWWU1ZdZ7B4kYeu7LbhhGczglp7T3xoLukstQ0ziob2LKe0HUPZvoDsFVPwBiz5Hjc2WpkSAKbe23WaY7cwHEq7rk044DpCSHhARzTOnLEUA1nUTgUBB5OlJTfhSbQilRMLlCcGuYvVQVLddrYHXBtcxKSEJ/lxy+ITnZRB5TWBMHs1HoRpOcQ+lRuZ0Jq18EESh3is58EtMXoe1jNuhCZxXQFhwsqJ5cRW6eSfgEV6xr3KG1Ai6whxs97vUTyppRl7lb+Xd3joxVu/zvqW6r+430cdl4hnsZdC4zXdAboDd+r149o8+S5IDHeuE3sEdA/1mKC6EXL6P0MdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRWcQV2OE8rpcwvZZzfT3j8Wjzpj6qxsNnZV21lWxBI=;
 b=jnyMPesza2SgTlKXTv5X9a1SXdzs+YNF/RJtS64luWZuDa4JTKBk5nkgTDc81VwLOXmHJ82NObY4vQrEJ1kLuja4IOEELemIe3IiTXlrnSYSyDz/yhQU8rL9FmCBuWjUlKVtQeQV9usYQnwEonyuhtwZZ9Ef+riIawuIdmSLKtdZ7DVI/MuFO34+wG4qgqgA27fzrczKWoG+e+EWn4gM3JeZTdQjsekFjRavjJbe3GWxhwiNt4y4rrBKIqrxDnHPVhle9cNc7R5s3jwpgxLp0XrTqZmv6q4oZ53Fohoe7VMhlmSsv6/JBw+f9Rw9S0mIZjYvJpU7vygoja0yXMwXbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRWcQV2OE8rpcwvZZzfT3j8Wjzpj6qxsNnZV21lWxBI=;
 b=Bm1+wkuSPqvszLn5Xk/Zt3fAkNWvcoMMbSD1QgMOhh4BGlt3pG4xHboUgta/7s6fhDiVRXlC8dH42AVUZ5p0as9x59hKpNr70JCmEgxLKXZO0BLCLRVcCCFNrryTu36TKuV079PAuWhiTazKHFq52pL0QgSPx2zxPdg3Numls40=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/mwait-idle: add missing newline
Thread-Topic: [PATCH] x86/mwait-idle: add missing newline
Thread-Index: AQHYaRDBCor8/aQVu06DdNE3tX3kVa0hVJYA
Date: Mon, 16 May 2022 10:54:49 +0000
Message-ID: <508501ef-ccbc-f218-8c6f-9e9556cd3b26@citrix.com>
References: <20220516103601.25671-1-roger.pau@citrix.com>
In-Reply-To: <20220516103601.25671-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdaa419f-117c-43f9-8f78-08da372a7f79
x-ms-traffictypediagnostic: CY1PR03MB2330:EE_
x-microsoft-antispam-prvs:
 <CY1PR03MB2330E7E522B3785C63EBEC04BACF9@CY1PR03MB2330.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xCTbLbUoU0yNjMgmtwVYU/wdayw/i3ypqN5FWNGeH5cVj/oZDy2CL1/r3jjzlL0z5rTa82QtRvigHV5LJweBvFMc17aYD+40lxwd5xxJArhu1Rr7PPea4kclP/JiZjHqizmexnYBJx0xjLccC5j+kHkKkiIFDvUPCGP1YUG2sgu1wejZnUBz9h7aOMrrr9WouC2d4wwMGt7fiC3k0nYFeebgjQrp2MuxHErnAPgQmyPKW46vqo4tGdmoAGY8MymRdS6ocxSRoRn0hp873zvz4fpEWF403UqmirQsTSA0ebMonJmxJ//cVzRhfDOGnrYMSg+Q7asGFoHE7NyRo8ofqISGmSRpF4WpWwehx6AgT3iKC8V+WDJJSyHyJ1jS9cWNFjOfoeMp8AvdeO7B/x2fJ2tQqWltc1D5eAbeWL5No5LvLSVjUycCTsoZXhM2Tm5YZPQxigcJI8XTPN3I/erKFUFCQBGTbtza1rw07x/eCKgWkXY4RN2Ivh2u2P4oWRnMqh/qUiB59M0iqfc2/v7L9BGUkwCUZgPSmobJEKnU5r8b2tl8JIrhJhn/0Qno4I/bEYQJwr3rhVgfCBxNJWn0/VB6+k5ifqb0UtNIsZF79w8s8/HSYxT2DHR9VrHyj+3pQ8FjfbI2bRknuHCyJgZDWiENEFtQ4jRFBAfC9r6c41b9OXmQ3GWTfoXtOoUb4RPem0VEf+CB099upxPsWAatZNPS9go4nouRFdLkW/CXSvUeHEZsimdrX0RrGUUNxyY4Izi5a1D1HHEAbqowH+2Vrg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(71200400001)(2616005)(316002)(91956017)(82960400001)(2906002)(558084003)(38100700002)(31686004)(66946007)(76116006)(8676002)(4326008)(66556008)(66446008)(66476007)(186003)(6486002)(83380400001)(54906003)(122000001)(64756008)(86362001)(5660300002)(8936002)(31696002)(26005)(6512007)(508600001)(36756003)(38070700005)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YU05aEZqbzVqYXBxVzh3Y0Y2MkxpeXNNeHdOMldHYlBMaS8rTFpqNVBRZmI3?=
 =?utf-8?B?YWxHMkZicG12Rm1oeXhWdFp6ZWZyRjJSbCtzN0gwd0dVbWNyUWdKYUNuWmRY?=
 =?utf-8?B?RlZaSnk4QUljTzhrTHNKMXZVVTV3TUErR29IejlOd2pyamovT0tNaDVVRWYw?=
 =?utf-8?B?aFM4bUh1VUlwZWgrcXBNVEhpYVBYakNYTzNLazQzWnRreWpBSjI4SDhmYjlU?=
 =?utf-8?B?d2hZZ2F4bFRqcFdBTkZjTnRlVjltUHQzdlp3cjk4dUx6VERrNmd5ZHREclB6?=
 =?utf-8?B?b3c1RVhYd01sK1BJQlo4RFR6c0QyUjJTeC9WUkhibVNxbmN2bGE3TlVtQS9F?=
 =?utf-8?B?b0lzY0w2MFBVbXF4ME8yOHljM0dZS0h3R2RHK0EvWWo0M0VZNUxqR2FESmN2?=
 =?utf-8?B?bEhMRTBTeXcrdUd2aFRmLzR0aTBha0dieitOQ0F2K3RmRGtnVzExcm4vSmpq?=
 =?utf-8?B?SWc4Y1lZMThvdk55V2lMbnpEcTBtYm96dlFHaWhKVktQZ0dWS0ZKWm5BSDBN?=
 =?utf-8?B?NnFLZmRGUThBdmFYWUJWQ2xpd2xaZTRuN3loTy82TGovVFZGRnZ2SXdnTzJl?=
 =?utf-8?B?VzBpNTNHUDN5a1BESFhsb2svTWF1YnV0akxVSzdxWVk0LzM4YkJHcUJtUE5N?=
 =?utf-8?B?dXRvbHdidktDQ3BHei9vTDhoQURISzlzZ3FUOGFLZmUwWHphTlg0ek16dDZP?=
 =?utf-8?B?NTBFbHg2YS92K28zRHFVNHJVcDlVVFR6Q29iWU9aTjBiUi9RYnBNRjlrVDlv?=
 =?utf-8?B?YWNWY0x6V2ZqK0JDMnZlL0hVcnhJdG1aZVJoekVobXQxTlB2dytsd25nVXJq?=
 =?utf-8?B?WFAvNWxPbVE0VjY2NGxFYzFYYUVOZWpDMG45dERKcFVIeWtzcVdSSEhNYnQ1?=
 =?utf-8?B?TkxUT0IzMFQ3VG1YN2pENSs2V1kvNmQ5Vms3eXlOaitzb0Z5cGwvRGJkWUV1?=
 =?utf-8?B?RXRqemZPelBMNk1iQ2hDclNWUU9aRFI0dEs2VWZYSW8ydVJNSFEwSlJiYmlq?=
 =?utf-8?B?UVdwS2tJRDZHc01hWmdqNUlHdVJ5elc2eENYcFpyVWFYMVhhNTJtUUZuM3pN?=
 =?utf-8?B?TWlUS1FyakNYTjU2V2JFMTE0VEN4bWh1ZUVseXpPdFVFdHFsVStudFUrNjZL?=
 =?utf-8?B?ZmhNaFIrRytmdnh6cTFCV2xpMzllSlBxT29rOWZmTG9rTFVyTnMwYjBMeGZl?=
 =?utf-8?B?bTNCcFRCWEtydWxRMW12cE9pdUxSWGVJQ0EzOExEQ2Njakt6MjE4WFNkcURX?=
 =?utf-8?B?SkVSaTNmYWV0Mk9OQVNQZ3JyMFZjT2hsaEhXN2FqNlU2eVJOTUFNR3BSaW8x?=
 =?utf-8?B?OW9FQmdEZ3BaZGhsbFRPbERpRUt0MFY3WXN5emVxZEwyMzhKdTNwcm81NkNM?=
 =?utf-8?B?S29FZ1V6eVI1dlVtUHhsbWFFZUlpR0ttUis1akFSVlFZNEg4TGhiQUdQSXkx?=
 =?utf-8?B?NEY3V0k5R1hKOWw5UWZqRndndStFZWovQWQvb01WOCtPQ29ZYVFCZFhZbDZs?=
 =?utf-8?B?WFlWK0YvWGI2ZVVSdFYxUUdDaXlwKzFRM3daMm5aT013dFNuZExsTDVOVXpP?=
 =?utf-8?B?MjF5YnpwU1FJenVOS1V6ZFZrUURXdlVCOEZ6dXRZbENXTmMyWDZUU1d4c2pX?=
 =?utf-8?B?bzBLTmJqMmxSd0hBVnVjdWQ1UmZMUk1ic1VtbFBNMkhhRUlCR2JEWmVwd2ti?=
 =?utf-8?B?bDQ3a2RXN1o1eFBPdW1KMlNTcDZiT2d6K0grYnVqOTJBeWxmaTlySnk2cWtJ?=
 =?utf-8?B?UnV6VTQ0MGtGcTVkZVBlcXkyb0REQ2Q3NDBEUFNVRlYvQ0Q2Z01qdXoycUR2?=
 =?utf-8?B?bTk4QllFQ3dWT2tpNEhUWlNHclM1VXdYYlBmWFIrSmlEU1NEUFdGTSthTVhk?=
 =?utf-8?B?THJicHlUSGJpWWx5S3ZJWVZKVCtQYWFFVGd4UnlFKzB1WU1UMEVXZzFqZFBk?=
 =?utf-8?B?d2tLdjZmV3FwSVU2VkNVcGlZTDE2R2N5WnU2TXlRbVhiTkFpUSs3MGJHT3pw?=
 =?utf-8?B?MVRIVTNjTWtZK2RoMG54K2liV2tqUVJqUE1RdEhaQlhSNmNnOVlCaFZHd1Nt?=
 =?utf-8?B?MG95V2lDdXJOOENWQmNNendVazN5OXpTZzhSV1gyTWJ1NDNvNVg3ekhPOWsv?=
 =?utf-8?B?RVlpUFJQdzJaM3JCTGlWRFZVOURzTGNBcVgxVHRMNkh3Vk1HdnBURE1OcFJS?=
 =?utf-8?B?dlNyVFAzdHUrSUJRUlRMcWdYMEJ6ZGhmc1NjOHhRSGVQWlZmZW9FMnJCbmcv?=
 =?utf-8?B?UkhsN2VVOW1vcWVrM3pMU21XZG9vWW44b3NGNk01SDFSTnZsTmRBbEtLZmVN?=
 =?utf-8?B?RHFMcEtLY0Z3UDFRZDgwL2tYbHFKbC8zWXBiTXJ0TzgwQWhvZXpDekJ1NkJ6?=
 =?utf-8?Q?zFcPYQ0nru4AkOW4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F403C3498C8EA845A290F2DC3A7A61BF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdaa419f-117c-43f9-8f78-08da372a7f79
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 10:54:49.2548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dsDRTQWZewfG5tJ71mnszpOORcxtFdAVo+ax0cBkRnV7IZ75Ihdk8ykU3fDdBFWFn3GQWI5qeZ8M4s+tl5LdsnsYd8Szxoy8QjdxuHEJR2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2330

T24gMTYvMDUvMjAyMiAxMTozNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBGaXhlczogNWEy
MTE3MDRlOCAoJ213YWl0LWlkbGU6IHByZXZlbnQgU0tMLUggYm9vdCBmYWlsdXJlIHdoZW4gQzgr
QzkrQzEwIGVuYWJsZWQnKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQo=

