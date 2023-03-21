Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568326C3328
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 14:47:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512646.792691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecK7-0008LY-9p; Tue, 21 Mar 2023 13:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512646.792691; Tue, 21 Mar 2023 13:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecK7-0008If-6m; Tue, 21 Mar 2023 13:46:47 +0000
Received: by outflank-mailman (input) for mailman id 512646;
 Tue, 21 Mar 2023 13:46:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pecK5-0008IX-Ex
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 13:46:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfc57d99-c7ee-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 14:46:43 +0100 (CET)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 09:46:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6106.namprd03.prod.outlook.com (2603:10b6:408:11b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 13:46:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 13:46:29 +0000
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
X-Inumbo-ID: cfc57d99-c7ee-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679406403;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O4wx3K4RP4vqWaw4elVAW8Z1CkxXv1HhIOAo/6EYLeE=;
  b=KpcOwOIZDxWuu5u/LPB2EAgFdD3wMB6tRdkWuBnhdGr3Q1PYEJzyEXFo
   6pIZNF9zL6Ar52Qu5fQDXY3hsaS6q1RM+m6DQ4YYkpi+5997jNtLD4u7a
   u35HEtXHKn7592dfkz0f8rBU65KJN8GEzsrMZ8Ll7UcgnE4DktcAcWjAA
   Q=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 104125860
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kPkk+aucWpjD7FtueUScU5kA9efnVN1fMUV32f8akzHdYApBsoF/q
 tZmKW6PPP3fM2umKN4iPomz9x4B6sKGx9IwTwE6/ik9RC8R+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEziFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAXcrZzSdg9+MnJ34cbdXu8hzPcPzM9ZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4C9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqqcw3Q3NngT/DjUYcHSjpcSo0HebVtlWE
 WcYxi4jkPQ9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQoy
 1uIktXBFTFp9rqPRhq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kbkhvKR81LDK2xg9v6CDz0h
 TuNqUAWhq4ajM0K0eC3+FHbmSOEt5HPQgMloB/KNkq75wd+fqahZpe0r0LGhd5QIYDcQlSfs
 Xwsn8mF8PtIHZyLjDaKQugGAPeu/fntDdHHqVtmHp1k/TL9/XemJNpU+Gsnex0vNdsYczj0Z
 kOVoRlW+JJYIHqta+lwfp61DMMpi6PnELwJS8zpUzaHWbApHCfvwc2kTRf4M7zF+KT0rZwCB
 A==
IronPort-HdrOrdr: A9a23:KrvbTK8L6ypTjZHif/Juk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="104125860"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrSBL2fdV7umGmLLqa1G2gQCJQe8vHlUeE6esY7O8cuEPwtoe4Lah2kvZuOSj4yrW/SkULQ+u2P+QWBNp/dC/pL+w/h+6fle1u+WXp18CLHFWnM4W0Az2zyB/M/GHfI01LAduL3kCOIevvVAKsdh+a8CDZC1c1XH3egRiyJYeac2yj/hF6jfrEsN+sKFPapG8NvAtT9CIAqrFn5i5zPjuWePPQDrRz31psx4fAnu1EKPDDAGrFhn3cUkUf8fErRU6xk0VXupZ8t9f6cw2he/fEDI/98YCF2PHMrzTDqY11vkWOdwTHu/Kr5vH2btlFwOhn/95/O2mj0fcvfsEm/YpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4wx3K4RP4vqWaw4elVAW8Z1CkxXv1HhIOAo/6EYLeE=;
 b=obsZf81jFXunMXd1M18O5LPbwK62lxZTDU47nLbXObIBQU6aH8WCil4To50UAkmcaIQfWJF4EHcie/k813/cQ2YvVHQSDT+4NfWQ5i7HZfCwHax3Z3Ily0gd3LKGrHGfA85gA7nGNKo4JoRZuwyV/xQ0O97zZFiJSv31advnEJPtR7uGEsRuukLeFDziShRAV2RAKZRY9O8/8hVCekIrewbzJfVDkPRWMqXvpKN0rEeeTzK6zvBfpPwpBqYdTkCWufWt3k62i7G+MIV70INRP7yXtgGcr8/0fL3tTFlT9/VkLka/oduWDbyblAnzR34LAqYrxUWBHFgtwOSPjFl6JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4wx3K4RP4vqWaw4elVAW8Z1CkxXv1HhIOAo/6EYLeE=;
 b=admx9ZCue1sWZhTyDUa9EX2mTEHmqbYhwKkhDkzSHl+Jlzd1YPrQNnLu52EWt+bRbtomCIx6Ryfjy7RnBRp9Y6adZT5llkEb+Kmb9VdUdjz7ZT30PZq6JVj5M5ixTmW5OSPsM6nfSCE3vcX0XnawYlNM2bG4UKF1DpyenNumzgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <78ea015d-b713-fc6d-900a-92a9543e762d@citrix.com>
Date: Tue, 21 Mar 2023 13:46:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>, =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg?=
 =?UTF-8?B?0KHQtdGA0LPQtdC5?= <valor@list.ru>, xen-devel@lists.xenproject.org
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
 <f2231607-b29c-b54b-874f-4e30ee84ae80@citrix.com>
 <5f14bdb8-86cb-9c42-e1a4-751625ead2e7@suse.com>
In-Reply-To: <5f14bdb8-86cb-9c42-e1a4-751625ead2e7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd8ed68-87ee-48f6-042a-08db2a12ac81
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6govDVRziTJe0HwZJvK4oLS/ztngAsT5/A4CenNjALU9sf3wBOezn3+ON0DGtjDdCWR+eZHPu92AU5KVDuWKRijZGra71psyZVx+wU7Oto73B2XK6IW2otlFzVHxyI2wQy8h3Y+7aTOTqv7Ft38RkqOIOCRNoPzljWB9ocKoXRaFSNr35N00VGsErKZHUNtakaLrOwY9DI9uHrX2MJNVERQmqk0aVIgHqAJXugNNzL5cZ40zMlHC38hLlBNgpQly92i4vZH4y8LvEmSfyyUJ1mnxXjgDTz/rje7UFDjx9H1kALFarKAq8KVJmgYemlue0VUPbbZOHgFImtQ4y/DT3rQnqgZiUJ/VqVuXtTPCQP5t5JL7g/03RQYiJCCU/SMtJsw4/jm3mX71chYl+4svdhKv/kJVwW9LZyB81LmCKCIUPpoL1yi3H5TdLQzdfF3k/OgG87AxZmIRKfzjhLxmGrpe6jlvyDdFFr7rrjT/2B1jFvq+irLZq1hXf4PZAtfwAaxz60rJWsv6JzTHdOwMXTf2+NhCnKr1xsRtQh8dsnvUnjoLgeM8kO8VDWN2HlLTL587tQWr8q1dYKpPf7jw+mP8bYcloCVmGmEh6859csQKRp9cd4xnylZtoylv5IFHOzD0HM92RX2XWNjGK17B43J2+sNeuxdQ8tRWCU/W54Z5k6Tz+EZ7xuszqkEOy5SNfTVf1oJZbTTCmorXUWnkFuboFodjZ3QYa4/lKrX6/yDahN6xJa76niGJI2Wj4mPt43AA+/XStSBEgRhnwnmFF18fUhIFnKPhMcttRcM3rhA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199018)(2616005)(6512007)(26005)(6506007)(53546011)(31686004)(6666004)(8676002)(6486002)(4326008)(6916009)(316002)(54906003)(66476007)(66946007)(478600001)(186003)(5660300002)(8936002)(7416002)(2906002)(82960400001)(41300700001)(38100700002)(66556008)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUc1REJLVUJDd2lLenNlcnpsUDBEckhQSUVOTjNndVhnRm9Kby9EWkFzM2NR?=
 =?utf-8?B?bTdMUTdRd2pGQUwzK3Rrc25GVURwNHM5TGtrY2V2R0FWN3AyRHZJWHlPR0Zy?=
 =?utf-8?B?VHVtVGF2dFFWdmtmLzk1SWl4TEpWcEdoS0dFdHV2OS9MTWRVRWMyeDVXeEY1?=
 =?utf-8?B?aFNWUXplc0pmelI5VWkrczhGdUpYelNoOTVsY0thaEdJRDJCWStsY2hOa1BZ?=
 =?utf-8?B?YnlKU2ZHMkNiSTRiV1JsQnhJYnRHN1QyNmFXWXY3amZyNStCc0ZDQVEwSjZy?=
 =?utf-8?B?WDRjenRFQjd5VEFTQzVsc0NxMlVidWFLaEZNWUdrN29BcjZtMDJVcktRdCto?=
 =?utf-8?B?NjBIN3hrUHFUVCtIbUgrZjMvQXd3YXBrMGdZSm5yRENpRElVb1dMamhVdDM4?=
 =?utf-8?B?TytGR0prMmlXakVXeVJBb2MyYmF1QWhNc2R2KzlReVRPY0V0YU9FTEpObjB3?=
 =?utf-8?B?ZjM5RG9LVVQraHBpMTNuNG80Y2JSQ053WWVnZWQ5QlVXaElnYVRoOGtNTE5U?=
 =?utf-8?B?NGlCcHcxWnZNYlJ4NlhQaTQ2WUlHSlJwVjdxV0Q3U1oyRjVZdnpiREdMbXFW?=
 =?utf-8?B?N1hVUDcrSDhjVGdWNnkxVHBySlJaRjdENkJ2Y2d0WXRhM3ZHYUxISnJSNU5M?=
 =?utf-8?B?OC83SnhKVzZVS2Y0RzRCajZBZ1VQY2M0MmxMSmlPNlhZQngzTlVzY2NySlps?=
 =?utf-8?B?dkFCRi9zbXhZb2FGUEVSMG83SW1DY25hVU1lemRPWlJZYWQ2WVBIM1krK2xn?=
 =?utf-8?B?WWI2Y1BlY3gzVzBIMjZpeUNwYmhpLy83a3VWNDN5VUswSmkwWCtWR0ozYXBo?=
 =?utf-8?B?QjQzMTAyQlNzZnQ5WUJZZGI1VFMwY3lhUWxwNk5YUzBLSnNIdE1EWFJkT1Zn?=
 =?utf-8?B?SnA0eEppQVZYNnRwQkFqODI2ckFqM0lkN0dKZ3VTbUZkTGIzajNHT1hyMU52?=
 =?utf-8?B?TGFWcGwxREVSNy9GRTE1V3YrUW9lOFl0VmQ5bWFWalIxakpsYzl2bEhxR3dj?=
 =?utf-8?B?alI1UHRNaUhFWXpqZU80Q3B3Yk1BQlJPaEgxellFZnZzR09wWFdVMEZrbUtP?=
 =?utf-8?B?NjVwY25vYXdRbUV6WFlyNW41a2V3cG5CaURtTi9od2xtc2Z2WjdCRzNWTHdt?=
 =?utf-8?B?QkRuOENEdStqbE5rd2QwTWprS0praW1SN2hlNnFZdnhFS3FuN2JSYit2M0tv?=
 =?utf-8?B?TjdhN0Q1VDBsK0luR3NoNUd3dmxGSFRUTVZyTVRTQzdYVU8vQlRnNE9XSDdz?=
 =?utf-8?B?N3hqNk9jTndEMjJVcmZucE1la2dUdWpGMXQxMWx1eWRCYi84bVJWM2cwcDhH?=
 =?utf-8?B?a29pL1JBNDRZWEx5Ynd3ZTJHek5yc2FvQkI4VHl3QW1vU2hYUnkwOG1CQkVB?=
 =?utf-8?B?OWVITEpzeWZ4RlhadXhuS1ptR2ZtRzlSWlhPMjBUK1hXQnlSL3hVa0hzL3o0?=
 =?utf-8?B?OFhGN0RzZWp5aTdVRkZrNG1XN0lnR1AvVUJLeDJ1NG5Eem9nclhWUitXSnFW?=
 =?utf-8?B?NWZCbVVtU3R1VFUxK0VKcHUwOExUWm1QSTRqc0Z2RmVYV05hbzNGMjZ2azJ2?=
 =?utf-8?B?ekcxRHo0aTZiMjBxUHoxZmM5b1lZOUxuK0w1WS9pNEpKV1ByRzdUTVpROGYy?=
 =?utf-8?B?S1pJMkM4Z0VDMEVGakdSN0N2M2pMZ1pZM2tjZ3dTclNlVlRPWW9jMWFoczBy?=
 =?utf-8?B?SDFaWS9XSFp3QzUzZ3lxOVFNeHptWnNmdUVQVGpQRStJQUZTSUxvaGswa1c0?=
 =?utf-8?B?anh3VER3QjNpOWd0NGM2R01BQVdma1l5M3Z6azFGUlhiak1tcWRIWS9YY29V?=
 =?utf-8?B?Wmd1SW5vbE1EMXp6R0NaUGJqWGVzMmNPT0lwOU1NNTU5ZVJTVkZ3eVFjaXdT?=
 =?utf-8?B?UjBaOFB1L2R4SVR1bzU2bGloVDg4eHhLN3BZWGwvMnh6UlB1YWNKcGdCMXRO?=
 =?utf-8?B?emFMZE9Ubmo4V3RjUW5XdEV1ZTlUbnVQR1pFcmZmYldMYnl2eVQzZ2VCV1Fu?=
 =?utf-8?B?Mk1Qd001ejVRd3hVYmVBbHE0b2tLUG1rSWQyd09VV09oR1FGNDQwZURKRjBt?=
 =?utf-8?B?MUJrMEhmcTFEeE52eHpOU2pWemp1YXJYT3JEdDdzc0htMzBnR2dJWHBkY2ZZ?=
 =?utf-8?B?MldNbDhvUk9FLzNHMGlUckkvbGdkQ0d4dDNwd2pjTzdFR3RDNnZTU2IxWlNj?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Q042d0VKQmdGY2tGekh2R2xGaWR6RUMrR2Fta0NCR0FiZFRzdTFOZjNZdzJh?=
 =?utf-8?B?dmhlTzhQK1duVlBFL3AvMzB1UnhVb3A5SGlwdkMrT0FrNk9IKzVVL3BuTjJk?=
 =?utf-8?B?TXFma2s5b1hQNlFkMDZKMi9DTlBEYnhHSWNBV3YvMEoxOEpMNG5WZ3FkdnJs?=
 =?utf-8?B?MGYrMzZsSzd2eU05MitYZHptMHlQU0VRNEp5MlYzam13SHA0NHNLRmpGdWdM?=
 =?utf-8?B?RVdsdWJPcXkreWxxNERtVWd3Tk9FbGI3T0xud3hrbldrQjJQRVp2UkhNWHpU?=
 =?utf-8?B?V2t5UnlFTnlDVGlDQzU1aHNwZUNJYThVZ2VhdWF2VkRvcjR3RG5QcVBZSU41?=
 =?utf-8?B?QU02clBRaUQ1SnovakEwcTliMnY3bDA1QitHWTBheFNoSU1tdlQwQ3dURG9N?=
 =?utf-8?B?amN1OUhORDNOSzFoN01zUVZWdXBtVTZwU3duSHBhT0Evam1qSjNVSDB1SXRx?=
 =?utf-8?B?eFpueHpDeEVVUXh6anZ0TXZSUEVWbzhkMnlnSDFWWG1BMWs0WHN5VUJ3RXRD?=
 =?utf-8?B?dGo3TWxOTjZnaEZaeTFVSUZRc1YveHBiWTM4Wk5SZGNUNVd3ZW8vRmhWeFln?=
 =?utf-8?B?KzhSc1pFRDFDQnNyVENnaVpQMlRQT1BPTVJkVFNmUVluek4yd0NsUU90UDQr?=
 =?utf-8?B?Zll4Sm9FSHRERFhIMm92OE9wcDdQdlFWSkNOR3lzWmIxOC92N3J6d1RCV3dl?=
 =?utf-8?B?TStwdGhBcytyUnY5cDJOOTE3TEZqQitwU1NUdk80OE15clZJaUF0RXJOZTR0?=
 =?utf-8?B?THNXR3pnS095NUJhR0g5alR4d2tsT0h0R0EwdEhqOUFVMDFOdzkrTExGeC95?=
 =?utf-8?B?T2EzL0EwRW5QSWpqZm9vLzBONGJHRWpBZDIxYkFTZm0vS2l4TjVkSjBSOVlF?=
 =?utf-8?B?M3dtUkhZMFdMcjUxTDRYRUhaR0JnUWpVSkRpRkNhUTlxQjh2YkZJTmJPemFh?=
 =?utf-8?B?Tno3UWhKR2I0TzNyUGlVQ3R1d2UzK052UDN3WDBVYnJrN3VuMzdMaGxSaFpO?=
 =?utf-8?B?OHhkMkFNK2JBazZyV01EV2dSbFUza1poVzlIL3JUR3hGbSt4aEpMbDN4TC84?=
 =?utf-8?B?U1dXb2toRSsrWkkvSmtkR24vSXFzaktEWnBBNmd6OEU5elJzOWc4WHRFczg4?=
 =?utf-8?B?UGRLTGovL3MzcGNkRnJPSVJvMjFYK1EzL1V3ZFYyeG9NOFRSN0NlYTUrWGVI?=
 =?utf-8?B?UXp6Q0Q0MEJRb29wTWRoQlcwUmZwUDdOOW94Y2xWUWFMUzNyRUhhRjkvTjdv?=
 =?utf-8?Q?Xe/oxvEfpaqGQq7?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd8ed68-87ee-48f6-042a-08db2a12ac81
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 13:46:29.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYPvKoOnARjfHcbPXpJUsxrwVzR+LFlqOdytOUhqvkXWX+e5J2u+HUa/dQ1NikUAzwHL453WN7CMQ2fZmS2cCLH9HM4T9jobKjOL/A/MGyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6106

On 21/03/2023 7:28 am, Jan Beulich wrote:
> On 20.03.2023 20:07, Andrew Cooper wrote:
>> On 20/03/2023 4:32 pm, Ковалёв Сергей wrote:
>>> gva_to_gfn command used for fast address translation in LibVMI project.
>>> With such a command it is possible to perform address translation in
>>> single call instead of series of queries to get every page table.
>>>
>>> Thanks to Dmitry Isaykin for involvement.
>>>
>>> Signed-off-by: Sergey Kovalev <valor@list.ru>
>> I fully appreciate why you want this hypercall, and I've said several
>> times that libvmi wants something better than it has, but...
> But is a domctl really the right vehicle? While not strictly intended for
> device models, a dm-op would seem more suitable to me. Considering you
> already brought altp2m into play, it could also be a sub-op of HVMOP_altp2m.

It definitely feels wrong to be using an altp2m op if you're not using
altp2m, and there introspection usecases that don't use altp2m.

dm-op would be the place to put this, if I wasn't pretty sure it would
be modified over time.

As I say - I can see why this might be useful, but pagewalking is more
complicated than the interface presented here.

~Andrew

