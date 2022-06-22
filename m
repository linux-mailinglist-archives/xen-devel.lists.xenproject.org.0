Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B76554520
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 12:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353710.580678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xN5-0006Ae-Uw; Wed, 22 Jun 2022 10:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353710.580678; Wed, 22 Jun 2022 10:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xN5-00068O-R2; Wed, 22 Jun 2022 10:14:03 +0000
Received: by outflank-mailman (input) for mailman id 353710;
 Wed, 22 Jun 2022 10:14:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rPuW=W5=citrix.com=prvs=165a25834=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o3xN4-00068I-5M
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 10:14:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07973933-f214-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 12:14:00 +0200 (CEST)
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2022 06:13:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5079.namprd03.prod.outlook.com (2603:10b6:a03:1f2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 10:13:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 10:13:52 +0000
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
X-Inumbo-ID: 07973933-f214-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655892840;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rwNMTYaxCWkAOd/QkHrUWoYX8jFFY1F7nOuXkaZy19g=;
  b=Wh/HoNwGpfhSJl57urlwcLqgLGMhXw7znt5FgmAMTR0+udRxaNrNWAc3
   0Kfx3dRG4gfr4TgOmfgLD78jRAEQLnZHnpYUWmXdcydawqctKrRRzi1ZE
   taCuqt+F+Wd8zagS79XaY7ztlu7OmA9jGPQ4tDO4b1AHz6wbVJ1A/7tkx
   0=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 73996298
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NbwRYaksEQ1H8a/A2NRzUNvo5gzxJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfWmnVaKmLa2T3edlwYYq29EsBvMfSx95jSwo5+Ss3FCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DnWVnV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYFSUoZIjhhuImbRR/S3llL6xe4q/KGC3q2SCT5xWun3rE5dxLVB1zEahGv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOVvpkEhV/chegXdRraT
 +MfZSBic1LrZBpXN01MIJk/gP2plj/0dDgwRFe9+vFmsjaJnVwZPL7FaduEa9WuGptusFuF+
 FDM4kLoJCAUK4nKodaC2jf27gPVpgv5Uo8PELyz9tZxnUaegGcUDXU+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gDxh0YLR6gedQ2QBEDhIbYR6sNdsHWBzk
 FiUg9nuGDpj9qWPTm6Q/auVqjX0PjUJKWgFZmkPSg5tD8TfnbzfRynnFr5LeJNZRPWscd0s6
 1hmdBQDuog=
IronPort-HdrOrdr: A9a23:1aiYk6FpJ4nWZhLOpLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.92,212,1650945600"; 
   d="scan'208";a="73996298"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBbhnP1p3zL9n5ICvHDzV2suf7JvsIPeoi1MaBkTIhtujgkDxTnlg5oSL+Z8kacVnNwE4cRXLKt+Y6lnU+5cyIg8qrchOa7jilaZdIVHi6Y8CCl4jOIqvZylWcai2fkG8SFDN1nL59c9Zivs2rxi1pM5RoF6KeOg2ElK1ifF7Y7xQj1Vn9N2ZOUeISF3zf/uTKbW9KrloAmFYw7W7eoE8wJQ/yUWMYC6dcnIcZKMdUUmgatTfuLY2yZhdpGWfZHJx4878f2oB1MrwzwXULPxB5cGFH+IcP1rcygPxwLDNs8zUpI9GDTTN3Y1eN8NyM/0L63HAJ295lC68s0Pj7p8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwNMTYaxCWkAOd/QkHrUWoYX8jFFY1F7nOuXkaZy19g=;
 b=FRB5FXCW38ZsLsuIl2RcSlU6wbDiffCNvTWHba4TO/5cG9dab/LahKxK8/jTXCk+nvp0MA8mOlMeHiex86epLcVkWgLtLwbGFQi1ifxH/3cPhfKroeJQMiMG07LTOeYv0fzJbDIeFF5CitG7l8BKAaQtdNpG4kdho+WfRtCiuhkJ2gi/Edsvcr/9cFM/pvy5+v9IDQWH/97WKUTKO4WAo38ZKsLhhTJNwTctuTLh+0rTVjbmdLRQIcbBRxZcdDET1jwlMZy9WCoPpLxv+DZHochKcRrjRg/Y96wDbVZFP9+v6FvmiDdbDEQnRDnA/XyhQp73qOXMI6LDsPoAJp//+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwNMTYaxCWkAOd/QkHrUWoYX8jFFY1F7nOuXkaZy19g=;
 b=Rm0nlY9x86VXSe82hBV6BXYXGOTWGaylHRE0obkbKQQ84Wpk/HtZwLM2e+mH29l/nd6x3+43zu/Bm/IOH4D8/hx82nZ9mJE4blT7tz2F3zvhlcibzP087M5870TMbazyfRSO2v2m0D03m6fas/PyaC8a9B2prewpxLdpGGw18KU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/mm: Add an early PGT_validated exit in
 _get_page_type()
Thread-Topic: [PATCH] x86/mm: Add an early PGT_validated exit in
 _get_page_type()
Thread-Index: AQHYgje+Hnf8qY51yESHaKuTNkI+fa1bOL6AgAAEXQA=
Date: Wed, 22 Jun 2022 10:13:52 +0000
Message-ID: <92649f5b-1454-e3cf-0abb-1da3a0edfa41@citrix.com>
References: <20220617104739.7861-1-andrew.cooper3@citrix.com>
 <3066680f-6213-7190-3f2d-d05edae723c1@suse.com>
In-Reply-To: <3066680f-6213-7190-3f2d-d05edae723c1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d44b8ca4-45ef-44ca-0720-08da5437e854
x-ms-traffictypediagnostic: BY5PR03MB5079:EE_
x-microsoft-antispam-prvs:
 <BY5PR03MB5079E43801A99F07A2B51C24BAB29@BY5PR03MB5079.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VtTqs5rgMtmXU5KgWpk0BIloScv+K5rFdxTQMbjEYh6LCFjyHwN5BNZu//OF4vpvpfr6uxZebgvSp3z9mqWLDDe2cWy9wbo7cwLUzfFO3pNxh/a9ix3JZlM5WHP1/AC6HXXppwwEUY0iMCQr89FKkuyo7J7DGvfRjBUCueZ4CFI5mnwuK01lRa1WbmRwnv4Ee2SkfmCBudN4o6o4kIl/h6XItUH6vAnWBkWsoGEBnrKswZ6CC/5qnB7wa2iMGtkgaawYNwwOHOdqyH6OmrW/bFxSGhA6o9z72DQz86HqcvGiYwzLM0QKCn06uDU31Sj2YIcZOTMhaj029Qq1J6JkFsVZF/NoaNBvfyXiTOlqmOCRgVf5sc5vq2wpoKJFV3DLG3mxr5ob+fP4tdiePArVd4K7AFN2LTNfmTykHRLjxZJ/YU7IwRgfOWfSWQZVuw+AhqA/irVFmMHE6pGoT+quNZmsPiUzCEroixqJGH96G5WfslD91peMlMsE8Wnf+DZE7xuzZW2q5ZryNd7G11cWGnGxCf3xqUnB34a8GHjdzzR03VWvlvJD9O3ZzzaQiPrjmOSgYM5sWfpT2jFUnNIyH6mQg5vG9p3PZyQgWC4jf1Tm5P2KosY5fBfpNcbKAB0rJQ5fg7YSTGDZ4y4MCmZElwgHWKhchnedWP0ERaqCuz9MfvOaEPj7pz298pB58VHopR13Mh/T627cjoY619iOwNRgJNiETu/9PcDESEf2iUdkV28jocB9ODzkI3JXeej/zd+doS9s+JOJTQ6S74ERUjHHsSF2SQ6Xifl5U/D7vV1HR4xJ7O9dl3Wqtyf44h7ehiCsnIJIRtmk6s3B/rsycg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(478600001)(8936002)(186003)(6486002)(83380400001)(5660300002)(41300700001)(2616005)(38070700005)(53546011)(6506007)(31696002)(71200400001)(6512007)(54906003)(38100700002)(26005)(4326008)(31686004)(91956017)(8676002)(2906002)(66946007)(82960400001)(6916009)(76116006)(36756003)(86362001)(66556008)(66476007)(122000001)(66446008)(316002)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVZ4dFVNV3hVY0syS3grTk42a2luYWpkWnZOQkYxM3hqa3JXZ0t6UGlCVTlo?=
 =?utf-8?B?MS9zR09OTUE5MG1TUnVVTE5oUnczTDFjNlNJaDloZ3BBZmwxVGdsK1JMeGZ5?=
 =?utf-8?B?NTVOZENLL2JvWFhWdTIyOWtqR3crTTAzN3NGVWxsSHBDVkdGeFZNZXhrNFVm?=
 =?utf-8?B?NE5zNnpXbFMvYVFkNFV3Y1E1UTZ3QWhRbERsaGV6MEorMGtqZk9sNGNsbTE2?=
 =?utf-8?B?dVdFRHhhbWtYWGdFaGdRQXgvTUsySTZEYjFaTWFrNHdZcE0xOGtOQUxIMi9L?=
 =?utf-8?B?NWxzQm44TWMxT1RhZUQ4QjBBTE1QUUpubUFaTXFkQU81QTROVXZxeGkxdFhs?=
 =?utf-8?B?dEJ1SDd1OXVrcDlWRWcwY3U3YlB0cWtmdy9CTGhSRU80OHRCL2EvZWVXTHdp?=
 =?utf-8?B?a3NyamswaVI1S0JYb3cxNU1maFhnMWZzVnpOQ0VrRFRpaDNuWHZkQnlYVzQx?=
 =?utf-8?B?ZklHVGc3bHBnZDNXOWZBeDdZZWJPaldWZU9rWGYzdlpmYndVQ1psY0VzajYx?=
 =?utf-8?B?SlMzTFhaMHlsa3F4M3ZDU2ljUW1XcGxXdDIzblBpanlNb0tyYmE0b0ZOcEdy?=
 =?utf-8?B?S0ZaVnB2NXdnazFxNlBIUHUzVytnUWNsbFJTZXkwMlpueTA5YjNSTGpHNDBB?=
 =?utf-8?B?dnRsT3pNWGhWY2pNVHlBbENPamNvNDBlTHBPMCtKWmYrTlM5SStYWUNMOXRB?=
 =?utf-8?B?T1h3cTFpNWRPU3BTMmIyQzZzLy9oWlVtTC9qYy9RcGNwRzZvM1JXTnMyN0Y1?=
 =?utf-8?B?VTlDNm1HaUtPV1g4aHNMZVpkajVrZzV1WjNTQ0lnbGlBVDNKTFA1UGFWQlky?=
 =?utf-8?B?Wmcxd2JOdTBFclVKTnZzRTdoVGtSODJkY2ErZmRTU1pvc2lYOVQzb3BIdndn?=
 =?utf-8?B?dFpDdlZMeVlSN0x0T0pSWkQ4cEx1Q1lVSGEyVlRtYVRTWDFYNTQyaEVjWjlV?=
 =?utf-8?B?UGR6YlZOcCtVZGpSMkplNC9JSm12Q1ZTaWM4OVFqUzh4QnFITldadzZnMHgx?=
 =?utf-8?B?Y0NXUEwrbVR5a0M3am9nbmtIR2ppczBoczN2eVMraUs1TmVPVGhxN2h4UTVW?=
 =?utf-8?B?cGEyNlQ0ZWE2NFpwNTYrdk94NzdIeWk3KzFFMkdZQjFGc0lDL2thVWVQdmhI?=
 =?utf-8?B?Z2ZPRXBBd216YXpLdERSU0tYSytZR3g1cUY5L3prc0w5T1ZkdGxvOER1aUpI?=
 =?utf-8?B?T05Vdk41bFpWaVFmcllQWnV3dnd0YTVDOTlEMFlRL0hUQU4zei81bEVsazZF?=
 =?utf-8?B?Y3YvRFYwa3I2dkRsZHZHb1R3dngyZjZTcXpyVS9NZ0pUSFJSR1QwVHF5M1Rl?=
 =?utf-8?B?a29OZHZucnpqU1NSYy95NDduTW5XTW5uSDRzT0pVNnJ0ejFKWWJKYmZocWly?=
 =?utf-8?B?Q0VNNXBnNmJBbGR6QkNLS1V1a0VGZzZ0VCtzNmNVbjJZbGdHeU5maWFTWkQy?=
 =?utf-8?B?akpOKzJtQ3FNYUNnLy9jTmRxdENzbzN1R1lmQ1gvTU9WYVpmaDVQWkRzTUJS?=
 =?utf-8?B?dk8yR0VHS1krU09yaVh4MWtVaTI3V0szc1VreFFhSWJ2aTNDb2hEUENwb2Vt?=
 =?utf-8?B?VEdqVGxMeWdNM2VQeGtpc3Q4aWdvanVjV0hMRzNPUHIrZ0hUZ21PbTRFSDJu?=
 =?utf-8?B?bmFwbTQwekpSbzBUNU9aK2FFdUpwdHZqVzJJSlNsenduNTJxc1JwN00xZm5J?=
 =?utf-8?B?YVl3bExsYzIxZXhZdzIvTDI5a2R2NHJ1UGlvL1N1MVFNcXF4QXBCbjlUS2tQ?=
 =?utf-8?B?M09VMUt4emhsZnN1SUpmZXY0Nlptd3lMMGJKc1NIWWdWUGJiK25VbnVmNEt4?=
 =?utf-8?B?OVJiSWUyVGFyZUxmSG1rOWp3SFpPMjNDNURXbEdIeXYrSFYvemp1MG5rVlRM?=
 =?utf-8?B?dUhFSTF4ZGovWDlYc2JBVUpzdXBrYTg1RU9hUkdESUI2eE93SGdKSVdQK3Er?=
 =?utf-8?B?alJ4SUJxUm50cHczdXNxbGREUjRPSDhMSmltSkZxWVJSb0h2L2dkNXVKSWdj?=
 =?utf-8?B?bmlXNlN0cmpQL2NFWnFVSEI4SlpXcDNreXlqZWhYWDI2b1VlRmhGS0NUVGRL?=
 =?utf-8?B?NnVOOTFtWTcwcjArSTdwRTV6U2FBZnNmWUVabWtQTVdKNllwUUFmQTFMZGEy?=
 =?utf-8?B?ZXp1dDNIYkplOVpHdzJGK1NsZGRtVUFJMjRXT0VwbmJMTDlvSEdVMDhySkJx?=
 =?utf-8?B?Nm1ja1k4R3hyTWJWbGtxUDJXeWxvMTBJNzNsSXhkZUM0S2I4L0ZoRmlscWcw?=
 =?utf-8?B?RVFJT0Y3bUVVcm1laVpJOVA1MUIvVWNibnZxWExIcGRQNmNBR05OM0QyVU51?=
 =?utf-8?B?b1lGS08xRG5kdDdLdUlzczZwNm0yalorcVpjaUNRaFVvaWplMzB0dnFKdkU2?=
 =?utf-8?Q?adJpodnuYz0vhnwI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <866D7D898840B642B9CAD4F9DD256D38@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44b8ca4-45ef-44ca-0720-08da5437e854
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 10:13:52.3945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZskd4NmHuhQ07WUXxPTr0r/CayhIxzNARxyCZtSsp1cSy+GcdiDQub7tTHJSJ0D3SfdedLX0jdjJHClEmBWF5RcJySLNXLFiarTnVfpeMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5079

T24gMjIvMDYvMjAyMiAxMDo1OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjA2LjIwMjIg
MTI6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGlzIGlzIGEgY29udGludWF0aW9uIG9m
IHRoZSBjbGVhbnVwIGFuZCBjb21tZW50aW5nIGluOg0KPj4gICA5MTg2ZTk2YjE5OWUgKCJ4ODYv
cHY6IENsZWFuIHVwIF9nZXRfcGFnZV90eXBlKCkiKQ0KPj4gICA4Y2M1MDM2YmMzODUgKCJ4ODYv
cHY6IEZpeCBBQkFDIGNtcHhjaGcoKSByYWNlIGluIF9nZXRfcGFnZV90eXBlKCkiKQ0KPj4NCj4+
IFdpdGggdGhlIHJlLWFycmFuZ2VkIGFuZCBuZXdseSBjb21tZW50ZWQgbG9naWMsIGl0J3MgZmFy
IG1vcmUgY2xlYXIgdGhhdCB0aGUNCj4+IHNlY29uZCBoYWxmIG9mIF9nZXRfcGFnZV90eXBlKCkg
b25seSBoYXMgd29yayB0byBkbyBmb3IgcGFnZSB2YWxpZGF0aW9uLg0KPiBUbyBiZSBob25lc3Qg
ImZhciBtb3JlIGNsZWFyIiByZWFkcyBtaXNsZWFkaW5nIHRvIG1lOiBQYXJ0IG9mIHRoZSByZS0N
Cj4gYXJyYW5nZW1lbnQgd2FzIHRvIG1vdmUgbGF0ZXIgdGhlIGVhcmx5IHNldHRpbmcgb2YgUEdU
X3ZhbGlkYXRlZCBmb3INCj4gUEdUX3dyaXRhYmxlIHBhZ2VzLCB3aXRob3V0IHdoaWNoIHRoZSBz
dGF0ZWQgZmFjdCB3YXNuJ3QgZW50aXJlbHkgdHJ1ZQ0KPiBwcmlvciB0byB0aGUgcmUtYXJyYW5n
ZW1lbnQuIEhvdyBhYm91dCBzL2ZhciBtb3JlL25vdy8gPw0KPg0KPj4gSW50cm9kdWNlIGFuIGVh
cmx5IGV4aXQgZm9yIFBHVF92YWxpZGF0ZWQuICBUaGlzIG1ha2VzIHRoZSBmYXN0cGF0aCBtYXJn
aW5hbGx5DQo+PiBmYXN0ZXIsIGFuZCBzaW1wbGlmaWVzIHRoZSBzdWJzZXF1ZW50IGxvZ2ljIGFz
IGl0IG5vIGxvbmdlciBuZWVkcyB0byBleGNsdWRlDQo+PiB0aGUgZnVsbHkgdmFsaWRhdGVkIGNh
c2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4NCj4gUHJlZmVyYWJseSB3aXRoIHRoZSB3b3JkaW5nIGFib3ZlIGFkanVzdGVk
Og0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpPay4N
Cg0KPj4gTm90IHRoYXQgaXQncyByZWxldmFudCwgYnV0IGJsb2F0LW8tbWV0ZXIgc2F5czoNCj4+
DQo+PiAgIGFkZC9yZW1vdmU6IDAvMCBncm93L3NocmluazogMC8xIHVwL2Rvd246IDAvLTMwMCAo
LTMwMCkNCj4+ICAgRnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
b2xkICAgICBuZXcgICBkZWx0YQ0KPj4gICBfZ2V0X3BhZ2VfdHlwZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDY2MTggICAgNjMxOCAgICAtMzAwDQo+Pg0KPj4gd2hpY2ggaXMgbW9yZSBp
bXByZXNzaXZlIHRoYW4gSSB3YXMgZXhwZWN0aW5nLg0KPiBBbmQgSSBoYXZlIHRvIGFkbWl0IEkn
bSBoYXZpbmcgdHJvdWJsZSBzZWVpbmcgd2h5IHRoYXQgd291bGQgYmUuDQoNCkkgd2FzIHN1cnBy
aXNlZCB0b28sIGJ1dCBpdCdzIGRldGVybWluaXN0aWMgd2l0aCBHQ0MgMTEuwqAgSSBpbml0aWFs
bHkNCmRpc2JlbGlldmVkIGl0IGFuZCBkaWQgZnVsbCBjbGVhbiByZWJ1aWxkcy4NCg0KdmFsaWRh
dGVfcGFnZSgpIGlzIGZ1bGx5IGlubGluZWQsIGFuZCB0aGVyZSB3ZXJlIGEgcmVhc29uYWJsZSBu
dW1iZXIgb2YNCmptcC5kMzIgLT4gam1wLmQ4IGNoYW5nZXMsIGJ1dCBJIHZlcnkgbXVjaCBkb3Vi
dCB0aGVyZSBhcmUgNzUgb2YgdGhlbS7CoA0KSSBjYW4gb25seSBhc3N1bWUgdGhlcmUncyBhIHJl
YXNvbmFibGUgY2h1bmsgb2YgbG9naWMgd2hpY2ggc3VjY3VtYnMgdG8gRENFLg0KDQp+QW5kcmV3
DQo=

