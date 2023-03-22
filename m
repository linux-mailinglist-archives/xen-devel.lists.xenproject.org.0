Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CB96C453B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 09:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513188.793831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peu5j-000593-2N; Wed, 22 Mar 2023 08:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513188.793831; Wed, 22 Mar 2023 08:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peu5i-00056Y-VS; Wed, 22 Mar 2023 08:45:06 +0000
Received: by outflank-mailman (input) for mailman id 513188;
 Wed, 22 Mar 2023 08:45:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7Yo=7O=citrix.com=prvs=438d02f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peu5h-00056S-FL
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 08:45:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d50b0bb1-c88d-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 09:45:03 +0100 (CET)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 04:44:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 08:44:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 08:44:57 +0000
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
X-Inumbo-ID: d50b0bb1-c88d-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679474703;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WeyHVX45ve0XlQn+XS9F/19/HoiJ6Rt/ATiLQCwf930=;
  b=BQyXqv+vg7oslOLAWEvDAR2BGR12DUGhhFVAw7CrwcPiHIDp/WXVwY7k
   jldX4cI/JS6ChkQdOzFRgenma5hobeT9VcYxsQ8Z5LzS548JOfsCCORV3
   s4/hSen4d2Pj2vvRLvYU1Pue20MqS7aiTriBNPuMMF8T9IwzIhPD3+pa4
   0=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 101836089
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YUAqOqskZ8MQ4d8Cpm7QxUf/l+fnVPVfMUV32f8akzHdYApBsoF/q
 tZmKWqAPP/eNjSmKo9zbNnj9UoP7ZCHyNYyGwE/+yljRiNB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEzSFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBSkKYB6jhs+Nn43iTvhjmM1/PMTLFdZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIC9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgr64x3gXDlwT/DjUKD0fluemF0nSucPwEM
 GIo0ToPsK4boRnDot7VGkfQTGS/lhIRXtt4Eusk6RqMwK7Z/waYAGcfSjdLLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcGRwYY59jooKkokwnCCN1kFcadjMDxGDz26
 yCHqm45nbp7pdUQy6yx8FTDgjStjpvEVAg44kPQRG3Nxhx9TJ6oYcqv81ezxfVHKpyQQh+ev
 XwHs8+E5esKANeGkynlaOAEBrSg/fuGGDzan190HpMl+iit+nisZoRZ6nd1I0IBDyofUTrgY
 UuWtQYP4pZWZSOudfUuO9j3DNk2x6/9E9ijTurTctdFfpl2ckmA4T1qYkmTmWvqlSDAjJ0CB
 HtSSu70ZV5yNEit5GPeqzs1uVPz+h0D+A==
IronPort-HdrOrdr: A9a23:PUVmgKGhRV2hSBhGpLqE0seALOsnbusQ8zAXPhZKOHtom6uj5q
 OTdZUgtSMc5wx7ZJhNo7q90cq7IE80l6Qb3WBLB8bHYOCOggLBEGgF1+bfKlbbdREWmNQw6U
 /OGZIObuEZoTJB/KTHCKjTKadE/OW6
X-IronPort-AV: E=Sophos;i="5.98,281,1673931600"; 
   d="scan'208";a="101836089"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQI5PsBBBJvWmLVW379qsrBvSZ8gYcGu4lLUdfmwaGav0UcaPGRleI62gzc38/F6gQ/53AXJ7vE454rksHpW5O8me8ifv3Qj1/K3+wTCzpgR1C7bwXDGAgv3aJK8Go2AuENQPrSUk7hphlIPJunk6fR44857yoKptOIQr0OBnReyvcbjggjrHIWEOUbC3AsOr/PsxAunt2gJkLzHfzRZN1cwF7MltLckSBo5jUKR0R4e33Ti/qhlMmmGraGtuxqolV8f4N46M2Jp9UmEwd4FjmS9MdIVrh96qvuHDesagelQcyo7cySFBPABQbJ6XcVymCl8dhMQCKuycu+cbDbH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3ef+lCFsWBJqM5WPQAX71J0N0LnyXmPG9CnxUu7BEc=;
 b=RoroxJte6Ag9ZOjfhaxqRLSZ5GVHbeINI3u01xAifY1qCwBX+Zkk/TjG2Eupfpar2vcqT0orG8ZbNL/0co2mIVojxSdg4zox8kVGp8/R85gfQwnmpmNv5f2Itf7QoQbqLNfk4Um7eYHr5mnFQtaUNzHv1JHyjHWKf23nJjnTQ0lGMTUmelJXeaBKDOIKz/Urh44eoLcKUYO1KQaSUytt5nsD0u7RCZYnIMccSMSXeQ5rD+rf1fHLClwkJcv/VqVCq3yvVUiZ9JopkZSd3F8DVw6Ns8GbNcWICz3ZQtZ+gNfukDgBtm+EUZ0nroedXIHQxh80J2OBNsexql1wrtRQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3ef+lCFsWBJqM5WPQAX71J0N0LnyXmPG9CnxUu7BEc=;
 b=O0R8Iu5cvqHooCxE4IfWcyiX6BdnhYu8IjR4/lnGuCbfFgATobe7psmbXReLmZ3UK8dvyjK0vHzoW0oVO9c3LlnIYtt06p1wZjjVGFofA1E2JBXXXou/zSsZNLHlKpVeftBo8QopNsQaAwb4WCfxpnENJRyTzBWeGXhZmVFuwQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <866f4219-79e1-5bf1-34aa-1fddec16a750@citrix.com>
Date: Wed, 22 Mar 2023 08:44:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 1/5] Use HTTPS for all xenbits.xen.org Git repos
Content-Language: en-GB
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <cover.1679412247.git.demi@invisiblethingslab.com>
 <69fdc220c4cf7cd571e60a9e5bc89150cfb52017.1679412247.git.demi@invisiblethingslab.com>
In-Reply-To: <69fdc220c4cf7cd571e60a9e5bc89150cfb52017.1679412247.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0144.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 079b619c-a6b9-4d19-e6a5-08db2ab1b6d3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M5I0+96WhPRjObfqAi4ZUsvhU6FT1DI347+B+nBvdYDcMbRysckDf3YCWgCeWi59irwHpMmh8DWUguir/3oWAdbd9YdY8GLkyYzOZkFoQXqKklrOoSQ1qXsj/s9hPUD7KiRMXuXv6/CXGm/RSpUhh1Xz/aivJzPCZ/WbXWibO8m6q4N9+L567sqAeNOS+eXG+y888pE32wLuw1T+N2AcN7eKk5R6NAyfyVGlw67D4iSsKCqXRp34P+1eTFDBxeAdJLFzeDGh5KqbPKiwECsmOXUenkhl5CD6KAjIikCW0qGXEKU79zmrZSrdOj/fnMMTttCCD9dq10eXAx/OdUYLCI5rIlxbmtNK6Ocd9KfeFAuSptLWc7iahH8Yc7ZiJZiz9Rjao+NGoDvkz56vWGVIJ43uZ0CYii1UIHNiNpGV2J8Eh8uhAHHlD5i3kh8kQtgYvLTmv0dqEDvcIlE1ZF85nWUFMcWo/XSDud3LIl3zbmwrVShn9wElMKu/EAdwmD79N7RbOCgU5dXF8GNE+zNzkOZ9s18s3Z6Y26hv0XQTduIq96EJyfcUIrMuUtbhJTZ4SQApGwcCVi593J+RZVJ4nQSvc/RIXUyHo4z6XKueto4bFDBhnw8661sjJJLecpdkuOtd6GwDt2T8InqL+KgnqI7BTzWYJ4Q1W6pnRxHK8JlTM+AJeEaYgrkwelMpMJ/5nXnzWLGtVcdQW5bpp49moYPQYQqUulfYtehGaWtE+/pd0ZJFL29mgbWYe6g8ZRA5Bmi6XT86FCoLUmktYU2Kyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199018)(316002)(31696002)(38100700002)(36756003)(7416002)(54906003)(66476007)(8676002)(66946007)(5660300002)(4326008)(8936002)(41300700001)(66556008)(86362001)(2906002)(478600001)(83380400001)(82960400001)(31686004)(6666004)(53546011)(186003)(2616005)(26005)(6512007)(6506007)(6486002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXQ0WmIzTEl4UmJTRXp1YWt5ZE5EY24zQUh1WXZTWUkyMlJkUVZhQmgyNDZX?=
 =?utf-8?B?blVCUGlKNko1aEk5dDFBTHJiL1VrenNyUTV4dy9XaXl4VWtBY05IOGpDeHpj?=
 =?utf-8?B?RHkvTWU4MEt0R29vdzFpS0tGaFlkVmN0NGdpZ3BzWHFwd1Rub25zSUtzZFBW?=
 =?utf-8?B?ZXZYUzlwM2lTOHFSM2F6RkFneUp0ejhaNnVhQ3RheUlDU1gyOWRXL1RKV0ZJ?=
 =?utf-8?B?VnpSMGdtZmFVTTZ2UGYwa0lJVGthZVZzTEVoWitiaFNkTlRIZ05QdnFPZm03?=
 =?utf-8?B?TTdzcVFEM0FlQW95bEJqZ2wrZWJIQmpnajB6T0NSNHlKdDZ5a3dDT2d3cXYr?=
 =?utf-8?B?NktUalZSbE0wcW9JT2taQVhIT2J4Ty9LOC9pMFNzMWlGaVNkWVg1aXZ6ZHpI?=
 =?utf-8?B?NWNqZUVKblpySGtiRHRCQmhsSDRvd2pvMG1FSVRnNHdRTnNqeGhCbmJuN2hq?=
 =?utf-8?B?SGZZSlVpR0N4S1RaN2VYOTJBeitQZEE2MTY3OW1ndy9jQUp1dHZHNkxMQjJX?=
 =?utf-8?B?bndrWW5SUFVwWllzYkdQenVEbVRtN1ZRZTFTZVE0SnlNZVVUZkNlSWlSazBE?=
 =?utf-8?B?d0xkbjVxQml2Sk5YdUVFQWd5Qmh3ZmxuTERsVTJvcWt1SUJwUHd1T0N3UjVl?=
 =?utf-8?B?L0JadlI2M1JyYlVmekdYcmlxZXNXQ09PVUdPZ3FzOHh6bzEwNTZtT3JFRno5?=
 =?utf-8?B?d1FXQ1hkcjRhLzZ0ekp3RGdIM0hML3d4R0h5YW9tQ1FkZmpnRnNrWW9UWHB0?=
 =?utf-8?B?MWJNWmpVMXRMeGVXTGxjaDZzeGEwbGhSZFd0a21sK2JlQnUxamJRMVlqWEJT?=
 =?utf-8?B?TFNlSUxnK3pGM2hVUzk4MmVqZzV1L1dLazI4NFloVDZEdWk1WndnOWNGck1C?=
 =?utf-8?B?TGV1V3B0am1hNk94L3Z3ZlJoNFJCU01TYkJRc2RwOVlGN1I1c2xtaHhibU82?=
 =?utf-8?B?aGdBUTREcS8zQmZucXk1Wng5UWQ4S0szNnBLb1pUQkVEQ3EzSGJ5eDhQdjg3?=
 =?utf-8?B?U29EdlBZS3dncFlYTlp3TG9KbzZDejVGTnZwTG5ENmd5TVkxWHdsREV1Mkpu?=
 =?utf-8?B?T3krQ0w5cU9nSlVhR0p5aGwrUVpvblluTFh3MlR2WjhQcGVYRU1IajZSM0k4?=
 =?utf-8?B?cmVSY3RsY3RhSDd6a085bnViK0RaZE9VbVpnTU9PUmJKQWJiUVoyQXNpMWda?=
 =?utf-8?B?QVNuMkVNVDF6dWdRUnI0b1V0K1ZlUXM3bXN0WG9VbDMrNXBVYVFGcEZqcFdj?=
 =?utf-8?B?c1oxb25tc1V1WkFKVkpZaWZKNkxPVEV5TTA0dC9ZamxLNTFaRExtMUdNN3ll?=
 =?utf-8?B?TUhqM05CdXdrTHRCNUUwQVdNV2JVVWl5VVZuQmpqTnZMeE4zc1hEYzBIZSta?=
 =?utf-8?B?LytYNnhZL0ErTzhLdlhqajE4Y3l1SHFuYWorTzJPdFg5TjZwbXZRaWZLSU5V?=
 =?utf-8?B?WWEzK1dacEx1ZnZFS1lQaEtXZTFuMlZ1ZnJGRkRocXV3VVpxSVlDbnZmQVhw?=
 =?utf-8?B?OXhWT1ZFWmhXdFpPLzNDTDdBd0lzT1ZjYXQwMkYyVHVCNE5ENzI3b0szSGJW?=
 =?utf-8?B?RUpIQ3hJZXF3OFAvRkdGVGRjeC9kN2ZlTkQ1S0hWM2czd2xod2FyVGFCeE1R?=
 =?utf-8?B?TGdNSVpUbk1ZSWtzckc3TUk4V0dmWjNsVkFNalVsLzZDVFRNckVaaURUK1Nn?=
 =?utf-8?B?NVJ2Vnh5bUdSL3pYUHU0cEVkR2Q3OENTWW54WVh5QjNBeGlKdHpFL1htKzU4?=
 =?utf-8?B?MUF2ZkhsQ3lOUmowK0tjQmRNZzNoK2J6Ty8vK2ZDMkN4c3BmUXZ5b1VNUDdw?=
 =?utf-8?B?QXNma3BaTmVHU0Yva1EyNDhYYVJDdGNQRkZMdURzclIrQXdzbUJiemtQYlJM?=
 =?utf-8?B?bUI0eUpCejZHajV6eXkvZmZwTUUvWU1Lbmk0ZzZ5RmthTTVSQXI0K2NVQm50?=
 =?utf-8?B?d2VSeStMU2lmRmFVcEFTNnBad0RhcDYxWWJNT25RNFZPeWMxTkhpVHRyQ1Bo?=
 =?utf-8?B?SHMrVmYrQjFpVmY5RHQvZS9tV1F3WW44NWpvbWlHdFE3UTVzenNhODllSC9U?=
 =?utf-8?B?TUN3OXF2d3RwQ2NFUkEyTWZGSlNsZWUrWjUybnZHWThtM0tBbThXamlhYkpY?=
 =?utf-8?B?VHl2ZVRCa2tXcTR0VFlnb2lUYSs5OUZ2VmovaGZFVzY5VnJJZnF5ZHJyaHB6?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?K012NHV3bDhnUWpjYVJvcTVmdFllbzF4YlFYN3VkVUlrKzcwYUl6WkVNYS9t?=
 =?utf-8?B?Y2NoQmltWGMzRkxjNEhLQXRSQWVDY3lid1drNlNKekJwTGF2dlpjd0NPa05q?=
 =?utf-8?B?ZXMxY0xNY2tVSFU0ZHpYVU5WN1VqeEV2alROaHlFWXIrY1lSUm44S01EeGVZ?=
 =?utf-8?B?L25TWjJmRk9abVlzaDBkdStkZDF6SkpkRk1BVXlRdkhtR1E0Tk0rVElyZVZK?=
 =?utf-8?B?b0xQMlJERk9zN2QyeGN0R3pZcmFMVS9RT0tVTFQybnk4alpFVXdLNiszRFgv?=
 =?utf-8?B?RTlXTThzQStSVnA0L3crbE1PWktiK0J2SlhOak1RR0xCZTlMOHNjN2E1S2Rm?=
 =?utf-8?B?aXFQYndsMi9GZE1Gbk5xV2FuemI1UVFtMng4RkJWcHJuQ0JLVEZIYWtYaEhM?=
 =?utf-8?B?NjB2TmtSMG91Z3dhSU9aZjdleWp2Z0p1eGFub1paeEdCazVUSE41UlZxY3Qy?=
 =?utf-8?B?ZjFQVFlUVFA0eVlTQUNSb1ZUazBJQlkyYkVITDVNbVVsZGkzNVNsZnYzYXV5?=
 =?utf-8?B?ZnN3UVRkTURIWW15NWhxdjRsUElwa3lidnBMRithN2x0Vm5xYmJBU3lwQUVz?=
 =?utf-8?B?ay9UV2xXMGw0Yjd6QmVwTDVtdGhWKzZJaC83MjI1dVFQUnFreEtTTlBtSTJU?=
 =?utf-8?B?TFhzd1lYMHAwcXZ5S3YzdFB2OG0rNU1ENnBXaWxEVTRZK1podmwrUEoxd3V0?=
 =?utf-8?B?d05oRUI0WFJSS1owQ2svb1FVS05qUHAvcUtIS0VNMlV3c3lFcUUzVGFpL0RQ?=
 =?utf-8?B?WFpTZmJwckd1K01GYjloanJOWDlMaVZ5V0ZYUGV5WlB4VzZ4OGJMWWVxZUQ2?=
 =?utf-8?B?bUxWSlBQRGFoL1N0UjRNTGJLUEkyR2lEUThpQm5mVExZVFVBbEY2QlBSMEJy?=
 =?utf-8?B?QUExU3E5K1k3TmF2c2NENGQ1cGNWdUIzVUdPUGM2aE9DbFdCb1QvMi9oK3Bw?=
 =?utf-8?B?YU1naUNuMzFuK3BVVGJJcCtvajE2Q2pjU0NjWTlISGE2OHpaek9NWldxa0pP?=
 =?utf-8?B?TjEvdmpGMGhMdjE4QlJUUGpnTnd2T3NFck9oVm9VQ3N0bi9qQ0tZSkxIckJS?=
 =?utf-8?B?ZWF0cFNGaWQ3bUtaNUQ2NVA5dFpKcTI4MWs3ZzlocVRLSWFPeEp1N2tXRDNX?=
 =?utf-8?B?c3E1SUp6VWI1aGJTUys5b0lTYmcyekE2Z0VvWURFdktoaVNyWkttRm4rNENE?=
 =?utf-8?B?azQ1a1ZUNU92YTk5TURMUDVFZVYwSFdTb3B1T2E4dzFQTC8reUkyNnpwYVUw?=
 =?utf-8?Q?q2F84Q/GZFKdszd?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079b619c-a6b9-4d19-e6a5-08db2ab1b6d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 08:44:57.0787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgI+2uOkzoSa7eH3s31vBMx1o5kzxePahQHI4bfzBYfjrVCEt4Nt4uVnfqpnbK7rzPHZrzQs1aSDYjKpK3u+Z/qHdBWX61g/YkoobbmIUTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

On 21/03/2023 5:33 pm, Demi Marie Obenour wrote:
> diff --git a/Config.mk b/Config.mk
> index 10eb443b17d85381b2d1e2282f8965c3e99767e0..75f1975e5e78af44d36c2372cba6e89b425267a5 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -215,19 +215,11 @@ ifneq (,$(QEMU_TAG))
>  QEMU_TRADITIONAL_REVISION ?= $(QEMU_TAG)
>  endif
>  
> -ifeq ($(GIT_HTTP),y)
> -OVMF_UPSTREAM_URL ?= http://xenbits.xen.org/git-http/ovmf.git
> -QEMU_UPSTREAM_URL ?= http://xenbits.xen.org/git-http/qemu-xen.git
> -QEMU_TRADITIONAL_URL ?= http://xenbits.xen.org/git-http/qemu-xen-traditional.git
> -SEABIOS_UPSTREAM_URL ?= http://xenbits.xen.org/git-http/seabios.git
> -MINIOS_UPSTREAM_URL ?= http://xenbits.xen.org/git-http/mini-os.git
> -else
> -OVMF_UPSTREAM_URL ?= git://xenbits.xen.org/ovmf.git
> -QEMU_UPSTREAM_URL ?= git://xenbits.xen.org/qemu-xen.git
> -QEMU_TRADITIONAL_URL ?= git://xenbits.xen.org/qemu-xen-traditional.git
> -SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
> -MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
> -endif
> +OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
> +QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
> +QEMU_TRADITIONAL_URL ?= https://xenbits.xen.org/git-http/qemu-xen-traditional.git
> +SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
> +MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
>  OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
>  QEMU_UPSTREAM_REVISION ?= master
>  MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3

The prior layout was somewhat necessary to dedup the GIT_HTTP part, but
now we really do want pairs of {URL, REVISION} together, rather than one
block of URLs and then a block of REVISIONs.

This is just reordering the lines (and some newlines for clarity), so
I'm happy to sort it out on commit.

~Andrew

