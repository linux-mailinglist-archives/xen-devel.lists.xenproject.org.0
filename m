Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E06314FDF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 14:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83242.154408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Spp-00025G-J0; Tue, 09 Feb 2021 13:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83242.154408; Tue, 09 Feb 2021 13:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Spp-00024r-Fk; Tue, 09 Feb 2021 13:13:41 +0000
Received: by outflank-mailman (input) for mailman id 83242;
 Tue, 09 Feb 2021 13:13:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gqd1=HL=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l9Spn-00024m-OF
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 13:13:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::627])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e7a8857-c6a0-4045-a02a-5ea5146a8e0a;
 Tue, 09 Feb 2021 13:13:37 +0000 (UTC)
Received: from AS8PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:20b:312::29)
 by DB8PR08MB4106.eurprd08.prod.outlook.com (2603:10a6:10:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 13:13:33 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::90) by AS8PR04CA0054.outlook.office365.com
 (2603:10a6:20b:312::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Tue, 9 Feb 2021 13:13:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 9 Feb 2021 13:13:32 +0000
Received: ("Tessian outbound af289585f0f4:v71");
 Tue, 09 Feb 2021 13:13:32 +0000
Received: from ad7550db06b1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BACB0556-064C-4998-9A14-CF9498813E6E.1; 
 Tue, 09 Feb 2021 13:13:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad7550db06b1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Feb 2021 13:13:26 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4630.eurprd08.prod.outlook.com (2603:10a6:10:d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.29; Tue, 9 Feb
 2021 13:13:25 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 13:13:25 +0000
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
X-Inumbo-ID: 3e7a8857-c6a0-4045-a02a-5ea5146a8e0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71G+RiebnK1Xhhgl789TMXhc6QVzqtAjUbtLZKHE1zE=;
 b=Horr+Gj+PC8qEvwbGfSHOvveB21n5ZcwPrXKydgS7BRp/01p8adA2qS4qJ6/XBBrrfAxC+XlOyXlW/8YWEK340qt7h4Zwf1+QFU4qHePccsapY8coDLv2Oa7x7+GreX/qyKwwxibHEOw1NwVTE6zuDU+srpDzkWpzZWEjLgZraQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b929fcc4acef4730
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWZ+kg9oIXc87wHBysnldGUwBankR2SXmcY/ctsx/LCpBtBqbAPuwFZz2voh6An5wurgWPvJYqCKJ9eqegBcgjyBzgd9jyyXrYpBQHReBTsdZmH+vLhb3W/kuHyeIpvJygZCqCR4rcMpjZeYEjDcxThdSs45wyXPg0yrzMjAJpjHany4bCPAbeRWO0evusgr0BuCo0KHMEdFmmm/lQS3vzZfyEbTI+LiG+tbAyiroOz0fY3REY9eGAXkcv4zowETVWZfZDfKUErDu/WFmofXY+/40PCc5gD2Af2W3lXVIwLuai5Qk2ZDN0aiWHBhWRKBhZpbWClgg7LV2HM94uHdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71G+RiebnK1Xhhgl789TMXhc6QVzqtAjUbtLZKHE1zE=;
 b=STh0aEDlCEURgosXq1YOa75KvgfVZlNnDkfUIMjN9zqm+22ZV9lNaef6rb0TLUowGUS55D6h0DXmYGE5C24ogt6+1nXigbBewG97RyaJHHH777+gMS7Aqla7PfwZdwaCfNVhvhO76OsWNvR5L8sgwoKcXgDqrxLT1Eh2iKPesfxl9JeuuV9CbPv0ef4c3GOwTafr8m1+dq6u9JbXoNyhbh7fBXWlIGXPrrM2o4hT44cE7TUIT6OO12y7ANlRbhNu3LLnI66vMVFrqBD5EmVgwYPmZnD2+JuYaV9svf16jHorz8nrLnr5ZnwLjTCUz5Y+B13HPy6hBmk/5L0hX3ihUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71G+RiebnK1Xhhgl789TMXhc6QVzqtAjUbtLZKHE1zE=;
 b=Horr+Gj+PC8qEvwbGfSHOvveB21n5ZcwPrXKydgS7BRp/01p8adA2qS4qJ6/XBBrrfAxC+XlOyXlW/8YWEK340qt7h4Zwf1+QFU4qHePccsapY8coDLv2Oa7x7+GreX/qyKwwxibHEOw1NwVTE6zuDU+srpDzkWpzZWEjLgZraQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index: AQHW/ks46k4kUfhzpk6LTniK0S/PbqpPzhoA
Date: Tue, 9 Feb 2021 13:13:25 +0000
Message-ID: <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
In-Reply-To: <20210208184932.23468-1-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49d893ab-6a76-4296-d8ab-08d8ccfc8049
x-ms-traffictypediagnostic: DBBPR08MB4630:|DB8PR08MB4106:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB410618D944C4DCE821EF6FBCFC8E9@DB8PR08MB4106.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RADADNcrAGVO54aWbo5a3Tx+poYh6qFOpvHAZox80jT1MO+1Mcl5RT1njwUfijlhC3B/C219FnL++nnAWWjHXC2YrMYqVnihtJozD+nF8AolscUZ7/CVAt8JaMb3H8dplVn3VP86PLwip9YHzMey/1cih5lAKDg9pcF8ADx/WGO7ApgzdqVxNtMlBywO98hmq7Xt2ivLXnQITZ7nx/Vr78Zs8zU/5yrUGWVBMCliFfOI0MURQIWL2NgmOAIQKKmud9NNXkTCFnRPhiPkPyfXIdwt6y/13vyDiwwlX4XMhZ9Ma5/6HrP6H8kCLlcVfZFrtnxmVQl4yzpkdvHComxgKFFwIK2NrlbLdEyZuRiEpr9ZCXNdoz+6VdlUWnEGbHoIZLe7Smt9KjlUadEbau3Hxd2QMTtx2IabtfPjIQX4FhwAWxoPW6cnf+8zGcklaZ+5A17h4W/nd97zir2GOlTgTdPH0nW1yFQGxA+kWLyCtH7Wx/wzESoUPqwbY+cuu/fhKFPp0HXBm/r8okeQ77nS1bslleqSc6PJFJCoZSpYs4pnpAM2D03tF07+Y3iyOaw5PLJ/w5L1MahjytT7OW5ylW4tiMCaWbBcork2h/znDCpPLyCVgAeRSHCnO9l93zEdCYdu7K+WArpM8PjV4ez6llnQpCnDezMIcRpzhX/6Y5k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(5660300002)(966005)(478600001)(2906002)(316002)(33656002)(26005)(6512007)(45080400002)(91956017)(54906003)(8936002)(186003)(4326008)(53546011)(6916009)(71200400001)(64756008)(66556008)(66476007)(8676002)(6506007)(66446008)(2616005)(76116006)(6486002)(83380400001)(86362001)(66946007)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?ZGltOEdRZUtMVGVlbExJYndjalhXNSsyczVad2l0NHVlcENTVFpHdEZGa2Rh?=
 =?utf-8?B?bVRadWV5Z3l2Z3JFVHVpM1I5WVNxWlBzVUpBR21EYVFUK3VZUzkvVFd3MlBQ?=
 =?utf-8?B?L3M0M1dqTFZUaFZlNUQ5ZTJjWjM1Y0hTSWtGMDNZS2JaMDlvM2lUbzh0enhZ?=
 =?utf-8?B?Vlp5K1ltQ25TRkY4aTRyVnp2U0x4cnhKWXRuTTJkY1k2eC9MbmZPSVpvMktZ?=
 =?utf-8?B?Z204dERMZzZEc2ZZUy9Eam4ycm1iTTRBYXNteTRod0ZKYnBwODA5QVVSZGZD?=
 =?utf-8?B?ZExXMGZua2RVeDdkbGZ3dHNZUlR3bjMzemp1MHdZNmorRXpRdmJUcVRJaG9i?=
 =?utf-8?B?OUhZVlowRk1MRWtPNlNwUjFtOERkR0NuWWh1L292NmpKQ1lNd1pSMDNQVHhq?=
 =?utf-8?B?TzNJd3RBRGNsa21rajJNVmdNUW1mVzc1VDd6L0s3VnNLUU8xMXBzOVl6NzZz?=
 =?utf-8?B?dStxeWQ5WkZPeldQeUtEY2Z3SVhuRVJvWDAvQ0FnclJZamY4ZXBpaHl5dkJo?=
 =?utf-8?B?VDEwOElWamdkMUlQV05yaG8yTmNSYzE0dUtxN1h5WG52dlhUdEFrRGZ3QnlI?=
 =?utf-8?B?TFZpYUpvU1hqVVM0UUsyQnNNMWRRejRXMXJBU2UrbCtWeGtiMllTS3YzcjNV?=
 =?utf-8?B?OXlHQnVJcWovMDhXOUwzQU9ESWpGcFJsRGJKYzgrMytxRFpDMzZvMUdmMkpC?=
 =?utf-8?B?MGhnYUFaSUdRK0JTK25rK1BnVllOTHQ0VVh3QmErZkdteEpvc3kvbFcvNjFP?=
 =?utf-8?B?eEdwYnBZRGhqRFZrUmJYanl0N2tnQ1Vva0JzRXZMR3lISTJ5MnFZTCt4bDZW?=
 =?utf-8?B?a21TUmxBeDAweUN6ZCtpZGh5c0I1M1Y2ZGw5cFNXLzBoRXEyZE9DbWcyMlpD?=
 =?utf-8?B?TXlzbWtMMjRycUZCQUQ5bStzUGJxMUErNWc0UEs4REQvSy9rWFpLSDlLSmJp?=
 =?utf-8?B?REZJT2VBbUdtVTFxNngwdTlpV1c3R0NHSnVoWkgxbDNyakhHYUt1NGlnQXBt?=
 =?utf-8?B?eDlST3BkL0NJYVgyNHJncUwvMW5abUd4MXlRQitoalF3REZtbDUycW0vaWw1?=
 =?utf-8?B?UktuUGFLdmllQVRjeGRKSWI4S3dpRGlxcWtFZU1DSEJDbGw5VFVIOG5uSTc0?=
 =?utf-8?B?VXpQSnpUZVZTMjJpcllMY3BRbGVNb3dxV1RKeVVKQlJna3REYThSb0RWUGZC?=
 =?utf-8?B?UEFsaUxnOGphRTdVT3dyWE51ZW9kK1dxT0Y1TW53WFJrUkFjWXdvYkpZbXZw?=
 =?utf-8?B?eXhnQkIxbDV3WnFqN0dkR3Q2Uy9TNC94bUgvMHBGQndWY2EyWWZhRlhGOHFE?=
 =?utf-8?B?azNzaFpiU2lveVdSRlZqMUhWclVLOGFuOVAvbkhvb3dmdnlaWjNmTWxyY0hT?=
 =?utf-8?B?K3ZETnNnSXl3UG9velRTd2JJOW5LZUM3cnpzWmM5a2xZaDY0QzdjMnNDVmdB?=
 =?utf-8?B?NWhrNi8wcnpmeGx1WGxBMStLQVRPY055WHpnSjluT2VQRXE0QXdyb1dKclIr?=
 =?utf-8?B?TE5BTnY5UUdXQk9wSjI5eUhGTXBBcU45Z05BdmNhaHpKTkVzMUo5Y0FGUmEv?=
 =?utf-8?B?V2N0QUQwcnB5SkZORGFYN0RST3cxaU1mb3JEL0VVaElGMVl6U3BBWE5hbDVN?=
 =?utf-8?B?T21Pb1JmbXJ0TnJic2JqWDJVT2hnbGdQeXdhMFFFMEc1Wk4xY1laazNFbXBL?=
 =?utf-8?B?YlU1S0FOUy91SVozd0U3SmtrSURLZ3BhQWhWU25UdWxyellPelF5SUkyQWVV?=
 =?utf-8?Q?psu+1DxNSsg4TaTnLqI5UKQTaCks5Uhp5i86X/Q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0C44DB169897841ADB2F53C0F6330A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4630
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c57f6a1-4354-4395-1c3a-08d8ccfc7bd3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OYxcQrqm8c/jpExYq9DeBcdDAESvnWXCXPFSaOtLTwBt2AVZT7HNheky6JdbH/MS4n4FizYfI6OdDfQ0/fw9VMb6q6/ZEHjOdvRtIUbZwlA17FILnLCrU8kW10oBYZIpqpPbZRG6yc+REsimnntJ54xT4bo0JFFJ/QAyVsZeLVQgDUgB/rDtPMiuvK5PaoLBiwoi00th81b8ngk/bHr/CVu8wdU5DB8BqG5MHDdp2//QjNuXQnhQpIa1m69StlnU5+q8m0ZBFU1FO+bKY8ALCPlzQDVIj80PI2Caq88a9UeOZ7lyeiWg1yjRe0JrzuvbckISh57VshxrxaUe4oQr1VFFvbUSPDDdhmBGGxwlGxgv0yB5AWuzKDCa4b1QWpApzkq5+sNGYIoEWK6DpPH4ra+4B4X1wqBOWN6bPYDI8B9QWSkcr8bBwSmY7vdzPB31oDq6mFTUVDasAW97yinCQBksbXJJFOYcpu0inl83QOl/bc6pLi2hmE4VaPP3U7n/0uwKhauzEkrTWSAAmvSxb90r2LSHsGYdo4U2E8mMKCcfHpvuzwKx2313frKAuEnBC0HMi/WPUg4pvRrHQndNA9lxlsROqo/bv3Ww8HAXJCF7hYbX5XUMfmfCyS54dyu2PMrU/iIxV8jvBIKHXDdbfweGeswXEtbzgopcl+xmVIIRRUdqoqxt9jZHZtAbhIaOkBMPkRDsjtDcyyEvs1RGs4vxQNYuFN/XiDQo1KE9SBk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(36840700001)(46966006)(36860700001)(54906003)(316002)(81166007)(356005)(47076005)(336012)(2906002)(82740400003)(83380400001)(86362001)(966005)(6486002)(6862004)(2616005)(26005)(186003)(4326008)(107886003)(8936002)(478600001)(45080400002)(70206006)(53546011)(6512007)(6506007)(70586007)(8676002)(5660300002)(36756003)(82310400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 13:13:32.7404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d893ab-6a76-4296-d8ab-08d8ccfc8049
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4106

SGVsbG8gU3RlZmFubywNCg0KPiBPbiA4IEZlYiAyMDIxLCBhdCA2OjQ5IHBtLCBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gQ29tbWl0IDkx
ZDRlY2E3YWRkIGJyb2tlIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcgb24gQVJNLg0KPiBUaGUg
b2ZmZW5kaW5nIGNodW5rIGlzOg0KPiANCj4gI2RlZmluZSBnbnR0YWJfbmVlZF9pb21tdV9tYXBw
aW5nKGQpICAgICAgICAgICAgICAgICAgICBcDQo+IC0gICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFw
cGVkKGQpICYmIG5lZWRfaW9tbXUoZCkpDQo+ICsgICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVk
KGQpICYmIG5lZWRfaW9tbXVfcHRfc3luYyhkKSkNCj4gDQo+IE9uIEFSTSB3ZSBuZWVkIGdudHRh
Yl9uZWVkX2lvbW11X21hcHBpbmcgdG8gYmUgdHJ1ZSBmb3IgZG9tMCB3aGVuIGl0IGlzDQo+IGRp
cmVjdGx5IG1hcHBlZCBhbmQgSU9NTVUgaXMgZW5hYmxlZCBmb3IgdGhlIGRvbWFpbiwgbGlrZSB0
aGUgb2xkIGNoZWNrDQo+IGRpZCwgYnV0IHRoZSBuZXcgY2hlY2sgaXMgYWx3YXlzIGZhbHNlLg0K
PiANCj4gSW4gZmFjdCwgbmVlZF9pb21tdV9wdF9zeW5jIGlzIGRlZmluZWQgYXMgZG9tX2lvbW11
KGQpLT5uZWVkX3N5bmMgYW5kDQo+IG5lZWRfc3luYyBpcyBzZXQgYXM6DQo+IA0KPiAgICBpZiAo
ICFpc19oYXJkd2FyZV9kb21haW4oZCkgfHwgaW9tbXVfaHdkb21fc3RyaWN0ICkNCj4gICAgICAg
IGhkLT5uZWVkX3N5bmMgPSAhaW9tbXVfdXNlX2hhcF9wdChkKTsNCj4gDQo+IGlvbW11X3VzZV9o
YXBfcHQoZCkgbWVhbnMgdGhhdCB0aGUgcGFnZS10YWJsZSB1c2VkIGJ5IHRoZSBJT01NVSBpcyB0
aGUNCj4gUDJNLiBJdCBpcyB0cnVlIG9uIEFSTS4gbmVlZF9zeW5jIG1lYW5zIHRoYXQgeW91IGhh
dmUgYSBzZXBhcmF0ZSBJT01NVQ0KPiBwYWdlLXRhYmxlIGFuZCBpdCBuZWVkcyB0byBiZSB1cGRh
dGVkIGZvciBldmVyeSBjaGFuZ2UuIG5lZWRfc3luYyBpcyBzZXQNCj4gdG8gZmFsc2Ugb24gQVJN
LiBIZW5jZSwgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhkKSBpcyBmYWxzZSB0b28sDQo+IHdo
aWNoIGlzIHdyb25nLg0KPiANCj4gQXMgYSBjb25zZXF1ZW5jZSwgd2hlbiB1c2luZyBQViBuZXR3
b3JrIGZyb20gYSBkb21VIG9uIGEgc3lzdGVtIHdoZXJlDQo+IElPTU1VIGlzIG9uIGZyb20gRG9t
MCwgSSBnZXQ6DQo+IA0KPiAoWEVOKSBzbW11OiAvc21tdUBmZDgwMDAwMDogVW5oYW5kbGVkIGNv
bnRleHQgZmF1bHQ6IGZzcj0weDQwMiwgaW92YT0weDg0MjRjYjE0OCwgZnN5bnI9MHhiMDAwMSwg
Y2I9MA0KPiBbICAgNjguMjkwMzA3XSBtYWNiIGZmMGUwMDAwLmV0aGVybmV0IGV0aDA6IERNQSBi
dXMgZXJyb3I6IEhSRVNQIG5vdCBPSw0KPiANCj4gVGhlIGZpeCBpcyB0byBnbyBiYWNrIHRvIHNv
bWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2YgdGhlIG9sZA0KPiBpbXBsZW1lbnRhdGlvbiBvZiBn
bnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4gRml4ZXM6IDkxZDRl
Y2E3YWRkDQo+IEJhY2twb3J0OiA0LjEyKw0KPiANCj4gLS0tDQo+IA0KPiBHaXZlbiB0aGUgc2V2
ZXJpdHkgb2YgdGhlIGJ1ZywgSSB3b3VsZCBsaWtlIHRvIHJlcXVlc3QgdGhpcyBwYXRjaCB0byBi
ZQ0KPiBiYWNrcG9ydGVkIHRvIDQuMTIgdG9vLCBldmVuIGlmIDQuMTIgaXMgc2VjdXJpdHktZml4
ZXMgb25seSBzaW5jZSBPY3QNCj4gMjAyMC4NCj4gDQo+IEZvciB0aGUgNC4xMiBiYWNrcG9ydCwg
d2UgY2FuIHVzZSBpb21tdV9lbmFibGVkKCkgaW5zdGVhZCBvZg0KPiBpc19pb21tdV9lbmFibGVk
KCkgaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcuDQo+
IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UNCj4gLSBhZGQg
aXNfaW9tbXVfZW5hYmxlZChkKSB0byB0aGUgY2hlY2sNCj4gLS0tDQo+IHhlbi9pbmNsdWRlL2Fz
bS1hcm0vZ3JhbnRfdGFibGUuaCB8IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9ncmFudF90YWJsZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oDQo+IGlu
ZGV4IDZmNTg1YjE1MzguLjBjZTc3ZjlhMWMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vZ3JhbnRfdGFibGUuaA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3Rh
YmxlLmgNCj4gQEAgLTg5LDcgKzg5LDcgQEAgaW50IHJlcGxhY2VfZ3JhbnRfaG9zdF9tYXBwaW5n
KHVuc2lnbmVkIGxvbmcgZ3BhZGRyLCBtZm5fdCBtZm4sDQo+ICAgICAoKChpKSA+PSBucl9zdGF0
dXNfZnJhbWVzKHQpKSA/IElOVkFMSURfR0ZOIDogKHQpLT5hcmNoLnN0YXR1c19nZm5baV0pDQo+
IA0KPiAjZGVmaW5lIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcoZCkgICAgICAgICAgICAgICAg
ICAgIFwNCj4gLSAgICAoaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgJiYgbmVlZF9pb21tdV9w
dF9zeW5jKGQpKQ0KPiArICAgIChpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSAmJiBpc19pb21t
dV9lbmFibGVkKGQpKQ0KPiANCj4gI2VuZGlmIC8qIF9fQVNNX0dSQU5UX1RBQkxFX0hfXyAqLw0K
DQpJIHRlc3RlZCB0aGUgcGF0Y2ggYW5kIHdoaWxlIGNyZWF0aW5nIHRoZSBndWVzdCBJIG9ic2Vy
dmVkIHRoZSBiZWxvdyB3YXJuaW5nIGZyb20gTGludXggZm9yIGJsb2NrIGRldmljZS4NCmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y0LjMvc291cmNlL2RyaXZlcnMvYmxvY2sveGVu
LWJsa2JhY2sveGVuYnVzLmMjTDI1OA0KDQpJIGRpZCBpbml0aWFsIGRlYnVnZ2luZyBhbmQgZm91
bmQgb3V0IHRoYXQgdGhlcmUgYXJlIG1hbnkgY2FsbHMgdG8gaW9tbXVfbGVnYWN5X3ssdW59bWFw
KCkgd2hpbGUgY3JlYXRpbmcgdGhlIGd1ZXN0IGJ1dCB3aGVuIGlvbW11X2xlZ2FjeV91bm1hcCgp
IGZ1bmN0aW9uIHVubWFwIHRoZSBwYWdlcyBzb21ldGhpbmcgaXMgd3JpdHRlbiAgd3JvbmcgaW4g
cGFnZSB0YWJsZXMgYmVjYXVzZSBvZiB0aGF0IHdoZW4gbmV4dCB0aW1lIHNhbWUgcGFnZSBpcyBt
YXBwZWQgdmlhIGNyZWF0ZV9ncmFudF9ob3N0X21hcHBpbmcoKSB3ZSBvYnNlcnZlZCBiZWxvdyB3
YXJuaW5nLiANCiANCg0KWyAgMTM4LjYzOTkzNF0geGVuLWJsa2JhY2s6IGJhY2tlbmQvdmJkLzAv
NTE3MTI6IHVzaW5nIDQgcXVldWVzLCBwcm90b2NvbCAxIChhcm0tYWJpKSBwZXJzaXN0ZW50IGdy
YW50cw0KKFhFTikgZ250dGFiX21hcmtfZGlydHkgbm90IGltcGxlbWVudGVkIHlldA0KWyAgMTM4
LjY1OTcwMl0geGVuLWJsa2JhY2s6IGJhY2tlbmQvdmJkLzAvNTE3MTI6IHVzaW5nIDQgcXVldWVz
LCBwcm90b2NvbCAxIChhcm0tYWJpKSBwZXJzaXN0ZW50IGdyYW50cw0KWyAgMTM4LjY2OTgyN10g
dmJkIHZiZC0wLTUxNzEyOiA5IG1hcHBpbmcgaW4gc2hhcmVkIHBhZ2UgOCBmcm9tIGRvbWFpbiAw
DQpbICAxMzguNjc2NjM2XSB2YmQgdmJkLTAtNTE3MTI6IDkgbWFwcGluZyByaW5nLXJlZiBwb3J0
IDUNClsgIDEzOC42ODIwODldIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0K
WyAgMTM4LjY4NjYwNV0gV0FSTklORzogQ1BVOiAyIFBJRDogMzcgYXQgZHJpdmVycy9ibG9jay94
ZW4tYmxrYmFjay94ZW5idXMuYzoyOTYgeGVuX2Jsa2lmX2Rpc2Nvbm5lY3QrMHgyMGMvMHgyMzAN
ClsgIDEzOC42OTY2NjhdIE1vZHVsZXMgbGlua2VkIGluOiBicmlkZ2Ugc3RwIGxsYyBpcHY2IG5m
X2RlZnJhZ19pcHY2DQpbICAxMzguNzAyODMzXSBDUFU6IDIgUElEOiAzNyBDb21tOiB4ZW53YXRj
aCBOb3QgdGFpbnRlZCA1LjQuMC15b2N0by1zdGFuZGFyZCAjMQ0KWyAgMTM4LjcxMDAzN10gSGFy
ZHdhcmUgbmFtZTogQXJtIE5lb3ZlcnNlIE4xIFN5c3RlbSBEZXZlbG9wbWVudCBQbGF0Zm9ybSAo
RFQpDQpbICAxMzguNzE3MDY3XSBwc3RhdGU6IDgwYzAwMDA1IChOemN2IGRhaWYgK1BBTiArVUFP
KQ0KWyAgMTM4LjcyMTkyN10gcGMgOiB4ZW5fYmxraWZfZGlzY29ubmVjdCsweDIwYy8weDIzMA0K
WyAgMTM4LjcyNjcwMV0gbHIgOiB4ZW5fYmxraWZfZGlzY29ubmVjdCsweGJjLzB4MjMwDQpbICAx
MzguNzMxMzg4XSBzcCA6IGZmZmY4MDAwMTFjYjNjODANClsgIDEzOC43MzQ3NzNdIHgyOTogZmZm
ZjgwMDAxMWNiM2M4MCB4Mjg6IGZmZmYwMDAwNWI2ZGE5NDAgDQpbICAxMzguNzQwMTU2XSB4Mjc6
IDAwMDAwMDAwMDAwMDAwMDAgeDI2OiAwMDAwMDAwMDAwMDAwMDAwIA0KWyAgMTM4Ljc0NTUzNl0g
eDI1OiBmZmZmMDAwMDI5NzU1MDYwIHgyNDogMDAwMDAwMDAwMDAwMDE3MCANClsgIDEzOC43NTA5
MTldIHgyMzogZmZmZjAwMDAyOTc1NTA0MCB4MjI6IGZmZmYwMDAwNTljNzIwMDAgDQpbICAxMzgu
NzU2Mjk5XSB4MjE6IDAwMDAwMDAwMDAwMDAwMDAgeDIwOiBmZmZmMDAwMDI5NzU1MDAwIA0KWyAg
MTM4Ljc2MTY4MV0geDE5OiAwMDAwMDAwMDAwMDAwMDAxIHgxODogMDAwMDAwMDAwMDAwMDAwMCAN
ClsgIDEzOC43NjcwNjNdIHgxNzogMDAwMDAwMDAwMDAwMDAwMCB4MTY6IDAwMDAwMDAwMDAwMDAw
MDAgDQpbICAxMzguNzcyNDQ0XSB4MTU6IDAwMDAwMDAwMDAwMDAwMDAgeDE0OiAwMDAwMDAwMDAw
MDAwMDAwIA0KWyAgMTM4Ljc3NzgyNl0geDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjogMDAwMDAw
MDAwMDAwMDAwMCANClsgIDEzOC43ODMyMDddIHgxMTogMDAwMDAwMDAwMDAwMDAwMSB4MTA6IDAw
MDAwMDAwMDAwMDA5OTAgDQpbICAxMzguNzg4NTg5XSB4OSA6IDAwMDAwMDAwMDAwMDAwMDEgeDgg
OiAwMDAwMDAwMDAwMjEwZDAwIA0KWyAgMTM4Ljc5Mzk3MV0geDcgOiAwMDAwMDAwMDAwMDAwMDE4
IHg2IDogZmZmZjAwMDA1ZGRmNzJhMCANClsgIDEzOC43OTkzNTJdIHg1IDogZmZmZjgwMDAxMWNi
M2MyOCB4NCA6IDAwMDAwMDAwMDAwMDAwMDAgDQpbICAxMzguODA0NzM0XSB4MyA6IGZmZmYwMDAw
Mjk3NTUxMTggeDIgOiAwMDAwMDAwMDAwMDAwMDAwIA0KWyAgMTM4LjgxMDExN10geDEgOiBmZmZm
MDAwMDI5NzU1MTIwIHgwIDogMDAwMDAwMDAwMDAwMDAwMSANClsgIDEzOC44MTU0OTddIENhbGwg
dHJhY2U6DQpbICAxMzguODE4MDE1XSAgeGVuX2Jsa2lmX2Rpc2Nvbm5lY3QrMHgyMGMvMHgyMzAN
ClsgIDEzOC44MjI0NDJdICBmcm9udGVuZF9jaGFuZ2VkKzB4MWIwLzB4NTRjDQpbICAxMzguODI2
NTIzXSAgeGVuYnVzX290aGVyZW5kX2NoYW5nZWQrMHg4MC8weGIwDQpbICAxMzguODMxMDM1XSAg
ZnJvbnRlbmRfY2hhbmdlZCsweDEwLzB4MjANClsgIDEzOC44MzQ5NDFdICB4ZW53YXRjaF90aHJl
YWQrMHg4MC8weDE0NA0KWyAgMTM4LjgzODg0OV0gIGt0aHJlYWQrMHgxMTgvMHgxMjANClsgIDEz
OC44NDIxNDddICByZXRfZnJvbV9mb3JrKzB4MTAvMHgxOA0KWyAgMTM4Ljg0NTc5MV0gLS0tWyBl
bmQgdHJhY2UgZmI5ZjBhM2IzYjQ4YTU1ZiBd4oCUDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo+IC8q
DQo+IC0tIA0KPiAyLjE3LjENCj4gDQoNCg==

