Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFB3341BC9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 12:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99182.188431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDej-0006AK-BR; Fri, 19 Mar 2021 11:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99182.188431; Fri, 19 Mar 2021 11:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNDej-00069v-7Z; Fri, 19 Mar 2021 11:51:05 +0000
Received: by outflank-mailman (input) for mailman id 99182;
 Fri, 19 Mar 2021 11:51:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSWs=IR=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lNDeh-00069q-0n
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 11:51:03 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22c7f23f-f1f0-4305-b23b-c4180d84012e;
 Fri, 19 Mar 2021 11:51:00 +0000 (UTC)
Received: from AM6P192CA0034.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::47)
 by DB6PR0802MB2152.eurprd08.prod.outlook.com (2603:10a6:4:83::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 11:50:58 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::21) by AM6P192CA0034.outlook.office365.com
 (2603:10a6:209:83::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 11:50:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 11:50:57 +0000
Received: ("Tessian outbound 04b74cf98e3c:v87");
 Fri, 19 Mar 2021 11:50:57 +0000
Received: from cbfe67f02811.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F664234-22C8-453B-A036-C0491DE8D40A.1; 
 Fri, 19 Mar 2021 11:50:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cbfe67f02811.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Mar 2021 11:50:48 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1840.eurprd08.prod.outlook.com (2603:10a6:800:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 11:50:46 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 11:50:46 +0000
Received: from a75445.arm.com (82.8.129.65) by
 ZR0P278CA0025.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 11:50:45 +0000
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
X-Inumbo-ID: 22c7f23f-f1f0-4305-b23b-c4180d84012e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM0m4dceXDmzZ5Y7JaceturxEaCYIsESfTG+xWu/3Jo=;
 b=GBAZyJGl+ZoC0HwSAJfuiOhUaqBXtC8Po+1RXqI+4KPa5fUIemueq/hZVmIqdqHyLEQ7AVnUOtJ0QXECUy0KRqdIC9UYQxsUFX4NZbdy5h6labSBULq2maGyYq37JXxAX+ZCYZdP6AKMr9686jB/k3/xmQGIN0NFixhghHbLC1s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6d4a71b84555dc0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcZevTLp94gHBVhnzZ+9QPGL9Y19iGA4S75+WwzDsPnbQJYFuWUja9Lk5PWyEwmDRdutmXXh67WkmegVuCPtSyKzFKfU/KKpylOCCPVy5kFeO+G+CV8iF4hpjY+mjPgnisvv+psWOh8cLVPPjxvhGNA88SgruaEZ6rMsBZlsJefRhSh1t1OeZLneTsXNrYEzv4KzcFMQNtHiQiNlo+L/EQf1pgSJhFfZS/png8+M8ptmzWMrNDmf/CHsTf3ljjwac4AQTXFt7UnUvZSCxLSOnWqtMQn3rdbUMRSNTCHCA2V8tu11p7fiA507WeiyAgEhFLTfJQ/MT1WXR9pLpFcU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM0m4dceXDmzZ5Y7JaceturxEaCYIsESfTG+xWu/3Jo=;
 b=fF5/ZULUiSXUepTHfrtzTgTo8uqScF4K1epq4G9nXIu8P81L5aR2e0wOnqyinmKZ5DwnuV3HrzAfXiJr8jBBjdZONJLw+vfzbI8OL8sHdqKOq6OYuwZj9JEZj8mmsR4Hk9PZmcCPa9nGLjB7LWfQe0NfZVGk8MD5C9KcwsWwPqEh6WIGJrgJoYyISdVji/rooXrBep/IOolNRzz9D4tEHEKi4Dd8Eqt9R/gP/WC2JhVBFxVcRaf3CMeyMSd05YKD5gsREVRNZkhtQDotY/OK2M+HJgw8UR2yVuipHWbyGTARUMxo3rqNUW9NbckP7Y7zUS/zukkQSJ4xX9xMF+hbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM0m4dceXDmzZ5Y7JaceturxEaCYIsESfTG+xWu/3Jo=;
 b=GBAZyJGl+ZoC0HwSAJfuiOhUaqBXtC8Po+1RXqI+4KPa5fUIemueq/hZVmIqdqHyLEQ7AVnUOtJ0QXECUy0KRqdIC9UYQxsUFX4NZbdy5h6labSBULq2maGyYq37JXxAX+ZCYZdP6AKMr9686jB/k3/xmQGIN0NFixhghHbLC1s=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
Date: Fri, 19 Mar 2021 11:50:39 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jgrall@amazon.com" <jgrall@amazon.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
 <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: ZR0P278CA0025.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::12) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc292da0-6b18-44ee-9d08-08d8eacd427b
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1840:|DB6PR0802MB2152:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB21528EB092DBDF95D6EF820EE4689@DB6PR0802MB2152.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g5rsz/HuW/dBIUSeAemU4EZ1wRscmlQbYvPluNC8soBybCIq2iVtej9SYhrXC+OsY7mjfuK2GjH61/a4C5h1n5Aol0h/GZ+T+s6szgr3h/7J5hF4kd54LQg3q8PGA/05usZ9Enc2oMf5RTi1O4h42xvlo/fjC3cWLdKikiYQq3t/4C19foixVFlTxVIb3ciCNLgOXnZfxw+HJLEEMPJyDAe84FDSalWZukIDD1pYTX9B2bGivqM4H1hfN0/UtUdDN3Cpspf6JjcspdE2GH6jdQSSPrkpPel+Sz8DRmCC/AXyOqa+JYS26J1TPBCb7+6Pi7MvWEEFNARJoRoaM9hO1ldWa55afzqMvy0ycssOJfuN/pWbeZSUK36LtU2xC5PLCU2RKsbctb33RZmlYFl2QF/7ZqU+7vPTwbnfQTrm5PGMA2gG+rvCmz8yYWvxyq/6x6B4xpN39/sGXpwFRo8Z7r0F3J93VugCIqnRXx4M2GtwUQHkWz375bqwd1c8aumlaia1+pOBZqTgXyJLhP/67rE0bbhnkgCReBfQs+oV0x8Ko1AsFn4IzbJ7FpFNdnTwESE2yBAJB62sktV9pn7Q3/b6HKlqUwReuE5XPyeiapr8JIXHgf73npRRBWAZO1kFHbfu+qaupyi6qUiS0R3tIOlgvsdmJ8qQLBLI9PbbKu67QwHCXOfYiRESYtv3FghXnzJYLAd9qTg1O15T28rKpxI7eKyULWH8v+/w/JyWOpFQzQ6nXBmyMj5YxGDXECzxu5JS0Y6tBlyai+ZRsH7u8Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(8676002)(16526019)(186003)(66556008)(66476007)(54906003)(316002)(478600001)(966005)(2906002)(26005)(66946007)(8936002)(36756003)(45080400002)(6666004)(83380400001)(5660300002)(7696005)(44832011)(6916009)(33656002)(66574015)(53546011)(52116002)(38100700001)(2616005)(86362001)(4326008)(956004)(6486002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?azVWanM1ckdGZUVDS3o3VWRiN2RqRXBUZ0YxcHlyM0tVK3Mwd1hIZFhFQU0w?=
 =?utf-8?B?VE9XcW5KZGJnMzNwZ0FraGJ4NmtXUDljcW5GK0s5Q1dUaHBlc29odDJhZWVS?=
 =?utf-8?B?VWo5TjRFU1JGSjQ1TnFwM3loVEpMc3FHcFFUTXpLQjllbEFLOFZzQUQ5U0JU?=
 =?utf-8?B?aGt2RmQwbnFlbEp6RHZvUGd5eFovZU1yZTVLdWNhUmFyUW1KL0EyYUk5bjFi?=
 =?utf-8?B?cEc0Y1c4eGkxVTAwMjZFM056Y3RQbFhQOHVYanBlNzk4S0hZNyt5bGo5Sndu?=
 =?utf-8?B?THJxeXVNcUNwb01samxnNFBmeWU0bnJmR29PN0ZVMnZFN09XTHAzcWtSYnEz?=
 =?utf-8?B?cVJKRjg1TkVDU0VWL3o1a1JzT0dvNjhCT1pWd1I1NEEvZjI5OEMrcHJ4V1pm?=
 =?utf-8?B?RGhKZkNMNGxHMzgrak00VHh5dEtMUzk1cGlpdm02MHlFOWNYRXoySzBObTJ0?=
 =?utf-8?B?dDJ2alE0SDRZSkg3ZFRQWTBqMnpxbjMzMjQzQ0V2eFhvUlBoa0JFNTRieXVj?=
 =?utf-8?B?eUU0djVRUDB5UzRkbnRwUE00bWhWWkZ4bWhxMkJGUjV1TmlVWGMwSEdlSys3?=
 =?utf-8?B?UEdtNUN6RCtuWGk5ZXNZSWMxbTFDSkp0b2llT3RLZHNhdjVRMEdMRlZJSDlk?=
 =?utf-8?B?aVFXcDJiQVgxckJ1MzBGdml6SEZFL3prSXI1emFtSTNyRGFWczVIa0dQemh4?=
 =?utf-8?B?Y2lRcURjVVVmNHpKSGJLZUt5N1lHQ1o1c1hxSjhabVFGcnNOcnF3VnBrc2dD?=
 =?utf-8?B?QnlwNFloZFcwZ3pncjdhYnFyb25LVkRJREJBY0QzTSs4bmlDRUp0UDNZdGpB?=
 =?utf-8?B?eG1PZDBFRndRU1h2c2MrMTFwdVByWkJPRGhrd3IvNkxDWXdiSkt1RzE1V1d3?=
 =?utf-8?B?WGNLYlcwa1M3dUxXQ1B2a1dFMG1LNlNqdXg2S2xIR1lOekVCRDl0ZlVGKzND?=
 =?utf-8?B?bHFtR1M3dVlkbjRqUXc4c3VqWjdrSkc5SXZnUGMyZjhaTDZOcHVDUFJXaTQv?=
 =?utf-8?B?UGhBVzRjdnJHQUROMWtxOERqNHVNWFUwRG96S0FHb1Zlbk9QVk9pUGRKdGVj?=
 =?utf-8?B?dkJNbmlWNkZuL3RVK1Vib3Z0OXN5SU5iMEpTTHV0ek9GS2picDNKclc2bzU0?=
 =?utf-8?B?aThCOW5Mbnd0RmRNbFhSay9ZcHBwUkx0cnppQVNVZnY5ZWZtWHlJYklXQnlB?=
 =?utf-8?B?MUxCWkFuV3pQVjNJM0MvaEpKMDVJZDFEaUpuZ08zZDJPaXl2bW5mSGsxcGRk?=
 =?utf-8?B?WWM2NUFIdGY2V0dUQ2xVd2xacVJtTTBwejVQQUx4YXpWcURuaVdsOE8yOFV3?=
 =?utf-8?B?dUdhTFZRNzJNaW9IUEN2MzBVc1h4K3V4V1I4eC9rSzE5cmtldG9xVG43cUVq?=
 =?utf-8?B?MytuRjRTRjZzZUlsQWJ5TjhYS0RpL1ZXWEg3M0szSmxhdEVIdFdzSE5QWkVC?=
 =?utf-8?B?dU8yZFljT0FzYjl3QzhKd1JEUHhVUXVTclZDQzUxdE85UEVYQU4vS3RzVEFI?=
 =?utf-8?B?b3RKNHUyU3hpd1djODhYT2c2T1dKNWZRTTRPQWxGbUdYNEtlQmx3LytFRVk1?=
 =?utf-8?B?cFNkK052QmlENHkxOTdRMUs1bE0zTmozRjhmcmNBZUEzOXp5bUI0TE5HVG1F?=
 =?utf-8?B?K1BzMWEvYWdkeitrZml6R0plUjVzZ3lzYUc5OGlkUURiOGNNWTZEdHJzdUN0?=
 =?utf-8?B?enN3dkxtRytSdzFHTHJBdGRCTm5aeFhPSUNLZldxamVORVhTdUxNT3EybjJU?=
 =?utf-8?Q?9Bfc1vmlzfwXQ9H6IUpQxuTZKaSWBclXZNCY6t/?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1840
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c15a93a-3aa7-4afa-49e0-08d8eacd3b74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZMSkkh22pCgXkGUuBw+o0Bb4ykMsWjG9Ht3TaQmulYE8+kdN0VAw99AlgsBl0lHpD2P5E0Fs6quqkp387sfdaX4sGt0Hkr9Wu1SgWpyprggmHgYj4rZ+uzhAkQ4BMLr4ZbGfAe6FakfyonfGXy63B+NvujSXOd8lOJBo1s96HzjqPUtfO7saf3HND2fSyW0UgCrLuM+q3RThZn04gfaaUONI6x4DUmftKEUYmJF4P3z69Y9KRIaBIEt++Rcp2hX1Is+2ilZ+bltGdZzEIcwRs73fmg+5BSiieOJ/hZNahlFlRxXtdS2VEy7fjPeH2vrS92MRBNr5odSxtbIxH2uq6LgWv7VlbyQ933SD2lHIAHUmxse4MGetOEqhjMurjLVotJlvCyeXJFZ5vYte+61iY/kxObv9GRQTFKBIH+uVZ3VzA+vX2uC6wbbzRKTJZjx7SNPF1Sa+p/kDle9wL54Q+8oDfGxFwu6qllrHi9dwPrxP1qRxsZnVrvkj4DKnRbeMrCCXBSbJ1yf9bR83I+OaVjpg5DAgdFgrimnu87GUW7a+mYrV64c2ZGUf6jARM+FVtnxuSqQ0Am0Y3UoRggMNbonJhh9MvdJ0CaxFJhIsPTLkpG/W52hp5kX5ktLd2Dj7ShIoAddDtBpvHaclakv7v1CnhVKtjfwh3B+3LFdIplAW6hXezBJoqieROZIew5+OZRJGi2aeOEhlW6+ivO0nmRwuQ4q4cPMUNusBNXGmvog=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(36840700001)(54906003)(36756003)(4326008)(45080400002)(36860700001)(6666004)(478600001)(5660300002)(316002)(956004)(81166007)(2616005)(33656002)(966005)(83380400001)(8936002)(6862004)(107886003)(16526019)(26005)(336012)(8676002)(356005)(186003)(2906002)(7696005)(66574015)(70586007)(70206006)(47076005)(44832011)(82740400003)(86362001)(53546011)(6486002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 11:50:57.5758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc292da0-6b18-44ee-9d08-08d8eacd427b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2152

Hi Juergen,

Could you confirm that back porting this two serie to the linux kernel 5.10=
:

https://patchwork.kernel.org/project/xen-devel/cover/20201210192536.1184321=
46@linutronix.de/
https://patchwork.kernel.org/project/xen-devel/cover/20210306161833.4552-1-=
jgross@suse.com/

Is needed to remove the BUG_ON(=E2=80=A6)?

Thank you for your time.

Cheers,

Luca

> On 18 Mar 2021, at 08:47, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Hi Juergen,
>=20
> If you are willing to do the patch I think it will be faster to being acc=
epted, what about the BUG_ON(=E2=80=A6) in evtchn_2l_unmask from events_2l.=
c file?
>=20
> Cheers,
>=20
> Luca
>=20
>> On 18 Mar 2021, at 07:54, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote:
>>=20
>> On 17.03.21 15:32, Luca Fancellu wrote:
>>> Hi all,
>>> we've been encountering an issue when using the kernel 5.10 with preemp=
t_rt support for Dom0, the problem is that during the boot of Dom0, it hits=
 a BUG_ON(!irqs_disabled()) from the function evtchn_fifo_unmask defined in=
 events_fifo.c.
>>> This is the call stack:
>>> [   17.817018] ------------[ cut here ]------------
>>> [   17.817021] kernel BUG at drivers/xen/events/events_fifo.c:258!
>>> [   18.817079] Internal error: Oops - BUG: 0 [#1] PREEMPT_RT SMP
>>> [   18.817081] Modules linked in: bridge stp llc ipv6
>>> [   18.817086] CPU: 3 PID: 558 Comm: xenstored Not tainted 5.10.16-rt25=
-yocto-preempt-rt #1
>>> [   18.817089] Hardware name: Arm Neoverse N1 System Development Platfo=
rm (DT)
>>> [   18.817090] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=3D--)
>>> [   18.817092] pc : evtchn_fifo_unmask+0xd4/0xe0
>>> [   18.817099] lr : xen_irq_lateeoi_locked+0xec/0x200
>>> [   18.817102] sp : ffff8000123f3cc0
>>> [   18.817102] x29: ffff8000123f3cc0 x28: ffff0000427b1d80
>>> [   18.817104] x27: 0000000000000000 x26: 0000000000000000
>>> [   18.817106] x25: 0000000000000001 x24: 0000000000000001
>>> [   18.817107] x23: ffff0000412fc900 x22: 0000000000000004
>>> [   18.817109] x21: 0000000000000000 x20: ffff000042e06990
>>> [   18.817110] x19: ffff0000427b1d80 x18: 0000000000000010
>>> [   18.817112] x17: 0000000000000000 x16: 0000000000000000
>>> [   18.817113] x15: 0000000000000002 x14: 0000000000000001
>>> [   18.817114] x13: 000000000001a7e8 x12: 0000000000000040
>>> [   18.817116] x11: ffff000040400248 x10: ffff00004040024a
>>> [   18.817117] x9 : ffff800011be5200 x8 : ffff000040400270
>>> [   18.817119] x7 : 0000000000000000 x6 : 0000000000000003
>>> [   18.817120] x5 : 0000000000000000 x4 : ffff000040400308
>>> [   18.817121] x3 : ffff0000408a400c x2 : 0000000000000000
>>> [   18.817122] x1 : 0000000000000000 x0 : ffff0000408a4000
>>> [   18.817124] Call trace:
>>> [   18.817125]  evtchn_fifo_unmask+0xd4/0xe0
>>> [   18.817127]  xen_irq_lateeoi_locked+0xec/0x200
>>> [   18.817129]  xen_irq_lateeoi+0x48/0x64
>>> [   18.817131]  evtchn_write+0x124/0x15c
>>> [   18.817134]  vfs_write+0xf0/0x2cc
>>> [   18.817137]  ksys_write+0xe0/0x100
>>> [   18.817139]  __arm64_sys_write+0x20/0x30
>>> [   18.817142]  el0_svc_common.constprop.0+0x78/0x1a0
>>> [   18.817145]  do_el0_svc+0x24/0x90
>>> [   18.817147]  el0_svc+0x14/0x20
>>> [   18.817151]  el0_sync_handler+0x1a4/0x1b0
>>> [   18.817153]  el0_sync+0x174/0x180
>>> [   18.817156] Code: 52800120 b90023e6 97e6d104 17fffff0 (d4210000)
>>> [   18.817158] ---[ end trace 0000000000000002 ]---
>>> Our last tested kernel was the 5.4 and our analysis pointed out that th=
e introduction of the lateeoi framework (xen/events: add a new "late EOI" e=
vtchn framework) in conjunction with the preempt_rt patches (irqs kept enab=
led between spinlock_t/rwlock_t _irqsave///=E2=80=8B_irqrestore operations)=
 is the root cause.
>>> Given that many modifications were made to the mask/unmask operations, =
a big one from Juergen Gross (xen/events: don't unmask an event channel whe=
n an eoi is pending), is the BUG_ON(...) still needed?
>>> With the mentioned commit every call to a mask/unmask operation is prot=
ected by a spinlock, so I would like to have some feedbacks from who has mo=
re experience than me on this part of the code.
>>=20
>> I think this BUG_ON() can be removed.
>>=20
>> Are you planning to send a patch?
>>=20
>>=20
>> Juergen
>> <OpenPGP_0xB0DE9DD628BF132F.asc>


