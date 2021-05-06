Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F9375117
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 10:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123385.232710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leZgk-0000EV-7k; Thu, 06 May 2021 08:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123385.232710; Thu, 06 May 2021 08:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leZgk-0000CY-4R; Thu, 06 May 2021 08:48:54 +0000
Received: by outflank-mailman (input) for mailman id 123385;
 Thu, 06 May 2021 08:48:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxhD=KB=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1leZgi-0000CS-Dq
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 08:48:52 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e82bb38e-b752-42fa-8193-e667b23c54db;
 Thu, 06 May 2021 08:48:48 +0000 (UTC)
Received: from DB6PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::24)
 by AS8PR08MB6518.eurprd08.prod.outlook.com (2603:10a6:20b:33d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Thu, 6 May
 2021 08:48:45 +0000
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::8e) by DB6PR1001CA0014.outlook.office365.com
 (2603:10a6:4:b7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 6 May 2021 08:48:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 08:48:45 +0000
Received: ("Tessian outbound 6c4b4bc1cefb:v91");
 Thu, 06 May 2021 08:48:45 +0000
Received: from f7acd78ffa71.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA20B708-B5E3-4BE7-91EA-D3DFC98DF7CF.1; 
 Thu, 06 May 2021 08:48:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7acd78ffa71.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 May 2021 08:48:38 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1935.eurprd08.prod.outlook.com (2603:10a6:800:87::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 08:48:34 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 08:48:34 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Thu, 6 May 2021 08:48:33 +0000
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
X-Inumbo-ID: e82bb38e-b752-42fa-8193-e667b23c54db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzsf7XMA928xiZ+0qr0pgnrFwUw9jtIKFdlT/aXfFAA=;
 b=RyTpf14bY50Ld8IWgdl3madgYY0ahk06OfUHYOvr8BYR+1aeWjj3xXtEhPNbW+dsHj6/bmP6fImljfxL905Wt300kuM4qRyUaDhDEBbvF+0N8pdHL33xVzUswN62QiguIXqEbfSK5cDEx7ujsjBVDR8nbbRuh0v3H1ZMEprPbGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f32bcfaa69b931c9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ9SlAzgOXSAMHXSsw4eIWwFtekGO+r4SXdShWxLbL4a9qmHYiQo5qez4Zfm/kIf9djemOPJ4uUWZ1EHk0dklef15iTQcda6zFTmkL1kiJQwe1W1vd5osO/NnoJH7KlSZ3SypRbQf8vSm2GFEQSfmRBhOkUyjKopLakzlov/NmxzBPDHUIU1LNkYCHn6fJExqEq6bWLa//1/rbc26qBpF/KWsMJHdwg5Uj6WnvV+7571R2htXQyNjrY1pcBA/NOBGiHMdPV2RAohWJEFV9sVGpVsocraOjDUoQEt0V4qNOcz8w/rUIiHoUqGqBO6AevbgkBGX5vCeh2fPBFn4Sy1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzsf7XMA928xiZ+0qr0pgnrFwUw9jtIKFdlT/aXfFAA=;
 b=EOGXE+5cKX95KE50yu0q6PvDL85Wt9Yz0VHbf9SsQN7/zQqhhePq5eLEJByePu2/2tcM1DbqovTKAg9bl+KDB1YwBcSr9JAzr60K8lwGxAU6V5aC8yCnDMet/DS4kxGXSP120IfUyd8ufs2HmybKu4x4QBHXzE8VuL6CU9OK9DV/Q2wjhJzJGzTZHyTG6BmDDZP88vrMXWKDrh+nL16pyET7eJYBaFT4vRPeMlL1Jpp1AueWz72kFL7NWgT+bq8EIy6/eJdahcJZWH7B9OY26cJpp2Nbe210FUxdf8Cm0gvfdnZlMbTnxALwG2UNRoO0QkN7yjWRehDFaQJOREoB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzsf7XMA928xiZ+0qr0pgnrFwUw9jtIKFdlT/aXfFAA=;
 b=RyTpf14bY50Ld8IWgdl3madgYY0ahk06OfUHYOvr8BYR+1aeWjj3xXtEhPNbW+dsHj6/bmP6fImljfxL905Wt300kuM4qRyUaDhDEBbvF+0N8pdHL33xVzUswN62QiguIXqEbfSK5cDEx7ujsjBVDR8nbbRuh0v3H1ZMEprPbGI=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v5 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2105041514260.5018@sstabellini-ThinkPad-T480s>
Date: Thu, 6 May 2021 09:48:27 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9E7D7B58-0ABA-4800-B2D3-9EE3E29CF599@arm.com>
References: <20210504133145.767-1-luca.fancellu@arm.com>
 <20210504133145.767-4-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2105041514260.5018@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0424.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::15) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c02a9492-2c95-4af0-3805-08d9106bc21f
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1935:|AS8PR08MB6518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6518D8321070E84096EFFE97E4589@AS8PR08MB6518.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qUQesMh9uZXyOMc4qi2OKqmPRn5bgzLbyruzWPJ+0PyL7gN27SSZsuCVXF4dvJufX+10X8M8AOF8mCc9T7L1OZnxGOhxKUyWmD5VtecJHwg1jJYGplFuGiZ2RFy/4jHu2bjaZWJ3CzQLGeyO//ci45nMH5pST1Wnkzvnu8k0vae++c+k5rQk2jfcyFsdSkIkMjnsZXmCqvC+JA7vk/38IrhwGCtAps2GTm90zSqfkjz5V21i0/9AiNkJfTFkRX76QVUFzoAYHLR2b3AK1lLYfURGC0OP6UfC0dv87/EJYmwVP9T0Wn19U4mRgpCjGGi3CMqS/aPEAsLcd+vdUwVYgzuWkf3xUwK3+o3rqvKk67XwtNYnUyNIcTXKtdrGx0x4HFePuNkQVNopfaQiKERRrcqbweMhsa09C9pHE4IEx9ZY7sosummNwV8ka/x8vlAnDT3rl3YseRbipmlJdqHXbYCPmYM7WbjyW3bvEGzJ5+DHiOSLhfdXOLfIw/FWAvXfRanssDLyLdW5Hs5tK+lN8+x/a5ACxF5vjZjj8qJpWan5/IW9ahucV5XHOghmams9NyXG/PRHhphBYzrr7wUf3nMFBhUJRBR5FtbYRFZwFlL9EVyrXqd/8eGX17Uo2uKAYQe0xA0PasAaxRSecWRTlnhD+u/nHLUxE28ft7f2+0TOio+QfWsEVhT5psNGV8B4vKwc8XM8AQ+yDk3nFnplpisN/YUuw4aJlpjY2tA/DpPvB4tthDPqYnnD/SNEax/blJ/mF9js08oge09HXBhOpxJsmgFGHK39EU0h+ZQFBmE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(54906003)(5660300002)(8936002)(316002)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(44832011)(4326008)(8676002)(66556008)(478600001)(36756003)(6512007)(6916009)(30864003)(6666004)(26005)(16526019)(966005)(52116002)(6506007)(38350700002)(33656002)(53546011)(38100700002)(86362001)(83380400001)(186003)(21314003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?ai8zVkNXQlREeWdRd0lpbFJER1p4R0hWZHZVYktDcDNnd1lyaWZWeWtPcXRO?=
 =?utf-8?B?SXNlbHBtYVZkTzFOenU0T290cjkrYTQzcXRoSlcyUzlmQSs1dmJ1cWZPRWMx?=
 =?utf-8?B?KzlGbVFLa0NQbFdlYXpBZGNveTQzaWlKKzdPbGtDcU9KNDhqZ2x0ZEVlVzk1?=
 =?utf-8?B?V1kwNEM3Wk02cU9yYU9DNERtYUVSMUN6aVBhVVdNZ2MzSVBQMUMrbTdIbzBv?=
 =?utf-8?B?NXR6ZnJoakwreWlEWjZOZ292cnBPcFBybTVEaTdLd1gzcUZKMmgwN2dac0hR?=
 =?utf-8?B?ZS9QQ1U2ZnZ6TXdTSlh5OFdjTUlxbXZuc2ZyclZmMGNwZis3b1FrRnlRb2k1?=
 =?utf-8?B?WndjYjh2a2RvMlpLWjdhN3BidzFBY0pwbFBGaFZFbVIzK1laNkVwNDFQMHVk?=
 =?utf-8?B?Tk5aV1E2QUs4Si9RbDVnTWJuS0UzdHpJaFZBaTRIazRqdWhkbzNGNlNXelB5?=
 =?utf-8?B?bXRPV2JsbElCdkNWbmt4WW40NVFPSFROYW92NVJtLzJpYmlSYUFFaE84Q2Jr?=
 =?utf-8?B?K0JRSGJZS1pvbXVkMVUzbVFKd1l5SG00cllvOG8wejBsREg2NG9XVC9JWlc5?=
 =?utf-8?B?SVhVQkUrRlltamhISnJwQ051RHF1cEdrV1dZbkJpWnB4SGV5ZWhmaE52bUw5?=
 =?utf-8?B?RnJzVERSSDR2NlAzTmtGTnB1dXR0NkdDNlhrL1R4NkdqRnlmT0V6eXpQVFdR?=
 =?utf-8?B?ZUhFV0s4TE03cUw3TDVMTUdNMVZsZFpMa0hMWUlQcEE5SzJDTGc3bHNsQ3Vn?=
 =?utf-8?B?aWVIeDIyVGJRZWMxK0RUcGhsNGtqdTJuOXhRYUcxT1pxc3RuRDJ0S0JDbUVR?=
 =?utf-8?B?WDBRY21GUjMrRjIvREpCd3NsOU83RUo5U0J1UWVQQUhmNGRqNjk1S0pCaXBU?=
 =?utf-8?B?dWp5SHhnTnkzVExXL1l3RVY5QlpyYkIzZ2lxZWg2aHZ6UndKYVlpN1NsZVZC?=
 =?utf-8?B?VmJSTzRBY1Vza2dLYzBOODlSb09DTXpyck9lNGNpZ2ZVRU5vSmJHZWV2QUgw?=
 =?utf-8?B?K3h6VThyckJSY0Z3RU1KeTkzcytHRENNODNsK1Rjays3RTM4NVVSUlVtNStO?=
 =?utf-8?B?SStxNklOaFdDajM2ckpLa04yaW1odkdqbTVVaGFyRTVZVEFvYlY5TThOWFYx?=
 =?utf-8?B?Z0ZpRXNWUW9UTmdnWk1FOXp5Q0xyT2pGWEtxRVZ6Z1ZVYWRTR09TY3gvQnMr?=
 =?utf-8?B?ZFlaVk9OeHJjR1JURGxhQStRc3JxbVAvRkN5OGgyUEZHYmY4aS9aNUllZVFq?=
 =?utf-8?B?M3I4WkVCNkM1REJlZEtRVFFwSFl4UW53RElpVHUxSDF6a1RKcFFTb1ZMNGZj?=
 =?utf-8?B?eC94OEs2MCtCNU1YK0p1dEpmNHdORmU5bk0vRWtHTTNIakZ2eloxZ20yeGN0?=
 =?utf-8?B?MTliWEhvcDNqODEyZEtLdHd0Nk96VjdjUGVzVWRtUEVLK3k2VzJXaFhtM2ts?=
 =?utf-8?B?YWJOTVJXcWNUbzZKS0tlUklZRkZ0LzVTZTNXc2FKaEI0ZXMrOUVpdGJ2MDh0?=
 =?utf-8?B?RFpkTXdhWTFhYXFzK1hvUEJNaVZscjNOSTEzVVB5M0NmcWd4U1I5eVR2akNj?=
 =?utf-8?B?TWdyMm43Nzlqa0RxRDNPOTBiWU9wajJsTkVHeExTMzNwOGRaYmhPd1YzS1Ni?=
 =?utf-8?B?ZExhL0Z3TTNLZ1dyOFRqY2I1NFVBczUyWlNBeC9XUXg1TFJyS2dzbnZXRmJF?=
 =?utf-8?B?aFY1Y0EzaFo5RUFNc0pPSTBzWVFMYno0SENlbjRKR2lKdUNwellyNHA1K0ZF?=
 =?utf-8?Q?9Zehvas7tYN0pg8a3woPteqZVBtzVNpd35rIHUY?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1935
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	61faa67e-7cde-45f3-7f89-08d9106bbb33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N1/fc19IixSlUwK6X0S2dK95Muv/EIA+w8jpLLh6PSZHZsWePeH7Offyp5UovSglVYJu2aL01bMXw6FhL6eUIhdW46RJmkeC1ewx5xpZiMUkDeAGko+138x1cq2hG29g5N6kMzipU+OGpe41Gp65VjDtOehdgrmVkbbIkMTb3hA/UIJElt4U4R2Ey4uJwu3uRS2la9WH9RIV6jheKF5q7lOBmrkkbSiQ9yEPir02orWUleRwXV3d78AXcHJMh0AUglgqINL+QhcxXwgy/j38zXHqqWoaHmz2sswMuPY5f+clhIJuUwHbEZauli+XbKNdrRyER6r88375BztemeduKbhAW4phUgsnl5vrS4OrXRigbXOx2Wvxac+JyZnTWCIW+XACcegRIFY957rIG8mFCCK4kUm54PVuQyu4kUcZa3I+JQlgz3+A+CBpqMJk9KDY1QH9VFOLJGtt8i78CMVRiJsILelAf7h1BpZcJMlpXaD3yvHcLdEFph2bEivnGJyaHrcbmzwdwE+/eyAwO1al7tFGIvZcOv19VFStQzU1ckUokceqI4K3aEHEvj438I5r0sDvSg7wP5E68j6JOb2tX93PcTUj0RpRnHUw1HX1fyQJY2GxEj5Tt1xnQLHMHLi0nBwEZJUyz2z4j51/IB8Jh4cHeqQqsGyiHhbZTfkIe3+md8JFgsOlYK8qBAE7fAq0gl0OYdP7EMOcgZrFuAIw6rtff/kIe1LnOfTW8+n6YKXQ4ZSLTdH1NXmug1SQb2Hn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(316002)(356005)(33656002)(44832011)(81166007)(6506007)(36756003)(6486002)(83380400001)(6666004)(8676002)(82740400003)(26005)(186003)(6862004)(336012)(86362001)(53546011)(956004)(2906002)(2616005)(8936002)(6512007)(54906003)(4326008)(36860700001)(82310400003)(966005)(47076005)(70586007)(478600001)(5660300002)(16526019)(30864003)(70206006)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 08:48:45.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02a9492-2c95-4af0-3805-08d9106bc21f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6518



> On 4 May 2021, at 23:27, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 4 May 2021, Luca Fancellu wrote:
>> Modification to include/public/grant_table.h:
>>=20
>> 1) Add doxygen tags to:
>> - Create Grant tables section
>> - include variables in the generated documentation
>> - Used @keepindent/@endkeepindent to enclose comment
>>   section that are indented using spaces, to keep
>>   the indentation.
>> 2) Add .rst file for grant table for Arm64
>=20
> Thanks Luca for your hard work on this. It is going to make things a lot
> better!
>=20
> I reviewed this patch while looking at
> https://luca.fancellu.gitlab.io/xen-docs/hypercall-interfaces/arm64/grant=
_tables.html
>=20
> In short, I think this changes look fine except for a trivial code style
> issue on the very last comment at the bottom of the patch.
>=20
> All my questions below are basically about some other in-code comments,
> currently existing in the code, but not outputted in the html file.
> Is there an easy way to add them?
>=20
>=20
>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v5 changes:
>> - Move GNTCOPY_* define next to the flags field
>> v4 changes:
>> - Used @keepindent/@endkeepindent doxygen commands
>>  to keep text with spaces indentation.
>> - drop changes to grant_entry_v1 comment, it will
>>  be changed and included in the docs in a future patch
>> - Move docs .rst to "common" folder
>> v3 changes:
>> - removed tags to skip anonymous union/struct
>> - moved back comment pointed out by Jan
>> - moved down defines related to struct gnttab_copy
>>  as pointed out by Jan
>> v2 changes:
>> - Revert back to anonymous union/struct
>> - add doxygen tags to skip anonymous union/struct
>> ---
>> docs/hypercall-interfaces/arm64.rst           |  1 +
>> .../common/grant_tables.rst                   |  8 +++
>> docs/xen-doxygen/doxy_input.list              |  1 +
>> xen/include/public/grant_table.h              | 66 ++++++++++++-------
>> 4 files changed, 52 insertions(+), 24 deletions(-)
>> create mode 100644 docs/hypercall-interfaces/common/grant_tables.rst
>>=20
>> diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interf=
aces/arm64.rst
>> index 5e701a2adc..cb4c0d13de 100644
>> --- a/docs/hypercall-interfaces/arm64.rst
>> +++ b/docs/hypercall-interfaces/arm64.rst
>> @@ -8,6 +8,7 @@ Starting points
>> .. toctree::
>>    :maxdepth: 2
>>=20
>> +   common/grant_tables
>>=20
>>=20
>> Functions
>> diff --git a/docs/hypercall-interfaces/common/grant_tables.rst b/docs/hy=
percall-interfaces/common/grant_tables.rst
>> new file mode 100644
>> index 0000000000..8955ec5812
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/common/grant_tables.rst
>> @@ -0,0 +1,8 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Grant Tables
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. doxygengroup:: grant_table
>> +   :project: Xen
>> +   :members:
>> diff --git a/docs/xen-doxygen/doxy_input.list b/docs/xen-doxygen/doxy_in=
put.list
>> index e69de29bb2..233d692fa7 100644
>> --- a/docs/xen-doxygen/doxy_input.list
>> +++ b/docs/xen-doxygen/doxy_input.list
>> @@ -0,0 +1 @@
>> +xen/include/public/grant_table.h
>> diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant=
_table.h
>> index 84b1d26b36..e1fb91dfc6 100644
>> --- a/xen/include/public/grant_table.h
>> +++ b/xen/include/public/grant_table.h
>> @@ -25,15 +25,19 @@
>>  * Copyright (c) 2004, K A Fraser
>>  */
>>=20
>> +/**
>> + * @file
>> + * @brief Interface for granting foreign access to page frames, and rec=
eiving
>> + * page-ownership transfers.
>> + */
>> +
>> #ifndef __XEN_PUBLIC_GRANT_TABLE_H__
>> #define __XEN_PUBLIC_GRANT_TABLE_H__
>>=20
>> #include "xen.h"
>>=20
>> -/*
>> - * `incontents 150 gnttab Grant Tables
>> - *
>> - * Xen's grant tables provide a generic mechanism to memory sharing
>> +/**
>> + * @brief Xen's grant tables provide a generic mechanism to memory shar=
ing
>>  * between domains. This shared memory interface underpins the split
>>  * device drivers for block and network IO.
>>  *
>> @@ -51,13 +55,10 @@
>>  * know the real machine address of a page it is sharing. This makes
>>  * it possible to share memory correctly with domains running in
>>  * fully virtualised memory.
>> - */
>> -
>> -/***********************************
>> + *
>>  * GRANT TABLE REPRESENTATION
>> - */
>> -
>> -/* Some rough guidelines on accessing and updating grant-table entries
>> + *
>> + * Some rough guidelines on accessing and updating grant-table entries
>>  * in a concurrency-safe manner. For more information, Linux contains a
>>  * reference implementation for guest OSes (drivers/xen/grant_table.c, s=
ee
>>  * http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux.git;a=3Dbl=
ob;f=3Ddrivers/xen/grant-table.c;hb=3DHEAD
>> @@ -66,6 +67,7 @@
>>  *     compiler barrier will still be required.
>>  *
>>  * Introducing a valid entry into the grant table:
>> + * @keepindent
>>  *  1. Write ent->domid.
>>  *  2. Write ent->frame:
>>  *      GTF_permit_access:   Frame to which access is permitted.
>> @@ -73,20 +75,25 @@
>>  *                           frame, or zero if none.
>>  *  3. Write memory barrier (WMB).
>>  *  4. Write ent->flags, inc. valid type.
>> + * @endkeepindent
>>  *
>>  * Invalidating an unused GTF_permit_access entry:
>> + * @keepindent
>>  *  1. flags =3D ent->flags.
>>  *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>  *  NB. No need for WMB as reuse of entry is control-dependent on succes=
s of
>>  *      step 3, and all architectures guarantee ordering of ctrl-dep wri=
tes.
>> + * @endkeepindent
>>  *
>>  * Invalidating an in-use GTF_permit_access entry:
>> + *
>>  *  This cannot be done directly. Request assistance from the domain con=
troller
>>  *  which can set a timeout on the use of a grant entry and take necessa=
ry
>>  *  action. (NB. This is not yet implemented!).
>>  *
>>  * Invalidating an unused GTF_accept_transfer entry:
>> + * @keepindent
>>  *  1. flags =3D ent->flags.
>>  *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>> @@ -97,18 +104,24 @@
>>  *      transferred frame is written. It is safe for the guest to spin w=
aiting
>>  *      for this to occur (detect by observing GTF_transfer_completed in
>>  *      ent->flags).
>> + * @endkeepindent
>>  *
>>  * Invalidating a committed GTF_accept_transfer entry:
>>  *  1. Wait for (ent->flags & GTF_transfer_completed).
>>  *
>>  * Changing a GTF_permit_access from writable to read-only:
>> + *
>>  *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writin=
g.
>>  *
>>  * Changing a GTF_permit_access from read-only to writable:
>> + *
>>  *  Use SMP-safe bit-setting instruction.
>> + *
>> + * @addtogroup grant_table Grant Tables
>> + * @{
>>  */
>>=20
>> -/*
>> +/**
>>  * Reference to a grant entry in a specified domain's grant table.
>>  */
>> typedef uint32_t grant_ref_t;
>=20
> Just below this typedef there is the following comment:
>=20
> /*
> * A grant table comprises a packed array of grant entries in one or more
> * page frames shared between Xen and a guest.
> * [XEN]: This field is written by Xen and read by the sharing guest.
> * [GST]: This field is written by the guest and read by Xen.
> */
>=20
> I noticed it doesn't appear in the output html. Any way we can retain it
> somewhere? Maybe we have to move it together with the larger comment
> above?

I agree with you, this comment should appear in the html docs, but to do so
It has to be moved together with the larger comment above.

In the original patch it was like that but I had to revert it back due to o=
bjection, my proposal is
to put it together with the larger comment and write something like this to
maintain a good readability:

   *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing=
.
   *
   * Changing a GTF_permit_access from read-only to writable:
   *
   *  Use SMP-safe bit-setting instruction.
+ *
+ * A grant table comprises a packed array of grant entries in one or more
+ * page frames shared between Xen and a guest.
+ *
+ * Data structure fields or defines described below have the following tag=
s:
+ * * [XEN]: This field is written by Xen and read by the sharing guest.
+ * * [GST]: This field is written by the guest and read by Xen.
   *
   * @addtogroup grant_table Grant Tables
   * @{

If we all agree I will put it in the v6

>=20
>=20
>> @@ -129,15 +142,17 @@ typedef uint32_t grant_ref_t;
>> #define grant_entry_v1_t grant_entry_t
>> #endif
>> struct grant_entry_v1 {
>> -    /* GTF_xxx: various type and flag information.  [XEN,GST] */
>> +    /** GTF_xxx: various type and flag information.  [XEN,GST] */
>>     uint16_t flags;
>> -    /* The domain being granted foreign privileges. [GST] */
>> +    /** The domain being granted foreign privileges. [GST] */
>>     domid_t  domid;
>> -    /*
>> +    /**
>> +     * @keepindent
>>      * GTF_permit_access: GFN that @domid is allowed to map and access. =
[GST]
>>      * GTF_accept_transfer: GFN that @domid is allowed to transfer into.=
 [GST]
>>      * GTF_transfer_completed: MFN whose ownership transferred by @domid
>>      *                         (non-translated guests only). [XEN]
>> +     * @endkeepindent
>>      */
>>     uint32_t frame;
>> };
>> @@ -228,7 +243,7 @@ struct grant_entry_header {
>> };
>> typedef struct grant_entry_header grant_entry_header_t;
>=20
>=20
> Also this comment is missing from the output:
>=20
> /*
> * Type of grant entry.
> *  GTF_invalid: This grant entry grants no privileges.
> *  GTF_permit_access: Allow @domid to map/access @frame.
> *  GTF_accept_transfer: Allow @domid to transfer ownership of one page fr=
ame
> *                       to this guest. Xen writes the page number to @fra=
me.
> *  GTF_transitive: Allow @domid to transitively access a subrange of
> *                  @trans_grant in @trans_domid.  No mappings are allowed=
.
> */
>=20
> Is there a way to keep it?
>=20
>=20
> Similarly for the other subflags descriptions.

Here we could split the comment and do something like this:

/**< GTF_invalid: This grant entry grants no privileges. */
#define GTF_invalid         (0U<<0)

/**< GTF_permit_access: Allow \@domid to map/access \@frame. */
#define GTF_permit_access   (1U<<0)=20

/**
* GTF_accept_transfer: Allow \@domid to transfer=20
* ownership of one page frame to this guest. Xen=20
* writes the page number to \@frame.
*/
#define GTF_accept_transfer (2U<<0)

/**
* GTF_transitive: Allow @domid to transitively access a subrange of
* \@trans_grant in \@trans_domid.  No mappings are allowed.
*/
#define GTF_transitive      (3U<<0)

In this way each define will have its own description and I think both sour=
ce code
and html docs would be improved.

>=20
>=20
>> -/*
>> +/**
>>  * Version 2 of the grant entry structure.
>>  */
>> union grant_entry_v2 {
>> @@ -433,7 +448,7 @@ typedef struct gnttab_transfer gnttab_transfer_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>=20
> What about the comments for each members of the union? Basically I am
> trying to ask if we can output almost all comments currently living in
> this header.

Yes we can, every comment that is in place near the commented data structur=
e
needs just to have the /* changed to /** to be part of the html documentati=
on.

There are other cases as above where the comment could be split, I can do t=
hat in the v6,
I need just to know if we agree on a solution like that so I don=E2=80=99t =
have to do work that I will
trash later.

>=20
>=20
>> -/*
>> +/**
>>  * GNTTABOP_copy: Hypervisor based copy
>>  * source and destinations can be eithers MFNs or, for foreign domains,
>>  * grant references. the foreign domain has to grant read/write access
>> @@ -451,11 +466,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>  * bytes to be copied.
>>  */
>>=20
>> -#define _GNTCOPY_source_gref      (0)
>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> -#define _GNTCOPY_dest_gref        (1)
>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>> -
>> struct gnttab_copy {
>>     /* IN parameters. */
>>     struct gnttab_copy_ptr {
>> @@ -468,6 +478,10 @@ struct gnttab_copy {
>>     } source, dest;
>>     uint16_t      len;
>>     uint16_t      flags;          /* GNTCOPY_* */
>> +#define _GNTCOPY_source_gref      (0)
>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> +#define _GNTCOPY_dest_gref        (1)
>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>=20
> I think this is OK
>=20
>=20
>>     /* OUT parameters. */
>>     int16_t       status;
>> };
>> @@ -579,7 +593,7 @@ struct gnttab_swap_grant_ref {
>> typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
>>=20
>> -/*
>> +/**
>>  * Issue one or more cache maintenance operations on a portion of a
>>  * page granted to the calling domain by a foreign domain.
>>  */
>> @@ -588,8 +602,8 @@ struct gnttab_cache_flush {
>>         uint64_t dev_bus_addr;
>>         grant_ref_t ref;
>>     } a;
>> -    uint16_t offset; /* offset from start of grant */
>> -    uint16_t length; /* size within the grant */
>> +    uint16_t offset; /**< offset from start of grant */
>> +    uint16_t length; /**< size within the grant */
>> #define GNTTAB_CACHE_CLEAN          (1u<<0)
>> #define GNTTAB_CACHE_INVAL          (1u<<1)
>> #define GNTTAB_CACHE_SOURCE_GREF    (1u<<31)
>> @@ -673,6 +687,10 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
>>     "operation not done; try again"             \
>> }
>>=20
>> +/**
>> + * @}
>> +*/
>=20
> Alignment of the *

Sure I=E2=80=99ll fix it in the v6

I=E2=80=99ll wait a couple of days for the reply, then I=E2=80=99ll assume =
everything above is agreed and I=E2=80=99ll
push the v6.


Cheers,
Luca

>=20
>=20
>> #endif /* __XEN_PUBLIC_GRANT_TABLE_H__ */
>>=20
>> /*
>> --=20
>> 2.17.1


