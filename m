Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BAA51DA67
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 16:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323288.544866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmynR-0005nR-9P; Fri, 06 May 2022 14:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323288.544866; Fri, 06 May 2022 14:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmynR-0005kI-66; Fri, 06 May 2022 14:19:05 +0000
Received: by outflank-mailman (input) for mailman id 323288;
 Fri, 06 May 2022 14:19:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmAY=VO=citrix.com=prvs=11886748f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nmynQ-0005kC-6F
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 14:19:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 796b38a5-cd47-11ec-a406-831a346695d4;
 Fri, 06 May 2022 16:19:02 +0200 (CEST)
Received: from mail-dm3nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2022 10:18:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CY1PR03MB2298.namprd03.prod.outlook.com (2a01:111:e400:c614::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 14:18:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 14:18:57 +0000
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
X-Inumbo-ID: 796b38a5-cd47-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651846742;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ofbIHtgfD8zcGkZSLBLC5Lb0bdRVTgcAqOpyEDvh4Qs=;
  b=GpO5qmVsBRWNWw8YlDexNBsSOLrUVTAxdTyUU9/oNxAEJoXZk5zmGpEF
   7F86Tqpv9WKK6U26O+s6jChZT3aPJyedPzoKfEb5fZMC8iTTHCeVBejYp
   2oRrI21NfcWA5DhJ84rAX1xZanAxSGRuMEiRNp4CGzKCysp3wm4/ewk9x
   c=;
X-IronPort-RemoteIP: 104.47.56.47
X-IronPort-MID: 70616882
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:txxSGal3nW8gOxQJJjAtd8ro5gyZJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYC2CCO/fYYmH3fNoiYIvg/RlXupWAzYQwTQFqpCAxRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkW13V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSQgyP/PUg8QmC0NGMi1BOfV+5LvJGC3q2SCT5xWun3rE5dxLVBtzEahDv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXu5kEg1/chegXdRraT
 +MfZSBic1LrZBpXN01MIJk/gP2plj/0dDgwRFe9+vJpujaDnFYZPL7FP+DXS/uFdfhsv1elq
 zLX2kjjLR4AO4nKodaC2jf27gPVpgv5Uo8PELyz9tZxnUaegGcUDXU+V0a/oPS/ol6zXZRYM
 UN80jE1saE4+UivT9/8dx61uniJulgbQdU4O/I+wBGAzOzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoOYHQCRA5dvN37+tlv0VTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:p0A9UaMegNSPL8BcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZlFkIP0jgYVq3MUiFYJuYeU9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.91,203,1647316800"; 
   d="scan'208";a="70616882"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTjVAsQ74QbgA4kAIRpannDgUNOUNlILfsmMNX+IeSZ+cjUEcfIKIVER/uXEnlrxmhkvk9RANQ3o67m1ZBzM3SPizFAlcAyaBDWKpHkDVs+mr0peAvUM9/KkcMcbadXJNhvfOc2YvqV2P6Ebx+LCEbhwDXyYisHzTyEHDkPtYxHYVOhUpelDY0Tpo+0PXI6YPhmU74FwmEIcGkMQQXffQSslBC8XDJBK1kFYXmZoaW8rYTP8l5WZ9MEbc8S3mf1GsivWZXtZwtGebukiPwcrUDtQnCo4kX3AeuFxeIUjcG1THTCkClrfgZdaFOssHJo0ECwpwDs5bJ9Mw4jgaJ+omA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofbIHtgfD8zcGkZSLBLC5Lb0bdRVTgcAqOpyEDvh4Qs=;
 b=hZMcpAqVWPr2WXGgTOgjdVHEquw70NdhpYQghJ+u/Md3miT5NYioHMXpg7gElyPJEBb2EzPzi+8X3EWztL7q90kyXwr90KZ4m5Y81s2iamy78ptEY7mOBZtbSI7QJTr18vpW1i8nqxJWH+VdhKxZKdXrn+NCw5JY+TsZbbXB27zThFriYc8ygkTQOqRKORclWw+j//rQ9y5Rlyz01a2ldsCQQhNiaFlMlrsU3bSNN86j+SJlCFDwMZKKk4AWF3kqE1ffn7IMx+xJ3nt1nDbVjPPR2tna/oYgrTa2UPivufzqKviMw9f9Cv77x5E0W4YzGk+g1YLYMYe7LuICmZ9tiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofbIHtgfD8zcGkZSLBLC5Lb0bdRVTgcAqOpyEDvh4Qs=;
 b=wsS5gdHhYqfJw5VDHcdSldDeVDkHGb5K789f2lUmfttOtdIEpiHuYoqjxqjuzmCvbB5H2Qyt2tauvwKT2vG1ll9Krx3IKXRmyDp2outFU/7J524hZHYXHVOWmafwv1naYwu+CSDZ1SMHc3+Aetbw6c421/XS4CP4bqxEF80fKA8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] build: suppress future GNU ld warning about RWX load
 segments
Thread-Topic: [PATCH 1/2] build: suppress future GNU ld warning about RWX load
 segments
Thread-Index: AQHYYU55+oh7RWMLI0OTKLhiZzDiLK0R29oAgAAA1wCAAAkkgA==
Date: Fri, 6 May 2022 14:18:57 +0000
Message-ID: <15d44a31-853a-5f61-2632-6e3faa7083d0@citrix.com>
References: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
 <15350fcc-86ad-d42a-27a9-c0cbab091559@suse.com>
 <93722fdc-550b-bc08-3115-e92a299973a3@xen.org>
 <b0208cc5-55c0-003b-1b1f-ead2349ac9e7@suse.com>
In-Reply-To: <b0208cc5-55c0-003b-1b1f-ead2349ac9e7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eca4a1c1-dea6-44c9-91cf-08da2f6b5c06
x-ms-traffictypediagnostic: CY1PR03MB2298:EE_
x-microsoft-antispam-prvs:
 <CY1PR03MB2298B644F39520A84B2A81A5BAC59@CY1PR03MB2298.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IDR4HVBgvmTG5riGUMJU33xS29SfFEExtA4SeGMHaxjOTcuIvV2kWT2NhHIk2KqD7q9hIBazCLSaa6uzTCMQZlrDF93yv69qNtJJSpitAIwuXZXdOGpgJtO3Sdd+MssVA+O5kRmRQDML+Yhw5GfdOl217O6TKN5fbyIDlUQGnH4YB+J5azfZS2Kyh9ZNHgY9Ff96WSMiY1wQq3DE5TvHdonyXDX7QeJlJa+E3FsKe3tOEXxEx+4eSthJTBnys9T50uInikgKw6y6i2EDZJr/Ycj4w1ildeH0VnXieH4KIj1ig2bczXtdh/vATpGwojR+82YoosG3MhPcjq3i+zFQ+p67SmthyI8Y/UdoX6eyO+iibYUmSz67msxAGcnMNvyv4R4kcD3MbuWX26dYB3zTbW6RjxF5049YQhOVtX+lqNWGW9DDZHeuMG0/Va7gpAikt7AH/yL0DOcaj4YCEAWNPiahz6wpBMbNBXdeGEgtwJ3e4vvnRKL0yFkIc6bZYd7U5SEE0z/dd1uHJSmGN8hI9ZhpOAGQEuAMLO+N4u4h1OlDYDrJPgqyzrT6fXMmXmh7x6yb8UrmuuykuG6XyPeH/WZ2ctKHpOBoHIIw5DHlejqcFpwJ7Dm1317jRAx9ytp3PuvsO29TymaDI4AWrZhTJyY8+EiXrep0ldQGd8sp/PPspmkjPBHXEwWHsXRbApYqQdmYEzt1ByJLkS70keC692i6dX5Vo1ot2uswwIEKA1twNBW85vRV9hs7eyx0meSlckd2sUkVJxHTzqxcm0ybbA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(54906003)(5660300002)(6486002)(508600001)(4744005)(2616005)(26005)(31686004)(6506007)(82960400001)(186003)(36756003)(316002)(6512007)(110136005)(83380400001)(86362001)(31696002)(122000001)(38100700002)(38070700005)(71200400001)(66946007)(66556008)(76116006)(64756008)(66476007)(4326008)(2906002)(8676002)(53546011)(91956017)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGp0aC9Od2RrUmhwRW81N3Vyd2pZRGJwcy9sMFpQcFNWdG1ZTzZuOG4yMWYy?=
 =?utf-8?B?c1ZSNXA3UmVNM2dwcEk1WUVqd05ZVktITVVNUG1maWFQTWxhd0JjOE54VFp5?=
 =?utf-8?B?RzdVWm1JU3lkYTArSEtIOERLZHJXTkNPbVZQRlFSOEErTWphQjNZdGVkUUZR?=
 =?utf-8?B?VkxWMThnVDg2ZnI5VFJ0WTcrak8xN1JSaytkSXhDbHpwYmFPQzZtcFVOZmpn?=
 =?utf-8?B?RGdxTFgveW5ydHg1a1JzM2NRcVVyYTlJYmZkSkpMNExkNnR4akJMcDYvUVYy?=
 =?utf-8?B?USs2cGhlOTRLMVRSM0ZaZEh4bk84Q3FtckEvU2IzcVAwV0xwK1JrRE9rY0lm?=
 =?utf-8?B?M1dUNFd1WWppcHErd2M1VG43dnBndlEzV01aZDkzaWVWYlJNdDRaVG9LWjgy?=
 =?utf-8?B?cVhyemlobWFrZlRZK1RLcFRPb2wxVWx6dTlKOFl0RDNOYlM2NHRpWGZjMDZY?=
 =?utf-8?B?S3dXdmYydnp1N0ZOVG1yaVlFUTVISVRTNklibFNST1B5OStmaEp6QVBnU1lj?=
 =?utf-8?B?M2lWM2FvZjZDQUFoa0xYbXpvVWJQL1NUcHBYWjZ1OG5vcHdvRnlLeUpHMzlv?=
 =?utf-8?B?TnFINGJjejFubmc1MHVjNC9nT3M1d3JtWlBDTlltVGlEUi9qMlNIOEo2R0dt?=
 =?utf-8?B?bHFkc21yWFhmSVJOc2xaaHZLQ0Z4S1ZiUDJMY2w4aXhlczdHaTIrQmpZTU9F?=
 =?utf-8?B?TUpUV3NxR240UHBQc1prb0pQLzE2dFNOVmZUWVgrTmhjWXo2b2crcmdvZEFp?=
 =?utf-8?B?RkZ2QWFiYW9BSmhQTnpWbGZvSUxjQkJKcW01WHFURU1hL044czZqdW1xRE1W?=
 =?utf-8?B?MVo3Vm5UZmZEQmJmVkRFNUkwbFRpSnF3UW5iTjhFUnQ5OTJFVzdwVFFDd3Ni?=
 =?utf-8?B?SStHZkY2YnpVU2lyOTJTeHlCcU9nYjUxdWh3MUZLcFd0aU01TTMvcWFSYTNJ?=
 =?utf-8?B?aXljTkJKWUQxN2hRajk4VDNLTVlJMmxIZVRZb0FBc3gybWl4UTdHNnBDd2pX?=
 =?utf-8?B?TjE3SERsMC9NdnZ2eExBYnpIVytBRHdhLzNlY1g5VVYyQTZpcXkxMGlWWHRE?=
 =?utf-8?B?aGROMzlFd3Y3ZEJDbXZyaXJPKzF1a3pQY1RaUGR1Rkdsem1kMkhlZXpJYUZz?=
 =?utf-8?B?VXlQQWkwVEVZZ052aCtQSUkrWEFTZURYMk0rT1BuK2tUSXFvWFM4ekFqTUI5?=
 =?utf-8?B?cjh2M1RoWHloR0Zua3BQbTZOdlZwUWhEN3FFb25hbFZIb3A3a2l5MjYwVXN5?=
 =?utf-8?B?SUZRVzNaYkluNFNXREV2TG1pU0xTQk42K0ExZjMrUEtRbTJKM1hUTEZFV2I3?=
 =?utf-8?B?WWJLYTY5UytoaFlrZHlpQlpFeDJTZHRYOWpsN3lIN0NPeGJOWC9nM1VoZE90?=
 =?utf-8?B?Ly8vMEwwbHVUOUM1LzB3Y2pzaUNtcWFjQnlNQTJuZjR4alN4RU1XczBtUnFh?=
 =?utf-8?B?RndUQ1YrWVRXUndvbzBlZTRISlNaak5IbUovWDJZWktEaE9HZ0Y0WjFnVmg3?=
 =?utf-8?B?bENYNU1BSXFVR1paYUtFaWhObGtKWkhXZmJSWGNUV29xK2czUHdIMk1tVE9s?=
 =?utf-8?B?OUJ1bDlnUldCbW8vMlBiejRhc1J0VVhpQVY0dnNWZXB5ZVcwYWI1Y2UrNGJk?=
 =?utf-8?B?SFlhQk02NFJqNFcxRDd6TFplTW5EenFZdXQ5aFpKZjU1cHBJM1N3Z011TnBy?=
 =?utf-8?B?eisrOEJiNCs3Zy8wbTRSY0Y2TTlNcGYxRjlkM1FKdmtQbHZRLzVlMjNHN3dp?=
 =?utf-8?B?ZzJGbWFDcWcrREVpc0ZmT28rV0VqV0QyRkozQUFLMVJ6SjBPRXNXSUFlcWhR?=
 =?utf-8?B?T2ljcjZ0YmkxSGlHNVdIZE4xMGUwTnpneGh5WjhLNWdHSHJDTjNublZCNHJH?=
 =?utf-8?B?ejBnMkIyMGJRaEdPQ0RxZCtnSklWV0o5K3E5cXJldkNLVy9CRkpCWnZ4c1NJ?=
 =?utf-8?B?RU1EbFltaDdiV1R3aFJNYWZ4b0FRRVJvRUxNRXZ4a2NhanlNekRTMW1rbjdz?=
 =?utf-8?B?ekgzRzVPM1k4MHhaTGFoejNMMGhhQzd3SGtjZW15UEl4RTh1dE5JbWkyN3Q3?=
 =?utf-8?B?N2xXSDA2NCtHeDdPanNNOVFWeElXUWdVcStIdmVGTFZBRzRFa3lKQnY1Umsx?=
 =?utf-8?B?Nmd0VzZQUjM3T3RGNkx0MXBiWTRiTnVvc2NSb3dCSHBKbTNvYUV4MjJZV3hU?=
 =?utf-8?B?Z2ZvR09DbWgwYTZzdE15ZG1USkl5eWQ0aFRxSU5uSDl6ZVIzMmhoY0RlYm5o?=
 =?utf-8?B?QXBhcy85bWZhVFRFK1BGMXFuK3cwOVRkOENjR0plU1RYcUtTS1Y5c28vZWlS?=
 =?utf-8?B?UTZRVjVFRkRkSE1wT0tJWWNrNDF5NllQcmMveEN3Nm5hOWhkd2V0N0R4UmtZ?=
 =?utf-8?Q?JQBKV4u83Yi5I1LQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A492C47F225C124D93E8D9DDA4DE88D9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca4a1c1-dea6-44c9-91cf-08da2f6b5c06
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 14:18:57.8130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: all6+EAaUEAQ2emS8U1wXTdqk5zZ4WpwqfBYb5L0e55G9/FqK+sekorZsBwHG1nXnoBRgodHJfChLRdPDtZ7iOVY2bgAZYCGNutosYRjrLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2298

T24gMDYvMDUvMjAyMiAxNDo0NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA2LjA1LjIwMjIg
MTU6NDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IFlvdSBzYXkgZnV0dXJlLCBoYXMgdGhpcyBv
cHRpb24gYmVlbiBtZXJnZWQgb3Igc3RpbGwgaW4gZGlzY3Vzc2lvbiBvbiANCj4+IHRoZSBNTD8N
Cj4gImZ1dHVyZSIgYXMgaW4gIm5vIHJlbGVhc2VkIHZlcnNpb24geWV0Ii4gVGhlIGNoYW5nZSBp
cyBwcmVzZW50IG9uIHRoZQ0KPiBiaW51dGlscyBtYXN0ZXIgYnJhbmNoLg0KDQpJbiB3aGljaCBj
YXNlLCBJJ2QgcmVjb21tZW5kIHNheWluZyAiYnVpbGQ6IHN1cHByZXNzIEdOVSBsZCB3YXJuaW5n
DQphYm91dCBSV1ggbG9hZCBzZWdtZW50cyIgaW4gdGhlIHN1YmplY3QsIGFuZCBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UNCnNheWluZyAid2FybmluZyBwcmVzZW50IGluIG1hc3RlciwgYW50aWNpcGF0
ZWQgdG8gYmUgaW5jbHVkZWQgaW4gcmVsZWFzZQ0KMi4kd2hhdGV2ZXIiLg0KDQpUaGF0LCBjb21i
aW5lZCB3aXRoIHRoZSBkYXRlLCBpcyBlbm91Z2ggaW5mb3JtYXRpb24gZm9yIHBlb3BsZSB0byB0
cmFjaw0KdGhpbmdzIGRvd24gZXZlbiBpZiB1cHN0cmVhbSBiaW51dGlscyBjaGFuZ2UgdGhlaXIg
dmVyc2lvbmluZyBzY2hlbWUuDQoNCn5BbmRyZXcNCg==

