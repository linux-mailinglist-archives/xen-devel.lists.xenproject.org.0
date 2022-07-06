Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4E15685FE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 12:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362097.591993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92Wh-0007HW-8g; Wed, 06 Jul 2022 10:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362097.591993; Wed, 06 Jul 2022 10:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92Wh-0007FX-4c; Wed, 06 Jul 2022 10:44:59 +0000
Received: by outflank-mailman (input) for mailman id 362097;
 Wed, 06 Jul 2022 10:44:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZLBa=XL=citrix.com=prvs=179813e04=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o92Wf-00074T-UZ
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 10:44:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac5dad36-fd18-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 12:44:57 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jul 2022 06:44:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6696.namprd03.prod.outlook.com (2603:10b6:303:17b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 10:44:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 10:44:46 +0000
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
X-Inumbo-ID: ac5dad36-fd18-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657104296;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8w44/UeYtiIwsz//ewK0Bds+3fKlFyIJoI0rfHEn9Qk=;
  b=Sd5fdNvVKEpKG1d5WmCbf/HVDm727rS0POSYKbLExMrQSUIMRE8AwBBX
   1/MJnXDDX65iDnCbJaUJhdi1mJtBWy2izbMKEcj+vZfIEa3PGYotkg3Td
   gO6AO6rAILRo5JijVwjH16vR3DGERhWuCCwBqf0CMmiMgj/cWoSN9b22g
   Y=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 77743578
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8A+0LK8H/KeIQ37O8ONkDrUDqH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GQfCm/Uaf2PZGHyctt/b4jioUkGu5DUyN9jGgs/r3s8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw3oDnW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbOXYw1qOaPSofwAaQFcCSFbZIpHv4aSdBBTseTLp6HHW13F5qw0SWQJZ8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHfuMuYcwMDQY36iiGd73Y
 cYDZCUpRxPHexBVYX8cCY4knffujX76G9FdgA3K+vZsvjeDpOB3+L7TYNOJUdq6fMd+n0bAi
 V3JuH/mIzhPYbRzzhLAqBpAnNTnuT7wUcQ8Hbuz+/punXWa3GlVAxoTPXO3rPy4ok+4RdNEK
 kYQ9zYurK4970iiRJ/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceRzYny
 1uIlNPBHiF0vfueTnf13rWJqTK/PwAFIGlEYjULJTbp+PHmqYA3yxfQFNBqFffvisWvQW2oh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:StQ0z6FL+UpVoJVUpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.92,249,1650945600"; 
   d="scan'208";a="77743578"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxJz41oMXAzLiIS68tJQ2SHv0Nh2sSw0uJPlid1SqiqYTJ4sPXVxfmwDg3wMYg6NkSK8vJcyfrkjbz6y/IbrI0t3biaOEScXtXR8c25q+a9rfe5rhiRVFFPIw5q+V35pXD9AhFNJzIIHs7QmdJf5xldrUW6E1WFc4BuINjOSfTTed3MMQOE882KI1CMZ4lTU3YndjNvCJE6Hr65T5H5N21RfZ4CAYR5nrM1ytZzKrAtkUU6OT1XqAAZ8bmEcaE956UcOuSjRtu1QGSBNCFTxLg8jN1sjbfjAgANf6wTAhu0n5xDFVjQeRh1RvsogF4bZWRXdntneVr9vEBUIc3ayfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w44/UeYtiIwsz//ewK0Bds+3fKlFyIJoI0rfHEn9Qk=;
 b=FIIoLu9MLD+KZJA4ohglpJLa9bMMgh+giDpEtebzPWies03oirtI5iuVnbhOmrIyAU6UocTO0RC4OdhYk0aPLFS1tTd3fX5CUEaO9M5Fn3I0oGBXv7eF3FVP+dSzODgEFXcLTq8pOE1SyhxByxGMMFj9kIpL3syNq1dtrqvo1ASX7Qt/0szXLXwudFsOBnF4RyXYMkUEHSuE9D9DT7T1EMtV8XC+YKyIi8AefmLCyvJCK5Q/9KV1o4h1OecrGYglrstUdTdRkMI623GaVFI4bQfo/8p93tfm0FXljlnzjHzlQ8Uf4DbMpODY+5fDCqC2Owe6Ooe9Dg2utceMMaoi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8w44/UeYtiIwsz//ewK0Bds+3fKlFyIJoI0rfHEn9Qk=;
 b=C1sHPSjQ9Kt3ylKcwecJqPqktPYI+f7XSoEq60h9XY8sq2a7qcHW7lRNt2LPEqD/XBPKhoIPJdZH+eBYDWrwo2mtkHEOjwvvyCjCcsf1gLgGYAQT9UtaFLWgviiZF55AvPFQUJKXkuhhj4pqdUHH9KSvo/VbP0LxdaIAQrSs1Pc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0
Thread-Topic: [PATCH v8] Preserve the EFI System Resource Table for dom0
Thread-Index: AQHYh/bGtXoG96D86Eiyr5Btw15f161xN36AgAADZIA=
Date: Wed, 6 Jul 2022 10:44:46 +0000
Message-ID: <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>
References:
 <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
 <863733AF-212D-4059-B780-3DDC0AC58FD7@arm.com>
In-Reply-To: <863733AF-212D-4059-B780-3DDC0AC58FD7@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd23ec88-7621-4cc4-0ded-08da5f3c8b10
x-ms-traffictypediagnostic: CO3PR03MB6696:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9a5PChu6BhCpOXCsSp5ZChvkG+IGmFTHQsK8E8RcORVbLU8r/pP1jChPKhwBeq4im0LkSwI1BvVZ1syfm3Kvt89v2uQzkLX+x6k2n9nt6NDM+GJbG+wvtmHhqcpHE6nmRa3Nz+rRspZMrTnXbS99tyT/YCFeztUxVDdY4XIrRoOUduzj4jFmhcp2hZLksUp69xgzbircrLGK3Q7BEIerml4XqR2VPfitqfp6+WZIyLlmkmTGfqmFHYvImUo52bFk2Zhbsa5MEDFSqSJBRHd5g0uvf6DDbD/4AIQVesP1c7a1mOIthTaQ8mZo5Ds6zBVTwLY42RJYKXSLkLJfKgD1ZSwgRsBhHFSjybWqhBvnWGMDd3DcMDz5OWDQHTBRnRvN28Ys43lBUgy53YxhbvBe+3UchjnQyKHZTZcrkgHjJdNvxy8ZqsF6E6ZQ0HUd/LV/fKLyQyTFQhHO8snln+Iro2TTsqeNPczguEscEOrnTpCIr+exHF3ieLByOoo06PyG5UE8136pKxYoXK42JXrekQi+YZxls9A/UV7zyBR0FcO1yBkeNRL3yKv+YBwtQAMrQggaAVZ4vixe5Ld4+LP0qFpV7wjgwRtLH94LK7zo02A/cucHneHzB6G88zxpu9W43DTW/rS4oim31TEOkNf77HN6Q2BBqLQ0yaoPtrUJySrdxi6OY1O6UoERXvhZoRVremQtC7pA63oitR2tMJaA2CjVQ9y1+ZnGE8nAB0eQt5DC2HFN9RVM8zpu3VstXfjxUE2zS+KPvNhEu3oyWybaENEJ5CCeUnSSxZ+9hOoI/pwfNIu1h1Ul66aL3r/rJ9C5tgntNhrFnqMwhyGQfbauMwujGxuD3ebeg7YmTlrs+4RkHoL/EAV5n6fosihYAQgG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(66476007)(4326008)(8676002)(66556008)(2616005)(66446008)(64756008)(66946007)(31686004)(91956017)(186003)(38100700002)(82960400001)(6506007)(2906002)(36756003)(76116006)(26005)(6512007)(6486002)(54906003)(110136005)(478600001)(41300700001)(5660300002)(31696002)(38070700005)(86362001)(71200400001)(53546011)(316002)(122000001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVdGWWthS2dQZ3BmMDRUYzQvK1hybEc1YVFOaVhuczhGMVJqejlyMjYzWkRF?=
 =?utf-8?B?Wk1pTnFNM1RNdkNZTE1mYzMxQndWNElVOGxNdmdTZlBaU051dmM4WHB1YkFS?=
 =?utf-8?B?MUhZdUxqRjIvOUtBeERnWG5HTGt6MlM5OExOVXVvR3UwbG9sQldwOE9nbUJh?=
 =?utf-8?B?aDEzbTdVUkNXWW03OWI4dHJOQnY5RmQ5cGxKcWZBbnpUcjJsNW04dzRHV1Jr?=
 =?utf-8?B?Vk1pYjF4c20ybVgxRzloZUU5dzBRbWJLd0JUM0VrejFNRmlwblBPK05JcnpJ?=
 =?utf-8?B?d0h6aWVRaEpEaEwrMjRxdjF1eGluL29LN2J1bm5JYVIvSWFPeC92VVY1Z1FN?=
 =?utf-8?B?Y3RHYW1ncEEwam1mVGdjWWloVy9HaWhkZVUzYjh6cnE4Y0F5cnEvRzBnNzAr?=
 =?utf-8?B?NGVuNnJ3Q2JObkxDR2pyUHpZbGRNcVErekdkL1NsVmZMZG9QTnE2QzNqVGJv?=
 =?utf-8?B?UkVtRGRUUzhGcWwvTVk5aHNmQnFtZVRYQlhZSE5STWVyYk54ZXVOZjJSQWs2?=
 =?utf-8?B?TEtacUhkREdadkdYbExBVUZJcXVPVGJCK2ZXOFBNUDdJKzRxenFPQWZzYUJE?=
 =?utf-8?B?TjZpMENJb3dWSE9FS2kyRkR4M24rR1VWMHM0R2psUzBmdVVNMEpNenRUWk9E?=
 =?utf-8?B?OTNTWGNtam9rT3prc3YrYmhoeUdTZTI3anRzTEl1ZjRqbUt3U2gxTXhkKzhm?=
 =?utf-8?B?aVN4bkdnejMweXZ0cW1DY1M1b1ZIQ1pDU2NFVFN0a1N0WUg3QkV1cW5MeUFt?=
 =?utf-8?B?YTlpOWpFUXo0bkdFSXEzOURURVRBSDZZSnowWEQxQ0xXNTNhRWI3R3dubVM2?=
 =?utf-8?B?WFF3VGhhM2h0SmY3cDVYNnBBdmFTQ3ZYQUJSUWx5NERjZ01BZ2lTWVpFV3hr?=
 =?utf-8?B?T1JsdGRxNmlxRlNqU09aL3NZTm5iYUhwVnFMVG9zcE9sRXZHOStyakZFc0ZV?=
 =?utf-8?B?ZTIvN1hzaGFPMU5jbEpMWEFjOEY5U0cyQzNReWlVVWFnaVVwOUNTdVZVWFlu?=
 =?utf-8?B?enljVjNrdnBnN2Z2SjdyWjZIdnBVSnYxVDJZcHVMeXZUT2t6M0t6ZXg2eW5N?=
 =?utf-8?B?elNsTlhXblRnam4vYWN6ZytRQVU4Q1MvNjNpRVNJdnZ3bkdYcmhCMlBSSVpD?=
 =?utf-8?B?bkV2ZlhJS3J6eVZwcC9NT1pocmpsUjY1YWZLbTgvcEdXeDl1cU9Cc3cxWUVu?=
 =?utf-8?B?eVliMkxUTTJlM3RTUnBRYkh3RDJnZVRQWmJhTnhXK3JFSVI5aHBqQktpeWhE?=
 =?utf-8?B?L3BUR2xTc2tHaTRyWTBacTg4OG1QdmNVTTg3eWNHL2tnUWw5UUhuRWxUMWFV?=
 =?utf-8?B?MGhIRVhOdHpKZ2lGenhuRTlhNld0NnpvWlFEQTdGR3FHaldXTGphQVZ4RnRj?=
 =?utf-8?B?V1BTL2VodzNMV051cTV1REhPSENnVWhBL3hKeGptbFlvWCtSNWRjbE52dUhV?=
 =?utf-8?B?c0hYb3FjVlRGTGVoY3ZseDJ3emRmcVhtQlhWeW9zYnFjWVk1SzdNU3BsZlpz?=
 =?utf-8?B?cEVhVDlSa3RqdWFacUwwM2JsRldrMGFaa25nbTV3STE4TXNXRUpMTkVLdHlD?=
 =?utf-8?B?NGhYT2ZwOHhDZmlkQ1VjL3VHeGVuaFZFR1RxaXdoaVNrSjVYN1R0L0R6bzhC?=
 =?utf-8?B?MGROajlaOTFvcUh5SXg5cWw5NHVWR1FidUZRWTgzd3VwOHpKTnYxTW5GbHlG?=
 =?utf-8?B?QVgwRGJSSDZ6ZEZSdTBiNUg5cUt1ZUprU1pDcXlaL1gwQ1hicUJRUThobHR1?=
 =?utf-8?B?eGZmdlhVMmIySjUvcW45Tm5aREVkRHZoeGtSV1cxdnVPaks5elBjVGpzenRG?=
 =?utf-8?B?Wm1YT2tvTHh2aXN5SjlVZU5ORlN6ekVjU3ZObXAvSWR0ZzVQSnZSRnFibkJo?=
 =?utf-8?B?MHpqb1NQSlJvTlhHaDg5T3J4RTVSR3FndUZsTGVPN3VpdnprbmJyZjAybEZ5?=
 =?utf-8?B?bXlhN0x6T0RLaWRWb1YySk1PdWxmOFBkckN3ZFBqTzZKVjdDeUZOS015S1cv?=
 =?utf-8?B?ZGN5M2xSbTZjY0QxMjNNbWRMdkpmdlZ1U0pwNnJ6OFZPejQ3cnQxZ1I0Q1BH?=
 =?utf-8?B?cG1kQUZkaitzVVhZSy9MRG5KVUxCUEdrVHJDR3dhblFib0tPcENMNWhDRW9o?=
 =?utf-8?Q?UbZqiqJkn15XrpUcKeS9e2X/Z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35AFB819C9151949B1F63517DF126937@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd23ec88-7621-4cc4-0ded-08da5f3c8b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 10:44:46.1795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dH+xGxyoXoC5i87mcXzbBFWJyGDh8DhPrI4VkEV9N4DTix4LKidU257Tq8zoPkb8pPkhJeLfizEEEPT5LqKlHUNrayvYA/a7W7zU0qd9OaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6696

T24gMDYvMDcvMjAyMiAxMTozMiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IE9uIDI0IEp1biAy
MDIyLCBhdCAxOToxNywgRGVtaSBNYXJpZSBPYmVub3VyIDxkZW1pQGludmlzaWJsZXRoaW5nc2xh
Yi5jb20+IHdyb3RlOg0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2VmaS9ib290LmMg
Yi94ZW4vY29tbW9uL2VmaS9ib290LmMNCj4+IGluZGV4IGEyNWUxZDI5ZjEuLmY2ZjM0YWE4MTYg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9uL2VmaS9ib290LmMNCj4+ICsrKyBiL3hlbi9jb21t
b24vZWZpL2Jvb3QuYw0KPj4gQEAgLTU2Nyw2ICs1ODcsNDEgQEAgc3RhdGljIGludCBfX2luaXQg
ZWZpX2NoZWNrX2R0X2Jvb3QoY29uc3QgRUZJX0xPQURFRF9JTUFHRSAqbG9hZGVkX2ltYWdlKQ0K
Pj4gfQ0KPj4gI2VuZGlmDQo+Pg0KPj4gK3N0YXRpYyBVSU5UTiBfX2luaXRkYXRhIGVzcnQgPSBF
RklfSU5WQUxJRF9UQUJMRV9BRERSOw0KPj4gKw0KPj4gK3N0YXRpYyBzaXplX3QgX19pbml0IGdl
dF9lc3J0X3NpemUoY29uc3QgRUZJX01FTU9SWV9ERVNDUklQVE9SICpkZXNjKQ0KPj4gK3sNCj4+
ICsgICAgc2l6ZV90IGF2YWlsYWJsZV9sZW4sIGxlbjsNCj4+ICsgICAgY29uc3QgVUlOVE4gcGh5
c2ljYWxfc3RhcnQgPSBkZXNjLT5QaHlzaWNhbFN0YXJ0Ow0KPiBIaSwNCj4NCj4gRnJvbSBteSB0
ZXN0cyBvbiBhbiBhcm02NCBtYWNoaW5lIHNvIGZhciBJIGNhbiB0ZWxsIHRoYXQgZGVzYyBpcyBO
VUxMIGhlcmUsDQo+IGZvciB0aGlzIHJlYXNvbiB3ZSBoYXZlIHRoZSBwcm9ibGVtLg0KPg0KPiBJ
4oCZbGwgaGF2ZSBhIGZ1cnRoZXIgbG9vayBvbiB0aGUgY2F1c2Ugb2YgdGhpcywgYnV0IGlmIHlv
dSBhcmUgZmFzdGVyIHRoYW4gbWUgeW91IGFyZQ0KPiB3ZWxjb21lIHRvIGdpdmUgeW91ciBvcGlu
aW9uIG9uIHRoYXQuDQoNCkdpdmVuIHRoaXMgb2JzZXJ2YXRpb24sIHRoZXJlJ3MgY2xlYXJseSAu
Li4NCg0KPiBAQCAtMTA1MSw2ICsxMTEwLDcwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfc2V0
X2dvcF9tb2RlKEVGSV9HUkFQSElDU19PVVRQVVRfUFJPVE9DT0wgKmdvcCwgVUlOVE4gZ29wDQo+
ICNkZWZpbmUgSU5WQUxJRF9WSVJUVUFMX0FERFJFU1MgKDB4QkFBQURVTCA8PCBcDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChFRklfUEFHRV9TSElGVCArIEJJVFNfUEVSX0xP
TkcgLSAzMikpDQo+DQo+ICtzdGF0aWMgdm9pZCBfX2luaXQgZWZpX3JlbG9jYXRlX2VzcnQoRUZJ
X1NZU1RFTV9UQUJMRSAqU3lzdGVtVGFibGUpDQo+ICt7DQo+ICsgICAgRUZJX1NUQVRVUyBzdGF0
dXM7DQo+ICsgICAgVUlOVE4gaW5mb19zaXplID0gMCwgbWFwX2tleSwgbWRlc2Nfc2l6ZTsNCj4g
KyAgICB2b2lkICptZW1vcnlfbWFwID0gTlVMTDsNCj4gKyAgICBVSU5UMzIgdmVyOw0KPiArICAg
IHVuc2lnbmVkIGludCBpOw0KPiArDQo+ICsgICAgZm9yICggOyA7ICkgew0KPiArICAgICAgICBz
dGF0dXMgPSBlZmlfYnMtPkdldE1lbW9yeU1hcCgmaW5mb19zaXplLCBtZW1vcnlfbWFwLCAmbWFw
X2tleSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm1kZXNjX3Np
emUsICZ2ZXIpOw0KPiArICAgICAgICBpZiAoIHN0YXR1cyA9PSBFRklfU1VDQ0VTUyAmJiBtZW1v
cnlfbWFwICE9IE5VTEwgKQ0KPiArICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIGlmICgg
c3RhdHVzID09IEVGSV9CVUZGRVJfVE9PX1NNQUxMIHx8IG1lbW9yeV9tYXAgPT0gTlVMTCApDQo+
ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIGluZm9fc2l6ZSArPSA4ICogZWZpX21kZXNjX3Np
emU7DQo+ICsgICAgICAgICAgICBpZiAoIG1lbW9yeV9tYXAgIT0gTlVMTCApDQo+ICsgICAgICAg
ICAgICAgICAgZWZpX2JzLT5GcmVlUG9vbChtZW1vcnlfbWFwKTsNCj4gKyAgICAgICAgICAgIG1l
bW9yeV9tYXAgPSBOVUxMOw0KPiArICAgICAgICAgICAgc3RhdHVzID0gZWZpX2JzLT5BbGxvY2F0
ZVBvb2woRWZpTG9hZGVyRGF0YSwgaW5mb19zaXplLCAmbWVtb3J5X21hcCk7DQo+ICsgICAgICAg
ICAgICBpZiAoIHN0YXR1cyA9PSBFRklfU1VDQ0VTUyApDQo+ICsgICAgICAgICAgICAgICAgY29u
dGludWU7DQo+ICsgICAgICAgICAgICBQcmludEVycihMIkNhbm5vdCBhbGxvY2F0ZSBtZW1vcnkg
dG8gcmVsb2NhdGUgRVNSVFxyXG4iKTsNCj4gKyAgICAgICAgfQ0KPiArICAgICAgICBlbHNlDQo+
ICsgICAgICAgICAgICBQcmludEVycihMIkNhbm5vdCBvYnRhaW4gbWVtb3J5IG1hcCB0byByZWxv
Y2F0ZSBFU1JUXHJcbiIpOw0KPiArICAgICAgICByZXR1cm47DQo+ICsgICAgfQ0KPiArDQo+ICsg
ICAgLyogVHJ5IHRvIG9idGFpbiB0aGUgRVNSVC4gIEVycm9ycyBhcmUgbm90IGZhdGFsLiAqLw0K
PiArICAgIGZvciAoIGkgPSAwOyBpIDwgaW5mb19zaXplOyBpICs9IGVmaV9tZGVzY19zaXplICkN
Cj4gKyAgICB7DQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIEVTUlQgbmVlZHMgdG8gYmUg
bW92ZWQgdG8gbWVtb3J5IG9mIHR5cGUgRWZpUnVudGltZVNlcnZpY2VzRGF0YQ0KPiArICAgICAg
ICAgKiBzbyB0aGF0IHRoZSBtZW1vcnkgaXQgaXMgaW4gd2lsbCBub3QgYmUgdXNlZCBmb3Igb3Ro
ZXIgcHVycG9zZXMuDQo+ICsgICAgICAgICAqLw0KPiArICAgICAgICB2b2lkICpuZXdfZXNydCA9
IE5VTEw7DQo+ICsgICAgICAgIHNpemVfdCBlc3J0X3NpemUgPSBnZXRfZXNydF9zaXplKGVmaV9t
ZW1tYXAgKyBpKTsNCg0KLi4uIGEgTlVMTCBwb2ludGVyIGhlcmUuwqAgQW5kIHRoZSBvbmx5IHdh
eSB0aGF0IGNvdWxkIGhhcHBlbiBpcyBpZg0KZWZpX21lbW1hcCBpcyBOVUxMLg0KDQpXaGljaCBw
ZXJoYXBzIGlzbid0IHN1cnByaXNpbmcgYmVjYXVzZSBwcmVzdW1hYmx5IEFSTSBnZXRzIG1lbW9y
eQ0KaW5mb3JtYXRpb24gZnJvbSB0aGUgRFQsIG5vdCBFRkk/DQoNCn5BbmRyZXcNCg==

