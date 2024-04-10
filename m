Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582AF8A01E6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 23:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703638.1099386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rufPl-0003t1-6o; Wed, 10 Apr 2024 21:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703638.1099386; Wed, 10 Apr 2024 21:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rufPl-0003qt-3s; Wed, 10 Apr 2024 21:23:29 +0000
Received: by outflank-mailman (input) for mailman id 703638;
 Wed, 10 Apr 2024 21:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rufPj-0003qn-KV
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 21:23:27 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260e::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90ba37ee-f780-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 23:23:25 +0200 (CEST)
Received: from AM6PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:20b:f0::20)
 by PAVPR08MB9354.eurprd08.prod.outlook.com (2603:10a6:102:301::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 21:23:22 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0:cafe::a1) by AM6PR04CA0043.outlook.office365.com
 (2603:10a6:20b:f0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Wed, 10 Apr 2024 21:23:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 21:23:21 +0000
Received: ("Tessian outbound ff4e98f65004:v300");
 Wed, 10 Apr 2024 21:23:21 +0000
Received: from e775a913c96a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C011364D-4148-4D84-BD02-62E6E13D4863.1; 
 Wed, 10 Apr 2024 21:23:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e775a913c96a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 21:23:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB7624.eurprd08.prod.outlook.com (2603:10a6:102:242::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 21:23:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 21:23:09 +0000
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
X-Inumbo-ID: 90ba37ee-f780-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mF5+9ZQqeg548MgnDfNp4P5SF6B5c35ZZv6t1GeU4X4j6CiDNHFe9DWZ4HE7An8AuC+1u0+pkOxmx0io0OZFD9KeF/OWliznDC6WkcfcQ7HyDJ52NcPM7IunXKJwnHmz2S7v3N12gQCJay/cHoAYetB/bVrJcmrJFG/oPEpXpOJE8R1Tr3m8vPZ5IaTX2pV3EDU7Qz6gGfpgAssiGbfgpuHYneOSGRc9ruZ+LUB6mBwcTMd0fd1/UhlX5IhoFMbjve8zK2LC4swxhUGV/04xntgSfH/kp50z+TLVNbcZ36uh5IAjmmfRf9zSqP5bEJtV+QT+7Du7i1/7kI4ujYo3Ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtjdVxjrlIEy/RjoAtV4Lx00phKPUM+IughvFEq9Gc0=;
 b=gzUu+lNnXFPZ1rn7EspLsu/Gt9UwqdDJc9usSh1iOz/eHoqZPohD7x2zcBnZgystd3dAovVNTFKqw4QBTGN4NjBOjcGnNK1SlZkwFCGyb+UuxCQYgFmYyZ1qZaRnJHLbUKRvKGG5acCbQO5wwmDC/oCo+BjBI5XMD3yY3xxbxIr9O4bx1gPFlguHcEK4q3q1EJyS4v3BvCw5k2Qt36xDB6Uh5CzA9dqT4oGJw3ttIdfhOLXrI8q/vL5YVnh8lgm/XWvHoClkof0wVftFhY+L5B/9dY5jyIqXWIvs4jKbqOu/lGoCvWG30aJPR5ikAQ/hnYlU/0sdJO4PFgaFjlD5gw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtjdVxjrlIEy/RjoAtV4Lx00phKPUM+IughvFEq9Gc0=;
 b=Hyu72m6eff4Xf6ilpIS7FZyy1aE75owL6LOIsk0i0SZ5jUljcapFcp/iCAUXUHEb/SleSMjyr0DkCTRi7dYWoCE5cx1nzh51pQkPhEwuWLdW0nZRfmoxdRW6OjcQL5FUcKxOSw0i0S/3281tolb9BZ5tV8c8QCT/cnky979FKLI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bb4dde034fe1286
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMRIvm5ZqILvmAz3IVt3mq8YQWD1zP8LxDEtfmCi8cjdVp38pixe1u6RdX4Qz3DNJzwop2Pvs9TfO4yPVD1/OdJhDDq0ZW2XZGV3Y+hb5Jlntxm+RSkvuebzdRqwBqZBoxZQFdUe4H8bdlkTN0DQ2j7SwZ4TRE3LFA/7BAsbML0ooWl5BqHozapLM7NdPOkZZRPk5QLAPbP6woG6ZDWGbMOy+emXvdPelcYKKro8D5bIFAWsewI5WMkhHDREcPu6UmXpz/vJ0Pscf88tjFs8kZjOV8G/NFhNsgMOeMS5Q0WRWswgD7XrgaKX0vjL4MRS9bOzM+s69pGSRTtkUsMxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtjdVxjrlIEy/RjoAtV4Lx00phKPUM+IughvFEq9Gc0=;
 b=OXvC9as8IrBnbLBM4iH7HOl3ITeKrTjjuTEik769IZ4TyulYl9/gwwqxJDLyjY3V4Cw6HlM9jCQWjK7omqfwsU5EDiZzk2nfmnH10WOZqdFGALz1sjFgsoVCgidypTJnKLhkJB+Tl1gOInpBJEUzUAXAAYqsvjIU3zFQbEo0IbhRexPLjLJCjLICofJhFlEDYL145pWKLdVUAWAklpTXkl1wyl9kxNdMMjqIPyC2Ic8Jy5SsK96eA8dEDYRv3OB+NssWauWKjjAxr412SK9glOYSLR6RJ1jVYtdGIH3Rm30d+f8kpZyboXQQTxW4Jezra/dP/LAIZXH1d0XmBig+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtjdVxjrlIEy/RjoAtV4Lx00phKPUM+IughvFEq9Gc0=;
 b=Hyu72m6eff4Xf6ilpIS7FZyy1aE75owL6LOIsk0i0SZ5jUljcapFcp/iCAUXUHEb/SleSMjyr0DkCTRi7dYWoCE5cx1nzh51pQkPhEwuWLdW0nZRfmoxdRW6OjcQL5FUcKxOSw0i0S/3281tolb9BZ5tV8c8QCT/cnky979FKLI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Juergen
 Gross <jgross@suse.com>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] xen/spinlock: Adjust LOCK_DEBUG_INITVAL to placate MISRA
Thread-Topic: [PATCH] xen/spinlock: Adjust LOCK_DEBUG_INITVAL to placate MISRA
Thread-Index: AQHai35ZGujeX/vlNEOnzpRmbshCIbFiA4cA
Date: Wed, 10 Apr 2024 21:23:09 +0000
Message-ID: <8384F95E-4EE0-457D-9858-7461556432EB@arm.com>
References: <20240410193531.1499128-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240410193531.1499128-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB7624:EE_|AMS1EPF00000046:EE_|PAVPR08MB9354:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TiqWukN29JYoqQuh6WAP/1QdAwDMBrMU35lWTXl4CA8i657VNVL5pDvPmr5hChMyRKOuDUdpAjcjjlTnTQlNRd/+aL/5rtbsiwu9ecqk1cjkyHvLwfVV8HCo7W3nMwNVdscfkl3Z/dSPHoN8pKUV4ckqkspjf59huswPF2BOsfkLrq3rIaUk9PkB2oanGZfEmR4crMkFDjc66mYkWm3jnG3kmuuW5wIjSNGN2A1yMMM74K1HkwP3U45HiCba9lnflXiyopDBUQRkul/6Pjv52WF4CGuSq8nPQIz74d1X1h0W4u0+7TDWCx187b+pcFsjO+XoYxp0bJBUcIcl8GDYsBjtsO7k6XBvBgo/b/OQ+uEzbdBLwLCmDbFm2UdkxFG5dMNLGl6wmdwnsJ6Gn/WcXkF3QsTQHWN5cwnrszX/4JQI1OcuPR9I883tVJglLLc/Czf1nuWKDco5GPIW+7ra06Q+kjtEzj1Tu2sTf6eZX6z2HFdeMw6GdWKTHFm35voRVgeFMGapENHVdN4UZaeDuTJxLOX0ePoTpKwJdmxQcYJZ0YvmjeO8XPNTxDcr5jIOKoJ6ZZhpuQXvpVEPyhI0w01phuiBtPPVSnKmgOux47MkDS29FcQYFKzaHHbdc4QkxaZ6OC7v1TlFULYc8mzMlI2EHbSuz3+ZJAFd5KY/43Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <63CC7FE6E236874FB48D290B7F09C107@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7624
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eefeb339-72e9-44de-2e81-08dc59a472f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BWT9qjSQ5qxitCPmo6nEO48y4dhiCgmVSWQp8k7RobBtbMw2zu8RvVGVONw2Z0WHz2mw2/dMBslKYi7ctTS62f4ayHaWsm4ie5Cu3B2jRmhvkkpVgHEVDJKM/jpE3BjaXgrvZznfXVY4Rc3E1o7yWhi4AuxSeIr3VVya95/1tlkYQDPc+YzaJWd1oxZME144R56zxTIPWk33a5+W1Ma5uDo+jaFUOigo00k/YplnMJM7d4bdpVVZc9fD9RGRPRr2Qza3yDm5r5ZEFtdiU58xDWL3eHPhTq6A2XCK5gNcreE0WAGTIQ9vVsc3DCBm7hVRAcHhqgtBkJQs0EEtLGtf1MSYmakad0h7RgBoTL+7mWfQ7aLy7DdkSUnyvNQ6laXM9EjFK9F6fCIATHO9yL/pF/DmRR77MjR+auellXqoLosFoMGQTpggY1WVz0FuoLsTrmACc5nobVqFEHDkv1vzi9tRd0ZL037yzrqa9VhJ/ApktKe42BwbyUP+bOgmSVMq/uPUi/01+Zsu7nbtZ28AJzlgxhjlV9fIs6cY/7dH/ZimvfVbSbppl+ezb0N/Ngx7tEyMr0aHuer3TLd6d6i01+4sE0PX5RcU58av9ZA7Du7QdomflR+E91P0E/IIUcDK9B0AreX29hJWNyfcScHQIy2T/4zgw0FP7DKUkc45S9ZaqiaIQqCo38afcTFcCFAW44qlUGnYdywFRd3OjidllIbxMrSb4A8XFgym9l9uXH4Tp7r7FwP1nYEOgyrpFNHf
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:23:21.7347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eefeb339-72e9-44de-2e81-08dc59a472f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9354



> On 10 Apr 2024, at 20:35, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> Resolves an R7.2 violation.
>=20
> Fixes: c286bb93d20c ("xen/spinlock: support higher number of cpus")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Yes makes sense

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




