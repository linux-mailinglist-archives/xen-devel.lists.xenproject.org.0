Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EE60AAD1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 15:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429151.680012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxh1-0002ve-Q9; Mon, 24 Oct 2022 13:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429151.680012; Mon, 24 Oct 2022 13:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxh1-0002tf-N9; Mon, 24 Oct 2022 13:40:39 +0000
Received: by outflank-mailman (input) for mailman id 429151;
 Mon, 24 Oct 2022 13:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NhUR=2Z=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1omxh0-0002tY-7t
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 13:40:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70696bf9-53a1-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 15:40:37 +0200 (CEST)
Received: from DB6PR0801CA0043.eurprd08.prod.outlook.com (2603:10a6:4:2b::11)
 by AS8PR08MB6616.eurprd08.prod.outlook.com (2603:10a6:20b:319::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 13:40:31 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::3e) by DB6PR0801CA0043.outlook.office365.com
 (2603:10a6:4:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.25 via Frontend
 Transport; Mon, 24 Oct 2022 13:40:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 24 Oct 2022 13:40:31 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Mon, 24 Oct 2022 13:40:31 +0000
Received: from ca38d9adef7c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57D24602-DA1E-46AB-BFFC-3341383A3C9D.1; 
 Mon, 24 Oct 2022 13:40:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca38d9adef7c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Oct 2022 13:40:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB8270.eurprd08.prod.outlook.com (2603:10a6:150:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 13:40:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 13:40:21 +0000
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
X-Inumbo-ID: 70696bf9-53a1-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DzNxL7qpTU84HtqNhZlDhv31qd1Ma1QCbO59aMN2tz6raIwKy+m1kKZ8Sd4/uDS32mCHN/NIVKs1UJAlUuZdEcMitpx958mS+4gisSdsz+9K9d521CWTnN/b98wZXRUeCOOdQ16dsqyC2sm9hVgTDrQUFDdqFOmIPhAU3rhj4UJ7NBbC81JXXlG6zMMqTM8rraqY7FIsyAFESTAIEBiu6FgmPF71z75vgeCBwPhHKL292Ra6QBhB0QgACdxYlIFVawcRMz3HINUVnKLIidi2zPGN49vaElXZqYIHWXDH96Fcc5NvzDZDP5QoopbfPu75ySZruM8c7keLEqLX3HNgig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0ItPbOspEdCHok4Ih/WxAAsJ2IOsyYpmPSTWbnXDn0=;
 b=EqqrJ0t90/qvNmT7U1lnaoUfXSG5gf6N3aNWPUxdYQu39DzqQ+YUDy+XdLfYxrpcnza+qrLStevLg49L5GMkXTIiyrw1jAy1nPW9vL6vO1Tcx5CScFN5/Fml+oVJ+MFir1GS2V6iNcREktoSwNds7ArE1dJ7DOeWqDxANfeiLpsnpQaao4kSVYIQ1tCmF+YHNacBxKLbdM+3jdisJ2GAiX4iqXueNqzFZbpZ7Ls1hf05XkVnlKwfVLyL7qN6Z2UGuWjwWv/TWCQFHbYDspTyZ1sGsNJ/IVM8TL9IhgO2/7CvhLgQ4sfZvYtvhlgS0jDYoCCC8I6BwiNLv6yELk0VyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0ItPbOspEdCHok4Ih/WxAAsJ2IOsyYpmPSTWbnXDn0=;
 b=eUrecez72lZY35RvP14xJJ/33zcauKjOobWdLRjHL73kDYtMoeCJZmU2Kv2+WrtIYftGKLLmVdLBI5yEHZDzwEQ+Tj6Wr4flqbPM9FlBHLlAAy9o5DHBgqBr/Gn4LwJe66/ObrYQjRAEU0ly/TDn2r9EbDecTf2cD/UG9R3Aj34=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTQVexDiI0On6rS/t/6HYxLGGW5ZOwVdw8ma8ne2hdCKzgxk2STy3EBO1cRAXuRuyv/2elipJTG4YpLeYz2ub2lACEClo0Xxf3WlUTVWsemdE35WIMkb8QxZJSRPKS5PWMlQeH3KL5XOssrQOMQo1ZnyQ6PwgPCdpm5hQUIh2pIhMify2mNINcNAODJu4iygLI6Qe9sCDEo53Dv5i8VwSLSjDZIxsxvd4JUTr5BXGVF0wM+JXwkANd1uAAmb6Un08KGdQ9qYYw6ulXeDveJ8OUm12MACd6QPcCWqYE89QR1XI8F38LZqHGKIsmzm2VqGdNo3+wBZ1bVtq3r/sU1d5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0ItPbOspEdCHok4Ih/WxAAsJ2IOsyYpmPSTWbnXDn0=;
 b=A8V6dXkzKiZg/dTFnxI2asWPThzJsQIPdb57CmRwWCUBa30oewrrL/+7dwDwJBcyBMCIp8jUcM6SI51rOJds54Gok+ZvCozJ7s7tZE81+nHHyFH1eQZL72JNplJB1zQ/w9nGEdyTvpXNZ1Dfk7ZEdKcA5UxoglrLhTUVQQNdzJBAEfm0+69lqigqhDivd19Nr5LopR6sD4DRHVjYCzpHUyr55TznGMkiCPFRtgwxIBcP2vqFaHU3p4h72ZEawZSBsIlblH0rO9mIz1zX49TFkU9AGB8L+fBT32BBQc+Ciuj8aCyUW6KmBI6dMV5HKB9mdVylO7cCvMF4mLz52u7bFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0ItPbOspEdCHok4Ih/WxAAsJ2IOsyYpmPSTWbnXDn0=;
 b=eUrecez72lZY35RvP14xJJ/33zcauKjOobWdLRjHL73kDYtMoeCJZmU2Kv2+WrtIYftGKLLmVdLBI5yEHZDzwEQ+Tj6Wr4flqbPM9FlBHLlAAy9o5DHBgqBr/Gn4LwJe66/ObrYQjRAEU0ly/TDn2r9EbDecTf2cD/UG9R3Aj34=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH][4.17] x86/shadow: drop (replace) bogus assertions
Thread-Topic: [PATCH][4.17] x86/shadow: drop (replace) bogus assertions
Thread-Index: AQHY36n+iILu5HD1FUmlvrXgbBOgba4NsKGAgA/rWACAAADm4A==
Date: Mon, 24 Oct 2022 13:40:21 +0000
Message-ID:
 <AS8PR08MB7991B0BEB04D02AB91BAA3BD922E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <e447da22-23d6-d3db-313d-4e4ca009c3df@suse.com>
 <Y0k6RSI0VJhTVmEi@Air-de-Roger>
 <a49e42d4-90e0-8f8f-f0fa-f199d39c171d@suse.com>
In-Reply-To: <a49e42d4-90e0-8f8f-f0fa-f199d39c171d@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5260DD7CD4B1394289A6C36D187A060B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB8270:EE_|DBAEUR03FT018:EE_|AS8PR08MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 97222271-2a22-4eb1-5373-08dab5c551cb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Fjh7ElhJPKn5EAcyzLcC0Ar5stcFZzqeUkWZ+qTtHCl5M3cg3sI+tCqz9sM1OKGYXzVq/SxC06U5xIjAHiA21zmZB+KhPaLBbdNSv8q9qDhvsBglA2IyDbzaGep2vK78LHiWxleInATbFzSaSgdgA4+vcU0I3MTjo5qaRZVLpx9INx8cweNNR6+yl2U2hNFQpQVK8rB8NJc4elRyD0kP0YffbrwZfhDWVpl1dDdgNrzY0JVoTFL7945B3638nv5FaqhA9KryT5upS9MWBpGgXfS4mg8Qf+41pU4DS0PcA9fSy4rrW7zlXk3mAXmL7/3AGZLtmEXrPeEwt5+KTBGdwR0NJZ3iD9nnRCVvC1c3NYwxK8u/9c9ybqjq78BD7I3mwGVm1HWllQLmhckdklbGUExgo8WU1HiIAl09C7VdwvPK5niWQVIxpn97Sh4Io53xxHoLpzyB5Eka3K5AQhF0AtucGVUuG3R5KdQFciVy+NfQ89hi+FzIDcV4U3pKVVdS+LRwoHSwLqC/HM0GXY/C2bFe2IRp2cuqOo7VnZ4XDszJCUQoTXJNaSLxTxZDllHmlWkAyyShVMk8BPorgzGiYtO4hOjHzoRDNxols8lRkeNi8a5OHsh6HTN4SzWSxGyppBjhBiIDSjffQNvB7LHsaUhA32F753nPiIGGrGjXG40bvr6mipXf/k2YfSIulobikGoxZL1C2HFYgG8m79YHIpv7snuUxCPxgqZjfu8zqVi1vuFH3YLWIEP96mAH2JkdtV8z0p30NLiJ7fvjk3537Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199015)(66476007)(66446008)(66946007)(8676002)(66556008)(4326008)(33656002)(64756008)(6916009)(54906003)(76116006)(41300700001)(86362001)(2906002)(316002)(83380400001)(9686003)(478600001)(186003)(6506007)(55016003)(38070700005)(122000001)(71200400001)(53546011)(26005)(38100700002)(7696005)(8936002)(52536014)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8270
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	32fe857c-d930-461b-c6fc-08dab5c54c34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ltTubmh5WxW3XcZ5x61XtZ9JH62xxzWtZNI2LRoQyQU1QWb073xEyjk5GtXfG20piv2DWX2eSq9ey1IqL5ZjfFDF/3MjcsxR18GagQqP4oqCYJ3N3dr11OTDBvbUClLaufTmTzDsh8Hi3OpRCa98CVl+sg+cpSgAWkvmilUEMt8f1XWJDPg6xrytdEe0/tXdeeQd9XAZkF5o0GPJFQc6VSj4ivsndhpyA2wYLexGLHIxvMyrTnkZUg2YdxDBPpQLDspriYT7xN0+2A1OcLpgHIU1fNw3TlkVdhmaZyZisWW3EgyIzZCWc7sN4lZBp8NDIya/doaztHtqLHg1AeHVp8Qu0fPb4KPiE2SDwN+Gymu9KLAQSNOqnpfqpK1qNy4e3U7SkRht1bkhyDa76v44I/qqunrCGyQws/5ZSM5uOrZfAm1stiCVwqX9mEoGXMZ2zKSWAyZso0jqBnocegBl9KUX+gkhOB6JChtUodEgp4VHbXI7oLtmiCIJHxOi9F9GDJQIJ+wbuzMw7ZDEjonFTA100r7zWxXVco7oAg2tLixNdlQ8Ond6v400FYn0OEiSNaXu5xnfRnm1D0/Al4q592D/OetnUzbCdWq8dcEV5zfy8o8nbOl4PNpwDNsTD5pM4aWINM1lI8Z1l9tHT3YGnYjDb/RxvqevUz+/VixsnoN+lsRJnjVsCD+ftjiUV+BeAaapoPdnz3v3SX+PeCIR3/YT1HzGJxMU+2+2xfYgx2xGEbs4bWRBDbBhdp2gklkDH/roK6goNek1XPYMRTYVHg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(70586007)(70206006)(8676002)(40460700003)(86362001)(6862004)(4326008)(54906003)(316002)(8936002)(5660300002)(52536014)(33656002)(83380400001)(40480700001)(53546011)(41300700001)(55016003)(81166007)(356005)(82310400005)(26005)(82740400003)(107886003)(7696005)(478600001)(6506007)(186003)(336012)(47076005)(36860700001)(9686003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 13:40:31.1810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97222271-2a22-4eb1-5373-08dab5c551cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6616

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF1bNC4xN10geDg2
L3NoYWRvdzogZHJvcCAocmVwbGFjZSkgYm9ndXMgYXNzZXJ0aW9ucw0KPiANCj4gT24gMTQuMTAu
MjAyMiAxMjozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gPiBPbiBGcmksIE9jdCAxNCwg
MjAyMiBhdCAxMDo0OTo1NUFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4gVGhlIGFk
ZGl0aW9uIG9mIGEgY2FsbCB0byBzaGFkb3dfYmxvd190YWJsZXMoKSBmcm9tIHNoYWRvd190ZWFy
ZG93bigpDQo+ID4+IGhhcyByZXN1bHRlZCBpbiB0aGUgIm5vIHZjcHVzIiByZWxhdGVkIGFzc2Vy
dGlvbiBiZWNvbWluZyB0cmlnZ2VyYWJsZToNCj4gPj4gSWYgZG9tYWluX2NyZWF0ZSgpIGZhaWxz
IHdpdGggYXQgbGVhc3Qgb25lIHBhZ2Ugc3VjY2Vzc2Z1bGx5IGFsbG9jYXRlZA0KPiA+PiBpbiB0
aGUgY291cnNlIG9mIHNoYWRvd19lbmFibGUoKSwgb3IgaWYgZG9tYWluX2NyZWF0ZSgpIHN1Y2Nl
ZWRzIGFuZA0KPiA+PiB0aGUgZG9tYWluIGlzIHRoZW4ga2lsbGVkIHdpdGhvdXQgZXZlciBpbnZv
a2luZyBYRU5fRE9NQ1RMX21heF92Y3B1cy4NCj4gPj4NCj4gPj4gVGhlIGFzc2VydGlvbidzIGNv
bW1lbnQgd2FzIGJvZ3VzIGFueXdheTogU2hhZG93IG1vZGUgaGFzIGJlZW4NCj4gZ2V0dGluZw0K
PiA+PiBlbmFibGVkIGJlZm9yZSBhbGxvY2F0aW9uIG9mIHZDUFUtcyBmb3IgcXVpdGUgc29tZSB0
aW1lLiBDb252ZXJ0IHRoZQ0KPiA+PiBhc3NlcnRpb24gdG8gYSBjb25kaXRpb25hbDogQXMgbG9u
ZyBhcyB0aGVyZSBhcmUgbm8gdkNQVS1zLCB0aGVyZSdzDQo+ID4+IG5vdGhpbmcgdG8gYmxvdyBh
d2F5Lg0KPiA+Pg0KPiA+PiBGaXhlczogZTdhYTU1YzBhYWIzICgieDg2L3AybTogZnJlZSB0aGUg
cGFnaW5nIG1lbW9yeSBwb29sDQo+IHByZWVtcHRpdmVseSIpDQo+ID4+IFJlcG9ydGVkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiA+Pg0KPiA+PiBBIHNp
bWlsYXIgYXNzZXJ0aW9uL2NvbW1lbnQgcGFpciBleGlzdHMgaW4gX3NoYWRvd19wcmVhbGxvYygp
OyB0aGUNCj4gPj4gY29tbWVudCBpcyBzaW1pbGFybHkgYm9ndXMsIGFuZCB0aGUgYXNzZXJ0aW9u
IGNvdWxkIGluIHByaW5jaXBsZSB0cmlnZ2VyDQo+ID4+IGUuZy4gd2hlbiBzaGFkb3dfYWxsb2Nf
cDJtX3BhZ2UoKSBpcyBjYWxsZWQgZWFybHkgZW5vdWdoLiBSZXBsYWNlDQo+IHRob3NlDQo+ID4+
IGF0IHRoZSBzYW1lIHRpbWUgYnkgYSBzaW1pbGFyIGVhcmx5IHJldHVybiwgaGVyZSBpbmRpY2F0
aW5nIGZhaWx1cmUgdG8NCj4gPj4gdGhlIGNhbGxlciAod2hpY2ggd2lsbCBnZW5lcmFsbHkgbGVh
ZCB0byB0aGUgZG9tYWluIGJlaW5nIGNyYXNoZWQgaW4NCj4gPj4gc2hhZG93X3ByZWFsbG9jKCkp
Lg0KPiA+DQo+ID4gSXQncyBteSB1bmRlcnN0YW5kaW5nIHdlIGRvIGNhcmUgYWJvdXQgdGhpcyBi
ZWNhdXNlIGEgY29udHJvbCBkb21haW4NCj4gPiBjb3VsZCB0cnkgdG8gcG9wdWxhdGUgdGhlIHAy
bSBiZWZvcmUgY2FsbGluZyBYRU5fRE9NQ1RMX21heF92Y3B1cywNCj4gYW5kDQo+ID4gaGVuY2Ug
Y291bGQgdHJpZ2dlciB0aGUgQVNTRVJULCBhcyBvdGhlcndpc2UgYXNzZXJ0aW5nIHdvdWxkIGJl
IGZpbmUuDQo+ID4NCj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPiA+DQo+ID4gQWNrZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPiANCj4gSW4gYSBkaXNjdXNzaW9uIGFtb25nc3QgbWFpbnRhaW5lcnMgd2Un
dmUgc2V0dGxlZCBBbmRyZXcncyByZXNlcnZhdGlvbnMuDQo+IE1heSBJIHBsZWFzZSBhc2sgZm9y
IGEgcmVsZWFzZS1hY2sgZm9yIHRoaXMgY2hhbmdlLCBzbyBpdCBjYW4gZ28gaW4gKGFzDQo+IGEg
YnVnIGZpeCBvbiB0b3Agb2YgdGhlIHJlY2VudCBiYXRjaCBvZiBYU0FzKT8NCg0KQWJzb2x1dGVs
eS4gVGhhbmtzIGZvciBub3RpY2luZy4NCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8
SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBUaGFu
a3MsIEphbg0K

