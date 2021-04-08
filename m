Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D5B358149
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 13:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107176.204871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSRG-0004Yr-Ee; Thu, 08 Apr 2021 11:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107176.204871; Thu, 08 Apr 2021 11:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSRG-0004YW-B7; Thu, 08 Apr 2021 11:03:06 +0000
Received: by outflank-mailman (input) for mailman id 107176;
 Thu, 08 Apr 2021 11:03:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/ag=JF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lUSRE-0004YR-SP
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 11:03:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b03e4a4-29f8-49e0-859b-0a6a1b06ed6c;
 Thu, 08 Apr 2021 11:03:01 +0000 (UTC)
Received: from DB9PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:10:1d9::23)
 by AM6PR08MB3336.eurprd08.prod.outlook.com (2603:10a6:209:41::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 11:02:58 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::a0) by DB9PR02CA0018.outlook.office365.com
 (2603:10a6:10:1d9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 11:02:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 11:02:58 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Thu, 08 Apr 2021 11:02:58 +0000
Received: from d0537dae27d0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1050E798-479C-4BAB-B3AD-6DA4FD56934B.1; 
 Thu, 08 Apr 2021 11:02:46 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0537dae27d0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Apr 2021 11:02:46 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3552.eurprd08.prod.outlook.com (2603:10a6:803:81::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 11:02:33 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 11:02:33 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0025.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Thu, 8 Apr 2021 11:02:32 +0000
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
X-Inumbo-ID: 5b03e4a4-29f8-49e0-859b-0a6a1b06ed6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoOHmnX0gg8YRiRP8o155RWuUQDCfrPtauRDIXSX8II=;
 b=0n6vtD6+UrWhTRIpsk8aWUtmSFMAdTbZ2Q0Npikl/+UaCefwgZCeLbFNltfYxt54r+UvK0jx11SuVSSTJ/LcTG8Cyq2qqBmoqZC0quqpoqMXDv1G2F0Vx8i5clk+ifQxpQSCRyS7OA8jCPWKOQu2MWKL3m7CkutXWhE/h7g05rw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a84f0a21db27090
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XW9vqalHepihQXl6b4RvxO4J9oChtOpkkefBhGCn+uOKNmmR19fc+TDN7KH0QlZB0XRuKUSNYg6+PLvbXGnJdMOtqyefcA7l530tfV0LkrQHJjyblib38h6TuHdT9UF7DCCHQuUKdaMIGmKkHW9jyrEsIh2kdtoPoZ5Izcd6c4GQKovj5JCSZNpa8HeDK/hn9xV29MGZGTKYxW6p1vswMf74m2pfz0qbQuBYCktS5YIJJ5M5Xz9XthZzrZLrr2yxiSS6QtsnolFogN6ErR/wq0Sinf+CIPQzqxS/RgSFM7p7uYt4AcFE1tEgIQVEdSf/KxaHwIiph2RX+YDtZIZ01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoOHmnX0gg8YRiRP8o155RWuUQDCfrPtauRDIXSX8II=;
 b=RiW9OW5dN0oi90rTzKvDnLm1o9mOveZGaBN9vST7qoubLALRRhsNSJJxuGrnYeH1qTKMLkFmEJh5crt3cF6cW/yftVVj+PeJAVf29pLTZv1soOt6aBe20tmfky2AGA3imui2nz+1G1+63+DGeYfi2BMak6x9l3rPqLJWo+ijP4aEmx1LOaVzSDwTWMpq4uYYCZaHLlZtT7QdV680aOh7SX4DDJaFT20KUvNsuL319NXvYSjr9goU/XIEZyPTtBGtZiMB2BwECpbDHsy+RrsRPKAJBSOkEo69WtKemdny1MXaZNXo269fx8abRJIBKBAZ19VjGbc736TqlThRPBJVWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoOHmnX0gg8YRiRP8o155RWuUQDCfrPtauRDIXSX8II=;
 b=0n6vtD6+UrWhTRIpsk8aWUtmSFMAdTbZ2Q0Npikl/+UaCefwgZCeLbFNltfYxt54r+UvK0jx11SuVSSTJ/LcTG8Cyq2qqBmoqZC0quqpoqMXDv1G2F0Vx8i5clk+ifQxpQSCRyS7OA8jCPWKOQu2MWKL3m7CkutXWhE/h7g05rw=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2104071424190.31460@sstabellini-ThinkPad-T480s>
Date: Thu, 8 Apr 2021 12:02:24 +0100
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0931FDE-29DA-41B0-87AF-EF18ABDDA37E@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
 <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
 <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
 <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com>
 <5cad4ffb-44ec-4cde-f5bb-f59dc3ca59ca@suse.com>
 <alpine.DEB.2.21.2104071424190.31460@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::12) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73fecc57-e8cb-4263-dcb1-08d8fa7dde6d
X-MS-TrafficTypeDiagnostic: VI1PR08MB3552:|AM6PR08MB3336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3336B043BBE1CF0034CF6857E4749@AM6PR08MB3336.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B5GWiAQ2R4Eu+dMp9dwQBb4YRY8DDtvBkrtEg/UouuJj+JZtoIn37IemOGC2NEe32g02/Jsjd+G7I8VyQ6O53k+GyVmFyBEKubVJC/yjQaP1fDOE8b1FFAsEFLYrqitPGnw2r7NCpivOubSCpq0ospCheeJjaMpj5IcjjmDaQcOHymLu70ovOgL5EpDdVRNb0F/wIgGVTGIEcQVe6wmCnL9X4k6dUVQmJqdp4gaDO/TJaKYzLsCXeE9U3fOkNs7a+UfektQjP/qIly67ZaAy5CTBSIMVc5YjJ6NFngquwU8bXPOX+qXym5vzEojaebipUKfjwPUAzO6o1LKM6MjzKcYoPOECpFoV+78YNUhADZoadqfR8aNSVAGHcf5u7uIYUGTFaJfFeNAIKXkRB7GE/hHxuPd3LtEpSqg9oRXBFi2jvH5Iro+YCpOAszY4PWKMCMtSbEaAM5pZ3vAwcosJ/3I8mNL2tG2EorBW6qWlhaAanFaOIETVtAXQDaJ6Fn4y4Bq+2F2unEQjeEfEbVSwV7tySqSJgu4nRjZxJX9ZSw75J0SnWWZ+hbB9xaYL2VGhiQG5aBb5SD22tyVHJrrTmaH1lXDQKx08xO4lj4CRxm7Yj0gwfjpo2LmHXtIxxFh301widH9FsvvWm/cED8Cdmn4jv+uhj/vPd/gzccGRx4VUGn/pqeQjGIjaBiHayyyCGxULV6zosL9txXFgfXjLWw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(376002)(136003)(396003)(52116002)(8676002)(8936002)(36756003)(6486002)(38350700001)(6916009)(26005)(186003)(16526019)(4326008)(7696005)(66556008)(83380400001)(956004)(2616005)(66946007)(66476007)(38100700001)(478600001)(316002)(6666004)(54906003)(53546011)(86362001)(2906002)(5660300002)(33656002)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?NFB5ZlpHemNsWFhxOTJqZ3psV2xRTlhHY245a0tvbFlvZ0tLRW05ZWN2dUxm?=
 =?utf-8?B?ZzEySHpCMUcvTHIxRTVYblZJeXp0RVM5aDlFaUovcFR3STRkUk1sTVVjYmxG?=
 =?utf-8?B?STgrcHJIbkE0bVBxUStDbWd0cEM5MUQwTjRIR2xjdk91UjMzVFdTYTRRYWUz?=
 =?utf-8?B?Y1VJVG5mTlphbDVWTTR4Y0NVV1UwcHNCa0VDSW5OMTJMOERFWEkwa3ZHMHpQ?=
 =?utf-8?B?bGM2TWg3L3ZNdHhQZFRhb3JibHNXZTdHVXVVNko5YTRDUFA4ZkY5dCtUMnkx?=
 =?utf-8?B?QmEyVEtFRFZ1Q3plbEJocUlsUEhOb1ViN3V6VjdWeTJuMnlYUzZTMkxnMURN?=
 =?utf-8?B?UHhOdHc0TFpmQ01ycjlmNUlTOFF6S05PTU1OQ3JsOEk3dHdXRHphdE41Q3pW?=
 =?utf-8?B?eWpYTUtsZWxVVzZnVmZIbUdZcDQ0eU9sczBLV2FMR3lXSU96RElzRmh2R0Iv?=
 =?utf-8?B?aDkxTWkxc2VFSm05a2xRVW5leVpOdk1SbTcrUHRUNkZHdzJ4VmRTN2lpbGtK?=
 =?utf-8?B?a093VkpRdGxka1liOXh3eWxGbTlMWERzY2lVMTlUL05tNGJHOHVZdS9OK2Jh?=
 =?utf-8?B?UTI1cll6RWVJOEp2aHdHYUVGSmxuTzQxTDZ0V0drd0VFUlorbC9wdDk3eWox?=
 =?utf-8?B?eG42S3dhbTlOMlEvSVlpbEl3Vzl4dHA0UngzMURKUmJJS28ycDJwbGlMK0NT?=
 =?utf-8?B?b2JMdnhIVTFrVm9OMlF3bzB4TjdLRE1OSk5JVkpLKzNDeFRJanNKVnc4NUlW?=
 =?utf-8?B?Z0pTSGVhZStRNFVIUlVhdDNsemJObmdKdGZlRW1rK3R1QUQxZmhzb3FSeVgx?=
 =?utf-8?B?NmpXZ1FJaXh5YlBlMlFCVXJNLzAwNVl6cHlDN0dmUlZmUkI3bDNvMWJZRlZ5?=
 =?utf-8?B?NE9FTXVXUnh3Tk5mK2gvbU11OHc5UnFnOG1CU29nVWtvVDhKZExIUFg5MXZa?=
 =?utf-8?B?Q05yWm02OFJHZElac043WmRWQkcyUHBHK2R5L0crVXRRdkNtRHJISElUeHhj?=
 =?utf-8?B?K2dIejZ5WjBScUE0WFFOY2JFSXl3Ky8zSWwwVUk3ZnBONnpjN2dNR09Xbk5W?=
 =?utf-8?B?N2lYM1UzRnVhbTVvWFpybVF3cnc5dXFiQVJjS0cyQXlsdGd3MGpjTUQvN3h5?=
 =?utf-8?B?VVdmZmVDa1hFUzJESXUrRFZkREJRVzdTSkU0ZUFWT2p1N2xnQXFKRlJoSG5a?=
 =?utf-8?B?Q254N1hUS0xnV0dzRDNGQmVxZ05xdTBiUE12a3Y0YWt2K3o1YmJFWFFDQlpO?=
 =?utf-8?B?QWdHVFNaU1FPRGgycTIvZ21aaTJpYzBpTnZPWDdNTFhiSGZXbUVWbUFBdnVp?=
 =?utf-8?B?blZjRkR1TW9TV2dFV0dFTVpwNDlKSlJkOHYzbFNhUEhsMzR6V1ZldlIvQnRm?=
 =?utf-8?B?SCt3OEVrTmJ1WXZSZGpqa1lyc29HS0s2U21ML2pwUUtyU2I3L3ZwOVJqYk52?=
 =?utf-8?B?K1lpOG1sdzFIekVYSzNITW1nb0dZRzIwbUJiT3hTSkVmTFpZa1hkOEI5ZTV1?=
 =?utf-8?B?djhBWlpWaW1jZ282Qm1VSUd4MUQ2NGNXVVY4N1dvYlVtSXQyVnI3Y1lzelNv?=
 =?utf-8?B?QXUxLy9UbDF4Mm1CaXhiNjV0WTVtekRja0sxRFBUbDZ6bUlIRjFDWFlhMmRL?=
 =?utf-8?B?VHBINlgzMVBEOHBQQVZnM003VWQwZkQxR1BCODVGaFdybFI3MkFYUkJlQVJk?=
 =?utf-8?B?a0pjazZkVVpmNTErNk5PV0dRdy9RMUlxWDE5Z1NzeVpZMlRtVlBNaXJZVTBw?=
 =?utf-8?Q?IDer0FogcsX+n5ZPfxbOXqcpoT4of0zJ7dMoLKT?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3552
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8902b1ef-1f2e-4363-fe63-08d8fa7dcf9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rRO41LCz7vNA8D4XvGTat9D5ABP6fSkJAC7ld9YYYGxSTjHpe1Y+WPXR8AaP9ll/mHGjY5vuS0IUpvK1Q/b7z0fIGHD1hyMHqxRVB1jVf802IK/b4utQ+aMQu/ofZoCjtR+iu/GDVUND84X/3/VzlJaUdthwYnGZxl6Wdq/EBbGQN01xlGomvoHzYjKKG7QNctXmICD6FD3LJZuKxGXYuV3E3BfGRcDI43eIdeER/8dbo0ZYEMspAsyy+AxQwby5MUDP/9xhhXAQAVCCylkjRNmr3hEo9cgF8qBaugXSbOthPb+iJrJGGdfQryEtMjm4ZbWS5wVGQScibbD8J+hlHC2RjHYMhi2hMCv5UnNyWu2PjTLRBxstFoAT+Gf71XdauLsn+96hK5PG+4rmVxweyCD0ZAS4GUU3gaSIu7wZ6ndhWDazbWERc0JKZaZ3lcm2aSlUw661UHdIwOboETXFI0xUr4dy9rtnay6wc89q44VvAkB1P6eu+i8lLc+FJAHOwZp43hBLKffq0LteB+n8TvvIM4+sTsxCbCy0/QrL+wqSijN0vVknWM5zsXzgtIi7rPYs2wRa66pWOaWC/AFTlcjH8doqyN+PC5fN0wnekCMCjM35yLYS/YRbdKop0O+I8+NKnTN/dSXSdEFhurVlk4TD8Fmi2fGM9ptEcAyYFCY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(396003)(46966006)(36840700001)(47076005)(16526019)(82310400003)(6862004)(6486002)(36860700001)(36756003)(8676002)(82740400003)(186003)(5660300002)(7696005)(26005)(81166007)(33656002)(8936002)(44832011)(53546011)(316002)(6666004)(86362001)(54906003)(2906002)(336012)(83380400001)(4326008)(356005)(956004)(2616005)(478600001)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 11:02:58.2428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fecc57-e8cb-4263-dcb1-08d8fa7dde6d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3336



> On 7 Apr 2021, at 22:26, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 7 Apr 2021, Jan Beulich wrote:
>> On 07.04.2021 10:42, Luca Fancellu wrote:
>>> Just to be sure that we are in the same page, are you suggesting to mod=
ify the name
>>> In this way?
>>>=20
>>> struct gnttab_cache_flush {
>>> -    union {
>>> +    union xen_gnttab_cache_flush_a {
>>>        uint64_t dev_bus_addr;
>>>        grant_ref_t ref;
>>>    } a;
>>>=20
>>> Following this kind of pattern: xen_<upper struct name>_<member name> ?
>>=20
>> While in general I would be fine with this scheme, for field names like
>> "a" or "u" it doesn't fit well imo.
>=20
> "a" is a bad name anyway, even for the member. We can take the
> opportunity to find a better name. Almost anything would be better than
> "a". Maybe "refaddr"?
>=20
>=20
>> I'm also unconvinced this would be
>> scalable to the case where there's further struct/union nesting.
>=20
> How many of these instances of multilevel nesting do we have? Luca might
> know. Probably not many? They could be special-cased.

There are not many multilevel nesting instances of anonymous struct/union a=
nd the maximum level of nesting I found in the public headers is 2:

union {
	union/struct {
		=E2=80=A6
	} <name>
} <name>

I also see that in the majority of cases the unions have not meaningful nam=
es like =E2=80=9Ca=E2=80=9D or =E2=80=9Cu=E2=80=9D as member name, instead =
struct names are fine,
It could be fine to keep the meaningful name the same for the struct type n=
ame and use the pattern for the non-meaningful ones as long
as the names doesn=E2=80=99t create compilation errors?

Example:

struct upper_level {
	union {
		struct {
	=09
		} meaningful_name1;
		struct {
	=09
		} meaningful_name2;
	} u;
};

becomes:

struct upper_level {
	union upper_level_u {
		struct meaningful_name1 {
	=09
		} meaningful_name1;
		struct meaningful_name2 {
	=09
		} meaningful_name2;
	} u;
};

Doing this will help a lot the documentation side because the html page wil=
l show the "struct upper_level" with inside the =E2=80=9Cunion upper_level_=
u" and inside again=20
the two struct =E2=80=9Cmeaningful_name1" and =E2=80=9Cmeaningful_name2", a=
nd from the point of view of the developer it can tell her/him exactly the =
name of the member to
access when writing code (apart from the upper_level_u that can be accessed=
 by u, but we can=E2=80=99t clearly change it).
If this sounds difficult to understand when reading, please generate the do=
cumentation and have a look on the page in one side and the source code in =
another.

Moreover the change should be back-compatible since we are not changing mem=
ber names.

Cheers,

Luca=

