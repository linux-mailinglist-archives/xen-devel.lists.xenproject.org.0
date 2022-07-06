Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D14567FD8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361832.591546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zU7-0003pt-Ov; Wed, 06 Jul 2022 07:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361832.591546; Wed, 06 Jul 2022 07:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zU7-0003np-Jk; Wed, 06 Jul 2022 07:30:07 +0000
Received: by outflank-mailman (input) for mailman id 361832;
 Wed, 06 Jul 2022 07:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zU5-0003d3-KW
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:30:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60043.outbound.protection.outlook.com [40.107.6.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7304e0e9-fcfd-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 09:30:03 +0200 (CEST)
Received: from AM6PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:20b:6e::16)
 by GV2PR08MB8052.eurprd08.prod.outlook.com (2603:10a6:150:75::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 07:29:59 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::e3) by AM6PR02CA0003.outlook.office365.com
 (2603:10a6:20b:6e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 07:29:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:29:58 +0000
Received: ("Tessian outbound 0ba541f03a2a:v122");
 Wed, 06 Jul 2022 07:29:58 +0000
Received: from 5380c76ba81e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A8920B0-9821-417B-BAF5-DBEA0022BDDC.1; 
 Wed, 06 Jul 2022 07:29:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5380c76ba81e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:29:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7163.eurprd08.prod.outlook.com (2603:10a6:10:2cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 07:29:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:29:50 +0000
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
X-Inumbo-ID: 7304e0e9-fcfd-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EcoAUtHdjiNgcG18HdnrMWkzdTWoeCPLzJFqZeOwCIk5mRMe2KtBB7NikKFRIDcBNMgbaObo1/xB3khVthSmjlWve+nsJ8YDHJ3X/rctEOodrevncnq2M8x3tTXtyuZOeKBYEkPNgVsScewRrALOimlWuHo7X0ENYVP4Cc2/Ab+UmBHB3fgjVsEJsMQUVnEt+7ghSq5ZTU2sglviVHcYtgj1bC21Aqxr5d/Y5VRNBPRWsz47ixR9B4RCTKkvCCvgzPgumOUz7mXpzKb367/arZSAzWyaojcatkA6y2Nq05NFIUU7X1t7lUJG6zMubnfMFogWdoRqHIkv6pRC4/zuOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb5KbdQ5rA/52jZXsR1wenHO2L2amUf1FObhgDImYPg=;
 b=VTDh2laBww8TyknkIUzL6HEEiDlam/+TCgUD1Sx7GxLB8mrtPXqO+LAplgEOzv+kyXi8wlNlx3gNSA2agfBNNS1VOogxKWsvz+ycTs9kEq1xHXcbuOpQcC/6z3BV9dEL2uM5/1owGHadDweLv/ETbLHh9k7Dtcauo3cs+gGlYIVVZh5GjY+HEaatWfDHlCpWNDA0a0v7qOVfin8lhrW99mJnX+/ETkdxThCv+A1LcYhomDcQSE5Kl4QEm278MJ26HtWSwAUgd3LH+A456wulNH9ieHyCxEMn050JtyffHx8RKyIOmyCJNQnn/9Rr8JKJdeiiFLYrgCv2GjimBAgBfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mb5KbdQ5rA/52jZXsR1wenHO2L2amUf1FObhgDImYPg=;
 b=G4G4Rgr3a8QG04/YeTw/NDVbRBQzV8brybG2fqIgkHR/h+AGuFs012+tNZHGsafKAXgcCt0SRxQrydbg0pg8F5a8vRAHNywGHpD8DCEeFhiPx27G2e5GNMSOJ2Js3+OFh29kNXaV/EglcTHIxAhtlHLJ3zwtvVg5gUphQtTICvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOUmOD1iyalMtyCl7wacvbAIP+D3J+n5G3WXQtzw1tqwKKXLQ4zyQIJuTwyVH2gYH3xAUTaeYSYBquD3OyHUGg8yAdL69nqBIcHFGcKcocPq9F0bhLT7+dPjFl6eNAjGKx2NZLSN+uADxIiV+vJuxCQzedA00SLBoGae8hqkp+8kFhTJNksV8u8YqSvLWcBqMsxd6JX7dZswkuhK7BFATEGca2e93vdg1yQf+wtpQjdbekis8WZVu+p3vUgQSEyMAG/ERXVi3a8EScVZAh1df0WUIz9NzRIHeluwAaN3MuIWHT5UgbcVeYqonS5O65eg/eiMKML7vIC9bydqMRVNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb5KbdQ5rA/52jZXsR1wenHO2L2amUf1FObhgDImYPg=;
 b=KOLYgvJzosLRBSIx9a0tmaBqJwv0ae/Yfl70fcV0jUGUubTj9P9woP/tLdrRZA206gml2jNUBabOqxfvNPA0DgCJxbrLi0+CNRN6FLNBmoLuPP9q05T12jUzi6LM/44bUZrXn8quyiNWoZgAB667+bOJ1cW/ipwGypPgDSZA6kTxK+r0ieG67wVdmh/qY6JrIaEU8NcokhFlI/TU++9jMLqsDREFB2BvKX9mDKo8eS7RZlgt+F//mwDY0RVO6jH962NTNgf/ituxUKcq58HxsFO4SUoQKaoQ8Q4PhOeIDuuLbRfa6uymMKyvBy1nqktPRe9NjJt9vvreSsBlSEewvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mb5KbdQ5rA/52jZXsR1wenHO2L2amUf1FObhgDImYPg=;
 b=G4G4Rgr3a8QG04/YeTw/NDVbRBQzV8brybG2fqIgkHR/h+AGuFs012+tNZHGsafKAXgcCt0SRxQrydbg0pg8F5a8vRAHNywGHpD8DCEeFhiPx27G2e5GNMSOJ2Js3+OFh29kNXaV/EglcTHIxAhtlHLJ3zwtvVg5gUphQtTICvc=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: RE: [PATCH 2/2] x86/cpuid: set MCDT_NO for non-affected models
Thread-Topic: [PATCH 2/2] x86/cpuid: set MCDT_NO for non-affected models
Thread-Index: AQHYZrVdmvwWiFDXRUaq3IIw27eoBK1xLw1A
Date: Wed, 6 Jul 2022 07:29:50 +0000
Message-ID:
 <AS8PR08MB79916014F49A1AF01AF4DD3792809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220513103500.3671-1-roger.pau@citrix.com>
 <20220513103500.3671-3-roger.pau@citrix.com>
In-Reply-To: <20220513103500.3671-3-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 63AEDF267BC8604A98C156A0A63C5860.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: abff89dc-6e14-4454-0158-08da5f2154df
x-ms-traffictypediagnostic:
	DB9PR08MB7163:EE_|AM5EUR03FT047:EE_|GV2PR08MB8052:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uH/xloRCbTVGQzlLnj5MUgCNx4OGKt08XNZgh0RIO93iqF17XhQf8ZO5STBRADUiZdqd1b86QB7qzk0RiPRkE+smiir0lrz9dRtSogbV8gitvqXmTM/DiUiykigpJGsR6l00DeB8mT9AYWhebpMOn1naT7GifcVpeMQdyPEBMuiF0cDVuC7O7lTCvUudHQ9M2s88VOGcdgyXflk05bx5/4CoNG9CMTlv2sS6I4i59kN4CxlLOIRdhHMSpQj8J8Zuqc21vaITS4OupPnQyJrzBwDaE2CbTTcwKtL+miqCW4URGfC+jlh4Uw2tFhAG3VTvfacqcS6lxT2zs6rQa5Gq+Wk+7uSxbr6dLX454CY7Pr59hC0WndmkJB4leuNsBDTnlEZD0Ltj7d4WuyXSeM7zENURGp2tNMBve8XfJbP2ffIUAUD6Ml97ePd5Z1QH9viV0ohw8mxX9+MVQJdGVwNi0jxzjVVtjToO4iwF/WoPw9E8d8l2Ts8cmQutDcVRdHsbMbnxtSxIYw/bfgelu276YKv3CIoO5NOAhiGfgzr9yL5iq++HvSAmIsFb4Z2d5+c0pBpX1KIqb6RW9xjbdVzpnDYeMQKcW6Vsxe1FboFxHX4yS4lCDJxb/L0dhJTWUN6jR8naCybgCCjQ+lTLRSt3PdwEVkRh34CPNb5oPBk558UADZK7ZTuEx3PtFNTD4il/IFrB8fVEQuEuXsSCzZeN9yS3sdJd8se5zS+3jKe9OqSJ0iURlnhJjz9d0MmNi+o5G0vMQvDGHvdY8n+es3jtfGXqxtgIOxzST0DJZEmapQ0Cc+YwWaUYeL/5nbX3/SlsFncuN7f2Kdq+iNwiFBVK4d0vRhD8qpag2uosGi6oDeg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(478600001)(38070700005)(122000001)(186003)(6506007)(7696005)(6916009)(316002)(54906003)(38100700002)(66946007)(8676002)(4326008)(33656002)(76116006)(66476007)(52536014)(71200400001)(66446008)(2906002)(64756008)(66556008)(26005)(9686003)(55016003)(5660300002)(8936002)(41300700001)(83380400001)(86362001)(170073001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7163
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5ac5f6c-aea8-4b60-dfc4-08da5f214fe3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VaqGJT7oCA+8HFHRpmwIA0bdDLNls8FGUbADddLuhagr0UtFAGhJUuQBjvvN4L/MEJ465BrnOuUNW6OMtF0xA1Z1NifN/rcIOpqNnECiwMwKBsPcI8nY+0GGyGssJw/rZsi1pzXGx0CAq9H8kLBn4g68+zQpt8NEpOIBmGEoa1DvdxScEE1Q86jU0s8hfE480wn/pumMUM9w6QfRkDMTfpO0w1vC1LdM/To5iq+oks88+mJ/ULANKgGkFhfgHy2HaCVTM5bHaUs0518nGjidIYTrMvYxpKltpklkHUg9ezpzFCj+y1ebm2cGL757EZEUZTXeE+wYxrIIeKFxyh0duk36zpXdKWbTqlirSuQC+SLhq5IltcAE1xR65NLFmOUs1TrZNcd5/+BmjaIXelReVultwvzRVBfCWo51rVrEmnUIkguqO24bGrL1ES7bxzbFyb2xRDcqlREeuY36P+E4QBIDqLi+c/6BxUwVl7U2HHoLkudBGeyH2Fxmfu2KuXmrIo53+ItRc8/OAn4JI5rYmw7L6badwN2y72Pas9Z8SFO4ur93PkEc6+5oGqNswikMe6MNNfqwouPvBQrHSSuDX3mMpugSG3amwOUEqFAG16IRX9srQM4OuvQLV6Kc1ZNJEEy9WxpPBjN/o8xkBpQq1scxf5CgYNyUyGdayO6nooPkvSMM+tC58N7qF81Ne+zULNaGXQS+IAQcJRRAw9NLvro3j9O1ioIACoasuAvyCtGLlDs0pk92u8bbjjSdcj05Fc7uBHZ5dOeR4JueKgV66hOvHJ9jzK9z5ddgTkvUqDCX58vBobm5ChnrHois4SREa1OIlqdH5r17wV0Or0v6Ugae+w2O1gcK6/31oTsgvjg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966006)(40470700004)(36840700001)(2906002)(6506007)(336012)(47076005)(52536014)(83380400001)(7696005)(81166007)(70586007)(41300700001)(186003)(8936002)(36860700001)(107886003)(5660300002)(316002)(478600001)(55016003)(70206006)(8676002)(40480700001)(82740400003)(356005)(33656002)(4326008)(9686003)(82310400005)(6916009)(26005)(86362001)(40460700003)(54906003)(170073001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:29:58.8025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abff89dc-6e14-4454-0158-08da5f2154df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8052

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBwYXRjaCBoYXMgYmVlbiBzdGFsZSBmb3IgbmVhcmx5
IDIgbW9udGhzLCB3aXRoIHRoZQ0KZmlyc3QgcGF0Y2ggaW4gc2VyaWVzIGFscmVhZHkgbWVyZ2Vk
IGFuZCBzb21lIGRpc2N1c3Npb25zIGJldHdlZW4NCm1haW50YWluZXJzIGFuZCBhdXRob3IgaW4g
dGhlIFBhdGNoICMyIHRocmVhZC4gU28gSSBhbSBzZW5kaW5nIHRoaXMNCmVtYWlsIGFzIGEgZ2Vu
dGxlIHJlbWluZGVyLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeSANCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSB4ODYvY3B1aWQ6IHNldCBNQ0RU
X05PIGZvciBub24tYWZmZWN0ZWQgbW9kZWxzDQo+IA0KPiBTb21lIENQVSBtb2RlbHMgZG9uJ3Qg
ZXhoaWJpdCBNQ0RUIGJlaGF2aW9yLCBidXQgYWxzbyBkb24ndCBleHBvc2UNCj4gTUNEVF9OTy4g
IFNldCB0aGUgTUNEVF9OTyBiaXQgZm9yIENQVXMga25vd24gdG8gbm90IGV4aGliaXQgdGhlDQo+
IGJlaGF2aW9yLCBzbyBndWVzdHMgY2FuIGdldCB0aGlzIGluZm9ybWF0aW9uLCBhcyB1c2luZw0K
PiBmYW1pbHkvbW9kZWwvc3RlcHBpbmcgZGV0ZWN0aW9uIHdoZW4gcnVubmluZyB2aXJ0dWFsaXpl
ZCBpcyBub3QgdG8gYmUNCj4gcmVsaWVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgeGVuL2FyY2gveDg2L2Nw
dS9pbnRlbC5jIHwgNzANCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgeGVuL2FyY2gveDg2L2NwdWlkLmMgICAgIHwgMTAgKysrKysrDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDgwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
Y3B1L2ludGVsLmMgYi94ZW4vYXJjaC94ODYvY3B1L2ludGVsLmMNCj4gaW5kZXggZGM2YTBjNzgw
Ny4uZDgyMWY0NjBhZSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9pbnRlbC5jDQo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYw0KPiBAQCAtNTE4LDYgKzUxOCw3MyBAQCBz
dGF0aWMgdm9pZCBpbnRlbF9sb2dfZnJlcShjb25zdCBzdHJ1Y3QgY3B1aW5mb194ODYNCj4gKmMp
DQo+ICAgICAgcHJpbnRrKCIldSBNSHpcbiIsIChmYWN0b3IgKiBtYXhfcmF0aW8gKyA1MCkgLyAx
MDApOw0KPiAgfQ0KPiANCj4gK3ZvaWQgdXBkYXRlX21jZHRfbm8oc3RydWN0IGNwdWluZm9feDg2
ICpjKQ0KPiArew0KPiArI2RlZmluZSBGQU02X01PREVMKG0sIHMsIGMpIHsgNiwgbSwgcywgYyB9
DQo+ICsgICAgLyoNCj4gKyAgICAgKiBMaXN0IG9mIG1vZGVscyB0aGF0IGRvIG5vdCBleGhpYml0
IE1DRFQgYmVoYXZpb3IsIGJ1dCBtaWdodCBub3QNCj4gKyAgICAgKiBhZHZlcnRpc2UgTUNEVF9O
TyBvbiBDUFVJRC4NCj4gKyAgICAgKi8NCj4gKyAgICBzdGF0aWMgY29uc3Qgc3RydWN0IHsNCj4g
KyAgICAgICAgdWludDhfdCBmYW1pbHk7DQo+ICsgICAgICAgIHVpbnQ4X3QgbW9kZWw7DQo+ICsg
ICAgICAgIHVpbnQ4X3Qgc3RlcHBpbmc7DQo+ICsgICAgICAgIGJvb2wgY2hlY2tfc3RlcHBpbmc7
DQo+ICsgICAgfSBtY2R0X25vW10gPSB7DQo+ICsgICAgICAgIC8qIEhhc3dlbGwgU2VydmVyIEVQ
LCBFUDRTLiAqLw0KPiArICAgICAgICBGQU02X01PREVMKDB4M2YsIDIsIHRydWUpLA0KPiArICAg
ICAgICAvKiBFbGtoYXJ0IExha2UuICovDQo+ICsgICAgICAgIEZBTTZfTU9ERUwoMHgzZiwgNCwg
dHJ1ZSksDQo+ICsgICAgICAgIC8qIENoZXJyeXZpZXcuICovDQo+ICsgICAgICAgIEZBTTZfTU9E
RUwoMHg0YywgMCwgZmFsc2UpLA0KPiArICAgICAgICAvKiBCcm9hZHdlbGwgU2VydmVyIEUsIEVQ
LCBFUDRTLCBFWC4gKi8NCj4gKyAgICAgICAgRkFNNl9NT0RFTCgweDRmLCAwLCBmYWxzZSksDQo+
ICsgICAgICAgIC8qIEJyb2Fkd2VsbCBERSBWMiwgVjMuICovDQo+ICsgICAgICAgIEZBTTZfTU9E
RUwoMHg1NiwgMywgdHJ1ZSksDQo+ICsgICAgICAgIC8qIEJyb2Fkd2VsbCBERSBZMC4gKi8NCj4g
KyAgICAgICAgRkFNNl9NT0RFTCgweDU2LCA0LCB0cnVlKSwNCj4gKyAgICAgICAgLyogQnJvYWR3
ZWxsIERFIEExLCBIZXdpdHQgTGFrZS4gKi8NCj4gKyAgICAgICAgRkFNNl9NT0RFTCgweDU2LCA1
LCB0cnVlKSwNCj4gKyAgICAgICAgLyogQW5uaWVkYWxlLiAqLw0KPiArICAgICAgICBGQU02X01P
REVMKDB4NWEsIDAsIGZhbHNlKSwNCj4gKyAgICAgICAgLyogQXBvbGxvIExha2UuICovDQo+ICsg
ICAgICAgIEZBTTZfTU9ERUwoMHg1YywgOSwgdHJ1ZSksDQo+ICsgICAgICAgIEZBTTZfTU9ERUwo
MHg1YywgMHhhLCB0cnVlKSwNCj4gKyAgICAgICAgLyogRGVudmVydG9uLiAqLw0KPiArICAgICAg
ICBGQU02X01PREVMKDB4NWYsIDEsIHRydWUpLA0KPiArICAgICAgICAvKiBYTU03MjcyLiAqLw0K
PiArICAgICAgICBGQU02X01PREVMKDB4NjUsIDAsIGZhbHNlKSwNCj4gKyAgICAgICAgLyogQ291
Z2FyIE1vdW50YWluLiAqLw0KPiArICAgICAgICBGQU02X01PREVMKDB4NmUsIDAsIGZhbHNlKSwN
Cj4gKyAgICAgICAgLyogQnV0dGVyLiAqLw0KPiArICAgICAgICBGQU02X01PREVMKDB4NzUsIDAs
IGZhbHNlKSwNCj4gKyAgICAgICAgLyogR2VtaW5pIExha2UuICovDQo+ICsgICAgICAgIEZBTTZf
TU9ERUwoMHg3YSwgMSwgdHJ1ZSksDQo+ICsgICAgICAgIEZBTTZfTU9ERUwoMHg3YSwgOCwgdHJ1
ZSksDQo+ICsgICAgICAgIC8qIFNub3dyaWRnZS4gKi8NCj4gKyAgICAgICAgRkFNNl9NT0RFTCgw
eDg2LCA0LCB0cnVlKSwNCj4gKyAgICAgICAgRkFNNl9NT0RFTCgweDg2LCA1LCB0cnVlKSwNCj4g
KyAgICAgICAgRkFNNl9NT0RFTCgweDg2LCA3LCB0cnVlKSwNCj4gKyAgICAgICAgLyogTGFrZWZp
ZWxkIEItc3RlcC4gKi8NCj4gKyAgICAgICAgRkFNNl9NT0RFTCgweDhhLCAxLCB0cnVlKSwNCj4g
KyAgICAgICAgLyogRWxraGFydCBMYWtlLiAqLw0KPiArICAgICAgICBGQU02X01PREVMKDB4OTYs
IDEsIHRydWUpLA0KPiArICAgICAgICAvKiBKYXNwZXIgTGFrZS4gKi8NCj4gKyAgICAgICAgRkFN
Nl9NT0RFTCgweDljLCAwLCB0cnVlKSwNCj4gKyAgICAgICAgeyB9DQo+ICsgICAgfTsNCj4gKyN1
bmRlZiBGQU02X01PREVMDQo+ICsgICAgY29uc3QgdHlwZW9mKG1jZHRfbm9bMF0pICptOw0KPiAr
DQo+ICsgICAgZm9yIChtID0gbWNkdF9ubzsgbS0+ZmFtaWx5IHwgbS0+bW9kZWwgfCBtLT5zdGVw
cGluZzsgbSsrKQ0KPiArICAgICAgICBpZiAoIGMtPng4NiA9PSBtLT5mYW1pbHkgJiYgYy0+eDg2
X21vZGVsID09IG0tPm1vZGVsICYmDQo+ICsgICAgICAgICAgICAgKCFtLT5jaGVja19zdGVwcGlu
ZyB8fCBjLT54ODZfbWFzayA9PSBtLT5zdGVwcGluZykgKQ0KPiArICAgICAgICB7DQo+ICsgICAg
ICAgICAgICBfX3NldF9iaXQoWDg2X0ZFQVRVUkVfTUNEVF9OTywgYy0+eDg2X2NhcGFiaWxpdHkp
Ow0KPiArICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIH0NCj4gK30NCj4gKw0KPiAgc3Rh
dGljIHZvaWQgY2ZfY2hlY2sgaW5pdF9pbnRlbChzdHJ1Y3QgY3B1aW5mb194ODYgKmMpDQo+ICB7
DQo+ICAJLyogRGV0ZWN0IHRoZSBleHRlbmRlZCB0b3BvbG9neSBpbmZvcm1hdGlvbiBpZiBhdmFp
bGFibGUgKi8NCj4gQEAgLTU1Niw2ICs2MjMsOSBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBpbml0
X2ludGVsKHN0cnVjdCBjcHVpbmZvX3g4NiAqYykNCj4gIAlpZiAoKG9wdF9jcHVfaW5mbyAmJiAh
KGMtPmFwaWNpZCAmIChjLT54ODZfbnVtX3NpYmxpbmdzIC0gMSkpKSB8fA0KPiAgCSAgICBjID09
ICZib290X2NwdV9kYXRhICkNCj4gIAkJaW50ZWxfbG9nX2ZyZXEoYyk7DQo+ICsNCj4gKwlpZiAo
IWNwdV9oYXMoYywgWDg2X0ZFQVRVUkVfTUNEVF9OTykpDQo+ICsJCXVwZGF0ZV9tY2R0X25vKGMp
Ow0KPiAgfQ0KPiANCj4gIGNvbnN0IHN0cnVjdCBjcHVfZGV2IGludGVsX2NwdV9kZXYgPSB7DQo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1aWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5j
DQo+IGluZGV4IDY2YmUxYTgwMTUuLmNhMmVkNDQxNDkgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9jcHVpZC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jDQo+IEBAIC0zNjAsNiAr
MzYwLDE2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfaG9zdF9wb2xpY3kodm9pZCkN
Cj4gDQo+ICAgICAgcC0+YmFzaWMubWF4X2xlYWYgPQ0KPiAgICAgICAgICBtaW5fdCh1aW50MzJf
dCwgcC0+YmFzaWMubWF4X2xlYWYsICAgQVJSQVlfU0laRShwLT5iYXNpYy5yYXcpIC0gMSk7DQo+
ICsNCj4gKyAgICAvKg0KPiArICAgICAqIEZvciBJbnRlbCBoYXJkd2FyZSBNQ0RUX05PIG1pZ2h0
IGJlIHNldCBieSBYZW4gZm9yIG1vZGVscyB0aGF0IGRvbid0DQo+ICsgICAgICogZXhoaWJpdCBN
Q0RUIGJlaGF2aW9yIGJ1dCBhbHNvIGRvbid0IGhhdmUgdGhlIE1DRFRfTk8gYml0IHNldCBpbg0K
PiArICAgICAqIENQVUlELiAgRXh0ZW5kIGZlYXQubWF4X3N1YmxlYWYgYmV5b25kIHdoYXQgaGFy
ZHdhcmUgc3VwcG9ydHMgdG8NCj4gaW5jbHVkZQ0KPiArICAgICAqIHRoZSBmZWF0dXJlIGxlYWYg
Y29udGFpbmluZyB0aGlzIGluZm9ybWF0aW9uLg0KPiArICAgICAqLw0KPiArICAgIGlmICggYm9v
dF9jcHVfaGFzKFg4Nl9GRUFUVVJFX01DRFRfTk8pICkNCj4gKyAgICAgICAgcC0+ZmVhdC5tYXhf
c3VibGVhZiA9IG1heChwLT5mZWF0Lm1heF9zdWJsZWFmLCAydSk7DQo+ICsNCj4gICAgICBwLT5m
ZWF0Lm1heF9zdWJsZWFmID0NCj4gICAgICAgICAgbWluX3QodWludDMyX3QsIHAtPmZlYXQubWF4
X3N1YmxlYWYsIEFSUkFZX1NJWkUocC0+ZmVhdC5yYXcpIC0gMSk7DQo+IA0KPiAtLQ0KPiAyLjM2
LjANCj4gDQoNCg==

