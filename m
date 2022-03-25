Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFEA4E740F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 14:18:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294701.501219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXjpB-00032r-Tu; Fri, 25 Mar 2022 13:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294701.501219; Fri, 25 Mar 2022 13:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXjpB-0002zr-QH; Fri, 25 Mar 2022 13:17:53 +0000
Received: by outflank-mailman (input) for mailman id 294701;
 Fri, 25 Mar 2022 13:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXB3=UE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXjpA-0002zl-4s
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 13:17:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f87cf3b1-ac3d-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 14:17:50 +0100 (CET)
Received: from AM5PR0101CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::35) by VI1PR0802MB2238.eurprd08.prod.outlook.com
 (2603:10a6:800:9a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 13:17:40 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::fd) by AM5PR0101CA0022.outlook.office365.com
 (2603:10a6:206:16::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 13:17:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 13:17:39 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Fri, 25 Mar 2022 13:17:39 +0000
Received: from ce1d882b522f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0B520D9-B59F-451C-B52C-84B2A1FBC800.1; 
 Fri, 25 Mar 2022 13:17:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce1d882b522f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 13:17:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6782.eurprd08.prod.outlook.com (2603:10a6:102:13a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 13:17:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 13:17:31 +0000
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
X-Inumbo-ID: f87cf3b1-ac3d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fIc/eqK3kWeXqoBrt5LrsB+jo946lo8J6DEE8IJHXo=;
 b=joMpeNEFOHdSXYH0G4wqhyb/IRY5NLgpzkixNttkDdFuztTLpy9Yv20aRh8l/abcjTVPQsEMS3pzGEwk06Et0kbodPCyLgfU7nxdNz7FbQZazpMs5Cfai6dNLaJKrzbYX8qehFXtF7/KprZq0PJEwnoMBH3d/cH0Y1j1xk/2ACE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 707b49702d441198
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKtIbvxM+AmNuwgCgIYo5EsfJ0c2IAirE8u4nxDUvOk6PZbTMgthJjjwBC7V+zkGuWu1B9rPDGaFmcyg3jDvnPip18rBpOzix5hxI97NiV0WOd9lsN00aLQ2h10MgcGEWmzOtWn7XoVbrMGybhPjsBMuj3mYaCIvYpuJtyOrIG0AbjCBHjk+fhCQviefvWsv5x+iSiyyJgX6676yDo88KocHmmDT3B3Ivf5tLyiOJP3GG2GNlkJJlTNRTWfoy5KMcek3GevbUq2i6aU982ImdDU2BroJPmezzVZsz5aEK3htTt4p2ZlIhC74ZO7OkVh5ZmZJclFZMzdH13qIjgHF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fIc/eqK3kWeXqoBrt5LrsB+jo946lo8J6DEE8IJHXo=;
 b=nePcsMtEiq1nD8XsMETjjmgUiKNCNGfu91yOBWZpyALb+/yncOlQgFj6DPemMjflEWbnM1gowIxaxRg8NVnS1L6lUf61tO0qAEPNhhCzMyFlvwJsAikJiI+wp2iOcut7tBNXkho+dPae1QJwvKB5aN/+XWnJlogR6vimlqed0ok128lJK7DXT5y34wKLGFm2KwW+spwxRWGPl/KLdar2gNfGQws9jpM1ZsBoqmA8KFseSiC+CVXFqnZ2Dz0YhULlz16j4fGqh9J4dNjCyPUIc2weavNpZ4owFMzPSF/O9XZjQYT0JvaeKw2ZI2yw3mV5Ls5Szvh1QlOwRK0FcJX3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fIc/eqK3kWeXqoBrt5LrsB+jo946lo8J6DEE8IJHXo=;
 b=joMpeNEFOHdSXYH0G4wqhyb/IRY5NLgpzkixNttkDdFuztTLpy9Yv20aRh8l/abcjTVPQsEMS3pzGEwk06Et0kbodPCyLgfU7nxdNz7FbQZazpMs5Cfai6dNLaJKrzbYX8qehFXtF7/KprZq0PJEwnoMBH3d/cH0Y1j1xk/2ACE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 2/5] xen/arm64: Rework the memory layout
Thread-Topic: [PATCH early-RFC 2/5] xen/arm64: Rework the memory layout
Thread-Index: AQHYM6fehqIqx7byxEaDRoW/6LbtaqzQLgwA
Date: Fri, 25 Mar 2022 13:17:31 +0000
Message-ID: <DE3C6104-82AD-41AE-BDAA-0074A08DDECF@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-3-julien@xen.org>
In-Reply-To: <20220309112048.17377-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5cf45414-67a1-44a2-cb4e-08da0e61d66a
x-ms-traffictypediagnostic:
	PAXPR08MB6782:EE_|VE1EUR03FT026:EE_|VI1PR0802MB2238:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2238685B288AA6237710D5CD9D1A9@VI1PR0802MB2238.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QlfkzRfsUm4Qlq1Y5RfraNgXFK5fcMD9rOQiRR3k3Mqv7OMyf4l9UxhS71Fuhx9zHaWLByun73w0MCP7V1P0LgZqzB+lscOd3XBMSajI0Dwd8PMv9vI/NBJAW2cr6zsEkjUWQ0XETpvbQz3hScO1lL/ybdeBe81OM/UBN/9K/rchdTHVUVK2BEpcnOCBIS9hfVebZiE0ikTagFrhROtWGdHBTiULc9QaG9QD5MPcpvrVp13uBiKrCa5dJc/2fo9jRsIEFrB8/8iYn4zP4te+i2dpPttekAgIp52mNnvXwz4UorOHnBxCMP8K1/r5WuFpHqYEmu0Hnui+nkPdqVi7Zb8PJK7BPtO78e4WJfF+0n7T3ZXt740RzFoQqxfXGmGO0vCu/IVzmaDVruc5H20Nri3S07ABlaAHPi5DcnCVeeM7IP39NjJQ3MM7XB5vpgnnvIFlxuVwxrdAmxOlhJ0D0ow4P75I4J7cE6pqAvHf4YD4VNZKU42GrOqoCHpjb52CVzHVsp9+1qsG6tTHHI5CypdfeFZhZ8MBYbmWJr16wnym5rKMtmxCaKlAl8o0AQhRPX+ffN5y90X0gCIIw+CK6qgfsriGt25Jm3fXHd+WD0AYuzA6G1zuRbkmfhnchdjGZ56WIK9+fHpB+ZlfXIctOZmu7pCrfrqCsiOB4wXNp5eZ1gd9VLLd0aPIZxHV6tJQSORXFutabfpyZuDpjUCXzDJq3g/uIFYwHW7OcLrQvHo+ZbdxfgtRGite08hyoWi4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(26005)(186003)(6486002)(6506007)(53546011)(66556008)(508600001)(122000001)(71200400001)(38070700005)(38100700002)(6512007)(33656002)(76116006)(66476007)(83380400001)(66946007)(66446008)(64756008)(86362001)(8936002)(316002)(91956017)(6916009)(54906003)(2906002)(5660300002)(4326008)(8676002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <903F38575650EF4C8F1771A5D28BA83F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6782
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e42458c6-1194-4298-1dc9-08da0e61d156
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TmtJnyej15KlHn6UrEwvYOzXwrllR90Ln8pgRxtHyzhoM6mP//KZ6gm5+oZYoTJHkr9hoom8ToPejVopewCoss4sEJ/VGa5W3qW9oiEj5UPzqVbkPy87yWaGDGcsGEZbNQv4bf3bYrb8YTYCiOZvJL1NqbRXf4e/QLBzg420rzt7S8Hd12P3UegP5LifGdy+6y4pf8W48KprJIE7s0Ui9htXyXPBOe5GHeP3B++EZqPwiRVVhVvfrIGRcl+wqrl6JnC586wg8pZ1cXVJD3yJP3cKXrzLvHoCXGsXd/1KnVrBaryJuvnqdGkjRhtEjuEjhDVgMAE8gk8xnm7KU804N8myBv8Usx4HHTHAG0XgoArX/8Dgy/EnN3Ui+8Kumyrrv9Xz+AU5rYcL8elisSLrRU2gciZgfCliYuKYGbakkEeTuUnXYFVgAaMdbJpZNJ9dNvTBh37RlNUhCTvPHTgG4dIwSaT/q1HKG/V9d7lxs4keJE3eL0Fm0cjuKwDgDIpY+9OL+xnwC2AzenOskMiIvDkbc4XhZ/SF2a9cg2A3wNpnLefP6/8lRYsc3MWxRaAnqLSzn2KbcmSXn5vXWy1+J7c0ginl3cexDS2YiwdZcBIDWc54LGfUN6jd69M0Q5qUlg6UQW1z7/dGZtLwqrV5ohp3lXx/XA+l3kXGP2ll4yUkF3HbrWGtNTcinDM/qpzg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(86362001)(8676002)(36756003)(4326008)(6862004)(70586007)(508600001)(83380400001)(8936002)(81166007)(2906002)(5660300002)(356005)(70206006)(2616005)(82310400004)(107886003)(36860700001)(6486002)(26005)(316002)(186003)(33656002)(47076005)(6506007)(40460700003)(6512007)(54906003)(53546011)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 13:17:39.6823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf45414-67a1-44a2-cb4e-08da0e61d66a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2238

SGkgSnVsaWVuLA0KDQo+IE9uIDkgTWFyIDIwMjIsIGF0IDEyOjIwLCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFt
YXpvbi5jb20+DQo+IA0KPiBYZW4gaXMgY3VycmVudGx5IG5vdCBmdWxseSBjb21wbGlhbnQgd2l0
aCB0aGUgQXJtIGJlY2F1c2UgaXQgd2lsbA0KSSB0aGluayB5b3Ugd2FudGVkIHRvIHNheSDigJxh
cm0gYXJt4oCdIGhlci4NCg0KPiBzd2l0Y2ggdGhlIFRUQlIgd2l0aCB0aGUgTU1VIG9uLg0KPiAN
Cj4gSW4gb3JkZXIgdG8gYmUgY29tcGxpYW50LCB3ZSBuZWVkIHRvIGRpc2FibGUgdGhlIE1NVSBi
ZWZvcmUNCj4gc3dpdGNoaW5nIHRoZSBUVEJSLiBUaGUgaW1wbGljYXRpb24gaXMgdGhlIHBhZ2Ut
dGFibGVzIHNob3VsZA0KPiBjb250YWluIGFuIGlkZW50aXR5IG1hcHBpbmcgb2YgdGhlIGNvZGUg
c3dpdGNoaW5nIHRoZSBUVEJSLg0KPiANCj4gSWYgd2UgZG9uJ3QgcmV3b3JrIHRoZSBtZW1vcnkg
bGF5b3V0LCB3ZSB3b3VsZCBuZWVkIHRvIGZpbmQgYQ0KPiB2aXJ0dWFsIGFkZHJlc3MgdGhhdCBt
YXRjaGVzIGEgcGh5c2ljYWwgYWRkcmVzcyBhbmQgZG9lc24ndCBjbGFzaA0KPiB3aXRoIHRoZSBz
dGF0aWMgdmlydHVhbCByZWdpb25zLiBUaGlzIGNhbiBiZSBhIGJpdCB0cmlja3kuDQoNClRoaXMg
c2VudGVuY2UgaXMgYSBiaXQgbWlzbGVhZGluZy4gRXZlbiB3aXRoIHRoZSByZXdvcmsgeW91IG5l
ZWQgDQp0byBkbyB0aGF0IGp1c3QgYnkgbW92aW5nIHRoZSBYZW4gdmlydHVhbCBhZGRyZXNzIHVw
cGVyIHlvdSBtYWtlDQpzdXJlIHRoYXQgYW55dGhpbmcgcGh5c2ljYWwgbWVtb3J5IHVuZGVyIDUx
MkdCIGNhbiBiZSBtYXBwZWQNCjE6MSB3aXRob3V0IGNsYXNoaW5nIHdpdGggb3RoZXIgWGVuIG1h
cHBpbmdzICh1bmxlc3MgWGVuIGlzIGxvYWRlZA0KaW4gbWVtb3J5IGF0IHBoeXNpY2FsIGFkZHJl
c3MgNTEyR0Igd2hpY2ggd291bGQgZW5kIGluIHRoZSBzYW1lIGlzc3VlKS4NCg0KSSB0aGluayBz
aG91bGQgYmUgcmVwaHJhc2VkLg0KDQo+IA0KPiBPbiBhcm02NCwgdGhlIG1lbW9yeSBsYXlvdXQg
IGhhcyBwbGVudHkgb2YgdW51c2VkIHNwYWNlLiBJbiBtb3N0IG9mDQo+IHRoZSBjYXNlIHdlIGV4
cGVjdCBYZW4gdG8gYmUgbG9hZGVkIGluIGxvdyBtZW1vcnkuDQo+IA0KPiBUaGUgbWVtb3J5IGxh
eW91dCBpcyByZXNodWZmbGVkIHRvIGtlZXAgdGhlIDB0aCBzbG90IGZyZWUuIFhlbiB3aWxsIG5v
dw0KDQowdGggc2xvdCBvZiBmaXJzdCBsZXZlbCBvZiBwYWdlIHRhYmxlLg0KDQo+IGJlIGxvYWRl
ZCBhdCAoNTEyR0IgKyAyTUIpLiBUaGlzIHJlcXVpcmVzIGEgc2xpZ2h0IHR3ZWFrIG9mIHRoZSBi
b290DQo+IGNvZGUgYXMgWEVOX1ZJUlRfU1RBUlQgY2Fubm90IGJlIHVzZWQgYXMgYW4gaW1tZWRp
YXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4NCj4gDQo+IC0tLQ0KPiANCj4gICAgVE9ETzoNCj4gICAgICAgIC0gSSB2YWd1ZWx5IHJlY2Fs
bCB0aGF0IG9uZSBvZiB0aGUgZWFybHkgcGxhdGZvcm0gd2Ugc3VwcG9ydGVkIGFkZA0KPiAgICAg
ICAgICB0aGUgbWVtb3J5IHN0YXJ0aW5nIGluIGhpZ2ggbWVtb3J5ICg+IDFUQikuIEkgbmVlZCB0
byBjaGVjaw0KPiAgICAgICAgICB3aGV0aGVyIHRoZSBuZXcgbGF5b3V0IHdpbGwgYmUgZmluZS4N
Cg0KSSB0aGluayB3ZSBoYXZlIHNvbWUgSnVubyB3aXRoIHNvbWUgbWVtb3J5IGxpa2UgdGhhdCwg
dGVsbCBtZSBpZiB5b3UgbmVlZCBoZWxwIGhlcmUuDQoNCj4gICAgICAgIC0gVXBkYXRlIHRoZSBk
b2N1bWVudGF0aW9uIHRvIHJlZmxlY3QgdGhlIG5ldyBsYXlvdXQNCj4gLS0tDQo+IHhlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMgICAgICAgICB8ICAzICsrLQ0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vY29uZmlnLmggfCAyMCArKysrKysrKysrKysrKy0tLS0tLQ0KPiB4ZW4vYXJjaC9hcm0v
bW0uYyAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQ0KPiAzIGZpbGVzIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+
IGluZGV4IDY2ZDg2MmZjODEzNy4uODc4NjQ5MjgwZDczIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMNCj4g
QEAgLTU5NCw3ICs1OTQsOCBAQCBjcmVhdGVfcGFnZV90YWJsZXM6DQo+ICAgICAgICAgICogbmVl
ZCBhbiBhZGRpdGlvbmFsIDE6MSBtYXBwaW5nLCB0aGUgdmlydHVhbCBtYXBwaW5nIHdpbGwNCj4g
ICAgICAgICAgKiBzdWZmaWNlLg0KPiAgICAgICAgICAqLw0KPiAtICAgICAgICBjbXAgICB4MTks
ICNYRU5fVklSVF9TVEFSVA0KPiArICAgICAgICBsZHIgICB4MCwgPVhFTl9WSVJUX1NUQVJUDQo+
ICsgICAgICAgIGNtcCAgIHgxOSwgeDANCkEgY29tbWVudCBpbiB0aGUgY29kZSB3b3VsZCBiZSBn
b29kIGhlcmUgdG8gcHJldmVudCBzb21lb25lIHJldmVydGluZyB0aGlzLg0KDQo+ICAgICAgICAg
Ym5lICAgMWYNCj4gICAgICAgICByZXQNCj4gMToNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9jb25maWcuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jb25maWcu
aA0KPiBpbmRleCA1ZGIyOGE4ZGJkNTYuLmIyZjMxYTkxNDEwMyAxMDA2NDQNCj4gLS0tIGEveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NvbmZpZy5oDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9jb25maWcuaA0KPiBAQCAtMTA3LDggKzEwNywyMCBAQA0KPiAgKiAgVW51c2VkDQo+
ICAqLw0KPiANCj4gKyNpZmRlZiBDT05GSUdfQVJNXzMyDQo+ICsNCj4gI2RlZmluZSBDT01NT05f
VklSVF9TVEFSVCAgICAgICBfQVQodmFkZHJfdCwgMCkNCj4gDQo+ICsjZWxzZQ0KPiArDQo+ICsj
ZGVmaW5lIFNMT1QwX0VOVFJZX0JJVFMgIDM5DQo+ICsjZGVmaW5lIFNMT1QwKHNsb3QpIChfQVQo
dmFkZHJfdCxzbG90KSA8PCBTTE9UMF9FTlRSWV9CSVRTKQ0KPiArI2RlZmluZSBTTE9UMF9FTlRS
WV9TSVpFICBTTE9UMCgxKQ0KPiArDQo+ICsjZGVmaW5lIENPTU1PTl9WSVJUX1NUQVJUICAgICAg
IFNMT1QoMSkNCj4gKw0KPiArI2VuZGlmDQo+ICsNCj4gI2RlZmluZSBYRU5fVklSVF9TVEFSVCAg
ICAgICAgICAoQ09NTU9OX1ZJUlRfU1RBUlQgKyBNQigyKSkNCj4gI2RlZmluZSBYRU5fU0xPVF9T
SVpFICAgICAgICAgICBNQigyKQ0KPiAjZGVmaW5lIFhFTl9WSVJUX0VORCAgICAgICAgICAgIChY
RU5fVklSVF9TVEFSVCArIFhFTl9TTE9UX1NJWkUpDQo+IEBAIC0xNjEsMTQgKzE3MywxMCBAQA0K
PiANCj4gI2Vsc2UgLyogQVJNXzY0ICovDQo+IA0KPiAtI2RlZmluZSBTTE9UMF9FTlRSWV9CSVRT
ICAzOQ0KPiAtI2RlZmluZSBTTE9UMChzbG90KSAoX0FUKHZhZGRyX3Qsc2xvdCkgPDwgU0xPVDBf
RU5UUllfQklUUykNCj4gLSNkZWZpbmUgU0xPVDBfRU5UUllfU0laRSAgU0xPVDAoMSkNCj4gLQ0K
PiAtI2RlZmluZSBWTUFQX1ZJUlRfU1RBUlQgIEdCKDEpDQo+ICsjZGVmaW5lIFZNQVBfVklSVF9T
VEFSVCAgKFNMT1QwKDEpICsgR0IoMSkpDQo+ICNkZWZpbmUgVk1BUF9WSVJUX0VORCAgICAoVk1B
UF9WSVJUX1NUQVJUICsgR0IoMSkpDQo+IA0KPiAtI2RlZmluZSBGUkFNRVRBQkxFX1ZJUlRfU1RB
UlQgIEdCKDMyKQ0KPiArI2RlZmluZSBGUkFNRVRBQkxFX1ZJUlRfU1RBUlQgIChTTE9UMCgxKSAr
IEdCKDMyKSkNCj4gI2RlZmluZSBGUkFNRVRBQkxFX1NJWkUgICAgICAgIEdCKDMyKQ0KPiAjZGVm
aW5lIEZSQU1FVEFCTEVfTlIgICAgICAgICAgKEZSQU1FVEFCTEVfU0laRSAvIHNpemVvZigqZnJh
bWVfdGFibGUpKQ0KPiAjZGVmaW5lIEZSQU1FVEFCTEVfVklSVF9FTkQgICAgKEZSQU1FVEFCTEVf
VklSVF9TVEFSVCArIEZSQU1FVEFCTEVfU0laRSAtIDEpDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+IGluZGV4IDZiN2M0MWQ4MjdjYS4uNzVl
ZDlhM2NlMjQ5IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYw0KPiArKysgYi94ZW4v
YXJjaC9hcm0vbW0uYw0KPiBAQCAtMTg3LDExICsxODcsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0
IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnModm9pZCkNCj4gICAgIEJVSUxEX0JVR19P
TihESVJFQ1RNQVBfVklSVF9TVEFSVCAmIH5GSVJTVF9NQVNLKTsNCj4gI2VuZGlmDQo+ICAgICAv
KiBQYWdlIHRhYmxlIHN0cnVjdHVyZSBjb25zdHJhaW50cyAqLw0KPiAtI2lmZGVmIENPTkZJR19B
Uk1fNjQNCj4gLSAgICBCVUlMRF9CVUdfT04oemVyb2V0aF90YWJsZV9vZmZzZXQoWEVOX1ZJUlRf
U1RBUlQpKTsNCj4gLSNlbmRpZg0KRG9u4oCZdCB5b3Ugd2FudCB0byBlbmZvcmNlIHRoZSBvcHBv
c2l0ZSBub3cgPyBDaGVjayB0aGF0IGl0IGlzIG5vdCBvbiBzbG90IDAgPw0KDQo+ICAgICBCVUlM
RF9CVUdfT04oZmlyc3RfdGFibGVfb2Zmc2V0KFhFTl9WSVJUX1NUQVJUKSk7DQo+ICsjaWZkZWYg
Q09ORklHX0FSTV8zMg0KPiAgICAgQlVJTERfQlVHX09OKHNlY29uZF9saW5lYXJfb2Zmc2V0KFhF
Tl9WSVJUX1NUQVJUKSA+PSBYRU5fUFRfTFBBRV9FTlRSSUVTKTsNCj4gKyNlbmRpZg0KPiAjaWZk
ZWYgQ09ORklHX0RPTUFJTl9QQUdFDQo+ICAgICBCVUlMRF9CVUdfT04oRE9NSEVBUF9WSVJUX1NU
QVJUICYgfkZJUlNUX01BU0spOw0KPiAjZW5kaWYNCj4gQEAgLTYxMSwxMCArNjEwLDExIEBAIHZv
aWQgX19pbml0IHNldHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0
KQ0KPiAgICAgcGh5c19vZmZzZXQgPSBib290X3BoeXNfb2Zmc2V0Ow0KPiANCj4gI2lmZGVmIENP
TkZJR19BUk1fNjQNCj4gLSAgICBwID0gKHZvaWQgKikgeGVuX3BndGFibGU7DQo+IC0gICAgcFsw
XSA9IHB0ZV9vZl94ZW5hZGRyKCh1aW50cHRyX3QpeGVuX2ZpcnN0KTsNCj4gLSAgICBwWzBdLnB0
LnRhYmxlID0gMTsNCj4gLSAgICBwWzBdLnB0LnhuID0gMDsNCj4gKyAgICBwdGUgPSBwdGVfb2Zf
eGVuYWRkcigodWludHB0cl90KXhlbl9maXJzdCk7DQo+ICsgICAgcHRlLnB0LnRhYmxlID0gMTsN
Cj4gKyAgICBwdGUucHQueG4gPSAwOw0KPiArICAgIHhlbl9wZ3RhYmxlW3plcm9ldGhfdGFibGVf
b2Zmc2V0KFhFTl9WSVJUX1NUQVJUKV0gPSBwdGU7DQo+ICsNCj4gICAgIHAgPSAodm9pZCAqKSB4
ZW5fZmlyc3Q7DQo+ICNlbHNlDQo+ICAgICBwID0gKHZvaWQgKikgY3B1MF9wZ3RhYmxlOw0KPiAt
LSANCj4gMi4zMi4wDQo+IA0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg0K

