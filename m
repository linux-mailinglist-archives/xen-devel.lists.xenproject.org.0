Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEAE7BB2C6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 10:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613275.953722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofkc-0005qq-D8; Fri, 06 Oct 2023 07:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613275.953722; Fri, 06 Oct 2023 07:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofkc-0005nz-98; Fri, 06 Oct 2023 07:59:58 +0000
Received: by outflank-mailman (input) for mailman id 613275;
 Fri, 06 Oct 2023 07:59:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4crp=FU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qofkb-0005nr-0t
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 07:59:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55aaada0-641e-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 09:59:54 +0200 (CEST)
Received: from DUZP191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::13)
 by AS8PR08MB6262.eurprd08.prod.outlook.com (2603:10a6:20b:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 07:59:17 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4fa:cafe::49) by DUZP191CA0059.outlook.office365.com
 (2603:10a6:10:4fa::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37 via Frontend
 Transport; Fri, 6 Oct 2023 07:59:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.29 via Frontend Transport; Fri, 6 Oct 2023 07:59:16 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Fri, 06 Oct 2023 07:59:16 +0000
Received: from 7f3042740800.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 893009A5-D33D-4321-929F-FE64B86A4E59.1; 
 Fri, 06 Oct 2023 07:58:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f3042740800.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 07:58:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBBPR08MB5978.eurprd08.prod.outlook.com (2603:10a6:10:1f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 07:58:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%6]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 07:58:14 +0000
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
X-Inumbo-ID: 55aaada0-641e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWYTb3bYtynOgVLpm9cg6ocPJoPTeA9dG4O2Any1404=;
 b=kR6LRG8G2F0AY0L3tEfLisNyxK+/oO4nxFyPCUNnzDLf30Cl7cy0diFXqRqit6k6ceemtnG8w4sKeY+pW9EsZy6yyDUjE8yZdFUrDnywO4AXoV+tdp1sSw+LgbG1A578UzUvWqquT2fD1vqEvlZPSBVQjrGwBNWzvphMc9YHIto=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bec4b704c0706fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ctmmz0lpiFXSRDG2MVan1cJERnnjacTWwsCF0Quz9Wq1lW8itBJ8EOwiPVn2pRHp4pDP6Q8nXygGx4Rn0lOcsOIgVLxBTxAGRNMdiUL4CQSTa6fhcttWleLFwsNWnTP8JZ2z2QiWKHs9C85yqO57CjL4scIjGDt5Mz049wR8lNeHOC1By0xzRTgE2Vease77h4qKeMgqCGeAAGz2rYruAHb7xHsA9j8uN/Pmxqg0bLihiOsdcDoJ7I5Lr0nQjmWRJAUntctBl2B3Kntw0SoPNv9lwr1n92PtuAZgZG63qeqsDNvG8+tCAiqM9Fkl50Uyd9vmkUsp9zxDbDPK4y6MmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWYTb3bYtynOgVLpm9cg6ocPJoPTeA9dG4O2Any1404=;
 b=CnS9J7qmQEfyObAIW5pYEs3FdJBkxzOgA7e07QvniAXl+IITMopC8lP2NfikRsjj2+FugZpVonwtw3Zh84m76ZJb886iWkz1LZwe6VU/n9hADU2Gsx5g03E8MrCxzBtapnnS4YoczkHs71cfX5sRq9i9BoJ1GtBMbhVqI9bN8V748gsaQ7amdTwvHk3dPQTVkFGDZXhXBUwEm/sP0wfext+r9WWjaP3emoafg3Uh0DxgYGwib8em0eUg0/MBZKrCWzQen2t59pIEPgSsRyzi/z9n0J9ciBcwO7yoRlZ8BwpyF88n+jK1ovfLYVV1PyQDLnoRoG/KPoNEsDB7KVBcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWYTb3bYtynOgVLpm9cg6ocPJoPTeA9dG4O2Any1404=;
 b=kR6LRG8G2F0AY0L3tEfLisNyxK+/oO4nxFyPCUNnzDLf30Cl7cy0diFXqRqit6k6ceemtnG8w4sKeY+pW9EsZy6yyDUjE8yZdFUrDnywO4AXoV+tdp1sSw+LgbG1A578UzUvWqquT2fD1vqEvlZPSBVQjrGwBNWzvphMc9YHIto=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Topic: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Thread-Index:
 AQHZ9qj87vFsnMRst0ybMa+ffKOLU7A5Z4mAgAAGhgCAAAYzgIAA1KIAgACGqQCAASTEgIAAdASA
Date: Fri, 6 Oct 2023 07:58:13 +0000
Message-ID: <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com>
References:
 <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
 <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com>
 <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBBPR08MB5978:EE_|DBAEUR03FT039:EE_|AS8PR08MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe9df95-2bc6-433e-9518-08dbc642238f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /+WtCTiygEOwKKFhA9WVlo2peL4s6oKUobBG5CvycshBTZkT+6gvMdwxResS1Myb86iQCQ8nFCshOYfILM5gkE10x+PFpYMNC4nwylw5Yrhn1jn/FUQoEsfmNpI4cyJgVnGR4ur9dsfFBk1wlswJNXnyF7viK2+TnLWho8XrS5nu7o1U/5tkWfsfL51kOLWk/wKAU2KE4sx+eIwdBwCVVK85fzQHRvASSbjTcG8/BlK+i+VUwlDGPKbOjQgLNywyLdCSoI7ncw7g7UNIwQc304UY2SMwL5E4VAee69RMoK93AwZJETsmAPMH/SMzbyG6cyUVZX6Yq1zJVb9bjP9fGu5HioB7PYJhfi/3HY5SUQluTHAsLB7J9ZBXVmGwo254oYuiLHRtZ7KGe+rqJF4h0v800d03B0fOQ1bBwyXc5gVnQKO47LZFoghENF291+pyEtJm4eXKMrgmd892djUM70s5hCU5hqJzAIQG61tMbGTLfm9Bcsme9e2kwYPWi5h5lrvI0+E4P+uZRhhyldq3C9VtanjUcFM6OOnT+svEZ0ApMnSPvy+c3d6fnOgnlmmYAudb0J4ViTqTjQ3BJoj32DctZSbbOgoBeRfPqUB8CEMyKLmP/xGwXI8psVIEVD4BK6xbf+EbiPfeKgVmqgpJPQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38100700002)(38070700005)(71200400001)(83380400001)(122000001)(6506007)(53546011)(26005)(2616005)(316002)(36756003)(41300700001)(54906003)(76116006)(66946007)(66556008)(6916009)(91956017)(66476007)(66446008)(64756008)(2906002)(33656002)(7416002)(86362001)(4326008)(8676002)(8936002)(5660300002)(6486002)(478600001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <28CE4C167FAE244B9B807BCEFC78190B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5978
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29f62db2-9392-4284-2e67-08dbc641fe0b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DKTOMa8rp16bNaeM5PagsoAa78IabvKMyrfWtFNJy3R+k77yiW2XS4FQZCu93KVNxI22MTwZczKFoYjddvuZueVoInw5OTbvIr7qxMQ7ODOXCWPF+qRwDlt5MuNypGFA3njMA3/fY4SZ0vL/O+C5Q9NG1RtOxTnhXylzZ3ycjyT6S2d9Mh+II0NjNH8UhIE+7R3G4hHTo/UEWv6DXUI9ozByzFJLWzHxwjCjFCMTb1oX489gtrus+n2xSl0Okdc6Xp7jOB4Kk1/lQxWFc17BFJl7A05S/fahvDv7/cLYDxYZWS7NUfwapDdOfTlFr+SD8Nl03zZcd7UphVWzq2tu8nsRm2Oe/Qp6Rt57SFMxJRs7TbsjzEMrol1Ln2+xYdWiUUAFz14ol9bFaAljBOZvMpr6ipjSpz6ekYNXpztQKYV15rPR7DTBZIXYTHz91gO7Nrg2eUXP1Cqcs4nyXYmnAg/bU/UcZWT5AqHSKZtbzordYjQ7Vpv+AwjcNmy8QkRKzhiEVNrd1j2zRHrhX64SRGEnxRhIOQoKjQeZbQLwwcj2LZJvvzXtOs295t3TCW/73S/I4E5x7/eYEYf4gSCRP6FqXYFAOUiOKoKl175/BJgqEW57XH9wclP7Sl7oesYygP1/0WEbn49uDpCDuhI1kSfE6rSKph7KsIeaQsQWEMTrc3fbrRN/I9lKcg0ZBuBSt+wv9KxS+4ySFG10UZx5xtR4Nj4vi7agraocLQuYo/+rogEfNHmuecyBcbxSfDBj
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(82310400011)(186009)(1800799009)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(53546011)(6506007)(478600001)(6486002)(6512007)(83380400001)(2616005)(107886003)(26005)(316002)(2906002)(41300700001)(70586007)(70206006)(5660300002)(6862004)(8676002)(8936002)(4326008)(36756003)(54906003)(36860700001)(33656002)(47076005)(86362001)(356005)(82740400003)(81166007)(336012)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 07:59:16.9342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe9df95-2bc6-433e-9518-08dbc642238f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6262

DQoNCj4gT24gNiBPY3QgMjAyMywgYXQgMDI6MDIsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDUgT2N0IDIwMjMsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gNSBPY3QgMjAyMywgYXQgMDA6MzIsIFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2Vk
LCA0IE9jdCAyMDIzLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4gT24gNCBPY3QgMjAyMywg
YXQgMTE6MjksIE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4gd3Jv
dGU6DQo+Pj4+PiBPbiAwNC8xMC8yMDIzIDEyOjA2LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+
Pj4+IEhpIE5pY29sYSwNCj4+Pj4+Pj4gT24gNCBPY3QgMjAyMywgYXQgMTA6NTYsIGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20gd3JvdGU6DQo+Pj4+Pj4+IE9uIDAzLzEwLzIwMjMgOTo0NiBwbSwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4+Pj4gT24gVHVlLCAzIE9jdCAyMDIzLCBO
aWNvbGEgVmV0cmluaSB3cm90ZToNCj4+Pj4+Pj4+PiBBcyBzcGVjaWZpZWQgaW4gcnVsZXMucnN0
LCB0aGVzZSBjb25zdGFudHMgY2FuIGJlIHVzZWQNCj4+Pj4+Pj4+PiBpbiB0aGUgY29kZS4NCj4+
Pj4+Pj4+PiBUaGVpciBkZXZpYXRpb24gaXMgbm93IGFjY29tcGxpc2hlZCBieSB1c2luZyBhIFNB
RiBjb21tZW50LA0KPj4+Pj4+Pj4+IHJhdGhlciB0aGFuIGFuIEVDTEFJUiBjb25maWd1cmF0aW9u
Lg0KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmlu
aUBidWdzZW5nLmNvbT4NCj4+Pj4+Pj4+ICJTQUYiIGRpc2N1c3Npb24gYXNpZGUgdGhhdCBjYW4g
YmUgcmVzb2x2ZWQgZWxzZXdoZXJlOg0KPj4+Pj4+Pj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+Pj4+Pj4gV2VsbCBuby4gICJTQUYi
IGFzaWRlIChhbmQgU0FGIGRvZXMgbmVlZCBmaXhpbmcgYmVmb3JlIHJlcG9zdGluZyB0aGlzIHBh
dGNoLCBvdGhlcndpc2UgaXQncyBqdXN0IHVubmVjZXNzYXJ5IGNodXJuKSwgLi4uDQo+Pj4+Pj4+
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5oIGIveGVuL2FyY2gveDg2
L2h2bS9zdm0vc3ZtLmgNCj4+Pj4+Pj4+PiBpbmRleCBkMmE3ODFmYzNmYjUuLmQwNjIzYjcyY2Nm
YSAxMDA2NDQNCj4+Pj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uaA0KPj4+
Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5oDQo+Pj4+Pj4+Pj4gQEAgLTU3
LDE0ICs1NywyMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3ZtX2ludmxwZ2EodW5zaWduZWQgbG9u
ZyBsaW5lYXIsIHVpbnQzMl90IGFzaWQpDQo+Pj4+Pj4+Pj4gI2RlZmluZSBJTlNUUl9JTlQzIElO
U1RSX0VOQyhYODZFTVVMX09QQyggMCwgMHhjYyksIDApDQo+Pj4+Pj4+Pj4gI2RlZmluZSBJTlNU
Ul9JQ0VCUCBJTlNUUl9FTkMoWDg2RU1VTF9PUEMoIDAsIDB4ZjEpLCAwKQ0KPj4+Pj4+Pj4+ICNk
ZWZpbmUgSU5TVFJfSExUIElOU1RSX0VOQyhYODZFTVVMX09QQyggMCwgMHhmNCksIDApDQo+Pj4+
Pj4+Pj4gKy8qIFNBRi0yLXNhZmUgKi8NCj4+Pj4+Pj4+PiAjZGVmaW5lIElOU1RSX1hTRVRCViBJ
TlNUUl9FTkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzMjEpDQo+Pj4+Pj4+Pj4gKy8qIFNB
Ri0yLXNhZmUgKi8NCj4+Pj4+Pj4+PiAjZGVmaW5lIElOU1RSX1ZNUlVOIElOU1RSX0VOQyhYODZF
TVVMX09QQygweDBmLCAweDAxKSwgMDMzMCkNCj4+Pj4+Pj4+PiArLyogU0FGLTItc2FmZSAqLw0K
Pj4+Pj4+Pj4+ICNkZWZpbmUgSU5TVFJfVk1DQUxMIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBm
LCAweDAxKSwgMDMzMSkNCj4+Pj4+Pj4+PiArLyogU0FGLTItc2FmZSAqLw0KPj4+Pj4+Pj4+ICNk
ZWZpbmUgSU5TVFJfVk1MT0FEIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMz
MikNCj4+Pj4+Pj4+PiArLyogU0FGLTItc2FmZSAqLw0KPj4+Pj4+Pj4+ICNkZWZpbmUgSU5TVFJf
Vk1TQVZFIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDMzMykNCj4+Pj4+Pj4+
PiArLyogU0FGLTItc2FmZSAqLw0KPj4+Pj4+Pj4+ICNkZWZpbmUgSU5TVFJfU1RHSSBJTlNUUl9F
TkMoWDg2RU1VTF9PUEMoMHgwZiwgMHgwMSksIDAzMzQpDQo+Pj4+Pj4+Pj4gKy8qIFNBRi0yLXNh
ZmUgKi8NCj4+Pj4+Pj4+PiAjZGVmaW5lIElOU1RSX0NMR0kgSU5TVFJfRU5DKFg4NkVNVUxfT1BD
KDB4MGYsIDB4MDEpLCAwMzM1KQ0KPj4+Pj4+Pj4+ICsvKiBTQUYtMi1zYWZlICovDQo+Pj4+Pj4+
Pj4gI2RlZmluZSBJTlNUUl9JTlZMUEdBIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAx
KSwgMDMzNykNCj4+Pj4+Pj4+PiArLyogU0FGLTItc2FmZSAqLw0KPj4+Pj4+Pj4+ICNkZWZpbmUg
SU5TVFJfUkRUU0NQIElOU1RSX0VOQyhYODZFTVVMX09QQygweDBmLCAweDAxKSwgMDM3MSkNCj4+
Pj4+Pj4+PiAjZGVmaW5lIElOU1RSX0lOVkQgSU5TVFJfRU5DKFg4NkVNVUxfT1BDKDB4MGYsIDB4
MDgpLCAwKQ0KPj4+Pj4+Pj4+ICNkZWZpbmUgSU5TVFJfV0JJTlZEIElOU1RSX0VOQyhYODZFTVVM
X09QQygweDBmLCAweDA5KSwgMCkNCj4+Pj4+Pj4gLi4uIHRoaXMgaGFzIGJyb2tlbiBhIHRhYnVs
YXRlZCBzdHJ1Y3R1cmUgdG8gaGF2ZSBjb21tZW50cyBhaGVhZCBvZiBsaW5lcyB3aXRoIG9jdGFs
IG51bWJlcnMsIHdoaWxlIC4uLg0KPj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL3N2bS9lbXVsYXRlLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMNCj4+Pj4+
Pj4+PiBpbmRleCBhYTJjNjFjNDMzYjMuLmM1ZTMzNDFjNjMxNiAxMDA2NDQNCj4+Pj4+Pj4+PiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMNCj4+Pj4+Pj4+PiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL3N2bS9lbXVsYXRlLmMNCj4+Pj4+Pj4+PiBAQCAtOTAsOSArOTAsOSBAQCB1
bnNpZ25lZCBpbnQgc3ZtX2dldF9pbnNuX2xlbihzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50
IGluc3RyX2VuYykNCj4+Pj4+Pj4+PiBpZiAoICFpbnN0cl9tb2RybSApDQo+Pj4+Pj4+Pj4gcmV0
dXJuIGVtdWxfbGVuOw0KPj4+Pj4+Pj4+IC0gaWYgKCBtb2RybV9tb2QgPT0gTUFTS19FWFRSKGlu
c3RyX21vZHJtLCAwMzAwKSAmJg0KPj4+Pj4+Pj4+IC0gKG1vZHJtX3JlZyAmIDcpID09IE1BU0tf
RVhUUihpbnN0cl9tb2RybSwgMDA3MCkgJiYNCj4+Pj4+Pj4+PiAtIChtb2RybV9ybSAmIDcpID09
IE1BU0tfRVhUUihpbnN0cl9tb2RybSwgMDAwNykgKQ0KPj4+Pj4+Pj4+ICsgaWYgKCBtb2RybV9t
b2QgPT0gTUFTS19FWFRSKGluc3RyX21vZHJtLCAwMzAwKSAmJiAvKiBTQUYtMi1zYWZlICovDQo+
Pj4+Pj4+Pj4gKyAobW9kcm1fcmVnICYgNykgPT0gTUFTS19FWFRSKGluc3RyX21vZHJtLCAwMDcw
KSAmJiAvKiBTQUYtMi1zYWZlICovDQo+Pj4+Pj4+Pj4gKyAobW9kcm1fcm0gJiA3KSA9PSBNQVNL
X0VYVFIoaW5zdHJfbW9kcm0sIDAwMDcpICkgLyogU0FGLTItc2FmZSAqLw0KPj4+Pj4+Pj4+IHJl
dHVybiBlbXVsX2xlbjsNCj4+Pj4+Pj4+PiB9DQo+Pj4+Pj4+IC4uLiB0aGlzIGhhcyBjb21tZW50
cyBhdCB0aGUgZW5kIG9mIGxpbmVzIHdpdGggb2N0YWwgbnVtYmVycy4NCj4+Pj4+Pj4gU28gd2hp
Y2ggaXMgaXQ/DQo+Pj4+Pj4gSSBhZ3JlZSB3aXRoIEFuZHJldyBoZXJlIGluIHRoaXMgc2Vuc2U6
IHRoZSBpbi1jb2RlIGNvbW1lbnQgaXMNCj4+Pj4+PiBzdXBwb3NlZCB0byBiZSBvbiB0aGUgbGlu
ZSAqYmVmb3JlKiB0aGUgdmlvbGF0aW9uLA0KPj4+Pj4+IG5vdCBvbiB0aGUgc2FtZSBsaW5lLCBz
byBJ4oCZbSBhbHNvIHdvbmRlcmluZyBob3cgaXQgaXMgZml4aW5nIHRoZSB2ZXJ5DQo+Pj4+Pj4g
Zmlyc3QgdmlvbGF0aW9uLg0KPj4+Pj4+IENoZWVycywNCj4+Pj4+PiBMdWNhDQo+Pj4+PiANCj4+
Pj4gDQo+Pj4+IEhpIE5pY29sYSwNCj4+Pj4gDQo+Pj4+PiBBY3R1YWxseSBpdCBqdXN0aWZpZXMg
d2hhdCBpcyBvbiBlaXRoZXIgdGhlIHByZXZpb3VzIGxpbmUgb3IgdGhlIHNhbWUgYmVjYXVzZSBp
dCdzDQo+Pj4+PiB0cmFuc2xhdGVkIHRvIC8qIC1FPiBzYWZlIE1DM1IxLlI3LjEgMSAqLywgd2hl
cmUgdGhlIGxhc3QgbnVtYmVyIGlzIGhvdyBtYW55IGxpbmVzIGJlc2lkZXMNCj4+Pj4+IHRoZSBj
dXJyZW50IG9uZSBhcmUgdG8gYmUgZGV2aWF0ZWQgKGUuZy4geW91IGNhbiBoYXZlIDAgZGV2aWF0
ZSBvbmx5IHRoZSBjdXJyZW50IGxpbmUpLg0KPj4+PiANCj4+Pj4gSnVzdCB0byB1bmRlcnN0YW5k
LCBkb2VzIHRoaXMgd2F5Og0KPj4+PiANCj4+Pj4gPGxpbmUgQT4NCj4+Pj4gLyogLUU+IHNhZmUg
TUMzUjEuUjcuMSAxICovDQo+Pj4+IDxsaW5lIEI+DQo+Pj4+IA0KPj4+PiBKdXN0aWZpZXMgb25s
eSBsaW5lIEI/IEJlY2F1c2UgSSB0aG91Z2h0IHNvLCBidXQgbm93IEkgd2FudCB0byBiZSBzdXJl
LCBvdGhlcndpc2UgaXQgZG9lc27igJl0IGFjdA0KPj4+PiBhcyBpbnRlbmRlZC4NCj4+Pj4gDQo+
Pj4+IA0KPj4+Pj4gTW9zdCBvZiB0aGUgdGltZXMgdGhlIGN1cnJlbnQgZm9ybSBpcyB3aGF0J3Mg
bmVlZGVkLCBhcyB5b3Ugd291bGQgcHV0IHRoZSBjb21tZW50IG9uIGEgbGluZQ0KPj4+Pj4gb2Yg
aXRzIG93bi4gSW4gdGhlIGNhc2Ugb2YgdGhlIGlmIHRoYXQgd291bGQgYnJlYWsgdGhlIGZvcm1h
dHRpbmcuIFRoZSBkb3duc2lkZSBvZiBkb2luZyB0aGUgc2FtZSB0aGluZyBvbiB0aGUgdGFibGUg
aXMgdGhhdCB0aGUgZmlyc3QgZW50cnkgbm90IHRvIGJlIGRldmlhdGVkIHdvdWxkIGFjdHVhbGx5
IGJlIGRldmlhdGVkLg0KPj4+Pj4gDQo+Pj4+PiAjZGVmaW5lIElOU1RSX0lOVkQgSU5TVFJfRU5D
KFg4NkVNVUxfT1BDKDB4MGYsIDB4MDgpLCAwKQ0KPj4+Pj4gDQo+Pj4+PiBUaGlzIG1heSBub3Qg
YmUgcHJvYmxlbWF0aWMsIHNpbmNlIDAgY291bGQgYmUgY29uc2lkZXJlZCBhbiBvY3RhbCBjb25z
dGFudCwgYnV0IGlzIGFuDQo+Pj4+PiBleGNlcHRpb24gZXhwbGljaXRseSBsaXN0ZWQgaW4gdGhl
IE1JU1JBIHJ1bGUuDQo+Pj4+PiBGb3IgdGhlIHNhbWUgcmVhc29uIHRoZSBsaW5lDQo+Pj4+PiAN
Cj4+Pj4+IHJldHVybiBlbXVsX2xlbjsNCj4+Pj4+IA0KPj4+Pj4gaXMgZGV2aWF0ZWQgYnkgdGhl
IGFib3ZlIGNvbW1lbnQsIGJ1dCBwdXR0aW5nIGFuIG9jdGFsIGNvbnN0YW50IHRoZXJlIHdvdWxk
IGZvciBzdXJlDQo+Pj4+PiBiZSB0aGUgcmVzdWx0IG9mIGEgZGVsaWJlcmF0ZSBjaG9pY2UuIFRo
ZXJlJ3MgdGhlIGFsdGVybmF0aXZlIG9mOg0KPj4+Pj4gDQo+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIFNBRi0yLXNhZmUgKi8NCj4+Pj4+IGlmICggbW9kcm1fbW9kICAgICAgPT0gTUFT
S19FWFRSKGluc3RyX21vZHJtLCAwMzAwKSAmJg0KPj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAvKiBTQUYtMi1zYWZlICovDQo+Pj4+PiAgICAgKG1vZHJtX3JlZyAmIDcpID09IE1BU0tfRVhU
UihpbnN0cl9tb2RybSwgMDA3MCkgJiYNCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgLyog
U0FGLTItc2FmZSAqLw0KPj4+Pj4gICAgIChtb2RybV9ybSAmIDcpICA9PSBNQVNLX0VYVFIoaW5z
dHJfbW9kcm0sIDAwMDcpICkNCj4+Pj4+IA0KPj4+Pj4gdG8gbWFrZSBpdCBjb25zaXN0ZW50IHdp
dGggdGhlIHRhYmxlIGFuZCBhdm9pZCBhbnkgImhpZGRlbiIgZGV2aWF0ZWQgbGluZSBvciwgYWdh
aW4sDQo+Pj4+PiB0aGUgbW9kaWZpY2F0aW9uIG9mIHRoZSB0cmFuc2xhdGlvbiBzY3JpcHQgc28g
dGhhdCBpdCBkb2Vzbid0IHVzZSBhIGZpeGVkICIxIiBvZmZzZXQsIHdoaWNoDQo+Pj4+PiBpcyBt
b3RpdmF0ZWQgYnkgd2hhdCB5b3Ugd3JvdGUgb24gdGhlIHRocmVhZCBvZiB0aGUgbW9kaWZpY2F0
aW9uIG9mIHhlbl9hbmFseXNpcy5weS4NCj4+Pj4gDQo+Pj4+IEZyb20gdGhlIGRvY3VtZW50YXRp
b246DQo+Pj4+IA0KPj4+PiAgIEluIHRoZSBYZW4gY29kZWJhc2UsIHRoZXNlIHRhZ3Mgd2lsbCBi
ZSB1c2VkIHRvIGRvY3VtZW50IGFuZCBzdXBwcmVzcyBmaW5kaW5nczoNCj4+Pj4gDQo+Pj4+ICAg
LSBTQUYtWC1zYWZlOiBUaGlzIHRhZyBtZWFucyB0aGF0IHRoZSBuZXh0IGxpbmUgb2YgY29kZSBj
b250YWlucyBhIGZpbmRpbmcsIGJ1dA0KPj4+PiAgICAgdGhlIG5vbiBjb21wbGlhbmNlIHRvIHRo
ZSBjaGVja2VyIGlzIGFuYWx5c2VkIGFuZCBkZW1vbnN0cmF0ZWQgdG8gYmUgc2FmZS4NCj4+Pj4g
DQo+Pj4+IEkgdW5kZXJzdGFuZCB0aGF0IEVjbGFpciBpcyBjYXBhYmxlIG9mIHN1cHByZXNzaW5n
IGFsc28gdGhlIGxpbmUgaW4gd2hpY2ggdGhlIGluLWNvZGUgc3VwcHJlc3Npb24NCj4+Pj4gY29t
bWVudCByZXNpZGVzLCBidXQgdGhlc2UgZ2VuZXJpYyBYZW4gaW4tY29kZSBzdXBwcmVzc2lvbiBj
b21tZW50IGFyZSBtZWFudCB0byBiZSB1c2VkDQo+Pj4+IGJ5IG11bHRpcGxlIHN0YXRpYyBhbmFs
eXNpcyB0b29scyBhbmQgbWFueSBvZiB0aGVtIHN1cHByZXNzIG9ubHkgdGhlIGxpbmUgbmV4dCB0
byB0aGUgY29tbWVudA0KPj4+PiAoQ292ZXJpdHksIGNwcGNoZWNrKS4NCj4+PiANCj4+PiBBcyB3
ZSBzZWUgbW9yZSByZWFsaXN0aWMgZXhhbXBsZXMsIGl0IHR1cm5zIG91dCB0aGF0IHRoaXMgaXMg
bGltaXRpbmcuDQo+Pj4gDQo+Pj4gR2l2ZW4gdGhhdCB0aGUgU0FGLTItc2FmZSBjb21tZW50IG5l
ZWRzIHRvIGdvIHRocm91Z2ggeGVuLWFuYWx5c2lzLnB5DQo+Pj4gdHJhbnNsYXRpb25zIGFueXdh
eSwgY291bGQgd2UgaW1wbGVtZW50IHNvbWV0aGluZyBhIGJpdCBtb3JlIGZsZXhpYmxlIGluDQo+
Pj4geGVuLWFuYWx5c2lzLnB5Pw0KPj4+IA0KPj4+IEZvciBpbnN0YW5jZSwgY291bGQgd2UgaW1w
bGVtZW50IGEgZm9ybWF0IHdpdGggdGhlIG51bWJlciBvZiBsaW5lcyBvZg0KPj4+IGNvZGUgbGlr
ZSB0aGlzIGFzIHdlIGRpc2N1c3NlZCBpbiBhIHByZXZpb3VzIHRocmVhZD8NCj4+PiANCj4+PiAv
KiBTQUYtMi1zYWZlIHN0YXJ0ICovDQo+Pj4gaWYgKCBtb2RybV9tb2QgICAgICA9PSBNQVNLX0VY
VFIoaW5zdHJfbW9kcm0sIDAzMDApICYmDQo+Pj4gICAobW9kcm1fcmVnICYgNykgPT0gTUFTS19F
WFRSKGluc3RyX21vZHJtLCAwMDcwKSAmJg0KPj4+ICAgKG1vZHJtX3JtICYgNykgID09IE1BU0tf
RVhUUihpbnN0cl9tb2RybSwgMDAwNykgKQ0KPj4+IC8qIFNBRi0yLXNhZmUgZW5kICovDQo+Pj4g
DQo+Pj4gRmlyc3RseSwgbGV0IGFzayBBbmRyZXcsIGRvIHlvdSBwcmVmZXIgdGhpcz8NCj4+PiAN
Cj4+PiANCj4+PiBBbmQgYWxzbyB0aGlzIHNlY29uZCBmb3JtYXQ6DQo+Pj4gDQo+Pj4gaWYgKCBt
b2RybV9tb2QgICAgICA9PSBNQVNLX0VYVFIoaW5zdHJfbW9kcm0sIDAzMDApICYmIC8qIFNBRi0y
LXNhZmUgKi8NCj4+PiAgIChtb2RybV9yZWcgJiA3KSA9PSBNQVNLX0VYVFIoaW5zdHJfbW9kcm0s
IDAwNzApICYmIC8qIFNBRi0yLXNhZmUgKi8NCj4+PiAgIChtb2RybV9ybSAmIDcpICA9PSBNQVNL
X0VYVFIoaW5zdHJfbW9kcm0sIDAwMDcpICkgLyogU0FGLTItc2FmZSAqLw0KPj4+IA0KPj4+IA0K
Pj4+IENvdWxkIHdlIGltcGxlbWVudCBpbiB4ZW4tYW5hbHlzaXMucHkgYSBjb252ZXJzaW9uIHRo
YXQgd291bGQgdHVybiB0aGUNCj4+PiB0d28gZm9ybWF0cyBhYm92ZSB0aGF0IGFyZSBub3QgdW5k
ZXJzdG9vZCBieSBjcHBjaGVjayBpbnRvOg0KPj4+IA0KPj4+IC8qIGNwcGNoZWNrIHRhZyAqLw0K
Pj4+IGlmICggbW9kcm1fbW9kICAgICAgPT0gTUFTS19FWFRSKGluc3RyX21vZHJtLCAwMzAwKSAm
Jg0KPj4+IC8qIGNwcGNoZWNrIHRhZyAqLw0KPj4+ICAgKG1vZHJtX3JlZyAmIDcpID09IE1BU0tf
RVhUUihpbnN0cl9tb2RybSwgMDA3MCkgJiYNCj4+PiAvKiBjcHBjaGVjayB0YWcgKi8NCj4+PiAg
IChtb2RybV9ybSAmIDcpICA9PSBNQVNLX0VYVFIoaW5zdHJfbW9kcm0sIDAwMDcpICkNCj4+PiAN
Cj4+PiBPciB0aGlzIGlzIGEgcHJvYmxlbSBiZWNhdXNlIGl0IHdvdWxkIGVuZCB1cCBjaGFuZ2lu
ZyBsaW5lcyBvZiBjb2RlDQo+Pj4gbnVtYmVycyBpbiB0aGUgc291cmNlIGZpbGU/DQo+PiANCj4+
IFllcyB0aGlzIGlzIHRoZSByZWFsIGlzc3VlIHdoeSB3ZSBkaWRu4oCZdCBkbyB0aGUgLyogLi4u
IHN0YXJ0ICovIGNvZGUgLyogLi4uIGVuZCAqLw0KPiANCj4gUmlnaHQgc28gdGhlIHJlc3VsdHMg
d291bGQgYmUgYWxsIG9mZiBieSBhIGZldyBsaW5lcyBvZiBjb2RlIHNvIHdoZW4NCj4geW91IGdv
IHRvIHJlYWQgdGhlIHJlcG9ydCBnZW5lcmF0ZWQgYnkgY3BwY2hlY2ssIHRoZSByZWZlcmVuY2Vz
DQo+IHdvdWxkbid0IG1hdGNoIGFueW1vcmUuDQo+IA0KPiBCZWZvcmUgZ2l2aW5nIHVwIGFuZCBh
Y2NlcHRpbmcgdGhhdCB3ZSBhcmUgY29uc3RyYWluZWQgdG8gb25seSBmb3JtYXRzDQo+IHRoYXQg
ZG9uJ3QgY2hhbmdlIHRoZSBMT0MgbnVtYmVycywgY2FuIHdlIGNoZWNrIHdoYXQgQ292ZXJpdHkg
c3VwcG9ydHM/DQo+IA0KPiBJIGFtIGFza2luZyBiZWNhdXNlIHdlIGNvdWxkIGdldCBhd2F5IHdp
dGggaW1wbGVtZW50aW5nIHRoZSBmb3JtYXRzDQo+IGFib3ZlIGluIGNwcGNoZWNrLCBnaXZlbiB0
aGF0IGNwcGNoZWNrIGlzIG9wZW4gc291cmNlLiBCdXQgZm9yIENvdmVyaXR5DQo+IHdlIG5lZWQg
dG8gc3RheSB3aXRoIHdoYXQgaXMgYWxyZWFkeSBzdXBwb3J0ZWQgYnkgaXQuDQo+IA0KPiBEb2Vz
IENvdmVyaXR5IHN1cHBvcnQgYW55dGhpbmcgb3RoZXIgdGhhbjoNCj4gDQo+IDx0YWcgb24gcHJl
dmlvdXMgbGluZT4NCj4gPG5leHQgbGluZSBpcyBjb2RlIHdpdGggZGV2aWF0aW9uPg0KDQpVbmZv
cnR1bmF0ZWx5IG5vdCwgZnJvbSBpdHMgZG9jdW1lbnRhdGlvbiBJIGNhbuKAmXQgc2VlIGFueXRo
aW5nIGFwYXJ0IGZyb20gdGhlIGFib3ZlLA0KSSBjYW4gYXNrIHNvbWVvbmUgZnJvbSBzeW5vcHN5
cyB0aG91Z2ggdG8gZG91YmxlIGNoZWNrLg0KDQoNCg==

