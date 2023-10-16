Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 484307CB219
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 20:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617918.961028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsS0H-0004BR-M4; Mon, 16 Oct 2023 18:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617918.961028; Mon, 16 Oct 2023 18:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsS0H-00048u-JN; Mon, 16 Oct 2023 18:07:45 +0000
Received: by outflank-mailman (input) for mailman id 617918;
 Mon, 16 Oct 2023 18:07:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4Mm=F6=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1qsS0G-00048m-AC
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 18:07:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e58ecea2-6c4e-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 20:07:41 +0200 (CEST)
Received: from DUZPR01CA0209.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::22) by DU0PR08MB7616.eurprd08.prod.outlook.com
 (2603:10a6:10:320::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 18:07:38 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::e) by DUZPR01CA0209.outlook.office365.com
 (2603:10a6:10:4b6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 18:07:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Mon, 16 Oct 2023 18:07:37 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Mon, 16 Oct 2023 18:07:37 +0000
Received: from 50ae55196ac2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0CF5583-AB1D-466F-80B8-C7334B33FE4B.1; 
 Mon, 16 Oct 2023 18:07:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50ae55196ac2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 18:07:31 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VI0PR08MB10537.eurprd08.prod.outlook.com (2603:10a6:800:204::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 18:07:27 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::2124:8c0b:a86c:46d]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::2124:8c0b:a86c:46d%4]) with mapi id 15.20.6863.046; Mon, 16 Oct 2023
 18:07:27 +0000
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
X-Inumbo-ID: e58ecea2-6c4e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp7Fcb1qV6vgMQw+SYtpcDEABPiJ2gUSdJzR9iK15C0=;
 b=0gsPSVqeD4ezce1OzzhXNz0r3ch3wPale8nWVukWMzG2okIumG8fvZy01FMpVcoZte+8ZnMJ0SDacVk/NvKCYJBDtR0QSEvLYGa3aJwHPgb0cIfZ1HXYNO8bS2C/7WIjoVyX5h5x3NM6qGu9VI0g/YoFQLIw7caV0LJmR7JE96Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96ad93f0a9f1cee5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=legIRmnRitQic34v3Us28itvzo8tVJzZNgECo82Qvw29uFQA5UDU7LMw2y0IG/8UbGvKBbVi1/DUuJkG4Tc2IE5zxroqafkg/V6P/23TRiSs42oARYpnneSXrclsUx7OHgUwHkv95cvy9B9bdangMhTepgVHriNPfMR/jOP6y9Z6dXp+Fcq4o5uXecAA4Z8qkB6SGLRa0u2L1KrxdAk0ePOHveG3CMVOlHjAsjkLhUv5p0HU8SMBFuipeautNa822b7wR2WtVHT6e07A27HX3lL8TqztyUdBtkchlvshQelJQa97qfKBh858CwK9k7yD4aPj4hqJJ3iDKAy/GXomHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp7Fcb1qV6vgMQw+SYtpcDEABPiJ2gUSdJzR9iK15C0=;
 b=CtHBstNkbeIlYQpjj+JsSUvsqhHB7nOb/TAAXfC+zmgVZjisTSPyp+H86xczr3ModcnlYt8D2gawEBKsc6YYATb2NrPzDSt3suRI8cFUiJkGFpNHEF5D8o8XIXcKtV91uIrNoPJVAmWDxjvwqVLE3ARrxHf3HnSWF7aigwuMnbOrEAMRABZ4F81S57x6bQhZ/q0GfE/cICYMigqU20P2EjPZAmT7grRlfnvC3ccoT8Hfy2EHqydqPRdIUtzz445oYDRPk/YKLyi8jELsbulGv8orpCY8/5RdL7TFR0JjWj7nAoR1A9+Acm8VI4Cm8GuNxQ8dRKzOblIMsya2bclDpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp7Fcb1qV6vgMQw+SYtpcDEABPiJ2gUSdJzR9iK15C0=;
 b=0gsPSVqeD4ezce1OzzhXNz0r3ch3wPale8nWVukWMzG2okIumG8fvZy01FMpVcoZte+8ZnMJ0SDacVk/NvKCYJBDtR0QSEvLYGa3aJwHPgb0cIfZ1HXYNO8bS2C/7WIjoVyX5h5x3NM6qGu9VI0g/YoFQLIw7caV0LJmR7JE96Y=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Thread-Topic: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Thread-Index: AQHZ/el7vMVF528FCE+PS9d3vBdu5bBMJIIAgABJvgCAAE0GAA==
Date: Mon, 16 Oct 2023 18:07:27 +0000
Message-ID: <B0581790-0AFB-4354-969C-45804B7095AD@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
 <39d3f8e0-61cf-4b8d-84f1-a5087ba8ead4@xen.org>
 <D3320838-1E67-4339-A3D4-A3E60FBC4117@arm.com>
In-Reply-To: <D3320838-1E67-4339-A3D4-A3E60FBC4117@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|VI0PR08MB10537:EE_|DBAEUR03FT031:EE_|DU0PR08MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a4aa64-1dd4-4b9b-5e91-08dbce72c7db
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cyfwo6pZi80cKopASvIwIhUSJ0iwgqwMLhOnQ2EJ3apTDFuDI2VbDX1gIRb1d9JBsoG/110FYmy0nmwSLH3y53E1kAEUge2aOUW3gjleqmncO1z0kyfqKgI4fAAAYCBBXRmregFzjZlTRHYJiCH67s9yJb9X94O8W3Dd9zSnFZIjVY4cpVzfuN5lga/uf+kew8XrX85ev6PoNOtkvhlYwWXwygF0hfJ/qbKQLoUulHpsX0Xgnjt6RWtwNuX5qUPU+dst74NHZvfpW9aUxFaN1QIaCm/0DyC+GHe4LnnafYTWmkVKrXb//2GyenPPhs2BL0Mr0PwKBuqN9D3Amy3rPGIVq3zgivfilfqP/67qvTtmfUHfNEY+JIz8Yq7nmNHMDJxBrEGIzPF5XbZ0bHv8p+HMk6Zi/C2QbR79JlnGkPlVm1ksSRwiHjgdLnUsHftmm/QzQ1nnAHfezAVFdbJkPFfkwenHoHaT9Vzr9sQXRNtF5esS0A6ezmAk9du4nKUYVUfmj0cPby3KZTUIh+gmCwoMiV8ovZIM438SlioU2vAczvC8Guxq0VOks+GNs0JRwNiKDvk0DhgcLwAfPbI0ULHlmlDobL3tYL/sahY1Z4ymUYp9IjKwR7+uFQw+v+uKo/BdBAwFEgBXklHcTQi0NA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6636002)(37006003)(66946007)(478600001)(6486002)(91956017)(66556008)(54906003)(64756008)(66446008)(66476007)(76116006)(71200400001)(26005)(2616005)(53546011)(6506007)(6512007)(41300700001)(8676002)(8936002)(6862004)(2906002)(4326008)(5660300002)(36756003)(33656002)(38070700005)(316002)(122000001)(86362001)(83380400001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D93BB3780FEC14785632ABF33095757@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10537
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4cf270ed-d364-48b0-4d08-08dbce72c179
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NULGd9qx5xgWtO98OMp53QT53V+WUBxd4IKA3+KCVVRLP0NT6/+hPOmdiWaY2TJCOzRyrwEqm8/m4P5NGimP+OttSBiReBrxL2LcU482iWAdUFDn5H8XfD6t2VDaPSr3fmSwUhk936tOJrWCh2vtaz7NDBwsNPDAKb/JeaArcFreb0hasuib244Tu5+z78w0uUCiYAkdnEfgG+EZncbf4tntqgk4bLt7k9hElGGpWE/wPVmSZL43VazkGvNyEFLAVegePGVWpWyB1+O/MxK6e8qgLoFW/sT4NooHfBe/IP/UXlGTcViwTw/I6jOC0c5j+URE+MtPduPkuNlHBP09do1t6M7nnU0ykbAv/FtveKG1THO/jqAbsW+qbvYuXNlHjeoJoity8WEW0yyKpbDtvK3HEGJZRdyWG5gW1vd6SND0RDFkxYyX73yYV7dUNrnE+qo7xoWTIK2TC8YqQcSwdGNnOlf0dedmqUmLrdJRcCnUjiPNyi3sj6ns/+1QxUGF8sf1g8zYS/Tx7lk9yKKV7DfTdIg5ZHQCfaANW4MBP1o8pH/oz5Wxuso1HVBoqUzmoMmcFptHhIqZWchlRy3+xR5Af+VvP6veok5sFeudXffhY6U7o7STEknEPuxqzJ+++C/cvSscd/a/55V5Tz6ANlKOP+Q2usC521LkXyC6Htm6pMwjZit+5ILFBaqy+b+5UAtuB4ID5oqFdg9ovTVQuGfSa4eXZgvp0Xif9kTGJdXm9X7M+CG9Ddfag99vH3JN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(478600001)(6486002)(37006003)(316002)(6636002)(41300700001)(6862004)(8936002)(8676002)(4326008)(70206006)(70586007)(54906003)(5660300002)(6506007)(53546011)(40480700001)(36860700001)(47076005)(81166007)(82740400003)(356005)(6512007)(86362001)(2616005)(26005)(336012)(36756003)(83380400001)(40460700003)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 18:07:37.7537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a4aa64-1dd4-4b9b-5e91-08dbce72c7db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7616

SGkgQmVydHJhbmQNCg0KPiBPbiAxNiBPY3QgMjAyMywgYXQgMjozMeKAr3BtLCBCZXJ0cmFuZCBN
YXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgSnVsaWVu
LA0KPiANCj4+IE9uIDE2IE9jdCAyMDIzLCBhdCAxMTowNywgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4gd3JvdGU6DQo+PiANCj4+IEhpLA0KPj4gDQo+PiBPbiAxMy8xMC8yMDIzIDE2OjI0
LCBGZWRlcmljbyBTZXJhZmluaSB3cm90ZToNCj4+PiBBZGQgbWlzc2luZyBwYXJhbWV0ZXIgbmFt
ZXMsIG5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPj4+IFNpZ25lZC1vZmYtYnk6IEZlZGVyaWNvIFNl
cmFmaW5pIDxmZWRlcmljby5zZXJhZmluaUBidWdzZW5nLmNvbT4NCj4+PiAtLS0NCj4+PiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIHwgNiArKystLS0NCj4+IA0KPj4gVGhpcyBm
aWxlIGlzIHVzaW5nIHRoZSBMaW51eCBjb2Rpbmcgc3R5bGUgYmVjYXVzZSBpdCBpcyBpbXBvcnRl
ZCBmcm9tIExpbnV4LiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB3ZSB3b3VsZCBleGNsdWRl
IHN1Y2ggZmlsZSBmb3Igbm93Lg0KPj4gDQo+PiBMb29raW5nIGF0IGV4Y2x1ZGUtbGlzdC5qc29u
LCBpdCBkb2Vzbid0IHNlZW0gdG8gYmUgcHJlc2VudC4gSSB0aGluayB0aGlzIHBhdGNoIHNob3Vs
ZCBiZSByZXBsYWNlZCB3aXRoIGFkZGluZyBhIGxpbmUgaW4gZXhlY2x1ZGUtbGlzdC5qc29uLg0K
PiANCj4gSSB0aGluayB0aGF0IGR1cmluZyBvbmUgb2YgdGhlIGRpc2N1c3Npb25zIHdlIHNhaWQg
dGhhdCB0aGlzIGZpbGUgYWxyZWFkeSBkZXZpYXRlZCBxdWl0ZSBhIGxvdCBmcm9tIHRoZSBzdGF0
dXMgaW4gTGludXggYW5kIHdlIHdhbnRlZCB0byB0dXJuIGl0IHRvIFhlbiBjb2Rpbmcgc3R5bGUg
aW4gdGhlIGZ1dHVyZSBoZW5jZSBpdCBpcyBub3QgbGlzdGVkIGluIHRoZSBleGNsdWRlIGZpbGUu
DQo+IEF0IHRoZSBlbmQgaGF2aW5nIGEgd29ya2luZyBzbW11IG1pZ2h0IGJlIGNyaXRpY2FsIGlu
IGEgc2FmZXR5IGNvbnRleHQgc28gaXQgd2lsbCBtYWtlIHNlbnNlIHRvIGFsc28gY2hlY2sgdGhp
cyBwYXJ0IG9mIHhlbi4NCj4gDQo+IEBSYWh1bDogZG8geW91IGFncmVlID8NCg0KWWVzLCB5b3Ug
YXJlIHJpZ2h0IGN1cnJlbnQgU01NVXYzIGNvZGUgYWxyZWFkeSBkZXZpYXRlcyBxdWl0ZSBhIGxv
dCBmcm9tIHRoZSBzdGF0dXMgb2YgTGludXgNCmJlY2F1c2UgWGVuIGhhbmRsZXMgdGhlIGNvbW1h
bmQgcXVldWUgaW4gYSBkaWZmZXJlbnQgd2F5IHRoYW4gdGhlIHdheSBMaW51eCBoYW5kbGVzIGl0
LiANCk1vcmUgZGV0YWlsZWQgY2FuIGJlIGZvdW5kIGF0IHRoZSBzdGFydCBvZiB0aGUgU01NVXYz
IGZpbGUuIEkgYW0gcGFzdGluZyBpdCBoZXJlIGFsc28uDQoNCiogNS4gTGF0ZXN0IHZlcnNpb24g
b2YgdGhlIExpbnV4IFNNTVV2MyBjb2RlIGltcGxlbWVudHMgdGhlIGNvbW1hbmRzIHF1ZXVlDQoq
IGFjY2VzcyBmdW5jdGlvbnMgYmFzZWQgb24gYXRvbWljIG9wZXJhdGlvbnMgaW1wbGVtZW50ZWQg
aW4gTGludXguDQoqIEF0b21pYyBmdW5jdGlvbnMgdXNlZCBieSB0aGUgY29tbWFuZHMgcXVldWUg
YWNjZXNzIGZ1bmN0aW9ucyBhcmUgbm90DQoqIGltcGxlbWVudGVkIGluIFhFTiB0aGVyZWZvcmUg
d2UgZGVjaWRlZCB0byBwb3J0IHRoZSBlYXJsaWVyIHZlcnNpb24NCiogb2YgdGhlIGNvZGUuIEF0
b21pYyBvcGVyYXRpb25zIGFyZSBpbnRyb2R1Y2VkIHRvIGZpeCB0aGUgYm90dGxlbmVjayBvZg0K
KiB0aGUgU01NVSBjb21tYW5kIHF1ZXVlIGluc2VydGlvbiBvcGVyYXRpb24uIEEgbmV3IGFsZ29y
aXRobSBmb3INCiogaW5zZXJ0aW5nIGNvbW1hbmRzIGludG8gdGhlIHF1ZXVlIGlzIGludHJvZHVj
ZWQsIHdoaWNoIGlzDQoqIGxvY2stZnJlZSBvbiB0aGUgZmFzdC1wYXRoLg0KKiBDb25zZXF1ZW5j
ZSBvZiByZXZlcnRpbmcgdGhlIHBhdGNoIGlzIHRoYXQgdGhlIGNvbW1hbmQgcXVldWUgaW5zZXJ0
aW9uDQoqIHdpbGwgYmUgc2xvdyBmb3IgbGFyZ2Ugc3lzdGVtcyBhcyBzcGlubG9jayB3aWxsIGJl
IHVzZWQgdG8gc2VyaWFsaXplcw0KKiBhY2Nlc3NlcyBmcm9tIGFsbCBDUFVzIHRvIHRoZSBzaW5n
bGUgcXVldWUgc3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZS4NCiogT25jZSB0aGUgcHJvcGVyIGF0
b21pYyBvcGVyYXRpb25zIHdpbGwgYmUgYXZhaWxhYmxlIGluIFhFTiB0aGUgZHJpdmVyDQoqIGNh
biBiZSB1cGRhdGVkLg0KIA0KQW55d2F5IGJlY2F1c2Ugb2YgYWJvdmUgcmVhc29uIGJhY2twb3J0
aW5nIFNNTVV2MyBMaW51eCBkcml2ZXIgcGF0Y2hlcyB0byBYZW4gYXJlDQpub3Qgc3RyYWlnaHQg
Zm9yd2FyZC4gSWYgbWFraW5nIHNtbXUtdjMuYyB0byBYZW4gY29kaW5nIHN0eWxlIGhlbHBzIGlu
IHNhZmV0eSBjb250ZXh0IEkgYW0gb2theQ0Kd2l0aCB0aGF0Lg0KDQpSZWdhcmRzLA0KUmFodWwg
DQoNCg==

