Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598736E8A62
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 08:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523896.814290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppNjh-0003rO-Be; Thu, 20 Apr 2023 06:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523896.814290; Thu, 20 Apr 2023 06:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppNjh-0003o1-8K; Thu, 20 Apr 2023 06:25:41 +0000
Received: by outflank-mailman (input) for mailman id 523896;
 Thu, 20 Apr 2023 06:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9VJI=AL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ppNjf-0003nv-VC
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 06:25:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 279dba2d-df44-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 08:25:33 +0200 (CEST)
Received: from DB9PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:10:1d9::11)
 by AS4PR08MB8143.eurprd08.prod.outlook.com (2603:10a6:20b:58e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 06:25:31 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::75) by DB9PR02CA0006.outlook.office365.com
 (2603:10a6:10:1d9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Thu, 20 Apr 2023 06:25:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.24 via Frontend Transport; Thu, 20 Apr 2023 06:25:31 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Thu, 20 Apr 2023 06:25:31 +0000
Received: from cd09c05a7ffa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2CB9B858-BA73-4B56-8A3F-D8C8D6469CB2.1; 
 Thu, 20 Apr 2023 06:25:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd09c05a7ffa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Apr 2023 06:25:20 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB9349.eurprd08.prod.outlook.com (2603:10a6:150:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 20 Apr
 2023 06:25:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 06:25:16 +0000
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
X-Inumbo-ID: 279dba2d-df44-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHTXyT3w69jhk3j5qZqqNOYC4IXsOYyARxZGILvn4MA=;
 b=iZd7ZNHgcULBpBTBWF1A9d/22Y53gzxRrQ66hhU6JUPlTUpYsQEUKrAKGg8UqjxMJZKdq2AUDblDf+/c3rHWKIThbULBOLytLgCZIDBt2GoWwgf5mrohXoS4sZULTDPoEi2lLJmhkMwme/LVZj/IQUPJYXWZxxGFYzqNZY9bo5k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09701844e10beace
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ux4FFDIMh+f65bZajmqtRpsV3NKh20x66Vt91jvDiDTWJxlZ39kmMexVKdQgfcsjV9dem7CANQv3bvOHQoOXNHlnCZYvZ8uReLDSdooYGX2r1zjqDhK310+2N1w4seLXqV5sCPiqd+vBkufkWMgBIXmdTYVJZoS/CsIeRcL72+rArFl2r4LkhgV8yrb8/20cuZVL40V+tPa0LZoaUcZw7CtssRTdTQ/wYoJ/obVzzl5trBmyIoAD31VB0zzkUOHdYb7akhRWuMayI25W4Xn08pjJLG4psU3GcLqr5auaSr+U/ZebkTTMXp0dOftbvs8O1LWrbczCoeCtYHCR5pNkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHTXyT3w69jhk3j5qZqqNOYC4IXsOYyARxZGILvn4MA=;
 b=Cg56RHMUwXV0cSQLITrEuzLl7IHeIcsf5qiCAeK6Xw3PyNBSxOU7eZvCaeBJX3GlZnSXzYNbO4cSkqGkY2XaS+CalY8k57H40oxAgV+zVpd7Zfw7S+h0oqsqzYYezmJ97RqnRrzadCbhIsi2wz1azkwWkTyyXK+fBFAtKEm923MEfXWjooaf8pBFsZzyQmZSYUdvaf4P1ltOOxnEPHS3sFW794mzw+cUxSHDRh96HFPgT7Xo/e/Rin8i/xt50qA/Jl8l9WmFlno9lsfbgxNTjVG91nL36RTRfrfBMP+FWl/jJvsqiaJOK9OZXZTF0QfCKAAaFeJYUmyv8MeE1NmaZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHTXyT3w69jhk3j5qZqqNOYC4IXsOYyARxZGILvn4MA=;
 b=iZd7ZNHgcULBpBTBWF1A9d/22Y53gzxRrQ66hhU6JUPlTUpYsQEUKrAKGg8UqjxMJZKdq2AUDblDf+/c3rHWKIThbULBOLytLgCZIDBt2GoWwgf5mrohXoS4sZULTDPoEi2lLJmhkMwme/LVZj/IQUPJYXWZxxGFYzqNZY9bo5k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZbSQ+XccnxtxNG0WbEgpX88e2za8vRy4AgASAOoA=
Date: Thu, 20 Apr 2023 06:25:16 +0000
Message-ID: <81ED2CE3-D6AD-4CAD-B6CA-C7A045444AAE@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2978b495-c222-a3f2-16e1-ff577c7b699c@suse.com>
In-Reply-To: <2978b495-c222-a3f2-16e1-ff577c7b699c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB9349:EE_|DBAEUR03FT028:EE_|AS4PR08MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: d02146af-83b8-427a-0e12-08db41680a83
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XZH8y+H2I6GBOdvJnPLfXOCjORS6VETfwkQ92le+RhuHKYPlmw7bDyJRDu1P1zxTU836et1Ml6nBZY//sLrKzjmP3cJaN++Jqzf2bPdLaUirkNtEtEa4Y4SIcc9ujW2YB/ikf11SvYu8JY9f54LyLO3eBC49PyqLAABoqqetj3lAAU2Gn66BoLaxkKEmdEKNTSZXA9lwjvP3wabgk9fk1IzxkV/vzSWPT5VNJuYSX5/wVfafU8Qa2SIr+A7lejRg3i66Uy65ZrOcpVpSSmL1jT1RE5OYDYL+pjp7bJv+Nfd0Drvvhwq5ArI0vacAJge1n3TVN/1NMPKyvAY/c9vjlDs22rV3n1zvj5Y4RDV1/7cAG4LFn5D2JQQLdIurwVe6uByPf8ZgKs+m72hWCGUlQBacxkZDTcNCSprDioge86BWDV1AvfZ85FnksTafuBLfWmkwvsRs3etIFeGmkoSsktMGO7Fg7uKvcZIBdra5vl1Nfyid81WLDm8XZfofYGHfjXF0og/fm/ebavxj+jDnaz/+mTSjxHp3Duvmg/uJg/P7/NmR0gUlOW4WNEjpLM+OlYmWHlHVTTKdRTl6V+dopP+pdOy0kLair4OzDAxayhd/SQzEG8MdyaLI9EJ0xKeZWd8v8mWErZwi4AVpD3OoDw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(66446008)(66556008)(38070700005)(41300700001)(66476007)(76116006)(8676002)(8936002)(2906002)(6916009)(86362001)(91956017)(66946007)(4326008)(64756008)(5660300002)(54906003)(122000001)(38100700002)(316002)(478600001)(71200400001)(6486002)(2616005)(26005)(6512007)(33656002)(6506007)(83380400001)(53546011)(36756003)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EB89040FAD9DA468EC9D630FFA4C777@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9349
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a91b0bd-284d-44ce-2559-08db416801b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3SWLe+as+voVj/Y8lLSg2Q52ikItLNlLBYs9VCNgxZh1gM7kkMUpIpwHBujNT9ssdb5mhDL7Eg3EL2/6fYMmzDI3z5SARNQxIhgYFKOmAnpnhu/9kIQlX/fYhrP4cmPVV+XYf1WlH/qjR/zL2EbcV7osyjlCZsKnD8C5ebjMwxgo9+T3UnUEdEZeluRCou6x/Ew9t26/2qyCmIdsxwpsS/X3wdttkNDKxtVKlnNjg8gW58n6U5zqJcCM93lWwv/OJV8Cf7BUnlgT7IzYPoJmI7FZU0TbyuKVw6FZSYxjWl7W7f3gH5Y87wx7+HD0jYOe7zc1bWSh7VQGLM39MSTTiDxMX03vka8MMvkamweA3czpUaEa5F1f8j3f66n+Evk1S6Nmx0W9fwJvEuWa6NMPlvcEEtPT6+W66V2WBD7xoCH0AugM/WnaataAEooNWtDF80kxWDk9ebhm7kDsM0FWyo0+O3N3NObxMlX/Ic8HZgrAnLki8GcfGKzSP592BUfoSg1mQD3+dhHpd+wSCo6EJ2NkJUnIKFjOe7QnLOGEHkGVQz5j0Ph2BsEiQVn9N7kNLPPyQErN9YRyXXkpZN0YcyHSnsLAQ9/P3TOGd8llSwm7yKxM8802LesGHSOcYCR0olgI6GkwEJ36q5HulLJmAvNCDNMvwxVjcIyfeAJTfHvHVnXF1NBFX4XwyE2B1Duxmhf3ZtiB7CQk29jFWkSTQA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(83380400001)(2616005)(47076005)(2906002)(36860700001)(186003)(82310400005)(336012)(5660300002)(36756003)(6506007)(53546011)(8676002)(6862004)(8936002)(6512007)(26005)(6486002)(41300700001)(33656002)(81166007)(356005)(316002)(82740400003)(70586007)(70206006)(40480700001)(478600001)(86362001)(40460700003)(4326008)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 06:25:31.1822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d02146af-83b8-427a-0e12-08db41680a83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8143

SGkgSmFuLA0KDQpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIEnigJl2ZSBtaXNzZWQgdGhpcyBv
bmUsDQoNCj4gT24gMTcgQXByIDIwMjMsIGF0IDEwOjQxLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTIuMDQuMjAyMyAxMTo0OSwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+IEBAIC0xMTgsMyArMTIxLDIxIEBAIHZvaWQgc3ZlX3Jlc3RvcmVfc3RhdGUo
c3RydWN0IHZjcHUgKnYpDQo+PiANCj4+ICAgICBzdmVfbG9hZF9jdHgoc3ZlX2N0eF96cmVnX2Vu
ZCwgdi0+YXJjaC52ZnAuZnByZWdzLCAxKTsNCj4+IH0NCj4+ICsNCj4+ICtpbnQgX19pbml0IHN2
ZV9zYW5pdGl6ZV92bF9wYXJhbShpbnQgdmFsLCB1bnNpZ25lZCBpbnQgKm91dCkNCj4+ICt7DQo+
PiArICAgIC8qDQo+PiArICAgICAqIE5lZ2F0aXZlIFNWRSBwYXJhbWV0ZXIgdmFsdWUgbWVhbnMg
dG8gdXNlIHRoZSBtYXhpbXVtIHN1cHBvcnRlZA0KPj4gKyAgICAgKiB2ZWN0b3IgbGVuZ3RoLCBv
dGhlcndpc2UgaWYgYSBwb3NpdGl2ZSB2YWx1ZSBpcyBwcm92aWRlZCwgY2hlY2sgaWYgdGhlDQo+
PiArICAgICAqIHZlY3RvciBsZW5ndGggaXMgYSBtdWx0aXBsZSBvZiAxMjggYW5kIG5vdCBiaWdn
ZXIgdGhhbiB0aGUgbWF4aW11bSB2YWx1ZQ0KPj4gKyAgICAgKiAyMDQ4DQo+PiArICAgICAqLw0K
Pj4gKyAgICBpZiAoIHZhbCA8IDAgKQ0KPj4gKyAgICAgICAgKm91dCA9IGdldF9zeXNfdmxfbGVu
KCk7DQo+PiArICAgIGVsc2UgaWYgKCAoKHZhbCAlIFNWRV9WTF9NVUxUSVBMRV9WQUwpID09IDAp
ICYmICh2YWwgPD0gU1ZFX1ZMX01BWF9CSVRTKSApDQo+PiArICAgICAgICAqb3V0ID0gdmFsOw0K
Pj4gKyAgICBlbHNlDQo+PiArICAgICAgICByZXR1cm4gLTE7DQo+PiArDQo+PiArICAgIHJldHVy
biAwOw0KPj4gK30NCj4gDQo+IEkgdGhpbmsgc3VjaCBhIGZ1bmN0aW9uIHdhbnRzIHRvIGVpdGhl
ciByZXR1cm4gYm9vbGVhbiwgb3IgLUUuLi4gaW4gdGhlDQo+IGVycm9yIGNhc2UuIEJvb2xlYW4g
d291bGQgLi4uDQo+IA0KPj4gQEAgLTQxMDksNiArNDEyNSwxNyBAQCB2b2lkIF9faW5pdCBjcmVh
dGVfZG9tMCh2b2lkKQ0KPj4gICAgIGlmICggaW9tbXVfZW5hYmxlZCApDQo+PiAgICAgICAgIGRv
bTBfY2ZnLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX2lvbW11Ow0KPj4gDQo+PiArICAgIGlmICgg
b3B0X2RvbTBfc3ZlICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHZsOw0K
Pj4gKw0KPj4gKyAgICAgICAgaWYgKCAhc3ZlX3Nhbml0aXplX3ZsX3BhcmFtKG9wdF9kb20wX3N2
ZSwgJnZsKSApDQo+IA0KPiAuLi4geWllbGQgYSBzbGlnaHRseSBiZXR0ZXIgY2FsbCBzaXRlIGhl
cmUsIGltby4NCg0KT2sgSeKAmWxsIGNob3NlIG9uZSBvZiB0aGUgdHdvLCBkZXBlbmRpbmcgb24g
dGhlIGRpc2N1c3Npb24gd2l0aCBCZXJ0cmFuZCBhYm91dCB0aGUgcGFyYW1ldGVyIGNoZWNraW5n
DQoNCj4gDQo+PiArICAgICAgICAgICAgZG9tMF9jZmcuYXJjaC5zdmVfdmwgPSBzdmVfZW5jb2Rl
X3ZsKHZsKTsNCj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9H
X1dBUk5JTkcNCj4+ICsgICAgICAgICAgICAgICAgICAgIlNWRSB2ZWN0b3IgbGVuZ3RoIGVycm9y
LCBkaXNhYmxlIGZlYXR1cmUgZm9yIERvbTBcbiIpOw0KPiANCj4gSSBhcHByZWNpYXRlIHRoZSBu
b3cgYmV0dGVyIGJlaGF2aW9yIGhlcmUsIGJ1dCBJIHRoaW5rIHRoZSByZXNwZWN0aXZlIHBhcnQN
Cj4gb2YgdGhlIGRvYyBpcyBub3cgc3RhbGU/DQo+IA0KPj4gQEAgLTI4LDkgKzM1LDEyIEBAIGlu
dCBzdmVfY29udGV4dF9pbml0KHN0cnVjdCB2Y3B1ICp2KTsNCj4+IHZvaWQgc3ZlX2NvbnRleHRf
ZnJlZShzdHJ1Y3QgdmNwdSAqdik7DQo+PiB2b2lkIHN2ZV9zYXZlX3N0YXRlKHN0cnVjdCB2Y3B1
ICp2KTsNCj4+IHZvaWQgc3ZlX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpOw0KPj4gK2lu
dCBzdmVfc2FuaXRpemVfdmxfcGFyYW0oaW50IHZhbCwgdW5zaWduZWQgaW50ICpvdXQpOw0KPj4g
DQo+PiAjZWxzZSAvKiAhQ09ORklHX0FSTTY0X1NWRSAqLw0KPj4gDQo+PiArI2RlZmluZSBvcHRf
ZG9tMF9zdmUgKDApDQo+IA0KPiBXaXRoIHRoaXMgSSBkb24ndCB0aGluayB5b3UgbmVlZCAuLi4N
Cj4gDQo+PiBAQCAtNTUsNiArNjUsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHN2ZV9jb250ZXh0
X2ZyZWUoc3RydWN0IHZjcHUgKnYpIHt9DQo+PiBzdGF0aWMgaW5saW5lIHZvaWQgc3ZlX3NhdmVf
c3RhdGUoc3RydWN0IHZjcHUgKnYpIHt9DQo+PiBzdGF0aWMgaW5saW5lIHZvaWQgc3ZlX3Jlc3Rv
cmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpIHt9DQo+PiANCj4+ICtzdGF0aWMgaW5saW5lIGludCBz
dmVfc2FuaXRpemVfdmxfcGFyYW0oaW50IHZhbCwgdW5zaWduZWQgaW50ICpvdXQpDQo+PiArew0K
Pj4gKyAgICByZXR1cm4gLTE7DQo+PiArfQ0KPiANCj4gLi4uIHN1Y2ggYSBzdHViIGZ1bmN0aW9u
OyBoYXZpbmcgdGhlIGRlY2xhcmF0aW9uIHZpc2libGUgc2hvdWxkIGJlDQo+IGVub3VnaCBmb3Ig
dGhpbmdzIHRvIGJ1aWxkICh0aGFua3MgdG8gRENFLCB3aGljaCB3ZSB1c2UgZm9yIHNpbWlsYXIN
Cj4gcHVycG9zZXMgb24gbWFueSBvdGhlciBwbGFjZXMpLg0KDQpPayBJ4oCZbGwgdHJ5IHRoaXMg
YXBwcm9hY2ggYW5kIEnigJlsbCBjaGFuZ2UgaWYgSSBkb27igJl0IGZpbmQgYW55IGlzc3VlLCB0
aGFua3MgZm9yIHN1Z2dlc3RpbmcgdGhhdA0KDQo+IA0KPj4gLS0tIGEveGVuL2NvbW1vbi9rZXJu
ZWwuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9rZXJuZWwuYw0KPj4gQEAgLTMxNCw2ICszMTQsMzEg
QEAgaW50IHBhcnNlX2Jvb2xlYW4oY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqcywgY29u
c3QgY2hhciAqZSkNCj4+ICAgICByZXR1cm4gLTE7DQo+PiB9DQo+PiANCj4+ICtpbnQgX19pbml0
IHBhcnNlX3NpZ25lZF9pbnRlZ2VyKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnMsIGNv
bnN0IGNoYXIgKmUsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb25nIGxv
bmcgKnZhbCkNCj4+ICt7DQo+PiArICAgIHNpemVfdCBzbGVuLCBubGVuOw0KPj4gKyAgICBjb25z
dCBjaGFyICpzdHI7DQo+PiArICAgIGxvbmcgbG9uZyBwdmFsOw0KPiANCj4gV2hhdCB1c2UgaXMg
dGhpcyBleHRyYSB2YXJpYWJsZT8NCg0KSeKAmW0gdXNpbmcgcHZhbCB0byBhdm9pZCB1c2luZyAq
dmFsIGluIHRoZSBjYXNlIHdlIGZpbmQgdGhhdCB0aGUgcGFyc2VkIG51bWJlciBpcyBub3QgZ29v
ZCwNCkkgdGhpbmsgaXTigJlzIGJldHRlciB0byBkb27igJl0IGNoYW5nZSB0aGUgKnZhbCBpZiBh
bnkgZXJyb3IgY29tZSBvdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KDQo+IA0KPj4gKyAgICBzbGVu
ID0gZSA/ICh7IEFTU0VSVChlID49IHMpOyBlIC0gczsgfSkgOiBzdHJsZW4ocyk7DQo+PiArICAg
IG5sZW4gPSBzdHJsZW4obmFtZSk7DQo+PiArDQo+PiArICAgIC8qIERvZXMgcyBzdGFydCB3aXRo
IG5hbWUgb3IgY29udGFpbnMgb25seSB0aGUgbmFtZT8gKi8NCj4+ICsgICAgaWYgKCAoc2xlbiA8
PSBubGVuKSB8fCBzdHJuY21wKHMsIG5hbWUsIG5sZW4pIHx8IChzW25sZW5dICE9ICc9JykgKQ0K
Pj4gKyAgICAgICAgcmV0dXJuIC0xOw0KPiANCj4gVGhlIGNvbW1lbnQgaW1vIHdhbnRzIHdvcmRp
bmcgY29uc2lzdGVudGx5IHBvc2l0aXZlIG9yIGNvbnNpc3RlbnRseQ0KPiBuZWdhdGl2ZS4gSU9X
IGVpdGhlciB5b3Ugc2F5IHdoYXQgeW91J3JlIGxvb2tpbmcgZm9yLCBvciB5b3Ugc2F5DQo+IHdo
YXQgeW91J3JlIG1lYW5pbmcgdG8gcmVqZWN0Lg0KDQpPayBJ4oCZbGwgcmVwaHJhc2UgdG86DQoN
Ci8qIENoZWNrIHRoYXQgdGhpcyBpcyB0aGUgbmFtZSB3ZSBhcmUgbG9va2luZyBmb3IgYW5kIHRo
ZSBzeW50YXggaXMgcmlnaHQgKi8NCg0KSXMgdGhhdCBiZXR0ZXI/DQoNCj4gDQo+PiArICAgIHB2
YWwgPSBzaW1wbGVfc3RydG9sbCgmc1tubGVuICsgMV0sICZzdHIsIDApOw0KPiANCj4gSSB3b25k
ZXIgd2hldGhlciwgd2hlbiBwb3RlbnRpYWxseSBleHBlY3RpbmcgbmVnYXRpdmUgbnVtYmVycywN
Cj4gYWNjZXB0aW5nIG90aGVyIHRoYW4gZGVjaW1hbCBudW1iZXJzIGhlcmUgaXMgdXNlZnVsLg0K
DQpZb3UgYXJlIHJpZ2h0LCBJ4oCZbGwgY2hhbmdlIHRvIDEwIGJhc2UNCg0KPiANCj4gSmFuDQoN
Cg==

