Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5B3FD86B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 13:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176300.320811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLO3W-0000Ua-Tb; Wed, 01 Sep 2021 11:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176300.320811; Wed, 01 Sep 2021 11:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLO3W-0000Sk-Q7; Wed, 01 Sep 2021 11:05:22 +0000
Received: by outflank-mailman (input) for mailman id 176300;
 Wed, 01 Sep 2021 11:05:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1ICC=NX=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mLO3V-0000Se-2E
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 11:05:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.59]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d43c135-0b14-11ec-adc6-12813bfff9fa;
 Wed, 01 Sep 2021 11:05:19 +0000 (UTC)
Received: from AM5P194CA0016.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::26)
 by PAXPR08MB6365.eurprd08.prod.outlook.com (2603:10a6:102:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Wed, 1 Sep
 2021 11:05:17 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::e) by AM5P194CA0016.outlook.office365.com
 (2603:10a6:203:8f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Wed, 1 Sep 2021 11:05:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 1 Sep 2021 11:05:16 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Wed, 01 Sep 2021 11:05:16 +0000
Received: from a6d1ef8b4f9a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B27C819D-887B-4E18-942E-769D873BED20.1; 
 Wed, 01 Sep 2021 11:05:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6d1ef8b4f9a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Sep 2021 11:05:10 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6507.eurprd08.prod.outlook.com (2603:10a6:10:25a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Wed, 1 Sep
 2021 11:04:54 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:04:54 +0000
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
X-Inumbo-ID: 7d43c135-0b14-11ec-adc6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taURv7rLin99uMRFD4DUiQt0w7d5GpQcs6q42zdEV4c=;
 b=dOe2ZzxLd7Fnf0BEO/ImzgRIN1Zhfc44eJvv0Tye8Sbt7Bg+yB2rJP/BJRPZtzTv0vw0YTrrYQWiu/qM8mOgQsqONRO3utuJS0r/8yS1gtLq3twqOC0A+1UX4mO52nu66UIqFGUzg2Z+Hq4sdGuI0O2JMkmtMu//mS+v9srcWaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3sUvAp3Y+T5ffH83q2K15+0jiHu8+Lf3BBw09sqYAdgCbVE1c7oRxQRB0OnmS0YxDbvd1IAfgPgXxHO6NuXvjSuKvm3f/54RdHnJzwoHA2I+6bx4J2Rra20wL+0V7iUCo2hgidioN0M+pPVEGXqdcgWPtdp2wVWo2hZy/3+AYTG5rEQvgwjLaOZ7SYwjlxVSRvPpR3HHMoUGdFaCqu24lXegqTMNWXDHYfcWovaeuHLcjddvVSiDhBCa7DvCMtvglqIwSQxRIuP/nCta/bH4ogvgS3HJeEizVEYyBfs0xnQhmVqM1pN7HBDWBQJwjWktp9l0Xe06QwUbU8XEJ7Q/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taURv7rLin99uMRFD4DUiQt0w7d5GpQcs6q42zdEV4c=;
 b=cZyJ6HksLM2uPO40guGsveb9qwgNeB05QeoWkSs2wG0y/U7f4LFFVJjzRc1al0P4lUwtnaXkaEAL2gwi0iz7X9LfmL9urQKoYJLxFVGODRIKfGiamegemftnWP3EphdJNREuVLJWB2pmr7nf9QNRHtB/n0dQvHvG/Q8ryzAWrqwAj3xyYwnsyHCAEqe+fzxoOToJGBDxLRnyTkWErasbNcD3MLQHGl8wcn3LWr222Ew8ONqbBvRHxGd0njGk9bWEXvumIM7hO5e/ETVztaQh00JbswfIBX2QJjqOp7CyCEOuvKWHSnc+c4XwF12Uxuoz+hszSWWzOUx4lbkCA2MiEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taURv7rLin99uMRFD4DUiQt0w7d5GpQcs6q42zdEV4c=;
 b=dOe2ZzxLd7Fnf0BEO/ImzgRIN1Zhfc44eJvv0Tye8Sbt7Bg+yB2rJP/BJRPZtzTv0vw0YTrrYQWiu/qM8mOgQsqONRO3utuJS0r/8yS1gtLq3twqOC0A+1UX4mO52nu66UIqFGUzg2Z+Hq4sdGuI0O2JMkmtMu//mS+v9srcWaI=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Topic: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse
 device tree NUMA distance map
Thread-Index: AQHXjps+iLbrOQu8n06b5z+EtCRt06uM5puAgABnI4CAAPWOAIAA3gOA
Date: Wed, 1 Sep 2021 11:04:53 +0000
Message-ID:
 <DB9PR08MB6857F9954D269AE5EC45093B9ECD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-25-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301740500.17851@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685715E39333597911BAB6FD9ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2108311428040.18862@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108311428040.18862@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C3D79CBE99666740BDBA0FEEF858F8C1.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 96c79db5-a1c1-4b46-aa1f-08d96d386131
x-ms-traffictypediagnostic: DB9PR08MB6507:|PAXPR08MB6365:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6365CD6324D3933E3A4090429ECD9@PAXPR08MB6365.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OQhFkHAc/Vg6Pu292zrG1qOYz4jj8UnazzNez37Mwv7mV7ufB8Y2F7m1ZU51UsBKzzaWEiSTFp/Inufd8XpV11sBiUSoRjWR2998cn4P3hXlRbpH66bkPDMyc3jqQcp7WwW+BTyEjZJJiLYcrGi8Lb8wNdNGxEgPRsR/eDLtWScpcDK9x7Hx3UHkMO7fa6d5OnpKrOtBj4gjjNXcwcaRS2E38IvUAq+m6Zplpg94r1Isc7iMbhcTVfwHXeS+bQbgawvcY+DGEA5CixQgz5mp0IoZRM9C2EvMVBuQ4z74vY91iT5eu+tmGKYumQJlLgH11mBWv9kJVtrdZ2LV3hzxsxXo9+G6CZZpeUWYCXVHOZzuruDVi7cdHH4ZZfR8S6T1VxkHh3WuaqGhygP1Fvhee6IUz/SOBWJ6OkOpzTQAHv1wryD/Md0AA2jQ8fNygam++xC+cZAhaqzNpD5o81XIWEt+p6G/cYANV8pj8XBFJ7Znxp4CyY+gHuTLx8lI9s4BqaQBHKPWKX3se0pFO+vcf1g2kNib4frxA98V8KGgtrhTF/L38j8XFikQeDIQqODPMghrnJKa3gDUdea8Zd2pHx5v2PskjW92LapkH64d/s1aH37EakC2seioICHUzTKZLnkIYU2y4VWSTEQdFthGSFmpdgukLtrS+A8YVUw2wemJhex9okHZR/HAEREJekaoSkRrLEWmOx/OiMiffWDs2g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(186003)(53546011)(66946007)(76116006)(55016002)(6506007)(7696005)(64756008)(52536014)(66446008)(66556008)(6916009)(8676002)(66476007)(478600001)(9686003)(4326008)(83380400001)(26005)(38070700005)(8936002)(33656002)(316002)(71200400001)(2906002)(122000001)(86362001)(38100700002)(5660300002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0lteWo5c3pMdUQ4RlppK2kza0RENjNML1piR21Mc0VPdzhFaFU5Y2ZYb0lr?=
 =?utf-8?B?Y1FMUWROTmN2T24rcElQaTZKL0tieVpnMEFqUmpSODZ1NFQ2K3NWMEloMU13?=
 =?utf-8?B?TTBiTHNoeVJtY0MzRW9MN0VuaGpVZmw1UXZrZGx5bm5talc2ZmdwNDh1Zjl0?=
 =?utf-8?B?bXU3czFteEZBMmdhU0QzbDdKV1cwMmVLYkZWVGIxRDhvSituRHlsU250L0ZK?=
 =?utf-8?B?VGtyRFlUZmJzVHZOQ0UrUTIxMUZqUjFOMTBQV0REL3ZJZWFNeGtabGEydGdM?=
 =?utf-8?B?NG83Y21LQitMSUxpc3NrM1V6V2duekNpc3RMc0J0MmMxZDdDRU92R3phY2JL?=
 =?utf-8?B?SDM0YVNHanQzM0ZTa2JJalhOYUhnc21KSy96ZFhCR2NMb2ZDZHZBbTR0RlQ0?=
 =?utf-8?B?dkx4WjR6QkJmL25aK3NkajBtWUpsc1orbmthbnRZQXY3ZkNtNVVmZ3FhWVlR?=
 =?utf-8?B?d1FKaUk3a20wR2RIaUoybERqNlJyZmE2K1dnOHVYTTdsV21nU1lHTFdsUmUv?=
 =?utf-8?B?NXI0WCt6a011bXpKNU5rWGk3eWV0ZldsbXR5NlZ6ZU5OQkcwY3BINU9VRGtP?=
 =?utf-8?B?R3VXV1I3R0RLMHlkaFRUQUdnUVRtNjJQUHZYNkR5Sjh2bUNBaHBJU3lRYmdG?=
 =?utf-8?B?My8za09DZVZFV2VHWHgvVXdBSTdtY3J3SE03RHc3dVFKa3ozV3VKdXNtS1lE?=
 =?utf-8?B?VlRsM3ZKUU5NOGlyK0RLRDlrVFczUDRNcTM0L1YyRmxYQzdqaFMwRzA5UUdy?=
 =?utf-8?B?MzVRVURnVlhSdnMzcXZNVURnYlZUZUE1NTRlNExucnpha3dkWEdPSGlwd3Ns?=
 =?utf-8?B?TEVKSC9vbmcrL1MyN1ovdmx6RzYzYWdmdGZPanBLZVpXYkhZMXlFaHlvQ3hF?=
 =?utf-8?B?clNNMytwWDZmVHNUTm1wRlNjTUY1Nnc1SXRQaEVqNlB2aGlkNE96WmxYSTNS?=
 =?utf-8?B?bnhpR0d0TGMzUzl5MW1UOHpoNnZ6U2hxakFkOXFXajJyQWN6bkoxejlpbnlC?=
 =?utf-8?B?U3NMTldoNG5jU0FrdWlIT2s5T0doSUlVK1pEdUpXVFloNUlSMGZoYnJJay83?=
 =?utf-8?B?ZmRlVzhRMkFNamRjejMwaGdiVG1lK2NkSVQ2TlFFaWg4VnZUbFVDOCtWeDBE?=
 =?utf-8?B?UVAxdUZFb0F5d2VJOSt0bnl0OWF2dDRHRzNmdkFMZjBMbnFEVTVRKzdFdE9x?=
 =?utf-8?B?dkQrL25STFczcHAxMVBLQlYyd3pHWjZqUlRWbVUvcDgwUFExSkJKZ1RMdzBa?=
 =?utf-8?B?YjQ3OWZpTDczVFEwNmtacmphUHdMazJnNjhQYWh1bkE3UFMyV3NGb1V6LzZi?=
 =?utf-8?B?c3dRMFc5a1lCTUtZcktTUUQyTmlSaUZ0Qnlqb1hQWVdLOXl6SlU2S1RSRHBY?=
 =?utf-8?B?b3hoQ3p4R0d4cENDNnFVQ2NyRUpZTHlBM2duRW9YdXcvWWk1VXFiN3JLVDdK?=
 =?utf-8?B?cVV0dTVGSjNWejk1VDExSEVPV1p0RU84dXFjR2RGcGx5VG80U3lWcGZOMzFS?=
 =?utf-8?B?YmpGelhBeHJldHRzMStpYzF2UkhISHVJSm1HcW5CUmRrcDQ4eVNVbUtTWUU1?=
 =?utf-8?B?S0Jpd0dtTE1wbWF2RFkwa3BnMndQQU95WlAvNmprMHRybkdDT0ZJcEFka0Zp?=
 =?utf-8?B?SkV4djZRQVdlNFQ1U1BFamtGanZXbWxFR0pUV28veXVOc0dqOThlNWh4UTZz?=
 =?utf-8?B?cTNFL0xGTFZkMlc1ankxdW1xUFpPN1ZVOWRVU2RZNjlDYmhlSGFVUHFCMjU5?=
 =?utf-8?Q?59IMbKIbpR5+Cxou3R/O68xRyYuUo/dN9BaQYrh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6507
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f0d553c-e065-4eea-5992-08d96d3853d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JwArvXzP4kESMjXKXPw+MBfSiUEhjyMlWVR9wZtDAReobnoTMP71bp3aBYiHkF/Xwq1LUOe6U6ZAwrZMT3S9SEhILo4WNhGQCjlSALCSVOT8uvhSzjncoK/glw6s209EkOJO6jku3ahbZJ/2KIqnQzykIRchoUBaBsJWSoHMGeplXYsBRwFgILEkDQuNXH8wCnsGmzrq1suuTTd9hp4lZ2XJRjV/6Tdr0oCaH6vU6rwknmmlZsU4ZBRNYqC0d+RzaF4RKATlpNF0M5a6TkM4bzYXi+U6G5g5jDsHlkpnnGbU8YQJ9OYBuIQJ1FG4XBv0OANHZ1zuqhMFrMa588lZrCW2lm2Gbmtpun4wzhtLJMqAS/3JMC7w3EIVotPX371Tl07/1RgwllWSvx0/xExsyyaASAGDIFyzPZdc6egDtsiWGNLz9HkpKHdPEz5UdHsexZOdEv5m1rKFiB0CsBTNF7On9IJ85bsTMjcB4EY/12WxwI64qRcvgd93Defcp7odW97P4iK0W4sQpbL7dtTy0PS9Oxu3yxl/OAcM9okbfHdPVYuDdGd2BUmotAuk1+A7Z7C9vtbF5Fc5ODJYgBAfK4h87WoedNTgL34dNFBtXBkZPo1QzrQOg05KZ2a8Cv+ttxdcQ6KUPL/1XRz9Cji1BNog/gR4p15T/QN6Gtf3uldzkjGp4zQqCZ1FAyoLYcZmXNvvaP8ynUwdBRdbRYJ+pQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(53546011)(47076005)(8676002)(316002)(86362001)(7696005)(2906002)(5660300002)(356005)(70586007)(70206006)(83380400001)(81166007)(82310400003)(9686003)(508600001)(6506007)(8936002)(33656002)(4326008)(36860700001)(26005)(55016002)(52536014)(6862004)(186003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:05:16.5177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c79db5-a1c1-4b46-aa1f-08d96d386131
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6365

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4t
ZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYg
T2YNCj4gU3RlZmFubyBTdGFiZWxsaW5pDQo+IFNlbnQ6IDIwMjHlubQ55pyIMeaXpSA1OjM2DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJx
dWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJFOiBbWEVOIFJGQyBQQVRDSCAyNC80MF0geGVuL2Fy
bTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlDQo+IGRldmljZSB0cmVlIE5VTUEgZGlzdGFu
Y2UgbWFwDQo+IA0KPiBPbiBUdWUsIDMxIEF1ZyAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBI
aSBTdGVmYW5vLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4g
RnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+ID4g
U2VudDogMjAyMeW5tDjmnIgzMeaXpSA4OjQ4DQo+ID4gPiBUbzogV2VpIENoZW4gPFdlaS5DaGVu
QGFybS5jb20+DQo+ID4gPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3Rh
YmVsbGluaUBrZXJuZWwub3JnOw0KPiBqdWxpZW5AeGVuLm9yZzsNCj4gPiA+IGpiZXVsaWNoQHN1
c2UuY29tOyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+ID4g
PiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjQvNDBdIHhlbi9hcm06IGludHJvZHVjZSBh
IGhlbHBlciB0bw0KPiBwYXJzZQ0KPiA+ID4gZGV2aWNlIHRyZWUgTlVNQSBkaXN0YW5jZSBtYXAN
Cj4gPiA+DQo+ID4gPiBPbiBXZWQsIDExIEF1ZyAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+
ID4gQSBOVU1BIGF3YXJlIGRldmljZSB0cmVlIHdpbGwgcHJvdmlkZSBhICJkaXN0YW5jZS1tYXAi
IG5vZGUgdG8NCj4gPiA+ID4gZGVzY3JpYmUgZGlzdGFuY2UgYmV0d2VlbiBhbnkgdHdvIG5vZGVz
LiBUaGlzIHBhdGNoIGludHJvZHVjZSBhDQo+ID4gPiA+IG5ldyBoZWxwZXIgdG8gcGFyc2UgdGhp
cyBkaXN0YW5jZSBtYXAuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVu
IDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIHhlbi9hcmNoL2FybS9u
dW1hX2RldmljZV90cmVlLmMgfCA2Nw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+
ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4g
PiBiL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gPiA+ID4gaW5kZXggYmJlMDgx
ZGNkMS4uNmUwZDFkM2Q5ZiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEveGVuL2FyY2gvYXJtL251bWFf
ZGV2aWNlX3RyZWUuYw0KPiA+ID4gPiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJl
ZS5jDQo+ID4gPiA+IEBAIC0yMDAsMyArMjAwLDcwIEBAIGRldmljZV90cmVlX3BhcnNlX251bWFf
bWVtb3J5X25vZGUoY29uc3Qgdm9pZA0KPiAqZmR0LA0KPiA+ID4gaW50IG5vZGUsDQo+ID4gPiA+
DQo+ID4gPiA+ICAgICAgcmV0dXJuIDA7DQo+ID4gPiA+ICB9DQo+ID4gPiA+ICsNCj4gPiA+ID4g
Ky8qIFBhcnNlIE5VTUEgZGlzdGFuY2UgbWFwIHYxICovDQo+ID4gPiA+ICtpbnQgX19pbml0DQo+
ID4gPiA+ICtkZXZpY2VfdHJlZV9wYXJzZV9udW1hX2Rpc3RhbmNlX21hcF92MShjb25zdCB2b2lk
ICpmZHQsIGludCBub2RlKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArICAgIGNvbnN0IHN0cnVjdCBm
ZHRfcHJvcGVydHkgKnByb3A7DQo+ID4gPiA+ICsgICAgY29uc3QgX19iZTMyICptYXRyaXg7DQo+
ID4gPiA+ICsgICAgaW50IGVudHJ5X2NvdW50LCBsZW4sIGk7DQo+ID4gPiA+ICsNCj4gPiA+ID4g
KyAgICBwcmludGsoWEVOTE9HX0lORk8gIk5VTUE6IHBhcnNpbmcgbnVtYS1kaXN0YW5jZS1tYXBc
biIpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgcHJvcCA9IGZkdF9nZXRfcHJvcGVydHkoZmR0
LCBub2RlLCAiZGlzdGFuY2UtbWF0cml4IiwgJmxlbik7DQo+ID4gPiA+ICsgICAgaWYgKCAhcHJv
cCApDQo+ID4gPiA+ICsgICAgew0KPiA+ID4gPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5J
TkcNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICJOVU1BOiBObyBkaXN0YW5jZS1tYXRyaXggcHJv
cGVydHkgaW4gZGlzdGFuY2UtDQo+IG1hcFxuIik7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiA+ICsgICAgfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsg
ICAgaWYgKCBsZW4gJSBzaXplb2YodWludDMyX3QpICE9IDAgKQ0KPiA+ID4gPiArICAgIHsNCj4g
PiA+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAiZGlzdGFuY2UtbWF0cml4IGluIG5vZGUgaXMgbm90IGEgbXVsdGlwbGUgb2YNCj4gdTMy
XG4iKTsNCj4gPiA+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiA+ICsgICAgfQ0K
PiA+ID4gPiArDQo+ID4gPiA+ICsgICAgZW50cnlfY291bnQgPSBsZW4gLyBzaXplb2YodWludDMy
X3QpOw0KPiA+ID4gPiArICAgIGlmICggZW50cnlfY291bnQgPD0gMCApDQo+ID4gPiA+ICsgICAg
ew0KPiA+ID4gPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIk5VTUE6IEludmFsaWQg
ZGlzdGFuY2UtbWF0cml4XG4iKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4gPiA+ID4gKyAgICB9DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICBtYXRyaXgg
PSAoY29uc3QgX19iZTMyICopcHJvcC0+ZGF0YTsNCj4gPiA+ID4gKyAgICBmb3IgKCBpID0gMDsg
aSArIDIgPCBlbnRyeV9jb3VudDsgaSArPSAzICkNCj4gPiA+ID4gKyAgICB7DQo+ID4gPiA+ICsg
ICAgICAgIHVpbnQzMl90IGZyb20sIHRvLCBkaXN0YW5jZTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAr
ICAgICAgICBmcm9tID0gZHRfcmVhZF9udW1iZXIobWF0cml4LCAxKTsNCj4gPiA+ID4gKyAgICAg
ICAgbWF0cml4Kys7DQo+ID4gPiA+ICsgICAgICAgIHRvID0gZHRfcmVhZF9udW1iZXIobWF0cml4
LCAxKTsNCj4gPiA+ID4gKyAgICAgICAgbWF0cml4Kys7DQo+ID4gPiA+ICsgICAgICAgIGRpc3Rh
bmNlID0gZHRfcmVhZF9udW1iZXIobWF0cml4LCAxKTsNCj4gPiA+ID4gKyAgICAgICAgbWF0cml4
Kys7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgaWYgKCAoZnJvbSA9PSB0byAmJiBkaXN0
YW5jZSAhPSBOVU1BX0xPQ0FMX0RJU1RBTkNFKSB8fA0KPiA+ID4gPiArICAgICAgICAgICAgKGZy
b20gIT0gdG8gJiYgZGlzdGFuY2UgPD0gTlVNQV9MT0NBTF9ESVNUQU5DRSkgKQ0KPiA+ID4gPiAr
ICAgICAgICB7DQo+ID4gPiA+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAiSW52YWxpZCBub2RlcycgZGlzdGFuY2UgZnJvbSBu
b2RlIyVkIHRvIG5vZGUjJWQNCj4gPiA+ID0gJWRcbiIsDQo+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgZnJvbSwgdG8sIGRpc3RhbmNlKTsNCj4gPiA+ID4gKyAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPiA+ID4gPiArICAgICAgICB9DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAg
cHJpbnRrKFhFTkxPR19JTkZPICJOVU1BOiBkaXN0YW5jZSBmcm9tIG5vZGUjJWQgdG8gbm9kZSMl
ZA0KPiA+ID4gPSAlZFxuIiwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGZyb20sIHRvLCBkaXN0
YW5jZSk7DQo+ID4gPiA+ICsgICAgICAgIG51bWFfc2V0X2Rpc3RhbmNlKGZyb20sIHRvLCBkaXN0
YW5jZSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgLyogU2V0IGRlZmF1bHQgZGlzdGFu
Y2Ugb2Ygbm9kZSBCLT5BIHNhbWUgYXMgQS0+QiAqLw0KPiA+ID4gPiArICAgICAgICBpZiAodG8g
PiBmcm9tKQ0KPiA+ID4gPiArICAgICAgICAgICAgIG51bWFfc2V0X2Rpc3RhbmNlKHRvLCBmcm9t
LCBkaXN0YW5jZSk7DQo+ID4gPg0KPiA+ID4gSSBhbSBhIGJpdCB1bnN1cmUgYWJvdXQgdGhpcyBs
YXN0IDIgbGluZXM6IHdoeSBjYWxsaW5nDQo+IG51bWFfc2V0X2Rpc3RhbmNlDQo+ID4gPiBpbiB0
aGUgb3Bwb3NpdGUgZGlyZWN0aW9uIG9ubHkgd2hlbiB0byA+IGZyb20/IFdvdWxkbid0IGl0IGJl
IE9LIHRvDQo+ID4gPiBhbHdheXMgZG8gYm90aDoNCj4gPiA+DQo+ID4gPiBudW1hX3NldF9kaXN0
YW5jZShmcm9tLCB0bywgZGlzdGFuY2UpOw0KPiA+ID4gbnVtYV9zZXRfZGlzdGFuY2UodG8sIGZy
b20sIGRpc3RhbmNlKTsNCj4gPiA+DQo+ID4gPiA/DQo+ID4gPg0KPiA+IEkgYm9ycm93ZWQgdGhp
cyBjb2RlIGZyb20gTGludXgsIGJ1dCBoZXJlIGlzIG15IHVuZGVyc3RhbmRpbmc6DQo+ID4NCj4g
PiBGaXJzdCwgSSByZWFkIHNvbWUgbm90ZXMgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL251bWEudHh0DQo+ID4gMS4gRWFjaCBlbnRyeSByZXByZXNlbnRzIGRpc3RhbmNlIGZy
b20gZmlyc3Qgbm9kZSB0byBzZWNvbmQgbm9kZS4NCj4gPiBUaGUgZGlzdGFuY2VzIGFyZSBlcXVh
bCBpbiBlaXRoZXIgZGlyZWN0aW9uLg0KPiA+IDIuIGRpc3RhbmNlLW1hdHJpeCBzaG91bGQgaGF2
ZSBlbnRyaWVzIGluIGxleGljb2dyYXBoaWNhbCBhc2NlbmRpbmcNCj4gPiBvcmRlciBvZiBub2Rl
cy4NCj4gPg0KPiA+IEhlcmUgaXMgYW4gZXhhbXBsZSBvZiBkaXN0YW5jZS1tYXAgbm9kZSBpbiBE
VEI6DQo+ID4gU2FtcGxlIzEsIGZ1bGwgbGlzdDoNCj4gPiAJCWRpc3RhbmNlLW1hcCB7DQo+ID4g
CQkJIGNvbXBhdGlibGUgPSAibnVtYS1kaXN0YW5jZS1tYXAtdjEiOw0KPiA+IAkJCSBkaXN0YW5j
ZS1tYXRyaXggPSA8MCAwICAxMD4sDQo+ID4gCQkJCQkgICA8MCAxICAyMD4sDQo+ID4gCQkJCQkg
ICA8MCAyICA0MD4sDQo+ID4gCQkJCQkgICA8MCAzICAyMD4sDQo+ID4gCQkJCQkgICA8MSAwICAy
MD4sDQo+ID4gCQkJCQkgICA8MSAxICAxMD4sDQo+ID4gCQkJCQkgICA8MSAyICAyMD4sDQo+ID4g
CQkJCQkgICA8MSAzICA0MD4sDQo+ID4gCQkJCQkgICA8MiAwICA0MD4sDQo+ID4gCQkJCQkgICA8
MiAxICAyMD4sDQo+ID4gCQkJCQkgICA8MiAyICAxMD4sDQo+ID4gCQkJCQkgICA8MiAzICAyMD4s
DQo+ID4gCQkJCQkgICA8MyAwICAyMD4sDQo+ID4gCQkJCQkgICA8MyAxICA0MD4sDQo+ID4gCQkJ
CQkgICA8MyAyICAyMD4sDQo+ID4gCQkJCQkgICA8MyAzICAxMD47DQo+ID4gCQl9Ow0KPiA+DQo+
ID4gQ2FsbCBudW1hX3NldF9kaXN0YW5jZSB3aGVuICJ0byA+IGZyb20iIHdpbGwgcHJldmVudCBY
ZW4gdG8gY2FsbA0KPiA+IG51bWFfc2V0X2Rpc3RhbmNlKDAsIDEsIDIwKSBhZ2FpbiB3aGVuIGl0
J3Mgc2V0dGluZyBkaXN0YW5jZSBmb3IgPDEgMA0KPiAyMD4uDQo+ID4gQnV0LCBudW1hX3NldF9k
aXN0YW5jZSgxLCAwLCAyMCkgd2lsbCBiZSBjYWxsIHR3aWNlLg0KPiA+DQo+ID4gTm9ybWFsbHks
IGRpc3RhbmNlLW1hcCBub2RlIHdpbGwgYmUgb3B0aW1pemVkIGluIGZvbGxvd2luZyBzYW1wbGUj
MiwNCj4gPiBhbGwgcmVkdW5kYW50IGVudHJpZXMgYXJlIHJlbW92ZWQ6DQo+ID4gU2FtcGxlIzIs
IHBhcnRpYWwgbGlzdDoNCj4gPiAJCWRpc3RhbmNlLW1hcCB7DQo+ID4gCQkJIGNvbXBhdGlibGUg
PSAibnVtYS1kaXN0YW5jZS1tYXAtdjEiOw0KPiA+IAkJCSBkaXN0YW5jZS1tYXRyaXggPSA8MCAw
ICAxMD4sDQo+ID4gCQkJCQkgICA8MCAxICAyMD4sDQo+ID4gCQkJCQkgICA8MCAyICA0MD4sDQo+
ID4gCQkJCQkgICA8MCAzICAyMD4sDQo+ID4gCQkJCQkgICA8MSAxICAxMD4sDQo+ID4gCQkJCQkg
ICA8MSAyICAyMD4sDQo+ID4gCQkJCQkgICA8MSAzICA0MD4sDQo+ID4gCQkJCQkgICA8MiAyICAx
MD4sDQo+ID4gCQkJCQkgICA8MiAzICAyMD4sDQo+ID4gCQkJCQkgICA8MyAzICAxMD47DQo+ID4g
CQl9Ow0KPiA+DQo+ID4gVGhlcmUgaXMgbm90IGFueSAiZnJvbSA+IHRvIiBlbnRyeSBpbiB0aGUg
bWFwLiBCdXQgdXNpbmcgdGhpcyBwYXJ0aWFsDQo+IG1hcA0KPiA+IHN0aWxsIGNhbiBzZXQgYWxs
IGRpc3RhbmNlcyBmb3IgYWxsIHBhaXJzLiBBbmQgbnVtYV9zZXRfZGlzdGFuY2UoMSwgMCwNCj4g
MjApDQo+ID4gd2lsbCBiZSBvbmx5IG9uY2UuDQo+IA0KPiBJIHNlZS4gSSBjYW4ndCBmaW5kIGlu
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udW1hLnR4dCB3aGVyZQ0KPiBpdCBz
YXlzIHRoYXQgImZyb20gPiB0byIgbm9kZXMgY2FuIGJlIG9taXR0ZWQuIElmIGl0IGlzIG5vdCB3
cml0dGVuDQo+IGRvd24sIHRoZW4gc29tZWJvZHkgY291bGQgZWFzaWx5IG9wdGltaXplIGl0IHRo
ZSBvcHBvc2l0ZSB3YXk6DQo+IA0KPiAgCQkJIGRpc3RhbmNlLW1hdHJpeCA9IDwwIDAgIDEwPiwN
Cj4gIAkJCQkJICAgPDEgMCAgMjA+LA0KPiAgCQkJCQkgICA8MiAwICA0MD4sDQo+ICAJCQkJCSAg
IDwzIDAgIDIwPiwNCj4gIAkJCQkJICAgPDEgMSAgMTA+LA0KPiAgCQkJCQkgICA8MiAxICAyMD4s
DQo+ICAJCQkJCSAgIDwzIDEgIDQwPiwNCj4gIAkJCQkJICAgPDIgMiAgMTA+LA0KPiAgCQkJCQkg
ICA8MyAyICAyMD4sDQo+ICAJCQkJCSAgIDwzIDMgIDEwPjsNCj4gDQoNClllcywgeW91J3JlIHJp
Z2h0LiBTcGVjIGRvZXNuJ3Qgc2F5IG9wcG9zaXRlIHdheSBpcyB1bmFsbG93ZWQuDQoNCj4gSSB0
aGluayB0aGUgY29kZSBpbiBYZW4gc2hvdWxkIGJlIHJlc2lsaWVudCBhbmQgYWJsZSB0byBjb3Bl
IHdpdGggYQ0KPiBkZXZpY2UgdHJlZSBsaWtlIHRoZSBvbmUgeW91IHdyb3RlIG9yIHRoZSBvbmUg
SSB3cm90ZS4gRnJvbSBhIGNvZGUNCj4gcGVyc3BlY3RpdmUsIGl0IHNob3VsZCBiZSB2ZXJ5IGVh
c3kgdG8gZG8uIElmIG5vdGhpbmcgZWxzZSBpdCB3b3VsZCBtYWtlDQo+IFhlbiBtb3JlIHJlc2ls
aWVudCBhZ2FpbnN0IGJ1Z2d5IGZpcm13YXJlLg0KPiANCj4gDQoNCkkgZG9uJ3QgZGlzYWdyZWUg
d2l0aCB0aGF0Lg0KDQo+ID4gPiBCdXQgaW4gYW55IGNhc2UsIEkgaGF2ZSBhIGRpZmZlcmVudCBz
dWdnZXN0aW9uLiBUaGUgYmluZGluZyBzdGF0ZXMNCj4gdGhhdA0KPiA+ID4gImRpc3RhbmNlcyBh
cmUgZXF1YWwgaW4gZWl0aGVyIGRpcmVjdGlvbiIuIEFsc28gaXQgaGFzIGFuIGV4YW1wbGUNCj4g
d2hlcmUNCj4gPiA+IG9ubHkgb25lIGRpcmVjdGlvbiBpcyBleHByZXNzZWQgdW5mb3J0dW5hdGVs
eSAoYXQgdGhlIGVuZCBvZiB0aGUNCj4gPiA+IGRvY3VtZW50KS4NCj4gPiA+DQo+ID4NCj4gPiBP
aCwgSSBzaG91bGQgc2VlIHRoaXMgY29tbWVudCBmaXJzdCwgdGhlbiBJIHdpbGwgbm90IHBvc3Qg
YWJvdmUNCj4gPiBjb21tZW50IDogKQ0KPiA+DQo+ID4gPiBTbyBteSBzdWdnZXN0aW9uIGlzIHRv
IHBhcnNlIGl0IGFzIGZvbGxvd3M6DQo+ID4gPg0KPiA+ID4gLSBjYWxsIG51bWFfc2V0X2Rpc3Rh
bmNlIGp1c3Qgb25jZSBmcm9tDQo+ID4gPiAgIGRldmljZV90cmVlX3BhcnNlX251bWFfZGlzdGFu
Y2VfbWFwX3YxDQo+ID4gPg0KPiA+ID4gLSBpbiBudW1hX3NldF9kaXN0YW5jZToNCj4gPiA+ICAg
ICAtIHNldCBub2RlX2Rpc3RhbmNlX21hcFtmcm9tXVt0b10gPSBkaXN0YW5jZTsNCj4gPiA+ICAg
ICAtIGNoZWNrIG5vZGVfZGlzdGFuY2VfbWFwW3RvXVtmcm9tXQ0KPiA+ID4gICAgICAgICAgIC0g
aWYgdW5zZXQsIG5vZGVfZGlzdGFuY2VfbWFwW3RvXVtmcm9tXSA9IGRpc3RhbmNlOw0KPiA+ID4g
ICAgICAgICAgIC0gaWYgYWxyZWFkeSBzZXQgdG8gdGhlIHNhbWUgdmFsdWUsIHJldHVybiBzdWNj
ZXNzOw0KPiA+ID4gICAgICAgICAgIC0gaWYgYWxyZWFkeSBzZXQgdG8gYSBkaWZmZXJlbnQgdmFs
dWUsIHJldHVybiBlcnJvcjsNCj4gPg0KPiA+IEkgZG9uJ3QgcmVhbGx5IGxpa2UgdGhpcyBpbXBs
ZW1lbnRhdGlvbi4gSSB3YW50IHRoZSBiZWhhdmlvciBvZg0KPiA+IG51bWFfc2V0X2Rpc3RhbmNl
IGp1c3QgbGlrZSB0aGUgZnVuY3Rpb24gbmFtZSwgZG8gbm90IGluY2x1ZGUNCj4gPiBpbXBsaWNp
dCBvcGVyYXRpb25zLiBPdGhlcndpc2UsIGV4Y2VwdCB0aGUgdXNlciByZWFkIHRoaXMgZnVuY3Rp
b24NCj4gPiBpbXBsZW1lbnRhdGlvbiBiZWZvcmUgaGUgdXNlIGl0LCBoZSBwcm9iYWJseSBkb2Vz
bid0IGtub3cgdGhpcw0KPiA+IGZ1bmN0aW9uIGhhcyBkb25lIHNvIG1hbnkgdGhpbmdzLg0KPiAN
Cj4gWW91IGNhbiBsZWF2ZSBudW1hX3NldF9kaXN0YW5jZSBhcy1pcyB3aXRob3V0IGFueSBpbXBs
aWNpdCBvcGVyYXRpb25zLg0KPiANCj4gSW4gdGhhdCBjYXNlLCBqdXN0IGNhbGwgbnVtYV9zZXRf
ZGlzdGFuY2UgdHdpY2UgZnJvbSBudW1hX3NldF9kaXN0YW5jZQ0KPiBmb3IgYm90aCBmcm9tL3Rv
IGFuZCB0by9mcm9tLiBudW1hX3NldF9kaXN0YW5jZSBjb3VsZCByZXR1cm4gZXJyb3IgaXMNCg0K
SSBhbSBPSyBmb3IgdGhlIGZpcnN0IHNlbnRlbmNlLiBCdXQuLi4NCg0KPiB0aGUgZW50cnkgd2Fz
IGFscmVhZHkgc2V0IHRvIGEgZGlmZmVyZW50IHZhbHVlIG9yIHN1Y2Nlc3Mgb3RoZXJ3aXNlDQo+
IChhbHNvIGluIHRoZSBjYXNlIGl0IHdhcyBhbHJlYWR5IHNldCB0byB0aGUgc2FtZSB2YWx1ZSku
IFRoaXMgd291bGQNCg0KLi4uIEkgcHJlZmVyIG5vdCB0byBjaGVjayB0aGUgcHJldmlvdXMgdmFs
dWUuIFN1YnNlcXVlbnQgbnVtYV9zZXRfZGlzdGFuY2UNCmNhbGwgd2lsbCBvdmVycmlkZSBwcmV2
aW91cyBjYWxscy4gS2VlcCBudW1hX3NldF9kaXN0YW5jZSBhcyBzaW1wbGUgYXMNCml0IGNhbi4g
QW5kIHdoZW4geW91IHBhc3MgbmV3IGRhdGEgdG8gbnVtYV9zZXRfZGlzdGFuY2UsIGl0IGRvZXNu
J3QNCmtub3cgd2hldGhlciB0aGUgcHJldmlvdXMgZGF0YSB3YXMgY29ycmVjdCBvciB0aGUgbmV3
IGRhdGEgaXMgY29ycmVjdC4NCk9ubHkgY2FsbGVyIG1heSBoYXZlIGtub3duLiAgDQoNCj4gYWxs
b3cgWGVuIHRvIGNvcGUgd2l0aCBib3RoIHNjZW5hcmlvcyBhYm92ZS4NCg==

