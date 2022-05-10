Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C079521433
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325514.548110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOMq-0003Qz-06; Tue, 10 May 2022 11:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325514.548110; Tue, 10 May 2022 11:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noOMp-0003Nd-TG; Tue, 10 May 2022 11:49:27 +0000
Received: by outflank-mailman (input) for mailman id 325514;
 Tue, 10 May 2022 11:49:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYXr=VS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1noOMo-0003NV-AC
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:49:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cd013ca-d057-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 13:49:24 +0200 (CEST)
Received: from DB8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::21)
 by DB7PR08MB3498.eurprd08.prod.outlook.com (2603:10a6:10:4c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 11:49:23 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::c4) by DB8P191CA0011.outlook.office365.com
 (2603:10a6:10:130::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Tue, 10 May 2022 11:49:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 11:49:22 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Tue, 10 May 2022 11:49:22 +0000
Received: from 5dd077443832.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D1975CA-742C-488C-99FE-C3271F74CB54.1; 
 Tue, 10 May 2022 11:49:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5dd077443832.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 May 2022 11:49:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB5778.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 11:49:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 11:49:15 +0000
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
X-Inumbo-ID: 3cd013ca-d057-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ALxE5FNwy0+AKLVoat9S+AGIo1vptNCRcfcu8BIFv4OJZ1KW7IoWLqhQyBHUrybmi8RNat0CYd+PzCSCs7NnlO05gBB/174yu0o8f9JNSnlhg4H+0wNic8Q+GzYoYJ8tysktm+hw+FXcMRj+Kqhy8Npsd215E6yDzKG6wbWWn2M6oOMTGKPIpdV6FOOFbHDM8N7pVKWfZvEtAPe5wC5al666T18Q166r3v5B0QNoGyyS+bdqjOFlnSvETFZFL393Ggel2u0STSBOfonWyamxSjv9RzrBVSTWs6ROoQKoirdeEdYQyrdumaC2RCPAdeE4O3Ew+FkY/ZGHv/LJ57Sj7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7jKmIRWWUAkDdjY/KhGQD5W+r5PsML83FL4dxiUmks=;
 b=Fz4cL0j4GBNvQfvsYptEHAIqH6ZdFNmTeUaQtPJH9FGtRwjQoSjqM7iNq9EYHd8PVBmUtDJH9n28jq2WH5qgSeCzKPt13mIScOAaXBFeRT2IP+3NfG5JtP4ss6qbVTobb9kyfpN3clEc4PMH2YHIASEobkY5lMleEWFcLym6eJhBBI0eyXbsr0EMbrjGxyZEdqggHyFZ9j9DZuRcFcZH/omexXpQiPFGPsH41CyLzVn/+VBZAlGbkCCGlOfscWbCOyugGF591gIXD1enAnM04tHLveN/kB9NmrVLNYgUGhH8LJYun7YSW6k3ywUYDN0WBt45VUJfHh9gfyRY3GkLZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7jKmIRWWUAkDdjY/KhGQD5W+r5PsML83FL4dxiUmks=;
 b=EJdj6igrvyeexdT3CfEqcNrsnsRkwMaHPQSpJfW1mf5z0Gbhya8iQrvTVQpzxvHpjDw9p+MNHGWkJQY32vUSrSf2ODsyyrObxizWUfs+11WYBTxHVRZicRPXfwIrMSEU8N+Jz3PuzvLCvUI0A59bDKulpTLQm03KGFfIhAKRuMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 388f78bf1f728a58
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baYjLXh185jWjMTNNJr+MDA7sLn8ZBKake3gT5eROg3TQqMG4/OwwHNCTl+U/clb5L4IBgTzeaN2wbwxNXS8DYFz/6UEvyHGPWpzWdZ3E2I3lKI+UogO0oklGCAlk8gmyJeNzNsL9tMbn7uKHQRP63iqFAdWi1L3p63YpTPipyX60508ZHmVqyCfRnyV8V2UBqSGh78V9a63GSaZs8saorym4AMvJeG2Y8WZlt9k6DlRJX5H+lTOVCzNKO8qRLEWapVDXCQyclsQy8K+rag1oOKVNuz+QEn7z63nOQa3uC0zRrBBYCh5WVeCc+6dJakkbht5DPCxjzV7tmtTNBnaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7jKmIRWWUAkDdjY/KhGQD5W+r5PsML83FL4dxiUmks=;
 b=Dl2vajc6q1g5NFZwDZo/i2vNdpDwonXTF2oRLXddKrj7K6bl0VaYvjr4CfBAe0nbS/Xu2OJwF8ATbHF5ZjZsAfD1agoOp4YoaGnTFu6iLqhNzXWcARN1a7UixawvI+V4f9T66uMR0VJR3qEVyCusVDqvp5/63SJgfTMoH9dHgd0LyFJIkeFoIqyF5DqJtYvudmGHwlK43cjJDqs3z9peIfwvJ7Q4z0VMuGWUMkBFU3jkGV4CvCl2R7jaSxbB6mheLSA83E0R6BInPw+LCZpqF4MbXufMSVzxkTHwTuLELrMUcwk2G7zUkWKgpMd1x9l6Fw50Kj6IICdKqwb9PZyk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7jKmIRWWUAkDdjY/KhGQD5W+r5PsML83FL4dxiUmks=;
 b=EJdj6igrvyeexdT3CfEqcNrsnsRkwMaHPQSpJfW1mf5z0Gbhya8iQrvTVQpzxvHpjDw9p+MNHGWkJQY32vUSrSf2ODsyyrObxizWUfs+11WYBTxHVRZicRPXfwIrMSEU8N+Jz3PuzvLCvUI0A59bDKulpTLQm03KGFfIhAKRuMs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal
 Orzel <Michal.Orzel@arm.com>
Subject: Re: [PATCH v3] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Topic: [PATCH v3] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Index: AQHYWWqn4igAeGv7Uk6q5mD33SrErq0W8JQAgAEkhwA=
Date: Tue, 10 May 2022 11:49:15 +0000
Message-ID: <5CD3173A-77CB-46C0-81BA-38CDFC6DF5E9@arm.com>
References:
 <8a8ffce11591efb284c93214b77534fa4e4134b2.1650976647.git.bertrand.marquis@arm.com>
 <dd0d090d-24fd-bab5-7a30-598710bc04e5@xen.org>
In-Reply-To: <dd0d090d-24fd-bab5-7a30-598710bc04e5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9862ed13-d3a6-492f-7563-08da327b1fff
x-ms-traffictypediagnostic:
	AM8PR08MB5778:EE_|DBAEUR03FT035:EE_|DB7PR08MB3498:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3498847AF42CA68B6B05A5559DC99@DB7PR08MB3498.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fNEhxsL7RqT9FRfP1JRvf796m2liHwwIowCw2yGYi4+sRIS/G8sstet5bUU8hlJXq6h5BZrKFbwvc1C/tRlnxrvPjXUO5d/frpKAcFxCekgIksEYrb5fbbYWvvxsPbleXn+6q22kjzPpbRlVzC/SOwhOtBbvos3GDyxodDaHlbQ0NrorxBHza/erD54Arfp5CWOPFBx7kcLu6qrqRmWcabHEk/kfNOdRD/KhD+ooFI+15hqZaBncCKgqKLigpWQ7ZNkJkIXqPBxSzb3p8hkDpgwB3GjGWFaviWHoaqwh5c8+mHfoCyBCWYVH56vFiYLvPyUVj17nnqzj0e992w8t8ONqNRnW4+k8pvdbKY4W4HlOlRLpCNHIMIaTR0OOUUMAtvIFA54UbCBB5Z9T1B2yg0AxRrxjyV6cs4khmYigvjWjvpcYkX75iLA5aXK9skPXVd6Et2pmva8lYfl5D/I9ZiqJdc3IU21Pb++HdiuOWt0wQc0Lj0+sbKCLqTzSWKH+ipBmanZt2fLFbP1wpNguFoNrDYtLM04HuHShwsxEf+PhXaQuGutksVadVNAIlZ5RoF5/kg+zd/le0K7G7Mvz7KUJlxvrDzH+KdNtVpB9f4UA1AJaFS9f6zrqdh1AamrOl7aK1TvI+M5pTpm6sXOMtoVWGO9CL34G/OjmgJwIgsLDfPWBrjfF0qZoLlqKV7+eC+UPiFNhQxj3DO76eH866TlUMAHWVokHt4hemL348dL6NATmN79vXbBrIs1qU76y
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(38100700002)(38070700005)(6486002)(6916009)(54906003)(122000001)(316002)(186003)(91956017)(8676002)(8936002)(4326008)(64756008)(66446008)(6506007)(71200400001)(36756003)(6512007)(2906002)(76116006)(26005)(66556008)(66476007)(53546011)(66946007)(2616005)(4744005)(33656002)(5660300002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15D83459BAFA28409AE8B7F645C30925@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5778
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc98fda3-aace-4e96-c960-08da327b1b90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hLPU8++1c+iTFn69PNjdXvvApw3q6pBgNB0JxCf5RrE5R+alp9cmGsd5ogSZyFbxGHYUYwuF/wm29e5oHnJmlth1lf4yuVugTVCUAAhdi+3y4f45xyvaWXW4C8U2Eub7oU1vtZPOKtlbFbin9yfa/xnJh71zLpje+u+tf9vpxAY/XurrP7KlSyENW+nD3YjMqQU5dMxKh7eSqRcSuqUab/tZaFZy6Byaug9cGZq8S+K3dFGZMfXhilmobQjyQICiZk/14+zjTBhqSIDu451EFSz4Jd01bqH0V8MRwFFr4kuw7VY7P4frdulGv37Np9IPOT6u7UMnQZZqoGkCexZ+kpH6LvdARuVtH62hxkkwBYYp7wuTpde4DeBgofLsUQzysE0bUar9XFeMiLsw+3z6uLBCnsdyj+jpo+EZBKjhzOIoonKxtpzIB6lOoHzjFfu0r7n+NTBGewI6eOxqOaA6uVV7MLXDjCAJpm0BZPUwAjYeUv1bl/dmsA94Bk45Z6i6azriNE1kXqO2X4Er0H1P7C1QNVljowfQ4YvcBmghIJed8h1Vtw6VcTMgYa8qach5gMNyUSjJkt55DkZ/lgvMbN/JOHUSqangX+pMa5Lqoy+5IJMngJY1UL1LFaBrZY7/PGhWBpyoW8RlnFl0A67FdujSDEj5AXRhTL6E32yy5bP6ZmoGVwwn1SabUElUyOP8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(36756003)(47076005)(54906003)(336012)(316002)(8676002)(70206006)(70586007)(2616005)(6512007)(36860700001)(82310400005)(6862004)(26005)(356005)(186003)(4326008)(40460700003)(6486002)(53546011)(33656002)(6506007)(508600001)(81166007)(5660300002)(2906002)(8936002)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 11:49:22.5391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9862ed13-d3a6-492f-7563-08da327b1fff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3498

Hi

> On 9 May 2022, at 19:22, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 26/04/2022 13:38, Bertrand Marquis wrote:
>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include=
/asm/processor.h
>> index 852b5f3c24..ef37cfa16f 100644
>> --- a/xen/arch/arm/include/asm/processor.h
>> +++ b/xen/arch/arm/include/asm/processor.h
>> @@ -219,9 +219,11 @@
>>                           SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
>>                           SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
>>  +#ifndef CPPCHECK
>=20
> Can you add a comment explaining why you need this check?

Sure, would the following be ok ?
Cppcheck preprocessor is wrongly throwing the error here so disable this ch=
eck for cppcheck runs

>=20
> With that:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20

Thanks
Bertrand

> Cheers,
>=20
> --=20
> Julien Grall
>=20


