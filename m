Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF98367B40
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115074.219383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTwD-0005g7-9g; Thu, 22 Apr 2021 07:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115074.219383; Thu, 22 Apr 2021 07:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTwD-0005fh-6H; Thu, 22 Apr 2021 07:39:49 +0000
Received: by outflank-mailman (input) for mailman id 115074;
 Thu, 22 Apr 2021 07:39:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KkA+=JT=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lZTwB-0005fc-N1
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:39:47 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fb451ac-cc96-477c-a4b8-acbcf26ed9d5;
 Thu, 22 Apr 2021 07:39:44 +0000 (UTC)
Received: from MR2P264CA0080.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::20)
 by DB6PR08MB2662.eurprd08.prod.outlook.com (2603:10a6:6:24::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21; Thu, 22 Apr
 2021 07:39:42 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::3c) by MR2P264CA0080.outlook.office365.com
 (2603:10a6:500:32::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Thu, 22 Apr 2021 07:39:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 07:39:41 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Thu, 22 Apr 2021 07:39:40 +0000
Received: from 554cec0a604e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 410FD2B6-2F8A-4193-A35B-EF107AF0C00D.1; 
 Thu, 22 Apr 2021 07:39:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 554cec0a604e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 22 Apr 2021 07:39:30 +0000
Received: from DB7PR08MB3626.eurprd08.prod.outlook.com (2603:10a6:10:4a::16)
 by DB6PR0801MB1829.eurprd08.prod.outlook.com (2603:10a6:4:39::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 07:39:27 +0000
Received: from DB7PR08MB3626.eurprd08.prod.outlook.com
 ([fe80::a05a:b249:56a2:c570]) by DB7PR08MB3626.eurprd08.prod.outlook.com
 ([fe80::a05a:b249:56a2:c570%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 07:39:27 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0170.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 07:39:27 +0000
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
X-Inumbo-ID: 3fb451ac-cc96-477c-a4b8-acbcf26ed9d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXFZfDW5jOe3aBOlO714kVpIdHXDyzfHsFtUIpEP74c=;
 b=LWoNfLVTHeXU/TxZXHPCEQEp+VNTntdOofHnK/NxxWPKLKbpgCeVo53svr8tfZo0YJGLkV8J+tbqCWuJRgXur65L4NkQ0lU+NSvujn70Q6h/Y97wKnOiUJqXAJW0pUv/qU0gtQh2dS5TBBdf0SUHxvRWnCfaKCnHxNzGTrxlJno=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a461cbfca6c39bda
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqe5kAWnHKFH/7TPQHpNbEuFKE5R5D1f3msWJ2wxwl7fj1eOjxxzPqojScJLmdqLJMAUuTtsQ8dnsla3GuFOaBXnLWF0LVqXjcwfirsdmZ/pFWk/L2tZE5KuuQp5fXji3TzdGJ36byRNa6QM6yy0uXEvvHWuCih/Rgsq2sXPHYW0d4x1P5ChndlzKkNC1/rkbHcjYhEoukzV9mIpS0dJxgl9IZpr+3qwk3RARA7EHcIJmDHp5UASXpNQjJjU1NbFh4CRbmgo4UCfOEtc2xHJyRBq3dS0srvriKfy/KwA5AiTKOURZ78NXiX9o/FQoIApArDfJ9bkr54Z5/zJQpPMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXFZfDW5jOe3aBOlO714kVpIdHXDyzfHsFtUIpEP74c=;
 b=khmI98VbT6ggvC/G/EGC8IXaezjjZp0quQPBy7AMcKIPar5bUZTWVfiIG6iXJWoaEO6zI4dgHdqicCXNdu6OcF2GGmpMc/YdCdCZ7VxTkxoX8YtEYOkhNPqhLpdikwaKsPXFrKvU0/V4OhqT1mznidZi3nb6qdl2BEr5qZbgHFEZdd+AOYamfIqZeqoRA4coHqsphJeKpj9qHjvKd688pl0eKB+zv4s1uWJ/Zd0PG93G/NU+d5wAdZBmkds5BFMRJQZw90LEpWCSnlj6werE/XCtSbzzp6wpmrRM8sGSvd0WfFyQkafIDsmXkrTL+qQKYA3Z9mdcWZqaAQZS5QZQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXFZfDW5jOe3aBOlO714kVpIdHXDyzfHsFtUIpEP74c=;
 b=LWoNfLVTHeXU/TxZXHPCEQEp+VNTntdOofHnK/NxxWPKLKbpgCeVo53svr8tfZo0YJGLkV8J+tbqCWuJRgXur65L4NkQ0lU+NSvujn70Q6h/Y97wKnOiUJqXAJW0pUv/qU0gtQh2dS5TBBdf0SUHxvRWnCfaKCnHxNzGTrxlJno=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <dbcf10ef-0d40-a687-d242-f01a01bca342@suse.com>
Date: Thu, 22 Apr 2021 08:39:20 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <91B2399E-2E91-44A9-A5F2-C55F42F52F52@arm.com>
References: <20210419091231.55684-1-luca.fancellu@arm.com>
 <20210419091231.55684-4-luca.fancellu@arm.com>
 <c8e1022f-abb0-56f3-db37-5cec4d01dead@suse.com>
 <0F26E53E-0C0A-4596-AC88-F803BC7A0493@arm.com>
 <c6d80a92-b8e7-703a-e051-18dc845b242a@suse.com>
 <ADF98BE7-02CA-48C1-B0CF-E4C7B4C0E828@arm.com>
 <dbcf10ef-0d40-a687-d242-f01a01bca342@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0170.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::13) To DB7PR08MB3626.eurprd08.prod.outlook.com
 (2603:10a6:10:4a::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 906b63fb-7a42-4ca9-52ec-08d90561ca44
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1829:|DB6PR08MB2662:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB266210D95096622E789245A1E4469@DB6PR08MB2662.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WtjFi7vCTRkfiMs71J2wkGcs5Jqu35+5SPEDj1EJskdr8nwNnONHjKZzeXH2f6eu+rf7vGZrj5XE4OD5wENBkmfupCmoQr5y7gfB08hVsLx1uG0O8q4xYSWlDFUque0JyQ6X+Q+j7XLNEm3L5DJz3cal/+rgxw/6b1/illuY/Kbc+3Mu3iQn37Co9qn+h1dNA5YTKKUWW6lSfdp+9EwCYzDDsNr7KI90vyNHAf6Vfo/jEFMXhdbOpqHVRrpxJkfD7alBjTDS9ZTaw5AwHoUqbmJpwQZP4XcYfaHVjF4X/dJOygzHmy98fuIjKwhir28VmTUQ+A9898ByWTZb9fDEm0DCbUxJWNQrs2nccmehfeYbX0LTHeAvOJaOaIeEZsGmkz4uuyffGlGqmkkoCasTovAaQiLJKp0TWi+jLUx1VmYsHGEMzdw/watTITgfRTcmLXFxi6I6iar1cbee8wF1azXJWsIBCjBa+myXhSdT+Oltde5nyABj6nOZxaliP0Ynac1aI4h/6OhV+vVpaiwNKNlDxheVs28LU+0WSZul78Y2otUKBPTMR2B9m8/4YTOCbzj0trCpvM8WOAFOVw20v+WECesPz/k4Uhi5XVafyicfvByWQlXxp4/3s4S+iW3AII3kcy6szsxchff5rDob1P7SxziYmv9MZk61kfmq8WnFboKPsVWfOC61/mfThc6iQGb7sG8sbu4sSi9CjDb5n6nlxyfJ/1Rix3Z8ZKMM5U279aOPmwhwxGi8eZZwbtAq
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3626.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(5660300002)(86362001)(33656002)(36756003)(6916009)(6666004)(54906003)(316002)(44832011)(53546011)(38100700002)(66556008)(66946007)(66574015)(83380400001)(8676002)(38350700002)(8936002)(2906002)(7696005)(52116002)(478600001)(956004)(16526019)(6486002)(4326008)(186003)(2616005)(26005)(966005)(66476007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?OERzM3c4TndRcTJyUWlnNFhnWU5iTGZuKzFHQkM4eHk5d3F2bVUvZVA2OWUy?=
 =?utf-8?B?Rlo4eDhRRGphbUxJMWJYckdHSTllcHlpUExJZEdWeWsvQzNnTmpLY2xnd0Ru?=
 =?utf-8?B?QUZoQWJna2VNeG1JczkxbDd3TFJFd0lIM1RJVmpmT0F0bTErQnZESWlCbnQz?=
 =?utf-8?B?U1psTlhtYjBCM1ozQmN4UVlTTm1ZR1M2VjhSYmhJZ0lHZisrZmlXNjJOYkNS?=
 =?utf-8?B?RWR4YWNrRWczU3pxaTZxRHlFbExHZDJCVEdsM3BZdjVTK3ZBU00yVTBvLzh3?=
 =?utf-8?B?ajBxdlhhWHNuTFFBc1A0QTk4UVoxOHpqU3dkZHBPT1IwanQ2am9pYTlFQ3pz?=
 =?utf-8?B?WWZ2ekdZRmoweEdoM2R0MUFYbEhNd0hKVFVaWnBsYnd6dUdOTmlNU1NjOTFJ?=
 =?utf-8?B?S3poWEl5SlFmRmJwanZkbmp4dXRZZ3ZkeUhjOWs2NXhTQ3VSQklzUjQ1QllU?=
 =?utf-8?B?dnlrdEY0Z25JNmxWbFY4bnpOWVV4dVp4MDEzNFducWtXWUxueFg2SitOY3Ex?=
 =?utf-8?B?NVlEZyttR3UydUlncURGVkI3cHdPVU9VdzI4SGJuNnZjVEZkWUFmWHpTWWhr?=
 =?utf-8?B?d0lyRGFjbzFTSE4yZG9FSGFQNXBOQS94b2R1dk03blI0VitXSHNFcWtWem1W?=
 =?utf-8?B?Z3BhU1VUMVdMU1dJVEVMUjNuZFlLOWN1d0RTVGhhMXFYY1pqTlBhV3d2Sk01?=
 =?utf-8?B?WG94cGFOMHhjaHpKUWt0VzJSYU1HSWxsUFZaNUxTMlRqbGpPMTQ2UWpQSXpj?=
 =?utf-8?B?ZWRVT0JnVlVpRDBUQUQ2Z2hGcWFCNlRWN2Rha0p5L0hRWG1hOFkrc09oaVgy?=
 =?utf-8?B?K3BHV3A5OFNOTi9WcUNXS2IwczZyMlBBVHZ3a3RFWXVQdEdxaWU0VVRkd3Qr?=
 =?utf-8?B?SnBUNFVCZVkzSS92TlphempxTVNIdEdrOHJnd200dTNHNG5EOUVsWnZTZG03?=
 =?utf-8?B?N0pJUjY4S3VEd3ovVkFUNEN6OWVlclVic2laR2FKcFlsN1grZlVFdUlmVUNU?=
 =?utf-8?B?NE1CV0FiejFLYjhRNEJqU0ZyVng2MzR3bGJoRDhhczBCdWtucmR3bGp0Z2Fu?=
 =?utf-8?B?K2RZbmxENTIwdjVScU5zWUtOUk1kdHBkQTB0MmdBcHZRYjVPQnorNTBSNk9G?=
 =?utf-8?B?aWxWYWp0RXkyRjl4MFM5a0hwYWVMQjR0YWR3ZW9tWDc1TXppZHdyL2VmbXA1?=
 =?utf-8?B?MFRpK1Vlc0FrclR4bTR2cDV5cjBkbUlkOVhKSkd0dHkxajRQTHR2QVA2YUlw?=
 =?utf-8?B?MEFmYjdFVlJIc1JaTllSVEQvVUpsVlpxWE11VEswbHJ3Z0R5UzEzWTlxUy9I?=
 =?utf-8?B?S0NIYVFjbVJ1R2NVeTRtQklqVXBHTjBWOEltcHJtR3BpeTltQ2N5VVJTTm9v?=
 =?utf-8?B?dXowR2pLUHQ2NWV0Q3AxT0RNQWlGTkVGc1FmVW9TSXZmVVNUejJpWllETDZI?=
 =?utf-8?B?Vk53TXc0UWZDNzlHOWlDSUVlVzlVWlR0N1VYS25PbUNvc0dudHIzbW04T2c5?=
 =?utf-8?B?UHdObnhaaXRzQmsyVnFsckpoWWFQOFd2cTFRNnU3SnRIei9BTWFzQ0ZvWS9S?=
 =?utf-8?B?WS9taTRyOG9DWnIraVFqdVhsMXVWRFYyN2NYdGNsSExTUFZpSkE5aWF0MS8r?=
 =?utf-8?B?ajVib0ttVmRrZ29FS2N4UDJzeTVHbjFuVGRsclBMait6R1F6NG5HWGg5NUNy?=
 =?utf-8?B?OVJuamU1YjhKNkpZMFpOVWt2N0krZnV0bmt0UGJBY1FLbHYraCtZNTloY3hP?=
 =?utf-8?Q?kQozoGdY8CjMEInW2jxoc4CZWHFUIZqWXZIdm7g?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1829
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae6397cd-9f11-45d2-6eec-08d90561c1f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cX1QlGc0wDZ3steI79Tp2uF3XH6ASXUdvr9C3dVXWmFQZglnaL4jROTMPUtWTVIF9pshwnHPHV6SJAA8TF+Gjjqt4tLiOjijAO615moMPa+n70V5lLo0j146e+mKKkdQY+icJ0KPO46P/nSIWa3hNlL8M9Mmk0i73Zw2gBxk1H8bpit2NqXLmYuPiqgHeGbPMipaJDjcYrIaX8alnAPLpC4mccHN0xIXtloDER2SUq12kXzYx1TSQDUy/zT77dmodkI6+UHd/KX5juSHdo7QYVTpw/r2HcNVNGB2w4DK6NVi5QDd8UvpS+ISht39x4lZb2NmclaZHjhz5QhJuUubkZKN2f/ZKYplK1XGrmttZi05yw4BoLxnsm2pZ7JYEh99aXgYttAOIc/2KJT6BH0YWFvES1xEzOUM5djE0wYlSTwVBILgFOHTGr6mV+YQAuoumRjEY6Yv4hB2TDNkcdpI6R2A1rcykygKZT7vb6/TEdBOxk9ugfz2XECV/Xd0jsOBYC2Ugei8WrXCUo9e+Duyh+RebbNoB/menseAPshvGn70h+7Tr/f+3efXd7FCis93kB1Fw34Jwe8eejLkD7hMXFqrhmnp71ysvXIOVKP3/rwPlkzGws2lcxFTesm0TgRRirXCEolztW6ROZtq1r1AguDVGk53hk7Bh7qslnHj98SZHq3eB4X/g02sT26Y92dRmTXf1LUZk2RkyNDSNpRDEkC2nRHhMjpqi8Hd0JIwWkN4dQQFsF/Le9wC9kuKNfeRarPwtRuAltGyoE8t7vuf3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966006)(36840700001)(6666004)(83380400001)(26005)(34070700002)(33656002)(16526019)(70586007)(356005)(956004)(44832011)(2906002)(82310400003)(36756003)(478600001)(2616005)(47076005)(70206006)(7696005)(5660300002)(6862004)(4326008)(86362001)(66574015)(316002)(8676002)(53546011)(186003)(6486002)(8936002)(966005)(81166007)(336012)(36860700001)(82740400003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 07:39:41.1340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 906b63fb-7a42-4ca9-52ec-08d90561ca44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2662



> On 20 Apr 2021, at 11:27, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 20.04.2021 11:42, Luca Fancellu wrote:
>>> On 20 Apr 2021, at 10:14, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 20.04.2021 10:46, Luca Fancellu wrote:
>>>>> On 19 Apr 2021, at 12:05, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 19.04.2021 11:12, Luca Fancellu wrote:
>>>>>> - */
>>>>>> -
>>>>>> -/*
>>>>>> - * Reference to a grant entry in a specified domain's grant table.
>>>>>> - */
>>>>>> -typedef uint32_t grant_ref_t;
>>>>>=20
>>>>> Why does this get moved ...
>>>>>=20
>>>>>> -
>>>>>> -/*
>>>>>> + *
>>>>>> * A grant table comprises a packed array of grant entries in one or =
more
>>>>>> * page frames shared between Xen and a guest.
>>>>>> + *
>>>>>> * [XEN]: This field is written by Xen and read by the sharing guest.
>>>>>> + *
>>>>>> * [GST]: This field is written by the guest and read by Xen.
>>>>>> + *
>>>>>> + * @addtogroup grant_table Grant Tables
>>>>>> + * @{
>>>>>> */
>>>>>>=20
>>>>>> -/*
>>>>>> - * Version 1 of the grant table entry structure is maintained purel=
y
>>>>>> - * for backwards compatibility.  New guests should use version 2.
>>>>>> +/**
>>>>>> + * Reference to a grant entry in a specified domain's grant table.
>>>>>> */
>>>>>> +typedef uint32_t grant_ref_t;
>>>>>=20
>>>>> ... here, past a comment unrelated to it?
>>>>=20
>>>> The comment =E2=80=9CVersion 1 of the grant table entry [=E2=80=A6]=E2=
=80=9D was moved on top of the struct grant_entry_v1, in this way
>>>> Doxygen associate the comment to that structure.
>>>>=20
>>>> The comment =E2=80=9CReference to a grant entry in a specified domain'=
s grant table.=E2=80=9D Is moved on top of typedef uint32_t grant_ref_t
>>>> for the same reason above
>>>=20
>>> But it's the other comment ("A grant table comprises ...") that I
>>> was asking about.
>>=20
>> I thought it was part of the brief about grant tables, am I wrong? For t=
hat reason I moved it.
>=20
> Well, the comment talks about grant table entries (the layout of which
> gets defined immediately below, as visible in the original patch), not
> grant references.

Hi Jan,

Of course this can be reverted back if it is wrong.=20

I=E2=80=99ve prepared a page with the output of all my commits (some of the=
m are not yet in the ML),
so anyone can have a look on what is the output and how can sphinx+doxygen =
improve
the quality of the documentation.

Here:=20

https://luca.fancellu.gitlab.io/xen-docs/hypercall-interfaces/arm64.html

the document Is trying to reproduce this other one from the current docs:

https://xenbits.xen.org/docs/unstable/hypercall/arm/index.html

You will receive a warning from the browser because the gitlab certificate =
has problems when
the username has a dot in it.

>=20
>>>>>> @@ -243,23 +258,27 @@ union grant_entry_v2 {
>>>>>>    * In that case, the frame field has the same semantics as the
>>>>>>    * field of the same name in the V1 entry structure.
>>>>>>    */
>>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>>   struct {
>>>>>>       grant_entry_header_t hdr;
>>>>>>       uint32_t pad0;
>>>>>>       uint64_t frame;
>>>>>>   } full_page;
>>>>>> +    /** @endcond */
>>>>>>=20
>>>>>>   /*
>>>>>>    * If the grant type is GTF_grant_access and GTF_sub_page is set,
>>>>>>    * @domid is allowed to access bytes [@page_off,@page_off+@length)
>>>>>>    * in frame @frame.
>>>>>>    */
>>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>>   struct {
>>>>>>       grant_entry_header_t hdr;
>>>>>>       uint16_t page_off;
>>>>>>       uint16_t length;
>>>>>>       uint64_t frame;
>>>>>>   } sub_page;
>>>>>> +    /** @endcond */
>>>>>>=20
>>>>>>   /*
>>>>>>    * If the grant is GTF_transitive, @domid is allowed to use the
>>>>>> @@ -270,12 +289,14 @@ union grant_entry_v2 {
>>>>>>    * The current version of Xen does not allow transitive grants
>>>>>>    * to be mapped.
>>>>>>    */
>>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>>   struct {
>>>>>>       grant_entry_header_t hdr;
>>>>>>       domid_t trans_domid;
>>>>>>       uint16_t pad0;
>>>>>>       grant_ref_t gref;
>>>>>>   } transitive;
>>>>>> +    /** @endcond */
>>>>>=20
>>>>> While already better than the introduction of strange struct tags,
>>>>> I'm still not convinced we want this extra clutter (sorry). Plus -
>>>>> don't these additions mean the sub-structures then won't be
>>>>> represented in the generated doc, rendering it (partly) useless?
>>>>=20
>>>> Are you suggesting to remove the structure from docs?
>>>=20
>>> Just yet I'm not suggesting anything here - I was merely guessing at
>>> the effect of "@cond" and the associated "skip ..." to mean that this
>>> construct makes doxygen skip the enclosed section. If that's not the
>>> effect, then maybe the comment wants rewording? (And then - what does
>>> @cond mean?)
>>=20
>> Yes you were right, in the documentation the structure grant_entry_v2 wo=
n=E2=80=99t display the
>> anonymous union.
>=20
> In which case I'm now completely unclear about your prior question.

We have to choose just if the struct is useful even if it=E2=80=99s partial=
ly documented or if
it=E2=80=99s better to hide it completely from the docs since it can=E2=80=
=99t be fully documented.

Cheers,
Luca

>=20
> Jan


