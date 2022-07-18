Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5949B5786D2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 17:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369908.601505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDT60-0006Ez-MS; Mon, 18 Jul 2022 15:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369908.601505; Mon, 18 Jul 2022 15:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDT60-0006D6-JT; Mon, 18 Jul 2022 15:55:44 +0000
Received: by outflank-mailman (input) for mailman id 369908;
 Mon, 18 Jul 2022 15:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDT5z-0006B7-2z
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 15:55:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11ce667a-06b2-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 17:55:41 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 11:55:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6380.namprd03.prod.outlook.com (2603:10b6:303:11f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Mon, 18 Jul
 2022 15:55:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:55:35 +0000
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
X-Inumbo-ID: 11ce667a-06b2-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658159740;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MSI97MrQotepVKNN0FluTnsWY1D418cR39DIgXmWB8I=;
  b=P+v2dKnELucLYoFbWLbQ0x4EUU2V4+CCnvO5Anu6fIKhwfRKQi30Fj6X
   oqUFSbYZsHzeBqwYmICen1u5bMGVksAgFdp6O0qrBbQxqmTLrAdIZXts2
   jBdOvnY5WkFaA0E8RLf1nVHij4CUrEHT7RxMHLc3Jl7jnYZLWvLk91+/G
   A=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 76052873
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PY7ZUaJk89FUfXZFFE+RyJQlxSXFcZb7ZxGr2PjKsXjdYENSgjEHn
 WJNCDqAM63ZZmGmco1+Oti180NT6MfSzt82HgplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYjdJ5xYuajhOs/3a+Es21BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE2P5LM34OY6gj99lpEHFit
 uQJNxMscUXW7w626OrTpuhEoO0GdZCuFqVP/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H11j+mLWwwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPBkWffoi337gPJtSjfetItEqaDz8dzhUSYy0YOOQELd3Lu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCy
 Vuhj97vQzt1v9WopWm1876VqXa4P3gTJGpbPCscF1Jbsp/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:4bZ7T6Csvic8zuDlHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7giwlGl/NLAgF4vsulKRRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.92,281,1650945600"; 
   d="scan'208";a="76052873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Le7jHFR8LkExmaXEczkH2ZMbTWF4s38b0uv/G3Am6cuoyyXpCtFvBzqnBcpz0i5VHqW/SHpOqXpj8wuywUMZaG5WpBHSnkFobT3m9ReB5ObWL15tWxa5kcGUfZbon4EnoGQ2x7uWjvtmBG1YYYvIYDc/JiEzCXw9HMf8WpjvVHsAV4gWcspyUkGEmPHW1FX+rwFW6kcnJaODVR8pbQm8PZPAGHElrwlVGjf1AdzxhsG2kyBDU/ARNAJwtnU1IOkM+1O2XsAZsy584/L4D1BpXMEFqxng8/1uPtthIgXo4RhEskwWSMMXdrapT9tUEo+3hv62wzR5hN0y/yidX93eBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSI97MrQotepVKNN0FluTnsWY1D418cR39DIgXmWB8I=;
 b=L3w7iSEiUIbsQKeE1qpDp4Mfi8L+2L0af5YLYLqEqq+bHMSXu5JO3uu70QARx1Mz1EuZ5LDOx8WBV0sUX4DqxSgnHZA6jMRMHmoqz3ALtL+QT8io/qvL/FprsMDHkLpSuVibX75t3/2YTXCFJzi56a7cstFbY/76XO62mIPSV/KFYyGhPHTMpGTS4zQddQ0NJiAoOO6FYtQW+YqrW6Bb+rcr9Xau5OUpzkTUajbYMJhhVx7x5Az4Ig9iiAA8OPpm98tnhw1Uiz1RJLGcOt1CZY2tF/SWs6oNnQrMhwEsJZlYXnFZhWnFDJX+VAnyxDhmzDsITf2F/neecabPF1E69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSI97MrQotepVKNN0FluTnsWY1D418cR39DIgXmWB8I=;
 b=pTftVUbRpzVR2tKpuLST1wy1d08E/2XV9QInW3i9y7I3nuBRW9VKrsuBCInVOPZjJVHPDm6OTmnr3DPv6YUup8ODQEwg148rtLQQvWT/O2RIPqHjTFy4gLf71b8Vud/XJtdJ8clpReLjphmXvWLDS3w3c1Ia4Uu69dfJ/Q/UP1M=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: log non-responding CPUs in fatal_trap()
Thread-Topic: [PATCH] x86: log non-responding CPUs in fatal_trap()
Thread-Index: AQHYloTvaSPt93x0vkCi/J1tzLTyAa2EUJcA
Date: Mon, 18 Jul 2022 15:55:35 +0000
Message-ID: <f951747e-9792-1ee9-e0f2-df4568d22a40@citrix.com>
References: <3b8c5d7c-ee0c-dad6-8659-5b4b339c2358@suse.com>
In-Reply-To: <3b8c5d7c-ee0c-dad6-8659-5b4b339c2358@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd87c3be-6bab-4fc0-d707-08da68d5f39e
x-ms-traffictypediagnostic: MW4PR03MB6380:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FD4B7N0o4WZTl+Fzu/yWw6uDHNc0fDdQfiTTy7PPLiVA9f9P1jqIxM5wo6lwjtzME/8h2cFVhV1ckOwpzXRqi64/5lPj2CY46zHAS31uO7srAE/em3K4dBDlOhQ9rYU8HQ7X5z+imD1QjnYJHlOOQr5pcx/ZqQblRnZ431GB5AEwZhEkfgJZpeSg7e334Hm6w6AxZW49dRh78AW5NgyZA02wDpAT45zLye2AFwVQe9sosNjRZJWH9sZynpYz5w5LSdiXMjnlHt+7qc6rF9P/YOXEJC32s3fJagc5O1/RxGaR98Pq0yLKE2IO75+jP5r2Lr2E4MoJzYBbcZ125MqqYeuxw1ODRIhiv6TOmhwOQ8Zz3N3g+Zcvua84aPWxVgzhA6ZYErU5BEQ4vcRQ1GEH8j009ASmrWK82JNbq9uxjMIJlkeL+vl8Tkb1CXTmg+b3j4Bwhgcfs6eTXveeoeICbpslSsymCjbGhDSjH9qaRtu+6gp0a57PDrYF5IWzjbSWrLBMQEpso5hJFz+9u6Q1jd7pRVcOOcMTHODEmNj3cfO7fn3lPyccR2P3bqnIiPvq/UapXmIZ/ii+YdFKByiSuEjXko8fyAOxccskvoCUfwUBHaO3sTwZmMKalKx+PVGGbLX0Jee04787XJTTs4v/+XvaZ/JrjjrXTuCkrJQ/ZHgczJ8/PwXHCWRNdxGdNi/rDPUQ+fVhpH7Brq1khWiMIts4j1HlAIvF+UJJ80hJHy5SEnnB2/0RZjcy543XohfOxMVNo/YM6NrMr4fST37STmv9r7IiCTBEtnv7ljcHIc3Rj6129kQQptgNX9QnPA+IW/0ZrJdURBPwVLNB4DthVl4ATg63i13k4wLFfemJYKVdruhuJADVlOZ7XGO4WE7k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(107886003)(2616005)(186003)(31686004)(41300700001)(6486002)(26005)(6512007)(122000001)(5660300002)(2906002)(4744005)(478600001)(71200400001)(8676002)(31696002)(66446008)(66556008)(66476007)(66946007)(64756008)(86362001)(4326008)(8936002)(38100700002)(76116006)(54906003)(82960400001)(316002)(53546011)(110136005)(36756003)(6506007)(91956017)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGZvSTZrclhmY1dLamlUb3JLVU4vZy9qS3FWRHFQYjVHMmJMUFh0SVVHellv?=
 =?utf-8?B?M282cElib0hzeWYxR283UjZlUzR3bkc5RWFGcHdOZmcwWlVla3ljTWN0NVQ3?=
 =?utf-8?B?R1E1aWsxRVIrV2Q1Z2Y4VCsvUlVPdFIyczhzSitaSkk2SmE0ZlV4WmZHcHhx?=
 =?utf-8?B?SzN5QkgrNis5VzNUR1dQK0Q0TnNSTExBZGo2WVNucTRsOTJ0NDlWSFpTOW9E?=
 =?utf-8?B?c0M3KzZVYTZxTkdvZDdsNEtCa3ZJVnVBT05WaXBzVTlBUnJyL0k3eFk5elM5?=
 =?utf-8?B?M2FUeHhOWjFOS1FxK1FOTlMzakp3Tmc4aWZ4emRnOWZubDltRzhUb1M1S2dC?=
 =?utf-8?B?U2lrWDZocE9HTFk0eFVERTdhdXJGdUQ0VXZOSlVmendlNitDem1uS2cxcUlI?=
 =?utf-8?B?QUdUYlN6aHF4MWtUSFhyNmN6dmVtLytsZ242bUpOMjkrN3g4b1QxZC9kRGt4?=
 =?utf-8?B?ZzUyRzhtZjJ2NnJlZ0NYRXdnZStqWlhWODBZUVZiOU5RTWpDSi93R0dNdllB?=
 =?utf-8?B?Nmk0VC95aXkrTlZHVkxKWVliWjFwNWJZM1hyUVhvSVJJVS9taGdWbi9GOHdI?=
 =?utf-8?B?endjRHJXdnVlZ3dwY3RabTJjRUhUSFl1ek9WM1B0MFBka2ZxVnNwUjZsaDVx?=
 =?utf-8?B?WndWV2c2aWFYWm9neEFnejVBdmF6cVNkYS82UHBoZGRUVENtTFhXY2J5ZEps?=
 =?utf-8?B?T1FCMjFsMkhFUFQwbW5jNU1Pb01FZXNVT1AzTEhDR3ovc2ZRclUwaENUdXZ0?=
 =?utf-8?B?V2NocWYwdjFudW5NSGxlZlJLdFRBVTZHeHdKQnZOa1ZhUy9CQmVmdTVEWFAx?=
 =?utf-8?B?YXBXbjd2QnJ6RjEzMmtnOGJXcDlpdk5NTGZpb3dOSldIQzdsYkxVZWxtdDZQ?=
 =?utf-8?B?NXpFV3F4YUZ6Zmd1WnVHTVFmd2NEem1lc1o1RU5DOHJHM25RUUNGelMxMDBa?=
 =?utf-8?B?QStLdEJTTWVkQ0Mzb1dtcWNyZWNOUEtPa0RkOEdjT1JWb0VjaFRuVFhqUUow?=
 =?utf-8?B?UXl6ZGZwenQ1QUZGeGlxUnMweWw4WjN6SHUvS1E0WEtkYjYxR0xkQ1haNHpS?=
 =?utf-8?B?aWdzWW9wb012cXFJQ0Jqamh2TXoxWHd5WGhmOWVTakc4NVZabml5RkRUNXlC?=
 =?utf-8?B?ZTBTU1FQVkVBOXhLNlRhakZsYXAwM0ZEZ0I3YnJyRTZKUjRaL0g4eHVJdFZO?=
 =?utf-8?B?Zk5mVUEyQ2U3aCtIQzM0dEJHZTZwTDlBMHN6aDZxeUMxQTI2a0czdkVjaG43?=
 =?utf-8?B?WXhjRWRubm1jRmdCemRjenppanp4MFpSNldLczl0TUZKN1lZOW1IZmdTZFh0?=
 =?utf-8?B?ZTRvZ0w4MnBFWFpuVUhxUUlzWEVDVmYwRURVT0ZCaXZYZGIrbThQNDRqWjh6?=
 =?utf-8?B?RCtTZjBPN1BVeGduUUYzRVRweDc1bFRFVWsrc1hMbWVueFJzcGFiK3pZVkkx?=
 =?utf-8?B?VktCRkxVVkcwelR2bE1teEJzYnZLS1ZDWFFDaXVZamRVTTl5a0NsLzh5VnpH?=
 =?utf-8?B?aWUzUTh2OE9YWitZWEdHdDB3RlRhdWMzVHkwUlJNNFFxejN3VDYzR2ZyN21J?=
 =?utf-8?B?VVFoNDFQa2diQmtEL0VwUmVla295TmxtUWtaRnl1MkRIUjdaaWRZSms1WjdG?=
 =?utf-8?B?ZVJ2M2NKNE9va0FneXNNMldmUTVTNURpM2g1ei9jeXg0V013VlhNVnZDa3E1?=
 =?utf-8?B?U1BkdVZ5NDNkbFBGamZMT21DUGlueklBUWk2OHBSTWZMSkhlMTVvZGFsMkN5?=
 =?utf-8?B?VmZGSjloRjRMYVdUMk9iU2NHYysyQWJMckVrUVRNbVJYV1hPOTM1LzlibkJJ?=
 =?utf-8?B?Z3NQblFKb0d1K3AyS0N5bzBqdGpmbXVNeUlic2FaNWp6TGsweVNOQ091TnRj?=
 =?utf-8?B?eCtrcGN1OG9rRVVsQXhqVnNmRG1NRXhFNE8zZXppSWtlNnZZeVloQ1U0MThI?=
 =?utf-8?B?VUp2ejNmVHJGSjdzcTFIaUU2VzFTeG0xbXQxZ2NON2p0dDJqdHRzeEp5TGZl?=
 =?utf-8?B?RmFXTnZ0RHNBK3d5WHVDVFQ5Sm9nZVdidWRrOGpjUHRDSkNQL3crdzJoZ0dm?=
 =?utf-8?B?M1grMFlaL2M4dTV3UjQxU1JWS1N5TjBvWUxKK01JWkJtbXRaN1VlUjZaZ2s3?=
 =?utf-8?B?TEQzdyt4WmJyNVN4K3d6YThnSENWZmJJY3JFdkYwQVJqcHBxS0h4SDFrdWJa?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A1357AF39ECF44E968731974C0886E2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd87c3be-6bab-4fc0-d707-08da68d5f39e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 15:55:35.0317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jufGTmXmmqaMgN53NvD/+IDTFJuilMPmoj5gUXzfzkylFP6LeGmvNpb2THuJmSlXLAvbTw+mmbNZJssPA/3xXEUtIoAurqQqprFQUbIIG5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6380

T24gMTMvMDcvMjAyMiAwNzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoaXMgZWFzZXMgcmVj
b2duaXppbmcgdGhhdCBzb21ldGhpbmcgb2RkIGlzIGdvaW5nIG9uLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+DQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni90cmFwcy5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jDQo+IEBAIC04NDUsNiAr
ODQ1LDkgQEAgdm9pZCBmYXRhbF90cmFwKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZQ0KPiAgICAg
ICAgICAgICAgICAgICAgICBtc2VjcyA9IDEwOw0KPiAgICAgICAgICAgICAgICAgIH0NCj4gICAg
ICAgICAgICAgIH0NCj4gKyAgICAgICAgICAgIGlmICggcGVuZGluZyApDQo+ICsgICAgICAgICAg
ICAgICAgcHJpbnRrKCJOb24tcmVzcG9uZGluZyBDUFVzOiAlKnBibFxuIiwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgQ1BVTUFTS19QUigmc2hvd19zdGF0ZV9tYXNrKSk7DQoNClByZXZhaWxp
bmcgc3R5bGUgZWxzZXdoZXJlIGlzIHslKnBibH0uDQoNClByZWZlcmFibHkgd2l0aCB0aGF0IGFk
anVzdGVkLCBBY2tlZC1ieTogQW5kcmV3IENvb3Blcg0KPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+DQo=

