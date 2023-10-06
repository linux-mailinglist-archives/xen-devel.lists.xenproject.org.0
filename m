Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB27BB36A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 10:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613353.953852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogPX-0006YS-VB; Fri, 06 Oct 2023 08:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613353.953852; Fri, 06 Oct 2023 08:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogPX-0006Vf-ST; Fri, 06 Oct 2023 08:42:15 +0000
Received: by outflank-mailman (input) for mailman id 613353;
 Fri, 06 Oct 2023 08:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qogPW-0006VW-IJ
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 08:42:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e066580-6424-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 10:42:13 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 04:42:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ2PR03MB7427.namprd03.prod.outlook.com (2603:10b6:a03:558::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Fri, 6 Oct
 2023 08:42:09 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 08:42:09 +0000
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
X-Inumbo-ID: 3e066580-6424-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696581732;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=d+I1zPyyETp80cZDzDJUGT0HkMdw/hBT5SdzySodh0o=;
  b=eCPuqSD3qd1i5KTtRbA8AkQcmtXZ54xqpMhPo4IOI9vYCJqZNvs0dbEC
   xjGZQM3wYP6Zj1B6kqeLX7WuthczBQDvkeT9wVGez/zz4jGdNAYtguWkg
   +8yahUQEUjDB8tWt30WZ5deppp01IRjkcoX0KVvzA7PFNZVktEeWx33/Q
   M=;
X-CSE-ConnectionGUID: umVruofyQPy5yd+teAzNvg==
X-CSE-MsgGUID: JedZ66xcSR+8wbaK+D6aMA==
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 124059798
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:/61cN6BnNPmmchVW/w7iw5YqxClBgxIJ4kV8jS/XYbTApDwm3zJWz
 2JJWz+FO/uLamf3eIsgaIm28BsF68eAzIM1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtA4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5+NJG3xJ+
 +0hECFQfxzAm++f0pSlRbw57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDO7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC70276QzHOTtIQ6NrC0xKA0kFao/C9DFxcfdhiX//CcoxvrMz5YA
 wlOksY0loA171e3Q8LhGhS0pX+Clg4RXcJKFO834x3LzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhTa7OCxQIWpcYyYBFFEB+4O6/9p1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:PLdSs6+FGs0PinCMr2xuk+DrI+orL9Y04lQ7vn2ZhyYlCfBw9v
 re5sjzsCWYtN9/YgBGpTntAtjlfZqYz+8R3WBzB8bAYOCFghrPEGgK1+KLqFfd8m/Fh4xgPM
 xbAtFD4bPLfCBHZAXBjzVQ0exN/DBKysGVbC7loRdQcT0=
X-Talos-CUID: 9a23:zAc+IG86jDTwiEy4FNiVv1MRJNo4dXPM9U/Bfl60SnpkYa+zV1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A+vm6Ww+m2wQooxhuxUknkkOQf+Vl75bwVlAGqq9?=
 =?us-ascii?q?F69aOPA8zF2mUqR3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,203,1694750400"; 
   d="scan'208";a="124059798"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1sD/eKJ/O7qrkeg1s8dicAaMSqvKVoP+9AIxoNZ3BO8QDTiykMFMezE3zxQ43KArvHGsml7Fx0z3HyMEwnnAnH+yYo2xYiv1cKHb8mGhtOG4gmlXDryWgijN2uPZ3DlcVOqo7OgpML3NP9DiRSgdppiBoipAWhqysy5VyUCFT+CMtFDAFohtu+h9rpYBCRoFgYnfO0Hm4yexLVitNMG9ctZtd5uHIaqggNDV2A+SBnpJEWRQ6MWNwZCcD+bWas67DcmbVhDKXrSbwkN5fcp88d2qqRb/qnJTAuA28xXWeHU9zAF4XX8y7WTQOHaX0q3SRcuDjZarAEbCaGVR0iNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PHbY8CG2LXPBbD2BnrAsDpZe7RFu+zewmEfl3k4Fcc=;
 b=mJrhV7Vb+P88FJPMmacbdWqxGGa5pxp9jUs9Uz5AILo+GWxkPzqX0nEqu3MEsgWCdDTeDramU3e0HavoEO9wfKe/iGndMrP80BixaU5ETBNZJflP7Mw1Q9sy3hjkoTXJAn4Qq/+06+UfRQ7MTA/fpIs2MUQ470vqX1zk3OahPWnifLHxk8a1xYQeYD394LufkRD4N3vnfR5w4vwMvzddbYfhu90uDIQLCxbkPY6GvY+ixh3wvfvrLDyOy0+fTqdqHUaf2My/AH0kTL0PH/ItLKBV6vHud9+M/mFF6Ed9LsYkjSjvrZnfWlviJCGCRV00e9zOZuES61I7rKU+pt1qjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PHbY8CG2LXPBbD2BnrAsDpZe7RFu+zewmEfl3k4Fcc=;
 b=XlmN55fze5kUZNRO/z1LdC7KOHnbTi+rTyOGzlRIUAqMoFsMKzOxF+Br6Ejk1z2Y+lOzr/B4sCExri07qGJywzdAhkTZZOPBqF2DRkRGwYP7hclCYa2IG1pBvHl3MECcXvTCF0H2Tt5h0dCRE3g3U14nAZQh3sd877xop2/uyYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 10:42:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable-smoke test] 183276: regressions - FAIL
Message-ID: <ZR_IW7NI_ZNgxMhi@MacBookPdeRoger>
References: <osstest-183276-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <osstest-183276-mainreport@xen.org>
X-ClientProxiedBy: LO4P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ2PR03MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 118e5667-552e-4d56-68e3-08dbc6482064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/UL4H+jDQSjvkmCk3jrChstxjain3+wgVxInZFmOH2Q1ryalxkudFbhhm6f+kji1JquH6AbZQ4cglKOJjwtHvS5mMPPu0KopU2fTG5LSjVJYyIgXBKFVNYwW5g2erVxsnkEP0C6uy3RnCm8gqwi5NQPsg7j8f1rl5BqHynLATmt//5oBwDTZgU68Y9MBOuTGETHfBashVxL2i3f+mJzAFCOJ4MVtuzJb8NGR+n/Cpo8vfFCVRQZjfFCGuM2a/Js+ecid6gj1bE+dFBQV6QKuiY4daJ+outT/TbqOtNf3u3Ci5cNWBTlfHdJszQaiLNlSJQPgRfpWQ5xzItWrXpiRkzNLfcY2pMPQEMS5C6bsI0shdKasUOrJkAFXmXFyexTkEiaIHGYNIFJHFapmRlswrVQenhsAqqggEYr4d5fl1hpzi5HOa79DXQGmvMrFqIURG5bYrBl6TVEnNrRF8bERtaORQAs5M7OrXsqjClRfyiR+SfiXr98zWWBFbWQ4r/p2ST6jAQgxF+GwrHCf7P/zywJdH18N0KKZ+RubsrVBOqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(39860400002)(396003)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6512007)(26005)(9686003)(82960400001)(86362001)(85182001)(83380400001)(38100700002)(66556008)(66476007)(6916009)(316002)(5660300002)(66946007)(478600001)(6486002)(8676002)(966005)(4326008)(2906002)(8936002)(41300700001)(33716001)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rlc3RkZyNEpyZTQ0ZlNPTHFRNktKYTlDajdJZFREUFhpRDdMMy8zMk8wbnhO?=
 =?utf-8?B?Q0h6Q3FYMG1IcnlYMVhVQjdGcm5mcmJOQXRoK3pIeFJXYUF4RWY4RHNtV1FR?=
 =?utf-8?B?aFAwQ1B0Z2lmMTFQTGI3ZDVEZ2pSb3dMbGEyUU4vSkZGbG9qbkplQlVrY3dz?=
 =?utf-8?B?WjlMc3FEVzJvSmhpdzUvSWZpZFA1WXh1Q0VTeXlxemlQUGYxcVgyaVc3ck9v?=
 =?utf-8?B?RHNNbWFFNkkzK2tIemVidFE1OVVTdDR2U3luZGhXSHV4UWh2ek51L3lhZCtu?=
 =?utf-8?B?d045RGRQYkgxSFhNTmFQN3B5SjJqY0Y4alVZejlwUC9UV2ZxYUdNU3lUL0dv?=
 =?utf-8?B?RS93OTFIQ1hRRjRhaWc3U3pUS012T3ZrMlhXN25BUG9NNzNqSFZjbEVpc2ZO?=
 =?utf-8?B?M29LNWxValVZZHZxWmNzbDUyejZuazB0WUdRRk1iMjc4TmxIby92djhpVmVN?=
 =?utf-8?B?a1JMSCszSzhZV3hKeHZxc0wxd21RWTA4TE9hcWQyd0hiVUI1Z09xRnB0ZUZk?=
 =?utf-8?B?NWhrSlQvaFAxWExoRHROOTY5MHE0M0l2ZlAzaDVmS01CcHo5R1JWUUdocDkv?=
 =?utf-8?B?OEJQSFcyZXdXQXN6dmtxRE83QitET2MwVEsxTUV4b3RJQm9PVnkwb3VzWDVS?=
 =?utf-8?B?cUpxOHlvVTAzYWUrc0hhdSt2SG5ZV0Nyd1o4U3A5bUk3TDFUNkp4R2cxeGdm?=
 =?utf-8?B?K0hBTWJ1WkdKT3hyeXUvbWNjOVZlWi9MMjJXWEhrZHJudjRkdFBXekJuTjdv?=
 =?utf-8?B?U3RaNDdib1hKZDI3cExuSlRpV0Myb3ZHT2hlcWJkTVhFZ1lrVWRFSTkveTBh?=
 =?utf-8?B?YU12MUVsZnpCZWtPSVpjVmMwUnFLa29PWlpSY2J2VUlCc0Fza2pONHRxOHhQ?=
 =?utf-8?B?NnpiTVFBRXFwcFZkaFVRQzlVNUpDOE8xTkZxazVxRkZBTjNYYzYyT20rY3Jk?=
 =?utf-8?B?cWRpT0k4TmFjNkNrQnh6aGFPM0RxS0VQNVhXWm84bTNsbzZZVzVNa0NiWjNI?=
 =?utf-8?B?QzZXeG9lMlBCRmR3dFZ4d1dMMElpVFRnMkVPOGpBQTRnYmdYZnBWOFRmU1hZ?=
 =?utf-8?B?VEl0RzBrYjlJL3dYREthbCs3S0FjNUhiNWtka1hOMHFvN0U3OHA2M1A0VFY5?=
 =?utf-8?B?SkV0dTdGd2VXZTQ0aEhOdXpHMTZrdXFGZkFXdG5BNGRvbE5wYVlDNE5qR0Nl?=
 =?utf-8?B?a0laQjd6UzB4eDZ0VEg0S215ejY4cU80ZnMzdkdaYkczTG5ES2Y0czA0WlNQ?=
 =?utf-8?B?RmcvbGpZOEVPb2RKbFJHbmJzUzAydTVNOVJ1QTYzRFMvQVZNVnRHRkJCb3FD?=
 =?utf-8?B?cGVUQlErd2FCSysvOENhMnFzUURWb0ZSRW5KWE5XRzBvTkNobDArQjg1SXU5?=
 =?utf-8?B?Sk00RlpnMGJGREhHUS91dlNjcGVnYzVYZmlMSWVWNjlCK2J4WHZZWUx6M0xS?=
 =?utf-8?B?K1U4b1BTTGt0REo4MHBDemlmbzd3NnpIUEwwVGtMNlJ4ck03T3NhYjJUZmJx?=
 =?utf-8?B?V1kvb0VJTVM0ejBhR0ZQcVh3Mkl6Z05abkdYdEhERXlZZWo0VTNNcElHWGho?=
 =?utf-8?B?aHVMa1crVTRhYUIzQUlHNkVpTnpMSlM2ZGx6aUsvL1ZpdjJsSWp0UHNNbEpM?=
 =?utf-8?B?YVVvU0RRZVZoa0tmKzA0cXN6a2ZzcndYOW0zRmpOV2djb0VMZGp6K0oyMkMx?=
 =?utf-8?B?dzRJaHFvNEZGcERnVGd0a21ha2FYUlJETkllS3I0MkJMTWZzZmpxTTh1RlFy?=
 =?utf-8?B?SWVHaWFZeGZ4aXFuaGpuK2lvUTNqTnRQc3FkWGJ5cm5QOUY2WUtSZE8raDln?=
 =?utf-8?B?ZHVBMnBFek94c29hVDg4QnBqTHNjdzQ0RVVoRW41cHgwbHE5MDgwa0xMSTlP?=
 =?utf-8?B?VkQ1cWpQMGVRbkFJWG80SGw5NDZEZHQ5TjdEb1JiYlQ2MGs2bXlMUG1aTGhM?=
 =?utf-8?B?UjMxZG9LZ0lsVnBnZ2JWNHRjVFhJRHVRUEZFTVVGaUVIZlViKzFLQnVpbE9W?=
 =?utf-8?B?dEw5M3BOV2cvOE96ZmNrZHc5RVhBZHZ5Z0RnS3ZMV0RhQzFKenVaZU1pbnd6?=
 =?utf-8?B?dGJnTGs4eTJnbWxWZmx5YUV3S0VpYTlYMUxEM1d6cWd3NzBWeUVnWlppOFpP?=
 =?utf-8?B?TnEzTzhyN3EyanhuTGNsSmtBNlpkWGN2YnJ0V0NwK2ZWNncwQktkWU1TYUFz?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JnLGRelVhaWdxDeL/HE6zhmYEUXEwS1Y6unmhhXJxN4sOzgPSarfStB+GPPU0nXmcKW21gVyYP/0kinMwi0t1miQE6VSjxqX1TdItiRzNDcys39ikDw/2rNZUqZDT2YepajIISxm0QsALbbY4EOqUoN+OgwhjAJPFOEWLId/jgNZRCgI0TYOTpZ4mueNnBUqJ2vZ09n5GkT0AlHevLNdeeoH9CPtdyGIluGImp7RwQJ9Y9fLn9eYN/NcD3uZvGOYeXQkrcA0ArwzfaT40OqcKK0/qTSggft4Lw9leVGlKJnZswuvgbybvNcJFpes5EmqtgBC5J79qkJEawI0Fc4UHnDwHAsUgiSqVPLTf8eSjsc88PUQ68Yhl/Qa6DugtN1K0VrfeGkJkIbMmnWOKrja/qwQp/GmjOnJYdeozJVXW54Ye7OJYYhQd2lFwLxIWzz6Z/d740wv3XwL071bqxcazrYnTC92uSjwwz9xYyO0TgThptYIzdW3fNbzANl8EJ2FIg9sSBp7sLpKeUrCW4ST751fqKc6vWnfpXYYoJdz4vgE94B6XUme/yUwSrO/BVUt2IAk7O7EC0NL3sr9ZjQZIfLRx9jiyHGFvXouwDvmWVBap1chn+cugmfptECTD3TEv8kgLW6HNrmWfpsignR4TyA3JmRLOTcQDNgPmkro9W/xq1e4YYlFIsJ/DPZkxlXc/kjEVQcsLxCsxUDwtWhqSy81lpe4Dml1GK+aOYKC7V0748U/DsJCuQAEUr99gbeu7MIz49jwYjNWw30Kqss3grKLnvZVDMBT90NI51hK7YvsMDKeNAVDH8rm0Kq9ksfm
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118e5667-552e-4d56-68e3-08dbc6482064
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 08:42:08.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ick6HFwAeeET5PJxwwU7c2Kni9p+sIZjCJEYjfyxqwVSEc72PHz00pJySio5KyFzaC8NUyUUSOehreZBojFvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7427

On Fri, Oct 06, 2023 at 03:32:00AM +0000, osstest service owner wrote:
> flight 183276 xen-unstable-smoke real [real]
> flight 183279 xen-unstable-smoke real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/183276/
> http://logs.test-lab.xenproject.org/osstest/logs/183279/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 183270

We have an assert triggering:

Oct  6 02:37:53.413781 (XEN) Assertion 'IS_ALIGNED(s, PAGE_SIZE)' failed at arch/arm/mm.c:1243
Oct  6 02:37:54.325736 (XEN) ----[ Xen-4.18-rc  arm32  debug=y  Not tainted ]----
Oct  6 02:37:54.337773 (XEN) CPU:    0
Oct  6 02:37:54.337824 (XEN) PC:     00271a38 destroy_xen_mappings+0x50/0x5c
Oct  6 02:37:54.337891 (XEN) CPSR:   200b005a MODE:Hypervisor
Oct  6 02:37:54.337896 (XEN)      R0: 10020340 R1: 10021340 R2: 00000021 R3: 00000340
Oct  6 02:37:54.349762 (XEN)      R4: 43fea008 R5: 10020340 R6: 43fdf010 R7: 10020340
Oct  6 02:37:54.349814 (XEN)      R8: be82e278 R9: db750000 R10:be82e278 R11:43fd7e04 R12:00000001
Oct  6 02:37:54.361680 (XEN) HYP: SP: 43fd7df4 LR: 00235aa8
Oct  6 02:37:54.361817 (XEN) 
Oct  6 02:37:54.361830 (XEN)   VTCR_EL2: 80003558
Oct  6 02:37:54.361830 (XEN)  VTTBR_EL2: 00010000bef8a000
Oct  6 02:37:54.373811 (XEN) 
Oct  6 02:37:54.373874 (XEN)  SCTLR_EL2: 30cd187f
Oct  6 02:37:54.373919 (XEN)    HCR_EL2: 007c663f
Oct  6 02:37:54.373963 (XEN)  TTBR0_EL2: 000000004113b000
Oct  6 02:37:54.374007 (XEN) 
Oct  6 02:37:54.374046 (XEN)    ESR_EL2: 00000000
Oct  6 02:37:54.385729 (XEN)  HPFAR_EL2: 00104810
Oct  6 02:37:54.385760 (XEN)      HDFAR: e0800f00
Oct  6 02:37:54.385784 (XEN)      HIFAR: c08b1490
Oct  6 02:37:54.385808 (XEN) 
Oct  6 02:37:54.385829 (XEN) Xen stack trace from sp=43fd7df4:
Oct  6 02:37:54.397760 (XEN)    00000000 43fea008 02be1a40 43fd7e0c 0026ad88 43fd7e24 00208e38 43fdf000
Oct  6 02:37:54.397760 (XEN)    00000000 43fea000 c933e480 43fd7e3c 00208f98 43fdf000 b6fb4010 00000000
Oct  6 02:37:54.409834 (XEN)    c933e480 43fd7f34 00239e3c 00007176 0000dc11 43ffc4d0 00000000 00000000
Oct  6 02:37:54.409843 (XEN)    0000ee6b 00002800 00000000 00000000 00000000 00000000 00000000 002b401c
Oct  6 02:37:54.421847 (XEN)    00000000 3b9aca00 cd3b5dc0 00000002 00000016 00000001 b6d0854c b6fbb898
Oct  6 02:37:54.433745 (XEN)    0051a3f0 00000000 005171d0 00000001 0051a3f0 00522398 b6fba490 b6f74018
Oct  6 02:37:54.433757 (XEN)    b6fad480 b6fad940 00000000 00000001 b6a00ea0 be82e3c4 b6f9efa3 b6fb0348
Oct  6 02:37:54.445757 (XEN)    00000001 00000005 00000000 00000000 b6d0854c ffffffff 005188d0 00000001
Oct  6 02:37:54.445799 (XEN)    00520490 005199d0 00520484 0051aea0 b6fa304c 00521f68 00000001 43fd7f24
Oct  6 02:37:54.457800 (XEN)    43fdc000 43fd7f58 00000024 c933e480 be82e278 db750000 be82e278 43fd7f54
Oct  6 02:37:54.469777 (XEN)    0027ae34 c933e480 be82e278 db750000 00000000 c14751d9 00000000 43fd7f58
Oct  6 02:37:54.469843 (XEN)    002019f0 b6fb4010 00000000 00000000 00000000 00000000 c14751d9 00000000
Oct  6 02:37:54.481786 (XEN)    c933e480 be82e278 db750000 be82e278 d7324398 00000024 ffffffff b6bba670
Oct  6 02:37:54.481851 (XEN)    c030925c 600b0013 4a000ea1 be82e26c c1676f80 c0301a20 db751e44 c08362bc
Oct  6 02:37:54.493787 (XEN)    c1676f8c c0301da0 c1676f98 c0301e60 00000000 00000000 00000000 00000000
Oct  6 02:37:54.505735 (XEN)    00000000 c1676fa4 c1676fa4 600b0013 200b0193 200d0093 600b0193 00000000
Oct  6 02:37:54.505802 (XEN)    00000000 00000000 00000001
Oct  6 02:37:54.505827 (XEN) Xen call trace:
Oct  6 02:37:54.517793 (XEN)    [<00271a38>] destroy_xen_mappings+0x50/0x5c (PC)
Oct  6 02:37:54.517856 (XEN)    [<00235aa8>] vunmap+0x30/0x1a0 (LR)
Oct  6 02:37:54.517902 (XEN)    [<0026ad88>] unmap_domain_page_global+0x10/0x20
Oct  6 02:37:54.529782 (XEN)    [<00208e38>] unmap_guest_area+0x90/0xec
Oct  6 02:37:54.529842 (XEN)    [<00208f98>] domain_kill+0x104/0x180
Oct  6 02:37:54.529889 (XEN)    [<00239e3c>] do_domctl+0x8ac/0x14fc
Oct  6 02:37:54.541775 (XEN)    [<0027ae34>] do_trap_guest_sync+0x570/0x66c
Oct  6 02:37:54.541836 (XEN)    [<002019f0>] arch/arm/arm32/entry.o#return_from_trap+0/0x4
Oct  6 02:37:54.553792 (XEN) 
Oct  6 02:37:54.553852 (XEN) 
Oct  6 02:37:54.553891 (XEN) ****************************************
Oct  6 02:37:54.553935 (XEN) Panic on CPU 0:
Oct  6 02:37:54.553977 (XEN) Assertion 'IS_ALIGNED(s, PAGE_SIZE)' failed at arch/arm/mm.c:1243
Oct  6 02:37:54.565724 (XEN) ****************************************
Oct  6 02:37:54.565755 (XEN) 
Oct  6 02:37:54.565776 (XEN) Manual reset required ('noreboot' specified)

Looking into it right now.

Roger.

