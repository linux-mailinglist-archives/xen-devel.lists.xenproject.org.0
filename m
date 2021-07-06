Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE223BDBFC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 19:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151569.280120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0oZk-0006x8-1d; Tue, 06 Jul 2021 17:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151569.280120; Tue, 06 Jul 2021 17:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0oZj-0006uF-UV; Tue, 06 Jul 2021 17:09:35 +0000
Received: by outflank-mailman (input) for mailman id 151569;
 Tue, 06 Jul 2021 17:09:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cLt=L6=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m0oZi-0006u7-Av
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 17:09:34 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ef9c14e-84d4-413f-ade1-179caa131719;
 Tue, 06 Jul 2021 17:09:32 +0000 (UTC)
Received: from AM5PR0701CA0006.eurprd07.prod.outlook.com
 (2603:10a6:203:51::16) by DB9PR08MB6411.eurprd08.prod.outlook.com
 (2603:10a6:10:261::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 6 Jul
 2021 17:09:26 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::da) by AM5PR0701CA0006.outlook.office365.com
 (2603:10a6:203:51::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend
 Transport; Tue, 6 Jul 2021 17:09:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 17:09:26 +0000
Received: ("Tessian outbound f29a5a293366:v97");
 Tue, 06 Jul 2021 17:09:25 +0000
Received: from a35f8c5e8f59.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3240F6D6-0BB8-462F-9229-30B6B3DF07C1.1; 
 Tue, 06 Jul 2021 17:09:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a35f8c5e8f59.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 17:09:07 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.28; Tue, 6 Jul
 2021 17:09:06 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 17:09:06 +0000
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
X-Inumbo-ID: 7ef9c14e-84d4-413f-ade1-179caa131719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ9cftBAebo4tPMCdQCthkL6pet0xRYEw/nEmrkHaf0=;
 b=j8RftvDtFLtMgxRl+q6dS2uho07CgpooDGI37e8ZUtti/DFS+g06TJXtohIjtRL1VfxfnvBQnbSbuvKNHb7ekZmjBIpX9fx2og97b2h/ajz0WMefWvg2S/5gnEfu92fZEDx2jOPRnPQe6nIrP/xrMjMTgLxtGjPZfU7h1xEGMSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d378eef710450a2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJqxZ9XqWFY2oh7CX2jtrTwjqbTa5+X5hv6hGWU03w6eI63DLE7csNeufRuYl2UM+FX2kuVT2NBZArOc9m+O8879heyXyBQBJPI8eKVwuBkOtnp2+KqrBy8eD+jfIiv/8ATAyIkBSdblzA9iXgHc6xePs1w1JnjDXs4KW+u7MtuK/6RD4A7McfYMSMdLBv2GzU/KhS0FElyygGUnfmhKxQfG1IPHti2ABgjiixq2Sv7Nv7pHTMWi2zplSHn+kP1l4LAAmoyvvSVotZEI1nH4mwEkdmmTM0bR4x48gT29dR/qzPPlrSuMhVM/Zj3HqYLR09KAIB4kLuntQjzn1RLNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ9cftBAebo4tPMCdQCthkL6pet0xRYEw/nEmrkHaf0=;
 b=f1U4rp2vnRxRpnEIEljdaFZMSVmLMgxWCFP6TkrWjB83ruZgToPeBhvhnnE3vtYoBcH25d9LI3vEYHo2ts0t5RMclrG2dhvBs9Btx5PZCEQQsBcw6te16Tc2hcL+SAfrz+5hFnAGtDI4roUhNb0hfuQIze9yzZX+vyNRVp7oQNuJ9oTWpJWwpN5jIRzINRVxUDX+zbmTepCJ7wUIY8I5t5vbDuAKV47AlfZpb1pXCCR701R6cLO2jTtISixO3w9dfbP02XWA79JiDsvRcSXxQVdK44l2L4HcYSriOkECsJUE283ccSIWRUW9IsB2JsGOb8k1GnX7RjJAq00yXBjrbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ9cftBAebo4tPMCdQCthkL6pet0xRYEw/nEmrkHaf0=;
 b=j8RftvDtFLtMgxRl+q6dS2uho07CgpooDGI37e8ZUtti/DFS+g06TJXtohIjtRL1VfxfnvBQnbSbuvKNHb7ekZmjBIpX9fx2og97b2h/ajz0WMefWvg2S/5gnEfu92fZEDx2jOPRnPQe6nIrP/xrMjMTgLxtGjPZfU7h1xEGMSQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Switch from kzalloc_array(..) to
 devm_kcalloc(..)
Thread-Topic: [PATCH] xen/arm: smmuv1: Switch from kzalloc_array(..) to
 devm_kcalloc(..)
Thread-Index: AQHXclVEDxOOzv0NIEKGiChMKv1YoKs2LpKA
Date: Tue, 6 Jul 2021 17:09:06 +0000
Message-ID: <8E88EA39-0B01-4924-AD85-AC375E1D7A85@arm.com>
References:
 <2c611dec5f1dbd6040d7a37d2d72ad2fc66e113f.1625568432.git.rahul.singh@arm.com>
In-Reply-To:
 <2c611dec5f1dbd6040d7a37d2d72ad2fc66e113f.1625568432.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b64a8a07-e215-4054-efa6-08d940a0cef8
x-ms-traffictypediagnostic: PA4PR08MB6111:|DB9PR08MB6411:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6411D4E6551D90F64902490F9D1B9@DB9PR08MB6411.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5MC8cHlHkjiCpCxFWxOxzCNpKOjYoFkEzHUpBQfVGJpLf3vx0rYE1t1rab8z1SQ+AovOMB+sDFqAHQApvsbQct4qdeo8+k4MPnH7kdN2K715HaRzEpXVDJXhyHRfMt6kABKEzLaRZrwbNX9pl9AGiEIJbLCjVCrZodo3MuKMe59SqWIKKx+F9Pk+naos6hNhORhpw4edn3h+wiMtTghjoH4jRSBLd75RTxmh9oYBkNXTuiEjieHBHRFd8hWdgmHQappmJa9728X2HGHEZ3JvF+yiid+Frkgoo1wkpclLcPJnlA1ATeitEIECSDKBodhcqXLw8ibFVaBwwLLUGywW99+lN9d4WE9k8hD8VVop6LB0QvYvtzO6KFdrxgffmjfxN0BD50kFfa1rj2BG9OXXJ8M/42/eGqquaXYLKKpfQ+LYoHZizI7792P2Teu91XfuY1Zot6UqYRH9SUwvSQMnky3wW2hIHOBflgZvdbVXz7JvFHdseMH+qW3sa4hdOT3Qjo9wIx3QL+zzGxf3XxMdlag2k47zEEZ3HmEMRr4WQjbBcjNZjJY1v42iHKkGcAXrfnuEdFfma53yOqbKFZZA9MeiFWiKxWPaQxKOToN8AHJsWWpv2a3emqzNFKyjyksYmUheQ8P1XAKOxGxLGTiLZi7Z0rqzpTMGNHv4lmISxNWGKzF/GYn2BFGvfPttXMmoJNkIYzdGPguKykRX+i1QtA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(4326008)(71200400001)(91956017)(33656002)(6862004)(66556008)(6636002)(8936002)(6486002)(76116006)(86362001)(2616005)(83380400001)(8676002)(316002)(2906002)(37006003)(64756008)(66446008)(478600001)(122000001)(5660300002)(36756003)(66946007)(186003)(6512007)(6506007)(38100700002)(66476007)(54906003)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JYuK0jNdvGlIC3F2pkKUVkrJGP+MQV8ZjNdNm7i7FXFmvIzQgtHfCBWmGpZj?=
 =?us-ascii?Q?lkTkmebdTBPzlSqOF0Nms0kjN47vdqh4rPhZriYhAJ1d93QZq7F5o4M83MrR?=
 =?us-ascii?Q?5o4ipqul4JWZmttI+cxiFyB/izPCwbXLHElnAv6ahqs/WzhhO0W/iSMyqwCj?=
 =?us-ascii?Q?peCxwGdEod3HrE4+3yqHPBVY/UYHJ9CqbALn3y9QqW8zoQOzzJPaLCKkwDDm?=
 =?us-ascii?Q?hZh7qF0eqUhCWYqwcbQXL+YiNA2R7CmK/tSCvM2zMkpvEsTA8+tQc7v9+u0f?=
 =?us-ascii?Q?gfTT8tbWdiA5ATFnUIxpNJbWjvsAWr+p3GOgUrrkeXVbO9ouMYk2dkro12mO?=
 =?us-ascii?Q?u3YLKEWMRBILdlyRlgb9VK4KyxVjrUH00KVdgNmwyMCjYqSPI+HiEjkPvDfh?=
 =?us-ascii?Q?doYVfEb2X7lzaG9F/3Xen6FHX0h6JGdndKnT2Z5oel24lwpq4N2QMWk/tP5E?=
 =?us-ascii?Q?1fwyH7tcUGue3ft7ElbT3pQc8K6Y0kK1MbMES4RnYji3JZpRJ4lS9ggn65Cx?=
 =?us-ascii?Q?qHApts9CeaARTsG2JIRcpQQeXVAbIA/h1xf0EiOn+AD+Hjd6oSh/Yh+azDBQ?=
 =?us-ascii?Q?xKhsd6/atlUZIWd0VZMXGJ8WRraPC6vQIJY1gH9dHz7wuuhR0BSJzTxQKifc?=
 =?us-ascii?Q?a+owJHqxP7f7uqOz5jCPjTXMwebPqb/HZwa7mLPWtdATzPGgZ9wI5eHleYAq?=
 =?us-ascii?Q?d54Tz2CVqnwDb7fBQubpIbWCWzzaVjqSCQJjN0KnQuUNYIoZ0odEN7rrusMk?=
 =?us-ascii?Q?WZhAabLsMJjhXQksXU8B1KwjyhwEHBtWMT/6YzY2OqbBuC+ZCbTDENci8J/w?=
 =?us-ascii?Q?fmiUZXfoFTu39aq8Qzf8XIe8yN3+w4xprR1vilLnZXzV4ajD52v8Nnhe74Rr?=
 =?us-ascii?Q?5ojaekx6sG/EdATIgsJb85ZsIbtidr/botIM9lqQuv1NluXihfvJgjWG/K5j?=
 =?us-ascii?Q?Yfgqky7ZH5fx61aAFIeHdBZUtanuXK1SlwehSDBiJMW+dmAHcWthv0RV2rEi?=
 =?us-ascii?Q?F721iC+RxV5l81CW7tFL6/Wfh3Imh/WVUHKpW/3z7scf/sHH6jR81k0SXix+?=
 =?us-ascii?Q?5/dnIqjN4DFxVCwZ65mcmM5/Rkhn5ZzgJCVEjt6RV7k87R5TiY7bW/7HTbQq?=
 =?us-ascii?Q?oay4ymumKuo13V9zsW1SYE8zgENbVbpgCjnub5gFnk3qk2MnyzGXO3BFj4cQ?=
 =?us-ascii?Q?PrGSUHdbSUHwKWnXPMw/2gfdJEs8IXv1eCe/eEvkjWWr8GuNuErS38JiddAB?=
 =?us-ascii?Q?gdrFC5DtPY9evriej0/t58amct4osZZzKmtX8cHZqfA1olZ50MV/cNbEuyuh?=
 =?us-ascii?Q?NJIRnjDFOO+MZEByAdHJdW5b?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <361A7D8BC1581D4387AB1D98FAA18A6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1af8b6ef-8037-4308-6c30-08d940a0c38d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6sAuqVeDdzQ5N/V42SKCmjHTJ1ock4c7Ylsw/gzoYenMbJCg6VFrgdSOZPWCjUD8rPv3KTi8WkltypLtwtwMJ5vcSIOgFdpexr3tUU7AWyI/cHtgRve3Rik2omKpmmKwRZ4k5prjoB7y88tMpF89iUsKtqNb3jsF4M2QS+tRA20ArsyL2zF6asF7Xs5mhxG3wf4k/Us7WqfuAr4NDyRtYTE6X0VEK4UkOXgljIprVMSoBMdXO5LEq0kz1EOJ12Fn8lMzBKO2yh3KR4LOoX9L3OV/rE/4sw27R/OHMTKBqAjm0nBrB6pW34PhZT60QN+cGYsqDr1IKtAs5EQ3iZTN/m9DNwdM/b7E8qd5fVajNcDfwVJoYANfhPafUI49FX32pvKyMgXdABIfdTlx1TkstHao3daiKmmHjNILz/hgLS2ERQ8LqMgOywXGNinWmIHQ/Z3mKd7IyQLd1NJhnbcPCjQnC0K6wwYzZ3jU7CzaUvQ9pJamvYdG4vyFgvd0z/7B1DoLAH4N1gKof1qhk24o5By5z92TJVnavPhkStYVyruUsCRcNErgipd/1Jw6Lz2mcwJGs8TPYCGfLRPmUwvbnbxXTEAz6qe0nZ/j1CG3fhID5Oxib0kymJtrs870JQpq1JAnSe840+zaolIrD4UUneUOdbiJgkpoUAf9rIcOyMKrOJC417OavyA3woLX7hvjBWMjz7N0NvfyJ4c6TY1Gfg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(136003)(396003)(36840700001)(46966006)(8936002)(54906003)(4326008)(70586007)(82310400003)(5660300002)(6862004)(478600001)(2616005)(6512007)(6506007)(107886003)(53546011)(81166007)(86362001)(26005)(6486002)(356005)(186003)(336012)(6636002)(37006003)(36756003)(47076005)(8676002)(83380400001)(36860700001)(316002)(2906002)(82740400003)(33656002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 17:09:26.0381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b64a8a07-e215-4054-efa6-08d940a0cef8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6411

Hi Rahul,

> On 6 Jul 2021, at 11:53, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Switch from kzalloc_array(..) to devm_kcalloc(..) when allocating the
> SMR to make code coherent.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/drivers/passthrough/arm/smmu.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index da2cd457d7..658c40433c 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -149,7 +149,8 @@ typedef enum irqreturn irqreturn_t;
> #define kzalloc(size, flags)		_xzalloc(size, sizeof(void *))
> #define devm_kzalloc(dev, size, flags)	_xzalloc(size, sizeof(void *))
> #define kmalloc_array(size, n, flags)	_xmalloc_array(size, sizeof(void *)=
, n)
> -#define kzalloc_array(size, n, flags)	_xzalloc_array(size, sizeof(void *=
), n)
> +#define devm_kcalloc(dev, n, size, flags)			\
> +	_xzalloc_array(size, sizeof(void *), n)
>=20
> static void __iomem *devm_ioremap_resource(struct device *dev,
> 					   struct resource *res)
> @@ -2222,7 +2223,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smm=
u_device *smmu)
> 		smmu->smr_mask_mask =3D smr >> SMR_MASK_SHIFT;
>=20
> 		/* Zero-initialised to mark as invalid */
> -		smmu->smrs =3D kzalloc_array(sizeof(*smmu->smrs), size, GFP_KERNEL);
> +		smmu->smrs =3D devm_kcalloc(smmu->dev, size, sizeof(*smmu->smrs),
> +								GFP_KERNEL);
> 		if (!smmu->smrs)
> 			return -ENOMEM;
>=20
> --=20
> 2.17.1
>=20


