Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6913587AC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 16:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107396.205319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUW7P-00045d-Ta; Thu, 08 Apr 2021 14:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107396.205319; Thu, 08 Apr 2021 14:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUW7P-00045E-QB; Thu, 08 Apr 2021 14:58:51 +0000
Received: by outflank-mailman (input) for mailman id 107396;
 Thu, 08 Apr 2021 14:58:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/ag=JF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lUW7O-000459-Mp
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 14:58:50 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::61f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5f8b85b-c7d4-4d05-8608-0671da1808d0;
 Thu, 08 Apr 2021 14:58:47 +0000 (UTC)
Received: from DB7PR03CA0095.eurprd03.prod.outlook.com (2603:10a6:10:72::36)
 by DBAPR08MB5574.eurprd08.prod.outlook.com (2603:10a6:10:1ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 14:58:43 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::a7) by DB7PR03CA0095.outlook.office365.com
 (2603:10a6:10:72::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 14:58:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 14:58:43 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Thu, 08 Apr 2021 14:58:43 +0000
Received: from 963b099f0f2b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CC13537B-6A00-4797-A93D-9918F15377DE.1; 
 Thu, 08 Apr 2021 14:58:36 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 963b099f0f2b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Apr 2021 14:58:36 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB4478.eurprd08.prod.outlook.com (2603:10a6:803:f7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 14:58:33 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 14:58:32 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0217.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Thu, 8 Apr 2021 14:58:31 +0000
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
X-Inumbo-ID: e5f8b85b-c7d4-4d05-8608-0671da1808d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g607njrYap1mWvRNzaoGJ8ohzB+gz8Q/k0DjxYQW3gU=;
 b=LqUJlrSXKpCK/2aimGZMbabKXA+GSqfYkxmI9ody+te9e6S3dPEfZTrkrqJcM2+u+wrusTMkJ21/bKEjmfVmzVeefl/tdOlzkpiTQAeEJzoeBwtMuVo+EUD6LLJLRHkelCULLpxyGZspXBA/KLQLaIRJEoL4ONrnZjh9ls55sY4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e8eb405abbefa82
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtCa+y7Z177JlzE2gDiWeQdwVV0MucyyI1i6pvur6npG3uYkAoCx9GfMlFzKlf5lTdampdNgnF6fcIlrqh2/f7qCz7cjZZA1mTF9YYu4fwUleJW54ew9mucvCrE2OCCgI1nn6rMLID2w4tZBvAsXd4kOiKG4iug+OeZBJijK+yLzs7qvp+OWtU0YyxQ7Ozfo0JjQVxLJpIsXhOhL4uQeSBHieIqOFkhB0+USwE68OTS0Y9SUfNKQPogYtWcdfSsfYA10QPQ8AhGkxFYDMaq1vTddDEcpiv+A3z30kkkqzOhdbFOB4auH0WIIAJo6VBI19tDOGHkQEZSQXRq+wtDSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g607njrYap1mWvRNzaoGJ8ohzB+gz8Q/k0DjxYQW3gU=;
 b=TsCxgl48FJXht3uiAXK0tDpl75iQJxQq/aUcuGKgCB9gbzDdKbekYjsGLwDjjn6U+R7HzKzkH0IKuBpxBPMTQ+co8O2A0kqzAArtTUlvraXoHMiJdn2fgQ1tk8I+PIphhsSdSWSsJs+vy9H/wUN81KrIMojCtOsMpEoY0lChSJfX2B/TVeWky3HHwVXB6a6C3ofhtK4h49UZgn73nip/ezMuRArWOEGgIsUOZxFd5OiOJbITFo/DDv1vQbIkpnzlR4algt7syyxW0K7Vk54TepvdGvOAk3o0jkXiRxjVltqtDvc7J//xJdgCUlt/TRWftfAETDsvWjtX3HNCS7hPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g607njrYap1mWvRNzaoGJ8ohzB+gz8Q/k0DjxYQW3gU=;
 b=LqUJlrSXKpCK/2aimGZMbabKXA+GSqfYkxmI9ody+te9e6S3dPEfZTrkrqJcM2+u+wrusTMkJ21/bKEjmfVmzVeefl/tdOlzkpiTQAeEJzoeBwtMuVo+EUD6LLJLRHkelCULLpxyGZspXBA/KLQLaIRJEoL4ONrnZjh9ls55sY4=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 2/4] xen/arm: Handle cases when hardware_domain is NULL
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <b05b29ce-263b-0526-61a6-679427305709@suse.com>
Date: Thu, 8 Apr 2021 15:58:23 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <05D1F0D2-99FE-4A05-97BD-16253E1F8902@arm.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-3-luca.fancellu@arm.com>
 <b79f363c-2220-f187-6840-23205ef37e1e@suse.com>
 <4F221E20-0ABA-499D-A810-4A2A4F20F17D@arm.com>
 <b05b29ce-263b-0526-61a6-679427305709@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0217.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::6) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26d5f099-cbf0-4de3-4752-08d8fa9ecdb9
X-MS-TrafficTypeDiagnostic: VI1PR08MB4478:|DBAPR08MB5574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5574EB7CC91E815F151E474DE4749@DBAPR08MB5574.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DZipk033k8yce9DNK4w89vbRncRvOIq7XNcqPeXJeN5wpFt+Mz3+Du0VTQnJzn0Wu1kn4ZPhtSjtfq+tXTmcMfBp4AF1FaMwis/EWlRa/CtRVZnTYA0q+F2oaEUeJaLCj5TWZH2oXs7HK8iJMmYzNHnCL6Y8rs3iCnTIH4k0OEAuIFWgIoIyYTkNFax7VuV8fUDjC6/Z30jKugZkrJ98tSPGATvYwl/wsDp5ifQ7+6lHZENxEcC+A79e0c/h4hRR33CkrHCbK4B0yy0c6ziVPhL+Iov+gMEtisWUnSApGEE5wFKdiSKhTXw/gQWsD94QWZ899V5DjsKPwMq4T7vQDny0FFBHA/8Uz0eitZMGUQUqdQZ+5AtKKfdoGpzwuHDiqqgWP/p6FB7/BwWvsYsvmNinqnNptlaffF8ejbWnB3dHcXCNgJ1f9V2ERH1JG1ixLjIRuKUoLDrZwaz14vLh5kSU2DqKTFwUtY2gtfFB3Cz1uBIuLo8QLzUv+9drKrSBeZAekau1KXg3YbVmNOmsr1EPHekisZFUJvjCKMitHIHx66YyVepraX9zSVeQqkpPd1/EWo6TnWXyuvGj+KY2iKb2c6JG8GVo1I9pPLrNJcNvj+cJ1fMWIn8XJWKkkPjrFrwIwryv5E3lLFpJTQHkJ6VfqIzvSYC6ZbHqOb7xAgzH+sokMmEYDt5F7xJ80/KgAdpJZq6b+xmAp1QQzxQz6FgHGLs2B78MTrHq/S/8W2o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(52116002)(2906002)(7696005)(38350700001)(6916009)(6666004)(66476007)(5660300002)(16526019)(66556008)(26005)(316002)(53546011)(6486002)(66946007)(956004)(33656002)(8676002)(44832011)(478600001)(86362001)(36756003)(4326008)(38100700001)(54906003)(2616005)(8936002)(186003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?bzIrbDRjcDEycVFMOC9vZ2Q2SGVPREsyMXN0N01BcWhBY000TjFaY3lnbmpx?=
 =?utf-8?B?SERzSDRPbVJtdE4yNWp4bFcyNUJ1Mno5TU9wMmdzWFJBK1VWSThTaGhDeEds?=
 =?utf-8?B?RjFRS3VkYXllZG1BMWhCL3lORlpZVURQL1hCbXNpZXFYWFhXRHU1VUpDRDNH?=
 =?utf-8?B?ZVZ5RDlqYVA4ODQ2cEhlajczYmUydTZFMWVBU3hLMVV6Y2ppMWNUeUNiQVJ5?=
 =?utf-8?B?dmtzUUNBZkJpK2RLUDlIcnQzWVpNc3pNdURqTW9iN2RVVWxjTFRVWGNBV09Z?=
 =?utf-8?B?bExEZ29RNlJwSjZIN1hDLytTWHhDMXdlcEp0VHNBM3hvTmFaa3p4WEtCaFJB?=
 =?utf-8?B?WFRJNDZpeW5HaG85K1VEaHhmOXQrcC82Q00wWTZGVlFiYmFGeXlpcXBuZ3JF?=
 =?utf-8?B?TkZjZ0pLQW4rU0V6Ny8rcDkwWmUzSktMY3hudlg2RTJnMkhxd0JWUEFtcnhT?=
 =?utf-8?B?dnpBRFVLUXIwUDlVL2d3dEtTMU9yZWFmcithSVcxQ2RuNTVHejRRa3l0L3R2?=
 =?utf-8?B?cHZmVTdkV0NpWkFIcEI2b01iRnBqZ1MydmdTQ1lIWlRQZ3Y5YSs3Q2FWbjRh?=
 =?utf-8?B?c0Q1RXMrNWhIOFVwQzFCMDE1cnZOL3RqWGVLUkZmaDhiM3VqUUw4RzI4ODJa?=
 =?utf-8?B?eDE3d3lXZUZtWGZJVFVTV3h4Ni9iSHRaOFplM3JmUUY2L3dUaFprNFFNREN5?=
 =?utf-8?B?RXNmVEx4QWFYZlVBVm5YZ3hUUFo3R3BOaS9STnZjVVVlaDZidGk2OW1JaTVs?=
 =?utf-8?B?UzBseUNNeFhadEF0VkZzTWZ1UFpSQjd1M0tqN214QmNzRVpJTjQxRjM3TkVS?=
 =?utf-8?B?UCtqN091MjNjNThsWmNRbWoxcEExaXlvOWhBK2JZVytrbkZOZXoyS0h6dEFr?=
 =?utf-8?B?VlJNakhRT1lPLzhqSTZLODg4b2RrNG1NMGJZd3BGV29IYmxIUCt0VnMvU1pG?=
 =?utf-8?B?d1lsOVRzdDRUVDJzSjhrNTM5Kzd6UGFZa2dOQW14UVU3ekFDZVhNZWpJc2pz?=
 =?utf-8?B?dFUvQlRJYzVzWVRVLzhQK2pUYVlsMTZSYm43bHBhVkk0TVVsMUU3QXNEZHRy?=
 =?utf-8?B?ais1NGpEckFQdlROS09Edm5JZVZZTFQzSTRaSGNTTUYra2NpdzYyOFRTOFJV?=
 =?utf-8?B?dlE3UzZScktWWWhZWExnWW9vN1FWZ3lxSWpoeXVrcEFQODhJZ0dzdUd2cVJL?=
 =?utf-8?B?VnFIRGRhTTBjMGZucmVvMDNsVTlpUHFzR0kzclJ3R3UzalNpMy9GRTRQTnlx?=
 =?utf-8?B?WXk4OTNVSmgrSGpydWhkTVhOc2xWYXNUa2tvbVVTcm5RS0hCNG5PNllvRzB3?=
 =?utf-8?B?TWFmZm95YW5SVTY3MEIzRHVveFErT1VnYzhRTlFuSXU2eXJpblhTNGVzQXVl?=
 =?utf-8?B?bWdWTW5JZktjZlNBalc4TUVzV2FvNitmUFBjdWcyVVZWanRmTFJvcm5uZUVk?=
 =?utf-8?B?SUV0RHAwbEpzTkMxUDZKYW9wdEVIcVk3aUtENHg2ZFRrcmhOY3dZRXZOdkxO?=
 =?utf-8?B?bFg3T2JSZTRwaGQ1c3dOV2tFbzJqbzlCTVE0VTVVQnVZYmZMWm5Od1QzSlBT?=
 =?utf-8?B?VGMveGVCUGhwTzJZUWxybG0rTm82Z240SFRja1RSZ21Zb2NsdG80Z2dQZjAv?=
 =?utf-8?B?MWhXMzRKMWtvbXNMQnU4K2U2SUJIbDFFZU1PcDBwVWxUWnVDbjBBT2F3TTVC?=
 =?utf-8?B?VUhDRlV5anptbWVLUnpPa21OeFVQeUY5dm1Lamk5RUNiNHh1TDQvdXFxUjBL?=
 =?utf-8?Q?yFwfSBYeqa+CmytDbRYZcYxK29GpqmebH6ELcKC?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4478
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4834f2c9-4cc4-42e9-7b10-08d8fa9ec6b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aXLDAjsoo9vcYSLTvnqkDkuiCx69o4vuaAj/sjjH7f3NggkBP6sb5ZgBcVByAOMwdRuPdIhxQ40++nN8j3ZghwMA0JHp3/bQxLN9XBoJ18+1DU8kZZ6IlbwTHyekdNvCwvytIN30OJWULjoHKRFKitAkT2llM08RkN4HuBHEw32PhOObjxkc6VViO4cAeFpIt9z0yqbW73KAmMRz6dGDL5/bHlDwVxQcjW3TIY2K1L1EF/Ly1Z/1PdTNEygnErtleUoCrUXzVeKhw1kX5ucyXkUsUEUFza/Rh0/MW2Gp31v2arLAf/aVoJUkP4goKslbKO5AeHnt7vEiRIKt1FouYfO5xjFwKWaM/zuYz5QqkXilRKCEslZ0gFopxA+T7hNuxBFzfXkkv/vUuZR+HSn3PM5+lxIL4Yq80JtrkF08shMgFOFciLLh4hQcNb2HAw4f0XlL9SaeH+HH+Gprw4zescpTu0SATIsIKaH5EX8fp4IFVJtXdOIBmXEHXUwWqsaQp/CE9ajwifArfVttn9mutPuB1uyJz9qfiBo8wwWpXIN0vgT5MfagCtCYVFRfLtOrqYJoh3r6Ui/4328Kq/C+c+98svw5AEO4qKQhbbUA2jMz+wh1lcw6HReOdMrkN8kuDvxCEZvBQKpYkxi4TKHL8Kq+tVmtQGWux1Iyr7jzoC4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(36840700001)(46966006)(53546011)(8676002)(81166007)(6486002)(956004)(16526019)(6666004)(356005)(70586007)(478600001)(316002)(47076005)(5660300002)(33656002)(8936002)(36860700001)(54906003)(7696005)(2906002)(336012)(70206006)(36756003)(186003)(82740400003)(26005)(2616005)(6862004)(44832011)(4326008)(86362001)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:58:43.6103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d5f099-cbf0-4de3-4752-08d8fa9ecdb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5574



> On 8 Apr 2021, at 15:36, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 08.04.2021 15:11, Luca Fancellu wrote:
>>=20
>>=20
>>> On 8 Apr 2021, at 11:17, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 08.04.2021 11:48, Luca Fancellu wrote:
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -308,7 +308,7 @@ static int late_hwdom_init(struct domain *d)
>>>>    struct domain *dom0;
>>>>    int rv;
>>>>=20
>>>> -    if ( d !=3D hardware_domain || d->domain_id =3D=3D 0 )
>>>> +    if ( !is_hardware_domain(d) || d->domain_id =3D=3D 0 )
>>>>        return 0;
>>>>=20
>>>>    rv =3D xsm_init_hardware_domain(XSM_HOOK, d);
>>>> @@ -705,7 +705,7 @@ struct domain *domain_create(domid_t domid,
>>>>    err =3D err ?: -EILSEQ; /* Release build safety. */
>>>>=20
>>>>    d->is_dying =3D DOMDYING_dead;
>>>> -    if ( hardware_domain =3D=3D d )
>>>> +    if ( is_hardware_domain(d) )
>>>>        hardware_domain =3D old_hwdom;
>>>>    atomic_set(&d->refcnt, DOMAIN_DESTROYED);
>>>=20
>>> While these may seem like open-coding of is_hardware_domain(), I
>>> think it would be better to leave them alone. In neither of the two
>>> cases is it possible for d to be NULL afaics, and hence your
>>> addition to is_hardware_domain() doesn't matter here.
>>=20
>> Yes that is right, the only thing is that we have a nice function
>> =E2=80=9CIs_hardware_domain=E2=80=9D and we and up comparing =E2=80=9Cma=
nually=E2=80=9D.
>> It looks weird to me, but I can change it back if you don=E2=80=99t agre=
e.
>=20
> Well, from the time when late-hwdom was introduced I seem to vaguely
> recall that the way it's done was on purpose. It pretty certainly was
> also at that time when is_hardware_domain() (or whatever predecessor
> predicate) was introduced, which suggests to me that if the above
> were meant to use it, they would have been switched at the same time.

Perfect, I will change them back and add all the modification we discussed
In the v3.

Thank you for your feedback.

Cheers,
Luca

>=20
> Jan


