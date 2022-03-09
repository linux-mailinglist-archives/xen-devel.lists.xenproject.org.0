Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0D4D2D5A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 11:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287699.487816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtqp-0001VH-5J; Wed, 09 Mar 2022 10:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287699.487816; Wed, 09 Mar 2022 10:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtqp-0001Sx-25; Wed, 09 Mar 2022 10:47:27 +0000
Received: by outflank-mailman (input) for mailman id 287699;
 Wed, 09 Mar 2022 10:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1b7=TU=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nRtqo-0001Sr-0S
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 10:47:26 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe09::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4da3f15a-9f96-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 11:47:24 +0100 (CET)
Received: from AS8PR05CA0014.eurprd05.prod.outlook.com (2603:10a6:20b:311::19)
 by PA4PR08MB6048.eurprd08.prod.outlook.com (2603:10a6:102:e6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:47:21 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::78) by AS8PR05CA0014.outlook.office365.com
 (2603:10a6:20b:311::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Wed, 9 Mar 2022 10:47:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Wed, 9 Mar 2022 10:47:20 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Wed, 09 Mar 2022 10:47:19 +0000
Received: from a7f8fe284382.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CBD5875-31C0-4848-ADB8-7631C89C330D.1; 
 Wed, 09 Mar 2022 10:47:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7f8fe284382.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Mar 2022 10:47:08 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM5PR0802MB2403.eurprd08.prod.outlook.com
 (2603:10a6:203:9f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Wed, 9 Mar
 2022 10:47:07 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60%10]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 10:47:06 +0000
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
X-Inumbo-ID: 4da3f15a-9f96-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AbVK641f4jYbZCLdtSy5BQ6floHaZ/eRwK4bP+9qQE=;
 b=USesYiSbhGrKpd0aQ18PGG9IoaMWvuRzosNExHDCnNh/VsE52Hx2q7jBPQw5J5ajKlC5/G1UBLmlW729ZNojoJrUc89XztqpocYi7XFBNafioFMPGGQV8bVwkGRHdP8/WG4aBlslctpHTnEaRuAvH/HYiH6/HwmETXPFy2zYCNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a60888c56b89826
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YL3gOUH3zfEovvL8KAGeVcrQr+WUWsoCPmIfUwEQdHlXIBWkz/WOT8cmgatY+10P5XKzXJ+VBpye1sVOYwDpFEqvSoPFmPXlWlOsU4pt+8avf/VjfP0k1GrRpv4O66nCGEPP3LnSnKmooeBgY+6zbtm9kmWkV5+oqdc3TTY43VBtvpOSWhQ4OYsp42Y1vtJYywXb9nPzJzG8BL8N4tSbDbKy/sWSlTWjEkYWGUso9Lh3a/gaCZqhEyyoijSN01xjBk+mu/PhklRoN7CawavDrVG9W9bFVcdU9ASrEF/glQRkot5jhsGev+Vh6FHWUf6TgdD+Xw67fz1gSPe4qkZYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AbVK641f4jYbZCLdtSy5BQ6floHaZ/eRwK4bP+9qQE=;
 b=XXeQ/uH1V/eDx5a/7e1/l0TqAU3vf0OigdCDhkdRdzy1ZZAgwWjfD5Wh+p7Wwsb4cg5NHmX2e+njQUrHYirslmutZIK1BEdiSoUazbK7OQg3+/2vOA+/3u4UwA5CptDCF1UBJi1+m575VGC5N0tmyaTQUQryToGeeCLr3ltGSbHrrDFfJPeLkTlbbo/n9/KGk/p6X16oMSKvdVeqn5RJSRt05HC02EG6QyT7VGNsf8z8ZEYWfYr4yQJRUWEoKSDin0GRO2rswRUSFqGymSg2osmnbP6F8JgvYzv7VFx4+rr+BjrqT+RJtIKHPvcpWOMNT7CwRaNsngxERYq6tigOrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AbVK641f4jYbZCLdtSy5BQ6floHaZ/eRwK4bP+9qQE=;
 b=USesYiSbhGrKpd0aQ18PGG9IoaMWvuRzosNExHDCnNh/VsE52Hx2q7jBPQw5J5ajKlC5/G1UBLmlW729ZNojoJrUc89XztqpocYi7XFBNafioFMPGGQV8bVwkGRHdP8/WG4aBlslctpHTnEaRuAvH/HYiH6/HwmETXPFy2zYCNU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Thread-Topic: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86
 file
Thread-Index:
 AQHYIoBoEZVl6/zkE0mK7dGMpvA2Zqyi2K6AgAfEbQCAAAXLAIADUEkAgAD5MYCACAnKAIAAAjUAgAAIqIA=
Date: Wed, 9 Mar 2022 10:47:06 +0000
Message-ID: <D73324F4-180F-472E-B2A4-14305D3D764B@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
 <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
 <Yih+ZjxKz0SMOXef@Air-de-Roger>
In-Reply-To: <Yih+ZjxKz0SMOXef@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f7ff3b02-d993-491c-b751-08da01ba2fea
x-ms-traffictypediagnostic:
	AM5PR0802MB2403:EE_|VE1EUR03FT025:EE_|PA4PR08MB6048:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB604807F47E2BB91ED4E63D57FC0A9@PA4PR08MB6048.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ucBvWyk2Geyto+4nZd6HBjtyyZIiaAZKtiDFNJEP/z1Q1PWOo0X1TXtVpdtIRUAESEl8BfyboUdjicsV/pFyx8fes5EHz8wTOVnZwtAyayD2j/ckpjHIwwSJ2FyHExbS68dIl6NUHSTZQP1BYwD5NxsD+CiFQIDeZh/iLaSUDXLKEzonKjrp4PgFEbFWN1DGaE3T7kvQIHBWpsIbu2hjKF5j3UjdzFCyvglwfjUuXEdbo9IyJ643R36XnS1l+ShfBmLeGIPwEfDYjlrlbXUIRpqT8iZxUxZpkZKSwLAUFbIe9v0VpCN2UKawQ6VIvw8Id2J8K0IxpUZOGf9tMDsVd069GmwfQuKIxavAFq2zlmGXHpw8ya9sHOFC8loZfcbXeImF0SeVUiPPWfxBLWVqEBGrsd1/oXD3rmeAVI9orpoZHf/UdcNDceN3pxDseHMsiC/1+KJalvLCRHdqs6Y+Ut8kjEVVfaNkMeFG8Q07zNHKS3ZiXH/CJbRZY3TnQZt+wrwlb0B3+/XZH7gsUACkAAFu6hGQJD/Z20fNj7YXBiayQatZamMiQ0f3XSDCynlT5tBOoy1FcF++0U5GCvG077+nX/H/vkDWJPd+CgguSp4kRSbRR3TvNgeBC4p4a6c9uY4t0YrO6bzPD2fmyqMcLRNF+g7WjU/GzY5O65B4V45CfaDwX/AkkWnxOotiKxzxlMs4moRj7n3jbVSB2nBfpiAvLur9c3100M754IS7sNkK5lmHyqsOaOTZyrMBFw5OMWwoUBK7V8ylHJA55U/0nItNKRBh7Wc5N1k86DNieHu8sGFxKfo+wJskaRNiB2ON
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(71200400001)(508600001)(6486002)(54906003)(6916009)(316002)(38070700005)(38100700002)(66556008)(66476007)(66446008)(8676002)(4326008)(966005)(64756008)(86362001)(122000001)(91956017)(76116006)(66946007)(53546011)(6512007)(8936002)(36756003)(6506007)(2906002)(186003)(26005)(83380400001)(5660300002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D414FA2C17DC94EADF4273E25E88D7F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2403
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d91c7322-a297-47e0-4010-08da01ba27cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cGttTMfJGylFSSURuEQr7lduCJcM31OdTRX9qGquH5TIMoFtGy4nlIt86nk/SCSRf87nMeeYebz1WQXxHOrRSwcKx6CdEqCDWlZ+/Mz6ERx49XiDRPhL1cfj5Bj8log/1vMXumrp8B14pJtMtLN3VlzCoLe1hnP4hU5O1Z4i1IykeC4vmZ0ZGjXrUPaJzkiQPWsQ0DUjAGYmpM9oID7Xge1u3CWm78zHk728gIuFzA/2a+IWEycXFnb0EO5mWg4bvejetfMJEO4giUxGdSmgEWIkLJhJ/4dYXVrXifhxKNjGNuQBkmv9LhvSRTTgI6Bi7+Eej44KK4zvy9pq/qEbtye+HuJafyy6ctfnI3AQuKQnFpcMvAGMjyzJolGGTCsLcP7+GH7WY2VpMWtAhwWy4tA8N3g4uTiqK/7jdXNDLwxw/GKgDkOe3bMw1R4rjwR67S6+9kmMsEjL09shf+N8Np3WkJqmdQpprF9feHu7wZhJQgsMWnhcmBNf4vmLeJk5A9BXC++GtY/mqNc1/OSIRs4FwF5xm/b2Y5/D+I1GvRza2MrewC/Jcn7FpeHrK7CB4VyEzaNtR5eR/myiOutokYx/X2z57049fkkPE5+mjfxbtyW7DkWuZbi5xA2Iruz4Nmxe+DkMiT5X9YBxQhN2ROFXGxalp3aERzGZO0/dB7W2FCJEt7RJe5d6nfxjY6TCjanfuRM+iFs6zL5F9cZQ6AmxQwCFjG4+RmanaTjQkhqApLZaj58VysmzBtD3SYWn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6506007)(316002)(8676002)(6862004)(70206006)(70586007)(47076005)(4326008)(5660300002)(40460700003)(336012)(82310400004)(2906002)(36860700001)(2616005)(26005)(33656002)(186003)(6512007)(83380400001)(8936002)(53546011)(356005)(508600001)(86362001)(36756003)(966005)(6486002)(81166007)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:47:20.4396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ff3b02-d993-491c-b751-08da01ba2fea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6048

SGkgUm9nZXIsDQoNCj4gT24gOSBNYXIgMjAyMiwgYXQgMTA6MTYgYW0sIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgTWFyIDA5LCAy
MDIyIGF0IDEwOjA4OjEyQU0gKzAwMDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSGkgSmFuLA0K
Pj4gDQo+Pj4gT24gNCBNYXIgMjAyMiwgYXQgNzoyMyBhbSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwMy4wMy4yMDIyIDE3OjMxLCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+Pj4+IE9uIDEgTWFyIDIwMjIsIGF0IDE6NTUgcG0sIEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiAwMS4wMy4yMDIyIDE0OjM0LCBS
YWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4gT24gMjQgRmViIDIwMjIsIGF0IDI6NTcgcG0sIEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+IE9uIDE1LjAyLjIw
MjIgMTY6MjUsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS92bXNpLmMNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jDQo+Pj4+
Pj4+PiBAQCAtOTI1LDQgKzkyNSwxMDYgQEAgaW50IHZwY2lfbXNpeF9hcmNoX3ByaW50KGNvbnN0
IHN0cnVjdCB2cGNpX21zaXggKm1zaXgpDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+ICByZXR1cm4gMDsN
Cj4+Pj4+Pj4+IH0NCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICtpbnQgdnBjaV9tYWtlX21zaXhfaG9s
ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+PiArICAg
IHN0cnVjdCBkb21haW4gKmQgPSBwZGV2LT5kb21haW47DQo+Pj4+Pj4+PiArICAgIHVuc2lnbmVk
IGludCBpOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICBpZiAoICFwZGV2LT52cGNpLT5tc2l4
ICkNCj4+Pj4+Pj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAg
ICAvKiBNYWtlIHN1cmUgdGhlcmUncyBhIGhvbGUgZm9yIHRoZSBNU0lYIHRhYmxlL1BCQSBpbiB0
aGUgcDJtLiAqLw0KPj4+Pj4+Pj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUocGRl
di0+dnBjaS0+bXNpeC0+dGFibGVzKTsgaSsrICkNCj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4g
KyAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCA9IFBGTl9ET1dOKHZtc2l4X3RhYmxlX2FkZHIo
cGRldi0+dnBjaSwgaSkpOw0KPj4+Pj4+Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQgPSBQ
Rk5fRE9XTih2bXNpeF90YWJsZV9hZGRyKHBkZXYtPnZwY2ksIGkpICsNCj4+Pj4+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1zaXhfdGFibGVfc2l6ZShwZGV2LT52
cGNpLCBpKSAtIDEpOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyAgICAgICAgZm9yICggOyBzdGFy
dCA8PSBlbmQ7IHN0YXJ0KysgKQ0KPj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4gKyAgICAg
ICAgICAgIHAybV90eXBlX3QgdDsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICBtZm5fdCBtZm4gPSBn
ZXRfZ2ZuX3F1ZXJ5KGQsIHN0YXJ0LCAmdCk7DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgICAg
ICAgICAgc3dpdGNoICggdCApDQo+Pj4+Pj4+PiArICAgICAgICAgICAgew0KPj4+Pj4+Pj4gKyAg
ICAgICAgICAgIGNhc2UgcDJtX21taW9fZG06DQo+Pj4+Pj4+PiArICAgICAgICAgICAgY2FzZSBw
Mm1faW52YWxpZDoNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgYnJlYWs7DQo+Pj4+Pj4+PiAr
ICAgICAgICAgICAgY2FzZSBwMm1fbW1pb19kaXJlY3Q6DQo+Pj4+Pj4+PiArICAgICAgICAgICAg
ICAgIGlmICggbWZuX3gobWZuKSA9PSBzdGFydCApDQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAg
IHsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGNsZWFyX2lkZW50aXR5X3AybV9lbnRy
eShkLCBzdGFydCk7DQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4+Pj4+
Pj4+ICsgICAgICAgICAgICAgICAgfQ0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAvKiBmYWxs
dGhyb3VnaC4gKi8NCj4+Pj4+Pj4+ICsgICAgICAgICAgICBkZWZhdWx0Og0KPj4+Pj4+Pj4gKyAg
ICAgICAgICAgICAgICBwdXRfZ2ZuKGQsIHN0YXJ0KTsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAg
ICAgZ3ByaW50ayhYRU5MT0dfV0FSTklORywNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAiJXBwOiBleGlzdGluZyBtYXBwaW5nIChtZm46ICUiIFBSSV9tZm4NCj4+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAidHlwZTogJWQpIGF0ICUjbHggY2xvYmJlcnMgTVNJWCBN
TUlPIGFyZWFcbiIsDQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgJnBkZXYtPnNi
ZGYsIG1mbl94KG1mbiksIHQsIHN0YXJ0KTsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgcmV0
dXJuIC1FRVhJU1Q7DQo+Pj4+Pj4+PiArICAgICAgICAgICAgfQ0KPj4+Pj4+Pj4gKyAgICAgICAg
ICAgIHB1dF9nZm4oZCwgc3RhcnQpOw0KPj4+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+Pj4gKyAg
ICB9DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArICAgIHJldHVybiAwOw0KPj4+Pj4+Pj4gK30NCj4+
Pj4+Pj4gDQo+Pj4+Pj4+IC4uLiBub3RoaW5nIGluIHRoaXMgZnVuY3Rpb24gbG9va3MgdG8gYmUg
eDg2LXNwZWNpZmljLCBleGNlcHQgbWF5YmUNCj4+Pj4+Pj4gZnVuY3Rpb25zIGxpa2UgY2xlYXJf
aWRlbnRpdHlfcDJtX2VudHJ5KCkgbWF5IG5vdCBjdXJyZW50bHkgYmUgYXZhaWxhYmxlDQo+Pj4+
Pj4+IG9uIEFybS4gQnV0IHRoaXMgZG9lc24ndCBtYWtlIHRoZSBjb2RlIHg4Ni1zcGVjaWZpYy4N
Cj4+Pj4+PiANCj4+Pj4+PiBJIHdpbGwgbWF5YmUgYmUgd3JvbmcgYnV0IHdoYXQgSSB1bmRlcnN0
YW5kIGZyb20gdGhlIGNvZGUgaXMgdGhhdCBmb3IgeDg2IA0KPj4+Pj4+IGlmIHRoZXJlIGlzIG5v
IHAybSBlbnRyaWVzIHNldHVwIGZvciB0aGUgcmVnaW9uLCBhY2Nlc3NlcyB0byB0aGVtIHdpbGwg
YmUgdHJhcHBlZCANCj4+Pj4+PiBpbnRvIHRoZSBoeXBlcnZpc29yIGFuZCBjYW4gYmUgaGFuZGxl
ZCBieSBzcGVjaWZpYyBNTUlPIGhhbmRsZXIuDQo+Pj4+Pj4gDQo+Pj4+Pj4gQnV0IGZvciBBUk0g
d2hlbiB3ZSBhcmUgcmVnaXN0ZXJpbmcgdGhlIE1NSU8gaGFuZGxlciB3ZSBoYXZlIHRvIHByb3Zp
ZGUgDQo+Pj4+Pj4gdGhlIEdQQSBhbHNvIGZvciB0aGUgTU1JTyBoYW5kbGVyLiANCj4gDQo+IFJp
Z2h0LCBidXQgeW91IHN0aWxsIG5lZWQgdGhvc2UgcmVnaW9ucyB0byBub3QgYmUgbWFwcGVkIG9u
IHRoZSBzZWNvbmQNCj4gc3RhZ2UgdHJhbnNsYXRpb24sIG9yIGVsc2Ugbm8gdHJhcCB3aWxsIGJl
IHRyaWdnZXJlZCBhbmQgdGh1cyB0aGUNCj4gaGFuZGxlcnMgd29uJ3QgcnVuPw0KPiANCj4gUmVn
YXJkbGVzcyBvZiB3aGV0aGVyIHRoZSB3YXkgdG8gcmVnaXN0ZXIgdGhlIGhhbmRsZXJzIGlzIGRp
ZmZlcmVudCBvbg0KPiBBcm0gYW5kIHg4NiwgeW91IHN0aWxsIG5lZWQgdG8gYXNzdXJlIHRoYXQg
dGhlIE1TSS1YIHJlbGF0ZWQgdGFibGVzDQo+IGFyZSBub3QgbWFwcGVkIG9uIHRoZSBndWVzdCBz
ZWNvbmQgc3RhZ2UgdHJhbnNsYXRpb24sIG9yIGVsc2UgeW91IGFyZQ0KPiBqdXN0IGFsbG93aW5n
IGd1ZXN0IGFjY2VzcyB0byB0aGUgbmF0aXZlIG9uZXMuDQoNCldoYXQgSSB1bmRlcnN0YW5kIGZy
b20gdGhlIFZQQ0kgY29kZSB3ZSBhcmUgbm90IG1hcHBpbmcgdGhlIE1TSS1YIHJlbGF0ZWQgdGFi
bGVzL0JBUg0KdG8gU3RhZ2UtMiB0cmFuc2xhdGlvbiB0aGVyZWZvcmUgbm8gbmVlZCB0byByZW1v
dmUgdGhlIG1hcHBpbmcuDQoNCmh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5n
aXQ7YT1ibG9iO2Y9eGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYztoPWExYzkyOGEwZDI2ZjVjZWZk
OTg3MjdlZTM3ZjVkYzQzY2ViYTgwYTY7aGI9SEVBRCNsMjQ4DQoNCj4gDQo+IFNvIHlvdSBkbyBu
ZWVkIHRoaXMgZnVuY3Rpb24gb24gQXJtIGluIG9yZGVyIHRvIHByZXZlbnQgaGFyZHdhcmUgTVNJ
LVgNCj4gdGFibGVzIGJlaW5nIGFjY2Vzc2VkIGJ5IHRoZSBndWVzdC4gT3IgYXJlIHlvdSBzdWdn
ZXN0aW5nIGl0J3MNCj4gaW50ZW5kZWQgZm9yIEFybSBndWVzdCB0byBhY2Nlc3MgdGhlIG5hdGl2
ZSBNU0ktWCB0YWJsZXM/DQoNCk9uIEFSTSBhbHNvIGFjY2VzcyB0byB0aGUgTVNJLVggdGFibGVz
IHdpbGwgYmUgdHJhcHBlZCBhbmQgcGh5c2ljYWwgTVNJLVggdGFibGUNCndpbGwgYmUgdXBkYXRl
ZCBhY2NvcmRpbmdseS4NCg0KUmVnYXJkcywNClJhaHVsDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0K
DQo=

