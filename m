Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05D330D26
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94844.178672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEmR-0003ia-MT; Mon, 08 Mar 2021 12:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94844.178672; Mon, 08 Mar 2021 12:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJEmR-0003iB-JC; Mon, 08 Mar 2021 12:14:35 +0000
Received: by outflank-mailman (input) for mailman id 94844;
 Mon, 08 Mar 2021 12:14:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C5Iz=IG=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lJEmP-0003hq-Oy
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:14:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee6bbee4-1afb-4eb3-80af-1196df8acf8f;
 Mon, 08 Mar 2021 12:14:32 +0000 (UTC)
Received: from AM6PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:20b:f0::34)
 by DB7PR08MB3481.eurprd08.prod.outlook.com (2603:10a6:10:4b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 12:14:29 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::25) by AM6PR04CA0057.outlook.office365.com
 (2603:10a6:20b:f0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 12:14:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 12:14:29 +0000
Received: ("Tessian outbound 155e15b2e217:v71");
 Mon, 08 Mar 2021 12:14:29 +0000
Received: from 540b01177768.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36B2840F-6785-452A-9EC4-9C57E8E45795.1; 
 Mon, 08 Mar 2021 12:14:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 540b01177768.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Mar 2021 12:14:23 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5775.eurprd08.prod.outlook.com (2603:10a6:800:1a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Mon, 8 Mar
 2021 12:14:18 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 12:14:17 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0057.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:153::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Mon, 8 Mar 2021 12:14:16 +0000
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
X-Inumbo-ID: ee6bbee4-1afb-4eb3-80af-1196df8acf8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S+hWfonz9GGee1X4K5rfXGzo+F3fnGRj2XlxlRy8rw=;
 b=Z7wfsYnG4MK9yVm8jIdjbsHtto44KRfAmz4cJMZIqk+TcuozDTmyeHJfZPFGZCXjUP6GVFPkv7qk+35u9H3moThP5cmuLOjIOfHccLeG7jaCwR6vMROmrY6IHOfKBAOYBiRYlbxTC9pKsK7NXG5WrgZf0XL+1YP9KIZkh747Zok=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e10be941d084ab53
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoeI1r+g7wrICtH9OjVXhahkk+KKjVK/AQzmTBdnTMh6od9jC1ogIh+bSHRgizF4do6WUEVcjxtAsOEOZa5VoO3QYIPJ6sFdNUFioA6m3NWCQxNdZekgXye1chkSIeKaFIs6ZUAaIbPGwH92qGRzIKrKrdhZ0pswutGMeuPa7g+U2pHJMYfa5eJi3YZ4OD49ExlXrfS48k2WFaO8A46wm1YUlFnLN2VOIvcap4+PQyFdLTJBLZOleo5bOR9wudYrwCD74m9ErHJKq8yRR/eD7LfF+QOA53JlSTve0wXj3cIxhBBZGdN/91VnrZtbj4bZwzduOXLkBUaw/tD5LDIRXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S+hWfonz9GGee1X4K5rfXGzo+F3fnGRj2XlxlRy8rw=;
 b=l+qonOSs3X6G5sEhkgtBhldEWFCBj4onYQUoXPP+mJhcGmLasy2pLzaYgc+0RypZ2/m+K3EJOdhyUKttA1ZkVfX4LN2F8fkTjHkOkXP3V+5zwbHO0umHeuqZLL0ZYZkCQmTzzFuJhGNgSGNosBP8bmb03XQtLum25oB8LODsKZz4zeYavyUgXk8HZR9IdUjD+/WhrAsAUQ9ZMy479O3qITdIkgoJTwOm6iJzC7vWU38xes5IglmwuxA6FIJHObPZK1NYLtjg8rihS6m0nuwMh5ftiEOSOYyJIRssXxGoVHsE//gwErzztEPi9PIvVIV7yWVTWC22YDgpUsivAKuwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S+hWfonz9GGee1X4K5rfXGzo+F3fnGRj2XlxlRy8rw=;
 b=Z7wfsYnG4MK9yVm8jIdjbsHtto44KRfAmz4cJMZIqk+TcuozDTmyeHJfZPFGZCXjUP6GVFPkv7qk+35u9H3moThP5cmuLOjIOfHccLeG7jaCwR6vMROmrY6IHOfKBAOYBiRYlbxTC9pKsK7NXG5WrgZf0XL+1YP9KIZkh747Zok=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <badc7db8-357d-3139-400a-c02fd6f29f6f@xen.org>
Date: Mon, 8 Mar 2021 12:14:09 +0000
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F80EEA5C-4E6B-400C-A88C-FEAB5D9F0645@arm.com>
References: <20210308115610.48203-1-luca.fancellu@arm.com>
 <badc7db8-357d-3139-400a-c02fd6f29f6f@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::8) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5f64dab4-347d-434a-04ee-08d8e22bb977
X-MS-TrafficTypeDiagnostic: VE1PR08MB5775:|DB7PR08MB3481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3481A398847A1602CFDA82ECE4939@DB7PR08MB3481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x5NoGOX+m8JYbh3Jr1i1Qd0yn3Yztawp9ExyG5Z/aAwgO39QnaXPOkDIrEGiUzNI0C8m+59GOx9zRCPUyUE0lf1Vq9OZkAVLH4Ercz7M+8EhskOl5SfMT+D2wmiPFF3UMupggtm/rHIKRHf6Dd5X00vTD4BDsOx63Gek0zwSS4ssdkl38zsgMyGTEa4sUG4JbMiac+ShE4Me0sXxg7zIm3pfuUZ+0mwUB9rL1Mk9RHxQk19fzLmJR5DENJkNRM+2vqVbpcx9lspuCLBaAcwgIjNFS+0tc59Ca1Os8keq4xuEU59ASggMR16SvzP6a+9eJVC1E/vDB4X0zo8p3//cmzUqGwv4cw5Rqv5ZkxoqIwd778vmkTR3TvqJX4EkCTTnfhqUjJ7kn+Cbf1ZkXt32m2OyvSWcq7N94iO+e2wMEebFdwFonPpN1/clo0qqaz0c/2tKlqk5ltu1STnS/g4RRznQE44cy5WNoQh8ydiKj7AlRWVbRn+ycu1M3kvhxq7hmrMbMat9nJi2kxj8wF+8XgdDSk9RmnDhRgVPXUnme+lp7PGhr1FWZo+324JadDkoq+7qCDrTPdvAVVdIiU9eZEo6Lu1NqrSNgiqWDuGFR54=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(6486002)(16526019)(2906002)(44832011)(5660300002)(186003)(26005)(6666004)(33656002)(4744005)(86362001)(66556008)(66946007)(53546011)(66476007)(54906003)(52116002)(6916009)(7696005)(316002)(8936002)(956004)(2616005)(4326008)(36756003)(8676002)(478600001)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?NTFUSHlkSitrSXZDZU1rbTFJMWFUOEJidGNwd3pJR2g4V3Ezcy9IRnpDRjY0?=
 =?utf-8?B?KythdmcyMS9hTzZlNGpkSjkzRmdMWUd3VS9DaFF5bDQ3cUQ5cUZEMGUrNFhs?=
 =?utf-8?B?bEtLV1M5QlZ0NGlyTnpYOVE5UXRWN25pUDRTQW5MWXd4N1BkV2hQeExXcmQv?=
 =?utf-8?B?a1hlcFAxUm9iaWVrMmlRVWNHRm9WYmNEWmorUVBFNXY5VDFuWWdnRUN3R05i?=
 =?utf-8?B?Q0kyRWx3S2t0M3M2U2R3RTg5TGkxZWwvL251MDk3MkxKeE90Wm51MlNKYVlm?=
 =?utf-8?B?Mi82NEx0S1crdlpWVDlhYXZ2akpCcnFqdEh5Sk5mTjZhYWNuc1ZEUFE0N2NY?=
 =?utf-8?B?cVFyWWdkYXFPc0FPdVlrbC9xbkRVTTE2WXZ3Rm1tV3ZsdytDeFpUUStGdkVW?=
 =?utf-8?B?elNhYldYN2J4OTY5T2dud0VST0dnR2dIaGxWRWh0MlplcGZqZ2tNRldtT3Vt?=
 =?utf-8?B?anJvOEhwWjNSN1hqSmN3aytpZC9LbnVQYjlTR05kVGVXdWQxaE9kR2hpNm4v?=
 =?utf-8?B?YjUreWJaTzRkd0dkQXJBTzBRN005dDN2aDVwUUFFbUF4N2tHdlVZOUh6REVT?=
 =?utf-8?B?NFRibVkrM3c3ajlISCs5STQ0VGVIdWlPRlh6Y3pZeENzbzdjTFpuQmswd2wz?=
 =?utf-8?B?a2ttdGhZbXhVZXhDcmc1a3Q1MnZjcmRodVh6UC93VU5MaXdxV1hrb2R1ZE1v?=
 =?utf-8?B?UkZETUJzb3JCaWkzVkJWdlhIVTNNaitjLzI3Wk0xUjF5STlIdUtNNFNGMG1B?=
 =?utf-8?B?bVMvRURHZHZ2bzNPaFVOUEtlMml4aXdUc3hwK05wNkZCdGJMNjg1SllheDBP?=
 =?utf-8?B?OWJpSGR2Rk1PZE5td0J6aUp4R0N2c0dwdDlDaUxYbU14dzlZaWV4SmR1Tng2?=
 =?utf-8?B?YU1rcGx3Q0dtdmt3TDVXcDBwcWc2S1ZoeCtWNWJiOUQwOS9OMTlwY0szd3px?=
 =?utf-8?B?ck5BZisrVG1EREJoN2xFYzFkR1gzWlpnajdwNkRhT2F5bERnaVBYQVhCR0FJ?=
 =?utf-8?B?RDUzUUtUaEFMVzAvVW0vbE9wNW53TXJKSkZ1SkdrMHBlVFp3WlAzYXNuUVNz?=
 =?utf-8?B?T0EyWXNEWjFJWWZ6blY5d3dlNUJwbTFCMEVSTWZnZlEwMlZ1RTRFU3JLbjBy?=
 =?utf-8?B?VmludHhCdDh5Q0l4N3NaR2JNek5EajBUdTV4Z0NqQWp6amwyd3VvRUxwVWp6?=
 =?utf-8?B?Znh6cHB1S1N0N3JaejdXTnlVSlZCNjlOR28vVitPdmZqRXhBRWVCS3FvOXlm?=
 =?utf-8?B?cVZTamc3a1dGdEFzK2NiQ2U2bmZWUmxqa2ppRzRoZXRsYnh0NkNnelMrMGty?=
 =?utf-8?B?VGNwYW5uMjZBekhaQjdRYThJdzJpYVB0ZHBoTThJSnpwaDJ4elRIVGRTTk92?=
 =?utf-8?B?Z3A4YU95OHI4eDFWNlNWSVF6TDRLVDRwS2cwS2U3T3A0ay84akJVSmhXMlg5?=
 =?utf-8?B?UTVxR00zRU5FalRFZWZraStieHRWQnRCcGpjWUJ3bHQ3c01vUWo0UlhDc3p3?=
 =?utf-8?B?THlZM2l2T05LQ2hLSEJsaXg3cUtUWXlTZmE1dFVDY3Z3VmV2L3VFRkR0Mk80?=
 =?utf-8?B?WXZ6eXJrT2pmMXBaY3lGZFZUY3pPOUlHd3hBY3ZZQ0ppeXYvODFKSitPQzVN?=
 =?utf-8?B?MU5PTmJvV0REbWppUmRhaXZwdUt2RUhxRGN5YnlENnU4R0Z5eXR0a2thMWlI?=
 =?utf-8?B?RWxkdlFMenluZG1lU0xIdmdIL3loNmVBWFVDcFlabmo3dFNkbW1sdHBpRjBm?=
 =?utf-8?Q?VCkJLr0VEu5En6OcBaL8cBsIqXMDCUVOFL+6403?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5775
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c88a0f3-f06a-4eca-3132-08d8e22bb1fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lng9GNk9zm6yo/pPvvUcdiWn8hqVC72QR7RC7N6TdoOEJfc1clBYXRPAk4hcsXnZrZ6IY2F1nNdtyVUpU0HlIkAjEJiuUeEGc9VeA3AYDzckuTaixOHFIRKHRXYtXJns8xQC6ET2eZmxp79X7/IabOyb83Er2smdWO4AMfAPm5XwqrDHYdmT1gRKeWjtORU2HLpObHaSLe0xzHjmNqEV+eL61RPz4TYAfrihzwMh3TtluN4ejOE0NpyPzekI7D+de6mK5PghsLSIAJ/1VwMpfWNP4FNq80UcaUvBIGJwJuGAeWZRHCL7dt4oXesMaikfy+vuh5oPlgGcwMdyhACZjECJtT14CDEUB+OfJ0DCPiOz3UMjImB9z1kzb6jOAPSBkQSPBFWIqovLqqfHwrXkNrSshXvXxF2DSCcBjmAe049e2su0n4YIg/ty0ld82d8kDlzhBoQhV93Epb3wmniG984ynOlmhtp47mwa14Cf/XWk+CD7fDuXcLw8yIW60VSAI2ML5O3uNMRK7iWT+1stj9hcy602kNHC9LB5ffaVNm948h0VtEsNpHsxXEOYuazIe1RLAldaVXJNd4UUI8auFHUMWgRtOSW56rMmF7kbtGeSPr225SS71zOZtXdrbjB5zQk2cbQIlFOh3wTbN7nzU86/Hr9wbrpRIgvNqnA9HlKveIKzZby6R2hf5qJSf6OX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(36860700001)(2616005)(356005)(70206006)(16526019)(956004)(6486002)(70586007)(86362001)(316002)(26005)(4744005)(53546011)(336012)(7696005)(8936002)(54906003)(5660300002)(44832011)(82740400003)(186003)(82310400003)(8676002)(33656002)(6666004)(2906002)(4326008)(81166007)(6862004)(478600001)(47076005)(36756003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 12:14:29.4671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f64dab4-347d-434a-04ee-08d8e22bb977
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3481



> On 8 Mar 2021, at 11:59, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 08/03/2021 11:56, Luca Fancellu wrote:
>> This patch prevents the dom0 to be loaded skipping its
>> building and going forward to build domUs when the dom0
>> kernel is not found and at least one domU is present.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> I have received 3 versions of this patch, can you clarify I should review=
?

Hi Julien,

I=E2=80=99m really sorry for the noise, because of a problem in my configur=
ation I sent twice the same patch and it comes with a Change-Id: , this is =
the correct one without the Change-Id.

>=20
> If the modification is just the CC list, then we usually add RESEND in th=
e subject. For all the other modifications, we bump the version (vX in suje=
ct) and provide a changelog.

Sure, next time I will add something to the changelog.

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20

Cheers,
Luca=

